#include "stdafx.h"
#include "uiDef.h"
#include "rc_protocol.h"


#define BL_1	3
#define BL_2	7
#define BL_3	11
#define BL_4	15
#define BL_5	22

uint8_t	__s = 0;
uint8_t	__sUp = 0;
uint8_t	__sDn = 0;
uint8_t	__sInfo = 2;
uint8_t	__sRoom = 0;
UIINFO	uiInfo;
UIINFO_SET	uiInfoSet;

uint8_t	_updateTimer = 0;
uint8_t	_updateBit = 0;
uint8_t	_updateCount = 10;

uint8_t	_disp_temp = 1;
//
uint8_t	_backup_backlight = 0;
uint8_t	_backup_backlight2 = 0;

uint8_t start_flag = 1;

extern uint8_t	error;
extern uint8_t	error_type;
extern uint8_t	ui_error;
extern uint8_t	ui_error_type;

extern void	file_write(uint8_t addr, uint8_t data);
extern uint8_t	file_read(uint8_t addr);
extern void	func_rc_recover(uint8_t i);

extern uint8_t	_backlight;
extern uint8_t _rcLED;
extern uint8_t getHexToBin(uint8_t hex, uint8_t idx);

extern void rc_ptc_make_command_packet(uint8_t *buf, uint8_t cmd, uint8_t p1);
extern void func_rc_command(uint8_t com1, uint8_t com2);
extern uint8_t		disp_status_loop_host_Off(uint8_t key);

#define ENC_CODE(i,s)	i = (i + ((uiInfo.enc & 0x40) == 0 ? (s-1) : 1)) % s;
#define UI_SET(a,b)		if( a==0 )	a = b;
#define __DN	{\
		uiInfo.enc = 0x40;\
		key = 0;\
		goto EncEntry;\
		}
#define __UP	{\
		uiInfo.enc = 0x01;\
		key = 0;\
		goto EncEntry;\
		}

void	copy_infoSet(void);
void	copy_info(uint8_t next);

uint8_t	error_display_mode = 0;
uint8_t	error_display_status = 0;

#if defined (_RC_DW_)
GPIO_TypeDef	*_led_key_port = GPIOD;
uint8_t	_led_key_pin = GPIO_Pin_7;
uint8_t	_led_key_status;
#endif

void lcd_disp_rid_hw(uint8_t id, uint8_t t) 
{
#if defined (_RC_DW_)
	_led_key_status = t==0 ? 1 : 0;
#endif
	if( t==0 )
		D_IO_HIGH(GPIOD, GPIO_Pin_7);
	else
		D_IO_LOW(GPIOD, GPIO_Pin_7);
		
}

void	error_display(uint8_t type, uint8_t err)
{
	if( error_display_mode == 1 )
		return;
		
	ui_error = err;
	ui_error_type = type;
	
	error_display_mode = 1;
	error_display_status = 1;
}

void	ui_Open(void)
{
	uint8_t	i;
/*	
	uiInfo.id_rc = 0;
	uiInfo.tCurr = 0x00;	//	25

	uiInfo.cntlMode = 0;	//	0 local, 1 each
	uiInfo.id = 2;
	uiInfo.cnt = 8;
	uiInfo.cnt_sub = 0;
	uiInfo.opMode = 0;
	uiInfo.mode = 0;	//	0 client, 1 host
	
	uiInfo.controlMode = 1;	//	0 main, 1 sub
	uiInfo.valve = 4;		//	valve count
	uiInfo.valve_sub = 0;		//	valve count
	uiInfo.repeat = 5;
	uiInfo.reserve = 24;	//	05 hour
	uiInfo.tSetup = 50;	//	25
	
	uiInfo.poType = 0;		//	0 xl, 1 pb, 2 pe
	uiInfo.houseCapa = 160;	//	70 ~ 200%
	uiInfo.tOffset = 100;	//	-9.5 ~ +9.5
	
	uiInfo.tempOffset = 80;	//	60~100%
	uiInfo.lpmType = 8;			//	lpm
	uiInfo.lpmType_sub = 0;			//	lpm
//	uiInfo.dispMode = 0;		//	disp_mode
	
	for( i=0; i<8; i++ )
	{
		uiInfo.valve_len[i] = 100;
		uiInfo.valve_rc[i] = i;
		uiInfo.tempCurr[i] = 50;
		uiInfo.tempSetup[i] = 50;
		uiInfo.remote_mode[i] = 8;
		uiInfo.remote_time[i] = 24;
		uiInfo.remote_banb[i] = 15;
	}
	
	_boiler_water_shower = 60;
	_boiler_water_heat = 60;
*/

	for( i=0; i<8; i++ )
	{
		uiInfo.remote_time[i] = 4;
		uiInfo.remote_banb[i] = 30;
	}
	
	uiInfo.cntlMode = FW_GET_CNTLMODE;
	uiInfo.id = FW_GET_ID;
	uiInfo.cnt = FW_GET_CNT;
	uiInfo.cnt_sub = FW_GET_CNT_SUB;
	UI_SET(uiInfo.cnt, 8)
	UI_SET(uiInfo.cnt_sub, 8)
	if( uiInfo.cnt >= 8 )	uiInfo.cnt = 8;
	if( uiInfo.cnt_sub >= 8 )	uiInfo.cnt_sub = 8;
	
	uiInfo.opMode = FW_GET_OPMODE;
	uiInfo.mode = FW_GET_MODE;
	
	uiInfo.controlMode = FW_GET_CNT_MODE;
	uiInfo.valve = FW_GET_VALVE;
	uiInfo.valve_sub = FW_GET_VALVE_SUB;
	UI_SET(uiInfo.valve, 8)
	UI_SET(uiInfo.valve_sub, 8)
	if( uiInfo.valve >= 8 )	uiInfo.valve = 8;
	if( uiInfo.valve_sub >= 8 )	uiInfo.valve_sub = 8;
	
	uiInfo.repeat = FW_GET_REPEAT;	
#if defined (_RC_DW_)
	UI_SET(uiInfo.repeat, 30)
#else
	UI_SET(uiInfo.repeat, 10)
#endif
	uiInfo.reserve = FW_GET_RESERVE;	
	UI_SET(uiInfo.reserve, 24)
	uiInfo.tSetup = FW_GET_TSETUP;	
	UI_SET(uiInfo.tSetup, 50)
	uiInfo.poType = FW_GET_POTYPE;	
	uiInfo.houseCapa = FW_GET_HOUSECAPA;
	UI_SET(uiInfo.houseCapa, 160)
	uiInfo.tOffset = FW_GET_TOFFSET;
	UI_SET(uiInfo.tOffset, 100);
		
	uiInfo.tempOffset = FW_GET_TEMPOFFSET;
	UI_SET(uiInfo.tempOffset, 80)
	uiInfo.lpmType = FW_GET_LPM;
	uiInfo.lpmType_sub = FW_GET_LPM_SUB;
//	UI_SET(uiInfo.lpmType, 8)
//	UI_SET(uiInfo.lpmType_sub, 8)
//	if( uiInfo.lpmType >= 8 )	uiInfo.lpmType = 8;
//	if( uiInfo.lpmType_sub >= 8 )	uiInfo.lpmType_sub = 8;
	
	_disp_mode2 = FW_GET_DISPMODE;
	_disp_mode = 0xff;
	
	if (_disp_mode2 == 0x00) {
		__sUp = 5;
	} else if (_disp_mode2 == RC_MODE_RESERVE){
		__sUp = 1;
	} else if (_disp_mode2 == RC_MODE_REPEAT) {
		__sUp = 2;
	} else if (_disp_mode2 == RC_MODE_STOP) {
		__sUp = 5;
	} else if (_disp_mode2 == RC_MODE_OUT) {
		__sUp = 16;
	} else {
		__sUp = 0;
	}
	
	uiInfo.valve_len[0] = FW_GET_VL_1;
	uiInfo.valve_len[1] = FW_GET_VL_2;
	uiInfo.valve_len[2] = FW_GET_VL_3;
	uiInfo.valve_len[3] = FW_GET_VL_4;
	uiInfo.valve_len[4] = FW_GET_VL_5;
	uiInfo.valve_len[5] = FW_GET_VL_6;
	uiInfo.valve_len[6] = FW_GET_VL_7;
	uiInfo.valve_len[7] = FW_GET_VL_8;
	
	uiInfo.valve_rc[0] = FW_GET_VRC_1;
	uiInfo.valve_rc[1] = FW_GET_VRC_2;
	uiInfo.valve_rc[2] = FW_GET_VRC_3;
	uiInfo.valve_rc[3] = FW_GET_VRC_4;
	uiInfo.valve_rc[4] = FW_GET_VRC_5;
	uiInfo.valve_rc[5] = FW_GET_VRC_6;
	uiInfo.valve_rc[6] = FW_GET_VRC_7;
	uiInfo.valve_rc[7] = FW_GET_VRC_8;
	uiInfo.valve_rc[0] = 1;
	
	uiInfo.valve_sub_len[0] = FW_GET_VL_1_SUB;
	uiInfo.valve_sub_len[1] = FW_GET_VL_2_SUB;
	uiInfo.valve_sub_len[2] = FW_GET_VL_3_SUB;
	uiInfo.valve_sub_len[3] = FW_GET_VL_4_SUB;
	uiInfo.valve_sub_len[4] = FW_GET_VL_5_SUB;
	uiInfo.valve_sub_len[5] = FW_GET_VL_6_SUB;
	uiInfo.valve_sub_len[6] = FW_GET_VL_7_SUB;
	uiInfo.valve_sub_len[7] = FW_GET_VL_8_SUB;
	
	uiInfo.valve_sub_rc[0] = FW_GET_VRC_1_SUB;
	uiInfo.valve_sub_rc[1] = FW_GET_VRC_2_SUB;
	uiInfo.valve_sub_rc[2] = FW_GET_VRC_3_SUB;
	uiInfo.valve_sub_rc[3] = FW_GET_VRC_4_SUB;
	uiInfo.valve_sub_rc[4] = FW_GET_VRC_5_SUB;
	uiInfo.valve_sub_rc[5] = FW_GET_VRC_6_SUB;
	uiInfo.valve_sub_rc[6] = FW_GET_VRC_7_SUB;
	uiInfo.valve_sub_rc[7] = FW_GET_VRC_8_SUB;
	
	_boiler_water_shower = FW_GET_B_SHOWER;
	_boiler_water_shower = (_boiler_water_shower/5)*5;
	UI_SET(_boiler_water_shower, 50)
	_boiler_water_heat = FW_GET_B_HEAT;
	_boiler_water_heat = (_boiler_water_heat/5)*5;
	UI_SET(_boiler_water_heat, 70)
	_backlight = FW_GET_BACKLIGHT;
#if defined (_RC_DW_)
	UI_SET(_backlight, BL_2)
#else
	UI_SET(_backlight, 2)
#endif
	uiInfo.plc = FW_GET_PLC;
	//	display rid@rc_protocol.c
	_backup_backlight = 0;
}
/*
void	ui_reOpen(void)
{
	uiInfo.cntlMode = FW_GET_CNTLMODE;
	uiInfo.mode = FW_GET_MODE;
	uiInfo.id = FW_GET_ID;
}
*/
CONST	uint8_t	_keypwMaster[6] = { 4, 3, 4, 3, 1, 1 };
CONST	uint8_t	_keypwMaster2[6] = { 4, 3, 4, 3, 1, 2 };
CONST	uint8_t	_keypwClient[6] = { 4, 3, 4, 3, 1, 3 };
//CONST	uint8_t	_keypwDefault[6] = { 4, 3, 4, 3, 1, 4 };
uint8_t	_keypwIndexMaster = 0;
uint8_t	_keypwIndexMaster2 = 0;
uint8_t	_keypwIndexClient = 0;
//uint8_t	_keypwIndexDefault = 0;

