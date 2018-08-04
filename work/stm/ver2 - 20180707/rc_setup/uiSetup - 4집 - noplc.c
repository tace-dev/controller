//
#include "stdafx.h"
#include "uiDef.h"

uint8_t	_uiSetup = 1;
uint8_t	_uiSetupPrev = 0xff;

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
_boiler_type = 0;		//	0 normal, 1 plc
uiInfo.plc = 0;
	
	for( i=0; i<8; i++ )
	{
		uiInfo.valve_len[i] = 0;
		uiInfo.valve_rc[i] = 0;
		uiInfo.valve_sub_len[i] = 0;
		uiInfo.valve_sub_rc[i] = 0;
	}
	/*
		2015.10.31 for boiler/homenet
	 */
	/* 
	 */
	//	if boiler exist 
//	uiInfo.valve_len[7] = 0x80;
	/*
	 */
	//	if homenet exist 
//	uiInfo.valve_len[7] = 0x40;
	/*
	//	len exist
	uiInfo.valve_len[7] = (len)/4;
	 */	
	/*
	//	len exist2
	 */
	/*
	*/
	uiInfo.valve_len[6] = 0x80;
	uiInfo.valve_len[6] = (100)/2;
	
	switch( id )
	{
	case 1:
		//	84
		uiInfo.cnt = 4;
		uiInfo.valve = 4;
		uiInfo.houseCapa = 200;
		uiInfo.valve_len[0] = 92;
		uiInfo.valve_len[1] = 110;
		uiInfo.valve_len[2] = 97;
		uiInfo.valve_len[3] = 66;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 3;
		uiInfo.valve_rc[3] = 4;
		break;
		
	case 2:
		//	119
		uiInfo.cnt = 5;
		uiInfo.valve = 6;
		uiInfo.houseCapa = 200;
		uiInfo.valve_len[0] = 125;
		uiInfo.valve_len[1] = 68;
		uiInfo.valve_len[2] = 68;
		uiInfo.valve_len[3] = 86;
		uiInfo.valve_len[4] = 88;
		uiInfo.valve_len[5] = 77;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		uiInfo.valve_rc[5] = 5;
		break;

	case 3:
		//	137
		uiInfo.cnt = 5;
		uiInfo.valve = 7;
		uiInfo.houseCapa = 200;
		uiInfo.valve_len[0] = 90;
		uiInfo.valve_len[1] = 83;
		uiInfo.valve_len[2] = 74;
		uiInfo.valve_len[3] = 81;
		uiInfo.valve_len[4] = 93;
		uiInfo.valve_len[5] = 76;
		uiInfo.valve_len[6] = 88;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 1;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 2;
		uiInfo.valve_rc[4] = 3;
		uiInfo.valve_rc[5] = 4;
		uiInfo.valve_rc[6] = 5;
		break;
		
/*		
	case 20:
		//	84T 2
		uiInfo.cnt = 4;
		uiInfo.valve = 5;
		uiInfo.houseCapa = 120;
		uiInfo.valve_len[0] = 96;
		uiInfo.valve_len[1] = 85;
		uiInfo.valve_len[2] = 75;
		uiInfo.valve_len[3] = 74;
		uiInfo.valve_len[4] = 83;
		uiInfo.valve_rc[0] = 2;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 4;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 1;
		break;
*/		
	}
}

void	_ui_setup_menu_disp(uint8_t id)
{
	lcd_clear(0);
	switch( id )
	{
	case 1:
		lcd_disp_n(0, 8);
		lcd_disp_n(1, 4);
		break;
	case 2:
		lcd_disp_n(0, 1);
		lcd_disp_n(1, 1);
		lcd_disp_n(2, 9);
		break;
	case 3:
		lcd_disp_n(0, 1);
		lcd_disp_n(1, 3);
		lcd_disp_n(2, 7);
		break;
		
	}
}

#define CNT		3

void	_ui_setup_menu(void)
{
	uint8_t	i;
	uint8_t	j = 0;
	i = _uiSetup;
	if( uiInfo.enc != 0 )
	{
		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
//		i = (i==2) ? 1 : 2;
		if( i==0 )	i = CNT;
		if( i>CNT )	i = 1;
		_uiSetup = i;
		j = 1;
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


