/***********************************************************************************************************************
* DISCLAIMER
* This software is supplied by Renesas Electronics Corporation and is only intended for use with Renesas products.
* No other uses are authorized. This software is owned by Renesas Electronics Corporation and is protected under all
* applicable laws, including copyright laws. 
* THIS SOFTWARE IS PROVIDED "AS IS" AND RENESAS MAKES NO WARRANTIESREGARDING THIS SOFTWARE, WHETHER EXPRESS, IMPLIED
* OR STATUTORY, INCLUDING BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
* NON-INFRINGEMENT.  ALL SUCH WARRANTIES ARE EXPRESSLY DISCLAIMED.TO THE MAXIMUM EXTENT PERMITTED NOT PROHIBITED BY
* LAW, NEITHER RENESAS ELECTRONICS CORPORATION NOR ANY OF ITS AFFILIATED COMPANIES SHALL BE LIABLE FOR ANY DIRECT,
* INDIRECT, SPECIAL, INCIDENTAL OR CONSEQUENTIAL DAMAGES FOR ANY REASON RELATED TO THIS SOFTWARE, EVEN IF RENESAS OR
* ITS AFFILIATES HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.
* Renesas reserves the right, without notice, to make changes to this software and to discontinue the availability 
* of this software. By using this software, you agree to the additional terms and conditions found by accessing the 
* following link:
* http://www.renesas.com/disclaimer
*
* Copyright (C) 2011, 2015 Renesas Electronics Corporation. All rights reserved.
***********************************************************************************************************************/

/***********************************************************************************************************************
* File Name    : r_cg_userdefine.h
* Version      : CodeGenerator for RL78/G12 V2.03.02.01 [15 May 2015]
* Device(s)    : R5F10269
* Tool-Chain   : CA78K0R
* Description  : This file includes user definition.
* Creation Date: 2015-09-28
***********************************************************************************************************************/

#ifndef _USER_DEF_H
#define _USER_DEF_H

/***********************************************************************************************************************
User definitions
***********************************************************************************************************************/

/* Start user code for function. Do not edit comment generated here */

/* R5F10269A	*/

/*  Port Definition */
#define LED 	(P6.1)

#define POWER 	(P6.0)

#define DIP1 	(!P1.4)
#define DIP2 	(!P1.2)
#define DIP3 	(!P1.1)
#define DIP4 	(!P1.0)

//  stepmotor drive port
#define X1  	(P2.3) 		           
#define X1_ 	(P2.2)
#define Y1  	(P2.1)
#define Y1_ 	(P2.0)



#define ORIGIN 	(!P4.1)

//#define TX P6.1 //P4.2
#define TX 		(P4.2)
#define RX 		(P1.3)

#define TRUE 		(1u)
#define FALSE 		(0u)
#define ENABLED		(1u)
#define DISABLED	(0u)
#define PORT_ON		(1u)
#define PORT_OFF	(0u)

#define INIT_STEP	 	(401u)					// Step


#define OVERRUN     	(160u)			// Pulse, Zero position overrun
#define OVERRUN2   	    (100u)			// Pulse, Open overrun
#define HALL_THRESHOLD 	(40u)			// hall IC threshold
#define MAX_STEP      	(210u)			// Step
#define MIN_STEP      	(10u)			// Step
#define OVER_STEP  		(30u)

#define MAX_POSITION 	CPulse(MAX_STEP)	// Pulse

#define PULSE_INTERVAL_mS 	(40u)			// mS
#define VALVE_TIMEOUT_S 	(300u)			// sec

#define _RXBYTE 		(8u)   //4
#define _RXBIT  		(64u)	//32
#define _RX_DELAY		(10u)	// mS
#define _TX_INTERVAL  	(500u)	// mS
#define _TX_MARGIN 		(50u)	//mS

//*******************
#define CMD_GOTOA 		(0x0a)
#define CMD_GOTO  		(0x09)
#define CMD_POSITION 	(0x08)
#define CMD_SETID		(0x07)

#define ACK_OK		(0x0b)
#define ACK_ERROR   (0x0a)
#define ACK_RUN		(0x09)

//#define CMD_OK		0x0b
//#define CMD_ERROR   0x0a
//#define CMD_RUN		0x09

#define CMD_TEST	(0x0B)
#define CMD_TESTJIG (0x0C)
//******************************

typedef enum {
	nMotorClose,
	nMotorOpen
} MOTOR_DIR;

typedef enum {
	nOFF, 
 	nON,
	nTOGGLE
} LED_STATE;

struct _FData {
	uint8_t ID;
	uint8_t VVMax;
	uint8_t Interval;
	uint8_t CS;
};

void OnTimer2_100uS();
void OnTimer1_1mS();
void OnCapture();

void TxInit();
void TxStart();
void TxEvent();
uint8_t TxRun();

void RxStart();
void RxStop();
uint8_t RxReceived( );

void RxRead( );
uint8_t BytesToRead( );

void TxPacket4( );
void TxPacket8( );

void RxService4( );
void RxService8( );

void TurnLED( );

uint8_t ChkSum( );

uint8_t FlashRead();
void FlashWrite();



/*  Serial ?�출??관??         */
void UartSend( );
void UartStart( );
void EndUartSend();
uint8_t UartTxRunning();
void UartTest();

void PrintRxData(uint8_t *RData , uint8_t RLen);

#define MY_ID					(1)				// Default ID
#define MAX_FLASH_BYTE			(4)
#define MAX_FLASH_DATA 			(10)			// max flash saved data	

#define FLASH_START_ADDRESS    (0xF1000)                               /* Start address of data flash                */
#define TARGET_BLOCK           (0)                                     /* Block number of target(0 ~ 3)              */
#define BLOCK_SIZE             (0x400)                                 /* Block size  1024 byte                      */
#define WRITE_SIZE             (1)                                     /* Size of data to be written at once         */
#define MAX_VALUE              (0xFF)                                  /* Maximum value of writing                   */
#define MAX_ADDRESS            ((TARGET_BLOCK + 1) * BLOCK_SIZE - 1)   /* Maximum address of writing                 */
#define PFDL_NG                (1)                                     /* Failure to Data Flash                      */
//#define FDL_FRQ                (32)                                    /* Setting frequency (MHz)                    */
#define FDL_FRQ                (16)                                    /* Setting frequency (MHz)                    */
#define FDL_VOL                (0x00)                                  /* Voltage mode                               */


/***********************************************************************************************************************
Exported global functions (to be accessed by other files)
***********************************************************************************************************************/

void    R_FDL_Init(void);
uint8_t R_FDL_BlankCheck(unsigned int Address, unsigned int Size);
uint8_t R_FDL_Erase(unsigned char BlockNo);
uint8_t R_FDL_Verify(unsigned int Address, unsigned int Size);
void R_FDL_Read(unsigned int Address, unsigned int Size, unsigned char *Data);
uint8_t R_FDL_Write(unsigned int Address, unsigned int Size, unsigned char *Data);

#if    TARGET_BLOCK > 3
#error target_block error!!
#endif

/* End user code. Do not edit comment generated here */
#endif
