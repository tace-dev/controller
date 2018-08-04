/**
  ******************************************************************************
  * @file    icc_measure.h
  * @author  Microcontroller Division
  * @version V1.0.0
  * @date    11/2011
  * @brief   Current measurements defines
  ******************************************************************************
  * @copy
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
  * <h2><center>&copy; COPYRIGHT 2010 STMicroelectronics</center></h2>
  */

/* Define to prevent recursive inclusion -------------------------------------*/
#ifndef __MAIN_H
#define __MAIN_H


/* Private define ------------------------------------------------------------*/


/*  Port definition		*/
#define _LED_PORT GPIOA		
#define _LED_PIN GPIO_PIN_2

/*  Motor drive port		*/
#define _X1_PORT GPIOC
#define _X1_PIN  GPIO_PIN_6
#define _X2_PORT GPIOC
#define _X2_PIN  GPIO_PIN_7
#define _Y1_PORT GPIOC
#define _Y1_PIN  GPIO_PIN_3
#define _Y2_PORT GPIOA
#define _Y2_PIN  GPIO_PIN_3


#define _ORG_PORT GPIOB
#define _ORG_PIN  GPIO_PIN_4

/* 	Adc  port	for Vin Monitor	AIN3		*/
#define _VIN_PORT GPIOD
#define _VIN_PIN  GPIO_PIN_2
  
/* 	Adc  port	for Vadj Monitor	AIN2		*/
#define _VADJ_PORT GPIOC
#define _VADJ_PIN  GPIO_PIN_4

/* 	Adc  port	for I Sense Monitor	AIN4	*/
#define _ISENSE_PORT GPIOD
#define _ISENSE_PIN  GPIO_PIN_3



#define TRUE 		(1u)
#define FALSE 		(0u)
#define ENABLED		(1u)
#define DISABLED	(0u)
#define PORT_ON		(1u)
#define PORT_OFF	(0u)

#define INIT_STEP	 	(401u)					// Initial Step for gear ratio 1 / 59.96


//#define OVERRUN     	(160u)			// Pulse, Zero position overrun
#define OVERRUN     	(300u)			// Pulse, Zero position overrun
#define OVERRUN2   	    (100u)			// Pulse, Open overrun
#define HALL_THRESHOLD 	(40u)			// hall IC threshold
#define MAX_STEP      	(210u)			// Step
#define MIN_STEP      	(10u)			// Step
#define OVER_STEP  		(30u)

#define MAX_POSITION 	CPulse(MAX_STEP)	// Pulse

#define PULSE_INTERVAL_mS 	(50u)			// * 100uS
#define VALVE_TIMEOUT_S 	(300u)			// sec


#define MAX_ADC	(3)

typedef enum {
	nMotorClose,
	nMotorOpen
} MOTOR_DIR;

typedef enum {
	nOFF, 
 	nON,
	nTOGGLE
} LED_STATE;

	
#endif /* __MAIN_H*/

/******************* (C) COPYRIGHT 2010 STMicroelectronics *****END OF FILE****/















