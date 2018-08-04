
#include "stm8s.h"
#include "stm8s_clk.h"
#include "stm8s_tim2.h"
#include "stm8s_gpio.h"

//	for IODEF
#define _IODEF_

#define _MOTOR_WATCH_

#define TYPE_MD24				1
#define TYPE_MD12				2

#define TRUE 						1
#define FALSE 					0
#define ENABLED					1
#define OVERRUN     		300	// Pulse, Zero position overrun
#define HALL_THRESHOLD 	40	// hall IC threshold
#define OVER_STEP  			30

#define VALVE_TIMEOUT_S 300	// sec
#define MAX_ADC					5
#define MAX_POS					200
#define MAX_TIMEOUT			2000
#define MAX_ADC_BUF			4	//	Resize for RAM Size

#define TIME_POWERDELAY	499
#define OFFSET_OVERRUN	0
#define MAX_DUTYBUFFER	40
#define MAX_MOTORWATCH	16

//	TIM2_IT_CC1/TIM2_IT_CC2
#define TIM2_InterruptClear(i)	TIM2_ClearITPendingBit(i); TIM2_SetCounter(0);

typedef enum { nMotorClose, nMotorOpen } MOTOR_DIR;

u16 tt;
u8 dutyBuffer[MAX_DUTYBUFFER];
u8 iDuty;
u16 sDuty;
u8 nDuty = 0;
u16 mDuty;

volatile uint8_t Ticks_50uS;
volatile uint16_t Ticks_1mS;
u16 ledint = 500;

struct {
	uint8_t Enabled : 1;
	uint8_t Run;
	uint8_t Run0 : 1;
	uint8_t LastOrigin : 1; 
	uint8_t Dir	: 1;
	uint8_t Origin;
	uint8_t NormalOpen :1;
	uint16_t Position;			// Current position (pulse)
	uint16_t Target;			// Target Position  (pulse)
	uint16_t Overrun;			// Origin cal overrun (pulse)
	uint8_t Overrun2;			// Valve hysteresis calibration overrun 
	uint16_t ZeroOffset;
	uint8_t Phase;				// motor coil phase
	uint16_t  MaxOverrun;	
	uint16_t  ORGPosition;		// Hall IC origin position
	uint8_t Interval ;			// Drive interval (mS)
	uint8_t Ticks;				
	uint8_t	MotorRun;
	u8 Step;
	u8 PreStep;
	u8 Stage;
	u8 DeviceType;		//	1, 2, 3
} Drive;

struct {
	u16 T1_1mS;	
	u16 T2_1mS;
	u8 Edge	: 1;
	uint8_t Calc;
	u16 T10;	
	u16 T20;
	u16 T1;
	u16 T2;
	u16 Duty;
	u16 Count;
	u16	diff;
} Pwm;

typedef struct tagAdcBuf
{
	u16 b[MAX_ADC_BUF];
	u8 i;
	u8 avg;
}	ADCBUF;

struct {
	u8 Channel;
	ADCBUF	buf[MAX_ADC];
} Adc;

struct {
	u16 Led;
	u16 Motor;
	u16 Adc;
	u16 PwmUpdate;
} Timer;

#if defined (_MOTOR_WATCH_)
u16 mStep[MAX_MOTORWATCH];
u8 iStep;
#endif

#define TIMER_EDGE_SET(mode)	TIM2_ICInit( TIM2_CHANNEL_1,\
		mode==0 ? TIM2_ICPOLARITY_FALLING : TIM2_ICPOLARITY_RISING,\
		TIM2_ICSELECTION_DIRECTTI, TIM2_ICPSC_DIV1, 0x0);

#define WAIT_IF_RUN			while(Drive.Run); 

#define TYPE_1Phase			0
#define TYPE_12Phase		1
#define TYPE_2Phase			2
#define EXCITATION_TYPE		TYPE_12Phase

typedef struct tagIoDef
{
	GPIO_TypeDef	*port;
	GPIO_Mode_TypeDef	pin;
}	IODEF, *LPIODEF;

IODEF	IO_LED = { GPIOA, GPIO_PIN_2 };

#define LightOn					GPIO_WriteLow(IO_LED.port, IO_LED.pin);
#define LightOff				GPIO_WriteHigh(IO_LED.port, IO_LED.pin);
#define LightToggle 		GPIO_WriteReverse(IO_LED.port, IO_LED.pin);			

IODEF IO_ORG = { GPIOB, GPIO_PIN_4 };

#define MotorOrigin()		GPIO_ReadInputPin(IO_ORG.port, IO_ORG.pin);
#define ModeSelect()		GPIO_ReadInputPin(IO_MOD.port, IO_MOD.pin)

