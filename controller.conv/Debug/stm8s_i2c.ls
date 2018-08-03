   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  44                     ; 61 void I2C_DeInit(void)
  44                     ; 62 {
  46                     	switch	.text
  47  0000               _I2C_DeInit:
  51                     ; 63   I2C->CR1 = I2C_CR1_RESET_VALUE;
  53  0000 725f5210      	clr	21008
  54                     ; 64   I2C->CR2 = I2C_CR2_RESET_VALUE;
  56  0004 725f5211      	clr	21009
  57                     ; 65   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  59  0008 725f5212      	clr	21010
  60                     ; 66   I2C->OARL = I2C_OARL_RESET_VALUE;
  62  000c 725f5213      	clr	21011
  63                     ; 67   I2C->OARH = I2C_OARH_RESET_VALUE;
  65  0010 725f5214      	clr	21012
  66                     ; 68   I2C->ITR = I2C_ITR_RESET_VALUE;
  68  0014 725f521a      	clr	21018
  69                     ; 69   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  71  0018 725f521b      	clr	21019
  72                     ; 70   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  74  001c 725f521c      	clr	21020
  75                     ; 71   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  77  0020 3502521d      	mov	21021,#2
  78                     ; 72 }
  81  0024 81            	ret
 260                     .const:	section	.text
 261  0000               L01:
 262  0000 000186a1      	dc.l	100001
 263  0004               L21:
 264  0004 000f4240      	dc.l	1000000
 265                     ; 90 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 265                     ; 91               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 265                     ; 92               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 265                     ; 93 {
 266                     	switch	.text
 267  0025               _I2C_Init:
 269  0025 5209          	subw	sp,#9
 270       00000009      OFST:	set	9
 273                     ; 94   uint16_t result = 0x0004;
 275                     ; 95   uint16_t tmpval = 0;
 277                     ; 96   uint8_t tmpccrh = 0;
 279  0027 0f07          	clr	(OFST-2,sp)
 281                     ; 99   assert_param(IS_I2C_ACK_OK(Ack));
 283                     ; 100   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 285                     ; 101   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 287                     ; 102   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 289                     ; 103   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 291                     ; 104   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 293                     ; 109   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 295  0029 c65212        	ld	a,21010
 296  002c a4c0          	and	a,#192
 297  002e c75212        	ld	21010,a
 298                     ; 111   I2C->FREQR |= InputClockFrequencyMHz;
 300  0031 c65212        	ld	a,21010
 301  0034 1a15          	or	a,(OFST+12,sp)
 302  0036 c75212        	ld	21010,a
 303                     ; 115   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 305  0039 72115210      	bres	21008,#0
 306                     ; 118   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 308  003d c6521c        	ld	a,21020
 309  0040 a430          	and	a,#48
 310  0042 c7521c        	ld	21020,a
 311                     ; 119   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 313  0045 725f521b      	clr	21019
 314                     ; 122   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 316  0049 96            	ldw	x,sp
 317  004a 1c000c        	addw	x,#OFST+3
 318  004d cd0000        	call	c_ltor
 320  0050 ae0000        	ldw	x,#L01
 321  0053 cd0000        	call	c_lcmp
 323  0056 2403          	jruge	L41
 324  0058 cc00e5        	jp	L131
 325  005b               L41:
 326                     ; 125     tmpccrh = I2C_CCRH_FS;
 328  005b a680          	ld	a,#128
 329  005d 6b07          	ld	(OFST-2,sp),a
 331                     ; 127     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 333  005f 0d12          	tnz	(OFST+9,sp)
 334  0061 2630          	jrne	L331
 335                     ; 130       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 337  0063 96            	ldw	x,sp
 338  0064 1c000c        	addw	x,#OFST+3
 339  0067 cd0000        	call	c_ltor
 341  006a a603          	ld	a,#3
 342  006c cd0000        	call	c_smul
 344  006f 96            	ldw	x,sp
 345  0070 1c0001        	addw	x,#OFST-8
 346  0073 cd0000        	call	c_rtol
 349  0076 7b15          	ld	a,(OFST+12,sp)
 350  0078 b703          	ld	c_lreg+3,a
 351  007a 3f02          	clr	c_lreg+2
 352  007c 3f01          	clr	c_lreg+1
 353  007e 3f00          	clr	c_lreg
 354  0080 ae0004        	ldw	x,#L21
 355  0083 cd0000        	call	c_lmul
 357  0086 96            	ldw	x,sp
 358  0087 1c0001        	addw	x,#OFST-8
 359  008a cd0000        	call	c_ludv
 361  008d be02          	ldw	x,c_lreg+2
 362  008f 1f08          	ldw	(OFST-1,sp),x
 365  0091 2034          	jra	L531
 366  0093               L331:
 367                     ; 135       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 369  0093 96            	ldw	x,sp
 370  0094 1c000c        	addw	x,#OFST+3
 371  0097 cd0000        	call	c_ltor
 373  009a a619          	ld	a,#25
 374  009c cd0000        	call	c_smul
 376  009f 96            	ldw	x,sp
 377  00a0 1c0001        	addw	x,#OFST-8
 378  00a3 cd0000        	call	c_rtol
 381  00a6 7b15          	ld	a,(OFST+12,sp)
 382  00a8 b703          	ld	c_lreg+3,a
 383  00aa 3f02          	clr	c_lreg+2
 384  00ac 3f01          	clr	c_lreg+1
 385  00ae 3f00          	clr	c_lreg
 386  00b0 ae0004        	ldw	x,#L21
 387  00b3 cd0000        	call	c_lmul
 389  00b6 96            	ldw	x,sp
 390  00b7 1c0001        	addw	x,#OFST-8
 391  00ba cd0000        	call	c_ludv
 393  00bd be02          	ldw	x,c_lreg+2
 394  00bf 1f08          	ldw	(OFST-1,sp),x
 396                     ; 137       tmpccrh |= I2C_CCRH_DUTY;
 398  00c1 7b07          	ld	a,(OFST-2,sp)
 399  00c3 aa40          	or	a,#64
 400  00c5 6b07          	ld	(OFST-2,sp),a
 402  00c7               L531:
 403                     ; 141     if (result < (uint16_t)0x01)
 405  00c7 1e08          	ldw	x,(OFST-1,sp)
 406  00c9 2605          	jrne	L731
 407                     ; 144       result = (uint16_t)0x0001;
 409  00cb ae0001        	ldw	x,#1
 410  00ce 1f08          	ldw	(OFST-1,sp),x
 412  00d0               L731:
 413                     ; 150     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 415  00d0 7b15          	ld	a,(OFST+12,sp)
 416  00d2 97            	ld	xl,a
 417  00d3 a603          	ld	a,#3
 418  00d5 42            	mul	x,a
 419  00d6 a60a          	ld	a,#10
 420  00d8 cd0000        	call	c_sdivx
 422  00db 5c            	incw	x
 423  00dc 1f05          	ldw	(OFST-4,sp),x
 425                     ; 151     I2C->TRISER = (uint8_t)tmpval;
 427  00de 7b06          	ld	a,(OFST-3,sp)
 428  00e0 c7521d        	ld	21021,a
 430  00e3 2043          	jra	L141
 431  00e5               L131:
 432                     ; 158     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 434  00e5 96            	ldw	x,sp
 435  00e6 1c000c        	addw	x,#OFST+3
 436  00e9 cd0000        	call	c_ltor
 438  00ec 3803          	sll	c_lreg+3
 439  00ee 3902          	rlc	c_lreg+2
 440  00f0 3901          	rlc	c_lreg+1
 441  00f2 3900          	rlc	c_lreg
 442  00f4 96            	ldw	x,sp
 443  00f5 1c0001        	addw	x,#OFST-8
 444  00f8 cd0000        	call	c_rtol
 447  00fb 7b15          	ld	a,(OFST+12,sp)
 448  00fd b703          	ld	c_lreg+3,a
 449  00ff 3f02          	clr	c_lreg+2
 450  0101 3f01          	clr	c_lreg+1
 451  0103 3f00          	clr	c_lreg
 452  0105 ae0004        	ldw	x,#L21
 453  0108 cd0000        	call	c_lmul
 455  010b 96            	ldw	x,sp
 456  010c 1c0001        	addw	x,#OFST-8
 457  010f cd0000        	call	c_ludv
 459  0112 be02          	ldw	x,c_lreg+2
 460  0114 1f08          	ldw	(OFST-1,sp),x
 462                     ; 161     if (result < (uint16_t)0x0004)
 464  0116 1e08          	ldw	x,(OFST-1,sp)
 465  0118 a30004        	cpw	x,#4
 466  011b 2405          	jruge	L341
 467                     ; 164       result = (uint16_t)0x0004;
 469  011d ae0004        	ldw	x,#4
 470  0120 1f08          	ldw	(OFST-1,sp),x
 472  0122               L341:
 473                     ; 170     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 475  0122 7b15          	ld	a,(OFST+12,sp)
 476  0124 4c            	inc	a
 477  0125 c7521d        	ld	21021,a
 478  0128               L141:
 479                     ; 175   I2C->CCRL = (uint8_t)result;
 481  0128 7b09          	ld	a,(OFST+0,sp)
 482  012a c7521b        	ld	21019,a
 483                     ; 176   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 485  012d 7b08          	ld	a,(OFST-1,sp)
 486  012f a40f          	and	a,#15
 487  0131 1a07          	or	a,(OFST-2,sp)
 488  0133 c7521c        	ld	21020,a
 489                     ; 179   I2C->CR1 |= I2C_CR1_PE;
 491  0136 72105210      	bset	21008,#0
 492                     ; 182   I2C_AcknowledgeConfig(Ack);
 494  013a 7b13          	ld	a,(OFST+10,sp)
 495  013c ad71          	call	_I2C_AcknowledgeConfig
 497                     ; 185   I2C->OARL = (uint8_t)(OwnAddress);
 499  013e 7b11          	ld	a,(OFST+8,sp)
 500  0140 c75213        	ld	21011,a
 501                     ; 186   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 501                     ; 187                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 503  0143 1e10          	ldw	x,(OFST+7,sp)
 504  0145 4f            	clr	a
 505  0146 01            	rrwa	x,a
 506  0147 48            	sll	a
 507  0148 59            	rlcw	x
 508  0149 01            	rrwa	x,a
 509  014a a406          	and	a,#6
 510  014c 5f            	clrw	x
 511  014d 6b04          	ld	(OFST-5,sp),a
 513  014f 7b14          	ld	a,(OFST+11,sp)
 514  0151 aa40          	or	a,#64
 515  0153 1a04          	or	a,(OFST-5,sp)
 516  0155 c75214        	ld	21012,a
 517                     ; 188 }
 520  0158 5b09          	addw	sp,#9
 521  015a 81            	ret
 576                     ; 196 void I2C_Cmd(FunctionalState NewState)
 576                     ; 197 {
 577                     	switch	.text
 578  015b               _I2C_Cmd:
 582                     ; 200   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 584                     ; 202   if (NewState != DISABLE)
 586  015b 4d            	tnz	a
 587  015c 2706          	jreq	L371
 588                     ; 205     I2C->CR1 |= I2C_CR1_PE;
 590  015e 72105210      	bset	21008,#0
 592  0162 2004          	jra	L571
 593  0164               L371:
 594                     ; 210     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 596  0164 72115210      	bres	21008,#0
 597  0168               L571:
 598                     ; 212 }
 601  0168 81            	ret
 636                     ; 220 void I2C_GeneralCallCmd(FunctionalState NewState)
 636                     ; 221 {
 637                     	switch	.text
 638  0169               _I2C_GeneralCallCmd:
 642                     ; 224   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 644                     ; 226   if (NewState != DISABLE)
 646  0169 4d            	tnz	a
 647  016a 2706          	jreq	L512
 648                     ; 229     I2C->CR1 |= I2C_CR1_ENGC;
 650  016c 721c5210      	bset	21008,#6
 652  0170 2004          	jra	L712
 653  0172               L512:
 654                     ; 234     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 656  0172 721d5210      	bres	21008,#6
 657  0176               L712:
 658                     ; 236 }
 661  0176 81            	ret
 696                     ; 246 void I2C_GenerateSTART(FunctionalState NewState)
 696                     ; 247 {
 697                     	switch	.text
 698  0177               _I2C_GenerateSTART:
 702                     ; 250   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 704                     ; 252   if (NewState != DISABLE)
 706  0177 4d            	tnz	a
 707  0178 2706          	jreq	L732
 708                     ; 255     I2C->CR2 |= I2C_CR2_START;
 710  017a 72105211      	bset	21009,#0
 712  017e 2004          	jra	L142
 713  0180               L732:
 714                     ; 260     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 716  0180 72115211      	bres	21009,#0
 717  0184               L142:
 718                     ; 262 }
 721  0184 81            	ret
 756                     ; 270 void I2C_GenerateSTOP(FunctionalState NewState)
 756                     ; 271 {
 757                     	switch	.text
 758  0185               _I2C_GenerateSTOP:
 762                     ; 274   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 764                     ; 276   if (NewState != DISABLE)
 766  0185 4d            	tnz	a
 767  0186 2706          	jreq	L162
 768                     ; 279     I2C->CR2 |= I2C_CR2_STOP;
 770  0188 72125211      	bset	21009,#1
 772  018c 2004          	jra	L362
 773  018e               L162:
 774                     ; 284     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 776  018e 72135211      	bres	21009,#1
 777  0192               L362:
 778                     ; 286 }
 781  0192 81            	ret
 817                     ; 294 void I2C_SoftwareResetCmd(FunctionalState NewState)
 817                     ; 295 {
 818                     	switch	.text
 819  0193               _I2C_SoftwareResetCmd:
 823                     ; 297   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 825                     ; 299   if (NewState != DISABLE)
 827  0193 4d            	tnz	a
 828  0194 2706          	jreq	L303
 829                     ; 302     I2C->CR2 |= I2C_CR2_SWRST;
 831  0196 721e5211      	bset	21009,#7
 833  019a 2004          	jra	L503
 834  019c               L303:
 835                     ; 307     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
 837  019c 721f5211      	bres	21009,#7
 838  01a0               L503:
 839                     ; 309 }
 842  01a0 81            	ret
 878                     ; 318 void I2C_StretchClockCmd(FunctionalState NewState)
 878                     ; 319 {
 879                     	switch	.text
 880  01a1               _I2C_StretchClockCmd:
 884                     ; 321   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 886                     ; 323   if (NewState != DISABLE)
 888  01a1 4d            	tnz	a
 889  01a2 2706          	jreq	L523
 890                     ; 326     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
 892  01a4 721f5210      	bres	21008,#7
 894  01a8 2004          	jra	L723
 895  01aa               L523:
 896                     ; 332     I2C->CR1 |= I2C_CR1_NOSTRETCH;
 898  01aa 721e5210      	bset	21008,#7
 899  01ae               L723:
 900                     ; 334 }
 903  01ae 81            	ret
 939                     ; 343 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
 939                     ; 344 {
 940                     	switch	.text
 941  01af               _I2C_AcknowledgeConfig:
 943  01af 88            	push	a
 944       00000000      OFST:	set	0
 947                     ; 347   assert_param(IS_I2C_ACK_OK(Ack));
 949                     ; 349   if (Ack == I2C_ACK_NONE)
 951  01b0 4d            	tnz	a
 952  01b1 2606          	jrne	L743
 953                     ; 352     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
 955  01b3 72155211      	bres	21009,#2
 957  01b7 2014          	jra	L153
 958  01b9               L743:
 959                     ; 357     I2C->CR2 |= I2C_CR2_ACK;
 961  01b9 72145211      	bset	21009,#2
 962                     ; 359     if (Ack == I2C_ACK_CURR)
 964  01bd 7b01          	ld	a,(OFST+1,sp)
 965  01bf a101          	cp	a,#1
 966  01c1 2606          	jrne	L353
 967                     ; 362       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
 969  01c3 72175211      	bres	21009,#3
 971  01c7 2004          	jra	L153
 972  01c9               L353:
 973                     ; 367       I2C->CR2 |= I2C_CR2_POS;
 975  01c9 72165211      	bset	21009,#3
 976  01cd               L153:
 977                     ; 370 }
 980  01cd 84            	pop	a
 981  01ce 81            	ret
