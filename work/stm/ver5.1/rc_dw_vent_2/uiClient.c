#include "stdafx.h"
#include "uiDef.h"
#include "rc_protocol.h"

/*
 *	for _backlight==0, LCD Off
 */
uint8_t	_lcdTimer[4];
uint8_t	_lcdEnable = 0;
/*
 default 4->2, by heedop 20151025
 */
uint8_t	lcd_pwmIndex2 = 0;
#if defined (_RC_DW_)
uint8_t	lcd_pwmCount2 = 70;//25;
//uint8_t	lcd_pwmCount2 = (BACKLIGHT_MAX_LEVEL+1);//25;
uint8_t	_backlight = 3;

extern uint8_t	temp_tsetup;
#else
uint8_t	lcd_pwmCount2 = (BACKLIGHT_MAX_LEVEL+1);//25;
uint8_t	_backlight = 2;
#endif

extern	uint8_t	_disp_temp;

#define PWM_HIGH	D_IO_HIGH(GPIOE, GPIO_Pin_6)
#define PWM_LOW		D_IO_LOW(GPIOE, GPIO_Pin_6)
extern uint8_t _key_sec;
extern uint8_t _key_min;
extern uint8_t _key_hour;
extern uint8_t packet_changed;

extern uint8_t	_backup_backlight;
extern uint8_t	_backup_backlight2;

extern uint8_t start_flag;

#if defined (_RC_DW_)
/*
*/
extern GPIO_TypeDef	*_led_key_port;
extern uint8_t	_led_key_pin;
extern uint8_t	_led_key_status;
extern uint8_t	_led_key_onOff;
/*
#define LED_BOILER	{\
					if( (_led_i%2) == 0 )\
						D_IO_LOW(_led_key_port, _led_key_pin);\
					else\
						D_IO_HIGH(_led_key_port, _led_key_pin);\
					}
*/
#define LED_BOILER	{\
						D_IO_LOW(_led_key_port, _led_key_pin);\
					}

uint8_t	_led_key_pwmIndex = 0;
uint8_t	_led_key_pwmCount = 160;
uint8_t	_led_i = 0;
uint8_t	_led_j = 0;
uint8_t	_led_s = 0;
#endif
#if defined (_RC_DW_VENT_)
#undef	PWM_HIGH
#undef	PWM_LOW
#define PWM_HIGH	D_IO_HIGH(GPIOD, GPIO_Pin_7)
#define PWM_LOW		D_IO_LOW(GPIOD, GPIO_Pin_7)
/*
*/
extern uint8_t	_led_key_status;
extern uint8_t	_led_key_onOff;
#endif

