#include "stdafx.h"
#include "function.h"
#include "cnt_protocol.h"
#include "br_protocol.h"
#include "mtDef.h"

uint8_t	debug_enable_vtbl = 0;
uint8_t	debug_enable_cnt = 0;

uint8_t	b[10];

#define D_	uart3_tx_put
#define PR(i)	b[0] = i/10+'0';\
				b[1] = i%10+'0';\
				b[2] = ' ';\
				D_(b, 3);

extern uint8_t	_tsCntlTail;
extern uint8_t	_tsCntlHead;
extern uint8_t	packet_buf[];

extern void	toolSetPos(uint8_t pos, uint8_t id);
extern void cnt_chnage_rc_set(int room);

void	_disp_int(uint8_t ch)
{
	uint8_t	buf[3];
	uint8_t i, j, k;

	j = 0;
	i = ch / 100;
	if( i != 0 )
	{
		buf[0] = '0' + i;
		D_(buf, 1);
		j = 1;
	}
	else if( j == 1 )
	{
		buf[0] = '0';
		D_(buf, 1);
	}	
	k = ch % 100;
	i = k / 10; 
	if( i != 0 )
	{
		buf[0] = '0' + i;
		D_(buf, 1);
		j = 1;
	}
	else if( j == 1 )
	{
		buf[0] = '0';
		D_(buf, 1);
	}
	i = ch % 10;
	buf[0] = '0' + i;
	D_(buf, 1);
	D_(" ", 1);
}
				
EVENT	ev;
VTBL	vtbl;

extern uint8_t	tbl_temp[];
extern uint8_t	calc_final(void);

void	vtbl_init(void)
{
	uint8_t	i;
	for( i=0; i<TBL_V_SIZE; i++ )
	{
		vtbl.openCount[i] = 0;
		vtbl.openCount2[i] = 0;
		vtbl.curr[i] = 0x11;
		vtbl.setup[i] = 0x10;
		tbl_temp[i] = 0;
		vtbl.freeze[i] = 0;
		vtbl.run[i] = 0;
	}
	vtbl.__k = 0xfe;
}

uint8_t	vtbl_set(uint8_t cmd)
{
	uint8_t	i;
	uint8_t	j = 0;
	uint8_t	k;
	for( i=0; i<TBL_V_SIZE; i++ )
	{
		/*
			if rc==0(Not Connected Motor), then assign RC's data
		 */
		if( vtbl.valve2rc[i] == 0 )
		{
			if( ev.id-1 == i )
			{
				goto OFF_MOTOR_ENTRY;
			}
		}
		if( vtbl.valve2rc[i] == ev.id )
		{
OFF_MOTOR_ENTRY:
			k = 0;
			if( vtbl.curr[i] != ev.curr )
				k = 1;
			if( vtbl.setup[i] != ev.set )
				k = 1;
			if( k == 1 )
			{
				vtbl.curr[i] = ev.curr;
				vtbl.setup[i] = ev.set;
				vtbl.cmd[i] = ev.mode;
				vtbl.t[i] = TBL_CALC_EVENT_TIMER;
				j++;
			}
		}
	}	
	for( i=0; i<PACKET_SIZE; i++ )
	{
		if( packet_buf[i] == PACKET_ERROR_COUNT )
		{
			for( k=0; k<TBL_V_SIZE; k++ )
			{
				if( vtbl.valve2rc[k] == (i+1) )
				{
					vtbl.curr[k] = 0x80;
					vtbl.setup[k] = 0x40;
				}
			}
		}
		if( __mt_closeError[i] >= 100 )
		{
			vtbl.curr[i] = 0x81;
			vtbl.setup[i] = 0x41;
			vtbl.t[i] = 0;
		}
	}
	return j;
}

