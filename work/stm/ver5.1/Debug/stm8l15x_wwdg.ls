   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  65                     ; 116 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  65                     ; 117 {
  67                     	switch	.text
  68  0000               _WWDG_Init:
  70  0000 89            	pushw	x
  71       00000000      OFST:	set	0
  74                     ; 119   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  76                     ; 121   WWDG->WR = WWDG_WR_RESET_VALUE;
  78  0001 357f50d4      	mov	20692,#127
  79                     ; 122   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  81  0005 9e            	ld	a,xh
  82  0006 aa80          	or	a,#128
  83  0008 c750d3        	ld	20691,a
  84                     ; 123   WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WindowValue);
  86  000b 7b02          	ld	a,(OFST+2,sp)
  87  000d a47f          	and	a,#127
  88  000f c750d4        	ld	20692,a
  89                     ; 124 }
  92  0012 85            	popw	x
  93  0013 81            	ret	
 135                     ; 132 void WWDG_SetWindowValue(uint8_t WindowValue)
 135                     ; 133 {
 136                     	switch	.text
 137  0014               _WWDG_SetWindowValue:
 139  0014 88            	push	a
 140       00000001      OFST:	set	1
 143                     ; 134   __IO uint8_t tmpreg = 0;
 145  0015 0f01          	clr	(OFST+0,sp)
 146                     ; 137   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
 148                     ; 140   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
 150  0017 a47f          	and	a,#127
 151  0019 1a01          	or	a,(OFST+0,sp)
 152  001b 6b01          	ld	(OFST+0,sp),a
 153                     ; 143   WWDG->WR = tmpreg;
 155  001d 7b01          	ld	a,(OFST+0,sp)
 156  001f c750d4        	ld	20692,a
 157                     ; 144 }
 160  0022 84            	pop	a
 161  0023 81            	ret	
 193                     ; 153 void WWDG_SetCounter(uint8_t Counter)
 193                     ; 154 {
 194                     	switch	.text
 195  0024               _WWDG_SetCounter:
 199                     ; 156   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 201                     ; 160   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 203  0024 a47f          	and	a,#127
 204  0026 c750d3        	ld	20691,a
 205                     ; 161 }
 208  0029 81            	ret	
 240                     ; 184 void WWDG_Enable(uint8_t Counter)
 240                     ; 185 {
 241                     	switch	.text
 242  002a               _WWDG_Enable:
 246                     ; 187   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 248                     ; 188   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
 250  002a aa80          	or	a,#128
 251  002c c750d3        	ld	20691,a
 252                     ; 189 }
 255  002f 81            	ret	
 278                     ; 213 uint8_t WWDG_GetCounter(void)
 278                     ; 214 {
 279                     	switch	.text
 280  0030               _WWDG_GetCounter:
 284                     ; 215   return(WWDG->CR);
 286  0030 c650d3        	ld	a,20691
 289  0033 81            	ret	
 312                     ; 223 void WWDG_SWReset(void)
 312                     ; 224 {
 313                     	switch	.text
 314  0034               _WWDG_SWReset:
 318                     ; 225   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 320  0034 358050d3      	mov	20691,#128
 321                     ; 226 }
 324  0038 81            	ret	
 337                     	xdef	_WWDG_SWReset
 338                     	xdef	_WWDG_GetCounter
 339                     	xdef	_WWDG_Enable
 340                     	xdef	_WWDG_SetCounter
 341                     	xdef	_WWDG_SetWindowValue
 342                     	xdef	_WWDG_Init
 361                     	end
