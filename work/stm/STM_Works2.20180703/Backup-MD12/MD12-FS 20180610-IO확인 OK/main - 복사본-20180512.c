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
#define OVERRUN     	(300u)			// Pulse, Zero position overrun
#define HALL_THRESHOLD 	(40u)			// hall IC threshold
#define OVER_STEP  		(30u)

#define VALVE_TIMEOUT_S 	(300u)			// sec
#define MAX_ADC	(3)

typedef enum { nMotorClose, nMotorOpen } MOTOR_DIR;

u16 tt;
u8 Duty[16];
u8 iDuty;
u16 sDuty;
u8 nDuty=0;
u16 mDuty;

volatile uint32_t Ticks_50uS;
volatile uint16_t Ticks_1mS;
u16 ledint = 1000u;

//   10v to 26V
//u8 TableInterval[17] = { 65,56,50,45,40, 	36,32,29,26,23, 	21,19,17,16,15, 	14,13 };

#define IntervalSlope (57/2)

struct {
	uint8_t Enabled 	: 1;
	uint8_t Run 		: 1;
	u8 Run0				: 1;
	uint8_t LastOrigin 	: 1; 
//	uint8_t Stop		: 1;	
	uint8_t Dir			: 1;
	
	uint16_t Position;			// Current position (pulse)
	uint16_t Target;			// Target Position  (pulse)
	uint16_t Overrun;			// Origin cal overrun (pulse)
	uint8_t Overrun2;			// Valve hysteresis calibration overrun 
	uint16_t ZeroOffset;
	uint8_t Phase;				// motor coil phase
	uint16_t  MaxOverrun;	
	uint16_t  ORGPosition;		// Hall IC origin position
	
	uint16_t Interval ;			// Drive interval (mS)
	uint16_t Ticks;				
	uint16_t Timeout_1S;		// Drive Timeout 
	u8 Origin;
	u8 NormalOpen;
	u8 Step;
	u8 PreStep;
	u8 Stage;

} Drive;

struct {
	u8 Edge 		: 1;

	u16 T1_1mS;
	u16 T2_1mS;	
	u16 T1;
	u16 T2;
	u16 Duty;
	u16 T3;
	u16 T4;
	u8 CntOverflow;
	u8 Prescaler;	
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

uint16_t PowerDelay_1mS = 499;

void DriveService(void);
void StartDriveOR( uint16_t Target, uint8_t overrun );
void OnCaptureTim2(void);
void OnCaptureOVTim2(void);

static void Adc_Config( void );

#if defined (_MOTOR_WATCH_)
u16 mStep[32]; 	// buffer for watching 
u8 iStep;
#endif
u32 mVal;

#define TIMER_EDGE_SET(mode)	TIM2_ICInit( TIM2_CHANNEL_1,\
		mode==0 ? TIM2_ICPOLARITY_FALLING : TIM2_ICPOLARITY_RISING,\
		TIM2_ICSELECTION_DIRECTTI, TIM2_ICPSC_DIV8, 0x0);

#define WAIT_IF_RUN			while(Drive.Run); // Wait while motor is running

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
	//Drive.PreStep = step;
	return (uint16_t)((uint32_t) step *(26UL));  // 20180509  change to 5200 pulse
}

u8  Diff(uint16_t time, uint16_t diff)
{
	uint16_t _t = time<=Ticks_1mS ? Ticks_1mS - time : 0xffff - time + Ticks_1mS;
	return _t > diff ? 1u : 0u;
}

void	waitPowerDelay(void)
{
	LightOn
	while ( Ticks_1mS < PowerDelay_1mS );
	LightOff
}

u8	ZeroPos(void)
{
	if( Drive.Run != 0 )
		return 0;

	if( Drive.Origin == 1 )
		return 1;

	StartDriveOR(0u, 0u);	// Goto Zero position
	return 0;
}

void	LightControl(uint16_t t)
{
	if ( Diff ( Timer.Led, ledint ) )
	{
		Timer.Led = t;
		LightToggle
	}
	//	ledint = Drive.Run==1 ? 500u : 250u;
}

