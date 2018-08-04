/*
 *
 *	ROOM_CONTROLLER DEFINE 
 *		_RC_WD_	Woodang R/C Version 1.0
 *
 */
/*
 *	STM8L05X_MD_VL _RC_WD_
 */
 
#include "stdafx.h"
#include "uiDef.h"
#include "factory.h"
#include "rc_protocol.h"
#include "rc_lse_protocol.h"

extern void	rcInfoSet(uint8_t id, uint8_t temp);

CONST	uint8_t	ver[] = "heedop=151026";

extern uint8_t	_lcdTimer[];
extern uint8_t	_lcdEnable;
extern uint8_t	_backlight;
extern uint8_t	_backup_backlight;
extern uint8_t	_backup_backlight2;

extern uint8_t only_one;

extern uint8_t	error_display_mode;

#if defined (_RC_WD_)
#elif defined (_RC_DR_) || defined (_RC_DW_)
#include "stm8l15x_beep.h"
#endif

#define _DEBUG_DISPLAY_

#define PACKET_SIZE				8
#define TIME_LONG_TOUCH 	40	//50

uint8_t	currTemp = 0;

uint8_t	packet_buf[PACKET_SIZE];
uint8_t	ui_error = 0;
uint8_t	ui_error_type = 0;

uint8_t rc_type = RC_TYPE_NONE;

uint8_t ui_timeout = 10;

uint8_t	getCurrTemp(void)
{
	return currTemp;
}

uint8_t	_msgLoop(uint8_t mode)
{
	return 0;
}

#define _IO_PACKET_TIMER	200

uint8_t _call_ptc_woodang(void) {
	rc_ptc_check(iouart_getReadBuffer());
	
	switch (getState_check()) {
		case RC_STATE_NORMAL:
			if (only_one != 0) {
				return;
			}
			
			rc_ptc_make(iouart_getBuffer());
			iouart_Set_Packet(_IO_PACKET_TIMER);
			iouart_Pkt_Start();
			break;
		case RC_STATE_SETTING:
			rc_ptc_make_setting(iouart_getBuffer());
			iouart_Set_Packet(_IO_PACKET_TIMER);
			iouart_Pkt_Start();
			break;
		case RC_STATE_MIRROR:
			rc_ptc_make_mirror(iouart_getBuffer());
			iouart_Set_Packet(_IO_PACKET_TIMER);
			iouart_Pkt_Start();
			break;
		case RC_STATE_FACTORY:
			return 3;
			break;
	}
	return 0;
}

uint8_t _call_ptc_lse(void) {
#if defined (_RC_WD_)
	rc_lse_ptc_check(iouart_getReadBuffer());
	
	switch (getLSEState_check()) {
		case RC_LSE_STATE_NORMAL:
			rc_lse_ptc_make(iouart_getBuffer());
			iouart_Set_Packet(_IO_PACKET_TIMER);
			iouart_Pkt_Start();
			break;
	}
#endif	
	return 0;
}

uint8_t	_iouartLoop(void)
{
	uint8_t	i = 0;
	uint8_t	j;
	uint8_t	*p;
	while( _io_head != _io_tail )
	{
		i = iouart_Ready();
		if( i != 0 )
		{
			p = iouart_getReadBuffer();
			/*
			DISP("\r\n", 2);
			for( j=0; j<8; j++ )
				disp_char(p[j]);
			*/
		}
		if( i == 2 )	
		{
			DISP("e", 1);
		}
		if( i == 1 )
		{
//			DISP("G", 1);
			p = iouart_getReadBuffer();
			//i = p[0] & 0x0f;
			//packet_buf[i] = 0;
			
			if (rc_type == RC_TYPE_NONE) {
				if ((p[0] & 0xF0) == 0x00) 
				{
					// cnt 호출
					rc_type = RC_TYPE_LSE;
					return _call_ptc_lse();
				}
				else 
				{
					if ((p[0] & 0x0F) == 0x00) {
						// cnt 자체응답
						rc_type = RC_TYPE_LSE;
						return _call_ptc_lse();
					} else {
						
						if ((p[0] & 0xF0) == 0x80 || 
								(p[0] & 0xF0) == 0x90 || 
								(p[0] & 0xF0) == 0xB0 ||
								(p[0] & 0xF0) == 0xC0) {
							rc_type = RC_TYPE_LSE;
							return _call_ptc_lse();
						} else {
							rc_type = RC_TYPE_WOODANG;
						  return _call_ptc_woodang();
						}
					}
				}
			}else if (rc_type == RC_TYPE_WOODANG) {
				return _call_ptc_woodang();
			} else {
				return _call_ptc_lse();
			}
		} 
	}
	return 0;
}

