   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  51                     ; 45 void UART1_DeInit(void)
  51                     ; 46 {
  53                     .text:	section	.text,new
  54  0000               _UART1_DeInit:
  58                     ; 49     (void)UART1->SR;
  60  0000 c65230        	ld	a,21040
  61                     ; 50     (void)UART1->DR;
  63  0003 c65231        	ld	a,21041
  64                     ; 52     UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  66  0006 725f5233      	clr	21043
  67                     ; 53     UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  69  000a 725f5232      	clr	21042
  70                     ; 55     UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  72  000e 725f5234      	clr	21044
  73                     ; 56     UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  75  0012 725f5235      	clr	21045
  76                     ; 57     UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  78  0016 725f5236      	clr	21046
  79                     ; 58     UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  81  001a 725f5237      	clr	21047
  82                     ; 59     UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  84  001e 725f5238      	clr	21048
  85                     ; 61     UART1->GTR = UART1_GTR_RESET_VALUE;
  87  0022 725f5239      	clr	21049
  88                     ; 62     UART1->PSCR = UART1_PSCR_RESET_VALUE;
  90  0026 725f523a      	clr	21050
  91                     ; 63 }
  94  002a 81            	ret	
 391                     .const:	section	.text
 392  0000               L41:
 393  0000 00000064      	dc.l	100
 394                     ; 82 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 394                     ; 83                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 394                     ; 84                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 394                     ; 85 {
 395                     .text:	section	.text,new
 396  0000               _UART1_Init:
 398  0000 520c          	subw	sp,#12
 399       0000000c      OFST:	set	12
 402                     ; 86     uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 406                     ; 89     assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 408                     ; 90     assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 410                     ; 91     assert_param(IS_UART1_STOPBITS_OK(StopBits));
 412                     ; 92     assert_param(IS_UART1_PARITY_OK(Parity));
 414                     ; 93     assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 416                     ; 94     assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 418                     ; 97     UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 420  0002 72195234      	bres	21044,#4
 421                     ; 100     UART1->CR1 |= (uint8_t)WordLength;
 423  0006 c65234        	ld	a,21044
 424  0009 1a13          	or	a,(OFST+7,sp)
 425  000b c75234        	ld	21044,a
 426                     ; 103     UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 428  000e c65236        	ld	a,21046
 429  0011 a4cf          	and	a,#207
 430  0013 c75236        	ld	21046,a
 431                     ; 105     UART1->CR3 |= (uint8_t)StopBits;  
 433  0016 c65236        	ld	a,21046
 434  0019 1a14          	or	a,(OFST+8,sp)
 435  001b c75236        	ld	21046,a
 436                     ; 108     UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 438  001e c65234        	ld	a,21044
 439  0021 a4f9          	and	a,#249
 440  0023 c75234        	ld	21044,a
 441                     ; 110     UART1->CR1 |= (uint8_t)Parity;  
 443  0026 c65234        	ld	a,21044
 444  0029 1a15          	or	a,(OFST+9,sp)
 445  002b c75234        	ld	21044,a
 446                     ; 113     UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 448  002e 725f5232      	clr	21042
 449                     ; 115     UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 451  0032 c65233        	ld	a,21043
 452  0035 a40f          	and	a,#15
 453  0037 c75233        	ld	21043,a
 454                     ; 117     UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 456  003a c65233        	ld	a,21043
 457  003d a4f0          	and	a,#240
 458  003f c75233        	ld	21043,a
 459                     ; 120     BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 461  0042 96            	ldw	x,sp
 462  0043 cd011c        	call	LC001
 464  0046 96            	ldw	x,sp
 465  0047 5c            	incw	x
 466  0048 cd0000        	call	c_rtol
 468  004b cd0000        	call	_CLK_GetClockFreq
 470  004e 96            	ldw	x,sp
 471  004f 5c            	incw	x
 472  0050 cd0000        	call	c_ludv
 474  0053 96            	ldw	x,sp
 475  0054 1c0009        	addw	x,#OFST-3
 476  0057 cd0000        	call	c_rtol
 478                     ; 121     BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 480  005a 96            	ldw	x,sp
 481  005b cd011c        	call	LC001
 483  005e 96            	ldw	x,sp
 484  005f 5c            	incw	x
 485  0060 cd0000        	call	c_rtol
 487  0063 cd0000        	call	_CLK_GetClockFreq
 489  0066 a664          	ld	a,#100
 490  0068 cd0000        	call	c_smul
 492  006b 96            	ldw	x,sp
 493  006c 5c            	incw	x
 494  006d cd0000        	call	c_ludv
 496  0070 96            	ldw	x,sp
 497  0071 1c0005        	addw	x,#OFST-7
 498  0074 cd0000        	call	c_rtol
 500                     ; 123     UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 502  0077 96            	ldw	x,sp
 503  0078 1c0009        	addw	x,#OFST-3
 504  007b cd0000        	call	c_ltor
 506  007e a664          	ld	a,#100
 507  0080 cd0000        	call	c_smul
 509  0083 96            	ldw	x,sp
 510  0084 5c            	incw	x
 511  0085 cd0000        	call	c_rtol
 513  0088 96            	ldw	x,sp
 514  0089 1c0005        	addw	x,#OFST-7
 515  008c cd0000        	call	c_ltor
 517  008f 96            	ldw	x,sp
 518  0090 5c            	incw	x
 519  0091 cd0000        	call	c_lsub
 521  0094 a604          	ld	a,#4
 522  0096 cd0000        	call	c_llsh
 524  0099 ae0000        	ldw	x,#L41
 525  009c cd0000        	call	c_ludv
 527  009f b603          	ld	a,c_lreg+3
 528  00a1 a40f          	and	a,#15
 529  00a3 ca5233        	or	a,21043
 530  00a6 c75233        	ld	21043,a
 531                     ; 125     UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 533  00a9 96            	ldw	x,sp
 534  00aa 1c0009        	addw	x,#OFST-3
 535  00ad cd0000        	call	c_ltor
 537  00b0 a604          	ld	a,#4
 538  00b2 cd0000        	call	c_lursh
 540  00b5 b603          	ld	a,c_lreg+3
 541  00b7 a4f0          	and	a,#240
 542  00b9 b703          	ld	c_lreg+3,a
 543  00bb 3f02          	clr	c_lreg+2
 544  00bd 3f01          	clr	c_lreg+1
 545  00bf 3f00          	clr	c_lreg
 546  00c1 ca5233        	or	a,21043
 547  00c4 c75233        	ld	21043,a
 548                     ; 127     UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 550  00c7 c65232        	ld	a,21042
 551  00ca 1a0c          	or	a,(OFST+0,sp)
 552  00cc c75232        	ld	21042,a
 553                     ; 130     UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 555  00cf c65235        	ld	a,21045
 556  00d2 a4f3          	and	a,#243
 557  00d4 c75235        	ld	21045,a
 558                     ; 132     UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 560  00d7 c65236        	ld	a,21046
 561  00da a4f8          	and	a,#248
 562  00dc c75236        	ld	21046,a
 563                     ; 134     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 563                     ; 135                                               UART1_CR3_CPHA | UART1_CR3_LBCL));  
 565  00df 7b16          	ld	a,(OFST+10,sp)
 566  00e1 a407          	and	a,#7
 567  00e3 ca5236        	or	a,21046
 568  00e6 c75236        	ld	21046,a
 569                     ; 137     if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 571  00e9 7b17          	ld	a,(OFST+11,sp)
 572  00eb a504          	bcp	a,#4
 573  00ed 2706          	jreq	L561
 574                     ; 140         UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 576  00ef 72165235      	bset	21045,#3
 578  00f3 2004          	jra	L761
 579  00f5               L561:
 580                     ; 145         UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 582  00f5 72175235      	bres	21045,#3
 583  00f9               L761:
 584                     ; 147     if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 586  00f9 a508          	bcp	a,#8
 587  00fb 2706          	jreq	L171
 588                     ; 150         UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 590  00fd 72145235      	bset	21045,#2
 592  0101 2004          	jra	L371
 593  0103               L171:
 594                     ; 155         UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 596  0103 72155235      	bres	21045,#2
 597  0107               L371:
 598                     ; 159     if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 600  0107 7b16          	ld	a,(OFST+10,sp)
 601  0109 2a06          	jrpl	L571
 602                     ; 162         UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 604  010b 72175236      	bres	21046,#3
 606  010f 2008          	jra	L771
 607  0111               L571:
 608                     ; 166         UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 610  0111 a408          	and	a,#8
 611  0113 ca5236        	or	a,21046
 612  0116 c75236        	ld	21046,a
 613  0119               L771:
 614                     ; 168 }
 617  0119 5b0c          	addw	sp,#12
 618  011b 81            	ret	
 619  011c               LC001:
 620  011c 1c000f        	addw	x,#OFST+3
 621  011f cd0000        	call	c_ltor
 623  0122 a604          	ld	a,#4
 624  0124 cc0000        	jp	c_llsh
 679                     ; 176 void UART1_Cmd(FunctionalState NewState)
 679                     ; 177 {
 680                     .text:	section	.text,new
 681  0000               _UART1_Cmd:
 685                     ; 178     if (NewState != DISABLE)
 687  0000 4d            	tnz	a
 688  0001 2705          	jreq	L722
 689                     ; 181         UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 691  0003 721b5234      	bres	21044,#5
 694  0007 81            	ret	
 695  0008               L722:
 696                     ; 186         UART1->CR1 |= UART1_CR1_UARTD;  
 698  0008 721a5234      	bset	21044,#5
 699                     ; 188 }
 702  000c 81            	ret	
 823                     ; 204 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 823                     ; 205 {
 824                     .text:	section	.text,new
 825  0000               _UART1_ITConfig:
 827  0000 89            	pushw	x
 828  0001 89            	pushw	x
 829       00000002      OFST:	set	2
 832                     ; 206     uint8_t uartreg = 0, itpos = 0x00;
 836                     ; 209     assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 838                     ; 210     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 840                     ; 213     uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 842  0002 9e            	ld	a,xh
 843  0003 6b01          	ld	(OFST-1,sp),a
 844                     ; 215     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 846  0005 9f            	ld	a,xl
 847  0006 a40f          	and	a,#15
 848  0008 5f            	clrw	x
 849  0009 97            	ld	xl,a
 850  000a a601          	ld	a,#1
 851  000c 5d            	tnzw	x
 852  000d 2704          	jreq	L22
 853  000f               L42:
 854  000f 48            	sll	a
 855  0010 5a            	decw	x
 856  0011 26fc          	jrne	L42
 857  0013               L22:
 858  0013 6b02          	ld	(OFST+0,sp),a
 859                     ; 217     if (NewState != DISABLE)
 861  0015 7b07          	ld	a,(OFST+5,sp)
 862  0017 271f          	jreq	L503
 863                     ; 220         if (uartreg == 0x01)
 865  0019 7b01          	ld	a,(OFST-1,sp)
 866  001b a101          	cp	a,#1
 867  001d 2607          	jrne	L703
 868                     ; 222             UART1->CR1 |= itpos;
 870  001f c65234        	ld	a,21044
 871  0022 1a02          	or	a,(OFST+0,sp)
 873  0024 201e          	jp	LC003
 874  0026               L703:
 875                     ; 224         else if (uartreg == 0x02)
 877  0026 a102          	cp	a,#2
 878  0028 2607          	jrne	L313
 879                     ; 226             UART1->CR2 |= itpos;
 881  002a c65235        	ld	a,21045
 882  002d 1a02          	or	a,(OFST+0,sp)
 884  002f 2022          	jp	LC004
 885  0031               L313:
 886                     ; 230             UART1->CR4 |= itpos;
 888  0031 c65237        	ld	a,21047
 889  0034 1a02          	or	a,(OFST+0,sp)
 890  0036 2026          	jp	LC002
 891  0038               L503:
 892                     ; 236         if (uartreg == 0x01)
 894  0038 7b01          	ld	a,(OFST-1,sp)
 895  003a a101          	cp	a,#1
 896  003c 260b          	jrne	L123
 897                     ; 238             UART1->CR1 &= (uint8_t)(~itpos);
 899  003e 7b02          	ld	a,(OFST+0,sp)
 900  0040 43            	cpl	a
 901  0041 c45234        	and	a,21044
 902  0044               LC003:
 903  0044 c75234        	ld	21044,a
 905  0047 2018          	jra	L713
 906  0049               L123:
 907                     ; 240         else if (uartreg == 0x02)
 909  0049 a102          	cp	a,#2
 910  004b 260b          	jrne	L523
 911                     ; 242             UART1->CR2 &= (uint8_t)(~itpos);
 913  004d 7b02          	ld	a,(OFST+0,sp)
 914  004f 43            	cpl	a
 915  0050 c45235        	and	a,21045
 916  0053               LC004:
 917  0053 c75235        	ld	21045,a
 919  0056 2009          	jra	L713
 920  0058               L523:
 921                     ; 246             UART1->CR4 &= (uint8_t)(~itpos);
 923  0058 7b02          	ld	a,(OFST+0,sp)
 924  005a 43            	cpl	a
 925  005b c45237        	and	a,21047
 926  005e               LC002:
 927  005e c75237        	ld	21047,a
 928  0061               L713:
 929                     ; 250 }
 932  0061 5b04          	addw	sp,#4
 933  0063 81            	ret	
 969                     ; 257 void UART1_HalfDuplexCmd(FunctionalState NewState)
 969                     ; 258 {
 970                     .text:	section	.text,new
 971  0000               _UART1_HalfDuplexCmd:
 975                     ; 259     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 977                     ; 261     if (NewState != DISABLE)
 979  0000 4d            	tnz	a
 980  0001 2705          	jreq	L743
 981                     ; 263         UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
 983  0003 72165238      	bset	21048,#3
 986  0007 81            	ret	
 987  0008               L743:
 988                     ; 267         UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
 990  0008 72175238      	bres	21048,#3
 991                     ; 269 }
 994  000c 81            	ret	
