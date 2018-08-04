   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  84                     ; 125 void IWDG_WriteAccessCmd(IWDG_WriteAccess_TypeDef IWDG_WriteAccess)
  84                     ; 126 {
  86                     	switch	.text
  87  0000               _IWDG_WriteAccessCmd:
  91                     ; 128   assert_param(IS_IWDG_WRITE_ACCESS_MODE(IWDG_WriteAccess));
  93                     ; 129   IWDG->KR = IWDG_WriteAccess; /* Write Access */
  95  0000 c750e0        	ld	20704,a
  96                     ; 130 }
  99  0003 81            	ret	
 189                     ; 145 void IWDG_SetPrescaler(IWDG_Prescaler_TypeDef IWDG_Prescaler)
 189                     ; 146 {
 190                     	switch	.text
 191  0004               _IWDG_SetPrescaler:
 195                     ; 148   assert_param(IS_IWDG_PRESCALER_VALUE(IWDG_Prescaler));
 197                     ; 149   IWDG->PR = IWDG_Prescaler;
 199  0004 c750e1        	ld	20705,a
 200                     ; 150 }
 203  0007 81            	ret	
 235                     ; 159 void IWDG_SetReload(uint8_t IWDG_Reload)
 235                     ; 160 {
 236                     	switch	.text
 237  0008               _IWDG_SetReload:
 241                     ; 161   IWDG->RLR = IWDG_Reload;
 243  0008 c750e2        	ld	20706,a
 244                     ; 162 }
 247  000b 81            	ret	
 270                     ; 170 void IWDG_ReloadCounter(void)
 270                     ; 171 {
 271                     	switch	.text
 272  000c               _IWDG_ReloadCounter:
 276                     ; 172   IWDG->KR = IWDG_KEY_REFRESH;
 278  000c 35aa50e0      	mov	20704,#170
 279                     ; 173 }
 282  0010 81            	ret	
 305                     ; 196 void IWDG_Enable(void)
 305                     ; 197 {
 306                     	switch	.text
 307  0011               _IWDG_Enable:
 311                     ; 198   IWDG->KR = IWDG_KEY_ENABLE;
 313  0011 35cc50e0      	mov	20704,#204
 314                     ; 199 }
 317  0015 81            	ret	
 330                     	xdef	_IWDG_Enable
 331                     	xdef	_IWDG_ReloadCounter
 332                     	xdef	_IWDG_SetReload
 333                     	xdef	_IWDG_SetPrescaler
 334                     	xdef	_IWDG_WriteAccessCmd
 353                     	end
