#if 0
/*  20180511 Build
start 00008080 end 0000816d length   237 segment .const
start 00008183 end 00009ddc length  7257 segment .text
start 00008000 end 00008080 length   128 segment .const

@svlreg keywork required !!!!!!!!!!
@svlreg INTERRUPT_HANDLER(TIM2_CAP_COM_IRQHandler, 14)
@svlreg INTERRUPT_HANDLER(TIM4_UPD_OVF_IRQHandler, 23)
*/

#include "stm8s.h"
#include "stm8s_clk.h"
#include "stm8s_tim2.h"

#define _MOTOR_WATCH_

#define _LED_PORT 		GPIOA		
#define _LED_PIN 		GPIO_PIN_2

#define _X1_PORT 		GPIOC
#define _X1_PIN  		GPIO_PIN_6
#define _X2_PORT 		GPIOC
#define _X2_PIN  		GPIO_PIN_7
#define _Y1_PORT 		GPIOC
#define _Y1_PIN  		GPIO_PIN_3
#define _Y2_PORT 		GPIOA
#define _Y2_PIN  		GPIO_PIN_3

#define _ORG_PORT 		GPIOB
#define _ORG_PIN  		GPIO_PIN_4

#define TRUE 			(1u)
#define FALSE 			(0u)
#define ENABLED			(1u)
#define OVERRUN     	(300u)	// Pulse, Zero position overrun
#define HALL_THRESHOLD 	(40u)	// hall IC threshold
#define OVER_STEP  		(30u)

#define VALVE_TIMEOUT_S (300u)	// sec
#define MAX_ADC			(3u)

#define TIME_POWERDELAY	499u
#define OFFSET_OVERRUN	0u

typedef enum { nMotorClose, nMotorOpen } MOTOR_DIR;

u16 tt;
u8 dutyBuffer[64];
u8 iDuty;
u16 sDuty;
u8 nDuty = 0u;
u16 mDuty;

volatile uint8_t Ticks_50uS;
volatile uint16_t Ticks_1mS;
u16 ledint = 500u;

//   10v to 26V
//u8 TableInterval[17] = { 65,56,50,45,40, 	36,32,29,26,23, 	21,19,17,16,15, 	14,13 };

struct {
	uint8_t Enabled 		: 1;
	uint8_t Run 				;//: 1;
	uint8_t Run0				: 1;
	uint8_t LastOrigin 	: 1; 
	uint8_t Dir					: 1;
	uint8_t Origin 		;//	:1;
	uint8_t NormalOpen	:1;
	
	uint16_t Position;			// Current position (pulse)
	uint16_t Target;			// Target Position  (pulse)
	uint16_t Overrun;			// Origin cal overrun (pulse)
	uint8_t Overrun2;			// Valve hysteresis calibration overrun 
	uint16_t ZeroOffset;
	uint8_t Phase;				// motor coil phase
	uint16_t  MaxOverrun;	
	uint16_t  ORGPosition;		// Hall IC origin position
	
	//uint16_t Interval ;			// Drive interval (mS)
	uint8_t Interval ;			// Drive interval (mS)
	//uint16_t Ticks;				
	uint8_t Ticks;				
	uint16_t Timeout_1S;		// Drive Timeout 
	
	uint8_t	MotorRun;
	
	u8 Step;
	u8 PreStep;
	u8 Stage;
} Drive;

struct {
	u16 T1_1mS;	
	u16 T2_1mS;
	u8 Edge	: 	1;
	uint8_t Calc;
	u16 T10;	
	u16 T20;
	u16 T1;
	u16 T2;
	u16 Duty;
	u16 Count;
} Pwm;

struct {
	u16 Value[MAX_ADC];
	u8 Idx;
	u8 IAvg[MAX_ADC];
	u8 IdxAvg;
#if defined (_ADC_SUM_)
	u8 Average;
	u16 Sum;
#endif
} Adc;

struct {
	u16 Led;
	u16 Motor;
	u16 Adc;
	u16 PwmUpdate;
} Timer;

uint16_t PowerDelay_1mS = TIME_POWERDELAY;

