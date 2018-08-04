// Hyundai
// 11byte ~ 

#include "stdafx.h"
#include "hn_protocol.h"
#include "function.h"
#include "cnt_protocol.h"
#include "br_protocol.h"

#define HYUNDAI_WAIT		50		//	50ms(timer out)
#define HYUNDAI_SEND(x)		\
						_ua.ir = x;\
						_ua.sendReady = 1;\
						_ua.sendCount = HYUNDAI_WAIT;

extern uint8_t msg_hn;
extern uint8_t msg_hn_more;
extern U485INFO	_ua;
extern uint8_t	packet_buf[];

uint8_t pre_heat_temp[8];

void hn_hyundai_make_checkSum(uint8_t num) {
	uint8_t i;
	uint8_t s;
	
	s = 0;
	for (i = 0 ; i < num ; i++) {
		s ^= _ua.r[i];
	}
	
	_ua.r[num] = s;
}

uint8_t hn_hyundai_change_mode(uint8_t room) {
	if (rcInfo.mode[room] == 0x00) {
		return 0x00;
	} else if (rcInfo.mode[room] == MODE_OUT) {
		return 0x04;
		//return 0x07;
	} else if (rcInfo.mode[room] == MODE_STOP) {
		return 0x04;
	} else {
		return 0x01;
	}
}

uint8_t hn_hyundai_change_curr_mode(uint8_t mode) {
	if (mode == 0x00) {
		return 0x00;
	} else if (mode == MODE_OUT) {
		return 0x04;
		//return 0x07;
	} else if (mode == MODE_STOP) {
		return 0x04;
	} else {
		return 0x01;
	}
}

uint8_t hn_hyundai_change_temp(uint8_t room, uint8_t iscurr) {
	uint8_t temp;
	
	if (rcInfo.mode[room] == 0x00) {
		return 0xFF;
	}
	
	if (iscurr == 1) {
		temp = rcInfo.curr_temp[room] / 2;
	} else {
		temp = rcInfo.setup_temp[room] / 2;
	}
	
	//temp = (temp / 10 ) << 4 | (temp % 10);
	
	return temp;
}

// 각방 상태 요청
void hn_hyundai_ptc_make_state(uint8_t room) {
	_ua.r[0] = 0xF7;
	_ua.r[1] = 0x0D;	// 2016.02.05 수정 
	_ua.r[2] = _ua.b[2];
	_ua.r[3] = _ua.b[3];
	_ua.r[4] = 0x04; 
	_ua.r[5] = _ua.b[5]; 
	_ua.r[6] = _ua.b[6]; 
	_ua.r[7] = _ua.b[7];
	
	_ua.r[8] = hn_hyundai_change_mode(room - 1); // 모드
	_ua.r[9] = hn_hyundai_change_temp(room - 1, 1); // 현재 온도 
	_ua.r[10] = hn_hyundai_change_temp(room - 1, 0); // 설정온도
		
	if (msg_hn == 1) {
		if (hnCnt.id == room) {
			_ua.r[8] = hn_hyundai_change_curr_mode(hnCnt.mode);
			_ua.r[10] = (hnCnt.setup_temp == 0xFF) ? pre_heat_temp[room - 1] : (hnCnt.setup_temp / 2);		
		} else {
			if (hnCnts[room - 1].isChange == 1) {
				_ua.r[8] = hn_hyundai_change_curr_mode(hnCnts[room - 1].mode);
				_ua.r[10] = (hnCnts[room - 1].setup_temp == 0xFF) ? pre_heat_temp[room - 1] : (hnCnts[room - 1].setup_temp / 2);		
			}
		}
	}
	
	if (_ua.r[8] == hn_hyundai_change_curr_mode(MODE_OUT)) {
		_ua.r[10] = 0x0F;
	}
	
	hn_hyundai_make_checkSum(11);
	_ua.r[12] = 0xEE;
		
	HYUNDAI_SEND(13)
}

