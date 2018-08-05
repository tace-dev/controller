/**
  */ 
#include "_stdafx.h"
//#include "stm8s_tim1.h"

#if !defined(MOTOR_CPU)

#if defined (_RC_WD_)	
#define WAIT_OFF		540		//	60ms
#elif defined (_RINNAI_BOILER_)
#define WAIT_OFF		10		//	1ms
#else
#define WAIT_OFF		1540	//	160ms
#endif

WIREDEF	wireRC = { 0, { 0, 0 } };

#define D_IOUART_HIGH		D_IO_HIGH(D_IOUART_TX_PORT, D_IOUART_TX_PIN)
#define D_IOUART_LOW		D_IO_LOW(D_IOUART_TX_PORT, D_IOUART_TX_PIN)

/*	rc for RoomControl
*/
volatile uint8_t	indiIOUartWrite = 0;
//volatile uint8_t	indiIOUartSendWait = 0;

volatile uint16_t	indiIOUartSendWait = 0;

volatile uint8_t	indiIOUartSendReady = 0;
volatile uint8_t	pktIOUartWriteBuffer[8];
volatile uint8_t	indiIOUartIdle = 1;

volatile uint8_t	rcIOUartTxBuffer[8];

volatile uint8_t	rci1 = 0;
volatile uint8_t	rci2 = 0;

//	tx
volatile uint8_t	rcStatus = 0;

CONST uint8_t	__rcCntl_Start[21] = 
{
	1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 
	0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 
	0
};

CONST uint8_t	__rcCntl_Port[2] = { 3, 5 }; 
CONST uint8_t	__iBitTable[] = { 0x80, 0x40, 0x20, 0x10, 0x08, 0x04, 0x02, 0x01 };

//uint8_t	iStatus = 0;
uint8_t	iBit = 0;
uint8_t	iByte = 0;
uint8_t	iData = 0;
uint8_t	iBuf[8];

void	iouart_Open(void)
{
	GPIO_Init(D_IOUART_TX_PORT, D_IOUART_TX_PIN, D_IO_OUT_TRIGER);
	
#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_) || defined (_RC_DW_VENT_)

#elif defined (_CNV_) || defined(_FACTORY_CNT_)
//	GPIO_ExternalPullUpConfig(D_IOUART_RX_PORT, D_IOUART_RX_PIN, ENABLE);
//	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_LOW);
	/*
	*/
	TIM1_ICInit(
		TIM1_CHANNEL_2, 
		TIM1_ICPOLARITY_FALLING,
//		TIM1_ICPOLARITY_RISING,
		TIM1_ICSELECTION_DIRECTTI,
		TIM1_ICPSC_DIV1,
		0
		);
	TIM1_ClearFlag(TIM1_FLAG_CC2);	
	TIM1_ITConfig(TIM1_IT_CC2, ENABLE);
	TIM1_Cmd(ENABLE);
//	GPIO_Init(D_IOUART_RX_PORT, D_IOUART_RX_PIN, D_IO_IN_TRIGER);
//	EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOC, EXTI_SENSITIVITY_FALL_LOW);

#elif defined (_WOODANG_CNT_)

	GPIO_Init(D_IOUART3_TX_PORT, D_IOUART3_TX_PIN, D_IO_OUT_TRIGER);

#endif
}

uint8_t	*iouart_getBuffer(void)
{
	return rcIOUartTxBuffer;
}

uint8_t	*iouart_getReadBuffer(void)
{
	return iBuf;
}

void	iouart_Set_Packet(uint8_t wait)
{
	indiIOUartSendReady = 1;
	indiIOUartSendWait = wait + WAIT_OFF; 
}

void	iouart_Pkt_Start(void)
{
	indiIOUartIdle = 1;	//	Busy
	rcStatus = 1;
	indiIOUartSendReady = 0;
	IOUART(DISABLE);
}

uint8_t	_iouart_50ms_high = 0;

void	_iouart_50ms(void)
{
	WIRE_CNTL(wireRC);
//	if( wireRC.high != 1 )
//		return;
//
//	wireRC.high = 0;
//	WIRE_LOW(wireRC);
}

uint8_t	iouart_Write(void)
{
	uint8_t	t;
	if( rci1 != 0 )
	{
		rci1 -= 1;
		D_IOUART_LOW;
	}
	else
	{
		if( rcStatus == 0 )
		{
			//	Disable Rx
			D_IOUART_LOW;
			return 1;
		}			
		if( rcStatus <= 21 )
		{
			if( __rcCntl_Start[rcStatus-1] == 1 )
			{
				_iouart_50ms_high = 1;
				D_IOUART_HIGH;
			}
			else
			{
				D_IOUART_LOW;
			}
		}
		else if( rcStatus <= 85 )	//	21+64
		{
			t = rcIOUartTxBuffer[(uint8_t)(rci2>>3)];
			t = (uint8_t)(t & __iBitTable[(uint8_t)(rci2&0x07)]);
			if( t != 0 )
				t = 1;
			rci1 = __rcCntl_Port[t];
			rci2 += 1;
			_iouart_50ms_high = 1;
			D_IOUART_HIGH;
		}
		else if( rcStatus <= 87 )	//	(21+64)+2
		{
			_iouart_50ms_high = 1;
			D_IOUART_HIGH;
		}
		else
		{
			D_IOUART_LOW;
			rcStatus = 0;
			rci1 = 0;
			rci2 = 0;
			indiIOUartIdle = 0;	//	Not Busy
			IOUART(ENABLE);
			return 2;
		}
		rcStatus += 1;
	}	
	return 0;
}

volatile uint8_t	_is = 0;

uint8_t		iouart_Ready(void)
{	
	uint8_t	i;
	uint8_t	cs;

	cs = _io_tail;
	i = (_io_buf[_io_tail]+1)/2;
	_io_tail += 1;
	if( _io_tail == _IO_BUF_SIZE )
		_io_tail = 0;

	if( _is == 0 )
	{
		iBit = iByte = iData = 0;
		if( i == 12 )
			_is = 1;
	}
	else if( _is == 1 )
	{
		_io_buf[cs] = 0;
		_is = i == 8 || i == 9 || i == 10 ? 2 : 0;
	}
	else if( _is == 2 )
	{
		if( i > 5 )
			iData |= __iBitTable[iBit];

		iBit++;
		if( iBit == 8 )
		{
			iBit = 0;
			iBuf[iByte++] = iData;
			if( iByte == 8 )
			{
				_is = cs = 0;
				for( i=0; i<7; i++ )
					cs += iBuf[i];
				return cs != iData ? 2 : 1;
			}
			iData = 0;
		}
	}
	return 0;
}
#endif	//MOTOR_CPU
