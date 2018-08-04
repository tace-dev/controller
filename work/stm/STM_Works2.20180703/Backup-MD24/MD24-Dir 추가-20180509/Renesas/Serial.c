/******************************************************************************
SERIAL.c

Create : 2012.03.19


*******************************************************************************/

#include "r_cg_macrodriver.h"
#include "r_cg_serial.h"
#include "r_cg_userdefine.h"

#define MAX_Q 10
#define MAX_TXQ     5
#define MAX_MSG_LEN 20

unsigned char Umsg[MAX_MSG_LEN];

struct uartQ  {
    unsigned char Q[MAX_Q];
    unsigned char front;
    unsigned char rear;
    unsigned char size;         /* 읽은 문자수  */
    //unsigned long ticks;  
};

struct {
    uint8_t * msg;
    uint16_t msgLen;    
} TxUartQ[MAX_TXQ+1];

unsigned char TxQIdx;


struct 
{
    unsigned long Ticks;
    unsigned int TimeOut;
    unsigned char Command;
    unsigned char Object;
    uint8_t DataIn : 1;
    uint8_t RxRunning : 1;
    uint8_t TxRunning : 1;
} UART ;    

struct uartQ RxQ = {  {""}, 1, 0, 0}; 
struct uartQ TxQ = {  {""}, 1, 0, 0};

MD_STATUS R_UART0_Receive( );
void ADDQ( struct uartQ *Queue, unsigned char data);
unsigned char DELQ( struct uartQ *Queue );

unsigned char rsbuf[10];

// R_UART0_Start();
// R_UART0_Receive(ch, 1);

/*
void UartStart( )
{
    unsigned int result;
    
    //R_UART0_Start();
    result = R_UART0_Receive(rsbuf, 1);         // 1byte 마다 수신 처리
}
*/

//
//
//  static void r_uart0_callback_receiveend(void) 에서 호출

/*
void DataReceived()
{
    unsigned int result;
    
    //RxQ.ticks = GetTicks();
    result = R_UART0_Receive(rsbuf, 1);         // 수신 바이트수 설정
    ADDQ( &RxQ, rsbuf[0]);                      // 1 byte 수신
}
*/

void ADDQ( struct uartQ *Queue, unsigned char data)
{
    Queue->size++;                                 // 수신문자수 증가
    Queue->Q[Queue->front]= data;
    Queue->front++;
    Queue->front = Queue->front % MAX_Q;
        
    //  Queue is full 
    if ( Queue->rear == Queue->front )
    {   
		Queue->size--;
        Queue->rear++;
        Queue->rear = Queue->rear % MAX_Q;  // Overwrite old data
        Queue->Q[Queue->rear]= 0x00;
     }   
} 

unsigned char DELQ( struct uartQ *Queue )
{
    unsigned char mdata;
    
    mdata = 0x00;
    
    if ( Queue->rear <  Queue->front )
    {
		if ((Queue->front -  Queue->rear) > 1)
        {
            Queue->size--;
            Queue->rear++;
            Queue->rear = Queue->rear % MAX_Q;
            mdata = Queue->Q[Queue->rear];
            Queue->Q[Queue->rear]= 0x00;
            
        }
	}	
	else
	{
	    Queue->size--;
	    Queue->rear++;
		Queue->rear = Queue->rear % MAX_Q;
	    mdata = Queue->Q[Queue->rear];
	    Queue->Q[Queue->rear]= 0x00;
		
	}		
    return mdata;        
} 


unsigned char RSSize( struct uartQ *Queue )
{
    return Queue->size;
}


/*
//MD_STATUS R_UART0_Send(uint8_t * const tx_buf, uint16_t tx_num)  
void UartSend(uint8_t * const tx_buf, uint16_t tx_num)
{
    unsigned int result;
    
    if ( UART.TxRunning ) 
    {
        if ( TxQIdx < MAX_TXQ )
        {
            TxUartQ[TxQIdx].msg = tx_buf;
            TxUartQ[TxQIdx].msgLen = tx_num;
            TxQIdx++;        
        }
    }
    else
    {
        UART.TxRunning = TRUE;
        result = R_UART0_Send(tx_buf, tx_num);
    }
}
*/

