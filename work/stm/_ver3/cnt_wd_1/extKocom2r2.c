#if 1
// Kocom 
// 21byte
#include "stdafx.h"
#include "hn_protocol.h"
#include "function.h"
#include "cnt_protocol.h"
#include "br_protocol.h"

uint8_t	_k2[6];
uint8_t	_k2buf[22];
/*
 *	retry
 */
uint8_t	__kretry[9];

#define KOCOM_RETRY_TIME	20

#define KOCOM_RETRY	{\
					__kretry[2] = 3;\
					__kretry[1] = KOCOM_RETRY_TIME;\
					__kretry[0] = 1;\
					kocom_retry_count = 0;\
					}

#define KOCOM_RETRY_CLEAR	__kretry[0] = 0;
#define RESET_WRITE_AGAIN	_k2[5] = 0;
//#define SET_WRITE_AGAIN(i)	{_k2[5] = i;	kocom_retry_count = 0;}
#define GET_WRITE_AGAIN		_k2[5]
#define CHECK_WRITE_AGAIN	_k2[5] != 0

#define KOCOM_WAIT		100		//	50ms - 10ms(timer out)
#define KOCOM_SEND		\
						_ua.ir = 21;\
						_ua.sendReady = 1;\
						_ua.sendCount = KOCOM_WAIT;
						
#define KOCOM_WAIT2		10		//	50ms - 10ms(timer out)
#define KOCOM_SEND2		\
						_ua.ir = 21;\
						_ua.sendReady = 1;\
						_ua.sendCount = KOCOM_WAIT2;

#define KOCOM_START 							0xAA
#define KOCOM_START2 							0x55
#define KOCOM_END 								0x0D
#define KOCOM_ACK_ENABLE					0xB0
#define KOCOM_ACK_NONE						0x90
#define KOCOM_OP_STATE 						0x3A
#define KOCOM_OP_CONTROL 					0x00
#define KOCOM_ACK_KOCOM 					0xD0
#define KOCOM_ALL_STATE 					0xFF

#define KOCOM_STATE_NONE					0
#define KOCOM_STATE_RES						1
#define KOCOM_STATE_ACK						2
#define KOCOM_STATE_FF						3
//#define KOCOM_STATE_RES_READY				4
#define KOCOM_STATE_RES_ONLY				5

extern uint8_t msg_hn;
extern U485INFO	_ua;
extern uint8_t	packet_buf[];

extern uint8_t _is_shower;

#define _hn_prev_flag	_hn_t[3]
#define _hn_timer		_hn_t[4]
#define _hn_count		_hn_t[5]
#define _hn_wait		_hn_t[6]
#define _hn_wait_ready	_hn_t[7]
#define _hn_wait_1		_hn_t[8]
#define _hn_enable		_hn_t[9]
#define _hn_mode		_hn_t[10]

uint8_t	_hn_t[11];

uint8_t kocom_retry_count = 0;
uint8_t kocom_curr_room = 0;
uint8_t _isFirstCall = 0;
uint8_t kocom_state = 0;

HNINFO_KOCOM hnInfo_kocom;

uint8_t	timer10msCb(void)
{
	__kretry[4] = 0;
	if( __kretry[0] == 0 )
		return 0;

	if( __kretry[1] != 0 )
	{
		__kretry[1]--;
		return 0;
	}
	__kretry[1] = KOCOM_RETRY_TIME;
	
	kocom_retry_count++;
	__kretry[4] = 1;
	__kretry[2]--;
	if( __kretry[2] == 0 )
	{
		__kretry[0] = 0;
		__kretry[4] = 0;
		__kretry[5] = 1;
		return 0;
	}
}

void hn_kocom2_make_checkSum(void) {
	uint8_t i;
	uint8_t s = 0;
	for ( i = 2; i < 18; i++ )
		s += _ua.r[i];
	_ua.r[18] = s;
}

uint8_t hn_kocom2_check_room_state(uint8_t room) {
	uint8_t temp = (funcInfo.rcLED | funcInfo.sub_rcLED);
	return getHexToBin(temp , room);
}

