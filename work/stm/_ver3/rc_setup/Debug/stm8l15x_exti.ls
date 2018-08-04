   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  47                     ; 120 void EXTI_DeInit(void)
  47                     ; 121 {
  49                     .text:	section	.text,new
  50  0000               _EXTI_DeInit:
  54                     ; 122   EXTI->CR1 = EXTI_CR1_RESET_VALUE;
  56  0000 725f50a0      	clr	20640
  57                     ; 123   EXTI->CR2 = EXTI_CR2_RESET_VALUE;
  59  0004 725f50a1      	clr	20641
  60                     ; 124   EXTI->CR3 = EXTI_CR3_RESET_VALUE;
  62  0008 725f50a2      	clr	20642
  63                     ; 125   EXTI->CR4 = EXTI_CR4_RESET_VALUE;
  65  000c 725f50aa      	clr	20650
  66                     ; 126   EXTI->SR1 = 0xFF; /* Setting SR1 bits in order to clear flags */
  68  0010 35ff50a3      	mov	20643,#255
  69                     ; 127   EXTI->SR2 = 0xFF; /* Setting SR2 bits in order to clear flags */
  71  0014 35ff50a4      	mov	20644,#255
  72                     ; 128   EXTI->CONF1 = EXTI_CONF1_RESET_VALUE;
  74  0018 725f50a5      	clr	20645
  75                     ; 129   EXTI->CONF2 = EXTI_CONF2_RESET_VALUE;
  77  001c 725f50ab      	clr	20651
  78                     ; 130 }
  81  0020 81            	ret
 227                     ; 157 void EXTI_SetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin, EXTI_Trigger_TypeDef EXTI_Trigger)
 227                     ; 158 {
 228                     .text:	section	.text,new
 229  0000               _EXTI_SetPinSensitivity:
 231  0000 89            	pushw	x
 232       00000000      OFST:	set	0
 235                     ; 161   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
 237                     ; 162   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 239                     ; 165   switch (EXTI_Pin)
 241  0001 9e            	ld	a,xh
 243                     ; 199     default:
 243                     ; 200       break;
 244  0002 4d            	tnz	a
 245  0003 272f          	jreq	L12
 246  0005 a002          	sub	a,#2
 247  0007 274a          	jreq	L32
 248  0009 a002          	sub	a,#2
 249  000b 2765          	jreq	L52
 250  000d a002          	sub	a,#2
 251  000f 2603cc0091    	jreq	L72
 252  0014 a00a          	sub	a,#10
 253  0016 2603          	jrne	L05
 254  0018 cc00ae        	jp	L13
 255  001b               L05:
 256  001b a002          	sub	a,#2
 257  001d 2603          	jrne	L25
 258  001f cc00cd        	jp	L33
 259  0022               L25:
 260  0022 a002          	sub	a,#2
 261  0024 2603          	jrne	L45
 262  0026 cc00ec        	jp	L53
 263  0029               L45:
 264  0029 a002          	sub	a,#2
 265  002b 2603          	jrne	L65
 266  002d cc010b        	jp	L73
 267  0030               L65:
 268  0030 ac280128      	jpf	L721
 269  0034               L12:
 270                     ; 167     case EXTI_Pin_0:
 270                     ; 168       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P0IS);
 272  0034 c650a0        	ld	a,20640
 273  0037 a4fc          	and	a,#252
 274  0039 c750a0        	ld	20640,a
 275                     ; 169       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 277  003c 7b01          	ld	a,(OFST+1,sp)
 278  003e 5f            	clrw	x
 279  003f 97            	ld	xl,a
 280  0040 7b02          	ld	a,(OFST+2,sp)
 281  0042 5d            	tnzw	x
 282  0043 2704          	jreq	L01
 283  0045               L21:
 284  0045 48            	sll	a
 285  0046 5a            	decw	x
 286  0047 26fc          	jrne	L21
 287  0049               L01:
 288  0049 ca50a0        	or	a,20640
 289  004c c750a0        	ld	20640,a
 290                     ; 170       break;
 292  004f ac280128      	jpf	L721
 293  0053               L32:
 294                     ; 171     case EXTI_Pin_1:
 294                     ; 172       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P1IS);
 296  0053 c650a0        	ld	a,20640
 297  0056 a4f3          	and	a,#243
 298  0058 c750a0        	ld	20640,a
 299                     ; 173       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 301  005b 7b01          	ld	a,(OFST+1,sp)
 302  005d 5f            	clrw	x
 303  005e 97            	ld	xl,a
 304  005f 7b02          	ld	a,(OFST+2,sp)
 305  0061 5d            	tnzw	x
 306  0062 2704          	jreq	L41
 307  0064               L61:
 308  0064 48            	sll	a
 309  0065 5a            	decw	x
 310  0066 26fc          	jrne	L61
 311  0068               L41:
 312  0068 ca50a0        	or	a,20640
 313  006b c750a0        	ld	20640,a
 314                     ; 174       break;
 316  006e ac280128      	jpf	L721
 317  0072               L52:
 318                     ; 175     case EXTI_Pin_2:
 318                     ; 176       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P2IS);
 320  0072 c650a0        	ld	a,20640
 321  0075 a4cf          	and	a,#207
 322  0077 c750a0        	ld	20640,a
 323                     ; 177       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 325  007a 7b01          	ld	a,(OFST+1,sp)
 326  007c 5f            	clrw	x
 327  007d 97            	ld	xl,a
 328  007e 7b02          	ld	a,(OFST+2,sp)
 329  0080 5d            	tnzw	x
 330  0081 2704          	jreq	L02
 331  0083               L22:
 332  0083 48            	sll	a
 333  0084 5a            	decw	x
 334  0085 26fc          	jrne	L22
 335  0087               L02:
 336  0087 ca50a0        	or	a,20640
 337  008a c750a0        	ld	20640,a
 338                     ; 178       break;
 340  008d ac280128      	jpf	L721
 341  0091               L72:
 342                     ; 179     case EXTI_Pin_3:
 342                     ; 180       EXTI->CR1 &=  (uint8_t)(~EXTI_CR1_P3IS);
 344  0091 c650a0        	ld	a,20640
 345  0094 a43f          	and	a,#63
 346  0096 c750a0        	ld	20640,a
 347                     ; 181       EXTI->CR1 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Pin);
 349  0099 7b01          	ld	a,(OFST+1,sp)
 350  009b 5f            	clrw	x
 351  009c 97            	ld	xl,a
 352  009d 7b02          	ld	a,(OFST+2,sp)
 353  009f 5d            	tnzw	x
 354  00a0 2704          	jreq	L42
 355  00a2               L62:
 356  00a2 48            	sll	a
 357  00a3 5a            	decw	x
 358  00a4 26fc          	jrne	L62
 359  00a6               L42:
 360  00a6 ca50a0        	or	a,20640
 361  00a9 c750a0        	ld	20640,a
 362                     ; 182       break;
 364  00ac 207a          	jra	L721
 365  00ae               L13:
 366                     ; 183     case EXTI_Pin_4:
 366                     ; 184       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P4IS);
 368  00ae c650a1        	ld	a,20641
 369  00b1 a4fc          	and	a,#252
 370  00b3 c750a1        	ld	20641,a
 371                     ; 185       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 373  00b6 7b01          	ld	a,(OFST+1,sp)
 374  00b8 a4ef          	and	a,#239
 375  00ba 5f            	clrw	x
 376  00bb 97            	ld	xl,a
 377  00bc 7b02          	ld	a,(OFST+2,sp)
 378  00be 5d            	tnzw	x
 379  00bf 2704          	jreq	L03
 380  00c1               L23:
 381  00c1 48            	sll	a
 382  00c2 5a            	decw	x
 383  00c3 26fc          	jrne	L23
 384  00c5               L03:
 385  00c5 ca50a1        	or	a,20641
 386  00c8 c750a1        	ld	20641,a
 387                     ; 186       break;
 389  00cb 205b          	jra	L721
 390  00cd               L33:
 391                     ; 187     case EXTI_Pin_5:
 391                     ; 188       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P5IS);
 393  00cd c650a1        	ld	a,20641
 394  00d0 a4f3          	and	a,#243
 395  00d2 c750a1        	ld	20641,a
 396                     ; 189       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 398  00d5 7b01          	ld	a,(OFST+1,sp)
 399  00d7 a4ef          	and	a,#239
 400  00d9 5f            	clrw	x
 401  00da 97            	ld	xl,a
 402  00db 7b02          	ld	a,(OFST+2,sp)
 403  00dd 5d            	tnzw	x
 404  00de 2704          	jreq	L43
 405  00e0               L63:
 406  00e0 48            	sll	a
 407  00e1 5a            	decw	x
 408  00e2 26fc          	jrne	L63
 409  00e4               L43:
 410  00e4 ca50a1        	or	a,20641
 411  00e7 c750a1        	ld	20641,a
 412                     ; 190       break;
 414  00ea 203c          	jra	L721
 415  00ec               L53:
 416                     ; 191     case EXTI_Pin_6:
 416                     ; 192       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P6IS);
 418  00ec c650a1        	ld	a,20641
 419  00ef a4cf          	and	a,#207
 420  00f1 c750a1        	ld	20641,a
 421                     ; 193       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 423  00f4 7b01          	ld	a,(OFST+1,sp)
 424  00f6 a4ef          	and	a,#239
 425  00f8 5f            	clrw	x
 426  00f9 97            	ld	xl,a
 427  00fa 7b02          	ld	a,(OFST+2,sp)
 428  00fc 5d            	tnzw	x
 429  00fd 2704          	jreq	L04
 430  00ff               L24:
 431  00ff 48            	sll	a
 432  0100 5a            	decw	x
 433  0101 26fc          	jrne	L24
 434  0103               L04:
 435  0103 ca50a1        	or	a,20641
 436  0106 c750a1        	ld	20641,a
 437                     ; 194       break;
 439  0109 201d          	jra	L721
 440  010b               L73:
 441                     ; 195     case EXTI_Pin_7:
 441                     ; 196       EXTI->CR2 &=  (uint8_t)(~EXTI_CR2_P7IS);
 443  010b c650a1        	ld	a,20641
 444  010e a43f          	and	a,#63
 445  0110 c750a1        	ld	20641,a
 446                     ; 197       EXTI->CR2 |= (uint8_t)((uint8_t)(EXTI_Trigger) << ((uint8_t)EXTI_Pin & (uint8_t)0xEF));
 448  0113 7b01          	ld	a,(OFST+1,sp)
 449  0115 a4ef          	and	a,#239
 450  0117 5f            	clrw	x
 451  0118 97            	ld	xl,a
 452  0119 7b02          	ld	a,(OFST+2,sp)
 453  011b 5d            	tnzw	x
 454  011c 2704          	jreq	L44
 455  011e               L64:
 456  011e 48            	sll	a
 457  011f 5a            	decw	x
 458  0120 26fc          	jrne	L64
 459  0122               L44:
 460  0122 ca50a1        	or	a,20641
 461  0125 c750a1        	ld	20641,a
 462                     ; 198       break;
 464  0128               L14:
 465                     ; 199     default:
 465                     ; 200       break;
 467  0128               L721:
 468                     ; 202 }
 471  0128 85            	popw	x
 472  0129 81            	ret
 555                     ; 216 void EXTI_SelectPort(EXTI_Port_TypeDef EXTI_Port)
 555                     ; 217 {
 556                     .text:	section	.text,new
 557  0000               _EXTI_SelectPort:
 559  0000 88            	push	a
 560       00000000      OFST:	set	0
 563                     ; 219   assert_param(IS_EXTI_PORT(EXTI_Port));
 565                     ; 221   if (EXTI_Port == EXTI_Port_B)
 567  0001 4d            	tnz	a
 568  0002 2606          	jrne	L761
 569                     ; 224     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PGBS);
 571  0004 721b50ab      	bres	20651,#5
 573  0008 2034          	jra	L171
 574  000a               L761:
 575                     ; 226   else if (EXTI_Port == EXTI_Port_D)
 577  000a 7b01          	ld	a,(OFST+1,sp)
 578  000c a102          	cp	a,#2
 579  000e 2606          	jrne	L371
 580                     ; 229     EXTI->CONF2 &= (uint8_t) (~EXTI_CONF2_PHDS);
 582  0010 721d50ab      	bres	20651,#6
 584  0014 2028          	jra	L171
 585  0016               L371:
 586                     ; 231   else if (EXTI_Port == EXTI_Port_E)
 588  0016 7b01          	ld	a,(OFST+1,sp)
 589  0018 a104          	cp	a,#4
 590  001a 2606          	jrne	L771
 591                     ; 234     EXTI->CONF1 &= (uint8_t) (~EXTI_CONF1_PFES);
 593  001c 721f50a5      	bres	20645,#7
 595  0020 201c          	jra	L171
 596  0022               L771:
 597                     ; 236   else if (EXTI_Port == EXTI_Port_F)
 599  0022 7b01          	ld	a,(OFST+1,sp)
 600  0024 a106          	cp	a,#6
 601  0026 2606          	jrne	L302
 602                     ; 239     EXTI->CONF1 |= (uint8_t) (EXTI_CONF1_PFES);
 604  0028 721e50a5      	bset	20645,#7
 606  002c 2010          	jra	L171
 607  002e               L302:
 608                     ; 241   else if (EXTI_Port == EXTI_Port_G)
 610  002e 7b01          	ld	a,(OFST+1,sp)
 611  0030 a110          	cp	a,#16
 612  0032 2606          	jrne	L702
 613                     ; 244     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PGBS);
 615  0034 721a50ab      	bset	20651,#5
 617  0038 2004          	jra	L171
 618  003a               L702:
 619                     ; 249     EXTI->CONF2 |= (uint8_t) (EXTI_CONF2_PHDS);
 621  003a 721c50ab      	bset	20651,#6
 622  003e               L171:
 623                     ; 251 }
 626  003e 84            	pop	a
 627  003f 81            	ret
 795                     ; 277 void EXTI_SetHalfPortSelection(EXTI_HalfPort_TypeDef EXTI_HalfPort,
 795                     ; 278                                FunctionalState NewState)
 795                     ; 279 {
 796                     .text:	section	.text,new
 797  0000               _EXTI_SetHalfPortSelection:
 799  0000 89            	pushw	x
 800       00000000      OFST:	set	0
 803                     ; 281   assert_param(IS_EXTI_HALFPORT(EXTI_HalfPort));
 805                     ; 282   assert_param(IS_FUNCTIONAL_STATE(NewState));
 807                     ; 284   if ((EXTI_HalfPort & 0x80) == 0x00)
 809  0001 9e            	ld	a,xh
 810  0002 a580          	bcp	a,#128
 811  0004 2619          	jrne	L103
 812                     ; 286     if (NewState != DISABLE)
 814  0006 0d02          	tnz	(OFST+2,sp)
 815  0008 270a          	jreq	L303
 816                     ; 289       EXTI->CONF1 |= (uint8_t)EXTI_HalfPort;
 818  000a c650a5        	ld	a,20645
 819  000d 1a01          	or	a,(OFST+1,sp)
 820  000f c750a5        	ld	20645,a
 822  0012 2026          	jra	L703
 823  0014               L303:
 824                     ; 294       EXTI->CONF1 &= (uint8_t)(~(uint8_t)EXTI_HalfPort);
 826  0014 7b01          	ld	a,(OFST+1,sp)
 827  0016 43            	cpl	a
 828  0017 c450a5        	and	a,20645
 829  001a c750a5        	ld	20645,a
 830  001d 201b          	jra	L703
 831  001f               L103:
 832                     ; 299     if (NewState != DISABLE)
 834  001f 0d02          	tnz	(OFST+2,sp)
 835  0021 270c          	jreq	L113
 836                     ; 302       EXTI->CONF2 |= (uint8_t)(EXTI_HalfPort & (uint8_t)0x7F);
 838  0023 7b01          	ld	a,(OFST+1,sp)
 839  0025 a47f          	and	a,#127
 840  0027 ca50ab        	or	a,20651
 841  002a c750ab        	ld	20651,a
 843  002d 200b          	jra	L703
 844  002f               L113:
 845                     ; 307       EXTI->CONF2 &= (uint8_t)(~(uint8_t) (EXTI_HalfPort & (uint8_t)0x7F));
 847  002f 7b01          	ld	a,(OFST+1,sp)
 848  0031 a47f          	and	a,#127
 849  0033 43            	cpl	a
 850  0034 c450ab        	and	a,20651
 851  0037 c750ab        	ld	20651,a
 852  003a               L703:
 853                     ; 310 }
 856  003a 85            	popw	x
 857  003b 81            	ret
 903                     ; 335 void EXTI_SetPortSensitivity(EXTI_Port_TypeDef EXTI_Port,
 903                     ; 336                              EXTI_Trigger_TypeDef EXTI_Trigger)
 903                     ; 337 {
 904                     .text:	section	.text,new
 905  0000               _EXTI_SetPortSensitivity:
 907  0000 89            	pushw	x
 908       00000000      OFST:	set	0
 911                     ; 339   assert_param(IS_EXTI_PORT(EXTI_Port));
 913                     ; 340   assert_param(IS_EXTI_TRIGGER(EXTI_Trigger));
 915                     ; 343   if ((EXTI_Port & 0xF0) == 0x00)
 917  0001 9e            	ld	a,xh
 918  0002 a5f0          	bcp	a,#240
 919  0004 2629          	jrne	L733
 920                     ; 346     EXTI->CR3 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << EXTI_Port));
 922  0006 7b01          	ld	a,(OFST+1,sp)
 923  0008 5f            	clrw	x
 924  0009 97            	ld	xl,a
 925  000a a603          	ld	a,#3
 926  000c 5d            	tnzw	x
 927  000d 2704          	jreq	L66
 928  000f               L07:
 929  000f 48            	sll	a
 930  0010 5a            	decw	x
 931  0011 26fc          	jrne	L07
 932  0013               L66:
 933  0013 43            	cpl	a
 934  0014 c450a2        	and	a,20642
 935  0017 c750a2        	ld	20642,a
 936                     ; 348     EXTI->CR3 |= (uint8_t)((uint8_t)(EXTI_Trigger) << EXTI_Port);
 938  001a 7b01          	ld	a,(OFST+1,sp)
 939  001c 5f            	clrw	x
 940  001d 97            	ld	xl,a
 941  001e 7b02          	ld	a,(OFST+2,sp)
 942  0020 5d            	tnzw	x
 943  0021 2704          	jreq	L27
 944  0023               L47:
 945  0023 48            	sll	a
 946  0024 5a            	decw	x
 947  0025 26fc          	jrne	L47
 948  0027               L27:
 949  0027 ca50a2        	or	a,20642
 950  002a c750a2        	ld	20642,a
 952  002d 202b          	jra	L143
 953  002f               L733:
 954                     ; 353     EXTI->CR4 &= (uint8_t) (~(uint8_t)((uint8_t)0x03 << (EXTI_Port & 0x0F)));
 956  002f 7b01          	ld	a,(OFST+1,sp)
 957  0031 a40f          	and	a,#15
 958  0033 5f            	clrw	x
 959  0034 97            	ld	xl,a
 960  0035 a603          	ld	a,#3
 961  0037 5d            	tnzw	x
 962  0038 2704          	jreq	L67
 963  003a               L001:
 964  003a 48            	sll	a
 965  003b 5a            	decw	x
 966  003c 26fc          	jrne	L001
 967  003e               L67:
 968  003e 43            	cpl	a
 969  003f c450aa        	and	a,20650
 970  0042 c750aa        	ld	20650,a
 971                     ; 355     EXTI->CR4 |= (uint8_t)(EXTI_Trigger << (EXTI_Port & 0x0F));
 973  0045 7b01          	ld	a,(OFST+1,sp)
 974  0047 a40f          	and	a,#15
 975  0049 5f            	clrw	x
 976  004a 97            	ld	xl,a
 977  004b 7b02          	ld	a,(OFST+2,sp)
 978  004d 5d            	tnzw	x
 979  004e 2704          	jreq	L201
 980  0050               L401:
 981  0050 48            	sll	a
 982  0051 5a            	decw	x
 983  0052 26fc          	jrne	L401
 984  0054               L201:
 985  0054 ca50aa        	or	a,20650
 986  0057 c750aa        	ld	20650,a
 987  005a               L143:
 988                     ; 357 }
 991  005a 85            	popw	x
 992  005b 81            	ret