IODEF	IO_X1 = { GPIOC, GPIO_PIN_6 };
IODEF	IO_X2 = { GPIOC, GPIO_PIN_7 };
IODEF	IO_Y1 = { GPIOC, GPIO_PIN_3 };
IODEF	IO_Y2 = { GPIOA, GPIO_PIN_3 };

#define _H_X1						GPIO_WriteHigh(IO_X1.port, IO_X1.pin);	
#define _H_X2						GPIO_WriteHigh(IO_X2.port, IO_X2.pin);	
#define _H_Y1						GPIO_WriteHigh(IO_Y1.port, IO_Y1.pin);	
#define _H_Y2						GPIO_WriteHigh(IO_Y2.port, IO_Y2.pin);	
#define _L_X1						GPIO_WriteLow(IO_X1.port, IO_X1.pin);	
#define _L_X2						GPIO_WriteLow(IO_X2.port, IO_X2.pin);	
#define _L_Y1						GPIO_WriteLow(IO_Y1.port, IO_Y1.pin);	
#define _L_Y2						GPIO_WriteLow(IO_Y2.port, IO_Y2.pin);	

IODEF	IO_ADJ = { GPIOC, GPIO_PIN_4 };			//MD24, In - Ref Vol
IODEF	IO_SEN = { GPIOD, GPIO_PIN_3 };			//MD24, In - Motor Current Sensing
IODEF	IO_POWER = { GPIOD, GPIO_PIN_2 };		//MD24, In - Vcc(12/24/Drop) 

IODEF	IO_MOD = { GPIOD, GPIO_PIN_4 };
IODEF	IO_BAT = { GPIOD, GPIO_PIN_3 };
IODEF	IO_BOOST = { GPIOD, GPIO_PIN_3 };
IODEF	IO_CHARGE = { GPIOD, GPIO_PIN_5 };

#define GPIO_SET(portDef,type)	GPIO_Init(IO_##portDef.port, IO_##portDef.pin, type);

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
#endif
#if (EXCITATION_TYPE == TYPE_1Phase)
		case 0: case 1: _H_X1 _L_X2 _L_Y1 _L_Y2 break;
		case 2: case 3: _L_X1 _L_X2 _H_Y1 _L_Y2 break;
		case 4: case 5: _L_X1 _H_X2 _L_Y1 _L_Y2 break;
		case 6: case 7: _L_X1 _L_X2 _L_Y1 _H_Y2 break;
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
	}
}

uint16_t CPulse( u8 step )
{
	return (uint16_t)step * 26;  // 20180509  change to 5200 pulse
}

u8  Diff(uint16_t time, uint16_t diff)				
{
	uint16_t _t = time<=Ticks_1mS ? Ticks_1mS - time : 0xffff - time + Ticks_1mS;
	return _t > diff ? 1 : 0;
}

uint16_t	stepPrepare(uint8_t i)
{
	sDuty -= dutyBuffer[i];
	dutyBuffer[i] = Pwm.Duty;
	sDuty += dutyBuffer[i];
	return sDuty;
}

uint8_t	stepCalc(uint16_t duty)
{
	uint16_t t;
	if ( nDuty < 16 )
		nDuty ++;
	mDuty = (duty / nDuty) * 2 + 1;	
	mDuty /= 2;
	if( mDuty < 20 )	mDuty = 20;
	if( mDuty > 180 )	mDuty = 180;
						 
	t = (625 * mDuty)/10 -1250;		//  y  = 6.25 x - 1.25  20,0  to  180, 200
	t = (t / 25 + 1 ) /	2;
	return (uint8_t)t;
}

void	waitPowerDelay(void)
{
	LightOn
	while( Ticks_1mS < TIME_POWERDELAY );
	LightOff
//	Drive.Origin = !MotorOrigin();
}

void StartDriveOR( uint16_t tPos, uint8_t overrun )
{
#if defined (_MOTOR_WATCH_)
	mStep[iStep] = tPos;
	iStep = (iStep + 1) % MAX_MOTORWATCH;
	mStep[iStep] = 0;
#endif	
	
	if ( Drive.Run || (Drive.Position==tPos) ) return;
	if ( tPos == 0 )				//  goto origin
	{
		Drive.ZeroOffset = CPulse( OVER_STEP );
		Drive.Position += Drive.ZeroOffset;   	// POSITION;
		Drive.Overrun =	Drive.Target = 0;
		Drive.Dir = nMotorClose;
	}
	else	
	{
		if (Drive.Position >= tPos)	// Closing
		{
			Drive.Overrun =	Drive.Overrun2 = 0;
			Drive.Dir = nMotorClose;
		}
		else	// Opening
		{
			Drive.Overrun2 = overrun;
			Drive.Dir = nMotorOpen;
		}
		Drive.Target = tPos + Drive.Overrun2;
	}
	Drive.Run = TRUE;
	Drive.Ticks = Drive.Interval;
}

