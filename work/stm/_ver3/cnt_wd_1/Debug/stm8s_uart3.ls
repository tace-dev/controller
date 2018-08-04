   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  51                     ; 48 void UART3_DeInit(void)
  51                     ; 49 {
  53                     .text:	section	.text,new
  54  0000               _UART3_DeInit:
  58                     ; 52     (void) UART3->SR;
  60  0000 c65240        	ld	a,21056
  61                     ; 53     (void) UART3->DR;
  63  0003 c65241        	ld	a,21057
  64                     ; 55     UART3->BRR2 = UART3_BRR2_RESET_VALUE; /*Set UART3_BRR2 to reset value 0x00 */
  66  0006 725f5243      	clr	21059
  67                     ; 56     UART3->BRR1 = UART3_BRR1_RESET_VALUE; /*Set UART3_BRR1 to reset value 0x00 */
  69  000a 725f5242      	clr	21058
  70                     ; 58     UART3->CR1 = UART3_CR1_RESET_VALUE;  /*Set UART3_CR1 to reset value 0x00  */
  72  000e 725f5244      	clr	21060
  73                     ; 59     UART3->CR2 = UART3_CR2_RESET_VALUE;  /*Set UART3_CR2 to reset value 0x00  */
  75  0012 725f5245      	clr	21061
  76                     ; 60     UART3->CR3 = UART3_CR3_RESET_VALUE;  /*Set UART3_CR3 to reset value 0x00  */
  78  0016 725f5246      	clr	21062
  79                     ; 61     UART3->CR4 = UART3_CR4_RESET_VALUE;  /*Set UART3_CR4 to reset value 0x00  */
  81  001a 725f5247      	clr	21063
  82                     ; 62     UART3->CR6 = UART3_CR6_RESET_VALUE;  /*Set UART3_CR6 to reset value 0x00  */
  84  001e 725f5249      	clr	21065
  85                     ; 64 }
  88  0022 81            	ret	
 305                     .const:	section	.text
 306  0000               L41:
 307  0000 00000064      	dc.l	100
 308                     ; 78 void UART3_Init(uint32_t BaudRate, UART3_WordLength_TypeDef WordLength, 
 308                     ; 79                 UART3_StopBits_TypeDef StopBits, UART3_Parity_TypeDef Parity, 
 308                     ; 80                 UART3_Mode_TypeDef Mode)
 308                     ; 81 {
 309                     .text:	section	.text,new
 310  0000               _UART3_Init:
 312  0000 520e          	subw	sp,#14
 313       0000000e      OFST:	set	14
 316                     ; 82     uint8_t BRR2_1 = 0, BRR2_2 = 0;
 320                     ; 83     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 324                     ; 86     assert_param(IS_UART3_WORDLENGTH_OK(WordLength));
 326                     ; 87     assert_param(IS_UART3_STOPBITS_OK(StopBits));
 328                     ; 88     assert_param(IS_UART3_PARITY_OK(Parity));
 330                     ; 89     assert_param(IS_UART3_BAUDRATE_OK(BaudRate));
 332                     ; 90     assert_param(IS_UART3_MODE_OK((uint8_t)Mode));
 334                     ; 93     UART3->CR1 &= (uint8_t)(~UART3_CR1_M);     
 336  0002 72195244      	bres	21060,#4
 337                     ; 95     UART3->CR1 |= (uint8_t)WordLength; 
 339  0006 c65244        	ld	a,21060
 340  0009 1a15          	or	a,(OFST+7,sp)
 341  000b c75244        	ld	21060,a
 342                     ; 98     UART3->CR3 &= (uint8_t)(~UART3_CR3_STOP);  
 344  000e c65246        	ld	a,21062
 345  0011 a4cf          	and	a,#207
 346  0013 c75246        	ld	21062,a
 347                     ; 100     UART3->CR3 |= (uint8_t)StopBits;  
 349  0016 c65246        	ld	a,21062
 350  0019 1a16          	or	a,(OFST+8,sp)
 351  001b c75246        	ld	21062,a
 352                     ; 103     UART3->CR1 &= (uint8_t)(~(UART3_CR1_PCEN | UART3_CR1_PS));  
 354  001e c65244        	ld	a,21060
 355  0021 a4f9          	and	a,#249
 356  0023 c75244        	ld	21060,a
 357                     ; 105     UART3->CR1 |= (uint8_t)Parity;     
 359  0026 c65244        	ld	a,21060
 360  0029 1a17          	or	a,(OFST+9,sp)
 361  002b c75244        	ld	21060,a
 362                     ; 108     UART3->BRR1 &= (uint8_t)(~UART3_BRR1_DIVM);  
 364  002e 725f5242      	clr	21058
 365                     ; 110     UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVM);  
 367  0032 c65243        	ld	a,21059
 368  0035 a40f          	and	a,#15
 369  0037 c75243        	ld	21059,a
 370                     ; 112     UART3->BRR2 &= (uint8_t)(~UART3_BRR2_DIVF);  
 372  003a c65243        	ld	a,21059
 373  003d a4f0          	and	a,#240
 374  003f c75243        	ld	21059,a
 375                     ; 115     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 377  0042 96            	ldw	x,sp
 378  0043 cd00ea        	call	LC001
 380  0046 96            	ldw	x,sp
 381  0047 5c            	incw	x
 382  0048 cd0000        	call	c_rtol
 384  004b cd0000        	call	_CLK_GetClockFreq
 386  004e 96            	ldw	x,sp
 387  004f 5c            	incw	x
 388  0050 cd0000        	call	c_ludv
 390  0053 96            	ldw	x,sp
 391  0054 1c000b        	addw	x,#OFST-3
 392  0057 cd0000        	call	c_rtol
 394                     ; 116     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 396  005a 96            	ldw	x,sp
 397  005b cd00ea        	call	LC001
 399  005e 96            	ldw	x,sp
 400  005f 5c            	incw	x
 401  0060 cd0000        	call	c_rtol
 403  0063 cd0000        	call	_CLK_GetClockFreq
 405  0066 a664          	ld	a,#100
 406  0068 cd0000        	call	c_smul
 408  006b 96            	ldw	x,sp
 409  006c 5c            	incw	x
 410  006d cd0000        	call	c_ludv
 412  0070 96            	ldw	x,sp
 413  0071 1c0007        	addw	x,#OFST-7
 414  0074 cd0000        	call	c_rtol
 416                     ; 119     BRR2_1 = (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100))
 416                     ; 120                         << 4) / 100) & (uint8_t)0x0F); 
 418  0077 96            	ldw	x,sp
 419  0078 1c000b        	addw	x,#OFST-3
 420  007b cd0000        	call	c_ltor
 422  007e a664          	ld	a,#100
 423  0080 cd0000        	call	c_smul
 425  0083 96            	ldw	x,sp
 426  0084 5c            	incw	x
 427  0085 cd0000        	call	c_rtol
 429  0088 96            	ldw	x,sp
 430  0089 1c0007        	addw	x,#OFST-7
 431  008c cd0000        	call	c_ltor
 433  008f 96            	ldw	x,sp
 434  0090 5c            	incw	x
 435  0091 cd0000        	call	c_lsub
 437  0094 a604          	ld	a,#4
 438  0096 cd0000        	call	c_llsh
 440  0099 ae0000        	ldw	x,#L41
 441  009c cd0000        	call	c_ludv
 443  009f b603          	ld	a,c_lreg+3
 444  00a1 a40f          	and	a,#15
 445  00a3 6b05          	ld	(OFST-9,sp),a
 446                     ; 121     BRR2_2 = (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0);
 448  00a5 96            	ldw	x,sp
 449  00a6 1c000b        	addw	x,#OFST-3
 450  00a9 cd0000        	call	c_ltor
 452  00ac a604          	ld	a,#4
 453  00ae cd0000        	call	c_lursh
 455  00b1 b603          	ld	a,c_lreg+3
 456  00b3 a4f0          	and	a,#240
 457  00b5 b703          	ld	c_lreg+3,a
 458  00b7 3f02          	clr	c_lreg+2
 459  00b9 3f01          	clr	c_lreg+1
 460  00bb 3f00          	clr	c_lreg
 461  00bd 6b06          	ld	(OFST-8,sp),a
 462                     ; 123     UART3->BRR2 = (uint8_t)(BRR2_1 | BRR2_2);
 464  00bf 1a05          	or	a,(OFST-9,sp)
 465  00c1 c75243        	ld	21059,a
 466                     ; 125     UART3->BRR1 = (uint8_t)BaudRate_Mantissa;           
 468  00c4 7b0e          	ld	a,(OFST+0,sp)
 469  00c6 c75242        	ld	21058,a
 470                     ; 127     if ((uint8_t)(Mode & UART3_MODE_TX_ENABLE))
 472  00c9 7b18          	ld	a,(OFST+10,sp)
 473  00cb a504          	bcp	a,#4
 474  00cd 2706          	jreq	L531
 475                     ; 130         UART3->CR2 |= UART3_CR2_TEN;  
 477  00cf 72165245      	bset	21061,#3
 479  00d3 2004          	jra	L731
 480  00d5               L531:
 481                     ; 135         UART3->CR2 &= (uint8_t)(~UART3_CR2_TEN);  
 483  00d5 72175245      	bres	21061,#3
 484  00d9               L731:
 485                     ; 137     if ((uint8_t)(Mode & UART3_MODE_RX_ENABLE))
 487  00d9 a508          	bcp	a,#8
 488  00db 2706          	jreq	L141
 489                     ; 140         UART3->CR2 |= UART3_CR2_REN;  
 491  00dd 72145245      	bset	21061,#2
 493  00e1 2004          	jra	L341
 494  00e3               L141:
 495                     ; 145         UART3->CR2 &= (uint8_t)(~UART3_CR2_REN);  
 497  00e3 72155245      	bres	21061,#2
 498  00e7               L341:
 499                     ; 147 }
 502  00e7 5b0e          	addw	sp,#14
 503  00e9 81            	ret	
 504  00ea               LC001:
 505  00ea 1c0011        	addw	x,#OFST+3
 506  00ed cd0000        	call	c_ltor
 508  00f0 a604          	ld	a,#4
 509  00f2 cc0000        	jp	c_llsh
 564                     ; 155 void UART3_Cmd(FunctionalState NewState)
 564                     ; 156 {
 565                     .text:	section	.text,new
 566  0000               _UART3_Cmd:
 570                     ; 158     if (NewState != DISABLE)
 572  0000 4d            	tnz	a
 573  0001 2705          	jreq	L371
 574                     ; 161         UART3->CR1 &= (uint8_t)(~UART3_CR1_UARTD); 
 576  0003 721b5244      	bres	21060,#5
 579  0007 81            	ret	
 580  0008               L371:
 581                     ; 166         UART3->CR1 |= UART3_CR1_UARTD;  
 583  0008 721a5244      	bset	21060,#5
 584                     ; 168 }
 587  000c 81            	ret	
 715                     ; 185 void UART3_ITConfig(UART3_IT_TypeDef UART3_IT, FunctionalState NewState)
 715                     ; 186 {
 716                     .text:	section	.text,new
 717  0000               _UART3_ITConfig:
 719  0000 89            	pushw	x
 720  0001 89            	pushw	x
 721       00000002      OFST:	set	2
 724                     ; 187     uint8_t uartreg = 0, itpos = 0x00;
 728                     ; 190     assert_param(IS_UART3_CONFIG_IT_OK(UART3_IT));
 730                     ; 191     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 732                     ; 194     uartreg = (uint8_t)((uint16_t)UART3_IT >> 0x08);
 734  0002 9e            	ld	a,xh
 735  0003 6b01          	ld	(OFST-1,sp),a
 736                     ; 197     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
 738  0005 9f            	ld	a,xl
 739  0006 a40f          	and	a,#15
 740  0008 5f            	clrw	x
 741  0009 97            	ld	xl,a
 742  000a a601          	ld	a,#1
 743  000c 5d            	tnzw	x
 744  000d 2704          	jreq	L22
 745  000f               L42:
 746  000f 48            	sll	a
 747  0010 5a            	decw	x
 748  0011 26fc          	jrne	L42
 749  0013               L22:
 750  0013 6b02          	ld	(OFST+0,sp),a
 751                     ; 199     if (NewState != DISABLE)
 753  0015 7b07          	ld	a,(OFST+5,sp)
 754  0017 272a          	jreq	L352
 755                     ; 202         if (uartreg == 0x01)
 757  0019 7b01          	ld	a,(OFST-1,sp)
 758  001b a101          	cp	a,#1
 759  001d 2607          	jrne	L552
 760                     ; 204             UART3->CR1 |= itpos;
 762  001f c65244        	ld	a,21060
 763  0022 1a02          	or	a,(OFST+0,sp)
 765  0024 2029          	jp	LC004
 766  0026               L552:
 767                     ; 206         else if (uartreg == 0x02)
 769  0026 a102          	cp	a,#2
 770  0028 2607          	jrne	L162
 771                     ; 208             UART3->CR2 |= itpos;
 773  002a c65245        	ld	a,21061
 774  002d 1a02          	or	a,(OFST+0,sp)
 776  002f 202d          	jp	LC003
 777  0031               L162:
 778                     ; 210         else if (uartreg == 0x03)
 780  0031 a103          	cp	a,#3
 781  0033 2607          	jrne	L562
 782                     ; 212             UART3->CR4 |= itpos;
 784  0035 c65247        	ld	a,21063
 785  0038 1a02          	or	a,(OFST+0,sp)
 787  003a 2031          	jp	LC005
 788  003c               L562:
 789                     ; 216             UART3->CR6 |= itpos;
 791  003c c65249        	ld	a,21065
 792  003f 1a02          	or	a,(OFST+0,sp)
 793  0041 2035          	jp	LC002
 794  0043               L352:
 795                     ; 222         if (uartreg == 0x01)
 797  0043 7b01          	ld	a,(OFST-1,sp)
 798  0045 a101          	cp	a,#1
 799  0047 260b          	jrne	L372
 800                     ; 224             UART3->CR1 &= (uint8_t)(~itpos);
 802  0049 7b02          	ld	a,(OFST+0,sp)
 803  004b 43            	cpl	a
 804  004c c45244        	and	a,21060
 805  004f               LC004:
 806  004f c75244        	ld	21060,a
 808  0052 2027          	jra	L172
 809  0054               L372:
 810                     ; 226         else if (uartreg == 0x02)
 812  0054 a102          	cp	a,#2
 813  0056 260b          	jrne	L772
 814                     ; 228             UART3->CR2 &= (uint8_t)(~itpos);
 816  0058 7b02          	ld	a,(OFST+0,sp)
 817  005a 43            	cpl	a
 818  005b c45245        	and	a,21061
 819  005e               LC003:
 820  005e c75245        	ld	21061,a
 822  0061 2018          	jra	L172
 823  0063               L772:
 824                     ; 230         else if (uartreg == 0x03)
 826  0063 a103          	cp	a,#3
 827  0065 260b          	jrne	L303
 828                     ; 232             UART3->CR4 &= (uint8_t)(~itpos);
 830  0067 7b02          	ld	a,(OFST+0,sp)
 831  0069 43            	cpl	a
 832  006a c45247        	and	a,21063
 833  006d               LC005:
 834  006d c75247        	ld	21063,a
 836  0070 2009          	jra	L172
 837  0072               L303:
 838                     ; 236             UART3->CR6 &= (uint8_t)(~itpos);
 840  0072 7b02          	ld	a,(OFST+0,sp)
 841  0074 43            	cpl	a
 842  0075 c45249        	and	a,21065
 843  0078               LC002:
 844  0078 c75249        	ld	21065,a
 845  007b               L172:
 846                     ; 239 }
 849  007b 5b04          	addw	sp,#4
 850  007d 81            	ret	
 909                     ; 248 void UART3_LINBreakDetectionConfig(UART3_LINBreakDetectionLength_TypeDef UART3_LINBreakDetectionLength)
 909                     ; 249 {
 910                     .text:	section	.text,new
 911  0000               _UART3_LINBreakDetectionConfig:
 915                     ; 251     assert_param(IS_UART3_LINBREAKDETECTIONLENGTH_OK(UART3_LINBreakDetectionLength));
 917                     ; 253     if (UART3_LINBreakDetectionLength != UART3_LINBREAKDETECTIONLENGTH_10BITS)
 919  0000 4d            	tnz	a
 920  0001 2705          	jreq	L533
 921                     ; 255         UART3->CR4 |= UART3_CR4_LBDL;
 923  0003 721a5247      	bset	21063,#5
 926  0007 81            	ret	
 927  0008               L533:
 928                     ; 259         UART3->CR4 &= ((uint8_t)~UART3_CR4_LBDL);
 930  0008 721b5247      	bres	21063,#5
 931                     ; 261 }
 934  000c 81            	ret	