void	file_update2(uint8_t i)
{
	FW_TOFFSET(uiInfo.tOffset);
	if( i==0 )	FW_BACKLIGHT(_backlight);
}

#define FW_VALVE_INFOS	\
						FW_VL_1(uiInfo.valve_len[0]);\
						FW_VL_2(uiInfo.valve_len[1]);\
						FW_VL_3(uiInfo.valve_len[2]);\
						FW_VL_4(uiInfo.valve_len[3]);\
						FW_VL_5(uiInfo.valve_len[4]);\
						FW_VL_6(uiInfo.valve_len[5]);\
						FW_VL_7(uiInfo.valve_len[6]);\
						FW_VL_8(uiInfo.valve_len[7]);\
						FW_VL_1_SUB(uiInfo.valve_sub_len[0]);\
						FW_VL_2_SUB(uiInfo.valve_sub_len[1]);\
						FW_VL_3_SUB(uiInfo.valve_sub_len[2]);\
						FW_VL_4_SUB(uiInfo.valve_sub_len[3]);\
						FW_VL_5_SUB(uiInfo.valve_sub_len[4]);\
						FW_VL_6_SUB(uiInfo.valve_sub_len[5]);\
						FW_VL_7_SUB(uiInfo.valve_sub_len[6]);\
						FW_VL_8_SUB(uiInfo.valve_sub_len[7]);
						
#define FW_VALVE_RCINFOS	\
						FW_VRC_1(uiInfo.valve_rc[0]);\
						FW_VRC_2(uiInfo.valve_rc[1]);\
						FW_VRC_3(uiInfo.valve_rc[2]);\
						FW_VRC_4(uiInfo.valve_rc[3]);\
						FW_VRC_5(uiInfo.valve_rc[4]);\
						FW_VRC_6(uiInfo.valve_rc[5]);\
						FW_VRC_7(uiInfo.valve_rc[6]);\
						FW_VRC_8(uiInfo.valve_rc[7]);\
						FW_VRC_1_SUB(uiInfo.valve_sub_rc[0]);\
						FW_VRC_2_SUB(uiInfo.valve_sub_rc[1]);\
						FW_VRC_3_SUB(uiInfo.valve_sub_rc[2]);\
						FW_VRC_4_SUB(uiInfo.valve_sub_rc[3]);\
						FW_VRC_5_SUB(uiInfo.valve_sub_rc[4]);\
						FW_VRC_6_SUB(uiInfo.valve_sub_rc[5]);\
						FW_VRC_7_SUB(uiInfo.valve_sub_rc[6]);\
						FW_VRC_8_SUB(uiInfo.valve_sub_rc[7]);
						
void	file_update(void)
{
	FW_CNTLMODE(uiInfo.cntlMode);
	FW_MODE(uiInfo.mode);
	FW_ID(uiInfo.id);
	FW_CNT(uiInfo.cnt);
	FW_CNT_SUB(uiInfo.cnt_sub);
	FW_OPMODE(uiInfo.opMode);
	
	FW_CNT_MODE(uiInfo.controlMode);
	FW_VALVE(uiInfo.valve);
	FW_VALVE_SUB(uiInfo.valve_sub);
	FW_REPEAT(uiInfo.repeat);
	FW_RESERVE(uiInfo.reserve);
	FW_TSETUP(uiInfo.tSetup);
	
	FW_POTYPE(uiInfo.poType);
	FW_HOUSECAPA(uiInfo.houseCapa);
	FW_TOFFSET(uiInfo.tOffset);

	FW_VALVE_INFOS
	FW_VALVE_RCINFOS
	
	FW_B_SHOWER(_boiler_water_shower);
	FW_B_HEAT(_boiler_water_heat);
	FW_TEMPOFFSET(uiInfo.tempOffset);
	FW_LPM(uiInfo.lpmType);
	FW_LPM_SUB(uiInfo.lpmType_sub);
	FW_DISPMODE(_disp_mode);
	
	//FW_VRC_6_SUB(0xaa);
	//FW_VRC_7_SUB(0xbb);
	//FW_VRC_8_SUB(0xcc);
	
	FW_PLC(uiInfo.plc);
	file_write(_B+55, 0xaa);
	file_write(_B+56, 0xbb);
}

//
//	display status
uint8_t	_ds = 100;
uint8_t _dsCount = 0;
uint8_t	_dsPrev = 0;
uint8_t _subRemote = 0;

void	clear_npos1(void)
{
	lcd_clear_npos(0, 0);
	lcd_clear_npos(1, 0);
}

void	clear_npos2(void)
{
	lcd_clear_npos(2, 0);
	lcd_clear_npos(3, 0);
}

void	disp_next(void)
{
	lcd_clear(0);
	_dsCount = 1;
	_dsPrev = 0xff;
}
#if defined (_RC_WD_)
#define _ID_MAX		8
#elif defined (_RC_DR_) 
#define _ID_MAX		7
#elif defined (_RC_DW_)
#define _ID_MAX		6
#endif

