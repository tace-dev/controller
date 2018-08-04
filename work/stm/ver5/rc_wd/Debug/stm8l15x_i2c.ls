   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 205                     ; 138 void I2C_DeInit(I2C_TypeDef* I2Cx)
 205                     ; 139 {
 207                     	switch	.text
 208  0000               _I2C_DeInit:
 212                     ; 140   I2Cx->CR1 = I2C_CR1_RESET_VALUE;
 214  0000 7f            	clr	(x)
 215                     ; 141   I2Cx->CR2 = I2C_CR2_RESET_VALUE;
 217  0001 6f01          	clr	(1,x)
 218                     ; 142   I2Cx->FREQR = I2C_FREQR_RESET_VALUE;
 220  0003 6f02          	clr	(2,x)
 221                     ; 143   I2Cx->OARL = I2C_OARL_RESET_VALUE;
 223  0005 6f03          	clr	(3,x)
 224                     ; 144   I2Cx->OARH = I2C_OARH_RESET_VALUE;
 226  0007 6f04          	clr	(4,x)
 227                     ; 145   I2Cx->OAR2 = I2C_OAR2_RESET_VALUE;
 229  0009 6f05          	clr	(5,x)
 230                     ; 146   I2Cx->ITR = I2C_ITR_RESET_VALUE;
 232  000b 6f0a          	clr	(10,x)
 233                     ; 147   I2Cx->CCRL = I2C_CCRL_RESET_VALUE;
 235  000d 6f0b          	clr	(11,x)
 236                     ; 148   I2Cx->CCRH = I2C_CCRH_RESET_VALUE;
 238  000f 6f0c          	clr	(12,x)
 239                     ; 149   I2Cx->TRISER = I2C_TRISER_RESET_VALUE;
 241  0011 a602          	ld	a,#2
 242  0013 e70d          	ld	(13,x),a
 243                     ; 150 }
 246  0015 81            	ret	
 458                     .const:	section	.text
 459  0000               L21:
 460  0000 000f4240      	dc.l	1000000
 461  0004               L41:
 462  0004 000186a1      	dc.l	100001
 463  0008               L61:
 464  0008 00000004      	dc.l	4
 465                     ; 181 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 465                     ; 182               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 465                     ; 183               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 465                     ; 184 {
 466                     	switch	.text
 467  0016               _I2C_Init:
 469  0016 89            	pushw	x
 470  0017 520c          	subw	sp,#12
 471       0000000c      OFST:	set	12
 474                     ; 185   uint32_t result = 0x0004;
 476                     ; 186   uint16_t tmpval = 0;
 478                     ; 187   uint8_t tmpccrh = 0;
 480  0019 0f07          	clr	(OFST-5,sp)
 481                     ; 188   uint8_t input_clock = 0;
 483                     ; 191   assert_param(IS_I2C_MODE(I2C_Mode));
 485                     ; 192   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 487                     ; 193   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 489                     ; 194   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 491                     ; 195   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 493                     ; 196   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 495                     ; 200   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 497  001b cd0000        	call	_CLK_GetClockFreq
 499  001e ae0000        	ldw	x,#L21
 500  0021 cd0000        	call	c_ludv
 502  0024 b603          	ld	a,c_lreg+3
 503  0026 6b08          	ld	(OFST-4,sp),a
 504                     ; 204   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 506  0028 1e0d          	ldw	x,(OFST+1,sp)
 507  002a e602          	ld	a,(2,x)
 508  002c a4c0          	and	a,#192
 509  002e e702          	ld	(2,x),a
 510                     ; 206   I2Cx->FREQR |= input_clock;
 512  0030 e602          	ld	a,(2,x)
 513  0032 1a08          	or	a,(OFST-4,sp)
 514  0034 e702          	ld	(2,x),a
 515                     ; 210   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 517  0036 f6            	ld	a,(x)
 518  0037 a4fe          	and	a,#254
 519  0039 f7            	ld	(x),a
 520                     ; 213   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 522  003a e60c          	ld	a,(12,x)
 523  003c a430          	and	a,#48
 524  003e e70c          	ld	(12,x),a
 525                     ; 214   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 527  0040 6f0b          	clr	(11,x)
 528                     ; 217   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 530  0042 96            	ldw	x,sp
 531  0043 1c0011        	addw	x,#OFST+5
 532  0046 cd0000        	call	c_ltor
 534  0049 ae0004        	ldw	x,#L41
 535  004c cd0000        	call	c_lcmp
 537  004f 2576          	jrult	L742
 538                     ; 220     tmpccrh = I2C_CCRH_FS;
 540  0051 a680          	ld	a,#128
 541  0053 6b07          	ld	(OFST-5,sp),a
 542                     ; 222     if (I2C_DutyCycle == I2C_DutyCycle_2)
 544  0055 96            	ldw	x,sp
 545  0056 0d18          	tnz	(OFST+12,sp)
 546  0058 2623          	jrne	L152
 547                     ; 225       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 549  005a 1c0011        	addw	x,#OFST+5
 550  005d cd0000        	call	c_ltor
 552  0060 a603          	ld	a,#3
 553  0062 cd0000        	call	c_smul
 555  0065 96            	ldw	x,sp
 556  0066 5c            	incw	x
 557  0067 cd0000        	call	c_rtol
 559  006a 7b08          	ld	a,(OFST-4,sp)
 560  006c cd0141        	call	LC001
 562  006f 96            	ldw	x,sp
 563  0070 5c            	incw	x
 564  0071 cd0000        	call	c_ludv
 566  0074 96            	ldw	x,sp
 567  0075 1c0009        	addw	x,#OFST-3
 568  0078 cd0000        	call	c_rtol
 571  007b 2027          	jra	L352
 572  007d               L152:
 573                     ; 230       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 575  007d 1c0011        	addw	x,#OFST+5
 576  0080 cd0000        	call	c_ltor
 578  0083 a619          	ld	a,#25
 579  0085 cd0000        	call	c_smul
 581  0088 96            	ldw	x,sp
 582  0089 5c            	incw	x
 583  008a cd0000        	call	c_rtol
 585  008d 7b08          	ld	a,(OFST-4,sp)
 586  008f cd0141        	call	LC001
 588  0092 96            	ldw	x,sp
 589  0093 5c            	incw	x
 590  0094 cd0000        	call	c_ludv
 592  0097 96            	ldw	x,sp
 593  0098 1c0009        	addw	x,#OFST-3
 594  009b cd0000        	call	c_rtol
 596                     ; 232       tmpccrh |= I2C_CCRH_DUTY;
 598  009e 7b07          	ld	a,(OFST-5,sp)
 599  00a0 aa40          	or	a,#64
 600  00a2 6b07          	ld	(OFST-5,sp),a
 601  00a4               L352:
 602                     ; 236     if (result < (uint16_t)0x01)
 604  00a4 96            	ldw	x,sp
 605  00a5 1c0009        	addw	x,#OFST-3
 606  00a8 cd0000        	call	c_lzmp
 608  00ab 2608          	jrne	L552
 609                     ; 239       result = (uint16_t)0x0001;
 611  00ad ae0001        	ldw	x,#1
 612  00b0 1f0b          	ldw	(OFST-1,sp),x
 613  00b2 5f            	clrw	x
 614  00b3 1f09          	ldw	(OFST-3,sp),x
 615  00b5               L552:
 616                     ; 245     tmpval = ((input_clock * 3) / 10) + 1;
 618  00b5 7b08          	ld	a,(OFST-4,sp)
 619  00b7 97            	ld	xl,a
 620  00b8 a603          	ld	a,#3
 621  00ba 42            	mul	x,a
 622  00bb a60a          	ld	a,#10
 623  00bd cd0000        	call	c_sdivx
 625  00c0 5c            	incw	x
 626  00c1 1f05          	ldw	(OFST-7,sp),x
 627                     ; 246     I2Cx->TRISER = (uint8_t)tmpval;
 629  00c3 7b06          	ld	a,(OFST-6,sp)
 631  00c5 2046          	jra	L752
 632  00c7               L742:
 633                     ; 253     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 635  00c7 96            	ldw	x,sp
 636  00c8 1c0011        	addw	x,#OFST+5
 637  00cb cd0000        	call	c_ltor
 639  00ce 3803          	sll	c_lreg+3
 640  00d0 3902          	rlc	c_lreg+2
 641  00d2 3901          	rlc	c_lreg+1
 642  00d4 96            	ldw	x,sp
 643  00d5 3900          	rlc	c_lreg
 644  00d7 5c            	incw	x
 645  00d8 cd0000        	call	c_rtol
 647  00db 7b08          	ld	a,(OFST-4,sp)
 648  00dd ad62          	call	LC001
 650  00df 96            	ldw	x,sp
 651  00e0 5c            	incw	x
 652  00e1 cd0000        	call	c_ludv
 654  00e4 b602          	ld	a,c_lreg+2
 655  00e6 97            	ld	xl,a
 656  00e7 b603          	ld	a,c_lreg+3
 657  00e9 cd0000        	call	c_uitol
 659  00ec 96            	ldw	x,sp
 660  00ed 1c0009        	addw	x,#OFST-3
 661  00f0 cd0000        	call	c_rtol
 663                     ; 256     if (result < (uint16_t)0x0004)
 665  00f3 96            	ldw	x,sp
 666  00f4 1c0009        	addw	x,#OFST-3
 667  00f7 cd0000        	call	c_ltor
 669  00fa ae0008        	ldw	x,#L61
 670  00fd cd0000        	call	c_lcmp
 672  0100 2408          	jruge	L162
 673                     ; 259       result = (uint16_t)0x0004;
 675  0102 ae0004        	ldw	x,#4
 676  0105 1f0b          	ldw	(OFST-1,sp),x
 677  0107 5f            	clrw	x
 678  0108 1f09          	ldw	(OFST-3,sp),x
 679  010a               L162:
 680                     ; 265     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 682  010a 7b08          	ld	a,(OFST-4,sp)
 683  010c 4c            	inc	a
 684  010d               L752:
 685  010d 1e0d          	ldw	x,(OFST+1,sp)
 686  010f e70d          	ld	(13,x),a
 687                     ; 270   I2Cx->CCRL = (uint8_t)result;
 689  0111 7b0c          	ld	a,(OFST+0,sp)
 690  0113 e70b          	ld	(11,x),a
 691                     ; 271   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 693  0115 7b07          	ld	a,(OFST-5,sp)
 694  0117 e70c          	ld	(12,x),a
 695                     ; 274   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 697  0119 7b17          	ld	a,(OFST+11,sp)
 698  011b aa01          	or	a,#1
 699  011d fa            	or	a,(x)
 700  011e f7            	ld	(x),a
 701                     ; 277   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 703  011f e601          	ld	a,(1,x)
 704  0121 1a19          	or	a,(OFST+13,sp)
 705  0123 e701          	ld	(1,x),a
 706                     ; 280   I2Cx->OARL = (uint8_t)(OwnAddress);
 708  0125 7b16          	ld	a,(OFST+10,sp)
 709  0127 e703          	ld	(3,x),a
 710                     ; 281   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 710                     ; 282                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 712  0129 1e15          	ldw	x,(OFST+9,sp)
 713  012b 4f            	clr	a
 714  012c 01            	rrwa	x,a
 715  012d 48            	sll	a
 716  012e 01            	rrwa	x,a
 717  012f 49            	rlc	a
 718  0130 a406          	and	a,#6
 719  0132 6b04          	ld	(OFST-8,sp),a
 720  0134 7b1a          	ld	a,(OFST+14,sp)
 721  0136 aa40          	or	a,#64
 722  0138 1a04          	or	a,(OFST-8,sp)
 723  013a 1e0d          	ldw	x,(OFST+1,sp)
 724  013c e704          	ld	(4,x),a
 725                     ; 283 }
 728  013e 5b0e          	addw	sp,#14
 729  0140 81            	ret	
 730  0141               LC001:
 731  0141 b703          	ld	c_lreg+3,a
 732  0143 3f02          	clr	c_lreg+2
 733  0145 3f01          	clr	c_lreg+1
 734  0147 3f00          	clr	c_lreg
 735  0149 ae0000        	ldw	x,#L21
 736  014c cc0000        	jp	c_lmul
 803                     ; 292 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 803                     ; 293 {
 804                     	switch	.text
 805  014f               _I2C_Cmd:
 807  014f 89            	pushw	x
 808       00000000      OFST:	set	0
 811                     ; 296   assert_param(IS_FUNCTIONAL_STATE(NewState));
 813                     ; 298   if (NewState != DISABLE)
 815  0150 7b05          	ld	a,(OFST+5,sp)
 816  0152 2705          	jreq	L713
 817                     ; 301     I2Cx->CR1 |= I2C_CR1_PE;
 819  0154 f6            	ld	a,(x)
 820  0155 aa01          	or	a,#1
 822  0157 2005          	jra	L123
 823  0159               L713:
 824                     ; 306     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 826  0159 1e01          	ldw	x,(OFST+1,sp)
 827  015b f6            	ld	a,(x)
 828  015c a4fe          	and	a,#254
 829  015e               L123:
 830  015e f7            	ld	(x),a
 831                     ; 308 }
 834  015f 85            	popw	x
 835  0160 81            	ret	
 882                     ; 317 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 882                     ; 318 {
 883                     	switch	.text
 884  0161               _I2C_GeneralCallCmd:
 886  0161 89            	pushw	x
 887       00000000      OFST:	set	0
 890                     ; 321   assert_param(IS_FUNCTIONAL_STATE(NewState));
 892                     ; 323   if (NewState != DISABLE)
 894  0162 7b05          	ld	a,(OFST+5,sp)
 895  0164 2705          	jreq	L743
 896                     ; 326     I2Cx->CR1 |= I2C_CR1_ENGC;
 898  0166 f6            	ld	a,(x)
 899  0167 aa40          	or	a,#64
 901  0169 2005          	jra	L153
 902  016b               L743:
 903                     ; 331     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 905  016b 1e01          	ldw	x,(OFST+1,sp)
 906  016d f6            	ld	a,(x)
 907  016e a4bf          	and	a,#191
 908  0170               L153:
 909  0170 f7            	ld	(x),a
 910                     ; 333 }
 913  0171 85            	popw	x
 914  0172 81            	ret	
 961                     ; 344 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
 961                     ; 345 {
 962                     	switch	.text
 963  0173               _I2C_GenerateSTART:
 965  0173 89            	pushw	x
 966       00000000      OFST:	set	0
 969                     ; 348   assert_param(IS_FUNCTIONAL_STATE(NewState));
 971                     ; 350   if (NewState != DISABLE)
 973  0174 7b05          	ld	a,(OFST+5,sp)
 974  0176 2706          	jreq	L773
 975                     ; 353     I2Cx->CR2 |= I2C_CR2_START;
 977  0178 e601          	ld	a,(1,x)
 978  017a aa01          	or	a,#1
 980  017c 2006          	jra	L104
 981  017e               L773:
 982                     ; 358     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
 984  017e 1e01          	ldw	x,(OFST+1,sp)
 985  0180 e601          	ld	a,(1,x)
 986  0182 a4fe          	and	a,#254
 987  0184               L104:
 988  0184 e701          	ld	(1,x),a
 989                     ; 360 }
 992  0186 85            	popw	x
 993  0187 81            	ret	
