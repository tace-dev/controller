#include "stdafx.h"
#include "mtDef.h"
#include "function.h"
#include "cnt_protocol.h"
/*
 *	TOOL_ENABLE
 */
//#define TOOL_ENABLE	

#define TOOL_SIZE		48

uint8_t	_ts = 0;
uint8_t	_ts2 = 0;
uint8_t	_tsSize = 8;
uint8_t	_tsCurr = 0;
uint8_t	_tsCurrClear = 0;
uint8_t	_tsId = 0;
uint8_t	_tsCapa = 0;

uint8_t	_tsMotor[8];
uint8_t	_tsCntlHead = 0;
uint8_t	_tsCntlTail = 0;

uint16_t	_tsCntl[TOOL_SIZE];

extern void	_disp_int(uint8_t i);

uint8_t	tsPos = 0;
uint8_t	tsid = 0;

void	toolSetPos(uint8_t pos, uint8_t id)
{
	tsPos = pos;
	tsid = id;
}

void	toolSetPush(uint8_t id, uint8_t capa, uint8_t cntl)
{
	uint8_t	tail;
	uint8_t	head;
	uint8_t		_i;
	uint16_t	id16;
	uint16_t	i;
	i = id << 12;
	i |= cntl << 8;
	i |= capa;
		
	switch( cntl )
	{
	case	TS_CLOSE:
	case	TS_CLOSE_2P:
	case	TS_CLOSE_TAB:
		break;
	default:
		goto SET_ENTRY;
	}
		
	tail = _tsCntlTail;
	head = _tsCntlHead;
	while( tail != head )
	{
		id16 = _tsCntl[tail];
		_i = (id16>>12) & 0xff;
		if( _i == id )
			_tsCntl[tail] = 0;
		tail++;
		if( tail == TOOL_SIZE )
			tail = 0;
	}
	
SET_ENTRY:	
	_tsCntl[_tsCntlHead++] = i;
	if( _tsCntlHead == TOOL_SIZE )
		_tsCntlHead = 0;
}

uint16_t	toolSetPop(void)
{
	uint16_t	i;
	i = _tsCntl[_tsCntlTail++];
	if( _tsCntlTail == TOOL_SIZE )
		_tsCntlTail = 0;	
	return i;
}

/*
 *
 */
void	toolMtSetSize(uint8_t i) 	{ _tsSize = i; }

#define MT_INC(i)	i++;\
					if(i == _tsSize)\
						i = 0;

uint8_t	timeGetCurrent(void)
{
	return __timer1s;
}

uint8_t	timeGetDiff(uint8_t curr, uint8_t t)
{
	if( curr > t )
		return curr-t;
	return curr+60 - t;
}

uint8_t	_mt_timer0 = 0;

#define MT_CLEAR_BUFFER		_tsCntlTail = _tsCntlHead = 0

#define MT_TIMER_WAIT t = timeGetDiff(timeGetCurrent(), _mt_timer0);\
				if( t < 8 )	return;\
				_mt_timer0 = timeGetCurrent();
			

extern uint8_t	_mc_i;

void	toolMt2Operate(void)
{
#if TOOL_ENABLE_2OP
	uint8_t	t;
	if( _ts == 0 )
	{
		_ts = 10;
		_tsCurr = 0;
		_tsCurrClear = 0;
		MT_CLEAR_BUFFER;
	}
	else if( _ts == 10 )
	{
		if( mt_Ready() == 1 )
			_ts = 1;
	}
	else if( _ts == 1 )
	{
		MT_TIMER_WAIT
		toolSetPush(_tsCurr, 1, TS_OPEN); 
		MT_INC(_tsCurr)
		_ts = _tsCurr==0 ? 10 : 2;
	}
	else if( _ts == 2 )
	{
		MT_TIMER_WAIT
		toolSetPush(_tsCurr, 1, TS_OPEN); 
		MT_INC(_tsCurr)
		_ts = _tsCurr==0 ? 20 : 3;
	}
	else if( _ts == 3 )
	{
		MT_TIMER_WAIT
		if( _tsCurr != 0 )
		{
			toolSetPush(_tsCurr, 1, TS_OPEN); 
			MT_INC(_tsCurr)
		}
		_ts = 4;
	}	
	else if( _ts == 4 )
	{
		MT_TIMER_WAIT
		toolSetPush(_tsCurrClear, 1, TS_CLOSE_2P); 
		MT_INC(_tsCurrClear)
		_ts = 3;
	}
	else if( _ts == 10 )
	{
		MT_TIMER_WAIT
		toolSetPush(_tsCurr, 1, TS_CLOSE_2P); 
		_ts = 11;
	}
	else if( _ts == 11 )
	{
		MT_TIMER_WAIT
		toolSetPush(_tsCurr, 1, TS_OPEN); 
		_ts = 10;
	}
	else if( _ts == 20 )
	{
		MT_TIMER_WAIT
		_tsCurr = 0;
		toolSetPush(_tsCurr, 1, TS_CLOSE_2P); 
		_ts = 21;
	}
	else if( _ts == 21 )
	{
		MT_TIMER_WAIT
		toolSetPush(_tsCurr, 1, TS_OPEN); 
		_ts = 22;
	}
	else if( _ts == 22 )
	{
		MT_TIMER_WAIT
		_tsCurr = 1;
		toolSetPush(_tsCurr, 1, TS_CLOSE_2P); 
		_ts = 23;
	}
	else if( _ts == 23 )
	{
		MT_TIMER_WAIT
		toolSetPush(_tsCurr, 1, TS_OPEN); 
		_ts = 20;
	}
	else if( _ts == 99 )
	{
		_ts = 98;
		_tsCurr = 0;
	}
	else if( _ts == 98 )
	{
		if( _tsCurr != _tsSize )
		{
			toolSetPush(_tsCurr, 1, TS_CLOSE_2P); 
			MT_INC(_tsCurr);
		}
		else
			_ts = 96;
	}
	else if( _ts == 96 )
	{
	}
#endif
}