uint8_t	vtbl_calc(uint8_t cmd)
{
	uint8_t	i;
	uint8_t	j;
	uint8_t	q;
	for( i=0; i<TBL_V_SIZE; i++ )
	{
		if( vtbl.run[i] == 0 )
		{
			if( vtbl.curr[i] < vtbl.setup[i] )
			{
				j = vtbl.setup[i] - vtbl.curr[i];
				if( j >= 10 )		tbl_temp[i] = 100;
				else if( j >= 6 )	tbl_temp[i] = 100;
				else if( j == 5 )	tbl_temp[i] = 100;
				else if( j == 4 )	tbl_temp[i] = 100;
				else if( j == 3 )	tbl_temp[i] = 100;
				else if( j == 2 )	tbl_temp[i] = 100;
				else if( j == 1 )	tbl_temp[i] = 0;	
				else
					tbl_temp[i] = 0;
					
				if( tbl_temp[i] != 0 )
					vtbl.run[i] = 1;
			}
			else
				tbl_temp[i] = 0;
		}
		else
		{
			if( vtbl.curr[i] < vtbl.setup[i] )
			{
				j = vtbl.setup[i] - vtbl.curr[i];
				if( j >= 10 )		tbl_temp[i] = 100;
				else if( j >= 6 )	tbl_temp[i] = 100;
				else if( j == 5 )	tbl_temp[i] = 100;
				else if( j == 4 )	tbl_temp[i] = 100;
				else if( j == 3 )	tbl_temp[i] = 100;
				else if( j == 2 )	tbl_temp[i] = 100;
				else if( j == 1 )	tbl_temp[i] = 100;	
				else
					tbl_temp[i] = 0;
					
				if( tbl_temp[i] == 0 )
					vtbl.run[i] = 0;
			}
			else
			{
				tbl_temp[i] = 0;
				vtbl.run[i] = 0;
			}
		}
		if( vtbl.freeze[i] == 0 )
		{
			if( vtbl.curr[i] <= 10 )
			{
				vtbl.freeze[i] = 1;
				tbl_temp[i] = 100;
			}
		}
		else if( vtbl.freeze[i] == 1 )
		{
			//	on
			tbl_temp[i] = 100;
			if( vtbl.curr[i] >= 14 )
			{
				//	off
				vtbl.freeze[i] = 0;
				tbl_temp[i] = 0;
			}
		}
	}
	for( i=0; i<TBL_V_SIZE; i++ )
	{
		if( vtbl.valve2rc[i] == 0 )
		{
			vtbl.curr[i] = 0;
			vtbl.setup[i] = 0;
			tbl_temp[i] = 0;
		}
	}
	
	funcInfo.rcLED = 0;
	for( i=0; i<TBL_V_SIZE; i++ )
	{
		if( tbl_temp[i] != 0 )
		{
			funcInfo.rcLED |= 1<<(vtbl.valve2rc[i]-1);
		}
	}
	if( vtbl.cntlMode == 0 && funcInfo2.lpmType==7 )
	{
		//	Local Mode + Sub Cntl
		//	Sub Controller Have Not House Valve(+99)
		return 0;
	}
	if( vtbl.cntlMode == 1 && funcInfo2.lpmType==7 )
	{
		//	Each Mode + Sub Cntl
		//	Sub Controller Have Not House Valve(+99)
		return 0;
	}
	for( i=0; i<TBL_V_SIZE; i++ )
	{
		if( cntGetType() == 0 )
		{
			if( i >= TBL_V_SIZE/2 )
			{
				vtbl.coil[i] = 0;
				tbl_temp[i] = 0;
			}
		}
		else
		{
			if( i < TBL_V_SIZE/2 )
			{
//				vtbl.curr[i] = 0;
//				vtbl.setup[i] = 0;
				vtbl.coil[i] = 0;
				tbl_temp[i] = 0;
			}
		}
	}
	return 0;
}

uint8_t	vtbl_getCoilLarge(void)
{
	uint8_t	i, j;
	j = 0;
	for( i=1; i<TBL_V_SIZE; i++ )
	{
		if( vtbl.coil[i] > vtbl.coil[j] )
			j = i;
	}
	return j;
}

