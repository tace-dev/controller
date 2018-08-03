   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  64                     ; 47 void WWDG_Init(uint8_t Counter, uint8_t WindowValue)
  64                     ; 48 {
  66                     	switch	.text
  67  0000               _WWDG_Init:
  69  0000 89            	pushw	x
  70       00000000      OFST:	set	0
  73                     ; 50     assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
  75                     ; 52     WWDG->WR = WWDG_WR_RESET_VALUE;
  77  0001 357f50d2      	mov	20690,#127
  78                     ; 53     WWDG->CR = (uint8_t)((uint8_t)(WWDG_CR_WDGA | WWDG_CR_T6) | (uint8_t)Counter);
  80  0005 9e            	ld	a,xh
  81  0006 aac0          	or	a,#192
  82  0008 c750d1        	ld	20689,a
  83                     ; 54     WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
  85  000b 7b02          	ld	a,(OFST+2,sp)
  86  000d aa40          	or	a,#64
  87  000f a47f          	and	a,#127
  88  0011 c750d2        	ld	20690,a
  89                     ; 55 }
  92  0014 85            	popw	x
  93  0015 81            	ret
 127                     ; 63 void WWDG_SetCounter(uint8_t Counter)
 127                     ; 64 {
 128                     	switch	.text
 129  0016               _WWDG_SetCounter:
 133                     ; 67     assert_param(IS_WWDG_COUNTERVALUE_OK(Counter));
 135                     ; 71   WWDG->CR = (uint8_t)(Counter & (uint8_t)BIT_MASK);
 137  0016 a47f          	and	a,#127
 138  0018 c750d1        	ld	20689,a
 139                     ; 73 }
 142  001b 81            	ret
 165                     ; 82 uint8_t WWDG_GetCounter(void)
 165                     ; 83 {
 166                     	switch	.text
 167  001c               _WWDG_GetCounter:
 171                     ; 84     return(WWDG->CR);
 173  001c c650d1        	ld	a,20689
 176  001f 81            	ret
 199                     ; 92 void WWDG_SWReset(void)
 199                     ; 93 {
 200                     	switch	.text
 201  0020               _WWDG_SWReset:
 205                     ; 94     WWDG->CR = WWDG_CR_WDGA; /* Activate WWDG, with clearing T6 */
 207  0020 358050d1      	mov	20689,#128
 208                     ; 95 }
 211  0024 81            	ret
 246                     ; 104 void WWDG_SetWindowValue(uint8_t WindowValue)
 246                     ; 105 {
 247                     	switch	.text
 248  0025               _WWDG_SetWindowValue:
 252                     ; 107     assert_param(IS_WWDG_WINDOWLIMITVALUE_OK(WindowValue));
 254                     ; 109     WWDG->WR = (uint8_t)((uint8_t)(~WWDG_CR_WDGA) & (uint8_t)(WWDG_CR_T6 | WindowValue));
 256  0025 aa40          	or	a,#64
 257  0027 a47f          	and	a,#127
 258  0029 c750d2        	ld	20690,a
 259                     ; 110 }
 262  002c 81            	ret
 275                     	xdef	_WWDG_SetWindowValue
 276                     	xdef	_WWDG_SWReset
 277                     	xdef	_WWDG_GetCounter
 278                     	xdef	_WWDG_SetCounter
 279                     	xdef	_WWDG_Init
 298                     	end