extern uint8_t	tbl_predict[];

uint8_t	toolMtTab(void)
{
#if TOOL_ENABLE_TAB
	uint8_t	i;
	if( _ts == 0 )
	{
		_ts = 1;
		MT_CLEAR_BUFFER;
	}
	else if( _ts == 1 )
	{
		if( mt_Ready() == 1 )
			_ts = 2;
	}
	else if( _ts == 2 )
	{
		if( vtbl.curr[0] >= vtbl.setup[0] )
			_ts = 11;
		else
			_ts = 20;
			
		//	Open One
		if( cntGetType() == 0 && funcInfo.cntlMode == 1 )
			toolSetPush(i, 0, TS_OPEN);
	}
	else if( _ts == 10 )
	{
		if( __mt_enable == 1 )
			return 0;
			
		//	close
		if( cntGetType() == 0 )
		{
			if( funcInfo.cntlMode == 0 && funcInfo.lpmType != 0 )
			{
				toolSetPush(funcInfo.valve, 0, TS_CLOSE_2P);	
			}
			for( i=1; i<funcInfo.valve; i++ )
				toolSetPush(i, 0, TS_CLOSE);
		}
		else
		{
			if( funcInfo.cntlMode == 0 )
			{
				if( funcInfo2.lpmType != 0 && CNTL_LPM_SUB )
					toolSetPush(funcInfo2.valve, 0, TS_CLOSE_2P);	
			}
			for( i=0; i<funcInfo2.valve; i++ )
				toolSetPush(i, 0, TS_CLOSE);
		}
		funcInfo.rcLED = 0;
		_ts = 11;
	}
	else if( _ts == 11 )
	{
		//	to open
		if( vtbl.curr[0]+2 <= vtbl.setup[0] )
			_ts = 20;
	}
	else if( _ts == 20 )
	{
		if( __mt_enable == 1 )
			return 0;
			
		//	open
		if( cntGetType() == 0 )
		{
			if( funcInfo.cntlMode == 0 && funcInfo.lpmType != 0 )
				toolSetPush(funcInfo.valve, 
					tbl_predict[funcInfo.houseCapa/2], 
					TS_CNTL_PLUS
					);	
			for( i=1; i<funcInfo.valve; i++ )
				toolSetPush(i, 0, TS_OPEN);
		}
		else
		{
			if( funcInfo.cntlMode == 0 && funcInfo2.lpmType != 0 && CNTL_LPM_SUB )
				toolSetPush(funcInfo2.valve, 
					tbl_predict[funcInfo2.houseCapa/2], 
					TS_CNTL_PLUS
					);	
			for( i=0; i<funcInfo2.valve; i++ )
				toolSetPush(i, 0, TS_OPEN);
		}
		funcInfo.rcLED = 1;
		_ts = 21;
	}
	else if( _ts == 21 )
	{
		//	to close
		if( vtbl.curr[0] >= vtbl.setup[0] )
			_ts = 10;
	}
	return 1;
#endif
}

extern uint8_t	__mt_closeflag;
extern uint8_t	__mt_closereset;

extern uint8_t	__mt_overrun;
extern uint8_t	__mt_overrunCount;

extern uint8_t	packet_buf[];

