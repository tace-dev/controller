#ifndef _FUNCTION_H_
#define _FUNCTION_H_
#include "stdafx.h"

#define PACKET_SIZE						16

#define TBL_V_SIZE						16

#define TBL_CALC_EVENT_TIMER	2	//	5sec
#define CNTL_LPM_SUB_NOTEXIST	7
#define CNTL_LPM_SUB					(funcInfo2.lpmType != CNTL_LPM_SUB_NOTEXIST)

typedef struct tagVtbl
{
	uint8_t	cmd[TBL_V_SIZE];		//	command
	uint8_t	coil[TBL_V_SIZE];		//	coil
	uint8_t	curr[TBL_V_SIZE];		//	temp curr
	uint8_t	setup[TBL_V_SIZE];		//	temp setup
	uint8_t	t[TBL_V_SIZE];			//	time 
//	uint8_t	valve[TBL_V_SIZE];		//	open range
	uint8_t	valve2rc[TBL_V_SIZE];	//	

	uint8_t	openCount[TBL_V_SIZE];	//	valve open
	uint8_t	openCount2[TBL_V_SIZE];	//	valve open

	uint8_t	ii[6];					//	valveCnt prev -> ii[1]
	
	uint8_t	_r[TBL_V_SIZE];		//	
	uint8_t	max;
	uint8_t	_result;
	uint8_t	_result2;
	uint8_t	cnt;				//	count roomC
	uint8_t	valveCnt;			//	valve count
	uint8_t	cs;					//	check sum
	uint8_t	cntlMode;			//	local/each
	
	uint8_t	relay;		//	0 - Nothing, 1 - Relay Control

	uint8_t	freeze[TBL_V_SIZE];	//	freeze status
	uint8_t	run[TBL_V_SIZE];	//	running status
	
	uint8_t	__k;		//	HouseValve in EACH Mode
}	VTBL;

typedef struct tagEvent
{
	uint8_t	id;
	uint8_t	mode;
	uint8_t	curr;
	uint8_t	set;
}	EVENT;

extern VTBL	vtbl;


typedef struct tagFunction {
	uint8_t	boiler_state;
	uint8_t	boiler_water_shower;
	uint8_t	boiler_water_heat;
	uint8_t	boiler_set_water_shower;
	uint8_t	boiler_set_water_heat;
	uint8_t boiler_type;
	uint8_t version;
	uint8_t subrcLock;
	uint8_t error;
	uint8_t error_type;
	
	uint8_t	relay;		//	0 - Nothing, 1 - Relay Control
	
	uint8_t cnt;
	uint8_t lpmType;
	uint8_t valve;
	uint8_t houseCapa;
	uint8_t poType;
	uint8_t cntlMode;
	uint8_t opMode;
	
	uint8_t rcLED;
	uint8_t sub_rcLED;
	
	uint8_t valve_rc[8];
	uint8_t valve_len[8];
	uint8_t plc;
}	FUNCINFO;

typedef struct tagHNCnt {
	uint8_t id;
	uint8_t mode;
	uint8_t setup_temp;
	uint8_t comm;
	uint8_t isChange;
} HNCNT;

typedef struct tagRCInfo {
	uint8_t curr_temp[8];
	uint8_t setup_temp[8];
	uint8_t mode[8];
	uint8_t _t[8];
} RCINFO;


#define U485_SIZE	80	//128
#define U485_SIZE_2	64

typedef struct tagU485Info
{
	uint8_t	t;
	uint8_t	tCount;
	uint8_t	i;
	uint8_t	ir;
	uint8_t	b[U485_SIZE];
	uint8_t	r[U485_SIZE];
	uint8_t	sendReady;
	uint8_t	sendCount;
	uint8_t	q;
}	U485INFO;

typedef struct tagU485Info_2
{
	uint8_t	t;
	uint8_t	tCount;
	uint8_t	i;
	uint8_t	ir;
	uint8_t	b[U485_SIZE_2];
	uint8_t	r[U485_SIZE_2];
	uint8_t	sendReady;
	uint8_t	sendCount;
	uint8_t	q;
}	U485INFO_2;

extern U485INFO	_ua;
extern U485INFO	_ub;
extern U485INFO_2	_uc;

#define _B					30