u8	ZeroPos(void)
{
	if( Drive.Run != 0 ) return 0;
	if( Drive.Origin == 1 ) return 1;
	StartDriveOR(0, OFFSET_OVERRUN);	// Goto Zero position
	return 0;
}

void	LightControl(uint16_t t)
{
	if ( Diff (Timer.Led, ledint) == 0 )
		return;
	Timer.Led = t;
	LightToggle
	//	ledint = Drive.Run==1 ? 500 : 250;
}

void MotorService(uint8_t step)
{
	if ( step > 205 ) step = 205;
	if ( step < 20 ) step = 0;
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
			Drive.Overrun2 = 0;
			return;
		}
	}
	Drive.ZeroOffset = Drive.Overrun = 0;
	StopDrive();	
}

void AdcService(uint8_t channel)
{
	if( Diff(Timer.Adc, 10) != 1 )
		return;
#if defined (_ADC_SUM_)
	u8 i;
	u16 s = 0;
	for( i=0; i<MAX_ADC_BUF; i++ )
		s += Adc.buf[channel].b[i];
	Adc.buf[channel].avg = (s>>2) / MAX_ADC_BUF;
#else
	Adc.buf[channel].avg = Adc.buf[channel].b[0]>>2;
#endif
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
	if( Dir == nMotorClose )
	{
		if( Drive.Position != 0 ) 
			MotorStepPhase(1);

		if( Drive.Position == 0 ) 
		{
			Drive.Overrun = Drive.ZeroOffset = Drive.Position = Drive.Target = 0;
			StopDrive();	
		}
	}
	else
	{
		// Find hall ic position
		MotorStepPhase(0);
				
		if( Drive.Origin ) 
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
		Drive.Target = Drive.Position = Drive.Overrun = Drive.ZeroOffset = 0;
		StopDrive();
		return;
	}
	Drive.Overrun++;
	MotorStep(nMotorClose);
}

void	factory(uint8_t mode)
{
	uint16_t t = 0, _t = 0;
	if( mode == 0 )
		return;
	while(1)
	{
		if( Ticks_1mS == _t )
			continue;
		_t = Ticks_1mS;
		t++;
		if( t > 200 )
		{
			LightToggle
		}
	}
}

void Clock_Config(void)
{
//	CLK_DeInit();
//	CLK_HSICmd(ENABLE);
//	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
//	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 
	
	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
	CLK_HSICmd(ENABLE);
}

void Gpio_CheckMode(void)
{
	uint8_t t = 0;
	uint8_t prev = 0;

	Drive.DeviceType = TYPE_MD24;
	Ticks_1mS = 0;
	return;
	
	GPIO_SET(MOD, GPIO_MODE_IN_FL_IT)

	while( Ticks_1mS < 500 )
	{
		if( Diff(Ticks_1mS, 10) == 0 )
			continue;
		t = ModeSelect() == prev ? t+1 : 0; 
		prev = ModeSelect();
		if( t == 10 )
			break;
	}
	if( t != 10 )
		return;

	if( prev == 1 )	
	{
		//	MD12, 24BYJ48 5V, Rinnai/SY, 12V
		Drive.DeviceType = TYPE_MD12;
	}
	else
	{
		//	MD24, SP-350RD(MOATECH), 12/24V, Germany, 12~24V
		Drive.DeviceType = TYPE_MD24;
	}
	//
	//	Check Function Mode
	//
	factory(0);
	Ticks_1mS = 0;
}

void Gpio_Config(void)
{
	Gpio_CheckMode();

	GPIO_SET(LED, GPIO_MODE_OUT_PP_LOW_FAST)
	GPIO_SET(ORG, GPIO_MODE_IN_FL_NO_IT)
	GPIO_SET(X1, GPIO_MODE_OUT_PP_LOW_FAST)
	GPIO_SET(X2, GPIO_MODE_OUT_PP_LOW_FAST)
	GPIO_SET(Y1, GPIO_MODE_OUT_PP_LOW_FAST)
	GPIO_SET(Y2, GPIO_MODE_OUT_PP_LOW_FAST)
	StopDrive();
		
	GPIO_SET(ADJ, GPIO_MODE_IN_FL_NO_IT)
	GPIO_SET(SEN, GPIO_MODE_IN_FL_NO_IT)
	GPIO_SET(POWER, GPIO_MODE_IN_FL_NO_IT)
	if( Drive.DeviceType == TYPE_MD24 )
	{
		return;
	}
	
	GPIO_SET(BAT, GPIO_MODE_IN_FL_NO_IT)
	if( Drive.DeviceType == TYPE_MD12 )
	{
		GPIO_SET(BOOST, GPIO_MODE_IN_FL_NO_IT)
		GPIO_SET(POWER, GPIO_MODE_IN_FL_NO_IT)
	}
}