//	DEBUG ONLY
#ifdef	_DEBUG_DISPLAY_

extern uint8_t	_key_continue;

void	disp_key(uint8_t k)
{
	uint8_t	buf[5];
	buf[0] = '<';
	buf[2] = ':';
	buf[3] = '0' + _key_continue;
	buf[4] = '>';
	if( k == 4 )		buf[1] = '4';
	else if( k == 3 )	buf[1] = '3';
	else if( k == 2 )	buf[1] = '2';
	else if( k == 1 )	buf[1] = '1';
	else
		buf[2] = '?';
	DISP(buf, 5);
}

void	disp_enc(uint8_t enc)
{
	uint8_t	i;
	uint8_t	buf[3];
	if( (enc & 0x40) != 0 )
		buf[0] = '+';
	else
		buf[0] = '-';
		
	i = enc&0x0f;
	buf[1] = '0' + i/10;
	buf[2] = '0' + i%10;
	DISP(buf, 3);
}

void	disp_adc(uint8_t i)
{
	/*
	uint8_t	*p;
	p = _i2a(i/2);
	DISP(p, _strlen(p));
	if( (i%2) == 1 )
		DISP(".5 ", 3);
	else
		DISP(" ", 1);
	*/
}

#else

void	disp_key(uint8_t k){}
void	encDisp(uint8_t enc){}
void	disp_adc(uint8_t i){}

#endif
extern uint8_t	_key_code;

#if defined (_RC_WD_)

#elif defined (_RC_DR_) || defined (_RC_DW_)
volatile uint8_t	tci = 0;
volatile uint8_t	tct[6];
volatile uint8_t	_tctimer[6];
volatile uint8_t	_tctimer100ms[6];
volatile uint8_t	_tct0;
volatile uint8_t	_tct10;
volatile uint8_t	tc[2];
volatile uint8_t	_tcKey;
volatile uint8_t	_tcKeyPrev = 0xff;
volatile uint8_t	_i0Prev = 0xff;

volatile uint8_t	_mkey = 0xff;

extern uint8_t _uart1_rx_head;
extern uint8_t _uart1_rx_tail;

extern void	beepSet(uint8_t i);

#define _KEY(id,k,kdef)		if( tcKey(id,k) == 1 )	key|=kdef;

uint8_t	_touchKey(uint8_t i, uint8_t mask, uint8_t key)
{
	if( tc[0] & mask )
	{
		if( tct[i] == 0 )
		{
			tct[i] = 1;
			_tctimer[i] = 0;
			_tctimer100ms[i] = 0;
		}
		if( _tctimer[i] >= 10 )
		{
			_tctimer[i] = 0;
			_tctimer100ms[i]++;
		}
		return key;
	}
	else
	{
		tct[i] = 0;
		_tctimer[i] = 0;
		_tctimer100ms[i] = 0;
	}
	return 0;
}
#if defined (_RC_DW_)

uint8_t	_led_key_onOff  = 0;

void	_touchCntl(GPIO_TypeDef* port, uint8_t pin, uint8_t i)
{
	if( i == 0 )
	{
		D_IO_LOW(port, pin);
	}
	else
	{
		D_IO_HIGH(port, pin);
	}
}
/*
void	_touchCntli(uint8_t j, uint8_t i)
{
	if( j == 1 )	_touchCntl(GPIOE, GPIO_Pin_7, i);
	if( j == 2 )	_touchCntl(GPIOC, GPIO_Pin_6, i);
	if( j == 3 )	_touchCntl(GPIOC, GPIO_Pin_5, i);
	if( j == 4 )	_touchCntl(GPIOD, GPIO_Pin_7, i);
	if( j == 5 )	_touchCntl(GPIOC, GPIO_Pin_1, i);
	if( j == 6 )	_touchCntl(GPIOA, GPIO_Pin_2, i);
}
*/
void	_touchOn(void)
{
	_led_key_onOff = 0;
	
	_touchCntl(GPIOE, GPIO_Pin_7, 0);
	_touchCntl(GPIOC, GPIO_Pin_6, 0);
	_touchCntl(GPIOC, GPIO_Pin_5, 0);
	//_touchCntl(GPIOD, GPIO_Pin_7, 0);
	_touchCntl(GPIOC, GPIO_Pin_1, 0);
	_touchCntl(GPIOA, GPIO_Pin_2, 0);
}

