/**
  ******************************************************************************
  * @file main.c
  * @brief This file contains the main function for Discover example.
  * @author STMicroelectronics - MCD Application Team
  * @version V1.0.0
  * @date 24/11/2011
  ******************************************************************************
  *
  * THE PRESENT FIRMWARE WHICH IS FOR GUIDANCE ONLY AIMS AT PROVIDING CUSTOMERS
  * WITH CODING INFORMATION REGARDING THEIR PRODUCTS IN ORDER FOR THEM TO SAVE
  * TIME. AS A RESULT, STMICROELECTRONICS SHALL NOT BE HELD LIABLE FOR ANY
  * DIRECT, INDIRECT OR CONSEQUENTIAL DAMAGES WITH RESPECT TO ANY CLAIMS ARISING
  * FROM THE CONTENT OF SUCH FIRMWARE AND/OR THE USE MADE BY CUSTOMERS OF THE
  * CODING INFORMATION CONTAINED HEREIN IN CONNECTION WITH THEIR PRODUCTS.
  * FOR MORE INFORMATION PLEASE READ CAREFULLY THE LICENSE AGREEMENT FILE LOCATED 
  * IN THE ROOT DIRECTORY OF THIS FIRMWARE PACKAGE.
  *
  * <h2><center>&copy; COPYRIGHT 2009 STMicroelectronics</center></h2>
  * @image html logo.bmp
  ******************************************************************************
  */

/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "main.h"
#include "stm8s_clk.h"
#include "stm8s_tim2.h"

/**
  * @addtogroup TIM4_TimeBase_InterruptConfiguration
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/

//const u8 iii[1500];

u16 Counter;
u16 PeriodNumber = 0;

u16 tt;
u16 t2;
u8 update;
u16 Dif;
u8 Duty[16];
u8 iDuty;
u16 sDuty;
u8 nDuty=0;
u16 mDuty;

volatile uint32_t Ticks_50uS;
volatile uint16_t Ticks_1mS;
uint16_t Ticks2_1mS;
uint32_t Ticks_S;

u16 ledint;

//   10v to 26V
u8 TableInterval[17] = { 65,56,50,45,40,36,32,29,26,23,21,19,17,16,15,14,13};
#define IntervalSlope (57/2)

struct {
	uint8_t Enabled 		: 1;
	uint8_t Run 				: 1;
	u8 Run0							: 1;
	uint8_t LastOrigin 	: 1; 
	uint8_t Stop				: 1;	
	uint8_t Dir					: 1;
	
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
	u8 ExcitationType;
	u8 Origin;
	u8 NormalOpen;
	u8 Step;
	u8 PreStep;
	u8 DiffStep;
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


/*
struct {
	uint8_t ID;
	uint8_t ErrNo;
	uint16_t Step;				
	uint16_t Pulse;
	uint16_t TmrDrive_1mS;
	uint8_t IsRxSend;			// is Send Packet ?
	uint8_t DipSW;
	uint8_t PacketLen;
	uint8_t Mode;			
} My;		
*/
// Run, Test, Test JIG


struct {
	u16 Value[MAX_ADC];
	u8 Idx;
	u8 IAvg[MAX_ADC];
	u8 IdxAvg;
	u8 Average;
	u16 Sum;
} Adc;

struct {
	u16 Led;
	u16 Motor;
	u16 Adc;
//	u16 Boost;
	u16 MotorDelay;
	u16 PwmUpdate;
} Timer;

uint16_t PowerDelay_1mS=499;

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
void TIMER_Configuration(void);
void Blinking_StateMachine(void);

uint16_t CStep( uint16_t pulse );
uint16_t CPulse( uint16_t step );

void ExOff(void);

void Excitation_1Phase( void );
void Excitation_12Phase( void );
void Excitation_2Phase( void );
void DriveService(void);
void StartDriveOR( uint16_t Target, uint8_t overrun );
u8 Interval( u16 Vmon);
void StopDrive(void);			//TROff()


void OnTimer4(void);
void OnCaptureTim2(void);
void OnCaptureOVTim2(void);

void Clock_Config(void);
void Gpio_Config(void);
static void Adc_Config( void );
void TIM2_Config(uint8_t Edge);
static void Timer4_Config(void);

u8 Diff( u16 Time, u16 diff );
u8 SAbs(u8 s1, u8 s2);

