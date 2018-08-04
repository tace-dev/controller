   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  47                     ; 90 void AES_DeInit(void)
  47                     ; 91 {
  49                     .text:	section	.text,new
  50  0000               _AES_DeInit:
  54                     ; 93   AES->CR = AES_CR_ERRC | AES_CR_CCFC;
  56  0000 351853d0      	mov	21456,#24
  57                     ; 94   AES->DINR = AES_DINR_RESET_VALUE;       /* Set AES_DINR to reset value 0x00 */
  59  0004 725f53d2      	clr	21458
  60                     ; 95   AES->DOUTR = AES_DOUTR_RESET_VALUE;     /* Set AES_DOUTR to reset value 0x00 */
  62  0008 725f53d3      	clr	21459
  63                     ; 96 }
  66  000c 81            	ret
 140                     ; 109 void AES_OperationModeConfig(AES_Operation_TypeDef AES_Operation)
 140                     ; 110 {
 141                     .text:	section	.text,new
 142  0000               _AES_OperationModeConfig:
 144  0000 88            	push	a
 145       00000000      OFST:	set	0
 148                     ; 112   assert_param(IS_AES_MODE(AES_Operation));
 150                     ; 115   AES->CR &= (uint8_t) (~AES_CR_MODE);
 152  0001 c653d0        	ld	a,21456
 153  0004 a4f9          	and	a,#249
 154  0006 c753d0        	ld	21456,a
 155                     ; 118   AES->CR |= (uint8_t) (AES_Operation);
 157  0009 c653d0        	ld	a,21456
 158  000c 1a01          	or	a,(OFST+1,sp)
 159  000e c753d0        	ld	21456,a
 160                     ; 119 }
 163  0011 84            	pop	a
 164  0012 81            	ret
 219                     ; 129 void AES_Cmd(FunctionalState NewState)
 219                     ; 130 {
 220                     .text:	section	.text,new
 221  0000               _AES_Cmd:
 225                     ; 132   assert_param(IS_FUNCTIONAL_STATE(NewState));
 227                     ; 134   if (NewState != DISABLE)
 229  0000 4d            	tnz	a
 230  0001 2706          	jreq	L101
 231                     ; 136     AES->CR |= (uint8_t) AES_CR_EN;   /**< AES Enable */
 233  0003 721053d0      	bset	21456,#0
 235  0007 2004          	jra	L301
 236  0009               L101:
 237                     ; 140     AES->CR &= (uint8_t)(~AES_CR_EN);  /**< AES Disable */
 239  0009 721153d0      	bres	21456,#0
 240  000d               L301:
 241                     ; 142 }
 244  000d 81            	ret
 276                     ; 167 void AES_WriteSubData(uint8_t Data)
 276                     ; 168 {
 277                     .text:	section	.text,new
 278  0000               _AES_WriteSubData:
 282                     ; 170   AES->DINR = Data;
 284  0000 c753d2        	ld	21458,a
 285                     ; 171 }
 288  0003 81            	ret
 320                     ; 180 void AES_WriteSubKey(uint8_t Key)
 320                     ; 181 {
 321                     .text:	section	.text,new
 322  0000               _AES_WriteSubKey:
 326                     ; 183   AES->DINR = Key;
 328  0000 c753d2        	ld	21458,a
 329                     ; 184 }
 332  0003 81            	ret
 355                     ; 192 uint8_t AES_ReadSubData(void)
 355                     ; 193 {
 356                     .text:	section	.text,new
 357  0000               _AES_ReadSubData:
 361                     ; 194   return AES->DOUTR;
 363  0000 c653d3        	ld	a,21459
 366  0003 81            	ret
 389                     ; 203 uint8_t AES_ReadSubKey(void)
 389                     ; 204 {
 390                     .text:	section	.text,new
 391  0000               _AES_ReadSubKey:
 395                     ; 205   return AES->DOUTR;
 397  0000 c653d3        	ld	a,21459
 400  0003 81            	ret
 459                     ; 234 void AES_DMAConfig(AES_DMATransfer_TypeDef AES_DMATransfer, FunctionalState NewState)
 459                     ; 235 {
 460                     .text:	section	.text,new
 461  0000               _AES_DMAConfig:
 463  0000 89            	pushw	x
 464       00000000      OFST:	set	0
 467                     ; 237   assert_param(IS_AES_DMATRANSFER(AES_DMATransfer));
 469                     ; 239   if (NewState != DISABLE)
 471  0001 9f            	ld	a,xl
 472  0002 4d            	tnz	a
 473  0003 2709          	jreq	L502
 474                     ; 242     AES->CR |= (uint8_t) AES_DMATransfer;
 476  0005 9e            	ld	a,xh
 477  0006 ca53d0        	or	a,21456
 478  0009 c753d0        	ld	21456,a
 480  000c 2009          	jra	L702
 481  000e               L502:
 482                     ; 247     AES->CR &= (uint8_t)(~AES_DMATransfer);
 484  000e 7b01          	ld	a,(OFST+1,sp)
 485  0010 43            	cpl	a
 486  0011 c453d0        	and	a,21456
 487  0014 c753d0        	ld	21456,a
 488  0017               L702:
 489                     ; 249 }
 492  0017 85            	popw	x
 493  0018 81            	ret
 558                     ; 278 void AES_ITConfig(AES_IT_TypeDef AES_IT, FunctionalState NewState)
 558                     ; 279 {
 559                     .text:	section	.text,new
 560  0000               _AES_ITConfig:
 562  0000 89            	pushw	x
 563       00000000      OFST:	set	0
 566                     ; 281   assert_param(IS_FUNCTIONAL_STATE(NewState));
 568                     ; 282   assert_param(IS_AES_IT(AES_IT));
 570                     ; 284   if (NewState != DISABLE)
 572  0001 9f            	ld	a,xl
 573  0002 4d            	tnz	a
 574  0003 2709          	jreq	L342
 575                     ; 286     AES->CR |= (uint8_t) AES_IT;    /**< AES_IT Enable */
 577  0005 9e            	ld	a,xh
 578  0006 ca53d0        	or	a,21456
 579  0009 c753d0        	ld	21456,a
 581  000c 2009          	jra	L542
 582  000e               L342:
 583                     ; 290     AES->CR &= (uint8_t)(~AES_IT);  /**< AES_IT Disable */
 585  000e 7b01          	ld	a,(OFST+1,sp)
 586  0010 43            	cpl	a
 587  0011 c453d0        	and	a,21456
 588  0014 c753d0        	ld	21456,a
 589  0017               L542:
 590                     ; 292 }
 593  0017 85            	popw	x
 594  0018 81            	ret
 687                     ; 304 FlagStatus AES_GetFlagStatus(AES_FLAG_TypeDef AES_FLAG)
 687                     ; 305 {
 688                     .text:	section	.text,new
 689  0000               _AES_GetFlagStatus:
 691  0000 88            	push	a
 692  0001 88            	push	a
 693       00000001      OFST:	set	1
 696                     ; 306   FlagStatus status = RESET;
 698                     ; 309   assert_param(IS_AES_FLAG(AES_FLAG));
 700                     ; 311   if (AES_FLAG == AES_FLAG_CCF)
 702  0002 a101          	cp	a,#1
 703  0004 2611          	jrne	L313
 704                     ; 313     if ((AES->SR & (uint8_t)AES_FLAG_CCF) != (uint8_t)0x00)
 706  0006 c653d1        	ld	a,21457
 707  0009 a501          	bcp	a,#1
 708  000b 2706          	jreq	L513
 709                     ; 316       status = (FlagStatus) SET;
 711  000d a601          	ld	a,#1
 712  000f 6b01          	ld	(OFST+0,sp),a
 714  0011 202a          	jra	L123
 715  0013               L513:
 716                     ; 321       status = (FlagStatus) RESET;
 718  0013 0f01          	clr	(OFST+0,sp)
 719  0015 2026          	jra	L123
 720  0017               L313:
 721                     ; 324   else if (AES_FLAG == AES_FLAG_RDERR)
 723  0017 7b02          	ld	a,(OFST+1,sp)
 724  0019 a102          	cp	a,#2
 725  001b 2611          	jrne	L323
 726                     ; 326     if ((AES->SR & (uint8_t)AES_FLAG_RDERR) != (uint8_t)0x00)
 728  001d c653d1        	ld	a,21457
 729  0020 a502          	bcp	a,#2
 730  0022 2706          	jreq	L523
 731                     ; 329       status = (FlagStatus) SET;
 733  0024 a601          	ld	a,#1
 734  0026 6b01          	ld	(OFST+0,sp),a
 736  0028 2013          	jra	L123
 737  002a               L523:
 738                     ; 334       status = (FlagStatus) RESET;
 740  002a 0f01          	clr	(OFST+0,sp)
 741  002c 200f          	jra	L123
 742  002e               L323:
 743                     ; 339     if ((AES->SR & (uint8_t)AES_FLAG_WRERR) != (uint8_t)0x00)
 745  002e c653d1        	ld	a,21457
 746  0031 a504          	bcp	a,#4
 747  0033 2706          	jreq	L333
 748                     ; 342       status = (FlagStatus) SET;
 750  0035 a601          	ld	a,#1
 751  0037 6b01          	ld	(OFST+0,sp),a
 753  0039 2002          	jra	L123
 754  003b               L333:
 755                     ; 347       status = (FlagStatus) RESET;
 757  003b 0f01          	clr	(OFST+0,sp)
 758  003d               L123:
 759                     ; 351   return ((FlagStatus) status);
 761  003d 7b01          	ld	a,(OFST+0,sp)
 764  003f 85            	popw	x
 765  0040 81            	ret
 800                     ; 363 void AES_ClearFlag(AES_FLAG_TypeDef AES_FLAG)
 800                     ; 364 {
 801                     .text:	section	.text,new
 802  0000               _AES_ClearFlag:
 806                     ; 366   assert_param(IS_AES_FLAG(AES_FLAG));
 808                     ; 369   if (AES_FLAG == AES_FLAG_CCF)
 810  0000 a101          	cp	a,#1
 811  0002 2606          	jrne	L553
 812                     ; 372     AES->CR |= (uint8_t) AES_CR_CCFC;
 814  0004 721653d0      	bset	21456,#3
 816  0008 2004          	jra	L753
 817  000a               L553:
 818                     ; 377     AES->CR |= (uint8_t) AES_CR_ERRC;
 820  000a 721853d0      	bset	21456,#4
 821  000e               L753:
 822                     ; 379 }
 825  000e 81            	ret
 891                     ; 389 ITStatus AES_GetITStatus(AES_IT_TypeDef AES_IT)
 891                     ; 390 {
 892                     .text:	section	.text,new
 893  0000               _AES_GetITStatus:
 895  0000 88            	push	a
 896  0001 89            	pushw	x
 897       00000002      OFST:	set	2
 900                     ; 391   ITStatus itstatus = RESET;
 902                     ; 392   BitStatus cciebitstatus, ccfbitstatus = RESET;
 904                     ; 395   assert_param(IS_AES_IT(AES_IT));
 906                     ; 397   cciebitstatus = (BitStatus) (AES->CR & AES_CR_CCIE);
 908  0002 c653d0        	ld	a,21456
 909  0005 a420          	and	a,#32
 910  0007 6b01          	ld	(OFST-1,sp),a
 911                     ; 398   ccfbitstatus =  (BitStatus) (AES->SR & AES_SR_CCF);
 913  0009 c653d1        	ld	a,21457
 914  000c a401          	and	a,#1
 915  000e 6b02          	ld	(OFST+0,sp),a
 916                     ; 401   if (AES_IT == AES_IT_CCIE)
 918  0010 7b03          	ld	a,(OFST+1,sp)
 919  0012 a120          	cp	a,#32
 920  0014 2612          	jrne	L314
 921                     ; 404     if (((cciebitstatus) != RESET) && ((ccfbitstatus) != RESET))
 923  0016 0d01          	tnz	(OFST-1,sp)
 924  0018 270a          	jreq	L514
 926  001a 0d02          	tnz	(OFST+0,sp)
 927  001c 2706          	jreq	L514
 928                     ; 407       itstatus = (ITStatus) SET;
 930  001e a601          	ld	a,#1
 931  0020 6b02          	ld	(OFST+0,sp),a
 933  0022 201e          	jra	L124
 934  0024               L514:
 935                     ; 412       itstatus = (ITStatus) RESET;
 937  0024 0f02          	clr	(OFST+0,sp)
 938  0026 201a          	jra	L124
 939  0028               L314:
 940                     ; 418     if ((AES->CR & AES_CR_ERRIE) != RESET)
 942  0028 c653d0        	ld	a,21456
 943  002b a540          	bcp	a,#64
 944  002d 2711          	jreq	L324
 945                     ; 421       if ((AES->SR & (uint8_t)(AES_SR_WRERR | AES_SR_RDERR)) != RESET)
 947  002f c653d1        	ld	a,21457
 948  0032 a506          	bcp	a,#6
 949  0034 2706          	jreq	L524
 950                     ; 424         itstatus = (ITStatus) SET;
 952  0036 a601          	ld	a,#1
 953  0038 6b02          	ld	(OFST+0,sp),a
 955  003a 2006          	jra	L124
 956  003c               L524:
 957                     ; 429         itstatus = (ITStatus) RESET;
 959  003c 0f02          	clr	(OFST+0,sp)
 960  003e 2002          	jra	L124
 961  0040               L324:
 962                     ; 435       itstatus = (ITStatus) RESET;
 964  0040 0f02          	clr	(OFST+0,sp)
 965  0042               L124:
 966                     ; 440   return ((ITStatus)itstatus);
 968  0042 7b02          	ld	a,(OFST+0,sp)
 971  0044 5b03          	addw	sp,#3
 972  0046 81            	ret
1008                     ; 451 void AES_ClearITPendingBit(AES_IT_TypeDef AES_IT)
1008                     ; 452 {
1009                     .text:	section	.text,new
1010  0000               _AES_ClearITPendingBit:
1014                     ; 454   assert_param(IS_AES_IT(AES_IT));
1016                     ; 457   if (AES_IT == AES_IT_CCIE)
1018  0000 a120          	cp	a,#32
1019  0002 2606          	jrne	L154
1020                     ; 460     AES->CR |= (uint8_t) AES_CR_CCFC;
1022  0004 721653d0      	bset	21456,#3
1024  0008 2004          	jra	L354
1025  000a               L154:
1026                     ; 465     AES->CR |= (uint8_t) AES_CR_ERRC;
1028  000a 721853d0      	bset	21456,#4
1029  000e               L354:
1030                     ; 467 }
1033  000e 81            	ret
1046                     	xdef	_AES_ClearITPendingBit
1047                     	xdef	_AES_GetITStatus
1048                     	xdef	_AES_ClearFlag
1049                     	xdef	_AES_GetFlagStatus
1050                     	xdef	_AES_ITConfig
1051                     	xdef	_AES_DMAConfig
1052                     	xdef	_AES_ReadSubKey
1053                     	xdef	_AES_ReadSubData
1054                     	xdef	_AES_WriteSubKey
1055                     	xdef	_AES_WriteSubData
1056                     	xdef	_AES_Cmd
1057                     	xdef	_AES_OperationModeConfig
1058                     	xdef	_AES_DeInit
1077                     	end