1051                     ; 277 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1051                     ; 278 {
1052                     .text:	section	.text,new
1053  0000               _UART1_IrDAConfig:
1057                     ; 279     assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1059                     ; 281     if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1061  0000 4d            	tnz	a
1062  0001 2705          	jreq	L104
1063                     ; 283         UART1->CR5 |= UART1_CR5_IRLP;
1065  0003 72145238      	bset	21048,#2
1068  0007 81            	ret	
1069  0008               L104:
1070                     ; 287         UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1072  0008 72155238      	bres	21048,#2
1073                     ; 289 }
1076  000c 81            	ret	
1111                     ; 297 void UART1_IrDACmd(FunctionalState NewState)
1111                     ; 298 {
1112                     .text:	section	.text,new
1113  0000               _UART1_IrDACmd:
1117                     ; 301     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1119                     ; 303     if (NewState != DISABLE)
1121  0000 4d            	tnz	a
1122  0001 2705          	jreq	L324
1123                     ; 306         UART1->CR5 |= UART1_CR5_IREN;
1125  0003 72125238      	bset	21048,#1
1128  0007 81            	ret	
1129  0008               L324:
1130                     ; 311         UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1132  0008 72135238      	bres	21048,#1
1133                     ; 313 }
1136  000c 81            	ret	
1195                     ; 322 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1195                     ; 323 {
1196                     .text:	section	.text,new
1197  0000               _UART1_LINBreakDetectionConfig:
1201                     ; 324     assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1203                     ; 326     if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1205  0000 4d            	tnz	a
1206  0001 2705          	jreq	L554
1207                     ; 328         UART1->CR4 |= UART1_CR4_LBDL;
1209  0003 721a5237      	bset	21047,#5
1212  0007 81            	ret	
1213  0008               L554:
1214                     ; 332         UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1216  0008 721b5237      	bres	21047,#5
1217                     ; 334 }
1220  000c 81            	ret	
1255                     ; 342 void UART1_LINCmd(FunctionalState NewState)
1255                     ; 343 {
1256                     .text:	section	.text,new
1257  0000               _UART1_LINCmd:
1261                     ; 344     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1263                     ; 346     if (NewState != DISABLE)
1265  0000 4d            	tnz	a
1266  0001 2705          	jreq	L774
1267                     ; 349         UART1->CR3 |= UART1_CR3_LINEN;
1269  0003 721c5236      	bset	21046,#6
1272  0007 81            	ret	
1273  0008               L774:
1274                     ; 354         UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1276  0008 721d5236      	bres	21046,#6
1277                     ; 356 }
1280  000c 81            	ret	
1315                     ; 363 void UART1_SmartCardCmd(FunctionalState NewState)
1315                     ; 364 {
1316                     .text:	section	.text,new
1317  0000               _UART1_SmartCardCmd:
1321                     ; 365     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1323                     ; 367     if (NewState != DISABLE)
1325  0000 4d            	tnz	a
1326  0001 2705          	jreq	L125
1327                     ; 370         UART1->CR5 |= UART1_CR5_SCEN;
1329  0003 721a5238      	bset	21048,#5
1332  0007 81            	ret	
1333  0008               L125:
1334                     ; 375         UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1336  0008 721b5238      	bres	21048,#5
1337                     ; 377 }
1340  000c 81            	ret	
1376                     ; 386 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1376                     ; 387 {
1377                     .text:	section	.text,new
1378  0000               _UART1_SmartCardNACKCmd:
1382                     ; 388     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1384                     ; 390     if (NewState != DISABLE)
1386  0000 4d            	tnz	a
1387  0001 2705          	jreq	L345
1388                     ; 393         UART1->CR5 |= UART1_CR5_NACK;
1390  0003 72185238      	bset	21048,#4
1393  0007 81            	ret	
1394  0008               L345:
1395                     ; 398         UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1397  0008 72195238      	bres	21048,#4
1398                     ; 400 }
1401  000c 81            	ret	
1458                     ; 408 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1458                     ; 409 {
1459                     .text:	section	.text,new
1460  0000               _UART1_WakeUpConfig:
1464                     ; 410     assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1466                     ; 412     UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1468  0000 72175234      	bres	21044,#3
1469                     ; 413     UART1->CR1 |= (uint8_t)UART1_WakeUp;
1471  0004 ca5234        	or	a,21044
1472  0007 c75234        	ld	21044,a
1473                     ; 414 }
1476  000a 81            	ret	
1512                     ; 421 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1512                     ; 422 {
1513                     .text:	section	.text,new
1514  0000               _UART1_ReceiverWakeUpCmd:
1518                     ; 423     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1520                     ; 425     if (NewState != DISABLE)
1522  0000 4d            	tnz	a
1523  0001 2705          	jreq	L316
1524                     ; 428         UART1->CR2 |= UART1_CR2_RWU;
1526  0003 72125235      	bset	21045,#1
1529  0007 81            	ret	
1530  0008               L316:
1531                     ; 433         UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1533  0008 72135235      	bres	21045,#1
1534                     ; 435 }
1537  000c 81            	ret	
1560                     ; 442 uint8_t UART1_ReceiveData8(void)
1560                     ; 443 {
1561                     .text:	section	.text,new
1562  0000               _UART1_ReceiveData8:
1566                     ; 444     return ((uint8_t)UART1->DR);
1568  0000 c65231        	ld	a,21041
1571  0003 81            	ret	
1603                     ; 452 uint16_t UART1_ReceiveData9(void)
1603                     ; 453 {
1604                     .text:	section	.text,new
1605  0000               _UART1_ReceiveData9:
1607  0000 89            	pushw	x
1608       00000002      OFST:	set	2
1611                     ; 454   uint16_t temp = 0;
1613                     ; 456   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1615  0001 c65234        	ld	a,21044
1616  0004 a480          	and	a,#128
1617  0006 5f            	clrw	x
1618  0007 02            	rlwa	x,a
1619  0008 58            	sllw	x
1620  0009 1f01          	ldw	(OFST-1,sp),x
1621                     ; 457   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1623  000b c65231        	ld	a,21041
1624  000e 5f            	clrw	x
1625  000f 97            	ld	xl,a
1626  0010 01            	rrwa	x,a
1627  0011 1a02          	or	a,(OFST+0,sp)
1628  0013 01            	rrwa	x,a
1629  0014 1a01          	or	a,(OFST-1,sp)
1630  0016 a401          	and	a,#1
1631  0018 01            	rrwa	x,a
1634  0019 5b02          	addw	sp,#2
1635  001b 81            	ret	
1667                     ; 465 void UART1_SendData8(uint8_t Data)
1667                     ; 466 {
1668                     .text:	section	.text,new
1669  0000               _UART1_SendData8:
1673                     ; 468     UART1->DR = Data;
1675  0000 c75231        	ld	21041,a
1676                     ; 469 }
1679  0003 81            	ret	
1711                     ; 477 void UART1_SendData9(uint16_t Data)
1711                     ; 478 {
1712                     .text:	section	.text,new
1713  0000               _UART1_SendData9:
1715  0000 89            	pushw	x
1716       00000000      OFST:	set	0
1719                     ; 480     UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
1721  0001 721d5234      	bres	21044,#6
1722                     ; 482     UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
1724  0005 54            	srlw	x
1725  0006 54            	srlw	x
1726  0007 9f            	ld	a,xl
1727  0008 a440          	and	a,#64
1728  000a ca5234        	or	a,21044
1729  000d c75234        	ld	21044,a
1730                     ; 484     UART1->DR   = (uint8_t)(Data);
1732  0010 7b02          	ld	a,(OFST+2,sp)
1733  0012 c75231        	ld	21041,a
1734                     ; 485 }
1737  0015 85            	popw	x
1738  0016 81            	ret	
1761                     ; 492 void UART1_SendBreak(void)
1761                     ; 493 {
1762                     .text:	section	.text,new
1763  0000               _UART1_SendBreak:
1767                     ; 494     UART1->CR2 |= UART1_CR2_SBK;
1769  0000 72105235      	bset	21045,#0
1770                     ; 495 }
1773  0004 81            	ret	
1805                     ; 502 void UART1_SetAddress(uint8_t UART1_Address)
1805                     ; 503 {
1806                     .text:	section	.text,new
1807  0000               _UART1_SetAddress:
1809  0000 88            	push	a
1810       00000000      OFST:	set	0
1813                     ; 505     assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
1815                     ; 508     UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
1817  0001 c65237        	ld	a,21047
1818  0004 a4f0          	and	a,#240
1819  0006 c75237        	ld	21047,a
1820                     ; 510     UART1->CR4 |= UART1_Address;
1822  0009 c65237        	ld	a,21047
1823  000c 1a01          	or	a,(OFST+1,sp)
1824  000e c75237        	ld	21047,a
1825                     ; 511 }
1828  0011 84            	pop	a
1829  0012 81            	ret	
1861                     ; 519 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
1861                     ; 520 {
1862                     .text:	section	.text,new
1863  0000               _UART1_SetGuardTime:
1867                     ; 522     UART1->GTR = UART1_GuardTime;
1869  0000 c75239        	ld	21049,a
1870                     ; 523 }
1873  0003 81            	ret	
1905                     ; 547 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
1905                     ; 548 {
1906                     .text:	section	.text,new
1907  0000               _UART1_SetPrescaler:
1911                     ; 550     UART1->PSCR = UART1_Prescaler;
1913  0000 c7523a        	ld	21050,a
1914                     ; 551 }
1917  0003 81            	ret	
2060                     ; 559 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2060                     ; 560 {
2061                     .text:	section	.text,new
2062  0000               _UART1_GetFlagStatus:
2064  0000 89            	pushw	x
2065  0001 88            	push	a
2066       00000001      OFST:	set	1
2069                     ; 561     FlagStatus status = RESET;
2071                     ; 564     assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2073                     ; 568     if (UART1_FLAG == UART1_FLAG_LBDF)
2075  0002 a30210        	cpw	x,#528
2076  0005 2608          	jrne	L1301
2077                     ; 570         if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2079  0007 9f            	ld	a,xl
2080  0008 c45237        	and	a,21047
2081  000b 271e          	jreq	L7301
2082                     ; 573             status = SET;
2084  000d 2017          	jp	LC007
2085                     ; 578             status = RESET;
2086  000f               L1301:
2087                     ; 581     else if (UART1_FLAG == UART1_FLAG_SBK)
2089  000f 1e02          	ldw	x,(OFST+1,sp)
2090  0011 a30101        	cpw	x,#257
2091  0014 2609          	jrne	L1401
2092                     ; 583         if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2094  0016 c65235        	ld	a,21045
2095  0019 1503          	bcp	a,(OFST+2,sp)
2096  001b 270d          	jreq	L1501
2097                     ; 586             status = SET;
2099  001d 2007          	jp	LC007
2100                     ; 591             status = RESET;
2101  001f               L1401:
2102                     ; 596         if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2104  001f c65230        	ld	a,21040
2105  0022 1503          	bcp	a,(OFST+2,sp)
2106  0024 2704          	jreq	L1501
2107                     ; 599             status = SET;
2109  0026               LC007:
2112  0026 a601          	ld	a,#1
2115  0028 2001          	jra	L7301
2116  002a               L1501:
2117                     ; 604             status = RESET;
2120  002a 4f            	clr	a
2121  002b               L7301:
2122                     ; 608     return status;
2126  002b 5b03          	addw	sp,#3
2127  002d 81            	ret	
2162                     ; 638 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2162                     ; 639 {
2163                     .text:	section	.text,new
2164  0000               _UART1_ClearFlag:
2168                     ; 640     assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2170                     ; 643     if (UART1_FLAG == UART1_FLAG_RXNE)
2172  0000 a30020        	cpw	x,#32
2173  0003 2605          	jrne	L3701
2174                     ; 645         UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2176  0005 35df5230      	mov	21040,#223
2179  0009 81            	ret	
2180  000a               L3701:
2181                     ; 650         UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2183  000a 72195237      	bres	21047,#4
2184                     ; 652 }
2187  000e 81            	ret	
2261                     ; 667 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2261                     ; 668 {
2262                     .text:	section	.text,new
2263  0000               _UART1_GetITStatus:
2265  0000 89            	pushw	x
2266  0001 89            	pushw	x
2267       00000002      OFST:	set	2
2270                     ; 669     ITStatus pendingbitstatus = RESET;
2272                     ; 670     uint8_t itpos = 0;
2274                     ; 671     uint8_t itmask1 = 0;
2276                     ; 672     uint8_t itmask2 = 0;
2278                     ; 673     uint8_t enablestatus = 0;
2280                     ; 676     assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2282                     ; 679     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2284  0002 9f            	ld	a,xl
2285  0003 a40f          	and	a,#15
2286  0005 5f            	clrw	x
2287  0006 97            	ld	xl,a
2288  0007 a601          	ld	a,#1
2289  0009 5d            	tnzw	x
2290  000a 2704          	jreq	L67
2291  000c               L001:
2292  000c 48            	sll	a
2293  000d 5a            	decw	x
2294  000e 26fc          	jrne	L001
2295  0010               L67:
2296  0010 6b01          	ld	(OFST-1,sp),a
2297                     ; 681     itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2299  0012 7b04          	ld	a,(OFST+2,sp)
2300  0014 4e            	swap	a
2301  0015 a40f          	and	a,#15
2302  0017 6b02          	ld	(OFST+0,sp),a
2303                     ; 683     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2305  0019 5f            	clrw	x
2306  001a 97            	ld	xl,a
2307  001b a601          	ld	a,#1
2308  001d 5d            	tnzw	x
2309  001e 2704          	jreq	L201
2310  0020               L401:
2311  0020 48            	sll	a
2312  0021 5a            	decw	x
2313  0022 26fc          	jrne	L401
2314  0024               L201:
2315  0024 6b02          	ld	(OFST+0,sp),a
2316                     ; 687     if (UART1_IT == UART1_IT_PE)
2318  0026 1e03          	ldw	x,(OFST+1,sp)
2319  0028 a30100        	cpw	x,#256
2320  002b 260c          	jrne	L1311
2321                     ; 690         enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2323  002d c65234        	ld	a,21044
2324  0030 1402          	and	a,(OFST+0,sp)
2325  0032 6b02          	ld	(OFST+0,sp),a
2326                     ; 693         if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2328  0034 c65230        	ld	a,21040
2330                     ; 696             pendingbitstatus = SET;
2332  0037 200f          	jp	LC010
2333                     ; 701             pendingbitstatus = RESET;
2334  0039               L1311:
2335                     ; 705     else if (UART1_IT == UART1_IT_LBDF)
2337  0039 a30346        	cpw	x,#838
2338  003c 2616          	jrne	L1411
2339                     ; 708         enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2341  003e c65237        	ld	a,21047
2342  0041 1402          	and	a,(OFST+0,sp)
2343  0043 6b02          	ld	(OFST+0,sp),a
2344                     ; 710         if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2346  0045 c65237        	ld	a,21047
2348  0048               LC010:
2349  0048 1501          	bcp	a,(OFST-1,sp)
2350  004a 271a          	jreq	L1511
2351  004c 7b02          	ld	a,(OFST+0,sp)
2352  004e 2716          	jreq	L1511
2353                     ; 713             pendingbitstatus = SET;
2355  0050               LC009:
2358  0050 a601          	ld	a,#1
2360  0052 2013          	jra	L7311
2361                     ; 718             pendingbitstatus = RESET;
2362  0054               L1411:
2363                     ; 724         enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2365  0054 c65235        	ld	a,21045
2366  0057 1402          	and	a,(OFST+0,sp)
2367  0059 6b02          	ld	(OFST+0,sp),a
2368                     ; 726         if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2370  005b c65230        	ld	a,21040
2371  005e 1501          	bcp	a,(OFST-1,sp)
2372  0060 2704          	jreq	L1511
2374  0062 7b02          	ld	a,(OFST+0,sp)
2375                     ; 729             pendingbitstatus = SET;
2377  0064 26ea          	jrne	LC009
2378  0066               L1511:
2379                     ; 734             pendingbitstatus = RESET;
2383  0066 4f            	clr	a
2384  0067               L7311:
2385                     ; 739     return  pendingbitstatus;
2389  0067 5b04          	addw	sp,#4
2390  0069 81            	ret	
2426                     ; 767 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2426                     ; 768 {
2427                     .text:	section	.text,new
2428  0000               _UART1_ClearITPendingBit:
2432                     ; 769     assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2434                     ; 772     if (UART1_IT == UART1_IT_RXNE)
2436  0000 a30255        	cpw	x,#597
2437  0003 2605          	jrne	L3711
2438                     ; 774         UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2440  0005 35df5230      	mov	21040,#223
2443  0009 81            	ret	
2444  000a               L3711:
2445                     ; 779         UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2447  000a 72195237      	bres	21047,#4
2448                     ; 781 }
2451  000e 81            	ret	
2464                     	xdef	_UART1_ClearITPendingBit
2465                     	xdef	_UART1_GetITStatus
2466                     	xdef	_UART1_ClearFlag
2467                     	xdef	_UART1_GetFlagStatus
2468                     	xdef	_UART1_SetPrescaler
2469                     	xdef	_UART1_SetGuardTime
2470                     	xdef	_UART1_SetAddress
2471                     	xdef	_UART1_SendBreak
2472                     	xdef	_UART1_SendData9
2473                     	xdef	_UART1_SendData8
2474                     	xdef	_UART1_ReceiveData9
2475                     	xdef	_UART1_ReceiveData8
2476                     	xdef	_UART1_ReceiverWakeUpCmd
2477                     	xdef	_UART1_WakeUpConfig
2478                     	xdef	_UART1_SmartCardNACKCmd
2479                     	xdef	_UART1_SmartCardCmd
2480                     	xdef	_UART1_LINCmd
2481                     	xdef	_UART1_LINBreakDetectionConfig
2482                     	xdef	_UART1_IrDACmd
2483                     	xdef	_UART1_IrDAConfig
2484                     	xdef	_UART1_HalfDuplexCmd
2485                     	xdef	_UART1_ITConfig
2486                     	xdef	_UART1_Cmd
2487                     	xdef	_UART1_Init
2488                     	xdef	_UART1_DeInit
2489                     	xref	_CLK_GetClockFreq
2490                     	xref.b	c_lreg
2491                     	xref.b	c_x
2510                     	xref	c_lursh
2511                     	xref	c_lsub
2512                     	xref	c_smul
2513                     	xref	c_ludv
2514                     	xref	c_rtol
2515                     	xref	c_llsh
2516                     	xref	c_ltor
2517                     	end
