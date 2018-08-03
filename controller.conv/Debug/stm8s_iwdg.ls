   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  79                     ; 42 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  79                     ; 43 {
  81                     	switch	.text
  82  0000               _IWDG_WriteAccessCmd:
  86                     ; 45     assert_param(IS_IWDG_WRITEACCESS_MODE_OK(IWDG_WriteAccess));
  88                     ; 47     IWDG->KR = (uint8_t)IWDG_WriteAccess; /* Write Access */
  90  0000 c750e0        	ld	20704,a
  91                     ; 48 }
  94  0003 81            	ret
 184                     ; 57 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 184                     ; 58 {
 185                     	switch	.text
 186  0004               _IWDG_SetPrescaler:
 190                     ; 60     assert_param(IS_IWDG_PRESCALER_OK(IWDG_Prescaler));
 192                     ; 62     IWDG->PR = (uint8_t)IWDG_Prescaler;
 194  0004 c750e1        	ld	20705,a
 195                     ; 63 }
 198  0007 81            	ret
 232                     ; 72 void IWDG_SetReload(uint8_t IWDG_Reload)
 232                     ; 73 {
 233                     	switch	.text
 234  0008               _IWDG_SetReload:
 238                     ; 74     IWDG->RLR = IWDG_Reload;
 240  0008 c750e2        	ld	20706,a
 241                     ; 75 }
 244  000b 81            	ret
 267                     ; 83 void IWDG_ReloadCounter(void)
 267                     ; 84 {
 268                     	switch	.text
 269  000c               _IWDG_ReloadCounter:
 273                     ; 85     IWDG->KR = IWDG_KEY_REFRESH;
 275  000c 35aa50e0      	mov	20704,#170
 276                     ; 86 }
 279  0010 81            	ret
 302                     ; 93 void IWDG_Enable(void)
 302                     ; 94 {
 303                     	switch	.text
 304  0011               _IWDG_Enable:
 308                     ; 95     IWDG->KR = IWDG_KEY_ENABLE;
 310  0011 35cc50e0      	mov	20704,#204
 311                     ; 96 }
 314  0015 81            	ret
 327                     	xdef	_IWDG_Enable
 328                     	xdef	_IWDG_ReloadCounter
 329                     	xdef	_IWDG_SetReload
 330                     	xdef	_IWDG_SetPrescaler
 331                     	xdef	_IWDG_WriteAccessCmd
 350                     	end
