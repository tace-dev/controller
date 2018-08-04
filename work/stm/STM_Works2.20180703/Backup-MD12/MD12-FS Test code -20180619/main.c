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

/*
20171128-2


gear ratio 1/15.55



20171128

interval 15  1-2 phase ex

wait while cap voltage under 4.9V

gear ratio 1/9.18





20171127  interval : 30


20171030

  gear ratio  1 / 9.82 --->  1 / 15.54


20171021 
	초기 시작위치 : 영점이 아니면 최대값의 10%로
	영점이면 초기위치 = 0
	
	0.5초 간격으로 위치정보 update
	
	AD 입력 시간 이동평균 계산 필



*/


/* Includes ------------------------------------------------------------------*/
#include "stm8s.h"
#include "main.h"
#include "stm8s_clk.h"

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

uint8_t Ticks_50uS;
uint16_t Ticks_1mS;
uint16_t Ticks_S;

u16 ledint;

//   10v to 26V
u8 TableInterval[17] = { 65,56,50,45,40,36,32,29,26,23,21,19,17,16,15,14,13};
#define IntervalSlope (57/2)

struct {
	uint8_t Enabled : 1;
	uint8_t Run : 1;
	uint8_t LastOrigin : 1;
	uint8_t Stop			:1 ;	
	uint8_t Dir			:1 ;
	uint16_t Position;			// Current position (pulse)
	uint16_t Target;			// Target Position  (pulse)
	uint16_t Overrun;			// Origin cal overrun (pulse)
	uint8_t Overrun2;			// Valve hysteresis calibration overrun 
	uint16_t ZeroOffset;
	uint8_t Phase;				// motor coil phase
	uint16_t  MaxOverrun;	
	uint16_t  ORGPosition;		// Hall IC origin position
	uint8_t State;	
	uint8_t Interval ;			// Drive interval (mS)
	uint8_t Ticks;				
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
	uint8_t ID;
	uint8_t ErrNo;
	uint16_t Step;				
	uint16_t Pulse;
	uint16_t TmrDrive_1mS;
	uint8_t IsRxSend;			// is Send Packet ?
	uint8_t DipSW;
	uint8_t PacketLen;
	uint8_t Mode;		
	u16 GearRatio100;
	//uint8_t 	Origin : 1; 
	uint8_t 	BoostEnable : 1;
	uint8_t 	ChargeOn : 1;
	uint8_t 	PowerOn : 1;	
} My;		
// Run, Test, Test JIG

#define MAX_ADC	(5)

enum ADCH { 
   ADJ_MO = 2,
	 ISENSE = 3,
   BAT_MO = 4,
	 POWER_MO = 5,
	 BOOST_MO = 6
	 
} ;

struct {
	u16 Value[MAX_ADC];
	u8 Idx;
	u8 IAvg[MAX_ADC];
	u8 IdxAvg;
	u8 Average;
	u16 Sum;
	u8 Delay;
} Adc;

struct {
	u16 Led;
	u16 Motor;
	u16 Adc;
	u16 Boost;
	u16 MotorDelay;
	u8 MotorUpdate;
} Timer;

uint8_t PowerDelay_1mS=999;

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


void OnTimer4(void);

void Clock_Config(void);
void Gpio_Config(void);
static void Adc_Config( void );
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
360 / 11.25 = 32

32 * 64 * 20.16 *300 /360  = 34406.4
*/