uint8_t	__bL = BACKLIGHT_MAX_LEVEL;
void	disp_status_id(uint8_t key, uint8_t next)
{
	uint8_t	i;
	if( _dsCount == 0 )
	{
		disp_next();
		lcd_disp_setup_id();
		
		if( uiInfoSet.id < 2 ) {
			uiInfoSet.id = 2;
		}
		//2015.08.24 :  add dm 
		if (_backup_backlight == 0) {
			_backup_backlight = BACKLIGHT_MAX_LEVEL;
		}
		__bL = _backlight;
		_backlight = BACKLIGHT_MAX_LEVEL;
	}
	else
	{
EncEntry:		
		i = uiInfoSet.id;
		if( uiInfo.enc != 0 )
		{
			if( (uiInfo.enc&0x40) == 0 )
			{
				if( i==1 )	i = _ID_MAX;
				else
					i--;
			}
			else
			{
				if( i==_ID_MAX )	i = 1;
				else
					i++;
			}
			uiInfoSet.id = i;
		}
		if( _dsPrev != i )
		{
			_dsPrev = i;
			lcd_disp_rid(i, 0, 0);
		}
	}
	if( key == 0x10 )		__UP
	else if( key == 0x20 )	__DN
	else if( key == 4 )	
	{	
		uiInfoSet.mode = uiInfoSet.id == 1 ? 1 : 0;
		STATUS_NEXT(next);
		_backup_backlight = 0;
		//
		_backlight = __bL;
	}
}

void	disp_status_valveCount(uint8_t key, uint8_t next)
{
	uint8_t	i;
	if( _dsCount == 0 )
	{
		disp_next();
		lcd_disp_setup_valve();
	}
	else
	{
EncEntry:		
		i = uiInfoSet.controlMode==0 ? uiInfoSet.valve : uiInfoSet.valve_sub;
		if( uiInfo.enc != 0 )
		{
//			ENC_MOVE_0(1, 8, 1);
			if( (uiInfo.enc & 0x40) != 0 )
			{
				if( i<=1 )	i = 8;
				else
					i -= 1;
			}
			else
			{
				if( i>=8 )	i = 1;
				else
					i += 1;
			}			
			if( uiInfoSet.controlMode==0 )
				uiInfoSet.valve = i;
			else
				uiInfoSet.valve_sub = i;
		}
		if( _dsPrev != i )
		{
			_dsPrev = i;
			UI_DISP_2Digit(i);
		}
	}
	if( key == 0x10 )		__UP
	else if( key == 0x20 )	__DN
	else if( key == 4 )	
	{	
		//	auto set
		if( uiInfoSet.controlMode==0 )
			uiInfoSet.cnt = uiInfoSet.valve;
		else
			uiInfoSet.cnt_sub = uiInfoSet.valve_sub;
		STATUS_NEXT(next);	
	}
}

void	disp_status_toffset(uint8_t key, uint8_t next)
{
	uint8_t	i, j;
	if( _dsCount == 0 )
	{
		disp_next();
		LCD_BIT_SET(bT4);
//		lcd_disp_setup_c();
		if( uiInfoSet.tOffset == 0 )
			uiInfoSet.tOffset = 100;
	}
	else
	{
EncEntry:		
		i = uiInfoSet.tOffset;
		if( uiInfo.enc != 0 )
		{
			if( (uiInfo.enc & 0x40) == 0 )
			{
				if( i > 100 )			i -= 2;
				else if( i == 100 )		i = 2;
				else
				{
					i += 2;
					if( i >= 18 )		i = 18;
				}
			}
			else
			{
				if( i >= 100 )
				{
					i += 2;
					if( i >= 118 )		i = 118;
				}
				else 
				{
					if( i == 2 )		i = 100;
					else
						i -= 2;
				}
			}
			uiInfoSet.tOffset = i;
		}
		if( _dsPrev != i )
		{
			_dsPrev = i;
			clear_npos2();
			if( i < 100 && i != 0 )
			{
				LCD_BIT_SET(b4G);
			}
			j = i%100;
			lcd_disp_n(3, j/2);
		}
	}
	if( key == 0x10 )		__DN
	else if( key == 0x20 )	__UP
	else if( key == 4 )	
	{	
		/*
			by heedop, 20151025, 
			set tOffset automatically,
			
		 */
		uiInfo.tOffset = uiInfoSet.tOffset;
		FW_TOFFSET(uiInfo.tOffset);
		STATUS_NEXT(next);	
	}
}

uint8_t	_backlight_get_index(uint8_t i)
{
#if defined (_RC_DW_)
	if( i==BL_1 )	return 1;
	if( i==BL_2 )	return 2;
	if( i==BL_3 )	return 3;
	if( i==BL_4 )	return 4;
	return 5;
	/*
	if( i==1 )	return 1;
	if( i==2 )	return 2;
	if( i==3 )	return 3;
	if( i==4 )	return 4;
	return 5;
	*/
#elif defined (_RC_DR_)
	if( i==1 )	return 1;
	if( i==4 )	return 2;
	if( i==8 )	return 3;
	if( i==12 )	return 4;
	return 5;
#endif
}

uint8_t	_backlight_get_code(uint8_t i)
{
#if defined (_RC_DW_)
	if( i==1 )	return BL_1;
	if( i==2 )	return BL_2;
	if( i==3 )	return BL_3;
	if( i==4 )	return BL_4;
	return BL_5;
	/*
	if( i==1 )	return 1;
	if( i==2 )	return 2;
	if( i==3 )	return 3;
	if( i==4 )	return 4;
	return 5;
	*/
#elif defined (_RC_DR_)
	if( i==1 )	return 1;
	if( i==2 )	return 4;
	if( i==3 )	return 8;
	if( i==4 )	return 12;
	return BACKLIGHT_MAX_LEVEL;
#endif
}

void disp_status_backlight2(uint8_t key, uint8_t next) 
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
EncEntry:
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
	
	if( key == 0x10 )		__DN
	else if( key == 0x20 )	__UP
	else if( key == 4 )	
	{	
		/*	
			file update by heedop, 20151025
		 */
		FW_BACKLIGHT(_backlight);
		STATUS_NEXT(next);	
	}
}

void	disp_status_run_op(uint8_t key, uint8_t next)
{
	uint8_t	i;
	if( uiInfoSet.controlMode==1 )
	{
		STATUS_NEXT(next);	
		return;
	}
	if( _dsCount == 0 )
	{
		disp_next();
		lcd_disp_setup_cntl_op();
	}
	else
	{
EncEntry:		
		i = uiInfoSet.opMode;
		if( uiInfo.enc != 0 )
		{
			i = i==0 ? 1 : 0;
			uiInfoSet.opMode = i;
		}
		if( _dsPrev != i )
		{
			_dsPrev = i;
			clear_npos2();
			if( i==0 )		lcd_disp_setup_cntl_on();
			else if( i==1 )	lcd_disp_setup_cntl_po();
		}
	}
	if( key == 0x10 )		__DN
	else if( key == 0x20 )	__UP
	else if( key == 4 )		
	{
		STATUS_NEXT(next);	
	}
}

void	disp_status_cntl_op(uint8_t key, uint8_t next)
{
	uint8_t	i;
	if( uiInfoSet.controlMode==1 )
	{
		STATUS_NEXT(next);	
		return;
	}
	if( _dsCount == 0 )
	{
		disp_next();
		lcd_disp_setup_mode();
	}
	else
	{
EncEntry:		
		i = uiInfoSet.cntlMode;
		if( uiInfo.enc != 0 )
		{
			i = i==0 ? 1 : 0;
			uiInfoSet.cntlMode = i;
		}
		if( _dsPrev != i )
		{
			_dsPrev = i;
			clear_npos2();
			if( i == 0 )	lcd_disp_setup_mode_local();
			else			lcd_disp_setup_mode_each();
		}
	}
	if( key == 0x10 )		__DN
	else if( key == 0x20 )	__UP
	else if( key == 4 )		
	{
		STATUS_NEXT(next);	
	}
}

void	disp_status_houseCapa(uint8_t key, uint8_t next)
{
	uint8_t	i, j;
	if(uiInfoSet.cntlMode != 0 )	
	{
		//	EACH
		STATUS_NEXT(next);
		return;
	}
	
	if( _dsCount == 0 )
	{
		disp_next();
		lcd_disp_setup_len();
	}
	else
	{
EncEntry:		
		i = uiInfoSet.houseCapa;
		if( uiInfo.enc != 0 )
		{
			if( (uiInfo.enc & 0x40) == 0 )	i--;
			else
				i++;
			if( i < 70 )	i = 200;
			if( i > 200 )	i = 70;
			uiInfoSet.houseCapa = i;
		}
		if( _dsPrev != i )
		{
			_dsPrev = i;
			UI_DISP_3Digit(i);
		}
	}
	if( key == 0x10 )		__DN
	else if( key == 0x20 )	__UP
	else if( key == 4 )		
	{	
		STATUS_NEXT(next);	
	}
}

