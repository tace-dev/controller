   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  49                     ; 89 void BEEP_DeInit(void)
  49                     ; 90 {
  51                     	switch	.text
  52  0000               _BEEP_DeInit:
  56                     ; 91   BEEP->CSR1 = BEEP_CSR1_RESET_VALUE;
  58  0000 725f50f0      	clr	20720
  59                     ; 92   BEEP->CSR2 = BEEP_CSR2_RESET_VALUE;
  61  0004 351f50f3      	mov	20723,#31
  62                     ; 93 }
  65  0008 81            	ret	
 130                     ; 102 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 130                     ; 103 {
 131                     	switch	.text
 132  0009               _BEEP_Init:
 134  0009 88            	push	a
 135       00000000      OFST:	set	0
 138                     ; 106   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
 140                     ; 109   if ((BEEP->CSR2 & BEEP_CSR2_BEEPDIV) == BEEP_CSR2_BEEPDIV)
 142  000a c650f3        	ld	a,20723
 143  000d a41f          	and	a,#31
 144  000f a11f          	cp	a,#31
 145  0011 260c          	jrne	L15
 146                     ; 111     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 148  0013 c650f3        	ld	a,20723
 149  0016 a4e0          	and	a,#224
 150  0018 c750f3        	ld	20723,a
 151                     ; 112     BEEP->CSR2 |= BEEP_CALIBRATION_DEFAULT;
 153  001b 721050f3      	bset	20723,#0
 154  001f               L15:
 155                     ; 116   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPSEL);
 157  001f c650f3        	ld	a,20723
 158  0022 a43f          	and	a,#63
 159  0024 c750f3        	ld	20723,a
 160                     ; 117   BEEP->CSR2 |= (uint8_t)(BEEP_Frequency);
 162  0027 c650f3        	ld	a,20723
 163  002a 1a01          	or	a,(OFST+1,sp)
 164  002c c750f3        	ld	20723,a
 165                     ; 119 }
 168  002f 84            	pop	a
 169  0030 81            	ret	
 224                     ; 127 void BEEP_Cmd(FunctionalState NewState)
 224                     ; 128 {
 225                     	switch	.text
 226  0031               _BEEP_Cmd:
 230                     ; 130   assert_param(IS_FUNCTIONAL_STATE(NewState));
 232                     ; 132   if (NewState != DISABLE)
 234  0031 4d            	tnz	a
 235  0032 2705          	jreq	L101
 236                     ; 135     BEEP->CSR2 |= BEEP_CSR2_BEEPEN;
 238  0034 721a50f3      	bset	20723,#5
 241  0038 81            	ret	
 242  0039               L101:
 243                     ; 140     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPEN);
 245  0039 721b50f3      	bres	20723,#5
 246                     ; 142 }
 249  003d 81            	ret	
 285                     ; 175 void BEEP_LSClockToTIMConnectCmd(FunctionalState NewState)
 285                     ; 176 {
 286                     	switch	.text
 287  003e               _BEEP_LSClockToTIMConnectCmd:
 291                     ; 178   assert_param(IS_FUNCTIONAL_STATE(NewState));
 293                     ; 180   if (NewState != DISABLE)
 295  003e 4d            	tnz	a
 296  003f 2705          	jreq	L321
 297                     ; 183     BEEP->CSR1 |= BEEP_CSR1_MSR;
 299  0041 721050f0      	bset	20720,#0
 302  0045 81            	ret	
 303  0046               L321:
 304                     ; 188     BEEP->CSR1 &= (uint8_t)(~BEEP_CSR1_MSR);
 306  0046 721150f0      	bres	20720,#0
 307                     ; 190 }
 310  004a 81            	ret	
 357                     .const:	section	.text
 358  0000               L61:
 359  0000 000003e8      	dc.l	1000
 360                     ; 204 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 360                     ; 205 {
 361                     	switch	.text
 362  004b               _BEEP_LSICalibrationConfig:
 364  004b 5206          	subw	sp,#6
 365       00000006      OFST:	set	6
 368                     ; 210   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 370                     ; 212   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 372  004d 96            	ldw	x,sp
 373  004e 1c0009        	addw	x,#OFST+3
 374  0051 cd0000        	call	c_ltor
 376  0054 ae0000        	ldw	x,#L61
 377  0057 cd0000        	call	c_ludv
 379  005a be02          	ldw	x,c_lreg+2
 380  005c 1f03          	ldw	(OFST-3,sp),x
 381                     ; 216   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 383  005e c650f3        	ld	a,20723
 384  0061 a4e0          	and	a,#224
 385  0063 c750f3        	ld	20723,a
 386                     ; 218   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 388  0066 54            	srlw	x
 389  0067 54            	srlw	x
 390  0068 54            	srlw	x
 391  0069 1f05          	ldw	(OFST-1,sp),x
 392                     ; 220   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 394  006b 58            	sllw	x
 395  006c 58            	sllw	x
 396  006d 58            	sllw	x
 397  006e 1f01          	ldw	(OFST-5,sp),x
 398  0070 1e03          	ldw	x,(OFST-3,sp)
 399  0072 72f001        	subw	x,(OFST-5,sp)
 400  0075 1605          	ldw	y,(OFST-1,sp)
 401  0077 9058          	sllw	y
 402  0079 905c          	incw	y
 403  007b cd0000        	call	c_imul
 405  007e 1605          	ldw	y,(OFST-1,sp)
 406  0080 9058          	sllw	y
 407  0082 9058          	sllw	y
 408  0084 bf00          	ldw	c_x,x
 409  0086 9058          	sllw	y
 410  0088 90b300        	cpw	y,c_x
 411  008b 7b06          	ld	a,(OFST+0,sp)
 412  008d 2504          	jrult	L741
 413                     ; 222     BEEP->CSR2 |= (uint8_t)(A - 2U);
 415  008f a002          	sub	a,#2
 417  0091 2001          	jra	L151
 418  0093               L741:
 419                     ; 226     BEEP->CSR2 |= (uint8_t)(A - 1U);
 421  0093 4a            	dec	a
 422  0094               L151:
 423  0094 ca50f3        	or	a,20723
 424  0097 c750f3        	ld	20723,a
 425                     ; 228 }
 428  009a 5b06          	addw	sp,#6
 429  009c 81            	ret	
 442                     	xdef	_BEEP_LSICalibrationConfig
 443                     	xdef	_BEEP_LSClockToTIMConnectCmd
 444                     	xdef	_BEEP_Cmd
 445                     	xdef	_BEEP_Init
 446                     	xdef	_BEEP_DeInit
 447                     	xref.b	c_lreg
 448                     	xref.b	c_x
 467                     	xref	c_imul
 468                     	xref	c_ludv
 469                     	xref	c_ltor
 470                     	end
