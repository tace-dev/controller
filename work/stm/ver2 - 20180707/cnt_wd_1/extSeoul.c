// Hyundai
// 11byte ~ 

#include "stdafx.h"
#include "hn_protocol.h"
#include "function.h"
#include "cnt_protocol.h"
#include "br_protocol.h"

#if	!defined(_DW_OKJUNG_)		

#define SEOUL_ACK											0xB0
#define SEOUL_DATA_INIT 							0x5A
#define SEOUL_DATA_FREE 							0x41
#define SEOUL_DATA_HEAT_ONOFF_STATE 	0x7C
#define SEOUL_DATA_HEAT_ONOFF_CNTL 		0x7D
#define SEOUL_DATA_HEAT_TEMP_STATE 		0x7E
#define SEOUL_DATA_HEAT_TEMP_CNTL 		0x7F
#define SEOUL_DATA_BATH_STATE 				0x56
#define SEOUL_DATA_BATH_CNTL 					0x57
#define SEOUL_DATA_BATH_TEMP_STATE 		0x4A
#define SEOUL_DATA_BATH_TEMP_CNTL 		0x4B

#define SEOUL_WAIT		5		//	50ms(timer out)
#define SEOUL_SEND(x)		\
						_ua.ir = x;\
						_ua.sendReady = 1;\
						_ua.sendCount = SEOUL_WAIT;

extern uint8_t msg_hn;
extern U485INFO	_ua;
extern uint8_t	packet_buf[];
extern uint8_t _is_shower;

void hn_seoul_make_checkSum(uint8_t num, uint8_t val) {
	uint8_t i;
	uint8_t s;
	
	s = 0;
	for (i = 0 ; i < num ; i++) {
		s ^= _ua.r[i];
	}
	
	s = s & 0x7F;
	
	_ua.r[val] = s;
}

uint8_t hn_seoul_check_room_state(uint8_t room) {
	uint8_t temp = (funcInfo.rcLED | funcInfo.sub_rcLED);
	
	return getHexToBin(temp , room);
}

uint8_t hn_seoul_check_boiler(void) {
	uint8_t val;
	uint8_t i;
	
	val = 0;
	for (i = 0 ; i < 8 ; i++) {
		if (hn_seoul_check_room_state(i) == 1) {
			val = 1;
			break;
		}
	}
	
	return val;
}

uint8_t hn_seoul_check_error(void) {
	uint8_t error = funcInfo.error;
	uint8_t error_type = funcInfo.error_type;
	
	if (error == 0x00 && error_type == 0x00) {
		return 0xFF;
	} else {
		return error;
	}
}

void hn_seoul_ptc_make_init(void) {
	_ua.r[0] = SEOUL_ACK;
	_ua.r[1] = SEOUL_DATA_INIT;
	_ua.r[2] = 0x00;
	
	hn_seoul_make_checkSum(3, 3);
	
	SEOUL_SEND(4);
}

void hn_seoul_ptc_make_free(void) {
	_ua.r[0] = SEOUL_ACK;
	_ua.r[1] = SEOUL_DATA_FREE;
	_ua.r[2] = 0x00;
	
	hn_seoul_make_checkSum(3, 3);
	
	SEOUL_SEND(4);
}

void hn_seoul_ptc_make_onoff_state(void) {
	uint8_t id;
	uint8_t curTemp;
	uint8_t setTemp;
	uint8_t rcMode;
	
	id = _ua.b[2];
	_ua.r[0] = SEOUL_ACK;
	_ua.r[1] = SEOUL_DATA_HEAT_ONOFF_STATE;
	_ua.r[2] = id;
	if (id == 0x0B) {
		_ua.r[3] = hn_seoul_check_boiler();
		_ua.r[4] = 0x00;
		_ua.r[5] = 0x00;
	} else if (id == 0x15) {
		_ua.r[3] = _is_shower;
		_ua.r[4] = funcInfo.boiler_set_water_shower;
		_ua.r[5] = funcInfo.boiler_water_shower;
	} else {
		if (id > 7) {
			_ua.r[3] = 0x00;
			_ua.r[4] = 0x00;
			_ua.r[5] = 0x00;
		} else {
			curTemp = rcInfo.curr_temp[id - 1] / 2;
			setTemp = rcInfo.setup_temp[id - 1] / 2;
			rcMode = rcInfo.mode[id - 1];
			
			if (rcMode == MODE_STOP || rcMode == MODE_OUT) {
				rcMode = 0;
			} else {
				rcMode = 1;
			}
			_ua.r[3] = rcMode;
			_ua.r[4] = setTemp;
			_ua.r[5] = curTemp;
		}
	}
	
	_ua.r[6] = hn_seoul_check_error();  // error
	
	hn_seoul_make_checkSum(7, 7);
	
	SEOUL_SEND(8);
}


