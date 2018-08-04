//	
#include "stdafx.h"
#include "uiDef.h"
#include "rc_protocol.h"

uint8_t	_boiler_type = 0;
uint8_t	_boiler_water_shower = 50;
uint8_t	_boiler_water_heat = 70;
uint8_t	_boiler_fire =0;
uint8_t	_remote = 0;

uint8_t	_disp_mode = 0x01;
uint8_t	_disp_mode2 = 0x01;
uint8_t _remote_buf[8];

uint8_t	_remote_s[8];

extern uint8_t start_flag;
extern uint8_t	_backup_backlight2;
extern uint8_t	_backlight;
extern uint8_t	_disp_temp;
extern uint8_t _rcLED;
extern uint8_t getHexToBin(uint8_t hex, uint8_t idx);
extern uint8_t packet_changed;
extern uint8_t _key_sec;
extern uint8_t _key_min;
extern uint8_t _key_hour;

extern uint8_t dr_mode_out;

#define REMOTE_MODE		uiInfo.remote_mode[__sRoom]
#define REMOTE_MODEi(i)	uiInfo.remote_mode[i]

#if defined (_RC_DW_) 
#define KEY_ROOM			8
#define KEY_YB				4
#define KEY_NO	  		1
#define KEY_ONOFF			128  //no use
#define KEY_PLUS			16
#define KEY_MINUS			32

#define ENC_UP				0x40
#define ENC_DN				0x01

#elif defined (_RC_DW_VENT_)

#define VK_NAN		0x01
#define VK_OUT		0x02
#define VK_UP		0x04
#define VK_VENT		0x08
#define VK_SET		0x10
#define VK_ROOM		0x20
#define VK_DN		0x40
#define VK_FUNC		0x80
/*
*/
#define KEY_ROOM			1
#define KEY_YB				2
#define KEY_NO	  		4
#define KEY_ONOFF			8
#define KEY_PLUS			16
#define KEY_MINUS			32

#define ENC_UP				0x01
#define ENC_DN				0x40

#else
#define KEY_ROOM			1
#define KEY_YB				2
#define KEY_NO	  		4
#define KEY_ONOFF			8
#define KEY_PLUS			16
#define KEY_MINUS			32

#define ENC_UP				0x40
#define ENC_DN				0x01

uint8_t	temp_tsetup = 20;

#endif
void	disp_status_remote_message(uint8_t i)
{
	lcd_clear_btn();
	if( i == 0x01 )			{	LCD_BIT_SET(bT16);	/*	(0)난방*/	}
	else if( i == 0x02 )	{	LCD_BIT_SET(bT13);	/*	(1)외출*/	}
//	else if( i == 0x04 )	{	LCD_BIT_SET(bT7);	/*	(2)정지*/	}
	else if( i == 0x08 )	{	LCD_BIT_SET(bT14);	/*	(2)예약*/	}
	else if( i == 0x10 )	{	LCD_BIT_SET(bT15);	/*	(2)반복*/	}
}