void	toolErrorClear(void)
{
	uint8_t	i;
	for( i=0; i<TBL_V_SIZE; i++ )
	{
		__mt_closeError[i] = 0;
		vtbl.openCount[i] = 0;
		vtbl.openCount2[i] = 0;
	}
		
	for( i=0; i<PACKET_SIZE; i++ )
		packet_buf[i] = 0;
	
	vtbl._result2 = 0;
	_tsCntlTail = _tsCntlHead;
}

void	toolErrorCheck(void)
{
	uint8_t	i, k;
	if( cntGetType() == 0 )	
	{
		for( i=0; i<TBL_V_SIZE/2; i++ )
		{
			//	if RoomCon disconnected, skip error
			if( funcInfo.valve_rc[i] == 0 )
				continue;
				
			if( __mt_closeError[i] == 100 )
			{
				func_cnt_error(ERROR_TYPE_CNT, 10 + (i+1));
				__mt_closeError[i] = 101;
			}
			else if( __mt_closeError[i] == 200 )
			{
				func_cnt_error(ERROR_TYPE_CNT, 50 + (i+1));
				__mt_closeError[i] = 105;
			}
			else if( __mt_closeError[i] == 210 )
			{
				//	motor origin error
				func_cnt_error(ERROR_TYPE_CNT, /*30 + (i+1)*/19);
				__mt_closeError[i] = 106;
			}
			else if( __mt_closeError[i] == 220 )
			{
				//	packet timeout error
				func_cnt_error(ERROR_TYPE_CNT, 5);
				__mt_closeError[i] = 108;
			}
		}
		if( funcInfo.boiler_type == 1 /*vtbl.cntlMode != 0 && funcInfo.lpmType != 0*/ )
		{
			if( __mt_closeError[funcInfo.valve] == 100 )
			{
				func_cnt_error(ERROR_TYPE_CNT, 20 + funcInfo.valve);
				__mt_closeError[funcInfo.valve] = 102;
			}
			else if( __mt_closeError[funcInfo.valve] == 200 )
			{
				func_cnt_error(ERROR_TYPE_CNT, 30 + funcInfo.valve);
				__mt_closeError[funcInfo.valve] = 106;
			}
			else if( __mt_closeError[funcInfo.valve] == 210 )
			{
				func_cnt_error(ERROR_TYPE_CNT, /*30 + (i+1)*/19);
				__mt_closeError[funcInfo.valve] = 106;
			}
			else if( __mt_closeError[funcInfo.valve] == 220 )
			{
				func_cnt_error(ERROR_TYPE_CNT, 5);
				__mt_closeError[funcInfo.valve] = 108;
			}
		}
	}
	else
	{
		for( i=0; i<funcInfo2.valve; i++ )
		{
			if( __mt_closeError[i] == 100 )
			{
				func_cnt_error(ERROR_TYPE_CNT, 20 + (i+1));
				__mt_closeError[i] = 103;
			}
		}
		if( vtbl.cntlMode != 0 && funcInfo2.lpmType != 0 )
		{
			if( __mt_closeError[i+1] == 100 )
			{
				func_cnt_error(ERROR_TYPE_CNT, 20 + (funcInfo2.valve + 1));
				__mt_closeError[i+1] = 104;
			}
		}
	}
}

extern PKTINFO _pkt;
extern uint8_t	plc3_NotReady(void);
extern void	p3_push(PKTINFO *p);
//#define PKT(_id,_pos,_cmd)	_pkt.id=_id; _pkt.pos=MT_STEP(_pos); _pkt.cmd=_cmd;
#define PKT(_id,_pos,_cmd)	_pkt.pos=_pos; 

uint8_t	p3pushFlag = 0;