void	_touchOff(void)
{
	_led_key_onOff = 1;
	
	_touchCntl(GPIOE, GPIO_Pin_7, 1);
	_touchCntl(GPIOC, GPIO_Pin_6, 1);
	_touchCntl(GPIOC, GPIO_Pin_5, 1);
	//_touchCntl(GPIOD, GPIO_Pin_7, 1);
	_touchCntl(GPIOC, GPIO_Pin_1, 1);
	_touchCntl(GPIOA, GPIO_Pin_2, 1);
}
#endif

#endif
uint8_t _p=0;

void	__b(uint8_t k)
{
	lcd_clear(0);
	
//	lcd_disp_n(0, _p%10);
//	lcd_disp_n(1, _p%10);
//	lcd_disp_n(2, _p%10);
//	lcd_disp_n(3, _p%10);
//	lcd_disp_n(4, _p%10);
//	lcd_disp_n(5, _p%10);
LCD_BIT_SET(_p);
	_p++;
}

void	deviceCb(void)
{
	uint8_t	lcd = 0;
#if defined (_RC_WD_)
	uint8_t	key;
	uiInfo.enc = 0;
	key = key_ready();
	if( key != 0 && key < 0x80 )
	{
		lcd = 1;
		disp_key(key);
	}
	else
	{
		if( (key & 0x80) != 0 )
		{
			lcd = 1;
			disp_enc(key);
			uiInfo.enc = key;
		}
	}
	if( key == 3 && _key_continue == 1 )
	{
		//	set ID
		key = 0x88;
		_key_code = 0xff;
	}
	if( key == 2 && _key_continue == 2 )
	{
		//	set ID
		key = 0x89;
		_key_code = 0xff;
	}
	disp_status(key);
	
	//	for HOBAN
	if( _backlight == 1 )
	{
		_backup_backlight2 = BACKLIGHT_MAX_LEVEL;
		if( lcd == 1 )
		{
			//	key, On
			if( _lcdTimer[1] != 0 )
			{
				//	if LCD Off, On
				D_IO_HIGH(D_BL_PORT, D_BL_PIN);
			}
			_lcdTimer[0] = 0;
			_lcdTimer[1] = 0;
			_lcdTimer[2] = __timer1s;
		}
		else
		{
			if( _lcdTimer[2] != __timer1s )
			{
				_lcdTimer[2] = __timer1s;
				_lcdTimer[0]++;
				if( _lcdTimer[0] >= 10 )
				{
					if( _lcdTimer[1] == 0 )
					{
						//	goto off
						_lcdTimer[1] = 2;
						D_IO_LOW(D_BL_PORT, D_BL_PIN);
					}
					_lcdTimer[0] = 0;
				}
			}
		}
	}
	else
		_backup_backlight2 = 0;

#elif defined (_RC_DR_) || defined (_RC_DW_)
	uint8_t	i, j, i0;
	
	//	10ms timer
	if( _tct0 == _t20ms )
		return;
		
	_tct0 = _t20ms;
	for( i=0; i<6; i++ )
	{
		if( tct[i]==1 )
			_tctimer[i]++;
	}
	
	if( _uart1_rx_tail == _uart1_rx_head )
	{
		_tct10++;
		if( _tct10 >= 5 )
		{
			for( i=0; i<6; i++ )
				tct[i] = 0;
			_tct10 = 0;
			_tcKeyPrev = 0xff;
			_mkey = 0xff;
		}
		//return;
	}
	
	while( _uart1_rx_tail != _uart1_rx_head )
	{
		i = uart1_get();
		if( i == 0xff )
		{
			tci = 0;
			continue;
		}
			tc[tci] = i;
			tci = tci==0 ? 1 : 0;
			if( tci != 0 )
				continue;
				
			i = tc[0] + tc[1];
			if( i != 0xff )
				continue;
				
			_tct10 = 0;
#if defined (_RC_DW_)
			_tcKey = _touchKey(0, 0x01, 0x01);
			_tcKey |= _touchKey(1, 0x02, 0x04);
			_tcKey |= _touchKey(2, 0x04, 0x10);
			_tcKey |= _touchKey(3, 0x08, 0x02);
			_tcKey |= _touchKey(4, 0x10, 0x08);
			_tcKey |= _touchKey(5, 0x20, 0x20);
#endif
#if defined (_RC_DR_)
			_tcKey = _touchKey(0, 0x01, 0x20);
			_tcKey |= _touchKey(1, 0x02, 0x02);
			_tcKey |= _touchKey(2, 0x04, 0x08);
			_tcKey |= _touchKey(3, 0x08, 0x04);
			_tcKey |= _touchKey(4, 0x10, 0x10);
			_tcKey |= _touchKey(5, 0x20, 0x01);
#endif
			if( _tcKey == 0 )
			{
				_tcKeyPrev = 0xff;
				continue;
			}
		
			lcd = 1;
			j = 0;
			i0 = 0xff;
			for( i=0; i<6; i++ )
			{
				if( tct[i]==1 )
				{
					j++;
					i0 = i;
				}
			}
			//	2016.1.12 heedop
			//	for noise filter when 2 or 3 button key long pressed
			if( j >= 3 && _mkey != 0xff )
			{
				if( _tcKey == 0x55 )		goto K_55;
				if( _tcKey == 0x53 )		goto K_53;
				continue;
			}
			if( j == 1 && _mkey != 0xff )
			{
				if( _tcKey == 0x55 )		goto K_55;
				if( _tcKey == 0x53 )		goto K_53;
				continue;
			}
			if( j == 2 )
			{
				//	5(L/T), 1(L/B, 3(R/T), 2(R/B)
				//
				if( tct[2] == 1 )
				{
					if( tct[5] == 1 )
					{
K_55:						
						//	ID
						_tcKey = 0x55;
						_mkey = 0x24;
						if( _tcKey != _tcKeyPrev )
						{
							_tcKeyPrev = _tcKey;
							_i0Prev = i0;
							beepSet(4);			
							_key_continue = 0;
//							_mkey = 0xff;
						}
						else
						{
							if( _tctimer100ms[_i0Prev] > 35 )//TIME_LONG_TOUCH )
							{
								_key_continue = 1;
								disp_status(0x55);
								_tctimer100ms[_i0Prev] = 0;
//								_mkey = 0xff;
							}
						}
						continue;
					}
					else if( tct[1] == 1 )
					{
K_53:						
						//	Option
						_tcKey = 0x53;
						_mkey = 0x60;
						if( _tcKey != _tcKeyPrev )
						{
							_tcKeyPrev = _tcKey;
							_i0Prev = i0;
							beepSet(4);			
							_key_continue = 0;
//							_mkey = 0xff;
						}
						else
						{
							if( _tctimer100ms[_i0Prev] > 35 )//TIME_LONG_TOUCH )
							{
								_key_continue = 1;
								disp_status(0x53);
								_tctimer100ms[_i0Prev] = 0;
//								_mkey = 0xff;
							}
						}
						continue;
					}
				}
				goto CLEAR_KEY_ENTRY;
			}
			if( j != 1 )
			{
CLEAR_KEY_ENTRY:
				for( i=0; i<6; i++ )
					tct[i] = 0;
				continue;
			}
			
			if( _tcKeyPrev != _tcKey )
			{
				_tcKeyPrev = _tcKey;
				_i0Prev = i0;
				beepSet(4);			
				_key_continue = 0;
		
					_lcdTimer[0] = 0;
					_lcdTimer[2] = __timer1s;
					if( _lcdTimer[1] == 2 )
					{
						//	if lcd off,
						_lcdTimer[1] = 3;
						_lcdTimer[3] = __timer100ms;
						_backup_backlight2 = BACKLIGHT_MAX_LEVEL;
#if defined (_RC_DW_)
						_touchOn();
#endif
						//	skip this key event
						_uart1_rx_tail = _uart1_rx_head;
//						_tcKeyPrev = 0xff;
					}
					else if( _lcdTimer[1] == 3 )
					{
						_tcKeyPrev = 0xff;
						if( _lcdTimer[3] == __timer100ms )
						{
						}
						else
						{
							_lcdTimer[1] = 0;
						}
					}
					else
					{
						/*
						if( __timer100ms > _lcdTimer[3] )
							i = __timer100ms - _lcdTimer[3];
						else
							i = 10 - _lcdTimer[3] + __timer100ms;
						if( i >= 3 )
						{
							//	300ms >
							disp_status(_tcKey);
						}
						*/
						//	if lcd off,
						_lcdTimer[1] = 3;
						_lcdTimer[3] = __timer100ms;
						_backup_backlight2 = BACKLIGHT_MAX_LEVEL;
						
						disp_status(_tcKey);
					}
			}
			else
			{
				if (_tcKeyPrev == 0x10 || _tcKeyPrev == 0x20) {
					if( _tctimer100ms[_i0Prev] > 2 )
					{
						disp_status(_tcKeyPrev);
						_tctimer100ms[_i0Prev] = 0;
					}
				} else {
					if( _tcKeyPrev == 0x04 )
					{
						//	Long Exit
						if( _tctimer100ms[_i0Prev] > 30 /*TIME_LONG_TOUCH*/ )
						{
							_key_continue = 1;
							disp_status(_tcKeyPrev);
							_tctimer100ms[_i0Prev] = 0;
						}
					}
					else
					{
						if( _tctimer100ms[_i0Prev] > TIME_LONG_TOUCH )
						{
							_key_continue = 1;
							disp_status(_tcKeyPrev);
							_tctimer100ms[_i0Prev] = 0;
						}
					}
				}				
			}
	}
	if( _lcdTimer[2] != __timer1s )
	{
		_lcdTimer[2] = __timer1s;
		_lcdTimer[0]++;
		if( _lcdTimer[0] >= /*8*/15 )
		{
			if( _lcdTimer[1] == 0 || _lcdTimer[1] == 3 )
			{
				//	off
				_lcdTimer[1] = 2;
				_backup_backlight2 = 0;
//
//					D_IO_LOW(D_BL_PORT, D_BL_PIN);
#if defined (_RC_DW_)
				_touchOff();
#endif
			}
			_lcdTimer[0] = 0;
			_lcdTimer[3] = __timer100ms;
		}
	}
	
	disp_status(0);
#endif
}