//
//
//  static void r_uart0_callback_sendend(void)에서 호출  
/*
void EndUartSend()
{
    unsigned char i;
    unsigned int result;
    
    if ( TxQIdx  )  //  다음 메세지 송신 
    {
        result = R_UART0_Send( TxUartQ[0].msg, TxUartQ[0].msgLen);
        TxQIdx--; 
        for ( i = 0 ; i < MAX_TXQ ; i++ )
        {
            TxUartQ[i].msg = TxUartQ[i+1].msg;
            TxUartQ[i].msgLen = TxUartQ[i+1].msgLen;
        } 
    }
    else            //  모두 송신했으면  
    {
        UART.TxRunning = FALSE;
    }
}
*/
uint8_t UartTxRunning()
{
    return UART.TxRunning;
}


/*  16진수 1자리 변환               */
unsigned char HEX1(unsigned char ch)
{
    if ( ch >= 0 && ch <= 9 ) 
        return ch + '0';
    if ( ch >= 10 && ch <= 15 )
        return (ch-10) + 'A';
    return ' ';        
}

/*  10진수 1자리 변환               */
unsigned char DEC1(unsigned char ch)
{
    if ( ch >= 0 && ch <= 9 ) 
        return ch + '0';
//    if ( ch >= 10 && ch <= 15 )
//        return (ch-10) + 'A';
    return ' ';        
}



void ClearMsg( unsigned char *buffer, unsigned char len )
{
    unsigned char i;
    
    for ( i = 0; i < len; i++)
        buffer[i] = ' ';
}




void PrintRunData()
{
    unsigned char i;
    unsigned char vdata;
    
    ClearMsg( Umsg, MAX_MSG_LEN );
    
    Umsg[0] = 0x0d;     //  CR
    Umsg[1] = 0x0a;     //  CR
    
    for ( i = 0 ; i < 8; i++ )
    {
        //vdata = ValvePosition(i);
        Umsg[i*3+2] = HEX1( vdata >> 4 );
        Umsg[i*3+3] = HEX1( vdata & 0x0f );
        Umsg[i*3+4] = '-';
    }
    
    Umsg[25] = ' ';
    for ( i = 0 ; i < 8; i++ )
    {
        //vdata = FlowRate(i);
        Umsg[26+i*3] = HEX1( vdata / 10 );
        Umsg[26+i*3+1] = HEX1( vdata % 10 );
        Umsg[26+i*3+2] = '-';
    }
    
    Umsg[49] = ' ';
    for ( i = 0 ; i < 8; i++ )
    {
       // vdata = RCAmbTemp( i );
        Umsg[50+i*3] = HEX1( vdata / 10 );
        Umsg[50+i*3+1] = HEX1( vdata % 10 );
        Umsg[50+i*3+2] = '-';
    }
    
    //vdata = ValveRunData();
    Umsg[74] = HEX1( vdata >> 4 );
    Umsg[75] = HEX1( vdata & 0x0f );
    
    //UartSend( Umsg, 76);
}

void PrintRxData(uint8_t *RData , uint8_t RLen)
{
    unsigned char i;
    unsigned char vdata;
    
    ClearMsg( Umsg, MAX_MSG_LEN );
    
    //Umsg[0] = 0x0d;     //  CR
    //Umsg[1] = 0x0a;     //  CR
    Umsg[0] = '*';     //  CR
	
    for ( i = 0 ; i < RLen; i++ )
    {
        vdata = RData[i];
        Umsg[i*3+1] = HEX1( vdata >> 4 );
        Umsg[i*3+2] = HEX1( vdata & 0x0f );
        Umsg[i*3+3] = ' ';
    }
    Umsg[i*3+1] = 0x0d;     //  CR
    Umsg[i*3+2] = 0x0a;     //  CR
	    
    //UartSend( Umsg, i*3+3);
}
