   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  48                     ; 52 void TIM2_DeInit(void)
  48                     ; 53 {
  50                     	switch	.text
  51  0000               _TIM2_DeInit:
  55                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  57  0000 725f5300      	clr	21248
  58                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  60  0004 725f5303      	clr	21251
  61                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  63  0008 725f5305      	clr	21253
  64                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  66  000c 725f530a      	clr	21258
  67                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  69  0010 725f530b      	clr	21259
  70                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  72  0014 725f530a      	clr	21258
  73                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  75  0018 725f530b      	clr	21259
  76                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  78  001c 725f5307      	clr	21255
  79                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  81  0020 725f5308      	clr	21256
  82                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  84  0024 725f5309      	clr	21257
  85                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  87  0028 725f530c      	clr	21260
  88                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  90  002c 725f530d      	clr	21261
  91                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  93  0030 725f530e      	clr	21262
  94                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  96  0034 35ff530f      	mov	21263,#255
  97                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  99  0038 35ff5310      	mov	21264,#255
 100                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
 102  003c 725f5311      	clr	21265
 103                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 105  0040 725f5312      	clr	21266
 106                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 108  0044 725f5313      	clr	21267
 109                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 111  0048 725f5314      	clr	21268
 112                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 114  004c 725f5315      	clr	21269
 115                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 117  0050 725f5316      	clr	21270
 118                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 120  0054 725f5304      	clr	21252
 121                     ; 81 }
 124  0058 81            	ret	
 292                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 292                     ; 90                         uint16_t TIM2_Period)
 292                     ; 91 {
 293                     	switch	.text
 294  0059               _TIM2_TimeBaseInit:
 296  0059 88            	push	a
 297       00000000      OFST:	set	0
 300                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 302  005a c7530e        	ld	21262,a
 303                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 305  005d 7b04          	ld	a,(OFST+4,sp)
 306  005f c7530f        	ld	21263,a
 307                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 309  0062 7b05          	ld	a,(OFST+5,sp)
 310  0064 c75310        	ld	21264,a
 311                     ; 97 }
 314  0067 84            	pop	a
 315  0068 81            	ret	
 473                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 473                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 473                     ; 110                   uint16_t TIM2_Pulse,
 473                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 473                     ; 112 {
 474                     	switch	.text
 475  0069               _TIM2_OC1Init:
 477  0069 89            	pushw	x
 478  006a 88            	push	a
 479       00000001      OFST:	set	1
 482                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 484  006b 9e            	ld	a,xh
 485  006c 4d            	tnz	a
 486  006d 271e          	jreq	L61
 487  006f 9e            	ld	a,xh
 488  0070 a110          	cp	a,#16
 489  0072 2719          	jreq	L61
 490  0074 9e            	ld	a,xh
 491  0075 a120          	cp	a,#32
 492  0077 2714          	jreq	L61
 493  0079 9e            	ld	a,xh
 494  007a a130          	cp	a,#48
 495  007c 270f          	jreq	L61
 496  007e 9e            	ld	a,xh
 497  007f a160          	cp	a,#96
 498  0081 270a          	jreq	L61
 499  0083 9e            	ld	a,xh
 500  0084 a170          	cp	a,#112
 501  0086 2705          	jreq	L61
 502  0088 ae0072        	ldw	x,#114
 503  008b ad4b          	call	LC001
 504  008d               L61:
 505                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 507  008d 7b03          	ld	a,(OFST+2,sp)
 508  008f 2709          	jreq	L62
 509  0091 a111          	cp	a,#17
 510  0093 2705          	jreq	L62
 511  0095 ae0073        	ldw	x,#115
 512  0098 ad3e          	call	LC001
 513  009a               L62:
 514                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 516  009a 7b08          	ld	a,(OFST+7,sp)
 517  009c 2709          	jreq	L63
 518  009e a122          	cp	a,#34
 519  00a0 2705          	jreq	L63
 520  00a2 ae0074        	ldw	x,#116
 521  00a5 ad31          	call	LC001
 522  00a7               L63:
 523                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 525  00a7 c6530a        	ld	a,21258
 526  00aa a4fc          	and	a,#252
 527  00ac c7530a        	ld	21258,a
 528                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 528                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 530  00af 7b08          	ld	a,(OFST+7,sp)
 531  00b1 a402          	and	a,#2
 532  00b3 6b01          	ld	(OFST+0,sp),a
 534  00b5 7b03          	ld	a,(OFST+2,sp)
 535  00b7 a401          	and	a,#1
 536  00b9 1a01          	or	a,(OFST+0,sp)
 537  00bb ca530a        	or	a,21258
 538  00be c7530a        	ld	21258,a
 539                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 539                     ; 126                           (uint8_t)TIM2_OCMode);
 541  00c1 c65307        	ld	a,21255
 542  00c4 a48f          	and	a,#143
 543  00c6 1a02          	or	a,(OFST+1,sp)
 544  00c8 c75307        	ld	21255,a
 545                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 547  00cb 7b06          	ld	a,(OFST+5,sp)
 548  00cd c75311        	ld	21265,a
 549                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 551  00d0 7b07          	ld	a,(OFST+6,sp)
 552  00d2 c75312        	ld	21266,a
 553                     ; 131 }
 556  00d5 5b03          	addw	sp,#3
 557  00d7 81            	ret	
 558  00d8               LC001:
 559  00d8 89            	pushw	x
 560  00d9 5f            	clrw	x
 561  00da 89            	pushw	x
 562  00db ae0000        	ldw	x,#L702
 563  00de cd0000        	call	_assert_failed
 565  00e1 5b04          	addw	sp,#4
 566  00e3 81            	ret	
 631                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 631                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 631                     ; 144                   uint16_t TIM2_Pulse,
 631                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 631                     ; 146 {
 632                     	switch	.text
 633  00e4               _TIM2_OC2Init:
 635  00e4 89            	pushw	x
 636  00e5 88            	push	a
 637       00000001      OFST:	set	1
 640                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 642  00e6 9e            	ld	a,xh
 643  00e7 4d            	tnz	a
 644  00e8 271e          	jreq	L05
 645  00ea 9e            	ld	a,xh
 646  00eb a110          	cp	a,#16
 647  00ed 2719          	jreq	L05
 648  00ef 9e            	ld	a,xh
 649  00f0 a120          	cp	a,#32
 650  00f2 2714          	jreq	L05
 651  00f4 9e            	ld	a,xh
 652  00f5 a130          	cp	a,#48
 653  00f7 270f          	jreq	L05
 654  00f9 9e            	ld	a,xh
 655  00fa a160          	cp	a,#96
 656  00fc 270a          	jreq	L05
 657  00fe 9e            	ld	a,xh
 658  00ff a170          	cp	a,#112
 659  0101 2705          	jreq	L05
 660  0103 ae0094        	ldw	x,#148
 661  0106 ad4b          	call	LC002
 662  0108               L05:
 663                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 665  0108 7b03          	ld	a,(OFST+2,sp)
 666  010a 2709          	jreq	L06
 667  010c a111          	cp	a,#17
 668  010e 2705          	jreq	L06
 669  0110 ae0095        	ldw	x,#149
 670  0113 ad3e          	call	LC002
 671  0115               L06:
 672                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 674  0115 7b08          	ld	a,(OFST+7,sp)
 675  0117 2709          	jreq	L07
 676  0119 a122          	cp	a,#34
 677  011b 2705          	jreq	L07
 678  011d ae0096        	ldw	x,#150
 679  0120 ad31          	call	LC002
 680  0122               L07:
 681                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 683  0122 c6530a        	ld	a,21258
 684  0125 a4cf          	and	a,#207
 685  0127 c7530a        	ld	21258,a
 686                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 686                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 688  012a 7b08          	ld	a,(OFST+7,sp)
 689  012c a420          	and	a,#32
 690  012e 6b01          	ld	(OFST+0,sp),a
 692  0130 7b03          	ld	a,(OFST+2,sp)
 693  0132 a410          	and	a,#16
 694  0134 1a01          	or	a,(OFST+0,sp)
 695  0136 ca530a        	or	a,21258
 696  0139 c7530a        	ld	21258,a
 697                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 697                     ; 162                           (uint8_t)TIM2_OCMode);
 699  013c c65308        	ld	a,21256
 700  013f a48f          	and	a,#143
 701  0141 1a02          	or	a,(OFST+1,sp)
 702  0143 c75308        	ld	21256,a
 703                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 705  0146 7b06          	ld	a,(OFST+5,sp)
 706  0148 c75313        	ld	21267,a
 707                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 709  014b 7b07          	ld	a,(OFST+6,sp)
 710  014d c75314        	ld	21268,a
 711                     ; 168 }
 714  0150 5b03          	addw	sp,#3
 715  0152 81            	ret	
 716  0153               LC002:
 717  0153 89            	pushw	x
 718  0154 5f            	clrw	x
 719  0155 89            	pushw	x
 720  0156 ae0000        	ldw	x,#L702
 721  0159 cd0000        	call	_assert_failed
 723  015c 5b04          	addw	sp,#4
 724  015e 81            	ret	
 789                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 789                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 789                     ; 181                   uint16_t TIM2_Pulse,
 789                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 789                     ; 183 {
 790                     	switch	.text
 791  015f               _TIM2_OC3Init:
 793  015f 89            	pushw	x
 794  0160 88            	push	a
 795       00000001      OFST:	set	1
 798                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 800  0161 9e            	ld	a,xh
 801  0162 4d            	tnz	a
 802  0163 271e          	jreq	L201
 803  0165 9e            	ld	a,xh
 804  0166 a110          	cp	a,#16
 805  0168 2719          	jreq	L201
 806  016a 9e            	ld	a,xh
 807  016b a120          	cp	a,#32
 808  016d 2714          	jreq	L201
 809  016f 9e            	ld	a,xh
 810  0170 a130          	cp	a,#48
 811  0172 270f          	jreq	L201
 812  0174 9e            	ld	a,xh
 813  0175 a160          	cp	a,#96
 814  0177 270a          	jreq	L201
 815  0179 9e            	ld	a,xh
 816  017a a170          	cp	a,#112
 817  017c 2705          	jreq	L201
 818  017e ae00b9        	ldw	x,#185
 819  0181 ad4b          	call	LC003
 820  0183               L201:
 821                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 823  0183 7b03          	ld	a,(OFST+2,sp)
 824  0185 2709          	jreq	L211
 825  0187 a111          	cp	a,#17
 826  0189 2705          	jreq	L211
 827  018b ae00ba        	ldw	x,#186
 828  018e ad3e          	call	LC003
 829  0190               L211:
 830                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 832  0190 7b08          	ld	a,(OFST+7,sp)
 833  0192 2709          	jreq	L221
 834  0194 a122          	cp	a,#34
 835  0196 2705          	jreq	L221
 836  0198 ae00bb        	ldw	x,#187
 837  019b ad31          	call	LC003
 838  019d               L221:
 839                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 841  019d c6530b        	ld	a,21259
 842  01a0 a4fc          	and	a,#252
 843  01a2 c7530b        	ld	21259,a
 844                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 844                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 846  01a5 7b08          	ld	a,(OFST+7,sp)
 847  01a7 a402          	and	a,#2
 848  01a9 6b01          	ld	(OFST+0,sp),a
 850  01ab 7b03          	ld	a,(OFST+2,sp)
 851  01ad a401          	and	a,#1
 852  01af 1a01          	or	a,(OFST+0,sp)
 853  01b1 ca530b        	or	a,21259
 854  01b4 c7530b        	ld	21259,a
 855                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 855                     ; 196                           (uint8_t)TIM2_OCMode);
 857  01b7 c65309        	ld	a,21257
 858  01ba a48f          	and	a,#143
 859  01bc 1a02          	or	a,(OFST+1,sp)
 860  01be c75309        	ld	21257,a
 861                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 863  01c1 7b06          	ld	a,(OFST+5,sp)
 864  01c3 c75315        	ld	21269,a
 865                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 867  01c6 7b07          	ld	a,(OFST+6,sp)
 868  01c8 c75316        	ld	21270,a
 869                     ; 201 }
 872  01cb 5b03          	addw	sp,#3
 873  01cd 81            	ret	
 874  01ce               LC003:
 875  01ce 89            	pushw	x
 876  01cf 5f            	clrw	x
 877  01d0 89            	pushw	x
 878  01d1 ae0000        	ldw	x,#L702
 879  01d4 cd0000        	call	_assert_failed
 881  01d7 5b04          	addw	sp,#4
 882  01d9 81            	ret	
