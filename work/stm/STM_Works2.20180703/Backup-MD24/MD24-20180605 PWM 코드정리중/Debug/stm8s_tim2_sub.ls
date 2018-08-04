   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  49                     ; 52 void TIM2_DeInit(void)
  49                     ; 53 {
  51                     .text:	section	.text,new
  52  0000               _TIM2_DeInit:
  56                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  58  0000 725f5300      	clr	21248
  59                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  61  0004 725f5303      	clr	21251
  62                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  64  0008 725f5305      	clr	21253
  65                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  67  000c 725f530a      	clr	21258
  68                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  70  0010 725f530b      	clr	21259
  71                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  73  0014 725f530a      	clr	21258
  74                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  76  0018 725f530b      	clr	21259
  77                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  79  001c 725f5307      	clr	21255
  80                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  82  0020 725f5308      	clr	21256
  83                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  85  0024 725f5309      	clr	21257
  86                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  88  0028 725f530c      	clr	21260
  89                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  91  002c 725f530d      	clr	21261
  92                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  94  0030 725f530e      	clr	21262
  95                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  97  0034 35ff530f      	mov	21263,#255
  98                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
 100  0038 35ff5310      	mov	21264,#255
 101                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
 103  003c 725f5311      	clr	21265
 104                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 106  0040 725f5312      	clr	21266
 107                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 109  0044 725f5313      	clr	21267
 110                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 112  0048 725f5314      	clr	21268
 113                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 115  004c 725f5315      	clr	21269
 116                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 118  0050 725f5316      	clr	21270
 119                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 121  0054 725f5304      	clr	21252
 122                     ; 81 }
 125  0058 81            	ret	
 293                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 293                     ; 90                         uint16_t TIM2_Period)
 293                     ; 91 {
 294                     .text:	section	.text,new
 295  0000               _TIM2_TimeBaseInit:
 297  0000 88            	push	a
 298       00000000      OFST:	set	0
 301                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 303  0001 c7530e        	ld	21262,a
 304                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 306  0004 7b04          	ld	a,(OFST+4,sp)
 307  0006 c7530f        	ld	21263,a
 308                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 310  0009 7b05          	ld	a,(OFST+5,sp)
 311  000b c75310        	ld	21264,a
 312                     ; 97 }
 315  000e 84            	pop	a
 316  000f 81            	ret	
 400                     ; 109 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 400                     ; 110                   TIM2_OutputState_TypeDef TIM2_OutputState,
 400                     ; 111                   uint16_t TIM2_Pulse,
 400                     ; 112                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 400                     ; 113 {
 401                     .text:	section	.text,new
 402  0000               _TIM2_OC1Init:
 406                     ; 132 }
 409  0000 81            	ret	
 444                     ; 143 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 444                     ; 144                   TIM2_OutputState_TypeDef TIM2_OutputState,
 444                     ; 145                   uint16_t TIM2_Pulse,
 444                     ; 146                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 444                     ; 147 {
 445                     .text:	section	.text,new
 446  0000               _TIM2_OC2Init:
 450                     ; 169 }
 453  0000 81            	ret	
 488                     ; 180 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 488                     ; 181                   TIM2_OutputState_TypeDef TIM2_OutputState,
 488                     ; 182                   uint16_t TIM2_Pulse,
 488                     ; 183                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 488                     ; 184 {
 489                     .text:	section	.text,new
 490  0000               _TIM2_OC3Init:
 494                     ; 202 }
 497  0000 81            	ret	
 691                     ; 213 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 691                     ; 214                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 691                     ; 215                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 691                     ; 216                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 691                     ; 217                  uint8_t TIM2_ICFilter)
 691                     ; 218 {
 692                     .text:	section	.text,new
 693  0000               _TIM2_ICInit:
 695  0000 89            	pushw	x
 696       00000000      OFST:	set	0
 699                     ; 220   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 701  0001 9e            	ld	a,xh
 702  0002 4d            	tnz	a
 703  0003 270f          	jreq	L42
 704  0005 9e            	ld	a,xh
 705  0006 4a            	dec	a
 706  0007 270b          	jreq	L42
 707  0009 9e            	ld	a,xh
 708  000a a102          	cp	a,#2
 709  000c 2706          	jreq	L42
 710  000e ae00dc        	ldw	x,#220
 711  0011 cd0097        	call	LC001
 712  0014               L42:
 713                     ; 221   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 715  0014 7b02          	ld	a,(OFST+2,sp)
 716  0016 2709          	jreq	L43
 717  0018 a144          	cp	a,#68
 718  001a 2705          	jreq	L43
 719  001c ae00dd        	ldw	x,#221
 720  001f ad76          	call	LC001
 721  0021               L43:
 722                     ; 222   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 724  0021 7b05          	ld	a,(OFST+5,sp)
 725  0023 a101          	cp	a,#1
 726  0025 270d          	jreq	L44
 727  0027 a102          	cp	a,#2
 728  0029 2709          	jreq	L44
 729  002b a103          	cp	a,#3
 730  002d 2705          	jreq	L44
 731  002f ae00de        	ldw	x,#222
 732  0032 ad63          	call	LC001
 733  0034               L44:
 734                     ; 223   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 736  0034 7b06          	ld	a,(OFST+6,sp)
 737  0036 2711          	jreq	L45
 738  0038 a104          	cp	a,#4
 739  003a 270d          	jreq	L45
 740  003c a108          	cp	a,#8
 741  003e 2709          	jreq	L45
 742  0040 a10c          	cp	a,#12
 743  0042 2705          	jreq	L45
 744  0044 ae00df        	ldw	x,#223
 745  0047 ad4e          	call	LC001
 746  0049               L45:
 747                     ; 224   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 749  0049 7b07          	ld	a,(OFST+7,sp)
 750  004b a110          	cp	a,#16
 751  004d 2505          	jrult	L26
 752  004f ae00e0        	ldw	x,#224
 753  0052 ad43          	call	LC001
 754  0054               L26:
 755                     ; 226   if (TIM2_Channel == TIM2_CHANNEL_1)
 757  0054 7b01          	ld	a,(OFST+1,sp)
 758  0056 2614          	jrne	L713
 759                     ; 229     TI1_Config((uint8_t)TIM2_ICPolarity,
 759                     ; 230                (uint8_t)TIM2_ICSelection,
 759                     ; 231                (uint8_t)TIM2_ICFilter);
 761  0058 7b07          	ld	a,(OFST+7,sp)
 762  005a 88            	push	a
 763  005b 7b06          	ld	a,(OFST+6,sp)
 764  005d 97            	ld	xl,a
 765  005e 7b03          	ld	a,(OFST+3,sp)
 766  0060 95            	ld	xh,a
 767  0061 cd0000        	call	L3_TI1_Config
 769  0064 84            	pop	a
 770                     ; 234     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 772  0065 7b06          	ld	a,(OFST+6,sp)
 773  0067 cd0000        	call	_TIM2_SetIC1Prescaler
 776  006a 2029          	jra	L123
 777  006c               L713:
 778                     ; 236   else if (TIM2_Channel == TIM2_CHANNEL_2)
 780  006c 4a            	dec	a
 781  006d 2614          	jrne	L323
 782                     ; 239     TI2_Config((uint8_t)TIM2_ICPolarity,
 782                     ; 240                (uint8_t)TIM2_ICSelection,
 782                     ; 241                (uint8_t)TIM2_ICFilter);
 784  006f 7b07          	ld	a,(OFST+7,sp)
 785  0071 88            	push	a
 786  0072 7b06          	ld	a,(OFST+6,sp)
 787  0074 97            	ld	xl,a
 788  0075 7b03          	ld	a,(OFST+3,sp)
 789  0077 95            	ld	xh,a
 790  0078 cd0000        	call	L5_TI2_Config
 792  007b 84            	pop	a
 793                     ; 244     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 795  007c 7b06          	ld	a,(OFST+6,sp)
 796  007e cd0000        	call	_TIM2_SetIC2Prescaler
 799  0081 2012          	jra	L123
 800  0083               L323:
 801                     ; 249     TI3_Config((uint8_t)TIM2_ICPolarity,
 801                     ; 250                (uint8_t)TIM2_ICSelection,
 801                     ; 251                (uint8_t)TIM2_ICFilter);
 803  0083 7b07          	ld	a,(OFST+7,sp)
 804  0085 88            	push	a
 805  0086 7b06          	ld	a,(OFST+6,sp)
 806  0088 97            	ld	xl,a
 807  0089 7b03          	ld	a,(OFST+3,sp)
 808  008b 95            	ld	xh,a
 809  008c cd0000        	call	L7_TI3_Config
 811  008f 84            	pop	a
 812                     ; 254     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
 814  0090 7b06          	ld	a,(OFST+6,sp)
 815  0092 cd0000        	call	_TIM2_SetIC3Prescaler
 817  0095               L123:
 818                     ; 256 }
 821  0095 85            	popw	x
 822  0096 81            	ret	
 823  0097               LC001:
 824  0097 89            	pushw	x
 825  0098 5f            	clrw	x
 826  0099 89            	pushw	x
 827  009a ae0000        	ldw	x,#L513
 828  009d cd0000        	call	_assert_failed
 830  00a0 5b04          	addw	sp,#4
 831  00a2 81            	ret	
 928                     ; 267 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
 928                     ; 268                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 928                     ; 269                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
 928                     ; 270                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 928                     ; 271                      uint8_t TIM2_ICFilter)
 928                     ; 272 {
 929                     .text:	section	.text,new
 930  0000               _TIM2_PWMIConfig:
 932  0000 89            	pushw	x
 933  0001 89            	pushw	x
 934       00000002      OFST:	set	2
 937                     ; 273   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
 939                     ; 274   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
 941                     ; 277   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
 943  0002 9e            	ld	a,xh
 944  0003 4d            	tnz	a
 945  0004 270a          	jreq	L011
 946  0006 9e            	ld	a,xh
 947  0007 4a            	dec	a
 948  0008 2706          	jreq	L011
 949  000a ae0115        	ldw	x,#277
 950  000d cd00b3        	call	LC002
 951  0010               L011:
 952                     ; 278   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 954  0010 7b04          	ld	a,(OFST+2,sp)
 955  0012 270a          	jreq	L021
 956  0014 a144          	cp	a,#68
 957  0016 2706          	jreq	L021
 958  0018 ae0116        	ldw	x,#278
 959  001b cd00b3        	call	LC002
 960  001e               L021:
 961                     ; 279   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 963  001e 7b07          	ld	a,(OFST+5,sp)
 964  0020 a101          	cp	a,#1
 965  0022 270e          	jreq	L031
 966  0024 a102          	cp	a,#2
 967  0026 270a          	jreq	L031
 968  0028 a103          	cp	a,#3
 969  002a 2706          	jreq	L031
 970  002c ae0117        	ldw	x,#279
 971  002f cd00b3        	call	LC002
 972  0032               L031:
 973                     ; 280   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 975  0032 7b08          	ld	a,(OFST+6,sp)
 976  0034 2711          	jreq	L041
 977  0036 a104          	cp	a,#4
 978  0038 270d          	jreq	L041
 979  003a a108          	cp	a,#8
 980  003c 2709          	jreq	L041
 981  003e a10c          	cp	a,#12
 982  0040 2705          	jreq	L041
 983  0042 ae0118        	ldw	x,#280
 984  0045 ad6c          	call	LC002
 985  0047               L041:
 986                     ; 283   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
 988  0047 7b04          	ld	a,(OFST+2,sp)
 989  0049 a144          	cp	a,#68
 990  004b 2706          	jreq	L573
 991                     ; 285     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
 993  004d a644          	ld	a,#68
 994  004f 6b01          	ld	(OFST-1,sp),a
 997  0051 2002          	jra	L773
 998  0053               L573:
 999                     ; 289     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1001  0053 0f01          	clr	(OFST-1,sp)
1003  0055               L773:
1004                     ; 293   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1006  0055 7b07          	ld	a,(OFST+5,sp)
1007  0057 4a            	dec	a
1008  0058 2604          	jrne	L104
1009                     ; 295     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1011  005a a602          	ld	a,#2
1013  005c 2002          	jra	L304
1014  005e               L104:
1015                     ; 299     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1017  005e a601          	ld	a,#1
1018  0060               L304:
1019  0060 6b02          	ld	(OFST+0,sp),a
1021                     ; 302   if (TIM2_Channel == TIM2_CHANNEL_1)
1023  0062 7b03          	ld	a,(OFST+1,sp)
1024  0064 2626          	jrne	L504
1025                     ; 305     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1025                     ; 306                (uint8_t)TIM2_ICFilter);
1027  0066 7b09          	ld	a,(OFST+7,sp)
1028  0068 88            	push	a
1029  0069 7b08          	ld	a,(OFST+6,sp)
1030  006b 97            	ld	xl,a
1031  006c 7b05          	ld	a,(OFST+3,sp)
1032  006e 95            	ld	xh,a
1033  006f cd0000        	call	L3_TI1_Config
1035  0072 84            	pop	a
1036                     ; 309     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1038  0073 7b08          	ld	a,(OFST+6,sp)
1039  0075 cd0000        	call	_TIM2_SetIC1Prescaler
1041                     ; 312     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1043  0078 7b09          	ld	a,(OFST+7,sp)
1044  007a 88            	push	a
1045  007b 7b03          	ld	a,(OFST+1,sp)
1046  007d 97            	ld	xl,a
1047  007e 7b02          	ld	a,(OFST+0,sp)
1048  0080 95            	ld	xh,a
1049  0081 cd0000        	call	L5_TI2_Config
1051  0084 84            	pop	a
1052                     ; 315     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1054  0085 7b08          	ld	a,(OFST+6,sp)
1055  0087 cd0000        	call	_TIM2_SetIC2Prescaler
1058  008a 2024          	jra	L704
1059  008c               L504:
1060                     ; 320     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1060                     ; 321                (uint8_t)TIM2_ICFilter);
1062  008c 7b09          	ld	a,(OFST+7,sp)
1063  008e 88            	push	a
1064  008f 7b08          	ld	a,(OFST+6,sp)
1065  0091 97            	ld	xl,a
1066  0092 7b05          	ld	a,(OFST+3,sp)
1067  0094 95            	ld	xh,a
1068  0095 cd0000        	call	L5_TI2_Config
1070  0098 84            	pop	a
1071                     ; 324     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1073  0099 7b08          	ld	a,(OFST+6,sp)
1074  009b cd0000        	call	_TIM2_SetIC2Prescaler
1076                     ; 327     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1078  009e 7b09          	ld	a,(OFST+7,sp)
1079  00a0 88            	push	a
1080  00a1 7b03          	ld	a,(OFST+1,sp)
1081  00a3 97            	ld	xl,a
1082  00a4 7b02          	ld	a,(OFST+0,sp)
1083  00a6 95            	ld	xh,a
1084  00a7 cd0000        	call	L3_TI1_Config
1086  00aa 84            	pop	a
1087                     ; 330     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1089  00ab 7b08          	ld	a,(OFST+6,sp)
1090  00ad cd0000        	call	_TIM2_SetIC1Prescaler
1092  00b0               L704:
1093                     ; 332 }
1096  00b0 5b04          	addw	sp,#4
1097  00b2 81            	ret	
1098  00b3               LC002:
1099  00b3 89            	pushw	x
1100  00b4 5f            	clrw	x
1101  00b5 89            	pushw	x
1102  00b6 ae0000        	ldw	x,#L513
1103  00b9 cd0000        	call	_assert_failed
1105  00bc 5b04          	addw	sp,#4
1106  00be 81            	ret	
1162                     ; 340 void TIM2_Cmd(FunctionalState NewState)
1162                     ; 341 {
1163                     .text:	section	.text,new
1164  0000               _TIM2_Cmd:
1166  0000 88            	push	a
1167       00000000      OFST:	set	0
1170                     ; 343   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1172  0001 4d            	tnz	a
1173  0002 2711          	jreq	L271
1174  0004 4a            	dec	a
1175  0005 270e          	jreq	L271
1176  0007 ae0157        	ldw	x,#343
1177  000a 89            	pushw	x
1178  000b 5f            	clrw	x
1179  000c 89            	pushw	x
1180  000d ae0000        	ldw	x,#L513
1181  0010 cd0000        	call	_assert_failed
1183  0013 5b04          	addw	sp,#4
1184  0015               L271:
1185                     ; 346   if (NewState != DISABLE)
1187  0015 7b01          	ld	a,(OFST+1,sp)
1188  0017 2706          	jreq	L734
1189                     ; 348     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1191  0019 72105300      	bset	21248,#0
1193  001d 2004          	jra	L144
1194  001f               L734:
1195                     ; 352     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1197  001f 72115300      	bres	21248,#0
1198  0023               L144:
1199                     ; 354 }
1202  0023 84            	pop	a
1203  0024 81            	ret	
1283                     ; 369 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1283                     ; 370 {
1284                     .text:	section	.text,new
1285  0000               _TIM2_ITConfig:
1287  0000 89            	pushw	x
1288       00000000      OFST:	set	0
1291                     ; 372   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1293  0001 9e            	ld	a,xh
1294  0002 4d            	tnz	a
1295  0003 2705          	jreq	L002
1296  0005 9e            	ld	a,xh
1297  0006 a110          	cp	a,#16
1298  0008 2505          	jrult	L202
1299  000a               L002:
1300  000a ae0174        	ldw	x,#372
1301  000d ad22          	call	LC003
1302  000f               L202:
1303                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1305  000f 7b02          	ld	a,(OFST+2,sp)
1306  0011 2708          	jreq	L212
1307  0013 4a            	dec	a
1308  0014 2705          	jreq	L212
1309  0016 ae0175        	ldw	x,#373
1310  0019 ad16          	call	LC003
1311  001b               L212:
1312                     ; 375   if (NewState != DISABLE)
1314  001b 7b02          	ld	a,(OFST+2,sp)
1315  001d 2707          	jreq	L105
1316                     ; 378     TIM2->IER |= (uint8_t)TIM2_IT;
1318  001f c65303        	ld	a,21251
1319  0022 1a01          	or	a,(OFST+1,sp)
1321  0024 2006          	jra	L305
1322  0026               L105:
1323                     ; 383     TIM2->IER &= (uint8_t)(~TIM2_IT);
1325  0026 7b01          	ld	a,(OFST+1,sp)
1326  0028 43            	cpl	a
1327  0029 c45303        	and	a,21251
1328  002c               L305:
1329  002c c75303        	ld	21251,a
1330                     ; 385 }
1333  002f 85            	popw	x
1334  0030 81            	ret	
1335  0031               LC003:
1336  0031 89            	pushw	x
1337  0032 5f            	clrw	x
1338  0033 89            	pushw	x
1339  0034 ae0000        	ldw	x,#L513
1340  0037 cd0000        	call	_assert_failed
1342  003a 5b04          	addw	sp,#4
1343  003c 81            	ret	
1379                     ; 393 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1379                     ; 394 {
1380                     .text:	section	.text,new
1381  0000               _TIM2_UpdateDisableConfig:
1385                     ; 409 }
1388  0000 81            	ret	
1446                     ; 419 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1446                     ; 420 {
1447                     .text:	section	.text,new
1448  0000               _TIM2_UpdateRequestConfig:
1452                     ; 434 }
1455  0000 81            	ret	
1512                     ; 444 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1512                     ; 445 {
1513                     .text:	section	.text,new
1514  0000               _TIM2_SelectOnePulseMode:
1518                     ; 459 }
1521  0000 81            	ret	
1557                     ; 489 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1557                     ; 490                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1557                     ; 491 {
1558                     .text:	section	.text,new
1559  0000               _TIM2_PrescalerConfig:
1563                     ; 501 }
1566  0000 81            	ret	
1624                     ; 512 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1624                     ; 513 {
1625                     .text:	section	.text,new
1626  0000               _TIM2_ForcedOC1Config:
1630                     ; 520 }
1633  0000 81            	ret	
1669                     ; 531 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1669                     ; 532 {
1670                     .text:	section	.text,new
1671  0000               _TIM2_ForcedOC2Config:
1675                     ; 539 }
1678  0000 81            	ret	
1714                     ; 550 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1714                     ; 551 {
1715                     .text:	section	.text,new
1716  0000               _TIM2_ForcedOC3Config:
1720                     ; 558 }
1723  0000 81            	ret	
1759                     ; 566 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1759                     ; 567 {
1760                     .text:	section	.text,new
1761  0000               _TIM2_ARRPreloadConfig:
1765                     ; 581 }
1768  0000 81            	ret	
1804                     ; 589 void TIM2_OC1PreloadConfig(FunctionalState NewState)
1804                     ; 590 {
1805                     .text:	section	.text,new
1806  0000               _TIM2_OC1PreloadConfig:
1810                     ; 604 }
1813  0000 81            	ret	
1849                     ; 612 void TIM2_OC2PreloadConfig(FunctionalState NewState)
1849                     ; 613 {
1850                     .text:	section	.text,new
1851  0000               _TIM2_OC2PreloadConfig:
1855                     ; 627 }
1858  0000 81            	ret	
1894                     ; 635 void TIM2_OC3PreloadConfig(FunctionalState NewState)
1894                     ; 636 {
1895                     .text:	section	.text,new
1896  0000               _TIM2_OC3PreloadConfig:
1900                     ; 650 }
1903  0000 81            	ret	
1976                     ; 662 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
1976                     ; 663 {
1977                     .text:	section	.text,new
1978  0000               _TIM2_GenerateEvent:
1982                     ; 669 }
1985  0000 81            	ret	
2044                     ; 679 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2044                     ; 680 {
2045                     .text:	section	.text,new
2046  0000               _TIM2_OC1PolarityConfig:
2048  0000 88            	push	a
2049       00000000      OFST:	set	0
2052                     ; 682   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2054  0001 4d            	tnz	a
2055  0002 2712          	jreq	L452
2056  0004 a122          	cp	a,#34
2057  0006 270e          	jreq	L452
2058  0008 ae02aa        	ldw	x,#682
2059  000b 89            	pushw	x
2060  000c 5f            	clrw	x
2061  000d 89            	pushw	x
2062  000e ae0000        	ldw	x,#L513
2063  0011 cd0000        	call	_assert_failed
2065  0014 5b04          	addw	sp,#4
2066  0016               L452:
2067                     ; 685   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2069  0016 7b01          	ld	a,(OFST+1,sp)
2070  0018 2706          	jreq	L7401
2071                     ; 687     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2073  001a 7212530a      	bset	21258,#1
2075  001e 2004          	jra	L1501
2076  0020               L7401:
2077                     ; 691     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2079  0020 7213530a      	bres	21258,#1
2080  0024               L1501:
2081                     ; 693 }
2084  0024 84            	pop	a
2085  0025 81            	ret	
2122                     ; 703 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2122                     ; 704 {
2123                     .text:	section	.text,new
2124  0000               _TIM2_OC2PolarityConfig:
2126  0000 88            	push	a
2127       00000000      OFST:	set	0
2130                     ; 706   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2132  0001 4d            	tnz	a
2133  0002 2712          	jreq	L662
2134  0004 a122          	cp	a,#34
2135  0006 270e          	jreq	L662
2136  0008 ae02c2        	ldw	x,#706
2137  000b 89            	pushw	x
2138  000c 5f            	clrw	x
2139  000d 89            	pushw	x
2140  000e ae0000        	ldw	x,#L513
2141  0011 cd0000        	call	_assert_failed
2143  0014 5b04          	addw	sp,#4
2144  0016               L662:
2145                     ; 709   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2147  0016 7b01          	ld	a,(OFST+1,sp)
2148  0018 2706          	jreq	L1701
2149                     ; 711     TIM2->CCER1 |= TIM2_CCER1_CC2P;
2151  001a 721a530a      	bset	21258,#5
2153  001e 2004          	jra	L3701
2154  0020               L1701:
2155                     ; 715     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2157  0020 721b530a      	bres	21258,#5
2158  0024               L3701:
2159                     ; 717 }
2162  0024 84            	pop	a
2163  0025 81            	ret	
2200                     ; 727 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2200                     ; 728 {
2201                     .text:	section	.text,new
2202  0000               _TIM2_OC3PolarityConfig:
2204  0000 88            	push	a
2205       00000000      OFST:	set	0
2208                     ; 730   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2210  0001 4d            	tnz	a
2211  0002 2712          	jreq	L003
2212  0004 a122          	cp	a,#34
2213  0006 270e          	jreq	L003
2214  0008 ae02da        	ldw	x,#730
2215  000b 89            	pushw	x
2216  000c 5f            	clrw	x
2217  000d 89            	pushw	x
2218  000e ae0000        	ldw	x,#L513
2219  0011 cd0000        	call	_assert_failed
2221  0014 5b04          	addw	sp,#4
2222  0016               L003:
2223                     ; 733   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2225  0016 7b01          	ld	a,(OFST+1,sp)
2226  0018 2706          	jreq	L3111
2227                     ; 735     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2229  001a 7212530b      	bset	21259,#1
2231  001e 2004          	jra	L5111
2232  0020               L3111:
2233                     ; 739     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2235  0020 7213530b      	bres	21259,#1
2236  0024               L5111:
2237                     ; 741 }
2240  0024 84            	pop	a
2241  0025 81            	ret	
2287                     ; 754 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2287                     ; 755 {
2288                     .text:	section	.text,new
2289  0000               _TIM2_CCxCmd:
2291  0000 89            	pushw	x
2292       00000000      OFST:	set	0
2295                     ; 757   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2297  0001 9e            	ld	a,xh
2298  0002 4d            	tnz	a
2299  0003 270e          	jreq	L213
2300  0005 9e            	ld	a,xh
2301  0006 4a            	dec	a
2302  0007 270a          	jreq	L213
2303  0009 9e            	ld	a,xh
2304  000a a102          	cp	a,#2
2305  000c 2705          	jreq	L213
2306  000e ae02f5        	ldw	x,#757
2307  0011 ad43          	call	LC004
2308  0013               L213:
2309                     ; 758   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2311  0013 7b02          	ld	a,(OFST+2,sp)
2312  0015 2708          	jreq	L223
2313  0017 4a            	dec	a
2314  0018 2705          	jreq	L223
2315  001a ae02f6        	ldw	x,#758
2316  001d ad37          	call	LC004
2317  001f               L223:
2318                     ; 760   if (TIM2_Channel == TIM2_CHANNEL_1)
2320  001f 7b01          	ld	a,(OFST+1,sp)
2321  0021 2610          	jrne	L1411
2322                     ; 763     if (NewState != DISABLE)
2324  0023 7b02          	ld	a,(OFST+2,sp)
2325  0025 2706          	jreq	L3411
2326                     ; 765       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2328  0027 7210530a      	bset	21258,#0
2330  002b 2027          	jra	L7411
2331  002d               L3411:
2332                     ; 769       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2334  002d 7211530a      	bres	21258,#0
2335  0031 2021          	jra	L7411
2336  0033               L1411:
2337                     ; 773   else if (TIM2_Channel == TIM2_CHANNEL_2)
2339  0033 4a            	dec	a
2340  0034 2610          	jrne	L1511
2341                     ; 776     if (NewState != DISABLE)
2343  0036 7b02          	ld	a,(OFST+2,sp)
2344  0038 2706          	jreq	L3511
2345                     ; 778       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2347  003a 7218530a      	bset	21258,#4
2349  003e 2014          	jra	L7411
2350  0040               L3511:
2351                     ; 782       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2353  0040 7219530a      	bres	21258,#4
2354  0044 200e          	jra	L7411
2355  0046               L1511:
2356                     ; 788     if (NewState != DISABLE)
2358  0046 7b02          	ld	a,(OFST+2,sp)
2359  0048 2706          	jreq	L1611
2360                     ; 790       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2362  004a 7210530b      	bset	21259,#0
2364  004e 2004          	jra	L7411
2365  0050               L1611:
2366                     ; 794       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2368  0050 7211530b      	bres	21259,#0
2369  0054               L7411:
2370                     ; 797 }
2373  0054 85            	popw	x
2374  0055 81            	ret	
2375  0056               LC004:
2376  0056 89            	pushw	x
2377  0057 5f            	clrw	x
2378  0058 89            	pushw	x
2379  0059 ae0000        	ldw	x,#L513
2380  005c cd0000        	call	_assert_failed
2382  005f 5b04          	addw	sp,#4
2383  0061 81            	ret	
2429                     ; 819 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2429                     ; 820 {
2430                     .text:	section	.text,new
2431  0000               _TIM2_SelectOCxM:
2433  0000 89            	pushw	x
2434       00000000      OFST:	set	0
2437                     ; 822   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2439  0001 9e            	ld	a,xh
2440  0002 4d            	tnz	a
2441  0003 270e          	jreq	L433
2442  0005 9e            	ld	a,xh
2443  0006 4a            	dec	a
2444  0007 270a          	jreq	L433
2445  0009 9e            	ld	a,xh
2446  000a a102          	cp	a,#2
2447  000c 2705          	jreq	L433
2448  000e ae0336        	ldw	x,#822
2449  0011 ad5c          	call	LC005
2450  0013               L433:
2451                     ; 823   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2453  0013 7b02          	ld	a,(OFST+2,sp)
2454  0015 2721          	jreq	L443
2455  0017 a110          	cp	a,#16
2456  0019 271d          	jreq	L443
2457  001b a120          	cp	a,#32
2458  001d 2719          	jreq	L443
2459  001f a130          	cp	a,#48
2460  0021 2715          	jreq	L443
2461  0023 a160          	cp	a,#96
2462  0025 2711          	jreq	L443
2463  0027 a170          	cp	a,#112
2464  0029 270d          	jreq	L443
2465  002b a150          	cp	a,#80
2466  002d 2709          	jreq	L443
2467  002f a140          	cp	a,#64
2468  0031 2705          	jreq	L443
2469  0033 ae0337        	ldw	x,#823
2470  0036 ad37          	call	LC005
2471  0038               L443:
2472                     ; 825   if (TIM2_Channel == TIM2_CHANNEL_1)
2474  0038 7b01          	ld	a,(OFST+1,sp)
2475  003a 2610          	jrne	L7021
2476                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2478  003c 7211530a      	bres	21258,#0
2479                     ; 831     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2479                     ; 832                             | (uint8_t)TIM2_OCMode);
2481  0040 c65307        	ld	a,21255
2482  0043 a48f          	and	a,#143
2483  0045 1a02          	or	a,(OFST+2,sp)
2484  0047 c75307        	ld	21255,a
2486  004a 2021          	jra	L1121
2487  004c               L7021:
2488                     ; 834   else if (TIM2_Channel == TIM2_CHANNEL_2)
2490  004c 4a            	dec	a
2491  004d 2610          	jrne	L3121
2492                     ; 837     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2494  004f 7219530a      	bres	21258,#4
2495                     ; 840     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2495                     ; 841                             | (uint8_t)TIM2_OCMode);
2497  0053 c65308        	ld	a,21256
2498  0056 a48f          	and	a,#143
2499  0058 1a02          	or	a,(OFST+2,sp)
2500  005a c75308        	ld	21256,a
2502  005d 200e          	jra	L1121
2503  005f               L3121:
2504                     ; 846     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2506  005f 7211530b      	bres	21259,#0
2507                     ; 849     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2507                     ; 850                             | (uint8_t)TIM2_OCMode);
2509  0063 c65309        	ld	a,21257
2510  0066 a48f          	and	a,#143
2511  0068 1a02          	or	a,(OFST+2,sp)
2512  006a c75309        	ld	21257,a
2513  006d               L1121:
2514                     ; 852 }
2517  006d 85            	popw	x
2518  006e 81            	ret	
2519  006f               LC005:
2520  006f 89            	pushw	x
2521  0070 5f            	clrw	x
2522  0071 89            	pushw	x
2523  0072 ae0000        	ldw	x,#L513
2524  0075 cd0000        	call	_assert_failed
2526  0078 5b04          	addw	sp,#4
2527  007a 81            	ret	
2561                     ; 860 void TIM2_SetCounter(uint16_t Counter)
2561                     ; 861 {
2562                     .text:	section	.text,new
2563  0000               _TIM2_SetCounter:
2567                     ; 863   TIM2->CNTRH = (uint8_t)(Counter >> 8);
2569  0000 9e            	ld	a,xh
2570  0001 c7530c        	ld	21260,a
2571                     ; 864   TIM2->CNTRL = (uint8_t)(Counter);
2573  0004 9f            	ld	a,xl
2574  0005 c7530d        	ld	21261,a
2575                     ; 865 }
2578  0008 81            	ret	
2612                     ; 873 void TIM2_SetAutoreload(uint16_t Autoreload)
2612                     ; 874 {
2613                     .text:	section	.text,new
2614  0000               _TIM2_SetAutoreload:
2618                     ; 876   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2620  0000 9e            	ld	a,xh
2621  0001 c7530f        	ld	21263,a
2622                     ; 877   TIM2->ARRL = (uint8_t)(Autoreload);
2624  0004 9f            	ld	a,xl
2625  0005 c75310        	ld	21264,a
2626                     ; 878 }
2629  0008 81            	ret	
2663                     ; 886 void TIM2_SetCompare1(uint16_t Compare1)
2663                     ; 887 {
2664                     .text:	section	.text,new
2665  0000               _TIM2_SetCompare1:
2669                     ; 891 }
2672  0000 81            	ret	
2706                     ; 899 void TIM2_SetCompare2(uint16_t Compare2)
2706                     ; 900 {
2707                     .text:	section	.text,new
2708  0000               _TIM2_SetCompare2:
2712                     ; 904 }
2715  0000 81            	ret	
2749                     ; 912 void TIM2_SetCompare3(uint16_t Compare3)
2749                     ; 913 {
2750                     .text:	section	.text,new
2751  0000               _TIM2_SetCompare3:
2755                     ; 917 }
2758  0000 81            	ret	
2795                     ; 929 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2795                     ; 930 {
2796                     .text:	section	.text,new
2797  0000               _TIM2_SetIC1Prescaler:
2799  0000 88            	push	a
2800       00000000      OFST:	set	0
2803                     ; 932   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2805  0001 4d            	tnz	a
2806  0002 271a          	jreq	L073
2807  0004 a104          	cp	a,#4
2808  0006 2716          	jreq	L073
2809  0008 a108          	cp	a,#8
2810  000a 2712          	jreq	L073
2811  000c a10c          	cp	a,#12
2812  000e 270e          	jreq	L073
2813  0010 ae03a4        	ldw	x,#932
2814  0013 89            	pushw	x
2815  0014 5f            	clrw	x
2816  0015 89            	pushw	x
2817  0016 ae0000        	ldw	x,#L513
2818  0019 cd0000        	call	_assert_failed
2820  001c 5b04          	addw	sp,#4
2821  001e               L073:
2822                     ; 935   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2822                     ; 936                           | (uint8_t)TIM2_IC1Prescaler);
2824  001e c65307        	ld	a,21255
2825  0021 a4f3          	and	a,#243
2826  0023 1a01          	or	a,(OFST+1,sp)
2827  0025 c75307        	ld	21255,a
2828                     ; 937 }
2831  0028 84            	pop	a
2832  0029 81            	ret	
2868                     ; 949 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
2868                     ; 950 {
2869                     .text:	section	.text,new
2870  0000               _TIM2_SetIC2Prescaler:
2874                     ; 957 }
2877  0000 81            	ret	
2913                     ; 969 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
2913                     ; 970 {
2914                     .text:	section	.text,new
2915  0000               _TIM2_SetIC3Prescaler:
2919                     ; 977 }
2922  0000 81            	ret	
2974                     ; 984 uint16_t TIM2_GetCapture1(void)
2974                     ; 985 {
2975                     .text:	section	.text,new
2976  0000               _TIM2_GetCapture1:
2978  0000 5204          	subw	sp,#4
2979       00000004      OFST:	set	4
2982                     ; 987   uint16_t tmpccr1 = 0;
2984                     ; 988   uint8_t tmpccr1l=0, tmpccr1h=0;
2988                     ; 990   tmpccr1h = TIM2->CCR1H;
2990  0002 c65311        	ld	a,21265
2991  0005 6b02          	ld	(OFST-2,sp),a
2993                     ; 991   tmpccr1l = TIM2->CCR1L;
2995  0007 c65312        	ld	a,21266
2996  000a 6b01          	ld	(OFST-3,sp),a
2998                     ; 993   tmpccr1 = (uint16_t)(tmpccr1l);
3000  000c 5f            	clrw	x
3001  000d 97            	ld	xl,a
3002  000e 1f03          	ldw	(OFST-1,sp),x
3004                     ; 994   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3006  0010 5f            	clrw	x
3007  0011 7b02          	ld	a,(OFST-2,sp)
3008  0013 97            	ld	xl,a
3009  0014 7b04          	ld	a,(OFST+0,sp)
3010  0016 01            	rrwa	x,a
3011  0017 1a03          	or	a,(OFST-1,sp)
3012  0019 01            	rrwa	x,a
3014                     ; 996   return (uint16_t)tmpccr1;
3018  001a 5b04          	addw	sp,#4
3019  001c 81            	ret	
3042                     ; 1004 uint16_t TIM2_GetCapture2(void)
3042                     ; 1005 {
3043                     .text:	section	.text,new
3044  0000               _TIM2_GetCapture2:
3048                     ; 1018 }
3051  0000 81            	ret	
3074                     ; 1025 uint16_t TIM2_GetCapture3(void)
3074                     ; 1026 {
3075                     .text:	section	.text,new
3076  0000               _TIM2_GetCapture3:
3080                     ; 1039 }
3083  0000 81            	ret	
3117                     ; 1046 uint16_t TIM2_GetCounter(void)
3117                     ; 1047 {
3118                     .text:	section	.text,new
3119  0000               _TIM2_GetCounter:
3121  0000 89            	pushw	x
3122       00000002      OFST:	set	2
3125                     ; 1048   uint16_t tmpcntr = 0;
3127                     ; 1050   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3129  0001 c6530c        	ld	a,21260
3130  0004 97            	ld	xl,a
3131  0005 4f            	clr	a
3132  0006 02            	rlwa	x,a
3133  0007 1f01          	ldw	(OFST-1,sp),x
3135                     ; 1052   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3137  0009 c6530d        	ld	a,21261
3138  000c 5f            	clrw	x
3139  000d 97            	ld	xl,a
3140  000e 01            	rrwa	x,a
3141  000f 1a02          	or	a,(OFST+0,sp)
3142  0011 01            	rrwa	x,a
3143  0012 1a01          	or	a,(OFST-1,sp)
3144  0014 01            	rrwa	x,a
3147  0015 5b02          	addw	sp,#2
3148  0017 81            	ret	
3172                     ; 1060 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3172                     ; 1061 {
3173                     .text:	section	.text,new
3174  0000               _TIM2_GetPrescaler:
3178                     ; 1063   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3180  0000 c6530e        	ld	a,21262
3183  0003 81            	ret	
3323                     ; 1079 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3323                     ; 1080 {
3324                     .text:	section	.text,new
3325  0000               _TIM2_GetFlagStatus:
3327  0000 89            	pushw	x
3328  0001 89            	pushw	x
3329       00000002      OFST:	set	2
3332                     ; 1081   FlagStatus bitstatus = RESET;
3334                     ; 1082   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3338                     ; 1085   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3340  0002 a30001        	cpw	x,#1
3341  0005 272c          	jreq	L024
3342  0007 a30002        	cpw	x,#2
3343  000a 2727          	jreq	L024
3344  000c a30004        	cpw	x,#4
3345  000f 2722          	jreq	L024
3346  0011 a30008        	cpw	x,#8
3347  0014 271d          	jreq	L024
3348  0016 a30200        	cpw	x,#512
3349  0019 2718          	jreq	L024
3350  001b a30400        	cpw	x,#1024
3351  001e 2713          	jreq	L024
3352  0020 a30800        	cpw	x,#2048
3353  0023 270e          	jreq	L024
3354  0025 ae043d        	ldw	x,#1085
3355  0028 89            	pushw	x
3356  0029 5f            	clrw	x
3357  002a 89            	pushw	x
3358  002b ae0000        	ldw	x,#L513
3359  002e cd0000        	call	_assert_failed
3361  0031 5b04          	addw	sp,#4
3362  0033               L024:
3363                     ; 1087   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3365  0033 c65304        	ld	a,21252
3366  0036 1404          	and	a,(OFST+2,sp)
3367  0038 6b01          	ld	(OFST-1,sp),a
3369                     ; 1088   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3371  003a 7b03          	ld	a,(OFST+1,sp)
3372  003c 6b02          	ld	(OFST+0,sp),a
3374                     ; 1090   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3376  003e c45305        	and	a,21253
3377  0041 1a01          	or	a,(OFST-1,sp)
3378  0043 2702          	jreq	L7551
3379                     ; 1092     bitstatus = SET;
3381  0045 a601          	ld	a,#1
3384  0047               L7551:
3385                     ; 1096     bitstatus = RESET;
3388                     ; 1098   return (FlagStatus)bitstatus;
3392  0047 5b04          	addw	sp,#4
3393  0049 81            	ret	
3429                     ; 1114 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3429                     ; 1115 {
3430                     .text:	section	.text,new
3431  0000               _TIM2_ClearFlag:
3433  0000 89            	pushw	x
3434       00000000      OFST:	set	0
3437                     ; 1117   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3439  0001 01            	rrwa	x,a
3440  0002 a4f0          	and	a,#240
3441  0004 01            	rrwa	x,a
3442  0005 a4f1          	and	a,#241
3443  0007 01            	rrwa	x,a
3444  0008 5d            	tnzw	x
3445  0009 2604          	jrne	L624
3446  000b 1e01          	ldw	x,(OFST+1,sp)
3447  000d 260e          	jrne	L034
3448  000f               L624:
3449  000f ae045d        	ldw	x,#1117
3450  0012 89            	pushw	x
3451  0013 5f            	clrw	x
3452  0014 89            	pushw	x
3453  0015 ae0000        	ldw	x,#L513
3454  0018 cd0000        	call	_assert_failed
3456  001b 5b04          	addw	sp,#4
3457  001d               L034:
3458                     ; 1120   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3460  001d 7b02          	ld	a,(OFST+2,sp)
3461  001f 43            	cpl	a
3462  0020 c75304        	ld	21252,a
3463                     ; 1121   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3465  0023 35ff5305      	mov	21253,#255
3466                     ; 1122 }
3469  0027 85            	popw	x
3470  0028 81            	ret	
3535                     ; 1134 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3535                     ; 1135 {
3536                     .text:	section	.text,new
3537  0000               _TIM2_GetITStatus:
3539  0000 88            	push	a
3540  0001 89            	pushw	x
3541       00000002      OFST:	set	2
3544                     ; 1136   ITStatus bitstatus = RESET;
3546                     ; 1137   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3550                     ; 1140   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3552  0002 a101          	cp	a,#1
3553  0004 271a          	jreq	L244
3554  0006 a102          	cp	a,#2
3555  0008 2716          	jreq	L244
3556  000a a104          	cp	a,#4
3557  000c 2712          	jreq	L244
3558  000e a108          	cp	a,#8
3559  0010 270e          	jreq	L244
3560  0012 ae0474        	ldw	x,#1140
3561  0015 89            	pushw	x
3562  0016 5f            	clrw	x
3563  0017 89            	pushw	x
3564  0018 ae0000        	ldw	x,#L513
3565  001b cd0000        	call	_assert_failed
3567  001e 5b04          	addw	sp,#4
3568  0020               L244:
3569                     ; 1142   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3571  0020 c65304        	ld	a,21252
3572  0023 1403          	and	a,(OFST+1,sp)
3573  0025 6b01          	ld	(OFST-1,sp),a
3575                     ; 1144   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3577  0027 c65303        	ld	a,21251
3578  002a 1403          	and	a,(OFST+1,sp)
3579  002c 6b02          	ld	(OFST+0,sp),a
3581                     ; 1146   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3583  002e 7b01          	ld	a,(OFST-1,sp)
3584  0030 2708          	jreq	L3361
3586  0032 7b02          	ld	a,(OFST+0,sp)
3587  0034 2704          	jreq	L3361
3588                     ; 1148     bitstatus = SET;
3590  0036 a601          	ld	a,#1
3593  0038 2001          	jra	L5361
3594  003a               L3361:
3595                     ; 1152     bitstatus = RESET;
3597  003a 4f            	clr	a
3599  003b               L5361:
3600                     ; 1154   return (ITStatus)(bitstatus);
3604  003b 5b03          	addw	sp,#3
3605  003d 81            	ret	
3642                     ; 1167 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3642                     ; 1168 {
3643                     .text:	section	.text,new
3644  0000               _TIM2_ClearITPendingBit:
3646  0000 88            	push	a
3647       00000000      OFST:	set	0
3650                     ; 1170   assert_param(IS_TIM2_IT_OK(TIM2_IT));
3652  0001 4d            	tnz	a
3653  0002 2704          	jreq	L054
3654  0004 a110          	cp	a,#16
3655  0006 250e          	jrult	L254
3656  0008               L054:
3657  0008 ae0492        	ldw	x,#1170
3658  000b 89            	pushw	x
3659  000c 5f            	clrw	x
3660  000d 89            	pushw	x
3661  000e ae0000        	ldw	x,#L513
3662  0011 cd0000        	call	_assert_failed
3664  0014 5b04          	addw	sp,#4
3665  0016               L254:
3666                     ; 1173   TIM2->SR1 = (uint8_t)(~TIM2_IT);
3668  0016 7b01          	ld	a,(OFST+1,sp)
3669  0018 43            	cpl	a
3670  0019 c75304        	ld	21252,a
3671                     ; 1174 }
3674  001c 84            	pop	a
3675  001d 81            	ret	
3727                     ; 1192 static void TI1_Config(uint8_t TIM2_ICPolarity,
3727                     ; 1193                        uint8_t TIM2_ICSelection,
3727                     ; 1194                        uint8_t TIM2_ICFilter)
3727                     ; 1195 {
3728                     .text:	section	.text,new
3729  0000               L3_TI1_Config:
3731  0000 89            	pushw	x
3732  0001 88            	push	a
3733       00000001      OFST:	set	1
3736                     ; 1197   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3738  0002 7211530a      	bres	21258,#0
3739                     ; 1200   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3739                     ; 1201                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3741  0006 7b06          	ld	a,(OFST+5,sp)
3742  0008 97            	ld	xl,a
3743  0009 a610          	ld	a,#16
3744  000b 42            	mul	x,a
3745  000c 9f            	ld	a,xl
3746  000d 1a03          	or	a,(OFST+2,sp)
3747  000f 6b01          	ld	(OFST+0,sp),a
3749  0011 c65307        	ld	a,21255
3750  0014 a40c          	and	a,#12
3751  0016 1a01          	or	a,(OFST+0,sp)
3752  0018 c75307        	ld	21255,a
3753                     ; 1204   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3755  001b 7b02          	ld	a,(OFST+1,sp)
3756  001d 2706          	jreq	L3071
3757                     ; 1206     TIM2->CCER1 |= TIM2_CCER1_CC1P;
3759  001f 7212530a      	bset	21258,#1
3761  0023 2004          	jra	L5071
3762  0025               L3071:
3763                     ; 1210     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3765  0025 7213530a      	bres	21258,#1
3766  0029               L5071:
3767                     ; 1213   TIM2->CCER1 |= TIM2_CCER1_CC1E;
3769  0029 7210530a      	bset	21258,#0
3770                     ; 1214 }
3773  002d 5b03          	addw	sp,#3
3774  002f 81            	ret	
3808                     ; 1232 static void TI2_Config(uint8_t TIM2_ICPolarity,
3808                     ; 1233                        uint8_t TIM2_ICSelection,
3808                     ; 1234                        uint8_t TIM2_ICFilter)
3808                     ; 1235 {
3809                     .text:	section	.text,new
3810  0000               L5_TI2_Config:
3814                     ; 1256 }
3817  0000 81            	ret	
3851                     ; 1272 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
3851                     ; 1273                        uint8_t TIM2_ICFilter)
3851                     ; 1274 {
3852                     .text:	section	.text,new
3853  0000               L7_TI3_Config:
3857                     ; 1294 }
3860  0000 81            	ret	
3873                     	xdef	_TIM2_ClearITPendingBit
3874                     	xdef	_TIM2_GetITStatus
3875                     	xdef	_TIM2_ClearFlag
3876                     	xdef	_TIM2_GetFlagStatus
3877                     	xdef	_TIM2_GetPrescaler
3878                     	xdef	_TIM2_GetCounter
3879                     	xdef	_TIM2_GetCapture3
3880                     	xdef	_TIM2_GetCapture2
3881                     	xdef	_TIM2_GetCapture1
3882                     	xdef	_TIM2_SetIC3Prescaler
3883                     	xdef	_TIM2_SetIC2Prescaler
3884                     	xdef	_TIM2_SetIC1Prescaler
3885                     	xdef	_TIM2_SetCompare3
3886                     	xdef	_TIM2_SetCompare2
3887                     	xdef	_TIM2_SetCompare1
3888                     	xdef	_TIM2_SetAutoreload
3889                     	xdef	_TIM2_SetCounter
3890                     	xdef	_TIM2_SelectOCxM
3891                     	xdef	_TIM2_CCxCmd
3892                     	xdef	_TIM2_OC3PolarityConfig
3893                     	xdef	_TIM2_OC2PolarityConfig
3894                     	xdef	_TIM2_OC1PolarityConfig
3895                     	xdef	_TIM2_GenerateEvent
3896                     	xdef	_TIM2_OC3PreloadConfig
3897                     	xdef	_TIM2_OC2PreloadConfig
3898                     	xdef	_TIM2_OC1PreloadConfig
3899                     	xdef	_TIM2_ARRPreloadConfig
3900                     	xdef	_TIM2_ForcedOC3Config
3901                     	xdef	_TIM2_ForcedOC2Config
3902                     	xdef	_TIM2_ForcedOC1Config
3903                     	xdef	_TIM2_PrescalerConfig
3904                     	xdef	_TIM2_SelectOnePulseMode
3905                     	xdef	_TIM2_UpdateRequestConfig
3906                     	xdef	_TIM2_UpdateDisableConfig
3907                     	xdef	_TIM2_ITConfig
3908                     	xdef	_TIM2_Cmd
3909                     	xdef	_TIM2_PWMIConfig
3910                     	xdef	_TIM2_ICInit
3911                     	xdef	_TIM2_OC3Init
3912                     	xdef	_TIM2_OC2Init
3913                     	xdef	_TIM2_OC1Init
3914                     	xdef	_TIM2_TimeBaseInit
3915                     	xdef	_TIM2_DeInit
3916                     	xref	_assert_failed
3917                     .const:	section	.text
3918  0000               L513:
3919  0000 73746d38735f  	dc.b	"stm8s_tim2_sub.c",0
3939                     	end
