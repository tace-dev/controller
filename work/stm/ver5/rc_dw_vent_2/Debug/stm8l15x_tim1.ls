   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 178 void TIM1_DeInit(void)
  50                     ; 179 {
  51                     .text:	section	.text,new
  52  0000               f_TIM1_DeInit:
  56                     ; 180   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  58  0000 725f52b0      	clr	21168
  59                     ; 181   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  61  0004 725f52b1      	clr	21169
  62                     ; 182   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  64  0008 725f52b2      	clr	21170
  65                     ; 183   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  67  000c 725f52b3      	clr	21171
  68                     ; 184   TIM1->IER  = TIM1_IER_RESET_VALUE;
  70  0010 725f52b5      	clr	21173
  71                     ; 187   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  73  0014 725f52bd      	clr	21181
  74                     ; 188   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  76  0018 725f52be      	clr	21182
  77                     ; 190   TIM1->CCMR1 = 0x01;
  79  001c 350152b9      	mov	21177,#1
  80                     ; 191   TIM1->CCMR2 = 0x01;
  82  0020 350152ba      	mov	21178,#1
  83                     ; 192   TIM1->CCMR3 = 0x01;
  85  0024 350152bb      	mov	21179,#1
  86                     ; 193   TIM1->CCMR4 = 0x01;
  88  0028 350152bc      	mov	21180,#1
  89                     ; 195   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  91  002c 725f52bd      	clr	21181
  92                     ; 196   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  94  0030 725f52be      	clr	21182
  95                     ; 197   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  97  0034 725f52b9      	clr	21177
  98                     ; 198   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 100  0038 725f52ba      	clr	21178
 101                     ; 199   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 103  003c 725f52bb      	clr	21179
 104                     ; 200   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 106  0040 725f52bc      	clr	21180
 107                     ; 201   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 109  0044 725f52bf      	clr	21183
 110                     ; 202   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 112  0048 725f52c0      	clr	21184
 113                     ; 203   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 115  004c 725f52c1      	clr	21185
 116                     ; 204   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 118  0050 725f52c2      	clr	21186
 119                     ; 205   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 121  0054 35ff52c3      	mov	21187,#255
 122                     ; 206   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 124  0058 35ff52c4      	mov	21188,#255
 125                     ; 207   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 127  005c 725f52c6      	clr	21190
 128                     ; 208   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 130  0060 725f52c7      	clr	21191
 131                     ; 209   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 133  0064 725f52c8      	clr	21192
 134                     ; 210   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 136  0068 725f52c9      	clr	21193
 137                     ; 211   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 139  006c 725f52ca      	clr	21194
 140                     ; 212   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 142  0070 725f52cb      	clr	21195
 143                     ; 213   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 145  0074 725f52cc      	clr	21196
 146                     ; 214   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 148  0078 725f52cd      	clr	21197
 149                     ; 215   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 151  007c 725f52d0      	clr	21200
 152                     ; 216   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 154  0080 350152b8      	mov	21176,#1
 155                     ; 217   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 157  0084 725f52cf      	clr	21199
 158                     ; 218   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 160  0088 725f52ce      	clr	21198
 161                     ; 219   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 163  008c 725f52c5      	clr	21189
 164                     ; 220   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 166  0090 725f52b6      	clr	21174
 167                     ; 221   TIM1->SR2   = TIM1_SR2_RESET_VALUE;
 169  0094 725f52b7      	clr	21175
 170                     ; 222 }
 173  0098 87            	retf	
 275                     ; 238 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 275                     ; 239                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 275                     ; 240                        uint16_t TIM1_Period,
 275                     ; 241                        uint8_t TIM1_RepetitionCounter)
 275                     ; 242 {
 276                     .text:	section	.text,new
 277  0000               f_TIM1_TimeBaseInit:
 279  0000 89            	pushw	x
 280       00000000      OFST:	set	0
 283                     ; 244   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 285                     ; 248   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 287  0001 7b07          	ld	a,(OFST+7,sp)
 288  0003 c752c3        	ld	21187,a
 289                     ; 249   TIM1->ARRL = (uint8_t)(TIM1_Period);
 291  0006 7b08          	ld	a,(OFST+8,sp)
 292  0008 c752c4        	ld	21188,a
 293                     ; 252   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 295  000b 9e            	ld	a,xh
 296  000c c752c1        	ld	21185,a
 297                     ; 253   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 299  000f 9f            	ld	a,xl
 300  0010 c752c2        	ld	21186,a
 301                     ; 256   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 301                     ; 257                         | (uint8_t)(TIM1_CounterMode));
 303  0013 c652b0        	ld	a,21168
 304  0016 a48f          	and	a,#143
 305  0018 1a06          	or	a,(OFST+6,sp)
 306  001a c752b0        	ld	21168,a
 307                     ; 260   TIM1->RCR = TIM1_RepetitionCounter;
 309  001d 7b09          	ld	a,(OFST+9,sp)
 310  001f c752c5        	ld	21189,a
 311                     ; 262 }
 314  0022 85            	popw	x
 315  0023 87            	retf	
 379                     ; 276 void TIM1_PrescalerConfig(uint16_t Prescaler, TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 379                     ; 277 {
 380                     .text:	section	.text,new
 381  0000               f_TIM1_PrescalerConfig:
 383  0000 89            	pushw	x
 384       00000000      OFST:	set	0
 387                     ; 279   assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
 389                     ; 282   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
 391  0001 9e            	ld	a,xh
 392  0002 c752c1        	ld	21185,a
 393                     ; 283   TIM1->PSCRL = (uint8_t)(Prescaler);
 395  0005 9f            	ld	a,xl
 396  0006 c752c2        	ld	21186,a
 397                     ; 286   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
 399  0009 7b06          	ld	a,(OFST+6,sp)
 400  000b c752b8        	ld	21176,a
 401                     ; 287 }
 404  000e 85            	popw	x
 405  000f 87            	retf	
 440                     ; 300 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 440                     ; 301 {
 441                     .text:	section	.text,new
 442  0000               f_TIM1_CounterModeConfig:
 444  0000 88            	push	a
 445       00000000      OFST:	set	0
 448                     ; 303   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 450                     ; 307   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 450                     ; 308                         | (uint8_t)TIM1_CounterMode);
 452  0001 c652b0        	ld	a,21168
 453  0004 a48f          	and	a,#143
 454  0006 1a01          	or	a,(OFST+1,sp)
 455  0008 c752b0        	ld	21168,a
 456                     ; 309 }
 459  000b 84            	pop	a
 460  000c 87            	retf	
 491                     ; 317 void TIM1_SetCounter(uint16_t Counter)
 491                     ; 318 {
 492                     .text:	section	.text,new
 493  0000               f_TIM1_SetCounter:
 497                     ; 320   TIM1->CNTRH = (uint8_t)(Counter >> 8);
 499  0000 9e            	ld	a,xh
 500  0001 c752bf        	ld	21183,a
 501                     ; 321   TIM1->CNTRL = (uint8_t)(Counter);
 503  0004 9f            	ld	a,xl
 504  0005 c752c0        	ld	21184,a
 505                     ; 322 }
 508  0008 87            	retf	
 539                     ; 330 void TIM1_SetAutoreload(uint16_t Autoreload)
 539                     ; 331 {
 540                     .text:	section	.text,new
 541  0000               f_TIM1_SetAutoreload:
 545                     ; 333   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
 547  0000 9e            	ld	a,xh
 548  0001 c752c3        	ld	21187,a
 549                     ; 334   TIM1->ARRL = (uint8_t)(Autoreload);
 551  0004 9f            	ld	a,xl
 552  0005 c752c4        	ld	21188,a
 553                     ; 335 }
 556  0008 87            	retf	
 601                     ; 342 uint16_t TIM1_GetCounter(void)
 601                     ; 343 {
 602                     .text:	section	.text,new
 603  0000               f_TIM1_GetCounter:
 605  0000 5204          	subw	sp,#4
 606       00000004      OFST:	set	4
 609                     ; 345   uint16_t tmpcntr = 0;
 611                     ; 346   uint8_t tmpcntrl = 0, tmpcntrh = 0;
 615                     ; 348   tmpcntrh = TIM1->CNTRH;
 617  0002 c652bf        	ld	a,21183
 618  0005 6b02          	ld	(OFST-2,sp),a
 619                     ; 349   tmpcntrl = TIM1->CNTRL;
 621  0007 c652c0        	ld	a,21184
 622  000a 6b01          	ld	(OFST-3,sp),a
 623                     ; 351   tmpcntr  = (uint16_t)(tmpcntrl);
 625  000c 5f            	clrw	x
 626  000d 97            	ld	xl,a
 627  000e 1f03          	ldw	(OFST-1,sp),x
 628                     ; 352   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
 630  0010 5f            	clrw	x
 631  0011 7b02          	ld	a,(OFST-2,sp)
 632  0013 97            	ld	xl,a
 633  0014 7b04          	ld	a,(OFST+0,sp)
 634  0016 01            	rrwa	x,a
 635  0017 1a03          	or	a,(OFST-1,sp)
 636  0019 01            	rrwa	x,a
 637                     ; 355   return (uint16_t)tmpcntr;
 641  001a 5b04          	addw	sp,#4
 642  001c 87            	retf	
 673                     ; 363 uint16_t TIM1_GetPrescaler(void)
 673                     ; 364 {
 674                     .text:	section	.text,new
 675  0000               f_TIM1_GetPrescaler:
 677  0000 89            	pushw	x
 678       00000002      OFST:	set	2
 681                     ; 365   uint16_t tmpreg = 0;
 683                     ; 366   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
 685  0001 c652c1        	ld	a,21185
 686  0004 97            	ld	xl,a
 687  0005 4f            	clr	a
 688  0006 02            	rlwa	x,a
 689  0007 1f01          	ldw	(OFST-1,sp),x
 690                     ; 368   return (uint16_t)(tmpreg | TIM1->PSCRL);
 692  0009 c652c2        	ld	a,21186
 693  000c 5f            	clrw	x
 694  000d 97            	ld	xl,a
 695  000e 01            	rrwa	x,a
 696  000f 1a02          	or	a,(OFST+0,sp)
 697  0011 01            	rrwa	x,a
 698  0012 1a01          	or	a,(OFST-1,sp)
 699  0014 01            	rrwa	x,a
 702  0015 5b02          	addw	sp,#2
 703  0017 87            	retf	
 758                     ; 377 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 758                     ; 378 {
 759                     .text:	section	.text,new
 760  0000               f_TIM1_UpdateDisableConfig:
 764                     ; 380   assert_param(IS_FUNCTIONAL_STATE(NewState));
 766                     ; 383   if (NewState != DISABLE)
 768  0000 4d            	tnz	a
 769  0001 2705          	jreq	L352
 770                     ; 385     TIM1->CR1 |= TIM1_CR1_UDIS;
 772  0003 721252b0      	bset	21168,#1
 775  0007 87            	retf	
 776  0008               L352:
 777                     ; 389     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 779  0008 721352b0      	bres	21168,#1
 780                     ; 391 }
 783  000c 87            	retf	
 840                     ; 401 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 840                     ; 402 {
 841                     .text:	section	.text,new
 842  0000               f_TIM1_UpdateRequestConfig:
 846                     ; 404   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
 848                     ; 407   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
 850  0000 4d            	tnz	a
 851  0001 2705          	jreq	L503
 852                     ; 409     TIM1->CR1 |= TIM1_CR1_URS;
 854  0003 721452b0      	bset	21168,#2
 857  0007 87            	retf	
 858  0008               L503:
 859                     ; 413     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 861  0008 721552b0      	bres	21168,#2
 862                     ; 415 }
 865  000c 87            	retf	
 900                     ; 423 void TIM1_ARRPreloadConfig(FunctionalState NewState)
 900                     ; 424 {
 901                     .text:	section	.text,new
 902  0000               f_TIM1_ARRPreloadConfig:
 906                     ; 426   assert_param(IS_FUNCTIONAL_STATE(NewState));
 908                     ; 429   if (NewState != DISABLE)
 910  0000 4d            	tnz	a
 911  0001 2705          	jreq	L723
 912                     ; 431     TIM1->CR1 |= TIM1_CR1_ARPE;
 914  0003 721e52b0      	bset	21168,#7
 917  0007 87            	retf	
 918  0008               L723:
 919                     ; 435     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
 921  0008 721f52b0      	bres	21168,#7
 922                     ; 437 }
 925  000c 87            	retf	
 981                     ; 447 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
 981                     ; 448 {
 982                     .text:	section	.text,new
 983  0000               f_TIM1_SelectOnePulseMode:
 987                     ; 450   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
 989                     ; 453   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
 991  0000 4d            	tnz	a
 992  0001 2705          	jreq	L163
 993                     ; 455     TIM1->CR1 |= TIM1_CR1_OPM;
 995  0003 721652b0      	bset	21168,#3
 998  0007 87            	retf	
 999  0008               L163:
1000                     ; 459     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
1002  0008 721752b0      	bres	21168,#3
1003                     ; 461 }
1006  000c 87            	retf	
1040                     ; 469 void TIM1_Cmd(FunctionalState NewState)
1040                     ; 470 {
1041                     .text:	section	.text,new
1042  0000               f_TIM1_Cmd:
1046                     ; 472   assert_param(IS_FUNCTIONAL_STATE(NewState));
1048                     ; 475   if (NewState != DISABLE)
1050  0000 4d            	tnz	a
1051  0001 2705          	jreq	L304
1052                     ; 477     TIM1->CR1 |= TIM1_CR1_CEN;
1054  0003 721052b0      	bset	21168,#0
1057  0007 87            	retf	
1058  0008               L304:
1059                     ; 481     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1061  0008 721152b0      	bres	21168,#0
1062                     ; 483 }
1065  000c 87            	retf	
1347                     ; 574 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1347                     ; 575                   TIM1_OutputState_TypeDef TIM1_OutputState,
1347                     ; 576                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1347                     ; 577                   uint16_t TIM1_Pulse,
1347                     ; 578                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1347                     ; 579                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1347                     ; 580                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1347                     ; 581                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1347                     ; 582 {
1348                     .text:	section	.text,new
1349  0000               f_TIM1_OC1Init:
1351  0000 89            	pushw	x
1352  0001 5203          	subw	sp,#3
1353       00000003      OFST:	set	3
1356                     ; 584   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1358                     ; 585   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1360                     ; 586   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1362                     ; 587   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1364                     ; 588   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1366                     ; 589   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1368                     ; 590   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1370                     ; 594   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
1370                     ; 595                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
1372  0003 c652bd        	ld	a,21181
1373  0006 a4f0          	and	a,#240
1374  0008 c752bd        	ld	21181,a
1375                     ; 598   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
1375                     ; 599                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
1375                     ; 600                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
1375                     ; 601                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
1377  000b 7b0d          	ld	a,(OFST+10,sp)
1378  000d a408          	and	a,#8
1379  000f 6b03          	ld	(OFST+0,sp),a
1380  0011 7b0c          	ld	a,(OFST+9,sp)
1381  0013 a402          	and	a,#2
1382  0015 1a03          	or	a,(OFST+0,sp)
1383  0017 6b02          	ld	(OFST-1,sp),a
1384  0019 7b09          	ld	a,(OFST+6,sp)
1385  001b a404          	and	a,#4
1386  001d 6b01          	ld	(OFST-2,sp),a
1387  001f 9f            	ld	a,xl
1388  0020 a401          	and	a,#1
1389  0022 1a01          	or	a,(OFST-2,sp)
1390  0024 1a02          	or	a,(OFST-1,sp)
1391  0026 ca52bd        	or	a,21181
1392  0029 c752bd        	ld	21181,a
1393                     ; 604   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
1393                     ; 605                           | (uint8_t)TIM1_OCMode);
1395  002c c652b9        	ld	a,21177
1396  002f a48f          	and	a,#143
1397  0031 1a04          	or	a,(OFST+1,sp)
1398  0033 c752b9        	ld	21177,a
1399                     ; 608   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
1401  0036 c652d0        	ld	a,21200
1402  0039 a4fc          	and	a,#252
1403  003b c752d0        	ld	21200,a
1404                     ; 610   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
1404                     ; 611                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
1406  003e 7b0f          	ld	a,(OFST+12,sp)
1407  0040 a402          	and	a,#2
1408  0042 6b03          	ld	(OFST+0,sp),a
1409  0044 7b0e          	ld	a,(OFST+11,sp)
1410  0046 a401          	and	a,#1
1411  0048 1a03          	or	a,(OFST+0,sp)
1412  004a ca52d0        	or	a,21200
1413  004d c752d0        	ld	21200,a
1414                     ; 614   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
1416  0050 7b0a          	ld	a,(OFST+7,sp)
1417  0052 c752c6        	ld	21190,a
1418                     ; 615   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
1420  0055 7b0b          	ld	a,(OFST+8,sp)
1421  0057 c752c7        	ld	21191,a
1422                     ; 616 }
1425  005a 5b05          	addw	sp,#5
1426  005c 87            	retf	
1527                     ; 655 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1527                     ; 656                   TIM1_OutputState_TypeDef TIM1_OutputState,
1527                     ; 657                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1527                     ; 658                   uint16_t TIM1_Pulse,
1527                     ; 659                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1527                     ; 660                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1527                     ; 661                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1527                     ; 662                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1527                     ; 663 {
1528                     .text:	section	.text,new
1529  0000               f_TIM1_OC2Init:
1531  0000 89            	pushw	x
1532  0001 5203          	subw	sp,#3
1533       00000003      OFST:	set	3
1536                     ; 666   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1538                     ; 667   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1540                     ; 668   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1542                     ; 669   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1544                     ; 670   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1546                     ; 671   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1548                     ; 672   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1550                     ; 676   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1552  0003 c652bd        	ld	a,21181
1553  0006 a40f          	and	a,#15
1554  0008 c752bd        	ld	21181,a
1555                     ; 679   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
1555                     ; 680                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
1557  000b 7b0d          	ld	a,(OFST+10,sp)
1558  000d a480          	and	a,#128
1559  000f 6b03          	ld	(OFST+0,sp),a
1560  0011 7b0c          	ld	a,(OFST+9,sp)
1561  0013 a420          	and	a,#32
1562  0015 1a03          	or	a,(OFST+0,sp)
1563  0017 6b02          	ld	(OFST-1,sp),a
1564  0019 7b09          	ld	a,(OFST+6,sp)
1565  001b a440          	and	a,#64
1566  001d 6b01          	ld	(OFST-2,sp),a
1567  001f 9f            	ld	a,xl
1568  0020 a410          	and	a,#16
1569  0022 1a01          	or	a,(OFST-2,sp)
1570  0024 1a02          	or	a,(OFST-1,sp)
1571  0026 ca52bd        	or	a,21181
1572  0029 c752bd        	ld	21181,a
1573                     ; 683   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1575  002c c652ba        	ld	a,21178
1576  002f a48f          	and	a,#143
1577  0031 1a04          	or	a,(OFST+1,sp)
1578  0033 c752ba        	ld	21178,a
1579                     ; 686   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1581  0036 c652d0        	ld	a,21200
1582  0039 a4f3          	and	a,#243
1583  003b c752d0        	ld	21200,a
1584                     ; 688   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1586  003e 7b0f          	ld	a,(OFST+12,sp)
1587  0040 a408          	and	a,#8
1588  0042 6b03          	ld	(OFST+0,sp),a
1589  0044 7b0e          	ld	a,(OFST+11,sp)
1590  0046 a404          	and	a,#4
1591  0048 1a03          	or	a,(OFST+0,sp)
1592  004a ca52d0        	or	a,21200
1593  004d c752d0        	ld	21200,a
1594                     ; 691   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1596  0050 7b0a          	ld	a,(OFST+7,sp)
1597  0052 c752c8        	ld	21192,a
1598                     ; 692   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1600  0055 7b0b          	ld	a,(OFST+8,sp)
1601  0057 c752c9        	ld	21193,a
1602                     ; 693 }
1605  005a 5b05          	addw	sp,#5
1606  005c 87            	retf	
1707                     ; 732 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1707                     ; 733                   TIM1_OutputState_TypeDef TIM1_OutputState,
1707                     ; 734                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1707                     ; 735                   uint16_t TIM1_Pulse,
1707                     ; 736                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1707                     ; 737                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1707                     ; 738                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1707                     ; 739                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1707                     ; 740 {
1708                     .text:	section	.text,new
1709  0000               f_TIM1_OC3Init:
1711  0000 89            	pushw	x
1712  0001 5203          	subw	sp,#3
1713       00000003      OFST:	set	3
1716                     ; 743   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1718                     ; 744   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1720                     ; 745   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1722                     ; 746   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1724                     ; 747   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1726                     ; 748   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1728                     ; 749   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1730                     ; 753   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1732  0003 c652be        	ld	a,21182
1733  0006 a4f0          	and	a,#240
1734  0008 c752be        	ld	21182,a
1735                     ; 756   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
1735                     ; 757                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
1737  000b 7b0d          	ld	a,(OFST+10,sp)
1738  000d a408          	and	a,#8
1739  000f 6b03          	ld	(OFST+0,sp),a
1740  0011 7b0c          	ld	a,(OFST+9,sp)
1741  0013 a402          	and	a,#2
1742  0015 1a03          	or	a,(OFST+0,sp)
1743  0017 6b02          	ld	(OFST-1,sp),a
1744  0019 7b09          	ld	a,(OFST+6,sp)
1745  001b a404          	and	a,#4
1746  001d 6b01          	ld	(OFST-2,sp),a
1747  001f 9f            	ld	a,xl
1748  0020 a401          	and	a,#1
1749  0022 1a01          	or	a,(OFST-2,sp)
1750  0024 1a02          	or	a,(OFST-1,sp)
1751  0026 ca52be        	or	a,21182
1752  0029 c752be        	ld	21182,a
1753                     ; 760   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1755  002c c652bb        	ld	a,21179
1756  002f a48f          	and	a,#143
1757  0031 1a04          	or	a,(OFST+1,sp)
1758  0033 c752bb        	ld	21179,a
1759                     ; 763   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1761  0036 c652d0        	ld	a,21200
1762  0039 a4cf          	and	a,#207
1763  003b c752d0        	ld	21200,a
1764                     ; 765   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1766  003e 7b0f          	ld	a,(OFST+12,sp)
1767  0040 a420          	and	a,#32
1768  0042 6b03          	ld	(OFST+0,sp),a
1769  0044 7b0e          	ld	a,(OFST+11,sp)
1770  0046 a410          	and	a,#16
1771  0048 1a03          	or	a,(OFST+0,sp)
1772  004a ca52d0        	or	a,21200
1773  004d c752d0        	ld	21200,a
1774                     ; 768   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1776  0050 7b0a          	ld	a,(OFST+7,sp)
1777  0052 c752ca        	ld	21194,a
1778                     ; 769   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1780  0055 7b0b          	ld	a,(OFST+8,sp)
1781  0057 c752cb        	ld	21195,a
1782                     ; 770 }
1785  005a 5b05          	addw	sp,#5
1786  005c 87            	retf	
1990                     ; 800 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1990                     ; 801                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1990                     ; 802                      uint8_t TIM1_DeadTime,
1990                     ; 803                      TIM1_BreakState_TypeDef TIM1_Break,
1990                     ; 804                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1990                     ; 805                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1990                     ; 806 {
1991                     .text:	section	.text,new
1992  0000               f_TIM1_BDTRConfig:
1994  0000 89            	pushw	x
1995  0001 88            	push	a
1996       00000001      OFST:	set	1
1999                     ; 809   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
2001                     ; 810   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
2003                     ; 811   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
2005                     ; 812   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
2007                     ; 813   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
2009                     ; 815   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2011  0002 7b07          	ld	a,(OFST+6,sp)
2012  0004 c752cf        	ld	21199,a
2013                     ; 819   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
2013                     ; 820                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
2013                     ; 821                                       | (uint8_t)TIM1_AutomaticOutput));
2015  0007 7b08          	ld	a,(OFST+7,sp)
2016  0009 1a09          	or	a,(OFST+8,sp)
2017  000b 1a0a          	or	a,(OFST+9,sp)
2018  000d 6b01          	ld	(OFST+0,sp),a
2019  000f 9f            	ld	a,xl
2020  0010 1a02          	or	a,(OFST+1,sp)
2021  0012 1a01          	or	a,(OFST+0,sp)
2022  0014 c752ce        	ld	21198,a
2023                     ; 823 }
2026  0017 5b03          	addw	sp,#3
2027  0019 87            	retf	
2062                     ; 831 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2062                     ; 832 {
2063                     .text:	section	.text,new
2064  0000               f_TIM1_CtrlPWMOutputs:
2068                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2070                     ; 838   if (NewState != DISABLE)
2072  0000 4d            	tnz	a
2073  0001 2705          	jreq	L1301
2074                     ; 840     TIM1->BKR |= TIM1_BKR_MOE;
2076  0003 721e52ce      	bset	21198,#7
2079  0007 87            	retf	
2080  0008               L1301:
2081                     ; 844     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2083  0008 721f52ce      	bres	21198,#7
2084                     ; 846 }
2087  000c 87            	retf	
2165                     ; 868 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
2165                     ; 869 {
2166                     .text:	section	.text,new
2167  0000               f_TIM1_SelectOCxM:
2169  0000 89            	pushw	x
2170       00000000      OFST:	set	0
2173                     ; 871   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
2175                     ; 872   assert_param(IS_TIM1_OCM(TIM1_OCMode));
2177                     ; 874   if (TIM1_Channel == TIM1_Channel_1)
2179  0001 9e            	ld	a,xh
2180  0002 4d            	tnz	a
2181  0003 2610          	jrne	L3701
2182                     ; 877     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2184  0005 721152bd      	bres	21181,#0
2185                     ; 880     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2187  0009 c652b9        	ld	a,21177
2188  000c a48f          	and	a,#143
2189  000e 1a02          	or	a,(OFST+2,sp)
2190  0010 c752b9        	ld	21177,a
2192  0013 2023          	jra	L5701
2193  0015               L3701:
2194                     ; 882   else if (TIM1_Channel == TIM1_Channel_2)
2196  0015 7b01          	ld	a,(OFST+1,sp)
2197  0017 4a            	dec	a
2198  0018 2610          	jrne	L7701
2199                     ; 885     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
2201  001a 721952bd      	bres	21181,#4
2202                     ; 888     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2204  001e c652ba        	ld	a,21178
2205  0021 a48f          	and	a,#143
2206  0023 1a02          	or	a,(OFST+2,sp)
2207  0025 c752ba        	ld	21178,a
2209  0028 200e          	jra	L5701
2210  002a               L7701:
2211                     ; 893     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
2213  002a 721152be      	bres	21182,#0
2214                     ; 896     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2216  002e c652bb        	ld	a,21179
2217  0031 a48f          	and	a,#143
2218  0033 1a02          	or	a,(OFST+2,sp)
2219  0035 c752bb        	ld	21179,a
2220  0038               L5701:
2221                     ; 899 }
2224  0038 85            	popw	x
2225  0039 87            	retf	
2256                     ; 907 void TIM1_SetCompare1(uint16_t Compare1)
2256                     ; 908 {
2257                     .text:	section	.text,new
2258  0000               f_TIM1_SetCompare1:
2262                     ; 910   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
2264  0000 9e            	ld	a,xh
2265  0001 c752c6        	ld	21190,a
2266                     ; 911   TIM1->CCR1L = (uint8_t)(Compare1);
2268  0004 9f            	ld	a,xl
2269  0005 c752c7        	ld	21191,a
2270                     ; 913 }
2273  0008 87            	retf	
2304                     ; 921 void TIM1_SetCompare2(uint16_t Compare2)
2304                     ; 922 {
2305                     .text:	section	.text,new
2306  0000               f_TIM1_SetCompare2:
2310                     ; 924   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
2312  0000 9e            	ld	a,xh
2313  0001 c752c8        	ld	21192,a
2314                     ; 925   TIM1->CCR2L = (uint8_t)(Compare2);
2316  0004 9f            	ld	a,xl
2317  0005 c752c9        	ld	21193,a
2318                     ; 926 }
2321  0008 87            	retf	
2352                     ; 934 void TIM1_SetCompare3(uint16_t Compare3)
2352                     ; 935 {
2353                     .text:	section	.text,new
2354  0000               f_TIM1_SetCompare3:
2358                     ; 937   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
2360  0000 9e            	ld	a,xh
2361  0001 c752ca        	ld	21194,a
2362                     ; 938   TIM1->CCR3L = (uint8_t)(Compare3);
2364  0004 9f            	ld	a,xl
2365  0005 c752cb        	ld	21195,a
2366                     ; 939 }
2369  0008 87            	retf	
2400                     ; 947 void TIM1_SetCompare4(uint16_t Compare4)
2400                     ; 948 {
2401                     .text:	section	.text,new
2402  0000               f_TIM1_SetCompare4:
2406                     ; 950   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
2408  0000 9e            	ld	a,xh
2409  0001 c752cc        	ld	21196,a
2410                     ; 951   TIM1->CCR4L = (uint8_t)(Compare4);
2412  0004 9f            	ld	a,xl
2413  0005 c752cd        	ld	21197,a
2414                     ; 952 }
2417  0008 87            	retf	
2452                     ; 960 void TIM1_CCPreloadControl(FunctionalState NewState)
2452                     ; 961 {
2453                     .text:	section	.text,new
2454  0000               f_TIM1_CCPreloadControl:
2458                     ; 963   assert_param(IS_FUNCTIONAL_STATE(NewState));
2460                     ; 966   if (NewState != DISABLE)
2462  0000 4d            	tnz	a
2463  0001 2705          	jreq	L1021
2464                     ; 968     TIM1->CR2 |= TIM1_CR2_CCPC;
2466  0003 721052b1      	bset	21169,#0
2469  0007 87            	retf	
2470  0008               L1021:
2471                     ; 972     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
2473  0008 721152b1      	bres	21169,#0
2474                     ; 974 }
2477  000c 87            	retf	
2534                     ; 984 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2534                     ; 985 {
2535                     .text:	section	.text,new
2536  0000               f_TIM1_ForcedOC1Config:
2538  0000 88            	push	a
2539       00000000      OFST:	set	0
2542                     ; 987   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2544                     ; 990   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2546  0001 c652b9        	ld	a,21177
2547  0004 a48f          	and	a,#143
2548  0006 1a01          	or	a,(OFST+1,sp)
2549  0008 c752b9        	ld	21177,a
2550                     ; 991 }
2553  000b 84            	pop	a
2554  000c 87            	retf	
2589                     ; 1001 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2589                     ; 1002 {
2590                     .text:	section	.text,new
2591  0000               f_TIM1_ForcedOC2Config:
2593  0000 88            	push	a
2594       00000000      OFST:	set	0
2597                     ; 1004   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2599                     ; 1007   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2601  0001 c652ba        	ld	a,21178
2602  0004 a48f          	and	a,#143
2603  0006 1a01          	or	a,(OFST+1,sp)
2604  0008 c752ba        	ld	21178,a
2605                     ; 1008 }
2608  000b 84            	pop	a
2609  000c 87            	retf	
2644                     ; 1018 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2644                     ; 1019 {
2645                     .text:	section	.text,new
2646  0000               f_TIM1_ForcedOC3Config:
2648  0000 88            	push	a
2649       00000000      OFST:	set	0
2652                     ; 1021   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2654                     ; 1024   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2656  0001 c652bb        	ld	a,21179
2657  0004 a48f          	and	a,#143
2658  0006 1a01          	or	a,(OFST+1,sp)
2659  0008 c752bb        	ld	21179,a
2660                     ; 1025 }
2663  000b 84            	pop	a
2664  000c 87            	retf	
2699                     ; 1033 void TIM1_OC1PreloadConfig(FunctionalState NewState)
2699                     ; 1034 {
2700                     .text:	section	.text,new
2701  0000               f_TIM1_OC1PreloadConfig:
2705                     ; 1036   assert_param(IS_FUNCTIONAL_STATE(NewState));
2707                     ; 1039   if (NewState != DISABLE)
2709  0000 4d            	tnz	a
2710  0001 2705          	jreq	L5031
2711                     ; 1041     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
2713  0003 721652b9      	bset	21177,#3
2716  0007 87            	retf	
2717  0008               L5031:
2718                     ; 1045     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2720  0008 721752b9      	bres	21177,#3
2721                     ; 1047 }
2724  000c 87            	retf	
2759                     ; 1055 void TIM1_OC2PreloadConfig(FunctionalState NewState)
2759                     ; 1056 {
2760                     .text:	section	.text,new
2761  0000               f_TIM1_OC2PreloadConfig:
2765                     ; 1058   assert_param(IS_FUNCTIONAL_STATE(NewState));
2767                     ; 1061   if (NewState != DISABLE)
2769  0000 4d            	tnz	a
2770  0001 2705          	jreq	L7231
2771                     ; 1063     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
2773  0003 721652ba      	bset	21178,#3
2776  0007 87            	retf	
2777  0008               L7231:
2778                     ; 1067     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2780  0008 721752ba      	bres	21178,#3
2781                     ; 1069 }
2784  000c 87            	retf	
2819                     ; 1077 void TIM1_OC3PreloadConfig(FunctionalState NewState)
2819                     ; 1078 {
2820                     .text:	section	.text,new
2821  0000               f_TIM1_OC3PreloadConfig:
2825                     ; 1080   assert_param(IS_FUNCTIONAL_STATE(NewState));
2827                     ; 1083   if (NewState != DISABLE)
2829  0000 4d            	tnz	a
2830  0001 2705          	jreq	L1531
2831                     ; 1085     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
2833  0003 721652bb      	bset	21179,#3
2836  0007 87            	retf	
2837  0008               L1531:
2838                     ; 1089     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2840  0008 721752bb      	bres	21179,#3
2841                     ; 1091 }
2844  000c 87            	retf	
2879                     ; 1099 void TIM1_OC4PreloadConfig(FunctionalState NewState)
2879                     ; 1100 {
2880                     .text:	section	.text,new
2881  0000               f_TIM1_OC4PreloadConfig:
2885                     ; 1102   assert_param(IS_FUNCTIONAL_STATE(NewState));
2887                     ; 1105   if (NewState != DISABLE)
2889  0000 4d            	tnz	a
2890  0001 2705          	jreq	L3731
2891                     ; 1107     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
2893  0003 721652bc      	bset	21180,#3
2896  0007 87            	retf	
2897  0008               L3731:
2898                     ; 1111     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2900  0008 721752bc      	bres	21180,#3
2901                     ; 1113 }
2904  000c 87            	retf	
2938                     ; 1121 void TIM1_OC1FastConfig(FunctionalState NewState)
2938                     ; 1122 {
2939                     .text:	section	.text,new
2940  0000               f_TIM1_OC1FastConfig:
2944                     ; 1124   assert_param(IS_FUNCTIONAL_STATE(NewState));
2946                     ; 1127   if (NewState != DISABLE)
2948  0000 4d            	tnz	a
2949  0001 2705          	jreq	L5141
2950                     ; 1129     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
2952  0003 721452b9      	bset	21177,#2
2955  0007 87            	retf	
2956  0008               L5141:
2957                     ; 1133     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
2959  0008 721552b9      	bres	21177,#2
2960                     ; 1135 }
2963  000c 87            	retf	
2997                     ; 1143 void TIM1_OC2FastConfig(FunctionalState NewState)
2997                     ; 1144 {
2998                     .text:	section	.text,new
2999  0000               f_TIM1_OC2FastConfig:
3003                     ; 1146   assert_param(IS_FUNCTIONAL_STATE(NewState));
3005                     ; 1149   if (NewState != DISABLE)
3007  0000 4d            	tnz	a
3008  0001 2705          	jreq	L7341
3009                     ; 1151     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
3011  0003 721452ba      	bset	21178,#2
3014  0007 87            	retf	
3015  0008               L7341:
3016                     ; 1155     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3018  0008 721552ba      	bres	21178,#2
3019                     ; 1157 }
3022  000c 87            	retf	
3056                     ; 1165 void TIM1_OC3FastConfig(FunctionalState NewState)
3056                     ; 1166 {
3057                     .text:	section	.text,new
3058  0000               f_TIM1_OC3FastConfig:
3062                     ; 1168   assert_param(IS_FUNCTIONAL_STATE(NewState));
3064                     ; 1171   if (NewState != DISABLE)
3066  0000 4d            	tnz	a
3067  0001 2705          	jreq	L1641
3068                     ; 1173     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
3070  0003 721452bb      	bset	21179,#2
3073  0007 87            	retf	
3074  0008               L1641:
3075                     ; 1177     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3077  0008 721552bb      	bres	21179,#2
3078                     ; 1179 }
3081  000c 87            	retf	
3115                     ; 1187 void TIM1_ClearOC1Ref(FunctionalState NewState)
3115                     ; 1188 {
3116                     .text:	section	.text,new
3117  0000               f_TIM1_ClearOC1Ref:
3121                     ; 1190   assert_param(IS_FUNCTIONAL_STATE(NewState));
3123                     ; 1193   if (NewState != DISABLE)
3125  0000 4d            	tnz	a
3126  0001 2705          	jreq	L3051
3127                     ; 1195     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
3129  0003 721e52b9      	bset	21177,#7
3132  0007 87            	retf	
3133  0008               L3051:
3134                     ; 1199     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3136  0008 721f52b9      	bres	21177,#7
3137                     ; 1201 }
3140  000c 87            	retf	
3174                     ; 1209 void TIM1_ClearOC2Ref(FunctionalState NewState)
3174                     ; 1210 {
3175                     .text:	section	.text,new
3176  0000               f_TIM1_ClearOC2Ref:
3180                     ; 1212   assert_param(IS_FUNCTIONAL_STATE(NewState));
3182                     ; 1215   if (NewState != DISABLE)
3184  0000 4d            	tnz	a
3185  0001 2705          	jreq	L5251
3186                     ; 1217     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
3188  0003 721e52ba      	bset	21178,#7
3191  0007 87            	retf	
3192  0008               L5251:
3193                     ; 1221     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3195  0008 721f52ba      	bres	21178,#7
3196                     ; 1223 }
3199  000c 87            	retf	
3233                     ; 1231 void TIM1_ClearOC3Ref(FunctionalState NewState)
3233                     ; 1232 {
3234                     .text:	section	.text,new
3235  0000               f_TIM1_ClearOC3Ref:
3239                     ; 1234   assert_param(IS_FUNCTIONAL_STATE(NewState));
3241                     ; 1237   if (NewState != DISABLE)
3243  0000 4d            	tnz	a
3244  0001 2705          	jreq	L7451
3245                     ; 1239     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
3247  0003 721e52bb      	bset	21179,#7
3250  0007 87            	retf	
3251  0008               L7451:
3252                     ; 1243     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3254  0008 721f52bb      	bres	21179,#7
3255                     ; 1245 }
3258  000c 87            	retf	
3292                     ; 1253 void TIM1_ClearOC4Ref(FunctionalState NewState)
3292                     ; 1254 {
3293                     .text:	section	.text,new
3294  0000               f_TIM1_ClearOC4Ref:
3298                     ; 1256   assert_param(IS_FUNCTIONAL_STATE(NewState));
3300                     ; 1259   if (NewState != DISABLE)
3302  0000 4d            	tnz	a
3303  0001 2705          	jreq	L1751
3304                     ; 1261     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
3306  0003 721e52bc      	bset	21180,#7
3309  0007 87            	retf	
3310  0008               L1751:
3311                     ; 1265     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3313  0008 721f52bc      	bres	21180,#7
3314                     ; 1267 }
3317  000c 87            	retf	
3352                     ; 1277 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3352                     ; 1278 {
3353                     .text:	section	.text,new
3354  0000               f_TIM1_OC1PolarityConfig:
3358                     ; 1280   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3360                     ; 1283   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3362  0000 4d            	tnz	a
3363  0001 2705          	jreq	L3161
3364                     ; 1285     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3366  0003 721252bd      	bset	21181,#1
3369  0007 87            	retf	
3370  0008               L3161:
3371                     ; 1289     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3373  0008 721352bd      	bres	21181,#1
3374                     ; 1291 }
3377  000c 87            	retf	
3412                     ; 1301 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3412                     ; 1302 {
3413                     .text:	section	.text,new
3414  0000               f_TIM1_OC1NPolarityConfig:
3418                     ; 1304   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3420                     ; 1307   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3422  0000 4d            	tnz	a
3423  0001 2705          	jreq	L5361
3424                     ; 1309     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
3426  0003 721652bd      	bset	21181,#3
3429  0007 87            	retf	
3430  0008               L5361:
3431                     ; 1313     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
3433  0008 721752bd      	bres	21181,#3
3434                     ; 1315 }
3437  000c 87            	retf	
3472                     ; 1325 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3472                     ; 1326 {
3473                     .text:	section	.text,new
3474  0000               f_TIM1_OC2PolarityConfig:
3478                     ; 1328   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3480                     ; 1331   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3482  0000 4d            	tnz	a
3483  0001 2705          	jreq	L7561
3484                     ; 1333     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3486  0003 721a52bd      	bset	21181,#5
3489  0007 87            	retf	
3490  0008               L7561:
3491                     ; 1337     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3493  0008 721b52bd      	bres	21181,#5
3494                     ; 1339 }
3497  000c 87            	retf	
3532                     ; 1349 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3532                     ; 1350 {
3533                     .text:	section	.text,new
3534  0000               f_TIM1_OC2NPolarityConfig:
3538                     ; 1352   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3540                     ; 1355   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3542  0000 4d            	tnz	a
3543  0001 2705          	jreq	L1071
3544                     ; 1357     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
3546  0003 721e52bd      	bset	21181,#7
3549  0007 87            	retf	
3550  0008               L1071:
3551                     ; 1361     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
3553  0008 721f52bd      	bres	21181,#7
3554                     ; 1363 }
3557  000c 87            	retf	
3592                     ; 1373 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3592                     ; 1374 {
3593                     .text:	section	.text,new
3594  0000               f_TIM1_OC3PolarityConfig:
3598                     ; 1376   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3600                     ; 1379   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3602  0000 4d            	tnz	a
3603  0001 2705          	jreq	L3271
3604                     ; 1381     TIM1->CCER2 |= TIM1_CCER2_CC3P;
3606  0003 721252be      	bset	21182,#1
3609  0007 87            	retf	
3610  0008               L3271:
3611                     ; 1385     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
3613  0008 721352be      	bres	21182,#1
3614                     ; 1387 }
3617  000c 87            	retf	
3652                     ; 1397 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3652                     ; 1398 {
3653                     .text:	section	.text,new
3654  0000               f_TIM1_OC3NPolarityConfig:
3658                     ; 1400   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3660                     ; 1403   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3662  0000 4d            	tnz	a
3663  0001 2705          	jreq	L5471
3664                     ; 1405     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
3666  0003 721652be      	bset	21182,#3
3669  0007 87            	retf	
3670  0008               L5471:
3671                     ; 1409     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
3673  0008 721752be      	bres	21182,#3
3674                     ; 1411 }
3677  000c 87            	retf	
3735                     ; 1421 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
3735                     ; 1422 {
3736                     .text:	section	.text,new
3737  0000               f_TIM1_SelectOCREFClear:
3741                     ; 1424   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
3743                     ; 1427   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
3745  0000 721752b2      	bres	21170,#3
3746                     ; 1428   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
3748  0004 ca52b2        	or	a,21170
3749  0007 c752b2        	ld	21170,a
3750                     ; 1429 }
3753  000a 87            	retf	
3787                     ; 1437 void TIM1_SelectCOM(FunctionalState NewState)
3787                     ; 1438 {
3788                     .text:	section	.text,new
3789  0000               f_TIM1_SelectCOM:
3793                     ; 1440   assert_param(IS_FUNCTIONAL_STATE(NewState));
3795                     ; 1443   if (NewState != DISABLE)
3797  0000 4d            	tnz	a
3798  0001 2705          	jreq	L5102
3799                     ; 1445     TIM1->CR2 |= TIM1_CR2_CCUS;
3801  0003 721452b1      	bset	21169,#2
3804  0007 87            	retf	
3805  0008               L5102:
3806                     ; 1449     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
3808  0008 721552b1      	bres	21169,#2
3809                     ; 1451 }
3812  000c 87            	retf	
3856                     ; 1465 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
3856                     ; 1466 {
3857                     .text:	section	.text,new
3858  0000               f_TIM1_CCxCmd:
3860  0000 89            	pushw	x
3861       00000000      OFST:	set	0
3864                     ; 1468   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
3866                     ; 1469   assert_param(IS_FUNCTIONAL_STATE(NewState));
3868                     ; 1471   if (TIM1_Channel == TIM1_Channel_1)
3870  0001 9e            	ld	a,xh
3871  0002 4d            	tnz	a
3872  0003 2610          	jrne	L3402
3873                     ; 1474     if (NewState != DISABLE)
3875  0005 9f            	ld	a,xl
3876  0006 4d            	tnz	a
3877  0007 2706          	jreq	L5402
3878                     ; 1476       TIM1->CCER1 |= TIM1_CCER1_CC1E;
3880  0009 721052bd      	bset	21181,#0
3882  000d 203e          	jra	L1502
3883  000f               L5402:
3884                     ; 1480       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
3886  000f 721152bd      	bres	21181,#0
3887  0013 2038          	jra	L1502
3888  0015               L3402:
3889                     ; 1483   else if (TIM1_Channel == TIM1_Channel_2)
3891  0015 7b01          	ld	a,(OFST+1,sp)
3892  0017 a101          	cp	a,#1
3893  0019 2610          	jrne	L3502
3894                     ; 1486     if (NewState != DISABLE)
3896  001b 7b02          	ld	a,(OFST+2,sp)
3897  001d 2706          	jreq	L5502
3898                     ; 1488       TIM1->CCER1 |= TIM1_CCER1_CC2E;
3900  001f 721852bd      	bset	21181,#4
3902  0023 2028          	jra	L1502
3903  0025               L5502:
3904                     ; 1492       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
3906  0025 721952bd      	bres	21181,#4
3907  0029 2022          	jra	L1502
3908  002b               L3502:
3909                     ; 1495   else if (TIM1_Channel == TIM1_Channel_3)
3911  002b a102          	cp	a,#2
3912  002d 2610          	jrne	L3602
3913                     ; 1498     if (NewState != DISABLE)
3915  002f 7b02          	ld	a,(OFST+2,sp)
3916  0031 2706          	jreq	L5602
3917                     ; 1500       TIM1->CCER2 |= TIM1_CCER2_CC3E;
3919  0033 721052be      	bset	21182,#0
3921  0037 2014          	jra	L1502
3922  0039               L5602:
3923                     ; 1504       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
3925  0039 721152be      	bres	21182,#0
3926  003d 200e          	jra	L1502
3927  003f               L3602:
3928                     ; 1510     if (NewState != DISABLE)
3930  003f 7b02          	ld	a,(OFST+2,sp)
3931  0041 2706          	jreq	L3702
3932                     ; 1512       TIM1->CCER2 |= TIM1_CCER2_CC4E;
3934  0043 721852be      	bset	21182,#4
3936  0047 2004          	jra	L1502
3937  0049               L3702:
3938                     ; 1516       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
3940  0049 721952be      	bres	21182,#4
3941  004d               L1502:
3942                     ; 1519 }
3945  004d 85            	popw	x
3946  004e 87            	retf	
3990                     ; 1532 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
3990                     ; 1533 {
3991                     .text:	section	.text,new
3992  0000               f_TIM1_CCxNCmd:
3994  0000 89            	pushw	x
3995       00000000      OFST:	set	0
3998                     ; 1535   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
4000                     ; 1536   assert_param(IS_FUNCTIONAL_STATE(NewState));
4002                     ; 1538   if (TIM1_Channel == TIM1_Channel_1)
4004  0001 9e            	ld	a,xh
4005  0002 4d            	tnz	a
4006  0003 2610          	jrne	L1212
4007                     ; 1541     if (NewState != DISABLE)
4009  0005 9f            	ld	a,xl
4010  0006 4d            	tnz	a
4011  0007 2706          	jreq	L3212
4012                     ; 1543       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
4014  0009 721452bd      	bset	21181,#2
4016  000d 2029          	jra	L7212
4017  000f               L3212:
4018                     ; 1547       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
4020  000f 721552bd      	bres	21181,#2
4021  0013 2023          	jra	L7212
4022  0015               L1212:
4023                     ; 1550   else if (TIM1_Channel == TIM1_Channel_2)
4025  0015 7b01          	ld	a,(OFST+1,sp)
4026  0017 4a            	dec	a
4027  0018 2610          	jrne	L1312
4028                     ; 1553     if (NewState != DISABLE)
4030  001a 7b02          	ld	a,(OFST+2,sp)
4031  001c 2706          	jreq	L3312
4032                     ; 1555       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
4034  001e 721c52bd      	bset	21181,#6
4036  0022 2014          	jra	L7212
4037  0024               L3312:
4038                     ; 1559       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
4040  0024 721d52bd      	bres	21181,#6
4041  0028 200e          	jra	L7212
4042  002a               L1312:
4043                     ; 1565     if (NewState != DISABLE)
4045  002a 7b02          	ld	a,(OFST+2,sp)
4046  002c 2706          	jreq	L1412
4047                     ; 1567       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
4049  002e 721452be      	bset	21182,#2
4051  0032 2004          	jra	L7212
4052  0034               L1412:
4053                     ; 1571       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
4055  0034 721552be      	bres	21182,#2
4056  0038               L7212:
4057                     ; 1574 }
4060  0038 85            	popw	x
4061  0039 87            	retf	
4226                     ; 1661 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
4226                     ; 1662                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4226                     ; 1663                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
4226                     ; 1664                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4226                     ; 1665                  uint8_t TIM1_ICFilter)
4226                     ; 1666 {
4227                     .text:	section	.text,new
4228  0000               f_TIM1_ICInit:
4230  0000 89            	pushw	x
4231       00000000      OFST:	set	0
4234                     ; 1669   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
4236                     ; 1670   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4238                     ; 1671   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4240                     ; 1672   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4242                     ; 1673   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
4244                     ; 1675   if (TIM1_Channel == TIM1_Channel_1)
4246  0001 9e            	ld	a,xh
4247  0002 4d            	tnz	a
4248  0003 2616          	jrne	L7322
4249                     ; 1678     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4251  0005 7b08          	ld	a,(OFST+8,sp)
4252  0007 88            	push	a
4253  0008 7b07          	ld	a,(OFST+7,sp)
4254  000a 97            	ld	xl,a
4255  000b 7b03          	ld	a,(OFST+3,sp)
4256  000d 95            	ld	xh,a
4257  000e 8d000000      	callf	L3f_TI1_Config
4259  0012 84            	pop	a
4260                     ; 1680     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4262  0013 7b07          	ld	a,(OFST+7,sp)
4263  0015 8d000000      	callf	f_TIM1_SetIC1Prescaler
4266  0019 204a          	jra	L1422
4267  001b               L7322:
4268                     ; 1682   else if (TIM1_Channel == TIM1_Channel_2)
4270  001b 7b01          	ld	a,(OFST+1,sp)
4271  001d a101          	cp	a,#1
4272  001f 2616          	jrne	L3422
4273                     ; 1685     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4275  0021 7b08          	ld	a,(OFST+8,sp)
4276  0023 88            	push	a
4277  0024 7b07          	ld	a,(OFST+7,sp)
4278  0026 97            	ld	xl,a
4279  0027 7b03          	ld	a,(OFST+3,sp)
4280  0029 95            	ld	xh,a
4281  002a 8d000000      	callf	L5f_TI2_Config
4283  002e 84            	pop	a
4284                     ; 1687     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4286  002f 7b07          	ld	a,(OFST+7,sp)
4287  0031 8d000000      	callf	f_TIM1_SetIC2Prescaler
4290  0035 202e          	jra	L1422
4291  0037               L3422:
4292                     ; 1689   else if (TIM1_Channel == TIM1_Channel_3)
4294  0037 a102          	cp	a,#2
4295  0039 2616          	jrne	L7422
4296                     ; 1692     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4298  003b 7b08          	ld	a,(OFST+8,sp)
4299  003d 88            	push	a
4300  003e 7b07          	ld	a,(OFST+7,sp)
4301  0040 97            	ld	xl,a
4302  0041 7b03          	ld	a,(OFST+3,sp)
4303  0043 95            	ld	xh,a
4304  0044 8d000000      	callf	L7f_TI3_Config
4306  0048 84            	pop	a
4307                     ; 1694     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
4309  0049 7b07          	ld	a,(OFST+7,sp)
4310  004b 8d000000      	callf	f_TIM1_SetIC3Prescaler
4313  004f 2014          	jra	L1422
4314  0051               L7422:
4315                     ; 1699     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4317  0051 7b08          	ld	a,(OFST+8,sp)
4318  0053 88            	push	a
4319  0054 7b07          	ld	a,(OFST+7,sp)
4320  0056 97            	ld	xl,a
4321  0057 7b03          	ld	a,(OFST+3,sp)
4322  0059 95            	ld	xh,a
4323  005a 8d000000      	callf	L11f_TI4_Config
4325  005e 84            	pop	a
4326                     ; 1701     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
4328  005f 7b07          	ld	a,(OFST+7,sp)
4329  0061 8d000000      	callf	f_TIM1_SetIC4Prescaler
4331  0065               L1422:
4332                     ; 1703 }
4335  0065 85            	popw	x
4336  0066 87            	retf	
4431                     ; 1730 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
4431                     ; 1731                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4431                     ; 1732                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
4431                     ; 1733                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4431                     ; 1734                      uint8_t TIM1_ICFilter)
4431                     ; 1735 {
4432                     .text:	section	.text,new
4433  0000               f_TIM1_PWMIConfig:
4435  0000 89            	pushw	x
4436  0001 89            	pushw	x
4437       00000002      OFST:	set	2
4440                     ; 1736   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
4442                     ; 1737   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
4444                     ; 1740   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
4446                     ; 1741   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4448                     ; 1742   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4450                     ; 1743   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4452                     ; 1746   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
4454  0002 9f            	ld	a,xl
4455  0003 4a            	dec	a
4456  0004 2702          	jreq	L7132
4457                     ; 1748     icpolarity = TIM1_ICPolarity_Falling;
4459  0006 a601          	ld	a,#1
4461  0008               L7132:
4462                     ; 1752     icpolarity = TIM1_ICPolarity_Rising;
4464  0008 6b01          	ld	(OFST-1,sp),a
4465                     ; 1756   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
4467  000a 7b08          	ld	a,(OFST+6,sp)
4468  000c 4a            	dec	a
4469  000d 2604          	jrne	L3232
4470                     ; 1758     icselection = TIM1_ICSelection_IndirectTI;
4472  000f a602          	ld	a,#2
4474  0011 2002          	jra	L5232
4475  0013               L3232:
4476                     ; 1762     icselection = TIM1_ICSelection_DirectTI;
4478  0013 a601          	ld	a,#1
4479  0015               L5232:
4480  0015 6b02          	ld	(OFST+0,sp),a
4481                     ; 1765   if (TIM1_Channel == TIM1_Channel_1)
4483  0017 7b03          	ld	a,(OFST+1,sp)
4484  0019 262a          	jrne	L7232
4485                     ; 1768     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4487  001b 7b0a          	ld	a,(OFST+8,sp)
4488  001d 88            	push	a
4489  001e 7b09          	ld	a,(OFST+7,sp)
4490  0020 97            	ld	xl,a
4491  0021 7b05          	ld	a,(OFST+3,sp)
4492  0023 95            	ld	xh,a
4493  0024 8d000000      	callf	L3f_TI1_Config
4495  0028 84            	pop	a
4496                     ; 1771     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4498  0029 7b09          	ld	a,(OFST+7,sp)
4499  002b 8d000000      	callf	f_TIM1_SetIC1Prescaler
4501                     ; 1774     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
4503  002f 7b0a          	ld	a,(OFST+8,sp)
4504  0031 88            	push	a
4505  0032 7b03          	ld	a,(OFST+1,sp)
4506  0034 97            	ld	xl,a
4507  0035 7b02          	ld	a,(OFST+0,sp)
4508  0037 95            	ld	xh,a
4509  0038 8d000000      	callf	L5f_TI2_Config
4511  003c 84            	pop	a
4512                     ; 1777     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4514  003d 7b09          	ld	a,(OFST+7,sp)
4515  003f 8d000000      	callf	f_TIM1_SetIC2Prescaler
4518  0043 2028          	jra	L1332
4519  0045               L7232:
4520                     ; 1782     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4522  0045 7b0a          	ld	a,(OFST+8,sp)
4523  0047 88            	push	a
4524  0048 7b09          	ld	a,(OFST+7,sp)
4525  004a 97            	ld	xl,a
4526  004b 7b05          	ld	a,(OFST+3,sp)
4527  004d 95            	ld	xh,a
4528  004e 8d000000      	callf	L5f_TI2_Config
4530  0052 84            	pop	a
4531                     ; 1785     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4533  0053 7b09          	ld	a,(OFST+7,sp)
4534  0055 8d000000      	callf	f_TIM1_SetIC2Prescaler
4536                     ; 1788     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
4538  0059 7b0a          	ld	a,(OFST+8,sp)
4539  005b 88            	push	a
4540  005c 7b03          	ld	a,(OFST+1,sp)
4541  005e 97            	ld	xl,a
4542  005f 7b02          	ld	a,(OFST+0,sp)
4543  0061 95            	ld	xh,a
4544  0062 8d000000      	callf	L3f_TI1_Config
4546  0066 84            	pop	a
4547                     ; 1791     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4549  0067 7b09          	ld	a,(OFST+7,sp)
4550  0069 8d000000      	callf	f_TIM1_SetIC1Prescaler
4552  006d               L1332:
4553                     ; 1793 }
4556  006d 5b04          	addw	sp,#4
4557  006f 87            	retf	
4602                     ; 1800 uint16_t TIM1_GetCapture1(void)
4602                     ; 1801 {
4603                     .text:	section	.text,new
4604  0000               f_TIM1_GetCapture1:
4606  0000 5204          	subw	sp,#4
4607       00000004      OFST:	set	4
4610                     ; 1804   uint16_t tmpccr1 = 0;
4612                     ; 1805   uint8_t tmpccr1l = 0, tmpccr1h = 0;
4616                     ; 1807   tmpccr1h = TIM1->CCR1H;
4618  0002 c652c6        	ld	a,21190
4619  0005 6b02          	ld	(OFST-2,sp),a
4620                     ; 1808   tmpccr1l = TIM1->CCR1L;
4622  0007 c652c7        	ld	a,21191
4623  000a 6b01          	ld	(OFST-3,sp),a
4624                     ; 1810   tmpccr1 = (uint16_t)(tmpccr1l);
4626  000c 5f            	clrw	x
4627  000d 97            	ld	xl,a
4628  000e 1f03          	ldw	(OFST-1,sp),x
4629                     ; 1811   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4631  0010 5f            	clrw	x
4632  0011 7b02          	ld	a,(OFST-2,sp)
4633  0013 97            	ld	xl,a
4634  0014 7b04          	ld	a,(OFST+0,sp)
4635  0016 01            	rrwa	x,a
4636  0017 1a03          	or	a,(OFST-1,sp)
4637  0019 01            	rrwa	x,a
4638                     ; 1813   return (uint16_t)tmpccr1;
4642  001a 5b04          	addw	sp,#4
4643  001c 87            	retf	
4688                     ; 1821 uint16_t TIM1_GetCapture2(void)
4688                     ; 1822 {
4689                     .text:	section	.text,new
4690  0000               f_TIM1_GetCapture2:
4692  0000 5204          	subw	sp,#4
4693       00000004      OFST:	set	4
4696                     ; 1825   uint16_t tmpccr2 = 0;
4698                     ; 1826   uint8_t tmpccr2l = 0, tmpccr2h = 0;
4702                     ; 1828   tmpccr2h = TIM1->CCR2H;
4704  0002 c652c8        	ld	a,21192
4705  0005 6b02          	ld	(OFST-2,sp),a
4706                     ; 1829   tmpccr2l = TIM1->CCR2L;
4708  0007 c652c9        	ld	a,21193
4709  000a 6b01          	ld	(OFST-3,sp),a
4710                     ; 1831   tmpccr2 = (uint16_t)(tmpccr2l);
4712  000c 5f            	clrw	x
4713  000d 97            	ld	xl,a
4714  000e 1f03          	ldw	(OFST-1,sp),x
4715                     ; 1832   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4717  0010 5f            	clrw	x
4718  0011 7b02          	ld	a,(OFST-2,sp)
4719  0013 97            	ld	xl,a
4720  0014 7b04          	ld	a,(OFST+0,sp)
4721  0016 01            	rrwa	x,a
4722  0017 1a03          	or	a,(OFST-1,sp)
4723  0019 01            	rrwa	x,a
4724                     ; 1834   return (uint16_t)tmpccr2;
4728  001a 5b04          	addw	sp,#4
4729  001c 87            	retf	
4774                     ; 1842 uint16_t TIM1_GetCapture3(void)
4774                     ; 1843 {
4775                     .text:	section	.text,new
4776  0000               f_TIM1_GetCapture3:
4778  0000 5204          	subw	sp,#4
4779       00000004      OFST:	set	4
4782                     ; 1845   uint16_t tmpccr3 = 0;
4784                     ; 1846   uint8_t tmpccr3l = 0, tmpccr3h = 0;
4788                     ; 1848   tmpccr3h = TIM1->CCR3H;
4790  0002 c652ca        	ld	a,21194
4791  0005 6b02          	ld	(OFST-2,sp),a
4792                     ; 1849   tmpccr3l = TIM1->CCR3L;
4794  0007 c652cb        	ld	a,21195
4795  000a 6b01          	ld	(OFST-3,sp),a
4796                     ; 1851   tmpccr3 = (uint16_t)(tmpccr3l);
4798  000c 5f            	clrw	x
4799  000d 97            	ld	xl,a
4800  000e 1f03          	ldw	(OFST-1,sp),x
4801                     ; 1852   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4803  0010 5f            	clrw	x
4804  0011 7b02          	ld	a,(OFST-2,sp)
4805  0013 97            	ld	xl,a
4806  0014 7b04          	ld	a,(OFST+0,sp)
4807  0016 01            	rrwa	x,a
4808  0017 1a03          	or	a,(OFST-1,sp)
4809  0019 01            	rrwa	x,a
4810                     ; 1854   return (uint16_t)tmpccr3;
4814  001a 5b04          	addw	sp,#4
4815  001c 87            	retf	
4860                     ; 1862 uint16_t TIM1_GetCapture4(void)
4860                     ; 1863 {
4861                     .text:	section	.text,new
4862  0000               f_TIM1_GetCapture4:
4864  0000 5204          	subw	sp,#4
4865       00000004      OFST:	set	4
4868                     ; 1865   uint16_t tmpccr4 = 0;
4870                     ; 1866   uint8_t tmpccr4l = 0, tmpccr4h = 0;
4874                     ; 1868   tmpccr4h = TIM1->CCR4H;
4876  0002 c652cc        	ld	a,21196
4877  0005 6b02          	ld	(OFST-2,sp),a
4878                     ; 1869   tmpccr4l = TIM1->CCR4L;
4880  0007 c652cd        	ld	a,21197
4881  000a 6b01          	ld	(OFST-3,sp),a
4882                     ; 1871   tmpccr4 = (uint16_t)(tmpccr4l);
4884  000c 5f            	clrw	x
4885  000d 97            	ld	xl,a
4886  000e 1f03          	ldw	(OFST-1,sp),x
4887                     ; 1872   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
4889  0010 5f            	clrw	x
4890  0011 7b02          	ld	a,(OFST-2,sp)
4891  0013 97            	ld	xl,a
4892  0014 7b04          	ld	a,(OFST+0,sp)
4893  0016 01            	rrwa	x,a
4894  0017 1a03          	or	a,(OFST-1,sp)
4895  0019 01            	rrwa	x,a
4896                     ; 1874   return (uint16_t)tmpccr4;
4900  001a 5b04          	addw	sp,#4
4901  001c 87            	retf	
4936                     ; 1887 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
4936                     ; 1888 {
4937                     .text:	section	.text,new
4938  0000               f_TIM1_SetIC1Prescaler:
4940  0000 88            	push	a
4941       00000000      OFST:	set	0
4944                     ; 1890   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
4946                     ; 1893   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
4948  0001 c652b9        	ld	a,21177
4949  0004 a4f3          	and	a,#243
4950  0006 1a01          	or	a,(OFST+1,sp)
4951  0008 c752b9        	ld	21177,a
4952                     ; 1894 }
4955  000b 84            	pop	a
4956  000c 87            	retf	
4991                     ; 1906 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
4991                     ; 1907 {
4992                     .text:	section	.text,new
4993  0000               f_TIM1_SetIC2Prescaler:
4995  0000 88            	push	a
4996       00000000      OFST:	set	0
4999                     ; 1909   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
5001                     ; 1912   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
5003  0001 c652ba        	ld	a,21178
5004  0004 a4f3          	and	a,#243
5005  0006 1a01          	or	a,(OFST+1,sp)
5006  0008 c752ba        	ld	21178,a
5007                     ; 1913 }
5010  000b 84            	pop	a
5011  000c 87            	retf	
5046                     ; 1925 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5046                     ; 1926 {
5047                     .text:	section	.text,new
5048  0000               f_TIM1_SetIC3Prescaler:
5050  0000 88            	push	a
5051       00000000      OFST:	set	0
5054                     ; 1929   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
5056                     ; 1932   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
5058  0001 c652bb        	ld	a,21179
5059  0004 a4f3          	and	a,#243
5060  0006 1a01          	or	a,(OFST+1,sp)
5061  0008 c752bb        	ld	21179,a
5062                     ; 1933 }
5065  000b 84            	pop	a
5066  000c 87            	retf	
5101                     ; 1945 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
5101                     ; 1946 {
5102                     .text:	section	.text,new
5103  0000               f_TIM1_SetIC4Prescaler:
5105  0000 88            	push	a
5106       00000000      OFST:	set	0
5109                     ; 1949   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
5111                     ; 1952   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
5113  0001 c652bc        	ld	a,21180
5114  0004 a4f3          	and	a,#243
5115  0006 1a01          	or	a,(OFST+1,sp)
5116  0008 c752bc        	ld	21180,a
5117                     ; 1953 }
5120  000b 84            	pop	a
5121  000c 87            	retf	
5227                     ; 1988 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
5227                     ; 1989 {
5228                     .text:	section	.text,new
5229  0000               f_TIM1_ITConfig:
5231  0000 89            	pushw	x
5232       00000000      OFST:	set	0
5235                     ; 1991   assert_param(IS_TIM1_IT(TIM1_IT));
5237                     ; 1992   assert_param(IS_FUNCTIONAL_STATE(NewState));
5239                     ; 1994   if (NewState != DISABLE)
5241  0001 9f            	ld	a,xl
5242  0002 4d            	tnz	a
5243  0003 2706          	jreq	L1752
5244                     ; 1997     TIM1->IER |= (uint8_t)TIM1_IT;
5246  0005 9e            	ld	a,xh
5247  0006 ca52b5        	or	a,21173
5249  0009 2006          	jra	L3752
5250  000b               L1752:
5251                     ; 2002     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
5253  000b 7b01          	ld	a,(OFST+1,sp)
5254  000d 43            	cpl	a
5255  000e c452b5        	and	a,21173
5256  0011               L3752:
5257  0011 c752b5        	ld	21173,a
5258                     ; 2004 }
5261  0014 85            	popw	x
5262  0015 87            	retf	
5366                     ; 2020 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5366                     ; 2021 {
5367                     .text:	section	.text,new
5368  0000               f_TIM1_GenerateEvent:
5372                     ; 2023   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
5374                     ; 2026   TIM1->EGR = (uint8_t)TIM1_EventSource;
5376  0000 c752b8        	ld	21176,a
5377                     ; 2027 }
5380  0003 87            	retf	
5549                     ; 2046 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
5549                     ; 2047 {
5550                     .text:	section	.text,new
5551  0000               f_TIM1_GetFlagStatus:
5553  0000 89            	pushw	x
5554  0001 89            	pushw	x
5555       00000002      OFST:	set	2
5558                     ; 2048   FlagStatus bitstatus = RESET;
5560                     ; 2049   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
5564                     ; 2052   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
5566                     ; 2054   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
5568  0002 9f            	ld	a,xl
5569  0003 c452b6        	and	a,21174
5570  0006 6b01          	ld	(OFST-1,sp),a
5571                     ; 2055   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
5573  0008 c652b7        	ld	a,21175
5574  000b 1403          	and	a,(OFST+1,sp)
5575  000d 6b02          	ld	(OFST+0,sp),a
5576                     ; 2057   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
5578  000f 1a01          	or	a,(OFST-1,sp)
5579  0011 2702          	jreq	L1372
5580                     ; 2059     bitstatus = SET;
5582  0013 a601          	ld	a,#1
5584  0015               L1372:
5585                     ; 2063     bitstatus = RESET;
5587                     ; 2065   return (FlagStatus)(bitstatus);
5591  0015 5b04          	addw	sp,#4
5592  0017 87            	retf	
5626                     ; 2086 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
5626                     ; 2087 {
5627                     .text:	section	.text,new
5628  0000               f_TIM1_ClearFlag:
5630  0000 89            	pushw	x
5631       00000000      OFST:	set	0
5634                     ; 2089   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
5636                     ; 2092   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
5638  0001 9f            	ld	a,xl
5639  0002 43            	cpl	a
5640  0003 c752b6        	ld	21174,a
5641                     ; 2093   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
5643  0006 7b01          	ld	a,(OFST+1,sp)
5644  0008 43            	cpl	a
5645  0009 a41e          	and	a,#30
5646  000b c752b7        	ld	21175,a
5647                     ; 2094 }
5650  000e 85            	popw	x
5651  000f 87            	retf	
5710                     ; 2111 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
5710                     ; 2112 {
5711                     .text:	section	.text,new
5712  0000               f_TIM1_GetITStatus:
5714  0000 88            	push	a
5715  0001 89            	pushw	x
5716       00000002      OFST:	set	2
5719                     ; 2113   ITStatus bitstatus = RESET;
5721                     ; 2115   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
5725                     ; 2118   assert_param(IS_TIM1_GET_IT(TIM1_IT));
5727                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
5729  0002 c452b6        	and	a,21174
5730  0005 6b01          	ld	(OFST-1,sp),a
5731                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
5733  0007 c652b5        	ld	a,21173
5734  000a 1403          	and	a,(OFST+1,sp)
5735  000c 6b02          	ld	(OFST+0,sp),a
5736                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
5738  000e 7b01          	ld	a,(OFST-1,sp)
5739  0010 2708          	jreq	L1003
5741  0012 7b02          	ld	a,(OFST+0,sp)
5742  0014 2704          	jreq	L1003
5743                     ; 2126     bitstatus = SET;
5745  0016 a601          	ld	a,#1
5747  0018 2001          	jra	L3003
5748  001a               L1003:
5749                     ; 2130     bitstatus = RESET;
5751  001a 4f            	clr	a
5752  001b               L3003:
5753                     ; 2132   return (ITStatus)(bitstatus);
5757  001b 5b03          	addw	sp,#3
5758  001d 87            	retf	
5793                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
5793                     ; 2150 {
5794                     .text:	section	.text,new
5795  0000               f_TIM1_ClearITPendingBit:
5799                     ; 2152   assert_param(IS_TIM1_IT(TIM1_IT));
5801                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
5803  0000 43            	cpl	a
5804  0001 c752b6        	ld	21174,a
5805                     ; 2156 }
5808  0004 87            	retf	
6345                     ; 2164 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
6345                     ; 2165                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
6345                     ; 2166 {
6346                     .text:	section	.text,new
6347  0000               f_TIM1_DMAConfig:
6351                     ; 2168   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
6353                     ; 2169   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
6355                     ; 2172   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
6357  0000 9e            	ld	a,xh
6358  0001 c752d1        	ld	21201,a
6359                     ; 2173   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
6361  0004 9f            	ld	a,xl
6362  0005 c752d2        	ld	21202,a
6363                     ; 2174 }
6366  0008 87            	retf	
6459                     ; 2186 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
6459                     ; 2187 {
6460                     .text:	section	.text,new
6461  0000               f_TIM1_DMACmd:
6463  0000 89            	pushw	x
6464       00000000      OFST:	set	0
6467                     ; 2189   assert_param(IS_FUNCTIONAL_STATE(NewState));
6469                     ; 2190   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
6471                     ; 2192   if (NewState != DISABLE)
6473  0001 9f            	ld	a,xl
6474  0002 4d            	tnz	a
6475  0003 2706          	jreq	L7133
6476                     ; 2195     TIM1->DER |= (uint8_t)TIM1_DMASource;
6478  0005 9e            	ld	a,xh
6479  0006 ca52b4        	or	a,21172
6481  0009 2006          	jra	L1233
6482  000b               L7133:
6483                     ; 2200     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
6485  000b 7b01          	ld	a,(OFST+1,sp)
6486  000d 43            	cpl	a
6487  000e c452b4        	and	a,21172
6488  0011               L1233:
6489  0011 c752b4        	ld	21172,a
6490                     ; 2202 }
6493  0014 85            	popw	x
6494  0015 87            	retf	
6528                     ; 2210 void TIM1_SelectCCDMA(FunctionalState NewState)
6528                     ; 2211 {
6529                     .text:	section	.text,new
6530  0000               f_TIM1_SelectCCDMA:
6534                     ; 2213   assert_param(IS_FUNCTIONAL_STATE(NewState));
6536                     ; 2215   if (NewState != DISABLE)
6538  0000 4d            	tnz	a
6539  0001 2705          	jreq	L1433
6540                     ; 2218     TIM1->CR2 |= TIM1_CR2_CCDS;
6542  0003 721652b1      	bset	21169,#3
6545  0007 87            	retf	
6546  0008               L1433:
6547                     ; 2223     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
6549  0008 721752b1      	bres	21169,#3
6550                     ; 2225 }
6553  000c 87            	retf	
6576                     ; 2248 void TIM1_InternalClockConfig(void)
6576                     ; 2249 {
6577                     .text:	section	.text,new
6578  0000               f_TIM1_InternalClockConfig:
6582                     ; 2251   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
6584  0000 c652b2        	ld	a,21170
6585  0003 a4f8          	and	a,#248
6586  0005 c752b2        	ld	21170,a
6587                     ; 2252 }
6590  0008 87            	retf	
6676                     ; 2269 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
6676                     ; 2270                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
6676                     ; 2271                                  uint8_t ICFilter)
6676                     ; 2272 {
6677                     .text:	section	.text,new
6678  0000               f_TIM1_TIxExternalClockConfig:
6680  0000 89            	pushw	x
6681       00000000      OFST:	set	0
6684                     ; 2274   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
6686                     ; 2275   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
6688                     ; 2276   assert_param(IS_TIM1_IC_FILTER(ICFilter));
6690                     ; 2279   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
6692  0001 9e            	ld	a,xh
6693  0002 a160          	cp	a,#96
6694  0004 260f          	jrne	L3143
6695                     ; 2281     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6697  0006 7b06          	ld	a,(OFST+6,sp)
6698  0008 88            	push	a
6699  0009 ae0001        	ldw	x,#1
6700  000c 7b03          	ld	a,(OFST+3,sp)
6701  000e 95            	ld	xh,a
6702  000f 8d000000      	callf	L5f_TI2_Config
6705  0013 200d          	jra	L5143
6706  0015               L3143:
6707                     ; 2285     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6709  0015 7b06          	ld	a,(OFST+6,sp)
6710  0017 88            	push	a
6711  0018 ae0001        	ldw	x,#1
6712  001b 7b03          	ld	a,(OFST+3,sp)
6713  001d 95            	ld	xh,a
6714  001e 8d000000      	callf	L3f_TI1_Config
6716  0022               L5143:
6717  0022 84            	pop	a
6718                     ; 2289   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
6720  0023 7b01          	ld	a,(OFST+1,sp)
6721  0025 8d000000      	callf	f_TIM1_SelectInputTrigger
6723                     ; 2292   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
6725  0029 c652b2        	ld	a,21170
6726  002c aa07          	or	a,#7
6727  002e c752b2        	ld	21170,a
6728                     ; 2293 }
6731  0031 85            	popw	x
6732  0032 87            	retf	
6846                     ; 2311 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
6846                     ; 2312                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
6846                     ; 2313                               uint8_t ExtTRGFilter)
6846                     ; 2314 {
6847                     .text:	section	.text,new
6848  0000               f_TIM1_ETRClockMode1Config:
6850  0000 89            	pushw	x
6851       00000000      OFST:	set	0
6854                     ; 2316   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
6856                     ; 2317   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
6858                     ; 2318   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
6860                     ; 2321   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
6862  0001 7b06          	ld	a,(OFST+6,sp)
6863  0003 88            	push	a
6864  0004 7b02          	ld	a,(OFST+2,sp)
6865  0006 95            	ld	xh,a
6866  0007 8d000000      	callf	f_TIM1_ETRConfig
6868  000b 84            	pop	a
6869                     ; 2324   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
6869                     ; 2325                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
6871  000c c652b2        	ld	a,21170
6872  000f aa77          	or	a,#119
6873  0011 c752b2        	ld	21170,a
6874                     ; 2326 }
6877  0014 85            	popw	x
6878  0015 87            	retf	
6933                     ; 2344 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
6933                     ; 2345                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
6933                     ; 2346                               uint8_t ExtTRGFilter)
6933                     ; 2347 {
6934                     .text:	section	.text,new
6935  0000               f_TIM1_ETRClockMode2Config:
6937  0000 89            	pushw	x
6938       00000000      OFST:	set	0
6941                     ; 2349   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
6943                     ; 2350   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
6945                     ; 2353   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
6947  0001 7b06          	ld	a,(OFST+6,sp)
6948  0003 88            	push	a
6949  0004 7b02          	ld	a,(OFST+2,sp)
6950  0006 95            	ld	xh,a
6951  0007 8d000000      	callf	f_TIM1_ETRConfig
6953  000b 721c52b3      	bset	21171,#6
6954  000f 84            	pop	a
6955                     ; 2356   TIM1->ETR |= TIM1_ETR_ECE;
6957                     ; 2357 }
6960  0010 85            	popw	x
6961  0011 87            	retf	
7067                     ; 2407 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
7067                     ; 2408 {
7068                     .text:	section	.text,new
7069  0000               f_TIM1_SelectInputTrigger:
7071  0000 88            	push	a
7072       00000000      OFST:	set	0
7075                     ; 2410   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
7077                     ; 2413   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
7079  0001 c652b2        	ld	a,21170
7080  0004 a48f          	and	a,#143
7081  0006 1a01          	or	a,(OFST+1,sp)
7082  0008 c752b2        	ld	21170,a
7083                     ; 2414 }
7086  000b 84            	pop	a
7087  000c 87            	retf	
7192                     ; 2430 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
7192                     ; 2431 {
7193                     .text:	section	.text,new
7194  0000               f_TIM1_SelectOutputTrigger:
7196  0000 88            	push	a
7197       00000000      OFST:	set	0
7200                     ; 2433   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
7202                     ; 2435   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
7204  0001 c652b1        	ld	a,21169
7205  0004 a48f          	and	a,#143
7206  0006 1a01          	or	a,(OFST+1,sp)
7207  0008 c752b1        	ld	21169,a
7208                     ; 2436 }
7211  000b 84            	pop	a
7212  000c 87            	retf	
7285                     ; 2448 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
7285                     ; 2449 {
7286                     .text:	section	.text,new
7287  0000               f_TIM1_SelectSlaveMode:
7289  0000 88            	push	a
7290       00000000      OFST:	set	0
7293                     ; 2451   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
7295                     ; 2454   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
7297  0001 c652b2        	ld	a,21170
7298  0004 a4f8          	and	a,#248
7299  0006 1a01          	or	a,(OFST+1,sp)
7300  0008 c752b2        	ld	21170,a
7301                     ; 2456 }
7304  000b 84            	pop	a
7305  000c 87            	retf	
7340                     ; 2464 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
7340                     ; 2465 {
7341                     .text:	section	.text,new
7342  0000               f_TIM1_SelectMasterSlaveMode:
7346                     ; 2467   assert_param(IS_FUNCTIONAL_STATE(NewState));
7348                     ; 2470   if (NewState != DISABLE)
7350  0000 4d            	tnz	a
7351  0001 2705          	jreq	L7663
7352                     ; 2472     TIM1->SMCR |= TIM1_SMCR_MSM;
7354  0003 721e52b2      	bset	21170,#7
7357  0007 87            	retf	
7358  0008               L7663:
7359                     ; 2476     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
7361  0008 721f52b2      	bres	21170,#7
7362                     ; 2478 }
7365  000c 87            	retf	
7418                     ; 2496 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7418                     ; 2497                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7418                     ; 2498                     uint8_t ExtTRGFilter)
7418                     ; 2499 {
7419                     .text:	section	.text,new
7420  0000               f_TIM1_ETRConfig:
7422  0000 89            	pushw	x
7423       00000000      OFST:	set	0
7426                     ; 2500   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7428                     ; 2503   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
7428                     ; 2504                                    | (uint8_t) TIM1_ExtTRGPolarity)
7428                     ; 2505                          | (uint8_t) ExtTRGFilter);
7430  0001 9f            	ld	a,xl
7431  0002 1a01          	or	a,(OFST+1,sp)
7432  0004 1a06          	or	a,(OFST+6,sp)
7433  0006 ca52b3        	or	a,21171
7434  0009 c752b3        	ld	21171,a
7435                     ; 2506 }
7438  000c 85            	popw	x
7439  000d 87            	retf	
7524                     ; 2544 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
7524                     ; 2545                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
7524                     ; 2546                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
7524                     ; 2547 {
7525                     .text:	section	.text,new
7526  0000               f_TIM1_EncoderInterfaceConfig:
7528  0000 89            	pushw	x
7529       00000000      OFST:	set	0
7532                     ; 2549   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
7534                     ; 2550   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
7536                     ; 2551   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
7538                     ; 2554   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
7540  0001 9f            	ld	a,xl
7541  0002 4d            	tnz	a
7542  0003 2706          	jreq	L7573
7543                     ; 2556     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7545  0005 721252bd      	bset	21181,#1
7547  0009 2004          	jra	L1673
7548  000b               L7573:
7549                     ; 2560     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7551  000b 721352bd      	bres	21181,#1
7552  000f               L1673:
7553                     ; 2563   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
7555  000f 7b06          	ld	a,(OFST+6,sp)
7556  0011 2706          	jreq	L3673
7557                     ; 2565     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7559  0013 721a52bd      	bset	21181,#5
7561  0017 2004          	jra	L5673
7562  0019               L3673:
7563                     ; 2569     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7565  0019 721b52bd      	bres	21181,#5
7566  001d               L5673:
7567                     ; 2572   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
7569  001d c652b2        	ld	a,21170
7570  0020 a4f0          	and	a,#240
7571  0022 1a01          	or	a,(OFST+1,sp)
7572  0024 c752b2        	ld	21170,a
7573                     ; 2575   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
7575  0027 c652b9        	ld	a,21177
7576  002a a4fc          	and	a,#252
7577  002c aa01          	or	a,#1
7578  002e c752b9        	ld	21177,a
7579                     ; 2576   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
7581  0031 c652ba        	ld	a,21178
7582  0034 a4fc          	and	a,#252
7583  0036 aa01          	or	a,#1
7584  0038 c752ba        	ld	21178,a
7585                     ; 2578 }
7588  003b 85            	popw	x
7589  003c 87            	retf	
7624                     ; 2586 void TIM1_SelectHallSensor(FunctionalState NewState)
7624                     ; 2587 {
7625                     .text:	section	.text,new
7626  0000               f_TIM1_SelectHallSensor:
7630                     ; 2589   assert_param(IS_FUNCTIONAL_STATE(NewState));
7632                     ; 2592   if (NewState != DISABLE)
7634  0000 4d            	tnz	a
7635  0001 2705          	jreq	L5004
7636                     ; 2594     TIM1->CR2 |= TIM1_CR2_TI1S;
7638  0003 721e52b1      	bset	21169,#7
7641  0007 87            	retf	
7642  0008               L5004:
7643                     ; 2598     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
7645  0008 721f52b1      	bres	21169,#7
7646                     ; 2600 }
7649  000c 87            	retf	
7694                     ; 2620 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7694                     ; 2621 {
7695                     .text:	section	.text,new
7696  0000               L3f_TI1_Config:
7698  0000 89            	pushw	x
7699  0001 88            	push	a
7700       00000001      OFST:	set	1
7703                     ; 2624   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7705  0002 721152bd      	bres	21181,#0
7706                     ; 2627   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7706                     ; 2628                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7708  0006 7b07          	ld	a,(OFST+6,sp)
7709  0008 97            	ld	xl,a
7710  0009 a610          	ld	a,#16
7711  000b 42            	mul	x,a
7712  000c 9f            	ld	a,xl
7713  000d 1a03          	or	a,(OFST+2,sp)
7714  000f 6b01          	ld	(OFST+0,sp),a
7715  0011 c652b9        	ld	a,21177
7716  0014 a40c          	and	a,#12
7717  0016 1a01          	or	a,(OFST+0,sp)
7718  0018 c752b9        	ld	21177,a
7719                     ; 2633   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7721  001b 7b02          	ld	a,(OFST+1,sp)
7722  001d 2706          	jreq	L1304
7723                     ; 2635     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7725  001f 721252bd      	bset	21181,#1
7727  0023 2004          	jra	L3304
7728  0025               L1304:
7729                     ; 2639     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7731  0025 721352bd      	bres	21181,#1
7732  0029               L3304:
7733                     ; 2643   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7735  0029 721052bd      	bset	21181,#0
7736                     ; 2644 }
7739  002d 5b03          	addw	sp,#3
7740  002f 87            	retf	
7785                     ; 2660 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7785                     ; 2661 {
7786                     .text:	section	.text,new
7787  0000               L5f_TI2_Config:
7789  0000 89            	pushw	x
7790  0001 88            	push	a
7791       00000001      OFST:	set	1
7794                     ; 2663   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7796  0002 721952bd      	bres	21181,#4
7797                     ; 2666   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7797                     ; 2667                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7799  0006 7b07          	ld	a,(OFST+6,sp)
7800  0008 97            	ld	xl,a
7801  0009 a610          	ld	a,#16
7802  000b 42            	mul	x,a
7803  000c 9f            	ld	a,xl
7804  000d 1a03          	or	a,(OFST+2,sp)
7805  000f 6b01          	ld	(OFST+0,sp),a
7806  0011 c652ba        	ld	a,21178
7807  0014 a40c          	and	a,#12
7808  0016 1a01          	or	a,(OFST+0,sp)
7809  0018 c752ba        	ld	21178,a
7810                     ; 2669   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7812  001b 7b02          	ld	a,(OFST+1,sp)
7813  001d 2706          	jreq	L5504
7814                     ; 2671     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7816  001f 721a52bd      	bset	21181,#5
7818  0023 2004          	jra	L7504
7819  0025               L5504:
7820                     ; 2675     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7822  0025 721b52bd      	bres	21181,#5
7823  0029               L7504:
7824                     ; 2678   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7826  0029 721852bd      	bset	21181,#4
7827                     ; 2679 }
7830  002d 5b03          	addw	sp,#3
7831  002f 87            	retf	
7876                     ; 2695 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7876                     ; 2696 {
7877                     .text:	section	.text,new
7878  0000               L7f_TI3_Config:
7880  0000 89            	pushw	x
7881  0001 88            	push	a
7882       00000001      OFST:	set	1
7885                     ; 2698   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7887  0002 721152be      	bres	21182,#0
7888                     ; 2701   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7888                     ; 2702                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7890  0006 7b07          	ld	a,(OFST+6,sp)
7891  0008 97            	ld	xl,a
7892  0009 a610          	ld	a,#16
7893  000b 42            	mul	x,a
7894  000c 9f            	ld	a,xl
7895  000d 1a03          	or	a,(OFST+2,sp)
7896  000f 6b01          	ld	(OFST+0,sp),a
7897  0011 c652bb        	ld	a,21179
7898  0014 a40c          	and	a,#12
7899  0016 1a01          	or	a,(OFST+0,sp)
7900  0018 c752bb        	ld	21179,a
7901                     ; 2705   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7903  001b 7b02          	ld	a,(OFST+1,sp)
7904  001d 2706          	jreq	L1014
7905                     ; 2707     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7907  001f 721252be      	bset	21182,#1
7909  0023 2004          	jra	L3014
7910  0025               L1014:
7911                     ; 2711     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7913  0025 721352be      	bres	21182,#1
7914  0029               L3014:
7915                     ; 2714   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7917  0029 721052be      	bset	21182,#0
7918                     ; 2715 }
7921  002d 5b03          	addw	sp,#3
7922  002f 87            	retf	
7967                     ; 2730 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7967                     ; 2731 {
7968                     .text:	section	.text,new
7969  0000               L11f_TI4_Config:
7971  0000 89            	pushw	x
7972  0001 88            	push	a
7973       00000001      OFST:	set	1
7976                     ; 2734   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7978  0002 721952be      	bres	21182,#4
7979                     ; 2737   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7979                     ; 2738                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7981  0006 7b07          	ld	a,(OFST+6,sp)
7982  0008 97            	ld	xl,a
7983  0009 a610          	ld	a,#16
7984  000b 42            	mul	x,a
7985  000c 9f            	ld	a,xl
7986  000d 1a03          	or	a,(OFST+2,sp)
7987  000f 6b01          	ld	(OFST+0,sp),a
7988  0011 c652bc        	ld	a,21180
7989  0014 a40c          	and	a,#12
7990  0016 1a01          	or	a,(OFST+0,sp)
7991  0018 c752bc        	ld	21180,a
7992                     ; 2741   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7994  001b 7b02          	ld	a,(OFST+1,sp)
7995  001d 2706          	jreq	L5214
7996                     ; 2743     TIM1->CCER2 |= TIM1_CCER2_CC4P;
7998  001f 721a52be      	bset	21182,#5
8000  0023 2004          	jra	L7214
8001  0025               L5214:
8002                     ; 2747     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
8004  0025 721b52be      	bres	21182,#5
8005  0029               L7214:
8006                     ; 2751   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
8008  0029 721852be      	bset	21182,#4
8009                     ; 2752 }
8012  002d 5b03          	addw	sp,#3
8013  002f 87            	retf	
8025                     	xdef	f_TIM1_SelectHallSensor
8026                     	xdef	f_TIM1_EncoderInterfaceConfig
8027                     	xdef	f_TIM1_ETRConfig
8028                     	xdef	f_TIM1_SelectMasterSlaveMode
8029                     	xdef	f_TIM1_SelectSlaveMode
8030                     	xdef	f_TIM1_SelectOutputTrigger
8031                     	xdef	f_TIM1_SelectInputTrigger
8032                     	xdef	f_TIM1_ETRClockMode2Config
8033                     	xdef	f_TIM1_ETRClockMode1Config
8034                     	xdef	f_TIM1_TIxExternalClockConfig
8035                     	xdef	f_TIM1_InternalClockConfig
8036                     	xdef	f_TIM1_SelectCCDMA
8037                     	xdef	f_TIM1_DMACmd
8038                     	xdef	f_TIM1_DMAConfig
8039                     	xdef	f_TIM1_ClearITPendingBit
8040                     	xdef	f_TIM1_GetITStatus
8041                     	xdef	f_TIM1_ClearFlag
8042                     	xdef	f_TIM1_GetFlagStatus
8043                     	xdef	f_TIM1_GenerateEvent
8044                     	xdef	f_TIM1_ITConfig
8045                     	xdef	f_TIM1_SetIC4Prescaler
8046                     	xdef	f_TIM1_SetIC3Prescaler
8047                     	xdef	f_TIM1_SetIC2Prescaler
8048                     	xdef	f_TIM1_SetIC1Prescaler
8049                     	xdef	f_TIM1_GetCapture4
8050                     	xdef	f_TIM1_GetCapture3
8051                     	xdef	f_TIM1_GetCapture2
8052                     	xdef	f_TIM1_GetCapture1
8053                     	xdef	f_TIM1_PWMIConfig
8054                     	xdef	f_TIM1_ICInit
8055                     	xdef	f_TIM1_CCxNCmd
8056                     	xdef	f_TIM1_CCxCmd
8057                     	xdef	f_TIM1_SelectCOM
8058                     	xdef	f_TIM1_SelectOCREFClear
8059                     	xdef	f_TIM1_OC3NPolarityConfig
8060                     	xdef	f_TIM1_OC3PolarityConfig
8061                     	xdef	f_TIM1_OC2NPolarityConfig
8062                     	xdef	f_TIM1_OC2PolarityConfig
8063                     	xdef	f_TIM1_OC1NPolarityConfig
8064                     	xdef	f_TIM1_OC1PolarityConfig
8065                     	xdef	f_TIM1_ClearOC4Ref
8066                     	xdef	f_TIM1_ClearOC3Ref
8067                     	xdef	f_TIM1_ClearOC2Ref
8068                     	xdef	f_TIM1_ClearOC1Ref
8069                     	xdef	f_TIM1_OC3FastConfig
8070                     	xdef	f_TIM1_OC2FastConfig
8071                     	xdef	f_TIM1_OC1FastConfig
8072                     	xdef	f_TIM1_OC4PreloadConfig
8073                     	xdef	f_TIM1_OC3PreloadConfig
8074                     	xdef	f_TIM1_OC2PreloadConfig
8075                     	xdef	f_TIM1_OC1PreloadConfig
8076                     	xdef	f_TIM1_ForcedOC3Config
8077                     	xdef	f_TIM1_ForcedOC2Config
8078                     	xdef	f_TIM1_ForcedOC1Config
8079                     	xdef	f_TIM1_CCPreloadControl
8080                     	xdef	f_TIM1_SetCompare4
8081                     	xdef	f_TIM1_SetCompare3
8082                     	xdef	f_TIM1_SetCompare2
8083                     	xdef	f_TIM1_SetCompare1
8084                     	xdef	f_TIM1_SelectOCxM
8085                     	xdef	f_TIM1_CtrlPWMOutputs
8086                     	xdef	f_TIM1_BDTRConfig
8087                     	xdef	f_TIM1_OC3Init
8088                     	xdef	f_TIM1_OC2Init
8089                     	xdef	f_TIM1_OC1Init
8090                     	xdef	f_TIM1_Cmd
8091                     	xdef	f_TIM1_SelectOnePulseMode
8092                     	xdef	f_TIM1_ARRPreloadConfig
8093                     	xdef	f_TIM1_UpdateRequestConfig
8094                     	xdef	f_TIM1_UpdateDisableConfig
8095                     	xdef	f_TIM1_GetPrescaler
8096                     	xdef	f_TIM1_GetCounter
8097                     	xdef	f_TIM1_SetAutoreload
8098                     	xdef	f_TIM1_SetCounter
8099                     	xdef	f_TIM1_CounterModeConfig
8100                     	xdef	f_TIM1_PrescalerConfig
8101                     	xdef	f_TIM1_TimeBaseInit
8102                     	xdef	f_TIM1_DeInit
8121                     	end
