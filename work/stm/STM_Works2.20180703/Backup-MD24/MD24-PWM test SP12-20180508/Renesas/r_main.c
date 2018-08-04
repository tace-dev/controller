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
* File Name    : r_main.c
* Version      : CodeGenerator for RL78/G12 V2.03.02.01 [15 May 2015]
* Device(s)    : R5F10269
* Tool-Chain   : CA78K0R
* Description  : This file implements main function.
* Creation Date: 2015-09-28
***********************************************************************************************************************/

/***********************************************************************************************************************
Pragma directive
***********************************************************************************************************************/
/* Start user code for pragma. Do not edit comment generated here */
/* End user code. Do not edit comment generated here */

/***********************************************************************************************************************
Includes
***********************************************************************************************************************/
#include "r_cg_macrodriver.h"
#include "r_cg_cgc.h"
#include "r_cg_port.h"
#include "r_cg_timer.h"
/* Start user code for include. Do not edit comment generated here */


/* End user code. Do not edit comment generated here */
#include "r_cg_userdefine.h"

/***********************************************************************************************************************
Global variables and functions
***********************************************************************************************************************/
/* Start user code for global. Do not edit comment generated here */

/*******************************************************************



*******************************************************************/

uint32_t Ticks_100uS;
uint16_t Ticks_1mS;
uint32_t Ticks_S;

uint8_t ResetSource;