#if defined (_MOTOR_WATCH_)
u16 mStep[32]; 	// buffer for watching 
u8 iStep;
#endif

#define TIMER_EDGE_SET(mode)	TIM2_ICInit( TIM2_CHANNEL_1,\
		mode==0 ? TIM2_ICPOLARITY_FALLING : TIM2_ICPOLARITY_RISING,\
		TIM2_ICSELECTION_DIRECTTI, TIM2_ICPSC_DIV8, 0x0);

#define WAIT_IF_RUN			while(Drive.Run); 
#define WAIT_50ms(t)		while(Diff(t, 50u)==0);

#define MotorOrigin()		GPIO_ReadInputPin(_ORG_PORT, _ORG_PIN);
#define LightOn				GPIO_WriteLow(_LED_PORT, _LED_PIN);
#define LightOff			GPIO_WriteHigh(_LED_PORT, _LED_PIN);
#define LightToggle 		GPIO_WriteReverse(_LED_PORT, _LED_PIN);			

#define RANGE_FROM_TO(i,min,max)	if(i < min) i = min; if(i > max) i = max; 

#define TYPE_1Phase			0
#define TYPE_12Phase		1
#define TYPE_2Phase			2
#define EXCITATION_TYPE		TYPE_12Phase

#define _H_X1				GPIO_WriteHigh(_X1_PORT, _X1_PIN);	
#define _H_X2				GPIO_WriteHigh(_X2_PORT, _X2_PIN);	
#define _H_Y1				GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);	
#define _H_Y2				GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	

#define _L_X1				GPIO_WriteLow(_X1_PORT, _X1_PIN);	
#define _L_X2				GPIO_WriteLow(_X2_PORT, _X2_PIN);	
#define _L_Y1				GPIO_WriteLow(_Y1_PORT, _Y1_PIN);	
#define _L_Y2				GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	

void	phase_excite(uint8_t phase)
{
	if ( !Drive.Run || !Drive.Enabled ) return;
	switch(phase)
	{
#if (EXCITATION_TYPE == TYPE_2Phase)
		case 0: case 1: _H_X1 _L_X2 _H_Y1 _L_Y2 break;		
		case 2: case 3: _L_X1 _H_X2 _H_Y1 _L_Y2 break;
		case 4: case 5: _L_X1 _H_X2 _L_Y1 _H_Y2 break;
		case 6: case 7: _H_X1 _L_X2 _L_Y1 _H_Y2 break;
}
#endif
#if (EXCITATION_TYPE == TYPE_12Phase)
		case 0: _H_X1 _L_X2 _H_Y1 _L_Y2 break;
		case 1: _L_X1 _L_X2 _H_Y1 _L_Y2 break;		
		case 2: _L_X1 _H_X2 _H_Y1 _L_Y2 break;
		case 3: _L_X1 _H_X2 _L_Y1 _L_Y2 break;
		case 4: _L_X1 _H_X2 _L_Y1 _H_Y2 break;
		case 5: _L_X1 _L_X2 _L_Y1 _H_Y2 break;
		case 6: _H_X1 _L_X2 _L_Y1 _H_Y2 break;
		case 7: _H_X1 _L_X2 _L_Y1 _L_Y2 break;
#endif
#if (EXCITATION_TYPE == TYPE_1Phase)
		case 0: case 1: _H_X1 _L_X2 _L_Y1 _L_Y2 break;
		case 2: case 3: _L_X1 _L_X2 _H_Y1 _L_Y2 break;
		case 4: case 5: _L_X1 _H_X2 _L_Y1 _L_Y2 break;
		case 6: case 7: _L_X1 _L_X2 _L_Y1 _H_Y2 break;
#endif
	}
}

uint16_t CPulse( u8 step )
{
	return (uint16_t)((uint32_t) step *(26UL));  // 20180509  change to 5200 pulse
}

u8  Diff(uint16_t time, uint16_t diff)				
{
	uint16_t _t = time<=Ticks_1mS ? Ticks_1mS - time : 0xffff - time + Ticks_1mS;
	return _t > diff ? 1u : 0u;
}