void main(void)
{
	//u16 ledint;
	u16 t;
	u16 t2;
	u8 update;
	
	Ticks_1mS = 0;
	Ticks_50uS = 0;
	
	//My.GearRatio100 = 26520u;		//  	4096 * 300/360 * 15.54 
	//My.GearRatio100 = 26520u;		//  	4096 * 300/360 * 15.54 
	//My.GearRatio100 = 291760u;		//  	4096 * 330/360 * 15.54 20180605
	My.GearRatio100 = 287u;		//  	4096 * 325/360 * 15.54 20180605
	
	My.Mode = 0;
	
	Clock_Config();
	Gpio_Config();

	Timer4_Config();
	
	Adc.Idx = 2;
	Adc.IdxAvg = 0;
	Adc.Average = 0;
	Adc.Sum = 0;
	Adc_Config(  );


  /* Initialize the Interrupt sensitivity */
  //EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOB, EXTI_SENSITIVITY_RISE_ONLY);

	Drive.NormalOpen = 1;
	Drive.MaxOverrun = OVERRUN;				// Zero position over run
	//Drive.Interval = PULSE_INTERVAL_mS;		// Pulse interval	
	Drive.Timeout_1S =  VALVE_TIMEOUT_S;	// Valve timeout

	//Drive.Position = CPulse(MAX_STEP);
	//Drive.ExcitationType = 0;		//	1 excition
	Drive.ExcitationType = 1;		//	1-2 excition
	
	Drive.Interval = 16u;			//	20180225
	Drive.DiffStep = 1;
	Drive.Enabled = ENABLED;
	Drive.Stage = 0;		// Charging
		
	My.BoostEnable = 0;
	My.ChargeOn = 0;
	Adc.Delay = 20;
	
	enableInterrupts();

  while ( Ticks_1mS < PowerDelay_1mS )
		;

	GPIO_WriteLow(_LED_PORT, _LED_PIN);
			
 	
	/*
	if ( Drive.Origin ) 
	{
		Drive.Position = 0;
	}
	else
	{
		//Drive.Position  =  435 * (uint32_t)(1925) /50;
		//Drive.Position = CPulse(MAX_STEP);
		Drive.Position = CPulse(210u);
		Drive.ExcitationType = 0;		//	1 excition
		Drive.Interval = 15u;			//	20180225
		StartDriveOR( 0u, 0u  );				// Goto Zero position
		
		//while (Drive.Run)				// Wait while motor is running
		//	;	
	}
	*/

	Timer.Led = Ticks_1mS;
	Timer.Motor = Ticks_1mS;
	Timer.Adc = Ticks_1mS;
  Timer.Boost = Ticks_1mS;
	
	ledint = 2000u;
	
	while (1)
  {
		t = Ticks_1mS;
	
		LedService();
		AdcService();
				
		if ( Drive.Stage == 0 )	//	Charging
		{
			ledint = 1000u;
			//if (My.BoostEnable == 1)
			{
				
			}
			//else
			{
				if (Adc.Value[2] > 950)		//	 Charging then goto origin
				{		
					ledint = 1000u;
					Drive.Stage = 1;
					if ( Drive.Origin ) 
					{
						Drive.Position = 0;
					}
					else
					{
						Drive.Position = CPulse(205u);
						Drive.ExcitationType = 0;		//	1 excition
						//Drive.Interval = 13u;			//	20180225
						StartDriveOR( 0u, 0u  );				// Goto Zero position
					}
				}
			}
		}		//	End state 0	
		else if ( Drive.Stage == 1 )	// Initializing
		{
			if (My.BoostEnable == 1)
			{
				Drive.Stop = 1;	
				Drive.Stage = 0;				
			}
			else
			{
				if ( !Drive.Run )		//	Origin
				{
					ledint = 500u;
					Drive.Stage = 2;
				}
			}
		}
		else if ( Drive.Stage == 2 )	//	Running with Power On
		{
			if (My.BoostEnable == 1)
			{
				if ( Drive.Run )
				{
					Drive.Stop = 1;	
					Timer.Motor = Ticks_1mS;					
				}
				else
				{
					//if ( Diff ( Timer.Motor, 100u ) )
					{
						ledint = 125u;
						Drive.Stage = 3;
					
						Drive.ExcitationType = 1;		//	1 excition
						Drive.Interval = 17u;			//	20180615
					
					  //StartDriveOR( 0u, 0u  );				// Goto Zero position
						Drive.Step = 0u;		//((u16)Adc.Average * 100 )/110; 
						MotorService();
						//Timer.Motor = Ticks_1mS;
					}
				}
			}
			else			//	
			{
				if ( Diff ( Timer.Motor, 500u ) )
				{
					Drive.Step = ((u16)Adc.Average * 100 )/109; 
					MotorService();
					//Timer.Motor = Ticks_1mS;
				}
			}			
		}
		else if ( Drive.Stage == 3 )	//	Running with Power Off
		{
			if (My.BoostEnable == 0 /*&& !Drive.Run*/ )
			{
				ledint = 500u;
				Drive.Stage = 0;
			}			
			else
			{
				/*
				if ( Drive.Position != 0 && !Drive.Run)
				{
					ledint = 125u;
									
					Drive.ExcitationType = 1;		//	1 excition
					Drive.Interval = 19u;			//	20180615
					
					  //StartDriveOR( 0u, 0u  );				// Goto Zero position
					Drive.Step = 0u;		//((u16)Adc.Average * 100 )/110; 
					MotorService();
						//Timer.Motor = Ticks_1mS;
				}
				*/
				
				if ( !Drive.Run )
				{
					ledint = 2000u;
					//Drive.State == 4;
				}
			}
			//ledint = 125u;
		}
		else if ( Drive.Stage == 4 )	//	wait
		{
			//ledint = 2000u;
			
		}
		
		while ( Diff ( t, 10u ) )
			;
		
		//while ( t == Ticks_1mS )
			;
   
  }

}