// 각방 제어 요청
void hn_hyundai_ptc_make_controll(uint8_t room) {	
	if (msg_hn == 1) {
		hnCnts[room - 1].id = room;
		hnCnts[room - 1].comm = 1;
		hnCnts[room - 1].isChange = 1;
		msg_hn_more = 1;
		
		if (_ua.b[5] == 0x45) {
			if (_ua.b[7] < 0x46) {
				hnCnts[room - 1].mode = rcInfo.mode[room - 1];
				hnCnts[room - 1].setup_temp = _ua.b[7] * 2;
				
				pre_heat_temp[room - 1] = _ua.b[7];
				
			} else {
				hnCnts[room - 1].isChange = 0;
				funcInfo.boiler_water_heat = _ua.b[7] * 2;
			}
		} else if (_ua.b[5] == 0x44) {
			if (_ua.b[7] == 0x05) {
				hnCnts[room - 1].mode = MODE_HOT;
				hnCnts[room - 1].setup_temp = hnCnts[room - 1].setup_temp + 0x02;
			} else if (_ua.b[7] == 0x06) {
				hnCnts[room - 1].mode = MODE_HOT;
				hnCnts[room - 1].setup_temp = hnCnts[room - 1].setup_temp - 0x02;
			}
			
			pre_heat_temp[room - 1] = _ua.b[7];
			
		} else if (_ua.b[5] == 0x46) {
			if (_ua.b[7] == 0x01) {
				hnCnts[room - 1].mode = MODE_HOT;
				hnCnts[room - 1].setup_temp = 0xFF;
			} else if (_ua.b[7] == 0x04) {
				hnCnts[room - 1].mode = MODE_OUT;
				hnCnts[room - 1].setup_temp = 0xFF;
				pre_heat_temp[room - 1] = hn_hyundai_change_temp(room - 1, 0);
			} else if (_ua.b[7] == 0x07) {
				hnCnts[room - 1].mode = MODE_OUT;
				hnCnts[room - 1].setup_temp = 0xFF;
				pre_heat_temp[room - 1] = hn_hyundai_change_temp(room - 1, 0);
			} else if (_ua.b[7] == 0x08) {
				hnCnts[room - 1].mode = MODE_HOT;
				hnCnts[room - 1].setup_temp = 0xFF;
			}
		}
		return;
	}
	
	// 변경 중인 설정값이 없을때
	hnCnt.id = room;
	hnCnt.comm = 1;
	msg_hn = 1;
	
	if (_ua.b[5] == 0x45) {
		if (_ua.b[7] < 0x46) {
			hnCnt.mode = rcInfo.mode[room - 1];
			hnCnt.setup_temp = _ua.b[7] * 2;
			
			pre_heat_temp[room - 1] = _ua.b[7];
			
		} else {
			msg_hn = 0;
			funcInfo.boiler_water_heat = _ua.b[7] * 2;
		}
	} else if (_ua.b[5] == 0x44) {
		if (_ua.b[7] == 0x05) {
			hnCnt.mode = MODE_HOT;
			hnCnt.setup_temp = hnCnt.setup_temp + 0x02;
		} else if (_ua.b[7] == 0x06) {
			hnCnt.mode = MODE_HOT;
			hnCnt.setup_temp = hnCnt.setup_temp - 0x02;
		}
		
		pre_heat_temp[room - 1] = _ua.b[7];
		
	} else if (_ua.b[5] == 0x46) {
		if (_ua.b[7] == 0x01) {
			hnCnt.mode = MODE_HOT;
			hnCnt.setup_temp = 0xFF;
		} else if (_ua.b[7] == 0x04) {
			hnCnt.mode = MODE_OUT;
			hnCnt.setup_temp = 0xFF;
			pre_heat_temp[room - 1] = hn_hyundai_change_temp(room - 1, 0);
		} else if (_ua.b[7] == 0x07) {
			hnCnt.mode = MODE_OUT;
			hnCnt.setup_temp = 0xFF;
			pre_heat_temp[room - 1] = hn_hyundai_change_temp(room - 1, 0);
		} else if (_ua.b[7] == 0x08) {
			hnCnt.mode = MODE_HOT;
			hnCnt.setup_temp = 0xFF;
		}
	}
}

// 전체 방 상태 요청
void hn_hyundai_ptc_make_state_all(void) {
	//_ua.b[5] == 0x10;
	uint8_t i;
	uint8_t room;
	
	_ua.r[0] = 0xF7;
	_ua.r[1] = 0x22; //len
	_ua.r[2] = _ua.b[2];
	_ua.r[3] = _ua.b[3]; //TODO:
	_ua.r[4] = 0x04; 
	_ua.r[5] = _ua.b[5];
	
	_ua.r[6] = _ua.b[6]; 
	_ua.r[7] = _ua.b[7];
// 각방 상태
	room = 0;
	for (i = 8 ; i < (8+24) ; i=i+3) {
		_ua.r[i] = hn_hyundai_change_mode(room - 1);
		_ua.r[i+1] = hn_hyundai_change_temp(room - 1, 1);
		_ua.r[i+2] = hn_hyundai_change_temp(room - 1, 0);
		
		if (msg_hn == 1) {
			if (hnCnt.id == room) {
				_ua.r[i] = hn_hyundai_change_curr_mode(hnCnt.mode);
				_ua.r[i+2] = (hnCnt.setup_temp == 0xFF) ? pre_heat_temp[room - 1] : (hnCnt.setup_temp / 2);		
			} else {
				if (hnCnts[room - 1].isChange == 1) {
					_ua.r[i] = hn_hyundai_change_curr_mode(hnCnts[room - 1].mode);
					_ua.r[i+2] = (hnCnts[room - 1].setup_temp == 0xFF) ? pre_heat_temp[room - 1] : (hnCnts[room - 1].setup_temp / 2);		
				}
			}			
		}
		
		if (_ua.r[i] == hn_hyundai_change_curr_mode(MODE_OUT)) {
			_ua.r[i+2] = 0x0F;
		}
		
		room++;
	}
	
	hn_hyundai_make_checkSum(32);
	_ua.r[33] = 0xEE;
	HYUNDAI_SEND(34)
}