//	relay - main.c
//
extern void	relayCntl(uint8_t i);
uint8_t	iOpen, iClose;

void	vtbl_disp(uint8_t id)
{
	uint8_t	i;

	if( debug_enable_vtbl != 1 )
		return;
		
	if( id == 0 )
	{
		D_("\r\nOC=", 5);
		_disp_int(iOpen);
		D_(": ", 2);
		_disp_int(iClose);
	}
	else if( id == 1 )
	{
		D_("L", 1);
		_disp_int(i);
	}
	else if( id == 2 )
	{
		D_("S", 1);
		_disp_int(i);
	}
	else if( id == 3 )
	{
		D_("SAME\r\n", 6);
	}
	else if( id == 4 )
	{
		D_("\r\n-", 3);	
		for( i=0; i<TBL_V_SIZE; i++ )
		{
			D_("/", 1);
			_disp_int(vtbl._r[i]);
		}
		D_("\\", 1);
		_disp_int(vtbl._result);
		D_("\r\n", 2);
	}
	
}

void	vtbl_local_sub(void)
{
	uint8_t	i, j, k;
	for( i=0; i<funcInfo2.valve; i++ )
	{
		k = i + TBL_V_SIZE/2;
//		toolSetPos(0, i);
		if( vtbl.openCount[k] != 0 )
		{
			if( vtbl.openCount2[k] != 200 )
				toolSetPush(i, vtbl.openCount2[k], TS_CNTL_OPEN);
		}
	}				
	k = TBL_V_SIZE/2;
	if( funcInfo2.lpmType != 0 && CNTL_LPM_SUB )
	{
		if( __mt_closeError[funcInfo2.valve + k] >= 100 )
			goto ValveEntry;
			
//		toolSetPos(vtbl._result, funcInfo2.valve);
		if( vtbl._result2 > vtbl._result )
		{
			if( vtbl._result == 0 )
				toolSetPush(funcInfo2.valve, 1, TS_CLOSE_2P);
			else
			{
				j = vtbl._result2 - vtbl._result;
				toolSetPush(funcInfo2.valve, j, TS_CNTL_MINUS);
			}
		}
		else if( vtbl._result2 == vtbl._result )
		{
		}
		else 
		{
			j = vtbl._result - vtbl._result2;
			toolSetPush(funcInfo2.valve, j, TS_CNTL_PLUS);
		}
	}
ValveEntry:	
	for( i=0; i<funcInfo2.valve; i++ )
	{
		k = i + TBL_V_SIZE/2;
//		toolSetPos(vtbl.openCount[k], k);
		if( vtbl.openCount[k] == 0 )
		{
			if( vtbl.openCount2[k] != 0 )
				toolSetPush(i, 1, TS_CLOSE);
		}
		else
			toolSetPush(i, vtbl.openCount[k], TS_CNTL_MOVE);
	}
}

void	vtbl_local_main(void)
{
	uint8_t	i, j;
	for( i=0; i<funcInfo.valve; i++ )
	{
		if( vtbl.openCount[i] != 0 )
		{
//			toolSetPos(0, i);
			if( vtbl.openCount2[i] != 200 )
				toolSetPush(i, vtbl.openCount2[i], TS_CNTL_OPEN);
		}
	}				
	if( funcInfo.lpmType != 0 )
	{
		if( __mt_closeError[funcInfo.valve] >= 100 )
		{
			//	if PLC, do it otherwise skip house_valve control
			if( __mt_closeError[funcInfo.valve] < 200 && funcInfo.boiler_type == 0 )
				goto ValveEntry;
		}
			
		toolSetPos(vtbl._result, funcInfo.valve);
		if( vtbl._result2 > vtbl._result )
		{
			if( vtbl._result == 0 )
				toolSetPush(funcInfo.valve, 1, TS_CLOSE_2P);
			else
			{
				j = vtbl._result2 - vtbl._result;
				toolSetPush(funcInfo.valve, j, TS_CNTL_MINUS);
			}
		}
		else if( vtbl._result2 == vtbl._result )
		{
		}
		else 
		{
			j = vtbl._result - vtbl._result2;
			toolSetPush(funcInfo.valve, j, TS_CNTL_PLUS);
		}
	}
ValveEntry:	
	for( i=0; i<funcInfo.valve; i++ )
	{
//		toolSetPos(vtbl.openCount[i], i);
		if( vtbl.openCount[i] == 0 )
		{
			if( vtbl.openCount2[i] != 0 )
				toolSetPush(i, 1, TS_CLOSE);
		}
		else
			toolSetPush(i, vtbl.openCount[i], TS_CNTL_MOVE);
	}
}

