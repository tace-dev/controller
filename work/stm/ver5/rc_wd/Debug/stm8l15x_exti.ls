   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  49                     ; 120 void EXTI_DeInit(void)
  49                     ; 121 {
  51                     	switch	.text
  52  0000               _EXTI_DeInit:
  56                     ; 122   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  58  0000 725f50a0      	clr	20640
  59                     ; 123   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  61  0004 725f50a1      	clr	20641
  62                     ; 124   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  64  0008 725f50a2      	clr	20642
  65                     ; 125   EXTI->CR4 = EXTI_CR4_RESET_VALUE;
  67  000c 725f50aa      	clr	20650
  68                     ; 126   EXTI->SR1 = 0xFF; /* Setting SR1 bits in order to clear flags */
  70  0010 35ff50a3      	mov	20643,#255
  71                     ; 127   EXTI->SR2 = 0xFF; /* Setting SR2 bits in order to clear flags */
  73  0014 35ff50a4      	mov	20644,#255
  74                     ; 128   EXTI->CONF1 = EXTI_CONF1_RESET_VALUE;
  76  0018 725f50a5      	clr	20645
  77                     ; 129   EXTI->CONF2 = EXTI_CONF2_RESET_VALUE;
  79  001c 725f50ab      	clr	20651
  80                     ; 130 }
  83  0020 81            	ret	
 229                     ; 157 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin, EXTI_Trigger_TypeDef EXTI_Trigger)
 229                     ; 158 {
 230                     	switch	.text
 231  0021               _EXTI_SetPinSensitivity:
 233  0021 89            	pushw	x
 234       00000000      OFST:	set	0
 237                     ; 161   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
 239                     ; 162   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 241                     ; 165   switch (EXTI_Pin)
 243  0022 9e            	ld	a,xh
 245                     ; 199     default:
 245                     ; 200       break;
 246  0023 4d            	tnz	a
 247  0024 2728          	jreq	L12
 248  0026 a002          	sub	a,#2
 249  0028 273b          	jreq	L32
 250  002a a002          	sub	a,#2
 251  002c 274e          	jreq	L52
 252  002e a002          	sub	a,#2
 253  0030 2761          	jreq	L72
 254  0032 a00a          	sub	a,#10
 255  0034 277a          	jreq	L13
 256  0036 a002          	sub	a,#2
 257  0038 2603cc00c7    	jreq	L33
 258  003d a002          	sub	a,#2
 259  003f 2603cc00de    	jreq	L53
 260  0044 a002          	sub	a,#2
 261  0046 2603cc00f5    	jreq	L73
 262  004b cc0110        	jra	L721
 263  004e               L12:
 264                     ; 167     case EXTI_Pin_0:
 264                     ; 168       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P0IS);
 266  004e c650a0        	ld	a,20640
 267  0051 a4fc          	and	a,#252
 268  0053 c750a0        	ld	20640,a
 269                     ; 169       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 271  0056 7b01          	ld	a,(OFST+1,sp)
 272  0058 5f            	clrw	x
 273  0059 97            	ld	xl,a
 274  005a 7b02          	ld	a,(OFST+2,sp)
 275  005c 5d            	tnzw	x
 276  005d 2749          	jreq	L42
 277  005f               L21:
 278  005f 48            	sll	a
 279  0060 5a            	decw	x
 280  0061 26fc          	jrne	L21
 281                     ; 170       break;
 283  0063 2043          	jp	L42
 284  0065               L32:
 285                     ; 171     case EXTI_Pin_1:
 285                     ; 172       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P1IS);
 287  0065 c650a0        	ld	a,20640
 288  0068 a4f3          	and	a,#243
 289  006a c750a0        	ld	20640,a
 290                     ; 173       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 292  006d 7b01          	ld	a,(OFST+1,sp)
 293  006f 5f            	clrw	x
 294  0070 97            	ld	xl,a
 295  0071 7b02          	ld	a,(OFST+2,sp)
 296  0073 5d            	tnzw	x
 297  0074 2732          	jreq	L42
 298  0076               L61:
 299  0076 48            	sll	a
 300  0077 5a            	decw	x
 301  0078 26fc          	jrne	L61
 302                     ; 174       break;
 304  007a 202c          	jp	L42
 305  007c               L52:
 306                     ; 175     case EXTI_Pin_2:
 306                     ; 176       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P2IS);
 308  007c c650a0        	ld	a,20640
 309  007f a4cf          	and	a,#207
 310  0081 c750a0        	ld	20640,a
 311                     ; 177       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 313  0084 7b01          	ld	a,(OFST+1,sp)
 314  0086 5f            	clrw	x
 315  0087 97            	ld	xl,a
 316  0088 7b02          	ld	a,(OFST+2,sp)
 317  008a 5d            	tnzw	x
 318  008b 271b          	jreq	L42
 319  008d               L22:
 320  008d 48            	sll	a
 321  008e 5a            	decw	x
 322  008f 26fc          	jrne	L22
 323                     ; 178       break;
 325  0091 2015          	jp	L42
 326  0093               L72:
 327                     ; 179     case EXTI_Pin_3:
 327                     ; 180       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P3IS);
 329  0093 c650a0        	ld	a,20640
 330  0096 a43f          	and	a,#63
 331  0098 c750a0        	ld	20640,a
 332                     ; 181       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 334  009b 7b01          	ld	a,(OFST+1,sp)
 335  009d 5f            	clrw	x
 336  009e 97            	ld	xl,a
 337  009f 7b02          	ld	a,(OFST+2,sp)
 338  00a1 5d            	tnzw	x
 339  00a2 2704          	jreq	L42
 340  00a4               L62:
 341  00a4 48            	sll	a
 342  00a5 5a            	decw	x
 343  00a6 26fc          	jrne	L62
 344  00a8               L42:
 345  00a8 ca50a0        	or	a,20640
 346  00ab c750a0        	ld	20640,a
 347                     ; 182       break;
 349  00ae 2060          	jra	L721
 350  00b0               L13:
 351                     ; 183     case EXTI_Pin_4:
 351                     ; 184       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P4IS);
 353  00b0 c650a1        	ld	a,20641
 354  00b3 a4fc          	and	a,#252
 355  00b5 c750a1        	ld	20641,a
 356                     ; 185       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 358  00b8 7b01          	ld	a,(OFST+1,sp)
 359  00ba ad56          	call	LC003
 360  00bc 7b02          	ld	a,(OFST+2,sp)
 361  00be 5d            	tnzw	x
 362  00bf 2749          	jreq	L44
 363  00c1               L23:
 364  00c1 48            	sll	a
 365  00c2 5a            	decw	x
 366  00c3 26fc          	jrne	L23
 367                     ; 186       break;
 369  00c5 2043          	jp	L44
 370  00c7               L33:
 371                     ; 187     case EXTI_Pin_5:
 371                     ; 188       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P5IS);
 373  00c7 c650a1        	ld	a,20641
 374  00ca a4f3          	and	a,#243
 375  00cc c750a1        	ld	20641,a
 376                     ; 189       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 378  00cf 7b01          	ld	a,(OFST+1,sp)
 379  00d1 ad3f          	call	LC003
 380  00d3 7b02          	ld	a,(OFST+2,sp)
 381  00d5 5d            	tnzw	x
 382  00d6 2732          	jreq	L44
 383  00d8               L63:
 384  00d8 48            	sll	a
 385  00d9 5a            	decw	x
 386  00da 26fc          	jrne	L63
 387                     ; 190       break;
 389  00dc 202c          	jp	L44
 390  00de               L53:
 391                     ; 191     case EXTI_Pin_6:
 391                     ; 192       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P6IS);
 393  00de c650a1        	ld	a,20641
 394  00e1 a4cf          	and	a,#207
 395  00e3 c750a1        	ld	20641,a
 396                     ; 193       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 398  00e6 7b01          	ld	a,(OFST+1,sp)
 399  00e8 ad28          	call	LC003
 400  00ea 7b02          	ld	a,(OFST+2,sp)
 401  00ec 5d            	tnzw	x
 402  00ed 271b          	jreq	L44
 403  00ef               L24:
 404  00ef 48            	sll	a
 405  00f0 5a            	decw	x
 406  00f1 26fc          	jrne	L24
 407                     ; 194       break;
 409  00f3 2015          	jp	L44
 410  00f5               L73:
 411                     ; 195     case EXTI_Pin_7:
 411                     ; 196       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P7IS);
 413  00f5 c650a1        	ld	a,20641
 414  00f8 a43f          	and	a,#63
 415  00fa c750a1        	ld	20641,a
 416                     ; 197       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 418  00fd 7b01          	ld	a,(OFST+1,sp)
 419  00ff ad11          	call	LC003
 420  0101 7b02          	ld	a,(OFST+2,sp)
 421  0103 5d            	tnzw	x
 422  0104 2704          	jreq	L44
 423  0106               L64:
 424  0106 48            	sll	a
 425  0107 5a            	decw	x
 426  0108 26fc          	jrne	L64
 427  010a               L44:
 428  010a ca50a1        	or	a,20641
 429  010d c750a1        	ld	20641,a
 430                     ; 198       break;
 432                     ; 199     default:
 432                     ; 200       break;
 434  0110               L721:
 435                     ; 202 }
 438  0110 85            	popw	x
 439  0111 81            	ret	
 440  0112               LC003:
 441  0112 a4ef          	and	a,#239
 442  0114 5f            	clrw	x
 443  0115 97            	ld	xl,a
 444  0116 81            	ret	
 527                     ; 216 void EXTI_SelectPort(EXTI_Port_TypeDef EXTI_Port)
 527                     ; 217 {
 528                     	switch	.text
 529  0117               _EXTI_SelectPort:
 531  0117 88            	push	a
 532       00000000      OFST:	set	0
 535                     ; 219   assert_param(IS_EXTI_PORT(EXTI_Port));
 537                     ; 221   if (EXTI_Port == EXTI_Port_B)
 539  0118 4d            	tnz	a
 540  0119 2606          	jrne	L761
 541                     ; 224     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PGBS);
 543  011b 721b50ab      	bres	20651,#5
 545  011f 202e          	jra	L171
 546  0121               L761:
 547                     ; 226   else if (EXTI_Port == EXTI_Port_D)
 549  0121 7b01          	ld	a,(OFST+1,sp)
 550  0123 a102          	cp	a,#2
 551  0125 2606          	jrne	L371
 552                     ; 229     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PHDS);
 554  0127 721d50ab      	bres	20651,#6
 556  012b 2022          	jra	L171
 557  012d               L371:
 558                     ; 231   else if (EXTI_Port == EXTI_Port_E)
 560  012d a104          	cp	a,#4
 561  012f 2606          	jrne	L771
 562                     ; 234     EXTI->CONF1 &= (uint8_t) (~EXTI_CONF1_PFES);
 564  0131 721f50a5      	bres	20645,#7
 566  0135 2018          	jra	L171
 567  0137               L771:
 568                     ; 236   else if (EXTI_Port == EXTI_Port_F)
 570  0137 a106          	cp	a,#6
 571  0139 2606          	jrne	L302
 572                     ; 239     EXTI->CONF1 |= (uint8_t) (EXTI_CONF1_PFES);
 574  013b 721e50a5      	bset	20645,#7
 576  013f 200e          	jra	L171
 577  0141               L302:
 578                     ; 241   else if (EXTI_Port == EXTI_Port_G)
 580  0141 a110          	cp	a,#16
 581  0143 2606          	jrne	L702
 582                     ; 244     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PGBS);
 584  0145 721a50ab      	bset	20651,#5
 586  0149 2004          	jra	L171
 587  014b               L702:
 588                     ; 249     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PHDS);
 590  014b 721c50ab      	bset	20651,#6
 591  014f               L171:
 592                     ; 251 }
 595  014f 84            	pop	a
 596  0150 81            	ret	
 764                     ; 277 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 764                     ; 278                                FunctionalState NewState)
 764                     ; 279 {
 765                     	switch	.text
 766  0151               _EXTI_SetHalfPortSelection:
 768  0151 89            	pushw	x
 769       00000000      OFST:	set	0
 772                     ; 281   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 774                     ; 282   assert_param(IS_FUNCTIONAL_STATE(NewState));
 776                     ; 284   if ((EXTI_HalfPort & 0x80) == 0x00)
 778  0152 9e            	ld	a,xh
 779  0153 a580          	bcp	a,#128
 780  0155 2616          	jrne	L103
 781                     ; 286     if (NewState != DISABLE)
 783  0157 7b02          	ld	a,(OFST+2,sp)
 784  0159 2707          	jreq	L303
 785                     ; 289       EXTI->CONF1 |= (uint8_t)EXTI_HalfPort;
 787  015b c650a5        	ld	a,20645
 788  015e 1a01          	or	a,(OFST+1,sp)
 790  0160 2006          	jp	LC005
 791  0162               L303:
 792                     ; 294       EXTI->CONF1 &= (uint8_t)(~(uint8_t)EXTI_HalfPort);
 794  0162 7b01          	ld	a,(OFST+1,sp)
 795  0164 43            	cpl	a
 796  0165 c450a5        	and	a,20645
 797  0168               LC005:
 798  0168 c750a5        	ld	20645,a
 799  016b 2018          	jra	L703
 800  016d               L103:
 801                     ; 299     if (NewState != DISABLE)
 803  016d 7b02          	ld	a,(OFST+2,sp)
 804  016f 2709          	jreq	L113
 805                     ; 302       EXTI->CONF2 |= (uint8_t)(EXTI_HalfPort & (uint8_t)0x7F);
 807  0171 7b01          	ld	a,(OFST+1,sp)
 808  0173 a47f          	and	a,#127
 809  0175 ca50ab        	or	a,20651
 811  0178 2008          	jp	LC004
 812  017a               L113:
 813                     ; 307       EXTI->CONF2 &= (uint8_t)(~(uint8_t) (EXTI_HalfPort & (uint8_t)0x7F));
 815  017a 7b01          	ld	a,(OFST+1,sp)
 816  017c a47f          	and	a,#127
 817  017e 43            	cpl	a
 818  017f c450ab        	and	a,20651
 819  0182               LC004:
 820  0182 c750ab        	ld	20651,a
 821  0185               L703:
 822                     ; 310 }
 825  0185 85            	popw	x
 826  0186 81            	ret	
 872                     ; 335 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 872                     ; 336                              EXTI_Trigger_TypeDef EXTI_Trigger)
 872                     ; 337 {
 873                     	switch	.text
 874  0187               _EXTI_SetPortSensitivity:
 876  0187 89            	pushw	x
 877       00000000      OFST:	set	0
 880                     ; 339   assert_param(IS_EXTI_PORT(EXTI_Port));
 882                     ; 340   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 884                     ; 343   if ((EXTI_Port & 0xF0) == 0x00)
 886  0188 9e            	ld	a,xh
 887  0189 a5f0          	bcp	a,#240
 888  018b 2629          	jrne	L733
 889                     ; 346     EXTI->CR3 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << EXTI_Port));
 891  018d 7b01          	ld	a,(OFST+1,sp)
 892  018f 5f            	clrw	x
 893  0190 97            	ld	xl,a
 894  0191 a603          	ld	a,#3
 895  0193 5d            	tnzw	x
 896  0194 2704          	jreq	L65
 897  0196               L06:
 898  0196 48            	sll	a
 899  0197 5a            	decw	x
 900  0198 26fc          	jrne	L06
 901  019a               L65:
 902  019a 43            	cpl	a
 903  019b c450a2        	and	a,20642
 904  019e c750a2        	ld	20642,a
 905                     ; 348     EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Port);
 907  01a1 7b01          	ld	a,(OFST+1,sp)
 908  01a3 5f            	clrw	x
 909  01a4 97            	ld	xl,a
 910  01a5 7b02          	ld	a,(OFST+2,sp)
 911  01a7 5d            	tnzw	x
 912  01a8 2704          	jreq	L26
 913  01aa               L46:
 914  01aa 48            	sll	a
 915  01ab 5a            	decw	x
 916  01ac 26fc          	jrne	L46
 917  01ae               L26:
 918  01ae ca50a2        	or	a,20642
 919  01b1 c750a2        	ld	20642,a
 921  01b4 202b          	jra	L143
 922  01b6               L733:
 923                     ; 353     EXTI->CR4 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << (EXTI_Port & 0x0F)));
 925  01b6 7b01          	ld	a,(OFST+1,sp)
 926  01b8 a40f          	and	a,#15
 927  01ba 5f            	clrw	x
 928  01bb 97            	ld	xl,a
 929  01bc a603          	ld	a,#3
 930  01be 5d            	tnzw	x
 931  01bf 2704          	jreq	L66
 932  01c1               L07:
 933  01c1 48            	sll	a
 934  01c2 5a            	decw	x
 935  01c3 26fc          	jrne	L07
 936  01c5               L66:
 937  01c5 43            	cpl	a
 938  01c6 c450aa        	and	a,20650
 939  01c9 c750aa        	ld	20650,a
 940                     ; 355     EXTI->CR4 |= (uint8_t)(EXTI_Trigger << (EXTI_Port & 0x0F));
 942  01cc 7b01          	ld	a,(OFST+1,sp)
 943  01ce a40f          	and	a,#15
 944  01d0 5f            	clrw	x
 945  01d1 97            	ld	xl,a
 946  01d2 7b02          	ld	a,(OFST+2,sp)
 947  01d4 5d            	tnzw	x
 948  01d5 2704          	jreq	L27
 949  01d7               L47:
 950  01d7 48            	sll	a
 951  01d8 5a            	decw	x
 952  01d9 26fc          	jrne	L47
 953  01db               L27:
 954  01db ca50aa        	or	a,20650
 955  01de c750aa        	ld	20650,a
 956  01e1               L143:
 957                     ; 357 }
 960  01e1 85            	popw	x
 961  01e2 81            	ret	
