//	
#include "stdafx.h"
#include "uiDef.h"

uint8_t	_boiler_type = 0;
uint8_t	_boiler_water_shower = 50;
uint8_t	_boiler_water_heat = 70;
uint8_t	_boiler_fire =0;
uint8_t	_remote = 0;

uint8_t	_disp_mode = 0x01;
uint8_t	_disp_mode2 = 0x01;
uint8_t _remote_buf[8];

/*	
	size 6->10 by heedop
 */
uint8_t	__boiler_shower[10];

extern uint8_t	_backlight;
extern uint8_t	_disp_temp;
extern uint8_t _rcLED;
extern uint8_t getHexToBin(uint8_t hex, uint8_t idx);
extern uint8_t packet_changed;
extern uint8_t _key_sec;
extern uint8_t _key_min;
extern uint8_t _key_hour;

#define EXIT_HOST(i)	__s = 0;\
						_dsCount = 0;\
						_dsPrev = 0xff;\
						lcd_blink_clear();\
						lcd_disp_info(__sInfo, 1, 0);

#define EXIT_HOST2(i)	__s = 0;\
						__sUp = i;\
						_dsCount = 10;\
						_dsPrev = 0xff;\
						lcd_blink_clear();\
						lcd_disp_info(__sInfo, 1, 0);

#define EXIT_HOST3(i)	__s = 0;\
						__sDn = i;\
						_dsCount = 11;\
						_dsPrev = 0xff;\
						lcd_blink_clear();\
						lcd_disp_info(__sInfo, 1, 0);

#define REMOTE_EXIT		\
						if( __sRoom == uiInfo.id_rc )\
						{\
							_remote = 0;\
							__s = 0;\
							return;\
						}

#define REMOTE_MODE		uiInfo.remote_mode[__sRoom]
#define REMOTE_MODEi(i)	uiInfo.remote_mode[i]

void	disp_status_remote_message(uint8_t i)
{
	lcd_clear_btn();
	if( i == 0x01 )			{	LCD_BIT_SET(bS6);	/*	(0)난방*/	}
	else if( i == 0x02 )	{	LCD_BIT_SET(bS9);	/*	(1)외출*/	}
	else if( i == 0x04 )	{	LCD_BIT_SET(bS10);	/*	(2)정지*/	}
	else if( i == 0x08 )	{	LCD_BIT_SET(bS7);	/*	(2)예약*/	}
	else if( i == 0x10 )	{	LCD_BIT_SET(bS8);	/*	(2)반복*/	}
}

uint8_t		disp_status_loop_remote_N(uint8_t key)
{
	uint8_t	i;
	uint8_t	j = 0;
	i = uiInfo.tempSetup[key];
	if( uiInfo.enc != 0 )
	{
//		ENC_MOVE(10,80,1);
		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
		if( i<=10 )	i = 10;
		if( i>=80 )	i = 80;
		uiInfo.tempSetup[key] = i;
		j = 1;
	}
	if( _dsPrev != i )
	{
		_dsPrev = i;
		ui_disp_temp_mark(1);
		ui_disp_temp_setup(uiInfo.tempSetup[key]);
		ui_disp_temp_curr(uiInfo.tempCurr[key]);
	}
	return j;
}
	
uint8_t	disp_status_loop_remote_Y(uint8_t key)
{
	uint8_t	i;
	uint8_t	j = 0;
	i = uiInfo.remote_time[key];
	if( uiInfo.enc != 0 )
	{
//		ENC_MOVE(2,48,1);
		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
		if( i<=2 )	i = 2;
		if( i>=48 )	i = 48;
		uiInfo.remote_time[key] = i;
		j = 1;
	}
	if( _dsPrev != i )
	{
		_dsPrev = i;
		ui_disp_reserve_setup(uiInfo.remote_time[key]);
	}
	return j;
}

