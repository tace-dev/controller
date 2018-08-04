#include "br_protocol.h"
#include "cnt_protocol.h"
#include "hn_protocol.h"

#if defined (_DAEWOO_BOILER_)

uint8_t dw_error_reset = 0;
uint8_t dw_error_reset_count = 5;

BRINFO_DW	_dwInfo;

#if	0

#define RN_RES	0x50
#define RN_SEND	0xA0
#define COUNT_HEAT_WATER 22
#define COUNT_SHOWER_WATER 16

extern uint8_t _is_shower;

uint8_t state = 0;

//extern void	rn_parity_make(void);

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
#endif

extern uint8_t	*iouart9d_getBuffer(void);
extern void	iouart9d_Set_Packet(uint8_t wait);
extern void	iouart9d_Pkt_Start(void);

#define DW_WAIT	1

#define BR_DW_WARM_WATER	0xc3
#define BR_DW_STOP			0xb4	//+00
#define BR_DW_SET_TEMPE		0x20
#define BR_DW_SET_TEMPE_1	0x27
#define BR_DW_SET_WATER		0xf0
#define BR_DW_TEST			0x92
#define BR_DW_RC_ON			0x22
#define BR_DW_FAST_WATER	0xa5	//+80
#define BR_DW_OUTER			0x52

#define BR_DW_ERROR			0x78

#define BR_DW_MODE_HEAT		0x3c
#define BR_DW_MODE_WATER	0x2d
#define BR_DW_MODE_OFF		0x5a
#define BR_DW_RESTART		0x87
#define BR_DW_FAST			0x69

typedef struct tagBrDw
{
	uint8_t	enable;
	uint8_t	i;
	uint8_t	type;
	uint8_t	err[3];
	uint8_t	mode;	//	
	uint8_t	temp_water;
	uint8_t	temp_heat;
	uint8_t	b[4];
}	BRDW, *LPBRDW;

BRDW	brDw;

LPBRDW	get_brDw(void)
{
	return &brDw;
}

void br_dw_ptc_make(void) 
{
	LPBRDW	p = get_brDw();
	uint8_t i, j;
	uint8_t result;

	i = funcInfo.rcLED | funcInfo.sub_rcLED;
	if( i == 0 )
	{
		p->b[0] = 0xc3;
		//	RC power off:b400
	}
	else
	{
		switch(p->type)
		{
			case	0:	i = 0x20;	j = funcInfo.boiler_set_water_heat;	break;
			case	1:	i = 0xf0;	j = funcInfo.boiler_set_water_shower;	break;
		}
		p->type = (p->type+1)%2;
		p->b[0] = i;
		j /= 2;
		p->b[1] = ((j/10)<<4)|(j%10);
	}
	/*
	uint8_t *buf = iouart9_getBuffer();
	
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
	buf[1] = 0x00;
	
//		buf[1] = funcInfo.rcLED | funcInfo.sub_rcLED;
//		buf[2] = funcInfo.boiler_water_shower;
//		buf[3] = funcInfo.boiler_water_heat;
		*/
/*
	//	if error
	func_cnt_error(ERROR_TYPE_BOILER, 1);
	//	if error recover
	p->b[1] = 0x22;
	p->b[2] = 0;
	
	p->b[2] = p->b[0] + p->b[1] + 1;
*/
	iouart9d_Set_Packet(DW_WAIT);
	iouart9d_Pkt_Start();
}

void br_dw_ptc_check(uint8_t *buf) 
{
	br_type = BR_TYPE_DW;
	
//	if ((buf[0] & 0xF0) != RN_RES) {
//		ext_br_error = 0;
//		return;
//	}
	
	br_connect = 0;	//	boiler timeout clear
	ext_br_error = 1;
	_dwInfo.br_err = 0;
	switch( buf[0] )
	{
		case 0x78:
			_dwInfo.br_err = buf[1];
			break;
		case 0x87:	//	refire
		case 0x2d:	//	shower
		case 0x69:	//	fast heat_temp
		case 0x3c:	//	heat_t
		case 0x5a:	//	off-boiler
			//_dwInfo.br_heat_t = buf[1];
			break;		
	}
	/*
	*/
	if (_dwInfo.br_err/*state_error*/ != 0) 
	{
		if( dw_error_reset != 1 )
			func_cnt_error(ERROR_TYPE_BOILER, _dwInfo.br_err);
	}  
	else 
	{
		if( funcInfo.error_type == ERROR_TYPE_BOILER )
			func_cnt_errorReset();
	}
	//br_dw_ptc_make();
}


void br_dw_cntl(uint8_t cmd)
{
	
}

void br_dw_error_reset(void) {
	dw_error_reset = 1;
}

#endif
