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
 399                     ; 109 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 399                     ; 110                   TIM2_OutputState_TypeDef TIM2_OutputState,
 399                     ; 111                   uint16_t TIM2_Pulse,
 399                     ; 112                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 399                     ; 113 {
 400                     	switch	.text
 401  0069               _TIM2_OC1Init:
 405                     ; 132 }
 408  0069 81            	ret	
 443                     ; 143 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 443                     ; 144                   TIM2_OutputState_TypeDef TIM2_OutputState,
 443                     ; 145                   uint16_t TIM2_Pulse,
 443                     ; 146                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 443                     ; 147 {
 444                     	switch	.text
 445  006a               _TIM2_OC2Init:
 449                     ; 169 }
 452  006a 81            	ret	
 487                     ; 180 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 487                     ; 181                   TIM2_OutputState_TypeDef TIM2_OutputState,
 487                     ; 182                   uint16_t TIM2_Pulse,
 487                     ; 183                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 487                     ; 184 {
 488                     	switch	.text
 489  006b               _TIM2_OC3Init:
 493                     ; 202 }
 496  006b 81            	ret	
 690                     ; 213 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 690                     ; 214                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 690                     ; 215                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 690                     ; 216                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 690                     ; 217                  uint8_t TIM2_ICFilter)
 690                     ; 218 {
 691                     	switch	.text
 692  006c               _TIM2_ICInit:
 694  006c 89            	pushw	x
 695       00000000      OFST:	set	0
 698                     ; 220   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 700  006d 9e            	ld	a,xh
 701  006e 4d            	tnz	a
 702  006f 270f          	jreq	L42
 703  0071 9e            	ld	a,xh
 704  0072 4a            	dec	a
 705  0073 270b          	jreq	L42
 706  0075 9e            	ld	a,xh
 707  0076 a102          	cp	a,#2
 708  0078 2706          	jreq	L42
 709  007a ae00dc        	ldw	x,#220
 710  007d cd0103        	call	LC001
 711  0080               L42:
 712                     ; 221   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 714  0080 7b02          	ld	a,(OFST+2,sp)
 715  0082 2709          	jreq	L43
 716  0084 a144          	cp	a,#68
 717  0086 2705          	jreq	L43
 718  0088 ae00dd        	ldw	x,#221
 719  008b ad76          	call	LC001
 720  008d               L43:
 721                     ; 222   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 723  008d 7b05          	ld	a,(OFST+5,sp)
 724  008f a101          	cp	a,#1
 725  0091 270d          	jreq	L44
 726  0093 a102          	cp	a,#2
 727  0095 2709          	jreq	L44
 728  0097 a103          	cp	a,#3
 729  0099 2705          	jreq	L44
 730  009b ae00de        	ldw	x,#222
 731  009e ad63          	call	LC001
 732  00a0               L44:
 733                     ; 223   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 735  00a0 7b06          	ld	a,(OFST+6,sp)
 736  00a2 2711          	jreq	L45
 737  00a4 a104          	cp	a,#4
 738  00a6 270d          	jreq	L45
 739  00a8 a108          	cp	a,#8
 740  00aa 2709          	jreq	L45
 741  00ac a10c          	cp	a,#12
 742  00ae 2705          	jreq	L45
 743  00b0 ae00df        	ldw	x,#223
 744  00b3 ad4e          	call	LC001
 745  00b5               L45:
 746                     ; 224   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 748  00b5 7b07          	ld	a,(OFST+7,sp)
 749  00b7 a110          	cp	a,#16
 750  00b9 2505          	jrult	L26
 751  00bb ae00e0        	ldw	x,#224
 752  00be ad43          	call	LC001
 753  00c0               L26:
 754                     ; 226   if (TIM2_Channel == TIM2_CHANNEL_1)
 756  00c0 7b01          	ld	a,(OFST+1,sp)
 757  00c2 2614          	jrne	L713
 758                     ; 229     TI1_Config((uint8_t)TIM2_ICPolarity,
 758                     ; 230                (uint8_t)TIM2_ICSelection,
 758                     ; 231                (uint8_t)TIM2_ICFilter);
 760  00c4 7b07          	ld	a,(OFST+7,sp)
 761  00c6 88            	push	a
 762  00c7 7b06          	ld	a,(OFST+6,sp)
 763  00c9 97            	ld	xl,a
 764  00ca 7b03          	ld	a,(OFST+3,sp)
 765  00cc 95            	ld	xh,a
 766  00cd cd04d6        	call	L3_TI1_Config
 768  00d0 84            	pop	a
 769                     ; 234     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 771  00d1 7b06          	ld	a,(OFST+6,sp)
 772  00d3 cd03a0        	call	_TIM2_SetIC1Prescaler
 775  00d6 2029          	jra	L123
 776  00d8               L713:
 777                     ; 236   else if (TIM2_Channel == TIM2_CHANNEL_2)
 779  00d8 4a            	dec	a
 780  00d9 2614          	jrne	L323
 781                     ; 239     TI2_Config((uint8_t)TIM2_ICPolarity,
 781                     ; 240                (uint8_t)TIM2_ICSelection,
 781                     ; 241                (uint8_t)TIM2_ICFilter);
 783  00db 7b07          	ld	a,(OFST+7,sp)
 784  00dd 88            	push	a
 785  00de 7b06          	ld	a,(OFST+6,sp)
 786  00e0 97            	ld	xl,a
 787  00e1 7b03          	ld	a,(OFST+3,sp)
 788  00e3 95            	ld	xh,a
 789  00e4 cd0506        	call	L5_TI2_Config
 791  00e7 84            	pop	a
 792                     ; 244     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 794  00e8 7b06          	ld	a,(OFST+6,sp)
 795  00ea cd03ca        	call	_TIM2_SetIC2Prescaler
 798  00ed 2012          	jra	L123
 799  00ef               L323:
 800                     ; 249     TI3_Config((uint8_t)TIM2_ICPolarity,
 800                     ; 250                (uint8_t)TIM2_ICSelection,
 800                     ; 251                (uint8_t)TIM2_ICFilter);
 802  00ef 7b07          	ld	a,(OFST+7,sp)
 803  00f1 88            	push	a
 804  00f2 7b06          	ld	a,(OFST+6,sp)
 805  00f4 97            	ld	xl,a
 806  00f5 7b03          	ld	a,(OFST+3,sp)
 807  00f7 95            	ld	xh,a
 808  00f8 cd0507        	call	L7_TI3_Config
 810  00fb 84            	pop	a
 811                     ; 254     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
 813  00fc 7b06          	ld	a,(OFST+6,sp)
 814  00fe cd03cb        	call	_TIM2_SetIC3Prescaler
 816  0101               L123:
 817                     ; 256 }
 820  0101 85            	popw	x
 821  0102 81            	ret	
 822  0103               LC001:
 823  0103 89            	pushw	x
 824  0104 5f            	clrw	x
 825  0105 89            	pushw	x
 826  0106 ae0000        	ldw	x,#L513
 827  0109 cd0000        	call	_assert_failed
 829  010c 5b04          	addw	sp,#4
 830  010e 81            	ret	
 927                     ; 267 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
 927                     ; 268                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 927                     ; 269                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
 927                     ; 270                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 927                     ; 271                      uint8_t TIM2_ICFilter)
 927                     ; 272 {
 928                     	switch	.text
 929  010f               _TIM2_PWMIConfig:
 931  010f 89            	pushw	x
 932  0110 89            	pushw	x
 933       00000002      OFST:	set	2
 936                     ; 273   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
 938                     ; 274   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
 940                     ; 277   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
 942  0111 9e            	ld	a,xh
 943  0112 4d            	tnz	a
 944  0113 270a          	jreq	L011
 945  0115 9e            	ld	a,xh
 946  0116 4a            	dec	a
 947  0117 2706          	jreq	L011
 948  0119 ae0115        	ldw	x,#277
 949  011c cd01c2        	call	LC002
 950  011f               L011:
 951                     ; 278   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 953  011f 7b04          	ld	a,(OFST+2,sp)
 954  0121 270a          	jreq	L021
 955  0123 a144          	cp	a,#68
 956  0125 2706          	jreq	L021
 957  0127 ae0116        	ldw	x,#278
 958  012a cd01c2        	call	LC002
 959  012d               L021:
 960                     ; 279   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 962  012d 7b07          	ld	a,(OFST+5,sp)
 963  012f a101          	cp	a,#1
 964  0131 270e          	jreq	L031
 965  0133 a102          	cp	a,#2
 966  0135 270a          	jreq	L031
 967  0137 a103          	cp	a,#3
 968  0139 2706          	jreq	L031
 969  013b ae0117        	ldw	x,#279
 970  013e cd01c2        	call	LC002
 971  0141               L031:
 972                     ; 280   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 974  0141 7b08          	ld	a,(OFST+6,sp)
 975  0143 2711          	jreq	L041
 976  0145 a104          	cp	a,#4
 977  0147 270d          	jreq	L041
 978  0149 a108          	cp	a,#8
 979  014b 2709          	jreq	L041
 980  014d a10c          	cp	a,#12
 981  014f 2705          	jreq	L041
 982  0151 ae0118        	ldw	x,#280
 983  0154 ad6c          	call	LC002
 984  0156               L041:
 985                     ; 283   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
 987  0156 7b04          	ld	a,(OFST+2,sp)
 988  0158 a144          	cp	a,#68
 989  015a 2706          	jreq	L573
 990                     ; 285     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
 992  015c a644          	ld	a,#68
 993  015e 6b01          	ld	(OFST-1,sp),a
 996  0160 2002          	jra	L773
 997  0162               L573:
 998                     ; 289     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1000  0162 0f01          	clr	(OFST-1,sp)
1002  0164               L773:
1003                     ; 293   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1005  0164 7b07          	ld	a,(OFST+5,sp)
1006  0166 4a            	dec	a
1007  0167 2604          	jrne	L104
1008                     ; 295     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1010  0169 a602          	ld	a,#2
1012  016b 2002          	jra	L304
1013  016d               L104:
1014                     ; 299     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1016  016d a601          	ld	a,#1
1017  016f               L304:
1018  016f 6b02          	ld	(OFST+0,sp),a
1020                     ; 302   if (TIM2_Channel == TIM2_CHANNEL_1)
1022  0171 7b03          	ld	a,(OFST+1,sp)
1023  0173 2626          	jrne	L504
1024                     ; 305     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1024                     ; 306                (uint8_t)TIM2_ICFilter);
1026  0175 7b09          	ld	a,(OFST+7,sp)
1027  0177 88            	push	a
1028  0178 7b08          	ld	a,(OFST+6,sp)
1029  017a 97            	ld	xl,a
1030  017b 7b05          	ld	a,(OFST+3,sp)
1031  017d 95            	ld	xh,a
1032  017e cd04d6        	call	L3_TI1_Config
1034  0181 84            	pop	a
1035                     ; 309     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1037  0182 7b08          	ld	a,(OFST+6,sp)
1038  0184 cd03a0        	call	_TIM2_SetIC1Prescaler
1040                     ; 312     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1042  0187 7b09          	ld	a,(OFST+7,sp)
1043  0189 88            	push	a
1044  018a 7b03          	ld	a,(OFST+1,sp)
1045  018c 97            	ld	xl,a
1046  018d 7b02          	ld	a,(OFST+0,sp)
1047  018f 95            	ld	xh,a
1048  0190 cd0506        	call	L5_TI2_Config
1050  0193 84            	pop	a
1051                     ; 315     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1053  0194 7b08          	ld	a,(OFST+6,sp)
1054  0196 cd03ca        	call	_TIM2_SetIC2Prescaler
1057  0199 2024          	jra	L704
1058  019b               L504:
1059                     ; 320     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1059                     ; 321                (uint8_t)TIM2_ICFilter);
1061  019b 7b09          	ld	a,(OFST+7,sp)
1062  019d 88            	push	a
1063  019e 7b08          	ld	a,(OFST+6,sp)
1064  01a0 97            	ld	xl,a
1065  01a1 7b05          	ld	a,(OFST+3,sp)
1066  01a3 95            	ld	xh,a
1067  01a4 cd0506        	call	L5_TI2_Config
1069  01a7 84            	pop	a
1070                     ; 324     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1072  01a8 7b08          	ld	a,(OFST+6,sp)
1073  01aa cd03ca        	call	_TIM2_SetIC2Prescaler
1075                     ; 327     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1077  01ad 7b09          	ld	a,(OFST+7,sp)
1078  01af 88            	push	a
1079  01b0 7b03          	ld	a,(OFST+1,sp)
1080  01b2 97            	ld	xl,a
1081  01b3 7b02          	ld	a,(OFST+0,sp)
1082  01b5 95            	ld	xh,a
1083  01b6 cd04d6        	call	L3_TI1_Config
1085  01b9 84            	pop	a
1086                     ; 330     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1088  01ba 7b08          	ld	a,(OFST+6,sp)
1089  01bc cd03a0        	call	_TIM2_SetIC1Prescaler
1091  01bf               L704:
1092                     ; 332 }
1095  01bf 5b04          	addw	sp,#4
1096  01c1 81            	ret	
1097  01c2               LC002:
1098  01c2 89            	pushw	x
1099  01c3 5f            	clrw	x
1100  01c4 89            	pushw	x
1101  01c5 ae0000        	ldw	x,#L513
1102  01c8 cd0000        	call	_assert_failed
1104  01cb 5b04          	addw	sp,#4
1105  01cd 81            	ret	
1161                     ; 340 void TIM2_Cmd(FunctionalState NewState)
1161                     ; 341 {
1162                     	switch	.text
1163  01ce               _TIM2_Cmd:
1165  01ce 88            	push	a
1166       00000000      OFST:	set	0
1169                     ; 343   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1171  01cf 4d            	tnz	a
1172  01d0 2711          	jreq	L271
1173  01d2 4a            	dec	a
1174  01d3 270e          	jreq	L271
1175  01d5 ae0157        	ldw	x,#343
1176  01d8 89            	pushw	x
1177  01d9 5f            	clrw	x
1178  01da 89            	pushw	x
1179  01db ae0000        	ldw	x,#L513
1180  01de cd0000        	call	_assert_failed
1182  01e1 5b04          	addw	sp,#4
1183  01e3               L271:
1184                     ; 346   if (NewState != DISABLE)
1186  01e3 7b01          	ld	a,(OFST+1,sp)
1187  01e5 2706          	jreq	L734
1188                     ; 348     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1190  01e7 72105300      	bset	21248,#0
1192  01eb 2004          	jra	L144
1193  01ed               L734:
1194                     ; 352     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1196  01ed 72115300      	bres	21248,#0
1197  01f1               L144:
1198                     ; 354 }
1201  01f1 84            	pop	a
1202  01f2 81            	ret	
1282                     ; 369 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1282                     ; 370 {
1283                     	switch	.text
1284  01f3               _TIM2_ITConfig:
1286  01f3 89            	pushw	x
1287       00000000      OFST:	set	0
1290                     ; 372   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1292  01f4 9e            	ld	a,xh
1293  01f5 4d            	tnz	a
1294  01f6 2705          	jreq	L002
1295  01f8 9e            	ld	a,xh
1296  01f9 a110          	cp	a,#16
1297  01fb 2505          	jrult	L202
1298  01fd               L002:
1299  01fd ae0174        	ldw	x,#372
1300  0200 ad22          	call	LC003
1301  0202               L202:
1302                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1304  0202 7b02          	ld	a,(OFST+2,sp)
1305  0204 2708          	jreq	L212
1306  0206 4a            	dec	a
1307  0207 2705          	jreq	L212
1308  0209 ae0175        	ldw	x,#373
1309  020c ad16          	call	LC003
1310  020e               L212:
1311                     ; 375   if (NewState != DISABLE)
1313  020e 7b02          	ld	a,(OFST+2,sp)
1314  0210 2707          	jreq	L105
1315                     ; 378     TIM2->IER |= (uint8_t)TIM2_IT;
1317  0212 c65303        	ld	a,21251
1318  0215 1a01          	or	a,(OFST+1,sp)
1320  0217 2006          	jra	L305
1321  0219               L105:
1322                     ; 383     TIM2->IER &= (uint8_t)(~TIM2_IT);
1324  0219 7b01          	ld	a,(OFST+1,sp)
1325  021b 43            	cpl	a
1326  021c c45303        	and	a,21251
1327  021f               L305:
1328  021f c75303        	ld	21251,a
1329                     ; 385 }
1332  0222 85            	popw	x
1333  0223 81            	ret	
1334  0224               LC003:
1335  0224 89            	pushw	x
1336  0225 5f            	clrw	x
1337  0226 89            	pushw	x
1338  0227 ae0000        	ldw	x,#L513
1339  022a cd0000        	call	_assert_failed
1341  022d 5b04          	addw	sp,#4
1342  022f 81            	ret	
1378                     ; 393 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1378                     ; 394 {
1379                     	switch	.text
1380  0230               _TIM2_UpdateDisableConfig:
1384                     ; 409 }
1387  0230 81            	ret	
1445                     ; 419 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1445                     ; 420 {
1446                     	switch	.text
1447  0231               _TIM2_UpdateRequestConfig:
1451                     ; 434 }
1454  0231 81            	ret	
1511                     ; 444 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1511                     ; 445 {
1512                     	switch	.text
1513  0232               _TIM2_SelectOnePulseMode:
1517                     ; 459 }
1520  0232 81            	ret	
1556                     ; 489 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1556                     ; 490                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1556                     ; 491 {
1557                     	switch	.text
1558  0233               _TIM2_PrescalerConfig:
1562                     ; 501 }
1565  0233 81            	ret	
1623                     ; 512 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1623                     ; 513 {
1624                     	switch	.text
1625  0234               _TIM2_ForcedOC1Config:
1629                     ; 520 }
1632  0234 81            	ret	
1668                     ; 531 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1668                     ; 532 {
1669                     	switch	.text
1670  0235               _TIM2_ForcedOC2Config:
1674                     ; 539 }
1677  0235 81            	ret	
1713                     ; 550 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1713                     ; 551 {
1714                     	switch	.text
1715  0236               _TIM2_ForcedOC3Config:
1719                     ; 558 }
1722  0236 81            	ret	
1758                     ; 566 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1758                     ; 567 {
1759                     	switch	.text
1760  0237               _TIM2_ARRPreloadConfig:
1764                     ; 581 }
1767  0237 81            	ret	
1803                     ; 589 void TIM2_OC1PreloadConfig(FunctionalState NewState)
1803                     ; 590 {
1804                     	switch	.text
1805  0238               _TIM2_OC1PreloadConfig:
1809                     ; 604 }
1812  0238 81            	ret	
1848                     ; 612 void TIM2_OC2PreloadConfig(FunctionalState NewState)
1848                     ; 613 {
1849                     	switch	.text
1850  0239               _TIM2_OC2PreloadConfig:
1854                     ; 627 }
1857  0239 81            	ret	
1893                     ; 635 void TIM2_OC3PreloadConfig(FunctionalState NewState)
1893                     ; 636 {
1894                     	switch	.text
1895  023a               _TIM2_OC3PreloadConfig:
1899                     ; 650 }
1902  023a 81            	ret	
1975                     ; 662 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
1975                     ; 663 {
1976                     	switch	.text
1977  023b               _TIM2_GenerateEvent:
1981                     ; 669 }
1984  023b 81            	ret	
2043                     ; 679 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2043                     ; 680 {
2044                     	switch	.text
2045  023c               _TIM2_OC1PolarityConfig:
2047  023c 88            	push	a
2048       00000000      OFST:	set	0
2051                     ; 682   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2053  023d 4d            	tnz	a
2054  023e 2712          	jreq	L452
2055  0240 a122          	cp	a,#34
2056  0242 270e          	jreq	L452
2057  0244 ae02aa        	ldw	x,#682
2058  0247 89            	pushw	x
2059  0248 5f            	clrw	x
2060  0249 89            	pushw	x
2061  024a ae0000        	ldw	x,#L513
2062  024d cd0000        	call	_assert_failed
2064  0250 5b04          	addw	sp,#4
2065  0252               L452:
2066                     ; 685   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2068  0252 7b01          	ld	a,(OFST+1,sp)
2069  0254 2706          	jreq	L7401
2070                     ; 687     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2072  0256 7212530a      	bset	21258,#1
2074  025a 2004          	jra	L1501
2075  025c               L7401:
2076                     ; 691     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2078  025c 7213530a      	bres	21258,#1
2079  0260               L1501:
2080                     ; 693 }
2083  0260 84            	pop	a
2084  0261 81            	ret	
2121                     ; 703 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2121                     ; 704 {
2122                     	switch	.text
2123  0262               _TIM2_OC2PolarityConfig:
2125  0262 88            	push	a
2126       00000000      OFST:	set	0
2129                     ; 706   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2131  0263 4d            	tnz	a
2132  0264 2712          	jreq	L662
2133  0266 a122          	cp	a,#34
2134  0268 270e          	jreq	L662
2135  026a ae02c2        	ldw	x,#706
2136  026d 89            	pushw	x
2137  026e 5f            	clrw	x
2138  026f 89            	pushw	x
2139  0270 ae0000        	ldw	x,#L513
2140  0273 cd0000        	call	_assert_failed
2142  0276 5b04          	addw	sp,#4
2143  0278               L662:
2144                     ; 709   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2146  0278 7b01          	ld	a,(OFST+1,sp)
2147  027a 2706          	jreq	L1701
2148                     ; 711     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2150  027c 721a530a      	bset	21258,#5
2152  0280 2004          	jra	L3701
2153  0282               L1701:
2154                     ; 715     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2156  0282 721b530a      	bres	21258,#5
2157  0286               L3701:
2158                     ; 717 }
2161  0286 84            	pop	a
2162  0287 81            	ret	
2199                     ; 727 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2199                     ; 728 {
2200                     	switch	.text
2201  0288               _TIM2_OC3PolarityConfig:
2203  0288 88            	push	a
2204       00000000      OFST:	set	0
2207                     ; 730   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2209  0289 4d            	tnz	a
2210  028a 2712          	jreq	L003
2211  028c a122          	cp	a,#34
2212  028e 270e          	jreq	L003
2213  0290 ae02da        	ldw	x,#730
2214  0293 89            	pushw	x
2215  0294 5f            	clrw	x
2216  0295 89            	pushw	x
2217  0296 ae0000        	ldw	x,#L513
2218  0299 cd0000        	call	_assert_failed
2220  029c 5b04          	addw	sp,#4
2221  029e               L003:
2222                     ; 733   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2224  029e 7b01          	ld	a,(OFST+1,sp)
2225  02a0 2706          	jreq	L3111
2226                     ; 735     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2228  02a2 7212530b      	bset	21259,#1
2230  02a6 2004          	jra	L5111
2231  02a8               L3111:
2232                     ; 739     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2234  02a8 7213530b      	bres	21259,#1
2235  02ac               L5111:
2236                     ; 741 }
2239  02ac 84            	pop	a
2240  02ad 81            	ret	
2286                     ; 754 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2286                     ; 755 {
2287                     	switch	.text
2288  02ae               _TIM2_CCxCmd:
2290  02ae 89            	pushw	x
2291       00000000      OFST:	set	0
2294                     ; 757   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2296  02af 9e            	ld	a,xh
2297  02b0 4d            	tnz	a
2298  02b1 270e          	jreq	L213
2299  02b3 9e            	ld	a,xh
2300  02b4 4a            	dec	a
2301  02b5 270a          	jreq	L213
2302  02b7 9e            	ld	a,xh
2303  02b8 a102          	cp	a,#2
2304  02ba 2705          	jreq	L213
2305  02bc ae02f5        	ldw	x,#757
2306  02bf ad43          	call	LC004
2307  02c1               L213:
2308                     ; 758   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2310  02c1 7b02          	ld	a,(OFST+2,sp)
2311  02c3 2708          	jreq	L223
2312  02c5 4a            	dec	a
2313  02c6 2705          	jreq	L223
2314  02c8 ae02f6        	ldw	x,#758
2315  02cb ad37          	call	LC004
2316  02cd               L223:
2317                     ; 760   if (TIM2_Channel == TIM2_CHANNEL_1)
2319  02cd 7b01          	ld	a,(OFST+1,sp)
2320  02cf 2610          	jrne	L1411
2321                     ; 763     if (NewState != DISABLE)
2323  02d1 7b02          	ld	a,(OFST+2,sp)
2324  02d3 2706          	jreq	L3411
2325                     ; 765       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2327  02d5 7210530a      	bset	21258,#0
2329  02d9 2027          	jra	L7411
2330  02db               L3411:
2331                     ; 769       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2333  02db 7211530a      	bres	21258,#0
2334  02df 2021          	jra	L7411
2335  02e1               L1411:
2336                     ; 773   else if (TIM2_Channel == TIM2_CHANNEL_2)
2338  02e1 4a            	dec	a
2339  02e2 2610          	jrne	L1511
2340                     ; 776     if (NewState != DISABLE)
2342  02e4 7b02          	ld	a,(OFST+2,sp)
2343  02e6 2706          	jreq	L3511
2344                     ; 778       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2346  02e8 7218530a      	bset	21258,#4
2348  02ec 2014          	jra	L7411
2349  02ee               L3511:
2350                     ; 782       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2352  02ee 7219530a      	bres	21258,#4
2353  02f2 200e          	jra	L7411
2354  02f4               L1511:
2355                     ; 788     if (NewState != DISABLE)
2357  02f4 7b02          	ld	a,(OFST+2,sp)
2358  02f6 2706          	jreq	L1611
2359                     ; 790       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2361  02f8 7210530b      	bset	21259,#0
2363  02fc 2004          	jra	L7411
2364  02fe               L1611:
2365                     ; 794       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2367  02fe 7211530b      	bres	21259,#0
2368  0302               L7411:
2369                     ; 797 }
2372  0302 85            	popw	x
2373  0303 81            	ret	
2374  0304               LC004:
2375  0304 89            	pushw	x
2376  0305 5f            	clrw	x
2377  0306 89            	pushw	x
2378  0307 ae0000        	ldw	x,#L513
2379  030a cd0000        	call	_assert_failed
2381  030d 5b04          	addw	sp,#4
2382  030f 81            	ret	
2428                     ; 819 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2428                     ; 820 {
2429                     	switch	.text
2430  0310               _TIM2_SelectOCxM:
2432  0310 89            	pushw	x
2433       00000000      OFST:	set	0
2436                     ; 822   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2438  0311 9e            	ld	a,xh
2439  0312 4d            	tnz	a
2440  0313 270e          	jreq	L433
2441  0315 9e            	ld	a,xh
2442  0316 4a            	dec	a
2443  0317 270a          	jreq	L433
2444  0319 9e            	ld	a,xh
2445  031a a102          	cp	a,#2
2446  031c 2705          	jreq	L433
2447  031e ae0336        	ldw	x,#822
2448  0321 ad5c          	call	LC005
2449  0323               L433:
2450                     ; 823   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2452  0323 7b02          	ld	a,(OFST+2,sp)
2453  0325 2721          	jreq	L443
2454  0327 a110          	cp	a,#16
2455  0329 271d          	jreq	L443
2456  032b a120          	cp	a,#32
2457  032d 2719          	jreq	L443
2458  032f a130          	cp	a,#48
2459  0331 2715          	jreq	L443
2460  0333 a160          	cp	a,#96
2461  0335 2711          	jreq	L443
2462  0337 a170          	cp	a,#112
2463  0339 270d          	jreq	L443
2464  033b a150          	cp	a,#80
2465  033d 2709          	jreq	L443
2466  033f a140          	cp	a,#64
2467  0341 2705          	jreq	L443
2468  0343 ae0337        	ldw	x,#823
2469  0346 ad37          	call	LC005
2470  0348               L443:
2471                     ; 825   if (TIM2_Channel == TIM2_CHANNEL_1)
2473  0348 7b01          	ld	a,(OFST+1,sp)
2474  034a 2610          	jrne	L7021
2475                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2477  034c 7211530a      	bres	21258,#0
2478                     ; 831     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2478                     ; 832                             | (uint8_t)TIM2_OCMode);
2480  0350 c65307        	ld	a,21255
2481  0353 a48f          	and	a,#143
2482  0355 1a02          	or	a,(OFST+2,sp)
2483  0357 c75307        	ld	21255,a
2485  035a 2021          	jra	L1121
2486  035c               L7021:
2487                     ; 834   else if (TIM2_Channel == TIM2_CHANNEL_2)
2489  035c 4a            	dec	a
2490  035d 2610          	jrne	L3121
2491                     ; 837     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2493  035f 7219530a      	bres	21258,#4
2494                     ; 840     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2494                     ; 841                             | (uint8_t)TIM2_OCMode);
2496  0363 c65308        	ld	a,21256
2497  0366 a48f          	and	a,#143
2498  0368 1a02          	or	a,(OFST+2,sp)
2499  036a c75308        	ld	21256,a
2501  036d 200e          	jra	L1121
2502  036f               L3121:
2503                     ; 846     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2505  036f 7211530b      	bres	21259,#0
2506                     ; 849     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2506                     ; 850                             | (uint8_t)TIM2_OCMode);
2508  0373 c65309        	ld	a,21257
2509  0376 a48f          	and	a,#143
2510  0378 1a02          	or	a,(OFST+2,sp)
2511  037a c75309        	ld	21257,a
2512  037d               L1121:
2513                     ; 852 }
2516  037d 85            	popw	x
2517  037e 81            	ret	
2518  037f               LC005:
2519  037f 89            	pushw	x
2520  0380 5f            	clrw	x
2521  0381 89            	pushw	x
2522  0382 ae0000        	ldw	x,#L513
2523  0385 cd0000        	call	_assert_failed
2525  0388 5b04          	addw	sp,#4
2526  038a 81            	ret	
2560                     ; 860 void TIM2_SetCounter(uint16_t Counter)
2560                     ; 861 {
2561                     	switch	.text
2562  038b               _TIM2_SetCounter:
2566                     ; 863   TIM2->CNTRH = (uint8_t)(Counter >> 8);
2568  038b 9e            	ld	a,xh
2569  038c c7530c        	ld	21260,a
2570                     ; 864   TIM2->CNTRL = (uint8_t)(Counter);
2572  038f 9f            	ld	a,xl
2573  0390 c7530d        	ld	21261,a
2574                     ; 865 }
2577  0393 81            	ret	
2611                     ; 873 void TIM2_SetAutoreload(uint16_t Autoreload)
2611                     ; 874 {
2612                     	switch	.text
2613  0394               _TIM2_SetAutoreload:
2617                     ; 876   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2619  0394 9e            	ld	a,xh
2620  0395 c7530f        	ld	21263,a
2621                     ; 877   TIM2->ARRL = (uint8_t)(Autoreload);
2623  0398 9f            	ld	a,xl
2624  0399 c75310        	ld	21264,a
2625                     ; 878 }
2628  039c 81            	ret	
2662                     ; 886 void TIM2_SetCompare1(uint16_t Compare1)
2662                     ; 887 {
2663                     	switch	.text
2664  039d               _TIM2_SetCompare1:
2668                     ; 891 }
2671  039d 81            	ret	
2705                     ; 899 void TIM2_SetCompare2(uint16_t Compare2)
2705                     ; 900 {
2706                     	switch	.text
2707  039e               _TIM2_SetCompare2:
2711                     ; 904 }
2714  039e 81            	ret	
2748                     ; 912 void TIM2_SetCompare3(uint16_t Compare3)
2748                     ; 913 {
2749                     	switch	.text
2750  039f               _TIM2_SetCompare3:
2754                     ; 917 }
2757  039f 81            	ret	
2794                     ; 929 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2794                     ; 930 {
2795                     	switch	.text
2796  03a0               _TIM2_SetIC1Prescaler:
2798  03a0 88            	push	a
2799       00000000      OFST:	set	0
2802                     ; 932   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2804  03a1 4d            	tnz	a
2805  03a2 271a          	jreq	L073
2806  03a4 a104          	cp	a,#4
2807  03a6 2716          	jreq	L073
2808  03a8 a108          	cp	a,#8
2809  03aa 2712          	jreq	L073
2810  03ac a10c          	cp	a,#12
2811  03ae 270e          	jreq	L073
2812  03b0 ae03a4        	ldw	x,#932
2813  03b3 89            	pushw	x
2814  03b4 5f            	clrw	x
2815  03b5 89            	pushw	x
2816  03b6 ae0000        	ldw	x,#L513
2817  03b9 cd0000        	call	_assert_failed
2819  03bc 5b04          	addw	sp,#4
2820  03be               L073:
2821                     ; 935   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2821                     ; 936                           | (uint8_t)TIM2_IC1Prescaler);
2823  03be c65307        	ld	a,21255
2824  03c1 a4f3          	and	a,#243
2825  03c3 1a01          	or	a,(OFST+1,sp)
2826  03c5 c75307        	ld	21255,a
2827                     ; 937 }
2830  03c8 84            	pop	a
2831  03c9 81            	ret	
2867                     ; 949 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
2867                     ; 950 {
2868                     	switch	.text
2869  03ca               _TIM2_SetIC2Prescaler:
2873                     ; 957 }
2876  03ca 81            	ret	
2912                     ; 969 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
2912                     ; 970 {
2913                     	switch	.text
2914  03cb               _TIM2_SetIC3Prescaler:
2918                     ; 977 }
2921  03cb 81            	ret	
2973                     ; 984 uint16_t TIM2_GetCapture1(void)
2973                     ; 985 {
2974                     	switch	.text
2975  03cc               _TIM2_GetCapture1:
2977  03cc 5204          	subw	sp,#4
2978       00000004      OFST:	set	4
2981                     ; 987   uint16_t tmpccr1 = 0;
2983                     ; 988   uint8_t tmpccr1l=0, tmpccr1h=0;
2987                     ; 990   tmpccr1h = TIM2->CCR1H;
2989  03ce c65311        	ld	a,21265
2990  03d1 6b02          	ld	(OFST-2,sp),a
2992                     ; 991   tmpccr1l = TIM2->CCR1L;
2994  03d3 c65312        	ld	a,21266
2995  03d6 6b01          	ld	(OFST-3,sp),a
2997                     ; 993   tmpccr1 = (uint16_t)(tmpccr1l);
2999  03d8 5f            	clrw	x
3000  03d9 97            	ld	xl,a
3001  03da 1f03          	ldw	(OFST-1,sp),x
3003                     ; 994   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3005  03dc 5f            	clrw	x
3006  03dd 7b02          	ld	a,(OFST-2,sp)
3007  03df 97            	ld	xl,a
3008  03e0 7b04          	ld	a,(OFST+0,sp)
3009  03e2 01            	rrwa	x,a
3010  03e3 1a03          	or	a,(OFST-1,sp)
3011  03e5 01            	rrwa	x,a
3013                     ; 996   return (uint16_t)tmpccr1;
3017  03e6 5b04          	addw	sp,#4
3018  03e8 81            	ret	
3041                     ; 1004 uint16_t TIM2_GetCapture2(void)
3041                     ; 1005 {
3042                     	switch	.text
3043  03e9               _TIM2_GetCapture2:
3047                     ; 1018 }
3050  03e9 81            	ret	
3073                     ; 1025 uint16_t TIM2_GetCapture3(void)
3073                     ; 1026 {
3074                     	switch	.text
3075  03ea               _TIM2_GetCapture3:
3079                     ; 1039 }
3082  03ea 81            	ret	
3116                     ; 1046 uint16_t TIM2_GetCounter(void)
3116                     ; 1047 {
3117                     	switch	.text
3118  03eb               _TIM2_GetCounter:
3120  03eb 89            	pushw	x
3121       00000002      OFST:	set	2
3124                     ; 1048   uint16_t tmpcntr = 0;
3126                     ; 1050   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3128  03ec c6530c        	ld	a,21260
3129  03ef 97            	ld	xl,a
3130  03f0 4f            	clr	a
3131  03f1 02            	rlwa	x,a
3132  03f2 1f01          	ldw	(OFST-1,sp),x
3134                     ; 1052   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3136  03f4 c6530d        	ld	a,21261
3137  03f7 5f            	clrw	x
3138  03f8 97            	ld	xl,a
3139  03f9 01            	rrwa	x,a
3140  03fa 1a02          	or	a,(OFST+0,sp)
3141  03fc 01            	rrwa	x,a
3142  03fd 1a01          	or	a,(OFST-1,sp)
3143  03ff 01            	rrwa	x,a
3146  0400 5b02          	addw	sp,#2
3147  0402 81            	ret	
3171                     ; 1060 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3171                     ; 1061 {
3172                     	switch	.text
3173  0403               _TIM2_GetPrescaler:
3177                     ; 1063   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3179  0403 c6530e        	ld	a,21262
3182  0406 81            	ret	
3322                     ; 1079 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3322                     ; 1080 {
3323                     	switch	.text
3324  0407               _TIM2_GetFlagStatus:
3326  0407 89            	pushw	x
3327  0408 89            	pushw	x
3328       00000002      OFST:	set	2
3331                     ; 1081   FlagStatus bitstatus = RESET;
3333                     ; 1082   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3337                     ; 1085   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3339  0409 a30001        	cpw	x,#1
3340  040c 272c          	jreq	L024
3341  040e a30002        	cpw	x,#2
3342  0411 2727          	jreq	L024
3343  0413 a30004        	cpw	x,#4
3344  0416 2722          	jreq	L024
3345  0418 a30008        	cpw	x,#8
3346  041b 271d          	jreq	L024
3347  041d a30200        	cpw	x,#512
3348  0420 2718          	jreq	L024
3349  0422 a30400        	cpw	x,#1024
3350  0425 2713          	jreq	L024
3351  0427 a30800        	cpw	x,#2048
3352  042a 270e          	jreq	L024
3353  042c ae043d        	ldw	x,#1085
3354  042f 89            	pushw	x
3355  0430 5f            	clrw	x
3356  0431 89            	pushw	x
3357  0432 ae0000        	ldw	x,#L513
3358  0435 cd0000        	call	_assert_failed
3360  0438 5b04          	addw	sp,#4
3361  043a               L024:
3362                     ; 1087   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3364  043a c65304        	ld	a,21252
3365  043d 1404          	and	a,(OFST+2,sp)
3366  043f 6b01          	ld	(OFST-1,sp),a
3368                     ; 1088   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3370  0441 7b03          	ld	a,(OFST+1,sp)
3371  0443 6b02          	ld	(OFST+0,sp),a
3373                     ; 1090   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3375  0445 c45305        	and	a,21253
3376  0448 1a01          	or	a,(OFST-1,sp)
3377  044a 2702          	jreq	L7551
3378                     ; 1092     bitstatus = SET;
3380  044c a601          	ld	a,#1
3383  044e               L7551:
3384                     ; 1096     bitstatus = RESET;
3387                     ; 1098   return (FlagStatus)bitstatus;
3391  044e 5b04          	addw	sp,#4
3392  0450 81            	ret	
3428                     ; 1114 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3428                     ; 1115 {
3429                     	switch	.text
3430  0451               _TIM2_ClearFlag:
3432  0451 89            	pushw	x
3433       00000000      OFST:	set	0
3436                     ; 1117   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3438  0452 01            	rrwa	x,a
3439  0453 a4f0          	and	a,#240
3440  0455 01            	rrwa	x,a
3441  0456 a4f1          	and	a,#241
3442  0458 01            	rrwa	x,a
3443  0459 5d            	tnzw	x
3444  045a 2604          	jrne	L624
3445  045c 1e01          	ldw	x,(OFST+1,sp)
3446  045e 260e          	jrne	L034
3447  0460               L624:
3448  0460 ae045d        	ldw	x,#1117
3449  0463 89            	pushw	x
3450  0464 5f            	clrw	x
3451  0465 89            	pushw	x
3452  0466 ae0000        	ldw	x,#L513
3453  0469 cd0000        	call	_assert_failed
3455  046c 5b04          	addw	sp,#4
3456  046e               L034:
3457                     ; 1120   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3459  046e 7b02          	ld	a,(OFST+2,sp)
3460  0470 43            	cpl	a
3461  0471 c75304        	ld	21252,a
3462                     ; 1121   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3464  0474 35ff5305      	mov	21253,#255
3465                     ; 1122 }
3468  0478 85            	popw	x
3469  0479 81            	ret	
3534                     ; 1134 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3534                     ; 1135 {
3535                     	switch	.text
3536  047a               _TIM2_GetITStatus:
3538  047a 88            	push	a
3539  047b 89            	pushw	x
3540       00000002      OFST:	set	2
3543                     ; 1136   ITStatus bitstatus = RESET;
3545                     ; 1137   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3549                     ; 1140   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3551  047c a101          	cp	a,#1
3552  047e 271a          	jreq	L244
3553  0480 a102          	cp	a,#2
3554  0482 2716          	jreq	L244
3555  0484 a104          	cp	a,#4
3556  0486 2712          	jreq	L244
3557  0488 a108          	cp	a,#8
3558  048a 270e          	jreq	L244
3559  048c ae0474        	ldw	x,#1140
3560  048f 89            	pushw	x
3561  0490 5f            	clrw	x
3562  0491 89            	pushw	x
3563  0492 ae0000        	ldw	x,#L513
3564  0495 cd0000        	call	_assert_failed
3566  0498 5b04          	addw	sp,#4
3567  049a               L244:
3568                     ; 1142   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3570  049a c65304        	ld	a,21252
3571  049d 1403          	and	a,(OFST+1,sp)
3572  049f 6b01          	ld	(OFST-1,sp),a
3574                     ; 1144   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3576  04a1 c65303        	ld	a,21251
3577  04a4 1403          	and	a,(OFST+1,sp)
3578  04a6 6b02          	ld	(OFST+0,sp),a
3580                     ; 1146   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3582  04a8 7b01          	ld	a,(OFST-1,sp)
3583  04aa 2708          	jreq	L3361
3585  04ac 7b02          	ld	a,(OFST+0,sp)
3586  04ae 2704          	jreq	L3361
3587                     ; 1148     bitstatus = SET;
3589  04b0 a601          	ld	a,#1
3592  04b2 2001          	jra	L5361
3593  04b4               L3361:
3594                     ; 1152     bitstatus = RESET;
3596  04b4 4f            	clr	a
3598  04b5               L5361:
3599                     ; 1154   return (ITStatus)(bitstatus);
3603  04b5 5b03          	addw	sp,#3
3604  04b7 81            	ret	
3641                     ; 1167 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3641                     ; 1168 {
3642                     	switch	.text
3643  04b8               _TIM2_ClearITPendingBit:
3645  04b8 88            	push	a
3646       00000000      OFST:	set	0
3649                     ; 1170   assert_param(IS_TIM2_IT_OK(TIM2_IT));
3651  04b9 4d            	tnz	a
3652  04ba 2704          	jreq	L054
3653  04bc a110          	cp	a,#16
3654  04be 250e          	jrult	L254
3655  04c0               L054:
3656  04c0 ae0492        	ldw	x,#1170
3657  04c3 89            	pushw	x
3658  04c4 5f            	clrw	x
3659  04c5 89            	pushw	x
3660  04c6 ae0000        	ldw	x,#L513
3661  04c9 cd0000        	call	_assert_failed
3663  04cc 5b04          	addw	sp,#4
3664  04ce               L254:
3665                     ; 1173   TIM2->SR1 = (uint8_t)(~TIM2_IT);
3667  04ce 7b01          	ld	a,(OFST+1,sp)
3668  04d0 43            	cpl	a
3669  04d1 c75304        	ld	21252,a
3670                     ; 1174 }
3673  04d4 84            	pop	a
3674  04d5 81            	ret	
3726                     ; 1192 static void TI1_Config(uint8_t TIM2_ICPolarity,
3726                     ; 1193                        uint8_t TIM2_ICSelection,
3726                     ; 1194                        uint8_t TIM2_ICFilter)
3726                     ; 1195 {
3727                     	switch	.text
3728  04d6               L3_TI1_Config:
3730  04d6 89            	pushw	x
3731  04d7 88            	push	a
3732       00000001      OFST:	set	1
3735                     ; 1197   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3737  04d8 7211530a      	bres	21258,#0
3738                     ; 1200   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3738                     ; 1201                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3740  04dc 7b06          	ld	a,(OFST+5,sp)
3741  04de 97            	ld	xl,a
3742  04df a610          	ld	a,#16
3743  04e1 42            	mul	x,a
3744  04e2 9f            	ld	a,xl
3745  04e3 1a03          	or	a,(OFST+2,sp)
3746  04e5 6b01          	ld	(OFST+0,sp),a
3748  04e7 c65307        	ld	a,21255
3749  04ea a40c          	and	a,#12
3750  04ec 1a01          	or	a,(OFST+0,sp)
3751  04ee c75307        	ld	21255,a
3752                     ; 1204   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3754  04f1 7b02          	ld	a,(OFST+1,sp)
3755  04f3 2706          	jreq	L3071
3756                     ; 1206     TIM2->CCER1 |= TIM2_CCER1_CC1P;
3758  04f5 7212530a      	bset	21258,#1
3760  04f9 2004          	jra	L5071
3761  04fb               L3071:
3762                     ; 1210     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3764  04fb 7213530a      	bres	21258,#1
3765  04ff               L5071:
3766                     ; 1213   TIM2->CCER1 |= TIM2_CCER1_CC1E;
3768  04ff 7210530a      	bset	21258,#0
3769                     ; 1214 }
3772  0503 5b03          	addw	sp,#3
3773  0505 81            	ret	
3807                     ; 1232 static void TI2_Config(uint8_t TIM2_ICPolarity,
3807                     ; 1233                        uint8_t TIM2_ICSelection,
3807                     ; 1234                        uint8_t TIM2_ICFilter)
3807                     ; 1235 {
3808                     	switch	.text
3809  0506               L5_TI2_Config:
3813                     ; 1256 }
3816  0506 81            	ret	
3850                     ; 1272 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
3850                     ; 1273                        uint8_t TIM2_ICFilter)
3850                     ; 1274 {
3851                     	switch	.text
3852  0507               L7_TI3_Config:
3856                     ; 1294 }
3859  0507 81            	ret	
3872                     	xdef	_TIM2_ClearITPendingBit
3873                     	xdef	_TIM2_GetITStatus
3874                     	xdef	_TIM2_ClearFlag
3875                     	xdef	_TIM2_GetFlagStatus
3876                     	xdef	_TIM2_GetPrescaler
3877                     	xdef	_TIM2_GetCounter
3878                     	xdef	_TIM2_GetCapture3
3879                     	xdef	_TIM2_GetCapture2
3880                     	xdef	_TIM2_GetCapture1
3881                     	xdef	_TIM2_SetIC3Prescaler
3882                     	xdef	_TIM2_SetIC2Prescaler
3883                     	xdef	_TIM2_SetIC1Prescaler
3884                     	xdef	_TIM2_SetCompare3
3885                     	xdef	_TIM2_SetCompare2
3886                     	xdef	_TIM2_SetCompare1
3887                     	xdef	_TIM2_SetAutoreload
3888                     	xdef	_TIM2_SetCounter
3889                     	xdef	_TIM2_SelectOCxM
3890                     	xdef	_TIM2_CCxCmd
3891                     	xdef	_TIM2_OC3PolarityConfig
3892                     	xdef	_TIM2_OC2PolarityConfig
3893                     	xdef	_TIM2_OC1PolarityConfig
3894                     	xdef	_TIM2_GenerateEvent
3895                     	xdef	_TIM2_OC3PreloadConfig
3896                     	xdef	_TIM2_OC2PreloadConfig
3897                     	xdef	_TIM2_OC1PreloadConfig
3898                     	xdef	_TIM2_ARRPreloadConfig
3899                     	xdef	_TIM2_ForcedOC3Config
3900                     	xdef	_TIM2_ForcedOC2Config
3901                     	xdef	_TIM2_ForcedOC1Config
3902                     	xdef	_TIM2_PrescalerConfig
3903                     	xdef	_TIM2_SelectOnePulseMode
3904                     	xdef	_TIM2_UpdateRequestConfig
3905                     	xdef	_TIM2_UpdateDisableConfig
3906                     	xdef	_TIM2_ITConfig
3907                     	xdef	_TIM2_Cmd
3908                     	xdef	_TIM2_PWMIConfig
3909                     	xdef	_TIM2_ICInit
3910                     	xdef	_TIM2_OC3Init
3911                     	xdef	_TIM2_OC2Init
3912                     	xdef	_TIM2_OC1Init
3913                     	xdef	_TIM2_TimeBaseInit
3914                     	xdef	_TIM2_DeInit
3915                     	xref	_assert_failed
3916                     .const:	section	.text
3917  0000               L513:
3918  0000 73746d38735f  	dc.b	"stm8s_tim2_sub.c",0
3938                     	end