void	device_adc(void)
{
	uint8_t	i;
	i = adcGet(0);
	if( i != currTemp )
	{
		currTemp = i;
		disp_adc(i);
	}
}

extern uint8_t	_tim30min;
extern uint8_t	_tim1min;
extern uint8_t	_timFlag;
extern uint8_t	__timer1sa;

uint8_t	__tim30min_reset = 0;

uint8_t timerEventClear(void) {
	__timer1sa = 0;
	__timer1min = 0;
	__timer1h = 0 ;
}

/*
구동기 반복동작 1분 단위로 : 테스트 용도
*/
//#define MONKEY_TEST

#ifdef MONKEY_TEST
uint8_t	_monkey_t[4];
#endif

void	timerEvent(void)
{
	_tim1min++;
	if( (_tim1min%30) == 0 )
	{
		if( _tim30min != 0xff )
		{
			if( __tim30min_reset == 0 )
			{
				__tim30min_reset = 1;
				_tim30min++;
			}
		}
	}
	else
		__tim30min_reset = 0;

	if( __boiler_shower[5] == 1 )
	{
		__boiler_shower[4]++;
		if( __boiler_shower[4] >= /*21*/90 )
		{
			//	90min timeout
			__boiler_shower[5] = 0x80;
		}		
	}
	
	if( _disp_mode == 0x10 )
	{
		//	BanB
#ifdef MONKEY_TEST
		if( _timFlag == 0 )
		{
			if( _monkey_t[0] != _tim1min )
			{
				_monkey_t[0] = _tim1min;
				//	on
				_timFlag = 1;
			}
		}
		else
		{
			if( _monkey_t[0] != _tim1min )
			{
				_monkey_t[0] = _tim1min;
				//	off
				_timFlag = 0;
			}
		}
#else
		if( _timFlag == 0 )
		{
			if( uiInfo.repeat == _tim1min )
			{
				_tim1min = 0;
				//	on
				_timFlag = 1;
			}
		}
		else
		{
			if( (_TIME_REPEAT_BASE-uiInfo.repeat) == _tim1min )
			{
				_tim1min = 0;
				//	off
				_timFlag = 0;
			}
		}
#endif
	}
	if( _disp_mode == 0x08 )
	{
		//	Y
		if( uiInfo.reserve == _tim30min )
		{
			_tim30min = 0xff;
			__s = 0;
			_dsCount = 0;
			_key_blink = 0;
		}
	}
}

