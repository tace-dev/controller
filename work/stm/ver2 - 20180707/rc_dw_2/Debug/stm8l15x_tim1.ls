   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 178 void TIM1_DeInit(void)
  50                     ; 179 {
  52                     .text:	section	.text,new
  53  0000               _TIM1_DeInit:
  57                     ; 180   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  59  0000 725f52b0      	clr	21168
  60                     ; 181   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  62  0004 725f52b1      	clr	21169
  63                     ; 182   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  65  0008 725f52b2      	clr	21170
  66                     ; 183   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  68  000c 725f52b3      	clr	21171
  69                     ; 184   TIM1->IER  = TIM1_IER_RESET_VALUE;
  71  0010 725f52b5      	clr	21173
  72                     ; 187   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  74  0014 725f52bd      	clr	21181
  75                     ; 188   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  77  0018 725f52be      	clr	21182
  78                     ; 190   TIM1->CCMR1 = 0x01;
  80  001c 350152b9      	mov	21177,#1
  81                     ; 191   TIM1->CCMR2 = 0x01;
  83  0020 350152ba      	mov	21178,#1
  84                     ; 192   TIM1->CCMR3 = 0x01;
  86  0024 350152bb      	mov	21179,#1
  87                     ; 193   TIM1->CCMR4 = 0x01;
  89  0028 350152bc      	mov	21180,#1
  90                     ; 195   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  92  002c 725f52bd      	clr	21181
  93                     ; 196   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  95  0030 725f52be      	clr	21182
  96                     ; 197   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  98  0034 725f52b9      	clr	21177
  99                     ; 198   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 101  0038 725f52ba      	clr	21178
 102                     ; 199   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 104  003c 725f52bb      	clr	21179
 105                     ; 200   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 107  0040 725f52bc      	clr	21180
 108                     ; 201   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 110  0044 725f52bf      	clr	21183
 111                     ; 202   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 113  0048 725f52c0      	clr	21184
 114                     ; 203   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 116  004c 725f52c1      	clr	21185
 117                     ; 204   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 119  0050 725f52c2      	clr	21186
 120                     ; 205   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 122  0054 35ff52c3      	mov	21187,#255
 123                     ; 206   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 125  0058 35ff52c4      	mov	21188,#255
 126                     ; 207   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 128  005c 725f52c6      	clr	21190
 129                     ; 208   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 131  0060 725f52c7      	clr	21191
 132                     ; 209   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 134  0064 725f52c8      	clr	21192
 135                     ; 210   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 137  0068 725f52c9      	clr	21193
 138                     ; 211   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 140  006c 725f52ca      	clr	21194
 141                     ; 212   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 143  0070 725f52cb      	clr	21195
 144                     ; 213   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 146  0074 725f52cc      	clr	21196
 147                     ; 214   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 149  0078 725f52cd      	clr	21197
 150                     ; 215   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 152  007c 725f52d0      	clr	21200
 153                     ; 216   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 155  0080 350152b8      	mov	21176,#1
 156                     ; 217   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 158  0084 725f52cf      	clr	21199
 159                     ; 218   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 161  0088 725f52ce      	clr	21198
 162                     ; 219   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 164  008c 725f52c5      	clr	21189
 165                     ; 220   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 167  0090 725f52b6      	clr	21174
 168                     ; 221   TIM1->SR2   = TIM1_SR2_RESET_VALUE;
 170  0094 725f52b7      	clr	21175
 171                     ; 222 }
 174  0098 81            	ret	
 277                     ; 238 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 277                     ; 239                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 277                     ; 240                        uint16_t TIM1_Period,
 277                     ; 241                        uint8_t TIM1_RepetitionCounter)
 277                     ; 242 {
 278                     .text:	section	.text,new
 279  0000               _TIM1_TimeBaseInit:
 281  0000 89            	pushw	x
 282       00000000      OFST:	set	0
 285                     ; 244   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 287                     ; 248   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 289  0001 7b06          	ld	a,(OFST+6,sp)
 290  0003 c752c3        	ld	21187,a
 291                     ; 249   TIM1->ARRL = (uint8_t)(TIM1_Period);
 293  0006 7b07          	ld	a,(OFST+7,sp)
 294  0008 c752c4        	ld	21188,a
 295                     ; 252   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 297  000b 9e            	ld	a,xh
 298  000c c752c1        	ld	21185,a
 299                     ; 253   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 301  000f 9f            	ld	a,xl
 302  0010 c752c2        	ld	21186,a
 303                     ; 256   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 303                     ; 257                         | (uint8_t)(TIM1_CounterMode));
 305  0013 c652b0        	ld	a,21168
 306  0016 a48f          	and	a,#143
 307  0018 1a05          	or	a,(OFST+5,sp)
 308  001a c752b0        	ld	21168,a
 309                     ; 260   TIM1->RCR = TIM1_RepetitionCounter;
 311  001d 7b08          	ld	a,(OFST+8,sp)
 312  001f c752c5        	ld	21189,a
 313                     ; 262 }
 316  0022 85            	popw	x
 317  0023 81            	ret	
 382                     ; 276 void TIM1_PrescalerConfig(uint16_t Prescaler, TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 382                     ; 277 {
 383                     .text:	section	.text,new
 384  0000               _TIM1_PrescalerConfig:
 386  0000 89            	pushw	x
 387       00000000      OFST:	set	0
 390                     ; 279   assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
 392                     ; 282   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
 394  0001 9e            	ld	a,xh
 395  0002 c752c1        	ld	21185,a
 396                     ; 283   TIM1->PSCRL = (uint8_t)(Prescaler);
 398  0005 9f            	ld	a,xl
 399  0006 c752c2        	ld	21186,a
 400                     ; 286   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
 402  0009 7b05          	ld	a,(OFST+5,sp)
 403  000b c752b8        	ld	21176,a
 404                     ; 287 }
 407  000e 85            	popw	x
 408  000f 81            	ret	
 444                     ; 300 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 444                     ; 301 {
 445                     .text:	section	.text,new
 446  0000               _TIM1_CounterModeConfig:
 448  0000 88            	push	a
 449       00000000      OFST:	set	0
 452                     ; 303   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 454                     ; 307   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 454                     ; 308                         | (uint8_t)TIM1_CounterMode);
 456  0001 c652b0        	ld	a,21168
 457  0004 a48f          	and	a,#143
 458  0006 1a01          	or	a,(OFST+1,sp)
 459  0008 c752b0        	ld	21168,a
 460                     ; 309 }
 463  000b 84            	pop	a
 464  000c 81            	ret	
 496                     ; 317 void TIM1_SetCounter(uint16_t Counter)
 496                     ; 318 {
 497                     .text:	section	.text,new
 498  0000               _TIM1_SetCounter:
 502                     ; 320   TIM1->CNTRH = (uint8_t)(Counter >> 8);
 504  0000 9e            	ld	a,xh
 505  0001 c752bf        	ld	21183,a
 506                     ; 321   TIM1->CNTRL = (uint8_t)(Counter);
 508  0004 9f            	ld	a,xl
 509  0005 c752c0        	ld	21184,a
 510                     ; 322 }
 513  0008 81            	ret	
 545                     ; 330 void TIM1_SetAutoreload(uint16_t Autoreload)
 545                     ; 331 {
 546                     .text:	section	.text,new
 547  0000               _TIM1_SetAutoreload:
 551                     ; 333   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
 553  0000 9e            	ld	a,xh
 554  0001 c752c3        	ld	21187,a
 555                     ; 334   TIM1->ARRL = (uint8_t)(Autoreload);
 557  0004 9f            	ld	a,xl
 558  0005 c752c4        	ld	21188,a
 559                     ; 335 }
 562  0008 81            	ret	
 608                     ; 342 uint16_t TIM1_GetCounter(void)
 608                     ; 343 {
 609                     .text:	section	.text,new
 610  0000               _TIM1_GetCounter:
 612  0000 5204          	subw	sp,#4
 613       00000004      OFST:	set	4
 616                     ; 345   uint16_t tmpcntr = 0;
 618                     ; 346   uint8_t tmpcntrl = 0, tmpcntrh = 0;
 622                     ; 348   tmpcntrh = TIM1->CNTRH;
 624  0002 c652bf        	ld	a,21183
 625  0005 6b02          	ld	(OFST-2,sp),a
 626                     ; 349   tmpcntrl = TIM1->CNTRL;
 628  0007 c652c0        	ld	a,21184
 629  000a 6b01          	ld	(OFST-3,sp),a
 630                     ; 351   tmpcntr  = (uint16_t)(tmpcntrl);
 632  000c 5f            	clrw	x
 633  000d 97            	ld	xl,a
 634  000e 1f03          	ldw	(OFST-1,sp),x
 635                     ; 352   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
 637  0010 5f            	clrw	x
 638  0011 7b02          	ld	a,(OFST-2,sp)
 639  0013 97            	ld	xl,a
 640  0014 7b04          	ld	a,(OFST+0,sp)
 641  0016 01            	rrwa	x,a
 642  0017 1a03          	or	a,(OFST-1,sp)
 643  0019 01            	rrwa	x,a
 644                     ; 355   return (uint16_t)tmpcntr;
 648  001a 5b04          	addw	sp,#4
 649  001c 81            	ret	
 681                     ; 363 uint16_t TIM1_GetPrescaler(void)
 681                     ; 364 {
 682                     .text:	section	.text,new
 683  0000               _TIM1_GetPrescaler:
 685  0000 89            	pushw	x
 686       00000002      OFST:	set	2
 689                     ; 365   uint16_t tmpreg = 0;
 691                     ; 366   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
 693  0001 c652c1        	ld	a,21185
 694  0004 97            	ld	xl,a
 695  0005 4f            	clr	a
 696  0006 02            	rlwa	x,a
 697  0007 1f01          	ldw	(OFST-1,sp),x
 698                     ; 368   return (uint16_t)(tmpreg | TIM1->PSCRL);
 700  0009 c652c2        	ld	a,21186
 701  000c 5f            	clrw	x
 702  000d 97            	ld	xl,a
 703  000e 01            	rrwa	x,a
 704  000f 1a02          	or	a,(OFST+0,sp)
 705  0011 01            	rrwa	x,a
 706  0012 1a01          	or	a,(OFST-1,sp)
 707  0014 01            	rrwa	x,a
 710  0015 5b02          	addw	sp,#2
 711  0017 81            	ret	
 767                     ; 377 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 767                     ; 378 {
 768                     .text:	section	.text,new
 769  0000               _TIM1_UpdateDisableConfig:
 773                     ; 380   assert_param(IS_FUNCTIONAL_STATE(NewState));
 775                     ; 383   if (NewState != DISABLE)
 777  0000 4d            	tnz	a
 778  0001 2705          	jreq	L352
 779                     ; 385     TIM1->CR1 |= TIM1_CR1_UDIS;
 781  0003 721252b0      	bset	21168,#1
 784  0007 81            	ret	
 785  0008               L352:
 786                     ; 389     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 788  0008 721352b0      	bres	21168,#1
 789                     ; 391 }
 792  000c 81            	ret	
 850                     ; 401 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 850                     ; 402 {
 851                     .text:	section	.text,new
 852  0000               _TIM1_UpdateRequestConfig:
 856                     ; 404   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
 858                     ; 407   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
 860  0000 4d            	tnz	a
 861  0001 2705          	jreq	L503
 862                     ; 409     TIM1->CR1 |= TIM1_CR1_URS;
 864  0003 721452b0      	bset	21168,#2
 867  0007 81            	ret	
 868  0008               L503:
 869                     ; 413     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 871  0008 721552b0      	bres	21168,#2
 872                     ; 415 }
 875  000c 81            	ret	
 911                     ; 423 void TIM1_ARRPreloadConfig(FunctionalState NewState)
 911                     ; 424 {
 912                     .text:	section	.text,new
 913  0000               _TIM1_ARRPreloadConfig:
 917                     ; 426   assert_param(IS_FUNCTIONAL_STATE(NewState));
 919                     ; 429   if (NewState != DISABLE)
 921  0000 4d            	tnz	a
 922  0001 2705          	jreq	L723
 923                     ; 431     TIM1->CR1 |= TIM1_CR1_ARPE;
 925  0003 721e52b0      	bset	21168,#7
 928  0007 81            	ret	
 929  0008               L723:
 930                     ; 435     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
 932  0008 721f52b0      	bres	21168,#7
 933                     ; 437 }
 936  000c 81            	ret	
 993                     ; 447 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
 993                     ; 448 {
 994                     .text:	section	.text,new
 995  0000               _TIM1_SelectOnePulseMode:
 999                     ; 450   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
1001                     ; 453   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
1003  0000 4d            	tnz	a
1004  0001 2705          	jreq	L163
1005                     ; 455     TIM1->CR1 |= TIM1_CR1_OPM;
1007  0003 721652b0      	bset	21168,#3
1010  0007 81            	ret	
1011  0008               L163:
1012                     ; 459     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
1014  0008 721752b0      	bres	21168,#3
1015                     ; 461 }
1018  000c 81            	ret	
1053                     ; 469 void TIM1_Cmd(FunctionalState NewState)
1053                     ; 470 {
1054                     .text:	section	.text,new
1055  0000               _TIM1_Cmd:
1059                     ; 472   assert_param(IS_FUNCTIONAL_STATE(NewState));
1061                     ; 475   if (NewState != DISABLE)
1063  0000 4d            	tnz	a
1064  0001 2705          	jreq	L304
1065                     ; 477     TIM1->CR1 |= TIM1_CR1_CEN;
1067  0003 721052b0      	bset	21168,#0
1070  0007 81            	ret	
1071  0008               L304:
1072                     ; 481     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1074  0008 721152b0      	bres	21168,#0
1075                     ; 483 }
1078  000c 81            	ret	
1361                     ; 574 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1361                     ; 575                   TIM1_OutputState_TypeDef TIM1_OutputState,
1361                     ; 576                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1361                     ; 577                   uint16_t TIM1_Pulse,
1361                     ; 578                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1361                     ; 579                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1361                     ; 580                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1361                     ; 581                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1361                     ; 582 {
1362                     .text:	section	.text,new
1363  0000               _TIM1_OC1Init:
1365  0000 89            	pushw	x
1366  0001 5203          	subw	sp,#3
1367       00000003      OFST:	set	3
1370                     ; 584   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1372                     ; 585   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1374                     ; 586   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1376                     ; 587   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1378                     ; 588   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1380                     ; 589   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1382                     ; 590   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1384                     ; 594   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
1384                     ; 595                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
1386  0003 c652bd        	ld	a,21181
1387  0006 a4f0          	and	a,#240
1388  0008 c752bd        	ld	21181,a
1389                     ; 598   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
1389                     ; 599                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
1389                     ; 600                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
1389                     ; 601                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
1391  000b 7b0c          	ld	a,(OFST+9,sp)
1392  000d a408          	and	a,#8
1393  000f 6b03          	ld	(OFST+0,sp),a
1394  0011 7b0b          	ld	a,(OFST+8,sp)
1395  0013 a402          	and	a,#2
1396  0015 1a03          	or	a,(OFST+0,sp)
1397  0017 6b02          	ld	(OFST-1,sp),a
1398  0019 7b08          	ld	a,(OFST+5,sp)
1399  001b a404          	and	a,#4
1400  001d 6b01          	ld	(OFST-2,sp),a
1401  001f 9f            	ld	a,xl
1402  0020 a401          	and	a,#1
1403  0022 1a01          	or	a,(OFST-2,sp)
1404  0024 1a02          	or	a,(OFST-1,sp)
1405  0026 ca52bd        	or	a,21181
1406  0029 c752bd        	ld	21181,a
1407                     ; 604   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
1407                     ; 605                           | (uint8_t)TIM1_OCMode);
1409  002c c652b9        	ld	a,21177
1410  002f a48f          	and	a,#143
1411  0031 1a04          	or	a,(OFST+1,sp)
1412  0033 c752b9        	ld	21177,a
1413                     ; 608   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
1415  0036 c652d0        	ld	a,21200
1416  0039 a4fc          	and	a,#252
1417  003b c752d0        	ld	21200,a
1418                     ; 610   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
1418                     ; 611                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
1420  003e 7b0e          	ld	a,(OFST+11,sp)
1421  0040 a402          	and	a,#2
1422  0042 6b03          	ld	(OFST+0,sp),a
1423  0044 7b0d          	ld	a,(OFST+10,sp)
1424  0046 a401          	and	a,#1
1425  0048 1a03          	or	a,(OFST+0,sp)
1426  004a ca52d0        	or	a,21200
1427  004d c752d0        	ld	21200,a
1428                     ; 614   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
1430  0050 7b09          	ld	a,(OFST+6,sp)
1431  0052 c752c6        	ld	21190,a
1432                     ; 615   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
1434  0055 7b0a          	ld	a,(OFST+7,sp)
1435  0057 c752c7        	ld	21191,a
1436                     ; 616 }
1439  005a 5b05          	addw	sp,#5
1440  005c 81            	ret	
1542                     ; 655 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1542                     ; 656                   TIM1_OutputState_TypeDef TIM1_OutputState,
1542                     ; 657                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1542                     ; 658                   uint16_t TIM1_Pulse,
1542                     ; 659                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1542                     ; 660                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1542                     ; 661                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1542                     ; 662                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1542                     ; 663 {
1543                     .text:	section	.text,new
1544  0000               _TIM1_OC2Init:
1546  0000 89            	pushw	x
1547  0001 5203          	subw	sp,#3
1548       00000003      OFST:	set	3
1551                     ; 666   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1553                     ; 667   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1555                     ; 668   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1557                     ; 669   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1559                     ; 670   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1561                     ; 671   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1563                     ; 672   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1565                     ; 676   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1567  0003 c652bd        	ld	a,21181
1568  0006 a40f          	and	a,#15
1569  0008 c752bd        	ld	21181,a
1570                     ; 679   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
1570                     ; 680                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
1572  000b 7b0c          	ld	a,(OFST+9,sp)
1573  000d a480          	and	a,#128
1574  000f 6b03          	ld	(OFST+0,sp),a
1575  0011 7b0b          	ld	a,(OFST+8,sp)
1576  0013 a420          	and	a,#32
1577  0015 1a03          	or	a,(OFST+0,sp)
1578  0017 6b02          	ld	(OFST-1,sp),a
1579  0019 7b08          	ld	a,(OFST+5,sp)
1580  001b a440          	and	a,#64
1581  001d 6b01          	ld	(OFST-2,sp),a
1582  001f 9f            	ld	a,xl
1583  0020 a410          	and	a,#16
1584  0022 1a01          	or	a,(OFST-2,sp)
1585  0024 1a02          	or	a,(OFST-1,sp)
1586  0026 ca52bd        	or	a,21181
1587  0029 c752bd        	ld	21181,a
1588                     ; 683   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1590  002c c652ba        	ld	a,21178
1591  002f a48f          	and	a,#143
1592  0031 1a04          	or	a,(OFST+1,sp)
1593  0033 c752ba        	ld	21178,a
1594                     ; 686   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1596  0036 c652d0        	ld	a,21200
1597  0039 a4f3          	and	a,#243
1598  003b c752d0        	ld	21200,a
1599                     ; 688   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1601  003e 7b0e          	ld	a,(OFST+11,sp)
1602  0040 a408          	and	a,#8
1603  0042 6b03          	ld	(OFST+0,sp),a
1604  0044 7b0d          	ld	a,(OFST+10,sp)
1605  0046 a404          	and	a,#4
1606  0048 1a03          	or	a,(OFST+0,sp)
1607  004a ca52d0        	or	a,21200
1608  004d c752d0        	ld	21200,a
1609                     ; 691   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1611  0050 7b09          	ld	a,(OFST+6,sp)
1612  0052 c752c8        	ld	21192,a
1613                     ; 692   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1615  0055 7b0a          	ld	a,(OFST+7,sp)
1616  0057 c752c9        	ld	21193,a
1617                     ; 693 }
1620  005a 5b05          	addw	sp,#5
1621  005c 81            	ret	
1723                     ; 732 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1723                     ; 733                   TIM1_OutputState_TypeDef TIM1_OutputState,
1723                     ; 734                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1723                     ; 735                   uint16_t TIM1_Pulse,
1723                     ; 736                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1723                     ; 737                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1723                     ; 738                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1723                     ; 739                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1723                     ; 740 {
1724                     .text:	section	.text,new
1725  0000               _TIM1_OC3Init:
1727  0000 89            	pushw	x
1728  0001 5203          	subw	sp,#3
1729       00000003      OFST:	set	3
1732                     ; 743   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1734                     ; 744   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1736                     ; 745   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1738                     ; 746   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1740                     ; 747   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1742                     ; 748   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1744                     ; 749   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1746                     ; 753   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1748  0003 c652be        	ld	a,21182
1749  0006 a4f0          	and	a,#240
1750  0008 c752be        	ld	21182,a
1751                     ; 756   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
1751                     ; 757                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
1753  000b 7b0c          	ld	a,(OFST+9,sp)
1754  000d a408          	and	a,#8
1755  000f 6b03          	ld	(OFST+0,sp),a
1756  0011 7b0b          	ld	a,(OFST+8,sp)
1757  0013 a402          	and	a,#2
1758  0015 1a03          	or	a,(OFST+0,sp)
1759  0017 6b02          	ld	(OFST-1,sp),a
1760  0019 7b08          	ld	a,(OFST+5,sp)
1761  001b a404          	and	a,#4
1762  001d 6b01          	ld	(OFST-2,sp),a
1763  001f 9f            	ld	a,xl
1764  0020 a401          	and	a,#1
1765  0022 1a01          	or	a,(OFST-2,sp)
1766  0024 1a02          	or	a,(OFST-1,sp)
1767  0026 ca52be        	or	a,21182
1768  0029 c752be        	ld	21182,a
1769                     ; 760   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1771  002c c652bb        	ld	a,21179
1772  002f a48f          	and	a,#143
1773  0031 1a04          	or	a,(OFST+1,sp)
1774  0033 c752bb        	ld	21179,a
1775                     ; 763   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1777  0036 c652d0        	ld	a,21200
1778  0039 a4cf          	and	a,#207
1779  003b c752d0        	ld	21200,a
1780                     ; 765   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1782  003e 7b0e          	ld	a,(OFST+11,sp)
1783  0040 a420          	and	a,#32
1784  0042 6b03          	ld	(OFST+0,sp),a
1785  0044 7b0d          	ld	a,(OFST+10,sp)
1786  0046 a410          	and	a,#16
1787  0048 1a03          	or	a,(OFST+0,sp)
1788  004a ca52d0        	or	a,21200
1789  004d c752d0        	ld	21200,a
1790                     ; 768   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1792  0050 7b09          	ld	a,(OFST+6,sp)
1793  0052 c752ca        	ld	21194,a
1794                     ; 769   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1796  0055 7b0a          	ld	a,(OFST+7,sp)
1797  0057 c752cb        	ld	21195,a
1798                     ; 770 }
1801  005a 5b05          	addw	sp,#5
1802  005c 81            	ret	
2007                     ; 800 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
2007                     ; 801                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
2007                     ; 802                      uint8_t TIM1_DeadTime,
2007                     ; 803                      TIM1_BreakState_TypeDef TIM1_Break,
2007                     ; 804                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
2007                     ; 805                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
2007                     ; 806 {
2008                     .text:	section	.text,new
2009  0000               _TIM1_BDTRConfig:
2011  0000 89            	pushw	x
2012  0001 88            	push	a
2013       00000001      OFST:	set	1
2016                     ; 809   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
2018                     ; 810   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
2020                     ; 811   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
2022                     ; 812   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
2024                     ; 813   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
2026                     ; 815   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2028  0002 7b06          	ld	a,(OFST+5,sp)
2029  0004 c752cf        	ld	21199,a
2030                     ; 819   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
2030                     ; 820                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
2030                     ; 821                                       | (uint8_t)TIM1_AutomaticOutput));
2032  0007 7b07          	ld	a,(OFST+6,sp)
2033  0009 1a08          	or	a,(OFST+7,sp)
2034  000b 1a09          	or	a,(OFST+8,sp)
2035  000d 6b01          	ld	(OFST+0,sp),a
2036  000f 9f            	ld	a,xl
2037  0010 1a02          	or	a,(OFST+1,sp)
2038  0012 1a01          	or	a,(OFST+0,sp)
2039  0014 c752ce        	ld	21198,a
2040                     ; 823 }
2043  0017 5b03          	addw	sp,#3
2044  0019 81            	ret	
2080                     ; 831 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2080                     ; 832 {
2081                     .text:	section	.text,new
2082  0000               _TIM1_CtrlPWMOutputs:
2086                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2088                     ; 838   if (NewState != DISABLE)
2090  0000 4d            	tnz	a
2091  0001 2705          	jreq	L1301
2092                     ; 840     TIM1->BKR |= TIM1_BKR_MOE;
2094  0003 721e52ce      	bset	21198,#7
2097  0007 81            	ret	
2098  0008               L1301:
2099                     ; 844     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2101  0008 721f52ce      	bres	21198,#7
2102                     ; 846 }
2105  000c 81            	ret	
2184                     ; 868 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
2184                     ; 869 {
2185                     .text:	section	.text,new
2186  0000               _TIM1_SelectOCxM:
2188  0000 89            	pushw	x
2189       00000000      OFST:	set	0
2192                     ; 871   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
2194                     ; 872   assert_param(IS_TIM1_OCM(TIM1_OCMode));
2196                     ; 874   if (TIM1_Channel == TIM1_Channel_1)
2198  0001 9e            	ld	a,xh
2199  0002 4d            	tnz	a
2200  0003 2610          	jrne	L3701
2201                     ; 877     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2203  0005 721152bd      	bres	21181,#0
2204                     ; 880     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2206  0009 c652b9        	ld	a,21177
2207  000c a48f          	and	a,#143
2208  000e 1a02          	or	a,(OFST+2,sp)
2209  0010 c752b9        	ld	21177,a
2211  0013 2023          	jra	L5701
2212  0015               L3701:
2213                     ; 882   else if (TIM1_Channel == TIM1_Channel_2)
2215  0015 7b01          	ld	a,(OFST+1,sp)
2216  0017 4a            	dec	a
2217  0018 2610          	jrne	L7701
2218                     ; 885     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
2220  001a 721952bd      	bres	21181,#4
2221                     ; 888     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2223  001e c652ba        	ld	a,21178
2224  0021 a48f          	and	a,#143
2225  0023 1a02          	or	a,(OFST+2,sp)
2226  0025 c752ba        	ld	21178,a
2228  0028 200e          	jra	L5701
2229  002a               L7701:
2230                     ; 893     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
2232  002a 721152be      	bres	21182,#0
2233                     ; 896     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2235  002e c652bb        	ld	a,21179
2236  0031 a48f          	and	a,#143
2237  0033 1a02          	or	a,(OFST+2,sp)
2238  0035 c752bb        	ld	21179,a
2239  0038               L5701:
2240                     ; 899 }
2243  0038 85            	popw	x
2244  0039 81            	ret	
2276                     ; 907 void TIM1_SetCompare1(uint16_t Compare1)
2276                     ; 908 {
2277                     .text:	section	.text,new
2278  0000               _TIM1_SetCompare1:
2282                     ; 910   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
2284  0000 9e            	ld	a,xh
2285  0001 c752c6        	ld	21190,a
2286                     ; 911   TIM1->CCR1L = (uint8_t)(Compare1);
2288  0004 9f            	ld	a,xl
2289  0005 c752c7        	ld	21191,a
2290                     ; 913 }
2293  0008 81            	ret	
2325                     ; 921 void TIM1_SetCompare2(uint16_t Compare2)
2325                     ; 922 {
2326                     .text:	section	.text,new
2327  0000               _TIM1_SetCompare2:
2331                     ; 924   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
2333  0000 9e            	ld	a,xh
2334  0001 c752c8        	ld	21192,a
2335                     ; 925   TIM1->CCR2L = (uint8_t)(Compare2);
2337  0004 9f            	ld	a,xl
2338  0005 c752c9        	ld	21193,a
2339                     ; 926 }
2342  0008 81            	ret	
2374                     ; 934 void TIM1_SetCompare3(uint16_t Compare3)
2374                     ; 935 {
2375                     .text:	section	.text,new
2376  0000               _TIM1_SetCompare3:
2380                     ; 937   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
2382  0000 9e            	ld	a,xh
2383  0001 c752ca        	ld	21194,a
2384                     ; 938   TIM1->CCR3L = (uint8_t)(Compare3);
2386  0004 9f            	ld	a,xl
2387  0005 c752cb        	ld	21195,a
2388                     ; 939 }
2391  0008 81            	ret	
2423                     ; 947 void TIM1_SetCompare4(uint16_t Compare4)
2423                     ; 948 {
2424                     .text:	section	.text,new
2425  0000               _TIM1_SetCompare4:
2429                     ; 950   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
2431  0000 9e            	ld	a,xh
2432  0001 c752cc        	ld	21196,a
2433                     ; 951   TIM1->CCR4L = (uint8_t)(Compare4);
2435  0004 9f            	ld	a,xl
2436  0005 c752cd        	ld	21197,a
2437                     ; 952 }
2440  0008 81            	ret	
2476                     ; 960 void TIM1_CCPreloadControl(FunctionalState NewState)
2476                     ; 961 {
2477                     .text:	section	.text,new
2478  0000               _TIM1_CCPreloadControl:
2482                     ; 963   assert_param(IS_FUNCTIONAL_STATE(NewState));
2484                     ; 966   if (NewState != DISABLE)
2486  0000 4d            	tnz	a
2487  0001 2705          	jreq	L1021
2488                     ; 968     TIM1->CR2 |= TIM1_CR2_CCPC;
2490  0003 721052b1      	bset	21169,#0
2493  0007 81            	ret	
2494  0008               L1021:
2495                     ; 972     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
2497  0008 721152b1      	bres	21169,#0
2498                     ; 974 }
2501  000c 81            	ret	
2559                     ; 984 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2559                     ; 985 {
2560                     .text:	section	.text,new
2561  0000               _TIM1_ForcedOC1Config:
2563  0000 88            	push	a
2564       00000000      OFST:	set	0
2567                     ; 987   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2569                     ; 990   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2571  0001 c652b9        	ld	a,21177
2572  0004 a48f          	and	a,#143
2573  0006 1a01          	or	a,(OFST+1,sp)
2574  0008 c752b9        	ld	21177,a
2575                     ; 991 }
2578  000b 84            	pop	a
2579  000c 81            	ret	
2615                     ; 1001 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2615                     ; 1002 {
2616                     .text:	section	.text,new
2617  0000               _TIM1_ForcedOC2Config:
2619  0000 88            	push	a
2620       00000000      OFST:	set	0
2623                     ; 1004   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2625                     ; 1007   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2627  0001 c652ba        	ld	a,21178
2628  0004 a48f          	and	a,#143
2629  0006 1a01          	or	a,(OFST+1,sp)
2630  0008 c752ba        	ld	21178,a
2631                     ; 1008 }
2634  000b 84            	pop	a
2635  000c 81            	ret	
2671                     ; 1018 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2671                     ; 1019 {
2672                     .text:	section	.text,new
2673  0000               _TIM1_ForcedOC3Config:
2675  0000 88            	push	a
2676       00000000      OFST:	set	0
2679                     ; 1021   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2681                     ; 1024   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2683  0001 c652bb        	ld	a,21179
2684  0004 a48f          	and	a,#143
2685  0006 1a01          	or	a,(OFST+1,sp)
2686  0008 c752bb        	ld	21179,a
2687                     ; 1025 }
2690  000b 84            	pop	a
2691  000c 81            	ret	
2727                     ; 1033 void TIM1_OC1PreloadConfig(FunctionalState NewState)
2727                     ; 1034 {
2728                     .text:	section	.text,new
2729  0000               _TIM1_OC1PreloadConfig:
2733                     ; 1036   assert_param(IS_FUNCTIONAL_STATE(NewState));
2735                     ; 1039   if (NewState != DISABLE)
2737  0000 4d            	tnz	a
2738  0001 2705          	jreq	L5031
2739                     ; 1041     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
2741  0003 721652b9      	bset	21177,#3
2744  0007 81            	ret	
2745  0008               L5031:
2746                     ; 1045     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2748  0008 721752b9      	bres	21177,#3
2749                     ; 1047 }
2752  000c 81            	ret	
2788                     ; 1055 void TIM1_OC2PreloadConfig(FunctionalState NewState)
2788                     ; 1056 {
2789                     .text:	section	.text,new
2790  0000               _TIM1_OC2PreloadConfig:
2794                     ; 1058   assert_param(IS_FUNCTIONAL_STATE(NewState));
2796                     ; 1061   if (NewState != DISABLE)
2798  0000 4d            	tnz	a
2799  0001 2705          	jreq	L7231
2800                     ; 1063     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
2802  0003 721652ba      	bset	21178,#3
2805  0007 81            	ret	
2806  0008               L7231:
2807                     ; 1067     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2809  0008 721752ba      	bres	21178,#3
2810                     ; 1069 }
2813  000c 81            	ret	
2849                     ; 1077 void TIM1_OC3PreloadConfig(FunctionalState NewState)
2849                     ; 1078 {
2850                     .text:	section	.text,new
2851  0000               _TIM1_OC3PreloadConfig:
2855                     ; 1080   assert_param(IS_FUNCTIONAL_STATE(NewState));
2857                     ; 1083   if (NewState != DISABLE)
2859  0000 4d            	tnz	a
2860  0001 2705          	jreq	L1531
2861                     ; 1085     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
2863  0003 721652bb      	bset	21179,#3
2866  0007 81            	ret	
2867  0008               L1531:
2868                     ; 1089     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2870  0008 721752bb      	bres	21179,#3
2871                     ; 1091 }
2874  000c 81            	ret	
2910                     ; 1099 void TIM1_OC4PreloadConfig(FunctionalState NewState)
2910                     ; 1100 {
2911                     .text:	section	.text,new
2912  0000               _TIM1_OC4PreloadConfig:
2916                     ; 1102   assert_param(IS_FUNCTIONAL_STATE(NewState));
2918                     ; 1105   if (NewState != DISABLE)
2920  0000 4d            	tnz	a
2921  0001 2705          	jreq	L3731
2922                     ; 1107     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
2924  0003 721652bc      	bset	21180,#3
2927  0007 81            	ret	
2928  0008               L3731:
2929                     ; 1111     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2931  0008 721752bc      	bres	21180,#3
2932                     ; 1113 }
2935  000c 81            	ret	
2970                     ; 1121 void TIM1_OC1FastConfig(FunctionalState NewState)
2970                     ; 1122 {
2971                     .text:	section	.text,new
2972  0000               _TIM1_OC1FastConfig:
2976                     ; 1124   assert_param(IS_FUNCTIONAL_STATE(NewState));
2978                     ; 1127   if (NewState != DISABLE)
2980  0000 4d            	tnz	a
2981  0001 2705          	jreq	L5141
2982                     ; 1129     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
2984  0003 721452b9      	bset	21177,#2
2987  0007 81            	ret	
2988  0008               L5141:
2989                     ; 1133     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
2991  0008 721552b9      	bres	21177,#2
2992                     ; 1135 }
2995  000c 81            	ret	
3030                     ; 1143 void TIM1_OC2FastConfig(FunctionalState NewState)
3030                     ; 1144 {
3031                     .text:	section	.text,new
3032  0000               _TIM1_OC2FastConfig:
3036                     ; 1146   assert_param(IS_FUNCTIONAL_STATE(NewState));
3038                     ; 1149   if (NewState != DISABLE)
3040  0000 4d            	tnz	a
3041  0001 2705          	jreq	L7341
3042                     ; 1151     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
3044  0003 721452ba      	bset	21178,#2
3047  0007 81            	ret	
3048  0008               L7341:
3049                     ; 1155     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3051  0008 721552ba      	bres	21178,#2
3052                     ; 1157 }
3055  000c 81            	ret	
3090                     ; 1165 void TIM1_OC3FastConfig(FunctionalState NewState)
3090                     ; 1166 {
3091                     .text:	section	.text,new
3092  0000               _TIM1_OC3FastConfig:
3096                     ; 1168   assert_param(IS_FUNCTIONAL_STATE(NewState));
3098                     ; 1171   if (NewState != DISABLE)
3100  0000 4d            	tnz	a
3101  0001 2705          	jreq	L1641
3102                     ; 1173     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
3104  0003 721452bb      	bset	21179,#2
3107  0007 81            	ret	
3108  0008               L1641:
3109                     ; 1177     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3111  0008 721552bb      	bres	21179,#2
3112                     ; 1179 }
3115  000c 81            	ret	
3150                     ; 1187 void TIM1_ClearOC1Ref(FunctionalState NewState)
3150                     ; 1188 {
3151                     .text:	section	.text,new
3152  0000               _TIM1_ClearOC1Ref:
3156                     ; 1190   assert_param(IS_FUNCTIONAL_STATE(NewState));
3158                     ; 1193   if (NewState != DISABLE)
3160  0000 4d            	tnz	a
3161  0001 2705          	jreq	L3051
3162                     ; 1195     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
3164  0003 721e52b9      	bset	21177,#7
3167  0007 81            	ret	
3168  0008               L3051:
3169                     ; 1199     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3171  0008 721f52b9      	bres	21177,#7
3172                     ; 1201 }
3175  000c 81            	ret	
3210                     ; 1209 void TIM1_ClearOC2Ref(FunctionalState NewState)
3210                     ; 1210 {
3211                     .text:	section	.text,new
3212  0000               _TIM1_ClearOC2Ref:
3216                     ; 1212   assert_param(IS_FUNCTIONAL_STATE(NewState));
3218                     ; 1215   if (NewState != DISABLE)
3220  0000 4d            	tnz	a
3221  0001 2705          	jreq	L5251
3222                     ; 1217     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
3224  0003 721e52ba      	bset	21178,#7
3227  0007 81            	ret	
3228  0008               L5251:
3229                     ; 1221     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3231  0008 721f52ba      	bres	21178,#7
3232                     ; 1223 }
3235  000c 81            	ret	
3270                     ; 1231 void TIM1_ClearOC3Ref(FunctionalState NewState)
3270                     ; 1232 {
3271                     .text:	section	.text,new
3272  0000               _TIM1_ClearOC3Ref:
3276                     ; 1234   assert_param(IS_FUNCTIONAL_STATE(NewState));
3278                     ; 1237   if (NewState != DISABLE)
3280  0000 4d            	tnz	a
3281  0001 2705          	jreq	L7451
3282                     ; 1239     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
3284  0003 721e52bb      	bset	21179,#7
3287  0007 81            	ret	
3288  0008               L7451:
3289                     ; 1243     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3291  0008 721f52bb      	bres	21179,#7
3292                     ; 1245 }
3295  000c 81            	ret	
3330                     ; 1253 void TIM1_ClearOC4Ref(FunctionalState NewState)
3330                     ; 1254 {
3331                     .text:	section	.text,new
3332  0000               _TIM1_ClearOC4Ref:
3336                     ; 1256   assert_param(IS_FUNCTIONAL_STATE(NewState));
3338                     ; 1259   if (NewState != DISABLE)
3340  0000 4d            	tnz	a
3341  0001 2705          	jreq	L1751
3342                     ; 1261     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
3344  0003 721e52bc      	bset	21180,#7
3347  0007 81            	ret	
3348  0008               L1751:
3349                     ; 1265     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3351  0008 721f52bc      	bres	21180,#7
3352                     ; 1267 }
3355  000c 81            	ret	
3391                     ; 1277 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3391                     ; 1278 {
3392                     .text:	section	.text,new
3393  0000               _TIM1_OC1PolarityConfig:
3397                     ; 1280   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3399                     ; 1283   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3401  0000 4d            	tnz	a
3402  0001 2705          	jreq	L3161
3403                     ; 1285     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3405  0003 721252bd      	bset	21181,#1
3408  0007 81            	ret	
3409  0008               L3161:
3410                     ; 1289     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3412  0008 721352bd      	bres	21181,#1
3413                     ; 1291 }
3416  000c 81            	ret	
3452                     ; 1301 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3452                     ; 1302 {
3453                     .text:	section	.text,new
3454  0000               _TIM1_OC1NPolarityConfig:
3458                     ; 1304   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3460                     ; 1307   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3462  0000 4d            	tnz	a
3463  0001 2705          	jreq	L5361
3464                     ; 1309     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
3466  0003 721652bd      	bset	21181,#3
3469  0007 81            	ret	
3470  0008               L5361:
3471                     ; 1313     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
3473  0008 721752bd      	bres	21181,#3
3474                     ; 1315 }
3477  000c 81            	ret	
3513                     ; 1325 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3513                     ; 1326 {
3514                     .text:	section	.text,new
3515  0000               _TIM1_OC2PolarityConfig:
3519                     ; 1328   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3521                     ; 1331   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3523  0000 4d            	tnz	a
3524  0001 2705          	jreq	L7561
3525                     ; 1333     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3527  0003 721a52bd      	bset	21181,#5
3530  0007 81            	ret	
3531  0008               L7561:
3532                     ; 1337     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3534  0008 721b52bd      	bres	21181,#5
3535                     ; 1339 }
3538  000c 81            	ret	
3574                     ; 1349 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3574                     ; 1350 {
3575                     .text:	section	.text,new
3576  0000               _TIM1_OC2NPolarityConfig:
3580                     ; 1352   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3582                     ; 1355   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3584  0000 4d            	tnz	a
3585  0001 2705          	jreq	L1071
3586                     ; 1357     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
3588  0003 721e52bd      	bset	21181,#7
3591  0007 81            	ret	
3592  0008               L1071:
3593                     ; 1361     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
3595  0008 721f52bd      	bres	21181,#7
3596                     ; 1363 }
3599  000c 81            	ret	
3635                     ; 1373 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3635                     ; 1374 {
3636                     .text:	section	.text,new
3637  0000               _TIM1_OC3PolarityConfig:
3641                     ; 1376   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3643                     ; 1379   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3645  0000 4d            	tnz	a
3646  0001 2705          	jreq	L3271
3647                     ; 1381     TIM1->CCER2 |= TIM1_CCER2_CC3P;
3649  0003 721252be      	bset	21182,#1
3652  0007 81            	ret	
3653  0008               L3271:
3654                     ; 1385     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
3656  0008 721352be      	bres	21182,#1
3657                     ; 1387 }
3660  000c 81            	ret	
3696                     ; 1397 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3696                     ; 1398 {
3697                     .text:	section	.text,new
3698  0000               _TIM1_OC3NPolarityConfig:
3702                     ; 1400   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3704                     ; 1403   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3706  0000 4d            	tnz	a
3707  0001 2705          	jreq	L5471
3708                     ; 1405     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
3710  0003 721652be      	bset	21182,#3
3713  0007 81            	ret	
3714  0008               L5471:
3715                     ; 1409     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
3717  0008 721752be      	bres	21182,#3
3718                     ; 1411 }
3721  000c 81            	ret	
3780                     ; 1421 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
3780                     ; 1422 {
3781                     .text:	section	.text,new
3782  0000               _TIM1_SelectOCREFClear:
3786                     ; 1424   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
3788                     ; 1427   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
3790  0000 721752b2      	bres	21170,#3
3791                     ; 1428   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
3793  0004 ca52b2        	or	a,21170
3794  0007 c752b2        	ld	21170,a
3795                     ; 1429 }
3798  000a 81            	ret	
3833                     ; 1437 void TIM1_SelectCOM(FunctionalState NewState)
3833                     ; 1438 {
3834                     .text:	section	.text,new
3835  0000               _TIM1_SelectCOM:
3839                     ; 1440   assert_param(IS_FUNCTIONAL_STATE(NewState));
3841                     ; 1443   if (NewState != DISABLE)
3843  0000 4d            	tnz	a
3844  0001 2705          	jreq	L5102
3845                     ; 1445     TIM1->CR2 |= TIM1_CR2_CCUS;
3847  0003 721452b1      	bset	21169,#2
3850  0007 81            	ret	
3851  0008               L5102:
3852                     ; 1449     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
3854  0008 721552b1      	bres	21169,#2
3855                     ; 1451 }
3858  000c 81            	ret	
3903                     ; 1465 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
3903                     ; 1466 {
3904                     .text:	section	.text,new
3905  0000               _TIM1_CCxCmd:
3907  0000 89            	pushw	x
3908       00000000      OFST:	set	0
3911                     ; 1468   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
3913                     ; 1469   assert_param(IS_FUNCTIONAL_STATE(NewState));
3915                     ; 1471   if (TIM1_Channel == TIM1_Channel_1)
3917  0001 9e            	ld	a,xh
3918  0002 4d            	tnz	a
3919  0003 2610          	jrne	L3402
3920                     ; 1474     if (NewState != DISABLE)
3922  0005 9f            	ld	a,xl
3923  0006 4d            	tnz	a
3924  0007 2706          	jreq	L5402
3925                     ; 1476       TIM1->CCER1 |= TIM1_CCER1_CC1E;
3927  0009 721052bd      	bset	21181,#0
3929  000d 203e          	jra	L1502
3930  000f               L5402:
3931                     ; 1480       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
3933  000f 721152bd      	bres	21181,#0
3934  0013 2038          	jra	L1502
3935  0015               L3402:
3936                     ; 1483   else if (TIM1_Channel == TIM1_Channel_2)
3938  0015 7b01          	ld	a,(OFST+1,sp)
3939  0017 a101          	cp	a,#1
3940  0019 2610          	jrne	L3502
3941                     ; 1486     if (NewState != DISABLE)
3943  001b 7b02          	ld	a,(OFST+2,sp)
3944  001d 2706          	jreq	L5502
3945                     ; 1488       TIM1->CCER1 |= TIM1_CCER1_CC2E;
3947  001f 721852bd      	bset	21181,#4
3949  0023 2028          	jra	L1502
3950  0025               L5502:
3951                     ; 1492       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
3953  0025 721952bd      	bres	21181,#4
3954  0029 2022          	jra	L1502
3955  002b               L3502:
3956                     ; 1495   else if (TIM1_Channel == TIM1_Channel_3)
3958  002b a102          	cp	a,#2
3959  002d 2610          	jrne	L3602
3960                     ; 1498     if (NewState != DISABLE)
3962  002f 7b02          	ld	a,(OFST+2,sp)
3963  0031 2706          	jreq	L5602
3964                     ; 1500       TIM1->CCER2 |= TIM1_CCER2_CC3E;
3966  0033 721052be      	bset	21182,#0
3968  0037 2014          	jra	L1502
3969  0039               L5602:
3970                     ; 1504       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
3972  0039 721152be      	bres	21182,#0
3973  003d 200e          	jra	L1502
3974  003f               L3602:
3975                     ; 1510     if (NewState != DISABLE)
3977  003f 7b02          	ld	a,(OFST+2,sp)
3978  0041 2706          	jreq	L3702
3979                     ; 1512       TIM1->CCER2 |= TIM1_CCER2_CC4E;
3981  0043 721852be      	bset	21182,#4
3983  0047 2004          	jra	L1502
3984  0049               L3702:
3985                     ; 1516       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
3987  0049 721952be      	bres	21182,#4
3988  004d               L1502:
3989                     ; 1519 }
3992  004d 85            	popw	x
3993  004e 81            	ret	
4038                     ; 1532 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
4038                     ; 1533 {
4039                     .text:	section	.text,new
4040  0000               _TIM1_CCxNCmd:
4042  0000 89            	pushw	x
4043       00000000      OFST:	set	0
4046                     ; 1535   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
4048                     ; 1536   assert_param(IS_FUNCTIONAL_STATE(NewState));
4050                     ; 1538   if (TIM1_Channel == TIM1_Channel_1)
4052  0001 9e            	ld	a,xh
4053  0002 4d            	tnz	a
4054  0003 2610          	jrne	L1212
4055                     ; 1541     if (NewState != DISABLE)
4057  0005 9f            	ld	a,xl
4058  0006 4d            	tnz	a
4059  0007 2706          	jreq	L3212
4060                     ; 1543       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
4062  0009 721452bd      	bset	21181,#2
4064  000d 2029          	jra	L7212
4065  000f               L3212:
4066                     ; 1547       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
4068  000f 721552bd      	bres	21181,#2
4069  0013 2023          	jra	L7212
4070  0015               L1212:
4071                     ; 1550   else if (TIM1_Channel == TIM1_Channel_2)
4073  0015 7b01          	ld	a,(OFST+1,sp)
4074  0017 4a            	dec	a
4075  0018 2610          	jrne	L1312
4076                     ; 1553     if (NewState != DISABLE)
4078  001a 7b02          	ld	a,(OFST+2,sp)
4079  001c 2706          	jreq	L3312
4080                     ; 1555       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
4082  001e 721c52bd      	bset	21181,#6
4084  0022 2014          	jra	L7212
4085  0024               L3312:
4086                     ; 1559       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
4088  0024 721d52bd      	bres	21181,#6
4089  0028 200e          	jra	L7212
4090  002a               L1312:
4091                     ; 1565     if (NewState != DISABLE)
4093  002a 7b02          	ld	a,(OFST+2,sp)
4094  002c 2706          	jreq	L1412
4095                     ; 1567       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
4097  002e 721452be      	bset	21182,#2
4099  0032 2004          	jra	L7212
4100  0034               L1412:
4101                     ; 1571       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
4103  0034 721552be      	bres	21182,#2
4104  0038               L7212:
4105                     ; 1574 }
4108  0038 85            	popw	x
4109  0039 81            	ret	
4275                     ; 1661 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
4275                     ; 1662                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4275                     ; 1663                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
4275                     ; 1664                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4275                     ; 1665                  uint8_t TIM1_ICFilter)
4275                     ; 1666 {
4276                     .text:	section	.text,new
4277  0000               _TIM1_ICInit:
4279  0000 89            	pushw	x
4280       00000000      OFST:	set	0
4283                     ; 1669   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
4285                     ; 1670   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4287                     ; 1671   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4289                     ; 1672   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4291                     ; 1673   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
4293                     ; 1675   if (TIM1_Channel == TIM1_Channel_1)
4295  0001 9e            	ld	a,xh
4296  0002 4d            	tnz	a
4297  0003 2614          	jrne	L7322
4298                     ; 1678     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4300  0005 7b07          	ld	a,(OFST+7,sp)
4301  0007 88            	push	a
4302  0008 7b06          	ld	a,(OFST+6,sp)
4303  000a 97            	ld	xl,a
4304  000b 7b03          	ld	a,(OFST+3,sp)
4305  000d 95            	ld	xh,a
4306  000e cd0000        	call	L3_TI1_Config
4308  0011 84            	pop	a
4309                     ; 1680     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4311  0012 7b06          	ld	a,(OFST+6,sp)
4312  0014 cd0000        	call	_TIM1_SetIC1Prescaler
4315  0017 2044          	jra	L1422
4316  0019               L7322:
4317                     ; 1682   else if (TIM1_Channel == TIM1_Channel_2)
4319  0019 7b01          	ld	a,(OFST+1,sp)
4320  001b a101          	cp	a,#1
4321  001d 2614          	jrne	L3422
4322                     ; 1685     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4324  001f 7b07          	ld	a,(OFST+7,sp)
4325  0021 88            	push	a
4326  0022 7b06          	ld	a,(OFST+6,sp)
4327  0024 97            	ld	xl,a
4328  0025 7b03          	ld	a,(OFST+3,sp)
4329  0027 95            	ld	xh,a
4330  0028 cd0000        	call	L5_TI2_Config
4332  002b 84            	pop	a
4333                     ; 1687     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4335  002c 7b06          	ld	a,(OFST+6,sp)
4336  002e cd0000        	call	_TIM1_SetIC2Prescaler
4339  0031 202a          	jra	L1422
4340  0033               L3422:
4341                     ; 1689   else if (TIM1_Channel == TIM1_Channel_3)
4343  0033 a102          	cp	a,#2
4344  0035 2614          	jrne	L7422
4345                     ; 1692     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4347  0037 7b07          	ld	a,(OFST+7,sp)
4348  0039 88            	push	a
4349  003a 7b06          	ld	a,(OFST+6,sp)
4350  003c 97            	ld	xl,a
4351  003d 7b03          	ld	a,(OFST+3,sp)
4352  003f 95            	ld	xh,a
4353  0040 cd0000        	call	L7_TI3_Config
4355  0043 84            	pop	a
4356                     ; 1694     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
4358  0044 7b06          	ld	a,(OFST+6,sp)
4359  0046 cd0000        	call	_TIM1_SetIC3Prescaler
4362  0049 2012          	jra	L1422
4363  004b               L7422:
4364                     ; 1699     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4366  004b 7b07          	ld	a,(OFST+7,sp)
4367  004d 88            	push	a
4368  004e 7b06          	ld	a,(OFST+6,sp)
4369  0050 97            	ld	xl,a
4370  0051 7b03          	ld	a,(OFST+3,sp)
4371  0053 95            	ld	xh,a
4372  0054 cd0000        	call	L11_TI4_Config
4374  0057 84            	pop	a
4375                     ; 1701     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
4377  0058 7b06          	ld	a,(OFST+6,sp)
4378  005a cd0000        	call	_TIM1_SetIC4Prescaler
4380  005d               L1422:
4381                     ; 1703 }
4384  005d 85            	popw	x
4385  005e 81            	ret	
4481                     ; 1730 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
4481                     ; 1731                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4481                     ; 1732                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
4481                     ; 1733                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4481                     ; 1734                      uint8_t TIM1_ICFilter)
4481                     ; 1735 {
4482                     .text:	section	.text,new
4483  0000               _TIM1_PWMIConfig:
4485  0000 89            	pushw	x
4486  0001 89            	pushw	x
4487       00000002      OFST:	set	2
4490                     ; 1736   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
4492                     ; 1737   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
4494                     ; 1740   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
4496                     ; 1741   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4498                     ; 1742   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4500                     ; 1743   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4502                     ; 1746   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
4504  0002 9f            	ld	a,xl
4505  0003 4a            	dec	a
4506  0004 2702          	jreq	L7132
4507                     ; 1748     icpolarity = TIM1_ICPolarity_Falling;
4509  0006 a601          	ld	a,#1
4511  0008               L7132:
4512                     ; 1752     icpolarity = TIM1_ICPolarity_Rising;
4514  0008 6b01          	ld	(OFST-1,sp),a
4515                     ; 1756   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
4517  000a 7b07          	ld	a,(OFST+5,sp)
4518  000c 4a            	dec	a
4519  000d 2604          	jrne	L3232
4520                     ; 1758     icselection = TIM1_ICSelection_IndirectTI;
4522  000f a602          	ld	a,#2
4524  0011 2002          	jra	L5232
4525  0013               L3232:
4526                     ; 1762     icselection = TIM1_ICSelection_DirectTI;
4528  0013 a601          	ld	a,#1
4529  0015               L5232:
4530  0015 6b02          	ld	(OFST+0,sp),a
4531                     ; 1765   if (TIM1_Channel == TIM1_Channel_1)
4533  0017 7b03          	ld	a,(OFST+1,sp)
4534  0019 2626          	jrne	L7232
4535                     ; 1768     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4537  001b 7b09          	ld	a,(OFST+7,sp)
4538  001d 88            	push	a
4539  001e 7b08          	ld	a,(OFST+6,sp)
4540  0020 97            	ld	xl,a
4541  0021 7b05          	ld	a,(OFST+3,sp)
4542  0023 95            	ld	xh,a
4543  0024 cd0000        	call	L3_TI1_Config
4545  0027 84            	pop	a
4546                     ; 1771     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4548  0028 7b08          	ld	a,(OFST+6,sp)
4549  002a cd0000        	call	_TIM1_SetIC1Prescaler
4551                     ; 1774     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
4553  002d 7b09          	ld	a,(OFST+7,sp)
4554  002f 88            	push	a
4555  0030 7b03          	ld	a,(OFST+1,sp)
4556  0032 97            	ld	xl,a
4557  0033 7b02          	ld	a,(OFST+0,sp)
4558  0035 95            	ld	xh,a
4559  0036 cd0000        	call	L5_TI2_Config
4561  0039 84            	pop	a
4562                     ; 1777     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4564  003a 7b08          	ld	a,(OFST+6,sp)
4565  003c cd0000        	call	_TIM1_SetIC2Prescaler
4568  003f 2024          	jra	L1332
4569  0041               L7232:
4570                     ; 1782     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4572  0041 7b09          	ld	a,(OFST+7,sp)
4573  0043 88            	push	a
4574  0044 7b08          	ld	a,(OFST+6,sp)
4575  0046 97            	ld	xl,a
4576  0047 7b05          	ld	a,(OFST+3,sp)
4577  0049 95            	ld	xh,a
4578  004a cd0000        	call	L5_TI2_Config
4580  004d 84            	pop	a
4581                     ; 1785     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4583  004e 7b08          	ld	a,(OFST+6,sp)
4584  0050 cd0000        	call	_TIM1_SetIC2Prescaler
4586                     ; 1788     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
4588  0053 7b09          	ld	a,(OFST+7,sp)
4589  0055 88            	push	a
4590  0056 7b03          	ld	a,(OFST+1,sp)
4591  0058 97            	ld	xl,a
4592  0059 7b02          	ld	a,(OFST+0,sp)
4593  005b 95            	ld	xh,a
4594  005c cd0000        	call	L3_TI1_Config
4596  005f 84            	pop	a
4597                     ; 1791     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4599  0060 7b08          	ld	a,(OFST+6,sp)
4600  0062 cd0000        	call	_TIM1_SetIC1Prescaler
4602  0065               L1332:
4603                     ; 1793 }
4606  0065 5b04          	addw	sp,#4
4607  0067 81            	ret	
4653                     ; 1800 uint16_t TIM1_GetCapture1(void)
4653                     ; 1801 {
4654                     .text:	section	.text,new
4655  0000               _TIM1_GetCapture1:
4657  0000 5204          	subw	sp,#4
4658       00000004      OFST:	set	4
4661                     ; 1804   uint16_t tmpccr1 = 0;
4663                     ; 1805   uint8_t tmpccr1l = 0, tmpccr1h = 0;
4667                     ; 1807   tmpccr1h = TIM1->CCR1H;
4669  0002 c652c6        	ld	a,21190
4670  0005 6b02          	ld	(OFST-2,sp),a
4671                     ; 1808   tmpccr1l = TIM1->CCR1L;
4673  0007 c652c7        	ld	a,21191
4674  000a 6b01          	ld	(OFST-3,sp),a
4675                     ; 1810   tmpccr1 = (uint16_t)(tmpccr1l);
4677  000c 5f            	clrw	x
4678  000d 97            	ld	xl,a
4679  000e 1f03          	ldw	(OFST-1,sp),x
4680                     ; 1811   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4682  0010 5f            	clrw	x
4683  0011 7b02          	ld	a,(OFST-2,sp)
4684  0013 97            	ld	xl,a
4685  0014 7b04          	ld	a,(OFST+0,sp)
4686  0016 01            	rrwa	x,a
4687  0017 1a03          	or	a,(OFST-1,sp)
4688  0019 01            	rrwa	x,a
4689                     ; 1813   return (uint16_t)tmpccr1;
4693  001a 5b04          	addw	sp,#4
4694  001c 81            	ret	
4740                     ; 1821 uint16_t TIM1_GetCapture2(void)
4740                     ; 1822 {
4741                     .text:	section	.text,new
4742  0000               _TIM1_GetCapture2:
4744  0000 5204          	subw	sp,#4
4745       00000004      OFST:	set	4
4748                     ; 1825   uint16_t tmpccr2 = 0;
4750                     ; 1826   uint8_t tmpccr2l = 0, tmpccr2h = 0;
4754                     ; 1828   tmpccr2h = TIM1->CCR2H;
4756  0002 c652c8        	ld	a,21192
4757  0005 6b02          	ld	(OFST-2,sp),a
4758                     ; 1829   tmpccr2l = TIM1->CCR2L;
4760  0007 c652c9        	ld	a,21193
4761  000a 6b01          	ld	(OFST-3,sp),a
4762                     ; 1831   tmpccr2 = (uint16_t)(tmpccr2l);
4764  000c 5f            	clrw	x
4765  000d 97            	ld	xl,a
4766  000e 1f03          	ldw	(OFST-1,sp),x
4767                     ; 1832   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4769  0010 5f            	clrw	x
4770  0011 7b02          	ld	a,(OFST-2,sp)
4771  0013 97            	ld	xl,a
4772  0014 7b04          	ld	a,(OFST+0,sp)
4773  0016 01            	rrwa	x,a
4774  0017 1a03          	or	a,(OFST-1,sp)
4775  0019 01            	rrwa	x,a
4776                     ; 1834   return (uint16_t)tmpccr2;
4780  001a 5b04          	addw	sp,#4
4781  001c 81            	ret	
4827                     ; 1842 uint16_t TIM1_GetCapture3(void)
4827                     ; 1843 {
4828                     .text:	section	.text,new
4829  0000               _TIM1_GetCapture3:
4831  0000 5204          	subw	sp,#4
4832       00000004      OFST:	set	4
4835                     ; 1845   uint16_t tmpccr3 = 0;
4837                     ; 1846   uint8_t tmpccr3l = 0, tmpccr3h = 0;
4841                     ; 1848   tmpccr3h = TIM1->CCR3H;
4843  0002 c652ca        	ld	a,21194
4844  0005 6b02          	ld	(OFST-2,sp),a
4845                     ; 1849   tmpccr3l = TIM1->CCR3L;
4847  0007 c652cb        	ld	a,21195
4848  000a 6b01          	ld	(OFST-3,sp),a
4849                     ; 1851   tmpccr3 = (uint16_t)(tmpccr3l);
4851  000c 5f            	clrw	x
4852  000d 97            	ld	xl,a
4853  000e 1f03          	ldw	(OFST-1,sp),x
4854                     ; 1852   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4856  0010 5f            	clrw	x
4857  0011 7b02          	ld	a,(OFST-2,sp)
4858  0013 97            	ld	xl,a
4859  0014 7b04          	ld	a,(OFST+0,sp)
4860  0016 01            	rrwa	x,a
4861  0017 1a03          	or	a,(OFST-1,sp)
4862  0019 01            	rrwa	x,a
4863                     ; 1854   return (uint16_t)tmpccr3;
4867  001a 5b04          	addw	sp,#4
4868  001c 81            	ret	
4914                     ; 1862 uint16_t TIM1_GetCapture4(void)
4914                     ; 1863 {
4915                     .text:	section	.text,new
4916  0000               _TIM1_GetCapture4:
4918  0000 5204          	subw	sp,#4
4919       00000004      OFST:	set	4
4922                     ; 1865   uint16_t tmpccr4 = 0;
4924                     ; 1866   uint8_t tmpccr4l = 0, tmpccr4h = 0;
4928                     ; 1868   tmpccr4h = TIM1->CCR4H;
4930  0002 c652cc        	ld	a,21196
4931  0005 6b02          	ld	(OFST-2,sp),a
4932                     ; 1869   tmpccr4l = TIM1->CCR4L;
4934  0007 c652cd        	ld	a,21197
4935  000a 6b01          	ld	(OFST-3,sp),a
4936                     ; 1871   tmpccr4 = (uint16_t)(tmpccr4l);
4938  000c 5f            	clrw	x
4939  000d 97            	ld	xl,a
4940  000e 1f03          	ldw	(OFST-1,sp),x
4941                     ; 1872   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
4943  0010 5f            	clrw	x
4944  0011 7b02          	ld	a,(OFST-2,sp)
4945  0013 97            	ld	xl,a
4946  0014 7b04          	ld	a,(OFST+0,sp)
4947  0016 01            	rrwa	x,a
4948  0017 1a03          	or	a,(OFST-1,sp)
4949  0019 01            	rrwa	x,a
4950                     ; 1874   return (uint16_t)tmpccr4;
4954  001a 5b04          	addw	sp,#4
4955  001c 81            	ret	
4991                     ; 1887 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
4991                     ; 1888 {
4992                     .text:	section	.text,new
4993  0000               _TIM1_SetIC1Prescaler:
4995  0000 88            	push	a
4996       00000000      OFST:	set	0
4999                     ; 1890   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
5001                     ; 1893   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
5003  0001 c652b9        	ld	a,21177
5004  0004 a4f3          	and	a,#243
5005  0006 1a01          	or	a,(OFST+1,sp)
5006  0008 c752b9        	ld	21177,a
5007                     ; 1894 }
5010  000b 84            	pop	a
5011  000c 81            	ret	
5047                     ; 1906 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5047                     ; 1907 {
5048                     .text:	section	.text,new
5049  0000               _TIM1_SetIC2Prescaler:
5051  0000 88            	push	a
5052       00000000      OFST:	set	0
5055                     ; 1909   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
5057                     ; 1912   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
5059  0001 c652ba        	ld	a,21178
5060  0004 a4f3          	and	a,#243
5061  0006 1a01          	or	a,(OFST+1,sp)
5062  0008 c752ba        	ld	21178,a
5063                     ; 1913 }
5066  000b 84            	pop	a
5067  000c 81            	ret	
5103                     ; 1925 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5103                     ; 1926 {
5104                     .text:	section	.text,new
5105  0000               _TIM1_SetIC3Prescaler:
5107  0000 88            	push	a
5108       00000000      OFST:	set	0
5111                     ; 1929   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
5113                     ; 1932   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
5115  0001 c652bb        	ld	a,21179
5116  0004 a4f3          	and	a,#243
5117  0006 1a01          	or	a,(OFST+1,sp)
5118  0008 c752bb        	ld	21179,a
5119                     ; 1933 }
5122  000b 84            	pop	a
5123  000c 81            	ret	
5159                     ; 1945 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
5159                     ; 1946 {
5160                     .text:	section	.text,new
5161  0000               _TIM1_SetIC4Prescaler:
5163  0000 88            	push	a
5164       00000000      OFST:	set	0
5167                     ; 1949   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
5169                     ; 1952   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
5171  0001 c652bc        	ld	a,21180
5172  0004 a4f3          	and	a,#243
5173  0006 1a01          	or	a,(OFST+1,sp)
5174  0008 c752bc        	ld	21180,a
5175                     ; 1953 }
5178  000b 84            	pop	a
5179  000c 81            	ret	
5286                     ; 1988 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
5286                     ; 1989 {
5287                     .text:	section	.text,new
5288  0000               _TIM1_ITConfig:
5290  0000 89            	pushw	x
5291       00000000      OFST:	set	0
5294                     ; 1991   assert_param(IS_TIM1_IT(TIM1_IT));
5296                     ; 1992   assert_param(IS_FUNCTIONAL_STATE(NewState));
5298                     ; 1994   if (NewState != DISABLE)
5300  0001 9f            	ld	a,xl
5301  0002 4d            	tnz	a
5302  0003 2706          	jreq	L1752
5303                     ; 1997     TIM1->IER |= (uint8_t)TIM1_IT;
5305  0005 9e            	ld	a,xh
5306  0006 ca52b5        	or	a,21173
5308  0009 2006          	jra	L3752
5309  000b               L1752:
5310                     ; 2002     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
5312  000b 7b01          	ld	a,(OFST+1,sp)
5313  000d 43            	cpl	a
5314  000e c452b5        	and	a,21173
5315  0011               L3752:
5316  0011 c752b5        	ld	21173,a
5317                     ; 2004 }
5320  0014 85            	popw	x
5321  0015 81            	ret	
5426                     ; 2020 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5426                     ; 2021 {
5427                     .text:	section	.text,new
5428  0000               _TIM1_GenerateEvent:
5432                     ; 2023   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
5434                     ; 2026   TIM1->EGR = (uint8_t)TIM1_EventSource;
5436  0000 c752b8        	ld	21176,a
5437                     ; 2027 }
5440  0003 81            	ret	
5610                     ; 2046 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
5610                     ; 2047 {
5611                     .text:	section	.text,new
5612  0000               _TIM1_GetFlagStatus:
5614  0000 89            	pushw	x
5615  0001 89            	pushw	x
5616       00000002      OFST:	set	2
5619                     ; 2048   FlagStatus bitstatus = RESET;
5621                     ; 2049   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
5625                     ; 2052   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
5627                     ; 2054   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
5629  0002 9f            	ld	a,xl
5630  0003 c452b6        	and	a,21174
5631  0006 6b01          	ld	(OFST-1,sp),a
5632                     ; 2055   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
5634  0008 c652b7        	ld	a,21175
5635  000b 1403          	and	a,(OFST+1,sp)
5636  000d 6b02          	ld	(OFST+0,sp),a
5637                     ; 2057   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
5639  000f 1a01          	or	a,(OFST-1,sp)
5640  0011 2702          	jreq	L1372
5641                     ; 2059     bitstatus = SET;
5643  0013 a601          	ld	a,#1
5645  0015               L1372:
5646                     ; 2063     bitstatus = RESET;
5648                     ; 2065   return (FlagStatus)(bitstatus);
5652  0015 5b04          	addw	sp,#4
5653  0017 81            	ret	
5688                     ; 2086 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
5688                     ; 2087 {
5689                     .text:	section	.text,new
5690  0000               _TIM1_ClearFlag:
5692  0000 89            	pushw	x
5693       00000000      OFST:	set	0
5696                     ; 2089   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
5698                     ; 2092   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
5700  0001 9f            	ld	a,xl
5701  0002 43            	cpl	a
5702  0003 c752b6        	ld	21174,a
5703                     ; 2093   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
5705  0006 7b01          	ld	a,(OFST+1,sp)
5706  0008 43            	cpl	a
5707  0009 a41e          	and	a,#30
5708  000b c752b7        	ld	21175,a
5709                     ; 2094 }
5712  000e 85            	popw	x
5713  000f 81            	ret	
5773                     ; 2111 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
5773                     ; 2112 {
5774                     .text:	section	.text,new
5775  0000               _TIM1_GetITStatus:
5777  0000 88            	push	a
5778  0001 89            	pushw	x
5779       00000002      OFST:	set	2
5782                     ; 2113   ITStatus bitstatus = RESET;
5784                     ; 2115   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
5788                     ; 2118   assert_param(IS_TIM1_GET_IT(TIM1_IT));
5790                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
5792  0002 c452b6        	and	a,21174
5793  0005 6b01          	ld	(OFST-1,sp),a
5794                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
5796  0007 c652b5        	ld	a,21173
5797  000a 1403          	and	a,(OFST+1,sp)
5798  000c 6b02          	ld	(OFST+0,sp),a
5799                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
5801  000e 7b01          	ld	a,(OFST-1,sp)
5802  0010 2708          	jreq	L1003
5804  0012 7b02          	ld	a,(OFST+0,sp)
5805  0014 2704          	jreq	L1003
5806                     ; 2126     bitstatus = SET;
5808  0016 a601          	ld	a,#1
5810  0018 2001          	jra	L3003
5811  001a               L1003:
5812                     ; 2130     bitstatus = RESET;
5814  001a 4f            	clr	a
5815  001b               L3003:
5816                     ; 2132   return (ITStatus)(bitstatus);
5820  001b 5b03          	addw	sp,#3
5821  001d 81            	ret	
5857                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
5857                     ; 2150 {
5858                     .text:	section	.text,new
5859  0000               _TIM1_ClearITPendingBit:
5863                     ; 2152   assert_param(IS_TIM1_IT(TIM1_IT));
5865                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
5867  0000 43            	cpl	a
5868  0001 c752b6        	ld	21174,a
5869                     ; 2156 }
5872  0004 81            	ret	
6410                     ; 2164 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
6410                     ; 2165                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
6410                     ; 2166 {
6411                     .text:	section	.text,new
6412  0000               _TIM1_DMAConfig:
6416                     ; 2168   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
6418                     ; 2169   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
6420                     ; 2172   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
6422  0000 9e            	ld	a,xh
6423  0001 c752d1        	ld	21201,a
6424                     ; 2173   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
6426  0004 9f            	ld	a,xl
6427  0005 c752d2        	ld	21202,a
6428                     ; 2174 }
6431  0008 81            	ret	
6525                     ; 2186 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
6525                     ; 2187 {
6526                     .text:	section	.text,new
6527  0000               _TIM1_DMACmd:
6529  0000 89            	pushw	x
6530       00000000      OFST:	set	0
6533                     ; 2189   assert_param(IS_FUNCTIONAL_STATE(NewState));
6535                     ; 2190   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
6537                     ; 2192   if (NewState != DISABLE)
6539  0001 9f            	ld	a,xl
6540  0002 4d            	tnz	a
6541  0003 2706          	jreq	L7133
6542                     ; 2195     TIM1->DER |= (uint8_t)TIM1_DMASource;
6544  0005 9e            	ld	a,xh
6545  0006 ca52b4        	or	a,21172
6547  0009 2006          	jra	L1233
6548  000b               L7133:
6549                     ; 2200     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
6551  000b 7b01          	ld	a,(OFST+1,sp)
6552  000d 43            	cpl	a
6553  000e c452b4        	and	a,21172
6554  0011               L1233:
6555  0011 c752b4        	ld	21172,a
6556                     ; 2202 }
6559  0014 85            	popw	x
6560  0015 81            	ret	
6595                     ; 2210 void TIM1_SelectCCDMA(FunctionalState NewState)
6595                     ; 2211 {
6596                     .text:	section	.text,new
6597  0000               _TIM1_SelectCCDMA:
6601                     ; 2213   assert_param(IS_FUNCTIONAL_STATE(NewState));
6603                     ; 2215   if (NewState != DISABLE)
6605  0000 4d            	tnz	a
6606  0001 2705          	jreq	L1433
6607                     ; 2218     TIM1->CR2 |= TIM1_CR2_CCDS;
6609  0003 721652b1      	bset	21169,#3
6612  0007 81            	ret	
6613  0008               L1433:
6614                     ; 2223     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
6616  0008 721752b1      	bres	21169,#3
6617                     ; 2225 }
6620  000c 81            	ret	
6644                     ; 2248 void TIM1_InternalClockConfig(void)
6644                     ; 2249 {
6645                     .text:	section	.text,new
6646  0000               _TIM1_InternalClockConfig:
6650                     ; 2251   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
6652  0000 c652b2        	ld	a,21170
6653  0003 a4f8          	and	a,#248
6654  0005 c752b2        	ld	21170,a
6655                     ; 2252 }
6658  0008 81            	ret	
6745                     ; 2269 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
6745                     ; 2270                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
6745                     ; 2271                                  uint8_t ICFilter)
6745                     ; 2272 {
6746                     .text:	section	.text,new
6747  0000               _TIM1_TIxExternalClockConfig:
6749  0000 89            	pushw	x
6750       00000000      OFST:	set	0
6753                     ; 2274   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
6755                     ; 2275   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
6757                     ; 2276   assert_param(IS_TIM1_IC_FILTER(ICFilter));
6759                     ; 2279   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
6761  0001 9e            	ld	a,xh
6762  0002 a160          	cp	a,#96
6763  0004 260e          	jrne	L3143
6764                     ; 2281     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6766  0006 7b05          	ld	a,(OFST+5,sp)
6767  0008 88            	push	a
6768  0009 ae0001        	ldw	x,#1
6769  000c 7b03          	ld	a,(OFST+3,sp)
6770  000e 95            	ld	xh,a
6771  000f cd0000        	call	L5_TI2_Config
6774  0012 200c          	jra	L5143
6775  0014               L3143:
6776                     ; 2285     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6778  0014 7b05          	ld	a,(OFST+5,sp)
6779  0016 88            	push	a
6780  0017 ae0001        	ldw	x,#1
6781  001a 7b03          	ld	a,(OFST+3,sp)
6782  001c 95            	ld	xh,a
6783  001d cd0000        	call	L3_TI1_Config
6785  0020               L5143:
6786  0020 84            	pop	a
6787                     ; 2289   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
6789  0021 7b01          	ld	a,(OFST+1,sp)
6790  0023 cd0000        	call	_TIM1_SelectInputTrigger
6792                     ; 2292   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
6794  0026 c652b2        	ld	a,21170
6795  0029 aa07          	or	a,#7
6796  002b c752b2        	ld	21170,a
6797                     ; 2293 }
6800  002e 85            	popw	x
6801  002f 81            	ret	
6916                     ; 2311 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
6916                     ; 2312                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
6916                     ; 2313                               uint8_t ExtTRGFilter)
6916                     ; 2314 {
6917                     .text:	section	.text,new
6918  0000               _TIM1_ETRClockMode1Config:
6920  0000 89            	pushw	x
6921       00000000      OFST:	set	0
6924                     ; 2316   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
6926                     ; 2317   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
6928                     ; 2318   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
6930                     ; 2321   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
6932  0001 7b05          	ld	a,(OFST+5,sp)
6933  0003 88            	push	a
6934  0004 7b02          	ld	a,(OFST+2,sp)
6935  0006 95            	ld	xh,a
6936  0007 cd0000        	call	_TIM1_ETRConfig
6938  000a 84            	pop	a
6939                     ; 2324   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
6939                     ; 2325                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
6941  000b c652b2        	ld	a,21170
6942  000e aa77          	or	a,#119
6943  0010 c752b2        	ld	21170,a
6944                     ; 2326 }
6947  0013 85            	popw	x
6948  0014 81            	ret	
7004                     ; 2344 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7004                     ; 2345                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7004                     ; 2346                               uint8_t ExtTRGFilter)
7004                     ; 2347 {
7005                     .text:	section	.text,new
7006  0000               _TIM1_ETRClockMode2Config:
7008  0000 89            	pushw	x
7009       00000000      OFST:	set	0
7012                     ; 2349   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7014                     ; 2350   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7016                     ; 2353   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7018  0001 7b05          	ld	a,(OFST+5,sp)
7019  0003 88            	push	a
7020  0004 7b02          	ld	a,(OFST+2,sp)
7021  0006 95            	ld	xh,a
7022  0007 cd0000        	call	_TIM1_ETRConfig
7024  000a 721c52b3      	bset	21171,#6
7025  000e 84            	pop	a
7026                     ; 2356   TIM1->ETR |= TIM1_ETR_ECE;
7028                     ; 2357 }
7031  000f 85            	popw	x
7032  0010 81            	ret	
7139                     ; 2407 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
7139                     ; 2408 {
7140                     .text:	section	.text,new
7141  0000               _TIM1_SelectInputTrigger:
7143  0000 88            	push	a
7144       00000000      OFST:	set	0
7147                     ; 2410   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
7149                     ; 2413   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
7151  0001 c652b2        	ld	a,21170
7152  0004 a48f          	and	a,#143
7153  0006 1a01          	or	a,(OFST+1,sp)
7154  0008 c752b2        	ld	21170,a
7155                     ; 2414 }
7158  000b 84            	pop	a
7159  000c 81            	ret	
7265                     ; 2430 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
7265                     ; 2431 {
7266                     .text:	section	.text,new
7267  0000               _TIM1_SelectOutputTrigger:
7269  0000 88            	push	a
7270       00000000      OFST:	set	0
7273                     ; 2433   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
7275                     ; 2435   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
7277  0001 c652b1        	ld	a,21169
7278  0004 a48f          	and	a,#143
7279  0006 1a01          	or	a,(OFST+1,sp)
7280  0008 c752b1        	ld	21169,a
7281                     ; 2436 }
7284  000b 84            	pop	a
7285  000c 81            	ret	
7359                     ; 2448 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
7359                     ; 2449 {
7360                     .text:	section	.text,new
7361  0000               _TIM1_SelectSlaveMode:
7363  0000 88            	push	a
7364       00000000      OFST:	set	0
7367                     ; 2451   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
7369                     ; 2454   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
7371  0001 c652b2        	ld	a,21170
7372  0004 a4f8          	and	a,#248
7373  0006 1a01          	or	a,(OFST+1,sp)
7374  0008 c752b2        	ld	21170,a
7375                     ; 2456 }
7378  000b 84            	pop	a
7379  000c 81            	ret	
7415                     ; 2464 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
7415                     ; 2465 {
7416                     .text:	section	.text,new
7417  0000               _TIM1_SelectMasterSlaveMode:
7421                     ; 2467   assert_param(IS_FUNCTIONAL_STATE(NewState));
7423                     ; 2470   if (NewState != DISABLE)
7425  0000 4d            	tnz	a
7426  0001 2705          	jreq	L7663
7427                     ; 2472     TIM1->SMCR |= TIM1_SMCR_MSM;
7429  0003 721e52b2      	bset	21170,#7
7432  0007 81            	ret	
7433  0008               L7663:
7434                     ; 2476     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
7436  0008 721f52b2      	bres	21170,#7
7437                     ; 2478 }
7440  000c 81            	ret	
7494                     ; 2496 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7494                     ; 2497                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7494                     ; 2498                     uint8_t ExtTRGFilter)
7494                     ; 2499 {
7495                     .text:	section	.text,new
7496  0000               _TIM1_ETRConfig:
7498  0000 89            	pushw	x
7499       00000000      OFST:	set	0
7502                     ; 2500   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7504                     ; 2503   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
7504                     ; 2504                                    | (uint8_t) TIM1_ExtTRGPolarity)
7504                     ; 2505                          | (uint8_t) ExtTRGFilter);
7506  0001 9f            	ld	a,xl
7507  0002 1a01          	or	a,(OFST+1,sp)
7508  0004 1a05          	or	a,(OFST+5,sp)
7509  0006 ca52b3        	or	a,21171
7510  0009 c752b3        	ld	21171,a
7511                     ; 2506 }
7514  000c 85            	popw	x
7515  000d 81            	ret	
7601                     ; 2544 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
7601                     ; 2545                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
7601                     ; 2546                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
7601                     ; 2547 {
7602                     .text:	section	.text,new
7603  0000               _TIM1_EncoderInterfaceConfig:
7605  0000 89            	pushw	x
7606       00000000      OFST:	set	0
7609                     ; 2549   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
7611                     ; 2550   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
7613                     ; 2551   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
7615                     ; 2554   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
7617  0001 9f            	ld	a,xl
7618  0002 4d            	tnz	a
7619  0003 2706          	jreq	L7573
7620                     ; 2556     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7622  0005 721252bd      	bset	21181,#1
7624  0009 2004          	jra	L1673
7625  000b               L7573:
7626                     ; 2560     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7628  000b 721352bd      	bres	21181,#1
7629  000f               L1673:
7630                     ; 2563   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
7632  000f 7b05          	ld	a,(OFST+5,sp)
7633  0011 2706          	jreq	L3673
7634                     ; 2565     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7636  0013 721a52bd      	bset	21181,#5
7638  0017 2004          	jra	L5673
7639  0019               L3673:
7640                     ; 2569     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7642  0019 721b52bd      	bres	21181,#5
7643  001d               L5673:
7644                     ; 2572   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
7646  001d c652b2        	ld	a,21170
7647  0020 a4f0          	and	a,#240
7648  0022 1a01          	or	a,(OFST+1,sp)
7649  0024 c752b2        	ld	21170,a
7650                     ; 2575   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
7652  0027 c652b9        	ld	a,21177
7653  002a a4fc          	and	a,#252
7654  002c aa01          	or	a,#1
7655  002e c752b9        	ld	21177,a
7656                     ; 2576   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
7658  0031 c652ba        	ld	a,21178
7659  0034 a4fc          	and	a,#252
7660  0036 aa01          	or	a,#1
7661  0038 c752ba        	ld	21178,a
7662                     ; 2578 }
7665  003b 85            	popw	x
7666  003c 81            	ret	
7702                     ; 2586 void TIM1_SelectHallSensor(FunctionalState NewState)
7702                     ; 2587 {
7703                     .text:	section	.text,new
7704  0000               _TIM1_SelectHallSensor:
7708                     ; 2589   assert_param(IS_FUNCTIONAL_STATE(NewState));
7710                     ; 2592   if (NewState != DISABLE)
7712  0000 4d            	tnz	a
7713  0001 2705          	jreq	L5004
7714                     ; 2594     TIM1->CR2 |= TIM1_CR2_TI1S;
7716  0003 721e52b1      	bset	21169,#7
7719  0007 81            	ret	
7720  0008               L5004:
7721                     ; 2598     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
7723  0008 721f52b1      	bres	21169,#7
7724                     ; 2600 }
7727  000c 81            	ret	
7773                     ; 2620 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7773                     ; 2621 {
7774                     .text:	section	.text,new
7775  0000               L3_TI1_Config:
7777  0000 89            	pushw	x
7778  0001 88            	push	a
7779       00000001      OFST:	set	1
7782                     ; 2624   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7784  0002 721152bd      	bres	21181,#0
7785                     ; 2627   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7785                     ; 2628                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7787  0006 7b06          	ld	a,(OFST+5,sp)
7788  0008 97            	ld	xl,a
7789  0009 a610          	ld	a,#16
7790  000b 42            	mul	x,a
7791  000c 9f            	ld	a,xl
7792  000d 1a03          	or	a,(OFST+2,sp)
7793  000f 6b01          	ld	(OFST+0,sp),a
7794  0011 c652b9        	ld	a,21177
7795  0014 a40c          	and	a,#12
7796  0016 1a01          	or	a,(OFST+0,sp)
7797  0018 c752b9        	ld	21177,a
7798                     ; 2633   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7800  001b 7b02          	ld	a,(OFST+1,sp)
7801  001d 2706          	jreq	L1304
7802                     ; 2635     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7804  001f 721252bd      	bset	21181,#1
7806  0023 2004          	jra	L3304
7807  0025               L1304:
7808                     ; 2639     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7810  0025 721352bd      	bres	21181,#1
7811  0029               L3304:
7812                     ; 2643   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7814  0029 721052bd      	bset	21181,#0
7815                     ; 2644 }
7818  002d 5b03          	addw	sp,#3
7819  002f 81            	ret	
7865                     ; 2660 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7865                     ; 2661 {
7866                     .text:	section	.text,new
7867  0000               L5_TI2_Config:
7869  0000 89            	pushw	x
7870  0001 88            	push	a
7871       00000001      OFST:	set	1
7874                     ; 2663   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7876  0002 721952bd      	bres	21181,#4
7877                     ; 2666   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7877                     ; 2667                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7879  0006 7b06          	ld	a,(OFST+5,sp)
7880  0008 97            	ld	xl,a
7881  0009 a610          	ld	a,#16
7882  000b 42            	mul	x,a
7883  000c 9f            	ld	a,xl
7884  000d 1a03          	or	a,(OFST+2,sp)
7885  000f 6b01          	ld	(OFST+0,sp),a
7886  0011 c652ba        	ld	a,21178
7887  0014 a40c          	and	a,#12
7888  0016 1a01          	or	a,(OFST+0,sp)
7889  0018 c752ba        	ld	21178,a
7890                     ; 2669   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7892  001b 7b02          	ld	a,(OFST+1,sp)
7893  001d 2706          	jreq	L5504
7894                     ; 2671     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7896  001f 721a52bd      	bset	21181,#5
7898  0023 2004          	jra	L7504
7899  0025               L5504:
7900                     ; 2675     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7902  0025 721b52bd      	bres	21181,#5
7903  0029               L7504:
7904                     ; 2678   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7906  0029 721852bd      	bset	21181,#4
7907                     ; 2679 }
7910  002d 5b03          	addw	sp,#3
7911  002f 81            	ret	
7957                     ; 2695 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7957                     ; 2696 {
7958                     .text:	section	.text,new
7959  0000               L7_TI3_Config:
7961  0000 89            	pushw	x
7962  0001 88            	push	a
7963       00000001      OFST:	set	1
7966                     ; 2698   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7968  0002 721152be      	bres	21182,#0
7969                     ; 2701   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7969                     ; 2702                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7971  0006 7b06          	ld	a,(OFST+5,sp)
7972  0008 97            	ld	xl,a
7973  0009 a610          	ld	a,#16
7974  000b 42            	mul	x,a
7975  000c 9f            	ld	a,xl
7976  000d 1a03          	or	a,(OFST+2,sp)
7977  000f 6b01          	ld	(OFST+0,sp),a
7978  0011 c652bb        	ld	a,21179
7979  0014 a40c          	and	a,#12
7980  0016 1a01          	or	a,(OFST+0,sp)
7981  0018 c752bb        	ld	21179,a
7982                     ; 2705   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7984  001b 7b02          	ld	a,(OFST+1,sp)
7985  001d 2706          	jreq	L1014
7986                     ; 2707     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7988  001f 721252be      	bset	21182,#1
7990  0023 2004          	jra	L3014
7991  0025               L1014:
7992                     ; 2711     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7994  0025 721352be      	bres	21182,#1
7995  0029               L3014:
7996                     ; 2714   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7998  0029 721052be      	bset	21182,#0
7999                     ; 2715 }
8002  002d 5b03          	addw	sp,#3
8003  002f 81            	ret	
8049                     ; 2730 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8049                     ; 2731 {
8050                     .text:	section	.text,new
8051  0000               L11_TI4_Config:
8053  0000 89            	pushw	x
8054  0001 88            	push	a
8055       00000001      OFST:	set	1
8058                     ; 2734   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
8060  0002 721952be      	bres	21182,#4
8061                     ; 2737   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8061                     ; 2738                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8063  0006 7b06          	ld	a,(OFST+5,sp)
8064  0008 97            	ld	xl,a
8065  0009 a610          	ld	a,#16
8066  000b 42            	mul	x,a
8067  000c 9f            	ld	a,xl
8068  000d 1a03          	or	a,(OFST+2,sp)
8069  000f 6b01          	ld	(OFST+0,sp),a
8070  0011 c652bc        	ld	a,21180
8071  0014 a40c          	and	a,#12
8072  0016 1a01          	or	a,(OFST+0,sp)
8073  0018 c752bc        	ld	21180,a
8074                     ; 2741   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8076  001b 7b02          	ld	a,(OFST+1,sp)
8077  001d 2706          	jreq	L5214
8078                     ; 2743     TIM1->CCER2 |= TIM1_CCER2_CC4P;
8080  001f 721a52be      	bset	21182,#5
8082  0023 2004          	jra	L7214
8083  0025               L5214:
8084                     ; 2747     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
8086  0025 721b52be      	bres	21182,#5
8087  0029               L7214:
8088                     ; 2751   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
8090  0029 721852be      	bset	21182,#4
8091                     ; 2752 }
8094  002d 5b03          	addw	sp,#3
8095  002f 81            	ret	
8108                     	xdef	_TIM1_SelectHallSensor
8109                     	xdef	_TIM1_EncoderInterfaceConfig
8110                     	xdef	_TIM1_ETRConfig
8111                     	xdef	_TIM1_SelectMasterSlaveMode
8112                     	xdef	_TIM1_SelectSlaveMode
8113                     	xdef	_TIM1_SelectOutputTrigger
8114                     	xdef	_TIM1_SelectInputTrigger
8115                     	xdef	_TIM1_ETRClockMode2Config
8116                     	xdef	_TIM1_ETRClockMode1Config
8117                     	xdef	_TIM1_TIxExternalClockConfig
8118                     	xdef	_TIM1_InternalClockConfig
8119                     	xdef	_TIM1_SelectCCDMA
8120                     	xdef	_TIM1_DMACmd
8121                     	xdef	_TIM1_DMAConfig
8122                     	xdef	_TIM1_ClearITPendingBit
8123                     	xdef	_TIM1_GetITStatus
8124                     	xdef	_TIM1_ClearFlag
8125                     	xdef	_TIM1_GetFlagStatus
8126                     	xdef	_TIM1_GenerateEvent
8127                     	xdef	_TIM1_ITConfig
8128                     	xdef	_TIM1_SetIC4Prescaler
8129                     	xdef	_TIM1_SetIC3Prescaler
8130                     	xdef	_TIM1_SetIC2Prescaler
8131                     	xdef	_TIM1_SetIC1Prescaler
8132                     	xdef	_TIM1_GetCapture4
8133                     	xdef	_TIM1_GetCapture3
8134                     	xdef	_TIM1_GetCapture2
8135                     	xdef	_TIM1_GetCapture1
8136                     	xdef	_TIM1_PWMIConfig
8137                     	xdef	_TIM1_ICInit
8138                     	xdef	_TIM1_CCxNCmd
8139                     	xdef	_TIM1_CCxCmd
8140                     	xdef	_TIM1_SelectCOM
8141                     	xdef	_TIM1_SelectOCREFClear
8142                     	xdef	_TIM1_OC3NPolarityConfig
8143                     	xdef	_TIM1_OC3PolarityConfig
8144                     	xdef	_TIM1_OC2NPolarityConfig
8145                     	xdef	_TIM1_OC2PolarityConfig
8146                     	xdef	_TIM1_OC1NPolarityConfig
8147                     	xdef	_TIM1_OC1PolarityConfig
8148                     	xdef	_TIM1_ClearOC4Ref
8149                     	xdef	_TIM1_ClearOC3Ref
8150                     	xdef	_TIM1_ClearOC2Ref
8151                     	xdef	_TIM1_ClearOC1Ref
8152                     	xdef	_TIM1_OC3FastConfig
8153                     	xdef	_TIM1_OC2FastConfig
8154                     	xdef	_TIM1_OC1FastConfig
8155                     	xdef	_TIM1_OC4PreloadConfig
8156                     	xdef	_TIM1_OC3PreloadConfig
8157                     	xdef	_TIM1_OC2PreloadConfig
8158                     	xdef	_TIM1_OC1PreloadConfig
8159                     	xdef	_TIM1_ForcedOC3Config
8160                     	xdef	_TIM1_ForcedOC2Config
8161                     	xdef	_TIM1_ForcedOC1Config
8162                     	xdef	_TIM1_CCPreloadControl
8163                     	xdef	_TIM1_SetCompare4
8164                     	xdef	_TIM1_SetCompare3
8165                     	xdef	_TIM1_SetCompare2
8166                     	xdef	_TIM1_SetCompare1
8167                     	xdef	_TIM1_SelectOCxM
8168                     	xdef	_TIM1_CtrlPWMOutputs
8169                     	xdef	_TIM1_BDTRConfig
8170                     	xdef	_TIM1_OC3Init
8171                     	xdef	_TIM1_OC2Init
8172                     	xdef	_TIM1_OC1Init
8173                     	xdef	_TIM1_Cmd
8174                     	xdef	_TIM1_SelectOnePulseMode
8175                     	xdef	_TIM1_ARRPreloadConfig
8176                     	xdef	_TIM1_UpdateRequestConfig
8177                     	xdef	_TIM1_UpdateDisableConfig
8178                     	xdef	_TIM1_GetPrescaler
8179                     	xdef	_TIM1_GetCounter
8180                     	xdef	_TIM1_SetAutoreload
8181                     	xdef	_TIM1_SetCounter
8182                     	xdef	_TIM1_CounterModeConfig
8183                     	xdef	_TIM1_PrescalerConfig
8184                     	xdef	_TIM1_TimeBaseInit
8185                     	xdef	_TIM1_DeInit
8204                     	end
