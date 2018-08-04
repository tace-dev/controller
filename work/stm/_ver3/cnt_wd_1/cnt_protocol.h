#ifndef _CNT_PROTOCOL_H_
#define _CNT_PROTOCOL_H_

enum tagMode{
	MODE_HOT = 0x01,
	MODE_OUT = 0x02,
	MODE_STOP = 0x04,
	MODE_RESERVE = 0x08,
	MODE_REPEAT = 0x10,
	MODE_COMMAND = 0x20,
	MODE_OFF = 0x40
};

enum tagCheckState{
	STATE_NONE,
	STATE_NORMAL,
	STATE_SETTING,
	STATE_SUBRC,
	STATE_COMMAND_MIRROR,
	STATE_COMMAND_HOTWATER,
	STATE_COMMAND_RESET,
	STATE_COMMAND_FACTORY,
	STATE_ERROR,
	STATE_ERROR_RECOVER
};

enum ERROR_TYPE {
	ERROR_TYPE_NONE = 0,
	ERROR_TYPE_BOILER = 1,
	ERROR_TYPE_CNT,
	ERROR_TYPE_RC,
	ERROR_TYPE_HN,
	ERROR_TYPE_EEPROM
};

void cnt_ptc_baseSet(void);
void cnt_ptc_make(uint8_t *buf);
void cnt_ptc_check(uint8_t *buf);
uint8_t cnt_ptc_getCheckState(void);

#endif