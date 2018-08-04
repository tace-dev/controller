#include "stdafx.h"

//#define _DAEWOO_BOILER_
/*
	RINNAI - '9'
 */
#define _IO9d_BUF_SIZE		48

#if defined (_DAEWOO_BOILER_)
/*
 *	iouart3
 */
#if defined (_WOODANG_CNT_)

volatile uint8_t	_io9d_buf[_IO9d_BUF_SIZE];
volatile uint8_t	_io9d_head = 0;
volatile uint8_t	___k_9d = 0;

volatile uint16_t	_u9dSendWait = 0;
volatile uint8_t	_u9dIdle = 0;
volatile uint8_t	_u9dTxBuf[5];
volatile uint8_t	_u9d_i1 = 0;
volatile uint8_t	_u9d_i2 = 0;

volatile uint8_t	_u9dpacket[5];

//	tx
volatile uint8_t	_u9ds = 0;
volatile uint8_t	_u9dsi = 0;

extern uint8_t	__rcCntl_Start[];
extern uint8_t	__rcCntl_Port[];
extern uint8_t	__iBitTable[];

uint8_t	_uBuf9d[5+1];

uint8_t	dw_s = 0;
uint8_t	dw_i = 0;

uint8_t	dw_ready = 0;

uint8_t	iouart9d_ReadyBuf(void)
{
	return dw_ready == 1 ? 1 : 0;
}

void	__timer1CiCb_Dw(void)
{
	uint8_t	i;

	if( _u9dIdle != 0 )
		return;
		
	i = GPIO_ReadInputData(D_IOUART9d_READ_PORT);
	i = i & D_IOUART9d_READ_PIN;
	
	//i = i==0 ? 1 : 0;
	if( dw_s == 0 )
	{
		if( i == 0 )
			return;
		//	H
		___k_9d = 1;
		_io9d_head = 0;
		dw_s = 10;
		dw_ready = 0;
	}
	else if( dw_s == 10 )
	{
		___k_9d++;
		if( i == 1 )
			return;
		//	6.5ms >, H -> L
		dw_s = ___k_9d > 130 ? 9 : 0;
	}
	else if( dw_s == 9 )
	{
		//	L
		if( i == 0 )
			return;
		dw_s = 1;
		___k_9d = 1;
	}
	else if( dw_s == 1 )
	{
		//	H
		___k_9d++;
		if( i != 0 )
			return;
			
		_io9d_buf[_io9d_head++] = ___k_9d;
		if( _io9d_head == 4 )
		{
			dw_s = 0;
			dw_ready = 1;
			return;
		}
		if( _io9d_head == _IO9d_BUF_SIZE )
		{
			dw_s = 0;
			return;
		}
		dw_s = 2;
		dw_i = 0;
	}
	else if( dw_s == 2 )
	{
		//	L
		if( i != 0 )
		{
			dw_s = 1;
			___k_9d = 1;
			return;
		}
		dw_i++;
		if( dw_i > 200 )
			dw_s = 0;
	}
}

void	iouart9d_Open(void)
{
}

uint8_t	*iouart9d_getBuffer(void)
{
	return _u9dTxBuf;
}

uint8_t	*iouart9d_getReadBuffer(void)
{
	return _uBuf9d;
}

void	iouart9d_Set_Packet(uint8_t wait)
{
	_u9dSendWait = wait;
}

void	iouart9d_Pkt_Start(void)
{
	_u9ds = 0;
	_u9d_i1 = 0;
	_u9d_i2 = 0;
	_u9dIdle = 1;	//	Busy
}

uint8_t	_iouart9d_getCh(void)
{
	uint8_t	t, i, j;
	i = _u9d_i2/8;
	j = _u9d_i2%8;
	t = _u9dTxBuf[i] & __iBitTable[j];
	_u9d_i2++;
	if( t != 0 )
	{
		_u9d_i1 = 20;
	}
	else
	{
		_u9d_i1 = 60;
	}
	return t;
}

uint8_t	iouart9d_Write(void)
{
	uint8_t	t;
	if( _u9ds == 0 )
	{
		D_IOUART9d_HIGH;
		_u9ds = 1;
		_u9d_i1 = 140;	//	7ms
	}
	else if( _u9ds == 1 )
	{
		_u9d_i1--;
		if( _u9d_i1 == 0 )
		{
			D_IOUART9d_LOW;
			_u9ds = 11;
			_u9d_i1 = 40;	//	2ms
		}
	}
	else if( _u9ds == 11 )
	{
		_u9d_i1--;
		if( _u9d_i1 == 0 )
		{
			_iouart9d_getCh();
			D_IOUART9d_HIGH;
			_u9ds = 9;
		}		
	}
	else if( _u9ds == 9 )
	{
		_u9d_i1--;
		if( _u9d_i1 == 0 )
		{
			D_IOUART9d_LOW;
			_u9ds = 91;
			_u9d_i1 = 40;
		}		
	}
	else if( _u9ds == 91 )
	{
		_u9d_i1--;
		if( _u9d_i1 == 0 )
		{
			_iouart9d_getCh();
			D_IOUART9d_HIGH;
			_u9ds = 2;
		}
	}
	else if( _u9ds == 2 )
	{
		_u9d_i1--;
		if( _u9d_i1 == 0 )
		{
			D_IOUART9d_LOW;
			_u9ds = 10;
			_u9d_i1 = 40;
			if( (_u9d_i2/8) >= 3 )
			{
				//end of packet
				_u9dIdle = 0;
			}
		}
	}
	else if( _u9ds == 10 )
	{
		_u9d_i1--;
		if( _u9d_i1 == 0 )
		{
			_iouart9d_getCh();
			D_IOUART9d_HIGH;
			_u9ds = 2;
		}
		//	end of packet
		//_u9dIdle = 0;
		//D_IOUART9d_LOW;
	}
	return 0;
}

uint8_t	dw_parity(void)
{
	uint8_t	i;
	i = _uBuf9d[0];
	i += _uBuf9d[1];
	i += 1;
	return i == _uBuf9d[2] ? 0 : 1;
}

void	dw_parity_make(void)
{
	uint8_t	*p = _u9dTxBuf;
	uint8_t	i;
	i = p[0];
	i += p[1];
	i += 1;
	p[2] = i;
}

uint8_t		iouart9d_Ready(void)
{	
	uint8_t	i, j;
	uint8_t	_ubit9;
	uint8_t	_uByte9;	
	uint8_t	_uData9;
	
	j = 0;
	_ubit9 = _uData9 = _uByte9 = 0;
	while(1)
	{
		i = _io9d_buf[j++];
		if( i >= 100 )
			_uData9 |= __iBitTable[_ubit9];
		_ubit9++;
		if( _ubit9 == 8 )
		{
			_ubit9 = 0;
			_uBuf9d[_uByte9++] = _uData9;
			_uData9 = 0;
			if( _uByte9 == 3 )
			{
				dw_ready = 0;
				if( dw_parity() == 0 )
				{
					for( i=0; i<3; i++ )
						_u9dpacket[i] = _uBuf9d[i];
					return 1;
				}
				return 0;// 
			}
		}
		if( j>=40 )
			return 0;
	}
	return 0;
}

#endif
#endif	//	DAEWOO_BOILER
