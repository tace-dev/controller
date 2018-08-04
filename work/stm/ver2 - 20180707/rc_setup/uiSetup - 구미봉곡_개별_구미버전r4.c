//
#include "stdafx.h"
#include "uiDef.h"

uint8_t	_uiSetup = 1;
uint8_t	_uiSetupPrev = 0xff;

#define LEN2(i)		((i/2))

extern uint8_t	_boiler_type;

void	_ui_setup_info(uint8_t id)
{
	uint8_t	i;
	uiInfo.opMode = 1;		//	0 OnOff, 1 PO
	uiInfo.mode = 1;		//	1 host
	uiInfo.controlMode = 0;	//	0 main, 1 sub
	uiInfo.cnt_sub = 0;
	uiInfo.valve_sub = 0;
	uiInfo.lpmType_sub = 0;
	uiInfo.poType = 0;
	uiInfo.tOffset = 100;
	uiInfo.tempOffset = 100;
	uiInfo.lpmType = 1;		//	8LPM
	uiInfo.subRCLock = 0;
	uiInfo.cntlMode = 1;	//	0 local, 1 each
	/*
		2015.9.22
	 */
	/*
	uiInfo.plc = 0;
		if( uiInfo.plc == 0 )
		{
			_boiler_type = 0;
		}
		else
		{
			_boiler_type = 1;
			uiInfo.plc--;
		}				 
	*/
_boiler_type = 0;		//	0 normal, 1 plc
uiInfo.plc = 0;

uiInfo.houseCapa = 100;		//100 default for each mode;

	for( i=0; i<8; i++ )
	{
		uiInfo.valve_len[i] = 0;
		uiInfo.valve_rc[i] = 0;
		uiInfo.valve_sub_len[i] = 0;
		uiInfo.valve_sub_rc[i] = 0;
	}
	/*
		2015.10.31 for boiler/homenet
		구미현장(2015.11)은 아래와 같은 코드로 동작함
		단, 그 이후 현장에 대해서는 최상위 비트 처리를 다르게 함
	 */
	/* 
	 */
	//	if boiler exist 
	uiInfo.valve_len[7] = 0x80;
	/*
	 */
	//	if homenet exist 
	uiInfo.valve_len[7] = 0x40;
	/*
	//	len exist
	uiInfo.valve_len[7] = (len)/4;
	 */	
	switch( id )
	{
	case 1:		//	76
		uiInfo.cnt = 4;
		uiInfo.valve = 5;
		uiInfo.valve_len[0] = 65;
		uiInfo.valve_len[1] = 53;
		uiInfo.valve_len[2] = 40;
		uiInfo.valve_len[3] = 64;
		uiInfo.valve_len[4] = 58;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		break;
		
	case 2:
		uiInfo.cnt = 4;
		uiInfo.valve = 5;
		uiInfo.valve_len[0] = 88;
		uiInfo.valve_len[1] = 57;
		uiInfo.valve_len[2] = 42;
		uiInfo.valve_len[3] = 77;
		uiInfo.valve_len[4] = 67;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		break;

	case 3:		//	84A
		uiInfo.cnt = 4;
		uiInfo.valve = 5;
		uiInfo.valve_len[0] = 72;
		uiInfo.valve_len[1] = 61;
		uiInfo.valve_len[2] = 43;
		uiInfo.valve_len[3] = 70;
		uiInfo.valve_len[4] = 60;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		break;

	case 4:
		uiInfo.cnt = 4;
		uiInfo.valve = 5;
		uiInfo.valve_len[0] = 103;
		uiInfo.valve_len[1] = 66;
		uiInfo.valve_len[2] = 48;
		uiInfo.valve_len[3] = 91;
		uiInfo.valve_len[4] = 64;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		break;

	case 5:		//	84B
		uiInfo.cnt = 4;
		uiInfo.valve = 5;
		uiInfo.valve_len[0] = 67;
		uiInfo.valve_len[1] = 66;
		uiInfo.valve_len[2] = 44;
		uiInfo.valve_len[3] = 46;
		uiInfo.valve_len[4] = 77;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		break;

	case 6:
		uiInfo.cnt = 4;
		uiInfo.valve = 5;
		uiInfo.valve_len[0] = 87;
		uiInfo.valve_len[1] = 70;
		uiInfo.valve_len[2] = 48;
		uiInfo.valve_len[3] = 93;
		uiInfo.valve_len[4] = 65;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 2;
		uiInfo.valve_rc[4] = 3;
		break;

	case 7:		//	84Ce
		uiInfo.cnt = 4;
		uiInfo.valve = 5;
		uiInfo.valve_len[0] = 103;
		uiInfo.valve_len[1] = 65;
		uiInfo.valve_len[2] = 45;
		uiInfo.valve_len[3] = 90;
		uiInfo.valve_len[4] = 67;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		break;

	case 8:		//	104
		uiInfo.cnt = 5;
		uiInfo.valve = 6;
		uiInfo.valve_len[0] = 74;
		uiInfo.valve_len[1] = 72;
		uiInfo.valve_len[2] = 48;
		uiInfo.valve_len[3] = 71;
		uiInfo.valve_len[4] = 49;
		uiInfo.valve_len[5] = 58;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		uiInfo.valve_rc[5] = 5;
		break;

	case 9:		//	104e
		uiInfo.cnt = 5;
		uiInfo.valve = 6;
		uiInfo.valve_len[0] = 106;
		uiInfo.valve_len[1] = 73;
		uiInfo.valve_len[2] = 48;
		uiInfo.valve_len[3] = 95;
		uiInfo.valve_len[4] = 68;
		uiInfo.valve_len[5] = 62;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		uiInfo.valve_rc[5] = 5;
		break;
		

	case 10:		//	125
		uiInfo.cnt = 5;
		uiInfo.valve = 6;
		uiInfo.valve_len[0] = 86;
		uiInfo.valve_len[1] = 82;
		uiInfo.valve_len[2] = 62;
		uiInfo.valve_len[3] = 61;
		uiInfo.valve_len[4] = 80;
		uiInfo.valve_len[5] = 69;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		uiInfo.valve_rc[5] = 5;
		break;

	case 11:		//	125e
		uiInfo.cnt = 5;
		uiInfo.valve = 6;
		uiInfo.valve_len[0] = 115;
		uiInfo.valve_len[1] = 85;
		uiInfo.valve_len[2] = 65;
		uiInfo.valve_len[3] = 82;
		uiInfo.valve_len[4] = 99;
		uiInfo.valve_len[5] = 88;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		uiInfo.valve_rc[5] = 5;
		break;		
		

	case 12:		//	90 // 경로당, 91 경로당 서브제어기
		uiInfo.cnt = 2;
		uiInfo.valve = 5;
		uiInfo.valve_len[0] = 94;
		uiInfo.valve_len[1] = 81;
		uiInfo.valve_len[2] = 88;
		uiInfo.valve_len[3] = 87;
		uiInfo.valve_len[4] = 79;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 1;
		uiInfo.valve_rc[2] = 1;
		uiInfo.valve_rc[3] = 1;
		uiInfo.valve_rc[4] = 2;
		break;

	case 13:		//	91
		//	sub
		uiInfo.controlMode = 1;		//	0 main, 1 sub
		uiInfo.lpmType_sub = 0;		//	sub no house_valve
		uiInfo.cnt_sub = 3;
		uiInfo.valve_sub = 5;
		uiInfo.cnt = 0;
		uiInfo.valve = 0;

		uiInfo.valve_sub_len[0] = 114;
		uiInfo.valve_sub_len[1] = 100;
		uiInfo.valve_sub_len[2] = 89;
		uiInfo.valve_sub_len[3] = 92;
		uiInfo.valve_sub_len[4] = 29;
		uiInfo.valve_sub_rc[0] = 1;
		uiInfo.valve_sub_rc[1] = 1;
		uiInfo.valve_sub_rc[2] = 2;
		uiInfo.valve_sub_rc[3] = 2;
		uiInfo.valve_sub_rc[4] = 3;
		break;		
/*		
*/		
	}
}