void LedService(void);
void AdcService(void);
void MotorService(void);


/* Public functions ----------------------------------------------------------*/
/**
  * @brief Example firmware main entry point.
  * @par Parameters:
  * None
  * @retval
  * None
  */
	


/*
gear ration 1/59.96
pulse = Step(200) * 24 300Deg   ---> pulse = Step(200) * 24 325Deg
*/

u8 min = 200;
u16 mStep[32]; 	// buffer for watching 
u8 iStep;
u32 mVal;

void main(void)
{
	
	
	Ticks_1mS = 0;
	Ticks_50uS = 0;

	Clock_Config();
	Gpio_Config();
	//StopDrive();
	Timer4_Config();
	
	Adc.Idx = 2;
	Adc_Config(  );

	//Drive.NormalOpen = 1;
	Drive.Enabled = ENABLED;
	Drive.MaxOverrun = OVERRUN;				// Zero position over run
	//Drive.Interval = PULSE_INTERVAL_mS;		// Pulse interval	
	Drive.Timeout_1S =  VALVE_TIMEOUT_S;	// Valve timeout

	Drive.Position = 0;
	Drive.Dir = nMotorClose;
	Drive.Interval = 12u;	//	for 24V 35RD Motor sample #1
	//Drive.Interval = 11u;	//	for 24V 35RD Motor sample #2
	//Drive.Interval = 14u;	//	for 24V 35RD Motor sample #3
	
	Drive.Stage = 0;		// Not Initialized
	
	
	
	
	Drive.ExcitationType = 1;		//12 excition
/*
	TIM2_PRESCALER_1  = ((uint8_t)0x00),
  TIM2_PRESCALER_2    = ((uint8_t)0x01),
  TIM2_PRESCALER_4    = ((uint8_t)0x02),
  TIM2_PRESCALER_8     = ((uint8_t)0x03),
  TIM2_PRESCALER_16   = ((uint8_t)0x04),
  TIM2_PRESCALER_32     = ((uint8_t)0x05),
  TIM2_PRESCALER_64    = ((uint8_t)0x06),
  TIM2_PRESCALER_128   = ((uint8_t)0x07),
  TIM2_PRESCALER_256   = ((uint8_t)0x08),
  TIM2_PRESCALER_512   = ((uint8_t)0x09),
  TIM2_PRESCALER_1024  = ((uint8_t)0x0A),
  TIM2_PRESCALER_2048 = ((uint8_t)0x0B),
  TIM2_PRESCALER_4096   = ((uint8_t)0x0C),
  TIM2_PRESCALER_8192 = ((uint8_t)0x0D),
  TIM2_PRESCALER_16384 = ((uint8_t)0x0E),
  TIM2_PRESCALER_32768 = ((uint8_t)0x0F)
	*/
	Pwm.Prescaler = TIM2_PRESCALER_8;
	
	TIM2_DeInit();	
	TIM2_TimeBaseInit( Pwm.Prescaler, 0xffff );
	TIM2_ITConfig( TIM2_IT_UPDATE | TIM2_IT_CC1, ENABLE);
	TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_RISING, TIM2_ICSELECTION_DIRECTTI,
               TIM2_ICPSC_DIV8, 0x0 );		//  16MHz /8 = 2MHz
	TIM2_Cmd(ENABLE);
	
	enableInterrupts();

	Pwm.Edge = 0;
		
	StopDrive();

  GPIO_WriteLow(_LED_PORT, _LED_PIN);		// Led on
		
	while ( Ticks_1mS < PowerDelay_1mS )		// Delay Power ON
		;

  GPIO_WriteHigh(_LED_PORT, _LED_PIN);		// Led off
	
	// For Speed Test 
	#ifdef _SPEEDTEST_
		Drive.T1_1mS = Ticks_1mS;
		StartDriveOR( 4800u, 0u  );				// Goto Zero position
	
		while (Drive.Run)				// Wait while motor is running
			;	

		Drive.T2_1mS = Ticks_1mS;
		Drive.Run0 = Drive.Run;
	#endif
	// For Speed Test  End
	
	if ( Drive.Origin ) 
	{
		Drive.Position = 0;
		StartDriveOR( CPulse(200u), 0u  );				// Goto Zero position
		
		while (Drive.Run)				// Wait while motor is running
			;			
	}
	else
	{
		Drive.Position = CPulse(205u);
	}
	
	
	Timer.Led = Ticks_1mS;
	Timer.Motor = Ticks_1mS;
	Timer.Adc = Ticks_1mS;
  //Timer.Boost = Ticks_1mS;

  ledint = 1000u;
	
	while (1)
  {
		tt = Ticks_1mS;
		
		if ( Diff ( Timer.Led, ledint ) )
		//if ( (tt-Timer.Led) > 500 )
		{
			Timer.Led = Ticks_1mS;
			GPIO_WriteReverse(_LED_PORT, _LED_PIN);			
		}
	
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
		
		
		if ( Drive.Stage == 0 )	//	Init
		{
			if ( Drive.Run == 0 )
			{
				if ( Drive.Origin == 1 )
				{
					Drive.Stage = 1;
				}
				else
				{
					StartDriveOR( 0u, 0u  );				// Goto Zero position
				}
			}
			
		}		//	End state 0	
		else if ( Drive.Stage == 1 )	// Running 
		{
			if ( Diff ( Timer.Motor, 200u ) != 0 )
			//if ( (tt-Timer.Motor) > 1000 )
			{
				if ( Diff ( Timer.PwmUpdate, 2000u ) != 0 )
				{
					Drive.Step = 0;
					//Drive.PwmDuty = 0;
					
					if ( Ticks_1mS > 2000 )
						Timer.PwmUpdate = Ticks_1mS-2000;
					else  	
						Timer.PwmUpdate = 65535 - 2000 + Ticks_1mS;						
				}
				else
				{
					//Drive.Step = Drive.PwmDuty;
					if ( nDuty < 8 )
						nDuty ++;
						
					if (iDuty < 7)
					{
						iDuty++;
					}
					else
					{
						iDuty = 0;
					}
					
					sDuty -= Duty[iDuty];
					Duty[iDuty] = Pwm.Duty;
					sDuty += Duty[iDuty]; //Drive.Step; 
					
					mDuty = (sDuty / nDuty)*2 + 1;		// Round Up
					mDuty /= 2;
					
					//Drive.Step = mDuty;
					
					//	Range Check 
					if (mDuty <20)
					   mDuty = 20;
					if (mDuty >180)
					  mDuty = 180; 
						 
					disableInterrupts();		//****************************************************************
					mVal  =  (625u * (u32)mDuty);
					mVal /= (10u);
					mVal -= 1250u ;
					mVal = mVal /(u32)50u;
					mVal += 1u;
					mVal /= 2u;
					enableInterrupts();			//*****************************************************************
					
					Drive.Step = (u8)mVal*2;
					
					//if ( Drive.Step < min )
					//	min = Drive.Step;
				}
								
				MotorService();
				Timer.Motor = Ticks_1mS;				
			}
			if ( Drive.Run == 1 )
			{
				//ledint = 500u;
			}
			else 
			{
				//ledint = 250u;
			}
		}
				
		
		while ( Diff ( tt, 50u ) == 0 )
		//while ( (tt-Ticks_1mS) < 10 )
			;
	}
}