void	disp_status_po_type(uint8_t key, uint8_t next)
{
#if 0
	uint8_t	i;
	if( _dsCount == 0 )
	{
		disp_next();
		lcd_disp_setup_po_type();
	}
	else
	{
EncEntry:		
		i = uiInfoSet.poType;
		if( uiInfo.enc != 0 )
		{
			if( (uiInfo.enc & 0x40) == 0 )
			{
				if( i==0 )	i = 2;
				else
					i--;
			}
			else
			{
				if( i==2 )	i = 0;
				else
					i++;
			}
			uiInfoSet.poType = i;
		}
		if( _dsPrev != i )
		{
			_dsPrev = i;
			clear_npos2();
			if( i==0 )		lcd_disp_setup_po_type_xl();
			else if( i==1 )	lcd_disp_setup_po_type_pb();
			else
				lcd_disp_setup_po_type_pe();
		}
	}
	if( key == 0x10 )		__DN
	else if( key == 0x20 )	__UP
	else if( key == 4 )		
	{
		STATUS_NEXT(next);	
	}
#endif
}
/*
*/
//	99 for Sub Controller Have Not House Valve
//
CONST	uint8_t	__lpm[] = { 0, 8, 10, 15, 20, 25, 30, 99, 99 };

void	disp_status_lpm(uint8_t key, uint8_t next)
{
	uint8_t	i;
	
	if( uiInfoSet.cntlMode == 1 )
	{
		STATUS_NEXT(next);
		return;
	}
	if( _dsCount == 0 )
	{
		disp_next();
		lcd_disp_setup_lpm();
	}
	else
	{
EncEntry:		
		i = uiInfoSet.controlMode==1 ? uiInfoSet.lpmType_sub : uiInfoSet.lpmType;
//		i = uiInfoSet.lpmType;
		if( uiInfo.enc != 0 )
		{
			if( (uiInfo.enc & 0x40) == 0 )
			{
				if( i==0 )	i = 7;
				else
					i--;
			}
			else
			{
				if( i==7 )	i = 0;
				else
					i++;
			}
			if( uiInfoSet.controlMode==1 )
				uiInfoSet.lpmType_sub = i;
			else
				uiInfoSet.lpmType = i;
		}
		if( _dsPrev != i )
		{
			_dsPrev = i;
			clear_npos2();
			UI_DISP_2Digit(__lpm[i]);
		}
	}
	if( key == 0x10 )		__DN
	else if( key == 0x20 )	__UP
	else if( key == 4 )		
	{
		STATUS_NEXT(next);	
	}
}

void	disp_status_temp_offset(uint8_t key, uint8_t next)
{
#if 0
	uint8_t	i, j;
	if( uiInfoSet.opMode == 0 )
	{
		STATUS_NEXT(next);
		return;
	}
	if( _dsCount == 0 )
	{
		disp_next();
		lcd_disp_setup_temp_offset();
	}
	else
	{
EncEntry:		
		i = uiInfoSet.tempOffset;
		if( uiInfo.enc != 0 )
		{
			if( (uiInfo.enc & 0x40) == 0 )	i--;
			else
				i++;
			if( i < 60 )	i = 100;
			if( i > 100 )	i = 60;
			uiInfoSet.tempOffset = i;
		}
		if( _dsPrev != i )
		{
			_dsPrev = i;
			UI_DISP_3Digit(i);
		}
	}
	if( key == 0x10 )		__DN
	else if( key == 0x20 )	__UP
	else if( key == 4 )		
	{	
		STATUS_NEXT(next);	
	}
#endif
}

#define UI_RID			uiInfoSet._i[0]
#define UI_RPOS			uiInfoSet._i[1]
#define UI_RIDs			uiInfoSet._i[2]
#define UI_RPOSs		uiInfoSet._i[3]

uint8_t	_ui_ = 0;
void	disp_status_valveinfo_sub(uint8_t key, uint8_t next, uint8_t prev)
{
	uint8_t	i, j;
	uint8_t	b[8];
	if( _dsCount == 0 )
	{
		if( uiInfoSet.valve_sub == 0 )
		{
			uiInfoSet.cnt_sub = 0;
			uiInfoSet.lpmType_sub = 0;
			STATUS_NEXT(next);	
		}
		disp_next();
		lcd_disp_n(0, UI_RIDs+1);
		lcd_blink_npos(UI_RIDs+1);
		_ui_ = uiInfoSet.valve_sub_rc[UI_RIDs];// + uiInfoSet.cnt;
		lcd_disp_rid(_ui_, 1, 0);
		for( i=0; i<8; i++ )
		{
			if( i >= uiInfoSet.valve_sub )
			{
				uiInfoSet.valve_sub_len[i] = 0;
				uiInfoSet.valve_sub_rc[i] = 0;
			}				
			else
			{
				if( uiInfoSet.valve_rc[i] == 0 )
					uiInfoSet.valve_rc[i] = 1;
			}
		}
	}
	else
	{
EncEntry:		
		i = uiInfoSet.valve_sub_len[UI_RIDs];
		if( uiInfo.enc != 0 )
		{
			if( (uiInfo.enc & 0x40) == 0 )	i--;
			else
				i++;
			if( i > 150 )	i = 35;
			if( i < 35 )	i = 150;
			uiInfoSet.valve_sub_len[UI_RIDs] = i;
		}
		if( _dsPrev != i )
		{
			_dsPrev = i;
			UI_DISP_3Digit(i);
		}
	}
	if( key == 0x10 )		__DN
	else if( key == 0x20 )	__UP
	else if( key == 4 )		
	{	
		lcd_blink_npos_clear();
		STATUS_NEXT(next);	
		for( i=0; i<8; i++ )
			b[i] = 0;
		for( i=0; i<8; i++ )
		{
			if( uiInfoSet.valve_sub_rc[i] != 0 )
				b[uiInfoSet.valve_sub_rc[i]-1] = 1;
		}
		j = 0;
		for( i=0; i<8; i++ )
		{
			if( b[i] != 0 )
				j++;
		}
		uiInfoSet.cnt_sub = j;
	}
	else if( key == 8 )
	{
		uiInfoSet.valve_sub_rc[UI_RIDs]++;
		if( uiInfoSet.valve_sub_rc[UI_RIDs] > 8 )
			uiInfoSet.valve_sub_rc[UI_RIDs] = 1;
		/*
		uiInfoSet.valve_sub_rc[UI_RIDs]++;
		j = uiInfoSet.valve_sub + uiInfoSet.cnt;
		if( j+1 <= uiInfoSet.valve_sub_rc[UI_RIDs] )
			uiInfoSet.valve_sub_rc[UI_RIDs] = uiInfoSet.cnt + 1;
		*/
		STATUS_NEXT(prev);
	}
	else if( key == 1 )
	{
		lcd_blink_npos_clear();
		UI_RIDs++;
		if( UI_RIDs >= uiInfoSet.valve_sub )
			UI_RIDs = 0;
		STATUS_NEXT(prev);
	}
}

void	disp_status_valveinfo(uint8_t key, uint8_t next, uint8_t prev)
{
	uint8_t	i, j;
	uint8_t	b[8];
	if( uiInfoSet.controlMode==1 )
	{
		disp_status_valveinfo_sub(key, next, prev);
		return;
	}
	if( _dsCount == 0 )
	{
		if( uiInfoSet.valve == 0 )
		{
			uiInfoSet.cnt = 0;
			uiInfoSet.lpmType = 0;
			STATUS_NEXT(next);	
		}
		disp_next();
		lcd_disp_n(0, UI_RID+1);
		lcd_blink_npos(UI_RID+1);
		_ui_ = uiInfoSet.valve_rc[UI_RID];
		lcd_disp_rid(_ui_, 1, 0);
		for( i=0; i<8; i++ )
		{
			if( i >= uiInfoSet.valve )
			{
				uiInfoSet.valve_len[i] = 0;
				uiInfoSet.valve_rc[i] = 0;
			}				
			else
			{
				if( uiInfoSet.valve_rc[i] == 0 )
					uiInfoSet.valve_rc[i] = 1;
			}
		}
	}
	else
	{
EncEntry:		
		i = uiInfoSet.valve_len[UI_RID];
		if( uiInfo.enc != 0 )
		{
			if( (uiInfo.enc & 0x40) == 0 )	i--;
			else
				i++;
			if( i > 150 )	i = 35;
			if( i < 35 )	i = 150;
			uiInfoSet.valve_len[UI_RID] = i;
		}
		if( _dsPrev != i )
		{
			_dsPrev = i;
			UI_DISP_3Digit(i);
		}
	}
	if( key == 0x10 )		__DN
	else if( key == 0x20 )	__UP
	else if( key == 4 )		
	{	
		lcd_blink_npos_clear();
		STATUS_NEXT(next);	
		for( i=0; i<8; i++ )
			b[i] = 0;
		for( i=0; i<8; i++ )
		{
			if( uiInfoSet.valve_rc[i] != 0 )
				b[uiInfoSet.valve_rc[i]-1] = 1;
		}
		j = 0;
		for( i=0; i<8; i++ )
		{
			if( b[i] != 0 )
				j++;
		}
		uiInfoSet.cnt = j;
	}
	else if( key == 8 )
	{
		uiInfoSet.valve_rc[UI_RID]++;
		if( uiInfoSet.valve+1 == uiInfoSet.valve_rc[UI_RID] )
			uiInfoSet.valve_rc[UI_RID] = 1;
		STATUS_NEXT(prev);
	}
	else if( key == 1 )
	{
		lcd_blink_npos_clear();
		UI_RID++;
		if( UI_RID == uiInfoSet.valve )
			UI_RID = 0;
		STATUS_NEXT(prev);
	}
}