void hn_seoul_ptc_make_onoff_cntl(void) {
	uint8_t id;
	uint8_t curTemp;
	uint8_t setTemp;
	
	id = _ua.b[2];
	_ua.r[0] = SEOUL_ACK;
	_ua.r[1] = SEOUL_DATA_HEAT_ONOFF_CNTL;
	_ua.r[2] = id;
	
	if (id == 0x0B) {
		//TODO: 질문 후 수정
		_ua.r[3] = 0x00;
		//_ua.r[4] = funcInfo.boiler_set_water_shower;
		//_ua.r[5] = funcInfo.boiler_water_shower;
		_ua.r[4] = 0x00;
		_ua.r[5] = 0x00;
	} else if (id == 0x15) {
		//TODO: 질문 후 수정
		_ua.r[3] = 0x00;
		//_ua.r[4] = funcInfo.boiler_set_water_shower;
		//_ua.r[5] = funcInfo.boiler_water_shower;
		_ua.r[4] = 0x00;
		_ua.r[5] = 0x00;
	} else if(id == 0) {
		//TODO: 질문 후 수정
		curTemp = rcInfo.curr_temp[id - 1] / 2;
		setTemp = rcInfo.setup_temp[id - 1] / 2;
		
		_ua.r[3] = _ua.b[3];
		_ua.r[4] = setTemp;
		_ua.r[5] = curTemp;
		
		hnCnt.id = 1;
		hnCnt.comm = 0;
		msg_hn = 1;
		
		hnCnt.mode = (_ua.r[3] == 0) ? MODE_OUT : MODE_HOT;
		hnCnt.setup_temp = 0xFF;
	} else {
		if (id > 7) {
			_ua.r[3] = 0x00;
			_ua.r[4] = 0x00;
			_ua.r[5] = 0x00;
		} else {
			curTemp = rcInfo.curr_temp[id - 1] / 2;
			setTemp = rcInfo.setup_temp[id - 1] / 2;
			
			_ua.r[3] = _ua.b[3];
			_ua.r[4] = setTemp;
			_ua.r[5] = curTemp;
			
			hnCnt.id = id;
			hnCnt.comm = 1;  // 개별 조절
			msg_hn = 1;
			hnCnt.mode = (_ua.r[3] == 0) ? MODE_OUT : MODE_HOT;
			hnCnt.setup_temp = 0xFF;
		}
	}
	
	_ua.r[6] = hn_seoul_check_error();  // error
	
	hn_seoul_make_checkSum(7, 7);
	
	SEOUL_SEND(8);
}

void hn_seoul_ptc_make_temp_state(void) {
	uint8_t id;
	uint8_t curTemp;
	uint8_t setTemp;
	
	id = _ua.b[2];
	curTemp = rcInfo.curr_temp[id - 1] / 2;
	setTemp = rcInfo.setup_temp[id - 1] / 2;
			
	_ua.r[0] = SEOUL_ACK;
	_ua.r[1] = SEOUL_DATA_HEAT_TEMP_STATE;
	_ua.r[2] = id;
	_ua.r[3] = setTemp;
	_ua.r[4] = 0x00;
	_ua.r[5] = 0x00;
	
	_ua.r[6] = hn_seoul_check_error();  // error
	
	hn_seoul_make_checkSum(7, 7);
	
	SEOUL_SEND(8);
}

void hn_seoul_ptc_make_temp_cntl(void) {
	uint8_t id;
		
	id = _ua.b[2];
			
	_ua.r[0] = SEOUL_ACK;
	_ua.r[1] = SEOUL_DATA_HEAT_TEMP_CNTL;
	_ua.r[2] = id;
	_ua.r[3] = _ua.b[3];
	_ua.r[4] = 0x00;
	_ua.r[5] = 0x00;
	
	_ua.r[6] = hn_seoul_check_error();  // error
	
	hn_seoul_make_checkSum(7, 7);
	
	SEOUL_SEND(8);
	
	if (id == 0x15) {
		funcInfo.boiler_set_water_shower = _ua.b[3];
		return;
	}
	
	hnCnt.id = id;
	hnCnt.comm = 0;
	msg_hn = 1;
	hnCnt.mode = MODE_HOT;
	hnCnt.setup_temp = _ua.b[3] * 2;
}

void hn_seoul_ptc_make_bath_state(void) {
	
	_ua.r[0] = SEOUL_ACK;
	_ua.r[1] = SEOUL_DATA_BATH_STATE;
	_ua.r[2] = _is_shower;
	_ua.r[3] = 0x00;
	_ua.r[4] = 0x00;
	_ua.r[5] = 0x00;
	_ua.r[6] = hn_seoul_check_error();  // error
	
	hn_seoul_make_checkSum(7, 7);
	SEOUL_SEND(8);
}