void MotorService()
{
	//if ( Diff ( Timer.Motor, 500u ) )
		{
			//GPIO_WriteReverse(_LED_PORT, _LED_PIN);
			//Drive.Step = ((u16)Adc.Average * 100 )/110; 
			
			if ( Drive.Step > 205u )
				Drive.Step = 205u;
			if ( Drive.Step < 20u )
				Drive.Step = 0u;
				
			//Drive.Target = CPulse(Drive.Step);
			//if  ( SAbs( Drive.Step ,Drive.PreStep ) > 1 )
			//	StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );
						
			//if ( Drive.Step != Drive.PreStep   )
			
			//if  ( SAbs( Drive.Step ,Drive.PreStep ) > 1 )
			{		
				if ( Drive.Run ) 	//&& Timer.MotorUpdate != 1 ) 
				{
					if ( 1 )			// same dir
					{	
						Drive.PreStep = Drive.Step;
						StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );
					}
					else			   	// Reverse direction
					{
						Drive.Stop = 1;			
					//Drive.PreStep = Drive.Step;
					//Timer.MotorUpdate = 1;
					//Timer.MotorDelay  = Ticks_1mS;
					}
				}
				else
				{
					Drive.PreStep = Drive.Step;
					StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );					
				}
			}
			
			Timer.Motor = Ticks_1mS;
		}
	}


