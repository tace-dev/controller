   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  50                     ; 90 void AES_DeInit(void)
  50                     ; 91 {
  52                     .text:	section	.text,new
  53  0000               _AES_DeInit:
  57                     ; 93   AES->CR = AES_CR_ERRC | AES_CR_CCFC;
  59  0000 351853d0      	mov	21456,#24
  60                     ; 94   AES->DINR = AES_DINR_RESET_VALUE;       /* Set AES_DINR to reset value 0x00 */
  62  0004 725f53d2      	clr	21458
  63                     ; 95   AES->DOUTR = AES_DOUTR_RESET_VALUE;     /* Set AES_DOUTR to reset value 0x00 */
  65  0008 725f53d3      	clr	21459
  66                     ; 96 }
  69  000c 81            	ret	
 143                     ; 109 void AES_OperationModeConfig(AES_Operation_TypeDef AES_Operation)
 143                     ; 110 {
 144                     .text:	section	.text,new
 145  0000               _AES_OperationModeConfig:
 147  0000 88            	push	a
 148       00000000      OFST:	set	0
 151                     ; 112   assert_param(IS_AES_MODE(AES_Operation));
 153                     ; 115   AES->CR &= (uint8_t) (~AES_CR_MODE);
 155  0001 c653d0        	ld	a,21456
 156  0004 a4f9          	and	a,#249
 157  0006 c753d0        	ld	21456,a
 158                     ; 118   AES->CR |= (uint8_t) (AES_Operation);
 160  0009 c653d0        	ld	a,21456
 161  000c 1a01          	or	a,(OFST+1,sp)
 162  000e c753d0        	ld	21456,a
 163                     ; 119 }
 166  0011 84            	pop	a
 167  0012 81            	ret	
 222                     ; 129 void AES_Cmd(FunctionalState NewState)
 222                     ; 130 {
 223                     .text:	section	.text,new
 224  0000               _AES_Cmd:
 228                     ; 132   assert_param(IS_FUNCTIONAL_STATE(NewState));
 230                     ; 134   if (NewState != DISABLE)
 232  0000 4d            	tnz	a
 233  0001 2705          	jreq	L101
 234                     ; 136     AES->CR |= (uint8_t) AES_CR_EN;   /**< AES Enable */
 236  0003 721053d0      	bset	21456,#0
 239  0007 81            	ret	
 240  0008               L101:
 241                     ; 140     AES->CR &= (uint8_t)(~AES_CR_EN);  /**< AES Disable */
 243  0008 721153d0      	bres	21456,#0
 244                     ; 142 }
 247  000c 81            	ret	
 279                     ; 167 void AES_WriteSubData(uint8_t Data)
 279                     ; 168 {
 280                     .text:	section	.text,new
 281  0000               _AES_WriteSubData:
 285                     ; 170   AES->DINR = Data;
 287  0000 c753d2        	ld	21458,a
 288                     ; 171 }
 291  0003 81            	ret	
 323                     ; 180 void AES_WriteSubKey(uint8_t Key)
 323                     ; 181 {
 324                     .text:	section	.text,new
 325  0000               _AES_WriteSubKey:
 329                     ; 183   AES->DINR = Key;
 331  0000 c753d2        	ld	21458,a
 332                     ; 184 }
 335  0003 81            	ret	
 358                     ; 192 uint8_t AES_ReadSubData(void)
 358                     ; 193 {
 359                     .text:	section	.text,new
 360  0000               _AES_ReadSubData:
 364                     ; 194   return AES->DOUTR;
 366  0000 c653d3        	ld	a,21459
 369  0003 81            	ret	
 392                     ; 203 uint8_t AES_ReadSubKey(void)
 392                     ; 204 {
 393                     .text:	section	.text,new
 394  0000               _AES_ReadSubKey:
 398                     ; 205   return AES->DOUTR;
 400  0000 c653d3        	ld	a,21459
 403  0003 81            	ret	
 462                     ; 234 void AES_DMAConfig(AES_DMATransfer_TypeDef AES_DMATransfer, FunctionalState NewState)
 462                     ; 235 {
 463                     .text:	section	.text,new
 464  0000               _AES_DMAConfig:
 466  0000 89            	pushw	x
 467       00000000      OFST:	set	0
 470                     ; 237   assert_param(IS_AES_DMATRANSFER(AES_DMATransfer));
 472                     ; 239   if (NewState != DISABLE)
 474  0001 9f            	ld	a,xl
 475  0002 4d            	tnz	a
 476  0003 2706          	jreq	L502
 477                     ; 242     AES->CR |= (uint8_t) AES_DMATransfer;
 479  0005 9e            	ld	a,xh
 480  0006 ca53d0        	or	a,21456
 482  0009 2006          	jra	L702
 483  000b               L502:
 484                     ; 247     AES->CR &= (uint8_t)(~AES_DMATransfer);
 486  000b 7b01          	ld	a,(OFST+1,sp)
 487  000d 43            	cpl	a
 488  000e c453d0        	and	a,21456
 489  0011               L702:
 490  0011 c753d0        	ld	21456,a
 491                     ; 249 }
 494  0014 85            	popw	x
 495  0015 81            	ret	
 560                     ; 278 void AES_ITConfig(AES_IT_TypeDef AES_IT, FunctionalState NewState)
 560                     ; 279 {
 561                     .text:	section	.text,new
 562  0000               _AES_ITConfig:
 564  0000 89            	pushw	x
 565       00000000      OFST:	set	0
 568                     ; 281   assert_param(IS_FUNCTIONAL_STATE(NewState));
 570                     ; 282   assert_param(IS_AES_IT(AES_IT));
 572                     ; 284   if (NewState != DISABLE)
 574  0001 9f            	ld	a,xl
 575  0002 4d            	tnz	a
 576  0003 2706          	jreq	L342
 577                     ; 286     AES->CR |= (uint8_t) AES_IT;    /**< AES_IT Enable */
 579  0005 9e            	ld	a,xh
 580  0006 ca53d0        	or	a,21456
 582  0009 2006          	jra	L542
 583  000b               L342:
 584                     ; 290     AES->CR &= (uint8_t)(~AES_IT);  /**< AES_IT Disable */
 586  000b 7b01          	ld	a,(OFST+1,sp)
 587  000d 43            	cpl	a
 588  000e c453d0        	and	a,21456
 589  0011               L542:
 590  0011 c753d0        	ld	21456,a
 591                     ; 292 }
 594  0014 85            	popw	x
 595  0015 81            	ret	
 688                     ; 304 FlagStatus AES_GetFlagStatus(AES_FLAG_TypeDef AES_FLAG)
 688                     ; 305 {
 689                     .text:	section	.text,new
 690  0000               _AES_GetFlagStatus:
 692  0000 88            	push	a
 693  0001 88            	push	a
 694       00000001      OFST:	set	1
 697                     ; 306   FlagStatus status = RESET;
 699                     ; 309   assert_param(IS_AES_FLAG(AES_FLAG));
 701                     ; 311   if (AES_FLAG == AES_FLAG_CCF)
 703  0002 4a            	dec	a
 704  0003 2609          	jrne	L313
 705                     ; 313     if ((AES->SR & (uint8_t)AES_FLAG_CCF) != (uint8_t)0x00)
 707  0005 720153d102    	btjf	21457,#0,L513
 708                     ; 316       status = (FlagStatus) SET;
 710  000a 200d          	jp	LC002
 711  000c               L513:
 712                     ; 321       status = (FlagStatus) RESET;
 713  000c 2018          	jp	L333
 714  000e               L313:
 715                     ; 324   else if (AES_FLAG == AES_FLAG_RDERR)
 717  000e 7b02          	ld	a,(OFST+1,sp)
 718  0010 a102          	cp	a,#2
 719  0012 260b          	jrne	L323
 720                     ; 326     if ((AES->SR & (uint8_t)AES_FLAG_RDERR) != (uint8_t)0x00)
 722  0014 720353d104    	btjf	21457,#1,L523
 723                     ; 329       status = (FlagStatus) SET;
 725  0019               LC002:
 728  0019 a601          	ld	a,#1
 731  001b 200a          	jra	L123
 732  001d               L523:
 733                     ; 334       status = (FlagStatus) RESET;
 734  001d 2007          	jp	L333
 735  001f               L323:
 736                     ; 339     if ((AES->SR & (uint8_t)AES_FLAG_WRERR) != (uint8_t)0x00)
 738  001f 720553d102    	btjf	21457,#2,L333
 739                     ; 342       status = (FlagStatus) SET;
 741  0024 20f3          	jp	LC002
 742  0026               L333:
 743                     ; 347       status = (FlagStatus) RESET;
 747  0026 4f            	clr	a
 749  0027               L123:
 750                     ; 351   return ((FlagStatus) status);
 754  0027 85            	popw	x
 755  0028 81            	ret	
 790                     ; 363 void AES_ClearFlag(AES_FLAG_TypeDef AES_FLAG)
 790                     ; 364 {
 791                     .text:	section	.text,new
 792  0000               _AES_ClearFlag:
 796                     ; 366   assert_param(IS_AES_FLAG(AES_FLAG));
 798                     ; 369   if (AES_FLAG == AES_FLAG_CCF)
 800  0000 4a            	dec	a
 801  0001 2605          	jrne	L553
 802                     ; 372     AES->CR |= (uint8_t) AES_CR_CCFC;
 804  0003 721653d0      	bset	21456,#3
 807  0007 81            	ret	
 808  0008               L553:
 809                     ; 377     AES->CR |= (uint8_t) AES_CR_ERRC;
 811  0008 721853d0      	bset	21456,#4
 812                     ; 379 }
 815  000c 81            	ret	
 881                     ; 389 ITStatus AES_GetITStatus(AES_IT_TypeDef AES_IT)
 881                     ; 390 {
 882                     .text:	section	.text,new
 883  0000               _AES_GetITStatus:
 885  0000 88            	push	a
 886  0001 89            	pushw	x
 887       00000002      OFST:	set	2
 890                     ; 391   ITStatus itstatus = RESET;
 892                     ; 392   BitStatus cciebitstatus, ccfbitstatus = RESET;
 894                     ; 395   assert_param(IS_AES_IT(AES_IT));
 896                     ; 397   cciebitstatus = (BitStatus) (AES->CR & AES_CR_CCIE);
 898  0002 c653d0        	ld	a,21456
 899  0005 a420          	and	a,#32
 900  0007 6b01          	ld	(OFST-1,sp),a
 902                     ; 398   ccfbitstatus =  (BitStatus) (AES->SR & AES_SR_CCF);
 904  0009 c653d1        	ld	a,21457
 905  000c a401          	and	a,#1
 906  000e 6b02          	ld	(OFST+0,sp),a
 908                     ; 401   if (AES_IT == AES_IT_CCIE)
 910  0010 7b03          	ld	a,(OFST+1,sp)
 911  0012 a120          	cp	a,#32
 912  0014 260a          	jrne	L314
 913                     ; 404     if (((cciebitstatus) != RESET) && ((ccfbitstatus) != RESET))
 915  0016 7b01          	ld	a,(OFST-1,sp)
 916  0018 2716          	jreq	L524
 918  001a 7b02          	ld	a,(OFST+0,sp)
 919  001c 2712          	jreq	L524
 920                     ; 407       itstatus = (ITStatus) SET;
 922  001e 200c          	jp	LC004
 923                     ; 412       itstatus = (ITStatus) RESET;
 924  0020               L314:
 925                     ; 418     if ((AES->CR & AES_CR_ERRIE) != RESET)
 927  0020 720d53d00b    	btjf	21456,#6,L524
 928                     ; 421       if ((AES->SR & (uint8_t)(AES_SR_WRERR | AES_SR_RDERR)) != RESET)
 930  0025 c653d1        	ld	a,21457
 931  0028 a506          	bcp	a,#6
 932  002a 2704          	jreq	L524
 933                     ; 424         itstatus = (ITStatus) SET;
 935  002c               LC004:
 937  002c a601          	ld	a,#1
 940  002e 2001          	jra	L124
 941  0030               L524:
 942                     ; 429         itstatus = (ITStatus) RESET;
 943                     ; 435       itstatus = (ITStatus) RESET;
 947  0030 4f            	clr	a
 949  0031               L124:
 950                     ; 440   return ((ITStatus)itstatus);
 954  0031 5b03          	addw	sp,#3
 955  0033 81            	ret	
 991                     ; 451 void AES_ClearITPendingBit(AES_IT_TypeDef AES_IT)
 991                     ; 452 {
 992                     .text:	section	.text,new
 993  0000               _AES_ClearITPendingBit:
 997                     ; 454   assert_param(IS_AES_IT(AES_IT));
 999                     ; 457   if (AES_IT == AES_IT_CCIE)
1001  0000 a120          	cp	a,#32
1002  0002 2605          	jrne	L154
1003                     ; 460     AES->CR |= (uint8_t) AES_CR_CCFC;
1005  0004 721653d0      	bset	21456,#3
1008  0008 81            	ret	
1009  0009               L154:
1010                     ; 465     AES->CR |= (uint8_t) AES_CR_ERRC;
1012  0009 721853d0      	bset	21456,#4
1013                     ; 467 }
1016  000d 81            	ret	
1029                     	xdef	_AES_ClearITPendingBit
1030                     	xdef	_AES_GetITStatus
1031                     	xdef	_AES_ClearFlag
1032                     	xdef	_AES_GetFlagStatus
1033                     	xdef	_AES_ITConfig
1034                     	xdef	_AES_DMAConfig
1035                     	xdef	_AES_ReadSubKey
1036                     	xdef	_AES_ReadSubData
1037                     	xdef	_AES_WriteSubKey
1038                     	xdef	_AES_WriteSubData
1039                     	xdef	_AES_Cmd
1040                     	xdef	_AES_OperationModeConfig
1041                     	xdef	_AES_DeInit
1060                     	end