1055                     ; 273 void UART3_LINConfig(UART3_LinMode_TypeDef UART3_Mode,
1055                     ; 274                      UART3_LinAutosync_TypeDef UART3_Autosync, 
1055                     ; 275                      UART3_LinDivUp_TypeDef UART3_DivUp)
1055                     ; 276 {
1056                     .text:	section	.text,new
1057  0000               _UART3_LINConfig:
1059  0000 89            	pushw	x
1060       00000000      OFST:	set	0
1063                     ; 278     assert_param(IS_UART3_SLAVE_OK(UART3_Mode));
1065                     ; 279     assert_param(IS_UART3_AUTOSYNC_OK(UART3_Autosync));
1067                     ; 280     assert_param(IS_UART3_DIVUP_OK(UART3_DivUp));
1069                     ; 282     if (UART3_Mode != UART3_LIN_MODE_MASTER)
1071  0001 9e            	ld	a,xh
1072  0002 4d            	tnz	a
1073  0003 2706          	jreq	L714
1074                     ; 284         UART3->CR6 |=  UART3_CR6_LSLV;
1076  0005 721a5249      	bset	21065,#5
1078  0009 2004          	jra	L124
1079  000b               L714:
1080                     ; 288         UART3->CR6 &= ((uint8_t)~UART3_CR6_LSLV);
1082  000b 721b5249      	bres	21065,#5
1083  000f               L124:
1084                     ; 291     if (UART3_Autosync != UART3_LIN_AUTOSYNC_DISABLE)
1086  000f 7b02          	ld	a,(OFST+2,sp)
1087  0011 2706          	jreq	L324
1088                     ; 293         UART3->CR6 |=  UART3_CR6_LASE ;
1090  0013 72185249      	bset	21065,#4
1092  0017 2004          	jra	L524
1093  0019               L324:
1094                     ; 297         UART3->CR6 &= ((uint8_t)~ UART3_CR6_LASE );
1096  0019 72195249      	bres	21065,#4
1097  001d               L524:
1098                     ; 300     if (UART3_DivUp != UART3_LIN_DIVUP_LBRR1)
1100  001d 7b05          	ld	a,(OFST+5,sp)
1101  001f 2706          	jreq	L724
1102                     ; 302         UART3->CR6 |=  UART3_CR6_LDUM;
1104  0021 721e5249      	bset	21065,#7
1106  0025 2004          	jra	L134
1107  0027               L724:
1108                     ; 306         UART3->CR6 &= ((uint8_t)~ UART3_CR6_LDUM);
1110  0027 721f5249      	bres	21065,#7
1111  002b               L134:
1112                     ; 308 }
1115  002b 85            	popw	x
1116  002c 81            	ret	
1151                     ; 316 void UART3_LINCmd(FunctionalState NewState)
1151                     ; 317 {
1152                     .text:	section	.text,new
1153  0000               _UART3_LINCmd:
1157                     ; 319     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1159                     ; 321     if (NewState != DISABLE)
1161  0000 4d            	tnz	a
1162  0001 2705          	jreq	L154
1163                     ; 324         UART3->CR3 |= UART3_CR3_LINEN;
1165  0003 721c5246      	bset	21062,#6
1168  0007 81            	ret	
1169  0008               L154:
1170                     ; 329         UART3->CR3 &= ((uint8_t)~UART3_CR3_LINEN);
1172  0008 721d5246      	bres	21062,#6
1173                     ; 331 }
1176  000c 81            	ret	
1233                     ; 339 void UART3_WakeUpConfig(UART3_WakeUp_TypeDef UART3_WakeUp)
1233                     ; 340 {
1234                     .text:	section	.text,new
1235  0000               _UART3_WakeUpConfig:
1239                     ; 342     assert_param(IS_UART3_WAKEUP_OK(UART3_WakeUp));
1241                     ; 344     UART3->CR1 &= ((uint8_t)~UART3_CR1_WAKE);
1243  0000 72175244      	bres	21060,#3
1244                     ; 345     UART3->CR1 |= (uint8_t)UART3_WakeUp;
1246  0004 ca5244        	or	a,21060
1247  0007 c75244        	ld	21060,a
1248                     ; 346 }
1251  000a 81            	ret	
1287                     ; 354 void UART3_ReceiverWakeUpCmd(FunctionalState NewState)
1287                     ; 355 {
1288                     .text:	section	.text,new
1289  0000               _UART3_ReceiverWakeUpCmd:
1293                     ; 357     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1295                     ; 359     if (NewState != DISABLE)
1297  0000 4d            	tnz	a
1298  0001 2705          	jreq	L125
1299                     ; 362         UART3->CR2 |= UART3_CR2_RWU;
1301  0003 72125245      	bset	21061,#1
1304  0007 81            	ret	
1305  0008               L125:
1306                     ; 367         UART3->CR2 &= ((uint8_t)~UART3_CR2_RWU);
1308  0008 72135245      	bres	21061,#1
1309                     ; 369 }
1312  000c 81            	ret	
1335                     ; 376 uint8_t UART3_ReceiveData8(void)
1335                     ; 377 {
1336                     .text:	section	.text,new
1337  0000               _UART3_ReceiveData8:
1341                     ; 378     return ((uint8_t)UART3->DR);
1343  0000 c65241        	ld	a,21057
1346  0003 81            	ret	
1378                     ; 386 uint16_t UART3_ReceiveData9(void)
1378                     ; 387 {
1379                     .text:	section	.text,new
1380  0000               _UART3_ReceiveData9:
1382  0000 89            	pushw	x
1383       00000002      OFST:	set	2
1386                     ; 388   uint16_t temp = 0;
1388                     ; 390  temp = (uint16_t)(((uint16_t)((uint16_t)UART3->CR1 & (uint16_t)UART3_CR1_R8)) << 1);
1390  0001 c65244        	ld	a,21060
1391  0004 a480          	and	a,#128
1392  0006 5f            	clrw	x
1393  0007 02            	rlwa	x,a
1394  0008 58            	sllw	x
1395  0009 1f01          	ldw	(OFST-1,sp),x
1396                     ; 391   return (uint16_t)((((uint16_t)UART3->DR) | temp) & ((uint16_t)0x01FF));
1398  000b c65241        	ld	a,21057
1399  000e 5f            	clrw	x
1400  000f 97            	ld	xl,a
1401  0010 01            	rrwa	x,a
1402  0011 1a02          	or	a,(OFST+0,sp)
1403  0013 01            	rrwa	x,a
1404  0014 1a01          	or	a,(OFST-1,sp)
1405  0016 a401          	and	a,#1
1406  0018 01            	rrwa	x,a
1409  0019 5b02          	addw	sp,#2
1410  001b 81            	ret	
1442                     ; 399 void UART3_SendData8(uint8_t Data)
1442                     ; 400 {
1443                     .text:	section	.text,new
1444  0000               _UART3_SendData8:
1448                     ; 402     UART3->DR = Data;
1450  0000 c75241        	ld	21057,a
1451                     ; 403 }
1454  0003 81            	ret	
1486                     ; 410 void UART3_SendData9(uint16_t Data)
1486                     ; 411 {
1487                     .text:	section	.text,new
1488  0000               _UART3_SendData9:
1490  0000 89            	pushw	x
1491       00000000      OFST:	set	0
1494                     ; 413     UART3->CR1 &= ((uint8_t)~UART3_CR1_T8);                  
1496  0001 721d5244      	bres	21060,#6
1497                     ; 416     UART3->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART3_CR1_T8); 
1499  0005 54            	srlw	x
1500  0006 54            	srlw	x
1501  0007 9f            	ld	a,xl
1502  0008 a440          	and	a,#64
1503  000a ca5244        	or	a,21060
1504  000d c75244        	ld	21060,a
1505                     ; 419     UART3->DR   = (uint8_t)(Data);                    
1507  0010 7b02          	ld	a,(OFST+2,sp)
1508  0012 c75241        	ld	21057,a
1509                     ; 420 }
1512  0015 85            	popw	x
1513  0016 81            	ret	
1536                     ; 427 void UART3_SendBreak(void)
1536                     ; 428 {
1537                     .text:	section	.text,new
1538  0000               _UART3_SendBreak:
1542                     ; 429     UART3->CR2 |= UART3_CR2_SBK;
1544  0000 72105245      	bset	21061,#0
1545                     ; 430 }
1548  0004 81            	ret	
1580                     ; 437 void UART3_SetAddress(uint8_t UART3_Address)
1580                     ; 438 {
1581                     .text:	section	.text,new
1582  0000               _UART3_SetAddress:
1584  0000 88            	push	a
1585       00000000      OFST:	set	0
1588                     ; 440     assert_param(IS_UART3_ADDRESS_OK(UART3_Address));
1590                     ; 443     UART3->CR4 &= ((uint8_t)~UART3_CR4_ADD);
1592  0001 c65247        	ld	a,21063
1593  0004 a4f0          	and	a,#240
1594  0006 c75247        	ld	21063,a
1595                     ; 445     UART3->CR4 |= UART3_Address;
1597  0009 c65247        	ld	a,21063
1598  000c 1a01          	or	a,(OFST+1,sp)
1599  000e c75247        	ld	21063,a
1600                     ; 446 }
1603  0011 84            	pop	a
1604  0012 81            	ret	
1761                     ; 454 FlagStatus UART3_GetFlagStatus(UART3_Flag_TypeDef UART3_FLAG)
1761                     ; 455 {
1762                     .text:	section	.text,new
1763  0000               _UART3_GetFlagStatus:
1765  0000 89            	pushw	x
1766  0001 88            	push	a
1767       00000001      OFST:	set	1
1770                     ; 456     FlagStatus status = RESET;
1772                     ; 459     assert_param(IS_UART3_FLAG_OK(UART3_FLAG));
1774                     ; 462     if (UART3_FLAG == UART3_FLAG_LBDF)
1776  0002 a30210        	cpw	x,#528
1777  0005 2608          	jrne	L317
1778                     ; 464         if ((UART3->CR4 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
1780  0007 9f            	ld	a,xl
1781  0008 c45247        	and	a,21063
1782  000b 2728          	jreq	L127
1783                     ; 467             status = SET;
1785  000d 2021          	jp	LC008
1786                     ; 472             status = RESET;
1787  000f               L317:
1788                     ; 475     else if (UART3_FLAG == UART3_FLAG_SBK)
1790  000f 1e02          	ldw	x,(OFST+1,sp)
1791  0011 a30101        	cpw	x,#257
1792  0014 2609          	jrne	L327
1793                     ; 477         if ((UART3->CR2 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
1795  0016 c65245        	ld	a,21061
1796  0019 1503          	bcp	a,(OFST+2,sp)
1797  001b 2717          	jreq	L737
1798                     ; 480             status = SET;
1800  001d 2011          	jp	LC008
1801                     ; 485             status = RESET;
1802  001f               L327:
1803                     ; 488     else if ((UART3_FLAG == UART3_FLAG_LHDF) || (UART3_FLAG == UART3_FLAG_LSF))
1805  001f a30302        	cpw	x,#770
1806  0022 2705          	jreq	L537
1808  0024 a30301        	cpw	x,#769
1809  0027 260f          	jrne	L337
1810  0029               L537:
1811                     ; 490         if ((UART3->CR6 & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
1813  0029 c65249        	ld	a,21065
1814  002c 1503          	bcp	a,(OFST+2,sp)
1815  002e 2704          	jreq	L737
1816                     ; 493             status = SET;
1818  0030               LC008:
1822  0030 a601          	ld	a,#1
1825  0032 2001          	jra	L127
1826  0034               L737:
1827                     ; 498             status = RESET;
1831  0034 4f            	clr	a
1832  0035               L127:
1833                     ; 516     return  status;
1837  0035 5b03          	addw	sp,#3
1838  0037 81            	ret	
1839  0038               L337:
1840                     ; 503         if ((UART3->SR & (uint8_t)UART3_FLAG) != (uint8_t)0x00)
1842  0038 c65240        	ld	a,21056
1843  003b 1503          	bcp	a,(OFST+2,sp)
1844  003d 27f5          	jreq	L737
1845                     ; 506             status = SET;
1847  003f 20ef          	jp	LC008
1848                     ; 511             status = RESET;
1883                     ; 546 void UART3_ClearFlag(UART3_Flag_TypeDef UART3_FLAG)
1883                     ; 547 {
1884                     .text:	section	.text,new
1885  0000               _UART3_ClearFlag:
1887  0000 89            	pushw	x
1888       00000000      OFST:	set	0
1891                     ; 549     assert_param(IS_UART3_CLEAR_FLAG_OK(UART3_FLAG));
1893                     ; 552     if (UART3_FLAG == UART3_FLAG_RXNE)
1895  0001 a30020        	cpw	x,#32
1896  0004 2606          	jrne	L767
1897                     ; 554         UART3->SR = (uint8_t)~(UART3_SR_RXNE);
1899  0006 35df5240      	mov	21056,#223
1901  000a 201c          	jra	L177
1902  000c               L767:
1903                     ; 557     else if (UART3_FLAG == UART3_FLAG_LBDF)
1905  000c 1e01          	ldw	x,(OFST+1,sp)
1906  000e a30210        	cpw	x,#528
1907  0011 2606          	jrne	L377
1908                     ; 559         UART3->CR4 &= (uint8_t)(~UART3_CR4_LBDF);
1910  0013 72195247      	bres	21063,#4
1912  0017 200f          	jra	L177
1913  0019               L377:
1914                     ; 562     else if (UART3_FLAG == UART3_FLAG_LHDF)
1916  0019 a30302        	cpw	x,#770
1917  001c 2606          	jrne	L777
1918                     ; 564         UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
1920  001e 72135249      	bres	21065,#1
1922  0022 2004          	jra	L177
1923  0024               L777:
1924                     ; 569         UART3->CR6 &= (uint8_t)(~UART3_CR6_LSF);
1926  0024 72115249      	bres	21065,#0
1927  0028               L177:
1928                     ; 571 }
1931  0028 85            	popw	x
1932  0029 81            	ret	
2006                     ; 586 ITStatus UART3_GetITStatus(UART3_IT_TypeDef UART3_IT)
2006                     ; 587 {
2007                     .text:	section	.text,new
2008  0000               _UART3_GetITStatus:
2010  0000 89            	pushw	x
2011  0001 89            	pushw	x
2012       00000002      OFST:	set	2
2015                     ; 588     ITStatus pendingbitstatus = RESET;
2017                     ; 589     uint8_t itpos = 0;
2019                     ; 590     uint8_t itmask1 = 0;
2021                     ; 591     uint8_t itmask2 = 0;
2023                     ; 592     uint8_t enablestatus = 0;
2025                     ; 595     assert_param(IS_UART3_GET_IT_OK(UART3_IT));
2027                     ; 598     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART3_IT & (uint8_t)0x0F));
2029  0002 9f            	ld	a,xl
2030  0003 a40f          	and	a,#15
2031  0005 5f            	clrw	x
2032  0006 97            	ld	xl,a
2033  0007 a601          	ld	a,#1
2034  0009 5d            	tnzw	x
2035  000a 2704          	jreq	L26
2036  000c               L46:
2037  000c 48            	sll	a
2038  000d 5a            	decw	x
2039  000e 26fc          	jrne	L46
2040  0010               L26:
2041  0010 6b01          	ld	(OFST-1,sp),a
2042                     ; 600     itmask1 = (uint8_t)((uint8_t)UART3_IT >> (uint8_t)4);
2044  0012 7b04          	ld	a,(OFST+2,sp)
2045  0014 4e            	swap	a
2046  0015 a40f          	and	a,#15
2047  0017 6b02          	ld	(OFST+0,sp),a
2048                     ; 602     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2050  0019 5f            	clrw	x
2051  001a 97            	ld	xl,a
2052  001b a601          	ld	a,#1
2053  001d 5d            	tnzw	x
2054  001e 2704          	jreq	L66
2055  0020               L07:
2056  0020 48            	sll	a
2057  0021 5a            	decw	x
2058  0022 26fc          	jrne	L07
2059  0024               L66:
2060  0024 6b02          	ld	(OFST+0,sp),a
2061                     ; 605     if (UART3_IT == UART3_IT_PE)
2063  0026 1e03          	ldw	x,(OFST+1,sp)
2064  0028 a30100        	cpw	x,#256
2065  002b 260c          	jrne	L5301
2066                     ; 608         enablestatus = (uint8_t)((uint8_t)UART3->CR1 & itmask2);
2068  002d c65244        	ld	a,21060
2069  0030 1402          	and	a,(OFST+0,sp)
2070  0032 6b02          	ld	(OFST+0,sp),a
2071                     ; 611         if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2073  0034 c65240        	ld	a,21056
2075                     ; 614             pendingbitstatus = SET;
2077  0037 2020          	jp	LC011
2078                     ; 619             pendingbitstatus = RESET;
2079  0039               L5301:
2080                     ; 622     else if (UART3_IT == UART3_IT_LBDF)
2082  0039 a30346        	cpw	x,#838
2083  003c 260c          	jrne	L5401
2084                     ; 625         enablestatus = (uint8_t)((uint8_t)UART3->CR4 & itmask2);
2086  003e c65247        	ld	a,21063
2087  0041 1402          	and	a,(OFST+0,sp)
2088  0043 6b02          	ld	(OFST+0,sp),a
2089                     ; 627         if (((UART3->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2091  0045 c65247        	ld	a,21063
2093                     ; 630             pendingbitstatus = SET;
2095  0048 200f          	jp	LC011
2096                     ; 635             pendingbitstatus = RESET;
2097  004a               L5401:
2098                     ; 638     else if (UART3_IT == UART3_IT_LHDF)
2100  004a a30412        	cpw	x,#1042
2101  004d 2616          	jrne	L5501
2102                     ; 641         enablestatus = (uint8_t)((uint8_t)UART3->CR6 & itmask2);
2104  004f c65249        	ld	a,21065
2105  0052 1402          	and	a,(OFST+0,sp)
2106  0054 6b02          	ld	(OFST+0,sp),a
2107                     ; 643         if (((UART3->CR6 & itpos) != (uint8_t)0x00) && enablestatus)
2109  0056 c65249        	ld	a,21065
2111  0059               LC011:
2112  0059 1501          	bcp	a,(OFST-1,sp)
2113  005b 271a          	jreq	L5601
2114  005d 7b02          	ld	a,(OFST+0,sp)
2115  005f 2716          	jreq	L5601
2116                     ; 646             pendingbitstatus = SET;
2118  0061               LC010:
2122  0061 a601          	ld	a,#1
2124  0063 2013          	jra	L3401
2125                     ; 651             pendingbitstatus = RESET;
2126  0065               L5501:
2127                     ; 657         enablestatus = (uint8_t)((uint8_t)UART3->CR2 & itmask2);
2129  0065 c65245        	ld	a,21061
2130  0068 1402          	and	a,(OFST+0,sp)
2131  006a 6b02          	ld	(OFST+0,sp),a
2132                     ; 659         if (((UART3->SR & itpos) != (uint8_t)0x00) && enablestatus)
2134  006c c65240        	ld	a,21056
2135  006f 1501          	bcp	a,(OFST-1,sp)
2136  0071 2704          	jreq	L5601
2138  0073 7b02          	ld	a,(OFST+0,sp)
2139                     ; 662             pendingbitstatus = SET;
2141  0075 26ea          	jrne	LC010
2142  0077               L5601:
2143                     ; 667             pendingbitstatus = RESET;
2148  0077 4f            	clr	a
2149  0078               L3401:
2150                     ; 671     return  pendingbitstatus;
2154  0078 5b04          	addw	sp,#4
2155  007a 81            	ret	
2191                     ; 701 void UART3_ClearITPendingBit(UART3_IT_TypeDef UART3_IT)
2191                     ; 702 {
2192                     .text:	section	.text,new
2193  0000               _UART3_ClearITPendingBit:
2195  0000 89            	pushw	x
2196       00000000      OFST:	set	0
2199                     ; 704     assert_param(IS_UART3_CLEAR_IT_OK(UART3_IT));
2201                     ; 707     if (UART3_IT == UART3_IT_RXNE)
2203  0001 a30255        	cpw	x,#597
2204  0004 2606          	jrne	L7011
2205                     ; 709         UART3->SR = (uint8_t)~(UART3_SR_RXNE);
2207  0006 35df5240      	mov	21056,#223
2209  000a 2011          	jra	L1111
2210  000c               L7011:
2211                     ; 712     else if (UART3_IT == UART3_IT_LBDF)
2213  000c 1e01          	ldw	x,(OFST+1,sp)
2214  000e a30346        	cpw	x,#838
2215  0011 2606          	jrne	L3111
2216                     ; 714         UART3->CR4 &= (uint8_t)~(UART3_CR4_LBDF);
2218  0013 72195247      	bres	21063,#4
2220  0017 2004          	jra	L1111
2221  0019               L3111:
2222                     ; 719         UART3->CR6 &= (uint8_t)(~UART3_CR6_LHDF);
2224  0019 72135249      	bres	21065,#1
2225  001d               L1111:
2226                     ; 721 }
2229  001d 85            	popw	x
2230  001e 81            	ret	
2243                     	xdef	_UART3_ClearITPendingBit
2244                     	xdef	_UART3_GetITStatus
2245                     	xdef	_UART3_ClearFlag
2246                     	xdef	_UART3_GetFlagStatus
2247                     	xdef	_UART3_SetAddress
2248                     	xdef	_UART3_SendBreak
2249                     	xdef	_UART3_SendData9
2250                     	xdef	_UART3_SendData8
2251                     	xdef	_UART3_ReceiveData9
2252                     	xdef	_UART3_ReceiveData8
2253                     	xdef	_UART3_WakeUpConfig
2254                     	xdef	_UART3_ReceiverWakeUpCmd
2255                     	xdef	_UART3_LINCmd
2256                     	xdef	_UART3_LINConfig
2257                     	xdef	_UART3_LINBreakDetectionConfig
2258                     	xdef	_UART3_ITConfig
2259                     	xdef	_UART3_Cmd
2260                     	xdef	_UART3_Init
2261                     	xdef	_UART3_DeInit
2262                     	xref	_CLK_GetClockFreq
2263                     	xref.b	c_lreg
2264                     	xref.b	c_x
2283                     	xref	c_lursh
2284                     	xref	c_lsub
2285                     	xref	c_smul
2286                     	xref	c_ludv
2287                     	xref	c_rtol
2288                     	xref	c_llsh
2289                     	xref	c_ltor
2290                     	end
