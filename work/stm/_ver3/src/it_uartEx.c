/**
  */ 
#include "stdafx.h"
#include "function.h"

#define _TTA_

#ifdef	_TTA_

#if defined (_WOODANG_CNT_)

//#define _uTta		_uc
#define TTAI_SIZE		32
uint8_t	_ttabuf[TTAI_SIZE];
uint8_t	_ttai;
uint8_t	_ttabufi;
uint8_t	_ttaSendReady = 0;
uint8_t	_ttat0, _ttat1;

#else

#define D_485Tta_WRITE_ON		D_485_WRITE_ON
#define D_485Tta_READ_ON		D_485_READ_ON
#define D_485Tta_PIN		D_485_READ_PIN
#define D_485Tta_PORT		D_485_PORT

#define TXTta_BUFFER_SIZE			(48)
#define RXTta_BUFFER_SIZE			(48)

volatile uint8_t TxBufferTta[TXTta_BUFFER_SIZE];
volatile uint8_t RxBufferTta[RXTta_BUFFER_SIZE];

volatile uint8_t _uartTta_tx_head;
volatile uint8_t _uartTta_tx_tail;
volatile uint8_t _uartTta_rx_head;
volatile uint8_t _uartTta_rx_tail;

#if defined (_485_TO_UART)

volatile uint8_t indi485TtaReady = 0;
volatile uint8_t indi485TtaSendWait;
volatile uint8_t indi485TtaSendReady;
volatile uint8_t indi485TtaSendSize;

#endif

U485INFO_2	_uTta;

#endif

extern uint8_t	_t1ms;
extern uint8_t	ext_hn_ready;

#if !defined (_WOODANG_CNT_)

uint8_t	uartTta_Ready(void)	
{ 
	return (uint8_t)(_uartTta_rx_head != _uartTta_rx_tail ? 1 : 0); 
}

void	uartTta_tx_485(uint8_t s)
{
#if defined (_485_TO_UART)
	D_485Tta_WRITE_ON;
#endif
	indi485TtaReady += s+1;
}

void	uartTta_tx_put(uint8_t *buf, uint8_t size)
{
	uint8_t i;
	for( i=0; i<size; i++ )
		TxBufferTta[_uartTta_tx_head] = buf[i];

	_uartTta_tx_head = (uint8_t)((_uartTta_tx_head + size) % TXTta_BUFFER_SIZE);
	uartTta_tx_485(size);
}

void	uartTta_tx_irq(void)
{
	if( _uartTta_tx_head == _uartTta_tx_tail )
	{
//		COM3_ITConfig(COM3_IT_TXE, DISABLE);
		return;
	}
//	COM3_DR = TxBufferTta[_uartTta_tx_tail++];
	if( _uartTta_tx_tail == TXTta_BUFFER_SIZE )
		_uartTta_tx_tail = 0;
}

void	uartTta_rx_irq(void)
{
//    RxBufferTta[_uartTta_rx_head++] = COM3_DR;
	if( _uartTta_rx_head == RXTta_BUFFER_SIZE )
		_uartTta_rx_head = 0;
//	UART3_ClearITPendingBit(UART3_IT_RXNE);
}

uint8_t	uartTta_get(void)
{
	uint8_t	t = RxBufferTta[_uartTta_rx_tail++];
	if( _uartTta_rx_tail == RXTta_BUFFER_SIZE)
		_uartTta_rx_tail = 0;
	return t;
}

//uint8_t	uartTta_pkt_ready(void)
//{
//	uint8_t	i = (uint8_t)((_uartTta_rx_head - 1 + RXTta_BUFFER_SIZE) % RXTta_BUFFER_SIZE);
//	return (uint8_t)(RxBufferTta[i]==/*PKT_485_ETX*/0 ? 1 : 0);
//}

#endif