void MotorService()
{
	//if ( Diff ( Timer.Motor, 500u ) )
		{
			//GPIO_WriteReverse(_LED_PORT, _LED_PIN);
			//Drive.Step = ((u16)Adc.Average * 100 )/110; 
			
			if ( Drive.Step > 210u )
				Drive.Step = 210u;
			if ( Drive.Step < 20u )
				Drive.Step = 0u;
				
			//Drive.Target = CPulse(Drive.Step);
			//if  ( SAbs( Drive.Step ,Drive.PreStep ) > 1 )
			//	StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );
						
			//if ( Drive.Step != Drive.PreStep   )
			
			if  ( SAbs( Drive.Step ,Drive.PreStep ) > 1  )
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
			else
				if ( Drive.Step == 0 && !Drive.Run  )
				{
					Drive.PreStep = Drive.Step;
					StartDriveOR( 0u , 0u );	//Drive.Step, 0u  );					
				}
			
			Timer.Motor = Ticks_1mS;
		}
	}
	


void AdcService()
{
	if ( Diff ( Timer.Adc, 10u ) )
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

void LedService()
{
	/*
	if ( Drive.Run == 1 && My.BoostEnable == 0 )
			ledint = 1000u;
		else if (	Drive.Run == 1 && My.BoostEnable == 1 )
			ledint = 125u;
		else if (	Drive.Run == 0 && My.BoostEnable == 0 )
			ledint = 500u;
		else if (	Drive.Run == 0 && My.BoostEnable == 1 )
		  ledint = 125u;
		*/	
		
			
		if ( Diff ( Timer.Led, ledint ) )
		{
			Timer.Led = Ticks_1mS;
			GPIO_WriteReverse(_LED_PORT, _LED_PIN);			
		}
}

u8 SAbs(u8 s1, u8 s2)
{
	if (s1 > s2 )
		return s1 - s2;
	else
		return s2 - s1;
}
	
	
u8  Diff( u16 time, u16 diff )
{
	u32 t;
	t = Ticks_1mS;
	
	if (time <= t )
	{
		if ( ( t - time ) > diff ) 
			return 1;
		else
			return 0;
	}
	else	// 	t < time
	{
		if ( ( 65535 - time + t  ) > diff ) 
			return 1;
		else
			return 0;
	}
}

void OnTimer_1S(void)
{
	
}




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
	Ticks_50uS++;
	
	if ( Adc.Delay == 0 )
		Adc_Config( );
	else
		Adc.Delay--;
	
	if ( My.BoostEnable == 0 && Adc.Value[3] < 20 )	//		Power off
	{
		//ledint = 1000u;
		My.BoostEnable = 1;
		GPIO_WriteHigh( _BOOST_ENABLE_PORT, _BOOST_ENABLE_PIN ); 
		Adc.Delay = 20;
	}
	else if ( My.BoostEnable == 1 &&  Adc.Value[3] >800 )
	{
		//ledint = 500u;
		My.BoostEnable = 0;
		GPIO_WriteLow( _BOOST_ENABLE_PORT, _BOOST_ENABLE_PIN ); 
		Adc.Delay = 20;
	}
	
	
	if ( Ticks_50uS == 5 )
		Drive.Origin =   ! GPIO_ReadInputPin(_ORG_PORT, _ORG_PIN);
	else 
		if ( Ticks_50uS == 10 )
		{	if ( My.ChargeOn ) 
				GPIO_WriteHigh( _CHARGE_ON_PORT, _CHARGE_ON_PIN ); 
			else
				GPIO_WriteLow( _CHARGE_ON_PORT, _CHARGE_ON_PIN );
		}
	else 
		if ( Ticks_50uS == 15 )
		{
			/*if ( My.BoostEnable ) 
				GPIO_WriteHigh( _BOOST_ENABLE_PORT, _BOOST_ENABLE_PIN ); 
			else
				GPIO_WriteLow( _BOOST_ENABLE_PORT, _BOOST_ENABLE_PIN ); 
				*/
		}
	else 
		if ( Ticks_50uS >= 20 )
		{
			Ticks_50uS = 0;
			//OnTimer_1mS();
			Ticks_1mS++;
	
		//	Adc_Config( );
	
			//if ( PowerDelay_1mS )
			//	PowerDelay_1mS--;
		}
		
	if ( Drive.Ticks > 0 )
		Drive.Ticks--;
	
	if ( Drive.Enabled &&  ( Drive.Ticks == 0 ) ) 
	{
		DriveService();	
		Drive.Ticks = Drive.Interval;
	}	

}


