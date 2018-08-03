   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  16                     .const:	section	.text
  17  0000               _APR_Array:
  18  0000 00            	dc.b	0
  19  0001 1e            	dc.b	30
  20  0002 1e            	dc.b	30
  21  0003 1e            	dc.b	30
  22  0004 1e            	dc.b	30
  23  0005 1e            	dc.b	30
  24  0006 1e            	dc.b	30
  25  0007 1e            	dc.b	30
  26  0008 1e            	dc.b	30
  27  0009 1e            	dc.b	30
  28  000a 1e            	dc.b	30
  29  000b 1e            	dc.b	30
  30  000c 1e            	dc.b	30
  31  000d 3d            	dc.b	61
  32  000e 17            	dc.b	23
  33  000f 17            	dc.b	23
  34  0010 3e            	dc.b	62
  35  0011               _TBR_Array:
  36  0011 00            	dc.b	0
  37  0012 01            	dc.b	1
  38  0013 02            	dc.b	2
  39  0014 03            	dc.b	3
  40  0015 04            	dc.b	4
  41  0016 05            	dc.b	5
  42  0017 06            	dc.b	6
  43  0018 07            	dc.b	7
  44  0019 08            	dc.b	8
  45  001a 09            	dc.b	9
  46  001b 0a            	dc.b	10
  47  001c 0b            	dc.b	11
  48  001d 0c            	dc.b	12
  49  001e 0c            	dc.b	12
  50  001f 0e            	dc.b	14
  51  0020 0f            	dc.b	15
  52  0021 0f            	dc.b	15
  81                     ; 67 void AWU_DeInit(void)
  81                     ; 68 {
  83                     	switch	.text
  84  0000               _AWU_DeInit:
  88                     ; 69     AWU->CSR = AWU_CSR_RESET_VALUE;
  90  0000 725f50f0      	clr	20720
  91                     ; 70     AWU->APR = AWU_APR_RESET_VALUE;
  93  0004 353f50f1      	mov	20721,#63
  94                     ; 71     AWU->TBR = AWU_TBR_RESET_VALUE;
  96  0008 725f50f2      	clr	20722
  97                     ; 72 }
 100  000c 81            	ret
 262                     ; 82 void AWU_Init(AWU_Timebase_TypeDef AWU_TimeBase)
 262                     ; 83 {
 263                     	switch	.text
 264  000d               _AWU_Init:
 266  000d 88            	push	a
 267       00000000      OFST:	set	0
 270                     ; 86     assert_param(IS_AWU_TIMEBASE_OK(AWU_TimeBase));
 272                     ; 89     AWU->CSR |= AWU_CSR_AWUEN;
 274  000e 721850f0      	bset	20720,#4
 275                     ; 92     AWU->TBR &= (uint8_t)(~AWU_TBR_AWUTB);
 277  0012 c650f2        	ld	a,20722
 278  0015 a4f0          	and	a,#240
 279  0017 c750f2        	ld	20722,a
 280                     ; 93     AWU->TBR |= TBR_Array[(uint8_t)AWU_TimeBase];
 282  001a 7b01          	ld	a,(OFST+1,sp)
 283  001c 5f            	clrw	x
 284  001d 97            	ld	xl,a
 285  001e c650f2        	ld	a,20722
 286  0021 da0011        	or	a,(_TBR_Array,x)
 287  0024 c750f2        	ld	20722,a
 288                     ; 96     AWU->APR &= (uint8_t)(~AWU_APR_APR);
 290  0027 c650f1        	ld	a,20721
 291  002a a4c0          	and	a,#192
 292  002c c750f1        	ld	20721,a
 293                     ; 97     AWU->APR |= APR_Array[(uint8_t)AWU_TimeBase];
 295  002f 7b01          	ld	a,(OFST+1,sp)
 296  0031 5f            	clrw	x
 297  0032 97            	ld	xl,a
 298  0033 c650f1        	ld	a,20721
 299  0036 da0000        	or	a,(_APR_Array,x)
 300  0039 c750f1        	ld	20721,a
 301                     ; 99 }
 304  003c 84            	pop	a
 305  003d 81            	ret
 360                     ; 108 void AWU_Cmd(FunctionalState NewState)
 360                     ; 109 {
 361                     	switch	.text
 362  003e               _AWU_Cmd:
 366                     ; 110     if (NewState != DISABLE)
 368  003e 4d            	tnz	a
 369  003f 2706          	jreq	L331
 370                     ; 113         AWU->CSR |= AWU_CSR_AWUEN;
 372  0041 721850f0      	bset	20720,#4
 374  0045 2004          	jra	L531
 375  0047               L331:
 376                     ; 118         AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 378  0047 721950f0      	bres	20720,#4
 379  004b               L531:
 380                     ; 120 }
 383  004b 81            	ret
 436                     	switch	.const
 437  0022               L41:
 438  0022 000003e8      	dc.l	1000
 439                     ; 135 void AWU_LSICalibrationConfig(uint32_t LSIFreqHz)
 439                     ; 136 {
 440                     	switch	.text
 441  004c               _AWU_LSICalibrationConfig:
 443  004c 5206          	subw	sp,#6
 444       00000006      OFST:	set	6
 447                     ; 138     uint16_t lsifreqkhz = 0x0;
 449                     ; 139     uint16_t A = 0x0;
 451                     ; 142     assert_param(IS_LSI_FREQUENCY_OK(LSIFreqHz));
 453                     ; 144     lsifreqkhz = (uint16_t)(LSIFreqHz / 1000); /* Converts value in kHz */
 455  004e 96            	ldw	x,sp
 456  004f 1c0009        	addw	x,#OFST+3
 457  0052 cd0000        	call	c_ltor
 459  0055 ae0022        	ldw	x,#L41
 460  0058 cd0000        	call	c_ludv
 462  005b be02          	ldw	x,c_lreg+2
 463  005d 1f03          	ldw	(OFST-3,sp),x
 465                     ; 148     A = (uint16_t)(lsifreqkhz >> 2U); /* Division by 4, keep integer part only */
 467  005f 1e03          	ldw	x,(OFST-3,sp)
 468  0061 54            	srlw	x
 469  0062 54            	srlw	x
 470  0063 1f05          	ldw	(OFST-1,sp),x
 472                     ; 150     if ((4U * A) >= ((lsifreqkhz - (4U * A)) * (1U + (2U * A))))
 474  0065 1e05          	ldw	x,(OFST-1,sp)
 475  0067 58            	sllw	x
 476  0068 58            	sllw	x
 477  0069 1f01          	ldw	(OFST-5,sp),x
 479  006b 1e03          	ldw	x,(OFST-3,sp)
 480  006d 72f001        	subw	x,(OFST-5,sp)
 481  0070 1605          	ldw	y,(OFST-1,sp)
 482  0072 9058          	sllw	y
 483  0074 905c          	incw	y
 484  0076 cd0000        	call	c_imul
 486  0079 1605          	ldw	y,(OFST-1,sp)
 487  007b 9058          	sllw	y
 488  007d 9058          	sllw	y
 489  007f bf00          	ldw	c_x,x
 490  0081 90b300        	cpw	y,c_x
 491  0084 2509          	jrult	L561
 492                     ; 152         AWU->APR = (uint8_t)(A - 2U);
 494  0086 7b06          	ld	a,(OFST+0,sp)
 495  0088 a002          	sub	a,#2
 496  008a c750f1        	ld	20721,a
 498  008d 2006          	jra	L761
 499  008f               L561:
 500                     ; 156         AWU->APR = (uint8_t)(A - 1U);
 502  008f 7b06          	ld	a,(OFST+0,sp)
 503  0091 4a            	dec	a
 504  0092 c750f1        	ld	20721,a
 505  0095               L761:
 506                     ; 158 }
 509  0095 5b06          	addw	sp,#6
 510  0097 81            	ret
 533                     ; 165 void AWU_IdleModeEnable(void)
 533                     ; 166 {
 534                     	switch	.text
 535  0098               _AWU_IdleModeEnable:
 539                     ; 168     AWU->CSR &= (uint8_t)(~AWU_CSR_AWUEN);
 541  0098 721950f0      	bres	20720,#4
 542                     ; 171     AWU->TBR = (uint8_t)(~AWU_TBR_AWUTB);
 544  009c 35f050f2      	mov	20722,#240
 545                     ; 172 }
 548  00a0 81            	ret
 592                     ; 180 FlagStatus AWU_GetFlagStatus(void)
 592                     ; 181 {
 593                     	switch	.text
 594  00a1               _AWU_GetFlagStatus:
 598                     ; 182     return((FlagStatus)(((uint8_t)(AWU->CSR & AWU_CSR_AWUF) == (uint8_t)0x00) ? RESET : SET));
 600  00a1 c650f0        	ld	a,20720
 601  00a4 a520          	bcp	a,#32
 602  00a6 2603          	jrne	L22
 603  00a8 4f            	clr	a
 604  00a9 2002          	jra	L42
 605  00ab               L22:
 606  00ab a601          	ld	a,#1
 607  00ad               L42:
 610  00ad 81            	ret
 645                     	xdef	_TBR_Array
 646                     	xdef	_APR_Array
 647                     	xdef	_AWU_GetFlagStatus
 648                     	xdef	_AWU_IdleModeEnable
 649                     	xdef	_AWU_LSICalibrationConfig
 650                     	xdef	_AWU_Cmd
 651                     	xdef	_AWU_Init
 652                     	xdef	_AWU_DeInit
 653                     	xref.b	c_lreg
 654                     	xref.b	c_x
 673                     	xref	c_imul
 674                     	xref	c_ludv
 675                     	xref	c_ltor
 676                     	end
