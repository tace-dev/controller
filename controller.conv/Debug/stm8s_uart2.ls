   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  44                     ; 47 void UART2_DeInit(void)
  44                     ; 48 {
  46                     	switch	.text
  47  0000               _UART2_DeInit:
  51                     ; 51     (void) UART2->SR;
  53  0000 c65240        	ld	a,21056
  54                     ; 52     (void)UART2->DR;
  56  0003 c65241        	ld	a,21057
  57                     ; 54     UART2->BRR2 = UART2_BRR2_RESET_VALUE;  /*  Set UART2_BRR2 to reset value 0x00 */
  59  0006 725f5243      	clr	21059
  60                     ; 55     UART2->BRR1 = UART2_BRR1_RESET_VALUE;  /*  Set UART2_BRR1 to reset value 0x00 */
  62  000a 725f5242      	clr	21058
  63                     ; 57     UART2->CR1 = UART2_CR1_RESET_VALUE; /*  Set UART2_CR1 to reset value 0x00  */
  65  000e 725f5244      	clr	21060
  66                     ; 58     UART2->CR2 = UART2_CR2_RESET_VALUE; /*  Set UART2_CR2 to reset value 0x00  */
  68  0012 725f5245      	clr	21061
  69                     ; 59     UART2->CR3 = UART2_CR3_RESET_VALUE; /*  Set UART2_CR3 to reset value 0x00  */
  71  0016 725f5246      	clr	21062
  72                     ; 60     UART2->CR4 = UART2_CR4_RESET_VALUE; /*  Set UART2_CR4 to reset value 0x00  */
  74  001a 725f5247      	clr	21063
  75                     ; 61     UART2->CR5 = UART2_CR5_RESET_VALUE; /*  Set UART2_CR5 to reset value 0x00  */
  77  001e 725f5248      	clr	21064
  78                     ; 62     UART2->CR6 = UART2_CR6_RESET_VALUE; /*  Set UART2_CR6 to reset value 0x00  */
  80  0022 725f5249      	clr	21065
  81                     ; 64 }
  84  0026 81            	ret
 405                     .const:	section	.text
 406  0000               L01:
 407  0000 00000064      	dc.l	100
 408                     ; 80 void UART2_Init(uint32_t BaudRate, UART2_WordLength_TypeDef WordLength, UART2_StopBits_TypeDef StopBits, UART2_Parity_TypeDef Parity, UART2_SyncMode_TypeDef SyncMode, UART2_Mode_TypeDef Mode)
 408                     ; 81 {
 409                     	switch	.text
 410  0027               _UART2_Init:
 412  0027 520e          	subw	sp,#14
 413       0000000e      OFST:	set	14
 416                     ; 82     uint8_t BRR2_1 = 0, BRR2_2 = 0;
 420                     ; 83     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 424                     ; 86     assert_param(IS_UART2_BAUDRATE_OK(BaudRate));
 426                     ; 87     assert_param(IS_UART2_WORDLENGTH_OK(WordLength));
 428                     ; 88     assert_param(IS_UART2_STOPBITS_OK(StopBits));
 430                     ; 89     assert_param(IS_UART2_PARITY_OK(Parity));
 432                     ; 90     assert_param(IS_UART2_MODE_OK((uint8_t)Mode));
 434                     ; 91     assert_param(IS_UART2_SYNCMODE_OK((uint8_t)SyncMode));
 436                     ; 94     UART2->CR1 &= (uint8_t)(~UART2_CR1_M);
 438  0029 72195244      	bres	21060,#4
 439                     ; 96     UART2->CR1 |= (uint8_t)WordLength; 
 441  002d c65244        	ld	a,21060
 442  0030 1a15          	or	a,(OFST+7,sp)
 443  0032 c75244        	ld	21060,a
 444                     ; 99     UART2->CR3 &= (uint8_t)(~UART2_CR3_STOP);
 446  0035 c65246        	ld	a,21062
 447  0038 a4cf          	and	a,#207
 448  003a c75246        	ld	21062,a
 449                     ; 101     UART2->CR3 |= (uint8_t)StopBits; 
 451  003d c65246        	ld	a,21062
 452  0040 1a16          	or	a,(OFST+8,sp)
 453  0042 c75246        	ld	21062,a
 454                     ; 104     UART2->CR1 &= (uint8_t)(~(UART2_CR1_PCEN | UART2_CR1_PS  ));
 456  0045 c65244        	ld	a,21060
 457  0048 a4f9          	and	a,#249
 458  004a c75244        	ld	21060,a
 459                     ; 106     UART2->CR1 |= (uint8_t)Parity;
 461  004d c65244        	ld	a,21060
 462  0050 1a17          	or	a,(OFST+9,sp)
 463  0052 c75244        	ld	21060,a
 464                     ; 109     UART2->BRR1 &= (uint8_t)(~UART2_BRR1_DIVM);
 466  0055 725f5242      	clr	21058
 467                     ; 111     UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVM);
 469  0059 c65243        	ld	a,21059
 470  005c a40f          	and	a,#15
 471  005e c75243        	ld	21059,a
 472                     ; 113     UART2->BRR2 &= (uint8_t)(~UART2_BRR2_DIVF);
 474  0061 c65243        	ld	a,21059
 475  0064 a4f0          	and	a,#240
 476  0066 c75243        	ld	21059,a
 477                     ; 116     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 479  0069 96            	ldw	x,sp
 480  006a 1c0011        	addw	x,#OFST+3
 481  006d cd0000        	call	c_ltor
 483  0070 a604          	ld	a,#4
 484  0072 cd0000        	call	c_llsh
 486  0075 96            	ldw	x,sp
 487  0076 1c0001        	addw	x,#OFST-13
 488  0079 cd0000        	call	c_rtol
 491  007c cd0000        	call	_CLK_GetClockFreq
 493  007f 96            	ldw	x,sp
 494  0080 1c0001        	addw	x,#OFST-13
 495  0083 cd0000        	call	c_ludv
 497  0086 96            	ldw	x,sp
 498  0087 1c000b        	addw	x,#OFST-3
 499  008a cd0000        	call	c_rtol
 502                     ; 117     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 504  008d 96            	ldw	x,sp
 505  008e 1c0011        	addw	x,#OFST+3
 506  0091 cd0000        	call	c_ltor
 508  0094 a604          	ld	a,#4
 509  0096 cd0000        	call	c_llsh
 511  0099 96            	ldw	x,sp
 512  009a 1c0001        	addw	x,#OFST-13
 513  009d cd0000        	call	c_rtol
 516  00a0 cd0000        	call	_CLK_GetClockFreq
 518  00a3 a664          	ld	a,#100
 519  00a5 cd0000        	call	c_smul
 521  00a8 96            	ldw	x,sp
 522  00a9 1c0001        	addw	x,#OFST-13
 523  00ac cd0000        	call	c_ludv
 525  00af 96            	ldw	x,sp
 526  00b0 1c0007        	addw	x,#OFST-7
 527  00b3 cd0000        	call	c_rtol
 530                     ; 121     BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 530                     ; 122                         << 4) / 100) & (uint8_t)0x0F); 
 532  00b6 96            	ldw	x,sp
 533  00b7 1c000b        	addw	x,#OFST-3
 534  00ba cd0000        	call	c_ltor
 536  00bd a664          	ld	a,#100
 537  00bf cd0000        	call	c_smul
 539  00c2 96            	ldw	x,sp
 540  00c3 1c0001        	addw	x,#OFST-13
 541  00c6 cd0000        	call	c_rtol
 544  00c9 96            	ldw	x,sp
 545  00ca 1c0007        	addw	x,#OFST-7
 546  00cd cd0000        	call	c_ltor
 548  00d0 96            	ldw	x,sp
 549  00d1 1c0001        	addw	x,#OFST-13
 550  00d4 cd0000        	call	c_lsub
 552  00d7 a604          	ld	a,#4
 553  00d9 cd0000        	call	c_llsh
 555  00dc ae0000        	ldw	x,#L01
 556  00df cd0000        	call	c_ludv
 558  00e2 b603          	ld	a,c_lreg+3
 559  00e4 a40f          	and	a,#15
 560  00e6 6b05          	ld	(OFST-9,sp),a
 562                     ; 123     BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 564  00e8 96            	ldw	x,sp
 565  00e9 1c000b        	addw	x,#OFST-3
 566  00ec cd0000        	call	c_ltor
 568  00ef a604          	ld	a,#4
 569  00f1 cd0000        	call	c_lursh
 571  00f4 b603          	ld	a,c_lreg+3
 572  00f6 a4f0          	and	a,#240
 573  00f8 b703          	ld	c_lreg+3,a
 574  00fa 3f02          	clr	c_lreg+2
 575  00fc 3f01          	clr	c_lreg+1
 576  00fe 3f00          	clr	c_lreg
 577  0100 b603          	ld	a,c_lreg+3
 578  0102 6b06          	ld	(OFST-8,sp),a
 580                     ; 125     UART2->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 582  0104 7b05          	ld	a,(OFST-9,sp)
 583  0106 1a06          	or	a,(OFST-8,sp)
 584  0108 c75243        	ld	21059,a
 585                     ; 127     UART2->BRR1 = (uint8_t)BaudRate_Mantissa;           
 587  010b 7b0e          	ld	a,(OFST+0,sp)
 588  010d c75242        	ld	21058,a
 589                     ; 130     UART2->CR2 &= (uint8_t)~(UART2_CR2_TEN | UART2_CR2_REN);
 591  0110 c65245        	ld	a,21061
 592  0113 a4f3          	and	a,#243
 593  0115 c75245        	ld	21061,a
 594                     ; 132     UART2->CR3 &= (uint8_t)~(UART2_CR3_CPOL | UART2_CR3_CPHA | UART2_CR3_LBCL);
 596  0118 c65246        	ld	a,21062
 597  011b a4f8          	and	a,#248
 598  011d c75246        	ld	21062,a
 599                     ; 134     UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART2_CR3_CPOL | \
 599                     ; 135                                               UART2_CR3_CPHA | UART2_CR3_LBCL));
 601  0120 7b18          	ld	a,(OFST+10,sp)
 602  0122 a407          	and	a,#7
 603  0124 ca5246        	or	a,21062
 604  0127 c75246        	ld	21062,a
 605                     ; 137     if ((uint8_t)(Mode & UART2_MODE_TX_ENABLE))
 607  012a 7b19          	ld	a,(OFST+11,sp)
 608  012c a504          	bcp	a,#4
 609  012e 2706          	jreq	L302
 610                     ; 140         UART2->CR2 |= (uint8_t)UART2_CR2_TEN;
 612  0130 72165245      	bset	21061,#3
 614  0134 2004          	jra	L502
 615  0136               L302:
 616                     ; 145         UART2->CR2 &= (uint8_t)(~UART2_CR2_TEN);
 618  0136 72175245      	bres	21061,#3
 619  013a               L502:
 620                     ; 147     if ((uint8_t)(Mode & UART2_MODE_RX_ENABLE))
 622  013a 7b19          	ld	a,(OFST+11,sp)
 623  013c a508          	bcp	a,#8
 624  013e 2706          	jreq	L702
 625                     ; 150         UART2->CR2 |= (uint8_t)UART2_CR2_REN;
 627  0140 72145245      	bset	21061,#2
 629  0144 2004          	jra	L112
 630  0146               L702:
 631                     ; 155         UART2->CR2 &= (uint8_t)(~UART2_CR2_REN);
 633  0146 72155245      	bres	21061,#2
 634  014a               L112:
 635                     ; 159     if ((uint8_t)(SyncMode & UART2_SYNCMODE_CLOCK_DISABLE))
 637  014a 7b18          	ld	a,(OFST+10,sp)
 638  014c a580          	bcp	a,#128
 639  014e 2706          	jreq	L312
 640                     ; 162         UART2->CR3 &= (uint8_t)(~UART2_CR3_CKEN); 
 642  0150 72175246      	bres	21062,#3
 644  0154 200a          	jra	L512
 645  0156               L312:
 646                     ; 166         UART2->CR3 |= (uint8_t)((uint8_t)SyncMode & UART2_CR3_CKEN);
 648  0156 7b18          	ld	a,(OFST+10,sp)
 649  0158 a408          	and	a,#8
 650  015a ca5246        	or	a,21062
 651  015d c75246        	ld	21062,a
 652  0160               L512:
 653                     ; 168 }
 656  0160 5b0e          	addw	sp,#14
 657  0162 81            	ret
 712                     ; 176 void UART2_Cmd(FunctionalState NewState)
 712                     ; 177 {
 713                     	switch	.text
 714  0163               _UART2_Cmd:
 718                     ; 179     if (NewState != DISABLE)
 720  0163 4d            	tnz	a
 721  0164 2706          	jreq	L542
 722                     ; 182         UART2->CR1 &= (uint8_t)(~UART2_CR1_UARTD);
 724  0166 721b5244      	bres	21060,#5
 726  016a 2004          	jra	L742
 727  016c               L542:
 728                     ; 187         UART2->CR1 |= UART2_CR1_UARTD; 
 730  016c 721a5244      	bset	21060,#5
 731  0170               L742:
 732                     ; 189 }
 735  0170 81            	ret
 867                     ; 206 void UART2_ITConfig(UART2_IT_TypeDef UART2_IT, FunctionalState NewState)
 867                     ; 207 {
 868                     	switch	.text
 869  0171               _UART2_ITConfig:
 871  0171 89            	pushw	x
 872  0172 89            	pushw	x
 873       00000002      OFST:	set	2
 876                     ; 208     uint8_t uartreg = 0, itpos = 0x00;
 880                     ; 211     assert_param(IS_UART2_CONFIG_IT_OK(UART2_IT));
 882                     ; 212     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 884                     ; 215     uartreg = (uint8_t)((uint16_t)UART2_IT >> 0x08);
 886  0173 9e            	ld	a,xh
 887  0174 6b01          	ld	(OFST-1,sp),a
 889                     ; 218     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
 891  0176 9f            	ld	a,xl
 892  0177 a40f          	and	a,#15
 893  0179 5f            	clrw	x
 894  017a 97            	ld	xl,a
 895  017b a601          	ld	a,#1
 896  017d 5d            	tnzw	x
 897  017e 2704          	jreq	L61
 898  0180               L02:
 899  0180 48            	sll	a
 900  0181 5a            	decw	x
 901  0182 26fc          	jrne	L02
 902  0184               L61:
 903  0184 6b02          	ld	(OFST+0,sp),a
 905                     ; 220     if (NewState != DISABLE)
 907  0186 0d07          	tnz	(OFST+5,sp)
 908  0188 273a          	jreq	L133
 909                     ; 223         if (uartreg == 0x01)
 911  018a 7b01          	ld	a,(OFST-1,sp)
 912  018c a101          	cp	a,#1
 913  018e 260a          	jrne	L333
 914                     ; 225             UART2->CR1 |= itpos;
 916  0190 c65244        	ld	a,21060
 917  0193 1a02          	or	a,(OFST+0,sp)
 918  0195 c75244        	ld	21060,a
 920  0198 2066          	jra	L743
 921  019a               L333:
 922                     ; 227         else if (uartreg == 0x02)
 924  019a 7b01          	ld	a,(OFST-1,sp)
 925  019c a102          	cp	a,#2
 926  019e 260a          	jrne	L733
 927                     ; 229             UART2->CR2 |= itpos;
 929  01a0 c65245        	ld	a,21061
 930  01a3 1a02          	or	a,(OFST+0,sp)
 931  01a5 c75245        	ld	21061,a
 933  01a8 2056          	jra	L743
 934  01aa               L733:
 935                     ; 231         else if (uartreg == 0x03)
 937  01aa 7b01          	ld	a,(OFST-1,sp)
 938  01ac a103          	cp	a,#3
 939  01ae 260a          	jrne	L343
 940                     ; 233             UART2->CR4 |= itpos;
 942  01b0 c65247        	ld	a,21063
 943  01b3 1a02          	or	a,(OFST+0,sp)
 944  01b5 c75247        	ld	21063,a
 946  01b8 2046          	jra	L743
 947  01ba               L343:
 948                     ; 237             UART2->CR6 |= itpos;
 950  01ba c65249        	ld	a,21065
 951  01bd 1a02          	or	a,(OFST+0,sp)
 952  01bf c75249        	ld	21065,a
 953  01c2 203c          	jra	L743
 954  01c4               L133:
 955                     ; 243         if (uartreg == 0x01)
 957  01c4 7b01          	ld	a,(OFST-1,sp)
 958  01c6 a101          	cp	a,#1
 959  01c8 260b          	jrne	L153
 960                     ; 245             UART2->CR1 &= (uint8_t)(~itpos);
 962  01ca 7b02          	ld	a,(OFST+0,sp)
 963  01cc 43            	cpl	a
 964  01cd c45244        	and	a,21060
 965  01d0 c75244        	ld	21060,a
 967  01d3 202b          	jra	L743
 968  01d5               L153:
 969                     ; 247         else if (uartreg == 0x02)
 971  01d5 7b01          	ld	a,(OFST-1,sp)
 972  01d7 a102          	cp	a,#2
 973  01d9 260b          	jrne	L553
 974                     ; 249             UART2->CR2 &= (uint8_t)(~itpos);
 976  01db 7b02          	ld	a,(OFST+0,sp)
 977  01dd 43            	cpl	a
 978  01de c45245        	and	a,21061
 979  01e1 c75245        	ld	21061,a
 981  01e4 201a          	jra	L743
 982  01e6               L553:
 983                     ; 251         else if (uartreg == 0x03)
 985  01e6 7b01          	ld	a,(OFST-1,sp)
 986  01e8 a103          	cp	a,#3
 987  01ea 260b          	jrne	L163
 988                     ; 253             UART2->CR4 &= (uint8_t)(~itpos);
 990  01ec 7b02          	ld	a,(OFST+0,sp)
 991  01ee 43            	cpl	a
 992  01ef c45247        	and	a,21063
 993  01f2 c75247        	ld	21063,a
 995  01f5 2009          	jra	L743
 996  01f7               L163:
 997                     ; 257             UART2->CR6 &= (uint8_t)(~itpos);
 999  01f7 7b02          	ld	a,(OFST+0,sp)
1000  01f9 43            	cpl	a
1001  01fa c45249        	and	a,21065
1002  01fd c75249        	ld	21065,a
1003  0200               L743:
1004                     ; 260 }
1007  0200 5b04          	addw	sp,#4
1008  0202 81            	ret
1065                     ; 267 void UART2_IrDAConfig(UART2_IrDAMode_TypeDef UART2_IrDAMode)
1065                     ; 268 {
1066                     	switch	.text
1067  0203               _UART2_IrDAConfig:
1071                     ; 269     assert_param(IS_UART2_IRDAMODE_OK(UART2_IrDAMode));
1073                     ; 271     if (UART2_IrDAMode != UART2_IRDAMODE_NORMAL)
1075  0203 4d            	tnz	a
1076  0204 2706          	jreq	L314
1077                     ; 273         UART2->CR5 |= UART2_CR5_IRLP;
1079  0206 72145248      	bset	21064,#2
1081  020a 2004          	jra	L514
1082  020c               L314:
1083                     ; 277         UART2->CR5 &= ((uint8_t)~UART2_CR5_IRLP);
1085  020c 72155248      	bres	21064,#2
1086  0210               L514:
1087                     ; 279 }
1090  0210 81            	ret
1125                     ; 287 void UART2_IrDACmd(FunctionalState NewState)
1125                     ; 288 {
1126                     	switch	.text
1127  0211               _UART2_IrDACmd:
1131                     ; 290     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1133                     ; 292     if (NewState != DISABLE)
1135  0211 4d            	tnz	a
1136  0212 2706          	jreq	L534
1137                     ; 295         UART2->CR5 |= UART2_CR5_IREN;
1139  0214 72125248      	bset	21064,#1
1141  0218 2004          	jra	L734
1142  021a               L534:
1143                     ; 300         UART2->CR5 &= ((uint8_t)~UART2_CR5_IREN);
1145  021a 72135248      	bres	21064,#1
1146  021e               L734:
1147                     ; 302 }
1150  021e 81            	ret
1209                     ; 311 void UART2_LINBreakDetectionConfig(UART2_LINBreakDetectionLength_TypeDef UART2_LINBreakDetectionLength)
1209                     ; 312 {
1210                     	switch	.text
1211  021f               _UART2_LINBreakDetectionConfig:
1215                     ; 314     assert_param(IS_UART2_LINBREAKDETECTIONLENGTH_OK(UART2_LINBreakDetectionLength));
1217                     ; 316     if (UART2_LINBreakDetectionLength != UART2_LINBREAKDETECTIONLENGTH_10BITS)
1219  021f 4d            	tnz	a
1220  0220 2706          	jreq	L764
1221                     ; 318         UART2->CR4 |= UART2_CR4_LBDL;
1223  0222 721a5247      	bset	21063,#5
1225  0226 2004          	jra	L174
1226  0228               L764:
1227                     ; 322         UART2->CR4 &= ((uint8_t)~UART2_CR4_LBDL);
1229  0228 721b5247      	bres	21063,#5
1230  022c               L174:
1231                     ; 324 }
1234  022c 81            	ret
1355                     ; 336 void UART2_LINConfig(UART2_LinMode_TypeDef UART2_Mode, 
1355                     ; 337                      UART2_LinAutosync_TypeDef UART2_Autosync, 
1355                     ; 338                      UART2_LinDivUp_TypeDef UART2_DivUp)
1355                     ; 339 {
1356                     	switch	.text
1357  022d               _UART2_LINConfig:
1359  022d 89            	pushw	x
1360       00000000      OFST:	set	0
1363                     ; 341     assert_param(IS_UART2_SLAVE_OK(UART2_Mode));
1365                     ; 342     assert_param(IS_UART2_AUTOSYNC_OK(UART2_Autosync));
1367                     ; 343     assert_param(IS_UART2_DIVUP_OK(UART2_DivUp));
1369                     ; 345     if (UART2_Mode != UART2_LIN_MODE_MASTER)
1371  022e 9e            	ld	a,xh
1372  022f 4d            	tnz	a
1373  0230 2706          	jreq	L155
1374                     ; 347         UART2->CR6 |=  UART2_CR6_LSLV;
1376  0232 721a5249      	bset	21065,#5
1378  0236 2004          	jra	L355
1379  0238               L155:
1380                     ; 351         UART2->CR6 &= ((uint8_t)~UART2_CR6_LSLV);
1382  0238 721b5249      	bres	21065,#5
1383  023c               L355:
1384                     ; 354     if (UART2_Autosync != UART2_LIN_AUTOSYNC_DISABLE)
1386  023c 0d02          	tnz	(OFST+2,sp)
1387  023e 2706          	jreq	L555
1388                     ; 356         UART2->CR6 |=  UART2_CR6_LASE ;
1390  0240 72185249      	bset	21065,#4
1392  0244 2004          	jra	L755
1393  0246               L555:
1394                     ; 360         UART2->CR6 &= ((uint8_t)~ UART2_CR6_LASE );
1396  0246 72195249      	bres	21065,#4
1397  024a               L755:
1398                     ; 363     if (UART2_DivUp != UART2_LIN_DIVUP_LBRR1)
1400  024a 0d05          	tnz	(OFST+5,sp)
1401  024c 2706          	jreq	L165
1402                     ; 365         UART2->CR6 |=  UART2_CR6_LDUM;
1404  024e 721e5249      	bset	21065,#7
1406  0252 2004          	jra	L365
1407  0254               L165:
1408                     ; 369         UART2->CR6 &= ((uint8_t)~ UART2_CR6_LDUM);
1410  0254 721f5249      	bres	21065,#7
1411  0258               L365:
1412                     ; 371 }
1415  0258 85            	popw	x
1416  0259 81            	ret
1451                     ; 379 void UART2_LINCmd(FunctionalState NewState)
1451                     ; 380 {
1452                     	switch	.text
1453  025a               _UART2_LINCmd:
1457                     ; 381     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1459                     ; 383     if (NewState != DISABLE)
1461  025a 4d            	tnz	a
1462  025b 2706          	jreq	L306
1463                     ; 386         UART2->CR3 |= UART2_CR3_LINEN;
1465  025d 721c5246      	bset	21062,#6
1467  0261 2004          	jra	L506
1468  0263               L306:
1469                     ; 391         UART2->CR3 &= ((uint8_t)~UART2_CR3_LINEN);
1471  0263 721d5246      	bres	21062,#6
1472  0267               L506:
1473                     ; 393 }
1476  0267 81            	ret
1511                     ; 400 void UART2_SmartCardCmd(FunctionalState NewState)
1511                     ; 401 {
1512                     	switch	.text
1513  0268               _UART2_SmartCardCmd:
1517                     ; 403     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1519                     ; 405     if (NewState != DISABLE)
1521  0268 4d            	tnz	a
1522  0269 2706          	jreq	L526
1523                     ; 408         UART2->CR5 |= UART2_CR5_SCEN;
1525  026b 721a5248      	bset	21064,#5
1527  026f 2004          	jra	L726
1528  0271               L526:
1529                     ; 413         UART2->CR5 &= ((uint8_t)(~UART2_CR5_SCEN));
1531  0271 721b5248      	bres	21064,#5
1532  0275               L726:
1533                     ; 415 }
1536  0275 81            	ret
1572                     ; 423 void UART2_SmartCardNACKCmd(FunctionalState NewState)
1572                     ; 424 {
1573                     	switch	.text
1574  0276               _UART2_SmartCardNACKCmd:
1578                     ; 426     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1580                     ; 428     if (NewState != DISABLE)
1582  0276 4d            	tnz	a
1583  0277 2706          	jreq	L746
1584                     ; 431         UART2->CR5 |= UART2_CR5_NACK;
1586  0279 72185248      	bset	21064,#4
1588  027d 2004          	jra	L156
1589  027f               L746:
1590                     ; 436         UART2->CR5 &= ((uint8_t)~(UART2_CR5_NACK));
1592  027f 72195248      	bres	21064,#4
1593  0283               L156:
1594                     ; 438 }
1597  0283 81            	ret
1654                     ; 446 void UART2_WakeUpConfig(UART2_WakeUp_TypeDef UART2_WakeUp)
1654                     ; 447 {
1655                     	switch	.text
1656  0284               _UART2_WakeUpConfig:
1660                     ; 448     assert_param(IS_UART2_WAKEUP_OK(UART2_WakeUp));
1662                     ; 450     UART2->CR1 &= ((uint8_t)~UART2_CR1_WAKE);
1664  0284 72175244      	bres	21060,#3
1665                     ; 451     UART2->CR1 |= (uint8_t)UART2_WakeUp;
1667  0288 ca5244        	or	a,21060
1668  028b c75244        	ld	21060,a
1669                     ; 452 }
1672  028e 81            	ret
1708                     ; 460 void UART2_ReceiverWakeUpCmd(FunctionalState NewState)
1708                     ; 461 {
1709                     	switch	.text
1710  028f               _UART2_ReceiverWakeUpCmd:
1714                     ; 462     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1716                     ; 464     if (NewState != DISABLE)
1718  028f 4d            	tnz	a
1719  0290 2706          	jreq	L717
1720                     ; 467         UART2->CR2 |= UART2_CR2_RWU;
1722  0292 72125245      	bset	21061,#1
1724  0296 2004          	jra	L127
1725  0298               L717:
1726                     ; 472         UART2->CR2 &= ((uint8_t)~UART2_CR2_RWU);
1728  0298 72135245      	bres	21061,#1
1729  029c               L127:
1730                     ; 474 }
1733  029c 81            	ret
1756                     ; 481 uint8_t UART2_ReceiveData8(void)
1756                     ; 482 {
1757                     	switch	.text
1758  029d               _UART2_ReceiveData8:
1762                     ; 483     return ((uint8_t)UART2->DR);
1764  029d c65241        	ld	a,21057
1767  02a0 81            	ret
1801                     ; 491 uint16_t UART2_ReceiveData9(void)
1801                     ; 492 {
1802                     	switch	.text
1803  02a1               _UART2_ReceiveData9:
1805  02a1 89            	pushw	x
1806       00000002      OFST:	set	2
1809                     ; 493   uint16_t temp = 0;
1811                     ; 495   temp = ((uint16_t)(((uint16_t)((uint16_t)UART2->CR1 & (uint16_t)UART2_CR1_R8)) << 1));
1813  02a2 c65244        	ld	a,21060
1814  02a5 5f            	clrw	x
1815  02a6 a480          	and	a,#128
1816  02a8 5f            	clrw	x
1817  02a9 02            	rlwa	x,a
1818  02aa 58            	sllw	x
1819  02ab 1f01          	ldw	(OFST-1,sp),x
1821                     ; 497   return (uint16_t)((((uint16_t)UART2->DR) | temp) & ((uint16_t)0x01FF));
1823  02ad c65241        	ld	a,21057
1824  02b0 5f            	clrw	x
1825  02b1 97            	ld	xl,a
1826  02b2 01            	rrwa	x,a
1827  02b3 1a02          	or	a,(OFST+0,sp)
1828  02b5 01            	rrwa	x,a
1829  02b6 1a01          	or	a,(OFST-1,sp)
1830  02b8 01            	rrwa	x,a
1831  02b9 01            	rrwa	x,a
1832  02ba a4ff          	and	a,#255
1833  02bc 01            	rrwa	x,a
1834  02bd a401          	and	a,#1
1835  02bf 01            	rrwa	x,a
1838  02c0 5b02          	addw	sp,#2
1839  02c2 81            	ret
1873                     ; 505 void UART2_SendData8(uint8_t Data)
1873                     ; 506 {
1874                     	switch	.text
1875  02c3               _UART2_SendData8:
1879                     ; 508     UART2->DR = Data;
1881  02c3 c75241        	ld	21057,a
1882                     ; 509 }
1885  02c6 81            	ret
1919                     ; 516 void UART2_SendData9(uint16_t Data)
1919                     ; 517 {
1920                     	switch	.text
1921  02c7               _UART2_SendData9:
1923  02c7 89            	pushw	x
1924       00000000      OFST:	set	0
1927                     ; 519     UART2->CR1 &= ((uint8_t)~UART2_CR1_T8);                  
1929  02c8 721d5244      	bres	21060,#6
1930                     ; 522     UART2->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART2_CR1_T8); 
1932  02cc 54            	srlw	x
1933  02cd 54            	srlw	x
1934  02ce 9f            	ld	a,xl
1935  02cf a440          	and	a,#64
1936  02d1 ca5244        	or	a,21060
1937  02d4 c75244        	ld	21060,a
1938                     ; 525     UART2->DR   = (uint8_t)(Data);                    
1940  02d7 7b02          	ld	a,(OFST+2,sp)
1941  02d9 c75241        	ld	21057,a
1942                     ; 527 }
1945  02dc 85            	popw	x
1946  02dd 81            	ret
1969                     ; 534 void UART2_SendBreak(void)
1969                     ; 535 {
1970                     	switch	.text
1971  02de               _UART2_SendBreak:
1975                     ; 536     UART2->CR2 |= UART2_CR2_SBK;
1977  02de 72105245      	bset	21061,#0
1978                     ; 537 }
1981  02e2 81            	ret
2015                     ; 544 void UART2_SetAddress(uint8_t UART2_Address)
2015                     ; 545 {
2016                     	switch	.text
2017  02e3               _UART2_SetAddress:
2019  02e3 88            	push	a
2020       00000000      OFST:	set	0
2023                     ; 547     assert_param(IS_UART2_ADDRESS_OK(UART2_Address));
2025                     ; 550     UART2->CR4 &= ((uint8_t)~UART2_CR4_ADD);
2027  02e4 c65247        	ld	a,21063
2028  02e7 a4f0          	and	a,#240
2029  02e9 c75247        	ld	21063,a
2030                     ; 552     UART2->CR4 |= UART2_Address;
2032  02ec c65247        	ld	a,21063
2033  02ef 1a01          	or	a,(OFST+1,sp)
2034  02f1 c75247        	ld	21063,a
2035                     ; 553 }
2038  02f4 84            	pop	a
2039  02f5 81            	ret
2073                     ; 561 void UART2_SetGuardTime(uint8_t UART2_GuardTime)
2073                     ; 562 {
2074                     	switch	.text
2075  02f6               _UART2_SetGuardTime:
2079                     ; 564     UART2->GTR = UART2_GuardTime;
2081  02f6 c7524a        	ld	21066,a
2082                     ; 565 }
2085  02f9 81            	ret
2119                     ; 589 void UART2_SetPrescaler(uint8_t UART2_Prescaler)
2119                     ; 590 {
2120                     	switch	.text
2121  02fa               _UART2_SetPrescaler:
2125                     ; 592     UART2->PSCR = UART2_Prescaler;
2127  02fa c7524b        	ld	21067,a
2128                     ; 593 }
2131  02fd 81            	ret
2288                     ; 601 FlagStatus UART2_GetFlagStatus(UART2_Flag_TypeDef UART2_FLAG)
2288                     ; 602 {
2289                     	switch	.text
2290  02fe               _UART2_GetFlagStatus:
2292  02fe 89            	pushw	x
2293  02ff 88            	push	a
2294       00000001      OFST:	set	1
2297                     ; 603     FlagStatus status = RESET;
2299                     ; 606     assert_param(IS_UART2_FLAG_OK(UART2_FLAG));
2301                     ; 609     if (UART2_FLAG == UART2_FLAG_LBDF)
2303  0300 a30210        	cpw	x,#528
2304  0303 2610          	jrne	L5511
2305                     ; 611         if ((UART2->CR4 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2307  0305 9f            	ld	a,xl
2308  0306 c45247        	and	a,21063
2309  0309 2706          	jreq	L7511
2310                     ; 614             status = SET;
2312  030b a601          	ld	a,#1
2313  030d 6b01          	ld	(OFST+0,sp),a
2316  030f 2039          	jra	L3611
2317  0311               L7511:
2318                     ; 619             status = RESET;
2320  0311 0f01          	clr	(OFST+0,sp)
2322  0313 2035          	jra	L3611
2323  0315               L5511:
2324                     ; 622     else if (UART2_FLAG == UART2_FLAG_SBK)
2326  0315 1e02          	ldw	x,(OFST+1,sp)
2327  0317 a30101        	cpw	x,#257
2328  031a 2611          	jrne	L5611
2329                     ; 624         if ((UART2->CR2 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2331  031c c65245        	ld	a,21061
2332  031f 1503          	bcp	a,(OFST+2,sp)
2333  0321 2706          	jreq	L7611
2334                     ; 627             status = SET;
2336  0323 a601          	ld	a,#1
2337  0325 6b01          	ld	(OFST+0,sp),a
2340  0327 2021          	jra	L3611
2341  0329               L7611:
2342                     ; 632             status = RESET;
2344  0329 0f01          	clr	(OFST+0,sp)
2346  032b 201d          	jra	L3611
2347  032d               L5611:
2348                     ; 635     else if ((UART2_FLAG == UART2_FLAG_LHDF) || (UART2_FLAG == UART2_FLAG_LSF))
2350  032d 1e02          	ldw	x,(OFST+1,sp)
2351  032f a30302        	cpw	x,#770
2352  0332 2707          	jreq	L7711
2354  0334 1e02          	ldw	x,(OFST+1,sp)
2355  0336 a30301        	cpw	x,#769
2356  0339 2614          	jrne	L5711
2357  033b               L7711:
2358                     ; 637         if ((UART2->CR6 & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2360  033b c65249        	ld	a,21065
2361  033e 1503          	bcp	a,(OFST+2,sp)
2362  0340 2706          	jreq	L1021
2363                     ; 640             status = SET;
2365  0342 a601          	ld	a,#1
2366  0344 6b01          	ld	(OFST+0,sp),a
2369  0346 2002          	jra	L3611
2370  0348               L1021:
2371                     ; 645             status = RESET;
2373  0348 0f01          	clr	(OFST+0,sp)
2375  034a               L3611:
2376                     ; 663     return  status;
2378  034a 7b01          	ld	a,(OFST+0,sp)
2381  034c 5b03          	addw	sp,#3
2382  034e 81            	ret
2383  034f               L5711:
2384                     ; 650         if ((UART2->SR & (uint8_t)UART2_FLAG) != (uint8_t)0x00)
2386  034f c65240        	ld	a,21056
2387  0352 1503          	bcp	a,(OFST+2,sp)
2388  0354 2706          	jreq	L7021
2389                     ; 653             status = SET;
2391  0356 a601          	ld	a,#1
2392  0358 6b01          	ld	(OFST+0,sp),a
2395  035a 20ee          	jra	L3611
2396  035c               L7021:
2397                     ; 658             status = RESET;
2399  035c 0f01          	clr	(OFST+0,sp)
2401  035e 20ea          	jra	L3611
2436                     ; 693 void UART2_ClearFlag(UART2_Flag_TypeDef UART2_FLAG)
2436                     ; 694 {
2437                     	switch	.text
2438  0360               _UART2_ClearFlag:
2440  0360 89            	pushw	x
2441       00000000      OFST:	set	0
2444                     ; 695     assert_param(IS_UART2_CLEAR_FLAG_OK(UART2_FLAG));
2446                     ; 698     if (UART2_FLAG == UART2_FLAG_RXNE)
2448  0361 a30020        	cpw	x,#32
2449  0364 2606          	jrne	L1321
2450                     ; 700         UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2452  0366 35df5240      	mov	21056,#223
2454  036a 201e          	jra	L3321
2455  036c               L1321:
2456                     ; 703     else if (UART2_FLAG == UART2_FLAG_LBDF)
2458  036c 1e01          	ldw	x,(OFST+1,sp)
2459  036e a30210        	cpw	x,#528
2460  0371 2606          	jrne	L5321
2461                     ; 705         UART2->CR4 &= (uint8_t)(~UART2_CR4_LBDF);
2463  0373 72195247      	bres	21063,#4
2465  0377 2011          	jra	L3321
2466  0379               L5321:
2467                     ; 708     else if (UART2_FLAG == UART2_FLAG_LHDF)
2469  0379 1e01          	ldw	x,(OFST+1,sp)
2470  037b a30302        	cpw	x,#770
2471  037e 2606          	jrne	L1421
2472                     ; 710         UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2474  0380 72135249      	bres	21065,#1
2476  0384 2004          	jra	L3321
2477  0386               L1421:
2478                     ; 715         UART2->CR6 &= (uint8_t)(~UART2_CR6_LSF);
2480  0386 72115249      	bres	21065,#0
2481  038a               L3321:
2482                     ; 717 }
2485  038a 85            	popw	x
2486  038b 81            	ret
2568                     ; 732 ITStatus UART2_GetITStatus(UART2_IT_TypeDef UART2_IT)
2568                     ; 733 {
2569                     	switch	.text
2570  038c               _UART2_GetITStatus:
2572  038c 89            	pushw	x
2573  038d 89            	pushw	x
2574       00000002      OFST:	set	2
2577                     ; 734     ITStatus pendingbitstatus = RESET;
2579                     ; 735     uint8_t itpos = 0;
2581                     ; 736     uint8_t itmask1 = 0;
2583                     ; 737     uint8_t itmask2 = 0;
2585                     ; 738     uint8_t enablestatus = 0;
2587                     ; 741     assert_param(IS_UART2_GET_IT_OK(UART2_IT));
2589                     ; 744     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART2_IT & (uint8_t)0x0F));
2591  038e 9f            	ld	a,xl
2592  038f a40f          	and	a,#15
2593  0391 5f            	clrw	x
2594  0392 97            	ld	xl,a
2595  0393 a601          	ld	a,#1
2596  0395 5d            	tnzw	x
2597  0396 2704          	jreq	L27
2598  0398               L47:
2599  0398 48            	sll	a
2600  0399 5a            	decw	x
2601  039a 26fc          	jrne	L47
2602  039c               L27:
2603  039c 6b01          	ld	(OFST-1,sp),a
2605                     ; 746     itmask1 = (uint8_t)((uint8_t)UART2_IT >> (uint8_t)4);
2607  039e 7b04          	ld	a,(OFST+2,sp)
2608  03a0 4e            	swap	a
2609  03a1 a40f          	and	a,#15
2610  03a3 6b02          	ld	(OFST+0,sp),a
2612                     ; 748     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2614  03a5 7b02          	ld	a,(OFST+0,sp)
2615  03a7 5f            	clrw	x
2616  03a8 97            	ld	xl,a
2617  03a9 a601          	ld	a,#1
2618  03ab 5d            	tnzw	x
2619  03ac 2704          	jreq	L67
2620  03ae               L001:
2621  03ae 48            	sll	a
2622  03af 5a            	decw	x
2623  03b0 26fc          	jrne	L001
2624  03b2               L67:
2625  03b2 6b02          	ld	(OFST+0,sp),a
2627                     ; 751     if (UART2_IT == UART2_IT_PE)
2629  03b4 1e03          	ldw	x,(OFST+1,sp)
2630  03b6 a30100        	cpw	x,#256
2631  03b9 261c          	jrne	L7031
2632                     ; 754         enablestatus = (uint8_t)((uint8_t)UART2->CR1 & itmask2);
2634  03bb c65244        	ld	a,21060
2635  03be 1402          	and	a,(OFST+0,sp)
2636  03c0 6b02          	ld	(OFST+0,sp),a
2638                     ; 757         if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2640  03c2 c65240        	ld	a,21056
2641  03c5 1501          	bcp	a,(OFST-1,sp)
2642  03c7 270a          	jreq	L1131
2644  03c9 0d02          	tnz	(OFST+0,sp)
2645  03cb 2706          	jreq	L1131
2646                     ; 760             pendingbitstatus = SET;
2648  03cd a601          	ld	a,#1
2649  03cf 6b02          	ld	(OFST+0,sp),a
2652  03d1 2064          	jra	L5131
2653  03d3               L1131:
2654                     ; 765             pendingbitstatus = RESET;
2656  03d3 0f02          	clr	(OFST+0,sp)
2658  03d5 2060          	jra	L5131
2659  03d7               L7031:
2660                     ; 768     else if (UART2_IT == UART2_IT_LBDF)
2662  03d7 1e03          	ldw	x,(OFST+1,sp)
2663  03d9 a30346        	cpw	x,#838
2664  03dc 261c          	jrne	L7131
2665                     ; 771         enablestatus = (uint8_t)((uint8_t)UART2->CR4 & itmask2);
2667  03de c65247        	ld	a,21063
2668  03e1 1402          	and	a,(OFST+0,sp)
2669  03e3 6b02          	ld	(OFST+0,sp),a
2671                     ; 773         if (((UART2->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2673  03e5 c65247        	ld	a,21063
2674  03e8 1501          	bcp	a,(OFST-1,sp)
2675  03ea 270a          	jreq	L1231
2677  03ec 0d02          	tnz	(OFST+0,sp)
2678  03ee 2706          	jreq	L1231
2679                     ; 776             pendingbitstatus = SET;
2681  03f0 a601          	ld	a,#1
2682  03f2 6b02          	ld	(OFST+0,sp),a
2685  03f4 2041          	jra	L5131
2686  03f6               L1231:
2687                     ; 781             pendingbitstatus = RESET;
2689  03f6 0f02          	clr	(OFST+0,sp)
2691  03f8 203d          	jra	L5131
2692  03fa               L7131:
2693                     ; 784     else if (UART2_IT == UART2_IT_LHDF)
2695  03fa 1e03          	ldw	x,(OFST+1,sp)
2696  03fc a30412        	cpw	x,#1042
2697  03ff 261c          	jrne	L7231
2698                     ; 787         enablestatus = (uint8_t)((uint8_t)UART2->CR6 & itmask2);
2700  0401 c65249        	ld	a,21065
2701  0404 1402          	and	a,(OFST+0,sp)
2702  0406 6b02          	ld	(OFST+0,sp),a
2704                     ; 789         if (((UART2->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2706  0408 c65249        	ld	a,21065
2707  040b 1501          	bcp	a,(OFST-1,sp)
2708  040d 270a          	jreq	L1331
2710  040f 0d02          	tnz	(OFST+0,sp)
2711  0411 2706          	jreq	L1331
2712                     ; 792             pendingbitstatus = SET;
2714  0413 a601          	ld	a,#1
2715  0415 6b02          	ld	(OFST+0,sp),a
2718  0417 201e          	jra	L5131
2719  0419               L1331:
2720                     ; 797             pendingbitstatus = RESET;
2722  0419 0f02          	clr	(OFST+0,sp)
2724  041b 201a          	jra	L5131
2725  041d               L7231:
2726                     ; 803         enablestatus = (uint8_t)((uint8_t)UART2->CR2 & itmask2);
2728  041d c65245        	ld	a,21061
2729  0420 1402          	and	a,(OFST+0,sp)
2730  0422 6b02          	ld	(OFST+0,sp),a
2732                     ; 805         if (((UART2->SR & itpos) != (uint8_t)0x00) && enablestatus)
2734  0424 c65240        	ld	a,21056
2735  0427 1501          	bcp	a,(OFST-1,sp)
2736  0429 270a          	jreq	L7331
2738  042b 0d02          	tnz	(OFST+0,sp)
2739  042d 2706          	jreq	L7331
2740                     ; 808             pendingbitstatus = SET;
2742  042f a601          	ld	a,#1
2743  0431 6b02          	ld	(OFST+0,sp),a
2746  0433 2002          	jra	L5131
2747  0435               L7331:
2748                     ; 813             pendingbitstatus = RESET;
2750  0435 0f02          	clr	(OFST+0,sp)
2752  0437               L5131:
2753                     ; 817     return  pendingbitstatus;
2755  0437 7b02          	ld	a,(OFST+0,sp)
2758  0439 5b04          	addw	sp,#4
2759  043b 81            	ret
2795                     ; 846 void UART2_ClearITPendingBit(UART2_IT_TypeDef UART2_IT)
2795                     ; 847 {
2796                     	switch	.text
2797  043c               _UART2_ClearITPendingBit:
2799  043c 89            	pushw	x
2800       00000000      OFST:	set	0
2803                     ; 848     assert_param(IS_UART2_CLEAR_IT_OK(UART2_IT));
2805                     ; 851     if (UART2_IT == UART2_IT_RXNE)
2807  043d a30255        	cpw	x,#597
2808  0440 2606          	jrne	L1631
2809                     ; 853         UART2->SR = (uint8_t)~(UART2_SR_RXNE);
2811  0442 35df5240      	mov	21056,#223
2813  0446 2011          	jra	L3631
2814  0448               L1631:
2815                     ; 856     else if (UART2_IT == UART2_IT_LBDF)
2817  0448 1e01          	ldw	x,(OFST+1,sp)
2818  044a a30346        	cpw	x,#838
2819  044d 2606          	jrne	L5631
2820                     ; 858         UART2->CR4 &= (uint8_t)~(UART2_CR4_LBDF);
2822  044f 72195247      	bres	21063,#4
2824  0453 2004          	jra	L3631
2825  0455               L5631:
2826                     ; 863         UART2->CR6 &= (uint8_t)(~UART2_CR6_LHDF);
2828  0455 72135249      	bres	21065,#1
2829  0459               L3631:
2830                     ; 865 }
2833  0459 85            	popw	x
2834  045a 81            	ret
2847                     	xdef	_UART2_ClearITPendingBit
2848                     	xdef	_UART2_GetITStatus
2849                     	xdef	_UART2_ClearFlag
2850                     	xdef	_UART2_GetFlagStatus
2851                     	xdef	_UART2_SetPrescaler
2852                     	xdef	_UART2_SetGuardTime
2853                     	xdef	_UART2_SetAddress
2854                     	xdef	_UART2_SendBreak
2855                     	xdef	_UART2_SendData9
2856                     	xdef	_UART2_SendData8
2857                     	xdef	_UART2_ReceiveData9
2858                     	xdef	_UART2_ReceiveData8
2859                     	xdef	_UART2_ReceiverWakeUpCmd
2860                     	xdef	_UART2_WakeUpConfig
2861                     	xdef	_UART2_SmartCardNACKCmd
2862                     	xdef	_UART2_SmartCardCmd
2863                     	xdef	_UART2_LINCmd
2864                     	xdef	_UART2_LINConfig
2865                     	xdef	_UART2_LINBreakDetectionConfig
2866                     	xdef	_UART2_IrDACmd
2867                     	xdef	_UART2_IrDAConfig
2868                     	xdef	_UART2_ITConfig
2869                     	xdef	_UART2_Cmd
2870                     	xdef	_UART2_Init
2871                     	xdef	_UART2_DeInit
2872                     	xref	_CLK_GetClockFreq
2873                     	xref.b	c_lreg
2874                     	xref.b	c_x
2893                     	xref	c_lursh
2894                     	xref	c_lsub
2895                     	xref	c_smul
2896                     	xref	c_ludv
2897                     	xref	c_rtol
2898                     	xref	c_llsh
2899                     	xref	c_ltor
2900                     	end