//	Motor Excitation all  off
//
//	OFF all Drive TR 
//
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
	if ( Drive.Run ) 	//&& Timer.MotorUpdate != 1 ) 
	{
		if ( Drive.Dir == 1 && Drive.Position < Target )			// same dir
		{				
			//StartDriveOR( CPulse(Drive.Step), 0u );	//Drive.Step, 0u  );
		}
		else if ( Drive.Dir == 0 && Drive.Position > Target )
		{
			if ( Target == 0 )
				return;
		}
	 	else			   	// Reverse direction
		{
			Drive.Stop = 1;
			return;
			//Drive.PreStep = Drive.Step;
			//Timer.MotorUpdate = 1;
			//Timer.MotorDelay  = Ticks_1mS;
		}
	}
	
	Drive.PreStep = Drive.Step;
		
	//if ( Drive.Run ) return;
	if ( Drive.Position == Target ) return;

	if ( Target == 0 )				//  goto origin
	{
		Drive.Overrun =	0u;
		Drive.ZeroOffset = CPulse( OVER_STEP );
		//Drive.Position += CPulse( OVER_STEP );   	// POSITION;
		//Drive.Position += Drive.ZeroOffset;   	// POSITION;
		Drive.Target = 0u;
		Drive.State = nMotorClose;		// 0;
		//Drive.Interval = 30u;
	}
	else	
	{
		if (Drive.Position >= Target)		// Closing
		{
			Drive.Dir = 0;
			Drive.Overrun =	0u;
			Drive.State = nMotorClose;
			Drive.Overrun2 = 0u;
			Drive.Target = Target;
			Drive.State = nMotorClose;		// 0;
		}
		else								// Opening
		{
			Drive.Dir = 1;
			Drive.State = nMotorOpen;	//1;
			Drive.Overrun2 = overrun;		//100;
			Drive.Target = Target + overrun;	//100;	
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
		else
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
			Excitation_1Phase();	
			break;
		case 1:
			Excitation_12Phase();
			break;
		case 2:
			Excitation_2Phase();
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
			
			//Drive.Run = FALSE;	
			
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

	if ( ! Drive.Run ) 
	{
		//ExOff();
		StopDrive();
		return;	//when Drive is stop 
	}

	if ( Drive.Stop )
	{
		Drive.Stop = 0;
		Drive.Target = Drive.Position ;
	}

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
				
				StopDrive();	
				Drive.Run = FALSE;				
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
		
	switch (Drive.Phase%8)
	{
		case 0:
		case 1:
		//case 1:
			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
			GPIO_WriteLow(_X2_PORT, _X2_PIN);
			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
			break;		
		case 2:
		case 3:
			GPIO_WriteLow(_X1_PORT, _X1_PIN);
			GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
			break;
		case 4:
		case 5:
			GPIO_WriteLow(_X1_PORT, _X1_PIN);
			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
			break;
		case 6:
		case 7:		
			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
			GPIO_WriteLow(_X2_PORT, _X2_PIN);
			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
			break;
			
		default:
			break;
	}
	
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
	
}


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
}