uint8_t hn_kocom_change_temp(uint8_t t, uint8_t min, uint8_t max) {
	uint8_t temp;
	
	if (getHexToBin(t, 7) == 1) {
		temp = min;
	} else if (min > max) {
		temp = max;
	} else {
		temp = t *2;
		if( temp < min )	temp = min;
		else if( temp > max )	temp = max;
	}
	
	return temp;
}

uint8_t hn_kocom2_ptc_base_check(void) {
	uint8_t i;
	uint8_t s = 0;
	if (hn_buf_count == 15) {
		hn_buf_count = 0;
	}
	if (_ua.b[0] != 0xAA) {	return 0;	}
	if (_ua.b[1] != 0x55) {	return 0;	}
	if (_ua.b[5] != 0x36) {	return 0;}
	if (_ua.b[19] != 0X0D) {return 0;	}
	if (_ua.b[20] != 0X0D) {return 0;	}
	
	for( i=2; i<18; i++ )
		s += _ua.b[i];
	if( s != _ua.b[18] )
	{
		hn_error_checksum = 1;
		hn_buf_error[hn_buf_count++] = 1;
		return 0;
	}
	
	hn_error_checksum = 0;
	hn_type = HN_TYPE_KOCOM;
	hn_connect = 0;
	hn_buf_error[hn_buf_count++] = 0;
	
	ext_hn_error = 1;                             
	// 2015.11.03   홈넷 연결에러 체크
	return 1;
}

void hn_kocom2_prepare(uint8_t b3)
{
	uint8_t	i;
	_ua.r[0] = KOCOM_START;
	_ua.r[1] = KOCOM_START2;
	_ua.r[2] = _ua.b[2];
	_ua.r[3] = b3;//	 0xD0 | (_ua.b[3] & 0x0F);
	_ua.r[4] = _ua.b[4]; 
	_ua.r[5] = _ua.b[7]; 
	_ua.r[6] = _ua.b[8]; 
	_ua.r[7] = _ua.b[5]; 
	_ua.r[8] = _ua.b[6];
	for( i=9; i<18; i++ )
		_ua.r[i] = _ua.b[i];
	_ua.r[18] = 0x00;
	_ua.r[19] = KOCOM_END;
	_ua.r[20] = KOCOM_END;
}

void hn_kocom2_ack(void) 
{
	hn_kocom2_prepare(0xD0|(_ua.b[3] & 0x0F));
	hn_kocom2_make_checkSum();
	KOCOM_SEND
}

void hn_kocom2_make_response_packet(uint8_t count, uint8_t rid) 
{
	uint8_t	r;
	for( r=0; r<22; r++ )
		_ua.b[r] = _k2buf[r];
	hn_kocom2_prepare(0xBC + count);
	_ua.r[8] = rid;
	_ua.r[9] = 0x00;
	r = rcInfo.mode[rid];
	_ua.r[10] = (r == MODE_STOP) ? 0x00 : 0x10;
	_ua.r[10] |= (_is_shower == 1 ) ? 0x04 : 0x01;
	_ua.r[11] = (r == MODE_OUT) ? 0x01 : 0x00;
	_ua.r[12] = (rcInfo.setup_temp[rid] / 2);
	_ua.r[13] = 0x00; //funcInfo.boiler_set_water_shower;
	_ua.r[14] = (rcInfo.curr_temp[rid] / 2);
	_ua.r[15] = 0x00; // 추후 지원 (난방수 현재 온도)
	_ua.r[16] = funcInfo.error;
	_ua.r[17] = (hn_kocom2_check_room_state(rid) == 1) ? 0x01 : 0x02;
	hn_kocom2_make_checkSum();
	KOCOM_SEND
}