void	char_ext_h(void)
{
	LCD_BIT_SET(b1B);
	LCD_BIT_SET(b1C);
	LCD_BIT_SET(b1E);
	LCD_BIT_SET(b1F);
	LCD_BIT_SET(b1G);
}

void	char_e3(void)
{
	LCD_BIT_SET(b3A);
	LCD_BIT_SET(b3D);
	LCD_BIT_SET(b3E);
	LCD_BIT_SET(b3F);
	LCD_BIT_SET(b3G);
}

void	char_e4(void)
{
	LCD_BIT_SET(b4A);
	LCD_BIT_SET(b4D);
	LCD_BIT_SET(b4E);
	LCD_BIT_SET(b4F);
	LCD_BIT_SET(b4G);
}

void	char_eS(void)
{
	LCD_BIT_SET(b3A);
	LCD_BIT_SET(b3D);
	LCD_BIT_SET(b3C);
	LCD_BIT_SET(b3F);
	LCD_BIT_SET(b3G);
}

void	_ui_setup_menu_disp(uint8_t id)
{
	lcd_clear(0);
	switch( id )
	{
	case 1:
		lcd_disp_n(0, 7);
		lcd_disp_n(1, 6);
		break;
	case 2:
		lcd_disp_n(0, 7);
		lcd_disp_n(1, 6);
		char_e3();
		break;
		
	case 3:
		lcd_disp_n(0, 8);
		lcd_disp_n(1, 4);
		lcd_disp_n(2, 1);
		break;
		
	case 4:
		lcd_disp_n(0, 8);
		lcd_disp_n(1, 4);
		lcd_disp_n(2, 1);
		char_e4();
		break;
		
	case 5:
		lcd_disp_n(0, 8);
		lcd_disp_n(1, 4);
		lcd_disp_n(2, 2);
		break;


	case 6:
		lcd_disp_n(0, 8);
		lcd_disp_n(1, 4);
		lcd_disp_n(2, 2);
		char_e4();
		break;
		
	case 7:
		lcd_disp_n(0, 8);
		lcd_disp_n(1, 4);
		lcd_disp_n(2, 3);
		char_e4();
		break;

	case 8:
		lcd_disp_n(0, 1);
		lcd_disp_n(1, 0);
		lcd_disp_n(2, 4);
		break;
		
	case 9:
		lcd_disp_n(0, 1);
		lcd_disp_n(1, 0);
		lcd_disp_n(2, 4);
		char_e4();
		break;

	case 10:
		lcd_disp_n(0, 1);
		lcd_disp_n(1, 2);
		lcd_disp_n(2, 5);
		break;
		
	case 11:
		lcd_disp_n(0, 1);
		lcd_disp_n(1, 2);
		lcd_disp_n(2, 5);
		char_e4();
		break;

	case 12:	//	90 경로당/ 91 sub
		char_ext_h();
		lcd_disp_n(1, 0);
		break;
		
	case 13:
		char_ext_h();
		lcd_disp_n(1, 0);
		char_eS();
		break;


	}
}

