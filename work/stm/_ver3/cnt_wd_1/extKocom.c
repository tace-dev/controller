#if 0
// Kocom 
// 21byte
#include "stdafx.h"
#include "hn_protocol.h"
#include "function.h"
#include "cnt_protocol.h"
#include "br_protocol.h"

/*
 *	retry
 */
uint8_t	__kretry[3];

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
// ----------------- make --------------------------------------

uint8_t	timer10msCb(void)
{
	if( __kretry[0] == 0 )
		return 0;

	//	200ms
	if( __kretry[1] != 0 )
	{
		__kretry[1]--;
		return 0;
	}
	
	//	resend
	__kretry[2]--;
	kocom_retry_count++;
	hn_kocom_ptc_make_send(0);
	
	if( __kretry[2] == 0 )
	{
		__kretry[0] = 0;
		return 0;
	}
	
}

void hn_kocom_make_checkSum(void) {
	uint8_t i;
	uint8_t s;
	
	s = 0;
	for (i = 2 ; i < 18 ; i++) {
		s += _ua.r[i];
	}
	
	_ua.r[18] = s;
}

uint8_t hn_kocom_check_room_state(uint8_t room) {
	uint8_t temp = (funcInfo.rcLED | funcInfo.sub_rcLED);
	
	return getHexToBin(temp , room);
}

void hn_kocom_ptc_make_set_data(uint8_t mode) {
	uint8_t curTemp;
	uint8_t setTemp;
	uint8_t rcMode;
	//	mode==1, write info to KOCOM
	//	mode==0, response to KOCOM
	curTemp = (rcInfo.curr_temp[kocom_curr_room] / 2);
	setTemp = (rcInfo.setup_temp[kocom_curr_room] / 2);
	rcMode = rcInfo.mode[kocom_curr_room];
	
	_ua.r[10] = 0x00;
	if (rcMode == MODE_STOP) {
		_ua.r[10] = 0x00; 
	} else {
		_ua.r[10] = 0x10;
	}
	
	if (_is_shower == 1) {
		_ua.r[10] |= 0x04;
	} else {
		_ua.r[10] |= 0x01;
	}
	
	if (rcMode == MODE_OUT) {
		_ua.r[11] = 0x01;
	} else {
		_ua.r[11] = 0x00;
	}
	
	_ua.r[12] = setTemp;
	_ua.r[13] = 0x00; //funcInfo.boiler_set_water_shower;
	_ua.r[14] = curTemp;
	_ua.r[15] = 0x00; // 추후 지원 (난방수 현재 온도)
	_ua.r[16] = funcInfo.error;
//	6.6.4 by heedop
	if( _hn_prev_flag == 1 )
	{
		_ua.r[12] = _ua.b[12];
		_ua.r[14] = _ua.b[14];
	}
	if (hn_kocom_check_room_state(kocom_curr_room) == 1) {
		_ua.r[17] = 0x01;
	} else {
		_ua.r[17] = 0x02;
	}
}

//kocom에 먼저 요청시
void hn_kocom_ptc_make_send(uint8_t room) {
	kocom_curr_room = room;
	_isFirstCall = 1;
	//	by heedop 16.11.29
	__kretry[2] = 3;
	__kretry[1] = 20;
	__kretry[0] = 1;
	
	//	by heedop 16.6.3
	_hn_t[0] = _t20ms;
	_hn_t[1] = 0;
	_hn_t[2] = 0;
	
	_ua.r[0] = KOCOM_START;
	_ua.r[1] = KOCOM_START2;
	_ua.r[2] = _ua.b[2];
	_ua.r[3] =  0xB0 | (0x0C + kocom_retry_count);
	_ua.r[4] = 0x00;
	_ua.r[5] = 0x01; 
	_ua.r[6] = 0x00; 
	_ua.r[7] = 0x36; 
	_ua.r[8] = room; 
	// data - start
	_ua.r[9] = KOCOM_OP_CONTROL;
	
	hn_kocom_ptc_make_set_data(1);
	
	//data - end
	_ua.r[18] = 0x00;												// checksum
	_ua.r[19] = KOCOM_END;
	_ua.r[20] = KOCOM_END;
	
	hn_kocom_make_checkSum();
	
	KOCOM_SEND2
}

