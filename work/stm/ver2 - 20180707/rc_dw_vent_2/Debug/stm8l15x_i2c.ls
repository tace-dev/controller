   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 206                     ; 138 void I2C_DeInit(I2C_TypeDef* I2Cx)
 206                     ; 139 {
 207                     .text:	section	.text,new
 208  0000               f_I2C_DeInit:
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
 246  0015 87            	retf	
 457                     .const:	section	.text
 458  0000               L21:
 459  0000 000f4240      	dc.l	1000000
 460  0004               L41:
 461  0004 000186a1      	dc.l	100001
 462  0008               L61:
 463  0008 00000004      	dc.l	4
 464                     ; 181 void I2C_Init(I2C_TypeDef* I2Cx, uint32_t OutputClockFrequency, uint16_t OwnAddress,
 464                     ; 182               I2C_Mode_TypeDef I2C_Mode, I2C_DutyCycle_TypeDef I2C_DutyCycle,
 464                     ; 183               I2C_Ack_TypeDef I2C_Ack, I2C_AcknowledgedAddress_TypeDef I2C_AcknowledgedAddress)
 464                     ; 184 {
 465                     .text:	section	.text,new
 466  0000               f_I2C_Init:
 468  0000 89            	pushw	x
 469  0001 520c          	subw	sp,#12
 470       0000000c      OFST:	set	12
 473                     ; 185   uint32_t result = 0x0004;
 475                     ; 186   uint16_t tmpval = 0;
 477                     ; 187   uint8_t tmpccrh = 0;
 479  0003 0f07          	clr	(OFST-5,sp)
 480                     ; 188   uint8_t input_clock = 0;
 482                     ; 191   assert_param(IS_I2C_MODE(I2C_Mode));
 484                     ; 192   assert_param(IS_I2C_ACK_STATE(I2C_Ack));
 486                     ; 193   assert_param(IS_I2C_ACKNOWLEDGE_ADDRESS(I2C_AcknowledgedAddress));
 488                     ; 194   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
 490                     ; 195   assert_param(IS_I2C_OWN_ADDRESS(OwnAddress));
 492                     ; 196   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ(OutputClockFrequency));
 494                     ; 200   input_clock = (uint8_t) (CLK_GetClockFreq() / 1000000);
 496  0005 8d000000      	callf	f_CLK_GetClockFreq
 498  0009 ae0000        	ldw	x,#L21
 499  000c 8d000000      	callf	d_ludv
 501  0010 b603          	ld	a,c_lreg+3
 502  0012 6b08          	ld	(OFST-4,sp),a
 503                     ; 204   I2Cx->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 505  0014 1e0d          	ldw	x,(OFST+1,sp)
 506  0016 e602          	ld	a,(2,x)
 507  0018 a4c0          	and	a,#192
 508  001a e702          	ld	(2,x),a
 509                     ; 206   I2Cx->FREQR |= input_clock;
 511  001c e602          	ld	a,(2,x)
 512  001e 1a08          	or	a,(OFST-4,sp)
 513  0020 e702          	ld	(2,x),a
 514                     ; 210   I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 516  0022 f6            	ld	a,(x)
 517  0023 a4fe          	and	a,#254
 518  0025 f7            	ld	(x),a
 519                     ; 213   I2Cx->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 521  0026 e60c          	ld	a,(12,x)
 522  0028 a430          	and	a,#48
 523  002a e70c          	ld	(12,x),a
 524                     ; 214   I2Cx->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 526  002c 6f0b          	clr	(11,x)
 527                     ; 217   if (OutputClockFrequency > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 529  002e 96            	ldw	x,sp
 530  002f 1c0012        	addw	x,#OFST+6
 531  0032 8d000000      	callf	d_ltor
 533  0036 ae0004        	ldw	x,#L41
 534  0039 8d000000      	callf	d_lcmp
 536  003d 2404acc700c7  	jrult	L742
 537                     ; 220     tmpccrh = I2C_CCRH_FS;
 539  0043 a680          	ld	a,#128
 540  0045 6b07          	ld	(OFST-5,sp),a
 541                     ; 222     if (I2C_DutyCycle == I2C_DutyCycle_2)
 543  0047 96            	ldw	x,sp
 544  0048 0d19          	tnz	(OFST+13,sp)
 545  004a 2629          	jrne	L152
 546                     ; 225       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 3));
 548  004c 1c0012        	addw	x,#OFST+6
 549  004f 8d000000      	callf	d_ltor
 551  0053 a603          	ld	a,#3
 552  0055 8d000000      	callf	d_smul
 554  0059 96            	ldw	x,sp
 555  005a 5c            	incw	x
 556  005b 8d000000      	callf	d_rtol
 558  005f 7b08          	ld	a,(OFST-4,sp)
 559  0061 8d4a014a      	callf	LC001
 561  0065 96            	ldw	x,sp
 562  0066 5c            	incw	x
 563  0067 8d000000      	callf	d_ludv
 565  006b 96            	ldw	x,sp
 566  006c 1c0009        	addw	x,#OFST-3
 567  006f 8d000000      	callf	d_rtol
 570  0073 202d          	jra	L352
 571  0075               L152:
 572                     ; 230       result = (uint32_t) ((input_clock * 1000000) / (OutputClockFrequency * 25));
 574  0075 1c0012        	addw	x,#OFST+6
 575  0078 8d000000      	callf	d_ltor
 577  007c a619          	ld	a,#25
 578  007e 8d000000      	callf	d_smul
 580  0082 96            	ldw	x,sp
 581  0083 5c            	incw	x
 582  0084 8d000000      	callf	d_rtol
 584  0088 7b08          	ld	a,(OFST-4,sp)
 585  008a 8d4a014a      	callf	LC001
 587  008e 96            	ldw	x,sp
 588  008f 5c            	incw	x
 589  0090 8d000000      	callf	d_ludv
 591  0094 96            	ldw	x,sp
 592  0095 1c0009        	addw	x,#OFST-3
 593  0098 8d000000      	callf	d_rtol
 595                     ; 232       tmpccrh |= I2C_CCRH_DUTY;
 597  009c 7b07          	ld	a,(OFST-5,sp)
 598  009e aa40          	or	a,#64
 599  00a0 6b07          	ld	(OFST-5,sp),a
 600  00a2               L352:
 601                     ; 236     if (result < (uint16_t)0x01)
 603  00a2 96            	ldw	x,sp
 604  00a3 1c0009        	addw	x,#OFST-3
 605  00a6 8d000000      	callf	d_lzmp
 607  00aa 2608          	jrne	L552
 608                     ; 239       result = (uint16_t)0x0001;
 610  00ac ae0001        	ldw	x,#1
 611  00af 1f0b          	ldw	(OFST-1,sp),x
 612  00b1 5f            	clrw	x
 613  00b2 1f09          	ldw	(OFST-3,sp),x
 614  00b4               L552:
 615                     ; 245     tmpval = ((input_clock * 3) / 10) + 1;
 617  00b4 7b08          	ld	a,(OFST-4,sp)
 618  00b6 97            	ld	xl,a
 619  00b7 a603          	ld	a,#3
 620  00b9 42            	mul	x,a
 621  00ba a60a          	ld	a,#10
 622  00bc 8d000000      	callf	d_sdivx
 624  00c0 5c            	incw	x
 625  00c1 1f05          	ldw	(OFST-7,sp),x
 626                     ; 246     I2Cx->TRISER = (uint8_t)tmpval;
 628  00c3 7b06          	ld	a,(OFST-6,sp)
 630  00c5 204f          	jra	L752
 631  00c7               L742:
 632                     ; 253     result = (uint16_t)((input_clock * 1000000) / (OutputClockFrequency << (uint8_t)1));
 634  00c7 96            	ldw	x,sp
 635  00c8 1c0012        	addw	x,#OFST+6
 636  00cb 8d000000      	callf	d_ltor
 638  00cf 3803          	sll	c_lreg+3
 639  00d1 3902          	rlc	c_lreg+2
 640  00d3 3901          	rlc	c_lreg+1
 641  00d5 96            	ldw	x,sp
 642  00d6 3900          	rlc	c_lreg
 643  00d8 5c            	incw	x
 644  00d9 8d000000      	callf	d_rtol
 646  00dd 7b08          	ld	a,(OFST-4,sp)
 647  00df 8d4a014a      	callf	LC001
 649  00e3 96            	ldw	x,sp
 650  00e4 5c            	incw	x
 651  00e5 8d000000      	callf	d_ludv
 653  00e9 b602          	ld	a,c_lreg+2
 654  00eb 97            	ld	xl,a
 655  00ec b603          	ld	a,c_lreg+3
 656  00ee 8d000000      	callf	d_uitol
 658  00f2 96            	ldw	x,sp
 659  00f3 1c0009        	addw	x,#OFST-3
 660  00f6 8d000000      	callf	d_rtol
 662                     ; 256     if (result < (uint16_t)0x0004)
 664  00fa 96            	ldw	x,sp
 665  00fb 1c0009        	addw	x,#OFST-3
 666  00fe 8d000000      	callf	d_ltor
 668  0102 ae0008        	ldw	x,#L61
 669  0105 8d000000      	callf	d_lcmp
 671  0109 2408          	jruge	L162
 672                     ; 259       result = (uint16_t)0x0004;
 674  010b ae0004        	ldw	x,#4
 675  010e 1f0b          	ldw	(OFST-1,sp),x
 676  0110 5f            	clrw	x
 677  0111 1f09          	ldw	(OFST-3,sp),x
 678  0113               L162:
 679                     ; 265     I2Cx->TRISER = (uint8_t)((uint8_t)input_clock + (uint8_t)1);
 681  0113 7b08          	ld	a,(OFST-4,sp)
 682  0115 4c            	inc	a
 683  0116               L752:
 684  0116 1e0d          	ldw	x,(OFST+1,sp)
 685  0118 e70d          	ld	(13,x),a
 686                     ; 270   I2Cx->CCRL = (uint8_t)result;
 688  011a 7b0c          	ld	a,(OFST+0,sp)
 689  011c e70b          	ld	(11,x),a
 690                     ; 271   I2Cx->CCRH = (uint8_t)((uint8_t)((uint8_t)((uint8_t)result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 692  011e 7b07          	ld	a,(OFST-5,sp)
 693  0120 e70c          	ld	(12,x),a
 694                     ; 274   I2Cx->CR1 |= (uint8_t)(I2C_CR1_PE | I2C_Mode);
 696  0122 7b18          	ld	a,(OFST+12,sp)
 697  0124 aa01          	or	a,#1
 698  0126 fa            	or	a,(x)
 699  0127 f7            	ld	(x),a
 700                     ; 277   I2Cx->CR2 |= (uint8_t)I2C_Ack;
 702  0128 e601          	ld	a,(1,x)
 703  012a 1a1a          	or	a,(OFST+14,sp)
 704  012c e701          	ld	(1,x),a
 705                     ; 280   I2Cx->OARL = (uint8_t)(OwnAddress);
 707  012e 7b17          	ld	a,(OFST+11,sp)
 708  0130 e703          	ld	(3,x),a
 709                     ; 281   I2Cx->OARH = (uint8_t)((uint8_t)(I2C_AcknowledgedAddress | I2C_OARH_ADDCONF ) | \
 709                     ; 282                          (uint8_t)((uint16_t)( (uint16_t)OwnAddress &  (uint16_t)0x0300) >> 7));
 711  0132 1e16          	ldw	x,(OFST+10,sp)
 712  0134 4f            	clr	a
 713  0135 01            	rrwa	x,a
 714  0136 48            	sll	a
 715  0137 01            	rrwa	x,a
 716  0138 49            	rlc	a
 717  0139 a406          	and	a,#6
 718  013b 6b04          	ld	(OFST-8,sp),a
 719  013d 7b1b          	ld	a,(OFST+15,sp)
 720  013f aa40          	or	a,#64
 721  0141 1a04          	or	a,(OFST-8,sp)
 722  0143 1e0d          	ldw	x,(OFST+1,sp)
 723  0145 e704          	ld	(4,x),a
 724                     ; 283 }
 727  0147 5b0e          	addw	sp,#14
 728  0149 87            	retf	
 729  014a               LC001:
 730  014a b703          	ld	c_lreg+3,a
 731  014c 3f02          	clr	c_lreg+2
 732  014e 3f01          	clr	c_lreg+1
 733  0150 3f00          	clr	c_lreg
 734  0152 ae0000        	ldw	x,#L21
 735  0155 ac000000      	jpf	d_lmul
 801                     ; 292 void I2C_Cmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 801                     ; 293 {
 802                     .text:	section	.text,new
 803  0000               f_I2C_Cmd:
 805  0000 89            	pushw	x
 806       00000000      OFST:	set	0
 809                     ; 296   assert_param(IS_FUNCTIONAL_STATE(NewState));
 811                     ; 298   if (NewState != DISABLE)
 813  0001 7b06          	ld	a,(OFST+6,sp)
 814  0003 2705          	jreq	L713
 815                     ; 301     I2Cx->CR1 |= I2C_CR1_PE;
 817  0005 f6            	ld	a,(x)
 818  0006 aa01          	or	a,#1
 820  0008 2005          	jra	L123
 821  000a               L713:
 822                     ; 306     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_PE);
 824  000a 1e01          	ldw	x,(OFST+1,sp)
 825  000c f6            	ld	a,(x)
 826  000d a4fe          	and	a,#254
 827  000f               L123:
 828  000f f7            	ld	(x),a
 829                     ; 308 }
 832  0010 85            	popw	x
 833  0011 87            	retf	
 879                     ; 317 void I2C_GeneralCallCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
 879                     ; 318 {
 880                     .text:	section	.text,new
 881  0000               f_I2C_GeneralCallCmd:
 883  0000 89            	pushw	x
 884       00000000      OFST:	set	0
 887                     ; 321   assert_param(IS_FUNCTIONAL_STATE(NewState));
 889                     ; 323   if (NewState != DISABLE)
 891  0001 7b06          	ld	a,(OFST+6,sp)
 892  0003 2705          	jreq	L743
 893                     ; 326     I2Cx->CR1 |= I2C_CR1_ENGC;
 895  0005 f6            	ld	a,(x)
 896  0006 aa40          	or	a,#64
 898  0008 2005          	jra	L153
 899  000a               L743:
 900                     ; 331     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 902  000a 1e01          	ldw	x,(OFST+1,sp)
 903  000c f6            	ld	a,(x)
 904  000d a4bf          	and	a,#191
 905  000f               L153:
 906  000f f7            	ld	(x),a
 907                     ; 333 }
 910  0010 85            	popw	x
 911  0011 87            	retf	
 957                     ; 344 void I2C_GenerateSTART(I2C_TypeDef* I2Cx, FunctionalState NewState)
 957                     ; 345 {
 958                     .text:	section	.text,new
 959  0000               f_I2C_GenerateSTART:
 961  0000 89            	pushw	x
 962       00000000      OFST:	set	0
 965                     ; 348   assert_param(IS_FUNCTIONAL_STATE(NewState));
 967                     ; 350   if (NewState != DISABLE)
 969  0001 7b06          	ld	a,(OFST+6,sp)
 970  0003 2706          	jreq	L773
 971                     ; 353     I2Cx->CR2 |= I2C_CR2_START;
 973  0005 e601          	ld	a,(1,x)
 974  0007 aa01          	or	a,#1
 976  0009 2006          	jra	L104
 977  000b               L773:
 978                     ; 358     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_START);
 980  000b 1e01          	ldw	x,(OFST+1,sp)
 981  000d e601          	ld	a,(1,x)
 982  000f a4fe          	and	a,#254
 983  0011               L104:
 984  0011 e701          	ld	(1,x),a
 985                     ; 360 }
 988  0013 85            	popw	x
 989  0014 87            	retf	
