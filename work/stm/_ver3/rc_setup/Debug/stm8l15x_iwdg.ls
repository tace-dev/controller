   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  82                     ; 125 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  82                     ; 126 {
  84                     .text:	section	.text,new
  85  0000               _IWDG_WriteAccessCmd:
  89                     ; 128   assert_param(IS_IWDG_WRITE_ACCESS_MODE(IWDG_WriteAccess));
  91                     ; 129   IWDG->KR = IWDG_WriteAccess; /* Write Access */
  93  0000 c750e0        	ld	20704,a
  94                     ; 130 }
  97  0003 81            	ret
 187                     ; 145 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 187                     ; 146 {
 188                     .text:	section	.text,new
 189  0000               _IWDG_SetPrescaler:
 193                     ; 148   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
 195                     ; 149   IWDG->PR = IWDG_Prescaler;
 197  0000 c750e1        	ld	20705,a
 198                     ; 150 }
 201  0003 81            	ret
 233                     ; 159 void IWDG_SetReload(uint8_t IWDG_Reload)
 233                     ; 160 {
 234                     .text:	section	.text,new
 235  0000               _IWDG_SetReload:
 239                     ; 161   IWDG->RLR = IWDG_Reload;
 241  0000 c750e2        	ld	20706,a
 242                     ; 162 }
 245  0003 81            	ret
 268                     ; 170 void IWDG_ReloadCounter(void)
 268                     ; 171 {
 269                     .text:	section	.text,new
 270  0000               _IWDG_ReloadCounter:
 274                     ; 172   IWDG->KR = IWDG_KEY_REFRESH;
 276  0000 35aa50e0      	mov	20704,#170
 277                     ; 173 }
 280  0004 81            	ret
 303                     ; 196 void IWDG_Enable(void)
 303                     ; 197 {
 304                     .text:	section	.text,new
 305  0000               _IWDG_Enable:
 309                     ; 198   IWDG->KR = IWDG_KEY_ENABLE;
 311  0000 35cc50e0      	mov	20704,#204
 312                     ; 199 }
 315  0004 81            	ret
 328                     	xdef	_IWDG_Enable
 329                     	xdef	_IWDG_ReloadCounter
 330                     	xdef	_IWDG_SetReload
 331                     	xdef	_IWDG_SetPrescaler
 332                     	xdef	_IWDG_WriteAccessCmd
 351                     	end