void	disp_status_plc(uint8_t key, uint8_t next)
{
	uint8_t	i, j;
	/*
	if( uiInfoSet.controlMode == 1 )
	{
		STATUS_NEXT(next);	
		return;
	}
	if( uiInfoSet.cntlMode == 1 )
	{
		//	EACH
		if( uiInfoSet.valve < 8 )
		{
			STATUS_NEXT(next);
			return;
		}
	}
	else
	{
		//	LOCAL
		if( uiInfoSet.valve < 7 )
		{
			STATUS_NEXT(next);
			return;
		}
	}
	*/
	if( _dsCount == 0 )
	{
		disp_next();
		lcd_disp_plc();
		lcd_disp_n(3, uiInfoSet.plc);
	}
	else
	{
EncEntry:
		i = uiInfoSet.plc;
		if( uiInfo.enc != 0 )
		{
			//	by heedop, 8 -> 9 for next
			if( (uiInfo.enc & 0x40) == 0 )
			{
				if( i != 0 )
					i--;
				else
					i = _ID_MAX+1;
			}
			else
			{
				if( i != _ID_MAX+1 )
					i++;
				else
					i = 0;
			}
			uiInfoSet.plc = i;
		}
		if( _dsPrev != i )
		{
			_dsPrev = i;
			lcd_disp_n(3, i);
		}
	}
	if( key == 4 )		
	{	
		STATUS_NEXT(next);	
	}
	else if( key == 0x10 )	__DN
	else if( key == 0x20 )	__UP
}

extern uint8_t	__func_rc_settingCb;
extern void	func_rc_setting(void);

uint8_t		__func_rc_timerout = 0;
uint8_t		__func_rc_timerout1 = 0;
uint8_t		__func_rc_timerout2 = 0;

uint8_t	disp_status_run(uint8_t key, uint8_t next, uint8_t prev)
{
	uint8_t	i;
	if( _dsCount == 0 )
	{
		disp_next();
//		LCD_BIT_SET(bT1);
//		LCD_BIT_SET(bT4);
		lcd_disp_setup_run();
	}
	if( key == 4 )	
	{
		copy_infoSet();
		FW_MODE(uiInfo.mode);
		FW_ID(uiInfo.id);
		FW_TOFFSET(uiInfo.tOffset);
		if( uiInfo.mode == 1 )
		{
			func_rc_setting();
			__func_rc_timerout = 6;
			FW_CNTLMODE(uiInfo.cntlMode);
			FW_VALVE(uiInfo.valve);
			FW_VALVE_SUB(uiInfo.valve_sub);
			FW_CNT(uiInfo.cnt);
			FW_CNT_SUB(uiInfo.cnt_sub);
			FW_CNT_MODE(uiInfo.controlMode);
			FW_OPMODE(uiInfo.opMode);
			FW_POTYPE(uiInfo.poType);
			FW_HOUSECAPA(uiInfo.houseCapa);
			FW_LPM(uiInfo.lpmType);
			FW_TEMPOFFSET(uiInfo.tempOffset);
			
			FW_VALVE_INFOS
			FW_VALVE_RCINFOS
		}
		else
		{
			__func_rc_timerout = 4;
		}
	
		__func_rc_timerout1 = 0;
		__func_rc_timerout2 = __timer1s;
		STATUS_NEXT(next);	
	}
	else if( key == 2 )
	{
		_backup_backlight = 0;
//		STATUS_NEXT(prev);
		return 1;
	}
	else if( key == 8 )
	{
		STATUS_NEXT(prev);
	}
	return 0;
}

uint8_t	disp_status_run_id(uint8_t key, uint8_t next, uint8_t prev)
{
	uint8_t	i;
	if( _dsCount == 0 )
	{
		disp_next();
		lcd_disp_setup_run();
	}
	if( key == 4 )	
	{
		copy_infoSet();
		FW_MODE(uiInfo.mode);
		FW_ID(uiInfo.id);
		FW_TOFFSET(uiInfo.tOffset);
		
		if( uiInfo.mode == 1 )
		{
			//func_rc_setting();
			__func_rc_timerout = 6;
			FW_CNTLMODE(uiInfo.cntlMode);
			FW_VALVE(uiInfo.valve);
			FW_VALVE_SUB(uiInfo.valve_sub);
			FW_CNT(uiInfo.cnt);
			FW_CNT_SUB(uiInfo.cnt_sub);
			FW_CNT_MODE(uiInfo.controlMode);
			FW_OPMODE(uiInfo.opMode);
			FW_POTYPE(uiInfo.poType);
			FW_HOUSECAPA(uiInfo.houseCapa);
			FW_LPM(uiInfo.lpmType);
			FW_TEMPOFFSET(uiInfo.tempOffset);
			
			FW_VALVE_INFOS
			FW_VALVE_RCINFOS
		}
		else
		{
			__func_rc_timerout = 4;
		}

		__func_rc_timerout1 = 0;
		__func_rc_timerout2 = __timer1s;
		STATUS_NEXT(next);	
	}
	
	return 0;
}


void	disp_status_exit(uint8_t key, uint8_t next)
{
	uint8_t	i;

	_backup_backlight = 0;
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

	if( __func_rc_settingCb == 1 && _dsCount >= 10 )
	{
		STATUS_NEXT(next);
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
				if( uiInfo.mode == 1 )
				{
					/*	main cntl error 11~18, 19 is new
					*/
					ui_error = 19;
					_ds = 97;
					_dsCount = 0;
				}	
				else
				{
					STATUS_NEXT(next);
				}
			}
		}
	}
	else
		__func_rc_timerout1 = 0;
}

uint8_t	_tim1min = 0;
uint8_t	_tim30min = 0;
uint8_t	_timFlag = 0;

void	timerClear(void)
{
	_tim1min = 0;
	_tim30min = 0;
	_timFlag = 0;
}