//전체  제어 요청
void hn_hyundai_ptc_make_controll_all(void) {	
	uint8_t i;
	hnCnt.id = 1;
	hnCnt.comm = 1;
	msg_hn = 1;
	
	if (_ua.b[5] == 0x46) {
		if (_ua.b[7] == 0x01) {
			hnCnt.mode = MODE_HOT;
			hnCnt.setup_temp = 0xFF;
		} else if (_ua.b[7] == 0x04) {
			hnCnt.comm = 0;
			hnCnt.mode = MODE_OUT;
			hnCnt.setup_temp = 0xFF;
			for (i = 0 ; i < 8 ; i++) {
				pre_heat_temp[i] = hn_hyundai_change_temp(i, 0);
			}
		} else if (_ua.b[7] == 0x07) {
			hnCnt.comm = 0;
			hnCnt.mode = MODE_OUT;
			hnCnt.setup_temp = 0xFF;
			for (i = 0 ; i < 8 ; i++) {
				pre_heat_temp[i] = hn_hyundai_change_temp(i, 0);
			}
		} else if (_ua.b[7] == 0x08) {
			hnCnt.mode = MODE_HOT;
			hnCnt.setup_temp = 0xFF;
		}
	}
}

void hn_hyundai_ptc_make(void) {
	uint8_t mode;
	
	if ((_ua.b[6] & 0x10) == 0x10) {
		mode = _ua.b[6] & 0x0F;
		if (_ua.b[4] == 0x01) { // 상태 요구
			if (mode == 0x00) {
				hn_hyundai_ptc_make_state_all();
			} else {
				hn_hyundai_ptc_make_state(mode);
			}
		} else if (_ua.b[4] == 0x02) { // 제어 요구
			if (mode == 0x00) {
				hn_hyundai_ptc_make_controll_all();
				hn_hyundai_ptc_make_state_all();
			} else {
				hn_hyundai_ptc_make_controll(mode);
				hn_hyundai_ptc_make_state(mode);
			}
		}
	}	else {
		mode = _ua.b[6] & 0x0F;
		if (_ua.b[4] == 0x02) {				// 제어 요구
			if (mode == 0x00) {
				hn_hyundai_ptc_make_controll_all();
				hn_hyundai_ptc_make_state_all();
			}
		}
	}
}

// ----------------- check --------------------------------------

uint8_t hn_hyundai_check_checkSum(void) {
	uint8_t i;
	uint8_t s;
	
	s = 0;
	for (i = 0 ; i < 9 ; i++) {
		s ^= _ua.b[i];
	}
	
	if (s == _ua.b[9]) {
		return 1;
	}
	
	return 0;
}

uint8_t hn_hyundai_ptc_base_check(void){
	if (hn_buf_count == 15) {
		hn_buf_count = 0;
	}
	
	if (_ua.b[0] != 0xF7) {
		hn_buf_error[hn_buf_count++] = 1;
		return 0;
	}
	
	if (_ua.b[3] != 0x18) {
		hn_buf_error[hn_buf_count++] = 1;
		return 0;
	}
	
	if (_ua.b[10] != 0xEE) {
		hn_buf_error[hn_buf_count++] = 1;
		return 0;
	}
	
	if (hn_hyundai_check_checkSum() == 0) {
		hn_error_checksum = 1;
		hn_buf_error[hn_buf_count++] = 1;
		return 0;
	}
	
	hn_error_checksum = 0;
	hn_type = HN_TYPE_HYUNDAI;
	hn_connect = 0;
	hn_buf_error[hn_buf_count++] = 0;
	
	ext_hn_error = 1;                             // 2015.11.03   홈넷 연결에러 체크
	
	return 1;
}

void hn_hyundai_ptc_check (void) {
	
	if (hn_hyundai_ptc_base_check() == 0) {
		return;
	}
	
	hn_hyundai_ptc_make();
	
}