void AdcService()
{
	if ( Diff ( Timer.Adc, 10u )== 1 )
		{
			Adc.Sum = Adc.Sum - Adc.IAvg[Adc.IdxAvg];
			Adc.IAvg[Adc.IdxAvg] = Adc.Value[0]>>2 ;
			Adc.Sum = Adc.Sum + Adc.IAvg[Adc.IdxAvg];
			Adc.Average = Adc.Sum /5;
			if  (Adc.IdxAvg	>= 4 )
				Adc.IdxAvg = 0;
			else
				Adc.IdxAvg++;
				
			Timer.Adc = Ticks_1mS;
		}
}

//void LedService()
//{

//}

u8 SAbs(u8 s1, u8 s2)
{
	if (s1 > s2 )
		return s1 - s2;
	else
		return s2 - s1;
}
	
	
u8  Diff( u16 time, u16 diff )
{
	u16 t0;
	t0 = Ticks_1mS;
	
	if (time <= t0 )
	{
		Dif = t0 - time;
		if ( ( t0 - time ) > diff ) 
		{
			return 1u;
		}
		else
		{
			return 0u;
		}
	}
	
	
	//else	// 	t < time
	if (time > t0 )
	{
		Dif = 0xffff - time + t0;
		if ( ( 0xffff - time + t0  ) > diff ) 
		{
			return 1u;
		}
		else
		{
			return 0u;
		}
	}
}


OnTimer_1S(void)
{

}


//extern u8 Table[];
u16 pos;
u8 pos2;

u8 cvtTable(u8 i);

OnTimer_1mS(void)
{ 

	Ticks_1mS++;
	
	//Adc_Config( );
	
	if ( PowerDelay_1mS )
		PowerDelay_1mS--;
}

/*   Timer Callback function every 50uS		*/
void OnTimer4(void)
{
	Adc_Config(  );
	
	Drive.Origin =   ! GPIO_ReadInputPin(_ORG_PORT, _ORG_PIN);
	
	if (  Ticks_50uS < 19 )
		Ticks_50uS++;
	else
	{
		Ticks_50uS = 0;
		OnTimer_1mS();
	}
		
		
	if ( Drive.Ticks > 0 )
		Drive.Ticks--;
	else if ( Drive.Enabled ) // &&  ( Drive.Ticks == 0 ) ) 
	{
		DriveService();	
		Drive.Ticks = Drive.Interval;
	}	
}

void OnCaptureOVTim2(void)
{
	if ( TIM2_GetITStatus( TIM2_IT_UPDATE)  != SET ) 
		return;
	//Drive.PwmT4 = TIM2_GetCapture1();
	if ( Pwm.CntOverflow < 0xff )
		Pwm.CntOverflow++;
	
	TIM2_ClearITPendingBit(TIM1_IT_UPDATE);
}


/*
void ChangePrescale(void)
{
	if ( Drive.Prescaler > 4)
	{
		if ( Drive.PwmT3 > 30000 ) 
		   Drive.Prescaler--;
	}
	else if (  Drive.Prescaler < 9 )
	{
		if ( Drive.PwmT3 < 3000 ) 
		   Drive.Prescaler++;
	}
}
*/