void	disp_status_loop_message(uint8_t i)
{
	lcd_clear_btn();
	if( i == 0 )		/*	(0)난방*/	
	{	
		_disp_mode = 0x01;	
		LCD_BIT_SET(bT1);	//	현재온도
		LCD_BIT_SET(bT3);	//	도
		LCD_BIT_SET(bT4);	//	설정온도
		LCD_BIT_SET(bT5);	//	도
		LCD_BIT_SET(bT6);	//	난방	
	}
	else if( i == 1 )	/*	(1)예약*/	
	{	
		_disp_mode = 0x08;	
//		LCD_BIT_SET(bT1);	//	현재온도
//		LCD_BIT_SET(bT3);	//	도
		LCD_BIT_SET(bT14);	//	예약
	}
	else if( i == 2 )	/*	(2)반복*/	
	{	
		_disp_mode = 0x10;	
//		LCD_BIT_SET(bT1);	//	현재온도
//		LCD_BIT_SET(bT3);	//	도
		LCD_BIT_SET(bT18);	//	타이머	
/*	
		_disp_mode = 0x10;	
		LCD_BIT_SET(bP9);	
		LCD_BIT_SET(bS1);	
//		LCD_BIT_SET(bP15);	
		LCD_BIT_SET(bP19);	
		LCD_BIT_SET(bP20);	
		LCD_BIT_SET(bDP1);	
*/
	}
	else if( i == 8 )		/*	(1)외출*/	
	{	
		_disp_mode = 0x02;	
		LCD_BIT_SET(bT1);	//	현재온도
		LCD_BIT_SET(bT3);	//	도
		LCD_BIT_SET(bT7);	//	외출
/*
		LCD_BIT_SET(bP13);	
		LCD_BIT_SET(bP19);	
		LCD_BIT_SET(bP20);	
		LCD_BIT_SET(bDP1);	
*/
	}
	else if( i == 17 )		/*	(1)외출 LONG */	
	{	
		_disp_mode = 0x02;
/*		
		LCD_BIT_SET(bP13);	
		LCD_BIT_SET(bP19);	
		LCD_BIT_SET(bP20);	
		LCD_BIT_SET(bDP1);	
*/
	}
	else if( i == 5 )	
	{	
		_disp_mode = 0x04;	
//		LCD_BIT_SET(bP11);	/*	(2)정지*/	
	}
	else if( i == 151 )		//	OUT
	{
		_disp_mode = 0x02;	
		LCD_BIT_SET(bT1);	//	현재온도
		LCD_BIT_SET(bT3);	//	도
//		LCD_BIT_SET(bT4);	//	설정온도
//		LCD_BIT_SET(bT5);	//	도
		LCD_BIT_SET(bT7);	//	외출
	}
	else if( i == 152 )		//	온수
	{
		LCD_BIT_SET(bT29);	//	
	}
	else if( i == 153 )		//	난수
	{
		LCD_BIT_SET(bT22);	//	
	}
	else if( i == 154 )		//	예약
	{
		_disp_mode = 0x08;
		LCD_BIT_SET(bT14);	//	예약
	}
	else if( i == 155 )		//	타이머
	{
		_disp_mode = 0x10;
		LCD_BIT_SET(bT18);	//	타이머	
	}
	
	_disp_mode2 = _disp_mode;
	timerClear();
}

extern uint8_t	_boiler_fire;
extern void	__ui_disp_temp_c(uint8_t i);

void	disp_status_loop_init(void)
{
	uint8_t i;
	
	i = 0;
	if (_disp_mode == 0xff) {
		i = 1;
	}
	
	//	clear 
	lcd_clear(0);
	lcd_blink_clear();
	_dsPrev = 0xff;
	if( uiInfo._temp[0] == 0x80 )
		uiInfo.tSetup = uiInfo._temp[1];
	uiInfo._temp[0] = 0;
/*
	if (_disp_mode != _disp_mode2) {
		if( _disp_mode2 == 0x01 )	__sUp = 0;
		else if( _disp_mode2 == 0x08 )	__sUp = 1;
		else if( _disp_mode2 == 0x10 )	__sUp = 2;
		else if( _disp_mode2 == 0x04 )	__sUp = 5;
		else if( _disp_mode2 == 0x02 )	__sUp = 8;
	}
*/
	if( __sUp == 5 )		//	Off
	{
/*		
		i = _disp_mode==0xff ? 1 : 0;
		if ( i == 0) {
			ui_disp_temp_mark(1);
		}
		if ( i == 0) {
			if (_disp_mode == 0x01) {
				ui_disp_temp_curr(uiInfo.tCurr);
				ui_disp_temp_setup(uiInfo.tSetup);
			} else {
				disp_status_curr_only();
			}
		}
		if ( i == 1 ) {
			_key_blink = 1;
			_key_sec = KEY_BLINK_FADE;
		}
		lcd_disp_info_fire(_boiler_fire != 0 ? 1 : 0);
*/
	}
	else if( __sUp == 0 )
	{
		__ui_disp_temp_c(3);
		ui_disp_temp_curr(uiInfo.tCurr);
		ui_disp_temp_setup(uiInfo.tSetup);
	}
	else if( __sUp == 1 )	//	Y
	{
	}
	else if( __sUp == 2 )	//	B
	{
	}
	else if( __sUp == 8 )	//	Out
	{
		__ui_disp_temp_c(1);
		uiInfo._temp[0] = 0x80;
		uiInfo._temp[1] = uiInfo.tSetup;
		/*
			heedo for save tSetup 20151108
		 */
		UPDATE_BIT(BIT_TSETUP);
		uiInfo._temp[3] = uiInfo.tSetup;
		uiInfo.tSetup = 20;
//		ui_disp_temp_setup(uiInfo.tSetup);
		/*
		if ( i == 1 ) {
			_key_blink = 1;
			_key_sec = KEY_BLINK_FADE;
		}
		*/
	}else if( __sUp == 17 )	//	Out long
	{
		__ui_disp_temp_c(1);
		uiInfo._temp[0] = 0x80;
		uiInfo._temp[1] = uiInfo.tSetup;
		uiInfo.tSetup = 20;
	}
	else if( __sUp == 151 )	//	OUT
	{
	}
	else
	{
	}
	disp_status_loop_message(__sUp);
}

void	disp_status_curr_only(void)
{
	ui_disp_clear_tSetup(0);
	ui_disp_temp_curr(uiInfo.tCurr);
}

void	disp_status_error(uint8_t key, uint8_t next)
{
	uint8_t	i;
	if( error_display_status == 1 )
	{
		lcd_clear(0);
		lcd_disp_err(ui_error);
		error_display_status = 2;
	}
	else
	{
		if( uiInfo.enc != 0 )
		{
			goto Exit;
		}
	}
#if defined (_RC_DR_)	
	if( key == 8 )        // 2015.10.30 에러복구 버튼 변경
#elif defined (_RC_DW_) 
	if( key == 1 )
#else
	if( key == 2 )
#endif
	{
Exit:		
		if( uiInfo.mode == 1 )
		{
			//	clear error
			func_rc_recover(1);
		}
	}
	
	/*
		error cleared
	 */
	if( error == 0 && error_type == 0 )
	{
RESET_ENTRY:			
		/*
			reset mode
		 */
		if (ui_error == 30 && ui_error_type == ERROR_TYPE_CNT) {
			return;
		}
		
		error_display_mode = 0;
	}
	
	if( ui_error == 0 && ui_error_type == 0 )
	{
		goto RESET_ENTRY;
	}	
}

#define _LC		10

void	disp_status_command(uint8_t key)
{
	uint8_t	i;
	if( _dsCount == 0 )
	{
		disp_next();
		//lcd_disp_setup_cntl_op();
		LCD_BIT_SET(b1A);
		LCD_BIT_SET(b1F);
		LCD_BIT_SET(b1E);
		LCD_BIT_SET(b1D);
		uiInfo._t = 0;
	}
	else
	{
EncEntry:		
		i = uiInfo._t;
		if( uiInfo.enc != 0 )
		{
			if( (uiInfo.enc & 0x40) == 0 )
				i = (i+_LC-1)%_LC;
			else
				i = (i+1)%_LC;
			uiInfo._t = i;
		}
		if( _dsPrev != i )
		{
			_dsPrev = i;
			clear_npos2();
			if( i==0 )		lcd_disp_setup_cntl_tab();
			else if( i==1 )	lcd_disp_setup_cntl_2motor();
			else if( i==2 )	lcd_disp_setup_cntl_on();
			else if( i==3 )	lcd_disp_setup_cntl_po();
			else if( i==4 )	lcd_disp_mir1();
			else if( i==5 )	lcd_disp_mir2();
			else if( i==6 )	lcd_disp_freset();
			else if( i==7 )	lcd_disp_cnt_host();
			else if( i==8 )	lcd_disp_cnt_sub();
			else if( i==9 )	lcd_disp_n(3, 0);
		}
	}
	if( key == 0x10 )		__UP
	else if( key == 0x20 )	__DN
	else if( key == 4 )		
	{
		switch( uiInfo._t )
		{
		case 0:
			uiInfoSet.opMode = 3;	
			disp_status_run(3, 35, 0);
			break;
		case 1:	
			uiInfoSet.opMode = 2;	
			disp_status_run(3, 35, 0);
			break;
		case 2:	
			uiInfoSet.opMode = 0;	
			disp_status_run(3, 35, 0);
			break;
		case 3:	
			uiInfoSet.opMode = 1;	
			disp_status_run(3, 35, 0);
			break;
		case 5:
			STATUS_NEXT(95);
			break;
		case 6:	
			func_rc_command(COMMAND_MODE_FACTORY, 100);	
			break;
		case 7:	
			//	MAIN
			func_rc_command(COMMAND_MODE_FACTORY, 110);	
			disp_status_run(3, 35, 0);
			break;
		case 8:	
			//	SUB
			func_rc_command(COMMAND_MODE_FACTORY, 120);	
			disp_status_run(3, 35, 0);
			break;
		case 9:
			STATUS_NEXT(100);
			break;
		}
	}
	else if( key == 1 )
	{
		STATUS_NEXT(99);
	}
}
	