void hn_seoul_ptc_make_bath_cntl(void) {
	_is_shower = _ua.b[2];
	
	_ua.r[0] = SEOUL_ACK;
	_ua.r[1] = SEOUL_DATA_BATH_CNTL;
	_ua.r[2] = _is_shower;
	_ua.r[3] = 0x00;
	_ua.r[4] = 0x00;
	_ua.r[5] = 0x00;
	_ua.r[6] = hn_seoul_check_error();  // error
	
	hn_seoul_make_checkSum(7, 7);
	SEOUL_SEND(8);
}

void hn_seoul_ptc_make_bath_temp_state(void) {
	_ua.r[0] = SEOUL_ACK;
	_ua.r[1] = SEOUL_DATA_HEAT_TEMP_STATE;
	_ua.r[2] = funcInfo.boiler_water_shower;
	_ua.r[3] = 0x00;
	_ua.r[4] = 0x00;
	_ua.r[5] = 0x00;
	_ua.r[6] = hn_seoul_check_error();  // error
	
	hn_seoul_make_checkSum(7, 7);
	SEOUL_SEND(8);
	
}

void hn_seoul_ptc_make_bath_temp_cntl(void) {
	funcInfo.boiler_set_water_shower = _ua.b[2];
	
	_ua.r[0] = SEOUL_ACK;
	_ua.r[1] = SEOUL_DATA_HEAT_TEMP_CNTL;
	_ua.r[2] = funcInfo.boiler_set_water_shower;
	_ua.r[3] = 0x00;
	_ua.r[4] = 0x00;
	_ua.r[5] = 0x00;
	_ua.r[6] = hn_seoul_check_error();  // error
	
	hn_seoul_make_checkSum(7, 7);
	SEOUL_SEND(8);
}

void hn_seoul_ptc_make(void) {
	uint8_t mode;
	mode = _ua.b[1];
	
	switch (mode) {
	case SEOUL_DATA_INIT: 	
		hn_seoul_ptc_make_init();			
		break;   
	case SEOUL_DATA_FREE:				
		hn_seoul_ptc_make_free();	
		break;
	case SEOUL_DATA_HEAT_ONOFF_STATE:				// 난방/온수 on/off 상태요구 
		hn_seoul_ptc_make_onoff_state();
	break;
	case SEOUL_DATA_HEAT_ONOFF_CNTL:				// 난방/온수 on/off 제어 
		hn_seoul_ptc_make_onoff_cntl();
	break;
	case SEOUL_DATA_HEAT_TEMP_STATE:				// 난방/온수 온도뉵纘쩔峨� 
		hn_seoul_ptc_make_temp_state();
	break;
	case SEOUL_DATA_HEAT_TEMP_CNTL: 				// 난방/온수 온도단계 제어
		hn_seoul_ptc_make_temp_cntl();
	break;
	case SEOUL_DATA_BATH_STATE: 						// 온수기능 상태요구 
		hn_seoul_ptc_make_bath_state();
	break;
	case SEOUL_DATA_BATH_CNTL: 							// 온수기능 제어
		hn_seoul_ptc_make_bath_cntl();
	break;
	case SEOUL_DATA_BATH_TEMP_STATE: 				// 온수기능 온도상태 요구
		hn_seoul_ptc_make_bath_temp_state();
	break;
	case SEOUL_DATA_BATH_TEMP_CNTL: 				// 온수기능 온도제어
		hn_seoul_ptc_make_bath_temp_cntl();
	break;
	}
}

// ----------------- check --------------------------------------

uint8_t hn_seoul_check_checkSum(uint8_t num, uint8_t val) {
	uint8_t i;
	uint8_t s;
	
	s = 0;
	for (i = 0 ; i < num ; i++) {
		s ^= _ua.b[i];
	}
	
	s = s & 0x7F;
	
	if (s == _ua.b[val]) {
		return 1;
	}
	
	return 0;
}

uint8_t hn_seoul_ptc_base_check(void){
	if (hn_buf_count == 15) {
		hn_buf_count = 0;
	}
	
	if (_ua.b[0] != 0xAE) {
		hn_buf_error[hn_buf_count++] = 1;
		return 0;
	}
	
	if (_ua.i == 4) {
		if (hn_seoul_check_checkSum(3, 3) == 0) {
			hn_error_checksum = 1;
			hn_buf_error[hn_buf_count++] = 1;
			return 0;
		}		
	} else {
		if (hn_seoul_check_checkSum(7, 7) == 0) {
			hn_error_checksum = 1;
			hn_buf_error[hn_buf_count++] = 1;
			return 0;
		}		
	}
	
	hn_error_checksum = 0;
	hn_type = HN_TYPE_SEOUL;
	hn_connect = 0;
	hn_buf_error[hn_buf_count++] = 0;
	
	ext_hn_error = 1;                             // 2015.11.03   홈넷 연결에러 체크
	
	return 1;
}

void hn_seoul_ptc_check (void) {
	
	if (hn_seoul_ptc_base_check() == 0) {
		return;
	}
	
	hn_seoul_ptc_make();
	
}
#endif