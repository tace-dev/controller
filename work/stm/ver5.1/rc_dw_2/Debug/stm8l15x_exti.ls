   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 120 void EXTI_DeInit(void)
  50                     ; 121 {
  52                     .text:	section	.text,new
  53  0000               _EXTI_DeInit:
  57                     ; 122   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  59  0000 725f50a0      	clr	20640
  60                     ; 123   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  62  0004 725f50a1      	clr	20641
  63                     ; 124   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  65  0008 725f50a2      	clr	20642
  66                     ; 125   EXTI->CR4 = EXTI_CR4_RESET_VALUE;
  68  000c 725f50aa      	clr	20650
  69                     ; 126   EXTI->SR1 = 0xFF; /* Setting SR1 bits in order to clear flags */
  71  0010 35ff50a3      	mov	20643,#255
  72                     ; 127   EXTI->SR2 = 0xFF; /* Setting SR2 bits in order to clear flags */
  74  0014 35ff50a4      	mov	20644,#255
  75                     ; 128   EXTI->CONF1 = EXTI_CONF1_RESET_VALUE;
  77  0018 725f50a5      	clr	20645
  78                     ; 129   EXTI->CONF2 = EXTI_CONF2_RESET_VALUE;
  80  001c 725f50ab      	clr	20651
  81                     ; 130 }
  84  0020 81            	ret	
 230                     ; 157 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin, EXTI_Trigger_TypeDef EXTI_Trigger)
 230                     ; 158 {
 231                     .text:	section	.text,new
 232  0000               _EXTI_SetPinSensitivity:
 234  0000 89            	pushw	x
 235       00000000      OFST:	set	0
 238                     ; 161   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
 240                     ; 162   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 242                     ; 165   switch (EXTI_Pin)
 244  0001 9e            	ld	a,xh
 246                     ; 199     default:
 246                     ; 200       break;
 247  0002 4d            	tnz	a
 248  0003 2728          	jreq	L12
 249  0005 a002          	sub	a,#2
 250  0007 273b          	jreq	L32
 251  0009 a002          	sub	a,#2
 252  000b 274e          	jreq	L52
 253  000d a002          	sub	a,#2
 254  000f 2761          	jreq	L72
 255  0011 a00a          	sub	a,#10
 256  0013 277a          	jreq	L13
 257  0015 a002          	sub	a,#2
 258  0017 2603cc00a6    	jreq	L33
 259  001c a002          	sub	a,#2
 260  001e 2603cc00bd    	jreq	L53
 261  0023 a002          	sub	a,#2
 262  0025 2603cc00d4    	jreq	L73
 263  002a cc00ef        	jra	L721
 264  002d               L12:
 265                     ; 167     case EXTI_Pin_0:
 265                     ; 168       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P0IS);
 267  002d c650a0        	ld	a,20640
 268  0030 a4fc          	and	a,#252
 269  0032 c750a0        	ld	20640,a
 270                     ; 169       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 272  0035 7b01          	ld	a,(OFST+1,sp)
 273  0037 5f            	clrw	x
 274  0038 97            	ld	xl,a
 275  0039 7b02          	ld	a,(OFST+2,sp)
 276  003b 5d            	tnzw	x
 277  003c 2749          	jreq	L42
 278  003e               L21:
 279  003e 48            	sll	a
 280  003f 5a            	decw	x
 281  0040 26fc          	jrne	L21
 282                     ; 170       break;
 284  0042 2043          	jp	L42
 285  0044               L32:
 286                     ; 171     case EXTI_Pin_1:
 286                     ; 172       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P1IS);
 288  0044 c650a0        	ld	a,20640
 289  0047 a4f3          	and	a,#243
 290  0049 c750a0        	ld	20640,a
 291                     ; 173       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 293  004c 7b01          	ld	a,(OFST+1,sp)
 294  004e 5f            	clrw	x
 295  004f 97            	ld	xl,a
 296  0050 7b02          	ld	a,(OFST+2,sp)
 297  0052 5d            	tnzw	x
 298  0053 2732          	jreq	L42
 299  0055               L61:
 300  0055 48            	sll	a
 301  0056 5a            	decw	x
 302  0057 26fc          	jrne	L61
 303                     ; 174       break;
 305  0059 202c          	jp	L42
 306  005b               L52:
 307                     ; 175     case EXTI_Pin_2:
 307                     ; 176       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P2IS);
 309  005b c650a0        	ld	a,20640
 310  005e a4cf          	and	a,#207
 311  0060 c750a0        	ld	20640,a
 312                     ; 177       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 314  0063 7b01          	ld	a,(OFST+1,sp)
 315  0065 5f            	clrw	x
 316  0066 97            	ld	xl,a
 317  0067 7b02          	ld	a,(OFST+2,sp)
 318  0069 5d            	tnzw	x
 319  006a 271b          	jreq	L42
 320  006c               L22:
 321  006c 48            	sll	a
 322  006d 5a            	decw	x
 323  006e 26fc          	jrne	L22
 324                     ; 178       break;
 326  0070 2015          	jp	L42
 327  0072               L72:
 328                     ; 179     case EXTI_Pin_3:
 328                     ; 180       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P3IS);
 330  0072 c650a0        	ld	a,20640
 331  0075 a43f          	and	a,#63
 332  0077 c750a0        	ld	20640,a
 333                     ; 181       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 335  007a 7b01          	ld	a,(OFST+1,sp)
 336  007c 5f            	clrw	x
 337  007d 97            	ld	xl,a
 338  007e 7b02          	ld	a,(OFST+2,sp)
 339  0080 5d            	tnzw	x
 340  0081 2704          	jreq	L42
 341  0083               L62:
 342  0083 48            	sll	a
 343  0084 5a            	decw	x
 344  0085 26fc          	jrne	L62
 345  0087               L42:
 346  0087 ca50a0        	or	a,20640
 347  008a c750a0        	ld	20640,a
 348                     ; 182       break;
 350  008d 2060          	jra	L721
 351  008f               L13:
 352                     ; 183     case EXTI_Pin_4:
 352                     ; 184       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P4IS);
 354  008f c650a1        	ld	a,20641
 355  0092 a4fc          	and	a,#252
 356  0094 c750a1        	ld	20641,a
 357                     ; 185       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 359  0097 7b01          	ld	a,(OFST+1,sp)
 360  0099 ad56          	call	LC003
 361  009b 7b02          	ld	a,(OFST+2,sp)
 362  009d 5d            	tnzw	x
 363  009e 2749          	jreq	L44
 364  00a0               L23:
 365  00a0 48            	sll	a
 366  00a1 5a            	decw	x
 367  00a2 26fc          	jrne	L23
 368                     ; 186       break;
 370  00a4 2043          	jp	L44
 371  00a6               L33:
 372                     ; 187     case EXTI_Pin_5:
 372                     ; 188       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P5IS);
 374  00a6 c650a1        	ld	a,20641
 375  00a9 a4f3          	and	a,#243
 376  00ab c750a1        	ld	20641,a
 377                     ; 189       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 379  00ae 7b01          	ld	a,(OFST+1,sp)
 380  00b0 ad3f          	call	LC003
 381  00b2 7b02          	ld	a,(OFST+2,sp)
 382  00b4 5d            	tnzw	x
 383  00b5 2732          	jreq	L44
 384  00b7               L63:
 385  00b7 48            	sll	a
 386  00b8 5a            	decw	x
 387  00b9 26fc          	jrne	L63
 388                     ; 190       break;
 390  00bb 202c          	jp	L44
 391  00bd               L53:
 392                     ; 191     case EXTI_Pin_6:
 392                     ; 192       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P6IS);
 394  00bd c650a1        	ld	a,20641
 395  00c0 a4cf          	and	a,#207
 396  00c2 c750a1        	ld	20641,a
 397                     ; 193       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 399  00c5 7b01          	ld	a,(OFST+1,sp)
 400  00c7 ad28          	call	LC003
 401  00c9 7b02          	ld	a,(OFST+2,sp)
 402  00cb 5d            	tnzw	x
 403  00cc 271b          	jreq	L44
 404  00ce               L24:
 405  00ce 48            	sll	a
 406  00cf 5a            	decw	x
 407  00d0 26fc          	jrne	L24
 408                     ; 194       break;
 410  00d2 2015          	jp	L44
 411  00d4               L73:
 412                     ; 195     case EXTI_Pin_7:
 412                     ; 196       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P7IS);
 414  00d4 c650a1        	ld	a,20641
 415  00d7 a43f          	and	a,#63
 416  00d9 c750a1        	ld	20641,a
 417                     ; 197       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 419  00dc 7b01          	ld	a,(OFST+1,sp)
 420  00de ad11          	call	LC003
 421  00e0 7b02          	ld	a,(OFST+2,sp)
 422  00e2 5d            	tnzw	x
 423  00e3 2704          	jreq	L44
 424  00e5               L64:
 425  00e5 48            	sll	a
 426  00e6 5a            	decw	x
 427  00e7 26fc          	jrne	L64
 428  00e9               L44:
 429  00e9 ca50a1        	or	a,20641
 430  00ec c750a1        	ld	20641,a
 431                     ; 198       break;
 433                     ; 199     default:
 433                     ; 200       break;
 435  00ef               L721:
 436                     ; 202 }
 439  00ef 85            	popw	x
 440  00f0 81            	ret	
 441  00f1               LC003:
 442  00f1 a4ef          	and	a,#239
 443  00f3 5f            	clrw	x
 444  00f4 97            	ld	xl,a
 445  00f5 81            	ret	
 528                     ; 216 void EXTI_SelectPort(EXTI_Port_TypeDef EXTI_Port)
 528                     ; 217 {
 529                     .text:	section	.text,new
 530  0000               _EXTI_SelectPort:
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
 597  0039 81            	ret	
 765                     ; 277 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 765                     ; 278                                FunctionalState NewState)
 765                     ; 279 {
 766                     .text:	section	.text,new
 767  0000               _EXTI_SetHalfPortSelection:
 769  0000 89            	pushw	x
 770       00000000      OFST:	set	0
 773                     ; 281   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 775                     ; 282   assert_param(IS_FUNCTIONAL_STATE(NewState));
 777                     ; 284   if ((EXTI_HalfPort & 0x80) == 0x00)
 779  0001 9e            	ld	a,xh
 780  0002 a580          	bcp	a,#128
 781  0004 2616          	jrne	L103
 782                     ; 286     if (NewState != DISABLE)
 784  0006 7b02          	ld	a,(OFST+2,sp)
 785  0008 2707          	jreq	L303
 786                     ; 289       EXTI->CONF1 |= (uint8_t)EXTI_HalfPort;
 788  000a c650a5        	ld	a,20645
 789  000d 1a01          	or	a,(OFST+1,sp)
 791  000f 2006          	jp	LC005
 792  0011               L303:
 793                     ; 294       EXTI->CONF1 &= (uint8_t)(~(uint8_t)EXTI_HalfPort);
 795  0011 7b01          	ld	a,(OFST+1,sp)
 796  0013 43            	cpl	a
 797  0014 c450a5        	and	a,20645
 798  0017               LC005:
 799  0017 c750a5        	ld	20645,a
 800  001a 2018          	jra	L703
 801  001c               L103:
 802                     ; 299     if (NewState != DISABLE)
 804  001c 7b02          	ld	a,(OFST+2,sp)
 805  001e 2709          	jreq	L113
 806                     ; 302       EXTI->CONF2 |= (uint8_t)(EXTI_HalfPort & (uint8_t)0x7F);
 808  0020 7b01          	ld	a,(OFST+1,sp)
 809  0022 a47f          	and	a,#127
 810  0024 ca50ab        	or	a,20651
 812  0027 2008          	jp	LC004
 813  0029               L113:
 814                     ; 307       EXTI->CONF2 &= (uint8_t)(~(uint8_t) (EXTI_HalfPort & (uint8_t)0x7F));
 816  0029 7b01          	ld	a,(OFST+1,sp)
 817  002b a47f          	and	a,#127
 818  002d 43            	cpl	a
 819  002e c450ab        	and	a,20651
 820  0031               LC004:
 821  0031 c750ab        	ld	20651,a
 822  0034               L703:
 823                     ; 310 }
 826  0034 85            	popw	x
 827  0035 81            	ret	
 873                     ; 335 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 873                     ; 336                              EXTI_Trigger_TypeDef EXTI_Trigger)
 873                     ; 337 {
 874                     .text:	section	.text,new
 875  0000               _EXTI_SetPortSensitivity:
 877  0000 89            	pushw	x
 878       00000000      OFST:	set	0
 881                     ; 339   assert_param(IS_EXTI_PORT(EXTI_Port));
 883                     ; 340   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 885                     ; 343   if ((EXTI_Port & 0xF0) == 0x00)
 887  0001 9e            	ld	a,xh
 888  0002 a5f0          	bcp	a,#240
 889  0004 2629          	jrne	L733
 890                     ; 346     EXTI->CR3 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << EXTI_Port));
 892  0006 7b01          	ld	a,(OFST+1,sp)
 893  0008 5f            	clrw	x
 894  0009 97            	ld	xl,a
 895  000a a603          	ld	a,#3
 896  000c 5d            	tnzw	x
 897  000d 2704          	jreq	L65
 898  000f               L06:
 899  000f 48            	sll	a
 900  0010 5a            	decw	x
 901  0011 26fc          	jrne	L06
 902  0013               L65:
 903  0013 43            	cpl	a
 904  0014 c450a2        	and	a,20642
 905  0017 c750a2        	ld	20642,a
 906                     ; 348     EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Port);
 908  001a 7b01          	ld	a,(OFST+1,sp)
 909  001c 5f            	clrw	x
 910  001d 97            	ld	xl,a
 911  001e 7b02          	ld	a,(OFST+2,sp)
 912  0020 5d            	tnzw	x
 913  0021 2704          	jreq	L26
 914  0023               L46:
 915  0023 48            	sll	a
 916  0024 5a            	decw	x
 917  0025 26fc          	jrne	L46
 918  0027               L26:
 919  0027 ca50a2        	or	a,20642
 920  002a c750a2        	ld	20642,a
 922  002d 202b          	jra	L143
 923  002f               L733:
 924                     ; 353     EXTI->CR4 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << (EXTI_Port & 0x0F)));
 926  002f 7b01          	ld	a,(OFST+1,sp)
 927  0031 a40f          	and	a,#15
 928  0033 5f            	clrw	x
 929  0034 97            	ld	xl,a
 930  0035 a603          	ld	a,#3
 931  0037 5d            	tnzw	x
 932  0038 2704          	jreq	L66
 933  003a               L07:
 934  003a 48            	sll	a
 935  003b 5a            	decw	x
 936  003c 26fc          	jrne	L07
 937  003e               L66:
 938  003e 43            	cpl	a
 939  003f c450aa        	and	a,20650
 940  0042 c750aa        	ld	20650,a
 941                     ; 355     EXTI->CR4 |= (uint8_t)(EXTI_Trigger << (EXTI_Port & 0x0F));
 943  0045 7b01          	ld	a,(OFST+1,sp)
 944  0047 a40f          	and	a,#15
 945  0049 5f            	clrw	x
 946  004a 97            	ld	xl,a
 947  004b 7b02          	ld	a,(OFST+2,sp)
 948  004d 5d            	tnzw	x
 949  004e 2704          	jreq	L27
 950  0050               L47:
 951  0050 48            	sll	a
 952  0051 5a            	decw	x
 953  0052 26fc          	jrne	L47
 954  0054               L27:
 955  0054 ca50aa        	or	a,20650
 956  0057 c750aa        	ld	20650,a
 957  005a               L143:
 958                     ; 357 }
 961  005a 85            	popw	x
 962  005b 81            	ret	
