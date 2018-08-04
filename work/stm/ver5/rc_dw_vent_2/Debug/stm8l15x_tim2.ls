   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 165 void TIM2_DeInit(void)
  50                     ; 166 {
  51                     .text:	section	.text,new
  52  0000               f_TIM2_DeInit:
  56                     ; 167   TIM2->CR1 = TIM_CR1_RESET_VALUE;
  58  0000 725f5250      	clr	21072
  59                     ; 168   TIM2->CR2 = TIM_CR2_RESET_VALUE;
  61  0004 725f5251      	clr	21073
  62                     ; 169   TIM2->SMCR = TIM_SMCR_RESET_VALUE;
  64  0008 725f5252      	clr	21074
  65                     ; 170   TIM2->ETR = TIM_ETR_RESET_VALUE;
  67  000c 725f5253      	clr	21075
  68                     ; 171   TIM2->IER = TIM_IER_RESET_VALUE;
  70  0010 725f5255      	clr	21077
  71                     ; 172   TIM2->SR2 = TIM_SR2_RESET_VALUE;
  73  0014 725f5257      	clr	21079
  74                     ; 175   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  76  0018 725f525b      	clr	21083
  77                     ; 177   TIM2->CCMR1 = 0x01;/*TIM2_ICxSource_TIxFPx */
  79  001c 35015259      	mov	21081,#1
  80                     ; 178   TIM2->CCMR2 = 0x01;/*TIM2_ICxSource_TIxFPx */
  82  0020 3501525a      	mov	21082,#1
  83                     ; 181   TIM2->CCER1 = TIM_CCER1_RESET_VALUE;
  85  0024 725f525b      	clr	21083
  86                     ; 182   TIM2->CCMR1 = TIM_CCMR1_RESET_VALUE;
  88  0028 725f5259      	clr	21081
  89                     ; 183   TIM2->CCMR2 = TIM_CCMR2_RESET_VALUE;
  91  002c 725f525a      	clr	21082
  92                     ; 185   TIM2->CNTRH = TIM_CNTRH_RESET_VALUE;
  94  0030 725f525c      	clr	21084
  95                     ; 186   TIM2->CNTRL = TIM_CNTRL_RESET_VALUE;
  97  0034 725f525d      	clr	21085
  98                     ; 188   TIM2->PSCR = TIM_PSCR_RESET_VALUE;
 100  0038 725f525e      	clr	21086
 101                     ; 190   TIM2->ARRH = TIM_ARRH_RESET_VALUE;
 103  003c 35ff525f      	mov	21087,#255
 104                     ; 191   TIM2->ARRL = TIM_ARRL_RESET_VALUE;
 106  0040 35ff5260      	mov	21088,#255
 107                     ; 193   TIM2->CCR1H = TIM_CCR1H_RESET_VALUE;
 109  0044 725f5261      	clr	21089
 110                     ; 194   TIM2->CCR1L = TIM_CCR1L_RESET_VALUE;
 112  0048 725f5262      	clr	21090
 113                     ; 195   TIM2->CCR2H = TIM_CCR2H_RESET_VALUE;
 115  004c 725f5263      	clr	21091
 116                     ; 196   TIM2->CCR2L = TIM_CCR2L_RESET_VALUE;
 118  0050 725f5264      	clr	21092
 119                     ; 199   TIM2->OISR = TIM_OISR_RESET_VALUE;
 121  0054 725f5266      	clr	21094
 122                     ; 200   TIM2->EGR = 0x01;/* TIM_EGR_UG */
 124  0058 35015258      	mov	21080,#1
 125                     ; 201   TIM2->BKR = TIM_BKR_RESET_VALUE;
 127  005c 725f5265      	clr	21093
 128                     ; 202   TIM2->SR1 = TIM_SR1_RESET_VALUE;
 130  0060 725f5256      	clr	21078
 131                     ; 203 }
 134  0064 87            	retf	
 293                     ; 228 void TIM2_TimeBaseInit(TIM2_Prescaler_TypeDef TIM2_Prescaler,
 293                     ; 229                        TIM2_CounterMode_TypeDef TIM2_CounterMode,
 293                     ; 230                        uint16_t TIM2_Period)
 293                     ; 231 {
 294                     .text:	section	.text,new
 295  0000               f_TIM2_TimeBaseInit:
 297  0000 89            	pushw	x
 298       00000000      OFST:	set	0
 301                     ; 233   assert_param(IS_TIM2_PRESCALER(TIM2_Prescaler));
 303                     ; 234   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
 305                     ; 239   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8) ;
 307  0001 7b06          	ld	a,(OFST+6,sp)
 308  0003 c7525f        	ld	21087,a
 309                     ; 240   TIM2->ARRL = (uint8_t)(TIM2_Period);
 311  0006 7b07          	ld	a,(OFST+7,sp)
 312  0008 c75260        	ld	21088,a
 313                     ; 243   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 315  000b 9e            	ld	a,xh
 316  000c c7525e        	ld	21086,a
 317                     ; 246   TIM2->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 319  000f c65250        	ld	a,21072
 320  0012 a48f          	and	a,#143
 321  0014 c75250        	ld	21072,a
 322                     ; 247   TIM2->CR1 |= (uint8_t)(TIM2_CounterMode);
 324  0017 9f            	ld	a,xl
 325  0018 ca5250        	or	a,21072
 326  001b c75250        	ld	21072,a
 327                     ; 250   TIM2->EGR = TIM2_EventSource_Update;
 329  001e 35015258      	mov	21080,#1
 330                     ; 251 }
 333  0022 85            	popw	x
 334  0023 87            	retf	
 401                     ; 271 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
 401                     ; 272                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
 401                     ; 273 {
 402                     .text:	section	.text,new
 403  0000               f_TIM2_PrescalerConfig:
 407                     ; 275   assert_param(IS_TIM2_PRESCALER(Prescaler));
 409                     ; 276   assert_param(IS_TIM2_PRESCALER_RELOAD(TIM2_PSCReloadMode));
 411                     ; 279   TIM2->PSCR = (uint8_t)(Prescaler);
 413  0000 9e            	ld	a,xh
 414  0001 c7525e        	ld	21086,a
 415                     ; 282   if (TIM2_PSCReloadMode == TIM2_PSCReloadMode_Immediate)
 417  0004 9f            	ld	a,xl
 418  0005 4a            	dec	a
 419  0006 2605          	jrne	L541
 420                     ; 284     TIM2->EGR |= TIM_EGR_UG ;
 422  0008 72105258      	bset	21080,#0
 425  000c 87            	retf	
 426  000d               L541:
 427                     ; 288     TIM2->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 429  000d 72115258      	bres	21080,#0
 430                     ; 290 }
 433  0011 87            	retf	
 475                     ; 303 void TIM2_CounterModeConfig(TIM2_CounterMode_TypeDef TIM2_CounterMode)
 475                     ; 304 {
 476                     .text:	section	.text,new
 477  0000               f_TIM2_CounterModeConfig:
 479  0000 88            	push	a
 480  0001 88            	push	a
 481       00000001      OFST:	set	1
 484                     ; 305   uint8_t tmpcr1 = 0;
 486                     ; 308   assert_param(IS_TIM2_COUNTER_MODE(TIM2_CounterMode));
 488                     ; 310   tmpcr1 = TIM2->CR1;
 490  0002 c65250        	ld	a,21072
 491                     ; 313   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 493  0005 a48f          	and	a,#143
 494                     ; 316   tmpcr1 |= (uint8_t)TIM2_CounterMode;
 496  0007 1a02          	or	a,(OFST+1,sp)
 497                     ; 318   TIM2->CR1 = tmpcr1;
 499  0009 c75250        	ld	21072,a
 500                     ; 319 }
 503  000c 85            	popw	x
 504  000d 87            	retf	
 535                     ; 327 void TIM2_SetCounter(uint16_t Counter)
 535                     ; 328 {
 536                     .text:	section	.text,new
 537  0000               f_TIM2_SetCounter:
 541                     ; 331   TIM2->CNTRH = (uint8_t)(Counter >> 8);
 543  0000 9e            	ld	a,xh
 544  0001 c7525c        	ld	21084,a
 545                     ; 332   TIM2->CNTRL = (uint8_t)(Counter);
 547  0004 9f            	ld	a,xl
 548  0005 c7525d        	ld	21085,a
 549                     ; 333 }
 552  0008 87            	retf	
 583                     ; 341 void TIM2_SetAutoreload(uint16_t Autoreload)
 583                     ; 342 {
 584                     .text:	section	.text,new
 585  0000               f_TIM2_SetAutoreload:
 589                     ; 344   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
 591  0000 9e            	ld	a,xh
 592  0001 c7525f        	ld	21087,a
 593                     ; 345   TIM2->ARRL = (uint8_t)(Autoreload);
 595  0004 9f            	ld	a,xl
 596  0005 c75260        	ld	21088,a
 597                     ; 346 }
 600  0008 87            	retf	
 645                     ; 353 uint16_t TIM2_GetCounter(void)
 645                     ; 354 {
 646                     .text:	section	.text,new
 647  0000               f_TIM2_GetCounter:
 649  0000 5204          	subw	sp,#4
 650       00000004      OFST:	set	4
 653                     ; 355   uint16_t tmpcnt = 0;
 655                     ; 358   tmpcntrh = TIM2->CNTRH;
 657  0002 c6525c        	ld	a,21084
 658  0005 6b02          	ld	(OFST-2,sp),a
 659                     ; 359   tmpcntrl = TIM2->CNTRL;
 661  0007 c6525d        	ld	a,21085
 662  000a 6b01          	ld	(OFST-3,sp),a
 663                     ; 361   tmpcnt = (uint16_t)(tmpcntrl);
 665  000c 5f            	clrw	x
 666  000d 97            	ld	xl,a
 667  000e 1f03          	ldw	(OFST-1,sp),x
 668                     ; 362   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 670  0010 5f            	clrw	x
 671  0011 7b02          	ld	a,(OFST-2,sp)
 672  0013 97            	ld	xl,a
 673  0014 7b04          	ld	a,(OFST+0,sp)
 674  0016 01            	rrwa	x,a
 675  0017 1a03          	or	a,(OFST-1,sp)
 676  0019 01            	rrwa	x,a
 677                     ; 364   return ((uint16_t)tmpcnt);
 681  001a 5b04          	addw	sp,#4
 682  001c 87            	retf	
 705                     ; 380 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
 705                     ; 381 {
 706                     .text:	section	.text,new
 707  0000               f_TIM2_GetPrescaler:
 711                     ; 383   return ((TIM2_Prescaler_TypeDef)TIM2->PSCR);
 713  0000 c6525e        	ld	a,21086
 716  0003 87            	retf	
 771                     ; 393 void TIM2_UpdateDisableConfig(FunctionalState NewState)
 771                     ; 394 {
 772                     .text:	section	.text,new
 773  0000               f_TIM2_UpdateDisableConfig:
 777                     ; 396   assert_param(IS_FUNCTIONAL_STATE(NewState));
 779                     ; 399   if (NewState != DISABLE)
 781  0000 4d            	tnz	a
 782  0001 2705          	jreq	L772
 783                     ; 401     TIM2->CR1 |= TIM_CR1_UDIS;
 785  0003 72125250      	bset	21072,#1
 788  0007 87            	retf	
 789  0008               L772:
 790                     ; 405     TIM2->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 792  0008 72135250      	bres	21072,#1
 793                     ; 407 }
 796  000c 87            	retf	
 853                     ; 417 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
 853                     ; 418 {
 854                     .text:	section	.text,new
 855  0000               f_TIM2_UpdateRequestConfig:
 859                     ; 420   assert_param(IS_TIM2_UPDATE_SOURCE(TIM2_UpdateSource));
 861                     ; 423   if (TIM2_UpdateSource == TIM2_UpdateSource_Regular)
 863  0000 4a            	dec	a
 864  0001 2605          	jrne	L133
 865                     ; 425     TIM2->CR1 |= TIM_CR1_URS ;
 867  0003 72145250      	bset	21072,#2
 870  0007 87            	retf	
 871  0008               L133:
 872                     ; 429     TIM2->CR1 &= (uint8_t)(~TIM_CR1_URS);
 874  0008 72155250      	bres	21072,#2
 875                     ; 431 }
 878  000c 87            	retf	
 913                     ; 439 void TIM2_ARRPreloadConfig(FunctionalState NewState)
 913                     ; 440 {
 914                     .text:	section	.text,new
 915  0000               f_TIM2_ARRPreloadConfig:
 919                     ; 442   assert_param(IS_FUNCTIONAL_STATE(NewState));
 921                     ; 445   if (NewState != DISABLE)
 923  0000 4d            	tnz	a
 924  0001 2705          	jreq	L353
 925                     ; 447     TIM2->CR1 |= TIM_CR1_ARPE;
 927  0003 721e5250      	bset	21072,#7
 930  0007 87            	retf	
 931  0008               L353:
 932                     ; 451     TIM2->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 934  0008 721f5250      	bres	21072,#7
 935                     ; 453 }
 938  000c 87            	retf	
 994                     ; 463 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
 994                     ; 464 {
 995                     .text:	section	.text,new
 996  0000               f_TIM2_SelectOnePulseMode:
1000                     ; 466   assert_param(IS_TIM2_OPM_MODE(TIM2_OPMode));
1002                     ; 469   if (TIM2_OPMode == TIM2_OPMode_Single)
1004  0000 4a            	dec	a
1005  0001 2605          	jrne	L504
1006                     ; 471     TIM2->CR1 |= TIM_CR1_OPM ;
1008  0003 72165250      	bset	21072,#3
1011  0007 87            	retf	
1012  0008               L504:
1013                     ; 475     TIM2->CR1 &= (uint8_t)(~TIM_CR1_OPM);
1015  0008 72175250      	bres	21072,#3
1016                     ; 477 }
1019  000c 87            	retf	
1053                     ; 485 void TIM2_Cmd(FunctionalState NewState)
1053                     ; 486 {
1054                     .text:	section	.text,new
1055  0000               f_TIM2_Cmd:
1059                     ; 488   assert_param(IS_FUNCTIONAL_STATE(NewState));
1061                     ; 491   if (NewState != DISABLE)
1063  0000 4d            	tnz	a
1064  0001 2705          	jreq	L724
1065                     ; 493     TIM2->CR1 |= TIM_CR1_CEN;
1067  0003 72105250      	bset	21072,#0
1070  0007 87            	retf	
1071  0008               L724:
1072                     ; 497     TIM2->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1074  0008 72115250      	bres	21072,#0
1075                     ; 499 }
1078  000c 87            	retf	
1271                     ; 575 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
1271                     ; 576                   TIM2_OutputState_TypeDef TIM2_OutputState,
1271                     ; 577                   uint16_t TIM2_Pulse,
1271                     ; 578                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
1271                     ; 579                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
1271                     ; 580 {
1272                     .text:	section	.text,new
1273  0000               f_TIM2_OC1Init:
1275  0000 89            	pushw	x
1276  0001 88            	push	a
1277       00000001      OFST:	set	1
1280                     ; 581   uint8_t tmpccmr1 = 0;
1282                     ; 584   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
1284                     ; 585   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
1286                     ; 586   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
1288                     ; 587   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
1290                     ; 589   tmpccmr1 = TIM2->CCMR1;
1292  0002 c65259        	ld	a,21081
1293  0005 6b01          	ld	(OFST+0,sp),a
1294                     ; 592   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1296  0007 7211525b      	bres	21083,#0
1297                     ; 594   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
1299  000b a48f          	and	a,#143
1300  000d 6b01          	ld	(OFST+0,sp),a
1301                     ; 597   tmpccmr1 |= (uint8_t)TIM2_OCMode;
1303  000f 9e            	ld	a,xh
1304  0010 1a01          	or	a,(OFST+0,sp)
1305  0012 6b01          	ld	(OFST+0,sp),a
1306                     ; 599   TIM2->CCMR1 = tmpccmr1;
1308  0014 c75259        	ld	21081,a
1309                     ; 602   if (TIM2_OutputState == TIM2_OutputState_Enable)
1311  0017 9f            	ld	a,xl
1312  0018 4a            	dec	a
1313  0019 2606          	jrne	L145
1314                     ; 604     TIM2->CCER1 |= TIM_CCER1_CC1E;
1316  001b 7210525b      	bset	21083,#0
1318  001f 2004          	jra	L345
1319  0021               L145:
1320                     ; 608     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1322  0021 7211525b      	bres	21083,#0
1323  0025               L345:
1324                     ; 612   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
1326  0025 7b09          	ld	a,(OFST+8,sp)
1327  0027 4a            	dec	a
1328  0028 2606          	jrne	L545
1329                     ; 614     TIM2->CCER1 |= TIM_CCER1_CC1P;
1331  002a 7212525b      	bset	21083,#1
1333  002e 2004          	jra	L745
1334  0030               L545:
1335                     ; 618     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1337  0030 7213525b      	bres	21083,#1
1338  0034               L745:
1339                     ; 622   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
1341  0034 7b0a          	ld	a,(OFST+9,sp)
1342  0036 4a            	dec	a
1343  0037 2606          	jrne	L155
1344                     ; 624     TIM2->OISR |= TIM_OISR_OIS1;
1346  0039 72105266      	bset	21094,#0
1348  003d 2004          	jra	L355
1349  003f               L155:
1350                     ; 628     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS1);
1352  003f 72115266      	bres	21094,#0
1353  0043               L355:
1354                     ; 632   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
1356  0043 7b07          	ld	a,(OFST+6,sp)
1357  0045 c75261        	ld	21089,a
1358                     ; 633   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
1360  0048 7b08          	ld	a,(OFST+7,sp)
1361  004a c75262        	ld	21090,a
1362                     ; 634 }
1365  004d 5b03          	addw	sp,#3
1366  004f 87            	retf	
1444                     ; 661 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
1444                     ; 662                   TIM2_OutputState_TypeDef TIM2_OutputState,
1444                     ; 663                   uint16_t TIM2_Pulse,
1444                     ; 664                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity,
1444                     ; 665                   TIM2_OCIdleState_TypeDef TIM2_OCIdleState)
1444                     ; 666 {
1445                     .text:	section	.text,new
1446  0000               f_TIM2_OC2Init:
1448  0000 89            	pushw	x
1449  0001 88            	push	a
1450       00000001      OFST:	set	1
1453                     ; 667   uint8_t tmpccmr2 = 0;
1455                     ; 670   assert_param(IS_TIM2_OC_MODE(TIM2_OCMode));
1457                     ; 671   assert_param(IS_TIM2_OUTPUT_STATE(TIM2_OutputState));
1459                     ; 672   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
1461                     ; 673   assert_param(IS_TIM2_OCIDLE_STATE(TIM2_OCIdleState));
1463                     ; 675   tmpccmr2 = TIM2->CCMR2;
1465  0002 c6525a        	ld	a,21082
1466  0005 6b01          	ld	(OFST+0,sp),a
1467                     ; 678   TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1469  0007 7219525b      	bres	21083,#4
1470                     ; 681   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
1472  000b a48f          	and	a,#143
1473  000d 6b01          	ld	(OFST+0,sp),a
1474                     ; 684   tmpccmr2 |= (uint8_t)TIM2_OCMode;
1476  000f 9e            	ld	a,xh
1477  0010 1a01          	or	a,(OFST+0,sp)
1478  0012 6b01          	ld	(OFST+0,sp),a
1479                     ; 686   TIM2->CCMR2 = tmpccmr2;
1481  0014 c7525a        	ld	21082,a
1482                     ; 689   if (TIM2_OutputState == TIM2_OutputState_Enable)
1484  0017 9f            	ld	a,xl
1485  0018 4a            	dec	a
1486  0019 2606          	jrne	L316
1487                     ; 691     TIM2->CCER1 |= TIM_CCER1_CC2E;
1489  001b 7218525b      	bset	21083,#4
1491  001f 2004          	jra	L516
1492  0021               L316:
1493                     ; 695     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1495  0021 7219525b      	bres	21083,#4
1496  0025               L516:
1497                     ; 699   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
1499  0025 7b09          	ld	a,(OFST+8,sp)
1500  0027 4a            	dec	a
1501  0028 2606          	jrne	L716
1502                     ; 701     TIM2->CCER1 |= TIM_CCER1_CC2P;
1504  002a 721a525b      	bset	21083,#5
1506  002e 2004          	jra	L126
1507  0030               L716:
1508                     ; 705     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
1510  0030 721b525b      	bres	21083,#5
1511  0034               L126:
1512                     ; 710   if (TIM2_OCIdleState == TIM2_OCIdleState_Set)
1514  0034 7b0a          	ld	a,(OFST+9,sp)
1515  0036 4a            	dec	a
1516  0037 2606          	jrne	L326
1517                     ; 712     TIM2->OISR |= TIM_OISR_OIS2;
1519  0039 72145266      	bset	21094,#2
1521  003d 2004          	jra	L526
1522  003f               L326:
1523                     ; 716     TIM2->OISR &= (uint8_t)(~TIM_OISR_OIS2);
1525  003f 72155266      	bres	21094,#2
1526  0043               L526:
1527                     ; 720   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
1529  0043 7b07          	ld	a,(OFST+6,sp)
1530  0045 c75263        	ld	21091,a
1531                     ; 721   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
1533  0048 7b08          	ld	a,(OFST+7,sp)
1534  004a c75264        	ld	21092,a
1535                     ; 722 }
1538  004d 5b03          	addw	sp,#3
1539  004f 87            	retf	
1736                     ; 751 void TIM2_BKRConfig(TIM2_OSSIState_TypeDef TIM2_OSSIState,
1736                     ; 752                     TIM2_LockLevel_TypeDef TIM2_LockLevel,
1736                     ; 753                     TIM2_BreakState_TypeDef TIM2_BreakState,
1736                     ; 754                     TIM2_BreakPolarity_TypeDef TIM2_BreakPolarity,
1736                     ; 755                     TIM2_AutomaticOutput_TypeDef TIM2_AutomaticOutput)
1736                     ; 756 
1736                     ; 757 {
1737                     .text:	section	.text,new
1738  0000               f_TIM2_BKRConfig:
1740  0000 89            	pushw	x
1741  0001 88            	push	a
1742       00000001      OFST:	set	1
1745                     ; 759   assert_param(IS_TIM2_OSSI_STATE(TIM2_OSSIState));
1747                     ; 760   assert_param(IS_TIM2_LOCK_LEVEL(TIM2_LockLevel));
1749                     ; 761   assert_param(IS_TIM2_BREAK_STATE(TIM2_BreakState));
1751                     ; 762   assert_param(IS_TIM2_BREAK_POLARITY(TIM2_BreakPolarity));
1753                     ; 763   assert_param(IS_TIM2_AUTOMATIC_OUTPUT_STATE(TIM2_AutomaticOutput));
1755                     ; 769   TIM2->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM2_OSSIState | (uint8_t)TIM2_LockLevel) | \
1755                     ; 770                                   (uint8_t)((uint8_t)TIM2_BreakState | (uint8_t)TIM2_BreakPolarity)) | \
1755                     ; 771                                   TIM2_AutomaticOutput));
1757  0002 7b07          	ld	a,(OFST+6,sp)
1758  0004 1a08          	or	a,(OFST+7,sp)
1759  0006 6b01          	ld	(OFST+0,sp),a
1760  0008 9f            	ld	a,xl
1761  0009 1a02          	or	a,(OFST+1,sp)
1762  000b 1a01          	or	a,(OFST+0,sp)
1763  000d 1a09          	or	a,(OFST+8,sp)
1764  000f c75265        	ld	21093,a
1765                     ; 772 }
1768  0012 5b03          	addw	sp,#3
1769  0014 87            	retf	
1804                     ; 780 void TIM2_CtrlPWMOutputs(FunctionalState NewState)
1804                     ; 781 {
1805                     .text:	section	.text,new
1806  0000               f_TIM2_CtrlPWMOutputs:
1810                     ; 783   assert_param(IS_FUNCTIONAL_STATE(NewState));
1812                     ; 787   if (NewState != DISABLE)
1814  0000 4d            	tnz	a
1815  0001 2705          	jreq	L757
1816                     ; 789     TIM2->BKR |= TIM_BKR_MOE ;
1818  0003 721e5265      	bset	21093,#7
1821  0007 87            	retf	
1822  0008               L757:
1823                     ; 793     TIM2->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1825  0008 721f5265      	bres	21093,#7
1826                     ; 795 }
1829  000c 87            	retf	
1893                     ; 815 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel,
1893                     ; 816                      TIM2_OCMode_TypeDef TIM2_OCMode)
1893                     ; 817 {
1894                     .text:	section	.text,new
1895  0000               f_TIM2_SelectOCxM:
1897  0000 89            	pushw	x
1898       00000000      OFST:	set	0
1901                     ; 819   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
1903                     ; 820   assert_param(IS_TIM2_OCM(TIM2_OCMode));
1905                     ; 822   if (TIM2_Channel == TIM2_Channel_1)
1907  0001 9e            	ld	a,xh
1908  0002 4d            	tnz	a
1909  0003 2615          	jrne	L5101
1910                     ; 825     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1912  0005 7211525b      	bres	21083,#0
1913                     ; 828     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
1915  0009 c65259        	ld	a,21081
1916  000c a48f          	and	a,#143
1917  000e c75259        	ld	21081,a
1918                     ; 831     TIM2->CCMR1 |= (uint8_t)TIM2_OCMode;
1920  0011 9f            	ld	a,xl
1921  0012 ca5259        	or	a,21081
1922  0015 c75259        	ld	21081,a
1924  0018 2014          	jra	L7101
1925  001a               L5101:
1926                     ; 836     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1928  001a 7219525b      	bres	21083,#4
1929                     ; 839     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
1931  001e c6525a        	ld	a,21082
1932  0021 a48f          	and	a,#143
1933  0023 c7525a        	ld	21082,a
1934                     ; 842     TIM2->CCMR2 |= (uint8_t)TIM2_OCMode;
1936  0026 c6525a        	ld	a,21082
1937  0029 1a02          	or	a,(OFST+2,sp)
1938  002b c7525a        	ld	21082,a
1939  002e               L7101:
1940                     ; 844 }
1943  002e 85            	popw	x
1944  002f 87            	retf	
1975                     ; 852 void TIM2_SetCompare1(uint16_t Compare)
1975                     ; 853 {
1976                     .text:	section	.text,new
1977  0000               f_TIM2_SetCompare1:
1981                     ; 855   TIM2->CCR1H = (uint8_t)(Compare >> 8);
1983  0000 9e            	ld	a,xh
1984  0001 c75261        	ld	21089,a
1985                     ; 856   TIM2->CCR1L = (uint8_t)(Compare);
1987  0004 9f            	ld	a,xl
1988  0005 c75262        	ld	21090,a
1989                     ; 857 }
1992  0008 87            	retf	
2023                     ; 865 void TIM2_SetCompare2(uint16_t Compare)
2023                     ; 866 {
2024                     .text:	section	.text,new
2025  0000               f_TIM2_SetCompare2:
2029                     ; 868   TIM2->CCR2H = (uint8_t)(Compare >> 8);
2031  0000 9e            	ld	a,xh
2032  0001 c75263        	ld	21091,a
2033                     ; 869   TIM2->CCR2L = (uint8_t)(Compare);
2035  0004 9f            	ld	a,xl
2036  0005 c75264        	ld	21092,a
2037                     ; 870 }
2040  0008 87            	retf	
2104                     ; 880 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2104                     ; 881 {
2105                     .text:	section	.text,new
2106  0000               f_TIM2_ForcedOC1Config:
2108  0000 88            	push	a
2109  0001 88            	push	a
2110       00000001      OFST:	set	1
2113                     ; 882   uint8_t tmpccmr1 = 0;
2115                     ; 885   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
2117                     ; 887   tmpccmr1 = TIM2->CCMR1;
2119  0002 c65259        	ld	a,21081
2120                     ; 890   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
2122  0005 a48f          	and	a,#143
2123                     ; 893   tmpccmr1 |= (uint8_t)TIM2_ForcedAction;
2125  0007 1a02          	or	a,(OFST+1,sp)
2126                     ; 895   TIM2->CCMR1 = tmpccmr1;
2128  0009 c75259        	ld	21081,a
2129                     ; 896 }
2132  000c 85            	popw	x
2133  000d 87            	retf	
2175                     ; 906 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2175                     ; 907 {
2176                     .text:	section	.text,new
2177  0000               f_TIM2_ForcedOC2Config:
2179  0000 88            	push	a
2180  0001 88            	push	a
2181       00000001      OFST:	set	1
2184                     ; 908   uint8_t tmpccmr2 = 0;
2186                     ; 911   assert_param(IS_TIM2_FORCED_ACTION(TIM2_ForcedAction));
2188                     ; 913   tmpccmr2 = TIM2->CCMR2;
2190  0002 c6525a        	ld	a,21082
2191                     ; 916   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
2193  0005 a48f          	and	a,#143
2194                     ; 919   tmpccmr2 |= (uint8_t)TIM2_ForcedAction;
2196  0007 1a02          	or	a,(OFST+1,sp)
2197                     ; 921   TIM2->CCMR2 = tmpccmr2;
2199  0009 c7525a        	ld	21082,a
2200                     ; 922 }
2203  000c 85            	popw	x
2204  000d 87            	retf	
2239                     ; 930 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2239                     ; 931 {
2240                     .text:	section	.text,new
2241  0000               f_TIM2_OC1PreloadConfig:
2245                     ; 933   assert_param(IS_FUNCTIONAL_STATE(NewState));
2247                     ; 936   if (NewState != DISABLE)
2249  0000 4d            	tnz	a
2250  0001 2705          	jreq	L7311
2251                     ; 938     TIM2->CCMR1 |= TIM_CCMR_OCxPE ;
2253  0003 72165259      	bset	21081,#3
2256  0007 87            	retf	
2257  0008               L7311:
2258                     ; 942     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2260  0008 72175259      	bres	21081,#3
2261                     ; 944 }
2264  000c 87            	retf	
2299                     ; 952 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2299                     ; 953 {
2300                     .text:	section	.text,new
2301  0000               f_TIM2_OC2PreloadConfig:
2305                     ; 955   assert_param(IS_FUNCTIONAL_STATE(NewState));
2307                     ; 958   if (NewState != DISABLE)
2309  0000 4d            	tnz	a
2310  0001 2705          	jreq	L1611
2311                     ; 960     TIM2->CCMR2 |= TIM_CCMR_OCxPE ;
2313  0003 7216525a      	bset	21082,#3
2316  0007 87            	retf	
2317  0008               L1611:
2318                     ; 964     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2320  0008 7217525a      	bres	21082,#3
2321                     ; 966 }
2324  000c 87            	retf	
2358                     ; 974 void TIM2_OC1FastConfig(FunctionalState NewState)
2358                     ; 975 {
2359                     .text:	section	.text,new
2360  0000               f_TIM2_OC1FastConfig:
2364                     ; 977   assert_param(IS_FUNCTIONAL_STATE(NewState));
2366                     ; 980   if (NewState != DISABLE)
2368  0000 4d            	tnz	a
2369  0001 2705          	jreq	L3021
2370                     ; 982     TIM2->CCMR1 |= TIM_CCMR_OCxFE ;
2372  0003 72145259      	bset	21081,#2
2375  0007 87            	retf	
2376  0008               L3021:
2377                     ; 986     TIM2->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2379  0008 72155259      	bres	21081,#2
2380                     ; 988 }
2383  000c 87            	retf	
2417                     ; 997 void TIM2_OC2FastConfig(FunctionalState NewState)
2417                     ; 998 {
2418                     .text:	section	.text,new
2419  0000               f_TIM2_OC2FastConfig:
2423                     ; 1000   assert_param(IS_FUNCTIONAL_STATE(NewState));
2425                     ; 1003   if (NewState != DISABLE)
2427  0000 4d            	tnz	a
2428  0001 2705          	jreq	L5221
2429                     ; 1005     TIM2->CCMR2 |= TIM_CCMR_OCxFE ;
2431  0003 7214525a      	bset	21082,#2
2434  0007 87            	retf	
2435  0008               L5221:
2436                     ; 1009     TIM2->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2438  0008 7215525a      	bres	21082,#2
2439                     ; 1011 }
2442  000c 87            	retf	
2477                     ; 1021 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2477                     ; 1022 {
2478                     .text:	section	.text,new
2479  0000               f_TIM2_OC1PolarityConfig:
2483                     ; 1024   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
2485                     ; 1027   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
2487  0000 4a            	dec	a
2488  0001 2605          	jrne	L7421
2489                     ; 1029     TIM2->CCER1 |= TIM_CCER1_CC1P ;
2491  0003 7212525b      	bset	21083,#1
2494  0007 87            	retf	
2495  0008               L7421:
2496                     ; 1033     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
2498  0008 7213525b      	bres	21083,#1
2499                     ; 1035 }
2502  000c 87            	retf	
2537                     ; 1045 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2537                     ; 1046 {
2538                     .text:	section	.text,new
2539  0000               f_TIM2_OC2PolarityConfig:
2543                     ; 1048   assert_param(IS_TIM2_OC_POLARITY(TIM2_OCPolarity));
2545                     ; 1051   if (TIM2_OCPolarity == TIM2_OCPolarity_Low)
2547  0000 4a            	dec	a
2548  0001 2605          	jrne	L1721
2549                     ; 1053     TIM2->CCER1 |= TIM_CCER1_CC2P ;
2551  0003 721a525b      	bset	21083,#5
2554  0007 87            	retf	
2555  0008               L1721:
2556                     ; 1057     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
2558  0008 721b525b      	bres	21083,#5
2559                     ; 1059 }
2562  000c 87            	retf	
2606                     ; 1071 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel,
2606                     ; 1072                  FunctionalState NewState)
2606                     ; 1073 {
2607                     .text:	section	.text,new
2608  0000               f_TIM2_CCxCmd:
2610  0000 89            	pushw	x
2611       00000000      OFST:	set	0
2614                     ; 1075   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
2616                     ; 1076   assert_param(IS_FUNCTIONAL_STATE(NewState));
2618                     ; 1078   if (TIM2_Channel == TIM2_Channel_1)
2620  0001 9e            	ld	a,xh
2621  0002 4d            	tnz	a
2622  0003 2610          	jrne	L7131
2623                     ; 1081     if (NewState != DISABLE)
2625  0005 9f            	ld	a,xl
2626  0006 4d            	tnz	a
2627  0007 2706          	jreq	L1231
2628                     ; 1083       TIM2->CCER1 |= TIM_CCER1_CC1E ;
2630  0009 7210525b      	bset	21083,#0
2632  000d 2014          	jra	L5231
2633  000f               L1231:
2634                     ; 1087       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
2636  000f 7211525b      	bres	21083,#0
2637  0013 200e          	jra	L5231
2638  0015               L7131:
2639                     ; 1094     if (NewState != DISABLE)
2641  0015 7b02          	ld	a,(OFST+2,sp)
2642  0017 2706          	jreq	L7231
2643                     ; 1096       TIM2->CCER1 |= TIM_CCER1_CC2E;
2645  0019 7218525b      	bset	21083,#4
2647  001d 2004          	jra	L5231
2648  001f               L7231:
2649                     ; 1100       TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
2651  001f 7219525b      	bres	21083,#4
2652  0023               L5231:
2653                     ; 1103 }
2656  0023 85            	popw	x
2657  0024 87            	retf	
2818                     ; 1181 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
2818                     ; 1182                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
2818                     ; 1183                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
2818                     ; 1184                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
2818                     ; 1185                  uint8_t TIM2_ICFilter)
2818                     ; 1186 {
2819                     .text:	section	.text,new
2820  0000               f_TIM2_ICInit:
2822  0000 89            	pushw	x
2823       00000000      OFST:	set	0
2826                     ; 1188   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
2828                     ; 1190   if (TIM2_Channel == TIM2_Channel_1)
2830  0001 9e            	ld	a,xh
2831  0002 4d            	tnz	a
2832  0003 2616          	jrne	L5241
2833                     ; 1193     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection, TIM2_ICFilter);
2835  0005 7b08          	ld	a,(OFST+8,sp)
2836  0007 88            	push	a
2837  0008 7b07          	ld	a,(OFST+7,sp)
2838  000a 97            	ld	xl,a
2839  000b 7b03          	ld	a,(OFST+3,sp)
2840  000d 95            	ld	xh,a
2841  000e 8d000000      	callf	L3f_TI1_Config
2843  0012 84            	pop	a
2844                     ; 1196     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
2846  0013 7b07          	ld	a,(OFST+7,sp)
2847  0015 8d000000      	callf	f_TIM2_SetIC1Prescaler
2850  0019 2014          	jra	L7241
2851  001b               L5241:
2852                     ; 1201     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection, TIM2_ICFilter);
2854  001b 7b08          	ld	a,(OFST+8,sp)
2855  001d 88            	push	a
2856  001e 7b07          	ld	a,(OFST+7,sp)
2857  0020 97            	ld	xl,a
2858  0021 7b03          	ld	a,(OFST+3,sp)
2859  0023 95            	ld	xh,a
2860  0024 8d000000      	callf	L5f_TI2_Config
2862  0028 84            	pop	a
2863                     ; 1204     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
2865  0029 7b07          	ld	a,(OFST+7,sp)
2866  002b 8d000000      	callf	f_TIM2_SetIC2Prescaler
2868  002f               L7241:
2869                     ; 1206 }
2872  002f 85            	popw	x
2873  0030 87            	retf	
2962                     ; 1232 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
2962                     ; 1233                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
2962                     ; 1234                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
2962                     ; 1235                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
2962                     ; 1236                      uint8_t TIM2_ICFilter)
2962                     ; 1237 {
2963                     .text:	section	.text,new
2964  0000               f_TIM2_PWMIConfig:
2966  0000 89            	pushw	x
2967  0001 89            	pushw	x
2968       00000002      OFST:	set	2
2971                     ; 1238   uint8_t icpolarity = TIM2_ICPolarity_Rising;
2973                     ; 1239   uint8_t icselection = TIM2_ICSelection_DirectTI;
2975                     ; 1242   assert_param(IS_TIM2_CHANNEL(TIM2_Channel));
2977                     ; 1245   if (TIM2_ICPolarity == TIM2_ICPolarity_Rising)
2979  0002 9f            	ld	a,xl
2980  0003 4d            	tnz	a
2981  0004 2605          	jrne	L1741
2982                     ; 1247     icpolarity = TIM2_ICPolarity_Falling;
2984  0006 4c            	inc	a
2985  0007 6b01          	ld	(OFST-1,sp),a
2987  0009 2002          	jra	L3741
2988  000b               L1741:
2989                     ; 1251     icpolarity = TIM2_ICPolarity_Rising;
2991  000b 0f01          	clr	(OFST-1,sp)
2992  000d               L3741:
2993                     ; 1255   if (TIM2_ICSelection == TIM2_ICSelection_DirectTI)
2995  000d 7b08          	ld	a,(OFST+6,sp)
2996  000f 4a            	dec	a
2997  0010 2604          	jrne	L5741
2998                     ; 1257     icselection = TIM2_ICSelection_IndirectTI;
3000  0012 a602          	ld	a,#2
3002  0014 2002          	jra	L7741
3003  0016               L5741:
3004                     ; 1261     icselection = TIM2_ICSelection_DirectTI;
3006  0016 a601          	ld	a,#1
3007  0018               L7741:
3008  0018 6b02          	ld	(OFST+0,sp),a
3009                     ; 1264   if (TIM2_Channel == TIM2_Channel_1)
3011  001a 7b03          	ld	a,(OFST+1,sp)
3012  001c 262a          	jrne	L1051
3013                     ; 1267     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection,
3013                     ; 1268                TIM2_ICFilter);
3015  001e 7b0a          	ld	a,(OFST+8,sp)
3016  0020 88            	push	a
3017  0021 7b09          	ld	a,(OFST+7,sp)
3018  0023 97            	ld	xl,a
3019  0024 7b05          	ld	a,(OFST+3,sp)
3020  0026 95            	ld	xh,a
3021  0027 8d000000      	callf	L3f_TI1_Config
3023  002b 84            	pop	a
3024                     ; 1271     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
3026  002c 7b09          	ld	a,(OFST+7,sp)
3027  002e 8d000000      	callf	f_TIM2_SetIC1Prescaler
3029                     ; 1274     TI2_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
3031  0032 7b0a          	ld	a,(OFST+8,sp)
3032  0034 88            	push	a
3033  0035 7b03          	ld	a,(OFST+1,sp)
3034  0037 97            	ld	xl,a
3035  0038 7b02          	ld	a,(OFST+0,sp)
3036  003a 95            	ld	xh,a
3037  003b 8d000000      	callf	L5f_TI2_Config
3039  003f 84            	pop	a
3040                     ; 1277     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
3042  0040 7b09          	ld	a,(OFST+7,sp)
3043  0042 8d000000      	callf	f_TIM2_SetIC2Prescaler
3046  0046 2028          	jra	L3051
3047  0048               L1051:
3048                     ; 1282     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection,
3048                     ; 1283                TIM2_ICFilter);
3050  0048 7b0a          	ld	a,(OFST+8,sp)
3051  004a 88            	push	a
3052  004b 7b09          	ld	a,(OFST+7,sp)
3053  004d 97            	ld	xl,a
3054  004e 7b05          	ld	a,(OFST+3,sp)
3055  0050 95            	ld	xh,a
3056  0051 8d000000      	callf	L5f_TI2_Config
3058  0055 84            	pop	a
3059                     ; 1286     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
3061  0056 7b09          	ld	a,(OFST+7,sp)
3062  0058 8d000000      	callf	f_TIM2_SetIC2Prescaler
3064                     ; 1289     TI1_Config((TIM2_ICPolarity_TypeDef)icpolarity, (TIM2_ICSelection_TypeDef)icselection, TIM2_ICFilter);
3066  005c 7b0a          	ld	a,(OFST+8,sp)
3067  005e 88            	push	a
3068  005f 7b03          	ld	a,(OFST+1,sp)
3069  0061 97            	ld	xl,a
3070  0062 7b02          	ld	a,(OFST+0,sp)
3071  0064 95            	ld	xh,a
3072  0065 8d000000      	callf	L3f_TI1_Config
3074  0069 84            	pop	a
3075                     ; 1292     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
3077  006a 7b09          	ld	a,(OFST+7,sp)
3078  006c 8d000000      	callf	f_TIM2_SetIC1Prescaler
3080  0070               L3051:
3081                     ; 1294 }
3084  0070 5b04          	addw	sp,#4
3085  0072 87            	retf	
3130                     ; 1301 uint16_t TIM2_GetCapture1(void)
3130                     ; 1302 {
3131                     .text:	section	.text,new
3132  0000               f_TIM2_GetCapture1:
3134  0000 5204          	subw	sp,#4
3135       00000004      OFST:	set	4
3138                     ; 1303   uint16_t tmpccr1 = 0;
3140                     ; 1306   tmpccr1h = TIM2->CCR1H;
3142  0002 c65261        	ld	a,21089
3143  0005 6b02          	ld	(OFST-2,sp),a
3144                     ; 1307   tmpccr1l = TIM2->CCR1L;
3146  0007 c65262        	ld	a,21090
3147  000a 6b01          	ld	(OFST-3,sp),a
3148                     ; 1309   tmpccr1 = (uint16_t)(tmpccr1l);
3150  000c 5f            	clrw	x
3151  000d 97            	ld	xl,a
3152  000e 1f03          	ldw	(OFST-1,sp),x
3153                     ; 1310   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3155  0010 5f            	clrw	x
3156  0011 7b02          	ld	a,(OFST-2,sp)
3157  0013 97            	ld	xl,a
3158  0014 7b04          	ld	a,(OFST+0,sp)
3159  0016 01            	rrwa	x,a
3160  0017 1a03          	or	a,(OFST-1,sp)
3161  0019 01            	rrwa	x,a
3162                     ; 1312   return ((uint16_t)tmpccr1);
3166  001a 5b04          	addw	sp,#4
3167  001c 87            	retf	
3212                     ; 1320 uint16_t TIM2_GetCapture2(void)
3212                     ; 1321 {
3213                     .text:	section	.text,new
3214  0000               f_TIM2_GetCapture2:
3216  0000 5204          	subw	sp,#4
3217       00000004      OFST:	set	4
3220                     ; 1322   uint16_t tmpccr2 = 0;
3222                     ; 1325   tmpccr2h = TIM2->CCR2H;
3224  0002 c65263        	ld	a,21091
3225  0005 6b02          	ld	(OFST-2,sp),a
3226                     ; 1326   tmpccr2l = TIM2->CCR2L;
3228  0007 c65264        	ld	a,21092
3229  000a 6b01          	ld	(OFST-3,sp),a
3230                     ; 1328   tmpccr2 = (uint16_t)(tmpccr2l);
3232  000c 5f            	clrw	x
3233  000d 97            	ld	xl,a
3234  000e 1f03          	ldw	(OFST-1,sp),x
3235                     ; 1329   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3237  0010 5f            	clrw	x
3238  0011 7b02          	ld	a,(OFST-2,sp)
3239  0013 97            	ld	xl,a
3240  0014 7b04          	ld	a,(OFST+0,sp)
3241  0016 01            	rrwa	x,a
3242  0017 1a03          	or	a,(OFST-1,sp)
3243  0019 01            	rrwa	x,a
3244                     ; 1331   return ((uint16_t)tmpccr2);
3248  001a 5b04          	addw	sp,#4
3249  001c 87            	retf	
3291                     ; 1344 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
3291                     ; 1345 {
3292                     .text:	section	.text,new
3293  0000               f_TIM2_SetIC1Prescaler:
3295  0000 88            	push	a
3296  0001 88            	push	a
3297       00000001      OFST:	set	1
3300                     ; 1346   uint8_t tmpccmr1 = 0;
3302                     ; 1349   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC1Prescaler));
3304                     ; 1351   tmpccmr1 = TIM2->CCMR1;
3306  0002 c65259        	ld	a,21081
3307                     ; 1354   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3309  0005 a4f3          	and	a,#243
3310                     ; 1357   tmpccmr1 |= (uint8_t)TIM2_IC1Prescaler;
3312  0007 1a02          	or	a,(OFST+1,sp)
3313                     ; 1359   TIM2->CCMR1 = tmpccmr1;
3315  0009 c75259        	ld	21081,a
3316                     ; 1360 }
3319  000c 85            	popw	x
3320  000d 87            	retf	
3362                     ; 1372 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3362                     ; 1373 {
3363                     .text:	section	.text,new
3364  0000               f_TIM2_SetIC2Prescaler:
3366  0000 88            	push	a
3367  0001 88            	push	a
3368       00000001      OFST:	set	1
3371                     ; 1374   uint8_t tmpccmr2 = 0;
3373                     ; 1377   assert_param(IS_TIM2_IC_PRESCALER(TIM2_IC2Prescaler));
3375                     ; 1379   tmpccmr2 = TIM2->CCMR2;
3377  0002 c6525a        	ld	a,21082
3378                     ; 1382   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3380  0005 a4f3          	and	a,#243
3381                     ; 1385   tmpccmr2 |= (uint8_t)TIM2_IC2Prescaler;
3383  0007 1a02          	or	a,(OFST+1,sp)
3384                     ; 1387   TIM2->CCMR2 = tmpccmr2;
3386  0009 c7525a        	ld	21082,a
3387                     ; 1388 }
3390  000c 85            	popw	x
3391  000d 87            	retf	
3476                     ; 1419 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
3476                     ; 1420 {
3477                     .text:	section	.text,new
3478  0000               f_TIM2_ITConfig:
3480  0000 89            	pushw	x
3481       00000000      OFST:	set	0
3484                     ; 1422   assert_param(IS_TIM2_IT(TIM2_IT));
3486                     ; 1423   assert_param(IS_FUNCTIONAL_STATE(NewState));
3488                     ; 1425   if (NewState != DISABLE)
3490  0001 9f            	ld	a,xl
3491  0002 4d            	tnz	a
3492  0003 2706          	jreq	L5461
3493                     ; 1428     TIM2->IER |= (uint8_t)TIM2_IT;
3495  0005 9e            	ld	a,xh
3496  0006 ca5255        	or	a,21077
3498  0009 2006          	jra	L7461
3499  000b               L5461:
3500                     ; 1433     TIM2->IER &= (uint8_t)(~(uint8_t)TIM2_IT);
3502  000b 7b01          	ld	a,(OFST+1,sp)
3503  000d 43            	cpl	a
3504  000e c45255        	and	a,21077
3505  0011               L7461:
3506  0011 c75255        	ld	21077,a
3507                     ; 1435 }
3510  0014 85            	popw	x
3511  0015 87            	retf	
3591                     ; 1448 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
3591                     ; 1449 {
3592                     .text:	section	.text,new
3593  0000               f_TIM2_GenerateEvent:
3597                     ; 1451   assert_param(IS_TIM2_EVENT_SOURCE((uint8_t)TIM2_EventSource));
3599                     ; 1454   TIM2->EGR |= (uint8_t)TIM2_EventSource;
3601  0000 ca5258        	or	a,21080
3602  0003 c75258        	ld	21080,a
3603                     ; 1455 }
3606  0006 87            	retf	
3740                     ; 1470 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3740                     ; 1471 {
3741                     .text:	section	.text,new
3742  0000               f_TIM2_GetFlagStatus:
3744  0000 89            	pushw	x
3745  0001 89            	pushw	x
3746       00000002      OFST:	set	2
3749                     ; 1472   FlagStatus bitstatus = RESET;
3751                     ; 1473   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3755                     ; 1476   assert_param(IS_TIM2_GET_FLAG(TIM2_FLAG));
3757                     ; 1478   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)(TIM2_FLAG));
3759  0002 9f            	ld	a,xl
3760  0003 c45256        	and	a,21078
3761  0006 6b01          	ld	(OFST-1,sp),a
3762                     ; 1479   tim2_flag_h = (uint8_t)(TIM2->SR2 & (uint8_t)((uint16_t)TIM2_FLAG >> 8));
3764  0008 c65257        	ld	a,21079
3765  000b 1403          	and	a,(OFST+1,sp)
3766  000d 6b02          	ld	(OFST+0,sp),a
3767                     ; 1481   if ((uint8_t)(tim2_flag_l | tim2_flag_h) != 0)
3769  000f 1a01          	or	a,(OFST-1,sp)
3770  0011 2702          	jreq	L5671
3771                     ; 1483     bitstatus = SET;
3773  0013 a601          	ld	a,#1
3775  0015               L5671:
3776                     ; 1487     bitstatus = RESET;
3778                     ; 1489   return ((FlagStatus)bitstatus);
3782  0015 5b04          	addw	sp,#4
3783  0017 87            	retf	
3817                     ; 1503 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3817                     ; 1504 {
3818                     .text:	section	.text,new
3819  0000               f_TIM2_ClearFlag:
3821  0000 89            	pushw	x
3822       00000000      OFST:	set	0
3825                     ; 1506   assert_param(IS_TIM2_CLEAR_FLAG((uint16_t)TIM2_FLAG));
3827                     ; 1508   TIM2->SR1 = (uint8_t)(~(uint8_t)(TIM2_FLAG));
3829  0001 9f            	ld	a,xl
3830  0002 43            	cpl	a
3831  0003 c75256        	ld	21078,a
3832                     ; 1509   TIM2->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM2_FLAG >> 8));
3834  0006 7b01          	ld	a,(OFST+1,sp)
3835  0008 43            	cpl	a
3836  0009 c75257        	ld	21079,a
3837                     ; 1510 }
3840  000c 85            	popw	x
3841  000d 87            	retf	
3900                     ; 1523 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3900                     ; 1524 {
3901                     .text:	section	.text,new
3902  0000               f_TIM2_GetITStatus:
3904  0000 88            	push	a
3905  0001 89            	pushw	x
3906       00000002      OFST:	set	2
3909                     ; 1525   ITStatus bitstatus = RESET;
3911                     ; 1527   uint8_t TIM2_itStatus = 0x0, TIM2_itEnable = 0x0;
3915                     ; 1530   assert_param(IS_TIM2_GET_IT(TIM2_IT));
3917                     ; 1532   TIM2_itStatus = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_IT);
3919  0002 c45256        	and	a,21078
3920  0005 6b01          	ld	(OFST-1,sp),a
3921                     ; 1534   TIM2_itEnable = (uint8_t)(TIM2->IER & (uint8_t)TIM2_IT);
3923  0007 c65255        	ld	a,21077
3924  000a 1403          	and	a,(OFST+1,sp)
3925  000c 6b02          	ld	(OFST+0,sp),a
3926                     ; 1536   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET))
3928  000e 7b01          	ld	a,(OFST-1,sp)
3929  0010 2708          	jreq	L5302
3931  0012 7b02          	ld	a,(OFST+0,sp)
3932  0014 2704          	jreq	L5302
3933                     ; 1538     bitstatus = (ITStatus)SET;
3935  0016 a601          	ld	a,#1
3937  0018 2001          	jra	L7302
3938  001a               L5302:
3939                     ; 1542     bitstatus = (ITStatus)RESET;
3941  001a 4f            	clr	a
3942  001b               L7302:
3943                     ; 1544   return ((ITStatus)bitstatus);
3947  001b 5b03          	addw	sp,#3
3948  001d 87            	retf	
3983                     ; 1558 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3983                     ; 1559 {
3984                     .text:	section	.text,new
3985  0000               f_TIM2_ClearITPendingBit:
3989                     ; 1561   assert_param(IS_TIM2_IT(TIM2_IT));
3991                     ; 1564   TIM2->SR1 = (uint8_t)(~(uint8_t)TIM2_IT);
3993  0000 43            	cpl	a
3994  0001 c75256        	ld	21078,a
3995                     ; 1565 }
3998  0004 87            	retf	
4070                     ; 1578 void TIM2_DMACmd( TIM2_DMASource_TypeDef TIM2_DMASource, FunctionalState NewState)
4070                     ; 1579 {
4071                     .text:	section	.text,new
4072  0000               f_TIM2_DMACmd:
4074  0000 89            	pushw	x
4075       00000000      OFST:	set	0
4078                     ; 1581   assert_param(IS_FUNCTIONAL_STATE(NewState));
4080                     ; 1582   assert_param(IS_TIM2_DMA_SOURCE(TIM2_DMASource));
4082                     ; 1584   if (NewState != DISABLE)
4084  0001 9f            	ld	a,xl
4085  0002 4d            	tnz	a
4086  0003 2706          	jreq	L3112
4087                     ; 1587     TIM2->DER |= TIM2_DMASource;
4089  0005 9e            	ld	a,xh
4090  0006 ca5254        	or	a,21076
4092  0009 2006          	jra	L5112
4093  000b               L3112:
4094                     ; 1592     TIM2->DER &= (uint8_t)(~TIM2_DMASource);
4096  000b 7b01          	ld	a,(OFST+1,sp)
4097  000d 43            	cpl	a
4098  000e c45254        	and	a,21076
4099  0011               L5112:
4100  0011 c75254        	ld	21076,a
4101                     ; 1594 }
4104  0014 85            	popw	x
4105  0015 87            	retf	
4139                     ; 1602 void TIM2_SelectCCDMA(FunctionalState NewState)
4139                     ; 1603 {
4140                     .text:	section	.text,new
4141  0000               f_TIM2_SelectCCDMA:
4145                     ; 1605   assert_param(IS_FUNCTIONAL_STATE(NewState));
4147                     ; 1607   if (NewState != DISABLE)
4149  0000 4d            	tnz	a
4150  0001 2705          	jreq	L5312
4151                     ; 1610     TIM2->CR2 |= TIM_CR2_CCDS;
4153  0003 72165251      	bset	21073,#3
4156  0007 87            	retf	
4157  0008               L5312:
4158                     ; 1615     TIM2->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
4160  0008 72175251      	bres	21073,#3
4161                     ; 1617 }
4164  000c 87            	retf	
4187                     ; 1641 void TIM2_InternalClockConfig(void)
4187                     ; 1642 {
4188                     .text:	section	.text,new
4189  0000               f_TIM2_InternalClockConfig:
4193                     ; 1644   TIM2->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
4195  0000 c65252        	ld	a,21074
4196  0003 a4f8          	and	a,#248
4197  0005 c75252        	ld	21074,a
4198                     ; 1645 }
4201  0008 87            	retf	
4287                     ; 1662 void TIM2_TIxExternalClockConfig(TIM2_TIxExternalCLK1Source_TypeDef TIM2_TIxExternalCLKSource,
4287                     ; 1663                                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
4287                     ; 1664                                  uint8_t ICFilter)
4287                     ; 1665 {
4288                     .text:	section	.text,new
4289  0000               f_TIM2_TIxExternalClockConfig:
4291  0000 89            	pushw	x
4292       00000000      OFST:	set	0
4295                     ; 1667   assert_param(IS_TIM2_TIXCLK_SOURCE(TIM2_TIxExternalCLKSource));
4297                     ; 1668   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
4299                     ; 1669   assert_param(IS_TIM2_IC_FILTER(ICFilter));
4301                     ; 1672   if (TIM2_TIxExternalCLKSource == TIM2_TIxExternalCLK1Source_TI2)
4303  0001 9e            	ld	a,xh
4304  0002 a160          	cp	a,#96
4305  0004 260f          	jrne	L7022
4306                     ; 1674     TI2_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, ICFilter);
4308  0006 7b06          	ld	a,(OFST+6,sp)
4309  0008 88            	push	a
4310  0009 ae0001        	ldw	x,#1
4311  000c 7b03          	ld	a,(OFST+3,sp)
4312  000e 95            	ld	xh,a
4313  000f 8d000000      	callf	L5f_TI2_Config
4316  0013 200d          	jra	L1122
4317  0015               L7022:
4318                     ; 1678     TI1_Config(TIM2_ICPolarity, TIM2_ICSelection_DirectTI, ICFilter);
4320  0015 7b06          	ld	a,(OFST+6,sp)
4321  0017 88            	push	a
4322  0018 ae0001        	ldw	x,#1
4323  001b 7b03          	ld	a,(OFST+3,sp)
4324  001d 95            	ld	xh,a
4325  001e 8d000000      	callf	L3f_TI1_Config
4327  0022               L1122:
4328  0022 84            	pop	a
4329                     ; 1682   TIM2_SelectInputTrigger((TIM2_TRGSelection_TypeDef)TIM2_TIxExternalCLKSource);
4331  0023 7b01          	ld	a,(OFST+1,sp)
4332  0025 8d000000      	callf	f_TIM2_SelectInputTrigger
4334                     ; 1685   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
4336  0029 c65252        	ld	a,21074
4337  002c aa07          	or	a,#7
4338  002e c75252        	ld	21074,a
4339                     ; 1686 }
4342  0031 85            	popw	x
4343  0032 87            	retf	
4457                     ; 1704 void TIM2_ETRClockMode1Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
4457                     ; 1705                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
4457                     ; 1706                               uint8_t ExtTRGFilter)
4457                     ; 1707 {
4458                     .text:	section	.text,new
4459  0000               f_TIM2_ETRClockMode1Config:
4461  0000 89            	pushw	x
4462       00000000      OFST:	set	0
4465                     ; 1709   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, ExtTRGFilter);
4467  0001 7b06          	ld	a,(OFST+6,sp)
4468  0003 88            	push	a
4469  0004 7b02          	ld	a,(OFST+2,sp)
4470  0006 95            	ld	xh,a
4471  0007 8d000000      	callf	f_TIM2_ETRConfig
4473  000b 84            	pop	a
4474                     ; 1712   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
4476  000c c65252        	ld	a,21074
4477  000f a4f8          	and	a,#248
4478  0011 c75252        	ld	21074,a
4479                     ; 1713   TIM2->SMCR |= (uint8_t)(TIM2_SlaveMode_External1);
4481  0014 c65252        	ld	a,21074
4482  0017 aa07          	or	a,#7
4483  0019 c75252        	ld	21074,a
4484                     ; 1716   TIM2->SMCR &= (uint8_t)(~TIM_SMCR_TS);
4486  001c c65252        	ld	a,21074
4487  001f a48f          	and	a,#143
4488  0021 c75252        	ld	21074,a
4489                     ; 1717   TIM2->SMCR |= (uint8_t)((TIM2_TRGSelection_TypeDef)TIM2_TRGSelection_ETRF);
4491  0024 c65252        	ld	a,21074
4492  0027 aa70          	or	a,#112
4493  0029 c75252        	ld	21074,a
4494                     ; 1718 }
4497  002c 85            	popw	x
4498  002d 87            	retf	
4553                     ; 1736 void TIM2_ETRClockMode2Config(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
4553                     ; 1737                               TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
4553                     ; 1738                               uint8_t ExtTRGFilter)
4553                     ; 1739 {
4554                     .text:	section	.text,new
4555  0000               f_TIM2_ETRClockMode2Config:
4557  0000 89            	pushw	x
4558       00000000      OFST:	set	0
4561                     ; 1741   TIM2_ETRConfig(TIM2_ExtTRGPrescaler, TIM2_ExtTRGPolarity, ExtTRGFilter);
4563  0001 7b06          	ld	a,(OFST+6,sp)
4564  0003 88            	push	a
4565  0004 7b02          	ld	a,(OFST+2,sp)
4566  0006 95            	ld	xh,a
4567  0007 8d000000      	callf	f_TIM2_ETRConfig
4569  000b 721c5253      	bset	21075,#6
4570  000f 84            	pop	a
4571                     ; 1744   TIM2->ETR |= TIM_ETR_ECE ;
4573                     ; 1745 }
4576  0010 85            	popw	x
4577  0011 87            	retf	
4690                     ; 1796 void TIM2_SelectInputTrigger(TIM2_TRGSelection_TypeDef TIM2_InputTriggerSource)
4690                     ; 1797 {
4691                     .text:	section	.text,new
4692  0000               f_TIM2_SelectInputTrigger:
4694  0000 88            	push	a
4695  0001 88            	push	a
4696       00000001      OFST:	set	1
4699                     ; 1798   uint8_t tmpsmcr = 0;
4701                     ; 1801   assert_param(IS_TIM2_TRIGGER_SELECTION(TIM2_InputTriggerSource));
4703                     ; 1803   tmpsmcr = TIM2->SMCR;
4705  0002 c65252        	ld	a,21074
4706                     ; 1806   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
4708  0005 a48f          	and	a,#143
4709                     ; 1807   tmpsmcr |= (uint8_t)TIM2_InputTriggerSource;
4711  0007 1a02          	or	a,(OFST+1,sp)
4712                     ; 1809   TIM2->SMCR = (uint8_t)tmpsmcr;
4714  0009 c75252        	ld	21074,a
4715                     ; 1810 }
4718  000c 85            	popw	x
4719  000d 87            	retf	
4815                     ; 1824 void TIM2_SelectOutputTrigger(TIM2_TRGOSource_TypeDef TIM2_TRGOSource)
4815                     ; 1825 {
4816                     .text:	section	.text,new
4817  0000               f_TIM2_SelectOutputTrigger:
4819  0000 88            	push	a
4820  0001 88            	push	a
4821       00000001      OFST:	set	1
4824                     ; 1826   uint8_t tmpcr2 = 0;
4826                     ; 1829   assert_param(IS_TIM2_TRGO_SOURCE(TIM2_TRGOSource));
4828                     ; 1831   tmpcr2 = TIM2->CR2;
4830  0002 c65251        	ld	a,21073
4831                     ; 1834   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
4833  0005 a48f          	and	a,#143
4834                     ; 1837   tmpcr2 |=  (uint8_t)TIM2_TRGOSource;
4836  0007 1a02          	or	a,(OFST+1,sp)
4837                     ; 1839   TIM2->CR2 = tmpcr2;
4839  0009 c75251        	ld	21073,a
4840                     ; 1840 }
4843  000c 85            	popw	x
4844  000d 87            	retf	
4924                     ; 1852 void TIM2_SelectSlaveMode(TIM2_SlaveMode_TypeDef TIM2_SlaveMode)
4924                     ; 1853 {
4925                     .text:	section	.text,new
4926  0000               f_TIM2_SelectSlaveMode:
4928  0000 88            	push	a
4929  0001 88            	push	a
4930       00000001      OFST:	set	1
4933                     ; 1854   uint8_t tmpsmcr = 0;
4935                     ; 1857   assert_param(IS_TIM2_SLAVE_MODE(TIM2_SlaveMode));
4937                     ; 1859   tmpsmcr = TIM2->SMCR;
4939  0002 c65252        	ld	a,21074
4940                     ; 1862   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
4942  0005 a4f8          	and	a,#248
4943                     ; 1865   tmpsmcr |= (uint8_t)TIM2_SlaveMode;
4945  0007 1a02          	or	a,(OFST+1,sp)
4946                     ; 1867   TIM2->SMCR = tmpsmcr;
4948  0009 c75252        	ld	21074,a
4949                     ; 1868 }
4952  000c 85            	popw	x
4953  000d 87            	retf	
4988                     ; 1876 void TIM2_SelectMasterSlaveMode(FunctionalState NewState)
4988                     ; 1877 {
4989                     .text:	section	.text,new
4990  0000               f_TIM2_SelectMasterSlaveMode:
4994                     ; 1879   assert_param(IS_FUNCTIONAL_STATE(NewState));
4996                     ; 1882   if (NewState != DISABLE)
4998  0000 4d            	tnz	a
4999  0001 2705          	jreq	L5642
5000                     ; 1884     TIM2->SMCR |= TIM_SMCR_MSM;
5002  0003 721e5252      	bset	21074,#7
5005  0007 87            	retf	
5006  0008               L5642:
5007                     ; 1888     TIM2->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
5009  0008 721f5252      	bres	21074,#7
5010                     ; 1890 }
5013  000c 87            	retf	
5066                     ; 1908 void TIM2_ETRConfig(TIM2_ExtTRGPSC_TypeDef TIM2_ExtTRGPrescaler,
5066                     ; 1909                     TIM2_ExtTRGPolarity_TypeDef TIM2_ExtTRGPolarity,
5066                     ; 1910                     uint8_t ExtTRGFilter)
5066                     ; 1911 {
5067                     .text:	section	.text,new
5068  0000               f_TIM2_ETRConfig:
5070  0000 89            	pushw	x
5071       00000000      OFST:	set	0
5074                     ; 1913   assert_param(IS_TIM2_EXT_PRESCALER(TIM2_ExtTRGPrescaler));
5076                     ; 1914   assert_param(IS_TIM2_EXT_POLARITY(TIM2_ExtTRGPolarity));
5078                     ; 1915   assert_param(IS_TIM2_EXT_FILTER(ExtTRGFilter));
5080                     ; 1918   TIM2->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM2_ExtTRGPrescaler | (uint8_t)TIM2_ExtTRGPolarity)
5080                     ; 1919                          | (uint8_t)ExtTRGFilter);
5082  0001 9f            	ld	a,xl
5083  0002 1a01          	or	a,(OFST+1,sp)
5084  0004 1a06          	or	a,(OFST+6,sp)
5085  0006 ca5253        	or	a,21075
5086  0009 c75253        	ld	21075,a
5087                     ; 1920 }
5090  000c 85            	popw	x
5091  000d 87            	retf	
5197                     ; 1955 void TIM2_EncoderInterfaceConfig(TIM2_EncoderMode_TypeDef TIM2_EncoderMode,
5197                     ; 1956                                  TIM2_ICPolarity_TypeDef TIM2_IC1Polarity,
5197                     ; 1957                                  TIM2_ICPolarity_TypeDef TIM2_IC2Polarity)
5197                     ; 1958 {
5198                     .text:	section	.text,new
5199  0000               f_TIM2_EncoderInterfaceConfig:
5201  0000 89            	pushw	x
5202  0001 5203          	subw	sp,#3
5203       00000003      OFST:	set	3
5206                     ; 1959   uint8_t tmpsmcr = 0;
5208                     ; 1960   uint8_t tmpccmr1 = 0;
5210                     ; 1961   uint8_t tmpccmr2 = 0;
5212                     ; 1964   assert_param(IS_TIM2_ENCODER_MODE(TIM2_EncoderMode));
5214                     ; 1965   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC1Polarity));
5216                     ; 1966   assert_param(IS_TIM2_IC_POLARITY(TIM2_IC2Polarity));
5218                     ; 1968   tmpsmcr = TIM2->SMCR;
5220  0003 c65252        	ld	a,21074
5221  0006 6b01          	ld	(OFST-2,sp),a
5222                     ; 1969   tmpccmr1 = TIM2->CCMR1;
5224  0008 c65259        	ld	a,21081
5225  000b 6b02          	ld	(OFST-1,sp),a
5226                     ; 1970   tmpccmr2 = TIM2->CCMR2;
5228  000d c6525a        	ld	a,21082
5229  0010 6b03          	ld	(OFST+0,sp),a
5230                     ; 1973   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
5232  0012 7b01          	ld	a,(OFST-2,sp)
5233  0014 a4f0          	and	a,#240
5234  0016 6b01          	ld	(OFST-2,sp),a
5235                     ; 1974   tmpsmcr |= (uint8_t)TIM2_EncoderMode;
5237  0018 9e            	ld	a,xh
5238  0019 1a01          	or	a,(OFST-2,sp)
5239  001b 6b01          	ld	(OFST-2,sp),a
5240                     ; 1977   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
5242  001d 7b02          	ld	a,(OFST-1,sp)
5243  001f a4fc          	and	a,#252
5244  0021 6b02          	ld	(OFST-1,sp),a
5245                     ; 1978   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
5247  0023 7b03          	ld	a,(OFST+0,sp)
5248  0025 a4fc          	and	a,#252
5249  0027 6b03          	ld	(OFST+0,sp),a
5250                     ; 1979   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
5252  0029 7b02          	ld	a,(OFST-1,sp)
5253  002b aa01          	or	a,#1
5254  002d 6b02          	ld	(OFST-1,sp),a
5255                     ; 1980   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
5257  002f 7b03          	ld	a,(OFST+0,sp)
5258  0031 aa01          	or	a,#1
5259  0033 6b03          	ld	(OFST+0,sp),a
5260                     ; 1983   if (TIM2_IC1Polarity == TIM2_ICPolarity_Falling)
5262  0035 9f            	ld	a,xl
5263  0036 4a            	dec	a
5264  0037 2606          	jrne	L3652
5265                     ; 1985     TIM2->CCER1 |= TIM_CCER1_CC1P ;
5267  0039 7212525b      	bset	21083,#1
5269  003d 2004          	jra	L5652
5270  003f               L3652:
5271                     ; 1989     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
5273  003f 7213525b      	bres	21083,#1
5274  0043               L5652:
5275                     ; 1992   if (TIM2_IC2Polarity == TIM2_ICPolarity_Falling)
5277  0043 7b09          	ld	a,(OFST+6,sp)
5278  0045 4a            	dec	a
5279  0046 2606          	jrne	L7652
5280                     ; 1994     TIM2->CCER1 |= TIM_CCER1_CC2P ;
5282  0048 721a525b      	bset	21083,#5
5284  004c 2004          	jra	L1752
5285  004e               L7652:
5286                     ; 1998     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5288  004e 721b525b      	bres	21083,#5
5289  0052               L1752:
5290                     ; 2001   TIM2->SMCR = tmpsmcr;
5292  0052 7b01          	ld	a,(OFST-2,sp)
5293  0054 c75252        	ld	21074,a
5294                     ; 2002   TIM2->CCMR1 = tmpccmr1;
5296  0057 7b02          	ld	a,(OFST-1,sp)
5297  0059 c75259        	ld	21081,a
5298                     ; 2003   TIM2->CCMR2 = tmpccmr2;
5300  005c 7b03          	ld	a,(OFST+0,sp)
5301  005e c7525a        	ld	21082,a
5302                     ; 2004 }
5305  0061 5b05          	addw	sp,#5
5306  0063 87            	retf	
5341                     ; 2012 void TIM2_SelectHallSensor(FunctionalState NewState)
5341                     ; 2013 {
5342                     .text:	section	.text,new
5343  0000               f_TIM2_SelectHallSensor:
5347                     ; 2015   assert_param(IS_FUNCTIONAL_STATE(NewState));
5349                     ; 2018   if (NewState != DISABLE)
5351  0000 4d            	tnz	a
5352  0001 2705          	jreq	L1162
5353                     ; 2020     TIM2->CR2 |= TIM_CR2_TI1S;
5355  0003 721e5251      	bset	21073,#7
5358  0007 87            	retf	
5359  0008               L1162:
5360                     ; 2024     TIM2->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
5362  0008 721f5251      	bres	21073,#7
5363                     ; 2026 }
5366  000c 87            	retf	
5431                     ; 2047 static void TI1_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity, \
5431                     ; 2048                        TIM2_ICSelection_TypeDef TIM2_ICSelection, \
5431                     ; 2049                        uint8_t TIM2_ICFilter)
5431                     ; 2050 {
5432                     .text:	section	.text,new
5433  0000               L3f_TI1_Config:
5435  0000 89            	pushw	x
5436  0001 89            	pushw	x
5437       00000002      OFST:	set	2
5440                     ; 2051   uint8_t tmpccmr1 = 0;
5442                     ; 2052   uint8_t tmpicpolarity = TIM2_ICPolarity;
5444  0002 9e            	ld	a,xh
5445  0003 6b01          	ld	(OFST-1,sp),a
5446                     ; 2053   tmpccmr1 = TIM2->CCMR1;
5448  0005 c65259        	ld	a,21081
5449  0008 6b02          	ld	(OFST+0,sp),a
5450                     ; 2056   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5452                     ; 2057   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5454                     ; 2058   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5456                     ; 2061   TIM2->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5458  000a 7211525b      	bres	21083,#0
5459                     ; 2064   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5461  000e a40c          	and	a,#12
5462  0010 6b02          	ld	(OFST+0,sp),a
5463                     ; 2065   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5465  0012 7b08          	ld	a,(OFST+6,sp)
5466  0014 97            	ld	xl,a
5467  0015 a610          	ld	a,#16
5468  0017 42            	mul	x,a
5469  0018 9f            	ld	a,xl
5470  0019 1a04          	or	a,(OFST+2,sp)
5471  001b 1a02          	or	a,(OFST+0,sp)
5472  001d 6b02          	ld	(OFST+0,sp),a
5473                     ; 2067   TIM2->CCMR1 = tmpccmr1;
5475  001f c75259        	ld	21081,a
5476                     ; 2070   if (tmpicpolarity == (uint8_t)(TIM2_ICPolarity_Falling))
5478  0022 7b01          	ld	a,(OFST-1,sp)
5479  0024 4a            	dec	a
5480  0025 2606          	jrne	L5462
5481                     ; 2072     TIM2->CCER1 |= TIM_CCER1_CC1P;
5483  0027 7212525b      	bset	21083,#1
5485  002b 2004          	jra	L7462
5486  002d               L5462:
5487                     ; 2076     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5489  002d 7213525b      	bres	21083,#1
5490  0031               L7462:
5491                     ; 2080   TIM2->CCER1 |=  TIM_CCER1_CC1E;
5493  0031 7210525b      	bset	21083,#0
5494                     ; 2081 }
5497  0035 5b04          	addw	sp,#4
5498  0037 87            	retf	
5563                     ; 2098 static void TI2_Config(TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
5563                     ; 2099                        TIM2_ICSelection_TypeDef TIM2_ICSelection,
5563                     ; 2100                        uint8_t TIM2_ICFilter)
5563                     ; 2101 {
5564                     .text:	section	.text,new
5565  0000               L5f_TI2_Config:
5567  0000 89            	pushw	x
5568  0001 89            	pushw	x
5569       00000002      OFST:	set	2
5572                     ; 2102   uint8_t tmpccmr2 = 0;
5574                     ; 2103   uint8_t tmpicpolarity = TIM2_ICPolarity;
5576  0002 9e            	ld	a,xh
5577  0003 6b01          	ld	(OFST-1,sp),a
5578                     ; 2106   assert_param(IS_TIM2_IC_POLARITY(TIM2_ICPolarity));
5580                     ; 2107   assert_param(IS_TIM2_IC_SELECTION(TIM2_ICSelection));
5582                     ; 2108   assert_param(IS_TIM2_IC_FILTER(TIM2_ICFilter));
5584                     ; 2110   tmpccmr2 = TIM2->CCMR2;
5586  0005 c6525a        	ld	a,21082
5587  0008 6b02          	ld	(OFST+0,sp),a
5588                     ; 2113   TIM2->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5590  000a 7219525b      	bres	21083,#4
5591                     ; 2116   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5593  000e a40c          	and	a,#12
5594  0010 6b02          	ld	(OFST+0,sp),a
5595                     ; 2117   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM2_ICSelection)) | ((uint8_t)(TIM2_ICFilter << 4)));
5597  0012 7b08          	ld	a,(OFST+6,sp)
5598  0014 97            	ld	xl,a
5599  0015 a610          	ld	a,#16
5600  0017 42            	mul	x,a
5601  0018 9f            	ld	a,xl
5602  0019 1a04          	or	a,(OFST+2,sp)
5603  001b 1a02          	or	a,(OFST+0,sp)
5604  001d 6b02          	ld	(OFST+0,sp),a
5605                     ; 2119   TIM2->CCMR2 = tmpccmr2;
5607  001f c7525a        	ld	21082,a
5608                     ; 2122   if (tmpicpolarity == TIM2_ICPolarity_Falling)
5610  0022 7b01          	ld	a,(OFST-1,sp)
5611  0024 4a            	dec	a
5612  0025 2606          	jrne	L1072
5613                     ; 2124     TIM2->CCER1 |= TIM_CCER1_CC2P ;
5615  0027 721a525b      	bset	21083,#5
5617  002b 2004          	jra	L3072
5618  002d               L1072:
5619                     ; 2128     TIM2->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5621  002d 721b525b      	bres	21083,#5
5622  0031               L3072:
5623                     ; 2132   TIM2->CCER1 |=  TIM_CCER1_CC2E;
5625  0031 7218525b      	bset	21083,#4
5626                     ; 2133 }
5629  0035 5b04          	addw	sp,#4
5630  0037 87            	retf	
5642                     	xdef	f_TIM2_SelectHallSensor
5643                     	xdef	f_TIM2_EncoderInterfaceConfig
5644                     	xdef	f_TIM2_ETRConfig
5645                     	xdef	f_TIM2_SelectMasterSlaveMode
5646                     	xdef	f_TIM2_SelectSlaveMode
5647                     	xdef	f_TIM2_SelectOutputTrigger
5648                     	xdef	f_TIM2_SelectInputTrigger
5649                     	xdef	f_TIM2_ETRClockMode2Config
5650                     	xdef	f_TIM2_ETRClockMode1Config
5651                     	xdef	f_TIM2_TIxExternalClockConfig
5652                     	xdef	f_TIM2_InternalClockConfig
5653                     	xdef	f_TIM2_SelectCCDMA
5654                     	xdef	f_TIM2_DMACmd
5655                     	xdef	f_TIM2_ClearITPendingBit
5656                     	xdef	f_TIM2_GetITStatus
5657                     	xdef	f_TIM2_ClearFlag
5658                     	xdef	f_TIM2_GetFlagStatus
5659                     	xdef	f_TIM2_GenerateEvent
5660                     	xdef	f_TIM2_ITConfig
5661                     	xdef	f_TIM2_SetIC2Prescaler
5662                     	xdef	f_TIM2_SetIC1Prescaler
5663                     	xdef	f_TIM2_GetCapture2
5664                     	xdef	f_TIM2_GetCapture1
5665                     	xdef	f_TIM2_PWMIConfig
5666                     	xdef	f_TIM2_ICInit
5667                     	xdef	f_TIM2_CCxCmd
5668                     	xdef	f_TIM2_OC2PolarityConfig
5669                     	xdef	f_TIM2_OC1PolarityConfig
5670                     	xdef	f_TIM2_OC2FastConfig
5671                     	xdef	f_TIM2_OC1FastConfig
5672                     	xdef	f_TIM2_OC2PreloadConfig
5673                     	xdef	f_TIM2_OC1PreloadConfig
5674                     	xdef	f_TIM2_ForcedOC2Config
5675                     	xdef	f_TIM2_ForcedOC1Config
5676                     	xdef	f_TIM2_SetCompare2
5677                     	xdef	f_TIM2_SetCompare1
5678                     	xdef	f_TIM2_SelectOCxM
5679                     	xdef	f_TIM2_CtrlPWMOutputs
5680                     	xdef	f_TIM2_BKRConfig
5681                     	xdef	f_TIM2_OC2Init
5682                     	xdef	f_TIM2_OC1Init
5683                     	xdef	f_TIM2_Cmd
5684                     	xdef	f_TIM2_SelectOnePulseMode
5685                     	xdef	f_TIM2_ARRPreloadConfig
5686                     	xdef	f_TIM2_UpdateRequestConfig
5687                     	xdef	f_TIM2_UpdateDisableConfig
5688                     	xdef	f_TIM2_GetPrescaler
5689                     	xdef	f_TIM2_GetCounter
5690                     	xdef	f_TIM2_SetAutoreload
5691                     	xdef	f_TIM2_SetCounter
5692                     	xdef	f_TIM2_CounterModeConfig
5693                     	xdef	f_TIM2_PrescalerConfig
5694                     	xdef	f_TIM2_TimeBaseInit
5695                     	xdef	f_TIM2_DeInit
5714                     	end
