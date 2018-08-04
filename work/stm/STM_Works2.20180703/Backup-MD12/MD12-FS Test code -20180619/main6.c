
#include "stm8s.h"
#include "stm8s_clk.h"
#include "stm8s_tim1.h"
#include "stm8s_tim2.h"
#include "stm8s_gpio.h"

//	for PWM INPUT MODE
//#define _PWM_TIMER_MODE_
#define _DEBUG_TIM1_
#define _PWM_TIMER_MODE_

#if defined (_DEBUG_TIM1_)
#define GET_CAPTURECOUNT	TIM1_GetCapture3()
#define GET_ITSTATUS		TIM1_GetITStatus(TIM1_IT_CC3)

#else
#define GET_CAPTURECOUNT	TIM2_GetCapture1()
#define GET_ITSTATUS		TIM2_GetITStatus(TIM2_IT_CC1)

#endif

//#define	_DEBUG_TIME_ELAPSED_	//	enable calc elasped time for PWM
#define _DEBUG_MOTOR_WATCH_		//	enable ave Motor Step 
//#define _DEBUG_ADC_SUM_			//	enable ave for adc

#define TYPE_MD24			1
#define TYPE_MD12			2


#define TRUE 				1
#define FALSE 				0
#define OVERRUN     		300	// Pulse, Zero position overrun
#define HALL_THRESHOLD 		40	// hall IC threshold
#define OVER_STEP  			30

#define VALVE_TIMEOUT_S 	300	// sec
#define MAX_ADC				5
#define MAX_MOTOR_POS		200
#define MAX_TIMEOUT			2000
#define MAX_ADC_BUF			4	//	Resize for RAM Size

#define TIME_POWERDELAY		499
#define OFFSET_OVERRUN		0
#define MAX_DUTYBUFFER		40

//	TIM2_IT_CC1/TIM2_IT_CC2
#define TIM2_InterruptClear(i)	TIM2_ClearITPendingBit(i); TIM2_SetCounter(0);
#define TIM1_InterruptClear(i)	TIM1_ClearITPendingBit(i);

typedef enum { nMotorClose, nMotorOpen } MOTOR_DIR;

typedef struct tagDutyInfo
{
	uint8_t b[MAX_DUTYBUFFER];
	uint8_t i;
	uint8_t n;
	uint16_t s;
} DUTYINFO, *LPDUTYINFO;

DUTYINFO dutyInfo;

volatile uint8_t Ticks_50uS;
volatile uint16_t Ticks_1mS;
uint16_t ledint = 500;

struct {
	uint8_t Enabled : 1;
	uint8_t Run0 : 1;
	uint8_t LastOrigin : 1; 
	uint8_t Dir	: 1;
	uint8_t NormalOpen :1;
	uint8_t Origin : 1;
	uint8_t Run;
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
	uint8_t Step;
	uint8_t PreStep;
	uint8_t Stage;
	uint8_t DeviceType;		//	1, 2, 3
} 	Drive;

struct {
#if defined(_DEBUG_TIME_ELAPSED_)
	uint16_t T1_1mS;	
	uint16_t T2_1mS;
	uint16_t	diff;
#endif
	uint8_t Edge : 1;
	uint8_t Update : 1;
	uint8_t Calc : 1;
	uint16_t T1;
	uint16_t T2;
	uint16_t sT;
	uint16_t Duty;
	uint16_t Duty100;
	uint8_t Overflow;
	uint16_t	_t1, _t2;
} 	Pwm;

typedef struct tagAdcBuf
{
	uint16_t b[MAX_ADC_BUF];
	uint8_t avg;
#if defined (_DEBUG_ADC_SUM_)
	uint8_t i;
#endif
}	ADCBUF;

struct {
	uint8_t ch;
	ADCBUF	buf[MAX_ADC];
} 	Adc;

struct {
	uint16_t Led;
/*	uint16_t Motor;*/
	uint16_t Adc;
	uint16_t PwmUpdate;
} 	Timer;

#if defined (_DEBUG_MOTOR_WATCH_)
#define MAX_MOTORWATCH		16

typedef struct tagMotorWatch
{
	uint16_t step[MAX_MOTORWATCH];
	uint8_t i;
} 	MOTORWATCH, *LPMOTORWATCH;

MOTORWATCH motorWatch;
#endif

#if defined (_DEBUG_TIM1_)
/*
 *
	TIM1_ICPSC_DIV4 : CLK / 4 = 0.25us(0.266779661)
		200us -> 744 :: 198.4840
		10ms -> 37474 :: 9,997301
 *
 */
