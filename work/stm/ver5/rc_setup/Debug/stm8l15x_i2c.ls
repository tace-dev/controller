   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
 203                     ; 138 void I2C_DeInit(I2C_TypeDef* I2Cx)
 203                     ; 139 {
 205                     .text:	section	.text,new
 206  0000               _I2C_DeInit:
 210                     ; 140   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
 212  0000 7f            	clr	(x)
 213                     ; 141   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
 215  0001 6f01          	clr	(1,x)
 216                     ; 142   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
 218  0003 6f02          	clr	(2,x)
 219                     ; 143   I2Cx->OARL = I2C_OARL_RESET_VALUE;
 221  0005 6f03          	clr	(3,x)
 222                     ; 144   I2Cx->OARH = I2C_OARH_RESET_VALUE;
 224  0007 6f04          	clr	(4,x)
 225                     ; 145   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
 227  0009 6f05          	clr	(5,x)
 228                     ; 146   I2Cx->ITR = I2C_ITR_RESET_VALUE;
 230  000b 6f0a          	clr	(10,x)
 231                     ; 147   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
 233  000d 6f0b          	clr	(11,x)
 234                     ; 148   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
 236  000f 6f0c          	clr	(12,x)
 237                     ; 149   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
 239  0011 a602          	ld	a,#2
 240  0013 e70d          	ld	(13,x),a
 241                     ; 150 }
 244  0015 81            	ret
 456                     .const:	section	.text
 457  0000               L01:
 458  0000 000f4240      	dc.l	1000000
 459  0004               L21:
 460  0004 000186a1      	dc.l	100001
 461  0008               L41:
 462  0008 00000004      	dc.l	4
 463                     ; 181 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 463                     ; 182               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 463                     ; 183               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 463                     ; 184 {
 464                     .text:	section	.text,new
 465  0000               _I2C_Init:
 467  0000 89            	pushw	x
 468  0001 520c          	subw	sp,#12
 469       0000000c      OFST:	set	12
 472                     ; 185   uint32_t result = 0x0004;
 474                     ; 186   uint16_t tmpval = 0;
 476                     ; 187   uint8_t tmpccrh = 0;
 478  0003 0f07          	clr	(OFST-5,sp)
 479                     ; 188   uint8_t input_clock = 0;
 481                     ; 191   assert_param(IS_I2C_MODE(I2C_Mode));
 483                     ; 192   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 485                     ; 193   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 487                     ; 194   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 489                     ; 195   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 491                     ; 196   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 493                     ; 200   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 495  0005 cd0000        	call	_CLK_GetClockFreq
 497  0008 ae0000        	ldw	x,#L01
 498  000b cd0000        	call	c_ludv
 500  000e b603          	ld	a,c_lreg+3
 501  0010 6b08          	ld	(OFST-4,sp),a
 502                     ; 204   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 504  0012 1e0d          	ldw	x,(OFST+1,sp)
 505  0014 e602          	ld	a,(2,x)
 506  0016 a4c0          	and	a,#192
 507  0018 e702          	ld	(2,x),a
 508                     ; 206   I2Cx->FREQR |= input_clock;
 510  001a 1e0d          	ldw	x,(OFST+1,sp)
 511  001c e602          	ld	a,(2,x)
 512  001e 1a08          	or	a,(OFST-4,sp)
 513  0020 e702          	ld	(2,x),a
 514                     ; 210   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 516  0022 1e0d          	ldw	x,(OFST+1,sp)
 517  0024 f6            	ld	a,(x)
 518  0025 a4fe          	and	a,#254
 519  0027 f7            	ld	(x),a
 520                     ; 213   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 522  0028 1e0d          	ldw	x,(OFST+1,sp)
 523  002a e60c          	ld	a,(12,x)
 524  002c a430          	and	a,#48
 525  002e e70c          	ld	(12,x),a
 526                     ; 214   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 528  0030 1e0d          	ldw	x,(OFST+1,sp)
 529  0032 6f0b          	clr	(11,x)
 530                     ; 217   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 532  0034 96            	ldw	x,sp
 533  0035 1c0011        	addw	x,#OFST+5
 534  0038 cd0000        	call	c_ltor
 536  003b ae0004        	ldw	x,#L21
 537  003e cd0000        	call	c_lcmp
 539  0041 2403          	jruge	L61
 540  0043 cc00e1        	jp	L742
 541  0046               L61:
 542                     ; 220     tmpccrh = I2C_CCRH_FS;
 544  0046 a680          	ld	a,#128
 545  0048 6b07          	ld	(OFST-5,sp),a
 546                     ; 222     if (I2C_DutyCycle == I2C_DutyCycle_2)
 548  004a 0d18          	tnz	(OFST+12,sp)
 549  004c 2633          	jrne	L152
 550                     ; 225       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 552  004e 96            	ldw	x,sp
 553  004f 1c0011        	addw	x,#OFST+5
 554  0052 cd0000        	call	c_ltor
 556  0055 a603          	ld	a,#3
 557  0057 cd0000        	call	c_smul
 559  005a 96            	ldw	x,sp
 560  005b 1c0001        	addw	x,#OFST-11
 561  005e cd0000        	call	c_rtol
 563  0061 7b08          	ld	a,(OFST-4,sp)
 564  0063 b703          	ld	c_lreg+3,a
 565  0065 3f02          	clr	c_lreg+2
 566  0067 3f01          	clr	c_lreg+1
 567  0069 3f00          	clr	c_lreg
 568  006b ae0000        	ldw	x,#L01
 569  006e cd0000        	call	c_lmul
 571  0071 96            	ldw	x,sp
 572  0072 1c0001        	addw	x,#OFST-11
 573  0075 cd0000        	call	c_ludv
 575  0078 96            	ldw	x,sp
 576  0079 1c0009        	addw	x,#OFST-3
 577  007c cd0000        	call	c_rtol
 580  007f 2037          	jra	L352
 581  0081               L152:
 582                     ; 230       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 584  0081 96            	ldw	x,sp
 585  0082 1c0011        	addw	x,#OFST+5
 586  0085 cd0000        	call	c_ltor
 588  0088 a619          	ld	a,#25
 589  008a cd0000        	call	c_smul
 591  008d 96            	ldw	x,sp
 592  008e 1c0001        	addw	x,#OFST-11
 593  0091 cd0000        	call	c_rtol
 595  0094 7b08          	ld	a,(OFST-4,sp)
 596  0096 b703          	ld	c_lreg+3,a
 597  0098 3f02          	clr	c_lreg+2
 598  009a 3f01          	clr	c_lreg+1
 599  009c 3f00          	clr	c_lreg
 600  009e ae0000        	ldw	x,#L01
 601  00a1 cd0000        	call	c_lmul
 603  00a4 96            	ldw	x,sp
 604  00a5 1c0001        	addw	x,#OFST-11
 605  00a8 cd0000        	call	c_ludv
 607  00ab 96            	ldw	x,sp
 608  00ac 1c0009        	addw	x,#OFST-3
 609  00af cd0000        	call	c_rtol
 611                     ; 232       tmpccrh |= I2C_CCRH_DUTY;
 613  00b2 7b07          	ld	a,(OFST-5,sp)
 614  00b4 aa40          	or	a,#64
 615  00b6 6b07          	ld	(OFST-5,sp),a
 616  00b8               L352:
 617                     ; 236     if (result < (uint16_t)0x01)
 619  00b8 96            	ldw	x,sp
 620  00b9 1c0009        	addw	x,#OFST-3
 621  00bc cd0000        	call	c_lzmp
 623  00bf 260a          	jrne	L552
 624                     ; 239       result = (uint16_t)0x0001;
 626  00c1 ae0001        	ldw	x,#1
 627  00c4 1f0b          	ldw	(OFST-1,sp),x
 628  00c6 ae0000        	ldw	x,#0
 629  00c9 1f09          	ldw	(OFST-3,sp),x
 630  00cb               L552:
 631                     ; 245     tmpval = ((input_clock * 3) / 10) + 1;
 633  00cb 7b08          	ld	a,(OFST-4,sp)
 634  00cd 97            	ld	xl,a
 635  00ce a603          	ld	a,#3
 636  00d0 42            	mul	x,a
 637  00d1 a60a          	ld	a,#10
 638  00d3 cd0000        	call	c_sdivx
 640  00d6 5c            	incw	x
 641  00d7 1f05          	ldw	(OFST-7,sp),x
 642                     ; 246     I2Cx->TRISER = (uint8_t)tmpval;
 644  00d9 7b06          	ld	a,(OFST-6,sp)
 645  00db 1e0d          	ldw	x,(OFST+1,sp)
 646  00dd e70d          	ld	(13,x),a
 648  00df 205c          	jra	L752
 649  00e1               L742:
 650                     ; 253     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 652  00e1 96            	ldw	x,sp
 653  00e2 1c0011        	addw	x,#OFST+5
 654  00e5 cd0000        	call	c_ltor
 656  00e8 3803          	sll	c_lreg+3
 657  00ea 3902          	rlc	c_lreg+2
 658  00ec 3901          	rlc	c_lreg+1
 659  00ee 3900          	rlc	c_lreg
 660  00f0 96            	ldw	x,sp
 661  00f1 1c0001        	addw	x,#OFST-11
 662  00f4 cd0000        	call	c_rtol
 664  00f7 7b08          	ld	a,(OFST-4,sp)
 665  00f9 b703          	ld	c_lreg+3,a
 666  00fb 3f02          	clr	c_lreg+2
 667  00fd 3f01          	clr	c_lreg+1
 668  00ff 3f00          	clr	c_lreg
 669  0101 ae0000        	ldw	x,#L01
 670  0104 cd0000        	call	c_lmul
 672  0107 96            	ldw	x,sp
 673  0108 1c0001        	addw	x,#OFST-11
 674  010b cd0000        	call	c_ludv
 676  010e b602          	ld	a,c_lreg+2
 677  0110 97            	ld	xl,a
 678  0111 b603          	ld	a,c_lreg+3
 679  0113 cd0000        	call	c_uitol
 681  0116 96            	ldw	x,sp
 682  0117 1c0009        	addw	x,#OFST-3
 683  011a cd0000        	call	c_rtol
 685                     ; 256     if (result < (uint16_t)0x0004)
 687  011d 96            	ldw	x,sp
 688  011e 1c0009        	addw	x,#OFST-3
 689  0121 cd0000        	call	c_ltor
 691  0124 ae0008        	ldw	x,#L41
 692  0127 cd0000        	call	c_lcmp
 694  012a 240a          	jruge	L162
 695                     ; 259       result = (uint16_t)0x0004;
 697  012c ae0004        	ldw	x,#4
 698  012f 1f0b          	ldw	(OFST-1,sp),x
 699  0131 ae0000        	ldw	x,#0
 700  0134 1f09          	ldw	(OFST-3,sp),x
 701  0136               L162:
 702                     ; 265     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 704  0136 7b08          	ld	a,(OFST-4,sp)
 705  0138 4c            	inc	a
 706  0139 1e0d          	ldw	x,(OFST+1,sp)
 707  013b e70d          	ld	(13,x),a
 708  013d               L752:
 709                     ; 270   I2Cx->CCRL = (uint8_t)result;
 711  013d 7b0c          	ld	a,(OFST+0,sp)
 712  013f 1e0d          	ldw	x,(OFST+1,sp)
 713  0141 e70b          	ld	(11,x),a
 714                     ; 271   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 716  0143 7b07          	ld	a,(OFST-5,sp)
 717  0145 1e0d          	ldw	x,(OFST+1,sp)
 718  0147 e70c          	ld	(12,x),a
 719                     ; 274   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 721  0149 1e0d          	ldw	x,(OFST+1,sp)
 722  014b 7b17          	ld	a,(OFST+11,sp)
 723  014d aa01          	or	a,#1
 724  014f fa            	or	a,(x)
 725  0150 f7            	ld	(x),a
 726                     ; 277   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 728  0151 1e0d          	ldw	x,(OFST+1,sp)
 729  0153 e601          	ld	a,(1,x)
 730  0155 1a19          	or	a,(OFST+13,sp)
 731  0157 e701          	ld	(1,x),a
 732                     ; 280   I2Cx->OARL = (uint8_t)(OwnAddress);
 734  0159 7b16          	ld	a,(OFST+10,sp)
 735  015b 1e0d          	ldw	x,(OFST+1,sp)
 736  015d e703          	ld	(3,x),a
 737                     ; 281   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 737                     ; 282                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 739  015f 1e15          	ldw	x,(OFST+9,sp)
 740  0161 4f            	clr	a
 741  0162 01            	rrwa	x,a
 742  0163 48            	sll	a
 743  0164 59            	rlcw	x
 744  0165 01            	rrwa	x,a
 745  0166 a406          	and	a,#6
 746  0168 5f            	clrw	x
 747  0169 6b04          	ld	(OFST-8,sp),a
 748  016b 7b1a          	ld	a,(OFST+14,sp)
 749  016d aa40          	or	a,#64
 750  016f 1a04          	or	a,(OFST-8,sp)
 751  0171 1e0d          	ldw	x,(OFST+1,sp)
 752  0173 e704          	ld	(4,x),a
 753                     ; 283 }
 756  0175 5b0e          	addw	sp,#14
 757  0177 81            	ret
 824                     ; 292 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 824                     ; 293 {
 825                     .text:	section	.text,new
 826  0000               _I2C_Cmd:
 828  0000 89            	pushw	x
 829       00000000      OFST:	set	0
 832                     ; 296   assert_param(IS_FUNCTIONAL_STATE(NewState));
 834                     ; 298   if (NewState != DISABLE)
 836  0001 0d05          	tnz	(OFST+5,sp)
 837  0003 2706          	jreq	L713
 838                     ; 301     I2Cx->CR1 |= I2C_CR1_PE;
 840  0005 f6            	ld	a,(x)
 841  0006 aa01          	or	a,#1
 842  0008 f7            	ld	(x),a
 844  0009 2006          	jra	L123
 845  000b               L713:
 846                     ; 306     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 848  000b 1e01          	ldw	x,(OFST+1,sp)
 849  000d f6            	ld	a,(x)
 850  000e a4fe          	and	a,#254
 851  0010 f7            	ld	(x),a
 852  0011               L123:
 853                     ; 308 }
 856  0011 85            	popw	x
 857  0012 81            	ret
 904                     ; 317 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 904                     ; 318 {
 905                     .text:	section	.text,new
 906  0000               _I2C_GeneralCallCmd:
 908  0000 89            	pushw	x
 909       00000000      OFST:	set	0
 912                     ; 321   assert_param(IS_FUNCTIONAL_STATE(NewState));
 914                     ; 323   if (NewState != DISABLE)
 916  0001 0d05          	tnz	(OFST+5,sp)
 917  0003 2706          	jreq	L743
 918                     ; 326     I2Cx->CR1 |= I2C_CR1_ENGC;
 920  0005 f6            	ld	a,(x)
 921  0006 aa40          	or	a,#64
 922  0008 f7            	ld	(x),a
 924  0009 2006          	jra	L153
 925  000b               L743:
 926                     ; 331     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 928  000b 1e01          	ldw	x,(OFST+1,sp)
 929  000d f6            	ld	a,(x)
 930  000e a4bf          	and	a,#191
 931  0010 f7            	ld	(x),a
 932  0011               L153:
 933                     ; 333 }
 936  0011 85            	popw	x
 937  0012 81            	ret
 984                     ; 344 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
 984                     ; 345 {
 985                     .text:	section	.text,new
 986  0000               _I2C_GenerateSTART:
 988  0000 89            	pushw	x
 989       00000000      OFST:	set	0
 992                     ; 348   assert_param(IS_FUNCTIONAL_STATE(NewState));
 994                     ; 350   if (NewState != DISABLE)
 996  0001 0d05          	tnz	(OFST+5,sp)
 997  0003 2708          	jreq	L773
 998                     ; 353     I2Cx->CR2 |= I2C_CR2_START;
1000  0005 e601          	ld	a,(1,x)
1001  0007 aa01          	or	a,#1
1002  0009 e701          	ld	(1,x),a
1004  000b 2008          	jra	L104
1005  000d               L773:
1006                     ; 358     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
1008  000d 1e01          	ldw	x,(OFST+1,sp)
1009  000f e601          	ld	a,(1,x)
1010  0011 a4fe          	and	a,#254
1011  0013 e701          	ld	(1,x),a
1012  0015               L104:
1013                     ; 360 }
1016  0015 85            	popw	x
1017  0016 81            	ret
1064                     ; 369 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1064                     ; 370 {
1065                     .text:	section	.text,new
1066  0000               _I2C_GenerateSTOP:
1068  0000 89            	pushw	x
1069       00000000      OFST:	set	0
1072                     ; 373   assert_param(IS_FUNCTIONAL_STATE(NewState));
1074                     ; 375   if (NewState != DISABLE)
1076  0001 0d05          	tnz	(OFST+5,sp)
1077  0003 2708          	jreq	L724
1078                     ; 378     I2Cx->CR2 |= I2C_CR2_STOP;
1080  0005 e601          	ld	a,(1,x)
1081  0007 aa02          	or	a,#2
1082  0009 e701          	ld	(1,x),a
1084  000b 2008          	jra	L134
1085  000d               L724:
1086                     ; 383     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1088  000d 1e01          	ldw	x,(OFST+1,sp)
1089  000f e601          	ld	a,(1,x)
1090  0011 a4fd          	and	a,#253
1091  0013 e701          	ld	(1,x),a
1092  0015               L134:
1093                     ; 385 }
1096  0015 85            	popw	x
1097  0016 81            	ret
1145                     ; 394 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1145                     ; 395 {
1146                     .text:	section	.text,new
1147  0000               _I2C_SoftwareResetCmd:
1149  0000 89            	pushw	x
1150       00000000      OFST:	set	0
1153                     ; 397   assert_param(IS_FUNCTIONAL_STATE(NewState));
1155                     ; 399   if (NewState != DISABLE)
1157  0001 0d05          	tnz	(OFST+5,sp)
1158  0003 2708          	jreq	L754
1159                     ; 402     I2Cx->CR2 |= I2C_CR2_SWRST;
1161  0005 e601          	ld	a,(1,x)
1162  0007 aa80          	or	a,#128
1163  0009 e701          	ld	(1,x),a
1165  000b 2008          	jra	L164
1166  000d               L754:
1167                     ; 407     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1169  000d 1e01          	ldw	x,(OFST+1,sp)
1170  000f e601          	ld	a,(1,x)
1171  0011 a47f          	and	a,#127
1172  0013 e701          	ld	(1,x),a
1173  0015               L164:
1174                     ; 409 }
1177  0015 85            	popw	x
1178  0016 81            	ret
1226                     ; 418 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1226                     ; 419 {
1227                     .text:	section	.text,new
1228  0000               _I2C_StretchClockCmd:
1230  0000 89            	pushw	x
1231       00000000      OFST:	set	0
1234                     ; 421   assert_param(IS_FUNCTIONAL_STATE(NewState));
1236                     ; 423   if (NewState != DISABLE)
1238  0001 0d05          	tnz	(OFST+5,sp)
1239  0003 2706          	jreq	L705
1240                     ; 426     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1242  0005 f6            	ld	a,(x)
1243  0006 a47f          	and	a,#127
1244  0008 f7            	ld	(x),a
1246  0009 2006          	jra	L115
1247  000b               L705:
1248                     ; 432     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1250  000b 1e01          	ldw	x,(OFST+1,sp)
1251  000d f6            	ld	a,(x)
1252  000e aa80          	or	a,#128
1253  0010 f7            	ld	(x),a
1254  0011               L115:
1255                     ; 434 }
1258  0011 85            	popw	x
1259  0012 81            	ret
1306                     ; 443 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1306                     ; 444 {
1307                     .text:	section	.text,new
1308  0000               _I2C_ARPCmd:
1310  0000 89            	pushw	x
1311       00000000      OFST:	set	0
1314                     ; 446   assert_param(IS_FUNCTIONAL_STATE(NewState));
1316                     ; 448   if (NewState != DISABLE)
1318  0001 0d05          	tnz	(OFST+5,sp)
1319  0003 2706          	jreq	L735
1320                     ; 451     I2Cx->CR1 |= I2C_CR1_ARP;
1322  0005 f6            	ld	a,(x)
1323  0006 aa10          	or	a,#16
1324  0008 f7            	ld	(x),a
1326  0009 2006          	jra	L145
1327  000b               L735:
1328                     ; 457     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1330  000b 1e01          	ldw	x,(OFST+1,sp)
1331  000d f6            	ld	a,(x)
1332  000e a4ef          	and	a,#239
1333  0010 f7            	ld	(x),a
1334  0011               L145:
1335                     ; 459 }
1338  0011 85            	popw	x
1339  0012 81            	ret
1387                     ; 468 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1387                     ; 469 {
1388                     .text:	section	.text,new
1389  0000               _I2C_AcknowledgeConfig:
1391  0000 89            	pushw	x
1392       00000000      OFST:	set	0
1395                     ; 471   assert_param(IS_FUNCTIONAL_STATE(NewState));
1397                     ; 473   if (NewState != DISABLE)
1399  0001 0d05          	tnz	(OFST+5,sp)
1400  0003 2708          	jreq	L765
1401                     ; 476     I2Cx->CR2 |= I2C_CR2_ACK;
1403  0005 e601          	ld	a,(1,x)
1404  0007 aa04          	or	a,#4
1405  0009 e701          	ld	(1,x),a
1407  000b 2008          	jra	L175
1408  000d               L765:
1409                     ; 481     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1411  000d 1e01          	ldw	x,(OFST+1,sp)
1412  000f e601          	ld	a,(1,x)
1413  0011 a4fb          	and	a,#251
1414  0013 e701          	ld	(1,x),a
1415  0015               L175:
1416                     ; 483 }
1419  0015 85            	popw	x
1420  0016 81            	ret
1472                     ; 491 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1472                     ; 492 {
1473                     .text:	section	.text,new
1474  0000               _I2C_OwnAddress2Config:
1476  0000 89            	pushw	x
1477  0001 88            	push	a
1478       00000001      OFST:	set	1
1481                     ; 493   uint8_t tmpreg = 0;
1483                     ; 496   tmpreg = I2Cx->OAR2;
1485  0002 e605          	ld	a,(5,x)
1486  0004 6b01          	ld	(OFST+0,sp),a
1487                     ; 499   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1489  0006 7b01          	ld	a,(OFST+0,sp)
1490  0008 a401          	and	a,#1
1491  000a 6b01          	ld	(OFST+0,sp),a
1492                     ; 502   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1494  000c 7b06          	ld	a,(OFST+5,sp)
1495  000e a4fe          	and	a,#254
1496  0010 1a01          	or	a,(OFST+0,sp)
1497  0012 6b01          	ld	(OFST+0,sp),a
1498                     ; 505   I2Cx->OAR2 = tmpreg;
1500  0014 7b01          	ld	a,(OFST+0,sp)
1501  0016 1e02          	ldw	x,(OFST+1,sp)
1502  0018 e705          	ld	(5,x),a
1503                     ; 506 }
1506  001a 5b03          	addw	sp,#3
1507  001c 81            	ret
1554                     ; 515 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1554                     ; 516 {
1555                     .text:	section	.text,new
1556  0000               _I2C_DualAddressCmd:
1558  0000 89            	pushw	x
1559       00000000      OFST:	set	0
1562                     ; 518   assert_param(IS_FUNCTIONAL_STATE(NewState));
1564                     ; 520   if (NewState != DISABLE)
1566  0001 0d05          	tnz	(OFST+5,sp)
1567  0003 2708          	jreq	L346
1568                     ; 523     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1570  0005 e605          	ld	a,(5,x)
1571  0007 aa01          	or	a,#1
1572  0009 e705          	ld	(5,x),a
1574  000b 2008          	jra	L546
1575  000d               L346:
1576                     ; 528     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1578  000d 1e01          	ldw	x,(OFST+1,sp)
1579  000f e605          	ld	a,(5,x)
1580  0011 a4fe          	and	a,#254
1581  0013 e705          	ld	(5,x),a
1582  0015               L546:
1583                     ; 530 }
1586  0015 85            	popw	x
1587  0016 81            	ret
1657                     ; 542 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
1657                     ; 543 {
1658                     .text:	section	.text,new
1659  0000               _I2C_AckPositionConfig:
1661  0000 89            	pushw	x
1662       00000000      OFST:	set	0
1665                     ; 545   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1667                     ; 548   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
1669  0001 e601          	ld	a,(1,x)
1670  0003 a4f7          	and	a,#247
1671  0005 e701          	ld	(1,x),a
1672                     ; 550   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
1674  0007 e601          	ld	a,(1,x)
1675  0009 1a05          	or	a,(OFST+5,sp)
1676  000b e701          	ld	(1,x),a
1677                     ; 551 }
1680  000d 85            	popw	x
1681  000e 81            	ret
1750                     ; 562 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
1750                     ; 563 {
1751                     .text:	section	.text,new
1752  0000               _I2C_SMBusAlertConfig:
1754  0000 89            	pushw	x
1755       00000000      OFST:	set	0
1758                     ; 566   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
1760                     ; 568   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
1762  0001 0d05          	tnz	(OFST+5,sp)
1763  0003 2708          	jreq	L737
1764                     ; 571     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
1766  0005 e601          	ld	a,(1,x)
1767  0007 aa20          	or	a,#32
1768  0009 e701          	ld	(1,x),a
1770  000b 2008          	jra	L147
1771  000d               L737:
1772                     ; 576     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
1774  000d 1e01          	ldw	x,(OFST+1,sp)
1775  000f e601          	ld	a,(1,x)
1776  0011 a4df          	and	a,#223
1777  0013 e701          	ld	(1,x),a
1778  0015               L147:
1779                     ; 578 }
1782  0015 85            	popw	x
1783  0016 81            	ret
1831                     ; 589 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
1831                     ; 590 {
1832                     .text:	section	.text,new
1833  0000               _I2C_FastModeDutyCycleConfig:
1835  0000 89            	pushw	x
1836       00000000      OFST:	set	0
1839                     ; 593   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1841                     ; 595   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1843  0001 7b05          	ld	a,(OFST+5,sp)
1844  0003 a140          	cp	a,#64
1845  0005 2608          	jrne	L767
1846                     ; 598     I2Cx->CCRH |= I2C_CCRH_DUTY;
1848  0007 e60c          	ld	a,(12,x)
1849  0009 aa40          	or	a,#64
1850  000b e70c          	ld	(12,x),a
1852  000d 2008          	jra	L177
1853  000f               L767:
1854                     ; 603     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1856  000f 1e01          	ldw	x,(OFST+1,sp)
1857  0011 e60c          	ld	a,(12,x)
1858  0013 a4bf          	and	a,#191
1859  0015 e70c          	ld	(12,x),a
1860  0017               L177:
1861                     ; 605 }
1864  0017 85            	popw	x
1865  0018 81            	ret
1942                     ; 618 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1942                     ; 619 {
1943                     .text:	section	.text,new
1944  0000               _I2C_Send7bitAddress:
1946  0000 89            	pushw	x
1947       00000000      OFST:	set	0
1950                     ; 621   assert_param(IS_I2C_ADDRESS(Address));
1952                     ; 622   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1954                     ; 625   if (I2C_Direction != I2C_Direction_Transmitter)
1956  0001 0d06          	tnz	(OFST+6,sp)
1957  0003 2708          	jreq	L1301
1958                     ; 628     Address |= OAR1_ADD0_Set;
1960  0005 7b05          	ld	a,(OFST+5,sp)
1961  0007 aa01          	or	a,#1
1962  0009 6b05          	ld	(OFST+5,sp),a
1964  000b 2006          	jra	L3301
1965  000d               L1301:
1966                     ; 633     Address &= OAR1_ADD0_Reset;
1968  000d 7b05          	ld	a,(OFST+5,sp)
1969  000f a4fe          	and	a,#254
1970  0011 6b05          	ld	(OFST+5,sp),a
1971  0013               L3301:
1972                     ; 636   I2Cx->DR = Address;
1974  0013 7b05          	ld	a,(OFST+5,sp)
1975  0015 1e01          	ldw	x,(OFST+1,sp)
1976  0017 e706          	ld	(6,x),a
1977                     ; 637 }
1980  0019 85            	popw	x
1981  001a 81            	ret
2025                     ; 661 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
2025                     ; 662 {
2026                     .text:	section	.text,new
2027  0000               _I2C_SendData:
2029  0000 89            	pushw	x
2030       00000000      OFST:	set	0
2033                     ; 664   I2Cx->DR = Data;
2035  0001 7b05          	ld	a,(OFST+5,sp)
2036  0003 1e01          	ldw	x,(OFST+1,sp)
2037  0005 e706          	ld	(6,x),a
2038                     ; 665 }
2041  0007 85            	popw	x
2042  0008 81            	ret
2079                     ; 673 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2079                     ; 674 {
2080                     .text:	section	.text,new
2081  0000               _I2C_ReceiveData:
2085                     ; 676   return ((uint8_t)I2Cx->DR);
2087  0000 e606          	ld	a,(6,x)
2090  0002 81            	ret
2137                     ; 702 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2137                     ; 703 {
2138                     .text:	section	.text,new
2139  0000               _I2C_TransmitPEC:
2141  0000 89            	pushw	x
2142       00000000      OFST:	set	0
2145                     ; 705   assert_param(IS_FUNCTIONAL_STATE(NewState));
2147                     ; 707   if (NewState != DISABLE)
2149  0001 0d05          	tnz	(OFST+5,sp)
2150  0003 2708          	jreq	L3211
2151                     ; 710     I2Cx->CR2 |= I2C_CR2_PEC;
2153  0005 e601          	ld	a,(1,x)
2154  0007 aa10          	or	a,#16
2155  0009 e701          	ld	(1,x),a
2157  000b 2008          	jra	L5211
2158  000d               L3211:
2159                     ; 715     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2161  000d 1e01          	ldw	x,(OFST+1,sp)
2162  000f e601          	ld	a,(1,x)
2163  0011 a4ef          	and	a,#239
2164  0013 e701          	ld	(1,x),a
2165  0015               L5211:
2166                     ; 717 }
2169  0015 85            	popw	x
2170  0016 81            	ret
2217                     ; 726 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2217                     ; 727 {
2218                     .text:	section	.text,new
2219  0000               _I2C_CalculatePEC:
2221  0000 89            	pushw	x
2222       00000000      OFST:	set	0
2225                     ; 729   assert_param(IS_FUNCTIONAL_STATE(NewState));
2227                     ; 731   if (NewState != DISABLE)
2229  0001 0d05          	tnz	(OFST+5,sp)
2230  0003 2706          	jreq	L3511
2231                     ; 734     I2Cx->CR1 |= I2C_CR1_ENPEC;
2233  0005 f6            	ld	a,(x)
2234  0006 aa20          	or	a,#32
2235  0008 f7            	ld	(x),a
2237  0009 2006          	jra	L5511
2238  000b               L3511:
2239                     ; 739     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2241  000b 1e01          	ldw	x,(OFST+1,sp)
2242  000d f6            	ld	a,(x)
2243  000e a4df          	and	a,#223
2244  0010 f7            	ld	(x),a
2245  0011               L5511:
2246                     ; 741 }
2249  0011 85            	popw	x
2250  0012 81            	ret
2320                     ; 752 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2320                     ; 753 {
2321                     .text:	section	.text,new
2322  0000               _I2C_PECPositionConfig:
2324  0000 89            	pushw	x
2325       00000000      OFST:	set	0
2328                     ; 755   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2330                     ; 758   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2332  0001 e601          	ld	a,(1,x)
2333  0003 a4f7          	and	a,#247
2334  0005 e701          	ld	(1,x),a
2335                     ; 760   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2337  0007 e601          	ld	a,(1,x)
2338  0009 1a05          	or	a,(OFST+5,sp)
2339  000b e701          	ld	(1,x),a
2340                     ; 761 }
2343  000d 85            	popw	x
2344  000e 81            	ret
2381                     ; 769 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2381                     ; 770 {
2382                     .text:	section	.text,new
2383  0000               _I2C_GetPEC:
2387                     ; 772   return (I2Cx->PECR);
2389  0000 e60e          	ld	a,(14,x)
2392  0002 81            	ret
2439                     ; 800 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2439                     ; 801 {
2440                     .text:	section	.text,new
2441  0000               _I2C_DMACmd:
2443  0000 89            	pushw	x
2444       00000000      OFST:	set	0
2447                     ; 803   assert_param(IS_FUNCTIONAL_STATE(NewState));
2449                     ; 805   if (NewState != DISABLE)
2451  0001 0d05          	tnz	(OFST+5,sp)
2452  0003 2708          	jreq	L7521
2453                     ; 808     I2Cx->ITR |= I2C_ITR_DMAEN;
2455  0005 e60a          	ld	a,(10,x)
2456  0007 aa08          	or	a,#8
2457  0009 e70a          	ld	(10,x),a
2459  000b 2008          	jra	L1621
2460  000d               L7521:
2461                     ; 813     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
2463  000d 1e01          	ldw	x,(OFST+1,sp)
2464  000f e60a          	ld	a,(10,x)
2465  0011 a4f7          	and	a,#247
2466  0013 e70a          	ld	(10,x),a
2467  0015               L1621:
2468                     ; 815 }
2471  0015 85            	popw	x
2472  0016 81            	ret
2520                     ; 824 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2520                     ; 825 {
2521                     .text:	section	.text,new
2522  0000               _I2C_DMALastTransferCmd:
2524  0000 89            	pushw	x
2525       00000000      OFST:	set	0
2528                     ; 827   assert_param(IS_FUNCTIONAL_STATE(NewState));
2530                     ; 829   if (NewState != DISABLE)
2532  0001 0d05          	tnz	(OFST+5,sp)
2533  0003 2708          	jreq	L7031
2534                     ; 832     I2Cx->ITR |= I2C_ITR_LAST;
2536  0005 e60a          	ld	a,(10,x)
2537  0007 aa10          	or	a,#16
2538  0009 e70a          	ld	(10,x),a
2540  000b 2008          	jra	L1131
2541  000d               L7031:
2542                     ; 837     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
2544  000d 1e01          	ldw	x,(OFST+1,sp)
2545  000f e60a          	ld	a,(10,x)
2546  0011 a4ef          	and	a,#239
2547  0013 e70a          	ld	(10,x),a
2548  0015               L1131:
2549                     ; 839 }
2552  0015 85            	popw	x
2553  0016 81            	ret
2742                     ; 951 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
2742                     ; 952 {
2743                     .text:	section	.text,new
2744  0000               _I2C_ITConfig:
2746  0000 89            	pushw	x
2747       00000000      OFST:	set	0
2750                     ; 954   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
2752                     ; 955   assert_param(IS_FUNCTIONAL_STATE(NewState));
2754                     ; 957   if (NewState != DISABLE)
2756  0001 0d07          	tnz	(OFST+7,sp)
2757  0003 2708          	jreq	L3141
2758                     ; 960     I2Cx->ITR |= (uint8_t)I2C_IT;
2760  0005 e60a          	ld	a,(10,x)
2761  0007 1a06          	or	a,(OFST+6,sp)
2762  0009 e70a          	ld	(10,x),a
2764  000b 2009          	jra	L5141
2765  000d               L3141:
2766                     ; 965     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
2768  000d 1e01          	ldw	x,(OFST+1,sp)
2769  000f 7b06          	ld	a,(OFST+6,sp)
2770  0011 43            	cpl	a
2771  0012 e40a          	and	a,(10,x)
2772  0014 e70a          	ld	(10,x),a
2773  0016               L5141:
2774                     ; 967 }
2777  0016 85            	popw	x
2778  0017 81            	ret
2939                     ; 991 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2939                     ; 992 {
2940                     .text:	section	.text,new
2941  0000               _I2C_ReadRegister:
2943  0000 89            	pushw	x
2944  0001 5204          	subw	sp,#4
2945       00000004      OFST:	set	4
2948                     ; 993   __IO uint16_t tmp = 0;
2950  0003 5f            	clrw	x
2951  0004 1f03          	ldw	(OFST-1,sp),x
2952                     ; 995   assert_param(IS_I2C_REGISTER(I2C_Register));
2954                     ; 997   tmp = (uint16_t) I2Cx;
2956  0006 1e05          	ldw	x,(OFST+1,sp)
2957  0008 1f03          	ldw	(OFST-1,sp),x
2958                     ; 998   tmp += I2C_Register;
2960  000a 7b09          	ld	a,(OFST+5,sp)
2961  000c 5f            	clrw	x
2962  000d 97            	ld	xl,a
2963  000e 1f01          	ldw	(OFST-3,sp),x
2964  0010 1e03          	ldw	x,(OFST-1,sp)
2965  0012 72fb01        	addw	x,(OFST-3,sp)
2966  0015 1f03          	ldw	(OFST-1,sp),x
2967                     ; 1001   return (*(__IO uint8_t *) tmp);
2969  0017 1e03          	ldw	x,(OFST-1,sp)
2970  0019 f6            	ld	a,(x)
2973  001a 5b06          	addw	sp,#6
2974  001c 81            	ret
3224                     ; 1041 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3224                     ; 1042 {
3225                     .text:	section	.text,new
3226  0000               _I2C_CheckEvent:
3228  0000 89            	pushw	x
3229  0001 5206          	subw	sp,#6
3230       00000006      OFST:	set	6
3233                     ; 1043   __IO uint16_t lastevent = 0x00;
3235  0003 5f            	clrw	x
3236  0004 1f04          	ldw	(OFST-2,sp),x
3237                     ; 1044   uint8_t flag1 = 0x00 ;
3239                     ; 1045   uint8_t flag2 = 0x00;
3241                     ; 1046   ErrorStatus status = ERROR;
3243                     ; 1049   assert_param(IS_I2C_EVENT(I2C_Event));
3245                     ; 1051   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3247  0006 1e0b          	ldw	x,(OFST+5,sp)
3248  0008 a30004        	cpw	x,#4
3249  000b 260c          	jrne	L5261
3250                     ; 1053     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3252  000d 1e07          	ldw	x,(OFST+1,sp)
3253  000f e608          	ld	a,(8,x)
3254  0011 a404          	and	a,#4
3255  0013 5f            	clrw	x
3256  0014 97            	ld	xl,a
3257  0015 1f04          	ldw	(OFST-2,sp),x
3259  0017 2021          	jra	L7261
3260  0019               L5261:
3261                     ; 1057     flag1 = I2Cx->SR1;
3263  0019 1e07          	ldw	x,(OFST+1,sp)
3264  001b e607          	ld	a,(7,x)
3265  001d 6b03          	ld	(OFST-3,sp),a
3266                     ; 1058     flag2 = I2Cx->SR3;
3268  001f 1e07          	ldw	x,(OFST+1,sp)
3269  0021 e609          	ld	a,(9,x)
3270  0023 6b06          	ld	(OFST+0,sp),a
3271                     ; 1059     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3273  0025 7b03          	ld	a,(OFST-3,sp)
3274  0027 5f            	clrw	x
3275  0028 97            	ld	xl,a
3276  0029 1f01          	ldw	(OFST-5,sp),x
3277  002b 7b06          	ld	a,(OFST+0,sp)
3278  002d 5f            	clrw	x
3279  002e 97            	ld	xl,a
3280  002f 4f            	clr	a
3281  0030 02            	rlwa	x,a
3282  0031 01            	rrwa	x,a
3283  0032 1a02          	or	a,(OFST-4,sp)
3284  0034 01            	rrwa	x,a
3285  0035 1a01          	or	a,(OFST-5,sp)
3286  0037 01            	rrwa	x,a
3287  0038 1f04          	ldw	(OFST-2,sp),x
3288  003a               L7261:
3289                     ; 1062   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3291  003a 1e04          	ldw	x,(OFST-2,sp)
3292  003c 01            	rrwa	x,a
3293  003d 140c          	and	a,(OFST+6,sp)
3294  003f 01            	rrwa	x,a
3295  0040 140b          	and	a,(OFST+5,sp)
3296  0042 01            	rrwa	x,a
3297  0043 130b          	cpw	x,(OFST+5,sp)
3298  0045 2606          	jrne	L1361
3299                     ; 1065     status = SUCCESS;
3301  0047 a601          	ld	a,#1
3302  0049 6b06          	ld	(OFST+0,sp),a
3304  004b 2002          	jra	L3361
3305  004d               L1361:
3306                     ; 1070     status = ERROR;
3308  004d 0f06          	clr	(OFST+0,sp)
3309  004f               L3361:
3310                     ; 1074   return status;
3312  004f 7b06          	ld	a,(OFST+0,sp)
3315  0051 5b08          	addw	sp,#8
3316  0053 81            	ret
3377                     ; 1092 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3377                     ; 1093 {
3378                     .text:	section	.text,new
3379  0000               _I2C_GetLastEvent:
3381  0000 89            	pushw	x
3382  0001 5206          	subw	sp,#6
3383       00000006      OFST:	set	6
3386                     ; 1094   __IO uint16_t lastevent = 0;
3388  0003 5f            	clrw	x
3389  0004 1f05          	ldw	(OFST-1,sp),x
3390                     ; 1095   uint16_t flag1 = 0;
3392                     ; 1096   uint16_t flag2 = 0;
3394                     ; 1098   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3396  0006 1e07          	ldw	x,(OFST+1,sp)
3397  0008 e608          	ld	a,(8,x)
3398  000a a504          	bcp	a,#4
3399  000c 2707          	jreq	L5661
3400                     ; 1100     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3402  000e ae0004        	ldw	x,#4
3403  0011 1f05          	ldw	(OFST-1,sp),x
3405  0013 201d          	jra	L7661
3406  0015               L5661:
3407                     ; 1105     flag1 = I2Cx->SR1;
3409  0015 1e07          	ldw	x,(OFST+1,sp)
3410  0017 e607          	ld	a,(7,x)
3411  0019 5f            	clrw	x
3412  001a 97            	ld	xl,a
3413  001b 1f01          	ldw	(OFST-5,sp),x
3414                     ; 1106     flag2 = I2Cx->SR3;
3416  001d 1e07          	ldw	x,(OFST+1,sp)
3417  001f e609          	ld	a,(9,x)
3418  0021 5f            	clrw	x
3419  0022 97            	ld	xl,a
3420  0023 1f03          	ldw	(OFST-3,sp),x
3421                     ; 1109     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3423  0025 1e03          	ldw	x,(OFST-3,sp)
3424  0027 4f            	clr	a
3425  0028 02            	rlwa	x,a
3426  0029 01            	rrwa	x,a
3427  002a 1a02          	or	a,(OFST-4,sp)
3428  002c 01            	rrwa	x,a
3429  002d 1a01          	or	a,(OFST-5,sp)
3430  002f 01            	rrwa	x,a
3431  0030 1f05          	ldw	(OFST-1,sp),x
3432  0032               L7661:
3433                     ; 1112   return (I2C_Event_TypeDef)lastevent;
3435  0032 1e05          	ldw	x,(OFST-1,sp)
3438  0034 5b08          	addw	sp,#8
3439  0036 81            	ret
3692                     ; 1149 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3692                     ; 1150 {
3693                     .text:	section	.text,new
3694  0000               _I2C_GetFlagStatus:
3696  0000 89            	pushw	x
3697  0001 89            	pushw	x
3698       00000002      OFST:	set	2
3701                     ; 1151   uint8_t tempreg = 0;
3703  0002 0f02          	clr	(OFST+0,sp)
3704                     ; 1152   uint8_t regindex = 0;
3706                     ; 1153   FlagStatus bitstatus = RESET;
3708                     ; 1156   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3710                     ; 1159   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3712  0004 7b07          	ld	a,(OFST+5,sp)
3713  0006 6b01          	ld	(OFST-1,sp),a
3714                     ; 1161   switch (regindex)
3716  0008 7b01          	ld	a,(OFST-1,sp)
3718                     ; 1178     default:
3718                     ; 1179       break;
3719  000a 4a            	dec	a
3720  000b 2708          	jreq	L1761
3721  000d 4a            	dec	a
3722  000e 270d          	jreq	L3761
3723  0010 4a            	dec	a
3724  0011 2712          	jreq	L5761
3725  0013 2016          	jra	L7202
3726  0015               L1761:
3727                     ; 1164     case 0x01:
3727                     ; 1165       tempreg = (uint8_t)I2Cx->SR1;
3729  0015 1e03          	ldw	x,(OFST+1,sp)
3730  0017 e607          	ld	a,(7,x)
3731  0019 6b02          	ld	(OFST+0,sp),a
3732                     ; 1166       break;
3734  001b 200e          	jra	L7202
3735  001d               L3761:
3736                     ; 1169     case 0x02:
3736                     ; 1170       tempreg = (uint8_t)I2Cx->SR2;
3738  001d 1e03          	ldw	x,(OFST+1,sp)
3739  001f e608          	ld	a,(8,x)
3740  0021 6b02          	ld	(OFST+0,sp),a
3741                     ; 1171       break;
3743  0023 2006          	jra	L7202
3744  0025               L5761:
3745                     ; 1174     case 0x03:
3745                     ; 1175       tempreg = (uint8_t)I2Cx->SR3;
3747  0025 1e03          	ldw	x,(OFST+1,sp)
3748  0027 e609          	ld	a,(9,x)
3749  0029 6b02          	ld	(OFST+0,sp),a
3750                     ; 1176       break;
3752  002b               L7761:
3753                     ; 1178     default:
3753                     ; 1179       break;
3755  002b               L7202:
3756                     ; 1183   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3758  002b 7b08          	ld	a,(OFST+6,sp)
3759  002d 1502          	bcp	a,(OFST+0,sp)
3760  002f 2706          	jreq	L1302
3761                     ; 1186     bitstatus = SET;
3763  0031 a601          	ld	a,#1
3764  0033 6b02          	ld	(OFST+0,sp),a
3766  0035 2002          	jra	L3302
3767  0037               L1302:
3768                     ; 1191     bitstatus = RESET;
3770  0037 0f02          	clr	(OFST+0,sp)
3771  0039               L3302:
3772                     ; 1194   return bitstatus;
3774  0039 7b02          	ld	a,(OFST+0,sp)
3777  003b 5b04          	addw	sp,#4
3778  003d 81            	ret
3832                     ; 1226 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3832                     ; 1227 {
3833                     .text:	section	.text,new
3834  0000               _I2C_ClearFlag:
3836  0000 89            	pushw	x
3837  0001 89            	pushw	x
3838       00000002      OFST:	set	2
3841                     ; 1228   uint16_t flagpos = 0;
3843                     ; 1230   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3845                     ; 1233   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3847  0002 7b07          	ld	a,(OFST+5,sp)
3848  0004 97            	ld	xl,a
3849  0005 7b08          	ld	a,(OFST+6,sp)
3850  0007 a4ff          	and	a,#255
3851  0009 5f            	clrw	x
3852  000a 02            	rlwa	x,a
3853  000b 1f01          	ldw	(OFST-1,sp),x
3854  000d 01            	rrwa	x,a
3855                     ; 1235   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3857  000e 7b02          	ld	a,(OFST+0,sp)
3858  0010 43            	cpl	a
3859  0011 1e03          	ldw	x,(OFST+1,sp)
3860  0013 e708          	ld	(8,x),a
3861                     ; 1236 }
3864  0015 5b04          	addw	sp,#4
3865  0017 81            	ret
3939                     ; 1261 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
3939                     ; 1262 {
3940                     .text:	section	.text,new
3941  0000               _I2C_GetITStatus:
3943  0000 89            	pushw	x
3944  0001 5204          	subw	sp,#4
3945       00000004      OFST:	set	4
3948                     ; 1263   ITStatus bitstatus = RESET;
3950                     ; 1264   __IO uint8_t enablestatus = 0;
3952  0003 0f03          	clr	(OFST-1,sp)
3953                     ; 1265   uint16_t tempregister = 0;
3955                     ; 1268   assert_param(IS_I2C_GET_IT(I2C_IT));
3957                     ; 1270   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
3959  0005 7b09          	ld	a,(OFST+5,sp)
3960  0007 a407          	and	a,#7
3961  0009 5f            	clrw	x
3962  000a 97            	ld	xl,a
3963  000b 1f01          	ldw	(OFST-3,sp),x
3964                     ; 1273   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
3966  000d 1e05          	ldw	x,(OFST+1,sp)
3967  000f e60a          	ld	a,(10,x)
3968  0011 1402          	and	a,(OFST-2,sp)
3969  0013 6b03          	ld	(OFST-1,sp),a
3970                     ; 1275   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
3972  0015 7b09          	ld	a,(OFST+5,sp)
3973  0017 97            	ld	xl,a
3974  0018 7b0a          	ld	a,(OFST+6,sp)
3975  001a 9f            	ld	a,xl
3976  001b a430          	and	a,#48
3977  001d 97            	ld	xl,a
3978  001e 4f            	clr	a
3979  001f 02            	rlwa	x,a
3980  0020 a30100        	cpw	x,#256
3981  0023 2616          	jrne	L1212
3982                     ; 1278     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
3984  0025 1e05          	ldw	x,(OFST+1,sp)
3985  0027 e607          	ld	a,(7,x)
3986  0029 150a          	bcp	a,(OFST+6,sp)
3987  002b 270a          	jreq	L3212
3989  002d 0d03          	tnz	(OFST-1,sp)
3990  002f 2706          	jreq	L3212
3991                     ; 1281       bitstatus = SET;
3993  0031 a601          	ld	a,#1
3994  0033 6b04          	ld	(OFST+0,sp),a
3996  0035 2018          	jra	L7212
3997  0037               L3212:
3998                     ; 1286       bitstatus = RESET;
4000  0037 0f04          	clr	(OFST+0,sp)
4001  0039 2014          	jra	L7212
4002  003b               L1212:
4003                     ; 1292     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
4005  003b 1e05          	ldw	x,(OFST+1,sp)
4006  003d e608          	ld	a,(8,x)
4007  003f 150a          	bcp	a,(OFST+6,sp)
4008  0041 270a          	jreq	L1312
4010  0043 0d03          	tnz	(OFST-1,sp)
4011  0045 2706          	jreq	L1312
4012                     ; 1295       bitstatus = SET;
4014  0047 a601          	ld	a,#1
4015  0049 6b04          	ld	(OFST+0,sp),a
4017  004b 2002          	jra	L7212
4018  004d               L1312:
4019                     ; 1300       bitstatus = RESET;
4021  004d 0f04          	clr	(OFST+0,sp)
4022  004f               L7212:
4023                     ; 1304   return  bitstatus;
4025  004f 7b04          	ld	a,(OFST+0,sp)
4028  0051 5b06          	addw	sp,#6
4029  0053 81            	ret
4084                     ; 1337 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4084                     ; 1338 {
4085                     .text:	section	.text,new
4086  0000               _I2C_ClearITPendingBit:
4088  0000 89            	pushw	x
4089  0001 89            	pushw	x
4090       00000002      OFST:	set	2
4093                     ; 1339   uint16_t flagpos = 0;
4095                     ; 1342   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
4097                     ; 1345   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
4099  0002 7b07          	ld	a,(OFST+5,sp)
4100  0004 97            	ld	xl,a
4101  0005 7b08          	ld	a,(OFST+6,sp)
4102  0007 a4ff          	and	a,#255
4103  0009 5f            	clrw	x
4104  000a 02            	rlwa	x,a
4105  000b 1f01          	ldw	(OFST-1,sp),x
4106  000d 01            	rrwa	x,a
4107                     ; 1348   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
4109  000e 7b02          	ld	a,(OFST+0,sp)
4110  0010 43            	cpl	a
4111  0011 1e03          	ldw	x,(OFST+1,sp)
4112  0013 e708          	ld	(8,x),a
4113                     ; 1349 }
4116  0015 5b04          	addw	sp,#4
4117  0017 81            	ret
4130                     	xdef	_I2C_ClearITPendingBit
4131                     	xdef	_I2C_GetITStatus
4132                     	xdef	_I2C_ClearFlag
4133                     	xdef	_I2C_GetFlagStatus
4134                     	xdef	_I2C_GetLastEvent
4135                     	xdef	_I2C_CheckEvent
4136                     	xdef	_I2C_ReadRegister
4137                     	xdef	_I2C_ITConfig
4138                     	xdef	_I2C_DMALastTransferCmd
4139                     	xdef	_I2C_DMACmd
4140                     	xdef	_I2C_CalculatePEC
4141                     	xdef	_I2C_TransmitPEC
4142                     	xdef	_I2C_GetPEC
4143                     	xdef	_I2C_PECPositionConfig
4144                     	xdef	_I2C_ReceiveData
4145                     	xdef	_I2C_SendData
4146                     	xdef	_I2C_Send7bitAddress
4147                     	xdef	_I2C_SMBusAlertConfig
4148                     	xdef	_I2C_FastModeDutyCycleConfig
4149                     	xdef	_I2C_AckPositionConfig
4150                     	xdef	_I2C_DualAddressCmd
4151                     	xdef	_I2C_OwnAddress2Config
4152                     	xdef	_I2C_AcknowledgeConfig
4153                     	xdef	_I2C_GenerateSTOP
4154                     	xdef	_I2C_GenerateSTART
4155                     	xdef	_I2C_ARPCmd
4156                     	xdef	_I2C_StretchClockCmd
4157                     	xdef	_I2C_SoftwareResetCmd
4158                     	xdef	_I2C_GeneralCallCmd
4159                     	xdef	_I2C_Cmd
4160                     	xdef	_I2C_Init
4161                     	xdef	_I2C_DeInit
4162                     	xref	_CLK_GetClockFreq
4163                     	xref.b	c_lreg
4164                     	xref.b	c_x
4183                     	xref	c_uitol
4184                     	xref	c_sdivx
4185                     	xref	c_lzmp
4186                     	xref	c_rtol
4187                     	xref	c_smul
4188                     	xref	c_lmul
4189                     	xref	c_lcmp
4190                     	xref	c_ltor
4191                     	xref	c_ludv
4192                     	end