extern uint8_t	_backlight_get_index(uint8_t i);
extern uint8_t	_backlight_get_code(uint8_t i);
uint8_t	_abc = 0;
void	__rcCb(void)
{
	uint8_t	i;
	i = _backup_backlight2==0 ? _backlight : BACKLIGHT_MAX_LEVEL;
#if defined (_RC_DR_)
	if( i==BACKLIGHT_MAX_LEVEL )
		i = 20;
#endif
#if defined (_RC_DW_)
//	if( _led_key_onOff == 1 )
//	if( i==BACKLIGHT_MAX_LEVEL )
//		i = 16;
//	i = _led_key_onOff == 0 ? 24+8 : 4;
#endif
	
//	if( lcd_pwmIndex2 <= _backlight )	{	PWM_HIGH;	}
//	else					{	PWM_LOW;	}
//	if( _lcdTimer[1] == 2 )
//		return;
		_abc = i;
	//	for HOBAN, not turn on LCD
	if( lcd_pwmIndex2 <= i )	{	PWM_HIGH;	}
	else					{	PWM_LOW;	}
	
	lcd_pwmIndex2++;
	if( lcd_pwmIndex2 >= lcd_pwmCount2 )
		lcd_pwmIndex2 = 0;

#if defined (_RC_DW_)

	if( _led_key_onOff == 1 )
	{
		D_IO_HIGH(GPIOE, GPIO_Pin_7);
		D_IO_HIGH(GPIOC, GPIO_Pin_6);
		D_IO_HIGH(GPIOC, GPIO_Pin_5);
//		D_IO_HIGH(GPIOD, GPIO_Pin_7);
		D_IO_HIGH(GPIOC, GPIO_Pin_1);
		D_IO_HIGH(GPIOA, GPIO_Pin_2);
		//	reset status		
		_led_key_onOff = 2;
		
		D_IO_HIGH(_led_key_port, _led_key_pin);
	}
	else if( _led_key_onOff == 2 )
	{
		if( _led_key_status == 0 )
		{
			//	boiler on
			_led_i++;
			if( _led_i >= 10 )
			{
				_led_s++;
				_led_i = 0;
				if( _led_s >= 60 )
					_led_s = 0;
			}

			if( _led_s == 6 )
			{
				//	for boiler led
				if( _led_key_status == 0 )
				{
					LED_BOILER
				}
			}
			else
			{
				D_IO_HIGH(_led_key_port, _led_key_pin);
			}
		}
	}
	else if( _led_key_onOff == 0 )
	{
		//	DW key button backlight, 
		i = 14;	//	10 -> 14,
		_led_i++;
		if( _led_i >= 10 )
		{
			_led_s++;
			_led_i = 0;
			if( _led_s >= 60 )
				_led_s = 0;
		}
			//	off all
			D_IO_HIGH(GPIOE, GPIO_Pin_7);
			D_IO_HIGH(GPIOC, GPIO_Pin_6);
			D_IO_HIGH(GPIOC, GPIO_Pin_5);
//			D_IO_HIGH(GPIOD, GPIO_Pin_7);
			D_IO_HIGH(GPIOC, GPIO_Pin_1);
			D_IO_HIGH(GPIOA, GPIO_Pin_2);

			D_IO_HIGH(_led_key_port, _led_key_pin);
			
		if( _led_s == 0 )			{	D_IO_LOW(GPIOE, GPIO_Pin_7);}
		else if( _led_s == 1 )		{	D_IO_LOW(GPIOC, GPIO_Pin_6);}
		else if( _led_s == 2 )		{	D_IO_LOW(GPIOC, GPIO_Pin_5);}
		else if( _led_s == 3 )		{}
		else if( _led_s == 4 )		{	D_IO_LOW(GPIOC, GPIO_Pin_1);}
		else if( _led_s == 5 )		{	D_IO_LOW(GPIOA, GPIO_Pin_2);}
		else if( _led_s == 6 )
		{
BOILER_ENTRY:
			//	for boiler led
			if( _led_key_status == 0 )
			{
				LED_BOILER
			}
		}
	}
//	if( _led_key_onOff == 0 || _led_key_status == 0 )
	{
		_led_key_pwmIndex++;
		if( _led_key_pwmIndex >= _led_key_pwmCount )
			_led_key_pwmIndex = 0;	
	}

#endif
#if defined (_RC_DW_VENT_)
	if( _led_key_onOff == 1 )
	{
		//	reset status		
		_led_key_onOff = 2;
	}
	else if( _led_key_onOff == 2 )
	{
		if( _led_key_status == 0 )
		{
		}
	}
	else if( _led_key_onOff == 0 )
	{
	}
#endif
}

void	disp_backlight(uint8_t mode)
{
	uint8_t	i;
	uint8_t bl;

	_backup_backlight2 = 0;
	
	if( _dsCount == 0 )
	{
		lcd_clear(0);
		lcd_disp_backlight();
		_dsCount = 1;
		uiInfo._t = _backlight;
	}
	else
	{
		i = _backlight;
		i = _backlight_get_index(i);
		if( uiInfo.enc != 0 )
		{
//			ENC_MOVE_0(1, 24, 1);
//			_backlight = i;
			ENC_MOVE_0(1, 5, 1);
			_backlight = _backlight_get_code(i);
		}
		
		if( _dsPrev != i )
		{
			_dsPrev = i;
			UI_DISP_2Digit(i);
		}
	}
}

extern void	timerClear(void);

void	disp_status_loop_messageDn(uint8_t i)
{
	lcd_clear_btn();
	if( i == 1 )		{	_disp_mode = 0x02;	LCD_BIT_SET(/*bS9*/bT7);	/*	ø‹√‚*/	}
	else if( i == 0 )	{	_disp_mode = 0x04;	LCD_BIT_SET(/*bS10*/bT7);	/*	¡§¡ˆ*/	}
	else if( i == 2 )	{	_disp_mode = 0x01;	LCD_BIT_SET(/*bS6*/bT6);	/*	≥≠πÊ*/	}
	else if( i == 3 )	{	_disp_mode = 0x08;	LCD_BIT_SET(/*bS7*/bT14);	/*	øπæ‡*/	}
	else if( i == 4 )	{	_disp_mode = 0x10;	LCD_BIT_SET(/*bS8*/bT18);	/*	π›∫π*/	}
	_disp_mode2 = _disp_mode;
	timerClear();
}

void	disp_status_loop_clientDn(uint8_t key)
{
	//	key == 1 for Stop, 0 for Reserve
	disp_status_loop_messageDn(key);
	disp_status_curr_only();
	lcd_blink_clear();
}

extern uint8_t		disp_status_loop_host_Off(uint8_t key);
extern uint8_t		disp_status_loop_host_Out(uint8_t key);
extern uint8_t		disp_status_loop_host_N2OUT(uint8_t key);	//	uiMaster.c