#define TIMER_EDGE_SET_0 	\
			TIM1_SetCounter(0);\
			TIM1_ICInit(TIM1_CHANNEL_3,\
				TIM1_ICPOLARITY_FALLING,\
				TIM1_ICSELECTION_DIRECTTI, TIM1_ICPSC_DIV4, 0);\
			TIM1_ClearITPendingBit(TIM1_IT_CC3);

#define TIMER_EDGE_SET_1 	\
			TIM1_SetCounter(0);\
			TIM1_ICInit(TIM1_CHANNEL_3,\
		   	TIM1_ICPOLARITY_RISING,\
		   	TIM1_ICSELECTION_DIRECTTI, TIM1_ICPSC_DIV4, 0);\
			TIM1_ClearITPendingBit(TIM1_IT_CC3);
			
#else

#define TIMER_EDGE_SET_0 	\
			TIM2_ClearITPendingBit(TIM2_IT_CC1);\
			TIM2_SetCounter(0);\
			TIM2_ICInit(TIM2_CHANNEL_1,\
			TIM2_ICPOLARITY_FALLING,\
			TIM2_ICSELECTION_DIRECTTI, TIM2_ICPSC_DIV1, 0x0);

#define TIMER_EDGE_SET_1 	\
			TIM2_ClearITPendingBit(TIM2_IT_CC1);\
			TIM2_SetCounter(0);\
			TIM2_ICInit(TIM2_CHANNEL_1,\
		   	TIM2_ICPOLARITY_RISING,\
		   	TIM2_ICSELECTION_DIRECTTI, TIM2_ICPSC_DIV1, 0x0);
#endif

#define TYPE_1Phase			0
#define TYPE_12Phase		1
#define TYPE_2Phase			2
#define EXCITATION_TYPE		TYPE_12Phase

typedef struct tagIoDef
{
	GPIO_TypeDef	*port;
	GPIO_Mode_TypeDef	pin;
}	IODEF, *LPIODEF;

// 20180610 MD24 NEW
IODEF	IO_LED = { GPIOB, GPIO_PIN_4 };
IODEF 	IO_ORG = { GPIOA, GPIO_PIN_1 };

// Test code for pwmic t1 ch2-ch1
//IODEF	IO_X1 = { GPIOC, GPIO_PIN_7 };
//IODEF	IO_X2 = { GPIOC, GPIO_PIN_6 };

IODEF	IO_X1 = { GPIOA, GPIO_PIN_3 };
IODEF	IO_X2 = { GPIOD, GPIO_PIN_6 };



IODEF	IO_Y1 = { GPIOC, GPIO_PIN_5 };
IODEF	IO_Y2 = { GPIOA, GPIO_PIN_2 };

IODEF	IO_ADJ = { GPIOC, GPIO_PIN_4 };			//MD24, In - Ref Vol
IODEF	IO_SEN = { GPIOD, GPIO_PIN_2 };			//MD24, In - Motor Current Sensing
IODEF	IO_POWER = { GPIOD, GPIO_PIN_5 };		//MD24, In - Vcc(12/24/Drop) 

IODEF	IO_MOD = { GPIOD, GPIO_PIN_4 };
IODEF	IO_BAT = { GPIOD, GPIO_PIN_3 };
IODEF	IO_BOOST = { GPIOD, GPIO_PIN_6 };
IODEF	IO_CHARGE = { GPIOA, GPIO_PIN_3 };

#define IODEF_RESET(io,_port,_pin)	IO_##io.port = GPIO##_port; IO_##io.pin = GPIO_PIN_##_pin;

#define LightOn				GPIO_WriteLow(IO_LED.port, IO_LED.pin);
#define LightOff			GPIO_WriteHigh(IO_LED.port, IO_LED.pin);
#define LightToggle 		GPIO_WriteReverse(IO_LED.port, IO_LED.pin);			

#define MotorOrigin()		GPIO_ReadInputPin(IO_ORG.port, IO_ORG.pin);
#define ModeSelect()		GPIO_ReadInputPin(IO_MOD.port, IO_MOD.pin)

#define _H_X1				GPIO_WriteHigh(IO_X1.port, IO_X1.pin);	
#define _H_X2				GPIO_WriteHigh(IO_X2.port, IO_X2.pin);	
#define _H_Y1				GPIO_WriteHigh(IO_Y1.port, IO_Y1.pin);	
#define _H_Y2				GPIO_WriteHigh(IO_Y2.port, IO_Y2.pin);	
#define _L_X1				GPIO_WriteLow(IO_X1.port, IO_X1.pin);	
#define _L_X2				GPIO_WriteLow(IO_X2.port, IO_X2.pin);	
#define _L_Y1				GPIO_WriteLow(IO_Y1.port, IO_Y1.pin);	
#define _L_Y2				GPIO_WriteLow(IO_Y2.port, IO_Y2.pin);	

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