uint16_t	stepPrepare(uint8_t i)
{
	sDuty -= dutyBuffer[i];
	dutyBuffer[i] = Pwm.Duty;
	sDuty += dutyBuffer[i];
	return sDuty;
}

uint8_t	stepCalc(uint16_t sDuty)
{
	uint16_t mVal;
	
	if ( nDuty < 16 )
		nDuty ++;
	mDuty = (sDuty / nDuty) * 2 + 1;	
	mDuty /= 2;
	RANGE_FROM_TO(mDuty, 20, 180)
						 
	mVal  =  (625u * mDuty)/10u -1250u;		//  y  = 6.25 x - 1.25  20,0  to  180, 200
	mVal = (mVal / 25u + 1 ) /	2u;
	return (uint8_t)mVal ;
}

void	waitPowerDelay(void)
{
	LightOn
	while ( Ticks_1mS < PowerDelay_1mS )
		;
	LightOff
}

void StartDriveOR( uint16_t Target, uint8_t overrun )
{
#if defined (_MOTOR_WATCH_)
	mStep[iStep] = Target;
	iStep = (iStep + 1)  % 32u;
	mStep[iStep] = 0;
#endif	
	
	if ( Drive.Run || (Drive.Position==Target) ) return;
	if ( Target == 0 )				//  goto origin
	{
		Drive.ZeroOffset = CPulse( OVER_STEP );
		Drive.Position += Drive.ZeroOffset;   	// POSITION;
		Drive.Overrun =	Drive.Target = 0u;
		Drive.Dir = nMotorClose;
	}
	else	
	{
		if (Drive.Position >= Target)	// Closing
		{
			Drive.Overrun =	Drive.Overrun2 = 0u;
			Drive.Dir = nMotorClose;
		}
		else	// Opening
		{
			Drive.Overrun2 = overrun;
			Drive.Dir = nMotorOpen;
		}
		Drive.Target = Target + Drive.Overrun2;
	}
	Drive.Run = TRUE;
	Drive.Ticks = Drive.Interval;
}

u8	ZeroPos(void)
{
	if( Drive.Run != 0 )
		return 0;
	if( Drive.Origin == 1 )
		return 1;

	StartDriveOR(0u, OFFSET_OVERRUN);	// Goto Zero position
	return 0;
}

void	LightControl(uint16_t t)
{
	if ( Diff (Timer.Led, ledint) == 0 )
		return;
	Timer.Led = t;
	LightToggle
	//	ledint = Drive.Run==1 ? 500u : 250u;
}

void MotorService(uint8_t step)
{
	if ( step > 205u ) step = 205u;
	if ( step < 20u ) step = 0u;
	StartDriveOR( CPulse(step), OFFSET_OVERRUN );
	Timer.Motor = Ticks_1mS;
}

void StopDrive(void)
{
	_L_X1 _L_X2 _L_Y1 _L_Y2
	Drive.Run = FALSE;
}

void MotorStep(MOTOR_DIR Dir);
void MotorClose(void);
void DriveService(void)
{
	if ( !Drive.Run ) 
	{
		StopDrive();
		return;
	}
	if ( Drive.Target > Drive.Position )
	{
	 	MotorStep(nMotorOpen);
		return;
	}
	if ( Drive.Target < Drive.Position )
	{
		MotorClose( );
		return;
	}
	if ( Drive.Target ) 	// on target position
	{
		if ( Drive.Overrun2 )
		{				
			Drive.Target = Drive.Target - Drive.Overrun2;	//   OVERRUN2;	//100;		
			Drive.Overrun2 = 0u;
			return;
		}
	}
	// Origin Error, Drive.Enabled = FALSE; ???
	Drive.ZeroOffset = Drive.Overrun = 0u;
	StopDrive();	
}

