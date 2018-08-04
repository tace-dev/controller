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

extern uint8_t	_backlight;
extern uint8_t	_disp_temp;
extern uint8_t _rcLED;
extern uint8_t getHexToBin(uint8_t hex, uint8_t idx);
extern uint8_t packet_changed;
extern uint8_t _key_sec;
extern uint8_t _key_min;
extern uint8_t _key_hour;

extern uint8_t dr_mode_out;

extern uint8_t start_flag;
extern uint8_t debug_br;

#define REMOTE_MODE		uiInfo.remote_mode[__sRoom]
#define REMOTE_MODEi(i)	uiInfo.remote_mode[i]

#define KEY_ROOM			1
#define KEY_YB				2
#define KEY_NO	  		4
#define KEY_ONOFF			8
#define KEY_PLUS			16
#define KEY_MINUS			32

#define ENC_UP				0x40
#define ENC_DN				0x01

 
 // 난방수 실제 값 (린나이)
uint8_t rn_real_heat_water[] = {
	40,45,46,47,48,49,
	50,51,52,53,54,55,56,57,58,59,
	60,65,70,75,80,85
};
 // 온수 실제 값 (린나이)
uint8_t rn_real_shower_water[] = {
	35,36,37,38,39,40,41,42,43,44,45,46,47,50,55,60
};

uint8_t	ENC_MOVE_0_SHOWER(uint8_t temp)
{
	uint8_t num = 0;
	uint8_t i;
	
	//	if Not Rinnai
	if( (debug_br>>4) != 3 )
	{
		i = _boiler_water_shower;
		ENC_MOVE_0(35, 85, 1);
		return i;		
	}
	
	for (i = 0 ; i < 16 ; i++) {
		if (rn_real_shower_water[i] == temp) {
			num = i;
			break;
		}
	}
	
	if( (uiInfo.enc & 0x40) == 0 ) {
		if (num == 0) {
			//num = 15;
			num = 0;
		} else {
			num--;
		}
		
	} else {
		if (num == 15) {
			//num = 0;
			num = 15;
		} else {
			num++;
		}
	}
	
	return rn_real_shower_water[num];
}

uint8_t	ENC_MOVE_0_HEAT(uint8_t temp)
{
	uint8_t num = 0;
	uint8_t i;
	
	//	if Not Rinnai
	if( (debug_br>>4) != 3 )
	{
		i = _boiler_water_heat;
		ENC_MOVE_0(40, 85, 5);
		return i;		
	}
	
	for (i = 0 ; i < 22 ; i++) {
		if (rn_real_heat_water[i] == temp) {
			num = i;
			break;
		}
	}
	
	if( (uiInfo.enc & 0x40) == 0 ) {
		if (num == 0) {
			//num = 21;
			num = 0;
		} else {
			num--;
		}
		
	} else {
		if (num == 21) {
			//num = 0;
			num = 21;
		} else {
			num++;
		}
	}
	
	return rn_real_heat_water[num];
}
 
 
void	disp_status_remote_message(uint8_t i)
{
	lcd_clear_btn();
//	if( i == 0x01 )			{	LCD_BIT_SET(bP12);	/*	(0)난방*/	}
//	Not Display bP12, 20151025
	if( i == 0x01 )			{	/*LCD_BIT_SET(bP12);*/	/*	(0)난방*/	}
	else if( i == 0x02 )	{	LCD_BIT_SET(bP13);	/*	(1)외출*/	}
	else if( i == 0x04 )	{	LCD_BIT_SET(bP11);	/*	(2)정지*/	}
	else if( i == 0x08 )	{	LCD_BIT_SET(bP10);	/*	(2)예약*/	}
	else if( i == 0x10 )	{	LCD_BIT_SET(bP9);	/*	(2)반복*/	}
}