#if	defined(WATCHDOG_ENABLE)
#define RELOAD_VALUE	254

uint8_t		wdgOpen(void)
{
	if (RST_GetFlagStatus(RST_FLAG_IWDGF) != RESET)
	{
		RST_ClearFlag(RST_FLAG_IWDGF);
	}
	
	/* IWDG timeout equal to 214 ms (the timeout may varies due to LSI frequency
	 dispersion) */
	/* Enable write access to IWDG_PR and IWDG_RLR registers */
	IWDG_WriteAccessCmd(IWDG_WriteAccess_Enable);
	
	/* IWDG configuration: IWDG is clocked by LSI = 38KHz */
	IWDG_SetPrescaler(IWDG_Prescaler_128);
	
	/* IWDG timeout equal to 214.7 ms (the timeout may varies due to LSI frequency dispersion) */
	/* IWDG timeout = (RELOAD_VALUE + 1) * Prescaler / LSI 
				  = (254 + 1) * 32 / 38 000 
				  = 214.7 ms */
	IWDG_SetReload((uint8_t)RELOAD_VALUE);
	IWDG_ReloadCounter();
	IWDG_Enable();
}
#endif

extern uint8_t	_add[];

int		main()
{
	uint8_t	logo = 0;
	uint8_t	i;
	uint8_t	*p;
	uint8_t	pp[4];
	uint8_t	_loopStatus = 0;

	/*	High speed external clock prescaler: 1
	*/
	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1);
	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
	
	while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSI)
		;
