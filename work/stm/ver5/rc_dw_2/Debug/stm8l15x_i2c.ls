   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 206                     ; 138 void I2C_DeInit(I2C_TypeDef* I2Cx)
 206                     ; 139 {
 208                     .text:	section	.text,new
 209  0000               _I2C_DeInit:
 213                     ; 140   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
 215  0000 7f            	clr	(x)
 216                     ; 141   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
 218  0001 6f01          	clr	(1,x)
 219                     ; 142   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
 221  0003 6f02          	clr	(2,x)
 222                     ; 143   I2Cx->OARL = I2C_OARL_RESET_VALUE;
 224  0005 6f03          	clr	(3,x)
 225                     ; 144   I2Cx->OARH = I2C_OARH_RESET_VALUE;
 227  0007 6f04          	clr	(4,x)
 228                     ; 145   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
 230  0009 6f05          	clr	(5,x)
 231                     ; 146   I2Cx->ITR = I2C_ITR_RESET_VALUE;
 233  000b 6f0a          	clr	(10,x)
 234                     ; 147   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
 236  000d 6f0b          	clr	(11,x)
 237                     ; 148   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
 239  000f 6f0c          	clr	(12,x)
 240                     ; 149   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
 242  0011 a602          	ld	a,#2
 243  0013 e70d          	ld	(13,x),a
 244                     ; 150 }
 247  0015 81            	ret	
 459                     .const:	section	.text
 460  0000               L21:
 461  0000 000f4240      	dc.l	1000000
 462  0004               L41:
 463  0004 000186a1      	dc.l	100001
 464  0008               L61:
 465  0008 00000004      	dc.l	4
 466                     ; 181 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 466                     ; 182               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 466                     ; 183               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 466                     ; 184 {
 467                     .text:	section	.text,new
 468  0000               _I2C_Init:
 470  0000 89            	pushw	x
 471  0001 520c          	subw	sp,#12
 472       0000000c      OFST:	set	12
 475                     ; 185   uint32_t result = 0x0004;
 477                     ; 186   uint16_t tmpval = 0;
 479                     ; 187   uint8_t tmpccrh = 0;
 481  0003 0f07          	clr	(OFST-5,sp)
 482                     ; 188   uint8_t input_clock = 0;
 484                     ; 191   assert_param(IS_I2C_MODE(I2C_Mode));
 486                     ; 192   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 488                     ; 193   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 490                     ; 194   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 492                     ; 195   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 494                     ; 196   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 496                     ; 200   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 498  0005 cd0000        	call	_CLK_GetClockFreq
 500  0008 ae0000        	ldw	x,#L21
 501  000b cd0000        	call	c_ludv
 503  000e b603          	ld	a,c_lreg+3
 504  0010 6b08          	ld	(OFST-4,sp),a
 505                     ; 204   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 507  0012 1e0d          	ldw	x,(OFST+1,sp)
 508  0014 e602          	ld	a,(2,x)
 509  0016 a4c0          	and	a,#192
 510  0018 e702          	ld	(2,x),a
 511                     ; 206   I2Cx->FREQR |= input_clock;
 513  001a e602          	ld	a,(2,x)
 514  001c 1a08          	or	a,(OFST-4,sp)
 515  001e e702          	ld	(2,x),a
 516                     ; 210   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 518  0020 f6            	ld	a,(x)
 519  0021 a4fe          	and	a,#254
 520  0023 f7            	ld	(x),a
 521                     ; 213   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 523  0024 e60c          	ld	a,(12,x)
 524  0026 a430          	and	a,#48
 525  0028 e70c          	ld	(12,x),a
 526                     ; 214   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 528  002a 6f0b          	clr	(11,x)
 529                     ; 217   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 531  002c 96            	ldw	x,sp
 532  002d 1c0011        	addw	x,#OFST+5
 533  0030 cd0000        	call	c_ltor
 535  0033 ae0004        	ldw	x,#L41
 536  0036 cd0000        	call	c_lcmp
 538  0039 2576          	jrult	L742
 539                     ; 220     tmpccrh = I2C_CCRH_FS;
 541  003b a680          	ld	a,#128
 542  003d 6b07          	ld	(OFST-5,sp),a
 543                     ; 222     if (I2C_DutyCycle == I2C_DutyCycle_2)
 545  003f 96            	ldw	x,sp
 546  0040 0d18          	tnz	(OFST+12,sp)
 547  0042 2623          	jrne	L152
 548                     ; 225       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 550  0044 1c0011        	addw	x,#OFST+5
 551  0047 cd0000        	call	c_ltor
 553  004a a603          	ld	a,#3
 554  004c cd0000        	call	c_smul
 556  004f 96            	ldw	x,sp
 557  0050 5c            	incw	x
 558  0051 cd0000        	call	c_rtol
 560  0054 7b08          	ld	a,(OFST-4,sp)
 561  0056 cd012b        	call	LC001
 563  0059 96            	ldw	x,sp
 564  005a 5c            	incw	x
 565  005b cd0000        	call	c_ludv
 567  005e 96            	ldw	x,sp
 568  005f 1c0009        	addw	x,#OFST-3
 569  0062 cd0000        	call	c_rtol
 572  0065 2027          	jra	L352
 573  0067               L152:
 574                     ; 230       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 576  0067 1c0011        	addw	x,#OFST+5
 577  006a cd0000        	call	c_ltor
 579  006d a619          	ld	a,#25
 580  006f cd0000        	call	c_smul
 582  0072 96            	ldw	x,sp
 583  0073 5c            	incw	x
 584  0074 cd0000        	call	c_rtol
 586  0077 7b08          	ld	a,(OFST-4,sp)
 587  0079 cd012b        	call	LC001
 589  007c 96            	ldw	x,sp
 590  007d 5c            	incw	x
 591  007e cd0000        	call	c_ludv
 593  0081 96            	ldw	x,sp
 594  0082 1c0009        	addw	x,#OFST-3
 595  0085 cd0000        	call	c_rtol
 597                     ; 232       tmpccrh |= I2C_CCRH_DUTY;
 599  0088 7b07          	ld	a,(OFST-5,sp)
 600  008a aa40          	or	a,#64
 601  008c 6b07          	ld	(OFST-5,sp),a
 602  008e               L352:
 603                     ; 236     if (result < (uint16_t)0x01)
 605  008e 96            	ldw	x,sp
 606  008f 1c0009        	addw	x,#OFST-3
 607  0092 cd0000        	call	c_lzmp
 609  0095 2608          	jrne	L552
 610                     ; 239       result = (uint16_t)0x0001;
 612  0097 ae0001        	ldw	x,#1
 613  009a 1f0b          	ldw	(OFST-1,sp),x
 614  009c 5f            	clrw	x
 615  009d 1f09          	ldw	(OFST-3,sp),x
 616  009f               L552:
 617                     ; 245     tmpval = ((input_clock * 3) / 10) + 1;
 619  009f 7b08          	ld	a,(OFST-4,sp)
 620  00a1 97            	ld	xl,a
 621  00a2 a603          	ld	a,#3
 622  00a4 42            	mul	x,a
 623  00a5 a60a          	ld	a,#10
 624  00a7 cd0000        	call	c_sdivx
 626  00aa 5c            	incw	x
 627  00ab 1f05          	ldw	(OFST-7,sp),x
 628                     ; 246     I2Cx->TRISER = (uint8_t)tmpval;
 630  00ad 7b06          	ld	a,(OFST-6,sp)
 632  00af 2046          	jra	L752
 633  00b1               L742:
 634                     ; 253     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 636  00b1 96            	ldw	x,sp
 637  00b2 1c0011        	addw	x,#OFST+5
 638  00b5 cd0000        	call	c_ltor
 640  00b8 3803          	sll	c_lreg+3
 641  00ba 3902          	rlc	c_lreg+2
 642  00bc 3901          	rlc	c_lreg+1
 643  00be 96            	ldw	x,sp
 644  00bf 3900          	rlc	c_lreg
 645  00c1 5c            	incw	x
 646  00c2 cd0000        	call	c_rtol
 648  00c5 7b08          	ld	a,(OFST-4,sp)
 649  00c7 ad62          	call	LC001
 651  00c9 96            	ldw	x,sp
 652  00ca 5c            	incw	x
 653  00cb cd0000        	call	c_ludv
 655  00ce b602          	ld	a,c_lreg+2
 656  00d0 97            	ld	xl,a
 657  00d1 b603          	ld	a,c_lreg+3
 658  00d3 cd0000        	call	c_uitol
 660  00d6 96            	ldw	x,sp
 661  00d7 1c0009        	addw	x,#OFST-3
 662  00da cd0000        	call	c_rtol
 664                     ; 256     if (result < (uint16_t)0x0004)
 666  00dd 96            	ldw	x,sp
 667  00de 1c0009        	addw	x,#OFST-3
 668  00e1 cd0000        	call	c_ltor
 670  00e4 ae0008        	ldw	x,#L61
 671  00e7 cd0000        	call	c_lcmp
 673  00ea 2408          	jruge	L162
 674                     ; 259       result = (uint16_t)0x0004;
 676  00ec ae0004        	ldw	x,#4
 677  00ef 1f0b          	ldw	(OFST-1,sp),x
 678  00f1 5f            	clrw	x
 679  00f2 1f09          	ldw	(OFST-3,sp),x
 680  00f4               L162:
 681                     ; 265     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 683  00f4 7b08          	ld	a,(OFST-4,sp)
 684  00f6 4c            	inc	a
 685  00f7               L752:
 686  00f7 1e0d          	ldw	x,(OFST+1,sp)
 687  00f9 e70d          	ld	(13,x),a
 688                     ; 270   I2Cx->CCRL = (uint8_t)result;
 690  00fb 7b0c          	ld	a,(OFST+0,sp)
 691  00fd e70b          	ld	(11,x),a
 692                     ; 271   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 694  00ff 7b07          	ld	a,(OFST-5,sp)
 695  0101 e70c          	ld	(12,x),a
 696                     ; 274   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 698  0103 7b17          	ld	a,(OFST+11,sp)
 699  0105 aa01          	or	a,#1
 700  0107 fa            	or	a,(x)
 701  0108 f7            	ld	(x),a
 702                     ; 277   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 704  0109 e601          	ld	a,(1,x)
 705  010b 1a19          	or	a,(OFST+13,sp)
 706  010d e701          	ld	(1,x),a
 707                     ; 280   I2Cx->OARL = (uint8_t)(OwnAddress);
 709  010f 7b16          	ld	a,(OFST+10,sp)
 710  0111 e703          	ld	(3,x),a
 711                     ; 281   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 711                     ; 282                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 713  0113 1e15          	ldw	x,(OFST+9,sp)
 714  0115 4f            	clr	a
 715  0116 01            	rrwa	x,a
 716  0117 48            	sll	a
 717  0118 01            	rrwa	x,a
 718  0119 49            	rlc	a
 719  011a a406          	and	a,#6
 720  011c 6b04          	ld	(OFST-8,sp),a
 721  011e 7b1a          	ld	a,(OFST+14,sp)
 722  0120 aa40          	or	a,#64
 723  0122 1a04          	or	a,(OFST-8,sp)
 724  0124 1e0d          	ldw	x,(OFST+1,sp)
 725  0126 e704          	ld	(4,x),a
 726                     ; 283 }
 729  0128 5b0e          	addw	sp,#14
 730  012a 81            	ret	
 731  012b               LC001:
 732  012b b703          	ld	c_lreg+3,a
 733  012d 3f02          	clr	c_lreg+2
 734  012f 3f01          	clr	c_lreg+1
 735  0131 3f00          	clr	c_lreg
 736  0133 ae0000        	ldw	x,#L21
 737  0136 cc0000        	jp	c_lmul
 804                     ; 292 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 804                     ; 293 {
 805                     .text:	section	.text,new
 806  0000               _I2C_Cmd:
 808  0000 89            	pushw	x
 809       00000000      OFST:	set	0
 812                     ; 296   assert_param(IS_FUNCTIONAL_STATE(NewState));
 814                     ; 298   if (NewState != DISABLE)
 816  0001 7b05          	ld	a,(OFST+5,sp)
 817  0003 2705          	jreq	L713
 818                     ; 301     I2Cx->CR1 |= I2C_CR1_PE;
 820  0005 f6            	ld	a,(x)
 821  0006 aa01          	or	a,#1
 823  0008 2005          	jra	L123
 824  000a               L713:
 825                     ; 306     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 827  000a 1e01          	ldw	x,(OFST+1,sp)
 828  000c f6            	ld	a,(x)
 829  000d a4fe          	and	a,#254
 830  000f               L123:
 831  000f f7            	ld	(x),a
 832                     ; 308 }
 835  0010 85            	popw	x
 836  0011 81            	ret	
 883                     ; 317 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 883                     ; 318 {
 884                     .text:	section	.text,new
 885  0000               _I2C_GeneralCallCmd:
 887  0000 89            	pushw	x
 888       00000000      OFST:	set	0
 891                     ; 321   assert_param(IS_FUNCTIONAL_STATE(NewState));
 893                     ; 323   if (NewState != DISABLE)
 895  0001 7b05          	ld	a,(OFST+5,sp)
 896  0003 2705          	jreq	L743
 897                     ; 326     I2Cx->CR1 |= I2C_CR1_ENGC;
 899  0005 f6            	ld	a,(x)
 900  0006 aa40          	or	a,#64
 902  0008 2005          	jra	L153
 903  000a               L743:
 904                     ; 331     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 906  000a 1e01          	ldw	x,(OFST+1,sp)
 907  000c f6            	ld	a,(x)
 908  000d a4bf          	and	a,#191
 909  000f               L153:
 910  000f f7            	ld	(x),a
 911                     ; 333 }
 914  0010 85            	popw	x
 915  0011 81            	ret	
 962                     ; 344 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
 962                     ; 345 {
 963                     .text:	section	.text,new
 964  0000               _I2C_GenerateSTART:
 966  0000 89            	pushw	x
 967       00000000      OFST:	set	0
 970                     ; 348   assert_param(IS_FUNCTIONAL_STATE(NewState));
 972                     ; 350   if (NewState != DISABLE)
 974  0001 7b05          	ld	a,(OFST+5,sp)
 975  0003 2706          	jreq	L773
 976                     ; 353     I2Cx->CR2 |= I2C_CR2_START;
 978  0005 e601          	ld	a,(1,x)
 979  0007 aa01          	or	a,#1
 981  0009 2006          	jra	L104
 982  000b               L773:
 983                     ; 358     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
 985  000b 1e01          	ldw	x,(OFST+1,sp)
 986  000d e601          	ld	a,(1,x)
 987  000f a4fe          	and	a,#254
 988  0011               L104:
 989  0011 e701          	ld	(1,x),a
 990                     ; 360 }
 993  0013 85            	popw	x
 994  0014 81            	ret	