uint16_t CPulse( uint8_t step )
{
	return (uint16_t)step * 26;  // 20180509  change to 5200 pulse
}

uint8_t  Diff(uint16_t time, uint16_t diff)				
{
	uint16_t _t = time<=Ticks_1mS ? Ticks_1mS - time : 0xffff - time + Ticks_1mS;
	return _t > diff ? 1 : 0;
}

uint16_t	stepPrepare(uint8_t i)
{
	dutyInfo.s -= dutyInfo.b[i];
	dutyInfo.b[i] = Pwm.Duty;
	dutyInfo.s += dutyInfo.b[i];
	return dutyInfo.s;
}

uint8_t	stepCalc(uint16_t duty)
{
	uint16_t t;
	if ( dutyInfo.n < 16 )
		dutyInfo.n ++;
	t = (duty / dutyInfo.n) * 2 + 1;	
	t /= 2;
	if( t < 20 )	t = 20;
	if( t > 180 )	t = 180;
						 
	t = (625 * t)/10 -1250;		//  y  = 6.25 x - 1.25  20,0  to  180, 200
	t = (t / 25 + 1 ) /	2;

	Drive.PreStep = Drive.Step;
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
#if defined (_DEBUG_MOTOR_WATCH_)
	motorWatch.step[motorWatch.i] = tPos;
	motorWatch.i = (motorWatch.i + 1) % MAX_MOTORWATCH;
	motorWatch.step[motorWatch.i] = 0;
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

uint8_t	ZeroPos(void)
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
	/*Timer.Motor = Ticks_1mS;*/
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
		MotorClose();
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
		Drive.Overrun = Drive.ZeroOffset = Drive.Position = Drive.Target = 0;
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
		IODEF_RESET(LED, B, 1);
		IODEF_RESET(ORG, B, 1);
		IODEF_RESET(X1, B, 1);
		IODEF_RESET(X2, B, 1);
		IODEF_RESET(Y1, B, 1);
		IODEF_RESET(Y2, B, 1);

		IODEF_RESET(ADJ, B, 1);
		IODEF_RESET(SEN, B, 1);
		IODEF_RESET(POWER, B, 1);
		IODEF_RESET(MOD, B, 1);
		IODEF_RESET(BAT, B, 1);
		IODEF_RESET(BOOST, B, 1);
		IODEF_RESET(CHARGE, B, 1);
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
		ADC1_SCHMITTTRIG_CHANNEL2 };

uint8_t	_chanId[] = { 1, 2, 3, 4, 0 };
//uint8_t	_chanId[] = { 2, 2, 4, 4, 0 };

void	AdcGetCode(uint8_t ch)
{
#if defined (_DEBUG_ADC_SUM_)
	uint8_t i = Adc.buf[ch].i;
	Adc.buf[ch].i = (i + 1) % MAX_ADC_BUF;
#else
	uint8_t i = 0;
#endif
	Adc.buf[ch].b[i] = ADC1_GetConversionValue();
}

void Adc_Config(void)
{
	AdcGetCode(Adc.ch);
	Adc.ch = _chanId[Adc.ch];
	//@ Check Type
	if( Drive.DeviceType == TYPE_MD24 )
	{		
		if( Adc.ch == 1 )
			Adc.ch = 2;
		if( Adc.ch == 3 )
			Adc.ch = 4;
	}
		
	ADC1_DeInit();
	ADC1_Init(ADC1_CONVERSIONMODE_SINGLE, 
		_chan[Adc.ch], 
		ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, 
		_chanSchmit[Adc.ch],
	   	DISABLE
		);
	ADC1_StartConversion();		
}

void	AdcGetAvg(uint8_t ch)
{
#if defined (_DEBUG_ADC_SUM_)
	uint8_t i;
	uint16_t s = 0;
	for( i=0; i<MAX_ADC_BUF; i++ )
		s += Adc.buf[ch].b[i];
	Adc.buf[ch].avg = (s>>2) / MAX_ADC_BUF;
#else
	Adc.buf[ch].avg = Adc.buf[ch].b[0]>>2;
#endif
}