#if	defined(WATCHDOG_ENABLE)
	wdgOpen();
#endif

#if defined (_RC_DR_)
	//	SWIM & GPIO ENABLE
	CFG-> GCR |= CFG_GCR_SWD;
	CLK_PeripheralClockConfig(CLK_Peripheral_BEEP, ENABLE);
	CLK_BEEPClockConfig(CLK_BEEPCLKSource_LSI);
	
//BEEP_LSClockToTIMConnectCmd(ENABLE);
BEEP_LSICalibrationConfig( 38000+801+801  );
//BEEP_LSClockToTIMConnectCmd(DISABLE);

	BEEP_Init(BEEP_Frequency_1KHz);
	BEEP_Cmd(DISABLE);

	GPIO_Init(GPIOC, GPIO_Pin_5, GPIO_Mode_Out_PP_Low_Fast);
	D_IO_HIGH(GPIOC, GPIO_Pin_5);
	
	_backlight = BACKLIGHT_MAX_LEVEL;
#endif
#if defined (_RC_DW_)
	GPIO_Init(GPIOC, GPIO_Pin_5, GPIO_Mode_Out_PP_Low_Fast);
	D_IO_HIGH(GPIOC, GPIO_Pin_5);
	
	//_backlight = BACKLIGHT_MAX_LEVEL;
	
	GPIO_Init(GPIOE, GPIO_Pin_7, GPIO_Mode_Out_PP_Low_Fast);
	GPIO_Init(GPIOC, GPIO_Pin_6, GPIO_Mode_Out_PP_Low_Fast);
	GPIO_Init(GPIOC, GPIO_Pin_5, GPIO_Mode_Out_PP_Low_Fast);
	//	Boiler LED maybe OFF
	GPIO_Init(GPIOD, GPIO_Pin_7, GPIO_Mode_Out_PP_Low_Fast);
	GPIO_Init(GPIOC, GPIO_Pin_1, GPIO_Mode_Out_PP_Low_Fast);
	GPIO_Init(GPIOA, GPIO_Pin_2, GPIO_Mode_Out_PP_Low_Fast);
	_backlight = BACKLIGHT_MAX_LEVEL;//20;
