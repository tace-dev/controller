   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  16                     .const:	section	.text
  17  0000               _HSIDivFactor:
  18  0000 01            	dc.b	1
  19  0001 02            	dc.b	2
  20  0002 04            	dc.b	4
  21  0003 08            	dc.b	8
  22  0004               _CLKPrescTable:
  23  0004 01            	dc.b	1
  24  0005 02            	dc.b	2
  25  0006 04            	dc.b	4
  26  0007 08            	dc.b	8
  27  0008 0a            	dc.b	10
  28  0009 10            	dc.b	16
  29  000a 14            	dc.b	20
  30  000b 28            	dc.b	40
  59                     ; 66 void CLK_DeInit(void)
  59                     ; 67 {
  61                     	switch	.text
  62  0000               _CLK_DeInit:
  66                     ; 69     CLK->ICKR = CLK_ICKR_RESET_VALUE;
  68  0000 350150c0      	mov	20672,#1
  69                     ; 70     CLK->ECKR = CLK_ECKR_RESET_VALUE;
  71  0004 725f50c1      	clr	20673
  72                     ; 71     CLK->SWR  = CLK_SWR_RESET_VALUE;
  74  0008 35e150c4      	mov	20676,#225
  75                     ; 72     CLK->SWCR = CLK_SWCR_RESET_VALUE;
  77  000c 725f50c5      	clr	20677
  78                     ; 73     CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  80  0010 351850c6      	mov	20678,#24
  81                     ; 74     CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  83  0014 35ff50c7      	mov	20679,#255
  84                     ; 75     CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  86  0018 35ff50ca      	mov	20682,#255
  87                     ; 76     CLK->CSSR = CLK_CSSR_RESET_VALUE;
  89  001c 725f50c8      	clr	20680
  90                     ; 77     CLK->CCOR = CLK_CCOR_RESET_VALUE;
  92  0020 725f50c9      	clr	20681
  94  0024               L52:
  95                     ; 78     while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
  97  0024 c650c9        	ld	a,20681
  98  0027 a501          	bcp	a,#1
  99  0029 26f9          	jrne	L52
 100                     ; 80     CLK->CCOR = CLK_CCOR_RESET_VALUE;
 102  002b 725f50c9      	clr	20681
 103                     ; 81     CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 105  002f 725f50cc      	clr	20684
 106                     ; 82     CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 108  0033 725f50cd      	clr	20685
 109                     ; 84 }
 112  0037 81            	ret
 168                     ; 95 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 168                     ; 96 {
 169                     	switch	.text
 170  0038               _CLK_FastHaltWakeUpCmd:
 174                     ; 99     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 176                     ; 101     if (NewState != DISABLE)
 178  0038 4d            	tnz	a
 179  0039 2706          	jreq	L75
 180                     ; 104         CLK->ICKR |= CLK_ICKR_FHWU;
 182  003b 721450c0      	bset	20672,#2
 184  003f 2004          	jra	L16
 185  0041               L75:
 186                     ; 109         CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 188  0041 721550c0      	bres	20672,#2
 189  0045               L16:
 190                     ; 112 }
 193  0045 81            	ret
 228                     ; 119 void CLK_HSECmd(FunctionalState NewState)
 228                     ; 120 {
 229                     	switch	.text
 230  0046               _CLK_HSECmd:
 234                     ; 123     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 236                     ; 125     if (NewState != DISABLE)
 238  0046 4d            	tnz	a
 239  0047 2706          	jreq	L101
 240                     ; 128         CLK->ECKR |= CLK_ECKR_HSEEN;
 242  0049 721050c1      	bset	20673,#0
 244  004d 2004          	jra	L301
 245  004f               L101:
 246                     ; 133         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 248  004f 721150c1      	bres	20673,#0
 249  0053               L301:
 250                     ; 136 }
 253  0053 81            	ret
 288                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 288                     ; 144 {
 289                     	switch	.text
 290  0054               _CLK_HSICmd:
 294                     ; 147     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 296                     ; 149     if (NewState != DISABLE)
 298  0054 4d            	tnz	a
 299  0055 2706          	jreq	L321
 300                     ; 152         CLK->ICKR |= CLK_ICKR_HSIEN;
 302  0057 721050c0      	bset	20672,#0
 304  005b 2004          	jra	L521
 305  005d               L321:
 306                     ; 157         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 308  005d 721150c0      	bres	20672,#0
 309  0061               L521:
 310                     ; 160 }
 313  0061 81            	ret
 348                     ; 167 void CLK_LSICmd(FunctionalState NewState)
 348                     ; 168 {
 349                     	switch	.text
 350  0062               _CLK_LSICmd:
 354                     ; 171     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 356                     ; 173     if (NewState != DISABLE)
 358  0062 4d            	tnz	a
 359  0063 2706          	jreq	L541
 360                     ; 176         CLK->ICKR |= CLK_ICKR_LSIEN;
 362  0065 721650c0      	bset	20672,#3
 364  0069 2004          	jra	L741
 365  006b               L541:
 366                     ; 181         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 368  006b 721750c0      	bres	20672,#3
 369  006f               L741:
 370                     ; 184 }
 373  006f 81            	ret
 408                     ; 192 void CLK_CCOCmd(FunctionalState NewState)
 408                     ; 193 {
 409                     	switch	.text
 410  0070               _CLK_CCOCmd:
 414                     ; 196     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 416                     ; 198     if (NewState != DISABLE)
 418  0070 4d            	tnz	a
 419  0071 2706          	jreq	L761
 420                     ; 201         CLK->CCOR |= CLK_CCOR_CCOEN;
 422  0073 721050c9      	bset	20681,#0
 424  0077 2004          	jra	L171
 425  0079               L761:
 426                     ; 206         CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 428  0079 721150c9      	bres	20681,#0
 429  007d               L171:
 430                     ; 209 }
 433  007d 81            	ret
 468                     ; 218 void CLK_ClockSwitchCmd(FunctionalState NewState)
 468                     ; 219 {
 469                     	switch	.text
 470  007e               _CLK_ClockSwitchCmd:
 474                     ; 222     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 476                     ; 224     if (NewState != DISABLE )
 478  007e 4d            	tnz	a
 479  007f 2706          	jreq	L112
 480                     ; 227         CLK->SWCR |= CLK_SWCR_SWEN;
 482  0081 721250c5      	bset	20677,#1
 484  0085 2004          	jra	L312
 485  0087               L112:
 486                     ; 232         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 488  0087 721350c5      	bres	20677,#1
 489  008b               L312:
 490                     ; 235 }
 493  008b 81            	ret
 529                     ; 245 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 529                     ; 246 {
 530                     	switch	.text
 531  008c               _CLK_SlowActiveHaltWakeUpCmd:
 535                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 537                     ; 251     if (NewState != DISABLE)
 539  008c 4d            	tnz	a
 540  008d 2706          	jreq	L332
 541                     ; 254         CLK->ICKR |= CLK_ICKR_SWUAH;
 543  008f 721a50c0      	bset	20672,#5
 545  0093 2004          	jra	L532
 546  0095               L332:
 547                     ; 259         CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 549  0095 721b50c0      	bres	20672,#5
 550  0099               L532:
 551                     ; 262 }
 554  0099 81            	ret
 713                     ; 272 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 713                     ; 273 {
 714                     	switch	.text
 715  009a               _CLK_PeripheralClockConfig:
 717  009a 89            	pushw	x
 718       00000000      OFST:	set	0
 721                     ; 276     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 723                     ; 277     assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 725                     ; 279     if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 727  009b 9e            	ld	a,xh
 728  009c a510          	bcp	a,#16
 729  009e 2633          	jrne	L123
 730                     ; 281         if (NewState != DISABLE)
 732  00a0 0d02          	tnz	(OFST+2,sp)
 733  00a2 2717          	jreq	L323
 734                     ; 284             CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 736  00a4 7b01          	ld	a,(OFST+1,sp)
 737  00a6 a40f          	and	a,#15
 738  00a8 5f            	clrw	x
 739  00a9 97            	ld	xl,a
 740  00aa a601          	ld	a,#1
 741  00ac 5d            	tnzw	x
 742  00ad 2704          	jreq	L62
 743  00af               L03:
 744  00af 48            	sll	a
 745  00b0 5a            	decw	x
 746  00b1 26fc          	jrne	L03
 747  00b3               L62:
 748  00b3 ca50c7        	or	a,20679
 749  00b6 c750c7        	ld	20679,a
 751  00b9 2049          	jra	L723
 752  00bb               L323:
 753                     ; 289             CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 755  00bb 7b01          	ld	a,(OFST+1,sp)
 756  00bd a40f          	and	a,#15
 757  00bf 5f            	clrw	x
 758  00c0 97            	ld	xl,a
 759  00c1 a601          	ld	a,#1
 760  00c3 5d            	tnzw	x
 761  00c4 2704          	jreq	L23
 762  00c6               L43:
 763  00c6 48            	sll	a
 764  00c7 5a            	decw	x
 765  00c8 26fc          	jrne	L43
 766  00ca               L23:
 767  00ca 43            	cpl	a
 768  00cb c450c7        	and	a,20679
 769  00ce c750c7        	ld	20679,a
 770  00d1 2031          	jra	L723
 771  00d3               L123:
 772                     ; 294         if (NewState != DISABLE)
 774  00d3 0d02          	tnz	(OFST+2,sp)
 775  00d5 2717          	jreq	L133
 776                     ; 297             CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 778  00d7 7b01          	ld	a,(OFST+1,sp)
 779  00d9 a40f          	and	a,#15
 780  00db 5f            	clrw	x
 781  00dc 97            	ld	xl,a
 782  00dd a601          	ld	a,#1
 783  00df 5d            	tnzw	x
 784  00e0 2704          	jreq	L63
 785  00e2               L04:
 786  00e2 48            	sll	a
 787  00e3 5a            	decw	x
 788  00e4 26fc          	jrne	L04
 789  00e6               L63:
 790  00e6 ca50ca        	or	a,20682
 791  00e9 c750ca        	ld	20682,a
 793  00ec 2016          	jra	L723
 794  00ee               L133:
 795                     ; 302             CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 797  00ee 7b01          	ld	a,(OFST+1,sp)
 798  00f0 a40f          	and	a,#15
 799  00f2 5f            	clrw	x
 800  00f3 97            	ld	xl,a
 801  00f4 a601          	ld	a,#1
 802  00f6 5d            	tnzw	x
 803  00f7 2704          	jreq	L24
 804  00f9               L44:
 805  00f9 48            	sll	a
 806  00fa 5a            	decw	x
 807  00fb 26fc          	jrne	L44
 808  00fd               L24:
 809  00fd 43            	cpl	a
 810  00fe c450ca        	and	a,20682
 811  0101 c750ca        	ld	20682,a
 812  0104               L723:
 813                     ; 306 }
 816  0104 85            	popw	x
 817  0105 81            	ret