uint16_t CStep( uint16_t pulse )
{
	uint32_t i;
	
	//i = (uint32_t) pulse * 200u / (2400UL);
	i = (uint32_t) pulse * My.GearRatio100 ;
	i = (i+1)/100;   				// Round up  20150925
	return (uint16_t) i;
}
   

uint16_t CPulse( uint16_t step )
{
	uint32_t i;
	
    //i= (uint32_t) step *(24UL);
	
	//i= (uint32_t) step *(141UL);  //28200 pulse
	//i= (uint32_t) step *(14UL);  //2820 pulse
	
	//i = (i+1)/2;   		
	i = (uint32_t) step * My.GearRatio100 ;
	
	//i = (i+1)/100;   			//@20180615
	
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
  GPIO_Init(_LED_PORT, _LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_WriteHigh(_LED_PORT, _LED_PIN);
		
	//   Motor port
	GPIO_Init(_X1_PORT, _X1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(_X2_PORT, _X2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(_Y1_PORT, _Y1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(_Y2_PORT, _Y2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	
	GPIO_WriteHigh(_X1_PORT, _X1_PIN);
	GPIO_WriteLow(_X1_PORT, _X1_PIN);
	
	GPIO_WriteHigh(_Y1_PORT, _Y1_PIN);
	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
	
	GPIO_WriteHigh(_X2_PORT, _X2_PIN);
	GPIO_WriteLow(_X2_PORT, _X2_PIN);
	
	GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);		
	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		

//  Hall sensor port 
  GPIO_Init(_ORG_PORT, _ORG_PIN, GPIO_MODE_IN_FL_NO_IT);
		
//  Power Monitor 
//  GPIO_Init(_POWER_MO_PORT, _POWER_MO_PIN, GPIO_MODE_IN_FL_NO_IT);	
	
//  Charge Port	
	GPIO_Init(_CHARGE_ON_PORT, _CHARGE_ON_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
		
//  Boost Enable Port	
	GPIO_Init(_BOOST_ENABLE_PORT, _BOOST_ENABLE_PIN, GPIO_MODE_OUT_PP_LOW_FAST);		
		
		
	// for ADC3 
	//GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT );
	GPIO_Init( _ADJ_MO_PORT , _ADJ_MO_PIN , GPIO_MODE_IN_FL_NO_IT );
	
	GPIO_Init( _BAT_MO_PORT , _BAT_MO_PIN, GPIO_MODE_IN_FL_NO_IT );
	
	GPIO_Init( _BOOST_MO_PORT , _BOOST_MO_PIN  , GPIO_MODE_IN_FL_NO_IT );
	
  GPIO_Init( _POWER_MO_PORT , _POWER_MO_PIN  , GPIO_MODE_IN_FL_NO_IT );
	
	GPIO_Init( _ISENSE_PORT , _ISENSE_PIN  , GPIO_MODE_IN_FL_NO_IT );
	
  //	
	//GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_OUT_PP_LOW_FAST);
	
	//GPIO_WriteLow(GPIOB, GPIO_PIN_5);	
	GPIO_Init(GPIOB, GPIO_PIN_5, GPIO_MODE_IN_FL_NO_IT);
	GPIO_Init(GPIOC, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT);
	
}


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
	
	ADC1_DeInit( );
	
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
			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_5, ADC1_PRESSEL_FCPU_D2, 
								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL5, DISABLE );
			Adc.Idx = 3;
			break;
			
		case 3:
			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_6, ADC1_PRESSEL_FCPU_D2, 
								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL6, DISABLE );
			Adc.Idx = 4;
			break;	
			
		case 4:
			ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_2, ADC1_PRESSEL_FCPU_D2, 
								ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
			Adc.Idx = 0;
			break;	
			
		default:
			//Adc.Idx = 0;
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
