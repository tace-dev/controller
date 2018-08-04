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

uint32_t Ticks_50uS;
uint16_t Ticks_1mS;
uint16_t Ticks2_1mS;
uint32_t Ticks_S;

//   10v to 26V
u8 TableInterval[17] = { 65,56,50,45,40,36,32,29,26,23,21,19,17,16,15,14,13};
#define IntervalSlope (57/2)

struct {
	uint8_t Enabled : 1;
	uint8_t Run : 1;
	uint8_t LastOrigin : 1; 
	uint8_t PwmEdge : 1;
	uint16_t Position;			// Current position (pulse)
	uint16_t Target;			// Target Position  (pulse)
	uint16_t Overrun;			// Origin cal overrun (pulse)
	uint8_t Overrun2;			// Valve hysteresis calibration overrun 
	uint16_t ZeroOffset;
	uint8_t Phase;				// motor coil phase
	uint16_t  MaxOverrun;	
	uint16_t  ORGPosition;		// Hall IC origin position
	uint8_t State;	
	uint16_t Interval ;			// Drive interval (mS)
	uint16_t Ticks;				
	uint16_t Timeout_1S;		// Drive Timeout 
	u8 ExcitationType;
	u8 Origin;
	u8 NormalOpen;
	uint16_t T1_1mS;
	uint16_t T2_1mS;
	uint8_t Run0;
	uint16_t PwmT1;
	uint16_t PwmT2;
	uint16_t PwmDuty;
	uint16_t PwmT3;
	uint16_t PwmT4;
	uint8_t Prescaler;
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
} My;		
// Run, Test, Test JIG


struct {
	u16 Value[MAX_ADC];
	u8 Idx;
} Adc;

/*
uint8_t POS = 5U;

uint8_t CRLF[2] = {0x0a, 0x0d};

uint8_t iLED = 0;
uint16_t RxLedDelay_1mS = 0;
uint8_t RxDelay_1mS;
uint16_t TmrTx_1mS=0;

uint8_t StateTest;
uint16_t DelayTest_mS;

uint16_t d1;

uint8_t i;
*/
uint8_t PowerDelay_1mS=499;

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

	Clock_Config();
	Gpio_Config();
	StopDrive();
	Timer4_Config();
	
	Adc.Idx = 2;
	Adc_Config(  );


  /* Initialize the Interrupt sensitivity */
  //EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOB, EXTI_SENSITIVITY_RISE_ONLY);

	//Drive.NormalOpen = 1;
	Drive.Enabled = ENABLED;
	Drive.MaxOverrun = OVERRUN;				// Zero position over run
	Drive.Interval = PULSE_INTERVAL_mS;		// Pulse interval	
	Drive.Timeout_1S =  VALVE_TIMEOUT_S;	// Valve timeout

	Drive.Position = CPulse(MAX_STEP);
	
	Drive.Position = 0;
	
	Drive.ExcitationType = 1;		//12 excition
	//Drive.ExcitationType = 2;
	
	Drive.Prescaler = 0x05;
	
	//TIM2_DeInit();
	
	/**
  * @brief  Initializes the TIM2 Time Base Unit according to the specified parameters.
  * @param    TIM2_Prescaler specifies the Prescaler from TIM2_Prescaler_TypeDef.
  * @param    TIM2_Period specifies the Period value.
  * @retval None
  */