#define FW_CNTLMODE(i)		file_write(_B+0, i)		//	local/each
#define FW_MODE(i)			file_write(_B+1, i)		//	client/host
#define FW_CNT(i)			file_write(_B+2, i)		//	cnt
#define FW_OPMODE(i)		file_write(_B+3, i)		//	opMode
#define FW_CNT_MODE(i)		file_write(_B+4, i)		//	controlMode
#define FW_VALVE(i)			file_write(_B+5, i)		//	valve
#define FW_REPEAT(i)		file_write(_B+6, i)		//	repeat		+1
#define FW_RESERVE(i)		file_write(_B+7, i)		//	reserve		+2
#define FW_TSETUP(i)		file_write(_B+8, i)		//	setup		+3
#define FW_POTYPE(i)		file_write(_B+9, i)	//	potype
#define FW_HOUSECAPA(i)		file_write(_B+10, i)	//	houseCapa
#define FW_TOFFSET(i)		file_write(_B+11, i)	//	tOffset	

#define FW_VL_1(i)			file_write(_B+12, i)	//	valve len	
#define FW_VL_2(i)			file_write(_B+13, i)	//	valve len	
#define FW_VL_3(i)			file_write(_B+14, i)	//	valve len	
#define FW_VL_4(i)			file_write(_B+15, i)	//	valve len	
#define FW_VL_5(i)			file_write(_B+16, i)	//	valve len	
#define FW_VL_6(i)			file_write(_B+17, i)	//	valve len	
#define FW_VL_7(i)			file_write(_B+18, i)	//	valve len	
#define FW_VL_8(i)			file_write(_B+19, i)	//	valve len	

#define FW_VRC_1(i)			file_write(_B+20, i)	//	valve rc
#define FW_VRC_2(i)			file_write(_B+21, i)	//	valve rc
#define FW_VRC_3(i)			file_write(_B+22, i)	//	valve rc
#define FW_VRC_4(i)			file_write(_B+23, i)	//	valve rc
#define FW_VRC_5(i)			file_write(_B+24, i)	//	valve rc
#define FW_VRC_6(i)			file_write(_B+25, i)	//	valve rc
#define FW_VRC_7(i)			file_write(_B+26, i)	//	valve rc
#define FW_VRC_8(i)			file_write(_B+27, i)	//	valve rc

#define FW_B_SHOWER(i)		file_write(_B+28, i)	//	boiler water
#define FW_B_HEAT(i)		file_write(_B+29, i)	//	boiler heat
#define FW_LPM(i)			file_write(_B+30, i)	//	lpm
#define FW_SUBRCLOCK(i)			file_write(_B+31, i)	//	sub rc lock
#define FW_B_TYPE(i)			file_write(_B+32, i)	//	boiler type
#define FW_RELAY(i)			file_write(_B+41, i)	//	boiler type
#define FW_CNTTYPE(i)		file_write(_B+42, i)	//	cnt type M/S
#define FW_PLC(i)		file_write(_B+43, i)	//	plc type 

//
#define _C					130

#define FW2_CNTLMODE(i)		file_write(_C+0, i)		//	local/each
#define FW2_MODE(i)			file_write(_C+1, i)		//	client/host
#define FW2_CNT(i)			file_write(_C+2, i)		//	cnt
#define FW2_OPMODE(i)		file_write(_C+3, i)		//	opMode
#define FW2_CNT_MODE(i)		file_write(_C+4, i)		//	controlMode
#define FW2_VALVE(i)			file_write(_C+5, i)		//	valve
#define FW2_REPEAT(i)		file_write(_C+6, i)		//	repeat		+1
#define FW2_RESERVE(i)		file_write(_C+7, i)		//	reserve		+2
#define FW2_TSETUP(i)		file_write(_C+8, i)		//	setup		+3
#define FW2_POTYPE(i)		file_write(_C+9, i)	//	potype
#define FW2_HOUSECAPA(i)		file_write(_C+10, i)	//	houseCapa
#define FW2_TOFFSET(i)		file_write(_C+11, i)	//	tOffset	

#define FW2_VL_1(i)			file_write(_C+12, i)	//	valve len	
#define FW2_VL_2(i)			file_write(_C+13, i)	//	valve len	
#define FW2_VL_3(i)			file_write(_C+14, i)	//	valve len	
#define FW2_VL_4(i)			file_write(_C+15, i)	//	valve len	
#define FW2_VL_5(i)			file_write(_C+16, i)	//	valve len	
#define FW2_VL_6(i)			file_write(_C+17, i)	//	valve len	
#define FW2_VL_7(i)			file_write(_C+18, i)	//	valve len	
#define FW2_VL_8(i)			file_write(_C+19, i)	//	valve len	

