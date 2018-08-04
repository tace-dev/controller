   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  47                     ; 89 void BEEP_DeInit(void)
  47                     ; 90 {
  49                     .text:	section	.text,new
  50  0000               _BEEP_DeInit:
  54                     ; 91   BEEP->CSR1 = BEEP_CSR1_RESET_VALUE;
  56  0000 725f50f0      	clr	20720
  57                     ; 92   BEEP->CSR2 = BEEP_CSR2_RESET_VALUE;
  59  0004 351f50f3      	mov	20723,#31
  60                     ; 93 }
  63  0008 81            	ret
 128                     ; 102 void BEEP_Init(BEEP_Frequency_TypeDef BEEP_Frequency)
 128                     ; 103 {
 129                     .text:	section	.text,new
 130  0000               _BEEP_Init:
 132  0000 88            	push	a
 133       00000000      OFST:	set	0
 136                     ; 106   assert_param(IS_BEEP_FREQUENCY(BEEP_Frequency));
 138                     ; 109   if ((BEEP->CSR2 & BEEP_CSR2_BEEPDIV) == BEEP_CSR2_BEEPDIV)
 140  0001 c650f3        	ld	a,20723
 141  0004 a41f          	and	a,#31
 142  0006 a11f          	cp	a,#31
 143  0008 260c          	jrne	L15
 144                     ; 111     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 146  000a c650f3        	ld	a,20723
 147  000d a4e0          	and	a,#224
 148  000f c750f3        	ld	20723,a
 149                     ; 112     BEEP->CSR2 |= BEEP_CALIBRATION_DEFAULT;
 151  0012 721050f3      	bset	20723,#0
 152  0016               L15:
 153                     ; 116   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPSEL);
 155  0016 c650f3        	ld	a,20723
 156  0019 a43f          	and	a,#63
 157  001b c750f3        	ld	20723,a
 158                     ; 117   BEEP->CSR2 |= (uint8_t)(BEEP_Frequency);
 160  001e c650f3        	ld	a,20723
 161  0021 1a01          	or	a,(OFST+1,sp)
 162  0023 c750f3        	ld	20723,a
 163                     ; 119 }
 166  0026 84            	pop	a
 167  0027 81            	ret
 222                     ; 127 void BEEP_Cmd(FunctionalState NewState)
 222                     ; 128 {
 223                     .text:	section	.text,new
 224  0000               _BEEP_Cmd:
 228                     ; 130   assert_param(IS_FUNCTIONAL_STATE(NewState));
 230                     ; 132   if (NewState != DISABLE)
 232  0000 4d            	tnz	a
 233  0001 2706          	jreq	L101
 234                     ; 135     BEEP->CSR2 |= BEEP_CSR2_BEEPEN;
 236  0003 721a50f3      	bset	20723,#5
 238  0007 2004          	jra	L301
 239  0009               L101:
 240                     ; 140     BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPEN);
 242  0009 721b50f3      	bres	20723,#5
 243  000d               L301:
 244                     ; 142 }
 247  000d 81            	ret
 283                     ; 175 void BEEP_LSClockToTIMConnectCmd(FunctionalState NewState)
 283                     ; 176 {
 284                     .text:	section	.text,new
 285  0000               _BEEP_LSClockToTIMConnectCmd:
 289                     ; 178   assert_param(IS_FUNCTIONAL_STATE(NewState));
 291                     ; 180   if (NewState != DISABLE)
 293  0000 4d            	tnz	a
 294  0001 2706          	jreq	L321
 295                     ; 183     BEEP->CSR1 |= BEEP_CSR1_MSR;
 297  0003 721050f0      	bset	20720,#0
 299  0007 2004          	jra	L521
 300  0009               L321:
 301                     ; 188     BEEP->CSR1 &= (uint8_t)(~BEEP_CSR1_MSR);
 303  0009 721150f0      	bres	20720,#0
 304  000d               L521:
 305                     ; 190 }
 308  000d 81            	ret
 355                     .const:	section	.text
 356  0000               L61:
 357  0000 000003e8      	dc.l	1000
 358                     ; 204 void BEEP_LSICalibrationConfig(uint32_t LSIFreqHz)
 358                     ; 205 {
 359                     .text:	section	.text,new
 360  0000               _BEEP_LSICalibrationConfig:
 362  0000 5206          	subw	sp,#6
 363       00000006      OFST:	set	6
 366                     ; 210   assert_param(IS_LSI_FREQUENCY(LSIFreqHz));
 368                     ; 212   lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 370  0002 96            	ldw	x,sp
 371  0003 1c0009        	addw	x,#OFST+3
 372  0006 cd0000        	call	c_ltor
 374  0009 ae0000        	ldw	x,#L61
 375  000c cd0000        	call	c_ludv
 377  000f be02          	ldw	x,c_lreg+2
 378  0011 1f03          	ldw	(OFST-3,sp),x
 379                     ; 216   BEEP->CSR2 &= (uint8_t)(~BEEP_CSR2_BEEPDIV); /* Clear bits */
 381  0013 c650f3        	ld	a,20723
 382  0016 a4e0          	and	a,#224
 383  0018 c750f3        	ld	20723,a
 384                     ; 218   A = (uint16_t)(lsifreqkhz >> 3U); /* Division by 8, keep integer part only */
 386  001b 1e03          	ldw	x,(OFST-3,sp)
 387  001d 54            	srlw	x
 388  001e 54            	srlw	x
 389  001f 54            	srlw	x
 390  0020 1f05          	ldw	(OFST-1,sp),x
 391                     ; 220   if ((8U * A) >= ((lsifreqkhz - (8U * A)) * (1U + (2U * A))))
 393  0022 1e05          	ldw	x,(OFST-1,sp)
 394  0024 58            	sllw	x
 395  0025 58            	sllw	x
 396  0026 58            	sllw	x
 397  0027 1f01          	ldw	(OFST-5,sp),x
 398  0029 1e03          	ldw	x,(OFST-3,sp)
 399  002b 72f001        	subw	x,(OFST-5,sp)
 400  002e 1605          	ldw	y,(OFST-1,sp)
 401  0030 9058          	sllw	y
 402  0032 905c          	incw	y
 403  0034 cd0000        	call	c_imul
 405  0037 1605          	ldw	y,(OFST-1,sp)
 406  0039 9058          	sllw	y
 407  003b 9058          	sllw	y
 408  003d 9058          	sllw	y
 409  003f bf00          	ldw	c_x,x
 410  0041 90b300        	cpw	y,c_x
 411  0044 250c          	jrult	L741
 412                     ; 222     BEEP->CSR2 |= (uint8_t)(A - 2U);
 414  0046 7b06          	ld	a,(OFST+0,sp)
 415  0048 a002          	sub	a,#2
 416  004a ca50f3        	or	a,20723
 417  004d c750f3        	ld	20723,a
 419  0050 2009          	jra	L151
 420  0052               L741:
 421                     ; 226     BEEP->CSR2 |= (uint8_t)(A - 1U);
 423  0052 7b06          	ld	a,(OFST+0,sp)
 424  0054 4a            	dec	a
 425  0055 ca50f3        	or	a,20723
 426  0058 c750f3        	ld	20723,a
 427  005b               L151:
 428                     ; 228 }
 431  005b 5b06          	addw	sp,#6
 432  005d 81            	ret
 445                     	xdef	_BEEP_LSICalibrationConfig
 446                     	xdef	_BEEP_LSClockToTIMConnectCmd
 447                     	xdef	_BEEP_Cmd
 448                     	xdef	_BEEP_Init
 449                     	xdef	_BEEP_DeInit
 450                     	xref.b	c_lreg
 451                     	xref.b	c_x
 470                     	xref	c_imul
 471                     	xref	c_ludv
 472                     	xref	c_ltor
 473                     	end
