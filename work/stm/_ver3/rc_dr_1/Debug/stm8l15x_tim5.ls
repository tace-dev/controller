   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 165 void TIM5_DeInit(void)
  50                     ; 166 {
  52                     .text:	section	.text,new
  53  0000               _TIM5_DeInit:
  57                     ; 167   TIM5->CR1 = TIM_CR1_RESET_VALUE;
  59  0000 725f5300      	clr	21248
  60                     ; 168   TIM5->CR2 = TIM_CR2_RESET_VALUE;
  62  0004 725f5301      	clr	21249
  63                     ; 169   TIM5->SMCR = TIM_SMCR_RESET_VALUE;
  65  0008 725f5302      	clr	21250
  66                     ; 170   TIM5->ETR = TIM_ETR_RESET_VALUE;
  68  000c 725f5303      	clr	21251
  69                     ; 171   TIM5->IER = TIM_IER_RESET_VALUE;
  71  0010 725f5305      	clr	21253
  72                     ; 172   TIM5->SR2 = TIM_SR2_RESET_VALUE;
  74  0014 725f5307      	clr	21255
  75                     ; 175   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  77  0018 725f530b      	clr	21259
  78                     ; 177   TIM5->CCMR1 = 0x01;/*TIM5_ICxSource_TIxFPx */
  80  001c 35015309      	mov	21257,#1
  81                     ; 178   TIM5->CCMR2 = 0x01;/*TIM5_ICxSource_TIxFPx */
  83  0020 3501530a      	mov	21258,#1
  84                     ; 181   TIM5->CCER1 = TIM_CCER1_RESET_VALUE;
  86  0024 725f530b      	clr	21259
  87                     ; 182   TIM5->CCMR1 = TIM_CCMR1_RESET_VALUE;
  89  0028 725f5309      	clr	21257
  90                     ; 183   TIM5->CCMR2 = TIM_CCMR2_RESET_VALUE;
  92  002c 725f530a      	clr	21258
  93                     ; 185   TIM5->CNTRH = TIM_CNTRH_RESET_VALUE;
  95  0030 725f530c      	clr	21260
  96                     ; 186   TIM5->CNTRL = TIM_CNTRL_RESET_VALUE;
  98  0034 725f530d      	clr	21261
  99                     ; 188   TIM5->PSCR = TIM_PSCR_RESET_VALUE;
 101  0038 725f530e      	clr	21262
 102                     ; 190   TIM5->ARRH = TIM_ARRH_RESET_VALUE;
 104  003c 35ff530f      	mov	21263,#255
 105                     ; 191   TIM5->ARRL = TIM_ARRL_RESET_VALUE;
 107  0040 35ff5310      	mov	21264,#255
 108                     ; 193   TIM5->CCR1H = TIM_CCR1H_RESET_VALUE;
 110  0044 725f5311      	clr	21265
 111                     ; 194   TIM5->CCR1L = TIM_CCR1L_RESET_VALUE;
 113  0048 725f5312      	clr	21266
 114                     ; 195   TIM5->CCR2H = TIM_CCR2H_RESET_VALUE;
 116  004c 725f5313      	clr	21267
 117                     ; 196   TIM5->CCR2L = TIM_CCR2L_RESET_VALUE;
 119  0050 725f5314      	clr	21268
 120                     ; 199   TIM5->OISR = TIM_OISR_RESET_VALUE;
 122  0054 725f5316      	clr	21270
 123                     ; 200   TIM5->EGR = 0x01;/* TIM_EGR_UG */
 125  0058 35015308      	mov	21256,#1
 126                     ; 201   TIM5->BKR = TIM_BKR_RESET_VALUE;
 128  005c 725f5315      	clr	21269
 129                     ; 202   TIM5->SR1 = TIM_SR1_RESET_VALUE;
 131  0060 725f5306      	clr	21254
 132                     ; 203 }
 135  0064 81            	ret	
 295                     ; 228 void TIM5_TimeBaseInit(TIM5_Prescaler_TypeDef TIM5_Prescaler,
 295                     ; 229                        TIM5_CounterMode_TypeDef TIM5_CounterMode,
 295                     ; 230                        uint16_t TIM5_Period)
 295                     ; 231 {
 296                     .text:	section	.text,new
 297  0000               _TIM5_TimeBaseInit:
 299  0000 89            	pushw	x
 300       00000000      OFST:	set	0
 303                     ; 233   assert_param(IS_TIM5_PRESCALER(TIM5_Prescaler));
 305                     ; 234   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 307                     ; 239   TIM5->ARRH = (uint8_t)(TIM5_Period >> 8) ;
 309  0001 7b05          	ld	a,(OFST+5,sp)
 310  0003 c7530f        	ld	21263,a
 311                     ; 240   TIM5->ARRL = (uint8_t)(TIM5_Period);
 313  0006 7b06          	ld	a,(OFST+6,sp)
 314  0008 c75310        	ld	21264,a
 315                     ; 243   TIM5->PSCR = (uint8_t)(TIM5_Prescaler);
 317  000b 9e            	ld	a,xh
 318  000c c7530e        	ld	21262,a
 319                     ; 246   TIM5->CR1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS)) & ((uint8_t)(~TIM_CR1_DIR));
 321  000f c65300        	ld	a,21248
 322  0012 a48f          	and	a,#143
 323  0014 c75300        	ld	21248,a
 324                     ; 247   TIM5->CR1 |= (uint8_t)(TIM5_CounterMode);
 326  0017 9f            	ld	a,xl
 327  0018 ca5300        	or	a,21248
 328  001b c75300        	ld	21248,a
 329                     ; 250   TIM5->EGR = TIM5_EventSource_Update;
 331  001e 35015308      	mov	21256,#1
 332                     ; 251 }
 335  0022 85            	popw	x
 336  0023 81            	ret	
 404                     ; 271 void TIM5_PrescalerConfig(TIM5_Prescaler_TypeDef Prescaler,
 404                     ; 272                           TIM5_PSCReloadMode_TypeDef TIM5_PSCReloadMode)
 404                     ; 273 {
 405                     .text:	section	.text,new
 406  0000               _TIM5_PrescalerConfig:
 410                     ; 275   assert_param(IS_TIM5_PRESCALER(Prescaler));
 412                     ; 276   assert_param(IS_TIM5_PRESCALER_RELOAD(TIM5_PSCReloadMode));
 414                     ; 279   TIM5->PSCR = (uint8_t)(Prescaler);
 416  0000 9e            	ld	a,xh
 417  0001 c7530e        	ld	21262,a
 418                     ; 282   if (TIM5_PSCReloadMode == TIM5_PSCReloadMode_Immediate)
 420  0004 9f            	ld	a,xl
 421  0005 4a            	dec	a
 422  0006 2605          	jrne	L541
 423                     ; 284     TIM5->EGR |= TIM_EGR_UG ;
 425  0008 72105308      	bset	21256,#0
 428  000c 81            	ret	
 429  000d               L541:
 430                     ; 288     TIM5->EGR &= (uint8_t)(~TIM_EGR_UG) ;
 432  000d 72115308      	bres	21256,#0
 433                     ; 290 }
 436  0011 81            	ret	
 479                     ; 303 void TIM5_CounterModeConfig(TIM5_CounterMode_TypeDef TIM5_CounterMode)
 479                     ; 304 {
 480                     .text:	section	.text,new
 481  0000               _TIM5_CounterModeConfig:
 483  0000 88            	push	a
 484  0001 88            	push	a
 485       00000001      OFST:	set	1
 488                     ; 305   uint8_t tmpcr1 = 0;
 490                     ; 308   assert_param(IS_TIM5_COUNTER_MODE(TIM5_CounterMode));
 492                     ; 310   tmpcr1 = TIM5->CR1;
 494  0002 c65300        	ld	a,21248
 495                     ; 313   tmpcr1 &= (uint8_t)((uint8_t)(~TIM_CR1_CMS) & (uint8_t)(~TIM_CR1_DIR));
 497  0005 a48f          	and	a,#143
 498                     ; 316   tmpcr1 |= (uint8_t)TIM5_CounterMode;
 500  0007 1a02          	or	a,(OFST+1,sp)
 501                     ; 318   TIM5->CR1 = tmpcr1;
 503  0009 c75300        	ld	21248,a
 504                     ; 319 }
 507  000c 85            	popw	x
 508  000d 81            	ret	
 540                     ; 327 void TIM5_SetCounter(uint16_t Counter)
 540                     ; 328 {
 541                     .text:	section	.text,new
 542  0000               _TIM5_SetCounter:
 546                     ; 331   TIM5->CNTRH = (uint8_t)(Counter >> 8);
 548  0000 9e            	ld	a,xh
 549  0001 c7530c        	ld	21260,a
 550                     ; 332   TIM5->CNTRL = (uint8_t)(Counter);
 552  0004 9f            	ld	a,xl
 553  0005 c7530d        	ld	21261,a
 554                     ; 333 }
 557  0008 81            	ret	
 589                     ; 341 void TIM5_SetAutoreload(uint16_t Autoreload)
 589                     ; 342 {
 590                     .text:	section	.text,new
 591  0000               _TIM5_SetAutoreload:
 595                     ; 344   TIM5->ARRH = (uint8_t)(Autoreload >> 8);
 597  0000 9e            	ld	a,xh
 598  0001 c7530f        	ld	21263,a
 599                     ; 345   TIM5->ARRL = (uint8_t)(Autoreload);
 601  0004 9f            	ld	a,xl
 602  0005 c75310        	ld	21264,a
 603                     ; 346 }
 606  0008 81            	ret	
 652                     ; 353 uint16_t TIM5_GetCounter(void)
 652                     ; 354 {
 653                     .text:	section	.text,new
 654  0000               _TIM5_GetCounter:
 656  0000 5204          	subw	sp,#4
 657       00000004      OFST:	set	4
 660                     ; 355   uint16_t tmpcnt = 0;
 662                     ; 358   tmpcntrh = TIM5->CNTRH;
 664  0002 c6530c        	ld	a,21260
 665  0005 6b02          	ld	(OFST-2,sp),a
 666                     ; 359   tmpcntrl = TIM5->CNTRL;
 668  0007 c6530d        	ld	a,21261
 669  000a 6b01          	ld	(OFST-3,sp),a
 670                     ; 361   tmpcnt = (uint16_t)(tmpcntrl);
 672  000c 5f            	clrw	x
 673  000d 97            	ld	xl,a
 674  000e 1f03          	ldw	(OFST-1,sp),x
 675                     ; 362   tmpcnt |= (uint16_t)((uint16_t)tmpcntrh << 8);
 677  0010 5f            	clrw	x
 678  0011 7b02          	ld	a,(OFST-2,sp)
 679  0013 97            	ld	xl,a
 680  0014 7b04          	ld	a,(OFST+0,sp)
 681  0016 01            	rrwa	x,a
 682  0017 1a03          	or	a,(OFST-1,sp)
 683  0019 01            	rrwa	x,a
 684                     ; 364   return ((uint16_t)tmpcnt);
 688  001a 5b04          	addw	sp,#4
 689  001c 81            	ret	
 713                     ; 380 TIM5_Prescaler_TypeDef TIM5_GetPrescaler(void)
 713                     ; 381 {
 714                     .text:	section	.text,new
 715  0000               _TIM5_GetPrescaler:
 719                     ; 383   return ((TIM5_Prescaler_TypeDef)TIM5->PSCR);
 721  0000 c6530e        	ld	a,21262
 724  0003 81            	ret	
 780                     ; 393 void TIM5_UpdateDisableConfig(FunctionalState NewState)
 780                     ; 394 {
 781                     .text:	section	.text,new
 782  0000               _TIM5_UpdateDisableConfig:
 786                     ; 396   assert_param(IS_FUNCTIONAL_STATE(NewState));
 788                     ; 399   if (NewState != DISABLE)
 790  0000 4d            	tnz	a
 791  0001 2705          	jreq	L772
 792                     ; 401     TIM5->CR1 |= TIM_CR1_UDIS;
 794  0003 72125300      	bset	21248,#1
 797  0007 81            	ret	
 798  0008               L772:
 799                     ; 405     TIM5->CR1 &= (uint8_t)(~TIM_CR1_UDIS);
 801  0008 72135300      	bres	21248,#1
 802                     ; 407 }
 805  000c 81            	ret	
 863                     ; 417 void TIM5_UpdateRequestConfig(TIM5_UpdateSource_TypeDef TIM5_UpdateSource)
 863                     ; 418 {
 864                     .text:	section	.text,new
 865  0000               _TIM5_UpdateRequestConfig:
 869                     ; 420   assert_param(IS_TIM5_UPDATE_SOURCE(TIM5_UpdateSource));
 871                     ; 423   if (TIM5_UpdateSource == TIM5_UpdateSource_Regular)
 873  0000 4a            	dec	a
 874  0001 2605          	jrne	L133
 875                     ; 425     TIM5->CR1 |= TIM_CR1_URS ;
 877  0003 72145300      	bset	21248,#2
 880  0007 81            	ret	
 881  0008               L133:
 882                     ; 429     TIM5->CR1 &= (uint8_t)(~TIM_CR1_URS);
 884  0008 72155300      	bres	21248,#2
 885                     ; 431 }
 888  000c 81            	ret	
 924                     ; 439 void TIM5_ARRPreloadConfig(FunctionalState NewState)
 924                     ; 440 {
 925                     .text:	section	.text,new
 926  0000               _TIM5_ARRPreloadConfig:
 930                     ; 442   assert_param(IS_FUNCTIONAL_STATE(NewState));
 932                     ; 445   if (NewState != DISABLE)
 934  0000 4d            	tnz	a
 935  0001 2705          	jreq	L353
 936                     ; 447     TIM5->CR1 |= TIM_CR1_ARPE;
 938  0003 721e5300      	bset	21248,#7
 941  0007 81            	ret	
 942  0008               L353:
 943                     ; 451     TIM5->CR1 &= (uint8_t)(~TIM_CR1_ARPE);
 945  0008 721f5300      	bres	21248,#7
 946                     ; 453 }
 949  000c 81            	ret	
1006                     ; 463 void TIM5_SelectOnePulseMode(TIM5_OPMode_TypeDef TIM5_OPMode)
1006                     ; 464 {
1007                     .text:	section	.text,new
1008  0000               _TIM5_SelectOnePulseMode:
1012                     ; 466   assert_param(IS_TIM5_OPM_MODE(TIM5_OPMode));
1014                     ; 469   if (TIM5_OPMode == TIM5_OPMode_Single)
1016  0000 4a            	dec	a
1017  0001 2605          	jrne	L504
1018                     ; 471     TIM5->CR1 |= TIM_CR1_OPM ;
1020  0003 72165300      	bset	21248,#3
1023  0007 81            	ret	
1024  0008               L504:
1025                     ; 475     TIM5->CR1 &= (uint8_t)(~TIM_CR1_OPM);
1027  0008 72175300      	bres	21248,#3
1028                     ; 477 }
1031  000c 81            	ret	
1066                     ; 485 void TIM5_Cmd(FunctionalState NewState)
1066                     ; 486 {
1067                     .text:	section	.text,new
1068  0000               _TIM5_Cmd:
1072                     ; 488   assert_param(IS_FUNCTIONAL_STATE(NewState));
1074                     ; 491   if (NewState != DISABLE)
1076  0000 4d            	tnz	a
1077  0001 2705          	jreq	L724
1078                     ; 493     TIM5->CR1 |= TIM_CR1_CEN;
1080  0003 72105300      	bset	21248,#0
1083  0007 81            	ret	
1084  0008               L724:
1085                     ; 497     TIM5->CR1 &= (uint8_t)(~TIM_CR1_CEN);
1087  0008 72115300      	bres	21248,#0
1088                     ; 499 }
1091  000c 81            	ret	
1285                     ; 575 void TIM5_OC1Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1285                     ; 576                   TIM5_OutputState_TypeDef TIM5_OutputState,
1285                     ; 577                   uint16_t TIM5_Pulse,
1285                     ; 578                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1285                     ; 579                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1285                     ; 580 {
1286                     .text:	section	.text,new
1287  0000               _TIM5_OC1Init:
1289  0000 89            	pushw	x
1290  0001 88            	push	a
1291       00000001      OFST:	set	1
1294                     ; 581   uint8_t tmpccmr1 = 0;
1296                     ; 584   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1298                     ; 585   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1300                     ; 586   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1302                     ; 587   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1304                     ; 589   tmpccmr1 = TIM5->CCMR1;
1306  0002 c65309        	ld	a,21257
1307  0005 6b01          	ld	(OFST+0,sp),a
1308                     ; 592   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1310  0007 7211530b      	bres	21259,#0
1311                     ; 594   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
1313  000b a48f          	and	a,#143
1314  000d 6b01          	ld	(OFST+0,sp),a
1315                     ; 597   tmpccmr1 |= (uint8_t)TIM5_OCMode;
1317  000f 9e            	ld	a,xh
1318  0010 1a01          	or	a,(OFST+0,sp)
1319  0012 6b01          	ld	(OFST+0,sp),a
1320                     ; 599   TIM5->CCMR1 = tmpccmr1;
1322  0014 c75309        	ld	21257,a
1323                     ; 602   if (TIM5_OutputState == TIM5_OutputState_Enable)
1325  0017 9f            	ld	a,xl
1326  0018 4a            	dec	a
1327  0019 2606          	jrne	L145
1328                     ; 604     TIM5->CCER1 |= TIM_CCER1_CC1E;
1330  001b 7210530b      	bset	21259,#0
1332  001f 2004          	jra	L345
1333  0021               L145:
1334                     ; 608     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1336  0021 7211530b      	bres	21259,#0
1337  0025               L345:
1338                     ; 612   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1340  0025 7b08          	ld	a,(OFST+7,sp)
1341  0027 4a            	dec	a
1342  0028 2606          	jrne	L545
1343                     ; 614     TIM5->CCER1 |= TIM_CCER1_CC1P;
1345  002a 7212530b      	bset	21259,#1
1347  002e 2004          	jra	L745
1348  0030               L545:
1349                     ; 618     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
1351  0030 7213530b      	bres	21259,#1
1352  0034               L745:
1353                     ; 622   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1355  0034 7b09          	ld	a,(OFST+8,sp)
1356  0036 4a            	dec	a
1357  0037 2606          	jrne	L155
1358                     ; 624     TIM5->OISR |= TIM_OISR_OIS1;
1360  0039 72105316      	bset	21270,#0
1362  003d 2004          	jra	L355
1363  003f               L155:
1364                     ; 628     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS1);
1366  003f 72115316      	bres	21270,#0
1367  0043               L355:
1368                     ; 632   TIM5->CCR1H = (uint8_t)(TIM5_Pulse >> 8);
1370  0043 7b06          	ld	a,(OFST+5,sp)
1371  0045 c75311        	ld	21265,a
1372                     ; 633   TIM5->CCR1L = (uint8_t)(TIM5_Pulse);
1374  0048 7b07          	ld	a,(OFST+6,sp)
1375  004a c75312        	ld	21266,a
1376                     ; 634 }
1379  004d 5b03          	addw	sp,#3
1380  004f 81            	ret	
1459                     ; 661 void TIM5_OC2Init(TIM5_OCMode_TypeDef TIM5_OCMode,
1459                     ; 662                   TIM5_OutputState_TypeDef TIM5_OutputState,
1459                     ; 663                   uint16_t TIM5_Pulse,
1459                     ; 664                   TIM5_OCPolarity_TypeDef TIM5_OCPolarity,
1459                     ; 665                   TIM5_OCIdleState_TypeDef TIM5_OCIdleState)
1459                     ; 666 {
1460                     .text:	section	.text,new
1461  0000               _TIM5_OC2Init:
1463  0000 89            	pushw	x
1464  0001 88            	push	a
1465       00000001      OFST:	set	1
1468                     ; 667   uint8_t tmpccmr2 = 0;
1470                     ; 670   assert_param(IS_TIM5_OC_MODE(TIM5_OCMode));
1472                     ; 671   assert_param(IS_TIM5_OUTPUT_STATE(TIM5_OutputState));
1474                     ; 672   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
1476                     ; 673   assert_param(IS_TIM5_OCIDLE_STATE(TIM5_OCIdleState));
1478                     ; 675   tmpccmr2 = TIM5->CCMR2;
1480  0002 c6530a        	ld	a,21258
1481  0005 6b01          	ld	(OFST+0,sp),a
1482                     ; 678   TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1484  0007 7219530b      	bres	21259,#4
1485                     ; 681   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
1487  000b a48f          	and	a,#143
1488  000d 6b01          	ld	(OFST+0,sp),a
1489                     ; 684   tmpccmr2 |= (uint8_t)TIM5_OCMode;
1491  000f 9e            	ld	a,xh
1492  0010 1a01          	or	a,(OFST+0,sp)
1493  0012 6b01          	ld	(OFST+0,sp),a
1494                     ; 686   TIM5->CCMR2 = tmpccmr2;
1496  0014 c7530a        	ld	21258,a
1497                     ; 689   if (TIM5_OutputState == TIM5_OutputState_Enable)
1499  0017 9f            	ld	a,xl
1500  0018 4a            	dec	a
1501  0019 2606          	jrne	L316
1502                     ; 691     TIM5->CCER1 |= TIM_CCER1_CC2E;
1504  001b 7218530b      	bset	21259,#4
1506  001f 2004          	jra	L516
1507  0021               L316:
1508                     ; 695     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1510  0021 7219530b      	bres	21259,#4
1511  0025               L516:
1512                     ; 699   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
1514  0025 7b08          	ld	a,(OFST+7,sp)
1515  0027 4a            	dec	a
1516  0028 2606          	jrne	L716
1517                     ; 701     TIM5->CCER1 |= TIM_CCER1_CC2P;
1519  002a 721a530b      	bset	21259,#5
1521  002e 2004          	jra	L126
1522  0030               L716:
1523                     ; 705     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P);
1525  0030 721b530b      	bres	21259,#5
1526  0034               L126:
1527                     ; 710   if (TIM5_OCIdleState == TIM5_OCIdleState_Set)
1529  0034 7b09          	ld	a,(OFST+8,sp)
1530  0036 4a            	dec	a
1531  0037 2606          	jrne	L326
1532                     ; 712     TIM5->OISR |= TIM_OISR_OIS2;
1534  0039 72145316      	bset	21270,#2
1536  003d 2004          	jra	L526
1537  003f               L326:
1538                     ; 716     TIM5->OISR &= (uint8_t)(~TIM_OISR_OIS2);
1540  003f 72155316      	bres	21270,#2
1541  0043               L526:
1542                     ; 720   TIM5->CCR2H = (uint8_t)(TIM5_Pulse >> 8);
1544  0043 7b06          	ld	a,(OFST+5,sp)
1545  0045 c75313        	ld	21267,a
1546                     ; 721   TIM5->CCR2L = (uint8_t)(TIM5_Pulse);
1548  0048 7b07          	ld	a,(OFST+6,sp)
1549  004a c75314        	ld	21268,a
1550                     ; 722 }
1553  004d 5b03          	addw	sp,#3
1554  004f 81            	ret	
1752                     ; 751 void TIM5_BKRConfig(TIM5_OSSIState_TypeDef TIM5_OSSIState,
1752                     ; 752                     TIM5_LockLevel_TypeDef TIM5_LockLevel,
1752                     ; 753                     TIM5_BreakState_TypeDef TIM5_BreakState,
1752                     ; 754                     TIM5_BreakPolarity_TypeDef TIM5_BreakPolarity,
1752                     ; 755                     TIM5_AutomaticOutput_TypeDef TIM5_AutomaticOutput)
1752                     ; 756 
1752                     ; 757 {
1753                     .text:	section	.text,new
1754  0000               _TIM5_BKRConfig:
1756  0000 89            	pushw	x
1757  0001 88            	push	a
1758       00000001      OFST:	set	1
1761                     ; 759   assert_param(IS_TIM5_OSSI_STATE(TIM5_OSSIState));
1763                     ; 760   assert_param(IS_TIM5_LOCK_LEVEL(TIM5_LockLevel));
1765                     ; 761   assert_param(IS_TIM5_BREAK_STATE(TIM5_BreakState));
1767                     ; 762   assert_param(IS_TIM5_BREAK_POLARITY(TIM5_BreakPolarity));
1769                     ; 763   assert_param(IS_TIM5_AUTOMATIC_OUTPUT_STATE(TIM5_AutomaticOutput));
1771                     ; 769   TIM5->BKR = (uint8_t)((uint8_t)((uint8_t)((uint8_t)((uint8_t)TIM5_OSSIState | (uint8_t)TIM5_LockLevel) | \
1771                     ; 770                                   (uint8_t)((uint8_t)TIM5_BreakState | (uint8_t)TIM5_BreakPolarity)) | \
1771                     ; 771                                   TIM5_AutomaticOutput));
1773  0002 7b06          	ld	a,(OFST+5,sp)
1774  0004 1a07          	or	a,(OFST+6,sp)
1775  0006 6b01          	ld	(OFST+0,sp),a
1776  0008 9f            	ld	a,xl
1777  0009 1a02          	or	a,(OFST+1,sp)
1778  000b 1a01          	or	a,(OFST+0,sp)
1779  000d 1a08          	or	a,(OFST+7,sp)
1780  000f c75315        	ld	21269,a
1781                     ; 772 }
1784  0012 5b03          	addw	sp,#3
1785  0014 81            	ret	
1821                     ; 780 void TIM5_CtrlPWMOutputs(FunctionalState NewState)
1821                     ; 781 {
1822                     .text:	section	.text,new
1823  0000               _TIM5_CtrlPWMOutputs:
1827                     ; 783   assert_param(IS_FUNCTIONAL_STATE(NewState));
1829                     ; 787   if (NewState != DISABLE)
1831  0000 4d            	tnz	a
1832  0001 2705          	jreq	L757
1833                     ; 789     TIM5->BKR |= TIM_BKR_MOE ;
1835  0003 721e5315      	bset	21269,#7
1838  0007 81            	ret	
1839  0008               L757:
1840                     ; 793     TIM5->BKR &= (uint8_t)(~TIM_BKR_MOE) ;
1842  0008 721f5315      	bres	21269,#7
1843                     ; 795 }
1846  000c 81            	ret	
1911                     ; 815 void TIM5_SelectOCxM(TIM5_Channel_TypeDef TIM5_Channel,
1911                     ; 816                      TIM5_OCMode_TypeDef TIM5_OCMode)
1911                     ; 817 {
1912                     .text:	section	.text,new
1913  0000               _TIM5_SelectOCxM:
1915  0000 89            	pushw	x
1916       00000000      OFST:	set	0
1919                     ; 819   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
1921                     ; 820   assert_param(IS_TIM5_OCM(TIM5_OCMode));
1923                     ; 822   if (TIM5_Channel == TIM5_Channel_1)
1925  0001 9e            	ld	a,xh
1926  0002 4d            	tnz	a
1927  0003 2615          	jrne	L5101
1928                     ; 825     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E);
1930  0005 7211530b      	bres	21259,#0
1931                     ; 828     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCM);
1933  0009 c65309        	ld	a,21257
1934  000c a48f          	and	a,#143
1935  000e c75309        	ld	21257,a
1936                     ; 831     TIM5->CCMR1 |= (uint8_t)TIM5_OCMode;
1938  0011 9f            	ld	a,xl
1939  0012 ca5309        	or	a,21257
1940  0015 c75309        	ld	21257,a
1942  0018 2014          	jra	L7101
1943  001a               L5101:
1944                     ; 836     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E);
1946  001a 7219530b      	bres	21259,#4
1947                     ; 839     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCM);
1949  001e c6530a        	ld	a,21258
1950  0021 a48f          	and	a,#143
1951  0023 c7530a        	ld	21258,a
1952                     ; 842     TIM5->CCMR2 |= (uint8_t)TIM5_OCMode;
1954  0026 c6530a        	ld	a,21258
1955  0029 1a02          	or	a,(OFST+2,sp)
1956  002b c7530a        	ld	21258,a
1957  002e               L7101:
1958                     ; 844 }
1961  002e 85            	popw	x
1962  002f 81            	ret	
1994                     ; 852 void TIM5_SetCompare1(uint16_t Compare)
1994                     ; 853 {
1995                     .text:	section	.text,new
1996  0000               _TIM5_SetCompare1:
2000                     ; 855   TIM5->CCR1H = (uint8_t)(Compare >> 8);
2002  0000 9e            	ld	a,xh
2003  0001 c75311        	ld	21265,a
2004                     ; 856   TIM5->CCR1L = (uint8_t)(Compare);
2006  0004 9f            	ld	a,xl
2007  0005 c75312        	ld	21266,a
2008                     ; 857 }
2011  0008 81            	ret	
2043                     ; 865 void TIM5_SetCompare2(uint16_t Compare)
2043                     ; 866 {
2044                     .text:	section	.text,new
2045  0000               _TIM5_SetCompare2:
2049                     ; 868   TIM5->CCR2H = (uint8_t)(Compare >> 8);
2051  0000 9e            	ld	a,xh
2052  0001 c75313        	ld	21267,a
2053                     ; 869   TIM5->CCR2L = (uint8_t)(Compare);
2055  0004 9f            	ld	a,xl
2056  0005 c75314        	ld	21268,a
2057                     ; 870 }
2060  0008 81            	ret	
2125                     ; 880 void TIM5_ForcedOC1Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2125                     ; 881 {
2126                     .text:	section	.text,new
2127  0000               _TIM5_ForcedOC1Config:
2129  0000 88            	push	a
2130  0001 88            	push	a
2131       00000001      OFST:	set	1
2134                     ; 882   uint8_t tmpccmr1 = 0;
2136                     ; 885   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2138                     ; 887   tmpccmr1 = TIM5->CCMR1;
2140  0002 c65309        	ld	a,21257
2141                     ; 890   tmpccmr1 &= (uint8_t)(~TIM_CCMR_OCM);
2143  0005 a48f          	and	a,#143
2144                     ; 893   tmpccmr1 |= (uint8_t)TIM5_ForcedAction;
2146  0007 1a02          	or	a,(OFST+1,sp)
2147                     ; 895   TIM5->CCMR1 = tmpccmr1;
2149  0009 c75309        	ld	21257,a
2150                     ; 896 }
2153  000c 85            	popw	x
2154  000d 81            	ret	
2197                     ; 906 void TIM5_ForcedOC2Config(TIM5_ForcedAction_TypeDef TIM5_ForcedAction)
2197                     ; 907 {
2198                     .text:	section	.text,new
2199  0000               _TIM5_ForcedOC2Config:
2201  0000 88            	push	a
2202  0001 88            	push	a
2203       00000001      OFST:	set	1
2206                     ; 908   uint8_t tmpccmr2 = 0;
2208                     ; 911   assert_param(IS_TIM5_FORCED_ACTION(TIM5_ForcedAction));
2210                     ; 913   tmpccmr2 = TIM5->CCMR2;
2212  0002 c6530a        	ld	a,21258
2213                     ; 916   tmpccmr2 &= (uint8_t)(~TIM_CCMR_OCM);
2215  0005 a48f          	and	a,#143
2216                     ; 919   tmpccmr2 |= (uint8_t)TIM5_ForcedAction;
2218  0007 1a02          	or	a,(OFST+1,sp)
2219                     ; 921   TIM5->CCMR2 = tmpccmr2;
2221  0009 c7530a        	ld	21258,a
2222                     ; 922 }
2225  000c 85            	popw	x
2226  000d 81            	ret	
2262                     ; 930 void TIM5_OC1PreloadConfig(FunctionalState NewState)
2262                     ; 931 {
2263                     .text:	section	.text,new
2264  0000               _TIM5_OC1PreloadConfig:
2268                     ; 933   assert_param(IS_FUNCTIONAL_STATE(NewState));
2270                     ; 936   if (NewState != DISABLE)
2272  0000 4d            	tnz	a
2273  0001 2705          	jreq	L7311
2274                     ; 938     TIM5->CCMR1 |= TIM_CCMR_OCxPE ;
2276  0003 72165309      	bset	21257,#3
2279  0007 81            	ret	
2280  0008               L7311:
2281                     ; 942     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2283  0008 72175309      	bres	21257,#3
2284                     ; 944 }
2287  000c 81            	ret	
2323                     ; 952 void TIM5_OC2PreloadConfig(FunctionalState NewState)
2323                     ; 953 {
2324                     .text:	section	.text,new
2325  0000               _TIM5_OC2PreloadConfig:
2329                     ; 955   assert_param(IS_FUNCTIONAL_STATE(NewState));
2331                     ; 958   if (NewState != DISABLE)
2333  0000 4d            	tnz	a
2334  0001 2705          	jreq	L1611
2335                     ; 960     TIM5->CCMR2 |= TIM_CCMR_OCxPE ;
2337  0003 7216530a      	bset	21258,#3
2340  0007 81            	ret	
2341  0008               L1611:
2342                     ; 964     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxPE) ;
2344  0008 7217530a      	bres	21258,#3
2345                     ; 966 }
2348  000c 81            	ret	
2383                     ; 974 void TIM5_OC1FastConfig(FunctionalState NewState)
2383                     ; 975 {
2384                     .text:	section	.text,new
2385  0000               _TIM5_OC1FastConfig:
2389                     ; 977   assert_param(IS_FUNCTIONAL_STATE(NewState));
2391                     ; 980   if (NewState != DISABLE)
2393  0000 4d            	tnz	a
2394  0001 2705          	jreq	L3021
2395                     ; 982     TIM5->CCMR1 |= TIM_CCMR_OCxFE ;
2397  0003 72145309      	bset	21257,#2
2400  0007 81            	ret	
2401  0008               L3021:
2402                     ; 986     TIM5->CCMR1 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2404  0008 72155309      	bres	21257,#2
2405                     ; 988 }
2408  000c 81            	ret	
2443                     ; 997 void TIM5_OC2FastConfig(FunctionalState NewState)
2443                     ; 998 {
2444                     .text:	section	.text,new
2445  0000               _TIM5_OC2FastConfig:
2449                     ; 1000   assert_param(IS_FUNCTIONAL_STATE(NewState));
2451                     ; 1003   if (NewState != DISABLE)
2453  0000 4d            	tnz	a
2454  0001 2705          	jreq	L5221
2455                     ; 1005     TIM5->CCMR2 |= TIM_CCMR_OCxFE ;
2457  0003 7214530a      	bset	21258,#2
2460  0007 81            	ret	
2461  0008               L5221:
2462                     ; 1009     TIM5->CCMR2 &= (uint8_t)(~TIM_CCMR_OCxFE) ;
2464  0008 7215530a      	bres	21258,#2
2465                     ; 1011 }
2468  000c 81            	ret	
2504                     ; 1021 void TIM5_OC1PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2504                     ; 1022 {
2505                     .text:	section	.text,new
2506  0000               _TIM5_OC1PolarityConfig:
2510                     ; 1024   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2512                     ; 1027   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2514  0000 4a            	dec	a
2515  0001 2605          	jrne	L7421
2516                     ; 1029     TIM5->CCER1 |= TIM_CCER1_CC1P ;
2518  0003 7212530b      	bset	21259,#1
2521  0007 81            	ret	
2522  0008               L7421:
2523                     ; 1033     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
2525  0008 7213530b      	bres	21259,#1
2526                     ; 1035 }
2529  000c 81            	ret	
2565                     ; 1045 void TIM5_OC2PolarityConfig(TIM5_OCPolarity_TypeDef TIM5_OCPolarity)
2565                     ; 1046 {
2566                     .text:	section	.text,new
2567  0000               _TIM5_OC2PolarityConfig:
2571                     ; 1048   assert_param(IS_TIM5_OC_POLARITY(TIM5_OCPolarity));
2573                     ; 1051   if (TIM5_OCPolarity == TIM5_OCPolarity_Low)
2575  0000 4a            	dec	a
2576  0001 2605          	jrne	L1721
2577                     ; 1053     TIM5->CCER1 |= TIM_CCER1_CC2P ;
2579  0003 721a530b      	bset	21259,#5
2582  0007 81            	ret	
2583  0008               L1721:
2584                     ; 1057     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
2586  0008 721b530b      	bres	21259,#5
2587                     ; 1059 }
2590  000c 81            	ret	
2635                     ; 1071 void TIM5_CCxCmd(TIM5_Channel_TypeDef TIM5_Channel,
2635                     ; 1072                  FunctionalState NewState)
2635                     ; 1073 {
2636                     .text:	section	.text,new
2637  0000               _TIM5_CCxCmd:
2639  0000 89            	pushw	x
2640       00000000      OFST:	set	0
2643                     ; 1075   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2645                     ; 1076   assert_param(IS_FUNCTIONAL_STATE(NewState));
2647                     ; 1078   if (TIM5_Channel == TIM5_Channel_1)
2649  0001 9e            	ld	a,xh
2650  0002 4d            	tnz	a
2651  0003 2610          	jrne	L7131
2652                     ; 1081     if (NewState != DISABLE)
2654  0005 9f            	ld	a,xl
2655  0006 4d            	tnz	a
2656  0007 2706          	jreq	L1231
2657                     ; 1083       TIM5->CCER1 |= TIM_CCER1_CC1E ;
2659  0009 7210530b      	bset	21259,#0
2661  000d 2014          	jra	L5231
2662  000f               L1231:
2663                     ; 1087       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1E) ;
2665  000f 7211530b      	bres	21259,#0
2666  0013 200e          	jra	L5231
2667  0015               L7131:
2668                     ; 1094     if (NewState != DISABLE)
2670  0015 7b02          	ld	a,(OFST+2,sp)
2671  0017 2706          	jreq	L7231
2672                     ; 1096       TIM5->CCER1 |= TIM_CCER1_CC2E;
2674  0019 7218530b      	bset	21259,#4
2676  001d 2004          	jra	L5231
2677  001f               L7231:
2678                     ; 1100       TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2E) ;
2680  001f 7219530b      	bres	21259,#4
2681  0023               L5231:
2682                     ; 1103 }
2685  0023 85            	popw	x
2686  0024 81            	ret	
2848                     ; 1181 void TIM5_ICInit(TIM5_Channel_TypeDef TIM5_Channel,
2848                     ; 1182                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
2848                     ; 1183                  TIM5_ICSelection_TypeDef TIM5_ICSelection,
2848                     ; 1184                  TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
2848                     ; 1185                  uint8_t TIM5_ICFilter)
2848                     ; 1186 {
2849                     .text:	section	.text,new
2850  0000               _TIM5_ICInit:
2852  0000 89            	pushw	x
2853       00000000      OFST:	set	0
2856                     ; 1188   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
2858                     ; 1190   if (TIM5_Channel == TIM5_Channel_1)
2860  0001 9e            	ld	a,xh
2861  0002 4d            	tnz	a
2862  0003 2614          	jrne	L5241
2863                     ; 1193     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2865  0005 7b07          	ld	a,(OFST+7,sp)
2866  0007 88            	push	a
2867  0008 7b06          	ld	a,(OFST+6,sp)
2868  000a 97            	ld	xl,a
2869  000b 7b03          	ld	a,(OFST+3,sp)
2870  000d 95            	ld	xh,a
2871  000e cd0000        	call	L3_TI1_Config
2873  0011 84            	pop	a
2874                     ; 1196     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
2876  0012 7b06          	ld	a,(OFST+6,sp)
2877  0014 cd0000        	call	_TIM5_SetIC1Prescaler
2880  0017 2012          	jra	L7241
2881  0019               L5241:
2882                     ; 1201     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection, TIM5_ICFilter);
2884  0019 7b07          	ld	a,(OFST+7,sp)
2885  001b 88            	push	a
2886  001c 7b06          	ld	a,(OFST+6,sp)
2887  001e 97            	ld	xl,a
2888  001f 7b03          	ld	a,(OFST+3,sp)
2889  0021 95            	ld	xh,a
2890  0022 cd0000        	call	L5_TI2_Config
2892  0025 84            	pop	a
2893                     ; 1204     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
2895  0026 7b06          	ld	a,(OFST+6,sp)
2896  0028 cd0000        	call	_TIM5_SetIC2Prescaler
2898  002b               L7241:
2899                     ; 1206 }
2902  002b 85            	popw	x
2903  002c 81            	ret	
2993                     ; 1232 void TIM5_PWMIConfig(TIM5_Channel_TypeDef TIM5_Channel,
2993                     ; 1233                      TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
2993                     ; 1234                      TIM5_ICSelection_TypeDef TIM5_ICSelection,
2993                     ; 1235                      TIM5_ICPSC_TypeDef TIM5_ICPrescaler,
2993                     ; 1236                      uint8_t TIM5_ICFilter)
2993                     ; 1237 {
2994                     .text:	section	.text,new
2995  0000               _TIM5_PWMIConfig:
2997  0000 89            	pushw	x
2998  0001 89            	pushw	x
2999       00000002      OFST:	set	2
3002                     ; 1238   uint8_t icpolarity = TIM5_ICPolarity_Rising;
3004                     ; 1239   uint8_t icselection = TIM5_ICSelection_DirectTI;
3006                     ; 1242   assert_param(IS_TIM5_CHANNEL(TIM5_Channel));
3008                     ; 1245   if (TIM5_ICPolarity == TIM5_ICPolarity_Rising)
3010  0002 9f            	ld	a,xl
3011  0003 4d            	tnz	a
3012  0004 2605          	jrne	L1741
3013                     ; 1247     icpolarity = TIM5_ICPolarity_Falling;
3015  0006 4c            	inc	a
3016  0007 6b01          	ld	(OFST-1,sp),a
3018  0009 2002          	jra	L3741
3019  000b               L1741:
3020                     ; 1251     icpolarity = TIM5_ICPolarity_Rising;
3022  000b 0f01          	clr	(OFST-1,sp)
3023  000d               L3741:
3024                     ; 1255   if (TIM5_ICSelection == TIM5_ICSelection_DirectTI)
3026  000d 7b07          	ld	a,(OFST+5,sp)
3027  000f 4a            	dec	a
3028  0010 2604          	jrne	L5741
3029                     ; 1257     icselection = TIM5_ICSelection_IndirectTI;
3031  0012 a602          	ld	a,#2
3033  0014 2002          	jra	L7741
3034  0016               L5741:
3035                     ; 1261     icselection = TIM5_ICSelection_DirectTI;
3037  0016 a601          	ld	a,#1
3038  0018               L7741:
3039  0018 6b02          	ld	(OFST+0,sp),a
3040                     ; 1264   if (TIM5_Channel == TIM5_Channel_1)
3042  001a 7b03          	ld	a,(OFST+1,sp)
3043  001c 2626          	jrne	L1051
3044                     ; 1267     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection,
3044                     ; 1268                TIM5_ICFilter);
3046  001e 7b09          	ld	a,(OFST+7,sp)
3047  0020 88            	push	a
3048  0021 7b08          	ld	a,(OFST+6,sp)
3049  0023 97            	ld	xl,a
3050  0024 7b05          	ld	a,(OFST+3,sp)
3051  0026 95            	ld	xh,a
3052  0027 cd0000        	call	L3_TI1_Config
3054  002a 84            	pop	a
3055                     ; 1271     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3057  002b 7b08          	ld	a,(OFST+6,sp)
3058  002d cd0000        	call	_TIM5_SetIC1Prescaler
3060                     ; 1274     TI2_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3062  0030 7b09          	ld	a,(OFST+7,sp)
3063  0032 88            	push	a
3064  0033 7b03          	ld	a,(OFST+1,sp)
3065  0035 97            	ld	xl,a
3066  0036 7b02          	ld	a,(OFST+0,sp)
3067  0038 95            	ld	xh,a
3068  0039 cd0000        	call	L5_TI2_Config
3070  003c 84            	pop	a
3071                     ; 1277     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3073  003d 7b08          	ld	a,(OFST+6,sp)
3074  003f cd0000        	call	_TIM5_SetIC2Prescaler
3077  0042 2024          	jra	L3051
3078  0044               L1051:
3079                     ; 1282     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection,
3079                     ; 1283                TIM5_ICFilter);
3081  0044 7b09          	ld	a,(OFST+7,sp)
3082  0046 88            	push	a
3083  0047 7b08          	ld	a,(OFST+6,sp)
3084  0049 97            	ld	xl,a
3085  004a 7b05          	ld	a,(OFST+3,sp)
3086  004c 95            	ld	xh,a
3087  004d cd0000        	call	L5_TI2_Config
3089  0050 84            	pop	a
3090                     ; 1286     TIM5_SetIC2Prescaler(TIM5_ICPrescaler);
3092  0051 7b08          	ld	a,(OFST+6,sp)
3093  0053 cd0000        	call	_TIM5_SetIC2Prescaler
3095                     ; 1289     TI1_Config((TIM5_ICPolarity_TypeDef)icpolarity, (TIM5_ICSelection_TypeDef)icselection, TIM5_ICFilter);
3097  0056 7b09          	ld	a,(OFST+7,sp)
3098  0058 88            	push	a
3099  0059 7b03          	ld	a,(OFST+1,sp)
3100  005b 97            	ld	xl,a
3101  005c 7b02          	ld	a,(OFST+0,sp)
3102  005e 95            	ld	xh,a
3103  005f cd0000        	call	L3_TI1_Config
3105  0062 84            	pop	a
3106                     ; 1292     TIM5_SetIC1Prescaler(TIM5_ICPrescaler);
3108  0063 7b08          	ld	a,(OFST+6,sp)
3109  0065 cd0000        	call	_TIM5_SetIC1Prescaler
3111  0068               L3051:
3112                     ; 1294 }
3115  0068 5b04          	addw	sp,#4
3116  006a 81            	ret	
3162                     ; 1301 uint16_t TIM5_GetCapture1(void)
3162                     ; 1302 {
3163                     .text:	section	.text,new
3164  0000               _TIM5_GetCapture1:
3166  0000 5204          	subw	sp,#4
3167       00000004      OFST:	set	4
3170                     ; 1303   uint16_t tmpccr1 = 0;
3172                     ; 1306   tmpccr1h = TIM5->CCR1H;
3174  0002 c65311        	ld	a,21265
3175  0005 6b02          	ld	(OFST-2,sp),a
3176                     ; 1307   tmpccr1l = TIM5->CCR1L;
3178  0007 c65312        	ld	a,21266
3179  000a 6b01          	ld	(OFST-3,sp),a
3180                     ; 1309   tmpccr1 = (uint16_t)(tmpccr1l);
3182  000c 5f            	clrw	x
3183  000d 97            	ld	xl,a
3184  000e 1f03          	ldw	(OFST-1,sp),x
3185                     ; 1310   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3187  0010 5f            	clrw	x
3188  0011 7b02          	ld	a,(OFST-2,sp)
3189  0013 97            	ld	xl,a
3190  0014 7b04          	ld	a,(OFST+0,sp)
3191  0016 01            	rrwa	x,a
3192  0017 1a03          	or	a,(OFST-1,sp)
3193  0019 01            	rrwa	x,a
3194                     ; 1312   return ((uint16_t)tmpccr1);
3198  001a 5b04          	addw	sp,#4
3199  001c 81            	ret	
3245                     ; 1320 uint16_t TIM5_GetCapture2(void)
3245                     ; 1321 {
3246                     .text:	section	.text,new
3247  0000               _TIM5_GetCapture2:
3249  0000 5204          	subw	sp,#4
3250       00000004      OFST:	set	4
3253                     ; 1322   uint16_t tmpccr2 = 0;
3255                     ; 1325   tmpccr2h = TIM5->CCR2H;
3257  0002 c65313        	ld	a,21267
3258  0005 6b02          	ld	(OFST-2,sp),a
3259                     ; 1326   tmpccr2l = TIM5->CCR2L;
3261  0007 c65314        	ld	a,21268
3262  000a 6b01          	ld	(OFST-3,sp),a
3263                     ; 1328   tmpccr2 = (uint16_t)(tmpccr2l);
3265  000c 5f            	clrw	x
3266  000d 97            	ld	xl,a
3267  000e 1f03          	ldw	(OFST-1,sp),x
3268                     ; 1329   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3270  0010 5f            	clrw	x
3271  0011 7b02          	ld	a,(OFST-2,sp)
3272  0013 97            	ld	xl,a
3273  0014 7b04          	ld	a,(OFST+0,sp)
3274  0016 01            	rrwa	x,a
3275  0017 1a03          	or	a,(OFST-1,sp)
3276  0019 01            	rrwa	x,a
3277                     ; 1331   return ((uint16_t)tmpccr2);
3281  001a 5b04          	addw	sp,#4
3282  001c 81            	ret	
3325                     ; 1344 void TIM5_SetIC1Prescaler(TIM5_ICPSC_TypeDef TIM5_IC1Prescaler)
3325                     ; 1345 {
3326                     .text:	section	.text,new
3327  0000               _TIM5_SetIC1Prescaler:
3329  0000 88            	push	a
3330  0001 88            	push	a
3331       00000001      OFST:	set	1
3334                     ; 1346   uint8_t tmpccmr1 = 0;
3336                     ; 1349   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC1Prescaler));
3338                     ; 1351   tmpccmr1 = TIM5->CCMR1;
3340  0002 c65309        	ld	a,21257
3341                     ; 1354   tmpccmr1 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3343  0005 a4f3          	and	a,#243
3344                     ; 1357   tmpccmr1 |= (uint8_t)TIM5_IC1Prescaler;
3346  0007 1a02          	or	a,(OFST+1,sp)
3347                     ; 1359   TIM5->CCMR1 = tmpccmr1;
3349  0009 c75309        	ld	21257,a
3350                     ; 1360 }
3353  000c 85            	popw	x
3354  000d 81            	ret	
3397                     ; 1372 void TIM5_SetIC2Prescaler(TIM5_ICPSC_TypeDef TIM5_IC2Prescaler)
3397                     ; 1373 {
3398                     .text:	section	.text,new
3399  0000               _TIM5_SetIC2Prescaler:
3401  0000 88            	push	a
3402  0001 88            	push	a
3403       00000001      OFST:	set	1
3406                     ; 1374   uint8_t tmpccmr2 = 0;
3408                     ; 1377   assert_param(IS_TIM5_IC_PRESCALER(TIM5_IC2Prescaler));
3410                     ; 1379   tmpccmr2 = TIM5->CCMR2;
3412  0002 c6530a        	ld	a,21258
3413                     ; 1382   tmpccmr2 &= (uint8_t)(~TIM_CCMR_ICxPSC);
3415  0005 a4f3          	and	a,#243
3416                     ; 1385   tmpccmr2 |= (uint8_t)TIM5_IC2Prescaler;
3418  0007 1a02          	or	a,(OFST+1,sp)
3419                     ; 1387   TIM5->CCMR2 = tmpccmr2;
3421  0009 c7530a        	ld	21258,a
3422                     ; 1388 }
3425  000c 85            	popw	x
3426  000d 81            	ret	
3512                     ; 1419 void TIM5_ITConfig(TIM5_IT_TypeDef TIM5_IT, FunctionalState NewState)
3512                     ; 1420 {
3513                     .text:	section	.text,new
3514  0000               _TIM5_ITConfig:
3516  0000 89            	pushw	x
3517       00000000      OFST:	set	0
3520                     ; 1422   assert_param(IS_TIM5_IT(TIM5_IT));
3522                     ; 1423   assert_param(IS_FUNCTIONAL_STATE(NewState));
3524                     ; 1425   if (NewState != DISABLE)
3526  0001 9f            	ld	a,xl
3527  0002 4d            	tnz	a
3528  0003 2706          	jreq	L5461
3529                     ; 1428     TIM5->IER |= (uint8_t)TIM5_IT;
3531  0005 9e            	ld	a,xh
3532  0006 ca5305        	or	a,21253
3534  0009 2006          	jra	L7461
3535  000b               L5461:
3536                     ; 1433     TIM5->IER &= (uint8_t)(~(uint8_t)TIM5_IT);
3538  000b 7b01          	ld	a,(OFST+1,sp)
3539  000d 43            	cpl	a
3540  000e c45305        	and	a,21253
3541  0011               L7461:
3542  0011 c75305        	ld	21253,a
3543                     ; 1435 }
3546  0014 85            	popw	x
3547  0015 81            	ret	
3628                     ; 1448 void TIM5_GenerateEvent(TIM5_EventSource_TypeDef TIM5_EventSource)
3628                     ; 1449 {
3629                     .text:	section	.text,new
3630  0000               _TIM5_GenerateEvent:
3634                     ; 1451   assert_param(IS_TIM5_EVENT_SOURCE((uint8_t)TIM5_EventSource));
3636                     ; 1454   TIM5->EGR |= (uint8_t)TIM5_EventSource;
3638  0000 ca5308        	or	a,21256
3639  0003 c75308        	ld	21256,a
3640                     ; 1455 }
3643  0006 81            	ret	
3778                     ; 1470 FlagStatus TIM5_GetFlagStatus(TIM5_FLAG_TypeDef TIM5_FLAG)
3778                     ; 1471 {
3779                     .text:	section	.text,new
3780  0000               _TIM5_GetFlagStatus:
3782  0000 89            	pushw	x
3783  0001 89            	pushw	x
3784       00000002      OFST:	set	2
3787                     ; 1472   FlagStatus bitstatus = RESET;
3789                     ; 1473   uint8_t tim5_flag_l = 0, tim5_flag_h = 0;
3793                     ; 1476   assert_param(IS_TIM5_GET_FLAG(TIM5_FLAG));
3795                     ; 1478   tim5_flag_l = (uint8_t)(TIM5->SR1 & (uint8_t)(TIM5_FLAG));
3797  0002 9f            	ld	a,xl
3798  0003 c45306        	and	a,21254
3799  0006 6b01          	ld	(OFST-1,sp),a
3800                     ; 1479   tim5_flag_h = (uint8_t)(TIM5->SR2 & (uint8_t)((uint16_t)TIM5_FLAG >> 8));
3802  0008 c65307        	ld	a,21255
3803  000b 1403          	and	a,(OFST+1,sp)
3804  000d 6b02          	ld	(OFST+0,sp),a
3805                     ; 1481   if ((uint8_t)(tim5_flag_l | tim5_flag_h) != 0)
3807  000f 1a01          	or	a,(OFST-1,sp)
3808  0011 2702          	jreq	L5671
3809                     ; 1483     bitstatus = SET;
3811  0013 a601          	ld	a,#1
3813  0015               L5671:
3814                     ; 1487     bitstatus = RESET;
3816                     ; 1489   return ((FlagStatus)bitstatus);
3820  0015 5b04          	addw	sp,#4
3821  0017 81            	ret	
3856                     ; 1503 void TIM5_ClearFlag(TIM5_FLAG_TypeDef TIM5_FLAG)
3856                     ; 1504 {
3857                     .text:	section	.text,new
3858  0000               _TIM5_ClearFlag:
3860  0000 89            	pushw	x
3861       00000000      OFST:	set	0
3864                     ; 1506   assert_param(IS_TIM5_CLEAR_FLAG((uint16_t)TIM5_FLAG));
3866                     ; 1508   TIM5->SR1 = (uint8_t)(~(uint8_t)(TIM5_FLAG));
3868  0001 9f            	ld	a,xl
3869  0002 43            	cpl	a
3870  0003 c75306        	ld	21254,a
3871                     ; 1509   TIM5->SR2 = (uint8_t)(~(uint8_t)((uint16_t)TIM5_FLAG >> 8));
3873  0006 7b01          	ld	a,(OFST+1,sp)
3874  0008 43            	cpl	a
3875  0009 c75307        	ld	21255,a
3876                     ; 1510 }
3879  000c 85            	popw	x
3880  000d 81            	ret	
3940                     ; 1523 ITStatus TIM5_GetITStatus(TIM5_IT_TypeDef TIM5_IT)
3940                     ; 1524 {
3941                     .text:	section	.text,new
3942  0000               _TIM5_GetITStatus:
3944  0000 88            	push	a
3945  0001 89            	pushw	x
3946       00000002      OFST:	set	2
3949                     ; 1525   ITStatus bitstatus = RESET;
3951                     ; 1527   uint8_t TIM5_itStatus = 0x0, TIM5_itEnable = 0x0;
3955                     ; 1530   assert_param(IS_TIM5_GET_IT(TIM5_IT));
3957                     ; 1532   TIM5_itStatus = (uint8_t)(TIM5->SR1 & (uint8_t)TIM5_IT);
3959  0002 c45306        	and	a,21254
3960  0005 6b01          	ld	(OFST-1,sp),a
3961                     ; 1534   TIM5_itEnable = (uint8_t)(TIM5->IER & (uint8_t)TIM5_IT);
3963  0007 c65305        	ld	a,21253
3964  000a 1403          	and	a,(OFST+1,sp)
3965  000c 6b02          	ld	(OFST+0,sp),a
3966                     ; 1536   if ((TIM5_itStatus != (uint8_t)RESET ) && (TIM5_itEnable != (uint8_t)RESET))
3968  000e 7b01          	ld	a,(OFST-1,sp)
3969  0010 2708          	jreq	L5302
3971  0012 7b02          	ld	a,(OFST+0,sp)
3972  0014 2704          	jreq	L5302
3973                     ; 1538     bitstatus = (ITStatus)SET;
3975  0016 a601          	ld	a,#1
3977  0018 2001          	jra	L7302
3978  001a               L5302:
3979                     ; 1542     bitstatus = (ITStatus)RESET;
3981  001a 4f            	clr	a
3982  001b               L7302:
3983                     ; 1544   return ((ITStatus)bitstatus);
3987  001b 5b03          	addw	sp,#3
3988  001d 81            	ret	
4024                     ; 1558 void TIM5_ClearITPendingBit(TIM5_IT_TypeDef TIM5_IT)
4024                     ; 1559 {
4025                     .text:	section	.text,new
4026  0000               _TIM5_ClearITPendingBit:
4030                     ; 1561   assert_param(IS_TIM5_IT(TIM5_IT));
4032                     ; 1564   TIM5->SR1 = (uint8_t)(~(uint8_t)TIM5_IT);
4034  0000 43            	cpl	a
4035  0001 c75306        	ld	21254,a
4036                     ; 1565 }
4039  0004 81            	ret	
4112                     ; 1578 void TIM5_DMACmd( TIM5_DMASource_TypeDef TIM5_DMASource, FunctionalState NewState)
4112                     ; 1579 {
4113                     .text:	section	.text,new
4114  0000               _TIM5_DMACmd:
4116  0000 89            	pushw	x
4117       00000000      OFST:	set	0
4120                     ; 1581   assert_param(IS_FUNCTIONAL_STATE(NewState));
4122                     ; 1582   assert_param(IS_TIM5_DMA_SOURCE(TIM5_DMASource));
4124                     ; 1584   if (NewState != DISABLE)
4126  0001 9f            	ld	a,xl
4127  0002 4d            	tnz	a
4128  0003 2706          	jreq	L3112
4129                     ; 1587     TIM5->DER |= TIM5_DMASource;
4131  0005 9e            	ld	a,xh
4132  0006 ca5304        	or	a,21252
4134  0009 2006          	jra	L5112
4135  000b               L3112:
4136                     ; 1592     TIM5->DER &= (uint8_t)(~TIM5_DMASource);
4138  000b 7b01          	ld	a,(OFST+1,sp)
4139  000d 43            	cpl	a
4140  000e c45304        	and	a,21252
4141  0011               L5112:
4142  0011 c75304        	ld	21252,a
4143                     ; 1594 }
4146  0014 85            	popw	x
4147  0015 81            	ret	
4182                     ; 1602 void TIM5_SelectCCDMA(FunctionalState NewState)
4182                     ; 1603 {
4183                     .text:	section	.text,new
4184  0000               _TIM5_SelectCCDMA:
4188                     ; 1605   assert_param(IS_FUNCTIONAL_STATE(NewState));
4190                     ; 1607   if (NewState != DISABLE)
4192  0000 4d            	tnz	a
4193  0001 2705          	jreq	L5312
4194                     ; 1610     TIM5->CR2 |= TIM_CR2_CCDS;
4196  0003 72165301      	bset	21249,#3
4199  0007 81            	ret	
4200  0008               L5312:
4201                     ; 1615     TIM5->CR2 &= (uint8_t)(~TIM_CR2_CCDS);
4203  0008 72175301      	bres	21249,#3
4204                     ; 1617 }
4207  000c 81            	ret	
4231                     ; 1641 void TIM5_InternalClockConfig(void)
4231                     ; 1642 {
4232                     .text:	section	.text,new
4233  0000               _TIM5_InternalClockConfig:
4237                     ; 1644   TIM5->SMCR &=  (uint8_t)(~TIM_SMCR_SMS);
4239  0000 c65302        	ld	a,21250
4240  0003 a4f8          	and	a,#248
4241  0005 c75302        	ld	21250,a
4242                     ; 1645 }
4245  0008 81            	ret	
4332                     ; 1662 void TIM5_TIxExternalClockConfig(TIM5_TIxExternalCLK1Source_TypeDef TIM5_TIxExternalCLKSource,
4332                     ; 1663                                  TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
4332                     ; 1664                                  uint8_t ICFilter)
4332                     ; 1665 {
4333                     .text:	section	.text,new
4334  0000               _TIM5_TIxExternalClockConfig:
4336  0000 89            	pushw	x
4337       00000000      OFST:	set	0
4340                     ; 1667   assert_param(IS_TIM5_TIXCLK_SOURCE(TIM5_TIxExternalCLKSource));
4342                     ; 1668   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
4344                     ; 1669   assert_param(IS_TIM5_IC_FILTER(ICFilter));
4346                     ; 1672   if (TIM5_TIxExternalCLKSource == TIM5_TIxExternalCLK1Source_TI2)
4348  0001 9e            	ld	a,xh
4349  0002 a160          	cp	a,#96
4350  0004 260e          	jrne	L7022
4351                     ; 1674     TI2_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4353  0006 7b05          	ld	a,(OFST+5,sp)
4354  0008 88            	push	a
4355  0009 ae0001        	ldw	x,#1
4356  000c 7b03          	ld	a,(OFST+3,sp)
4357  000e 95            	ld	xh,a
4358  000f cd0000        	call	L5_TI2_Config
4361  0012 200c          	jra	L1122
4362  0014               L7022:
4363                     ; 1678     TI1_Config(TIM5_ICPolarity, TIM5_ICSelection_DirectTI, ICFilter);
4365  0014 7b05          	ld	a,(OFST+5,sp)
4366  0016 88            	push	a
4367  0017 ae0001        	ldw	x,#1
4368  001a 7b03          	ld	a,(OFST+3,sp)
4369  001c 95            	ld	xh,a
4370  001d cd0000        	call	L3_TI1_Config
4372  0020               L1122:
4373  0020 84            	pop	a
4374                     ; 1682   TIM5_SelectInputTrigger((TIM5_TRGSelection_TypeDef)TIM5_TIxExternalCLKSource);
4376  0021 7b01          	ld	a,(OFST+1,sp)
4377  0023 cd0000        	call	_TIM5_SelectInputTrigger
4379                     ; 1685   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4381  0026 c65302        	ld	a,21250
4382  0029 aa07          	or	a,#7
4383  002b c75302        	ld	21250,a
4384                     ; 1686 }
4387  002e 85            	popw	x
4388  002f 81            	ret	
4503                     ; 1704 void TIM5_ETRClockMode1Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4503                     ; 1705                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4503                     ; 1706                               uint8_t ExtTRGFilter)
4503                     ; 1707 {
4504                     .text:	section	.text,new
4505  0000               _TIM5_ETRClockMode1Config:
4507  0000 89            	pushw	x
4508       00000000      OFST:	set	0
4511                     ; 1709   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4513  0001 7b05          	ld	a,(OFST+5,sp)
4514  0003 88            	push	a
4515  0004 7b02          	ld	a,(OFST+2,sp)
4516  0006 95            	ld	xh,a
4517  0007 cd0000        	call	_TIM5_ETRConfig
4519  000a 84            	pop	a
4520                     ; 1712   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_SMS);
4522  000b c65302        	ld	a,21250
4523  000e a4f8          	and	a,#248
4524  0010 c75302        	ld	21250,a
4525                     ; 1713   TIM5->SMCR |= (uint8_t)(TIM5_SlaveMode_External1);
4527  0013 c65302        	ld	a,21250
4528  0016 aa07          	or	a,#7
4529  0018 c75302        	ld	21250,a
4530                     ; 1716   TIM5->SMCR &= (uint8_t)(~TIM_SMCR_TS);
4532  001b c65302        	ld	a,21250
4533  001e a48f          	and	a,#143
4534  0020 c75302        	ld	21250,a
4535                     ; 1717   TIM5->SMCR |= (uint8_t)((TIM5_TRGSelection_TypeDef)TIM5_TRGSelection_ETRF);
4537  0023 c65302        	ld	a,21250
4538  0026 aa70          	or	a,#112
4539  0028 c75302        	ld	21250,a
4540                     ; 1718 }
4543  002b 85            	popw	x
4544  002c 81            	ret	
4600                     ; 1736 void TIM5_ETRClockMode2Config(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
4600                     ; 1737                               TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
4600                     ; 1738                               uint8_t ExtTRGFilter)
4600                     ; 1739 {
4601                     .text:	section	.text,new
4602  0000               _TIM5_ETRClockMode2Config:
4604  0000 89            	pushw	x
4605       00000000      OFST:	set	0
4608                     ; 1741   TIM5_ETRConfig(TIM5_ExtTRGPrescaler, TIM5_ExtTRGPolarity, ExtTRGFilter);
4610  0001 7b05          	ld	a,(OFST+5,sp)
4611  0003 88            	push	a
4612  0004 7b02          	ld	a,(OFST+2,sp)
4613  0006 95            	ld	xh,a
4614  0007 cd0000        	call	_TIM5_ETRConfig
4616  000a 721c5303      	bset	21251,#6
4617  000e 84            	pop	a
4618                     ; 1744   TIM5->ETR |= TIM_ETR_ECE ;
4620                     ; 1745 }
4623  000f 85            	popw	x
4624  0010 81            	ret	
4738                     ; 1796 void TIM5_SelectInputTrigger(TIM5_TRGSelection_TypeDef TIM5_InputTriggerSource)
4738                     ; 1797 {
4739                     .text:	section	.text,new
4740  0000               _TIM5_SelectInputTrigger:
4742  0000 88            	push	a
4743  0001 88            	push	a
4744       00000001      OFST:	set	1
4747                     ; 1798   uint8_t tmpsmcr = 0;
4749                     ; 1801   assert_param(IS_TIM5_TRIGGER_SELECTION(TIM5_InputTriggerSource));
4751                     ; 1803   tmpsmcr = TIM5->SMCR;
4753  0002 c65302        	ld	a,21250
4754                     ; 1806   tmpsmcr &= (uint8_t)(~TIM_SMCR_TS);
4756  0005 a48f          	and	a,#143
4757                     ; 1807   tmpsmcr |= (uint8_t)TIM5_InputTriggerSource;
4759  0007 1a02          	or	a,(OFST+1,sp)
4760                     ; 1809   TIM5->SMCR = (uint8_t)tmpsmcr;
4762  0009 c75302        	ld	21250,a
4763                     ; 1810 }
4766  000c 85            	popw	x
4767  000d 81            	ret	
4864                     ; 1824 void TIM5_SelectOutputTrigger(TIM5_TRGOSource_TypeDef TIM5_TRGOSource)
4864                     ; 1825 {
4865                     .text:	section	.text,new
4866  0000               _TIM5_SelectOutputTrigger:
4868  0000 88            	push	a
4869  0001 88            	push	a
4870       00000001      OFST:	set	1
4873                     ; 1826   uint8_t tmpcr2 = 0;
4875                     ; 1829   assert_param(IS_TIM5_TRGO_SOURCE(TIM5_TRGOSource));
4877                     ; 1831   tmpcr2 = TIM5->CR2;
4879  0002 c65301        	ld	a,21249
4880                     ; 1834   tmpcr2 &= (uint8_t)(~TIM_CR2_MMS);
4882  0005 a48f          	and	a,#143
4883                     ; 1837   tmpcr2 |=  (uint8_t)TIM5_TRGOSource;
4885  0007 1a02          	or	a,(OFST+1,sp)
4886                     ; 1839   TIM5->CR2 = tmpcr2;
4888  0009 c75301        	ld	21249,a
4889                     ; 1840 }
4892  000c 85            	popw	x
4893  000d 81            	ret	
4974                     ; 1852 void TIM5_SelectSlaveMode(TIM5_SlaveMode_TypeDef TIM5_SlaveMode)
4974                     ; 1853 {
4975                     .text:	section	.text,new
4976  0000               _TIM5_SelectSlaveMode:
4978  0000 88            	push	a
4979  0001 88            	push	a
4980       00000001      OFST:	set	1
4983                     ; 1854   uint8_t tmpsmcr = 0;
4985                     ; 1857   assert_param(IS_TIM5_SLAVE_MODE(TIM5_SlaveMode));
4987                     ; 1859   tmpsmcr = TIM5->SMCR;
4989  0002 c65302        	ld	a,21250
4990                     ; 1862   tmpsmcr &= (uint8_t)(~TIM_SMCR_SMS);
4992  0005 a4f8          	and	a,#248
4993                     ; 1865   tmpsmcr |= (uint8_t)TIM5_SlaveMode;
4995  0007 1a02          	or	a,(OFST+1,sp)
4996                     ; 1867   TIM5->SMCR = tmpsmcr;
4998  0009 c75302        	ld	21250,a
4999                     ; 1868 }
5002  000c 85            	popw	x
5003  000d 81            	ret	
5039                     ; 1876 void TIM5_SelectMasterSlaveMode(FunctionalState NewState)
5039                     ; 1877 {
5040                     .text:	section	.text,new
5041  0000               _TIM5_SelectMasterSlaveMode:
5045                     ; 1879   assert_param(IS_FUNCTIONAL_STATE(NewState));
5047                     ; 1882   if (NewState != DISABLE)
5049  0000 4d            	tnz	a
5050  0001 2705          	jreq	L5642
5051                     ; 1884     TIM5->SMCR |= TIM_SMCR_MSM;
5053  0003 721e5302      	bset	21250,#7
5056  0007 81            	ret	
5057  0008               L5642:
5058                     ; 1888     TIM5->SMCR &= (uint8_t)(~TIM_SMCR_MSM);
5060  0008 721f5302      	bres	21250,#7
5061                     ; 1890 }
5064  000c 81            	ret	
5118                     ; 1908 void TIM5_ETRConfig(TIM5_ExtTRGPSC_TypeDef TIM5_ExtTRGPrescaler,
5118                     ; 1909                     TIM5_ExtTRGPolarity_TypeDef TIM5_ExtTRGPolarity,
5118                     ; 1910                     uint8_t ExtTRGFilter)
5118                     ; 1911 {
5119                     .text:	section	.text,new
5120  0000               _TIM5_ETRConfig:
5122  0000 89            	pushw	x
5123       00000000      OFST:	set	0
5126                     ; 1913   assert_param(IS_TIM5_EXT_PRESCALER(TIM5_ExtTRGPrescaler));
5128                     ; 1914   assert_param(IS_TIM5_EXT_POLARITY(TIM5_ExtTRGPolarity));
5130                     ; 1915   assert_param(IS_TIM5_EXT_FILTER(ExtTRGFilter));
5132                     ; 1918   TIM5->ETR |= (uint8_t)((uint8_t)((uint8_t)TIM5_ExtTRGPrescaler | (uint8_t)TIM5_ExtTRGPolarity)
5132                     ; 1919                          | (uint8_t)ExtTRGFilter);
5134  0001 9f            	ld	a,xl
5135  0002 1a01          	or	a,(OFST+1,sp)
5136  0004 1a05          	or	a,(OFST+5,sp)
5137  0006 ca5303        	or	a,21251
5138  0009 c75303        	ld	21251,a
5139                     ; 1920 }
5142  000c 85            	popw	x
5143  000d 81            	ret	
5250                     ; 1955 void TIM5_EncoderInterfaceConfig(TIM5_EncoderMode_TypeDef TIM5_EncoderMode,
5250                     ; 1956                                  TIM5_ICPolarity_TypeDef TIM5_IC1Polarity,
5250                     ; 1957                                  TIM5_ICPolarity_TypeDef TIM5_IC2Polarity)
5250                     ; 1958 {
5251                     .text:	section	.text,new
5252  0000               _TIM5_EncoderInterfaceConfig:
5254  0000 89            	pushw	x
5255  0001 5203          	subw	sp,#3
5256       00000003      OFST:	set	3
5259                     ; 1959   uint8_t tmpsmcr = 0;
5261                     ; 1960   uint8_t tmpccmr1 = 0;
5263                     ; 1961   uint8_t tmpccmr2 = 0;
5265                     ; 1964   assert_param(IS_TIM5_ENCODER_MODE(TIM5_EncoderMode));
5267                     ; 1965   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC1Polarity));
5269                     ; 1966   assert_param(IS_TIM5_IC_POLARITY(TIM5_IC2Polarity));
5271                     ; 1968   tmpsmcr = TIM5->SMCR;
5273  0003 c65302        	ld	a,21250
5274  0006 6b01          	ld	(OFST-2,sp),a
5275                     ; 1969   tmpccmr1 = TIM5->CCMR1;
5277  0008 c65309        	ld	a,21257
5278  000b 6b02          	ld	(OFST-1,sp),a
5279                     ; 1970   tmpccmr2 = TIM5->CCMR2;
5281  000d c6530a        	ld	a,21258
5282  0010 6b03          	ld	(OFST+0,sp),a
5283                     ; 1973   tmpsmcr &= (uint8_t)(TIM_SMCR_MSM | TIM_SMCR_TS)  ;
5285  0012 7b01          	ld	a,(OFST-2,sp)
5286  0014 a4f0          	and	a,#240
5287  0016 6b01          	ld	(OFST-2,sp),a
5288                     ; 1974   tmpsmcr |= (uint8_t)TIM5_EncoderMode;
5290  0018 9e            	ld	a,xh
5291  0019 1a01          	or	a,(OFST-2,sp)
5292  001b 6b01          	ld	(OFST-2,sp),a
5293                     ; 1977   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS);
5295  001d 7b02          	ld	a,(OFST-1,sp)
5296  001f a4fc          	and	a,#252
5297  0021 6b02          	ld	(OFST-1,sp),a
5298                     ; 1978   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS);
5300  0023 7b03          	ld	a,(OFST+0,sp)
5301  0025 a4fc          	and	a,#252
5302  0027 6b03          	ld	(OFST+0,sp),a
5303                     ; 1979   tmpccmr1 |= TIM_CCMR_TIxDirect_Set;
5305  0029 7b02          	ld	a,(OFST-1,sp)
5306  002b aa01          	or	a,#1
5307  002d 6b02          	ld	(OFST-1,sp),a
5308                     ; 1980   tmpccmr2 |= TIM_CCMR_TIxDirect_Set;
5310  002f 7b03          	ld	a,(OFST+0,sp)
5311  0031 aa01          	or	a,#1
5312  0033 6b03          	ld	(OFST+0,sp),a
5313                     ; 1983   if (TIM5_IC1Polarity == TIM5_ICPolarity_Falling)
5315  0035 9f            	ld	a,xl
5316  0036 4a            	dec	a
5317  0037 2606          	jrne	L3652
5318                     ; 1985     TIM5->CCER1 |= TIM_CCER1_CC1P ;
5320  0039 7212530b      	bset	21259,#1
5322  003d 2004          	jra	L5652
5323  003f               L3652:
5324                     ; 1989     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P) ;
5326  003f 7213530b      	bres	21259,#1
5327  0043               L5652:
5328                     ; 1992   if (TIM5_IC2Polarity == TIM5_ICPolarity_Falling)
5330  0043 7b08          	ld	a,(OFST+5,sp)
5331  0045 4a            	dec	a
5332  0046 2606          	jrne	L7652
5333                     ; 1994     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5335  0048 721a530b      	bset	21259,#5
5337  004c 2004          	jra	L1752
5338  004e               L7652:
5339                     ; 1998     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5341  004e 721b530b      	bres	21259,#5
5342  0052               L1752:
5343                     ; 2001   TIM5->SMCR = tmpsmcr;
5345  0052 7b01          	ld	a,(OFST-2,sp)
5346  0054 c75302        	ld	21250,a
5347                     ; 2002   TIM5->CCMR1 = tmpccmr1;
5349  0057 7b02          	ld	a,(OFST-1,sp)
5350  0059 c75309        	ld	21257,a
5351                     ; 2003   TIM5->CCMR2 = tmpccmr2;
5353  005c 7b03          	ld	a,(OFST+0,sp)
5354  005e c7530a        	ld	21258,a
5355                     ; 2004 }
5358  0061 5b05          	addw	sp,#5
5359  0063 81            	ret	
5395                     ; 2012 void TIM5_SelectHallSensor(FunctionalState NewState)
5395                     ; 2013 {
5396                     .text:	section	.text,new
5397  0000               _TIM5_SelectHallSensor:
5401                     ; 2015   assert_param(IS_FUNCTIONAL_STATE(NewState));
5403                     ; 2018   if (NewState != DISABLE)
5405  0000 4d            	tnz	a
5406  0001 2705          	jreq	L1162
5407                     ; 2020     TIM5->CR2 |= TIM_CR2_TI1S;
5409  0003 721e5301      	bset	21249,#7
5412  0007 81            	ret	
5413  0008               L1162:
5414                     ; 2024     TIM5->CR2 &= (uint8_t)(~TIM_CR2_TI1S);
5416  0008 721f5301      	bres	21249,#7
5417                     ; 2026 }
5420  000c 81            	ret	
5486                     ; 2047 static void TI1_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity, \
5486                     ; 2048                        TIM5_ICSelection_TypeDef TIM5_ICSelection, \
5486                     ; 2049                        uint8_t TIM5_ICFilter)
5486                     ; 2050 {
5487                     .text:	section	.text,new
5488  0000               L3_TI1_Config:
5490  0000 89            	pushw	x
5491  0001 89            	pushw	x
5492       00000002      OFST:	set	2
5495                     ; 2051   uint8_t tmpccmr1 = 0;
5497                     ; 2052   uint8_t tmpicpolarity = TIM5_ICPolarity;
5499  0002 9e            	ld	a,xh
5500  0003 6b01          	ld	(OFST-1,sp),a
5501                     ; 2053   tmpccmr1 = TIM5->CCMR1;
5503  0005 c65309        	ld	a,21257
5504  0008 6b02          	ld	(OFST+0,sp),a
5505                     ; 2056   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5507                     ; 2057   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5509                     ; 2058   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5511                     ; 2061   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC1E);
5513  000a 7211530b      	bres	21259,#0
5514                     ; 2064   tmpccmr1 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5516  000e a40c          	and	a,#12
5517  0010 6b02          	ld	(OFST+0,sp),a
5518                     ; 2065   tmpccmr1 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5520  0012 7b07          	ld	a,(OFST+5,sp)
5521  0014 97            	ld	xl,a
5522  0015 a610          	ld	a,#16
5523  0017 42            	mul	x,a
5524  0018 9f            	ld	a,xl
5525  0019 1a04          	or	a,(OFST+2,sp)
5526  001b 1a02          	or	a,(OFST+0,sp)
5527  001d 6b02          	ld	(OFST+0,sp),a
5528                     ; 2067   TIM5->CCMR1 = tmpccmr1;
5530  001f c75309        	ld	21257,a
5531                     ; 2070   if (tmpicpolarity == (uint8_t)(TIM5_ICPolarity_Falling))
5533  0022 7b01          	ld	a,(OFST-1,sp)
5534  0024 4a            	dec	a
5535  0025 2606          	jrne	L5462
5536                     ; 2072     TIM5->CCER1 |= TIM_CCER1_CC1P;
5538  0027 7212530b      	bset	21259,#1
5540  002b 2004          	jra	L7462
5541  002d               L5462:
5542                     ; 2076     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC1P);
5544  002d 7213530b      	bres	21259,#1
5545  0031               L7462:
5546                     ; 2080   TIM5->CCER1 |=  TIM_CCER1_CC1E;
5548  0031 7210530b      	bset	21259,#0
5549                     ; 2081 }
5552  0035 5b04          	addw	sp,#4
5553  0037 81            	ret	
5619                     ; 2098 static void TI2_Config(TIM5_ICPolarity_TypeDef TIM5_ICPolarity,
5619                     ; 2099                        TIM5_ICSelection_TypeDef TIM5_ICSelection,
5619                     ; 2100                        uint8_t TIM5_ICFilter)
5619                     ; 2101 {
5620                     .text:	section	.text,new
5621  0000               L5_TI2_Config:
5623  0000 89            	pushw	x
5624  0001 89            	pushw	x
5625       00000002      OFST:	set	2
5628                     ; 2102   uint8_t tmpccmr2 = 0;
5630                     ; 2103   uint8_t tmpicpolarity = TIM5_ICPolarity;
5632  0002 9e            	ld	a,xh
5633  0003 6b01          	ld	(OFST-1,sp),a
5634                     ; 2106   assert_param(IS_TIM5_IC_POLARITY(TIM5_ICPolarity));
5636                     ; 2107   assert_param(IS_TIM5_IC_SELECTION(TIM5_ICSelection));
5638                     ; 2108   assert_param(IS_TIM5_IC_FILTER(TIM5_ICFilter));
5640                     ; 2110   tmpccmr2 = TIM5->CCMR2;
5642  0005 c6530a        	ld	a,21258
5643  0008 6b02          	ld	(OFST+0,sp),a
5644                     ; 2113   TIM5->CCER1 &=  (uint8_t)(~TIM_CCER1_CC2E);
5646  000a 7219530b      	bres	21259,#4
5647                     ; 2116   tmpccmr2 &= (uint8_t)(~TIM_CCMR_CCxS) & (uint8_t)(~TIM_CCMR_ICxF);
5649  000e a40c          	and	a,#12
5650  0010 6b02          	ld	(OFST+0,sp),a
5651                     ; 2117   tmpccmr2 |= (uint8_t)(((uint8_t)(TIM5_ICSelection)) | ((uint8_t)(TIM5_ICFilter << 4)));
5653  0012 7b07          	ld	a,(OFST+5,sp)
5654  0014 97            	ld	xl,a
5655  0015 a610          	ld	a,#16
5656  0017 42            	mul	x,a
5657  0018 9f            	ld	a,xl
5658  0019 1a04          	or	a,(OFST+2,sp)
5659  001b 1a02          	or	a,(OFST+0,sp)
5660  001d 6b02          	ld	(OFST+0,sp),a
5661                     ; 2119   TIM5->CCMR2 = tmpccmr2;
5663  001f c7530a        	ld	21258,a
5664                     ; 2122   if (tmpicpolarity == TIM5_ICPolarity_Falling)
5666  0022 7b01          	ld	a,(OFST-1,sp)
5667  0024 4a            	dec	a
5668  0025 2606          	jrne	L1072
5669                     ; 2124     TIM5->CCER1 |= TIM_CCER1_CC2P ;
5671  0027 721a530b      	bset	21259,#5
5673  002b 2004          	jra	L3072
5674  002d               L1072:
5675                     ; 2128     TIM5->CCER1 &= (uint8_t)(~TIM_CCER1_CC2P) ;
5677  002d 721b530b      	bres	21259,#5
5678  0031               L3072:
5679                     ; 2132   TIM5->CCER1 |=  TIM_CCER1_CC2E;
5681  0031 7218530b      	bset	21259,#4
5682                     ; 2133 }
5685  0035 5b04          	addw	sp,#4
5686  0037 81            	ret	
5699                     	xdef	_TIM5_SelectHallSensor
5700                     	xdef	_TIM5_EncoderInterfaceConfig
5701                     	xdef	_TIM5_ETRConfig
5702                     	xdef	_TIM5_SelectMasterSlaveMode
5703                     	xdef	_TIM5_SelectSlaveMode
5704                     	xdef	_TIM5_SelectOutputTrigger
5705                     	xdef	_TIM5_SelectInputTrigger
5706                     	xdef	_TIM5_ETRClockMode2Config
5707                     	xdef	_TIM5_ETRClockMode1Config
5708                     	xdef	_TIM5_TIxExternalClockConfig
5709                     	xdef	_TIM5_InternalClockConfig
5710                     	xdef	_TIM5_SelectCCDMA
5711                     	xdef	_TIM5_DMACmd
5712                     	xdef	_TIM5_ClearITPendingBit
5713                     	xdef	_TIM5_GetITStatus
5714                     	xdef	_TIM5_ClearFlag
5715                     	xdef	_TIM5_GetFlagStatus
5716                     	xdef	_TIM5_GenerateEvent
5717                     	xdef	_TIM5_ITConfig
5718                     	xdef	_TIM5_SetIC2Prescaler
5719                     	xdef	_TIM5_SetIC1Prescaler
5720                     	xdef	_TIM5_GetCapture2
5721                     	xdef	_TIM5_GetCapture1
5722                     	xdef	_TIM5_PWMIConfig
5723                     	xdef	_TIM5_ICInit
5724                     	xdef	_TIM5_CCxCmd
5725                     	xdef	_TIM5_OC2PolarityConfig
5726                     	xdef	_TIM5_OC1PolarityConfig
5727                     	xdef	_TIM5_OC2FastConfig
5728                     	xdef	_TIM5_OC1FastConfig
5729                     	xdef	_TIM5_OC2PreloadConfig
5730                     	xdef	_TIM5_OC1PreloadConfig
5731                     	xdef	_TIM5_ForcedOC2Config
5732                     	xdef	_TIM5_ForcedOC1Config
5733                     	xdef	_TIM5_SetCompare2
5734                     	xdef	_TIM5_SetCompare1
5735                     	xdef	_TIM5_SelectOCxM
5736                     	xdef	_TIM5_CtrlPWMOutputs
5737                     	xdef	_TIM5_BKRConfig
5738                     	xdef	_TIM5_OC2Init
5739                     	xdef	_TIM5_OC1Init
5740                     	xdef	_TIM5_Cmd
5741                     	xdef	_TIM5_SelectOnePulseMode
5742                     	xdef	_TIM5_ARRPreloadConfig
5743                     	xdef	_TIM5_UpdateRequestConfig
5744                     	xdef	_TIM5_UpdateDisableConfig
5745                     	xdef	_TIM5_GetPrescaler
5746                     	xdef	_TIM5_GetCounter
5747                     	xdef	_TIM5_SetAutoreload
5748                     	xdef	_TIM5_SetCounter
5749                     	xdef	_TIM5_CounterModeConfig
5750                     	xdef	_TIM5_PrescalerConfig
5751                     	xdef	_TIM5_TimeBaseInit
5752                     	xdef	_TIM5_DeInit
5771                     	end