1005                     ; 373 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin)
1005                     ; 374 {
1006                     	switch	.text
1007  01e3               _EXTI_GetPinSensitivity:
1009  01e3 88            	push	a
1010       00000001      OFST:	set	1
1013                     ; 375   uint8_t value = 0;
1015  01e4 0f01          	clr	(OFST+0,sp)
1016                     ; 378   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
1018                     ; 380   switch (EXTI_Pin)
1021                     ; 406     default:
1021                     ; 407       break;
1022  01e6 4d            	tnz	a
1023  01e7 2720          	jreq	L343
1024  01e9 a002          	sub	a,#2
1025  01eb 2721          	jreq	L543
1026  01ed a002          	sub	a,#2
1027  01ef 2722          	jreq	L743
1028  01f1 a002          	sub	a,#2
1029  01f3 2724          	jreq	L153
1030  01f5 a00a          	sub	a,#10
1031  01f7 2725          	jreq	L353
1032  01f9 a002          	sub	a,#2
1033  01fb 2726          	jreq	L553
1034  01fd a002          	sub	a,#2
1035  01ff 272b          	jreq	L753
1036  0201 a002          	sub	a,#2
1037  0203 272d          	jreq	L163
1038  0205 7b01          	ld	a,(OFST+0,sp)
1039  0207 2033          	jra	LC006
1040  0209               L343:
1041                     ; 382     case EXTI_Pin_0:
1041                     ; 383       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
1043  0209 c650a0        	ld	a,20640
1044                     ; 384       break;
1046  020c 202c          	jp	LC007
1047  020e               L543:
1048                     ; 385     case EXTI_Pin_1:
1048                     ; 386       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P1IS) >> EXTI_Pin_1);
1050  020e c650a0        	ld	a,20640
1051                     ; 387       break;
1053  0211 2013          	jp	LC009
1054  0213               L743:
1055                     ; 388     case EXTI_Pin_2:
1055                     ; 389       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P2IS) >> EXTI_Pin_2);
1057  0213 c650a0        	ld	a,20640
1058  0216 4e            	swap	a
1059                     ; 390       break;
1061  0217 2021          	jp	LC007
1062  0219               L153:
1063                     ; 391     case EXTI_Pin_3:
1063                     ; 392       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P3IS) >> EXTI_Pin_3);
1065  0219 c650a0        	ld	a,20640
1066                     ; 393       break;
1068  021c 2017          	jp	LC008
1069  021e               L353:
1070                     ; 394     case EXTI_Pin_4:
1070                     ; 395       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
1072  021e c650a1        	ld	a,20641
1073                     ; 396       break;
1075  0221 2017          	jp	LC007
1076  0223               L553:
1077                     ; 397     case EXTI_Pin_5:
1077                     ; 398       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
1079  0223 c650a1        	ld	a,20641
1080  0226               LC009:
1081  0226 a40c          	and	a,#12
1082  0228 44            	srl	a
1083  0229 44            	srl	a
1084                     ; 399       break;
1086  022a 2010          	jp	LC006
1087  022c               L753:
1088                     ; 400     case EXTI_Pin_6:
1088                     ; 401       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
1090  022c c650a1        	ld	a,20641
1091  022f 4e            	swap	a
1092                     ; 402       break;
1094  0230 2008          	jp	LC007
1095  0232               L163:
1096                     ; 403     case EXTI_Pin_7:
1096                     ; 404       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
1098  0232 c650a1        	ld	a,20641
1099  0235               LC008:
1100  0235 4e            	swap	a
1101  0236 a40c          	and	a,#12
1102  0238 44            	srl	a
1103  0239 44            	srl	a
1104  023a               LC007:
1105  023a a403          	and	a,#3
1106  023c               LC006:
1107                     ; 405       break;
1109                     ; 406     default:
1109                     ; 407       break;
1111                     ; 409   return((EXTI_Trigger_TypeDef)value);
1115  023c 5b01          	addw	sp,#1
1116  023e 81            	ret	
1160                     ; 424 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
1160                     ; 425 {
1161                     	switch	.text
1162  023f               _EXTI_GetPortSensitivity:
1164  023f 88            	push	a
1165  0240 88            	push	a
1166       00000001      OFST:	set	1
1169                     ; 426   uint8_t portsensitivity = 0;
1171                     ; 429   assert_param(IS_EXTI_PORT(EXTI_Port));
1173                     ; 432   if ((EXTI_Port & 0xF0) == 0x00)
1175  0241 a5f0          	bcp	a,#240
1176  0243 2610          	jrne	L134
1177                     ; 435     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR3 >> EXTI_Port));
1179  0245 7b02          	ld	a,(OFST+1,sp)
1180  0247 5f            	clrw	x
1181  0248 97            	ld	xl,a
1182  0249 c650a2        	ld	a,20642
1183  024c 5d            	tnzw	x
1184  024d 2716          	jreq	L601
1185  024f               L401:
1186  024f 44            	srl	a
1187  0250 5a            	decw	x
1188  0251 26fc          	jrne	L401
1190  0253 2010          	jra	L601
1191  0255               L134:
1192                     ; 441     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR4 >> (EXTI_Port & 0x0F)));
1194  0255 7b02          	ld	a,(OFST+1,sp)
1195  0257 a40f          	and	a,#15
1196  0259 5f            	clrw	x
1197  025a 97            	ld	xl,a
1198  025b c650aa        	ld	a,20650
1199  025e 5d            	tnzw	x
1200  025f 2704          	jreq	L601
1201  0261               L011:
1202  0261 44            	srl	a
1203  0262 5a            	decw	x
1204  0263 26fc          	jrne	L011
1205  0265               L601:
1206  0265 a403          	and	a,#3
1207                     ; 444   return((EXTI_Trigger_TypeDef)portsensitivity);
1211  0267 85            	popw	x
1212  0268 81            	ret	
1382                     ; 484 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1382                     ; 485 {
1383                     	switch	.text
1384  0269               _EXTI_GetITStatus:
1386  0269 89            	pushw	x
1387  026a 88            	push	a
1388       00000001      OFST:	set	1
1391                     ; 486   ITStatus status = RESET;
1393                     ; 488   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1395                     ; 490   if (((uint16_t)EXTI_IT & (uint16_t)0xFF00) == 0x0100)
1397  026b 01            	rrwa	x,a
1398  026c 4f            	clr	a
1399  026d 02            	rlwa	x,a
1400  026e a30100        	cpw	x,#256
1401  0271 2607          	jrne	L725
1402                     ; 492     status = (ITStatus)(EXTI->SR2 & (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF));
1404  0273 7b03          	ld	a,(OFST+2,sp)
1405  0275 c450a4        	and	a,20644
1407  0278 2005          	jra	L135
1408  027a               L725:
1409                     ; 496     status = (ITStatus)(EXTI->SR1 & ((uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF)));
1411  027a 7b03          	ld	a,(OFST+2,sp)
1412  027c c450a3        	and	a,20643
1413  027f               L135:
1414                     ; 498   return((ITStatus)status);
1418  027f 5b03          	addw	sp,#3
1419  0281 81            	ret	
1462                     ; 521 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1462                     ; 522 {
1463                     	switch	.text
1464  0282               _EXTI_ClearITPendingBit:
1466  0282 89            	pushw	x
1467  0283 89            	pushw	x
1468       00000002      OFST:	set	2
1471                     ; 523   uint16_t tempvalue = 0;
1473                     ; 526   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1475                     ; 528   tempvalue = ((uint16_t)EXTI_IT & (uint16_t)0xFF00);
1477  0284 01            	rrwa	x,a
1478  0285 4f            	clr	a
1479  0286 02            	rlwa	x,a
1480  0287 1f01          	ldw	(OFST-1,sp),x
1481                     ; 530   if ( tempvalue == 0x0100)
1483  0289 a30100        	cpw	x,#256
1484  028c 2607          	jrne	L355
1485                     ; 532     EXTI->SR2 = (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF);
1487  028e 7b04          	ld	a,(OFST+2,sp)
1488  0290 c750a4        	ld	20644,a
1490  0293 2005          	jra	L555
1491  0295               L355:
1492                     ; 536     EXTI->SR1 = (uint8_t) (EXTI_IT);
1494  0295 7b04          	ld	a,(OFST+2,sp)
1495  0297 c750a3        	ld	20643,a
1496  029a               L555:
1497                     ; 538 }
1500  029a 5b04          	addw	sp,#4
1501  029c 81            	ret	
1514                     	xdef	_EXTI_ClearITPendingBit
1515                     	xdef	_EXTI_GetITStatus
1516                     	xdef	_EXTI_GetPortSensitivity
1517                     	xdef	_EXTI_GetPinSensitivity
1518                     	xdef	_EXTI_SetPortSensitivity
1519                     	xdef	_EXTI_SetHalfPortSelection
1520                     	xdef	_EXTI_SelectPort
1521                     	xdef	_EXTI_SetPinSensitivity
1522                     	xdef	_EXTI_DeInit
1541                     	end