1035                     ; 369 void I2C_GenerateSTOP(I2C_TypeDef* I2Cx, FunctionalState NewState)
1035                     ; 370 {
1036                     .text:	section	.text,new
1037  0000               f_I2C_GenerateSTOP:
1039  0000 89            	pushw	x
1040       00000000      OFST:	set	0
1043                     ; 373   assert_param(IS_FUNCTIONAL_STATE(NewState));
1045                     ; 375   if (NewState != DISABLE)
1047  0001 7b06          	ld	a,(OFST+6,sp)
1048  0003 2706          	jreq	L724
1049                     ; 378     I2Cx->CR2 |= I2C_CR2_STOP;
1051  0005 e601          	ld	a,(1,x)
1052  0007 aa02          	or	a,#2
1054  0009 2006          	jra	L134
1055  000b               L724:
1056                     ; 383     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_STOP);
1058  000b 1e01          	ldw	x,(OFST+1,sp)
1059  000d e601          	ld	a,(1,x)
1060  000f a4fd          	and	a,#253
1061  0011               L134:
1062  0011 e701          	ld	(1,x),a
1063                     ; 385 }
1066  0013 85            	popw	x
1067  0014 87            	retf	
1114                     ; 394 void I2C_SoftwareResetCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1114                     ; 395 {
1115                     .text:	section	.text,new
1116  0000               f_I2C_SoftwareResetCmd:
1118  0000 89            	pushw	x
1119       00000000      OFST:	set	0
1122                     ; 397   assert_param(IS_FUNCTIONAL_STATE(NewState));
1124                     ; 399   if (NewState != DISABLE)
1126  0001 7b06          	ld	a,(OFST+6,sp)
1127  0003 2706          	jreq	L754
1128                     ; 402     I2Cx->CR2 |= I2C_CR2_SWRST;
1130  0005 e601          	ld	a,(1,x)
1131  0007 aa80          	or	a,#128
1133  0009 2006          	jra	L164
1134  000b               L754:
1135                     ; 407     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1137  000b 1e01          	ldw	x,(OFST+1,sp)
1138  000d e601          	ld	a,(1,x)
1139  000f a47f          	and	a,#127
1140  0011               L164:
1141  0011 e701          	ld	(1,x),a
1142                     ; 409 }
1145  0013 85            	popw	x
1146  0014 87            	retf	
1193                     ; 418 void I2C_StretchClockCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1193                     ; 419 {
1194                     .text:	section	.text,new
1195  0000               f_I2C_StretchClockCmd:
1197  0000 89            	pushw	x
1198       00000000      OFST:	set	0
1201                     ; 421   assert_param(IS_FUNCTIONAL_STATE(NewState));
1203                     ; 423   if (NewState != DISABLE)
1205  0001 7b06          	ld	a,(OFST+6,sp)
1206  0003 2705          	jreq	L705
1207                     ; 426     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1209  0005 f6            	ld	a,(x)
1210  0006 a47f          	and	a,#127
1212  0008 2005          	jra	L115
1213  000a               L705:
1214                     ; 432     I2Cx->CR1 |= I2C_CR1_NOSTRETCH;
1216  000a 1e01          	ldw	x,(OFST+1,sp)
1217  000c f6            	ld	a,(x)
1218  000d aa80          	or	a,#128
1219  000f               L115:
1220  000f f7            	ld	(x),a
1221                     ; 434 }
1224  0010 85            	popw	x
1225  0011 87            	retf	
1271                     ; 443 void I2C_ARPCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1271                     ; 444 {
1272                     .text:	section	.text,new
1273  0000               f_I2C_ARPCmd:
1275  0000 89            	pushw	x
1276       00000000      OFST:	set	0
1279                     ; 446   assert_param(IS_FUNCTIONAL_STATE(NewState));
1281                     ; 448   if (NewState != DISABLE)
1283  0001 7b06          	ld	a,(OFST+6,sp)
1284  0003 2705          	jreq	L735
1285                     ; 451     I2Cx->CR1 |= I2C_CR1_ARP;
1287  0005 f6            	ld	a,(x)
1288  0006 aa10          	or	a,#16
1290  0008 2005          	jra	L145
1291  000a               L735:
1292                     ; 457     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ARP);
1294  000a 1e01          	ldw	x,(OFST+1,sp)
1295  000c f6            	ld	a,(x)
1296  000d a4ef          	and	a,#239
1297  000f               L145:
1298  000f f7            	ld	(x),a
1299                     ; 459 }
1302  0010 85            	popw	x
1303  0011 87            	retf	
1350                     ; 468 void I2C_AcknowledgeConfig(I2C_TypeDef* I2Cx, FunctionalState NewState)
1350                     ; 469 {
1351                     .text:	section	.text,new
1352  0000               f_I2C_AcknowledgeConfig:
1354  0000 89            	pushw	x
1355       00000000      OFST:	set	0
1358                     ; 471   assert_param(IS_FUNCTIONAL_STATE(NewState));
1360                     ; 473   if (NewState != DISABLE)
1362  0001 7b06          	ld	a,(OFST+6,sp)
1363  0003 2706          	jreq	L765
1364                     ; 476     I2Cx->CR2 |= I2C_CR2_ACK;
1366  0005 e601          	ld	a,(1,x)
1367  0007 aa04          	or	a,#4
1369  0009 2006          	jra	L175
1370  000b               L765:
1371                     ; 481     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1373  000b 1e01          	ldw	x,(OFST+1,sp)
1374  000d e601          	ld	a,(1,x)
1375  000f a4fb          	and	a,#251
1376  0011               L175:
1377  0011 e701          	ld	(1,x),a
1378                     ; 483 }
1381  0013 85            	popw	x
1382  0014 87            	retf	
1433                     ; 491 void I2C_OwnAddress2Config(I2C_TypeDef* I2Cx, uint8_t Address)
1433                     ; 492 {
1434                     .text:	section	.text,new
1435  0000               f_I2C_OwnAddress2Config:
1437  0000 89            	pushw	x
1438  0001 88            	push	a
1439       00000001      OFST:	set	1
1442                     ; 493   uint8_t tmpreg = 0;
1444                     ; 496   tmpreg = I2Cx->OAR2;
1446  0002 e605          	ld	a,(5,x)
1447                     ; 499   tmpreg &= (uint8_t)(~I2C_OAR2_ADD2);
1449  0004 a401          	and	a,#1
1450  0006 6b01          	ld	(OFST+0,sp),a
1451                     ; 502   tmpreg |= (uint8_t) ((uint8_t)Address & (uint8_t)0xFE);
1453  0008 7b07          	ld	a,(OFST+6,sp)
1454  000a a4fe          	and	a,#254
1455  000c 1a01          	or	a,(OFST+0,sp)
1456  000e 6b01          	ld	(OFST+0,sp),a
1457                     ; 505   I2Cx->OAR2 = tmpreg;
1459  0010 1e02          	ldw	x,(OFST+1,sp)
1460  0012 e705          	ld	(5,x),a
1461                     ; 506 }
1464  0014 5b03          	addw	sp,#3
1465  0016 87            	retf	
1511                     ; 515 void I2C_DualAddressCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
1511                     ; 516 {
1512                     .text:	section	.text,new
1513  0000               f_I2C_DualAddressCmd:
1515  0000 89            	pushw	x
1516       00000000      OFST:	set	0
1519                     ; 518   assert_param(IS_FUNCTIONAL_STATE(NewState));
1521                     ; 520   if (NewState != DISABLE)
1523  0001 7b06          	ld	a,(OFST+6,sp)
1524  0003 2706          	jreq	L346
1525                     ; 523     I2Cx->OAR2 |= I2C_OAR2_ENDUAL;
1527  0005 e605          	ld	a,(5,x)
1528  0007 aa01          	or	a,#1
1530  0009 2006          	jra	L546
1531  000b               L346:
1532                     ; 528     I2Cx->OAR2 &= (uint8_t)(~I2C_OAR2_ENDUAL);
1534  000b 1e01          	ldw	x,(OFST+1,sp)
1535  000d e605          	ld	a,(5,x)
1536  000f a4fe          	and	a,#254
1537  0011               L546:
1538  0011 e705          	ld	(5,x),a
1539                     ; 530 }
1542  0013 85            	popw	x
1543  0014 87            	retf	
1612                     ; 542 void I2C_AckPositionConfig(I2C_TypeDef* I2Cx, I2C_AckPosition_TypeDef I2C_AckPosition)
1612                     ; 543 {
1613                     .text:	section	.text,new
1614  0000               f_I2C_AckPositionConfig:
1616  0000 89            	pushw	x
1617       00000000      OFST:	set	0
1620                     ; 545   assert_param(IS_I2C_ACK_POSITION(I2C_AckPosition));
1622                     ; 548   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
1624  0001 e601          	ld	a,(1,x)
1625  0003 a4f7          	and	a,#247
1626  0005 e701          	ld	(1,x),a
1627                     ; 550   I2Cx->CR2 |= (uint8_t)I2C_AckPosition;
1629  0007 e601          	ld	a,(1,x)
1630  0009 1a06          	or	a,(OFST+6,sp)
1631  000b e701          	ld	(1,x),a
1632                     ; 551 }
1635  000d 85            	popw	x
1636  000e 87            	retf	
1704                     ; 562 void I2C_SMBusAlertConfig(I2C_TypeDef* I2Cx, I2C_SMBusAlert_TypeDef I2C_SMBusAlert)
1704                     ; 563 {
1705                     .text:	section	.text,new
1706  0000               f_I2C_SMBusAlertConfig:
1708  0000 89            	pushw	x
1709       00000000      OFST:	set	0
1712                     ; 566   assert_param(IS_I2C_SMBUS_ALERT(I2C_SMBusAlert));
1714                     ; 568   if (I2C_SMBusAlert != I2C_SMBusAlert_High)
1716  0001 7b06          	ld	a,(OFST+6,sp)
1717  0003 2706          	jreq	L737
1718                     ; 571     I2Cx->CR2 |= (uint8_t)I2C_CR2_ALERT;
1720  0005 e601          	ld	a,(1,x)
1721  0007 aa20          	or	a,#32
1723  0009 2006          	jra	L147
1724  000b               L737:
1725                     ; 576     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_ALERT);
1727  000b 1e01          	ldw	x,(OFST+1,sp)
1728  000d e601          	ld	a,(1,x)
1729  000f a4df          	and	a,#223
1730  0011               L147:
1731  0011 e701          	ld	(1,x),a
1732                     ; 578 }
1735  0013 85            	popw	x
1736  0014 87            	retf	
1783                     ; 589 void I2C_FastModeDutyCycleConfig(I2C_TypeDef* I2Cx, I2C_DutyCycle_TypeDef I2C_DutyCycle)
1783                     ; 590 {
1784                     .text:	section	.text,new
1785  0000               f_I2C_FastModeDutyCycleConfig:
1787  0000 89            	pushw	x
1788       00000000      OFST:	set	0
1791                     ; 593   assert_param(IS_I2C_DUTY_CYCLE(I2C_DutyCycle));
1793                     ; 595   if (I2C_DutyCycle == I2C_DutyCycle_16_9)
1795  0001 7b06          	ld	a,(OFST+6,sp)
1796  0003 a140          	cp	a,#64
1797  0005 2606          	jrne	L767
1798                     ; 598     I2Cx->CCRH |= I2C_CCRH_DUTY;
1800  0007 e60c          	ld	a,(12,x)
1801  0009 aa40          	or	a,#64
1803  000b 2006          	jra	L177
1804  000d               L767:
1805                     ; 603     I2Cx->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1807  000d 1e01          	ldw	x,(OFST+1,sp)
1808  000f e60c          	ld	a,(12,x)
1809  0011 a4bf          	and	a,#191
1810  0013               L177:
1811  0013 e70c          	ld	(12,x),a
1812                     ; 605 }
1815  0015 85            	popw	x
1816  0016 87            	retf	
1892                     ; 618 void I2C_Send7bitAddress(I2C_TypeDef* I2Cx, uint8_t Address, I2C_Direction_TypeDef I2C_Direction)
1892                     ; 619 {
1893                     .text:	section	.text,new
1894  0000               f_I2C_Send7bitAddress:
1896  0000 89            	pushw	x
1897       00000000      OFST:	set	0
1900                     ; 621   assert_param(IS_I2C_ADDRESS(Address));
1902                     ; 622   assert_param(IS_I2C_DIRECTION(I2C_Direction));
1904                     ; 625   if (I2C_Direction != I2C_Direction_Transmitter)
1906  0001 7b07          	ld	a,(OFST+7,sp)
1907  0003 2706          	jreq	L1301
1908                     ; 628     Address |= OAR1_ADD0_Set;
1910  0005 7b06          	ld	a,(OFST+6,sp)
1911  0007 aa01          	or	a,#1
1913  0009 2004          	jra	L3301
1914  000b               L1301:
1915                     ; 633     Address &= OAR1_ADD0_Reset;
1917  000b 7b06          	ld	a,(OFST+6,sp)
1918  000d a4fe          	and	a,#254
1919  000f               L3301:
1920  000f 6b06          	ld	(OFST+6,sp),a
1921                     ; 636   I2Cx->DR = Address;
1923  0011 1e01          	ldw	x,(OFST+1,sp)
1924  0013 e706          	ld	(6,x),a
1925                     ; 637 }
1928  0015 85            	popw	x
1929  0016 87            	retf	
1972                     ; 661 void I2C_SendData(I2C_TypeDef* I2Cx, uint8_t Data)
1972                     ; 662 {
1973                     .text:	section	.text,new
1974  0000               f_I2C_SendData:
1976  0000 89            	pushw	x
1977       00000000      OFST:	set	0
1980                     ; 664   I2Cx->DR = Data;
1982  0001 7b06          	ld	a,(OFST+6,sp)
1983  0003 1e01          	ldw	x,(OFST+1,sp)
1984  0005 e706          	ld	(6,x),a
1985                     ; 665 }
1988  0007 85            	popw	x
1989  0008 87            	retf	
2025                     ; 673 uint8_t I2C_ReceiveData(I2C_TypeDef* I2Cx)
2025                     ; 674 {
2026                     .text:	section	.text,new
2027  0000               f_I2C_ReceiveData:
2031                     ; 676   return ((uint8_t)I2Cx->DR);
2033  0000 e606          	ld	a,(6,x)
2036  0002 87            	retf	
2082                     ; 702 void I2C_TransmitPEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2082                     ; 703 {
2083                     .text:	section	.text,new
2084  0000               f_I2C_TransmitPEC:
2086  0000 89            	pushw	x
2087       00000000      OFST:	set	0
2090                     ; 705   assert_param(IS_FUNCTIONAL_STATE(NewState));
2092                     ; 707   if (NewState != DISABLE)
2094  0001 7b06          	ld	a,(OFST+6,sp)
2095  0003 2706          	jreq	L3211
2096                     ; 710     I2Cx->CR2 |= I2C_CR2_PEC;
2098  0005 e601          	ld	a,(1,x)
2099  0007 aa10          	or	a,#16
2101  0009 2006          	jra	L5211
2102  000b               L3211:
2103                     ; 715     I2Cx->CR2 &= (uint8_t)(~I2C_CR2_PEC);
2105  000b 1e01          	ldw	x,(OFST+1,sp)
2106  000d e601          	ld	a,(1,x)
2107  000f a4ef          	and	a,#239
2108  0011               L5211:
2109  0011 e701          	ld	(1,x),a
2110                     ; 717 }
2113  0013 85            	popw	x
2114  0014 87            	retf	
2160                     ; 726 void I2C_CalculatePEC(I2C_TypeDef* I2Cx, FunctionalState NewState)
2160                     ; 727 {
2161                     .text:	section	.text,new
2162  0000               f_I2C_CalculatePEC:
2164  0000 89            	pushw	x
2165       00000000      OFST:	set	0
2168                     ; 729   assert_param(IS_FUNCTIONAL_STATE(NewState));
2170                     ; 731   if (NewState != DISABLE)
2172  0001 7b06          	ld	a,(OFST+6,sp)
2173  0003 2705          	jreq	L3511
2174                     ; 734     I2Cx->CR1 |= I2C_CR1_ENPEC;
2176  0005 f6            	ld	a,(x)
2177  0006 aa20          	or	a,#32
2179  0008 2005          	jra	L5511
2180  000a               L3511:
2181                     ; 739     I2Cx->CR1 &= (uint8_t)(~I2C_CR1_ENPEC);
2183  000a 1e01          	ldw	x,(OFST+1,sp)
2184  000c f6            	ld	a,(x)
2185  000d a4df          	and	a,#223
2186  000f               L5511:
2187  000f f7            	ld	(x),a
2188                     ; 741 }
2191  0010 85            	popw	x
2192  0011 87            	retf	
2261                     ; 752 void I2C_PECPositionConfig(I2C_TypeDef* I2Cx, I2C_PECPosition_TypeDef I2C_PECPosition)
2261                     ; 753 {
2262                     .text:	section	.text,new
2263  0000               f_I2C_PECPositionConfig:
2265  0000 89            	pushw	x
2266       00000000      OFST:	set	0
2269                     ; 755   assert_param(IS_I2C_PEC_POSITION(I2C_PECPosition));
2271                     ; 758   I2Cx->CR2 &= (uint8_t)(~I2C_CR2_POS);
2273  0001 e601          	ld	a,(1,x)
2274  0003 a4f7          	and	a,#247
2275  0005 e701          	ld	(1,x),a
2276                     ; 760   I2Cx->CR2 |= (uint8_t)I2C_PECPosition;
2278  0007 e601          	ld	a,(1,x)
2279  0009 1a06          	or	a,(OFST+6,sp)
2280  000b e701          	ld	(1,x),a
2281                     ; 761 }
2284  000d 85            	popw	x
2285  000e 87            	retf	
2321                     ; 769 uint8_t I2C_GetPEC(I2C_TypeDef* I2Cx)
2321                     ; 770 {
2322                     .text:	section	.text,new
2323  0000               f_I2C_GetPEC:
2327                     ; 772   return (I2Cx->PECR);
2329  0000 e60e          	ld	a,(14,x)
2332  0002 87            	retf	
2378                     ; 800 void I2C_DMACmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2378                     ; 801 {
2379                     .text:	section	.text,new
2380  0000               f_I2C_DMACmd:
2382  0000 89            	pushw	x
2383       00000000      OFST:	set	0
2386                     ; 803   assert_param(IS_FUNCTIONAL_STATE(NewState));
2388                     ; 805   if (NewState != DISABLE)
2390  0001 7b06          	ld	a,(OFST+6,sp)
2391  0003 2706          	jreq	L7521
2392                     ; 808     I2Cx->ITR |= I2C_ITR_DMAEN;
2394  0005 e60a          	ld	a,(10,x)
2395  0007 aa08          	or	a,#8
2397  0009 2006          	jra	L1621
2398  000b               L7521:
2399                     ; 813     I2Cx->ITR &= (uint8_t)(~I2C_ITR_DMAEN);
2401  000b 1e01          	ldw	x,(OFST+1,sp)
2402  000d e60a          	ld	a,(10,x)
2403  000f a4f7          	and	a,#247
2404  0011               L1621:
2405  0011 e70a          	ld	(10,x),a
2406                     ; 815 }
2409  0013 85            	popw	x
2410  0014 87            	retf	
2457                     ; 824 void I2C_DMALastTransferCmd(I2C_TypeDef* I2Cx, FunctionalState NewState)
2457                     ; 825 {
2458                     .text:	section	.text,new
2459  0000               f_I2C_DMALastTransferCmd:
2461  0000 89            	pushw	x
2462       00000000      OFST:	set	0
2465                     ; 827   assert_param(IS_FUNCTIONAL_STATE(NewState));
2467                     ; 829   if (NewState != DISABLE)
2469  0001 7b06          	ld	a,(OFST+6,sp)
2470  0003 2706          	jreq	L7031
2471                     ; 832     I2Cx->ITR |= I2C_ITR_LAST;
2473  0005 e60a          	ld	a,(10,x)
2474  0007 aa10          	or	a,#16
2476  0009 2006          	jra	L1131
2477  000b               L7031:
2478                     ; 837     I2Cx->ITR &= (uint8_t)(~I2C_ITR_LAST);
2480  000b 1e01          	ldw	x,(OFST+1,sp)
2481  000d e60a          	ld	a,(10,x)
2482  000f a4ef          	and	a,#239
2483  0011               L1131:
2484  0011 e70a          	ld	(10,x),a
2485                     ; 839 }
2488  0013 85            	popw	x
2489  0014 87            	retf	
2677                     ; 951 void I2C_ITConfig(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
2677                     ; 952 {
2678                     .text:	section	.text,new
2679  0000               f_I2C_ITConfig:
2681  0000 89            	pushw	x
2682       00000000      OFST:	set	0
2685                     ; 954   assert_param(IS_I2C_CONFIG_IT(I2C_IT));
2687                     ; 955   assert_param(IS_FUNCTIONAL_STATE(NewState));
2689                     ; 957   if (NewState != DISABLE)
2691  0001 7b08          	ld	a,(OFST+8,sp)
2692  0003 2706          	jreq	L3141
2693                     ; 960     I2Cx->ITR |= (uint8_t)I2C_IT;
2695  0005 e60a          	ld	a,(10,x)
2696  0007 1a07          	or	a,(OFST+7,sp)
2698  0009 2007          	jra	L5141
2699  000b               L3141:
2700                     ; 965     I2Cx->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
2702  000b 1e01          	ldw	x,(OFST+1,sp)
2703  000d 7b07          	ld	a,(OFST+7,sp)
2704  000f 43            	cpl	a
2705  0010 e40a          	and	a,(10,x)
2706  0012               L5141:
2707  0012 e70a          	ld	(10,x),a
2708                     ; 967 }
2711  0014 85            	popw	x
2712  0015 87            	retf	
2872                     ; 991 uint8_t I2C_ReadRegister(I2C_TypeDef* I2Cx, I2C_Register_TypeDef I2C_Register)
2872                     ; 992 {
2873                     .text:	section	.text,new
2874  0000               f_I2C_ReadRegister:
2876  0000 89            	pushw	x
2877  0001 5204          	subw	sp,#4
2878       00000004      OFST:	set	4
2881                     ; 993   __IO uint16_t tmp = 0;
2883  0003 5f            	clrw	x
2884  0004 1f03          	ldw	(OFST-1,sp),x
2885                     ; 995   assert_param(IS_I2C_REGISTER(I2C_Register));
2887                     ; 997   tmp = (uint16_t) I2Cx;
2889  0006 1e05          	ldw	x,(OFST+1,sp)
2890  0008 1f03          	ldw	(OFST-1,sp),x
2891                     ; 998   tmp += I2C_Register;
2893  000a 7b0a          	ld	a,(OFST+6,sp)
2894  000c 5f            	clrw	x
2895  000d 97            	ld	xl,a
2896  000e 1f01          	ldw	(OFST-3,sp),x
2897  0010 1e03          	ldw	x,(OFST-1,sp)
2898  0012 72fb01        	addw	x,(OFST-3,sp)
2899  0015 1f03          	ldw	(OFST-1,sp),x
2900                     ; 1001   return (*(__IO uint8_t *) tmp);
2902  0017 1e03          	ldw	x,(OFST-1,sp)
2903  0019 f6            	ld	a,(x)
2906  001a 5b06          	addw	sp,#6
2907  001c 87            	retf	
3156                     ; 1041 ErrorStatus I2C_CheckEvent(I2C_TypeDef* I2Cx, I2C_Event_TypeDef I2C_Event)
3156                     ; 1042 {
3157                     .text:	section	.text,new
3158  0000               f_I2C_CheckEvent:
3160  0000 89            	pushw	x
3161  0001 5206          	subw	sp,#6
3162       00000006      OFST:	set	6
3165                     ; 1043   __IO uint16_t lastevent = 0x00;
3167  0003 5f            	clrw	x
3168  0004 1f04          	ldw	(OFST-2,sp),x
3169                     ; 1044   uint8_t flag1 = 0x00 ;
3171                     ; 1045   uint8_t flag2 = 0x00;
3173                     ; 1046   ErrorStatus status = ERROR;
3175                     ; 1049   assert_param(IS_I2C_EVENT(I2C_Event));
3177                     ; 1051   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
3179  0006 1e0c          	ldw	x,(OFST+6,sp)
3180  0008 a30004        	cpw	x,#4
3181  000b 260a          	jrne	L5261
3182                     ; 1053     lastevent = I2Cx->SR2 & I2C_SR2_AF;
3184  000d 1e07          	ldw	x,(OFST+1,sp)
3185  000f e608          	ld	a,(8,x)
3186  0011 a404          	and	a,#4
3187  0013 5f            	clrw	x
3188  0014 97            	ld	xl,a
3190  0015 201a          	jra	L7261
3191  0017               L5261:
3192                     ; 1057     flag1 = I2Cx->SR1;
3194  0017 1e07          	ldw	x,(OFST+1,sp)
3195  0019 e607          	ld	a,(7,x)
3196  001b 6b03          	ld	(OFST-3,sp),a
3197                     ; 1058     flag2 = I2Cx->SR3;
3199  001d e609          	ld	a,(9,x)
3200  001f 6b06          	ld	(OFST+0,sp),a
3201                     ; 1059     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
3203  0021 5f            	clrw	x
3204  0022 7b03          	ld	a,(OFST-3,sp)
3205  0024 97            	ld	xl,a
3206  0025 1f01          	ldw	(OFST-5,sp),x
3207  0027 5f            	clrw	x
3208  0028 7b06          	ld	a,(OFST+0,sp)
3209  002a 97            	ld	xl,a
3210  002b 7b02          	ld	a,(OFST-4,sp)
3211  002d 01            	rrwa	x,a
3212  002e 1a01          	or	a,(OFST-5,sp)
3213  0030 01            	rrwa	x,a
3214  0031               L7261:
3215  0031 1f04          	ldw	(OFST-2,sp),x
3216                     ; 1062   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
3218  0033 1e04          	ldw	x,(OFST-2,sp)
3219  0035 01            	rrwa	x,a
3220  0036 140d          	and	a,(OFST+7,sp)
3221  0038 01            	rrwa	x,a
3222  0039 140c          	and	a,(OFST+6,sp)
3223  003b 01            	rrwa	x,a
3224  003c 130c          	cpw	x,(OFST+6,sp)
3225  003e 2604          	jrne	L1361
3226                     ; 1065     status = SUCCESS;
3228  0040 a601          	ld	a,#1
3230  0042 2001          	jra	L3361
3231  0044               L1361:
3232                     ; 1070     status = ERROR;
3234  0044 4f            	clr	a
3235  0045               L3361:
3236                     ; 1074   return status;
3240  0045 5b08          	addw	sp,#8
3241  0047 87            	retf	
3301                     ; 1092 I2C_Event_TypeDef I2C_GetLastEvent(I2C_TypeDef* I2Cx)
3301                     ; 1093 {
3302                     .text:	section	.text,new
3303  0000               f_I2C_GetLastEvent:
3305  0000 89            	pushw	x
3306  0001 5206          	subw	sp,#6
3307       00000006      OFST:	set	6
3310                     ; 1094   __IO uint16_t lastevent = 0;
3312  0003 5f            	clrw	x
3313  0004 1f05          	ldw	(OFST-1,sp),x
3314                     ; 1095   uint16_t flag1 = 0;
3316                     ; 1096   uint16_t flag2 = 0;
3318                     ; 1098   if ((I2Cx->SR2 & I2C_SR2_AF) != 0x00)
3320  0006 1e07          	ldw	x,(OFST+1,sp)
3321  0008 e608          	ld	a,(8,x)
3322  000a a504          	bcp	a,#4
3323  000c 2705          	jreq	L5661
3324                     ; 1100     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
3326  000e ae0004        	ldw	x,#4
3328  0011 2014          	jra	L7661
3329  0013               L5661:
3330                     ; 1105     flag1 = I2Cx->SR1;
3332  0013 e607          	ld	a,(7,x)
3333  0015 5f            	clrw	x
3334  0016 97            	ld	xl,a
3335  0017 1f01          	ldw	(OFST-5,sp),x
3336                     ; 1106     flag2 = I2Cx->SR3;
3338  0019 1e07          	ldw	x,(OFST+1,sp)
3339  001b e609          	ld	a,(9,x)
3340  001d 5f            	clrw	x
3341  001e 97            	ld	xl,a
3342  001f 1f03          	ldw	(OFST-3,sp),x
3343                     ; 1109     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
3345  0021 7b02          	ld	a,(OFST-4,sp)
3346  0023 01            	rrwa	x,a
3347  0024 1a01          	or	a,(OFST-5,sp)
3348  0026 01            	rrwa	x,a
3349  0027               L7661:
3350  0027 1f05          	ldw	(OFST-1,sp),x
3351                     ; 1112   return (I2C_Event_TypeDef)lastevent;
3353  0029 1e05          	ldw	x,(OFST-1,sp)
3356  002b 5b08          	addw	sp,#8
3357  002d 87            	retf	
3609                     ; 1149 FlagStatus I2C_GetFlagStatus(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3609                     ; 1150 {
3610                     .text:	section	.text,new
3611  0000               f_I2C_GetFlagStatus:
3613  0000 89            	pushw	x
3614  0001 89            	pushw	x
3615       00000002      OFST:	set	2
3618                     ; 1151   uint8_t tempreg = 0;
3620  0002 0f02          	clr	(OFST+0,sp)
3621                     ; 1152   uint8_t regindex = 0;
3623                     ; 1153   FlagStatus bitstatus = RESET;
3625                     ; 1156   assert_param(IS_I2C_GET_FLAG(I2C_FLAG));
3627                     ; 1159   regindex = (uint8_t)((uint16_t)I2C_FLAG >> 8);
3629  0004 7b08          	ld	a,(OFST+6,sp)
3630  0006 6b01          	ld	(OFST-1,sp),a
3631                     ; 1161   switch (regindex)
3634                     ; 1178     default:
3634                     ; 1179       break;
3635  0008 4a            	dec	a
3636  0009 2708          	jreq	L1761
3637  000b 4a            	dec	a
3638  000c 270b          	jreq	L3761
3639  000e 4a            	dec	a
3640  000f 270e          	jreq	L5761
3641  0011 2012          	jra	L7202
3642  0013               L1761:
3643                     ; 1164     case 0x01:
3643                     ; 1165       tempreg = (uint8_t)I2Cx->SR1;
3645  0013 1e03          	ldw	x,(OFST+1,sp)
3646  0015 e607          	ld	a,(7,x)
3647                     ; 1166       break;
3649  0017 200a          	jpf	LC002
3650  0019               L3761:
3651                     ; 1169     case 0x02:
3651                     ; 1170       tempreg = (uint8_t)I2Cx->SR2;
3653  0019 1e03          	ldw	x,(OFST+1,sp)
3654  001b e608          	ld	a,(8,x)
3655                     ; 1171       break;
3657  001d 2004          	jpf	LC002
3658  001f               L5761:
3659                     ; 1174     case 0x03:
3659                     ; 1175       tempreg = (uint8_t)I2Cx->SR3;
3661  001f 1e03          	ldw	x,(OFST+1,sp)
3662  0021 e609          	ld	a,(9,x)
3663  0023               LC002:
3664  0023 6b02          	ld	(OFST+0,sp),a
3665                     ; 1176       break;
3667                     ; 1178     default:
3667                     ; 1179       break;
3669  0025               L7202:
3670                     ; 1183   if ((tempreg & (uint8_t)I2C_FLAG ) != 0)
3672  0025 7b09          	ld	a,(OFST+7,sp)
3673  0027 1502          	bcp	a,(OFST+0,sp)
3674  0029 2704          	jreq	L1302
3675                     ; 1186     bitstatus = SET;
3677  002b a601          	ld	a,#1
3679  002d 2001          	jra	L3302
3680  002f               L1302:
3681                     ; 1191     bitstatus = RESET;
3683  002f 4f            	clr	a
3684  0030               L3302:
3685                     ; 1194   return bitstatus;
3689  0030 5b04          	addw	sp,#4
3690  0032 87            	retf	
3743                     ; 1226 void I2C_ClearFlag(I2C_TypeDef* I2Cx, I2C_FLAG_TypeDef I2C_FLAG)
3743                     ; 1227 {
3744                     .text:	section	.text,new
3745  0000               f_I2C_ClearFlag:
3747  0000 89            	pushw	x
3748  0001 89            	pushw	x
3749       00000002      OFST:	set	2
3752                     ; 1228   uint16_t flagpos = 0;
3754                     ; 1230   assert_param(IS_I2C_CLEAR_FLAG(I2C_FLAG));
3756                     ; 1233   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
3758  0002 7b09          	ld	a,(OFST+7,sp)
3759  0004 5f            	clrw	x
3760  0005 02            	rlwa	x,a
3761  0006 1f01          	ldw	(OFST-1,sp),x
3762                     ; 1235   I2Cx->SR2 = (uint8_t)((uint16_t)(~flagpos));
3764  0008 7b02          	ld	a,(OFST+0,sp)
3765  000a 43            	cpl	a
3766  000b 1e03          	ldw	x,(OFST+1,sp)
3767  000d e708          	ld	(8,x),a
3768                     ; 1236 }
3771  000f 5b04          	addw	sp,#4
3772  0011 87            	retf	
3845                     ; 1261 ITStatus I2C_GetITStatus(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
3845                     ; 1262 {
3846                     .text:	section	.text,new
3847  0000               f_I2C_GetITStatus:
3849  0000 89            	pushw	x
3850  0001 5204          	subw	sp,#4
3851       00000004      OFST:	set	4
3854                     ; 1263   ITStatus bitstatus = RESET;
3856                     ; 1264   __IO uint8_t enablestatus = 0;
3858  0003 0f03          	clr	(OFST-1,sp)
3859                     ; 1265   uint16_t tempregister = 0;
3861                     ; 1268   assert_param(IS_I2C_GET_IT(I2C_IT));
3863                     ; 1270   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_IT & ITEN_Mask)) >> 8);
3865  0005 7b0a          	ld	a,(OFST+6,sp)
3866  0007 a407          	and	a,#7
3867  0009 5f            	clrw	x
3868  000a 97            	ld	xl,a
3869  000b 1f01          	ldw	(OFST-3,sp),x
3870                     ; 1273   enablestatus = (uint8_t)(I2Cx->ITR & ( uint8_t)tempregister);
3872  000d 1e05          	ldw	x,(OFST+1,sp)
3873  000f e60a          	ld	a,(10,x)
3874  0011 1402          	and	a,(OFST-2,sp)
3875  0013 6b03          	ld	(OFST-1,sp),a
3876                     ; 1275   if ((uint16_t)((uint16_t)I2C_IT & REGISTER_Mask) == REGISTER_SR1_Index)
3878  0015 7b0a          	ld	a,(OFST+6,sp)
3879  0017 a430          	and	a,#48
3880  0019 97            	ld	xl,a
3881  001a 4f            	clr	a
3882  001b 02            	rlwa	x,a
3883  001c a30100        	cpw	x,#256
3884  001f 260e          	jrne	L1212
3885                     ; 1278     if (((I2Cx->SR1 & (uint8_t)I2C_IT) != RESET) && enablestatus)
3887  0021 1e05          	ldw	x,(OFST+1,sp)
3888  0023 e607          	ld	a,(7,x)
3889  0025 150b          	bcp	a,(OFST+7,sp)
3890  0027 2716          	jreq	L1312
3892  0029 0d03          	tnz	(OFST-1,sp)
3893  002b 2712          	jreq	L1312
3894                     ; 1281       bitstatus = SET;
3896  002d 200c          	jpf	LC004
3897                     ; 1286       bitstatus = RESET;
3898  002f               L1212:
3899                     ; 1292     if (((I2Cx->SR2 & (uint8_t)I2C_IT) != RESET) && enablestatus)
3901  002f 1e05          	ldw	x,(OFST+1,sp)
3902  0031 e608          	ld	a,(8,x)
3903  0033 150b          	bcp	a,(OFST+7,sp)
3904  0035 2708          	jreq	L1312
3906  0037 0d03          	tnz	(OFST-1,sp)
3907  0039 2704          	jreq	L1312
3908                     ; 1295       bitstatus = SET;
3910  003b               LC004:
3912  003b a601          	ld	a,#1
3914  003d 2001          	jra	L7212
3915  003f               L1312:
3916                     ; 1300       bitstatus = RESET;
3919  003f 4f            	clr	a
3920  0040               L7212:
3921                     ; 1304   return  bitstatus;
3925  0040 5b06          	addw	sp,#6
3926  0042 87            	retf	
3980                     ; 1337 void I2C_ClearITPendingBit(I2C_TypeDef* I2Cx, I2C_IT_TypeDef I2C_IT)
3980                     ; 1338 {
3981                     .text:	section	.text,new
3982  0000               f_I2C_ClearITPendingBit:
3984  0000 89            	pushw	x
3985  0001 89            	pushw	x
3986       00000002      OFST:	set	2
3989                     ; 1339   uint16_t flagpos = 0;
3991                     ; 1342   assert_param(IS_I2C_CLEAR_IT(I2C_IT));
3993                     ; 1345   flagpos = (uint16_t)I2C_IT & FLAG_Mask;
3995  0002 7b09          	ld	a,(OFST+7,sp)
3996  0004 5f            	clrw	x
3997  0005 02            	rlwa	x,a
3998  0006 1f01          	ldw	(OFST-1,sp),x
3999                     ; 1348   I2Cx->SR2 = (uint8_t)((uint16_t)~flagpos);
4001  0008 7b02          	ld	a,(OFST+0,sp)
4002  000a 43            	cpl	a
4003  000b 1e03          	ldw	x,(OFST+1,sp)
4004  000d e708          	ld	(8,x),a
4005                     ; 1349 }
4008  000f 5b04          	addw	sp,#4
4009  0011 87            	retf	
4021                     	xdef	f_I2C_ClearITPendingBit
4022                     	xdef	f_I2C_GetITStatus
4023                     	xdef	f_I2C_ClearFlag
4024                     	xdef	f_I2C_GetFlagStatus
4025                     	xdef	f_I2C_GetLastEvent
4026                     	xdef	f_I2C_CheckEvent
4027                     	xdef	f_I2C_ReadRegister
4028                     	xdef	f_I2C_ITConfig
4029                     	xdef	f_I2C_DMALastTransferCmd
4030                     	xdef	f_I2C_DMACmd
4031                     	xdef	f_I2C_CalculatePEC
4032                     	xdef	f_I2C_TransmitPEC
4033                     	xdef	f_I2C_GetPEC
4034                     	xdef	f_I2C_PECPositionConfig
4035                     	xdef	f_I2C_ReceiveData
4036                     	xdef	f_I2C_SendData
4037                     	xdef	f_I2C_Send7bitAddress
4038                     	xdef	f_I2C_SMBusAlertConfig
4039                     	xdef	f_I2C_FastModeDutyCycleConfig
4040                     	xdef	f_I2C_AckPositionConfig
4041                     	xdef	f_I2C_DualAddressCmd
4042                     	xdef	f_I2C_OwnAddress2Config
4043                     	xdef	f_I2C_AcknowledgeConfig
4044                     	xdef	f_I2C_GenerateSTOP
4045                     	xdef	f_I2C_GenerateSTART
4046                     	xdef	f_I2C_ARPCmd
4047                     	xdef	f_I2C_StretchClockCmd
4048                     	xdef	f_I2C_SoftwareResetCmd
4049                     	xdef	f_I2C_GeneralCallCmd
4050                     	xdef	f_I2C_Cmd
4051                     	xdef	f_I2C_Init
4052                     	xdef	f_I2C_DeInit
4053                     	xref	f_CLK_GetClockFreq
4054                     	xref.b	c_lreg
4055                     	xref.b	c_x
4074                     	xref	d_uitol
4075                     	xref	d_sdivx
4076                     	xref	d_lzmp
4077                     	xref	d_rtol
4078                     	xref	d_smul
4079                     	xref	d_lmul
4080                     	xref	d_lcmp
4081                     	xref	d_ltor
4082                     	xref	d_ludv
4083                     	end