void AdcService(void)
{
	if ( Diff ( Timer.Adc, 10u )!= 1 )
		return;
#if defined (_ADC_SUM_)
	Adc.Sum = Adc.Sum - Adc.IAvg[Adc.IdxAvg];
	Adc.IAvg[Adc.IdxAvg] = Adc.Value[0]>>2 ;
	Adc.Sum = Adc.Sum + Adc.IAvg[Adc.IdxAvg];
	Adc.Average = Adc.Sum / 5;
#else
	Adc.IAvg[Adc.IdxAvg] = Adc.Value[0]>>2 ;
#endif
	Adc.IdxAvg = (Adc.IdxAvg + 1) % 4; 
	Timer.Adc = Ticks_1mS;
}



void	MotorStepPhase(uint8_t dir)
{
	uint8_t offset = 0;
	if( dir == 1 )
	{
		Drive.Position--;
		offset = Drive.NormalOpen ? 1 : -1;
	}
	else
	{
		Drive.Position++;
		offset = Drive.NormalOpen ? -1 : 1;
	}	
	Drive.Phase += offset;
}

void	MotorStepSetOverrun(void)
{
	Drive.MaxOverrun  = Drive.ORGPosition - HALL_THRESHOLD;	
	if ( Drive.MaxOverrun > OVERRUN )
		Drive.MaxOverrun = OVERRUN;				
}

void MotorStep(MOTOR_DIR Dir)
{
	if ( Dir == nMotorClose )
	{
		if ( Drive.Position != 0 ) 
			MotorStepPhase(1);

		if ( Drive.Position == 0 ) 
		{
			Drive.Overrun = Drive.ZeroOffset = Drive.Position = Drive.Target = 0u;
			StopDrive();	
		}
	}
	else
	{
		// Find hall ic position
		MotorStepPhase(0);
				
		if ( Drive.Origin ) 
		{			
			Drive.ORGPosition = Drive.Position;
			Drive.LastOrigin = TRUE;
		}
		else
		{
			if ( Drive.LastOrigin )
				MotorStepSetOverrun();
		}
	}
	phase_excite(Drive.Phase%8);
}

void MotorClose(void)
{
	if ( !Drive.Origin )   		// Hall IC Sensing 
	{	
		MotorStep(nMotorClose);
		return;
	}
	if ( Drive.Overrun >= Drive.MaxOverrun )
	{
		Drive.Target = Drive.Position = Drive.Overrun = Drive.ZeroOffset = 0u;
		StopDrive();
		return;
	}
	Drive.Overrun++;
	MotorStep(nMotorClose);
}

void Clock_Config(void)
{
	CLK_DeInit();
	CLK_HSICmd(ENABLE);
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 
}

