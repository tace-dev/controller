   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  48                     ; 53 void UART1_DeInit(void)
  48                     ; 54 {
  50                     	switch	.text
  51  0000               _UART1_DeInit:
  55                     ; 57   (void)UART1->SR;
  57  0000 c65230        	ld	a,21040
  58                     ; 58   (void)UART1->DR;
  60  0003 c65231        	ld	a,21041
  61                     ; 60   UART1->BRR2 = UART1_BRR2_RESET_VALUE;  /* Set UART1_BRR2 to reset value 0x00 */
  63  0006 725f5233      	clr	21043
  64                     ; 61   UART1->BRR1 = UART1_BRR1_RESET_VALUE;  /* Set UART1_BRR1 to reset value 0x00 */
  66  000a 725f5232      	clr	21042
  67                     ; 63   UART1->CR1 = UART1_CR1_RESET_VALUE;  /* Set UART1_CR1 to reset value 0x00 */
  69  000e 725f5234      	clr	21044
  70                     ; 64   UART1->CR2 = UART1_CR2_RESET_VALUE;  /* Set UART1_CR2 to reset value 0x00 */
  72  0012 725f5235      	clr	21045
  73                     ; 65   UART1->CR3 = UART1_CR3_RESET_VALUE;  /* Set UART1_CR3 to reset value 0x00 */
  75  0016 725f5236      	clr	21046
  76                     ; 66   UART1->CR4 = UART1_CR4_RESET_VALUE;  /* Set UART1_CR4 to reset value 0x00 */
  78  001a 725f5237      	clr	21047
  79                     ; 67   UART1->CR5 = UART1_CR5_RESET_VALUE;  /* Set UART1_CR5 to reset value 0x00 */
  81  001e 725f5238      	clr	21048
  82                     ; 69   UART1->GTR = UART1_GTR_RESET_VALUE;
  84  0022 725f5239      	clr	21049
  85                     ; 70   UART1->PSCR = UART1_PSCR_RESET_VALUE;
  87  0026 725f523a      	clr	21050
  88                     ; 71 }
  91  002a 81            	ret	
 395                     .const:	section	.text
 396  0000               L21:
 397  0000 00098969      	dc.l	625001
 398  0004               L27:
 399  0004 00000064      	dc.l	100
 400                     ; 90 void UART1_Init(uint32_t BaudRate, UART1_WordLength_TypeDef WordLength, 
 400                     ; 91                 UART1_StopBits_TypeDef StopBits, UART1_Parity_TypeDef Parity, 
 400                     ; 92                 UART1_SyncMode_TypeDef SyncMode, UART1_Mode_TypeDef Mode)
 400                     ; 93 {
 401                     	switch	.text
 402  002b               _UART1_Init:
 404  002b 520c          	subw	sp,#12
 405       0000000c      OFST:	set	12
 408                     ; 94   uint32_t BaudRate_Mantissa = 0, BaudRate_Mantissa100 = 0;
 412                     ; 97   assert_param(IS_UART1_BAUDRATE_OK(BaudRate));
 414  002d 96            	ldw	x,sp
 415  002e 1c000f        	addw	x,#OFST+3
 416  0031 cd0000        	call	c_ltor
 418  0034 ae0000        	ldw	x,#L21
 419  0037 cd0000        	call	c_lcmp
 421  003a 2506          	jrult	L41
 422  003c ae0061        	ldw	x,#97
 423  003f cd01e0        	call	LC001
 424  0042               L41:
 425                     ; 98   assert_param(IS_UART1_WORDLENGTH_OK(WordLength));
 427  0042 7b13          	ld	a,(OFST+7,sp)
 428  0044 270a          	jreq	L42
 429  0046 a110          	cp	a,#16
 430  0048 2706          	jreq	L42
 431  004a ae0062        	ldw	x,#98
 432  004d cd01e0        	call	LC001
 433  0050               L42:
 434                     ; 99   assert_param(IS_UART1_STOPBITS_OK(StopBits));
 436  0050 7b14          	ld	a,(OFST+8,sp)
 437  0052 2712          	jreq	L43
 438  0054 a110          	cp	a,#16
 439  0056 270e          	jreq	L43
 440  0058 a120          	cp	a,#32
 441  005a 270a          	jreq	L43
 442  005c a130          	cp	a,#48
 443  005e 2706          	jreq	L43
 444  0060 ae0063        	ldw	x,#99
 445  0063 cd01e0        	call	LC001
 446  0066               L43:
 447                     ; 100   assert_param(IS_UART1_PARITY_OK(Parity));
 449  0066 7b15          	ld	a,(OFST+9,sp)
 450  0068 270e          	jreq	L44
 451  006a a104          	cp	a,#4
 452  006c 270a          	jreq	L44
 453  006e a106          	cp	a,#6
 454  0070 2706          	jreq	L44
 455  0072 ae0064        	ldw	x,#100
 456  0075 cd01e0        	call	LC001
 457  0078               L44:
 458                     ; 101   assert_param(IS_UART1_MODE_OK((uint8_t)Mode));
 460  0078 7b17          	ld	a,(OFST+11,sp)
 461  007a a108          	cp	a,#8
 462  007c 2722          	jreq	L45
 463  007e a140          	cp	a,#64
 464  0080 271e          	jreq	L45
 465  0082 a104          	cp	a,#4
 466  0084 271a          	jreq	L45
 467  0086 a180          	cp	a,#128
 468  0088 2716          	jreq	L45
 469  008a a10c          	cp	a,#12
 470  008c 2712          	jreq	L45
 471  008e a144          	cp	a,#68
 472  0090 270e          	jreq	L45
 473  0092 a1c0          	cp	a,#192
 474  0094 270a          	jreq	L45
 475  0096 a188          	cp	a,#136
 476  0098 2706          	jreq	L45
 477  009a ae0065        	ldw	x,#101
 478  009d cd01e0        	call	LC001
 479  00a0               L45:
 480                     ; 102   assert_param(IS_UART1_SYNCMODE_OK((uint8_t)SyncMode));
 482  00a0 7b16          	ld	a,(OFST+10,sp)
 483  00a2 a488          	and	a,#136
 484  00a4 a188          	cp	a,#136
 485  00a6 2718          	jreq	L06
 486  00a8 7b16          	ld	a,(OFST+10,sp)
 487  00aa a444          	and	a,#68
 488  00ac a144          	cp	a,#68
 489  00ae 2710          	jreq	L06
 490  00b0 7b16          	ld	a,(OFST+10,sp)
 491  00b2 a422          	and	a,#34
 492  00b4 a122          	cp	a,#34
 493  00b6 2708          	jreq	L06
 494  00b8 7b16          	ld	a,(OFST+10,sp)
 495  00ba a411          	and	a,#17
 496  00bc a111          	cp	a,#17
 497  00be 2606          	jrne	L26
 498  00c0               L06:
 499  00c0 ae0066        	ldw	x,#102
 500  00c3 cd01e0        	call	LC001
 501  00c6               L26:
 502                     ; 105   UART1->CR1 &= (uint8_t)(~UART1_CR1_M);  
 504  00c6 72195234      	bres	21044,#4
 505                     ; 108   UART1->CR1 |= (uint8_t)WordLength;
 507  00ca c65234        	ld	a,21044
 508  00cd 1a13          	or	a,(OFST+7,sp)
 509  00cf c75234        	ld	21044,a
 510                     ; 111   UART1->CR3 &= (uint8_t)(~UART1_CR3_STOP);  
 512  00d2 c65236        	ld	a,21046
 513  00d5 a4cf          	and	a,#207
 514  00d7 c75236        	ld	21046,a
 515                     ; 113   UART1->CR3 |= (uint8_t)StopBits;  
 517  00da c65236        	ld	a,21046
 518  00dd 1a14          	or	a,(OFST+8,sp)
 519  00df c75236        	ld	21046,a
 520                     ; 116   UART1->CR1 &= (uint8_t)(~(UART1_CR1_PCEN | UART1_CR1_PS  ));  
 522  00e2 c65234        	ld	a,21044
 523  00e5 a4f9          	and	a,#249
 524  00e7 c75234        	ld	21044,a
 525                     ; 118   UART1->CR1 |= (uint8_t)Parity;  
 527  00ea c65234        	ld	a,21044
 528  00ed 1a15          	or	a,(OFST+9,sp)
 529  00ef c75234        	ld	21044,a
 530                     ; 121   UART1->BRR1 &= (uint8_t)(~UART1_BRR1_DIVM);  
 532  00f2 725f5232      	clr	21042
 533                     ; 123   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVM);  
 535  00f6 c65233        	ld	a,21043
 536  00f9 a40f          	and	a,#15
 537  00fb c75233        	ld	21043,a
 538                     ; 125   UART1->BRR2 &= (uint8_t)(~UART1_BRR2_DIVF);  
 540  00fe c65233        	ld	a,21043
 541  0101 a4f0          	and	a,#240
 542  0103 c75233        	ld	21043,a
 543                     ; 128   BaudRate_Mantissa    = ((uint32_t)CLK_GetClockFreq() / (BaudRate << 4));
 545  0106 96            	ldw	x,sp
 546  0107 cd01ec        	call	LC002
 548  010a 96            	ldw	x,sp
 549  010b 5c            	incw	x
 550  010c cd0000        	call	c_rtol
 553  010f cd0000        	call	_CLK_GetClockFreq
 555  0112 96            	ldw	x,sp
 556  0113 5c            	incw	x
 557  0114 cd0000        	call	c_ludv
 559  0117 96            	ldw	x,sp
 560  0118 1c0009        	addw	x,#OFST-3
 561  011b cd0000        	call	c_rtol
 564                     ; 129   BaudRate_Mantissa100 = (((uint32_t)CLK_GetClockFreq() * 100) / (BaudRate << 4));
 566  011e 96            	ldw	x,sp
 567  011f cd01ec        	call	LC002
 569  0122 96            	ldw	x,sp
 570  0123 5c            	incw	x
 571  0124 cd0000        	call	c_rtol
 574  0127 cd0000        	call	_CLK_GetClockFreq
 576  012a a664          	ld	a,#100
 577  012c cd0000        	call	c_smul
 579  012f 96            	ldw	x,sp
 580  0130 5c            	incw	x
 581  0131 cd0000        	call	c_ludv
 583  0134 96            	ldw	x,sp
 584  0135 1c0005        	addw	x,#OFST-7
 585  0138 cd0000        	call	c_rtol
 588                     ; 131   UART1->BRR2 |= (uint8_t)((uint8_t)(((BaudRate_Mantissa100 - (BaudRate_Mantissa * 100)) << 4) / 100) & (uint8_t)0x0F); 
 590  013b 96            	ldw	x,sp
 591  013c 1c0009        	addw	x,#OFST-3
 592  013f cd0000        	call	c_ltor
 594  0142 a664          	ld	a,#100
 595  0144 cd0000        	call	c_smul
 597  0147 96            	ldw	x,sp
 598  0148 5c            	incw	x
 599  0149 cd0000        	call	c_rtol
 602  014c 96            	ldw	x,sp
 603  014d 1c0005        	addw	x,#OFST-7
 604  0150 cd0000        	call	c_ltor
 606  0153 96            	ldw	x,sp
 607  0154 5c            	incw	x
 608  0155 cd0000        	call	c_lsub
 610  0158 a604          	ld	a,#4
 611  015a cd0000        	call	c_llsh
 613  015d ae0004        	ldw	x,#L27
 614  0160 cd0000        	call	c_ludv
 616  0163 b603          	ld	a,c_lreg+3
 617  0165 a40f          	and	a,#15
 618  0167 ca5233        	or	a,21043
 619  016a c75233        	ld	21043,a
 620                     ; 133   UART1->BRR2 |= (uint8_t)((BaudRate_Mantissa >> 4) & (uint8_t)0xF0); 
 622  016d 96            	ldw	x,sp
 623  016e 1c0009        	addw	x,#OFST-3
 624  0171 cd0000        	call	c_ltor
 626  0174 a604          	ld	a,#4
 627  0176 cd0000        	call	c_lursh
 629  0179 b603          	ld	a,c_lreg+3
 630  017b a4f0          	and	a,#240
 631  017d b703          	ld	c_lreg+3,a
 632  017f 3f02          	clr	c_lreg+2
 633  0181 3f01          	clr	c_lreg+1
 634  0183 3f00          	clr	c_lreg
 635  0185 ca5233        	or	a,21043
 636  0188 c75233        	ld	21043,a
 637                     ; 135   UART1->BRR1 |= (uint8_t)BaudRate_Mantissa;           
 639  018b c65232        	ld	a,21042
 640  018e 1a0c          	or	a,(OFST+0,sp)
 641  0190 c75232        	ld	21042,a
 642                     ; 138   UART1->CR2 &= (uint8_t)~(UART1_CR2_TEN | UART1_CR2_REN); 
 644  0193 c65235        	ld	a,21045
 645  0196 a4f3          	and	a,#243
 646  0198 c75235        	ld	21045,a
 647                     ; 140   UART1->CR3 &= (uint8_t)~(UART1_CR3_CPOL | UART1_CR3_CPHA | UART1_CR3_LBCL); 
 649  019b c65236        	ld	a,21046
 650  019e a4f8          	and	a,#248
 651  01a0 c75236        	ld	21046,a
 652                     ; 142   UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & (uint8_t)(UART1_CR3_CPOL | 
 652                     ; 143                                                         UART1_CR3_CPHA | UART1_CR3_LBCL));  
 654  01a3 7b16          	ld	a,(OFST+10,sp)
 655  01a5 a407          	and	a,#7
 656  01a7 ca5236        	or	a,21046
 657  01aa c75236        	ld	21046,a
 658                     ; 145   if ((uint8_t)(Mode & UART1_MODE_TX_ENABLE))
 660  01ad 7b17          	ld	a,(OFST+11,sp)
 661  01af a504          	bcp	a,#4
 662  01b1 2706          	jreq	L571
 663                     ; 148     UART1->CR2 |= (uint8_t)UART1_CR2_TEN;  
 665  01b3 72165235      	bset	21045,#3
 667  01b7 2004          	jra	L771
 668  01b9               L571:
 669                     ; 153     UART1->CR2 &= (uint8_t)(~UART1_CR2_TEN);  
 671  01b9 72175235      	bres	21045,#3
 672  01bd               L771:
 673                     ; 155   if ((uint8_t)(Mode & UART1_MODE_RX_ENABLE))
 675  01bd a508          	bcp	a,#8
 676  01bf 2706          	jreq	L102
 677                     ; 158     UART1->CR2 |= (uint8_t)UART1_CR2_REN;  
 679  01c1 72145235      	bset	21045,#2
 681  01c5 2004          	jra	L302
 682  01c7               L102:
 683                     ; 163     UART1->CR2 &= (uint8_t)(~UART1_CR2_REN);  
 685  01c7 72155235      	bres	21045,#2
 686  01cb               L302:
 687                     ; 167   if ((uint8_t)(SyncMode & UART1_SYNCMODE_CLOCK_DISABLE))
 689  01cb 7b16          	ld	a,(OFST+10,sp)
 690  01cd 2a06          	jrpl	L502
 691                     ; 170     UART1->CR3 &= (uint8_t)(~UART1_CR3_CKEN); 
 693  01cf 72175236      	bres	21046,#3
 695  01d3 2008          	jra	L702
 696  01d5               L502:
 697                     ; 174     UART1->CR3 |= (uint8_t)((uint8_t)SyncMode & UART1_CR3_CKEN);
 699  01d5 a408          	and	a,#8
 700  01d7 ca5236        	or	a,21046
 701  01da c75236        	ld	21046,a
 702  01dd               L702:
 703                     ; 176 }
 706  01dd 5b0c          	addw	sp,#12
 707  01df 81            	ret	
 708  01e0               LC001:
 709  01e0 89            	pushw	x
 710  01e1 5f            	clrw	x
 711  01e2 89            	pushw	x
 712  01e3 ae0008        	ldw	x,#L371
 713  01e6 cd0000        	call	_assert_failed
 715  01e9 5b04          	addw	sp,#4
 716  01eb 81            	ret	
 717  01ec               LC002:
 718  01ec 1c000f        	addw	x,#OFST+3
 719  01ef cd0000        	call	c_ltor
 721  01f2 a604          	ld	a,#4
 722  01f4 cc0000        	jp	c_llsh
 777                     ; 184 void UART1_Cmd(FunctionalState NewState)
 777                     ; 185 {
 778                     	switch	.text
 779  01f7               _UART1_Cmd:
 783                     ; 186   if (NewState != DISABLE)
 785  01f7 4d            	tnz	a
 786  01f8 2705          	jreq	L732
 787                     ; 189     UART1->CR1 &= (uint8_t)(~UART1_CR1_UARTD); 
 789  01fa 721b5234      	bres	21044,#5
 792  01fe 81            	ret	
 793  01ff               L732:
 794                     ; 194     UART1->CR1 |= UART1_CR1_UARTD;  
 796  01ff 721a5234      	bset	21044,#5
 797                     ; 196 }
 800  0203 81            	ret	
 926                     ; 211 void UART1_ITConfig(UART1_IT_TypeDef UART1_IT, FunctionalState NewState)
 926                     ; 212 {
 927                     	switch	.text
 928  0204               _UART1_ITConfig:
 930  0204 89            	pushw	x
 931  0205 89            	pushw	x
 932       00000002      OFST:	set	2
 935                     ; 213   uint8_t uartreg = 0, itpos = 0x00;
 939                     ; 216   assert_param(IS_UART1_CONFIG_IT_OK(UART1_IT));
 941  0206 a30100        	cpw	x,#256
 942  0209 271e          	jreq	L401
 943  020b a30277        	cpw	x,#631
 944  020e 2719          	jreq	L401
 945  0210 a30266        	cpw	x,#614
 946  0213 2714          	jreq	L401
 947  0215 a30205        	cpw	x,#517
 948  0218 270f          	jreq	L401
 949  021a a30244        	cpw	x,#580
 950  021d 270a          	jreq	L401
 951  021f a30346        	cpw	x,#838
 952  0222 2705          	jreq	L401
 953  0224 ae00d8        	ldw	x,#216
 954  0227 ad70          	call	LC006
 955  0229               L401:
 956                     ; 217   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 958  0229 7b07          	ld	a,(OFST+5,sp)
 959  022b 2708          	jreq	L411
 960  022d 4a            	dec	a
 961  022e 2705          	jreq	L411
 962  0230 ae00d9        	ldw	x,#217
 963  0233 ad64          	call	LC006
 964  0235               L411:
 965                     ; 220   uartreg = (uint8_t)((uint16_t)UART1_IT >> 0x08);
 967  0235 7b03          	ld	a,(OFST+1,sp)
 968  0237 6b01          	ld	(OFST-1,sp),a
 970                     ; 222   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
 972  0239 7b04          	ld	a,(OFST+2,sp)
 973  023b a40f          	and	a,#15
 974  023d 5f            	clrw	x
 975  023e 97            	ld	xl,a
 976  023f a601          	ld	a,#1
 977  0241 5d            	tnzw	x
 978  0242 2704          	jreq	L021
 979  0244               L221:
 980  0244 48            	sll	a
 981  0245 5a            	decw	x
 982  0246 26fc          	jrne	L221
 983  0248               L021:
 984  0248 6b02          	ld	(OFST+0,sp),a
 986                     ; 224   if (NewState != DISABLE)
 988  024a 7b07          	ld	a,(OFST+5,sp)
 989  024c 271f          	jreq	L123
 990                     ; 227     if (uartreg == 0x01)
 992  024e 7b01          	ld	a,(OFST-1,sp)
 993  0250 a101          	cp	a,#1
 994  0252 2607          	jrne	L323
 995                     ; 229       UART1->CR1 |= itpos;
 997  0254 c65234        	ld	a,21044
 998  0257 1a02          	or	a,(OFST+0,sp)
1000  0259 201e          	jp	LC004
1001  025b               L323:
1002                     ; 231     else if (uartreg == 0x02)
1004  025b a102          	cp	a,#2
1005  025d 2607          	jrne	L723
1006                     ; 233       UART1->CR2 |= itpos;
1008  025f c65235        	ld	a,21045
1009  0262 1a02          	or	a,(OFST+0,sp)
1011  0264 2022          	jp	LC005
1012  0266               L723:
1013                     ; 237       UART1->CR4 |= itpos;
1015  0266 c65237        	ld	a,21047
1016  0269 1a02          	or	a,(OFST+0,sp)
1017  026b 2026          	jp	LC003
1018  026d               L123:
1019                     ; 243     if (uartreg == 0x01)
1021  026d 7b01          	ld	a,(OFST-1,sp)
1022  026f a101          	cp	a,#1
1023  0271 260b          	jrne	L533
1024                     ; 245       UART1->CR1 &= (uint8_t)(~itpos);
1026  0273 7b02          	ld	a,(OFST+0,sp)
1027  0275 43            	cpl	a
1028  0276 c45234        	and	a,21044
1029  0279               LC004:
1030  0279 c75234        	ld	21044,a
1032  027c 2018          	jra	L333
1033  027e               L533:
1034                     ; 247     else if (uartreg == 0x02)
1036  027e a102          	cp	a,#2
1037  0280 260b          	jrne	L143
1038                     ; 249       UART1->CR2 &= (uint8_t)(~itpos);
1040  0282 7b02          	ld	a,(OFST+0,sp)
1041  0284 43            	cpl	a
1042  0285 c45235        	and	a,21045
1043  0288               LC005:
1044  0288 c75235        	ld	21045,a
1046  028b 2009          	jra	L333
1047  028d               L143:
1048                     ; 253       UART1->CR4 &= (uint8_t)(~itpos);
1050  028d 7b02          	ld	a,(OFST+0,sp)
1051  028f 43            	cpl	a
1052  0290 c45237        	and	a,21047
1053  0293               LC003:
1054  0293 c75237        	ld	21047,a
1055  0296               L333:
1056                     ; 257 }
1059  0296 5b04          	addw	sp,#4
1060  0298 81            	ret	
1061  0299               LC006:
1062  0299 89            	pushw	x
1063  029a 5f            	clrw	x
1064  029b 89            	pushw	x
1065  029c ae0008        	ldw	x,#L371
1066  029f cd0000        	call	_assert_failed
1068  02a2 5b04          	addw	sp,#4
1069  02a4 81            	ret	
1106                     ; 265 void UART1_HalfDuplexCmd(FunctionalState NewState)
1106                     ; 266 {
1107                     	switch	.text
1108  02a5               _UART1_HalfDuplexCmd:
1110  02a5 88            	push	a
1111       00000000      OFST:	set	0
1114                     ; 267   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1116  02a6 4d            	tnz	a
1117  02a7 2711          	jreq	L231
1118  02a9 4a            	dec	a
1119  02aa 270e          	jreq	L231
1120  02ac ae010b        	ldw	x,#267
1121  02af 89            	pushw	x
1122  02b0 5f            	clrw	x
1123  02b1 89            	pushw	x
1124  02b2 ae0008        	ldw	x,#L371
1125  02b5 cd0000        	call	_assert_failed
1127  02b8 5b04          	addw	sp,#4
1128  02ba               L231:
1129                     ; 269   if (NewState != DISABLE)
1131  02ba 7b01          	ld	a,(OFST+1,sp)
1132  02bc 2706          	jreq	L363
1133                     ; 271     UART1->CR5 |= UART1_CR5_HDSEL;  /**< UART1 Half Duplex Enable  */
1135  02be 72165238      	bset	21048,#3
1137  02c2 2004          	jra	L563
1138  02c4               L363:
1139                     ; 275     UART1->CR5 &= (uint8_t)~UART1_CR5_HDSEL; /**< UART1 Half Duplex Disable */
1141  02c4 72175238      	bres	21048,#3
1142  02c8               L563:
1143                     ; 277 }
1146  02c8 84            	pop	a
1147  02c9 81            	ret	
1205                     ; 285 void UART1_IrDAConfig(UART1_IrDAMode_TypeDef UART1_IrDAMode)
1205                     ; 286 {
1206                     	switch	.text
1207  02ca               _UART1_IrDAConfig:
1209  02ca 88            	push	a
1210       00000000      OFST:	set	0
1213                     ; 287   assert_param(IS_UART1_IRDAMODE_OK(UART1_IrDAMode));
1215  02cb a101          	cp	a,#1
1216  02cd 2711          	jreq	L441
1217  02cf 4d            	tnz	a
1218  02d0 270e          	jreq	L441
1219  02d2 ae011f        	ldw	x,#287
1220  02d5 89            	pushw	x
1221  02d6 5f            	clrw	x
1222  02d7 89            	pushw	x
1223  02d8 ae0008        	ldw	x,#L371
1224  02db cd0000        	call	_assert_failed
1226  02de 5b04          	addw	sp,#4
1227  02e0               L441:
1228                     ; 289   if (UART1_IrDAMode != UART1_IRDAMODE_NORMAL)
1230  02e0 7b01          	ld	a,(OFST+1,sp)
1231  02e2 2706          	jreq	L514
1232                     ; 291     UART1->CR5 |= UART1_CR5_IRLP;
1234  02e4 72145238      	bset	21048,#2
1236  02e8 2004          	jra	L714
1237  02ea               L514:
1238                     ; 295     UART1->CR5 &= ((uint8_t)~UART1_CR5_IRLP);
1240  02ea 72155238      	bres	21048,#2
1241  02ee               L714:
1242                     ; 297 }
1245  02ee 84            	pop	a
1246  02ef 81            	ret	
1282                     ; 305 void UART1_IrDACmd(FunctionalState NewState)
1282                     ; 306 {
1283                     	switch	.text
1284  02f0               _UART1_IrDACmd:
1286  02f0 88            	push	a
1287       00000000      OFST:	set	0
1290                     ; 308   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1292  02f1 4d            	tnz	a
1293  02f2 2711          	jreq	L651
1294  02f4 4a            	dec	a
1295  02f5 270e          	jreq	L651
1296  02f7 ae0134        	ldw	x,#308
1297  02fa 89            	pushw	x
1298  02fb 5f            	clrw	x
1299  02fc 89            	pushw	x
1300  02fd ae0008        	ldw	x,#L371
1301  0300 cd0000        	call	_assert_failed
1303  0303 5b04          	addw	sp,#4
1304  0305               L651:
1305                     ; 310   if (NewState != DISABLE)
1307  0305 7b01          	ld	a,(OFST+1,sp)
1308  0307 2706          	jreq	L734
1309                     ; 313     UART1->CR5 |= UART1_CR5_IREN;
1311  0309 72125238      	bset	21048,#1
1313  030d 2004          	jra	L144
1314  030f               L734:
1315                     ; 318     UART1->CR5 &= ((uint8_t)~UART1_CR5_IREN);
1317  030f 72135238      	bres	21048,#1
1318  0313               L144:
1319                     ; 320 }
1322  0313 84            	pop	a
1323  0314 81            	ret	
1383                     ; 329 void UART1_LINBreakDetectionConfig(UART1_LINBreakDetectionLength_TypeDef UART1_LINBreakDetectionLength)
1383                     ; 330 {
1384                     	switch	.text
1385  0315               _UART1_LINBreakDetectionConfig:
1387  0315 88            	push	a
1388       00000000      OFST:	set	0
1391                     ; 331   assert_param(IS_UART1_LINBREAKDETECTIONLENGTH_OK(UART1_LINBreakDetectionLength));
1393  0316 4d            	tnz	a
1394  0317 2711          	jreq	L071
1395  0319 4a            	dec	a
1396  031a 270e          	jreq	L071
1397  031c ae014b        	ldw	x,#331
1398  031f 89            	pushw	x
1399  0320 5f            	clrw	x
1400  0321 89            	pushw	x
1401  0322 ae0008        	ldw	x,#L371
1402  0325 cd0000        	call	_assert_failed
1404  0328 5b04          	addw	sp,#4
1405  032a               L071:
1406                     ; 333   if (UART1_LINBreakDetectionLength != UART1_LINBREAKDETECTIONLENGTH_10BITS)
1408  032a 7b01          	ld	a,(OFST+1,sp)
1409  032c 2706          	jreq	L174
1410                     ; 335     UART1->CR4 |= UART1_CR4_LBDL;
1412  032e 721a5237      	bset	21047,#5
1414  0332 2004          	jra	L374
1415  0334               L174:
1416                     ; 339     UART1->CR4 &= ((uint8_t)~UART1_CR4_LBDL);
1418  0334 721b5237      	bres	21047,#5
1419  0338               L374:
1420                     ; 341 }
1423  0338 84            	pop	a
1424  0339 81            	ret	
1460                     ; 349 void UART1_LINCmd(FunctionalState NewState)
1460                     ; 350 {
1461                     	switch	.text
1462  033a               _UART1_LINCmd:
1464  033a 88            	push	a
1465       00000000      OFST:	set	0
1468                     ; 351   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1470  033b 4d            	tnz	a
1471  033c 2711          	jreq	L202
1472  033e 4a            	dec	a
1473  033f 270e          	jreq	L202
1474  0341 ae015f        	ldw	x,#351
1475  0344 89            	pushw	x
1476  0345 5f            	clrw	x
1477  0346 89            	pushw	x
1478  0347 ae0008        	ldw	x,#L371
1479  034a cd0000        	call	_assert_failed
1481  034d 5b04          	addw	sp,#4
1482  034f               L202:
1483                     ; 353   if (NewState != DISABLE)
1485  034f 7b01          	ld	a,(OFST+1,sp)
1486  0351 2706          	jreq	L315
1487                     ; 356     UART1->CR3 |= UART1_CR3_LINEN;
1489  0353 721c5236      	bset	21046,#6
1491  0357 2004          	jra	L515
1492  0359               L315:
1493                     ; 361     UART1->CR3 &= ((uint8_t)~UART1_CR3_LINEN);
1495  0359 721d5236      	bres	21046,#6
1496  035d               L515:
1497                     ; 363 }
1500  035d 84            	pop	a
1501  035e 81            	ret	
1537                     ; 371 void UART1_SmartCardCmd(FunctionalState NewState)
1537                     ; 372 {
1538                     	switch	.text
1539  035f               _UART1_SmartCardCmd:
1541  035f 88            	push	a
1542       00000000      OFST:	set	0
1545                     ; 373   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1547  0360 4d            	tnz	a
1548  0361 2711          	jreq	L412
1549  0363 4a            	dec	a
1550  0364 270e          	jreq	L412
1551  0366 ae0175        	ldw	x,#373
1552  0369 89            	pushw	x
1553  036a 5f            	clrw	x
1554  036b 89            	pushw	x
1555  036c ae0008        	ldw	x,#L371
1556  036f cd0000        	call	_assert_failed
1558  0372 5b04          	addw	sp,#4
1559  0374               L412:
1560                     ; 375   if (NewState != DISABLE)
1562  0374 7b01          	ld	a,(OFST+1,sp)
1563  0376 2706          	jreq	L535
1564                     ; 378     UART1->CR5 |= UART1_CR5_SCEN;
1566  0378 721a5238      	bset	21048,#5
1568  037c 2004          	jra	L735
1569  037e               L535:
1570                     ; 383     UART1->CR5 &= ((uint8_t)(~UART1_CR5_SCEN));
1572  037e 721b5238      	bres	21048,#5
1573  0382               L735:
1574                     ; 385 }
1577  0382 84            	pop	a
1578  0383 81            	ret	
1615                     ; 394 void UART1_SmartCardNACKCmd(FunctionalState NewState)
1615                     ; 395 {
1616                     	switch	.text
1617  0384               _UART1_SmartCardNACKCmd:
1619  0384 88            	push	a
1620       00000000      OFST:	set	0
1623                     ; 396   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1625  0385 4d            	tnz	a
1626  0386 2711          	jreq	L622
1627  0388 4a            	dec	a
1628  0389 270e          	jreq	L622
1629  038b ae018c        	ldw	x,#396
1630  038e 89            	pushw	x
1631  038f 5f            	clrw	x
1632  0390 89            	pushw	x
1633  0391 ae0008        	ldw	x,#L371
1634  0394 cd0000        	call	_assert_failed
1636  0397 5b04          	addw	sp,#4
1637  0399               L622:
1638                     ; 398   if (NewState != DISABLE)
1640  0399 7b01          	ld	a,(OFST+1,sp)
1641  039b 2706          	jreq	L755
1642                     ; 401     UART1->CR5 |= UART1_CR5_NACK;
1644  039d 72185238      	bset	21048,#4
1646  03a1 2004          	jra	L165
1647  03a3               L755:
1648                     ; 406     UART1->CR5 &= ((uint8_t)~(UART1_CR5_NACK));
1650  03a3 72195238      	bres	21048,#4
1651  03a7               L165:
1652                     ; 408 }
1655  03a7 84            	pop	a
1656  03a8 81            	ret	
1714                     ; 416 void UART1_WakeUpConfig(UART1_WakeUp_TypeDef UART1_WakeUp)
1714                     ; 417 {
1715                     	switch	.text
1716  03a9               _UART1_WakeUpConfig:
1718  03a9 88            	push	a
1719       00000000      OFST:	set	0
1722                     ; 418   assert_param(IS_UART1_WAKEUP_OK(UART1_WakeUp));
1724  03aa 4d            	tnz	a
1725  03ab 2712          	jreq	L042
1726  03ad a108          	cp	a,#8
1727  03af 270e          	jreq	L042
1728  03b1 ae01a2        	ldw	x,#418
1729  03b4 89            	pushw	x
1730  03b5 5f            	clrw	x
1731  03b6 89            	pushw	x
1732  03b7 ae0008        	ldw	x,#L371
1733  03ba cd0000        	call	_assert_failed
1735  03bd 5b04          	addw	sp,#4
1736  03bf               L042:
1737                     ; 420   UART1->CR1 &= ((uint8_t)~UART1_CR1_WAKE);
1739  03bf 72175234      	bres	21044,#3
1740                     ; 421   UART1->CR1 |= (uint8_t)UART1_WakeUp;
1742  03c3 c65234        	ld	a,21044
1743  03c6 1a01          	or	a,(OFST+1,sp)
1744  03c8 c75234        	ld	21044,a
1745                     ; 422 }
1748  03cb 84            	pop	a
1749  03cc 81            	ret	
1786                     ; 430 void UART1_ReceiverWakeUpCmd(FunctionalState NewState)
1786                     ; 431 {
1787                     	switch	.text
1788  03cd               _UART1_ReceiverWakeUpCmd:
1790  03cd 88            	push	a
1791       00000000      OFST:	set	0
1794                     ; 432   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1796  03ce 4d            	tnz	a
1797  03cf 2711          	jreq	L252
1798  03d1 4a            	dec	a
1799  03d2 270e          	jreq	L252
1800  03d4 ae01b0        	ldw	x,#432
1801  03d7 89            	pushw	x
1802  03d8 5f            	clrw	x
1803  03d9 89            	pushw	x
1804  03da ae0008        	ldw	x,#L371
1805  03dd cd0000        	call	_assert_failed
1807  03e0 5b04          	addw	sp,#4
1808  03e2               L252:
1809                     ; 434   if (NewState != DISABLE)
1811  03e2 7b01          	ld	a,(OFST+1,sp)
1812  03e4 2706          	jreq	L726
1813                     ; 437     UART1->CR2 |= UART1_CR2_RWU;
1815  03e6 72125235      	bset	21045,#1
1817  03ea 2004          	jra	L136
1818  03ec               L726:
1819                     ; 442     UART1->CR2 &= ((uint8_t)~UART1_CR2_RWU);
1821  03ec 72135235      	bres	21045,#1
1822  03f0               L136:
1823                     ; 444 }
1826  03f0 84            	pop	a
1827  03f1 81            	ret	
1850                     ; 451 uint8_t UART1_ReceiveData8(void)
1850                     ; 452 {
1851                     	switch	.text
1852  03f2               _UART1_ReceiveData8:
1856                     ; 453   return ((uint8_t)UART1->DR);
1858  03f2 c65231        	ld	a,21041
1861  03f5 81            	ret	
1895                     ; 461 uint16_t UART1_ReceiveData9(void)
1895                     ; 462 {
1896                     	switch	.text
1897  03f6               _UART1_ReceiveData9:
1899  03f6 89            	pushw	x
1900       00000002      OFST:	set	2
1903                     ; 463   uint16_t temp = 0;
1905                     ; 465   temp = (uint16_t)(((uint16_t)( (uint16_t)UART1->CR1 & (uint16_t)UART1_CR1_R8)) << 1);
1907  03f7 c65234        	ld	a,21044
1908  03fa a480          	and	a,#128
1909  03fc 5f            	clrw	x
1910  03fd 02            	rlwa	x,a
1911  03fe 58            	sllw	x
1912  03ff 1f01          	ldw	(OFST-1,sp),x
1914                     ; 466   return (uint16_t)( (((uint16_t) UART1->DR) | temp ) & ((uint16_t)0x01FF));
1916  0401 c65231        	ld	a,21041
1917  0404 5f            	clrw	x
1918  0405 97            	ld	xl,a
1919  0406 01            	rrwa	x,a
1920  0407 1a02          	or	a,(OFST+0,sp)
1921  0409 01            	rrwa	x,a
1922  040a 1a01          	or	a,(OFST-1,sp)
1923  040c a401          	and	a,#1
1924  040e 01            	rrwa	x,a
1927  040f 5b02          	addw	sp,#2
1928  0411 81            	ret	
1962                     ; 474 void UART1_SendData8(uint8_t Data)
1962                     ; 475 {
1963                     	switch	.text
1964  0412               _UART1_SendData8:
1968                     ; 477   UART1->DR = Data;
1970  0412 c75231        	ld	21041,a
1971                     ; 478 }
1974  0415 81            	ret	
2008                     ; 486 void UART1_SendData9(uint16_t Data)
2008                     ; 487 {
2009                     	switch	.text
2010  0416               _UART1_SendData9:
2012  0416 89            	pushw	x
2013       00000000      OFST:	set	0
2016                     ; 489   UART1->CR1 &= ((uint8_t)~UART1_CR1_T8);
2018  0417 721d5234      	bres	21044,#6
2019                     ; 491   UART1->CR1 |= (uint8_t)(((uint8_t)(Data >> 2)) & UART1_CR1_T8);
2021  041b 54            	srlw	x
2022  041c 54            	srlw	x
2023  041d 9f            	ld	a,xl
2024  041e a440          	and	a,#64
2025  0420 ca5234        	or	a,21044
2026  0423 c75234        	ld	21044,a
2027                     ; 493   UART1->DR   = (uint8_t)(Data);
2029  0426 7b02          	ld	a,(OFST+2,sp)
2030  0428 c75231        	ld	21041,a
2031                     ; 494 }
2034  042b 85            	popw	x
2035  042c 81            	ret	
2058                     ; 501 void UART1_SendBreak(void)
2058                     ; 502 {
2059                     	switch	.text
2060  042d               _UART1_SendBreak:
2064                     ; 503   UART1->CR2 |= UART1_CR2_SBK;
2066  042d 72105235      	bset	21045,#0
2067                     ; 504 }
2070  0431 81            	ret	
2105                     ; 511 void UART1_SetAddress(uint8_t UART1_Address)
2105                     ; 512 {
2106                     	switch	.text
2107  0432               _UART1_SetAddress:
2109  0432 88            	push	a
2110       00000000      OFST:	set	0
2113                     ; 514   assert_param(IS_UART1_ADDRESS_OK(UART1_Address));
2115  0433 a110          	cp	a,#16
2116  0435 250e          	jrult	L472
2117  0437 ae0202        	ldw	x,#514
2118  043a 89            	pushw	x
2119  043b 5f            	clrw	x
2120  043c 89            	pushw	x
2121  043d ae0008        	ldw	x,#L371
2122  0440 cd0000        	call	_assert_failed
2124  0443 5b04          	addw	sp,#4
2125  0445               L472:
2126                     ; 517   UART1->CR4 &= ((uint8_t)~UART1_CR4_ADD);
2128  0445 c65237        	ld	a,21047
2129  0448 a4f0          	and	a,#240
2130  044a c75237        	ld	21047,a
2131                     ; 519   UART1->CR4 |= UART1_Address;
2133  044d c65237        	ld	a,21047
2134  0450 1a01          	or	a,(OFST+1,sp)
2135  0452 c75237        	ld	21047,a
2136                     ; 520 }
2139  0455 84            	pop	a
2140  0456 81            	ret	
2174                     ; 528 void UART1_SetGuardTime(uint8_t UART1_GuardTime)
2174                     ; 529 {
2175                     	switch	.text
2176  0457               _UART1_SetGuardTime:
2180                     ; 531   UART1->GTR = UART1_GuardTime;
2182  0457 c75239        	ld	21049,a
2183                     ; 532 }
2186  045a 81            	ret	
2220                     ; 556 void UART1_SetPrescaler(uint8_t UART1_Prescaler)
2220                     ; 557 {
2221                     	switch	.text
2222  045b               _UART1_SetPrescaler:
2226                     ; 559   UART1->PSCR = UART1_Prescaler;
2228  045b c7523a        	ld	21050,a
2229                     ; 560 }
2232  045e 81            	ret	
2376                     ; 568 FlagStatus UART1_GetFlagStatus(UART1_Flag_TypeDef UART1_FLAG)
2376                     ; 569 {
2377                     	switch	.text
2378  045f               _UART1_GetFlagStatus:
2380  045f 89            	pushw	x
2381  0460 88            	push	a
2382       00000001      OFST:	set	1
2385                     ; 570   FlagStatus status = RESET;
2387                     ; 573   assert_param(IS_UART1_FLAG_OK(UART1_FLAG));
2389  0461 a30080        	cpw	x,#128
2390  0464 273b          	jreq	L213
2391  0466 a30040        	cpw	x,#64
2392  0469 2736          	jreq	L213
2393  046b a30020        	cpw	x,#32
2394  046e 2731          	jreq	L213
2395  0470 a30010        	cpw	x,#16
2396  0473 272c          	jreq	L213
2397  0475 a30008        	cpw	x,#8
2398  0478 2727          	jreq	L213
2399  047a a30004        	cpw	x,#4
2400  047d 2722          	jreq	L213
2401  047f a30002        	cpw	x,#2
2402  0482 271d          	jreq	L213
2403  0484 a30001        	cpw	x,#1
2404  0487 2718          	jreq	L213
2405  0489 a30101        	cpw	x,#257
2406  048c 2713          	jreq	L213
2407  048e a30210        	cpw	x,#528
2408  0491 270e          	jreq	L213
2409  0493 ae023d        	ldw	x,#573
2410  0496 89            	pushw	x
2411  0497 5f            	clrw	x
2412  0498 89            	pushw	x
2413  0499 ae0008        	ldw	x,#L371
2414  049c cd0000        	call	_assert_failed
2416  049f 5b04          	addw	sp,#4
2417  04a1               L213:
2418                     ; 577   if (UART1_FLAG == UART1_FLAG_LBDF)
2420  04a1 1e02          	ldw	x,(OFST+1,sp)
2421  04a3 a30210        	cpw	x,#528
2422  04a6 2605          	jrne	L1601
2423                     ; 579     if ((UART1->CR4 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2425  04a8 c65237        	ld	a,21047
2426                     ; 582       status = SET;
2428  04ab 2008          	jp	LC009
2429                     ; 587       status = RESET;
2430  04ad               L1601:
2431                     ; 590   else if (UART1_FLAG == UART1_FLAG_SBK)
2433  04ad a30101        	cpw	x,#257
2434  04b0 260b          	jrne	L1701
2435                     ; 592     if ((UART1->CR2 & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2437  04b2 c65235        	ld	a,21045
2438  04b5               LC009:
2439  04b5 1503          	bcp	a,(OFST+2,sp)
2440  04b7 270b          	jreq	L1011
2441                     ; 595       status = SET;
2443  04b9               LC008:
2446  04b9 a601          	ld	a,#1
2449  04bb 2008          	jra	L7601
2450                     ; 600       status = RESET;
2451  04bd               L1701:
2452                     ; 605     if ((UART1->SR & (uint8_t)UART1_FLAG) != (uint8_t)0x00)
2454  04bd c65230        	ld	a,21040
2455  04c0 1503          	bcp	a,(OFST+2,sp)
2456                     ; 608       status = SET;
2458  04c2 26f5          	jrne	LC008
2459  04c4               L1011:
2460                     ; 613       status = RESET;
2464  04c4 4f            	clr	a
2466  04c5               L7601:
2467                     ; 617   return status;
2471  04c5 5b03          	addw	sp,#3
2472  04c7 81            	ret	
2508                     ; 646 void UART1_ClearFlag(UART1_Flag_TypeDef UART1_FLAG)
2508                     ; 647 {
2509                     	switch	.text
2510  04c8               _UART1_ClearFlag:
2512  04c8 89            	pushw	x
2513       00000000      OFST:	set	0
2516                     ; 648   assert_param(IS_UART1_CLEAR_FLAG_OK(UART1_FLAG));
2518  04c9 a30020        	cpw	x,#32
2519  04cc 2713          	jreq	L423
2520  04ce a30210        	cpw	x,#528
2521  04d1 270e          	jreq	L423
2522  04d3 ae0288        	ldw	x,#648
2523  04d6 89            	pushw	x
2524  04d7 5f            	clrw	x
2525  04d8 89            	pushw	x
2526  04d9 ae0008        	ldw	x,#L371
2527  04dc cd0000        	call	_assert_failed
2529  04df 5b04          	addw	sp,#4
2530  04e1               L423:
2531                     ; 651   if (UART1_FLAG == UART1_FLAG_RXNE)
2533  04e1 1e01          	ldw	x,(OFST+1,sp)
2534  04e3 a30020        	cpw	x,#32
2535  04e6 2606          	jrne	L3211
2536                     ; 653     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2538  04e8 35df5230      	mov	21040,#223
2540  04ec 2004          	jra	L5211
2541  04ee               L3211:
2542                     ; 658     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2544  04ee 72195237      	bres	21047,#4
2545  04f2               L5211:
2546                     ; 660 }
2549  04f2 85            	popw	x
2550  04f3 81            	ret	
2633                     ; 675 ITStatus UART1_GetITStatus(UART1_IT_TypeDef UART1_IT)
2633                     ; 676 {
2634                     	switch	.text
2635  04f4               _UART1_GetITStatus:
2637  04f4 89            	pushw	x
2638  04f5 89            	pushw	x
2639       00000002      OFST:	set	2
2642                     ; 677   ITStatus pendingbitstatus = RESET;
2644                     ; 678   uint8_t itpos = 0;
2646                     ; 679   uint8_t itmask1 = 0;
2648                     ; 680   uint8_t itmask2 = 0;
2650                     ; 681   uint8_t enablestatus = 0;
2652                     ; 684   assert_param(IS_UART1_GET_IT_OK(UART1_IT));
2654  04f6 a30277        	cpw	x,#631
2655  04f9 272c          	jreq	L633
2656  04fb a30266        	cpw	x,#614
2657  04fe 2727          	jreq	L633
2658  0500 a30255        	cpw	x,#597
2659  0503 2722          	jreq	L633
2660  0505 a30244        	cpw	x,#580
2661  0508 271d          	jreq	L633
2662  050a a30235        	cpw	x,#565
2663  050d 2718          	jreq	L633
2664  050f a30346        	cpw	x,#838
2665  0512 2713          	jreq	L633
2666  0514 a30100        	cpw	x,#256
2667  0517 270e          	jreq	L633
2668  0519 ae02ac        	ldw	x,#684
2669  051c 89            	pushw	x
2670  051d 5f            	clrw	x
2671  051e 89            	pushw	x
2672  051f ae0008        	ldw	x,#L371
2673  0522 cd0000        	call	_assert_failed
2675  0525 5b04          	addw	sp,#4
2676  0527               L633:
2677                     ; 687   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)UART1_IT & (uint8_t)0x0F));
2679  0527 7b04          	ld	a,(OFST+2,sp)
2680  0529 a40f          	and	a,#15
2681  052b 5f            	clrw	x
2682  052c 97            	ld	xl,a
2683  052d a601          	ld	a,#1
2684  052f 5d            	tnzw	x
2685  0530 2704          	jreq	L243
2686  0532               L443:
2687  0532 48            	sll	a
2688  0533 5a            	decw	x
2689  0534 26fc          	jrne	L443
2690  0536               L243:
2691  0536 6b01          	ld	(OFST-1,sp),a
2693                     ; 689   itmask1 = (uint8_t)((uint8_t)UART1_IT >> (uint8_t)4);
2695  0538 7b04          	ld	a,(OFST+2,sp)
2696  053a 4e            	swap	a
2697  053b a40f          	and	a,#15
2698  053d 6b02          	ld	(OFST+0,sp),a
2700                     ; 691   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
2702  053f 5f            	clrw	x
2703  0540 97            	ld	xl,a
2704  0541 a601          	ld	a,#1
2705  0543 5d            	tnzw	x
2706  0544 2704          	jreq	L643
2707  0546               L053:
2708  0546 48            	sll	a
2709  0547 5a            	decw	x
2710  0548 26fc          	jrne	L053
2711  054a               L643:
2712  054a 6b02          	ld	(OFST+0,sp),a
2714                     ; 695   if (UART1_IT == UART1_IT_PE)
2716  054c 1e03          	ldw	x,(OFST+1,sp)
2717  054e a30100        	cpw	x,#256
2718  0551 260c          	jrne	L1711
2719                     ; 698     enablestatus = (uint8_t)((uint8_t)UART1->CR1 & itmask2);
2721  0553 c65234        	ld	a,21044
2722  0556 1402          	and	a,(OFST+0,sp)
2723  0558 6b02          	ld	(OFST+0,sp),a
2725                     ; 701     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2727  055a c65230        	ld	a,21040
2729                     ; 704       pendingbitstatus = SET;
2731  055d 200f          	jp	LC012
2732                     ; 709       pendingbitstatus = RESET;
2733  055f               L1711:
2734                     ; 713   else if (UART1_IT == UART1_IT_LBDF)
2736  055f a30346        	cpw	x,#838
2737  0562 2616          	jrne	L1021
2738                     ; 716     enablestatus = (uint8_t)((uint8_t)UART1->CR4 & itmask2);
2740  0564 c65237        	ld	a,21047
2741  0567 1402          	and	a,(OFST+0,sp)
2742  0569 6b02          	ld	(OFST+0,sp),a
2744                     ; 718     if (((UART1->CR4 & itpos) != (uint8_t)0x00) && enablestatus)
2746  056b c65237        	ld	a,21047
2748  056e               LC012:
2749  056e 1501          	bcp	a,(OFST-1,sp)
2750  0570 271a          	jreq	L1121
2751  0572 7b02          	ld	a,(OFST+0,sp)
2752  0574 2716          	jreq	L1121
2753                     ; 721       pendingbitstatus = SET;
2755  0576               LC011:
2758  0576 a601          	ld	a,#1
2761  0578 2013          	jra	L7711
2762                     ; 726       pendingbitstatus = RESET;
2763  057a               L1021:
2764                     ; 732     enablestatus = (uint8_t)((uint8_t)UART1->CR2 & itmask2);
2766  057a c65235        	ld	a,21045
2767  057d 1402          	and	a,(OFST+0,sp)
2768  057f 6b02          	ld	(OFST+0,sp),a
2770                     ; 734     if (((UART1->SR & itpos) != (uint8_t)0x00) && enablestatus)
2772  0581 c65230        	ld	a,21040
2773  0584 1501          	bcp	a,(OFST-1,sp)
2774  0586 2704          	jreq	L1121
2776  0588 7b02          	ld	a,(OFST+0,sp)
2777                     ; 737       pendingbitstatus = SET;
2779  058a 26ea          	jrne	LC011
2780  058c               L1121:
2781                     ; 742       pendingbitstatus = RESET;
2785  058c 4f            	clr	a
2787  058d               L7711:
2788                     ; 747   return  pendingbitstatus;
2792  058d 5b04          	addw	sp,#4
2793  058f 81            	ret	
2830                     ; 775 void UART1_ClearITPendingBit(UART1_IT_TypeDef UART1_IT)
2830                     ; 776 {
2831                     	switch	.text
2832  0590               _UART1_ClearITPendingBit:
2834  0590 89            	pushw	x
2835       00000000      OFST:	set	0
2838                     ; 777   assert_param(IS_UART1_CLEAR_IT_OK(UART1_IT));
2840  0591 a30255        	cpw	x,#597
2841  0594 2713          	jreq	L063
2842  0596 a30346        	cpw	x,#838
2843  0599 270e          	jreq	L063
2844  059b ae0309        	ldw	x,#777
2845  059e 89            	pushw	x
2846  059f 5f            	clrw	x
2847  05a0 89            	pushw	x
2848  05a1 ae0008        	ldw	x,#L371
2849  05a4 cd0000        	call	_assert_failed
2851  05a7 5b04          	addw	sp,#4
2852  05a9               L063:
2853                     ; 780   if (UART1_IT == UART1_IT_RXNE)
2855  05a9 1e01          	ldw	x,(OFST+1,sp)
2856  05ab a30255        	cpw	x,#597
2857  05ae 2606          	jrne	L3321
2858                     ; 782     UART1->SR = (uint8_t)~(UART1_SR_RXNE);
2860  05b0 35df5230      	mov	21040,#223
2862  05b4 2004          	jra	L5321
2863  05b6               L3321:
2864                     ; 787     UART1->CR4 &= (uint8_t)~(UART1_CR4_LBDF);
2866  05b6 72195237      	bres	21047,#4
2867  05ba               L5321:
2868                     ; 789 }
2871  05ba 85            	popw	x
2872  05bb 81            	ret	
2885                     	xdef	_UART1_ClearITPendingBit
2886                     	xdef	_UART1_GetITStatus
2887                     	xdef	_UART1_ClearFlag
2888                     	xdef	_UART1_GetFlagStatus
2889                     	xdef	_UART1_SetPrescaler
2890                     	xdef	_UART1_SetGuardTime
2891                     	xdef	_UART1_SetAddress
2892                     	xdef	_UART1_SendBreak
2893                     	xdef	_UART1_SendData9
2894                     	xdef	_UART1_SendData8
2895                     	xdef	_UART1_ReceiveData9
2896                     	xdef	_UART1_ReceiveData8
2897                     	xdef	_UART1_ReceiverWakeUpCmd
2898                     	xdef	_UART1_WakeUpConfig
2899                     	xdef	_UART1_SmartCardNACKCmd
2900                     	xdef	_UART1_SmartCardCmd
2901                     	xdef	_UART1_LINCmd
2902                     	xdef	_UART1_LINBreakDetectionConfig
2903                     	xdef	_UART1_IrDACmd
2904                     	xdef	_UART1_IrDAConfig
2905                     	xdef	_UART1_HalfDuplexCmd
2906                     	xdef	_UART1_ITConfig
2907                     	xdef	_UART1_Cmd
2908                     	xdef	_UART1_Init
2909                     	xdef	_UART1_DeInit
2910                     	xref	_assert_failed
2911                     	xref	_CLK_GetClockFreq
2912                     	switch	.const
2913  0008               L371:
2914  0008 2e2e5c2e2e5c  	dc.b	"..\..\stm\librarie"
2915  001a 735c73746d38  	dc.b	"s\stm8s_stdperiph_"
2916  002c 647269766572  	dc.b	"driver\src\stm8s_u"
2917  003e 617274312e63  	dc.b	"art1.c",0
2918                     	xref.b	c_lreg
2919                     	xref.b	c_x
2939                     	xref	c_lursh
2940                     	xref	c_lsub
2941                     	xref	c_smul
2942                     	xref	c_ludv
2943                     	xref	c_rtol
2944                     	xref	c_llsh
2945                     	xref	c_lcmp
2946                     	xref	c_ltor
2947                     	end