// kocom 에 대한 응답시
void hn_kocom_ptc_make_response(uint8_t mode) {	
	_ua.r[0] = KOCOM_START;
	_ua.r[1] = KOCOM_START2;
	_ua.r[2] = _ua.b[2];
	_ua.r[3] =  0xB0 | (_ua.b[3] & 0x0F);
	if( mode != 0 )
	{
		_ua.r[3] += mode;
	}
	_ua.r[4] = _ua.b[4]; 
	_ua.r[5] = _ua.b[7]; 
	_ua.r[6] = _ua.b[8]; 
	_ua.r[7] = _ua.b[5]; 
	_ua.r[8] = _ua.b[6];
	// data - start
	_ua.r[9] = KOCOM_OP_CONTROL;
	
	hn_kocom_ptc_make_set_data(0);
	
	//data - end
	_ua.r[18] = 0x00;												// checksum
	_ua.r[19] = KOCOM_END;
	_ua.r[20] = KOCOM_END;
	
	hn_kocom_make_checkSum();
	
	KOCOM_SEND
}

// cc값 4번째 바이트가 0xBX일때 우선 전송
void hn_kocom_ptc_make_ACK(void) {
	
	_ua.r[0] = KOCOM_START;
	_ua.r[1] = KOCOM_START2;
	_ua.r[2] = _ua.b[2];
	_ua.r[3] =  0xD0 | (_ua.b[3] & 0x0F); //TODO:
	_ua.r[4] = _ua.b[4]; 
	_ua.r[5] = _ua.b[7]; 
	_ua.r[6] = _ua.b[8]; 
	_ua.r[7] = _ua.b[5]; 
	_ua.r[8] = _ua.b[6];
	// data - start
	_ua.r[9] = _ua.b[9];
	_ua.r[10] = _ua.b[10];
	_ua.r[11] = _ua.b[11];
	_ua.r[12] = _ua.b[12];
	_ua.r[13] = _ua.b[13];
	_ua.r[14] = _ua.b[14];
	_ua.r[15] = _ua.b[15];
	_ua.r[16] = _ua.b[16];
	_ua.r[17] = _ua.b[17];
	
	//data - end
	_ua.r[18] = 0x00;												// checksum
	_ua.r[19] = KOCOM_END;
	_ua.r[20] = KOCOM_END;
	
	hn_kocom_make_checkSum();
	
	KOCOM_SEND
}

// kocom 에서 전체 상태 요구 시
void hn_kocom_ptc_make_ff(void) {	
	uint8_t rc_total_count = funcInfo.cnt + funcInfo2.cnt;
	
	_isFirstCall = 0;
	if (kocom_curr_room >= rc_total_count) {
		kocom_state = KOCOM_STATE_NONE;
		kocom_curr_room = 0;
		return;
	}
	
	_ua.r[0] = KOCOM_START;
	_ua.r[1] = KOCOM_START2;
	_ua.r[2] = _ua.b[2];
	_ua.r[3] =  0xB0 | (0x0C + kocom_retry_count);
	_ua.r[4] = _ua.b[4]; 
	_ua.r[5] = _ua.b[7]; 
	_ua.r[6] = _ua.b[8]; 
	_ua.r[7] = _ua.b[5]; 
	_ua.r[8] = kocom_curr_room;
	// data - start
	_ua.r[9] = KOCOM_OP_CONTROL;
	
	hn_kocom_ptc_make_set_data(0);
	
	//data - end
	_ua.r[18] = 0x00;												// checksum
	_ua.r[19] = KOCOM_END;
	_ua.r[20] = KOCOM_END;
	
	hn_kocom_make_checkSum();
	
	KOCOM_SEND
	kocom_curr_room++;
}

// ----------------- check --------------------------------------

uint8_t hn_kocom_check_checkSum(void) {
	uint8_t i;
	uint8_t s;
	
	s = 0;
	for (i = 2 ; i < 18 ; i++) {
		s += _ua.b[i];
	}
	
	if (s == _ua.b[18]) {
		return 1;
	}
	
	return 0;
}

