#include "stdafx.h"
#include "mtDef.h"
#include "function.h"
#include "cnt_protocol.h"

#if defined (_PLC_)

uint8_t	_plc_s = 100;
uint8_t	_plc_rc = 0;
uint8_t	_plc_t1 = 0;
uint8_t	_plc_retry = 0;
uint8_t	_plc_id = 1;
uint8_t	plc_timer[5];

uint8_t	p3ping = 0;
uint8_t	plcping = 0;

PKTINFO	*_plc;

extern PKTINFO	_pkt;
extern uint8_t	_t1ms;
extern uint8_t	_tsSize;
extern uint8_t	_mc_complete;

extern uint8_t	mt_plc_mode;
extern uint8_t	__mt_enable;

#define PLC3(t1,retry)	_plc_t1=t1; _plc_retry=retry;

void	_plc3Next(uint8_t id, uint8_t mode)
{
	_plc_s = id;
	_plc_rc = 0;
	if( mode == 0 )
		p3_write(_plc->id, 0, 0);
	else
		p3_write(_plc->id, _plc->pos, _plc->cmd);
}

uint8_t	_plc3Error(uint8_t id, uint8_t timeout, uint8_t retry)
{
	_plc_t1++;
	if( _plc_t1 >= timeout )
	{
		_plc_s = id;
		_plc_retry++;
		if( _plc_retry >= retry )
			return 1;
	}
	return 0;
}

uint8_t	_plc_pos_1 = 0;
uint8_t	_plc_0error = 0;
uint8_t	plcerror = 0;
uint8_t	plctimeout = 0;

void	_plc_check(void)
{
	/*
	if( _pkt.cmd == 0x0f && _pkt.id == 1 && _pkt.pos == 0xff )
	{
		_plc_rc = 1;
		return;
	}
	*/
	if( _pkt.id == _plc->id )
	{
		/*
			TIMEOUT flag
		 */
		if( plctimeout == 1 )
		{
			func_cnt_errorReset();
//			func_cnt_error(ERROR_TYPE_CNT, 0);
		}
		plctimeout = 0;
		
		if( _pkt.cmd == 0 )
		{
			//	goto
		}
		else if( _pkt.cmd == 1 )
		{
			//	error
		}
		else if( _pkt.cmd == 0x0a )
		{
			//	error - motor but communication is ok
			_plc_rc = 1;
			if( _plc_0error == 0 )
			{
				_plc_0error = 1;
				__mt_closeError[funcInfo.valve] = 210;
			}
			return;
		}
		else if( _pkt.cmd == 0x0b )
		{
			//	position set ok
			if( _pkt.pos == _plc->pos )
			{
				//	Complete
				if( _pkt.pos == 0 )
				{
					_plc_rc = 1;
					_plc_pos_1 = 0;
					p3ping = 0;
					return;
				}
				//	always OK
				_plc_rc = 1;
				
				if( _plc_pos_1 == 1 )
				{
					//	2nd cmd / 25x
					_plc_pos_1 = 0;
					p3ping = 0;
					return;
				}
				else
				{
					//	1st cmd / 25x
					if( p3ping == 0 )
					{
						_plc_pos_1 = 1;
						//	normal command
						_plc->pos -= 3;
					}
					else
					{
						//	ping
						_plc_rc = 1;
						return;
					}
				}
			}
			else if( _pkt.pos+1 == _plc->pos )
			{
				if( _plc_pos_1 == 0 )
				{
					_plc_pos_1 = 1;
					if( _plc->pos >= 3 )
					{
						if( p3ping == 0 )
						{
							//	normal command
							_plc->pos -= 3;
						}
						else
						{
							_plc_rc = 1;
							return;
						}
					}
				}
				else
				{
					_plc_pos_1 = 0;
					//	Complete II
					_plc_rc = 1;
					p3ping = 0;
					return;
				}
			}
		}
		
		//	Retry
		p3_write(_plc->id, _plc->pos, _plc->cmd);	
		//	Clear Timer Index
		plc_timer[1] = 0;
		plc_timer[2] = 0;
	}
	_plc_rc = 0;
}

uint8_t	plc3_NotReady(void)
{
	return _plc_s == 101 ? 1 : 0;
}

extern PKTINFO _p3_buf[];

void	_plc3_gotoZero(uint8_t id)
{
	_plc = &_p3_buf[0];
	_plc->id = id;
	_plc->pos = 0;
	_plc->cmd = 9;
	p3_write(_plc->id, _plc->pos, _plc->cmd);
}

uint8_t	_plc3_ready(void)
{
	//	Online
	if( _plc_rc != 0 )
		return 10;

	_plc3_gotoZero(1);
	//	Retry
	return 201;
}

