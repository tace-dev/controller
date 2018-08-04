   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  49                     ; 90 void AES_DeInit(void)
  49                     ; 91 {
  51                     	switch	.text
  52  0000               _AES_DeInit:
  56                     ; 93   AES->CR = AES_CR_ERRC | AES_CR_CCFC;
  58  0000 351853d0      	mov	21456,#24
  59                     ; 94   AES->DINR = AES_DINR_RESET_VALUE;       /* Set AES_DINR to reset value 0x00 */
  61  0004 725f53d2      	clr	21458
  62                     ; 95   AES->DOUTR = AES_DOUTR_RESET_VALUE;     /* Set AES_DOUTR to reset value 0x00 */
  64  0008 725f53d3      	clr	21459
  65                     ; 96 }
  68  000c 81            	ret	
 142                     ; 109 void AES_OperationModeConfig(AES_Operation_TypeDef AES_Operation)
 142                     ; 110 {
 143                     	switch	.text
 144  000d               _AES_OperationModeConfig:
 146  000d 88            	push	a
 147       00000000      OFST:	set	0
 150                     ; 112   assert_param(IS_AES_MODE(AES_Operation));
 152                     ; 115   AES->CR &= (uint8_t) (~AES_CR_MODE);
 154  000e c653d0        	ld	a,21456
 155  0011 a4f9          	and	a,#249
 156  0013 c753d0        	ld	21456,a
 157                     ; 118   AES->CR |= (uint8_t) (AES_Operation);
 159  0016 c653d0        	ld	a,21456
 160  0019 1a01          	or	a,(OFST+1,sp)
 161  001b c753d0        	ld	21456,a
 162                     ; 119 }
 165  001e 84            	pop	a
 166  001f 81            	ret	
 221                     ; 129 void AES_Cmd(FunctionalState NewState)
 221                     ; 130 {
 222                     	switch	.text
 223  0020               _AES_Cmd:
 227                     ; 132   assert_param(IS_FUNCTIONAL_STATE(NewState));
 229                     ; 134   if (NewState != DISABLE)
 231  0020 4d            	tnz	a
 232  0021 2705          	jreq	L101
 233                     ; 136     AES->CR |= (uint8_t) AES_CR_EN;   /**< AES Enable */
 235  0023 721053d0      	bset	21456,#0
 238  0027 81            	ret	
 239  0028               L101:
 240                     ; 140     AES->CR &= (uint8_t)(~AES_CR_EN);  /**< AES Disable */
 242  0028 721153d0      	bres	21456,#0
 243                     ; 142 }
 246  002c 81            	ret	
 278                     ; 167 void AES_WriteSubData(uint8_t Data)
 278                     ; 168 {
 279                     	switch	.text
 280  002d               _AES_WriteSubData:
 284                     ; 170   AES->DINR = Data;
 286  002d c753d2        	ld	21458,a
 287                     ; 171 }
 290  0030 81            	ret	
 322                     ; 180 void AES_WriteSubKey(uint8_t Key)
 322                     ; 181 {
 323                     	switch	.text
 324  0031               _AES_WriteSubKey:
 328                     ; 183   AES->DINR = Key;
 330  0031 c753d2        	ld	21458,a
 331                     ; 184 }
 334  0034 81            	ret	
 357                     ; 192 uint8_t AES_ReadSubData(void)
 357                     ; 193 {
 358                     	switch	.text
 359  0035               _AES_ReadSubData:
 363                     ; 194   return AES->DOUTR;
 365  0035 c653d3        	ld	a,21459
 368  0038 81            	ret	
 391                     ; 203 uint8_t AES_ReadSubKey(void)
 391                     ; 204 {
 392                     	switch	.text
 393  0039               _AES_ReadSubKey:
 397                     ; 205   return AES->DOUTR;
 399  0039 c653d3        	ld	a,21459
 402  003c 81            	ret	
 461                     ; 234 void AES_DMAConfig(AES_DMATransfer_TypeDef AES_DMATransfer, FunctionalState NewState)
 461                     ; 235 {
 462                     	switch	.text
 463  003d               _AES_DMAConfig:
 465  003d 89            	pushw	x
 466       00000000      OFST:	set	0
 469                     ; 237   assert_param(IS_AES_DMATRANSFER(AES_DMATransfer));
 471                     ; 239   if (NewState != DISABLE)
 473  003e 9f            	ld	a,xl
 474  003f 4d            	tnz	a
 475  0040 2706          	jreq	L502
 476                     ; 242     AES->CR |= (uint8_t) AES_DMATransfer;
 478  0042 9e            	ld	a,xh
 479  0043 ca53d0        	or	a,21456
 481  0046 2006          	jra	L702
 482  0048               L502:
 483                     ; 247     AES->CR &= (uint8_t)(~AES_DMATransfer);
 485  0048 7b01          	ld	a,(OFST+1,sp)
 486  004a 43            	cpl	a
 487  004b c453d0        	and	a,21456
 488  004e               L702:
 489  004e c753d0        	ld	21456,a
 490                     ; 249 }
 493  0051 85            	popw	x
 494  0052 81            	ret	
 559                     ; 278 void AES_ITConfig(AES_IT_TypeDef AES_IT, FunctionalState NewState)
 559                     ; 279 {
 560                     	switch	.text
 561  0053               _AES_ITConfig:
 563  0053 89            	pushw	x
 564       00000000      OFST:	set	0
 567                     ; 281   assert_param(IS_FUNCTIONAL_STATE(NewState));
 569                     ; 282   assert_param(IS_AES_IT(AES_IT));
 571                     ; 284   if (NewState != DISABLE)
 573  0054 9f            	ld	a,xl
 574  0055 4d            	tnz	a
 575  0056 2706          	jreq	L342
 576                     ; 286     AES->CR |= (uint8_t) AES_IT;    /**< AES_IT Enable */
 578  0058 9e            	ld	a,xh
 579  0059 ca53d0        	or	a,21456
 581  005c 2006          	jra	L542
 582  005e               L342:
 583                     ; 290     AES->CR &= (uint8_t)(~AES_IT);  /**< AES_IT Disable */
 585  005e 7b01          	ld	a,(OFST+1,sp)
 586  0060 43            	cpl	a
 587  0061 c453d0        	and	a,21456
 588  0064               L542:
 589  0064 c753d0        	ld	21456,a
 590                     ; 292 }
 593  0067 85            	popw	x
 594  0068 81            	ret	
 687                     ; 304 FlagStatus AES_GetFlagStatus(AES_FLAG_TypeDef AES_FLAG)
 687                     ; 305 {
 688                     	switch	.text
 689  0069               _AES_GetFlagStatus:
 691  0069 88            	push	a
 692  006a 88            	push	a
 693       00000001      OFST:	set	1
 696                     ; 306   FlagStatus status = RESET;
 698                     ; 309   assert_param(IS_AES_FLAG(AES_FLAG));
 700                     ; 311   if (AES_FLAG == AES_FLAG_CCF)
 702  006b 4a            	dec	a
 703  006c 2609          	jrne	L313
 704                     ; 313     if ((AES->SR & (uint8_t)AES_FLAG_CCF) != (uint8_t)0x00)
 706  006e 720153d102    	btjf	21457,#0,L513
 707                     ; 316       status = (FlagStatus) SET;
 709  0073 200d          	jp	LC002
 710  0075               L513:
 711                     ; 321       status = (FlagStatus) RESET;
 712  0075 2018          	jp	L333
 713  0077               L313:
 714                     ; 324   else if (AES_FLAG == AES_FLAG_RDERR)
 716  0077 7b02          	ld	a,(OFST+1,sp)
 717  0079 a102          	cp	a,#2
 718  007b 260b          	jrne	L323
 719                     ; 326     if ((AES->SR & (uint8_t)AES_FLAG_RDERR) != (uint8_t)0x00)
 721  007d 720353d104    	btjf	21457,#1,L523
 722                     ; 329       status = (FlagStatus) SET;
 724  0082               LC002:
 727  0082 a601          	ld	a,#1
 729  0084 200a          	jra	L123
 730  0086               L523:
 731                     ; 334       status = (FlagStatus) RESET;
 732  0086 2007          	jp	L333
 733  0088               L323:
 734                     ; 339     if ((AES->SR & (uint8_t)AES_FLAG_WRERR) != (uint8_t)0x00)
 736  0088 720553d102    	btjf	21457,#2,L333
 737                     ; 342       status = (FlagStatus) SET;
 739  008d 20f3          	jp	LC002
 740  008f               L333:
 741                     ; 347       status = (FlagStatus) RESET;
 745  008f 4f            	clr	a
 746  0090               L123:
 747                     ; 351   return ((FlagStatus) status);
 751  0090 85            	popw	x
 752  0091 81            	ret	
 787                     ; 363 void AES_ClearFlag(AES_FLAG_TypeDef AES_FLAG)
 787                     ; 364 {
 788                     	switch	.text
 789  0092               _AES_ClearFlag:
 793                     ; 366   assert_param(IS_AES_FLAG(AES_FLAG));
 795                     ; 369   if (AES_FLAG == AES_FLAG_CCF)
 797  0092 4a            	dec	a
 798  0093 2605          	jrne	L553
 799                     ; 372     AES->CR |= (uint8_t) AES_CR_CCFC;
 801  0095 721653d0      	bset	21456,#3
 804  0099 81            	ret	
 805  009a               L553:
 806                     ; 377     AES->CR |= (uint8_t) AES_CR_ERRC;
 808  009a 721853d0      	bset	21456,#4
 809                     ; 379 }
 812  009e 81            	ret	
 878                     ; 389 ITStatus AES_GetITStatus(AES_IT_TypeDef AES_IT)
 878                     ; 390 {
 879                     	switch	.text
 880  009f               _AES_GetITStatus:
 882  009f 88            	push	a
 883  00a0 89            	pushw	x
 884       00000002      OFST:	set	2
 887                     ; 391   ITStatus itstatus = RESET;
 889                     ; 392   BitStatus cciebitstatus, ccfbitstatus = RESET;
 891                     ; 395   assert_param(IS_AES_IT(AES_IT));
 893                     ; 397   cciebitstatus = (BitStatus) (AES->CR & AES_CR_CCIE);
 895  00a1 c653d0        	ld	a,21456
 896  00a4 a420          	and	a,#32
 897  00a6 6b01          	ld	(OFST-1,sp),a
 898                     ; 398   ccfbitstatus =  (BitStatus) (AES->SR & AES_SR_CCF);
 900  00a8 c653d1        	ld	a,21457
 901  00ab a401          	and	a,#1
 902  00ad 6b02          	ld	(OFST+0,sp),a
 903                     ; 401   if (AES_IT == AES_IT_CCIE)
 905  00af 7b03          	ld	a,(OFST+1,sp)
 906  00b1 a120          	cp	a,#32
 907  00b3 260a          	jrne	L314
 908                     ; 404     if (((cciebitstatus) != RESET) && ((ccfbitstatus) != RESET))
 910  00b5 7b01          	ld	a,(OFST-1,sp)
 911  00b7 2716          	jreq	L524
 913  00b9 7b02          	ld	a,(OFST+0,sp)
 914  00bb 2712          	jreq	L524
 915                     ; 407       itstatus = (ITStatus) SET;
 917  00bd 200c          	jp	LC004
 918                     ; 412       itstatus = (ITStatus) RESET;
 919  00bf               L314:
 920                     ; 418     if ((AES->CR & AES_CR_ERRIE) != RESET)
 922  00bf 720d53d00b    	btjf	21456,#6,L524
 923                     ; 421       if ((AES->SR & (uint8_t)(AES_SR_WRERR | AES_SR_RDERR)) != RESET)
 925  00c4 c653d1        	ld	a,21457
 926  00c7 a506          	bcp	a,#6
 927  00c9 2704          	jreq	L524
 928                     ; 424         itstatus = (ITStatus) SET;
 930  00cb               LC004:
 932  00cb a601          	ld	a,#1
 934  00cd 2001          	jra	L124
 935  00cf               L524:
 936                     ; 429         itstatus = (ITStatus) RESET;
 937                     ; 435       itstatus = (ITStatus) RESET;
 941  00cf 4f            	clr	a
 942  00d0               L124:
 943                     ; 440   return ((ITStatus)itstatus);
 947  00d0 5b03          	addw	sp,#3
 948  00d2 81            	ret	
 984                     ; 451 void AES_ClearITPendingBit(AES_IT_TypeDef AES_IT)
 984                     ; 452 {
 985                     	switch	.text
 986  00d3               _AES_ClearITPendingBit:
 990                     ; 454   assert_param(IS_AES_IT(AES_IT));
 992                     ; 457   if (AES_IT == AES_IT_CCIE)
 994  00d3 a120          	cp	a,#32
 995  00d5 2605          	jrne	L154
 996                     ; 460     AES->CR |= (uint8_t) AES_CR_CCFC;
 998  00d7 721653d0      	bset	21456,#3
1001  00db 81            	ret	
1002  00dc               L154:
1003                     ; 465     AES->CR |= (uint8_t) AES_CR_ERRC;
1005  00dc 721853d0      	bset	21456,#4
1006                     ; 467 }
1009  00e0 81            	ret	
1022                     	xdef	_AES_ClearITPendingBit
1023                     	xdef	_AES_GetITStatus
1024                     	xdef	_AES_ClearFlag
1025                     	xdef	_AES_GetFlagStatus
1026                     	xdef	_AES_ITConfig
1027                     	xdef	_AES_DMAConfig
1028                     	xdef	_AES_ReadSubKey
1029                     	xdef	_AES_ReadSubData
1030                     	xdef	_AES_WriteSubKey
1031                     	xdef	_AES_WriteSubData
1032                     	xdef	_AES_Cmd
1033                     	xdef	_AES_OperationModeConfig
1034                     	xdef	_AES_DeInit
1053                     	end
