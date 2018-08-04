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

/**
  * @addtogroup TIM4_TimeBase_InterruptConfiguration
  * @{
  */

/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
volatile bool User_Key_Pressed = 0;
u8 BlinkSpeed = 1;
u16 Counter;
u16 PeriodNumber = 0;
 u8 i[150]={0,1,2,3,4,5,6,7,8,9};
const  unsigned char s[] = {"dddddddddddddddddddddddddddddddddddddddddddddddddd"};

/* Private function prototypes -----------------------------------------------*/
/* Private functions ---------------------------------------------------------*/
void TIMER_Configuration(void);
void Blinking_StateMachine(void);

/* Public functions ----------------------------------------------------------*/
/**
  * @brief Example firmware main entry point.
  * @par Parameters:
  * None
  * @retval
  * None
  */
	
	/*
	void	systemADC(void)
{
	uint8_t	i;
	CLK_PeripheralClockConfig(CLK_Peripheral_ADC1, ENABLE);

	ADC_Init(
		ADC1, 
		ADC_ConversionMode_Single, 
		ADC_Resolution_12Bit, 
		ADC_Prescaler_2
		);
	ADC_SamplingTimeConfig(
		ADC1, 
		ADC_Group_SlowChannels, 
		ADC_SamplingTime_384Cycles
		);
	ADC_Cmd(ADC1, ENABLE);
}	
*/
/*


void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, 
               ADC1_Channel_TypeDef ADC1_Channel,
               ADC1_PresSel_TypeDef ADC1_PrescalerSelection, 
               ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, 
               FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, 
               ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, 
               FunctionalState ADC1_SchmittTriggerState);
							 
							 */
 //
static void ADC_Config( u8 ch ){
    //GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT );
    ADC1_DeInit();
    //ADC1_Init(ADC1_CONVERSIONMODE_CONTINUOUS, ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, DISABLE );
	if (ch)
		ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_2, ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL2, DISABLE );
else
		ADC1_Init(ADC1_CONVERSIONMODE_SINGLE , ADC1_CHANNEL_3, ADC1_PRESSEL_FCPU_D2, ADC1_EXTTRIG_TIM,DISABLE, ADC1_ALIGN_RIGHT, ADC1_SCHMITTTRIG_CHANNEL3, DISABLE );

		ADC1_StartConversion();		
}

	
	
#define _X1 PC.6
#define _X2 PC.7
#define _Y1 PC.3
#define _Y2 PA.3

u16 Adc2 = 0;
u16 Adc3 = 0;

u8 Excitation = 0;

u8 Origin=0;
u8 Dir = 0;	
u8 Phase =0;
struct {
	u8 X : 1;
	u8 Y : 1;
	u8 X_ : 1;
	u8 Y_ : 1;
} Ex[4] = { { 1, 0, 0, 0 }, { 0, 1, 0, 0 }, { 0, 0, 1, 0 }, { 0, 0, 0, 1 }  };


void MotorStep2(void)
{
	/*
	_X1 = Ex[Phase %4].X;
	_X2 = Ex[Phase %4].X_;
	_Y1 = Ex[Phase %4].Y;
	_Y2 = Ex[Phase %4].Y_;
	*/
	
	switch (Phase%4)
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
	};
	
if ( Dir ) 
		Phase++;
	else
		Phase--;
		
		Origin =  GPIO_ReadInputPin(_ORG_PORT, _ORG_PIN);
		
		if ( Phase % 2 )
		{
			Adc3 = ADC1_GetConversionValue();
			ADC_Config(0);
		}
		else
		{
		 Adc2 = ADC1_GetConversionValue();
		 ADC_Config(1);
	 }
}

typedef struct Bit_struct {
	u8 b0 : 1;
	u8 b1 : 1;
	u8 b2 : 1;
	u8 b3 : 1;
	u8 b4 : 1;
	u8 b5 : 1;
	u8 b6 : 1;
	u8 b7 : 1;
} Bits;

Bits ii;
u8 jj; 

u8 PortB = 0;

void MotorStep(void)
{
	/*
	_X1 = Ex[Phase %4].X;
	_X2 = Ex[Phase %4].X_;
	_Y1 = Ex[Phase %4].Y;
	_Y2 = Ex[Phase %4].Y_;
	*/
	

	
	if (Excitation == 1)
	{
		MotorStep2();
		return;
	}
	
	ii.b0 = 1;

	
	switch (Phase%4)
	{
		case 0:
			GPIO_WriteHigh(_X1_PORT, _X1_PIN);
			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
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
			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
			GPIO_WriteHigh(_X2_PORT, _X2_PIN);
			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);	
			break;
		case 3:  
			GPIO_WriteLow(_X1_PORT, _X1_PIN);
			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
			GPIO_WriteLow(_X2_PORT, _X2_PIN);
			GPIO_WriteHigh(_Y2_PORT, _Y2_PIN);	
			break;
	};
	
	if ( Dir ) 
		Phase++;
	else
		Phase--;
		
		Origin =  GPIO_ReadInputPin(_ORG_PORT, _ORG_PIN);
		
		if ( Phase % 2 )
		{
			Adc3 = ADC1_GetConversionValue();
			ADC_Config(0);
		}
		else
		{
		 Adc2 = ADC1_GetConversionValue();
		 ADC_Config(1);
	 }
		
}
	