void hn_kocom2_make_send_packet(uint8_t count, uint8_t rid) 
{
	uint8_t	r;
	uint8_t	i;
	_uc.r[0] = KOCOM_START;
	_uc.r[1] = KOCOM_START2;
	_uc.r[2] = 0x30;//_ua.b[2];
	_uc.r[3] = 0xBC + count;//	 0xD0 | (_ua.b[3] & 0x0F);
	_uc.r[4] = 0x00;
	_uc.r[5] = 0x01;
	_uc.r[6] = 0x00;
	_uc.r[7] = 0x36;
	_uc.r[8] = rid==0xff ? _uc.r[8] : rid;
	_uc.r[9] = 0x00;

	r = _uc.r[60];	//rcInfo.mode[rid];
	if( r == MODE_STOP )
	{
		_uc.r[10] = 0x00;
		_uc.r[11] = 0x01;
	}
	else if( r == MODE_OUT )
	{
		_uc.r[10] = 0x10;
		_uc.r[11] = 0x01;
	}
	else
	{
		_uc.r[10] = 0x10;
		_uc.r[11] = 0x00;
	}
//	_uc.r[10] |= (_is_shower==1) ? 0x04 : 0x01;
	_uc.r[12] = _uc.r[62]/2;
	_uc.r[14] = _uc.r[61]/2;
	_uc.r[13] = 0x00; //funcInfo.boiler_set_water_shower;
	_uc.r[15] = 0x00; // 추후 지원 (난방수 현재 온도)
	_uc.r[16] = funcInfo.error;
	_uc.r[17] = (hn_kocom2_check_room_state(rid) == 1) ? 0x01 : 0x02;

	_uc.r[18] = 0x00;
	_uc.r[19] = KOCOM_END;
	_uc.r[20] = KOCOM_END;

	_uc.ir = 21;
	
	r = 0;
	for ( i = 2; i < 18; i++ )
		r += _uc.r[i];
	_uc.r[18] = r;
}

void	hn_kocom_cb(uint8_t mode)
{
	if( mode >= 100 )
	{
		hn_kocom2_make_send_packet(0, mode-100);
		_k2[4] = 100;
	}
RETRY_ENTRY:		
	if( _k2[0] == 4 )
	{
		KOCOM_RETRY_CLEAR
		_k2[0] = 0;
	}
	else if( _k2[0] == 0 )
	{
		if( __kretry[5] == 1 )
		{
			if( __kretry[6] == 1 )
			{
				_k2[0] = 55;
				_k2[1] = 1;
				goto RETRY_ENTRY;
			}
			__kretry[6] = 0;
			__kretry[5] = 0;
			
		}
		if( _k2[4] == 100 )
		{
			kocom_retry_count = 0;
			uart3_tx_put(_uc.r, _uc.ir);
			_k2[4] = 101;
			KOCOM_RETRY
		}
		else if( _k2[4] == 101 )
		{
			//	wait ack
			if( _k2[1] == 1 )
			{
				_k2[0] = 0;
			}
			if( __kretry[4] == 1 )
			{
				__kretry[4] = 0;
				hn_kocom2_make_send_packet(kocom_retry_count, 0xff);		
				uart3_tx_put(_uc.r, _uc.ir);
				if( kocom_retry_count >= 3 )
					_k2[0] = 0;
			}
		}
	}
	else if( _k2[0] == 1 )
	{
		//	0x9c + 0x3a
		hn_kocom2_make_response_packet(0, kocom_curr_room);
		_k2[0] = 11;
	}
	else if( _k2[0] == 11 )
	{
		if( _k2[1] == 1 )
		{
			RESET_WRITE_AGAIN
			_k2[0] = _k2[1] = 0;
			kocom_curr_room++;
			if( funcInfo.cnt+funcInfo2.cnt != kocom_curr_room )
			{
				hn_kocom2_make_response_packet(0, kocom_curr_room);
				_k2[0] = 11;
			}
		}
	}
	else if( _k2[0] == 2 )
	{
		hn_kocom2_ack();
		_k2[0] = 21;
	}
	else if( _k2[0] == 21 )
	{
		//	wait until prev packet(ack) cleared
		if( _ua.sendReady == 0 )
		{
			hn_kocom2_make_response_packet(0, kocom_curr_room);
			_k2[0] = 22;
			RESET_WRITE_AGAIN			
		}
	}
	else if( _k2[0] == 22 )
	{
		//	wait ack
		//if( _k2[1] == 1 )
			_k2[0] = 0;
	}
	else if( _k2[0] == 8 )
	{
		//	wait ack and 
		kocom_retry_count = 0;
		hn_kocom2_make_response_packet(kocom_retry_count, 0);
		_k2[0] = 81;
		KOCOM_RETRY
	}
	else if( _k2[0] == 81 )
	{
		if( _k2[1] == 1 )
		{
			_k2[1] = 0;
			return;
		}
		if( __kretry[4] == 1 )
		{
			__kretry[4] = 0;
			if( funcInfo.cnt+funcInfo2.cnt < kocom_curr_room )
			{
				_k2[0] = 0;
				return;
			}
			hn_kocom2_make_response_packet(kocom_retry_count, kocom_curr_room);			
		}
	}
	else if( _k2[0] == 5 )
	{
		kocom_retry_count = 0;
		hn_kocom2_make_response_packet(kocom_retry_count, 0);
		_k2[0] = 55;
		__kretry[6] = 1;
		KOCOM_RETRY
	}
	else if( _k2[0] == 55 )
	{
		if( _k2[1] == 1 )
		{
			RESET_WRITE_AGAIN
			kocom_curr_room++;
			if( funcInfo.cnt+funcInfo2.cnt < kocom_curr_room )
			{
				_k2[0] = 0;
				__kretry[6] = 0;
				return;
			}
			_k2[0] = 56;
			_k2[1] = 0;
			return;
		}
		if( __kretry[4] == 1 )
		{
			__kretry[4] = 0;
			if( funcInfo.cnt+funcInfo2.cnt < kocom_curr_room )
			{
				_k2[0] = 0;
				return;
			}
			hn_kocom2_make_response_packet(kocom_retry_count, kocom_curr_room);			
		}
	}
	else if( _k2[0] == 56 )
	{
		hn_kocom2_make_response_packet(0, kocom_curr_room);
		_k2[0] = 55;
		KOCOM_RETRY
	}
}

