   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  49                     ; 165 void TIM3_DeInit(void)
  49                     ; 166 {
  51                     	switch	.text
  52  0000               _TIM3_DeInit:
  56                     ; 167   TIM3->CR1 = TIM_CR1_RESET_VALUE;
  58  0000 725f5280      	clr	21120
  59                     ; 168   TIM3->CR2 = TIM_CR2_RESET_VALUE;
  61  0004 725f5281      	clr	21121
  62                     ; 169   TIM3->SMCR = TIM_SMCR_RESET_VALUE;
  64  0008 725f5282      	clr	21122
  65                     ; 170   TIM3->ETR = TIM_ETR_RESET_VALUE;
  67  000c 725f5283      	clr	21123
  68                     ; 171   TIM3->IER = TIM_IER_RESET_VALUE;
  70  0010 725f5285      	clr	21125
  71                     ; 172   TIM3->SR2 = TIM_SR2_RESET_VALUE;
  73  0014 725f5287      	clr	21127
  74                     ; 175   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  76  0018 725f528b      	clr	21131
  77                     ; 177   TIM3->CCMR1 = 0x01;/*TIM3_ICxSource_TIxFPx */
  79  001c 35015289      	mov	21129,#1
  80                     ; 178   TIM3->CCMR2 = 0x01;/*TIM3_ICxSource_TIxFPx */
  82  0020 3501528a      	mov	21130,#1
  83                     ; 181   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  85  0024 725f528b      	clr	21131
  86                     ; 182   TIM3->CCMR1 = TIM_CCMR1_RESET_VALUE;
  88  0028 725f5289      	clr	21129
  89                     ; 183   TIM3->CCMR2 = TIM_CCMR2_RESET_VALUE;
  91  002c 725f528a      	clr	21130
  92                     ; 185   TIM3->CNTRH = TIM_CNTRH_RESET_VALUE;
  94  0030 725f528c      	clr	21132
  95                     ; 186   TIM3->CNTRL = TIM_CNTRL_RESET_VALUE;
  97  0034 725f528d      	clr	21133
  98                     ; 188   TIM3->PSCR = TIM_PSCR_RESET_VALUE;
 100  0038 725f528e      	clr	21134
 101                     ; 190   TIM3->ARRH = TIM_ARRH_RESET_VALUE;
 103  003c 35ff528f      	mov	21135,#255
 104                     ; 191   TIM3->ARRL = TIM_ARRL_RESET_VALUE;
 106  0040 35ff5290      	mov	21136,#255
 107                     ; 193   TIM3->CCR1H = TIM_CCR1H_RESET_VALUE;
 109  0044 725f5291      	clr	21137
 110                     ; 194   TIM3->CCR1L = TIM_CCR1L_RESET_VALUE;
 112  0048 725f5292      	clr	21138
 113                     ; 195   TIM3->CCR2H = TIM_CCR2H_RESET_VALUE;
 115  004c 725f5293      	clr	21139
 116                     ; 196   TIM3->CCR2L = TIM_CCR2L_RESET_VALUE;
 118  0050 725f5294      	clr	21140
 119                     ; 199   TIM3->OISR = TIM_OISR_RESET_VALUE;
 121  0054 725f5296      	clr	21142
 122                     ; 200   TIM3->EGR = 0x01;/* TIM_EGR_UG */
 124  0058 35015288      	mov	21128,#1
 125                     ; 201   TIM3->BKR = TIM_BKR_RESET_VALUE;
 127  005c 725f5295      	clr	21141
 128                     ; 202   TIM3->SR1 = TIM_SR1_RESET_VALUE;
 130  0060 725f5286      	clr	21126
 131                     ; 203 }
 134  0064 81            	ret	
 294                     ; 228 void TIM3_TimeBaseInit(TIM3_Prescaler_TypeDef TIM3_Prescaler,
 294                     ; 229                        TIM3_CounterMode_TypeDef TIM3_CounterMode,
 294                     ; 230                        uint16_t TIM3_Period)
 294                     ; 231 {
 295                     	switch	.text
 296  0065               _TIM3_TimeBaseInit:
 298  0065 89            	pushw	x
 299       00000000      OFST:	set	0
 302                     ; 233   assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
 304                     ; 234   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
 306                     ; 239   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8) ;
 308  0066 7b05          	ld	a,(OFST+5,sp)
 309  0068 c7528f        	ld	21135,a
 310                     ; 240   TIM3->ARRL = (uint8_t)(TIM3_Period);
 312  006b 7b06          	ld	a,(OFST+6,sp)
 313  006d c75290        	ld	21136,a
 314                     ; 243   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 316  0070 9e            	ld	a,xh
 317  0071 c7528e        	ld	21134,a
 318                     ; 246   TIM3->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 320  0074 c65280        	ld	a,21120
 321  0077 a48f          	and	a,#143
 322  0079 c75280        	ld	21120,a
 323                     ; 247   TIM3->CR1 |= (uint8_t)(TIM3_CounterMode);
 325  007c 9f            	ld	a,xl
 326  007d ca5280        	or	a,21120
 327  0080 c75280        	ld	21120,a
 328                     ; 250   TIM3->EGR = TIM3_EventSource_Update;
 330  0083 35015288      	mov	21128,#1
 331                     ; 251 }
 334  0087 85            	popw	x
 335  0088 81            	ret	
 403                     ; 271 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
 403                     ; 272                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
 403                     ; 273 {
 404                     	switch	.text
 405  0089               _TIM3_PrescalerConfig:
 409                     ; 275   assert_param(IS_TIM3_PRESCALER(Prescaler));
 411                     ; 276   assert_param(IS_TIM3_PRESCALER_RELOAD(TIM3_PSCReloadMode));
 413                     ; 279   TIM3->PSCR = (uint8_t)(Prescaler);
 415  0089 9e            	ld	a,xh
 416  008a c7528e        	ld	21134,a
 417                     ; 282   if (TIM3_PSCReloadMode == TIM3_PSCReloadMode_Immediate)
 419  008d 9f            	ld	a,xl
 420  008e 4a            	dec	a
 421  008f 2605          	jrne	L541
 422                     ; 284     TIM3->EGR |= TIM_EGR_UG ;
 424  0091 72105288      	bset	21128,#0
 427  0095 81            	ret	
 428  0096               L541:
 429                     ; 288     TIM3->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 431  0096 72115288      	bres	21128,#0
 432                     ; 290 }
 435  009a 81            	ret	
 478                     ; 303 void TIM3_CounterModeConfig(TIM3_CounterMode_TypeDef TIM3_CounterMode)
 478                     ; 304 {
 479                     	switch	.text
 480  009b               _TIM3_CounterModeConfig:
 482  009b 88            	push	a
 483  009c 88            	push	a
 484       00000001      OFST:	set	1
 487                     ; 305   uint8_t tmpcr1 = 0;
 489                     ; 308   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
 491                     ; 310   tmpcr1 = TIM3->CR1;
 493  009d c65280        	ld	a,21120
 494                     ; 313   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 496  00a0 a48f          	and	a,#143
 497                     ; 316   tmpcr1 |= (uint8_t)TIM3_CounterMode;
 499  00a2 1a02          	or	a,(OFST+1,sp)
 500                     ; 318   TIM3->CR1 = tmpcr1;
 502  00a4 c75280        	ld	21120,a
 503                     ; 319 }
 506  00a7 85            	popw	x
 507  00a8 81            	ret	
 539                     ; 327 void TIM3_SetCounter(uint16_t Counter)
 539                     ; 328 {
 540                     	switch	.text
 541  00a9               _TIM3_SetCounter:
 545                     ; 331   TIM3->CNTRH = (uint8_t)(Counter >> 8);
 547  00a9 9e            	ld	a,xh
 548  00aa c7528c        	ld	21132,a
 549                     ; 332   TIM3->CNTRL = (uint8_t)(Counter);
 551  00ad 9f            	ld	a,xl
 552  00ae c7528d        	ld	21133,a
 553                     ; 333 }
 556  00b1 81            	ret	
 588                     ; 341 void TIM3_SetAutoreload(uint16_t Autoreload)
 588                     ; 342 {
 589                     	switch	.text
 590  00b2               _TIM3_SetAutoreload:
 594                     ; 344   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
 596  00b2 9e            	ld	a,xh
 597  00b3 c7528f        	ld	21135,a
 598                     ; 345   TIM3->ARRL = (uint8_t)(Autoreload);
 600  00b6 9f            	ld	a,xl
 601  00b7 c75290        	ld	21136,a
 602                     ; 346 }
 605  00ba 81            	ret	
 651                     ; 353 uint16_t TIM3_GetCounter(void)
 651                     ; 354 {
 652                     	switch	.text
 653  00bb               _TIM3_GetCounter:
 655  00bb 5204          	subw	sp,#4
 656       00000004      OFST:	set	4
 659                     ; 355   uint16_t tmpcnt = 0;
 661                     ; 358   tmpcntrh = TIM3->CNTRH;
 663  00bd c6528c        	ld	a,21132
 664  00c0 6b02          	ld	(OFST-2,sp),a
 665                     ; 359   tmpcntrl = TIM3->CNTRL;
 667  00c2 c6528d        	ld	a,21133
 668  00c5 6b01          	ld	(OFST-3,sp),a
 669                     ; 361   tmpcnt = (uint16_t)(tmpcntrl);
 671  00c7 5f            	clrw	x
 672  00c8 97            	ld	xl,a
 673  00c9 1f03          	ldw	(OFST-1,sp),x
 674                     ; 362   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 676  00cb 5f            	clrw	x
 677  00cc 7b02          	ld	a,(OFST-2,sp)
 678  00ce 97            	ld	xl,a
 679  00cf 7b04          	ld	a,(OFST+0,sp)
 680  00d1 01            	rrwa	x,a
 681  00d2 1a03          	or	a,(OFST-1,sp)
 682  00d4 01            	rrwa	x,a
 683                     ; 364   return ((uint16_t)tmpcnt);
 687  00d5 5b04          	addw	sp,#4
 688  00d7 81            	ret	
 712                     ; 380 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
 712                     ; 381 {
 713                     	switch	.text
 714  00d8               _TIM3_GetPrescaler:
 718                     ; 383   return ((TIM3_Prescaler_TypeDef)TIM3->PSCR);
 720  00d8 c6528e        	ld	a,21134
 723  00db 81            	ret	
 779                     ; 393 void TIM3_UpdateDisableConfig(FunctionalState NewState)
 779                     ; 394 {
 780                     	switch	.text
 781  00dc               _TIM3_UpdateDisableConfig:
 785                     ; 396   assert_param(IS_FUNCTIONAL_STATE(NewState));
 787                     ; 399   if (NewState != DISABLE)
 789  00dc 4d            	tnz	a
 790  00dd 2705          	jreq	L772
 791                     ; 401     TIM3->CR1 |= TIM_CR1_UDIS;
 793  00df 72125280      	bset	21120,#1
 796  00e3 81            	ret	
 797  00e4               L772:
 798                     ; 405     TIM3->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 800  00e4 72135280      	bres	21120,#1
 801                     ; 407 }
 804  00e8 81            	ret	
 862                     ; 417 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
 862                     ; 418 {
 863                     	switch	.text
 864  00e9               _TIM3_UpdateRequestConfig:
 868                     ; 420   assert_param(IS_TIM3_UPDATE_SOURCE(TIM3_UpdateSource));
 870                     ; 423   if (TIM3_UpdateSource == TIM3_UpdateSource_Regular)
 872  00e9 4a            	dec	a
 873  00ea 2605          	jrne	L133
 874                     ; 425     TIM3->CR1 |= TIM_CR1_URS ;
 876  00ec 72145280      	bset	21120,#2
 879  00f0 81            	ret	
 880  00f1               L133:
 881                     ; 429     TIM3->CR1 &= (uint8_t)(~TIM_CR1_URS);
 883  00f1 72155280      	bres	21120,#2
 884                     ; 431 }
 887  00f5 81            	ret	
 923                     ; 439 void TIM3_ARRPreloadConfig(FunctionalState NewState)
 923                     ; 440 {
 924                     	switch	.text
 925  00f6               _TIM3_ARRPreloadConfig:
 929                     ; 442   assert_param(IS_FUNCTIONAL_STATE(NewState));
 931                     ; 445   if (NewState != DISABLE)
 933  00f6 4d            	tnz	a
 934  00f7 2705          	jreq	L353
 935                     ; 447     TIM3->CR1 |= TIM_CR1_ARPE;
 937  00f9 721e5280      	bset	21120,#7
 940  00fd 81            	ret	
 941  00fe               L353:
 942                     ; 451     TIM3->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 944  00fe 721f5280      	bres	21120,#7
 945                     ; 453 }
 948  0102 81            	ret	
1005                     ; 463 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1005                     ; 464 {
1006                     	switch	.text
1007  0103               _TIM3_SelectOnePulseMode:
1011                     ; 466   assert_param(IS_TIM3_OPM_MODE(TIM3_OPMode));
1013                     ; 469   if (TIM3_OPMode == TIM3_OPMode_Single)
1015  0103 4a            	dec	a
1016  0104 2605          	jrne	L504
1017                     ; 471     TIM3->CR1 |= TIM_CR1_OPM ;
1019  0106 72165280      	bset	21120,#3
1022  010a 81            	ret	
1023  010b               L504:
1024                     ; 475     TIM3->CR1 &= (uint8_t)(~TIM_CR1_OPM);
1026  010b 72175280      	bres	21120,#3
1027                     ; 477 }
1030  010f 81            	ret	
1065                     ; 485 void TIM3_Cmd(FunctionalState NewState)
1065                     ; 486 {
1066                     	switch	.text
1067  0110               _TIM3_Cmd:
1071                     ; 488   assert_param(IS_FUNCTIONAL_STATE(NewState));
1073                     ; 491   if (NewState != DISABLE)
1075  0110 4d            	tnz	a
1076  0111 2705          	jreq	L724
1077                     ; 493     TIM3->CR1 |= TIM_CR1_CEN;
1079  0113 72105280      	bset	21120,#0
1082  0117 81            	ret	
1083  0118               L724:
1084                     ; 497     TIM3->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1086  0118 72115280      	bres	21120,#0
1087                     ; 499 }
1090  011c 81            	ret	
1284                     ; 575 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
1284                     ; 576                   TIM3_OutputState_TypeDef TIM3_OutputState,
1284                     ; 577                   uint16_t TIM3_Pulse,
1284                     ; 578                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
1284                     ; 579                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
1284                     ; 580 {
1285                     	switch	.text
1286  011d               _TIM3_OC1Init:
1288  011d 89            	pushw	x
1289  011e 88            	push	a
1290       00000001      OFST:	set	1
1293                     ; 581   uint8_t tmpccmr1 = 0;
1295                     ; 584   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
1297                     ; 585   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
1299                     ; 586   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
1301                     ; 587   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
1303                     ; 589   tmpccmr1 = TIM3->CCMR1;
1305  011f c65289        	ld	a,21129
1306  0122 6b01          	ld	(OFST+0,sp),a
1307                     ; 592   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1309  0124 7211528b      	bres	21131,#0
1310                     ; 594   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
1312  0128 a48f          	and	a,#143
1313  012a 6b01          	ld	(OFST+0,sp),a
1314                     ; 597   tmpccmr1 |= (uint8_t)TIM3_OCMode;
1316  012c 9e            	ld	a,xh
1317  012d 1a01          	or	a,(OFST+0,sp)
1318  012f 6b01          	ld	(OFST+0,sp),a
1319                     ; 599   TIM3->CCMR1 = tmpccmr1;
1321  0131 c75289        	ld	21129,a
1322                     ; 602   if (TIM3_OutputState == TIM3_OutputState_Enable)
1324  0134 9f            	ld	a,xl
1325  0135 4a            	dec	a
1326  0136 2606          	jrne	L145
1327                     ; 604     TIM3->CCER1 |= TIM_CCER1_CC1E;
1329  0138 7210528b      	bset	21131,#0
1331  013c 2004          	jra	L345
1332  013e               L145:
1333                     ; 608     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1335  013e 7211528b      	bres	21131,#0
1336  0142               L345:
1337                     ; 612   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
1339  0142 7b08          	ld	a,(OFST+7,sp)
1340  0144 4a            	dec	a
1341  0145 2606          	jrne	L545
1342                     ; 614     TIM3->CCER1 |= TIM_CCER1_CC1P;
1344  0147 7212528b      	bset	21131,#1
1346  014b 2004          	jra	L745
1347  014d               L545:
1348                     ; 618     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1350  014d 7213528b      	bres	21131,#1
1351  0151               L745:
1352                     ; 622   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
1354  0151 7b09          	ld	a,(OFST+8,sp)
1355  0153 4a            	dec	a
1356  0154 2606          	jrne	L155
1357                     ; 624     TIM3->OISR |= TIM_OISR_OIS1;
1359  0156 72105296      	bset	21142,#0
1361  015a 2004          	jra	L355
1362  015c               L155:
1363                     ; 628     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS1);
1365  015c 72115296      	bres	21142,#0
1366  0160               L355:
1367                     ; 632   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
1369  0160 7b06          	ld	a,(OFST+5,sp)
1370  0162 c75291        	ld	21137,a
1371                     ; 633   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
1373  0165 7b07          	ld	a,(OFST+6,sp)
1374  0167 c75292        	ld	21138,a
1375                     ; 634 }
1378  016a 5b03          	addw	sp,#3
1379  016c 81            	ret	
1458                     ; 661 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
1458                     ; 662                   TIM3_OutputState_TypeDef TIM3_OutputState,
1458                     ; 663                   uint16_t TIM3_Pulse,
1458                     ; 664                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
1458                     ; 665                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
1458                     ; 666 {
1459                     	switch	.text
1460  016d               _TIM3_OC2Init:
1462  016d 89            	pushw	x
1463  016e 88            	push	a
1464       00000001      OFST:	set	1
1467                     ; 667   uint8_t tmpccmr2 = 0;
1469                     ; 670   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
1471                     ; 671   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
1473                     ; 672   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
1475                     ; 673   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
1477                     ; 675   tmpccmr2 = TIM3->CCMR2;
1479  016f c6528a        	ld	a,21130
1480  0172 6b01          	ld	(OFST+0,sp),a
1481                     ; 678   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1483  0174 7219528b      	bres	21131,#4
1484                     ; 681   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
1486  0178 a48f          	and	a,#143
1487  017a 6b01          	ld	(OFST+0,sp),a
1488                     ; 684   tmpccmr2 |= (uint8_t)TIM3_OCMode;
1490  017c 9e            	ld	a,xh
1491  017d 1a01          	or	a,(OFST+0,sp)
1492  017f 6b01          	ld	(OFST+0,sp),a
1493                     ; 686   TIM3->CCMR2 = tmpccmr2;
1495  0181 c7528a        	ld	21130,a
1496                     ; 689   if (TIM3_OutputState == TIM3_OutputState_Enable)
1498  0184 9f            	ld	a,xl
1499  0185 4a            	dec	a
1500  0186 2606          	jrne	L316
1501                     ; 691     TIM3->CCER1 |= TIM_CCER1_CC2E;
1503  0188 7218528b      	bset	21131,#4
1505  018c 2004          	jra	L516
1506  018e               L316:
1507                     ; 695     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1509  018e 7219528b      	bres	21131,#4
1510  0192               L516:
1511                     ; 699   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
1513  0192 7b08          	ld	a,(OFST+7,sp)
1514  0194 4a            	dec	a
1515  0195 2606          	jrne	L716
1516                     ; 701     TIM3->CCER1 |= TIM_CCER1_CC2P;
1518  0197 721a528b      	bset	21131,#5
1520  019b 2004          	jra	L126
1521  019d               L716:
1522                     ; 705     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
1524  019d 721b528b      	bres	21131,#5
1525  01a1               L126:
1526                     ; 710   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
1528  01a1 7b09          	ld	a,(OFST+8,sp)
1529  01a3 4a            	dec	a
1530  01a4 2606          	jrne	L326
1531                     ; 712     TIM3->OISR |= TIM_OISR_OIS2;
1533  01a6 72145296      	bset	21142,#2
1535  01aa 2004          	jra	L526
1536  01ac               L326:
1537                     ; 716     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS2);
1539  01ac 72155296      	bres	21142,#2
1540  01b0               L526:
1541                     ; 720   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
1543  01b0 7b06          	ld	a,(OFST+5,sp)
1544  01b2 c75293        	ld	21139,a
1545                     ; 721   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
1547  01b5 7b07          	ld	a,(OFST+6,sp)
1548  01b7 c75294        	ld	21140,a
1549                     ; 722 }
1552  01ba 5b03          	addw	sp,#3
1553  01bc 81            	ret	
1751                     ; 751 void TIM3_BKRConfig(TIM3_OSSIState_TypeDef TIM3_OSSIState,
1751                     ; 752                     TIM3_LockLevel_TypeDef TIM3_LockLevel,
1751                     ; 753                     TIM3_BreakState_TypeDef TIM3_BreakState,
1751                     ; 754                     TIM3_BreakPolarity_TypeDef TIM3_BreakPolarity,
1751                     ; 755                     TIM3_AutomaticOutput_TypeDef TIM3_AutomaticOutput)
1751                     ; 756 
1751                     ; 757 {
1752                     	switch	.text
1753  01bd               _TIM3_BKRConfig:
1755  01bd 89            	pushw	x
1756  01be 88            	push	a
1757       00000001      OFST:	set	1
1760                     ; 759   assert_param(IS_TIM3_OSSI_STATE(TIM3_OSSIState));
1762                     ; 760   assert_param(IS_TIM3_LOCK_LEVEL(TIM3_LockLevel));
1764                     ; 761   assert_param(IS_TIM3_BREAK_STATE(TIM3_BreakState));
1766                     ; 762   assert_param(IS_TIM3_BREAK_POLARITY(TIM3_BreakPolarity));
1768                     ; 763   assert_param(IS_TIM3_AUTOMATIC_OUTPUT_STATE(TIM3_AutomaticOutput));
1770                     ; 769   TIM3->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM3_OSSIState | (uint8_t)TIM3_LockLevel) | \
1770                     ; 770                                   (uint8_t)((uint8_t)TIM3_BreakState | (uint8_t)TIM3_BreakPolarity)) | \
1770                     ; 771                                   TIM3_AutomaticOutput));
1772  01bf 7b06          	ld	a,(OFST+5,sp)
1773  01c1 1a07          	or	a,(OFST+6,sp)
1774  01c3 6b01          	ld	(OFST+0,sp),a
1775  01c5 9f            	ld	a,xl
1776  01c6 1a02          	or	a,(OFST+1,sp)
1777  01c8 1a01          	or	a,(OFST+0,sp)
1778  01ca 1a08          	or	a,(OFST+7,sp)
1779  01cc c75295        	ld	21141,a
1780                     ; 772 }
1783  01cf 5b03          	addw	sp,#3
1784  01d1 81            	ret	
1820                     ; 780 void TIM3_CtrlPWMOutputs(FunctionalState NewState)
1820                     ; 781 {
1821                     	switch	.text
1822  01d2               _TIM3_CtrlPWMOutputs:
1826                     ; 783   assert_param(IS_FUNCTIONAL_STATE(NewState));
1828                     ; 787   if (NewState != DISABLE)
1830  01d2 4d            	tnz	a
1831  01d3 2705          	jreq	L757
1832                     ; 789     TIM3->BKR |= TIM_BKR_MOE ;
1834  01d5 721e5295      	bset	21141,#7
1837  01d9 81            	ret	
1838  01da               L757:
1839                     ; 793     TIM3->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1841  01da 721f5295      	bres	21141,#7
1842                     ; 795 }
1845  01de 81            	ret	
1910                     ; 815 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel,
1910                     ; 816                      TIM3_OCMode_TypeDef TIM3_OCMode)
1910                     ; 817 {
1911                     	switch	.text
1912  01df               _TIM3_SelectOCxM:
1914  01df 89            	pushw	x
1915       00000000      OFST:	set	0
1918                     ; 819   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1920                     ; 820   assert_param(IS_TIM3_OCM(TIM3_OCMode));
1922                     ; 822   if (TIM3_Channel == TIM3_Channel_1)
1924  01e0 9e            	ld	a,xh
1925  01e1 4d            	tnz	a
1926  01e2 2615          	jrne	L5101
1927                     ; 825     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1929  01e4 7211528b      	bres	21131,#0
1930                     ; 828     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
1932  01e8 c65289        	ld	a,21129
1933  01eb a48f          	and	a,#143
1934  01ed c75289        	ld	21129,a
1935                     ; 831     TIM3->CCMR1 |= (uint8_t)TIM3_OCMode;
1937  01f0 9f            	ld	a,xl
1938  01f1 ca5289        	or	a,21129
1939  01f4 c75289        	ld	21129,a
1941  01f7 2014          	jra	L7101
1942  01f9               L5101:
1943                     ; 836     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1945  01f9 7219528b      	bres	21131,#4
1946                     ; 839     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
1948  01fd c6528a        	ld	a,21130
1949  0200 a48f          	and	a,#143
1950  0202 c7528a        	ld	21130,a
1951                     ; 842     TIM3->CCMR2 |= (uint8_t)TIM3_OCMode;
1953  0205 c6528a        	ld	a,21130
1954  0208 1a02          	or	a,(OFST+2,sp)
1955  020a c7528a        	ld	21130,a
1956  020d               L7101:
1957                     ; 844 }
1960  020d 85            	popw	x
1961  020e 81            	ret	
1993                     ; 852 void TIM3_SetCompare1(uint16_t Compare)
1993                     ; 853 {
1994                     	switch	.text
1995  020f               _TIM3_SetCompare1:
1999                     ; 855   TIM3->CCR1H = (uint8_t)(Compare >> 8);
2001  020f 9e            	ld	a,xh
2002  0210 c75291        	ld	21137,a
2003                     ; 856   TIM3->CCR1L = (uint8_t)(Compare);
2005  0213 9f            	ld	a,xl
2006  0214 c75292        	ld	21138,a
2007                     ; 857 }
2010  0217 81            	ret	
2042                     ; 865 void TIM3_SetCompare2(uint16_t Compare)
2042                     ; 866 {
2043                     	switch	.text
2044  0218               _TIM3_SetCompare2:
2048                     ; 868   TIM3->CCR2H = (uint8_t)(Compare >> 8);
2050  0218 9e            	ld	a,xh
2051  0219 c75293        	ld	21139,a
2052                     ; 869   TIM3->CCR2L = (uint8_t)(Compare);
2054  021c 9f            	ld	a,xl
2055  021d c75294        	ld	21140,a
2056                     ; 870 }
2059  0220 81            	ret	
2124                     ; 880 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2124                     ; 881 {
2125                     	switch	.text
2126  0221               _TIM3_ForcedOC1Config:
2128  0221 88            	push	a
2129  0222 88            	push	a
2130       00000001      OFST:	set	1
2133                     ; 882   uint8_t tmpccmr1 = 0;
2135                     ; 885   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
2137                     ; 887   tmpccmr1 = TIM3->CCMR1;
2139  0223 c65289        	ld	a,21129
2140                     ; 890   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
2142  0226 a48f          	and	a,#143
2143                     ; 893   tmpccmr1 |= (uint8_t)TIM3_ForcedAction;
2145  0228 1a02          	or	a,(OFST+1,sp)
2146                     ; 895   TIM3->CCMR1 = tmpccmr1;
2148  022a c75289        	ld	21129,a
2149                     ; 896 }
2152  022d 85            	popw	x
2153  022e 81            	ret	
2196                     ; 906 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2196                     ; 907 {
2197                     	switch	.text
2198  022f               _TIM3_ForcedOC2Config:
2200  022f 88            	push	a
2201  0230 88            	push	a
2202       00000001      OFST:	set	1
2205                     ; 908   uint8_t tmpccmr2 = 0;
2207                     ; 911   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
2209                     ; 913   tmpccmr2 = TIM3->CCMR2;
2211  0231 c6528a        	ld	a,21130
2212                     ; 916   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
2214  0234 a48f          	and	a,#143
2215                     ; 919   tmpccmr2 |= (uint8_t)TIM3_ForcedAction;
2217  0236 1a02          	or	a,(OFST+1,sp)
2218                     ; 921   TIM3->CCMR2 = tmpccmr2;
2220  0238 c7528a        	ld	21130,a
2221                     ; 922 }
2224  023b 85            	popw	x
2225  023c 81            	ret	
2261                     ; 930 void TIM3_OC1PreloadConfig(FunctionalState NewState)
2261                     ; 931 {
2262                     	switch	.text
2263  023d               _TIM3_OC1PreloadConfig:
2267                     ; 933   assert_param(IS_FUNCTIONAL_STATE(NewState));
2269                     ; 936   if (NewState != DISABLE)
2271  023d 4d            	tnz	a
2272  023e 2705          	jreq	L7311
2273                     ; 938     TIM3->CCMR1 |= TIM_CCMR_OCxPE ;
2275  0240 72165289      	bset	21129,#3
2278  0244 81            	ret	
2279  0245               L7311:
2280                     ; 942     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2282  0245 72175289      	bres	21129,#3
2283                     ; 944 }
2286  0249 81            	ret	
2322                     ; 952 void TIM3_OC2PreloadConfig(FunctionalState NewState)
2322                     ; 953 {
2323                     	switch	.text
2324  024a               _TIM3_OC2PreloadConfig:
2328                     ; 955   assert_param(IS_FUNCTIONAL_STATE(NewState));
2330                     ; 958   if (NewState != DISABLE)
2332  024a 4d            	tnz	a
2333  024b 2705          	jreq	L1611
2334                     ; 960     TIM3->CCMR2 |= TIM_CCMR_OCxPE ;
2336  024d 7216528a      	bset	21130,#3
2339  0251 81            	ret	
2340  0252               L1611:
2341                     ; 964     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2343  0252 7217528a      	bres	21130,#3
2344                     ; 966 }
2347  0256 81            	ret	
2382                     ; 974 void TIM3_OC1FastConfig(FunctionalState NewState)
2382                     ; 975 {
2383                     	switch	.text
2384  0257               _TIM3_OC1FastConfig:
2388                     ; 977   assert_param(IS_FUNCTIONAL_STATE(NewState));
2390                     ; 980   if (NewState != DISABLE)
2392  0257 4d            	tnz	a
2393  0258 2705          	jreq	L3021
2394                     ; 982     TIM3->CCMR1 |= TIM_CCMR_OCxFE ;
2396  025a 72145289      	bset	21129,#2
2399  025e 81            	ret	
2400  025f               L3021:
2401                     ; 986     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2403  025f 72155289      	bres	21129,#2
2404                     ; 988 }
2407  0263 81            	ret	
2442                     ; 997 void TIM3_OC2FastConfig(FunctionalState NewState)
2442                     ; 998 {
2443                     	switch	.text
2444  0264               _TIM3_OC2FastConfig:
2448                     ; 1000   assert_param(IS_FUNCTIONAL_STATE(NewState));
2450                     ; 1003   if (NewState != DISABLE)
2452  0264 4d            	tnz	a
2453  0265 2705          	jreq	L5221
2454                     ; 1005     TIM3->CCMR2 |= TIM_CCMR_OCxFE ;
2456  0267 7214528a      	bset	21130,#2
2459  026b 81            	ret	
2460  026c               L5221:
2461                     ; 1009     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2463  026c 7215528a      	bres	21130,#2
2464                     ; 1011 }
2467  0270 81            	ret	
2503                     ; 1021 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2503                     ; 1022 {
2504                     	switch	.text
2505  0271               _TIM3_OC1PolarityConfig:
2509                     ; 1024   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
2511                     ; 1027   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
2513  0271 4a            	dec	a
2514  0272 2605          	jrne	L7421
2515                     ; 1029     TIM3->CCER1 |= TIM_CCER1_CC1P ;
2517  0274 7212528b      	bset	21131,#1
2520  0278 81            	ret	
2521  0279               L7421:
2522                     ; 1033     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
2524  0279 7213528b      	bres	21131,#1
2525                     ; 1035 }
2528  027d 81            	ret	
2564                     ; 1045 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2564                     ; 1046 {
2565                     	switch	.text
2566  027e               _TIM3_OC2PolarityConfig:
2570                     ; 1048   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
2572                     ; 1051   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
2574  027e 4a            	dec	a
2575  027f 2605          	jrne	L1721
2576                     ; 1053     TIM3->CCER1 |= TIM_CCER1_CC2P ;
2578  0281 721a528b      	bset	21131,#5
2581  0285 81            	ret	
2582  0286               L1721:
2583                     ; 1057     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
2585  0286 721b528b      	bres	21131,#5
2586                     ; 1059 }
2589  028a 81            	ret	
2634                     ; 1071 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel,
2634                     ; 1072                  FunctionalState NewState)
2634                     ; 1073 {
2635                     	switch	.text
2636  028b               _TIM3_CCxCmd:
2638  028b 89            	pushw	x
2639       00000000      OFST:	set	0
2642                     ; 1075   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
2644                     ; 1076   assert_param(IS_FUNCTIONAL_STATE(NewState));
2646                     ; 1078   if (TIM3_Channel == TIM3_Channel_1)
2648  028c 9e            	ld	a,xh
2649  028d 4d            	tnz	a
2650  028e 2610          	jrne	L7131
2651                     ; 1081     if (NewState != DISABLE)
2653  0290 9f            	ld	a,xl
2654  0291 4d            	tnz	a
2655  0292 2706          	jreq	L1231
2656                     ; 1083       TIM3->CCER1 |= TIM_CCER1_CC1E ;
2658  0294 7210528b      	bset	21131,#0
2660  0298 2014          	jra	L5231
2661  029a               L1231:
2662                     ; 1087       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
2664  029a 7211528b      	bres	21131,#0
2665  029e 200e          	jra	L5231
2666  02a0               L7131:
2667                     ; 1094     if (NewState != DISABLE)
2669  02a0 7b02          	ld	a,(OFST+2,sp)
2670  02a2 2706          	jreq	L7231
2671                     ; 1096       TIM3->CCER1 |= TIM_CCER1_CC2E;
2673  02a4 7218528b      	bset	21131,#4
2675  02a8 2004          	jra	L5231
2676  02aa               L7231:
2677                     ; 1100       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
2679  02aa 7219528b      	bres	21131,#4
2680  02ae               L5231:
2681                     ; 1103 }
2684  02ae 85            	popw	x
2685  02af 81            	ret	
2847                     ; 1181 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
2847                     ; 1182                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
2847                     ; 1183                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
2847                     ; 1184                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
2847                     ; 1185                  uint8_t TIM3_ICFilter)
2847                     ; 1186 {
2848                     	switch	.text
2849  02b0               _TIM3_ICInit:
2851  02b0 89            	pushw	x
2852       00000000      OFST:	set	0
2855                     ; 1188   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
2857                     ; 1190   if (TIM3_Channel == TIM3_Channel_1)
2859  02b1 9e            	ld	a,xh
2860  02b2 4d            	tnz	a
2861  02b3 2614          	jrne	L5241
2862                     ; 1193     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection, TIM3_ICFilter);
2864  02b5 7b07          	ld	a,(OFST+7,sp)
2865  02b7 88            	push	a
2866  02b8 7b06          	ld	a,(OFST+6,sp)
2867  02ba 97            	ld	xl,a
2868  02bb 7b03          	ld	a,(OFST+3,sp)
2869  02bd 95            	ld	xh,a
2870  02be cd054d        	call	L3_TI1_Config
2872  02c1 84            	pop	a
2873                     ; 1196     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
2875  02c2 7b06          	ld	a,(OFST+6,sp)
2876  02c4 cd037e        	call	_TIM3_SetIC1Prescaler
2879  02c7 2012          	jra	L7241
2880  02c9               L5241:
2881                     ; 1201     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection, TIM3_ICFilter);
2883  02c9 7b07          	ld	a,(OFST+7,sp)
2884  02cb 88            	push	a
2885  02cc 7b06          	ld	a,(OFST+6,sp)
2886  02ce 97            	ld	xl,a
2887  02cf 7b03          	ld	a,(OFST+3,sp)
2888  02d1 95            	ld	xh,a
2889  02d2 cd0585        	call	L5_TI2_Config
2891  02d5 84            	pop	a
2892                     ; 1204     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
2894  02d6 7b06          	ld	a,(OFST+6,sp)
2895  02d8 cd038c        	call	_TIM3_SetIC2Prescaler
2897  02db               L7241:
2898                     ; 1206 }
2901  02db 85            	popw	x
2902  02dc 81            	ret	
2992                     ; 1232 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
2992                     ; 1233                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
2992                     ; 1234                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
2992                     ; 1235                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
2992                     ; 1236                      uint8_t TIM3_ICFilter)
2992                     ; 1237 {
2993                     	switch	.text
2994  02dd               _TIM3_PWMIConfig:
2996  02dd 89            	pushw	x
2997  02de 89            	pushw	x
2998       00000002      OFST:	set	2
3001                     ; 1238   uint8_t icpolarity = TIM3_ICPolarity_Rising;
3003                     ; 1239   uint8_t icselection = TIM3_ICSelection_DirectTI;
3005                     ; 1242   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
3007                     ; 1245   if (TIM3_ICPolarity == TIM3_ICPolarity_Rising)
3009  02df 9f            	ld	a,xl
3010  02e0 4d            	tnz	a
3011  02e1 2605          	jrne	L1741
3012                     ; 1247     icpolarity = TIM3_ICPolarity_Falling;
3014  02e3 4c            	inc	a
3015  02e4 6b01          	ld	(OFST-1,sp),a
3017  02e6 2002          	jra	L3741
3018  02e8               L1741:
3019                     ; 1251     icpolarity = TIM3_ICPolarity_Rising;
3021  02e8 0f01          	clr	(OFST-1,sp)
3022  02ea               L3741:
3023                     ; 1255   if (TIM3_ICSelection == TIM3_ICSelection_DirectTI)
3025  02ea 7b07          	ld	a,(OFST+5,sp)
3026  02ec 4a            	dec	a
3027  02ed 2604          	jrne	L5741
3028                     ; 1257     icselection = TIM3_ICSelection_IndirectTI;
3030  02ef a602          	ld	a,#2
3032  02f1 2002          	jra	L7741
3033  02f3               L5741:
3034                     ; 1261     icselection = TIM3_ICSelection_DirectTI;
3036  02f3 a601          	ld	a,#1
3037  02f5               L7741:
3038  02f5 6b02          	ld	(OFST+0,sp),a
3039                     ; 1264   if (TIM3_Channel == TIM3_Channel_1)
3041  02f7 7b03          	ld	a,(OFST+1,sp)
3042  02f9 2624          	jrne	L1051
3043                     ; 1267     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection,
3043                     ; 1268                TIM3_ICFilter);
3045  02fb 7b09          	ld	a,(OFST+7,sp)
3046  02fd 88            	push	a
3047  02fe 7b08          	ld	a,(OFST+6,sp)
3048  0300 97            	ld	xl,a
3049  0301 7b05          	ld	a,(OFST+3,sp)
3050  0303 95            	ld	xh,a
3051  0304 cd054d        	call	L3_TI1_Config
3053  0307 84            	pop	a
3054                     ; 1271     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
3056  0308 7b08          	ld	a,(OFST+6,sp)
3057  030a ad72          	call	_TIM3_SetIC1Prescaler
3059                     ; 1274     TI2_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
3061  030c 7b09          	ld	a,(OFST+7,sp)
3062  030e 88            	push	a
3063  030f 7b03          	ld	a,(OFST+1,sp)
3064  0311 97            	ld	xl,a
3065  0312 7b02          	ld	a,(OFST+0,sp)
3066  0314 95            	ld	xh,a
3067  0315 cd0585        	call	L5_TI2_Config
3069  0318 84            	pop	a
3070                     ; 1277     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
3072  0319 7b08          	ld	a,(OFST+6,sp)
3073  031b ad6f          	call	_TIM3_SetIC2Prescaler
3076  031d 2022          	jra	L3051
3077  031f               L1051:
3078                     ; 1282     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection,
3078                     ; 1283                TIM3_ICFilter);
3080  031f 7b09          	ld	a,(OFST+7,sp)
3081  0321 88            	push	a
3082  0322 7b08          	ld	a,(OFST+6,sp)
3083  0324 97            	ld	xl,a
3084  0325 7b05          	ld	a,(OFST+3,sp)
3085  0327 95            	ld	xh,a
3086  0328 cd0585        	call	L5_TI2_Config
3088  032b 84            	pop	a
3089                     ; 1286     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
3091  032c 7b08          	ld	a,(OFST+6,sp)
3092  032e ad5c          	call	_TIM3_SetIC2Prescaler
3094                     ; 1289     TI1_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
3096  0330 7b09          	ld	a,(OFST+7,sp)
3097  0332 88            	push	a
3098  0333 7b03          	ld	a,(OFST+1,sp)
3099  0335 97            	ld	xl,a
3100  0336 7b02          	ld	a,(OFST+0,sp)
3101  0338 95            	ld	xh,a
3102  0339 cd054d        	call	L3_TI1_Config
3104  033c 84            	pop	a
3105                     ; 1292     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
3107  033d 7b08          	ld	a,(OFST+6,sp)
3108  033f ad3d          	call	_TIM3_SetIC1Prescaler
3110  0341               L3051:
3111                     ; 1294 }
3114  0341 5b04          	addw	sp,#4
3115  0343 81            	ret	
3161                     ; 1301 uint16_t TIM3_GetCapture1(void)
3161                     ; 1302 {
3162                     	switch	.text
3163  0344               _TIM3_GetCapture1:
3165  0344 5204          	subw	sp,#4
3166       00000004      OFST:	set	4
3169                     ; 1303   uint16_t tmpccr1 = 0;
3171                     ; 1306   tmpccr1h = TIM3->CCR1H;
3173  0346 c65291        	ld	a,21137
3174  0349 6b02          	ld	(OFST-2,sp),a
3175                     ; 1307   tmpccr1l = TIM3->CCR1L;
3177  034b c65292        	ld	a,21138
3178  034e 6b01          	ld	(OFST-3,sp),a
3179                     ; 1309   tmpccr1 = (uint16_t)(tmpccr1l);
3181  0350 5f            	clrw	x
3182  0351 97            	ld	xl,a
3183  0352 1f03          	ldw	(OFST-1,sp),x
3184                     ; 1310   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3186  0354 5f            	clrw	x
3187  0355 7b02          	ld	a,(OFST-2,sp)
3188  0357 97            	ld	xl,a
3189  0358 7b04          	ld	a,(OFST+0,sp)
3190  035a 01            	rrwa	x,a
3191  035b 1a03          	or	a,(OFST-1,sp)
3192  035d 01            	rrwa	x,a
3193                     ; 1312   return ((uint16_t)tmpccr1);
3197  035e 5b04          	addw	sp,#4
3198  0360 81            	ret	
3244                     ; 1320 uint16_t TIM3_GetCapture2(void)
3244                     ; 1321 {
3245                     	switch	.text
3246  0361               _TIM3_GetCapture2:
3248  0361 5204          	subw	sp,#4
3249       00000004      OFST:	set	4
3252                     ; 1322   uint16_t tmpccr2 = 0;
3254                     ; 1325   tmpccr2h = TIM3->CCR2H;
3256  0363 c65293        	ld	a,21139
3257  0366 6b02          	ld	(OFST-2,sp),a
3258                     ; 1326   tmpccr2l = TIM3->CCR2L;
3260  0368 c65294        	ld	a,21140
3261  036b 6b01          	ld	(OFST-3,sp),a
3262                     ; 1328   tmpccr2 = (uint16_t)(tmpccr2l);
3264  036d 5f            	clrw	x
3265  036e 97            	ld	xl,a
3266  036f 1f03          	ldw	(OFST-1,sp),x
3267                     ; 1329   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3269  0371 5f            	clrw	x
3270  0372 7b02          	ld	a,(OFST-2,sp)
3271  0374 97            	ld	xl,a
3272  0375 7b04          	ld	a,(OFST+0,sp)
3273  0377 01            	rrwa	x,a
3274  0378 1a03          	or	a,(OFST-1,sp)
3275  037a 01            	rrwa	x,a
3276                     ; 1331   return ((uint16_t)tmpccr2);
3280  037b 5b04          	addw	sp,#4
3281  037d 81            	ret	
3324                     ; 1344 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
3324                     ; 1345 {
3325                     	switch	.text
3326  037e               _TIM3_SetIC1Prescaler:
3328  037e 88            	push	a
3329  037f 88            	push	a
3330       00000001      OFST:	set	1
3333                     ; 1346   uint8_t tmpccmr1 = 0;
3335                     ; 1349   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC1Prescaler));
3337                     ; 1351   tmpccmr1 = TIM3->CCMR1;
3339  0380 c65289        	ld	a,21129
3340                     ; 1354   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3342  0383 a4f3          	and	a,#243
3343                     ; 1357   tmpccmr1 |= (uint8_t)TIM3_IC1Prescaler;
3345  0385 1a02          	or	a,(OFST+1,sp)
3346                     ; 1359   TIM3->CCMR1 = tmpccmr1;
3348  0387 c75289        	ld	21129,a
3349                     ; 1360 }
3352  038a 85            	popw	x
3353  038b 81            	ret	
3396                     ; 1372 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
3396                     ; 1373 {
3397                     	switch	.text
3398  038c               _TIM3_SetIC2Prescaler:
3400  038c 88            	push	a
3401  038d 88            	push	a
3402       00000001      OFST:	set	1
3405                     ; 1374   uint8_t tmpccmr2 = 0;
3407                     ; 1377   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC2Prescaler));
3409                     ; 1379   tmpccmr2 = TIM3->CCMR2;
3411  038e c6528a        	ld	a,21130
3412                     ; 1382   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3414  0391 a4f3          	and	a,#243
3415                     ; 1385   tmpccmr2 |= (uint8_t)TIM3_IC2Prescaler;
3417  0393 1a02          	or	a,(OFST+1,sp)
3418                     ; 1387   TIM3->CCMR2 = tmpccmr2;
3420  0395 c7528a        	ld	21130,a
3421                     ; 1388 }
3424  0398 85            	popw	x
3425  0399 81            	ret	
3511                     ; 1419 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
3511                     ; 1420 {
3512                     	switch	.text
3513  039a               _TIM3_ITConfig:
3515  039a 89            	pushw	x
3516       00000000      OFST:	set	0
3519                     ; 1422   assert_param(IS_TIM3_IT(TIM3_IT));
3521                     ; 1423   assert_param(IS_FUNCTIONAL_STATE(NewState));
3523                     ; 1425   if (NewState != DISABLE)
3525  039b 9f            	ld	a,xl
3526  039c 4d            	tnz	a
3527  039d 2706          	jreq	L5461
3528                     ; 1428     TIM3->IER |= (uint8_t)TIM3_IT;
3530  039f 9e            	ld	a,xh
3531  03a0 ca5285        	or	a,21125
3533  03a3 2006          	jra	L7461
3534  03a5               L5461:
3535                     ; 1433     TIM3->IER &= (uint8_t)(~(uint8_t)TIM3_IT);
3537  03a5 7b01          	ld	a,(OFST+1,sp)
3538  03a7 43            	cpl	a
3539  03a8 c45285        	and	a,21125
3540  03ab               L7461:
3541  03ab c75285        	ld	21125,a
3542                     ; 1435 }
3545  03ae 85            	popw	x
3546  03af 81            	ret	
3627                     ; 1448 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
3627                     ; 1449 {
3628                     	switch	.text
3629  03b0               _TIM3_GenerateEvent:
3633                     ; 1451   assert_param(IS_TIM3_EVENT_SOURCE((uint8_t)TIM3_EventSource));
3635                     ; 1454   TIM3->EGR |= (uint8_t)TIM3_EventSource;
3637  03b0 ca5288        	or	a,21128
3638  03b3 c75288        	ld	21128,a
3639                     ; 1455 }
3642  03b6 81            	ret	
3777                     ; 1470 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3777                     ; 1471 {
3778                     	switch	.text
3779  03b7               _TIM3_GetFlagStatus:
3781  03b7 89            	pushw	x
3782  03b8 89            	pushw	x
3783       00000002      OFST:	set	2
3786                     ; 1472   FlagStatus bitstatus = RESET;
3788                     ; 1473   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3792                     ; 1476   assert_param(IS_TIM3_GET_FLAG(TIM3_FLAG));
3794                     ; 1478   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)(TIM3_FLAG));
3796  03b9 9f            	ld	a,xl
3797  03ba c45286        	and	a,21126
3798  03bd 6b01          	ld	(OFST-1,sp),a
3799                     ; 1479   tim3_flag_h = (uint8_t)(TIM3->SR2 & (uint8_t)((uint16_t)TIM3_FLAG >> 8));
3801  03bf c65287        	ld	a,21127
3802  03c2 1403          	and	a,(OFST+1,sp)
3803  03c4 6b02          	ld	(OFST+0,sp),a
3804                     ; 1481   if ((uint8_t)(tim3_flag_l | tim3_flag_h) != 0)
3806  03c6 1a01          	or	a,(OFST-1,sp)
3807  03c8 2702          	jreq	L5671
3808                     ; 1483     bitstatus = SET;
3810  03ca a601          	ld	a,#1
3812  03cc               L5671:
3813                     ; 1487     bitstatus = RESET;
3815                     ; 1489   return ((FlagStatus)bitstatus);
3819  03cc 5b04          	addw	sp,#4
3820  03ce 81            	ret	
3855                     ; 1503 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3855                     ; 1504 {
3856                     	switch	.text
3857  03cf               _TIM3_ClearFlag:
3859  03cf 89            	pushw	x
3860       00000000      OFST:	set	0
3863                     ; 1506   assert_param(IS_TIM3_CLEAR_FLAG((uint16_t)TIM3_FLAG));
3865                     ; 1508   TIM3->SR1 = (uint8_t)(~(uint8_t)(TIM3_FLAG));
3867  03d0 9f            	ld	a,xl
3868  03d1 43            	cpl	a
3869  03d2 c75286        	ld	21126,a
3870                     ; 1509   TIM3->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM3_FLAG >> 8));
3872  03d5 7b01          	ld	a,(OFST+1,sp)
3873  03d7 43            	cpl	a
3874  03d8 c75287        	ld	21127,a
3875                     ; 1510 }
3878  03db 85            	popw	x
3879  03dc 81            	ret	
3939                     ; 1523 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3939                     ; 1524 {
3940                     	switch	.text
3941  03dd               _TIM3_GetITStatus:
3943  03dd 88            	push	a
3944  03de 89            	pushw	x
3945       00000002      OFST:	set	2
3948                     ; 1525   ITStatus bitstatus = RESET;
3950                     ; 1527   uint8_t TIM3_itStatus = 0x0, TIM3_itEnable = 0x0;
3954                     ; 1530   assert_param(IS_TIM3_GET_IT(TIM3_IT));
3956                     ; 1532   TIM3_itStatus = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_IT);
3958  03df c45286        	and	a,21126
3959  03e2 6b01          	ld	(OFST-1,sp),a
3960                     ; 1534   TIM3_itEnable = (uint8_t)(TIM3->IER & (uint8_t)TIM3_IT);
3962  03e4 c65285        	ld	a,21125
3963  03e7 1403          	and	a,(OFST+1,sp)
3964  03e9 6b02          	ld	(OFST+0,sp),a
3965                     ; 1536   if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET))
3967  03eb 7b01          	ld	a,(OFST-1,sp)
3968  03ed 2708          	jreq	L5302
3970  03ef 7b02          	ld	a,(OFST+0,sp)
3971  03f1 2704          	jreq	L5302
3972                     ; 1538     bitstatus = (ITStatus)SET;
3974  03f3 a601          	ld	a,#1
3976  03f5 2001          	jra	L7302
3977  03f7               L5302:
3978                     ; 1542     bitstatus = (ITStatus)RESET;
3980  03f7 4f            	clr	a
3981  03f8               L7302:
3982                     ; 1544   return ((ITStatus)bitstatus);
3986  03f8 5b03          	addw	sp,#3
3987  03fa 81            	ret	
4023                     ; 1558 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
4023                     ; 1559 {
4024                     	switch	.text
4025  03fb               _TIM3_ClearITPendingBit:
4029                     ; 1561   assert_param(IS_TIM3_IT(TIM3_IT));
4031                     ; 1564   TIM3->SR1 = (uint8_t)(~(uint8_t)TIM3_IT);
4033  03fb 43            	cpl	a
4034  03fc c75286        	ld	21126,a
4035                     ; 1565 }
4038  03ff 81            	ret	
4111                     ; 1578 void TIM3_DMACmd( TIM3_DMASource_TypeDef TIM3_DMASource, FunctionalState NewState)
4111                     ; 1579 {
4112                     	switch	.text
4113  0400               _TIM3_DMACmd:
4115  0400 89            	pushw	x
4116       00000000      OFST:	set	0
4119                     ; 1581   assert_param(IS_FUNCTIONAL_STATE(NewState));
4121                     ; 1582   assert_param(IS_TIM3_DMA_SOURCE(TIM3_DMASource));
4123                     ; 1584   if (NewState != DISABLE)
4125  0401 9f            	ld	a,xl
4126  0402 4d            	tnz	a
4127  0403 2706          	jreq	L3112
4128                     ; 1587     TIM3->DER |= TIM3_DMASource;
4130  0405 9e            	ld	a,xh
4131  0406 ca5284        	or	a,21124
4133  0409 2006          	jra	L5112
4134  040b               L3112:
4135                     ; 1592     TIM3->DER &= (uint8_t)(~TIM3_DMASource);
4137  040b 7b01          	ld	a,(OFST+1,sp)
4138  040d 43            	cpl	a
4139  040e c45284        	and	a,21124
4140  0411               L5112:
4141  0411 c75284        	ld	21124,a
4142                     ; 1594 }
4145  0414 85            	popw	x
4146  0415 81            	ret	
4181                     ; 1602 void TIM3_SelectCCDMA(FunctionalState NewState)
4181                     ; 1603 {
4182                     	switch	.text
4183  0416               _TIM3_SelectCCDMA:
4187                     ; 1605   assert_param(IS_FUNCTIONAL_STATE(NewState));
4189                     ; 1607   if (NewState != DISABLE)
4191  0416 4d            	tnz	a
4192  0417 2705          	jreq	L5312
4193                     ; 1610     TIM3->CR2 |= TIM_CR2_CCDS;
4195  0419 72165281      	bset	21121,#3
4198  041d 81            	ret	
4199  041e               L5312:
4200                     ; 1615     TIM3->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
4202  041e 72175281      	bres	21121,#3
4203                     ; 1617 }
4206  0422 81            	ret	
4230                     ; 1641 void TIM3_InternalClockConfig(void)
4230                     ; 1642 {
4231                     	switch	.text
4232  0423               _TIM3_InternalClockConfig:
4236                     ; 1644   TIM3->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
4238  0423 c65282        	ld	a,21122
4239  0426 a4f8          	and	a,#248
4240  0428 c75282        	ld	21122,a
4241                     ; 1645 }
4244  042b 81            	ret	
4331                     ; 1662 void TIM3_TIxExternalClockConfig(TIM3_TIxExternalCLK1Source_TypeDef TIM3_TIxExternalCLKSource,
4331                     ; 1663                                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
4331                     ; 1664                                  uint8_t ICFilter)
4331                     ; 1665 {
4332                     	switch	.text
4333  042c               _TIM3_TIxExternalClockConfig:
4335  042c 89            	pushw	x
4336       00000000      OFST:	set	0
4339                     ; 1667   assert_param(IS_TIM3_TIXCLK_SOURCE(TIM3_TIxExternalCLKSource));
4341                     ; 1668   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
4343                     ; 1669   assert_param(IS_TIM3_IC_FILTER(ICFilter));
4345                     ; 1672   if (TIM3_TIxExternalCLKSource == TIM3_TIxExternalCLK1Source_TI2)
4347  042d 9e            	ld	a,xh
4348  042e a160          	cp	a,#96
4349  0430 260e          	jrne	L7022
4350                     ; 1674     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, ICFilter);
4352  0432 7b05          	ld	a,(OFST+5,sp)
4353  0434 88            	push	a
4354  0435 ae0001        	ldw	x,#1
4355  0438 7b03          	ld	a,(OFST+3,sp)
4356  043a 95            	ld	xh,a
4357  043b cd0585        	call	L5_TI2_Config
4360  043e 200c          	jra	L1122
4361  0440               L7022:
4362                     ; 1678     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, ICFilter);
4364  0440 7b05          	ld	a,(OFST+5,sp)
4365  0442 88            	push	a
4366  0443 ae0001        	ldw	x,#1
4367  0446 7b03          	ld	a,(OFST+3,sp)
4368  0448 95            	ld	xh,a
4369  0449 cd054d        	call	L3_TI1_Config
4371  044c               L1122:
4372  044c 84            	pop	a
4373                     ; 1682   TIM3_SelectInputTrigger((TIM3_TRGSelection_TypeDef)TIM3_TIxExternalCLKSource);
4375  044d 7b01          	ld	a,(OFST+1,sp)
4376  044f ad46          	call	_TIM3_SelectInputTrigger
4378                     ; 1685   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
4380  0451 c65282        	ld	a,21122
4381  0454 aa07          	or	a,#7
4382  0456 c75282        	ld	21122,a
4383                     ; 1686 }
4386  0459 85            	popw	x
4387  045a 81            	ret	
4502                     ; 1704 void TIM3_ETRClockMode1Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
4502                     ; 1705                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
4502                     ; 1706                               uint8_t ExtTRGFilter)
4502                     ; 1707 {
4503                     	switch	.text
4504  045b               _TIM3_ETRClockMode1Config:
4506  045b 89            	pushw	x
4507       00000000      OFST:	set	0
4510                     ; 1709   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, ExtTRGFilter);
4512  045c 7b05          	ld	a,(OFST+5,sp)
4513  045e 88            	push	a
4514  045f 7b02          	ld	a,(OFST+2,sp)
4515  0461 95            	ld	xh,a
4516  0462 ad6a          	call	_TIM3_ETRConfig
4518  0464 84            	pop	a
4519                     ; 1712   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
4521  0465 c65282        	ld	a,21122
4522  0468 a4f8          	and	a,#248
4523  046a c75282        	ld	21122,a
4524                     ; 1713   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
4526  046d c65282        	ld	a,21122
4527  0470 aa07          	or	a,#7
4528  0472 c75282        	ld	21122,a
4529                     ; 1716   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_TS);
4531  0475 c65282        	ld	a,21122
4532  0478 a48f          	and	a,#143
4533  047a c75282        	ld	21122,a
4534                     ; 1717   TIM3->SMCR |= (uint8_t)((TIM3_TRGSelection_TypeDef)TIM3_TRGSelection_ETRF);
4536  047d c65282        	ld	a,21122
4537  0480 aa70          	or	a,#112
4538  0482 c75282        	ld	21122,a
4539                     ; 1718 }
4542  0485 85            	popw	x
4543  0486 81            	ret	
4599                     ; 1736 void TIM3_ETRClockMode2Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
4599                     ; 1737                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
4599                     ; 1738                               uint8_t ExtTRGFilter)
4599                     ; 1739 {
4600                     	switch	.text
4601  0487               _TIM3_ETRClockMode2Config:
4603  0487 89            	pushw	x
4604       00000000      OFST:	set	0
4607                     ; 1741   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, ExtTRGFilter);
4609  0488 7b05          	ld	a,(OFST+5,sp)
4610  048a 88            	push	a
4611  048b 7b02          	ld	a,(OFST+2,sp)
4612  048d 95            	ld	xh,a
4613  048e ad3e          	call	_TIM3_ETRConfig
4615  0490 721c5283      	bset	21123,#6
4616  0494 84            	pop	a
4617                     ; 1744   TIM3->ETR |= TIM_ETR_ECE ;
4619                     ; 1745 }
4622  0495 85            	popw	x
4623  0496 81            	ret	
4737                     ; 1796 void TIM3_SelectInputTrigger(TIM3_TRGSelection_TypeDef TIM3_InputTriggerSource)
4737                     ; 1797 {
4738                     	switch	.text
4739  0497               _TIM3_SelectInputTrigger:
4741  0497 88            	push	a
4742  0498 88            	push	a
4743       00000001      OFST:	set	1
4746                     ; 1798   uint8_t tmpsmcr = 0;
4748                     ; 1801   assert_param(IS_TIM3_TRIGGER_SELECTION(TIM3_InputTriggerSource));
4750                     ; 1803   tmpsmcr = TIM3->SMCR;
4752  0499 c65282        	ld	a,21122
4753                     ; 1806   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
4755  049c a48f          	and	a,#143
4756                     ; 1807   tmpsmcr |= (uint8_t)TIM3_InputTriggerSource;
4758  049e 1a02          	or	a,(OFST+1,sp)
4759                     ; 1809   TIM3->SMCR = (uint8_t)tmpsmcr;
4761  04a0 c75282        	ld	21122,a
4762                     ; 1810 }
4765  04a3 85            	popw	x
4766  04a4 81            	ret	
4863                     ; 1824 void TIM3_SelectOutputTrigger(TIM3_TRGOSource_TypeDef TIM3_TRGOSource)
4863                     ; 1825 {
4864                     	switch	.text
4865  04a5               _TIM3_SelectOutputTrigger:
4867  04a5 88            	push	a
4868  04a6 88            	push	a
4869       00000001      OFST:	set	1
4872                     ; 1826   uint8_t tmpcr2 = 0;
4874                     ; 1829   assert_param(IS_TIM3_TRGO_SOURCE(TIM3_TRGOSource));
4876                     ; 1831   tmpcr2 = TIM3->CR2;
4878  04a7 c65281        	ld	a,21121
4879                     ; 1834   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
4881  04aa a48f          	and	a,#143
4882                     ; 1837   tmpcr2 |=  (uint8_t)TIM3_TRGOSource;
4884  04ac 1a02          	or	a,(OFST+1,sp)
4885                     ; 1839   TIM3->CR2 = tmpcr2;
4887  04ae c75281        	ld	21121,a
4888                     ; 1840 }
4891  04b1 85            	popw	x
4892  04b2 81            	ret	
4973                     ; 1852 void TIM3_SelectSlaveMode(TIM3_SlaveMode_TypeDef TIM3_SlaveMode)
4973                     ; 1853 {
4974                     	switch	.text
4975  04b3               _TIM3_SelectSlaveMode:
4977  04b3 88            	push	a
4978  04b4 88            	push	a
4979       00000001      OFST:	set	1
4982                     ; 1854   uint8_t tmpsmcr = 0;
4984                     ; 1857   assert_param(IS_TIM3_SLAVE_MODE(TIM3_SlaveMode));
4986                     ; 1859   tmpsmcr = TIM3->SMCR;
4988  04b5 c65282        	ld	a,21122
4989                     ; 1862   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
4991  04b8 a4f8          	and	a,#248
4992                     ; 1865   tmpsmcr |= (uint8_t)TIM3_SlaveMode;
4994  04ba 1a02          	or	a,(OFST+1,sp)
4995                     ; 1867   TIM3->SMCR = tmpsmcr;
4997  04bc c75282        	ld	21122,a
4998                     ; 1868 }
5001  04bf 85            	popw	x
5002  04c0 81            	ret	
5038                     ; 1876 void TIM3_SelectMasterSlaveMode(FunctionalState NewState)
5038                     ; 1877 {
5039                     	switch	.text
5040  04c1               _TIM3_SelectMasterSlaveMode:
5044                     ; 1879   assert_param(IS_FUNCTIONAL_STATE(NewState));
5046                     ; 1882   if (NewState != DISABLE)
5048  04c1 4d            	tnz	a
5049  04c2 2705          	jreq	L5642
5050                     ; 1884     TIM3->SMCR |= TIM_SMCR_MSM;
5052  04c4 721e5282      	bset	21122,#7
5055  04c8 81            	ret	
5056  04c9               L5642:
5057                     ; 1888     TIM3->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
5059  04c9 721f5282      	bres	21122,#7
5060                     ; 1890 }
5063  04cd 81            	ret	
5117                     ; 1908 void TIM3_ETRConfig(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
5117                     ; 1909                     TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
5117                     ; 1910                     uint8_t ExtTRGFilter)
5117                     ; 1911 {
5118                     	switch	.text
5119  04ce               _TIM3_ETRConfig:
5121  04ce 89            	pushw	x
5122       00000000      OFST:	set	0
5125                     ; 1913   assert_param(IS_TIM3_EXT_PRESCALER(TIM3_ExtTRGPrescaler));
5127                     ; 1914   assert_param(IS_TIM3_EXT_POLARITY(TIM3_ExtTRGPolarity));
5129                     ; 1915   assert_param(IS_TIM3_EXT_FILTER(ExtTRGFilter));
5131                     ; 1918   TIM3->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM3_ExtTRGPrescaler | (uint8_t)TIM3_ExtTRGPolarity)
5131                     ; 1919                          | (uint8_t)ExtTRGFilter);
5133  04cf 9f            	ld	a,xl
5134  04d0 1a01          	or	a,(OFST+1,sp)
5135  04d2 1a05          	or	a,(OFST+5,sp)
5136  04d4 ca5283        	or	a,21123
5137  04d7 c75283        	ld	21123,a
5138                     ; 1920 }
5141  04da 85            	popw	x
5142  04db 81            	ret	
5249                     ; 1955 void TIM3_EncoderInterfaceConfig(TIM3_EncoderMode_TypeDef TIM3_EncoderMode,
5249                     ; 1956                                  TIM3_ICPolarity_TypeDef TIM3_IC1Polarity,
5249                     ; 1957                                  TIM3_ICPolarity_TypeDef TIM3_IC2Polarity)
5249                     ; 1958 {
5250                     	switch	.text
5251  04dc               _TIM3_EncoderInterfaceConfig:
5253  04dc 89            	pushw	x
5254  04dd 5203          	subw	sp,#3
5255       00000003      OFST:	set	3
5258                     ; 1959   uint8_t tmpsmcr = 0;
5260                     ; 1960   uint8_t tmpccmr1 = 0;
5262                     ; 1961   uint8_t tmpccmr2 = 0;
5264                     ; 1964   assert_param(IS_TIM3_ENCODER_MODE(TIM3_EncoderMode));
5266                     ; 1965   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC1Polarity));
5268                     ; 1966   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC2Polarity));
5270                     ; 1968   tmpsmcr = TIM3->SMCR;
5272  04df c65282        	ld	a,21122
5273  04e2 6b01          	ld	(OFST-2,sp),a
5274                     ; 1969   tmpccmr1 = TIM3->CCMR1;
5276  04e4 c65289        	ld	a,21129
5277  04e7 6b02          	ld	(OFST-1,sp),a
5278                     ; 1970   tmpccmr2 = TIM3->CCMR2;
5280  04e9 c6528a        	ld	a,21130
5281  04ec 6b03          	ld	(OFST+0,sp),a
5282                     ; 1973   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
5284  04ee 7b01          	ld	a,(OFST-2,sp)
5285  04f0 a4f0          	and	a,#240
5286  04f2 6b01          	ld	(OFST-2,sp),a
5287                     ; 1974   tmpsmcr |= (uint8_t)TIM3_EncoderMode;
5289  04f4 9e            	ld	a,xh
5290  04f5 1a01          	or	a,(OFST-2,sp)
5291  04f7 6b01          	ld	(OFST-2,sp),a
5292                     ; 1977   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
5294  04f9 7b02          	ld	a,(OFST-1,sp)
5295  04fb a4fc          	and	a,#252
5296  04fd 6b02          	ld	(OFST-1,sp),a
5297                     ; 1978   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
5299  04ff 7b03          	ld	a,(OFST+0,sp)
5300  0501 a4fc          	and	a,#252
5301  0503 6b03          	ld	(OFST+0,sp),a
5302                     ; 1979   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
5304  0505 7b02          	ld	a,(OFST-1,sp)
5305  0507 aa01          	or	a,#1
5306  0509 6b02          	ld	(OFST-1,sp),a
5307                     ; 1980   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
5309  050b 7b03          	ld	a,(OFST+0,sp)
5310  050d aa01          	or	a,#1
5311  050f 6b03          	ld	(OFST+0,sp),a
5312                     ; 1983   if (TIM3_IC1Polarity == TIM3_ICPolarity_Falling)
5314  0511 9f            	ld	a,xl
5315  0512 4a            	dec	a
5316  0513 2606          	jrne	L3652
5317                     ; 1985     TIM3->CCER1 |= TIM_CCER1_CC1P ;
5319  0515 7212528b      	bset	21131,#1
5321  0519 2004          	jra	L5652
5322  051b               L3652:
5323                     ; 1989     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
5325  051b 7213528b      	bres	21131,#1
5326  051f               L5652:
5327                     ; 1992   if (TIM3_IC2Polarity == TIM3_ICPolarity_Falling)
5329  051f 7b08          	ld	a,(OFST+5,sp)
5330  0521 4a            	dec	a
5331  0522 2606          	jrne	L7652
5332                     ; 1994     TIM3->CCER1 |= TIM_CCER1_CC2P ;
5334  0524 721a528b      	bset	21131,#5
5336  0528 2004          	jra	L1752
5337  052a               L7652:
5338                     ; 1998     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5340  052a 721b528b      	bres	21131,#5
5341  052e               L1752:
5342                     ; 2001   TIM3->SMCR = tmpsmcr;
5344  052e 7b01          	ld	a,(OFST-2,sp)
5345  0530 c75282        	ld	21122,a
5346                     ; 2002   TIM3->CCMR1 = tmpccmr1;
5348  0533 7b02          	ld	a,(OFST-1,sp)
5349  0535 c75289        	ld	21129,a
5350                     ; 2003   TIM3->CCMR2 = tmpccmr2;
5352  0538 7b03          	ld	a,(OFST+0,sp)
5353  053a c7528a        	ld	21130,a
5354                     ; 2004 }
5357  053d 5b05          	addw	sp,#5
5358  053f 81            	ret	
5394                     ; 2012 void TIM3_SelectHallSensor(FunctionalState NewState)
5394                     ; 2013 {
5395                     	switch	.text
5396  0540               _TIM3_SelectHallSensor:
5400                     ; 2015   assert_param(IS_FUNCTIONAL_STATE(NewState));
5402                     ; 2018   if (NewState != DISABLE)
5404  0540 4d            	tnz	a
5405  0541 2705          	jreq	L1162
5406                     ; 2020     TIM3->CR2 |= TIM_CR2_TI1S;
5408  0543 721e5281      	bset	21121,#7
5411  0547 81            	ret	
5412  0548               L1162:
5413                     ; 2024     TIM3->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
5415  0548 721f5281      	bres	21121,#7
5416                     ; 2026 }
5419  054c 81            	ret	
5485                     ; 2047 static void TI1_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity, \
5485                     ; 2048                        TIM3_ICSelection_TypeDef TIM3_ICSelection, \
5485                     ; 2049                        uint8_t TIM3_ICFilter)
5485                     ; 2050 {
5486                     	switch	.text
5487  054d               L3_TI1_Config:
5489  054d 89            	pushw	x
5490  054e 89            	pushw	x
5491       00000002      OFST:	set	2
5494                     ; 2051   uint8_t tmpccmr1 = 0;
5496                     ; 2052   uint8_t tmpicpolarity = TIM3_ICPolarity;
5498  054f 9e            	ld	a,xh
5499  0550 6b01          	ld	(OFST-1,sp),a
5500                     ; 2053   tmpccmr1 = TIM3->CCMR1;
5502  0552 c65289        	ld	a,21129
5503  0555 6b02          	ld	(OFST+0,sp),a
5504                     ; 2056   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5506                     ; 2057   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5508                     ; 2058   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5510                     ; 2061   TIM3->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5512  0557 7211528b      	bres	21131,#0
5513                     ; 2064   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5515  055b a40c          	and	a,#12
5516  055d 6b02          	ld	(OFST+0,sp),a
5517                     ; 2065   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5519  055f 7b07          	ld	a,(OFST+5,sp)
5520  0561 97            	ld	xl,a
5521  0562 a610          	ld	a,#16
5522  0564 42            	mul	x,a
5523  0565 9f            	ld	a,xl
5524  0566 1a04          	or	a,(OFST+2,sp)
5525  0568 1a02          	or	a,(OFST+0,sp)
5526  056a 6b02          	ld	(OFST+0,sp),a
5527                     ; 2067   TIM3->CCMR1 = tmpccmr1;
5529  056c c75289        	ld	21129,a
5530                     ; 2070   if (tmpicpolarity == (uint8_t)(TIM3_ICPolarity_Falling))
5532  056f 7b01          	ld	a,(OFST-1,sp)
5533  0571 4a            	dec	a
5534  0572 2606          	jrne	L5462
5535                     ; 2072     TIM3->CCER1 |= TIM_CCER1_CC1P;
5537  0574 7212528b      	bset	21131,#1
5539  0578 2004          	jra	L7462
5540  057a               L5462:
5541                     ; 2076     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5543  057a 7213528b      	bres	21131,#1
5544  057e               L7462:
5545                     ; 2080   TIM3->CCER1 |=  TIM_CCER1_CC1E;
5547  057e 7210528b      	bset	21131,#0
5548                     ; 2081 }
5551  0582 5b04          	addw	sp,#4
5552  0584 81            	ret	
5618                     ; 2098 static void TI2_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5618                     ; 2099                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5618                     ; 2100                        uint8_t TIM3_ICFilter)
5618                     ; 2101 {
5619                     	switch	.text
5620  0585               L5_TI2_Config:
5622  0585 89            	pushw	x
5623  0586 89            	pushw	x
5624       00000002      OFST:	set	2
5627                     ; 2102   uint8_t tmpccmr2 = 0;
5629                     ; 2103   uint8_t tmpicpolarity = TIM3_ICPolarity;
5631  0587 9e            	ld	a,xh
5632  0588 6b01          	ld	(OFST-1,sp),a
5633                     ; 2106   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5635                     ; 2107   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5637                     ; 2108   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5639                     ; 2110   tmpccmr2 = TIM3->CCMR2;
5641  058a c6528a        	ld	a,21130
5642  058d 6b02          	ld	(OFST+0,sp),a
5643                     ; 2113   TIM3->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5645  058f 7219528b      	bres	21131,#4
5646                     ; 2116   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5648  0593 a40c          	and	a,#12
5649  0595 6b02          	ld	(OFST+0,sp),a
5650                     ; 2117   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5652  0597 7b07          	ld	a,(OFST+5,sp)
5653  0599 97            	ld	xl,a
5654  059a a610          	ld	a,#16
5655  059c 42            	mul	x,a
5656  059d 9f            	ld	a,xl
5657  059e 1a04          	or	a,(OFST+2,sp)
5658  05a0 1a02          	or	a,(OFST+0,sp)
5659  05a2 6b02          	ld	(OFST+0,sp),a
5660                     ; 2119   TIM3->CCMR2 = tmpccmr2;
5662  05a4 c7528a        	ld	21130,a
5663                     ; 2122   if (tmpicpolarity == TIM3_ICPolarity_Falling)
5665  05a7 7b01          	ld	a,(OFST-1,sp)
5666  05a9 4a            	dec	a
5667  05aa 2606          	jrne	L1072
5668                     ; 2124     TIM3->CCER1 |= TIM_CCER1_CC2P ;
5670  05ac 721a528b      	bset	21131,#5
5672  05b0 2004          	jra	L3072
5673  05b2               L1072:
5674                     ; 2128     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5676  05b2 721b528b      	bres	21131,#5
5677  05b6               L3072:
5678                     ; 2132   TIM3->CCER1 |=  TIM_CCER1_CC2E;
5680  05b6 7218528b      	bset	21131,#4
5681                     ; 2133 }
5684  05ba 5b04          	addw	sp,#4
5685  05bc 81            	ret	
5698                     	xdef	_TIM3_SelectHallSensor
5699                     	xdef	_TIM3_EncoderInterfaceConfig
5700                     	xdef	_TIM3_ETRConfig
5701                     	xdef	_TIM3_SelectMasterSlaveMode
5702                     	xdef	_TIM3_SelectSlaveMode
5703                     	xdef	_TIM3_SelectOutputTrigger
5704                     	xdef	_TIM3_SelectInputTrigger
5705                     	xdef	_TIM3_ETRClockMode2Config
5706                     	xdef	_TIM3_ETRClockMode1Config
5707                     	xdef	_TIM3_TIxExternalClockConfig
5708                     	xdef	_TIM3_InternalClockConfig
5709                     	xdef	_TIM3_SelectCCDMA
5710                     	xdef	_TIM3_DMACmd
5711                     	xdef	_TIM3_ClearITPendingBit
5712                     	xdef	_TIM3_GetITStatus
5713                     	xdef	_TIM3_ClearFlag
5714                     	xdef	_TIM3_GetFlagStatus
5715                     	xdef	_TIM3_GenerateEvent
5716                     	xdef	_TIM3_ITConfig
5717                     	xdef	_TIM3_SetIC2Prescaler
5718                     	xdef	_TIM3_SetIC1Prescaler
5719                     	xdef	_TIM3_GetCapture2
5720                     	xdef	_TIM3_GetCapture1
5721                     	xdef	_TIM3_PWMIConfig
5722                     	xdef	_TIM3_ICInit
5723                     	xdef	_TIM3_CCxCmd
5724                     	xdef	_TIM3_OC2PolarityConfig
5725                     	xdef	_TIM3_OC1PolarityConfig
5726                     	xdef	_TIM3_OC2FastConfig
5727                     	xdef	_TIM3_OC1FastConfig
5728                     	xdef	_TIM3_OC2PreloadConfig
5729                     	xdef	_TIM3_OC1PreloadConfig
5730                     	xdef	_TIM3_ForcedOC2Config
5731                     	xdef	_TIM3_ForcedOC1Config
5732                     	xdef	_TIM3_SetCompare2
5733                     	xdef	_TIM3_SetCompare1
5734                     	xdef	_TIM3_SelectOCxM
5735                     	xdef	_TIM3_CtrlPWMOutputs
5736                     	xdef	_TIM3_BKRConfig
5737                     	xdef	_TIM3_OC2Init
5738                     	xdef	_TIM3_OC1Init
5739                     	xdef	_TIM3_Cmd
5740                     	xdef	_TIM3_SelectOnePulseMode
5741                     	xdef	_TIM3_ARRPreloadConfig
5742                     	xdef	_TIM3_UpdateRequestConfig
5743                     	xdef	_TIM3_UpdateDisableConfig
5744                     	xdef	_TIM3_GetPrescaler
5745                     	xdef	_TIM3_GetCounter
5746                     	xdef	_TIM3_SetAutoreload
5747                     	xdef	_TIM3_SetCounter
5748                     	xdef	_TIM3_CounterModeConfig
5749                     	xdef	_TIM3_PrescalerConfig
5750                     	xdef	_TIM3_TimeBaseInit
5751                     	xdef	_TIM3_DeInit
5770                     	end