1053                     ; 380 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1053                     ; 381 {
1054                     	switch	.text
1055  01cf               _I2C_ITConfig:
1057  01cf 89            	pushw	x
1058       00000000      OFST:	set	0
1061                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1063                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1065                     ; 387   if (NewState != DISABLE)
1067  01d0 9f            	ld	a,xl
1068  01d1 4d            	tnz	a
1069  01d2 2709          	jreq	L314
1070                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1072  01d4 9e            	ld	a,xh
1073  01d5 ca521a        	or	a,21018
1074  01d8 c7521a        	ld	21018,a
1076  01db 2009          	jra	L514
1077  01dd               L314:
1078                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1080  01dd 7b01          	ld	a,(OFST+1,sp)
1081  01df 43            	cpl	a
1082  01e0 c4521a        	and	a,21018
1083  01e3 c7521a        	ld	21018,a
1084  01e6               L514:
1085                     ; 397 }
1088  01e6 85            	popw	x
1089  01e7 81            	ret
1125                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1125                     ; 406 {
1126                     	switch	.text
1127  01e8               _I2C_FastModeDutyCycleConfig:
1131                     ; 409   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1133                     ; 411   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1135  01e8 a140          	cp	a,#64
1136  01ea 2606          	jrne	L534
1137                     ; 414     I2C->CCRH |= I2C_CCRH_DUTY;
1139  01ec 721c521c      	bset	21020,#6
1141  01f0 2004          	jra	L734
1142  01f2               L534:
1143                     ; 419     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1145  01f2 721d521c      	bres	21020,#6
1146  01f6               L734:
1147                     ; 421 }
1150  01f6 81            	ret
1173                     ; 428 uint8_t I2C_ReceiveData(void)
1173                     ; 429 {
1174                     	switch	.text
1175  01f7               _I2C_ReceiveData:
1179                     ; 431   return ((uint8_t)I2C->DR);
1181  01f7 c65216        	ld	a,21014
1184  01fa 81            	ret
1249                     ; 441 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1249                     ; 442 {
1250                     	switch	.text
1251  01fb               _I2C_Send7bitAddress:
1253  01fb 89            	pushw	x
1254       00000000      OFST:	set	0
1257                     ; 444   assert_param(IS_I2C_ADDRESS_OK(Address));
1259                     ; 445   assert_param(IS_I2C_DIRECTION_OK(Direction));
1261                     ; 448   Address &= (uint8_t)0xFE;
1263  01fc 7b01          	ld	a,(OFST+1,sp)
1264  01fe a4fe          	and	a,#254
1265  0200 6b01          	ld	(OFST+1,sp),a
1266                     ; 451   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1268  0202 7b01          	ld	a,(OFST+1,sp)
1269  0204 1a02          	or	a,(OFST+2,sp)
1270  0206 c75216        	ld	21014,a
1271                     ; 452 }
1274  0209 85            	popw	x
1275  020a 81            	ret
1309                     ; 459 void I2C_SendData(uint8_t Data)
1309                     ; 460 {
1310                     	switch	.text
1311  020b               _I2C_SendData:
1315                     ; 462   I2C->DR = Data;
1317  020b c75216        	ld	21014,a
1318                     ; 463 }
1321  020e 81            	ret
1545                     ; 579 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1545                     ; 580 {
1546                     	switch	.text
1547  020f               _I2C_CheckEvent:
1549  020f 89            	pushw	x
1550  0210 5206          	subw	sp,#6
1551       00000006      OFST:	set	6
1554                     ; 581   __IO uint16_t lastevent = 0x00;
1556  0212 5f            	clrw	x
1557  0213 1f04          	ldw	(OFST-2,sp),x
1559                     ; 582   uint8_t flag1 = 0x00 ;
1561                     ; 583   uint8_t flag2 = 0x00;
1563                     ; 584   ErrorStatus status = ERROR;
1565                     ; 587   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1567                     ; 589   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
1569  0215 1e07          	ldw	x,(OFST+1,sp)
1570  0217 a30004        	cpw	x,#4
1571  021a 260b          	jrne	L136
1572                     ; 591     lastevent = I2C->SR2 & I2C_SR2_AF;
1574  021c c65218        	ld	a,21016
1575  021f a404          	and	a,#4
1576  0221 5f            	clrw	x
1577  0222 97            	ld	xl,a
1578  0223 1f04          	ldw	(OFST-2,sp),x
1581  0225 201f          	jra	L336
1582  0227               L136:
1583                     ; 595     flag1 = I2C->SR1;
1585  0227 c65217        	ld	a,21015
1586  022a 6b03          	ld	(OFST-3,sp),a
1588                     ; 596     flag2 = I2C->SR3;
1590  022c c65219        	ld	a,21017
1591  022f 6b06          	ld	(OFST+0,sp),a
1593                     ; 597     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
1595  0231 7b03          	ld	a,(OFST-3,sp)
1596  0233 5f            	clrw	x
1597  0234 97            	ld	xl,a
1598  0235 1f01          	ldw	(OFST-5,sp),x
1600  0237 7b06          	ld	a,(OFST+0,sp)
1601  0239 5f            	clrw	x
1602  023a 97            	ld	xl,a
1603  023b 4f            	clr	a
1604  023c 02            	rlwa	x,a
1605  023d 01            	rrwa	x,a
1606  023e 1a02          	or	a,(OFST-4,sp)
1607  0240 01            	rrwa	x,a
1608  0241 1a01          	or	a,(OFST-5,sp)
1609  0243 01            	rrwa	x,a
1610  0244 1f04          	ldw	(OFST-2,sp),x
1612  0246               L336:
1613                     ; 600   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
1615  0246 1e04          	ldw	x,(OFST-2,sp)
1616  0248 01            	rrwa	x,a
1617  0249 1408          	and	a,(OFST+2,sp)
1618  024b 01            	rrwa	x,a
1619  024c 1407          	and	a,(OFST+1,sp)
1620  024e 01            	rrwa	x,a
1621  024f 1307          	cpw	x,(OFST+1,sp)
1622  0251 2606          	jrne	L536
1623                     ; 603     status = SUCCESS;
1625  0253 a601          	ld	a,#1
1626  0255 6b06          	ld	(OFST+0,sp),a
1629  0257 2002          	jra	L736
1630  0259               L536:
1631                     ; 608     status = ERROR;
1633  0259 0f06          	clr	(OFST+0,sp)
1635  025b               L736:
1636                     ; 612   return status;
1638  025b 7b06          	ld	a,(OFST+0,sp)
1641  025d 5b08          	addw	sp,#8
1642  025f 81            	ret
1695                     ; 629 I2C_Event_TypeDef I2C_GetLastEvent(void)
1695                     ; 630 {
1696                     	switch	.text
1697  0260               _I2C_GetLastEvent:
1699  0260 5206          	subw	sp,#6
1700       00000006      OFST:	set	6
1703                     ; 631   __IO uint16_t lastevent = 0;
1705  0262 5f            	clrw	x
1706  0263 1f05          	ldw	(OFST-1,sp),x
1708                     ; 632   uint16_t flag1 = 0;
1710                     ; 633   uint16_t flag2 = 0;
1712                     ; 635   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
1714  0265 c65218        	ld	a,21016
1715  0268 a504          	bcp	a,#4
1716  026a 2707          	jreq	L766
1717                     ; 637     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
1719  026c ae0004        	ldw	x,#4
1720  026f 1f05          	ldw	(OFST-1,sp),x
1723  0271 201b          	jra	L176
1724  0273               L766:
1725                     ; 642     flag1 = I2C->SR1;
1727  0273 c65217        	ld	a,21015
1728  0276 5f            	clrw	x
1729  0277 97            	ld	xl,a
1730  0278 1f01          	ldw	(OFST-5,sp),x
1732                     ; 643     flag2 = I2C->SR3;
1734  027a c65219        	ld	a,21017
1735  027d 5f            	clrw	x
1736  027e 97            	ld	xl,a
1737  027f 1f03          	ldw	(OFST-3,sp),x
1739                     ; 646     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
1741  0281 1e03          	ldw	x,(OFST-3,sp)
1742  0283 4f            	clr	a
1743  0284 02            	rlwa	x,a
1744  0285 01            	rrwa	x,a
1745  0286 1a02          	or	a,(OFST-4,sp)
1746  0288 01            	rrwa	x,a
1747  0289 1a01          	or	a,(OFST-5,sp)
1748  028b 01            	rrwa	x,a
1749  028c 1f05          	ldw	(OFST-1,sp),x
1751  028e               L176:
1752                     ; 649   return (I2C_Event_TypeDef)lastevent;
1754  028e 1e05          	ldw	x,(OFST-1,sp)
1757  0290 5b06          	addw	sp,#6
1758  0292 81            	ret
1973                     ; 680 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
1973                     ; 681 {
1974                     	switch	.text
1975  0293               _I2C_GetFlagStatus:
1977  0293 89            	pushw	x
1978  0294 89            	pushw	x
1979       00000002      OFST:	set	2
1982                     ; 682   uint8_t tempreg = 0;
1984  0295 0f02          	clr	(OFST+0,sp)
1986                     ; 683   uint8_t regindex = 0;
1988                     ; 684   FlagStatus bitstatus = RESET;
1990                     ; 687   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
1992                     ; 690   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
1994  0297 9e            	ld	a,xh
1995  0298 6b01          	ld	(OFST-1,sp),a
1997                     ; 692   switch (regindex)
1999  029a 7b01          	ld	a,(OFST-1,sp)
2001                     ; 709     default:
2001                     ; 710       break;
2002  029c 4a            	dec	a
2003  029d 2708          	jreq	L376
2004  029f 4a            	dec	a
2005  02a0 270c          	jreq	L576
2006  02a2 4a            	dec	a
2007  02a3 2710          	jreq	L776
2008  02a5 2013          	jra	L3101
2009  02a7               L376:
2010                     ; 695     case 0x01:
2010                     ; 696       tempreg = (uint8_t)I2C->SR1;
2012  02a7 c65217        	ld	a,21015
2013  02aa 6b02          	ld	(OFST+0,sp),a
2015                     ; 697       break;
2017  02ac 200c          	jra	L3101
2018  02ae               L576:
2019                     ; 700     case 0x02:
2019                     ; 701       tempreg = (uint8_t)I2C->SR2;
2021  02ae c65218        	ld	a,21016
2022  02b1 6b02          	ld	(OFST+0,sp),a
2024                     ; 702       break;
2026  02b3 2005          	jra	L3101
2027  02b5               L776:
2028                     ; 705     case 0x03:
2028                     ; 706       tempreg = (uint8_t)I2C->SR3;
2030  02b5 c65219        	ld	a,21017
2031  02b8 6b02          	ld	(OFST+0,sp),a
2033                     ; 707       break;
2035  02ba               L107:
2036                     ; 709     default:
2036                     ; 710       break;
2038  02ba               L3101:
2039                     ; 714   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2041  02ba 7b04          	ld	a,(OFST+2,sp)
2042  02bc 1502          	bcp	a,(OFST+0,sp)
2043  02be 2706          	jreq	L5101
2044                     ; 717     bitstatus = SET;
2046  02c0 a601          	ld	a,#1
2047  02c2 6b02          	ld	(OFST+0,sp),a
2050  02c4 2002          	jra	L7101
2051  02c6               L5101:
2052                     ; 722     bitstatus = RESET;
2054  02c6 0f02          	clr	(OFST+0,sp)
2056  02c8               L7101:
2057                     ; 725   return bitstatus;
2059  02c8 7b02          	ld	a,(OFST+0,sp)
2062  02ca 5b04          	addw	sp,#4
2063  02cc 81            	ret
2107                     ; 760 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2107                     ; 761 {
2108                     	switch	.text
2109  02cd               _I2C_ClearFlag:
2111  02cd 89            	pushw	x
2112       00000002      OFST:	set	2
2115                     ; 762   uint16_t flagpos = 0;
2117                     ; 764   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2119                     ; 767   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2121  02ce 01            	rrwa	x,a
2122  02cf a4ff          	and	a,#255
2123  02d1 5f            	clrw	x
2124  02d2 02            	rlwa	x,a
2125  02d3 1f01          	ldw	(OFST-1,sp),x
2126  02d5 01            	rrwa	x,a
2128                     ; 769   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2130  02d6 7b02          	ld	a,(OFST+0,sp)
2131  02d8 43            	cpl	a
2132  02d9 c75218        	ld	21016,a
2133                     ; 770 }
2136  02dc 85            	popw	x
2137  02dd 81            	ret
2303                     ; 792 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2303                     ; 793 {
2304                     	switch	.text
2305  02de               _I2C_GetITStatus:
2307  02de 89            	pushw	x
2308  02df 5204          	subw	sp,#4
2309       00000004      OFST:	set	4
2312                     ; 794   ITStatus bitstatus = RESET;
2314                     ; 795   __IO uint8_t enablestatus = 0;
2316  02e1 0f03          	clr	(OFST-1,sp)
2318                     ; 796   uint16_t tempregister = 0;
2320                     ; 799     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2322                     ; 801   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2324  02e3 9e            	ld	a,xh
2325  02e4 a407          	and	a,#7
2326  02e6 5f            	clrw	x
2327  02e7 97            	ld	xl,a
2328  02e8 1f01          	ldw	(OFST-3,sp),x
2330                     ; 804   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2332  02ea c6521a        	ld	a,21018
2333  02ed 1402          	and	a,(OFST-2,sp)
2334  02ef 6b03          	ld	(OFST-1,sp),a
2336                     ; 806   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2338  02f1 7b05          	ld	a,(OFST+1,sp)
2339  02f3 97            	ld	xl,a
2340  02f4 7b06          	ld	a,(OFST+2,sp)
2341  02f6 9f            	ld	a,xl
2342  02f7 a430          	and	a,#48
2343  02f9 97            	ld	xl,a
2344  02fa 4f            	clr	a
2345  02fb 02            	rlwa	x,a
2346  02fc a30100        	cpw	x,#256
2347  02ff 2615          	jrne	L1311
2348                     ; 809     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2350  0301 c65217        	ld	a,21015
2351  0304 1506          	bcp	a,(OFST+2,sp)
2352  0306 270a          	jreq	L3311
2354  0308 0d03          	tnz	(OFST-1,sp)
2355  030a 2706          	jreq	L3311
2356                     ; 812       bitstatus = SET;
2358  030c a601          	ld	a,#1
2359  030e 6b04          	ld	(OFST+0,sp),a
2362  0310 2017          	jra	L7311
2363  0312               L3311:
2364                     ; 817       bitstatus = RESET;
2366  0312 0f04          	clr	(OFST+0,sp)
2368  0314 2013          	jra	L7311
2369  0316               L1311:
2370                     ; 823     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2372  0316 c65218        	ld	a,21016
2373  0319 1506          	bcp	a,(OFST+2,sp)
2374  031b 270a          	jreq	L1411
2376  031d 0d03          	tnz	(OFST-1,sp)
2377  031f 2706          	jreq	L1411
2378                     ; 826       bitstatus = SET;
2380  0321 a601          	ld	a,#1
2381  0323 6b04          	ld	(OFST+0,sp),a
2384  0325 2002          	jra	L7311
2385  0327               L1411:
2386                     ; 831       bitstatus = RESET;
2388  0327 0f04          	clr	(OFST+0,sp)
2390  0329               L7311:
2391                     ; 835   return  bitstatus;
2393  0329 7b04          	ld	a,(OFST+0,sp)
2396  032b 5b06          	addw	sp,#6
2397  032d 81            	ret
2442                     ; 873 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2442                     ; 874 {
2443                     	switch	.text
2444  032e               _I2C_ClearITPendingBit:
2446  032e 89            	pushw	x
2447       00000002      OFST:	set	2
2450                     ; 875   uint16_t flagpos = 0;
2452                     ; 878   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2454                     ; 881   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
2456  032f 01            	rrwa	x,a
2457  0330 a4ff          	and	a,#255
2458  0332 5f            	clrw	x
2459  0333 02            	rlwa	x,a
2460  0334 1f01          	ldw	(OFST-1,sp),x
2461  0336 01            	rrwa	x,a
2463                     ; 884   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
2465  0337 7b02          	ld	a,(OFST+0,sp)
2466  0339 43            	cpl	a
2467  033a c75218        	ld	21016,a
2468                     ; 885 }
2471  033d 85            	popw	x
2472  033e 81            	ret
2485                     	xdef	_I2C_ClearITPendingBit
2486                     	xdef	_I2C_GetITStatus
2487                     	xdef	_I2C_ClearFlag
2488                     	xdef	_I2C_GetFlagStatus
2489                     	xdef	_I2C_GetLastEvent
2490                     	xdef	_I2C_CheckEvent
2491                     	xdef	_I2C_SendData
2492                     	xdef	_I2C_Send7bitAddress
2493                     	xdef	_I2C_ReceiveData
2494                     	xdef	_I2C_ITConfig
2495                     	xdef	_I2C_FastModeDutyCycleConfig
2496                     	xdef	_I2C_AcknowledgeConfig
2497                     	xdef	_I2C_StretchClockCmd
2498                     	xdef	_I2C_SoftwareResetCmd
2499                     	xdef	_I2C_GenerateSTOP
2500                     	xdef	_I2C_GenerateSTART
2501                     	xdef	_I2C_GeneralCallCmd
2502                     	xdef	_I2C_Cmd
2503                     	xdef	_I2C_Init
2504                     	xdef	_I2C_DeInit
2505                     	xref.b	c_lreg
2506                     	xref.b	c_x
2525                     	xref	c_sdivx
2526                     	xref	c_ludv
2527                     	xref	c_rtol
2528                     	xref	c_smul
2529                     	xref	c_lmul
2530                     	xref	c_lcmp
2531                     	xref	c_ltor
2532                     	end