1041                     ; 369 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1041                     ; 370 {
1042                     .text:	section	.text,new
1043  0000               _I2C_GenerateSTOP:
1045  0000 89            	pushw	x
1046       00000000      OFST:	set	0
1049                     ; 373   assert_param(IS_FUNCTIONAL_STATE(NewState));
1051                     ; 375   if (NewState != DISABLE)
1053  0001 7b05          	ld	a,(OFST+5,sp)
1054  0003 2706          	jreq	L724
1055                     ; 378     I2Cx->CR2 |= I2C_CR2_STOP;
1057  0005 e601          	ld	a,(1,x)
1058  0007 aa02          	or	a,#2
1060  0009 2006          	jra	L134
1061  000b               L724:
1062                     ; 383     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1064  000b 1e01          	ldw	x,(OFST+1,sp)
1065  000d e601          	ld	a,(1,x)
1066  000f a4fd          	and	a,#253
1067  0011               L134:
1068  0011 e701          	ld	(1,x),a
1069                     ; 385 }
1072  0013 85            	popw	x
1073  0014 81            	ret	
1121                     ; 394 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1121                     ; 395 {
1122                     .text:	section	.text,new
1123  0000               _I2C_SoftwareResetCmd:
1125  0000 89            	pushw	x
1126       00000000      OFST:	set	0
1129                     ; 397   assert_param(IS_FUNCTIONAL_STATE(NewState));
1131                     ; 399   if (NewState != DISABLE)
1133  0001 7b05          	ld	a,(OFST+5,sp)
1134  0003 2706          	jreq	L754
1135                     ; 402     I2Cx->CR2 |= I2C_CR2_SWRST;
1137  0005 e601          	ld	a,(1,x)
1138  0007 aa80          	or	a,#128
1140  0009 2006          	jra	L164
1141  000b               L754:
1142                     ; 407     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1144  000b 1e01          	ldw	x,(OFST+1,sp)
1145  000d e601          	ld	a,(1,x)
1146  000f a47f          	and	a,#127
1147  0011               L164:
1148  0011 e701          	ld	(1,x),a
1149                     ; 409 }
1152  0013 85            	popw	x
1153  0014 81            	ret	
1201                     ; 418 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1201                     ; 419 {
1202                     .text:	section	.text,new
1203  0000               _I2C_StretchClockCmd:
1205  0000 89            	pushw	x
1206       00000000      OFST:	set	0
1209                     ; 421   assert_param(IS_FUNCTIONAL_STATE(NewState));
1211                     ; 423   if (NewState != DISABLE)
1213  0001 7b05          	ld	a,(OFST+5,sp)
1214  0003 2705          	jreq	L705
1215                     ; 426     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1217  0005 f6            	ld	a,(x)
1218  0006 a47f          	and	a,#127
1220  0008 2005          	jra	L115
1221  000a               L705:
1222                     ; 432     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1224  000a 1e01          	ldw	x,(OFST+1,sp)
1225  000c f6            	ld	a,(x)
1226  000d aa80          	or	a,#128
1227  000f               L115:
1228  000f f7            	ld	(x),a
1229                     ; 434 }
1232  0010 85            	popw	x
1233  0011 81            	ret	
1280                     ; 443 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1280                     ; 444 {
1281                     .text:	section	.text,new
1282  0000               _I2C_ARPCmd:
1284  0000 89            	pushw	x
1285       00000000      OFST:	set	0
1288                     ; 446   assert_param(IS_FUNCTIONAL_STATE(NewState));
1290                     ; 448   if (NewState != DISABLE)
1292  0001 7b05          	ld	a,(OFST+5,sp)
1293  0003 2705          	jreq	L735
1294                     ; 451     I2Cx->CR1 |= I2C_CR1_ARP;
1296  0005 f6            	ld	a,(x)
1297  0006 aa10          	or	a,#16
1299  0008 2005          	jra	L145
1300  000a               L735:
1301                     ; 457     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1303  000a 1e01          	ldw	x,(OFST+1,sp)
1304  000c f6            	ld	a,(x)
1305  000d a4ef          	and	a,#239
1306  000f               L145:
1307  000f f7            	ld	(x),a
1308                     ; 459 }
1311  0010 85            	popw	x
1312  0011 81            	ret	
1360                     ; 468 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1360                     ; 469 {
1361                     .text:	section	.text,new
1362  0000               _I2C_AcknowledgeConfig:
1364  0000 89            	pushw	x
1365       00000000      OFST:	set	0
1368                     ; 471   assert_param(IS_FUNCTIONAL_STATE(NewState));
1370                     ; 473   if (NewState != DISABLE)
1372  0001 7b05          	ld	a,(OFST+5,sp)
1373  0003 2706          	jreq	L765
1374                     ; 476     I2Cx->CR2 |= I2C_CR2_ACK;
1376  0005 e601          	ld	a,(1,x)
1377  0007 aa04          	or	a,#4
1379  0009 2006          	jra	L175
1380  000b               L765:
1381                     ; 481     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1383  000b 1e01          	ldw	x,(OFST+1,sp)
1384  000d e601          	ld	a,(1,x)
1385  000f a4fb          	and	a,#251
1386  0011               L175:
1387  0011 e701          	ld	(1,x),a
1388                     ; 483 }
1391  0013 85            	popw	x
1392  0014 81            	ret	
1444                     ; 491 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1444                     ; 492 {
1445                     .text:	section	.text,new
1446  0000               _I2C_OwnAddress2Config:
1448  0000 89            	pushw	x
1449  0001 88            	push	a
1450       00000001      OFST:	set	1
1453                     ; 493   uint8_t tmpreg = 0;
1455                     ; 496   tmpreg = I2Cx->OAR2;
1457  0002 e605          	ld	a,(5,x)
1458                     ; 499   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1460  0004 a401          	and	a,#1
1461  0006 6b01          	ld	(OFST+0,sp),a
1462                     ; 502   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1464  0008 7b06          	ld	a,(OFST+5,sp)
1465  000a a4fe          	and	a,#254
1466  000c 1a01          	or	a,(OFST+0,sp)
1467  000e 6b01          	ld	(OFST+0,sp),a
1468                     ; 505   I2Cx->OAR2 = tmpreg;
1470  0010 1e02          	ldw	x,(OFST+1,sp)
1471  0012 e705          	ld	(5,x),a
1472                     ; 506 }
1475  0014 5b03          	addw	sp,#3
1476  0016 81            	ret	
1523                     ; 515 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1523                     ; 516 {
1524                     .text:	section	.text,new
1525  0000               _I2C_DualAddressCmd:
1527  0000 89            	pushw	x
1528       00000000      OFST:	set	0
1531                     ; 518   assert_param(IS_FUNCTIONAL_STATE(NewState));
1533                     ; 520   if (NewState != DISABLE)
1535  0001 7b05          	ld	a,(OFST+5,sp)
1536  0003 2706          	jreq	L346
1537                     ; 523     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1539  0005 e605          	ld	a,(5,x)
1540  0007 aa01          	or	a,#1
1542  0009 2006          	jra	L546
1543  000b               L346:
1544                     ; 528     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1546  000b 1e01          	ldw	x,(OFST+1,sp)
1547  000d e605          	ld	a,(5,x)
1548  000f a4fe          	and	a,#254
1549  0011               L546:
1550  0011 e705          	ld	(5,x),a
1551                     ; 530 }
1554  0013 85            	popw	x
1555  0014 81            	ret	
1625                     ; 542 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
1625                     ; 543 {
1626                     .text:	section	.text,new
1627  0000               _I2C_AckPositionConfig:
1629  0000 89            	pushw	x
1630       00000000      OFST:	set	0
1633                     ; 545   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1635                     ; 548   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
1637  0001 e601          	ld	a,(1,x)
1638  0003 a4f7          	and	a,#247
1639  0005 e701          	ld	(1,x),a
1640                     ; 550   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
1642  0007 e601          	ld	a,(1,x)
1643  0009 1a05          	or	a,(OFST+5,sp)
1644  000b e701          	ld	(1,x),a
1645                     ; 551 }
1648  000d 85            	popw	x
1649  000e 81            	ret	
1718                     ; 562 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
1718                     ; 563 {
1719                     .text:	section	.text,new
1720  0000               _I2C_SMBusAlertConfig:
1722  0000 89            	pushw	x
1723       00000000      OFST:	set	0
1726                     ; 566   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
1728                     ; 568   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
1730  0001 7b05          	ld	a,(OFST+5,sp)
1731  0003 2706          	jreq	L737
1732                     ; 571     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
1734  0005 e601          	ld	a,(1,x)
1735  0007 aa20          	or	a,#32
1737  0009 2006          	jra	L147
1738  000b               L737:
1739                     ; 576     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
1741  000b 1e01          	ldw	x,(OFST+1,sp)
1742  000d e601          	ld	a,(1,x)
1743  000f a4df          	and	a,#223
1744  0011               L147:
1745  0011 e701          	ld	(1,x),a
1746                     ; 578 }
1749  0013 85            	popw	x
1750  0014 81            	ret	
1798                     ; 589 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
1798                     ; 590 {
1799                     .text:	section	.text,new
1800  0000               _I2C_FastModeDutyCycleConfig:
1802  0000 89            	pushw	x
1803       00000000      OFST:	set	0
1806                     ; 593   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1808                     ; 595   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1810  0001 7b05          	ld	a,(OFST+5,sp)
1811  0003 a140          	cp	a,#64
1812  0005 2606          	jrne	L767
1813                     ; 598     I2Cx->CCRH |= I2C_CCRH_DUTY;
1815  0007 e60c          	ld	a,(12,x)
1816  0009 aa40          	or	a,#64
1818  000b 2006          	jra	L177
1819  000d               L767:
1820                     ; 603     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1822  000d 1e01          	ldw	x,(OFST+1,sp)
1823  000f e60c          	ld	a,(12,x)
1824  0011 a4bf          	and	a,#191
1825  0013               L177:
1826  0013 e70c          	ld	(12,x),a
1827                     ; 605 }
1830  0015 85            	popw	x
1831  0016 81            	ret	
1908                     ; 618 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1908                     ; 619 {
1909                     .text:	section	.text,new
1910  0000               _I2C_Send7bitAddress:
1912  0000 89            	pushw	x
1913       00000000      OFST:	set	0
1916                     ; 621   assert_param(IS_I2C_ADDRESS(Address));
1918                     ; 622   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1920                     ; 625   if (I2C_Direction != I2C_Direction_Transmitter)
1922  0001 7b06          	ld	a,(OFST+6,sp)
1923  0003 2706          	jreq	L1301
1924                     ; 628     Address |= OAR1_ADD0_Set;
1926  0005 7b05          	ld	a,(OFST+5,sp)
1927  0007 aa01          	or	a,#1
1929  0009 2004          	jra	L3301
1930  000b               L1301:
1931                     ; 633     Address &= OAR1_ADD0_Reset;
1933  000b 7b05          	ld	a,(OFST+5,sp)
1934  000d a4fe          	and	a,#254
1935  000f               L3301:
1936  000f 6b05          	ld	(OFST+5,sp),a
1937                     ; 636   I2Cx->DR = Address;
1939  0011 1e01          	ldw	x,(OFST+1,sp)
1940  0013 e706          	ld	(6,x),a
1941                     ; 637 }
1944  0015 85            	popw	x
1945  0016 81            	ret	
1989                     ; 661 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
1989                     ; 662 {
1990                     .text:	section	.text,new
1991  0000               _I2C_SendData:
1993  0000 89            	pushw	x
1994       00000000      OFST:	set	0
1997                     ; 664   I2Cx->DR = Data;
1999  0001 7b05          	ld	a,(OFST+5,sp)
2000  0003 1e01          	ldw	x,(OFST+1,sp)
2001  0005 e706          	ld	(6,x),a
2002                     ; 665 }
2005  0007 85            	popw	x
2006  0008 81            	ret	
2043                     ; 673 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2043                     ; 674 {
2044                     .text:	section	.text,new
2045  0000               _I2C_ReceiveData:
2049                     ; 676   return ((uint8_t)I2Cx->DR);
2051  0000 e606          	ld	a,(6,x)
2054  0002 81            	ret	
2101                     ; 702 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2101                     ; 703 {
2102                     .text:	section	.text,new
2103  0000               _I2C_TransmitPEC:
2105  0000 89            	pushw	x
2106       00000000      OFST:	set	0
2109                     ; 705   assert_param(IS_FUNCTIONAL_STATE(NewState));
2111                     ; 707   if (NewState != DISABLE)
2113  0001 7b05          	ld	a,(OFST+5,sp)
2114  0003 2706          	jreq	L3211
2115                     ; 710     I2Cx->CR2 |= I2C_CR2_PEC;
2117  0005 e601          	ld	a,(1,x)
2118  0007 aa10          	or	a,#16
2120  0009 2006          	jra	L5211
2121  000b               L3211:
2122                     ; 715     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2124  000b 1e01          	ldw	x,(OFST+1,sp)
2125  000d e601          	ld	a,(1,x)
2126  000f a4ef          	and	a,#239
2127  0011               L5211:
2128  0011 e701          	ld	(1,x),a
2129                     ; 717 }
2132  0013 85            	popw	x
2133  0014 81            	ret	
2180                     ; 726 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2180                     ; 727 {
2181                     .text:	section	.text,new
2182  0000               _I2C_CalculatePEC:
2184  0000 89            	pushw	x
2185       00000000      OFST:	set	0
2188                     ; 729   assert_param(IS_FUNCTIONAL_STATE(NewState));
2190                     ; 731   if (NewState != DISABLE)
2192  0001 7b05          	ld	a,(OFST+5,sp)
2193  0003 2705          	jreq	L3511
2194                     ; 734     I2Cx->CR1 |= I2C_CR1_ENPEC;
2196  0005 f6            	ld	a,(x)
2197  0006 aa20          	or	a,#32
2199  0008 2005          	jra	L5511
2200  000a               L3511:
2201                     ; 739     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2203  000a 1e01          	ldw	x,(OFST+1,sp)
2204  000c f6            	ld	a,(x)
2205  000d a4df          	and	a,#223
2206  000f               L5511:
2207  000f f7            	ld	(x),a
2208                     ; 741 }
2211  0010 85            	popw	x
2212  0011 81            	ret	
2282                     ; 752 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2282                     ; 753 {
2283                     .text:	section	.text,new
2284  0000               _I2C_PECPositionConfig:
2286  0000 89            	pushw	x
2287       00000000      OFST:	set	0
2290                     ; 755   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2292                     ; 758   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2294  0001 e601          	ld	a,(1,x)
2295  0003 a4f7          	and	a,#247
2296  0005 e701          	ld	(1,x),a
2297                     ; 760   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2299  0007 e601          	ld	a,(1,x)
2300  0009 1a05          	or	a,(OFST+5,sp)
2301  000b e701          	ld	(1,x),a
2302                     ; 761 }
2305  000d 85            	popw	x
2306  000e 81            	ret	
2343                     ; 769 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2343                     ; 770 {
2344                     .text:	section	.text,new
2345  0000               _I2C_GetPEC:
2349                     ; 772   return (I2Cx->PECR);
2351  0000 e60e          	ld	a,(14,x)
2354  0002 81            	ret	
2401                     ; 800 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2401                     ; 801 {
2402                     .text:	section	.text,new
2403  0000               _I2C_DMACmd:
2405  0000 89            	pushw	x
2406       00000000      OFST:	set	0
2409                     ; 803   assert_param(IS_FUNCTIONAL_STATE(NewState));
2411                     ; 805   if (NewState != DISABLE)
2413  0001 7b05          	ld	a,(OFST+5,sp)
2414  0003 2706          	jreq	L7521
2415                     ; 808     I2Cx->ITR |= I2C_ITR_DMAEN;
2417  0005 e60a          	ld	a,(10,x)
2418  0007 aa08          	or	a,#8
2420  0009 2006          	jra	L1621
2421  000b               L7521:
2422                     ; 813     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
2424  000b 1e01          	ldw	x,(OFST+1,sp)
2425  000d e60a          	ld	a,(10,x)
2426  000f a4f7          	and	a,#247
2427  0011               L1621:
2428  0011 e70a          	ld	(10,x),a
2429                     ; 815 }
2432  0013 85            	popw	x
2433  0014 81            	ret	
2481                     ; 824 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2481                     ; 825 {
2482                     .text:	section	.text,new
2483  0000               _I2C_DMALastTransferCmd:
2485  0000 89            	pushw	x
2486       00000000      OFST:	set	0
2489                     ; 827   assert_param(IS_FUNCTIONAL_STATE(NewState));
2491                     ; 829   if (NewState != DISABLE)
2493  0001 7b05          	ld	a,(OFST+5,sp)
2494  0003 2706          	jreq	L7031
2495                     ; 832     I2Cx->ITR |= I2C_ITR_LAST;
2497  0005 e60a          	ld	a,(10,x)
2498  0007 aa10          	or	a,#16
2500  0009 2006          	jra	L1131
2501  000b               L7031:
2502                     ; 837     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
2504  000b 1e01          	ldw	x,(OFST+1,sp)
2505  000d e60a          	ld	a,(10,x)
2506  000f a4ef          	and	a,#239
2507  0011               L1131:
2508  0011 e70a          	ld	(10,x),a
2509                     ; 839 }
2512  0013 85            	popw	x
2513  0014 81            	ret	
2702                     ; 951 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
2702                     ; 952 {
2703                     .text:	section	.text,new
2704  0000               _I2C_ITConfig:
2706  0000 89            	pushw	x
2707       00000000      OFST:	set	0
2710                     ; 954   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
2712                     ; 955   assert_param(IS_FUNCTIONAL_STATE(NewState));
2714                     ; 957   if (NewState != DISABLE)
2716  0001 7b07          	ld	a,(OFST+7,sp)
2717  0003 2706          	jreq	L3141
2718                     ; 960     I2Cx->ITR |= (uint8_t)I2C_IT;
2720  0005 e60a          	ld	a,(10,x)
2721  0007 1a06          	or	a,(OFST+6,sp)
2723  0009 2007          	jra	L5141
2724  000b               L3141:
2725                     ; 965     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
2727  000b 1e01          	ldw	x,(OFST+1,sp)
2728  000d 7b06          	ld	a,(OFST+6,sp)
2729  000f 43            	cpl	a
2730  0010 e40a          	and	a,(10,x)
2731  0012               L5141:
2732  0012 e70a          	ld	(10,x),a
2733                     ; 967 }
2736  0014 85            	popw	x
2737  0015 81            	ret	
2898                     ; 991 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2898                     ; 992 {
2899                     .text:	section	.text,new
2900  0000               _I2C_ReadRegister:
2902  0000 89            	pushw	x
2903  0001 5204          	subw	sp,#4
2904       00000004      OFST:	set	4
2907                     ; 993   __IO uint16_t tmp = 0;
2909  0003 5f            	clrw	x
2910  0004 1f03          	ldw	(OFST-1,sp),x
2911                     ; 995   assert_param(IS_I2C_REGISTER(I2C_Register));
2913                     ; 997   tmp = (uint16_t) I2Cx;
2915  0006 1e05          	ldw	x,(OFST+1,sp)
2916  0008 1f03          	ldw	(OFST-1,sp),x
2917                     ; 998   tmp += I2C_Register;
2919  000a 7b09          	ld	a,(OFST+5,sp)
2920  000c 5f            	clrw	x
2921  000d 97            	ld	xl,a
2922  000e 1f01          	ldw	(OFST-3,sp),x
2923  0010 1e03          	ldw	x,(OFST-1,sp)
2924  0012 72fb01        	addw	x,(OFST-3,sp)
2925  0015 1f03          	ldw	(OFST-1,sp),x
2926                     ; 1001   return (*(__IO uint8_t *) tmp);
2928  0017 1e03          	ldw	x,(OFST-1,sp)
2929  0019 f6            	ld	a,(x)
2932  001a 5b06          	addw	sp,#6
2933  001c 81            	ret	
3183                     ; 1041 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3183                     ; 1042 {
3184                     .text:	section	.text,new
3185  0000               _I2C_CheckEvent:
3187  0000 89            	pushw	x
3188  0001 5206          	subw	sp,#6
3189       00000006      OFST:	set	6
3192                     ; 1043   __IO uint16_t lastevent = 0x00;
3194  0003 5f            	clrw	x
3195  0004 1f04          	ldw	(OFST-2,sp),x
3196                     ; 1044   uint8_t flag1 = 0x00 ;
3198                     ; 1045   uint8_t flag2 = 0x00;
3200                     ; 1046   ErrorStatus status = ERROR;
3202                     ; 1049   assert_param(IS_I2C_EVENT(I2C_Event));
3204                     ; 1051   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3206  0006 1e0b          	ldw	x,(OFST+5,sp)
3207  0008 a30004        	cpw	x,#4
3208  000b 260a          	jrne	L5261
3209                     ; 1053     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3211  000d 1e07          	ldw	x,(OFST+1,sp)
3212  000f e608          	ld	a,(8,x)
3213  0011 a404          	and	a,#4
3214  0013 5f            	clrw	x
3215  0014 97            	ld	xl,a
3217  0015 201a          	jra	L7261
3218  0017               L5261:
3219                     ; 1057     flag1 = I2Cx->SR1;
3221  0017 1e07          	ldw	x,(OFST+1,sp)
3222  0019 e607          	ld	a,(7,x)
3223  001b 6b03          	ld	(OFST-3,sp),a
3224                     ; 1058     flag2 = I2Cx->SR3;
3226  001d e609          	ld	a,(9,x)
3227  001f 6b06          	ld	(OFST+0,sp),a
3228                     ; 1059     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3230  0021 5f            	clrw	x
3231  0022 7b03          	ld	a,(OFST-3,sp)
3232  0024 97            	ld	xl,a
3233  0025 1f01          	ldw	(OFST-5,sp),x
3234  0027 5f            	clrw	x
3235  0028 7b06          	ld	a,(OFST+0,sp)
3236  002a 97            	ld	xl,a
3237  002b 7b02          	ld	a,(OFST-4,sp)
3238  002d 01            	rrwa	x,a
3239  002e 1a01          	or	a,(OFST-5,sp)
3240  0030 01            	rrwa	x,a
3241  0031               L7261:
3242  0031 1f04          	ldw	(OFST-2,sp),x
3243                     ; 1062   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3245  0033 1e04          	ldw	x,(OFST-2,sp)
3246  0035 01            	rrwa	x,a
3247  0036 140c          	and	a,(OFST+6,sp)
3248  0038 01            	rrwa	x,a
3249  0039 140b          	and	a,(OFST+5,sp)
3250  003b 01            	rrwa	x,a
3251  003c 130b          	cpw	x,(OFST+5,sp)
3252  003e 2604          	jrne	L1361
3253                     ; 1065     status = SUCCESS;
3255  0040 a601          	ld	a,#1
3257  0042 2001          	jra	L3361
3258  0044               L1361:
3259                     ; 1070     status = ERROR;
3261  0044 4f            	clr	a
3262  0045               L3361:
3263                     ; 1074   return status;
3267  0045 5b08          	addw	sp,#8
3268  0047 81            	ret	
3329                     ; 1092 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3329                     ; 1093 {
3330                     .text:	section	.text,new
3331  0000               _I2C_GetLastEvent:
3333  0000 89            	pushw	x
3334  0001 5206          	subw	sp,#6
3335       00000006      OFST:	set	6
3338                     ; 1094   __IO uint16_t lastevent = 0;
3340  0003 5f            	clrw	x
3341  0004 1f05          	ldw	(OFST-1,sp),x
3342                     ; 1095   uint16_t flag1 = 0;
3344                     ; 1096   uint16_t flag2 = 0;
3346                     ; 1098   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3348  0006 1e07          	ldw	x,(OFST+1,sp)
3349  0008 e608          	ld	a,(8,x)
3350  000a a504          	bcp	a,#4
3351  000c 2705          	jreq	L5661
3352                     ; 1100     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3354  000e ae0004        	ldw	x,#4
3356  0011 2014          	jra	L7661
3357  0013               L5661:
3358                     ; 1105     flag1 = I2Cx->SR1;
3360  0013 e607          	ld	a,(7,x)
3361  0015 5f            	clrw	x
3362  0016 97            	ld	xl,a
3363  0017 1f01          	ldw	(OFST-5,sp),x
3364                     ; 1106     flag2 = I2Cx->SR3;
3366  0019 1e07          	ldw	x,(OFST+1,sp)
3367  001b e609          	ld	a,(9,x)
3368  001d 5f            	clrw	x
3369  001e 97            	ld	xl,a
3370  001f 1f03          	ldw	(OFST-3,sp),x
3371                     ; 1109     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3373  0021 7b02          	ld	a,(OFST-4,sp)
3374  0023 01            	rrwa	x,a
3375  0024 1a01          	or	a,(OFST-5,sp)
3376  0026 01            	rrwa	x,a
3377  0027               L7661:
3378  0027 1f05          	ldw	(OFST-1,sp),x
3379                     ; 1112   return (I2C_Event_TypeDef)lastevent;
3381  0029 1e05          	ldw	x,(OFST-1,sp)
3384  002b 5b08          	addw	sp,#8
3385  002d 81            	ret	
3638                     ; 1149 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3638                     ; 1150 {
3639                     .text:	section	.text,new
3640  0000               _I2C_GetFlagStatus:
3642  0000 89            	pushw	x
3643  0001 89            	pushw	x
3644       00000002      OFST:	set	2
3647                     ; 1151   uint8_t tempreg = 0;
3649  0002 0f02          	clr	(OFST+0,sp)
3650                     ; 1152   uint8_t regindex = 0;
3652                     ; 1153   FlagStatus bitstatus = RESET;
3654                     ; 1156   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3656                     ; 1159   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3658  0004 7b07          	ld	a,(OFST+5,sp)
3659  0006 6b01          	ld	(OFST-1,sp),a
3660                     ; 1161   switch (regindex)
3663                     ; 1178     default:
3663                     ; 1179       break;
3664  0008 4a            	dec	a
3665  0009 2708          	jreq	L1761
3666  000b 4a            	dec	a
3667  000c 270b          	jreq	L3761
3668  000e 4a            	dec	a
3669  000f 270e          	jreq	L5761
3670  0011 2012          	jra	L7202
3671  0013               L1761:
3672                     ; 1164     case 0x01:
3672                     ; 1165       tempreg = (uint8_t)I2Cx->SR1;
3674  0013 1e03          	ldw	x,(OFST+1,sp)
3675  0015 e607          	ld	a,(7,x)
3676                     ; 1166       break;
3678  0017 200a          	jp	LC002
3679  0019               L3761:
3680                     ; 1169     case 0x02:
3680                     ; 1170       tempreg = (uint8_t)I2Cx->SR2;
3682  0019 1e03          	ldw	x,(OFST+1,sp)
3683  001b e608          	ld	a,(8,x)
3684                     ; 1171       break;
3686  001d 2004          	jp	LC002
3687  001f               L5761:
3688                     ; 1174     case 0x03:
3688                     ; 1175       tempreg = (uint8_t)I2Cx->SR3;
3690  001f 1e03          	ldw	x,(OFST+1,sp)
3691  0021 e609          	ld	a,(9,x)
3692  0023               LC002:
3693  0023 6b02          	ld	(OFST+0,sp),a
3694                     ; 1176       break;
3696                     ; 1178     default:
3696                     ; 1179       break;
3698  0025               L7202:
3699                     ; 1183   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3701  0025 7b08          	ld	a,(OFST+6,sp)
3702  0027 1502          	bcp	a,(OFST+0,sp)
3703  0029 2704          	jreq	L1302
3704                     ; 1186     bitstatus = SET;
3706  002b a601          	ld	a,#1
3708  002d 2001          	jra	L3302
3709  002f               L1302:
3710                     ; 1191     bitstatus = RESET;
3712  002f 4f            	clr	a
3713  0030               L3302:
3714                     ; 1194   return bitstatus;
3718  0030 5b04          	addw	sp,#4
3719  0032 81            	ret	
3773                     ; 1226 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3773                     ; 1227 {
3774                     .text:	section	.text,new
3775  0000               _I2C_ClearFlag:
3777  0000 89            	pushw	x
3778  0001 89            	pushw	x
3779       00000002      OFST:	set	2
3782                     ; 1228   uint16_t flagpos = 0;
3784                     ; 1230   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3786                     ; 1233   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3788  0002 7b08          	ld	a,(OFST+6,sp)
3789  0004 5f            	clrw	x
3790  0005 02            	rlwa	x,a
3791  0006 1f01          	ldw	(OFST-1,sp),x
3792                     ; 1235   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3794  0008 7b02          	ld	a,(OFST+0,sp)
3795  000a 43            	cpl	a
3796  000b 1e03          	ldw	x,(OFST+1,sp)
3797  000d e708          	ld	(8,x),a
3798                     ; 1236 }
3801  000f 5b04          	addw	sp,#4
3802  0011 81            	ret	
3876                     ; 1261 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
3876                     ; 1262 {
3877                     .text:	section	.text,new
3878  0000               _I2C_GetITStatus:
3880  0000 89            	pushw	x
3881  0001 5204          	subw	sp,#4
3882       00000004      OFST:	set	4
3885                     ; 1263   ITStatus bitstatus = RESET;
3887                     ; 1264   __IO uint8_t enablestatus = 0;
3889  0003 0f03          	clr	(OFST-1,sp)
3890                     ; 1265   uint16_t tempregister = 0;
3892                     ; 1268   assert_param(IS_I2C_GET_IT(I2C_IT));
3894                     ; 1270   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
3896  0005 7b09          	ld	a,(OFST+5,sp)
3897  0007 a407          	and	a,#7
3898  0009 5f            	clrw	x
3899  000a 97            	ld	xl,a
3900  000b 1f01          	ldw	(OFST-3,sp),x
3901                     ; 1273   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
3903  000d 1e05          	ldw	x,(OFST+1,sp)
3904  000f e60a          	ld	a,(10,x)
3905  0011 1402          	and	a,(OFST-2,sp)
3906  0013 6b03          	ld	(OFST-1,sp),a
3907                     ; 1275   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
3909  0015 7b09          	ld	a,(OFST+5,sp)
3910  0017 a430          	and	a,#48
3911  0019 97            	ld	xl,a
3912  001a 4f            	clr	a
3913  001b 02            	rlwa	x,a
3914  001c a30100        	cpw	x,#256
3915  001f 260e          	jrne	L1212
3916                     ; 1278     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
3918  0021 1e05          	ldw	x,(OFST+1,sp)
3919  0023 e607          	ld	a,(7,x)
3920  0025 150a          	bcp	a,(OFST+6,sp)
3921  0027 2716          	jreq	L1312
3923  0029 0d03          	tnz	(OFST-1,sp)
3924  002b 2712          	jreq	L1312
3925                     ; 1281       bitstatus = SET;
3927  002d 200c          	jp	LC004
3928                     ; 1286       bitstatus = RESET;
3929  002f               L1212:
3930                     ; 1292     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
3932  002f 1e05          	ldw	x,(OFST+1,sp)
3933  0031 e608          	ld	a,(8,x)
3934  0033 150a          	bcp	a,(OFST+6,sp)
3935  0035 2708          	jreq	L1312
3937  0037 0d03          	tnz	(OFST-1,sp)
3938  0039 2704          	jreq	L1312
3939                     ; 1295       bitstatus = SET;
3941  003b               LC004:
3943  003b a601          	ld	a,#1
3945  003d 2001          	jra	L7212
3946  003f               L1312:
3947                     ; 1300       bitstatus = RESET;
3950  003f 4f            	clr	a
3951  0040               L7212:
3952                     ; 1304   return  bitstatus;
3956  0040 5b06          	addw	sp,#6
3957  0042 81            	ret	
4012                     ; 1337 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4012                     ; 1338 {
4013                     .text:	section	.text,new
4014  0000               _I2C_ClearITPendingBit:
4016  0000 89            	pushw	x
4017  0001 89            	pushw	x
4018       00000002      OFST:	set	2
4021                     ; 1339   uint16_t flagpos = 0;
4023                     ; 1342   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
4025                     ; 1345   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
4027  0002 7b08          	ld	a,(OFST+6,sp)
4028  0004 5f            	clrw	x
4029  0005 02            	rlwa	x,a
4030  0006 1f01          	ldw	(OFST-1,sp),x
4031                     ; 1348   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
4033  0008 7b02          	ld	a,(OFST+0,sp)
4034  000a 43            	cpl	a
4035  000b 1e03          	ldw	x,(OFST+1,sp)
4036  000d e708          	ld	(8,x),a
4037                     ; 1349 }
4040  000f 5b04          	addw	sp,#4
4041  0011 81            	ret	
4054                     	xdef	_I2C_ClearITPendingBit
4055                     	xdef	_I2C_GetITStatus
4056                     	xdef	_I2C_ClearFlag
4057                     	xdef	_I2C_GetFlagStatus
4058                     	xdef	_I2C_GetLastEvent
4059                     	xdef	_I2C_CheckEvent
4060                     	xdef	_I2C_ReadRegister
4061                     	xdef	_I2C_ITConfig
4062                     	xdef	_I2C_DMALastTransferCmd
4063                     	xdef	_I2C_DMACmd
4064                     	xdef	_I2C_CalculatePEC
4065                     	xdef	_I2C_TransmitPEC
4066                     	xdef	_I2C_GetPEC
4067                     	xdef	_I2C_PECPositionConfig
4068                     	xdef	_I2C_ReceiveData
4069                     	xdef	_I2C_SendData
4070                     	xdef	_I2C_Send7bitAddress
4071                     	xdef	_I2C_SMBusAlertConfig
4072                     	xdef	_I2C_FastModeDutyCycleConfig
4073                     	xdef	_I2C_AckPositionConfig
4074                     	xdef	_I2C_DualAddressCmd
4075                     	xdef	_I2C_OwnAddress2Config
4076                     	xdef	_I2C_AcknowledgeConfig
4077                     	xdef	_I2C_GenerateSTOP
4078                     	xdef	_I2C_GenerateSTART
4079                     	xdef	_I2C_ARPCmd
4080                     	xdef	_I2C_StretchClockCmd
4081                     	xdef	_I2C_SoftwareResetCmd
4082                     	xdef	_I2C_GeneralCallCmd
4083                     	xdef	_I2C_Cmd
4084                     	xdef	_I2C_Init
4085                     	xdef	_I2C_DeInit
4086                     	xref	_CLK_GetClockFreq
4087                     	xref.b	c_lreg
4088                     	xref.b	c_x
4107                     	xref	c_uitol
4108                     	xref	c_sdivx
4109                     	xref	c_lzmp
4110                     	xref	c_rtol
4111                     	xref	c_smul
4112                     	xref	c_lmul
4113                     	xref	c_lcmp
4114                     	xref	c_ltor
4115                     	xref	c_ludv
4116                     	end
