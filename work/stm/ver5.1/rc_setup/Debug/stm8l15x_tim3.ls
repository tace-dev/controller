   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  47                     ; 165 void TIM3_DeInit(void)
  47                     ; 166 {
  49                     .text:	section	.text,new
  50  0000               _TIM3_DeInit:
  54                     ; 167   TIM3->CR1 = TIM_CR1_RESET_VALUE;
  56  0000 725f5280      	clr	21120
  57                     ; 168   TIM3->CR2 = TIM_CR2_RESET_VALUE;
  59  0004 725f5281      	clr	21121
  60                     ; 169   TIM3->SMCR = TIM_SMCR_RESET_VALUE;
  62  0008 725f5282      	clr	21122
  63                     ; 170   TIM3->ETR = TIM_ETR_RESET_VALUE;
  65  000c 725f5283      	clr	21123
  66                     ; 171   TIM3->IER = TIM_IER_RESET_VALUE;
  68  0010 725f5285      	clr	21125
  69                     ; 172   TIM3->SR2 = TIM_SR2_RESET_VALUE;
  71  0014 725f5287      	clr	21127
  72                     ; 175   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  74  0018 725f528b      	clr	21131
  75                     ; 177   TIM3->CCMR1 = 0x01;/*TIM3_ICxSource_TIxFPx */
  77  001c 35015289      	mov	21129,#1
  78                     ; 178   TIM3->CCMR2 = 0x01;/*TIM3_ICxSource_TIxFPx */
  80  0020 3501528a      	mov	21130,#1
  81                     ; 181   TIM3->CCER1 = TIM_CCER1_RESET_VALUE;
  83  0024 725f528b      	clr	21131
  84                     ; 182   TIM3->CCMR1 = TIM_CCMR1_RESET_VALUE;
  86  0028 725f5289      	clr	21129
  87                     ; 183   TIM3->CCMR2 = TIM_CCMR2_RESET_VALUE;
  89  002c 725f528a      	clr	21130
  90                     ; 185   TIM3->CNTRH = TIM_CNTRH_RESET_VALUE;
  92  0030 725f528c      	clr	21132
  93                     ; 186   TIM3->CNTRL = TIM_CNTRL_RESET_VALUE;
  95  0034 725f528d      	clr	21133
  96                     ; 188   TIM3->PSCR = TIM_PSCR_RESET_VALUE;
  98  0038 725f528e      	clr	21134
  99                     ; 190   TIM3->ARRH = TIM_ARRH_RESET_VALUE;
 101  003c 35ff528f      	mov	21135,#255
 102                     ; 191   TIM3->ARRL = TIM_ARRL_RESET_VALUE;
 104  0040 35ff5290      	mov	21136,#255
 105                     ; 193   TIM3->CCR1H = TIM_CCR1H_RESET_VALUE;
 107  0044 725f5291      	clr	21137
 108                     ; 194   TIM3->CCR1L = TIM_CCR1L_RESET_VALUE;
 110  0048 725f5292      	clr	21138
 111                     ; 195   TIM3->CCR2H = TIM_CCR2H_RESET_VALUE;
 113  004c 725f5293      	clr	21139
 114                     ; 196   TIM3->CCR2L = TIM_CCR2L_RESET_VALUE;
 116  0050 725f5294      	clr	21140
 117                     ; 199   TIM3->OISR = TIM_OISR_RESET_VALUE;
 119  0054 725f5296      	clr	21142
 120                     ; 200   TIM3->EGR = 0x01;/* TIM_EGR_UG */
 122  0058 35015288      	mov	21128,#1
 123                     ; 201   TIM3->BKR = TIM_BKR_RESET_VALUE;
 125  005c 725f5295      	clr	21141
 126                     ; 202   TIM3->SR1 = TIM_SR1_RESET_VALUE;
 128  0060 725f5286      	clr	21126
 129                     ; 203 }
 132  0064 81            	ret
 292                     ; 228 void TIM3_TimeBaseInit(TIM3_Prescaler_TypeDef TIM3_Prescaler,
 292                     ; 229                        TIM3_CounterMode_TypeDef TIM3_CounterMode,
 292                     ; 230                        uint16_t TIM3_Period)
 292                     ; 231 {
 293                     .text:	section	.text,new
 294  0000               _TIM3_TimeBaseInit:
 296  0000 89            	pushw	x
 297       00000000      OFST:	set	0
 300                     ; 233   assert_param(IS_TIM3_PRESCALER(TIM3_Prescaler));
 302                     ; 234   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
 304                     ; 239   TIM3->ARRH = (uint8_t)(TIM3_Period >> 8) ;
 306  0001 7b05          	ld	a,(OFST+5,sp)
 307  0003 c7528f        	ld	21135,a
 308                     ; 240   TIM3->ARRL = (uint8_t)(TIM3_Period);
 310  0006 7b06          	ld	a,(OFST+6,sp)
 311  0008 c75290        	ld	21136,a
 312                     ; 243   TIM3->PSCR = (uint8_t)(TIM3_Prescaler);
 314  000b 9e            	ld	a,xh
 315  000c c7528e        	ld	21134,a
 316                     ; 246   TIM3->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 318  000f c65280        	ld	a,21120
 319  0012 a48f          	and	a,#143
 320  0014 c75280        	ld	21120,a
 321                     ; 247   TIM3->CR1 |= (uint8_t)(TIM3_CounterMode);
 323  0017 9f            	ld	a,xl
 324  0018 ca5280        	or	a,21120
 325  001b c75280        	ld	21120,a
 326                     ; 250   TIM3->EGR = TIM3_EventSource_Update;
 328  001e 35015288      	mov	21128,#1
 329                     ; 251 }
 332  0022 85            	popw	x
 333  0023 81            	ret
 401                     ; 271 void TIM3_PrescalerConfig(TIM3_Prescaler_TypeDef Prescaler,
 401                     ; 272                           TIM3_PSCReloadMode_TypeDef TIM3_PSCReloadMode)
 401                     ; 273 {
 402                     .text:	section	.text,new
 403  0000               _TIM3_PrescalerConfig:
 407                     ; 275   assert_param(IS_TIM3_PRESCALER(Prescaler));
 409                     ; 276   assert_param(IS_TIM3_PRESCALER_RELOAD(TIM3_PSCReloadMode));
 411                     ; 279   TIM3->PSCR = (uint8_t)(Prescaler);
 413  0000 9e            	ld	a,xh
 414  0001 c7528e        	ld	21134,a
 415                     ; 282   if (TIM3_PSCReloadMode == TIM3_PSCReloadMode_Immediate)
 417  0004 9f            	ld	a,xl
 418  0005 a101          	cp	a,#1
 419  0007 2606          	jrne	L541
 420                     ; 284     TIM3->EGR |= TIM_EGR_UG ;
 422  0009 72105288      	bset	21128,#0
 424  000d 2004          	jra	L741
 425  000f               L541:
 426                     ; 288     TIM3->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 428  000f 72115288      	bres	21128,#0
 429  0013               L741:
 430                     ; 290 }
 433  0013 81            	ret
 476                     ; 303 void TIM3_CounterModeConfig(TIM3_CounterMode_TypeDef TIM3_CounterMode)
 476                     ; 304 {
 477                     .text:	section	.text,new
 478  0000               _TIM3_CounterModeConfig:
 480  0000 88            	push	a
 481  0001 88            	push	a
 482       00000001      OFST:	set	1
 485                     ; 305   uint8_t tmpcr1 = 0;
 487                     ; 308   assert_param(IS_TIM3_COUNTER_MODE(TIM3_CounterMode));
 489                     ; 310   tmpcr1 = TIM3->CR1;
 491  0002 c65280        	ld	a,21120
 492  0005 6b01          	ld	(OFST+0,sp),a
 493                     ; 313   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 495  0007 7b01          	ld	a,(OFST+0,sp)
 496  0009 a48f          	and	a,#143
 497  000b 6b01          	ld	(OFST+0,sp),a
 498                     ; 316   tmpcr1 |= (uint8_t)TIM3_CounterMode;
 500  000d 7b01          	ld	a,(OFST+0,sp)
 501  000f 1a02          	or	a,(OFST+1,sp)
 502  0011 6b01          	ld	(OFST+0,sp),a
 503                     ; 318   TIM3->CR1 = tmpcr1;
 505  0013 7b01          	ld	a,(OFST+0,sp)
 506  0015 c75280        	ld	21120,a
 507                     ; 319 }
 510  0018 85            	popw	x
 511  0019 81            	ret
 543                     ; 327 void TIM3_SetCounter(uint16_t Counter)
 543                     ; 328 {
 544                     .text:	section	.text,new
 545  0000               _TIM3_SetCounter:
 549                     ; 331   TIM3->CNTRH = (uint8_t)(Counter >> 8);
 551  0000 9e            	ld	a,xh
 552  0001 c7528c        	ld	21132,a
 553                     ; 332   TIM3->CNTRL = (uint8_t)(Counter);
 555  0004 9f            	ld	a,xl
 556  0005 c7528d        	ld	21133,a
 557                     ; 333 }
 560  0008 81            	ret
 592                     ; 341 void TIM3_SetAutoreload(uint16_t Autoreload)
 592                     ; 342 {
 593                     .text:	section	.text,new
 594  0000               _TIM3_SetAutoreload:
 598                     ; 344   TIM3->ARRH = (uint8_t)(Autoreload >> 8);
 600  0000 9e            	ld	a,xh
 601  0001 c7528f        	ld	21135,a
 602                     ; 345   TIM3->ARRL = (uint8_t)(Autoreload);
 604  0004 9f            	ld	a,xl
 605  0005 c75290        	ld	21136,a
 606                     ; 346 }
 609  0008 81            	ret
 655                     ; 353 uint16_t TIM3_GetCounter(void)
 655                     ; 354 {
 656                     .text:	section	.text,new
 657  0000               _TIM3_GetCounter:
 659  0000 5204          	subw	sp,#4
 660       00000004      OFST:	set	4
 663                     ; 355   uint16_t tmpcnt = 0;
 665                     ; 358   tmpcntrh = TIM3->CNTRH;
 667  0002 c6528c        	ld	a,21132
 668  0005 6b02          	ld	(OFST-2,sp),a
 669                     ; 359   tmpcntrl = TIM3->CNTRL;
 671  0007 c6528d        	ld	a,21133
 672  000a 6b01          	ld	(OFST-3,sp),a
 673                     ; 361   tmpcnt = (uint16_t)(tmpcntrl);
 675  000c 7b01          	ld	a,(OFST-3,sp)
 676  000e 5f            	clrw	x
 677  000f 97            	ld	xl,a
 678  0010 1f03          	ldw	(OFST-1,sp),x
 679                     ; 362   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 681  0012 7b02          	ld	a,(OFST-2,sp)
 682  0014 5f            	clrw	x
 683  0015 97            	ld	xl,a
 684  0016 4f            	clr	a
 685  0017 02            	rlwa	x,a
 686  0018 01            	rrwa	x,a
 687  0019 1a04          	or	a,(OFST+0,sp)
 688  001b 01            	rrwa	x,a
 689  001c 1a03          	or	a,(OFST-1,sp)
 690  001e 01            	rrwa	x,a
 691  001f 1f03          	ldw	(OFST-1,sp),x
 692                     ; 364   return ((uint16_t)tmpcnt);
 694  0021 1e03          	ldw	x,(OFST-1,sp)
 697  0023 5b04          	addw	sp,#4
 698  0025 81            	ret
 722                     ; 380 TIM3_Prescaler_TypeDef TIM3_GetPrescaler(void)
 722                     ; 381 {
 723                     .text:	section	.text,new
 724  0000               _TIM3_GetPrescaler:
 728                     ; 383   return ((TIM3_Prescaler_TypeDef)TIM3->PSCR);
 730  0000 c6528e        	ld	a,21134
 733  0003 81            	ret
 789                     ; 393 void TIM3_UpdateDisableConfig(FunctionalState NewState)
 789                     ; 394 {
 790                     .text:	section	.text,new
 791  0000               _TIM3_UpdateDisableConfig:
 795                     ; 396   assert_param(IS_FUNCTIONAL_STATE(NewState));
 797                     ; 399   if (NewState != DISABLE)
 799  0000 4d            	tnz	a
 800  0001 2706          	jreq	L772
 801                     ; 401     TIM3->CR1 |= TIM_CR1_UDIS;
 803  0003 72125280      	bset	21120,#1
 805  0007 2004          	jra	L103
 806  0009               L772:
 807                     ; 405     TIM3->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 809  0009 72135280      	bres	21120,#1
 810  000d               L103:
 811                     ; 407 }
 814  000d 81            	ret
 872                     ; 417 void TIM3_UpdateRequestConfig(TIM3_UpdateSource_TypeDef TIM3_UpdateSource)
 872                     ; 418 {
 873                     .text:	section	.text,new
 874  0000               _TIM3_UpdateRequestConfig:
 878                     ; 420   assert_param(IS_TIM3_UPDATE_SOURCE(TIM3_UpdateSource));
 880                     ; 423   if (TIM3_UpdateSource == TIM3_UpdateSource_Regular)
 882  0000 a101          	cp	a,#1
 883  0002 2606          	jrne	L133
 884                     ; 425     TIM3->CR1 |= TIM_CR1_URS ;
 886  0004 72145280      	bset	21120,#2
 888  0008 2004          	jra	L333
 889  000a               L133:
 890                     ; 429     TIM3->CR1 &= (uint8_t)(~TIM_CR1_URS);
 892  000a 72155280      	bres	21120,#2
 893  000e               L333:
 894                     ; 431 }
 897  000e 81            	ret
 933                     ; 439 void TIM3_ARRPreloadConfig(FunctionalState NewState)
 933                     ; 440 {
 934                     .text:	section	.text,new
 935  0000               _TIM3_ARRPreloadConfig:
 939                     ; 442   assert_param(IS_FUNCTIONAL_STATE(NewState));
 941                     ; 445   if (NewState != DISABLE)
 943  0000 4d            	tnz	a
 944  0001 2706          	jreq	L353
 945                     ; 447     TIM3->CR1 |= TIM_CR1_ARPE;
 947  0003 721e5280      	bset	21120,#7
 949  0007 2004          	jra	L553
 950  0009               L353:
 951                     ; 451     TIM3->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 953  0009 721f5280      	bres	21120,#7
 954  000d               L553:
 955                     ; 453 }
 958  000d 81            	ret
1015                     ; 463 void TIM3_SelectOnePulseMode(TIM3_OPMode_TypeDef TIM3_OPMode)
1015                     ; 464 {
1016                     .text:	section	.text,new
1017  0000               _TIM3_SelectOnePulseMode:
1021                     ; 466   assert_param(IS_TIM3_OPM_MODE(TIM3_OPMode));
1023                     ; 469   if (TIM3_OPMode == TIM3_OPMode_Single)
1025  0000 a101          	cp	a,#1
1026  0002 2606          	jrne	L504
1027                     ; 471     TIM3->CR1 |= TIM_CR1_OPM ;
1029  0004 72165280      	bset	21120,#3
1031  0008 2004          	jra	L704
1032  000a               L504:
1033                     ; 475     TIM3->CR1 &= (uint8_t)(~TIM_CR1_OPM);
1035  000a 72175280      	bres	21120,#3
1036  000e               L704:
1037                     ; 477 }
1040  000e 81            	ret
1075                     ; 485 void TIM3_Cmd(FunctionalState NewState)
1075                     ; 486 {
1076                     .text:	section	.text,new
1077  0000               _TIM3_Cmd:
1081                     ; 488   assert_param(IS_FUNCTIONAL_STATE(NewState));
1083                     ; 491   if (NewState != DISABLE)
1085  0000 4d            	tnz	a
1086  0001 2706          	jreq	L724
1087                     ; 493     TIM3->CR1 |= TIM_CR1_CEN;
1089  0003 72105280      	bset	21120,#0
1091  0007 2004          	jra	L134
1092  0009               L724:
1093                     ; 497     TIM3->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1095  0009 72115280      	bres	21120,#0
1096  000d               L134:
1097                     ; 499 }
1100  000d 81            	ret
1294                     ; 575 void TIM3_OC1Init(TIM3_OCMode_TypeDef TIM3_OCMode,
1294                     ; 576                   TIM3_OutputState_TypeDef TIM3_OutputState,
1294                     ; 577                   uint16_t TIM3_Pulse,
1294                     ; 578                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
1294                     ; 579                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
1294                     ; 580 {
1295                     .text:	section	.text,new
1296  0000               _TIM3_OC1Init:
1298  0000 89            	pushw	x
1299  0001 88            	push	a
1300       00000001      OFST:	set	1
1303                     ; 581   uint8_t tmpccmr1 = 0;
1305                     ; 584   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
1307                     ; 585   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
1309                     ; 586   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
1311                     ; 587   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
1313                     ; 589   tmpccmr1 = TIM3->CCMR1;
1315  0002 c65289        	ld	a,21129
1316  0005 6b01          	ld	(OFST+0,sp),a
1317                     ; 592   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1319  0007 7211528b      	bres	21131,#0
1320                     ; 594   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
1322  000b 7b01          	ld	a,(OFST+0,sp)
1323  000d a48f          	and	a,#143
1324  000f 6b01          	ld	(OFST+0,sp),a
1325                     ; 597   tmpccmr1 |= (uint8_t)TIM3_OCMode;
1327  0011 9e            	ld	a,xh
1328  0012 1a01          	or	a,(OFST+0,sp)
1329  0014 6b01          	ld	(OFST+0,sp),a
1330                     ; 599   TIM3->CCMR1 = tmpccmr1;
1332  0016 7b01          	ld	a,(OFST+0,sp)
1333  0018 c75289        	ld	21129,a
1334                     ; 602   if (TIM3_OutputState == TIM3_OutputState_Enable)
1336  001b 9f            	ld	a,xl
1337  001c a101          	cp	a,#1
1338  001e 2606          	jrne	L145
1339                     ; 604     TIM3->CCER1 |= TIM_CCER1_CC1E;
1341  0020 7210528b      	bset	21131,#0
1343  0024 2004          	jra	L345
1344  0026               L145:
1345                     ; 608     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1347  0026 7211528b      	bres	21131,#0
1348  002a               L345:
1349                     ; 612   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
1351  002a 7b08          	ld	a,(OFST+7,sp)
1352  002c a101          	cp	a,#1
1353  002e 2606          	jrne	L545
1354                     ; 614     TIM3->CCER1 |= TIM_CCER1_CC1P;
1356  0030 7212528b      	bset	21131,#1
1358  0034 2004          	jra	L745
1359  0036               L545:
1360                     ; 618     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1362  0036 7213528b      	bres	21131,#1
1363  003a               L745:
1364                     ; 622   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
1366  003a 7b09          	ld	a,(OFST+8,sp)
1367  003c a101          	cp	a,#1
1368  003e 2606          	jrne	L155
1369                     ; 624     TIM3->OISR |= TIM_OISR_OIS1;
1371  0040 72105296      	bset	21142,#0
1373  0044 2004          	jra	L355
1374  0046               L155:
1375                     ; 628     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS1);
1377  0046 72115296      	bres	21142,#0
1378  004a               L355:
1379                     ; 632   TIM3->CCR1H = (uint8_t)(TIM3_Pulse >> 8);
1381  004a 7b06          	ld	a,(OFST+5,sp)
1382  004c c75291        	ld	21137,a
1383                     ; 633   TIM3->CCR1L = (uint8_t)(TIM3_Pulse);
1385  004f 7b07          	ld	a,(OFST+6,sp)
1386  0051 c75292        	ld	21138,a
1387                     ; 634 }
1390  0054 5b03          	addw	sp,#3
1391  0056 81            	ret
1470                     ; 661 void TIM3_OC2Init(TIM3_OCMode_TypeDef TIM3_OCMode,
1470                     ; 662                   TIM3_OutputState_TypeDef TIM3_OutputState,
1470                     ; 663                   uint16_t TIM3_Pulse,
1470                     ; 664                   TIM3_OCPolarity_TypeDef TIM3_OCPolarity,
1470                     ; 665                   TIM3_OCIdleState_TypeDef TIM3_OCIdleState)
1470                     ; 666 {
1471                     .text:	section	.text,new
1472  0000               _TIM3_OC2Init:
1474  0000 89            	pushw	x
1475  0001 88            	push	a
1476       00000001      OFST:	set	1
1479                     ; 667   uint8_t tmpccmr2 = 0;
1481                     ; 670   assert_param(IS_TIM3_OC_MODE(TIM3_OCMode));
1483                     ; 671   assert_param(IS_TIM3_OUTPUT_STATE(TIM3_OutputState));
1485                     ; 672   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
1487                     ; 673   assert_param(IS_TIM3_OCIDLE_STATE(TIM3_OCIdleState));
1489                     ; 675   tmpccmr2 = TIM3->CCMR2;
1491  0002 c6528a        	ld	a,21130
1492  0005 6b01          	ld	(OFST+0,sp),a
1493                     ; 678   TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1495  0007 7219528b      	bres	21131,#4
1496                     ; 681   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
1498  000b 7b01          	ld	a,(OFST+0,sp)
1499  000d a48f          	and	a,#143
1500  000f 6b01          	ld	(OFST+0,sp),a
1501                     ; 684   tmpccmr2 |= (uint8_t)TIM3_OCMode;
1503  0011 9e            	ld	a,xh
1504  0012 1a01          	or	a,(OFST+0,sp)
1505  0014 6b01          	ld	(OFST+0,sp),a
1506                     ; 686   TIM3->CCMR2 = tmpccmr2;
1508  0016 7b01          	ld	a,(OFST+0,sp)
1509  0018 c7528a        	ld	21130,a
1510                     ; 689   if (TIM3_OutputState == TIM3_OutputState_Enable)
1512  001b 9f            	ld	a,xl
1513  001c a101          	cp	a,#1
1514  001e 2606          	jrne	L316
1515                     ; 691     TIM3->CCER1 |= TIM_CCER1_CC2E;
1517  0020 7218528b      	bset	21131,#4
1519  0024 2004          	jra	L516
1520  0026               L316:
1521                     ; 695     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1523  0026 7219528b      	bres	21131,#4
1524  002a               L516:
1525                     ; 699   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
1527  002a 7b08          	ld	a,(OFST+7,sp)
1528  002c a101          	cp	a,#1
1529  002e 2606          	jrne	L716
1530                     ; 701     TIM3->CCER1 |= TIM_CCER1_CC2P;
1532  0030 721a528b      	bset	21131,#5
1534  0034 2004          	jra	L126
1535  0036               L716:
1536                     ; 705     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
1538  0036 721b528b      	bres	21131,#5
1539  003a               L126:
1540                     ; 710   if (TIM3_OCIdleState == TIM3_OCIdleState_Set)
1542  003a 7b09          	ld	a,(OFST+8,sp)
1543  003c a101          	cp	a,#1
1544  003e 2606          	jrne	L326
1545                     ; 712     TIM3->OISR |= TIM_OISR_OIS2;
1547  0040 72145296      	bset	21142,#2
1549  0044 2004          	jra	L526
1550  0046               L326:
1551                     ; 716     TIM3->OISR &= (uint8_t)(~TIM_OISR_OIS2);
1553  0046 72155296      	bres	21142,#2
1554  004a               L526:
1555                     ; 720   TIM3->CCR2H = (uint8_t)(TIM3_Pulse >> 8);
1557  004a 7b06          	ld	a,(OFST+5,sp)
1558  004c c75293        	ld	21139,a
1559                     ; 721   TIM3->CCR2L = (uint8_t)(TIM3_Pulse);
1561  004f 7b07          	ld	a,(OFST+6,sp)
1562  0051 c75294        	ld	21140,a
1563                     ; 722 }
1566  0054 5b03          	addw	sp,#3
1567  0056 81            	ret
1765                     ; 751 void TIM3_BKRConfig(TIM3_OSSIState_TypeDef TIM3_OSSIState,
1765                     ; 752                     TIM3_LockLevel_TypeDef TIM3_LockLevel,
1765                     ; 753                     TIM3_BreakState_TypeDef TIM3_BreakState,
1765                     ; 754                     TIM3_BreakPolarity_TypeDef TIM3_BreakPolarity,
1765                     ; 755                     TIM3_AutomaticOutput_TypeDef TIM3_AutomaticOutput)
1765                     ; 756 
1765                     ; 757 {
1766                     .text:	section	.text,new
1767  0000               _TIM3_BKRConfig:
1769  0000 89            	pushw	x
1770  0001 88            	push	a
1771       00000001      OFST:	set	1
1774                     ; 759   assert_param(IS_TIM3_OSSI_STATE(TIM3_OSSIState));
1776                     ; 760   assert_param(IS_TIM3_LOCK_LEVEL(TIM3_LockLevel));
1778                     ; 761   assert_param(IS_TIM3_BREAK_STATE(TIM3_BreakState));
1780                     ; 762   assert_param(IS_TIM3_BREAK_POLARITY(TIM3_BreakPolarity));
1782                     ; 763   assert_param(IS_TIM3_AUTOMATIC_OUTPUT_STATE(TIM3_AutomaticOutput));
1784                     ; 769   TIM3->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM3_OSSIState | (uint8_t)TIM3_LockLevel) | \
1784                     ; 770                                   (uint8_t)((uint8_t)TIM3_BreakState | (uint8_t)TIM3_BreakPolarity)) | \
1784                     ; 771                                   TIM3_AutomaticOutput));
1786  0002 7b06          	ld	a,(OFST+5,sp)
1787  0004 1a07          	or	a,(OFST+6,sp)
1788  0006 6b01          	ld	(OFST+0,sp),a
1789  0008 9f            	ld	a,xl
1790  0009 1a02          	or	a,(OFST+1,sp)
1791  000b 1a01          	or	a,(OFST+0,sp)
1792  000d 1a08          	or	a,(OFST+7,sp)
1793  000f c75295        	ld	21141,a
1794                     ; 772 }
1797  0012 5b03          	addw	sp,#3
1798  0014 81            	ret
1834                     ; 780 void TIM3_CtrlPWMOutputs(FunctionalState NewState)
1834                     ; 781 {
1835                     .text:	section	.text,new
1836  0000               _TIM3_CtrlPWMOutputs:
1840                     ; 783   assert_param(IS_FUNCTIONAL_STATE(NewState));
1842                     ; 787   if (NewState != DISABLE)
1844  0000 4d            	tnz	a
1845  0001 2706          	jreq	L757
1846                     ; 789     TIM3->BKR |= TIM_BKR_MOE ;
1848  0003 721e5295      	bset	21141,#7
1850  0007 2004          	jra	L167
1851  0009               L757:
1852                     ; 793     TIM3->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1854  0009 721f5295      	bres	21141,#7
1855  000d               L167:
1856                     ; 795 }
1859  000d 81            	ret
1924                     ; 815 void TIM3_SelectOCxM(TIM3_Channel_TypeDef TIM3_Channel,
1924                     ; 816                      TIM3_OCMode_TypeDef TIM3_OCMode)
1924                     ; 817 {
1925                     .text:	section	.text,new
1926  0000               _TIM3_SelectOCxM:
1928  0000 89            	pushw	x
1929       00000000      OFST:	set	0
1932                     ; 819   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
1934                     ; 820   assert_param(IS_TIM3_OCM(TIM3_OCMode));
1936                     ; 822   if (TIM3_Channel == TIM3_Channel_1)
1938  0001 9e            	ld	a,xh
1939  0002 4d            	tnz	a
1940  0003 2615          	jrne	L5101
1941                     ; 825     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1943  0005 7211528b      	bres	21131,#0
1944                     ; 828     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
1946  0009 c65289        	ld	a,21129
1947  000c a48f          	and	a,#143
1948  000e c75289        	ld	21129,a
1949                     ; 831     TIM3->CCMR1 |= (uint8_t)TIM3_OCMode;
1951  0011 9f            	ld	a,xl
1952  0012 ca5289        	or	a,21129
1953  0015 c75289        	ld	21129,a
1955  0018 2014          	jra	L7101
1956  001a               L5101:
1957                     ; 836     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1959  001a 7219528b      	bres	21131,#4
1960                     ; 839     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
1962  001e c6528a        	ld	a,21130
1963  0021 a48f          	and	a,#143
1964  0023 c7528a        	ld	21130,a
1965                     ; 842     TIM3->CCMR2 |= (uint8_t)TIM3_OCMode;
1967  0026 c6528a        	ld	a,21130
1968  0029 1a02          	or	a,(OFST+2,sp)
1969  002b c7528a        	ld	21130,a
1970  002e               L7101:
1971                     ; 844 }
1974  002e 85            	popw	x
1975  002f 81            	ret
2007                     ; 852 void TIM3_SetCompare1(uint16_t Compare)
2007                     ; 853 {
2008                     .text:	section	.text,new
2009  0000               _TIM3_SetCompare1:
2013                     ; 855   TIM3->CCR1H = (uint8_t)(Compare >> 8);
2015  0000 9e            	ld	a,xh
2016  0001 c75291        	ld	21137,a
2017                     ; 856   TIM3->CCR1L = (uint8_t)(Compare);
2019  0004 9f            	ld	a,xl
2020  0005 c75292        	ld	21138,a
2021                     ; 857 }
2024  0008 81            	ret
2056                     ; 865 void TIM3_SetCompare2(uint16_t Compare)
2056                     ; 866 {
2057                     .text:	section	.text,new
2058  0000               _TIM3_SetCompare2:
2062                     ; 868   TIM3->CCR2H = (uint8_t)(Compare >> 8);
2064  0000 9e            	ld	a,xh
2065  0001 c75293        	ld	21139,a
2066                     ; 869   TIM3->CCR2L = (uint8_t)(Compare);
2068  0004 9f            	ld	a,xl
2069  0005 c75294        	ld	21140,a
2070                     ; 870 }
2073  0008 81            	ret
2138                     ; 880 void TIM3_ForcedOC1Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2138                     ; 881 {
2139                     .text:	section	.text,new
2140  0000               _TIM3_ForcedOC1Config:
2142  0000 88            	push	a
2143  0001 88            	push	a
2144       00000001      OFST:	set	1
2147                     ; 882   uint8_t tmpccmr1 = 0;
2149                     ; 885   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
2151                     ; 887   tmpccmr1 = TIM3->CCMR1;
2153  0002 c65289        	ld	a,21129
2154  0005 6b01          	ld	(OFST+0,sp),a
2155                     ; 890   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
2157  0007 7b01          	ld	a,(OFST+0,sp)
2158  0009 a48f          	and	a,#143
2159  000b 6b01          	ld	(OFST+0,sp),a
2160                     ; 893   tmpccmr1 |= (uint8_t)TIM3_ForcedAction;
2162  000d 7b01          	ld	a,(OFST+0,sp)
2163  000f 1a02          	or	a,(OFST+1,sp)
2164  0011 6b01          	ld	(OFST+0,sp),a
2165                     ; 895   TIM3->CCMR1 = tmpccmr1;
2167  0013 7b01          	ld	a,(OFST+0,sp)
2168  0015 c75289        	ld	21129,a
2169                     ; 896 }
2172  0018 85            	popw	x
2173  0019 81            	ret
2216                     ; 906 void TIM3_ForcedOC2Config(TIM3_ForcedAction_TypeDef TIM3_ForcedAction)
2216                     ; 907 {
2217                     .text:	section	.text,new
2218  0000               _TIM3_ForcedOC2Config:
2220  0000 88            	push	a
2221  0001 88            	push	a
2222       00000001      OFST:	set	1
2225                     ; 908   uint8_t tmpccmr2 = 0;
2227                     ; 911   assert_param(IS_TIM3_FORCED_ACTION(TIM3_ForcedAction));
2229                     ; 913   tmpccmr2 = TIM3->CCMR2;
2231  0002 c6528a        	ld	a,21130
2232  0005 6b01          	ld	(OFST+0,sp),a
2233                     ; 916   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
2235  0007 7b01          	ld	a,(OFST+0,sp)
2236  0009 a48f          	and	a,#143
2237  000b 6b01          	ld	(OFST+0,sp),a
2238                     ; 919   tmpccmr2 |= (uint8_t)TIM3_ForcedAction;
2240  000d 7b01          	ld	a,(OFST+0,sp)
2241  000f 1a02          	or	a,(OFST+1,sp)
2242  0011 6b01          	ld	(OFST+0,sp),a
2243                     ; 921   TIM3->CCMR2 = tmpccmr2;
2245  0013 7b01          	ld	a,(OFST+0,sp)
2246  0015 c7528a        	ld	21130,a
2247                     ; 922 }
2250  0018 85            	popw	x
2251  0019 81            	ret
2287                     ; 930 void TIM3_OC1PreloadConfig(FunctionalState NewState)
2287                     ; 931 {
2288                     .text:	section	.text,new
2289  0000               _TIM3_OC1PreloadConfig:
2293                     ; 933   assert_param(IS_FUNCTIONAL_STATE(NewState));
2295                     ; 936   if (NewState != DISABLE)
2297  0000 4d            	tnz	a
2298  0001 2706          	jreq	L7311
2299                     ; 938     TIM3->CCMR1 |= TIM_CCMR_OCxPE ;
2301  0003 72165289      	bset	21129,#3
2303  0007 2004          	jra	L1411
2304  0009               L7311:
2305                     ; 942     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2307  0009 72175289      	bres	21129,#3
2308  000d               L1411:
2309                     ; 944 }
2312  000d 81            	ret
2348                     ; 952 void TIM3_OC2PreloadConfig(FunctionalState NewState)
2348                     ; 953 {
2349                     .text:	section	.text,new
2350  0000               _TIM3_OC2PreloadConfig:
2354                     ; 955   assert_param(IS_FUNCTIONAL_STATE(NewState));
2356                     ; 958   if (NewState != DISABLE)
2358  0000 4d            	tnz	a
2359  0001 2706          	jreq	L1611
2360                     ; 960     TIM3->CCMR2 |= TIM_CCMR_OCxPE ;
2362  0003 7216528a      	bset	21130,#3
2364  0007 2004          	jra	L3611
2365  0009               L1611:
2366                     ; 964     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2368  0009 7217528a      	bres	21130,#3
2369  000d               L3611:
2370                     ; 966 }
2373  000d 81            	ret
2408                     ; 974 void TIM3_OC1FastConfig(FunctionalState NewState)
2408                     ; 975 {
2409                     .text:	section	.text,new
2410  0000               _TIM3_OC1FastConfig:
2414                     ; 977   assert_param(IS_FUNCTIONAL_STATE(NewState));
2416                     ; 980   if (NewState != DISABLE)
2418  0000 4d            	tnz	a
2419  0001 2706          	jreq	L3021
2420                     ; 982     TIM3->CCMR1 |= TIM_CCMR_OCxFE ;
2422  0003 72145289      	bset	21129,#2
2424  0007 2004          	jra	L5021
2425  0009               L3021:
2426                     ; 986     TIM3->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2428  0009 72155289      	bres	21129,#2
2429  000d               L5021:
2430                     ; 988 }
2433  000d 81            	ret
2468                     ; 997 void TIM3_OC2FastConfig(FunctionalState NewState)
2468                     ; 998 {
2469                     .text:	section	.text,new
2470  0000               _TIM3_OC2FastConfig:
2474                     ; 1000   assert_param(IS_FUNCTIONAL_STATE(NewState));
2476                     ; 1003   if (NewState != DISABLE)
2478  0000 4d            	tnz	a
2479  0001 2706          	jreq	L5221
2480                     ; 1005     TIM3->CCMR2 |= TIM_CCMR_OCxFE ;
2482  0003 7214528a      	bset	21130,#2
2484  0007 2004          	jra	L7221
2485  0009               L5221:
2486                     ; 1009     TIM3->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2488  0009 7215528a      	bres	21130,#2
2489  000d               L7221:
2490                     ; 1011 }
2493  000d 81            	ret
2529                     ; 1021 void TIM3_OC1PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2529                     ; 1022 {
2530                     .text:	section	.text,new
2531  0000               _TIM3_OC1PolarityConfig:
2535                     ; 1024   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
2537                     ; 1027   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
2539  0000 a101          	cp	a,#1
2540  0002 2606          	jrne	L7421
2541                     ; 1029     TIM3->CCER1 |= TIM_CCER1_CC1P ;
2543  0004 7212528b      	bset	21131,#1
2545  0008 2004          	jra	L1521
2546  000a               L7421:
2547                     ; 1033     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
2549  000a 7213528b      	bres	21131,#1
2550  000e               L1521:
2551                     ; 1035 }
2554  000e 81            	ret
2590                     ; 1045 void TIM3_OC2PolarityConfig(TIM3_OCPolarity_TypeDef TIM3_OCPolarity)
2590                     ; 1046 {
2591                     .text:	section	.text,new
2592  0000               _TIM3_OC2PolarityConfig:
2596                     ; 1048   assert_param(IS_TIM3_OC_POLARITY(TIM3_OCPolarity));
2598                     ; 1051   if (TIM3_OCPolarity == TIM3_OCPolarity_Low)
2600  0000 a101          	cp	a,#1
2601  0002 2606          	jrne	L1721
2602                     ; 1053     TIM3->CCER1 |= TIM_CCER1_CC2P ;
2604  0004 721a528b      	bset	21131,#5
2606  0008 2004          	jra	L3721
2607  000a               L1721:
2608                     ; 1057     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
2610  000a 721b528b      	bres	21131,#5
2611  000e               L3721:
2612                     ; 1059 }
2615  000e 81            	ret
2660                     ; 1071 void TIM3_CCxCmd(TIM3_Channel_TypeDef TIM3_Channel,
2660                     ; 1072                  FunctionalState NewState)
2660                     ; 1073 {
2661                     .text:	section	.text,new
2662  0000               _TIM3_CCxCmd:
2664  0000 89            	pushw	x
2665       00000000      OFST:	set	0
2668                     ; 1075   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
2670                     ; 1076   assert_param(IS_FUNCTIONAL_STATE(NewState));
2672                     ; 1078   if (TIM3_Channel == TIM3_Channel_1)
2674  0001 9e            	ld	a,xh
2675  0002 4d            	tnz	a
2676  0003 2610          	jrne	L7131
2677                     ; 1081     if (NewState != DISABLE)
2679  0005 9f            	ld	a,xl
2680  0006 4d            	tnz	a
2681  0007 2706          	jreq	L1231
2682                     ; 1083       TIM3->CCER1 |= TIM_CCER1_CC1E ;
2684  0009 7210528b      	bset	21131,#0
2686  000d 2014          	jra	L5231
2687  000f               L1231:
2688                     ; 1087       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
2690  000f 7211528b      	bres	21131,#0
2691  0013 200e          	jra	L5231
2692  0015               L7131:
2693                     ; 1094     if (NewState != DISABLE)
2695  0015 0d02          	tnz	(OFST+2,sp)
2696  0017 2706          	jreq	L7231
2697                     ; 1096       TIM3->CCER1 |= TIM_CCER1_CC2E;
2699  0019 7218528b      	bset	21131,#4
2701  001d 2004          	jra	L5231
2702  001f               L7231:
2703                     ; 1100       TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
2705  001f 7219528b      	bres	21131,#4
2706  0023               L5231:
2707                     ; 1103 }
2710  0023 85            	popw	x
2711  0024 81            	ret
2873                     ; 1181 void TIM3_ICInit(TIM3_Channel_TypeDef TIM3_Channel,
2873                     ; 1182                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
2873                     ; 1183                  TIM3_ICSelection_TypeDef TIM3_ICSelection,
2873                     ; 1184                  TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
2873                     ; 1185                  uint8_t TIM3_ICFilter)
2873                     ; 1186 {
2874                     .text:	section	.text,new
2875  0000               _TIM3_ICInit:
2877  0000 89            	pushw	x
2878       00000000      OFST:	set	0
2881                     ; 1188   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
2883                     ; 1190   if (TIM3_Channel == TIM3_Channel_1)
2885  0001 9e            	ld	a,xh
2886  0002 4d            	tnz	a
2887  0003 2614          	jrne	L5241
2888                     ; 1193     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection, TIM3_ICFilter);
2890  0005 7b07          	ld	a,(OFST+7,sp)
2891  0007 88            	push	a
2892  0008 7b06          	ld	a,(OFST+6,sp)
2893  000a 97            	ld	xl,a
2894  000b 7b03          	ld	a,(OFST+3,sp)
2895  000d 95            	ld	xh,a
2896  000e cd0000        	call	L3_TI1_Config
2898  0011 84            	pop	a
2899                     ; 1196     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
2901  0012 7b06          	ld	a,(OFST+6,sp)
2902  0014 cd0000        	call	_TIM3_SetIC1Prescaler
2905  0017 2012          	jra	L7241
2906  0019               L5241:
2907                     ; 1201     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection, TIM3_ICFilter);
2909  0019 7b07          	ld	a,(OFST+7,sp)
2910  001b 88            	push	a
2911  001c 7b06          	ld	a,(OFST+6,sp)
2912  001e 97            	ld	xl,a
2913  001f 7b03          	ld	a,(OFST+3,sp)
2914  0021 95            	ld	xh,a
2915  0022 cd0000        	call	L5_TI2_Config
2917  0025 84            	pop	a
2918                     ; 1204     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
2920  0026 7b06          	ld	a,(OFST+6,sp)
2921  0028 cd0000        	call	_TIM3_SetIC2Prescaler
2923  002b               L7241:
2924                     ; 1206 }
2927  002b 85            	popw	x
2928  002c 81            	ret
3018                     ; 1232 void TIM3_PWMIConfig(TIM3_Channel_TypeDef TIM3_Channel,
3018                     ; 1233                      TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
3018                     ; 1234                      TIM3_ICSelection_TypeDef TIM3_ICSelection,
3018                     ; 1235                      TIM3_ICPSC_TypeDef TIM3_ICPrescaler,
3018                     ; 1236                      uint8_t TIM3_ICFilter)
3018                     ; 1237 {
3019                     .text:	section	.text,new
3020  0000               _TIM3_PWMIConfig:
3022  0000 89            	pushw	x
3023  0001 89            	pushw	x
3024       00000002      OFST:	set	2
3027                     ; 1238   uint8_t icpolarity = TIM3_ICPolarity_Rising;
3029                     ; 1239   uint8_t icselection = TIM3_ICSelection_DirectTI;
3031                     ; 1242   assert_param(IS_TIM3_CHANNEL(TIM3_Channel));
3033                     ; 1245   if (TIM3_ICPolarity == TIM3_ICPolarity_Rising)
3035  0002 9f            	ld	a,xl
3036  0003 4d            	tnz	a
3037  0004 2606          	jrne	L1741
3038                     ; 1247     icpolarity = TIM3_ICPolarity_Falling;
3040  0006 a601          	ld	a,#1
3041  0008 6b01          	ld	(OFST-1,sp),a
3043  000a 2002          	jra	L3741
3044  000c               L1741:
3045                     ; 1251     icpolarity = TIM3_ICPolarity_Rising;
3047  000c 0f01          	clr	(OFST-1,sp)
3048  000e               L3741:
3049                     ; 1255   if (TIM3_ICSelection == TIM3_ICSelection_DirectTI)
3051  000e 7b07          	ld	a,(OFST+5,sp)
3052  0010 a101          	cp	a,#1
3053  0012 2606          	jrne	L5741
3054                     ; 1257     icselection = TIM3_ICSelection_IndirectTI;
3056  0014 a602          	ld	a,#2
3057  0016 6b02          	ld	(OFST+0,sp),a
3059  0018 2004          	jra	L7741
3060  001a               L5741:
3061                     ; 1261     icselection = TIM3_ICSelection_DirectTI;
3063  001a a601          	ld	a,#1
3064  001c 6b02          	ld	(OFST+0,sp),a
3065  001e               L7741:
3066                     ; 1264   if (TIM3_Channel == TIM3_Channel_1)
3068  001e 0d03          	tnz	(OFST+1,sp)
3069  0020 2626          	jrne	L1051
3070                     ; 1267     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection,
3070                     ; 1268                TIM3_ICFilter);
3072  0022 7b09          	ld	a,(OFST+7,sp)
3073  0024 88            	push	a
3074  0025 7b08          	ld	a,(OFST+6,sp)
3075  0027 97            	ld	xl,a
3076  0028 7b05          	ld	a,(OFST+3,sp)
3077  002a 95            	ld	xh,a
3078  002b cd0000        	call	L3_TI1_Config
3080  002e 84            	pop	a
3081                     ; 1271     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
3083  002f 7b08          	ld	a,(OFST+6,sp)
3084  0031 cd0000        	call	_TIM3_SetIC1Prescaler
3086                     ; 1274     TI2_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
3088  0034 7b09          	ld	a,(OFST+7,sp)
3089  0036 88            	push	a
3090  0037 7b03          	ld	a,(OFST+1,sp)
3091  0039 97            	ld	xl,a
3092  003a 7b02          	ld	a,(OFST+0,sp)
3093  003c 95            	ld	xh,a
3094  003d cd0000        	call	L5_TI2_Config
3096  0040 84            	pop	a
3097                     ; 1277     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
3099  0041 7b08          	ld	a,(OFST+6,sp)
3100  0043 cd0000        	call	_TIM3_SetIC2Prescaler
3103  0046 2024          	jra	L3051
3104  0048               L1051:
3105                     ; 1282     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection,
3105                     ; 1283                TIM3_ICFilter);
3107  0048 7b09          	ld	a,(OFST+7,sp)
3108  004a 88            	push	a
3109  004b 7b08          	ld	a,(OFST+6,sp)
3110  004d 97            	ld	xl,a
3111  004e 7b05          	ld	a,(OFST+3,sp)
3112  0050 95            	ld	xh,a
3113  0051 cd0000        	call	L5_TI2_Config
3115  0054 84            	pop	a
3116                     ; 1286     TIM3_SetIC2Prescaler(TIM3_ICPrescaler);
3118  0055 7b08          	ld	a,(OFST+6,sp)
3119  0057 cd0000        	call	_TIM3_SetIC2Prescaler
3121                     ; 1289     TI1_Config((TIM3_ICPolarity_TypeDef)icpolarity, (TIM3_ICSelection_TypeDef)icselection, TIM3_ICFilter);
3123  005a 7b09          	ld	a,(OFST+7,sp)
3124  005c 88            	push	a
3125  005d 7b03          	ld	a,(OFST+1,sp)
3126  005f 97            	ld	xl,a
3127  0060 7b02          	ld	a,(OFST+0,sp)
3128  0062 95            	ld	xh,a
3129  0063 cd0000        	call	L3_TI1_Config
3131  0066 84            	pop	a
3132                     ; 1292     TIM3_SetIC1Prescaler(TIM3_ICPrescaler);
3134  0067 7b08          	ld	a,(OFST+6,sp)
3135  0069 cd0000        	call	_TIM3_SetIC1Prescaler
3137  006c               L3051:
3138                     ; 1294 }
3141  006c 5b04          	addw	sp,#4
3142  006e 81            	ret
3188                     ; 1301 uint16_t TIM3_GetCapture1(void)
3188                     ; 1302 {
3189                     .text:	section	.text,new
3190  0000               _TIM3_GetCapture1:
3192  0000 5204          	subw	sp,#4
3193       00000004      OFST:	set	4
3196                     ; 1303   uint16_t tmpccr1 = 0;
3198                     ; 1306   tmpccr1h = TIM3->CCR1H;
3200  0002 c65291        	ld	a,21137
3201  0005 6b02          	ld	(OFST-2,sp),a
3202                     ; 1307   tmpccr1l = TIM3->CCR1L;
3204  0007 c65292        	ld	a,21138
3205  000a 6b01          	ld	(OFST-3,sp),a
3206                     ; 1309   tmpccr1 = (uint16_t)(tmpccr1l);
3208  000c 7b01          	ld	a,(OFST-3,sp)
3209  000e 5f            	clrw	x
3210  000f 97            	ld	xl,a
3211  0010 1f03          	ldw	(OFST-1,sp),x
3212                     ; 1310   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3214  0012 7b02          	ld	a,(OFST-2,sp)
3215  0014 5f            	clrw	x
3216  0015 97            	ld	xl,a
3217  0016 4f            	clr	a
3218  0017 02            	rlwa	x,a
3219  0018 01            	rrwa	x,a
3220  0019 1a04          	or	a,(OFST+0,sp)
3221  001b 01            	rrwa	x,a
3222  001c 1a03          	or	a,(OFST-1,sp)
3223  001e 01            	rrwa	x,a
3224  001f 1f03          	ldw	(OFST-1,sp),x
3225                     ; 1312   return ((uint16_t)tmpccr1);
3227  0021 1e03          	ldw	x,(OFST-1,sp)
3230  0023 5b04          	addw	sp,#4
3231  0025 81            	ret
3277                     ; 1320 uint16_t TIM3_GetCapture2(void)
3277                     ; 1321 {
3278                     .text:	section	.text,new
3279  0000               _TIM3_GetCapture2:
3281  0000 5204          	subw	sp,#4
3282       00000004      OFST:	set	4
3285                     ; 1322   uint16_t tmpccr2 = 0;
3287                     ; 1325   tmpccr2h = TIM3->CCR2H;
3289  0002 c65293        	ld	a,21139
3290  0005 6b02          	ld	(OFST-2,sp),a
3291                     ; 1326   tmpccr2l = TIM3->CCR2L;
3293  0007 c65294        	ld	a,21140
3294  000a 6b01          	ld	(OFST-3,sp),a
3295                     ; 1328   tmpccr2 = (uint16_t)(tmpccr2l);
3297  000c 7b01          	ld	a,(OFST-3,sp)
3298  000e 5f            	clrw	x
3299  000f 97            	ld	xl,a
3300  0010 1f03          	ldw	(OFST-1,sp),x
3301                     ; 1329   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3303  0012 7b02          	ld	a,(OFST-2,sp)
3304  0014 5f            	clrw	x
3305  0015 97            	ld	xl,a
3306  0016 4f            	clr	a
3307  0017 02            	rlwa	x,a
3308  0018 01            	rrwa	x,a
3309  0019 1a04          	or	a,(OFST+0,sp)
3310  001b 01            	rrwa	x,a
3311  001c 1a03          	or	a,(OFST-1,sp)
3312  001e 01            	rrwa	x,a
3313  001f 1f03          	ldw	(OFST-1,sp),x
3314                     ; 1331   return ((uint16_t)tmpccr2);
3316  0021 1e03          	ldw	x,(OFST-1,sp)
3319  0023 5b04          	addw	sp,#4
3320  0025 81            	ret
3363                     ; 1344 void TIM3_SetIC1Prescaler(TIM3_ICPSC_TypeDef TIM3_IC1Prescaler)
3363                     ; 1345 {
3364                     .text:	section	.text,new
3365  0000               _TIM3_SetIC1Prescaler:
3367  0000 88            	push	a
3368  0001 88            	push	a
3369       00000001      OFST:	set	1
3372                     ; 1346   uint8_t tmpccmr1 = 0;
3374                     ; 1349   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC1Prescaler));
3376                     ; 1351   tmpccmr1 = TIM3->CCMR1;
3378  0002 c65289        	ld	a,21129
3379  0005 6b01          	ld	(OFST+0,sp),a
3380                     ; 1354   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3382  0007 7b01          	ld	a,(OFST+0,sp)
3383  0009 a4f3          	and	a,#243
3384  000b 6b01          	ld	(OFST+0,sp),a
3385                     ; 1357   tmpccmr1 |= (uint8_t)TIM3_IC1Prescaler;
3387  000d 7b01          	ld	a,(OFST+0,sp)
3388  000f 1a02          	or	a,(OFST+1,sp)
3389  0011 6b01          	ld	(OFST+0,sp),a
3390                     ; 1359   TIM3->CCMR1 = tmpccmr1;
3392  0013 7b01          	ld	a,(OFST+0,sp)
3393  0015 c75289        	ld	21129,a
3394                     ; 1360 }
3397  0018 85            	popw	x
3398  0019 81            	ret
3441                     ; 1372 void TIM3_SetIC2Prescaler(TIM3_ICPSC_TypeDef TIM3_IC2Prescaler)
3441                     ; 1373 {
3442                     .text:	section	.text,new
3443  0000               _TIM3_SetIC2Prescaler:
3445  0000 88            	push	a
3446  0001 88            	push	a
3447       00000001      OFST:	set	1
3450                     ; 1374   uint8_t tmpccmr2 = 0;
3452                     ; 1377   assert_param(IS_TIM3_IC_PRESCALER(TIM3_IC2Prescaler));
3454                     ; 1379   tmpccmr2 = TIM3->CCMR2;
3456  0002 c6528a        	ld	a,21130
3457  0005 6b01          	ld	(OFST+0,sp),a
3458                     ; 1382   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3460  0007 7b01          	ld	a,(OFST+0,sp)
3461  0009 a4f3          	and	a,#243
3462  000b 6b01          	ld	(OFST+0,sp),a
3463                     ; 1385   tmpccmr2 |= (uint8_t)TIM3_IC2Prescaler;
3465  000d 7b01          	ld	a,(OFST+0,sp)
3466  000f 1a02          	or	a,(OFST+1,sp)
3467  0011 6b01          	ld	(OFST+0,sp),a
3468                     ; 1387   TIM3->CCMR2 = tmpccmr2;
3470  0013 7b01          	ld	a,(OFST+0,sp)
3471  0015 c7528a        	ld	21130,a
3472                     ; 1388 }
3475  0018 85            	popw	x
3476  0019 81            	ret
3562                     ; 1419 void TIM3_ITConfig(TIM3_IT_TypeDef TIM3_IT, FunctionalState NewState)
3562                     ; 1420 {
3563                     .text:	section	.text,new
3564  0000               _TIM3_ITConfig:
3566  0000 89            	pushw	x
3567       00000000      OFST:	set	0
3570                     ; 1422   assert_param(IS_TIM3_IT(TIM3_IT));
3572                     ; 1423   assert_param(IS_FUNCTIONAL_STATE(NewState));
3574                     ; 1425   if (NewState != DISABLE)
3576  0001 9f            	ld	a,xl
3577  0002 4d            	tnz	a
3578  0003 2709          	jreq	L5461
3579                     ; 1428     TIM3->IER |= (uint8_t)TIM3_IT;
3581  0005 9e            	ld	a,xh
3582  0006 ca5285        	or	a,21125
3583  0009 c75285        	ld	21125,a
3585  000c 2009          	jra	L7461
3586  000e               L5461:
3587                     ; 1433     TIM3->IER &= (uint8_t)(~(uint8_t)TIM3_IT);
3589  000e 7b01          	ld	a,(OFST+1,sp)
3590  0010 43            	cpl	a
3591  0011 c45285        	and	a,21125
3592  0014 c75285        	ld	21125,a
3593  0017               L7461:
3594                     ; 1435 }
3597  0017 85            	popw	x
3598  0018 81            	ret
3679                     ; 1448 void TIM3_GenerateEvent(TIM3_EventSource_TypeDef TIM3_EventSource)
3679                     ; 1449 {
3680                     .text:	section	.text,new
3681  0000               _TIM3_GenerateEvent:
3685                     ; 1451   assert_param(IS_TIM3_EVENT_SOURCE((uint8_t)TIM3_EventSource));
3687                     ; 1454   TIM3->EGR |= (uint8_t)TIM3_EventSource;
3689  0000 ca5288        	or	a,21128
3690  0003 c75288        	ld	21128,a
3691                     ; 1455 }
3694  0006 81            	ret
3829                     ; 1470 FlagStatus TIM3_GetFlagStatus(TIM3_FLAG_TypeDef TIM3_FLAG)
3829                     ; 1471 {
3830                     .text:	section	.text,new
3831  0000               _TIM3_GetFlagStatus:
3833  0000 89            	pushw	x
3834  0001 89            	pushw	x
3835       00000002      OFST:	set	2
3838                     ; 1472   FlagStatus bitstatus = RESET;
3840                     ; 1473   uint8_t tim3_flag_l = 0, tim3_flag_h = 0;
3844                     ; 1476   assert_param(IS_TIM3_GET_FLAG(TIM3_FLAG));
3846                     ; 1478   tim3_flag_l = (uint8_t)(TIM3->SR1 & (uint8_t)(TIM3_FLAG));
3848  0002 9f            	ld	a,xl
3849  0003 c45286        	and	a,21126
3850  0006 6b01          	ld	(OFST-1,sp),a
3851                     ; 1479   tim3_flag_h = (uint8_t)(TIM3->SR2 & (uint8_t)((uint16_t)TIM3_FLAG >> 8));
3853  0008 c65287        	ld	a,21127
3854  000b 1403          	and	a,(OFST+1,sp)
3855  000d 6b02          	ld	(OFST+0,sp),a
3856                     ; 1481   if ((uint8_t)(tim3_flag_l | tim3_flag_h) != 0)
3858  000f 7b01          	ld	a,(OFST-1,sp)
3859  0011 1a02          	or	a,(OFST+0,sp)
3860  0013 2706          	jreq	L5671
3861                     ; 1483     bitstatus = SET;
3863  0015 a601          	ld	a,#1
3864  0017 6b02          	ld	(OFST+0,sp),a
3866  0019 2002          	jra	L7671
3867  001b               L5671:
3868                     ; 1487     bitstatus = RESET;
3870  001b 0f02          	clr	(OFST+0,sp)
3871  001d               L7671:
3872                     ; 1489   return ((FlagStatus)bitstatus);
3874  001d 7b02          	ld	a,(OFST+0,sp)
3877  001f 5b04          	addw	sp,#4
3878  0021 81            	ret
3913                     ; 1503 void TIM3_ClearFlag(TIM3_FLAG_TypeDef TIM3_FLAG)
3913                     ; 1504 {
3914                     .text:	section	.text,new
3915  0000               _TIM3_ClearFlag:
3917  0000 89            	pushw	x
3918       00000000      OFST:	set	0
3921                     ; 1506   assert_param(IS_TIM3_CLEAR_FLAG((uint16_t)TIM3_FLAG));
3923                     ; 1508   TIM3->SR1 = (uint8_t)(~(uint8_t)(TIM3_FLAG));
3925  0001 9f            	ld	a,xl
3926  0002 43            	cpl	a
3927  0003 c75286        	ld	21126,a
3928                     ; 1509   TIM3->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM3_FLAG >> 8));
3930  0006 7b01          	ld	a,(OFST+1,sp)
3931  0008 43            	cpl	a
3932  0009 c75287        	ld	21127,a
3933                     ; 1510 }
3936  000c 85            	popw	x
3937  000d 81            	ret
3997                     ; 1523 ITStatus TIM3_GetITStatus(TIM3_IT_TypeDef TIM3_IT)
3997                     ; 1524 {
3998                     .text:	section	.text,new
3999  0000               _TIM3_GetITStatus:
4001  0000 88            	push	a
4002  0001 89            	pushw	x
4003       00000002      OFST:	set	2
4006                     ; 1525   ITStatus bitstatus = RESET;
4008                     ; 1527   uint8_t TIM3_itStatus = 0x0, TIM3_itEnable = 0x0;
4012                     ; 1530   assert_param(IS_TIM3_GET_IT(TIM3_IT));
4014                     ; 1532   TIM3_itStatus = (uint8_t)(TIM3->SR1 & (uint8_t)TIM3_IT);
4016  0002 c45286        	and	a,21126
4017  0005 6b01          	ld	(OFST-1,sp),a
4018                     ; 1534   TIM3_itEnable = (uint8_t)(TIM3->IER & (uint8_t)TIM3_IT);
4020  0007 c65285        	ld	a,21125
4021  000a 1403          	and	a,(OFST+1,sp)
4022  000c 6b02          	ld	(OFST+0,sp),a
4023                     ; 1536   if ((TIM3_itStatus != (uint8_t)RESET ) && (TIM3_itEnable != (uint8_t)RESET))
4025  000e 0d01          	tnz	(OFST-1,sp)
4026  0010 270a          	jreq	L5302
4028  0012 0d02          	tnz	(OFST+0,sp)
4029  0014 2706          	jreq	L5302
4030                     ; 1538     bitstatus = (ITStatus)SET;
4032  0016 a601          	ld	a,#1
4033  0018 6b02          	ld	(OFST+0,sp),a
4035  001a 2002          	jra	L7302
4036  001c               L5302:
4037                     ; 1542     bitstatus = (ITStatus)RESET;
4039  001c 0f02          	clr	(OFST+0,sp)
4040  001e               L7302:
4041                     ; 1544   return ((ITStatus)bitstatus);
4043  001e 7b02          	ld	a,(OFST+0,sp)
4046  0020 5b03          	addw	sp,#3
4047  0022 81            	ret
4083                     ; 1558 void TIM3_ClearITPendingBit(TIM3_IT_TypeDef TIM3_IT)
4083                     ; 1559 {
4084                     .text:	section	.text,new
4085  0000               _TIM3_ClearITPendingBit:
4089                     ; 1561   assert_param(IS_TIM3_IT(TIM3_IT));
4091                     ; 1564   TIM3->SR1 = (uint8_t)(~(uint8_t)TIM3_IT);
4093  0000 43            	cpl	a
4094  0001 c75286        	ld	21126,a
4095                     ; 1565 }
4098  0004 81            	ret
4171                     ; 1578 void TIM3_DMACmd( TIM3_DMASource_TypeDef TIM3_DMASource, FunctionalState NewState)
4171                     ; 1579 {
4172                     .text:	section	.text,new
4173  0000               _TIM3_DMACmd:
4175  0000 89            	pushw	x
4176       00000000      OFST:	set	0
4179                     ; 1581   assert_param(IS_FUNCTIONAL_STATE(NewState));
4181                     ; 1582   assert_param(IS_TIM3_DMA_SOURCE(TIM3_DMASource));
4183                     ; 1584   if (NewState != DISABLE)
4185  0001 9f            	ld	a,xl
4186  0002 4d            	tnz	a
4187  0003 2709          	jreq	L3112
4188                     ; 1587     TIM3->DER |= TIM3_DMASource;
4190  0005 9e            	ld	a,xh
4191  0006 ca5284        	or	a,21124
4192  0009 c75284        	ld	21124,a
4194  000c 2009          	jra	L5112
4195  000e               L3112:
4196                     ; 1592     TIM3->DER &= (uint8_t)(~TIM3_DMASource);
4198  000e 7b01          	ld	a,(OFST+1,sp)
4199  0010 43            	cpl	a
4200  0011 c45284        	and	a,21124
4201  0014 c75284        	ld	21124,a
4202  0017               L5112:
4203                     ; 1594 }
4206  0017 85            	popw	x
4207  0018 81            	ret
4242                     ; 1602 void TIM3_SelectCCDMA(FunctionalState NewState)
4242                     ; 1603 {
4243                     .text:	section	.text,new
4244  0000               _TIM3_SelectCCDMA:
4248                     ; 1605   assert_param(IS_FUNCTIONAL_STATE(NewState));
4250                     ; 1607   if (NewState != DISABLE)
4252  0000 4d            	tnz	a
4253  0001 2706          	jreq	L5312
4254                     ; 1610     TIM3->CR2 |= TIM_CR2_CCDS;
4256  0003 72165281      	bset	21121,#3
4258  0007 2004          	jra	L7312
4259  0009               L5312:
4260                     ; 1615     TIM3->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
4262  0009 72175281      	bres	21121,#3
4263  000d               L7312:
4264                     ; 1617 }
4267  000d 81            	ret
4291                     ; 1641 void TIM3_InternalClockConfig(void)
4291                     ; 1642 {
4292                     .text:	section	.text,new
4293  0000               _TIM3_InternalClockConfig:
4297                     ; 1644   TIM3->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
4299  0000 c65282        	ld	a,21122
4300  0003 a4f8          	and	a,#248
4301  0005 c75282        	ld	21122,a
4302                     ; 1645 }
4305  0008 81            	ret
4392                     ; 1662 void TIM3_TIxExternalClockConfig(TIM3_TIxExternalCLK1Source_TypeDef TIM3_TIxExternalCLKSource,
4392                     ; 1663                                  TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
4392                     ; 1664                                  uint8_t ICFilter)
4392                     ; 1665 {
4393                     .text:	section	.text,new
4394  0000               _TIM3_TIxExternalClockConfig:
4396  0000 89            	pushw	x
4397       00000000      OFST:	set	0
4400                     ; 1667   assert_param(IS_TIM3_TIXCLK_SOURCE(TIM3_TIxExternalCLKSource));
4402                     ; 1668   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
4404                     ; 1669   assert_param(IS_TIM3_IC_FILTER(ICFilter));
4406                     ; 1672   if (TIM3_TIxExternalCLKSource == TIM3_TIxExternalCLK1Source_TI2)
4408  0001 9e            	ld	a,xh
4409  0002 a160          	cp	a,#96
4410  0004 260f          	jrne	L7022
4411                     ; 1674     TI2_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, ICFilter);
4413  0006 7b05          	ld	a,(OFST+5,sp)
4414  0008 88            	push	a
4415  0009 ae0001        	ldw	x,#1
4416  000c 7b03          	ld	a,(OFST+3,sp)
4417  000e 95            	ld	xh,a
4418  000f cd0000        	call	L5_TI2_Config
4420  0012 84            	pop	a
4422  0013 200d          	jra	L1122
4423  0015               L7022:
4424                     ; 1678     TI1_Config(TIM3_ICPolarity, TIM3_ICSelection_DirectTI, ICFilter);
4426  0015 7b05          	ld	a,(OFST+5,sp)
4427  0017 88            	push	a
4428  0018 ae0001        	ldw	x,#1
4429  001b 7b03          	ld	a,(OFST+3,sp)
4430  001d 95            	ld	xh,a
4431  001e cd0000        	call	L3_TI1_Config
4433  0021 84            	pop	a
4434  0022               L1122:
4435                     ; 1682   TIM3_SelectInputTrigger((TIM3_TRGSelection_TypeDef)TIM3_TIxExternalCLKSource);
4437  0022 7b01          	ld	a,(OFST+1,sp)
4438  0024 cd0000        	call	_TIM3_SelectInputTrigger
4440                     ; 1685   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
4442  0027 c65282        	ld	a,21122
4443  002a aa07          	or	a,#7
4444  002c c75282        	ld	21122,a
4445                     ; 1686 }
4448  002f 85            	popw	x
4449  0030 81            	ret
4564                     ; 1704 void TIM3_ETRClockMode1Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
4564                     ; 1705                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
4564                     ; 1706                               uint8_t ExtTRGFilter)
4564                     ; 1707 {
4565                     .text:	section	.text,new
4566  0000               _TIM3_ETRClockMode1Config:
4568  0000 89            	pushw	x
4569       00000000      OFST:	set	0
4572                     ; 1709   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, ExtTRGFilter);
4574  0001 7b05          	ld	a,(OFST+5,sp)
4575  0003 88            	push	a
4576  0004 9f            	ld	a,xl
4577  0005 97            	ld	xl,a
4578  0006 7b02          	ld	a,(OFST+2,sp)
4579  0008 95            	ld	xh,a
4580  0009 cd0000        	call	_TIM3_ETRConfig
4582  000c 84            	pop	a
4583                     ; 1712   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
4585  000d c65282        	ld	a,21122
4586  0010 a4f8          	and	a,#248
4587  0012 c75282        	ld	21122,a
4588                     ; 1713   TIM3->SMCR |= (uint8_t)(TIM3_SlaveMode_External1);
4590  0015 c65282        	ld	a,21122
4591  0018 aa07          	or	a,#7
4592  001a c75282        	ld	21122,a
4593                     ; 1716   TIM3->SMCR &= (uint8_t)(~TIM_SMCR_TS);
4595  001d c65282        	ld	a,21122
4596  0020 a48f          	and	a,#143
4597  0022 c75282        	ld	21122,a
4598                     ; 1717   TIM3->SMCR |= (uint8_t)((TIM3_TRGSelection_TypeDef)TIM3_TRGSelection_ETRF);
4600  0025 c65282        	ld	a,21122
4601  0028 aa70          	or	a,#112
4602  002a c75282        	ld	21122,a
4603                     ; 1718 }
4606  002d 85            	popw	x
4607  002e 81            	ret
4663                     ; 1736 void TIM3_ETRClockMode2Config(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
4663                     ; 1737                               TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
4663                     ; 1738                               uint8_t ExtTRGFilter)
4663                     ; 1739 {
4664                     .text:	section	.text,new
4665  0000               _TIM3_ETRClockMode2Config:
4667  0000 89            	pushw	x
4668       00000000      OFST:	set	0
4671                     ; 1741   TIM3_ETRConfig(TIM3_ExtTRGPrescaler, TIM3_ExtTRGPolarity, ExtTRGFilter);
4673  0001 7b05          	ld	a,(OFST+5,sp)
4674  0003 88            	push	a
4675  0004 9f            	ld	a,xl
4676  0005 97            	ld	xl,a
4677  0006 7b02          	ld	a,(OFST+2,sp)
4678  0008 95            	ld	xh,a
4679  0009 cd0000        	call	_TIM3_ETRConfig
4681  000c 84            	pop	a
4682                     ; 1744   TIM3->ETR |= TIM_ETR_ECE ;
4684  000d 721c5283      	bset	21123,#6
4685                     ; 1745 }
4688  0011 85            	popw	x
4689  0012 81            	ret
4803                     ; 1796 void TIM3_SelectInputTrigger(TIM3_TRGSelection_TypeDef TIM3_InputTriggerSource)
4803                     ; 1797 {
4804                     .text:	section	.text,new
4805  0000               _TIM3_SelectInputTrigger:
4807  0000 88            	push	a
4808  0001 88            	push	a
4809       00000001      OFST:	set	1
4812                     ; 1798   uint8_t tmpsmcr = 0;
4814                     ; 1801   assert_param(IS_TIM3_TRIGGER_SELECTION(TIM3_InputTriggerSource));
4816                     ; 1803   tmpsmcr = TIM3->SMCR;
4818  0002 c65282        	ld	a,21122
4819  0005 6b01          	ld	(OFST+0,sp),a
4820                     ; 1806   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
4822  0007 7b01          	ld	a,(OFST+0,sp)
4823  0009 a48f          	and	a,#143
4824  000b 6b01          	ld	(OFST+0,sp),a
4825                     ; 1807   tmpsmcr |= (uint8_t)TIM3_InputTriggerSource;
4827  000d 7b01          	ld	a,(OFST+0,sp)
4828  000f 1a02          	or	a,(OFST+1,sp)
4829  0011 6b01          	ld	(OFST+0,sp),a
4830                     ; 1809   TIM3->SMCR = (uint8_t)tmpsmcr;
4832  0013 7b01          	ld	a,(OFST+0,sp)
4833  0015 c75282        	ld	21122,a
4834                     ; 1810 }
4837  0018 85            	popw	x
4838  0019 81            	ret
4935                     ; 1824 void TIM3_SelectOutputTrigger(TIM3_TRGOSource_TypeDef TIM3_TRGOSource)
4935                     ; 1825 {
4936                     .text:	section	.text,new
4937  0000               _TIM3_SelectOutputTrigger:
4939  0000 88            	push	a
4940  0001 88            	push	a
4941       00000001      OFST:	set	1
4944                     ; 1826   uint8_t tmpcr2 = 0;
4946                     ; 1829   assert_param(IS_TIM3_TRGO_SOURCE(TIM3_TRGOSource));
4948                     ; 1831   tmpcr2 = TIM3->CR2;
4950  0002 c65281        	ld	a,21121
4951  0005 6b01          	ld	(OFST+0,sp),a
4952                     ; 1834   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
4954  0007 7b01          	ld	a,(OFST+0,sp)
4955  0009 a48f          	and	a,#143
4956  000b 6b01          	ld	(OFST+0,sp),a
4957                     ; 1837   tmpcr2 |=  (uint8_t)TIM3_TRGOSource;
4959  000d 7b01          	ld	a,(OFST+0,sp)
4960  000f 1a02          	or	a,(OFST+1,sp)
4961  0011 6b01          	ld	(OFST+0,sp),a
4962                     ; 1839   TIM3->CR2 = tmpcr2;
4964  0013 7b01          	ld	a,(OFST+0,sp)
4965  0015 c75281        	ld	21121,a
4966                     ; 1840 }
4969  0018 85            	popw	x
4970  0019 81            	ret
5051                     ; 1852 void TIM3_SelectSlaveMode(TIM3_SlaveMode_TypeDef TIM3_SlaveMode)
5051                     ; 1853 {
5052                     .text:	section	.text,new
5053  0000               _TIM3_SelectSlaveMode:
5055  0000 88            	push	a
5056  0001 88            	push	a
5057       00000001      OFST:	set	1
5060                     ; 1854   uint8_t tmpsmcr = 0;
5062                     ; 1857   assert_param(IS_TIM3_SLAVE_MODE(TIM3_SlaveMode));
5064                     ; 1859   tmpsmcr = TIM3->SMCR;
5066  0002 c65282        	ld	a,21122
5067  0005 6b01          	ld	(OFST+0,sp),a
5068                     ; 1862   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
5070  0007 7b01          	ld	a,(OFST+0,sp)
5071  0009 a4f8          	and	a,#248
5072  000b 6b01          	ld	(OFST+0,sp),a
5073                     ; 1865   tmpsmcr |= (uint8_t)TIM3_SlaveMode;
5075  000d 7b01          	ld	a,(OFST+0,sp)
5076  000f 1a02          	or	a,(OFST+1,sp)
5077  0011 6b01          	ld	(OFST+0,sp),a
5078                     ; 1867   TIM3->SMCR = tmpsmcr;
5080  0013 7b01          	ld	a,(OFST+0,sp)
5081  0015 c75282        	ld	21122,a
5082                     ; 1868 }
5085  0018 85            	popw	x
5086  0019 81            	ret
5122                     ; 1876 void TIM3_SelectMasterSlaveMode(FunctionalState NewState)
5122                     ; 1877 {
5123                     .text:	section	.text,new
5124  0000               _TIM3_SelectMasterSlaveMode:
5128                     ; 1879   assert_param(IS_FUNCTIONAL_STATE(NewState));
5130                     ; 1882   if (NewState != DISABLE)
5132  0000 4d            	tnz	a
5133  0001 2706          	jreq	L5642
5134                     ; 1884     TIM3->SMCR |= TIM_SMCR_MSM;
5136  0003 721e5282      	bset	21122,#7
5138  0007 2004          	jra	L7642
5139  0009               L5642:
5140                     ; 1888     TIM3->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
5142  0009 721f5282      	bres	21122,#7
5143  000d               L7642:
5144                     ; 1890 }
5147  000d 81            	ret
5201                     ; 1908 void TIM3_ETRConfig(TIM3_ExtTRGPSC_TypeDef TIM3_ExtTRGPrescaler,
5201                     ; 1909                     TIM3_ExtTRGPolarity_TypeDef TIM3_ExtTRGPolarity,
5201                     ; 1910                     uint8_t ExtTRGFilter)
5201                     ; 1911 {
5202                     .text:	section	.text,new
5203  0000               _TIM3_ETRConfig:
5205  0000 89            	pushw	x
5206       00000000      OFST:	set	0
5209                     ; 1913   assert_param(IS_TIM3_EXT_PRESCALER(TIM3_ExtTRGPrescaler));
5211                     ; 1914   assert_param(IS_TIM3_EXT_POLARITY(TIM3_ExtTRGPolarity));
5213                     ; 1915   assert_param(IS_TIM3_EXT_FILTER(ExtTRGFilter));
5215                     ; 1918   TIM3->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM3_ExtTRGPrescaler | (uint8_t)TIM3_ExtTRGPolarity)
5215                     ; 1919                          | (uint8_t)ExtTRGFilter);
5217  0001 9f            	ld	a,xl
5218  0002 1a01          	or	a,(OFST+1,sp)
5219  0004 1a05          	or	a,(OFST+5,sp)
5220  0006 ca5283        	or	a,21123
5221  0009 c75283        	ld	21123,a
5222                     ; 1920 }
5225  000c 85            	popw	x
5226  000d 81            	ret
5333                     ; 1955 void TIM3_EncoderInterfaceConfig(TIM3_EncoderMode_TypeDef TIM3_EncoderMode,
5333                     ; 1956                                  TIM3_ICPolarity_TypeDef TIM3_IC1Polarity,
5333                     ; 1957                                  TIM3_ICPolarity_TypeDef TIM3_IC2Polarity)
5333                     ; 1958 {
5334                     .text:	section	.text,new
5335  0000               _TIM3_EncoderInterfaceConfig:
5337  0000 89            	pushw	x
5338  0001 5203          	subw	sp,#3
5339       00000003      OFST:	set	3
5342                     ; 1959   uint8_t tmpsmcr = 0;
5344                     ; 1960   uint8_t tmpccmr1 = 0;
5346                     ; 1961   uint8_t tmpccmr2 = 0;
5348                     ; 1964   assert_param(IS_TIM3_ENCODER_MODE(TIM3_EncoderMode));
5350                     ; 1965   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC1Polarity));
5352                     ; 1966   assert_param(IS_TIM3_IC_POLARITY(TIM3_IC2Polarity));
5354                     ; 1968   tmpsmcr = TIM3->SMCR;
5356  0003 c65282        	ld	a,21122
5357  0006 6b01          	ld	(OFST-2,sp),a
5358                     ; 1969   tmpccmr1 = TIM3->CCMR1;
5360  0008 c65289        	ld	a,21129
5361  000b 6b02          	ld	(OFST-1,sp),a
5362                     ; 1970   tmpccmr2 = TIM3->CCMR2;
5364  000d c6528a        	ld	a,21130
5365  0010 6b03          	ld	(OFST+0,sp),a
5366                     ; 1973   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
5368  0012 7b01          	ld	a,(OFST-2,sp)
5369  0014 a4f0          	and	a,#240
5370  0016 6b01          	ld	(OFST-2,sp),a
5371                     ; 1974   tmpsmcr |= (uint8_t)TIM3_EncoderMode;
5373  0018 9e            	ld	a,xh
5374  0019 1a01          	or	a,(OFST-2,sp)
5375  001b 6b01          	ld	(OFST-2,sp),a
5376                     ; 1977   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
5378  001d 7b02          	ld	a,(OFST-1,sp)
5379  001f a4fc          	and	a,#252
5380  0021 6b02          	ld	(OFST-1,sp),a
5381                     ; 1978   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
5383  0023 7b03          	ld	a,(OFST+0,sp)
5384  0025 a4fc          	and	a,#252
5385  0027 6b03          	ld	(OFST+0,sp),a
5386                     ; 1979   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
5388  0029 7b02          	ld	a,(OFST-1,sp)
5389  002b aa01          	or	a,#1
5390  002d 6b02          	ld	(OFST-1,sp),a
5391                     ; 1980   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
5393  002f 7b03          	ld	a,(OFST+0,sp)
5394  0031 aa01          	or	a,#1
5395  0033 6b03          	ld	(OFST+0,sp),a
5396                     ; 1983   if (TIM3_IC1Polarity == TIM3_ICPolarity_Falling)
5398  0035 9f            	ld	a,xl
5399  0036 a101          	cp	a,#1
5400  0038 2606          	jrne	L3652
5401                     ; 1985     TIM3->CCER1 |= TIM_CCER1_CC1P ;
5403  003a 7212528b      	bset	21131,#1
5405  003e 2004          	jra	L5652
5406  0040               L3652:
5407                     ; 1989     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
5409  0040 7213528b      	bres	21131,#1
5410  0044               L5652:
5411                     ; 1992   if (TIM3_IC2Polarity == TIM3_ICPolarity_Falling)
5413  0044 7b08          	ld	a,(OFST+5,sp)
5414  0046 a101          	cp	a,#1
5415  0048 2606          	jrne	L7652
5416                     ; 1994     TIM3->CCER1 |= TIM_CCER1_CC2P ;
5418  004a 721a528b      	bset	21131,#5
5420  004e 2004          	jra	L1752
5421  0050               L7652:
5422                     ; 1998     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5424  0050 721b528b      	bres	21131,#5
5425  0054               L1752:
5426                     ; 2001   TIM3->SMCR = tmpsmcr;
5428  0054 7b01          	ld	a,(OFST-2,sp)
5429  0056 c75282        	ld	21122,a
5430                     ; 2002   TIM3->CCMR1 = tmpccmr1;
5432  0059 7b02          	ld	a,(OFST-1,sp)
5433  005b c75289        	ld	21129,a
5434                     ; 2003   TIM3->CCMR2 = tmpccmr2;
5436  005e 7b03          	ld	a,(OFST+0,sp)
5437  0060 c7528a        	ld	21130,a
5438                     ; 2004 }
5441  0063 5b05          	addw	sp,#5
5442  0065 81            	ret
5478                     ; 2012 void TIM3_SelectHallSensor(FunctionalState NewState)
5478                     ; 2013 {
5479                     .text:	section	.text,new
5480  0000               _TIM3_SelectHallSensor:
5484                     ; 2015   assert_param(IS_FUNCTIONAL_STATE(NewState));
5486                     ; 2018   if (NewState != DISABLE)
5488  0000 4d            	tnz	a
5489  0001 2706          	jreq	L1162
5490                     ; 2020     TIM3->CR2 |= TIM_CR2_TI1S;
5492  0003 721e5281      	bset	21121,#7
5494  0007 2004          	jra	L3162
5495  0009               L1162:
5496                     ; 2024     TIM3->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
5498  0009 721f5281      	bres	21121,#7
5499  000d               L3162:
5500                     ; 2026 }
5503  000d 81            	ret
5569                     ; 2047 static void TI1_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity, \
5569                     ; 2048                        TIM3_ICSelection_TypeDef TIM3_ICSelection, \
5569                     ; 2049                        uint8_t TIM3_ICFilter)
5569                     ; 2050 {
5570                     .text:	section	.text,new
5571  0000               L3_TI1_Config:
5573  0000 89            	pushw	x
5574  0001 89            	pushw	x
5575       00000002      OFST:	set	2
5578                     ; 2051   uint8_t tmpccmr1 = 0;
5580                     ; 2052   uint8_t tmpicpolarity = TIM3_ICPolarity;
5582  0002 9e            	ld	a,xh
5583  0003 6b01          	ld	(OFST-1,sp),a
5584                     ; 2053   tmpccmr1 = TIM3->CCMR1;
5586  0005 c65289        	ld	a,21129
5587  0008 6b02          	ld	(OFST+0,sp),a
5588                     ; 2056   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5590                     ; 2057   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5592                     ; 2058   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5594                     ; 2061   TIM3->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5596  000a 7211528b      	bres	21131,#0
5597                     ; 2064   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5599  000e 7b02          	ld	a,(OFST+0,sp)
5600  0010 a40c          	and	a,#12
5601  0012 6b02          	ld	(OFST+0,sp),a
5602                     ; 2065   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5604  0014 7b07          	ld	a,(OFST+5,sp)
5605  0016 97            	ld	xl,a
5606  0017 a610          	ld	a,#16
5607  0019 42            	mul	x,a
5608  001a 9f            	ld	a,xl
5609  001b 1a04          	or	a,(OFST+2,sp)
5610  001d 1a02          	or	a,(OFST+0,sp)
5611  001f 6b02          	ld	(OFST+0,sp),a
5612                     ; 2067   TIM3->CCMR1 = tmpccmr1;
5614  0021 7b02          	ld	a,(OFST+0,sp)
5615  0023 c75289        	ld	21129,a
5616                     ; 2070   if (tmpicpolarity == (uint8_t)(TIM3_ICPolarity_Falling))
5618  0026 7b01          	ld	a,(OFST-1,sp)
5619  0028 a101          	cp	a,#1
5620  002a 2606          	jrne	L5462
5621                     ; 2072     TIM3->CCER1 |= TIM_CCER1_CC1P;
5623  002c 7212528b      	bset	21131,#1
5625  0030 2004          	jra	L7462
5626  0032               L5462:
5627                     ; 2076     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5629  0032 7213528b      	bres	21131,#1
5630  0036               L7462:
5631                     ; 2080   TIM3->CCER1 |=  TIM_CCER1_CC1E;
5633  0036 7210528b      	bset	21131,#0
5634                     ; 2081 }
5637  003a 5b04          	addw	sp,#4
5638  003c 81            	ret
5704                     ; 2098 static void TI2_Config(TIM3_ICPolarity_TypeDef TIM3_ICPolarity,
5704                     ; 2099                        TIM3_ICSelection_TypeDef TIM3_ICSelection,
5704                     ; 2100                        uint8_t TIM3_ICFilter)
5704                     ; 2101 {
5705                     .text:	section	.text,new
5706  0000               L5_TI2_Config:
5708  0000 89            	pushw	x
5709  0001 89            	pushw	x
5710       00000002      OFST:	set	2
5713                     ; 2102   uint8_t tmpccmr2 = 0;
5715                     ; 2103   uint8_t tmpicpolarity = TIM3_ICPolarity;
5717  0002 9e            	ld	a,xh
5718  0003 6b01          	ld	(OFST-1,sp),a
5719                     ; 2106   assert_param(IS_TIM3_IC_POLARITY(TIM3_ICPolarity));
5721                     ; 2107   assert_param(IS_TIM3_IC_SELECTION(TIM3_ICSelection));
5723                     ; 2108   assert_param(IS_TIM3_IC_FILTER(TIM3_ICFilter));
5725                     ; 2110   tmpccmr2 = TIM3->CCMR2;
5727  0005 c6528a        	ld	a,21130
5728  0008 6b02          	ld	(OFST+0,sp),a
5729                     ; 2113   TIM3->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5731  000a 7219528b      	bres	21131,#4
5732                     ; 2116   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5734  000e 7b02          	ld	a,(OFST+0,sp)
5735  0010 a40c          	and	a,#12
5736  0012 6b02          	ld	(OFST+0,sp),a
5737                     ; 2117   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM3_ICSelection)) | ((uint8_t)(TIM3_ICFilter << 4)));
5739  0014 7b07          	ld	a,(OFST+5,sp)
5740  0016 97            	ld	xl,a
5741  0017 a610          	ld	a,#16
5742  0019 42            	mul	x,a
5743  001a 9f            	ld	a,xl
5744  001b 1a04          	or	a,(OFST+2,sp)
5745  001d 1a02          	or	a,(OFST+0,sp)
5746  001f 6b02          	ld	(OFST+0,sp),a
5747                     ; 2119   TIM3->CCMR2 = tmpccmr2;
5749  0021 7b02          	ld	a,(OFST+0,sp)
5750  0023 c7528a        	ld	21130,a
5751                     ; 2122   if (tmpicpolarity == TIM3_ICPolarity_Falling)
5753  0026 7b01          	ld	a,(OFST-1,sp)
5754  0028 a101          	cp	a,#1
5755  002a 2606          	jrne	L1072
5756                     ; 2124     TIM3->CCER1 |= TIM_CCER1_CC2P ;
5758  002c 721a528b      	bset	21131,#5
5760  0030 2004          	jra	L3072
5761  0032               L1072:
5762                     ; 2128     TIM3->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5764  0032 721b528b      	bres	21131,#5
5765  0036               L3072:
5766                     ; 2132   TIM3->CCER1 |=  TIM_CCER1_CC2E;
5768  0036 7218528b      	bset	21131,#4
5769                     ; 2133 }
5772  003a 5b04          	addw	sp,#4
5773  003c 81            	ret
5786                     	xdef	_TIM3_SelectHallSensor
5787                     	xdef	_TIM3_EncoderInterfaceConfig
5788                     	xdef	_TIM3_ETRConfig
5789                     	xdef	_TIM3_SelectMasterSlaveMode
5790                     	xdef	_TIM3_SelectSlaveMode
5791                     	xdef	_TIM3_SelectOutputTrigger
5792                     	xdef	_TIM3_SelectInputTrigger
5793                     	xdef	_TIM3_ETRClockMode2Config
5794                     	xdef	_TIM3_ETRClockMode1Config
5795                     	xdef	_TIM3_TIxExternalClockConfig
5796                     	xdef	_TIM3_InternalClockConfig
5797                     	xdef	_TIM3_SelectCCDMA
5798                     	xdef	_TIM3_DMACmd
5799                     	xdef	_TIM3_ClearITPendingBit
5800                     	xdef	_TIM3_GetITStatus
5801                     	xdef	_TIM3_ClearFlag
5802                     	xdef	_TIM3_GetFlagStatus
5803                     	xdef	_TIM3_GenerateEvent
5804                     	xdef	_TIM3_ITConfig
5805                     	xdef	_TIM3_SetIC2Prescaler
5806                     	xdef	_TIM3_SetIC1Prescaler
5807                     	xdef	_TIM3_GetCapture2
5808                     	xdef	_TIM3_GetCapture1
5809                     	xdef	_TIM3_PWMIConfig
5810                     	xdef	_TIM3_ICInit
5811                     	xdef	_TIM3_CCxCmd
5812                     	xdef	_TIM3_OC2PolarityConfig
5813                     	xdef	_TIM3_OC1PolarityConfig
5814                     	xdef	_TIM3_OC2FastConfig
5815                     	xdef	_TIM3_OC1FastConfig
5816                     	xdef	_TIM3_OC2PreloadConfig
5817                     	xdef	_TIM3_OC1PreloadConfig
5818                     	xdef	_TIM3_ForcedOC2Config
5819                     	xdef	_TIM3_ForcedOC1Config
5820                     	xdef	_TIM3_SetCompare2
5821                     	xdef	_TIM3_SetCompare1
5822                     	xdef	_TIM3_SelectOCxM
5823                     	xdef	_TIM3_CtrlPWMOutputs
5824                     	xdef	_TIM3_BKRConfig
5825                     	xdef	_TIM3_OC2Init
5826                     	xdef	_TIM3_OC1Init
5827                     	xdef	_TIM3_Cmd
5828                     	xdef	_TIM3_SelectOnePulseMode
5829                     	xdef	_TIM3_ARRPreloadConfig
5830                     	xdef	_TIM3_UpdateRequestConfig
5831                     	xdef	_TIM3_UpdateDisableConfig
5832                     	xdef	_TIM3_GetPrescaler
5833                     	xdef	_TIM3_GetCounter
5834                     	xdef	_TIM3_SetAutoreload
5835                     	xdef	_TIM3_SetCounter
5836                     	xdef	_TIM3_CounterModeConfig
5837                     	xdef	_TIM3_PrescalerConfig
5838                     	xdef	_TIM3_TimeBaseInit
5839                     	xdef	_TIM3_DeInit
5858                     	end