void Gpio_Config(void)
{
  	GPIO_Init(_LED_PORT, _LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
  	GPIO_Init(_ORG_PORT, _ORG_PIN, GPIO_MODE_IN_FL_NO_IT);
		
	GPIO_Init(_X1_PORT, _X1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(_X2_PORT, _X2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(_Y1_PORT, _Y1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(_Y2_PORT, _Y2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	StopDrive();
		
	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT );
	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
	GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT );
}

OnTimer_1S(void) {}

uint8_t	_chan[] = { ADC1_CHANNEL_3, ADC1_CHANNEL_4, ADC1_CHANNEL_2 };
uint8_t	_chanSchmit[] = { ADC1_SCHMITTTRIG_CHANNEL3 , ADC1_SCHMITTTRIG_CHANNEL4 , ADC1_SCHMITTTRIG_CHANNEL2 };
uint8_t	_chanId[] = { 1, 2, 0 };

static void Adc_Config( void )
{
	Adc.Value[Adc.Idx] = ADC1_GetConversionValue();
	ADC1_DeInit();
	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, 
		_chan[Adc.Idx], 
		ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, 
		_chanSchmit[Adc.Idx],
	   	DISABLE
		);
	Adc.Idx = _chanId[Adc.Idx];
	ADC1_StartConversion();		
}

void OnTimer4(void)
{
	//Adc_Config();
	//Drive.Origin = !MotorOrigin();
	
	Ticks_50uS++;
	if( Ticks_50uS >= 20 )
	{
		Ticks_50uS = 0;
		Ticks_1mS++;
	}

	if( Drive.Ticks )
		Drive.Ticks--;
	else 
	{
		Drive.MotorRun = 1;
//		if ( Drive.Enabled ) 	// &&  ( Drive.Ticks == 0 ) ) 
//		{
//			DriveService();	
//			Drive.Ticks = Drive.Interval;
//		}
	}		
	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
	TIM4_ClearFlag(TIM4_IT_UPDATE);
}

void OnCaptureOVTim2(void)
{
	//if ( TIM2_GetITStatus( TIM2_IT_UPDATE)  != SET ) 
	//	return;
		
	//Pwm.T1 = Pwm.T10 = 0u;		
	
	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
	
}	

void OnCaptureTim2(void)
{
	u16 t;
	
	if ( TIM2_GetITStatus( TIM2_IT_CC1) == SET )
	{
		t = TIM2_GetCapture1();	
		Pwm.T10 = t;	
		//Pwm.T20 = TIM2_GetCapture2();
		//TIM2_ClearFlag(TIM2_FLAG_CC1);
		//TIM2_ClearITPendingBit(TIM2_IT_CC1);
		//TIM2_SetCounter(0u);
		//goto Next;
		;
	}
	if ( TIM2_GetITStatus( TIM2_IT_CC2) == SET ) 
	{
		t = TIM2_GetCapture2();	
		Pwm.T20 = t;	
		//Pwm.T1 = TIM2_GetCapture1();
		//TIM2_ClearFlag(TIM2_FLAG_CC2);
		TIM2_ClearITPendingBit(TIM2_IT_CC2);
		//TIM2_SetCounter(0u);
	  //goto Next;
		Pwm.Count = Pwm.T20 - Pwm.T10;
	}
		;
		iDuty = (iDuty + 1) % 64;
		dutyBuffer[iDuty] = (t>>4);
		//dutyBuffer[iDuty] = (TIM2_GetCounter()>>4);
		TIM2_ClearITPendingBit(TIM2_IT_CC1);
	return;
Next:	

	t = TIM2_GetCapture1();	
	//TIM2_ClearFlag(TIM2_FLAG_CC1);
	//TIM2_ClearITPendingBit(TIM2_IT_CC1);
	//TIMER_EDGE_SET(Pwm.Edge)	//	TIM2_Init()

	if ( Pwm.Edge == 0 ) 
	{	
		//TIM2_SetCounter(0u);		//	TIM2_SetCounter(uint16_t Counter)		
		Pwm.Edge = 1;
		Pwm.Calc = 1;
		//Pwm.T2 =  Pwm.T20 = t;	
	}	
	else
	{
		//Pwm.T1 = Pwm.T10 = t;
		Pwm.Edge = 0; 
	}
}



void Timer_Config(void)
{
  TIM4_DeInit();
	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32);  //  16 * 0x32 = 50uS  Ticks 
	//TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x64);  //  16 * 0x64 = 100uS  Ticks 
  TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
  TIM4_Cmd(ENABLE);

	TIM2_DeInit();	
	TIM2_TimeBaseInit(TIM2_PRESCALER_64, 0xffff);
	
	TIM2_PWMIConfig(	TIM2_CHANNEL_1,
										TIM2_ICPOLARITY_FALLING, 
										TIM2_ICSELECTION_DIRECTTI,
										TIM2_ICPSC_DIV8,
										0x0 );
	
	/*TIMER_EDGE_SET(mode)	TIM2_ICInit( TIM2_CHANNEL_1,\
		mode==0 ? TIM2_ICPOLARITY_FALLING : TIM2_ICPOLARITY_RISING,\
		TIM2_ICSELECTION_DIRECTTI, TIM2_ICPSC_DIV8, 0x0);
	*/
	TIM2_ITConfig(/*TIM2_IT_UPDATE |*/ TIM2_IT_CC1 | TIM2_IT_CC2, ENABLE);
	//TIMER_EDGE_SET(0)	//	TIM2_Init()
	TIM2_Cmd(ENABLE);
}

void Test(void);
void main(void)
{
	uint16_t	_t1, _t2;
	uint32_t	_t;
	Ticks_1mS = Ticks_50uS = Pwm.Edge = 0;
	Clock_Config();
	Gpio_Config();
	Timer_Config();
	StopDrive();
	
	Adc.Idx = 2;
	Adc_Config();

	Drive.Enabled = ENABLED;
	Drive.MaxOverrun = OVERRUN;				// Zero position over run
	Drive.Timeout_1S =  VALVE_TIMEOUT_S;	// Valve timeout
	Drive.Position = Drive.Stage = 0;
	Drive.Dir = nMotorClose;
	Drive.Interval = 15u;	//	for 24V 35RD Motor sample #1/2/3 = 12/11/14u
	
	enableInterrupts();
	//waitPowerDelay();
#ifdef _SPEEDTEST_
	Drive.T1_1mS = Ticks_1mS;
	StartDriveOR( 4800u, OFFSET_OVERRUN);	// Goto Zero position
	WAIT_IF_RUN
	Drive.T2_1mS = Ticks_1mS;
#endif
/*	
	if ( Drive.Origin ) 
	{
		Drive.Position = 0u;
		StartDriveOR( CPulse(200u), OFFSET_OVERRUN);
		WAIT_IF_RUN
	}
	else
		Drive.Position = CPulse(205u);
*/
	Drive.Position = CPulse(205u);

	Timer.Led = Timer.Motor = Timer.Adc = Ticks_1mS;
	Drive.Run0 = Drive.Run;

	while (1)
  	{
		tt = Ticks_1mS;
		LightControl(tt);
		AdcService();
#ifdef _SPEEDTEST_		
		if ( Drive.Run0 == 0 &&  Drive.Run == 1 )
		{
			Pwm.T1_1mS = Ticks_1mS;
			Drive.Run0 = Drive.Run;			
		}
		if ( Drive.Run0 == 1 &&  Drive.Run == 0 )
		{
			Pwm.T2_1mS = Ticks_1mS;
			Drive.Run0 = Drive.Run;			
		}
#endif		
		if( Drive.Stage == 0u )
		{
			Drive.Stage = ZeroPos();
			goto Loop;
		}
		if ( Diff ( Timer.Motor, 200u ) == 0u )
			goto Loop;
		if ( Diff ( Timer.PwmUpdate, 2000u ) != 0u )
		{
			Timer.PwmUpdate = (Ticks_1mS > 2000u) ? Ticks_1mS - 2000u : 65535u - 2000u + Ticks_1mS;
			Drive.Step = 0;
		}
		else
		{
			iDuty = (iDuty + 1) % 16;
			//Drive.Step = stepCalc(stepPrepare(iDuty));
		}
		//MotorService(Drive.Step);
		Drive.PreStep = Drive.Step;
	Loop:		
//		WAIT_50ms(tt);
		while(Diff(tt, 50u)==0)
		{
			Adc_Config();
			
			if( Pwm.Calc == 1 )
			{
				Pwm.Calc = 0;
				_t1 = Pwm.T1;
				_t2 = Pwm.T2;
				_t = (uint32_t)_t1 * 200 / _t2;
				Pwm.Duty = _t;
//				while ( Pwm.T2 > 0xff )
//				{
//					Pwm.T2 >>= 2;	
//					Pwm.T1 >>= 2;
//				}				
//				Pwm.Duty = ( Pwm.T1 * 200 /  Pwm.T2 );// + 1 ;
				//iDuty = (iDuty + 1) % 64;
			  //stepPrepare(iDuty);
				Timer.PwmUpdate = Ticks_1mS;		
			}
			if ( Drive.MotorRun == 1 && Drive.Enabled ) 	// &&  ( Drive.Ticks == 0 ) ) 
			{
				Drive.MotorRun = 0;
				DriveService();	
				Drive.Ticks = Drive.Interval;
			}
		}
	}
}

void Test(void)
{
	
	
	
}






#ifdef USE_FULL_ASSERT
void assert_failed(u8* file, u32 line)
{
	u8 i;
  	while (1) i++;
}
#endif

#endif
