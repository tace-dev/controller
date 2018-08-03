   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  44                     ; 48 void BEEP_DeInit(void)
  44                     ; 49 {
  46                     	switch	.text
  47  0000               _BEEP_DeInit:
  51                     ; 50     BEEP->CSR = BEEP_CSR_RESET_VALUE;
  53  0000 351f50f3      	mov	20723,#31
  54                     ; 51 }
  57  0004 81            	ret
 122                     ; 61 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 122                     ; 62 {
 123                     	switch	.text
 124  0005               _BEEP_Init:
 126  0005 88            	push	a
 127       00000000      OFST:	set	0
 130                     ; 65     assert_param(IS_BEEP_FREQUENCY_OK(BEEP_Frequency));
 132                     ; 68     if ((BEEP->CSR & BEEP_CSR_BEEPDIV) == BEEP_CSR_BEEPDIV)
 134  0006 c650f3        	ld	a,20723
 135  0009 a41f          	and	a,#31
 136  000b a11f          	cp	a,#31
 137  000d 2610          	jrne	L15
 138                     ; 70         BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 140  000f c650f3        	ld	a,20723
 141  0012 a4e0          	and	a,#224
 142  0014 c750f3        	ld	20723,a
 143                     ; 71         BEEP->CSR |= BEEP_CALIBRATION_DEFAULT;
 145  0017 c650f3        	ld	a,20723
 146  001a aa0b          	or	a,#11
 147  001c c750f3        	ld	20723,a
 148  001f               L15:
 149                     ; 75     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPSEL);
 151  001f c650f3        	ld	a,20723
 152  0022 a43f          	and	a,#63
 153  0024 c750f3        	ld	20723,a
 154                     ; 76     BEEP->CSR |= (uint8_t)(BEEP_Frequency);
 156  0027 c650f3        	ld	a,20723
 157  002a 1a01          	or	a,(OFST+1,sp)
 158  002c c750f3        	ld	20723,a
 159                     ; 78 }
 162  002f 84            	pop	a
 163  0030 81            	ret
 218                     ; 87 void BEEP_Cmd(FunctionalState NewState)
 218                     ; 88 {
 219                     	switch	.text
 220  0031               _BEEP_Cmd:
 224                     ; 89     if (NewState != DISABLE)
 226  0031 4d            	tnz	a
 227  0032 2706          	jreq	L101
 228                     ; 92         BEEP->CSR |= BEEP_CSR_BEEPEN;
 230  0034 721a50f3      	bset	20723,#5
 232  0038 2004          	jra	L301
 233  003a               L101:
 234                     ; 97         BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPEN);
 236  003a 721b50f3      	bres	20723,#5
 237  003e               L301:
 238                     ; 99 }
 241  003e 81            	ret
 294                     .const:	section	.text
 295  0000               L41:
 296  0000 000003e8      	dc.l	1000
 297                     ; 114 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 297                     ; 115 {
 298                     	switch	.text
 299  003f               _BEEP_LSICalibrationConfig:
 301  003f 5206          	subw	sp,#6
 302       00000006      OFST:	set	6
 305                     ; 121     assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 307                     ; 123     lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 309  0041 96            	ldw	x,sp
 310  0042 1c0009        	addw	x,#OFST+3
 311  0045 cd0000        	call	c_ltor
 313  0048 ae0000        	ldw	x,#L41
 314  004b cd0000        	call	c_ludv
 316  004e be02          	ldw	x,c_lreg+2
 317  0050 1f03          	ldw	(OFST-3,sp),x
 319                     ; 127     BEEP->CSR &= (uint8_t)(~BEEP_CSR_BEEPDIV); /* Clear bits */
 321  0052 c650f3        	ld	a,20723
 322  0055 a4e0          	and	a,#224
 323  0057 c750f3        	ld	20723,a
 324                     ; 129     A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 326  005a 1e03          	ldw	x,(OFST-3,sp)
 327  005c 54            	srlw	x
 328  005d 54            	srlw	x
 329  005e 54            	srlw	x
 330  005f 1f05          	ldw	(OFST-1,sp),x
 332                     ; 131     if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 334  0061 1e05          	ldw	x,(OFST-1,sp)
 335  0063 58            	sllw	x
 336  0064 58            	sllw	x
 337  0065 58            	sllw	x
 338  0066 1f01          	ldw	(OFST-5,sp),x
 340  0068 1e03          	ldw	x,(OFST-3,sp)
 341  006a 72f001        	subw	x,(OFST-5,sp)
 342  006d 1605          	ldw	y,(OFST-1,sp)
 343  006f 9058          	sllw	y
 344  0071 905c          	incw	y
 345  0073 cd0000        	call	c_imul
 347  0076 1605          	ldw	y,(OFST-1,sp)
 348  0078 9058          	sllw	y
 349  007a 9058          	sllw	y
 350  007c 9058          	sllw	y
 351  007e bf00          	ldw	c_x,x
 352  0080 90b300        	cpw	y,c_x
 353  0083 250c          	jrult	L331
 354                     ; 133         BEEP->CSR |= (uint8_t)(A - 2U);
 356  0085 7b06          	ld	a,(OFST+0,sp)
 357  0087 a002          	sub	a,#2
 358  0089 ca50f3        	or	a,20723
 359  008c c750f3        	ld	20723,a
 361  008f 2009          	jra	L531
 362  0091               L331:
 363                     ; 137         BEEP->CSR |= (uint8_t)(A - 1U);
 365  0091 7b06          	ld	a,(OFST+0,sp)
 366  0093 4a            	dec	a
 367  0094 ca50f3        	or	a,20723
 368  0097 c750f3        	ld	20723,a
 369  009a               L531:
 370                     ; 139 }
 373  009a 5b06          	addw	sp,#6
 374  009c 81            	ret
 387                     	xdef	_BEEP_LSICalibrationConfig
 388                     	xdef	_BEEP_Cmd
 389                     	xdef	_BEEP_Init
 390                     	xdef	_BEEP_DeInit
 391                     	xref.b	c_lreg
 392                     	xref.b	c_x
 411                     	xref	c_imul
 412                     	xref	c_ludv
 413                     	xref	c_ltor
 414                     	end