//	defined main.c
extern uint8_t	getCurrTemp(void);
extern uint8_t	_remote;

extern uint8_t	config_disp(uint8_t key, uint8_t next);
extern void	config_disp2(uint8_t key, uint8_t next);

extern uint8_t debug_hn;
extern uint8_t debug_br;

#define _485A_TYPE	1
#define _485A_ERR	3
#define _485B_TYPE	2
#define _485B_ERR	4

uint8_t	_d485_id = 0;

void	disp_write_file(uint8_t next)
{
	/*	file update
	*/
	file_update();
	__func_rc_timerout = 5;
	__func_rc_timerout1 = 0;
	__func_rc_timerout2 = __timer1s;
	func_rc_setting();
	_ds = next;
}

void	disp_set_state(uint8_t next)
{
	lcd_blink_clear();
	STATUS_NEXT(next);
}

void _disp_485(uint8_t i) {
	lcd_disp_n(1, i >> 4);
	lcd_disp_n(2, (i & 0x0F)/10);
	lcd_disp_n(3, (i & 0x0F)%10);
}

void	disp_485(uint8_t next)
{
	if( _dsCount == 0 )
	{
		_dsCount = 1;
		lcd_clear(0);
		goto DispEntry;
	}
	else
	{
		if( (_t20ms%100) != 0 )
		{
			_dsPrev = 0;
			return;
		}
		
		if( _dsPrev != 0 )
			return;
DispEntry:			
		_dsPrev = 1;
		LCD_BIT_SET(b1F);
		LCD_BIT_SET(b1E);
		LCD_BIT_SET(b1G);
		LCD_BIT_SET(b1C);
		LCD_BIT_SET(b1D);
		
		if( _d485_id == 0 )
		{
			LCD_BIT_CLEAR(b1D);
			_disp_485(debug_hn);
		}
		else
		{
			_disp_485(debug_br);
		}
		_d485_id = _d485_id==0 ? 1 : 0;
	}
}

uint8_t	error_display_refresh = 0;

void	disp_statusCb(uint8_t key)
{
	uint8_t	t;
	
	if( _ds == 220 || _ds == 221)
		goto ERROR_JUMP;
		
	//	error check
	if( error != 0 && error_type != 0 )
	{	
			error_display(error_type, error);
	}
	/*
		error mode
	 */
	if( error_display_mode == 1 )
	{
		disp_status_error(key, 99);
		error_display_refresh = 1;
		
//		if( _ds != 220 && key != 0x55)
			return;
	}
	
	if( error_display_refresh == 1 )
	{
		error_display_refresh = 0;
		disp_status_loop_init();
	}

ERROR_JUMP:
	if( _ds == 1 )			disp_status_id(key, 37);// disp_status_id(key, 36);
	else if( _ds == 36 )	disp_status_toffset(key, 37);
	else if( _ds == 37 )	
	{
		t = disp_status_run(key, 38, 1);
		if( t == 1 )
			_ds = 100;
	}
	else if( _ds == 38 )	disp_status_exit(key, 100);
	
	else if( _ds == 2 )		disp_status_id(key, 3);
	else if( _ds == 3 )	
	{
		t = disp_status_run_id(key, 38, 2);
		if( t == 1 )
			_ds = 100;
	}

	else if( _ds == 9 )		disp_status_run_op(key, 61);
	else if( _ds == 61 )	disp_status_cntl_op(key, 63);
	else if( _ds == 63 )	disp_status_valveCount(key, 64);
	else if( _ds == 64 )	disp_status_houseCapa(key, /*65*/66);	//	if opMode==0, skip
//	65->66
//	else if( _ds == 65 )	disp_status_po_type(key, 66);	//	비례제어
	else if( _ds == 66 )	disp_status_lpm(key, /*67*/68);		//	세대밸브 if cntlMode==1, skip
//	67->68
//	else if( _ds == 67 )	disp_status_temp_offset(key, 68);	//	if opMode==0, skip
																//	clear valve info
	else if( _ds == 68 )	disp_status_valveinfo(key, 69, 68);
	else if( _ds == 69 )	disp_status_plc(key, 70);
	else if( _ds == 70 )	
	{
		t = disp_status_run(key, 71, 9);
		if( t == 1 )
			_ds = 100;
	}
	else if( _ds == 71 )	disp_status_exit(key, 100);
	
	else if( _ds == 10 )	
	{
		t = disp_status_run(key, 11, 9);
		if( t == 1 )
			_ds = 100;
	}
	else if( _ds == 11 )	disp_status_exit(key, 100);
	
	else if( _ds == 12 )	disp_status_exit(key, 100);
	else if( _ds == 15 )	
	{
		t = disp_status_run(key, 11, 20);
		if( t == 1 )
			_ds = 100;
	}
	else if( _ds == 33 )	disp_status_toffset(key, 34);	//	mainR/C only
	else if( _ds == 34 )	
	{
		t = disp_status_run(key, 35, 33);
		if( t == 1 )
			_ds = 100;
	}
	else if( _ds == 35 )	disp_status_exit(key, 100);
	
	else if( _ds == 41 )	disp_status_command(key);
	
	else if( _ds == 100 )	
	{	
		__s = 0;
		_dsCount = 0;
		_ds = 99;	
		_dsPrev = 0xff;
		_remote = 0;
	}
	else if( _ds == 101 || _ds == 133 )
	{
		//	wait 1s and jume _ds-100
		_dsCount = __timer1s;
		_dsPrev = _ds - 100;
		_ds = 200;
	}
	else if (_ds == 150)							// 온도보상
	{
		disp_status_toffset(key, 151);	//	mainR/C only
	}
	else if (_ds == 151)							// 백라이트
	{
		disp_status_backlight2(key, 153);
	}
	else if (_ds == 152) 
	{
		t = disp_status_run(key, 153, 150);
		if( t == 1 )
			_ds = 100;
	}
	else if (_ds == 153)
	{
		_ds = 100;
		file_update2(0);
		//disp_status_exit(key, 100);
	}
	else if (_ds == 160)							// 온도보상
	{
		disp_status_toffset(key, 161);	//	mainR/C only
	}
	else if (_ds == 161)							// 백라이트
	{
		disp_status_backlight2(key, 162);
	}
	else if( _ds == 162 )
	{
		_ds = 100;
	}
	else if( _ds == 200 )
	{
		if( _dsCount == __timer1s )
			return;
		STATUS_NEXT(_dsPrev);
	}
	
//	else if( _ds == 80 )	{	config_disp2(key, 81);	}
	else if( _ds == 81 )	{	disp_write_file(12);	}
	else if( _ds == 95 )	{	disp_485(12);	}
	else if( _ds == 96 )	{	disp_write_file(12);	}
	else if( _ds == 97 )
	{
		disp_status_error(key, 99);
//		if ( ui_error == 0 && ui_error_type == 0) {
			if( error == 0 && error_type == 0 )
			{
				//	error recovery
				_ds = 100;
			}
//		}
	}
//	else if( _ds == 98 )	
//	{	
//		t = config_disp(key, 96);	
//		if( t == 1 )
//			_ds = 100;
//	}
	else if( _ds == 99 )
	{
		uint8_t j;
		
		if (key == 200) {
			j = 2;
			_disp_temp = 1;
		}
		if( key == 220 )
		{
			//_disp_temp = 1;
			uiInfo.remote_t[0] = __s;
			uiInfo.remote_t[1] = _dsCount;
			__s = 200;
			_dsCount = 0;
			_disp_temp = 1;
		}
		
		t = getCurrTemp();
		if( uiInfo.tOffset != 100 )
		{
			if( uiInfo.tOffset > 100 )
				t = t + (uiInfo.tOffset-100);
			else
				t = t - uiInfo.tOffset;
		}
		if( uiInfo.tCurr != t )
		{
			uiInfo.tCurr = t;
			if( _remote == 0 )
			{
				//	Only Nanbang
				if( _disp_temp == 1 )
					ui_disp_temp_curr(t);
			}
		}
		
		_disp_temp = 0;
		
		
		if( uiInfo.mode == 0 )	
			disp_status_loop_client(key);
		else
			disp_status_loop_host(key);
	}
	else if( _ds == 220 )
	{
		disp_status_id(key, 221);
	}
	else if( _ds == 221 )
	{
		FW_ID(uiInfoSet.id);
		FW_MODE(uiInfoSet.mode);
		uiInfo.id = uiInfoSet.id;
		uiInfo.mode = uiInfoSet.mode;
			_ds = 100;
	}
}