struct {
	uint8_t Enabled : 1;
	uint8_t Run : 1;
	uint8_t LastOrigin : 1; 
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


// For Data flash
union {
struct {
	uint8_t KeyIndex : 4;
	uint8_t ID : 4;
	uint8_t Position;
	uint8_t Key : 4;
	uint8_t CMD : 4;
	uint8_t CS;	
} Pack;
uint8_t Byte[_RXBYTE];
} TxD;

uint8_t FlashData[MAX_FLASH_BYTE];
uint8_t RData[_RXBYTE];
uint8_t TData[_RXBYTE]; 
uint8_t POS = 5U;

// 
uint8_t CRLF[2] = {0x0a, 0x0d};

uint8_t iLED = 0;
uint16_t RxLedDelay_1mS = 0;
uint8_t RxDelay_1mS;
uint16_t TmrTx_1mS=0;

uint8_t StateTest;
uint16_t DelayTest_mS;

uint16_t d1;

uint8_t i;

uint16_t CStep();
uint16_t CPulse();
uint8_t  GetDipSW(); 

void TxPacket(  );
void StartDrive(  );
void StartDriveOR(  );
void DriveService();

void RxService8();
void RxService4();

/* End user code. Do not edit comment generated here */
void R_MAIN_UserInit(void);

/***********************************************************************************************************************
* Function Name: main
* Description  : This function implements main function.
* Arguments    : None
* Return Value : None
***********************************************************************************************************************/
void main(void)
{
    R_MAIN_UserInit();
    /* Start user code. Do not edit comment generated here */
	
	
	R_TAU0_Channel1_Start();		// Timer1 100uS start
    R_TAU0_Channel2_Start();		// Timer2 1mS start
   	
	TxInit();						// Tx service init				
	RxStart();						// Rx service start	
		
	My.DipSW = GetDipSW();
	My.ID = My.DipSW+1;
	// My.ID = 8;			//  for debug
	
	My.IsRxSend = TRUE;
	My.TmrDrive_1mS = 0;
		
	Drive.Enabled = ENABLED;
    Drive.MaxOverrun = OVERRUN;				// Zero position over run
	Drive.Interval = PULSE_INTERVAL_mS;		// Pulse interval	
	Drive.Timeout_1S =  VALVE_TIMEOUT_S;	// Valve timeout
			
	POWER = PORT_ON;
	//TurnLED(nOFF);
	
	My.Step = MAX_STEP + RData[6] + OVER_STEP;
	My.Step = MAX_STEP + RData[1];// + OVER_STEP;	
	
	// Blink ID Number
	for ( i = 1; i <16; i++ )  //
	{
		RxLedDelay_1mS = 350;
		TurnLED(nON);
		while ( RxLedDelay_1mS )  
			;
			
		RxLedDelay_1mS = 150;
		if ( My.ID <= i ) 
			break;
		
		TurnLED(nOFF);
		while ( RxLedDelay_1mS )
			;
	}	
	
	TurnLED(nOFF);
	RxLedDelay_1mS = 1000;				
	while ( RxLedDelay_1mS )
		;					
		
	/*	
	StartDriveOR( 0u, OVERRUN2 );				// Goto Zero position
    			while (Drive.Run)				// Wait while motor is running
					;	
	*/
	
	// Check Comm Packet
	while ( 1u )
	{
		if ( BytesToRead() == 4 )
		{
			RxRead( RData, 4 );			
			if ( RData[3] == ChkSum(RData, 3) ) // Checksum OK
			{
				My.Mode = ( RData[2] & 0x0f );
				My.PacketLen = 4;
				
				My.Step = MAX_STEP + RData[1] + OVER_STEP;		// 20150927
				
				My.Step = MAX_STEP; 
				My.Step += RData[1];
				//My.Step +=  OVER_STEP;
				//Drive.Position = CPulse(MAX_STEP);
				Drive.Position = CPulse(My.Step);		//MAX_POSITION;
				break;
			}			
		}
		
		if ( BytesToRead() == 8 ) 				// 8byte Rx(LSE) service 
		{
			RxRead( RData, 8 );	
			if ( RData[7] == ChkSum(RData, 7) ) // Checksum OK
			{
				My.PacketLen = 8;
				My.Mode = CMD_GOTO;
								
				My.Step = MAX_STEP + RData[6] + OVER_STEP;		// 20150927
				
				My.Step = MAX_STEP; 
				My.Step += RData[6];
				//My.Step +=  OVER_STEP;
				//Drive.Position = CPulse(MAX_STEP);
				Drive.Position = CPulse(My.Step);		//MAX_POSITION  20150925
								
				StartDriveOR( 0u, OVERRUN2 );				// Goto Zero position
    			while (Drive.Run)				// Wait while motor is running
					;	
				break;
			}
		}
	}
	
	// Main loop
    while (1U)						
    {	
		//My.DipSW = GetDipSW();
		
		if ( RxLedDelay_1mS > 0 )
			TurnLED(nON);
		else
			TurnLED(nOFF);
		
		if ( Drive.Timeout_1S == 0 )	// Valve Timeout Check
		{
			StartDriveOR( 0u, 0u );			
			Drive.Timeout_1S = VALVE_TIMEOUT_S;
		}
			
		if ( My.TmrDrive_1mS == 0 )  
			TxPacket4( );
		
		if ( BytesToRead() == 4 ) 		// 4byte Rx(PowerCube) service 
		{
			RxRead( RData, 4 );			
			if ( RData[3] == ChkSum(RData, 3) ) // Checksum OK
			{
				My.PacketLen = 4;
				My.Mode = ( RData[2] & 0x0f );
				RxService4();
			}
		}	
		
		if ( BytesToRead() == 8 ) 		// 8byte Rx(LSE) service 
		{
			RxRead( RData, 8 );			
			if ( RData[7] == ChkSum(RData, 7) ) // Checksum OK
			{
				My.PacketLen = 8;
				My.Mode = CMD_GOTO;
				RxService8();
			}
		}	
    }

    /* End user code. Do not edit comment generated here */
}

/***********************************************************************************************************************
* Function Name: R_MAIN_UserInit
* Description  : This function adds user code before implementing main function.
* Arguments    : None
* Return Value : None
***********************************************************************************************************************/
void R_MAIN_UserInit(void)
{
    /* Start user code. Do not edit comment generated here */
    EI();
    /* End user code. Do not edit comment generated here */
}

/* Start user code for adding. Do not edit comment generated here */

struct  {
    uint8_t X : 1;
    uint8_t Y : 1;
    uint8_t X_ : 1;
    uint8_t Y_ : 1;
} EX [4] = { { 0,1,1,0}, {0,0,1,1}, {1,0,0,1}, {1,1,0,0} } ;    
//  2 phase excitation 

//
// 100uS Timer interrupt service routine
//
void OnTimer2_100uS()
{
	Ticks_100uS++;
	
	if ( Drive.Ticks > 0 )
		Drive.Ticks--;
	
	if ( Drive.Enabled &&  ( Drive.Ticks == 0 ) ) 
	{
		DriveService();	
		Drive.Ticks = Drive.Interval;
	}	
	TxEvent();
}

//
// 1S Timer service routine
//
void OnTimer_1S()
{
	Ticks_S++;
	
	if ( Drive.Timeout_1S > 0 )		// Valve comm timeout 
		Drive.Timeout_1S--;	
}

//
// 1mS Timer interrupt service routine
//
void OnTimer1_1mS()
{
	if ( DelayTest_mS > 0 )
		DelayTest_mS--;
		
	if ( RxLedDelay_1mS > 0 )
		RxLedDelay_1mS--;	
		
	if (RxDelay_1mS > 0)
		RxDelay_1mS--;	
		
	if ( TmrTx_1mS >0 )
		TmrTx_1mS--;	// = _TX_INTERVAL;
		
	if ( My.TmrDrive_1mS > 0 )
		My.TmrDrive_1mS--;
		
	if ( Ticks_1mS < 999 )
	 	Ticks_1mS++;
	else
	{
		Ticks_1mS = 0;		
		OnTimer_1S();
	}	
}
 

//
//
//
void RxService4()
{
	if ( My.ID != (RData[0] & 0x0f) ) 	// ID is not match
	{
		if ( My.Mode == CMD_GOTO )
			return;
		if ( My.Mode == CMD_GOTOA )
			return;
	}
	
	if ( Drive.Enabled )
		RxLedDelay_1mS = 250;			// Ok
	else						
		RxLedDelay_1mS = 2000;			// Origin Error
		
	Drive.Timeout_1S = VALVE_TIMEOUT_S;	// Valve timeout reset
				
	My.IsRxSend = FALSE;
	switch (  My.Mode ) 			// RData[2] & 0x0f )
	{
		case CMD_GOTO:		
		case CMD_GOTOA:
			//RData[1] = POS;    // for debug 
			
			if ( CPulse(RData[1]) == Drive.Position && Drive.Run == FALSE )		// Position is done
				TxPacket4(  );
			else				// update step
			{
				My.TmrDrive_1mS = (uint16_t)_TX_INTERVAL - _TX_MARGIN; 		  	// 50mS 20150925
				Drive.Interval = PULSE_INTERVAL_mS;		// Pulse interval	
				
				if ( RData[1] == 0 )			// goto zero
				{
					My.Step = 0;
					My.IsRxSend = FALSE;	
					//Drive.Position += CPulse( OVER_STEP );		// Add overrun(zero positin) value to position
					StartDriveOR( 0u, 0u );		//CPulse(My.Step), OVERRUN2 );		
				}
				else							// goto anywhere except zero
				{
					if ( CPulse(RData[1]) != Drive.Target )		// if target position is changing
					{	
						if ( RData[1] < MIN_STEP )
							My.Step = MIN_STEP;
						else
							My.Step = RData[1];
							
						My.IsRxSend = FALSE;
						if ( My.Mode == CMD_GOTOA )
						 	StartDriveOR( CPulse(My.Step), OVERRUN2 );	
						else
							StartDriveOR( CPulse(My.Step),0u );	
					}
					
				}
				
				/*
				if ( CPulse(RData[1]) != Drive.Position )		// Target != current position	
					{
						My.Step = RData[1];
						My.IsRxSend = FALSE;
						if ( My.Mode == CMD_GOTO )
						 	StartDriveOR( CPulse(My.Step), OVERRUN2 );	
						else
							StartDriveOR( CPulse(My.Step),0u );								
					}
				*/
			}
			break;
		
		case CMD_TEST:	
			My.IsRxSend = FALSE;
			TxPacket4(  );
	
			if ( Drive.Run == TRUE ) break;			
				
			if ( StateTest == 0 && DelayTest_mS == 0 )
			{
				Drive.Interval = PULSE_INTERVAL_mS;		// Pulse interval
				StateTest = 1; DelayTest_mS = 1000;
				My.Step = 0;
				
				//StartDrive( CPulse(My.Step) );
				StartDriveOR( CPulse(My.Step), OVERRUN2 );	
				
			}	
			else if ( StateTest == 1 && DelayTest_mS == 0 )
			{
				StateTest = 2; DelayTest_mS = 1000;
			}
			else if ( StateTest == 2 && DelayTest_mS == 0 )
			{
				StateTest = 3; DelayTest_mS = 1000;
				
				if (My.Mode == CMD_TESTJIG)
				{
					Drive.Interval = PULSE_INTERVAL_mS*50;		// Pulse interval
					My.Step = 10;		//MAX_STEP;
				}
				else
				{
					Drive.Interval = PULSE_INTERVAL_mS;		// Pulse interval
					My.Step = MAX_STEP;
					My.Step = RData[1];
				}		
				
				//StartDrive( CPulse(My.Step) );
				StartDriveOR( CPulse(My.Step), OVERRUN2 );	
			}
			else if ( StateTest == 3 && DelayTest_mS == 0 )
			{
				StateTest = 0; DelayTest_mS = 1000;
			}
			break;
			
	}		
}


void RxService8()
{
	// If Caller Packet?
	// 0x00 ~ 0x0f : normal
	// 0x10 ~ 0x1f : Error
	if ( RData[0] >= 0  && RData[0] <= 0x1f )
	{
		if ( Drive.Enabled )
			RxLedDelay_1mS = 50;
		else						
			RxLedDelay_1mS = 1000;
	}

	switch (  RData[0] )
	{
		case 0xa0:
			Drive.Interval = PULSE_INTERVAL_mS;		// Pulse interval			
			Drive.Timeout_1S = VALVE_TIMEOUT_S;
			RxLedDelay_1mS = 250;	// RX LED delay			
			if ( RData[6] == 0 )
			{
				My.Step = 0;
			}
			else
			{
				if ( CPulse(RData[6]) != Drive.Target )		// if target position is changing
				{	
					if ( RData[6] < MIN_STEP )
						My.Step = MIN_STEP;
					else
						My.Step = RData[6];
							
					//StartDriveOR( CPulse(My.Step), OVERRUN2 );			//(uint16_t)RData[6]*(2064UL) /100u );
				}				
			}	
			StartDriveOR( CPulse(My.Step), OVERRUN2 );			//(uint16_t)RData[6]*(2064UL) /100u );
			break;
		case 0x90:
		case 0xb0:
		case 0xc0:
		case 0xd0:
		case 0xe0:
			// RxLedDelay_1mS = 300;	// RX LED delay
			break;
		case 0x0c:
		case 0x1c:
			if ( Drive.Enabled == FALSE )
			{
				TxPacket8( );
				TxStart( TData,8 );	
			}
			break;
		case 0x81:
		case 0xc1:
			break;
		case 0x01:
			break;
	}		
}



//
// Make 4yte Tx Packet
//
void TxPacket4( )	
{
	uint16_t pos;
	
	pos = Drive.Position;
	
	if ( Drive.ZeroOffset ) 
	{
		if ( pos > Drive.ZeroOffset )
			pos -= Drive.ZeroOffset;
		else
			pos = CPulse(1);
	}
		
	if ( My.IsRxSend ) 
		return;
	My.IsRxSend = TRUE;
		
	TData[0] = My.ID;
		
	TData[2] = ACK_OK;				// Error No
	
	if ( CStep( pos ) > 0xff )
		TData[1] = 0xff;
	else
		TData[1] = (uint8_t) CStep( pos );
	
	if ( Drive.Position == Drive.Target )
	{
		
		if ( Drive.Run == TRUE && Drive.Position != 0u ) 
			TData[1] += 1;	
	}
	
	if ( ! Drive.Enabled )	
	{
		TData[2] = ACK_ERROR;				// Error No
	}
		
	TData[3] = ChkSum( TData, 3);	
	TxStart( TData,4 );
}

//
// Make 8Byte Tx Packet
// ex) 8C F2 0 33 44 55 66 B0
//
void TxPacket8( )
{
	uint16_t pos;
	
	pos = Drive.Position;
	
	if ( Drive.ZeroOffset ) 
	{
		if ( pos > Drive.ZeroOffset )
			pos -= Drive.ZeroOffset;
		else
			pos = CPulse(1);
	}
	/*
	if ( Drive.Position == 0 )
		pos = 0;
	else
		pos = CStep(Drive.Position);	//(uint32_t)Drive.Position * 100u / (2064UL)+1;
	*/	
	TData[0] = 0x8c;
	
	if ( Drive.Enabled )	
	{
		TData[1] = (uint8_t) CStep( pos );   // Current position 
		TData[2] = 0;				// Error No
	}
	else							// if drive disabled
	{
		TData[1] = 1;				// unknown
		TData[2] = 19;				// Error No
	}
	
	TData[3] = 0; TData[4] = 0; 
	TData[5] = (uint8_t)(Drive.Timeout_1S >> 8);
 	TData[6] = (uint8_t)Drive.Timeout_1S;
	 
	TData[7] = ChkSum( TData, 7);			
}

//
//
//
void TurnLED( LED_STATE state )
{
    switch (state)
    {
        case nOFF : 
            LED =0x01;     break;
        case nON : 
            LED =0x00;     break;
        default :       //  toggle
            if (LED==0x01) 
                LED =0x00;
            else
                LED=0x01;
    }
}


//
//	OFF all Drive TR 
//
void StopDrive()			//TROff()
{
	X1 =  0;	//EX[phase % 4].X;
    Y1 =  0;	//EX[phase % 4].Y;
    X1_ = 0;	//EX[phase % 4].X_;
    Y1_ = 0;	//EX[phase % 4].Y_;
	
	if (My.PacketLen == 4 && My.Mode == CMD_GOTO )
	{
		My.IsRxSend = FALSE;
		TxPacket4(  );
		TxStart( TData,4 );
	}
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
		if ( Target > MAX_POSITION )
			Target = MAX_POSITION;

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
			
			if (My.Mode == CMD_TESTJIG )
			{
				Drive.Overrun2 = 0u;	//(uint8_t)OVERRUN2;		//100;
				Drive.Target = Target;	// + OVERRUN2;	//100;
			}
			else
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
			Drive.Phase++;
		}
		//else
		if ( Drive.Position == 0 ) 
		{
			Drive.Enabled = FALSE;
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
		if (  Drive.Position < MAX_POSITION )
			Drive.Position++;
		Drive.Phase--;
		if ( ORIGIN ) 
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
	
	X1 =  EX[Drive.Phase % 4].X;
    Y1 =  EX[Drive.Phase % 4].Y;
    X1_ = EX[Drive.Phase % 4].X_;
    Y1_ = EX[Drive.Phase % 4].Y_;	
}

//
//
//
void MotorClose()
{
	if ( ORIGIN )   		// Hall IC Sensing 
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
void DriveService()
{
	//	20150925  
	X1 =  0;	//EX[phase % 4].X;
    Y1 =  0;	//EX[phase % 4].Y;
    X1_ = 0;	//EX[phase % 4].X_;
    Y1_ = 0;	//EX[phase % 4].Y_;
	
	if ( ! Drive.Run ) return;	//when Drive is stop 
	
	if ( My.PacketLen == 4 && My.Mode == CMD_GOTO && My.TmrDrive_1mS == 0 ) 
 		return;
	if ( My.PacketLen == 4 && My.Mode == CMD_GOTOA && My.TmrDrive_1mS == 0 ) 
 		return;

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


unsigned char ChkSum(unsigned char *data, unsigned char len)
{
	unsigned char i;
	unsigned char cs;
	
	cs = 0;
	for ( i = 0 ; i < len ; i++ )
		cs = cs + data[i];

	return cs;
}


uint16_t CStep( uint16_t pulse )
{
	uint32_t i;
	
	i = (uint32_t) pulse * 200u / (2064UL);
	i = (i+1)/2;   				// Round up  20150925
	return (uint16_t) i;
}
   

uint16_t CPulse( uint16_t step )
{
	uint32_t i;
	
    i= (uint32_t) step *(2064UL) / 50u;
	i = (i+1)/2;   				// Round up   20150925
	return (uint16_t) i;
}

uint8_t GetDipSW()
{
	uint8_t sw;
	
	sw = 0;
	sw |= DIP4; 	sw <<= 1;
	sw |= DIP3; 	sw <<= 1;
	sw |= DIP2; 	sw <<= 1;
	sw |= DIP1; 
	
	return sw;
}
	
/* End user code. Do not edit comment generated here */
