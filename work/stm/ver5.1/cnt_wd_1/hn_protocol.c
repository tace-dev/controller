#include "stdafx.h"
#include "hn_protocol.h"
#include "function.h"
#include "cnt_protocol.h"

extern uint8_t msg_hn;
extern U485INFO	_ua;
extern uint8_t	packet_buf[];

uint8_t hn_connect;
uint8_t hn_type;
uint8_t hn_error_checksum = 0;
uint8_t hn_buf_error[15];
uint8_t hn_buf_count = 0;

uint8_t getHexToBin(uint8_t hex, uint8_t idx)
{
	uint8_t p = 0x80;
	p = p >> (0x08 - (idx + 0x01));

	if (hex & p)
	{
		return 1;
	}
	else
	{
		return 0;
	}
}

uint8_t hn_make_errorCode(void) {
	uint8_t code = 0;
	
	if (funcInfo.error != 0x00) {
		switch(funcInfo.error_type) {
			case ERROR_TYPE_BOILER:
				code = 0x23;
				break;
			case ERROR_TYPE_CNT:
				code = 0x60;
				break;
			case ERROR_TYPE_RC:
				code = 0x50;
				break;
			case ERROR_TYPE_HN:
				code = 0xFF;
				break;
			case ERROR_TYPE_EEPROM:
				code = 0x70;
				break;
		}
	}
	
	return code;
}

uint8_t getHax(uint8_t num) {
	uint8_t hax;
	
	hax = num;
	switch (num) {
		case 10:
			hax = 0x0A;
			break;
		case 11:
			hax = 0x0B;
			break;
		case 12:
			hax = 0x0C;
			break;
		case 13:
			hax = 0x0D;
			break;
		case 14:
			hax = 0x0E;
			break;
		case 15:
			hax = 0x0F;
			break;
	}
	
	return hax;
}

uint8_t hn_ptc_10To16(uint8_t val) {
	uint8_t n = getHax(val / 16) << 4;
	uint8_t m = getHax(val % 16);
	return n | m;
}

uint8_t hn_ptc_16To10(uint8_t val) {
	return (((val & 0xF0) >> 4 ) * 10 + (val & 0x0F));
}