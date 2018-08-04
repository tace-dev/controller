#include "function.h"
#include "rc_protocol.h"

void func_rc_command(uint8_t com1, uint8_t com2) {
	mode_mirror = 0;
	mode_factory = 0;
	mode_hotwater = 0;
	mode_reset = 0;
	
	switch(com1) {
		case COMMAND_MODE_MIRROR:
			mode_mirror = com2;
			break;
		case COMMAND_MODE_HOTWATER:
			mode_hotwater = com2;
			break;
		case COMMAND_MODE_RESET:
			mode_reset = com2;
			break;
		case COMMAND_MODE_FACTORY:
			mode_factory = com2;
			break;
	}
}

void func_rc_recover(uint8_t com) {
	mode_recover = com;
}

void func_rc_setting(void) {
	setSettingChange(1);
}

uint8_t	__func_rc_settingCb = 0;

void func_rc_settingCb(uint8_t ch) {
	__func_rc_settingCb = ch;
}