OnTimer_1S(void) {}
//	3/4/2 -> 3/4/5/6/2
//	MD24
//	I_SENSE = 4
//	I_POWER = 3
//	I_ADJ = 2
uint8_t	_chan[] = { ADC1_CHANNEL_3, ADC1_CHANNEL_4, 
		ADC1_CHANNEL_5, ADC1_CHANNEL_6,
		ADC1_CHANNEL_2 };
uint8_t	_chanSchmit[] = { ADC1_SCHMITTTRIG_CHANNEL3 , ADC1_SCHMITTTRIG_CHANNEL4 , 
		ADC1_SCHMITTTRIG_CHANNEL5, ADC1_SCHMITTTRIG_CHANNEL6,
		ADC1_SCHMITTTRIG_CHANNEL2
		};
uint8_t	_chanId[] = { 1, 2, 3, 4, 0 };

void Adc_Config(void)
{
	Adc.buf[Adc.Channel].b[Adc.buf[Adc.Channel].i] = ADC1_GetConversionValue();
#if defined (_ADC_SUM_)
	Adc.buf[Adc.Channel].i = (Adc.buf[Adc.Channel].i + 1) % MAX_ADC_BUF;
#else
	Adc.buf[Adc.Channel].i = 0;
#endif
	Adc.Channel = _chanId[Adc.Channel];
	//@ Check Type
	if( Drive.DeviceType == TYPE_MD24 )
	{
		if( Adc.Channel == 2 )
			Adc.Channel = 4;
	}
	ADC1_DeInit();
	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, 
		_chan[Adc.Channel], 
		ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, 
		_chanSchmit[Adc.Channel],
	   	DISABLE
		);
	//Adc.Channel = _chanId[Adc.Channel];
	ADC1_StartConversion();		
}

void OnTimer4(void)
{
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
		if( Drive.Enabled )
			Drive.Ticks = Drive.Interval;
	}		
	TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
	TIM4_ClearFlag(TIM4_IT_UPDATE);

	Adc_Config();
	Drive.Origin = !MotorOrigin();
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
	if( TIM2_GetITStatus(TIM2_IT_CC1) == SET )
	{
		t = TIM2_GetCapture1();	
		//Pwm.T10 = t;	
//		Pwm.T20 = TIM2_GetCapture2();
		TIM2_InterruptClear(TIM2_IT_CC1)

		iDuty = (iDuty + 1) % MAX_DUTYBUFFER;
		dutyBuffer[iDuty] = (t>>4);
		goto Next;
	}
#if defined (_PWM_TIMER_MODE_)
#error
	if( TIM2_GetITStatus(TIM2_IT_CC2) == SET ) 
	{
		t = TIM2_GetCapture2();	
		//Pwm.T2 = t;	
//		Pwm.T1 = TIM2_GetCapture1();
		TIM2_InterruptClear(TIM2_IT_CC2)
	  	goto Next;
		Pwm.Count = Pwm.T20 - Pwm.T10;
	}
#endif
	//dutyBuffer[iDuty] = (TIM2_GetCounter()>>4);
	return;
Next:	

	t = TIM2_GetCapture1();	
//	TIMER_EDGE_SET(Pwm.Edge)	//	TIM2_Init()

	if ( Pwm.Edge == 0 ) 
	{	
		//TIM2_SetCounter(0);		//	TIM2_SetCounter(uint16_t Counter)		
		Pwm.Edge = 1;
		Pwm.Calc = 1;
		Pwm.T2 = /*Pwm.T20 =*/ t;	
	}	
	else
	{
		Pwm.Edge = 0; 
		Pwm.T1 = /*Pwm.T10 =*/ t;
	}
}

void Timer_Config(void)
{
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
	
// TIM4_DeInit();
	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32);  //  16 * 0x32 = 50uS  Ticks, 0x64-100us 
  TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
  TIM4_Cmd(ENABLE);

//	TIM2_DeInit();	
	TIM2_TimeBaseInit(TIM2_PRESCALER_1, 0xffff);
