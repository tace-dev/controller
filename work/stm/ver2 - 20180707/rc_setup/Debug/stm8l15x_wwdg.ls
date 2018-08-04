   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  63                     ; 116 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  63                     ; 117 {
  65                     .text:	section	.text,new
  66  0000               _WWDG_Init:
  68  0000 89            	pushw	x
  69       00000000      OFST:	set	0
  72                     ; 119   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
  74                     ; 121   WWDG->WR = WWDG_WR_RESET_VALUE;
  76  0001 357f50d4      	mov	20692,#127
  77                     ; 122   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
  79  0005 9e            	ld	a,xh
  80  0006 aa80          	or	a,#128
  81  0008 c750d3        	ld	20691,a
  82                     ; 123   WWDG->WR = (uint8_t)((uint8_t)BIT_MASK & (uint8_t) WindowValue);
  84  000b 7b02          	ld	a,(OFST+2,sp)
  85  000d a47f          	and	a,#127
  86  000f c750d4        	ld	20692,a
  87                     ; 124 }
  90  0012 85            	popw	x
  91  0013 81            	ret
 133                     ; 132 void WWDG_SetWindowValue(uint8_t WindowValue)
 133                     ; 133 {
 134                     .text:	section	.text,new
 135  0000               _WWDG_SetWindowValue:
 137  0000 88            	push	a
 138       00000001      OFST:	set	1
 141                     ; 134   __IO uint8_t tmpreg = 0;
 143  0001 0f01          	clr	(OFST+0,sp)
 144                     ; 137   assert_param(IS_WWDG_WINDOW_LIMIT_VALUE(WindowValue));
 146                     ; 140   tmpreg |= (uint8_t) (WindowValue & (uint8_t) BIT_MASK);
 148  0003 a47f          	and	a,#127
 149  0005 1a01          	or	a,(OFST+0,sp)
 150  0007 6b01          	ld	(OFST+0,sp),a
 151                     ; 143   WWDG->WR = tmpreg;
 153  0009 7b01          	ld	a,(OFST+0,sp)
 154  000b c750d4        	ld	20692,a
 155                     ; 144 }
 158  000e 84            	pop	a
 159  000f 81            	ret
 191                     ; 153 void WWDG_SetCounter(uint8_t Counter)
 191                     ; 154 {
 192                     .text:	section	.text,new
 193  0000               _WWDG_SetCounter:
 197                     ; 156   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 199                     ; 160   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 201  0000 a47f          	and	a,#127
 202  0002 c750d3        	ld	20691,a
 203                     ; 161 }
 206  0005 81            	ret
 238                     ; 184 void WWDG_Enable(uint8_t Counter)
 238                     ; 185 {
 239                     .text:	section	.text,new
 240  0000               _WWDG_Enable:
 244                     ; 187   assert_param(IS_WWDG_COUNTER_VALUE(Counter));
 246                     ; 188   WWDG->CR = (uint8_t)(WWDG_CR_WDGA | Counter);
 248  0000 aa80          	or	a,#128
 249  0002 c750d3        	ld	20691,a
 250                     ; 189 }
 253  0005 81            	ret
 276                     ; 213 uint8_t WWDG_GetCounter(void)
 276                     ; 214 {
 277                     .text:	section	.text,new
 278  0000               _WWDG_GetCounter:
 282                     ; 215   return(WWDG->CR);
 284  0000 c650d3        	ld	a,20691
 287  0003 81            	ret
 310                     ; 223 void WWDG_SWReset(void)
 310                     ; 224 {
 311                     .text:	section	.text,new
 312  0000               _WWDG_SWReset:
 316                     ; 225   WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 318  0000 358050d3      	mov	20691,#128
 319                     ; 226 }
 322  0004 81            	ret
 335                     	xdef	_WWDG_SWReset
 336                     	xdef	_WWDG_GetCounter
 337                     	xdef	_WWDG_Enable
 338                     	xdef	_WWDG_SetCounter
 339                     	xdef	_WWDG_SetWindowValue
 340                     	xdef	_WWDG_Init
 359                     	end