void	_plc_toolMtLoop(uint16_t i)
{
#if defined (_PLC_)
	uint8_t		j;
	uint8_t		id, cntl;
//	uint8_t		capa;
//	capa = (uint8_t)(i&0xff);
	id = (uint8_t)((i>>12)&0xff);
	cntl = (uint8_t)((i>>8)&0x0f);
	id += 1;
	
	j = cntGetType() == 0 ? funcInfo.valve : funcInfo2.valve;
	if( j == 0 )
	{
		//	PLC ONLY
	}
	else
	{
		//	HOUSE VALVE
		id = 1;
	}
	
	if( cntl == TS_CLOSE )			{	PKT(id, 0, 9);	}
	else if( cntl == TS_CLOSE_2P )	{	PKT(id, 0, 9);	}
	else if( cntl == TS_CLOSE_TAB )	{	PKT(id, 0, 9);	}
	else if( cntl == TS_OPEN )		{	PKT(id, 200, 9);	}
	else if( cntl == TS_CNTL )	{	}
	else if( cntl == TS_CNTL_PLUS ){	PKT(id, tsPos, 9);	}
	else if( cntl == TS_CNTL_MINUS ){	PKT(id, tsPos, 9);	}
	else if( cntl == TS_CNTL_OPEN )	{	PKT(id, 200, 9);	}
	else if( cntl == TS_CNTL_MOVE )	{	PKT(id, tsPos, 9);	}
	else if( cntl == TS_CNTL_LARGE ){	PKT(id, tsPos, 9);	}
	else if( cntl == TS_CNTL_SMALL ){	PKT(id, tsPos, 9);	}
	else
	{
		PKT(id, tsPos, 9);
		j = 1;	//	Not Defined Error
	}
	_pkt.id = id;
	_pkt.cmd = 9;
	p3_push(&_pkt);

	p3pushFlag = 1;
#endif
}

extern uint8_t	mt_plc_mode;
uint8_t	_plc_run = 0;

void	toolMtLoop(uint8_t cmd)
{
	uint8_t		j, k;
	uint16_t	i;
	uint8_t		id, capa, cntl;
	uint16_t	capaStep;
/*
*/	
	toolErrorCheck();
	if( __mt_enable == 1 )
		return;
	/*
	*/
	if( _tsCntlTail == _tsCntlHead )
		return;

	if(	p3pushFlag == 1 )
	{
		//	clear _plc3Loop@ext_plc.c
		return;
	}

	i = toolSetPop();
	if( i == 0 )
		return;
/*	
	if( plc3_NotReady() == 0 )
	{
		_plc_run = 1;
		_plc_toolMtLoop(i);
		return;
	}
	if( _plc_run == 1 )
		return;
*/

	capa = (uint8_t)(i&0xff);
	id = (uint8_t)((i>>12)&0xff);
	cntl = (uint8_t)((i>>8)&0x0f);
	id += 1;
	__mt_closeflag = 0;
	
		j = cntGetType() == 0 ? funcInfo.valve : funcInfo2.valve;
		if( j == 0 )
		{
PLC_ENTRY:
			//	PLC Only
//			__mt_enable = 1;
			_plc_toolMtLoop(i);
			return;
		}
		else
		{
			if( mt_plc_mode == 111 )
			{
				//	PLC Ready
				//	HOUSE VALVE
				if( id > j )
				{
					goto PLC_ENTRY;
				}
				//	MT
			}
			else
			{
				//	MT Only
			}
		}
	//	Code Optimize
	capaStep = MT_STEP(capa);
	
	if( cntl == TS_CLOSE )
	{
		__mt_closeflag = 1;
		__mt_closereset = 1;
		mt_run(id, 0, MT_CLOSE_OFFSET);
	}
	/*
	else if( cntl == TS_CLOSE2 )
	{
		__mt_closeflag = 1;
		__mt_closereset = 1;
		mt_run(id, 0, MT_CLOSE_OFFSET2);
	}
	*/
	else if( cntl == TS_CLOSE_2P )	
	{	
		__mt_closeflag = 1;
		__mt_closereset = 1;
		mt_run(id, 0, MT_CLOSE_OFFSET);
	}
	else if( cntl == TS_CLOSE_TAB )	{	mt_run(id, 0, MT_CLOSE_OFFSET);}
	else if( cntl == TS_OPEN )		{	mt_run(id, 1, MT_OPEN_OFFSET);	}
	else if( cntl == TS_CNTL )
	{
	}
	else if( cntl == TS_CNTL_PLUS )
	{
		__mt_overrun = 1;
		__mt_overrunCount = MT_OVERRUN_OFFSET;
		i = MT_OVERRUN_OFFSET + capaStep;
		mt_run(id, 1, i);
	}
	else if( cntl == TS_CNTL_MINUS )
	{
		mt_run(id, 0, capaStep);
	}
	else if( cntl == TS_CNTL_OPEN )
	{
		__mt_overrun = 1;
		__mt_overrunCount = MT_OVERRUN_OFFSET;
		i = MT_OVERRUN_BASE - capaStep;
		mt_run(id, 1, i);
	}
	else if( cntl == TS_CNTL_MOVE )
	{
		i = MT_OPEN_OFFSET - capaStep;
		mt_run(id, 0, i);
	}
	else if( cntl == TS_CNTL_LARGE )
	{
		mt_run(id, 1, capaStep);
	}
	else if( cntl == TS_CNTL_SMALL )
	{
		mt_run(id, 0, capaStep);
	}
}