#if defined (_PWM_TIMER_MODE_)
#error
	TIM2_PWMIConfig(TIM2_CHANNEL_1, TIM2_ICPOLARITY_FALLING, 
			TIM2_ICSELECTION_DIRECTTI, TIM2_ICPSC_DIV8, 0x0);
	TIM2_ITConfig(TIM2_IT_CC1 | TIM2_IT_CC2, ENABLE);
#else
	TIMER_EDGE_SET(0)	//	TIM2_Init()
	TIM2_ITConfig(TIM2_IT_UPDATE | TIM2_IT_CC1, ENABLE);
#endif
	TIM2_Cmd(ENABLE);
}

void mainDeviceType(void)
{
	while (1)	{}
}

void	motorGo(void)
{
	if ( Drive.MotorRun == 1 && Drive.Enabled )
	{
		Drive.MotorRun = 0;
		DriveService();	
		Drive.Ticks = Drive.Interval;
	}
	//	Debug only
	if ( Drive.Run0 == 0 &&  Drive.Run == 1 )
	{
		Pwm.T1_1mS = Ticks_1mS;
		Drive.Run0 = Drive.Run;
	}
	if ( Drive.Run0 == 1 &&  Drive.Run == 0 )
	{
		Pwm.T2_1mS = Ticks_1mS;
		Drive.Run0 = Drive.Run;			
		Pwm.diff = Pwm.T2_1mS - Pwm.T1_1mS;
	}
}

void main(void)
{
	uint8_t		channel = 0;
	uint16_t	_t1, _t2;
	uint32_t	_t;
	uint16_t 	_tt;
	Drive.Enabled = ENABLED;
	Drive.MaxOverrun = OVERRUN;
	Drive.Position = Drive.Stage = 0;
	Drive.Dir = nMotorClose;
	Drive.Interval = 15;	//	for 24V 35RD Motor sample #1/2/3 = 12/11/14u
	
	Ticks_1mS = Ticks_50uS = Pwm.Edge = 0;

	Clock_Config();
	Gpio_Config();
	Timer_Config();
	
	Adc.Channel = 2;
	Adc_Config();

	enableInterrupts();
	waitPowerDelay();
	if ( Drive.Origin ) 
	{
		Drive.Position = 0;
		StartDriveOR( CPulse(MAX_POS), OFFSET_OVERRUN);
		
		//WAIT_IF_RUN
		while ( Drive.Run )
			motorGo();
		
	}
	else
		Drive.Position = CPulse(MAX_POS + 5);

	Timer.Led = Timer.Motor = Timer.Adc = Ticks_1mS;
	Drive.Run0 = Drive.Run;

	if( Drive.DeviceType == TYPE_MD12 )
		mainDeviceType();

	while (1)
	{
		tt = Ticks_1mS;
		LightControl(tt);
		AdcService(channel);

		if ( Drive.Stage == 0 )
		{
			Drive.Stage = ZeroPos();
			goto Loop;
		}
		if ( Diff(Timer.Motor, 100) == 0 )
			goto Loop;
		if ( Diff(Timer.PwmUpdate, MAX_TIMEOUT) != 0 )
		{
			Timer.PwmUpdate = (Ticks_1mS > MAX_TIMEOUT) ? 
				Ticks_1mS - MAX_TIMEOUT : 
				0xffff - MAX_TIMEOUT + Ticks_1mS;
			Drive.Step = 0;
		}
		else
		{
			iDuty = (iDuty + 1) % 16;
			//Drive.Step = stepCalc(stepPrepare(iDuty));
		}
		Drive.PreStep = Drive.Step;
	Loop:		
		if( _tt != tt )
		{
			_tt = tt;
			
			if( Pwm.Calc == 1 )
			{
				Pwm.Calc = 0;
				_t1 = Pwm.T1;
				_t2 = Pwm.T2;
				_t = (uint32_t)_t1 * MAX_POS / _t2;
				Pwm.Duty = _t;
//				while ( Pwm.T2 > 0xff )
//				{
//					Pwm.T2 >>= 2;	
//					Pwm.T1 >>= 2;
//				}				
//				Pwm.Duty = ( Pwm.T1 * MAX_POS /  Pwm.T2 );// + 1 ;
				//iDuty = (iDuty + 1) % MAX_DUTYBUFFER;
			  //stepPrepare(iDuty);
				Timer.PwmUpdate = Ticks_1mS;		
			}
		}
		motorGo();
	}
}

#ifdef USE_FULL_ASSERT
void assert_failed(u8* file, u32 line) { u8 i; while (1) i++; }
#endif

