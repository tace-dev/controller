#include "stdafx.h"
#include "uiDef.h"
#include "rc_protocol.h"

/*
 *	for _backlight==0, LCD Off
 */
uint8_t	_lcdTimer[3];
uint8_t	_lcdEnable = 0;

uint8_t	_backlight = 4;
uint8_t	lcd_pwmIndex2 = 0;
uint8_t	lcd_pwmCount2 = 25;

extern	uint8_t	_disp_temp;

#define PWM_HIGH	D_IO_HIGH(GPIOE, GPIO_Pin_6)
#define PWM_LOW		D_IO_LOW(GPIOE, GPIO_Pin_6)
extern uint8_t _key_sec;
extern uint8_t _key_min;
extern uint8_t _key_hour;
extern uint8_t packet_changed;

extern uint8_t	_backup_backlight;
extern uint8_t	_backup_backlight2;

void	__rcCb(void)
{
	uint8_t	i;
	i = _backup_backlight2==0 ? _backlight : 24;

#if defined (_RC_DR_)		

#elif defined (_RC_WD_)
//	if( lcd_pwmIndex2 <= _backlight )	{	PWM_HIGH;	}
//	else					{	PWM_LOW;	}
	if( _lcdTimer[1] == 2 )
		return;
#endif		
	//	for HOBAN, not turn on LCD
	if( lcd_pwmIndex2 <= i )	{	PWM_HIGH;	}
	else					{	PWM_LOW;	}

	lcd_pwmIndex2++;
	if( lcd_pwmIndex2 == lcd_pwmCount2 )
		lcd_pwmIndex2 = 0;
}

