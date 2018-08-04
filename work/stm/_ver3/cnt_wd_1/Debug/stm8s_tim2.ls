   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  51                     ; 46 void TIM2_DeInit(void)
  51                     ; 47 {
  53                     .text:	section	.text,new
  54  0000               _TIM2_DeInit:
  58                     ; 49     TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  60  0000 725f5300      	clr	21248
  61                     ; 50     TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  63  0004 725f5301      	clr	21249
  64                     ; 51     TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  66  0008 725f5303      	clr	21251
  67                     ; 54     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  69  000c 725f5308      	clr	21256
  70                     ; 55     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  72  0010 725f5309      	clr	21257
  73                     ; 59     TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  75  0014 725f5308      	clr	21256
  76                     ; 60     TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  78  0018 725f5309      	clr	21257
  79                     ; 61     TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  81  001c 725f5305      	clr	21253
  82                     ; 62     TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  84  0020 725f5306      	clr	21254
  85                     ; 63     TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  87  0024 725f5307      	clr	21255
  88                     ; 64     TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  90  0028 725f530a      	clr	21258
  91                     ; 65     TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  93  002c 725f530b      	clr	21259
  94                     ; 66     TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  96  0030 725f530c      	clr	21260
  97                     ; 67     TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  99  0034 35ff530d      	mov	21261,#255
 100                     ; 68     TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
 102  0038 35ff530e      	mov	21262,#255
 103                     ; 69     TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
 105  003c 725f530f      	clr	21263
 106                     ; 70     TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 108  0040 725f5310      	clr	21264
 109                     ; 71     TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 111  0044 725f5311      	clr	21265
 112                     ; 72     TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 114  0048 725f5312      	clr	21266
 115                     ; 73     TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 117  004c 725f5313      	clr	21267
 118                     ; 74     TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 120  0050 725f5314      	clr	21268
 121                     ; 75     TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 123  0054 725f5302      	clr	21250
 124                     ; 76 }
 127  0058 81            	ret	
 293                     ; 85 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 293                     ; 86                         uint16_t TIM2_Period)
 293                     ; 87 {
 294                     .text:	section	.text,new
 295  0000               _TIM2_TimeBaseInit:
 297  0000 88            	push	a
 298       00000000      OFST:	set	0
 301                     ; 89     TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 303  0001 c7530c        	ld	21260,a
 304                     ; 91     TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 306  0004 7b04          	ld	a,(OFST+4,sp)
 307  0006 c7530d        	ld	21261,a
 308                     ; 92     TIM2->ARRL = (uint8_t)(TIM2_Period);
 310  0009 7b05          	ld	a,(OFST+5,sp)
 311  000b c7530e        	ld	21262,a
 312                     ; 93 }
 315  000e 84            	pop	a
 316  000f 81            	ret	
 471                     ; 104 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 471                     ; 105                   TIM2_OutputState_TypeDef TIM2_OutputState,
 471                     ; 106                   uint16_t TIM2_Pulse,
 471                     ; 107                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 471                     ; 108 {
 472                     .text:	section	.text,new
 473  0000               _TIM2_OC1Init:
 475  0000 89            	pushw	x
 476  0001 88            	push	a
 477       00000001      OFST:	set	1
 480                     ; 110     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 482                     ; 111     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 484                     ; 112     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 486                     ; 115     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 488  0002 c65308        	ld	a,21256
 489  0005 a4fc          	and	a,#252
 490  0007 c75308        	ld	21256,a
 491                     ; 117     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 491                     ; 118                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 493  000a 7b08          	ld	a,(OFST+7,sp)
 494  000c a402          	and	a,#2
 495  000e 6b01          	ld	(OFST+0,sp),a
 496  0010 9f            	ld	a,xl
 497  0011 a401          	and	a,#1
 498  0013 1a01          	or	a,(OFST+0,sp)
 499  0015 ca5308        	or	a,21256
 500  0018 c75308        	ld	21256,a
 501                     ; 121     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 501                     ; 122                             (uint8_t)TIM2_OCMode);
 503  001b c65305        	ld	a,21253
 504  001e a48f          	and	a,#143
 505  0020 1a02          	or	a,(OFST+1,sp)
 506  0022 c75305        	ld	21253,a
 507                     ; 125     TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 509  0025 7b06          	ld	a,(OFST+5,sp)
 510  0027 c7530f        	ld	21263,a
 511                     ; 126     TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 513  002a 7b07          	ld	a,(OFST+6,sp)
 514  002c c75310        	ld	21264,a
 515                     ; 127 }
 518  002f 5b03          	addw	sp,#3
 519  0031 81            	ret	
 581                     ; 138 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 581                     ; 139                   TIM2_OutputState_TypeDef TIM2_OutputState,
 581                     ; 140                   uint16_t TIM2_Pulse,
 581                     ; 141                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 581                     ; 142 {
 582                     .text:	section	.text,new
 583  0000               _TIM2_OC2Init:
 585  0000 89            	pushw	x
 586  0001 88            	push	a
 587       00000001      OFST:	set	1
 590                     ; 144     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 592                     ; 145     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 594                     ; 146     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 596                     ; 150     TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 598  0002 c65308        	ld	a,21256
 599  0005 a4cf          	and	a,#207
 600  0007 c75308        	ld	21256,a
 601                     ; 152     TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 601                     ; 153                         (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 603  000a 7b08          	ld	a,(OFST+7,sp)
 604  000c a420          	and	a,#32
 605  000e 6b01          	ld	(OFST+0,sp),a
 606  0010 9f            	ld	a,xl
 607  0011 a410          	and	a,#16
 608  0013 1a01          	or	a,(OFST+0,sp)
 609  0015 ca5308        	or	a,21256
 610  0018 c75308        	ld	21256,a
 611                     ; 157     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 611                     ; 158                             (uint8_t)TIM2_OCMode);
 613  001b c65306        	ld	a,21254
 614  001e a48f          	and	a,#143
 615  0020 1a02          	or	a,(OFST+1,sp)
 616  0022 c75306        	ld	21254,a
 617                     ; 162     TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 619  0025 7b06          	ld	a,(OFST+5,sp)
 620  0027 c75311        	ld	21265,a
 621                     ; 163     TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 623  002a 7b07          	ld	a,(OFST+6,sp)
 624  002c c75312        	ld	21266,a
 625                     ; 164 }
 628  002f 5b03          	addw	sp,#3
 629  0031 81            	ret	
 691                     ; 175 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 691                     ; 176                   TIM2_OutputState_TypeDef TIM2_OutputState,
 691                     ; 177                   uint16_t TIM2_Pulse,
 691                     ; 178                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 691                     ; 179 {
 692                     .text:	section	.text,new
 693  0000               _TIM2_OC3Init:
 695  0000 89            	pushw	x
 696  0001 88            	push	a
 697       00000001      OFST:	set	1
 700                     ; 181     assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 702                     ; 182     assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 704                     ; 183     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 706                     ; 185     TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 708  0002 c65309        	ld	a,21257
 709  0005 a4fc          	and	a,#252
 710  0007 c75309        	ld	21257,a
 711                     ; 187     TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 711                     ; 188                              (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 713  000a 7b08          	ld	a,(OFST+7,sp)
 714  000c a402          	and	a,#2
 715  000e 6b01          	ld	(OFST+0,sp),a
 716  0010 9f            	ld	a,xl
 717  0011 a401          	and	a,#1
 718  0013 1a01          	or	a,(OFST+0,sp)
 719  0015 ca5309        	or	a,21257
 720  0018 c75309        	ld	21257,a
 721                     ; 191     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 721                     ; 192                             (uint8_t)TIM2_OCMode);
 723  001b c65307        	ld	a,21255
 724  001e a48f          	and	a,#143
 725  0020 1a02          	or	a,(OFST+1,sp)
 726  0022 c75307        	ld	21255,a
 727                     ; 195     TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 729  0025 7b06          	ld	a,(OFST+5,sp)
 730  0027 c75313        	ld	21267,a
 731                     ; 196     TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 733  002a 7b07          	ld	a,(OFST+6,sp)
 734  002c c75314        	ld	21268,a
 735                     ; 198 }
 738  002f 5b03          	addw	sp,#3
 739  0031 81            	ret	
 930                     ; 210 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
 930                     ; 211                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
 930                     ; 212                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
 930                     ; 213                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
 930                     ; 214                  uint8_t TIM2_ICFilter)
 930                     ; 215 {
 931                     .text:	section	.text,new
 932  0000               _TIM2_ICInit:
 934  0000 89            	pushw	x
 935       00000000      OFST:	set	0
 938                     ; 217     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
 940                     ; 218     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
 942                     ; 219     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
 944                     ; 220     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
 946                     ; 221     assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
 948                     ; 223     if (TIM2_Channel == TIM2_CHANNEL_1)
 950  0001 9e            	ld	a,xh
 951  0002 4d            	tnz	a
 952  0003 2614          	jrne	L763
 953                     ; 226         TI1_Config((uint8_t)TIM2_ICPolarity,
 953                     ; 227                    (uint8_t)TIM2_ICSelection,
 953                     ; 228                    (uint8_t)TIM2_ICFilter);
 955  0005 7b07          	ld	a,(OFST+7,sp)
 956  0007 88            	push	a
 957  0008 7b06          	ld	a,(OFST+6,sp)
 958  000a 97            	ld	xl,a
 959  000b 7b03          	ld	a,(OFST+3,sp)
 960  000d 95            	ld	xh,a
 961  000e cd0000        	call	L3_TI1_Config
 963  0011 84            	pop	a
 964                     ; 231         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
 966  0012 7b06          	ld	a,(OFST+6,sp)
 967  0014 cd0000        	call	_TIM2_SetIC1Prescaler
 970  0017 202b          	jra	L173
 971  0019               L763:
 972                     ; 233     else if (TIM2_Channel == TIM2_CHANNEL_2)
 974  0019 7b01          	ld	a,(OFST+1,sp)
 975  001b 4a            	dec	a
 976  001c 2614          	jrne	L373
 977                     ; 236         TI2_Config((uint8_t)TIM2_ICPolarity,
 977                     ; 237                    (uint8_t)TIM2_ICSelection,
 977                     ; 238                    (uint8_t)TIM2_ICFilter);
 979  001e 7b07          	ld	a,(OFST+7,sp)
 980  0020 88            	push	a
 981  0021 7b06          	ld	a,(OFST+6,sp)
 982  0023 97            	ld	xl,a
 983  0024 7b03          	ld	a,(OFST+3,sp)
 984  0026 95            	ld	xh,a
 985  0027 cd0000        	call	L5_TI2_Config
 987  002a 84            	pop	a
 988                     ; 241         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
 990  002b 7b06          	ld	a,(OFST+6,sp)
 991  002d cd0000        	call	_TIM2_SetIC2Prescaler
 994  0030 2012          	jra	L173
 995  0032               L373:
 996                     ; 246         TI3_Config((uint8_t)TIM2_ICPolarity,
 996                     ; 247                    (uint8_t)TIM2_ICSelection,
 996                     ; 248                    (uint8_t)TIM2_ICFilter);
 998  0032 7b07          	ld	a,(OFST+7,sp)
 999  0034 88            	push	a
1000  0035 7b06          	ld	a,(OFST+6,sp)
1001  0037 97            	ld	xl,a
1002  0038 7b03          	ld	a,(OFST+3,sp)
1003  003a 95            	ld	xh,a
1004  003b cd0000        	call	L7_TI3_Config
1006  003e 84            	pop	a
1007                     ; 251         TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1009  003f 7b06          	ld	a,(OFST+6,sp)
1010  0041 cd0000        	call	_TIM2_SetIC3Prescaler
1012  0044               L173:
1013                     ; 253 }
1016  0044 85            	popw	x
1017  0045 81            	ret	
1107                     ; 265 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1107                     ; 266                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1107                     ; 267                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1107                     ; 268                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1107                     ; 269                      uint8_t TIM2_ICFilter)
1107                     ; 270 {
1108                     .text:	section	.text,new
1109  0000               _TIM2_PWMIConfig:
1111  0000 89            	pushw	x
1112  0001 89            	pushw	x
1113       00000002      OFST:	set	2
1116                     ; 271     uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1118                     ; 272     uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1120                     ; 275     assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1122                     ; 276     assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1124                     ; 277     assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1126                     ; 278     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1128                     ; 281     if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1130  0002 9f            	ld	a,xl
1131  0003 a144          	cp	a,#68
1132  0005 2706          	jreq	L734
1133                     ; 283         icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1135  0007 a644          	ld	a,#68
1136  0009 6b01          	ld	(OFST-1,sp),a
1138  000b 2002          	jra	L144
1139  000d               L734:
1140                     ; 287         icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1142  000d 0f01          	clr	(OFST-1,sp)
1143  000f               L144:
1144                     ; 291     if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1146  000f 7b07          	ld	a,(OFST+5,sp)
1147  0011 4a            	dec	a
1148  0012 2604          	jrne	L344
1149                     ; 293         icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1151  0014 a602          	ld	a,#2
1153  0016 2002          	jra	L544
1154  0018               L344:
1155                     ; 297         icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1157  0018 a601          	ld	a,#1
1158  001a               L544:
1159  001a 6b02          	ld	(OFST+0,sp),a
1160                     ; 300     if (TIM2_Channel == TIM2_CHANNEL_1)
1162  001c 7b03          	ld	a,(OFST+1,sp)
1163  001e 2626          	jrne	L744
1164                     ; 303         TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1164                     ; 304                    (uint8_t)TIM2_ICFilter);
1166  0020 7b09          	ld	a,(OFST+7,sp)
1167  0022 88            	push	a
1168  0023 7b08          	ld	a,(OFST+6,sp)
1169  0025 97            	ld	xl,a
1170  0026 7b05          	ld	a,(OFST+3,sp)
1171  0028 95            	ld	xh,a
1172  0029 cd0000        	call	L3_TI1_Config
1174  002c 84            	pop	a
1175                     ; 307         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1177  002d 7b08          	ld	a,(OFST+6,sp)
1178  002f cd0000        	call	_TIM2_SetIC1Prescaler
1180                     ; 310         TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1182  0032 7b09          	ld	a,(OFST+7,sp)
1183  0034 88            	push	a
1184  0035 7b03          	ld	a,(OFST+1,sp)
1185  0037 97            	ld	xl,a
1186  0038 7b02          	ld	a,(OFST+0,sp)
1187  003a 95            	ld	xh,a
1188  003b cd0000        	call	L5_TI2_Config
1190  003e 84            	pop	a
1191                     ; 313         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1193  003f 7b08          	ld	a,(OFST+6,sp)
1194  0041 cd0000        	call	_TIM2_SetIC2Prescaler
1197  0044 2024          	jra	L154
1198  0046               L744:
1199                     ; 318         TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1199                     ; 319                    (uint8_t)TIM2_ICFilter);
1201  0046 7b09          	ld	a,(OFST+7,sp)
1202  0048 88            	push	a
1203  0049 7b08          	ld	a,(OFST+6,sp)
1204  004b 97            	ld	xl,a
1205  004c 7b05          	ld	a,(OFST+3,sp)
1206  004e 95            	ld	xh,a
1207  004f cd0000        	call	L5_TI2_Config
1209  0052 84            	pop	a
1210                     ; 322         TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1212  0053 7b08          	ld	a,(OFST+6,sp)
1213  0055 cd0000        	call	_TIM2_SetIC2Prescaler
1215                     ; 325         TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1217  0058 7b09          	ld	a,(OFST+7,sp)
1218  005a 88            	push	a
1219  005b 7b03          	ld	a,(OFST+1,sp)
1220  005d 97            	ld	xl,a
1221  005e 7b02          	ld	a,(OFST+0,sp)
1222  0060 95            	ld	xh,a
1223  0061 cd0000        	call	L3_TI1_Config
1225  0064 84            	pop	a
1226                     ; 328         TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1228  0065 7b08          	ld	a,(OFST+6,sp)
1229  0067 cd0000        	call	_TIM2_SetIC1Prescaler
1231  006a               L154:
1232                     ; 330 }
1235  006a 5b04          	addw	sp,#4
1236  006c 81            	ret	
1291                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1291                     ; 340 {
1292                     .text:	section	.text,new
1293  0000               _TIM2_Cmd:
1297                     ; 342     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1299                     ; 345     if (NewState != DISABLE)
1301  0000 4d            	tnz	a
1302  0001 2705          	jreq	L105
1303                     ; 347         TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1305  0003 72105300      	bset	21248,#0
1308  0007 81            	ret	
1309  0008               L105:
1310                     ; 351         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1312  0008 72115300      	bres	21248,#0
1313                     ; 353 }
1316  000c 81            	ret	
1395                     ; 369 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1395                     ; 370 {
1396                     .text:	section	.text,new
1397  0000               _TIM2_ITConfig:
1399  0000 89            	pushw	x
1400       00000000      OFST:	set	0
1403                     ; 372     assert_param(IS_TIM2_IT_OK(TIM2_IT));
1405                     ; 373     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1407                     ; 375     if (NewState != DISABLE)
1409  0001 9f            	ld	a,xl
1410  0002 4d            	tnz	a
1411  0003 2706          	jreq	L345
1412                     ; 378         TIM2->IER |= (uint8_t)TIM2_IT;
1414  0005 9e            	ld	a,xh
1415  0006 ca5301        	or	a,21249
1417  0009 2006          	jra	L545
1418  000b               L345:
1419                     ; 383         TIM2->IER &= (uint8_t)(~TIM2_IT);
1421  000b 7b01          	ld	a,(OFST+1,sp)
1422  000d 43            	cpl	a
1423  000e c45301        	and	a,21249
1424  0011               L545:
1425  0011 c75301        	ld	21249,a
1426                     ; 385 }
1429  0014 85            	popw	x
1430  0015 81            	ret	
1466                     ; 394 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1466                     ; 395 {
1467                     .text:	section	.text,new
1468  0000               _TIM2_UpdateDisableConfig:
1472                     ; 397     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1474                     ; 400     if (NewState != DISABLE)
1476  0000 4d            	tnz	a
1477  0001 2705          	jreq	L565
1478                     ; 402         TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1480  0003 72125300      	bset	21248,#1
1483  0007 81            	ret	
1484  0008               L565:
1485                     ; 406         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1487  0008 72135300      	bres	21248,#1
1488                     ; 408 }
1491  000c 81            	ret	
1549                     ; 418 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
1549                     ; 419 {
1550                     .text:	section	.text,new
1551  0000               _TIM2_UpdateRequestConfig:
1555                     ; 421     assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
1557                     ; 424     if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
1559  0000 4d            	tnz	a
1560  0001 2705          	jreq	L716
1561                     ; 426         TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
1563  0003 72145300      	bset	21248,#2
1566  0007 81            	ret	
1567  0008               L716:
1568                     ; 430         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
1570  0008 72155300      	bres	21248,#2
1571                     ; 432 }
1574  000c 81            	ret	
1631                     ; 443 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
1631                     ; 444 {
1632                     .text:	section	.text,new
1633  0000               _TIM2_SelectOnePulseMode:
1637                     ; 446     assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
1639                     ; 449     if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
1641  0000 4d            	tnz	a
1642  0001 2705          	jreq	L156
1643                     ; 451         TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
1645  0003 72165300      	bset	21248,#3
1648  0007 81            	ret	
1649  0008               L156:
1650                     ; 455         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
1652  0008 72175300      	bres	21248,#3
1653                     ; 458 }
1656  000c 81            	ret	
1724                     ; 489 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
1724                     ; 490                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
1724                     ; 491 {
1725                     .text:	section	.text,new
1726  0000               _TIM2_PrescalerConfig:
1730                     ; 493     assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
1732                     ; 494     assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
1734                     ; 497     TIM2->PSCR = (uint8_t)Prescaler;
1736  0000 9e            	ld	a,xh
1737  0001 c7530c        	ld	21260,a
1738                     ; 500     TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
1740  0004 9f            	ld	a,xl
1741  0005 c75304        	ld	21252,a
1742                     ; 501 }
1745  0008 81            	ret	
1803                     ; 512 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1803                     ; 513 {
1804                     .text:	section	.text,new
1805  0000               _TIM2_ForcedOC1Config:
1807  0000 88            	push	a
1808       00000000      OFST:	set	0
1811                     ; 515     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1813                     ; 518     TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
1813                     ; 519                               | (uint8_t)TIM2_ForcedAction);
1815  0001 c65305        	ld	a,21253
1816  0004 a48f          	and	a,#143
1817  0006 1a01          	or	a,(OFST+1,sp)
1818  0008 c75305        	ld	21253,a
1819                     ; 520 }
1822  000b 84            	pop	a
1823  000c 81            	ret	
1859                     ; 531 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1859                     ; 532 {
1860                     .text:	section	.text,new
1861  0000               _TIM2_ForcedOC2Config:
1863  0000 88            	push	a
1864       00000000      OFST:	set	0
1867                     ; 534     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1869                     ; 537     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
1869                     ; 538                             | (uint8_t)TIM2_ForcedAction);
1871  0001 c65306        	ld	a,21254
1872  0004 a48f          	and	a,#143
1873  0006 1a01          	or	a,(OFST+1,sp)
1874  0008 c75306        	ld	21254,a
1875                     ; 539 }
1878  000b 84            	pop	a
1879  000c 81            	ret	
1915                     ; 550 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
1915                     ; 551 {
1916                     .text:	section	.text,new
1917  0000               _TIM2_ForcedOC3Config:
1919  0000 88            	push	a
1920       00000000      OFST:	set	0
1923                     ; 553     assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
1925                     ; 556     TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
1925                     ; 557                               | (uint8_t)TIM2_ForcedAction);
1927  0001 c65307        	ld	a,21255
1928  0004 a48f          	and	a,#143
1929  0006 1a01          	or	a,(OFST+1,sp)
1930  0008 c75307        	ld	21255,a
1931                     ; 558 }
1934  000b 84            	pop	a
1935  000c 81            	ret	
1971                     ; 567 void TIM2_ARRPreloadConfig(FunctionalState NewState)
1971                     ; 568 {
1972                     .text:	section	.text,new
1973  0000               _TIM2_ARRPreloadConfig:
1977                     ; 570     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1979                     ; 573     if (NewState != DISABLE)
1981  0000 4d            	tnz	a
1982  0001 2705          	jreq	L7001
1983                     ; 575         TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
1985  0003 721e5300      	bset	21248,#7
1988  0007 81            	ret	
1989  0008               L7001:
1990                     ; 579         TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
1992  0008 721f5300      	bres	21248,#7
1993                     ; 581 }
1996  000c 81            	ret	
2032                     ; 590 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2032                     ; 591 {
2033                     .text:	section	.text,new
2034  0000               _TIM2_OC1PreloadConfig:
2038                     ; 593     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2040                     ; 596     if (NewState != DISABLE)
2042  0000 4d            	tnz	a
2043  0001 2705          	jreq	L1301
2044                     ; 598         TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2046  0003 72165305      	bset	21253,#3
2049  0007 81            	ret	
2050  0008               L1301:
2051                     ; 602         TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2053  0008 72175305      	bres	21253,#3
2054                     ; 604 }
2057  000c 81            	ret	
2093                     ; 613 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2093                     ; 614 {
2094                     .text:	section	.text,new
2095  0000               _TIM2_OC2PreloadConfig:
2099                     ; 616     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2101                     ; 619     if (NewState != DISABLE)
2103  0000 4d            	tnz	a
2104  0001 2705          	jreq	L3501
2105                     ; 621         TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2107  0003 72165306      	bset	21254,#3
2110  0007 81            	ret	
2111  0008               L3501:
2112                     ; 625         TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2114  0008 72175306      	bres	21254,#3
2115                     ; 627 }
2118  000c 81            	ret	
2154                     ; 636 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2154                     ; 637 {
2155                     .text:	section	.text,new
2156  0000               _TIM2_OC3PreloadConfig:
2160                     ; 639     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2162                     ; 642     if (NewState != DISABLE)
2164  0000 4d            	tnz	a
2165  0001 2705          	jreq	L5701
2166                     ; 644         TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2168  0003 72165307      	bset	21255,#3
2171  0007 81            	ret	
2172  0008               L5701:
2173                     ; 648         TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2175  0008 72175307      	bres	21255,#3
2176                     ; 650 }
2179  000c 81            	ret	
2252                     ; 663 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
2252                     ; 664 {
2253                     .text:	section	.text,new
2254  0000               _TIM2_GenerateEvent:
2258                     ; 666     assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
2260                     ; 669     TIM2->EGR = (uint8_t)TIM2_EventSource;
2262  0000 c75304        	ld	21252,a
2263                     ; 670 }
2266  0003 81            	ret	
2302                     ; 681 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2302                     ; 682 {
2303                     .text:	section	.text,new
2304  0000               _TIM2_OC1PolarityConfig:
2308                     ; 684     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2310                     ; 687     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2312  0000 4d            	tnz	a
2313  0001 2705          	jreq	L1511
2314                     ; 689         TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
2316  0003 72125308      	bset	21256,#1
2319  0007 81            	ret	
2320  0008               L1511:
2321                     ; 693         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
2323  0008 72135308      	bres	21256,#1
2324                     ; 695 }
2327  000c 81            	ret	
2363                     ; 706 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2363                     ; 707 {
2364                     .text:	section	.text,new
2365  0000               _TIM2_OC2PolarityConfig:
2369                     ; 709     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2371                     ; 712     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2373  0000 4d            	tnz	a
2374  0001 2705          	jreq	L3711
2375                     ; 714         TIM2->CCER1 |= TIM2_CCER1_CC2P;
2377  0003 721a5308      	bset	21256,#5
2380  0007 81            	ret	
2381  0008               L3711:
2382                     ; 718         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
2384  0008 721b5308      	bres	21256,#5
2385                     ; 720 }
2388  000c 81            	ret	
2424                     ; 731 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
2424                     ; 732 {
2425                     .text:	section	.text,new
2426  0000               _TIM2_OC3PolarityConfig:
2430                     ; 734     assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
2432                     ; 737     if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
2434  0000 4d            	tnz	a
2435  0001 2705          	jreq	L5121
2436                     ; 739         TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
2438  0003 72125309      	bset	21257,#1
2441  0007 81            	ret	
2442  0008               L5121:
2443                     ; 743         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
2445  0008 72135309      	bres	21257,#1
2446                     ; 745 }
2449  000c 81            	ret	
2494                     ; 759 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
2494                     ; 760 {
2495                     .text:	section	.text,new
2496  0000               _TIM2_CCxCmd:
2498  0000 89            	pushw	x
2499       00000000      OFST:	set	0
2502                     ; 762     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2504                     ; 763     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2506                     ; 765     if (TIM2_Channel == TIM2_CHANNEL_1)
2508  0001 9e            	ld	a,xh
2509  0002 4d            	tnz	a
2510  0003 2610          	jrne	L3421
2511                     ; 768         if (NewState != DISABLE)
2513  0005 9f            	ld	a,xl
2514  0006 4d            	tnz	a
2515  0007 2706          	jreq	L5421
2516                     ; 770             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
2518  0009 72105308      	bset	21256,#0
2520  000d 2029          	jra	L1521
2521  000f               L5421:
2522                     ; 774             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2524  000f 72115308      	bres	21256,#0
2525  0013 2023          	jra	L1521
2526  0015               L3421:
2527                     ; 778     else if (TIM2_Channel == TIM2_CHANNEL_2)
2529  0015 7b01          	ld	a,(OFST+1,sp)
2530  0017 4a            	dec	a
2531  0018 2610          	jrne	L3521
2532                     ; 781         if (NewState != DISABLE)
2534  001a 7b02          	ld	a,(OFST+2,sp)
2535  001c 2706          	jreq	L5521
2536                     ; 783             TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
2538  001e 72185308      	bset	21256,#4
2540  0022 2014          	jra	L1521
2541  0024               L5521:
2542                     ; 787             TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2544  0024 72195308      	bres	21256,#4
2545  0028 200e          	jra	L1521
2546  002a               L3521:
2547                     ; 793         if (NewState != DISABLE)
2549  002a 7b02          	ld	a,(OFST+2,sp)
2550  002c 2706          	jreq	L3621
2551                     ; 795             TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
2553  002e 72105309      	bset	21257,#0
2555  0032 2004          	jra	L1521
2556  0034               L3621:
2557                     ; 799             TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2559  0034 72115309      	bres	21257,#0
2560  0038               L1521:
2561                     ; 802 }
2564  0038 85            	popw	x
2565  0039 81            	ret	
2610                     ; 824 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
2610                     ; 825 {
2611                     .text:	section	.text,new
2612  0000               _TIM2_SelectOCxM:
2614  0000 89            	pushw	x
2615       00000000      OFST:	set	0
2618                     ; 827     assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
2620                     ; 828     assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
2622                     ; 830     if (TIM2_Channel == TIM2_CHANNEL_1)
2624  0001 9e            	ld	a,xh
2625  0002 4d            	tnz	a
2626  0003 2610          	jrne	L1131
2627                     ; 833         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
2629  0005 72115308      	bres	21256,#0
2630                     ; 836         TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
2630                     ; 837                                | (uint8_t)TIM2_OCMode);
2632  0009 c65305        	ld	a,21253
2633  000c a48f          	and	a,#143
2634  000e 1a02          	or	a,(OFST+2,sp)
2635  0010 c75305        	ld	21253,a
2637  0013 2023          	jra	L3131
2638  0015               L1131:
2639                     ; 839     else if (TIM2_Channel == TIM2_CHANNEL_2)
2641  0015 7b01          	ld	a,(OFST+1,sp)
2642  0017 4a            	dec	a
2643  0018 2610          	jrne	L5131
2644                     ; 842         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
2646  001a 72195308      	bres	21256,#4
2647                     ; 845         TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
2647                     ; 846                                 | (uint8_t)TIM2_OCMode);
2649  001e c65306        	ld	a,21254
2650  0021 a48f          	and	a,#143
2651  0023 1a02          	or	a,(OFST+2,sp)
2652  0025 c75306        	ld	21254,a
2654  0028 200e          	jra	L3131
2655  002a               L5131:
2656                     ; 851         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
2658  002a 72115309      	bres	21257,#0
2659                     ; 854         TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2659                     ; 855                                 | (uint8_t)TIM2_OCMode);
2661  002e c65307        	ld	a,21255
2662  0031 a48f          	and	a,#143
2663  0033 1a02          	or	a,(OFST+2,sp)
2664  0035 c75307        	ld	21255,a
2665  0038               L3131:
2666                     ; 857 }
2669  0038 85            	popw	x
2670  0039 81            	ret	
2702                     ; 866 void TIM2_SetCounter(uint16_t Counter)
2702                     ; 867 {
2703                     .text:	section	.text,new
2704  0000               _TIM2_SetCounter:
2708                     ; 869     TIM2->CNTRH = (uint8_t)(Counter >> 8);
2710  0000 9e            	ld	a,xh
2711  0001 c7530a        	ld	21258,a
2712                     ; 870     TIM2->CNTRL = (uint8_t)(Counter);
2714  0004 9f            	ld	a,xl
2715  0005 c7530b        	ld	21259,a
2716                     ; 872 }
2719  0008 81            	ret	
2751                     ; 881 void TIM2_SetAutoreload(uint16_t Autoreload)
2751                     ; 882 {
2752                     .text:	section	.text,new
2753  0000               _TIM2_SetAutoreload:
2757                     ; 885     TIM2->ARRH = (uint8_t)(Autoreload >> 8);
2759  0000 9e            	ld	a,xh
2760  0001 c7530d        	ld	21261,a
2761                     ; 886     TIM2->ARRL = (uint8_t)(Autoreload);
2763  0004 9f            	ld	a,xl
2764  0005 c7530e        	ld	21262,a
2765                     ; 888 }
2768  0008 81            	ret	
2800                     ; 897 void TIM2_SetCompare1(uint16_t Compare1)
2800                     ; 898 {
2801                     .text:	section	.text,new
2802  0000               _TIM2_SetCompare1:
2806                     ; 900     TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
2808  0000 9e            	ld	a,xh
2809  0001 c7530f        	ld	21263,a
2810                     ; 901     TIM2->CCR1L = (uint8_t)(Compare1);
2812  0004 9f            	ld	a,xl
2813  0005 c75310        	ld	21264,a
2814                     ; 903 }
2817  0008 81            	ret	
2849                     ; 912 void TIM2_SetCompare2(uint16_t Compare2)
2849                     ; 913 {
2850                     .text:	section	.text,new
2851  0000               _TIM2_SetCompare2:
2855                     ; 915     TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
2857  0000 9e            	ld	a,xh
2858  0001 c75311        	ld	21265,a
2859                     ; 916     TIM2->CCR2L = (uint8_t)(Compare2);
2861  0004 9f            	ld	a,xl
2862  0005 c75312        	ld	21266,a
2863                     ; 918 }
2866  0008 81            	ret	
2898                     ; 927 void TIM2_SetCompare3(uint16_t Compare3)
2898                     ; 928 {
2899                     .text:	section	.text,new
2900  0000               _TIM2_SetCompare3:
2904                     ; 930     TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
2906  0000 9e            	ld	a,xh
2907  0001 c75313        	ld	21267,a
2908                     ; 931     TIM2->CCR3L = (uint8_t)(Compare3);
2910  0004 9f            	ld	a,xl
2911  0005 c75314        	ld	21268,a
2912                     ; 933 }
2915  0008 81            	ret	
2951                     ; 946 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
2951                     ; 947 {
2952                     .text:	section	.text,new
2953  0000               _TIM2_SetIC1Prescaler:
2955  0000 88            	push	a
2956       00000000      OFST:	set	0
2959                     ; 949     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
2961                     ; 952     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
2961                     ; 953                             | (uint8_t)TIM2_IC1Prescaler);
2963  0001 c65305        	ld	a,21253
2964  0004 a4f3          	and	a,#243
2965  0006 1a01          	or	a,(OFST+1,sp)
2966  0008 c75305        	ld	21253,a
2967                     ; 954 }
2970  000b 84            	pop	a
2971  000c 81            	ret	
3007                     ; 966 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3007                     ; 967 {
3008                     .text:	section	.text,new
3009  0000               _TIM2_SetIC2Prescaler:
3011  0000 88            	push	a
3012       00000000      OFST:	set	0
3015                     ; 969     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3017                     ; 972     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3017                     ; 973                             | (uint8_t)TIM2_IC2Prescaler);
3019  0001 c65306        	ld	a,21254
3020  0004 a4f3          	and	a,#243
3021  0006 1a01          	or	a,(OFST+1,sp)
3022  0008 c75306        	ld	21254,a
3023                     ; 974 }
3026  000b 84            	pop	a
3027  000c 81            	ret	
3063                     ; 986 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
3063                     ; 987 {
3064                     .text:	section	.text,new
3065  0000               _TIM2_SetIC3Prescaler:
3067  0000 88            	push	a
3068       00000000      OFST:	set	0
3071                     ; 990     assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
3073                     ; 992     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3073                     ; 993                             | (uint8_t)TIM2_IC3Prescaler);
3075  0001 c65307        	ld	a,21255
3076  0004 a4f3          	and	a,#243
3077  0006 1a01          	or	a,(OFST+1,sp)
3078  0008 c75307        	ld	21255,a
3079                     ; 994 }
3082  000b 84            	pop	a
3083  000c 81            	ret	
3129                     ; 1001 uint16_t TIM2_GetCapture1(void)
3129                     ; 1002 {
3130                     .text:	section	.text,new
3131  0000               _TIM2_GetCapture1:
3133  0000 5204          	subw	sp,#4
3134       00000004      OFST:	set	4
3137                     ; 1004     uint16_t tmpccr1 = 0;
3139                     ; 1005     uint8_t tmpccr1l=0, tmpccr1h=0;
3143                     ; 1007     tmpccr1h = TIM2->CCR1H;
3145  0002 c6530f        	ld	a,21263
3146  0005 6b02          	ld	(OFST-2,sp),a
3147                     ; 1008     tmpccr1l = TIM2->CCR1L;
3149  0007 c65310        	ld	a,21264
3150  000a 6b01          	ld	(OFST-3,sp),a
3151                     ; 1010     tmpccr1 = (uint16_t)(tmpccr1l);
3153  000c 5f            	clrw	x
3154  000d 97            	ld	xl,a
3155  000e 1f03          	ldw	(OFST-1,sp),x
3156                     ; 1011     tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
3158  0010 5f            	clrw	x
3159  0011 7b02          	ld	a,(OFST-2,sp)
3160  0013 97            	ld	xl,a
3161  0014 7b04          	ld	a,(OFST+0,sp)
3162  0016 01            	rrwa	x,a
3163  0017 1a03          	or	a,(OFST-1,sp)
3164  0019 01            	rrwa	x,a
3165                     ; 1013     return (uint16_t)tmpccr1;
3169  001a 5b04          	addw	sp,#4
3170  001c 81            	ret	
3216                     ; 1021 uint16_t TIM2_GetCapture2(void)
3216                     ; 1022 {
3217                     .text:	section	.text,new
3218  0000               _TIM2_GetCapture2:
3220  0000 5204          	subw	sp,#4
3221       00000004      OFST:	set	4
3224                     ; 1024     uint16_t tmpccr2 = 0;
3226                     ; 1025     uint8_t tmpccr2l=0, tmpccr2h=0;
3230                     ; 1027     tmpccr2h = TIM2->CCR2H;
3232  0002 c65311        	ld	a,21265
3233  0005 6b02          	ld	(OFST-2,sp),a
3234                     ; 1028     tmpccr2l = TIM2->CCR2L;
3236  0007 c65312        	ld	a,21266
3237  000a 6b01          	ld	(OFST-3,sp),a
3238                     ; 1030     tmpccr2 = (uint16_t)(tmpccr2l);
3240  000c 5f            	clrw	x
3241  000d 97            	ld	xl,a
3242  000e 1f03          	ldw	(OFST-1,sp),x
3243                     ; 1031     tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
3245  0010 5f            	clrw	x
3246  0011 7b02          	ld	a,(OFST-2,sp)
3247  0013 97            	ld	xl,a
3248  0014 7b04          	ld	a,(OFST+0,sp)
3249  0016 01            	rrwa	x,a
3250  0017 1a03          	or	a,(OFST-1,sp)
3251  0019 01            	rrwa	x,a
3252                     ; 1033     return (uint16_t)tmpccr2;
3256  001a 5b04          	addw	sp,#4
3257  001c 81            	ret	
3303                     ; 1041 uint16_t TIM2_GetCapture3(void)
3303                     ; 1042 {
3304                     .text:	section	.text,new
3305  0000               _TIM2_GetCapture3:
3307  0000 5204          	subw	sp,#4
3308       00000004      OFST:	set	4
3311                     ; 1044     uint16_t tmpccr3 = 0;
3313                     ; 1045     uint8_t tmpccr3l=0, tmpccr3h=0;
3317                     ; 1047     tmpccr3h = TIM2->CCR3H;
3319  0002 c65313        	ld	a,21267
3320  0005 6b02          	ld	(OFST-2,sp),a
3321                     ; 1048     tmpccr3l = TIM2->CCR3L;
3323  0007 c65314        	ld	a,21268
3324  000a 6b01          	ld	(OFST-3,sp),a
3325                     ; 1050     tmpccr3 = (uint16_t)(tmpccr3l);
3327  000c 5f            	clrw	x
3328  000d 97            	ld	xl,a
3329  000e 1f03          	ldw	(OFST-1,sp),x
3330                     ; 1051     tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
3332  0010 5f            	clrw	x
3333  0011 7b02          	ld	a,(OFST-2,sp)
3334  0013 97            	ld	xl,a
3335  0014 7b04          	ld	a,(OFST+0,sp)
3336  0016 01            	rrwa	x,a
3337  0017 1a03          	or	a,(OFST-1,sp)
3338  0019 01            	rrwa	x,a
3339                     ; 1053     return (uint16_t)tmpccr3;
3343  001a 5b04          	addw	sp,#4
3344  001c 81            	ret	
3376                     ; 1061 uint16_t TIM2_GetCounter(void)
3376                     ; 1062 {
3377                     .text:	section	.text,new
3378  0000               _TIM2_GetCounter:
3380  0000 89            	pushw	x
3381       00000002      OFST:	set	2
3384                     ; 1063      uint16_t tmpcntr = 0;
3386                     ; 1065     tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
3388  0001 c6530a        	ld	a,21258
3389  0004 97            	ld	xl,a
3390  0005 4f            	clr	a
3391  0006 02            	rlwa	x,a
3392  0007 1f01          	ldw	(OFST-1,sp),x
3393                     ; 1067     return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
3395  0009 c6530b        	ld	a,21259
3396  000c 5f            	clrw	x
3397  000d 97            	ld	xl,a
3398  000e 01            	rrwa	x,a
3399  000f 1a02          	or	a,(OFST+0,sp)
3400  0011 01            	rrwa	x,a
3401  0012 1a01          	or	a,(OFST-1,sp)
3402  0014 01            	rrwa	x,a
3405  0015 5b02          	addw	sp,#2
3406  0017 81            	ret	
3430                     ; 1076 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
3430                     ; 1077 {
3431                     .text:	section	.text,new
3432  0000               _TIM2_GetPrescaler:
3436                     ; 1079     return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
3438  0000 c6530c        	ld	a,21260
3441  0003 81            	ret	
3576                     ; 1096 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
3576                     ; 1097 {
3577                     .text:	section	.text,new
3578  0000               _TIM2_GetFlagStatus:
3580  0000 89            	pushw	x
3581  0001 89            	pushw	x
3582       00000002      OFST:	set	2
3585                     ; 1098     FlagStatus bitstatus = RESET;
3587                     ; 1099     uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
3591                     ; 1102     assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
3593                     ; 1104     tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
3595  0002 9f            	ld	a,xl
3596  0003 c45302        	and	a,21250
3597  0006 6b01          	ld	(OFST-1,sp),a
3598                     ; 1105     tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
3600  0008 7b03          	ld	a,(OFST+1,sp)
3601  000a 6b02          	ld	(OFST+0,sp),a
3602                     ; 1107     if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
3604  000c c45303        	and	a,21251
3605  000f 1a01          	or	a,(OFST-1,sp)
3606  0011 2702          	jreq	L3561
3607                     ; 1109         bitstatus = SET;
3609  0013 a601          	ld	a,#1
3611  0015               L3561:
3612                     ; 1113         bitstatus = RESET;
3614                     ; 1115     return (FlagStatus)bitstatus;
3618  0015 5b04          	addw	sp,#4
3619  0017 81            	ret	
3654                     ; 1132 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
3654                     ; 1133 {
3655                     .text:	section	.text,new
3656  0000               _TIM2_ClearFlag:
3660                     ; 1135     assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
3662                     ; 1138     TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
3664  0000 9f            	ld	a,xl
3665  0001 43            	cpl	a
3666  0002 c75302        	ld	21250,a
3667                     ; 1139     TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
3669  0005 35ff5303      	mov	21251,#255
3670                     ; 1140 }
3673  0009 81            	ret	
3733                     ; 1154 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
3733                     ; 1155 {
3734                     .text:	section	.text,new
3735  0000               _TIM2_GetITStatus:
3737  0000 88            	push	a
3738  0001 89            	pushw	x
3739       00000002      OFST:	set	2
3742                     ; 1156     ITStatus bitstatus = RESET;
3744                     ; 1157     uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
3748                     ; 1160     assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
3750                     ; 1162     TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
3752  0002 c45302        	and	a,21250
3753  0005 6b01          	ld	(OFST-1,sp),a
3754                     ; 1164     TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
3756  0007 c65301        	ld	a,21249
3757  000a 1403          	and	a,(OFST+1,sp)
3758  000c 6b02          	ld	(OFST+0,sp),a
3759                     ; 1166     if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
3761  000e 7b01          	ld	a,(OFST-1,sp)
3762  0010 2708          	jreq	L3271
3764  0012 7b02          	ld	a,(OFST+0,sp)
3765  0014 2704          	jreq	L3271
3766                     ; 1168         bitstatus = SET;
3768  0016 a601          	ld	a,#1
3770  0018 2001          	jra	L5271
3771  001a               L3271:
3772                     ; 1172         bitstatus = RESET;
3774  001a 4f            	clr	a
3775  001b               L5271:
3776                     ; 1174     return (ITStatus)(bitstatus);
3780  001b 5b03          	addw	sp,#3
3781  001d 81            	ret	
3817                     ; 1188 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
3817                     ; 1189 {
3818                     .text:	section	.text,new
3819  0000               _TIM2_ClearITPendingBit:
3823                     ; 1191     assert_param(IS_TIM2_IT_OK(TIM2_IT));
3825                     ; 1194     TIM2->SR1 = (uint8_t)(~TIM2_IT);
3827  0000 43            	cpl	a
3828  0001 c75302        	ld	21250,a
3829                     ; 1195 }
3832  0004 81            	ret	
3878                     ; 1214 static void TI1_Config(uint8_t TIM2_ICPolarity,
3878                     ; 1215                        uint8_t TIM2_ICSelection,
3878                     ; 1216                        uint8_t TIM2_ICFilter)
3878                     ; 1217 {
3879                     .text:	section	.text,new
3880  0000               L3_TI1_Config:
3882  0000 89            	pushw	x
3883  0001 88            	push	a
3884       00000001      OFST:	set	1
3887                     ; 1219     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3889  0002 72115308      	bres	21256,#0
3890                     ; 1222     TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
3890                     ; 1223                              | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3892  0006 7b06          	ld	a,(OFST+5,sp)
3893  0008 97            	ld	xl,a
3894  0009 a610          	ld	a,#16
3895  000b 42            	mul	x,a
3896  000c 9f            	ld	a,xl
3897  000d 1a03          	or	a,(OFST+2,sp)
3898  000f 6b01          	ld	(OFST+0,sp),a
3899  0011 c65305        	ld	a,21253
3900  0014 a40c          	and	a,#12
3901  0016 1a01          	or	a,(OFST+0,sp)
3902  0018 c75305        	ld	21253,a
3903                     ; 1226     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3905  001b 7b02          	ld	a,(OFST+1,sp)
3906  001d 2706          	jreq	L5671
3907                     ; 1228         TIM2->CCER1 |= TIM2_CCER1_CC1P;
3909  001f 72125308      	bset	21256,#1
3911  0023 2004          	jra	L7671
3912  0025               L5671:
3913                     ; 1232         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3915  0025 72135308      	bres	21256,#1
3916  0029               L7671:
3917                     ; 1235     TIM2->CCER1 |= TIM2_CCER1_CC1E;
3919  0029 72105308      	bset	21256,#0
3920                     ; 1236 }
3923  002d 5b03          	addw	sp,#3
3924  002f 81            	ret	
3970                     ; 1255 static void TI2_Config(uint8_t TIM2_ICPolarity,
3970                     ; 1256                        uint8_t TIM2_ICSelection,
3970                     ; 1257                        uint8_t TIM2_ICFilter)
3970                     ; 1258 {
3971                     .text:	section	.text,new
3972  0000               L5_TI2_Config:
3974  0000 89            	pushw	x
3975  0001 88            	push	a
3976       00000001      OFST:	set	1
3979                     ; 1260     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3981  0002 72195308      	bres	21256,#4
3982                     ; 1263     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
3982                     ; 1264                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
3984  0006 7b06          	ld	a,(OFST+5,sp)
3985  0008 97            	ld	xl,a
3986  0009 a610          	ld	a,#16
3987  000b 42            	mul	x,a
3988  000c 9f            	ld	a,xl
3989  000d 1a03          	or	a,(OFST+2,sp)
3990  000f 6b01          	ld	(OFST+0,sp),a
3991  0011 c65306        	ld	a,21254
3992  0014 a40c          	and	a,#12
3993  0016 1a01          	or	a,(OFST+0,sp)
3994  0018 c75306        	ld	21254,a
3995                     ; 1268     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
3997  001b 7b02          	ld	a,(OFST+1,sp)
3998  001d 2706          	jreq	L1102
3999                     ; 1270         TIM2->CCER1 |= TIM2_CCER1_CC2P;
4001  001f 721a5308      	bset	21256,#5
4003  0023 2004          	jra	L3102
4004  0025               L1102:
4005                     ; 1274         TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
4007  0025 721b5308      	bres	21256,#5
4008  0029               L3102:
4009                     ; 1278     TIM2->CCER1 |= TIM2_CCER1_CC2E;
4011  0029 72185308      	bset	21256,#4
4012                     ; 1280 }
4015  002d 5b03          	addw	sp,#3
4016  002f 81            	ret	
4062                     ; 1296 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
4062                     ; 1297                        uint8_t TIM2_ICFilter)
4062                     ; 1298 {
4063                     .text:	section	.text,new
4064  0000               L7_TI3_Config:
4066  0000 89            	pushw	x
4067  0001 88            	push	a
4068       00000001      OFST:	set	1
4071                     ; 1300     TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
4073  0002 72115309      	bres	21257,#0
4074                     ; 1303     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
4074                     ; 1304                             | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
4076  0006 7b06          	ld	a,(OFST+5,sp)
4077  0008 97            	ld	xl,a
4078  0009 a610          	ld	a,#16
4079  000b 42            	mul	x,a
4080  000c 9f            	ld	a,xl
4081  000d 1a03          	or	a,(OFST+2,sp)
4082  000f 6b01          	ld	(OFST+0,sp),a
4083  0011 c65307        	ld	a,21255
4084  0014 a40c          	and	a,#12
4085  0016 1a01          	or	a,(OFST+0,sp)
4086  0018 c75307        	ld	21255,a
4087                     ; 1308     if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
4089  001b 7b02          	ld	a,(OFST+1,sp)
4090  001d 2706          	jreq	L5302
4091                     ; 1310         TIM2->CCER2 |= TIM2_CCER2_CC3P;
4093  001f 72125309      	bset	21257,#1
4095  0023 2004          	jra	L7302
4096  0025               L5302:
4097                     ; 1314         TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
4099  0025 72135309      	bres	21257,#1
4100  0029               L7302:
4101                     ; 1317     TIM2->CCER2 |= TIM2_CCER2_CC3E;
4103  0029 72105309      	bset	21257,#0
4104                     ; 1318 }
4107  002d 5b03          	addw	sp,#3
4108  002f 81            	ret	
4121                     	xdef	_TIM2_ClearITPendingBit
4122                     	xdef	_TIM2_GetITStatus
4123                     	xdef	_TIM2_ClearFlag
4124                     	xdef	_TIM2_GetFlagStatus
4125                     	xdef	_TIM2_GetPrescaler
4126                     	xdef	_TIM2_GetCounter
4127                     	xdef	_TIM2_GetCapture3
4128                     	xdef	_TIM2_GetCapture2
4129                     	xdef	_TIM2_GetCapture1
4130                     	xdef	_TIM2_SetIC3Prescaler
4131                     	xdef	_TIM2_SetIC2Prescaler
4132                     	xdef	_TIM2_SetIC1Prescaler
4133                     	xdef	_TIM2_SetCompare3
4134                     	xdef	_TIM2_SetCompare2
4135                     	xdef	_TIM2_SetCompare1
4136                     	xdef	_TIM2_SetAutoreload
4137                     	xdef	_TIM2_SetCounter
4138                     	xdef	_TIM2_SelectOCxM
4139                     	xdef	_TIM2_CCxCmd
4140                     	xdef	_TIM2_OC3PolarityConfig
4141                     	xdef	_TIM2_OC2PolarityConfig
4142                     	xdef	_TIM2_OC1PolarityConfig
4143                     	xdef	_TIM2_GenerateEvent
4144                     	xdef	_TIM2_OC3PreloadConfig
4145                     	xdef	_TIM2_OC2PreloadConfig
4146                     	xdef	_TIM2_OC1PreloadConfig
4147                     	xdef	_TIM2_ARRPreloadConfig
4148                     	xdef	_TIM2_ForcedOC3Config
4149                     	xdef	_TIM2_ForcedOC2Config
4150                     	xdef	_TIM2_ForcedOC1Config
4151                     	xdef	_TIM2_PrescalerConfig
4152                     	xdef	_TIM2_SelectOnePulseMode
4153                     	xdef	_TIM2_UpdateRequestConfig
4154                     	xdef	_TIM2_UpdateDisableConfig
4155                     	xdef	_TIM2_ITConfig
4156                     	xdef	_TIM2_Cmd
4157                     	xdef	_TIM2_PWMIConfig
4158                     	xdef	_TIM2_ICInit
4159                     	xdef	_TIM2_OC3Init
4160                     	xdef	_TIM2_OC2Init
4161                     	xdef	_TIM2_OC1Init
4162                     	xdef	_TIM2_TimeBaseInit
4163                     	xdef	_TIM2_DeInit
4182                     	end