1076                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1076                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1076                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1076                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1076                     ; 216                  uint8_t TIM2_ICFilter)
1076                     ; 217 {
1077                     	switch	.text
1078  01da               _TIM2_ICInit:
1080  01da 89            	pushw	x
1081       00000000      OFST:	set	0
1084                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
1086  01db 9e            	ld	a,xh
1087  01dc 4d            	tnz	a
1088  01dd 270f          	jreq	L431
1089  01df 9e            	ld	a,xh
1090  01e0 4a            	dec	a
1091  01e1 270b          	jreq	L431
1092  01e3 9e            	ld	a,xh
1093  01e4 a102          	cp	a,#2
1094  01e6 2706          	jreq	L431
1095  01e8 ae00db        	ldw	x,#219
1096  01eb cd0271        	call	LC004
1097  01ee               L431:
1098                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1100  01ee 7b02          	ld	a,(OFST+2,sp)
1101  01f0 2709          	jreq	L441
1102  01f2 a144          	cp	a,#68
1103  01f4 2705          	jreq	L441
1104  01f6 ae00dc        	ldw	x,#220
1105  01f9 ad76          	call	LC004
1106  01fb               L441:
1107                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1109  01fb 7b05          	ld	a,(OFST+5,sp)
1110  01fd a101          	cp	a,#1
1111  01ff 270d          	jreq	L451
1112  0201 a102          	cp	a,#2
1113  0203 2709          	jreq	L451
1114  0205 a103          	cp	a,#3
1115  0207 2705          	jreq	L451
1116  0209 ae00dd        	ldw	x,#221
1117  020c ad63          	call	LC004
1118  020e               L451:
1119                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1121  020e 7b06          	ld	a,(OFST+6,sp)
1122  0210 2711          	jreq	L461
1123  0212 a104          	cp	a,#4
1124  0214 270d          	jreq	L461
1125  0216 a108          	cp	a,#8
1126  0218 2709          	jreq	L461
1127  021a a10c          	cp	a,#12
1128  021c 2705          	jreq	L461
1129  021e ae00de        	ldw	x,#222
1130  0221 ad4e          	call	LC004
1131  0223               L461:
1132                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
1134  0223 7b07          	ld	a,(OFST+7,sp)
1135  0225 a110          	cp	a,#16
1136  0227 2505          	jrult	L271
1137  0229 ae00df        	ldw	x,#223
1138  022c ad43          	call	LC004
1139  022e               L271:
1140                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
1142  022e 7b01          	ld	a,(OFST+1,sp)
1143  0230 2614          	jrne	L304
1144                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
1144                     ; 229                (uint8_t)TIM2_ICSelection,
1144                     ; 230                (uint8_t)TIM2_ICFilter);
1146  0232 7b07          	ld	a,(OFST+7,sp)
1147  0234 88            	push	a
1148  0235 7b06          	ld	a,(OFST+6,sp)
1149  0237 97            	ld	xl,a
1150  0238 7b03          	ld	a,(OFST+3,sp)
1151  023a 95            	ld	xh,a
1152  023b cd08cb        	call	L3_TI1_Config
1154  023e 84            	pop	a
1155                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1157  023f 7b06          	ld	a,(OFST+6,sp)
1158  0241 cd070b        	call	_TIM2_SetIC1Prescaler
1161  0244 2029          	jra	L504
1162  0246               L304:
1163                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
1165  0246 4a            	dec	a
1166  0247 2614          	jrne	L704
1167                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
1167                     ; 239                (uint8_t)TIM2_ICSelection,
1167                     ; 240                (uint8_t)TIM2_ICFilter);
1169  0249 7b07          	ld	a,(OFST+7,sp)
1170  024b 88            	push	a
1171  024c 7b06          	ld	a,(OFST+6,sp)
1172  024e 97            	ld	xl,a
1173  024f 7b03          	ld	a,(OFST+3,sp)
1174  0251 95            	ld	xh,a
1175  0252 cd08fb        	call	L5_TI2_Config
1177  0255 84            	pop	a
1178                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1180  0256 7b06          	ld	a,(OFST+6,sp)
1181  0258 cd0735        	call	_TIM2_SetIC2Prescaler
1184  025b 2012          	jra	L504
1185  025d               L704:
1186                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
1186                     ; 249                (uint8_t)TIM2_ICSelection,
1186                     ; 250                (uint8_t)TIM2_ICFilter);
1188  025d 7b07          	ld	a,(OFST+7,sp)
1189  025f 88            	push	a
1190  0260 7b06          	ld	a,(OFST+6,sp)
1191  0262 97            	ld	xl,a
1192  0263 7b03          	ld	a,(OFST+3,sp)
1193  0265 95            	ld	xh,a
1194  0266 cd092b        	call	L7_TI3_Config
1196  0269 84            	pop	a
1197                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1199  026a 7b06          	ld	a,(OFST+6,sp)
1200  026c cd075f        	call	_TIM2_SetIC3Prescaler
1202  026f               L504:
1203                     ; 255 }
1206  026f 85            	popw	x
1207  0270 81            	ret	
1208  0271               LC004:
1209  0271 89            	pushw	x
1210  0272 5f            	clrw	x
1211  0273 89            	pushw	x
1212  0274 ae0000        	ldw	x,#L702
1213  0277 cd0000        	call	_assert_failed
1215  027a 5b04          	addw	sp,#4
1216  027c 81            	ret	
1313                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1313                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1313                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1313                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1313                     ; 270                      uint8_t TIM2_ICFilter)
1313                     ; 271 {
1314                     	switch	.text
1315  027d               _TIM2_PWMIConfig:
1317  027d 89            	pushw	x
1318  027e 89            	pushw	x
1319       00000002      OFST:	set	2
1322                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1324                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1326                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1328  027f 9e            	ld	a,xh
1329  0280 4d            	tnz	a
1330  0281 270a          	jreq	L022
1331  0283 9e            	ld	a,xh
1332  0284 4a            	dec	a
1333  0285 2706          	jreq	L022
1334  0287 ae0114        	ldw	x,#276
1335  028a cd0330        	call	LC005
1336  028d               L022:
1337                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1339  028d 7b04          	ld	a,(OFST+2,sp)
1340  028f 270a          	jreq	L032
1341  0291 a144          	cp	a,#68
1342  0293 2706          	jreq	L032
1343  0295 ae0115        	ldw	x,#277
1344  0298 cd0330        	call	LC005
1345  029b               L032:
1346                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1348  029b 7b07          	ld	a,(OFST+5,sp)
1349  029d a101          	cp	a,#1
1350  029f 270e          	jreq	L042
1351  02a1 a102          	cp	a,#2
1352  02a3 270a          	jreq	L042
1353  02a5 a103          	cp	a,#3
1354  02a7 2706          	jreq	L042
1355  02a9 ae0116        	ldw	x,#278
1356  02ac cd0330        	call	LC005
1357  02af               L042:
1358                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1360  02af 7b08          	ld	a,(OFST+6,sp)
1361  02b1 2711          	jreq	L052
1362  02b3 a104          	cp	a,#4
1363  02b5 270d          	jreq	L052
1364  02b7 a108          	cp	a,#8
1365  02b9 2709          	jreq	L052
1366  02bb a10c          	cp	a,#12
1367  02bd 2705          	jreq	L052
1368  02bf ae0117        	ldw	x,#279
1369  02c2 ad6c          	call	LC005
1370  02c4               L052:
1371                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1373  02c4 7b04          	ld	a,(OFST+2,sp)
1374  02c6 a144          	cp	a,#68
1375  02c8 2706          	jreq	L164
1376                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1378  02ca a644          	ld	a,#68
1379  02cc 6b01          	ld	(OFST-1,sp),a
1382  02ce 2002          	jra	L364
1383  02d0               L164:
1384                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1386  02d0 0f01          	clr	(OFST-1,sp)
1388  02d2               L364:
1389                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1391  02d2 7b07          	ld	a,(OFST+5,sp)
1392  02d4 4a            	dec	a
1393  02d5 2604          	jrne	L564
1394                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1396  02d7 a602          	ld	a,#2
1398  02d9 2002          	jra	L764
1399  02db               L564:
1400                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1402  02db a601          	ld	a,#1
1403  02dd               L764:
1404  02dd 6b02          	ld	(OFST+0,sp),a
1406                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1408  02df 7b03          	ld	a,(OFST+1,sp)
1409  02e1 2626          	jrne	L174
1410                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1410                     ; 305                (uint8_t)TIM2_ICFilter);
1412  02e3 7b09          	ld	a,(OFST+7,sp)
1413  02e5 88            	push	a
1414  02e6 7b08          	ld	a,(OFST+6,sp)
1415  02e8 97            	ld	xl,a
1416  02e9 7b05          	ld	a,(OFST+3,sp)
1417  02eb 95            	ld	xh,a
1418  02ec cd08cb        	call	L3_TI1_Config
1420  02ef 84            	pop	a
1421                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1423  02f0 7b08          	ld	a,(OFST+6,sp)
1424  02f2 cd070b        	call	_TIM2_SetIC1Prescaler
1426                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1428  02f5 7b09          	ld	a,(OFST+7,sp)
1429  02f7 88            	push	a
1430  02f8 7b03          	ld	a,(OFST+1,sp)
1431  02fa 97            	ld	xl,a
1432  02fb 7b02          	ld	a,(OFST+0,sp)
1433  02fd 95            	ld	xh,a
1434  02fe cd08fb        	call	L5_TI2_Config
1436  0301 84            	pop	a
1437                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1439  0302 7b08          	ld	a,(OFST+6,sp)
1440  0304 cd0735        	call	_TIM2_SetIC2Prescaler
1443  0307 2024          	jra	L374
1444  0309               L174:
1445                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1445                     ; 320                (uint8_t)TIM2_ICFilter);
1447  0309 7b09          	ld	a,(OFST+7,sp)
1448  030b 88            	push	a
1449  030c 7b08          	ld	a,(OFST+6,sp)
1450  030e 97            	ld	xl,a
1451  030f 7b05          	ld	a,(OFST+3,sp)
1452  0311 95            	ld	xh,a
1453  0312 cd08fb        	call	L5_TI2_Config
1455  0315 84            	pop	a
1456                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1458  0316 7b08          	ld	a,(OFST+6,sp)
1459  0318 cd0735        	call	_TIM2_SetIC2Prescaler
1461                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1463  031b 7b09          	ld	a,(OFST+7,sp)
1464  031d 88            	push	a
1465  031e 7b03          	ld	a,(OFST+1,sp)
1466  0320 97            	ld	xl,a
1467  0321 7b02          	ld	a,(OFST+0,sp)
1468  0323 95            	ld	xh,a
1469  0324 cd08cb        	call	L3_TI1_Config
1471  0327 84            	pop	a
1472                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1474  0328 7b08          	ld	a,(OFST+6,sp)
1475  032a cd070b        	call	_TIM2_SetIC1Prescaler
1477  032d               L374:
1478                     ; 331 }
1481  032d 5b04          	addw	sp,#4
1482  032f 81            	ret	
1483  0330               LC005:
1484  0330 89            	pushw	x
1485  0331 5f            	clrw	x
1486  0332 89            	pushw	x
1487  0333 ae0000        	ldw	x,#L702
1488  0336 cd0000        	call	_assert_failed
1490  0339 5b04          	addw	sp,#4
1491  033b 81            	ret	
1547                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1547                     ; 340 {
1548                     	switch	.text
1549  033c               _TIM2_Cmd:
1551  033c 88            	push	a
1552       00000000      OFST:	set	0
1555                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1557  033d 4d            	tnz	a
1558  033e 2711          	jreq	L203
1559  0340 4a            	dec	a
1560  0341 270e          	jreq	L203
1561  0343 ae0156        	ldw	x,#342
1562  0346 89            	pushw	x
1563  0347 5f            	clrw	x
1564  0348 89            	pushw	x
1565  0349 ae0000        	ldw	x,#L702
1566  034c cd0000        	call	_assert_failed
1568  034f 5b04          	addw	sp,#4
1569  0351               L203:
1570                     ; 345   if (NewState != DISABLE)
1572  0351 7b01          	ld	a,(OFST+1,sp)
1573  0353 2706          	jreq	L325
1574                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1576  0355 72105300      	bset	21248,#0
1578  0359 2004          	jra	L525
1579  035b               L325:
1580                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1582  035b 72115300      	bres	21248,#0
1583  035f               L525:
1584                     ; 353 }
1587  035f 84            	pop	a
1588  0360 81            	ret	
1668                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1668                     ; 369 {
1669                     	switch	.text
1670  0361               _TIM2_ITConfig:
1672  0361 89            	pushw	x
1673       00000000      OFST:	set	0
1676                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1678  0362 9e            	ld	a,xh
1679  0363 4d            	tnz	a
1680  0364 2705          	jreq	L013
1681  0366 9e            	ld	a,xh
1682  0367 a110          	cp	a,#16
1683  0369 2505          	jrult	L213
1684  036b               L013:
1685  036b ae0173        	ldw	x,#371
1686  036e ad22          	call	LC006
1687  0370               L213:
1688                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1690  0370 7b02          	ld	a,(OFST+2,sp)
1691  0372 2708          	jreq	L223
1692  0374 4a            	dec	a
1693  0375 2705          	jreq	L223
1694  0377 ae0174        	ldw	x,#372
1695  037a ad16          	call	LC006
1696  037c               L223:
1697                     ; 374   if (NewState != DISABLE)
1699  037c 7b02          	ld	a,(OFST+2,sp)
1700  037e 2707          	jreq	L565
1701                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1703  0380 c65303        	ld	a,21251
1704  0383 1a01          	or	a,(OFST+1,sp)
1706  0385 2006          	jra	L765
1707  0387               L565:
1708                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1710  0387 7b01          	ld	a,(OFST+1,sp)
1711  0389 43            	cpl	a
1712  038a c45303        	and	a,21251
1713  038d               L765:
1714  038d c75303        	ld	21251,a
1715                     ; 384 }
1718  0390 85            	popw	x
1719  0391 81            	ret	
1720  0392               LC006:
1721  0392 89            	pushw	x
1722  0393 5f            	clrw	x
1723  0394 89            	pushw	x
1724  0395 ae0000        	ldw	x,#L702
1725  0398 cd0000        	call	_assert_failed
1727  039b 5b04          	addw	sp,#4
1728  039d 81            	ret	
1765                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1765                     ; 393 {
1766                     	switch	.text
1767  039e               _TIM2_UpdateDisableConfig:
1769  039e 88            	push	a
1770       00000000      OFST:	set	0
1773                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1775  039f 4d            	tnz	a
1776  03a0 2711          	jreq	L433
1777  03a2 4a            	dec	a
1778  03a3 270e          	jreq	L433
1779  03a5 ae018b        	ldw	x,#395
1780  03a8 89            	pushw	x
1781  03a9 5f            	clrw	x
1782  03aa 89            	pushw	x
1783  03ab ae0000        	ldw	x,#L702
1784  03ae cd0000        	call	_assert_failed
1786  03b1 5b04          	addw	sp,#4
1787  03b3               L433:
1788                     ; 398   if (NewState != DISABLE)
1790  03b3 7b01          	ld	a,(OFST+1,sp)
1791  03b5 2706          	jreq	L706
1792                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1794  03b7 72125300      	bset	21248,#1
1796  03bb 2004          	jra	L116
1797  03bd               L706:
1798                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1800  03bd 72135300      	bres	21248,#1
1801  03c1               L116:
1802                     ; 406 }
1805  03c1 84            	pop	a
1806  03c2 81            	ret	
1865                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1865                     ; 417 {
1866                     	switch	.text
1867  03c3               _TIM2_UpdateRequestConfig:
1869  03c3 88            	push	a
1870       00000000      OFST:	set	0
1873                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1875  03c4 4d            	tnz	a
1876  03c5 2711          	jreq	L643
1877  03c7 4a            	dec	a
1878  03c8 270e          	jreq	L643
1879  03ca ae01a3        	ldw	x,#419
1880  03cd 89            	pushw	x
1881  03ce 5f            	clrw	x
1882  03cf 89            	pushw	x
1883  03d0 ae0000        	ldw	x,#L702
1884  03d3 cd0000        	call	_assert_failed
1886  03d6 5b04          	addw	sp,#4
1887  03d8               L643:
1888                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1890  03d8 7b01          	ld	a,(OFST+1,sp)
1891  03da 2706          	jreq	L146
1892                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1894  03dc 72145300      	bset	21248,#2
1896  03e0 2004          	jra	L346
1897  03e2               L146:
1898                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1900  03e2 72155300      	bres	21248,#2
1901  03e6               L346:
1902                     ; 430 }
1905  03e6 84            	pop	a
1906  03e7 81            	ret	
1964                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1964                     ; 441 {
1965                     	switch	.text
1966  03e8               _TIM2_SelectOnePulseMode:
1968  03e8 88            	push	a
1969       00000000      OFST:	set	0
1972                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1974  03e9 a101          	cp	a,#1
1975  03eb 2711          	jreq	L063
1976  03ed 4d            	tnz	a
1977  03ee 270e          	jreq	L063
1978  03f0 ae01bb        	ldw	x,#443
1979  03f3 89            	pushw	x
1980  03f4 5f            	clrw	x
1981  03f5 89            	pushw	x
1982  03f6 ae0000        	ldw	x,#L702
1983  03f9 cd0000        	call	_assert_failed
1985  03fc 5b04          	addw	sp,#4
1986  03fe               L063:
1987                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1989  03fe 7b01          	ld	a,(OFST+1,sp)
1990  0400 2706          	jreq	L376
1991                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1993  0402 72165300      	bset	21248,#3
1995  0406 2004          	jra	L576
1996  0408               L376:
1997                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1999  0408 72175300      	bres	21248,#3
2000  040c               L576:
2001                     ; 454 }
2004  040c 84            	pop	a
2005  040d 81            	ret	
2074                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
2074                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
2074                     ; 486 {
2075                     	switch	.text
2076  040e               _TIM2_PrescalerConfig:
2078  040e 89            	pushw	x
2079       00000000      OFST:	set	0
2082                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
2084  040f 9f            	ld	a,xl
2085  0410 4d            	tnz	a
2086  0411 2709          	jreq	L273
2087  0413 9f            	ld	a,xl
2088  0414 4a            	dec	a
2089  0415 2705          	jreq	L273
2090  0417 ae01e8        	ldw	x,#488
2091  041a ad51          	call	LC007
2092  041c               L273:
2093                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
2095  041c 7b01          	ld	a,(OFST+1,sp)
2096  041e 2743          	jreq	L204
2097  0420 a101          	cp	a,#1
2098  0422 273f          	jreq	L204
2099  0424 a102          	cp	a,#2
2100  0426 273b          	jreq	L204
2101  0428 a103          	cp	a,#3
2102  042a 2737          	jreq	L204
2103  042c a104          	cp	a,#4
2104  042e 2733          	jreq	L204
2105  0430 a105          	cp	a,#5
2106  0432 272f          	jreq	L204
2107  0434 a106          	cp	a,#6
2108  0436 272b          	jreq	L204
2109  0438 a107          	cp	a,#7
2110  043a 2727          	jreq	L204
2111  043c a108          	cp	a,#8
2112  043e 2723          	jreq	L204
2113  0440 a109          	cp	a,#9
2114  0442 271f          	jreq	L204
2115  0444 a10a          	cp	a,#10
2116  0446 271b          	jreq	L204
2117  0448 a10b          	cp	a,#11
2118  044a 2717          	jreq	L204
2119  044c a10c          	cp	a,#12
2120  044e 2713          	jreq	L204
2121  0450 a10d          	cp	a,#13
2122  0452 270f          	jreq	L204
2123  0454 a10e          	cp	a,#14
2124  0456 270b          	jreq	L204
2125  0458 a10f          	cp	a,#15
2126  045a 2707          	jreq	L204
2127  045c ae01e9        	ldw	x,#489
2128  045f ad0c          	call	LC007
2129  0461 7b01          	ld	a,(OFST+1,sp)
2130  0463               L204:
2131                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
2133  0463 c7530e        	ld	21262,a
2134                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
2136  0466 7b02          	ld	a,(OFST+2,sp)
2137  0468 c75306        	ld	21254,a
2138                     ; 496 }
2141  046b 85            	popw	x
2142  046c 81            	ret	
2143  046d               LC007:
2144  046d 89            	pushw	x
2145  046e 5f            	clrw	x
2146  046f 89            	pushw	x
2147  0470 ae0000        	ldw	x,#L702
2148  0473 cd0000        	call	_assert_failed
2150  0476 5b04          	addw	sp,#4
2151  0478 81            	ret	
2210                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2210                     ; 508 {
2211                     	switch	.text
2212  0479               _TIM2_ForcedOC1Config:
2214  0479 88            	push	a
2215       00000000      OFST:	set	0
2218                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2220  047a a150          	cp	a,#80
2221  047c 2712          	jreq	L414
2222  047e a140          	cp	a,#64
2223  0480 270e          	jreq	L414
2224  0482 ae01fe        	ldw	x,#510
2225  0485 89            	pushw	x
2226  0486 5f            	clrw	x
2227  0487 89            	pushw	x
2228  0488 ae0000        	ldw	x,#L702
2229  048b cd0000        	call	_assert_failed
2231  048e 5b04          	addw	sp,#4
2232  0490               L414:
2233                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
2233                     ; 514                             | (uint8_t)TIM2_ForcedAction);
2235  0490 c65307        	ld	a,21255
2236  0493 a48f          	and	a,#143
2237  0495 1a01          	or	a,(OFST+1,sp)
2238  0497 c75307        	ld	21255,a
2239                     ; 515 }
2242  049a 84            	pop	a
2243  049b 81            	ret	
2280                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2280                     ; 527 {
2281                     	switch	.text
2282  049c               _TIM2_ForcedOC2Config:
2284  049c 88            	push	a
2285       00000000      OFST:	set	0
2288                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2290  049d a150          	cp	a,#80
2291  049f 2712          	jreq	L624
2292  04a1 a140          	cp	a,#64
2293  04a3 270e          	jreq	L624
2294  04a5 ae0211        	ldw	x,#529
2295  04a8 89            	pushw	x
2296  04a9 5f            	clrw	x
2297  04aa 89            	pushw	x
2298  04ab ae0000        	ldw	x,#L702
2299  04ae cd0000        	call	_assert_failed
2301  04b1 5b04          	addw	sp,#4
2302  04b3               L624:
2303                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
2303                     ; 533                           | (uint8_t)TIM2_ForcedAction);
2305  04b3 c65308        	ld	a,21256
2306  04b6 a48f          	and	a,#143
2307  04b8 1a01          	or	a,(OFST+1,sp)
2308  04ba c75308        	ld	21256,a
2309                     ; 534 }
2312  04bd 84            	pop	a
2313  04be 81            	ret	
2350                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2350                     ; 546 {
2351                     	switch	.text
2352  04bf               _TIM2_ForcedOC3Config:
2354  04bf 88            	push	a
2355       00000000      OFST:	set	0
2358                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2360  04c0 a150          	cp	a,#80
2361  04c2 2712          	jreq	L044
2362  04c4 a140          	cp	a,#64
2363  04c6 270e          	jreq	L044
2364  04c8 ae0224        	ldw	x,#548
2365  04cb 89            	pushw	x
2366  04cc 5f            	clrw	x
2367  04cd 89            	pushw	x
2368  04ce ae0000        	ldw	x,#L702
2369  04d1 cd0000        	call	_assert_failed
2371  04d4 5b04          	addw	sp,#4
2372  04d6               L044:
2373                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2373                     ; 552                             | (uint8_t)TIM2_ForcedAction);
2375  04d6 c65309        	ld	a,21257
2376  04d9 a48f          	and	a,#143
2377  04db 1a01          	or	a,(OFST+1,sp)
2378  04dd c75309        	ld	21257,a
2379                     ; 553 }
2382  04e0 84            	pop	a
2383  04e1 81            	ret	
2420                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
2420                     ; 562 {
2421                     	switch	.text
2422  04e2               _TIM2_ARRPreloadConfig:
2424  04e2 88            	push	a
2425       00000000      OFST:	set	0
2428                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2430  04e3 4d            	tnz	a
2431  04e4 2711          	jreq	L254
2432  04e6 4a            	dec	a
2433  04e7 270e          	jreq	L254
2434  04e9 ae0234        	ldw	x,#564
2435  04ec 89            	pushw	x
2436  04ed 5f            	clrw	x
2437  04ee 89            	pushw	x
2438  04ef ae0000        	ldw	x,#L702
2439  04f2 cd0000        	call	_assert_failed
2441  04f5 5b04          	addw	sp,#4
2442  04f7               L254:
2443                     ; 567   if (NewState != DISABLE)
2445  04f7 7b01          	ld	a,(OFST+1,sp)
2446  04f9 2706          	jreq	L1301
2447                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2449  04fb 721e5300      	bset	21248,#7
2451  04ff 2004          	jra	L3301
2452  0501               L1301:
2453                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2455  0501 721f5300      	bres	21248,#7
2456  0505               L3301:
2457                     ; 575 }
2460  0505 84            	pop	a
2461  0506 81            	ret	
2498                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2498                     ; 584 {
2499                     	switch	.text
2500  0507               _TIM2_OC1PreloadConfig:
2502  0507 88            	push	a
2503       00000000      OFST:	set	0
2506                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2508  0508 4d            	tnz	a
2509  0509 2711          	jreq	L464
2510  050b 4a            	dec	a
2511  050c 270e          	jreq	L464
2512  050e ae024a        	ldw	x,#586
2513  0511 89            	pushw	x
2514  0512 5f            	clrw	x
2515  0513 89            	pushw	x
2516  0514 ae0000        	ldw	x,#L702
2517  0517 cd0000        	call	_assert_failed
2519  051a 5b04          	addw	sp,#4
2520  051c               L464:
2521                     ; 589   if (NewState != DISABLE)
2523  051c 7b01          	ld	a,(OFST+1,sp)
2524  051e 2706          	jreq	L3501
2525                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2527  0520 72165307      	bset	21255,#3
2529  0524 2004          	jra	L5501
2530  0526               L3501:
2531                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2533  0526 72175307      	bres	21255,#3
2534  052a               L5501:
2535                     ; 597 }
2538  052a 84            	pop	a
2539  052b 81            	ret	
2576                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2576                     ; 606 {
2577                     	switch	.text
2578  052c               _TIM2_OC2PreloadConfig:
2580  052c 88            	push	a
2581       00000000      OFST:	set	0
2584                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2586  052d 4d            	tnz	a
2587  052e 2711          	jreq	L674
2588  0530 4a            	dec	a
2589  0531 270e          	jreq	L674
2590  0533 ae0260        	ldw	x,#608
2591  0536 89            	pushw	x
2592  0537 5f            	clrw	x
2593  0538 89            	pushw	x
2594  0539 ae0000        	ldw	x,#L702
2595  053c cd0000        	call	_assert_failed
2597  053f 5b04          	addw	sp,#4
2598  0541               L674:
2599                     ; 611   if (NewState != DISABLE)
2601  0541 7b01          	ld	a,(OFST+1,sp)
2602  0543 2706          	jreq	L5701
2603                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2605  0545 72165308      	bset	21256,#3
2607  0549 2004          	jra	L7701
2608  054b               L5701:
2609                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2611  054b 72175308      	bres	21256,#3
2612  054f               L7701:
2613                     ; 619 }
2616  054f 84            	pop	a
2617  0550 81            	ret	
2654                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2654                     ; 628 {
2655                     	switch	.text
2656  0551               _TIM2_OC3PreloadConfig:
2658  0551 88            	push	a
2659       00000000      OFST:	set	0
2662                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2664  0552 4d            	tnz	a
2665  0553 2711          	jreq	L015
2666  0555 4a            	dec	a
2667  0556 270e          	jreq	L015
2668  0558 ae0276        	ldw	x,#630
2669  055b 89            	pushw	x
2670  055c 5f            	clrw	x
2671  055d 89            	pushw	x
2672  055e ae0000        	ldw	x,#L702
2673  0561 cd0000        	call	_assert_failed
2675  0564 5b04          	addw	sp,#4
2676  0566               L015:
2677                     ; 633   if (NewState != DISABLE)
2679  0566 7b01          	ld	a,(OFST+1,sp)
2680  0568 2706          	jreq	L7111
2681                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2683  056a 72165309      	bset	21257,#3
2685  056e 2004          	jra	L1211
2686  0570               L7111:
2687                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2689  0570 72175309      	bres	21257,#3
2690  0574               L1211:
2691                     ; 641 }
2694  0574 84            	pop	a
2695  0575 81            	ret	
2769                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2769                     ; 654 {
2770                     	switch	.text
2771  0576               _TIM2_GenerateEvent:
2773  0576 88            	push	a
2774       00000000      OFST:	set	0
2777                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2779  0577 4d            	tnz	a
2780  0578 260e          	jrne	L025
2781  057a ae0290        	ldw	x,#656
2782  057d 89            	pushw	x
2783  057e 5f            	clrw	x
2784  057f 89            	pushw	x
2785  0580 ae0000        	ldw	x,#L702
2786  0583 cd0000        	call	_assert_failed
2788  0586 5b04          	addw	sp,#4
2789  0588               L025:
2790                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
2792  0588 7b01          	ld	a,(OFST+1,sp)
2793  058a c75306        	ld	21254,a
2794                     ; 660 }
2797  058d 84            	pop	a
2798  058e 81            	ret	
2835                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2835                     ; 671 {
2836                     	switch	.text
2837  058f               _TIM2_OC1PolarityConfig:
2839  058f 88            	push	a
2840       00000000      OFST:	set	0
2843                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2845  0590 4d            	tnz	a
2846  0591 2712          	jreq	L235
2847  0593 a122          	cp	a,#34
2848  0595 270e          	jreq	L235
2849  0597 ae02a1        	ldw	x,#673
2850  059a 89            	pushw	x
2851  059b 5f            	clrw	x
2852  059c 89            	pushw	x
2853  059d ae0000        	ldw	x,#L702
2854  05a0 cd0000        	call	_assert_failed
2856  05a3 5b04          	addw	sp,#4
2857  05a5               L235:
2858                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2860  05a5 7b01          	ld	a,(OFST+1,sp)
2861  05a7 2706          	jreq	L3711
2862                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2864  05a9 7212530a      	bset	21258,#1
2866  05ad 2004          	jra	L5711
2867  05af               L3711:
2868                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2870  05af 7213530a      	bres	21258,#1
2871  05b3               L5711:
2872                     ; 684 }
2875  05b3 84            	pop	a
2876  05b4 81            	ret	
2913                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2913                     ; 695 {
2914                     	switch	.text
2915  05b5               _TIM2_OC2PolarityConfig:
2917  05b5 88            	push	a
2918       00000000      OFST:	set	0
2921                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2923  05b6 4d            	tnz	a
2924  05b7 2712          	jreq	L445
2925  05b9 a122          	cp	a,#34
2926  05bb 270e          	jreq	L445
2927  05bd ae02b9        	ldw	x,#697
2928  05c0 89            	pushw	x
2929  05c1 5f            	clrw	x
2930  05c2 89            	pushw	x
2931  05c3 ae0000        	ldw	x,#L702
2932  05c6 cd0000        	call	_assert_failed
2934  05c9 5b04          	addw	sp,#4
2935  05cb               L445:
2936                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2938  05cb 7b01          	ld	a,(OFST+1,sp)
2939  05cd 2706          	jreq	L5121
2940                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2942  05cf 721a530a      	bset	21258,#5
2944  05d3 2004          	jra	L7121
2945  05d5               L5121:
2946                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2948  05d5 721b530a      	bres	21258,#5
2949  05d9               L7121:
2950                     ; 708 }
2953  05d9 84            	pop	a
2954  05da 81            	ret	
2991                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2991                     ; 719 {
2992                     	switch	.text
2993  05db               _TIM2_OC3PolarityConfig:
2995  05db 88            	push	a
2996       00000000      OFST:	set	0
2999                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3001  05dc 4d            	tnz	a
3002  05dd 2712          	jreq	L655
3003  05df a122          	cp	a,#34
3004  05e1 270e          	jreq	L655
3005  05e3 ae02d1        	ldw	x,#721
3006  05e6 89            	pushw	x
3007  05e7 5f            	clrw	x
3008  05e8 89            	pushw	x
3009  05e9 ae0000        	ldw	x,#L702
3010  05ec cd0000        	call	_assert_failed
3012  05ef 5b04          	addw	sp,#4
3013  05f1               L655:
3014                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3016  05f1 7b01          	ld	a,(OFST+1,sp)
3017  05f3 2706          	jreq	L7321
3018                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
3020  05f5 7212530b      	bset	21259,#1
3022  05f9 2004          	jra	L1421
3023  05fb               L7321:
3024                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
3026  05fb 7213530b      	bres	21259,#1
3027  05ff               L1421:
3028                     ; 732 }
3031  05ff 84            	pop	a
3032  0600 81            	ret	
3078                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
3078                     ; 746 {
3079                     	switch	.text
3080  0601               _TIM2_CCxCmd:
3082  0601 89            	pushw	x
3083       00000000      OFST:	set	0
3086                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3088  0602 9e            	ld	a,xh
3089  0603 4d            	tnz	a
3090  0604 270e          	jreq	L075
3091  0606 9e            	ld	a,xh
3092  0607 4a            	dec	a
3093  0608 270a          	jreq	L075
3094  060a 9e            	ld	a,xh
3095  060b a102          	cp	a,#2
3096  060d 2705          	jreq	L075
3097  060f ae02ec        	ldw	x,#748
3098  0612 ad43          	call	LC008
3099  0614               L075:
3100                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3102  0614 7b02          	ld	a,(OFST+2,sp)
3103  0616 2708          	jreq	L006
3104  0618 4a            	dec	a
3105  0619 2705          	jreq	L006
3106  061b ae02ed        	ldw	x,#749
3107  061e ad37          	call	LC008
3108  0620               L006:
3109                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
3111  0620 7b01          	ld	a,(OFST+1,sp)
3112  0622 2610          	jrne	L5621
3113                     ; 754     if (NewState != DISABLE)
3115  0624 7b02          	ld	a,(OFST+2,sp)
3116  0626 2706          	jreq	L7621
3117                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
3119  0628 7210530a      	bset	21258,#0
3121  062c 2027          	jra	L3721
3122  062e               L7621:
3123                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3125  062e 7211530a      	bres	21258,#0
3126  0632 2021          	jra	L3721
3127  0634               L5621:
3128                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
3130  0634 4a            	dec	a
3131  0635 2610          	jrne	L5721
3132                     ; 767     if (NewState != DISABLE)
3134  0637 7b02          	ld	a,(OFST+2,sp)
3135  0639 2706          	jreq	L7721
3136                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
3138  063b 7218530a      	bset	21258,#4
3140  063f 2014          	jra	L3721
3141  0641               L7721:
3142                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3144  0641 7219530a      	bres	21258,#4
3145  0645 200e          	jra	L3721
3146  0647               L5721:
3147                     ; 779     if (NewState != DISABLE)
3149  0647 7b02          	ld	a,(OFST+2,sp)
3150  0649 2706          	jreq	L5031
3151                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
3153  064b 7210530b      	bset	21259,#0
3155  064f 2004          	jra	L3721
3156  0651               L5031:
3157                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3159  0651 7211530b      	bres	21259,#0
3160  0655               L3721:
3161                     ; 788 }
3164  0655 85            	popw	x
3165  0656 81            	ret	
3166  0657               LC008:
3167  0657 89            	pushw	x
3168  0658 5f            	clrw	x
3169  0659 89            	pushw	x
3170  065a ae0000        	ldw	x,#L702
3171  065d cd0000        	call	_assert_failed
3173  0660 5b04          	addw	sp,#4
3174  0662 81            	ret	
3220                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
3220                     ; 811 {
3221                     	switch	.text
3222  0663               _TIM2_SelectOCxM:
3224  0663 89            	pushw	x
3225       00000000      OFST:	set	0
3228                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3230  0664 9e            	ld	a,xh
3231  0665 4d            	tnz	a
3232  0666 270e          	jreq	L216
3233  0668 9e            	ld	a,xh
3234  0669 4a            	dec	a
3235  066a 270a          	jreq	L216
3236  066c 9e            	ld	a,xh
3237  066d a102          	cp	a,#2
3238  066f 2705          	jreq	L216
3239  0671 ae032d        	ldw	x,#813
3240  0674 ad5c          	call	LC009
3241  0676               L216:
3242                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
3244  0676 7b02          	ld	a,(OFST+2,sp)
3245  0678 2721          	jreq	L226
3246  067a a110          	cp	a,#16
3247  067c 271d          	jreq	L226
3248  067e a120          	cp	a,#32
3249  0680 2719          	jreq	L226
3250  0682 a130          	cp	a,#48
3251  0684 2715          	jreq	L226
3252  0686 a160          	cp	a,#96
3253  0688 2711          	jreq	L226
3254  068a a170          	cp	a,#112
3255  068c 270d          	jreq	L226
3256  068e a150          	cp	a,#80
3257  0690 2709          	jreq	L226
3258  0692 a140          	cp	a,#64
3259  0694 2705          	jreq	L226
3260  0696 ae032e        	ldw	x,#814
3261  0699 ad37          	call	LC009
3262  069b               L226:
3263                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
3265  069b 7b01          	ld	a,(OFST+1,sp)
3266  069d 2610          	jrne	L3331
3267                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3269  069f 7211530a      	bres	21258,#0
3270                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
3270                     ; 823                             | (uint8_t)TIM2_OCMode);
3272  06a3 c65307        	ld	a,21255
3273  06a6 a48f          	and	a,#143
3274  06a8 1a02          	or	a,(OFST+2,sp)
3275  06aa c75307        	ld	21255,a
3277  06ad 2021          	jra	L5331
3278  06af               L3331:
3279                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
3281  06af 4a            	dec	a
3282  06b0 2610          	jrne	L7331
3283                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3285  06b2 7219530a      	bres	21258,#4
3286                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
3286                     ; 832                             | (uint8_t)TIM2_OCMode);
3288  06b6 c65308        	ld	a,21256
3289  06b9 a48f          	and	a,#143
3290  06bb 1a02          	or	a,(OFST+2,sp)
3291  06bd c75308        	ld	21256,a
3293  06c0 200e          	jra	L5331
3294  06c2               L7331:
3295                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3297  06c2 7211530b      	bres	21259,#0
3298                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
3298                     ; 841                             | (uint8_t)TIM2_OCMode);
3300  06c6 c65309        	ld	a,21257
3301  06c9 a48f          	and	a,#143
3302  06cb 1a02          	or	a,(OFST+2,sp)
3303  06cd c75309        	ld	21257,a
3304  06d0               L5331:
3305                     ; 843 }
3308  06d0 85            	popw	x
3309  06d1 81            	ret	
3310  06d2               LC009:
3311  06d2 89            	pushw	x
3312  06d3 5f            	clrw	x
3313  06d4 89            	pushw	x
3314  06d5 ae0000        	ldw	x,#L702
3315  06d8 cd0000        	call	_assert_failed
3317  06db 5b04          	addw	sp,#4
3318  06dd 81            	ret	
3352                     ; 851 void TIM2_SetCounter(uint16_t Counter)
3352                     ; 852 {
3353                     	switch	.text
3354  06de               _TIM2_SetCounter:
3358                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
3360  06de 9e            	ld	a,xh
3361  06df c7530c        	ld	21260,a
3362                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
3364  06e2 9f            	ld	a,xl
3365  06e3 c7530d        	ld	21261,a
3366                     ; 856 }
3369  06e6 81            	ret	
3403                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
3403                     ; 865 {
3404                     	switch	.text
3405  06e7               _TIM2_SetAutoreload:
3409                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
3411  06e7 9e            	ld	a,xh
3412  06e8 c7530f        	ld	21263,a
3413                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
3415  06eb 9f            	ld	a,xl
3416  06ec c75310        	ld	21264,a
3417                     ; 869 }
3420  06ef 81            	ret	
3454                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
3454                     ; 878 {
3455                     	switch	.text
3456  06f0               _TIM2_SetCompare1:
3460                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
3462  06f0 9e            	ld	a,xh
3463  06f1 c75311        	ld	21265,a
3464                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
3466  06f4 9f            	ld	a,xl
3467  06f5 c75312        	ld	21266,a
3468                     ; 882 }
3471  06f8 81            	ret	
3505                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
3505                     ; 891 {
3506                     	switch	.text
3507  06f9               _TIM2_SetCompare2:
3511                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
3513  06f9 9e            	ld	a,xh
3514  06fa c75313        	ld	21267,a
3515                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
3517  06fd 9f            	ld	a,xl
3518  06fe c75314        	ld	21268,a
3519                     ; 895 }
3522  0701 81            	ret	
3556                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
3556                     ; 904 {
3557                     	switch	.text
3558  0702               _TIM2_SetCompare3:
3562                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
3564  0702 9e            	ld	a,xh
3565  0703 c75315        	ld	21269,a
3566                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
3568  0706 9f            	ld	a,xl
3569  0707 c75316        	ld	21270,a
3570                     ; 908 }
3573  070a 81            	ret	
3610                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
3610                     ; 921 {
3611                     	switch	.text
3612  070b               _TIM2_SetIC1Prescaler:
3614  070b 88            	push	a
3615       00000000      OFST:	set	0
3618                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
3620  070c 4d            	tnz	a
3621  070d 271a          	jreq	L646
3622  070f a104          	cp	a,#4
3623  0711 2716          	jreq	L646
3624  0713 a108          	cp	a,#8
3625  0715 2712          	jreq	L646
3626  0717 a10c          	cp	a,#12
3627  0719 270e          	jreq	L646
3628  071b ae039b        	ldw	x,#923
3629  071e 89            	pushw	x
3630  071f 5f            	clrw	x
3631  0720 89            	pushw	x
3632  0721 ae0000        	ldw	x,#L702
3633  0724 cd0000        	call	_assert_failed
3635  0727 5b04          	addw	sp,#4
3636  0729               L646:
3637                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3637                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
3639  0729 c65307        	ld	a,21255
3640  072c a4f3          	and	a,#243
3641  072e 1a01          	or	a,(OFST+1,sp)
3642  0730 c75307        	ld	21255,a
3643                     ; 928 }
3646  0733 84            	pop	a
3647  0734 81            	ret	
3684                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3684                     ; 941 {
3685                     	switch	.text
3686  0735               _TIM2_SetIC2Prescaler:
3688  0735 88            	push	a
3689       00000000      OFST:	set	0
3692                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3694  0736 4d            	tnz	a
3695  0737 271a          	jreq	L066
3696  0739 a104          	cp	a,#4
3697  073b 2716          	jreq	L066
3698  073d a108          	cp	a,#8
3699  073f 2712          	jreq	L066
3700  0741 a10c          	cp	a,#12
3701  0743 270e          	jreq	L066
3702  0745 ae03af        	ldw	x,#943
3703  0748 89            	pushw	x
3704  0749 5f            	clrw	x
3705  074a 89            	pushw	x
3706  074b ae0000        	ldw	x,#L702
3707  074e cd0000        	call	_assert_failed
3709  0751 5b04          	addw	sp,#4
3710  0753               L066:
3711                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3711                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
3713  0753 c65308        	ld	a,21256
3714  0756 a4f3          	and	a,#243
3715  0758 1a01          	or	a,(OFST+1,sp)
3716  075a c75308        	ld	21256,a
3717                     ; 948 }
3720  075d 84            	pop	a
3721  075e 81            	ret	
3758                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3758                     ; 961 {
3759                     	switch	.text
3760  075f               _TIM2_SetIC3Prescaler:
3762  075f 88            	push	a
3763       00000000      OFST:	set	0
3766                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3768  0760 4d            	tnz	a
3769  0761 271a          	jreq	L276
3770  0763 a104          	cp	a,#4
3771  0765 2716          	jreq	L276
3772  0767 a108          	cp	a,#8
3773  0769 2712          	jreq	L276
3774  076b a10c          	cp	a,#12
3775  076d 270e          	jreq	L276
3776  076f ae03c4        	ldw	x,#964
3777  0772 89            	pushw	x
3778  0773 5f            	clrw	x
3779  0774 89            	pushw	x
3780  0775 ae0000        	ldw	x,#L702
3781  0778 cd0000        	call	_assert_failed
3783  077b 5b04          	addw	sp,#4
3784  077d               L276:
3785                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3785                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
3787  077d c65309        	ld	a,21257
3788  0780 a4f3          	and	a,#243
3789  0782 1a01          	or	a,(OFST+1,sp)
3790  0784 c75309        	ld	21257,a
3791                     ; 968 }
3794  0787 84            	pop	a
3795  0788 81            	ret	
3847                     ; 975 uint16_t TIM2_GetCapture1(void)
3847                     ; 976 {
3848                     	switch	.text
3849  0789               _TIM2_GetCapture1:
3851  0789 5204          	subw	sp,#4
3852       00000004      OFST:	set	4
3855                     ; 978   uint16_t tmpccr1 = 0;
3857                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
3861                     ; 981   tmpccr1h = TIM2->CCR1H;
3863  078b c65311        	ld	a,21265
3864  078e 6b02          	ld	(OFST-2,sp),a
3866                     ; 982   tmpccr1l = TIM2->CCR1L;
3868  0790 c65312        	ld	a,21266
3869  0793 6b01          	ld	(OFST-3,sp),a
3871                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
3873  0795 5f            	clrw	x
3874  0796 97            	ld	xl,a
3875  0797 1f03          	ldw	(OFST-1,sp),x
3877                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3879  0799 5f            	clrw	x
3880  079a 7b02          	ld	a,(OFST-2,sp)
3881  079c 97            	ld	xl,a
3882  079d 7b04          	ld	a,(OFST+0,sp)
3883  079f 01            	rrwa	x,a
3884  07a0 1a03          	or	a,(OFST-1,sp)
3885  07a2 01            	rrwa	x,a
3887                     ; 987   return (uint16_t)tmpccr1;
3891  07a3 5b04          	addw	sp,#4
3892  07a5 81            	ret	
3944                     ; 995 uint16_t TIM2_GetCapture2(void)
3944                     ; 996 {
3945                     	switch	.text
3946  07a6               _TIM2_GetCapture2:
3948  07a6 5204          	subw	sp,#4
3949       00000004      OFST:	set	4
3952                     ; 998   uint16_t tmpccr2 = 0;
3954                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
3958                     ; 1001   tmpccr2h = TIM2->CCR2H;
3960  07a8 c65313        	ld	a,21267
3961  07ab 6b02          	ld	(OFST-2,sp),a
3963                     ; 1002   tmpccr2l = TIM2->CCR2L;
3965  07ad c65314        	ld	a,21268
3966  07b0 6b01          	ld	(OFST-3,sp),a
3968                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
3970  07b2 5f            	clrw	x
3971  07b3 97            	ld	xl,a
3972  07b4 1f03          	ldw	(OFST-1,sp),x
3974                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3976  07b6 5f            	clrw	x
3977  07b7 7b02          	ld	a,(OFST-2,sp)
3978  07b9 97            	ld	xl,a
3979  07ba 7b04          	ld	a,(OFST+0,sp)
3980  07bc 01            	rrwa	x,a
3981  07bd 1a03          	or	a,(OFST-1,sp)
3982  07bf 01            	rrwa	x,a
3984                     ; 1007   return (uint16_t)tmpccr2;
3988  07c0 5b04          	addw	sp,#4
3989  07c2 81            	ret	
4041                     ; 1015 uint16_t TIM2_GetCapture3(void)
4041                     ; 1016 {
4042                     	switch	.text
4043  07c3               _TIM2_GetCapture3:
4045  07c3 5204          	subw	sp,#4
4046       00000004      OFST:	set	4
4049                     ; 1018   uint16_t tmpccr3 = 0;
4051                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
4055                     ; 1021   tmpccr3h = TIM2->CCR3H;
4057  07c5 c65315        	ld	a,21269
4058  07c8 6b02          	ld	(OFST-2,sp),a
4060                     ; 1022   tmpccr3l = TIM2->CCR3L;
4062  07ca c65316        	ld	a,21270
4063  07cd 6b01          	ld	(OFST-3,sp),a
4065                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
4067  07cf 5f            	clrw	x
4068  07d0 97            	ld	xl,a
4069  07d1 1f03          	ldw	(OFST-1,sp),x
4071                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4073  07d3 5f            	clrw	x
4074  07d4 7b02          	ld	a,(OFST-2,sp)
4075  07d6 97            	ld	xl,a
4076  07d7 7b04          	ld	a,(OFST+0,sp)
4077  07d9 01            	rrwa	x,a
4078  07da 1a03          	or	a,(OFST-1,sp)
4079  07dc 01            	rrwa	x,a
4081                     ; 1027   return (uint16_t)tmpccr3;
4085  07dd 5b04          	addw	sp,#4
4086  07df 81            	ret	
4120                     ; 1035 uint16_t TIM2_GetCounter(void)
4120                     ; 1036 {
4121                     	switch	.text
4122  07e0               _TIM2_GetCounter:
4124  07e0 89            	pushw	x
4125       00000002      OFST:	set	2
4128                     ; 1037   uint16_t tmpcntr = 0;
4130                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
4132  07e1 c6530c        	ld	a,21260
4133  07e4 97            	ld	xl,a
4134  07e5 4f            	clr	a
4135  07e6 02            	rlwa	x,a
4136  07e7 1f01          	ldw	(OFST-1,sp),x
4138                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
4140  07e9 c6530d        	ld	a,21261
4141  07ec 5f            	clrw	x
4142  07ed 97            	ld	xl,a
4143  07ee 01            	rrwa	x,a
4144  07ef 1a02          	or	a,(OFST+0,sp)
4145  07f1 01            	rrwa	x,a
4146  07f2 1a01          	or	a,(OFST-1,sp)
4147  07f4 01            	rrwa	x,a
4150  07f5 5b02          	addw	sp,#2
4151  07f7 81            	ret	
4175                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
4175                     ; 1050 {
4176                     	switch	.text
4177  07f8               _TIM2_GetPrescaler:
4181                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
4183  07f8 c6530e        	ld	a,21262
4186  07fb 81            	ret	
4326                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
4326                     ; 1069 {
4327                     	switch	.text
4328  07fc               _TIM2_GetFlagStatus:
4330  07fc 89            	pushw	x
4331  07fd 89            	pushw	x
4332       00000002      OFST:	set	2
4335                     ; 1070   FlagStatus bitstatus = RESET;
4337                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
4341                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
4343  07fe a30001        	cpw	x,#1
4344  0801 272c          	jreq	L617
4345  0803 a30002        	cpw	x,#2
4346  0806 2727          	jreq	L617
4347  0808 a30004        	cpw	x,#4
4348  080b 2722          	jreq	L617
4349  080d a30008        	cpw	x,#8
4350  0810 271d          	jreq	L617
4351  0812 a30200        	cpw	x,#512
4352  0815 2718          	jreq	L617
4353  0817 a30400        	cpw	x,#1024
4354  081a 2713          	jreq	L617
4355  081c a30800        	cpw	x,#2048
4356  081f 270e          	jreq	L617
4357  0821 ae0432        	ldw	x,#1074
4358  0824 89            	pushw	x
4359  0825 5f            	clrw	x
4360  0826 89            	pushw	x
4361  0827 ae0000        	ldw	x,#L702
4362  082a cd0000        	call	_assert_failed
4364  082d 5b04          	addw	sp,#4
4365  082f               L617:
4366                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
4368  082f c65304        	ld	a,21252
4369  0832 1404          	and	a,(OFST+2,sp)
4370  0834 6b01          	ld	(OFST-1,sp),a
4372                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
4374  0836 7b03          	ld	a,(OFST+1,sp)
4375  0838 6b02          	ld	(OFST+0,sp),a
4377                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
4379  083a c45305        	and	a,21253
4380  083d 1a01          	or	a,(OFST-1,sp)
4381  083f 2702          	jreq	L7371
4382                     ; 1081     bitstatus = SET;
4384  0841 a601          	ld	a,#1
4387  0843               L7371:
4388                     ; 1085     bitstatus = RESET;
4391                     ; 1087   return (FlagStatus)bitstatus;
4395  0843 5b04          	addw	sp,#4
4396  0845 81            	ret	
4432                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
4432                     ; 1104 {
4433                     	switch	.text
4434  0846               _TIM2_ClearFlag:
4436  0846 89            	pushw	x
4437       00000000      OFST:	set	0
4440                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
4442  0847 01            	rrwa	x,a
4443  0848 a4f0          	and	a,#240
4444  084a 01            	rrwa	x,a
4445  084b a4f1          	and	a,#241
4446  084d 01            	rrwa	x,a
4447  084e 5d            	tnzw	x
4448  084f 2604          	jrne	L427
4449  0851 1e01          	ldw	x,(OFST+1,sp)
4450  0853 260e          	jrne	L627
4451  0855               L427:
4452  0855 ae0452        	ldw	x,#1106
4453  0858 89            	pushw	x
4454  0859 5f            	clrw	x
4455  085a 89            	pushw	x
4456  085b ae0000        	ldw	x,#L702
4457  085e cd0000        	call	_assert_failed
4459  0861 5b04          	addw	sp,#4
4460  0863               L627:
4461                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
4463  0863 7b02          	ld	a,(OFST+2,sp)
4464  0865 43            	cpl	a
4465  0866 c75304        	ld	21252,a
4466                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
4468  0869 35ff5305      	mov	21253,#255
4469                     ; 1111 }
4472  086d 85            	popw	x
4473  086e 81            	ret	
4538                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
4538                     ; 1124 {
4539                     	switch	.text
4540  086f               _TIM2_GetITStatus:
4542  086f 88            	push	a
4543  0870 89            	pushw	x
4544       00000002      OFST:	set	2
4547                     ; 1125   ITStatus bitstatus = RESET;
4549                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
4553                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
4555  0871 a101          	cp	a,#1
4556  0873 271a          	jreq	L047
4557  0875 a102          	cp	a,#2
4558  0877 2716          	jreq	L047
4559  0879 a104          	cp	a,#4
4560  087b 2712          	jreq	L047
4561  087d a108          	cp	a,#8
4562  087f 270e          	jreq	L047
4563  0881 ae0469        	ldw	x,#1129
4564  0884 89            	pushw	x
4565  0885 5f            	clrw	x
4566  0886 89            	pushw	x
4567  0887 ae0000        	ldw	x,#L702
4568  088a cd0000        	call	_assert_failed
4570  088d 5b04          	addw	sp,#4
4571  088f               L047:
4572                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
4574  088f c65304        	ld	a,21252
4575  0892 1403          	and	a,(OFST+1,sp)
4576  0894 6b01          	ld	(OFST-1,sp),a
4578                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
4580  0896 c65303        	ld	a,21251
4581  0899 1403          	and	a,(OFST+1,sp)
4582  089b 6b02          	ld	(OFST+0,sp),a
4584                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
4586  089d 7b01          	ld	a,(OFST-1,sp)
4587  089f 2708          	jreq	L3102
4589  08a1 7b02          	ld	a,(OFST+0,sp)
4590  08a3 2704          	jreq	L3102
4591                     ; 1137     bitstatus = SET;
4593  08a5 a601          	ld	a,#1
4596  08a7 2001          	jra	L5102
4597  08a9               L3102:
4598                     ; 1141     bitstatus = RESET;
4600  08a9 4f            	clr	a
4602  08aa               L5102:
4603                     ; 1143   return (ITStatus)(bitstatus);
4607  08aa 5b03          	addw	sp,#3
4608  08ac 81            	ret	
4645                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
4645                     ; 1157 {
4646                     	switch	.text
4647  08ad               _TIM2_ClearITPendingBit:
4649  08ad 88            	push	a
4650       00000000      OFST:	set	0
4653                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
4655  08ae 4d            	tnz	a
4656  08af 2704          	jreq	L647
4657  08b1 a110          	cp	a,#16
4658  08b3 250e          	jrult	L057
4659  08b5               L647:
4660  08b5 ae0487        	ldw	x,#1159
4661  08b8 89            	pushw	x
4662  08b9 5f            	clrw	x
4663  08ba 89            	pushw	x
4664  08bb ae0000        	ldw	x,#L702
4665  08be cd0000        	call	_assert_failed
4667  08c1 5b04          	addw	sp,#4
4668  08c3               L057:
4669                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
4671  08c3 7b01          	ld	a,(OFST+1,sp)
4672  08c5 43            	cpl	a
4673  08c6 c75304        	ld	21252,a
4674                     ; 1163 }
4677  08c9 84            	pop	a
4678  08ca 81            	ret	
4730                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
4730                     ; 1182                        uint8_t TIM2_ICSelection,
4730                     ; 1183                        uint8_t TIM2_ICFilter)
4730                     ; 1184 {
4731                     	switch	.text
4732  08cb               L3_TI1_Config:
4734  08cb 89            	pushw	x
4735  08cc 88            	push	a
4736       00000001      OFST:	set	1
4739                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
4741  08cd 7211530a      	bres	21258,#0
4742                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
4742                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4744  08d1 7b06          	ld	a,(OFST+5,sp)
4745  08d3 97            	ld	xl,a
4746  08d4 a610          	ld	a,#16
4747  08d6 42            	mul	x,a
4748  08d7 9f            	ld	a,xl
4749  08d8 1a03          	or	a,(OFST+2,sp)
4750  08da 6b01          	ld	(OFST+0,sp),a
4752  08dc c65307        	ld	a,21255
4753  08df a40c          	and	a,#12
4754  08e1 1a01          	or	a,(OFST+0,sp)
4755  08e3 c75307        	ld	21255,a
4756                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4758  08e6 7b02          	ld	a,(OFST+1,sp)
4759  08e8 2706          	jreq	L3602
4760                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
4762  08ea 7212530a      	bset	21258,#1
4764  08ee 2004          	jra	L5602
4765  08f0               L3602:
4766                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
4768  08f0 7213530a      	bres	21258,#1
4769  08f4               L5602:
4770                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
4772  08f4 7210530a      	bset	21258,#0
4773                     ; 1203 }
4776  08f8 5b03          	addw	sp,#3
4777  08fa 81            	ret	
4829                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
4829                     ; 1222                        uint8_t TIM2_ICSelection,
4829                     ; 1223                        uint8_t TIM2_ICFilter)
4829                     ; 1224 {
4830                     	switch	.text
4831  08fb               L5_TI2_Config:
4833  08fb 89            	pushw	x
4834  08fc 88            	push	a
4835       00000001      OFST:	set	1
4838                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
4840  08fd 7219530a      	bres	21258,#4
4841                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
4841                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4843  0901 7b06          	ld	a,(OFST+5,sp)
4844  0903 97            	ld	xl,a
4845  0904 a610          	ld	a,#16
4846  0906 42            	mul	x,a
4847  0907 9f            	ld	a,xl
4848  0908 1a03          	or	a,(OFST+2,sp)
4849  090a 6b01          	ld	(OFST+0,sp),a
4851  090c c65308        	ld	a,21256
4852  090f a40c          	and	a,#12
4853  0911 1a01          	or	a,(OFST+0,sp)
4854  0913 c75308        	ld	21256,a
4855                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4857  0916 7b02          	ld	a,(OFST+1,sp)
4858  0918 2706          	jreq	L5112
4859                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
4861  091a 721a530a      	bset	21258,#5
4863  091e 2004          	jra	L7112
4864  0920               L5112:
4865                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4867  0920 721b530a      	bres	21258,#5
4868  0924               L7112:
4869                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
4871  0924 7218530a      	bset	21258,#4
4872                     ; 1245 }
4875  0928 5b03          	addw	sp,#3
4876  092a 81            	ret	
4928                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4928                     ; 1262                        uint8_t TIM2_ICFilter)
4928                     ; 1263 {
4929                     	switch	.text
4930  092b               L7_TI3_Config:
4932  092b 89            	pushw	x
4933  092c 88            	push	a
4934       00000001      OFST:	set	1
4937                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4939  092d 7211530b      	bres	21259,#0
4940                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4940                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4942  0931 7b06          	ld	a,(OFST+5,sp)
4943  0933 97            	ld	xl,a
4944  0934 a610          	ld	a,#16
4945  0936 42            	mul	x,a
4946  0937 9f            	ld	a,xl
4947  0938 1a03          	or	a,(OFST+2,sp)
4948  093a 6b01          	ld	(OFST+0,sp),a
4950  093c c65309        	ld	a,21257
4951  093f a40c          	and	a,#12
4952  0941 1a01          	or	a,(OFST+0,sp)
4953  0943 c75309        	ld	21257,a
4954                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4956  0946 7b02          	ld	a,(OFST+1,sp)
4957  0948 2706          	jreq	L7412
4958                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
4960  094a 7212530b      	bset	21259,#1
4962  094e 2004          	jra	L1512
4963  0950               L7412:
4964                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4966  0950 7213530b      	bres	21259,#1
4967  0954               L1512:
4968                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
4970  0954 7210530b      	bset	21259,#0
4971                     ; 1283 }
4974  0958 5b03          	addw	sp,#3
4975  095a 81            	ret	
4988                     	xdef	_TIM2_ClearITPendingBit
4989                     	xdef	_TIM2_GetITStatus
4990                     	xdef	_TIM2_ClearFlag
4991                     	xdef	_TIM2_GetFlagStatus
4992                     	xdef	_TIM2_GetPrescaler
4993                     	xdef	_TIM2_GetCounter
4994                     	xdef	_TIM2_GetCapture3
4995                     	xdef	_TIM2_GetCapture2
4996                     	xdef	_TIM2_GetCapture1
4997                     	xdef	_TIM2_SetIC3Prescaler
4998                     	xdef	_TIM2_SetIC2Prescaler
4999                     	xdef	_TIM2_SetIC1Prescaler
5000                     	xdef	_TIM2_SetCompare3
5001                     	xdef	_TIM2_SetCompare2
5002                     	xdef	_TIM2_SetCompare1
5003                     	xdef	_TIM2_SetAutoreload
5004                     	xdef	_TIM2_SetCounter
5005                     	xdef	_TIM2_SelectOCxM
5006                     	xdef	_TIM2_CCxCmd
5007                     	xdef	_TIM2_OC3PolarityConfig
5008                     	xdef	_TIM2_OC2PolarityConfig
5009                     	xdef	_TIM2_OC1PolarityConfig
5010                     	xdef	_TIM2_GenerateEvent
5011                     	xdef	_TIM2_OC3PreloadConfig
5012                     	xdef	_TIM2_OC2PreloadConfig
5013                     	xdef	_TIM2_OC1PreloadConfig
5014                     	xdef	_TIM2_ARRPreloadConfig
5015                     	xdef	_TIM2_ForcedOC3Config
5016                     	xdef	_TIM2_ForcedOC2Config
5017                     	xdef	_TIM2_ForcedOC1Config
5018                     	xdef	_TIM2_PrescalerConfig
5019                     	xdef	_TIM2_SelectOnePulseMode
5020                     	xdef	_TIM2_UpdateRequestConfig
5021                     	xdef	_TIM2_UpdateDisableConfig
5022                     	xdef	_TIM2_ITConfig
5023                     	xdef	_TIM2_Cmd
5024                     	xdef	_TIM2_PWMIConfig
5025                     	xdef	_TIM2_ICInit
5026                     	xdef	_TIM2_OC3Init
5027                     	xdef	_TIM2_OC2Init
5028                     	xdef	_TIM2_OC1Init
5029                     	xdef	_TIM2_TimeBaseInit
5030                     	xdef	_TIM2_DeInit
5031                     	xref	_assert_failed
5032                     .const:	section	.text
5033  0000               L702:
5034  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm\librarie"
5035  0012 735c73746d38  	dc.b	"s\stm8s_stdperiph_"
5036  0024 647269766572  	dc.b	"driver\src\stm8s_t"
5037  0036 696d322e6300  	dc.b	"im2.c",0
5057                     	end