1036                     ; 373 EXTI_Trigger_TypeDef EXTI_GetPinSensitivity(EXTI_Pin_TypeDef EXTI_Pin)
1036                     ; 374 {
1037                     .text:	section	.text,new
1038  0000               _EXTI_GetPinSensitivity:
1040  0000 88            	push	a
1041       00000001      OFST:	set	1
1044                     ; 375   uint8_t value = 0;
1046  0001 0f01          	clr	(OFST+0,sp)
1047                     ; 378   assert_param(IS_EXTI_PINNUM(EXTI_Pin));
1049                     ; 380   switch (EXTI_Pin)
1052                     ; 406     default:
1052                     ; 407       break;
1053  0003 4d            	tnz	a
1054  0004 271e          	jreq	L343
1055  0006 a002          	sub	a,#2
1056  0008 2723          	jreq	L543
1057  000a a002          	sub	a,#2
1058  000c 272a          	jreq	L743
1059  000e a002          	sub	a,#2
1060  0010 2732          	jreq	L153
1061  0012 a00a          	sub	a,#10
1062  0014 273c          	jreq	L353
1063  0016 a002          	sub	a,#2
1064  0018 2741          	jreq	L553
1065  001a a002          	sub	a,#2
1066  001c 2748          	jreq	L753
1067  001e a002          	sub	a,#2
1068  0020 2750          	jreq	L163
1069  0022 205a          	jra	L704
1070  0024               L343:
1071                     ; 382     case EXTI_Pin_0:
1071                     ; 383       value = (uint8_t)(EXTI->CR1 & EXTI_CR1_P0IS);
1073  0024 c650a0        	ld	a,20640
1074  0027 a403          	and	a,#3
1075  0029 6b01          	ld	(OFST+0,sp),a
1076                     ; 384       break;
1078  002b 2051          	jra	L704
1079  002d               L543:
1080                     ; 385     case EXTI_Pin_1:
1080                     ; 386       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P1IS) >> EXTI_Pin_1);
1082  002d c650a0        	ld	a,20640
1083  0030 a40c          	and	a,#12
1084  0032 44            	srl	a
1085  0033 44            	srl	a
1086  0034 6b01          	ld	(OFST+0,sp),a
1087                     ; 387       break;
1089  0036 2046          	jra	L704
1090  0038               L743:
1091                     ; 388     case EXTI_Pin_2:
1091                     ; 389       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P2IS) >> EXTI_Pin_2);
1093  0038 c650a0        	ld	a,20640
1094  003b a430          	and	a,#48
1095  003d 4e            	swap	a
1096  003e a40f          	and	a,#15
1097  0040 6b01          	ld	(OFST+0,sp),a
1098                     ; 390       break;
1100  0042 203a          	jra	L704
1101  0044               L153:
1102                     ; 391     case EXTI_Pin_3:
1102                     ; 392       value = (uint8_t)((uint8_t)(EXTI->CR1 & EXTI_CR1_P3IS) >> EXTI_Pin_3);
1104  0044 c650a0        	ld	a,20640
1105  0047 a4c0          	and	a,#192
1106  0049 4e            	swap	a
1107  004a 44            	srl	a
1108  004b 44            	srl	a
1109  004c a403          	and	a,#3
1110  004e 6b01          	ld	(OFST+0,sp),a
1111                     ; 393       break;
1113  0050 202c          	jra	L704
1114  0052               L353:
1115                     ; 394     case EXTI_Pin_4:
1115                     ; 395       value = (uint8_t)(EXTI->CR2 & EXTI_CR2_P4IS);
1117  0052 c650a1        	ld	a,20641
1118  0055 a403          	and	a,#3
1119  0057 6b01          	ld	(OFST+0,sp),a
1120                     ; 396       break;
1122  0059 2023          	jra	L704
1123  005b               L553:
1124                     ; 397     case EXTI_Pin_5:
1124                     ; 398       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P5IS) >> ((uint8_t)EXTI_Pin_5 & (uint8_t)0x0F));
1126  005b c650a1        	ld	a,20641
1127  005e a40c          	and	a,#12
1128  0060 44            	srl	a
1129  0061 44            	srl	a
1130  0062 6b01          	ld	(OFST+0,sp),a
1131                     ; 399       break;
1133  0064 2018          	jra	L704
1134  0066               L753:
1135                     ; 400     case EXTI_Pin_6:
1135                     ; 401       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P6IS) >> ((uint8_t)EXTI_Pin_6 & (uint8_t)0x0F));
1137  0066 c650a1        	ld	a,20641
1138  0069 a430          	and	a,#48
1139  006b 4e            	swap	a
1140  006c a40f          	and	a,#15
1141  006e 6b01          	ld	(OFST+0,sp),a
1142                     ; 402       break;
1144  0070 200c          	jra	L704
1145  0072               L163:
1146                     ; 403     case EXTI_Pin_7:
1146                     ; 404       value = (uint8_t)((uint8_t)(EXTI->CR2 & EXTI_CR2_P7IS) >> ((uint8_t)EXTI_Pin_7 & (uint8_t)0x0F));
1148  0072 c650a1        	ld	a,20641
1149  0075 a4c0          	and	a,#192
1150  0077 4e            	swap	a
1151  0078 44            	srl	a
1152  0079 44            	srl	a
1153  007a a403          	and	a,#3
1154  007c 6b01          	ld	(OFST+0,sp),a
1155                     ; 405       break;
1157  007e               L363:
1158                     ; 406     default:
1158                     ; 407       break;
1160  007e               L704:
1161                     ; 409   return((EXTI_Trigger_TypeDef)value);
1163  007e 7b01          	ld	a,(OFST+0,sp)
1166  0080 5b01          	addw	sp,#1
1167  0082 81            	ret
1211                     ; 424 EXTI_Trigger_TypeDef EXTI_GetPortSensitivity(EXTI_Port_TypeDef EXTI_Port)
1211                     ; 425 {
1212                     .text:	section	.text,new
1213  0000               _EXTI_GetPortSensitivity:
1215  0000 88            	push	a
1216  0001 88            	push	a
1217       00000001      OFST:	set	1
1220                     ; 426   uint8_t portsensitivity = 0;
1222                     ; 429   assert_param(IS_EXTI_PORT(EXTI_Port));
1224                     ; 432   if ((EXTI_Port & 0xF0) == 0x00)
1226  0002 a5f0          	bcp	a,#240
1227  0004 2614          	jrne	L134
1228                     ; 435     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR3 >> EXTI_Port));
1230  0006 7b02          	ld	a,(OFST+1,sp)
1231  0008 5f            	clrw	x
1232  0009 97            	ld	xl,a
1233  000a c650a2        	ld	a,20642
1234  000d 5d            	tnzw	x
1235  000e 2704          	jreq	L211
1236  0010               L411:
1237  0010 44            	srl	a
1238  0011 5a            	decw	x
1239  0012 26fc          	jrne	L411
1240  0014               L211:
1241  0014 a403          	and	a,#3
1242  0016 6b01          	ld	(OFST+0,sp),a
1244  0018 2014          	jra	L334
1245  001a               L134:
1246                     ; 441     portsensitivity = (uint8_t)((uint8_t)0x03 & (uint8_t)(EXTI->CR4 >> (EXTI_Port & 0x0F)));
1248  001a 7b02          	ld	a,(OFST+1,sp)
1249  001c a40f          	and	a,#15
1250  001e 5f            	clrw	x
1251  001f 97            	ld	xl,a
1252  0020 c650aa        	ld	a,20650
1253  0023 5d            	tnzw	x
1254  0024 2704          	jreq	L611
1255  0026               L021:
1256  0026 44            	srl	a
1257  0027 5a            	decw	x
1258  0028 26fc          	jrne	L021
1259  002a               L611:
1260  002a a403          	and	a,#3
1261  002c 6b01          	ld	(OFST+0,sp),a
1262  002e               L334:
1263                     ; 444   return((EXTI_Trigger_TypeDef)portsensitivity);
1265  002e 7b01          	ld	a,(OFST+0,sp)
1268  0030 85            	popw	x
1269  0031 81            	ret
1439                     ; 484 ITStatus EXTI_GetITStatus(EXTI_IT_TypeDef EXTI_IT)
1439                     ; 485 {
1440                     .text:	section	.text,new
1441  0000               _EXTI_GetITStatus:
1443  0000 89            	pushw	x
1444  0001 88            	push	a
1445       00000001      OFST:	set	1
1448                     ; 486   ITStatus status = RESET;
1450                     ; 488   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1452                     ; 490   if (((uint16_t)EXTI_IT & (uint16_t)0xFF00) == 0x0100)
1454  0002 01            	rrwa	x,a
1455  0003 9f            	ld	a,xl
1456  0004 a4ff          	and	a,#255
1457  0006 97            	ld	xl,a
1458  0007 4f            	clr	a
1459  0008 02            	rlwa	x,a
1460  0009 a30100        	cpw	x,#256
1461  000c 260b          	jrne	L725
1462                     ; 492     status = (ITStatus)(EXTI->SR2 & (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF));
1464  000e 7b03          	ld	a,(OFST+2,sp)
1465  0010 a4ff          	and	a,#255
1466  0012 c450a4        	and	a,20644
1467  0015 6b01          	ld	(OFST+0,sp),a
1469  0017 2009          	jra	L135
1470  0019               L725:
1471                     ; 496     status = (ITStatus)(EXTI->SR1 & ((uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF)));
1473  0019 7b03          	ld	a,(OFST+2,sp)
1474  001b a4ff          	and	a,#255
1475  001d c450a3        	and	a,20643
1476  0020 6b01          	ld	(OFST+0,sp),a
1477  0022               L135:
1478                     ; 498   return((ITStatus)status);
1480  0022 7b01          	ld	a,(OFST+0,sp)
1483  0024 5b03          	addw	sp,#3
1484  0026 81            	ret
1527                     ; 521 void EXTI_ClearITPendingBit(EXTI_IT_TypeDef EXTI_IT)
1527                     ; 522 {
1528                     .text:	section	.text,new
1529  0000               _EXTI_ClearITPendingBit:
1531  0000 89            	pushw	x
1532  0001 89            	pushw	x
1533       00000002      OFST:	set	2
1536                     ; 523   uint16_t tempvalue = 0;
1538                     ; 526   assert_param(IS_EXTI_ITPENDINGBIT(EXTI_IT));
1540                     ; 528   tempvalue = ((uint16_t)EXTI_IT & (uint16_t)0xFF00);
1542  0002 01            	rrwa	x,a
1543  0003 9f            	ld	a,xl
1544  0004 a4ff          	and	a,#255
1545  0006 97            	ld	xl,a
1546  0007 4f            	clr	a
1547  0008 02            	rlwa	x,a
1548  0009 1f01          	ldw	(OFST-1,sp),x
1549  000b 01            	rrwa	x,a
1550                     ; 530   if ( tempvalue == 0x0100)
1552  000c 1e01          	ldw	x,(OFST-1,sp)
1553  000e a30100        	cpw	x,#256
1554  0011 2609          	jrne	L355
1555                     ; 532     EXTI->SR2 = (uint8_t)((uint16_t)EXTI_IT & (uint16_t)0x00FF);
1557  0013 7b04          	ld	a,(OFST+2,sp)
1558  0015 a4ff          	and	a,#255
1559  0017 c750a4        	ld	20644,a
1561  001a 2005          	jra	L555
1562  001c               L355:
1563                     ; 536     EXTI->SR1 = (uint8_t) (EXTI_IT);
1565  001c 7b04          	ld	a,(OFST+2,sp)
1566  001e c750a3        	ld	20643,a
1567  0021               L555:
1568                     ; 538 }
1571  0021 5b04          	addw	sp,#4
1572  0023 81            	ret
1585                     	xdef	_EXTI_ClearITPendingBit
1586                     	xdef	_EXTI_GetITStatus
1587                     	xdef	_EXTI_GetPortSensitivity
1588                     	xdef	_EXTI_GetPinSensitivity
1589                     	xdef	_EXTI_SetPortSensitivity
1590                     	xdef	_EXTI_SetHalfPortSelection
1591                     	xdef	_EXTI_SelectPort
1592                     	xdef	_EXTI_SetPinSensitivity
1593                     	xdef	_EXTI_DeInit
1612                     	end
