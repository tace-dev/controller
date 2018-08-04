#include "br_protocol.h"

uint8_t br_connect = 0;
uint8_t br_type = BR_TYPE_NONE;
uint8_t br_error_checksum = 0;
uint8_t br_buf_error[15];
uint8_t br_buf_count = 0;

uint8_t br_getHexToBin(uint8_t hex, uint8_t idx)
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