void OnCaptureTim2(void)
{
	if ( TIM2_GetITStatus( TIM2_IT_CC1) != SET ) 
		return;
		
	if ( Pwm.Edge == 0 ) 
	{		
		Pwm.T2 = TIM2_GetCapture1();
		TIM2_ClearITPendingBit(TIM1_IT_CC1);
		Pwm.Edge = 1;
		//TIM2_Config( Drive.PwmEdge );
		TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_FALLING, TIM2_ICSELECTION_DIRECTTI,
               TIM2_ICPSC_DIV8, 0x0) ;
		
		if ( Pwm.T2 > Pwm.T1 ) 
		{
			if ( Pwm.CntOverflow == 0 )
			{
				Pwm.T4 = Pwm.T2 - Pwm.T1;
			}
			else
			{
				Pwm.T4 = 0xffff;
			}
			//Drive.PwmDuty = Drive.PwmT2 - Drive.PwmT1;
		}
		else		
    {
			if ( Pwm.CntOverflow == 1 )
			{
				Pwm.T4 = 0xffff - Pwm.T1 + Pwm.T2;
			}
			else
			{
				Pwm.T4 = 0xffff;
			}
			Pwm.CntOverflow = 0;
			//Drive.PwmDuty = 0xffff - Drive.PwmT1 + Drive.PwmT2;
    }
		
		//Drive.PwmT3 = Drive.PwmT2 + Drive.PwmT1 ;
		//Drive.PwmDuty = (Drive.PwmT1 * (uint32_t)400 /  Drive.PwmT2) + 1 ;
		if ( Pwm.T3 == 0xffff || Pwm.T4 == 0xffff )
		{
			Pwm.Duty = 0u;
		}
		else
		{
			Pwm.Duty = ( Pwm.T3 * (uint32_t)400 / ( Pwm.T3 + Pwm.T4 ) ) + 1 ;
			Pwm.Duty /= 2;
		}
		
		Timer.PwmUpdate = Ticks_1mS;		
	}	
	else
	{
		Pwm.T1 = TIM2_GetCapture1();
		TIM2_ClearITPendingBit(TIM1_IT_CC1);
		Pwm.Edge = 0;	
		//TIM2_Config( Drive.PwmEdge );
		TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_RISING, TIM2_ICSELECTION_DIRECTTI,
               TIM2_ICPSC_DIV8, 0x0 );		//  16MHz /8 = 2MHz
							 
		if ( Pwm.T1 > Pwm.T2 ) 
		{
			if ( Pwm.CntOverflow == 0 )
			{
				Pwm.T3 = Pwm.T1 - Pwm.T2;
			}
			else
			{
				Pwm.T3 = 0xffff;
			}
			//Drive.PwmDuty = Drive.PwmT2 - Drive.PwmT1;
		}
		else		
    {
			if ( Pwm.CntOverflow == 1 )
			{
				Pwm.T3 = 0xffff - Pwm.T2 + Pwm.T1;
			}
			else
			{
				Pwm.T3 = 0xffff;
			}
			Pwm.CntOverflow = 0;
    }
	}
		//TIM2_ClearITPendingBit( TIM2_IT_CC1 );	
}


//	OFF all Drive TR 
void StopDrive(void)			//TROff()
{
	GPIO_WriteLow(_X1_PORT, _X1_PIN);
	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
	GPIO_WriteLow(_X2_PORT, _X2_PIN);
	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
}


//
//
//
void StartDriveOR( uint16_t Target, uint8_t overrun )
{
	/*
	if ( (Drive.Target==0) && Drive.Run ) 
		return;	
	if ( Drive.Position == Target )
		return;
	*/
	
	if ( Drive.Run ) return;
	if ( Drive.Position == Target ) return;
		
	mStep[iStep]=Target;//Drive.Step;
				
	if (iStep<31)
	  iStep ++;
	else
		iStep = 0;	
		
	// Drive.Overrun =	0;
	if ( Target == 0 )				//  goto origin
	{
		Drive.Overrun =	0u;
		Drive.ZeroOffset = CPulse( OVER_STEP );
		//Drive.Position += CPulse( OVER_STEP );   	// POSITION;
		Drive.Position += Drive.ZeroOffset;   	// POSITION;
		Drive.Target = 0u;
		//Drive.State = nMotorClose;		// 0;
		Drive.Dir = nMotorClose;		// 0;
	}
	else	
	{
		//if ( Target > MAX_POSITION )
		//	Target = MAX_POSITION;

		if (Drive.Position >= Target)		// Closing
		{
			Drive.Overrun =	0u;
			//Drive.State = nMotorClose;
			Drive.Dir = nMotorClose;
			Drive.Overrun2 = 0u;
			Drive.Target = Target;
			//Drive.State = nMotorClose;		// 0;
		}
		else								// Opening
		{
			//Drive.State = nMotorOpen;	//1;
			Drive.Dir = nMotorOpen;	//1;
			
			//if (My.Mode == CMD_TESTJIG )
			//{
			//	Drive.Overrun2 = 0u;	//(uint8_t)OVERRUN2;		//100;
			//	Drive.Target = Target;	// + OVERRUN2;	//100;
			//}
			//else
			{
				Drive.Overrun2 = overrun;		//100;
				Drive.Target = Target + overrun;	//100;	
			}
		}
	}
			
	Drive.Run = TRUE;
	Drive.Ticks = Drive.Interval;
}


