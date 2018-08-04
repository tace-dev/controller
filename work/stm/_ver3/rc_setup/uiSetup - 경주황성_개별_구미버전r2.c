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
	uiInfo.cnt_sub = 0;
	uiInfo.opMode = 1;		//	0 OnOff, 1 PO
	uiInfo.mode = 1;		//	1 host
	uiInfo.controlMode = 0;	//	0 main, 1 sub
	uiInfo.valve_sub = 0;
	uiInfo.poType = 0;
	uiInfo.tOffset = 100;
	uiInfo.tempOffset = 100;
	uiInfo.lpmType = 1;		//	8LPM
	uiInfo.lpmType_sub = 0;
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
	case 1:
		uiInfo.cnt = 4;
		uiInfo.valve = 5;
		uiInfo.valve_len[0] = 108;
		uiInfo.valve_len[1] = 90;
		uiInfo.valve_len[2] = 43;
		uiInfo.valve_len[3] = 86;
		uiInfo.valve_len[4] = 82;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		break;
		
	case 2:
		uiInfo.cnt = 4;
		uiInfo.valve = 5;
		uiInfo.valve_len[0] = 110;
		uiInfo.valve_len[1] = 85;
		uiInfo.valve_len[2] = 43;
		uiInfo.valve_len[3] = 96;
		uiInfo.valve_len[4] = 76;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		break;

	case 3:
		uiInfo.cnt = 4;
		uiInfo.valve = 5;
		uiInfo.valve_len[0] = 105;
		uiInfo.valve_len[1] = 72;
		uiInfo.valve_len[2] = 44;
		uiInfo.valve_len[3] = 76;
		uiInfo.valve_len[4] = 92;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		break;

	case 4:
		uiInfo.cnt = 4;
		uiInfo.valve = 6;
		uiInfo.valve_len[0] = 71;
		uiInfo.valve_len[1] = 91;
		uiInfo.valve_len[2] = 93;
		uiInfo.valve_len[3] = 46;
		uiInfo.valve_len[4] = 104;
		uiInfo.valve_len[5] = 81;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 1;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 2;
		uiInfo.valve_rc[4] = 3;
		uiInfo.valve_rc[5] = 4;
		break;

	case 5:
		uiInfo.cnt = 4;
		uiInfo.valve = 5;
		uiInfo.valve_len[0] = 105;
		uiInfo.valve_len[1] = 72;
		uiInfo.valve_len[2] = 44;
		uiInfo.valve_len[3] = 76;
		uiInfo.valve_len[4] = 92;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		break;

	case 6:
		uiInfo.cnt = 3;
		uiInfo.valve = 6;
		uiInfo.valve_len[0] = 77;
		uiInfo.valve_len[1] = 105;
		uiInfo.valve_len[2] = 97;
		uiInfo.valve_len[3] = 91;
		uiInfo.valve_len[4] = 97;
		uiInfo.valve_len[5] = 87;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 2;
		uiInfo.valve_rc[4] = 3;
		uiInfo.valve_rc[5] = 3;
		break;

	case 7:
		uiInfo.controlMode = 1;	//	0 main, 1 sub
		uiInfo.lpmType_sub = 0;	//	sub no house_valve
		uiInfo.cnt_sub = 3;
		uiInfo.valve_sub = 4;
		uiInfo.cnt = 0;
		uiInfo.valve = 0;

		uiInfo.valve_sub_len[0] = 95;
		uiInfo.valve_sub_len[1] = 71;
		uiInfo.valve_sub_len[2] = 95;
		uiInfo.valve_sub_len[3] = 62;
		uiInfo.valve_sub_rc[0] = 1;
		uiInfo.valve_sub_rc[1] = 1;
		uiInfo.valve_sub_rc[2] = 2;
		uiInfo.valve_sub_rc[3] = 3;
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
		lcd_disp_n(0, 8);
		lcd_disp_n(1, 4);
		lcd_disp_n(3, 1);
		break;
	case 2:
		lcd_disp_n(0, 8);
		lcd_disp_n(1, 4);
		lcd_disp_n(3, 2);
		break;
	case 3:
		lcd_disp_n(0, 8);
		lcd_disp_n(1, 4);
		lcd_disp_n(3, 3);
		break;
		
	case 4:
		lcd_disp_n(0, 1);
		lcd_disp_n(1, 0);
		lcd_disp_n(2, 1);
		break;
	case 5:
		lcd_disp_n(0, 1);
		lcd_disp_n(1, 0);
		lcd_disp_n(2, 2);
		break;
		
	case 6:
		char_ext_h();
		lcd_disp_n(1, 2);
		break;
	case 7:
		char_ext_h();
		lcd_disp_n(1, 2);
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
		if( i==0 )	i = 7;
		if( i>7 )	i = 1;
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