void	vtbl_local(void)
{
	if( cntGetType() == 0 )	vtbl_local_main();
	else
		vtbl_local_sub();
}

uint8_t	vtbl_get_short(void)
{
	uint8_t	i, j, k;
	j = 0xff;
	k = 0;
	for( i=0; i<TBL_V_SIZE/2; i++ )
	{
		if( vtbl.coil[i] == 0 )
			continue;
			
		if( vtbl.openCount2[i] != 0 )
		{
			if( j == 0xff )
				j = i;
			else
			{
				if( vtbl.coil[j] > vtbl.coil[i] )
					j = i;
			}
		}
		if( vtbl.coil[k] > vtbl.coil[i] )
			k = i;
	}
	return j==0xff ? k : j;
}

extern uint8_t	_sub_cnt_ready;

void	vtbl_each_sub(uint8_t openCount)
{
	uint8_t	i, k;
	for( i=0; i<funcInfo2.valve; i++ )
	{
		k = i + TBL_V_SIZE/2;
//		toolSetPos(0, k);
		if( vtbl.openCount[k] != 0 )
		{
			if( vtbl.openCount2[k] != 200 && k != vtbl.__k )
				toolSetPush(i, vtbl.openCount2[k], TS_CNTL_OPEN);
		}
	}				
	if( openCount == 0 )
	{
		for( i=0; i<funcInfo2.valve; i++ )
		{
			k = i + TBL_V_SIZE/2;
//			toolSetPos(0, k);
			if( vtbl.openCount2[k] != 0 )
				toolSetPush(i, 1, TS_CLOSE);
		}
	}
	else
	{
		if( vtbl.__k == 0xfe )		{}
		else if( vtbl.__k == 0xff )	{}
		else
		{
			/*
			if( vtbl.__k > TBL_V_SIZE/2 )
			{
				//	2nd
				if( vtbl.openCount[vtbl.__k] == 0 )
					toolSetPush(vtbl.__k - TBL_V_SIZE/2, 1, TS_CLOSE);
			}
			*/
		}		
		vtbl.__k = 0xff;
		for( i=0; i<funcInfo2.valve; i++ )
		{
			k = i + TBL_V_SIZE/2;
//			toolSetPos(vtbl.openCount[k], k);
			if( vtbl.openCount[k] == 0 )
			{
				if( vtbl.openCount2[k] != 0 )
					toolSetPush(i, 1, TS_CLOSE);
			}
			else
				toolSetPush(i, vtbl.openCount[k], TS_CNTL_MOVE);
		}
	}
}

