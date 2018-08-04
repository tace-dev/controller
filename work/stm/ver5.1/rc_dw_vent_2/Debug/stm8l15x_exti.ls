   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 120 void EXTI_DeInit(void)
  50                     ; 121 {
  51                     .text:	section	.text,new
  52  0000               f_EXTI_DeInit:
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
  83  0020 87            	retf	
 228                     ; 157 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin, EXTI_Trigger_TypeDef EXTI_Trigger)
 228                     ; 158 {
 229                     .text:	section	.text,new
 230  0000               f_EXTI_SetPinSensitivity:
 232  0000 89            	pushw	x
 233       00000000      OFST:	set	0
 236                     ; 161   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
 238                     ; 162   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 240                     ; 165   switch (EXTI_Pin)
 242  0001 9e            	ld	a,xh
 244                     ; 199     default:
 244                     ; 200       break;
 245  0002 4d            	tnz	a
 246  0003 2730          	jreq	L12
 247  0005 a002          	sub	a,#2
 248  0007 2743          	jreq	L32
 249  0009 a002          	sub	a,#2
 250  000b 2756          	jreq	L52
 251  000d a002          	sub	a,#2
 252  000f 2769          	jreq	L72
 253  0011 a00a          	sub	a,#10
 254  0013 2604ac970097  	jreq	L13
 255  0019 a002          	sub	a,#2
 256  001b 2604acb000b0  	jreq	L33
 257  0021 a002          	sub	a,#2
 258  0023 2604acc900c9  	jreq	L53
 259  0029 a002          	sub	a,#2
 260  002b 2604ace200e2  	jreq	L73
 261  0031 acff00ff      	jra	L721
 262  0035               L12:
 263                     ; 167     case EXTI_Pin_0:
 263                     ; 168       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P0IS);
 265  0035 c650a0        	ld	a,20640
 266  0038 a4fc          	and	a,#252
 267  003a c750a0        	ld	20640,a
 268                     ; 169       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 270  003d 7b01          	ld	a,(OFST+1,sp)
 271  003f 5f            	clrw	x
 272  0040 97            	ld	xl,a
 273  0041 7b02          	ld	a,(OFST+2,sp)
 274  0043 5d            	tnzw	x
 275  0044 2749          	jreq	L42
 276  0046               L21:
 277  0046 48            	sll	a
 278  0047 5a            	decw	x
 279  0048 26fc          	jrne	L21
 280                     ; 170       break;
 282  004a 2043          	jpf	L42
 283  004c               L32:
 284                     ; 171     case EXTI_Pin_1:
 284                     ; 172       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P1IS);
 286  004c c650a0        	ld	a,20640
 287  004f a4f3          	and	a,#243
 288  0051 c750a0        	ld	20640,a
 289                     ; 173       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 291  0054 7b01          	ld	a,(OFST+1,sp)
 292  0056 5f            	clrw	x
 293  0057 97            	ld	xl,a
 294  0058 7b02          	ld	a,(OFST+2,sp)
 295  005a 5d            	tnzw	x
 296  005b 2732          	jreq	L42
 297  005d               L61:
 298  005d 48            	sll	a
 299  005e 5a            	decw	x
 300  005f 26fc          	jrne	L61
 301                     ; 174       break;
 303  0061 202c          	jpf	L42
 304  0063               L52:
 305                     ; 175     case EXTI_Pin_2:
 305                     ; 176       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P2IS);
 307  0063 c650a0        	ld	a,20640
 308  0066 a4cf          	and	a,#207
 309  0068 c750a0        	ld	20640,a
 310                     ; 177       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 312  006b 7b01          	ld	a,(OFST+1,sp)
 313  006d 5f            	clrw	x
 314  006e 97            	ld	xl,a
 315  006f 7b02          	ld	a,(OFST+2,sp)
 316  0071 5d            	tnzw	x
 317  0072 271b          	jreq	L42
 318  0074               L22:
 319  0074 48            	sll	a
 320  0075 5a            	decw	x
 321  0076 26fc          	jrne	L22
 322                     ; 178       break;
 324  0078 2015          	jpf	L42
 325  007a               L72:
 326                     ; 179     case EXTI_Pin_3:
 326                     ; 180       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P3IS);
 328  007a c650a0        	ld	a,20640
 329  007d a43f          	and	a,#63
 330  007f c750a0        	ld	20640,a
 331                     ; 181       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 333  0082 7b01          	ld	a,(OFST+1,sp)
 334  0084 5f            	clrw	x
 335  0085 97            	ld	xl,a
 336  0086 7b02          	ld	a,(OFST+2,sp)
 337  0088 5d            	tnzw	x
 338  0089 2704          	jreq	L42
 339  008b               L62:
 340  008b 48            	sll	a
 341  008c 5a            	decw	x
 342  008d 26fc          	jrne	L62
 343  008f               L42:
 344  008f ca50a0        	or	a,20640
 345  0092 c750a0        	ld	20640,a
 346                     ; 182       break;
 348  0095 2068          	jra	L721
 349  0097               L13:
 350                     ; 183     case EXTI_Pin_4:
 350                     ; 184       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P4IS);
 352  0097 c650a1        	ld	a,20641
 353  009a a4fc          	and	a,#252
 354  009c c750a1        	ld	20641,a
 355                     ; 185       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 357  009f 7b01          	ld	a,(OFST+1,sp)
 358  00a1 a4ef          	and	a,#239
 359  00a3 5f            	clrw	x
 360  00a4 97            	ld	xl,a
 361  00a5 7b02          	ld	a,(OFST+2,sp)
 362  00a7 5d            	tnzw	x
 363  00a8 274f          	jreq	L44
 364  00aa               L23:
 365  00aa 48            	sll	a
 366  00ab 5a            	decw	x
 367  00ac 26fc          	jrne	L23
 368                     ; 186       break;
 370  00ae 2049          	jpf	L44
 371  00b0               L33:
 372                     ; 187     case EXTI_Pin_5:
 372                     ; 188       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P5IS);
 374  00b0 c650a1        	ld	a,20641
 375  00b3 a4f3          	and	a,#243
 376  00b5 c750a1        	ld	20641,a
 377                     ; 189       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 379  00b8 7b01          	ld	a,(OFST+1,sp)
 380  00ba a4ef          	and	a,#239
 381  00bc 5f            	clrw	x
 382  00bd 97            	ld	xl,a
 383  00be 7b02          	ld	a,(OFST+2,sp)
 384  00c0 5d            	tnzw	x
 385  00c1 2736          	jreq	L44
 386  00c3               L63:
 387  00c3 48            	sll	a
 388  00c4 5a            	decw	x
 389  00c5 26fc          	jrne	L63
 390                     ; 190       break;
 392  00c7 2030          	jpf	L44
 393  00c9               L53:
 394                     ; 191     case EXTI_Pin_6:
 394                     ; 192       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P6IS);
 396  00c9 c650a1        	ld	a,20641
 397  00cc a4cf          	and	a,#207
 398  00ce c750a1        	ld	20641,a
 399                     ; 193       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 401  00d1 7b01          	ld	a,(OFST+1,sp)
 402  00d3 a4ef          	and	a,#239
 403  00d5 5f            	clrw	x
 404  00d6 97            	ld	xl,a
 405  00d7 7b02          	ld	a,(OFST+2,sp)
 406  00d9 5d            	tnzw	x
 407  00da 271d          	jreq	L44
 408  00dc               L24:
 409  00dc 48            	sll	a
 410  00dd 5a            	decw	x
 411  00de 26fc          	jrne	L24
 412                     ; 194       break;
 414  00e0 2017          	jpf	L44
 415  00e2               L73:
 416                     ; 195     case EXTI_Pin_7:
 416                     ; 196       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P7IS);
 418  00e2 c650a1        	ld	a,20641
 419  00e5 a43f          	and	a,#63
 420  00e7 c750a1        	ld	20641,a
 421                     ; 197       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 423  00ea 7b01          	ld	a,(OFST+1,sp)
 424  00ec a4ef          	and	a,#239
 425  00ee 5f            	clrw	x
 426  00ef 97            	ld	xl,a
 427  00f0 7b02          	ld	a,(OFST+2,sp)
 428  00f2 5d            	tnzw	x
 429  00f3 2704          	jreq	L44
 430  00f5               L64:
 431  00f5 48            	sll	a
 432  00f6 5a            	decw	x
 433  00f7 26fc          	jrne	L64
 434  00f9               L44:
 435  00f9 ca50a1        	or	a,20641
 436  00fc c750a1        	ld	20641,a
 437                     ; 198       break;
 439                     ; 199     default:
 439                     ; 200       break;
 441  00ff               L721:
 442                     ; 202 }
 445  00ff 85            	popw	x
 446  0100 87            	retf	
 528                     ; 216 void EXTI_SelectPort(EXTI_Port_TypeDef EXTI_Port)
 528                     ; 217 {
 529                     .text:	section	.text,new
 530  0000               f_EXTI_SelectPort:
 532  0000 88            	push	a
 533       00000000      OFST:	set	0
 536                     ; 219   assert_param(IS_EXTI_PORT(EXTI_Port));
 538                     ; 221   if (EXTI_Port == EXTI_Port_B)
 540  0001 4d            	tnz	a
 541  0002 2606          	jrne	L761
 542                     ; 224     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PGBS);
 544  0004 721b50ab      	bres	20651,#5
 546  0008 202e          	jra	L171
 547  000a               L761:
 548                     ; 226   else if (EXTI_Port == EXTI_Port_D)
 550  000a 7b01          	ld	a,(OFST+1,sp)
 551  000c a102          	cp	a,#2
 552  000e 2606          	jrne	L371
 553                     ; 229     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PHDS);
 555  0010 721d50ab      	bres	20651,#6
 557  0014 2022          	jra	L171
 558  0016               L371:
 559                     ; 231   else if (EXTI_Port == EXTI_Port_E)
 561  0016 a104          	cp	a,#4
 562  0018 2606          	jrne	L771
 563                     ; 234     EXTI->CONF1 &= (uint8_t) (~EXTI_CONF1_PFES);
 565  001a 721f50a5      	bres	20645,#7
 567  001e 2018          	jra	L171
 568  0020               L771:
 569                     ; 236   else if (EXTI_Port == EXTI_Port_F)
 571  0020 a106          	cp	a,#6
 572  0022 2606          	jrne	L302
 573                     ; 239     EXTI->CONF1 |= (uint8_t) (EXTI_CONF1_PFES);
 575  0024 721e50a5      	bset	20645,#7
 577  0028 200e          	jra	L171
 578  002a               L302:
 579                     ; 241   else if (EXTI_Port == EXTI_Port_G)
 581  002a a110          	cp	a,#16
 582  002c 2606          	jrne	L702
 583                     ; 244     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PGBS);
 585  002e 721a50ab      	bset	20651,#5
 587  0032 2004          	jra	L171
 588  0034               L702:
 589                     ; 249     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PHDS);
 591  0034 721c50ab      	bset	20651,#6
 592  0038               L171:
 593                     ; 251 }
 596  0038 84            	pop	a
 597  0039 87            	retf	
 764                     ; 277 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 764                     ; 278                                FunctionalState NewState)
 764                     ; 279 {
 765                     .text:	section	.text,new
 766  0000               f_EXTI_SetHalfPortSelection:
 768  0000 89            	pushw	x
 769       00000000      OFST:	set	0
 772                     ; 281   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 774                     ; 282   assert_param(IS_FUNCTIONAL_STATE(NewState));
 776                     ; 284   if ((EXTI_HalfPort & 0x80) == 0x00)
 778  0001 9e            	ld	a,xh
 779  0002 a580          	bcp	a,#128
 780  0004 2616          	jrne	L103
 781                     ; 286     if (NewState != DISABLE)
 783  0006 7b02          	ld	a,(OFST+2,sp)
 784  0008 2707          	jreq	L303
 785                     ; 289       EXTI->CONF1 |= (uint8_t)EXTI_HalfPort;
 787  000a c650a5        	ld	a,20645
 788  000d 1a01          	or	a,(OFST+1,sp)
 790  000f 2006          	jpf	LC004
 791  0011               L303:
 792                     ; 294       EXTI->CONF1 &= (uint8_t)(~(uint8_t)EXTI_HalfPort);
 794  0011 7b01          	ld	a,(OFST+1,sp)
 795  0013 43            	cpl	a
 796  0014 c450a5        	and	a,20645
 797  0017               LC004:
 798  0017 c750a5        	ld	20645,a
 799  001a 2018          	jra	L703
 800  001c               L103:
 801                     ; 299     if (NewState != DISABLE)
 803  001c 7b02          	ld	a,(OFST+2,sp)
 804  001e 2709          	jreq	L113
 805                     ; 302       EXTI->CONF2 |= (uint8_t)(EXTI_HalfPort & (uint8_t)0x7F);
 807  0020 7b01          	ld	a,(OFST+1,sp)
 808  0022 a47f          	and	a,#127
 809  0024 ca50ab        	or	a,20651
 811  0027 2008          	jpf	LC003
 812  0029               L113:
 813                     ; 307       EXTI->CONF2 &= (uint8_t)(~(uint8_t) (EXTI_HalfPort & (uint8_t)0x7F));
 815  0029 7b01          	ld	a,(OFST+1,sp)
 816  002b a47f          	and	a,#127
 817  002d 43            	cpl	a
 818  002e c450ab        	and	a,20651
 819  0031               LC003:
 820  0031 c750ab        	ld	20651,a
 821  0034               L703:
 822                     ; 310 }
 825  0034 85            	popw	x
 826  0035 87            	retf	
 871                     ; 335 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 871                     ; 336                              EXTI_Trigger_TypeDef EXTI_Trigger)
 871                     ; 337 {
 872                     .text:	section	.text,new
 873  0000               f_EXTI_SetPortSensitivity:
 875  0000 89            	pushw	x
 876       00000000      OFST:	set	0
 879                     ; 339   assert_param(IS_EXTI_PORT(EXTI_Port));
 881                     ; 340   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 883                     ; 343   if ((EXTI_Port & 0xF0) == 0x00)
 885  0001 9e            	ld	a,xh
 886  0002 a5f0          	bcp	a,#240
 887  0004 2629          	jrne	L733
 888                     ; 346     EXTI->CR3 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << EXTI_Port));
 890  0006 7b01          	ld	a,(OFST+1,sp)
 891  0008 5f            	clrw	x
 892  0009 97            	ld	xl,a
 893  000a a603          	ld	a,#3
 894  000c 5d            	tnzw	x
 895  000d 2704          	jreq	L65
 896  000f               L06:
 897  000f 48            	sll	a
 898  0010 5a            	decw	x
 899  0011 26fc          	jrne	L06
 900  0013               L65:
 901  0013 43            	cpl	a
 902  0014 c450a2        	and	a,20642
 903  0017 c750a2        	ld	20642,a
 904                     ; 348     EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Port);
 906  001a 7b01          	ld	a,(OFST+1,sp)
 907  001c 5f            	clrw	x
 908  001d 97            	ld	xl,a
 909  001e 7b02          	ld	a,(OFST+2,sp)
 910  0020 5d            	tnzw	x
 911  0021 2704          	jreq	L26
 912  0023               L46:
 913  0023 48            	sll	a
 914  0024 5a            	decw	x
 915  0025 26fc          	jrne	L46
 916  0027               L26:
 917  0027 ca50a2        	or	a,20642
 918  002a c750a2        	ld	20642,a
 920  002d 202b          	jra	L143
 921  002f               L733:
 922                     ; 353     EXTI->CR4 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << (EXTI_Port & 0x0F)));
 924  002f 7b01          	ld	a,(OFST+1,sp)
 925  0031 a40f          	and	a,#15
 926  0033 5f            	clrw	x
 927  0034 97            	ld	xl,a
 928  0035 a603          	ld	a,#3
 929  0037 5d            	tnzw	x
 930  0038 2704          	jreq	L66
 931  003a               L07:
 932  003a 48            	sll	a
 933  003b 5a            	decw	x
 934  003c 26fc          	jrne	L07
 935  003e               L66:
 936  003e 43            	cpl	a
 937  003f c450aa        	and	a,20650
 938  0042 c750aa        	ld	20650,a
 939                     ; 355     EXTI->CR4 |= (uint8_t)(EXTI_Trigger << (EXTI_Port & 0x0F));
 941  0045 7b01          	ld	a,(OFST+1,sp)
 942  0047 a40f          	and	a,#15
 943  0049 5f            	clrw	x
 944  004a 97            	ld	xl,a
 945  004b 7b02          	ld	a,(OFST+2,sp)
 946  004d 5d            	tnzw	x
 947  004e 2704          	jreq	L27
 948  0050               L47:
 949  0050 48            	sll	a
 950  0051 5a            	decw	x
 951  0052 26fc          	jrne	L47
 952  0054               L27:
 953  0054 ca50aa        	or	a,20650
 954  0057 c750aa        	ld	20650,a
 955  005a               L143:
 956                     ; 357 }
 959  005a 85            	popw	x
 960  005b 87            	retf	