void	systemUartTta(void)
{
#if defined (_RC_WD_) || defined (_RC_DR_) || defined (_RC_DW_)

	CLK_PeripheralClockConfig(CLK_Peripheral_USART1, ENABLE);
	GPIO_ExternalPullUpConfig(D_USART_TX_PORT, D_USART_TX_PIN, ENABLE);
	GPIO_ExternalPullUpConfig(D_USART_RX_PORT, D_USART_RX_PIN, ENABLE);

	USART_Init(COM1, 
		9600, 
		USART_WordLength_8b, 
		USART_StopBits_1,
		USART_Parity_No, 
		(USART_Mode_TypeDef)(USART_Mode_Tx | USART_Mode_Rx
		)
	);
	COM1_ITConfig(COM1, COM1_IT_RXNE, ENABLE);
	COM1_ITConfig(COM1, COM1_IT_TC, ENABLE);
	COM1_Cmd(USART1, ENABLE);
	
#else

	UART1_Init( 
		(uint32_t)9600, 
		UART1_WORDLENGTH_8D, 
		UART1_STOPBITS_1, 
		UART1_PARITY_NO,
		UART1_SYNCMODE_CLOCK_DISABLE, 
		UART1_MODE_TXRX_ENABLE
		);
	COM1_ITConfig(COM1_IT_RXNE_OR, ENABLE);
	COM1_ITConfig(COM1_IT_TXE, ENABLE);
	COM1_Cmd(ENABLE);

#endif	
#if defined (_485_TO_UART)
//	GPIO_Init(D_485Tta_PORT, D_485Tta_READ_PIN, D_IO_OUT_TRIGER);
//	GPIO_ExternalPullUpConfig(D_485Tta_PORT, D_485Tta_READ_PIN, ENABLE);
//	D_485Tta_READ_ON;
#endif

#if !defined (_WOODANG_CNT_)
	_uartTta_rx_head = _uartTta_rx_tail = _uartTta_tx_head = _uartTta_tx_tail = 0;
#endif
}

uint8_t	_tta[4];

#define VENT_HEAT		0x20
#define VENT_CO2		0x10
#define VENT_SMOKE		0x08
#define VENT_FILTER		0x04
#define VENT_EX			0x02
#define VENT_FAN		0x01

#define VENT_EN_CO2		0x20
#define VENT_EN_SAVE	0x10
#define VENT_EN_AUTO	0x08
#define VENT_EN_HEAT	0x04
#define VENT_EN_SLEEP	0x02
#define VENT_EN_NORMAL	0x01

#define VENT_MODE_NORMAL	0x01
#define VENT_MODE_SLEEP		0x02
#define VENT_MODE_HEAT		0x03
#define VENT_MODE_AUTO		0x04
#define VENT_MODE_SAVE		0x05

typedef struct tagVentInfo
{
	uint8_t	err;
	uint8_t	power;
	uint8_t	wind;
	uint8_t	status;
	uint8_t	status_enable;
	uint8_t	mode;
}	VENTINFO, *LPVENTINFO;
VENTINFO	ventInfo;

LPVENTINFO	get_ventInfo(void)
{
	return &ventInfo;
}

uint8_t	tta_xor(uint8_t j)
{
	uint8_t	i, k = 0;
	for( i=0; i<j; i++ )
		k ^= _ttabuf[i];
	return k;
}

uint8_t	tta_sum(uint8_t j)
{
	uint8_t	i, k = 0;
	for( i=0; i<j; i++ )
		k += _ttabuf[i];
	return k;
}

#define TTA_SEND(i)	{\
					_ttaSendReady = 1;\
					_ttat0 = _t1ms;\
					_ttat1 = 11;\
					_ttabuf[i+1] = tta_xor(i);\
					_ttabuf[i+2] = tta_sum(i+1);\
					_ttabuf[4] = i-7;\
					_ttabufi = i+2;\
					}
					