//void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
//                        uint16_t TIM2_Period)
	
		
//	TIM2_TimeBaseInit( TIM2_PRESCALER_32, 0xffff );
	
	//CLK_PeripheralClockConfig(CLK_PERIPHERAL_TIMER2, ENABLE);
  // configure TIM1 channel 1 to capture a PWM signal
  //TIM1_PWMIConfig(TIM1_Channel_2, TIM1_ICPolarity_Rising, TIM1_ICSelection_DirectTI,
  //                TIM1_ICPSC_DIV8, ICFilter);
  // Select the TIM1 Input Trigger: TI1FP1
 // TIM1_SelectInputTrigger(TIM1_TRGSelection_TI1FP1);
  //TIM1_SelectSlaveMode(TIM1_SlaveMode_Reset);
  // Enable CC1 interrupt request
  //TIM1_ITConfig(TIM1_IT_CC2, ENABLE);
  // Enable TIM1
  //TIM1_Cmd(ENABLE); 
  
	
	//TIM2_ITConfig(TIM2_IT_UPDATE, ENABLE);		
	TIM2_DeInit();	
	TIM2_TimeBaseInit( Drive.Prescaler, 0xffff );
	TIM2_ITConfig(TIM2_IT_CC1, ENABLE);
	
	enableInterrupts();

	//TIM2_ITConfig(TIM2_IT_CC1, ENABLE);
	Drive.PwmEdge = 0;
	TIM2_Config( Drive.PwmEdge );
	
	//enableInterrupts();
	
	StopDrive();

  while ( PowerDelay_1mS )
		;

	//StartDriveOR( 0u, 0u OVERRUN2 );				// Goto Zero position
	//Drive.Interval = Interval(Adc.Value[1]);
	
	Drive.Interval = 40u;
	Drive.Interval = 12u;
	
	Drive.Position = 0;
	
	//StartDriveOR( 0u, 0u  );				// Goto Zero position
  Drive.T1_1mS = Ticks_1mS;
	StartDriveOR( 4800u, 0u  );				// Goto Zero position
	
	while (Drive.Run)				// Wait while motor is running
			;	

	Drive.T2_1mS = Ticks_1mS;
	Drive.Run0 = Drive.Run;
	
	
  while (1)
  {
		
		if ( Drive.Run0 == 0 &&  Drive.Run == 1 )
		{
			Drive.T1_1mS = Ticks2_1mS;
			Drive.Run0 = Drive.Run;			
		}
		
		if ( Drive.Run0 == 1 &&  Drive.Run == 0 )
		{
			Drive.T2_1mS = Ticks2_1mS;
			Drive.Run0 = Drive.Run;			
		}
   ;
	 
	 
//	 Blinking_StateMachine();
  }
}


OnTimer_1S(void)
{
	//if ( ! Drive.Run )
	//	StartDriveOR( CPulse( Adc.Value[0]/5 ) , OVERRUN2  );
		//StartDriveOR( CPulse( Adc.Value[0]/5 ) , 0u  );
		/*
		if (Drive.Run == 0 )
		{
			if (Drive.Position == 0) 
			{
				Drive.Target = 34500u;
				Drive.Run = 1;
			}
			else if (Drive.Position == 34500) 
				{
					Drive.Target = 0u;
					Drive.Run = 1;
				}
				
		}
		*/
	
}


//extern u8 Table[];
u16 pos;
u8 pos2;

u8 cvtTable(u8 i);

OnTimer_1mS(void)
{ 
	Ticks2_1mS++;
	//u16 pos;
	if ( PowerDelay_1mS )
		PowerDelay_1mS--;
	
	if (  Ticks_1mS < 1999 )
		Ticks_1mS++;
	else
	{
		Ticks_1mS = 0;
		OnTimer_1S();
	}
	
	pos = Adc.Value[0] / 4;
	pos = pos *  4;
	pos = pos / 5 ;
	
	/*
	20170605  지강서 과장 요청에 따라

  0 ~ 10V  -> 0 ~ 200 step  변경에서
	
	0 ~ 10 V  -> 
	
	
	*/
	
	
	// Range check
	
	if ( pos > 200 ) pos = 200;
		
	if  ( pos < 20 ) pos = 0;
	
  //pos2= Table[pos*5/4];
	
//	pos2 = cvtTable(pos*5/4);
	
	if ( ! (Ticks_1mS % 500) )
	{
		if ( ! Drive.Run )
		{
			//Drive.Interval = Interval(Adc.Value[1]);

			//StartDriveOR( CPulse( pos ) , 0u  );			
			
			//StartDriveOR( CPulse( pos2 ) , 0u  );			
			
		}
		GPIO_WriteReverse(LED_PORT, LED_PIN);
	}
		//StartDriveOR( CPulse( pos ) , OVERRUN2  );
	
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
	
	if ( Drive.Enabled &&  ( Drive.Ticks == 0 ) ) 
	{
		DriveService();	
		Drive.Ticks = Drive.Interval;
	}	

}