extern uint8_t	p3pushFlag;

uint8_t	_plc3Loop(void)
{
	PKTINFO	*lp;
	if( _plc_s == 100 )
	{
		//	for Timer
		_plc_s = 201;
		plc_timer[1] = 0;
		plc_timer[2] = 0;
		plc_timer[3] = __timer100ms;
		plc_timer[4] = 0;
		if( funcInfo.boiler_type == 0 )
		{
			_plc_s = 101;
		}
		else
		{
			/*
				copy_infoSet@rc_wd//ui.c
			 */
			funcInfo.plc++;
			_plc3_gotoZero(1);
		}
	}
	else if( _plc_s == 201 )
	{
		mt_plc_mode = 100;
		if( plc_timer[3] != __timer100ms )
		{
			plc_timer[3] = __timer100ms;
			plc_timer[2]++;

			if( plc_timer[2] >= 15 )
			{
				plc_timer[1]++;
				plc_timer[2] = 0;
				if( plc_timer[1] > 10 )
				{
					plc_timer[1] = 0;
					//	timeout 5*1.5s = 7.5s
					/*
					_plc_s = 101;
					*/
					/*
						2015.09.25 PLC 영점 루틴은 에러처리 안하고 계속 동작
					 */
					if( plcerror == 0 )
					{
						plcerror =  1;
						__mt_closeError[funcInfo.valve] = 210;
					}
				}
				else
				{
					plc_timer[4]++;
					if( plc_timer[4] >= 40 )
					{
						plc_timer[4] = 0;
						/*
							ERROR
						 */
					}
					_plc_s = _plc3_ready();
				}
			}
		}
	}
	else if( _plc_s == 101 )
	{
		//	Not Connected
		mt_plc_mode = 199;
	}
	else if( _plc_s == 10 )
	{
		//	origin
		_plc_s = 11;
		_plc_id = 1;
		plcerror = 0;
PLC_ENTRY:
		plc_timer[1] = 0;
		plc_timer[2] = 0;
		plc_timer[3] = __timer100ms;
		mt_plc_mode = 110;
		_plc3_gotoZero(_plc_id);
	}
	else if( _plc_s == 112 )
	{
		//	TimeOut Error
	}
	else if( _plc_s == 11 )
	{
//		plc_timer[1]++;
		if( _plc_rc == 0 )
		{
			if( plc_timer[3] == __timer100ms )
				return 0;

			plc_timer[3] = __timer100ms;
			plc_timer[2]++;
			if( plc_timer[2] == 5 )
			{
				plc_timer[2] = 0;
				plc_timer[4]++;
				if( plc_timer[4] == 2 )
				{
					plcerror++;
					if( plcerror > 200 )
						plcerror = 200;
					//	10s timeout
					goto ERROR_ENTRY;
				}
				//	No response, retry
				goto PLC_ENTRY;
			}
			return 0;
ERROR_ENTRY:
/*
			mt_plc_mode = 200 + _plc_id;
*/
			plc_timer[1] = 0;
			if( _plc_s == 11 )
			{
				plc_timer[4] = 0;
				if( plcerror == 1 )
				{
					//	Only One if first error status
					__mt_closeError[funcInfo.valve] = 210;
				}
			}
			else
			{
				plctimeout = 1;
				//	cmd timeout
				__mt_closeError[funcInfo.valve] = 220;
			}
			return 1;
		}

//		if( funcInfo.plc != _plc_id - 1 )
		plcerror = 0;
		if( funcInfo.plc != _plc_id )
		{
			_plc_id++;
			goto PLC_ENTRY;			
		}
		else
		{
			_plc_s = 12;
			mt_plc_mode = 111;
			plc_timer[2] = 0;
			plc_timer[3] = __timer100ms;
		}
	}	
	else if( _plc_s == 12 )
	{
		if( __mt_enable == 1 )
		{
PING_ENTRY:			
			if( p3_Ready() == 0 )
			{
				if( plc_timer[3] != __timer100ms )
				{
					plc_timer[3] = __timer100ms;
					plc_timer[2]++;
					if( plc_timer[2] >= 30 )
					{
						p3ping = 1;
						if( p3_Ready() == 0 )
						{
							//	mt + MT enable
							plcping = 1;
						}
						else
						{
							//	plc Ready
							return;
						}
						goto LAST_PING_ENTRY;
					}
				}
			}
			return 0;
		}
			
		//	PLC INIT COMPLETE
		if( p3_Ready() == 0 )
			goto PING_ENTRY;
			
		//	running 
		__mt_enable = 1;
		_plc = p3_pop();
		plcping = 0;
		/*	
			Add +3, reCalc @plc_Check()
		 */
		if( _plc->pos != 0 )
			_plc->pos += 3;
//		if( _plc->pos >= 200 )
//			_plc->pos = 200;
LAST_PING_ENTRY:

		p3_write(_plc->id, _plc->pos, _plc->cmd);
		plc_timer[1] = 0;
		plc_timer[2] = 0;
		plc_timer[3] = __timer100ms;
		_plc_s = 20;
	}
	else if( _plc_s == 20 )
	{
		//	wait response
		if( _plc_rc == 1 )
		{
			//	complete
			if( plcping == 0 )
				__mt_enable = 0;
			_plc_rc = 0;
			_plc_s = 12;
			//	clear p3 mode
			p3pushFlag = 0;
			plcping = 0;
		}
		else
		{
			if( plc_timer[3] != __timer100ms )
			{
				plc_timer[3] = __timer100ms;
				plc_timer[2]++;
				if( plc_timer[2] >= 15 )
				{
					//	1s timeout
					plc_timer[1]++;
					plc_timer[2] = 0;
					if( plc_timer[1] < 20 )
					{
						//	3 retry(=3s)
						p3_write(_plc->id, _plc->pos, _plc->cmd);
					}
					else
					{
						plc_timer[1] = 0;
						//	clear p3 mode
						p3pushFlag = 0;
/*						
						if( plcping == 0 )
						{
							//	retry out
							goto ERROR_ENTRY;					
						}
*/
						if( plcerror == 0 )
						{
//							plcerror = 201;
							//	Only One if first error status
							goto ERROR_ENTRY;	
//							__mt_closeError[funcInfo.valve] = 210;
						}						
					}
				}
			}
		}
	}
	/*
		_plc_s 13/14 is Not Called, 2015/09/20
	 */
	else if( _plc_s == 13 )
	{
		//	DOIT
		lp = p3_pop();
		p3_write(lp->id, lp->pos, 9);
		_plc_s = 14;
		plc_timer[0] = __timer1s;
		plc_timer[1] = 0;
	}
	else if( _plc_s == 14 )
	{
		if( plc_timer[0] == __timer1s )
			return 0;
			
		plc_timer[0] = __timer1s;
		plc_timer[1]++;
		if( plc_timer[1] != 8 )
			return 0;

		_plc_s = 12;
	}	
	else if( _plc_s == 0 )
	{
		if( p3_Ready() == 0 )
			return 0;
			
		_plc_s = 1;
//		PLC3(0, 0)
		_plc = p3_pop();
	}
	else if( _plc_s == 1 )
	{
		_plc3Next(2, _plc->cmd);
	}
	else if( _plc_s == 2 )
	{
		if( _plc_rc != 0 )
		{
			/*
			_plc_s = 3;
			*/
			_plc_s = 0;
			PLC3(0, 0)
			return 0;
		}
		if( _plc3Error(1, 1, 10) == 1 )
		{
			//	Error @plc->id
			_plc_s = 0;
		}
	}
	/*
	else if( _plc_s == 3 )
	{
		_plc3Next(4, 0);
	}
	else if( _plc_s == 4 )
	{
		if( _plc_rc != 0 )
		{
			_plc_s = 0;
			return;
		}
		if( _plc_t0 != _t1ms )
		{
			//	1s timeout, 10 retry
			if( _plc3Error(10, 15) == 1 )
				_plc_s = 0;
		}
	}
	*/
	return 0;
}

