//
#include "stdafx.h"
#include "uiDef.h"

/*
 *	WOODANG TEST ONLY
 */
//#define _WOODANG_TEST_ONLY_

uint8_t	_uiSetup = 1;
uint8_t	_uiSetupPrev = 0xff;

#define LEN2(i)		((i/2))

extern uint8_t	_boiler_type;
uint8_t		__cntlMode = 0;

void	_ui_setup_info(uint8_t id)
{
	uint8_t	i;
	uiInfo.cnt_sub = 0;
	uiInfo.opMode = 1;		//	0 OnOff, 1 PO
	uiInfo.mode = 1;		//	1 host
	uiInfo.controlMode = 0;	//	0 main, 1 sub
/*
uiInfo.controlMode = 1;
uiInfo.lpmType_sub = 0;
*/
	uiInfo.valve_sub = 0;
	uiInfo.poType = 0;
	uiInfo.tOffset = 100;
	uiInfo.tempOffset = 100;
	uiInfo.lpmType = 1;		//	8LPM
	uiInfo.lpmType_sub = 0;
	uiInfo.subRCLock = 0;
	__cntlMode = uiInfo.cntlMode = 0;	//	0 local, 1 each
	uiInfo.houseCapa = 150;		//100 default for each mode;

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


	for( i=0; i<8; i++ )
	{
		uiInfo.valve_len[i] = 0;
		uiInfo.valve_rc[i] = 0;
		uiInfo.valve_sub_len[i] = 0;
		uiInfo.valve_sub_rc[i] = 0;
	}
	/*
		2015.10.31 for boiler/homenet
		��������(2015.11)�� �Ʒ��� ���� �ڵ�� ������
		��, �� ���� ���忡 ���ؼ��� �ֻ��� ��Ʈ ó���� �ٸ��� ��
	 */
	/* 
	 */
	//	if boiler exist 
	//uiInfo.valve_len[7] |= 0x80;
	/*
	 */
	//	if homenet exist 
	uiInfo.valve_len[7] |= 0x40;
	/*
	//	len exist
	uiInfo.valve_len[7] = (len)/4;
	 */	
	switch( id )
	{
	case 1:
#if defined (_WOODANG_TEST_ONLY_)
		uiInfo.cnt = 4;
		uiInfo.valve = 4;
		uiInfo.valve_len[0] = 150;
		uiInfo.valve_len[1] = 120;
		uiInfo.valve_len[2] = 100;
		uiInfo.valve_len[3] = 80;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 3;
		uiInfo.valve_rc[3] = 4;
#else
		uiInfo.houseCapa = 164;	
		uiInfo.cnt = 5;
		uiInfo.valve = 6;
		uiInfo.valve_len[0] = 150;
		uiInfo.valve_len[1] = 145;
		uiInfo.valve_len[2] = 145;
		uiInfo.valve_len[3] = 140;
		uiInfo.valve_len[4] = 145;
		uiInfo.valve_len[5] = 135;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		uiInfo.valve_rc[5] = 5;
#endif
		break;
	case 2:
		uiInfo.houseCapa = 167;	
		uiInfo.cnt = 4;
		uiInfo.valve = 5;
		uiInfo.valve_len[0] = 150;
		uiInfo.valve_len[1] = 140;
		uiInfo.valve_len[2] = 145;
		uiInfo.valve_len[3] = 135;
		uiInfo.valve_len[4] = 135;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		break;
		
	case 3:
		uiInfo.houseCapa = 165;	
		uiInfo.cnt = 5;
		uiInfo.valve = 6;
		uiInfo.valve_len[0] = 150;
		uiInfo.valve_len[1] = 145;
		uiInfo.valve_len[2] = 145;
		uiInfo.valve_len[3] = 140;
		uiInfo.valve_len[4] = 140;
		uiInfo.valve_len[5] = 135;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		uiInfo.valve_rc[5] = 5;
		break;
	case 4:
		uiInfo.houseCapa = 167;	
		uiInfo.cnt = 4;
		uiInfo.valve = 5;
		uiInfo.valve_len[0] = 150;
		uiInfo.valve_len[1] = 135;
		uiInfo.valve_len[2] = 135;
		uiInfo.valve_len[3] = 140;
		uiInfo.valve_len[4] = 145;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		break;
		
	case 5:
		uiInfo.houseCapa = 167;	
		uiInfo.cnt = 5;
		uiInfo.valve = 6;
		uiInfo.valve_len[0] = 150;
		uiInfo.valve_len[1] = 140;
		uiInfo.valve_len[2] = 145;
		uiInfo.valve_len[3] = 140;
		uiInfo.valve_len[4] = 145;
		uiInfo.valve_len[5] = 135;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		uiInfo.valve_rc[5] = 5;
		break;
	case 6:
		uiInfo.houseCapa = 168;	
		uiInfo.cnt = 5;
		uiInfo.valve = 6;
		uiInfo.valve_len[0] = 150;
		uiInfo.valve_len[1] = 145;
		uiInfo.valve_len[2] = 145;
		uiInfo.valve_len[3] = 140;
		uiInfo.valve_len[4] = 145;
		uiInfo.valve_len[5] = 135;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 3;
		uiInfo.valve_rc[4] = 4;
		uiInfo.valve_rc[5] = 5;
		break;
		
	case 7:
		uiInfo.houseCapa = 185;	
		uiInfo.cnt = 2;
		uiInfo.valve = 4;
		uiInfo.valve_len[0] = 150;
		uiInfo.valve_len[1] = 150;
		uiInfo.valve_len[2] = 140;
		uiInfo.valve_len[3] = 140;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 1;
		uiInfo.valve_rc[2] = 2;
		uiInfo.valve_rc[3] = 2;
		break;
	case 8:
		uiInfo.controlMode = 1;	//	0 main, 1 sub
		uiInfo.lpmType_sub = 0;	//	sub no house_value
		uiInfo.cnt_sub = 4;
		uiInfo.valve_sub = 4;
		uiInfo.houseCapa = 185;	
		uiInfo.cnt = 0;
		uiInfo.valve = 0;
		
		uiInfo.valve_len[0] = 150;
		uiInfo.valve_len[1] = 140;
		uiInfo.valve_len[2] = 145;
		uiInfo.valve_len[3] = 145;
		uiInfo.valve_rc[0] = 1;
		uiInfo.valve_rc[1] = 2;
		uiInfo.valve_rc[2] = 3;
		uiInfo.valve_rc[3] = 4;
		break;
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

void	char_h3(void)
{
	LCD_BIT_SET(b3B);
	LCD_BIT_SET(b3C);
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

void	char_L4(void)
{
	LCD_BIT_SET(b4D);
	LCD_BIT_SET(b4E);
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


void	char_a4(void)
{
	LCD_BIT_SET(b4A);
	LCD_BIT_SET(b4B);
	LCD_BIT_SET(b4C);
	LCD_BIT_SET(b4E);
	LCD_BIT_SET(b4G);
	LCD_BIT_SET(b4F);
}

void	char_b4(void)
{
	LCD_BIT_SET(b4D);
	LCD_BIT_SET(b4C);
	LCD_BIT_SET(b4E);
	LCD_BIT_SET(b4G);
	LCD_BIT_SET(b4F);
}

void	char_c4(void)
{
	LCD_BIT_SET(b4E);
	LCD_BIT_SET(b4G);
	LCD_BIT_SET(b4D);
}

void	char_d4(void)
{
	LCD_BIT_SET(b4D);
	LCD_BIT_SET(b4B);
	LCD_BIT_SET(b4C);
	LCD_BIT_SET(b4E);
	LCD_BIT_SET(b4G);
}

void	_ui_setup_menu_disp(uint8_t id)
{
	lcd_clear(0);
	switch( id )
	{
	case 1:
#if defined (_WOODANG_TEST_ONLY_)
		lcd_disp_n(0, 0);
		lcd_disp_n(1, 0);
#else
		lcd_disp_n(0, 9);
		lcd_disp_n(1, 7);
#endif
		break;
	case 2:
		lcd_disp_n(0, 1);
//		LCD_BIT_SET(b3G);
		lcd_disp_n(2, 1);
		break;
		
	case 3:
		lcd_disp_n(0, 1);
		lcd_disp_n(2, 1);
		lcd_disp_n(3, 1);
		break;
	case 4:
		lcd_disp_n(0, 1);
		lcd_disp_n(2, 2);
		break;
	case 5:
		lcd_disp_n(0, 1);
		lcd_disp_n(2, 2);
		lcd_disp_n(3, 1);
		break;
	case 6:
		lcd_disp_n(0, 1);
		lcd_disp_n(1, 0);
		lcd_disp_n(2, 4);
		break;
	case 7:
		lcd_disp_n(0, 1);
		lcd_disp_n(1, 3);
		lcd_disp_n(2, 3);
		break;
	case 8:
		lcd_disp_n(0, 1);
		lcd_disp_n(1, 3);
		lcd_disp_n(2, 3);
		lcd_disp_n(3, 5);
		break;
		
	}
}

void	_ui_setup_menu(void)
{
	#define __COUNT	6
	uint8_t	i;
	i = _uiSetup;
	if( uiInfo.enc != 0 )
	{
		i += (uiInfo.enc&0x40)==0 ? -1 : 1;
#if defined (_WOODANG_TEST_ONLY_)
		i = 1;
#else
		if( i==0 )	i = __COUNT;
		if( i>__COUNT )	i = 1;
#endif
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
uint8_t	__delayi = 0;

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
				mode_recover = 1;
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


uint8_t	_ui_writer(uint8_t key)
{
	uint8_t	i = 0;
	if( __s == 0 )
	{
		if( _dsCount == 0 )
		{
			uiInfo.id = 1;
			_dsCount = 1;
//			_ui_setup_menu_disp(_uiSetup);
		}
		else if( _dsCount == 1 )
		{
//			_ui_setup_menu();
//			if( key == 3 )
			{
				//	error auto recover
				mode_recover = 1;
//				_ui_setup_info(_uiSetup);
				func_rc_setting();
				__func_rc_timerout = 10;
				__func_rc_timerout1 = 0;
				__func_rc_timerout2 = __timer1s;
				_dsCount = 1;
				__s = 1;
/*				
				if( _uiSetup != _uiSetupPrev )
				{
					_uiSetupPrev = _uiSetup;
					FW_SETUP_LAST(_uiSetup);
				}
*/
			}
		}
	}
	else if( __s == 10 )
	{
		if( (_t20ms%10) != 0 )
		{
			_dsPrev = 0;
			return 0;
		}
		
		if( _dsPrev != 0 )
			return 0;
	
		_dsCount++;
		_dsPrev = 1;
		lcd_clear(0);
		for( i=0; i<4; i++ )
			lcd_disp_n(i, _dsCount%10);
	
		__delayi--;
		if( __delayi == 0 )
		{
			//i = 1 / __delayi;
			__s = 0;
			_dsCount = 0;
			return 1;
		}
	}
	else if( __s == 1 )
	{
		if( (_t20ms%10) != 0 )
		{
			_dsPrev = 0;
			return 0;
		}
		
		if( _dsPrev != 0 )
			return 0;
	
		_dsCount++;
		_dsPrev = 1;
		lcd_clear(0);
		for( i=0; i<4; i++ )
			lcd_disp_n(i, _dsCount%10);
	
		if( __func_rc_settingCb == 1 && _dsCount >= 30 && getSettingChange() == 0 )
		{
			__delayi = 12;
			__s = 10;
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
	return 0;
}