void	vtbl_each_main(uint8_t openCount)
{
	uint8_t	i, k;
	for( i=0; i<funcInfo.valve; i++ )
	{
//		toolSetPos(0, i);
		if( vtbl.openCount[i] != 0 )
		{
			if( vtbl.openCount2[i] != 200 && i != vtbl.__k )
				toolSetPush(i, vtbl.openCount2[i], TS_CNTL_OPEN);
		}
	}
	if( openCount == 0 )
	{
		vtbl.__k = vtbl_get_short();
		for( i=0; i<funcInfo.valve; i++ )
		{
//			toolSetPos(0, i);
			if( i == vtbl.__k )
			{
				if( vtbl.openCount2[i] != 200 )
					toolSetPush(i, vtbl.openCount2[i], TS_CNTL_OPEN);
			}
			else
			{
				if( vtbl.openCount2[i] != 0 )
					toolSetPush(i, 1, TS_CLOSE);
			}
		}
	}
	else
	{
		if( vtbl.__k == 0xfe )		{}
		else if( vtbl.__k == 0xff )	{}
		else
		{
//			toolSetPos(0, vtbl.__k);
			if( vtbl.openCount[vtbl.__k] == 0 )
				toolSetPush(vtbl.__k, 1, TS_CLOSE);
		}		
		vtbl.__k = 0xff;
		for( i=0; i<funcInfo.valve; i++ )
		{
//			toolSetPos(vtbl.openCount[i], i);
			if( vtbl.openCount[i] == 0 )
			{
				if( vtbl.openCount2[i] != 0 )
					toolSetPush(i, 1, TS_CLOSE);
			}
			else
				toolSetPush(i, vtbl.openCount[i], TS_CNTL_MOVE);
		}
	}
}

void	vtbl_boiler_cntl(void)
{
	if( vtbl.cntlMode == 0 )	
		return;
	//	relay control
	relayCntl((funcInfo.rcLED==0 && funcInfo.sub_rcLED==0 ) ? 0 : 1);
}

void	vtbl_each(void)
{
	uint8_t	i, j;
	j = 0;
	for( i=0; i<TBL_V_SIZE; i++ )
	{
		if( vtbl.openCount[i] != 0 )
			j++;
	}				
	if( cntGetType() == 0 )	vtbl_each_main(j);
	else
		vtbl_each_sub(j);

	vtbl_boiler_cntl();
}

uint8_t	vtbl_get_openCount(void)
{
	uint8_t	i;
	uint8_t	k;
	k = 0;
	iOpen = 0;
	iClose = 0;
	for( i=0; i<TBL_V_SIZE; i++ )
	{
		if( vtbl.openCount2[i] == 0 )
		{
			if( vtbl.openCount[i] != 0 )	//	To Open
				k |= 0x01;
		}
		else
		{
			if( vtbl.openCount[i] == 0 )	//	To Close
				k |= 0x02;
		}
		if( vtbl.openCount[i] != 0 )	iOpen += 1;
		else
			iClose += 1;
	}
	return k;
}

void	vtbl_po(void)
{
	uint8_t	i, j, n;
	n = 0;
	for( i=0; i<TBL_V_SIZE; i++ )
	{
//		toolSetPos(vtbl.openCount[i], i);
		if( vtbl.openCount[i] > vtbl.openCount2[i] )
		{
			vtbl_disp(1);
			j = vtbl.openCount[i] - vtbl.openCount2[i];
			toolSetPush(i, MT_STEP(j), TS_CNTL_LARGE);
			n++;
		}
		else if( vtbl.openCount[i] < vtbl.openCount2[i] )
		{
			vtbl_disp(2);
			j = vtbl.openCount2[i] - vtbl.openCount[i];
			toolSetPush(i, MT_STEP(j), TS_CNTL_SMALL);
			n++;
		}
	}
	if( n == 0 )
		vtbl_disp(3);
}