void	_ui_setup_menu(void)
{
	uint8_t	i;
	i = _uiSetup;
	if( uiInfo.enc != 0 )
	{
		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
		if( i==0 )	i = 13;
		if( i>13 )	i = 1;
		_uiSetup = i;
	}
	if( _dsPrev != i )
	{
		_dsPrev = i;
		_ui_setup_menu_disp(i);
//		UPDATE_BIT(BIT_TSETUP);
	}
}

extern uint8_t	__func_rc_settingCb;
extern void	func_rc_setting(void);

extern uint8_t	__func_rc_timerout;
extern uint8_t	__func_rc_timerout1;
extern uint8_t	__func_rc_timerout2;

extern uint8_t	ui_error;

extern uint8_t	mode_recover;

uint8_t getSettingChange(void);

void	_ui_setup(uint8_t key)
{
	uint8_t	i = 0;
	if( __s == 0 )
	{
		if( _dsCount == 0 )
		{
			uiInfo.id = 1;
			_dsCount = 1;
			_ui_setup_menu_disp(_uiSetup);
		}
		else if( _dsCount == 1 )
		{
			_ui_setup_menu();
			if( key == 3 )
			{
				//	error auto recover
				mode_recover = 0;
				_ui_setup_info(_uiSetup);
				func_rc_setting();
				__func_rc_timerout = 10;
				__func_rc_timerout1 = 0;
				__func_rc_timerout2 = __timer1s;
				_dsCount = 1;
				__s = 1;
				if( _uiSetup != _uiSetupPrev )
				{
					_uiSetupPrev = _uiSetup;
					FW_SETUP_LAST(_uiSetup);
				}
			}
		}
	}	
	else if( __s == 1 )
	{
		if( (_t20ms%10) != 0 )
		{
			_dsPrev = 0;
			return;
		}
		
		if( _dsPrev != 0 )
			return;
	
		_dsCount++;
		_dsPrev = 1;
		lcd_clear(0);
		for( i=0; i<4; i++ )
			lcd_disp_n(i, _dsCount%10);
	
		if( __func_rc_settingCb == 1 && _dsCount >= 30 && getSettingChange() == 0 )
		{
			__s = 0;
			_dsCount = 0;
//			STATUS_NEXT(next);
			return;
		}
		if( __timer1s != __func_rc_timerout2 )
		{
			if( __func_rc_timerout1 == 0 )
			{
				__func_rc_timerout2 = __timer1s;
				__func_rc_timerout1 = 1;
				__func_rc_timerout--;
				if( __func_rc_timerout == 0 )
				{
						/*	main cntl error 11~18, 19 is new
						*/
						ui_error = 19;
						_ds = 97;
						_dsCount = 0;
				}
			}
		}
		else
			__func_rc_timerout1 = 0;
	}
}