//#ifdef _KOEX_DEMO_
#include "br_protocol.h"

uint8_t br_remocon_baseCheck(void) {
	if (br_buf_count == 15) {
		br_buf_count = 0;
	}
	
	if(_ub.b[0] != 0x9f) {
		br_buf_error[br_buf_count++] = 1;
		return 0;
	}
	
	if(_ub.b[1] != 0x1f) {
		br_buf_error[br_buf_count++] = 1;
		return 0;
	}
	
	if(_ub.b[12] != 0x9e) {
		br_buf_error[br_buf_count++] = 1;
		return 0;
	}
/*	
	if (br_kd_check_checkSum() != 1) {
		br_error_checksum = 1;
		return 0; 
	}
*/	
	
	br_error_checksum = 0;
	br_buf_error[br_buf_count++] = 0;
	
	ext_br_error = 1;  							// 2015.11.03 보일러 정상 패킷 체크
	
	return 1;
}

void br_remocon_ptc_check(void) {
	uint8_t	i;
	
	if(br_remocon_baseCheck() == 0) {
		return;
	}
	
	for( i=0; i<8; i++ )
	{
		if( _ub.b[2+i] != 0 )
		{
			vtbl.coil[i] = funcInfo.valve_len[i] = _ub.b[2+i];
		}
	}
//	br_type = BR_TYPE_KD;
	br_connect = 0;
}

//#endif
#endif