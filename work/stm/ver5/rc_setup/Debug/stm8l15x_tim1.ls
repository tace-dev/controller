   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  47                     ; 178 void TIM1_DeInit(void)
  47                     ; 179 {
  49                     .text:	section	.text,new
  50  0000               _TIM1_DeInit:
  54                     ; 180   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  56  0000 725f52b0      	clr	21168
  57                     ; 181   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  59  0004 725f52b1      	clr	21169
  60                     ; 182   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  62  0008 725f52b2      	clr	21170
  63                     ; 183   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  65  000c 725f52b3      	clr	21171
  66                     ; 184   TIM1->IER  = TIM1_IER_RESET_VALUE;
  68  0010 725f52b5      	clr	21173
  69                     ; 187   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  71  0014 725f52bd      	clr	21181
  72                     ; 188   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  74  0018 725f52be      	clr	21182
  75                     ; 190   TIM1->CCMR1 = 0x01;
  77  001c 350152b9      	mov	21177,#1
  78                     ; 191   TIM1->CCMR2 = 0x01;
  80  0020 350152ba      	mov	21178,#1
  81                     ; 192   TIM1->CCMR3 = 0x01;
  83  0024 350152bb      	mov	21179,#1
  84                     ; 193   TIM1->CCMR4 = 0x01;
  86  0028 350152bc      	mov	21180,#1
  87                     ; 195   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  89  002c 725f52bd      	clr	21181
  90                     ; 196   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  92  0030 725f52be      	clr	21182
  93                     ; 197   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  95  0034 725f52b9      	clr	21177
  96                     ; 198   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  98  0038 725f52ba      	clr	21178
  99                     ; 199   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 101  003c 725f52bb      	clr	21179
 102                     ; 200   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 104  0040 725f52bc      	clr	21180
 105                     ; 201   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 107  0044 725f52bf      	clr	21183
 108                     ; 202   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 110  0048 725f52c0      	clr	21184
 111                     ; 203   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 113  004c 725f52c1      	clr	21185
 114                     ; 204   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 116  0050 725f52c2      	clr	21186
 117                     ; 205   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 119  0054 35ff52c3      	mov	21187,#255
 120                     ; 206   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 122  0058 35ff52c4      	mov	21188,#255
 123                     ; 207   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 125  005c 725f52c6      	clr	21190
 126                     ; 208   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 128  0060 725f52c7      	clr	21191
 129                     ; 209   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 131  0064 725f52c8      	clr	21192
 132                     ; 210   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 134  0068 725f52c9      	clr	21193
 135                     ; 211   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 137  006c 725f52ca      	clr	21194
 138                     ; 212   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 140  0070 725f52cb      	clr	21195
 141                     ; 213   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 143  0074 725f52cc      	clr	21196
 144                     ; 214   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 146  0078 725f52cd      	clr	21197
 147                     ; 215   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 149  007c 725f52d0      	clr	21200
 150                     ; 216   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 152  0080 350152b8      	mov	21176,#1
 153                     ; 217   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 155  0084 725f52cf      	clr	21199
 156                     ; 218   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 158  0088 725f52ce      	clr	21198
 159                     ; 219   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 161  008c 725f52c5      	clr	21189
 162                     ; 220   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 164  0090 725f52b6      	clr	21174
 165                     ; 221   TIM1->SR2   = TIM1_SR2_RESET_VALUE;
 167  0094 725f52b7      	clr	21175
 168                     ; 222 }
 171  0098 81            	ret
 274                     ; 238 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 274                     ; 239                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 274                     ; 240                        uint16_t TIM1_Period,
 274                     ; 241                        uint8_t TIM1_RepetitionCounter)
 274                     ; 242 {
 275                     .text:	section	.text,new
 276  0000               _TIM1_TimeBaseInit:
 278  0000 89            	pushw	x
 279       00000000      OFST:	set	0
 282                     ; 244   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 284                     ; 248   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 286  0001 7b06          	ld	a,(OFST+6,sp)
 287  0003 c752c3        	ld	21187,a
 288                     ; 249   TIM1->ARRL = (uint8_t)(TIM1_Period);
 290  0006 7b07          	ld	a,(OFST+7,sp)
 291  0008 c752c4        	ld	21188,a
 292                     ; 252   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 294  000b 9e            	ld	a,xh
 295  000c c752c1        	ld	21185,a
 296                     ; 253   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 298  000f 9f            	ld	a,xl
 299  0010 c752c2        	ld	21186,a
 300                     ; 256   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 300                     ; 257                         | (uint8_t)(TIM1_CounterMode));
 302  0013 c652b0        	ld	a,21168
 303  0016 a48f          	and	a,#143
 304  0018 1a05          	or	a,(OFST+5,sp)
 305  001a c752b0        	ld	21168,a
 306                     ; 260   TIM1->RCR = TIM1_RepetitionCounter;
 308  001d 7b08          	ld	a,(OFST+8,sp)
 309  001f c752c5        	ld	21189,a
 310                     ; 262 }
 313  0022 85            	popw	x
 314  0023 81            	ret
 379                     ; 276 void TIM1_PrescalerConfig(uint16_t Prescaler, TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 379                     ; 277 {
 380                     .text:	section	.text,new
 381  0000               _TIM1_PrescalerConfig:
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
 399  0009 7b05          	ld	a,(OFST+5,sp)
 400  000b c752b8        	ld	21176,a
 401                     ; 287 }
 404  000e 85            	popw	x
 405  000f 81            	ret
 441                     ; 300 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 441                     ; 301 {
 442                     .text:	section	.text,new
 443  0000               _TIM1_CounterModeConfig:
 445  0000 88            	push	a
 446       00000000      OFST:	set	0
 449                     ; 303   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 451                     ; 307   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 451                     ; 308                         | (uint8_t)TIM1_CounterMode);
 453  0001 c652b0        	ld	a,21168
 454  0004 a48f          	and	a,#143
 455  0006 1a01          	or	a,(OFST+1,sp)
 456  0008 c752b0        	ld	21168,a
 457                     ; 309 }
 460  000b 84            	pop	a
 461  000c 81            	ret
 493                     ; 317 void TIM1_SetCounter(uint16_t Counter)
 493                     ; 318 {
 494                     .text:	section	.text,new
 495  0000               _TIM1_SetCounter:
 499                     ; 320   TIM1->CNTRH = (uint8_t)(Counter >> 8);
 501  0000 9e            	ld	a,xh
 502  0001 c752bf        	ld	21183,a
 503                     ; 321   TIM1->CNTRL = (uint8_t)(Counter);
 505  0004 9f            	ld	a,xl
 506  0005 c752c0        	ld	21184,a
 507                     ; 322 }
 510  0008 81            	ret
 542                     ; 330 void TIM1_SetAutoreload(uint16_t Autoreload)
 542                     ; 331 {
 543                     .text:	section	.text,new
 544  0000               _TIM1_SetAutoreload:
 548                     ; 333   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
 550  0000 9e            	ld	a,xh
 551  0001 c752c3        	ld	21187,a
 552                     ; 334   TIM1->ARRL = (uint8_t)(Autoreload);
 554  0004 9f            	ld	a,xl
 555  0005 c752c4        	ld	21188,a
 556                     ; 335 }
 559  0008 81            	ret
 605                     ; 342 uint16_t TIM1_GetCounter(void)
 605                     ; 343 {
 606                     .text:	section	.text,new
 607  0000               _TIM1_GetCounter:
 609  0000 5204          	subw	sp,#4
 610       00000004      OFST:	set	4
 613                     ; 345   uint16_t tmpcntr = 0;
 615                     ; 346   uint8_t tmpcntrl = 0, tmpcntrh = 0;
 619                     ; 348   tmpcntrh = TIM1->CNTRH;
 621  0002 c652bf        	ld	a,21183
 622  0005 6b02          	ld	(OFST-2,sp),a
 623                     ; 349   tmpcntrl = TIM1->CNTRL;
 625  0007 c652c0        	ld	a,21184
 626  000a 6b01          	ld	(OFST-3,sp),a
 627                     ; 351   tmpcntr  = (uint16_t)(tmpcntrl);
 629  000c 7b01          	ld	a,(OFST-3,sp)
 630  000e 5f            	clrw	x
 631  000f 97            	ld	xl,a
 632  0010 1f03          	ldw	(OFST-1,sp),x
 633                     ; 352   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
 635  0012 7b02          	ld	a,(OFST-2,sp)
 636  0014 5f            	clrw	x
 637  0015 97            	ld	xl,a
 638  0016 4f            	clr	a
 639  0017 02            	rlwa	x,a
 640  0018 01            	rrwa	x,a
 641  0019 1a04          	or	a,(OFST+0,sp)
 642  001b 01            	rrwa	x,a
 643  001c 1a03          	or	a,(OFST-1,sp)
 644  001e 01            	rrwa	x,a
 645  001f 1f03          	ldw	(OFST-1,sp),x
 646                     ; 355   return (uint16_t)tmpcntr;
 648  0021 1e03          	ldw	x,(OFST-1,sp)
 651  0023 5b04          	addw	sp,#4
 652  0025 81            	ret
 684                     ; 363 uint16_t TIM1_GetPrescaler(void)
 684                     ; 364 {
 685                     .text:	section	.text,new
 686  0000               _TIM1_GetPrescaler:
 688  0000 89            	pushw	x
 689       00000002      OFST:	set	2
 692                     ; 365   uint16_t tmpreg = 0;
 694                     ; 366   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
 696  0001 c652c1        	ld	a,21185
 697  0004 5f            	clrw	x
 698  0005 97            	ld	xl,a
 699  0006 4f            	clr	a
 700  0007 02            	rlwa	x,a
 701  0008 1f01          	ldw	(OFST-1,sp),x
 702                     ; 368   return (uint16_t)(tmpreg | TIM1->PSCRL);
 704  000a c652c2        	ld	a,21186
 705  000d 5f            	clrw	x
 706  000e 97            	ld	xl,a
 707  000f 01            	rrwa	x,a
 708  0010 1a02          	or	a,(OFST+0,sp)
 709  0012 01            	rrwa	x,a
 710  0013 1a01          	or	a,(OFST-1,sp)
 711  0015 01            	rrwa	x,a
 714  0016 5b02          	addw	sp,#2
 715  0018 81            	ret
 771                     ; 377 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 771                     ; 378 {
 772                     .text:	section	.text,new
 773  0000               _TIM1_UpdateDisableConfig:
 777                     ; 380   assert_param(IS_FUNCTIONAL_STATE(NewState));
 779                     ; 383   if (NewState != DISABLE)
 781  0000 4d            	tnz	a
 782  0001 2706          	jreq	L352
 783                     ; 385     TIM1->CR1 |= TIM1_CR1_UDIS;
 785  0003 721252b0      	bset	21168,#1
 787  0007 2004          	jra	L552
 788  0009               L352:
 789                     ; 389     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 791  0009 721352b0      	bres	21168,#1
 792  000d               L552:
 793                     ; 391 }
 796  000d 81            	ret
 854                     ; 401 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 854                     ; 402 {
 855                     .text:	section	.text,new
 856  0000               _TIM1_UpdateRequestConfig:
 860                     ; 404   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
 862                     ; 407   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
 864  0000 4d            	tnz	a
 865  0001 2706          	jreq	L503
 866                     ; 409     TIM1->CR1 |= TIM1_CR1_URS;
 868  0003 721452b0      	bset	21168,#2
 870  0007 2004          	jra	L703
 871  0009               L503:
 872                     ; 413     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 874  0009 721552b0      	bres	21168,#2
 875  000d               L703:
 876                     ; 415 }
 879  000d 81            	ret
 915                     ; 423 void TIM1_ARRPreloadConfig(FunctionalState NewState)
 915                     ; 424 {
 916                     .text:	section	.text,new
 917  0000               _TIM1_ARRPreloadConfig:
 921                     ; 426   assert_param(IS_FUNCTIONAL_STATE(NewState));
 923                     ; 429   if (NewState != DISABLE)
 925  0000 4d            	tnz	a
 926  0001 2706          	jreq	L723
 927                     ; 431     TIM1->CR1 |= TIM1_CR1_ARPE;
 929  0003 721e52b0      	bset	21168,#7
 931  0007 2004          	jra	L133
 932  0009               L723:
 933                     ; 435     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
 935  0009 721f52b0      	bres	21168,#7
 936  000d               L133:
 937                     ; 437 }
 940  000d 81            	ret
 997                     ; 447 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
 997                     ; 448 {
 998                     .text:	section	.text,new
 999  0000               _TIM1_SelectOnePulseMode:
1003                     ; 450   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
1005                     ; 453   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
1007  0000 4d            	tnz	a
1008  0001 2706          	jreq	L163
1009                     ; 455     TIM1->CR1 |= TIM1_CR1_OPM;
1011  0003 721652b0      	bset	21168,#3
1013  0007 2004          	jra	L363
1014  0009               L163:
1015                     ; 459     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
1017  0009 721752b0      	bres	21168,#3
1018  000d               L363:
1019                     ; 461 }
1022  000d 81            	ret
1057                     ; 469 void TIM1_Cmd(FunctionalState NewState)
1057                     ; 470 {
1058                     .text:	section	.text,new
1059  0000               _TIM1_Cmd:
1063                     ; 472   assert_param(IS_FUNCTIONAL_STATE(NewState));
1065                     ; 475   if (NewState != DISABLE)
1067  0000 4d            	tnz	a
1068  0001 2706          	jreq	L304
1069                     ; 477     TIM1->CR1 |= TIM1_CR1_CEN;
1071  0003 721052b0      	bset	21168,#0
1073  0007 2004          	jra	L504
1074  0009               L304:
1075                     ; 481     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1077  0009 721152b0      	bres	21168,#0
1078  000d               L504:
1079                     ; 483 }
1082  000d 81            	ret
1365                     ; 574 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1365                     ; 575                   TIM1_OutputState_TypeDef TIM1_OutputState,
1365                     ; 576                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1365                     ; 577                   uint16_t TIM1_Pulse,
1365                     ; 578                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1365                     ; 579                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1365                     ; 580                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1365                     ; 581                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1365                     ; 582 {
1366                     .text:	section	.text,new
1367  0000               _TIM1_OC1Init:
1369  0000 89            	pushw	x
1370  0001 5203          	subw	sp,#3
1371       00000003      OFST:	set	3
1374                     ; 584   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1376                     ; 585   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1378                     ; 586   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1380                     ; 587   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1382                     ; 588   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1384                     ; 589   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1386                     ; 590   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1388                     ; 594   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
1388                     ; 595                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
1390  0003 c652bd        	ld	a,21181
1391  0006 a4f0          	and	a,#240
1392  0008 c752bd        	ld	21181,a
1393                     ; 598   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
1393                     ; 599                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
1393                     ; 600                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
1393                     ; 601                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
1395  000b 7b0c          	ld	a,(OFST+9,sp)
1396  000d a408          	and	a,#8
1397  000f 6b03          	ld	(OFST+0,sp),a
1398  0011 7b0b          	ld	a,(OFST+8,sp)
1399  0013 a402          	and	a,#2
1400  0015 1a03          	or	a,(OFST+0,sp)
1401  0017 6b02          	ld	(OFST-1,sp),a
1402  0019 7b08          	ld	a,(OFST+5,sp)
1403  001b a404          	and	a,#4
1404  001d 6b01          	ld	(OFST-2,sp),a
1405  001f 9f            	ld	a,xl
1406  0020 a401          	and	a,#1
1407  0022 1a01          	or	a,(OFST-2,sp)
1408  0024 1a02          	or	a,(OFST-1,sp)
1409  0026 ca52bd        	or	a,21181
1410  0029 c752bd        	ld	21181,a
1411                     ; 604   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
1411                     ; 605                           | (uint8_t)TIM1_OCMode);
1413  002c c652b9        	ld	a,21177
1414  002f a48f          	and	a,#143
1415  0031 1a04          	or	a,(OFST+1,sp)
1416  0033 c752b9        	ld	21177,a
1417                     ; 608   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
1419  0036 c652d0        	ld	a,21200
1420  0039 a4fc          	and	a,#252
1421  003b c752d0        	ld	21200,a
1422                     ; 610   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
1422                     ; 611                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
1424  003e 7b0e          	ld	a,(OFST+11,sp)
1425  0040 a402          	and	a,#2
1426  0042 6b03          	ld	(OFST+0,sp),a
1427  0044 7b0d          	ld	a,(OFST+10,sp)
1428  0046 a401          	and	a,#1
1429  0048 1a03          	or	a,(OFST+0,sp)
1430  004a ca52d0        	or	a,21200
1431  004d c752d0        	ld	21200,a
1432                     ; 614   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
1434  0050 7b09          	ld	a,(OFST+6,sp)
1435  0052 c752c6        	ld	21190,a
1436                     ; 615   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
1438  0055 7b0a          	ld	a,(OFST+7,sp)
1439  0057 c752c7        	ld	21191,a
1440                     ; 616 }
1443  005a 5b05          	addw	sp,#5
1444  005c 81            	ret
1546                     ; 655 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1546                     ; 656                   TIM1_OutputState_TypeDef TIM1_OutputState,
1546                     ; 657                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1546                     ; 658                   uint16_t TIM1_Pulse,
1546                     ; 659                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1546                     ; 660                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1546                     ; 661                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1546                     ; 662                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1546                     ; 663 {
1547                     .text:	section	.text,new
1548  0000               _TIM1_OC2Init:
1550  0000 89            	pushw	x
1551  0001 5203          	subw	sp,#3
1552       00000003      OFST:	set	3
1555                     ; 666   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1557                     ; 667   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1559                     ; 668   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1561                     ; 669   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1563                     ; 670   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1565                     ; 671   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1567                     ; 672   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1569                     ; 676   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1571  0003 c652bd        	ld	a,21181
1572  0006 a40f          	and	a,#15
1573  0008 c752bd        	ld	21181,a
1574                     ; 679   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
1574                     ; 680                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
1576  000b 7b0c          	ld	a,(OFST+9,sp)
1577  000d a480          	and	a,#128
1578  000f 6b03          	ld	(OFST+0,sp),a
1579  0011 7b0b          	ld	a,(OFST+8,sp)
1580  0013 a420          	and	a,#32
1581  0015 1a03          	or	a,(OFST+0,sp)
1582  0017 6b02          	ld	(OFST-1,sp),a
1583  0019 7b08          	ld	a,(OFST+5,sp)
1584  001b a440          	and	a,#64
1585  001d 6b01          	ld	(OFST-2,sp),a
1586  001f 9f            	ld	a,xl
1587  0020 a410          	and	a,#16
1588  0022 1a01          	or	a,(OFST-2,sp)
1589  0024 1a02          	or	a,(OFST-1,sp)
1590  0026 ca52bd        	or	a,21181
1591  0029 c752bd        	ld	21181,a
1592                     ; 683   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1594  002c c652ba        	ld	a,21178
1595  002f a48f          	and	a,#143
1596  0031 1a04          	or	a,(OFST+1,sp)
1597  0033 c752ba        	ld	21178,a
1598                     ; 686   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1600  0036 c652d0        	ld	a,21200
1601  0039 a4f3          	and	a,#243
1602  003b c752d0        	ld	21200,a
1603                     ; 688   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1605  003e 7b0e          	ld	a,(OFST+11,sp)
1606  0040 a408          	and	a,#8
1607  0042 6b03          	ld	(OFST+0,sp),a
1608  0044 7b0d          	ld	a,(OFST+10,sp)
1609  0046 a404          	and	a,#4
1610  0048 1a03          	or	a,(OFST+0,sp)
1611  004a ca52d0        	or	a,21200
1612  004d c752d0        	ld	21200,a
1613                     ; 691   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1615  0050 7b09          	ld	a,(OFST+6,sp)
1616  0052 c752c8        	ld	21192,a
1617                     ; 692   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1619  0055 7b0a          	ld	a,(OFST+7,sp)
1620  0057 c752c9        	ld	21193,a
1621                     ; 693 }
1624  005a 5b05          	addw	sp,#5
1625  005c 81            	ret
1727                     ; 732 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1727                     ; 733                   TIM1_OutputState_TypeDef TIM1_OutputState,
1727                     ; 734                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1727                     ; 735                   uint16_t TIM1_Pulse,
1727                     ; 736                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1727                     ; 737                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1727                     ; 738                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1727                     ; 739                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1727                     ; 740 {
1728                     .text:	section	.text,new
1729  0000               _TIM1_OC3Init:
1731  0000 89            	pushw	x
1732  0001 5203          	subw	sp,#3
1733       00000003      OFST:	set	3
1736                     ; 743   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1738                     ; 744   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1740                     ; 745   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1742                     ; 746   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1744                     ; 747   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1746                     ; 748   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1748                     ; 749   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1750                     ; 753   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1752  0003 c652be        	ld	a,21182
1753  0006 a4f0          	and	a,#240
1754  0008 c752be        	ld	21182,a
1755                     ; 756   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
1755                     ; 757                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
1757  000b 7b0c          	ld	a,(OFST+9,sp)
1758  000d a408          	and	a,#8
1759  000f 6b03          	ld	(OFST+0,sp),a
1760  0011 7b0b          	ld	a,(OFST+8,sp)
1761  0013 a402          	and	a,#2
1762  0015 1a03          	or	a,(OFST+0,sp)
1763  0017 6b02          	ld	(OFST-1,sp),a
1764  0019 7b08          	ld	a,(OFST+5,sp)
1765  001b a404          	and	a,#4
1766  001d 6b01          	ld	(OFST-2,sp),a
1767  001f 9f            	ld	a,xl
1768  0020 a401          	and	a,#1
1769  0022 1a01          	or	a,(OFST-2,sp)
1770  0024 1a02          	or	a,(OFST-1,sp)
1771  0026 ca52be        	or	a,21182
1772  0029 c752be        	ld	21182,a
1773                     ; 760   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1775  002c c652bb        	ld	a,21179
1776  002f a48f          	and	a,#143
1777  0031 1a04          	or	a,(OFST+1,sp)
1778  0033 c752bb        	ld	21179,a
1779                     ; 763   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1781  0036 c652d0        	ld	a,21200
1782  0039 a4cf          	and	a,#207
1783  003b c752d0        	ld	21200,a
1784                     ; 765   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1786  003e 7b0e          	ld	a,(OFST+11,sp)
1787  0040 a420          	and	a,#32
1788  0042 6b03          	ld	(OFST+0,sp),a
1789  0044 7b0d          	ld	a,(OFST+10,sp)
1790  0046 a410          	and	a,#16
1791  0048 1a03          	or	a,(OFST+0,sp)
1792  004a ca52d0        	or	a,21200
1793  004d c752d0        	ld	21200,a
1794                     ; 768   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1796  0050 7b09          	ld	a,(OFST+6,sp)
1797  0052 c752ca        	ld	21194,a
1798                     ; 769   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1800  0055 7b0a          	ld	a,(OFST+7,sp)
1801  0057 c752cb        	ld	21195,a
1802                     ; 770 }
1805  005a 5b05          	addw	sp,#5
1806  005c 81            	ret
2011                     ; 800 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
2011                     ; 801                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
2011                     ; 802                      uint8_t TIM1_DeadTime,
2011                     ; 803                      TIM1_BreakState_TypeDef TIM1_Break,
2011                     ; 804                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
2011                     ; 805                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
2011                     ; 806 {
2012                     .text:	section	.text,new
2013  0000               _TIM1_BDTRConfig:
2015  0000 89            	pushw	x
2016  0001 88            	push	a
2017       00000001      OFST:	set	1
2020                     ; 809   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
2022                     ; 810   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
2024                     ; 811   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
2026                     ; 812   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
2028                     ; 813   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
2030                     ; 815   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2032  0002 7b06          	ld	a,(OFST+5,sp)
2033  0004 c752cf        	ld	21199,a
2034                     ; 819   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
2034                     ; 820                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
2034                     ; 821                                       | (uint8_t)TIM1_AutomaticOutput));
2036  0007 7b07          	ld	a,(OFST+6,sp)
2037  0009 1a08          	or	a,(OFST+7,sp)
2038  000b 1a09          	or	a,(OFST+8,sp)
2039  000d 6b01          	ld	(OFST+0,sp),a
2040  000f 9f            	ld	a,xl
2041  0010 1a02          	or	a,(OFST+1,sp)
2042  0012 1a01          	or	a,(OFST+0,sp)
2043  0014 c752ce        	ld	21198,a
2044                     ; 823 }
2047  0017 5b03          	addw	sp,#3
2048  0019 81            	ret
2084                     ; 831 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2084                     ; 832 {
2085                     .text:	section	.text,new
2086  0000               _TIM1_CtrlPWMOutputs:
2090                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2092                     ; 838   if (NewState != DISABLE)
2094  0000 4d            	tnz	a
2095  0001 2706          	jreq	L1301
2096                     ; 840     TIM1->BKR |= TIM1_BKR_MOE;
2098  0003 721e52ce      	bset	21198,#7
2100  0007 2004          	jra	L3301
2101  0009               L1301:
2102                     ; 844     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2104  0009 721f52ce      	bres	21198,#7
2105  000d               L3301:
2106                     ; 846 }
2109  000d 81            	ret
2188                     ; 868 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
2188                     ; 869 {
2189                     .text:	section	.text,new
2190  0000               _TIM1_SelectOCxM:
2192  0000 89            	pushw	x
2193       00000000      OFST:	set	0
2196                     ; 871   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
2198                     ; 872   assert_param(IS_TIM1_OCM(TIM1_OCMode));
2200                     ; 874   if (TIM1_Channel == TIM1_Channel_1)
2202  0001 9e            	ld	a,xh
2203  0002 4d            	tnz	a
2204  0003 2610          	jrne	L3701
2205                     ; 877     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2207  0005 721152bd      	bres	21181,#0
2208                     ; 880     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2210  0009 c652b9        	ld	a,21177
2211  000c a48f          	and	a,#143
2212  000e 1a02          	or	a,(OFST+2,sp)
2213  0010 c752b9        	ld	21177,a
2215  0013 2024          	jra	L5701
2216  0015               L3701:
2217                     ; 882   else if (TIM1_Channel == TIM1_Channel_2)
2219  0015 7b01          	ld	a,(OFST+1,sp)
2220  0017 a101          	cp	a,#1
2221  0019 2610          	jrne	L7701
2222                     ; 885     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
2224  001b 721952bd      	bres	21181,#4
2225                     ; 888     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2227  001f c652ba        	ld	a,21178
2228  0022 a48f          	and	a,#143
2229  0024 1a02          	or	a,(OFST+2,sp)
2230  0026 c752ba        	ld	21178,a
2232  0029 200e          	jra	L5701
2233  002b               L7701:
2234                     ; 893     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
2236  002b 721152be      	bres	21182,#0
2237                     ; 896     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2239  002f c652bb        	ld	a,21179
2240  0032 a48f          	and	a,#143
2241  0034 1a02          	or	a,(OFST+2,sp)
2242  0036 c752bb        	ld	21179,a
2243  0039               L5701:
2244                     ; 899 }
2247  0039 85            	popw	x
2248  003a 81            	ret
2280                     ; 907 void TIM1_SetCompare1(uint16_t Compare1)
2280                     ; 908 {
2281                     .text:	section	.text,new
2282  0000               _TIM1_SetCompare1:
2286                     ; 910   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
2288  0000 9e            	ld	a,xh
2289  0001 c752c6        	ld	21190,a
2290                     ; 911   TIM1->CCR1L = (uint8_t)(Compare1);
2292  0004 9f            	ld	a,xl
2293  0005 c752c7        	ld	21191,a
2294                     ; 913 }
2297  0008 81            	ret
2329                     ; 921 void TIM1_SetCompare2(uint16_t Compare2)
2329                     ; 922 {
2330                     .text:	section	.text,new
2331  0000               _TIM1_SetCompare2:
2335                     ; 924   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
2337  0000 9e            	ld	a,xh
2338  0001 c752c8        	ld	21192,a
2339                     ; 925   TIM1->CCR2L = (uint8_t)(Compare2);
2341  0004 9f            	ld	a,xl
2342  0005 c752c9        	ld	21193,a
2343                     ; 926 }
2346  0008 81            	ret
2378                     ; 934 void TIM1_SetCompare3(uint16_t Compare3)
2378                     ; 935 {
2379                     .text:	section	.text,new
2380  0000               _TIM1_SetCompare3:
2384                     ; 937   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
2386  0000 9e            	ld	a,xh
2387  0001 c752ca        	ld	21194,a
2388                     ; 938   TIM1->CCR3L = (uint8_t)(Compare3);
2390  0004 9f            	ld	a,xl
2391  0005 c752cb        	ld	21195,a
2392                     ; 939 }
2395  0008 81            	ret
2427                     ; 947 void TIM1_SetCompare4(uint16_t Compare4)
2427                     ; 948 {
2428                     .text:	section	.text,new
2429  0000               _TIM1_SetCompare4:
2433                     ; 950   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
2435  0000 9e            	ld	a,xh
2436  0001 c752cc        	ld	21196,a
2437                     ; 951   TIM1->CCR4L = (uint8_t)(Compare4);
2439  0004 9f            	ld	a,xl
2440  0005 c752cd        	ld	21197,a
2441                     ; 952 }
2444  0008 81            	ret
2480                     ; 960 void TIM1_CCPreloadControl(FunctionalState NewState)
2480                     ; 961 {
2481                     .text:	section	.text,new
2482  0000               _TIM1_CCPreloadControl:
2486                     ; 963   assert_param(IS_FUNCTIONAL_STATE(NewState));
2488                     ; 966   if (NewState != DISABLE)
2490  0000 4d            	tnz	a
2491  0001 2706          	jreq	L1021
2492                     ; 968     TIM1->CR2 |= TIM1_CR2_CCPC;
2494  0003 721052b1      	bset	21169,#0
2496  0007 2004          	jra	L3021
2497  0009               L1021:
2498                     ; 972     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
2500  0009 721152b1      	bres	21169,#0
2501  000d               L3021:
2502                     ; 974 }
2505  000d 81            	ret
2563                     ; 984 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2563                     ; 985 {
2564                     .text:	section	.text,new
2565  0000               _TIM1_ForcedOC1Config:
2567  0000 88            	push	a
2568       00000000      OFST:	set	0
2571                     ; 987   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2573                     ; 990   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2575  0001 c652b9        	ld	a,21177
2576  0004 a48f          	and	a,#143
2577  0006 1a01          	or	a,(OFST+1,sp)
2578  0008 c752b9        	ld	21177,a
2579                     ; 991 }
2582  000b 84            	pop	a
2583  000c 81            	ret
2619                     ; 1001 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2619                     ; 1002 {
2620                     .text:	section	.text,new
2621  0000               _TIM1_ForcedOC2Config:
2623  0000 88            	push	a
2624       00000000      OFST:	set	0
2627                     ; 1004   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2629                     ; 1007   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2631  0001 c652ba        	ld	a,21178
2632  0004 a48f          	and	a,#143
2633  0006 1a01          	or	a,(OFST+1,sp)
2634  0008 c752ba        	ld	21178,a
2635                     ; 1008 }
2638  000b 84            	pop	a
2639  000c 81            	ret
2675                     ; 1018 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2675                     ; 1019 {
2676                     .text:	section	.text,new
2677  0000               _TIM1_ForcedOC3Config:
2679  0000 88            	push	a
2680       00000000      OFST:	set	0
2683                     ; 1021   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2685                     ; 1024   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2687  0001 c652bb        	ld	a,21179
2688  0004 a48f          	and	a,#143
2689  0006 1a01          	or	a,(OFST+1,sp)
2690  0008 c752bb        	ld	21179,a
2691                     ; 1025 }
2694  000b 84            	pop	a
2695  000c 81            	ret
2731                     ; 1033 void TIM1_OC1PreloadConfig(FunctionalState NewState)
2731                     ; 1034 {
2732                     .text:	section	.text,new
2733  0000               _TIM1_OC1PreloadConfig:
2737                     ; 1036   assert_param(IS_FUNCTIONAL_STATE(NewState));
2739                     ; 1039   if (NewState != DISABLE)
2741  0000 4d            	tnz	a
2742  0001 2706          	jreq	L5031
2743                     ; 1041     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
2745  0003 721652b9      	bset	21177,#3
2747  0007 2004          	jra	L7031
2748  0009               L5031:
2749                     ; 1045     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2751  0009 721752b9      	bres	21177,#3
2752  000d               L7031:
2753                     ; 1047 }
2756  000d 81            	ret
2792                     ; 1055 void TIM1_OC2PreloadConfig(FunctionalState NewState)
2792                     ; 1056 {
2793                     .text:	section	.text,new
2794  0000               _TIM1_OC2PreloadConfig:
2798                     ; 1058   assert_param(IS_FUNCTIONAL_STATE(NewState));
2800                     ; 1061   if (NewState != DISABLE)
2802  0000 4d            	tnz	a
2803  0001 2706          	jreq	L7231
2804                     ; 1063     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
2806  0003 721652ba      	bset	21178,#3
2808  0007 2004          	jra	L1331
2809  0009               L7231:
2810                     ; 1067     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2812  0009 721752ba      	bres	21178,#3
2813  000d               L1331:
2814                     ; 1069 }
2817  000d 81            	ret
2853                     ; 1077 void TIM1_OC3PreloadConfig(FunctionalState NewState)
2853                     ; 1078 {
2854                     .text:	section	.text,new
2855  0000               _TIM1_OC3PreloadConfig:
2859                     ; 1080   assert_param(IS_FUNCTIONAL_STATE(NewState));
2861                     ; 1083   if (NewState != DISABLE)
2863  0000 4d            	tnz	a
2864  0001 2706          	jreq	L1531
2865                     ; 1085     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
2867  0003 721652bb      	bset	21179,#3
2869  0007 2004          	jra	L3531
2870  0009               L1531:
2871                     ; 1089     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2873  0009 721752bb      	bres	21179,#3
2874  000d               L3531:
2875                     ; 1091 }
2878  000d 81            	ret
2914                     ; 1099 void TIM1_OC4PreloadConfig(FunctionalState NewState)
2914                     ; 1100 {
2915                     .text:	section	.text,new
2916  0000               _TIM1_OC4PreloadConfig:
2920                     ; 1102   assert_param(IS_FUNCTIONAL_STATE(NewState));
2922                     ; 1105   if (NewState != DISABLE)
2924  0000 4d            	tnz	a
2925  0001 2706          	jreq	L3731
2926                     ; 1107     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
2928  0003 721652bc      	bset	21180,#3
2930  0007 2004          	jra	L5731
2931  0009               L3731:
2932                     ; 1111     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2934  0009 721752bc      	bres	21180,#3
2935  000d               L5731:
2936                     ; 1113 }
2939  000d 81            	ret
2974                     ; 1121 void TIM1_OC1FastConfig(FunctionalState NewState)
2974                     ; 1122 {
2975                     .text:	section	.text,new
2976  0000               _TIM1_OC1FastConfig:
2980                     ; 1124   assert_param(IS_FUNCTIONAL_STATE(NewState));
2982                     ; 1127   if (NewState != DISABLE)
2984  0000 4d            	tnz	a
2985  0001 2706          	jreq	L5141
2986                     ; 1129     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
2988  0003 721452b9      	bset	21177,#2
2990  0007 2004          	jra	L7141
2991  0009               L5141:
2992                     ; 1133     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
2994  0009 721552b9      	bres	21177,#2
2995  000d               L7141:
2996                     ; 1135 }
2999  000d 81            	ret
3034                     ; 1143 void TIM1_OC2FastConfig(FunctionalState NewState)
3034                     ; 1144 {
3035                     .text:	section	.text,new
3036  0000               _TIM1_OC2FastConfig:
3040                     ; 1146   assert_param(IS_FUNCTIONAL_STATE(NewState));
3042                     ; 1149   if (NewState != DISABLE)
3044  0000 4d            	tnz	a
3045  0001 2706          	jreq	L7341
3046                     ; 1151     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
3048  0003 721452ba      	bset	21178,#2
3050  0007 2004          	jra	L1441
3051  0009               L7341:
3052                     ; 1155     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3054  0009 721552ba      	bres	21178,#2
3055  000d               L1441:
3056                     ; 1157 }
3059  000d 81            	ret
3094                     ; 1165 void TIM1_OC3FastConfig(FunctionalState NewState)
3094                     ; 1166 {
3095                     .text:	section	.text,new
3096  0000               _TIM1_OC3FastConfig:
3100                     ; 1168   assert_param(IS_FUNCTIONAL_STATE(NewState));
3102                     ; 1171   if (NewState != DISABLE)
3104  0000 4d            	tnz	a
3105  0001 2706          	jreq	L1641
3106                     ; 1173     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
3108  0003 721452bb      	bset	21179,#2
3110  0007 2004          	jra	L3641
3111  0009               L1641:
3112                     ; 1177     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3114  0009 721552bb      	bres	21179,#2
3115  000d               L3641:
3116                     ; 1179 }
3119  000d 81            	ret
3154                     ; 1187 void TIM1_ClearOC1Ref(FunctionalState NewState)
3154                     ; 1188 {
3155                     .text:	section	.text,new
3156  0000               _TIM1_ClearOC1Ref:
3160                     ; 1190   assert_param(IS_FUNCTIONAL_STATE(NewState));
3162                     ; 1193   if (NewState != DISABLE)
3164  0000 4d            	tnz	a
3165  0001 2706          	jreq	L3051
3166                     ; 1195     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
3168  0003 721e52b9      	bset	21177,#7
3170  0007 2004          	jra	L5051
3171  0009               L3051:
3172                     ; 1199     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3174  0009 721f52b9      	bres	21177,#7
3175  000d               L5051:
3176                     ; 1201 }
3179  000d 81            	ret
3214                     ; 1209 void TIM1_ClearOC2Ref(FunctionalState NewState)
3214                     ; 1210 {
3215                     .text:	section	.text,new
3216  0000               _TIM1_ClearOC2Ref:
3220                     ; 1212   assert_param(IS_FUNCTIONAL_STATE(NewState));
3222                     ; 1215   if (NewState != DISABLE)
3224  0000 4d            	tnz	a
3225  0001 2706          	jreq	L5251
3226                     ; 1217     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
3228  0003 721e52ba      	bset	21178,#7
3230  0007 2004          	jra	L7251
3231  0009               L5251:
3232                     ; 1221     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3234  0009 721f52ba      	bres	21178,#7
3235  000d               L7251:
3236                     ; 1223 }
3239  000d 81            	ret
3274                     ; 1231 void TIM1_ClearOC3Ref(FunctionalState NewState)
3274                     ; 1232 {
3275                     .text:	section	.text,new
3276  0000               _TIM1_ClearOC3Ref:
3280                     ; 1234   assert_param(IS_FUNCTIONAL_STATE(NewState));
3282                     ; 1237   if (NewState != DISABLE)
3284  0000 4d            	tnz	a
3285  0001 2706          	jreq	L7451
3286                     ; 1239     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
3288  0003 721e52bb      	bset	21179,#7
3290  0007 2004          	jra	L1551
3291  0009               L7451:
3292                     ; 1243     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3294  0009 721f52bb      	bres	21179,#7
3295  000d               L1551:
3296                     ; 1245 }
3299  000d 81            	ret
3334                     ; 1253 void TIM1_ClearOC4Ref(FunctionalState NewState)
3334                     ; 1254 {
3335                     .text:	section	.text,new
3336  0000               _TIM1_ClearOC4Ref:
3340                     ; 1256   assert_param(IS_FUNCTIONAL_STATE(NewState));
3342                     ; 1259   if (NewState != DISABLE)
3344  0000 4d            	tnz	a
3345  0001 2706          	jreq	L1751
3346                     ; 1261     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
3348  0003 721e52bc      	bset	21180,#7
3350  0007 2004          	jra	L3751
3351  0009               L1751:
3352                     ; 1265     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3354  0009 721f52bc      	bres	21180,#7
3355  000d               L3751:
3356                     ; 1267 }
3359  000d 81            	ret
3395                     ; 1277 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3395                     ; 1278 {
3396                     .text:	section	.text,new
3397  0000               _TIM1_OC1PolarityConfig:
3401                     ; 1280   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3403                     ; 1283   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3405  0000 4d            	tnz	a
3406  0001 2706          	jreq	L3161
3407                     ; 1285     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3409  0003 721252bd      	bset	21181,#1
3411  0007 2004          	jra	L5161
3412  0009               L3161:
3413                     ; 1289     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3415  0009 721352bd      	bres	21181,#1
3416  000d               L5161:
3417                     ; 1291 }
3420  000d 81            	ret
3456                     ; 1301 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3456                     ; 1302 {
3457                     .text:	section	.text,new
3458  0000               _TIM1_OC1NPolarityConfig:
3462                     ; 1304   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3464                     ; 1307   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3466  0000 4d            	tnz	a
3467  0001 2706          	jreq	L5361
3468                     ; 1309     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
3470  0003 721652bd      	bset	21181,#3
3472  0007 2004          	jra	L7361
3473  0009               L5361:
3474                     ; 1313     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
3476  0009 721752bd      	bres	21181,#3
3477  000d               L7361:
3478                     ; 1315 }
3481  000d 81            	ret
3517                     ; 1325 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3517                     ; 1326 {
3518                     .text:	section	.text,new
3519  0000               _TIM1_OC2PolarityConfig:
3523                     ; 1328   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3525                     ; 1331   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3527  0000 4d            	tnz	a
3528  0001 2706          	jreq	L7561
3529                     ; 1333     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3531  0003 721a52bd      	bset	21181,#5
3533  0007 2004          	jra	L1661
3534  0009               L7561:
3535                     ; 1337     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3537  0009 721b52bd      	bres	21181,#5
3538  000d               L1661:
3539                     ; 1339 }
3542  000d 81            	ret
3578                     ; 1349 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3578                     ; 1350 {
3579                     .text:	section	.text,new
3580  0000               _TIM1_OC2NPolarityConfig:
3584                     ; 1352   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3586                     ; 1355   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3588  0000 4d            	tnz	a
3589  0001 2706          	jreq	L1071
3590                     ; 1357     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
3592  0003 721e52bd      	bset	21181,#7
3594  0007 2004          	jra	L3071
3595  0009               L1071:
3596                     ; 1361     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
3598  0009 721f52bd      	bres	21181,#7
3599  000d               L3071:
3600                     ; 1363 }
3603  000d 81            	ret
3639                     ; 1373 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3639                     ; 1374 {
3640                     .text:	section	.text,new
3641  0000               _TIM1_OC3PolarityConfig:
3645                     ; 1376   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3647                     ; 1379   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3649  0000 4d            	tnz	a
3650  0001 2706          	jreq	L3271
3651                     ; 1381     TIM1->CCER2 |= TIM1_CCER2_CC3P;
3653  0003 721252be      	bset	21182,#1
3655  0007 2004          	jra	L5271
3656  0009               L3271:
3657                     ; 1385     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
3659  0009 721352be      	bres	21182,#1
3660  000d               L5271:
3661                     ; 1387 }
3664  000d 81            	ret
3700                     ; 1397 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3700                     ; 1398 {
3701                     .text:	section	.text,new
3702  0000               _TIM1_OC3NPolarityConfig:
3706                     ; 1400   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3708                     ; 1403   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3710  0000 4d            	tnz	a
3711  0001 2706          	jreq	L5471
3712                     ; 1405     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
3714  0003 721652be      	bset	21182,#3
3716  0007 2004          	jra	L7471
3717  0009               L5471:
3718                     ; 1409     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
3720  0009 721752be      	bres	21182,#3
3721  000d               L7471:
3722                     ; 1411 }
3725  000d 81            	ret
3784                     ; 1421 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
3784                     ; 1422 {
3785                     .text:	section	.text,new
3786  0000               _TIM1_SelectOCREFClear:
3790                     ; 1424   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
3792                     ; 1427   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
3794  0000 721752b2      	bres	21170,#3
3795                     ; 1428   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
3797  0004 ca52b2        	or	a,21170
3798  0007 c752b2        	ld	21170,a
3799                     ; 1429 }
3802  000a 81            	ret
3837                     ; 1437 void TIM1_SelectCOM(FunctionalState NewState)
3837                     ; 1438 {
3838                     .text:	section	.text,new
3839  0000               _TIM1_SelectCOM:
3843                     ; 1440   assert_param(IS_FUNCTIONAL_STATE(NewState));
3845                     ; 1443   if (NewState != DISABLE)
3847  0000 4d            	tnz	a
3848  0001 2706          	jreq	L5102
3849                     ; 1445     TIM1->CR2 |= TIM1_CR2_CCUS;
3851  0003 721452b1      	bset	21169,#2
3853  0007 2004          	jra	L7102
3854  0009               L5102:
3855                     ; 1449     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
3857  0009 721552b1      	bres	21169,#2
3858  000d               L7102:
3859                     ; 1451 }
3862  000d 81            	ret
3907                     ; 1465 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
3907                     ; 1466 {
3908                     .text:	section	.text,new
3909  0000               _TIM1_CCxCmd:
3911  0000 89            	pushw	x
3912       00000000      OFST:	set	0
3915                     ; 1468   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
3917                     ; 1469   assert_param(IS_FUNCTIONAL_STATE(NewState));
3919                     ; 1471   if (TIM1_Channel == TIM1_Channel_1)
3921  0001 9e            	ld	a,xh
3922  0002 4d            	tnz	a
3923  0003 2610          	jrne	L3402
3924                     ; 1474     if (NewState != DISABLE)
3926  0005 9f            	ld	a,xl
3927  0006 4d            	tnz	a
3928  0007 2706          	jreq	L5402
3929                     ; 1476       TIM1->CCER1 |= TIM1_CCER1_CC1E;
3931  0009 721052bd      	bset	21181,#0
3933  000d 2040          	jra	L1502
3934  000f               L5402:
3935                     ; 1480       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
3937  000f 721152bd      	bres	21181,#0
3938  0013 203a          	jra	L1502
3939  0015               L3402:
3940                     ; 1483   else if (TIM1_Channel == TIM1_Channel_2)
3942  0015 7b01          	ld	a,(OFST+1,sp)
3943  0017 a101          	cp	a,#1
3944  0019 2610          	jrne	L3502
3945                     ; 1486     if (NewState != DISABLE)
3947  001b 0d02          	tnz	(OFST+2,sp)
3948  001d 2706          	jreq	L5502
3949                     ; 1488       TIM1->CCER1 |= TIM1_CCER1_CC2E;
3951  001f 721852bd      	bset	21181,#4
3953  0023 202a          	jra	L1502
3954  0025               L5502:
3955                     ; 1492       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
3957  0025 721952bd      	bres	21181,#4
3958  0029 2024          	jra	L1502
3959  002b               L3502:
3960                     ; 1495   else if (TIM1_Channel == TIM1_Channel_3)
3962  002b 7b01          	ld	a,(OFST+1,sp)
3963  002d a102          	cp	a,#2
3964  002f 2610          	jrne	L3602
3965                     ; 1498     if (NewState != DISABLE)
3967  0031 0d02          	tnz	(OFST+2,sp)
3968  0033 2706          	jreq	L5602
3969                     ; 1500       TIM1->CCER2 |= TIM1_CCER2_CC3E;
3971  0035 721052be      	bset	21182,#0
3973  0039 2014          	jra	L1502
3974  003b               L5602:
3975                     ; 1504       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
3977  003b 721152be      	bres	21182,#0
3978  003f 200e          	jra	L1502
3979  0041               L3602:
3980                     ; 1510     if (NewState != DISABLE)
3982  0041 0d02          	tnz	(OFST+2,sp)
3983  0043 2706          	jreq	L3702
3984                     ; 1512       TIM1->CCER2 |= TIM1_CCER2_CC4E;
3986  0045 721852be      	bset	21182,#4
3988  0049 2004          	jra	L1502
3989  004b               L3702:
3990                     ; 1516       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
3992  004b 721952be      	bres	21182,#4
3993  004f               L1502:
3994                     ; 1519 }
3997  004f 85            	popw	x
3998  0050 81            	ret
4043                     ; 1532 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
4043                     ; 1533 {
4044                     .text:	section	.text,new
4045  0000               _TIM1_CCxNCmd:
4047  0000 89            	pushw	x
4048       00000000      OFST:	set	0
4051                     ; 1535   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
4053                     ; 1536   assert_param(IS_FUNCTIONAL_STATE(NewState));
4055                     ; 1538   if (TIM1_Channel == TIM1_Channel_1)
4057  0001 9e            	ld	a,xh
4058  0002 4d            	tnz	a
4059  0003 2610          	jrne	L1212
4060                     ; 1541     if (NewState != DISABLE)
4062  0005 9f            	ld	a,xl
4063  0006 4d            	tnz	a
4064  0007 2706          	jreq	L3212
4065                     ; 1543       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
4067  0009 721452bd      	bset	21181,#2
4069  000d 202a          	jra	L7212
4070  000f               L3212:
4071                     ; 1547       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
4073  000f 721552bd      	bres	21181,#2
4074  0013 2024          	jra	L7212
4075  0015               L1212:
4076                     ; 1550   else if (TIM1_Channel == TIM1_Channel_2)
4078  0015 7b01          	ld	a,(OFST+1,sp)
4079  0017 a101          	cp	a,#1
4080  0019 2610          	jrne	L1312
4081                     ; 1553     if (NewState != DISABLE)
4083  001b 0d02          	tnz	(OFST+2,sp)
4084  001d 2706          	jreq	L3312
4085                     ; 1555       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
4087  001f 721c52bd      	bset	21181,#6
4089  0023 2014          	jra	L7212
4090  0025               L3312:
4091                     ; 1559       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
4093  0025 721d52bd      	bres	21181,#6
4094  0029 200e          	jra	L7212
4095  002b               L1312:
4096                     ; 1565     if (NewState != DISABLE)
4098  002b 0d02          	tnz	(OFST+2,sp)
4099  002d 2706          	jreq	L1412
4100                     ; 1567       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
4102  002f 721452be      	bset	21182,#2
4104  0033 2004          	jra	L7212
4105  0035               L1412:
4106                     ; 1571       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
4108  0035 721552be      	bres	21182,#2
4109  0039               L7212:
4110                     ; 1574 }
4113  0039 85            	popw	x
4114  003a 81            	ret
4280                     ; 1661 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
4280                     ; 1662                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4280                     ; 1663                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
4280                     ; 1664                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4280                     ; 1665                  uint8_t TIM1_ICFilter)
4280                     ; 1666 {
4281                     .text:	section	.text,new
4282  0000               _TIM1_ICInit:
4284  0000 89            	pushw	x
4285       00000000      OFST:	set	0
4288                     ; 1669   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
4290                     ; 1670   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4292                     ; 1671   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4294                     ; 1672   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4296                     ; 1673   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
4298                     ; 1675   if (TIM1_Channel == TIM1_Channel_1)
4300  0001 9e            	ld	a,xh
4301  0002 4d            	tnz	a
4302  0003 2614          	jrne	L7322
4303                     ; 1678     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4305  0005 7b07          	ld	a,(OFST+7,sp)
4306  0007 88            	push	a
4307  0008 7b06          	ld	a,(OFST+6,sp)
4308  000a 97            	ld	xl,a
4309  000b 7b03          	ld	a,(OFST+3,sp)
4310  000d 95            	ld	xh,a
4311  000e cd0000        	call	L3_TI1_Config
4313  0011 84            	pop	a
4314                     ; 1680     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4316  0012 7b06          	ld	a,(OFST+6,sp)
4317  0014 cd0000        	call	_TIM1_SetIC1Prescaler
4320  0017 2046          	jra	L1422
4321  0019               L7322:
4322                     ; 1682   else if (TIM1_Channel == TIM1_Channel_2)
4324  0019 7b01          	ld	a,(OFST+1,sp)
4325  001b a101          	cp	a,#1
4326  001d 2614          	jrne	L3422
4327                     ; 1685     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4329  001f 7b07          	ld	a,(OFST+7,sp)
4330  0021 88            	push	a
4331  0022 7b06          	ld	a,(OFST+6,sp)
4332  0024 97            	ld	xl,a
4333  0025 7b03          	ld	a,(OFST+3,sp)
4334  0027 95            	ld	xh,a
4335  0028 cd0000        	call	L5_TI2_Config
4337  002b 84            	pop	a
4338                     ; 1687     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4340  002c 7b06          	ld	a,(OFST+6,sp)
4341  002e cd0000        	call	_TIM1_SetIC2Prescaler
4344  0031 202c          	jra	L1422
4345  0033               L3422:
4346                     ; 1689   else if (TIM1_Channel == TIM1_Channel_3)
4348  0033 7b01          	ld	a,(OFST+1,sp)
4349  0035 a102          	cp	a,#2
4350  0037 2614          	jrne	L7422
4351                     ; 1692     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4353  0039 7b07          	ld	a,(OFST+7,sp)
4354  003b 88            	push	a
4355  003c 7b06          	ld	a,(OFST+6,sp)
4356  003e 97            	ld	xl,a
4357  003f 7b03          	ld	a,(OFST+3,sp)
4358  0041 95            	ld	xh,a
4359  0042 cd0000        	call	L7_TI3_Config
4361  0045 84            	pop	a
4362                     ; 1694     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
4364  0046 7b06          	ld	a,(OFST+6,sp)
4365  0048 cd0000        	call	_TIM1_SetIC3Prescaler
4368  004b 2012          	jra	L1422
4369  004d               L7422:
4370                     ; 1699     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4372  004d 7b07          	ld	a,(OFST+7,sp)
4373  004f 88            	push	a
4374  0050 7b06          	ld	a,(OFST+6,sp)
4375  0052 97            	ld	xl,a
4376  0053 7b03          	ld	a,(OFST+3,sp)
4377  0055 95            	ld	xh,a
4378  0056 cd0000        	call	L11_TI4_Config
4380  0059 84            	pop	a
4381                     ; 1701     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
4383  005a 7b06          	ld	a,(OFST+6,sp)
4384  005c cd0000        	call	_TIM1_SetIC4Prescaler
4386  005f               L1422:
4387                     ; 1703 }
4390  005f 85            	popw	x
4391  0060 81            	ret
4487                     ; 1730 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
4487                     ; 1731                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4487                     ; 1732                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
4487                     ; 1733                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4487                     ; 1734                      uint8_t TIM1_ICFilter)
4487                     ; 1735 {
4488                     .text:	section	.text,new
4489  0000               _TIM1_PWMIConfig:
4491  0000 89            	pushw	x
4492  0001 89            	pushw	x
4493       00000002      OFST:	set	2
4496                     ; 1736   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
4498                     ; 1737   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
4500                     ; 1740   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
4502                     ; 1741   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4504                     ; 1742   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4506                     ; 1743   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4508                     ; 1746   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
4510  0002 9f            	ld	a,xl
4511  0003 a101          	cp	a,#1
4512  0005 2706          	jreq	L7132
4513                     ; 1748     icpolarity = TIM1_ICPolarity_Falling;
4515  0007 a601          	ld	a,#1
4516  0009 6b01          	ld	(OFST-1,sp),a
4518  000b 2002          	jra	L1232
4519  000d               L7132:
4520                     ; 1752     icpolarity = TIM1_ICPolarity_Rising;
4522  000d 0f01          	clr	(OFST-1,sp)
4523  000f               L1232:
4524                     ; 1756   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
4526  000f 7b07          	ld	a,(OFST+5,sp)
4527  0011 a101          	cp	a,#1
4528  0013 2606          	jrne	L3232
4529                     ; 1758     icselection = TIM1_ICSelection_IndirectTI;
4531  0015 a602          	ld	a,#2
4532  0017 6b02          	ld	(OFST+0,sp),a
4534  0019 2004          	jra	L5232
4535  001b               L3232:
4536                     ; 1762     icselection = TIM1_ICSelection_DirectTI;
4538  001b a601          	ld	a,#1
4539  001d 6b02          	ld	(OFST+0,sp),a
4540  001f               L5232:
4541                     ; 1765   if (TIM1_Channel == TIM1_Channel_1)
4543  001f 0d03          	tnz	(OFST+1,sp)
4544  0021 2626          	jrne	L7232
4545                     ; 1768     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4547  0023 7b09          	ld	a,(OFST+7,sp)
4548  0025 88            	push	a
4549  0026 7b08          	ld	a,(OFST+6,sp)
4550  0028 97            	ld	xl,a
4551  0029 7b05          	ld	a,(OFST+3,sp)
4552  002b 95            	ld	xh,a
4553  002c cd0000        	call	L3_TI1_Config
4555  002f 84            	pop	a
4556                     ; 1771     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4558  0030 7b08          	ld	a,(OFST+6,sp)
4559  0032 cd0000        	call	_TIM1_SetIC1Prescaler
4561                     ; 1774     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
4563  0035 7b09          	ld	a,(OFST+7,sp)
4564  0037 88            	push	a
4565  0038 7b03          	ld	a,(OFST+1,sp)
4566  003a 97            	ld	xl,a
4567  003b 7b02          	ld	a,(OFST+0,sp)
4568  003d 95            	ld	xh,a
4569  003e cd0000        	call	L5_TI2_Config
4571  0041 84            	pop	a
4572                     ; 1777     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4574  0042 7b08          	ld	a,(OFST+6,sp)
4575  0044 cd0000        	call	_TIM1_SetIC2Prescaler
4578  0047 2024          	jra	L1332
4579  0049               L7232:
4580                     ; 1782     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4582  0049 7b09          	ld	a,(OFST+7,sp)
4583  004b 88            	push	a
4584  004c 7b08          	ld	a,(OFST+6,sp)
4585  004e 97            	ld	xl,a
4586  004f 7b05          	ld	a,(OFST+3,sp)
4587  0051 95            	ld	xh,a
4588  0052 cd0000        	call	L5_TI2_Config
4590  0055 84            	pop	a
4591                     ; 1785     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4593  0056 7b08          	ld	a,(OFST+6,sp)
4594  0058 cd0000        	call	_TIM1_SetIC2Prescaler
4596                     ; 1788     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
4598  005b 7b09          	ld	a,(OFST+7,sp)
4599  005d 88            	push	a
4600  005e 7b03          	ld	a,(OFST+1,sp)
4601  0060 97            	ld	xl,a
4602  0061 7b02          	ld	a,(OFST+0,sp)
4603  0063 95            	ld	xh,a
4604  0064 cd0000        	call	L3_TI1_Config
4606  0067 84            	pop	a
4607                     ; 1791     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4609  0068 7b08          	ld	a,(OFST+6,sp)
4610  006a cd0000        	call	_TIM1_SetIC1Prescaler
4612  006d               L1332:
4613                     ; 1793 }
4616  006d 5b04          	addw	sp,#4
4617  006f 81            	ret
4663                     ; 1800 uint16_t TIM1_GetCapture1(void)
4663                     ; 1801 {
4664                     .text:	section	.text,new
4665  0000               _TIM1_GetCapture1:
4667  0000 5204          	subw	sp,#4
4668       00000004      OFST:	set	4
4671                     ; 1804   uint16_t tmpccr1 = 0;
4673                     ; 1805   uint8_t tmpccr1l = 0, tmpccr1h = 0;
4677                     ; 1807   tmpccr1h = TIM1->CCR1H;
4679  0002 c652c6        	ld	a,21190
4680  0005 6b02          	ld	(OFST-2,sp),a
4681                     ; 1808   tmpccr1l = TIM1->CCR1L;
4683  0007 c652c7        	ld	a,21191
4684  000a 6b01          	ld	(OFST-3,sp),a
4685                     ; 1810   tmpccr1 = (uint16_t)(tmpccr1l);
4687  000c 7b01          	ld	a,(OFST-3,sp)
4688  000e 5f            	clrw	x
4689  000f 97            	ld	xl,a
4690  0010 1f03          	ldw	(OFST-1,sp),x
4691                     ; 1811   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4693  0012 7b02          	ld	a,(OFST-2,sp)
4694  0014 5f            	clrw	x
4695  0015 97            	ld	xl,a
4696  0016 4f            	clr	a
4697  0017 02            	rlwa	x,a
4698  0018 01            	rrwa	x,a
4699  0019 1a04          	or	a,(OFST+0,sp)
4700  001b 01            	rrwa	x,a
4701  001c 1a03          	or	a,(OFST-1,sp)
4702  001e 01            	rrwa	x,a
4703  001f 1f03          	ldw	(OFST-1,sp),x
4704                     ; 1813   return (uint16_t)tmpccr1;
4706  0021 1e03          	ldw	x,(OFST-1,sp)
4709  0023 5b04          	addw	sp,#4
4710  0025 81            	ret
4756                     ; 1821 uint16_t TIM1_GetCapture2(void)
4756                     ; 1822 {
4757                     .text:	section	.text,new
4758  0000               _TIM1_GetCapture2:
4760  0000 5204          	subw	sp,#4
4761       00000004      OFST:	set	4
4764                     ; 1825   uint16_t tmpccr2 = 0;
4766                     ; 1826   uint8_t tmpccr2l = 0, tmpccr2h = 0;
4770                     ; 1828   tmpccr2h = TIM1->CCR2H;
4772  0002 c652c8        	ld	a,21192
4773  0005 6b02          	ld	(OFST-2,sp),a
4774                     ; 1829   tmpccr2l = TIM1->CCR2L;
4776  0007 c652c9        	ld	a,21193
4777  000a 6b01          	ld	(OFST-3,sp),a
4778                     ; 1831   tmpccr2 = (uint16_t)(tmpccr2l);
4780  000c 7b01          	ld	a,(OFST-3,sp)
4781  000e 5f            	clrw	x
4782  000f 97            	ld	xl,a
4783  0010 1f03          	ldw	(OFST-1,sp),x
4784                     ; 1832   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4786  0012 7b02          	ld	a,(OFST-2,sp)
4787  0014 5f            	clrw	x
4788  0015 97            	ld	xl,a
4789  0016 4f            	clr	a
4790  0017 02            	rlwa	x,a
4791  0018 01            	rrwa	x,a
4792  0019 1a04          	or	a,(OFST+0,sp)
4793  001b 01            	rrwa	x,a
4794  001c 1a03          	or	a,(OFST-1,sp)
4795  001e 01            	rrwa	x,a
4796  001f 1f03          	ldw	(OFST-1,sp),x
4797                     ; 1834   return (uint16_t)tmpccr2;
4799  0021 1e03          	ldw	x,(OFST-1,sp)
4802  0023 5b04          	addw	sp,#4
4803  0025 81            	ret
4849                     ; 1842 uint16_t TIM1_GetCapture3(void)
4849                     ; 1843 {
4850                     .text:	section	.text,new
4851  0000               _TIM1_GetCapture3:
4853  0000 5204          	subw	sp,#4
4854       00000004      OFST:	set	4
4857                     ; 1845   uint16_t tmpccr3 = 0;
4859                     ; 1846   uint8_t tmpccr3l = 0, tmpccr3h = 0;
4863                     ; 1848   tmpccr3h = TIM1->CCR3H;
4865  0002 c652ca        	ld	a,21194
4866  0005 6b02          	ld	(OFST-2,sp),a
4867                     ; 1849   tmpccr3l = TIM1->CCR3L;
4869  0007 c652cb        	ld	a,21195
4870  000a 6b01          	ld	(OFST-3,sp),a
4871                     ; 1851   tmpccr3 = (uint16_t)(tmpccr3l);
4873  000c 7b01          	ld	a,(OFST-3,sp)
4874  000e 5f            	clrw	x
4875  000f 97            	ld	xl,a
4876  0010 1f03          	ldw	(OFST-1,sp),x
4877                     ; 1852   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4879  0012 7b02          	ld	a,(OFST-2,sp)
4880  0014 5f            	clrw	x
4881  0015 97            	ld	xl,a
4882  0016 4f            	clr	a
4883  0017 02            	rlwa	x,a
4884  0018 01            	rrwa	x,a
4885  0019 1a04          	or	a,(OFST+0,sp)
4886  001b 01            	rrwa	x,a
4887  001c 1a03          	or	a,(OFST-1,sp)
4888  001e 01            	rrwa	x,a
4889  001f 1f03          	ldw	(OFST-1,sp),x
4890                     ; 1854   return (uint16_t)tmpccr3;
4892  0021 1e03          	ldw	x,(OFST-1,sp)
4895  0023 5b04          	addw	sp,#4
4896  0025 81            	ret
4942                     ; 1862 uint16_t TIM1_GetCapture4(void)
4942                     ; 1863 {
4943                     .text:	section	.text,new
4944  0000               _TIM1_GetCapture4:
4946  0000 5204          	subw	sp,#4
4947       00000004      OFST:	set	4
4950                     ; 1865   uint16_t tmpccr4 = 0;
4952                     ; 1866   uint8_t tmpccr4l = 0, tmpccr4h = 0;
4956                     ; 1868   tmpccr4h = TIM1->CCR4H;
4958  0002 c652cc        	ld	a,21196
4959  0005 6b02          	ld	(OFST-2,sp),a
4960                     ; 1869   tmpccr4l = TIM1->CCR4L;
4962  0007 c652cd        	ld	a,21197
4963  000a 6b01          	ld	(OFST-3,sp),a
4964                     ; 1871   tmpccr4 = (uint16_t)(tmpccr4l);
4966  000c 7b01          	ld	a,(OFST-3,sp)
4967  000e 5f            	clrw	x
4968  000f 97            	ld	xl,a
4969  0010 1f03          	ldw	(OFST-1,sp),x
4970                     ; 1872   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
4972  0012 7b02          	ld	a,(OFST-2,sp)
4973  0014 5f            	clrw	x
4974  0015 97            	ld	xl,a
4975  0016 4f            	clr	a
4976  0017 02            	rlwa	x,a
4977  0018 01            	rrwa	x,a
4978  0019 1a04          	or	a,(OFST+0,sp)
4979  001b 01            	rrwa	x,a
4980  001c 1a03          	or	a,(OFST-1,sp)
4981  001e 01            	rrwa	x,a
4982  001f 1f03          	ldw	(OFST-1,sp),x
4983                     ; 1874   return (uint16_t)tmpccr4;
4985  0021 1e03          	ldw	x,(OFST-1,sp)
4988  0023 5b04          	addw	sp,#4
4989  0025 81            	ret
5025                     ; 1887 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5025                     ; 1888 {
5026                     .text:	section	.text,new
5027  0000               _TIM1_SetIC1Prescaler:
5029  0000 88            	push	a
5030       00000000      OFST:	set	0
5033                     ; 1890   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
5035                     ; 1893   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
5037  0001 c652b9        	ld	a,21177
5038  0004 a4f3          	and	a,#243
5039  0006 1a01          	or	a,(OFST+1,sp)
5040  0008 c752b9        	ld	21177,a
5041                     ; 1894 }
5044  000b 84            	pop	a
5045  000c 81            	ret
5081                     ; 1906 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5081                     ; 1907 {
5082                     .text:	section	.text,new
5083  0000               _TIM1_SetIC2Prescaler:
5085  0000 88            	push	a
5086       00000000      OFST:	set	0
5089                     ; 1909   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
5091                     ; 1912   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
5093  0001 c652ba        	ld	a,21178
5094  0004 a4f3          	and	a,#243
5095  0006 1a01          	or	a,(OFST+1,sp)
5096  0008 c752ba        	ld	21178,a
5097                     ; 1913 }
5100  000b 84            	pop	a
5101  000c 81            	ret
5137                     ; 1925 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5137                     ; 1926 {
5138                     .text:	section	.text,new
5139  0000               _TIM1_SetIC3Prescaler:
5141  0000 88            	push	a
5142       00000000      OFST:	set	0
5145                     ; 1929   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
5147                     ; 1932   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
5149  0001 c652bb        	ld	a,21179
5150  0004 a4f3          	and	a,#243
5151  0006 1a01          	or	a,(OFST+1,sp)
5152  0008 c752bb        	ld	21179,a
5153                     ; 1933 }
5156  000b 84            	pop	a
5157  000c 81            	ret
5193                     ; 1945 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
5193                     ; 1946 {
5194                     .text:	section	.text,new
5195  0000               _TIM1_SetIC4Prescaler:
5197  0000 88            	push	a
5198       00000000      OFST:	set	0
5201                     ; 1949   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
5203                     ; 1952   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
5205  0001 c652bc        	ld	a,21180
5206  0004 a4f3          	and	a,#243
5207  0006 1a01          	or	a,(OFST+1,sp)
5208  0008 c752bc        	ld	21180,a
5209                     ; 1953 }
5212  000b 84            	pop	a
5213  000c 81            	ret
5320                     ; 1988 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
5320                     ; 1989 {
5321                     .text:	section	.text,new
5322  0000               _TIM1_ITConfig:
5324  0000 89            	pushw	x
5325       00000000      OFST:	set	0
5328                     ; 1991   assert_param(IS_TIM1_IT(TIM1_IT));
5330                     ; 1992   assert_param(IS_FUNCTIONAL_STATE(NewState));
5332                     ; 1994   if (NewState != DISABLE)
5334  0001 9f            	ld	a,xl
5335  0002 4d            	tnz	a
5336  0003 2709          	jreq	L1752
5337                     ; 1997     TIM1->IER |= (uint8_t)TIM1_IT;
5339  0005 9e            	ld	a,xh
5340  0006 ca52b5        	or	a,21173
5341  0009 c752b5        	ld	21173,a
5343  000c 2009          	jra	L3752
5344  000e               L1752:
5345                     ; 2002     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
5347  000e 7b01          	ld	a,(OFST+1,sp)
5348  0010 43            	cpl	a
5349  0011 c452b5        	and	a,21173
5350  0014 c752b5        	ld	21173,a
5351  0017               L3752:
5352                     ; 2004 }
5355  0017 85            	popw	x
5356  0018 81            	ret
5461                     ; 2020 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5461                     ; 2021 {
5462                     .text:	section	.text,new
5463  0000               _TIM1_GenerateEvent:
5467                     ; 2023   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
5469                     ; 2026   TIM1->EGR = (uint8_t)TIM1_EventSource;
5471  0000 c752b8        	ld	21176,a
5472                     ; 2027 }
5475  0003 81            	ret
5645                     ; 2046 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
5645                     ; 2047 {
5646                     .text:	section	.text,new
5647  0000               _TIM1_GetFlagStatus:
5649  0000 89            	pushw	x
5650  0001 89            	pushw	x
5651       00000002      OFST:	set	2
5654                     ; 2048   FlagStatus bitstatus = RESET;
5656                     ; 2049   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
5660                     ; 2052   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
5662                     ; 2054   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
5664  0002 9f            	ld	a,xl
5665  0003 c452b6        	and	a,21174
5666  0006 6b01          	ld	(OFST-1,sp),a
5667                     ; 2055   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
5669  0008 c652b7        	ld	a,21175
5670  000b 1403          	and	a,(OFST+1,sp)
5671  000d 6b02          	ld	(OFST+0,sp),a
5672                     ; 2057   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
5674  000f 7b01          	ld	a,(OFST-1,sp)
5675  0011 1a02          	or	a,(OFST+0,sp)
5676  0013 2706          	jreq	L1372
5677                     ; 2059     bitstatus = SET;
5679  0015 a601          	ld	a,#1
5680  0017 6b02          	ld	(OFST+0,sp),a
5682  0019 2002          	jra	L3372
5683  001b               L1372:
5684                     ; 2063     bitstatus = RESET;
5686  001b 0f02          	clr	(OFST+0,sp)
5687  001d               L3372:
5688                     ; 2065   return (FlagStatus)(bitstatus);
5690  001d 7b02          	ld	a,(OFST+0,sp)
5693  001f 5b04          	addw	sp,#4
5694  0021 81            	ret
5729                     ; 2086 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
5729                     ; 2087 {
5730                     .text:	section	.text,new
5731  0000               _TIM1_ClearFlag:
5733  0000 89            	pushw	x
5734       00000000      OFST:	set	0
5737                     ; 2089   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
5739                     ; 2092   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
5741  0001 9f            	ld	a,xl
5742  0002 43            	cpl	a
5743  0003 c752b6        	ld	21174,a
5744                     ; 2093   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
5746  0006 7b01          	ld	a,(OFST+1,sp)
5747  0008 43            	cpl	a
5748  0009 a41e          	and	a,#30
5749  000b c752b7        	ld	21175,a
5750                     ; 2094 }
5753  000e 85            	popw	x
5754  000f 81            	ret
5814                     ; 2111 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
5814                     ; 2112 {
5815                     .text:	section	.text,new
5816  0000               _TIM1_GetITStatus:
5818  0000 88            	push	a
5819  0001 89            	pushw	x
5820       00000002      OFST:	set	2
5823                     ; 2113   ITStatus bitstatus = RESET;
5825                     ; 2115   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
5829                     ; 2118   assert_param(IS_TIM1_GET_IT(TIM1_IT));
5831                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
5833  0002 c452b6        	and	a,21174
5834  0005 6b01          	ld	(OFST-1,sp),a
5835                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
5837  0007 c652b5        	ld	a,21173
5838  000a 1403          	and	a,(OFST+1,sp)
5839  000c 6b02          	ld	(OFST+0,sp),a
5840                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
5842  000e 0d01          	tnz	(OFST-1,sp)
5843  0010 270a          	jreq	L1003
5845  0012 0d02          	tnz	(OFST+0,sp)
5846  0014 2706          	jreq	L1003
5847                     ; 2126     bitstatus = SET;
5849  0016 a601          	ld	a,#1
5850  0018 6b02          	ld	(OFST+0,sp),a
5852  001a 2002          	jra	L3003
5853  001c               L1003:
5854                     ; 2130     bitstatus = RESET;
5856  001c 0f02          	clr	(OFST+0,sp)
5857  001e               L3003:
5858                     ; 2132   return (ITStatus)(bitstatus);
5860  001e 7b02          	ld	a,(OFST+0,sp)
5863  0020 5b03          	addw	sp,#3
5864  0022 81            	ret
5900                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
5900                     ; 2150 {
5901                     .text:	section	.text,new
5902  0000               _TIM1_ClearITPendingBit:
5906                     ; 2152   assert_param(IS_TIM1_IT(TIM1_IT));
5908                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
5910  0000 43            	cpl	a
5911  0001 c752b6        	ld	21174,a
5912                     ; 2156 }
5915  0004 81            	ret
6453                     ; 2164 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
6453                     ; 2165                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
6453                     ; 2166 {
6454                     .text:	section	.text,new
6455  0000               _TIM1_DMAConfig:
6459                     ; 2168   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
6461                     ; 2169   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
6463                     ; 2172   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
6465  0000 9e            	ld	a,xh
6466  0001 c752d1        	ld	21201,a
6467                     ; 2173   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
6469  0004 9f            	ld	a,xl
6470  0005 c752d2        	ld	21202,a
6471                     ; 2174 }
6474  0008 81            	ret
6568                     ; 2186 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
6568                     ; 2187 {
6569                     .text:	section	.text,new
6570  0000               _TIM1_DMACmd:
6572  0000 89            	pushw	x
6573       00000000      OFST:	set	0
6576                     ; 2189   assert_param(IS_FUNCTIONAL_STATE(NewState));
6578                     ; 2190   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
6580                     ; 2192   if (NewState != DISABLE)
6582  0001 9f            	ld	a,xl
6583  0002 4d            	tnz	a
6584  0003 2709          	jreq	L7133
6585                     ; 2195     TIM1->DER |= (uint8_t)TIM1_DMASource;
6587  0005 9e            	ld	a,xh
6588  0006 ca52b4        	or	a,21172
6589  0009 c752b4        	ld	21172,a
6591  000c 2009          	jra	L1233
6592  000e               L7133:
6593                     ; 2200     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
6595  000e 7b01          	ld	a,(OFST+1,sp)
6596  0010 43            	cpl	a
6597  0011 c452b4        	and	a,21172
6598  0014 c752b4        	ld	21172,a
6599  0017               L1233:
6600                     ; 2202 }
6603  0017 85            	popw	x
6604  0018 81            	ret
6639                     ; 2210 void TIM1_SelectCCDMA(FunctionalState NewState)
6639                     ; 2211 {
6640                     .text:	section	.text,new
6641  0000               _TIM1_SelectCCDMA:
6645                     ; 2213   assert_param(IS_FUNCTIONAL_STATE(NewState));
6647                     ; 2215   if (NewState != DISABLE)
6649  0000 4d            	tnz	a
6650  0001 2706          	jreq	L1433
6651                     ; 2218     TIM1->CR2 |= TIM1_CR2_CCDS;
6653  0003 721652b1      	bset	21169,#3
6655  0007 2004          	jra	L3433
6656  0009               L1433:
6657                     ; 2223     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
6659  0009 721752b1      	bres	21169,#3
6660  000d               L3433:
6661                     ; 2225 }
6664  000d 81            	ret
6688                     ; 2248 void TIM1_InternalClockConfig(void)
6688                     ; 2249 {
6689                     .text:	section	.text,new
6690  0000               _TIM1_InternalClockConfig:
6694                     ; 2251   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
6696  0000 c652b2        	ld	a,21170
6697  0003 a4f8          	and	a,#248
6698  0005 c752b2        	ld	21170,a
6699                     ; 2252 }
6702  0008 81            	ret
6789                     ; 2269 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
6789                     ; 2270                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
6789                     ; 2271                                  uint8_t ICFilter)
6789                     ; 2272 {
6790                     .text:	section	.text,new
6791  0000               _TIM1_TIxExternalClockConfig:
6793  0000 89            	pushw	x
6794       00000000      OFST:	set	0
6797                     ; 2274   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
6799                     ; 2275   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
6801                     ; 2276   assert_param(IS_TIM1_IC_FILTER(ICFilter));
6803                     ; 2279   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
6805  0001 9e            	ld	a,xh
6806  0002 a160          	cp	a,#96
6807  0004 260f          	jrne	L3143
6808                     ; 2281     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6810  0006 7b05          	ld	a,(OFST+5,sp)
6811  0008 88            	push	a
6812  0009 ae0001        	ldw	x,#1
6813  000c 7b03          	ld	a,(OFST+3,sp)
6814  000e 95            	ld	xh,a
6815  000f cd0000        	call	L5_TI2_Config
6817  0012 84            	pop	a
6819  0013 200d          	jra	L5143
6820  0015               L3143:
6821                     ; 2285     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6823  0015 7b05          	ld	a,(OFST+5,sp)
6824  0017 88            	push	a
6825  0018 ae0001        	ldw	x,#1
6826  001b 7b03          	ld	a,(OFST+3,sp)
6827  001d 95            	ld	xh,a
6828  001e cd0000        	call	L3_TI1_Config
6830  0021 84            	pop	a
6831  0022               L5143:
6832                     ; 2289   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
6834  0022 7b01          	ld	a,(OFST+1,sp)
6835  0024 cd0000        	call	_TIM1_SelectInputTrigger
6837                     ; 2292   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
6839  0027 c652b2        	ld	a,21170
6840  002a aa07          	or	a,#7
6841  002c c752b2        	ld	21170,a
6842                     ; 2293 }
6845  002f 85            	popw	x
6846  0030 81            	ret
6961                     ; 2311 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
6961                     ; 2312                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
6961                     ; 2313                               uint8_t ExtTRGFilter)
6961                     ; 2314 {
6962                     .text:	section	.text,new
6963  0000               _TIM1_ETRClockMode1Config:
6965  0000 89            	pushw	x
6966       00000000      OFST:	set	0
6969                     ; 2316   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
6971                     ; 2317   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
6973                     ; 2318   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
6975                     ; 2321   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
6977  0001 7b05          	ld	a,(OFST+5,sp)
6978  0003 88            	push	a
6979  0004 9f            	ld	a,xl
6980  0005 97            	ld	xl,a
6981  0006 7b02          	ld	a,(OFST+2,sp)
6982  0008 95            	ld	xh,a
6983  0009 cd0000        	call	_TIM1_ETRConfig
6985  000c 84            	pop	a
6986                     ; 2324   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
6986                     ; 2325                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
6988  000d c652b2        	ld	a,21170
6989  0010 a488          	and	a,#136
6990  0012 aa77          	or	a,#119
6991  0014 c752b2        	ld	21170,a
6992                     ; 2326 }
6995  0017 85            	popw	x
6996  0018 81            	ret
7052                     ; 2344 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7052                     ; 2345                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7052                     ; 2346                               uint8_t ExtTRGFilter)
7052                     ; 2347 {
7053                     .text:	section	.text,new
7054  0000               _TIM1_ETRClockMode2Config:
7056  0000 89            	pushw	x
7057       00000000      OFST:	set	0
7060                     ; 2349   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7062                     ; 2350   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7064                     ; 2353   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7066  0001 7b05          	ld	a,(OFST+5,sp)
7067  0003 88            	push	a
7068  0004 9f            	ld	a,xl
7069  0005 97            	ld	xl,a
7070  0006 7b02          	ld	a,(OFST+2,sp)
7071  0008 95            	ld	xh,a
7072  0009 cd0000        	call	_TIM1_ETRConfig
7074  000c 84            	pop	a
7075                     ; 2356   TIM1->ETR |= TIM1_ETR_ECE;
7077  000d 721c52b3      	bset	21171,#6
7078                     ; 2357 }
7081  0011 85            	popw	x
7082  0012 81            	ret
7189                     ; 2407 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
7189                     ; 2408 {
7190                     .text:	section	.text,new
7191  0000               _TIM1_SelectInputTrigger:
7193  0000 88            	push	a
7194       00000000      OFST:	set	0
7197                     ; 2410   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
7199                     ; 2413   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
7201  0001 c652b2        	ld	a,21170
7202  0004 a48f          	and	a,#143
7203  0006 1a01          	or	a,(OFST+1,sp)
7204  0008 c752b2        	ld	21170,a
7205                     ; 2414 }
7208  000b 84            	pop	a
7209  000c 81            	ret
7315                     ; 2430 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
7315                     ; 2431 {
7316                     .text:	section	.text,new
7317  0000               _TIM1_SelectOutputTrigger:
7319  0000 88            	push	a
7320       00000000      OFST:	set	0
7323                     ; 2433   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
7325                     ; 2435   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
7327  0001 c652b1        	ld	a,21169
7328  0004 a48f          	and	a,#143
7329  0006 1a01          	or	a,(OFST+1,sp)
7330  0008 c752b1        	ld	21169,a
7331                     ; 2436 }
7334  000b 84            	pop	a
7335  000c 81            	ret
7409                     ; 2448 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
7409                     ; 2449 {
7410                     .text:	section	.text,new
7411  0000               _TIM1_SelectSlaveMode:
7413  0000 88            	push	a
7414       00000000      OFST:	set	0
7417                     ; 2451   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
7419                     ; 2454   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
7421  0001 c652b2        	ld	a,21170
7422  0004 a4f8          	and	a,#248
7423  0006 1a01          	or	a,(OFST+1,sp)
7424  0008 c752b2        	ld	21170,a
7425                     ; 2456 }
7428  000b 84            	pop	a
7429  000c 81            	ret
7465                     ; 2464 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
7465                     ; 2465 {
7466                     .text:	section	.text,new
7467  0000               _TIM1_SelectMasterSlaveMode:
7471                     ; 2467   assert_param(IS_FUNCTIONAL_STATE(NewState));
7473                     ; 2470   if (NewState != DISABLE)
7475  0000 4d            	tnz	a
7476  0001 2706          	jreq	L7663
7477                     ; 2472     TIM1->SMCR |= TIM1_SMCR_MSM;
7479  0003 721e52b2      	bset	21170,#7
7481  0007 2004          	jra	L1763
7482  0009               L7663:
7483                     ; 2476     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
7485  0009 721f52b2      	bres	21170,#7
7486  000d               L1763:
7487                     ; 2478 }
7490  000d 81            	ret
7544                     ; 2496 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7544                     ; 2497                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7544                     ; 2498                     uint8_t ExtTRGFilter)
7544                     ; 2499 {
7545                     .text:	section	.text,new
7546  0000               _TIM1_ETRConfig:
7548  0000 89            	pushw	x
7549       00000000      OFST:	set	0
7552                     ; 2500   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7554                     ; 2503   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
7554                     ; 2504                                    | (uint8_t) TIM1_ExtTRGPolarity)
7554                     ; 2505                          | (uint8_t) ExtTRGFilter);
7556  0001 9f            	ld	a,xl
7557  0002 1a01          	or	a,(OFST+1,sp)
7558  0004 1a05          	or	a,(OFST+5,sp)
7559  0006 ca52b3        	or	a,21171
7560  0009 c752b3        	ld	21171,a
7561                     ; 2506 }
7564  000c 85            	popw	x
7565  000d 81            	ret
7651                     ; 2544 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
7651                     ; 2545                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
7651                     ; 2546                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
7651                     ; 2547 {
7652                     .text:	section	.text,new
7653  0000               _TIM1_EncoderInterfaceConfig:
7655  0000 89            	pushw	x
7656       00000000      OFST:	set	0
7659                     ; 2549   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
7661                     ; 2550   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
7663                     ; 2551   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
7665                     ; 2554   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
7667  0001 9f            	ld	a,xl
7668  0002 4d            	tnz	a
7669  0003 2706          	jreq	L7573
7670                     ; 2556     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7672  0005 721252bd      	bset	21181,#1
7674  0009 2004          	jra	L1673
7675  000b               L7573:
7676                     ; 2560     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7678  000b 721352bd      	bres	21181,#1
7679  000f               L1673:
7680                     ; 2563   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
7682  000f 0d05          	tnz	(OFST+5,sp)
7683  0011 2706          	jreq	L3673
7684                     ; 2565     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7686  0013 721a52bd      	bset	21181,#5
7688  0017 2004          	jra	L5673
7689  0019               L3673:
7690                     ; 2569     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7692  0019 721b52bd      	bres	21181,#5
7693  001d               L5673:
7694                     ; 2572   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
7696  001d c652b2        	ld	a,21170
7697  0020 a4f0          	and	a,#240
7698  0022 1a01          	or	a,(OFST+1,sp)
7699  0024 c752b2        	ld	21170,a
7700                     ; 2575   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
7702  0027 c652b9        	ld	a,21177
7703  002a a4fc          	and	a,#252
7704  002c aa01          	or	a,#1
7705  002e c752b9        	ld	21177,a
7706                     ; 2576   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
7708  0031 c652ba        	ld	a,21178
7709  0034 a4fc          	and	a,#252
7710  0036 aa01          	or	a,#1
7711  0038 c752ba        	ld	21178,a
7712                     ; 2578 }
7715  003b 85            	popw	x
7716  003c 81            	ret
7752                     ; 2586 void TIM1_SelectHallSensor(FunctionalState NewState)
7752                     ; 2587 {
7753                     .text:	section	.text,new
7754  0000               _TIM1_SelectHallSensor:
7758                     ; 2589   assert_param(IS_FUNCTIONAL_STATE(NewState));
7760                     ; 2592   if (NewState != DISABLE)
7762  0000 4d            	tnz	a
7763  0001 2706          	jreq	L5004
7764                     ; 2594     TIM1->CR2 |= TIM1_CR2_TI1S;
7766  0003 721e52b1      	bset	21169,#7
7768  0007 2004          	jra	L7004
7769  0009               L5004:
7770                     ; 2598     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
7772  0009 721f52b1      	bres	21169,#7
7773  000d               L7004:
7774                     ; 2600 }
7777  000d 81            	ret
7823                     ; 2620 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7823                     ; 2621 {
7824                     .text:	section	.text,new
7825  0000               L3_TI1_Config:
7827  0000 89            	pushw	x
7828  0001 88            	push	a
7829       00000001      OFST:	set	1
7832                     ; 2624   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7834  0002 721152bd      	bres	21181,#0
7835                     ; 2627   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7835                     ; 2628                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7837  0006 7b06          	ld	a,(OFST+5,sp)
7838  0008 97            	ld	xl,a
7839  0009 a610          	ld	a,#16
7840  000b 42            	mul	x,a
7841  000c 9f            	ld	a,xl
7842  000d 1a03          	or	a,(OFST+2,sp)
7843  000f 6b01          	ld	(OFST+0,sp),a
7844  0011 c652b9        	ld	a,21177
7845  0014 a40c          	and	a,#12
7846  0016 1a01          	or	a,(OFST+0,sp)
7847  0018 c752b9        	ld	21177,a
7848                     ; 2633   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7850  001b 0d02          	tnz	(OFST+1,sp)
7851  001d 2706          	jreq	L1304
7852                     ; 2635     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7854  001f 721252bd      	bset	21181,#1
7856  0023 2004          	jra	L3304
7857  0025               L1304:
7858                     ; 2639     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7860  0025 721352bd      	bres	21181,#1
7861  0029               L3304:
7862                     ; 2643   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7864  0029 721052bd      	bset	21181,#0
7865                     ; 2644 }
7868  002d 5b03          	addw	sp,#3
7869  002f 81            	ret
7915                     ; 2660 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7915                     ; 2661 {
7916                     .text:	section	.text,new
7917  0000               L5_TI2_Config:
7919  0000 89            	pushw	x
7920  0001 88            	push	a
7921       00000001      OFST:	set	1
7924                     ; 2663   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7926  0002 721952bd      	bres	21181,#4
7927                     ; 2666   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7927                     ; 2667                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7929  0006 7b06          	ld	a,(OFST+5,sp)
7930  0008 97            	ld	xl,a
7931  0009 a610          	ld	a,#16
7932  000b 42            	mul	x,a
7933  000c 9f            	ld	a,xl
7934  000d 1a03          	or	a,(OFST+2,sp)
7935  000f 6b01          	ld	(OFST+0,sp),a
7936  0011 c652ba        	ld	a,21178
7937  0014 a40c          	and	a,#12
7938  0016 1a01          	or	a,(OFST+0,sp)
7939  0018 c752ba        	ld	21178,a
7940                     ; 2669   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7942  001b 0d02          	tnz	(OFST+1,sp)
7943  001d 2706          	jreq	L5504
7944                     ; 2671     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7946  001f 721a52bd      	bset	21181,#5
7948  0023 2004          	jra	L7504
7949  0025               L5504:
7950                     ; 2675     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7952  0025 721b52bd      	bres	21181,#5
7953  0029               L7504:
7954                     ; 2678   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7956  0029 721852bd      	bset	21181,#4
7957                     ; 2679 }
7960  002d 5b03          	addw	sp,#3
7961  002f 81            	ret
8007                     ; 2695 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8007                     ; 2696 {
8008                     .text:	section	.text,new
8009  0000               L7_TI3_Config:
8011  0000 89            	pushw	x
8012  0001 88            	push	a
8013       00000001      OFST:	set	1
8016                     ; 2698   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
8018  0002 721152be      	bres	21182,#0
8019                     ; 2701   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8019                     ; 2702                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8021  0006 7b06          	ld	a,(OFST+5,sp)
8022  0008 97            	ld	xl,a
8023  0009 a610          	ld	a,#16
8024  000b 42            	mul	x,a
8025  000c 9f            	ld	a,xl
8026  000d 1a03          	or	a,(OFST+2,sp)
8027  000f 6b01          	ld	(OFST+0,sp),a
8028  0011 c652bb        	ld	a,21179
8029  0014 a40c          	and	a,#12
8030  0016 1a01          	or	a,(OFST+0,sp)
8031  0018 c752bb        	ld	21179,a
8032                     ; 2705   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8034  001b 0d02          	tnz	(OFST+1,sp)
8035  001d 2706          	jreq	L1014
8036                     ; 2707     TIM1->CCER2 |= TIM1_CCER2_CC3P;
8038  001f 721252be      	bset	21182,#1
8040  0023 2004          	jra	L3014
8041  0025               L1014:
8042                     ; 2711     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
8044  0025 721352be      	bres	21182,#1
8045  0029               L3014:
8046                     ; 2714   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
8048  0029 721052be      	bset	21182,#0
8049                     ; 2715 }
8052  002d 5b03          	addw	sp,#3
8053  002f 81            	ret
8099                     ; 2730 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8099                     ; 2731 {
8100                     .text:	section	.text,new
8101  0000               L11_TI4_Config:
8103  0000 89            	pushw	x
8104  0001 88            	push	a
8105       00000001      OFST:	set	1
8108                     ; 2734   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
8110  0002 721952be      	bres	21182,#4
8111                     ; 2737   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8111                     ; 2738                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8113  0006 7b06          	ld	a,(OFST+5,sp)
8114  0008 97            	ld	xl,a
8115  0009 a610          	ld	a,#16
8116  000b 42            	mul	x,a
8117  000c 9f            	ld	a,xl
8118  000d 1a03          	or	a,(OFST+2,sp)
8119  000f 6b01          	ld	(OFST+0,sp),a
8120  0011 c652bc        	ld	a,21180
8121  0014 a40c          	and	a,#12
8122  0016 1a01          	or	a,(OFST+0,sp)
8123  0018 c752bc        	ld	21180,a
8124                     ; 2741   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8126  001b 0d02          	tnz	(OFST+1,sp)
8127  001d 2706          	jreq	L5214
8128                     ; 2743     TIM1->CCER2 |= TIM1_CCER2_CC4P;
8130  001f 721a52be      	bset	21182,#5
8132  0023 2004          	jra	L7214
8133  0025               L5214:
8134                     ; 2747     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
8136  0025 721b52be      	bres	21182,#5
8137  0029               L7214:
8138                     ; 2751   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
8140  0029 721852be      	bset	21182,#4
8141                     ; 2752 }
8144  002d 5b03          	addw	sp,#3
8145  002f 81            	ret
8158                     	xdef	_TIM1_SelectHallSensor
8159                     	xdef	_TIM1_EncoderInterfaceConfig
8160                     	xdef	_TIM1_ETRConfig
8161                     	xdef	_TIM1_SelectMasterSlaveMode
8162                     	xdef	_TIM1_SelectSlaveMode
8163                     	xdef	_TIM1_SelectOutputTrigger
8164                     	xdef	_TIM1_SelectInputTrigger
8165                     	xdef	_TIM1_ETRClockMode2Config
8166                     	xdef	_TIM1_ETRClockMode1Config
8167                     	xdef	_TIM1_TIxExternalClockConfig
8168                     	xdef	_TIM1_InternalClockConfig
8169                     	xdef	_TIM1_SelectCCDMA
8170                     	xdef	_TIM1_DMACmd
8171                     	xdef	_TIM1_DMAConfig
8172                     	xdef	_TIM1_ClearITPendingBit
8173                     	xdef	_TIM1_GetITStatus
8174                     	xdef	_TIM1_ClearFlag
8175                     	xdef	_TIM1_GetFlagStatus
8176                     	xdef	_TIM1_GenerateEvent
8177                     	xdef	_TIM1_ITConfig
8178                     	xdef	_TIM1_SetIC4Prescaler
8179                     	xdef	_TIM1_SetIC3Prescaler
8180                     	xdef	_TIM1_SetIC2Prescaler
8181                     	xdef	_TIM1_SetIC1Prescaler
8182                     	xdef	_TIM1_GetCapture4
8183                     	xdef	_TIM1_GetCapture3
8184                     	xdef	_TIM1_GetCapture2
8185                     	xdef	_TIM1_GetCapture1
8186                     	xdef	_TIM1_PWMIConfig
8187                     	xdef	_TIM1_ICInit
8188                     	xdef	_TIM1_CCxNCmd
8189                     	xdef	_TIM1_CCxCmd
8190                     	xdef	_TIM1_SelectCOM
8191                     	xdef	_TIM1_SelectOCREFClear
8192                     	xdef	_TIM1_OC3NPolarityConfig
8193                     	xdef	_TIM1_OC3PolarityConfig
8194                     	xdef	_TIM1_OC2NPolarityConfig
8195                     	xdef	_TIM1_OC2PolarityConfig
8196                     	xdef	_TIM1_OC1NPolarityConfig
8197                     	xdef	_TIM1_OC1PolarityConfig
8198                     	xdef	_TIM1_ClearOC4Ref
8199                     	xdef	_TIM1_ClearOC3Ref
8200                     	xdef	_TIM1_ClearOC2Ref
8201                     	xdef	_TIM1_ClearOC1Ref
8202                     	xdef	_TIM1_OC3FastConfig
8203                     	xdef	_TIM1_OC2FastConfig
8204                     	xdef	_TIM1_OC1FastConfig
8205                     	xdef	_TIM1_OC4PreloadConfig
8206                     	xdef	_TIM1_OC3PreloadConfig
8207                     	xdef	_TIM1_OC2PreloadConfig
8208                     	xdef	_TIM1_OC1PreloadConfig
8209                     	xdef	_TIM1_ForcedOC3Config
8210                     	xdef	_TIM1_ForcedOC2Config
8211                     	xdef	_TIM1_ForcedOC1Config
8212                     	xdef	_TIM1_CCPreloadControl
8213                     	xdef	_TIM1_SetCompare4
8214                     	xdef	_TIM1_SetCompare3
8215                     	xdef	_TIM1_SetCompare2
8216                     	xdef	_TIM1_SetCompare1
8217                     	xdef	_TIM1_SelectOCxM
8218                     	xdef	_TIM1_CtrlPWMOutputs
8219                     	xdef	_TIM1_BDTRConfig
8220                     	xdef	_TIM1_OC3Init
8221                     	xdef	_TIM1_OC2Init
8222                     	xdef	_TIM1_OC1Init
8223                     	xdef	_TIM1_Cmd
8224                     	xdef	_TIM1_SelectOnePulseMode
8225                     	xdef	_TIM1_ARRPreloadConfig
8226                     	xdef	_TIM1_UpdateRequestConfig
8227                     	xdef	_TIM1_UpdateDisableConfig
8228                     	xdef	_TIM1_GetPrescaler
8229                     	xdef	_TIM1_GetCounter
8230                     	xdef	_TIM1_SetAutoreload
8231                     	xdef	_TIM1_SetCounter
8232                     	xdef	_TIM1_CounterModeConfig
8233                     	xdef	_TIM1_PrescalerConfig
8234                     	xdef	_TIM1_TimeBaseInit
8235                     	xdef	_TIM1_DeInit
8254                     	end