#define FW2_VRC_1(i)			file_write(_C+20, i)	//	valve rc
#define FW2_VRC_2(i)			file_write(_C+21, i)	//	valve rc
#define FW2_VRC_3(i)			file_write(_C+22, i)	//	valve rc
#define FW2_VRC_4(i)			file_write(_C+23, i)	//	valve rc
#define FW2_VRC_5(i)			file_write(_C+24, i)	//	valve rc
#define FW2_VRC_6(i)			file_write(_C+25, i)	//	valve rc
#define FW2_VRC_7(i)			file_write(_C+26, i)	//	valve rc
#define FW2_VRC_8(i)			file_write(_C+27, i)	//	valve rc

#define FW2_B_SHOWER(i)		file_write(_C+28, i)	//	boiler water
#define FW2_B_HEAT(i)		file_write(_C+29, i)	//	boiler heat
#define FW2_LPM(i)			file_write(_C+30, i)	//	lpm
#define FW2_SUBRCLOCK(i)			file_write(_C+31, i)	//	sub rc lock
#define FW2_B_TYPE(i)			file_write(_C+32, i)	//	boiler type

#define FW2_MT_1(i)			file_write(_C+33, i)	//	mt	
#define FW2_MT_2(i)			file_write(_C+34, i)	//	mt
#define FW2_MT_3(i)			file_write(_C+35, i)	//	mt
#define FW2_MT_4(i)			file_write(_C+36, i)	//	mt
#define FW2_MT_5(i)			file_write(_C+37, i)	//	mt
#define FW2_MT_6(i)			file_write(_C+38, i)	//	mt
#define FW2_MT_7(i)			file_write(_C+39, i)	//	mt
#define FW2_MT_8(i)			file_write(_C+40, i)	//	mt

#define FW2_RELAY(i)			file_write(_C+41, i)	//	boiler type
#define FW2_CNTTYPE(i)		file_write(_C+42, i)	//	cnt type M/S
#define FW2_PLC(i)				file_write(_C+43, i)	//	plc type 
//

#define FW_GET_CNTLMODE		file_read(_B+0)
#define FW_GET_MODE			file_read(_B+1)
#define FW_GET_CNT			file_read(_B+2)
#define FW_GET_OPMODE		file_read(_B+3)
#define FW_GET_CNT_MODE		file_read(_B+4)
#define FW_GET_VALVE		file_read(_B+5)
#define FW_GET_REPEAT		file_read(_B+6)
#define FW_GET_RESERVE		file_read(_B+7)
#define FW_GET_TSETUP		file_read(_B+8)
#define FW_GET_POTYPE		file_read(_B+9)
#define FW_GET_HOUSECAPA	file_read(_B+10)
#define FW_GET_TOFFSET		file_read(_B+11)

#define FW_GET_VL_1			file_read(_B+12)	//	valve len	
#define FW_GET_VL_2			file_read(_B+13)	//	valve len	
#define FW_GET_VL_3			file_read(_B+14)	//	valve len	
#define FW_GET_VL_4			file_read(_B+15)	//	valve len	
#define FW_GET_VL_5			file_read(_B+16)	//	valve len	
#define FW_GET_VL_6			file_read(_B+17)	//	valve len	
#define FW_GET_VL_7			file_read(_B+18)	//	valve len	
#define FW_GET_VL_8			file_read(_B+19)	//	valve len	

#define FW_GET_VRC_1		file_read(_B+20)	//	valve rc
#define FW_GET_VRC_2		file_read(_B+21)	//	valve rc
#define FW_GET_VRC_3		file_read(_B+22)	//	valve rc
#define FW_GET_VRC_4		file_read(_B+23)	//	valve rc
#define FW_GET_VRC_5		file_read(_B+24)	//	valve rc
#define FW_GET_VRC_6		file_read(_B+25)	//	valve rc
#define FW_GET_VRC_7		file_read(_B+26)	//	valve rc
#define FW_GET_VRC_8		file_read(_B+27)	//	valve rc