uint8_t		disp_status_loop_remote_N(uint8_t key)
{
	uint8_t	i;
	uint8_t	j = 0;
	i = uiInfo.tempSetup[key];
	
	if (i == 0) {
		i = 10;
		uiInfo.tempSetup[key] = i;
	}
	
	if( uiInfo.enc != 0 )
	{
		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
		if( i<=10 )	i = 10;
		if( i>=80 )	i = 80;
		uiInfo.tempSetup[key] = i;
		j = 1;
	}
	if( _dsPrev != i )
	{
		lcd_clear(0);
		disp_status_remote_message(0x01);
		_dsPrev = i;
		LCD_BIT_SET(bP19);	
		LCD_BIT_SET(bP20);
		LCD_BIT_SET(bP15);	
		LCD_BIT_SET(bP14);
		__ui_disp_temp_c(3);//도씨 표시
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
	
	if (i == 0) {
		i = 2;
		uiInfo.remote_time[key] = i;
	}
	
	if( uiInfo.enc != 0 )
	{
		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
		if( i<=2 )	i = 2;
		if( i>=48 )	i = 48;
		uiInfo.remote_time[key] = i;
		j = 1;
	}
	
	if( _dsPrev != i )
	{
		lcd_clear(0);
		disp_status_remote_message(0x08);
		_dsPrev = i;
		LCD_BIT_SET(bP19);	
		LCD_BIT_SET(bP20);
		__ui_disp_temp_c(1);//도씨 표시
		LCD_BIT_SET(bS2d);
		ui_disp_temp_curr(uiInfo.tCurr);
		ui_disp_reserve_setup(uiInfo.remote_time[key]);		
	}
	
	return j;
}

uint8_t		disp_status_loop_remote_J(uint8_t key)
{
	
	if (_dsPrev != 0xFE ) {
		_dsPrev = 0xFE;
		
		lcd_clear(0);
		disp_status_remote_message(0x04);
		
	} 
	
	return key;
}

uint8_t		disp_status_loop_remote_O(uint8_t key)
{
	
	if (_dsPrev != 0xFE ) {
		_dsPrev = 0xFE;
		
		lcd_clear(0);
		disp_status_remote_message(0x02);
		
		LCD_BIT_SET(bP19);	
		LCD_BIT_SET(bP20);
		__ui_disp_temp_c(3);
		ui_disp_clear_tSetup(1);
		ui_disp_temp_curr(uiInfo.tempCurr[key]);
		ui_disp_temp_setup(30);
	}
	
	return key;
}

uint8_t		disp_status_loop_remote_B(uint8_t key)
{
	uint8_t	i;
	uint8_t	j = 0;
	i = uiInfo.remote_banb[key];
	
	if (i == 0) {
		i = 10;
		uiInfo.remote_banb[key] = i;
	}
	
	if( uiInfo.enc != 0 )
	{
//		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
//		if( i<=5 )	i = 5;
//		if( i>=50 )	i = 50;
		i += (uiInfo.enc&0x40)==0 ? -10 : 10;
		if( i==0 )	i = 50;
		if( i==60 )	i = 10;
		uiInfo.remote_banb[key] = i;
		j = 1;
	}
	if( _dsPrev != i )
	{
		_dsPrev = i;
		
		lcd_clear(0);
		disp_status_remote_message(0x10);
		
		LCD_BIT_SET(bP19);	
		LCD_BIT_SET(bP20);
		LCD_BIT_SET(bS1);
		__ui_disp_temp_c(1);
		ui_disp_temp_curr(uiInfo.tCurr);
		ui_disp_repeat_setup(uiInfo.remote_banb[key]);
	}
	return j;
}

uint8_t		disp_status_loop_host_Off(uint8_t key)
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
//		uiInfo.tSetup = i;
//		lcd_blink_item(bS6);
		j = 1;
	}
	if( _dsPrev != i )
	{
		_dsPrev = i;
//		ui_disp_temp_mark(1);
//		ui_disp_temp_setup(uiInfo.tSetup);
//		ui_disp_temp_curr(uiInfo.tCurr);
//		UPDATE_BIT(BIT_TSETUP);
	}
	return j;
}
	
uint8_t		disp_status_loop_host_Out(uint8_t key)
{
	uint8_t	i;
	uint8_t	j = 0;
	i = uiInfo.tSetup;
	if( uiInfo.enc != 0 )
	{
//		ENC_MOVE(10,80,1);
//		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
//		if( i<=10 )	i = 10;
//		if( i>=80 )	i = 80;
//		uiInfo.tSetup = i;
//		lcd_blink_item(bS6);
		j = 1;
	}
	if( _dsPrev != i )
	{
		_dsPrev = i;
		
		if (dr_mode_out == 0) {
			lcd_blink_item(bP13);
		}
		
		LCD_BIT_SET(bP0);	
		ui_disp_temp_curr(uiInfo.tCurr);
		/*
			2015.10.25 by Heedo
		 */
		ui_disp_temp_setup(30);
		__ui_disp_temp_c(3);//도씨 표시
		/*
		//	move 1385Line@ui.c
		UPDATE_BIT(BIT_TSETUP);
		*/
	}
	return j;
}