void AdcService(uint8_t ch)
{
	if( Ticks_50uS >= 10 )
	{
		//	500us
		Drive.Origin = !MotorOrigin();
	}

	if( Diff(Timer.Adc, 10) != 1 )
		return;
	Timer.Adc = Ticks_1mS;

	Adc_Config();
	AdcGetAvg(ch);	//	Adc.buf[ch].avg
	if( Drive.DeviceType == TYPE_MD24 )
	{
		//	ch3/4/2, Power,Sense,Adjust
		if( ch == 0 ) { }
		else if( ch == 1 ) { }
		else if( ch == 2 ) { }
	}
	else
	{
		if( ch == 0 ) { }
		else if( ch == 1 ) { }
		else if( ch == 2 ) { }
		else if( ch == 3 ) { }
		else if( ch == 4 ) { }
	}
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
	//TIM4_ClearITPendingBit(TIM4_IT_UPDATE);
	TIM4_ClearFlag(TIM4_IT_UPDATE);
}

void OnCaptureOVTim2(void)
{
	//if ( TIM2_GetITStatus( TIM2_IT_UPDATE)  != SET ) 
	//	return;
	//Pwm.T1 = Pwm.T10 = 0u;		
#if defined(_DEBUG_TIM1_)
	//TIM1_PrescalerConfig(0x02, TIM1_PSCRELOADMODE_UPDATE);
	//TIM1_SetCounter(0xffff);
	Pwm.Overflow = 1;
	TIM1_ClearITPendingBit(TIM1_IT_UPDATE);
#else
	TIM2_ClearITPendingBit(TIM2_IT_UPDATE);
#endif
}	

void OnCaptureTim2(void)
{
#if defined (_PWM_TIMER_MODE_)
	if( TIM1_GetITStatus(TIM1_IT_CC1) == SET )
	{
		Pwm.T1 = TIM1_GetCapture1();	
		TIM1_InterruptClear(TIM1_IT_CC1)
	}
	if( TIM1_GetITStatus(TIM1_IT_CC2) == SET ) 
	{
		Pwm.T2 = TIM1_GetCapture2();	
		TIM1_InterruptClear(TIM1_IT_CC2)
		TIM1_SetCounter(0u);
		Pwm._t1 = Pwm.T1;
		Pwm._t2 = Pwm.T2;
		if ( Pwm.Overflow )
		{	
			Pwm._t1 = 0;
			Pwm.Overflow = 0;
		}
		else
		{
			Pwm.Calc = 1;
		}	
	}
#else
	if( GET_ITSTATUS == SET )
	{
		if ( Pwm.Edge == 0 ) 
		{	
			Pwm.T1 = GET_CAPTURECOUNT;	
			TIMER_EDGE_SET_0
			Pwm.Edge = 1;
		}	
		else
		{
			Pwm.T2 = GET_CAPTURECOUNT;	
			TIMER_EDGE_SET_1
			Pwm.Edge = 0; 
			Pwm.Calc = 1;
			
			
			//Pwm.sT = Pwm.T1 +Pwm.T2;
		}
		//TIM1_SetCounter(0);
	}
#endif
}

void Timer_Config(void)
{
//	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);

//  Test code for timer 100uS
//	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32);  //  16 * 0x32 = 50uS  Ticks, 0x64-100us 
	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x64);  //  16 * 0x32 = 50uS  Ticks, 0x64-100us 
  	
		
	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
  TIM4_Cmd(ENABLE);

#if defined(_DEBUG_TIM1_)
//	TIM1_PrescalerConfig(0x10, TIM1_PSCRELOADMODE_UPDATE);
//	TIM1_TimeBaseInit(TIM1_PRESCALER_4, TIM1_COUNTERMODE_UP, 
//		0xffff);	//	4 -> 0.25us
//	TIM1_TimeBaseInit(/*TIM4_PRESCALER_4*/0, TIM1_COUNTERMODE_UP, 0xffff, 1); 
	//timer freq = (clock CPU/16) -> 1bit = 1uS -> 92*1uS=92uS 
//	TIM1_ICInit(TIM1_CHANNEL_1, TIM1_ICPOLARITY_RISING, TIM1_ICSELECTION_DIRECTTI,
//		TIM1_ICPSC_DIV1, 0);
//	TIM1_ClearFlag(TIM1_FLAG_CC3);
#else
	TIM2_TimeBaseInit(TIM2_PRESCALER_4, 0xffff);	//	4 -> 0.25us
#endif

#if defined (_PWM_TIMER_MODE_)

#if defined(_DEBUG_TIM1_)
	CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER1, ENABLE);