uint8_t		disp_status_loop_remote_J(uint8_t key)
{
	
	if (_dsPrev != 0xFE ) {
		_dsPrev = 0xFE;
		ui_disp_clear_tSetup(1);
		ui_disp_temp_curr(uiInfo.tempCurr[key]);
	}
	
	return key;
}

uint8_t		disp_status_loop_remote_B(uint8_t key)
{
	uint8_t	i;
	uint8_t	j = 0;
	i = uiInfo.remote_banb[key];
	if( uiInfo.enc != 0 )
	{
//		ENC_MOVE(5,85,1);
		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
		if( i<=5 )	i = 5;
		if( i>=85 )	i = 85;
		uiInfo.remote_banb[key] = i;
		j = 1;
	}
	if( _dsPrev != i )
	{
		_dsPrev = i;
		ui_disp_repeat_setup(uiInfo.remote_banb[key]);
	}
	return j;
}

uint8_t		disp_status_loop_host_N(uint8_t key)
{
	uint8_t	i;
	uint8_t	j = 0;
	i = uiInfo.tSetup;
	if( uiInfo.enc != 0 )
	{
//		ENC_MOVE(10,80,1);
		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
		if( i<=10 )	i = 10;
		if( i>=80 )	i = 80;
		uiInfo.tSetup = i;
		lcd_blink_item(bS6);
		j = 1;
	}
	if( _dsPrev != i )
	{
		_dsPrev = i;
		ui_disp_temp_mark(1);
		ui_disp_temp_setup(uiInfo.tSetup);
		ui_disp_temp_curr(uiInfo.tCurr);
		UPDATE_BIT(BIT_TSETUP);
	}
	return j;
}
	
uint8_t	disp_status_loop_host_Y(uint8_t key)
{
	uint8_t	i;
	uint8_t	j = 0;
	i = uiInfo.reserve;
	if( uiInfo.enc != 0 )
	{
//		ENC_MOVE_0(2,48,1);
		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
		if( i<=2 )	i = 2;
		if( i>=48 )	i = 48;
		uiInfo.reserve = i;
		lcd_blink_item(bS7);
		j = 1;
	}
	if( _dsPrev != i )
	{
		_dsPrev = i;
		ui_disp_reserve_setup(uiInfo.reserve);
		UPDATE_BIT(BIT_RESERVE);
	}
	return j;
}

uint8_t		disp_status_loop_host_B(uint8_t key)
{
	uint8_t	i;
	uint8_t	j = 0;
	i = uiInfo.repeat;
	if( uiInfo.enc != 0 )
	{
//		ENC_MOVE_0(5,85,1);
		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
		if( i<=5 )	i = 5;
		if( i>=85 )	i = 85;
		uiInfo.repeat = i;
		lcd_blink_item(bS8);
		j = 1;
	}
	if( _dsPrev != i )
	{
		_dsPrev = i;
		ui_disp_repeat_setup(uiInfo.repeat);
		UPDATE_BIT(BIT_REPEAT);
	}
	return j;
}

uint8_t	_key_blink = 0;
extern uint8_t	packet_buf[];

void	disp_rid_info(void)
{
	uint8_t	i, j;
	uint8_t	led;
	/*
	* Main R/C too
	*/
	j = uiInfo.cnt + uiInfo.cnt_sub;
	for( i=1; i<j; i++ )
	{
		if( i >= 8 )
			break;
		if( packet_buf[i] != 10 ){
			led = getHexToBin(_rcLED, i);
			lcd_disp_rid(i + 1, led, 1);
		}
		else 
			lcd_clear_rid_n(i+1, 1);
	}
}

