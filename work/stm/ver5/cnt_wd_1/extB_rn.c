#include "br_protocol.h"
#include "cnt_protocol.h"
#include "hn_protocol.h"

#define RN_RES	0x50
#define RN_SEND	0xA0
#define RN_WAIT	50
#define COUNT_HEAT_WATER 22
#define COUNT_SHOWER_WATER 16

extern uint8_t _is_shower;
uint8_t *buff;
BRINFO_RN _rnInfo;

uint8_t rn_error_reset = 0;
uint8_t rn_error_reset_count = 5;
uint8_t state = 0;

// 난방수 코드값 (-40)
uint8_t rn_heat_water[] = {
	0x00,0x28,0x18,0x38,0x04,0x24,
	0x14,0x34,0x0C,0x2C,0x1C,0x3C,0x02,0x22,0x12,0x32,
	0x0A,0x26,0x1E,0x31,0x05,0x2D
};

// 난방수 실제 값
uint8_t rn_real_heat_water[] = {
	40,45,46,47,48,49,
	50,51,52,53,54,55,56,57,58,59,
	60,65,70,75,80,85
};

// 온수 코드 값
uint8_t rn_shower_water[] = {
	0x00,0x08,0x04,0x0C,0x02,0x0A,0x06,0x0E,0x01,0x09,0x05,0x0D,0x03,0x0B,0x07,0x0F
};

// 온수 실제 값
uint8_t rn_real_shower_water[] = {
	35,36,37,38,39,40,41,42,43,44,45,46,47,50,55,60
};

/*
uint8_t rn_wd_heat_water_table[] = {
	40,45,50,55,60,65,70,75,80,85
};

uint8_t rn_wd_shower_water_table[] = {
	30,31,32,33,34,35,36,37,38,39,
	40,41,42,43,44,45,46,47,48,49,
	50,51,52,53,54,55,56,57,58,59,
	60
};
*/
/*
uint8_t rn_wd_heat_water_matching_table[] = {
	0, 1, 6, 11, 16, 17, 18, 19, 20, 21
};
*/
uint8_t rn_wd_shower_water_matching_table[] = {
	 0, 0, 0, 0, 0, 0, 1, 2, 3, 4,
	 5, 6, 7, 8, 9,10,11,12,12,12,
	13,13,13,13,13,14,14,14,14,14,
	15
};

extern uint8_t	*iouart9_getBuffer(void);
extern void	iouart9_Set_Packet(uint8_t wait);
extern void	iouart9_Pkt_Start(void);
extern void	rn_parity_make(void);

uint8_t br_rn_isvalveOpen(void) {
	uint8_t i;
	uint8_t result;
	uint8_t led = funcInfo.rcLED | funcInfo.sub_rcLED;

	result = 0;
	for (i = 0 ; i < 8 ; i++) {
		if (br_getHexToBin(led, i) == 1) {
			result = 1;
			break;
		}
	}
	
	return result;
}

uint8_t br_rn_control_num(uint8_t isHeat) {
	uint8_t num = 0;
	uint8_t i;
	
	if (isHeat == 1) {
		for (i = 0 ; i < COUNT_HEAT_WATER ; i++) {
			if (rn_heat_water[i] == _rnInfo.set_heat_water_temp) {
				num = i;
				break;
			}
		}
	} else {
		for (i = 0 ; i < COUNT_SHOWER_WATER ; i++) {
			if (rn_shower_water[i] == _rnInfo.set_shower_water_temp) {
				num = i;
				break;
			}
		}
	}
	
	return num;
	
}

uint8_t br_rn_control_UPDOWN(uint8_t isHeat) {
	uint8_t step = 0;
	uint8_t result = 0;
	uint8_t temp = 0;
	
	if (isHeat == 1) {
		//step = (funcInfo.boiler_set_water_heat - 40) / 5;
		//step = rn_wd_heat_water_matching_table[step];
		step = br_rn_control_num(isHeat);
		
		if (funcInfo.boiler_set_water_heat > rn_real_heat_water[step]) {
			result = 1;
		} else if (funcInfo.boiler_set_water_heat < rn_real_heat_water[step]) { 
			result = 2;
		} else {
			result = 0;
		}
		/*
		if (step > br_rn_control_num(isHeat)) {
			result = 1;
		} else if (step < br_rn_control_num(isHeat)) { 
			result = 2;
		} else {
			result = 0;
		}
		*/
	} else {
		/*
		step = funcInfo.boiler_set_water_shower;
		step = rn_wd_shower_water_matching_table[step];
		
		if (step > br_rn_control_num(isHeat)) {
			result = 1;
		} else if (step < br_rn_control_num(isHeat)) { 
			result = 2;
		} else {
			result = 0;
		}
		*/
		step = br_rn_control_num(isHeat);
		
		if (funcInfo.boiler_set_water_shower > rn_real_shower_water[step]) {
			result = 1;
		} else if (funcInfo.boiler_set_water_shower < rn_real_shower_water[step]) { 
			result = 2;
		} else {
			result = 0;
		}
	}
	
	return result;
}

