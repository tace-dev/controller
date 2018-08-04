   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  85                     ; 125 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  85                     ; 126 {
  87                     .text:	section	.text,new
  88  0000               _IWDG_WriteAccessCmd:
  92                     ; 128   assert_param(IS_IWDG_WRITE_ACCESS_MODE(IWDG_WriteAccess));
  94                     ; 129   IWDG->KR = IWDG_WriteAccess; /* Write Access */
  96  0000 c750e0        	ld	20704,a
  97                     ; 130 }
 100  0003 81            	ret	
 190                     ; 145 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 190                     ; 146 {
 191                     .text:	section	.text,new
 192  0000               _IWDG_SetPrescaler:
 196                     ; 148   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
 198                     ; 149   IWDG->PR = IWDG_Prescaler;
 200  0000 c750e1        	ld	20705,a
 201                     ; 150 }
 204  0003 81            	ret	
 236                     ; 159 void IWDG_SetReload(uint8_t IWDG_Reload)
 236                     ; 160 {
 237                     .text:	section	.text,new
 238  0000               _IWDG_SetReload:
 242                     ; 161   IWDG->RLR = IWDG_Reload;
 244  0000 c750e2        	ld	20706,a
 245                     ; 162 }
 248  0003 81            	ret	
 271                     ; 170 void IWDG_ReloadCounter(void)
 271                     ; 171 {
 272                     .text:	section	.text,new
 273  0000               _IWDG_ReloadCounter:
 277                     ; 172   IWDG->KR = IWDG_KEY_REFRESH;
 279  0000 35aa50e0      	mov	20704,#170
 280                     ; 173 }
 283  0004 81            	ret	
 306                     ; 196 void IWDG_Enable(void)
 306                     ; 197 {
 307                     .text:	section	.text,new
 308  0000               _IWDG_Enable:
 312                     ; 198   IWDG->KR = IWDG_KEY_ENABLE;
 314  0000 35cc50e0      	mov	20704,#204
 315                     ; 199 }
 318  0004 81            	ret	
 331                     	xdef	_IWDG_Enable
 332                     	xdef	_IWDG_ReloadCounter
 333                     	xdef	_IWDG_SetReload
 334                     	xdef	_IWDG_SetPrescaler
 335                     	xdef	_IWDG_WriteAccessCmd
 354                     	end