uint8_t		disp_status_loop_host_Out_Long(uint8_t key)
{
	uint8_t	i;
	uint8_t	j = 0;
	i = uiInfo.tSetup;
	if( uiInfo.enc != 0 )
	{
//		ENC_MOVE(10,80,1);
//		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
//		if( i<=10 )	i = 10;
//		if( i>=80 )	i = 80;
//		uiInfo.tSetup = i;
//		lcd_blink_item(bS6);
		j = 1;
	}
	if( _dsPrev != i )
	{
		_dsPrev = i;
	//	LCD_BIT_SET(bP0);	
		ui_disp_temp_curr(uiInfo.tCurr);
		//UPDATE_BIT(BIT_TSETUP);
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
		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
		if( i<=10 )	i = 10;
		if( i>=80 )	i = 80;
		uiInfo.tSetup = i;
//		lcd_blink_item(bS6);
		j = 1;
	}
	if( _dsPrev != i )
	{
		_dsPrev = i;
//		ui_disp_temp_mark(1);
		LCD_BIT_SET(bP0);	
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
		i += (uiInfo.enc&0x40)==0 ? -_DEG : _DEG;
		if( i<=2 )	i = 2;
		if( i>=48 )	i = 48;
		uiInfo.reserve = i;
//		lcd_blink_item(bS7);
		j = 1;
	}
	if( _dsPrev != i )
	{
		_dsPrev = i;
		LCD_BIT_SET(bP0);	
		ui_disp_temp_curr(uiInfo.tCurr);
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
		i += (uiInfo.enc&0x40)==0 ? -10 : 10;
		if( i==0 )	i = 50;
		if( i==60 )	i = 10;
		uiInfo.repeat = i;
//		lcd_blink_item(bS8);
		j = 1;
	}
	if( _dsPrev != i )
	{
		_dsPrev = i;
		LCD_BIT_SET(bP0);	
		ui_disp_temp_curr(uiInfo.tCurr);
		ui_disp_repeat_setup(uiInfo.repeat);
		UPDATE_BIT(BIT_REPEAT);
	}
	return j;
}

uint8_t	_key_blink = 0;
extern uint8_t	packet_buf[];
extern uint8_t ui_timeout;

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
		if( i >= 7 )
			break;
			
		if( packet_buf[i] != ui_timeout ){
			led = getHexToBin(_rcLED, i);
			lcd_disp_rid(i + 1, led, 1);
		}
		else 
			lcd_clear_rid_n(i + 1, 1);
	}
}

extern void	func_rc_setting(void);
#define _B_CNTL(i)	_disp_status_loop_host_boiler(i);
#define _GOTO2(i,j)	{ _GOTO(i);	__sDn=j; }

/*	
	size 6->10 by heedop
 */
uint8_t	__boiler_shower[10];

void	_disp_status_loop_host_boiler(uint8_t id)
{
	uiInfo.opMode = (id==0) ? 7 : __boiler_shower[3];
	func_rc_setting();
}

uint8_t _key_time_event[3];

