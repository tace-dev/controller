   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  96                     ; 229 ErrorStatus RTC_DeInit(void)
  96                     ; 230 {
  98                     .text:	section	.text,new
  99  0000               _RTC_DeInit:
 101  0000 5205          	subw	sp,#5
 102       00000005      OFST:	set	5
 105                     ; 231   ErrorStatus status = ERROR;
 107                     ; 232   uint16_t wutwfcount = 0;
 109  0002 5f            	clrw	x
 110  0003 1f02          	ldw	(OFST-3,sp),x
 111                     ; 233   uint16_t recalpfcount = 0;
 113  0005 5f            	clrw	x
 114  0006 1f04          	ldw	(OFST-1,sp),x
 115                     ; 236   RTC->WPR = 0xCA;
 117  0008 35ca5159      	mov	20825,#202
 118                     ; 237   RTC->WPR = 0x53;
 120  000c 35535159      	mov	20825,#83
 121                     ; 240   if (RTC_EnterInitMode() == ERROR)
 123  0010 cd0000        	call	_RTC_EnterInitMode
 125  0013 4d            	tnz	a
 126  0014 260b          	jrne	L74
 127                     ; 242     status = ERROR;
 129  0016 0f01          	clr	(OFST-4,sp)
 130                     ; 244     RTC->WPR = 0xFF; 
 132  0018 35ff5159      	mov	20825,#255
 134  001c               L15:
 135                     ; 340   return (ErrorStatus)status;
 137  001c 7b01          	ld	a,(OFST-4,sp)
 140  001e 5b05          	addw	sp,#5
 141  0020 81            	ret
 142  0021               L74:
 143                     ; 249     RTC->TR1 = RTC_TR1_RESET_VALUE;
 145  0021 725f5140      	clr	20800
 146                     ; 250     RTC->TR2 = RTC_TR2_RESET_VALUE;
 148  0025 725f5141      	clr	20801
 149                     ; 251     RTC->TR3 = RTC_TR3_RESET_VALUE;
 151  0029 725f5142      	clr	20802
 152                     ; 254     RTC->DR1 = RTC_DR1_RESET_VALUE;
 154  002d 35015144      	mov	20804,#1
 155                     ; 255     RTC->DR2 = RTC_DR2_RESET_VALUE;
 157  0031 35215145      	mov	20805,#33
 158                     ; 256     RTC->DR3 = RTC_DR3_RESET_VALUE;
 160  0035 725f5146      	clr	20806
 161                     ; 259     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
 163  0039 725f5150      	clr	20816
 164                     ; 260     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
 166  003d 35ff5151      	mov	20817,#255
 167                     ; 261     RTC->APRER  = RTC_APRER_RESET_VALUE;
 169  0041 357f5152      	mov	20818,#127
 170                     ; 263     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
 172  0045 725f516c      	clr	20844
 173                     ; 264     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
 175  0049 725f516d      	clr	20845
 176                     ; 268     RTC->CR1 = RTC_CR1_RESET_VALUE;
 178  004d 725f5148      	clr	20808
 179                     ; 269     RTC->CR2 = RTC_CR2_RESET_VALUE;
 181  0051 725f5149      	clr	20809
 182                     ; 270     RTC->CR3 = RTC_CR3_RESET_VALUE;
 184  0055 725f514a      	clr	20810
 186  0059 200b          	jra	L75
 187  005b               L35:
 188                     ; 275       wutwfcount++;
 190  005b 1e02          	ldw	x,(OFST-3,sp)
 191  005d 1c0001        	addw	x,#1
 192  0060 1f02          	ldw	(OFST-3,sp),x
 193                     ; 276       RTC->ISR1 = 0;
 195  0062 725f514c      	clr	20812
 196  0066               L75:
 197                     ; 273     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 199  0066 c6514c        	ld	a,20812
 200  0069 a504          	bcp	a,#4
 201  006b 2607          	jrne	L36
 203  006d 1e02          	ldw	x,(OFST-3,sp)
 204  006f a3ffff        	cpw	x,#65535
 205  0072 26e7          	jrne	L35
 206  0074               L36:
 207                     ; 279     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 209  0074 c6514c        	ld	a,20812
 210  0077 a504          	bcp	a,#4
 211  0079 2608          	jrne	L56
 212                     ; 281       status = ERROR;
 214  007b 0f01          	clr	(OFST-4,sp)
 215                     ; 283       RTC->WPR = 0xFF; 
 217  007d 35ff5159      	mov	20825,#255
 219  0081 2099          	jra	L15
 220  0083               L56:
 221                     ; 288       RTC->CR1 = RTC_CR1_RESET_VALUE;
 223  0083 725f5148      	clr	20808
 224                     ; 291       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 226  0087 35ff5154      	mov	20820,#255
 227                     ; 292       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 229  008b 35ff5155      	mov	20821,#255
 230                     ; 295       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 232  008f 725f515c      	clr	20828
 233                     ; 296       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 235  0093 725f515d      	clr	20829
 236                     ; 297       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 238  0097 725f515e      	clr	20830
 239                     ; 298       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 241  009b 725f515f      	clr	20831
 242                     ; 300       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 244  009f 725f5164      	clr	20836
 245                     ; 301       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 247  00a3 725f5165      	clr	20837
 248                     ; 302       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 250  00a7 725f5166      	clr	20838
 251                     ; 305       RTC->ISR1 = (uint8_t)0x00;
 253  00ab 725f514c      	clr	20812
 254                     ; 306       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 256  00af 725f514d      	clr	20813
 257                     ; 308       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
 259  00b3 c6514c        	ld	a,20812
 260  00b6 a502          	bcp	a,#2
 261  00b8 2717          	jreq	L17
 263  00ba 2007          	jra	L57
 264  00bc               L37:
 265                     ; 312           recalpfcount++;
 267  00bc 1e04          	ldw	x,(OFST-1,sp)
 268  00be 1c0001        	addw	x,#1
 269  00c1 1f04          	ldw	(OFST-1,sp),x
 270  00c3               L57:
 271                     ; 310         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
 273  00c3 c6514c        	ld	a,20812
 274  00c6 a502          	bcp	a,#2
 275  00c8 2707          	jreq	L17
 277  00ca 1e04          	ldw	x,(OFST-1,sp)
 278  00cc a3ffff        	cpw	x,#65535
 279  00cf 26eb          	jrne	L37
 280  00d1               L17:
 281                     ; 315       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
 283  00d1 c6514c        	ld	a,20812
 284  00d4 a502          	bcp	a,#2
 285  00d6 2618          	jrne	L301
 286                     ; 317         RTC->CALRH = RTC_CALRH_RESET_VALUE;
 288  00d8 725f516a      	clr	20842
 289                     ; 318         RTC->CALRL = RTC_CALRL_RESET_VALUE;
 291  00dc 725f516b      	clr	20843
 292                     ; 320         if (RTC_WaitForSynchro() == ERROR)
 294  00e0 cd0000        	call	_RTC_WaitForSynchro
 296  00e3 4d            	tnz	a
 297  00e4 2604          	jrne	L501
 298                     ; 322           status = ERROR;
 300  00e6 0f01          	clr	(OFST-4,sp)
 302  00e8 2008          	jra	L111
 303  00ea               L501:
 304                     ; 326           status = SUCCESS;
 306  00ea a601          	ld	a,#1
 307  00ec 6b01          	ld	(OFST-4,sp),a
 308  00ee 2002          	jra	L111
 309  00f0               L301:
 310                     ; 331         status = ERROR;
 312  00f0 0f01          	clr	(OFST-4,sp)
 313  00f2               L111:
 314                     ; 335       RTC->WPR = 0xFF; 
 316  00f2 35ff5159      	mov	20825,#255
 317  00f6 ac1c001c      	jpf	L15
 417                     ; 356 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 417                     ; 357 {
 418                     .text:	section	.text,new
 419  0000               _RTC_Init:
 421  0000 89            	pushw	x
 422  0001 88            	push	a
 423       00000001      OFST:	set	1
 426                     ; 358   ErrorStatus status = ERROR;
 428                     ; 361   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 430                     ; 362   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 432                     ; 363   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 434                     ; 366   RTC->WPR = 0xCA;
 436  0002 35ca5159      	mov	20825,#202
 437                     ; 367   RTC->WPR = 0x53;
 439  0006 35535159      	mov	20825,#83
 440                     ; 370   if (RTC_EnterInitMode() == ERROR)
 442  000a cd0000        	call	_RTC_EnterInitMode
 444  000d 4d            	tnz	a
 445  000e 2604          	jrne	L361
 446                     ; 372     status = ERROR;
 448  0010 0f01          	clr	(OFST+0,sp)
 450  0012 202d          	jra	L561
 451  0014               L361:
 452                     ; 377     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 454  0014 721d5148      	bres	20808,#6
 455                     ; 380     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 457  0018 1e02          	ldw	x,(OFST+1,sp)
 458  001a c65148        	ld	a,20808
 459  001d fa            	or	a,(x)
 460  001e c75148        	ld	20808,a
 461                     ; 383     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 463  0021 1e02          	ldw	x,(OFST+1,sp)
 464  0023 ee02          	ldw	x,(2,x)
 465  0025 4f            	clr	a
 466  0026 01            	rrwa	x,a
 467  0027 9f            	ld	a,xl
 468  0028 c75150        	ld	20816,a
 469                     ; 384     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 471  002b 1e02          	ldw	x,(OFST+1,sp)
 472  002d e603          	ld	a,(3,x)
 473  002f c75151        	ld	20817,a
 474                     ; 385     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 476  0032 1e02          	ldw	x,(OFST+1,sp)
 477  0034 e601          	ld	a,(1,x)
 478  0036 c75152        	ld	20818,a
 479                     ; 388     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 481  0039 721f514c      	bres	20812,#7
 482                     ; 390     status = SUCCESS;
 484  003d a601          	ld	a,#1
 485  003f 6b01          	ld	(OFST+0,sp),a
 486  0041               L561:
 487                     ; 394   RTC->WPR = 0xFF; 
 489  0041 35ff5159      	mov	20825,#255
 490                     ; 397   return (ErrorStatus)(status);
 492  0045 7b01          	ld	a,(OFST+0,sp)
 495  0047 5b03          	addw	sp,#3
 496  0049 81            	ret
 533                     ; 407 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 533                     ; 408 {
 534                     .text:	section	.text,new
 535  0000               _RTC_StructInit:
 539                     ; 410   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 541  0000 7f            	clr	(x)
 542                     ; 413   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 544  0001 a67f          	ld	a,#127
 545  0003 e701          	ld	(1,x),a
 546                     ; 416   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 548  0005 90ae00ff      	ldw	y,#255
 549  0009 ef02          	ldw	(2,x),y
 550                     ; 417 }
 553  000b 81            	ret
 609                     ; 427 void RTC_WriteProtectionCmd(FunctionalState NewState)
 609                     ; 428 {
 610                     .text:	section	.text,new
 611  0000               _RTC_WriteProtectionCmd:
 615                     ; 430   assert_param(IS_FUNCTIONAL_STATE(NewState));
 617                     ; 432   if (NewState != DISABLE)
 619  0000 4d            	tnz	a
 620  0001 2706          	jreq	L532
 621                     ; 435     RTC->WPR = RTC_WPR_EnableKey;
 623  0003 35ff5159      	mov	20825,#255
 625  0007 2008          	jra	L732
 626  0009               L532:
 627                     ; 440     RTC->WPR = RTC_WPR_DisableKey1;
 629  0009 35ca5159      	mov	20825,#202
 630                     ; 441     RTC->WPR = RTC_WPR_DisableKey2;
 632  000d 35535159      	mov	20825,#83
 633  0011               L732:
 634                     ; 443 }
 637  0011 81            	ret
 680                     ; 455 ErrorStatus RTC_EnterInitMode(void)
 680                     ; 456 {
 681                     .text:	section	.text,new
 682  0000               _RTC_EnterInitMode:
 684  0000 5203          	subw	sp,#3
 685       00000003      OFST:	set	3
 688                     ; 457   ErrorStatus status = ERROR;
 690                     ; 458   uint16_t initfcount = 0;
 692  0002 5f            	clrw	x
 693  0003 1f02          	ldw	(OFST-1,sp),x
 694                     ; 461   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 696  0005 c6514c        	ld	a,20812
 697  0008 a540          	bcp	a,#64
 698  000a 261b          	jrne	L162
 699                     ; 464     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
 701  000c 3580514c      	mov	20812,#128
 703  0010 2007          	jra	L762
 704  0012               L362:
 705                     ; 469       initfcount++;
 707  0012 1e02          	ldw	x,(OFST-1,sp)
 708  0014 1c0001        	addw	x,#1
 709  0017 1f02          	ldw	(OFST-1,sp),x
 710  0019               L762:
 711                     ; 467     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
 713  0019 c6514c        	ld	a,20812
 714  001c a540          	bcp	a,#64
 715  001e 2607          	jrne	L162
 717  0020 1e02          	ldw	x,(OFST-1,sp)
 718  0022 a3ffff        	cpw	x,#65535
 719  0025 26eb          	jrne	L362
 720  0027               L162:
 721                     ; 473   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 723  0027 c6514c        	ld	a,20812
 724  002a a540          	bcp	a,#64
 725  002c 2604          	jrne	L572
 726                     ; 475     status = ERROR;
 728  002e 0f01          	clr	(OFST-2,sp)
 730  0030 2004          	jra	L772
 731  0032               L572:
 732                     ; 479     status = SUCCESS;
 734  0032 a601          	ld	a,#1
 735  0034 6b01          	ld	(OFST-2,sp),a
 736  0036               L772:
 737                     ; 482   return (ErrorStatus)status;
 739  0036 7b01          	ld	a,(OFST-2,sp)
 742  0038 5b03          	addw	sp,#3
 743  003a 81            	ret
 766                     ; 495 void RTC_ExitInitMode(void)
 766                     ; 496 {
 767                     .text:	section	.text,new
 768  0000               _RTC_ExitInitMode:
 772                     ; 498   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 774  0000 721f514c      	bres	20812,#7
 775                     ; 499 }
 778  0004 81            	ret
 821                     ; 524 ErrorStatus RTC_WaitForSynchro(void)
 821                     ; 525 {
 822                     .text:	section	.text,new
 823  0000               _RTC_WaitForSynchro:
 825  0000 5203          	subw	sp,#3
 826       00000003      OFST:	set	3
 829                     ; 526   uint16_t rsfcount = 0;
 831  0002 5f            	clrw	x
 832  0003 1f02          	ldw	(OFST-1,sp),x
 833                     ; 527   ErrorStatus status = ERROR;
 835                     ; 530   RTC->WPR = 0xCA;
 837  0005 35ca5159      	mov	20825,#202
 838                     ; 531   RTC->WPR = 0x53;
 840  0009 35535159      	mov	20825,#83
 841                     ; 534   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
 843  000d c6514c        	ld	a,20812
 844  0010 a45f          	and	a,#95
 845  0012 c7514c        	ld	20812,a
 847  0015 2007          	jra	L333
 848  0017               L133:
 849                     ; 539     rsfcount++;
 851  0017 1e02          	ldw	x,(OFST-1,sp)
 852  0019 1c0001        	addw	x,#1
 853  001c 1f02          	ldw	(OFST-1,sp),x
 854  001e               L333:
 855                     ; 537   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
 857  001e c6514c        	ld	a,20812
 858  0021 a520          	bcp	a,#32
 859  0023 2607          	jrne	L733
 861  0025 1e02          	ldw	x,(OFST-1,sp)
 862  0027 a3ffff        	cpw	x,#65535
 863  002a 26eb          	jrne	L133
 864  002c               L733:
 865                     ; 543   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
 867  002c c6514c        	ld	a,20812
 868  002f a520          	bcp	a,#32
 869  0031 2706          	jreq	L143
 870                     ; 545     status = SUCCESS;
 872  0033 a601          	ld	a,#1
 873  0035 6b01          	ld	(OFST-2,sp),a
 875  0037 2002          	jra	L343
 876  0039               L143:
 877                     ; 549     status = ERROR;
 879  0039 0f01          	clr	(OFST-2,sp)
 880  003b               L343:
 881                     ; 553   RTC->WPR = 0xFF; 
 883  003b 35ff5159      	mov	20825,#255
 884                     ; 555   return (ErrorStatus)status;
 886  003f 7b01          	ld	a,(OFST-2,sp)
 889  0041 5b03          	addw	sp,#3
 890  0043 81            	ret
 925                     ; 565 void RTC_RatioCmd(FunctionalState NewState)
 925                     ; 566 {
 926                     .text:	section	.text,new
 927  0000               _RTC_RatioCmd:
 931                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
 933                     ; 571   RTC->WPR = 0xCA;
 935  0000 35ca5159      	mov	20825,#202
 936                     ; 572   RTC->WPR = 0x53;
 938  0004 35535159      	mov	20825,#83
 939                     ; 574   if (NewState != DISABLE)
 941  0008 4d            	tnz	a
 942  0009 2706          	jreq	L363
 943                     ; 577     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
 945  000b 721a5148      	bset	20808,#5
 947  000f 2004          	jra	L563
 948  0011               L363:
 949                     ; 582     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
 951  0011 721b5148      	bres	20808,#5
 952  0015               L563:
 953                     ; 586   RTC->WPR = 0xFF; 
 955  0015 35ff5159      	mov	20825,#255
 956                     ; 587 }
 959  0019 81            	ret
 995                     ; 595 void RTC_BypassShadowCmd(FunctionalState NewState)
 995                     ; 596 {
 996                     .text:	section	.text,new
 997  0000               _RTC_BypassShadowCmd:
1001                     ; 598   assert_param(IS_FUNCTIONAL_STATE(NewState));
1003                     ; 601   RTC->WPR = 0xCA;
1005  0000 35ca5159      	mov	20825,#202
1006                     ; 602   RTC->WPR = 0x53;
1008  0004 35535159      	mov	20825,#83
1009                     ; 604   if (NewState != DISABLE)
1011  0008 4d            	tnz	a
1012  0009 2706          	jreq	L504
1013                     ; 607     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
1015  000b 72185148      	bset	20808,#4
1017  000f 2004          	jra	L704
1018  0011               L504:
1019                     ; 612     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
1021  0011 72195148      	bres	20808,#4
1022  0015               L704:
1023                     ; 616   RTC->WPR = 0xFF; 
1025  0015 35ff5159      	mov	20825,#255
1026                     ; 617 }
1029  0019 81            	ret
1175                     ; 656 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
1175                     ; 657                         RTC_TimeTypeDef* RTC_TimeStruct)
1175                     ; 658 {
1176                     .text:	section	.text,new
1177  0000               _RTC_SetTime:
1179  0000 88            	push	a
1180  0001 88            	push	a
1181       00000001      OFST:	set	1
1184                     ; 659   ErrorStatus status = ERROR;
1186                     ; 660   uint8_t temp = 0;
1188                     ; 663   assert_param(IS_RTC_FORMAT(RTC_Format));
1190                     ; 665   if (RTC_Format == RTC_Format_BIN)
1192  0002 4d            	tnz	a
1193  0003 2609          	jrne	L105
1194                     ; 668     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1196  0005 c65148        	ld	a,20808
1197  0008 a540          	bcp	a,#64
1198  000a 2700          	jreq	L305
1199                     ; 670       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
1201                     ; 671       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
1204  000c               L305:
1205                     ; 675       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
1207                     ; 677     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
1209                     ; 678     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
1212  000c 2007          	jra	L705
1213  000e               L105:
1214                     ; 683     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1216  000e c65148        	ld	a,20808
1217  0011 a540          	bcp	a,#64
1218  0013 2700          	jreq	L115
1219                     ; 685       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1221                     ; 686       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1224  0015               L115:
1225                     ; 690       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1227                     ; 692     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
1229                     ; 693     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
1231  0015               L705:
1232                     ; 698   RTC->WPR = 0xCA;
1234  0015 35ca5159      	mov	20825,#202
1235                     ; 699   RTC->WPR = 0x53;
1237  0019 35535159      	mov	20825,#83
1238                     ; 702   if (RTC_EnterInitMode() == ERROR)
1240  001d cd0000        	call	_RTC_EnterInitMode
1242  0020 4d            	tnz	a
1243  0021 2608          	jrne	L515
1244                     ; 704     status = ERROR;
1246  0023 0f01          	clr	(OFST+0,sp)
1247                     ; 706     RTC->WPR = 0xFF; 
1249  0025 35ff5159      	mov	20825,#255
1251  0029 2072          	jra	L715
1252  002b               L515:
1253                     ; 711     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1255  002b c65148        	ld	a,20808
1256  002e a540          	bcp	a,#64
1257  0030 2708          	jreq	L125
1258                     ; 713       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
1260                     ; 714       temp = RTC_TimeStruct->RTC_H12;
1262  0032 1e05          	ldw	x,(OFST+4,sp)
1263  0034 e603          	ld	a,(3,x)
1264  0036 6b01          	ld	(OFST+0,sp),a
1266  0038 2002          	jra	L325
1267  003a               L125:
1268                     ; 718       temp = 0;
1270  003a 0f01          	clr	(OFST+0,sp)
1271  003c               L325:
1272                     ; 721     if (RTC_Format != RTC_Format_BIN)
1274  003c 0d02          	tnz	(OFST+1,sp)
1275  003e 2718          	jreq	L525
1276                     ; 723       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
1278  0040 1e05          	ldw	x,(OFST+4,sp)
1279  0042 e602          	ld	a,(2,x)
1280  0044 c75140        	ld	20800,a
1281                     ; 724       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
1283  0047 1e05          	ldw	x,(OFST+4,sp)
1284  0049 e601          	ld	a,(1,x)
1285  004b c75141        	ld	20801,a
1286                     ; 725       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
1288  004e 1e05          	ldw	x,(OFST+4,sp)
1289  0050 f6            	ld	a,(x)
1290  0051 1a01          	or	a,(OFST+0,sp)
1291  0053 c75142        	ld	20802,a
1293  0056 201f          	jra	L725
1294  0058               L525:
1295                     ; 729       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
1297  0058 1e05          	ldw	x,(OFST+4,sp)
1298  005a e602          	ld	a,(2,x)
1299  005c cd0000        	call	L3_ByteToBcd2
1301  005f c75140        	ld	20800,a
1302                     ; 730       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
1304  0062 1e05          	ldw	x,(OFST+4,sp)
1305  0064 e601          	ld	a,(1,x)
1306  0066 cd0000        	call	L3_ByteToBcd2
1308  0069 c75141        	ld	20801,a
1309                     ; 731       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
1311  006c 1e05          	ldw	x,(OFST+4,sp)
1312  006e f6            	ld	a,(x)
1313  006f cd0000        	call	L3_ByteToBcd2
1315  0072 1a01          	or	a,(OFST+0,sp)
1316  0074 c75142        	ld	20802,a
1317  0077               L725:
1318                     ; 734     (void)(RTC->DR3);
1320  0077 c65146        	ld	a,20806
1321                     ; 737     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1323  007a 721f514c      	bres	20812,#7
1324                     ; 740     RTC->WPR = 0xFF; 
1326  007e 35ff5159      	mov	20825,#255
1327                     ; 743     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1329  0082 c65148        	ld	a,20808
1330  0085 a510          	bcp	a,#16
1331  0087 2610          	jrne	L135
1332                     ; 745       if (RTC_WaitForSynchro() == ERROR)
1334  0089 cd0000        	call	_RTC_WaitForSynchro
1336  008c 4d            	tnz	a
1337  008d 2604          	jrne	L335
1338                     ; 747         status = ERROR;
1340  008f 0f01          	clr	(OFST+0,sp)
1342  0091 200a          	jra	L715
1343  0093               L335:
1344                     ; 751         status = SUCCESS;
1346  0093 a601          	ld	a,#1
1347  0095 6b01          	ld	(OFST+0,sp),a
1348  0097 2004          	jra	L715
1349  0099               L135:
1350                     ; 756       status = SUCCESS;
1352  0099 a601          	ld	a,#1
1353  009b 6b01          	ld	(OFST+0,sp),a
1354  009d               L715:
1355                     ; 760   return (ErrorStatus)status;
1357  009d 7b01          	ld	a,(OFST+0,sp)
1360  009f 85            	popw	x
1361  00a0 81            	ret
1398                     ; 772 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
1398                     ; 773 {
1399                     .text:	section	.text,new
1400  0000               _RTC_TimeStructInit:
1404                     ; 775   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
1406  0000 6f03          	clr	(3,x)
1407                     ; 776   RTC_TimeStruct->RTC_Hours = 0;
1409  0002 7f            	clr	(x)
1410                     ; 777   RTC_TimeStruct->RTC_Minutes = 0;
1412  0003 6f01          	clr	(1,x)
1413                     ; 778   RTC_TimeStruct->RTC_Seconds = 0;
1415  0005 6f02          	clr	(2,x)
1416                     ; 779 }
1419  0007 81            	ret
1474                     ; 795 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
1474                     ; 796                  RTC_TimeTypeDef* RTC_TimeStruct)
1474                     ; 797 {
1475                     .text:	section	.text,new
1476  0000               _RTC_GetTime:
1478  0000 88            	push	a
1479  0001 88            	push	a
1480       00000001      OFST:	set	1
1483                     ; 798   uint8_t  tmpreg = 0;
1485                     ; 801   assert_param(IS_RTC_FORMAT(RTC_Format));
1487                     ; 805   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
1489  0002 1e05          	ldw	x,(OFST+4,sp)
1490  0004 c65140        	ld	a,20800
1491  0007 e702          	ld	(2,x),a
1492                     ; 808   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
1494  0009 1e05          	ldw	x,(OFST+4,sp)
1495  000b c65141        	ld	a,20801
1496  000e e701          	ld	(1,x),a
1497                     ; 811   tmpreg = (uint8_t)RTC->TR3;
1499  0010 c65142        	ld	a,20802
1500  0013 6b01          	ld	(OFST+0,sp),a
1501                     ; 814   (void) (RTC->DR3) ;
1503  0015 c65146        	ld	a,20806
1504                     ; 818   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
1506  0018 7b01          	ld	a,(OFST+0,sp)
1507  001a a4bf          	and	a,#191
1508  001c 1e05          	ldw	x,(OFST+4,sp)
1509  001e f7            	ld	(x),a
1510                     ; 821   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
1512  001f 7b01          	ld	a,(OFST+0,sp)
1513  0021 a440          	and	a,#64
1514  0023 1e05          	ldw	x,(OFST+4,sp)
1515  0025 e703          	ld	(3,x),a
1516                     ; 824   if (RTC_Format == RTC_Format_BIN)
1518  0027 0d02          	tnz	(OFST+1,sp)
1519  0029 261f          	jrne	L706
1520                     ; 827     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
1522  002b 1e05          	ldw	x,(OFST+4,sp)
1523  002d f6            	ld	a,(x)
1524  002e cd0000        	call	L5_Bcd2ToByte
1526  0031 1e05          	ldw	x,(OFST+4,sp)
1527  0033 f7            	ld	(x),a
1528                     ; 828     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
1530  0034 1e05          	ldw	x,(OFST+4,sp)
1531  0036 e601          	ld	a,(1,x)
1532  0038 cd0000        	call	L5_Bcd2ToByte
1534  003b 1e05          	ldw	x,(OFST+4,sp)
1535  003d e701          	ld	(1,x),a
1536                     ; 829     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
1538  003f 1e05          	ldw	x,(OFST+4,sp)
1539  0041 e602          	ld	a,(2,x)
1540  0043 cd0000        	call	L5_Bcd2ToByte
1542  0046 1e05          	ldw	x,(OFST+4,sp)
1543  0048 e702          	ld	(2,x),a
1544  004a               L706:
1545                     ; 831 }
1548  004a 85            	popw	x
1549  004b 81            	ret
1595                     ; 842 uint16_t RTC_GetSubSecond(void)
1595                     ; 843 {
1596                     .text:	section	.text,new
1597  0000               _RTC_GetSubSecond:
1599  0000 5206          	subw	sp,#6
1600       00000006      OFST:	set	6
1603                     ; 844   uint8_t ssrhreg = 0, ssrlreg = 0;
1607                     ; 845   uint16_t ssrreg = 0;
1609                     ; 848   ssrhreg = RTC->SSRH;
1611  0002 c65157        	ld	a,20823
1612  0005 6b03          	ld	(OFST-3,sp),a
1613                     ; 849   ssrlreg = RTC->SSRL;
1615  0007 c65158        	ld	a,20824
1616  000a 6b04          	ld	(OFST-2,sp),a
1617                     ; 852   (void) (RTC->DR3);
1619  000c c65146        	ld	a,20806
1620                     ; 855   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
1622  000f 7b04          	ld	a,(OFST-2,sp)
1623  0011 5f            	clrw	x
1624  0012 97            	ld	xl,a
1625  0013 1f01          	ldw	(OFST-5,sp),x
1626  0015 7b03          	ld	a,(OFST-3,sp)
1627  0017 5f            	clrw	x
1628  0018 97            	ld	xl,a
1629  0019 4f            	clr	a
1630  001a 02            	rlwa	x,a
1631  001b 01            	rrwa	x,a
1632  001c 1a02          	or	a,(OFST-4,sp)
1633  001e 01            	rrwa	x,a
1634  001f 1a01          	or	a,(OFST-5,sp)
1635  0021 01            	rrwa	x,a
1636  0022 1f05          	ldw	(OFST-1,sp),x
1637                     ; 856   return (uint16_t)(ssrreg);
1639  0024 1e05          	ldw	x,(OFST-1,sp)
1642  0026 5b06          	addw	sp,#6
1643  0028 81            	ret
1895                     ; 873 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
1895                     ; 874                         RTC_DateTypeDef* RTC_DateStruct)
1895                     ; 875 {
1896                     .text:	section	.text,new
1897  0000               _RTC_SetDate:
1899  0000 88            	push	a
1900  0001 89            	pushw	x
1901       00000002      OFST:	set	2
1904                     ; 876   ErrorStatus status = ERROR;
1906                     ; 878   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
1908  0002 4d            	tnz	a
1909  0003 2616          	jrne	L757
1911  0005 1e06          	ldw	x,(OFST+4,sp)
1912  0007 e601          	ld	a,(1,x)
1913  0009 a410          	and	a,#16
1914  000b a110          	cp	a,#16
1915  000d 260c          	jrne	L757
1916                     ; 880     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
1918  000f 1e06          	ldw	x,(OFST+4,sp)
1919  0011 e601          	ld	a,(1,x)
1920  0013 a4ef          	and	a,#239
1921  0015 ab0a          	add	a,#10
1922  0017 1e06          	ldw	x,(OFST+4,sp)
1923  0019 e701          	ld	(1,x),a
1924  001b               L757:
1925                     ; 884   assert_param(IS_RTC_FORMAT(RTC_Format));
1927                     ; 885   if (RTC_Format == RTC_Format_BIN)
1929  001b 0d03          	tnz	(OFST+1,sp)
1930  001d 2600          	jrne	L167
1931                     ; 887     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
1933                     ; 888     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
1935                     ; 889     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
1937                     ; 890     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
1939                     ; 891     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
1942  001f               L167:
1943                     ; 895     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
1945                     ; 896     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1947                     ; 897     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1949                     ; 898     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1951                     ; 899     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1953                     ; 901   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
1955                     ; 904   RTC->WPR = 0xCA;
1957  001f 35ca5159      	mov	20825,#202
1958                     ; 905   RTC->WPR = 0x53;
1960  0023 35535159      	mov	20825,#83
1961                     ; 908   if (RTC_EnterInitMode() == ERROR)
1963  0027 cd0000        	call	_RTC_EnterInitMode
1965  002a 4d            	tnz	a
1966  002b 2608          	jrne	L567
1967                     ; 910     status = ERROR;
1969  002d 0f02          	clr	(OFST+0,sp)
1970                     ; 912     RTC->WPR = 0xFF; 
1972  002f 35ff5159      	mov	20825,#255
1974  0033 2073          	jra	L767
1975  0035               L567:
1976                     ; 916     (void)(RTC->TR1);
1978  0035 c65140        	ld	a,20800
1979                     ; 919     if (RTC_Format != RTC_Format_BIN)
1981  0038 0d03          	tnz	(OFST+1,sp)
1982  003a 271f          	jreq	L177
1983                     ; 921       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
1985  003c 1e06          	ldw	x,(OFST+4,sp)
1986  003e e602          	ld	a,(2,x)
1987  0040 c75144        	ld	20804,a
1988                     ; 922       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
1990  0043 1e06          	ldw	x,(OFST+4,sp)
1991  0045 f6            	ld	a,(x)
1992  0046 97            	ld	xl,a
1993  0047 a620          	ld	a,#32
1994  0049 42            	mul	x,a
1995  004a 9f            	ld	a,xl
1996  004b 1e06          	ldw	x,(OFST+4,sp)
1997  004d ea01          	or	a,(1,x)
1998  004f c75145        	ld	20805,a
1999                     ; 923       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
2001  0052 1e06          	ldw	x,(OFST+4,sp)
2002  0054 e603          	ld	a,(3,x)
2003  0056 c75146        	ld	20806,a
2005  0059 202a          	jra	L377
2006  005b               L177:
2007                     ; 927       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
2009  005b 1e06          	ldw	x,(OFST+4,sp)
2010  005d e602          	ld	a,(2,x)
2011  005f cd0000        	call	L3_ByteToBcd2
2013  0062 c75144        	ld	20804,a
2014                     ; 928       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
2016  0065 1e06          	ldw	x,(OFST+4,sp)
2017  0067 f6            	ld	a,(x)
2018  0068 97            	ld	xl,a
2019  0069 a620          	ld	a,#32
2020  006b 42            	mul	x,a
2021  006c 9f            	ld	a,xl
2022  006d 6b01          	ld	(OFST-1,sp),a
2023  006f 1e06          	ldw	x,(OFST+4,sp)
2024  0071 e601          	ld	a,(1,x)
2025  0073 cd0000        	call	L3_ByteToBcd2
2027  0076 1a01          	or	a,(OFST-1,sp)
2028  0078 c75145        	ld	20805,a
2029                     ; 929       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
2031  007b 1e06          	ldw	x,(OFST+4,sp)
2032  007d e603          	ld	a,(3,x)
2033  007f cd0000        	call	L3_ByteToBcd2
2035  0082 c75146        	ld	20806,a
2036  0085               L377:
2037                     ; 933     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
2039  0085 721f514c      	bres	20812,#7
2040                     ; 936     RTC->WPR = 0xFF; 
2042  0089 35ff5159      	mov	20825,#255
2043                     ; 939     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
2045  008d c65148        	ld	a,20808
2046  0090 a510          	bcp	a,#16
2047  0092 2610          	jrne	L577
2048                     ; 941       if (RTC_WaitForSynchro() == ERROR)
2050  0094 cd0000        	call	_RTC_WaitForSynchro
2052  0097 4d            	tnz	a
2053  0098 2604          	jrne	L777
2054                     ; 943         status = ERROR;
2056  009a 0f02          	clr	(OFST+0,sp)
2058  009c 200a          	jra	L767
2059  009e               L777:
2060                     ; 947         status = SUCCESS;
2062  009e a601          	ld	a,#1
2063  00a0 6b02          	ld	(OFST+0,sp),a
2064  00a2 2004          	jra	L767
2065  00a4               L577:
2066                     ; 952       status = SUCCESS;
2068  00a4 a601          	ld	a,#1
2069  00a6 6b02          	ld	(OFST+0,sp),a
2070  00a8               L767:
2071                     ; 956   return (ErrorStatus)status;
2073  00a8 7b02          	ld	a,(OFST+0,sp)
2076  00aa 5b03          	addw	sp,#3
2077  00ac 81            	ret
2114                     ; 965 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
2114                     ; 966 {
2115                     .text:	section	.text,new
2116  0000               _RTC_DateStructInit:
2120                     ; 968   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
2122  0000 a601          	ld	a,#1
2123  0002 f7            	ld	(x),a
2124                     ; 969   RTC_DateStruct->RTC_Date = 1;
2126  0003 a601          	ld	a,#1
2127  0005 e702          	ld	(2,x),a
2128                     ; 970   RTC_DateStruct->RTC_Month = RTC_Month_January;
2130  0007 a601          	ld	a,#1
2131  0009 e701          	ld	(1,x),a
2132                     ; 971   RTC_DateStruct->RTC_Year = 0;
2134  000b 6f03          	clr	(3,x)
2135                     ; 972 }
2138  000d 81            	ret
2193                     ; 985 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
2193                     ; 986                  RTC_DateTypeDef* RTC_DateStruct)
2193                     ; 987 {
2194                     .text:	section	.text,new
2195  0000               _RTC_GetDate:
2197  0000 88            	push	a
2198  0001 88            	push	a
2199       00000001      OFST:	set	1
2202                     ; 988   uint8_t tmpreg = 0;
2204                     ; 991   assert_param(IS_RTC_FORMAT(RTC_Format));
2206                     ; 994   (void) (RTC->TR1) ;
2208  0002 c65140        	ld	a,20800
2209                     ; 995   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
2211  0005 1e05          	ldw	x,(OFST+4,sp)
2212  0007 c65144        	ld	a,20804
2213  000a e702          	ld	(2,x),a
2214                     ; 996   tmpreg = (uint8_t)RTC->DR2;
2216  000c c65145        	ld	a,20805
2217  000f 6b01          	ld	(OFST+0,sp),a
2218                     ; 997   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
2220  0011 1e05          	ldw	x,(OFST+4,sp)
2221  0013 c65146        	ld	a,20806
2222  0016 e703          	ld	(3,x),a
2223                     ; 1000   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
2225  0018 7b01          	ld	a,(OFST+0,sp)
2226  001a a41f          	and	a,#31
2227  001c 1e05          	ldw	x,(OFST+4,sp)
2228  001e e701          	ld	(1,x),a
2229                     ; 1001   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
2231  0020 7b01          	ld	a,(OFST+0,sp)
2232  0022 a4e0          	and	a,#224
2233  0024 4e            	swap	a
2234  0025 44            	srl	a
2235  0026 a407          	and	a,#7
2236  0028 1e05          	ldw	x,(OFST+4,sp)
2237  002a f7            	ld	(x),a
2238                     ; 1004   if (RTC_Format == RTC_Format_BIN)
2240  002b 0d02          	tnz	(OFST+1,sp)
2241  002d 2621          	jrne	L3501
2242                     ; 1007     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
2244  002f 1e05          	ldw	x,(OFST+4,sp)
2245  0031 e603          	ld	a,(3,x)
2246  0033 cd0000        	call	L5_Bcd2ToByte
2248  0036 1e05          	ldw	x,(OFST+4,sp)
2249  0038 e703          	ld	(3,x),a
2250                     ; 1008     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
2252  003a 1e05          	ldw	x,(OFST+4,sp)
2253  003c e601          	ld	a,(1,x)
2254  003e cd0000        	call	L5_Bcd2ToByte
2256  0041 1e05          	ldw	x,(OFST+4,sp)
2257  0043 e701          	ld	(1,x),a
2258                     ; 1009     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
2260  0045 1e05          	ldw	x,(OFST+4,sp)
2261  0047 e602          	ld	a,(2,x)
2262  0049 cd0000        	call	L5_Bcd2ToByte
2264  004c 1e05          	ldw	x,(OFST+4,sp)
2265  004e e702          	ld	(2,x),a
2266  0050               L3501:
2267                     ; 1011 }
2270  0050 85            	popw	x
2271  0051 81            	ret
2412                     ; 1041 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
2412                     ; 1042                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2412                     ; 1043 {
2413                     .text:	section	.text,new
2414  0000               _RTC_SetAlarm:
2416  0000 88            	push	a
2417  0001 5205          	subw	sp,#5
2418       00000005      OFST:	set	5
2421                     ; 1044   uint8_t tmpreg1 = 0;
2423                     ; 1045   uint8_t tmpreg2 = 0;
2425                     ; 1046   uint8_t tmpreg3 = 0;
2427                     ; 1047   uint8_t tmpreg4 = 0;
2429                     ; 1050   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
2431                     ; 1051   assert_param(IS_RTC_FORMAT(RTC_Format));
2433                     ; 1052   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
2435                     ; 1053   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
2437                     ; 1056   if (RTC_Format == RTC_Format_BIN)
2439  0003 4d            	tnz	a
2440  0004 2609          	jrne	L1411
2441                     ; 1059     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2443  0006 c65148        	ld	a,20808
2444  0009 a540          	bcp	a,#64
2445  000b 2700          	jreq	L3411
2446                     ; 1061       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2448                     ; 1062       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2451  000d               L3411:
2452                     ; 1066       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2454                     ; 1068     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
2456                     ; 1069     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
2459  000d 2007          	jra	L7411
2460  000f               L1411:
2461                     ; 1074     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2463  000f c65148        	ld	a,20808
2464  0012 a540          	bcp	a,#64
2465  0014 2700          	jreq	L1511
2466                     ; 1076       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2468                     ; 1077       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2471  0016               L1511:
2472                     ; 1081       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2474                     ; 1084     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
2476                     ; 1086     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
2478  0016               L7411:
2479                     ; 1091   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
2481  0016 1e09          	ldw	x,(OFST+4,sp)
2482  0018 e604          	ld	a,(4,x)
2483  001a a510          	bcp	a,#16
2484  001c 2608          	jrne	L5511
2485                     ; 1093     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
2487  001e 1e09          	ldw	x,(OFST+4,sp)
2488  0020 e605          	ld	a,(5,x)
2489  0022 a140          	cp	a,#64
2490  0024 2600          	jrne	L7511
2491                     ; 1095       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2494  0026               L7511:
2495                     ; 1099       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2497                     ; 1100       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2499  0026               L5511:
2500                     ; 1105   RTC->WPR = 0xCA;
2502  0026 35ca5159      	mov	20825,#202
2503                     ; 1106   RTC->WPR = 0x53;
2505  002a 35535159      	mov	20825,#83
2506                     ; 1110   if (RTC_Format != RTC_Format_BIN)
2508  002e 0d06          	tnz	(OFST+1,sp)
2509  0030 2747          	jreq	L3611
2510                     ; 1112     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
2510                     ; 1113                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
2512  0032 1e09          	ldw	x,(OFST+4,sp)
2513  0034 e604          	ld	a,(4,x)
2514  0036 a480          	and	a,#128
2515  0038 1e09          	ldw	x,(OFST+4,sp)
2516  003a ea02          	or	a,(2,x)
2517  003c 6b02          	ld	(OFST-3,sp),a
2518                     ; 1115     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
2518                     ; 1116                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2520  003e 1e09          	ldw	x,(OFST+4,sp)
2521  0040 e604          	ld	a,(4,x)
2522  0042 48            	sll	a
2523  0043 a480          	and	a,#128
2524  0045 1e09          	ldw	x,(OFST+4,sp)
2525  0047 ea01          	or	a,(1,x)
2526  0049 6b03          	ld	(OFST-2,sp),a
2527                     ; 1118     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
2527                     ; 1119                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2527                     ; 1120                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2529  004b 1e09          	ldw	x,(OFST+4,sp)
2530  004d e604          	ld	a,(4,x)
2531  004f 48            	sll	a
2532  0050 48            	sll	a
2533  0051 a480          	and	a,#128
2534  0053 6b01          	ld	(OFST-4,sp),a
2535  0055 1e09          	ldw	x,(OFST+4,sp)
2536  0057 e603          	ld	a,(3,x)
2537  0059 1e09          	ldw	x,(OFST+4,sp)
2538  005b fa            	or	a,(x)
2539  005c 1a01          	or	a,(OFST-4,sp)
2540  005e 6b04          	ld	(OFST-1,sp),a
2541                     ; 1122     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
2541                     ; 1123                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2541                     ; 1124                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
2543  0060 1e09          	ldw	x,(OFST+4,sp)
2544  0062 e604          	ld	a,(4,x)
2545  0064 48            	sll	a
2546  0065 48            	sll	a
2547  0066 48            	sll	a
2548  0067 a480          	and	a,#128
2549  0069 6b01          	ld	(OFST-4,sp),a
2550  006b 1e09          	ldw	x,(OFST+4,sp)
2551  006d e605          	ld	a,(5,x)
2552  006f 1e09          	ldw	x,(OFST+4,sp)
2553  0071 ea06          	or	a,(6,x)
2554  0073 1a01          	or	a,(OFST-4,sp)
2555  0075 6b05          	ld	(OFST+0,sp),a
2557  0077 2059          	jra	L5611
2558  0079               L3611:
2559                     ; 1129     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
2559                     ; 1130                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
2561  0079 1e09          	ldw	x,(OFST+4,sp)
2562  007b e604          	ld	a,(4,x)
2563  007d a480          	and	a,#128
2564  007f 6b01          	ld	(OFST-4,sp),a
2565  0081 1e09          	ldw	x,(OFST+4,sp)
2566  0083 e602          	ld	a,(2,x)
2567  0085 cd0000        	call	L3_ByteToBcd2
2569  0088 1a01          	or	a,(OFST-4,sp)
2570  008a 6b02          	ld	(OFST-3,sp),a
2571                     ; 1132     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
2571                     ; 1133                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2573  008c 1e09          	ldw	x,(OFST+4,sp)
2574  008e e604          	ld	a,(4,x)
2575  0090 48            	sll	a
2576  0091 a480          	and	a,#128
2577  0093 6b01          	ld	(OFST-4,sp),a
2578  0095 1e09          	ldw	x,(OFST+4,sp)
2579  0097 e601          	ld	a,(1,x)
2580  0099 cd0000        	call	L3_ByteToBcd2
2582  009c 1a01          	or	a,(OFST-4,sp)
2583  009e 6b03          	ld	(OFST-2,sp),a
2584                     ; 1135     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
2584                     ; 1136                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2584                     ; 1137                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2586  00a0 1e09          	ldw	x,(OFST+4,sp)
2587  00a2 e604          	ld	a,(4,x)
2588  00a4 48            	sll	a
2589  00a5 48            	sll	a
2590  00a6 a480          	and	a,#128
2591  00a8 6b01          	ld	(OFST-4,sp),a
2592  00aa 1e09          	ldw	x,(OFST+4,sp)
2593  00ac f6            	ld	a,(x)
2594  00ad cd0000        	call	L3_ByteToBcd2
2596  00b0 1e09          	ldw	x,(OFST+4,sp)
2597  00b2 ea03          	or	a,(3,x)
2598  00b4 1a01          	or	a,(OFST-4,sp)
2599  00b6 6b04          	ld	(OFST-1,sp),a
2600                     ; 1139     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
2600                     ; 1140                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2600                     ; 1141                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
2602  00b8 1e09          	ldw	x,(OFST+4,sp)
2603  00ba e604          	ld	a,(4,x)
2604  00bc 48            	sll	a
2605  00bd 48            	sll	a
2606  00be 48            	sll	a
2607  00bf a480          	and	a,#128
2608  00c1 6b01          	ld	(OFST-4,sp),a
2609  00c3 1e09          	ldw	x,(OFST+4,sp)
2610  00c5 e606          	ld	a,(6,x)
2611  00c7 cd0000        	call	L3_ByteToBcd2
2613  00ca 1e09          	ldw	x,(OFST+4,sp)
2614  00cc ea05          	or	a,(5,x)
2615  00ce 1a01          	or	a,(OFST-4,sp)
2616  00d0 6b05          	ld	(OFST+0,sp),a
2617  00d2               L5611:
2618                     ; 1145   RTC->ALRMAR1 = tmpreg1;
2620  00d2 7b02          	ld	a,(OFST-3,sp)
2621  00d4 c7515c        	ld	20828,a
2622                     ; 1146   RTC->ALRMAR2 = tmpreg2;
2624  00d7 7b03          	ld	a,(OFST-2,sp)
2625  00d9 c7515d        	ld	20829,a
2626                     ; 1147   RTC->ALRMAR3 = tmpreg3;
2628  00dc 7b04          	ld	a,(OFST-1,sp)
2629  00de c7515e        	ld	20830,a
2630                     ; 1148   RTC->ALRMAR4 = tmpreg4;
2632  00e1 7b05          	ld	a,(OFST+0,sp)
2633  00e3 c7515f        	ld	20831,a
2634                     ; 1151   RTC->WPR = 0xFF; 
2636  00e6 35ff5159      	mov	20825,#255
2637                     ; 1152 }
2640  00ea 5b06          	addw	sp,#6
2641  00ec 81            	ret
2679                     ; 1162 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
2679                     ; 1163 {
2680                     .text:	section	.text,new
2681  0000               _RTC_AlarmStructInit:
2685                     ; 1165   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
2687  0000 6f03          	clr	(3,x)
2688                     ; 1166   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
2690  0002 7f            	clr	(x)
2691                     ; 1167   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
2693  0003 6f01          	clr	(1,x)
2694                     ; 1168   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
2696  0005 6f02          	clr	(2,x)
2697                     ; 1171   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
2699  0007 6f05          	clr	(5,x)
2700                     ; 1172   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
2702  0009 a601          	ld	a,#1
2703  000b e706          	ld	(6,x),a
2704                     ; 1175   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
2706  000d a6f0          	ld	a,#240
2707  000f e704          	ld	(4,x),a
2708                     ; 1176 }
2711  0011 81            	ret
2794                     ; 1185 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
2794                     ; 1186                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2794                     ; 1187 {
2795                     .text:	section	.text,new
2796  0000               _RTC_GetAlarm:
2798  0000 88            	push	a
2799  0001 5204          	subw	sp,#4
2800       00000004      OFST:	set	4
2803                     ; 1188   uint8_t tmpreg1 = 0;
2805                     ; 1189   uint8_t tmpreg2 = 0;
2807                     ; 1190   uint8_t tmpreg3 = 0;
2809                     ; 1191   uint8_t tmpreg4 = 0;
2811                     ; 1192   uint8_t alarmmask = 0;
2813                     ; 1195   assert_param(IS_RTC_FORMAT(RTC_Format));
2815                     ; 1198   tmpreg1 = (uint8_t)RTC->ALRMAR1;
2817  0003 c6515c        	ld	a,20828
2818  0006 6b04          	ld	(OFST+0,sp),a
2819                     ; 1199   tmpreg2 = (uint8_t)RTC->ALRMAR2;
2821  0008 c6515d        	ld	a,20829
2822  000b 6b01          	ld	(OFST-3,sp),a
2823                     ; 1200   tmpreg3 = (uint8_t)RTC->ALRMAR3;
2825  000d c6515e        	ld	a,20830
2826  0010 6b02          	ld	(OFST-2,sp),a
2827                     ; 1201   tmpreg4 = (uint8_t)RTC->ALRMAR4;
2829  0012 c6515f        	ld	a,20831
2830  0015 6b03          	ld	(OFST-1,sp),a
2831                     ; 1204   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
2833  0017 7b04          	ld	a,(OFST+0,sp)
2834  0019 a47f          	and	a,#127
2835  001b 1e08          	ldw	x,(OFST+4,sp)
2836  001d e702          	ld	(2,x),a
2837                     ; 1205   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
2839  001f 7b04          	ld	a,(OFST+0,sp)
2840  0021 a480          	and	a,#128
2841  0023 6b04          	ld	(OFST+0,sp),a
2842                     ; 1208   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
2844  0025 7b01          	ld	a,(OFST-3,sp)
2845  0027 a47f          	and	a,#127
2846  0029 1e08          	ldw	x,(OFST+4,sp)
2847  002b e701          	ld	(1,x),a
2848                     ; 1209   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
2850  002d 7b01          	ld	a,(OFST-3,sp)
2851  002f a480          	and	a,#128
2852  0031 44            	srl	a
2853  0032 1a04          	or	a,(OFST+0,sp)
2854  0034 6b04          	ld	(OFST+0,sp),a
2855                     ; 1212   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
2857  0036 7b02          	ld	a,(OFST-2,sp)
2858  0038 a43f          	and	a,#63
2859  003a 1e08          	ldw	x,(OFST+4,sp)
2860  003c f7            	ld	(x),a
2861                     ; 1213   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
2863  003d 7b02          	ld	a,(OFST-2,sp)
2864  003f a440          	and	a,#64
2865  0041 1e08          	ldw	x,(OFST+4,sp)
2866  0043 e703          	ld	(3,x),a
2867                     ; 1214   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
2869  0045 7b02          	ld	a,(OFST-2,sp)
2870  0047 a480          	and	a,#128
2871  0049 44            	srl	a
2872  004a 44            	srl	a
2873  004b 1a04          	or	a,(OFST+0,sp)
2874  004d 6b04          	ld	(OFST+0,sp),a
2875                     ; 1217   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
2877  004f 7b03          	ld	a,(OFST-1,sp)
2878  0051 a43f          	and	a,#63
2879  0053 1e08          	ldw	x,(OFST+4,sp)
2880  0055 e706          	ld	(6,x),a
2881                     ; 1218   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
2883  0057 7b03          	ld	a,(OFST-1,sp)
2884  0059 a440          	and	a,#64
2885  005b 1e08          	ldw	x,(OFST+4,sp)
2886  005d e705          	ld	(5,x),a
2887                     ; 1219   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
2889  005f 7b03          	ld	a,(OFST-1,sp)
2890  0061 a480          	and	a,#128
2891  0063 44            	srl	a
2892  0064 44            	srl	a
2893  0065 44            	srl	a
2894  0066 1a04          	or	a,(OFST+0,sp)
2895  0068 6b04          	ld	(OFST+0,sp),a
2896                     ; 1221   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
2898  006a 7b04          	ld	a,(OFST+0,sp)
2899  006c 1e08          	ldw	x,(OFST+4,sp)
2900  006e e704          	ld	(4,x),a
2901                     ; 1223   if (RTC_Format == RTC_Format_BIN)
2903  0070 0d05          	tnz	(OFST+1,sp)
2904  0072 262a          	jrne	L5421
2905                     ; 1225     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
2907  0074 1e08          	ldw	x,(OFST+4,sp)
2908  0076 f6            	ld	a,(x)
2909  0077 cd0000        	call	L5_Bcd2ToByte
2911  007a 1e08          	ldw	x,(OFST+4,sp)
2912  007c f7            	ld	(x),a
2913                     ; 1226     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
2915  007d 1e08          	ldw	x,(OFST+4,sp)
2916  007f e601          	ld	a,(1,x)
2917  0081 cd0000        	call	L5_Bcd2ToByte
2919  0084 1e08          	ldw	x,(OFST+4,sp)
2920  0086 e701          	ld	(1,x),a
2921                     ; 1227     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
2923  0088 1e08          	ldw	x,(OFST+4,sp)
2924  008a e602          	ld	a,(2,x)
2925  008c cd0000        	call	L5_Bcd2ToByte
2927  008f 1e08          	ldw	x,(OFST+4,sp)
2928  0091 e702          	ld	(2,x),a
2929                     ; 1228     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
2931  0093 1e08          	ldw	x,(OFST+4,sp)
2932  0095 e606          	ld	a,(6,x)
2933  0097 cd0000        	call	L5_Bcd2ToByte
2935  009a 1e08          	ldw	x,(OFST+4,sp)
2936  009c e706          	ld	(6,x),a
2937  009e               L5421:
2938                     ; 1230 }
2941  009e 5b05          	addw	sp,#5
2942  00a0 81            	ret
3004                     ; 1239 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
3004                     ; 1240 {
3005                     .text:	section	.text,new
3006  0000               _RTC_AlarmCmd:
3008  0000 5203          	subw	sp,#3
3009       00000003      OFST:	set	3
3012                     ; 1241   __IO uint16_t alrawfcount = 0;
3014  0002 5f            	clrw	x
3015  0003 1f01          	ldw	(OFST-2,sp),x
3016                     ; 1242   ErrorStatus status = ERROR;
3018                     ; 1243   uint8_t temp1 = 0;
3020                     ; 1246   assert_param(IS_FUNCTIONAL_STATE(NewState));
3022                     ; 1249   RTC->WPR = 0xCA;
3024  0005 35ca5159      	mov	20825,#202
3025                     ; 1250   RTC->WPR = 0x53;
3027  0009 35535159      	mov	20825,#83
3028                     ; 1253   if (NewState != DISABLE)
3030  000d 4d            	tnz	a
3031  000e 2711          	jreq	L7721
3032                     ; 1255     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
3034  0010 72105149      	bset	20809,#0
3035                     ; 1256     status = SUCCESS;
3037  0014 a601          	ld	a,#1
3038  0016 6b03          	ld	(OFST+0,sp),a
3040  0018               L1031:
3041                     ; 1280   RTC->WPR = 0xFF; 
3043  0018 35ff5159      	mov	20825,#255
3044                     ; 1283   return (ErrorStatus)status;
3046  001c 7b03          	ld	a,(OFST+0,sp)
3049  001e 5b03          	addw	sp,#3
3050  0020 81            	ret
3051  0021               L7721:
3052                     ; 1260     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
3054  0021 72115149      	bres	20809,#0
3055                     ; 1263     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
3057  0025 c6514c        	ld	a,20812
3058  0028 a401          	and	a,#1
3059  002a 6b03          	ld	(OFST+0,sp),a
3061  002c 2007          	jra	L7031
3062  002e               L3031:
3063                     ; 1266       alrawfcount++;
3065  002e 1e01          	ldw	x,(OFST-2,sp)
3066  0030 1c0001        	addw	x,#1
3067  0033 1f01          	ldw	(OFST-2,sp),x
3068  0035               L7031:
3069                     ; 1264     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
3071  0035 1e01          	ldw	x,(OFST-2,sp)
3072  0037 a3ffff        	cpw	x,#65535
3073  003a 2704          	jreq	L3131
3075  003c 0d03          	tnz	(OFST+0,sp)
3076  003e 27ee          	jreq	L3031
3077  0040               L3131:
3078                     ; 1269     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
3080  0040 c6514c        	ld	a,20812
3081  0043 a501          	bcp	a,#1
3082  0045 2604          	jrne	L5131
3083                     ; 1271       status = ERROR;
3085  0047 0f03          	clr	(OFST+0,sp)
3087  0049 20cd          	jra	L1031
3088  004b               L5131:
3089                     ; 1275       status = SUCCESS;
3091  004b a601          	ld	a,#1
3092  004d 6b03          	ld	(OFST+0,sp),a
3093  004f 20c7          	jra	L1031
3290                     ; 1295 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
3290                     ; 1296                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
3290                     ; 1297 {
3291                     .text:	section	.text,new
3292  0000               _RTC_AlarmSubSecondConfig:
3294  0000 89            	pushw	x
3295  0001 88            	push	a
3296       00000001      OFST:	set	1
3299                     ; 1298   uint8_t alarmstatus = 0;
3301                     ; 1299   ErrorStatus status = ERROR;
3303                     ; 1302   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
3305                     ; 1303   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
3307                     ; 1306   RTC->WPR = 0xCA;
3309  0002 35ca5159      	mov	20825,#202
3310                     ; 1307   RTC->WPR = 0x53;
3312  0006 35535159      	mov	20825,#83
3313                     ; 1310   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
3315  000a c6514c        	ld	a,20812
3316  000d a540          	bcp	a,#64
3317  000f 2626          	jrne	L3141
3318                     ; 1313     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
3320  0011 c65149        	ld	a,20809
3321  0014 aa01          	or	a,#1
3322  0016 6b01          	ld	(OFST+0,sp),a
3323                     ; 1316     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
3325  0018 72115149      	bres	20809,#0
3326                     ; 1319     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
3328  001c 9e            	ld	a,xh
3329  001d c75164        	ld	20836,a
3330                     ; 1320     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
3332  0020 9f            	ld	a,xl
3333  0021 c75165        	ld	20837,a
3334                     ; 1321     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
3336  0024 7b06          	ld	a,(OFST+5,sp)
3337  0026 c75166        	ld	20838,a
3338                     ; 1324     RTC->CR2 |= alarmstatus;
3340  0029 c65149        	ld	a,20809
3341  002c 1a01          	or	a,(OFST+0,sp)
3342  002e c75149        	ld	20809,a
3343                     ; 1326     status = SUCCESS;
3345  0031 a601          	ld	a,#1
3346  0033 6b01          	ld	(OFST+0,sp),a
3348  0035 2002          	jra	L5141
3349  0037               L3141:
3350                     ; 1330     status = ERROR;
3352  0037 0f01          	clr	(OFST+0,sp)
3353  0039               L5141:
3354                     ; 1334   RTC->WPR = 0xFF; 
3356  0039 35ff5159      	mov	20825,#255
3357                     ; 1336   return (ErrorStatus)status;
3359  003d 7b01          	ld	a,(OFST+0,sp)
3362  003f 5b03          	addw	sp,#3
3363  0041 81            	ret
3453                     ; 1366 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
3453                     ; 1367 {
3454                     .text:	section	.text,new
3455  0000               _RTC_WakeUpClockConfig:
3457  0000 88            	push	a
3458       00000000      OFST:	set	0
3461                     ; 1370   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
3463                     ; 1373   RTC->WPR = 0xCA;
3465  0001 35ca5159      	mov	20825,#202
3466                     ; 1374   RTC->WPR = 0x53;
3468  0005 35535159      	mov	20825,#83
3469                     ; 1377   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3471  0009 72155149      	bres	20809,#2
3472                     ; 1380   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
3474  000d c65148        	ld	a,20808
3475  0010 a4f8          	and	a,#248
3476  0012 c75148        	ld	20808,a
3477                     ; 1383   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
3479  0015 c65148        	ld	a,20808
3480  0018 1a01          	or	a,(OFST+1,sp)
3481  001a c75148        	ld	20808,a
3482                     ; 1386   RTC->WPR = 0xFF; 
3484  001d 35ff5159      	mov	20825,#255
3485                     ; 1387 }
3488  0021 84            	pop	a
3489  0022 81            	ret
3522                     ; 1397 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
3522                     ; 1398 {
3523                     .text:	section	.text,new
3524  0000               _RTC_SetWakeUpCounter:
3528                     ; 1400   RTC->WPR = 0xCA;
3530  0000 35ca5159      	mov	20825,#202
3531                     ; 1401   RTC->WPR = 0x53;
3533  0004 35535159      	mov	20825,#83
3534                     ; 1405   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
3536  0008 9e            	ld	a,xh
3537  0009 c75154        	ld	20820,a
3538                     ; 1406   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
3540  000c 9f            	ld	a,xl
3541  000d c75155        	ld	20821,a
3542                     ; 1409   RTC->WPR = 0xFF; 
3544  0010 35ff5159      	mov	20825,#255
3545                     ; 1410 }
3548  0014 81            	ret
3581                     ; 1417 uint16_t RTC_GetWakeUpCounter(void)
3581                     ; 1418 {
3582                     .text:	section	.text,new
3583  0000               _RTC_GetWakeUpCounter:
3585  0000 89            	pushw	x
3586       00000002      OFST:	set	2
3589                     ; 1419   uint16_t tmpreg = 0;
3591                     ; 1422   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
3593  0001 c65154        	ld	a,20820
3594  0004 5f            	clrw	x
3595  0005 97            	ld	xl,a
3596  0006 4f            	clr	a
3597  0007 02            	rlwa	x,a
3598  0008 1f01          	ldw	(OFST-1,sp),x
3599                     ; 1423   tmpreg |= RTC->WUTRL;
3601  000a c65155        	ld	a,20821
3602  000d 5f            	clrw	x
3603  000e 97            	ld	xl,a
3604  000f 01            	rrwa	x,a
3605  0010 1a02          	or	a,(OFST+0,sp)
3606  0012 01            	rrwa	x,a
3607  0013 1a01          	or	a,(OFST-1,sp)
3608  0015 01            	rrwa	x,a
3609  0016 1f01          	ldw	(OFST-1,sp),x
3610                     ; 1426   return (uint16_t)tmpreg;
3612  0018 1e01          	ldw	x,(OFST-1,sp)
3615  001a 5b02          	addw	sp,#2
3616  001c 81            	ret
3669                     ; 1437 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
3669                     ; 1438 {
3670                     .text:	section	.text,new
3671  0000               _RTC_WakeUpCmd:
3673  0000 5203          	subw	sp,#3
3674       00000003      OFST:	set	3
3677                     ; 1439   ErrorStatus status = ERROR;
3679                     ; 1440   uint16_t wutwfcount = 0;
3681  0002 5f            	clrw	x
3682  0003 1f02          	ldw	(OFST-1,sp),x
3683                     ; 1443   assert_param(IS_FUNCTIONAL_STATE(NewState));
3685                     ; 1446   RTC->WPR = 0xCA;
3687  0005 35ca5159      	mov	20825,#202
3688                     ; 1447   RTC->WPR = 0x53;
3690  0009 35535159      	mov	20825,#83
3691                     ; 1449   if (NewState != DISABLE)
3693  000d 4d            	tnz	a
3694  000e 2711          	jreq	L1351
3695                     ; 1452     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
3697  0010 72145149      	bset	20809,#2
3698                     ; 1454     status = SUCCESS;
3700  0014 a601          	ld	a,#1
3701  0016 6b01          	ld	(OFST-2,sp),a
3703  0018               L3351:
3704                     ; 1479   RTC->WPR = 0xFF; 
3706  0018 35ff5159      	mov	20825,#255
3707                     ; 1482   return (ErrorStatus)status;
3709  001c 7b01          	ld	a,(OFST-2,sp)
3712  001e 5b03          	addw	sp,#3
3713  0020 81            	ret
3714  0021               L1351:
3715                     ; 1459     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3717  0021 72155149      	bres	20809,#2
3719  0025 2007          	jra	L7351
3720  0027               L5351:
3721                     ; 1464       wutwfcount++;
3723  0027 1e02          	ldw	x,(OFST-1,sp)
3724  0029 1c0001        	addw	x,#1
3725  002c 1f02          	ldw	(OFST-1,sp),x
3726  002e               L7351:
3727                     ; 1462     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
3729  002e c6514c        	ld	a,20812
3730  0031 a504          	bcp	a,#4
3731  0033 2607          	jrne	L3451
3733  0035 1e02          	ldw	x,(OFST-1,sp)
3734  0037 a3ffff        	cpw	x,#65535
3735  003a 26eb          	jrne	L5351
3736  003c               L3451:
3737                     ; 1468     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
3739  003c c6514c        	ld	a,20812
3740  003f a504          	bcp	a,#4
3741  0041 2604          	jrne	L5451
3742                     ; 1470       status = ERROR;
3744  0043 0f01          	clr	(OFST-2,sp)
3746  0045 20d1          	jra	L3351
3747  0047               L5451:
3748                     ; 1474       status = SUCCESS;
3750  0047 a601          	ld	a,#1
3751  0049 6b01          	ld	(OFST-2,sp),a
3752  004b 20cb          	jra	L3351
3842                     ; 1519 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
3842                     ; 1520                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
3842                     ; 1521 {
3843                     .text:	section	.text,new
3844  0000               _RTC_DayLightSavingConfig:
3846  0000 89            	pushw	x
3847       00000000      OFST:	set	0
3850                     ; 1523   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
3852                     ; 1524   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
3854                     ; 1527   RTC->WPR = 0xCA;
3856  0001 35ca5159      	mov	20825,#202
3857                     ; 1528   RTC->WPR = 0x53;
3859  0005 35535159      	mov	20825,#83
3860                     ; 1531   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
3862  0009 7215514a      	bres	20810,#2
3863                     ; 1534   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
3865  000d 9f            	ld	a,xl
3866  000e 1a01          	or	a,(OFST+1,sp)
3867  0010 ca514a        	or	a,20810
3868  0013 c7514a        	ld	20810,a
3869                     ; 1537   RTC->WPR = 0xFF; 
3871  0016 35ff5159      	mov	20825,#255
3872                     ; 1538 }
3875  001a 85            	popw	x
3876  001b 81            	ret
3901                     ; 1546 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
3901                     ; 1547 {
3902                     .text:	section	.text,new
3903  0000               _RTC_GetStoreOperation:
3907                     ; 1549   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
3909  0000 c6514a        	ld	a,20810
3910  0003 a404          	and	a,#4
3913  0005 81            	ret
4007                     ; 1584 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
4007                     ; 1585                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
4007                     ; 1586 {
4008                     .text:	section	.text,new
4009  0000               _RTC_OutputConfig:
4011  0000 89            	pushw	x
4012       00000000      OFST:	set	0
4015                     ; 1588   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
4017                     ; 1589   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
4019                     ; 1592   RTC->WPR = 0xCA;
4021  0001 35ca5159      	mov	20825,#202
4022                     ; 1593   RTC->WPR = 0x53;
4024  0005 35535159      	mov	20825,#83
4025                     ; 1596   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
4027  0009 c6514a        	ld	a,20810
4028  000c a48f          	and	a,#143
4029  000e c7514a        	ld	20810,a
4030                     ; 1599   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
4032  0011 9f            	ld	a,xl
4033  0012 1a01          	or	a,(OFST+1,sp)
4034  0014 ca514a        	or	a,20810
4035  0017 c7514a        	ld	20810,a
4036                     ; 1602   RTC->WPR = 0xFF; 
4038  001a 35ff5159      	mov	20825,#255
4039                     ; 1603 }
4042  001e 85            	popw	x
4043  001f 81            	ret
4132                     ; 1636 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
4132                     ; 1637                                    uint16_t RTC_ShiftSubFS)
4132                     ; 1638 {
4133                     .text:	section	.text,new
4134  0000               _RTC_SynchroShiftConfig:
4136  0000 88            	push	a
4137  0001 5203          	subw	sp,#3
4138       00000003      OFST:	set	3
4141                     ; 1639   uint8_t shiftrhreg = 0;
4143                     ; 1640   ErrorStatus status = ERROR;
4145                     ; 1641   uint16_t shpfcount = 0;
4147  0003 5f            	clrw	x
4148  0004 1f02          	ldw	(OFST-1,sp),x
4149                     ; 1644   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
4151                     ; 1645   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
4153                     ; 1648   RTC->WPR = 0xCA;
4155  0006 35ca5159      	mov	20825,#202
4156                     ; 1649   RTC->WPR = 0x53;
4158  000a 35535159      	mov	20825,#83
4159                     ; 1652   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
4161  000e c6514c        	ld	a,20812
4162  0011 a508          	bcp	a,#8
4163  0013 2717          	jreq	L7271
4165  0015 2007          	jra	L3371
4166  0017               L1371:
4167                     ; 1657       shpfcount++;
4169  0017 1e02          	ldw	x,(OFST-1,sp)
4170  0019 1c0001        	addw	x,#1
4171  001c 1f02          	ldw	(OFST-1,sp),x
4172  001e               L3371:
4173                     ; 1655     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
4175  001e c6514c        	ld	a,20812
4176  0021 a508          	bcp	a,#8
4177  0023 2707          	jreq	L7271
4179  0025 1e02          	ldw	x,(OFST-1,sp)
4180  0027 a3ffff        	cpw	x,#65535
4181  002a 26eb          	jrne	L1371
4182  002c               L7271:
4183                     ; 1662   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
4185  002c c6514c        	ld	a,20812
4186  002f a508          	bcp	a,#8
4187  0031 2616          	jrne	L1471
4188                     ; 1665     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
4190  0033 7b07          	ld	a,(OFST+4,sp)
4191  0035 1a04          	or	a,(OFST+1,sp)
4192  0037 6b01          	ld	(OFST-2,sp),a
4193                     ; 1666     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
4195  0039 7b01          	ld	a,(OFST-2,sp)
4196  003b c7515a        	ld	20826,a
4197                     ; 1667     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
4199  003e 7b08          	ld	a,(OFST+5,sp)
4200  0040 c7515b        	ld	20827,a
4201                     ; 1669     status = SUCCESS;
4203  0043 a601          	ld	a,#1
4204  0045 6b01          	ld	(OFST-2,sp),a
4206  0047 2002          	jra	L3471
4207  0049               L1471:
4208                     ; 1673     status = ERROR;
4210  0049 0f01          	clr	(OFST-2,sp)
4211  004b               L3471:
4212                     ; 1677   RTC->WPR = 0xFF; 
4214  004b 35ff5159      	mov	20825,#255
4215                     ; 1679   return (ErrorStatus)(status);
4217  004f 7b01          	ld	a,(OFST-2,sp)
4220  0051 5b04          	addw	sp,#4
4221  0053 81            	ret
4347                     ; 1715 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
4347                     ; 1716                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
4347                     ; 1717                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
4347                     ; 1718 {
4348                     .text:	section	.text,new
4349  0000               _RTC_SmoothCalibConfig:
4351  0000 89            	pushw	x
4352  0001 5203          	subw	sp,#3
4353       00000003      OFST:	set	3
4356                     ; 1719   ErrorStatus status = ERROR;
4358                     ; 1720   uint16_t recalpfcount = 0;
4360  0003 5f            	clrw	x
4361  0004 1f02          	ldw	(OFST-1,sp),x
4362                     ; 1723   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
4364                     ; 1724   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
4366                     ; 1725   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
4368                     ; 1728   RTC->WPR = 0xCA;
4370  0006 35ca5159      	mov	20825,#202
4371                     ; 1729   RTC->WPR = 0x53;
4373  000a 35535159      	mov	20825,#83
4374                     ; 1732   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
4376  000e c6514c        	ld	a,20812
4377  0011 a502          	bcp	a,#2
4378  0013 2717          	jreq	L1202
4380  0015 2007          	jra	L5202
4381  0017               L3202:
4382                     ; 1737       recalpfcount++;
4384  0017 1e02          	ldw	x,(OFST-1,sp)
4385  0019 1c0001        	addw	x,#1
4386  001c 1f02          	ldw	(OFST-1,sp),x
4387  001e               L5202:
4388                     ; 1735     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
4390  001e c6514c        	ld	a,20812
4391  0021 a502          	bcp	a,#2
4392  0023 2707          	jreq	L1202
4394  0025 1e02          	ldw	x,(OFST-1,sp)
4395  0027 a3ffff        	cpw	x,#65535
4396  002a 26eb          	jrne	L3202
4397  002c               L1202:
4398                     ; 1743   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
4400  002c c6514c        	ld	a,20812
4401  002f a502          	bcp	a,#2
4402  0031 2614          	jrne	L3302
4403                     ; 1746     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | \
4403                     ; 1747                            (uint8_t)RTC_SmoothCalibPlusPulses) | \
4403                     ; 1748                            (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
4405  0033 7b04          	ld	a,(OFST+1,sp)
4406  0035 1a05          	or	a,(OFST+2,sp)
4407  0037 1a08          	or	a,(OFST+5,sp)
4408  0039 c7516a        	ld	20842,a
4409                     ; 1749     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
4411  003c 7b09          	ld	a,(OFST+6,sp)
4412  003e c7516b        	ld	20843,a
4413                     ; 1751     status = SUCCESS;
4415  0041 a601          	ld	a,#1
4416  0043 6b01          	ld	(OFST-2,sp),a
4418  0045 2002          	jra	L5302
4419  0047               L3302:
4420                     ; 1755     status = ERROR;
4422  0047 0f01          	clr	(OFST-2,sp)
4423  0049               L5302:
4424                     ; 1759   RTC->WPR = 0xFF; 
4426  0049 35ff5159      	mov	20825,#255
4427                     ; 1761   return (ErrorStatus)(status);
4429  004d 7b01          	ld	a,(OFST-2,sp)
4432  004f 5b05          	addw	sp,#5
4433  0051 81            	ret
4491                     ; 1787 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
4491                     ; 1788 {
4492                     .text:	section	.text,new
4493  0000               _RTC_CalibOutputConfig:
4497                     ; 1790   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
4499                     ; 1793   RTC->WPR = 0xCA;
4501  0000 35ca5159      	mov	20825,#202
4502                     ; 1794   RTC->WPR = 0x53;
4504  0004 35535159      	mov	20825,#83
4505                     ; 1796   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
4507  0008 4d            	tnz	a
4508  0009 2706          	jreq	L5602
4509                     ; 1799     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
4511  000b 7216514a      	bset	20810,#3
4513  000f 2004          	jra	L7602
4514  0011               L5602:
4515                     ; 1804     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
4517  0011 7217514a      	bres	20810,#3
4518  0015               L7602:
4519                     ; 1808   RTC->WPR = 0xFF; 
4521  0015 35ff5159      	mov	20825,#255
4522                     ; 1809 }
4525  0019 81            	ret
4560                     ; 1817 void RTC_CalibOutputCmd(FunctionalState NewState)
4560                     ; 1818 {
4561                     .text:	section	.text,new
4562  0000               _RTC_CalibOutputCmd:
4566                     ; 1820   assert_param(IS_FUNCTIONAL_STATE(NewState));
4568                     ; 1823   RTC->WPR = 0xCA;
4570  0000 35ca5159      	mov	20825,#202
4571                     ; 1824   RTC->WPR = 0x53;
4573  0004 35535159      	mov	20825,#83
4574                     ; 1826   if (NewState != DISABLE)
4576  0008 4d            	tnz	a
4577  0009 2706          	jreq	L7012
4578                     ; 1829     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
4580  000b 721e514a      	bset	20810,#7
4582  000f 2004          	jra	L1112
4583  0011               L7012:
4584                     ; 1834     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
4586  0011 721f514a      	bres	20810,#7
4587  0015               L1112:
4588                     ; 1838   RTC->WPR = 0xFF; 
4590  0015 35ff5159      	mov	20825,#255
4591                     ; 1839 }
4594  0019 81            	ret
4689                     ; 1868 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
4689                     ; 1869                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
4689                     ; 1870 {
4690                     .text:	section	.text,new
4691  0000               _RTC_TamperLevelConfig:
4693  0000 89            	pushw	x
4694       00000000      OFST:	set	0
4697                     ; 1872   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4699                     ; 1873   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
4701                     ; 1876   RTC->WPR = 0xCA;
4703  0001 35ca5159      	mov	20825,#202
4704                     ; 1877   RTC->WPR = 0x53;
4706  0005 35535159      	mov	20825,#83
4707                     ; 1879   if (RTC_TamperLevel != RTC_TamperLevel_Low)
4709  0009 9f            	ld	a,xl
4710  000a 4d            	tnz	a
4711  000b 270a          	jreq	L7512
4712                     ; 1882     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
4714  000d 9e            	ld	a,xh
4715  000e 48            	sll	a
4716  000f ca516c        	or	a,20844
4717  0012 c7516c        	ld	20844,a
4719  0015 200a          	jra	L1612
4720  0017               L7512:
4721                     ; 1887     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
4723  0017 7b01          	ld	a,(OFST+1,sp)
4724  0019 48            	sll	a
4725  001a 43            	cpl	a
4726  001b c4516c        	and	a,20844
4727  001e c7516c        	ld	20844,a
4728  0021               L1612:
4729                     ; 1891   RTC->WPR = 0xFF; 
4731  0021 35ff5159      	mov	20825,#255
4732                     ; 1892 }
4735  0025 85            	popw	x
4736  0026 81            	ret
4810                     ; 1900 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
4810                     ; 1901 {
4811                     .text:	section	.text,new
4812  0000               _RTC_TamperFilterConfig:
4814  0000 88            	push	a
4815       00000000      OFST:	set	0
4818                     ; 1904   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
4820                     ; 1907   RTC->WPR = 0xCA;
4822  0001 35ca5159      	mov	20825,#202
4823                     ; 1908   RTC->WPR = 0x53;
4825  0005 35535159      	mov	20825,#83
4826                     ; 1911   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
4828  0009 c6516d        	ld	a,20845
4829  000c a4e7          	and	a,#231
4830  000e c7516d        	ld	20845,a
4831                     ; 1914   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
4833  0011 c6516d        	ld	a,20845
4834  0014 1a01          	or	a,(OFST+1,sp)
4835  0016 c7516d        	ld	20845,a
4836                     ; 1917   RTC->WPR = 0xFF; 
4838  0019 35ff5159      	mov	20825,#255
4839                     ; 1919 }
4842  001d 84            	pop	a
4843  001e 81            	ret
4956                     ; 1928 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
4956                     ; 1929 {
4957                     .text:	section	.text,new
4958  0000               _RTC_TamperSamplingFreqConfig:
4960  0000 88            	push	a
4961       00000000      OFST:	set	0
4964                     ; 1931   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
4966                     ; 1934   RTC->WPR = 0xCA;
4968  0001 35ca5159      	mov	20825,#202
4969                     ; 1935   RTC->WPR = 0x53;
4971  0005 35535159      	mov	20825,#83
4972                     ; 1938   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
4974  0009 c6516d        	ld	a,20845
4975  000c a4f8          	and	a,#248
4976  000e c7516d        	ld	20845,a
4977                     ; 1941   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
4979  0011 c6516d        	ld	a,20845
4980  0014 1a01          	or	a,(OFST+1,sp)
4981  0016 c7516d        	ld	20845,a
4982                     ; 1944   RTC->WPR = 0xFF; 
4984  0019 35ff5159      	mov	20825,#255
4985                     ; 1945 }
4988  001d 84            	pop	a
4989  001e 81            	ret
5072                     ; 1955 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
5072                     ; 1956 {
5073                     .text:	section	.text,new
5074  0000               _RTC_TamperPinsPrechargeDuration:
5076  0000 88            	push	a
5077       00000000      OFST:	set	0
5080                     ; 1958   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
5082                     ; 1961   RTC->WPR = 0xCA;
5084  0001 35ca5159      	mov	20825,#202
5085                     ; 1962   RTC->WPR = 0x53;
5087  0005 35535159      	mov	20825,#83
5088                     ; 1965   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
5090  0009 c6516d        	ld	a,20845
5091  000c a41f          	and	a,#31
5092  000e c7516d        	ld	20845,a
5093                     ; 1968   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
5095  0011 c6516d        	ld	a,20845
5096  0014 1a01          	or	a,(OFST+1,sp)
5097  0016 c7516d        	ld	20845,a
5098                     ; 1971   RTC->WPR = 0xFF; 
5100  0019 35ff5159      	mov	20825,#255
5101                     ; 1972 }
5104  001d 84            	pop	a
5105  001e 81            	ret
5150                     ; 1984 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
5150                     ; 1985                    FunctionalState NewState)
5150                     ; 1986 {
5151                     .text:	section	.text,new
5152  0000               _RTC_TamperCmd:
5154  0000 89            	pushw	x
5155       00000000      OFST:	set	0
5158                     ; 1989   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
5160                     ; 1990   assert_param(IS_FUNCTIONAL_STATE(NewState));
5162                     ; 1993   RTC->WPR = 0xCA;
5164  0001 35ca5159      	mov	20825,#202
5165                     ; 1994   RTC->WPR = 0x53;
5167  0005 35535159      	mov	20825,#83
5168                     ; 1997   if (NewState != DISABLE)
5170  0009 9f            	ld	a,xl
5171  000a 4d            	tnz	a
5172  000b 2709          	jreq	L5332
5173                     ; 2000     RTC->TCR1 |= (uint8_t)RTC_Tamper;
5175  000d 9e            	ld	a,xh
5176  000e ca516c        	or	a,20844
5177  0011 c7516c        	ld	20844,a
5179  0014 2009          	jra	L7332
5180  0016               L5332:
5181                     ; 2005     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
5183  0016 7b01          	ld	a,(OFST+1,sp)
5184  0018 43            	cpl	a
5185  0019 c4516c        	and	a,20844
5186  001c c7516c        	ld	20844,a
5187  001f               L7332:
5188                     ; 2010   RTC->WPR = 0xFF; 
5190  001f 35ff5159      	mov	20825,#255
5191                     ; 2011 }
5194  0023 85            	popw	x
5195  0024 81            	ret
5267                     ; 2055 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
5267                     ; 2056 {
5268                     .text:	section	.text,new
5269  0000               _RTC_ITConfig:
5271  0000 89            	pushw	x
5272       00000000      OFST:	set	0
5275                     ; 2058   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
5277                     ; 2059   assert_param(IS_FUNCTIONAL_STATE(NewState));
5279                     ; 2062   RTC->WPR = 0xCA;
5281  0001 35ca5159      	mov	20825,#202
5282                     ; 2063   RTC->WPR = 0x53;
5284  0005 35535159      	mov	20825,#83
5285                     ; 2065   if (NewState != DISABLE)
5287  0009 0d05          	tnz	(OFST+5,sp)
5288  000b 2715          	jreq	L5732
5289                     ; 2068     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5291  000d 9f            	ld	a,xl
5292  000e a4f0          	and	a,#240
5293  0010 ca5149        	or	a,20809
5294  0013 c75149        	ld	20809,a
5295                     ; 2069     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
5297  0016 7b02          	ld	a,(OFST+2,sp)
5298  0018 a401          	and	a,#1
5299  001a ca516c        	or	a,20844
5300  001d c7516c        	ld	20844,a
5302  0020 2016          	jra	L7732
5303  0022               L5732:
5304                     ; 2074     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5306  0022 7b02          	ld	a,(OFST+2,sp)
5307  0024 a4f0          	and	a,#240
5308  0026 43            	cpl	a
5309  0027 c45149        	and	a,20809
5310  002a c75149        	ld	20809,a
5311                     ; 2075     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
5313  002d 7b02          	ld	a,(OFST+2,sp)
5314  002f a401          	and	a,#1
5315  0031 43            	cpl	a
5316  0032 c4516c        	and	a,20844
5317  0035 c7516c        	ld	20844,a
5318  0038               L7732:
5319                     ; 2079   RTC->WPR = 0xFF; 
5321  0038 35ff5159      	mov	20825,#255
5322                     ; 2080 }
5325  003c 85            	popw	x
5326  003d 81            	ret
5496                     ; 2087 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
5496                     ; 2088 {
5497                     .text:	section	.text,new
5498  0000               _RTC_GetFlagStatus:
5500  0000 89            	pushw	x
5501  0001 5203          	subw	sp,#3
5502       00000003      OFST:	set	3
5505                     ; 2089   FlagStatus flagstatus = RESET;
5507                     ; 2090   uint16_t tmpreg1 = 0;
5509                     ; 2091   uint16_t tmpreg2 = 0;
5511                     ; 2094   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
5513                     ; 2097   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
5515  0003 c6514c        	ld	a,20812
5516  0006 5f            	clrw	x
5517  0007 97            	ld	xl,a
5518  0008 4f            	clr	a
5519  0009 02            	rlwa	x,a
5520  000a 1f02          	ldw	(OFST-1,sp),x
5521                     ; 2098   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
5523  000c c6514d        	ld	a,20813
5524  000f 5f            	clrw	x
5525  0010 97            	ld	xl,a
5526  0011 01            	rrwa	x,a
5527  0012 1a03          	or	a,(OFST+0,sp)
5528  0014 01            	rrwa	x,a
5529  0015 1a02          	or	a,(OFST-1,sp)
5530  0017 01            	rrwa	x,a
5531  0018 1f02          	ldw	(OFST-1,sp),x
5532                     ; 2101   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
5534  001a 1e02          	ldw	x,(OFST-1,sp)
5535  001c 01            	rrwa	x,a
5536  001d 1405          	and	a,(OFST+2,sp)
5537  001f 01            	rrwa	x,a
5538  0020 1404          	and	a,(OFST+1,sp)
5539  0022 01            	rrwa	x,a
5540  0023 a30000        	cpw	x,#0
5541  0026 2706          	jreq	L3742
5542                     ; 2103     flagstatus = SET;
5544  0028 a601          	ld	a,#1
5545  002a 6b01          	ld	(OFST-2,sp),a
5547  002c 2002          	jra	L5742
5548  002e               L3742:
5549                     ; 2107     flagstatus = RESET;
5551  002e 0f01          	clr	(OFST-2,sp)
5552  0030               L5742:
5553                     ; 2109   return (FlagStatus)flagstatus;
5555  0030 7b01          	ld	a,(OFST-2,sp)
5558  0032 5b05          	addw	sp,#5
5559  0034 81            	ret
5594                     ; 2119 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
5594                     ; 2120 {
5595                     .text:	section	.text,new
5596  0000               _RTC_ClearFlag:
5598  0000 89            	pushw	x
5599       00000000      OFST:	set	0
5602                     ; 2122   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
5604                     ; 2125   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
5606  0001 9f            	ld	a,xl
5607  0002 43            	cpl	a
5608  0003 c7514d        	ld	20813,a
5609                     ; 2126   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
5611  0006 7b01          	ld	a,(OFST+1,sp)
5612  0008 43            	cpl	a
5613  0009 a47f          	and	a,#127
5614  000b c7514c        	ld	20812,a
5615                     ; 2127 }
5618  000e 85            	popw	x
5619  000f 81            	ret
5679                     ; 2135 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
5679                     ; 2136 {
5680                     .text:	section	.text,new
5681  0000               _RTC_GetITStatus:
5683  0000 89            	pushw	x
5684  0001 89            	pushw	x
5685       00000002      OFST:	set	2
5688                     ; 2137   ITStatus itstatus = RESET;
5690                     ; 2138   uint8_t enablestatus = 0, tmpreg = 0;
5694                     ; 2141   assert_param(IS_RTC_GET_IT(RTC_IT));
5696                     ; 2144   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
5698  0002 9f            	ld	a,xl
5699  0003 c45149        	and	a,20809
5700  0006 6b01          	ld	(OFST-1,sp),a
5701                     ; 2147   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
5703  0008 1e03          	ldw	x,(OFST+1,sp)
5704  000a 54            	srlw	x
5705  000b 54            	srlw	x
5706  000c 54            	srlw	x
5707  000d 54            	srlw	x
5708  000e 9f            	ld	a,xl
5709  000f c4514d        	and	a,20813
5710  0012 6b02          	ld	(OFST+0,sp),a
5711                     ; 2150   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
5713  0014 0d01          	tnz	(OFST-1,sp)
5714  0016 270a          	jreq	L3452
5716  0018 0d02          	tnz	(OFST+0,sp)
5717  001a 2706          	jreq	L3452
5718                     ; 2152     itstatus = SET;
5720  001c a601          	ld	a,#1
5721  001e 6b02          	ld	(OFST+0,sp),a
5723  0020 2002          	jra	L5452
5724  0022               L3452:
5725                     ; 2156     itstatus = RESET;
5727  0022 0f02          	clr	(OFST+0,sp)
5728  0024               L5452:
5729                     ; 2159   return (ITStatus)itstatus;
5731  0024 7b02          	ld	a,(OFST+0,sp)
5734  0026 5b04          	addw	sp,#4
5735  0028 81            	ret
5771                     ; 2169 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
5771                     ; 2170 {
5772                     .text:	section	.text,new
5773  0000               _RTC_ClearITPendingBit:
5777                     ; 2172   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
5779                     ; 2175   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
5781  0000 54            	srlw	x
5782  0001 54            	srlw	x
5783  0002 54            	srlw	x
5784  0003 54            	srlw	x
5785  0004 9f            	ld	a,xl
5786  0005 43            	cpl	a
5787  0006 c7514d        	ld	20813,a
5788                     ; 2176 }
5791  0009 81            	ret
5830                     ; 2199 static uint8_t ByteToBcd2(uint8_t Value)
5830                     ; 2200 {
5831                     .text:	section	.text,new
5832  0000               L3_ByteToBcd2:
5834  0000 88            	push	a
5835  0001 88            	push	a
5836       00000001      OFST:	set	1
5839                     ; 2201   uint8_t bcdhigh = 0;
5841  0002 0f01          	clr	(OFST+0,sp)
5843  0004 2008          	jra	L7062
5844  0006               L3062:
5845                     ; 2205     bcdhigh++;
5847  0006 0c01          	inc	(OFST+0,sp)
5848                     ; 2206     Value -= 10;
5850  0008 7b02          	ld	a,(OFST+1,sp)
5851  000a a00a          	sub	a,#10
5852  000c 6b02          	ld	(OFST+1,sp),a
5853  000e               L7062:
5854                     ; 2203   while (Value >= 10)
5856  000e 7b02          	ld	a,(OFST+1,sp)
5857  0010 a10a          	cp	a,#10
5858  0012 24f2          	jruge	L3062
5859                     ; 2209   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
5861  0014 7b01          	ld	a,(OFST+0,sp)
5862  0016 97            	ld	xl,a
5863  0017 a610          	ld	a,#16
5864  0019 42            	mul	x,a
5865  001a 9f            	ld	a,xl
5866  001b 1a02          	or	a,(OFST+1,sp)
5869  001d 85            	popw	x
5870  001e 81            	ret
5909                     ; 2217 static uint8_t Bcd2ToByte(uint8_t Value)
5909                     ; 2218 {
5910                     .text:	section	.text,new
5911  0000               L5_Bcd2ToByte:
5913  0000 88            	push	a
5914  0001 88            	push	a
5915       00000001      OFST:	set	1
5918                     ; 2219   uint8_t tmp = 0;
5920                     ; 2221   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
5922  0002 a4f0          	and	a,#240
5923  0004 4e            	swap	a
5924  0005 a40f          	and	a,#15
5925  0007 97            	ld	xl,a
5926  0008 a60a          	ld	a,#10
5927  000a 42            	mul	x,a
5928  000b 9f            	ld	a,xl
5929  000c 6b01          	ld	(OFST+0,sp),a
5930                     ; 2223   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
5932  000e 7b02          	ld	a,(OFST+1,sp)
5933  0010 a40f          	and	a,#15
5934  0012 1b01          	add	a,(OFST+0,sp)
5937  0014 85            	popw	x
5938  0015 81            	ret
5951                     	xdef	_RTC_ClearITPendingBit
5952                     	xdef	_RTC_GetITStatus
5953                     	xdef	_RTC_ClearFlag
5954                     	xdef	_RTC_GetFlagStatus
5955                     	xdef	_RTC_ITConfig
5956                     	xdef	_RTC_TamperCmd
5957                     	xdef	_RTC_TamperPinsPrechargeDuration
5958                     	xdef	_RTC_TamperSamplingFreqConfig
5959                     	xdef	_RTC_TamperFilterConfig
5960                     	xdef	_RTC_TamperLevelConfig
5961                     	xdef	_RTC_CalibOutputCmd
5962                     	xdef	_RTC_CalibOutputConfig
5963                     	xdef	_RTC_SmoothCalibConfig
5964                     	xdef	_RTC_SynchroShiftConfig
5965                     	xdef	_RTC_OutputConfig
5966                     	xdef	_RTC_GetStoreOperation
5967                     	xdef	_RTC_DayLightSavingConfig
5968                     	xdef	_RTC_WakeUpCmd
5969                     	xdef	_RTC_GetWakeUpCounter
5970                     	xdef	_RTC_SetWakeUpCounter
5971                     	xdef	_RTC_WakeUpClockConfig
5972                     	xdef	_RTC_AlarmSubSecondConfig
5973                     	xdef	_RTC_AlarmCmd
5974                     	xdef	_RTC_GetAlarm
5975                     	xdef	_RTC_AlarmStructInit
5976                     	xdef	_RTC_SetAlarm
5977                     	xdef	_RTC_GetDate
5978                     	xdef	_RTC_DateStructInit
5979                     	xdef	_RTC_SetDate
5980                     	xdef	_RTC_GetSubSecond
5981                     	xdef	_RTC_GetTime
5982                     	xdef	_RTC_TimeStructInit
5983                     	xdef	_RTC_SetTime
5984                     	xdef	_RTC_BypassShadowCmd
5985                     	xdef	_RTC_RatioCmd
5986                     	xdef	_RTC_WaitForSynchro
5987                     	xdef	_RTC_ExitInitMode
5988                     	xdef	_RTC_EnterInitMode
5989                     	xdef	_RTC_WriteProtectionCmd
5990                     	xdef	_RTC_StructInit
5991                     	xdef	_RTC_Init
5992                     	xdef	_RTC_DeInit
6011                     	end