void MotorService(uint8_t step)
{
#if defined (_MOTOR_WATCH_)
//	mStep[iStep] = step;
//	iStep = (iStep + 1) % 32;
//	mStep[iStep] = 0;
#endif

	if ( step > 205u )
		step = 205u;

	if ( step < 20u )
		step = 0u;
				
//	if ( Drive.Run ) 	//&& Timer.MotorUpdate != 1 ) 
//	{
//		if ( 1 )			// same dir
//			StartDriveOR( CPulse(step), 0u );
//		else			   	// Reverse direction
//			Drive.Stop = 1;			
//	}
//	else
//		StartDriveOR( CPulse(step), 0u );

	StartDriveOR( CPulse(step), 0u );

	Timer.Motor = Ticks_1mS;
}

void AdcService(void)
{
	if ( Diff ( Timer.Adc, 10u )!= 1 )
		return;

#if defined (_ADC_SUM_)
	Adc.Sum = Adc.Sum - Adc.IAvg[Adc.IdxAvg];
	Adc.IAvg[Adc.IdxAvg] = Adc.Value[0]>>2 ;
	Adc.Sum = Adc.Sum + Adc.IAvg[Adc.IdxAvg];
	Adc.Average = Adc.Sum /5;
#else
	Adc.IAvg[Adc.IdxAvg] = Adc.Value[0]>>2 ;
#endif
	Adc.IdxAvg = (Adc.IdxAvg + 1) % 4; 
	Timer.Adc = Ticks_1mS;
}

OnTimer_1S(void) {}

/*   Timer Callback function every 50uS		*/
void OnTimer4(void)
{
	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
	
	Adc_Config();
	Drive.Origin = !MotorOrigin();
	
	if (  Ticks_50uS < 19 )
		Ticks_50uS++;
	else
	{
		Ticks_50uS = 0;
		Ticks_1mS++;
		if ( PowerDelay_1mS )
			PowerDelay_1mS--;
	}

	if( Drive.Ticks )
	{
		Drive.Ticks--;
		//return;
	}
	if ( Drive.Enabled &&  ( Drive.Ticks == 0 ) ) 
	{
		DriveService();	
		Drive.Ticks = Drive.Interval;
	}	
}

void OnCaptureOVTim2(void)
{
	if ( TIM2_GetITStatus( TIM2_IT_UPDATE)  != SET ) 
		return;
		
	//if 	( Pwm.CntOverflow < 0xff )
	//	Pwm.CntOverflow++;
		
	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
}



void OnCaptureTim2(void)
{
	u16	t;
	
	if ( TIM2_GetITStatus( TIM2_IT_CC1) != SET ) 
		return;
		
	t = TIM2_GetCapture1();
	
	TIM2_ClearITPendingBit(TIM2_IT_CC1);
	TIM2_ClearFlag(TIM2_FLAG_CC1);
	
	TIMER_EDGE_SET(Pwm.Edge)	//	TIM2_Init()
	
	#if defined (_MOTOR_WATCH_)
	mStep[iStep] = t;
	iStep = (iStep + 1) % 32;
	mStep[iStep] = 0;
#endif	

	if ( Pwm.Edge == 0 ) 
	{		
		Pwm.T2 = t;
		Pwm.Edge = 1;	
		if ( Pwm.T2 > Pwm.T1 ) 
		{
			//Pwm.T4 = Pwm.CntOverflow==0 ? (Pwm.T2 - Pwm.T1) : 0xffff;
			if ( Pwm.CntOverflow == 0 )
			{
				Pwm.T4 = Pwm.T2 - Pwm.T1;
			}
			else
			{
				Pwm.T4 = 0xffff;
				Pwm.CntOverflow == 0;
			}
		}
		else		
    	{
			//Pwm.T4 = Pwm.CntOverflow==1 ? (0xffff + Pwm.T2 - Pwm.T1) : 0xffff;
			Pwm.T4 = Pwm.CntOverflow==1 ? (0xffff - Pwm.T1 + Pwm.T2) : 0xffff;

			//Pwm.CntOverflow = 0;
    	}
		
		if ( Pwm.T3 == 0xffff || Pwm.T4 == 0xffff )
		{
			Pwm.Duty = 0u;
		}
		else
		{
			Pwm.Duty = ( Pwm.T3 * (uint32_t)400 / ( Pwm.T3 + Pwm.T4 ) ) + 1 ;
			Pwm.Duty /= 2;
			if ( Pwm.Duty == 91u )
				Timer.PwmUpdate = Ticks_1mS;	


		}
		Timer.PwmUpdate = Ticks_1mS;		
	}	
	else
	{
		Pwm.T1 = t;
		Pwm.Edge = 0;	
		if ( Pwm.T1 > Pwm.T2 ) 
		{
			//Pwm.T3 = Pwm.CntOverflow==0 ? (Pwm.T1 - Pwm.T2) : 0xffff;
			if ( Pwm.CntOverflow == 0 )
			{
				Pwm.T3 = Pwm.T1 - Pwm.T2;
			}
			else
			{
				Pwm.T3 = 0xffff;
				Pwm.CntOverflow == 0;
			}
		}
		else		
    	{
			//Pwm.T3 = Pwm.CntOverflow==1 ? (0xffff + Pwm.T1 - Pwm.T2) : 0xffff;	
			//Pwm.T3 = Pwm.CntOverflow==1 ? (0xffff - Pwm.T2 + Pwm.T1) : 0xffff;
			Pwm.T3 =  (0xffff - Pwm.T2 + Pwm.T1);
			//Pwm.CntOverflow = 0;	
    	}
	}
}