uint8_t	vtbl_Cntl(uint8_t mode)
{
	uint8_t	i;
	uint8_t	j, k;
	if( mode == 0 )
	{
		if( vtbl.cntlMode == 0 )
		{
			if( vtbl._result != vtbl._result2 )
				goto RunEntry;
		}
		else
		{
			if( vtbl.__k == 0xfe )
				goto RunEachEntry;
		}
		return 0;
	}
	else if( mode == 0xff )
	{
		k = vtbl_get_short();
		for( i=0; i<funcInfo.valve; i++ )
		{
//			toolSetPos(0, i);
			if( i == k )
			{
				if( vtbl.openCount2[i] != 200 )
					toolSetPush(i, vtbl.openCount2[i], TS_CNTL_OPEN);
			}
		}
		vtbl.__k = k;
		return;
	}
RunEntry:
	k = vtbl_get_openCount();
	vtbl_disp(0);
	
	if( k == 0 )
	{
		goto KOEX;
		vtbl_po();
	}
	else
	{
KOEX:		
		if( vtbl.cntlMode == 0 )	
		{
			vtbl_local();
		}		
		else
		{
RunEachEntry:			
			vtbl_each();
		}
	}

	for( i=0; i<TBL_V_SIZE; i++ )
		vtbl.openCount2[i] = vtbl.openCount[i];
		
	vtbl._result2 = vtbl._result;	
	return 1;
}

uint8_t	vtbl_loop(uint8_t cmd)
{
	uint8_t	i, j;
	j = 0;
	for( i=0; i<TBL_V_SIZE; i++ )
	{
		if( vtbl.t[i] != 0 )
		{
			vtbl.t[i]--;
			/*
			 *	continue or not
			 */
			j = 1;
			//return;
		}
	}
		
	//	wait till mtCalc complete
	if( mt_Ready() == 0 || j == 1 )
		return;

	//	if cmd ready then skip
	if( _tsCntlHead != _tsCntlTail )
		return;
		
	//	reCalc
	vtbl_calc(0);	
	vtbl._result = calc_final();

	j = 0;
	for( i=0; i<TBL_V_SIZE; i++ )
	{
		if( vtbl._r[i] != vtbl.openCount2[i] )
			j = 1;
	}
		
	if( j==0 )
	{
		if( vtbl.__k != 0xfe )
		{
			vtbl_boiler_cntl();
			if( vtbl.__k != 0xff )
			{
				if( funcInfo.rcLED != 0 )
				{
					//	clear
					toolSetPush(vtbl.__k, 1, TS_CLOSE);
					vtbl.__k = 0xff;
				}
				return;
			}
			if( funcInfo.rcLED == 0 )
			{
				/*
					°³º°³­¹æ¸ðµå¿¡¼­ 1°³ ¹ëºê ¿ÀÇÂ(°¡Àå ÂªÀº ¹ëºê)
				 */
				if( vtbl.cntlMode != 0 && cntGetType() == 0 )
					vtbl_Cntl(0xff);
			}
			return;
		}
	}
	for( i=0; i<TBL_V_SIZE; i++ )
		vtbl.openCount[i] = vtbl._r[i];

	vtbl_disp(4);
	vtbl_Cntl(j);
}

//	1 work//	2 stop//	4 jungji//	8 y//	10 b
void func_cnt_calcInfo(uint8_t id, uint8_t mode, uint8_t curr, uint8_t set) 
{
	uint8_t	i;
	
	if (rcInfo.mode[id - 1] != mode || rcInfo.setup_temp[id - 1] != set) {
		if( mode == MODE_HOT )
			rcInfo._t[id-1] = set;
		_uc.r[60] = mode;
		_uc.r[61] = curr;
		_uc.r[62] = set;
		_uc.r[63] = id - 1;
		cnt_chnage_rc_set(id - 1);
	} 
	
	ev.id = id & 0x0f;
	ev.mode = mode;
	ev.curr = curr;
	ev.set = set;
	vtbl_set(0);
}

void func_cnt_factory(uint8_t idx) {
	switch( idx )
	{
	case 100:
		debug_enable_vtbl = debug_enable_vtbl==0 ? 1 : 0;
		break;
	case 110:
		//	MAIN
		debug_enable_cnt = 0;
		FW_CNTTYPE(debug_enable_cnt);
		break;
	case 120:
		//	SUB
		debug_enable_cnt = 1;
		FW_CNTTYPE(debug_enable_cnt);
		break;
	}
}