//
//
//
void MotorStep(MOTOR_DIR Dir)
{
	if ( Dir == nMotorClose )
	{
		if ( Drive.Position != 0 ) 
		{
			Drive.Position--;
			if ( Drive.NormalOpen )
				Drive.Phase++;   // NC
				//Drive.Phase--;
			else
				Drive.Phase--;	//NC
				//Drive.Phase++;
		}
		//else
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
	else							// Find hall ic position
	{
		//if (  Drive.Position < MAX_POSITION )
			Drive.Position++;
			
		if ( Drive.NormalOpen )
				Drive.Phase--;
			else
				Drive.Phase++;
				
		//Drive.Phase++;
		if ( Drive.Origin ) 
		{			
			Drive.ORGPosition = Drive.Position;
			Drive.LastOrigin = TRUE;
		}
		else
			if ( Drive.LastOrigin )
			{			
				Drive.MaxOverrun  = Drive.ORGPosition - HALL_THRESHOLD;	
				if ( Drive.MaxOverrun > OVERRUN )
					Drive.MaxOverrun = OVERRUN;				
			}
			//50 : hall IC threshold
	}
	
	if ( !Drive.Run ) return;
	if ( !Drive.Enabled ) return;
	switch ( Drive.ExcitationType )
	{
		
		case 0:
			//Excitation_1Phase();	
			break;
		case 1:
			Excitation_12Phase();
			break;
		case 2:
			//Excitation_2Phase();
			break;
		
	}
	
	
}

//
//
//
void MotorClose(void)
{
	if ( Drive.Origin )   		// Hall IC Sensing 
	{	
		if ( Drive.Overrun >= Drive.MaxOverrun ) //	max overrun
		{
			Drive.Target = 0u;
			Drive.Position = 0u;
			Drive.Overrun = 0u;
			Drive.ZeroOffset = 0u;
			Drive.Run = FALSE;			
			StopDrive();
		}
		else						// overrun 1 step close
		{
			Drive.Overrun++;
			MotorStep(nMotorClose);
		}
	}
	else
		MotorStep(nMotorClose);		// move 1 step close
}

//
//
//
void DriveService(void)
{
	//	20150925  
	/*
	X1 =  0;	//EX[phase % 4].X;
    Y1 =  0;	//EX[phase % 4].Y;
    X1_ = 0;	//EX[phase % 4].X_;
    Y1_ = 0;	//EX[phase % 4].Y_;
*/
	//ExOff();

	if ( ! Drive.Run ) 
	{
		StopDrive();
		return;	//when Drive is stop 
	}
//	if ( My.PacketLen == 4 && My.Mode == CMD_GOTO && My.TmrDrive_1mS == 0 ) 
// 		return;
//	if ( My.PacketLen == 4 && My.Mode == CMD_GOTOA && My.TmrDrive_1mS == 0 ) 
// 		return;

	if ( Drive.Target > Drive.Position )
	 	MotorStep(nMotorOpen);
	else if ( Drive.Target < Drive.Position )
		MotorClose( );
	else if ( Drive.Target ) 	// on target position
		{
			if ( Drive.Overrun2 )
			{				
				Drive.Target = Drive.Target - Drive.Overrun2;	//   OVERRUN2;	//100;		
				Drive.Overrun2 = 0u;
			}
			else
			{
				Drive.ZeroOffset = 0u;
				Drive.Overrun = 0u;
				Drive.Run = FALSE;
				StopDrive();		
			}
		}
		else					// Origin Error 
		{
			//Drive.Enabled = FALSE;
			Drive.ZeroOffset = 0u;
			Drive.Overrun = 0u;
			Drive.Run = FALSE;
			StopDrive();	
		}		
}


void Excitation_2Phase( void )
{
/*		
	switch (Drive.Phase%8)
	{
		case 0:
		//case 1:
			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
			GPIO_WriteLow(_X2_PORT, _X2_PIN);
			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
			break;		
		case 1:
			GPIO_WriteLow(_X1_PORT, _X1_PIN);
			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
			break;
		case 2:
			GPIO_WriteLow(_X1_PORT, _X1_PIN);
			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
			break;
		case 3:  
			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
			GPIO_WriteLow(_X2_PORT, _X2_PIN);
			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
			break;
			
		case 4:
			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
			GPIO_WriteLow(_X2_PORT, _X2_PIN);
			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
			break;		
		case 5:
			GPIO_WriteLow(_X1_PORT, _X1_PIN);
			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
			break;
		case 6:
			GPIO_WriteLow(_X1_PORT, _X1_PIN);
			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
			break;
		case 7:  
			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
			GPIO_WriteLow(_X2_PORT, _X2_PIN);
			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
			break;
			
		default:
			break;
	}
*/	
}


void Excitation_12Phase( void )
{
		
	switch (Drive.Phase%8)
	{
		case 0:
			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
			GPIO_WriteLow(_X2_PORT, _X2_PIN);
			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
			break;
		case 1:
			GPIO_WriteLow(_X1_PORT, _X1_PIN);
			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
			GPIO_WriteLow(_X2_PORT, _X2_PIN);
			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
			break;		
		case 2:
			GPIO_WriteLow(_X1_PORT, _X1_PIN);
			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);
			break;
		case 3:
			GPIO_WriteLow(_X1_PORT, _X1_PIN);
			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
			break;
		case 4:
			GPIO_WriteLow(_X1_PORT, _X1_PIN);
			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
			break;
		case 5: 
			GPIO_WriteLow(_X1_PORT, _X1_PIN);
			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
			GPIO_WriteLow(_X2_PORT, _X2_PIN);
			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
			break;
		case 6:  
			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
			GPIO_WriteLow(_X2_PORT, _X2_PIN);
			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);
			break;
		case 7:
			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
			GPIO_WriteLow(_X2_PORT, _X2_PIN);
			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
			break;
			
		default:
			break;
	}
	
}