void br_rn_ptc_make(void) {
	uint8_t i;
	uint8_t result;
	
	uint8_t *buf = iouart9_getBuffer();
	for (i = 0 ; i < 4 ; i++) {
		buf[i] = 0x00;
	}
	
	buf[0] = RN_SEND;
	if (rn_error_reset == 1) {
		rn_error_reset_count--;
		if (rn_error_reset_count == 0) {
			rn_error_reset = 0;
			rn_error_reset_count = 5;
			_rnInfo.error_code = 0;
		}
		
		buf[0] |= 0x00;
	} else {
		buf[0] |= 0x08;
		buf[0] |= br_rn_isvalveOpen() << 2;
	}
	//buf[0] |= 0x01 << 2;
	
	buf[1] = 0x00;
	
	state++;
	
	if ((state % 3) == 0) {
		result = br_rn_control_UPDOWN(0);  // 1 : 난방수  0 : 온수
		
		if (result == 1) {
			buf[1] |= 0x01 << 3;
		} else if (result == 2){
			buf[1] |= 0x01 << 2;
		} else {
			buf[1] |= 0x00;
		}
		//buf[1] |= 0x01 << 4;
		
		result = br_rn_control_UPDOWN(1);
		
		if (result == 1) {
			buf[1] |= 0x01 << 6;
		} else if (result == 2){
			buf[1] |= 0x01 << 5;
		} else {
			buf[1] |= 0x00;
		}
		//buf[1] |= 0x01 << 7;
		
		state = 0;
	}
	
	rn_parity_make();
	iouart9_Set_Packet(RN_WAIT);
	iouart9_Pkt_Start();
}

uint8_t br_rn_ptc_change_BCDToHex(uint8_t val) {
	uint8_t a;
	uint8_t b;
	
	a = (val & 0xF0) >> 4;
	b = (val & 0x0F);
	
	return b + (a * 10);
}

uint8_t	__rn_b(uint8_t i)
{
	//	b7 ->1
	uint8_t	t, a, b;
	t = 0;
	a = i & 0x01;
	b = i & 0x80;
	t |= (a<<7) | (b>>7);
	a = i & 0x02;
	b = i & 0x40;
	t |= (a<<5) | (b>>5);
	a = i & 0x04;
	b = i & 0x20;
	t |= (a<<3) | (b>>3);
	a = i & 0x08;
	b = i & 0x10;
	t |= (a<<1) | (b>>1);
	return t;
}

void br_rn_ptc_check(uint8_t *buf) {
	br_type = BR_TYPE_RN;
	
	if ((buf[0] & 0xF0) != RN_RES) {
		ext_br_error = 0;
		return;
	}
	
	br_connect = 0;
	ext_br_error = 1;
	
	_rnInfo.state_heat = br_getHexToBin(buf[0], 3);
	_rnInfo.state_shower = br_getHexToBin(buf[0], 2);
	_rnInfo.state_error = br_getHexToBin(buf[0], 1);
	
	if (_rnInfo.state_error != 0) {
		if (rn_error_reset != 1){
			_rnInfo.error_code = __rn_b((buf[3] >> 1)) | ((buf[2] >> 1) & 0x01);
			func_cnt_error(ERROR_TYPE_BOILER, br_rn_ptc_change_BCDToHex(_rnInfo.error_code));
		}
	}  else {
		if (funcInfo.error_type == ERROR_TYPE_BOILER) {
			func_cnt_errorReset();
		}
		
		_rnInfo.curr_heat_water_temp = __rn_b((buf[3] >> 1)) | ((buf[2] >> 1) & 0x01);
	}
	
	_rnInfo.set_heat_water_temp = ((buf[1] & 0xFC) >> 2);
	_rnInfo.state_heat_play = ((buf[1] & 0x02) >> 1);
	
	_rnInfo.set_shower_water_temp = ((buf[2] & 0xF0) >> 4);
	_rnInfo.state_fire = ((buf[2] & 0x0C) >> 1);
	
	br_rn_ptc_make();
}

void br_rn_error_reset(void) {
	rn_error_reset = 1;
}