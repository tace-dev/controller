   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  23                     .const:	section	.text
  24  0000               _HSIDivFactor:
  25  0000 01            	dc.b	1
  26  0001 02            	dc.b	2
  27  0002 04            	dc.b	4
  28  0003 08            	dc.b	8
  29  0004               _CLKPrescTable:
  30  0004 01            	dc.b	1
  31  0005 02            	dc.b	2
  32  0006 04            	dc.b	4
  33  0007 08            	dc.b	8
  34  0008 0a            	dc.b	10
  35  0009 10            	dc.b	16
  36  000a 14            	dc.b	20
  37  000b 28            	dc.b	40
  66                     ; 66 void CLK_DeInit(void)
  66                     ; 67 {
  68                     .text:	section	.text,new
  69  0000               _CLK_DeInit:
  73                     ; 69     CLK->ICKR = CLK_ICKR_RESET_VALUE;
  75  0000 350150c0      	mov	20672,#1
  76                     ; 70     CLK->ECKR = CLK_ECKR_RESET_VALUE;
  78  0004 725f50c1      	clr	20673
  79                     ; 71     CLK->SWR  = CLK_SWR_RESET_VALUE;
  81  0008 35e150c4      	mov	20676,#225
  82                     ; 72     CLK->SWCR = CLK_SWCR_RESET_VALUE;
  84  000c 725f50c5      	clr	20677
  85                     ; 73     CLK->CKDIVR = CLK_CKDIVR_RESET_VALUE;
  87  0010 351850c6      	mov	20678,#24
  88                     ; 74     CLK->PCKENR1 = CLK_PCKENR1_RESET_VALUE;
  90  0014 35ff50c7      	mov	20679,#255
  91                     ; 75     CLK->PCKENR2 = CLK_PCKENR2_RESET_VALUE;
  93  0018 35ff50ca      	mov	20682,#255
  94                     ; 76     CLK->CSSR = CLK_CSSR_RESET_VALUE;
  96  001c 725f50c8      	clr	20680
  97                     ; 77     CLK->CCOR = CLK_CCOR_RESET_VALUE;
  99  0020 725f50c9      	clr	20681
 101  0024               L52:
 102                     ; 78     while ((CLK->CCOR & CLK_CCOR_CCOEN)!= 0)
 104  0024 720050c9fb    	btjt	20681,#0,L52
 105                     ; 80     CLK->CCOR = CLK_CCOR_RESET_VALUE;
 107  0029 725f50c9      	clr	20681
 108                     ; 81     CLK->HSITRIMR = CLK_HSITRIMR_RESET_VALUE;
 110  002d 725f50cc      	clr	20684
 111                     ; 82     CLK->SWIMCCR = CLK_SWIMCCR_RESET_VALUE;
 113  0031 725f50cd      	clr	20685
 114                     ; 84 }
 117  0035 81            	ret	
 173                     ; 95 void CLK_FastHaltWakeUpCmd(FunctionalState NewState)
 173                     ; 96 {
 174                     .text:	section	.text,new
 175  0000               _CLK_FastHaltWakeUpCmd:
 179                     ; 99     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 181                     ; 101     if (NewState != DISABLE)
 183  0000 4d            	tnz	a
 184  0001 2705          	jreq	L75
 185                     ; 104         CLK->ICKR |= CLK_ICKR_FHWU;
 187  0003 721450c0      	bset	20672,#2
 190  0007 81            	ret	
 191  0008               L75:
 192                     ; 109         CLK->ICKR &= (uint8_t)(~CLK_ICKR_FHWU);
 194  0008 721550c0      	bres	20672,#2
 195                     ; 112 }
 198  000c 81            	ret	
 233                     ; 119 void CLK_HSECmd(FunctionalState NewState)
 233                     ; 120 {
 234                     .text:	section	.text,new
 235  0000               _CLK_HSECmd:
 239                     ; 123     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 241                     ; 125     if (NewState != DISABLE)
 243  0000 4d            	tnz	a
 244  0001 2705          	jreq	L101
 245                     ; 128         CLK->ECKR |= CLK_ECKR_HSEEN;
 247  0003 721050c1      	bset	20673,#0
 250  0007 81            	ret	
 251  0008               L101:
 252                     ; 133         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
 254  0008 721150c1      	bres	20673,#0
 255                     ; 136 }
 258  000c 81            	ret	
 293                     ; 143 void CLK_HSICmd(FunctionalState NewState)
 293                     ; 144 {
 294                     .text:	section	.text,new
 295  0000               _CLK_HSICmd:
 299                     ; 147     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 301                     ; 149     if (NewState != DISABLE)
 303  0000 4d            	tnz	a
 304  0001 2705          	jreq	L321
 305                     ; 152         CLK->ICKR |= CLK_ICKR_HSIEN;
 307  0003 721050c0      	bset	20672,#0
 310  0007 81            	ret	
 311  0008               L321:
 312                     ; 157         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
 314  0008 721150c0      	bres	20672,#0
 315                     ; 160 }
 318  000c 81            	ret	
 353                     ; 167 void CLK_LSICmd(FunctionalState NewState)
 353                     ; 168 {
 354                     .text:	section	.text,new
 355  0000               _CLK_LSICmd:
 359                     ; 171     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 361                     ; 173     if (NewState != DISABLE)
 363  0000 4d            	tnz	a
 364  0001 2705          	jreq	L541
 365                     ; 176         CLK->ICKR |= CLK_ICKR_LSIEN;
 367  0003 721650c0      	bset	20672,#3
 370  0007 81            	ret	
 371  0008               L541:
 372                     ; 181         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
 374  0008 721750c0      	bres	20672,#3
 375                     ; 184 }
 378  000c 81            	ret	
 413                     ; 192 void CLK_CCOCmd(FunctionalState NewState)
 413                     ; 193 {
 414                     .text:	section	.text,new
 415  0000               _CLK_CCOCmd:
 419                     ; 196     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 421                     ; 198     if (NewState != DISABLE)
 423  0000 4d            	tnz	a
 424  0001 2705          	jreq	L761
 425                     ; 201         CLK->CCOR |= CLK_CCOR_CCOEN;
 427  0003 721050c9      	bset	20681,#0
 430  0007 81            	ret	
 431  0008               L761:
 432                     ; 206         CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOEN);
 434  0008 721150c9      	bres	20681,#0
 435                     ; 209 }
 438  000c 81            	ret	
 473                     ; 218 void CLK_ClockSwitchCmd(FunctionalState NewState)
 473                     ; 219 {
 474                     .text:	section	.text,new
 475  0000               _CLK_ClockSwitchCmd:
 479                     ; 222     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 481                     ; 224     if (NewState != DISABLE )
 483  0000 4d            	tnz	a
 484  0001 2705          	jreq	L112
 485                     ; 227         CLK->SWCR |= CLK_SWCR_SWEN;
 487  0003 721250c5      	bset	20677,#1
 490  0007 81            	ret	
 491  0008               L112:
 492                     ; 232         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWEN);
 494  0008 721350c5      	bres	20677,#1
 495                     ; 235 }
 498  000c 81            	ret	
 534                     ; 245 void CLK_SlowActiveHaltWakeUpCmd(FunctionalState NewState)
 534                     ; 246 {
 535                     .text:	section	.text,new
 536  0000               _CLK_SlowActiveHaltWakeUpCmd:
 540                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 542                     ; 251     if (NewState != DISABLE)
 544  0000 4d            	tnz	a
 545  0001 2705          	jreq	L332
 546                     ; 254         CLK->ICKR |= CLK_ICKR_SWUAH;
 548  0003 721a50c0      	bset	20672,#5
 551  0007 81            	ret	
 552  0008               L332:
 553                     ; 259         CLK->ICKR &= (uint8_t)(~CLK_ICKR_SWUAH);
 555  0008 721b50c0      	bres	20672,#5
 556                     ; 262 }
 559  000c 81            	ret	
 718                     ; 272 void CLK_PeripheralClockConfig(CLK_Peripheral_TypeDef CLK_Peripheral, FunctionalState NewState)
 718                     ; 273 {
 719                     .text:	section	.text,new
 720  0000               _CLK_PeripheralClockConfig:
 722  0000 89            	pushw	x
 723       00000000      OFST:	set	0
 726                     ; 276     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 728                     ; 277     assert_param(IS_CLK_PERIPHERAL_OK(CLK_Peripheral));
 730                     ; 279     if (((uint8_t)CLK_Peripheral & (uint8_t)0x10) == 0x00)
 732  0001 9e            	ld	a,xh
 733  0002 a510          	bcp	a,#16
 734  0004 2626          	jrne	L123
 735                     ; 281         if (NewState != DISABLE)
 737  0006 7b02          	ld	a,(OFST+2,sp)
 738  0008 270f          	jreq	L323
 739                     ; 284             CLK->PCKENR1 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 741  000a 7b01          	ld	a,(OFST+1,sp)
 742  000c ad44          	call	LC003
 743  000e 2704          	jreq	L62
 744  0010               L03:
 745  0010 48            	sll	a
 746  0011 5a            	decw	x
 747  0012 26fc          	jrne	L03
 748  0014               L62:
 749  0014 ca50c7        	or	a,20679
 751  0017 200e          	jp	LC002
 752  0019               L323:
 753                     ; 289             CLK->PCKENR1 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 755  0019 7b01          	ld	a,(OFST+1,sp)
 756  001b ad35          	call	LC003
 757  001d 2704          	jreq	L23
 758  001f               L43:
 759  001f 48            	sll	a
 760  0020 5a            	decw	x
 761  0021 26fc          	jrne	L43
 762  0023               L23:
 763  0023 43            	cpl	a
 764  0024 c450c7        	and	a,20679
 765  0027               LC002:
 766  0027 c750c7        	ld	20679,a
 767  002a 2024          	jra	L723
 768  002c               L123:
 769                     ; 294         if (NewState != DISABLE)
 771  002c 7b02          	ld	a,(OFST+2,sp)
 772  002e 270f          	jreq	L133
 773                     ; 297             CLK->PCKENR2 |= (uint8_t)((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F));
 775  0030 7b01          	ld	a,(OFST+1,sp)
 776  0032 ad1e          	call	LC003
 777  0034 2704          	jreq	L63
 778  0036               L04:
 779  0036 48            	sll	a
 780  0037 5a            	decw	x
 781  0038 26fc          	jrne	L04
 782  003a               L63:
 783  003a ca50ca        	or	a,20682
 785  003d 200e          	jp	LC001
 786  003f               L133:
 787                     ; 302             CLK->PCKENR2 &= (uint8_t)(~(uint8_t)(((uint8_t)1 << ((uint8_t)CLK_Peripheral & (uint8_t)0x0F))));
 789  003f 7b01          	ld	a,(OFST+1,sp)
 790  0041 ad0f          	call	LC003
 791  0043 2704          	jreq	L24
 792  0045               L44:
 793  0045 48            	sll	a
 794  0046 5a            	decw	x
 795  0047 26fc          	jrne	L44
 796  0049               L24:
 797  0049 43            	cpl	a
 798  004a c450ca        	and	a,20682
 799  004d               LC001:
 800  004d c750ca        	ld	20682,a
 801  0050               L723:
 802                     ; 306 }
 805  0050 85            	popw	x
 806  0051 81            	ret	
 807  0052               LC003:
 808  0052 a40f          	and	a,#15
 809  0054 5f            	clrw	x
 810  0055 97            	ld	xl,a
 811  0056 a601          	ld	a,#1
 812  0058 5d            	tnzw	x
 813  0059 81            	ret	
 999                     ; 319 ErrorStatus CLK_ClockSwitchConfig(CLK_SwitchMode_TypeDef CLK_SwitchMode, CLK_Source_TypeDef CLK_NewClock, FunctionalState ITState, CLK_CurrentClockState_TypeDef CLK_CurrentClockState)
 999                     ; 320 {
1000                     .text:	section	.text,new
1001  0000               _CLK_ClockSwitchConfig:
1003  0000 89            	pushw	x
1004  0001 5204          	subw	sp,#4
1005       00000004      OFST:	set	4
1008                     ; 323     uint16_t DownCounter = CLK_TIMEOUT;
1010  0003 ae0491        	ldw	x,#1169
1011  0006 1f03          	ldw	(OFST-1,sp),x
1012                     ; 324     ErrorStatus Swif = ERROR;
1014                     ; 327     assert_param(IS_CLK_SOURCE_OK(CLK_NewClock));
1016                     ; 328     assert_param(IS_CLK_SWITCHMODE_OK(CLK_SwitchMode));
1018                     ; 329     assert_param(IS_FUNCTIONALSTATE_OK(ITState));
1020                     ; 330     assert_param(IS_CLK_CURRENTCLOCKSTATE_OK(CLK_CurrentClockState));
1022                     ; 333     clock_master = (CLK_Source_TypeDef)CLK->CMSR;
1024  0008 c650c3        	ld	a,20675
1025  000b 6b01          	ld	(OFST-3,sp),a
1026                     ; 336     if (CLK_SwitchMode == CLK_SWITCHMODE_AUTO)
1028  000d 7b05          	ld	a,(OFST+1,sp)
1029  000f 4a            	dec	a
1030  0010 262d          	jrne	L344
1031                     ; 340         CLK->SWCR |= CLK_SWCR_SWEN;
1033  0012 721250c5      	bset	20677,#1
1034                     ; 343         if (ITState != DISABLE)
1036  0016 7b09          	ld	a,(OFST+5,sp)
1037  0018 2706          	jreq	L544
1038                     ; 345             CLK->SWCR |= CLK_SWCR_SWIEN;
1040  001a 721450c5      	bset	20677,#2
1042  001e 2004          	jra	L744
1043  0020               L544:
1044                     ; 349             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1046  0020 721550c5      	bres	20677,#2
1047  0024               L744:
1048                     ; 353         CLK->SWR = (uint8_t)CLK_NewClock;
1050  0024 7b06          	ld	a,(OFST+2,sp)
1051  0026 c750c4        	ld	20676,a
1053  0029 2003          	jra	L554
1054  002b               L154:
1055                     ; 357             DownCounter--;
1057  002b 5a            	decw	x
1058  002c 1f03          	ldw	(OFST-1,sp),x
1059  002e               L554:
1060                     ; 355         while ((((CLK->SWCR & CLK_SWCR_SWBSY) != 0 )&& (DownCounter != 0)))
1062  002e 720150c504    	btjf	20677,#0,L164
1064  0033 1e03          	ldw	x,(OFST-1,sp)
1065  0035 26f4          	jrne	L154
1066  0037               L164:
1067                     ; 360         if (DownCounter != 0)
1069  0037 1e03          	ldw	x,(OFST-1,sp)
1070                     ; 362             Swif = SUCCESS;
1072  0039 2617          	jrne	LC004
1073                     ; 366             Swif = ERROR;
1075  003b 0f02          	clr	(OFST-2,sp)
1076  003d 2017          	jra	L764
1077  003f               L344:
1078                     ; 374         if (ITState != DISABLE)
1080  003f 7b09          	ld	a,(OFST+5,sp)
1081  0041 2706          	jreq	L174
1082                     ; 376             CLK->SWCR |= CLK_SWCR_SWIEN;
1084  0043 721450c5      	bset	20677,#2
1086  0047 2004          	jra	L374
1087  0049               L174:
1088                     ; 380             CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIEN);
1090  0049 721550c5      	bres	20677,#2
1091  004d               L374:
1092                     ; 384         CLK->SWR = (uint8_t)CLK_NewClock;
1094  004d 7b06          	ld	a,(OFST+2,sp)
1095  004f c750c4        	ld	20676,a
1096                     ; 388         Swif = SUCCESS;
1098  0052               LC004:
1100  0052 a601          	ld	a,#1
1101  0054 6b02          	ld	(OFST-2,sp),a
1102  0056               L764:
1103                     ; 393     if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSI))
1105  0056 7b0a          	ld	a,(OFST+6,sp)
1106  0058 260c          	jrne	L574
1108  005a 7b01          	ld	a,(OFST-3,sp)
1109  005c a1e1          	cp	a,#225
1110  005e 2606          	jrne	L574
1111                     ; 395         CLK->ICKR &= (uint8_t)(~CLK_ICKR_HSIEN);
1113  0060 721150c0      	bres	20672,#0
1115  0064 201e          	jra	L774
1116  0066               L574:
1117                     ; 397     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_LSI))
1119  0066 7b0a          	ld	a,(OFST+6,sp)
1120  0068 260c          	jrne	L105
1122  006a 7b01          	ld	a,(OFST-3,sp)
1123  006c a1d2          	cp	a,#210
1124  006e 2606          	jrne	L105
1125                     ; 399         CLK->ICKR &= (uint8_t)(~CLK_ICKR_LSIEN);
1127  0070 721750c0      	bres	20672,#3
1129  0074 200e          	jra	L774
1130  0076               L105:
1131                     ; 401     else if ((CLK_CurrentClockState == CLK_CURRENTCLOCKSTATE_DISABLE) && ( clock_master == CLK_SOURCE_HSE))
1133  0076 7b0a          	ld	a,(OFST+6,sp)
1134  0078 260a          	jrne	L774
1136  007a 7b01          	ld	a,(OFST-3,sp)
1137  007c a1b4          	cp	a,#180
1138  007e 2604          	jrne	L774
1139                     ; 403         CLK->ECKR &= (uint8_t)(~CLK_ECKR_HSEEN);
1141  0080 721150c1      	bres	20673,#0
1142  0084               L774:
1143                     ; 406     return(Swif);
1145  0084 7b02          	ld	a,(OFST-2,sp)
1148  0086 5b06          	addw	sp,#6
1149  0088 81            	ret	
1287                     ; 416 void CLK_HSIPrescalerConfig(CLK_Prescaler_TypeDef HSIPrescaler)
1287                     ; 417 {
1288                     .text:	section	.text,new
1289  0000               _CLK_HSIPrescalerConfig:
1291  0000 88            	push	a
1292       00000000      OFST:	set	0
1295                     ; 420     assert_param(IS_CLK_HSIPRESCALER_OK(HSIPrescaler));
1297                     ; 423     CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1299  0001 c650c6        	ld	a,20678
1300  0004 a4e7          	and	a,#231
1301  0006 c750c6        	ld	20678,a
1302                     ; 426     CLK->CKDIVR |= (uint8_t)HSIPrescaler;
1304  0009 c650c6        	ld	a,20678
1305  000c 1a01          	or	a,(OFST+1,sp)
1306  000e c750c6        	ld	20678,a
1307                     ; 428 }
1310  0011 84            	pop	a
1311  0012 81            	ret	
1446                     ; 439 void CLK_CCOConfig(CLK_Output_TypeDef CLK_CCO)
1446                     ; 440 {
1447                     .text:	section	.text,new
1448  0000               _CLK_CCOConfig:
1450  0000 88            	push	a
1451       00000000      OFST:	set	0
1454                     ; 443     assert_param(IS_CLK_OUTPUT_OK(CLK_CCO));
1456                     ; 446     CLK->CCOR &= (uint8_t)(~CLK_CCOR_CCOSEL);
1458  0001 c650c9        	ld	a,20681
1459  0004 a4e1          	and	a,#225
1460  0006 c750c9        	ld	20681,a
1461                     ; 449     CLK->CCOR |= (uint8_t)CLK_CCO;
1463  0009 c650c9        	ld	a,20681
1464  000c 1a01          	or	a,(OFST+1,sp)
1465  000e c750c9        	ld	20681,a
1466                     ; 452     CLK->CCOR |= CLK_CCOR_CCOEN;
1468  0011 721050c9      	bset	20681,#0
1469                     ; 454 }
1472  0015 84            	pop	a
1473  0016 81            	ret	
1538                     ; 464 void CLK_ITConfig(CLK_IT_TypeDef CLK_IT, FunctionalState NewState)
1538                     ; 465 {
1539                     .text:	section	.text,new
1540  0000               _CLK_ITConfig:
1542  0000 89            	pushw	x
1543       00000000      OFST:	set	0
1546                     ; 468     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1548                     ; 469     assert_param(IS_CLK_IT_OK(CLK_IT));
1550                     ; 471     if (NewState != DISABLE)
1552  0001 9f            	ld	a,xl
1553  0002 4d            	tnz	a
1554  0003 2715          	jreq	L307
1555                     ; 473         switch (CLK_IT)
1557  0005 9e            	ld	a,xh
1559                     ; 481         default:
1559                     ; 482             break;
1560  0006 a00c          	sub	a,#12
1561  0008 270a          	jreq	L736
1562  000a a010          	sub	a,#16
1563  000c 2620          	jrne	L117
1564                     ; 475         case CLK_IT_SWIF: /* Enable the clock switch interrupt */
1564                     ; 476             CLK->SWCR |= CLK_SWCR_SWIEN;
1566  000e 721450c5      	bset	20677,#2
1567                     ; 477             break;
1569  0012 201a          	jra	L117
1570  0014               L736:
1571                     ; 478         case CLK_IT_CSSD: /* Enable the clock security system detection interrupt */
1571                     ; 479             CLK->CSSR |= CLK_CSSR_CSSDIE;
1573  0014 721450c8      	bset	20680,#2
1574                     ; 480             break;
1576  0018 2014          	jra	L117
1577                     ; 481         default:
1577                     ; 482             break;
1580  001a               L307:
1581                     ; 487         switch (CLK_IT)
1583  001a 7b01          	ld	a,(OFST+1,sp)
1585                     ; 495         default:
1585                     ; 496             break;
1586  001c a00c          	sub	a,#12
1587  001e 270a          	jreq	L546
1588  0020 a010          	sub	a,#16
1589  0022 260a          	jrne	L117
1590                     ; 489         case CLK_IT_SWIF: /* Disable the clock switch interrupt */
1590                     ; 490             CLK->SWCR  &= (uint8_t)(~CLK_SWCR_SWIEN);
1592  0024 721550c5      	bres	20677,#2
1593                     ; 491             break;
1595  0028 2004          	jra	L117
1596  002a               L546:
1597                     ; 492         case CLK_IT_CSSD: /* Disable the clock security system detection interrupt */
1597                     ; 493             CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSDIE);
1599  002a 721550c8      	bres	20680,#2
1600                     ; 494             break;
1601  002e               L117:
1602                     ; 500 }
1605  002e 85            	popw	x
1606  002f 81            	ret	
1607                     ; 495         default:
1607                     ; 496             break;
1643                     ; 507 void CLK_SYSCLKConfig(CLK_Prescaler_TypeDef CLK_Prescaler)
1643                     ; 508 {
1644                     .text:	section	.text,new
1645  0000               _CLK_SYSCLKConfig:
1647  0000 88            	push	a
1648       00000000      OFST:	set	0
1651                     ; 511     assert_param(IS_CLK_PRESCALER_OK(CLK_Prescaler));
1653                     ; 513     if (((uint8_t)CLK_Prescaler & (uint8_t)0x80) == 0x00) /* Bit7 = 0 means HSI divider */
1655  0001 a580          	bcp	a,#128
1656  0003 260e          	jrne	L537
1657                     ; 515         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_HSIDIV);
1659  0005 c650c6        	ld	a,20678
1660  0008 a4e7          	and	a,#231
1661  000a c750c6        	ld	20678,a
1662                     ; 516         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_HSIDIV);
1664  000d 7b01          	ld	a,(OFST+1,sp)
1665  000f a418          	and	a,#24
1667  0011 200c          	jra	L737
1668  0013               L537:
1669                     ; 520         CLK->CKDIVR &= (uint8_t)(~CLK_CKDIVR_CPUDIV);
1671  0013 c650c6        	ld	a,20678
1672  0016 a4f8          	and	a,#248
1673  0018 c750c6        	ld	20678,a
1674                     ; 521         CLK->CKDIVR |= (uint8_t)((uint8_t)CLK_Prescaler & (uint8_t)CLK_CKDIVR_CPUDIV);
1676  001b 7b01          	ld	a,(OFST+1,sp)
1677  001d a407          	and	a,#7
1678  001f               L737:
1679  001f ca50c6        	or	a,20678
1680  0022 c750c6        	ld	20678,a
1681                     ; 524 }
1684  0025 84            	pop	a
1685  0026 81            	ret	
1741                     ; 531 void CLK_SWIMConfig(CLK_SWIMDivider_TypeDef CLK_SWIMDivider)
1741                     ; 532 {
1742                     .text:	section	.text,new
1743  0000               _CLK_SWIMConfig:
1747                     ; 535     assert_param(IS_CLK_SWIMDIVIDER_OK(CLK_SWIMDivider));
1749                     ; 537     if (CLK_SWIMDivider != CLK_SWIMDIVIDER_2)
1751  0000 4d            	tnz	a
1752  0001 2705          	jreq	L767
1753                     ; 540         CLK->SWIMCCR |= CLK_SWIMCCR_SWIMDIV;
1755  0003 721050cd      	bset	20685,#0
1758  0007 81            	ret	
1759  0008               L767:
1760                     ; 545         CLK->SWIMCCR &= (uint8_t)(~CLK_SWIMCCR_SWIMDIV);
1762  0008 721150cd      	bres	20685,#0
1763                     ; 548 }
1766  000c 81            	ret	
1790                     ; 557 void CLK_ClockSecuritySystemEnable(void)
1790                     ; 558 {
1791                     .text:	section	.text,new
1792  0000               _CLK_ClockSecuritySystemEnable:
1796                     ; 560     CLK->CSSR |= CLK_CSSR_CSSEN;
1798  0000 721050c8      	bset	20680,#0
1799                     ; 561 }
1802  0004 81            	ret	
1827                     ; 569 CLK_Source_TypeDef CLK_GetSYSCLKSource(void)
1827                     ; 570 {
1828                     .text:	section	.text,new
1829  0000               _CLK_GetSYSCLKSource:
1833                     ; 571     return((CLK_Source_TypeDef)CLK->CMSR);
1835  0000 c650c3        	ld	a,20675
1838  0003 81            	ret	
1895                     ; 579 uint32_t CLK_GetClockFreq(void)
1895                     ; 580 {
1896                     .text:	section	.text,new
1897  0000               _CLK_GetClockFreq:
1899  0000 5209          	subw	sp,#9
1900       00000009      OFST:	set	9
1903                     ; 582     uint32_t clockfrequency = 0;
1905                     ; 583     CLK_Source_TypeDef clocksource = CLK_SOURCE_HSI;
1907                     ; 584     uint8_t tmp = 0, presc = 0;
1911                     ; 587     clocksource = (CLK_Source_TypeDef)CLK->CMSR;
1913  0002 c650c3        	ld	a,20675
1914  0005 6b09          	ld	(OFST+0,sp),a
1915                     ; 589     if (clocksource == CLK_SOURCE_HSI)
1917  0007 a1e1          	cp	a,#225
1918  0009 2634          	jrne	L7301
1919                     ; 591         tmp = (uint8_t)(CLK->CKDIVR & CLK_CKDIVR_HSIDIV);
1921  000b c650c6        	ld	a,20678
1922  000e a418          	and	a,#24
1923  0010 44            	srl	a
1924  0011 44            	srl	a
1925  0012 44            	srl	a
1926                     ; 592         tmp = (uint8_t)(tmp >> 3);
1928                     ; 593         presc = HSIDivFactor[tmp];
1930  0013 5f            	clrw	x
1931  0014 97            	ld	xl,a
1932  0015 d60000        	ld	a,(_HSIDivFactor,x)
1933  0018 6b09          	ld	(OFST+0,sp),a
1934                     ; 594         clockfrequency = HSI_VALUE / presc;
1936  001a b703          	ld	c_lreg+3,a
1937  001c 3f02          	clr	c_lreg+2
1938  001e 3f01          	clr	c_lreg+1
1939  0020 3f00          	clr	c_lreg
1940  0022 96            	ldw	x,sp
1941  0023 5c            	incw	x
1942  0024 cd0000        	call	c_rtol
1944  0027 ae2400        	ldw	x,#9216
1945  002a bf02          	ldw	c_lreg+2,x
1946  002c ae00f4        	ldw	x,#244
1947  002f bf00          	ldw	c_lreg,x
1948  0031 96            	ldw	x,sp
1949  0032 5c            	incw	x
1950  0033 cd0000        	call	c_ludv
1952  0036 96            	ldw	x,sp
1953  0037 1c0005        	addw	x,#OFST-4
1954  003a cd0000        	call	c_rtol
1957  003d 2018          	jra	L1401
1958  003f               L7301:
1959                     ; 596     else if ( clocksource == CLK_SOURCE_LSI)
1961  003f a1d2          	cp	a,#210
1962  0041 260a          	jrne	L3401
1963                     ; 598         clockfrequency = LSI_VALUE;
1965  0043 aef400        	ldw	x,#62464
1966  0046 1f07          	ldw	(OFST-2,sp),x
1967  0048 ae0001        	ldw	x,#1
1969  004b 2008          	jp	LC005
1970  004d               L3401:
1971                     ; 602         clockfrequency = HSE_VALUE;
1973  004d ae3600        	ldw	x,#13824
1974  0050 1f07          	ldw	(OFST-2,sp),x
1975  0052 ae016e        	ldw	x,#366
1976  0055               LC005:
1977  0055 1f05          	ldw	(OFST-4,sp),x
1978  0057               L1401:
1979                     ; 605     return((uint32_t)clockfrequency);
1981  0057 96            	ldw	x,sp
1982  0058 1c0005        	addw	x,#OFST-4
1983  005b cd0000        	call	c_ltor
1987  005e 5b09          	addw	sp,#9
1988  0060 81            	ret	
2087                     ; 616 void CLK_AdjustHSICalibrationValue(CLK_HSITrimValue_TypeDef CLK_HSICalibrationValue)
2087                     ; 617 {
2088                     .text:	section	.text,new
2089  0000               _CLK_AdjustHSICalibrationValue:
2091  0000 88            	push	a
2092       00000000      OFST:	set	0
2095                     ; 620     assert_param(IS_CLK_HSITRIMVALUE_OK(CLK_HSICalibrationValue));
2097                     ; 623     CLK->HSITRIMR = (uint8_t)( (uint8_t)(CLK->HSITRIMR & (uint8_t)(~CLK_HSITRIMR_HSITRIM))|((uint8_t)CLK_HSICalibrationValue));
2099  0001 c650cc        	ld	a,20684
2100  0004 a4f8          	and	a,#248
2101  0006 1a01          	or	a,(OFST+1,sp)
2102  0008 c750cc        	ld	20684,a
2103                     ; 625 }
2106  000b 84            	pop	a
2107  000c 81            	ret	
2131                     ; 636 void CLK_SYSCLKEmergencyClear(void)
2131                     ; 637 {
2132                     .text:	section	.text,new
2133  0000               _CLK_SYSCLKEmergencyClear:
2137                     ; 638     CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWBSY);
2139  0000 721150c5      	bres	20677,#0
2140                     ; 639 }
2143  0004 81            	ret	
2292                     ; 648 FlagStatus CLK_GetFlagStatus(CLK_Flag_TypeDef CLK_FLAG)
2292                     ; 649 {
2293                     .text:	section	.text,new
2294  0000               _CLK_GetFlagStatus:
2296  0000 89            	pushw	x
2297  0001 5203          	subw	sp,#3
2298       00000003      OFST:	set	3
2301                     ; 651     uint16_t statusreg = 0;
2303                     ; 652     uint8_t tmpreg = 0;
2305                     ; 653     FlagStatus bitstatus = RESET;
2307                     ; 656     assert_param(IS_CLK_FLAG_OK(CLK_FLAG));
2309                     ; 659     statusreg = (uint16_t)((uint16_t)CLK_FLAG & (uint16_t)0xFF00);
2311  0003 01            	rrwa	x,a
2312  0004 4f            	clr	a
2313  0005 02            	rlwa	x,a
2314  0006 1f01          	ldw	(OFST-2,sp),x
2315                     ; 662     if (statusreg == 0x0100) /* The flag to check is in ICKRregister */
2317  0008 a30100        	cpw	x,#256
2318  000b 2605          	jrne	L5021
2319                     ; 664         tmpreg = CLK->ICKR;
2321  000d c650c0        	ld	a,20672
2323  0010 2021          	jra	L7021
2324  0012               L5021:
2325                     ; 666     else if (statusreg == 0x0200) /* The flag to check is in ECKRregister */
2327  0012 a30200        	cpw	x,#512
2328  0015 2605          	jrne	L1121
2329                     ; 668         tmpreg = CLK->ECKR;
2331  0017 c650c1        	ld	a,20673
2333  001a 2017          	jra	L7021
2334  001c               L1121:
2335                     ; 670     else if (statusreg == 0x0300) /* The flag to check is in SWIC register */
2337  001c a30300        	cpw	x,#768
2338  001f 2605          	jrne	L5121
2339                     ; 672         tmpreg = CLK->SWCR;
2341  0021 c650c5        	ld	a,20677
2343  0024 200d          	jra	L7021
2344  0026               L5121:
2345                     ; 674     else if (statusreg == 0x0400) /* The flag to check is in CSS register */
2347  0026 a30400        	cpw	x,#1024
2348  0029 2605          	jrne	L1221
2349                     ; 676         tmpreg = CLK->CSSR;
2351  002b c650c8        	ld	a,20680
2353  002e 2003          	jra	L7021
2354  0030               L1221:
2355                     ; 680         tmpreg = CLK->CCOR;
2357  0030 c650c9        	ld	a,20681
2358  0033               L7021:
2359  0033 6b03          	ld	(OFST+0,sp),a
2360                     ; 683     if ((tmpreg & (uint8_t)CLK_FLAG) != (uint8_t)RESET)
2362  0035 7b05          	ld	a,(OFST+2,sp)
2363  0037 1503          	bcp	a,(OFST+0,sp)
2364  0039 2704          	jreq	L5221
2365                     ; 685         bitstatus = SET;
2367  003b a601          	ld	a,#1
2369  003d 2001          	jra	L7221
2370  003f               L5221:
2371                     ; 689         bitstatus = RESET;
2373  003f 4f            	clr	a
2374  0040               L7221:
2375                     ; 693     return((FlagStatus)bitstatus);
2379  0040 5b05          	addw	sp,#5
2380  0042 81            	ret	
2426                     ; 703 ITStatus CLK_GetITStatus(CLK_IT_TypeDef CLK_IT)
2426                     ; 704 {
2427                     .text:	section	.text,new
2428  0000               _CLK_GetITStatus:
2430  0000 88            	push	a
2431  0001 88            	push	a
2432       00000001      OFST:	set	1
2435                     ; 706     ITStatus bitstatus = RESET;
2437                     ; 709     assert_param(IS_CLK_IT_OK(CLK_IT));
2439                     ; 711     if (CLK_IT == CLK_IT_SWIF)
2441  0002 a11c          	cp	a,#28
2442  0004 2609          	jrne	L3521
2443                     ; 714         if ((CLK->SWCR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2445  0006 c450c5        	and	a,20677
2446  0009 a10c          	cp	a,#12
2447  000b 260f          	jrne	L3621
2448                     ; 716             bitstatus = SET;
2450  000d 2009          	jp	LC007
2451                     ; 720             bitstatus = RESET;
2452  000f               L3521:
2453                     ; 726         if ((CLK->CSSR & (uint8_t)CLK_IT) == (uint8_t)0x0C)
2455  000f c650c8        	ld	a,20680
2456  0012 1402          	and	a,(OFST+1,sp)
2457  0014 a10c          	cp	a,#12
2458  0016 2604          	jrne	L3621
2459                     ; 728             bitstatus = SET;
2461  0018               LC007:
2463  0018 a601          	ld	a,#1
2465  001a 2001          	jra	L1621
2466  001c               L3621:
2467                     ; 732             bitstatus = RESET;
2470  001c 4f            	clr	a
2471  001d               L1621:
2472                     ; 737     return bitstatus;
2476  001d 85            	popw	x
2477  001e 81            	ret	
2513                     ; 747 void CLK_ClearITPendingBit(CLK_IT_TypeDef CLK_IT)
2513                     ; 748 {
2514                     .text:	section	.text,new
2515  0000               _CLK_ClearITPendingBit:
2519                     ; 751     assert_param(IS_CLK_IT_OK(CLK_IT));
2521                     ; 753     if (CLK_IT == (uint8_t)CLK_IT_CSSD)
2523  0000 a10c          	cp	a,#12
2524  0002 2605          	jrne	L5031
2525                     ; 756         CLK->CSSR &= (uint8_t)(~CLK_CSSR_CSSD);
2527  0004 721750c8      	bres	20680,#3
2530  0008 81            	ret	
2531  0009               L5031:
2532                     ; 761         CLK->SWCR &= (uint8_t)(~CLK_SWCR_SWIF);
2534  0009 721750c5      	bres	20677,#3
2535                     ; 764 }
2538  000d 81            	ret	
2573                     	xdef	_CLKPrescTable
2574                     	xdef	_HSIDivFactor
2575                     	xdef	_CLK_ClearITPendingBit
2576                     	xdef	_CLK_GetITStatus
2577                     	xdef	_CLK_GetFlagStatus
2578                     	xdef	_CLK_GetSYSCLKSource
2579                     	xdef	_CLK_GetClockFreq
2580                     	xdef	_CLK_AdjustHSICalibrationValue
2581                     	xdef	_CLK_SYSCLKEmergencyClear
2582                     	xdef	_CLK_ClockSecuritySystemEnable
2583                     	xdef	_CLK_SWIMConfig
2584                     	xdef	_CLK_SYSCLKConfig
2585                     	xdef	_CLK_ITConfig
2586                     	xdef	_CLK_CCOConfig
2587                     	xdef	_CLK_HSIPrescalerConfig
2588                     	xdef	_CLK_ClockSwitchConfig
2589                     	xdef	_CLK_PeripheralClockConfig
2590                     	xdef	_CLK_SlowActiveHaltWakeUpCmd
2591                     	xdef	_CLK_FastHaltWakeUpCmd
2592                     	xdef	_CLK_ClockSwitchCmd
2593                     	xdef	_CLK_CCOCmd
2594                     	xdef	_CLK_LSICmd
2595                     	xdef	_CLK_HSICmd
2596                     	xdef	_CLK_HSECmd
2597                     	xdef	_CLK_DeInit
2598                     	xref.b	c_lreg
2599                     	xref.b	c_x
2618                     	xref	c_ltor
2619                     	xref	c_ludv
2620                     	xref	c_rtol
2621                     	end