void OnCaptureOVTim2(void)
{
	Drive.PwmT4 = TIM2_GetCapture1();
	TIM2_ClearFlag(TIM2_FLAG_UPDATE);		//Move to Interrupt routine
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
	//while((TIM2->SR1 & TIM2_FLAG_CC1) != TIM2_FLAG_CC1);
  /* Get CCR1 value */
	
	/**
  * @brief  Checks whether the TIM2 interrupt has occurred or not.
  * @param   TIM2_IT specifies the TIM2 interrupt source to check.
  * This parameter can be one of the following values:
  *                       - TIM2_IT_UPDATE: TIM2 update Interrupt source
  *                       - TIM2_IT_CC1: TIM2 Capture Compare 1 Interrupt source
  *                       - TIM2_IT_CC2: TIM2 Capture Compare 2 Interrupt source
  *                       - TIM2_IT_CC3: TIM2 Capture Compare 3 Interrupt source
  * @retval ITStatus The new state of the TIM2_IT(SET or RESET).
  */
	if ( TIM2_GetITStatus( TIM2_IT_CC1) != SET ) 
		return;
		
	if ( Drive.PwmEdge == 0 ) 
	{		
		Drive.PwmT2 = TIM2_GetCapture1();
		
		TIM2_SetCounter(0u);
		
		Drive.PwmEdge = 1;
		TIM2_Config( Drive.PwmEdge );
		//Drive.PwmT3 = Drive.PwmT2 + Drive.PwmT1 ;
		Drive.PwmDuty = (Drive.PwmT1 * (uint32_t)400 /  Drive.PwmT2) + 1 ;
		Drive.PwmDuty /= 2;
		//ChangePrescale();
	}	
	else
	{
		Drive.PwmT1 = TIM2_GetCapture1();
		Drive.PwmEdge = 0;
		TIM2_Config( Drive.PwmEdge );

		//Drive.PwmDuty = (uint8_t)( (uint32_t)Drive.PwmT1 * 100) / ( (uint32_t)Drive.PwmT1 + Drive.PwmT2 );
	}
		//TIM2_ClearITPendingBit( TIM2_IT_CC1 );
	
}




//	Motor Excitation all  off
void ExOff(void)
{
	GPIO_WriteLow(_X1_PORT, _X1_PIN);
	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
	GPIO_WriteLow(_X2_PORT, _X2_PIN);
	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
}

//
//	OFF all Drive TR 
//
void StopDrive(void)			//TROff()
{
	ExOff();	
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
		
	// Drive.Overrun =	0;
	if ( Target == 0 )				//  goto origin
	{
		Drive.Overrun =	0u;
		Drive.ZeroOffset = CPulse( OVER_STEP );
		//Drive.Position += CPulse( OVER_STEP );   	// POSITION;
		Drive.Position += Drive.ZeroOffset;   	// POSITION;
		Drive.Target = 0u;
		Drive.State = nMotorClose;		// 0;
	}
	else	
	{
		//if ( Target > MAX_POSITION )
		//	Target = MAX_POSITION;

		if (Drive.Position >= Target)		// Closing
		{
			Drive.Overrun =	0u;
			Drive.State = nMotorClose;
			Drive.Overrun2 = 0u;
			Drive.Target = Target;
			Drive.State = nMotorClose;		// 0;
		}
		else								// Opening
		{
			Drive.State = nMotorOpen;	//1;
			
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
	ExOff();

	if ( ! Drive.Run ) return;	//when Drive is stop 
	
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
	
	i = (uint32_t) pulse * 200u / (2400UL);
	i = (i+1)/2;   				// Round up  20150925
	return (uint16_t) i;
}
   

uint16_t CPulse( uint16_t step )
{
	uint32_t i;
	
    i= (uint32_t) step *(24UL);
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
  GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_WriteHigh(LED_PORT, LED_PIN);
		
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
	
		
	

void TIM2_Config(uint8_t Edge)
{
	
	if ( Edge == 0 )
		TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_RISING, TIM2_ICSELECTION_DIRECTTI,
               TIM2_ICPSC_DIV8, 0xf);		//  16MHz /8 = 2MHz
	else
		TIM2_ICInit( TIM2_CHANNEL_1, TIM2_ICPOLARITY_FALLING, TIM2_ICSELECTION_DIRECTTI,
               TIM2_ICPSC_DIV8, 0xf);

	//TIM2_ITConfig(TIM2_IT_CC1, ENABLE);
  TIM2_Cmd(ENABLE);

	//TIM2_SetCounter(0u);
  /* Clear CC1 Flag*/
  //TIM2_ClearFlag(TIM2_FLAG_CC1);		//Move to Interrupt routine
	
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
