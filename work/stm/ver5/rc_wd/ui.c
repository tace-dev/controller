#include "stdafx.h"
#include "uiDef.h"
#include "rc_protocol.h"

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

#define ENC_CODE(i,s)	i = (i + ((uiInfo.enc & 0x40) == 0 ? (s-1) : 1)) % s;
#define UI_SET(a,b)		if( a==0 )	a = b;

void	copy_infoSet(void);
void	copy_info(uint8_t next);


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
	UI_SET(uiInfo.repeat, 5)
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
	UI_SET(_backlight, 3)
	
	uiInfo.plc = FW_GET_PLC;
	
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

void	disp_status_id(uint8_t key, uint8_t next)
{
	uint8_t	i;
	if( _dsCount == 0 )
	{
		disp_next();
		lcd_disp_setup_id();
		if( uiInfoSet.id < 2 )
			uiInfoSet.id = 2;
	}
	else
	{
		i = uiInfoSet.id;
		if( uiInfo.enc != 0 )
		{
			if( (uiInfo.enc&0x40) == 0 )
			{
				if( i==2 )	i = 10;
				else
					i--;
			}
			else
			{
				if( i==10 )	i = 2;
				else
					i++;
			}
			uiInfoSet.id = i;
		}
		if( _dsPrev != i )
		{
			_dsPrev = i;
			//	decrease 1
			lcd_disp_n(3, uiInfoSet.id - 1);
		}
	}
	if( key == 3 )	
	{	
		if( uiInfoSet.id == 10 )
		{
			//	To M R/C
			uiInfo.id = 1;
			uiInfo.mode = 1;
			copy_info(9);
			return;
		}
		STATUS_NEXT(next);	
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
		i = uiInfoSet.controlMode==0 ? uiInfoSet.valve : uiInfoSet.valve_sub;
		if( uiInfo.enc != 0 )
		{
			if( (uiInfo.enc&0x40) == 0 )
			{
				if( i==0 )	i = 8;
				else
					i--;
			}
			else
			{
				if( i==8 )	i = 0;
				else
					i++;
			}
//			ENC_MOVE_0(1, 8, 1);
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
	if( key == 3 )		
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
		lcd_disp_setup_c();
	}
	else
	{
		i = uiInfoSet.tOffset;
		if( uiInfo.enc != 0 )
		{
			if( (uiInfo.enc & 0x40) == 0 )
			{
				if( i > 100 )			i--;
				else if( i == 100 )		i = 1;
				else
				{
					i++;
					if( i >= 19 )		i = 19;
				}
			}
			else
			{
				if( i >= 100 )
				{
					i++;
					if( i >= 119 )		i = 119;
				}
				else 
				{
					if( i == 1 )		i = 100;
					else
						i--;
				}
			}
			uiInfoSet.tOffset = i;
		}
		if( _dsPrev != i )
		{
			_dsPrev = i;
			clear_npos2();
			LCD_BIT_CLEAR(bT3);
			LCD_BIT_CLEAR(bT4);
			if( i < 100 )
			{
				LCD_BIT_SET(b3G);
			}
			j = i%100;
			lcd_disp_n(3, j/2);
			if( (j%2) == 1 )
			{
				LCD_BIT_SET(bT3);
				LCD_BIT_SET(bT4);
			}
		}
	}
	if( key == 3 )	
	{	
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
	if( key == 3 )		
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
	if( key == 3 )		
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
	if( key == 3 )		
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
	if( key == 3 )		
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
	if( key == 3 )		
	{
		STATUS_NEXT(next);	
	}
}

void	disp_status_temp_offset(uint8_t key, uint8_t next)
{
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
	if( key == 3 )		
	{	
		STATUS_NEXT(next);	
	}
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
	if( key == 3 )		
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
	else if( key == 4 )
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
	if( key == 3 )		
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
	else if( key == 4 )
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
		i = uiInfoSet.plc;
		if( uiInfo.enc != 0 )
		{
			if( (uiInfo.enc & 0x40) == 0 )
			{
				if( i != 0 )
					i--;
				else
					i = 8;
			}
			else
			{
				if( i != 8 )
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
	if( key == 3 )		
	{	
		STATUS_NEXT(next);	
	}
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
		lcd_disp_setup_run();
	}
	if( key == 3 )	
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
	else if( key == 4 )
	{
		STATUS_NEXT(prev);
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
	if( i == 0 )		{	_disp_mode = 0x01;	LCD_BIT_SET(bS6);	/*	(0)난방*/	}
	else if( i == 1 )	{	_disp_mode = 0x08;	LCD_BIT_SET(bS7);	/*	(1)예약*/	}
	else if( i == 2 )	{	_disp_mode = 0x10;	LCD_BIT_SET(bS8);	/*	(2)반복*/	}
	else if( i == 8 )	{	_disp_mode = 0x02;	LCD_BIT_SET(bS9);	/*	(1)외출*/	}
	else if( i == 5 )	{	_disp_mode = 0x04;	LCD_BIT_SET(bS10);	/*	(2)정지*/	}
	
	_disp_mode2 = _disp_mode;
	timerClear();
}

extern uint8_t	_boiler_fire;
void	disp_status_loop_init(void)
{
	uint8_t i;
	
	i = 0;
	if (_disp_mode == 0xff) {
		i = 1;
	}
	
	//	clear 
	lcd_clear(0);
	
	if ( i == 0) {
		ui_disp_temp_mark(1);
	}
	
	if (_disp_mode != _disp_mode2) {
		if( _disp_mode2 == 0x01 )	__sUp = 0;
		else if( _disp_mode2 == 0x08 )	__sUp = 1;
		else if( _disp_mode2 == 0x10 )	__sUp = 2;
		else if( _disp_mode2 == 0x04 )	__sUp = 5;
		else if( _disp_mode2 == 0x02 )	__sUp = 8;
	}
	
	disp_status_loop_message(__sUp);
	
	if ( i == 0) {
		if (_disp_mode == 0x01) {
			ui_disp_temp_curr(uiInfo.tCurr);
			ui_disp_temp_setup(uiInfo.tSetup);
		} else {
			disp_status_curr_only();
		}
	}

	lcd_blink_clear();
	lcd_disp_info_fire(_boiler_fire != 0 ? 1 : 0);
	
	if ( i == 1 ) {
		_key_blink = 1;
		_key_sec = KEY_BLINK_FADE;
	}
}

void	disp_status_curr_only(void)
{
	ui_disp_clear_tSetup(0);
	LCD_BIT_SET(bS1);
	LCD_BIT_SET(bC1);
	LCD_BIT_CLEAR(bCOL);
	ui_disp_temp_curr(uiInfo.tCurr);
}

void	disp_status_error(uint8_t key, uint8_t next)
{
	uint8_t	i;
	if( _dsCount == 0 )
	{
		disp_next();
		lcd_disp_err(ui_error);
		LCD_BIT_SET(bS11);
		lcd_blink_item(bS11);
	}
	else
	{
		if( uiInfo.enc != 0 )
		{
			goto Exit;
		}
	}
	
	if( key == 2 )
	{
Exit:		
		if( uiInfo.mode == 1 )
		{
			//	clear error
			func_rc_recover(1);
			error_type = 0;
			error = 0;
			lcd_blink_clear();
			STATUS_NEXT(next);
		}
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
			else if( i==5 )	
			{
				//lcd_disp_mir2();
				//lcd_disp_n(0, 4);
				//lcd_disp_n(1, 8);
				lcd_disp_n(2, 5);
			}
			else if( i==6 )	lcd_disp_freset();
			else if( i==7 )	lcd_disp_cnt_host();
			else if( i==8 )	lcd_disp_cnt_sub();
			else if( i==9 )	lcd_disp_n(3, 0);
		}
	}
	if( key == 3 )		
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
		case 4:
			func_rc_command(COMMAND_MODE_MIRROR, 1);   // 1: main, 0:sub	
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
			lcd_disp_n(1, debug_hn >> 4);
			lcd_disp_n(2, (debug_hn & 0x0F)/10);
			lcd_disp_n(3, (debug_hn & 0x0F)%10);
		}
		else
		{
			lcd_disp_n(1, debug_br >> 4);
			lcd_disp_n(2, (debug_br & 0x0F)/10);
			lcd_disp_n(3, (debug_br & 0x0F)%10);
		}
		_d485_id = _d485_id==0 ? 1 : 0;
	}
}

void	disp_statusCb(uint8_t key)
{
	uint8_t	t;
	if( _ds == 1 )			disp_status_id(key, 36);
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
		t = disp_status_run(key, 38, 2);
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
	else if( _ds == 31 )	disp_status_toffset(key, 32);	//	mainR/C only
	else if( _ds == 32 )	
	{
		t = disp_status_run(key, 35, 31);
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
	else if( _ds == 101 || _ds == 133 || _ds == 131 )
	{
		//	wait 1s and jume _ds-100
		_dsCount = __timer1s;
		_dsPrev = _ds - 100;
		_ds = 200;
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
		
		if( uiInfo.mode == 0 )	disp_status_loop_client(key);
		else
			disp_status_loop_host(key);
			
		//	error module
		if( error != 0 && error_type != 0 )
		{
			ui_error = error;
			_ds = 97;
			_dsCount = 0;
		}
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
	
	_backup_backlight = _backlight + 1;
	
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
			if( (_updateBit&BIT_TSETUP) != 0 )	{FW_TSETUP(uiInfo.tSetup);}
			if( (_updateBit&BIT_DISPMODE) != 0 ){
				if (uiInfo.mode == SETTING_MODE_SUB) {
					if (_disp_mode != RC_MODE_OUT) {
						FW_DISPMODE(_disp_mode);
					}
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

	if( key == _keypwMaster[_keypwIndexMaster] )
	{
		_keypwIndexMaster++;
		if( _keypwIndexMaster == 6 )
		{
			_keypwIndexMaster = 0;
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

	if( key == 0x88 )
	{
		uiInfo.enc = 0;
		if( uiInfo.mode == 0 )
			uiInfo.id = 2;
		//	133 for tOffset,
		//	101 for id + tOffset
		//		131 for tOffset Only
		copy_info(uiInfo.mode==0 ? 131 : 133);
	}
	else if( key == 0x89 && uiInfo.mode == 1 )
	{
		uiInfo.enc = 0;
		//	Cmd
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
	if( key == _keypwClient[_keypwIndexClient] )
	{
		_keypwIndexClient++;
		if( _keypwIndexClient == 6 )
		{
			_keypwIndexClient = 0;
			uiInfo.id = 2;
			uiInfo.mode = 0;
			copy_info(101);
		}
	}
	else
	{
		_keypwIndexClient = 0;
		if( key == _keypwClient[_keypwIndexClient] )
			_keypwIndexClient++;
	}
}