void Excitation_1Phase( void )
{
/*	
switch (Drive.Phase%8)
	{
		case 0:
		case 1:
			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
			GPIO_WriteLow(_X2_PORT, _X2_PIN);
			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
			break;		
		case 2:
		case 3:
			GPIO_WriteLow(_X1_PORT, _X1_PIN);
			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
			GPIO_WriteLow(_X2_PORT, _X2_PIN);
			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
			break;
		case 4:
		case 5:
			GPIO_WriteLow(_X1_PORT, _X1_PIN);
			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
			break;
		case 6:
		case 7:
			GPIO_WriteLow(_X1_PORT, _X1_PIN);
			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
			GPIO_WriteLow(_X2_PORT, _X2_PIN);
			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
			break;
			
		default:
			break;
	}
*/
}

/*
u8 Interval( u16 Vmon)
{
	Vmon = Vmon / IntervalSlope;
	
	if (Vmon < 10 ) Vmon = 10;
	if (Vmon > 26 ) Vmon = 26;
	
	return ( TableInterval[ Vmon-10 ] );
	
	/*
	if ( Vmon < 250 ) return 80u;
	if ( Vmon < 287 ) return 65u;
	if ( Vmon < 340 ) return 50u;
	if ( Vmon < 430 ) return 38u;
	if ( Vmon < 515 ) return 28u;
	if ( Vmon < 600 ) return 20u;
	if ( Vmon < 688 ) return 15u;
	return 15u;
	*/
/*	
}
*/


uint16_t CStep( uint16_t pulse )
{
	uint32_t i;
	
	//i = (uint32_t) pulse * 200u / (2400UL);
	i = (uint32_t) pulse * 200u / (2600UL);
	i = (i+1)/2;   				// Round up  20150925
	return (uint16_t) i;
}
   

uint16_t CPulse( uint16_t step )
{
	uint16_t i;
	
    //i= (uint32_t) step *(24UL);
		i= (uint32_t) step *(26UL);  // 20180509  change to 5200 pulse
	//i = (i+1)/2;   				
	return (uint16_t) i;
}

/*





*/

void Clock_Config(void)
{
	//	Clock configuration	  
	CLK_DeInit();
	CLK_HSICmd(ENABLE);
	CLK_LSICmd(DISABLE);
	CLK_HSECmd(DISABLE);
 
	CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
	CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1); 
}


