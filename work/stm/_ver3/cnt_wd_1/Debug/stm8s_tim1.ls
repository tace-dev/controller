   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  51                     ; 51 void TIM1_DeInit(void)
  51                     ; 52 {
  53                     .text:	section	.text,new
  54  0000               _TIM1_DeInit:
  58                     ; 53     TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  60  0000 725f5250      	clr	21072
  61                     ; 54     TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  63  0004 725f5251      	clr	21073
  64                     ; 55     TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  66  0008 725f5252      	clr	21074
  67                     ; 56     TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  69  000c 725f5253      	clr	21075
  70                     ; 57     TIM1->IER  = TIM1_IER_RESET_VALUE;
  72  0010 725f5254      	clr	21076
  73                     ; 58     TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  75  0014 725f5256      	clr	21078
  76                     ; 60     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  78  0018 725f525c      	clr	21084
  79                     ; 61     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  81  001c 725f525d      	clr	21085
  82                     ; 63     TIM1->CCMR1 = 0x01;
  84  0020 35015258      	mov	21080,#1
  85                     ; 64     TIM1->CCMR2 = 0x01;
  87  0024 35015259      	mov	21081,#1
  88                     ; 65     TIM1->CCMR3 = 0x01;
  90  0028 3501525a      	mov	21082,#1
  91                     ; 66     TIM1->CCMR4 = 0x01;
  93  002c 3501525b      	mov	21083,#1
  94                     ; 68     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  96  0030 725f525c      	clr	21084
  97                     ; 69     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  99  0034 725f525d      	clr	21085
 100                     ; 70     TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
 102  0038 725f5258      	clr	21080
 103                     ; 71     TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
 105  003c 725f5259      	clr	21081
 106                     ; 72     TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 108  0040 725f525a      	clr	21082
 109                     ; 73     TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 111  0044 725f525b      	clr	21083
 112                     ; 74     TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 114  0048 725f525e      	clr	21086
 115                     ; 75     TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 117  004c 725f525f      	clr	21087
 118                     ; 76     TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 120  0050 725f5260      	clr	21088
 121                     ; 77     TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 123  0054 725f5261      	clr	21089
 124                     ; 78     TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 126  0058 35ff5262      	mov	21090,#255
 127                     ; 79     TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 129  005c 35ff5263      	mov	21091,#255
 130                     ; 80     TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 132  0060 725f5265      	clr	21093
 133                     ; 81     TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 135  0064 725f5266      	clr	21094
 136                     ; 82     TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 138  0068 725f5267      	clr	21095
 139                     ; 83     TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 141  006c 725f5268      	clr	21096
 142                     ; 84     TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 144  0070 725f5269      	clr	21097
 145                     ; 85     TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 147  0074 725f526a      	clr	21098
 148                     ; 86     TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 150  0078 725f526b      	clr	21099
 151                     ; 87     TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 153  007c 725f526c      	clr	21100
 154                     ; 88     TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 156  0080 725f526f      	clr	21103
 157                     ; 89     TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 159  0084 35015257      	mov	21079,#1
 160                     ; 90     TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 162  0088 725f526e      	clr	21102
 163                     ; 91     TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 165  008c 725f526d      	clr	21101
 166                     ; 92     TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 168  0090 725f5264      	clr	21092
 169                     ; 93     TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 171  0094 725f5255      	clr	21077
 172                     ; 94 }
 175  0098 81            	ret	
 278                     ; 104 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 278                     ; 105                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 278                     ; 106                        uint16_t TIM1_Period,
 278                     ; 107                        uint8_t TIM1_RepetitionCounter)
 278                     ; 108 {
 279                     .text:	section	.text,new
 280  0000               _TIM1_TimeBaseInit:
 282  0000 89            	pushw	x
 283       00000000      OFST:	set	0
 286                     ; 111     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 288                     ; 114     TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 290  0001 7b06          	ld	a,(OFST+6,sp)
 291  0003 c75262        	ld	21090,a
 292                     ; 115     TIM1->ARRL = (uint8_t)(TIM1_Period);
 294  0006 7b07          	ld	a,(OFST+7,sp)
 295  0008 c75263        	ld	21091,a
 296                     ; 118     TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 298  000b 9e            	ld	a,xh
 299  000c c75260        	ld	21088,a
 300                     ; 119     TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 302  000f 9f            	ld	a,xl
 303  0010 c75261        	ld	21089,a
 304                     ; 122     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 304                     ; 123                            | (uint8_t)(TIM1_CounterMode));
 306  0013 c65250        	ld	a,21072
 307  0016 a48f          	and	a,#143
 308  0018 1a05          	or	a,(OFST+5,sp)
 309  001a c75250        	ld	21072,a
 310                     ; 126     TIM1->RCR = TIM1_RepetitionCounter;
 312  001d 7b08          	ld	a,(OFST+8,sp)
 313  001f c75264        	ld	21092,a
 314                     ; 128 }
 317  0022 85            	popw	x
 318  0023 81            	ret	
 601                     ; 149 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 601                     ; 150                   TIM1_OutputState_TypeDef TIM1_OutputState,
 601                     ; 151                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 601                     ; 152                   uint16_t TIM1_Pulse,
 601                     ; 153                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 601                     ; 154                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 601                     ; 155                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 601                     ; 156                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 601                     ; 157 {
 602                     .text:	section	.text,new
 603  0000               _TIM1_OC1Init:
 605  0000 89            	pushw	x
 606  0001 5203          	subw	sp,#3
 607       00000003      OFST:	set	3
 610                     ; 159     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 612                     ; 160     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 614                     ; 161     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 616                     ; 162     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 618                     ; 163     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 620                     ; 164     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 622                     ; 165     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 624                     ; 169     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 624                     ; 170                                | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 626  0003 c6525c        	ld	a,21084
 627  0006 a4f0          	and	a,#240
 628  0008 c7525c        	ld	21084,a
 629                     ; 173   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 629                     ; 174                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 629                     ; 175                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 629                     ; 176                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 631  000b 7b0c          	ld	a,(OFST+9,sp)
 632  000d a408          	and	a,#8
 633  000f 6b03          	ld	(OFST+0,sp),a
 634  0011 7b0b          	ld	a,(OFST+8,sp)
 635  0013 a402          	and	a,#2
 636  0015 1a03          	or	a,(OFST+0,sp)
 637  0017 6b02          	ld	(OFST-1,sp),a
 638  0019 7b08          	ld	a,(OFST+5,sp)
 639  001b a404          	and	a,#4
 640  001d 6b01          	ld	(OFST-2,sp),a
 641  001f 9f            	ld	a,xl
 642  0020 a401          	and	a,#1
 643  0022 1a01          	or	a,(OFST-2,sp)
 644  0024 1a02          	or	a,(OFST-1,sp)
 645  0026 ca525c        	or	a,21084
 646  0029 c7525c        	ld	21084,a
 647                     ; 179     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 647                     ; 180                             (uint8_t)TIM1_OCMode);
 649  002c c65258        	ld	a,21080
 650  002f a48f          	and	a,#143
 651  0031 1a04          	or	a,(OFST+1,sp)
 652  0033 c75258        	ld	21080,a
 653                     ; 183     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 655  0036 c6526f        	ld	a,21103
 656  0039 a4fc          	and	a,#252
 657  003b c7526f        	ld	21103,a
 658                     ; 185     TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 658                     ; 186                             (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 660  003e 7b0e          	ld	a,(OFST+11,sp)
 661  0040 a402          	and	a,#2
 662  0042 6b03          	ld	(OFST+0,sp),a
 663  0044 7b0d          	ld	a,(OFST+10,sp)
 664  0046 a401          	and	a,#1
 665  0048 1a03          	or	a,(OFST+0,sp)
 666  004a ca526f        	or	a,21103
 667  004d c7526f        	ld	21103,a
 668                     ; 189     TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 670  0050 7b09          	ld	a,(OFST+6,sp)
 671  0052 c75265        	ld	21093,a
 672                     ; 190     TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 674  0055 7b0a          	ld	a,(OFST+7,sp)
 675  0057 c75266        	ld	21094,a
 676                     ; 191 }
 679  005a 5b05          	addw	sp,#5
 680  005c 81            	ret	
 782                     ; 212 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 782                     ; 213                   TIM1_OutputState_TypeDef TIM1_OutputState,
 782                     ; 214                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 782                     ; 215                   uint16_t TIM1_Pulse,
 782                     ; 216                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 782                     ; 217                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 782                     ; 218                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 782                     ; 219                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 782                     ; 220 {
 783                     .text:	section	.text,new
 784  0000               _TIM1_OC2Init:
 786  0000 89            	pushw	x
 787  0001 5203          	subw	sp,#3
 788       00000003      OFST:	set	3
 791                     ; 222     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 793                     ; 223     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 795                     ; 224     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 797                     ; 225     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 799                     ; 226     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 801                     ; 227     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 803                     ; 228     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 805                     ; 232     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 805                     ; 233                                 TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 807  0003 c6525c        	ld	a,21084
 808  0006 a40f          	and	a,#15
 809  0008 c7525c        	ld	21084,a
 810                     ; 237     TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 810                     ; 238                              (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 810                     ; 239                              (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 810                     ; 240                              (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 812  000b 7b0c          	ld	a,(OFST+9,sp)
 813  000d a480          	and	a,#128
 814  000f 6b03          	ld	(OFST+0,sp),a
 815  0011 7b0b          	ld	a,(OFST+8,sp)
 816  0013 a420          	and	a,#32
 817  0015 1a03          	or	a,(OFST+0,sp)
 818  0017 6b02          	ld	(OFST-1,sp),a
 819  0019 7b08          	ld	a,(OFST+5,sp)
 820  001b a440          	and	a,#64
 821  001d 6b01          	ld	(OFST-2,sp),a
 822  001f 9f            	ld	a,xl
 823  0020 a410          	and	a,#16
 824  0022 1a01          	or	a,(OFST-2,sp)
 825  0024 1a02          	or	a,(OFST-1,sp)
 826  0026 ca525c        	or	a,21084
 827  0029 c7525c        	ld	21084,a
 828                     ; 243     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 828                     ; 244                              (uint8_t)TIM1_OCMode);
 830  002c c65259        	ld	a,21081
 831  002f a48f          	and	a,#143
 832  0031 1a04          	or	a,(OFST+1,sp)
 833  0033 c75259        	ld	21081,a
 834                     ; 247     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 836  0036 c6526f        	ld	a,21103
 837  0039 a4f3          	and	a,#243
 838  003b c7526f        	ld	21103,a
 839                     ; 249     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 839                     ; 250                             (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 841  003e 7b0e          	ld	a,(OFST+11,sp)
 842  0040 a408          	and	a,#8
 843  0042 6b03          	ld	(OFST+0,sp),a
 844  0044 7b0d          	ld	a,(OFST+10,sp)
 845  0046 a404          	and	a,#4
 846  0048 1a03          	or	a,(OFST+0,sp)
 847  004a ca526f        	or	a,21103
 848  004d c7526f        	ld	21103,a
 849                     ; 253     TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 851  0050 7b09          	ld	a,(OFST+6,sp)
 852  0052 c75267        	ld	21095,a
 853                     ; 254     TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 855  0055 7b0a          	ld	a,(OFST+7,sp)
 856  0057 c75268        	ld	21096,a
 857                     ; 256 }
 860  005a 5b05          	addw	sp,#5
 861  005c 81            	ret	
 963                     ; 277 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 963                     ; 278                   TIM1_OutputState_TypeDef TIM1_OutputState,
 963                     ; 279                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 963                     ; 280                   uint16_t TIM1_Pulse,
 963                     ; 281                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 963                     ; 282                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 963                     ; 283                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 963                     ; 284                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 963                     ; 285 {
 964                     .text:	section	.text,new
 965  0000               _TIM1_OC3Init:
 967  0000 89            	pushw	x
 968  0001 5203          	subw	sp,#3
 969       00000003      OFST:	set	3
 972                     ; 287     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 974                     ; 288     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 976                     ; 289     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 978                     ; 290     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 980                     ; 291     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 982                     ; 292     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 984                     ; 293     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 986                     ; 297     TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 986                     ; 298                                 TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
 988  0003 c6525d        	ld	a,21085
 989  0006 a4f0          	and	a,#240
 990  0008 c7525d        	ld	21085,a
 991                     ; 301     TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
 991                     ; 302                              (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
 991                     ; 303                              (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
 991                     ; 304                              (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
 993  000b 7b0c          	ld	a,(OFST+9,sp)
 994  000d a408          	and	a,#8
 995  000f 6b03          	ld	(OFST+0,sp),a
 996  0011 7b0b          	ld	a,(OFST+8,sp)
 997  0013 a402          	and	a,#2
 998  0015 1a03          	or	a,(OFST+0,sp)
 999  0017 6b02          	ld	(OFST-1,sp),a
1000  0019 7b08          	ld	a,(OFST+5,sp)
1001  001b a404          	and	a,#4
1002  001d 6b01          	ld	(OFST-2,sp),a
1003  001f 9f            	ld	a,xl
1004  0020 a401          	and	a,#1
1005  0022 1a01          	or	a,(OFST-2,sp)
1006  0024 1a02          	or	a,(OFST-1,sp)
1007  0026 ca525d        	or	a,21085
1008  0029 c7525d        	ld	21085,a
1009                     ; 307     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1009                     ; 308                              (uint8_t)TIM1_OCMode);
1011  002c c6525a        	ld	a,21082
1012  002f a48f          	and	a,#143
1013  0031 1a04          	or	a,(OFST+1,sp)
1014  0033 c7525a        	ld	21082,a
1015                     ; 311     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1017  0036 c6526f        	ld	a,21103
1018  0039 a4cf          	and	a,#207
1019  003b c7526f        	ld	21103,a
1020                     ; 313     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1020                     ; 314                             (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1022  003e 7b0e          	ld	a,(OFST+11,sp)
1023  0040 a420          	and	a,#32
1024  0042 6b03          	ld	(OFST+0,sp),a
1025  0044 7b0d          	ld	a,(OFST+10,sp)
1026  0046 a410          	and	a,#16
1027  0048 1a03          	or	a,(OFST+0,sp)
1028  004a ca526f        	or	a,21103
1029  004d c7526f        	ld	21103,a
1030                     ; 317     TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1032  0050 7b09          	ld	a,(OFST+6,sp)
1033  0052 c75269        	ld	21097,a
1034                     ; 318     TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1036  0055 7b0a          	ld	a,(OFST+7,sp)
1037  0057 c7526a        	ld	21098,a
1038                     ; 320 }
1041  005a 5b05          	addw	sp,#5
1042  005c 81            	ret	
1114                     ; 335 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1114                     ; 336                   TIM1_OutputState_TypeDef TIM1_OutputState,
1114                     ; 337                   uint16_t TIM1_Pulse,
1114                     ; 338                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1114                     ; 339                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1114                     ; 340 {
1115                     .text:	section	.text,new
1116  0000               _TIM1_OC4Init:
1118  0000 89            	pushw	x
1119  0001 88            	push	a
1120       00000001      OFST:	set	1
1123                     ; 342     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1125                     ; 343     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1127                     ; 344     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1129                     ; 345     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1131                     ; 348     TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1133  0002 c6525d        	ld	a,21085
1134  0005 a4cf          	and	a,#207
1135  0007 c7525d        	ld	21085,a
1136                     ; 350     TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1136                     ; 351                              (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1138  000a 7b08          	ld	a,(OFST+7,sp)
1139  000c a420          	and	a,#32
1140  000e 6b01          	ld	(OFST+0,sp),a
1141  0010 9f            	ld	a,xl
1142  0011 a410          	and	a,#16
1143  0013 1a01          	or	a,(OFST+0,sp)
1144  0015 ca525d        	or	a,21085
1145  0018 c7525d        	ld	21085,a
1146                     ; 354     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1146                     ; 355                             TIM1_OCMode);
1148  001b c6525b        	ld	a,21083
1149  001e a48f          	and	a,#143
1150  0020 1a02          	or	a,(OFST+1,sp)
1151  0022 c7525b        	ld	21083,a
1152                     ; 358     if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1154  0025 7b09          	ld	a,(OFST+8,sp)
1155  0027 270a          	jreq	L714
1156                     ; 360         TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1158  0029 c6526f        	ld	a,21103
1159  002c aadf          	or	a,#223
1160  002e c7526f        	ld	21103,a
1162  0031 2004          	jra	L124
1163  0033               L714:
1164                     ; 364         TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1166  0033 721d526f      	bres	21103,#6
1167  0037               L124:
1168                     ; 368     TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1170  0037 7b06          	ld	a,(OFST+5,sp)
1171  0039 c7526b        	ld	21099,a
1172                     ; 369     TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1174  003c 7b07          	ld	a,(OFST+6,sp)
1175  003e c7526c        	ld	21100,a
1176                     ; 371 }
1179  0041 5b03          	addw	sp,#3
1180  0043 81            	ret	
1383                     ; 386 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1383                     ; 387                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1383                     ; 388                      uint8_t TIM1_DeadTime,
1383                     ; 389                      TIM1_BreakState_TypeDef TIM1_Break,
1383                     ; 390                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1383                     ; 391                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1383                     ; 392 {
1384                     .text:	section	.text,new
1385  0000               _TIM1_BDTRConfig:
1387  0000 89            	pushw	x
1388  0001 88            	push	a
1389       00000001      OFST:	set	1
1392                     ; 394     assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1394                     ; 395     assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1396                     ; 396     assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1398                     ; 397     assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1400                     ; 398     assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1402                     ; 400     TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1404  0002 7b06          	ld	a,(OFST+5,sp)
1405  0004 c7526e        	ld	21102,a
1406                     ; 404     TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1406                     ; 405                             (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1406                     ; 406                             (uint8_t)TIM1_AutomaticOutput));
1408  0007 7b07          	ld	a,(OFST+6,sp)
1409  0009 1a08          	or	a,(OFST+7,sp)
1410  000b 1a09          	or	a,(OFST+8,sp)
1411  000d 6b01          	ld	(OFST+0,sp),a
1412  000f 9f            	ld	a,xl
1413  0010 1a02          	or	a,(OFST+1,sp)
1414  0012 1a01          	or	a,(OFST+0,sp)
1415  0014 c7526d        	ld	21101,a
1416                     ; 408 }
1419  0017 5b03          	addw	sp,#3
1420  0019 81            	ret	
1620                     ; 422 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1620                     ; 423                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1620                     ; 424                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1620                     ; 425                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1620                     ; 426                  uint8_t TIM1_ICFilter)
1620                     ; 427 {
1621                     .text:	section	.text,new
1622  0000               _TIM1_ICInit:
1624  0000 89            	pushw	x
1625       00000000      OFST:	set	0
1628                     ; 430     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1630                     ; 431     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1632                     ; 432     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1634                     ; 433     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1636                     ; 434     assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1638                     ; 436     if (TIM1_Channel == TIM1_CHANNEL_1)
1640  0001 9e            	ld	a,xh
1641  0002 4d            	tnz	a
1642  0003 2614          	jrne	L546
1643                     ; 439         TI1_Config((uint8_t)TIM1_ICPolarity,
1643                     ; 440                    (uint8_t)TIM1_ICSelection,
1643                     ; 441                    (uint8_t)TIM1_ICFilter);
1645  0005 7b07          	ld	a,(OFST+7,sp)
1646  0007 88            	push	a
1647  0008 7b06          	ld	a,(OFST+6,sp)
1648  000a 97            	ld	xl,a
1649  000b 7b03          	ld	a,(OFST+3,sp)
1650  000d 95            	ld	xh,a
1651  000e cd0000        	call	L3_TI1_Config
1653  0011 84            	pop	a
1654                     ; 443         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1656  0012 7b06          	ld	a,(OFST+6,sp)
1657  0014 cd0000        	call	_TIM1_SetIC1Prescaler
1660  0017 2044          	jra	L746
1661  0019               L546:
1662                     ; 445     else if (TIM1_Channel == TIM1_CHANNEL_2)
1664  0019 7b01          	ld	a,(OFST+1,sp)
1665  001b a101          	cp	a,#1
1666  001d 2614          	jrne	L156
1667                     ; 448         TI2_Config((uint8_t)TIM1_ICPolarity,
1667                     ; 449                    (uint8_t)TIM1_ICSelection,
1667                     ; 450                    (uint8_t)TIM1_ICFilter);
1669  001f 7b07          	ld	a,(OFST+7,sp)
1670  0021 88            	push	a
1671  0022 7b06          	ld	a,(OFST+6,sp)
1672  0024 97            	ld	xl,a
1673  0025 7b03          	ld	a,(OFST+3,sp)
1674  0027 95            	ld	xh,a
1675  0028 cd0000        	call	L5_TI2_Config
1677  002b 84            	pop	a
1678                     ; 452         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1680  002c 7b06          	ld	a,(OFST+6,sp)
1681  002e cd0000        	call	_TIM1_SetIC2Prescaler
1684  0031 202a          	jra	L746
1685  0033               L156:
1686                     ; 454     else if (TIM1_Channel == TIM1_CHANNEL_3)
1688  0033 a102          	cp	a,#2
1689  0035 2614          	jrne	L556
1690                     ; 457         TI3_Config((uint8_t)TIM1_ICPolarity,
1690                     ; 458                    (uint8_t)TIM1_ICSelection,
1690                     ; 459                    (uint8_t)TIM1_ICFilter);
1692  0037 7b07          	ld	a,(OFST+7,sp)
1693  0039 88            	push	a
1694  003a 7b06          	ld	a,(OFST+6,sp)
1695  003c 97            	ld	xl,a
1696  003d 7b03          	ld	a,(OFST+3,sp)
1697  003f 95            	ld	xh,a
1698  0040 cd0000        	call	L7_TI3_Config
1700  0043 84            	pop	a
1701                     ; 461         TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1703  0044 7b06          	ld	a,(OFST+6,sp)
1704  0046 cd0000        	call	_TIM1_SetIC3Prescaler
1707  0049 2012          	jra	L746
1708  004b               L556:
1709                     ; 466         TI4_Config((uint8_t)TIM1_ICPolarity,
1709                     ; 467                    (uint8_t)TIM1_ICSelection,
1709                     ; 468                    (uint8_t)TIM1_ICFilter);
1711  004b 7b07          	ld	a,(OFST+7,sp)
1712  004d 88            	push	a
1713  004e 7b06          	ld	a,(OFST+6,sp)
1714  0050 97            	ld	xl,a
1715  0051 7b03          	ld	a,(OFST+3,sp)
1716  0053 95            	ld	xh,a
1717  0054 cd0000        	call	L11_TI4_Config
1719  0057 84            	pop	a
1720                     ; 470         TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1722  0058 7b06          	ld	a,(OFST+6,sp)
1723  005a cd0000        	call	_TIM1_SetIC4Prescaler
1725  005d               L746:
1726                     ; 473 }
1729  005d 85            	popw	x
1730  005e 81            	ret	
1820                     ; 489 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1820                     ; 490                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1820                     ; 491                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1820                     ; 492                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1820                     ; 493                      uint8_t TIM1_ICFilter)
1820                     ; 494 {
1821                     .text:	section	.text,new
1822  0000               _TIM1_PWMIConfig:
1824  0000 89            	pushw	x
1825  0001 89            	pushw	x
1826       00000002      OFST:	set	2
1829                     ; 495     uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1831                     ; 496     uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1833                     ; 499     assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1835                     ; 500     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1837                     ; 501     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1839                     ; 502     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1841                     ; 505     if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1843  0002 9f            	ld	a,xl
1844  0003 4a            	dec	a
1845  0004 2702          	jreq	L127
1846                     ; 507         icpolarity = TIM1_ICPOLARITY_FALLING;
1848  0006 a601          	ld	a,#1
1850  0008               L127:
1851                     ; 511         icpolarity = TIM1_ICPOLARITY_RISING;
1853  0008 6b01          	ld	(OFST-1,sp),a
1854                     ; 515     if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1856  000a 7b07          	ld	a,(OFST+5,sp)
1857  000c 4a            	dec	a
1858  000d 2604          	jrne	L527
1859                     ; 517         icselection = TIM1_ICSELECTION_INDIRECTTI;
1861  000f a602          	ld	a,#2
1863  0011 2002          	jra	L727
1864  0013               L527:
1865                     ; 521         icselection = TIM1_ICSELECTION_DIRECTTI;
1867  0013 a601          	ld	a,#1
1868  0015               L727:
1869  0015 6b02          	ld	(OFST+0,sp),a
1870                     ; 524     if (TIM1_Channel == TIM1_CHANNEL_1)
1872  0017 7b03          	ld	a,(OFST+1,sp)
1873  0019 2626          	jrne	L137
1874                     ; 527         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1874                     ; 528                    (uint8_t)TIM1_ICFilter);
1876  001b 7b09          	ld	a,(OFST+7,sp)
1877  001d 88            	push	a
1878  001e 7b08          	ld	a,(OFST+6,sp)
1879  0020 97            	ld	xl,a
1880  0021 7b05          	ld	a,(OFST+3,sp)
1881  0023 95            	ld	xh,a
1882  0024 cd0000        	call	L3_TI1_Config
1884  0027 84            	pop	a
1885                     ; 531         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1887  0028 7b08          	ld	a,(OFST+6,sp)
1888  002a cd0000        	call	_TIM1_SetIC1Prescaler
1890                     ; 534         TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1892  002d 7b09          	ld	a,(OFST+7,sp)
1893  002f 88            	push	a
1894  0030 7b03          	ld	a,(OFST+1,sp)
1895  0032 97            	ld	xl,a
1896  0033 7b02          	ld	a,(OFST+0,sp)
1897  0035 95            	ld	xh,a
1898  0036 cd0000        	call	L5_TI2_Config
1900  0039 84            	pop	a
1901                     ; 537         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1903  003a 7b08          	ld	a,(OFST+6,sp)
1904  003c cd0000        	call	_TIM1_SetIC2Prescaler
1907  003f 2024          	jra	L337
1908  0041               L137:
1909                     ; 542         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1909                     ; 543                    (uint8_t)TIM1_ICFilter);
1911  0041 7b09          	ld	a,(OFST+7,sp)
1912  0043 88            	push	a
1913  0044 7b08          	ld	a,(OFST+6,sp)
1914  0046 97            	ld	xl,a
1915  0047 7b05          	ld	a,(OFST+3,sp)
1916  0049 95            	ld	xh,a
1917  004a cd0000        	call	L5_TI2_Config
1919  004d 84            	pop	a
1920                     ; 546         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1922  004e 7b08          	ld	a,(OFST+6,sp)
1923  0050 cd0000        	call	_TIM1_SetIC2Prescaler
1925                     ; 549         TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1927  0053 7b09          	ld	a,(OFST+7,sp)
1928  0055 88            	push	a
1929  0056 7b03          	ld	a,(OFST+1,sp)
1930  0058 97            	ld	xl,a
1931  0059 7b02          	ld	a,(OFST+0,sp)
1932  005b 95            	ld	xh,a
1933  005c cd0000        	call	L3_TI1_Config
1935  005f 84            	pop	a
1936                     ; 552         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1938  0060 7b08          	ld	a,(OFST+6,sp)
1939  0062 cd0000        	call	_TIM1_SetIC1Prescaler
1941  0065               L337:
1942                     ; 554 }
1945  0065 5b04          	addw	sp,#4
1946  0067 81            	ret	
2001                     ; 562 void TIM1_Cmd(FunctionalState NewState)
2001                     ; 563 {
2002                     .text:	section	.text,new
2003  0000               _TIM1_Cmd:
2007                     ; 565     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2009                     ; 568     if (NewState != DISABLE)
2011  0000 4d            	tnz	a
2012  0001 2705          	jreq	L367
2013                     ; 570         TIM1->CR1 |= TIM1_CR1_CEN;
2015  0003 72105250      	bset	21072,#0
2018  0007 81            	ret	
2019  0008               L367:
2020                     ; 574         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2022  0008 72115250      	bres	21072,#0
2023                     ; 576 }
2026  000c 81            	ret	
2062                     ; 584 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2062                     ; 585 {
2063                     .text:	section	.text,new
2064  0000               _TIM1_CtrlPWMOutputs:
2068                     ; 587     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2070                     ; 591     if (NewState != DISABLE)
2072  0000 4d            	tnz	a
2073  0001 2705          	jreq	L5001
2074                     ; 593         TIM1->BKR |= TIM1_BKR_MOE;
2076  0003 721e526d      	bset	21101,#7
2079  0007 81            	ret	
2080  0008               L5001:
2081                     ; 597         TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2083  0008 721f526d      	bres	21101,#7
2084                     ; 599 }
2087  000c 81            	ret	
2194                     ; 618 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2194                     ; 619 {
2195                     .text:	section	.text,new
2196  0000               _TIM1_ITConfig:
2198  0000 89            	pushw	x
2199       00000000      OFST:	set	0
2202                     ; 621     assert_param(IS_TIM1_IT_OK(TIM1_IT));
2204                     ; 622     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2206                     ; 624     if (NewState != DISABLE)
2208  0001 9f            	ld	a,xl
2209  0002 4d            	tnz	a
2210  0003 2706          	jreq	L7501
2211                     ; 627         TIM1->IER |= (uint8_t)TIM1_IT;
2213  0005 9e            	ld	a,xh
2214  0006 ca5254        	or	a,21076
2216  0009 2006          	jra	L1601
2217  000b               L7501:
2218                     ; 632         TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2220  000b 7b01          	ld	a,(OFST+1,sp)
2221  000d 43            	cpl	a
2222  000e c45254        	and	a,21076
2223  0011               L1601:
2224  0011 c75254        	ld	21076,a
2225                     ; 634 }
2228  0014 85            	popw	x
2229  0015 81            	ret	
2253                     ; 641 void TIM1_InternalClockConfig(void)
2253                     ; 642 {
2254                     .text:	section	.text,new
2255  0000               _TIM1_InternalClockConfig:
2259                     ; 644     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2261  0000 c65252        	ld	a,21074
2262  0003 a4f8          	and	a,#248
2263  0005 c75252        	ld	21074,a
2264                     ; 645 }
2267  0008 81            	ret	
2382                     ; 663 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2382                     ; 664                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2382                     ; 665                               uint8_t ExtTRGFilter)
2382                     ; 666 {
2383                     .text:	section	.text,new
2384  0000               _TIM1_ETRClockMode1Config:
2386  0000 89            	pushw	x
2387       00000000      OFST:	set	0
2390                     ; 668     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2392                     ; 669     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2394                     ; 672     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2396  0001 7b05          	ld	a,(OFST+5,sp)
2397  0003 88            	push	a
2398  0004 7b02          	ld	a,(OFST+2,sp)
2399  0006 95            	ld	xh,a
2400  0007 cd0000        	call	_TIM1_ETRConfig
2402  000a 84            	pop	a
2403                     ; 675     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2403                     ; 676                            | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2405  000b c65252        	ld	a,21074
2406  000e aa77          	or	a,#119
2407  0010 c75252        	ld	21074,a
2408                     ; 677 }
2411  0013 85            	popw	x
2412  0014 81            	ret	
2468                     ; 695 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2468                     ; 696                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2468                     ; 697                               uint8_t ExtTRGFilter)
2468                     ; 698 {
2469                     .text:	section	.text,new
2470  0000               _TIM1_ETRClockMode2Config:
2472  0000 89            	pushw	x
2473       00000000      OFST:	set	0
2476                     ; 700     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2478                     ; 701     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2480                     ; 704     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2482  0001 7b05          	ld	a,(OFST+5,sp)
2483  0003 88            	push	a
2484  0004 7b02          	ld	a,(OFST+2,sp)
2485  0006 95            	ld	xh,a
2486  0007 cd0000        	call	_TIM1_ETRConfig
2488  000a 721c5253      	bset	21075,#6
2489  000e 84            	pop	a
2490                     ; 707     TIM1->ETR |= TIM1_ETR_ECE;
2492                     ; 708 }
2495  000f 85            	popw	x
2496  0010 81            	ret	
2550                     ; 726 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2550                     ; 727                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2550                     ; 728                     uint8_t ExtTRGFilter)
2550                     ; 729 {
2551                     .text:	section	.text,new
2552  0000               _TIM1_ETRConfig:
2554  0000 89            	pushw	x
2555       00000000      OFST:	set	0
2558                     ; 731     assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2560                     ; 733     TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2560                     ; 734                       (uint8_t)ExtTRGFilter );
2562  0001 9f            	ld	a,xl
2563  0002 1a01          	or	a,(OFST+1,sp)
2564  0004 1a05          	or	a,(OFST+5,sp)
2565  0006 ca5253        	or	a,21075
2566  0009 c75253        	ld	21075,a
2567                     ; 735 }
2570  000c 85            	popw	x
2571  000d 81            	ret	
2658                     ; 752 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2658                     ; 753                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2658                     ; 754                                  uint8_t ICFilter)
2658                     ; 755 {
2659                     .text:	section	.text,new
2660  0000               _TIM1_TIxExternalClockConfig:
2662  0000 89            	pushw	x
2663       00000000      OFST:	set	0
2666                     ; 757     assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2668                     ; 758     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2670                     ; 759     assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2672                     ; 762     if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2674  0001 9e            	ld	a,xh
2675  0002 a160          	cp	a,#96
2676  0004 260e          	jrne	L1521
2677                     ; 764         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2679  0006 7b05          	ld	a,(OFST+5,sp)
2680  0008 88            	push	a
2681  0009 ae0001        	ldw	x,#1
2682  000c 7b03          	ld	a,(OFST+3,sp)
2683  000e 95            	ld	xh,a
2684  000f cd0000        	call	L5_TI2_Config
2687  0012 200c          	jra	L3521
2688  0014               L1521:
2689                     ; 768         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2691  0014 7b05          	ld	a,(OFST+5,sp)
2692  0016 88            	push	a
2693  0017 ae0001        	ldw	x,#1
2694  001a 7b03          	ld	a,(OFST+3,sp)
2695  001c 95            	ld	xh,a
2696  001d cd0000        	call	L3_TI1_Config
2698  0020               L3521:
2699  0020 84            	pop	a
2700                     ; 772     TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2702  0021 7b01          	ld	a,(OFST+1,sp)
2703  0023 cd0000        	call	_TIM1_SelectInputTrigger
2705                     ; 775     TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2707  0026 c65252        	ld	a,21074
2708  0029 aa07          	or	a,#7
2709  002b c75252        	ld	21074,a
2710                     ; 776 }
2713  002e 85            	popw	x
2714  002f 81            	ret	
2799                     ; 788 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2799                     ; 789 {
2800                     .text:	section	.text,new
2801  0000               _TIM1_SelectInputTrigger:
2803  0000 88            	push	a
2804       00000000      OFST:	set	0
2807                     ; 791     assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2809                     ; 794     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2811  0001 c65252        	ld	a,21074
2812  0004 a48f          	and	a,#143
2813  0006 1a01          	or	a,(OFST+1,sp)
2814  0008 c75252        	ld	21074,a
2815                     ; 795 }
2818  000b 84            	pop	a
2819  000c 81            	ret	
2855                     ; 805 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2855                     ; 806 {
2856                     .text:	section	.text,new
2857  0000               _TIM1_UpdateDisableConfig:
2861                     ; 808     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2863                     ; 811     if (NewState != DISABLE)
2865  0000 4d            	tnz	a
2866  0001 2705          	jreq	L1331
2867                     ; 813         TIM1->CR1 |= TIM1_CR1_UDIS;
2869  0003 72125250      	bset	21072,#1
2872  0007 81            	ret	
2873  0008               L1331:
2874                     ; 817         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2876  0008 72135250      	bres	21072,#1
2877                     ; 819 }
2880  000c 81            	ret	
2938                     ; 829 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2938                     ; 830 {
2939                     .text:	section	.text,new
2940  0000               _TIM1_UpdateRequestConfig:
2944                     ; 832     assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
2946                     ; 835     if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
2948  0000 4d            	tnz	a
2949  0001 2705          	jreq	L3631
2950                     ; 837         TIM1->CR1 |= TIM1_CR1_URS;
2952  0003 72145250      	bset	21072,#2
2955  0007 81            	ret	
2956  0008               L3631:
2957                     ; 841         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
2959  0008 72155250      	bres	21072,#2
2960                     ; 843 }
2963  000c 81            	ret	
2999                     ; 852 void TIM1_SelectHallSensor(FunctionalState NewState)
2999                     ; 853 {
3000                     .text:	section	.text,new
3001  0000               _TIM1_SelectHallSensor:
3005                     ; 855     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3007                     ; 858     if (NewState != DISABLE)
3009  0000 4d            	tnz	a
3010  0001 2705          	jreq	L5041
3011                     ; 860         TIM1->CR2 |= TIM1_CR2_TI1S;
3013  0003 721e5251      	bset	21073,#7
3016  0007 81            	ret	
3017  0008               L5041:
3018                     ; 864         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3020  0008 721f5251      	bres	21073,#7
3021                     ; 866 }
3024  000c 81            	ret	
3081                     ; 877 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3081                     ; 878 {
3082                     .text:	section	.text,new
3083  0000               _TIM1_SelectOnePulseMode:
3087                     ; 880     assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3089                     ; 883     if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3091  0000 4d            	tnz	a
3092  0001 2705          	jreq	L7341
3093                     ; 885         TIM1->CR1 |= TIM1_CR1_OPM;
3095  0003 72165250      	bset	21072,#3
3098  0007 81            	ret	
3099  0008               L7341:
3100                     ; 889         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3102  0008 72175250      	bres	21072,#3
3103                     ; 892 }
3106  000c 81            	ret	
3204                     ; 908 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3204                     ; 909 {
3205                     .text:	section	.text,new
3206  0000               _TIM1_SelectOutputTrigger:
3208  0000 88            	push	a
3209       00000000      OFST:	set	0
3212                     ; 911     assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3214                     ; 914     TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3214                     ; 915                           (uint8_t) TIM1_TRGOSource);
3216  0001 c65251        	ld	a,21073
3217  0004 a48f          	and	a,#143
3218  0006 1a01          	or	a,(OFST+1,sp)
3219  0008 c75251        	ld	21073,a
3220                     ; 916 }
3223  000b 84            	pop	a
3224  000c 81            	ret	
3298                     ; 928 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3298                     ; 929 {
3299                     .text:	section	.text,new
3300  0000               _TIM1_SelectSlaveMode:
3302  0000 88            	push	a
3303       00000000      OFST:	set	0
3306                     ; 932     assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3308                     ; 935     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3308                     ; 936                            (uint8_t)TIM1_SlaveMode);
3310  0001 c65252        	ld	a,21074
3311  0004 a4f8          	and	a,#248
3312  0006 1a01          	or	a,(OFST+1,sp)
3313  0008 c75252        	ld	21074,a
3314                     ; 938 }
3317  000b 84            	pop	a
3318  000c 81            	ret	
3354                     ; 946 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3354                     ; 947 {
3355                     .text:	section	.text,new
3356  0000               _TIM1_SelectMasterSlaveMode:
3360                     ; 949     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3362                     ; 952     if (NewState != DISABLE)
3364  0000 4d            	tnz	a
3365  0001 2705          	jreq	L3551
3366                     ; 954         TIM1->SMCR |= TIM1_SMCR_MSM;
3368  0003 721e5252      	bset	21074,#7
3371  0007 81            	ret	
3372  0008               L3551:
3373                     ; 958         TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3375  0008 721f5252      	bres	21074,#7
3376                     ; 960 }
3379  000c 81            	ret	
3465                     ; 982 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3465                     ; 983                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3465                     ; 984                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3465                     ; 985 {
3466                     .text:	section	.text,new
3467  0000               _TIM1_EncoderInterfaceConfig:
3469  0000 89            	pushw	x
3470       00000000      OFST:	set	0
3473                     ; 989     assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3475                     ; 990     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3477                     ; 991     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3479                     ; 994     if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3481  0001 9f            	ld	a,xl
3482  0002 4d            	tnz	a
3483  0003 2706          	jreq	L7161
3484                     ; 996         TIM1->CCER1 |= TIM1_CCER1_CC1P;
3486  0005 7212525c      	bset	21084,#1
3488  0009 2004          	jra	L1261
3489  000b               L7161:
3490                     ; 1000         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3492  000b 7213525c      	bres	21084,#1
3493  000f               L1261:
3494                     ; 1003     if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3496  000f 7b05          	ld	a,(OFST+5,sp)
3497  0011 2706          	jreq	L3261
3498                     ; 1005         TIM1->CCER1 |= TIM1_CCER1_CC2P;
3500  0013 721a525c      	bset	21084,#5
3502  0017 2004          	jra	L5261
3503  0019               L3261:
3504                     ; 1009         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3506  0019 721b525c      	bres	21084,#5
3507  001d               L5261:
3508                     ; 1012     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3508                     ; 1013                            | (uint8_t) TIM1_EncoderMode);
3510  001d c65252        	ld	a,21074
3511  0020 a4f0          	and	a,#240
3512  0022 1a01          	or	a,(OFST+1,sp)
3513  0024 c75252        	ld	21074,a
3514                     ; 1016     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3514                     ; 1017                             | (uint8_t) CCMR_TIxDirect_Set);
3516  0027 c65258        	ld	a,21080
3517  002a a4fc          	and	a,#252
3518  002c aa01          	or	a,#1
3519  002e c75258        	ld	21080,a
3520                     ; 1018     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3520                     ; 1019                             | (uint8_t) CCMR_TIxDirect_Set);
3522  0031 c65259        	ld	a,21081
3523  0034 a4fc          	and	a,#252
3524  0036 aa01          	or	a,#1
3525  0038 c75259        	ld	21081,a
3526                     ; 1021 }
3529  003b 85            	popw	x
3530  003c 81            	ret	
3595                     ; 1034 void TIM1_PrescalerConfig(uint16_t Prescaler,
3595                     ; 1035                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3595                     ; 1036 {
3596                     .text:	section	.text,new
3597  0000               _TIM1_PrescalerConfig:
3599  0000 89            	pushw	x
3600       00000000      OFST:	set	0
3603                     ; 1038     assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3605                     ; 1041     TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3607  0001 9e            	ld	a,xh
3608  0002 c75260        	ld	21088,a
3609                     ; 1042     TIM1->PSCRL = (uint8_t)(Prescaler);
3611  0005 9f            	ld	a,xl
3612  0006 c75261        	ld	21089,a
3613                     ; 1045     TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3615  0009 7b05          	ld	a,(OFST+5,sp)
3616  000b c75257        	ld	21079,a
3617                     ; 1047 }
3620  000e 85            	popw	x
3621  000f 81            	ret	
3657                     ; 1060 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3657                     ; 1061 {
3658                     .text:	section	.text,new
3659  0000               _TIM1_CounterModeConfig:
3661  0000 88            	push	a
3662       00000000      OFST:	set	0
3665                     ; 1063     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3667                     ; 1067     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3667                     ; 1068                           | (uint8_t)TIM1_CounterMode);
3669  0001 c65250        	ld	a,21072
3670  0004 a48f          	and	a,#143
3671  0006 1a01          	or	a,(OFST+1,sp)
3672  0008 c75250        	ld	21072,a
3673                     ; 1069 }
3676  000b 84            	pop	a
3677  000c 81            	ret	
3735                     ; 1080 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3735                     ; 1081 {
3736                     .text:	section	.text,new
3737  0000               _TIM1_ForcedOC1Config:
3739  0000 88            	push	a
3740       00000000      OFST:	set	0
3743                     ; 1083     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3745                     ; 1086     TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3745                     ; 1087                              (uint8_t)TIM1_ForcedAction);
3747  0001 c65258        	ld	a,21080
3748  0004 a48f          	and	a,#143
3749  0006 1a01          	or	a,(OFST+1,sp)
3750  0008 c75258        	ld	21080,a
3751                     ; 1088 }
3754  000b 84            	pop	a
3755  000c 81            	ret	
3791                     ; 1099 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3791                     ; 1100 {
3792                     .text:	section	.text,new
3793  0000               _TIM1_ForcedOC2Config:
3795  0000 88            	push	a
3796       00000000      OFST:	set	0
3799                     ; 1102     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3801                     ; 1105     TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3801                     ; 1106                               | (uint8_t)TIM1_ForcedAction);
3803  0001 c65259        	ld	a,21081
3804  0004 a48f          	and	a,#143
3805  0006 1a01          	or	a,(OFST+1,sp)
3806  0008 c75259        	ld	21081,a
3807                     ; 1107 }
3810  000b 84            	pop	a
3811  000c 81            	ret	
3847                     ; 1119 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3847                     ; 1120 {
3848                     .text:	section	.text,new
3849  0000               _TIM1_ForcedOC3Config:
3851  0000 88            	push	a
3852       00000000      OFST:	set	0
3855                     ; 1122     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3857                     ; 1125     TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3857                     ; 1126                               | (uint8_t)TIM1_ForcedAction);
3859  0001 c6525a        	ld	a,21082
3860  0004 a48f          	and	a,#143
3861  0006 1a01          	or	a,(OFST+1,sp)
3862  0008 c7525a        	ld	21082,a
3863                     ; 1127 }
3866  000b 84            	pop	a
3867  000c 81            	ret	
3903                     ; 1139 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3903                     ; 1140 {
3904                     .text:	section	.text,new
3905  0000               _TIM1_ForcedOC4Config:
3907  0000 88            	push	a
3908       00000000      OFST:	set	0
3911                     ; 1142     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3913                     ; 1145     TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3913                     ; 1146                               | (uint8_t)TIM1_ForcedAction);
3915  0001 c6525b        	ld	a,21083
3916  0004 a48f          	and	a,#143
3917  0006 1a01          	or	a,(OFST+1,sp)
3918  0008 c7525b        	ld	21083,a
3919                     ; 1147 }
3922  000b 84            	pop	a
3923  000c 81            	ret	
3959                     ; 1156 void TIM1_ARRPreloadConfig(FunctionalState NewState)
3959                     ; 1157 {
3960                     .text:	section	.text,new
3961  0000               _TIM1_ARRPreloadConfig:
3965                     ; 1159     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3967                     ; 1162     if (NewState != DISABLE)
3969  0000 4d            	tnz	a
3970  0001 2705          	jreq	L3102
3971                     ; 1164         TIM1->CR1 |= TIM1_CR1_ARPE;
3973  0003 721e5250      	bset	21072,#7
3976  0007 81            	ret	
3977  0008               L3102:
3978                     ; 1168         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
3980  0008 721f5250      	bres	21072,#7
3981                     ; 1170 }
3984  000c 81            	ret	
4019                     ; 1179 void TIM1_SelectCOM(FunctionalState NewState)
4019                     ; 1180 {
4020                     .text:	section	.text,new
4021  0000               _TIM1_SelectCOM:
4025                     ; 1182     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4027                     ; 1185     if (NewState != DISABLE)
4029  0000 4d            	tnz	a
4030  0001 2705          	jreq	L5302
4031                     ; 1187         TIM1->CR2 |= TIM1_CR2_COMS;
4033  0003 72145251      	bset	21073,#2
4036  0007 81            	ret	
4037  0008               L5302:
4038                     ; 1191         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4040  0008 72155251      	bres	21073,#2
4041                     ; 1193 }
4044  000c 81            	ret	
4080                     ; 1201 void TIM1_CCPreloadControl(FunctionalState NewState)
4080                     ; 1202 {
4081                     .text:	section	.text,new
4082  0000               _TIM1_CCPreloadControl:
4086                     ; 1204     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4088                     ; 1207     if (NewState != DISABLE)
4090  0000 4d            	tnz	a
4091  0001 2705          	jreq	L7502
4092                     ; 1209         TIM1->CR2 |= TIM1_CR2_CCPC;
4094  0003 72105251      	bset	21073,#0
4097  0007 81            	ret	
4098  0008               L7502:
4099                     ; 1213         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4101  0008 72115251      	bres	21073,#0
4102                     ; 1215 }
4105  000c 81            	ret	
4141                     ; 1224 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4141                     ; 1225 {
4142                     .text:	section	.text,new
4143  0000               _TIM1_OC1PreloadConfig:
4147                     ; 1227     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4149                     ; 1230     if (NewState != DISABLE)
4151  0000 4d            	tnz	a
4152  0001 2705          	jreq	L1012
4153                     ; 1232         TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4155  0003 72165258      	bset	21080,#3
4158  0007 81            	ret	
4159  0008               L1012:
4160                     ; 1236         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4162  0008 72175258      	bres	21080,#3
4163                     ; 1238 }
4166  000c 81            	ret	
4202                     ; 1247 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4202                     ; 1248 {
4203                     .text:	section	.text,new
4204  0000               _TIM1_OC2PreloadConfig:
4208                     ; 1250     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4210                     ; 1253     if (NewState != DISABLE)
4212  0000 4d            	tnz	a
4213  0001 2705          	jreq	L3212
4214                     ; 1255         TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4216  0003 72165259      	bset	21081,#3
4219  0007 81            	ret	
4220  0008               L3212:
4221                     ; 1259         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4223  0008 72175259      	bres	21081,#3
4224                     ; 1261 }
4227  000c 81            	ret	
4263                     ; 1270 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4263                     ; 1271 {
4264                     .text:	section	.text,new
4265  0000               _TIM1_OC3PreloadConfig:
4269                     ; 1273     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4271                     ; 1276     if (NewState != DISABLE)
4273  0000 4d            	tnz	a
4274  0001 2705          	jreq	L5412
4275                     ; 1278         TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4277  0003 7216525a      	bset	21082,#3
4280  0007 81            	ret	
4281  0008               L5412:
4282                     ; 1282         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4284  0008 7217525a      	bres	21082,#3
4285                     ; 1284 }
4288  000c 81            	ret	
4324                     ; 1294 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4324                     ; 1295 {
4325                     .text:	section	.text,new
4326  0000               _TIM1_OC4PreloadConfig:
4330                     ; 1297     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4332                     ; 1300     if (NewState != DISABLE)
4334  0000 4d            	tnz	a
4335  0001 2705          	jreq	L7612
4336                     ; 1302         TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4338  0003 7216525b      	bset	21083,#3
4341  0007 81            	ret	
4342  0008               L7612:
4343                     ; 1306         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4345  0008 7217525b      	bres	21083,#3
4346                     ; 1308 }
4349  000c 81            	ret	
4384                     ; 1316 void TIM1_OC1FastConfig(FunctionalState NewState)
4384                     ; 1317 {
4385                     .text:	section	.text,new
4386  0000               _TIM1_OC1FastConfig:
4390                     ; 1319     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4392                     ; 1322     if (NewState != DISABLE)
4394  0000 4d            	tnz	a
4395  0001 2705          	jreq	L1122
4396                     ; 1324         TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4398  0003 72145258      	bset	21080,#2
4401  0007 81            	ret	
4402  0008               L1122:
4403                     ; 1328         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4405  0008 72155258      	bres	21080,#2
4406                     ; 1330 }
4409  000c 81            	ret	
4444                     ; 1340 void TIM1_OC2FastConfig(FunctionalState NewState)
4444                     ; 1341 {
4445                     .text:	section	.text,new
4446  0000               _TIM1_OC2FastConfig:
4450                     ; 1343     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4452                     ; 1346     if (NewState != DISABLE)
4454  0000 4d            	tnz	a
4455  0001 2705          	jreq	L3322
4456                     ; 1348         TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4458  0003 72145259      	bset	21081,#2
4461  0007 81            	ret	
4462  0008               L3322:
4463                     ; 1352         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4465  0008 72155259      	bres	21081,#2
4466                     ; 1354 }
4469  000c 81            	ret	
4504                     ; 1363 void TIM1_OC3FastConfig(FunctionalState NewState)
4504                     ; 1364 {
4505                     .text:	section	.text,new
4506  0000               _TIM1_OC3FastConfig:
4510                     ; 1366     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4512                     ; 1369     if (NewState != DISABLE)
4514  0000 4d            	tnz	a
4515  0001 2705          	jreq	L5522
4516                     ; 1371         TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4518  0003 7214525a      	bset	21082,#2
4521  0007 81            	ret	
4522  0008               L5522:
4523                     ; 1375         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4525  0008 7215525a      	bres	21082,#2
4526                     ; 1377 }
4529  000c 81            	ret	
4564                     ; 1386 void TIM1_OC4FastConfig(FunctionalState NewState)
4564                     ; 1387 {
4565                     .text:	section	.text,new
4566  0000               _TIM1_OC4FastConfig:
4570                     ; 1389     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4572                     ; 1392     if (NewState != DISABLE)
4574  0000 4d            	tnz	a
4575  0001 2705          	jreq	L7722
4576                     ; 1394         TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4578  0003 7214525b      	bset	21083,#2
4581  0007 81            	ret	
4582  0008               L7722:
4583                     ; 1398         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4585  0008 7215525b      	bres	21083,#2
4586                     ; 1400 }
4589  000c 81            	ret	
4694                     ; 1417 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4694                     ; 1418 {
4695                     .text:	section	.text,new
4696  0000               _TIM1_GenerateEvent:
4700                     ; 1420     assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4702                     ; 1423     TIM1->EGR = (uint8_t)TIM1_EventSource;
4704  0000 c75257        	ld	21079,a
4705                     ; 1424 }
4708  0003 81            	ret	
4744                     ; 1435 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4744                     ; 1436 {
4745                     .text:	section	.text,new
4746  0000               _TIM1_OC1PolarityConfig:
4750                     ; 1438     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4752                     ; 1441     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4754  0000 4d            	tnz	a
4755  0001 2705          	jreq	L3632
4756                     ; 1443         TIM1->CCER1 |= TIM1_CCER1_CC1P;
4758  0003 7212525c      	bset	21084,#1
4761  0007 81            	ret	
4762  0008               L3632:
4763                     ; 1447         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4765  0008 7213525c      	bres	21084,#1
4766                     ; 1449 }
4769  000c 81            	ret	
4805                     ; 1460 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4805                     ; 1461 {
4806                     .text:	section	.text,new
4807  0000               _TIM1_OC1NPolarityConfig:
4811                     ; 1463     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4813                     ; 1466     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4815  0000 4d            	tnz	a
4816  0001 2705          	jreq	L5042
4817                     ; 1468         TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4819  0003 7216525c      	bset	21084,#3
4822  0007 81            	ret	
4823  0008               L5042:
4824                     ; 1472         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4826  0008 7217525c      	bres	21084,#3
4827                     ; 1474 }
4830  000c 81            	ret	
4866                     ; 1485 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4866                     ; 1486 {
4867                     .text:	section	.text,new
4868  0000               _TIM1_OC2PolarityConfig:
4872                     ; 1488     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4874                     ; 1491     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4876  0000 4d            	tnz	a
4877  0001 2705          	jreq	L7242
4878                     ; 1493         TIM1->CCER1 |= TIM1_CCER1_CC2P;
4880  0003 721a525c      	bset	21084,#5
4883  0007 81            	ret	
4884  0008               L7242:
4885                     ; 1497         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4887  0008 721b525c      	bres	21084,#5
4888                     ; 1499 }
4891  000c 81            	ret	
4927                     ; 1509 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4927                     ; 1510 {
4928                     .text:	section	.text,new
4929  0000               _TIM1_OC2NPolarityConfig:
4933                     ; 1512     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4935                     ; 1515     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4937  0000 4d            	tnz	a
4938  0001 2705          	jreq	L1542
4939                     ; 1517         TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4941  0003 721e525c      	bset	21084,#7
4944  0007 81            	ret	
4945  0008               L1542:
4946                     ; 1521         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
4948  0008 721f525c      	bres	21084,#7
4949                     ; 1523 }
4952  000c 81            	ret	
4988                     ; 1534 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4988                     ; 1535 {
4989                     .text:	section	.text,new
4990  0000               _TIM1_OC3PolarityConfig:
4994                     ; 1537     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4996                     ; 1540     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4998  0000 4d            	tnz	a
4999  0001 2705          	jreq	L3742
5000                     ; 1542         TIM1->CCER2 |= TIM1_CCER2_CC3P;
5002  0003 7212525d      	bset	21085,#1
5005  0007 81            	ret	
5006  0008               L3742:
5007                     ; 1546         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5009  0008 7213525d      	bres	21085,#1
5010                     ; 1548 }
5013  000c 81            	ret	
5049                     ; 1559 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5049                     ; 1560 {
5050                     .text:	section	.text,new
5051  0000               _TIM1_OC3NPolarityConfig:
5055                     ; 1562     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5057                     ; 1565     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5059  0000 4d            	tnz	a
5060  0001 2705          	jreq	L5152
5061                     ; 1567         TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5063  0003 7216525d      	bset	21085,#3
5066  0007 81            	ret	
5067  0008               L5152:
5068                     ; 1571         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5070  0008 7217525d      	bres	21085,#3
5071                     ; 1573 }
5074  000c 81            	ret	
5110                     ; 1583 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5110                     ; 1584 {
5111                     .text:	section	.text,new
5112  0000               _TIM1_OC4PolarityConfig:
5116                     ; 1586     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5118                     ; 1589     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5120  0000 4d            	tnz	a
5121  0001 2705          	jreq	L7352
5122                     ; 1591         TIM1->CCER2 |= TIM1_CCER2_CC4P;
5124  0003 721a525d      	bset	21085,#5
5127  0007 81            	ret	
5128  0008               L7352:
5129                     ; 1595         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5131  0008 721b525d      	bres	21085,#5
5132                     ; 1597 }
5135  000c 81            	ret	
5180                     ; 1612 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5180                     ; 1613 {
5181                     .text:	section	.text,new
5182  0000               _TIM1_CCxCmd:
5184  0000 89            	pushw	x
5185       00000000      OFST:	set	0
5188                     ; 1615     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5190                     ; 1616     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5192                     ; 1618     if (TIM1_Channel == TIM1_CHANNEL_1)
5194  0001 9e            	ld	a,xh
5195  0002 4d            	tnz	a
5196  0003 2610          	jrne	L5652
5197                     ; 1621         if (NewState != DISABLE)
5199  0005 9f            	ld	a,xl
5200  0006 4d            	tnz	a
5201  0007 2706          	jreq	L7652
5202                     ; 1623             TIM1->CCER1 |= TIM1_CCER1_CC1E;
5204  0009 7210525c      	bset	21084,#0
5206  000d 203e          	jra	L3752
5207  000f               L7652:
5208                     ; 1627             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5210  000f 7211525c      	bres	21084,#0
5211  0013 2038          	jra	L3752
5212  0015               L5652:
5213                     ; 1631     else if (TIM1_Channel == TIM1_CHANNEL_2)
5215  0015 7b01          	ld	a,(OFST+1,sp)
5216  0017 a101          	cp	a,#1
5217  0019 2610          	jrne	L5752
5218                     ; 1634         if (NewState != DISABLE)
5220  001b 7b02          	ld	a,(OFST+2,sp)
5221  001d 2706          	jreq	L7752
5222                     ; 1636             TIM1->CCER1 |= TIM1_CCER1_CC2E;
5224  001f 7218525c      	bset	21084,#4
5226  0023 2028          	jra	L3752
5227  0025               L7752:
5228                     ; 1640             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5230  0025 7219525c      	bres	21084,#4
5231  0029 2022          	jra	L3752
5232  002b               L5752:
5233                     ; 1643     else if (TIM1_Channel == TIM1_CHANNEL_3)
5235  002b a102          	cp	a,#2
5236  002d 2610          	jrne	L5062
5237                     ; 1646         if (NewState != DISABLE)
5239  002f 7b02          	ld	a,(OFST+2,sp)
5240  0031 2706          	jreq	L7062
5241                     ; 1648             TIM1->CCER2 |= TIM1_CCER2_CC3E;
5243  0033 7210525d      	bset	21085,#0
5245  0037 2014          	jra	L3752
5246  0039               L7062:
5247                     ; 1652             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5249  0039 7211525d      	bres	21085,#0
5250  003d 200e          	jra	L3752
5251  003f               L5062:
5252                     ; 1658         if (NewState != DISABLE)
5254  003f 7b02          	ld	a,(OFST+2,sp)
5255  0041 2706          	jreq	L5162
5256                     ; 1660             TIM1->CCER2 |= TIM1_CCER2_CC4E;
5258  0043 7218525d      	bset	21085,#4
5260  0047 2004          	jra	L3752
5261  0049               L5162:
5262                     ; 1664             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5264  0049 7219525d      	bres	21085,#4
5265  004d               L3752:
5266                     ; 1667 }
5269  004d 85            	popw	x
5270  004e 81            	ret	
5315                     ; 1680 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5315                     ; 1681 {
5316                     .text:	section	.text,new
5317  0000               _TIM1_CCxNCmd:
5319  0000 89            	pushw	x
5320       00000000      OFST:	set	0
5323                     ; 1683     assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5325                     ; 1684     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5327                     ; 1686     if (TIM1_Channel == TIM1_CHANNEL_1)
5329  0001 9e            	ld	a,xh
5330  0002 4d            	tnz	a
5331  0003 2610          	jrne	L3462
5332                     ; 1689         if (NewState != DISABLE)
5334  0005 9f            	ld	a,xl
5335  0006 4d            	tnz	a
5336  0007 2706          	jreq	L5462
5337                     ; 1691             TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5339  0009 7214525c      	bset	21084,#2
5341  000d 2029          	jra	L1562
5342  000f               L5462:
5343                     ; 1695             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5345  000f 7215525c      	bres	21084,#2
5346  0013 2023          	jra	L1562
5347  0015               L3462:
5348                     ; 1698     else if (TIM1_Channel == TIM1_CHANNEL_2)
5350  0015 7b01          	ld	a,(OFST+1,sp)
5351  0017 4a            	dec	a
5352  0018 2610          	jrne	L3562
5353                     ; 1701         if (NewState != DISABLE)
5355  001a 7b02          	ld	a,(OFST+2,sp)
5356  001c 2706          	jreq	L5562
5357                     ; 1703             TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5359  001e 721c525c      	bset	21084,#6
5361  0022 2014          	jra	L1562
5362  0024               L5562:
5363                     ; 1707             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5365  0024 721d525c      	bres	21084,#6
5366  0028 200e          	jra	L1562
5367  002a               L3562:
5368                     ; 1713         if (NewState != DISABLE)
5370  002a 7b02          	ld	a,(OFST+2,sp)
5371  002c 2706          	jreq	L3662
5372                     ; 1715             TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5374  002e 7214525d      	bset	21085,#2
5376  0032 2004          	jra	L1562
5377  0034               L3662:
5378                     ; 1719             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5380  0034 7215525d      	bres	21085,#2
5381  0038               L1562:
5382                     ; 1722 }
5385  0038 85            	popw	x
5386  0039 81            	ret	
5431                     ; 1746 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5431                     ; 1747 {
5432                     .text:	section	.text,new
5433  0000               _TIM1_SelectOCxM:
5435  0000 89            	pushw	x
5436       00000000      OFST:	set	0
5439                     ; 1749     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5441                     ; 1750     assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5443                     ; 1752     if (TIM1_Channel == TIM1_CHANNEL_1)
5445  0001 9e            	ld	a,xh
5446  0002 4d            	tnz	a
5447  0003 2610          	jrne	L1172
5448                     ; 1755         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5450  0005 7211525c      	bres	21084,#0
5451                     ; 1758         TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5451                     ; 1759                                 | (uint8_t)TIM1_OCMode);
5453  0009 c65258        	ld	a,21080
5454  000c a48f          	and	a,#143
5455  000e 1a02          	or	a,(OFST+2,sp)
5456  0010 c75258        	ld	21080,a
5458  0013 2038          	jra	L3172
5459  0015               L1172:
5460                     ; 1761     else if (TIM1_Channel == TIM1_CHANNEL_2)
5462  0015 7b01          	ld	a,(OFST+1,sp)
5463  0017 a101          	cp	a,#1
5464  0019 2610          	jrne	L5172
5465                     ; 1764         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5467  001b 7219525c      	bres	21084,#4
5468                     ; 1767         TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5468                     ; 1768                                 | (uint8_t)TIM1_OCMode);
5470  001f c65259        	ld	a,21081
5471  0022 a48f          	and	a,#143
5472  0024 1a02          	or	a,(OFST+2,sp)
5473  0026 c75259        	ld	21081,a
5475  0029 2022          	jra	L3172
5476  002b               L5172:
5477                     ; 1770     else if (TIM1_Channel == TIM1_CHANNEL_3)
5479  002b a102          	cp	a,#2
5480  002d 2610          	jrne	L1272
5481                     ; 1773         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5483  002f 7211525d      	bres	21085,#0
5484                     ; 1776         TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5484                     ; 1777                                 | (uint8_t)TIM1_OCMode);
5486  0033 c6525a        	ld	a,21082
5487  0036 a48f          	and	a,#143
5488  0038 1a02          	or	a,(OFST+2,sp)
5489  003a c7525a        	ld	21082,a
5491  003d 200e          	jra	L3172
5492  003f               L1272:
5493                     ; 1782         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5495  003f 7219525d      	bres	21085,#4
5496                     ; 1785         TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5496                     ; 1786                                 | (uint8_t)TIM1_OCMode);
5498  0043 c6525b        	ld	a,21083
5499  0046 a48f          	and	a,#143
5500  0048 1a02          	or	a,(OFST+2,sp)
5501  004a c7525b        	ld	21083,a
5502  004d               L3172:
5503                     ; 1788 }
5506  004d 85            	popw	x
5507  004e 81            	ret	
5539                     ; 1797 void TIM1_SetCounter(uint16_t Counter)
5539                     ; 1798 {
5540                     .text:	section	.text,new
5541  0000               _TIM1_SetCounter:
5545                     ; 1800     TIM1->CNTRH = (uint8_t)(Counter >> 8);
5547  0000 9e            	ld	a,xh
5548  0001 c7525e        	ld	21086,a
5549                     ; 1801     TIM1->CNTRL = (uint8_t)(Counter);
5551  0004 9f            	ld	a,xl
5552  0005 c7525f        	ld	21087,a
5553                     ; 1803 }
5556  0008 81            	ret	
5588                     ; 1812 void TIM1_SetAutoreload(uint16_t Autoreload)
5588                     ; 1813 {
5589                     .text:	section	.text,new
5590  0000               _TIM1_SetAutoreload:
5594                     ; 1816     TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5596  0000 9e            	ld	a,xh
5597  0001 c75262        	ld	21090,a
5598                     ; 1817     TIM1->ARRL = (uint8_t)(Autoreload);
5600  0004 9f            	ld	a,xl
5601  0005 c75263        	ld	21091,a
5602                     ; 1819 }
5605  0008 81            	ret	
5637                     ; 1828 void TIM1_SetCompare1(uint16_t Compare1)
5637                     ; 1829 {
5638                     .text:	section	.text,new
5639  0000               _TIM1_SetCompare1:
5643                     ; 1831     TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5645  0000 9e            	ld	a,xh
5646  0001 c75265        	ld	21093,a
5647                     ; 1832     TIM1->CCR1L = (uint8_t)(Compare1);
5649  0004 9f            	ld	a,xl
5650  0005 c75266        	ld	21094,a
5651                     ; 1834 }
5654  0008 81            	ret	
5686                     ; 1843 void TIM1_SetCompare2(uint16_t Compare2)
5686                     ; 1844 {
5687                     .text:	section	.text,new
5688  0000               _TIM1_SetCompare2:
5692                     ; 1846     TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5694  0000 9e            	ld	a,xh
5695  0001 c75267        	ld	21095,a
5696                     ; 1847     TIM1->CCR2L = (uint8_t)(Compare2);
5698  0004 9f            	ld	a,xl
5699  0005 c75268        	ld	21096,a
5700                     ; 1849 }
5703  0008 81            	ret	
5735                     ; 1858 void TIM1_SetCompare3(uint16_t Compare3)
5735                     ; 1859 {
5736                     .text:	section	.text,new
5737  0000               _TIM1_SetCompare3:
5741                     ; 1861     TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5743  0000 9e            	ld	a,xh
5744  0001 c75269        	ld	21097,a
5745                     ; 1862     TIM1->CCR3L = (uint8_t)(Compare3);
5747  0004 9f            	ld	a,xl
5748  0005 c7526a        	ld	21098,a
5749                     ; 1864 }
5752  0008 81            	ret	
5784                     ; 1873 void TIM1_SetCompare4(uint16_t Compare4)
5784                     ; 1874 {
5785                     .text:	section	.text,new
5786  0000               _TIM1_SetCompare4:
5790                     ; 1876     TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5792  0000 9e            	ld	a,xh
5793  0001 c7526b        	ld	21099,a
5794                     ; 1877     TIM1->CCR4L = (uint8_t)(Compare4);
5796  0004 9f            	ld	a,xl
5797  0005 c7526c        	ld	21100,a
5798                     ; 1878 }
5801  0008 81            	ret	
5837                     ; 1891 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5837                     ; 1892 {
5838                     .text:	section	.text,new
5839  0000               _TIM1_SetIC1Prescaler:
5841  0000 88            	push	a
5842       00000000      OFST:	set	0
5845                     ; 1894     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5847                     ; 1897     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5847                     ; 1898                             | (uint8_t)TIM1_IC1Prescaler);
5849  0001 c65258        	ld	a,21080
5850  0004 a4f3          	and	a,#243
5851  0006 1a01          	or	a,(OFST+1,sp)
5852  0008 c75258        	ld	21080,a
5853                     ; 1900 }
5856  000b 84            	pop	a
5857  000c 81            	ret	
5893                     ; 1912 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5893                     ; 1913 {
5894                     .text:	section	.text,new
5895  0000               _TIM1_SetIC2Prescaler:
5897  0000 88            	push	a
5898       00000000      OFST:	set	0
5901                     ; 1916     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5903                     ; 1919     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5903                     ; 1920                             | (uint8_t)TIM1_IC2Prescaler);
5905  0001 c65259        	ld	a,21081
5906  0004 a4f3          	and	a,#243
5907  0006 1a01          	or	a,(OFST+1,sp)
5908  0008 c75259        	ld	21081,a
5909                     ; 1921 }
5912  000b 84            	pop	a
5913  000c 81            	ret	
5949                     ; 1934 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
5949                     ; 1935 {
5950                     .text:	section	.text,new
5951  0000               _TIM1_SetIC3Prescaler:
5953  0000 88            	push	a
5954       00000000      OFST:	set	0
5957                     ; 1938     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
5959                     ; 1941     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
5959                     ; 1942                             (uint8_t)TIM1_IC3Prescaler);
5961  0001 c6525a        	ld	a,21082
5962  0004 a4f3          	and	a,#243
5963  0006 1a01          	or	a,(OFST+1,sp)
5964  0008 c7525a        	ld	21082,a
5965                     ; 1943 }
5968  000b 84            	pop	a
5969  000c 81            	ret	
6005                     ; 1955 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6005                     ; 1956 {
6006                     .text:	section	.text,new
6007  0000               _TIM1_SetIC4Prescaler:
6009  0000 88            	push	a
6010       00000000      OFST:	set	0
6013                     ; 1959     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6015                     ; 1962     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6015                     ; 1963                             (uint8_t)TIM1_IC4Prescaler);
6017  0001 c6525b        	ld	a,21083
6018  0004 a4f3          	and	a,#243
6019  0006 1a01          	or	a,(OFST+1,sp)
6020  0008 c7525b        	ld	21083,a
6021                     ; 1964 }
6024  000b 84            	pop	a
6025  000c 81            	ret	
6071                     ; 1971 uint16_t TIM1_GetCapture1(void)
6071                     ; 1972 {
6072                     .text:	section	.text,new
6073  0000               _TIM1_GetCapture1:
6075  0000 5204          	subw	sp,#4
6076       00000004      OFST:	set	4
6079                     ; 1975     uint16_t tmpccr1 = 0;
6081                     ; 1976     uint8_t tmpccr1l=0, tmpccr1h=0;
6085                     ; 1978     tmpccr1h = TIM1->CCR1H;
6087  0002 c65265        	ld	a,21093
6088  0005 6b02          	ld	(OFST-2,sp),a
6089                     ; 1979     tmpccr1l = TIM1->CCR1L;
6091  0007 c65266        	ld	a,21094
6092  000a 6b01          	ld	(OFST-3,sp),a
6093                     ; 1981     tmpccr1 = (uint16_t)(tmpccr1l);
6095  000c 5f            	clrw	x
6096  000d 97            	ld	xl,a
6097  000e 1f03          	ldw	(OFST-1,sp),x
6098                     ; 1982     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6100  0010 5f            	clrw	x
6101  0011 7b02          	ld	a,(OFST-2,sp)
6102  0013 97            	ld	xl,a
6103  0014 7b04          	ld	a,(OFST+0,sp)
6104  0016 01            	rrwa	x,a
6105  0017 1a03          	or	a,(OFST-1,sp)
6106  0019 01            	rrwa	x,a
6107                     ; 1984     return (uint16_t)tmpccr1;
6111  001a 5b04          	addw	sp,#4
6112  001c 81            	ret	
6158                     ; 1992 uint16_t TIM1_GetCapture2(void)
6158                     ; 1993 {
6159                     .text:	section	.text,new
6160  0000               _TIM1_GetCapture2:
6162  0000 5204          	subw	sp,#4
6163       00000004      OFST:	set	4
6166                     ; 1996     uint16_t tmpccr2 = 0;
6168                     ; 1997     uint8_t tmpccr2l=0, tmpccr2h=0;
6172                     ; 1999     tmpccr2h = TIM1->CCR2H;
6174  0002 c65267        	ld	a,21095
6175  0005 6b02          	ld	(OFST-2,sp),a
6176                     ; 2000     tmpccr2l = TIM1->CCR2L;
6178  0007 c65268        	ld	a,21096
6179  000a 6b01          	ld	(OFST-3,sp),a
6180                     ; 2002     tmpccr2 = (uint16_t)(tmpccr2l);
6182  000c 5f            	clrw	x
6183  000d 97            	ld	xl,a
6184  000e 1f03          	ldw	(OFST-1,sp),x
6185                     ; 2003     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6187  0010 5f            	clrw	x
6188  0011 7b02          	ld	a,(OFST-2,sp)
6189  0013 97            	ld	xl,a
6190  0014 7b04          	ld	a,(OFST+0,sp)
6191  0016 01            	rrwa	x,a
6192  0017 1a03          	or	a,(OFST-1,sp)
6193  0019 01            	rrwa	x,a
6194                     ; 2005     return (uint16_t)tmpccr2;
6198  001a 5b04          	addw	sp,#4
6199  001c 81            	ret	
6245                     ; 2013 uint16_t TIM1_GetCapture3(void)
6245                     ; 2014 {
6246                     .text:	section	.text,new
6247  0000               _TIM1_GetCapture3:
6249  0000 5204          	subw	sp,#4
6250       00000004      OFST:	set	4
6253                     ; 2016     uint16_t tmpccr3 = 0;
6255                     ; 2017     uint8_t tmpccr3l=0, tmpccr3h=0;
6259                     ; 2019     tmpccr3h = TIM1->CCR3H;
6261  0002 c65269        	ld	a,21097
6262  0005 6b02          	ld	(OFST-2,sp),a
6263                     ; 2020     tmpccr3l = TIM1->CCR3L;
6265  0007 c6526a        	ld	a,21098
6266  000a 6b01          	ld	(OFST-3,sp),a
6267                     ; 2022     tmpccr3 = (uint16_t)(tmpccr3l);
6269  000c 5f            	clrw	x
6270  000d 97            	ld	xl,a
6271  000e 1f03          	ldw	(OFST-1,sp),x
6272                     ; 2023     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6274  0010 5f            	clrw	x
6275  0011 7b02          	ld	a,(OFST-2,sp)
6276  0013 97            	ld	xl,a
6277  0014 7b04          	ld	a,(OFST+0,sp)
6278  0016 01            	rrwa	x,a
6279  0017 1a03          	or	a,(OFST-1,sp)
6280  0019 01            	rrwa	x,a
6281                     ; 2025     return (uint16_t)tmpccr3;
6285  001a 5b04          	addw	sp,#4
6286  001c 81            	ret	
6332                     ; 2033 uint16_t TIM1_GetCapture4(void)
6332                     ; 2034 {
6333                     .text:	section	.text,new
6334  0000               _TIM1_GetCapture4:
6336  0000 5204          	subw	sp,#4
6337       00000004      OFST:	set	4
6340                     ; 2036     uint16_t tmpccr4 = 0;
6342                     ; 2037     uint8_t tmpccr4l=0, tmpccr4h=0;
6346                     ; 2039     tmpccr4h = TIM1->CCR4H;
6348  0002 c6526b        	ld	a,21099
6349  0005 6b02          	ld	(OFST-2,sp),a
6350                     ; 2040     tmpccr4l = TIM1->CCR4L;
6352  0007 c6526c        	ld	a,21100
6353  000a 6b01          	ld	(OFST-3,sp),a
6354                     ; 2042     tmpccr4 = (uint16_t)(tmpccr4l);
6356  000c 5f            	clrw	x
6357  000d 97            	ld	xl,a
6358  000e 1f03          	ldw	(OFST-1,sp),x
6359                     ; 2043     tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6361  0010 5f            	clrw	x
6362  0011 7b02          	ld	a,(OFST-2,sp)
6363  0013 97            	ld	xl,a
6364  0014 7b04          	ld	a,(OFST+0,sp)
6365  0016 01            	rrwa	x,a
6366  0017 1a03          	or	a,(OFST-1,sp)
6367  0019 01            	rrwa	x,a
6368                     ; 2045     return (uint16_t)tmpccr4;
6372  001a 5b04          	addw	sp,#4
6373  001c 81            	ret	
6405                     ; 2053 uint16_t TIM1_GetCounter(void)
6405                     ; 2054 {
6406                     .text:	section	.text,new
6407  0000               _TIM1_GetCounter:
6409  0000 89            	pushw	x
6410       00000002      OFST:	set	2
6413                     ; 2055   uint16_t tmpcntr = 0;
6415                     ; 2057   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6417  0001 c6525e        	ld	a,21086
6418  0004 97            	ld	xl,a
6419  0005 4f            	clr	a
6420  0006 02            	rlwa	x,a
6421  0007 1f01          	ldw	(OFST-1,sp),x
6422                     ; 2060     return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6424  0009 c6525f        	ld	a,21087
6425  000c 5f            	clrw	x
6426  000d 97            	ld	xl,a
6427  000e 01            	rrwa	x,a
6428  000f 1a02          	or	a,(OFST+0,sp)
6429  0011 01            	rrwa	x,a
6430  0012 1a01          	or	a,(OFST-1,sp)
6431  0014 01            	rrwa	x,a
6434  0015 5b02          	addw	sp,#2
6435  0017 81            	ret	
6467                     ; 2068 uint16_t TIM1_GetPrescaler(void)
6467                     ; 2069 {
6468                     .text:	section	.text,new
6469  0000               _TIM1_GetPrescaler:
6471  0000 89            	pushw	x
6472       00000002      OFST:	set	2
6475                     ; 2070    uint16_t temp = 0;
6477                     ; 2072    temp = ((uint16_t)TIM1->PSCRH << 8);
6479  0001 c65260        	ld	a,21088
6480  0004 97            	ld	xl,a
6481  0005 4f            	clr	a
6482  0006 02            	rlwa	x,a
6483  0007 1f01          	ldw	(OFST-1,sp),x
6484                     ; 2075     return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6486  0009 c65261        	ld	a,21089
6487  000c 5f            	clrw	x
6488  000d 97            	ld	xl,a
6489  000e 01            	rrwa	x,a
6490  000f 1a02          	or	a,(OFST+0,sp)
6491  0011 01            	rrwa	x,a
6492  0012 1a01          	or	a,(OFST-1,sp)
6493  0014 01            	rrwa	x,a
6496  0015 5b02          	addw	sp,#2
6497  0017 81            	ret	
6667                     ; 2096 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6667                     ; 2097 {
6668                     .text:	section	.text,new
6669  0000               _TIM1_GetFlagStatus:
6671  0000 89            	pushw	x
6672  0001 89            	pushw	x
6673       00000002      OFST:	set	2
6676                     ; 2098     FlagStatus bitstatus = RESET;
6678                     ; 2099     uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6682                     ; 2102     assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6684                     ; 2104     tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6686  0002 9f            	ld	a,xl
6687  0003 c45255        	and	a,21077
6688  0006 6b01          	ld	(OFST-1,sp),a
6689                     ; 2105     tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6691  0008 7b03          	ld	a,(OFST+1,sp)
6692  000a 6b02          	ld	(OFST+0,sp),a
6693                     ; 2107     if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6695  000c c45256        	and	a,21078
6696  000f 1a01          	or	a,(OFST-1,sp)
6697  0011 2702          	jreq	L7433
6698                     ; 2109         bitstatus = SET;
6700  0013 a601          	ld	a,#1
6702  0015               L7433:
6703                     ; 2113         bitstatus = RESET;
6705                     ; 2115     return (FlagStatus)(bitstatus);
6709  0015 5b04          	addw	sp,#4
6710  0017 81            	ret	
6745                     ; 2136 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6745                     ; 2137 {
6746                     .text:	section	.text,new
6747  0000               _TIM1_ClearFlag:
6749  0000 89            	pushw	x
6750       00000000      OFST:	set	0
6753                     ; 2139     assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6755                     ; 2142     TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6757  0001 9f            	ld	a,xl
6758  0002 43            	cpl	a
6759  0003 c75255        	ld	21077,a
6760                     ; 2143     TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6760                     ; 2144                           (uint8_t)0x1E);
6762  0006 7b01          	ld	a,(OFST+1,sp)
6763  0008 43            	cpl	a
6764  0009 a41e          	and	a,#30
6765  000b c75256        	ld	21078,a
6766                     ; 2145 }
6769  000e 85            	popw	x
6770  000f 81            	ret	
6830                     ; 2161 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6830                     ; 2162 {
6831                     .text:	section	.text,new
6832  0000               _TIM1_GetITStatus:
6834  0000 88            	push	a
6835  0001 89            	pushw	x
6836       00000002      OFST:	set	2
6839                     ; 2163     ITStatus bitstatus = RESET;
6841                     ; 2164     uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
6845                     ; 2167     assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
6847                     ; 2169     TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
6849  0002 c45255        	and	a,21077
6850  0005 6b01          	ld	(OFST-1,sp),a
6851                     ; 2171     TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
6853  0007 c65254        	ld	a,21076
6854  000a 1403          	and	a,(OFST+1,sp)
6855  000c 6b02          	ld	(OFST+0,sp),a
6856                     ; 2173     if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
6858  000e 7b01          	ld	a,(OFST-1,sp)
6859  0010 2708          	jreq	L7143
6861  0012 7b02          	ld	a,(OFST+0,sp)
6862  0014 2704          	jreq	L7143
6863                     ; 2175         bitstatus = SET;
6865  0016 a601          	ld	a,#1
6867  0018 2001          	jra	L1243
6868  001a               L7143:
6869                     ; 2179         bitstatus = RESET;
6871  001a 4f            	clr	a
6872  001b               L1243:
6873                     ; 2181     return (ITStatus)(bitstatus);
6877  001b 5b03          	addw	sp,#3
6878  001d 81            	ret	
6914                     ; 2198 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
6914                     ; 2199 {
6915                     .text:	section	.text,new
6916  0000               _TIM1_ClearITPendingBit:
6920                     ; 2201     assert_param(IS_TIM1_IT_OK(TIM1_IT));
6922                     ; 2204     TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
6924  0000 43            	cpl	a
6925  0001 c75255        	ld	21077,a
6926                     ; 2205 }
6929  0004 81            	ret	
6975                     ; 2223 static void TI1_Config(uint8_t TIM1_ICPolarity,
6975                     ; 2224                        uint8_t TIM1_ICSelection,
6975                     ; 2225                        uint8_t TIM1_ICFilter)
6975                     ; 2226 {
6976                     .text:	section	.text,new
6977  0000               L3_TI1_Config:
6979  0000 89            	pushw	x
6980  0001 88            	push	a
6981       00000001      OFST:	set	1
6984                     ; 2229     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
6986  0002 7211525c      	bres	21084,#0
6987                     ; 2232     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
6987                     ; 2233                             (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
6989  0006 7b06          	ld	a,(OFST+5,sp)
6990  0008 97            	ld	xl,a
6991  0009 a610          	ld	a,#16
6992  000b 42            	mul	x,a
6993  000c 9f            	ld	a,xl
6994  000d 1a03          	or	a,(OFST+2,sp)
6995  000f 6b01          	ld	(OFST+0,sp),a
6996  0011 c65258        	ld	a,21080
6997  0014 a40c          	and	a,#12
6998  0016 1a01          	or	a,(OFST+0,sp)
6999  0018 c75258        	ld	21080,a
7000                     ; 2236     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7002  001b 7b02          	ld	a,(OFST+1,sp)
7003  001d 2706          	jreq	L1643
7004                     ; 2238         TIM1->CCER1 |= TIM1_CCER1_CC1P;
7006  001f 7212525c      	bset	21084,#1
7008  0023 2004          	jra	L3643
7009  0025               L1643:
7010                     ; 2242         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7012  0025 7213525c      	bres	21084,#1
7013  0029               L3643:
7014                     ; 2246     TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7016  0029 7210525c      	bset	21084,#0
7017                     ; 2247 }
7020  002d 5b03          	addw	sp,#3
7021  002f 81            	ret	
7067                     ; 2265 static void TI2_Config(uint8_t TIM1_ICPolarity,
7067                     ; 2266                        uint8_t TIM1_ICSelection,
7067                     ; 2267                        uint8_t TIM1_ICFilter)
7067                     ; 2268 {
7068                     .text:	section	.text,new
7069  0000               L5_TI2_Config:
7071  0000 89            	pushw	x
7072  0001 88            	push	a
7073       00000001      OFST:	set	1
7076                     ; 2270     TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7078  0002 7219525c      	bres	21084,#4
7079                     ; 2273     TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7079                     ; 2274                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7081  0006 7b06          	ld	a,(OFST+5,sp)
7082  0008 97            	ld	xl,a
7083  0009 a610          	ld	a,#16
7084  000b 42            	mul	x,a
7085  000c 9f            	ld	a,xl
7086  000d 1a03          	or	a,(OFST+2,sp)
7087  000f 6b01          	ld	(OFST+0,sp),a
7088  0011 c65259        	ld	a,21081
7089  0014 a40c          	and	a,#12
7090  0016 1a01          	or	a,(OFST+0,sp)
7091  0018 c75259        	ld	21081,a
7092                     ; 2276     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7094  001b 7b02          	ld	a,(OFST+1,sp)
7095  001d 2706          	jreq	L5053
7096                     ; 2278         TIM1->CCER1 |= TIM1_CCER1_CC2P;
7098  001f 721a525c      	bset	21084,#5
7100  0023 2004          	jra	L7053
7101  0025               L5053:
7102                     ; 2282         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7104  0025 721b525c      	bres	21084,#5
7105  0029               L7053:
7106                     ; 2285     TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7108  0029 7218525c      	bset	21084,#4
7109                     ; 2286 }
7112  002d 5b03          	addw	sp,#3
7113  002f 81            	ret	
7159                     ; 2304 static void TI3_Config(uint8_t TIM1_ICPolarity,
7159                     ; 2305                        uint8_t TIM1_ICSelection,
7159                     ; 2306                        uint8_t TIM1_ICFilter)
7159                     ; 2307 {
7160                     .text:	section	.text,new
7161  0000               L7_TI3_Config:
7163  0000 89            	pushw	x
7164  0001 88            	push	a
7165       00000001      OFST:	set	1
7168                     ; 2309     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7170  0002 7211525d      	bres	21085,#0
7171                     ; 2312     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7171                     ; 2313                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7173  0006 7b06          	ld	a,(OFST+5,sp)
7174  0008 97            	ld	xl,a
7175  0009 a610          	ld	a,#16
7176  000b 42            	mul	x,a
7177  000c 9f            	ld	a,xl
7178  000d 1a03          	or	a,(OFST+2,sp)
7179  000f 6b01          	ld	(OFST+0,sp),a
7180  0011 c6525a        	ld	a,21082
7181  0014 a40c          	and	a,#12
7182  0016 1a01          	or	a,(OFST+0,sp)
7183  0018 c7525a        	ld	21082,a
7184                     ; 2316     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7186  001b 7b02          	ld	a,(OFST+1,sp)
7187  001d 2706          	jreq	L1353
7188                     ; 2318         TIM1->CCER2 |= TIM1_CCER2_CC3P;
7190  001f 7212525d      	bset	21085,#1
7192  0023 2004          	jra	L3353
7193  0025               L1353:
7194                     ; 2322         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7196  0025 7213525d      	bres	21085,#1
7197  0029               L3353:
7198                     ; 2325     TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7200  0029 7210525d      	bset	21085,#0
7201                     ; 2326 }
7204  002d 5b03          	addw	sp,#3
7205  002f 81            	ret	
7251                     ; 2345 static void TI4_Config(uint8_t TIM1_ICPolarity,
7251                     ; 2346                        uint8_t TIM1_ICSelection,
7251                     ; 2347                        uint8_t TIM1_ICFilter)
7251                     ; 2348 {
7252                     .text:	section	.text,new
7253  0000               L11_TI4_Config:
7255  0000 89            	pushw	x
7256  0001 88            	push	a
7257       00000001      OFST:	set	1
7260                     ; 2351     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7262  0002 7219525d      	bres	21085,#4
7263                     ; 2354     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7263                     ; 2355                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7265  0006 7b06          	ld	a,(OFST+5,sp)
7266  0008 97            	ld	xl,a
7267  0009 a610          	ld	a,#16
7268  000b 42            	mul	x,a
7269  000c 9f            	ld	a,xl
7270  000d 1a03          	or	a,(OFST+2,sp)
7271  000f 6b01          	ld	(OFST+0,sp),a
7272  0011 c6525b        	ld	a,21083
7273  0014 a40c          	and	a,#12
7274  0016 1a01          	or	a,(OFST+0,sp)
7275  0018 c7525b        	ld	21083,a
7276                     ; 2358     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7278  001b 7b02          	ld	a,(OFST+1,sp)
7279  001d 2706          	jreq	L5553
7280                     ; 2360         TIM1->CCER2 |= TIM1_CCER2_CC4P;
7282  001f 721a525d      	bset	21085,#5
7284  0023 2004          	jra	L7553
7285  0025               L5553:
7286                     ; 2364         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7288  0025 721b525d      	bres	21085,#5
7289  0029               L7553:
7290                     ; 2368     TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7292  0029 7218525d      	bset	21085,#4
7293                     ; 2369 }
7296  002d 5b03          	addw	sp,#3
7297  002f 81            	ret	
7310                     	xdef	_TIM1_ClearITPendingBit
7311                     	xdef	_TIM1_GetITStatus
7312                     	xdef	_TIM1_ClearFlag
7313                     	xdef	_TIM1_GetFlagStatus
7314                     	xdef	_TIM1_GetPrescaler
7315                     	xdef	_TIM1_GetCounter
7316                     	xdef	_TIM1_GetCapture4
7317                     	xdef	_TIM1_GetCapture3
7318                     	xdef	_TIM1_GetCapture2
7319                     	xdef	_TIM1_GetCapture1
7320                     	xdef	_TIM1_SetIC4Prescaler
7321                     	xdef	_TIM1_SetIC3Prescaler
7322                     	xdef	_TIM1_SetIC2Prescaler
7323                     	xdef	_TIM1_SetIC1Prescaler
7324                     	xdef	_TIM1_SetCompare4
7325                     	xdef	_TIM1_SetCompare3
7326                     	xdef	_TIM1_SetCompare2
7327                     	xdef	_TIM1_SetCompare1
7328                     	xdef	_TIM1_SetAutoreload
7329                     	xdef	_TIM1_SetCounter
7330                     	xdef	_TIM1_SelectOCxM
7331                     	xdef	_TIM1_CCxNCmd
7332                     	xdef	_TIM1_CCxCmd
7333                     	xdef	_TIM1_OC4PolarityConfig
7334                     	xdef	_TIM1_OC3NPolarityConfig
7335                     	xdef	_TIM1_OC3PolarityConfig
7336                     	xdef	_TIM1_OC2NPolarityConfig
7337                     	xdef	_TIM1_OC2PolarityConfig
7338                     	xdef	_TIM1_OC1NPolarityConfig
7339                     	xdef	_TIM1_OC1PolarityConfig
7340                     	xdef	_TIM1_GenerateEvent
7341                     	xdef	_TIM1_OC4FastConfig
7342                     	xdef	_TIM1_OC3FastConfig
7343                     	xdef	_TIM1_OC2FastConfig
7344                     	xdef	_TIM1_OC1FastConfig
7345                     	xdef	_TIM1_OC4PreloadConfig
7346                     	xdef	_TIM1_OC3PreloadConfig
7347                     	xdef	_TIM1_OC2PreloadConfig
7348                     	xdef	_TIM1_OC1PreloadConfig
7349                     	xdef	_TIM1_CCPreloadControl
7350                     	xdef	_TIM1_SelectCOM
7351                     	xdef	_TIM1_ARRPreloadConfig
7352                     	xdef	_TIM1_ForcedOC4Config
7353                     	xdef	_TIM1_ForcedOC3Config
7354                     	xdef	_TIM1_ForcedOC2Config
7355                     	xdef	_TIM1_ForcedOC1Config
7356                     	xdef	_TIM1_CounterModeConfig
7357                     	xdef	_TIM1_PrescalerConfig
7358                     	xdef	_TIM1_EncoderInterfaceConfig
7359                     	xdef	_TIM1_SelectMasterSlaveMode
7360                     	xdef	_TIM1_SelectSlaveMode
7361                     	xdef	_TIM1_SelectOutputTrigger
7362                     	xdef	_TIM1_SelectOnePulseMode
7363                     	xdef	_TIM1_SelectHallSensor
7364                     	xdef	_TIM1_UpdateRequestConfig
7365                     	xdef	_TIM1_UpdateDisableConfig
7366                     	xdef	_TIM1_SelectInputTrigger
7367                     	xdef	_TIM1_TIxExternalClockConfig
7368                     	xdef	_TIM1_ETRConfig
7369                     	xdef	_TIM1_ETRClockMode2Config
7370                     	xdef	_TIM1_ETRClockMode1Config
7371                     	xdef	_TIM1_InternalClockConfig
7372                     	xdef	_TIM1_ITConfig
7373                     	xdef	_TIM1_CtrlPWMOutputs
7374                     	xdef	_TIM1_Cmd
7375                     	xdef	_TIM1_PWMIConfig
7376                     	xdef	_TIM1_ICInit
7377                     	xdef	_TIM1_BDTRConfig
7378                     	xdef	_TIM1_OC4Init
7379                     	xdef	_TIM1_OC3Init
7380                     	xdef	_TIM1_OC2Init
7381                     	xdef	_TIM1_OC1Init
7382                     	xdef	_TIM1_TimeBaseInit
7383                     	xdef	_TIM1_DeInit
7402                     	end
