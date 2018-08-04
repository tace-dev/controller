   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  44                     ; 58 void TIM1_DeInit(void)
  44                     ; 59 {
  46                     	switch	.text
  47  0000               _TIM1_DeInit:
  51                     ; 60   TIM1->CR1  = TIM1_CR1_RESET_VALUE;
  53  0000 725f5250      	clr	21072
  54                     ; 61   TIM1->CR2  = TIM1_CR2_RESET_VALUE;
  56  0004 725f5251      	clr	21073
  57                     ; 62   TIM1->SMCR = TIM1_SMCR_RESET_VALUE;
  59  0008 725f5252      	clr	21074
  60                     ; 63   TIM1->ETR  = TIM1_ETR_RESET_VALUE;
  62  000c 725f5253      	clr	21075
  63                     ; 64   TIM1->IER  = TIM1_IER_RESET_VALUE;
  65  0010 725f5254      	clr	21076
  66                     ; 65   TIM1->SR2  = TIM1_SR2_RESET_VALUE;
  68  0014 725f5256      	clr	21078
  69                     ; 67   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  71  0018 725f525c      	clr	21084
  72                     ; 68   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  74  001c 725f525d      	clr	21085
  75                     ; 70   TIM1->CCMR1 = 0x01;
  77  0020 35015258      	mov	21080,#1
  78                     ; 71   TIM1->CCMR2 = 0x01;
  80  0024 35015259      	mov	21081,#1
  81                     ; 72   TIM1->CCMR3 = 0x01;
  83  0028 3501525a      	mov	21082,#1
  84                     ; 73   TIM1->CCMR4 = 0x01;
  86  002c 3501525b      	mov	21083,#1
  87                     ; 75   TIM1->CCER1 = TIM1_CCER1_RESET_VALUE;
  89  0030 725f525c      	clr	21084
  90                     ; 76   TIM1->CCER2 = TIM1_CCER2_RESET_VALUE;
  92  0034 725f525d      	clr	21085
  93                     ; 77   TIM1->CCMR1 = TIM1_CCMR1_RESET_VALUE;
  95  0038 725f5258      	clr	21080
  96                     ; 78   TIM1->CCMR2 = TIM1_CCMR2_RESET_VALUE;
  98  003c 725f5259      	clr	21081
  99                     ; 79   TIM1->CCMR3 = TIM1_CCMR3_RESET_VALUE;
 101  0040 725f525a      	clr	21082
 102                     ; 80   TIM1->CCMR4 = TIM1_CCMR4_RESET_VALUE;
 104  0044 725f525b      	clr	21083
 105                     ; 81   TIM1->CNTRH = TIM1_CNTRH_RESET_VALUE;
 107  0048 725f525e      	clr	21086
 108                     ; 82   TIM1->CNTRL = TIM1_CNTRL_RESET_VALUE;
 110  004c 725f525f      	clr	21087
 111                     ; 83   TIM1->PSCRH = TIM1_PSCRH_RESET_VALUE;
 113  0050 725f5260      	clr	21088
 114                     ; 84   TIM1->PSCRL = TIM1_PSCRL_RESET_VALUE;
 116  0054 725f5261      	clr	21089
 117                     ; 85   TIM1->ARRH  = TIM1_ARRH_RESET_VALUE;
 119  0058 35ff5262      	mov	21090,#255
 120                     ; 86   TIM1->ARRL  = TIM1_ARRL_RESET_VALUE;
 122  005c 35ff5263      	mov	21091,#255
 123                     ; 87   TIM1->CCR1H = TIM1_CCR1H_RESET_VALUE;
 125  0060 725f5265      	clr	21093
 126                     ; 88   TIM1->CCR1L = TIM1_CCR1L_RESET_VALUE;
 128  0064 725f5266      	clr	21094
 129                     ; 89   TIM1->CCR2H = TIM1_CCR2H_RESET_VALUE;
 131  0068 725f5267      	clr	21095
 132                     ; 90   TIM1->CCR2L = TIM1_CCR2L_RESET_VALUE;
 134  006c 725f5268      	clr	21096
 135                     ; 91   TIM1->CCR3H = TIM1_CCR3H_RESET_VALUE;
 137  0070 725f5269      	clr	21097
 138                     ; 92   TIM1->CCR3L = TIM1_CCR3L_RESET_VALUE;
 140  0074 725f526a      	clr	21098
 141                     ; 93   TIM1->CCR4H = TIM1_CCR4H_RESET_VALUE;
 143  0078 725f526b      	clr	21099
 144                     ; 94   TIM1->CCR4L = TIM1_CCR4L_RESET_VALUE;
 146  007c 725f526c      	clr	21100
 147                     ; 95   TIM1->OISR  = TIM1_OISR_RESET_VALUE;
 149  0080 725f526f      	clr	21103
 150                     ; 96   TIM1->EGR   = 0x01; /* TIM1_EGR_UG */
 152  0084 35015257      	mov	21079,#1
 153                     ; 97   TIM1->DTR   = TIM1_DTR_RESET_VALUE;
 155  0088 725f526e      	clr	21102
 156                     ; 98   TIM1->BKR   = TIM1_BKR_RESET_VALUE;
 158  008c 725f526d      	clr	21101
 159                     ; 99   TIM1->RCR   = TIM1_RCR_RESET_VALUE;
 161  0090 725f5264      	clr	21092
 162                     ; 100   TIM1->SR1   = TIM1_SR1_RESET_VALUE;
 164  0094 725f5255      	clr	21077
 165                     ; 101 }
 168  0098 81            	ret
 278                     ; 111 void TIM1_TimeBaseInit(uint16_t TIM1_Prescaler,
 278                     ; 112                        TIM1_CounterMode_TypeDef TIM1_CounterMode,
 278                     ; 113                        uint16_t TIM1_Period,
 278                     ; 114                        uint8_t TIM1_RepetitionCounter)
 278                     ; 115 {
 279                     	switch	.text
 280  0099               _TIM1_TimeBaseInit:
 282  0099 89            	pushw	x
 283       00000000      OFST:	set	0
 286                     ; 117   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
 288  009a 0d05          	tnz	(OFST+5,sp)
 289  009c 2718          	jreq	L21
 290  009e 7b05          	ld	a,(OFST+5,sp)
 291  00a0 a110          	cp	a,#16
 292  00a2 2712          	jreq	L21
 293  00a4 7b05          	ld	a,(OFST+5,sp)
 294  00a6 a120          	cp	a,#32
 295  00a8 270c          	jreq	L21
 296  00aa 7b05          	ld	a,(OFST+5,sp)
 297  00ac a140          	cp	a,#64
 298  00ae 2706          	jreq	L21
 299  00b0 7b05          	ld	a,(OFST+5,sp)
 300  00b2 a160          	cp	a,#96
 301  00b4 2603          	jrne	L01
 302  00b6               L21:
 303  00b6 4f            	clr	a
 304  00b7 2010          	jra	L41
 305  00b9               L01:
 306  00b9 ae0075        	ldw	x,#117
 307  00bc 89            	pushw	x
 308  00bd ae0000        	ldw	x,#0
 309  00c0 89            	pushw	x
 310  00c1 ae0000        	ldw	x,#L101
 311  00c4 cd0000        	call	_assert_failed
 313  00c7 5b04          	addw	sp,#4
 314  00c9               L41:
 315                     ; 120   TIM1->ARRH = (uint8_t)(TIM1_Period >> 8);
 317  00c9 7b06          	ld	a,(OFST+6,sp)
 318  00cb c75262        	ld	21090,a
 319                     ; 121   TIM1->ARRL = (uint8_t)(TIM1_Period);
 321  00ce 7b07          	ld	a,(OFST+7,sp)
 322  00d0 c75263        	ld	21091,a
 323                     ; 124   TIM1->PSCRH = (uint8_t)(TIM1_Prescaler >> 8);
 325  00d3 7b01          	ld	a,(OFST+1,sp)
 326  00d5 c75260        	ld	21088,a
 327                     ; 125   TIM1->PSCRL = (uint8_t)(TIM1_Prescaler);
 329  00d8 7b02          	ld	a,(OFST+2,sp)
 330  00da c75261        	ld	21089,a
 331                     ; 128   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)(~(TIM1_CR1_CMS | TIM1_CR1_DIR)))
 331                     ; 129                         | (uint8_t)(TIM1_CounterMode));
 333  00dd c65250        	ld	a,21072
 334  00e0 a48f          	and	a,#143
 335  00e2 1a05          	or	a,(OFST+5,sp)
 336  00e4 c75250        	ld	21072,a
 337                     ; 132   TIM1->RCR = TIM1_RepetitionCounter;
 339  00e7 7b08          	ld	a,(OFST+8,sp)
 340  00e9 c75264        	ld	21092,a
 341                     ; 133 }
 344  00ec 85            	popw	x
 345  00ed 81            	ret
 631                     ; 154 void TIM1_OC1Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 631                     ; 155                   TIM1_OutputState_TypeDef TIM1_OutputState,
 631                     ; 156                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 631                     ; 157                   uint16_t TIM1_Pulse,
 631                     ; 158                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 631                     ; 159                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 631                     ; 160                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 631                     ; 161                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 631                     ; 162 {
 632                     	switch	.text
 633  00ee               _TIM1_OC1Init:
 635  00ee 89            	pushw	x
 636  00ef 5203          	subw	sp,#3
 637       00000003      OFST:	set	3
 640                     ; 164   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 642  00f1 9e            	ld	a,xh
 643  00f2 4d            	tnz	a
 644  00f3 2719          	jreq	L22
 645  00f5 9e            	ld	a,xh
 646  00f6 a110          	cp	a,#16
 647  00f8 2714          	jreq	L22
 648  00fa 9e            	ld	a,xh
 649  00fb a120          	cp	a,#32
 650  00fd 270f          	jreq	L22
 651  00ff 9e            	ld	a,xh
 652  0100 a130          	cp	a,#48
 653  0102 270a          	jreq	L22
 654  0104 9e            	ld	a,xh
 655  0105 a160          	cp	a,#96
 656  0107 2705          	jreq	L22
 657  0109 9e            	ld	a,xh
 658  010a a170          	cp	a,#112
 659  010c 2603          	jrne	L02
 660  010e               L22:
 661  010e 4f            	clr	a
 662  010f 2010          	jra	L42
 663  0111               L02:
 664  0111 ae00a4        	ldw	x,#164
 665  0114 89            	pushw	x
 666  0115 ae0000        	ldw	x,#0
 667  0118 89            	pushw	x
 668  0119 ae0000        	ldw	x,#L101
 669  011c cd0000        	call	_assert_failed
 671  011f 5b04          	addw	sp,#4
 672  0121               L42:
 673                     ; 165   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
 675  0121 0d05          	tnz	(OFST+2,sp)
 676  0123 2706          	jreq	L03
 677  0125 7b05          	ld	a,(OFST+2,sp)
 678  0127 a111          	cp	a,#17
 679  0129 2603          	jrne	L62
 680  012b               L03:
 681  012b 4f            	clr	a
 682  012c 2010          	jra	L23
 683  012e               L62:
 684  012e ae00a5        	ldw	x,#165
 685  0131 89            	pushw	x
 686  0132 ae0000        	ldw	x,#0
 687  0135 89            	pushw	x
 688  0136 ae0000        	ldw	x,#L101
 689  0139 cd0000        	call	_assert_failed
 691  013c 5b04          	addw	sp,#4
 692  013e               L23:
 693                     ; 166   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
 695  013e 0d08          	tnz	(OFST+5,sp)
 696  0140 2706          	jreq	L63
 697  0142 7b08          	ld	a,(OFST+5,sp)
 698  0144 a144          	cp	a,#68
 699  0146 2603          	jrne	L43
 700  0148               L63:
 701  0148 4f            	clr	a
 702  0149 2010          	jra	L04
 703  014b               L43:
 704  014b ae00a6        	ldw	x,#166
 705  014e 89            	pushw	x
 706  014f ae0000        	ldw	x,#0
 707  0152 89            	pushw	x
 708  0153 ae0000        	ldw	x,#L101
 709  0156 cd0000        	call	_assert_failed
 711  0159 5b04          	addw	sp,#4
 712  015b               L04:
 713                     ; 167   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
 715  015b 0d0b          	tnz	(OFST+8,sp)
 716  015d 2706          	jreq	L44
 717  015f 7b0b          	ld	a,(OFST+8,sp)
 718  0161 a122          	cp	a,#34
 719  0163 2603          	jrne	L24
 720  0165               L44:
 721  0165 4f            	clr	a
 722  0166 2010          	jra	L64
 723  0168               L24:
 724  0168 ae00a7        	ldw	x,#167
 725  016b 89            	pushw	x
 726  016c ae0000        	ldw	x,#0
 727  016f 89            	pushw	x
 728  0170 ae0000        	ldw	x,#L101
 729  0173 cd0000        	call	_assert_failed
 731  0176 5b04          	addw	sp,#4
 732  0178               L64:
 733                     ; 168   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
 735  0178 0d0c          	tnz	(OFST+9,sp)
 736  017a 2706          	jreq	L25
 737  017c 7b0c          	ld	a,(OFST+9,sp)
 738  017e a188          	cp	a,#136
 739  0180 2603          	jrne	L05
 740  0182               L25:
 741  0182 4f            	clr	a
 742  0183 2010          	jra	L45
 743  0185               L05:
 744  0185 ae00a8        	ldw	x,#168
 745  0188 89            	pushw	x
 746  0189 ae0000        	ldw	x,#0
 747  018c 89            	pushw	x
 748  018d ae0000        	ldw	x,#L101
 749  0190 cd0000        	call	_assert_failed
 751  0193 5b04          	addw	sp,#4
 752  0195               L45:
 753                     ; 169   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
 755  0195 7b0d          	ld	a,(OFST+10,sp)
 756  0197 a155          	cp	a,#85
 757  0199 2704          	jreq	L06
 758  019b 0d0d          	tnz	(OFST+10,sp)
 759  019d 2603          	jrne	L65
 760  019f               L06:
 761  019f 4f            	clr	a
 762  01a0 2010          	jra	L26
 763  01a2               L65:
 764  01a2 ae00a9        	ldw	x,#169
 765  01a5 89            	pushw	x
 766  01a6 ae0000        	ldw	x,#0
 767  01a9 89            	pushw	x
 768  01aa ae0000        	ldw	x,#L101
 769  01ad cd0000        	call	_assert_failed
 771  01b0 5b04          	addw	sp,#4
 772  01b2               L26:
 773                     ; 170   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
 775  01b2 7b0e          	ld	a,(OFST+11,sp)
 776  01b4 a12a          	cp	a,#42
 777  01b6 2704          	jreq	L66
 778  01b8 0d0e          	tnz	(OFST+11,sp)
 779  01ba 2603          	jrne	L46
 780  01bc               L66:
 781  01bc 4f            	clr	a
 782  01bd 2010          	jra	L07
 783  01bf               L46:
 784  01bf ae00aa        	ldw	x,#170
 785  01c2 89            	pushw	x
 786  01c3 ae0000        	ldw	x,#0
 787  01c6 89            	pushw	x
 788  01c7 ae0000        	ldw	x,#L101
 789  01ca cd0000        	call	_assert_failed
 791  01cd 5b04          	addw	sp,#4
 792  01cf               L07:
 793                     ; 174   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC1E | TIM1_CCER1_CC1NE 
 793                     ; 175                              | TIM1_CCER1_CC1P | TIM1_CCER1_CC1NP));
 795  01cf c6525c        	ld	a,21084
 796  01d2 a4f0          	and	a,#240
 797  01d4 c7525c        	ld	21084,a
 798                     ; 178   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC1E)
 798                     ; 179                                      | (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC1NE))
 798                     ; 180                            | (uint8_t)( (uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC1P)
 798                     ; 181                                        | (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC1NP)));
 800  01d7 7b0c          	ld	a,(OFST+9,sp)
 801  01d9 a408          	and	a,#8
 802  01db 6b03          	ld	(OFST+0,sp),a
 804  01dd 7b0b          	ld	a,(OFST+8,sp)
 805  01df a402          	and	a,#2
 806  01e1 1a03          	or	a,(OFST+0,sp)
 807  01e3 6b02          	ld	(OFST-1,sp),a
 809  01e5 7b08          	ld	a,(OFST+5,sp)
 810  01e7 a404          	and	a,#4
 811  01e9 6b01          	ld	(OFST-2,sp),a
 813  01eb 7b05          	ld	a,(OFST+2,sp)
 814  01ed a401          	and	a,#1
 815  01ef 1a01          	or	a,(OFST-2,sp)
 816  01f1 1a02          	or	a,(OFST-1,sp)
 817  01f3 ca525c        	or	a,21084
 818  01f6 c7525c        	ld	21084,a
 819                     ; 184   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) | 
 819                     ; 185                           (uint8_t)TIM1_OCMode);
 821  01f9 c65258        	ld	a,21080
 822  01fc a48f          	and	a,#143
 823  01fe 1a04          	or	a,(OFST+1,sp)
 824  0200 c75258        	ld	21080,a
 825                     ; 188   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS1 | TIM1_OISR_OIS1N));
 827  0203 c6526f        	ld	a,21103
 828  0206 a4fc          	and	a,#252
 829  0208 c7526f        	ld	21103,a
 830                     ; 190   TIM1->OISR |= (uint8_t)((uint8_t)( TIM1_OCIdleState & TIM1_OISR_OIS1 ) | 
 830                     ; 191                           (uint8_t)( TIM1_OCNIdleState & TIM1_OISR_OIS1N ));
 832  020b 7b0e          	ld	a,(OFST+11,sp)
 833  020d a402          	and	a,#2
 834  020f 6b03          	ld	(OFST+0,sp),a
 836  0211 7b0d          	ld	a,(OFST+10,sp)
 837  0213 a401          	and	a,#1
 838  0215 1a03          	or	a,(OFST+0,sp)
 839  0217 ca526f        	or	a,21103
 840  021a c7526f        	ld	21103,a
 841                     ; 194   TIM1->CCR1H = (uint8_t)(TIM1_Pulse >> 8);
 843  021d 7b09          	ld	a,(OFST+6,sp)
 844  021f c75265        	ld	21093,a
 845                     ; 195   TIM1->CCR1L = (uint8_t)(TIM1_Pulse);
 847  0222 7b0a          	ld	a,(OFST+7,sp)
 848  0224 c75266        	ld	21094,a
 849                     ; 196 }
 852  0227 5b05          	addw	sp,#5
 853  0229 81            	ret
 958                     ; 217 void TIM1_OC2Init(TIM1_OCMode_TypeDef TIM1_OCMode,
 958                     ; 218                   TIM1_OutputState_TypeDef TIM1_OutputState,
 958                     ; 219                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
 958                     ; 220                   uint16_t TIM1_Pulse,
 958                     ; 221                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
 958                     ; 222                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
 958                     ; 223                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
 958                     ; 224                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
 958                     ; 225 {
 959                     	switch	.text
 960  022a               _TIM1_OC2Init:
 962  022a 89            	pushw	x
 963  022b 5203          	subw	sp,#3
 964       00000003      OFST:	set	3
 967                     ; 227   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
 969  022d 9e            	ld	a,xh
 970  022e 4d            	tnz	a
 971  022f 2719          	jreq	L67
 972  0231 9e            	ld	a,xh
 973  0232 a110          	cp	a,#16
 974  0234 2714          	jreq	L67
 975  0236 9e            	ld	a,xh
 976  0237 a120          	cp	a,#32
 977  0239 270f          	jreq	L67
 978  023b 9e            	ld	a,xh
 979  023c a130          	cp	a,#48
 980  023e 270a          	jreq	L67
 981  0240 9e            	ld	a,xh
 982  0241 a160          	cp	a,#96
 983  0243 2705          	jreq	L67
 984  0245 9e            	ld	a,xh
 985  0246 a170          	cp	a,#112
 986  0248 2603          	jrne	L47
 987  024a               L67:
 988  024a 4f            	clr	a
 989  024b 2010          	jra	L001
 990  024d               L47:
 991  024d ae00e3        	ldw	x,#227
 992  0250 89            	pushw	x
 993  0251 ae0000        	ldw	x,#0
 994  0254 89            	pushw	x
 995  0255 ae0000        	ldw	x,#L101
 996  0258 cd0000        	call	_assert_failed
 998  025b 5b04          	addw	sp,#4
 999  025d               L001:
1000                     ; 228   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1002  025d 0d05          	tnz	(OFST+2,sp)
1003  025f 2706          	jreq	L401
1004  0261 7b05          	ld	a,(OFST+2,sp)
1005  0263 a111          	cp	a,#17
1006  0265 2603          	jrne	L201
1007  0267               L401:
1008  0267 4f            	clr	a
1009  0268 2010          	jra	L601
1010  026a               L201:
1011  026a ae00e4        	ldw	x,#228
1012  026d 89            	pushw	x
1013  026e ae0000        	ldw	x,#0
1014  0271 89            	pushw	x
1015  0272 ae0000        	ldw	x,#L101
1016  0275 cd0000        	call	_assert_failed
1018  0278 5b04          	addw	sp,#4
1019  027a               L601:
1020                     ; 229   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1022  027a 0d08          	tnz	(OFST+5,sp)
1023  027c 2706          	jreq	L211
1024  027e 7b08          	ld	a,(OFST+5,sp)
1025  0280 a144          	cp	a,#68
1026  0282 2603          	jrne	L011
1027  0284               L211:
1028  0284 4f            	clr	a
1029  0285 2010          	jra	L411
1030  0287               L011:
1031  0287 ae00e5        	ldw	x,#229
1032  028a 89            	pushw	x
1033  028b ae0000        	ldw	x,#0
1034  028e 89            	pushw	x
1035  028f ae0000        	ldw	x,#L101
1036  0292 cd0000        	call	_assert_failed
1038  0295 5b04          	addw	sp,#4
1039  0297               L411:
1040                     ; 230   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1042  0297 0d0b          	tnz	(OFST+8,sp)
1043  0299 2706          	jreq	L021
1044  029b 7b0b          	ld	a,(OFST+8,sp)
1045  029d a122          	cp	a,#34
1046  029f 2603          	jrne	L611
1047  02a1               L021:
1048  02a1 4f            	clr	a
1049  02a2 2010          	jra	L221
1050  02a4               L611:
1051  02a4 ae00e6        	ldw	x,#230
1052  02a7 89            	pushw	x
1053  02a8 ae0000        	ldw	x,#0
1054  02ab 89            	pushw	x
1055  02ac ae0000        	ldw	x,#L101
1056  02af cd0000        	call	_assert_failed
1058  02b2 5b04          	addw	sp,#4
1059  02b4               L221:
1060                     ; 231   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1062  02b4 0d0c          	tnz	(OFST+9,sp)
1063  02b6 2706          	jreq	L621
1064  02b8 7b0c          	ld	a,(OFST+9,sp)
1065  02ba a188          	cp	a,#136
1066  02bc 2603          	jrne	L421
1067  02be               L621:
1068  02be 4f            	clr	a
1069  02bf 2010          	jra	L031
1070  02c1               L421:
1071  02c1 ae00e7        	ldw	x,#231
1072  02c4 89            	pushw	x
1073  02c5 ae0000        	ldw	x,#0
1074  02c8 89            	pushw	x
1075  02c9 ae0000        	ldw	x,#L101
1076  02cc cd0000        	call	_assert_failed
1078  02cf 5b04          	addw	sp,#4
1079  02d1               L031:
1080                     ; 232   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1082  02d1 7b0d          	ld	a,(OFST+10,sp)
1083  02d3 a155          	cp	a,#85
1084  02d5 2704          	jreq	L431
1085  02d7 0d0d          	tnz	(OFST+10,sp)
1086  02d9 2603          	jrne	L231
1087  02db               L431:
1088  02db 4f            	clr	a
1089  02dc 2010          	jra	L631
1090  02de               L231:
1091  02de ae00e8        	ldw	x,#232
1092  02e1 89            	pushw	x
1093  02e2 ae0000        	ldw	x,#0
1094  02e5 89            	pushw	x
1095  02e6 ae0000        	ldw	x,#L101
1096  02e9 cd0000        	call	_assert_failed
1098  02ec 5b04          	addw	sp,#4
1099  02ee               L631:
1100                     ; 233   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1102  02ee 7b0e          	ld	a,(OFST+11,sp)
1103  02f0 a12a          	cp	a,#42
1104  02f2 2704          	jreq	L241
1105  02f4 0d0e          	tnz	(OFST+11,sp)
1106  02f6 2603          	jrne	L041
1107  02f8               L241:
1108  02f8 4f            	clr	a
1109  02f9 2010          	jra	L441
1110  02fb               L041:
1111  02fb ae00e9        	ldw	x,#233
1112  02fe 89            	pushw	x
1113  02ff ae0000        	ldw	x,#0
1114  0302 89            	pushw	x
1115  0303 ae0000        	ldw	x,#L101
1116  0306 cd0000        	call	_assert_failed
1118  0309 5b04          	addw	sp,#4
1119  030b               L441:
1120                     ; 237   TIM1->CCER1 &= (uint8_t)(~( TIM1_CCER1_CC2E | TIM1_CCER1_CC2NE | 
1120                     ; 238                              TIM1_CCER1_CC2P | TIM1_CCER1_CC2NP));
1122  030b c6525c        	ld	a,21084
1123  030e a40f          	and	a,#15
1124  0310 c7525c        	ld	21084,a
1125                     ; 242   TIM1->CCER1 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER1_CC2E  ) | 
1125                     ; 243                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER1_CC2NE )) | 
1125                     ; 244                            (uint8_t)((uint8_t)(TIM1_OCPolarity  & TIM1_CCER1_CC2P  ) | 
1125                     ; 245                                      (uint8_t)(TIM1_OCNPolarity & TIM1_CCER1_CC2NP )));
1127  0313 7b0c          	ld	a,(OFST+9,sp)
1128  0315 a480          	and	a,#128
1129  0317 6b03          	ld	(OFST+0,sp),a
1131  0319 7b0b          	ld	a,(OFST+8,sp)
1132  031b a420          	and	a,#32
1133  031d 1a03          	or	a,(OFST+0,sp)
1134  031f 6b02          	ld	(OFST-1,sp),a
1136  0321 7b08          	ld	a,(OFST+5,sp)
1137  0323 a440          	and	a,#64
1138  0325 6b01          	ld	(OFST-2,sp),a
1140  0327 7b05          	ld	a,(OFST+2,sp)
1141  0329 a410          	and	a,#16
1142  032b 1a01          	or	a,(OFST-2,sp)
1143  032d 1a02          	or	a,(OFST-1,sp)
1144  032f ca525c        	or	a,21084
1145  0332 c7525c        	ld	21084,a
1146                     ; 248   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1146                     ; 249                           (uint8_t)TIM1_OCMode);
1148  0335 c65259        	ld	a,21081
1149  0338 a48f          	and	a,#143
1150  033a 1a04          	or	a,(OFST+1,sp)
1151  033c c75259        	ld	21081,a
1152                     ; 252   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS2 | TIM1_OISR_OIS2N));
1154  033f c6526f        	ld	a,21103
1155  0342 a4f3          	and	a,#243
1156  0344 c7526f        	ld	21103,a
1157                     ; 254   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS2 & TIM1_OCIdleState) | 
1157                     ; 255                           (uint8_t)(TIM1_OISR_OIS2N & TIM1_OCNIdleState));
1159  0347 7b0e          	ld	a,(OFST+11,sp)
1160  0349 a408          	and	a,#8
1161  034b 6b03          	ld	(OFST+0,sp),a
1163  034d 7b0d          	ld	a,(OFST+10,sp)
1164  034f a404          	and	a,#4
1165  0351 1a03          	or	a,(OFST+0,sp)
1166  0353 ca526f        	or	a,21103
1167  0356 c7526f        	ld	21103,a
1168                     ; 258   TIM1->CCR2H = (uint8_t)(TIM1_Pulse >> 8);
1170  0359 7b09          	ld	a,(OFST+6,sp)
1171  035b c75267        	ld	21095,a
1172                     ; 259   TIM1->CCR2L = (uint8_t)(TIM1_Pulse);
1174  035e 7b0a          	ld	a,(OFST+7,sp)
1175  0360 c75268        	ld	21096,a
1176                     ; 260 }
1179  0363 5b05          	addw	sp,#5
1180  0365 81            	ret
1285                     ; 281 void TIM1_OC3Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1285                     ; 282                   TIM1_OutputState_TypeDef TIM1_OutputState,
1285                     ; 283                   TIM1_OutputNState_TypeDef TIM1_OutputNState,
1285                     ; 284                   uint16_t TIM1_Pulse,
1285                     ; 285                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1285                     ; 286                   TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity,
1285                     ; 287                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState,
1285                     ; 288                   TIM1_OCNIdleState_TypeDef TIM1_OCNIdleState)
1285                     ; 289 {
1286                     	switch	.text
1287  0366               _TIM1_OC3Init:
1289  0366 89            	pushw	x
1290  0367 5203          	subw	sp,#3
1291       00000003      OFST:	set	3
1294                     ; 291   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1296  0369 9e            	ld	a,xh
1297  036a 4d            	tnz	a
1298  036b 2719          	jreq	L251
1299  036d 9e            	ld	a,xh
1300  036e a110          	cp	a,#16
1301  0370 2714          	jreq	L251
1302  0372 9e            	ld	a,xh
1303  0373 a120          	cp	a,#32
1304  0375 270f          	jreq	L251
1305  0377 9e            	ld	a,xh
1306  0378 a130          	cp	a,#48
1307  037a 270a          	jreq	L251
1308  037c 9e            	ld	a,xh
1309  037d a160          	cp	a,#96
1310  037f 2705          	jreq	L251
1311  0381 9e            	ld	a,xh
1312  0382 a170          	cp	a,#112
1313  0384 2603          	jrne	L051
1314  0386               L251:
1315  0386 4f            	clr	a
1316  0387 2010          	jra	L451
1317  0389               L051:
1318  0389 ae0123        	ldw	x,#291
1319  038c 89            	pushw	x
1320  038d ae0000        	ldw	x,#0
1321  0390 89            	pushw	x
1322  0391 ae0000        	ldw	x,#L101
1323  0394 cd0000        	call	_assert_failed
1325  0397 5b04          	addw	sp,#4
1326  0399               L451:
1327                     ; 292   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1329  0399 0d05          	tnz	(OFST+2,sp)
1330  039b 2706          	jreq	L061
1331  039d 7b05          	ld	a,(OFST+2,sp)
1332  039f a111          	cp	a,#17
1333  03a1 2603          	jrne	L651
1334  03a3               L061:
1335  03a3 4f            	clr	a
1336  03a4 2010          	jra	L261
1337  03a6               L651:
1338  03a6 ae0124        	ldw	x,#292
1339  03a9 89            	pushw	x
1340  03aa ae0000        	ldw	x,#0
1341  03ad 89            	pushw	x
1342  03ae ae0000        	ldw	x,#L101
1343  03b1 cd0000        	call	_assert_failed
1345  03b4 5b04          	addw	sp,#4
1346  03b6               L261:
1347                     ; 293   assert_param(IS_TIM1_OUTPUTN_STATE_OK(TIM1_OutputNState));
1349  03b6 0d08          	tnz	(OFST+5,sp)
1350  03b8 2706          	jreq	L661
1351  03ba 7b08          	ld	a,(OFST+5,sp)
1352  03bc a144          	cp	a,#68
1353  03be 2603          	jrne	L461
1354  03c0               L661:
1355  03c0 4f            	clr	a
1356  03c1 2010          	jra	L071
1357  03c3               L461:
1358  03c3 ae0125        	ldw	x,#293
1359  03c6 89            	pushw	x
1360  03c7 ae0000        	ldw	x,#0
1361  03ca 89            	pushw	x
1362  03cb ae0000        	ldw	x,#L101
1363  03ce cd0000        	call	_assert_failed
1365  03d1 5b04          	addw	sp,#4
1366  03d3               L071:
1367                     ; 294   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1369  03d3 0d0b          	tnz	(OFST+8,sp)
1370  03d5 2706          	jreq	L471
1371  03d7 7b0b          	ld	a,(OFST+8,sp)
1372  03d9 a122          	cp	a,#34
1373  03db 2603          	jrne	L271
1374  03dd               L471:
1375  03dd 4f            	clr	a
1376  03de 2010          	jra	L671
1377  03e0               L271:
1378  03e0 ae0126        	ldw	x,#294
1379  03e3 89            	pushw	x
1380  03e4 ae0000        	ldw	x,#0
1381  03e7 89            	pushw	x
1382  03e8 ae0000        	ldw	x,#L101
1383  03eb cd0000        	call	_assert_failed
1385  03ee 5b04          	addw	sp,#4
1386  03f0               L671:
1387                     ; 295   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
1389  03f0 0d0c          	tnz	(OFST+9,sp)
1390  03f2 2706          	jreq	L202
1391  03f4 7b0c          	ld	a,(OFST+9,sp)
1392  03f6 a188          	cp	a,#136
1393  03f8 2603          	jrne	L002
1394  03fa               L202:
1395  03fa 4f            	clr	a
1396  03fb 2010          	jra	L402
1397  03fd               L002:
1398  03fd ae0127        	ldw	x,#295
1399  0400 89            	pushw	x
1400  0401 ae0000        	ldw	x,#0
1401  0404 89            	pushw	x
1402  0405 ae0000        	ldw	x,#L101
1403  0408 cd0000        	call	_assert_failed
1405  040b 5b04          	addw	sp,#4
1406  040d               L402:
1407                     ; 296   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1409  040d 7b0d          	ld	a,(OFST+10,sp)
1410  040f a155          	cp	a,#85
1411  0411 2704          	jreq	L012
1412  0413 0d0d          	tnz	(OFST+10,sp)
1413  0415 2603          	jrne	L602
1414  0417               L012:
1415  0417 4f            	clr	a
1416  0418 2010          	jra	L212
1417  041a               L602:
1418  041a ae0128        	ldw	x,#296
1419  041d 89            	pushw	x
1420  041e ae0000        	ldw	x,#0
1421  0421 89            	pushw	x
1422  0422 ae0000        	ldw	x,#L101
1423  0425 cd0000        	call	_assert_failed
1425  0428 5b04          	addw	sp,#4
1426  042a               L212:
1427                     ; 297   assert_param(IS_TIM1_OCNIDLE_STATE_OK(TIM1_OCNIdleState));
1429  042a 7b0e          	ld	a,(OFST+11,sp)
1430  042c a12a          	cp	a,#42
1431  042e 2704          	jreq	L612
1432  0430 0d0e          	tnz	(OFST+11,sp)
1433  0432 2603          	jrne	L412
1434  0434               L612:
1435  0434 4f            	clr	a
1436  0435 2010          	jra	L022
1437  0437               L412:
1438  0437 ae0129        	ldw	x,#297
1439  043a 89            	pushw	x
1440  043b ae0000        	ldw	x,#0
1441  043e 89            	pushw	x
1442  043f ae0000        	ldw	x,#L101
1443  0442 cd0000        	call	_assert_failed
1445  0445 5b04          	addw	sp,#4
1446  0447               L022:
1447                     ; 301   TIM1->CCER2 &= (uint8_t)(~( TIM1_CCER2_CC3E | TIM1_CCER2_CC3NE | 
1447                     ; 302                              TIM1_CCER2_CC3P | TIM1_CCER2_CC3NP));
1449  0447 c6525d        	ld	a,21085
1450  044a a4f0          	and	a,#240
1451  044c c7525d        	ld	21085,a
1452                     ; 305   TIM1->CCER2 |= (uint8_t)((uint8_t)((uint8_t)(TIM1_OutputState  & TIM1_CCER2_CC3E   ) |
1452                     ; 306                                      (uint8_t)(TIM1_OutputNState & TIM1_CCER2_CC3NE  )) | 
1452                     ; 307                            (uint8_t)((uint8_t)(TIM1_OCPolarity   & TIM1_CCER2_CC3P   ) | 
1452                     ; 308                                      (uint8_t)(TIM1_OCNPolarity  & TIM1_CCER2_CC3NP  )));
1454  044f 7b0c          	ld	a,(OFST+9,sp)
1455  0451 a408          	and	a,#8
1456  0453 6b03          	ld	(OFST+0,sp),a
1458  0455 7b0b          	ld	a,(OFST+8,sp)
1459  0457 a402          	and	a,#2
1460  0459 1a03          	or	a,(OFST+0,sp)
1461  045b 6b02          	ld	(OFST-1,sp),a
1463  045d 7b08          	ld	a,(OFST+5,sp)
1464  045f a404          	and	a,#4
1465  0461 6b01          	ld	(OFST-2,sp),a
1467  0463 7b05          	ld	a,(OFST+2,sp)
1468  0465 a401          	and	a,#1
1469  0467 1a01          	or	a,(OFST-2,sp)
1470  0469 1a02          	or	a,(OFST-1,sp)
1471  046b ca525d        	or	a,21085
1472  046e c7525d        	ld	21085,a
1473                     ; 311   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1473                     ; 312                           (uint8_t)TIM1_OCMode);
1475  0471 c6525a        	ld	a,21082
1476  0474 a48f          	and	a,#143
1477  0476 1a04          	or	a,(OFST+1,sp)
1478  0478 c7525a        	ld	21082,a
1479                     ; 315   TIM1->OISR &= (uint8_t)(~(TIM1_OISR_OIS3 | TIM1_OISR_OIS3N));
1481  047b c6526f        	ld	a,21103
1482  047e a4cf          	and	a,#207
1483  0480 c7526f        	ld	21103,a
1484                     ; 317   TIM1->OISR |= (uint8_t)((uint8_t)(TIM1_OISR_OIS3 & TIM1_OCIdleState) | 
1484                     ; 318                           (uint8_t)(TIM1_OISR_OIS3N & TIM1_OCNIdleState));
1486  0483 7b0e          	ld	a,(OFST+11,sp)
1487  0485 a420          	and	a,#32
1488  0487 6b03          	ld	(OFST+0,sp),a
1490  0489 7b0d          	ld	a,(OFST+10,sp)
1491  048b a410          	and	a,#16
1492  048d 1a03          	or	a,(OFST+0,sp)
1493  048f ca526f        	or	a,21103
1494  0492 c7526f        	ld	21103,a
1495                     ; 321   TIM1->CCR3H = (uint8_t)(TIM1_Pulse >> 8);
1497  0495 7b09          	ld	a,(OFST+6,sp)
1498  0497 c75269        	ld	21097,a
1499                     ; 322   TIM1->CCR3L = (uint8_t)(TIM1_Pulse);
1501  049a 7b0a          	ld	a,(OFST+7,sp)
1502  049c c7526a        	ld	21098,a
1503                     ; 323 }
1506  049f 5b05          	addw	sp,#5
1507  04a1 81            	ret
1582                     ; 338 void TIM1_OC4Init(TIM1_OCMode_TypeDef TIM1_OCMode,
1582                     ; 339                   TIM1_OutputState_TypeDef TIM1_OutputState,
1582                     ; 340                   uint16_t TIM1_Pulse,
1582                     ; 341                   TIM1_OCPolarity_TypeDef TIM1_OCPolarity,
1582                     ; 342                   TIM1_OCIdleState_TypeDef TIM1_OCIdleState)
1582                     ; 343 {
1583                     	switch	.text
1584  04a2               _TIM1_OC4Init:
1586  04a2 89            	pushw	x
1587  04a3 88            	push	a
1588       00000001      OFST:	set	1
1591                     ; 345   assert_param(IS_TIM1_OC_MODE_OK(TIM1_OCMode));
1593  04a4 9e            	ld	a,xh
1594  04a5 4d            	tnz	a
1595  04a6 2719          	jreq	L622
1596  04a8 9e            	ld	a,xh
1597  04a9 a110          	cp	a,#16
1598  04ab 2714          	jreq	L622
1599  04ad 9e            	ld	a,xh
1600  04ae a120          	cp	a,#32
1601  04b0 270f          	jreq	L622
1602  04b2 9e            	ld	a,xh
1603  04b3 a130          	cp	a,#48
1604  04b5 270a          	jreq	L622
1605  04b7 9e            	ld	a,xh
1606  04b8 a160          	cp	a,#96
1607  04ba 2705          	jreq	L622
1608  04bc 9e            	ld	a,xh
1609  04bd a170          	cp	a,#112
1610  04bf 2603          	jrne	L422
1611  04c1               L622:
1612  04c1 4f            	clr	a
1613  04c2 2010          	jra	L032
1614  04c4               L422:
1615  04c4 ae0159        	ldw	x,#345
1616  04c7 89            	pushw	x
1617  04c8 ae0000        	ldw	x,#0
1618  04cb 89            	pushw	x
1619  04cc ae0000        	ldw	x,#L101
1620  04cf cd0000        	call	_assert_failed
1622  04d2 5b04          	addw	sp,#4
1623  04d4               L032:
1624                     ; 346   assert_param(IS_TIM1_OUTPUT_STATE_OK(TIM1_OutputState));
1626  04d4 0d03          	tnz	(OFST+2,sp)
1627  04d6 2706          	jreq	L432
1628  04d8 7b03          	ld	a,(OFST+2,sp)
1629  04da a111          	cp	a,#17
1630  04dc 2603          	jrne	L232
1631  04de               L432:
1632  04de 4f            	clr	a
1633  04df 2010          	jra	L632
1634  04e1               L232:
1635  04e1 ae015a        	ldw	x,#346
1636  04e4 89            	pushw	x
1637  04e5 ae0000        	ldw	x,#0
1638  04e8 89            	pushw	x
1639  04e9 ae0000        	ldw	x,#L101
1640  04ec cd0000        	call	_assert_failed
1642  04ef 5b04          	addw	sp,#4
1643  04f1               L632:
1644                     ; 347   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
1646  04f1 0d08          	tnz	(OFST+7,sp)
1647  04f3 2706          	jreq	L242
1648  04f5 7b08          	ld	a,(OFST+7,sp)
1649  04f7 a122          	cp	a,#34
1650  04f9 2603          	jrne	L042
1651  04fb               L242:
1652  04fb 4f            	clr	a
1653  04fc 2010          	jra	L442
1654  04fe               L042:
1655  04fe ae015b        	ldw	x,#347
1656  0501 89            	pushw	x
1657  0502 ae0000        	ldw	x,#0
1658  0505 89            	pushw	x
1659  0506 ae0000        	ldw	x,#L101
1660  0509 cd0000        	call	_assert_failed
1662  050c 5b04          	addw	sp,#4
1663  050e               L442:
1664                     ; 348   assert_param(IS_TIM1_OCIDLE_STATE_OK(TIM1_OCIdleState));
1666  050e 7b09          	ld	a,(OFST+8,sp)
1667  0510 a155          	cp	a,#85
1668  0512 2704          	jreq	L052
1669  0514 0d09          	tnz	(OFST+8,sp)
1670  0516 2603          	jrne	L642
1671  0518               L052:
1672  0518 4f            	clr	a
1673  0519 2010          	jra	L252
1674  051b               L642:
1675  051b ae015c        	ldw	x,#348
1676  051e 89            	pushw	x
1677  051f ae0000        	ldw	x,#0
1678  0522 89            	pushw	x
1679  0523 ae0000        	ldw	x,#L101
1680  0526 cd0000        	call	_assert_failed
1682  0529 5b04          	addw	sp,#4
1683  052b               L252:
1684                     ; 351   TIM1->CCER2 &= (uint8_t)(~(TIM1_CCER2_CC4E | TIM1_CCER2_CC4P));
1686  052b c6525d        	ld	a,21085
1687  052e a4cf          	and	a,#207
1688  0530 c7525d        	ld	21085,a
1689                     ; 353   TIM1->CCER2 |= (uint8_t)((uint8_t)(TIM1_OutputState & TIM1_CCER2_CC4E ) |  
1689                     ; 354                            (uint8_t)(TIM1_OCPolarity  & TIM1_CCER2_CC4P ));
1691  0533 7b08          	ld	a,(OFST+7,sp)
1692  0535 a420          	and	a,#32
1693  0537 6b01          	ld	(OFST+0,sp),a
1695  0539 7b03          	ld	a,(OFST+2,sp)
1696  053b a410          	and	a,#16
1697  053d 1a01          	or	a,(OFST+0,sp)
1698  053f ca525d        	or	a,21085
1699  0542 c7525d        	ld	21085,a
1700                     ; 357   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) | 
1700                     ; 358                           TIM1_OCMode);
1702  0545 c6525b        	ld	a,21083
1703  0548 a48f          	and	a,#143
1704  054a 1a02          	or	a,(OFST+1,sp)
1705  054c c7525b        	ld	21083,a
1706                     ; 361   if (TIM1_OCIdleState != TIM1_OCIDLESTATE_RESET)
1708  054f 0d09          	tnz	(OFST+8,sp)
1709  0551 270a          	jreq	L734
1710                     ; 363     TIM1->OISR |= (uint8_t)(~TIM1_CCER2_CC4P);
1712  0553 c6526f        	ld	a,21103
1713  0556 aadf          	or	a,#223
1714  0558 c7526f        	ld	21103,a
1716  055b 2004          	jra	L144
1717  055d               L734:
1718                     ; 367     TIM1->OISR &= (uint8_t)(~TIM1_OISR_OIS4);
1720  055d 721d526f      	bres	21103,#6
1721  0561               L144:
1722                     ; 371   TIM1->CCR4H = (uint8_t)(TIM1_Pulse >> 8);
1724  0561 7b06          	ld	a,(OFST+5,sp)
1725  0563 c7526b        	ld	21099,a
1726                     ; 372   TIM1->CCR4L = (uint8_t)(TIM1_Pulse);
1728  0566 7b07          	ld	a,(OFST+6,sp)
1729  0568 c7526c        	ld	21100,a
1730                     ; 373 }
1733  056b 5b03          	addw	sp,#3
1734  056d 81            	ret
1940                     ; 388 void TIM1_BDTRConfig(TIM1_OSSIState_TypeDef TIM1_OSSIState,
1940                     ; 389                      TIM1_LockLevel_TypeDef TIM1_LockLevel,
1940                     ; 390                      uint8_t TIM1_DeadTime,
1940                     ; 391                      TIM1_BreakState_TypeDef TIM1_Break,
1940                     ; 392                      TIM1_BreakPolarity_TypeDef TIM1_BreakPolarity,
1940                     ; 393                      TIM1_AutomaticOutput_TypeDef TIM1_AutomaticOutput)
1940                     ; 394 {
1941                     	switch	.text
1942  056e               _TIM1_BDTRConfig:
1944  056e 89            	pushw	x
1945  056f 88            	push	a
1946       00000001      OFST:	set	1
1949                     ; 396   assert_param(IS_TIM1_OSSI_STATE_OK(TIM1_OSSIState));
1951  0570 9e            	ld	a,xh
1952  0571 a104          	cp	a,#4
1953  0573 2704          	jreq	L062
1954  0575 9e            	ld	a,xh
1955  0576 4d            	tnz	a
1956  0577 2603          	jrne	L652
1957  0579               L062:
1958  0579 4f            	clr	a
1959  057a 2010          	jra	L262
1960  057c               L652:
1961  057c ae018c        	ldw	x,#396
1962  057f 89            	pushw	x
1963  0580 ae0000        	ldw	x,#0
1964  0583 89            	pushw	x
1965  0584 ae0000        	ldw	x,#L101
1966  0587 cd0000        	call	_assert_failed
1968  058a 5b04          	addw	sp,#4
1969  058c               L262:
1970                     ; 397   assert_param(IS_TIM1_LOCK_LEVEL_OK(TIM1_LockLevel));
1972  058c 0d03          	tnz	(OFST+2,sp)
1973  058e 2712          	jreq	L662
1974  0590 7b03          	ld	a,(OFST+2,sp)
1975  0592 a101          	cp	a,#1
1976  0594 270c          	jreq	L662
1977  0596 7b03          	ld	a,(OFST+2,sp)
1978  0598 a102          	cp	a,#2
1979  059a 2706          	jreq	L662
1980  059c 7b03          	ld	a,(OFST+2,sp)
1981  059e a103          	cp	a,#3
1982  05a0 2603          	jrne	L462
1983  05a2               L662:
1984  05a2 4f            	clr	a
1985  05a3 2010          	jra	L072
1986  05a5               L462:
1987  05a5 ae018d        	ldw	x,#397
1988  05a8 89            	pushw	x
1989  05a9 ae0000        	ldw	x,#0
1990  05ac 89            	pushw	x
1991  05ad ae0000        	ldw	x,#L101
1992  05b0 cd0000        	call	_assert_failed
1994  05b3 5b04          	addw	sp,#4
1995  05b5               L072:
1996                     ; 398   assert_param(IS_TIM1_BREAK_STATE_OK(TIM1_Break));
1998  05b5 7b07          	ld	a,(OFST+6,sp)
1999  05b7 a110          	cp	a,#16
2000  05b9 2704          	jreq	L472
2001  05bb 0d07          	tnz	(OFST+6,sp)
2002  05bd 2603          	jrne	L272
2003  05bf               L472:
2004  05bf 4f            	clr	a
2005  05c0 2010          	jra	L672
2006  05c2               L272:
2007  05c2 ae018e        	ldw	x,#398
2008  05c5 89            	pushw	x
2009  05c6 ae0000        	ldw	x,#0
2010  05c9 89            	pushw	x
2011  05ca ae0000        	ldw	x,#L101
2012  05cd cd0000        	call	_assert_failed
2014  05d0 5b04          	addw	sp,#4
2015  05d2               L672:
2016                     ; 399   assert_param(IS_TIM1_BREAK_POLARITY_OK(TIM1_BreakPolarity));
2018  05d2 0d08          	tnz	(OFST+7,sp)
2019  05d4 2706          	jreq	L203
2020  05d6 7b08          	ld	a,(OFST+7,sp)
2021  05d8 a120          	cp	a,#32
2022  05da 2603          	jrne	L003
2023  05dc               L203:
2024  05dc 4f            	clr	a
2025  05dd 2010          	jra	L403
2026  05df               L003:
2027  05df ae018f        	ldw	x,#399
2028  05e2 89            	pushw	x
2029  05e3 ae0000        	ldw	x,#0
2030  05e6 89            	pushw	x
2031  05e7 ae0000        	ldw	x,#L101
2032  05ea cd0000        	call	_assert_failed
2034  05ed 5b04          	addw	sp,#4
2035  05ef               L403:
2036                     ; 400   assert_param(IS_TIM1_AUTOMATIC_OUTPUT_STATE_OK(TIM1_AutomaticOutput));
2038  05ef 7b09          	ld	a,(OFST+8,sp)
2039  05f1 a140          	cp	a,#64
2040  05f3 2704          	jreq	L013
2041  05f5 0d09          	tnz	(OFST+8,sp)
2042  05f7 2603          	jrne	L603
2043  05f9               L013:
2044  05f9 4f            	clr	a
2045  05fa 2010          	jra	L213
2046  05fc               L603:
2047  05fc ae0190        	ldw	x,#400
2048  05ff 89            	pushw	x
2049  0600 ae0000        	ldw	x,#0
2050  0603 89            	pushw	x
2051  0604 ae0000        	ldw	x,#L101
2052  0607 cd0000        	call	_assert_failed
2054  060a 5b04          	addw	sp,#4
2055  060c               L213:
2056                     ; 402   TIM1->DTR = (uint8_t)(TIM1_DeadTime);
2058  060c 7b06          	ld	a,(OFST+5,sp)
2059  060e c7526e        	ld	21102,a
2060                     ; 406   TIM1->BKR  =  (uint8_t)((uint8_t)(TIM1_OSSIState | (uint8_t)TIM1_LockLevel)  | 
2060                     ; 407                           (uint8_t)((uint8_t)(TIM1_Break | (uint8_t)TIM1_BreakPolarity)  | 
2060                     ; 408                           (uint8_t)TIM1_AutomaticOutput));
2062  0611 7b07          	ld	a,(OFST+6,sp)
2063  0613 1a08          	or	a,(OFST+7,sp)
2064  0615 1a09          	or	a,(OFST+8,sp)
2065  0617 6b01          	ld	(OFST+0,sp),a
2067  0619 7b02          	ld	a,(OFST+1,sp)
2068  061b 1a03          	or	a,(OFST+2,sp)
2069  061d 1a01          	or	a,(OFST+0,sp)
2070  061f c7526d        	ld	21101,a
2071                     ; 409 }
2074  0622 5b03          	addw	sp,#3
2075  0624 81            	ret
2278                     ; 423 void TIM1_ICInit(TIM1_Channel_TypeDef TIM1_Channel,
2278                     ; 424                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2278                     ; 425                  TIM1_ICSelection_TypeDef TIM1_ICSelection,
2278                     ; 426                  TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
2278                     ; 427                  uint8_t TIM1_ICFilter)
2278                     ; 428 {
2279                     	switch	.text
2280  0625               _TIM1_ICInit:
2282  0625 89            	pushw	x
2283       00000000      OFST:	set	0
2286                     ; 430   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
2288  0626 9e            	ld	a,xh
2289  0627 4d            	tnz	a
2290  0628 270f          	jreq	L023
2291  062a 9e            	ld	a,xh
2292  062b a101          	cp	a,#1
2293  062d 270a          	jreq	L023
2294  062f 9e            	ld	a,xh
2295  0630 a102          	cp	a,#2
2296  0632 2705          	jreq	L023
2297  0634 9e            	ld	a,xh
2298  0635 a103          	cp	a,#3
2299  0637 2603          	jrne	L613
2300  0639               L023:
2301  0639 4f            	clr	a
2302  063a 2010          	jra	L223
2303  063c               L613:
2304  063c ae01ae        	ldw	x,#430
2305  063f 89            	pushw	x
2306  0640 ae0000        	ldw	x,#0
2307  0643 89            	pushw	x
2308  0644 ae0000        	ldw	x,#L101
2309  0647 cd0000        	call	_assert_failed
2311  064a 5b04          	addw	sp,#4
2312  064c               L223:
2313                     ; 431   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2315  064c 0d02          	tnz	(OFST+2,sp)
2316  064e 2706          	jreq	L623
2317  0650 7b02          	ld	a,(OFST+2,sp)
2318  0652 a101          	cp	a,#1
2319  0654 2603          	jrne	L423
2320  0656               L623:
2321  0656 4f            	clr	a
2322  0657 2010          	jra	L033
2323  0659               L423:
2324  0659 ae01af        	ldw	x,#431
2325  065c 89            	pushw	x
2326  065d ae0000        	ldw	x,#0
2327  0660 89            	pushw	x
2328  0661 ae0000        	ldw	x,#L101
2329  0664 cd0000        	call	_assert_failed
2331  0667 5b04          	addw	sp,#4
2332  0669               L033:
2333                     ; 432   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
2335  0669 7b05          	ld	a,(OFST+5,sp)
2336  066b a101          	cp	a,#1
2337  066d 270c          	jreq	L433
2338  066f 7b05          	ld	a,(OFST+5,sp)
2339  0671 a102          	cp	a,#2
2340  0673 2706          	jreq	L433
2341  0675 7b05          	ld	a,(OFST+5,sp)
2342  0677 a103          	cp	a,#3
2343  0679 2603          	jrne	L233
2344  067b               L433:
2345  067b 4f            	clr	a
2346  067c 2010          	jra	L633
2347  067e               L233:
2348  067e ae01b0        	ldw	x,#432
2349  0681 89            	pushw	x
2350  0682 ae0000        	ldw	x,#0
2351  0685 89            	pushw	x
2352  0686 ae0000        	ldw	x,#L101
2353  0689 cd0000        	call	_assert_failed
2355  068c 5b04          	addw	sp,#4
2356  068e               L633:
2357                     ; 433   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
2359  068e 0d06          	tnz	(OFST+6,sp)
2360  0690 2712          	jreq	L243
2361  0692 7b06          	ld	a,(OFST+6,sp)
2362  0694 a104          	cp	a,#4
2363  0696 270c          	jreq	L243
2364  0698 7b06          	ld	a,(OFST+6,sp)
2365  069a a108          	cp	a,#8
2366  069c 2706          	jreq	L243
2367  069e 7b06          	ld	a,(OFST+6,sp)
2368  06a0 a10c          	cp	a,#12
2369  06a2 2603          	jrne	L043
2370  06a4               L243:
2371  06a4 4f            	clr	a
2372  06a5 2010          	jra	L443
2373  06a7               L043:
2374  06a7 ae01b1        	ldw	x,#433
2375  06aa 89            	pushw	x
2376  06ab ae0000        	ldw	x,#0
2377  06ae 89            	pushw	x
2378  06af ae0000        	ldw	x,#L101
2379  06b2 cd0000        	call	_assert_failed
2381  06b5 5b04          	addw	sp,#4
2382  06b7               L443:
2383                     ; 434   assert_param(IS_TIM1_IC_FILTER_OK(TIM1_ICFilter));
2385  06b7 7b07          	ld	a,(OFST+7,sp)
2386  06b9 a110          	cp	a,#16
2387  06bb 2403          	jruge	L643
2388  06bd 4f            	clr	a
2389  06be 2010          	jra	L053
2390  06c0               L643:
2391  06c0 ae01b2        	ldw	x,#434
2392  06c3 89            	pushw	x
2393  06c4 ae0000        	ldw	x,#0
2394  06c7 89            	pushw	x
2395  06c8 ae0000        	ldw	x,#L101
2396  06cb cd0000        	call	_assert_failed
2398  06ce 5b04          	addw	sp,#4
2399  06d0               L053:
2400                     ; 436   if (TIM1_Channel == TIM1_CHANNEL_1)
2402  06d0 0d01          	tnz	(OFST+1,sp)
2403  06d2 2614          	jrne	L176
2404                     ; 439     TI1_Config((uint8_t)TIM1_ICPolarity,
2404                     ; 440                (uint8_t)TIM1_ICSelection,
2404                     ; 441                (uint8_t)TIM1_ICFilter);
2406  06d4 7b07          	ld	a,(OFST+7,sp)
2407  06d6 88            	push	a
2408  06d7 7b06          	ld	a,(OFST+6,sp)
2409  06d9 97            	ld	xl,a
2410  06da 7b03          	ld	a,(OFST+3,sp)
2411  06dc 95            	ld	xh,a
2412  06dd cd150c        	call	L3_TI1_Config
2414  06e0 84            	pop	a
2415                     ; 443     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2417  06e1 7b06          	ld	a,(OFST+6,sp)
2418  06e3 cd126b        	call	_TIM1_SetIC1Prescaler
2421  06e6 2046          	jra	L376
2422  06e8               L176:
2423                     ; 445   else if (TIM1_Channel == TIM1_CHANNEL_2)
2425  06e8 7b01          	ld	a,(OFST+1,sp)
2426  06ea a101          	cp	a,#1
2427  06ec 2614          	jrne	L576
2428                     ; 448     TI2_Config((uint8_t)TIM1_ICPolarity,
2428                     ; 449                (uint8_t)TIM1_ICSelection,
2428                     ; 450                (uint8_t)TIM1_ICFilter);
2430  06ee 7b07          	ld	a,(OFST+7,sp)
2431  06f0 88            	push	a
2432  06f1 7b06          	ld	a,(OFST+6,sp)
2433  06f3 97            	ld	xl,a
2434  06f4 7b03          	ld	a,(OFST+3,sp)
2435  06f6 95            	ld	xh,a
2436  06f7 cd153c        	call	L5_TI2_Config
2438  06fa 84            	pop	a
2439                     ; 452     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2441  06fb 7b06          	ld	a,(OFST+6,sp)
2442  06fd cd129a        	call	_TIM1_SetIC2Prescaler
2445  0700 202c          	jra	L376
2446  0702               L576:
2447                     ; 454   else if (TIM1_Channel == TIM1_CHANNEL_3)
2449  0702 7b01          	ld	a,(OFST+1,sp)
2450  0704 a102          	cp	a,#2
2451  0706 2614          	jrne	L107
2452                     ; 457     TI3_Config((uint8_t)TIM1_ICPolarity,
2452                     ; 458                (uint8_t)TIM1_ICSelection,
2452                     ; 459                (uint8_t)TIM1_ICFilter);
2454  0708 7b07          	ld	a,(OFST+7,sp)
2455  070a 88            	push	a
2456  070b 7b06          	ld	a,(OFST+6,sp)
2457  070d 97            	ld	xl,a
2458  070e 7b03          	ld	a,(OFST+3,sp)
2459  0710 95            	ld	xh,a
2460  0711 cd156c        	call	L7_TI3_Config
2462  0714 84            	pop	a
2463                     ; 461     TIM1_SetIC3Prescaler(TIM1_ICPrescaler);
2465  0715 7b06          	ld	a,(OFST+6,sp)
2466  0717 cd12c9        	call	_TIM1_SetIC3Prescaler
2469  071a 2012          	jra	L376
2470  071c               L107:
2471                     ; 466     TI4_Config((uint8_t)TIM1_ICPolarity,
2471                     ; 467                (uint8_t)TIM1_ICSelection,
2471                     ; 468                (uint8_t)TIM1_ICFilter);
2473  071c 7b07          	ld	a,(OFST+7,sp)
2474  071e 88            	push	a
2475  071f 7b06          	ld	a,(OFST+6,sp)
2476  0721 97            	ld	xl,a
2477  0722 7b03          	ld	a,(OFST+3,sp)
2478  0724 95            	ld	xh,a
2479  0725 cd159c        	call	L11_TI4_Config
2481  0728 84            	pop	a
2482                     ; 470     TIM1_SetIC4Prescaler(TIM1_ICPrescaler);
2484  0729 7b06          	ld	a,(OFST+6,sp)
2485  072b cd12f8        	call	_TIM1_SetIC4Prescaler
2487  072e               L376:
2488                     ; 472 }
2491  072e 85            	popw	x
2492  072f 81            	ret
2589                     ; 488 void TIM1_PWMIConfig(TIM1_Channel_TypeDef TIM1_Channel,
2589                     ; 489                      TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
2589                     ; 490                      TIM1_ICSelection_TypeDef TIM1_ICSelection,
2589                     ; 491                      TIM1_ICPSC_TypeDef TIM1_ICPrescaler,
2589                     ; 492                      uint8_t TIM1_ICFilter)
2589                     ; 493 {
2590                     	switch	.text
2591  0730               _TIM1_PWMIConfig:
2593  0730 89            	pushw	x
2594  0731 89            	pushw	x
2595       00000002      OFST:	set	2
2598                     ; 494   uint8_t icpolarity = TIM1_ICPOLARITY_RISING;
2600                     ; 495   uint8_t icselection = TIM1_ICSELECTION_DIRECTTI;
2602                     ; 498   assert_param(IS_TIM1_PWMI_CHANNEL_OK(TIM1_Channel));
2604  0732 9e            	ld	a,xh
2605  0733 4d            	tnz	a
2606  0734 2705          	jreq	L653
2607  0736 9e            	ld	a,xh
2608  0737 a101          	cp	a,#1
2609  0739 2603          	jrne	L453
2610  073b               L653:
2611  073b 4f            	clr	a
2612  073c 2010          	jra	L063
2613  073e               L453:
2614  073e ae01f2        	ldw	x,#498
2615  0741 89            	pushw	x
2616  0742 ae0000        	ldw	x,#0
2617  0745 89            	pushw	x
2618  0746 ae0000        	ldw	x,#L101
2619  0749 cd0000        	call	_assert_failed
2621  074c 5b04          	addw	sp,#4
2622  074e               L063:
2623                     ; 499   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
2625  074e 0d04          	tnz	(OFST+2,sp)
2626  0750 2706          	jreq	L463
2627  0752 7b04          	ld	a,(OFST+2,sp)
2628  0754 a101          	cp	a,#1
2629  0756 2603          	jrne	L263
2630  0758               L463:
2631  0758 4f            	clr	a
2632  0759 2010          	jra	L663
2633  075b               L263:
2634  075b ae01f3        	ldw	x,#499
2635  075e 89            	pushw	x
2636  075f ae0000        	ldw	x,#0
2637  0762 89            	pushw	x
2638  0763 ae0000        	ldw	x,#L101
2639  0766 cd0000        	call	_assert_failed
2641  0769 5b04          	addw	sp,#4
2642  076b               L663:
2643                     ; 500   assert_param(IS_TIM1_IC_SELECTION_OK(TIM1_ICSelection));
2645  076b 7b07          	ld	a,(OFST+5,sp)
2646  076d a101          	cp	a,#1
2647  076f 270c          	jreq	L273
2648  0771 7b07          	ld	a,(OFST+5,sp)
2649  0773 a102          	cp	a,#2
2650  0775 2706          	jreq	L273
2651  0777 7b07          	ld	a,(OFST+5,sp)
2652  0779 a103          	cp	a,#3
2653  077b 2603          	jrne	L073
2654  077d               L273:
2655  077d 4f            	clr	a
2656  077e 2010          	jra	L473
2657  0780               L073:
2658  0780 ae01f4        	ldw	x,#500
2659  0783 89            	pushw	x
2660  0784 ae0000        	ldw	x,#0
2661  0787 89            	pushw	x
2662  0788 ae0000        	ldw	x,#L101
2663  078b cd0000        	call	_assert_failed
2665  078e 5b04          	addw	sp,#4
2666  0790               L473:
2667                     ; 501   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_ICPrescaler));
2669  0790 0d08          	tnz	(OFST+6,sp)
2670  0792 2712          	jreq	L004
2671  0794 7b08          	ld	a,(OFST+6,sp)
2672  0796 a104          	cp	a,#4
2673  0798 270c          	jreq	L004
2674  079a 7b08          	ld	a,(OFST+6,sp)
2675  079c a108          	cp	a,#8
2676  079e 2706          	jreq	L004
2677  07a0 7b08          	ld	a,(OFST+6,sp)
2678  07a2 a10c          	cp	a,#12
2679  07a4 2603          	jrne	L673
2680  07a6               L004:
2681  07a6 4f            	clr	a
2682  07a7 2010          	jra	L204
2683  07a9               L673:
2684  07a9 ae01f5        	ldw	x,#501
2685  07ac 89            	pushw	x
2686  07ad ae0000        	ldw	x,#0
2687  07b0 89            	pushw	x
2688  07b1 ae0000        	ldw	x,#L101
2689  07b4 cd0000        	call	_assert_failed
2691  07b7 5b04          	addw	sp,#4
2692  07b9               L204:
2693                     ; 504   if (TIM1_ICPolarity != TIM1_ICPOLARITY_FALLING)
2695  07b9 7b04          	ld	a,(OFST+2,sp)
2696  07bb a101          	cp	a,#1
2697  07bd 2706          	jreq	L357
2698                     ; 506     icpolarity = TIM1_ICPOLARITY_FALLING;
2700  07bf a601          	ld	a,#1
2701  07c1 6b01          	ld	(OFST-1,sp),a
2704  07c3 2002          	jra	L557
2705  07c5               L357:
2706                     ; 510     icpolarity = TIM1_ICPOLARITY_RISING;
2708  07c5 0f01          	clr	(OFST-1,sp)
2710  07c7               L557:
2711                     ; 514   if (TIM1_ICSelection == TIM1_ICSELECTION_DIRECTTI)
2713  07c7 7b07          	ld	a,(OFST+5,sp)
2714  07c9 a101          	cp	a,#1
2715  07cb 2606          	jrne	L757
2716                     ; 516     icselection = TIM1_ICSELECTION_INDIRECTTI;
2718  07cd a602          	ld	a,#2
2719  07cf 6b02          	ld	(OFST+0,sp),a
2722  07d1 2004          	jra	L167
2723  07d3               L757:
2724                     ; 520     icselection = TIM1_ICSELECTION_DIRECTTI;
2726  07d3 a601          	ld	a,#1
2727  07d5 6b02          	ld	(OFST+0,sp),a
2729  07d7               L167:
2730                     ; 523   if (TIM1_Channel == TIM1_CHANNEL_1)
2732  07d7 0d03          	tnz	(OFST+1,sp)
2733  07d9 2626          	jrne	L367
2734                     ; 526     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2734                     ; 527                (uint8_t)TIM1_ICFilter);
2736  07db 7b09          	ld	a,(OFST+7,sp)
2737  07dd 88            	push	a
2738  07de 7b08          	ld	a,(OFST+6,sp)
2739  07e0 97            	ld	xl,a
2740  07e1 7b05          	ld	a,(OFST+3,sp)
2741  07e3 95            	ld	xh,a
2742  07e4 cd150c        	call	L3_TI1_Config
2744  07e7 84            	pop	a
2745                     ; 530     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2747  07e8 7b08          	ld	a,(OFST+6,sp)
2748  07ea cd126b        	call	_TIM1_SetIC1Prescaler
2750                     ; 533     TI2_Config(icpolarity, icselection, TIM1_ICFilter);
2752  07ed 7b09          	ld	a,(OFST+7,sp)
2753  07ef 88            	push	a
2754  07f0 7b03          	ld	a,(OFST+1,sp)
2755  07f2 97            	ld	xl,a
2756  07f3 7b02          	ld	a,(OFST+0,sp)
2757  07f5 95            	ld	xh,a
2758  07f6 cd153c        	call	L5_TI2_Config
2760  07f9 84            	pop	a
2761                     ; 536     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2763  07fa 7b08          	ld	a,(OFST+6,sp)
2764  07fc cd129a        	call	_TIM1_SetIC2Prescaler
2767  07ff 2024          	jra	L567
2768  0801               L367:
2769                     ; 541     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSelection,
2769                     ; 542                (uint8_t)TIM1_ICFilter);
2771  0801 7b09          	ld	a,(OFST+7,sp)
2772  0803 88            	push	a
2773  0804 7b08          	ld	a,(OFST+6,sp)
2774  0806 97            	ld	xl,a
2775  0807 7b05          	ld	a,(OFST+3,sp)
2776  0809 95            	ld	xh,a
2777  080a cd153c        	call	L5_TI2_Config
2779  080d 84            	pop	a
2780                     ; 545     TIM1_SetIC2Prescaler(TIM1_ICPrescaler);
2782  080e 7b08          	ld	a,(OFST+6,sp)
2783  0810 cd129a        	call	_TIM1_SetIC2Prescaler
2785                     ; 548     TI1_Config(icpolarity, icselection, TIM1_ICFilter);
2787  0813 7b09          	ld	a,(OFST+7,sp)
2788  0815 88            	push	a
2789  0816 7b03          	ld	a,(OFST+1,sp)
2790  0818 97            	ld	xl,a
2791  0819 7b02          	ld	a,(OFST+0,sp)
2792  081b 95            	ld	xh,a
2793  081c cd150c        	call	L3_TI1_Config
2795  081f 84            	pop	a
2796                     ; 551     TIM1_SetIC1Prescaler(TIM1_ICPrescaler);
2798  0820 7b08          	ld	a,(OFST+6,sp)
2799  0822 cd126b        	call	_TIM1_SetIC1Prescaler
2801  0825               L567:
2802                     ; 553 }
2805  0825 5b04          	addw	sp,#4
2806  0827 81            	ret
2862                     ; 561 void TIM1_Cmd(FunctionalState NewState)
2862                     ; 562 {
2863                     	switch	.text
2864  0828               _TIM1_Cmd:
2866  0828 88            	push	a
2867       00000000      OFST:	set	0
2870                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2872  0829 4d            	tnz	a
2873  082a 2704          	jreq	L014
2874  082c a101          	cp	a,#1
2875  082e 2603          	jrne	L604
2876  0830               L014:
2877  0830 4f            	clr	a
2878  0831 2010          	jra	L214
2879  0833               L604:
2880  0833 ae0234        	ldw	x,#564
2881  0836 89            	pushw	x
2882  0837 ae0000        	ldw	x,#0
2883  083a 89            	pushw	x
2884  083b ae0000        	ldw	x,#L101
2885  083e cd0000        	call	_assert_failed
2887  0841 5b04          	addw	sp,#4
2888  0843               L214:
2889                     ; 567   if (NewState != DISABLE)
2891  0843 0d01          	tnz	(OFST+1,sp)
2892  0845 2706          	jreq	L5101
2893                     ; 569     TIM1->CR1 |= TIM1_CR1_CEN;
2895  0847 72105250      	bset	21072,#0
2897  084b 2004          	jra	L7101
2898  084d               L5101:
2899                     ; 573     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_CEN);
2901  084d 72115250      	bres	21072,#0
2902  0851               L7101:
2903                     ; 575 }
2906  0851 84            	pop	a
2907  0852 81            	ret
2944                     ; 583 void TIM1_CtrlPWMOutputs(FunctionalState NewState)
2944                     ; 584 {
2945                     	switch	.text
2946  0853               _TIM1_CtrlPWMOutputs:
2948  0853 88            	push	a
2949       00000000      OFST:	set	0
2952                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2954  0854 4d            	tnz	a
2955  0855 2704          	jreq	L024
2956  0857 a101          	cp	a,#1
2957  0859 2603          	jrne	L614
2958  085b               L024:
2959  085b 4f            	clr	a
2960  085c 2010          	jra	L224
2961  085e               L614:
2962  085e ae024a        	ldw	x,#586
2963  0861 89            	pushw	x
2964  0862 ae0000        	ldw	x,#0
2965  0865 89            	pushw	x
2966  0866 ae0000        	ldw	x,#L101
2967  0869 cd0000        	call	_assert_failed
2969  086c 5b04          	addw	sp,#4
2970  086e               L224:
2971                     ; 590   if (NewState != DISABLE)
2973  086e 0d01          	tnz	(OFST+1,sp)
2974  0870 2706          	jreq	L7301
2975                     ; 592     TIM1->BKR |= TIM1_BKR_MOE;
2977  0872 721e526d      	bset	21101,#7
2979  0876 2004          	jra	L1401
2980  0878               L7301:
2981                     ; 596     TIM1->BKR &= (uint8_t)(~TIM1_BKR_MOE);
2983  0878 721f526d      	bres	21101,#7
2984  087c               L1401:
2985                     ; 598 }
2988  087c 84            	pop	a
2989  087d 81            	ret
3097                     ; 617 void TIM1_ITConfig(TIM1_IT_TypeDef  TIM1_IT, FunctionalState NewState)
3097                     ; 618 {
3098                     	switch	.text
3099  087e               _TIM1_ITConfig:
3101  087e 89            	pushw	x
3102       00000000      OFST:	set	0
3105                     ; 620   assert_param(IS_TIM1_IT_OK(TIM1_IT));
3107  087f 9e            	ld	a,xh
3108  0880 4d            	tnz	a
3109  0881 2703          	jreq	L624
3110  0883 4f            	clr	a
3111  0884 2010          	jra	L034
3112  0886               L624:
3113  0886 ae026c        	ldw	x,#620
3114  0889 89            	pushw	x
3115  088a ae0000        	ldw	x,#0
3116  088d 89            	pushw	x
3117  088e ae0000        	ldw	x,#L101
3118  0891 cd0000        	call	_assert_failed
3120  0894 5b04          	addw	sp,#4
3121  0896               L034:
3122                     ; 621   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3124  0896 0d02          	tnz	(OFST+2,sp)
3125  0898 2706          	jreq	L434
3126  089a 7b02          	ld	a,(OFST+2,sp)
3127  089c a101          	cp	a,#1
3128  089e 2603          	jrne	L234
3129  08a0               L434:
3130  08a0 4f            	clr	a
3131  08a1 2010          	jra	L634
3132  08a3               L234:
3133  08a3 ae026d        	ldw	x,#621
3134  08a6 89            	pushw	x
3135  08a7 ae0000        	ldw	x,#0
3136  08aa 89            	pushw	x
3137  08ab ae0000        	ldw	x,#L101
3138  08ae cd0000        	call	_assert_failed
3140  08b1 5b04          	addw	sp,#4
3141  08b3               L634:
3142                     ; 623   if (NewState != DISABLE)
3144  08b3 0d02          	tnz	(OFST+2,sp)
3145  08b5 270a          	jreq	L1111
3146                     ; 626     TIM1->IER |= (uint8_t)TIM1_IT;
3148  08b7 c65254        	ld	a,21076
3149  08ba 1a01          	or	a,(OFST+1,sp)
3150  08bc c75254        	ld	21076,a
3152  08bf 2009          	jra	L3111
3153  08c1               L1111:
3154                     ; 631     TIM1->IER &= (uint8_t)(~(uint8_t)TIM1_IT);
3156  08c1 7b01          	ld	a,(OFST+1,sp)
3157  08c3 43            	cpl	a
3158  08c4 c45254        	and	a,21076
3159  08c7 c75254        	ld	21076,a
3160  08ca               L3111:
3161                     ; 633 }
3164  08ca 85            	popw	x
3165  08cb 81            	ret
3189                     ; 640 void TIM1_InternalClockConfig(void)
3189                     ; 641 {
3190                     	switch	.text
3191  08cc               _TIM1_InternalClockConfig:
3195                     ; 643   TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_SMS);
3197  08cc c65252        	ld	a,21074
3198  08cf a4f8          	and	a,#248
3199  08d1 c75252        	ld	21074,a
3200                     ; 644 }
3203  08d4 81            	ret
3321                     ; 662 void TIM1_ETRClockMode1Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3321                     ; 663                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3321                     ; 664                               uint8_t ExtTRGFilter)
3321                     ; 665 {
3322                     	switch	.text
3323  08d5               _TIM1_ETRClockMode1Config:
3325  08d5 89            	pushw	x
3326       00000000      OFST:	set	0
3329                     ; 667   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
3331  08d6 9e            	ld	a,xh
3332  08d7 4d            	tnz	a
3333  08d8 270f          	jreq	L644
3334  08da 9e            	ld	a,xh
3335  08db a110          	cp	a,#16
3336  08dd 270a          	jreq	L644
3337  08df 9e            	ld	a,xh
3338  08e0 a120          	cp	a,#32
3339  08e2 2705          	jreq	L644
3340  08e4 9e            	ld	a,xh
3341  08e5 a130          	cp	a,#48
3342  08e7 2603          	jrne	L444
3343  08e9               L644:
3344  08e9 4f            	clr	a
3345  08ea 2010          	jra	L054
3346  08ec               L444:
3347  08ec ae029b        	ldw	x,#667
3348  08ef 89            	pushw	x
3349  08f0 ae0000        	ldw	x,#0
3350  08f3 89            	pushw	x
3351  08f4 ae0000        	ldw	x,#L101
3352  08f7 cd0000        	call	_assert_failed
3354  08fa 5b04          	addw	sp,#4
3355  08fc               L054:
3356                     ; 668   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
3358  08fc 7b02          	ld	a,(OFST+2,sp)
3359  08fe a180          	cp	a,#128
3360  0900 2704          	jreq	L454
3361  0902 0d02          	tnz	(OFST+2,sp)
3362  0904 2603          	jrne	L254
3363  0906               L454:
3364  0906 4f            	clr	a
3365  0907 2010          	jra	L654
3366  0909               L254:
3367  0909 ae029c        	ldw	x,#668
3368  090c 89            	pushw	x
3369  090d ae0000        	ldw	x,#0
3370  0910 89            	pushw	x
3371  0911 ae0000        	ldw	x,#L101
3372  0914 cd0000        	call	_assert_failed
3374  0917 5b04          	addw	sp,#4
3375  0919               L654:
3376                     ; 671   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3378  0919 7b05          	ld	a,(OFST+5,sp)
3379  091b 88            	push	a
3380  091c 7b03          	ld	a,(OFST+3,sp)
3381  091e 97            	ld	xl,a
3382  091f 7b02          	ld	a,(OFST+2,sp)
3383  0921 95            	ld	xh,a
3384  0922 ad63          	call	_TIM1_ETRConfig
3386  0924 84            	pop	a
3387                     ; 674   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~(uint8_t)(TIM1_SMCR_SMS | TIM1_SMCR_TS )))
3387                     ; 675                          | (uint8_t)((uint8_t)TIM1_SLAVEMODE_EXTERNAL1 | TIM1_TS_ETRF ));
3389  0925 c65252        	ld	a,21074
3390  0928 a488          	and	a,#136
3391  092a aa77          	or	a,#119
3392  092c c75252        	ld	21074,a
3393                     ; 676 }
3396  092f 85            	popw	x
3397  0930 81            	ret
3456                     ; 694 void TIM1_ETRClockMode2Config(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3456                     ; 695                               TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3456                     ; 696                               uint8_t ExtTRGFilter)
3456                     ; 697 {
3457                     	switch	.text
3458  0931               _TIM1_ETRClockMode2Config:
3460  0931 89            	pushw	x
3461       00000000      OFST:	set	0
3464                     ; 699   assert_param(IS_TIM1_EXT_PRESCALER_OK(TIM1_ExtTRGPrescaler));
3466  0932 9e            	ld	a,xh
3467  0933 4d            	tnz	a
3468  0934 270f          	jreq	L464
3469  0936 9e            	ld	a,xh
3470  0937 a110          	cp	a,#16
3471  0939 270a          	jreq	L464
3472  093b 9e            	ld	a,xh
3473  093c a120          	cp	a,#32
3474  093e 2705          	jreq	L464
3475  0940 9e            	ld	a,xh
3476  0941 a130          	cp	a,#48
3477  0943 2603          	jrne	L264
3478  0945               L464:
3479  0945 4f            	clr	a
3480  0946 2010          	jra	L664
3481  0948               L264:
3482  0948 ae02bb        	ldw	x,#699
3483  094b 89            	pushw	x
3484  094c ae0000        	ldw	x,#0
3485  094f 89            	pushw	x
3486  0950 ae0000        	ldw	x,#L101
3487  0953 cd0000        	call	_assert_failed
3489  0956 5b04          	addw	sp,#4
3490  0958               L664:
3491                     ; 700   assert_param(IS_TIM1_EXT_POLARITY_OK(TIM1_ExtTRGPolarity));
3493  0958 7b02          	ld	a,(OFST+2,sp)
3494  095a a180          	cp	a,#128
3495  095c 2704          	jreq	L274
3496  095e 0d02          	tnz	(OFST+2,sp)
3497  0960 2603          	jrne	L074
3498  0962               L274:
3499  0962 4f            	clr	a
3500  0963 2010          	jra	L474
3501  0965               L074:
3502  0965 ae02bc        	ldw	x,#700
3503  0968 89            	pushw	x
3504  0969 ae0000        	ldw	x,#0
3505  096c 89            	pushw	x
3506  096d ae0000        	ldw	x,#L101
3507  0970 cd0000        	call	_assert_failed
3509  0973 5b04          	addw	sp,#4
3510  0975               L474:
3511                     ; 703   TIM1_ETRConfig(TIM1_ExtTRGPrescaler, TIM1_ExtTRGPolarity, ExtTRGFilter);
3513  0975 7b05          	ld	a,(OFST+5,sp)
3514  0977 88            	push	a
3515  0978 7b03          	ld	a,(OFST+3,sp)
3516  097a 97            	ld	xl,a
3517  097b 7b02          	ld	a,(OFST+2,sp)
3518  097d 95            	ld	xh,a
3519  097e ad07          	call	_TIM1_ETRConfig
3521  0980 84            	pop	a
3522                     ; 706   TIM1->ETR |= TIM1_ETR_ECE;
3524  0981 721c5253      	bset	21075,#6
3525                     ; 707 }
3528  0985 85            	popw	x
3529  0986 81            	ret
3586                     ; 725 void TIM1_ETRConfig(TIM1_ExtTRGPSC_TypeDef TIM1_ExtTRGPrescaler,
3586                     ; 726                     TIM1_ExtTRGPolarity_TypeDef TIM1_ExtTRGPolarity,
3586                     ; 727                     uint8_t ExtTRGFilter)
3586                     ; 728 {
3587                     	switch	.text
3588  0987               _TIM1_ETRConfig:
3590  0987 89            	pushw	x
3591       00000000      OFST:	set	0
3594                     ; 730   assert_param(IS_TIM1_EXT_TRG_FILTER_OK(ExtTRGFilter));
3596  0988 7b05          	ld	a,(OFST+5,sp)
3597  098a a110          	cp	a,#16
3598  098c 2403          	jruge	L005
3599  098e 4f            	clr	a
3600  098f 2010          	jra	L205
3601  0991               L005:
3602  0991 ae02da        	ldw	x,#730
3603  0994 89            	pushw	x
3604  0995 ae0000        	ldw	x,#0
3605  0998 89            	pushw	x
3606  0999 ae0000        	ldw	x,#L101
3607  099c cd0000        	call	_assert_failed
3609  099f 5b04          	addw	sp,#4
3610  09a1               L205:
3611                     ; 732   TIM1->ETR |= (uint8_t)((uint8_t)(TIM1_ExtTRGPrescaler | (uint8_t)TIM1_ExtTRGPolarity )|
3611                     ; 733                          (uint8_t)ExtTRGFilter );
3613  09a1 7b01          	ld	a,(OFST+1,sp)
3614  09a3 1a02          	or	a,(OFST+2,sp)
3615  09a5 1a05          	or	a,(OFST+5,sp)
3616  09a7 ca5253        	or	a,21075
3617  09aa c75253        	ld	21075,a
3618                     ; 734 }
3621  09ad 85            	popw	x
3622  09ae 81            	ret
3712                     ; 751 void TIM1_TIxExternalClockConfig(TIM1_TIxExternalCLK1Source_TypeDef TIM1_TIxExternalCLKSource,
3712                     ; 752                                  TIM1_ICPolarity_TypeDef TIM1_ICPolarity,
3712                     ; 753                                  uint8_t ICFilter)
3712                     ; 754 {
3713                     	switch	.text
3714  09af               _TIM1_TIxExternalClockConfig:
3716  09af 89            	pushw	x
3717       00000000      OFST:	set	0
3720                     ; 756   assert_param(IS_TIM1_TIXCLK_SOURCE_OK(TIM1_TIxExternalCLKSource));
3722  09b0 9e            	ld	a,xh
3723  09b1 a140          	cp	a,#64
3724  09b3 270a          	jreq	L015
3725  09b5 9e            	ld	a,xh
3726  09b6 a160          	cp	a,#96
3727  09b8 2705          	jreq	L015
3728  09ba 9e            	ld	a,xh
3729  09bb a150          	cp	a,#80
3730  09bd 2603          	jrne	L605
3731  09bf               L015:
3732  09bf 4f            	clr	a
3733  09c0 2010          	jra	L215
3734  09c2               L605:
3735  09c2 ae02f4        	ldw	x,#756
3736  09c5 89            	pushw	x
3737  09c6 ae0000        	ldw	x,#0
3738  09c9 89            	pushw	x
3739  09ca ae0000        	ldw	x,#L101
3740  09cd cd0000        	call	_assert_failed
3742  09d0 5b04          	addw	sp,#4
3743  09d2               L215:
3744                     ; 757   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_ICPolarity));
3746  09d2 0d02          	tnz	(OFST+2,sp)
3747  09d4 2706          	jreq	L615
3748  09d6 7b02          	ld	a,(OFST+2,sp)
3749  09d8 a101          	cp	a,#1
3750  09da 2603          	jrne	L415
3751  09dc               L615:
3752  09dc 4f            	clr	a
3753  09dd 2010          	jra	L025
3754  09df               L415:
3755  09df ae02f5        	ldw	x,#757
3756  09e2 89            	pushw	x
3757  09e3 ae0000        	ldw	x,#0
3758  09e6 89            	pushw	x
3759  09e7 ae0000        	ldw	x,#L101
3760  09ea cd0000        	call	_assert_failed
3762  09ed 5b04          	addw	sp,#4
3763  09ef               L025:
3764                     ; 758   assert_param(IS_TIM1_IC_FILTER_OK(ICFilter));
3766  09ef 7b05          	ld	a,(OFST+5,sp)
3767  09f1 a110          	cp	a,#16
3768  09f3 2403          	jruge	L225
3769  09f5 4f            	clr	a
3770  09f6 2010          	jra	L425
3771  09f8               L225:
3772  09f8 ae02f6        	ldw	x,#758
3773  09fb 89            	pushw	x
3774  09fc ae0000        	ldw	x,#0
3775  09ff 89            	pushw	x
3776  0a00 ae0000        	ldw	x,#L101
3777  0a03 cd0000        	call	_assert_failed
3779  0a06 5b04          	addw	sp,#4
3780  0a08               L425:
3781                     ; 761   if (TIM1_TIxExternalCLKSource == TIM1_TIXEXTERNALCLK1SOURCE_TI2)
3783  0a08 7b01          	ld	a,(OFST+1,sp)
3784  0a0a a160          	cp	a,#96
3785  0a0c 260f          	jrne	L3131
3786                     ; 763     TI2_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
3788  0a0e 7b05          	ld	a,(OFST+5,sp)
3789  0a10 88            	push	a
3790  0a11 7b03          	ld	a,(OFST+3,sp)
3791  0a13 ae0001        	ldw	x,#1
3792  0a16 95            	ld	xh,a
3793  0a17 cd153c        	call	L5_TI2_Config
3795  0a1a 84            	pop	a
3797  0a1b 200d          	jra	L5131
3798  0a1d               L3131:
3799                     ; 767     TI1_Config((uint8_t)TIM1_ICPolarity, (uint8_t)TIM1_ICSELECTION_DIRECTTI, (uint8_t)ICFilter);
3801  0a1d 7b05          	ld	a,(OFST+5,sp)
3802  0a1f 88            	push	a
3803  0a20 7b03          	ld	a,(OFST+3,sp)
3804  0a22 ae0001        	ldw	x,#1
3805  0a25 95            	ld	xh,a
3806  0a26 cd150c        	call	L3_TI1_Config
3808  0a29 84            	pop	a
3809  0a2a               L5131:
3810                     ; 771   TIM1_SelectInputTrigger((TIM1_TS_TypeDef)TIM1_TIxExternalCLKSource);
3812  0a2a 7b01          	ld	a,(OFST+1,sp)
3813  0a2c ad0a          	call	_TIM1_SelectInputTrigger
3815                     ; 774   TIM1->SMCR |= (uint8_t)(TIM1_SLAVEMODE_EXTERNAL1);
3817  0a2e c65252        	ld	a,21074
3818  0a31 aa07          	or	a,#7
3819  0a33 c75252        	ld	21074,a
3820                     ; 775 }
3823  0a36 85            	popw	x
3824  0a37 81            	ret
3910                     ; 787 void TIM1_SelectInputTrigger(TIM1_TS_TypeDef TIM1_InputTriggerSource)
3910                     ; 788 {
3911                     	switch	.text
3912  0a38               _TIM1_SelectInputTrigger:
3914  0a38 88            	push	a
3915       00000000      OFST:	set	0
3918                     ; 790   assert_param(IS_TIM1_TRIGGER_SELECTION_OK(TIM1_InputTriggerSource));
3920  0a39 a140          	cp	a,#64
3921  0a3b 2713          	jreq	L235
3922  0a3d a150          	cp	a,#80
3923  0a3f 270f          	jreq	L235
3924  0a41 a160          	cp	a,#96
3925  0a43 270b          	jreq	L235
3926  0a45 a170          	cp	a,#112
3927  0a47 2707          	jreq	L235
3928  0a49 a130          	cp	a,#48
3929  0a4b 2703          	jreq	L235
3930  0a4d 4d            	tnz	a
3931  0a4e 2603          	jrne	L035
3932  0a50               L235:
3933  0a50 4f            	clr	a
3934  0a51 2010          	jra	L435
3935  0a53               L035:
3936  0a53 ae0316        	ldw	x,#790
3937  0a56 89            	pushw	x
3938  0a57 ae0000        	ldw	x,#0
3939  0a5a 89            	pushw	x
3940  0a5b ae0000        	ldw	x,#L101
3941  0a5e cd0000        	call	_assert_failed
3943  0a61 5b04          	addw	sp,#4
3944  0a63               L435:
3945                     ; 793   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_TS)) | (uint8_t)TIM1_InputTriggerSource);
3947  0a63 c65252        	ld	a,21074
3948  0a66 a48f          	and	a,#143
3949  0a68 1a01          	or	a,(OFST+1,sp)
3950  0a6a c75252        	ld	21074,a
3951                     ; 794 }
3954  0a6d 84            	pop	a
3955  0a6e 81            	ret
3992                     ; 803 void TIM1_UpdateDisableConfig(FunctionalState NewState)
3992                     ; 804 {
3993                     	switch	.text
3994  0a6f               _TIM1_UpdateDisableConfig:
3996  0a6f 88            	push	a
3997       00000000      OFST:	set	0
4000                     ; 806   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4002  0a70 4d            	tnz	a
4003  0a71 2704          	jreq	L245
4004  0a73 a101          	cp	a,#1
4005  0a75 2603          	jrne	L045
4006  0a77               L245:
4007  0a77 4f            	clr	a
4008  0a78 2010          	jra	L445
4009  0a7a               L045:
4010  0a7a ae0326        	ldw	x,#806
4011  0a7d 89            	pushw	x
4012  0a7e ae0000        	ldw	x,#0
4013  0a81 89            	pushw	x
4014  0a82 ae0000        	ldw	x,#L101
4015  0a85 cd0000        	call	_assert_failed
4017  0a88 5b04          	addw	sp,#4
4018  0a8a               L445:
4019                     ; 809   if (NewState != DISABLE)
4021  0a8a 0d01          	tnz	(OFST+1,sp)
4022  0a8c 2706          	jreq	L3731
4023                     ; 811     TIM1->CR1 |= TIM1_CR1_UDIS;
4025  0a8e 72125250      	bset	21072,#1
4027  0a92 2004          	jra	L5731
4028  0a94               L3731:
4029                     ; 815     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_UDIS);
4031  0a94 72135250      	bres	21072,#1
4032  0a98               L5731:
4033                     ; 817 }
4036  0a98 84            	pop	a
4037  0a99 81            	ret
4096                     ; 827 void TIM1_UpdateRequestConfig(TIM1_UpdateSource_TypeDef TIM1_UpdateSource)
4096                     ; 828 {
4097                     	switch	.text
4098  0a9a               _TIM1_UpdateRequestConfig:
4100  0a9a 88            	push	a
4101       00000000      OFST:	set	0
4104                     ; 830   assert_param(IS_TIM1_UPDATE_SOURCE_OK(TIM1_UpdateSource));
4106  0a9b 4d            	tnz	a
4107  0a9c 2704          	jreq	L255
4108  0a9e a101          	cp	a,#1
4109  0aa0 2603          	jrne	L055
4110  0aa2               L255:
4111  0aa2 4f            	clr	a
4112  0aa3 2010          	jra	L455
4113  0aa5               L055:
4114  0aa5 ae033e        	ldw	x,#830
4115  0aa8 89            	pushw	x
4116  0aa9 ae0000        	ldw	x,#0
4117  0aac 89            	pushw	x
4118  0aad ae0000        	ldw	x,#L101
4119  0ab0 cd0000        	call	_assert_failed
4121  0ab3 5b04          	addw	sp,#4
4122  0ab5               L455:
4123                     ; 833   if (TIM1_UpdateSource != TIM1_UPDATESOURCE_GLOBAL)
4125  0ab5 0d01          	tnz	(OFST+1,sp)
4126  0ab7 2706          	jreq	L5241
4127                     ; 835     TIM1->CR1 |= TIM1_CR1_URS;
4129  0ab9 72145250      	bset	21072,#2
4131  0abd 2004          	jra	L7241
4132  0abf               L5241:
4133                     ; 839     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_URS);
4135  0abf 72155250      	bres	21072,#2
4136  0ac3               L7241:
4137                     ; 841 }
4140  0ac3 84            	pop	a
4141  0ac4 81            	ret
4178                     ; 849 void TIM1_SelectHallSensor(FunctionalState NewState)
4178                     ; 850 {
4179                     	switch	.text
4180  0ac5               _TIM1_SelectHallSensor:
4182  0ac5 88            	push	a
4183       00000000      OFST:	set	0
4186                     ; 852   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4188  0ac6 4d            	tnz	a
4189  0ac7 2704          	jreq	L265
4190  0ac9 a101          	cp	a,#1
4191  0acb 2603          	jrne	L065
4192  0acd               L265:
4193  0acd 4f            	clr	a
4194  0ace 2010          	jra	L465
4195  0ad0               L065:
4196  0ad0 ae0354        	ldw	x,#852
4197  0ad3 89            	pushw	x
4198  0ad4 ae0000        	ldw	x,#0
4199  0ad7 89            	pushw	x
4200  0ad8 ae0000        	ldw	x,#L101
4201  0adb cd0000        	call	_assert_failed
4203  0ade 5b04          	addw	sp,#4
4204  0ae0               L465:
4205                     ; 855   if (NewState != DISABLE)
4207  0ae0 0d01          	tnz	(OFST+1,sp)
4208  0ae2 2706          	jreq	L7441
4209                     ; 857     TIM1->CR2 |= TIM1_CR2_TI1S;
4211  0ae4 721e5251      	bset	21073,#7
4213  0ae8 2004          	jra	L1541
4214  0aea               L7441:
4215                     ; 861     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_TI1S);
4217  0aea 721f5251      	bres	21073,#7
4218  0aee               L1541:
4219                     ; 863 }
4222  0aee 84            	pop	a
4223  0aef 81            	ret
4281                     ; 873 void TIM1_SelectOnePulseMode(TIM1_OPMode_TypeDef TIM1_OPMode)
4281                     ; 874 {
4282                     	switch	.text
4283  0af0               _TIM1_SelectOnePulseMode:
4285  0af0 88            	push	a
4286       00000000      OFST:	set	0
4289                     ; 876   assert_param(IS_TIM1_OPM_MODE_OK(TIM1_OPMode));
4291  0af1 a101          	cp	a,#1
4292  0af3 2703          	jreq	L275
4293  0af5 4d            	tnz	a
4294  0af6 2603          	jrne	L075
4295  0af8               L275:
4296  0af8 4f            	clr	a
4297  0af9 2010          	jra	L475
4298  0afb               L075:
4299  0afb ae036c        	ldw	x,#876
4300  0afe 89            	pushw	x
4301  0aff ae0000        	ldw	x,#0
4302  0b02 89            	pushw	x
4303  0b03 ae0000        	ldw	x,#L101
4304  0b06 cd0000        	call	_assert_failed
4306  0b09 5b04          	addw	sp,#4
4307  0b0b               L475:
4308                     ; 879   if (TIM1_OPMode != TIM1_OPMODE_REPETITIVE)
4310  0b0b 0d01          	tnz	(OFST+1,sp)
4311  0b0d 2706          	jreq	L1051
4312                     ; 881     TIM1->CR1 |= TIM1_CR1_OPM;
4314  0b0f 72165250      	bset	21072,#3
4316  0b13 2004          	jra	L3051
4317  0b15               L1051:
4318                     ; 885     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_OPM);
4320  0b15 72175250      	bres	21072,#3
4321  0b19               L3051:
4322                     ; 888 }
4325  0b19 84            	pop	a
4326  0b1a 81            	ret
4425                     ; 903 void TIM1_SelectOutputTrigger(TIM1_TRGOSource_TypeDef TIM1_TRGOSource)
4425                     ; 904 {
4426                     	switch	.text
4427  0b1b               _TIM1_SelectOutputTrigger:
4429  0b1b 88            	push	a
4430       00000000      OFST:	set	0
4433                     ; 906   assert_param(IS_TIM1_TRGO_SOURCE_OK(TIM1_TRGOSource));
4435  0b1c 4d            	tnz	a
4436  0b1d 2718          	jreq	L206
4437  0b1f a110          	cp	a,#16
4438  0b21 2714          	jreq	L206
4439  0b23 a120          	cp	a,#32
4440  0b25 2710          	jreq	L206
4441  0b27 a130          	cp	a,#48
4442  0b29 270c          	jreq	L206
4443  0b2b a140          	cp	a,#64
4444  0b2d 2708          	jreq	L206
4445  0b2f a150          	cp	a,#80
4446  0b31 2704          	jreq	L206
4447  0b33 a160          	cp	a,#96
4448  0b35 2603          	jrne	L006
4449  0b37               L206:
4450  0b37 4f            	clr	a
4451  0b38 2010          	jra	L406
4452  0b3a               L006:
4453  0b3a ae038a        	ldw	x,#906
4454  0b3d 89            	pushw	x
4455  0b3e ae0000        	ldw	x,#0
4456  0b41 89            	pushw	x
4457  0b42 ae0000        	ldw	x,#L101
4458  0b45 cd0000        	call	_assert_failed
4460  0b48 5b04          	addw	sp,#4
4461  0b4a               L406:
4462                     ; 909   TIM1->CR2 = (uint8_t)((uint8_t)(TIM1->CR2 & (uint8_t)(~TIM1_CR2_MMS)) | 
4462                     ; 910                         (uint8_t) TIM1_TRGOSource);
4464  0b4a c65251        	ld	a,21073
4465  0b4d a48f          	and	a,#143
4466  0b4f 1a01          	or	a,(OFST+1,sp)
4467  0b51 c75251        	ld	21073,a
4468                     ; 911 }
4471  0b54 84            	pop	a
4472  0b55 81            	ret
4547                     ; 923 void TIM1_SelectSlaveMode(TIM1_SlaveMode_TypeDef TIM1_SlaveMode)
4547                     ; 924 {
4548                     	switch	.text
4549  0b56               _TIM1_SelectSlaveMode:
4551  0b56 88            	push	a
4552       00000000      OFST:	set	0
4555                     ; 926   assert_param(IS_TIM1_SLAVE_MODE_OK(TIM1_SlaveMode));
4557  0b57 a104          	cp	a,#4
4558  0b59 270c          	jreq	L216
4559  0b5b a105          	cp	a,#5
4560  0b5d 2708          	jreq	L216
4561  0b5f a106          	cp	a,#6
4562  0b61 2704          	jreq	L216
4563  0b63 a107          	cp	a,#7
4564  0b65 2603          	jrne	L016
4565  0b67               L216:
4566  0b67 4f            	clr	a
4567  0b68 2010          	jra	L416
4568  0b6a               L016:
4569  0b6a ae039e        	ldw	x,#926
4570  0b6d 89            	pushw	x
4571  0b6e ae0000        	ldw	x,#0
4572  0b71 89            	pushw	x
4573  0b72 ae0000        	ldw	x,#L101
4574  0b75 cd0000        	call	_assert_failed
4576  0b78 5b04          	addw	sp,#4
4577  0b7a               L416:
4578                     ; 929   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(~TIM1_SMCR_SMS)) |
4578                     ; 930                          (uint8_t)TIM1_SlaveMode);
4580  0b7a c65252        	ld	a,21074
4581  0b7d a4f8          	and	a,#248
4582  0b7f 1a01          	or	a,(OFST+1,sp)
4583  0b81 c75252        	ld	21074,a
4584                     ; 931 }
4587  0b84 84            	pop	a
4588  0b85 81            	ret
4625                     ; 939 void TIM1_SelectMasterSlaveMode(FunctionalState NewState)
4625                     ; 940 {
4626                     	switch	.text
4627  0b86               _TIM1_SelectMasterSlaveMode:
4629  0b86 88            	push	a
4630       00000000      OFST:	set	0
4633                     ; 942   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
4635  0b87 4d            	tnz	a
4636  0b88 2704          	jreq	L226
4637  0b8a a101          	cp	a,#1
4638  0b8c 2603          	jrne	L026
4639  0b8e               L226:
4640  0b8e 4f            	clr	a
4641  0b8f 2010          	jra	L426
4642  0b91               L026:
4643  0b91 ae03ae        	ldw	x,#942
4644  0b94 89            	pushw	x
4645  0b95 ae0000        	ldw	x,#0
4646  0b98 89            	pushw	x
4647  0b99 ae0000        	ldw	x,#L101
4648  0b9c cd0000        	call	_assert_failed
4650  0b9f 5b04          	addw	sp,#4
4651  0ba1               L426:
4652                     ; 945   if (NewState != DISABLE)
4654  0ba1 0d01          	tnz	(OFST+1,sp)
4655  0ba3 2706          	jreq	L5161
4656                     ; 947     TIM1->SMCR |= TIM1_SMCR_MSM;
4658  0ba5 721e5252      	bset	21074,#7
4660  0ba9 2004          	jra	L7161
4661  0bab               L5161:
4662                     ; 951     TIM1->SMCR &= (uint8_t)(~TIM1_SMCR_MSM);
4664  0bab 721f5252      	bres	21074,#7
4665  0baf               L7161:
4666                     ; 953 }
4669  0baf 84            	pop	a
4670  0bb0 81            	ret
4757                     ; 975 void TIM1_EncoderInterfaceConfig(TIM1_EncoderMode_TypeDef TIM1_EncoderMode,
4757                     ; 976                                  TIM1_ICPolarity_TypeDef TIM1_IC1Polarity,
4757                     ; 977                                  TIM1_ICPolarity_TypeDef TIM1_IC2Polarity)
4757                     ; 978 {
4758                     	switch	.text
4759  0bb1               _TIM1_EncoderInterfaceConfig:
4761  0bb1 89            	pushw	x
4762       00000000      OFST:	set	0
4765                     ; 980   assert_param(IS_TIM1_ENCODER_MODE_OK(TIM1_EncoderMode));
4767  0bb2 9e            	ld	a,xh
4768  0bb3 a101          	cp	a,#1
4769  0bb5 270a          	jreq	L236
4770  0bb7 9e            	ld	a,xh
4771  0bb8 a102          	cp	a,#2
4772  0bba 2705          	jreq	L236
4773  0bbc 9e            	ld	a,xh
4774  0bbd a103          	cp	a,#3
4775  0bbf 2603          	jrne	L036
4776  0bc1               L236:
4777  0bc1 4f            	clr	a
4778  0bc2 2010          	jra	L436
4779  0bc4               L036:
4780  0bc4 ae03d4        	ldw	x,#980
4781  0bc7 89            	pushw	x
4782  0bc8 ae0000        	ldw	x,#0
4783  0bcb 89            	pushw	x
4784  0bcc ae0000        	ldw	x,#L101
4785  0bcf cd0000        	call	_assert_failed
4787  0bd2 5b04          	addw	sp,#4
4788  0bd4               L436:
4789                     ; 981   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC1Polarity));
4791  0bd4 0d02          	tnz	(OFST+2,sp)
4792  0bd6 2706          	jreq	L046
4793  0bd8 7b02          	ld	a,(OFST+2,sp)
4794  0bda a101          	cp	a,#1
4795  0bdc 2603          	jrne	L636
4796  0bde               L046:
4797  0bde 4f            	clr	a
4798  0bdf 2010          	jra	L246
4799  0be1               L636:
4800  0be1 ae03d5        	ldw	x,#981
4801  0be4 89            	pushw	x
4802  0be5 ae0000        	ldw	x,#0
4803  0be8 89            	pushw	x
4804  0be9 ae0000        	ldw	x,#L101
4805  0bec cd0000        	call	_assert_failed
4807  0bef 5b04          	addw	sp,#4
4808  0bf1               L246:
4809                     ; 982   assert_param(IS_TIM1_IC_POLARITY_OK(TIM1_IC2Polarity));
4811  0bf1 0d05          	tnz	(OFST+5,sp)
4812  0bf3 2706          	jreq	L646
4813  0bf5 7b05          	ld	a,(OFST+5,sp)
4814  0bf7 a101          	cp	a,#1
4815  0bf9 2603          	jrne	L446
4816  0bfb               L646:
4817  0bfb 4f            	clr	a
4818  0bfc 2010          	jra	L056
4819  0bfe               L446:
4820  0bfe ae03d6        	ldw	x,#982
4821  0c01 89            	pushw	x
4822  0c02 ae0000        	ldw	x,#0
4823  0c05 89            	pushw	x
4824  0c06 ae0000        	ldw	x,#L101
4825  0c09 cd0000        	call	_assert_failed
4827  0c0c 5b04          	addw	sp,#4
4828  0c0e               L056:
4829                     ; 985   if (TIM1_IC1Polarity != TIM1_ICPOLARITY_RISING)
4831  0c0e 0d02          	tnz	(OFST+2,sp)
4832  0c10 2706          	jreq	L1661
4833                     ; 987     TIM1->CCER1 |= TIM1_CCER1_CC1P;
4835  0c12 7212525c      	bset	21084,#1
4837  0c16 2004          	jra	L3661
4838  0c18               L1661:
4839                     ; 991     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
4841  0c18 7213525c      	bres	21084,#1
4842  0c1c               L3661:
4843                     ; 994   if (TIM1_IC2Polarity != TIM1_ICPOLARITY_RISING)
4845  0c1c 0d05          	tnz	(OFST+5,sp)
4846  0c1e 2706          	jreq	L5661
4847                     ; 996     TIM1->CCER1 |= TIM1_CCER1_CC2P;
4849  0c20 721a525c      	bset	21084,#5
4851  0c24 2004          	jra	L7661
4852  0c26               L5661:
4853                     ; 1000     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
4855  0c26 721b525c      	bres	21084,#5
4856  0c2a               L7661:
4857                     ; 1003   TIM1->SMCR = (uint8_t)((uint8_t)(TIM1->SMCR & (uint8_t)(TIM1_SMCR_MSM | TIM1_SMCR_TS))
4857                     ; 1004                          | (uint8_t) TIM1_EncoderMode);
4859  0c2a c65252        	ld	a,21074
4860  0c2d a4f0          	and	a,#240
4861  0c2f 1a01          	or	a,(OFST+1,sp)
4862  0c31 c75252        	ld	21074,a
4863                     ; 1007   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_CCxS)) 
4863                     ; 1008                           | (uint8_t) CCMR_TIxDirect_Set);
4865  0c34 c65258        	ld	a,21080
4866  0c37 a4fc          	and	a,#252
4867  0c39 aa01          	or	a,#1
4868  0c3b c75258        	ld	21080,a
4869                     ; 1009   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_CCxS))
4869                     ; 1010                           | (uint8_t) CCMR_TIxDirect_Set);
4871  0c3e c65259        	ld	a,21081
4872  0c41 a4fc          	and	a,#252
4873  0c43 aa01          	or	a,#1
4874  0c45 c75259        	ld	21081,a
4875                     ; 1011 }
4878  0c48 85            	popw	x
4879  0c49 81            	ret
4947                     ; 1023 void TIM1_PrescalerConfig(uint16_t Prescaler,
4947                     ; 1024                           TIM1_PSCReloadMode_TypeDef TIM1_PSCReloadMode)
4947                     ; 1025 {
4948                     	switch	.text
4949  0c4a               _TIM1_PrescalerConfig:
4951  0c4a 89            	pushw	x
4952       00000000      OFST:	set	0
4955                     ; 1027   assert_param(IS_TIM1_PRESCALER_RELOAD_OK(TIM1_PSCReloadMode));
4957  0c4b 0d05          	tnz	(OFST+5,sp)
4958  0c4d 2706          	jreq	L656
4959  0c4f 7b05          	ld	a,(OFST+5,sp)
4960  0c51 a101          	cp	a,#1
4961  0c53 2603          	jrne	L456
4962  0c55               L656:
4963  0c55 4f            	clr	a
4964  0c56 2010          	jra	L066
4965  0c58               L456:
4966  0c58 ae0403        	ldw	x,#1027
4967  0c5b 89            	pushw	x
4968  0c5c ae0000        	ldw	x,#0
4969  0c5f 89            	pushw	x
4970  0c60 ae0000        	ldw	x,#L101
4971  0c63 cd0000        	call	_assert_failed
4973  0c66 5b04          	addw	sp,#4
4974  0c68               L066:
4975                     ; 1030   TIM1->PSCRH = (uint8_t)(Prescaler >> 8);
4977  0c68 7b01          	ld	a,(OFST+1,sp)
4978  0c6a c75260        	ld	21088,a
4979                     ; 1031   TIM1->PSCRL = (uint8_t)(Prescaler);
4981  0c6d 7b02          	ld	a,(OFST+2,sp)
4982  0c6f c75261        	ld	21089,a
4983                     ; 1034   TIM1->EGR = (uint8_t)TIM1_PSCReloadMode;
4985  0c72 7b05          	ld	a,(OFST+5,sp)
4986  0c74 c75257        	ld	21079,a
4987                     ; 1035 }
4990  0c77 85            	popw	x
4991  0c78 81            	ret
5028                     ; 1048 void TIM1_CounterModeConfig(TIM1_CounterMode_TypeDef TIM1_CounterMode)
5028                     ; 1049 {
5029                     	switch	.text
5030  0c79               _TIM1_CounterModeConfig:
5032  0c79 88            	push	a
5033       00000000      OFST:	set	0
5036                     ; 1051   assert_param(IS_TIM1_COUNTER_MODE_OK(TIM1_CounterMode));
5038  0c7a 4d            	tnz	a
5039  0c7b 2710          	jreq	L666
5040  0c7d a110          	cp	a,#16
5041  0c7f 270c          	jreq	L666
5042  0c81 a120          	cp	a,#32
5043  0c83 2708          	jreq	L666
5044  0c85 a140          	cp	a,#64
5045  0c87 2704          	jreq	L666
5046  0c89 a160          	cp	a,#96
5047  0c8b 2603          	jrne	L466
5048  0c8d               L666:
5049  0c8d 4f            	clr	a
5050  0c8e 2010          	jra	L076
5051  0c90               L466:
5052  0c90 ae041b        	ldw	x,#1051
5053  0c93 89            	pushw	x
5054  0c94 ae0000        	ldw	x,#0
5055  0c97 89            	pushw	x
5056  0c98 ae0000        	ldw	x,#L101
5057  0c9b cd0000        	call	_assert_failed
5059  0c9e 5b04          	addw	sp,#4
5060  0ca0               L076:
5061                     ; 1055   TIM1->CR1 = (uint8_t)((uint8_t)(TIM1->CR1 & (uint8_t)((uint8_t)(~TIM1_CR1_CMS) & (uint8_t)(~TIM1_CR1_DIR)))
5061                     ; 1056                         | (uint8_t)TIM1_CounterMode);
5063  0ca0 c65250        	ld	a,21072
5064  0ca3 a48f          	and	a,#143
5065  0ca5 1a01          	or	a,(OFST+1,sp)
5066  0ca7 c75250        	ld	21072,a
5067                     ; 1057 }
5070  0caa 84            	pop	a
5071  0cab 81            	ret
5130                     ; 1067 void TIM1_ForcedOC1Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5130                     ; 1068 {
5131                     	switch	.text
5132  0cac               _TIM1_ForcedOC1Config:
5134  0cac 88            	push	a
5135       00000000      OFST:	set	0
5138                     ; 1070   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5140  0cad a150          	cp	a,#80
5141  0caf 2704          	jreq	L676
5142  0cb1 a140          	cp	a,#64
5143  0cb3 2603          	jrne	L476
5144  0cb5               L676:
5145  0cb5 4f            	clr	a
5146  0cb6 2010          	jra	L007
5147  0cb8               L476:
5148  0cb8 ae042e        	ldw	x,#1070
5149  0cbb 89            	pushw	x
5150  0cbc ae0000        	ldw	x,#0
5151  0cbf 89            	pushw	x
5152  0cc0 ae0000        	ldw	x,#L101
5153  0cc3 cd0000        	call	_assert_failed
5155  0cc6 5b04          	addw	sp,#4
5156  0cc8               L007:
5157                     ; 1073   TIM1->CCMR1 =  (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM))|
5157                     ; 1074                            (uint8_t)TIM1_ForcedAction);
5159  0cc8 c65258        	ld	a,21080
5160  0ccb a48f          	and	a,#143
5161  0ccd 1a01          	or	a,(OFST+1,sp)
5162  0ccf c75258        	ld	21080,a
5163                     ; 1075 }
5166  0cd2 84            	pop	a
5167  0cd3 81            	ret
5204                     ; 1085 void TIM1_ForcedOC2Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5204                     ; 1086 {
5205                     	switch	.text
5206  0cd4               _TIM1_ForcedOC2Config:
5208  0cd4 88            	push	a
5209       00000000      OFST:	set	0
5212                     ; 1088   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5214  0cd5 a150          	cp	a,#80
5215  0cd7 2704          	jreq	L607
5216  0cd9 a140          	cp	a,#64
5217  0cdb 2603          	jrne	L407
5218  0cdd               L607:
5219  0cdd 4f            	clr	a
5220  0cde 2010          	jra	L017
5221  0ce0               L407:
5222  0ce0 ae0440        	ldw	x,#1088
5223  0ce3 89            	pushw	x
5224  0ce4 ae0000        	ldw	x,#0
5225  0ce7 89            	pushw	x
5226  0ce8 ae0000        	ldw	x,#L101
5227  0ceb cd0000        	call	_assert_failed
5229  0cee 5b04          	addw	sp,#4
5230  0cf0               L017:
5231                     ; 1091   TIM1->CCMR2  =  (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
5231                     ; 1092                             | (uint8_t)TIM1_ForcedAction);
5233  0cf0 c65259        	ld	a,21081
5234  0cf3 a48f          	and	a,#143
5235  0cf5 1a01          	or	a,(OFST+1,sp)
5236  0cf7 c75259        	ld	21081,a
5237                     ; 1093 }
5240  0cfa 84            	pop	a
5241  0cfb 81            	ret
5278                     ; 1104 void TIM1_ForcedOC3Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5278                     ; 1105 {
5279                     	switch	.text
5280  0cfc               _TIM1_ForcedOC3Config:
5282  0cfc 88            	push	a
5283       00000000      OFST:	set	0
5286                     ; 1107   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5288  0cfd a150          	cp	a,#80
5289  0cff 2704          	jreq	L617
5290  0d01 a140          	cp	a,#64
5291  0d03 2603          	jrne	L417
5292  0d05               L617:
5293  0d05 4f            	clr	a
5294  0d06 2010          	jra	L027
5295  0d08               L417:
5296  0d08 ae0453        	ldw	x,#1107
5297  0d0b 89            	pushw	x
5298  0d0c ae0000        	ldw	x,#0
5299  0d0f 89            	pushw	x
5300  0d10 ae0000        	ldw	x,#L101
5301  0d13 cd0000        	call	_assert_failed
5303  0d16 5b04          	addw	sp,#4
5304  0d18               L027:
5305                     ; 1110   TIM1->CCMR3  =  (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM))  
5305                     ; 1111                             | (uint8_t)TIM1_ForcedAction);
5307  0d18 c6525a        	ld	a,21082
5308  0d1b a48f          	and	a,#143
5309  0d1d 1a01          	or	a,(OFST+1,sp)
5310  0d1f c7525a        	ld	21082,a
5311                     ; 1112 }
5314  0d22 84            	pop	a
5315  0d23 81            	ret
5352                     ; 1123 void TIM1_ForcedOC4Config(TIM1_ForcedAction_TypeDef TIM1_ForcedAction)
5352                     ; 1124 {
5353                     	switch	.text
5354  0d24               _TIM1_ForcedOC4Config:
5356  0d24 88            	push	a
5357       00000000      OFST:	set	0
5360                     ; 1126   assert_param(IS_TIM1_FORCED_ACTION_OK(TIM1_ForcedAction));
5362  0d25 a150          	cp	a,#80
5363  0d27 2704          	jreq	L627
5364  0d29 a140          	cp	a,#64
5365  0d2b 2603          	jrne	L427
5366  0d2d               L627:
5367  0d2d 4f            	clr	a
5368  0d2e 2010          	jra	L037
5369  0d30               L427:
5370  0d30 ae0466        	ldw	x,#1126
5371  0d33 89            	pushw	x
5372  0d34 ae0000        	ldw	x,#0
5373  0d37 89            	pushw	x
5374  0d38 ae0000        	ldw	x,#L101
5375  0d3b cd0000        	call	_assert_failed
5377  0d3e 5b04          	addw	sp,#4
5378  0d40               L037:
5379                     ; 1129   TIM1->CCMR4  =  (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
5379                     ; 1130                             | (uint8_t)TIM1_ForcedAction);
5381  0d40 c6525b        	ld	a,21083
5382  0d43 a48f          	and	a,#143
5383  0d45 1a01          	or	a,(OFST+1,sp)
5384  0d47 c7525b        	ld	21083,a
5385                     ; 1131 }
5388  0d4a 84            	pop	a
5389  0d4b 81            	ret
5426                     ; 1139 void TIM1_ARRPreloadConfig(FunctionalState NewState)
5426                     ; 1140 {
5427                     	switch	.text
5428  0d4c               _TIM1_ARRPreloadConfig:
5430  0d4c 88            	push	a
5431       00000000      OFST:	set	0
5434                     ; 1142   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5436  0d4d 4d            	tnz	a
5437  0d4e 2704          	jreq	L637
5438  0d50 a101          	cp	a,#1
5439  0d52 2603          	jrne	L437
5440  0d54               L637:
5441  0d54 4f            	clr	a
5442  0d55 2010          	jra	L047
5443  0d57               L437:
5444  0d57 ae0476        	ldw	x,#1142
5445  0d5a 89            	pushw	x
5446  0d5b ae0000        	ldw	x,#0
5447  0d5e 89            	pushw	x
5448  0d5f ae0000        	ldw	x,#L101
5449  0d62 cd0000        	call	_assert_failed
5451  0d65 5b04          	addw	sp,#4
5452  0d67               L047:
5453                     ; 1145   if (NewState != DISABLE)
5455  0d67 0d01          	tnz	(OFST+1,sp)
5456  0d69 2706          	jreq	L7502
5457                     ; 1147     TIM1->CR1 |= TIM1_CR1_ARPE;
5459  0d6b 721e5250      	bset	21072,#7
5461  0d6f 2004          	jra	L1602
5462  0d71               L7502:
5463                     ; 1151     TIM1->CR1 &= (uint8_t)(~TIM1_CR1_ARPE);
5465  0d71 721f5250      	bres	21072,#7
5466  0d75               L1602:
5467                     ; 1153 }
5470  0d75 84            	pop	a
5471  0d76 81            	ret
5507                     ; 1161 void TIM1_SelectCOM(FunctionalState NewState)
5507                     ; 1162 {
5508                     	switch	.text
5509  0d77               _TIM1_SelectCOM:
5511  0d77 88            	push	a
5512       00000000      OFST:	set	0
5515                     ; 1164   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5517  0d78 4d            	tnz	a
5518  0d79 2704          	jreq	L647
5519  0d7b a101          	cp	a,#1
5520  0d7d 2603          	jrne	L447
5521  0d7f               L647:
5522  0d7f 4f            	clr	a
5523  0d80 2010          	jra	L057
5524  0d82               L447:
5525  0d82 ae048c        	ldw	x,#1164
5526  0d85 89            	pushw	x
5527  0d86 ae0000        	ldw	x,#0
5528  0d89 89            	pushw	x
5529  0d8a ae0000        	ldw	x,#L101
5530  0d8d cd0000        	call	_assert_failed
5532  0d90 5b04          	addw	sp,#4
5533  0d92               L057:
5534                     ; 1167   if (NewState != DISABLE)
5536  0d92 0d01          	tnz	(OFST+1,sp)
5537  0d94 2706          	jreq	L1012
5538                     ; 1169     TIM1->CR2 |= TIM1_CR2_COMS;
5540  0d96 72145251      	bset	21073,#2
5542  0d9a 2004          	jra	L3012
5543  0d9c               L1012:
5544                     ; 1173     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_COMS);
5546  0d9c 72155251      	bres	21073,#2
5547  0da0               L3012:
5548                     ; 1175 }
5551  0da0 84            	pop	a
5552  0da1 81            	ret
5589                     ; 1183 void TIM1_CCPreloadControl(FunctionalState NewState)
5589                     ; 1184 {
5590                     	switch	.text
5591  0da2               _TIM1_CCPreloadControl:
5593  0da2 88            	push	a
5594       00000000      OFST:	set	0
5597                     ; 1186   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5599  0da3 4d            	tnz	a
5600  0da4 2704          	jreq	L657
5601  0da6 a101          	cp	a,#1
5602  0da8 2603          	jrne	L457
5603  0daa               L657:
5604  0daa 4f            	clr	a
5605  0dab 2010          	jra	L067
5606  0dad               L457:
5607  0dad ae04a2        	ldw	x,#1186
5608  0db0 89            	pushw	x
5609  0db1 ae0000        	ldw	x,#0
5610  0db4 89            	pushw	x
5611  0db5 ae0000        	ldw	x,#L101
5612  0db8 cd0000        	call	_assert_failed
5614  0dbb 5b04          	addw	sp,#4
5615  0dbd               L067:
5616                     ; 1189   if (NewState != DISABLE)
5618  0dbd 0d01          	tnz	(OFST+1,sp)
5619  0dbf 2706          	jreq	L3212
5620                     ; 1191     TIM1->CR2 |= TIM1_CR2_CCPC;
5622  0dc1 72105251      	bset	21073,#0
5624  0dc5 2004          	jra	L5212
5625  0dc7               L3212:
5626                     ; 1195     TIM1->CR2 &= (uint8_t)(~TIM1_CR2_CCPC);
5628  0dc7 72115251      	bres	21073,#0
5629  0dcb               L5212:
5630                     ; 1197 }
5633  0dcb 84            	pop	a
5634  0dcc 81            	ret
5671                     ; 1205 void TIM1_OC1PreloadConfig(FunctionalState NewState)
5671                     ; 1206 {
5672                     	switch	.text
5673  0dcd               _TIM1_OC1PreloadConfig:
5675  0dcd 88            	push	a
5676       00000000      OFST:	set	0
5679                     ; 1208   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5681  0dce 4d            	tnz	a
5682  0dcf 2704          	jreq	L667
5683  0dd1 a101          	cp	a,#1
5684  0dd3 2603          	jrne	L467
5685  0dd5               L667:
5686  0dd5 4f            	clr	a
5687  0dd6 2010          	jra	L077
5688  0dd8               L467:
5689  0dd8 ae04b8        	ldw	x,#1208
5690  0ddb 89            	pushw	x
5691  0ddc ae0000        	ldw	x,#0
5692  0ddf 89            	pushw	x
5693  0de0 ae0000        	ldw	x,#L101
5694  0de3 cd0000        	call	_assert_failed
5696  0de6 5b04          	addw	sp,#4
5697  0de8               L077:
5698                     ; 1211   if (NewState != DISABLE)
5700  0de8 0d01          	tnz	(OFST+1,sp)
5701  0dea 2706          	jreq	L5412
5702                     ; 1213     TIM1->CCMR1 |= TIM1_CCMR_OCxPE;
5704  0dec 72165258      	bset	21080,#3
5706  0df0 2004          	jra	L7412
5707  0df2               L5412:
5708                     ; 1217     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5710  0df2 72175258      	bres	21080,#3
5711  0df6               L7412:
5712                     ; 1219 }
5715  0df6 84            	pop	a
5716  0df7 81            	ret
5753                     ; 1227 void TIM1_OC2PreloadConfig(FunctionalState NewState)
5753                     ; 1228 {
5754                     	switch	.text
5755  0df8               _TIM1_OC2PreloadConfig:
5757  0df8 88            	push	a
5758       00000000      OFST:	set	0
5761                     ; 1230   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5763  0df9 4d            	tnz	a
5764  0dfa 2704          	jreq	L677
5765  0dfc a101          	cp	a,#1
5766  0dfe 2603          	jrne	L477
5767  0e00               L677:
5768  0e00 4f            	clr	a
5769  0e01 2010          	jra	L0001
5770  0e03               L477:
5771  0e03 ae04ce        	ldw	x,#1230
5772  0e06 89            	pushw	x
5773  0e07 ae0000        	ldw	x,#0
5774  0e0a 89            	pushw	x
5775  0e0b ae0000        	ldw	x,#L101
5776  0e0e cd0000        	call	_assert_failed
5778  0e11 5b04          	addw	sp,#4
5779  0e13               L0001:
5780                     ; 1233   if (NewState != DISABLE)
5782  0e13 0d01          	tnz	(OFST+1,sp)
5783  0e15 2706          	jreq	L7612
5784                     ; 1235     TIM1->CCMR2 |= TIM1_CCMR_OCxPE;
5786  0e17 72165259      	bset	21081,#3
5788  0e1b 2004          	jra	L1712
5789  0e1d               L7612:
5790                     ; 1239     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5792  0e1d 72175259      	bres	21081,#3
5793  0e21               L1712:
5794                     ; 1241 }
5797  0e21 84            	pop	a
5798  0e22 81            	ret
5835                     ; 1249 void TIM1_OC3PreloadConfig(FunctionalState NewState)
5835                     ; 1250 {
5836                     	switch	.text
5837  0e23               _TIM1_OC3PreloadConfig:
5839  0e23 88            	push	a
5840       00000000      OFST:	set	0
5843                     ; 1252   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5845  0e24 4d            	tnz	a
5846  0e25 2704          	jreq	L6001
5847  0e27 a101          	cp	a,#1
5848  0e29 2603          	jrne	L4001
5849  0e2b               L6001:
5850  0e2b 4f            	clr	a
5851  0e2c 2010          	jra	L0101
5852  0e2e               L4001:
5853  0e2e ae04e4        	ldw	x,#1252
5854  0e31 89            	pushw	x
5855  0e32 ae0000        	ldw	x,#0
5856  0e35 89            	pushw	x
5857  0e36 ae0000        	ldw	x,#L101
5858  0e39 cd0000        	call	_assert_failed
5860  0e3c 5b04          	addw	sp,#4
5861  0e3e               L0101:
5862                     ; 1255   if (NewState != DISABLE)
5864  0e3e 0d01          	tnz	(OFST+1,sp)
5865  0e40 2706          	jreq	L1122
5866                     ; 1257     TIM1->CCMR3 |= TIM1_CCMR_OCxPE;
5868  0e42 7216525a      	bset	21082,#3
5870  0e46 2004          	jra	L3122
5871  0e48               L1122:
5872                     ; 1261     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5874  0e48 7217525a      	bres	21082,#3
5875  0e4c               L3122:
5876                     ; 1263 }
5879  0e4c 84            	pop	a
5880  0e4d 81            	ret
5917                     ; 1271 void TIM1_OC4PreloadConfig(FunctionalState NewState)
5917                     ; 1272 {
5918                     	switch	.text
5919  0e4e               _TIM1_OC4PreloadConfig:
5921  0e4e 88            	push	a
5922       00000000      OFST:	set	0
5925                     ; 1274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
5927  0e4f 4d            	tnz	a
5928  0e50 2704          	jreq	L6101
5929  0e52 a101          	cp	a,#1
5930  0e54 2603          	jrne	L4101
5931  0e56               L6101:
5932  0e56 4f            	clr	a
5933  0e57 2010          	jra	L0201
5934  0e59               L4101:
5935  0e59 ae04fa        	ldw	x,#1274
5936  0e5c 89            	pushw	x
5937  0e5d ae0000        	ldw	x,#0
5938  0e60 89            	pushw	x
5939  0e61 ae0000        	ldw	x,#L101
5940  0e64 cd0000        	call	_assert_failed
5942  0e67 5b04          	addw	sp,#4
5943  0e69               L0201:
5944                     ; 1277   if (NewState != DISABLE)
5946  0e69 0d01          	tnz	(OFST+1,sp)
5947  0e6b 2706          	jreq	L3322
5948                     ; 1279     TIM1->CCMR4 |= TIM1_CCMR_OCxPE;
5950  0e6d 7216525b      	bset	21083,#3
5952  0e71 2004          	jra	L5322
5953  0e73               L3322:
5954                     ; 1283     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxPE);
5956  0e73 7217525b      	bres	21083,#3
5957  0e77               L5322:
5958                     ; 1285 }
5961  0e77 84            	pop	a
5962  0e78 81            	ret
5998                     ; 1293 void TIM1_OC1FastConfig(FunctionalState NewState)
5998                     ; 1294 {
5999                     	switch	.text
6000  0e79               _TIM1_OC1FastConfig:
6002  0e79 88            	push	a
6003       00000000      OFST:	set	0
6006                     ; 1296   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6008  0e7a 4d            	tnz	a
6009  0e7b 2704          	jreq	L6201
6010  0e7d a101          	cp	a,#1
6011  0e7f 2603          	jrne	L4201
6012  0e81               L6201:
6013  0e81 4f            	clr	a
6014  0e82 2010          	jra	L0301
6015  0e84               L4201:
6016  0e84 ae0510        	ldw	x,#1296
6017  0e87 89            	pushw	x
6018  0e88 ae0000        	ldw	x,#0
6019  0e8b 89            	pushw	x
6020  0e8c ae0000        	ldw	x,#L101
6021  0e8f cd0000        	call	_assert_failed
6023  0e92 5b04          	addw	sp,#4
6024  0e94               L0301:
6025                     ; 1299   if (NewState != DISABLE)
6027  0e94 0d01          	tnz	(OFST+1,sp)
6028  0e96 2706          	jreq	L5522
6029                     ; 1301     TIM1->CCMR1 |= TIM1_CCMR_OCxFE;
6031  0e98 72145258      	bset	21080,#2
6033  0e9c 2004          	jra	L7522
6034  0e9e               L5522:
6035                     ; 1305     TIM1->CCMR1 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6037  0e9e 72155258      	bres	21080,#2
6038  0ea2               L7522:
6039                     ; 1307 }
6042  0ea2 84            	pop	a
6043  0ea3 81            	ret
6079                     ; 1315 void TIM1_OC2FastConfig(FunctionalState NewState)
6079                     ; 1316 {
6080                     	switch	.text
6081  0ea4               _TIM1_OC2FastConfig:
6083  0ea4 88            	push	a
6084       00000000      OFST:	set	0
6087                     ; 1318   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6089  0ea5 4d            	tnz	a
6090  0ea6 2704          	jreq	L6301
6091  0ea8 a101          	cp	a,#1
6092  0eaa 2603          	jrne	L4301
6093  0eac               L6301:
6094  0eac 4f            	clr	a
6095  0ead 2010          	jra	L0401
6096  0eaf               L4301:
6097  0eaf ae0526        	ldw	x,#1318
6098  0eb2 89            	pushw	x
6099  0eb3 ae0000        	ldw	x,#0
6100  0eb6 89            	pushw	x
6101  0eb7 ae0000        	ldw	x,#L101
6102  0eba cd0000        	call	_assert_failed
6104  0ebd 5b04          	addw	sp,#4
6105  0ebf               L0401:
6106                     ; 1321   if (NewState != DISABLE)
6108  0ebf 0d01          	tnz	(OFST+1,sp)
6109  0ec1 2706          	jreq	L7722
6110                     ; 1323     TIM1->CCMR2 |= TIM1_CCMR_OCxFE;
6112  0ec3 72145259      	bset	21081,#2
6114  0ec7 2004          	jra	L1032
6115  0ec9               L7722:
6116                     ; 1327     TIM1->CCMR2 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6118  0ec9 72155259      	bres	21081,#2
6119  0ecd               L1032:
6120                     ; 1329 }
6123  0ecd 84            	pop	a
6124  0ece 81            	ret
6160                     ; 1337 void TIM1_OC3FastConfig(FunctionalState NewState)
6160                     ; 1338 {
6161                     	switch	.text
6162  0ecf               _TIM1_OC3FastConfig:
6164  0ecf 88            	push	a
6165       00000000      OFST:	set	0
6168                     ; 1340   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6170  0ed0 4d            	tnz	a
6171  0ed1 2704          	jreq	L6401
6172  0ed3 a101          	cp	a,#1
6173  0ed5 2603          	jrne	L4401
6174  0ed7               L6401:
6175  0ed7 4f            	clr	a
6176  0ed8 2010          	jra	L0501
6177  0eda               L4401:
6178  0eda ae053c        	ldw	x,#1340
6179  0edd 89            	pushw	x
6180  0ede ae0000        	ldw	x,#0
6181  0ee1 89            	pushw	x
6182  0ee2 ae0000        	ldw	x,#L101
6183  0ee5 cd0000        	call	_assert_failed
6185  0ee8 5b04          	addw	sp,#4
6186  0eea               L0501:
6187                     ; 1343   if (NewState != DISABLE)
6189  0eea 0d01          	tnz	(OFST+1,sp)
6190  0eec 2706          	jreq	L1232
6191                     ; 1345     TIM1->CCMR3 |= TIM1_CCMR_OCxFE;
6193  0eee 7214525a      	bset	21082,#2
6195  0ef2 2004          	jra	L3232
6196  0ef4               L1232:
6197                     ; 1349     TIM1->CCMR3 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6199  0ef4 7215525a      	bres	21082,#2
6200  0ef8               L3232:
6201                     ; 1351 }
6204  0ef8 84            	pop	a
6205  0ef9 81            	ret
6241                     ; 1359 void TIM1_OC4FastConfig(FunctionalState NewState)
6241                     ; 1360 {
6242                     	switch	.text
6243  0efa               _TIM1_OC4FastConfig:
6245  0efa 88            	push	a
6246       00000000      OFST:	set	0
6249                     ; 1362   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
6251  0efb 4d            	tnz	a
6252  0efc 2704          	jreq	L6501
6253  0efe a101          	cp	a,#1
6254  0f00 2603          	jrne	L4501
6255  0f02               L6501:
6256  0f02 4f            	clr	a
6257  0f03 2010          	jra	L0601
6258  0f05               L4501:
6259  0f05 ae0552        	ldw	x,#1362
6260  0f08 89            	pushw	x
6261  0f09 ae0000        	ldw	x,#0
6262  0f0c 89            	pushw	x
6263  0f0d ae0000        	ldw	x,#L101
6264  0f10 cd0000        	call	_assert_failed
6266  0f13 5b04          	addw	sp,#4
6267  0f15               L0601:
6268                     ; 1365   if (NewState != DISABLE)
6270  0f15 0d01          	tnz	(OFST+1,sp)
6271  0f17 2706          	jreq	L3432
6272                     ; 1367     TIM1->CCMR4 |= TIM1_CCMR_OCxFE;
6274  0f19 7214525b      	bset	21083,#2
6276  0f1d 2004          	jra	L5432
6277  0f1f               L3432:
6278                     ; 1371     TIM1->CCMR4 &= (uint8_t)(~TIM1_CCMR_OCxFE);
6280  0f1f 7215525b      	bres	21083,#2
6281  0f23               L5432:
6282                     ; 1373 }
6285  0f23 84            	pop	a
6286  0f24 81            	ret
6392                     ; 1389 void TIM1_GenerateEvent(TIM1_EventSource_TypeDef TIM1_EventSource)
6392                     ; 1390 {
6393                     	switch	.text
6394  0f25               _TIM1_GenerateEvent:
6396  0f25 88            	push	a
6397       00000000      OFST:	set	0
6400                     ; 1392   assert_param(IS_TIM1_EVENT_SOURCE_OK(TIM1_EventSource));
6402  0f26 4d            	tnz	a
6403  0f27 2703          	jreq	L4601
6404  0f29 4f            	clr	a
6405  0f2a 2010          	jra	L6601
6406  0f2c               L4601:
6407  0f2c ae0570        	ldw	x,#1392
6408  0f2f 89            	pushw	x
6409  0f30 ae0000        	ldw	x,#0
6410  0f33 89            	pushw	x
6411  0f34 ae0000        	ldw	x,#L101
6412  0f37 cd0000        	call	_assert_failed
6414  0f3a 5b04          	addw	sp,#4
6415  0f3c               L6601:
6416                     ; 1395   TIM1->EGR = (uint8_t)TIM1_EventSource;
6418  0f3c 7b01          	ld	a,(OFST+1,sp)
6419  0f3e c75257        	ld	21079,a
6420                     ; 1396 }
6423  0f41 84            	pop	a
6424  0f42 81            	ret
6461                     ; 1406 void TIM1_OC1PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6461                     ; 1407 {
6462                     	switch	.text
6463  0f43               _TIM1_OC1PolarityConfig:
6465  0f43 88            	push	a
6466       00000000      OFST:	set	0
6469                     ; 1409   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6471  0f44 4d            	tnz	a
6472  0f45 2704          	jreq	L4701
6473  0f47 a122          	cp	a,#34
6474  0f49 2603          	jrne	L2701
6475  0f4b               L4701:
6476  0f4b 4f            	clr	a
6477  0f4c 2010          	jra	L6701
6478  0f4e               L2701:
6479  0f4e ae0581        	ldw	x,#1409
6480  0f51 89            	pushw	x
6481  0f52 ae0000        	ldw	x,#0
6482  0f55 89            	pushw	x
6483  0f56 ae0000        	ldw	x,#L101
6484  0f59 cd0000        	call	_assert_failed
6486  0f5c 5b04          	addw	sp,#4
6487  0f5e               L6701:
6488                     ; 1412   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6490  0f5e 0d01          	tnz	(OFST+1,sp)
6491  0f60 2706          	jreq	L7242
6492                     ; 1414     TIM1->CCER1 |= TIM1_CCER1_CC1P;
6494  0f62 7212525c      	bset	21084,#1
6496  0f66 2004          	jra	L1342
6497  0f68               L7242:
6498                     ; 1418     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
6500  0f68 7213525c      	bres	21084,#1
6501  0f6c               L1342:
6502                     ; 1420 }
6505  0f6c 84            	pop	a
6506  0f6d 81            	ret
6543                     ; 1430 void TIM1_OC1NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6543                     ; 1431 {
6544                     	switch	.text
6545  0f6e               _TIM1_OC1NPolarityConfig:
6547  0f6e 88            	push	a
6548       00000000      OFST:	set	0
6551                     ; 1433   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6553  0f6f 4d            	tnz	a
6554  0f70 2704          	jreq	L4011
6555  0f72 a188          	cp	a,#136
6556  0f74 2603          	jrne	L2011
6557  0f76               L4011:
6558  0f76 4f            	clr	a
6559  0f77 2010          	jra	L6011
6560  0f79               L2011:
6561  0f79 ae0599        	ldw	x,#1433
6562  0f7c 89            	pushw	x
6563  0f7d ae0000        	ldw	x,#0
6564  0f80 89            	pushw	x
6565  0f81 ae0000        	ldw	x,#L101
6566  0f84 cd0000        	call	_assert_failed
6568  0f87 5b04          	addw	sp,#4
6569  0f89               L6011:
6570                     ; 1436   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6572  0f89 0d01          	tnz	(OFST+1,sp)
6573  0f8b 2706          	jreq	L1542
6574                     ; 1438     TIM1->CCER1 |= TIM1_CCER1_CC1NP;
6576  0f8d 7216525c      	bset	21084,#3
6578  0f91 2004          	jra	L3542
6579  0f93               L1542:
6580                     ; 1442     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NP);
6582  0f93 7217525c      	bres	21084,#3
6583  0f97               L3542:
6584                     ; 1444 }
6587  0f97 84            	pop	a
6588  0f98 81            	ret
6625                     ; 1454 void TIM1_OC2PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6625                     ; 1455 {
6626                     	switch	.text
6627  0f99               _TIM1_OC2PolarityConfig:
6629  0f99 88            	push	a
6630       00000000      OFST:	set	0
6633                     ; 1457   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6635  0f9a 4d            	tnz	a
6636  0f9b 2704          	jreq	L4111
6637  0f9d a122          	cp	a,#34
6638  0f9f 2603          	jrne	L2111
6639  0fa1               L4111:
6640  0fa1 4f            	clr	a
6641  0fa2 2010          	jra	L6111
6642  0fa4               L2111:
6643  0fa4 ae05b1        	ldw	x,#1457
6644  0fa7 89            	pushw	x
6645  0fa8 ae0000        	ldw	x,#0
6646  0fab 89            	pushw	x
6647  0fac ae0000        	ldw	x,#L101
6648  0faf cd0000        	call	_assert_failed
6650  0fb2 5b04          	addw	sp,#4
6651  0fb4               L6111:
6652                     ; 1460   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6654  0fb4 0d01          	tnz	(OFST+1,sp)
6655  0fb6 2706          	jreq	L3742
6656                     ; 1462     TIM1->CCER1 |= TIM1_CCER1_CC2P;
6658  0fb8 721a525c      	bset	21084,#5
6660  0fbc 2004          	jra	L5742
6661  0fbe               L3742:
6662                     ; 1466     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
6664  0fbe 721b525c      	bres	21084,#5
6665  0fc2               L5742:
6666                     ; 1468 }
6669  0fc2 84            	pop	a
6670  0fc3 81            	ret
6707                     ; 1478 void TIM1_OC2NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6707                     ; 1479 {
6708                     	switch	.text
6709  0fc4               _TIM1_OC2NPolarityConfig:
6711  0fc4 88            	push	a
6712       00000000      OFST:	set	0
6715                     ; 1481   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6717  0fc5 4d            	tnz	a
6718  0fc6 2704          	jreq	L4211
6719  0fc8 a188          	cp	a,#136
6720  0fca 2603          	jrne	L2211
6721  0fcc               L4211:
6722  0fcc 4f            	clr	a
6723  0fcd 2010          	jra	L6211
6724  0fcf               L2211:
6725  0fcf ae05c9        	ldw	x,#1481
6726  0fd2 89            	pushw	x
6727  0fd3 ae0000        	ldw	x,#0
6728  0fd6 89            	pushw	x
6729  0fd7 ae0000        	ldw	x,#L101
6730  0fda cd0000        	call	_assert_failed
6732  0fdd 5b04          	addw	sp,#4
6733  0fdf               L6211:
6734                     ; 1484   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6736  0fdf 0d01          	tnz	(OFST+1,sp)
6737  0fe1 2706          	jreq	L5152
6738                     ; 1486     TIM1->CCER1 |= TIM1_CCER1_CC2NP;
6740  0fe3 721e525c      	bset	21084,#7
6742  0fe7 2004          	jra	L7152
6743  0fe9               L5152:
6744                     ; 1490     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NP);
6746  0fe9 721f525c      	bres	21084,#7
6747  0fed               L7152:
6748                     ; 1492 }
6751  0fed 84            	pop	a
6752  0fee 81            	ret
6789                     ; 1502 void TIM1_OC3PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6789                     ; 1503 {
6790                     	switch	.text
6791  0fef               _TIM1_OC3PolarityConfig:
6793  0fef 88            	push	a
6794       00000000      OFST:	set	0
6797                     ; 1505   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6799  0ff0 4d            	tnz	a
6800  0ff1 2704          	jreq	L4311
6801  0ff3 a122          	cp	a,#34
6802  0ff5 2603          	jrne	L2311
6803  0ff7               L4311:
6804  0ff7 4f            	clr	a
6805  0ff8 2010          	jra	L6311
6806  0ffa               L2311:
6807  0ffa ae05e1        	ldw	x,#1505
6808  0ffd 89            	pushw	x
6809  0ffe ae0000        	ldw	x,#0
6810  1001 89            	pushw	x
6811  1002 ae0000        	ldw	x,#L101
6812  1005 cd0000        	call	_assert_failed
6814  1008 5b04          	addw	sp,#4
6815  100a               L6311:
6816                     ; 1508   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6818  100a 0d01          	tnz	(OFST+1,sp)
6819  100c 2706          	jreq	L7352
6820                     ; 1510     TIM1->CCER2 |= TIM1_CCER2_CC3P;
6822  100e 7212525d      	bset	21085,#1
6824  1012 2004          	jra	L1452
6825  1014               L7352:
6826                     ; 1514     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
6828  1014 7213525d      	bres	21085,#1
6829  1018               L1452:
6830                     ; 1516 }
6833  1018 84            	pop	a
6834  1019 81            	ret
6871                     ; 1527 void TIM1_OC3NPolarityConfig(TIM1_OCNPolarity_TypeDef TIM1_OCNPolarity)
6871                     ; 1528 {
6872                     	switch	.text
6873  101a               _TIM1_OC3NPolarityConfig:
6875  101a 88            	push	a
6876       00000000      OFST:	set	0
6879                     ; 1530   assert_param(IS_TIM1_OCN_POLARITY_OK(TIM1_OCNPolarity));
6881  101b 4d            	tnz	a
6882  101c 2704          	jreq	L4411
6883  101e a188          	cp	a,#136
6884  1020 2603          	jrne	L2411
6885  1022               L4411:
6886  1022 4f            	clr	a
6887  1023 2010          	jra	L6411
6888  1025               L2411:
6889  1025 ae05fa        	ldw	x,#1530
6890  1028 89            	pushw	x
6891  1029 ae0000        	ldw	x,#0
6892  102c 89            	pushw	x
6893  102d ae0000        	ldw	x,#L101
6894  1030 cd0000        	call	_assert_failed
6896  1033 5b04          	addw	sp,#4
6897  1035               L6411:
6898                     ; 1533   if (TIM1_OCNPolarity != TIM1_OCNPOLARITY_HIGH)
6900  1035 0d01          	tnz	(OFST+1,sp)
6901  1037 2706          	jreq	L1652
6902                     ; 1535     TIM1->CCER2 |= TIM1_CCER2_CC3NP;
6904  1039 7216525d      	bset	21085,#3
6906  103d 2004          	jra	L3652
6907  103f               L1652:
6908                     ; 1539     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NP);
6910  103f 7217525d      	bres	21085,#3
6911  1043               L3652:
6912                     ; 1541 }
6915  1043 84            	pop	a
6916  1044 81            	ret
6953                     ; 1551 void TIM1_OC4PolarityConfig(TIM1_OCPolarity_TypeDef TIM1_OCPolarity)
6953                     ; 1552 {
6954                     	switch	.text
6955  1045               _TIM1_OC4PolarityConfig:
6957  1045 88            	push	a
6958       00000000      OFST:	set	0
6961                     ; 1554   assert_param(IS_TIM1_OC_POLARITY_OK(TIM1_OCPolarity));
6963  1046 4d            	tnz	a
6964  1047 2704          	jreq	L4511
6965  1049 a122          	cp	a,#34
6966  104b 2603          	jrne	L2511
6967  104d               L4511:
6968  104d 4f            	clr	a
6969  104e 2010          	jra	L6511
6970  1050               L2511:
6971  1050 ae0612        	ldw	x,#1554
6972  1053 89            	pushw	x
6973  1054 ae0000        	ldw	x,#0
6974  1057 89            	pushw	x
6975  1058 ae0000        	ldw	x,#L101
6976  105b cd0000        	call	_assert_failed
6978  105e 5b04          	addw	sp,#4
6979  1060               L6511:
6980                     ; 1557   if (TIM1_OCPolarity != TIM1_OCPOLARITY_HIGH)
6982  1060 0d01          	tnz	(OFST+1,sp)
6983  1062 2706          	jreq	L3062
6984                     ; 1559     TIM1->CCER2 |= TIM1_CCER2_CC4P;
6986  1064 721a525d      	bset	21085,#5
6988  1068 2004          	jra	L5062
6989  106a               L3062:
6990                     ; 1563     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
6992  106a 721b525d      	bres	21085,#5
6993  106e               L5062:
6994                     ; 1565 }
6997  106e 84            	pop	a
6998  106f 81            	ret
7044                     ; 1579 void TIM1_CCxCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
7044                     ; 1580 {
7045                     	switch	.text
7046  1070               _TIM1_CCxCmd:
7048  1070 89            	pushw	x
7049       00000000      OFST:	set	0
7052                     ; 1582   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
7054  1071 9e            	ld	a,xh
7055  1072 4d            	tnz	a
7056  1073 270f          	jreq	L4611
7057  1075 9e            	ld	a,xh
7058  1076 a101          	cp	a,#1
7059  1078 270a          	jreq	L4611
7060  107a 9e            	ld	a,xh
7061  107b a102          	cp	a,#2
7062  107d 2705          	jreq	L4611
7063  107f 9e            	ld	a,xh
7064  1080 a103          	cp	a,#3
7065  1082 2603          	jrne	L2611
7066  1084               L4611:
7067  1084 4f            	clr	a
7068  1085 2010          	jra	L6611
7069  1087               L2611:
7070  1087 ae062e        	ldw	x,#1582
7071  108a 89            	pushw	x
7072  108b ae0000        	ldw	x,#0
7073  108e 89            	pushw	x
7074  108f ae0000        	ldw	x,#L101
7075  1092 cd0000        	call	_assert_failed
7077  1095 5b04          	addw	sp,#4
7078  1097               L6611:
7079                     ; 1583   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
7081  1097 0d02          	tnz	(OFST+2,sp)
7082  1099 2706          	jreq	L2711
7083  109b 7b02          	ld	a,(OFST+2,sp)
7084  109d a101          	cp	a,#1
7085  109f 2603          	jrne	L0711
7086  10a1               L2711:
7087  10a1 4f            	clr	a
7088  10a2 2010          	jra	L4711
7089  10a4               L0711:
7090  10a4 ae062f        	ldw	x,#1583
7091  10a7 89            	pushw	x
7092  10a8 ae0000        	ldw	x,#0
7093  10ab 89            	pushw	x
7094  10ac ae0000        	ldw	x,#L101
7095  10af cd0000        	call	_assert_failed
7097  10b2 5b04          	addw	sp,#4
7098  10b4               L4711:
7099                     ; 1585   if (TIM1_Channel == TIM1_CHANNEL_1)
7101  10b4 0d01          	tnz	(OFST+1,sp)
7102  10b6 2610          	jrne	L1362
7103                     ; 1588     if (NewState != DISABLE)
7105  10b8 0d02          	tnz	(OFST+2,sp)
7106  10ba 2706          	jreq	L3362
7107                     ; 1590       TIM1->CCER1 |= TIM1_CCER1_CC1E;
7109  10bc 7210525c      	bset	21084,#0
7111  10c0 2040          	jra	L7362
7112  10c2               L3362:
7113                     ; 1594       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7115  10c2 7211525c      	bres	21084,#0
7116  10c6 203a          	jra	L7362
7117  10c8               L1362:
7118                     ; 1598   else if (TIM1_Channel == TIM1_CHANNEL_2)
7120  10c8 7b01          	ld	a,(OFST+1,sp)
7121  10ca a101          	cp	a,#1
7122  10cc 2610          	jrne	L1462
7123                     ; 1601     if (NewState != DISABLE)
7125  10ce 0d02          	tnz	(OFST+2,sp)
7126  10d0 2706          	jreq	L3462
7127                     ; 1603       TIM1->CCER1 |= TIM1_CCER1_CC2E;
7129  10d2 7218525c      	bset	21084,#4
7131  10d6 202a          	jra	L7362
7132  10d8               L3462:
7133                     ; 1607       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
7135  10d8 7219525c      	bres	21084,#4
7136  10dc 2024          	jra	L7362
7137  10de               L1462:
7138                     ; 1610   else if (TIM1_Channel == TIM1_CHANNEL_3)
7140  10de 7b01          	ld	a,(OFST+1,sp)
7141  10e0 a102          	cp	a,#2
7142  10e2 2610          	jrne	L1562
7143                     ; 1613     if (NewState != DISABLE)
7145  10e4 0d02          	tnz	(OFST+2,sp)
7146  10e6 2706          	jreq	L3562
7147                     ; 1615       TIM1->CCER2 |= TIM1_CCER2_CC3E;
7149  10e8 7210525d      	bset	21085,#0
7151  10ec 2014          	jra	L7362
7152  10ee               L3562:
7153                     ; 1619       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
7155  10ee 7211525d      	bres	21085,#0
7156  10f2 200e          	jra	L7362
7157  10f4               L1562:
7158                     ; 1625     if (NewState != DISABLE)
7160  10f4 0d02          	tnz	(OFST+2,sp)
7161  10f6 2706          	jreq	L1662
7162                     ; 1627       TIM1->CCER2 |= TIM1_CCER2_CC4E;
7164  10f8 7218525d      	bset	21085,#4
7166  10fc 2004          	jra	L7362
7167  10fe               L1662:
7168                     ; 1631       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
7170  10fe 7219525d      	bres	21085,#4
7171  1102               L7362:
7172                     ; 1634 }
7175  1102 85            	popw	x
7176  1103 81            	ret
7222                     ; 1647 void TIM1_CCxNCmd(TIM1_Channel_TypeDef TIM1_Channel, FunctionalState NewState)
7222                     ; 1648 {
7223                     	switch	.text
7224  1104               _TIM1_CCxNCmd:
7226  1104 89            	pushw	x
7227       00000000      OFST:	set	0
7230                     ; 1650   assert_param(IS_TIM1_COMPLEMENTARY_CHANNEL_OK(TIM1_Channel));
7232  1105 9e            	ld	a,xh
7233  1106 4d            	tnz	a
7234  1107 270a          	jreq	L2021
7235  1109 9e            	ld	a,xh
7236  110a a101          	cp	a,#1
7237  110c 2705          	jreq	L2021
7238  110e 9e            	ld	a,xh
7239  110f a102          	cp	a,#2
7240  1111 2603          	jrne	L0021
7241  1113               L2021:
7242  1113 4f            	clr	a
7243  1114 2010          	jra	L4021
7244  1116               L0021:
7245  1116 ae0672        	ldw	x,#1650
7246  1119 89            	pushw	x
7247  111a ae0000        	ldw	x,#0
7248  111d 89            	pushw	x
7249  111e ae0000        	ldw	x,#L101
7250  1121 cd0000        	call	_assert_failed
7252  1124 5b04          	addw	sp,#4
7253  1126               L4021:
7254                     ; 1651   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
7256  1126 0d02          	tnz	(OFST+2,sp)
7257  1128 2706          	jreq	L0121
7258  112a 7b02          	ld	a,(OFST+2,sp)
7259  112c a101          	cp	a,#1
7260  112e 2603          	jrne	L6021
7261  1130               L0121:
7262  1130 4f            	clr	a
7263  1131 2010          	jra	L2121
7264  1133               L6021:
7265  1133 ae0673        	ldw	x,#1651
7266  1136 89            	pushw	x
7267  1137 ae0000        	ldw	x,#0
7268  113a 89            	pushw	x
7269  113b ae0000        	ldw	x,#L101
7270  113e cd0000        	call	_assert_failed
7272  1141 5b04          	addw	sp,#4
7273  1143               L2121:
7274                     ; 1653   if (TIM1_Channel == TIM1_CHANNEL_1)
7276  1143 0d01          	tnz	(OFST+1,sp)
7277  1145 2610          	jrne	L7072
7278                     ; 1656     if (NewState != DISABLE)
7280  1147 0d02          	tnz	(OFST+2,sp)
7281  1149 2706          	jreq	L1172
7282                     ; 1658       TIM1->CCER1 |= TIM1_CCER1_CC1NE;
7284  114b 7214525c      	bset	21084,#2
7286  114f 202a          	jra	L5172
7287  1151               L1172:
7288                     ; 1662       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1NE);
7290  1151 7215525c      	bres	21084,#2
7291  1155 2024          	jra	L5172
7292  1157               L7072:
7293                     ; 1665   else if (TIM1_Channel == TIM1_CHANNEL_2)
7295  1157 7b01          	ld	a,(OFST+1,sp)
7296  1159 a101          	cp	a,#1
7297  115b 2610          	jrne	L7172
7298                     ; 1668     if (NewState != DISABLE)
7300  115d 0d02          	tnz	(OFST+2,sp)
7301  115f 2706          	jreq	L1272
7302                     ; 1670       TIM1->CCER1 |= TIM1_CCER1_CC2NE;
7304  1161 721c525c      	bset	21084,#6
7306  1165 2014          	jra	L5172
7307  1167               L1272:
7308                     ; 1674       TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2NE);
7310  1167 721d525c      	bres	21084,#6
7311  116b 200e          	jra	L5172
7312  116d               L7172:
7313                     ; 1680     if (NewState != DISABLE)
7315  116d 0d02          	tnz	(OFST+2,sp)
7316  116f 2706          	jreq	L7272
7317                     ; 1682       TIM1->CCER2 |= TIM1_CCER2_CC3NE;
7319  1171 7214525d      	bset	21085,#2
7321  1175 2004          	jra	L5172
7322  1177               L7272:
7323                     ; 1686       TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3NE);
7325  1177 7215525d      	bres	21085,#2
7326  117b               L5172:
7327                     ; 1689 }
7330  117b 85            	popw	x
7331  117c 81            	ret
7377                     ; 1712 void TIM1_SelectOCxM(TIM1_Channel_TypeDef TIM1_Channel, TIM1_OCMode_TypeDef TIM1_OCMode)
7377                     ; 1713 {
7378                     	switch	.text
7379  117d               _TIM1_SelectOCxM:
7381  117d 89            	pushw	x
7382       00000000      OFST:	set	0
7385                     ; 1715   assert_param(IS_TIM1_CHANNEL_OK(TIM1_Channel));
7387  117e 9e            	ld	a,xh
7388  117f 4d            	tnz	a
7389  1180 270f          	jreq	L0221
7390  1182 9e            	ld	a,xh
7391  1183 a101          	cp	a,#1
7392  1185 270a          	jreq	L0221
7393  1187 9e            	ld	a,xh
7394  1188 a102          	cp	a,#2
7395  118a 2705          	jreq	L0221
7396  118c 9e            	ld	a,xh
7397  118d a103          	cp	a,#3
7398  118f 2603          	jrne	L6121
7399  1191               L0221:
7400  1191 4f            	clr	a
7401  1192 2010          	jra	L2221
7402  1194               L6121:
7403  1194 ae06b3        	ldw	x,#1715
7404  1197 89            	pushw	x
7405  1198 ae0000        	ldw	x,#0
7406  119b 89            	pushw	x
7407  119c ae0000        	ldw	x,#L101
7408  119f cd0000        	call	_assert_failed
7410  11a2 5b04          	addw	sp,#4
7411  11a4               L2221:
7412                     ; 1716   assert_param(IS_TIM1_OCM_OK(TIM1_OCMode));
7414  11a4 0d02          	tnz	(OFST+2,sp)
7415  11a6 272a          	jreq	L6221
7416  11a8 7b02          	ld	a,(OFST+2,sp)
7417  11aa a110          	cp	a,#16
7418  11ac 2724          	jreq	L6221
7419  11ae 7b02          	ld	a,(OFST+2,sp)
7420  11b0 a120          	cp	a,#32
7421  11b2 271e          	jreq	L6221
7422  11b4 7b02          	ld	a,(OFST+2,sp)
7423  11b6 a130          	cp	a,#48
7424  11b8 2718          	jreq	L6221
7425  11ba 7b02          	ld	a,(OFST+2,sp)
7426  11bc a160          	cp	a,#96
7427  11be 2712          	jreq	L6221
7428  11c0 7b02          	ld	a,(OFST+2,sp)
7429  11c2 a170          	cp	a,#112
7430  11c4 270c          	jreq	L6221
7431  11c6 7b02          	ld	a,(OFST+2,sp)
7432  11c8 a150          	cp	a,#80
7433  11ca 2706          	jreq	L6221
7434  11cc 7b02          	ld	a,(OFST+2,sp)
7435  11ce a140          	cp	a,#64
7436  11d0 2603          	jrne	L4221
7437  11d2               L6221:
7438  11d2 4f            	clr	a
7439  11d3 2010          	jra	L0321
7440  11d5               L4221:
7441  11d5 ae06b4        	ldw	x,#1716
7442  11d8 89            	pushw	x
7443  11d9 ae0000        	ldw	x,#0
7444  11dc 89            	pushw	x
7445  11dd ae0000        	ldw	x,#L101
7446  11e0 cd0000        	call	_assert_failed
7448  11e3 5b04          	addw	sp,#4
7449  11e5               L0321:
7450                     ; 1718   if (TIM1_Channel == TIM1_CHANNEL_1)
7452  11e5 0d01          	tnz	(OFST+1,sp)
7453  11e7 2610          	jrne	L5572
7454                     ; 1721     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
7456  11e9 7211525c      	bres	21084,#0
7457                     ; 1724     TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_OCM)) 
7457                     ; 1725                             | (uint8_t)TIM1_OCMode);
7459  11ed c65258        	ld	a,21080
7460  11f0 a48f          	and	a,#143
7461  11f2 1a02          	or	a,(OFST+2,sp)
7462  11f4 c75258        	ld	21080,a
7464  11f7 203a          	jra	L7572
7465  11f9               L5572:
7466                     ; 1727   else if (TIM1_Channel == TIM1_CHANNEL_2)
7468  11f9 7b01          	ld	a,(OFST+1,sp)
7469  11fb a101          	cp	a,#1
7470  11fd 2610          	jrne	L1672
7471                     ; 1730     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2E);
7473  11ff 7219525c      	bres	21084,#4
7474                     ; 1733     TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_OCM))
7474                     ; 1734                             | (uint8_t)TIM1_OCMode);
7476  1203 c65259        	ld	a,21081
7477  1206 a48f          	and	a,#143
7478  1208 1a02          	or	a,(OFST+2,sp)
7479  120a c75259        	ld	21081,a
7481  120d 2024          	jra	L7572
7482  120f               L1672:
7483                     ; 1736   else if (TIM1_Channel == TIM1_CHANNEL_3)
7485  120f 7b01          	ld	a,(OFST+1,sp)
7486  1211 a102          	cp	a,#2
7487  1213 2610          	jrne	L5672
7488                     ; 1739     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3E);
7490  1215 7211525d      	bres	21085,#0
7491                     ; 1742     TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_OCM)) 
7491                     ; 1743                             | (uint8_t)TIM1_OCMode);
7493  1219 c6525a        	ld	a,21082
7494  121c a48f          	and	a,#143
7495  121e 1a02          	or	a,(OFST+2,sp)
7496  1220 c7525a        	ld	21082,a
7498  1223 200e          	jra	L7572
7499  1225               L5672:
7500                     ; 1748     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4E);
7502  1225 7219525d      	bres	21085,#4
7503                     ; 1751     TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_OCM)) 
7503                     ; 1752                             | (uint8_t)TIM1_OCMode);
7505  1229 c6525b        	ld	a,21083
7506  122c a48f          	and	a,#143
7507  122e 1a02          	or	a,(OFST+2,sp)
7508  1230 c7525b        	ld	21083,a
7509  1233               L7572:
7510                     ; 1754 }
7513  1233 85            	popw	x
7514  1234 81            	ret
7548                     ; 1762 void TIM1_SetCounter(uint16_t Counter)
7548                     ; 1763 {
7549                     	switch	.text
7550  1235               _TIM1_SetCounter:
7554                     ; 1765   TIM1->CNTRH = (uint8_t)(Counter >> 8);
7556  1235 9e            	ld	a,xh
7557  1236 c7525e        	ld	21086,a
7558                     ; 1766   TIM1->CNTRL = (uint8_t)(Counter);
7560  1239 9f            	ld	a,xl
7561  123a c7525f        	ld	21087,a
7562                     ; 1767 }
7565  123d 81            	ret
7599                     ; 1775 void TIM1_SetAutoreload(uint16_t Autoreload)
7599                     ; 1776 {
7600                     	switch	.text
7601  123e               _TIM1_SetAutoreload:
7605                     ; 1778   TIM1->ARRH = (uint8_t)(Autoreload >> 8);
7607  123e 9e            	ld	a,xh
7608  123f c75262        	ld	21090,a
7609                     ; 1779   TIM1->ARRL = (uint8_t)(Autoreload);
7611  1242 9f            	ld	a,xl
7612  1243 c75263        	ld	21091,a
7613                     ; 1780  }
7616  1246 81            	ret
7650                     ; 1788 void TIM1_SetCompare1(uint16_t Compare1)
7650                     ; 1789 {
7651                     	switch	.text
7652  1247               _TIM1_SetCompare1:
7656                     ; 1791   TIM1->CCR1H = (uint8_t)(Compare1 >> 8);
7658  1247 9e            	ld	a,xh
7659  1248 c75265        	ld	21093,a
7660                     ; 1792   TIM1->CCR1L = (uint8_t)(Compare1);
7662  124b 9f            	ld	a,xl
7663  124c c75266        	ld	21094,a
7664                     ; 1793 }
7667  124f 81            	ret
7701                     ; 1801 void TIM1_SetCompare2(uint16_t Compare2)
7701                     ; 1802 {
7702                     	switch	.text
7703  1250               _TIM1_SetCompare2:
7707                     ; 1804   TIM1->CCR2H = (uint8_t)(Compare2 >> 8);
7709  1250 9e            	ld	a,xh
7710  1251 c75267        	ld	21095,a
7711                     ; 1805   TIM1->CCR2L = (uint8_t)(Compare2);
7713  1254 9f            	ld	a,xl
7714  1255 c75268        	ld	21096,a
7715                     ; 1806 }
7718  1258 81            	ret
7752                     ; 1814 void TIM1_SetCompare3(uint16_t Compare3)
7752                     ; 1815 {
7753                     	switch	.text
7754  1259               _TIM1_SetCompare3:
7758                     ; 1817   TIM1->CCR3H = (uint8_t)(Compare3 >> 8);
7760  1259 9e            	ld	a,xh
7761  125a c75269        	ld	21097,a
7762                     ; 1818   TIM1->CCR3L = (uint8_t)(Compare3);
7764  125d 9f            	ld	a,xl
7765  125e c7526a        	ld	21098,a
7766                     ; 1819 }
7769  1261 81            	ret
7803                     ; 1827 void TIM1_SetCompare4(uint16_t Compare4)
7803                     ; 1828 {
7804                     	switch	.text
7805  1262               _TIM1_SetCompare4:
7809                     ; 1830   TIM1->CCR4H = (uint8_t)(Compare4 >> 8);
7811  1262 9e            	ld	a,xh
7812  1263 c7526b        	ld	21099,a
7813                     ; 1831   TIM1->CCR4L = (uint8_t)(Compare4);
7815  1266 9f            	ld	a,xl
7816  1267 c7526c        	ld	21100,a
7817                     ; 1832 }
7820  126a 81            	ret
7857                     ; 1844 void TIM1_SetIC1Prescaler(TIM1_ICPSC_TypeDef TIM1_IC1Prescaler)
7857                     ; 1845 {
7858                     	switch	.text
7859  126b               _TIM1_SetIC1Prescaler:
7861  126b 88            	push	a
7862       00000000      OFST:	set	0
7865                     ; 1847   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC1Prescaler));
7867  126c 4d            	tnz	a
7868  126d 270c          	jreq	L2521
7869  126f a104          	cp	a,#4
7870  1271 2708          	jreq	L2521
7871  1273 a108          	cp	a,#8
7872  1275 2704          	jreq	L2521
7873  1277 a10c          	cp	a,#12
7874  1279 2603          	jrne	L0521
7875  127b               L2521:
7876  127b 4f            	clr	a
7877  127c 2010          	jra	L4521
7878  127e               L0521:
7879  127e ae0737        	ldw	x,#1847
7880  1281 89            	pushw	x
7881  1282 ae0000        	ldw	x,#0
7882  1285 89            	pushw	x
7883  1286 ae0000        	ldw	x,#L101
7884  1289 cd0000        	call	_assert_failed
7886  128c 5b04          	addw	sp,#4
7887  128e               L4521:
7888                     ; 1850   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~TIM1_CCMR_ICxPSC)) 
7888                     ; 1851                           | (uint8_t)TIM1_IC1Prescaler);
7890  128e c65258        	ld	a,21080
7891  1291 a4f3          	and	a,#243
7892  1293 1a01          	or	a,(OFST+1,sp)
7893  1295 c75258        	ld	21080,a
7894                     ; 1852 }
7897  1298 84            	pop	a
7898  1299 81            	ret
7935                     ; 1864 void TIM1_SetIC2Prescaler(TIM1_ICPSC_TypeDef TIM1_IC2Prescaler)
7935                     ; 1865 {
7936                     	switch	.text
7937  129a               _TIM1_SetIC2Prescaler:
7939  129a 88            	push	a
7940       00000000      OFST:	set	0
7943                     ; 1868   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC2Prescaler));
7945  129b 4d            	tnz	a
7946  129c 270c          	jreq	L2621
7947  129e a104          	cp	a,#4
7948  12a0 2708          	jreq	L2621
7949  12a2 a108          	cp	a,#8
7950  12a4 2704          	jreq	L2621
7951  12a6 a10c          	cp	a,#12
7952  12a8 2603          	jrne	L0621
7953  12aa               L2621:
7954  12aa 4f            	clr	a
7955  12ab 2010          	jra	L4621
7956  12ad               L0621:
7957  12ad ae074c        	ldw	x,#1868
7958  12b0 89            	pushw	x
7959  12b1 ae0000        	ldw	x,#0
7960  12b4 89            	pushw	x
7961  12b5 ae0000        	ldw	x,#L101
7962  12b8 cd0000        	call	_assert_failed
7964  12bb 5b04          	addw	sp,#4
7965  12bd               L4621:
7966                     ; 1871   TIM1->CCMR2 = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~TIM1_CCMR_ICxPSC))
7966                     ; 1872                           | (uint8_t)TIM1_IC2Prescaler);
7968  12bd c65259        	ld	a,21081
7969  12c0 a4f3          	and	a,#243
7970  12c2 1a01          	or	a,(OFST+1,sp)
7971  12c4 c75259        	ld	21081,a
7972                     ; 1873 }
7975  12c7 84            	pop	a
7976  12c8 81            	ret
8013                     ; 1885 void TIM1_SetIC3Prescaler(TIM1_ICPSC_TypeDef TIM1_IC3Prescaler)
8013                     ; 1886 {
8014                     	switch	.text
8015  12c9               _TIM1_SetIC3Prescaler:
8017  12c9 88            	push	a
8018       00000000      OFST:	set	0
8021                     ; 1889   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC3Prescaler));
8023  12ca 4d            	tnz	a
8024  12cb 270c          	jreq	L2721
8025  12cd a104          	cp	a,#4
8026  12cf 2708          	jreq	L2721
8027  12d1 a108          	cp	a,#8
8028  12d3 2704          	jreq	L2721
8029  12d5 a10c          	cp	a,#12
8030  12d7 2603          	jrne	L0721
8031  12d9               L2721:
8032  12d9 4f            	clr	a
8033  12da 2010          	jra	L4721
8034  12dc               L0721:
8035  12dc ae0761        	ldw	x,#1889
8036  12df 89            	pushw	x
8037  12e0 ae0000        	ldw	x,#0
8038  12e3 89            	pushw	x
8039  12e4 ae0000        	ldw	x,#L101
8040  12e7 cd0000        	call	_assert_failed
8042  12ea 5b04          	addw	sp,#4
8043  12ec               L4721:
8044                     ; 1892   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~TIM1_CCMR_ICxPSC)) | 
8044                     ; 1893                           (uint8_t)TIM1_IC3Prescaler);
8046  12ec c6525a        	ld	a,21082
8047  12ef a4f3          	and	a,#243
8048  12f1 1a01          	or	a,(OFST+1,sp)
8049  12f3 c7525a        	ld	21082,a
8050                     ; 1894 }
8053  12f6 84            	pop	a
8054  12f7 81            	ret
8091                     ; 1906 void TIM1_SetIC4Prescaler(TIM1_ICPSC_TypeDef TIM1_IC4Prescaler)
8091                     ; 1907 {
8092                     	switch	.text
8093  12f8               _TIM1_SetIC4Prescaler:
8095  12f8 88            	push	a
8096       00000000      OFST:	set	0
8099                     ; 1910   assert_param(IS_TIM1_IC_PRESCALER_OK(TIM1_IC4Prescaler));
8101  12f9 4d            	tnz	a
8102  12fa 270c          	jreq	L2031
8103  12fc a104          	cp	a,#4
8104  12fe 2708          	jreq	L2031
8105  1300 a108          	cp	a,#8
8106  1302 2704          	jreq	L2031
8107  1304 a10c          	cp	a,#12
8108  1306 2603          	jrne	L0031
8109  1308               L2031:
8110  1308 4f            	clr	a
8111  1309 2010          	jra	L4031
8112  130b               L0031:
8113  130b ae0776        	ldw	x,#1910
8114  130e 89            	pushw	x
8115  130f ae0000        	ldw	x,#0
8116  1312 89            	pushw	x
8117  1313 ae0000        	ldw	x,#L101
8118  1316 cd0000        	call	_assert_failed
8120  1319 5b04          	addw	sp,#4
8121  131b               L4031:
8122                     ; 1913   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~TIM1_CCMR_ICxPSC)) |
8122                     ; 1914                           (uint8_t)TIM1_IC4Prescaler);
8124  131b c6525b        	ld	a,21083
8125  131e a4f3          	and	a,#243
8126  1320 1a01          	or	a,(OFST+1,sp)
8127  1322 c7525b        	ld	21083,a
8128                     ; 1915 }
8131  1325 84            	pop	a
8132  1326 81            	ret
8184                     ; 1922 uint16_t TIM1_GetCapture1(void)
8184                     ; 1923 {
8185                     	switch	.text
8186  1327               _TIM1_GetCapture1:
8188  1327 5204          	subw	sp,#4
8189       00000004      OFST:	set	4
8192                     ; 1926   uint16_t tmpccr1 = 0;
8194                     ; 1927   uint8_t tmpccr1l=0, tmpccr1h=0;
8198                     ; 1929   tmpccr1h = TIM1->CCR1H;
8200  1329 c65265        	ld	a,21093
8201  132c 6b02          	ld	(OFST-2,sp),a
8203                     ; 1930   tmpccr1l = TIM1->CCR1L;
8205  132e c65266        	ld	a,21094
8206  1331 6b01          	ld	(OFST-3,sp),a
8208                     ; 1932   tmpccr1 = (uint16_t)(tmpccr1l);
8210  1333 7b01          	ld	a,(OFST-3,sp)
8211  1335 5f            	clrw	x
8212  1336 97            	ld	xl,a
8213  1337 1f03          	ldw	(OFST-1,sp),x
8215                     ; 1933   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
8217  1339 7b02          	ld	a,(OFST-2,sp)
8218  133b 5f            	clrw	x
8219  133c 97            	ld	xl,a
8220  133d 4f            	clr	a
8221  133e 02            	rlwa	x,a
8222  133f 01            	rrwa	x,a
8223  1340 1a04          	or	a,(OFST+0,sp)
8224  1342 01            	rrwa	x,a
8225  1343 1a03          	or	a,(OFST-1,sp)
8226  1345 01            	rrwa	x,a
8227  1346 1f03          	ldw	(OFST-1,sp),x
8229                     ; 1935   return (uint16_t)tmpccr1;
8231  1348 1e03          	ldw	x,(OFST-1,sp)
8234  134a 5b04          	addw	sp,#4
8235  134c 81            	ret
8287                     ; 1943 uint16_t TIM1_GetCapture2(void)
8287                     ; 1944 {
8288                     	switch	.text
8289  134d               _TIM1_GetCapture2:
8291  134d 5204          	subw	sp,#4
8292       00000004      OFST:	set	4
8295                     ; 1947   uint16_t tmpccr2 = 0;
8297                     ; 1948   uint8_t tmpccr2l=0, tmpccr2h=0;
8301                     ; 1950   tmpccr2h = TIM1->CCR2H;
8303  134f c65267        	ld	a,21095
8304  1352 6b02          	ld	(OFST-2,sp),a
8306                     ; 1951   tmpccr2l = TIM1->CCR2L;
8308  1354 c65268        	ld	a,21096
8309  1357 6b01          	ld	(OFST-3,sp),a
8311                     ; 1953   tmpccr2 = (uint16_t)(tmpccr2l);
8313  1359 7b01          	ld	a,(OFST-3,sp)
8314  135b 5f            	clrw	x
8315  135c 97            	ld	xl,a
8316  135d 1f03          	ldw	(OFST-1,sp),x
8318                     ; 1954   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
8320  135f 7b02          	ld	a,(OFST-2,sp)
8321  1361 5f            	clrw	x
8322  1362 97            	ld	xl,a
8323  1363 4f            	clr	a
8324  1364 02            	rlwa	x,a
8325  1365 01            	rrwa	x,a
8326  1366 1a04          	or	a,(OFST+0,sp)
8327  1368 01            	rrwa	x,a
8328  1369 1a03          	or	a,(OFST-1,sp)
8329  136b 01            	rrwa	x,a
8330  136c 1f03          	ldw	(OFST-1,sp),x
8332                     ; 1956   return (uint16_t)tmpccr2;
8334  136e 1e03          	ldw	x,(OFST-1,sp)
8337  1370 5b04          	addw	sp,#4
8338  1372 81            	ret
8390                     ; 1964 uint16_t TIM1_GetCapture3(void)
8390                     ; 1965 {
8391                     	switch	.text
8392  1373               _TIM1_GetCapture3:
8394  1373 5204          	subw	sp,#4
8395       00000004      OFST:	set	4
8398                     ; 1967   uint16_t tmpccr3 = 0;
8400                     ; 1968   uint8_t tmpccr3l=0, tmpccr3h=0;
8404                     ; 1970   tmpccr3h = TIM1->CCR3H;
8406  1375 c65269        	ld	a,21097
8407  1378 6b02          	ld	(OFST-2,sp),a
8409                     ; 1971   tmpccr3l = TIM1->CCR3L;
8411  137a c6526a        	ld	a,21098
8412  137d 6b01          	ld	(OFST-3,sp),a
8414                     ; 1973   tmpccr3 = (uint16_t)(tmpccr3l);
8416  137f 7b01          	ld	a,(OFST-3,sp)
8417  1381 5f            	clrw	x
8418  1382 97            	ld	xl,a
8419  1383 1f03          	ldw	(OFST-1,sp),x
8421                     ; 1974   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
8423  1385 7b02          	ld	a,(OFST-2,sp)
8424  1387 5f            	clrw	x
8425  1388 97            	ld	xl,a
8426  1389 4f            	clr	a
8427  138a 02            	rlwa	x,a
8428  138b 01            	rrwa	x,a
8429  138c 1a04          	or	a,(OFST+0,sp)
8430  138e 01            	rrwa	x,a
8431  138f 1a03          	or	a,(OFST-1,sp)
8432  1391 01            	rrwa	x,a
8433  1392 1f03          	ldw	(OFST-1,sp),x
8435                     ; 1976   return (uint16_t)tmpccr3;
8437  1394 1e03          	ldw	x,(OFST-1,sp)
8440  1396 5b04          	addw	sp,#4
8441  1398 81            	ret
8493                     ; 1984 uint16_t TIM1_GetCapture4(void)
8493                     ; 1985 {
8494                     	switch	.text
8495  1399               _TIM1_GetCapture4:
8497  1399 5204          	subw	sp,#4
8498       00000004      OFST:	set	4
8501                     ; 1987   uint16_t tmpccr4 = 0;
8503                     ; 1988   uint8_t tmpccr4l=0, tmpccr4h=0;
8507                     ; 1990   tmpccr4h = TIM1->CCR4H;
8509  139b c6526b        	ld	a,21099
8510  139e 6b02          	ld	(OFST-2,sp),a
8512                     ; 1991   tmpccr4l = TIM1->CCR4L;
8514  13a0 c6526c        	ld	a,21100
8515  13a3 6b01          	ld	(OFST-3,sp),a
8517                     ; 1993   tmpccr4 = (uint16_t)(tmpccr4l);
8519  13a5 7b01          	ld	a,(OFST-3,sp)
8520  13a7 5f            	clrw	x
8521  13a8 97            	ld	xl,a
8522  13a9 1f03          	ldw	(OFST-1,sp),x
8524                     ; 1994   tmpccr4 |= (uint16_t)((uint16_t)tmpccr4h << 8);
8526  13ab 7b02          	ld	a,(OFST-2,sp)
8527  13ad 5f            	clrw	x
8528  13ae 97            	ld	xl,a
8529  13af 4f            	clr	a
8530  13b0 02            	rlwa	x,a
8531  13b1 01            	rrwa	x,a
8532  13b2 1a04          	or	a,(OFST+0,sp)
8533  13b4 01            	rrwa	x,a
8534  13b5 1a03          	or	a,(OFST-1,sp)
8535  13b7 01            	rrwa	x,a
8536  13b8 1f03          	ldw	(OFST-1,sp),x
8538                     ; 1996   return (uint16_t)tmpccr4;
8540  13ba 1e03          	ldw	x,(OFST-1,sp)
8543  13bc 5b04          	addw	sp,#4
8544  13be 81            	ret
8578                     ; 2004 uint16_t TIM1_GetCounter(void)
8578                     ; 2005 {
8579                     	switch	.text
8580  13bf               _TIM1_GetCounter:
8582  13bf 89            	pushw	x
8583       00000002      OFST:	set	2
8586                     ; 2006   uint16_t tmpcntr = 0;
8588                     ; 2008   tmpcntr = ((uint16_t)TIM1->CNTRH << 8);
8590  13c0 c6525e        	ld	a,21086
8591  13c3 5f            	clrw	x
8592  13c4 97            	ld	xl,a
8593  13c5 4f            	clr	a
8594  13c6 02            	rlwa	x,a
8595  13c7 1f01          	ldw	(OFST-1,sp),x
8597                     ; 2011   return (uint16_t)(tmpcntr | (uint16_t)(TIM1->CNTRL));
8599  13c9 c6525f        	ld	a,21087
8600  13cc 5f            	clrw	x
8601  13cd 97            	ld	xl,a
8602  13ce 01            	rrwa	x,a
8603  13cf 1a02          	or	a,(OFST+0,sp)
8604  13d1 01            	rrwa	x,a
8605  13d2 1a01          	or	a,(OFST-1,sp)
8606  13d4 01            	rrwa	x,a
8609  13d5 5b02          	addw	sp,#2
8610  13d7 81            	ret
8644                     ; 2019 uint16_t TIM1_GetPrescaler(void)
8644                     ; 2020 {
8645                     	switch	.text
8646  13d8               _TIM1_GetPrescaler:
8648  13d8 89            	pushw	x
8649       00000002      OFST:	set	2
8652                     ; 2021   uint16_t temp = 0;
8654                     ; 2023   temp = ((uint16_t)TIM1->PSCRH << 8);
8656  13d9 c65260        	ld	a,21088
8657  13dc 5f            	clrw	x
8658  13dd 97            	ld	xl,a
8659  13de 4f            	clr	a
8660  13df 02            	rlwa	x,a
8661  13e0 1f01          	ldw	(OFST-1,sp),x
8663                     ; 2026   return (uint16_t)( temp | (uint16_t)(TIM1->PSCRL));
8665  13e2 c65261        	ld	a,21089
8666  13e5 5f            	clrw	x
8667  13e6 97            	ld	xl,a
8668  13e7 01            	rrwa	x,a
8669  13e8 1a02          	or	a,(OFST+0,sp)
8670  13ea 01            	rrwa	x,a
8671  13eb 1a01          	or	a,(OFST-1,sp)
8672  13ed 01            	rrwa	x,a
8675  13ee 5b02          	addw	sp,#2
8676  13f0 81            	ret
8851                     ; 2047 FlagStatus TIM1_GetFlagStatus(TIM1_FLAG_TypeDef TIM1_FLAG)
8851                     ; 2048 {
8852                     	switch	.text
8853  13f1               _TIM1_GetFlagStatus:
8855  13f1 89            	pushw	x
8856  13f2 89            	pushw	x
8857       00000002      OFST:	set	2
8860                     ; 2049   FlagStatus bitstatus = RESET;
8862                     ; 2050   uint8_t tim1_flag_l = 0, tim1_flag_h = 0;
8866                     ; 2053   assert_param(IS_TIM1_GET_FLAG_OK(TIM1_FLAG));
8868  13f3 a30001        	cpw	x,#1
8869  13f6 2737          	jreq	L6231
8870  13f8 a30002        	cpw	x,#2
8871  13fb 2732          	jreq	L6231
8872  13fd a30004        	cpw	x,#4
8873  1400 272d          	jreq	L6231
8874  1402 a30008        	cpw	x,#8
8875  1405 2728          	jreq	L6231
8876  1407 a30010        	cpw	x,#16
8877  140a 2723          	jreq	L6231
8878  140c a30020        	cpw	x,#32
8879  140f 271e          	jreq	L6231
8880  1411 a30040        	cpw	x,#64
8881  1414 2719          	jreq	L6231
8882  1416 a30080        	cpw	x,#128
8883  1419 2714          	jreq	L6231
8884  141b a30200        	cpw	x,#512
8885  141e 270f          	jreq	L6231
8886  1420 a30400        	cpw	x,#1024
8887  1423 270a          	jreq	L6231
8888  1425 a30800        	cpw	x,#2048
8889  1428 2705          	jreq	L6231
8890  142a a31000        	cpw	x,#4096
8891  142d 2603          	jrne	L4231
8892  142f               L6231:
8893  142f 4f            	clr	a
8894  1430 2010          	jra	L0331
8895  1432               L4231:
8896  1432 ae0805        	ldw	x,#2053
8897  1435 89            	pushw	x
8898  1436 ae0000        	ldw	x,#0
8899  1439 89            	pushw	x
8900  143a ae0000        	ldw	x,#L101
8901  143d cd0000        	call	_assert_failed
8903  1440 5b04          	addw	sp,#4
8904  1442               L0331:
8905                     ; 2055   tim1_flag_l = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_FLAG);
8907  1442 c65255        	ld	a,21077
8908  1445 1404          	and	a,(OFST+2,sp)
8909  1447 6b01          	ld	(OFST-1,sp),a
8911                     ; 2056   tim1_flag_h = (uint8_t)((uint16_t)TIM1_FLAG >> 8);
8913  1449 7b03          	ld	a,(OFST+1,sp)
8914  144b 6b02          	ld	(OFST+0,sp),a
8916                     ; 2058   if ((tim1_flag_l | (uint8_t)(TIM1->SR2 & tim1_flag_h)) != 0)
8918  144d c65256        	ld	a,21078
8919  1450 1402          	and	a,(OFST+0,sp)
8920  1452 1a01          	or	a,(OFST-1,sp)
8921  1454 2706          	jreq	L7643
8922                     ; 2060     bitstatus = SET;
8924  1456 a601          	ld	a,#1
8925  1458 6b02          	ld	(OFST+0,sp),a
8928  145a 2002          	jra	L1743
8929  145c               L7643:
8930                     ; 2064     bitstatus = RESET;
8932  145c 0f02          	clr	(OFST+0,sp)
8934  145e               L1743:
8935                     ; 2066   return (FlagStatus)(bitstatus);
8937  145e 7b02          	ld	a,(OFST+0,sp)
8940  1460 5b04          	addw	sp,#4
8941  1462 81            	ret
8977                     ; 2087 void TIM1_ClearFlag(TIM1_FLAG_TypeDef TIM1_FLAG)
8977                     ; 2088 {
8978                     	switch	.text
8979  1463               _TIM1_ClearFlag:
8981  1463 89            	pushw	x
8982       00000000      OFST:	set	0
8985                     ; 2090   assert_param(IS_TIM1_CLEAR_FLAG_OK(TIM1_FLAG));
8987  1464 01            	rrwa	x,a
8988  1465 9f            	ld	a,xl
8989  1466 a4e1          	and	a,#225
8990  1468 97            	ld	xl,a
8991  1469 4f            	clr	a
8992  146a 02            	rlwa	x,a
8993  146b 5d            	tnzw	x
8994  146c 2607          	jrne	L4331
8995  146e 1e01          	ldw	x,(OFST+1,sp)
8996  1470 2703          	jreq	L4331
8997  1472 4f            	clr	a
8998  1473 2010          	jra	L6331
8999  1475               L4331:
9000  1475 ae082a        	ldw	x,#2090
9001  1478 89            	pushw	x
9002  1479 ae0000        	ldw	x,#0
9003  147c 89            	pushw	x
9004  147d ae0000        	ldw	x,#L101
9005  1480 cd0000        	call	_assert_failed
9007  1483 5b04          	addw	sp,#4
9008  1485               L6331:
9009                     ; 2093   TIM1->SR1 = (uint8_t)(~(uint8_t)(TIM1_FLAG));
9011  1485 7b02          	ld	a,(OFST+2,sp)
9012  1487 43            	cpl	a
9013  1488 c75255        	ld	21077,a
9014                     ; 2094   TIM1->SR2 = (uint8_t)((uint8_t)(~((uint8_t)((uint16_t)TIM1_FLAG >> 8))) & 
9014                     ; 2095                         (uint8_t)0x1E);
9016  148b 7b01          	ld	a,(OFST+1,sp)
9017  148d 43            	cpl	a
9018  148e a41e          	and	a,#30
9019  1490 c75256        	ld	21078,a
9020                     ; 2096 }
9023  1493 85            	popw	x
9024  1494 81            	ret
9089                     ; 2112 ITStatus TIM1_GetITStatus(TIM1_IT_TypeDef TIM1_IT)
9089                     ; 2113 {
9090                     	switch	.text
9091  1495               _TIM1_GetITStatus:
9093  1495 88            	push	a
9094  1496 89            	pushw	x
9095       00000002      OFST:	set	2
9098                     ; 2114   ITStatus bitstatus = RESET;
9100                     ; 2115   uint8_t TIM1_itStatus = 0, TIM1_itEnable = 0;
9104                     ; 2118   assert_param(IS_TIM1_GET_IT_OK(TIM1_IT));
9106  1497 a101          	cp	a,#1
9107  1499 271c          	jreq	L4431
9108  149b a102          	cp	a,#2
9109  149d 2718          	jreq	L4431
9110  149f a104          	cp	a,#4
9111  14a1 2714          	jreq	L4431
9112  14a3 a108          	cp	a,#8
9113  14a5 2710          	jreq	L4431
9114  14a7 a110          	cp	a,#16
9115  14a9 270c          	jreq	L4431
9116  14ab a120          	cp	a,#32
9117  14ad 2708          	jreq	L4431
9118  14af a140          	cp	a,#64
9119  14b1 2704          	jreq	L4431
9120  14b3 a180          	cp	a,#128
9121  14b5 2603          	jrne	L2431
9122  14b7               L4431:
9123  14b7 4f            	clr	a
9124  14b8 2010          	jra	L6431
9125  14ba               L2431:
9126  14ba ae0846        	ldw	x,#2118
9127  14bd 89            	pushw	x
9128  14be ae0000        	ldw	x,#0
9129  14c1 89            	pushw	x
9130  14c2 ae0000        	ldw	x,#L101
9131  14c5 cd0000        	call	_assert_failed
9133  14c8 5b04          	addw	sp,#4
9134  14ca               L6431:
9135                     ; 2120   TIM1_itStatus = (uint8_t)(TIM1->SR1 & (uint8_t)TIM1_IT);
9137  14ca c65255        	ld	a,21077
9138  14cd 1403          	and	a,(OFST+1,sp)
9139  14cf 6b01          	ld	(OFST-1,sp),a
9141                     ; 2122   TIM1_itEnable = (uint8_t)(TIM1->IER & (uint8_t)TIM1_IT);
9143  14d1 c65254        	ld	a,21076
9144  14d4 1403          	and	a,(OFST+1,sp)
9145  14d6 6b02          	ld	(OFST+0,sp),a
9147                     ; 2124   if ((TIM1_itStatus != (uint8_t)RESET ) && (TIM1_itEnable != (uint8_t)RESET ))
9149  14d8 0d01          	tnz	(OFST-1,sp)
9150  14da 270a          	jreq	L3453
9152  14dc 0d02          	tnz	(OFST+0,sp)
9153  14de 2706          	jreq	L3453
9154                     ; 2126     bitstatus = SET;
9156  14e0 a601          	ld	a,#1
9157  14e2 6b02          	ld	(OFST+0,sp),a
9160  14e4 2002          	jra	L5453
9161  14e6               L3453:
9162                     ; 2130     bitstatus = RESET;
9164  14e6 0f02          	clr	(OFST+0,sp)
9166  14e8               L5453:
9167                     ; 2132   return (ITStatus)(bitstatus);
9169  14e8 7b02          	ld	a,(OFST+0,sp)
9172  14ea 5b03          	addw	sp,#3
9173  14ec 81            	ret
9210                     ; 2149 void TIM1_ClearITPendingBit(TIM1_IT_TypeDef TIM1_IT)
9210                     ; 2150 {
9211                     	switch	.text
9212  14ed               _TIM1_ClearITPendingBit:
9214  14ed 88            	push	a
9215       00000000      OFST:	set	0
9218                     ; 2152   assert_param(IS_TIM1_IT_OK(TIM1_IT));
9220  14ee 4d            	tnz	a
9221  14ef 2703          	jreq	L2531
9222  14f1 4f            	clr	a
9223  14f2 2010          	jra	L4531
9224  14f4               L2531:
9225  14f4 ae0868        	ldw	x,#2152
9226  14f7 89            	pushw	x
9227  14f8 ae0000        	ldw	x,#0
9228  14fb 89            	pushw	x
9229  14fc ae0000        	ldw	x,#L101
9230  14ff cd0000        	call	_assert_failed
9232  1502 5b04          	addw	sp,#4
9233  1504               L4531:
9234                     ; 2155   TIM1->SR1 = (uint8_t)(~(uint8_t)TIM1_IT);
9236  1504 7b01          	ld	a,(OFST+1,sp)
9237  1506 43            	cpl	a
9238  1507 c75255        	ld	21077,a
9239                     ; 2156 }
9242  150a 84            	pop	a
9243  150b 81            	ret
9295                     ; 2174 static void TI1_Config(uint8_t TIM1_ICPolarity,
9295                     ; 2175                        uint8_t TIM1_ICSelection,
9295                     ; 2176                        uint8_t TIM1_ICFilter)
9295                     ; 2177 {
9296                     	switch	.text
9297  150c               L3_TI1_Config:
9299  150c 89            	pushw	x
9300  150d 88            	push	a
9301       00000001      OFST:	set	1
9304                     ; 2179   TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1E);
9306  150e 7211525c      	bres	21084,#0
9307                     ; 2182   TIM1->CCMR1 = (uint8_t)((uint8_t)(TIM1->CCMR1 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) | 
9307                     ; 2183                           (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9309  1512 7b06          	ld	a,(OFST+5,sp)
9310  1514 97            	ld	xl,a
9311  1515 a610          	ld	a,#16
9312  1517 42            	mul	x,a
9313  1518 9f            	ld	a,xl
9314  1519 1a03          	or	a,(OFST+2,sp)
9315  151b 6b01          	ld	(OFST+0,sp),a
9317  151d c65258        	ld	a,21080
9318  1520 a40c          	and	a,#12
9319  1522 1a01          	or	a,(OFST+0,sp)
9320  1524 c75258        	ld	21080,a
9321                     ; 2186   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9323  1527 0d02          	tnz	(OFST+1,sp)
9324  1529 2706          	jreq	L3163
9325                     ; 2188     TIM1->CCER1 |= TIM1_CCER1_CC1P;
9327  152b 7212525c      	bset	21084,#1
9329  152f 2004          	jra	L5163
9330  1531               L3163:
9331                     ; 2192     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC1P);
9333  1531 7213525c      	bres	21084,#1
9334  1535               L5163:
9335                     ; 2196   TIM1->CCER1 |=  TIM1_CCER1_CC1E;
9337  1535 7210525c      	bset	21084,#0
9338                     ; 2197 }
9341  1539 5b03          	addw	sp,#3
9342  153b 81            	ret
9394                     ; 2215 static void TI2_Config(uint8_t TIM1_ICPolarity,
9394                     ; 2216                        uint8_t TIM1_ICSelection,
9394                     ; 2217                        uint8_t TIM1_ICFilter)
9394                     ; 2218 {
9395                     	switch	.text
9396  153c               L5_TI2_Config:
9398  153c 89            	pushw	x
9399  153d 88            	push	a
9400       00000001      OFST:	set	1
9403                     ; 2220   TIM1->CCER1 &=  (uint8_t)(~TIM1_CCER1_CC2E);
9405  153e 7219525c      	bres	21084,#4
9406                     ; 2223   TIM1->CCMR2  = (uint8_t)((uint8_t)(TIM1->CCMR2 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF ))) 
9406                     ; 2224                            | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9408  1542 7b06          	ld	a,(OFST+5,sp)
9409  1544 97            	ld	xl,a
9410  1545 a610          	ld	a,#16
9411  1547 42            	mul	x,a
9412  1548 9f            	ld	a,xl
9413  1549 1a03          	or	a,(OFST+2,sp)
9414  154b 6b01          	ld	(OFST+0,sp),a
9416  154d c65259        	ld	a,21081
9417  1550 a40c          	and	a,#12
9418  1552 1a01          	or	a,(OFST+0,sp)
9419  1554 c75259        	ld	21081,a
9420                     ; 2226   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9422  1557 0d02          	tnz	(OFST+1,sp)
9423  1559 2706          	jreq	L5463
9424                     ; 2228     TIM1->CCER1 |= TIM1_CCER1_CC2P;
9426  155b 721a525c      	bset	21084,#5
9428  155f 2004          	jra	L7463
9429  1561               L5463:
9430                     ; 2232     TIM1->CCER1 &= (uint8_t)(~TIM1_CCER1_CC2P);
9432  1561 721b525c      	bres	21084,#5
9433  1565               L7463:
9434                     ; 2235   TIM1->CCER1 |=  TIM1_CCER1_CC2E;
9436  1565 7218525c      	bset	21084,#4
9437                     ; 2236 }
9440  1569 5b03          	addw	sp,#3
9441  156b 81            	ret
9493                     ; 2254 static void TI3_Config(uint8_t TIM1_ICPolarity,
9493                     ; 2255                        uint8_t TIM1_ICSelection,
9493                     ; 2256                        uint8_t TIM1_ICFilter)
9493                     ; 2257 {
9494                     	switch	.text
9495  156c               L7_TI3_Config:
9497  156c 89            	pushw	x
9498  156d 88            	push	a
9499       00000001      OFST:	set	1
9502                     ; 2259   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC3E);
9504  156e 7211525d      	bres	21085,#0
9505                     ; 2262   TIM1->CCMR3 = (uint8_t)((uint8_t)(TIM1->CCMR3 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF))) 
9505                     ; 2263                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9507  1572 7b06          	ld	a,(OFST+5,sp)
9508  1574 97            	ld	xl,a
9509  1575 a610          	ld	a,#16
9510  1577 42            	mul	x,a
9511  1578 9f            	ld	a,xl
9512  1579 1a03          	or	a,(OFST+2,sp)
9513  157b 6b01          	ld	(OFST+0,sp),a
9515  157d c6525a        	ld	a,21082
9516  1580 a40c          	and	a,#12
9517  1582 1a01          	or	a,(OFST+0,sp)
9518  1584 c7525a        	ld	21082,a
9519                     ; 2266   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9521  1587 0d02          	tnz	(OFST+1,sp)
9522  1589 2706          	jreq	L7763
9523                     ; 2268     TIM1->CCER2 |= TIM1_CCER2_CC3P;
9525  158b 7212525d      	bset	21085,#1
9527  158f 2004          	jra	L1073
9528  1591               L7763:
9529                     ; 2272     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC3P);
9531  1591 7213525d      	bres	21085,#1
9532  1595               L1073:
9533                     ; 2275   TIM1->CCER2 |=  TIM1_CCER2_CC3E;
9535  1595 7210525d      	bset	21085,#0
9536                     ; 2276 }
9539  1599 5b03          	addw	sp,#3
9540  159b 81            	ret
9592                     ; 2294 static void TI4_Config(uint8_t TIM1_ICPolarity,
9592                     ; 2295                        uint8_t TIM1_ICSelection,
9592                     ; 2296                        uint8_t TIM1_ICFilter)
9592                     ; 2297 {
9593                     	switch	.text
9594  159c               L11_TI4_Config:
9596  159c 89            	pushw	x
9597  159d 88            	push	a
9598       00000001      OFST:	set	1
9601                     ; 2299   TIM1->CCER2 &=  (uint8_t)(~TIM1_CCER2_CC4E);
9603  159e 7219525d      	bres	21085,#4
9604                     ; 2302   TIM1->CCMR4 = (uint8_t)((uint8_t)(TIM1->CCMR4 & (uint8_t)(~(uint8_t)( TIM1_CCMR_CCxS | TIM1_CCMR_ICxF )))
9604                     ; 2303                           | (uint8_t)(( (TIM1_ICSelection)) | ((uint8_t)( TIM1_ICFilter << 4))));
9606  15a2 7b06          	ld	a,(OFST+5,sp)
9607  15a4 97            	ld	xl,a
9608  15a5 a610          	ld	a,#16
9609  15a7 42            	mul	x,a
9610  15a8 9f            	ld	a,xl
9611  15a9 1a03          	or	a,(OFST+2,sp)
9612  15ab 6b01          	ld	(OFST+0,sp),a
9614  15ad c6525b        	ld	a,21083
9615  15b0 a40c          	and	a,#12
9616  15b2 1a01          	or	a,(OFST+0,sp)
9617  15b4 c7525b        	ld	21083,a
9618                     ; 2306   if (TIM1_ICPolarity != TIM1_ICPOLARITY_RISING)
9620  15b7 0d02          	tnz	(OFST+1,sp)
9621  15b9 2706          	jreq	L1373
9622                     ; 2308     TIM1->CCER2 |= TIM1_CCER2_CC4P;
9624  15bb 721a525d      	bset	21085,#5
9626  15bf 2004          	jra	L3373
9627  15c1               L1373:
9628                     ; 2312     TIM1->CCER2 &= (uint8_t)(~TIM1_CCER2_CC4P);
9630  15c1 721b525d      	bres	21085,#5
9631  15c5               L3373:
9632                     ; 2316   TIM1->CCER2 |=  TIM1_CCER2_CC4E;
9634  15c5 7218525d      	bset	21085,#4
9635                     ; 2317 }
9638  15c9 5b03          	addw	sp,#3
9639  15cb 81            	ret
9652                     	xdef	_TIM1_ClearITPendingBit
9653                     	xdef	_TIM1_GetITStatus
9654                     	xdef	_TIM1_ClearFlag
9655                     	xdef	_TIM1_GetFlagStatus
9656                     	xdef	_TIM1_GetPrescaler
9657                     	xdef	_TIM1_GetCounter
9658                     	xdef	_TIM1_GetCapture4
9659                     	xdef	_TIM1_GetCapture3
9660                     	xdef	_TIM1_GetCapture2
9661                     	xdef	_TIM1_GetCapture1
9662                     	xdef	_TIM1_SetIC4Prescaler
9663                     	xdef	_TIM1_SetIC3Prescaler
9664                     	xdef	_TIM1_SetIC2Prescaler
9665                     	xdef	_TIM1_SetIC1Prescaler
9666                     	xdef	_TIM1_SetCompare4
9667                     	xdef	_TIM1_SetCompare3
9668                     	xdef	_TIM1_SetCompare2
9669                     	xdef	_TIM1_SetCompare1
9670                     	xdef	_TIM1_SetAutoreload
9671                     	xdef	_TIM1_SetCounter
9672                     	xdef	_TIM1_SelectOCxM
9673                     	xdef	_TIM1_CCxNCmd
9674                     	xdef	_TIM1_CCxCmd
9675                     	xdef	_TIM1_OC4PolarityConfig
9676                     	xdef	_TIM1_OC3NPolarityConfig
9677                     	xdef	_TIM1_OC3PolarityConfig
9678                     	xdef	_TIM1_OC2NPolarityConfig
9679                     	xdef	_TIM1_OC2PolarityConfig
9680                     	xdef	_TIM1_OC1NPolarityConfig
9681                     	xdef	_TIM1_OC1PolarityConfig
9682                     	xdef	_TIM1_GenerateEvent
9683                     	xdef	_TIM1_OC4FastConfig
9684                     	xdef	_TIM1_OC3FastConfig
9685                     	xdef	_TIM1_OC2FastConfig
9686                     	xdef	_TIM1_OC1FastConfig
9687                     	xdef	_TIM1_OC4PreloadConfig
9688                     	xdef	_TIM1_OC3PreloadConfig
9689                     	xdef	_TIM1_OC2PreloadConfig
9690                     	xdef	_TIM1_OC1PreloadConfig
9691                     	xdef	_TIM1_CCPreloadControl
9692                     	xdef	_TIM1_SelectCOM
9693                     	xdef	_TIM1_ARRPreloadConfig
9694                     	xdef	_TIM1_ForcedOC4Config
9695                     	xdef	_TIM1_ForcedOC3Config
9696                     	xdef	_TIM1_ForcedOC2Config
9697                     	xdef	_TIM1_ForcedOC1Config
9698                     	xdef	_TIM1_CounterModeConfig
9699                     	xdef	_TIM1_PrescalerConfig
9700                     	xdef	_TIM1_EncoderInterfaceConfig
9701                     	xdef	_TIM1_SelectMasterSlaveMode
9702                     	xdef	_TIM1_SelectSlaveMode
9703                     	xdef	_TIM1_SelectOutputTrigger
9704                     	xdef	_TIM1_SelectOnePulseMode
9705                     	xdef	_TIM1_SelectHallSensor
9706                     	xdef	_TIM1_UpdateRequestConfig
9707                     	xdef	_TIM1_UpdateDisableConfig
9708                     	xdef	_TIM1_SelectInputTrigger
9709                     	xdef	_TIM1_TIxExternalClockConfig
9710                     	xdef	_TIM1_ETRConfig
9711                     	xdef	_TIM1_ETRClockMode2Config
9712                     	xdef	_TIM1_ETRClockMode1Config
9713                     	xdef	_TIM1_InternalClockConfig
9714                     	xdef	_TIM1_ITConfig
9715                     	xdef	_TIM1_CtrlPWMOutputs
9716                     	xdef	_TIM1_Cmd
9717                     	xdef	_TIM1_PWMIConfig
9718                     	xdef	_TIM1_ICInit
9719                     	xdef	_TIM1_BDTRConfig
9720                     	xdef	_TIM1_OC4Init
9721                     	xdef	_TIM1_OC3Init
9722                     	xdef	_TIM1_OC2Init
9723                     	xdef	_TIM1_OC1Init
9724                     	xdef	_TIM1_TimeBaseInit
9725                     	xdef	_TIM1_DeInit
9726                     	xref	_assert_failed
9727                     .const:	section	.text
9728  0000               L101:
9729  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
9730  0012 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
9731  0024 72697665725c  	dc.b	"river\src\stm8s_ti"
9732  0036 6d312e6300    	dc.b	"m1.c",0
9752                     	end