#define _NOT_DEF_	;
#define _NOT_KEY_	;

void	disp_status_loop_client(uint8_t key)
{
	uint8_t	i = 0;
	if( __s == 0 )
	{
		if( _dsCount == 0 )
		{
			_dsCount = 10;
			
			if (start_flag == 0) {
				__sUp = 0;
			}
			start_flag = 0;
			
			__sDn = 0xff;
//			disp_status_loop_init();
		}
		else if( _dsCount == 10 )
		{
			if( __sUp == 0 )		_dsCount = 15;	//	N
			else if( __sUp == 1 )	_dsCount = 35;	//	øπæ‡
			else if( __sUp == 2 )	_dsCount = 25;	//	B
			else if( __sUp == 5 )	_dsCount = 45;	//	J
			else if( __sUp == 16 )	{	_dsCount = 16; __sUp = 8;	} //out
			else if( __sUp == 151 )	_dsCount = 151;	//	N->OUT
			else 
				_dsCount = 1;
			disp_status_loop_init();
		}
		else if( _dsCount == 15 )			//	N/OUT
		{
			if( key==1 )		_GOTO(151)	//	To OUT
			else if( key==2 )	{ _NOT_KEY_ }	//	
			else if( key==4 )	_GOTO(2)	//	BAN
			else if( key==8 )	_GOTO(1)	//	øπæ‡
			else if( key==16 )	_DN
			else if( key==32 )	_UP
			_disp_temp = 1;
			i = disp_status_loop_host_N(key);
			if( i==1 )
				_key_blink = 1;
		}
		else if( _dsCount == 151 )			//	OUT/Nan
		{
			//uiInfo.tSetup = 20;
			if( key==1 )		_GOTO(0)	//	To Nan	
			else if( key==2 )	{ _NOT_KEY_ }	//	
			else if( key==4 )	_GOTO(2)	//	BAN
			else if( key==8 )	_GOTO(1)	//	øπæ‡
			else if( key==16 )	{ _NOT_DEF_; }	//	DN
			else if( key==32 )	{ _NOT_DEF_; }	//	UP
			_disp_temp = 1;
			i = disp_status_loop_host_N2OUT(key);
			if( i==1 )
				_key_blink = 1;
		}
		else if( _dsCount == 16 )			//	OUT
		{
			//uiInfo.tSetup = 20;
			if( key==1 )		_GOTO(0)	//	N
			else if( key==2 )	{ _NOT_KEY_ }	//	
			else if( key==4 )	_GOTO(0)	//	N
			else if( key==8 )	_GOTO(5)	//	Off
			_disp_temp = 1;
			i = disp_status_loop_host_Out(key);
			if( i==1 )
				_key_blink = 1;
		}
		else if( _dsCount == 25 )			//	B
		{
			if( key==1 )		_GOTO(0)	//	NAN
			else if( key==2 )	{ _NOT_KEY_ }	//	
			else if( key==4 )	_GOTO(0)	//	NAN
			else if( key==8 )	_GOTO(1)	//	øπæ‡
			else if( key==16 )	_DN
			else if( key==32 )	_UP
//			_disp_temp = 1;
			i = disp_status_loop_host_B(key);
			if( i==1 )
				_key_blink = 1;
		}
		else if( _dsCount == 35 )			//	øπæ‡
		{
			if( key==1 )		_GOTO(0)	//	NAN
			else if( key==2 )	{ _NOT_KEY_ }	//	
			else if( key==4 )	_GOTO(2)	//	BAN
			else if( key==8 )	_GOTO(0)	//	NAN
			else if( key==16 )	_DN
			else if( key==32 )	_UP
//			_disp_temp = 1;
			i = disp_status_loop_host_Y(key);
			if( i==1 )
				_key_blink = 1;
		}
		else if( _dsCount == 45 )			//	OFF
		{
			if( key==1 )		_GOTO(1)	//	Y
			else if( key==2 )	_GOTO(2)	//	Ban
			else if( key==4 )	_GOTO(0)	//	N
			else if( key==8 )	_GOTO(0)	//	On
			i = disp_status_loop_host_Off(key);
			if( i==1 )
				_key_blink = 1;
		}
		else if( _dsCount == 1 )
		{
			if( __sUp == 0 )		{	i = disp_status_loop_host_N(key);	}
			else if( __sUp == 1 )	{	i = disp_status_loop_host_Y(key);	}
			else if( __sUp == 2 )	{	i = disp_status_loop_host_B(key);	}

			if( i==1 )
				_key_blink = 1;
				
			_disp_temp = __sUp==0 ? 1 : 0;
			if( _disp_temp == 0 && _key_blink == 0 )
			{
				if( __sUp == 1 || __sUp == 2 || __sUp == 5 || __sUp == 8)
					_disp_temp = 1;
			}
				
			if( __sUp == 0 && i == 1 )
			{				
marker_1_0:
				_key_blink = 1;
//				lcd_blink_item(bS6);
			}
			if( key == 1 )
			{
				if( __sUp == 0 )
				{
					if( _key_blink == 1 )
						goto DisplayEntry;
					disp_status_loop_clientDn(3/*0*/);	//¡§¡>>YKˆ - subR/C selection
					_dsCount = 4;
					
					_disp_temp = 1;
				}
				else
				{
marker_1:					
					__sUp = 0;
					_dsCount = 0;
				}
				_dsPrev = 0xff;
			}
			else if( key == /*2*/7 )
			{
marker_2:				
				if( __sUp == 1 && _key_blink == 1 )
					goto DisplayEntry;
marker_2s:
				__sUp = 1;
				_dsPrev = 0xff;
				disp_status_loop_message(__sUp);
//				lcd_blink_item(bS7);
				_key_blink = 1;
			}
			else if( key == 3 )
			{
				if( __sUp == 0 )
				{
					if( _key_blink == 0 )
					{
marker_1s:						
						__s = 2;
						_dsCount = 0;
						return;
					}
				}
				else if( __sUp == 1 )
				{
					if( _key_blink == 0 )
						goto marker_2;
				}
				else if( __sUp == 2 )
				{
					if( _key_blink == 0 )
						goto marker_4;
				}
				disp_status_loop_init();
				_key_blink = 0;
			}
			else if( key == /*4*/2 )
			{
marker_4:				
				if( __sUp == 2 && _key_blink == 1 )
					goto DisplayEntry;
marker_4s:
				__sUp = 2;
				_dsPrev = 0xff;
				disp_status_loop_message(__sUp);
//				lcd_blink_item(bS8);
				_key_blink = 1;
			}
			if( _key_blink == 1 )
			{
				if( _key_sec >= KEY_BLINK_FADE )
				{
DisplayEntry:					
					//	reset key timer
					lcd_blink_clear();
					_key_blink = 0;
					_dsCount = 10;
					//_dsPrev = 0xff;
				}
			}			
		}
		else if( _dsCount == 4 )
		{
			if( key == 1 )		
			{	
			/*dm
				func_rc_mode_heat(
					uiInfo.tempCurr[uiInfo.id],
					uiInfo.tempSetup[uiInfo.id]
					);
				*/
				_dsCount = 1;	
				goto marker_1;	
			}
			else if( key == 2 )	{	_dsCount = 1;	goto marker_2;	}
			else if( key == 3 )	{	}
			else if( key == 4 )	{	_dsCount = 1;	goto marker_4;	}

			if( uiInfo.enc != 0 )
				_dsCount = 10;
		}
		else if( _dsCount == 5 )
		{
			disp_status_loop_init();
			disp_status_loop_clientDn(1);	//	ø‹√‚∏µÂ «•Ω√
			_dsCount = 6;
		}
		else if( _dsCount == 6 )
		{
			if( _disp_mode != _disp_mode2 )
			{
				_dsCount = 0;
				//	restore saved status
			}
		}
		if( _dsCount == 15 || _dsCount == 16 || _dsCount == 25 || 
				_dsCount == 35 || _dsCount == 46
#if defined (_RC_DW_)
				|| _dsCount == 151 
#endif
				)
		{
			if( _disp_mode != _disp_mode2 || packet_changed == 1)
			{
				packet_changed = 0;
				_dsCount = 10;
				_key_blink = 0;
			
				if( _disp_mode2 == 0x01 )		
				{
					__sUp = 0; 
				}
				else if( _disp_mode2 == 0x02 )	
				{	
					/*	YC error from MasterR/C select stop(Y)	*/	
					//_dsCount = 4;
					//disp_status_loop_clientDn(0);	//	ø‹√‚
					__sUp = 16;
					return;
				}
				else if( _disp_mode2 == 0x04 )	
				{	
					disp_status_loop_init();
					disp_status_loop_clientDn(0);	// ¡§¡ˆ
					return;
				}
				else if( _disp_mode2 == 0x08 )	
				{
					__sUp = 1;
					_key_sec = _key_min = _key_hour = 0;
					//goto marker_2s;
				}
				else if( _disp_mode2 == 0x10 )	
				{
					__sUp = 2;
					_key_sec = _key_min = _key_hour = 0;
					//goto marker_4s;
				}
				else
					return;
				//	update display
				disp_status_loop_init();
			}
		}
	}
	else if( __s == 2 )
	{
		disp_backlight(0);
		if( key == 1 || key == 2 || key == 3 || key == 4 )
		{
			__s = 0;
			_dsCount = 0;
			file_update2(0);
		}
	}
}

