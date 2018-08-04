   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  49                     ; 178 void TIM1_DeInit(void)
  49                     ; 179 {
  51                     	switch	.text
  52  0000               _TIM1_DeInit:
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
 173  0098 81            	ret	
 276                     ; 238 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 276                     ; 239                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 276                     ; 240                        uint16_t TIM1_Period,
 276                     ; 241                        uint8_t TIM1_RepetitionCounter)
 276                     ; 242 {
 277                     	switch	.text
 278  0099               _TIM1_TimeBaseInit:
 280  0099 89            	pushw	x
 281       00000000      OFST:	set	0
 284                     ; 244   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 286                     ; 248   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 288  009a 7b06          	ld	a,(OFST+6,sp)
 289  009c c752c3        	ld	21187,a
 290                     ; 249   TIM1->ARRL = (uint8_t)(TIM1_Period);
 292  009f 7b07          	ld	a,(OFST+7,sp)
 293  00a1 c752c4        	ld	21188,a
 294                     ; 252   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 296  00a4 9e            	ld	a,xh
 297  00a5 c752c1        	ld	21185,a
 298                     ; 253   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 300  00a8 9f            	ld	a,xl
 301  00a9 c752c2        	ld	21186,a
 302                     ; 256   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 302                     ; 257                         | (uint8_t)(TIM1_CounterMode));
 304  00ac c652b0        	ld	a,21168
 305  00af a48f          	and	a,#143
 306  00b1 1a05          	or	a,(OFST+5,sp)
 307  00b3 c752b0        	ld	21168,a
 308                     ; 260   TIM1->RCR = TIM1_RepetitionCounter;
 310  00b6 7b08          	ld	a,(OFST+8,sp)
 311  00b8 c752c5        	ld	21189,a
 312                     ; 262 }
 315  00bb 85            	popw	x
 316  00bc 81            	ret	
 381                     ; 276 void TIM1_PrescalerConfig(uint16_t Prescaler, TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
 381                     ; 277 {
 382                     	switch	.text
 383  00bd               _TIM1_PrescalerConfig:
 385  00bd 89            	pushw	x
 386       00000000      OFST:	set	0
 389                     ; 279   assert_param(IS_TIM1_PRESCALER_RELOAD(TIM1_PSCReloadMode));
 391                     ; 282   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
 393  00be 9e            	ld	a,xh
 394  00bf c752c1        	ld	21185,a
 395                     ; 283   TIM1->PSCRL = (uint8_t)(Prescaler);
 397  00c2 9f            	ld	a,xl
 398  00c3 c752c2        	ld	21186,a
 399                     ; 286   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
 401  00c6 7b05          	ld	a,(OFST+5,sp)
 402  00c8 c752b8        	ld	21176,a
 403                     ; 287 }
 406  00cb 85            	popw	x
 407  00cc 81            	ret	
 443                     ; 300 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
 443                     ; 301 {
 444                     	switch	.text
 445  00cd               _TIM1_CounterModeConfig:
 447  00cd 88            	push	a
 448       00000000      OFST:	set	0
 451                     ; 303   assert_param(IS_TIM1_COUNTER_MODE(TIM1_CounterMode));
 453                     ; 307   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
 453                     ; 308                         | (uint8_t)TIM1_CounterMode);
 455  00ce c652b0        	ld	a,21168
 456  00d1 a48f          	and	a,#143
 457  00d3 1a01          	or	a,(OFST+1,sp)
 458  00d5 c752b0        	ld	21168,a
 459                     ; 309 }
 462  00d8 84            	pop	a
 463  00d9 81            	ret	
 495                     ; 317 void TIM1_SetCounter(uint16_t Counter)
 495                     ; 318 {
 496                     	switch	.text
 497  00da               _TIM1_SetCounter:
 501                     ; 320   TIM1->CNTRH = (uint8_t)(Counter >> 8);
 503  00da 9e            	ld	a,xh
 504  00db c752bf        	ld	21183,a
 505                     ; 321   TIM1->CNTRL = (uint8_t)(Counter);
 507  00de 9f            	ld	a,xl
 508  00df c752c0        	ld	21184,a
 509                     ; 322 }
 512  00e2 81            	ret	
 544                     ; 330 void TIM1_SetAutoreload(uint16_t Autoreload)
 544                     ; 331 {
 545                     	switch	.text
 546  00e3               _TIM1_SetAutoreload:
 550                     ; 333   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
 552  00e3 9e            	ld	a,xh
 553  00e4 c752c3        	ld	21187,a
 554                     ; 334   TIM1->ARRL = (uint8_t)(Autoreload);
 556  00e7 9f            	ld	a,xl
 557  00e8 c752c4        	ld	21188,a
 558                     ; 335 }
 561  00eb 81            	ret	
 607                     ; 342 uint16_t TIM1_GetCounter(void)
 607                     ; 343 {
 608                     	switch	.text
 609  00ec               _TIM1_GetCounter:
 611  00ec 5204          	subw	sp,#4
 612       00000004      OFST:	set	4
 615                     ; 345   uint16_t tmpcntr = 0;
 617                     ; 346   uint8_t tmpcntrl = 0, tmpcntrh = 0;
 621                     ; 348   tmpcntrh = TIM1->CNTRH;
 623  00ee c652bf        	ld	a,21183
 624  00f1 6b02          	ld	(OFST-2,sp),a
 625                     ; 349   tmpcntrl = TIM1->CNTRL;
 627  00f3 c652c0        	ld	a,21184
 628  00f6 6b01          	ld	(OFST-3,sp),a
 629                     ; 351   tmpcntr  = (uint16_t)(tmpcntrl);
 631  00f8 5f            	clrw	x
 632  00f9 97            	ld	xl,a
 633  00fa 1f03          	ldw	(OFST-1,sp),x
 634                     ; 352   tmpcntr |= (uint16_t)((uint16_t)tmpcntrh << 8);
 636  00fc 5f            	clrw	x
 637  00fd 7b02          	ld	a,(OFST-2,sp)
 638  00ff 97            	ld	xl,a
 639  0100 7b04          	ld	a,(OFST+0,sp)
 640  0102 01            	rrwa	x,a
 641  0103 1a03          	or	a,(OFST-1,sp)
 642  0105 01            	rrwa	x,a
 643                     ; 355   return (uint16_t)tmpcntr;
 647  0106 5b04          	addw	sp,#4
 648  0108 81            	ret	
 680                     ; 363 uint16_t TIM1_GetPrescaler(void)
 680                     ; 364 {
 681                     	switch	.text
 682  0109               _TIM1_GetPrescaler:
 684  0109 89            	pushw	x
 685       00000002      OFST:	set	2
 688                     ; 365   uint16_t tmpreg = 0;
 690                     ; 366   tmpreg = (uint16_t)((uint16_t)TIM1->PSCRH << 8);
 692  010a c652c1        	ld	a,21185
 693  010d 97            	ld	xl,a
 694  010e 4f            	clr	a
 695  010f 02            	rlwa	x,a
 696  0110 1f01          	ldw	(OFST-1,sp),x
 697                     ; 368   return (uint16_t)(tmpreg | TIM1->PSCRL);
 699  0112 c652c2        	ld	a,21186
 700  0115 5f            	clrw	x
 701  0116 97            	ld	xl,a
 702  0117 01            	rrwa	x,a
 703  0118 1a02          	or	a,(OFST+0,sp)
 704  011a 01            	rrwa	x,a
 705  011b 1a01          	or	a,(OFST-1,sp)
 706  011d 01            	rrwa	x,a
 709  011e 5b02          	addw	sp,#2
 710  0120 81            	ret	
 766                     ; 377 void TIM1_UpdateDisableConfig(FunctionalState NewState)
 766                     ; 378 {
 767                     	switch	.text
 768  0121               _TIM1_UpdateDisableConfig:
 772                     ; 380   assert_param(IS_FUNCTIONAL_STATE(NewState));
 774                     ; 383   if (NewState != DISABLE)
 776  0121 4d            	tnz	a
 777  0122 2705          	jreq	L352
 778                     ; 385     TIM1->CR1 |= TIM1_CR1_UDIS;
 780  0124 721252b0      	bset	21168,#1
 783  0128 81            	ret	
 784  0129               L352:
 785                     ; 389     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
 787  0129 721352b0      	bres	21168,#1
 788                     ; 391 }
 791  012d 81            	ret	
 849                     ; 401 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
 849                     ; 402 {
 850                     	switch	.text
 851  012e               _TIM1_UpdateRequestConfig:
 855                     ; 404   assert_param(IS_TIM1_UPDATE_SOURCE(TIM1_UpdateSource));
 857                     ; 407   if (TIM1_UpdateSource != TIM1_UpdateSource_Global)
 859  012e 4d            	tnz	a
 860  012f 2705          	jreq	L503
 861                     ; 409     TIM1->CR1 |= TIM1_CR1_URS;
 863  0131 721452b0      	bset	21168,#2
 866  0135 81            	ret	
 867  0136               L503:
 868                     ; 413     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
 870  0136 721552b0      	bres	21168,#2
 871                     ; 415 }
 874  013a 81            	ret	
 910                     ; 423 void TIM1_ARRPreloadConfig(FunctionalState NewState)
 910                     ; 424 {
 911                     	switch	.text
 912  013b               _TIM1_ARRPreloadConfig:
 916                     ; 426   assert_param(IS_FUNCTIONAL_STATE(NewState));
 918                     ; 429   if (NewState != DISABLE)
 920  013b 4d            	tnz	a
 921  013c 2705          	jreq	L723
 922                     ; 431     TIM1->CR1 |= TIM1_CR1_ARPE;
 924  013e 721e52b0      	bset	21168,#7
 927  0142 81            	ret	
 928  0143               L723:
 929                     ; 435     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
 931  0143 721f52b0      	bres	21168,#7
 932                     ; 437 }
 935  0147 81            	ret	
 992                     ; 447 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
 992                     ; 448 {
 993                     	switch	.text
 994  0148               _TIM1_SelectOnePulseMode:
 998                     ; 450   assert_param(IS_TIM1_OPM_MODE(TIM1_OPMode));
1000                     ; 453   if (TIM1_OPMode != TIM1_OPMode_Repetitive)
1002  0148 4d            	tnz	a
1003  0149 2705          	jreq	L163
1004                     ; 455     TIM1->CR1 |= TIM1_CR1_OPM;
1006  014b 721652b0      	bset	21168,#3
1009  014f 81            	ret	
1010  0150               L163:
1011                     ; 459     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
1013  0150 721752b0      	bres	21168,#3
1014                     ; 461 }
1017  0154 81            	ret	
1052                     ; 469 void TIM1_Cmd(FunctionalState NewState)
1052                     ; 470 {
1053                     	switch	.text
1054  0155               _TIM1_Cmd:
1058                     ; 472   assert_param(IS_FUNCTIONAL_STATE(NewState));
1060                     ; 475   if (NewState != DISABLE)
1062  0155 4d            	tnz	a
1063  0156 2705          	jreq	L304
1064                     ; 477     TIM1->CR1 |= TIM1_CR1_CEN;
1066  0158 721052b0      	bset	21168,#0
1069  015c 81            	ret	
1070  015d               L304:
1071                     ; 481     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
1073  015d 721152b0      	bres	21168,#0
1074                     ; 483 }
1077  0161 81            	ret	
1360                     ; 574 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1360                     ; 575                   TIM1_OutputState_TypeDef TIM1_OutputState,
1360                     ; 576                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1360                     ; 577                   uint16_t TIM1_Pulse,
1360                     ; 578                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1360                     ; 579                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1360                     ; 580                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1360                     ; 581                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1360                     ; 582 {
1361                     	switch	.text
1362  0162               _TIM1_OC1Init:
1364  0162 89            	pushw	x
1365  0163 5203          	subw	sp,#3
1366       00000003      OFST:	set	3
1369                     ; 584   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1371                     ; 585   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1373                     ; 586   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1375                     ; 587   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1377                     ; 588   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1379                     ; 589   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1381                     ; 590   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1383                     ; 594   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE
1383                     ; 595                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
1385  0165 c652bd        	ld	a,21181
1386  0168 a4f0          	and	a,#240
1387  016a c752bd        	ld	21181,a
1388                     ; 598   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
1388                     ; 599                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
1388                     ; 600                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
1388                     ; 601                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
1390  016d 7b0c          	ld	a,(OFST+9,sp)
1391  016f a408          	and	a,#8
1392  0171 6b03          	ld	(OFST+0,sp),a
1393  0173 7b0b          	ld	a,(OFST+8,sp)
1394  0175 a402          	and	a,#2
1395  0177 1a03          	or	a,(OFST+0,sp)
1396  0179 6b02          	ld	(OFST-1,sp),a
1397  017b 7b08          	ld	a,(OFST+5,sp)
1398  017d a404          	and	a,#4
1399  017f 6b01          	ld	(OFST-2,sp),a
1400  0181 9f            	ld	a,xl
1401  0182 a401          	and	a,#1
1402  0184 1a01          	or	a,(OFST-2,sp)
1403  0186 1a02          	or	a,(OFST-1,sp)
1404  0188 ca52bd        	or	a,21181
1405  018b c752bd        	ld	21181,a
1406                     ; 604   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))
1406                     ; 605                           | (uint8_t)TIM1_OCMode);
1408  018e c652b9        	ld	a,21177
1409  0191 a48f          	and	a,#143
1410  0193 1a04          	or	a,(OFST+1,sp)
1411  0195 c752b9        	ld	21177,a
1412                     ; 608   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
1414  0198 c652d0        	ld	a,21200
1415  019b a4fc          	and	a,#252
1416  019d c752d0        	ld	21200,a
1417                     ; 610   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OCIdleState & TIM1_OISR_OIS1)
1417                     ; 611                           | (uint8_t)(TIM1_OCNIdleState & TIM1_OISR_OIS1N));
1419  01a0 7b0e          	ld	a,(OFST+11,sp)
1420  01a2 a402          	and	a,#2
1421  01a4 6b03          	ld	(OFST+0,sp),a
1422  01a6 7b0d          	ld	a,(OFST+10,sp)
1423  01a8 a401          	and	a,#1
1424  01aa 1a03          	or	a,(OFST+0,sp)
1425  01ac ca52d0        	or	a,21200
1426  01af c752d0        	ld	21200,a
1427                     ; 614   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
1429  01b2 7b09          	ld	a,(OFST+6,sp)
1430  01b4 c752c6        	ld	21190,a
1431                     ; 615   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
1433  01b7 7b0a          	ld	a,(OFST+7,sp)
1434  01b9 c752c7        	ld	21191,a
1435                     ; 616 }
1438  01bc 5b05          	addw	sp,#5
1439  01be 81            	ret	
1541                     ; 655 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1541                     ; 656                   TIM1_OutputState_TypeDef TIM1_OutputState,
1541                     ; 657                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1541                     ; 658                   uint16_t TIM1_Pulse,
1541                     ; 659                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1541                     ; 660                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1541                     ; 661                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1541                     ; 662                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1541                     ; 663 {
1542                     	switch	.text
1543  01bf               _TIM1_OC2Init:
1545  01bf 89            	pushw	x
1546  01c0 5203          	subw	sp,#3
1547       00000003      OFST:	set	3
1550                     ; 666   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1552                     ; 667   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1554                     ; 668   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1556                     ; 669   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1558                     ; 670   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1560                     ; 671   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1562                     ; 672   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1564                     ; 676   TIM1->CCER1 &= (uint8_t)(~(TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1566  01c2 c652bd        	ld	a,21181
1567  01c5 a40f          	and	a,#15
1568  01c7 c752bd        	ld	21181,a
1569                     ; 679   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE))
1569                     ; 680                            | (uint8_t) ((uint8_t)(TIM1_OCPolarity & TIM1_CCER1_CC2P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP)));
1571  01ca 7b0c          	ld	a,(OFST+9,sp)
1572  01cc a480          	and	a,#128
1573  01ce 6b03          	ld	(OFST+0,sp),a
1574  01d0 7b0b          	ld	a,(OFST+8,sp)
1575  01d2 a420          	and	a,#32
1576  01d4 1a03          	or	a,(OFST+0,sp)
1577  01d6 6b02          	ld	(OFST-1,sp),a
1578  01d8 7b08          	ld	a,(OFST+5,sp)
1579  01da a440          	and	a,#64
1580  01dc 6b01          	ld	(OFST-2,sp),a
1581  01de 9f            	ld	a,xl
1582  01df a410          	and	a,#16
1583  01e1 1a01          	or	a,(OFST-2,sp)
1584  01e3 1a02          	or	a,(OFST-1,sp)
1585  01e5 ca52bd        	or	a,21181
1586  01e8 c752bd        	ld	21181,a
1587                     ; 683   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1589  01eb c652ba        	ld	a,21178
1590  01ee a48f          	and	a,#143
1591  01f0 1a04          	or	a,(OFST+1,sp)
1592  01f2 c752ba        	ld	21178,a
1593                     ; 686   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1595  01f5 c652d0        	ld	a,21200
1596  01f8 a4f3          	and	a,#243
1597  01fa c752d0        	ld	21200,a
1598                     ; 688   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1600  01fd 7b0e          	ld	a,(OFST+11,sp)
1601  01ff a408          	and	a,#8
1602  0201 6b03          	ld	(OFST+0,sp),a
1603  0203 7b0d          	ld	a,(OFST+10,sp)
1604  0205 a404          	and	a,#4
1605  0207 1a03          	or	a,(OFST+0,sp)
1606  0209 ca52d0        	or	a,21200
1607  020c c752d0        	ld	21200,a
1608                     ; 691   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1610  020f 7b09          	ld	a,(OFST+6,sp)
1611  0211 c752c8        	ld	21192,a
1612                     ; 692   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1614  0214 7b0a          	ld	a,(OFST+7,sp)
1615  0216 c752c9        	ld	21193,a
1616                     ; 693 }
1619  0219 5b05          	addw	sp,#5
1620  021b 81            	ret	
1722                     ; 732 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1722                     ; 733                   TIM1_OutputState_TypeDef TIM1_OutputState,
1722                     ; 734                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1722                     ; 735                   uint16_t TIM1_Pulse,
1722                     ; 736                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1722                     ; 737                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1722                     ; 738                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1722                     ; 739                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1722                     ; 740 {
1723                     	switch	.text
1724  021c               _TIM1_OC3Init:
1726  021c 89            	pushw	x
1727  021d 5203          	subw	sp,#3
1728       00000003      OFST:	set	3
1731                     ; 743   assert_param(IS_TIM1_OC_MODE(TIM1_OCMode));
1733                     ; 744   assert_param(IS_TIM1_OUTPUT_STATE(TIM1_OutputState));
1735                     ; 745   assert_param(IS_TIM1_OUTPUTN_STATE(TIM1_OutputNState));
1737                     ; 746   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
1739                     ; 747   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
1741                     ; 748   assert_param(IS_TIM1_OCIDLE_STATE(TIM1_OCIdleState));
1743                     ; 749   assert_param(IS_TIM1_OCNIDLE_STATE(TIM1_OCNIdleState));
1745                     ; 753   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1747  021f c652be        	ld	a,21182
1748  0222 a4f0          	and	a,#240
1749  0224 c752be        	ld	21182,a
1750                     ; 756   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC3E) | (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE))
1750                     ; 757                            | (uint8_t)((uint8_t)(TIM1_OCPolarity & TIM1_CCER2_CC3P) | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER2_CC3NP)));
1752  0227 7b0c          	ld	a,(OFST+9,sp)
1753  0229 a408          	and	a,#8
1754  022b 6b03          	ld	(OFST+0,sp),a
1755  022d 7b0b          	ld	a,(OFST+8,sp)
1756  022f a402          	and	a,#2
1757  0231 1a03          	or	a,(OFST+0,sp)
1758  0233 6b02          	ld	(OFST-1,sp),a
1759  0235 7b08          	ld	a,(OFST+5,sp)
1760  0237 a404          	and	a,#4
1761  0239 6b01          	ld	(OFST-2,sp),a
1762  023b 9f            	ld	a,xl
1763  023c a401          	and	a,#1
1764  023e 1a01          	or	a,(OFST-2,sp)
1765  0240 1a02          	or	a,(OFST-1,sp)
1766  0242 ca52be        	or	a,21182
1767  0245 c752be        	ld	21182,a
1768                     ; 760   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
1770  0248 c652bb        	ld	a,21179
1771  024b a48f          	and	a,#143
1772  024d 1a04          	or	a,(OFST+1,sp)
1773  024f c752bb        	ld	21179,a
1774                     ; 763   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1776  0252 c652d0        	ld	a,21200
1777  0255 a4cf          	and	a,#207
1778  0257 c752d0        	ld	21200,a
1779                     ; 765   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | (uint8_t) (TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1781  025a 7b0e          	ld	a,(OFST+11,sp)
1782  025c a420          	and	a,#32
1783  025e 6b03          	ld	(OFST+0,sp),a
1784  0260 7b0d          	ld	a,(OFST+10,sp)
1785  0262 a410          	and	a,#16
1786  0264 1a03          	or	a,(OFST+0,sp)
1787  0266 ca52d0        	or	a,21200
1788  0269 c752d0        	ld	21200,a
1789                     ; 768   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1791  026c 7b09          	ld	a,(OFST+6,sp)
1792  026e c752ca        	ld	21194,a
1793                     ; 769   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1795  0271 7b0a          	ld	a,(OFST+7,sp)
1796  0273 c752cb        	ld	21195,a
1797                     ; 770 }
1800  0276 5b05          	addw	sp,#5
1801  0278 81            	ret	
2006                     ; 800 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
2006                     ; 801                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
2006                     ; 802                      uint8_t TIM1_DeadTime,
2006                     ; 803                      TIM1_BreakState_TypeDef TIM1_Break,
2006                     ; 804                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
2006                     ; 805                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
2006                     ; 806 {
2007                     	switch	.text
2008  0279               _TIM1_BDTRConfig:
2010  0279 89            	pushw	x
2011  027a 88            	push	a
2012       00000001      OFST:	set	1
2015                     ; 809   assert_param(IS_TIM1_OSSI_STATE(TIM1_OSSIState));
2017                     ; 810   assert_param(IS_TIM1_LOCK_LEVEL(TIM1_LockLevel));
2019                     ; 811   assert_param(IS_TIM1_BREAK_STATE(TIM1_Break));
2021                     ; 812   assert_param(IS_TIM1_BREAK_POLARITY(TIM1_BreakPolarity));
2023                     ; 813   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE(TIM1_AutomaticOutput));
2025                     ; 815   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2027  027b 7b06          	ld	a,(OFST+5,sp)
2028  027d c752cf        	ld	21199,a
2029                     ; 819   TIM1->BKR  =  (uint8_t)((uint8_t)((uint8_t)TIM1_OSSIState | (uint8_t)TIM1_LockLevel)
2029                     ; 820                           | (uint8_t)((uint8_t)((uint8_t)TIM1_Break | (uint8_t)TIM1_BreakPolarity)
2029                     ; 821                                       | (uint8_t)TIM1_AutomaticOutput));
2031  0280 7b07          	ld	a,(OFST+6,sp)
2032  0282 1a08          	or	a,(OFST+7,sp)
2033  0284 1a09          	or	a,(OFST+8,sp)
2034  0286 6b01          	ld	(OFST+0,sp),a
2035  0288 9f            	ld	a,xl
2036  0289 1a02          	or	a,(OFST+1,sp)
2037  028b 1a01          	or	a,(OFST+0,sp)
2038  028d c752ce        	ld	21198,a
2039                     ; 823 }
2042  0290 5b03          	addw	sp,#3
2043  0292 81            	ret	
2079                     ; 831 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2079                     ; 832 {
2080                     	switch	.text
2081  0293               _TIM1_CtrlPWMOutputs:
2085                     ; 834   assert_param(IS_FUNCTIONAL_STATE(NewState));
2087                     ; 838   if (NewState != DISABLE)
2089  0293 4d            	tnz	a
2090  0294 2705          	jreq	L1301
2091                     ; 840     TIM1->BKR |= TIM1_BKR_MOE;
2093  0296 721e52ce      	bset	21198,#7
2096  029a 81            	ret	
2097  029b               L1301:
2098                     ; 844     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2100  029b 721f52ce      	bres	21198,#7
2101                     ; 846 }
2104  029f 81            	ret	
2183                     ; 868 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
2183                     ; 869 {
2184                     	switch	.text
2185  02a0               _TIM1_SelectOCxM:
2187  02a0 89            	pushw	x
2188       00000000      OFST:	set	0
2191                     ; 871   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
2193                     ; 872   assert_param(IS_TIM1_OCM(TIM1_OCMode));
2195                     ; 874   if (TIM1_Channel == TIM1_Channel_1)
2197  02a1 9e            	ld	a,xh
2198  02a2 4d            	tnz	a
2199  02a3 2610          	jrne	L3701
2200                     ; 877     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
2202  02a5 721152bd      	bres	21181,#0
2203                     ; 880     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2205  02a9 c652b9        	ld	a,21177
2206  02ac a48f          	and	a,#143
2207  02ae 1a02          	or	a,(OFST+2,sp)
2208  02b0 c752b9        	ld	21177,a
2210  02b3 2023          	jra	L5701
2211  02b5               L3701:
2212                     ; 882   else if (TIM1_Channel == TIM1_Channel_2)
2214  02b5 7b01          	ld	a,(OFST+1,sp)
2215  02b7 4a            	dec	a
2216  02b8 2610          	jrne	L7701
2217                     ; 885     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
2219  02ba 721952bd      	bres	21181,#4
2220                     ; 888     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2222  02be c652ba        	ld	a,21178
2223  02c1 a48f          	and	a,#143
2224  02c3 1a02          	or	a,(OFST+2,sp)
2225  02c5 c752ba        	ld	21178,a
2227  02c8 200e          	jra	L5701
2228  02ca               L7701:
2229                     ; 893     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
2231  02ca 721152be      	bres	21182,#0
2232                     ; 896     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_OCMode);
2234  02ce c652bb        	ld	a,21179
2235  02d1 a48f          	and	a,#143
2236  02d3 1a02          	or	a,(OFST+2,sp)
2237  02d5 c752bb        	ld	21179,a
2238  02d8               L5701:
2239                     ; 899 }
2242  02d8 85            	popw	x
2243  02d9 81            	ret	
2275                     ; 907 void TIM1_SetCompare1(uint16_t Compare1)
2275                     ; 908 {
2276                     	switch	.text
2277  02da               _TIM1_SetCompare1:
2281                     ; 910   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
2283  02da 9e            	ld	a,xh
2284  02db c752c6        	ld	21190,a
2285                     ; 911   TIM1->CCR1L = (uint8_t)(Compare1);
2287  02de 9f            	ld	a,xl
2288  02df c752c7        	ld	21191,a
2289                     ; 913 }
2292  02e2 81            	ret	
2324                     ; 921 void TIM1_SetCompare2(uint16_t Compare2)
2324                     ; 922 {
2325                     	switch	.text
2326  02e3               _TIM1_SetCompare2:
2330                     ; 924   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
2332  02e3 9e            	ld	a,xh
2333  02e4 c752c8        	ld	21192,a
2334                     ; 925   TIM1->CCR2L = (uint8_t)(Compare2);
2336  02e7 9f            	ld	a,xl
2337  02e8 c752c9        	ld	21193,a
2338                     ; 926 }
2341  02eb 81            	ret	
2373                     ; 934 void TIM1_SetCompare3(uint16_t Compare3)
2373                     ; 935 {
2374                     	switch	.text
2375  02ec               _TIM1_SetCompare3:
2379                     ; 937   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
2381  02ec 9e            	ld	a,xh
2382  02ed c752ca        	ld	21194,a
2383                     ; 938   TIM1->CCR3L = (uint8_t)(Compare3);
2385  02f0 9f            	ld	a,xl
2386  02f1 c752cb        	ld	21195,a
2387                     ; 939 }
2390  02f4 81            	ret	
2422                     ; 947 void TIM1_SetCompare4(uint16_t Compare4)
2422                     ; 948 {
2423                     	switch	.text
2424  02f5               _TIM1_SetCompare4:
2428                     ; 950   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
2430  02f5 9e            	ld	a,xh
2431  02f6 c752cc        	ld	21196,a
2432                     ; 951   TIM1->CCR4L = (uint8_t)(Compare4);
2434  02f9 9f            	ld	a,xl
2435  02fa c752cd        	ld	21197,a
2436                     ; 952 }
2439  02fd 81            	ret	
2475                     ; 960 void TIM1_CCPreloadControl(FunctionalState NewState)
2475                     ; 961 {
2476                     	switch	.text
2477  02fe               _TIM1_CCPreloadControl:
2481                     ; 963   assert_param(IS_FUNCTIONAL_STATE(NewState));
2483                     ; 966   if (NewState != DISABLE)
2485  02fe 4d            	tnz	a
2486  02ff 2705          	jreq	L1021
2487                     ; 968     TIM1->CR2 |= TIM1_CR2_CCPC;
2489  0301 721052b1      	bset	21169,#0
2492  0305 81            	ret	
2493  0306               L1021:
2494                     ; 972     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
2496  0306 721152b1      	bres	21169,#0
2497                     ; 974 }
2500  030a 81            	ret	
2558                     ; 984 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2558                     ; 985 {
2559                     	switch	.text
2560  030b               _TIM1_ForcedOC1Config:
2562  030b 88            	push	a
2563       00000000      OFST:	set	0
2566                     ; 987   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2568                     ; 990   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2570  030c c652b9        	ld	a,21177
2571  030f a48f          	and	a,#143
2572  0311 1a01          	or	a,(OFST+1,sp)
2573  0313 c752b9        	ld	21177,a
2574                     ; 991 }
2577  0316 84            	pop	a
2578  0317 81            	ret	
2614                     ; 1001 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2614                     ; 1002 {
2615                     	switch	.text
2616  0318               _TIM1_ForcedOC2Config:
2618  0318 88            	push	a
2619       00000000      OFST:	set	0
2622                     ; 1004   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2624                     ; 1007   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2626  0319 c652ba        	ld	a,21178
2627  031c a48f          	and	a,#143
2628  031e 1a01          	or	a,(OFST+1,sp)
2629  0320 c752ba        	ld	21178,a
2630                     ; 1008 }
2633  0323 84            	pop	a
2634  0324 81            	ret	
2670                     ; 1018 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
2670                     ; 1019 {
2671                     	switch	.text
2672  0325               _TIM1_ForcedOC3Config:
2674  0325 88            	push	a
2675       00000000      OFST:	set	0
2678                     ; 1021   assert_param(IS_TIM1_FORCED_ACTION(TIM1_ForcedAction));
2680                     ; 1024   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | (uint8_t)TIM1_ForcedAction);
2682  0326 c652bb        	ld	a,21179
2683  0329 a48f          	and	a,#143
2684  032b 1a01          	or	a,(OFST+1,sp)
2685  032d c752bb        	ld	21179,a
2686                     ; 1025 }
2689  0330 84            	pop	a
2690  0331 81            	ret	
2726                     ; 1033 void TIM1_OC1PreloadConfig(FunctionalState NewState)
2726                     ; 1034 {
2727                     	switch	.text
2728  0332               _TIM1_OC1PreloadConfig:
2732                     ; 1036   assert_param(IS_FUNCTIONAL_STATE(NewState));
2734                     ; 1039   if (NewState != DISABLE)
2736  0332 4d            	tnz	a
2737  0333 2705          	jreq	L5031
2738                     ; 1041     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
2740  0335 721652b9      	bset	21177,#3
2743  0339 81            	ret	
2744  033a               L5031:
2745                     ; 1045     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2747  033a 721752b9      	bres	21177,#3
2748                     ; 1047 }
2751  033e 81            	ret	
2787                     ; 1055 void TIM1_OC2PreloadConfig(FunctionalState NewState)
2787                     ; 1056 {
2788                     	switch	.text
2789  033f               _TIM1_OC2PreloadConfig:
2793                     ; 1058   assert_param(IS_FUNCTIONAL_STATE(NewState));
2795                     ; 1061   if (NewState != DISABLE)
2797  033f 4d            	tnz	a
2798  0340 2705          	jreq	L7231
2799                     ; 1063     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
2801  0342 721652ba      	bset	21178,#3
2804  0346 81            	ret	
2805  0347               L7231:
2806                     ; 1067     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2808  0347 721752ba      	bres	21178,#3
2809                     ; 1069 }
2812  034b 81            	ret	
2848                     ; 1077 void TIM1_OC3PreloadConfig(FunctionalState NewState)
2848                     ; 1078 {
2849                     	switch	.text
2850  034c               _TIM1_OC3PreloadConfig:
2854                     ; 1080   assert_param(IS_FUNCTIONAL_STATE(NewState));
2856                     ; 1083   if (NewState != DISABLE)
2858  034c 4d            	tnz	a
2859  034d 2705          	jreq	L1531
2860                     ; 1085     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
2862  034f 721652bb      	bset	21179,#3
2865  0353 81            	ret	
2866  0354               L1531:
2867                     ; 1089     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2869  0354 721752bb      	bres	21179,#3
2870                     ; 1091 }
2873  0358 81            	ret	
2909                     ; 1099 void TIM1_OC4PreloadConfig(FunctionalState NewState)
2909                     ; 1100 {
2910                     	switch	.text
2911  0359               _TIM1_OC4PreloadConfig:
2915                     ; 1102   assert_param(IS_FUNCTIONAL_STATE(NewState));
2917                     ; 1105   if (NewState != DISABLE)
2919  0359 4d            	tnz	a
2920  035a 2705          	jreq	L3731
2921                     ; 1107     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
2923  035c 721652bc      	bset	21180,#3
2926  0360 81            	ret	
2927  0361               L3731:
2928                     ; 1111     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
2930  0361 721752bc      	bres	21180,#3
2931                     ; 1113 }
2934  0365 81            	ret	
2969                     ; 1121 void TIM1_OC1FastConfig(FunctionalState NewState)
2969                     ; 1122 {
2970                     	switch	.text
2971  0366               _TIM1_OC1FastConfig:
2975                     ; 1124   assert_param(IS_FUNCTIONAL_STATE(NewState));
2977                     ; 1127   if (NewState != DISABLE)
2979  0366 4d            	tnz	a
2980  0367 2705          	jreq	L5141
2981                     ; 1129     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
2983  0369 721452b9      	bset	21177,#2
2986  036d 81            	ret	
2987  036e               L5141:
2988                     ; 1133     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
2990  036e 721552b9      	bres	21177,#2
2991                     ; 1135 }
2994  0372 81            	ret	
3029                     ; 1143 void TIM1_OC2FastConfig(FunctionalState NewState)
3029                     ; 1144 {
3030                     	switch	.text
3031  0373               _TIM1_OC2FastConfig:
3035                     ; 1146   assert_param(IS_FUNCTIONAL_STATE(NewState));
3037                     ; 1149   if (NewState != DISABLE)
3039  0373 4d            	tnz	a
3040  0374 2705          	jreq	L7341
3041                     ; 1151     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
3043  0376 721452ba      	bset	21178,#2
3046  037a 81            	ret	
3047  037b               L7341:
3048                     ; 1155     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3050  037b 721552ba      	bres	21178,#2
3051                     ; 1157 }
3054  037f 81            	ret	
3089                     ; 1165 void TIM1_OC3FastConfig(FunctionalState NewState)
3089                     ; 1166 {
3090                     	switch	.text
3091  0380               _TIM1_OC3FastConfig:
3095                     ; 1168   assert_param(IS_FUNCTIONAL_STATE(NewState));
3097                     ; 1171   if (NewState != DISABLE)
3099  0380 4d            	tnz	a
3100  0381 2705          	jreq	L1641
3101                     ; 1173     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
3103  0383 721452bb      	bset	21179,#2
3106  0387 81            	ret	
3107  0388               L1641:
3108                     ; 1177     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
3110  0388 721552bb      	bres	21179,#2
3111                     ; 1179 }
3114  038c 81            	ret	
3149                     ; 1187 void TIM1_ClearOC1Ref(FunctionalState NewState)
3149                     ; 1188 {
3150                     	switch	.text
3151  038d               _TIM1_ClearOC1Ref:
3155                     ; 1190   assert_param(IS_FUNCTIONAL_STATE(NewState));
3157                     ; 1193   if (NewState != DISABLE)
3159  038d 4d            	tnz	a
3160  038e 2705          	jreq	L3051
3161                     ; 1195     TIM1->CCMR1 |= TIM1_CCMR_OCxCE;
3163  0390 721e52b9      	bset	21177,#7
3166  0394 81            	ret	
3167  0395               L3051:
3168                     ; 1199     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3170  0395 721f52b9      	bres	21177,#7
3171                     ; 1201 }
3174  0399 81            	ret	
3209                     ; 1209 void TIM1_ClearOC2Ref(FunctionalState NewState)
3209                     ; 1210 {
3210                     	switch	.text
3211  039a               _TIM1_ClearOC2Ref:
3215                     ; 1212   assert_param(IS_FUNCTIONAL_STATE(NewState));
3217                     ; 1215   if (NewState != DISABLE)
3219  039a 4d            	tnz	a
3220  039b 2705          	jreq	L5251
3221                     ; 1217     TIM1->CCMR2 |= TIM1_CCMR_OCxCE;
3223  039d 721e52ba      	bset	21178,#7
3226  03a1 81            	ret	
3227  03a2               L5251:
3228                     ; 1221     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3230  03a2 721f52ba      	bres	21178,#7
3231                     ; 1223 }
3234  03a6 81            	ret	
3269                     ; 1231 void TIM1_ClearOC3Ref(FunctionalState NewState)
3269                     ; 1232 {
3270                     	switch	.text
3271  03a7               _TIM1_ClearOC3Ref:
3275                     ; 1234   assert_param(IS_FUNCTIONAL_STATE(NewState));
3277                     ; 1237   if (NewState != DISABLE)
3279  03a7 4d            	tnz	a
3280  03a8 2705          	jreq	L7451
3281                     ; 1239     TIM1->CCMR3 |= TIM1_CCMR_OCxCE;
3283  03aa 721e52bb      	bset	21179,#7
3286  03ae 81            	ret	
3287  03af               L7451:
3288                     ; 1243     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3290  03af 721f52bb      	bres	21179,#7
3291                     ; 1245 }
3294  03b3 81            	ret	
3329                     ; 1253 void TIM1_ClearOC4Ref(FunctionalState NewState)
3329                     ; 1254 {
3330                     	switch	.text
3331  03b4               _TIM1_ClearOC4Ref:
3335                     ; 1256   assert_param(IS_FUNCTIONAL_STATE(NewState));
3337                     ; 1259   if (NewState != DISABLE)
3339  03b4 4d            	tnz	a
3340  03b5 2705          	jreq	L1751
3341                     ; 1261     TIM1->CCMR4 |= TIM1_CCMR_OCxCE;
3343  03b7 721e52bc      	bset	21180,#7
3346  03bb 81            	ret	
3347  03bc               L1751:
3348                     ; 1265     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxCE);
3350  03bc 721f52bc      	bres	21180,#7
3351                     ; 1267 }
3354  03c0 81            	ret	
3390                     ; 1277 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3390                     ; 1278 {
3391                     	switch	.text
3392  03c1               _TIM1_OC1PolarityConfig:
3396                     ; 1280   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3398                     ; 1283   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3400  03c1 4d            	tnz	a
3401  03c2 2705          	jreq	L3161
3402                     ; 1285     TIM1->CCER1 |= TIM1_CCER1_CC1P;
3404  03c4 721252bd      	bset	21181,#1
3407  03c8 81            	ret	
3408  03c9               L3161:
3409                     ; 1289     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3411  03c9 721352bd      	bres	21181,#1
3412                     ; 1291 }
3415  03cd 81            	ret	
3451                     ; 1301 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3451                     ; 1302 {
3452                     	switch	.text
3453  03ce               _TIM1_OC1NPolarityConfig:
3457                     ; 1304   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3459                     ; 1307   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3461  03ce 4d            	tnz	a
3462  03cf 2705          	jreq	L5361
3463                     ; 1309     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
3465  03d1 721652bd      	bset	21181,#3
3468  03d5 81            	ret	
3469  03d6               L5361:
3470                     ; 1313     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
3472  03d6 721752bd      	bres	21181,#3
3473                     ; 1315 }
3476  03da 81            	ret	
3512                     ; 1325 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3512                     ; 1326 {
3513                     	switch	.text
3514  03db               _TIM1_OC2PolarityConfig:
3518                     ; 1328   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3520                     ; 1331   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3522  03db 4d            	tnz	a
3523  03dc 2705          	jreq	L7561
3524                     ; 1333     TIM1->CCER1 |= TIM1_CCER1_CC2P;
3526  03de 721a52bd      	bset	21181,#5
3529  03e2 81            	ret	
3530  03e3               L7561:
3531                     ; 1337     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3533  03e3 721b52bd      	bres	21181,#5
3534                     ; 1339 }
3537  03e7 81            	ret	
3573                     ; 1349 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3573                     ; 1350 {
3574                     	switch	.text
3575  03e8               _TIM1_OC2NPolarityConfig:
3579                     ; 1352   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3581                     ; 1355   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3583  03e8 4d            	tnz	a
3584  03e9 2705          	jreq	L1071
3585                     ; 1357     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
3587  03eb 721e52bd      	bset	21181,#7
3590  03ef 81            	ret	
3591  03f0               L1071:
3592                     ; 1361     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
3594  03f0 721f52bd      	bres	21181,#7
3595                     ; 1363 }
3598  03f4 81            	ret	
3634                     ; 1373 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
3634                     ; 1374 {
3635                     	switch	.text
3636  03f5               _TIM1_OC3PolarityConfig:
3640                     ; 1376   assert_param(IS_TIM1_OC_POLARITY(TIM1_OCPolarity));
3642                     ; 1379   if (TIM1_OCPolarity != TIM1_OCPolarity_High)
3644  03f5 4d            	tnz	a
3645  03f6 2705          	jreq	L3271
3646                     ; 1381     TIM1->CCER2 |= TIM1_CCER2_CC3P;
3648  03f8 721252be      	bset	21182,#1
3651  03fc 81            	ret	
3652  03fd               L3271:
3653                     ; 1385     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
3655  03fd 721352be      	bres	21182,#1
3656                     ; 1387 }
3659  0401 81            	ret	
3695                     ; 1397 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
3695                     ; 1398 {
3696                     	switch	.text
3697  0402               _TIM1_OC3NPolarityConfig:
3701                     ; 1400   assert_param(IS_TIM1_OCN_POLARITY(TIM1_OCNPolarity));
3703                     ; 1403   if (TIM1_OCNPolarity != TIM1_OCNPolarity_High)
3705  0402 4d            	tnz	a
3706  0403 2705          	jreq	L5471
3707                     ; 1405     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
3709  0405 721652be      	bset	21182,#3
3712  0409 81            	ret	
3713  040a               L5471:
3714                     ; 1409     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
3716  040a 721752be      	bres	21182,#3
3717                     ; 1411 }
3720  040e 81            	ret	
3779                     ; 1421 void TIM1_SelectOCREFClear(TIM1_OCReferenceClear_TypeDef TIM1_OCReferenceClear)
3779                     ; 1422 {
3780                     	switch	.text
3781  040f               _TIM1_SelectOCREFClear:
3785                     ; 1424   assert_param(IS_TIM1_OCREFERENCECECLEAR_SOURCE(TIM1_OCReferenceClear));
3787                     ; 1427   TIM1->SMCR &=  (uint8_t) (~TIM1_SMCR_OCCS);
3789  040f 721752b2      	bres	21170,#3
3790                     ; 1428   TIM1->SMCR |=  (uint8_t) TIM1_OCReferenceClear;
3792  0413 ca52b2        	or	a,21170
3793  0416 c752b2        	ld	21170,a
3794                     ; 1429 }
3797  0419 81            	ret	
3832                     ; 1437 void TIM1_SelectCOM(FunctionalState NewState)
3832                     ; 1438 {
3833                     	switch	.text
3834  041a               _TIM1_SelectCOM:
3838                     ; 1440   assert_param(IS_FUNCTIONAL_STATE(NewState));
3840                     ; 1443   if (NewState != DISABLE)
3842  041a 4d            	tnz	a
3843  041b 2705          	jreq	L5102
3844                     ; 1445     TIM1->CR2 |= TIM1_CR2_CCUS;
3846  041d 721452b1      	bset	21169,#2
3849  0421 81            	ret	
3850  0422               L5102:
3851                     ; 1449     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCUS);
3853  0422 721552b1      	bres	21169,#2
3854                     ; 1451 }
3857  0426 81            	ret	
3902                     ; 1465 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
3902                     ; 1466 {
3903                     	switch	.text
3904  0427               _TIM1_CCxCmd:
3906  0427 89            	pushw	x
3907       00000000      OFST:	set	0
3910                     ; 1468   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
3912                     ; 1469   assert_param(IS_FUNCTIONAL_STATE(NewState));
3914                     ; 1471   if (TIM1_Channel == TIM1_Channel_1)
3916  0428 9e            	ld	a,xh
3917  0429 4d            	tnz	a
3918  042a 2610          	jrne	L3402
3919                     ; 1474     if (NewState != DISABLE)
3921  042c 9f            	ld	a,xl
3922  042d 4d            	tnz	a
3923  042e 2706          	jreq	L5402
3924                     ; 1476       TIM1->CCER1 |= TIM1_CCER1_CC1E;
3926  0430 721052bd      	bset	21181,#0
3928  0434 203e          	jra	L1502
3929  0436               L5402:
3930                     ; 1480       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
3932  0436 721152bd      	bres	21181,#0
3933  043a 2038          	jra	L1502
3934  043c               L3402:
3935                     ; 1483   else if (TIM1_Channel == TIM1_Channel_2)
3937  043c 7b01          	ld	a,(OFST+1,sp)
3938  043e a101          	cp	a,#1
3939  0440 2610          	jrne	L3502
3940                     ; 1486     if (NewState != DISABLE)
3942  0442 7b02          	ld	a,(OFST+2,sp)
3943  0444 2706          	jreq	L5502
3944                     ; 1488       TIM1->CCER1 |= TIM1_CCER1_CC2E;
3946  0446 721852bd      	bset	21181,#4
3948  044a 2028          	jra	L1502
3949  044c               L5502:
3950                     ; 1492       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
3952  044c 721952bd      	bres	21181,#4
3953  0450 2022          	jra	L1502
3954  0452               L3502:
3955                     ; 1495   else if (TIM1_Channel == TIM1_Channel_3)
3957  0452 a102          	cp	a,#2
3958  0454 2610          	jrne	L3602
3959                     ; 1498     if (NewState != DISABLE)
3961  0456 7b02          	ld	a,(OFST+2,sp)
3962  0458 2706          	jreq	L5602
3963                     ; 1500       TIM1->CCER2 |= TIM1_CCER2_CC3E;
3965  045a 721052be      	bset	21182,#0
3967  045e 2014          	jra	L1502
3968  0460               L5602:
3969                     ; 1504       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
3971  0460 721152be      	bres	21182,#0
3972  0464 200e          	jra	L1502
3973  0466               L3602:
3974                     ; 1510     if (NewState != DISABLE)
3976  0466 7b02          	ld	a,(OFST+2,sp)
3977  0468 2706          	jreq	L3702
3978                     ; 1512       TIM1->CCER2 |= TIM1_CCER2_CC4E;
3980  046a 721852be      	bset	21182,#4
3982  046e 2004          	jra	L1502
3983  0470               L3702:
3984                     ; 1516       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
3986  0470 721952be      	bres	21182,#4
3987  0474               L1502:
3988                     ; 1519 }
3991  0474 85            	popw	x
3992  0475 81            	ret	
4037                     ; 1532 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
4037                     ; 1533 {
4038                     	switch	.text
4039  0476               _TIM1_CCxNCmd:
4041  0476 89            	pushw	x
4042       00000000      OFST:	set	0
4045                     ; 1535   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL(TIM1_Channel));
4047                     ; 1536   assert_param(IS_FUNCTIONAL_STATE(NewState));
4049                     ; 1538   if (TIM1_Channel == TIM1_Channel_1)
4051  0477 9e            	ld	a,xh
4052  0478 4d            	tnz	a
4053  0479 2610          	jrne	L1212
4054                     ; 1541     if (NewState != DISABLE)
4056  047b 9f            	ld	a,xl
4057  047c 4d            	tnz	a
4058  047d 2706          	jreq	L3212
4059                     ; 1543       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
4061  047f 721452bd      	bset	21181,#2
4063  0483 2029          	jra	L7212
4064  0485               L3212:
4065                     ; 1547       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
4067  0485 721552bd      	bres	21181,#2
4068  0489 2023          	jra	L7212
4069  048b               L1212:
4070                     ; 1550   else if (TIM1_Channel == TIM1_Channel_2)
4072  048b 7b01          	ld	a,(OFST+1,sp)
4073  048d 4a            	dec	a
4074  048e 2610          	jrne	L1312
4075                     ; 1553     if (NewState != DISABLE)
4077  0490 7b02          	ld	a,(OFST+2,sp)
4078  0492 2706          	jreq	L3312
4079                     ; 1555       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
4081  0494 721c52bd      	bset	21181,#6
4083  0498 2014          	jra	L7212
4084  049a               L3312:
4085                     ; 1559       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
4087  049a 721d52bd      	bres	21181,#6
4088  049e 200e          	jra	L7212
4089  04a0               L1312:
4090                     ; 1565     if (NewState != DISABLE)
4092  04a0 7b02          	ld	a,(OFST+2,sp)
4093  04a2 2706          	jreq	L1412
4094                     ; 1567       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
4096  04a4 721452be      	bset	21182,#2
4098  04a8 2004          	jra	L7212
4099  04aa               L1412:
4100                     ; 1571       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
4102  04aa 721552be      	bres	21182,#2
4103  04ae               L7212:
4104                     ; 1574 }
4107  04ae 85            	popw	x
4108  04af 81            	ret	
4274                     ; 1661 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
4274                     ; 1662                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4274                     ; 1663                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
4274                     ; 1664                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4274                     ; 1665                  uint8_t TIM1_ICFilter)
4274                     ; 1666 {
4275                     	switch	.text
4276  04b0               _TIM1_ICInit:
4278  04b0 89            	pushw	x
4279       00000000      OFST:	set	0
4282                     ; 1669   assert_param(IS_TIM1_CHANNEL(TIM1_Channel));
4284                     ; 1670   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4286                     ; 1671   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4288                     ; 1672   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4290                     ; 1673   assert_param(IS_TIM1_IC_FILTER(TIM1_ICFilter));
4292                     ; 1675   if (TIM1_Channel == TIM1_Channel_1)
4294  04b1 9e            	ld	a,xh
4295  04b2 4d            	tnz	a
4296  04b3 2614          	jrne	L7322
4297                     ; 1678     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4299  04b5 7b07          	ld	a,(OFST+7,sp)
4300  04b7 88            	push	a
4301  04b8 7b06          	ld	a,(OFST+6,sp)
4302  04ba 97            	ld	xl,a
4303  04bb 7b03          	ld	a,(OFST+3,sp)
4304  04bd 95            	ld	xh,a
4305  04be cd0797        	call	L3_TI1_Config
4307  04c1 84            	pop	a
4308                     ; 1680     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4310  04c2 7b06          	ld	a,(OFST+6,sp)
4311  04c4 cd05ea        	call	_TIM1_SetIC1Prescaler
4314  04c7 2044          	jra	L1422
4315  04c9               L7322:
4316                     ; 1682   else if (TIM1_Channel == TIM1_Channel_2)
4318  04c9 7b01          	ld	a,(OFST+1,sp)
4319  04cb a101          	cp	a,#1
4320  04cd 2614          	jrne	L3422
4321                     ; 1685     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4323  04cf 7b07          	ld	a,(OFST+7,sp)
4324  04d1 88            	push	a
4325  04d2 7b06          	ld	a,(OFST+6,sp)
4326  04d4 97            	ld	xl,a
4327  04d5 7b03          	ld	a,(OFST+3,sp)
4328  04d7 95            	ld	xh,a
4329  04d8 cd07c7        	call	L5_TI2_Config
4331  04db 84            	pop	a
4332                     ; 1687     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4334  04dc 7b06          	ld	a,(OFST+6,sp)
4335  04de cd05f7        	call	_TIM1_SetIC2Prescaler
4338  04e1 202a          	jra	L1422
4339  04e3               L3422:
4340                     ; 1689   else if (TIM1_Channel == TIM1_Channel_3)
4342  04e3 a102          	cp	a,#2
4343  04e5 2614          	jrne	L7422
4344                     ; 1692     TI3_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4346  04e7 7b07          	ld	a,(OFST+7,sp)
4347  04e9 88            	push	a
4348  04ea 7b06          	ld	a,(OFST+6,sp)
4349  04ec 97            	ld	xl,a
4350  04ed 7b03          	ld	a,(OFST+3,sp)
4351  04ef 95            	ld	xh,a
4352  04f0 cd07f7        	call	L7_TI3_Config
4354  04f3 84            	pop	a
4355                     ; 1694     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
4357  04f4 7b06          	ld	a,(OFST+6,sp)
4358  04f6 cd0604        	call	_TIM1_SetIC3Prescaler
4361  04f9 2012          	jra	L1422
4362  04fb               L7422:
4363                     ; 1699     TI4_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4365  04fb 7b07          	ld	a,(OFST+7,sp)
4366  04fd 88            	push	a
4367  04fe 7b06          	ld	a,(OFST+6,sp)
4368  0500 97            	ld	xl,a
4369  0501 7b03          	ld	a,(OFST+3,sp)
4370  0503 95            	ld	xh,a
4371  0504 cd0827        	call	L11_TI4_Config
4373  0507 84            	pop	a
4374                     ; 1701     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
4376  0508 7b06          	ld	a,(OFST+6,sp)
4377  050a cd0611        	call	_TIM1_SetIC4Prescaler
4379  050d               L1422:
4380                     ; 1703 }
4383  050d 85            	popw	x
4384  050e 81            	ret	
4480                     ; 1730 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
4480                     ; 1731                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
4480                     ; 1732                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
4480                     ; 1733                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
4480                     ; 1734                      uint8_t TIM1_ICFilter)
4480                     ; 1735 {
4481                     	switch	.text
4482  050f               _TIM1_PWMIConfig:
4484  050f 89            	pushw	x
4485  0510 89            	pushw	x
4486       00000002      OFST:	set	2
4489                     ; 1736   TIM1_ICPolarity_TypeDef icpolarity = TIM1_ICPolarity_Rising;
4491                     ; 1737   TIM1_ICSelection_TypeDef icselection = TIM1_ICSelection_DirectTI;
4493                     ; 1740   assert_param(IS_TIM1_PWMI_CHANNEL(TIM1_Channel));
4495                     ; 1741   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
4497                     ; 1742   assert_param(IS_TIM1_IC_SELECTION(TIM1_ICSelection));
4499                     ; 1743   assert_param(IS_TIM1_IC_PRESCALER(TIM1_ICPrescaler));
4501                     ; 1746   if (TIM1_ICPolarity != TIM1_ICPolarity_Falling)
4503  0511 9f            	ld	a,xl
4504  0512 4a            	dec	a
4505  0513 2702          	jreq	L7132
4506                     ; 1748     icpolarity = TIM1_ICPolarity_Falling;
4508  0515 a601          	ld	a,#1
4510  0517               L7132:
4511                     ; 1752     icpolarity = TIM1_ICPolarity_Rising;
4513  0517 6b01          	ld	(OFST-1,sp),a
4514                     ; 1756   if (TIM1_ICSelection == TIM1_ICSelection_DirectTI)
4516  0519 7b07          	ld	a,(OFST+5,sp)
4517  051b 4a            	dec	a
4518  051c 2604          	jrne	L3232
4519                     ; 1758     icselection = TIM1_ICSelection_IndirectTI;
4521  051e a602          	ld	a,#2
4523  0520 2002          	jra	L5232
4524  0522               L3232:
4525                     ; 1762     icselection = TIM1_ICSelection_DirectTI;
4527  0522 a601          	ld	a,#1
4528  0524               L5232:
4529  0524 6b02          	ld	(OFST+0,sp),a
4530                     ; 1765   if (TIM1_Channel == TIM1_Channel_1)
4532  0526 7b03          	ld	a,(OFST+1,sp)
4533  0528 2626          	jrne	L7232
4534                     ; 1768     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4536  052a 7b09          	ld	a,(OFST+7,sp)
4537  052c 88            	push	a
4538  052d 7b08          	ld	a,(OFST+6,sp)
4539  052f 97            	ld	xl,a
4540  0530 7b05          	ld	a,(OFST+3,sp)
4541  0532 95            	ld	xh,a
4542  0533 cd0797        	call	L3_TI1_Config
4544  0536 84            	pop	a
4545                     ; 1771     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4547  0537 7b08          	ld	a,(OFST+6,sp)
4548  0539 cd05ea        	call	_TIM1_SetIC1Prescaler
4550                     ; 1774     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
4552  053c 7b09          	ld	a,(OFST+7,sp)
4553  053e 88            	push	a
4554  053f 7b03          	ld	a,(OFST+1,sp)
4555  0541 97            	ld	xl,a
4556  0542 7b02          	ld	a,(OFST+0,sp)
4557  0544 95            	ld	xh,a
4558  0545 cd07c7        	call	L5_TI2_Config
4560  0548 84            	pop	a
4561                     ; 1777     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4563  0549 7b08          	ld	a,(OFST+6,sp)
4564  054b cd05f7        	call	_TIM1_SetIC2Prescaler
4567  054e 2023          	jra	L1332
4568  0550               L7232:
4569                     ; 1782     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection, TIM1_ICFilter);
4571  0550 7b09          	ld	a,(OFST+7,sp)
4572  0552 88            	push	a
4573  0553 7b08          	ld	a,(OFST+6,sp)
4574  0555 97            	ld	xl,a
4575  0556 7b05          	ld	a,(OFST+3,sp)
4576  0558 95            	ld	xh,a
4577  0559 cd07c7        	call	L5_TI2_Config
4579  055c 84            	pop	a
4580                     ; 1785     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
4582  055d 7b08          	ld	a,(OFST+6,sp)
4583  055f cd05f7        	call	_TIM1_SetIC2Prescaler
4585                     ; 1788     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
4587  0562 7b09          	ld	a,(OFST+7,sp)
4588  0564 88            	push	a
4589  0565 7b03          	ld	a,(OFST+1,sp)
4590  0567 97            	ld	xl,a
4591  0568 7b02          	ld	a,(OFST+0,sp)
4592  056a 95            	ld	xh,a
4593  056b cd0797        	call	L3_TI1_Config
4595  056e 84            	pop	a
4596                     ; 1791     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
4598  056f 7b08          	ld	a,(OFST+6,sp)
4599  0571 ad77          	call	_TIM1_SetIC1Prescaler
4601  0573               L1332:
4602                     ; 1793 }
4605  0573 5b04          	addw	sp,#4
4606  0575 81            	ret	
4652                     ; 1800 uint16_t TIM1_GetCapture1(void)
4652                     ; 1801 {
4653                     	switch	.text
4654  0576               _TIM1_GetCapture1:
4656  0576 5204          	subw	sp,#4
4657       00000004      OFST:	set	4
4660                     ; 1804   uint16_t tmpccr1 = 0;
4662                     ; 1805   uint8_t tmpccr1l = 0, tmpccr1h = 0;
4666                     ; 1807   tmpccr1h = TIM1->CCR1H;
4668  0578 c652c6        	ld	a,21190
4669  057b 6b02          	ld	(OFST-2,sp),a
4670                     ; 1808   tmpccr1l = TIM1->CCR1L;
4672  057d c652c7        	ld	a,21191
4673  0580 6b01          	ld	(OFST-3,sp),a
4674                     ; 1810   tmpccr1 = (uint16_t)(tmpccr1l);
4676  0582 5f            	clrw	x
4677  0583 97            	ld	xl,a
4678  0584 1f03          	ldw	(OFST-1,sp),x
4679                     ; 1811   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4681  0586 5f            	clrw	x
4682  0587 7b02          	ld	a,(OFST-2,sp)
4683  0589 97            	ld	xl,a
4684  058a 7b04          	ld	a,(OFST+0,sp)
4685  058c 01            	rrwa	x,a
4686  058d 1a03          	or	a,(OFST-1,sp)
4687  058f 01            	rrwa	x,a
4688                     ; 1813   return (uint16_t)tmpccr1;
4692  0590 5b04          	addw	sp,#4
4693  0592 81            	ret	
4739                     ; 1821 uint16_t TIM1_GetCapture2(void)
4739                     ; 1822 {
4740                     	switch	.text
4741  0593               _TIM1_GetCapture2:
4743  0593 5204          	subw	sp,#4
4744       00000004      OFST:	set	4
4747                     ; 1825   uint16_t tmpccr2 = 0;
4749                     ; 1826   uint8_t tmpccr2l = 0, tmpccr2h = 0;
4753                     ; 1828   tmpccr2h = TIM1->CCR2H;
4755  0595 c652c8        	ld	a,21192
4756  0598 6b02          	ld	(OFST-2,sp),a
4757                     ; 1829   tmpccr2l = TIM1->CCR2L;
4759  059a c652c9        	ld	a,21193
4760  059d 6b01          	ld	(OFST-3,sp),a
4761                     ; 1831   tmpccr2 = (uint16_t)(tmpccr2l);
4763  059f 5f            	clrw	x
4764  05a0 97            	ld	xl,a
4765  05a1 1f03          	ldw	(OFST-1,sp),x
4766                     ; 1832   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4768  05a3 5f            	clrw	x
4769  05a4 7b02          	ld	a,(OFST-2,sp)
4770  05a6 97            	ld	xl,a
4771  05a7 7b04          	ld	a,(OFST+0,sp)
4772  05a9 01            	rrwa	x,a
4773  05aa 1a03          	or	a,(OFST-1,sp)
4774  05ac 01            	rrwa	x,a
4775                     ; 1834   return (uint16_t)tmpccr2;
4779  05ad 5b04          	addw	sp,#4
4780  05af 81            	ret	
4826                     ; 1842 uint16_t TIM1_GetCapture3(void)
4826                     ; 1843 {
4827                     	switch	.text
4828  05b0               _TIM1_GetCapture3:
4830  05b0 5204          	subw	sp,#4
4831       00000004      OFST:	set	4
4834                     ; 1845   uint16_t tmpccr3 = 0;
4836                     ; 1846   uint8_t tmpccr3l = 0, tmpccr3h = 0;
4840                     ; 1848   tmpccr3h = TIM1->CCR3H;
4842  05b2 c652ca        	ld	a,21194
4843  05b5 6b02          	ld	(OFST-2,sp),a
4844                     ; 1849   tmpccr3l = TIM1->CCR3L;
4846  05b7 c652cb        	ld	a,21195
4847  05ba 6b01          	ld	(OFST-3,sp),a
4848                     ; 1851   tmpccr3 = (uint16_t)(tmpccr3l);
4850  05bc 5f            	clrw	x
4851  05bd 97            	ld	xl,a
4852  05be 1f03          	ldw	(OFST-1,sp),x
4853                     ; 1852   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4855  05c0 5f            	clrw	x
4856  05c1 7b02          	ld	a,(OFST-2,sp)
4857  05c3 97            	ld	xl,a
4858  05c4 7b04          	ld	a,(OFST+0,sp)
4859  05c6 01            	rrwa	x,a
4860  05c7 1a03          	or	a,(OFST-1,sp)
4861  05c9 01            	rrwa	x,a
4862                     ; 1854   return (uint16_t)tmpccr3;
4866  05ca 5b04          	addw	sp,#4
4867  05cc 81            	ret	
4913                     ; 1862 uint16_t TIM1_GetCapture4(void)
4913                     ; 1863 {
4914                     	switch	.text
4915  05cd               _TIM1_GetCapture4:
4917  05cd 5204          	subw	sp,#4
4918       00000004      OFST:	set	4
4921                     ; 1865   uint16_t tmpccr4 = 0;
4923                     ; 1866   uint8_t tmpccr4l = 0, tmpccr4h = 0;
4927                     ; 1868   tmpccr4h = TIM1->CCR4H;
4929  05cf c652cc        	ld	a,21196
4930  05d2 6b02          	ld	(OFST-2,sp),a
4931                     ; 1869   tmpccr4l = TIM1->CCR4L;
4933  05d4 c652cd        	ld	a,21197
4934  05d7 6b01          	ld	(OFST-3,sp),a
4935                     ; 1871   tmpccr4 = (uint16_t)(tmpccr4l);
4937  05d9 5f            	clrw	x
4938  05da 97            	ld	xl,a
4939  05db 1f03          	ldw	(OFST-1,sp),x
4940                     ; 1872   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
4942  05dd 5f            	clrw	x
4943  05de 7b02          	ld	a,(OFST-2,sp)
4944  05e0 97            	ld	xl,a
4945  05e1 7b04          	ld	a,(OFST+0,sp)
4946  05e3 01            	rrwa	x,a
4947  05e4 1a03          	or	a,(OFST-1,sp)
4948  05e6 01            	rrwa	x,a
4949                     ; 1874   return (uint16_t)tmpccr4;
4953  05e7 5b04          	addw	sp,#4
4954  05e9 81            	ret	
4990                     ; 1887 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
4990                     ; 1888 {
4991                     	switch	.text
4992  05ea               _TIM1_SetIC1Prescaler:
4994  05ea 88            	push	a
4995       00000000      OFST:	set	0
4998                     ; 1890   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC1Prescaler));
5000                     ; 1893   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC1Prescaler);
5002  05eb c652b9        	ld	a,21177
5003  05ee a4f3          	and	a,#243
5004  05f0 1a01          	or	a,(OFST+1,sp)
5005  05f2 c752b9        	ld	21177,a
5006                     ; 1894 }
5009  05f5 84            	pop	a
5010  05f6 81            	ret	
5046                     ; 1906 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5046                     ; 1907 {
5047                     	switch	.text
5048  05f7               _TIM1_SetIC2Prescaler:
5050  05f7 88            	push	a
5051       00000000      OFST:	set	0
5054                     ; 1909   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC2Prescaler));
5056                     ; 1912   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC2Prescaler);
5058  05f8 c652ba        	ld	a,21178
5059  05fb a4f3          	and	a,#243
5060  05fd 1a01          	or	a,(OFST+1,sp)
5061  05ff c752ba        	ld	21178,a
5062                     ; 1913 }
5065  0602 84            	pop	a
5066  0603 81            	ret	
5102                     ; 1925 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5102                     ; 1926 {
5103                     	switch	.text
5104  0604               _TIM1_SetIC3Prescaler:
5106  0604 88            	push	a
5107       00000000      OFST:	set	0
5110                     ; 1929   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC3Prescaler));
5112                     ; 1932   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC3Prescaler);
5114  0605 c652bb        	ld	a,21179
5115  0608 a4f3          	and	a,#243
5116  060a 1a01          	or	a,(OFST+1,sp)
5117  060c c752bb        	ld	21179,a
5118                     ; 1933 }
5121  060f 84            	pop	a
5122  0610 81            	ret	
5158                     ; 1945 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
5158                     ; 1946 {
5159                     	switch	.text
5160  0611               _TIM1_SetIC4Prescaler:
5162  0611 88            	push	a
5163       00000000      OFST:	set	0
5166                     ; 1949   assert_param(IS_TIM1_IC_PRESCALER(TIM1_IC4Prescaler));
5168                     ; 1952   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | (uint8_t)TIM1_IC4Prescaler);
5170  0612 c652bc        	ld	a,21180
5171  0615 a4f3          	and	a,#243
5172  0617 1a01          	or	a,(OFST+1,sp)
5173  0619 c752bc        	ld	21180,a
5174                     ; 1953 }
5177  061c 84            	pop	a
5178  061d 81            	ret	
5285                     ; 1988 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
5285                     ; 1989 {
5286                     	switch	.text
5287  061e               _TIM1_ITConfig:
5289  061e 89            	pushw	x
5290       00000000      OFST:	set	0
5293                     ; 1991   assert_param(IS_TIM1_IT(TIM1_IT));
5295                     ; 1992   assert_param(IS_FUNCTIONAL_STATE(NewState));
5297                     ; 1994   if (NewState != DISABLE)
5299  061f 9f            	ld	a,xl
5300  0620 4d            	tnz	a
5301  0621 2706          	jreq	L1752
5302                     ; 1997     TIM1->IER |= (uint8_t)TIM1_IT;
5304  0623 9e            	ld	a,xh
5305  0624 ca52b5        	or	a,21173
5307  0627 2006          	jra	L3752
5308  0629               L1752:
5309                     ; 2002     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
5311  0629 7b01          	ld	a,(OFST+1,sp)
5312  062b 43            	cpl	a
5313  062c c452b5        	and	a,21173
5314  062f               L3752:
5315  062f c752b5        	ld	21173,a
5316                     ; 2004 }
5319  0632 85            	popw	x
5320  0633 81            	ret	
5425                     ; 2020 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
5425                     ; 2021 {
5426                     	switch	.text
5427  0634               _TIM1_GenerateEvent:
5431                     ; 2023   assert_param(IS_TIM1_EVENT_SOURCE(TIM1_EventSource));
5433                     ; 2026   TIM1->EGR = (uint8_t)TIM1_EventSource;
5435  0634 c752b8        	ld	21176,a
5436                     ; 2027 }
5439  0637 81            	ret	
5609                     ; 2046 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
5609                     ; 2047 {
5610                     	switch	.text
5611  0638               _TIM1_GetFlagStatus:
5613  0638 89            	pushw	x
5614  0639 89            	pushw	x
5615       00000002      OFST:	set	2
5618                     ; 2048   FlagStatus bitstatus = RESET;
5620                     ; 2049   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
5624                     ; 2052   assert_param(IS_TIM1_GET_FLAG(TIM1_FLAG));
5626                     ; 2054   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
5628  063a 9f            	ld	a,xl
5629  063b c452b6        	and	a,21174
5630  063e 6b01          	ld	(OFST-1,sp),a
5631                     ; 2055   tim1_flag_h = (uint8_t)(TIM1->SR2 & (uint8_t)((uint16_t)TIM1_FLAG >> 8));
5633  0640 c652b7        	ld	a,21175
5634  0643 1403          	and	a,(OFST+1,sp)
5635  0645 6b02          	ld	(OFST+0,sp),a
5636                     ; 2057   if ((uint8_t)((uint8_t)tim1_flag_l | (uint8_t)tim1_flag_h) != 0)
5638  0647 1a01          	or	a,(OFST-1,sp)
5639  0649 2702          	jreq	L1372
5640                     ; 2059     bitstatus = SET;
5642  064b a601          	ld	a,#1
5644  064d               L1372:
5645                     ; 2063     bitstatus = RESET;
5647                     ; 2065   return (FlagStatus)(bitstatus);
5651  064d 5b04          	addw	sp,#4
5652  064f 81            	ret	
5687                     ; 2086 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
5687                     ; 2087 {
5688                     	switch	.text
5689  0650               _TIM1_ClearFlag:
5691  0650 89            	pushw	x
5692       00000000      OFST:	set	0
5695                     ; 2089   assert_param(IS_TIM1_CLEAR_FLAG(TIM1_FLAG));
5697                     ; 2092   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
5699  0651 9f            	ld	a,xl
5700  0652 43            	cpl	a
5701  0653 c752b6        	ld	21174,a
5702                     ; 2093   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & (uint8_t)0x1E);
5704  0656 7b01          	ld	a,(OFST+1,sp)
5705  0658 43            	cpl	a
5706  0659 a41e          	and	a,#30
5707  065b c752b7        	ld	21175,a
5708                     ; 2094 }
5711  065e 85            	popw	x
5712  065f 81            	ret	
5772                     ; 2111 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
5772                     ; 2112 {
5773                     	switch	.text
5774  0660               _TIM1_GetITStatus:
5776  0660 88            	push	a
5777  0661 89            	pushw	x
5778       00000002      OFST:	set	2
5781                     ; 2113   ITStatus bitstatus = RESET;
5783                     ; 2115   uint8_t TIM1_itStatus = 0x0, TIM1_itEnable = 0x0;
5787                     ; 2118   assert_param(IS_TIM1_GET_IT(TIM1_IT));
5789                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
5791  0662 c452b6        	and	a,21174
5792  0665 6b01          	ld	(OFST-1,sp),a
5793                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
5795  0667 c652b5        	ld	a,21173
5796  066a 1403          	and	a,(OFST+1,sp)
5797  066c 6b02          	ld	(OFST+0,sp),a
5798                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
5800  066e 7b01          	ld	a,(OFST-1,sp)
5801  0670 2708          	jreq	L1003
5803  0672 7b02          	ld	a,(OFST+0,sp)
5804  0674 2704          	jreq	L1003
5805                     ; 2126     bitstatus = SET;
5807  0676 a601          	ld	a,#1
5809  0678 2001          	jra	L3003
5810  067a               L1003:
5811                     ; 2130     bitstatus = RESET;
5813  067a 4f            	clr	a
5814  067b               L3003:
5815                     ; 2132   return (ITStatus)(bitstatus);
5819  067b 5b03          	addw	sp,#3
5820  067d 81            	ret	
5856                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
5856                     ; 2150 {
5857                     	switch	.text
5858  067e               _TIM1_ClearITPendingBit:
5862                     ; 2152   assert_param(IS_TIM1_IT(TIM1_IT));
5864                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
5866  067e 43            	cpl	a
5867  067f c752b6        	ld	21174,a
5868                     ; 2156 }
5871  0682 81            	ret	
6409                     ; 2164 void TIM1_DMAConfig(TIM1_DMABase_TypeDef TIM1_DMABase,
6409                     ; 2165                     TIM1_DMABurstLength_TypeDef TIM1_DMABurstLength)
6409                     ; 2166 {
6410                     	switch	.text
6411  0683               _TIM1_DMAConfig:
6415                     ; 2168   assert_param(IS_TIM1_DMABase(TIM1_DMABase));
6417                     ; 2169   assert_param(IS_TIM1_DMABurstLength(TIM1_DMABurstLength));
6419                     ; 2172   TIM1->DCR1 = (uint8_t)TIM1_DMABase;
6421  0683 9e            	ld	a,xh
6422  0684 c752d1        	ld	21201,a
6423                     ; 2173   TIM1->DCR2 = (uint8_t)TIM1_DMABurstLength;
6425  0687 9f            	ld	a,xl
6426  0688 c752d2        	ld	21202,a
6427                     ; 2174 }
6430  068b 81            	ret	
6524                     ; 2186 void TIM1_DMACmd(TIM1_DMASource_TypeDef TIM1_DMASource, FunctionalState NewState)
6524                     ; 2187 {
6525                     	switch	.text
6526  068c               _TIM1_DMACmd:
6528  068c 89            	pushw	x
6529       00000000      OFST:	set	0
6532                     ; 2189   assert_param(IS_FUNCTIONAL_STATE(NewState));
6534                     ; 2190   assert_param(IS_TIM1_DMA_SOURCE(TIM1_DMASource));
6536                     ; 2192   if (NewState != DISABLE)
6538  068d 9f            	ld	a,xl
6539  068e 4d            	tnz	a
6540  068f 2706          	jreq	L7133
6541                     ; 2195     TIM1->DER |= (uint8_t)TIM1_DMASource;
6543  0691 9e            	ld	a,xh
6544  0692 ca52b4        	or	a,21172
6546  0695 2006          	jra	L1233
6547  0697               L7133:
6548                     ; 2200     TIM1->DER &= (uint8_t)(~TIM1_DMASource);
6550  0697 7b01          	ld	a,(OFST+1,sp)
6551  0699 43            	cpl	a
6552  069a c452b4        	and	a,21172
6553  069d               L1233:
6554  069d c752b4        	ld	21172,a
6555                     ; 2202 }
6558  06a0 85            	popw	x
6559  06a1 81            	ret	
6594                     ; 2210 void TIM1_SelectCCDMA(FunctionalState NewState)
6594                     ; 2211 {
6595                     	switch	.text
6596  06a2               _TIM1_SelectCCDMA:
6600                     ; 2213   assert_param(IS_FUNCTIONAL_STATE(NewState));
6602                     ; 2215   if (NewState != DISABLE)
6604  06a2 4d            	tnz	a
6605  06a3 2705          	jreq	L1433
6606                     ; 2218     TIM1->CR2 |= TIM1_CR2_CCDS;
6608  06a5 721652b1      	bset	21169,#3
6611  06a9 81            	ret	
6612  06aa               L1433:
6613                     ; 2223     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCDS);
6615  06aa 721752b1      	bres	21169,#3
6616                     ; 2225 }
6619  06ae 81            	ret	
6643                     ; 2248 void TIM1_InternalClockConfig(void)
6643                     ; 2249 {
6644                     	switch	.text
6645  06af               _TIM1_InternalClockConfig:
6649                     ; 2251   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
6651  06af c652b2        	ld	a,21170
6652  06b2 a4f8          	and	a,#248
6653  06b4 c752b2        	ld	21170,a
6654                     ; 2252 }
6657  06b7 81            	ret	
6744                     ; 2269 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
6744                     ; 2270                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
6744                     ; 2271                                  uint8_t ICFilter)
6744                     ; 2272 {
6745                     	switch	.text
6746  06b8               _TIM1_TIxExternalClockConfig:
6748  06b8 89            	pushw	x
6749       00000000      OFST:	set	0
6752                     ; 2274   assert_param(IS_TIM1_TIXCLK_SOURCE(TIM1_TIxExternalCLKSource));
6754                     ; 2275   assert_param(IS_TIM1_IC_POLARITY(TIM1_ICPolarity));
6756                     ; 2276   assert_param(IS_TIM1_IC_FILTER(ICFilter));
6758                     ; 2279   if (TIM1_TIxExternalCLKSource == TIM1_TIxExternalCLK1Source_TI2)
6760  06b9 9e            	ld	a,xh
6761  06ba a160          	cp	a,#96
6762  06bc 260e          	jrne	L3143
6763                     ; 2281     TI2_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6765  06be 7b05          	ld	a,(OFST+5,sp)
6766  06c0 88            	push	a
6767  06c1 ae0001        	ldw	x,#1
6768  06c4 7b03          	ld	a,(OFST+3,sp)
6769  06c6 95            	ld	xh,a
6770  06c7 cd07c7        	call	L5_TI2_Config
6773  06ca 200c          	jra	L5143
6774  06cc               L3143:
6775                     ; 2285     TI1_Config(TIM1_ICPolarity, TIM1_ICSelection_DirectTI, ICFilter);
6777  06cc 7b05          	ld	a,(OFST+5,sp)
6778  06ce 88            	push	a
6779  06cf ae0001        	ldw	x,#1
6780  06d2 7b03          	ld	a,(OFST+3,sp)
6781  06d4 95            	ld	xh,a
6782  06d5 cd0797        	call	L3_TI1_Config
6784  06d8               L5143:
6785  06d8 84            	pop	a
6786                     ; 2289   TIM1_SelectInputTrigger((TIM1_TRGSelection_TypeDef)TIM1_TIxExternalCLKSource);
6788  06d9 7b01          	ld	a,(OFST+1,sp)
6789  06db ad2e          	call	_TIM1_SelectInputTrigger
6791                     ; 2292   TIM1->SMCR |= (uint8_t)(TIM1_SlaveMode_External1);
6793  06dd c652b2        	ld	a,21170
6794  06e0 aa07          	or	a,#7
6795  06e2 c752b2        	ld	21170,a
6796                     ; 2293 }
6799  06e5 85            	popw	x
6800  06e6 81            	ret	
6915                     ; 2311 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
6915                     ; 2312                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
6915                     ; 2313                               uint8_t ExtTRGFilter)
6915                     ; 2314 {
6916                     	switch	.text
6917  06e7               _TIM1_ETRClockMode1Config:
6919  06e7 89            	pushw	x
6920       00000000      OFST:	set	0
6923                     ; 2316   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
6925                     ; 2317   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
6927                     ; 2318   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
6929                     ; 2321   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
6931  06e8 7b05          	ld	a,(OFST+5,sp)
6932  06ea 88            	push	a
6933  06eb 7b02          	ld	a,(OFST+2,sp)
6934  06ed 95            	ld	xh,a
6935  06ee ad4f          	call	_TIM1_ETRConfig
6937  06f0 84            	pop	a
6938                     ; 2324   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(TIM1_SMCR_SMS | TIM1_SMCR_TS)))
6938                     ; 2325                          | (uint8_t)((uint8_t)TIM1_SlaveMode_External1 | (uint8_t) TIM1_TRGSelection_ETRF));
6940  06f1 c652b2        	ld	a,21170
6941  06f4 aa77          	or	a,#119
6942  06f6 c752b2        	ld	21170,a
6943                     ; 2326 }
6946  06f9 85            	popw	x
6947  06fa 81            	ret	
7003                     ; 2344 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7003                     ; 2345                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7003                     ; 2346                               uint8_t ExtTRGFilter)
7003                     ; 2347 {
7004                     	switch	.text
7005  06fb               _TIM1_ETRClockMode2Config:
7007  06fb 89            	pushw	x
7008       00000000      OFST:	set	0
7011                     ; 2349   assert_param(IS_TIM1_EXT_PRESCALER(TIM1_ExtTRGPrescaler));
7013                     ; 2350   assert_param(IS_TIM1_EXT_POLARITY(TIM1_ExtTRGPolarity));
7015                     ; 2353   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
7017  06fc 7b05          	ld	a,(OFST+5,sp)
7018  06fe 88            	push	a
7019  06ff 7b02          	ld	a,(OFST+2,sp)
7020  0701 95            	ld	xh,a
7021  0702 ad3b          	call	_TIM1_ETRConfig
7023  0704 721c52b3      	bset	21171,#6
7024  0708 84            	pop	a
7025                     ; 2356   TIM1->ETR |= TIM1_ETR_ECE;
7027                     ; 2357 }
7030  0709 85            	popw	x
7031  070a 81            	ret	
7138                     ; 2407 void TIM1_SelectInputTrigger(TIM1_TRGSelection_TypeDef TIM1_InputTriggerSource)
7138                     ; 2408 {
7139                     	switch	.text
7140  070b               _TIM1_SelectInputTrigger:
7142  070b 88            	push	a
7143       00000000      OFST:	set	0
7146                     ; 2410   assert_param(IS_TIM1_TRIGGER_SELECTION(TIM1_InputTriggerSource));
7148                     ; 2413   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
7150  070c c652b2        	ld	a,21170
7151  070f a48f          	and	a,#143
7152  0711 1a01          	or	a,(OFST+1,sp)
7153  0713 c752b2        	ld	21170,a
7154                     ; 2414 }
7157  0716 84            	pop	a
7158  0717 81            	ret	
7264                     ; 2430 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
7264                     ; 2431 {
7265                     	switch	.text
7266  0718               _TIM1_SelectOutputTrigger:
7268  0718 88            	push	a
7269       00000000      OFST:	set	0
7272                     ; 2433   assert_param(IS_TIM1_TRGO_SOURCE(TIM1_TRGOSource));
7274                     ; 2435   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | (uint8_t) TIM1_TRGOSource);
7276  0719 c652b1        	ld	a,21169
7277  071c a48f          	and	a,#143
7278  071e 1a01          	or	a,(OFST+1,sp)
7279  0720 c752b1        	ld	21169,a
7280                     ; 2436 }
7283  0723 84            	pop	a
7284  0724 81            	ret	
7358                     ; 2448 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
7358                     ; 2449 {
7359                     	switch	.text
7360  0725               _TIM1_SelectSlaveMode:
7362  0725 88            	push	a
7363       00000000      OFST:	set	0
7366                     ; 2451   assert_param(IS_TIM1_SLAVE_MODE(TIM1_SlaveMode));
7368                     ; 2454   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) | (uint8_t)TIM1_SlaveMode);
7370  0726 c652b2        	ld	a,21170
7371  0729 a4f8          	and	a,#248
7372  072b 1a01          	or	a,(OFST+1,sp)
7373  072d c752b2        	ld	21170,a
7374                     ; 2456 }
7377  0730 84            	pop	a
7378  0731 81            	ret	
7414                     ; 2464 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
7414                     ; 2465 {
7415                     	switch	.text
7416  0732               _TIM1_SelectMasterSlaveMode:
7420                     ; 2467   assert_param(IS_FUNCTIONAL_STATE(NewState));
7422                     ; 2470   if (NewState != DISABLE)
7424  0732 4d            	tnz	a
7425  0733 2705          	jreq	L7663
7426                     ; 2472     TIM1->SMCR |= TIM1_SMCR_MSM;
7428  0735 721e52b2      	bset	21170,#7
7431  0739 81            	ret	
7432  073a               L7663:
7433                     ; 2476     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
7435  073a 721f52b2      	bres	21170,#7
7436                     ; 2478 }
7439  073e 81            	ret	
7493                     ; 2496 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
7493                     ; 2497                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
7493                     ; 2498                     uint8_t ExtTRGFilter)
7493                     ; 2499 {
7494                     	switch	.text
7495  073f               _TIM1_ETRConfig:
7497  073f 89            	pushw	x
7498       00000000      OFST:	set	0
7501                     ; 2500   assert_param(IS_TIM1_EXT_TRG_FILTER(ExtTRGFilter));
7503                     ; 2503   TIM1->ETR |= (uint8_t)((uint8_t)((uint8_t) TIM1_ExtTRGPrescaler
7503                     ; 2504                                    | (uint8_t) TIM1_ExtTRGPolarity)
7503                     ; 2505                          | (uint8_t) ExtTRGFilter);
7505  0740 9f            	ld	a,xl
7506  0741 1a01          	or	a,(OFST+1,sp)
7507  0743 1a05          	or	a,(OFST+5,sp)
7508  0745 ca52b3        	or	a,21171
7509  0748 c752b3        	ld	21171,a
7510                     ; 2506 }
7513  074b 85            	popw	x
7514  074c 81            	ret	
7600                     ; 2544 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
7600                     ; 2545                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
7600                     ; 2546                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
7600                     ; 2547 {
7601                     	switch	.text
7602  074d               _TIM1_EncoderInterfaceConfig:
7604  074d 89            	pushw	x
7605       00000000      OFST:	set	0
7608                     ; 2549   assert_param(IS_TIM1_ENCODER_MODE(TIM1_EncoderMode));
7610                     ; 2550   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC1Polarity));
7612                     ; 2551   assert_param(IS_TIM1_IC_POLARITY(TIM1_IC2Polarity));
7614                     ; 2554   if (TIM1_IC1Polarity != TIM1_ICPolarity_Rising)
7616  074e 9f            	ld	a,xl
7617  074f 4d            	tnz	a
7618  0750 2706          	jreq	L7573
7619                     ; 2556     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7621  0752 721252bd      	bset	21181,#1
7623  0756 2004          	jra	L1673
7624  0758               L7573:
7625                     ; 2560     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7627  0758 721352bd      	bres	21181,#1
7628  075c               L1673:
7629                     ; 2563   if (TIM1_IC2Polarity != TIM1_ICPolarity_Rising)
7631  075c 7b05          	ld	a,(OFST+5,sp)
7632  075e 2706          	jreq	L3673
7633                     ; 2565     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7635  0760 721a52bd      	bset	21181,#5
7637  0764 2004          	jra	L5673
7638  0766               L3673:
7639                     ; 2569     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7641  0766 721b52bd      	bres	21181,#5
7642  076a               L5673:
7643                     ; 2572   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS)) | (uint8_t) TIM1_EncoderMode);
7645  076a c652b2        	ld	a,21170
7646  076d a4f0          	and	a,#240
7647  076f 1a01          	or	a,(OFST+1,sp)
7648  0771 c752b2        	ld	21170,a
7649                     ; 2575   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS))  | (uint8_t) CCMR_TIxDirect_Set);
7651  0774 c652b9        	ld	a,21177
7652  0777 a4fc          	and	a,#252
7653  0779 aa01          	or	a,#1
7654  077b c752b9        	ld	21177,a
7655                     ; 2576   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS)) | (uint8_t) CCMR_TIxDirect_Set);
7657  077e c652ba        	ld	a,21178
7658  0781 a4fc          	and	a,#252
7659  0783 aa01          	or	a,#1
7660  0785 c752ba        	ld	21178,a
7661                     ; 2578 }
7664  0788 85            	popw	x
7665  0789 81            	ret	
7701                     ; 2586 void TIM1_SelectHallSensor(FunctionalState NewState)
7701                     ; 2587 {
7702                     	switch	.text
7703  078a               _TIM1_SelectHallSensor:
7707                     ; 2589   assert_param(IS_FUNCTIONAL_STATE(NewState));
7709                     ; 2592   if (NewState != DISABLE)
7711  078a 4d            	tnz	a
7712  078b 2705          	jreq	L5004
7713                     ; 2594     TIM1->CR2 |= TIM1_CR2_TI1S;
7715  078d 721e52b1      	bset	21169,#7
7718  0791 81            	ret	
7719  0792               L5004:
7720                     ; 2598     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
7722  0792 721f52b1      	bres	21169,#7
7723                     ; 2600 }
7726  0796 81            	ret	
7772                     ; 2620 static void TI1_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7772                     ; 2621 {
7773                     	switch	.text
7774  0797               L3_TI1_Config:
7776  0797 89            	pushw	x
7777  0798 88            	push	a
7778       00000001      OFST:	set	1
7781                     ; 2624   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7783  0799 721152bd      	bres	21181,#0
7784                     ; 2627   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7784                     ; 2628                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7786  079d 7b06          	ld	a,(OFST+5,sp)
7787  079f 97            	ld	xl,a
7788  07a0 a610          	ld	a,#16
7789  07a2 42            	mul	x,a
7790  07a3 9f            	ld	a,xl
7791  07a4 1a03          	or	a,(OFST+2,sp)
7792  07a6 6b01          	ld	(OFST+0,sp),a
7793  07a8 c652b9        	ld	a,21177
7794  07ab a40c          	and	a,#12
7795  07ad 1a01          	or	a,(OFST+0,sp)
7796  07af c752b9        	ld	21177,a
7797                     ; 2633   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7799  07b2 7b02          	ld	a,(OFST+1,sp)
7800  07b4 2706          	jreq	L1304
7801                     ; 2635     TIM1->CCER1 |= TIM1_CCER1_CC1P;
7803  07b6 721252bd      	bset	21181,#1
7805  07ba 2004          	jra	L3304
7806  07bc               L1304:
7807                     ; 2639     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7809  07bc 721352bd      	bres	21181,#1
7810  07c0               L3304:
7811                     ; 2643   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7813  07c0 721052bd      	bset	21181,#0
7814                     ; 2644 }
7817  07c4 5b03          	addw	sp,#3
7818  07c6 81            	ret	
7864                     ; 2660 static void TI2_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7864                     ; 2661 {
7865                     	switch	.text
7866  07c7               L5_TI2_Config:
7868  07c7 89            	pushw	x
7869  07c8 88            	push	a
7870       00000001      OFST:	set	1
7873                     ; 2663   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7875  07c9 721952bd      	bres	21181,#4
7876                     ; 2666   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7876                     ; 2667                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7878  07cd 7b06          	ld	a,(OFST+5,sp)
7879  07cf 97            	ld	xl,a
7880  07d0 a610          	ld	a,#16
7881  07d2 42            	mul	x,a
7882  07d3 9f            	ld	a,xl
7883  07d4 1a03          	or	a,(OFST+2,sp)
7884  07d6 6b01          	ld	(OFST+0,sp),a
7885  07d8 c652ba        	ld	a,21178
7886  07db a40c          	and	a,#12
7887  07dd 1a01          	or	a,(OFST+0,sp)
7888  07df c752ba        	ld	21178,a
7889                     ; 2669   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7891  07e2 7b02          	ld	a,(OFST+1,sp)
7892  07e4 2706          	jreq	L5504
7893                     ; 2671     TIM1->CCER1 |= TIM1_CCER1_CC2P;
7895  07e6 721a52bd      	bset	21181,#5
7897  07ea 2004          	jra	L7504
7898  07ec               L5504:
7899                     ; 2675     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7901  07ec 721b52bd      	bres	21181,#5
7902  07f0               L7504:
7903                     ; 2678   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7905  07f0 721852bd      	bset	21181,#4
7906                     ; 2679 }
7909  07f4 5b03          	addw	sp,#3
7910  07f6 81            	ret	
7956                     ; 2695 static void TI3_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
7956                     ; 2696 {
7957                     	switch	.text
7958  07f7               L7_TI3_Config:
7960  07f7 89            	pushw	x
7961  07f8 88            	push	a
7962       00000001      OFST:	set	1
7965                     ; 2698   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7967  07f9 721152be      	bres	21182,#0
7968                     ; 2701   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
7968                     ; 2702                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7970  07fd 7b06          	ld	a,(OFST+5,sp)
7971  07ff 97            	ld	xl,a
7972  0800 a610          	ld	a,#16
7973  0802 42            	mul	x,a
7974  0803 9f            	ld	a,xl
7975  0804 1a03          	or	a,(OFST+2,sp)
7976  0806 6b01          	ld	(OFST+0,sp),a
7977  0808 c652bb        	ld	a,21179
7978  080b a40c          	and	a,#12
7979  080d 1a01          	or	a,(OFST+0,sp)
7980  080f c752bb        	ld	21179,a
7981                     ; 2705   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
7983  0812 7b02          	ld	a,(OFST+1,sp)
7984  0814 2706          	jreq	L1014
7985                     ; 2707     TIM1->CCER2 |= TIM1_CCER2_CC3P;
7987  0816 721252be      	bset	21182,#1
7989  081a 2004          	jra	L3014
7990  081c               L1014:
7991                     ; 2711     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7993  081c 721352be      	bres	21182,#1
7994  0820               L3014:
7995                     ; 2714   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7997  0820 721052be      	bset	21182,#0
7998                     ; 2715 }
8001  0824 5b03          	addw	sp,#3
8002  0826 81            	ret	
8048                     ; 2730 static void TI4_Config(uint8_t TIM1_ICPolarity, uint8_t TIM1_ICSelection, uint8_t TIM1_ICFilter)
8048                     ; 2731 {
8049                     	switch	.text
8050  0827               L11_TI4_Config:
8052  0827 89            	pushw	x
8053  0828 88            	push	a
8054       00000001      OFST:	set	1
8057                     ; 2734   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
8059  0829 721952be      	bres	21182,#4
8060                     ; 2737   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF)))
8060                     ; 2738                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
8062  082d 7b06          	ld	a,(OFST+5,sp)
8063  082f 97            	ld	xl,a
8064  0830 a610          	ld	a,#16
8065  0832 42            	mul	x,a
8066  0833 9f            	ld	a,xl
8067  0834 1a03          	or	a,(OFST+2,sp)
8068  0836 6b01          	ld	(OFST+0,sp),a
8069  0838 c652bc        	ld	a,21180
8070  083b a40c          	and	a,#12
8071  083d 1a01          	or	a,(OFST+0,sp)
8072  083f c752bc        	ld	21180,a
8073                     ; 2741   if (TIM1_ICPolarity != TIM1_ICPolarity_Rising)
8075  0842 7b02          	ld	a,(OFST+1,sp)
8076  0844 2706          	jreq	L5214
8077                     ; 2743     TIM1->CCER2 |= TIM1_CCER2_CC4P;
8079  0846 721a52be      	bset	21182,#5
8081  084a 2004          	jra	L7214
8082  084c               L5214:
8083                     ; 2747     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
8085  084c 721b52be      	bres	21182,#5
8086  0850               L7214:
8087                     ; 2751   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
8089  0850 721852be      	bset	21182,#4
8090                     ; 2752 }
8093  0854 5b03          	addw	sp,#3
8094  0856 81            	ret	
8107                     	xdef	_TIM1_SelectHallSensor
8108                     	xdef	_TIM1_EncoderInterfaceConfig
8109                     	xdef	_TIM1_ETRConfig
8110                     	xdef	_TIM1_SelectMasterSlaveMode
8111                     	xdef	_TIM1_SelectSlaveMode
8112                     	xdef	_TIM1_SelectOutputTrigger
8113                     	xdef	_TIM1_SelectInputTrigger
8114                     	xdef	_TIM1_ETRClockMode2Config
8115                     	xdef	_TIM1_ETRClockMode1Config
8116                     	xdef	_TIM1_TIxExternalClockConfig
8117                     	xdef	_TIM1_InternalClockConfig
8118                     	xdef	_TIM1_SelectCCDMA
8119                     	xdef	_TIM1_DMACmd
8120                     	xdef	_TIM1_DMAConfig
8121                     	xdef	_TIM1_ClearITPendingBit
8122                     	xdef	_TIM1_GetITStatus
8123                     	xdef	_TIM1_ClearFlag
8124                     	xdef	_TIM1_GetFlagStatus
8125                     	xdef	_TIM1_GenerateEvent
8126                     	xdef	_TIM1_ITConfig
8127                     	xdef	_TIM1_SetIC4Prescaler
8128                     	xdef	_TIM1_SetIC3Prescaler
8129                     	xdef	_TIM1_SetIC2Prescaler
8130                     	xdef	_TIM1_SetIC1Prescaler
8131                     	xdef	_TIM1_GetCapture4
8132                     	xdef	_TIM1_GetCapture3
8133                     	xdef	_TIM1_GetCapture2
8134                     	xdef	_TIM1_GetCapture1
8135                     	xdef	_TIM1_PWMIConfig
8136                     	xdef	_TIM1_ICInit
8137                     	xdef	_TIM1_CCxNCmd
8138                     	xdef	_TIM1_CCxCmd
8139                     	xdef	_TIM1_SelectCOM
8140                     	xdef	_TIM1_SelectOCREFClear
8141                     	xdef	_TIM1_OC3NPolarityConfig
8142                     	xdef	_TIM1_OC3PolarityConfig
8143                     	xdef	_TIM1_OC2NPolarityConfig
8144                     	xdef	_TIM1_OC2PolarityConfig
8145                     	xdef	_TIM1_OC1NPolarityConfig
8146                     	xdef	_TIM1_OC1PolarityConfig
8147                     	xdef	_TIM1_ClearOC4Ref
8148                     	xdef	_TIM1_ClearOC3Ref
8149                     	xdef	_TIM1_ClearOC2Ref
8150                     	xdef	_TIM1_ClearOC1Ref
8151                     	xdef	_TIM1_OC3FastConfig
8152                     	xdef	_TIM1_OC2FastConfig
8153                     	xdef	_TIM1_OC1FastConfig
8154                     	xdef	_TIM1_OC4PreloadConfig
8155                     	xdef	_TIM1_OC3PreloadConfig
8156                     	xdef	_TIM1_OC2PreloadConfig
8157                     	xdef	_TIM1_OC1PreloadConfig
8158                     	xdef	_TIM1_ForcedOC3Config
8159                     	xdef	_TIM1_ForcedOC2Config
8160                     	xdef	_TIM1_ForcedOC1Config
8161                     	xdef	_TIM1_CCPreloadControl
8162                     	xdef	_TIM1_SetCompare4
8163                     	xdef	_TIM1_SetCompare3
8164                     	xdef	_TIM1_SetCompare2
8165                     	xdef	_TIM1_SetCompare1
8166                     	xdef	_TIM1_SelectOCxM
8167                     	xdef	_TIM1_CtrlPWMOutputs
8168                     	xdef	_TIM1_BDTRConfig
8169                     	xdef	_TIM1_OC3Init
8170                     	xdef	_TIM1_OC2Init
8171                     	xdef	_TIM1_OC1Init
8172                     	xdef	_TIM1_Cmd
8173                     	xdef	_TIM1_SelectOnePulseMode
8174                     	xdef	_TIM1_ARRPreloadConfig
8175                     	xdef	_TIM1_UpdateRequestConfig
8176                     	xdef	_TIM1_UpdateDisableConfig
8177                     	xdef	_TIM1_GetPrescaler
8178                     	xdef	_TIM1_GetCounter
8179                     	xdef	_TIM1_SetAutoreload
8180                     	xdef	_TIM1_SetCounter
8181                     	xdef	_TIM1_CounterModeConfig
8182                     	xdef	_TIM1_PrescalerConfig
8183                     	xdef	_TIM1_TimeBaseInit
8184                     	xdef	_TIM1_DeInit
8203                     	end