void	disp_status_loop_host(uint8_t key)
{
	uint8_t	i = 0;
	uint8_t	j = 0;
	uint8_t	k = 0;
	
	uint8_t _pre_boiler_water_shower = 0;
	uint8_t _pre_boiler_water_heat = 0;	
	
	if (_remote == 0) {
		disp_rid_info();
	}
	
	if( __s == 0 )  // 일반 모드
	{
		if( _dsCount == 0 )
		{
			_dsCount = 10;
			
			//__sUp = 0;
			
			if (start_flag == 0) {
				__sUp = 0;
			}
			start_flag = 0;
			
			__sDn = 0xff;
//			disp_status_loop_init();
			
		} else if (_dsCount == 9) {
			_dsCount = 1;
			__sDn = 0xff;
			disp_status_loop_init();
		}
		else if( _dsCount == 10 )
		{
			if (key==200) _GOTO(17)  // out long
			//else if(key ==201) __sUp = 20;
			
			if( __sUp == 0 )		_dsCount = 15;	//	N
			else if( __sUp == 1 )	_dsCount = 35;	//	Y
			else if( __sUp == 2 )	_dsCount = 25;	//	B
			else if( __sUp == 5 )	{_dsCount = 45; _key_time_event[0] = 0; }	//	off
			else if( __sUp == 16 )	{	_dsCount = 16; __sUp = 8;	} //	out
			else if( __sUp == 101 )	{	_dsCount = 0;	__s = 101; }
			else if( __sUp == 20 )	{	
			
			_dsCount = 0; 
			__s = 1;} // setting
			else if( __sUp == 17 )	{_dsCount = 17; _dsPrev = 0xff;}	//	Out long
			else 
				_dsCount = 1;
			disp_status_loop_init();
//			_dsCount = 1;
//			__sDn = 0xff;
//			disp_status_loop_init();
		}
		else if( _dsCount == 15 )			//	N/Out
		{
			if( key==1 )		_GOTO(101)	//	TBD//Remote
			else if( key==2 )	_GOTO2(1, 0)	//	Y/B
			else if( key==4 ) _GOTO(16)	//	Out
			else if( key==8 )	_GOTO(5)	//	Off
			else if( key==16 )	_DN
			else if( key==32 )	_UP
				
			_disp_temp = 1;
			i = disp_status_loop_host_N(key);
			if( i==1 )
				_key_blink = 1;
		}
		else if( _dsCount == 16 )			//	OUT
		{
			if( key==1 )		_GOTO(101)	//	TBD//Y
			else if( key==2 )	_GOTO(1)	//	Y
			else if( key==4 )	_GOTO(0)	//	N
			else if( key==8 )	_GOTO(5)	//	Off
		
			_disp_temp = 1;
			i = disp_status_loop_host_Out(key);
			if( i==1 )
				_key_blink = 1;
		}
		else if (_dsCount == 17) {
			dr_mode_out = 0;
			
#if defined (_RC_DR_)	// 2015.10.26 대림 : 전체 외출 과 개별 외출 화면 동일
			_GOTO(16);
#else			
			if( key==1 ) {		
				dr_mode_out = 1;
				_GOTO(101)	//	TBD//Y
			}
			else if( key==2 )	{
				dr_mode_out = 1;
				_GOTO(1)	//	Y
			}
			else if( key==4 )	{
				dr_mode_out = 1;
				_GOTO(0)	//	N
			}
			else if( key==8 )	{
				dr_mode_out = 1;
				_GOTO(5)	//	Off
			}
			
			_disp_temp = 1;
			i = disp_status_loop_host_Out_Long(key);       
			if( i==1 )
				_key_blink = 1;
#endif
		}
		else if( _dsCount == 25 )			//	B
		{
			if( key==1 )		_GOTO(101)	//	Y
			else if( key==2 )	
			{
				__sDn = 0;
				_GOTO(1)	//	Y
			}
			else if( key==4 )	_GOTO(0)	//	N
			else if( key==8 )	_GOTO(5)	//	Off
			else if( key==16 )	_DN
			else if( key==32 )	_UP
//			if( __sDn == 0 )
//				i = disp_status_loop_host_Y(key);
//			else
			_disp_temp = 1;
			i = disp_status_loop_host_B(key);
			if( i==1 )
				_key_blink = 1;
		}
		else if( _dsCount == 35 )			//	Y
		{
			if( key==1 )		_GOTO(101)	//	N
			else if( key==2 )	
			{
				__sDn = 1;
				_GOTO(2)	//	B
			}
			else if( key==4 )	_GOTO(0)	//	N
			else if( key==8 )	_GOTO(5)	//	Off
			else if( key==16 )	_DN
			else if( key==32 )	_UP
			_disp_temp = 1;
			i = disp_status_loop_host_Y(key);
			if( i==1 )
				_key_blink = 1;
		}
		else if( _dsCount == 45 )			//	off
		{
			if (_key_time_event[0] == 0) 
			{
				_key_time_event[0] = 1;
				_key_time_event[1] = __timer1s;
				_key_time_event[2] = 0;
			} 
			else if (_key_time_event[0] == 1)
			{
				if (_key_time_event[1] != __timer1s) {
					_key_time_event[1] = __timer1s;
					_key_time_event[2]++;
				}
				
				if (_key_time_event[2] == 10) {
					_key_time_event[0] = 2;
				}
			}
			
			
			if( key==1 )		_GOTO(101)	//	TBD
			else if( key==2 )	_GOTO(1)	//	Y
			else if( key==4 )	_GOTO(0)	//	N
			else if( key==8 )	
			{
				if (_key_time_event[0] == 2) 
				{
					 _GOTO(0)				//	on
				}
				else 
				{
					_GOTO(20)       // 	setting
				}
			}
		//	_disp_temp = 1;
			i = disp_status_loop_host_Off(key);
			if( i==1 )
				_key_blink = 1;
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
//				if( __sUp == 0 )		i = bS6;
//				else if( __sUp == 1 )	i = bS7;
//				else					i = bS8;
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
	else if( __s == 1 ) // 설정 난방수 모드
	{
		//	난방수
		if( _dsCount == 0 )
		{
			lcd_clear(0);
			__sInfo = 1;
			lcd_disp_info(__sInfo, 0, 0);
			UI_DISP_2Digit((debug_br &0xf0 ) == 0 ? 0 : _boiler_water_heat);
//			LCD_BIT_SET(bC2);
			lcd_disp_info_shower(0x08, 0);
			_dsCount = 1;
			_dsPrev = 0xff;
			
			_pre_boiler_water_heat = _boiler_water_heat;	
		}
		else if( _dsCount == 1 )
		{			
			if( key == KEY_ROOM )		{	EXIT_HOST(0);	}
			else if( key == KEY_YB )	{	EXIT_HOST(0);}
			else if( key == KEY_NO )	{	EXIT_HOST(0); }
			else if( key == KEY_ONOFF )	{EXIT_HOST(0); __s = 2;}
			else if( key == KEY_PLUS )	{uiInfo.enc = ENC_UP;}
			else if( key == KEY_MINUS )	{uiInfo.enc = ENC_DN;}
			
			i = _boiler_water_heat;
			if( uiInfo.enc != 0 )
			{
				_boiler_water_heat = ENC_MOVE_0_HEAT(i);
			}
			if( _dsPrev != i )
			{
				//	2016.1.12 heedo
				_dsPrev = i;
				UI_DISP_2Digit((debug_br &0xf0 ) == 0 ? 0 : _dsPrev);
			}
			
			if( _key_min == KEY_BOILER_FADE )
			{
				//	timer expire
				EXIT_HOST(0);
			}
		}
	}
	else if( __s == 2 ) // 설정 온수 모드
	{
		//	Boiler 온수
		if( _dsCount == 0 )
		{
			lcd_clear(0);
			__sInfo = 2;
			lcd_disp_info(__sInfo, 0, 0);
			UI_DISP_2Digit((debug_br &0xf0 ) == 0 ? 0 : _boiler_water_shower);
//			LCD_BIT_SET(bC2);
			lcd_disp_info_shower(0x80, 0);
			_dsCount = 1;
			_dsPrev = 0xff;
						
			__boiler_shower[4] = 0;
			__boiler_shower[5] = 1;
		
			_pre_boiler_water_shower = _boiler_water_shower;
		}
		else if( _dsCount == 1 )
		{
			if( key == KEY_ROOM )		{	goto RETURN_ENTRY;	}
			else if( key == KEY_YB )	{	goto RETURN_ENTRY;	}
			else if( key == KEY_NO )	{goto RETURN_ENTRY;}
			else if( key == KEY_ONOFF )	{	//file_update2(0);
																		goto RETURN_ENTRY;
																		//__s = 4;
																		//_dsCount = 0;
																		//lcd_blink_clear();
																		//_key_blink = 0;
																		}
			else if( key == KEY_PLUS )	{uiInfo.enc = ENC_UP;}
			else if( key == KEY_MINUS )	{uiInfo.enc = ENC_DN;}
			
			i = _boiler_water_shower;
			if( uiInfo.enc != 0 )
			{
				_boiler_water_shower = ENC_MOVE_0_SHOWER(i);
			}
			if( _dsPrev != i )
			{
				//	2016.1.12 heedo
				_dsPrev = i;
				UI_DISP_2Digit((debug_br &0xf0 ) == 0 ? 0 : _dsPrev);
			}
			
			if (__boiler_shower[5] == 0x80 ) {
				goto RETURN_ENTRY;
			}
			
			if( _key_min == KEY_BOILER_FADE )
			{
RETURN_ENTRY:

				if (_pre_boiler_water_heat != _boiler_water_heat) {
					FW_B_HEAT(_boiler_water_heat);
				}
				
				if (_pre_boiler_water_shower != _boiler_water_shower) {
					FW_B_SHOWER(_boiler_water_shower);
				}
				
				//	timer expire
				__boiler_shower[5] = 0;
				EXIT_HOST(0);
			}
		}
	}
	else if( __s == 4 )
	{
		/*
		if( key == KEY_PLUS )	{uiInfo.enc = ENC_UP;}
		else if( key == KEY_MINUS )	{uiInfo.enc = ENC_DN;}
		
		disp_backlight(0);
				
		if( key == KEY_ROOM || key == KEY_YB || key == KEY_NO || key == KEY_ONOFF )
		{
			file_update2(0);
			EXIT_HOST(0);
		}
		*/
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
	else if( __s == 101 )// remote
	{
		if( _dsCount == 0 )
		{
			lcd_clear(0);
			_remote = 1;
	
			j = uiInfo.cnt + uiInfo.cnt_sub;
			__sRoom = (uiInfo.id_rc + 1) % j;
_OneMore2:			
			if( packet_buf[__sRoom] == ui_timeout )
			{
				__sRoom = (__sRoom + 1) % j;
				goto _OneMore2;
			}
			
			j = __sRoom;
_RemoteEntry:
			if( __sRoom == uiInfo.id_rc )
			{
_RemoteExit:				
				_remote = 0;
				__s = 0;
				_dsCount = 0;
				lcd_blink_clear();
				return;
			}
			lcd_clear_rid();
			lcd_blink_itemRoom(__sRoom, 1);
			disp_status_remote_message(REMOTE_MODE); //모드 변경
			_dsCount = 1;
			_subRemote = 1;
		}
		else if( _dsCount == 1 )//remote 첫화면
		{
			if ( key == KEY_PLUS) 
			{
				uiInfo.enc = ENC_UP;
			}
			else if ( key == KEY_MINUS) 
			{
				uiInfo.enc = ENC_DN;
			}
			
			j = __sRoom;
			if( REMOTE_MODEi(j) == 0x01 )		{	_subRemote = 1; disp_status_loop_remote_N(j);	}
			else if( REMOTE_MODEi(j) == 0x08 )	{	_subRemote = 8;	disp_status_loop_remote_Y(j);	}
			else if( REMOTE_MODEi(j) == 0x10 )	{	_subRemote = 10; disp_status_loop_remote_B(j);	}
			else if( REMOTE_MODEi(j) == 0x04 )	{	_subRemote = 4; disp_status_loop_remote_J(j);	}
			else if( REMOTE_MODEi(j) == 0x02 )	{	_subRemote = 2; disp_status_loop_remote_O(j);	}
				
			if (_subRemote == 1) // remote 난방  
			{
				if( key == KEY_ROOM )	
				{
					_dsCount = 2;
				}
				else if( key == KEY_YB )
				{
					//lcd_clear(0);
					REMOTE_MODEi(j) = 0x08;
					//disp_status_remote_message(REMOTE_MODE);
				}
				else if( key == KEY_NO )
				{
					//lcd_clear(0);
					uiInfo.tempSetup[j] = 20;
					REMOTE_MODEi(j) = 0x02;
					//disp_status_remote_message(2);
				}
				else if( key == KEY_ONOFF )	
				{
					_dsPrev = 0xff;
					REMOTE_MODEi(j) = 0x04;
					
					/*
					lcd_clear(0);
					i = uiInfo.remote_mode[j];
					if( i == 0x04 )	{	REMOTE_MODE = 0x01;		}
					else			{	REMOTE_MODE = 0x04;		}
					disp_status_remote_message(REMOTE_MODE);
					*/
				}
				else if ( key == KEY_PLUS) {}
				else if ( key == KEY_MINUS) {}
			}
			else if (_subRemote == 8) // remote 예약
			{
				if( key == KEY_ROOM )	
				{
					_dsCount = 2;
				}
				else if( key == KEY_YB )
				{
					_dsPrev = 0xff;
					//lcd_clear(0);
					REMOTE_MODEi(j) = 0x10;
					//disp_status_remote_message(REMOTE_MODE);
				}
				else if( key == KEY_NO )
				{
					//lcd_clear(0);
					REMOTE_MODEi(j) = 0x01;
					//disp_status_remote_message(1);
				}
				else if( key == KEY_ONOFF )	
				{
					_dsPrev = 0xff;
					REMOTE_MODEi(j) = 0x04;
				}
				else if ( key == KEY_PLUS) {}
				else if ( key == KEY_MINUS) {}
			}
			else if (_subRemote == 10) // remote 반복
			{
				if( key == KEY_ROOM )	
				{
					_dsCount = 2;
				}
				else if( key == KEY_YB )
				{
					_dsPrev = 0xff;
					//lcd_clear(0);
					REMOTE_MODEi(j) = 0x08;
					//disp_status_remote_message(REMOTE_MODE);
				}
				else if( key == KEY_NO )
				{
					//lcd_clear(0);
					REMOTE_MODEi(j) = 0x01;
					//disp_status_remote_message(1);
				}
				else if( key == KEY_ONOFF )	
				{
					_dsPrev = 0xff;
					REMOTE_MODEi(j) = 0x04;
				}
				else if ( key == KEY_PLUS) {}
				else if ( key == KEY_MINUS) {}
			}
			else if (_subRemote == 4) // remote 정지
			{
				if( key == KEY_ROOM )	
				{
					_dsCount = 2;
				}
				else if( key == KEY_YB )
				{
					_dsPrev = 0xff;
					//lcd_clear(0);
					REMOTE_MODEi(j) = 0x08;
					//disp_status_remote_message(REMOTE_MODE);
				}
				else if( key == KEY_NO )
				{
					//lcd_clear(0);
					REMOTE_MODEi(j) = 0x01;
					//disp_status_remote_message(1);
				}
				else if( key == KEY_ONOFF )	
				{
					REMOTE_MODEi(j) = 0x01;
				}
				else if ( key == KEY_PLUS) {}
				else if ( key == KEY_MINUS) {}
			}
			else if (_subRemote == 2) // remote 외출
			{
				if( key == KEY_ROOM )	
				{
					_dsCount = 2;
				}
				else if( key == KEY_YB )
				{
					//lcd_clear(0);
					_dsPrev = 0xff;
					REMOTE_MODEi(j) = 0x08;
					//disp_status_remote_message(REMOTE_MODE);
				}
				else if( key == KEY_NO )
				{
					//lcd_clear(0);
					REMOTE_MODEi(j) = 0x01;
					//disp_status_remote_message(1);
				}
				else if( key == KEY_ONOFF )	
				{
					_dsPrev = 0xff;
					REMOTE_MODEi(j) = 0x04;
				}
				else if ( key == KEY_PLUS) {}
				else if ( key == KEY_MINUS) {}
			}
			
			if( _key_min == KEY_BLINK_FADE )
			{
				goto _RemoteExit;
			}
		}
		else if (_dsCount == 2) 
		{
_OneMore:			
			j = 8;
			__sRoom = (__sRoom + 1) % j;
			if( packet_buf[__sRoom] == ui_timeout )
			{
				goto _OneMore;
			}			
			if( __sRoom != 0 ) {
				
				j = __sRoom - 1;
			}
			
			goto _RemoteEntry;
		}
	}

	// TODO: check 
	/*
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
	*/
	if (packet_changed == 1) {
		__s = 0;
		_dsCount = 10;
		switch (_disp_mode2) {
			case 0x01:	_dsCount = 0;	break;
			case 0x02:  __sUp = 16;  break;
			case 0x04:  __sUp = 5;	break;
			case 0x40:	__sUp = 5;	break;
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
