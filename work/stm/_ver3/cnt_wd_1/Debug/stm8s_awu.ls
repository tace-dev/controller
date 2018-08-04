   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  23                     .const:	section	.text
  24  0000               _APR_Array:
  25  0000 00            	dc.b	0
  26  0001 1e            	dc.b	30
  27  0002 1e            	dc.b	30
  28  0003 1e            	dc.b	30
  29  0004 1e            	dc.b	30
  30  0005 1e            	dc.b	30
  31  0006 1e            	dc.b	30
  32  0007 1e            	dc.b	30
  33  0008 1e            	dc.b	30
  34  0009 1e            	dc.b	30
  35  000a 1e            	dc.b	30
  36  000b 1e            	dc.b	30
  37  000c 1e            	dc.b	30
  38  000d 3d            	dc.b	61
  39  000e 17            	dc.b	23
  40  000f 17            	dc.b	23
  41  0010 3e            	dc.b	62
  42  0011               _TBR_Array:
  43  0011 00            	dc.b	0
  44  0012 01            	dc.b	1
  45  0013 02            	dc.b	2
  46  0014 03            	dc.b	3
  47  0015 04            	dc.b	4
  48  0016 05            	dc.b	5
  49  0017 06            	dc.b	6
  50  0018 07            	dc.b	7
  51  0019 08            	dc.b	8
  52  001a 09            	dc.b	9
  53  001b 0a            	dc.b	10
  54  001c 0b            	dc.b	11
  55  001d 0c            	dc.b	12
  56  001e 0c            	dc.b	12
  57  001f 0e            	dc.b	14
  58  0020 0f            	dc.b	15
  59  0021 0f            	dc.b	15
  88                     ; 67 void AWU_DeInit(void)
  88                     ; 68 {
  90                     .text:	section	.text,new
  91  0000               _AWU_DeInit:
  95                     ; 69     AWU->CSR = AWU_CSR_RESET_VALUE;
  97  0000 725f50f0      	clr	20720
  98                     ; 70     AWU->APR = AWU_APR_RESET_VALUE;
 100  0004 353f50f1      	mov	20721,#63
 101                     ; 71     AWU->TBR = AWU_TBR_RESET_VALUE;
 103  0008 725f50f2      	clr	20722
 104                     ; 72 }
 107  000c 81            	ret	
 269                     ; 82 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 269                     ; 83 {
 270                     .text:	section	.text,new
 271  0000               _AWU_Init:
 273  0000 88            	push	a
 274       00000000      OFST:	set	0
 277                     ; 86     assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 279                     ; 89     AWU->CSR |= AWU_CSR_AWUEN;
 281  0001 721850f0      	bset	20720,#4
 282                     ; 92     AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 284  0005 c650f2        	ld	a,20722
 285  0008 a4f0          	and	a,#240
 286  000a c750f2        	ld	20722,a
 287                     ; 93     AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 289  000d 7b01          	ld	a,(OFST+1,sp)
 290  000f 5f            	clrw	x
 291  0010 97            	ld	xl,a
 292  0011 c650f2        	ld	a,20722
 293  0014 da0011        	or	a,(_TBR_Array,x)
 294  0017 c750f2        	ld	20722,a
 295                     ; 96     AWU->APR &= (uint8_t)(~AWU_APR_APR);
 297  001a c650f1        	ld	a,20721
 298  001d a4c0          	and	a,#192
 299  001f c750f1        	ld	20721,a
 300                     ; 97     AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 302  0022 7b01          	ld	a,(OFST+1,sp)
 303  0024 5f            	clrw	x
 304  0025 97            	ld	xl,a
 305  0026 c650f1        	ld	a,20721
 306  0029 da0000        	or	a,(_APR_Array,x)
 307  002c c750f1        	ld	20721,a
 308                     ; 99 }
 311  002f 84            	pop	a
 312  0030 81            	ret	
 367                     ; 108 void AWU_Cmd(FunctionalState NewState)
 367                     ; 109 {
 368                     .text:	section	.text,new
 369  0000               _AWU_Cmd:
 373                     ; 110     if (NewState != DISABLE)
 375  0000 4d            	tnz	a
 376  0001 2705          	jreq	L331
 377                     ; 113         AWU->CSR |= AWU_CSR_AWUEN;
 379  0003 721850f0      	bset	20720,#4
 382  0007 81            	ret	
 383  0008               L331:
 384                     ; 118         AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 386  0008 721950f0      	bres	20720,#4
 387                     ; 120 }
 390  000c 81            	ret	
 437                     	switch	.const
 438  0022               L41:
 439  0022 000003e8      	dc.l	1000
 440                     ; 135 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 440                     ; 136 {
 441                     .text:	section	.text,new
 442  0000               _AWU_LSICalibrationConfig:
 444  0000 5206          	subw	sp,#6
 445       00000006      OFST:	set	6
 448                     ; 138     uint16_t lsifreqkhz = 0x0;
 450                     ; 139     uint16_t A = 0x0;
 452                     ; 142     assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 454                     ; 144     lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 456  0002 96            	ldw	x,sp
 457  0003 1c0009        	addw	x,#OFST+3
 458  0006 cd0000        	call	c_ltor
 460  0009 ae0022        	ldw	x,#L41
 461  000c cd0000        	call	c_ludv
 463  000f be02          	ldw	x,c_lreg+2
 464  0011 1f03          	ldw	(OFST-3,sp),x
 465                     ; 148     A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 467  0013 54            	srlw	x
 468  0014 54            	srlw	x
 469  0015 1f05          	ldw	(OFST-1,sp),x
 470                     ; 150     if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 472  0017 58            	sllw	x
 473  0018 58            	sllw	x
 474  0019 1f01          	ldw	(OFST-5,sp),x
 475  001b 1e03          	ldw	x,(OFST-3,sp)
 476  001d 72f001        	subw	x,(OFST-5,sp)
 477  0020 1605          	ldw	y,(OFST-1,sp)
 478  0022 9058          	sllw	y
 479  0024 905c          	incw	y
 480  0026 cd0000        	call	c_imul
 482  0029 1605          	ldw	y,(OFST-1,sp)
 483  002b 9058          	sllw	y
 484  002d bf00          	ldw	c_x,x
 485  002f 9058          	sllw	y
 486  0031 90b300        	cpw	y,c_x
 487  0034 7b06          	ld	a,(OFST+0,sp)
 488  0036 2504          	jrult	L751
 489                     ; 152         AWU->APR = (uint8_t)(A - 2U);
 491  0038 a002          	sub	a,#2
 493  003a 2001          	jra	L161
 494  003c               L751:
 495                     ; 156         AWU->APR = (uint8_t)(A - 1U);
 497  003c 4a            	dec	a
 498  003d               L161:
 499  003d c750f1        	ld	20721,a
 500                     ; 158 }
 503  0040 5b06          	addw	sp,#6
 504  0042 81            	ret	
 527                     ; 165 void AWU_IdleModeEnable(void)
 527                     ; 166 {
 528                     .text:	section	.text,new
 529  0000               _AWU_IdleModeEnable:
 533                     ; 168     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 535  0000 721950f0      	bres	20720,#4
 536                     ; 171     AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 538  0004 35f050f2      	mov	20722,#240
 539                     ; 172 }
 542  0008 81            	ret	
 586                     ; 180 FlagStatus AWU_GetFlagStatus(void)
 586                     ; 181 {
 587                     .text:	section	.text,new
 588  0000               _AWU_GetFlagStatus:
 592                     ; 182     return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 594  0000 720a50f002    	btjt	20720,#5,L22
 595  0005 4f            	clr	a
 597  0006 81            	ret	
 598  0007               L22:
 599  0007 a601          	ld	a,#1
 602  0009 81            	ret	
 637                     	xdef	_TBR_Array
 638                     	xdef	_APR_Array
 639                     	xdef	_AWU_GetFlagStatus
 640                     	xdef	_AWU_IdleModeEnable
 641                     	xdef	_AWU_LSICalibrationConfig
 642                     	xdef	_AWU_Cmd
 643                     	xdef	_AWU_Init
 644                     	xdef	_AWU_DeInit
 645                     	xref.b	c_lreg
 646                     	xref.b	c_x
 665                     	xref	c_imul
 666                     	xref	c_ludv
 667                     	xref	c_ltor
 668                     	end