void	disp_status_loop_host(uint8_t key)
{
	uint8_t	i = 0;
	uint8_t	j = 0;
	uint8_t	k = 0;
	/*
	if( uiInfo.opMode == 3 )
	{
		//	TAB
		if( uiInfo.tCurr >= uiInfo.tSetup )
		{
			D_IO_HIGH(D_LED_PORT, D_LED_PIN);
		}
		else
		{
			D_IO_HIGH(D_LED_PORT, D_LED_PIN);
		}
	}
	*/
	if (_remote == 0) {
		disp_rid_info();
	}
	
	_disp_temp = 0;
	if( __s == 0 )
	{
		if( _dsCount == 0 )
		{
			_dsCount = 1;
			__sUp = 0;
			__sDn = 0xff;
			disp_status_loop_init();
		} else if (_dsCount == 9) {
			_dsCount = 1;
			__sDn = 0xff;
			disp_status_loop_init();
		}
		else if( _dsCount == 10 )
		{
			_dsCount = 1;
			__sDn = 0xff;
			disp_status_loop_init();
		}
		else if( _dsCount == 11 )
		{
			_dsCount = 2;
			__sUp = 0xff;
			disp_status_loop_init();
			disp_status_loop_messageDn(__sDn);
			disp_status_curr_only();
		}
		else if( _dsCount == 1 )
		{
			/*	난방*/
			/*	예약 (00:30 ~ 24:00)*/
			/*	반복 (85:5 -> 5:85)*/
			if( __sUp == 0 )		{	i = disp_status_loop_host_N(key);	}
			else if( __sUp == 1 )	{	i = disp_status_loop_host_Y(key);	}
			else if( __sUp == 2 )	{	i = disp_status_loop_host_B(key);	}
			
			if( i==1 )
				_key_blink = 1;
				
			//	temp display option
			_disp_temp = __sUp==0 ? 1 : 0;
			if( _disp_temp == 0 && _key_blink == 0 )
			{
				if( __sUp == 1 || __sUp == 2 || __sUp == 5 || __sUp == 8)
					_disp_temp = 1;
			}
				
			if( key == 1 )
			{
				__sUp = (__sUp+1) % 3;
SetupEntry2:				
				if( __sUp == 0 )		i = bS6;
				else if( __sUp == 1 )	i = bS7;
				else					i = bS8;
				lcd_blink_item(i);
				disp_status_loop_message(__sUp);
				_dsPrev = 0xff;
				//
				_key_blink = 1;
			}
			else if( key == 2 )
			{
				__sUp = 0xff;
				__sDn = 0;
				disp_status_loop_messageDn(__sDn);
				disp_status_curr_only();
				lcd_blink_clear();
				_dsCount = 2;
				_dsPrev = 0xff;
				//
				_key_blink = 0;
			}
			else if( key == 3 )
			{
				if( __sUp == 0 )
				{			
					if( _key_blink == 0 )
					{
SetupEntry:				
						if( uiInfo.cntlMode == 0 )
							__s = 4;
						else
							__s = 1;
						_dsCount = 0;
					}
				}
				else if( __sUp == 1 )	
				{
					if( _key_blink != 1 )
						goto SetupEntry2;
				}
				else if( __sUp == 2 )	
				{	
					if( _key_blink != 1 )
						goto SetupEntry2;
				}
				disp_status_loop_init();
				//
				_key_blink = 0;
			}
			else if( key == 4 )
			{
				if( _key_blink == 1 )
				{
					//	cancel
					disp_status_loop_init();
					_key_blink = 0;
				}
				else
				{
					__s = 3;
					_dsCount = 0;
					_dsPrev = 0xff;
				}
			}
			if( _key_blink == 1 )
			{
				if( _key_sec >= KEY_BLINK_FADE )
				{
					//	reset key timer
					lcd_blink_clear();
					_key_blink = 0;
					_dsCount = 10;
				}
			}
		}
		else if( _dsCount == 2 )
		{
			_disp_temp = 1;
			if( key == 1 )
			{
				__sUp = 0;
				_dsCount = 0;
			}
			else if( key == 2 )
			{
				__sDn = __sDn==0 ? 1 : 0;
				disp_status_loop_messageDn(__sDn);
				disp_status_curr_only();
			}
			else if( key == 3 )	{	goto SetupEntry;	}
			else if( key == 4 )
			{
			}
			if( uiInfo.enc != 0 )
			{
				__sUp = 0;
				_dsCount = 0;
			}			
		}
	}
	else if( __s == 1 )
	{
		//	난방수
		if( _dsCount == 0 )
		{
			lcd_clear(0);
			__sInfo = 1;
			lcd_disp_info(__sInfo, 0, 0);
			UI_DISP_2Digit(_boiler_water_heat);
			LCD_BIT_SET(bC2);
			lcd_disp_info_shower(0x08, 0);
			_dsCount = 1;
			_dsPrev = 0xff;
		}
		else if( _dsCount == 1 )
		{
			i = _boiler_water_heat;
			if( uiInfo.enc != 0 )
			{
				ENC_MOVE_0(40,80,5);
				_boiler_water_heat = i;
			}
			if( _dsPrev != i )
			{
				_dsPrev = i;
				UI_DISP_2Digit(i);
			}
			
			if( key == 1 )		{	EXIT_HOST(0);	}
			else if( key == 2 )	{	EXIT_HOST3(0);	}
			else if( key == 3 )	{	EXIT_HOST(0);	__s = 2;	}
			else if( key == 4 )	{
			}
			if( _key_min == KEY_BOILER_FADE )
			{
				//	timer expire
				EXIT_HOST(0);
			}
		}
	}
	else if( __s == 2 )
	{
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
		}
		else if( _dsCount == 1 )
		{
			i = _boiler_water_shower;
			if( uiInfo.enc != 0 )
			{
				ENC_MOVE_0(40,70,5);
				_boiler_water_shower = i;
			}
			if( _dsPrev != i )
			{
				_dsPrev = i;
				UI_DISP_2Digit(i);
			}
			
			if( key == 1 )		{	EXIT_HOST(0);	}
			else if( key == 2 )	{	EXIT_HOST3(0);	}
			else if( key == 3 )	{	/*EXIT_HOST(0);*/
				__s = 4;
				_dsCount = 0;
				lcd_blink_clear();
				_key_blink = 0;
			}
			else if( key == 4 )	{
			}
			if( _key_min == KEY_BOILER_FADE )
			{
				//	timer expire
				EXIT_HOST(0);
			}
		}
	}
	else if( __s == 4 )
	{
		disp_backlight(0);
		if( key == 1 || key == 2 || key == 3 || key == 4 )
		{
			file_update2(0);
			EXIT_HOST(0);
		}
	}
	else if( __s == 3 )
	{
		//	ROOM Control
		if( _dsCount == 0 )
		{
			lcd_clear(0);
			ui_disp_temp_mark(1);
			_remote = 1;
	
			j = uiInfo.cnt + uiInfo.cnt_sub;
			__sRoom = (uiInfo.id_rc + 1) % j;
			
OneMore2:			
			if( packet_buf[__sRoom] == 10 )
			{
				__sRoom = (__sRoom + 1) % j;
				goto OneMore2;
			}
			
			j = __sRoom;
RemoteEntry:
			if( __sRoom == uiInfo.id_rc )
			{
RemoteExit:				
				//	mode change
				_remote = 0;
				__s = 5;
				_dsCount = 0;
				lcd_blink_clear();
				return;
			}
			lcd_clear_rid();
			lcd_blink_itemRoom(__sRoom, 1);
			disp_status_remote_message(REMOTE_MODE); //모드 변경
			_dsCount = 4;
		}
		else if( _dsCount == 2 )
		{
			/*
			*/
OneMore:			
			j = uiInfo.cnt + uiInfo.cnt_sub;
			__sRoom = (__sRoom + 1) % j;
			if( packet_buf[__sRoom] == 10 )
			{
				goto OneMore;
			}			
			if( __sRoom != 0 ) {
				
				j = __sRoom - 1;
			}
			goto RemoteEntry;
		}
		else if( _dsCount == 4 )
		{
			j = __sRoom;
			//	display info
			if( REMOTE_MODEi(j) == 0x01 )		{	disp_status_loop_remote_N(j);	}
			else if( REMOTE_MODEi(j) == 0x08 )	{	disp_status_loop_remote_Y(j);	}
			else if( REMOTE_MODEi(j) == 0x10 )	{	disp_status_loop_remote_B(j);	}
			else if( REMOTE_MODEi(j) == 0x04 )	{	disp_status_loop_remote_J(j);	}
			if( key == 1 )	
			{
				//REMOTE_EXIT;
				//	change status, Nan -> Y -> B
				if( REMOTE_MODEi(j)==0x01 )		{	REMOTE_MODEi(j) = 0x08;		}
				else if( REMOTE_MODEi(j)==0x08 ){	REMOTE_MODEi(j) = 0x10;		}
				else if( REMOTE_MODEi(j)==0x10 ){	REMOTE_MODEi(j) = 0x01;		}
				else if( REMOTE_MODEi(j)==0x04 ){	REMOTE_MODEi(j) = 0x01;		}
				disp_status_remote_message(REMOTE_MODE);
			}
			else if( key == 2 )
			{
				i = uiInfo.remote_mode[j];
				if( i == 0x04 )	{	REMOTE_MODE = 0x01;		}
				else			{	REMOTE_MODE = 0x04;		}
				disp_status_remote_message(REMOTE_MODE);
			}
			else if( key == 3 )
			{
				goto RemoteExit;
			}
			else if( key == 4 )	
			{
				_dsCount = 2;
			}
			if( _key_min == KEY_BLINK_FADE )
			{
				goto RemoteExit;
			}
		}
		else if( _dsCount == 1 )
		{
			j = __sRoom;
			if( REMOTE_MODEi(j) == 0x01 )		
			{	
				i = disp_status_loop_remote_N(j);	
				REMOTE_MODEi(j) = 0x08;
			}
			else if( REMOTE_MODEi(j) == 0x08 )	
			{	
				i = disp_status_loop_remote_Y(j);	
				REMOTE_MODEi(j) = 0x10;
			}
			else if( REMOTE_MODEi(j) == 0x10 )	
			{	
				i = disp_status_loop_remote_B(j);	
				REMOTE_MODEi(j) = 0x01;
			}
			
			_dsCount = 4;	
		}
		if( _key_min == KEY_BLINK_FADE )
		{
			goto RemoteExit;
		}
	} else if (__s == 5){
		__sUp = 0;
		
		switch (_disp_mode) {
		case 0x01:	__sUp = 0;	break;
		case 0x02:	__sUp = 3;	break;
		case 0x04:	__sUp = 4;	break;
		case 0x08:	__sUp = 1;	break;
		case 0x10:	__sUp = 2;	break;
		}
		__sDn = 0xff;
		disp_status_loop_init();
		_dsCount = 1;
		__s = 0;
		_key_blink = 1;
		_key_sec = _key_min = _key_hour = 0;
	}
	
	// TODO: check 
	if (packet_changed == 1) {
		__s = 0;
		switch (_disp_mode2) {
			case 0x01:	_dsCount = 0;	break;
			case 0x02:
				_dsCount = 11;
				__sDn = 1;
				break;
			case 0x04:
				_dsCount = 11;
				__sDn = 0;	
				break;
		}
		packet_changed = 0;
	}
}
#if	0
	if( i == 0x01 )			{	LCD_BIT_SET(bS6);	/*	(0)난방*/	}
	else if( i == 0x02 )	{	LCD_BIT_SET(bS9);	/*	(1)외출*/	}
	else if( i == 0x04 )	{	LCD_BIT_SET(bS10);	/*	(2)정지*/	}
	else if( i == 0x08 )	{	LCD_BIT_SET(bS7);	/*	(2)예약*/	}
	else if( i == 0x10 )	{	LCD_BIT_SET(bS8);	/*	(2)반복*/	}
#endif