1006                     ; 373 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin)
1006                     ; 374 {
1007                     .text:	section	.text,new
1008  0000               _EXTI_GetPinSensitivity:
1010  0000 88            	push	a
1011       00000001      OFST:	set	1
1014                     ; 375   uint8_t value = 0;
1016  0001 0f01          	clr	(OFST+0,sp)
1017                     ; 378   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
1019                     ; 380   switch (EXTI_Pin)
1022                     ; 406     default:
1022                     ; 407       break;
1023  0003 4d            	tnz	a
1024  0004 2720          	jreq	L343
1025  0006 a002          	sub	a,#2
1026  0008 2721          	jreq	L543
1027  000a a002          	sub	a,#2
1028  000c 2722          	jreq	L743
1029  000e a002          	sub	a,#2
1030  0010 2724          	jreq	L153
1031  0012 a00a          	sub	a,#10
1032  0014 2725          	jreq	L353
1033  0016 a002          	sub	a,#2
1034  0018 2726          	jreq	L553
1035  001a a002          	sub	a,#2
1036  001c 272b          	jreq	L753
1037  001e a002          	sub	a,#2
1038  0020 272d          	jreq	L163
1039  0022 7b01          	ld	a,(OFST+0,sp)
1040  0024 2033          	jra	LC006
1041  0026               L343:
1042                     ; 382     case EXTI_Pin_0:
1042                     ; 383       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
1044  0026 c650a0        	ld	a,20640
1045                     ; 384       break;
1047  0029 202c          	jp	LC007
1048  002b               L543:
1049                     ; 385     case EXTI_Pin_1:
1049                     ; 386       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P1IS) >> EXTI_Pin_1);
1051  002b c650a0        	ld	a,20640
1052                     ; 387       break;
1054  002e 2013          	jp	LC009
1055  0030               L743:
1056                     ; 388     case EXTI_Pin_2:
1056                     ; 389       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P2IS) >> EXTI_Pin_2);
1058  0030 c650a0        	ld	a,20640
1059  0033 4e            	swap	a
1060                     ; 390       break;
1062  0034 2021          	jp	LC007
1063  0036               L153:
1064                     ; 391     case EXTI_Pin_3:
1064                     ; 392       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P3IS) >> EXTI_Pin_3);
1066  0036 c650a0        	ld	a,20640
1067                     ; 393       break;
1069  0039 2017          	jp	LC008
1070  003b               L353:
1071                     ; 394     case EXTI_Pin_4:
1071                     ; 395       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
1073  003b c650a1        	ld	a,20641
1074                     ; 396       break;
1076  003e 2017          	jp	LC007
1077  0040               L553:
1078                     ; 397     case EXTI_Pin_5:
1078                     ; 398       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
1080  0040 c650a1        	ld	a,20641
1081  0043               LC009:
1082  0043 a40c          	and	a,#12
1083  0045 44            	srl	a
1084  0046 44            	srl	a
1085                     ; 399       break;
1087  0047 2010          	jp	LC006
1088  0049               L753:
1089                     ; 400     case EXTI_Pin_6:
1089                     ; 401       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
1091  0049 c650a1        	ld	a,20641
1092  004c 4e            	swap	a
1093                     ; 402       break;
1095  004d 2008          	jp	LC007
1096  004f               L163:
1097                     ; 403     case EXTI_Pin_7:
1097                     ; 404       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
1099  004f c650a1        	ld	a,20641
1100  0052               LC008:
1101  0052 4e            	swap	a
1102  0053 a40c          	and	a,#12
1103  0055 44            	srl	a
1104  0056 44            	srl	a
1105  0057               LC007:
1106  0057 a403          	and	a,#3
1107  0059               LC006:
1108                     ; 405       break;
1110                     ; 406     default:
1110                     ; 407       break;
1112                     ; 409   return((EXTI_Trigger_TypeDef)value);
1116  0059 5b01          	addw	sp,#1
1117  005b 81            	ret	
1161                     ; 424 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
1161                     ; 425 {
1162                     .text:	section	.text,new
1163  0000               _EXTI_GetPortSensitivity:
1165  0000 88            	push	a
1166  0001 88            	push	a
1167       00000001      OFST:	set	1
1170                     ; 426   uint8_t portsensitivity = 0;
1172                     ; 429   assert_param(IS_EXTI_PORT(EXTI_Port));
1174                     ; 432   if ((EXTI_Port & 0xF0) == 0x00)
1176  0002 a5f0          	bcp	a,#240
1177  0004 2610          	jrne	L134
1178                     ; 435     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR3 >> EXTI_Port));
1180  0006 7b02          	ld	a,(OFST+1,sp)
1181  0008 5f            	clrw	x
1182  0009 97            	ld	xl,a
1183  000a c650a2        	ld	a,20642
1184  000d 5d            	tnzw	x
1185  000e 2716          	jreq	L601
1186  0010               L401:
1187  0010 44            	srl	a
1188  0011 5a            	decw	x
1189  0012 26fc          	jrne	L401
1191  0014 2010          	jra	L601
1192  0016               L134:
1193                     ; 441     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR4 >> (EXTI_Port & 0x0F)));
1195  0016 7b02          	ld	a,(OFST+1,sp)
1196  0018 a40f          	and	a,#15
1197  001a 5f            	clrw	x
1198  001b 97            	ld	xl,a
1199  001c c650aa        	ld	a,20650
1200  001f 5d            	tnzw	x
1201  0020 2704          	jreq	L601
1202  0022               L011:
1203  0022 44            	srl	a
1204  0023 5a            	decw	x
1205  0024 26fc          	jrne	L011
1206  0026               L601:
1207  0026 a403          	and	a,#3
1208                     ; 444   return((EXTI_Trigger_TypeDef)portsensitivity);
1212  0028 85            	popw	x
1213  0029 81            	ret	
1383                     ; 484 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1383                     ; 485 {
1384                     .text:	section	.text,new
1385  0000               _EXTI_GetITStatus:
1387  0000 89            	pushw	x
1388  0001 88            	push	a
1389       00000001      OFST:	set	1
1392                     ; 486   ITStatus status = RESET;
1394                     ; 488   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1396                     ; 490   if (((uint16_t)EXTI_IT & (uint16_t)0xFF00) == 0x0100)
1398  0002 01            	rrwa	x,a
1399  0003 4f            	clr	a
1400  0004 02            	rlwa	x,a
1401  0005 a30100        	cpw	x,#256
1402  0008 2607          	jrne	L725
1403                     ; 492     status = (ITStatus)(EXTI->SR2 & (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF));
1405  000a 7b03          	ld	a,(OFST+2,sp)
1406  000c c450a4        	and	a,20644
1408  000f 2005          	jra	L135
1409  0011               L725:
1410                     ; 496     status = (ITStatus)(EXTI->SR1 & ((uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF)));
1412  0011 7b03          	ld	a,(OFST+2,sp)
1413  0013 c450a3        	and	a,20643
1414  0016               L135:
1415                     ; 498   return((ITStatus)status);
1419  0016 5b03          	addw	sp,#3
1420  0018 81            	ret	
1463                     ; 521 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1463                     ; 522 {
1464                     .text:	section	.text,new
1465  0000               _EXTI_ClearITPendingBit:
1467  0000 89            	pushw	x
1468  0001 89            	pushw	x
1469       00000002      OFST:	set	2
1472                     ; 523   uint16_t tempvalue = 0;
1474                     ; 526   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1476                     ; 528   tempvalue = ((uint16_t)EXTI_IT & (uint16_t)0xFF00);
1478  0002 01            	rrwa	x,a
1479  0003 4f            	clr	a
1480  0004 02            	rlwa	x,a
1481  0005 1f01          	ldw	(OFST-1,sp),x
1482                     ; 530   if ( tempvalue == 0x0100)
1484  0007 a30100        	cpw	x,#256
1485  000a 2607          	jrne	L355
1486                     ; 532     EXTI->SR2 = (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF);
1488  000c 7b04          	ld	a,(OFST+2,sp)
1489  000e c750a4        	ld	20644,a
1491  0011 2005          	jra	L555
1492  0013               L355:
1493                     ; 536     EXTI->SR1 = (uint8_t) (EXTI_IT);
1495  0013 7b04          	ld	a,(OFST+2,sp)
1496  0015 c750a3        	ld	20643,a
1497  0018               L555:
1498                     ; 538 }
1501  0018 5b04          	addw	sp,#4
1502  001a 81            	ret	
1515                     	xdef	_EXTI_ClearITPendingBit
1516                     	xdef	_EXTI_GetITStatus
1517                     	xdef	_EXTI_GetPortSensitivity
1518                     	xdef	_EXTI_GetPinSensitivity
1519                     	xdef	_EXTI_SetPortSensitivity
1520                     	xdef	_EXTI_SetHalfPortSelection
1521                     	xdef	_EXTI_SelectPort
1522                     	xdef	_EXTI_SetPinSensitivity
1523                     	xdef	_EXTI_DeInit
1542                     	end
