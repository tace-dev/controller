#include "stdafx.h"
#include "hn_protocol.h"
#include "function.h"
#include "cnt_protocol.h"

extern uint8_t msg_hn;
extern U485INFO	_ua;
extern uint8_t	packet_buf[];

#define COMMAX_WAIT		20		//	30ms - 10ms(timer out)
#define COMMAX_SEND		\
						_ua.ir = 8;\
						_ua.sendReady = 1;\
						_ua.sendCount = COMMAX_WAIT;

void hn_commax_make_checkSum(void) {
	uint8_t i;
	uint8_t s;
	
	s = 0;
	for (i = 0 ; i < 7 ; i++) {
		s += _ua.r[i];
	}
	
	_ua.r[7] = s;
}

void hn_commax_ptc_make_cnt_mainrc(void) {
	uint8_t powertOn;
	
	powertOn = 1;
	if (packet_buf[0] == PACKET_ERROR_COUNT) {
		powertOn = 0;
	}
	
	_ua.r[0] = 0x85;
	_ua.r[1] = (powertOn << 7) | (hnCnt.mode == MODE_OUT ? 1 : (1 << 1));
	_ua.r[2] = 0x01;
	_ua.r[3] = 0x00;
	_ua.r[4] = 0x00;
	_ua.r[5] = 0x00;
	_ua.r[6] = 0x00;
	
	hn_commax_make_checkSum();
}

void hn_commax_ptc_make_cnt_subrc(uint8_t id) {
	uint8_t heatOn;
	uint8_t mode;
	uint8_t powertOn;
	uint8_t error_type;
	uint8_t curTemp;
	uint8_t setTemp;
	
	heatOn = 1;
	if ( 	rcInfo.mode[id - 1] == MODE_STOP || 
				rcInfo.mode[id - 1] == MODE_OUT ) {
		heatOn = 0;
	}
	//heatOn = rcInfo.setup_temp[id - 1] > rcInfo.curr_temp[id - 1] ? 1 : 0;
	mode = rcInfo.mode[id - 1] == MODE_OUT ? 1 : 0;
	powertOn = 1;
	error_type = hn_make_errorCode();
	curTemp = rcInfo.curr_temp[id - 1] / 2;
	setTemp = rcInfo.setup_temp[id - 1] / 2;
	
	if (packet_buf[id - 1] == PACKET_ERROR_COUNT) {
		powertOn = 0;
	}
	
	_ua.r[0] = 0x84;
	_ua.r[1] = (powertOn << 7) | (mode << 2) | heatOn;
	_ua.r[2] = id;
	_ua.r[3] = ((curTemp / 10) << 4) | (curTemp % 10);
	_ua.r[4] = ((setTemp / 10) << 4) | (setTemp % 10);
	_ua.r[5] = 0x00;
	_ua.r[6] = error_type;

	hn_commax_make_checkSum();
}

void hn_commax_ptc_make_rcstate(uint8_t id) {
	uint8_t heatOn;
	uint8_t mode;
	uint8_t powertOn;
	uint8_t error_type;
	uint8_t curTemp;
	uint8_t setTemp;
	
	heatOn = 1;
	if ( 	rcInfo.mode[id - 1] == MODE_STOP || 
				rcInfo.mode[id - 1] == MODE_OUT ) {
		heatOn = 0;
	}
	//heatOn = rcInfo.setup_temp[id - 1] > rcInfo.curr_temp[id - 1] ? 1 : 0;
	mode = rcInfo.mode[id - 1] == MODE_OUT ? 1 : 0;
	powertOn = 1;
	error_type = hn_make_errorCode();
	curTemp = rcInfo.curr_temp[id - 1] / 2;
	setTemp = rcInfo.setup_temp[id - 1] / 2;
	
	
	if (packet_buf[id - 1] == PACKET_ERROR_COUNT) {
		powertOn = 0;
	}
	
	_ua.r[0] = 0x82;
	_ua.r[1] = (powertOn << 7) | (mode << 2) | heatOn ;
	_ua.r[2] = id;
	_ua.r[3] = ((curTemp / 10) << 4) | (curTemp % 10);
	_ua.r[4] = ((setTemp / 10) << 4) | (setTemp % 10);
	_ua.r[5] = 0x00;
	_ua.r[6] = error_type;

	hn_commax_make_checkSum();
}