void OnTimer4(void)
{
	if (Counter >= PeriodNumber)
  {
    /* Toggle GPIO LED PIN */
    GPIO_WriteReverse(LED_PORT, LED_PIN);
		
		MotorStep();
		
    Counter = 0;
  }

  Counter++;	
}
	
void main(void)
{

  


  u8  iii;
 
 iii = i[3];
 
 
 CLK_DeInit();
CLK_HSICmd(ENABLE);
CLK_LSICmd(DISABLE);
CLK_HSECmd(DISABLE);
//CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
//CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 
 CLK_HSIPrescalerConfig(CLK_PRESCALER_HSIDIV1);
CLK_SYSCLKConfig(CLK_PRESCALER_CPUDIV1);
 
 
  /* Configure PD0 (LED1) as output push-pull low (led switched on) */
  GPIO_Init(LED_PORT, LED_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	
	
	//   Motor port
	GPIO_Init(_X1_PORT, _X1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(_X2_PORT, _X2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(_Y1_PORT, _Y1_PIN, GPIO_MODE_OUT_PP_LOW_FAST);
	GPIO_Init(_Y2_PORT, _Y2_PIN, GPIO_MODE_OUT_PP_LOW_FAST);

  GPIO_Init(_ORG_PORT, _ORG_PIN, GPIO_MODE_IN_FL_NO_IT);
	
	GPIO_WriteLow(_X1_PORT, _X1_PIN);
	GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
	GPIO_WriteLow(_X2_PORT, _X2_PIN);
	GPIO_WriteLow(_Y2_PORT, _Y2_PIN);		
	
	
	// for ADC3 
	GPIO_Init(GPIOD, GPIO_PIN_2, GPIO_MODE_IN_FL_NO_IT );
	GPIO_Init(GPIOC, GPIO_PIN_4, GPIO_MODE_IN_FL_NO_IT );
	GPIO_Init(GPIOD, GPIO_PIN_3, GPIO_MODE_IN_FL_NO_IT );
	
  /* Configure PC4 (push buton) as input floating */
  GPIO_Init(BUTTON_PORT, BUTTON_PIN, GPIO_MODE_IN_PU_IT);
  
	//ADC_Config(1);
	//systemADC();

 iii++;

  TIMER_Configuration();

  /* Initialize the Interrupt sensitivity */
  EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOB, EXTI_SENSITIVITY_RISE_ONLY);

  enableInterrupts();


  while (1)
  {
    Blinking_StateMachine();
  }
}

void TIMER_Configuration(void)
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

void Blinking_StateMachine(void)
{
  if (User_Key_Pressed == TRUE) /* KEY 1 pressed */
  {
    User_Key_Pressed = FALSE;
    BlinkSpeed++;
    BlinkSpeed = BlinkSpeed % 6;
  }

  switch (BlinkSpeed)
  {
    case 0 :
      TIM4_Cmd(DISABLE);
      GPIO_WriteHigh(LED_PORT, LED_PIN);
			
			GPIO_WriteLow(_X1_PORT, _X1_PIN);
			GPIO_WriteLow(_Y1_PORT, _Y1_PIN);
			GPIO_WriteLow(_X2_PORT, _X2_PIN);
			GPIO_WriteLow(_Y2_PORT, _Y2_PIN);			
			
			
      break;

    case 1 :
		   PeriodNumber = 20000;   // 50uS * 20000 =
      //PeriodNumber = 1000;   //250;
      TIM4_Cmd(ENABLE);
      break;

    case 2 :
      PeriodNumber = 620;
      TIM4_Cmd(ENABLE);
      break;
			case 3 :
      PeriodNumber = 310;
      TIM4_Cmd(ENABLE);
      break;
			case 4 :
      PeriodNumber = 160;
      TIM4_Cmd(ENABLE);
      break;
			case 5 :
      PeriodNumber = 80;
      TIM4_Cmd(ENABLE);
      break;
			case 6 :
      PeriodNumber = 40;
      TIM4_Cmd(ENABLE);
      break;
			case 7 :
      PeriodNumber = 20;
      TIM4_Cmd(ENABLE);
      break;
			case 8 :
      PeriodNumber = 10;
      TIM4_Cmd(ENABLE);
      break;

    default :
		;
      /* 1s time-base = 250 x 4ms */
      //PeriodNumber = 2500;
  }

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
  while (1)
  {}
}
#endif

/**
  * @}
  */

/******************* (C) COPYRIGHT 2009 STMicroelectronics *****END OF FILE****/