void	loopTtaCb()
{
	if( _ttaSendReady == 1 )
	{
		if( _ttat0 != _t1ms )
		{
			_ttat0 = _t1ms;
			_ttat1--;
			if( _ttat0 == 0 )
			{
				_ttaSendReady = 0;
				uart3_tx_put(_ttabuf, _ttabufi);
			}
		}
	}	
}

void	ttaVent(void)
{
	LPVENTINFO	p = get_ventInfo();
	/*
		0x01 - request status
		0x0f - request attribute
		0x41 - power on/off
		0x42 - wind speed control
		0x43 - mode
		0x42 - request all device

		0x81 - response 0x01
		0x8f - response attribute
		0xc1 - response power on/off
		0xc2 - wind speed
		0xc3 - mode
		
		0x42
		0x01~3f
		0x40~7f	return 1
	 */
	if( _ttabuf[3] == 0x01 )	//	request status
	{
		//	return 
		_ttabuf[3] |= 0x80;
		_ttabuf[5] = p->err;	//	0 OK
		_ttabuf[6] = p->power;	//	0 off, 1 return to prev
		_ttabuf[7] = p->wind & 0x0f;	//	0 off, 1~3
		_ttabuf[8] = p->mode;	//	0 normal, 1 sleep, 2 heat, 3 auto, 5 save
		_ttabuf[9] = p->status;
		TTA_SEND(10)
	}
	else if( _ttabuf[3] == 0x0f )	//	attribute
	{
		_ttabuf[3] |= 0x80;
		_ttabuf[5] = p->wind>>4;
		_ttabuf[6] = p->status_enable;
		TTA_SEND(7)
	}
	else if( _ttabuf[3] == 0x41 )	//	power on/off
	{
		_ttabuf[3] |= 0x80;
		_ttabuf[5] = p->err;	//	0 OK
		_ttabuf[6] = p->power;	//	0 off, 1 return to prev
		_ttabuf[7] = (p->status & VENT_CO2) ? 1 : 0;
		_ttabuf[8] = p->mode;	//	0 normal, 1 sleep, 2 heat, 3 auto, 5 save
		_ttabuf[9] = p->status;
		TTA_SEND(10)
	}
	else if( _ttabuf[3] == 0x42 )	//	wind speed
	{
		_ttabuf[3] |= 0x80;
		_ttabuf[5] = p->err;	//	0 OK
		_ttabuf[6] = p->power;	//	0 off, 1 return to prev
		_ttabuf[7] = (p->status & VENT_CO2) ? 1 : 0;
		_ttabuf[8] = p->mode;	//	0 normal, 1 sleep, 2 heat, 3 auto, 5 save
		_ttabuf[9] = p->status;
		TTA_SEND(10)
	}
	else if( _ttabuf[3] == 0x43 )	//	mode
	{
		_ttabuf[3] |= 0x80;
		_ttabuf[5] = p->err;	//	0 OK
		_ttabuf[6] = p->power;	//	0 off, 1 return to prev
		_ttabuf[7] = (p->status & VENT_CO2) ? 1 : 0;
		_ttabuf[8] = p->mode;	//	0 normal, 1 sleep, 2 heat, 3 auto, 5 save
		_ttabuf[9] = p->status;
		TTA_SEND(10)
	}
}

#define TEMPE_EN_0_5_DEG	0x10
#define TEMPE_EN_RESERVE	0x08
#define TEMPE_EN_WATER		0x04
#define TEMPE_EN_OUTER		0x02

typedef struct tagTempeInfo
{
	uint8_t	err;
	uint8_t	outer_mode;
	uint8_t	heat_mode;
	uint8_t	reserve_mode;
	uint8_t	water_mode;
	uint8_t	company;
	uint8_t	heat_type;	//	0x01 or 0x02(0x01)
	uint8_t	heat_max;
	uint8_t	heat_min;
	uint8_t	mode;
	uint8_t	count;
//	uint8_t	power;
//	uint8_t	wind;
//	uint8_t	status;
//	uint8_t	status_enable;
}	TEMPEINFO, *LPTEMPEINFO;
TEMPEINFO	tempeInfo;