void hn_commax_ptc_make_cnt_init(void) {
	_ua.r[0] = 0x8F;
	_ua.r[1] = 0x01;  // 귀뚜라미
	_ua.r[2] = 0x03;
	_ua.r[3] = 0x05;
	_ua.r[4] = 0x40;
	_ua.r[5] = funcInfo.cnt;
	_ua.r[6] = 0x00;
	
	hn_commax_make_checkSum();
}

// -------------------------------------------------------------------

uint8_t hn_commax_check_checkSum(void) {
	uint8_t i;
	uint8_t s;
	
	s = 0;
	for (i = 0 ; i < 7 ; i++) {
		s += _ua.b[i];
	}
	
	if (s == _ua.b[7]) {
		return 1;
	}
	
	return 0;
}

void hn_commax_ptc_check_cnt_mainrc(void) {
	uint8_t id;
	uint8_t mode;
	uint8_t rc_mode;
	
	id = 0x01;
	mode = _ua.b[2];
	
	if (mode == 0x01) {
		rc_mode = MODE_OUT;
		hnCnt.setup_temp = 0;
	} else {
		rc_mode = MODE_HOT;
		hnCnt.setup_temp = 0xFF;		
	}
	
	hnCnt.mode = rc_mode;
	hnCnt.id = id;
	
	msg_hn = 1;
	
	hn_commax_ptc_make_cnt_mainrc();
	COMMAX_SEND
}

void hn_commax_ptc_check_cnt_subrc(void) {
	uint8_t id;
	uint8_t mode;
	uint8_t rc_mode;
	uint8_t comm;
	uint8_t set_temp;
	
	id = _ua.b[1];
	mode = _ua.b[2];
	comm = _ua.b[3];
	
	if (mode == 0x03) {
		rc_mode = MODE_HOT;
		set_temp = hn_ptc_16To10(comm) * 2;
	} else {
		if ((comm & 0x01) == 0) {
			rc_mode = MODE_STOP;
			set_temp = 0;
		} else {
			rc_mode = MODE_HOT;
			set_temp = 0xFF;
		}		
	}
	
	hnCnt.mode = rc_mode;
	hnCnt.id = id;
	hnCnt.setup_temp = set_temp;
	
	msg_hn = 1;
	
	hn_commax_ptc_make_cnt_subrc(id);
	COMMAX_SEND
}

void hn_commax_ptc_check_rcstate(void) {
	uint8_t id;
	id = _ua.b[1];
	
	hn_commax_ptc_make_rcstate(id);
	COMMAX_SEND
}

void hn_commax_ptc_check_cnt_init(void) {
	
	hn_commax_ptc_make_cnt_init();
	COMMAX_SEND
}

void hn_commax_ptc_check(void) {
	if (hn_buf_count == 15) {
		hn_buf_count = 0;
	}
	
	if (hn_commax_check_checkSum() != 1) {
		hn_error_checksum = 1;
		hn_buf_error[hn_buf_count++] = 1;
		return;
	}
	
	hn_error_checksum = 0;
	hn_type = HN_TYPE_COMMAX;
	hn_connect = 0;
	
	ext_hn_error = 1;                             // 2015.11.03   홈넷 연결에러 체크
	
	switch(_ua.b[0]) {
		case 0x02:
			hn_buf_error[hn_buf_count++] = 0;
			hn_commax_ptc_check_rcstate();
			break;
		case 0x04:
			hn_buf_error[hn_buf_count++] = 0;
			hn_commax_ptc_check_cnt_subrc();
			break;
		case 0x05:
			hn_buf_error[hn_buf_count++] = 0;
			hn_commax_ptc_check_cnt_mainrc();
			break;
		case 0x0F:
			hn_buf_error[hn_buf_count++] = 0;
			hn_commax_ptc_check_cnt_init();
			break;
		default:
			
			break;
	}
}