void	copy_info(uint8_t next)
{
	uint8_t	i;
	disp_set_state(next);
	uiInfoSet.id = uiInfo.id;
	uiInfoSet.cnt = uiInfo.cnt;
	uiInfoSet.cnt_sub = uiInfo.cnt_sub;
	uiInfoSet.opMode = uiInfo.opMode;
	uiInfoSet.mode = uiInfo.mode;
	uiInfoSet.controlMode = uiInfo.controlMode;
	uiInfoSet.valve = uiInfo.valve;
	uiInfoSet.valve_sub = uiInfo.valve_sub;
	uiInfoSet.poType = uiInfo.poType;
	uiInfoSet.houseCapa = uiInfo.houseCapa;
	uiInfoSet.tOffset = uiInfo.tOffset;
	uiInfoSet.tempOffset = uiInfo.tempOffset;
	uiInfoSet.lpmType = uiInfo.lpmType;
	uiInfoSet.lpmType_sub = uiInfo.lpmType_sub;
	uiInfoSet.subRCLock = uiInfo.subRCLock;
	uiInfoSet.cntlMode = uiInfo.cntlMode;
	for( i=0; i<8; i++ )
	{
		uiInfoSet.valve_len[i] = uiInfo.valve_len[i];
		uiInfoSet.valve_rc[i] = uiInfo.valve_rc[i];
		uiInfoSet.valve_sub_len[i] = uiInfo.valve_sub_len[i];
		uiInfoSet.valve_sub_rc[i] = uiInfo.valve_sub_rc[i];
	}
	uiInfoSet.plc = uiInfo.plc;
	//	must check
	//	if not 0 then does not display  rid
	/*
	_backup_backlight = _backlight + 1;
	*/
	lcd_blink_npos_clear();
	lcd_blink_clear();
}

extern uint8_t	_boiler_type;

void	copy_infoSet(void)
{
	uint8_t	i;
	uiInfo.id = uiInfoSet.id;
	uiInfo.cnt = uiInfoSet.cnt;
	uiInfo.cnt_sub = uiInfoSet.cnt_sub;
	uiInfo.opMode = uiInfoSet.opMode;
	uiInfo.mode = uiInfoSet.mode;
	uiInfo.controlMode = uiInfoSet.controlMode;
	uiInfo.valve = uiInfoSet.valve;
	uiInfo.valve_sub = uiInfoSet.valve_sub;
	uiInfo.poType = uiInfoSet.poType;
	uiInfo.houseCapa = uiInfoSet.houseCapa;
	uiInfo.tOffset = uiInfoSet.tOffset;
	uiInfo.tempOffset = uiInfoSet.tempOffset;
	uiInfo.lpmType = uiInfoSet.lpmType;
	uiInfo.lpmType_sub = uiInfoSet.lpmType_sub;
	uiInfo.subRCLock = uiInfoSet.subRCLock;
	uiInfo.cntlMode = uiInfoSet.cntlMode;
	for( i=0; i<8; i++ )
	{
		uiInfo.valve_len[i] = uiInfoSet.valve_len[i];
		uiInfo.valve_rc[i] = uiInfoSet.valve_rc[i];
		uiInfo.valve_sub_len[i] = uiInfoSet.valve_sub_len[i];
		uiInfo.valve_sub_rc[i] = uiInfoSet.valve_sub_rc[i];
	}
	uiInfo.plc = uiInfoSet.plc;
	if( uiInfo.plc == 0 )
	{
		_boiler_type = 0;
	}
	else
	{
		_boiler_type = 1;
		uiInfo.plc--;
	}
}

extern uint8_t timerEventClear(void);
extern uint8_t	_key_continue;

void	disp_status(uint8_t key)
{
	lcd_blinkCb();

	disp_statusCb(key);
	
	//	clear
	uiInfo.enc = 0;

	//	update check
	if( _updateBit != 0 && _updateTimer != __timer1s )
	{
		_updateTimer = __timer1s;
		_updateCount--;
		if( _updateCount == 0 )
		{
			if( (_updateBit&BIT_REPEAT) != 0 )	{FW_REPEAT(uiInfo.repeat);	}
			if( (_updateBit&BIT_RESERVE) != 0 )	{FW_RESERVE(uiInfo.reserve);}
			if( (_updateBit&BIT_TSETUP) != 0 )	
			{
				//	BY HEEDO 20151108
				if( uiInfo._temp[3] != 0 )
				{
					FW_TSETUP(uiInfo._temp[3]);
					uiInfo._temp[3] = 0;
				}
				else
					FW_TSETUP(uiInfo.tSetup);
			}
			if( (_updateBit&BIT_DISPMODE) != 0 ){
				if (uiInfo.mode == SETTING_MODE_SUB) {
					//if (_disp_mode != RC_MODE_OUT) {
						FW_DISPMODE(_disp_mode);
					//}
				} else {
					FW_DISPMODE(_disp_mode);
				}
			}
			
			if( (_updateBit&BIT_REPEAT) != 0 || (_updateBit&BIT_RESERVE) != 0 )	
			{
				timerEventClear();
			}
			
			_updateBit = 0;
		}
	}
	if( key==0 )
		return;
		
	if( _key_continue == 1 )
	{
		if( key==2 )		
		{	
			key++;
			key--;
			//continue;
//			goto SetupMaster;	
		}
		//if( key==4 )	{		goto SetupRc; } //disp_statusCb(200);}
			//goto SetupSub;	}
		if( key==8 )	{ copy_info(150);}		
		//goto SetupRoomCntl; }
		if( key==1 )	
		{	
			if( uiInfo.mode == 1 )	
				disp_statusCb(220);
				
			//if( uiInfo.id == 0 )	{	disp_statusCb(220);		}
			/*
			if( uiInfo.id == 0 )
			{
				//	ID Setup
				_ds = 2;		
				_dsCount = 0;
				_backup_backlight = 1;
				lcd_clear(0);
				lcd_blink_clear();
			}
			*/
//			goto SetupCommand;	
		}
		if( key==0x10 ){}		//goto SetupRc;	//}
		_key_continue = 0;
		goto SetupEntry;
	}
/*	
	if( key == _keypwMaster[_keypwIndexMaster] )
	{
		_keypwIndexMaster++;
		if( _keypwIndexMaster == 6 )
		{
			_keypwIndexMaster = 0;
SetupMaster:		
			uiInfo.id = 1;
			uiInfo.mode = 1;
			uiInfo.controlMode = 0;
			copy_info(9);
		}
	}
	else
	{
		_keypwIndexMaster = 0;
		if( key == _keypwMaster[_keypwIndexMaster] )
			_keypwIndexMaster++;
	}

	if( key == _keypwMaster2[_keypwIndexMaster2] )
	{
		_keypwIndexMaster2++;
		if( _keypwIndexMaster2 == 6 )
		{
			_keypwIndexMaster2 = 0;
SetupSub:
			uiInfo.id = 1;
			uiInfo.mode = 1;
			uiInfo.controlMode = 1;
			copy_info(9);
		}
	}
	else
	{
		_keypwIndexMaster2 = 0;
		if( key == _keypwMaster2[_keypwIndexMaster2] )
			_keypwIndexMaster2++;
	}
*/

SetupEntry:		
	if( key == 0x88 )
	{
SetupRoomCntl:		
		uiInfo.enc = 0;
		if( uiInfo.mode == 0 )
			uiInfo.id = 2;
		copy_info(uiInfo.mode==0 ? 101 : 133);
	}
	else if( key == 0x89 && uiInfo.mode == 1 )
	{
SetupCommand:		
		uiInfo.enc = 0;
		copy_info(41);
	}
/*	
	if( key == _keypwDefault[_keypwIndexDefault] )
	{
		_keypwIndexDefault++;
		if( _keypwIndexDefault == 6 )
		{
			_keypwIndexDefault = 0;
			uiInfo.id = 1;
			uiInfo.mode = 1;
			copy_info(98);
		}
	}
	else
	{
		_keypwIndexDefault = 0;
		if( key == _keypwDefault[_keypwIndexDefault] )
			_keypwIndexDefault++;
	}
*/
/*
	if( key == _keypwClient[_keypwIndexClient] )
	{
		_keypwIndexClient++;
		if( _keypwIndexClient == 6 )
		{
			_keypwIndexClient = 0;
SetupRc:
//			uiInfo.id = 2;
//			uiInfo.mode = 0;
//			copy_info(101);
	lcd_blink_npos_clear();
	lcd_blink_clear();
	disp_set_state(220);
		}
	}
	else
	{
		_keypwIndexClient = 0;
		if( key == _keypwClient[_keypwIndexClient] )
			_keypwIndexClient++;
	}
*/
}