//	TIM1_PrescalerConfig(0, TIM1_PSCRELOADMODE_UPDATE);
//	TIM1_PWMIConfig(TIM1_CHANNEL_1, 
	TIM1_TimeBaseInit(0x02, TIM1_COUNTERMODE_UP, 
		0xffff, 0);	//	4 -> 0.25us
	TIM1_PWMIConfig(TIM1_CHANNEL_2, 
			//TIM1_ICPOLARITY_FALLING, 
			TIM1_ICPOLARITY_RISING, 
			TIM1_ICSELECTION_DIRECTTI, 
			TIM1_ICPSC_DIV1, 0);//ENABLE);//ICFilter);
	TIM1_SelectInputTrigger(TIM1_TS_TI1FP1);
	TIM1_SelectSlaveMode(TIM1_SLAVEMODE_RESET);
	TIM1_ITConfig(TIM1_IT_UPDATE | TIM1_IT_CC1 | TIM1_IT_CC2, ENABLE);
	TIM1_SetCounter(0xffff);
	TIM1_Cmd(ENABLE);
#endif

#else

	TIMER_EDGE_SET_0	//	TIM2_Init()
#if defined(_DEBUG_TIM1_)
	//TIM1_ITConfig(TIM1_IT_UPDATE | TIM1_IT_CC3, ENABLE);
	//TIM1_Cmd(ENABLE);
#else
	//TIM2_ITConfig(TIM2_IT_UPDATE | TIM2_IT_CC1, ENABLE);
	//TIM2_Cmd(ENABLE);
#endif

#endif
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
#if defined(_DEBUG_TIME_ELAPSED_)
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
#endif
}

void main(void)
{
	double dt;
	uint8_t		channel = 0;
	uint16_t	_t1, _t2;
	uint32_t	_t;
	uint16_t 	_tt;
	Drive.Enabled = TRUE;
	Drive.MaxOverrun = OVERRUN;
	Drive.Position = Drive.Stage = 0;
	Drive.Dir = nMotorClose;
	Drive.Interval = 15;	//	for 24V 35RD Motor sample #1/2/3 = 12/11/14u
	
	Ticks_1mS = Ticks_50uS = Pwm.Edge = 0;

	Clock_Config();
	Gpio_Config();
	Timer_Config();
	
	Adc.ch = 2;
	Adc_Config();

	dutyInfo.s = dutyInfo.i = 0;
	Pwm.Calc = Pwm.Edge = 0;
	Pwm.Update = 1;

	enableInterrupts();
	waitPowerDelay();
	if ( Drive.Origin ) 
	{
		Drive.Position = 0;
		StartDriveOR( CPulse(MAX_MOTOR_POS), OFFSET_OVERRUN);
		
		while ( Drive.Run )
			motorGo();
	}
	else
		Drive.Position = CPulse(MAX_MOTOR_POS + 5);

	Timer.Led = /*Timer.Motor = */Timer.Adc = Ticks_1mS;
	Drive.Run0 = Drive.Run;

	if( Drive.DeviceType == TYPE_MD12 )
		mainDeviceType();

	while (1)
	{
		LightControl(Ticks_1mS);

		if ( Drive.Stage == 0 )
		{
			Drive.Stage = ZeroPos();
		}
		else
		{
			if( Pwm.Update == 0 )
			{
				AdcService(channel);
			}

			if ( Diff(Timer.PwmUpdate, MAX_TIMEOUT) == 1 )
			{
				Timer.PwmUpdate = Ticks_1mS;		
				Drive.Step = 0;
				Pwm.Update = 0;
			}
			else
			{
				Pwm.Update = 1;
			}
		}
		if( Pwm.Calc == 1 )
		{
			Pwm.Calc = 0;
			//_t1 = Pwm.T1;
			//_t2 = Pwm.T2;
			
			while ( Pwm._t2 > 0xff )
			{
				Pwm._t1 >>= 1;
				Pwm._t2 >>= 1;
			}
			
			dt = 100. * Pwm._t1 / ( Pwm._t2);
			Pwm.Duty100 = (uint16_t)dt;
			Pwm.Duty = Pwm.Duty100 / 100 * MAX_MOTOR_POS / 100; 
			Drive.Step = stepCalc(Pwm.Duty);
		  //stepPrepare(dutyInfo.i);
			Timer.PwmUpdate = Ticks_1mS;		
		}

		motorGo();
	}
}

#ifdef USE_FULL_ASSERT
void assert_failed(uint8_t* file, uint32_t line) { uint8_t i; while (1) i++; }
#endif

