#include "r_cg_macrodriver.h"
#include "r_cg_userdefine.h"
#include "r_cg_userdefine.h"
#include "r_cg_timer.h"


enum {
	RC_Ready,
	RC_STx,
	RC_Bit,
	RC_ETx
};
enum {
	N_Ready = 12,
	N_STx = 9,
	N_Bit0 = 4,
	N_Bit1 = 6,
	N_ETx = 1
};

// for heanaem
#define TxLow 0				// Tx port Low
#define TxHigh 1					// Tx port High

//#define TxLow 1						// Tx port Low
//#define TxHigh 0					// Tx port High

#define MAX_PACKET 20				// Rx Q count

extern uint8_t RxDelay_1mS;
//extern uint8_t RxTimeout_1mS;		// Rx timeout mS
//extern uint8_t RxBytes;			// Rx Bytes to read

struct  {                  
    uint8_t Enabled : 1;    	//         
    uint8_t Run : 1;         	//   
    uint8_t State ;      		//  
    uint8_t Ticks;            	//  
	uint8_t Buf[_RXBYTE];
	uint8_t BitCnt;
	uint8_t MaxBit;
	uint8_t nBit;
} Tx;

struct  {                  
    uint8_t Enabled : 1;    	//         
    uint8_t Run : 1;         	//   
    uint8_t State ;      		//  
    uint8_t Ticks;            	//  
	uint8_t Buf[_RXBYTE];
	uint8_t BitCnt;
	uint8_t nBit;
} Rx;

struct  {
	uint8_t Byte[_RXBYTE];
} RxBuf[MAX_PACKET+1];

uint8_t  iPacket;				// RxBug Q index

uint8_t NextTxBit();

uint8_t TxRun()
{
	return Tx.Run;
}

void TxEvent(void)
{    
	if ( !Tx.Run ) return;
        
    switch ( Tx.State )
    {
        case ( RC_Ready ) :          		//  start hi        
            if ( Tx.Ticks == N_Ready  )     //  end  
            {
                Tx.State = RC_STx;
				TX = TxLow; 
				Tx.Ticks = 0;
            }
			else if ( Tx.Ticks == 2 )
			{
				TX = TxHigh;
			} 
			else if ( Tx.Ticks == 0 )
				TX = TxLow;
            break;
			
        case ( RC_STx ) :         			//  STx   
			if ( Tx.Ticks == N_STx  )   	//  end  
            {
                Tx.State = RC_Bit;
				TX = TxLow; 
				Tx.Ticks = 0;
				
				if ( NextTxBit() )
					Tx.nBit = N_Bit1;
				else
					Tx.nBit = N_Bit0; 
			}
			else if ( Tx.Ticks == 2 )
			{
				TX = TxHigh;
			} 
			else if ( Tx.Ticks == 0 )
				TX = TxLow;
            break;
            
        case ( RC_Bit ) :          				
			
			if ( Tx.Ticks == Tx.nBit  )       //  Tx end  
            {
				if ( Tx.BitCnt >= Tx.MaxBit /*  _RXBIT */ )    //  if All bit is sent 
				{
					Tx.State = RC_ETx;
					TX = TxLow; 
					Tx.Ticks = 0;
				}
				else
				{
                	Tx.State = RC_Bit;
					TX = TxLow; 
					Tx.Ticks = 0;
				
					if ( NextTxBit() )
						Tx.nBit = N_Bit1;
					else
						Tx.nBit = N_Bit0; 
				}
            }
			else if ( Tx.Ticks == 1 )
			{
				TX = TxHigh;
			} 
			else if ( Tx.Ticks == 0 )
				TX = TxLow;
			break;		
		
		case ( RC_ETx ) :         //  STx   
			if ( Tx.Ticks == N_ETx  )       //  end  
            {
                Tx.State = RC_Ready;
				TX = TxHigh; 
				Tx.Ticks = 0;
				Tx.Run = FALSE;
				
				RxStart();
			}			
            break;
        default:
            break;
    }
	
	if (Tx.Ticks < 255)                   //  Every 100uSec 
        Tx.Ticks++;
}

//
//
//
void TxInit(void)
{
	Tx.BitCnt = 0;
    Tx.State = RC_Ready;
    Tx.Ticks = 0;		//NREADY;
    Tx.Run = FALSE;
}

//
// Tx Start
//
void TxStart( uint8_t *data, uint8_t len)
{
	uint8_t i;
	
    if ( Tx.Run ) return;	

	RxStop();
	
	for ( i = 0 ; i < len ; i++ )
	{
		Tx.Buf[i] = data[i];
	}

	Tx.MaxBit = len * 8;
    Tx.BitCnt = 0;
    Tx.State = RC_Ready;
    Tx.Ticks = 0;		
    Tx.Run = TRUE;
}

//
// get next Tx bit
//
uint8_t NextTxBit()
{
	uint8_t ret;
	
    if ( Tx.Buf[ Tx.BitCnt / 8 ] & 0x80 ) /*  �ֻ��� ��Ʈ���� ����  */
        ret = 1;  
    else
        ret = 0;  
        
    Tx.Buf[ Tx.BitCnt / 8 ] <<= 1;
    Tx.BitCnt++;
	
	return ret;
}


//
// Rx Capture interrupt handler
//
void OnCapture(uint32_t width)
{
	static uint32_t width0 = 0;

	uint8_t capture;
	uint8_t kk;
	uint8_t i;
	
	RxDelay_1mS = _RX_DELAY;		// Rx Timeout Delay 10 mS
	
	// Filter 20150505
	if ( (width>>9) < 6 )
	{
		capture = (unsigned char)( (width + width0) >>9);
		width0 = width;
	}
	else
	{
		capture = (unsigned char)(width>>9);
		width0 = 0;
	}	
	
	//capture = (unsigned char)(width>>9);	
		
	if ( capture >= 12 ) 					// Start bit
		Rx.BitCnt = 0;		
	else if ( capture > 7 && capture < 11 ) // Bit 1
	{	
		Rx.Buf[Rx.BitCnt / 8] <<= 1;
		Rx.Buf[Rx.BitCnt / 8] |= 1;
		Rx.BitCnt++;	
	}
	else if ( capture > 5 && capture < 8 )  // Bit 0
	{
		Rx.Buf[Rx.BitCnt / 8] <<= 1;
		Rx.BitCnt++;
	}
}

//
// Rx Capture interrupt Start
//
void RxStart()
{
	R_TAU0_Channel0_Start();	
}

//
// Rx Capture interrupt Stop
//
void RxStop()
{
	R_TAU0_Channel0_Stop();	
}

//
// Read Rx received data 
//
void RxRead( uint8_t *data, uint8_t len)
{
	uint8_t i;
	
	for ( i = 0 ; i < len ; i++ )
	{
		data[i] = Rx.Buf[i];
		RxBuf[iPacket].Byte[i] = Rx.Buf[i];		// Copy to Receive Q
	}

	if ( iPacket < MAX_PACKET )
		iPacket ++;
	else
		iPacket = 0 ;
		
	Rx.BitCnt = 0;		
}

//
// 
//
uint8_t BytesToRead( )
{
	if ( RxDelay_1mS > 0 ) 
		return 0;
	else
		return (uint8_t) (Rx.BitCnt / 8);	
}

