   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  66                     ; 116 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  66                     ; 117 {
  67                     .text:	section	.text,new
  68  0000               f_WWDG_Init:
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
  93  0013 87            	retf	
 134                     ; 132 void WWDG_SetWindowValue(uint8_t WindowValue)
 134                     ; 133 {
 135                     .text:	section	.text,new
 136  0000               f_WWDG_SetWindowValue:
 138  0000 88            	push	a
 139       00000001      OFST:	set	1
 142                     ; 134   __IO uint8_t tmpreg = 0;
 144  0001 0f01          	clr	(OFST+0,sp)
 145                     ; 137   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
 147                     ; 140   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
 149  0003 a47f          	and	a,#127
 150  0005 1a01          	or	a,(OFST+0,sp)
 151  0007 6b01          	ld	(OFST+0,sp),a
 152                     ; 143   WWDG->WR = tmpreg;
 154  0009 7b01          	ld	a,(OFST+0,sp)
 155  000b c750d4        	ld	20692,a
 156                     ; 144 }
 159  000e 84            	pop	a
 160  000f 87            	retf	
 191                     ; 153 void WWDG_SetCounter(uint8_t Counter)
 191                     ; 154 {
 192                     .text:	section	.text,new
 193  0000               f_WWDG_SetCounter:
 197                     ; 156   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 199                     ; 160   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 201  0000 a47f          	and	a,#127
 202  0002 c750d3        	ld	20691,a
 203                     ; 161 }
 206  0005 87            	retf	
 237                     ; 184 void WWDG_Enable(uint8_t Counter)
 237                     ; 185 {
 238                     .text:	section	.text,new
 239  0000               f_WWDG_Enable:
 243                     ; 187   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 245                     ; 188   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
 247  0000 aa80          	or	a,#128
 248  0002 c750d3        	ld	20691,a
 249                     ; 189 }
 252  0005 87            	retf	
 274                     ; 213 uint8_t WWDG_GetCounter(void)
 274                     ; 214 {
 275                     .text:	section	.text,new
 276  0000               f_WWDG_GetCounter:
 280                     ; 215   return(WWDG->CR);
 282  0000 c650d3        	ld	a,20691
 285  0003 87            	retf	
 307                     ; 223 void WWDG_SWReset(void)
 307                     ; 224 {
 308                     .text:	section	.text,new
 309  0000               f_WWDG_SWReset:
 313                     ; 225   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 315  0000 358050d3      	mov	20691,#128
 316                     ; 226 }
 319  0004 87            	retf	
 331                     	xdef	f_WWDG_SWReset
 332                     	xdef	f_WWDG_GetCounter
 333                     	xdef	f_WWDG_Enable
 334                     	xdef	f_WWDG_SetCounter
 335                     	xdef	f_WWDG_SetWindowValue
 336                     	xdef	f_WWDG_Init
 355                     	end