LPTEMPEINFO	get_tempeInfo(void)
{
	return &tempeInfo;
}

void	ttaTempeResponse(void)
{
	LPTEMPEINFO	p = get_tempeInfo();
	_ttabuf[5] = p->err;	//	0 OK
	_ttabuf[6] = p->heat_mode;	//	bit7:8,...bit0:1
	_ttabuf[7] = p->outer_mode;		//	bit7:8,...bit0:1
	_ttabuf[8] = p->reserve_mode;	
	_ttabuf[9] = p->water_mode;
}

void	ttaTempeSet(uint8_t mode)
{
	LPTEMPEINFO	p = get_tempeInfo();
	uint8_t	sub, id, i, j, k;
	i = 10;
	k = _ttabuf[5];
	sub = _ttabuf[2]>>4;
	id = _ttabuf[2]&0x0f;
	if( id == 0x0f )
	{
		ttaTempeResponse();
	}
	else
	{
		ttaTempeResponse();
		
	}
}

void	ttaTempe(void)
{
	uint8_t	i, j, k;
	LPTEMPEINFO	p = get_tempeInfo();
	/*
		0x01 - request status
		0x0f - request attribute
		0x43 - heater on/off
		0x44 - set temper
		0x45 - reserve
		0x46 - outer
		0x47 - warm water 

		0x01~3f
		0x40~7f	return 1
	 */
	if( _ttabuf[3] == 0x01 )	//	request status
	{
		//	return 
		_ttabuf[3] |= 0x80;
		ttaTempeResponse();
		i = 10;
		for( j=0; j<4; j++ )
		{
			_ttabuf[i++] = 0;//cu
			_ttabuf[i++] = 0;//set
		}
		TTA_SEND(i)
	}
	else if( _ttabuf[3] == 0x0f )	//	attribute
	{
		_ttabuf[3] |= 0x80;
		_ttabuf[5] = p->err;	//	0 OK
		_ttabuf[6] = p->company;
		_ttabuf[7] = p->heat_type;
		_ttabuf[8] = p->heat_max;	
		_ttabuf[9] = p->heat_min;
		_ttabuf[10] = p->mode;
		_ttabuf[11] = p->count;
		TTA_SEND(12)
	}
	else if( _ttabuf[3] == 0x43 )	{	ttaTempeSet(3);	}	//	Heater
	else if( _ttabuf[3] == 0x44 )	{	ttaTempeSet(4);	}	//	Set temp
	else if( _ttabuf[3] == 0x45 )	{	ttaTempeSet(5);	}	//	Outer
	else if( _ttabuf[3] == 0x46 )	{	ttaTempeSet(6);}	//	Reserve
	else if( _ttabuf[3] == 0x47 )	{	ttaTempeSet(7);}	//	water
}

