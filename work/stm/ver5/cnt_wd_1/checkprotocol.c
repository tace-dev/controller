/*
 *
 *	CNV
 *
 */
#include "stdafx.h"

enum page0{
	CP_PAGE0_BYTE3= 0x00,
	CP_PAGE0_BYTE4= 0x14,
	CP_PAGE0_BYTE5= 0x32,
	CP_PAGE0_BYTE6= 0xC8,
};

enum page1{
	CP_PAGE1_BYTE3= 0x00,
	CP_PAGE1_BYTE4= 0x01,
	CP_PAGE1_BYTE5= 0x02,
	CP_PAGE1_BYTE6= 0x02,
};

enum page2{
	CP_PAGE2_BYTE3= 0x03,
	CP_PAGE2_BYTE4= 0x03,
	CP_PAGE2_BYTE5= 0x04,
	CP_PAGE2_BYTE6= 0x04,
};

enum page3{
	CP_PAGE3_BYTE3= 0x05,
	CP_PAGE3_BYTE4= 0x05,
	CP_PAGE3_BYTE5= 0x06,
	CP_PAGE3_BYTE6= 0x06,
};

enum page4{
	CP_PAGE1_BYTE3= 0x07,
	CP_PAGE1_BYTE4= 0x07,
	CP_PAGE1_BYTE5= 0x08,
	CP_PAGE1_BYTE6= 0x08,
};

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

void cp_uart1(uint8_t *buf)
{
	if (buf[0] != 0x77) return;
	if (buf[1] != 0x81) return;
	
	cp_valve = buf[2];
}

void cp_send (void)
{
	uint8_t buf* = iouart_getBuffer();
	uint8_t i;
	uint8_t s;
	
	cp_id_count++;
	cp_page_count++;
	
	if (cp_id_count > 2)
	{
		cp_id_count = 0;
	}
	
	if (cp_page_count > 4)
	{
		cp_page_count = 0;
	}
		
	buf[0] = cp_id_count;
	buf[1] = cp_page_count;
	
	if (cp_id_count == 1) 
	{
		buf[2] = 0x00;
	} 
	else
	{
		buf[2] = cp_valve;
	}
	
	switch (cp_page_count) {
		case 0:
			buf[3] = CP_PAGE0_BYTE3;
			buf[4] = CP_PAGE0_BYTE4;
			buf[5] = CP_PAGE0_BYTE5;
			buf[6] = CP_PAGE0_BYTE6;
			break;
		case 1:
			buf[3] = CP_PAGE1_BYTE3;
			buf[4] = CP_PAGE1_BYTE4;
			buf[5] = CP_PAGE1_BYTE5;
			buf[6] = CP_PAGE1_BYTE6;
			break;
		case 2:
			buf[3] = CP_PAGE2_BYTE3;
			buf[4] = CP_PAGE2_BYTE4;
			buf[5] = CP_PAGE2_BYTE5;
			buf[6] = CP_PAGE2_BYTE6;
			break;
		case 3:
			buf[3] = CP_PAGE3_BYTE3;
			buf[4] = CP_PAGE3_BYTE4;
			buf[5] = CP_PAGE3_BYTE5;
			buf[6] = CP_PAGE3_BYTE6;
			break;
		case 4:
			buf[3] = CP_PAGE4_BYTE3;
			buf[4] = CP_PAGE4_BYTE4;
			buf[5] = CP_PAGE4_BYTE5;
			buf[6] = CP_PAGE4_BYTE6;
			break;
	}
	
	s = 0;
	for (i = 0 ; i < 7 ; i++)
	{
		s += buf[i];
	}
	
	buf[7] = s;
		
	iouart_Set_Packet(0);
}