uint8_t		disp_status_loop_remote_N(uint8_t key)
{
	uint8_t	i;
	uint8_t	j = 0;
	i = uiInfo.tempSetup[key];
	if( uiInfo.enc != 0 )
	{
		i += (uiInfo.enc&0x40)==0 ? -2 : 2;
		if( i<=10 )	i = 10;
		if( i>=80 )	i = 80;
		uiInfo.tempSetup[key] = i;
		j = 1;
	}
	if( _dsPrev != i )
	{
		_dsPrev = i;
		LCD_BIT_SET(bT1);	//	현재온도
		LCD_BIT_SET(bT4);	//	설정온도
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
		_dsPrev = i;
//		LCD_BIT_SET(bT1);	
//		__ui_disp_temp_c(1);//도씨 표시
//		LCD_BIT_SET(bS2d);
//		ui_disp_temp_curr(uiInfo.tCurr);
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

uint8_t		disp_status_loop_remote_O(uint8_t key)
{
	
	if (_dsPrev != 0xFE ) {
		_dsPrev = 0xFE;
		//LCD_BIT_SET(bT1);	//	현재온도
		//__ui_disp_temp_c(1);
		//ui_disp_clear_tSetup(1);
		//ui_disp_temp_curr(uiInfo.tempCurr[key]);

		LCD_BIT_SET(bT1);	//	현재온도
		LCD_BIT_SET(bT4);	//	설정온도
		__ui_disp_temp_c(3);//도씨 표시
		ui_disp_temp_setup(/*uiInfo.tempSetup[key]*/20);
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
//		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
//		if( i<=5 )	i = 5;
//		if( i>=50 )	i = 50;
		i += (uiInfo.enc&0x40)==0 ? -5 : 5;
		if( i<30 )	i = 85;
		else if( i>90 )	i = 30;
		/*
		i += (uiInfo.enc&0x40)==0 ? -10 : 10;
		if( i==0 )	i = 50;
		if( i==60 )	i = 10;
		*/
		uiInfo.remote_banb[key] = i;
		j = 1;
	}
	if( _dsPrev != i )
	{
		_dsPrev = i;
//  	LCD_BIT_SET(bT1);	//	현재온도
//		LCD_BIT_SET(bS1);
//		__ui_disp_temp_c(1);
	//	ui_disp_temp_curr(uiInfo.tCurr);
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
//		LCD_BIT_SET(bP0);	
#if defined(_RC_DW_)
		ui_disp_temp_setup(20/*uiInfo.tSetup*/);
		__ui_disp_temp_c(2+1);
		LCD_BIT_SET(bT4);	//	설정온도
		//	disp_status_loop_message()
#endif
		ui_disp_temp_curr(uiInfo.tCurr);
		UPDATE_BIT(BIT_TSETUP);
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
//		LCD_BIT_SET(bP0);	
		ui_disp_temp_setup(uiInfo.tSetup);
		ui_disp_temp_curr(uiInfo.tCurr);

		UPDATE_BIT(BIT_TSETUP);
	}
	return j;
}
	
uint8_t		disp_status_loop_host_N2OUT(uint8_t key)
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
//		LCD_BIT_SET(bP0);	
#if defined(_RC_DW_)
		ui_disp_temp_setup(20/*uiInfo.tSetup*/);
		__ui_disp_temp_c(2+1);
		LCD_BIT_SET(bT4);	//	설정온도
		//	disp_status_loop_message()
#endif
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
		i += (uiInfo.enc&0x40)==0 ? -2 : 2;
		if( i<=2 )	i = 2;
		if( i>=48 )	i = 48;
		uiInfo.reserve = i;
//		lcd_blink_item(bS7);
		j = 1;
	}
	if( _dsPrev != i )
	{
		_dsPrev = i;
//		LCD_BIT_SET(bP0);	
//		ui_disp_temp_curr(uiInfo.tCurr);
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
		i += (uiInfo.enc&0x40)==0 ? -5 : 5;
		if( i<30 )	i = 30;
		else if( i>90 )	i = 90;
		uiInfo.repeat = i;
//		lcd_blink_item(bS8);
		j = 1;
	}
	if( _dsPrev != i )
	{
		_dsPrev = i;
//		LCD_BIT_SET(bP0);	
//		ui_disp_temp_curr(uiInfo.tCurr);
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
	for( i=1; i<6; i++ )
	{
		lcd_clear_rid_n(i + 1, 1);
		if( i <= j )
		{
			if( packet_buf[i] != 10 ){
				led = getHexToBin(_rcLED, i);
				lcd_disp_rid(i + 1, led, 1);
			}
		}
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
	
#if defined (_RC_DW_VENT_)
	LPVENTINFO	lp = vent_getInfo();
	if( lp->enable == 1 )
		return;
#endif

	if (_remote == 0/* && __s != 200*/ ) {
		disp_rid_info();
	}
	
	if( __s == 0 )  // 일반 모드
	{
		if( _dsCount == 0 )
		{
			_dsCount = 10;
			
			//__sUp = 0;
			
			if (start_flag == 0) {	__sUp = 0;		}
			/*
			else
			{
				if( __sUp == 16 )		__sUp = 151;
				else if( __sUp == 2 )	__sUp = 155;
				else if( __sUp == 5 )	__sUp = 155;
				else if( __sUp == 2 )	__sUp = 155;
			}
			*/
			start_flag = 0;
			
			__sDn = 0xff;
			disp_status_loop_init();
			
		} else if (_dsCount == 9) {
			_dsCount = 1;
			__sDn = 0xff;
			disp_status_loop_init();
		}
		else if( _dsCount == 10 )
		{
			//if (key==220) _GOTO(17)  // out long
			//else if(key ==201) __sUp = 20;
			
			if( __sUp == 0 )		_dsCount = 15;	//	N
			//else if( __sUp == 1 )	_dsCount = 35;	//	Y
			//else if( __sUp == 2 )	_dsCount = 25;	//	B
			else if( __sUp == 5 )	{_dsCount = 45; _key_time_event[0] = 0; }	//	off
			else if( __sUp == 16 )	{	_dsCount = 16; __sUp = 8;	} //	out
			else if( __sUp == 101 )	{	_dsCount = 0;	__s = 101; }
			else if( __sUp == 20 )	{	
				_dsCount = 0; 
				__s = 1;
			} // setting
			else if( __sUp == 17 )	{_dsCount = 17; _dsPrev = 0xff;}	//	Out long
			else if( __sUp == 151 || __sUp == 16 )	_dsCount = 151;	//	외출
			else if( __sUp == 152 )	_dsCount = 152;	//	온수
			else if( __sUp == 153 )	_dsCount = 153;	//	난방
			else if( __sUp == 154 || __sUp == 1 )	_dsCount = 154;	//	예약
			else if( __sUp == 155 || __sUp == 2 )	_dsCount = 155;	//	타이머
			else 
				_dsCount = 1;
			disp_status_loop_init();
		}
		/*
		*/
		else if( _dsCount == 16 )			//	OUT
		{
			/*
			if( key==1 )		_GOTO(101)	//	TBD//Y
			else if( key==2 )	_GOTO(1)	//	Y
			else if( key==4 )	_GOTO(0)	//	N
			else if( key==8 )	_GOTO(5)	//	Off
		
			_disp_temp = 1;
			i = disp_status_loop_host_Out(key);
			if( i==1 )
				_key_blink = 1;
			*/
			_GOTO(151);
		}
		else if( _dsCount == 15 )			//	N/Out
		{
			if( key==VK_NAN )		_GOTO(154)	//	To OUT
			else if( key==VK_OUT )	{ _GOTO(151); }	//	
			else if( key==VK_SET ) _GOTO(152)		//	MODE	
			else if( key==VK_ROOM )	_GOTO(101)	//	REMOTE
			else if( key==VK_DN )	_DN
			else if( key==VK_UP )	_UP				
			_disp_temp = 1;
			i = disp_status_loop_host_N(key);
			if( i==1 )
				_key_blink = 1;
		}
		else if( _dsCount == 151 )			//	OUT/Nan
		{
			//uiInfo.tSetup = 20;

			if( key==VK_NAN )		_GOTO(0)	//	To Nan	
			else if( key==VK_OUT )	{ _NOT_KEY_ }	//	
			else if( key==VK_SET )	{ _NOT_KEY_}	//	MODE
			else if( key==VK_ROOM )	_GOTO(101)	//	REMOTE
			else if( key==VK_DN )	{ _NOT_DEF_; }	//	DN
			else if( key==VK_UP )	{ _NOT_DEF_; }	//	UP
			_disp_temp = 1;
			i = disp_status_loop_host_N2OUT(key);
			if( i==1 )
				_key_blink = 1;
		}
		else if( _dsCount == 152 )			//	MODE_1
		{
			if(uiInfo.cntlMode == 0 )	
			{
				//	if LOCAL, skip
				_GOTO(0/*153*/);
				return;
			}
			//	온수온도설정 @890 LINE
			__s = 2;
			_dsCount = 0;
		}
		else if( _dsCount == 153 )			//	MODE_2
		{
			if(uiInfo.cntlMode == 0 )	
			{
				//	if LOCAL, skip
				_GOTO(154);
				return;
			}
			//	난방온도설정
			__s = 1;
			_dsCount = 0;
		}
		else if( _dsCount == 154 )			//	MODE_4
		{
			//	예약
			if( key==VK_NAN )		_GOTO(155)	//	To Nan	
			else if( key==VK_OUT )	{ _GOTO(151) }	//	
			else if( key==VK_SET )	_GOTO(155)	//	MODE_5
			else if( key==VK_ROOM )	_GOTO(101)	//	REMOTE
			else if( key==VK_DN )	_DN
			else if( key==VK_UP )	_UP
//			_disp_temp = 1;
			i = disp_status_loop_host_Y(key);
			if( i==1 )
				_key_blink = 1;
		}
		else if( _dsCount == 155 )			//	MODE_5
		{
			//	타이머
			if( key==VK_NAN )	_GOTO(0)	//	To Nan	
			else if( key==VK_OUT )	{ _GOTO(151) }	//	
			else if( key==VK_SET )	_GOTO(0)	//	To Nan
			else if( key==VK_ROOM )	_GOTO(101)	//	REMOTE
			else if( key==VK_DN )	_DN
			else if( key==VK_UP )	_UP
//			_disp_temp = 1;
			i = disp_status_loop_host_B(key);
			if( i==1 )
				_key_blink = 1;
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
		else if( _dsCount == 45 )			//	OFF
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
			_disp_temp = 1;
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
			UI_DISP_2Digit(_boiler_water_heat);
			LCD_BIT_SET(bT12);
			lcd_disp_info_shower(0x08, 0);
			_dsCount = 1;
			_dsPrev = 0xff;
			uiInfo._t = _boiler_water_heat;
			
			_key_blink = 1;
		}
		else if( _dsCount == 251 )
		{
EXIT_1_MAIN:
			__s = 0;
			if( _boiler_water_heat != uiInfo._t )
			{
				//	if boiler changed, write to file
				file_update2(0);
			}
		}
		else if( _dsCount == 1 )
		{			
			if( key==VK_NAN )
			{
				_GOTO(0)	//	To Nan	
				goto EXIT_1_MAIN;
			}
			else if( key==VK_OUT )	
			{ 
				_GOTO(151) 
				goto EXIT_1_MAIN;
			}
			else if( key==VK_SET )	
			{
				_GOTO(0)	//	MODE_2
				goto EXIT_1_MAIN;
			}
			else if( key==VK_ROOM )	
			{
				_GOTO(1)	//	REMOTE
				goto EXIT_1_MAIN;
			}
			else if( key==VK_DN )	_DN
			else if( key==VK_UP )	_UP
			
			i = _boiler_water_heat;
			if( uiInfo.enc != 0 )
			{
				ENC_MOVE_0(45,85,5);
				_boiler_water_heat = i;
			}
			if( _dsPrev != i )
			{
				_dsPrev = i;
				UI_DISP_2Digit(i);
			}
			if( _backup_backlight2 == 0 )
			{
				_GOTO(0);
				goto EXIT_1_MAIN;
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
			UI_DISP_2Digit(_boiler_water_shower);
			LCD_BIT_SET(bT12);
			lcd_disp_info_shower(0x80, 0);
			_dsCount = 1;
			_dsPrev = 0xff;
			uiInfo._t = _boiler_water_shower;
		}
		else if( _dsCount == 251 )
		{
EXIT_2_MAIN:
			__s = 0;
			if( _boiler_water_shower != uiInfo._t )
			{
				//	if boiler changed, write to file
				file_update2(0);
			}
		}
		else if( _dsCount == 1 )
		{			
			if( key==VK_NAN )
			{
				_GOTO(0)	//	To Nan	
				goto EXIT_2_MAIN;
			}
			else if( key==VK_OUT )	
			{ 
				_GOTO(151)	
				goto EXIT_2_MAIN;
			}	//	
			else if( key==VK_SET )	
			{
				_GOTO(0/*153*/)	//	MODE_2
				goto EXIT_2_MAIN;
			}
			else if( key==VK_ROOM )	
			{
				_GOTO(1)	//	REMOTE
				goto EXIT_2_MAIN;
			}
			else if( key==VK_DN )	_DN
			else if( key==VK_UP )	_UP
			/*
			 *	Check TimeOut
			 */
			i = _boiler_water_shower;
			if( uiInfo.enc != 0 )
			{
				ENC_MOVE_0(35,60,5);
				_boiler_water_shower = i;
			}
			if( _dsPrev != i )
			{
				_dsPrev = i;
				UI_DISP_2Digit(i);
			}
/*		
			if( _key_min == KEY_BOILER_FADE )
			{
				//	timer expire
				EXIT_HOST(0);
			}
*/
		}
	}
	else if( __s == 4 )
	{
		if( key == KEY_PLUS )	{uiInfo.enc = ENC_UP;}
		else if( key == KEY_MINUS )	{uiInfo.enc = ENC_DN;}
		
		disp_backlight(0);
				
		if( key == KEY_ROOM || key == KEY_YB || key == KEY_NO || key == KEY_ONOFF )
		{
			file_update2(0);
			EXIT_HOST(0);
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
	else if( __s == 101 )// remote
	{
		if( _dsCount == 0 )
		{
			lcd_clear(0);
			_remote = 1;
	
			j = uiInfo.cnt + uiInfo.cnt_sub;
			//	2016.0909
			j = __rc_max;
			if( j == 0 )	j = 1;
			__sRoom = (uiInfo.id_rc + 1) % j;
_OneMore2:			
			if( packet_buf[__sRoom] == 10 )
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
			//	backup
			//if( uiInfo.tempSetup[__sRoom] != 10 )
				uiInfo.remote_t[__sRoom] = uiInfo.tempSetup[__sRoom];
			
			lcd_clear_rid();
			lcd_blink_itemRoom(__sRoom, 1);
			disp_status_remote_message(REMOTE_MODE); //모드 변경
			_dsCount = 1;
			_subRemote = 1;
		}
		else if( _dsCount == 1 )//remote 첫화면
		{
			if ( key == VK_UP)		{	uiInfo.enc = ENC_DN;			}
			else if ( key == VK_DN) {	uiInfo.enc = ENC_UP;			}
			
			j = __sRoom;
			if( REMOTE_MODEi(j) == 0x01 )		{	_subRemote = 1; disp_status_loop_remote_N(j);	}
			else if( REMOTE_MODEi(j) == 0x08 )	{	_subRemote = 8;	disp_status_loop_remote_Y(j);	}
			else if( REMOTE_MODEi(j) == 0x10 )	{	_subRemote = 10; disp_status_loop_remote_B(j);	}
			else if( REMOTE_MODEi(j) == 0x04 )	{	_subRemote = 4; disp_status_loop_remote_J(j);	}
			else if( REMOTE_MODEi(j) == 0x02 )	{	_subRemote = 2; disp_status_loop_remote_O(j);	}
				
			if (_subRemote == 1) // remote 난방  
			{
				if( key == VK_ROOM )	{	_dsCount = 2;				}
				else if( key == VK_NAN )
				{
					lcd_clear(0);
					REMOTE_MODEi(j) = 0x08;
					disp_status_remote_message(8);
				}
				else if( key == VK_OUT )
				{
					lcd_clear(0);
					//uiInfo.tempSetup[j] = 20;
					REMOTE_MODEi(j) = 0x02;
					disp_status_remote_message(2);
				}
				else if( key == VK_SET )	
				{
					goto _RemoteExit;					
					/*
					lcd_clear(0);
					i = uiInfo.remote_mode[j];
					if( i == 0x04 )	{	REMOTE_MODE = 0x01;		}
					else			{	REMOTE_MODE = 0x04;		}
					disp_status_remote_message(REMOTE_MODE);
					*/
				}
			}
			else if (_subRemote == 8) // remote 예약
			{
				if( key == VK_ROOM )	{	_dsCount = 2;		}
				else if( key == VK_NAN )
				{
					_dsPrev = 0xff;
					lcd_clear(0);
					REMOTE_MODEi(j) = 0x10;
					disp_status_remote_message(REMOTE_MODE);
				}
				else if( key == VK_OUT )
				{
					lcd_clear(0);
					REMOTE_MODEi(j) = 0x02;
					disp_status_remote_message(2);
				}
				else if( key == KEY_ONOFF )		{	goto _RemoteExit;	}
				else if ( key == KEY_PLUS) {}
				else if ( key == KEY_MINUS) {}
			}
			else if (_subRemote == 10) // remote 반복
			{
				if( key == VK_ROOM )	{	_dsCount = 2;		}
				else if( key == VK_NAN )
				{
					_dsPrev = 0xff;
					lcd_clear(0);
					REMOTE_MODEi(j) = 0x01;
					disp_status_remote_message(1);
				}
				else if( key == VK_OUT )
				{
					lcd_clear(0);
					REMOTE_MODEi(j) = 0x02;
					disp_status_remote_message(2);
				}
				else if( key == VK_SET )	{	goto _RemoteExit;	}
				else if ( key == KEY_PLUS) {}
				else if ( key == KEY_MINUS) {}
			}
			else if (_subRemote == 4) // remote 정지
			{				
			}
			else if (_subRemote == 2) // remote 외출
			{
				if( key == VK_ROOM )	{	_dsCount = 2;		}
				else if( key == VK_NAN )
				{
					lcd_clear(0);
					REMOTE_MODEi(j) = 0x01;
					disp_status_remote_message(1);
				}
				else if( key == VK_OUT )
				{
					//uiInfo.tempSetup[j] = uiInfo.remote_t[j];
					//lcd_clear(0);
					//REMOTE_MODEi(j) = 0x01;
					//disp_status_remote_message(1);
				}
				else if( key == VK_SET )	{	goto _RemoteExit;		}
			}
			if( _key_min == KEY_BLINK_FADE ){	goto _RemoteExit;		}
		}
		else if (_dsCount == 2) 
		{
_OneMore:			
			j = 8;
			__sRoom = (__sRoom + 1) % j;
			if( packet_buf[__sRoom] == 10 )	{	goto _OneMore;			}			
			if( __sRoom != 0 ) {	j = __sRoom - 1;		}
			goto _RemoteEntry;
		}
	}
	else if( __s == 200 )//	LONG_1
	{
		if( _dsCount == 0 )
		{
			_dsCount = 1;
			//disp_status_loop_init();
			//	clear 
			lcd_clear(0);
			lcd_blink_clear();
			lcd_clear_btn();
			LCD_BIT_SET(bT7);
			LCD_BIT_SET(bT1);	//	현재온도
			LCD_BIT_SET(bT3);	//	도			
			
//			LCD_BIT_SET(bT1);	//	현재온도
			LCD_BIT_SET(bT4);	//	설정온도
			__ui_disp_temp_c(3);//도씨 표시
			
			dr_mode_out = 0;
			_disp_mode = 0x02;
			ui_disp_temp_curr(uiInfo.tCurr);
			ui_disp_temp_setup(20/*uiInfo.tSetup*/);
			_remote_s[0] = __timer100ms;
			_remote_s[1] = 0;
		}
		else if( _dsCount == 1 )
		{
			if( _remote_s[0] != __timer100ms )
			{
				_remote_s[0] = __timer100ms;
				_remote_s[1]++;
				if( _remote_s[1] > 50 )
				{
					//dr_mode_out = 1;
				}
			}
			_disp_temp = 1;		
			if( key == 1 || key == 2 || key == 4 || key == 8 )
			{
				__s = uiInfo.remote_t[0];
				_dsCount = uiInfo.remote_t[1];
				__sUp = 0;
				
				dr_mode_out = 1;
			}
			/*
			dr_mode_out = 0;
			
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
			*/
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