uint8_t hn_kocom_ptc_base_check(void) {
	if (hn_buf_count == 15) {
		hn_buf_count = 0;
	}
	
	if (_ua.b[0] != 0xAA) {
		//hn_buf_error[hn_buf_count++] = 1;
		return 0;
	}
	
	if (_ua.b[1] != 0x55) {
		//hn_buf_error[hn_buf_count++] = 1;
		return 0;
	}
	
	if (_ua.b[5] != 0x36) {
		return 0;
	}
	
	if (_ua.b[19] != 0X0D) {
		//hn_buf_error[hn_buf_count++] = 1;
		return 0;
	}
	
	if (_ua.b[20] != 0X0D) {
		//hn_buf_error[hn_buf_count++] = 1;
		return 0;
	}
	
	if (hn_kocom_check_checkSum() == 0) {
		hn_error_checksum = 1;
		hn_buf_error[hn_buf_count++] = 1;
		return 0;
	}
	
	hn_error_checksum = 0;
	hn_type = HN_TYPE_KOCOM;
	hn_connect = 0;
	hn_buf_error[hn_buf_count++] = 0;
	
	ext_hn_error = 1;                             // 2015.11.03   홈넷 연결에러 체크

	return 1;
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

void hn_kocom_ptc_control(void) {
	//_is_shower = hnInfo_kocom.mode_shower_water;	
	hnCnt.id = kocom_curr_room + 1;
	hnCnt.comm = 1;  // 개별 조절
	msg_hn = 1;
	/*	power off command 
	 */
	if( hnInfo_kocom.on_off == 0x00 )
	{
		hnCnt.mode = MODE_OUT;
		hnCnt.setup_temp = 0xff;
		return;
	}
	if (hnInfo_kocom.mode_sub == 0x01) {
		hnCnt.mode = MODE_OUT;
		hnCnt.setup_temp = 0xFF;
	} else if (hnInfo_kocom.on_off == 0x00){
	  hnCnt.mode = MODE_OUT;
		hnCnt.setup_temp = 0xFF;	
	} else {
		hnCnt.mode = MODE_HOT;
		hnCnt.setup_temp = hnInfo_kocom.temp_set_heat;	
	}
}

void hn_kocom_ptc_check_OP (uint8_t op) {
	uint8_t temp;
	
	switch (op) {
		case KOCOM_OP_STATE:
			break;
		case KOCOM_OP_CONTROL:
			//	6.6.4 by heedo, prev status return
//			_hn_prev_flag = 1;
			
			hnInfo_kocom.on_off = (_ua.b[10] & 0x10) >> 4;
			temp = _ua.b[10] & 0x0F;
			hnInfo_kocom.mode_heat = getHexToBin(temp, 0);
			hnInfo_kocom.mode_heat_water = getHexToBin(temp, 1);
			hnInfo_kocom.mode_shower_water = getHexToBin(temp, 2);
			hnInfo_kocom.mode_sub = _ua.b[11];
			
			hnInfo_kocom.temp_set_heat = hn_kocom_change_temp(_ua.b[12], 0x0A, 0x50);
			hnInfo_kocom.temp_set_shower_water = _ua.b[13];
			
			hn_kocom_ptc_control();
			break;
	}
}

void hn_kocom_ptc_Cb(void) {
	switch (kocom_state) {
		case KOCOM_STATE_ACK:
			hn_kocom_ptc_make_ACK();
			kocom_state = KOCOM_STATE_RES;
//			kocom_state = KOCOM_STATE_RES_READY;
			break;
		/*
		case KOCOM_STATE_RES_READY:
			kocom_state = KOCOM_STATE_RES;
			goto WRITE_PACKET;
			break;
		*/
		case KOCOM_STATE_RES:
WRITE_PACKET:
			//	clear timer 06.6.3
			_hn_t[0] = _t20ms;
			_hn_t[1] = 0;
			_hn_t[2] = 0;
			_isFirstCall = 1;
			hn_kocom_ptc_make_response(0);
			kocom_state = KOCOM_STATE_NONE;
			break;
		case KOCOM_STATE_RES_ONLY:
			_hn_t[0] = _t20ms;
			_hn_t[1] = 0;
			_hn_t[2] = 0;
			_isFirstCall = 0;			
			hn_kocom_ptc_make_response(0);
			kocom_state = KOCOM_STATE_NONE;
			break;
		case KOCOM_STATE_FF:
			hn_kocom_ptc_make_ff();
			break;
		case KOCOM_STATE_NONE:
			break;
	}
}

void hn_kocom_ptc_check_CC (uint8_t cc) {
	switch (cc) {
		case KOCOM_ACK_ENABLE:
			kocom_state = KOCOM_STATE_ACK;
			break;
		case KOCOM_ACK_NONE:
			kocom_state = KOCOM_STATE_RES_ONLY;
			break;
	}
	
	hn_kocom_ptc_Cb();
}

void hn_kocom_ptc_check (void) {
	//	clear
	_hn_wait = 0;
	_hn_wait_ready = 1;
	
	if (hn_kocom_ptc_base_check() == 0) {
		return;
	}
	//	clear retry
	__kretry[0] = 0;
	
	if(_isFirstCall == 1) {
		// 먼저 요청한 것에 ACK 검사
	}	
	
	if ((_ua.b[3] & 0xF0) == KOCOM_ACK_KOCOM) {
		kocom_retry_count = 0;
		_isFirstCall = 0;
		kocom_state = KOCOM_STATE_NONE;
		return;
	}
	
	kocom_curr_room = _ua.b[6];
	if (kocom_curr_room == KOCOM_ALL_STATE) {
		kocom_state = KOCOM_STATE_FF;
		kocom_curr_room = 0;
		hn_kocom_ptc_Cb();
		return;
	}
	//	16.11.28
	if( _ua.b[9] == KOCOM_OP_CONTROL )
		_hn_prev_flag = 1;
	hn_kocom_ptc_check_OP(_ua.b[9]);
	hn_kocom_ptc_check_CC((_ua.b[3] & 0xF0));
	//	6.6.4 by heedo, prev status return
	/*
	_hn_prev_flag = 0;
	*/
}
/*
void	_hn_kocom_cb(uint8_t room)
{
	if( _hn_wait_ready == 1 )
	{
		if( __timer100ms != _hn_wait_1 )
		{
			_hn_wait_1 = __timer100ms;				
			_hn_wait++;
			if( _hn_wait > 10 )
			{
				_hn_wait = 0;
				_hn_wait_ready = 0;
			}
		}
	}
	else
	{
		hn_kocom_ptc_make_send(room);
	}
}
*/
void	hn_kocom_cb(uint8_t mode)
{
	/*	16.11.28
	 */
	if( mode >= 100 && _hn_prev_flag == 1 )
	{
		//	reset response
		_hn_prev_flag = 0;
		return;
	}
	if( _hn_wait_ready == 1 )
	{
		if( __timer100ms != _hn_wait_1 )
		{
			_hn_wait_1 = __timer100ms;				
			_hn_wait++;
			if( _hn_wait > 10 )
			{
				_hn_wait = 0;
				_hn_wait_ready = 0;
			}
		}
	}
	else
	{
		if( _hn_enable == 1 )
		{
			_hn_enable = 0;
			hn_kocom_ptc_make_send(_hn_mode);
		}
	}	
	if( mode >= 100 )
	{
		_hn_enable = 1;
//		_hn_mode = mode-100;
//		_hn_kocom_cb(_hn_mode);
		return;
	}
	if( _isFirstCall == 1 )
	{
		if( _t20ms != _hn_t[0] )
		{
			_hn_t[0] = _t20ms;
			_hn_t[1]++;
			if( _hn_t[1] > 30 )
			{
				_hn_t[1] = 0;
				//	ack timeout
//				if( kocom_state == KOCOM_STATE_RES_READY )
				{
					_hn_t[2]++;
					if( _hn_t[2] == 3 )
					{
						_isFirstCall = 0;
						_hn_t[0] = _t20ms;
						_hn_t[1] = 0;
						_hn_t[2] = 0;
						//	timeout
						kocom_state = KOCOM_STATE_NONE;
						return;
					}
					hn_kocom_ptc_make_response(_hn_t[2]);
				}				
			}
		}
	}
	if( _hn_count == _ua.i )
	{
		if( _hn_count != __timer100ms )
		{
			_hn_count = __timer100ms;
			_hn_timer++;
			if( _hn_timer > 10 )
			{
				_ua.i = 0;
				_ua.tCount = 0;
				_hn_timer = 0;
			}
		}
	}
	else
	{
		_hn_timer = 0;
		_hn_count = _ua.i;
	}
}
#endif