void StopDrive(void)
{
	_L_X1 _L_X2 _L_Y1 _L_Y2
}

void StartDriveOR( uint16_t Target, uint8_t overrun )
{
	

	
	if ( Drive.Run ) return;
	if ( Drive.Position == Target ) return;
		

	  
	if ( Target == 0 )				//  goto origin
	{
		Drive.Overrun =	0u;
		Drive.ZeroOffset = CPulse( OVER_STEP );
		Drive.Position += Drive.ZeroOffset;   	// POSITION;
		Drive.Target = 0u;
		Drive.Dir = nMotorClose;		// 0;
	}
	else	
	{
		if (Drive.Position >= Target)		// Closing
		{
			Drive.Overrun =	0u;
			Drive.Dir = nMotorClose;
			Drive.Overrun2 = 0u;
			Drive.Target = Target;
		}
		else								// Opening
		{
			Drive.Dir = nMotorOpen;	//1;
			Drive.Overrun2 = overrun;		//100;
			Drive.Target = Target + overrun;	//100;	
		}
	}
	Drive.Run = TRUE;
	Drive.Ticks = Drive.Interval;
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

void MotorStep(MOTOR_DIR Dir)
{
	if ( Dir == nMotorClose )
	{
		if ( Drive.Position != 0 ) 
			MotorStepPhase(1);

		if ( Drive.Position == 0 ) 
		{
			// Drive.Enabled = FALSE;
			Drive.Overrun = 0u;
			Drive.Run = FALSE;
			Drive.ZeroOffset = 0u;
			Drive.Position = 0u;
			Drive.Target = 0u;
			StopDrive();	
		}
	}
	else
	{
		// Find hall ic position
		MotorStepPhase(0);
				
		//Drive.Phase++;
		if ( Drive.Origin ) 
		{			
			Drive.ORGPosition = Drive.Position;
			Drive.LastOrigin = TRUE;
		}
		else
		{
			if ( Drive.LastOrigin )
			{			
				Drive.MaxOverrun  = Drive.ORGPosition - HALL_THRESHOLD;	
				if ( Drive.MaxOverrun > OVERRUN )
					Drive.MaxOverrun = OVERRUN;				
			}
		}
	}
	
	if ( !Drive.Run ) return;
	if ( !Drive.Enabled ) return;

	phase_excite(Drive.Phase%8);
}

void MotorClose(void)
{
	if ( !Drive.Origin )   		// Hall IC Sensing 
	{	
		MotorStep(nMotorClose);		// move 1 step close
		return;
	}
	if ( Drive.Overrun >= Drive.MaxOverrun ) //	max overrun
	{
		Drive.Target = Drive.Position = Drive.Overrun = Drive.ZeroOffset = 0u;
		Drive.Run = FALSE;			
		StopDrive();
	}
	else						// overrun 1 step close
	{
		Drive.Overrun++;
		MotorStep(nMotorClose);
	}
}

void DriveService(void)
{
	if ( ! Drive.Run ) 
	{
		StopDrive();
		return;	//when Drive is stop 
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
	Drive.Run = FALSE;
	StopDrive();	
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
  	GPIO_Init( _LED_PORT, _LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
		
	GPIO_Init(_X1_PORT, _X1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(_X2_PORT, _X2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(_Y1_PORT, _Y1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(_Y2_PORT, _Y2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	StopDrive();

  	GPIO_Init(_ORG_PORT, _ORG_PIN, GPIO_MODE_IN_FL_NO_IT);
		
	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT );
	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
	GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT );
}

void Timer4_Config(void)
{
  	TIM4_DeInit();
	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32 );  //  16 * 0x32 = 50uS  Ticks 
  	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
  	TIM4_Cmd(ENABLE);
}

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

void main(void)
{
	Ticks_1mS = Ticks_50uS = 0;

	Clock_Config();
	Gpio_Config();
	Timer4_Config();
	
	Adc.Idx = 2;
	Adc_Config();

	Drive.Enabled = ENABLED;
	Drive.MaxOverrun = OVERRUN;				// Zero position over run
	Drive.Timeout_1S =  VALVE_TIMEOUT_S;	// Valve timeout
	Drive.Position = 0;
	Drive.Stage = 0;		// Not Initialized
	Drive.Dir = nMotorClose;
	Drive.Interval = 12u;	//	for 24V 35RD Motor sample #1
	//Drive.Interval = 11u;	//	for 24V 35RD Motor sample #2
	//Drive.Interval = 14u;	//	for 24V 35RD Motor sample #3
	
	Pwm.Prescaler = TIM2_PRESCALER_8;

	Pwm.Edge = 0;
	
	
	TIM2_DeInit();	
	TIM2_TimeBaseInit( Pwm.Prescaler, 0xffff );
	TIM2_ITConfig( TIM2_IT_UPDATE | TIM2_IT_CC1, ENABLE);
	TIMER_EDGE_SET(0)	//	TIM2_Init()
	TIM2_Cmd(ENABLE);
	
	enableInterrupts();

	waitPowerDelay();
	
#ifdef _SPEEDTEST_
	Drive.T1_1mS = Ticks_1mS;
	StartDriveOR( 4800u, 0u  );	// Goto Zero position
	
	WAIT_IF_RUN

	Drive.T2_1mS = Ticks_1mS;
	Drive.Run0 = Drive.Run;
#endif
	
	if ( Drive.Origin ) 
	{
		Drive.Position = 0;
		StartDriveOR( CPulse(200u), 0u  );				// Goto Zero position
		
		WAIT_IF_RUN
	}
	else
		Drive.Position = CPulse(205u);

	Timer.Led = Timer.Motor = Timer.Adc = Ticks_1mS;

	while (1)
  	{
		tt = Ticks_1mS;
		LightControl(tt);

		AdcService();
		
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
		
		if( Drive.Stage == 0u )
		{
			Drive.Stage = ZeroPos();
			//continue;
			goto Loop;
		}
		if ( Diff ( Timer.Motor, 500u ) == 0u )
			//continue;
				goto Loop;

		if ( Diff ( Timer.PwmUpdate, 2000u ) != 0u )
		{
			Timer.PwmUpdate = (Ticks_1mS > 2000u) ? Ticks_1mS - 2000u : 65535u - 2000u + Ticks_1mS;						
			Drive.Step = 0;
		}
		else
		{
			if ( nDuty < 16 )
				nDuty ++;
						
			iDuty = (iDuty + 1) % 16;
					
			sDuty -= Duty[iDuty];
			Duty[iDuty] = Pwm.Duty;
			sDuty += Duty[iDuty];
					
			mDuty = (sDuty / nDuty)*2 + 1;		// Round Up
			mDuty /= 2;
			
			//mDuty = Pwm.Duty;
			RANGE_FROM_TO(mDuty, 20, 180)
			
						 
			//disableInterrupts();		//***
			mVal  =  (625u * (u32)mDuty);
			mVal /= (10u);
			mVal -= 1250u ;
			mVal = mVal /(u32)50u;
			mVal += 1u;
			mVal /= 2u;
			//enableInterrupts();			//****
			
			Drive.Step = (u8)mVal*2;
		}
		if ( Drive.Step == Drive.PreStep )
			MotorService(Drive.Step);
	
		Drive.PreStep = Drive.Step;
		
Loop:		
		while ( Diff ( tt, 50u ) == 0 );
	}
}

#ifdef USE_FULL_ASSERT
void assert_failed(u8* file, u32 line)
{
	u8 i;
  	while (1) i++;
}
#endif