1040                     ; 369 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1040                     ; 370 {
1041                     	switch	.text
1042  0188               _I2C_GenerateSTOP:
1044  0188 89            	pushw	x
1045       00000000      OFST:	set	0
1048                     ; 373   assert_param(IS_FUNCTIONAL_STATE(NewState));
1050                     ; 375   if (NewState != DISABLE)
1052  0189 7b05          	ld	a,(OFST+5,sp)
1053  018b 2706          	jreq	L724
1054                     ; 378     I2Cx->CR2 |= I2C_CR2_STOP;
1056  018d e601          	ld	a,(1,x)
1057  018f aa02          	or	a,#2
1059  0191 2006          	jra	L134
1060  0193               L724:
1061                     ; 383     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1063  0193 1e01          	ldw	x,(OFST+1,sp)
1064  0195 e601          	ld	a,(1,x)
1065  0197 a4fd          	and	a,#253
1066  0199               L134:
1067  0199 e701          	ld	(1,x),a
1068                     ; 385 }
1071  019b 85            	popw	x
1072  019c 81            	ret	
1120                     ; 394 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1120                     ; 395 {
1121                     	switch	.text
1122  019d               _I2C_SoftwareResetCmd:
1124  019d 89            	pushw	x
1125       00000000      OFST:	set	0
1128                     ; 397   assert_param(IS_FUNCTIONAL_STATE(NewState));
1130                     ; 399   if (NewState != DISABLE)
1132  019e 7b05          	ld	a,(OFST+5,sp)
1133  01a0 2706          	jreq	L754
1134                     ; 402     I2Cx->CR2 |= I2C_CR2_SWRST;
1136  01a2 e601          	ld	a,(1,x)
1137  01a4 aa80          	or	a,#128
1139  01a6 2006          	jra	L164
1140  01a8               L754:
1141                     ; 407     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1143  01a8 1e01          	ldw	x,(OFST+1,sp)
1144  01aa e601          	ld	a,(1,x)
1145  01ac a47f          	and	a,#127
1146  01ae               L164:
1147  01ae e701          	ld	(1,x),a
1148                     ; 409 }
1151  01b0 85            	popw	x
1152  01b1 81            	ret	
1200                     ; 418 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1200                     ; 419 {
1201                     	switch	.text
1202  01b2               _I2C_StretchClockCmd:
1204  01b2 89            	pushw	x
1205       00000000      OFST:	set	0
1208                     ; 421   assert_param(IS_FUNCTIONAL_STATE(NewState));
1210                     ; 423   if (NewState != DISABLE)
1212  01b3 7b05          	ld	a,(OFST+5,sp)
1213  01b5 2705          	jreq	L705
1214                     ; 426     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1216  01b7 f6            	ld	a,(x)
1217  01b8 a47f          	and	a,#127
1219  01ba 2005          	jra	L115
1220  01bc               L705:
1221                     ; 432     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1223  01bc 1e01          	ldw	x,(OFST+1,sp)
1224  01be f6            	ld	a,(x)
1225  01bf aa80          	or	a,#128
1226  01c1               L115:
1227  01c1 f7            	ld	(x),a
1228                     ; 434 }
1231  01c2 85            	popw	x
1232  01c3 81            	ret	
1279                     ; 443 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1279                     ; 444 {
1280                     	switch	.text
1281  01c4               _I2C_ARPCmd:
1283  01c4 89            	pushw	x
1284       00000000      OFST:	set	0
1287                     ; 446   assert_param(IS_FUNCTIONAL_STATE(NewState));
1289                     ; 448   if (NewState != DISABLE)
1291  01c5 7b05          	ld	a,(OFST+5,sp)
1292  01c7 2705          	jreq	L735
1293                     ; 451     I2Cx->CR1 |= I2C_CR1_ARP;
1295  01c9 f6            	ld	a,(x)
1296  01ca aa10          	or	a,#16
1298  01cc 2005          	jra	L145
1299  01ce               L735:
1300                     ; 457     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1302  01ce 1e01          	ldw	x,(OFST+1,sp)
1303  01d0 f6            	ld	a,(x)
1304  01d1 a4ef          	and	a,#239
1305  01d3               L145:
1306  01d3 f7            	ld	(x),a
1307                     ; 459 }
1310  01d4 85            	popw	x
1311  01d5 81            	ret	
1359                     ; 468 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1359                     ; 469 {
1360                     	switch	.text
1361  01d6               _I2C_AcknowledgeConfig:
1363  01d6 89            	pushw	x
1364       00000000      OFST:	set	0
1367                     ; 471   assert_param(IS_FUNCTIONAL_STATE(NewState));
1369                     ; 473   if (NewState != DISABLE)
1371  01d7 7b05          	ld	a,(OFST+5,sp)
1372  01d9 2706          	jreq	L765
1373                     ; 476     I2Cx->CR2 |= I2C_CR2_ACK;
1375  01db e601          	ld	a,(1,x)
1376  01dd aa04          	or	a,#4
1378  01df 2006          	jra	L175
1379  01e1               L765:
1380                     ; 481     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1382  01e1 1e01          	ldw	x,(OFST+1,sp)
1383  01e3 e601          	ld	a,(1,x)
1384  01e5 a4fb          	and	a,#251
1385  01e7               L175:
1386  01e7 e701          	ld	(1,x),a
1387                     ; 483 }
1390  01e9 85            	popw	x
1391  01ea 81            	ret	
1443                     ; 491 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1443                     ; 492 {
1444                     	switch	.text
1445  01eb               _I2C_OwnAddress2Config:
1447  01eb 89            	pushw	x
1448  01ec 88            	push	a
1449       00000001      OFST:	set	1
1452                     ; 493   uint8_t tmpreg = 0;
1454                     ; 496   tmpreg = I2Cx->OAR2;
1456  01ed e605          	ld	a,(5,x)
1457                     ; 499   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1459  01ef a401          	and	a,#1
1460  01f1 6b01          	ld	(OFST+0,sp),a
1461                     ; 502   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1463  01f3 7b06          	ld	a,(OFST+5,sp)
1464  01f5 a4fe          	and	a,#254
1465  01f7 1a01          	or	a,(OFST+0,sp)
1466  01f9 6b01          	ld	(OFST+0,sp),a
1467                     ; 505   I2Cx->OAR2 = tmpreg;
1469  01fb 1e02          	ldw	x,(OFST+1,sp)
1470  01fd e705          	ld	(5,x),a
1471                     ; 506 }
1474  01ff 5b03          	addw	sp,#3
1475  0201 81            	ret	
1522                     ; 515 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1522                     ; 516 {
1523                     	switch	.text
1524  0202               _I2C_DualAddressCmd:
1526  0202 89            	pushw	x
1527       00000000      OFST:	set	0
1530                     ; 518   assert_param(IS_FUNCTIONAL_STATE(NewState));
1532                     ; 520   if (NewState != DISABLE)
1534  0203 7b05          	ld	a,(OFST+5,sp)
1535  0205 2706          	jreq	L346
1536                     ; 523     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1538  0207 e605          	ld	a,(5,x)
1539  0209 aa01          	or	a,#1
1541  020b 2006          	jra	L546
1542  020d               L346:
1543                     ; 528     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1545  020d 1e01          	ldw	x,(OFST+1,sp)
1546  020f e605          	ld	a,(5,x)
1547  0211 a4fe          	and	a,#254
1548  0213               L546:
1549  0213 e705          	ld	(5,x),a
1550                     ; 530 }
1553  0215 85            	popw	x
1554  0216 81            	ret	
1624                     ; 542 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
1624                     ; 543 {
1625                     	switch	.text
1626  0217               _I2C_AckPositionConfig:
1628  0217 89            	pushw	x
1629       00000000      OFST:	set	0
1632                     ; 545   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1634                     ; 548   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
1636  0218 e601          	ld	a,(1,x)
1637  021a a4f7          	and	a,#247
1638  021c e701          	ld	(1,x),a
1639                     ; 550   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
1641  021e e601          	ld	a,(1,x)
1642  0220 1a05          	or	a,(OFST+5,sp)
1643  0222 e701          	ld	(1,x),a
1644                     ; 551 }
1647  0224 85            	popw	x
1648  0225 81            	ret	
1717                     ; 562 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
1717                     ; 563 {
1718                     	switch	.text
1719  0226               _I2C_SMBusAlertConfig:
1721  0226 89            	pushw	x
1722       00000000      OFST:	set	0
1725                     ; 566   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
1727                     ; 568   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
1729  0227 7b05          	ld	a,(OFST+5,sp)
1730  0229 2706          	jreq	L737
1731                     ; 571     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
1733  022b e601          	ld	a,(1,x)
1734  022d aa20          	or	a,#32
1736  022f 2006          	jra	L147
1737  0231               L737:
1738                     ; 576     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
1740  0231 1e01          	ldw	x,(OFST+1,sp)
1741  0233 e601          	ld	a,(1,x)
1742  0235 a4df          	and	a,#223
1743  0237               L147:
1744  0237 e701          	ld	(1,x),a
1745                     ; 578 }
1748  0239 85            	popw	x
1749  023a 81            	ret	
1797                     ; 589 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
1797                     ; 590 {
1798                     	switch	.text
1799  023b               _I2C_FastModeDutyCycleConfig:
1801  023b 89            	pushw	x
1802       00000000      OFST:	set	0
1805                     ; 593   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1807                     ; 595   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1809  023c 7b05          	ld	a,(OFST+5,sp)
1810  023e a140          	cp	a,#64
1811  0240 2606          	jrne	L767
1812                     ; 598     I2Cx->CCRH |= I2C_CCRH_DUTY;
1814  0242 e60c          	ld	a,(12,x)
1815  0244 aa40          	or	a,#64
1817  0246 2006          	jra	L177
1818  0248               L767:
1819                     ; 603     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1821  0248 1e01          	ldw	x,(OFST+1,sp)
1822  024a e60c          	ld	a,(12,x)
1823  024c a4bf          	and	a,#191
1824  024e               L177:
1825  024e e70c          	ld	(12,x),a
1826                     ; 605 }
1829  0250 85            	popw	x
1830  0251 81            	ret	
1907                     ; 618 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1907                     ; 619 {
1908                     	switch	.text
1909  0252               _I2C_Send7bitAddress:
1911  0252 89            	pushw	x
1912       00000000      OFST:	set	0
1915                     ; 621   assert_param(IS_I2C_ADDRESS(Address));
1917                     ; 622   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1919                     ; 625   if (I2C_Direction != I2C_Direction_Transmitter)
1921  0253 7b06          	ld	a,(OFST+6,sp)
1922  0255 2706          	jreq	L1301
1923                     ; 628     Address |= OAR1_ADD0_Set;
1925  0257 7b05          	ld	a,(OFST+5,sp)
1926  0259 aa01          	or	a,#1
1928  025b 2004          	jra	L3301
1929  025d               L1301:
1930                     ; 633     Address &= OAR1_ADD0_Reset;
1932  025d 7b05          	ld	a,(OFST+5,sp)
1933  025f a4fe          	and	a,#254
1934  0261               L3301:
1935  0261 6b05          	ld	(OFST+5,sp),a
1936                     ; 636   I2Cx->DR = Address;
1938  0263 1e01          	ldw	x,(OFST+1,sp)
1939  0265 e706          	ld	(6,x),a
1940                     ; 637 }
1943  0267 85            	popw	x
1944  0268 81            	ret	
1988                     ; 661 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
1988                     ; 662 {
1989                     	switch	.text
1990  0269               _I2C_SendData:
1992  0269 89            	pushw	x
1993       00000000      OFST:	set	0
1996                     ; 664   I2Cx->DR = Data;
1998  026a 7b05          	ld	a,(OFST+5,sp)
1999  026c 1e01          	ldw	x,(OFST+1,sp)
2000  026e e706          	ld	(6,x),a
2001                     ; 665 }
2004  0270 85            	popw	x
2005  0271 81            	ret	
2042                     ; 673 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2042                     ; 674 {
2043                     	switch	.text
2044  0272               _I2C_ReceiveData:
2048                     ; 676   return ((uint8_t)I2Cx->DR);
2050  0272 e606          	ld	a,(6,x)
2053  0274 81            	ret	
2100                     ; 702 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2100                     ; 703 {
2101                     	switch	.text
2102  0275               _I2C_TransmitPEC:
2104  0275 89            	pushw	x
2105       00000000      OFST:	set	0
2108                     ; 705   assert_param(IS_FUNCTIONAL_STATE(NewState));
2110                     ; 707   if (NewState != DISABLE)
2112  0276 7b05          	ld	a,(OFST+5,sp)
2113  0278 2706          	jreq	L3211
2114                     ; 710     I2Cx->CR2 |= I2C_CR2_PEC;
2116  027a e601          	ld	a,(1,x)
2117  027c aa10          	or	a,#16
2119  027e 2006          	jra	L5211
2120  0280               L3211:
2121                     ; 715     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2123  0280 1e01          	ldw	x,(OFST+1,sp)
2124  0282 e601          	ld	a,(1,x)
2125  0284 a4ef          	and	a,#239
2126  0286               L5211:
2127  0286 e701          	ld	(1,x),a
2128                     ; 717 }
2131  0288 85            	popw	x
2132  0289 81            	ret	
2179                     ; 726 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2179                     ; 727 {
2180                     	switch	.text
2181  028a               _I2C_CalculatePEC:
2183  028a 89            	pushw	x
2184       00000000      OFST:	set	0
2187                     ; 729   assert_param(IS_FUNCTIONAL_STATE(NewState));
2189                     ; 731   if (NewState != DISABLE)
2191  028b 7b05          	ld	a,(OFST+5,sp)
2192  028d 2705          	jreq	L3511
2193                     ; 734     I2Cx->CR1 |= I2C_CR1_ENPEC;
2195  028f f6            	ld	a,(x)
2196  0290 aa20          	or	a,#32
2198  0292 2005          	jra	L5511
2199  0294               L3511:
2200                     ; 739     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2202  0294 1e01          	ldw	x,(OFST+1,sp)
2203  0296 f6            	ld	a,(x)
2204  0297 a4df          	and	a,#223
2205  0299               L5511:
2206  0299 f7            	ld	(x),a
2207                     ; 741 }
2210  029a 85            	popw	x
2211  029b 81            	ret	
2281                     ; 752 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2281                     ; 753 {
2282                     	switch	.text
2283  029c               _I2C_PECPositionConfig:
2285  029c 89            	pushw	x
2286       00000000      OFST:	set	0
2289                     ; 755   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2291                     ; 758   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2293  029d e601          	ld	a,(1,x)
2294  029f a4f7          	and	a,#247
2295  02a1 e701          	ld	(1,x),a
2296                     ; 760   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2298  02a3 e601          	ld	a,(1,x)
2299  02a5 1a05          	or	a,(OFST+5,sp)
2300  02a7 e701          	ld	(1,x),a
2301                     ; 761 }
2304  02a9 85            	popw	x
2305  02aa 81            	ret	
2342                     ; 769 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2342                     ; 770 {
2343                     	switch	.text
2344  02ab               _I2C_GetPEC:
2348                     ; 772   return (I2Cx->PECR);
2350  02ab e60e          	ld	a,(14,x)
2353  02ad 81            	ret	
2400                     ; 800 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2400                     ; 801 {
2401                     	switch	.text
2402  02ae               _I2C_DMACmd:
2404  02ae 89            	pushw	x
2405       00000000      OFST:	set	0
2408                     ; 803   assert_param(IS_FUNCTIONAL_STATE(NewState));
2410                     ; 805   if (NewState != DISABLE)
2412  02af 7b05          	ld	a,(OFST+5,sp)
2413  02b1 2706          	jreq	L7521
2414                     ; 808     I2Cx->ITR |= I2C_ITR_DMAEN;
2416  02b3 e60a          	ld	a,(10,x)
2417  02b5 aa08          	or	a,#8
2419  02b7 2006          	jra	L1621
2420  02b9               L7521:
2421                     ; 813     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
2423  02b9 1e01          	ldw	x,(OFST+1,sp)
2424  02bb e60a          	ld	a,(10,x)
2425  02bd a4f7          	and	a,#247
2426  02bf               L1621:
2427  02bf e70a          	ld	(10,x),a
2428                     ; 815 }
2431  02c1 85            	popw	x
2432  02c2 81            	ret	
2480                     ; 824 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2480                     ; 825 {
2481                     	switch	.text
2482  02c3               _I2C_DMALastTransferCmd:
2484  02c3 89            	pushw	x
2485       00000000      OFST:	set	0
2488                     ; 827   assert_param(IS_FUNCTIONAL_STATE(NewState));
2490                     ; 829   if (NewState != DISABLE)
2492  02c4 7b05          	ld	a,(OFST+5,sp)
2493  02c6 2706          	jreq	L7031
2494                     ; 832     I2Cx->ITR |= I2C_ITR_LAST;
2496  02c8 e60a          	ld	a,(10,x)
2497  02ca aa10          	or	a,#16
2499  02cc 2006          	jra	L1131
2500  02ce               L7031:
2501                     ; 837     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
2503  02ce 1e01          	ldw	x,(OFST+1,sp)
2504  02d0 e60a          	ld	a,(10,x)
2505  02d2 a4ef          	and	a,#239
2506  02d4               L1131:
2507  02d4 e70a          	ld	(10,x),a
2508                     ; 839 }
2511  02d6 85            	popw	x
2512  02d7 81            	ret	
2701                     ; 951 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
2701                     ; 952 {
2702                     	switch	.text
2703  02d8               _I2C_ITConfig:
2705  02d8 89            	pushw	x
2706       00000000      OFST:	set	0
2709                     ; 954   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
2711                     ; 955   assert_param(IS_FUNCTIONAL_STATE(NewState));
2713                     ; 957   if (NewState != DISABLE)
2715  02d9 7b07          	ld	a,(OFST+7,sp)
2716  02db 2706          	jreq	L3141
2717                     ; 960     I2Cx->ITR |= (uint8_t)I2C_IT;
2719  02dd e60a          	ld	a,(10,x)
2720  02df 1a06          	or	a,(OFST+6,sp)
2722  02e1 2007          	jra	L5141
2723  02e3               L3141:
2724                     ; 965     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
2726  02e3 1e01          	ldw	x,(OFST+1,sp)
2727  02e5 7b06          	ld	a,(OFST+6,sp)
2728  02e7 43            	cpl	a
2729  02e8 e40a          	and	a,(10,x)
2730  02ea               L5141:
2731  02ea e70a          	ld	(10,x),a
2732                     ; 967 }
2735  02ec 85            	popw	x
2736  02ed 81            	ret	
2897                     ; 991 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2897                     ; 992 {
2898                     	switch	.text
2899  02ee               _I2C_ReadRegister:
2901  02ee 89            	pushw	x
2902  02ef 5204          	subw	sp,#4
2903       00000004      OFST:	set	4
2906                     ; 993   __IO uint16_t tmp = 0;
2908  02f1 5f            	clrw	x
2909  02f2 1f03          	ldw	(OFST-1,sp),x
2910                     ; 995   assert_param(IS_I2C_REGISTER(I2C_Register));
2912                     ; 997   tmp = (uint16_t) I2Cx;
2914  02f4 1e05          	ldw	x,(OFST+1,sp)
2915  02f6 1f03          	ldw	(OFST-1,sp),x
2916                     ; 998   tmp += I2C_Register;
2918  02f8 7b09          	ld	a,(OFST+5,sp)
2919  02fa 5f            	clrw	x
2920  02fb 97            	ld	xl,a
2921  02fc 1f01          	ldw	(OFST-3,sp),x
2922  02fe 1e03          	ldw	x,(OFST-1,sp)
2923  0300 72fb01        	addw	x,(OFST-3,sp)
2924  0303 1f03          	ldw	(OFST-1,sp),x
2925                     ; 1001   return (*(__IO uint8_t *) tmp);
2927  0305 1e03          	ldw	x,(OFST-1,sp)
2928  0307 f6            	ld	a,(x)
2931  0308 5b06          	addw	sp,#6
2932  030a 81            	ret	
3182                     ; 1041 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3182                     ; 1042 {
3183                     	switch	.text
3184  030b               _I2C_CheckEvent:
3186  030b 89            	pushw	x
3187  030c 5206          	subw	sp,#6
3188       00000006      OFST:	set	6
3191                     ; 1043   __IO uint16_t lastevent = 0x00;
3193  030e 5f            	clrw	x
3194  030f 1f04          	ldw	(OFST-2,sp),x
3195                     ; 1044   uint8_t flag1 = 0x00 ;
3197                     ; 1045   uint8_t flag2 = 0x00;
3199                     ; 1046   ErrorStatus status = ERROR;
3201                     ; 1049   assert_param(IS_I2C_EVENT(I2C_Event));
3203                     ; 1051   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3205  0311 1e0b          	ldw	x,(OFST+5,sp)
3206  0313 a30004        	cpw	x,#4
3207  0316 260a          	jrne	L5261
3208                     ; 1053     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3210  0318 1e07          	ldw	x,(OFST+1,sp)
3211  031a e608          	ld	a,(8,x)
3212  031c a404          	and	a,#4
3213  031e 5f            	clrw	x
3214  031f 97            	ld	xl,a
3216  0320 201a          	jra	L7261
3217  0322               L5261:
3218                     ; 1057     flag1 = I2Cx->SR1;
3220  0322 1e07          	ldw	x,(OFST+1,sp)
3221  0324 e607          	ld	a,(7,x)
3222  0326 6b03          	ld	(OFST-3,sp),a
3223                     ; 1058     flag2 = I2Cx->SR3;
3225  0328 e609          	ld	a,(9,x)
3226  032a 6b06          	ld	(OFST+0,sp),a
3227                     ; 1059     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3229  032c 5f            	clrw	x
3230  032d 7b03          	ld	a,(OFST-3,sp)
3231  032f 97            	ld	xl,a
3232  0330 1f01          	ldw	(OFST-5,sp),x
3233  0332 5f            	clrw	x
3234  0333 7b06          	ld	a,(OFST+0,sp)
3235  0335 97            	ld	xl,a
3236  0336 7b02          	ld	a,(OFST-4,sp)
3237  0338 01            	rrwa	x,a
3238  0339 1a01          	or	a,(OFST-5,sp)
3239  033b 01            	rrwa	x,a
3240  033c               L7261:
3241  033c 1f04          	ldw	(OFST-2,sp),x
3242                     ; 1062   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3244  033e 1e04          	ldw	x,(OFST-2,sp)
3245  0340 01            	rrwa	x,a
3246  0341 140c          	and	a,(OFST+6,sp)
3247  0343 01            	rrwa	x,a
3248  0344 140b          	and	a,(OFST+5,sp)
3249  0346 01            	rrwa	x,a
3250  0347 130b          	cpw	x,(OFST+5,sp)
3251  0349 2604          	jrne	L1361
3252                     ; 1065     status = SUCCESS;
3254  034b a601          	ld	a,#1
3256  034d 2001          	jra	L3361
3257  034f               L1361:
3258                     ; 1070     status = ERROR;
3260  034f 4f            	clr	a
3261  0350               L3361:
3262                     ; 1074   return status;
3266  0350 5b08          	addw	sp,#8
3267  0352 81            	ret	
3328                     ; 1092 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3328                     ; 1093 {
3329                     	switch	.text
3330  0353               _I2C_GetLastEvent:
3332  0353 89            	pushw	x
3333  0354 5206          	subw	sp,#6
3334       00000006      OFST:	set	6
3337                     ; 1094   __IO uint16_t lastevent = 0;
3339  0356 5f            	clrw	x
3340  0357 1f05          	ldw	(OFST-1,sp),x
3341                     ; 1095   uint16_t flag1 = 0;
3343                     ; 1096   uint16_t flag2 = 0;
3345                     ; 1098   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3347  0359 1e07          	ldw	x,(OFST+1,sp)
3348  035b e608          	ld	a,(8,x)
3349  035d a504          	bcp	a,#4
3350  035f 2705          	jreq	L5661
3351                     ; 1100     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3353  0361 ae0004        	ldw	x,#4
3355  0364 2014          	jra	L7661
3356  0366               L5661:
3357                     ; 1105     flag1 = I2Cx->SR1;
3359  0366 e607          	ld	a,(7,x)
3360  0368 5f            	clrw	x
3361  0369 97            	ld	xl,a
3362  036a 1f01          	ldw	(OFST-5,sp),x
3363                     ; 1106     flag2 = I2Cx->SR3;
3365  036c 1e07          	ldw	x,(OFST+1,sp)
3366  036e e609          	ld	a,(9,x)
3367  0370 5f            	clrw	x
3368  0371 97            	ld	xl,a
3369  0372 1f03          	ldw	(OFST-3,sp),x
3370                     ; 1109     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3372  0374 7b02          	ld	a,(OFST-4,sp)
3373  0376 01            	rrwa	x,a
3374  0377 1a01          	or	a,(OFST-5,sp)
3375  0379 01            	rrwa	x,a
3376  037a               L7661:
3377  037a 1f05          	ldw	(OFST-1,sp),x
3378                     ; 1112   return (I2C_Event_TypeDef)lastevent;
3380  037c 1e05          	ldw	x,(OFST-1,sp)
3383  037e 5b08          	addw	sp,#8
3384  0380 81            	ret	
3637                     ; 1149 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3637                     ; 1150 {
3638                     	switch	.text
3639  0381               _I2C_GetFlagStatus:
3641  0381 89            	pushw	x
3642  0382 89            	pushw	x
3643       00000002      OFST:	set	2
3646                     ; 1151   uint8_t tempreg = 0;
3648  0383 0f02          	clr	(OFST+0,sp)
3649                     ; 1152   uint8_t regindex = 0;
3651                     ; 1153   FlagStatus bitstatus = RESET;
3653                     ; 1156   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3655                     ; 1159   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3657  0385 7b07          	ld	a,(OFST+5,sp)
3658  0387 6b01          	ld	(OFST-1,sp),a
3659                     ; 1161   switch (regindex)
3662                     ; 1178     default:
3662                     ; 1179       break;
3663  0389 4a            	dec	a
3664  038a 2708          	jreq	L1761
3665  038c 4a            	dec	a
3666  038d 270b          	jreq	L3761
3667  038f 4a            	dec	a
3668  0390 270e          	jreq	L5761
3669  0392 2012          	jra	L7202
3670  0394               L1761:
3671                     ; 1164     case 0x01:
3671                     ; 1165       tempreg = (uint8_t)I2Cx->SR1;
3673  0394 1e03          	ldw	x,(OFST+1,sp)
3674  0396 e607          	ld	a,(7,x)
3675                     ; 1166       break;
3677  0398 200a          	jp	LC002
3678  039a               L3761:
3679                     ; 1169     case 0x02:
3679                     ; 1170       tempreg = (uint8_t)I2Cx->SR2;
3681  039a 1e03          	ldw	x,(OFST+1,sp)
3682  039c e608          	ld	a,(8,x)
3683                     ; 1171       break;
3685  039e 2004          	jp	LC002
3686  03a0               L5761:
3687                     ; 1174     case 0x03:
3687                     ; 1175       tempreg = (uint8_t)I2Cx->SR3;
3689  03a0 1e03          	ldw	x,(OFST+1,sp)
3690  03a2 e609          	ld	a,(9,x)
3691  03a4               LC002:
3692  03a4 6b02          	ld	(OFST+0,sp),a
3693                     ; 1176       break;
3695                     ; 1178     default:
3695                     ; 1179       break;
3697  03a6               L7202:
3698                     ; 1183   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3700  03a6 7b08          	ld	a,(OFST+6,sp)
3701  03a8 1502          	bcp	a,(OFST+0,sp)
3702  03aa 2704          	jreq	L1302
3703                     ; 1186     bitstatus = SET;
3705  03ac a601          	ld	a,#1
3707  03ae 2001          	jra	L3302
3708  03b0               L1302:
3709                     ; 1191     bitstatus = RESET;
3711  03b0 4f            	clr	a
3712  03b1               L3302:
3713                     ; 1194   return bitstatus;
3717  03b1 5b04          	addw	sp,#4
3718  03b3 81            	ret	
3772                     ; 1226 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3772                     ; 1227 {
3773                     	switch	.text
3774  03b4               _I2C_ClearFlag:
3776  03b4 89            	pushw	x
3777  03b5 89            	pushw	x
3778       00000002      OFST:	set	2
3781                     ; 1228   uint16_t flagpos = 0;
3783                     ; 1230   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3785                     ; 1233   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3787  03b6 7b08          	ld	a,(OFST+6,sp)
3788  03b8 5f            	clrw	x
3789  03b9 02            	rlwa	x,a
3790  03ba 1f01          	ldw	(OFST-1,sp),x
3791                     ; 1235   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3793  03bc 7b02          	ld	a,(OFST+0,sp)
3794  03be 43            	cpl	a
3795  03bf 1e03          	ldw	x,(OFST+1,sp)
3796  03c1 e708          	ld	(8,x),a
3797                     ; 1236 }
3800  03c3 5b04          	addw	sp,#4
3801  03c5 81            	ret	
3875                     ; 1261 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
3875                     ; 1262 {
3876                     	switch	.text
3877  03c6               _I2C_GetITStatus:
3879  03c6 89            	pushw	x
3880  03c7 5204          	subw	sp,#4
3881       00000004      OFST:	set	4
3884                     ; 1263   ITStatus bitstatus = RESET;
3886                     ; 1264   __IO uint8_t enablestatus = 0;
3888  03c9 0f03          	clr	(OFST-1,sp)
3889                     ; 1265   uint16_t tempregister = 0;
3891                     ; 1268   assert_param(IS_I2C_GET_IT(I2C_IT));
3893                     ; 1270   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
3895  03cb 7b09          	ld	a,(OFST+5,sp)
3896  03cd a407          	and	a,#7
3897  03cf 5f            	clrw	x
3898  03d0 97            	ld	xl,a
3899  03d1 1f01          	ldw	(OFST-3,sp),x
3900                     ; 1273   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
3902  03d3 1e05          	ldw	x,(OFST+1,sp)
3903  03d5 e60a          	ld	a,(10,x)
3904  03d7 1402          	and	a,(OFST-2,sp)
3905  03d9 6b03          	ld	(OFST-1,sp),a
3906                     ; 1275   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
3908  03db 7b09          	ld	a,(OFST+5,sp)
3909  03dd a430          	and	a,#48
3910  03df 97            	ld	xl,a
3911  03e0 4f            	clr	a
3912  03e1 02            	rlwa	x,a
3913  03e2 a30100        	cpw	x,#256
3914  03e5 260e          	jrne	L1212
3915                     ; 1278     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
3917  03e7 1e05          	ldw	x,(OFST+1,sp)
3918  03e9 e607          	ld	a,(7,x)
3919  03eb 150a          	bcp	a,(OFST+6,sp)
3920  03ed 2716          	jreq	L1312
3922  03ef 0d03          	tnz	(OFST-1,sp)
3923  03f1 2712          	jreq	L1312
3924                     ; 1281       bitstatus = SET;
3926  03f3 200c          	jp	LC004
3927                     ; 1286       bitstatus = RESET;
3928  03f5               L1212:
3929                     ; 1292     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
3931  03f5 1e05          	ldw	x,(OFST+1,sp)
3932  03f7 e608          	ld	a,(8,x)
3933  03f9 150a          	bcp	a,(OFST+6,sp)
3934  03fb 2708          	jreq	L1312
3936  03fd 0d03          	tnz	(OFST-1,sp)
3937  03ff 2704          	jreq	L1312
3938                     ; 1295       bitstatus = SET;
3940  0401               LC004:
3942  0401 a601          	ld	a,#1
3944  0403 2001          	jra	L7212
3945  0405               L1312:
3946                     ; 1300       bitstatus = RESET;
3949  0405 4f            	clr	a
3950  0406               L7212:
3951                     ; 1304   return  bitstatus;
3955  0406 5b06          	addw	sp,#6
3956  0408 81            	ret	
4011                     ; 1337 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
4011                     ; 1338 {
4012                     	switch	.text
4013  0409               _I2C_ClearITPendingBit:
4015  0409 89            	pushw	x
4016  040a 89            	pushw	x
4017       00000002      OFST:	set	2
4020                     ; 1339   uint16_t flagpos = 0;
4022                     ; 1342   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
4024                     ; 1345   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
4026  040b 7b08          	ld	a,(OFST+6,sp)
4027  040d 5f            	clrw	x
4028  040e 02            	rlwa	x,a
4029  040f 1f01          	ldw	(OFST-1,sp),x
4030                     ; 1348   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
4032  0411 7b02          	ld	a,(OFST+0,sp)
4033  0413 43            	cpl	a
4034  0414 1e03          	ldw	x,(OFST+1,sp)
4035  0416 e708          	ld	(8,x),a
4036                     ; 1349 }
4039  0418 5b04          	addw	sp,#4
4040  041a 81            	ret	
4053                     	xdef	_I2C_ClearITPendingBit
4054                     	xdef	_I2C_GetITStatus
4055                     	xdef	_I2C_ClearFlag
4056                     	xdef	_I2C_GetFlagStatus
4057                     	xdef	_I2C_GetLastEvent
4058                     	xdef	_I2C_CheckEvent
4059                     	xdef	_I2C_ReadRegister
4060                     	xdef	_I2C_ITConfig
4061                     	xdef	_I2C_DMALastTransferCmd
4062                     	xdef	_I2C_DMACmd
4063                     	xdef	_I2C_CalculatePEC
4064                     	xdef	_I2C_TransmitPEC
4065                     	xdef	_I2C_GetPEC
4066                     	xdef	_I2C_PECPositionConfig
4067                     	xdef	_I2C_ReceiveData
4068                     	xdef	_I2C_SendData
4069                     	xdef	_I2C_Send7bitAddress
4070                     	xdef	_I2C_SMBusAlertConfig
4071                     	xdef	_I2C_FastModeDutyCycleConfig
4072                     	xdef	_I2C_AckPositionConfig
4073                     	xdef	_I2C_DualAddressCmd
4074                     	xdef	_I2C_OwnAddress2Config
4075                     	xdef	_I2C_AcknowledgeConfig
4076                     	xdef	_I2C_GenerateSTOP
4077                     	xdef	_I2C_GenerateSTART
4078                     	xdef	_I2C_ARPCmd
4079                     	xdef	_I2C_StretchClockCmd
4080                     	xdef	_I2C_SoftwareResetCmd
4081                     	xdef	_I2C_GeneralCallCmd
4082                     	xdef	_I2C_Cmd
4083                     	xdef	_I2C_Init
4084                     	xdef	_I2C_DeInit
4085                     	xref	_CLK_GetClockFreq
4086                     	xref.b	c_lreg
4087                     	xref.b	c_x
4106                     	xref	c_uitol
4107                     	xref	c_sdivx
4108                     	xref	c_lzmp
4109                     	xref	c_rtol
4110                     	xref	c_smul
4111                     	xref	c_lmul
4112                     	xref	c_lcmp
4113                     	xref	c_ltor
4114                     	xref	c_ludv
4115                     	end