void	loopTta(uint8_t k)
{
	uint8_t i, j, x;
	
#if defined (_WOODANG_CNT_)

#else
	while( uartTta_Ready() )
	{
		k = uartTta_get();
#endif
		_ttabuf[_ttai] = k;
		_ttai = (_ttai+1) % TTAI_SIZE;
		if( _tta[0] == 0 )
		{
			if( k == 0xf7 )
			{
				_tta[0] = 1;
				_ttai = 1;
				_ttabuf[0] = 0xf7;
			}
		}
		else if( _tta[0] == 1 )
		{
			if( k == 0x36 )			//	TTA_THERMAL_
				_tta[0] = 11;
			else if( k == 0x32 )	//	TTA_VSP
				_tta[0] = 11;
			else
				_tta[0] = 0;
		}
		else if( _tta[0] == 11 )	{	_tta[0] = 12;	}	/*	sub*/	
		else if( _tta[0] == 12 )	{	_tta[0] = 13;	}	/*	cmd*/
		else if( _tta[0] == 13 )	//	size
		{
			_tta[2] = 0;
			_tta[1] = k;
			_tta[0] = k==0 ? 15 : 14;
		}
		else if( _tta[0] == 14 )
		{
			_tta[2]++;
			if( _tta[2] == _tta[1] )
				_tta[0] = 15;
		}
		else if( _tta[0] == 15 )	{	_tta[0] = 16;	}	/*	xor*/
		else if( _tta[0] == 16 )	{	_tta[0] = 17;	}	/*	xsum*/
		
		if( _tta[0] == 17 )
		{
			_tta[0] = 0;
			x = 0;
			for( i=0; i<5+_ttabuf[4]; i++ )
				x ^= _ttabuf[i];
			if( x == _ttabuf[6+_ttabuf[4]] )
			{
				x = 0;
				for( i=0; i<6+_ttabuf[4]; i++ )
					x += _ttabuf[i];
				if( x == _ttabuf[7+_ttabuf[4]] )
				{
					ext_hn_ready = 1;

					if( (_ttabuf[3] & 0x80) != 0x80 )
					{
						//	ready
						if( _ttabuf[1] == 0x36 )
							ttaTempe();
						else if( _ttabuf[1] == 0x32 )
							ttaVent();
					}
				}
			}
		}		
#if !defined (_WOODANG_CNT_)
	}
#endif
/*			
	if( _uTta.tCount == 1 )
	{
		i = _t1ms;
		if( _uTta.t > i )
			k = 100 + i - _uTta.t;
		else
			k = i - _ub.t;
		if( k >= 5 )
		{
			if( _ub.i == 6 )		extB_KR();
			else if( _ub.i == 17 )	extB_KD();
			else if( _ub.i == 8 )	extB_Rn();
			
			_uTta.i = 0;
			_uTta.tCount = 0;
			_uTta.q = _t1ms;
		}
	}
	if( _uTta.sendReady == 1 )
	{
		if( _uTta.q != _t1ms )
		{
			_uTta.q = _t1ms;
			_uTta.sendCount--;
			if( _uTta.sendCount == 0 )
			{
				_uTta.sendReady = 0;
				uartTta_tx_put(_uTta.r, _uTta.ir);
			}
		}
	}
*/
}

#define VENTi_AIR_SUPPLY	0x01
#define VENTi_AIR_EXHAUST	0x02
#define VENTi_ERR_SENSOR	0x04
#define VENTi_FILTER		0x08
#define VENTi_ERR_OTHER		0x80

typedef struct tagVsp
{
	uint8_t	i[6];
}	VSPTBL, *LPVSPTBL;

#define VSTTABL_MAX			6

VSPTBL	vstTbl[8] = {
	{ 0x4a, 0x66, 0x89, 0x4a, 0x66, 0x89 },
	{ 0x44, 0x71, 0x78, 0x44, 0x71, 0x78 },
	{ 0x3b, 0x62, 0x6f, 0x3b, 0x62, 0x6f },
	{ 0x4d, 0x8d, 0xa0, 0x4d, 0x8d, 0xa0 },
	{ 0x3c, 0x7a, 0x8c, 0x3c, 0x7a, 0x8c },
	{ 0x56, 0x80, 0x89, 0x56, 0x80, 0x89 },
	{ 0x4a, 0x8f, 0x9a, 0x4a, 0x8f, 0x9a },
	{ 0x4a, 0x8f, 0x9a, 0x4a, 0x8f, 0x9a },
};

typedef struct tagVentiInfo
{
	uint8_t	supply;
	uint8_t	exhaust;
	uint8_t	tempe;
	uint8_t	damper;
	uint8_t	co2h;
	uint8_t	co2L;
	uint8_t	hour;
	uint8_t	minute;
	uint8_t	err;
	uint8_t	mode;
}	VENTiINFO, *LPVENTiINFO;