extern uint8_t curr_mirror_page;
extern uint8_t mirror_type;

void func_cnt_mirror(uint8_t idx) {
	curr_mirror_page = 0;
	mirror_type = idx;
}

extern uint8_t cnt_check_state;
void func_cnt_endMirror(void) {
	curr_mirror_page = 0;
	mirror_type = 0;
	cnt_check_state = STATE_NORMAL;	
}

void func_cnt_hotwater(uint8_t idx) {
}

void func_cnt_reset(uint8_t idx) {
}

void func_cnt_errorReset(void) {
	
	cnt_check_state = STATE_ERROR_RECOVER;
	
	switch (funcInfo.error_type) {
	case ERROR_TYPE_BOILER:	
		if (br_type == BR_TYPE_NONE) {
		} else if (br_type == BR_TYPE_KR) {
			br_kr_error_reset();
		} else if (br_type == BR_TYPE_KD) {
			br_kd_error_reset();
#if defined (_RINNAI_BOILER_)			
		} else if (br_type == BR_TYPE_RN) {
			br_rn_error_reset();
		}
#endif		
#if defined (_DAEWOO_BOILER_)			
		} else if (br_type == BR_TYPE_DW) {
			br_dw_error_reset();
		}
#endif		
		break;
	case ERROR_TYPE_CNT:	break;
	case ERROR_TYPE_RC:		break;
	case ERROR_TYPE_HN:		break;
	}
	
	funcInfo.error_type = 0;
	funcInfo.error = 0;
}

void func_cnt_error(uint8_t type, uint8_t code) {
	if (funcInfo.error != 0) {
		/*
		if( type == ERROR_TYPE_CNT && code == 0 )
		{
			;
		}
		else
			return;
		*/
		return;
	}	
	funcInfo.error_type = type;
	funcInfo.error = code;
}

extern uint8_t	ext_br_type;

uint8_t	func_get_errorcode(void)
{
	uint8_t	err = 0x98;
	uint8_t	i;
	switch(ext_br_type)
	{
		case 1:
			//	KR(hex)
			i = ((err&0xf0)<<4) | (err&0x0f);
			return i;
		case 2:
			//	KD(dec)
			return err;
		default:
			return err;
	}
}

//#ifdef MT_TEST_OPEN_IT
extern uint8_t	__mt_closereset, __mt_closeflag;
extern uint8_t	__mt_offset[];

void	testCb_mt_test_open_it(void)
{
	uint8_t	pp[10];
	uint8_t	i, s;
	
	s = 0;
	//mt_run(1, 0, 1);
	//	set to close 
	//	mt_enable==1, it skip toolMtLoop()
	__mt_closereset = 1;
	__mt_closeflag = 1;
	mt_run(1, 0, 2800);
	__mt_offset[0] = 100;
			
//	D_IO_HIGH(IO_V1p, 0);
	while(1)
	{
Entry:
		i = 0;
		timerCalc();
		if( s == 0 )
		{
			//	init
			if( __mt_closereset == 0 )
			{
				//	ok
				s = 1;
				mt_run(1, 1, MT_OPEN_OFFSET);
			}
			else
			{
				//	retry
				if( __mt_closeError[0] == 100 )
				{
					__mt_closeflag = 1;
					mt_run(1, 0, 2800);
				}
			}
		}
		else if( s == 1 )
		{
			//	go to MAX
		}
		else if( s == 2 )
		{
			//	wait 10s
		}


		//toolMtLoop(0);
		//mtCalc();
		
		if( __timer1s != pp[5] )
		{
			pp[6] = pp[6]==0 ? 1 : 0;
			if( cntGetType() == 0 || pp[6]==1 )
				D_IO_TOGGLE(D_LED_PORT, D_LED_PIN);
			pp[5] = __timer1s;
		}
	}

}

//#endif
