   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  44                     ; 51 void TIM1_DeInit(void)
  44                     ; 52 {
  46                     	switch	.text
  47  0000               _TIM1_DeInit:
  51                     ; 53     TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  53  0000 725f5250      	clr	21072
  54                     ; 54     TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  56  0004 725f5251      	clr	21073
  57                     ; 55     TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  59  0008 725f5252      	clr	21074
  60                     ; 56     TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  62  000c 725f5253      	clr	21075
  63                     ; 57     TIM1->IER  = TIM1_IER_RESET_VALUE;
  65  0010 725f5254      	clr	21076
  66                     ; 58     TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  68  0014 725f5256      	clr	21078
  69                     ; 60     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  71  0018 725f525c      	clr	21084
  72                     ; 61     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  74  001c 725f525d      	clr	21085
  75                     ; 63     TIM1->CCMR1 = 0x01;
  77  0020 35015258      	mov	21080,#1
  78                     ; 64     TIM1->CCMR2 = 0x01;
  80  0024 35015259      	mov	21081,#1
  81                     ; 65     TIM1->CCMR3 = 0x01;
  83  0028 3501525a      	mov	21082,#1
  84                     ; 66     TIM1->CCMR4 = 0x01;
  86  002c 3501525b      	mov	21083,#1
  87                     ; 68     TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  89  0030 725f525c      	clr	21084
  90                     ; 69     TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  92  0034 725f525d      	clr	21085
  93                     ; 70     TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  95  0038 725f5258      	clr	21080
  96                     ; 71     TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  98  003c 725f5259      	clr	21081
  99                     ; 72     TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 101  0040 725f525a      	clr	21082
 102                     ; 73     TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 104  0044 725f525b      	clr	21083
 105                     ; 74     TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 107  0048 725f525e      	clr	21086
 108                     ; 75     TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 110  004c 725f525f      	clr	21087
 111                     ; 76     TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 113  0050 725f5260      	clr	21088
 114                     ; 77     TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 116  0054 725f5261      	clr	21089
 117                     ; 78     TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 119  0058 35ff5262      	mov	21090,#255
 120                     ; 79     TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 122  005c 35ff5263      	mov	21091,#255
 123                     ; 80     TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 125  0060 725f5265      	clr	21093
 126                     ; 81     TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 128  0064 725f5266      	clr	21094
 129                     ; 82     TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 131  0068 725f5267      	clr	21095
 132                     ; 83     TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 134  006c 725f5268      	clr	21096
 135                     ; 84     TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 137  0070 725f5269      	clr	21097
 138                     ; 85     TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 140  0074 725f526a      	clr	21098
 141                     ; 86     TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 143  0078 725f526b      	clr	21099
 144                     ; 87     TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 146  007c 725f526c      	clr	21100
 147                     ; 88     TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 149  0080 725f526f      	clr	21103
 150                     ; 89     TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 152  0084 35015257      	mov	21079,#1
 153                     ; 90     TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 155  0088 725f526e      	clr	21102
 156                     ; 91     TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 158  008c 725f526d      	clr	21101
 159                     ; 92     TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 161  0090 725f5264      	clr	21092
 162                     ; 93     TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 164  0094 725f5255      	clr	21077
 165                     ; 94 }
 168  0098 81            	ret
 277                     ; 104 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 277                     ; 105                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 277                     ; 106                        uint16_t TIM1_Period,
 277                     ; 107                        uint8_t TIM1_RepetitionCounter)
 277                     ; 108 {
 278                     	switch	.text
 279  0099               _TIM1_TimeBaseInit:
 281  0099 89            	pushw	x
 282       00000000      OFST:	set	0
 285                     ; 111     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 287                     ; 114     TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 289  009a 7b06          	ld	a,(OFST+6,sp)
 290  009c c75262        	ld	21090,a
 291                     ; 115     TIM1->ARRL = (uint8_t)(TIM1_Period);
 293  009f 7b07          	ld	a,(OFST+7,sp)
 294  00a1 c75263        	ld	21091,a
 295                     ; 118     TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 297  00a4 9e            	ld	a,xh
 298  00a5 c75260        	ld	21088,a
 299                     ; 119     TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 301  00a8 9f            	ld	a,xl
 302  00a9 c75261        	ld	21089,a
 303                     ; 122     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 303                     ; 123                            | (uint8_t)(TIM1_CounterMode));
 305  00ac c65250        	ld	a,21072
 306  00af a48f          	and	a,#143
 307  00b1 1a05          	or	a,(OFST+5,sp)
 308  00b3 c75250        	ld	21072,a
 309                     ; 126     TIM1->RCR = TIM1_RepetitionCounter;
 311  00b6 7b08          	ld	a,(OFST+8,sp)
 312  00b8 c75264        	ld	21092,a
 313                     ; 128 }
 316  00bb 85            	popw	x
 317  00bc 81            	ret
 602                     ; 149 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 602                     ; 150                   TIM1_OutputState_TypeDef TIM1_OutputState,
 602                     ; 151                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 602                     ; 152                   uint16_t TIM1_Pulse,
 602                     ; 153                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 602                     ; 154                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 602                     ; 155                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 602                     ; 156                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 602                     ; 157 {
 603                     	switch	.text
 604  00bd               _TIM1_OC1Init:
 606  00bd 89            	pushw	x
 607  00be 5203          	subw	sp,#3
 608       00000003      OFST:	set	3
 611                     ; 159     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 613                     ; 160     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 615                     ; 161     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 617                     ; 162     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 619                     ; 163     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 621                     ; 164     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 623                     ; 165     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 625                     ; 169     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 625                     ; 170                                | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 627  00c0 c6525c        	ld	a,21084
 628  00c3 a4f0          	and	a,#240
 629  00c5 c7525c        	ld	21084,a
 630                     ; 173   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 630                     ; 174                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 630                     ; 175                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 630                     ; 176                                         | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 632  00c8 7b0c          	ld	a,(OFST+9,sp)
 633  00ca a408          	and	a,#8
 634  00cc 6b03          	ld	(OFST+0,sp),a
 636  00ce 7b0b          	ld	a,(OFST+8,sp)
 637  00d0 a402          	and	a,#2
 638  00d2 1a03          	or	a,(OFST+0,sp)
 639  00d4 6b02          	ld	(OFST-1,sp),a
 641  00d6 7b08          	ld	a,(OFST+5,sp)
 642  00d8 a404          	and	a,#4
 643  00da 6b01          	ld	(OFST-2,sp),a
 645  00dc 9f            	ld	a,xl
 646  00dd a401          	and	a,#1
 647  00df 1a01          	or	a,(OFST-2,sp)
 648  00e1 1a02          	or	a,(OFST-1,sp)
 649  00e3 ca525c        	or	a,21084
 650  00e6 c7525c        	ld	21084,a
 651                     ; 179     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 651                     ; 180                             (uint8_t)TIM1_OCMode);
 653  00e9 c65258        	ld	a,21080
 654  00ec a48f          	and	a,#143
 655  00ee 1a04          	or	a,(OFST+1,sp)
 656  00f0 c75258        	ld	21080,a
 657                     ; 183     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 659  00f3 c6526f        	ld	a,21103
 660  00f6 a4fc          	and	a,#252
 661  00f8 c7526f        	ld	21103,a
 662                     ; 185     TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 662                     ; 186                             (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 664  00fb 7b0e          	ld	a,(OFST+11,sp)
 665  00fd a402          	and	a,#2
 666  00ff 6b03          	ld	(OFST+0,sp),a
 668  0101 7b0d          	ld	a,(OFST+10,sp)
 669  0103 a401          	and	a,#1
 670  0105 1a03          	or	a,(OFST+0,sp)
 671  0107 ca526f        	or	a,21103
 672  010a c7526f        	ld	21103,a
 673                     ; 189     TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 675  010d 7b09          	ld	a,(OFST+6,sp)
 676  010f c75265        	ld	21093,a
 677                     ; 190     TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 679  0112 7b0a          	ld	a,(OFST+7,sp)
 680  0114 c75266        	ld	21094,a
 681                     ; 191 }
 684  0117 5b05          	addw	sp,#5
 685  0119 81            	ret
 789                     ; 212 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 789                     ; 213                   TIM1_OutputState_TypeDef TIM1_OutputState,
 789                     ; 214                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 789                     ; 215                   uint16_t TIM1_Pulse,
 789                     ; 216                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 789                     ; 217                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 789                     ; 218                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 789                     ; 219                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 789                     ; 220 {
 790                     	switch	.text
 791  011a               _TIM1_OC2Init:
 793  011a 89            	pushw	x
 794  011b 5203          	subw	sp,#3
 795       00000003      OFST:	set	3
 798                     ; 222     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 800                     ; 223     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 802                     ; 224     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 804                     ; 225     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 806                     ; 226     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 808                     ; 227     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 810                     ; 228     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 812                     ; 232     TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
 812                     ; 233                                 TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
 814  011d c6525c        	ld	a,21084
 815  0120 a40f          	and	a,#15
 816  0122 c7525c        	ld	21084,a
 817                     ; 237     TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
 817                     ; 238                              (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
 817                     ; 239                              (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
 817                     ; 240                              (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
 819  0125 7b0c          	ld	a,(OFST+9,sp)
 820  0127 a480          	and	a,#128
 821  0129 6b03          	ld	(OFST+0,sp),a
 823  012b 7b0b          	ld	a,(OFST+8,sp)
 824  012d a420          	and	a,#32
 825  012f 1a03          	or	a,(OFST+0,sp)
 826  0131 6b02          	ld	(OFST-1,sp),a
 828  0133 7b08          	ld	a,(OFST+5,sp)
 829  0135 a440          	and	a,#64
 830  0137 6b01          	ld	(OFST-2,sp),a
 832  0139 9f            	ld	a,xl
 833  013a a410          	and	a,#16
 834  013c 1a01          	or	a,(OFST-2,sp)
 835  013e 1a02          	or	a,(OFST-1,sp)
 836  0140 ca525c        	or	a,21084
 837  0143 c7525c        	ld	21084,a
 838                     ; 243     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 838                     ; 244                              (uint8_t)TIM1_OCMode);
 840  0146 c65259        	ld	a,21081
 841  0149 a48f          	and	a,#143
 842  014b 1a04          	or	a,(OFST+1,sp)
 843  014d c75259        	ld	21081,a
 844                     ; 247     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
 846  0150 c6526f        	ld	a,21103
 847  0153 a4f3          	and	a,#243
 848  0155 c7526f        	ld	21103,a
 849                     ; 249     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
 849                     ; 250                             (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
 851  0158 7b0e          	ld	a,(OFST+11,sp)
 852  015a a408          	and	a,#8
 853  015c 6b03          	ld	(OFST+0,sp),a
 855  015e 7b0d          	ld	a,(OFST+10,sp)
 856  0160 a404          	and	a,#4
 857  0162 1a03          	or	a,(OFST+0,sp)
 858  0164 ca526f        	or	a,21103
 859  0167 c7526f        	ld	21103,a
 860                     ; 253     TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
 862  016a 7b09          	ld	a,(OFST+6,sp)
 863  016c c75267        	ld	21095,a
 864                     ; 254     TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
 866  016f 7b0a          	ld	a,(OFST+7,sp)
 867  0171 c75268        	ld	21096,a
 868                     ; 256 }
 871  0174 5b05          	addw	sp,#5
 872  0176 81            	ret
 976                     ; 277 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 976                     ; 278                   TIM1_OutputState_TypeDef TIM1_OutputState,
 976                     ; 279                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 976                     ; 280                   uint16_t TIM1_Pulse,
 976                     ; 281                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 976                     ; 282                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 976                     ; 283                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 976                     ; 284                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 976                     ; 285 {
 977                     	switch	.text
 978  0177               _TIM1_OC3Init:
 980  0177 89            	pushw	x
 981  0178 5203          	subw	sp,#3
 982       00000003      OFST:	set	3
 985                     ; 287     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 987                     ; 288     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 989                     ; 289     assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 991                     ; 290     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 993                     ; 291     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 995                     ; 292     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 997                     ; 293     assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 999                     ; 297     TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
 999                     ; 298                                 TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1001  017a c6525d        	ld	a,21085
1002  017d a4f0          	and	a,#240
1003  017f c7525d        	ld	21085,a
1004                     ; 301     TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1004                     ; 302                              (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1004                     ; 303                              (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1004                     ; 304                              (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1006  0182 7b0c          	ld	a,(OFST+9,sp)
1007  0184 a408          	and	a,#8
1008  0186 6b03          	ld	(OFST+0,sp),a
1010  0188 7b0b          	ld	a,(OFST+8,sp)
1011  018a a402          	and	a,#2
1012  018c 1a03          	or	a,(OFST+0,sp)
1013  018e 6b02          	ld	(OFST-1,sp),a
1015  0190 7b08          	ld	a,(OFST+5,sp)
1016  0192 a404          	and	a,#4
1017  0194 6b01          	ld	(OFST-2,sp),a
1019  0196 9f            	ld	a,xl
1020  0197 a401          	and	a,#1
1021  0199 1a01          	or	a,(OFST-2,sp)
1022  019b 1a02          	or	a,(OFST-1,sp)
1023  019d ca525d        	or	a,21085
1024  01a0 c7525d        	ld	21085,a
1025                     ; 307     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1025                     ; 308                              (uint8_t)TIM1_OCMode);
1027  01a3 c6525a        	ld	a,21082
1028  01a6 a48f          	and	a,#143
1029  01a8 1a04          	or	a,(OFST+1,sp)
1030  01aa c7525a        	ld	21082,a
1031                     ; 311     TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1033  01ad c6526f        	ld	a,21103
1034  01b0 a4cf          	and	a,#207
1035  01b2 c7526f        	ld	21103,a
1036                     ; 313     TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1036                     ; 314                             (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1038  01b5 7b0e          	ld	a,(OFST+11,sp)
1039  01b7 a420          	and	a,#32
1040  01b9 6b03          	ld	(OFST+0,sp),a
1042  01bb 7b0d          	ld	a,(OFST+10,sp)
1043  01bd a410          	and	a,#16
1044  01bf 1a03          	or	a,(OFST+0,sp)
1045  01c1 ca526f        	or	a,21103
1046  01c4 c7526f        	ld	21103,a
1047                     ; 317     TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1049  01c7 7b09          	ld	a,(OFST+6,sp)
1050  01c9 c75269        	ld	21097,a
1051                     ; 318     TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1053  01cc 7b0a          	ld	a,(OFST+7,sp)
1054  01ce c7526a        	ld	21098,a
1055                     ; 320 }
1058  01d1 5b05          	addw	sp,#5
1059  01d3 81            	ret
1133                     ; 335 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1133                     ; 336                   TIM1_OutputState_TypeDef TIM1_OutputState,
1133                     ; 337                   uint16_t TIM1_Pulse,
1133                     ; 338                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1133                     ; 339                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1133                     ; 340 {
1134                     	switch	.text
1135  01d4               _TIM1_OC4Init:
1137  01d4 89            	pushw	x
1138  01d5 88            	push	a
1139       00000001      OFST:	set	1
1142                     ; 342     assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1144                     ; 343     assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1146                     ; 344     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1148                     ; 345     assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1150                     ; 348     TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1152  01d6 c6525d        	ld	a,21085
1153  01d9 a4cf          	and	a,#207
1154  01db c7525d        	ld	21085,a
1155                     ; 350     TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1155                     ; 351                              (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1157  01de 7b08          	ld	a,(OFST+7,sp)
1158  01e0 a420          	and	a,#32
1159  01e2 6b01          	ld	(OFST+0,sp),a
1161  01e4 9f            	ld	a,xl
1162  01e5 a410          	and	a,#16
1163  01e7 1a01          	or	a,(OFST+0,sp)
1164  01e9 ca525d        	or	a,21085
1165  01ec c7525d        	ld	21085,a
1166                     ; 354     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1166                     ; 355                             TIM1_OCMode);
1168  01ef c6525b        	ld	a,21083
1169  01f2 a48f          	and	a,#143
1170  01f4 1a02          	or	a,(OFST+1,sp)
1171  01f6 c7525b        	ld	21083,a
1172                     ; 358     if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1174  01f9 0d09          	tnz	(OFST+8,sp)
1175  01fb 270a          	jreq	L534
1176                     ; 360         TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1178  01fd c6526f        	ld	a,21103
1179  0200 aadf          	or	a,#223
1180  0202 c7526f        	ld	21103,a
1182  0205 2004          	jra	L734
1183  0207               L534:
1184                     ; 364         TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1186  0207 721d526f      	bres	21103,#6
1187  020b               L734:
1188                     ; 368     TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1190  020b 7b06          	ld	a,(OFST+5,sp)
1191  020d c7526b        	ld	21099,a
1192                     ; 369     TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1194  0210 7b07          	ld	a,(OFST+6,sp)
1195  0212 c7526c        	ld	21100,a
1196                     ; 371 }
1199  0215 5b03          	addw	sp,#3
1200  0217 81            	ret
1405                     ; 386 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1405                     ; 387                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1405                     ; 388                      uint8_t TIM1_DeadTime,
1405                     ; 389                      TIM1_BreakState_TypeDef TIM1_Break,
1405                     ; 390                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1405                     ; 391                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1405                     ; 392 {
1406                     	switch	.text
1407  0218               _TIM1_BDTRConfig:
1409  0218 89            	pushw	x
1410  0219 88            	push	a
1411       00000001      OFST:	set	1
1414                     ; 394     assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1416                     ; 395     assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1418                     ; 396     assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1420                     ; 397     assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
1422                     ; 398     assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
1424                     ; 400     TIM1->DTR = (uint8_t)(TIM1_DeadTime);
1426  021a 7b06          	ld	a,(OFST+5,sp)
1427  021c c7526e        	ld	21102,a
1428                     ; 404     TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
1428                     ; 405                             (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
1428                     ; 406                             (uint8_t)TIM1_AutomaticOutput));
1430  021f 7b07          	ld	a,(OFST+6,sp)
1431  0221 1a08          	or	a,(OFST+7,sp)
1432  0223 1a09          	or	a,(OFST+8,sp)
1433  0225 6b01          	ld	(OFST+0,sp),a
1435  0227 9f            	ld	a,xl
1436  0228 1a02          	or	a,(OFST+1,sp)
1437  022a 1a01          	or	a,(OFST+0,sp)
1438  022c c7526d        	ld	21101,a
1439                     ; 408 }
1442  022f 5b03          	addw	sp,#3
1443  0231 81            	ret
1645                     ; 422 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
1645                     ; 423                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1645                     ; 424                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
1645                     ; 425                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1645                     ; 426                  uint8_t TIM1_ICFilter)
1645                     ; 427 {
1646                     	switch	.text
1647  0232               _TIM1_ICInit:
1649  0232 89            	pushw	x
1650       00000000      OFST:	set	0
1653                     ; 430     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
1655                     ; 431     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1657                     ; 432     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1659                     ; 433     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1661                     ; 434     assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
1663                     ; 436     if (TIM1_Channel == TIM1_CHANNEL_1)
1665  0233 9e            	ld	a,xh
1666  0234 4d            	tnz	a
1667  0235 2614          	jrne	L766
1668                     ; 439         TI1_Config((uint8_t)TIM1_ICPolarity,
1668                     ; 440                    (uint8_t)TIM1_ICSelection,
1668                     ; 441                    (uint8_t)TIM1_ICFilter);
1670  0237 7b07          	ld	a,(OFST+7,sp)
1671  0239 88            	push	a
1672  023a 7b06          	ld	a,(OFST+6,sp)
1673  023c 97            	ld	xl,a
1674  023d 7b03          	ld	a,(OFST+3,sp)
1675  023f 95            	ld	xh,a
1676  0240 cd080e        	call	L3_TI1_Config
1678  0243 84            	pop	a
1679                     ; 443         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1681  0244 7b06          	ld	a,(OFST+6,sp)
1682  0246 cd06b6        	call	_TIM1_SetIC1Prescaler
1685  0249 2046          	jra	L176
1686  024b               L766:
1687                     ; 445     else if (TIM1_Channel == TIM1_CHANNEL_2)
1689  024b 7b01          	ld	a,(OFST+1,sp)
1690  024d a101          	cp	a,#1
1691  024f 2614          	jrne	L376
1692                     ; 448         TI2_Config((uint8_t)TIM1_ICPolarity,
1692                     ; 449                    (uint8_t)TIM1_ICSelection,
1692                     ; 450                    (uint8_t)TIM1_ICFilter);
1694  0251 7b07          	ld	a,(OFST+7,sp)
1695  0253 88            	push	a
1696  0254 7b06          	ld	a,(OFST+6,sp)
1697  0256 97            	ld	xl,a
1698  0257 7b03          	ld	a,(OFST+3,sp)
1699  0259 95            	ld	xh,a
1700  025a cd083e        	call	L5_TI2_Config
1702  025d 84            	pop	a
1703                     ; 452         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1705  025e 7b06          	ld	a,(OFST+6,sp)
1706  0260 cd06c3        	call	_TIM1_SetIC2Prescaler
1709  0263 202c          	jra	L176
1710  0265               L376:
1711                     ; 454     else if (TIM1_Channel == TIM1_CHANNEL_3)
1713  0265 7b01          	ld	a,(OFST+1,sp)
1714  0267 a102          	cp	a,#2
1715  0269 2614          	jrne	L776
1716                     ; 457         TI3_Config((uint8_t)TIM1_ICPolarity,
1716                     ; 458                    (uint8_t)TIM1_ICSelection,
1716                     ; 459                    (uint8_t)TIM1_ICFilter);
1718  026b 7b07          	ld	a,(OFST+7,sp)
1719  026d 88            	push	a
1720  026e 7b06          	ld	a,(OFST+6,sp)
1721  0270 97            	ld	xl,a
1722  0271 7b03          	ld	a,(OFST+3,sp)
1723  0273 95            	ld	xh,a
1724  0274 cd086e        	call	L7_TI3_Config
1726  0277 84            	pop	a
1727                     ; 461         TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
1729  0278 7b06          	ld	a,(OFST+6,sp)
1730  027a cd06d0        	call	_TIM1_SetIC3Prescaler
1733  027d 2012          	jra	L176
1734  027f               L776:
1735                     ; 466         TI4_Config((uint8_t)TIM1_ICPolarity,
1735                     ; 467                    (uint8_t)TIM1_ICSelection,
1735                     ; 468                    (uint8_t)TIM1_ICFilter);
1737  027f 7b07          	ld	a,(OFST+7,sp)
1738  0281 88            	push	a
1739  0282 7b06          	ld	a,(OFST+6,sp)
1740  0284 97            	ld	xl,a
1741  0285 7b03          	ld	a,(OFST+3,sp)
1742  0287 95            	ld	xh,a
1743  0288 cd089e        	call	L11_TI4_Config
1745  028b 84            	pop	a
1746                     ; 470         TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
1748  028c 7b06          	ld	a,(OFST+6,sp)
1749  028e cd06dd        	call	_TIM1_SetIC4Prescaler
1751  0291               L176:
1752                     ; 473 }
1755  0291 85            	popw	x
1756  0292 81            	ret
1852                     ; 489 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
1852                     ; 490                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
1852                     ; 491                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
1852                     ; 492                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
1852                     ; 493                      uint8_t TIM1_ICFilter)
1852                     ; 494 {
1853                     	switch	.text
1854  0293               _TIM1_PWMIConfig:
1856  0293 89            	pushw	x
1857  0294 89            	pushw	x
1858       00000002      OFST:	set	2
1861                     ; 495     uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
1863                     ; 496     uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
1865                     ; 499     assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
1867                     ; 500     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
1869                     ; 501     assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
1871                     ; 502     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
1873                     ; 505     if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
1875  0295 9f            	ld	a,xl
1876  0296 a101          	cp	a,#1
1877  0298 2706          	jreq	L157
1878                     ; 507         icpolarity = TIM1_ICPOLARITY_FALLING;
1880  029a a601          	ld	a,#1
1881  029c 6b01          	ld	(OFST-1,sp),a
1884  029e 2002          	jra	L357
1885  02a0               L157:
1886                     ; 511         icpolarity = TIM1_ICPOLARITY_RISING;
1888  02a0 0f01          	clr	(OFST-1,sp)
1890  02a2               L357:
1891                     ; 515     if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
1893  02a2 7b07          	ld	a,(OFST+5,sp)
1894  02a4 a101          	cp	a,#1
1895  02a6 2606          	jrne	L557
1896                     ; 517         icselection = TIM1_ICSELECTION_INDIRECTTI;
1898  02a8 a602          	ld	a,#2
1899  02aa 6b02          	ld	(OFST+0,sp),a
1902  02ac 2004          	jra	L757
1903  02ae               L557:
1904                     ; 521         icselection = TIM1_ICSELECTION_DIRECTTI;
1906  02ae a601          	ld	a,#1
1907  02b0 6b02          	ld	(OFST+0,sp),a
1909  02b2               L757:
1910                     ; 524     if (TIM1_Channel == TIM1_CHANNEL_1)
1912  02b2 0d03          	tnz	(OFST+1,sp)
1913  02b4 2626          	jrne	L167
1914                     ; 527         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1914                     ; 528                    (uint8_t)TIM1_ICFilter);
1916  02b6 7b09          	ld	a,(OFST+7,sp)
1917  02b8 88            	push	a
1918  02b9 7b08          	ld	a,(OFST+6,sp)
1919  02bb 97            	ld	xl,a
1920  02bc 7b05          	ld	a,(OFST+3,sp)
1921  02be 95            	ld	xh,a
1922  02bf cd080e        	call	L3_TI1_Config
1924  02c2 84            	pop	a
1925                     ; 531         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1927  02c3 7b08          	ld	a,(OFST+6,sp)
1928  02c5 cd06b6        	call	_TIM1_SetIC1Prescaler
1930                     ; 534         TI2_Config(icpolarity, icselection, TIM1_ICFilter);
1932  02c8 7b09          	ld	a,(OFST+7,sp)
1933  02ca 88            	push	a
1934  02cb 7b03          	ld	a,(OFST+1,sp)
1935  02cd 97            	ld	xl,a
1936  02ce 7b02          	ld	a,(OFST+0,sp)
1937  02d0 95            	ld	xh,a
1938  02d1 cd083e        	call	L5_TI2_Config
1940  02d4 84            	pop	a
1941                     ; 537         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1943  02d5 7b08          	ld	a,(OFST+6,sp)
1944  02d7 cd06c3        	call	_TIM1_SetIC2Prescaler
1947  02da 2024          	jra	L367
1948  02dc               L167:
1949                     ; 542         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
1949                     ; 543                    (uint8_t)TIM1_ICFilter);
1951  02dc 7b09          	ld	a,(OFST+7,sp)
1952  02de 88            	push	a
1953  02df 7b08          	ld	a,(OFST+6,sp)
1954  02e1 97            	ld	xl,a
1955  02e2 7b05          	ld	a,(OFST+3,sp)
1956  02e4 95            	ld	xh,a
1957  02e5 cd083e        	call	L5_TI2_Config
1959  02e8 84            	pop	a
1960                     ; 546         TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
1962  02e9 7b08          	ld	a,(OFST+6,sp)
1963  02eb cd06c3        	call	_TIM1_SetIC2Prescaler
1965                     ; 549         TI1_Config(icpolarity, icselection, TIM1_ICFilter);
1967  02ee 7b09          	ld	a,(OFST+7,sp)
1968  02f0 88            	push	a
1969  02f1 7b03          	ld	a,(OFST+1,sp)
1970  02f3 97            	ld	xl,a
1971  02f4 7b02          	ld	a,(OFST+0,sp)
1972  02f6 95            	ld	xh,a
1973  02f7 cd080e        	call	L3_TI1_Config
1975  02fa 84            	pop	a
1976                     ; 552         TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
1978  02fb 7b08          	ld	a,(OFST+6,sp)
1979  02fd cd06b6        	call	_TIM1_SetIC1Prescaler
1981  0300               L367:
1982                     ; 554 }
1985  0300 5b04          	addw	sp,#4
1986  0302 81            	ret
2041                     ; 562 void TIM1_Cmd(FunctionalState NewState)
2041                     ; 563 {
2042                     	switch	.text
2043  0303               _TIM1_Cmd:
2047                     ; 565     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2049                     ; 568     if (NewState != DISABLE)
2051  0303 4d            	tnz	a
2052  0304 2706          	jreq	L3101
2053                     ; 570         TIM1->CR1 |= TIM1_CR1_CEN;
2055  0306 72105250      	bset	21072,#0
2057  030a 2004          	jra	L5101
2058  030c               L3101:
2059                     ; 574         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2061  030c 72115250      	bres	21072,#0
2062  0310               L5101:
2063                     ; 576 }
2066  0310 81            	ret
2102                     ; 584 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2102                     ; 585 {
2103                     	switch	.text
2104  0311               _TIM1_CtrlPWMOutputs:
2108                     ; 587     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2110                     ; 591     if (NewState != DISABLE)
2112  0311 4d            	tnz	a
2113  0312 2706          	jreq	L5301
2114                     ; 593         TIM1->BKR |= TIM1_BKR_MOE;
2116  0314 721e526d      	bset	21101,#7
2118  0318 2004          	jra	L7301
2119  031a               L5301:
2120                     ; 597         TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2122  031a 721f526d      	bres	21101,#7
2123  031e               L7301:
2124                     ; 599 }
2127  031e 81            	ret
2234                     ; 618 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
2234                     ; 619 {
2235                     	switch	.text
2236  031f               _TIM1_ITConfig:
2238  031f 89            	pushw	x
2239       00000000      OFST:	set	0
2242                     ; 621     assert_param(IS_TIM1_IT_OK(TIM1_IT));
2244                     ; 622     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2246                     ; 624     if (NewState != DISABLE)
2248  0320 9f            	ld	a,xl
2249  0321 4d            	tnz	a
2250  0322 2709          	jreq	L7011
2251                     ; 627         TIM1->IER |= (uint8_t)TIM1_IT;
2253  0324 9e            	ld	a,xh
2254  0325 ca5254        	or	a,21076
2255  0328 c75254        	ld	21076,a
2257  032b 2009          	jra	L1111
2258  032d               L7011:
2259                     ; 632         TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
2261  032d 7b01          	ld	a,(OFST+1,sp)
2262  032f 43            	cpl	a
2263  0330 c45254        	and	a,21076
2264  0333 c75254        	ld	21076,a
2265  0336               L1111:
2266                     ; 634 }
2269  0336 85            	popw	x
2270  0337 81            	ret
2294                     ; 641 void TIM1_InternalClockConfig(void)
2294                     ; 642 {
2295                     	switch	.text
2296  0338               _TIM1_InternalClockConfig:
2300                     ; 644     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
2302  0338 c65252        	ld	a,21074
2303  033b a4f8          	and	a,#248
2304  033d c75252        	ld	21074,a
2305                     ; 645 }
2308  0340 81            	ret
2425                     ; 663 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2425                     ; 664                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2425                     ; 665                               uint8_t ExtTRGFilter)
2425                     ; 666 {
2426                     	switch	.text
2427  0341               _TIM1_ETRClockMode1Config:
2429  0341 89            	pushw	x
2430       00000000      OFST:	set	0
2433                     ; 668     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2435                     ; 669     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2437                     ; 672     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2439  0342 7b05          	ld	a,(OFST+5,sp)
2440  0344 88            	push	a
2441  0345 9f            	ld	a,xl
2442  0346 97            	ld	xl,a
2443  0347 7b02          	ld	a,(OFST+2,sp)
2444  0349 95            	ld	xh,a
2445  034a ad1f          	call	_TIM1_ETRConfig
2447  034c 84            	pop	a
2448                     ; 675     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
2448                     ; 676                            | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
2450  034d c65252        	ld	a,21074
2451  0350 a488          	and	a,#136
2452  0352 aa77          	or	a,#119
2453  0354 c75252        	ld	21074,a
2454                     ; 677 }
2457  0357 85            	popw	x
2458  0358 81            	ret
2516                     ; 695 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2516                     ; 696                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2516                     ; 697                               uint8_t ExtTRGFilter)
2516                     ; 698 {
2517                     	switch	.text
2518  0359               _TIM1_ETRClockMode2Config:
2520  0359 89            	pushw	x
2521       00000000      OFST:	set	0
2524                     ; 700     assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
2526                     ; 701     assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
2528                     ; 704     TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
2530  035a 7b05          	ld	a,(OFST+5,sp)
2531  035c 88            	push	a
2532  035d 9f            	ld	a,xl
2533  035e 97            	ld	xl,a
2534  035f 7b02          	ld	a,(OFST+2,sp)
2535  0361 95            	ld	xh,a
2536  0362 ad07          	call	_TIM1_ETRConfig
2538  0364 84            	pop	a
2539                     ; 707     TIM1->ETR |= TIM1_ETR_ECE;
2541  0365 721c5253      	bset	21075,#6
2542                     ; 708 }
2545  0369 85            	popw	x
2546  036a 81            	ret
2602                     ; 726 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
2602                     ; 727                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
2602                     ; 728                     uint8_t ExtTRGFilter)
2602                     ; 729 {
2603                     	switch	.text
2604  036b               _TIM1_ETRConfig:
2606  036b 89            	pushw	x
2607       00000000      OFST:	set	0
2610                     ; 731     assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
2612                     ; 733     TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
2612                     ; 734                       (uint8_t)ExtTRGFilter );
2614  036c 9f            	ld	a,xl
2615  036d 1a01          	or	a,(OFST+1,sp)
2616  036f 1a05          	or	a,(OFST+5,sp)
2617  0371 ca5253        	or	a,21075
2618  0374 c75253        	ld	21075,a
2619                     ; 735 }
2622  0377 85            	popw	x
2623  0378 81            	ret
2712                     ; 752 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
2712                     ; 753                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2712                     ; 754                                  uint8_t ICFilter)
2712                     ; 755 {
2713                     	switch	.text
2714  0379               _TIM1_TIxExternalClockConfig:
2716  0379 89            	pushw	x
2717       00000000      OFST:	set	0
2720                     ; 757     assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
2722                     ; 758     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2724                     ; 759     assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
2726                     ; 762     if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
2728  037a 9e            	ld	a,xh
2729  037b a160          	cp	a,#96
2730  037d 260e          	jrne	L1131
2731                     ; 764         TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2733  037f 7b05          	ld	a,(OFST+5,sp)
2734  0381 88            	push	a
2735  0382 9f            	ld	a,xl
2736  0383 ae0001        	ldw	x,#1
2737  0386 95            	ld	xh,a
2738  0387 cd083e        	call	L5_TI2_Config
2740  038a 84            	pop	a
2742  038b 200d          	jra	L3131
2743  038d               L1131:
2744                     ; 768         TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
2746  038d 7b05          	ld	a,(OFST+5,sp)
2747  038f 88            	push	a
2748  0390 7b03          	ld	a,(OFST+3,sp)
2749  0392 ae0001        	ldw	x,#1
2750  0395 95            	ld	xh,a
2751  0396 cd080e        	call	L3_TI1_Config
2753  0399 84            	pop	a
2754  039a               L3131:
2755                     ; 772     TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
2757  039a 7b01          	ld	a,(OFST+1,sp)
2758  039c ad0a          	call	_TIM1_SelectInputTrigger
2760                     ; 775     TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
2762  039e c65252        	ld	a,21074
2763  03a1 aa07          	or	a,#7
2764  03a3 c75252        	ld	21074,a
2765                     ; 776 }
2768  03a6 85            	popw	x
2769  03a7 81            	ret
2854                     ; 788 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
2854                     ; 789 {
2855                     	switch	.text
2856  03a8               _TIM1_SelectInputTrigger:
2858  03a8 88            	push	a
2859       00000000      OFST:	set	0
2862                     ; 791     assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
2864                     ; 794     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
2866  03a9 c65252        	ld	a,21074
2867  03ac a48f          	and	a,#143
2868  03ae 1a01          	or	a,(OFST+1,sp)
2869  03b0 c75252        	ld	21074,a
2870                     ; 795 }
2873  03b3 84            	pop	a
2874  03b4 81            	ret
2910                     ; 805 void TIM1_UpdateDisableConfig(FunctionalState NewState)
2910                     ; 806 {
2911                     	switch	.text
2912  03b5               _TIM1_UpdateDisableConfig:
2916                     ; 808     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2918                     ; 811     if (NewState != DISABLE)
2920  03b5 4d            	tnz	a
2921  03b6 2706          	jreq	L1731
2922                     ; 813         TIM1->CR1 |= TIM1_CR1_UDIS;
2924  03b8 72125250      	bset	21072,#1
2926  03bc 2004          	jra	L3731
2927  03be               L1731:
2928                     ; 817         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
2930  03be 72135250      	bres	21072,#1
2931  03c2               L3731:
2932                     ; 819 }
2935  03c2 81            	ret
2993                     ; 829 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
2993                     ; 830 {
2994                     	switch	.text
2995  03c3               _TIM1_UpdateRequestConfig:
2999                     ; 832     assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
3001                     ; 835     if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
3003  03c3 4d            	tnz	a
3004  03c4 2706          	jreq	L3241
3005                     ; 837         TIM1->CR1 |= TIM1_CR1_URS;
3007  03c6 72145250      	bset	21072,#2
3009  03ca 2004          	jra	L5241
3010  03cc               L3241:
3011                     ; 841         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
3013  03cc 72155250      	bres	21072,#2
3014  03d0               L5241:
3015                     ; 843 }
3018  03d0 81            	ret
3054                     ; 852 void TIM1_SelectHallSensor(FunctionalState NewState)
3054                     ; 853 {
3055                     	switch	.text
3056  03d1               _TIM1_SelectHallSensor:
3060                     ; 855     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3062                     ; 858     if (NewState != DISABLE)
3064  03d1 4d            	tnz	a
3065  03d2 2706          	jreq	L5441
3066                     ; 860         TIM1->CR2 |= TIM1_CR2_TI1S;
3068  03d4 721e5251      	bset	21073,#7
3070  03d8 2004          	jra	L7441
3071  03da               L5441:
3072                     ; 864         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
3074  03da 721f5251      	bres	21073,#7
3075  03de               L7441:
3076                     ; 866 }
3079  03de 81            	ret
3136                     ; 877 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
3136                     ; 878 {
3137                     	switch	.text
3138  03df               _TIM1_SelectOnePulseMode:
3142                     ; 880     assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
3144                     ; 883     if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
3146  03df 4d            	tnz	a
3147  03e0 2706          	jreq	L7741
3148                     ; 885         TIM1->CR1 |= TIM1_CR1_OPM;
3150  03e2 72165250      	bset	21072,#3
3152  03e6 2004          	jra	L1051
3153  03e8               L7741:
3154                     ; 889         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
3156  03e8 72175250      	bres	21072,#3
3157  03ec               L1051:
3158                     ; 892 }
3161  03ec 81            	ret
3259                     ; 908 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
3259                     ; 909 {
3260                     	switch	.text
3261  03ed               _TIM1_SelectOutputTrigger:
3263  03ed 88            	push	a
3264       00000000      OFST:	set	0
3267                     ; 911     assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
3269                     ; 914     TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
3269                     ; 915                           (uint8_t) TIM1_TRGOSource);
3271  03ee c65251        	ld	a,21073
3272  03f1 a48f          	and	a,#143
3273  03f3 1a01          	or	a,(OFST+1,sp)
3274  03f5 c75251        	ld	21073,a
3275                     ; 916 }
3278  03f8 84            	pop	a
3279  03f9 81            	ret
3353                     ; 928 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
3353                     ; 929 {
3354                     	switch	.text
3355  03fa               _TIM1_SelectSlaveMode:
3357  03fa 88            	push	a
3358       00000000      OFST:	set	0
3361                     ; 932     assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
3363                     ; 935     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
3363                     ; 936                            (uint8_t)TIM1_SlaveMode);
3365  03fb c65252        	ld	a,21074
3366  03fe a4f8          	and	a,#248
3367  0400 1a01          	or	a,(OFST+1,sp)
3368  0402 c75252        	ld	21074,a
3369                     ; 938 }
3372  0405 84            	pop	a
3373  0406 81            	ret
3409                     ; 946 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
3409                     ; 947 {
3410                     	switch	.text
3411  0407               _TIM1_SelectMasterSlaveMode:
3415                     ; 949     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3417                     ; 952     if (NewState != DISABLE)
3419  0407 4d            	tnz	a
3420  0408 2706          	jreq	L3161
3421                     ; 954         TIM1->SMCR |= TIM1_SMCR_MSM;
3423  040a 721e5252      	bset	21074,#7
3425  040e 2004          	jra	L5161
3426  0410               L3161:
3427                     ; 958         TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
3429  0410 721f5252      	bres	21074,#7
3430  0414               L5161:
3431                     ; 960 }
3434  0414 81            	ret
3520                     ; 982 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
3520                     ; 983                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
3520                     ; 984                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
3520                     ; 985 {
3521                     	switch	.text
3522  0415               _TIM1_EncoderInterfaceConfig:
3524  0415 89            	pushw	x
3525       00000000      OFST:	set	0
3528                     ; 989     assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
3530                     ; 990     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
3532                     ; 991     assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
3534                     ; 994     if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
3536  0416 9f            	ld	a,xl
3537  0417 4d            	tnz	a
3538  0418 2706          	jreq	L7561
3539                     ; 996         TIM1->CCER1 |= TIM1_CCER1_CC1P;
3541  041a 7212525c      	bset	21084,#1
3543  041e 2004          	jra	L1661
3544  0420               L7561:
3545                     ; 1000         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
3547  0420 7213525c      	bres	21084,#1
3548  0424               L1661:
3549                     ; 1003     if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
3551  0424 0d05          	tnz	(OFST+5,sp)
3552  0426 2706          	jreq	L3661
3553                     ; 1005         TIM1->CCER1 |= TIM1_CCER1_CC2P;
3555  0428 721a525c      	bset	21084,#5
3557  042c 2004          	jra	L5661
3558  042e               L3661:
3559                     ; 1009         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
3561  042e 721b525c      	bres	21084,#5
3562  0432               L5661:
3563                     ; 1012     TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
3563                     ; 1013                            | (uint8_t) TIM1_EncoderMode);
3565  0432 c65252        	ld	a,21074
3566  0435 a4f0          	and	a,#240
3567  0437 1a01          	or	a,(OFST+1,sp)
3568  0439 c75252        	ld	21074,a
3569                     ; 1016     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
3569                     ; 1017                             | (uint8_t) CCMR_TIxDirect_Set);
3571  043c c65258        	ld	a,21080
3572  043f a4fc          	and	a,#252
3573  0441 aa01          	or	a,#1
3574  0443 c75258        	ld	21080,a
3575                     ; 1018     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
3575                     ; 1019                             | (uint8_t) CCMR_TIxDirect_Set);
3577  0446 c65259        	ld	a,21081
3578  0449 a4fc          	and	a,#252
3579  044b aa01          	or	a,#1
3580  044d c75259        	ld	21081,a
3581                     ; 1021 }
3584  0450 85            	popw	x
3585  0451 81            	ret
3652                     ; 1034 void TIM1_PrescalerConfig(uint16_t Prescaler,
3652                     ; 1035                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
3652                     ; 1036 {
3653                     	switch	.text
3654  0452               _TIM1_PrescalerConfig:
3656  0452 89            	pushw	x
3657       00000000      OFST:	set	0
3660                     ; 1038     assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
3662                     ; 1041     TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
3664  0453 9e            	ld	a,xh
3665  0454 c75260        	ld	21088,a
3666                     ; 1042     TIM1->PSCRL = (uint8_t)(Prescaler);
3668  0457 9f            	ld	a,xl
3669  0458 c75261        	ld	21089,a
3670                     ; 1045     TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
3672  045b 7b05          	ld	a,(OFST+5,sp)
3673  045d c75257        	ld	21079,a
3674                     ; 1047 }
3677  0460 85            	popw	x
3678  0461 81            	ret
3714                     ; 1060 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
3714                     ; 1061 {
3715                     	switch	.text
3716  0462               _TIM1_CounterModeConfig:
3718  0462 88            	push	a
3719       00000000      OFST:	set	0
3722                     ; 1063     assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
3724                     ; 1067     TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
3724                     ; 1068                           | (uint8_t)TIM1_CounterMode);
3726  0463 c65250        	ld	a,21072
3727  0466 a48f          	and	a,#143
3728  0468 1a01          	or	a,(OFST+1,sp)
3729  046a c75250        	ld	21072,a
3730                     ; 1069 }
3733  046d 84            	pop	a
3734  046e 81            	ret
3792                     ; 1080 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3792                     ; 1081 {
3793                     	switch	.text
3794  046f               _TIM1_ForcedOC1Config:
3796  046f 88            	push	a
3797       00000000      OFST:	set	0
3800                     ; 1083     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3802                     ; 1086     TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
3802                     ; 1087                              (uint8_t)TIM1_ForcedAction);
3804  0470 c65258        	ld	a,21080
3805  0473 a48f          	and	a,#143
3806  0475 1a01          	or	a,(OFST+1,sp)
3807  0477 c75258        	ld	21080,a
3808                     ; 1088 }
3811  047a 84            	pop	a
3812  047b 81            	ret
3848                     ; 1099 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3848                     ; 1100 {
3849                     	switch	.text
3850  047c               _TIM1_ForcedOC2Config:
3852  047c 88            	push	a
3853       00000000      OFST:	set	0
3856                     ; 1102     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3858                     ; 1105     TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
3858                     ; 1106                               | (uint8_t)TIM1_ForcedAction);
3860  047d c65259        	ld	a,21081
3861  0480 a48f          	and	a,#143
3862  0482 1a01          	or	a,(OFST+1,sp)
3863  0484 c75259        	ld	21081,a
3864                     ; 1107 }
3867  0487 84            	pop	a
3868  0488 81            	ret
3904                     ; 1119 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3904                     ; 1120 {
3905                     	switch	.text
3906  0489               _TIM1_ForcedOC3Config:
3908  0489 88            	push	a
3909       00000000      OFST:	set	0
3912                     ; 1122     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3914                     ; 1125     TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
3914                     ; 1126                               | (uint8_t)TIM1_ForcedAction);
3916  048a c6525a        	ld	a,21082
3917  048d a48f          	and	a,#143
3918  048f 1a01          	or	a,(OFST+1,sp)
3919  0491 c7525a        	ld	21082,a
3920                     ; 1127 }
3923  0494 84            	pop	a
3924  0495 81            	ret
3960                     ; 1139 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
3960                     ; 1140 {
3961                     	switch	.text
3962  0496               _TIM1_ForcedOC4Config:
3964  0496 88            	push	a
3965       00000000      OFST:	set	0
3968                     ; 1142     assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
3970                     ; 1145     TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
3970                     ; 1146                               | (uint8_t)TIM1_ForcedAction);
3972  0497 c6525b        	ld	a,21083
3973  049a a48f          	and	a,#143
3974  049c 1a01          	or	a,(OFST+1,sp)
3975  049e c7525b        	ld	21083,a
3976                     ; 1147 }
3979  04a1 84            	pop	a
3980  04a2 81            	ret
4016                     ; 1156 void TIM1_ARRPreloadConfig(FunctionalState NewState)
4016                     ; 1157 {
4017                     	switch	.text
4018  04a3               _TIM1_ARRPreloadConfig:
4022                     ; 1159     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4024                     ; 1162     if (NewState != DISABLE)
4026  04a3 4d            	tnz	a
4027  04a4 2706          	jreq	L5502
4028                     ; 1164         TIM1->CR1 |= TIM1_CR1_ARPE;
4030  04a6 721e5250      	bset	21072,#7
4032  04aa 2004          	jra	L7502
4033  04ac               L5502:
4034                     ; 1168         TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
4036  04ac 721f5250      	bres	21072,#7
4037  04b0               L7502:
4038                     ; 1170 }
4041  04b0 81            	ret
4076                     ; 1179 void TIM1_SelectCOM(FunctionalState NewState)
4076                     ; 1180 {
4077                     	switch	.text
4078  04b1               _TIM1_SelectCOM:
4082                     ; 1182     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4084                     ; 1185     if (NewState != DISABLE)
4086  04b1 4d            	tnz	a
4087  04b2 2706          	jreq	L7702
4088                     ; 1187         TIM1->CR2 |= TIM1_CR2_COMS;
4090  04b4 72145251      	bset	21073,#2
4092  04b8 2004          	jra	L1012
4093  04ba               L7702:
4094                     ; 1191         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
4096  04ba 72155251      	bres	21073,#2
4097  04be               L1012:
4098                     ; 1193 }
4101  04be 81            	ret
4137                     ; 1201 void TIM1_CCPreloadControl(FunctionalState NewState)
4137                     ; 1202 {
4138                     	switch	.text
4139  04bf               _TIM1_CCPreloadControl:
4143                     ; 1204     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4145                     ; 1207     if (NewState != DISABLE)
4147  04bf 4d            	tnz	a
4148  04c0 2706          	jreq	L1212
4149                     ; 1209         TIM1->CR2 |= TIM1_CR2_CCPC;
4151  04c2 72105251      	bset	21073,#0
4153  04c6 2004          	jra	L3212
4154  04c8               L1212:
4155                     ; 1213         TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
4157  04c8 72115251      	bres	21073,#0
4158  04cc               L3212:
4159                     ; 1215 }
4162  04cc 81            	ret
4198                     ; 1224 void TIM1_OC1PreloadConfig(FunctionalState NewState)
4198                     ; 1225 {
4199                     	switch	.text
4200  04cd               _TIM1_OC1PreloadConfig:
4204                     ; 1227     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4206                     ; 1230     if (NewState != DISABLE)
4208  04cd 4d            	tnz	a
4209  04ce 2706          	jreq	L3412
4210                     ; 1232         TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
4212  04d0 72165258      	bset	21080,#3
4214  04d4 2004          	jra	L5412
4215  04d6               L3412:
4216                     ; 1236         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4218  04d6 72175258      	bres	21080,#3
4219  04da               L5412:
4220                     ; 1238 }
4223  04da 81            	ret
4259                     ; 1247 void TIM1_OC2PreloadConfig(FunctionalState NewState)
4259                     ; 1248 {
4260                     	switch	.text
4261  04db               _TIM1_OC2PreloadConfig:
4265                     ; 1250     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4267                     ; 1253     if (NewState != DISABLE)
4269  04db 4d            	tnz	a
4270  04dc 2706          	jreq	L5612
4271                     ; 1255         TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
4273  04de 72165259      	bset	21081,#3
4275  04e2 2004          	jra	L7612
4276  04e4               L5612:
4277                     ; 1259         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4279  04e4 72175259      	bres	21081,#3
4280  04e8               L7612:
4281                     ; 1261 }
4284  04e8 81            	ret
4320                     ; 1270 void TIM1_OC3PreloadConfig(FunctionalState NewState)
4320                     ; 1271 {
4321                     	switch	.text
4322  04e9               _TIM1_OC3PreloadConfig:
4326                     ; 1273     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4328                     ; 1276     if (NewState != DISABLE)
4330  04e9 4d            	tnz	a
4331  04ea 2706          	jreq	L7022
4332                     ; 1278         TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
4334  04ec 7216525a      	bset	21082,#3
4336  04f0 2004          	jra	L1122
4337  04f2               L7022:
4338                     ; 1282         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4340  04f2 7217525a      	bres	21082,#3
4341  04f6               L1122:
4342                     ; 1284 }
4345  04f6 81            	ret
4381                     ; 1294 void TIM1_OC4PreloadConfig(FunctionalState NewState)
4381                     ; 1295 {
4382                     	switch	.text
4383  04f7               _TIM1_OC4PreloadConfig:
4387                     ; 1297     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4389                     ; 1300     if (NewState != DISABLE)
4391  04f7 4d            	tnz	a
4392  04f8 2706          	jreq	L1322
4393                     ; 1302         TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
4395  04fa 7216525b      	bset	21083,#3
4397  04fe 2004          	jra	L3322
4398  0500               L1322:
4399                     ; 1306         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
4401  0500 7217525b      	bres	21083,#3
4402  0504               L3322:
4403                     ; 1308 }
4406  0504 81            	ret
4441                     ; 1316 void TIM1_OC1FastConfig(FunctionalState NewState)
4441                     ; 1317 {
4442                     	switch	.text
4443  0505               _TIM1_OC1FastConfig:
4447                     ; 1319     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4449                     ; 1322     if (NewState != DISABLE)
4451  0505 4d            	tnz	a
4452  0506 2706          	jreq	L3522
4453                     ; 1324         TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
4455  0508 72145258      	bset	21080,#2
4457  050c 2004          	jra	L5522
4458  050e               L3522:
4459                     ; 1328         TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4461  050e 72155258      	bres	21080,#2
4462  0512               L5522:
4463                     ; 1330 }
4466  0512 81            	ret
4501                     ; 1340 void TIM1_OC2FastConfig(FunctionalState NewState)
4501                     ; 1341 {
4502                     	switch	.text
4503  0513               _TIM1_OC2FastConfig:
4507                     ; 1343     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4509                     ; 1346     if (NewState != DISABLE)
4511  0513 4d            	tnz	a
4512  0514 2706          	jreq	L5722
4513                     ; 1348         TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
4515  0516 72145259      	bset	21081,#2
4517  051a 2004          	jra	L7722
4518  051c               L5722:
4519                     ; 1352         TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4521  051c 72155259      	bres	21081,#2
4522  0520               L7722:
4523                     ; 1354 }
4526  0520 81            	ret
4561                     ; 1363 void TIM1_OC3FastConfig(FunctionalState NewState)
4561                     ; 1364 {
4562                     	switch	.text
4563  0521               _TIM1_OC3FastConfig:
4567                     ; 1366     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4569                     ; 1369     if (NewState != DISABLE)
4571  0521 4d            	tnz	a
4572  0522 2706          	jreq	L7132
4573                     ; 1371         TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
4575  0524 7214525a      	bset	21082,#2
4577  0528 2004          	jra	L1232
4578  052a               L7132:
4579                     ; 1375         TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4581  052a 7215525a      	bres	21082,#2
4582  052e               L1232:
4583                     ; 1377 }
4586  052e 81            	ret
4621                     ; 1386 void TIM1_OC4FastConfig(FunctionalState NewState)
4621                     ; 1387 {
4622                     	switch	.text
4623  052f               _TIM1_OC4FastConfig:
4627                     ; 1389     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4629                     ; 1392     if (NewState != DISABLE)
4631  052f 4d            	tnz	a
4632  0530 2706          	jreq	L1432
4633                     ; 1394         TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
4635  0532 7214525b      	bset	21083,#2
4637  0536 2004          	jra	L3432
4638  0538               L1432:
4639                     ; 1398         TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
4641  0538 7215525b      	bres	21083,#2
4642  053c               L3432:
4643                     ; 1400 }
4646  053c 81            	ret
4751                     ; 1417 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
4751                     ; 1418 {
4752                     	switch	.text
4753  053d               _TIM1_GenerateEvent:
4757                     ; 1420     assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
4759                     ; 1423     TIM1->EGR = (uint8_t)TIM1_EventSource;
4761  053d c75257        	ld	21079,a
4762                     ; 1424 }
4765  0540 81            	ret
4801                     ; 1435 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4801                     ; 1436 {
4802                     	switch	.text
4803  0541               _TIM1_OC1PolarityConfig:
4807                     ; 1438     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4809                     ; 1441     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4811  0541 4d            	tnz	a
4812  0542 2706          	jreq	L5242
4813                     ; 1443         TIM1->CCER1 |= TIM1_CCER1_CC1P;
4815  0544 7212525c      	bset	21084,#1
4817  0548 2004          	jra	L7242
4818  054a               L5242:
4819                     ; 1447         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4821  054a 7213525c      	bres	21084,#1
4822  054e               L7242:
4823                     ; 1449 }
4826  054e 81            	ret
4862                     ; 1460 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4862                     ; 1461 {
4863                     	switch	.text
4864  054f               _TIM1_OC1NPolarityConfig:
4868                     ; 1463     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4870                     ; 1466     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4872  054f 4d            	tnz	a
4873  0550 2706          	jreq	L7442
4874                     ; 1468         TIM1->CCER1 |= TIM1_CCER1_CC1NP;
4876  0552 7216525c      	bset	21084,#3
4878  0556 2004          	jra	L1542
4879  0558               L7442:
4880                     ; 1472         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
4882  0558 7217525c      	bres	21084,#3
4883  055c               L1542:
4884                     ; 1474 }
4887  055c 81            	ret
4923                     ; 1485 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
4923                     ; 1486 {
4924                     	switch	.text
4925  055d               _TIM1_OC2PolarityConfig:
4929                     ; 1488     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
4931                     ; 1491     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
4933  055d 4d            	tnz	a
4934  055e 2706          	jreq	L1742
4935                     ; 1493         TIM1->CCER1 |= TIM1_CCER1_CC2P;
4937  0560 721a525c      	bset	21084,#5
4939  0564 2004          	jra	L3742
4940  0566               L1742:
4941                     ; 1497         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4943  0566 721b525c      	bres	21084,#5
4944  056a               L3742:
4945                     ; 1499 }
4948  056a 81            	ret
4984                     ; 1509 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
4984                     ; 1510 {
4985                     	switch	.text
4986  056b               _TIM1_OC2NPolarityConfig:
4990                     ; 1512     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
4992                     ; 1515     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
4994  056b 4d            	tnz	a
4995  056c 2706          	jreq	L3152
4996                     ; 1517         TIM1->CCER1 |= TIM1_CCER1_CC2NP;
4998  056e 721e525c      	bset	21084,#7
5000  0572 2004          	jra	L5152
5001  0574               L3152:
5002                     ; 1521         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
5004  0574 721f525c      	bres	21084,#7
5005  0578               L5152:
5006                     ; 1523 }
5009  0578 81            	ret
5045                     ; 1534 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5045                     ; 1535 {
5046                     	switch	.text
5047  0579               _TIM1_OC3PolarityConfig:
5051                     ; 1537     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5053                     ; 1540     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5055  0579 4d            	tnz	a
5056  057a 2706          	jreq	L5352
5057                     ; 1542         TIM1->CCER2 |= TIM1_CCER2_CC3P;
5059  057c 7212525d      	bset	21085,#1
5061  0580 2004          	jra	L7352
5062  0582               L5352:
5063                     ; 1546         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
5065  0582 7213525d      	bres	21085,#1
5066  0586               L7352:
5067                     ; 1548 }
5070  0586 81            	ret
5106                     ; 1559 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
5106                     ; 1560 {
5107                     	switch	.text
5108  0587               _TIM1_OC3NPolarityConfig:
5112                     ; 1562     assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
5114                     ; 1565     if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
5116  0587 4d            	tnz	a
5117  0588 2706          	jreq	L7552
5118                     ; 1567         TIM1->CCER2 |= TIM1_CCER2_CC3NP;
5120  058a 7216525d      	bset	21085,#3
5122  058e 2004          	jra	L1652
5123  0590               L7552:
5124                     ; 1571         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
5126  0590 7217525d      	bres	21085,#3
5127  0594               L1652:
5128                     ; 1573 }
5131  0594 81            	ret
5167                     ; 1583 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
5167                     ; 1584 {
5168                     	switch	.text
5169  0595               _TIM1_OC4PolarityConfig:
5173                     ; 1586     assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
5175                     ; 1589     if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
5177  0595 4d            	tnz	a
5178  0596 2706          	jreq	L1062
5179                     ; 1591         TIM1->CCER2 |= TIM1_CCER2_CC4P;
5181  0598 721a525d      	bset	21085,#5
5183  059c 2004          	jra	L3062
5184  059e               L1062:
5185                     ; 1595         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
5187  059e 721b525d      	bres	21085,#5
5188  05a2               L3062:
5189                     ; 1597 }
5192  05a2 81            	ret
5237                     ; 1612 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5237                     ; 1613 {
5238                     	switch	.text
5239  05a3               _TIM1_CCxCmd:
5241  05a3 89            	pushw	x
5242       00000000      OFST:	set	0
5245                     ; 1615     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5247                     ; 1616     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5249                     ; 1618     if (TIM1_Channel == TIM1_CHANNEL_1)
5251  05a4 9e            	ld	a,xh
5252  05a5 4d            	tnz	a
5253  05a6 2610          	jrne	L7262
5254                     ; 1621         if (NewState != DISABLE)
5256  05a8 9f            	ld	a,xl
5257  05a9 4d            	tnz	a
5258  05aa 2706          	jreq	L1362
5259                     ; 1623             TIM1->CCER1 |= TIM1_CCER1_CC1E;
5261  05ac 7210525c      	bset	21084,#0
5263  05b0 2040          	jra	L5362
5264  05b2               L1362:
5265                     ; 1627             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5267  05b2 7211525c      	bres	21084,#0
5268  05b6 203a          	jra	L5362
5269  05b8               L7262:
5270                     ; 1631     else if (TIM1_Channel == TIM1_CHANNEL_2)
5272  05b8 7b01          	ld	a,(OFST+1,sp)
5273  05ba a101          	cp	a,#1
5274  05bc 2610          	jrne	L7362
5275                     ; 1634         if (NewState != DISABLE)
5277  05be 0d02          	tnz	(OFST+2,sp)
5278  05c0 2706          	jreq	L1462
5279                     ; 1636             TIM1->CCER1 |= TIM1_CCER1_CC2E;
5281  05c2 7218525c      	bset	21084,#4
5283  05c6 202a          	jra	L5362
5284  05c8               L1462:
5285                     ; 1640             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5287  05c8 7219525c      	bres	21084,#4
5288  05cc 2024          	jra	L5362
5289  05ce               L7362:
5290                     ; 1643     else if (TIM1_Channel == TIM1_CHANNEL_3)
5292  05ce 7b01          	ld	a,(OFST+1,sp)
5293  05d0 a102          	cp	a,#2
5294  05d2 2610          	jrne	L7462
5295                     ; 1646         if (NewState != DISABLE)
5297  05d4 0d02          	tnz	(OFST+2,sp)
5298  05d6 2706          	jreq	L1562
5299                     ; 1648             TIM1->CCER2 |= TIM1_CCER2_CC3E;
5301  05d8 7210525d      	bset	21085,#0
5303  05dc 2014          	jra	L5362
5304  05de               L1562:
5305                     ; 1652             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5307  05de 7211525d      	bres	21085,#0
5308  05e2 200e          	jra	L5362
5309  05e4               L7462:
5310                     ; 1658         if (NewState != DISABLE)
5312  05e4 0d02          	tnz	(OFST+2,sp)
5313  05e6 2706          	jreq	L7562
5314                     ; 1660             TIM1->CCER2 |= TIM1_CCER2_CC4E;
5316  05e8 7218525d      	bset	21085,#4
5318  05ec 2004          	jra	L5362
5319  05ee               L7562:
5320                     ; 1664             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5322  05ee 7219525d      	bres	21085,#4
5323  05f2               L5362:
5324                     ; 1667 }
5327  05f2 85            	popw	x
5328  05f3 81            	ret
5373                     ; 1680 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
5373                     ; 1681 {
5374                     	switch	.text
5375  05f4               _TIM1_CCxNCmd:
5377  05f4 89            	pushw	x
5378       00000000      OFST:	set	0
5381                     ; 1683     assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
5383                     ; 1684     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5385                     ; 1686     if (TIM1_Channel == TIM1_CHANNEL_1)
5387  05f5 9e            	ld	a,xh
5388  05f6 4d            	tnz	a
5389  05f7 2610          	jrne	L5072
5390                     ; 1689         if (NewState != DISABLE)
5392  05f9 9f            	ld	a,xl
5393  05fa 4d            	tnz	a
5394  05fb 2706          	jreq	L7072
5395                     ; 1691             TIM1->CCER1 |= TIM1_CCER1_CC1NE;
5397  05fd 7214525c      	bset	21084,#2
5399  0601 202a          	jra	L3172
5400  0603               L7072:
5401                     ; 1695             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
5403  0603 7215525c      	bres	21084,#2
5404  0607 2024          	jra	L3172
5405  0609               L5072:
5406                     ; 1698     else if (TIM1_Channel == TIM1_CHANNEL_2)
5408  0609 7b01          	ld	a,(OFST+1,sp)
5409  060b a101          	cp	a,#1
5410  060d 2610          	jrne	L5172
5411                     ; 1701         if (NewState != DISABLE)
5413  060f 0d02          	tnz	(OFST+2,sp)
5414  0611 2706          	jreq	L7172
5415                     ; 1703             TIM1->CCER1 |= TIM1_CCER1_CC2NE;
5417  0613 721c525c      	bset	21084,#6
5419  0617 2014          	jra	L3172
5420  0619               L7172:
5421                     ; 1707             TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
5423  0619 721d525c      	bres	21084,#6
5424  061d 200e          	jra	L3172
5425  061f               L5172:
5426                     ; 1713         if (NewState != DISABLE)
5428  061f 0d02          	tnz	(OFST+2,sp)
5429  0621 2706          	jreq	L5272
5430                     ; 1715             TIM1->CCER2 |= TIM1_CCER2_CC3NE;
5432  0623 7214525d      	bset	21085,#2
5434  0627 2004          	jra	L3172
5435  0629               L5272:
5436                     ; 1719             TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
5438  0629 7215525d      	bres	21085,#2
5439  062d               L3172:
5440                     ; 1722 }
5443  062d 85            	popw	x
5444  062e 81            	ret
5489                     ; 1746 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
5489                     ; 1747 {
5490                     	switch	.text
5491  062f               _TIM1_SelectOCxM:
5493  062f 89            	pushw	x
5494       00000000      OFST:	set	0
5497                     ; 1749     assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
5499                     ; 1750     assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
5501                     ; 1752     if (TIM1_Channel == TIM1_CHANNEL_1)
5503  0630 9e            	ld	a,xh
5504  0631 4d            	tnz	a
5505  0632 2610          	jrne	L3572
5506                     ; 1755         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
5508  0634 7211525c      	bres	21084,#0
5509                     ; 1758         TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
5509                     ; 1759                                 | (uint8_t)TIM1_OCMode);
5511  0638 c65258        	ld	a,21080
5512  063b a48f          	and	a,#143
5513  063d 1a02          	or	a,(OFST+2,sp)
5514  063f c75258        	ld	21080,a
5516  0642 203a          	jra	L5572
5517  0644               L3572:
5518                     ; 1761     else if (TIM1_Channel == TIM1_CHANNEL_2)
5520  0644 7b01          	ld	a,(OFST+1,sp)
5521  0646 a101          	cp	a,#1
5522  0648 2610          	jrne	L7572
5523                     ; 1764         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
5525  064a 7219525c      	bres	21084,#4
5526                     ; 1767         TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5526                     ; 1768                                 | (uint8_t)TIM1_OCMode);
5528  064e c65259        	ld	a,21081
5529  0651 a48f          	and	a,#143
5530  0653 1a02          	or	a,(OFST+2,sp)
5531  0655 c75259        	ld	21081,a
5533  0658 2024          	jra	L5572
5534  065a               L7572:
5535                     ; 1770     else if (TIM1_Channel == TIM1_CHANNEL_3)
5537  065a 7b01          	ld	a,(OFST+1,sp)
5538  065c a102          	cp	a,#2
5539  065e 2610          	jrne	L3672
5540                     ; 1773         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
5542  0660 7211525d      	bres	21085,#0
5543                     ; 1776         TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
5543                     ; 1777                                 | (uint8_t)TIM1_OCMode);
5545  0664 c6525a        	ld	a,21082
5546  0667 a48f          	and	a,#143
5547  0669 1a02          	or	a,(OFST+2,sp)
5548  066b c7525a        	ld	21082,a
5550  066e 200e          	jra	L5572
5551  0670               L3672:
5552                     ; 1782         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
5554  0670 7219525d      	bres	21085,#4
5555                     ; 1785         TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5555                     ; 1786                                 | (uint8_t)TIM1_OCMode);
5557  0674 c6525b        	ld	a,21083
5558  0677 a48f          	and	a,#143
5559  0679 1a02          	or	a,(OFST+2,sp)
5560  067b c7525b        	ld	21083,a
5561  067e               L5572:
5562                     ; 1788 }
5565  067e 85            	popw	x
5566  067f 81            	ret
5600                     ; 1797 void TIM1_SetCounter(uint16_t Counter)
5600                     ; 1798 {
5601                     	switch	.text
5602  0680               _TIM1_SetCounter:
5606                     ; 1800     TIM1->CNTRH = (uint8_t)(Counter >> 8);
5608  0680 9e            	ld	a,xh
5609  0681 c7525e        	ld	21086,a
5610                     ; 1801     TIM1->CNTRL = (uint8_t)(Counter);
5612  0684 9f            	ld	a,xl
5613  0685 c7525f        	ld	21087,a
5614                     ; 1803 }
5617  0688 81            	ret
5651                     ; 1812 void TIM1_SetAutoreload(uint16_t Autoreload)
5651                     ; 1813 {
5652                     	switch	.text
5653  0689               _TIM1_SetAutoreload:
5657                     ; 1816     TIM1->ARRH = (uint8_t)(Autoreload >> 8);
5659  0689 9e            	ld	a,xh
5660  068a c75262        	ld	21090,a
5661                     ; 1817     TIM1->ARRL = (uint8_t)(Autoreload);
5663  068d 9f            	ld	a,xl
5664  068e c75263        	ld	21091,a
5665                     ; 1819 }
5668  0691 81            	ret
5702                     ; 1828 void TIM1_SetCompare1(uint16_t Compare1)
5702                     ; 1829 {
5703                     	switch	.text
5704  0692               _TIM1_SetCompare1:
5708                     ; 1831     TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
5710  0692 9e            	ld	a,xh
5711  0693 c75265        	ld	21093,a
5712                     ; 1832     TIM1->CCR1L = (uint8_t)(Compare1);
5714  0696 9f            	ld	a,xl
5715  0697 c75266        	ld	21094,a
5716                     ; 1834 }
5719  069a 81            	ret
5753                     ; 1843 void TIM1_SetCompare2(uint16_t Compare2)
5753                     ; 1844 {
5754                     	switch	.text
5755  069b               _TIM1_SetCompare2:
5759                     ; 1846     TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
5761  069b 9e            	ld	a,xh
5762  069c c75267        	ld	21095,a
5763                     ; 1847     TIM1->CCR2L = (uint8_t)(Compare2);
5765  069f 9f            	ld	a,xl
5766  06a0 c75268        	ld	21096,a
5767                     ; 1849 }
5770  06a3 81            	ret
5804                     ; 1858 void TIM1_SetCompare3(uint16_t Compare3)
5804                     ; 1859 {
5805                     	switch	.text
5806  06a4               _TIM1_SetCompare3:
5810                     ; 1861     TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
5812  06a4 9e            	ld	a,xh
5813  06a5 c75269        	ld	21097,a
5814                     ; 1862     TIM1->CCR3L = (uint8_t)(Compare3);
5816  06a8 9f            	ld	a,xl
5817  06a9 c7526a        	ld	21098,a
5818                     ; 1864 }
5821  06ac 81            	ret
5855                     ; 1873 void TIM1_SetCompare4(uint16_t Compare4)
5855                     ; 1874 {
5856                     	switch	.text
5857  06ad               _TIM1_SetCompare4:
5861                     ; 1876     TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
5863  06ad 9e            	ld	a,xh
5864  06ae c7526b        	ld	21099,a
5865                     ; 1877     TIM1->CCR4L = (uint8_t)(Compare4);
5867  06b1 9f            	ld	a,xl
5868  06b2 c7526c        	ld	21100,a
5869                     ; 1878 }
5872  06b5 81            	ret
5908                     ; 1891 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
5908                     ; 1892 {
5909                     	switch	.text
5910  06b6               _TIM1_SetIC1Prescaler:
5912  06b6 88            	push	a
5913       00000000      OFST:	set	0
5916                     ; 1894     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
5918                     ; 1897     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
5918                     ; 1898                             | (uint8_t)TIM1_IC1Prescaler);
5920  06b7 c65258        	ld	a,21080
5921  06ba a4f3          	and	a,#243
5922  06bc 1a01          	or	a,(OFST+1,sp)
5923  06be c75258        	ld	21080,a
5924                     ; 1900 }
5927  06c1 84            	pop	a
5928  06c2 81            	ret
5964                     ; 1912 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
5964                     ; 1913 {
5965                     	switch	.text
5966  06c3               _TIM1_SetIC2Prescaler:
5968  06c3 88            	push	a
5969       00000000      OFST:	set	0
5972                     ; 1916     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
5974                     ; 1919     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
5974                     ; 1920                             | (uint8_t)TIM1_IC2Prescaler);
5976  06c4 c65259        	ld	a,21081
5977  06c7 a4f3          	and	a,#243
5978  06c9 1a01          	or	a,(OFST+1,sp)
5979  06cb c75259        	ld	21081,a
5980                     ; 1921 }
5983  06ce 84            	pop	a
5984  06cf 81            	ret
6020                     ; 1934 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
6020                     ; 1935 {
6021                     	switch	.text
6022  06d0               _TIM1_SetIC3Prescaler:
6024  06d0 88            	push	a
6025       00000000      OFST:	set	0
6028                     ; 1938     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
6030                     ; 1941     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
6030                     ; 1942                             (uint8_t)TIM1_IC3Prescaler);
6032  06d1 c6525a        	ld	a,21082
6033  06d4 a4f3          	and	a,#243
6034  06d6 1a01          	or	a,(OFST+1,sp)
6035  06d8 c7525a        	ld	21082,a
6036                     ; 1943 }
6039  06db 84            	pop	a
6040  06dc 81            	ret
6076                     ; 1955 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
6076                     ; 1956 {
6077                     	switch	.text
6078  06dd               _TIM1_SetIC4Prescaler:
6080  06dd 88            	push	a
6081       00000000      OFST:	set	0
6084                     ; 1959     assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
6086                     ; 1962     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
6086                     ; 1963                             (uint8_t)TIM1_IC4Prescaler);
6088  06de c6525b        	ld	a,21083
6089  06e1 a4f3          	and	a,#243
6090  06e3 1a01          	or	a,(OFST+1,sp)
6091  06e5 c7525b        	ld	21083,a
6092                     ; 1964 }
6095  06e8 84            	pop	a
6096  06e9 81            	ret
6148                     ; 1971 uint16_t TIM1_GetCapture1(void)
6148                     ; 1972 {
6149                     	switch	.text
6150  06ea               _TIM1_GetCapture1:
6152  06ea 5204          	subw	sp,#4
6153       00000004      OFST:	set	4
6156                     ; 1975     uint16_t tmpccr1 = 0;
6158                     ; 1976     uint8_t tmpccr1l=0, tmpccr1h=0;
6162                     ; 1978     tmpccr1h = TIM1->CCR1H;
6164  06ec c65265        	ld	a,21093
6165  06ef 6b02          	ld	(OFST-2,sp),a
6167                     ; 1979     tmpccr1l = TIM1->CCR1L;
6169  06f1 c65266        	ld	a,21094
6170  06f4 6b01          	ld	(OFST-3,sp),a
6172                     ; 1981     tmpccr1 = (uint16_t)(tmpccr1l);
6174  06f6 7b01          	ld	a,(OFST-3,sp)
6175  06f8 5f            	clrw	x
6176  06f9 97            	ld	xl,a
6177  06fa 1f03          	ldw	(OFST-1,sp),x
6179                     ; 1982     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
6181  06fc 7b02          	ld	a,(OFST-2,sp)
6182  06fe 5f            	clrw	x
6183  06ff 97            	ld	xl,a
6184  0700 4f            	clr	a
6185  0701 02            	rlwa	x,a
6186  0702 01            	rrwa	x,a
6187  0703 1a04          	or	a,(OFST+0,sp)
6188  0705 01            	rrwa	x,a
6189  0706 1a03          	or	a,(OFST-1,sp)
6190  0708 01            	rrwa	x,a
6191  0709 1f03          	ldw	(OFST-1,sp),x
6193                     ; 1984     return (uint16_t)tmpccr1;
6195  070b 1e03          	ldw	x,(OFST-1,sp)
6198  070d 5b04          	addw	sp,#4
6199  070f 81            	ret
6251                     ; 1992 uint16_t TIM1_GetCapture2(void)
6251                     ; 1993 {
6252                     	switch	.text
6253  0710               _TIM1_GetCapture2:
6255  0710 5204          	subw	sp,#4
6256       00000004      OFST:	set	4
6259                     ; 1996     uint16_t tmpccr2 = 0;
6261                     ; 1997     uint8_t tmpccr2l=0, tmpccr2h=0;
6265                     ; 1999     tmpccr2h = TIM1->CCR2H;
6267  0712 c65267        	ld	a,21095
6268  0715 6b02          	ld	(OFST-2,sp),a
6270                     ; 2000     tmpccr2l = TIM1->CCR2L;
6272  0717 c65268        	ld	a,21096
6273  071a 6b01          	ld	(OFST-3,sp),a
6275                     ; 2002     tmpccr2 = (uint16_t)(tmpccr2l);
6277  071c 7b01          	ld	a,(OFST-3,sp)
6278  071e 5f            	clrw	x
6279  071f 97            	ld	xl,a
6280  0720 1f03          	ldw	(OFST-1,sp),x
6282                     ; 2003     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
6284  0722 7b02          	ld	a,(OFST-2,sp)
6285  0724 5f            	clrw	x
6286  0725 97            	ld	xl,a
6287  0726 4f            	clr	a
6288  0727 02            	rlwa	x,a
6289  0728 01            	rrwa	x,a
6290  0729 1a04          	or	a,(OFST+0,sp)
6291  072b 01            	rrwa	x,a
6292  072c 1a03          	or	a,(OFST-1,sp)
6293  072e 01            	rrwa	x,a
6294  072f 1f03          	ldw	(OFST-1,sp),x
6296                     ; 2005     return (uint16_t)tmpccr2;
6298  0731 1e03          	ldw	x,(OFST-1,sp)
6301  0733 5b04          	addw	sp,#4
6302  0735 81            	ret
6354                     ; 2013 uint16_t TIM1_GetCapture3(void)
6354                     ; 2014 {
6355                     	switch	.text
6356  0736               _TIM1_GetCapture3:
6358  0736 5204          	subw	sp,#4
6359       00000004      OFST:	set	4
6362                     ; 2016     uint16_t tmpccr3 = 0;
6364                     ; 2017     uint8_t tmpccr3l=0, tmpccr3h=0;
6368                     ; 2019     tmpccr3h = TIM1->CCR3H;
6370  0738 c65269        	ld	a,21097
6371  073b 6b02          	ld	(OFST-2,sp),a
6373                     ; 2020     tmpccr3l = TIM1->CCR3L;
6375  073d c6526a        	ld	a,21098
6376  0740 6b01          	ld	(OFST-3,sp),a
6378                     ; 2022     tmpccr3 = (uint16_t)(tmpccr3l);
6380  0742 7b01          	ld	a,(OFST-3,sp)
6381  0744 5f            	clrw	x
6382  0745 97            	ld	xl,a
6383  0746 1f03          	ldw	(OFST-1,sp),x
6385                     ; 2023     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
6387  0748 7b02          	ld	a,(OFST-2,sp)
6388  074a 5f            	clrw	x
6389  074b 97            	ld	xl,a
6390  074c 4f            	clr	a
6391  074d 02            	rlwa	x,a
6392  074e 01            	rrwa	x,a
6393  074f 1a04          	or	a,(OFST+0,sp)
6394  0751 01            	rrwa	x,a
6395  0752 1a03          	or	a,(OFST-1,sp)
6396  0754 01            	rrwa	x,a
6397  0755 1f03          	ldw	(OFST-1,sp),x
6399                     ; 2025     return (uint16_t)tmpccr3;
6401  0757 1e03          	ldw	x,(OFST-1,sp)
6404  0759 5b04          	addw	sp,#4
6405  075b 81            	ret
6457                     ; 2033 uint16_t TIM1_GetCapture4(void)
6457                     ; 2034 {
6458                     	switch	.text
6459  075c               _TIM1_GetCapture4:
6461  075c 5204          	subw	sp,#4
6462       00000004      OFST:	set	4
6465                     ; 2036     uint16_t tmpccr4 = 0;
6467                     ; 2037     uint8_t tmpccr4l=0, tmpccr4h=0;
6471                     ; 2039     tmpccr4h = TIM1->CCR4H;
6473  075e c6526b        	ld	a,21099
6474  0761 6b02          	ld	(OFST-2,sp),a
6476                     ; 2040     tmpccr4l = TIM1->CCR4L;
6478  0763 c6526c        	ld	a,21100
6479  0766 6b01          	ld	(OFST-3,sp),a
6481                     ; 2042     tmpccr4 = (uint16_t)(tmpccr4l);
6483  0768 7b01          	ld	a,(OFST-3,sp)
6484  076a 5f            	clrw	x
6485  076b 97            	ld	xl,a
6486  076c 1f03          	ldw	(OFST-1,sp),x
6488                     ; 2043     tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
6490  076e 7b02          	ld	a,(OFST-2,sp)
6491  0770 5f            	clrw	x
6492  0771 97            	ld	xl,a
6493  0772 4f            	clr	a
6494  0773 02            	rlwa	x,a
6495  0774 01            	rrwa	x,a
6496  0775 1a04          	or	a,(OFST+0,sp)
6497  0777 01            	rrwa	x,a
6498  0778 1a03          	or	a,(OFST-1,sp)
6499  077a 01            	rrwa	x,a
6500  077b 1f03          	ldw	(OFST-1,sp),x
6502                     ; 2045     return (uint16_t)tmpccr4;
6504  077d 1e03          	ldw	x,(OFST-1,sp)
6507  077f 5b04          	addw	sp,#4
6508  0781 81            	ret
6542                     ; 2053 uint16_t TIM1_GetCounter(void)
6542                     ; 2054 {
6543                     	switch	.text
6544  0782               _TIM1_GetCounter:
6546  0782 89            	pushw	x
6547       00000002      OFST:	set	2
6550                     ; 2055   uint16_t tmpcntr = 0;
6552                     ; 2057   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
6554  0783 c6525e        	ld	a,21086
6555  0786 5f            	clrw	x
6556  0787 97            	ld	xl,a
6557  0788 4f            	clr	a
6558  0789 02            	rlwa	x,a
6559  078a 1f01          	ldw	(OFST-1,sp),x
6561                     ; 2060     return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
6563  078c c6525f        	ld	a,21087
6564  078f 5f            	clrw	x
6565  0790 97            	ld	xl,a
6566  0791 01            	rrwa	x,a
6567  0792 1a02          	or	a,(OFST+0,sp)
6568  0794 01            	rrwa	x,a
6569  0795 1a01          	or	a,(OFST-1,sp)
6570  0797 01            	rrwa	x,a
6573  0798 5b02          	addw	sp,#2
6574  079a 81            	ret
6608                     ; 2068 uint16_t TIM1_GetPrescaler(void)
6608                     ; 2069 {
6609                     	switch	.text
6610  079b               _TIM1_GetPrescaler:
6612  079b 89            	pushw	x
6613       00000002      OFST:	set	2
6616                     ; 2070    uint16_t temp = 0;
6618                     ; 2072    temp = ((uint16_t)TIM1->PSCRH << 8);
6620  079c c65260        	ld	a,21088
6621  079f 5f            	clrw	x
6622  07a0 97            	ld	xl,a
6623  07a1 4f            	clr	a
6624  07a2 02            	rlwa	x,a
6625  07a3 1f01          	ldw	(OFST-1,sp),x
6627                     ; 2075     return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
6629  07a5 c65261        	ld	a,21089
6630  07a8 5f            	clrw	x
6631  07a9 97            	ld	xl,a
6632  07aa 01            	rrwa	x,a
6633  07ab 1a02          	or	a,(OFST+0,sp)
6634  07ad 01            	rrwa	x,a
6635  07ae 1a01          	or	a,(OFST-1,sp)
6636  07b0 01            	rrwa	x,a
6639  07b1 5b02          	addw	sp,#2
6640  07b3 81            	ret
6814                     ; 2096 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
6814                     ; 2097 {
6815                     	switch	.text
6816  07b4               _TIM1_GetFlagStatus:
6818  07b4 89            	pushw	x
6819  07b5 89            	pushw	x
6820       00000002      OFST:	set	2
6823                     ; 2098     FlagStatus bitstatus = RESET;
6825                     ; 2099     uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
6829                     ; 2102     assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
6831                     ; 2104     tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
6833  07b6 9f            	ld	a,xl
6834  07b7 c45255        	and	a,21077
6835  07ba 6b01          	ld	(OFST-1,sp),a
6837                     ; 2105     tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
6839  07bc 7b03          	ld	a,(OFST+1,sp)
6840  07be 6b02          	ld	(OFST+0,sp),a
6842                     ; 2107     if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
6844  07c0 c65256        	ld	a,21078
6845  07c3 1402          	and	a,(OFST+0,sp)
6846  07c5 1a01          	or	a,(OFST-1,sp)
6847  07c7 2706          	jreq	L5643
6848                     ; 2109         bitstatus = SET;
6850  07c9 a601          	ld	a,#1
6851  07cb 6b02          	ld	(OFST+0,sp),a
6854  07cd 2002          	jra	L7643
6855  07cf               L5643:
6856                     ; 2113         bitstatus = RESET;
6858  07cf 0f02          	clr	(OFST+0,sp)
6860  07d1               L7643:
6861                     ; 2115     return (FlagStatus)(bitstatus);
6863  07d1 7b02          	ld	a,(OFST+0,sp)
6866  07d3 5b04          	addw	sp,#4
6867  07d5 81            	ret
6902                     ; 2136 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
6902                     ; 2137 {
6903                     	switch	.text
6904  07d6               _TIM1_ClearFlag:
6906  07d6 89            	pushw	x
6907       00000000      OFST:	set	0
6910                     ; 2139     assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
6912                     ; 2142     TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
6914  07d7 9f            	ld	a,xl
6915  07d8 43            	cpl	a
6916  07d9 c75255        	ld	21077,a
6917                     ; 2143     TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
6917                     ; 2144                           (uint8_t)0x1E);
6919  07dc 7b01          	ld	a,(OFST+1,sp)
6920  07de 43            	cpl	a
6921  07df a41e          	and	a,#30
6922  07e1 c75256        	ld	21078,a
6923                     ; 2145 }
6926  07e4 85            	popw	x
6927  07e5 81            	ret
6991                     ; 2161 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
6991                     ; 2162 {
6992                     	switch	.text
6993  07e6               _TIM1_GetITStatus:
6995  07e6 88            	push	a
6996  07e7 89            	pushw	x
6997       00000002      OFST:	set	2
7000                     ; 2163     ITStatus bitstatus = RESET;
7002                     ; 2164     uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
7006                     ; 2167     assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
7008                     ; 2169     TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
7010  07e8 c45255        	and	a,21077
7011  07eb 6b01          	ld	(OFST-1,sp),a
7013                     ; 2171     TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
7015  07ed c65254        	ld	a,21076
7016  07f0 1403          	and	a,(OFST+1,sp)
7017  07f2 6b02          	ld	(OFST+0,sp),a
7019                     ; 2173     if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
7021  07f4 0d01          	tnz	(OFST-1,sp)
7022  07f6 270a          	jreq	L1453
7024  07f8 0d02          	tnz	(OFST+0,sp)
7025  07fa 2706          	jreq	L1453
7026                     ; 2175         bitstatus = SET;
7028  07fc a601          	ld	a,#1
7029  07fe 6b02          	ld	(OFST+0,sp),a
7032  0800 2002          	jra	L3453
7033  0802               L1453:
7034                     ; 2179         bitstatus = RESET;
7036  0802 0f02          	clr	(OFST+0,sp)
7038  0804               L3453:
7039                     ; 2181     return (ITStatus)(bitstatus);
7041  0804 7b02          	ld	a,(OFST+0,sp)
7044  0806 5b03          	addw	sp,#3
7045  0808 81            	ret
7081                     ; 2198 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
7081                     ; 2199 {
7082                     	switch	.text
7083  0809               _TIM1_ClearITPendingBit:
7087                     ; 2201     assert_param(IS_TIM1_IT_OK(TIM1_IT));
7089                     ; 2204     TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
7091  0809 43            	cpl	a
7092  080a c75255        	ld	21077,a
7093                     ; 2205 }
7096  080d 81            	ret
7148                     ; 2223 static void TI1_Config(uint8_t TIM1_ICPolarity,
7148                     ; 2224                        uint8_t TIM1_ICSelection,
7148                     ; 2225                        uint8_t TIM1_ICFilter)
7148                     ; 2226 {
7149                     	switch	.text
7150  080e               L3_TI1_Config:
7152  080e 89            	pushw	x
7153  080f 88            	push	a
7154       00000001      OFST:	set	1
7157                     ; 2229     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7159  0810 7211525c      	bres	21084,#0
7160                     ; 2232     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
7160                     ; 2233                             (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7162  0814 7b06          	ld	a,(OFST+5,sp)
7163  0816 97            	ld	xl,a
7164  0817 a610          	ld	a,#16
7165  0819 42            	mul	x,a
7166  081a 9f            	ld	a,xl
7167  081b 1a03          	or	a,(OFST+2,sp)
7168  081d 6b01          	ld	(OFST+0,sp),a
7170  081f c65258        	ld	a,21080
7171  0822 a40c          	and	a,#12
7172  0824 1a01          	or	a,(OFST+0,sp)
7173  0826 c75258        	ld	21080,a
7174                     ; 2236     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7176  0829 0d02          	tnz	(OFST+1,sp)
7177  082b 2706          	jreq	L1163
7178                     ; 2238         TIM1->CCER1 |= TIM1_CCER1_CC1P;
7180  082d 7212525c      	bset	21084,#1
7182  0831 2004          	jra	L3163
7183  0833               L1163:
7184                     ; 2242         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
7186  0833 7213525c      	bres	21084,#1
7187  0837               L3163:
7188                     ; 2246     TIM1->CCER1 |=  TIM1_CCER1_CC1E;
7190  0837 7210525c      	bset	21084,#0
7191                     ; 2247 }
7194  083b 5b03          	addw	sp,#3
7195  083d 81            	ret
7247                     ; 2265 static void TI2_Config(uint8_t TIM1_ICPolarity,
7247                     ; 2266                        uint8_t TIM1_ICSelection,
7247                     ; 2267                        uint8_t TIM1_ICFilter)
7247                     ; 2268 {
7248                     	switch	.text
7249  083e               L5_TI2_Config:
7251  083e 89            	pushw	x
7252  083f 88            	push	a
7253       00000001      OFST:	set	1
7256                     ; 2270     TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
7258  0840 7219525c      	bres	21084,#4
7259                     ; 2273     TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
7259                     ; 2274                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7261  0844 7b06          	ld	a,(OFST+5,sp)
7262  0846 97            	ld	xl,a
7263  0847 a610          	ld	a,#16
7264  0849 42            	mul	x,a
7265  084a 9f            	ld	a,xl
7266  084b 1a03          	or	a,(OFST+2,sp)
7267  084d 6b01          	ld	(OFST+0,sp),a
7269  084f c65259        	ld	a,21081
7270  0852 a40c          	and	a,#12
7271  0854 1a01          	or	a,(OFST+0,sp)
7272  0856 c75259        	ld	21081,a
7273                     ; 2276     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7275  0859 0d02          	tnz	(OFST+1,sp)
7276  085b 2706          	jreq	L3463
7277                     ; 2278         TIM1->CCER1 |= TIM1_CCER1_CC2P;
7279  085d 721a525c      	bset	21084,#5
7281  0861 2004          	jra	L5463
7282  0863               L3463:
7283                     ; 2282         TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
7285  0863 721b525c      	bres	21084,#5
7286  0867               L5463:
7287                     ; 2285     TIM1->CCER1 |=  TIM1_CCER1_CC2E;
7289  0867 7218525c      	bset	21084,#4
7290                     ; 2286 }
7293  086b 5b03          	addw	sp,#3
7294  086d 81            	ret
7346                     ; 2304 static void TI3_Config(uint8_t TIM1_ICPolarity,
7346                     ; 2305                        uint8_t TIM1_ICSelection,
7346                     ; 2306                        uint8_t TIM1_ICFilter)
7346                     ; 2307 {
7347                     	switch	.text
7348  086e               L7_TI3_Config:
7350  086e 89            	pushw	x
7351  086f 88            	push	a
7352       00000001      OFST:	set	1
7355                     ; 2309     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
7357  0870 7211525d      	bres	21085,#0
7358                     ; 2312     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
7358                     ; 2313                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7360  0874 7b06          	ld	a,(OFST+5,sp)
7361  0876 97            	ld	xl,a
7362  0877 a610          	ld	a,#16
7363  0879 42            	mul	x,a
7364  087a 9f            	ld	a,xl
7365  087b 1a03          	or	a,(OFST+2,sp)
7366  087d 6b01          	ld	(OFST+0,sp),a
7368  087f c6525a        	ld	a,21082
7369  0882 a40c          	and	a,#12
7370  0884 1a01          	or	a,(OFST+0,sp)
7371  0886 c7525a        	ld	21082,a
7372                     ; 2316     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7374  0889 0d02          	tnz	(OFST+1,sp)
7375  088b 2706          	jreq	L5763
7376                     ; 2318         TIM1->CCER2 |= TIM1_CCER2_CC3P;
7378  088d 7212525d      	bset	21085,#1
7380  0891 2004          	jra	L7763
7381  0893               L5763:
7382                     ; 2322         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
7384  0893 7213525d      	bres	21085,#1
7385  0897               L7763:
7386                     ; 2325     TIM1->CCER2 |=  TIM1_CCER2_CC3E;
7388  0897 7210525d      	bset	21085,#0
7389                     ; 2326 }
7392  089b 5b03          	addw	sp,#3
7393  089d 81            	ret
7445                     ; 2345 static void TI4_Config(uint8_t TIM1_ICPolarity,
7445                     ; 2346                        uint8_t TIM1_ICSelection,
7445                     ; 2347                        uint8_t TIM1_ICFilter)
7445                     ; 2348 {
7446                     	switch	.text
7447  089e               L11_TI4_Config:
7449  089e 89            	pushw	x
7450  089f 88            	push	a
7451       00000001      OFST:	set	1
7454                     ; 2351     TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
7456  08a0 7219525d      	bres	21085,#4
7457                     ; 2354     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
7457                     ; 2355                             | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
7459  08a4 7b06          	ld	a,(OFST+5,sp)
7460  08a6 97            	ld	xl,a
7461  08a7 a610          	ld	a,#16
7462  08a9 42            	mul	x,a
7463  08aa 9f            	ld	a,xl
7464  08ab 1a03          	or	a,(OFST+2,sp)
7465  08ad 6b01          	ld	(OFST+0,sp),a
7467  08af c6525b        	ld	a,21083
7468  08b2 a40c          	and	a,#12
7469  08b4 1a01          	or	a,(OFST+0,sp)
7470  08b6 c7525b        	ld	21083,a
7471                     ; 2358     if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
7473  08b9 0d02          	tnz	(OFST+1,sp)
7474  08bb 2706          	jreq	L7273
7475                     ; 2360         TIM1->CCER2 |= TIM1_CCER2_CC4P;
7477  08bd 721a525d      	bset	21085,#5
7479  08c1 2004          	jra	L1373
7480  08c3               L7273:
7481                     ; 2364         TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
7483  08c3 721b525d      	bres	21085,#5
7484  08c7               L1373:
7485                     ; 2368     TIM1->CCER2 |=  TIM1_CCER2_CC4E;
7487  08c7 7218525d      	bset	21085,#4
7488                     ; 2369 }
7491  08cb 5b03          	addw	sp,#3
7492  08cd 81            	ret
7505                     	xdef	_TIM1_ClearITPendingBit
7506                     	xdef	_TIM1_GetITStatus
7507                     	xdef	_TIM1_ClearFlag
7508                     	xdef	_TIM1_GetFlagStatus
7509                     	xdef	_TIM1_GetPrescaler
7510                     	xdef	_TIM1_GetCounter
7511                     	xdef	_TIM1_GetCapture4
7512                     	xdef	_TIM1_GetCapture3
7513                     	xdef	_TIM1_GetCapture2
7514                     	xdef	_TIM1_GetCapture1
7515                     	xdef	_TIM1_SetIC4Prescaler
7516                     	xdef	_TIM1_SetIC3Prescaler
7517                     	xdef	_TIM1_SetIC2Prescaler
7518                     	xdef	_TIM1_SetIC1Prescaler
7519                     	xdef	_TIM1_SetCompare4
7520                     	xdef	_TIM1_SetCompare3
7521                     	xdef	_TIM1_SetCompare2
7522                     	xdef	_TIM1_SetCompare1
7523                     	xdef	_TIM1_SetAutoreload
7524                     	xdef	_TIM1_SetCounter
7525                     	xdef	_TIM1_SelectOCxM
7526                     	xdef	_TIM1_CCxNCmd
7527                     	xdef	_TIM1_CCxCmd
7528                     	xdef	_TIM1_OC4PolarityConfig
7529                     	xdef	_TIM1_OC3NPolarityConfig
7530                     	xdef	_TIM1_OC3PolarityConfig
7531                     	xdef	_TIM1_OC2NPolarityConfig
7532                     	xdef	_TIM1_OC2PolarityConfig
7533                     	xdef	_TIM1_OC1NPolarityConfig
7534                     	xdef	_TIM1_OC1PolarityConfig
7535                     	xdef	_TIM1_GenerateEvent
7536                     	xdef	_TIM1_OC4FastConfig
7537                     	xdef	_TIM1_OC3FastConfig
7538                     	xdef	_TIM1_OC2FastConfig
7539                     	xdef	_TIM1_OC1FastConfig
7540                     	xdef	_TIM1_OC4PreloadConfig
7541                     	xdef	_TIM1_OC3PreloadConfig
7542                     	xdef	_TIM1_OC2PreloadConfig
7543                     	xdef	_TIM1_OC1PreloadConfig
7544                     	xdef	_TIM1_CCPreloadControl
7545                     	xdef	_TIM1_SelectCOM
7546                     	xdef	_TIM1_ARRPreloadConfig
7547                     	xdef	_TIM1_ForcedOC4Config
7548                     	xdef	_TIM1_ForcedOC3Config
7549                     	xdef	_TIM1_ForcedOC2Config
7550                     	xdef	_TIM1_ForcedOC1Config
7551                     	xdef	_TIM1_CounterModeConfig
7552                     	xdef	_TIM1_PrescalerConfig
7553                     	xdef	_TIM1_EncoderInterfaceConfig
7554                     	xdef	_TIM1_SelectMasterSlaveMode
7555                     	xdef	_TIM1_SelectSlaveMode
7556                     	xdef	_TIM1_SelectOutputTrigger
7557                     	xdef	_TIM1_SelectOnePulseMode
7558                     	xdef	_TIM1_SelectHallSensor
7559                     	xdef	_TIM1_UpdateRequestConfig
7560                     	xdef	_TIM1_UpdateDisableConfig
7561                     	xdef	_TIM1_SelectInputTrigger
7562                     	xdef	_TIM1_TIxExternalClockConfig
7563                     	xdef	_TIM1_ETRConfig
7564                     	xdef	_TIM1_ETRClockMode2Config
7565                     	xdef	_TIM1_ETRClockMode1Config
7566                     	xdef	_TIM1_InternalClockConfig
7567                     	xdef	_TIM1_ITConfig
7568                     	xdef	_TIM1_CtrlPWMOutputs
7569                     	xdef	_TIM1_Cmd
7570                     	xdef	_TIM1_PWMIConfig
7571                     	xdef	_TIM1_ICInit
7572                     	xdef	_TIM1_BDTRConfig
7573                     	xdef	_TIM1_OC4Init
7574                     	xdef	_TIM1_OC3Init
7575                     	xdef	_TIM1_OC2Init
7576                     	xdef	_TIM1_OC1Init
7577                     	xdef	_TIM1_TimeBaseInit
7578                     	xdef	_TIM1_DeInit
7597                     	end