void	disp_backlight(uint8_t mode)
{
	uint8_t	i;

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
		if( uiInfo.enc != 0 )
		{
			ENC_MOVE_0(1, 24, 1);
			_backlight = i;
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
	if( i == 1 )		{	_disp_mode = 0x02;	LCD_BIT_SET(bS9);	/*	외출*/	}
	else if( i == 0 )	{	_disp_mode = 0x04;	LCD_BIT_SET(bS10);	/*	정지*/	}
	else if( i == 2 )	{	_disp_mode = 0x01;	LCD_BIT_SET(bS6);	/*	난방*/	}
	else if( i == 3 )	{	_disp_mode = 0x08;	LCD_BIT_SET(bS7);	/*	예약*/	}
	else if( i == 4 )	{	_disp_mode = 0x10;	LCD_BIT_SET(bS8);	/*	반복*/	}
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

#define EXIT_sHOST(i)	__s = 0;\
						_dsCount = 10;\
						_dsPrev = 0xff;\
						__sUp = i;\
						lcd_blink_clear();

void	disp_status_loop_client(uint8_t key)
{
	uint8_t	i = 0;
	if( __s == 0 )
	{
		if( _dsCount == 0 )
		{
			_dsCount = 1;
			__sUp = 0;
			__sDn = 0xff;
			disp_status_loop_init();
		}
		else if( _dsCount == 10 )
		{
			_dsCount = 1;
			disp_status_loop_init();
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
				lcd_blink_item(bS6);
			}
			if( key == 1 )
			{
				if( __sUp == 0 )
				{
					if( _key_blink == 1 )
						goto DisplayEntry;
					disp_status_loop_clientDn(0);	//정지 - subR/C selection
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
			else if( key == 2 )
			{
marker_2:				
				if( __sUp == 1 && _key_blink == 1 )
					goto DisplayEntry;
marker_2s:
				__sUp = 1;
				_dsPrev = 0xff;
				disp_status_loop_message(__sUp);
				lcd_blink_item(bS7);
				_key_blink = 1;
			}
			else if( key == 3 )
			{
				if( __sUp == 0 )
				{
					if( _key_blink == 0 )
					{
#ifdef WD_FOR_HOBAN
//marker_1s:						
						__s = 2;
						_dsCount = 0;
						return;
#endif
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
			else if( key == 4 )
			{
marker_4:				
				if( __sUp == 2 && _key_blink == 1 )
					goto DisplayEntry;
marker_4s:
				__sUp = 2;
				_dsPrev = 0xff;
				disp_status_loop_message(__sUp);
				lcd_blink_item(bS8);
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
			disp_status_loop_clientDn(1);	//	외출모드 표시
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
		if( _dsCount == 1 || _dsCount == 4 )
		{
			if( _disp_mode != _disp_mode2 || packet_changed == 1)
			{
				packet_changed = 0;
				_dsCount = 1;
				_key_blink = 0;
				if( _disp_mode2 == 0x01 )		
				{
					__sUp = 0; 
				}
				else if( _disp_mode2 == 0x02 )	
				{	
					/*	YC error from MasterR/C select stop(Y)	*/	
					//_dsCount = 4;
					//disp_status_loop_clientDn(0);	//	외출
					_dsCount = 5;
					return;
				}
				else if( _disp_mode2 == 0x04 )	
				{	
					disp_status_loop_init();
					disp_status_loop_clientDn(0);	// 정지
					return;
				}
				else if( _disp_mode2 == 0x08 )	
				{
					_key_sec = _key_min = _key_hour = 0;
					goto marker_2s;
				}
				else if( _disp_mode2 == 0x10 )	
				{
					_key_sec = _key_min = _key_hour = 0;
					goto marker_4s;
				}
				else
					return;
				//	update display
				disp_status_loop_init();
			}
		}
	}
	else if( __s == /*2*/7 )
	{
		disp_backlight(0);
		if( key == 1 || key == 2 || key == 3 || key == 4 )
		{
			__s = 0;
			_dsCount = 0;
			file_update2(0);
		}
	}
	else if( __s == 2 )
	{
#ifdef WD_FOR_HOBAN
//		__s = 7;
//		return;
		
		if( uiInfo.cntlMode == 0 )
		{
//			__s = 7;
//			return;
		}
		//	Boiler 온수
		if( _dsCount == 0 )
		{
			lcd_clear(0);
			__sInfo = 2;
			lcd_disp_info(__sInfo, 0, 0);
			UI_DISP_2Digit(_boiler_water_shower);
			LCD_BIT_SET(bC2);
			lcd_disp_info_shower(0x80, 0);
			_dsCount = 1;
			_dsPrev = 0xff;
			__boiler_shower[0] = _boiler_water_shower;
			__boiler_shower[1] = 0xff;
			__boiler_shower[3] = uiInfo.opMode;
			__boiler_shower[5] = 1;
			__boiler_shower[4] = 0;
			_B_CNTL(0)

		}
		else if( _dsCount == 1 )
		{
			i = _boiler_water_shower;
			if( uiInfo.enc != 0 )
			{
				ENC_MOVE_0(40,70,5);
				_boiler_water_shower = i;
				__boiler_shower[1] = __timer1s;
				__boiler_shower[2] = 0;
			}			
			if( _dsPrev != i )
			{
				_dsPrev = i;
				UI_DISP_2Digit(i);
			}
			
			if( __boiler_shower[1] != 0xff )
			{
				if( __boiler_shower[1] != __timer1s )
				{
					__boiler_shower[1] = __timer1s;
					__boiler_shower[2]++;
					if( __boiler_shower[2] == 4 )
					{
						__boiler_shower[1] = 0xff;
						if( __boiler_shower[0] != _boiler_water_shower )
						{
							__boiler_shower[0] = _boiler_water_shower;
							_B_CNTL(0)
						}
					}
				}
			}
			if( __boiler_shower[5] == 0x80 )
			{
				key = 1;
				__boiler_shower[5] = 0;
			}
			
			if( key == 1 )		{	_B_CNTL(1) EXIT_sHOST(0);	}
			else if( key == 2 )	{	_B_CNTL(1) EXIT_sHOST(1);	}
			else if( key == 4 )	{	_B_CNTL(1) EXIT_sHOST(2);	}
			else if( key == 3 )	{	
				__s = 7;
				_dsCount = 0;
				lcd_blink_clear();
				_key_blink = 0;
				_B_CNTL(1) 
			}
		}
#endif
	}
}