1003                     ; 373 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin)
1003                     ; 374 {
1004                     .text:	section	.text,new
1005  0000               f_EXTI_GetPinSensitivity:
1007  0000 88            	push	a
1008       00000001      OFST:	set	1
1011                     ; 375   uint8_t value = 0;
1013  0001 0f01          	clr	(OFST+0,sp)
1014                     ; 378   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
1016                     ; 380   switch (EXTI_Pin)
1019                     ; 406     default:
1019                     ; 407       break;
1020  0003 4d            	tnz	a
1021  0004 2720          	jreq	L343
1022  0006 a002          	sub	a,#2
1023  0008 2721          	jreq	L543
1024  000a a002          	sub	a,#2
1025  000c 2722          	jreq	L743
1026  000e a002          	sub	a,#2
1027  0010 2724          	jreq	L153
1028  0012 a00a          	sub	a,#10
1029  0014 2725          	jreq	L353
1030  0016 a002          	sub	a,#2
1031  0018 2726          	jreq	L553
1032  001a a002          	sub	a,#2
1033  001c 272b          	jreq	L753
1034  001e a002          	sub	a,#2
1035  0020 272d          	jreq	L163
1036  0022 7b01          	ld	a,(OFST+0,sp)
1037  0024 2033          	jra	LC005
1038  0026               L343:
1039                     ; 382     case EXTI_Pin_0:
1039                     ; 383       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
1041  0026 c650a0        	ld	a,20640
1042                     ; 384       break;
1044  0029 202c          	jpf	LC006
1045  002b               L543:
1046                     ; 385     case EXTI_Pin_1:
1046                     ; 386       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P1IS) >> EXTI_Pin_1);
1048  002b c650a0        	ld	a,20640
1049                     ; 387       break;
1051  002e 2013          	jpf	LC008
1052  0030               L743:
1053                     ; 388     case EXTI_Pin_2:
1053                     ; 389       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P2IS) >> EXTI_Pin_2);
1055  0030 c650a0        	ld	a,20640
1056  0033 4e            	swap	a
1057                     ; 390       break;
1059  0034 2021          	jpf	LC006
1060  0036               L153:
1061                     ; 391     case EXTI_Pin_3:
1061                     ; 392       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P3IS) >> EXTI_Pin_3);
1063  0036 c650a0        	ld	a,20640
1064                     ; 393       break;
1066  0039 2017          	jpf	LC007
1067  003b               L353:
1068                     ; 394     case EXTI_Pin_4:
1068                     ; 395       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
1070  003b c650a1        	ld	a,20641
1071                     ; 396       break;
1073  003e 2017          	jpf	LC006
1074  0040               L553:
1075                     ; 397     case EXTI_Pin_5:
1075                     ; 398       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
1077  0040 c650a1        	ld	a,20641
1078  0043               LC008:
1079  0043 a40c          	and	a,#12
1080  0045 44            	srl	a
1081  0046 44            	srl	a
1082                     ; 399       break;
1084  0047 2010          	jpf	LC005
1085  0049               L753:
1086                     ; 400     case EXTI_Pin_6:
1086                     ; 401       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
1088  0049 c650a1        	ld	a,20641
1089  004c 4e            	swap	a
1090                     ; 402       break;
1092  004d 2008          	jpf	LC006
1093  004f               L163:
1094                     ; 403     case EXTI_Pin_7:
1094                     ; 404       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
1096  004f c650a1        	ld	a,20641
1097  0052               LC007:
1098  0052 4e            	swap	a
1099  0053 a40c          	and	a,#12
1100  0055 44            	srl	a
1101  0056 44            	srl	a
1102  0057               LC006:
1103  0057 a403          	and	a,#3
1104  0059               LC005:
1105                     ; 405       break;
1107                     ; 406     default:
1107                     ; 407       break;
1109                     ; 409   return((EXTI_Trigger_TypeDef)value);
1113  0059 5b01          	addw	sp,#1
1114  005b 87            	retf	
1157                     ; 424 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
1157                     ; 425 {
1158                     .text:	section	.text,new
1159  0000               f_EXTI_GetPortSensitivity:
1161  0000 88            	push	a
1162  0001 88            	push	a
1163       00000001      OFST:	set	1
1166                     ; 426   uint8_t portsensitivity = 0;
1168                     ; 429   assert_param(IS_EXTI_PORT(EXTI_Port));
1170                     ; 432   if ((EXTI_Port & 0xF0) == 0x00)
1172  0002 a5f0          	bcp	a,#240
1173  0004 2610          	jrne	L134
1174                     ; 435     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR3 >> EXTI_Port));
1176  0006 7b02          	ld	a,(OFST+1,sp)
1177  0008 5f            	clrw	x
1178  0009 97            	ld	xl,a
1179  000a c650a2        	ld	a,20642
1180  000d 5d            	tnzw	x
1181  000e 2716          	jreq	L601
1182  0010               L401:
1183  0010 44            	srl	a
1184  0011 5a            	decw	x
1185  0012 26fc          	jrne	L401
1187  0014 2010          	jra	L601
1188  0016               L134:
1189                     ; 441     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR4 >> (EXTI_Port & 0x0F)));
1191  0016 7b02          	ld	a,(OFST+1,sp)
1192  0018 a40f          	and	a,#15
1193  001a 5f            	clrw	x
1194  001b 97            	ld	xl,a
1195  001c c650aa        	ld	a,20650
1196  001f 5d            	tnzw	x
1197  0020 2704          	jreq	L601
1198  0022               L011:
1199  0022 44            	srl	a
1200  0023 5a            	decw	x
1201  0024 26fc          	jrne	L011
1202  0026               L601:
1203  0026 a403          	and	a,#3
1204                     ; 444   return((EXTI_Trigger_TypeDef)portsensitivity);
1208  0028 85            	popw	x
1209  0029 87            	retf	
1378                     ; 484 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1378                     ; 485 {
1379                     .text:	section	.text,new
1380  0000               f_EXTI_GetITStatus:
1382  0000 89            	pushw	x
1383  0001 88            	push	a
1384       00000001      OFST:	set	1
1387                     ; 486   ITStatus status = RESET;
1389                     ; 488   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1391                     ; 490   if (((uint16_t)EXTI_IT & (uint16_t)0xFF00) == 0x0100)
1393  0002 01            	rrwa	x,a
1394  0003 4f            	clr	a
1395  0004 02            	rlwa	x,a
1396  0005 a30100        	cpw	x,#256
1397  0008 2607          	jrne	L725
1398                     ; 492     status = (ITStatus)(EXTI->SR2 & (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF));
1400  000a 7b03          	ld	a,(OFST+2,sp)
1401  000c c450a4        	and	a,20644
1403  000f 2005          	jra	L135
1404  0011               L725:
1405                     ; 496     status = (ITStatus)(EXTI->SR1 & ((uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF)));
1407  0011 7b03          	ld	a,(OFST+2,sp)
1408  0013 c450a3        	and	a,20643
1409  0016               L135:
1410                     ; 498   return((ITStatus)status);
1414  0016 5b03          	addw	sp,#3
1415  0018 87            	retf	
1457                     ; 521 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1457                     ; 522 {
1458                     .text:	section	.text,new
1459  0000               f_EXTI_ClearITPendingBit:
1461  0000 89            	pushw	x
1462  0001 89            	pushw	x
1463       00000002      OFST:	set	2
1466                     ; 523   uint16_t tempvalue = 0;
1468                     ; 526   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1470                     ; 528   tempvalue = ((uint16_t)EXTI_IT & (uint16_t)0xFF00);
1472  0002 01            	rrwa	x,a
1473  0003 4f            	clr	a
1474  0004 02            	rlwa	x,a
1475  0005 1f01          	ldw	(OFST-1,sp),x
1476                     ; 530   if ( tempvalue == 0x0100)
1478  0007 a30100        	cpw	x,#256
1479  000a 2607          	jrne	L355
1480                     ; 532     EXTI->SR2 = (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF);
1482  000c 7b04          	ld	a,(OFST+2,sp)
1483  000e c750a4        	ld	20644,a
1485  0011 2005          	jra	L555
1486  0013               L355:
1487                     ; 536     EXTI->SR1 = (uint8_t) (EXTI_IT);
1489  0013 7b04          	ld	a,(OFST+2,sp)
1490  0015 c750a3        	ld	20643,a
1491  0018               L555:
1492                     ; 538 }
1495  0018 5b04          	addw	sp,#4
1496  001a 87            	retf	
1508                     	xdef	f_EXTI_ClearITPendingBit
1509                     	xdef	f_EXTI_GetITStatus
1510                     	xdef	f_EXTI_GetPortSensitivity
1511                     	xdef	f_EXTI_GetPinSensitivity
1512                     	xdef	f_EXTI_SetPortSensitivity
1513                     	xdef	f_EXTI_SetHalfPortSelection
1514                     	xdef	f_EXTI_SelectPort
1515                     	xdef	f_EXTI_SetPinSensitivity
1516                     	xdef	f_EXTI_DeInit
1535                     	end