VENTiINFO	ventiInfo;

LPVENTiINFO	get_ventiInfo(void)
{
	return &ventiInfo;
}

#define CS_XOR_SUM(x,s)	{\
						s = x = 0;\
						for( i=1; i<_ttabuf[2]-2; i++ )\
						{\
							x ^= _ttabuf[i];\
							s += _ttabuf[i];\
						}\
						s += x;\
						}
						
uint8_t	_ventibuf2[24];
uint8_t	_ventibuf[24];
uint8_t	_venti;

void	ventiSend(uint8_t id, uint8_t *buf)
{
	LPVENTiINFO	p = get_ventiInfo();
	uint8_t	s, x, i;
	if( id == 0 )
		id = buf[0];
	if( id == 0x01 )
	{
		//	sp1, sp2, themp, damper, na, na, error, emergence, 
	}
	else if( _ventibuf[3] == 0x83 )	//	time
	{
		p->hour = _ventibuf[4];
		p->minute = _ventibuf[5];
		p->tempe = _ventibuf[6];
		
	}
}

void	venti(void)
{
	LPVENTiINFO	p = get_ventiInfo();
	if( _ventibuf[3] == 0x80 )
	{
		p->supply = _ventibuf[4];
		p->exhaust = _ventibuf[5];
		p->tempe = _ventibuf[6];
		p->damper = _ventibuf[7];
		p->co2h = _ventibuf[8];
		p->co2L = _ventibuf[9];
		p->err = _ventibuf[10];
		
	}
	else if( _ventibuf[3] == 0x83 )	//	time
	{
		p->hour = _ventibuf[4];
		p->minute = _ventibuf[5];
		p->tempe = _ventibuf[6];
		p->damper = _ventibuf[7];
		p->co2h = _ventibuf[8];
		p->co2L = _ventibuf[9];
		p->err = _ventibuf[10];
		
	}
	else if( _ventibuf[3] == 0x85 )	//	factory reset
	{
		p->err = _ventibuf[10];
	}
	
}

void	loopVenti(uint8_t k)
{
	uint8_t i, j, x, s;
	
	while( uart3_Ready() )
	{
		k = uart3_get();
		_ventibuf[_ttai] = k;
		_venti = (_venti+1) % TTAI_SIZE;
		if( _tta[0] == 0 )
		{
			if( k == 0xf0 )
			{
				_tta[0] = 1;
				_venti = 1;
				_ventibuf[0] = 0xf7;
			}
		}
		else if( _tta[0] == 1 )
		{
			if( k == 0x61 )
				_tta[0] = 11;
			else
				_tta[0] = 0;
		}
		else if( _tta[0] == 11 )	
		{	
			_tta[2] = 0;
			_tta[1] = k - 2;
			_tta[0] = 12;
		}	/*	len*/	
		else if( _tta[0] == 12 )	
		{	
			_tta[0] = k==0 ? 15 : 13;	
		}	/*	cmd*/
		else if( _tta[0] == 13 )
		{
			_tta[2]++;
			if( _tta[2] == _tta[1] )
				_tta[0] = 15;
		}
		else if( _tta[0] == 15 )	{	_tta[0] = 16;	}	/*	xor*/
		else if( _tta[0] == 16 )	{	_tta[0] = 17;	}	/*	xsum*/
		
		if( _tta[0] == 17 )
		{
			_tta[0] = 0xf0;
			s = x = 0;
			for( i=1; i<_ventibuf[2]-2; i++ )
			{
				x ^= _ventibuf[i];
				s += _ventibuf[i];
			}
			s += x;
			if( x == _ventibuf[_ventibuf[2]-2] && s == _ventibuf[_ventibuf[2]-1] )
			{
				if( (_ventibuf[3] & 0x80) != 0x80 )
					venti();
			}
		}		
	}
}

#else
void	loopTta(void)
{
	return;
}
#endif	//	_TTA_
