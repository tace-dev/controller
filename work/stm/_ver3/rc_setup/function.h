#ifndef _FUNCTION_H_
#define _FUNCTION_H_
#include "stdafx.h"

void func_rc_mode_heat(uint8_t curr, uint8_t temp);
void func_rc_mode_out(uint8_t curr);
void func_rc_mode_stop(uint8_t curr);
void func_rc_mode_reserve(uint8_t curr, uint8_t temp, uint8_t time);
void func_rc_mode_repeat(uint8_t curr, uint8_t time);
void func_rc_command(uint8_t com1, uint8_t com2);
void func_rc_recover(uint8_t com);
void func_rc_setting(void);
void func_rc_settingCb(uint8_t ch);
#endif