void Gpio_Config(void)
{
	// Configure LED as output push-pull low (led switched on)
  GPIO_Init( _LED_PORT, _LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	//GPIO_WriteHigh( _LED_PORT, _LED_PIN);
		
	//   Motor port
	GPIO_Init(_X1_PORT, _X1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(_X2_PORT, _X2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(_Y1_PORT, _Y1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(_Y2_PORT, _Y2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	
	GPIO_WriteLow(_X1_PORT, _X1_PIN);
	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
	GPIO_WriteLow(_X2_PORT, _X2_PIN);
	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		

	//  Hall sensor port 
  GPIO_Init(_ORG_PORT, _ORG_PIN, GPIO_MODE_IN_FL_NO_IT);
		
	// for ADC3 
	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT );

	GPIO_Init(GPIOD, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
	
	GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT );
	
}

/**
  * @brief  Configures the TIM2 peripheral in PWM Input Mode according to the specified parameters.
    * @param    TIM2_Channel specifies the Input Capture Channel from @ref TIM2_Channel_TypeDef.
  * @param   TIM2_ICPolarity specifies the Input Capture Polarity from @ref TIM2_ICPolarity_TypeDef.
  * @param   TIM2_ICSelection specifies the Input Capture Selection from @ref TIM2_ICSelection_TypeDef.
  * @param   TIM2_ICPrescaler specifies the Input Capture Prescaler from @ref TIM2_ICPSC_TypeDef.
  * @param   TIM2_ICFilter specifies the Input Capture Filter value (value can be an integer from 0x00 to 0x0F).
  * @retval None
  */
/* void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
                     TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
                     TIM2_ICSelection_TypeDef TIM2_ICSelection,
                     TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
                     uint8_t TIM2_ICFilter)
*/										 



	/**
  * @brief  Initializes the TIM2 Time Base Unit according to the specified parameters.
  * @param    TIM2_Prescaler specifies the Prescaler from TIM2_Prescaler_TypeDef.
  * @param    TIM2_Period specifies the Period value.
  * @retval None
  */
//void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
//                        uint16_t TIM2_Period)
	
		
	
/*
void TIM2_Config(uint8_t Edge)
{
	
	if ( Edge == 0 )
		TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_RISING, TIM2_ICSELECTION_DIRECTTI,
               TIM2_ICPSC_DIV8, 0xf);		//  16MHz /8 = 2MHz
	else
		TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_FALLING, TIM2_ICSELECTION_DIRECTTI,
               TIM2_ICPSC_DIV8, 0xf);

	//TIM2_ITConfig(TIM2_IT_CC1, ENABLE);
  //TIM2_Cmd(ENABLE);

	//TIM2_SetCounter(0u);
  /* Clear CC1 Flag*/
  //TIM2_ClearFlag(TIM2_FLAG_CC1);		//Move to Interrupt routine
	/*
}
*/

// 	Timer 4 Configuration
void Timer4_Config(void)
{
  TIM4_DeInit();

  /* Time base configuration */
  //TIM4_TimeBaseInit(TIM4_PRESCALER_64, 0xFA );		//oxfa =  250    16,000,000 / 64/250 = 1000ticks = 1mS
	//TIM4_TimeBaseInit(TIM4_PRESCALER_8, 0xFA );
	//TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0xFA );
	TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x32 );  //  16 * 0x32 = 50uS  Ticks 
	//TIM4_TimeBaseInit(TIM4_PRESCALER_16, 0x64 );  //  16 * 0x64 = 100uS  Ticks 
  /* Enable TIM4 IT UPDATE */
  TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);

  /* Enable TIM4 */
  TIM4_Cmd(ENABLE);
}

//	ADC configuration
static void Adc_Config( void )
{
	
	Adc.Value[Adc.Idx] = ADC1_GetConversionValue();
	ADC1_DeInit();
	
	switch (Adc.Idx)
	{
		case 0:
		  
			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D2, 
								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, DISABLE );
			Adc.Idx = 1;
			break;
		case 1:
			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_4, ADC1_PRESSEL_FCPU_D2, 
								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL4, DISABLE );
			Adc.Idx = 2;
			break;
			
		case 2:
			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_2, ADC1_PRESSEL_FCPU_D2, 
								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
			Adc.Idx = 0;
			break;
			
		default:
			Adc.Idx = 0;
			break;
	}

		ADC1_StartConversion();		
}




#ifdef USE_FULL_ASSERT

/**
  * @brief  Reports the name of the source file and the source line number
  *   where the assert_param error has occurred.
  * @param file: pointer to the source file name
  * @param line: assert_param error line source number
  * @retval
  * None
  */
void assert_failed(u8* file, u32 line)
{
  /* User can add his own implementation to report the file name and line number,
     ex: printf("Wrong parameters value: file %s on line %d\r\n", file, line) */

  /* Infinite loop */
	u8 i;
	
  while (1)
  {
	i = i++;
	}
}
#endif

/**
  * @}
  */

/******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/