#define FW_GET_B_SHOWER		file_read(_B+28)	//	boiler water
#define FW_GET_B_HEAT		file_read(_B+29)	//	boiler heat
#define FW_GET_LPM			file_read(_B+30)	//	lpm
#define FW_GET_SUBRCLOCK	file_read(_B+31)	//	subrclock
#define FW_GET_B_TYPE		file_read(_B+32)	//	boiler type
#define FW_GET_RELAY		file_read(_B+41)	//	relay
#define FW_GET_CNTTYPE		file_read(_B+42)	//	cnttype
#define FW_GET_PLC		file_read(_B+43)	//	plctype
//

#define FW2_GET_CNTLMODE		file_read(_C+0)
#define FW2_GET_MODE			file_read(_C+1)
#define FW2_GET_CNT			file_read(_C+2)
#define FW2_GET_OPMODE		file_read(_C+3)
#define FW2_GET_CNT_MODE		file_read(_C+4)
#define FW2_GET_VALVE		file_read(_C+5)
#define FW2_GET_REPEAT		file_read(_C+6)
#define FW2_GET_RESERVE		file_read(_C+7)
#define FW2_GET_TSETUP		file_read(_C+8)
#define FW2_GET_POTYPE		file_read(_C+9)
#define FW2_GET_HOUSECAPA	file_read(_C+10)
#define FW2_GET_TOFFSET		file_read(_C+11)

#define FW2_GET_VL_1			file_read(_C+12)	//	valve len	
#define FW2_GET_VL_2			file_read(_C+13)	//	valve len	
#define FW2_GET_VL_3			file_read(_C+14)	//	valve len	
#define FW2_GET_VL_4			file_read(_C+15)	//	valve len	
#define FW2_GET_VL_5			file_read(_C+16)	//	valve len	
#define FW2_GET_VL_6			file_read(_C+17)	//	valve len	
#define FW2_GET_VL_7			file_read(_C+18)	//	valve len	
#define FW2_GET_VL_8			file_read(_C+19)	//	valve len	

#define FW2_GET_VRC_1		file_read(_C+20)	//	valve rc
#define FW2_GET_VRC_2		file_read(_C+21)	//	valve rc
#define FW2_GET_VRC_3		file_read(_C+22)	//	valve rc
#define FW2_GET_VRC_4		file_read(_C+23)	//	valve rc
#define FW2_GET_VRC_5		file_read(_C+24)	//	valve rc
#define FW2_GET_VRC_6		file_read(_C+25)	//	valve rc
#define FW2_GET_VRC_7		file_read(_C+26)	//	valve rc
#define FW2_GET_VRC_8		file_read(_C+27)	//	valve rc

#define FW2_GET_B_SHOWER		file_read(_C+28)	//	boiler water
#define FW2_GET_B_HEAT		file_read(_C+29)	//	boiler heat
#define FW2_GET_LPM			file_read(_C+30)	//	lpm
#define FW2_GET_SUBRCLOCK	file_read(_C+31)	//	subrclock
#define FW2_GET_B_TYPE		file_read(_C+32)	//	boiler type

#define FW2_GET_MT_1		file_read(_C+33)	//	mt	
#define FW2_GET_MT_2		file_read(_C+34)	//	mt
#define FW2_GET_MT_3		file_read(_C+35)	//	mt
#define FW2_GET_MT_4		file_read(_C+36)	//	mt
#define FW2_GET_MT_5		file_read(_C+37)	//	mt
#define FW2_GET_MT_6		file_read(_C+38)	//	mt
#define FW2_GET_MT_7		file_read(_C+39)	//	mt
#define FW2_GET_MT_8		file_read(_C+40)	//	mt

#define FW2_GET_RELAY		file_read(_C+41)	//	relay
#define FW2_GET_CNTTYPE		file_read(_C+42)	//	cnttype
#define FW2_GET_PLC		file_read(_C+43)	//	plctype

extern FUNCINFO funcInfo;
extern FUNCINFO funcInfo2;
extern RCINFO rcInfo;
extern HNCNT hnCnt;
extern HNCNT hnCnts[8];

void func_cnt_calcInfo(uint8_t id, uint8_t mode, uint8_t curr, uint8_t set);
void func_cnt_factory(uint8_t idx);
void func_cnt_mirror(uint8_t idx);
void func_cnt_endMirror(void);
void func_cnt_hotwater(uint8_t idx);
void func_cnt_reset(uint8_t idx);
void func_cnt_errorReset(void);
void func_cnt_error(uint8_t type, uint8_t code);

extern uint8_t	cntGetType(void);

#endif