void	hn_kocom_ptc_check(void)
{
	uint8_t	i, t;
	_hn_wait = 0;
	_hn_wait_ready = 1;
	
	if (hn_kocom2_ptc_base_check() == 0)
		return;

	__kretry[0] = 0;
	
	i = _ua.b[3] & 0xf0;
	_k2[1] = 0;
	if( i == 0xD0 )
	{
		//	ACK from KOCOM
		_k2[1] = 1;
	}
	else if( i == 0x90 )
	{
		if( _ua.b[9] == 0x3a )
		{
			//	query status
			//		response for ROOM CONTROL and Check ACK
			_k2[0] = _ua.b[6] == 0xff ? 5 : 1;
			kocom_curr_room = _ua.b[6] == 0xff ? 0 : _ua.b[6];
		}
	}
	else
	{
		//	Response with ACK
		kocom_curr_room = _ua.b[6] & 0x0f;
		_k2[0] = funcInfo.cnt+funcInfo2.cnt < kocom_curr_room ? 4 : 2;
		if( _ua.b[9] == 0x00 )
		{
			hnInfo_kocom.on_off = (_ua.b[10] & 0x10) >> 4;
			t = _ua.b[10] & 0x0F;
			hnInfo_kocom.mode_heat = getHexToBin(t, 0);
			hnInfo_kocom.mode_heat_water = getHexToBin(t, 1);
			hnInfo_kocom.mode_shower_water = getHexToBin(t, 2);
			hnInfo_kocom.mode_sub = _ua.b[11];
			
			hnInfo_kocom.temp_set_heat = hn_kocom_change_temp(_ua.b[12], 0x0A, 0x50);
			hnInfo_kocom.temp_set_shower_water = _ua.b[13];

			hnCnt.id = kocom_curr_room + 1;
			/*
			 */
			msg_hn = 1;
			if( hnInfo_kocom.on_off == 0x00 )
			{
				hnCnt.mode = MODE_OUT;
				hnCnt.setup_temp = 0xff;
			}
			else
			{
				if( hnInfo_kocom.mode_sub == 0x01 )
				{
					hnCnt.mode = MODE_OUT;
					hnCnt.setup_temp = 0xff;
				}
				else
				{
					hnCnt.mode = MODE_HOT;
					hnCnt.setup_temp = hnInfo_kocom.temp_set_heat;	
				}
			}
		}
		else if( _ua.b[9] == 0x3a )
		{
			_k2[0] = _ua.b[6] == 0xff ? 7 : 8;
			kocom_curr_room = _ua.b[6] == 0xff ? 0 : _ua.b[6];
		}
	}
	if( _k2[1] == 0 )
	{
		for( i=0; i<22; i++ )
			_k2buf[i] = _ua.b[i];
	}
}

#endif