#endif

	systemTimer();
	
	iouart_Open();
	encoder_Open();
	systemADC();
	systemLcd();
	/*	Backlight
	*/
	GPIO_Init(D_BL_PORT, D_BL_PIN, GPIO_Mode_Out_PP_Low_Fast);
	D_IO_HIGH(D_BL_PORT, D_BL_PIN);
	
	_lcdTimer[0] = 0;
	_lcdTimer[1] = 0;
	_lcdTimer[2] = __timer1s;
	
	/*	Led
	*/
#if defined (_RC_WD_)
	GPIO_Init(D_LED_PORT, D_LED_PIN, GPIO_Mode_Out_PP_Low_Fast);
	D_IO_LOW(D_LED_PORT, D_LED_PIN);
#endif
	systemUart();
	/*
	lcd_disp(10, 1);
	*/
	lcd_clear(0);
	/*
	5->year<2015>
	A->month<11>, B->12
	2/4->day<24>
		6112 // 6509 
	*/
	lcd_disp_n(0, 6);
	//lcd_disp_n(1, 9);
		LCD_BIT_SET(b2A);
		LCD_BIT_SET(b2D);
		LCD_BIT_SET(b2E);
		LCD_BIT_SET(b2F);
		//LCD_BIT_SET(b2G);
	lcd_disp_n(2, 2);
	lcd_disp_n(3, 2);
	/*	rc always read mode
	*/
	indiIOUartIdle = 0;
	
	rc_ptc_baseSet();
	ui_Open();
	/*
		default 24 -> 2, by heedop, 20151025
		188Line@ui.c
	 */
	/*
	 *	check ID if 0
	 */
	if( uiInfo.id == 0 )
	{
		//_ds = 2;
		//	2016.1.12
		_ds = 220;
	}
	enableInterrupts();
	
	for( i=0; i<24; i++ )	
		_add[i%12] = adcGet(1);
	

	rcInfoSet(2, 20);	
	while(1)
	{
Entry:		
#if	defined(WATCHDOG_ENABLE)
		while(1)
		{
			for(i=0; i<200; i++ )
			{
				for( j=0; j<250; j++);
			}
			break;
		}
		IWDG_ReloadCounter();
#endif
		i = 0;
		if (timerCalc() == 1) 
		{
			//	1min 
			timerEvent();
		}
		/*
		*/
		if( _loopStatus == 0 )
		{
		}
		else if( _loopStatus == 3 )
		{
			factory(1);
			goto Entry;
		}
		//	display version info for 2s
		if( logo < 4 )
		{
			if( __timer1s != pp[1] )
			{
				pp[1] = __timer1s;
				if( logo == 2 )
				{
					logo = 100;
				}
				else
				{
					logo++;
				}
			}
			continue;
		}		
		//	iouart packet result
		i = _iouartLoop();
		if( i == 3 )		{	_loopStatus = 3;	}//	factory mode
		else if( i == 99 )	{	_loopStatus = 0;	}//	normal mode	
		
		deviceCb();
			
		if( (__timer1s%2) != pp[3] )
		{
			pp[3] = __timer1s%2;
			if( pp[2] == 0 )
			{
				pp[2] = 1;
				device_adc();
			}
		}
		else
			pp[2] = 0;
			
		if( (__timer1s) != pp[1] )
		{
			pp[1] = __timer1s;
			//		Error 30
			for( i=0; i<PACKET_SIZE; i++ )
			{
				if( packet_buf[i] != ui_timeout )
				{
					packet_buf[i] += 1;
				}
			}
			if( ui_error == 30 && ui_error_type == ERROR_TYPE_CNT )
			{
				if( packet_buf[uiInfo.id - 1] < ui_timeout-1 )
				{
					error_display_mode = 0;
					ui_error = 0;
					ui_error_type = 0;
				}
			}
			else
			{
				if( packet_buf[uiInfo.id - 1] == ui_timeout )
				{
					error_display(ERROR_TYPE_CNT, 30);
					ui_timeout = PACKET_ERROR_COUNT_60;
					
					for( i=0; i<PACKET_SIZE; i++ )
					{
						packet_buf[i] = PACKET_ERROR_COUNT_60;
					}
				}
			}			
		}
	}
}