1005                     ; 319 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
1005                     ; 320 {
1006                     	switch	.text
1007  0106               _CLK_ClockSwitchConfig:
1009  0106 89            	pushw	x
1010  0107 5204          	subw	sp,#4
1011       00000004      OFST:	set	4
1014                     ; 323     uint16_t DownCounter = CLK_TIMEOUT;
1016  0109 ae0491        	ldw	x,#1169
1017  010c 1f03          	ldw	(OFST-1,sp),x
1019                     ; 324     ErrorStatus Swif = ERROR;
1021                     ; 327     assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1023                     ; 328     assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1025                     ; 329     assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1027                     ; 330     assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1029                     ; 333     clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1031  010e c650c3        	ld	a,20675
1032  0111 6b01          	ld	(OFST-3,sp),a
1034                     ; 336     if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1036  0113 7b05          	ld	a,(OFST+1,sp)
1037  0115 a101          	cp	a,#1
1038  0117 2639          	jrne	L544
1039                     ; 340         CLK->SWCR |= CLK_SWCR_SWEN;
1041  0119 721250c5      	bset	20677,#1
1042                     ; 343         if (ITState != DISABLE)
1044  011d 0d09          	tnz	(OFST+5,sp)
1045  011f 2706          	jreq	L744
1046                     ; 345             CLK->SWCR |= CLK_SWCR_SWIEN;
1048  0121 721450c5      	bset	20677,#2
1050  0125 2004          	jra	L154
1051  0127               L744:
1052                     ; 349             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1054  0127 721550c5      	bres	20677,#2
1055  012b               L154:
1056                     ; 353         CLK->SWR = (uint8_t)CLK_NewClock;
1058  012b 7b06          	ld	a,(OFST+2,sp)
1059  012d c750c4        	ld	20676,a
1061  0130 2007          	jra	L754
1062  0132               L354:
1063                     ; 357             DownCounter--;
1065  0132 1e03          	ldw	x,(OFST-1,sp)
1066  0134 1d0001        	subw	x,#1
1067  0137 1f03          	ldw	(OFST-1,sp),x
1069  0139               L754:
1070                     ; 355         while ((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1072  0139 c650c5        	ld	a,20677
1073  013c a501          	bcp	a,#1
1074  013e 2704          	jreq	L364
1076  0140 1e03          	ldw	x,(OFST-1,sp)
1077  0142 26ee          	jrne	L354
1078  0144               L364:
1079                     ; 360         if (DownCounter != 0)
1081  0144 1e03          	ldw	x,(OFST-1,sp)
1082  0146 2706          	jreq	L564
1083                     ; 362             Swif = SUCCESS;
1085  0148 a601          	ld	a,#1
1086  014a 6b02          	ld	(OFST-2,sp),a
1089  014c 201b          	jra	L174
1090  014e               L564:
1091                     ; 366             Swif = ERROR;
1093  014e 0f02          	clr	(OFST-2,sp)
1095  0150 2017          	jra	L174
1096  0152               L544:
1097                     ; 374         if (ITState != DISABLE)
1099  0152 0d09          	tnz	(OFST+5,sp)
1100  0154 2706          	jreq	L374
1101                     ; 376             CLK->SWCR |= CLK_SWCR_SWIEN;
1103  0156 721450c5      	bset	20677,#2
1105  015a 2004          	jra	L574
1106  015c               L374:
1107                     ; 380             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1109  015c 721550c5      	bres	20677,#2
1110  0160               L574:
1111                     ; 384         CLK->SWR = (uint8_t)CLK_NewClock;
1113  0160 7b06          	ld	a,(OFST+2,sp)
1114  0162 c750c4        	ld	20676,a
1115                     ; 388         Swif = SUCCESS;
1117  0165 a601          	ld	a,#1
1118  0167 6b02          	ld	(OFST-2,sp),a
1120  0169               L174:
1121                     ; 393     if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1123  0169 0d0a          	tnz	(OFST+6,sp)
1124  016b 260c          	jrne	L774
1126  016d 7b01          	ld	a,(OFST-3,sp)
1127  016f a1e1          	cp	a,#225
1128  0171 2606          	jrne	L774
1129                     ; 395         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1131  0173 721150c0      	bres	20672,#0
1133  0177 201e          	jra	L105
1134  0179               L774:
1135                     ; 397     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1137  0179 0d0a          	tnz	(OFST+6,sp)
1138  017b 260c          	jrne	L305
1140  017d 7b01          	ld	a,(OFST-3,sp)
1141  017f a1d2          	cp	a,#210
1142  0181 2606          	jrne	L305
1143                     ; 399         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1145  0183 721750c0      	bres	20672,#3
1147  0187 200e          	jra	L105
1148  0189               L305:
1149                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1151  0189 0d0a          	tnz	(OFST+6,sp)
1152  018b 260a          	jrne	L105
1154  018d 7b01          	ld	a,(OFST-3,sp)
1155  018f a1b4          	cp	a,#180
1156  0191 2604          	jrne	L105
1157                     ; 403         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1159  0193 721150c1      	bres	20673,#0
1160  0197               L105:
1161                     ; 406     return(Swif);
1163  0197 7b02          	ld	a,(OFST-2,sp)
1166  0199 5b06          	addw	sp,#6
1167  019b 81            	ret
1305                     ; 416 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1305                     ; 417 {
1306                     	switch	.text
1307  019c               _CLK_HSIPrescalerConfig:
1309  019c 88            	push	a
1310       00000000      OFST:	set	0
1313                     ; 420     assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1315                     ; 423     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1317  019d c650c6        	ld	a,20678
1318  01a0 a4e7          	and	a,#231
1319  01a2 c750c6        	ld	20678,a
1320                     ; 426     CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1322  01a5 c650c6        	ld	a,20678
1323  01a8 1a01          	or	a,(OFST+1,sp)
1324  01aa c750c6        	ld	20678,a
1325                     ; 428 }
1328  01ad 84            	pop	a
1329  01ae 81            	ret
1464                     ; 439 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1464                     ; 440 {
1465                     	switch	.text
1466  01af               _CLK_CCOConfig:
1468  01af 88            	push	a
1469       00000000      OFST:	set	0
1472                     ; 443     assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1474                     ; 446     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1476  01b0 c650c9        	ld	a,20681
1477  01b3 a4e1          	and	a,#225
1478  01b5 c750c9        	ld	20681,a
1479                     ; 449     CLK->CCOR |= (uint8_t)CLK_CCO;
1481  01b8 c650c9        	ld	a,20681
1482  01bb 1a01          	or	a,(OFST+1,sp)
1483  01bd c750c9        	ld	20681,a
1484                     ; 452     CLK->CCOR |= CLK_CCOR_CCOEN;
1486  01c0 721050c9      	bset	20681,#0
1487                     ; 454 }
1490  01c4 84            	pop	a
1491  01c5 81            	ret
1556                     ; 464 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1556                     ; 465 {
1557                     	switch	.text
1558  01c6               _CLK_ITConfig:
1560  01c6 89            	pushw	x
1561       00000000      OFST:	set	0
1564                     ; 468     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1566                     ; 469     assert_param(IS_CLK_IT_OK(CLK_IT));
1568                     ; 471     if (NewState != DISABLE)
1570  01c7 9f            	ld	a,xl
1571  01c8 4d            	tnz	a
1572  01c9 2719          	jreq	L507
1573                     ; 473         switch (CLK_IT)
1575  01cb 9e            	ld	a,xh
1577                     ; 481         default:
1577                     ; 482             break;
1578  01cc a00c          	sub	a,#12
1579  01ce 270a          	jreq	L146
1580  01d0 a010          	sub	a,#16
1581  01d2 2624          	jrne	L317
1582                     ; 475         case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1582                     ; 476             CLK->SWCR |= CLK_SWCR_SWIEN;
1584  01d4 721450c5      	bset	20677,#2
1585                     ; 477             break;
1587  01d8 201e          	jra	L317
1588  01da               L146:
1589                     ; 478         case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1589                     ; 479             CLK->CSSR |= CLK_CSSR_CSSDIE;
1591  01da 721450c8      	bset	20680,#2
1592                     ; 480             break;
1594  01de 2018          	jra	L317
1595  01e0               L346:
1596                     ; 481         default:
1596                     ; 482             break;
1598  01e0 2016          	jra	L317
1599  01e2               L117:
1601  01e2 2014          	jra	L317
1602  01e4               L507:
1603                     ; 487         switch (CLK_IT)
1605  01e4 7b01          	ld	a,(OFST+1,sp)
1607                     ; 495         default:
1607                     ; 496             break;
1608  01e6 a00c          	sub	a,#12
1609  01e8 270a          	jreq	L746
1610  01ea a010          	sub	a,#16
1611  01ec 260a          	jrne	L317
1612                     ; 489         case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1612                     ; 490             CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1614  01ee 721550c5      	bres	20677,#2
1615                     ; 491             break;
1617  01f2 2004          	jra	L317
1618  01f4               L746:
1619                     ; 492         case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1619                     ; 493             CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1621  01f4 721550c8      	bres	20680,#2
1622                     ; 494             break;
1623  01f8               L317:
1624                     ; 500 }
1627  01f8 85            	popw	x
1628  01f9 81            	ret
1629  01fa               L156:
1630                     ; 495         default:
1630                     ; 496             break;
1632  01fa 20fc          	jra	L317
1633  01fc               L717:
1634  01fc 20fa          	jra	L317
1669                     ; 507 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1669                     ; 508 {
1670                     	switch	.text
1671  01fe               _CLK_SYSCLKConfig:
1673  01fe 88            	push	a
1674       00000000      OFST:	set	0
1677                     ; 511     assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1679                     ; 513     if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1681  01ff a580          	bcp	a,#128
1682  0201 2614          	jrne	L737
1683                     ; 515         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1685  0203 c650c6        	ld	a,20678
1686  0206 a4e7          	and	a,#231
1687  0208 c750c6        	ld	20678,a
1688                     ; 516         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1690  020b 7b01          	ld	a,(OFST+1,sp)
1691  020d a418          	and	a,#24
1692  020f ca50c6        	or	a,20678
1693  0212 c750c6        	ld	20678,a
1695  0215 2012          	jra	L147
1696  0217               L737:
1697                     ; 520         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1699  0217 c650c6        	ld	a,20678
1700  021a a4f8          	and	a,#248
1701  021c c750c6        	ld	20678,a
1702                     ; 521         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1704  021f 7b01          	ld	a,(OFST+1,sp)
1705  0221 a407          	and	a,#7
1706  0223 ca50c6        	or	a,20678
1707  0226 c750c6        	ld	20678,a
1708  0229               L147:
1709                     ; 524 }
1712  0229 84            	pop	a
1713  022a 81            	ret
1769                     ; 531 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1769                     ; 532 {
1770                     	switch	.text
1771  022b               _CLK_SWIMConfig:
1775                     ; 535     assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1777                     ; 537     if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1779  022b 4d            	tnz	a
1780  022c 2706          	jreq	L177
1781                     ; 540         CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1783  022e 721050cd      	bset	20685,#0
1785  0232 2004          	jra	L377
1786  0234               L177:
1787                     ; 545         CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1789  0234 721150cd      	bres	20685,#0
1790  0238               L377:
1791                     ; 548 }
1794  0238 81            	ret
1818                     ; 557 void CLK_ClockSecuritySystemEnable(void)
1818                     ; 558 {
1819                     	switch	.text
1820  0239               _CLK_ClockSecuritySystemEnable:
1824                     ; 560     CLK->CSSR |= CLK_CSSR_CSSEN;
1826  0239 721050c8      	bset	20680,#0
1827                     ; 561 }
1830  023d 81            	ret
1855                     ; 569 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1855                     ; 570 {
1856                     	switch	.text
1857  023e               _CLK_GetSYSCLKSource:
1861                     ; 571     return((CLK_Source_TypeDef)CLK->CMSR);
1863  023e c650c3        	ld	a,20675
1866  0241 81            	ret
1929                     ; 579 uint32_t CLK_GetClockFreq(void)
1929                     ; 580 {
1930                     	switch	.text
1931  0242               _CLK_GetClockFreq:
1933  0242 5209          	subw	sp,#9
1934       00000009      OFST:	set	9
1937                     ; 582     uint32_t clockfrequency = 0;
1939                     ; 583     CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1941                     ; 584     uint8_t tmp = 0, presc = 0;
1945                     ; 587     clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1947  0244 c650c3        	ld	a,20675
1948  0247 6b09          	ld	(OFST+0,sp),a
1950                     ; 589     if (clocksource == CLK_SOURCE_HSI)
1952  0249 7b09          	ld	a,(OFST+0,sp)
1953  024b a1e1          	cp	a,#225
1954  024d 2641          	jrne	L7401
1955                     ; 591         tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1957  024f c650c6        	ld	a,20678
1958  0252 a418          	and	a,#24
1959  0254 6b09          	ld	(OFST+0,sp),a
1961                     ; 592         tmp = (uint8_t)(tmp >> 3);
1963  0256 0409          	srl	(OFST+0,sp)
1964  0258 0409          	srl	(OFST+0,sp)
1965  025a 0409          	srl	(OFST+0,sp)
1967                     ; 593         presc = HSIDivFactor[tmp];
1969  025c 7b09          	ld	a,(OFST+0,sp)
1970  025e 5f            	clrw	x
1971  025f 97            	ld	xl,a
1972  0260 d60000        	ld	a,(_HSIDivFactor,x)
1973  0263 6b09          	ld	(OFST+0,sp),a
1975                     ; 594         clockfrequency = HSI_VALUE / presc;
1977  0265 7b09          	ld	a,(OFST+0,sp)
1978  0267 b703          	ld	c_lreg+3,a
1979  0269 3f02          	clr	c_lreg+2
1980  026b 3f01          	clr	c_lreg+1
1981  026d 3f00          	clr	c_lreg
1982  026f 96            	ldw	x,sp
1983  0270 1c0001        	addw	x,#OFST-8
1984  0273 cd0000        	call	c_rtol
1987  0276 ae2400        	ldw	x,#9216
1988  0279 bf02          	ldw	c_lreg+2,x
1989  027b ae00f4        	ldw	x,#244
1990  027e bf00          	ldw	c_lreg,x
1991  0280 96            	ldw	x,sp
1992  0281 1c0001        	addw	x,#OFST-8
1993  0284 cd0000        	call	c_ludv
1995  0287 96            	ldw	x,sp
1996  0288 1c0005        	addw	x,#OFST-4
1997  028b cd0000        	call	c_rtol
2001  028e 201c          	jra	L1501
2002  0290               L7401:
2003                     ; 596     else if ( clocksource == CLK_SOURCE_LSI)
2005  0290 7b09          	ld	a,(OFST+0,sp)
2006  0292 a1d2          	cp	a,#210
2007  0294 260c          	jrne	L3501
2008                     ; 598         clockfrequency = LSI_VALUE;
2010  0296 aef400        	ldw	x,#62464
2011  0299 1f07          	ldw	(OFST-2,sp),x
2012  029b ae0001        	ldw	x,#1
2013  029e 1f05          	ldw	(OFST-4,sp),x
2016  02a0 200a          	jra	L1501
2017  02a2               L3501:
2018                     ; 602         clockfrequency = HSE_VALUE;
2020  02a2 ae2400        	ldw	x,#9216
2021  02a5 1f07          	ldw	(OFST-2,sp),x
2022  02a7 ae00f4        	ldw	x,#244
2023  02aa 1f05          	ldw	(OFST-4,sp),x
2025  02ac               L1501:
2026                     ; 605     return((uint32_t)clockfrequency);
2028  02ac 96            	ldw	x,sp
2029  02ad 1c0005        	addw	x,#OFST-4
2030  02b0 cd0000        	call	c_ltor
2034  02b3 5b09          	addw	sp,#9
2035  02b5 81            	ret
2134                     ; 616 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2134                     ; 617 {
2135                     	switch	.text
2136  02b6               _CLK_AdjustHSICalibrationValue:
2138  02b6 88            	push	a
2139       00000000      OFST:	set	0
2142                     ; 620     assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2144                     ; 623     CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2146  02b7 c650cc        	ld	a,20684
2147  02ba a4f8          	and	a,#248
2148  02bc 1a01          	or	a,(OFST+1,sp)
2149  02be c750cc        	ld	20684,a
2150                     ; 625 }
2153  02c1 84            	pop	a
2154  02c2 81            	ret
2178                     ; 636 void CLK_SYSCLKEmergencyClear(void)
2178                     ; 637 {
2179                     	switch	.text
2180  02c3               _CLK_SYSCLKEmergencyClear:
2184                     ; 638     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2186  02c3 721150c5      	bres	20677,#0
2187                     ; 639 }
2190  02c7 81            	ret
2343                     ; 648 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2343                     ; 649 {
2344                     	switch	.text
2345  02c8               _CLK_GetFlagStatus:
2347  02c8 89            	pushw	x
2348  02c9 5203          	subw	sp,#3
2349       00000003      OFST:	set	3
2352                     ; 651     uint16_t statusreg = 0;
2354                     ; 652     uint8_t tmpreg = 0;
2356                     ; 653     FlagStatus bitstatus = RESET;
2358                     ; 656     assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2360                     ; 659     statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2362  02cb 01            	rrwa	x,a
2363  02cc 9f            	ld	a,xl
2364  02cd a4ff          	and	a,#255
2365  02cf 97            	ld	xl,a
2366  02d0 4f            	clr	a
2367  02d1 02            	rlwa	x,a
2368  02d2 1f01          	ldw	(OFST-2,sp),x
2369  02d4 01            	rrwa	x,a
2371                     ; 662     if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2373  02d5 1e01          	ldw	x,(OFST-2,sp)
2374  02d7 a30100        	cpw	x,#256
2375  02da 2607          	jrne	L1221
2376                     ; 664         tmpreg = CLK->ICKR;
2378  02dc c650c0        	ld	a,20672
2379  02df 6b03          	ld	(OFST+0,sp),a
2382  02e1 202f          	jra	L3221
2383  02e3               L1221:
2384                     ; 666     else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2386  02e3 1e01          	ldw	x,(OFST-2,sp)
2387  02e5 a30200        	cpw	x,#512
2388  02e8 2607          	jrne	L5221
2389                     ; 668         tmpreg = CLK->ECKR;
2391  02ea c650c1        	ld	a,20673
2392  02ed 6b03          	ld	(OFST+0,sp),a
2395  02ef 2021          	jra	L3221
2396  02f1               L5221:
2397                     ; 670     else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2399  02f1 1e01          	ldw	x,(OFST-2,sp)
2400  02f3 a30300        	cpw	x,#768
2401  02f6 2607          	jrne	L1321
2402                     ; 672         tmpreg = CLK->SWCR;
2404  02f8 c650c5        	ld	a,20677
2405  02fb 6b03          	ld	(OFST+0,sp),a
2408  02fd 2013          	jra	L3221
2409  02ff               L1321:
2410                     ; 674     else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2412  02ff 1e01          	ldw	x,(OFST-2,sp)
2413  0301 a30400        	cpw	x,#1024
2414  0304 2607          	jrne	L5321
2415                     ; 676         tmpreg = CLK->CSSR;
2417  0306 c650c8        	ld	a,20680
2418  0309 6b03          	ld	(OFST+0,sp),a
2421  030b 2005          	jra	L3221
2422  030d               L5321:
2423                     ; 680         tmpreg = CLK->CCOR;
2425  030d c650c9        	ld	a,20681
2426  0310 6b03          	ld	(OFST+0,sp),a
2428  0312               L3221:
2429                     ; 683     if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2431  0312 7b05          	ld	a,(OFST+2,sp)
2432  0314 1503          	bcp	a,(OFST+0,sp)
2433  0316 2706          	jreq	L1421
2434                     ; 685         bitstatus = SET;
2436  0318 a601          	ld	a,#1
2437  031a 6b03          	ld	(OFST+0,sp),a
2440  031c 2002          	jra	L3421
2441  031e               L1421:
2442                     ; 689         bitstatus = RESET;
2444  031e 0f03          	clr	(OFST+0,sp)
2446  0320               L3421:
2447                     ; 693     return((FlagStatus)bitstatus);
2449  0320 7b03          	ld	a,(OFST+0,sp)
2452  0322 5b05          	addw	sp,#5
2453  0324 81            	ret
2499                     ; 703 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2499                     ; 704 {
2500                     	switch	.text
2501  0325               _CLK_GetITStatus:
2503  0325 88            	push	a
2504  0326 88            	push	a
2505       00000001      OFST:	set	1
2508                     ; 706     ITStatus bitstatus = RESET;
2510                     ; 709     assert_param(IS_CLK_IT_OK(CLK_IT));
2512                     ; 711     if (CLK_IT == CLK_IT_SWIF)
2514  0327 a11c          	cp	a,#28
2515  0329 2611          	jrne	L7621
2516                     ; 714         if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2518  032b c450c5        	and	a,20677
2519  032e a10c          	cp	a,#12
2520  0330 2606          	jrne	L1721
2521                     ; 716             bitstatus = SET;
2523  0332 a601          	ld	a,#1
2524  0334 6b01          	ld	(OFST+0,sp),a
2527  0336 2015          	jra	L5721
2528  0338               L1721:
2529                     ; 720             bitstatus = RESET;
2531  0338 0f01          	clr	(OFST+0,sp)
2533  033a 2011          	jra	L5721
2534  033c               L7621:
2535                     ; 726         if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2537  033c c650c8        	ld	a,20680
2538  033f 1402          	and	a,(OFST+1,sp)
2539  0341 a10c          	cp	a,#12
2540  0343 2606          	jrne	L7721
2541                     ; 728             bitstatus = SET;
2543  0345 a601          	ld	a,#1
2544  0347 6b01          	ld	(OFST+0,sp),a
2547  0349 2002          	jra	L5721
2548  034b               L7721:
2549                     ; 732             bitstatus = RESET;
2551  034b 0f01          	clr	(OFST+0,sp)
2553  034d               L5721:
2554                     ; 737     return bitstatus;
2556  034d 7b01          	ld	a,(OFST+0,sp)
2559  034f 85            	popw	x
2560  0350 81            	ret
2596                     ; 747 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2596                     ; 748 {
2597                     	switch	.text
2598  0351               _CLK_ClearITPendingBit:
2602                     ; 751     assert_param(IS_CLK_IT_OK(CLK_IT));
2604                     ; 753     if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2606  0351 a10c          	cp	a,#12
2607  0353 2606          	jrne	L1231
2608                     ; 756         CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2610  0355 721750c8      	bres	20680,#3
2612  0359 2004          	jra	L3231
2613  035b               L1231:
2614                     ; 761         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2616  035b 721750c5      	bres	20677,#3
2617  035f               L3231:
2618                     ; 764 }
2621  035f 81            	ret
2656                     	xdef	_CLKPrescTable
2657                     	xdef	_HSIDivFactor
2658                     	xdef	_CLK_ClearITPendingBit
2659                     	xdef	_CLK_GetITStatus
2660                     	xdef	_CLK_GetFlagStatus
2661                     	xdef	_CLK_GetSYSCLKSource
2662                     	xdef	_CLK_GetClockFreq
2663                     	xdef	_CLK_AdjustHSICalibrationValue
2664                     	xdef	_CLK_SYSCLKEmergencyClear
2665                     	xdef	_CLK_ClockSecuritySystemEnable
2666                     	xdef	_CLK_SWIMConfig
2667                     	xdef	_CLK_SYSCLKConfig
2668                     	xdef	_CLK_ITConfig
2669                     	xdef	_CLK_CCOConfig
2670                     	xdef	_CLK_HSIPrescalerConfig
2671                     	xdef	_CLK_ClockSwitchConfig
2672                     	xdef	_CLK_PeripheralClockConfig
2673                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2674                     	xdef	_CLK_FastHaltWakeUpCmd
2675                     	xdef	_CLK_ClockSwitchCmd
2676                     	xdef	_CLK_CCOCmd
2677                     	xdef	_CLK_LSICmd
2678                     	xdef	_CLK_HSICmd
2679                     	xdef	_CLK_HSECmd
2680                     	xdef	_CLK_DeInit
2681                     	xref.b	c_lreg
2682                     	xref.b	c_x
2701                     	xref	c_ltor
2702                     	xref	c_ludv
2703                     	xref	c_rtol
2704                     	end
