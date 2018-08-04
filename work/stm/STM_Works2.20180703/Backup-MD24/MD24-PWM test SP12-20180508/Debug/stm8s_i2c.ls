   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  44                     ; 67 void I2C_DeInit(void)
  44                     ; 68 {
  46                     	switch	.text
  47  0000               _I2C_DeInit:
  51                     ; 69   I2C->CR1 = I2C_CR1_RESET_VALUE;
  53  0000 725f5210      	clr	21008
  54                     ; 70   I2C->CR2 = I2C_CR2_RESET_VALUE;
  56  0004 725f5211      	clr	21009
  57                     ; 71   I2C->FREQR = I2C_FREQR_RESET_VALUE;
  59  0008 725f5212      	clr	21010
  60                     ; 72   I2C->OARL = I2C_OARL_RESET_VALUE;
  62  000c 725f5213      	clr	21011
  63                     ; 73   I2C->OARH = I2C_OARH_RESET_VALUE;
  65  0010 725f5214      	clr	21012
  66                     ; 74   I2C->ITR = I2C_ITR_RESET_VALUE;
  68  0014 725f521a      	clr	21018
  69                     ; 75   I2C->CCRL = I2C_CCRL_RESET_VALUE;
  71  0018 725f521b      	clr	21019
  72                     ; 76   I2C->CCRH = I2C_CCRH_RESET_VALUE;
  74  001c 725f521c      	clr	21020
  75                     ; 77   I2C->TRISER = I2C_TRISER_RESET_VALUE;
  77  0020 3502521d      	mov	21021,#2
  78                     ; 78 }
  81  0024 81            	ret
 261                     .const:	section	.text
 262  0000               L44:
 263  0000 00061a81      	dc.l	400001
 264  0004               L05:
 265  0004 000186a1      	dc.l	100001
 266  0008               L25:
 267  0008 000f4240      	dc.l	1000000
 268                     ; 96 void I2C_Init(uint32_t OutputClockFrequencyHz, uint16_t OwnAddress, 
 268                     ; 97               I2C_DutyCycle_TypeDef I2C_DutyCycle, I2C_Ack_TypeDef Ack, 
 268                     ; 98               I2C_AddMode_TypeDef AddMode, uint8_t InputClockFrequencyMHz )
 268                     ; 99 {
 269                     	switch	.text
 270  0025               _I2C_Init:
 272  0025 5209          	subw	sp,#9
 273       00000009      OFST:	set	9
 276                     ; 100   uint16_t result = 0x0004;
 278                     ; 101   uint16_t tmpval = 0;
 280                     ; 102   uint8_t tmpccrh = 0;
 282  0027 0f07          	clr	(OFST-2,sp)
 284                     ; 105   assert_param(IS_I2C_ACK_OK(Ack));
 286  0029 0d13          	tnz	(OFST+10,sp)
 287  002b 270c          	jreq	L21
 288  002d 7b13          	ld	a,(OFST+10,sp)
 289  002f a101          	cp	a,#1
 290  0031 2706          	jreq	L21
 291  0033 7b13          	ld	a,(OFST+10,sp)
 292  0035 a102          	cp	a,#2
 293  0037 2603          	jrne	L01
 294  0039               L21:
 295  0039 4f            	clr	a
 296  003a 2010          	jra	L41
 297  003c               L01:
 298  003c ae0069        	ldw	x,#105
 299  003f 89            	pushw	x
 300  0040 ae0000        	ldw	x,#0
 301  0043 89            	pushw	x
 302  0044 ae000c        	ldw	x,#L131
 303  0047 cd0000        	call	_assert_failed
 305  004a 5b04          	addw	sp,#4
 306  004c               L41:
 307                     ; 106   assert_param(IS_I2C_ADDMODE_OK(AddMode));
 309  004c 0d14          	tnz	(OFST+11,sp)
 310  004e 2706          	jreq	L02
 311  0050 7b14          	ld	a,(OFST+11,sp)
 312  0052 a180          	cp	a,#128
 313  0054 2603          	jrne	L61
 314  0056               L02:
 315  0056 4f            	clr	a
 316  0057 2010          	jra	L22
 317  0059               L61:
 318  0059 ae006a        	ldw	x,#106
 319  005c 89            	pushw	x
 320  005d ae0000        	ldw	x,#0
 321  0060 89            	pushw	x
 322  0061 ae000c        	ldw	x,#L131
 323  0064 cd0000        	call	_assert_failed
 325  0067 5b04          	addw	sp,#4
 326  0069               L22:
 327                     ; 107   assert_param(IS_I2C_OWN_ADDRESS_OK(OwnAddress));
 329  0069 1e10          	ldw	x,(OFST+7,sp)
 330  006b a30400        	cpw	x,#1024
 331  006e 2403          	jruge	L42
 332  0070 4f            	clr	a
 333  0071 2010          	jra	L62
 334  0073               L42:
 335  0073 ae006b        	ldw	x,#107
 336  0076 89            	pushw	x
 337  0077 ae0000        	ldw	x,#0
 338  007a 89            	pushw	x
 339  007b ae000c        	ldw	x,#L131
 340  007e cd0000        	call	_assert_failed
 342  0081 5b04          	addw	sp,#4
 343  0083               L62:
 344                     ; 108   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));  
 346  0083 0d12          	tnz	(OFST+9,sp)
 347  0085 2706          	jreq	L23
 348  0087 7b12          	ld	a,(OFST+9,sp)
 349  0089 a140          	cp	a,#64
 350  008b 2603          	jrne	L03
 351  008d               L23:
 352  008d 4f            	clr	a
 353  008e 2010          	jra	L43
 354  0090               L03:
 355  0090 ae006c        	ldw	x,#108
 356  0093 89            	pushw	x
 357  0094 ae0000        	ldw	x,#0
 358  0097 89            	pushw	x
 359  0098 ae000c        	ldw	x,#L131
 360  009b cd0000        	call	_assert_failed
 362  009e 5b04          	addw	sp,#4
 363  00a0               L43:
 364                     ; 109   assert_param(IS_I2C_INPUT_CLOCK_FREQ_OK(InputClockFrequencyMHz));
 366  00a0 0d15          	tnz	(OFST+12,sp)
 367  00a2 2709          	jreq	L63
 368  00a4 7b15          	ld	a,(OFST+12,sp)
 369  00a6 a111          	cp	a,#17
 370  00a8 2403          	jruge	L63
 371  00aa 4f            	clr	a
 372  00ab 2010          	jra	L04
 373  00ad               L63:
 374  00ad ae006d        	ldw	x,#109
 375  00b0 89            	pushw	x
 376  00b1 ae0000        	ldw	x,#0
 377  00b4 89            	pushw	x
 378  00b5 ae000c        	ldw	x,#L131
 379  00b8 cd0000        	call	_assert_failed
 381  00bb 5b04          	addw	sp,#4
 382  00bd               L04:
 383                     ; 110   assert_param(IS_I2C_OUTPUT_CLOCK_FREQ_OK(OutputClockFrequencyHz));
 385  00bd 96            	ldw	x,sp
 386  00be 1c000c        	addw	x,#OFST+3
 387  00c1 cd0000        	call	c_lzmp
 389  00c4 2712          	jreq	L24
 390  00c6 96            	ldw	x,sp
 391  00c7 1c000c        	addw	x,#OFST+3
 392  00ca cd0000        	call	c_ltor
 394  00cd ae0000        	ldw	x,#L44
 395  00d0 cd0000        	call	c_lcmp
 397  00d3 2403          	jruge	L24
 398  00d5 4f            	clr	a
 399  00d6 2010          	jra	L64
 400  00d8               L24:
 401  00d8 ae006e        	ldw	x,#110
 402  00db 89            	pushw	x
 403  00dc ae0000        	ldw	x,#0
 404  00df 89            	pushw	x
 405  00e0 ae000c        	ldw	x,#L131
 406  00e3 cd0000        	call	_assert_failed
 408  00e6 5b04          	addw	sp,#4
 409  00e8               L64:
 410                     ; 115   I2C->FREQR &= (uint8_t)(~I2C_FREQR_FREQ);
 412  00e8 c65212        	ld	a,21010
 413  00eb a4c0          	and	a,#192
 414  00ed c75212        	ld	21010,a
 415                     ; 117   I2C->FREQR |= InputClockFrequencyMHz;
 417  00f0 c65212        	ld	a,21010
 418  00f3 1a15          	or	a,(OFST+12,sp)
 419  00f5 c75212        	ld	21010,a
 420                     ; 121   I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 422  00f8 72115210      	bres	21008,#0
 423                     ; 124   I2C->CCRH &= (uint8_t)(~(I2C_CCRH_FS | I2C_CCRH_DUTY | I2C_CCRH_CCR));
 425  00fc c6521c        	ld	a,21020
 426  00ff a430          	and	a,#48
 427  0101 c7521c        	ld	21020,a
 428                     ; 125   I2C->CCRL &= (uint8_t)(~I2C_CCRL_CCR);
 430  0104 725f521b      	clr	21019
 431                     ; 128   if (OutputClockFrequencyHz > I2C_MAX_STANDARD_FREQ) /* FAST MODE */
 433  0108 96            	ldw	x,sp
 434  0109 1c000c        	addw	x,#OFST+3
 435  010c cd0000        	call	c_ltor
 437  010f ae0004        	ldw	x,#L05
 438  0112 cd0000        	call	c_lcmp
 440  0115 2403          	jruge	L45
 441  0117 cc01a4        	jp	L331
 442  011a               L45:
 443                     ; 131     tmpccrh = I2C_CCRH_FS;
 445  011a a680          	ld	a,#128
 446  011c 6b07          	ld	(OFST-2,sp),a
 448                     ; 133     if (I2C_DutyCycle == I2C_DUTYCYCLE_2)
 450  011e 0d12          	tnz	(OFST+9,sp)
 451  0120 2630          	jrne	L531
 452                     ; 136       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 3));
 454  0122 96            	ldw	x,sp
 455  0123 1c000c        	addw	x,#OFST+3
 456  0126 cd0000        	call	c_ltor
 458  0129 a603          	ld	a,#3
 459  012b cd0000        	call	c_smul
 461  012e 96            	ldw	x,sp
 462  012f 1c0001        	addw	x,#OFST-8
 463  0132 cd0000        	call	c_rtol
 466  0135 7b15          	ld	a,(OFST+12,sp)
 467  0137 b703          	ld	c_lreg+3,a
 468  0139 3f02          	clr	c_lreg+2
 469  013b 3f01          	clr	c_lreg+1
 470  013d 3f00          	clr	c_lreg
 471  013f ae0008        	ldw	x,#L25
 472  0142 cd0000        	call	c_lmul
 474  0145 96            	ldw	x,sp
 475  0146 1c0001        	addw	x,#OFST-8
 476  0149 cd0000        	call	c_ludv
 478  014c be02          	ldw	x,c_lreg+2
 479  014e 1f08          	ldw	(OFST-1,sp),x
 482  0150 2034          	jra	L731
 483  0152               L531:
 484                     ; 141       result = (uint16_t) ((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz * 25));
 486  0152 96            	ldw	x,sp
 487  0153 1c000c        	addw	x,#OFST+3
 488  0156 cd0000        	call	c_ltor
 490  0159 a619          	ld	a,#25
 491  015b cd0000        	call	c_smul
 493  015e 96            	ldw	x,sp
 494  015f 1c0001        	addw	x,#OFST-8
 495  0162 cd0000        	call	c_rtol
 498  0165 7b15          	ld	a,(OFST+12,sp)
 499  0167 b703          	ld	c_lreg+3,a
 500  0169 3f02          	clr	c_lreg+2
 501  016b 3f01          	clr	c_lreg+1
 502  016d 3f00          	clr	c_lreg
 503  016f ae0008        	ldw	x,#L25
 504  0172 cd0000        	call	c_lmul
 506  0175 96            	ldw	x,sp
 507  0176 1c0001        	addw	x,#OFST-8
 508  0179 cd0000        	call	c_ludv
 510  017c be02          	ldw	x,c_lreg+2
 511  017e 1f08          	ldw	(OFST-1,sp),x
 513                     ; 143       tmpccrh |= I2C_CCRH_DUTY;
 515  0180 7b07          	ld	a,(OFST-2,sp)
 516  0182 aa40          	or	a,#64
 517  0184 6b07          	ld	(OFST-2,sp),a
 519  0186               L731:
 520                     ; 147     if (result < (uint16_t)0x01)
 522  0186 1e08          	ldw	x,(OFST-1,sp)
 523  0188 2605          	jrne	L141
 524                     ; 150       result = (uint16_t)0x0001;
 526  018a ae0001        	ldw	x,#1
 527  018d 1f08          	ldw	(OFST-1,sp),x
 529  018f               L141:
 530                     ; 156     tmpval = ((InputClockFrequencyMHz * 3) / 10) + 1;
 532  018f 7b15          	ld	a,(OFST+12,sp)
 533  0191 97            	ld	xl,a
 534  0192 a603          	ld	a,#3
 535  0194 42            	mul	x,a
 536  0195 a60a          	ld	a,#10
 537  0197 cd0000        	call	c_sdivx
 539  019a 5c            	incw	x
 540  019b 1f05          	ldw	(OFST-4,sp),x
 542                     ; 157     I2C->TRISER = (uint8_t)tmpval;
 544  019d 7b06          	ld	a,(OFST-3,sp)
 545  019f c7521d        	ld	21021,a
 547  01a2 2043          	jra	L341
 548  01a4               L331:
 549                     ; 164     result = (uint16_t)((InputClockFrequencyMHz * 1000000) / (OutputClockFrequencyHz << (uint8_t)1));
 551  01a4 96            	ldw	x,sp
 552  01a5 1c000c        	addw	x,#OFST+3
 553  01a8 cd0000        	call	c_ltor
 555  01ab 3803          	sll	c_lreg+3
 556  01ad 3902          	rlc	c_lreg+2
 557  01af 3901          	rlc	c_lreg+1
 558  01b1 3900          	rlc	c_lreg
 559  01b3 96            	ldw	x,sp
 560  01b4 1c0001        	addw	x,#OFST-8
 561  01b7 cd0000        	call	c_rtol
 564  01ba 7b15          	ld	a,(OFST+12,sp)
 565  01bc b703          	ld	c_lreg+3,a
 566  01be 3f02          	clr	c_lreg+2
 567  01c0 3f01          	clr	c_lreg+1
 568  01c2 3f00          	clr	c_lreg
 569  01c4 ae0008        	ldw	x,#L25
 570  01c7 cd0000        	call	c_lmul
 572  01ca 96            	ldw	x,sp
 573  01cb 1c0001        	addw	x,#OFST-8
 574  01ce cd0000        	call	c_ludv
 576  01d1 be02          	ldw	x,c_lreg+2
 577  01d3 1f08          	ldw	(OFST-1,sp),x
 579                     ; 167     if (result < (uint16_t)0x0004)
 581  01d5 1e08          	ldw	x,(OFST-1,sp)
 582  01d7 a30004        	cpw	x,#4
 583  01da 2405          	jruge	L541
 584                     ; 170       result = (uint16_t)0x0004;
 586  01dc ae0004        	ldw	x,#4
 587  01df 1f08          	ldw	(OFST-1,sp),x
 589  01e1               L541:
 590                     ; 176     I2C->TRISER = (uint8_t)(InputClockFrequencyMHz + (uint8_t)1);
 592  01e1 7b15          	ld	a,(OFST+12,sp)
 593  01e3 4c            	inc	a
 594  01e4 c7521d        	ld	21021,a
 595  01e7               L341:
 596                     ; 181   I2C->CCRL = (uint8_t)result;
 598  01e7 7b09          	ld	a,(OFST+0,sp)
 599  01e9 c7521b        	ld	21019,a
 600                     ; 182   I2C->CCRH = (uint8_t)((uint8_t)((uint8_t)(result >> 8) & I2C_CCRH_CCR) | tmpccrh);
 602  01ec 7b08          	ld	a,(OFST-1,sp)
 603  01ee a40f          	and	a,#15
 604  01f0 1a07          	or	a,(OFST-2,sp)
 605  01f2 c7521c        	ld	21020,a
 606                     ; 185   I2C->CR1 |= I2C_CR1_PE;
 608  01f5 72105210      	bset	21008,#0
 609                     ; 188   I2C_AcknowledgeConfig(Ack);
 611  01f9 7b13          	ld	a,(OFST+10,sp)
 612  01fb cd031d        	call	_I2C_AcknowledgeConfig
 614                     ; 191   I2C->OARL = (uint8_t)(OwnAddress);
 616  01fe 7b11          	ld	a,(OFST+8,sp)
 617  0200 c75213        	ld	21011,a
 618                     ; 192   I2C->OARH = (uint8_t)((uint8_t)(AddMode | I2C_OARH_ADDCONF) |
 618                     ; 193                    (uint8_t)((OwnAddress & (uint16_t)0x0300) >> (uint8_t)7));
 620  0203 1e10          	ldw	x,(OFST+7,sp)
 621  0205 4f            	clr	a
 622  0206 01            	rrwa	x,a
 623  0207 48            	sll	a
 624  0208 59            	rlcw	x
 625  0209 01            	rrwa	x,a
 626  020a a406          	and	a,#6
 627  020c 5f            	clrw	x
 628  020d 6b04          	ld	(OFST-5,sp),a
 630  020f 7b14          	ld	a,(OFST+11,sp)
 631  0211 aa40          	or	a,#64
 632  0213 1a04          	or	a,(OFST-5,sp)
 633  0215 c75214        	ld	21012,a
 634                     ; 194 }
 637  0218 5b09          	addw	sp,#9
 638  021a 81            	ret
 694                     ; 202 void I2C_Cmd(FunctionalState NewState)
 694                     ; 203 {
 695                     	switch	.text
 696  021b               _I2C_Cmd:
 698  021b 88            	push	a
 699       00000000      OFST:	set	0
 702                     ; 205   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 704  021c 4d            	tnz	a
 705  021d 2704          	jreq	L26
 706  021f a101          	cp	a,#1
 707  0221 2603          	jrne	L06
 708  0223               L26:
 709  0223 4f            	clr	a
 710  0224 2010          	jra	L46
 711  0226               L06:
 712  0226 ae00cd        	ldw	x,#205
 713  0229 89            	pushw	x
 714  022a ae0000        	ldw	x,#0
 715  022d 89            	pushw	x
 716  022e ae000c        	ldw	x,#L131
 717  0231 cd0000        	call	_assert_failed
 719  0234 5b04          	addw	sp,#4
 720  0236               L46:
 721                     ; 207   if (NewState != DISABLE)
 723  0236 0d01          	tnz	(OFST+1,sp)
 724  0238 2706          	jreq	L571
 725                     ; 210     I2C->CR1 |= I2C_CR1_PE;
 727  023a 72105210      	bset	21008,#0
 729  023e 2004          	jra	L771
 730  0240               L571:
 731                     ; 215     I2C->CR1 &= (uint8_t)(~I2C_CR1_PE);
 733  0240 72115210      	bres	21008,#0
 734  0244               L771:
 735                     ; 217 }
 738  0244 84            	pop	a
 739  0245 81            	ret
 775                     ; 225 void I2C_GeneralCallCmd(FunctionalState NewState)
 775                     ; 226 {
 776                     	switch	.text
 777  0246               _I2C_GeneralCallCmd:
 779  0246 88            	push	a
 780       00000000      OFST:	set	0
 783                     ; 228   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 785  0247 4d            	tnz	a
 786  0248 2704          	jreq	L27
 787  024a a101          	cp	a,#1
 788  024c 2603          	jrne	L07
 789  024e               L27:
 790  024e 4f            	clr	a
 791  024f 2010          	jra	L47
 792  0251               L07:
 793  0251 ae00e4        	ldw	x,#228
 794  0254 89            	pushw	x
 795  0255 ae0000        	ldw	x,#0
 796  0258 89            	pushw	x
 797  0259 ae000c        	ldw	x,#L131
 798  025c cd0000        	call	_assert_failed
 800  025f 5b04          	addw	sp,#4
 801  0261               L47:
 802                     ; 230   if (NewState != DISABLE)
 804  0261 0d01          	tnz	(OFST+1,sp)
 805  0263 2706          	jreq	L712
 806                     ; 233     I2C->CR1 |= I2C_CR1_ENGC;
 808  0265 721c5210      	bset	21008,#6
 810  0269 2004          	jra	L122
 811  026b               L712:
 812                     ; 238     I2C->CR1 &= (uint8_t)(~I2C_CR1_ENGC);
 814  026b 721d5210      	bres	21008,#6
 815  026f               L122:
 816                     ; 240 }
 819  026f 84            	pop	a
 820  0270 81            	ret
 856                     ; 250 void I2C_GenerateSTART(FunctionalState NewState)
 856                     ; 251 {
 857                     	switch	.text
 858  0271               _I2C_GenerateSTART:
 860  0271 88            	push	a
 861       00000000      OFST:	set	0
 864                     ; 253   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 866  0272 4d            	tnz	a
 867  0273 2704          	jreq	L201
 868  0275 a101          	cp	a,#1
 869  0277 2603          	jrne	L001
 870  0279               L201:
 871  0279 4f            	clr	a
 872  027a 2010          	jra	L401
 873  027c               L001:
 874  027c ae00fd        	ldw	x,#253
 875  027f 89            	pushw	x
 876  0280 ae0000        	ldw	x,#0
 877  0283 89            	pushw	x
 878  0284 ae000c        	ldw	x,#L131
 879  0287 cd0000        	call	_assert_failed
 881  028a 5b04          	addw	sp,#4
 882  028c               L401:
 883                     ; 255   if (NewState != DISABLE)
 885  028c 0d01          	tnz	(OFST+1,sp)
 886  028e 2706          	jreq	L142
 887                     ; 258     I2C->CR2 |= I2C_CR2_START;
 889  0290 72105211      	bset	21009,#0
 891  0294 2004          	jra	L342
 892  0296               L142:
 893                     ; 263     I2C->CR2 &= (uint8_t)(~I2C_CR2_START);
 895  0296 72115211      	bres	21009,#0
 896  029a               L342:
 897                     ; 265 }
 900  029a 84            	pop	a
 901  029b 81            	ret
 937                     ; 273 void I2C_GenerateSTOP(FunctionalState NewState)
 937                     ; 274 {
 938                     	switch	.text
 939  029c               _I2C_GenerateSTOP:
 941  029c 88            	push	a
 942       00000000      OFST:	set	0
 945                     ; 276   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 947  029d 4d            	tnz	a
 948  029e 2704          	jreq	L211
 949  02a0 a101          	cp	a,#1
 950  02a2 2603          	jrne	L011
 951  02a4               L211:
 952  02a4 4f            	clr	a
 953  02a5 2010          	jra	L411
 954  02a7               L011:
 955  02a7 ae0114        	ldw	x,#276
 956  02aa 89            	pushw	x
 957  02ab ae0000        	ldw	x,#0
 958  02ae 89            	pushw	x
 959  02af ae000c        	ldw	x,#L131
 960  02b2 cd0000        	call	_assert_failed
 962  02b5 5b04          	addw	sp,#4
 963  02b7               L411:
 964                     ; 278   if (NewState != DISABLE)
 966  02b7 0d01          	tnz	(OFST+1,sp)
 967  02b9 2706          	jreq	L362
 968                     ; 281     I2C->CR2 |= I2C_CR2_STOP;
 970  02bb 72125211      	bset	21009,#1
 972  02bf 2004          	jra	L562
 973  02c1               L362:
 974                     ; 286     I2C->CR2 &= (uint8_t)(~I2C_CR2_STOP);
 976  02c1 72135211      	bres	21009,#1
 977  02c5               L562:
 978                     ; 288 }
 981  02c5 84            	pop	a
 982  02c6 81            	ret
1019                     ; 296 void I2C_SoftwareResetCmd(FunctionalState NewState)
1019                     ; 297 {
1020                     	switch	.text
1021  02c7               _I2C_SoftwareResetCmd:
1023  02c7 88            	push	a
1024       00000000      OFST:	set	0
1027                     ; 299   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1029  02c8 4d            	tnz	a
1030  02c9 2704          	jreq	L221
1031  02cb a101          	cp	a,#1
1032  02cd 2603          	jrne	L021
1033  02cf               L221:
1034  02cf 4f            	clr	a
1035  02d0 2010          	jra	L421
1036  02d2               L021:
1037  02d2 ae012b        	ldw	x,#299
1038  02d5 89            	pushw	x
1039  02d6 ae0000        	ldw	x,#0
1040  02d9 89            	pushw	x
1041  02da ae000c        	ldw	x,#L131
1042  02dd cd0000        	call	_assert_failed
1044  02e0 5b04          	addw	sp,#4
1045  02e2               L421:
1046                     ; 301   if (NewState != DISABLE)
1048  02e2 0d01          	tnz	(OFST+1,sp)
1049  02e4 2706          	jreq	L503
1050                     ; 304     I2C->CR2 |= I2C_CR2_SWRST;
1052  02e6 721e5211      	bset	21009,#7
1054  02ea 2004          	jra	L703
1055  02ec               L503:
1056                     ; 309     I2C->CR2 &= (uint8_t)(~I2C_CR2_SWRST);
1058  02ec 721f5211      	bres	21009,#7
1059  02f0               L703:
1060                     ; 311 }
1063  02f0 84            	pop	a
1064  02f1 81            	ret
1101                     ; 320 void I2C_StretchClockCmd(FunctionalState NewState)
1101                     ; 321 {
1102                     	switch	.text
1103  02f2               _I2C_StretchClockCmd:
1105  02f2 88            	push	a
1106       00000000      OFST:	set	0
1109                     ; 323   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1111  02f3 4d            	tnz	a
1112  02f4 2704          	jreq	L231
1113  02f6 a101          	cp	a,#1
1114  02f8 2603          	jrne	L031
1115  02fa               L231:
1116  02fa 4f            	clr	a
1117  02fb 2010          	jra	L431
1118  02fd               L031:
1119  02fd ae0143        	ldw	x,#323
1120  0300 89            	pushw	x
1121  0301 ae0000        	ldw	x,#0
1122  0304 89            	pushw	x
1123  0305 ae000c        	ldw	x,#L131
1124  0308 cd0000        	call	_assert_failed
1126  030b 5b04          	addw	sp,#4
1127  030d               L431:
1128                     ; 325   if (NewState != DISABLE)
1130  030d 0d01          	tnz	(OFST+1,sp)
1131  030f 2706          	jreq	L723
1132                     ; 328     I2C->CR1 &= (uint8_t)(~I2C_CR1_NOSTRETCH);
1134  0311 721f5210      	bres	21008,#7
1136  0315 2004          	jra	L133
1137  0317               L723:
1138                     ; 334     I2C->CR1 |= I2C_CR1_NOSTRETCH;
1140  0317 721e5210      	bset	21008,#7
1141  031b               L133:
1142                     ; 336 }
1145  031b 84            	pop	a
1146  031c 81            	ret
1183                     ; 345 void I2C_AcknowledgeConfig(I2C_Ack_TypeDef Ack)
1183                     ; 346 {
1184                     	switch	.text
1185  031d               _I2C_AcknowledgeConfig:
1187  031d 88            	push	a
1188       00000000      OFST:	set	0
1191                     ; 348   assert_param(IS_I2C_ACK_OK(Ack));
1193  031e 4d            	tnz	a
1194  031f 2708          	jreq	L241
1195  0321 a101          	cp	a,#1
1196  0323 2704          	jreq	L241
1197  0325 a102          	cp	a,#2
1198  0327 2603          	jrne	L041
1199  0329               L241:
1200  0329 4f            	clr	a
1201  032a 2010          	jra	L441
1202  032c               L041:
1203  032c ae015c        	ldw	x,#348
1204  032f 89            	pushw	x
1205  0330 ae0000        	ldw	x,#0
1206  0333 89            	pushw	x
1207  0334 ae000c        	ldw	x,#L131
1208  0337 cd0000        	call	_assert_failed
1210  033a 5b04          	addw	sp,#4
1211  033c               L441:
1212                     ; 350   if (Ack == I2C_ACK_NONE)
1214  033c 0d01          	tnz	(OFST+1,sp)
1215  033e 2606          	jrne	L153
1216                     ; 353     I2C->CR2 &= (uint8_t)(~I2C_CR2_ACK);
1218  0340 72155211      	bres	21009,#2
1220  0344 2014          	jra	L353
1221  0346               L153:
1222                     ; 358     I2C->CR2 |= I2C_CR2_ACK;
1224  0346 72145211      	bset	21009,#2
1225                     ; 360     if (Ack == I2C_ACK_CURR)
1227  034a 7b01          	ld	a,(OFST+1,sp)
1228  034c a101          	cp	a,#1
1229  034e 2606          	jrne	L553
1230                     ; 363       I2C->CR2 &= (uint8_t)(~I2C_CR2_POS);
1232  0350 72175211      	bres	21009,#3
1234  0354 2004          	jra	L353
1235  0356               L553:
1236                     ; 368       I2C->CR2 |= I2C_CR2_POS;
1238  0356 72165211      	bset	21009,#3
1239  035a               L353:
1240                     ; 371 }
1243  035a 84            	pop	a
1244  035b 81            	ret
1317                     ; 381 void I2C_ITConfig(I2C_IT_TypeDef I2C_IT, FunctionalState NewState)
1317                     ; 382 {
1318                     	switch	.text
1319  035c               _I2C_ITConfig:
1321  035c 89            	pushw	x
1322       00000000      OFST:	set	0
1325                     ; 384   assert_param(IS_I2C_INTERRUPT_OK(I2C_IT));
1327  035d 9e            	ld	a,xh
1328  035e a101          	cp	a,#1
1329  0360 271e          	jreq	L251
1330  0362 9e            	ld	a,xh
1331  0363 a102          	cp	a,#2
1332  0365 2719          	jreq	L251
1333  0367 9e            	ld	a,xh
1334  0368 a104          	cp	a,#4
1335  036a 2714          	jreq	L251
1336  036c 9e            	ld	a,xh
1337  036d a103          	cp	a,#3
1338  036f 270f          	jreq	L251
1339  0371 9e            	ld	a,xh
1340  0372 a105          	cp	a,#5
1341  0374 270a          	jreq	L251
1342  0376 9e            	ld	a,xh
1343  0377 a106          	cp	a,#6
1344  0379 2705          	jreq	L251
1345  037b 9e            	ld	a,xh
1346  037c a107          	cp	a,#7
1347  037e 2603          	jrne	L051
1348  0380               L251:
1349  0380 4f            	clr	a
1350  0381 2010          	jra	L451
1351  0383               L051:
1352  0383 ae0180        	ldw	x,#384
1353  0386 89            	pushw	x
1354  0387 ae0000        	ldw	x,#0
1355  038a 89            	pushw	x
1356  038b ae000c        	ldw	x,#L131
1357  038e cd0000        	call	_assert_failed
1359  0391 5b04          	addw	sp,#4
1360  0393               L451:
1361                     ; 385   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1363  0393 0d02          	tnz	(OFST+2,sp)
1364  0395 2706          	jreq	L061
1365  0397 7b02          	ld	a,(OFST+2,sp)
1366  0399 a101          	cp	a,#1
1367  039b 2603          	jrne	L651
1368  039d               L061:
1369  039d 4f            	clr	a
1370  039e 2010          	jra	L261
1371  03a0               L651:
1372  03a0 ae0181        	ldw	x,#385
1373  03a3 89            	pushw	x
1374  03a4 ae0000        	ldw	x,#0
1375  03a7 89            	pushw	x
1376  03a8 ae000c        	ldw	x,#L131
1377  03ab cd0000        	call	_assert_failed
1379  03ae 5b04          	addw	sp,#4
1380  03b0               L261:
1381                     ; 387   if (NewState != DISABLE)
1383  03b0 0d02          	tnz	(OFST+2,sp)
1384  03b2 270a          	jreq	L514
1385                     ; 390     I2C->ITR |= (uint8_t)I2C_IT;
1387  03b4 c6521a        	ld	a,21018
1388  03b7 1a01          	or	a,(OFST+1,sp)
1389  03b9 c7521a        	ld	21018,a
1391  03bc 2009          	jra	L714
1392  03be               L514:
1393                     ; 395     I2C->ITR &= (uint8_t)(~(uint8_t)I2C_IT);
1395  03be 7b01          	ld	a,(OFST+1,sp)
1396  03c0 43            	cpl	a
1397  03c1 c4521a        	and	a,21018
1398  03c4 c7521a        	ld	21018,a
1399  03c7               L714:
1400                     ; 397 }
1403  03c7 85            	popw	x
1404  03c8 81            	ret
1441                     ; 405 void I2C_FastModeDutyCycleConfig(I2C_DutyCycle_TypeDef I2C_DutyCycle)
1441                     ; 406 {
1442                     	switch	.text
1443  03c9               _I2C_FastModeDutyCycleConfig:
1445  03c9 88            	push	a
1446       00000000      OFST:	set	0
1449                     ; 408   assert_param(IS_I2C_DUTYCYCLE_OK(I2C_DutyCycle));
1451  03ca 4d            	tnz	a
1452  03cb 2704          	jreq	L071
1453  03cd a140          	cp	a,#64
1454  03cf 2603          	jrne	L661
1455  03d1               L071:
1456  03d1 4f            	clr	a
1457  03d2 2010          	jra	L271
1458  03d4               L661:
1459  03d4 ae0198        	ldw	x,#408
1460  03d7 89            	pushw	x
1461  03d8 ae0000        	ldw	x,#0
1462  03db 89            	pushw	x
1463  03dc ae000c        	ldw	x,#L131
1464  03df cd0000        	call	_assert_failed
1466  03e2 5b04          	addw	sp,#4
1467  03e4               L271:
1468                     ; 410   if (I2C_DutyCycle == I2C_DUTYCYCLE_16_9)
1470  03e4 7b01          	ld	a,(OFST+1,sp)
1471  03e6 a140          	cp	a,#64
1472  03e8 2606          	jrne	L734
1473                     ; 413     I2C->CCRH |= I2C_CCRH_DUTY;
1475  03ea 721c521c      	bset	21020,#6
1477  03ee 2004          	jra	L144
1478  03f0               L734:
1479                     ; 418     I2C->CCRH &= (uint8_t)(~I2C_CCRH_DUTY);
1481  03f0 721d521c      	bres	21020,#6
1482  03f4               L144:
1483                     ; 420 }
1486  03f4 84            	pop	a
1487  03f5 81            	ret
1510                     ; 427 uint8_t I2C_ReceiveData(void)
1510                     ; 428 {
1511                     	switch	.text
1512  03f6               _I2C_ReceiveData:
1516                     ; 430   return ((uint8_t)I2C->DR);
1518  03f6 c65216        	ld	a,21014
1521  03f9 81            	ret
1587                     ; 440 void I2C_Send7bitAddress(uint8_t Address, I2C_Direction_TypeDef Direction)
1587                     ; 441 {
1588                     	switch	.text
1589  03fa               _I2C_Send7bitAddress:
1591  03fa 89            	pushw	x
1592       00000000      OFST:	set	0
1595                     ; 443   assert_param(IS_I2C_ADDRESS_OK(Address));
1597  03fb 9e            	ld	a,xh
1598  03fc a501          	bcp	a,#1
1599  03fe 2603          	jrne	L002
1600  0400 4f            	clr	a
1601  0401 2010          	jra	L202
1602  0403               L002:
1603  0403 ae01bb        	ldw	x,#443
1604  0406 89            	pushw	x
1605  0407 ae0000        	ldw	x,#0
1606  040a 89            	pushw	x
1607  040b ae000c        	ldw	x,#L131
1608  040e cd0000        	call	_assert_failed
1610  0411 5b04          	addw	sp,#4
1611  0413               L202:
1612                     ; 444   assert_param(IS_I2C_DIRECTION_OK(Direction));
1614  0413 0d02          	tnz	(OFST+2,sp)
1615  0415 2706          	jreq	L602
1616  0417 7b02          	ld	a,(OFST+2,sp)
1617  0419 a101          	cp	a,#1
1618  041b 2603          	jrne	L402
1619  041d               L602:
1620  041d 4f            	clr	a
1621  041e 2010          	jra	L012
1622  0420               L402:
1623  0420 ae01bc        	ldw	x,#444
1624  0423 89            	pushw	x
1625  0424 ae0000        	ldw	x,#0
1626  0427 89            	pushw	x
1627  0428 ae000c        	ldw	x,#L131
1628  042b cd0000        	call	_assert_failed
1630  042e 5b04          	addw	sp,#4
1631  0430               L012:
1632                     ; 447   Address &= (uint8_t)0xFE;
1634  0430 7b01          	ld	a,(OFST+1,sp)
1635  0432 a4fe          	and	a,#254
1636  0434 6b01          	ld	(OFST+1,sp),a
1637                     ; 450   I2C->DR = (uint8_t)(Address | (uint8_t)Direction);
1639  0436 7b01          	ld	a,(OFST+1,sp)
1640  0438 1a02          	or	a,(OFST+2,sp)
1641  043a c75216        	ld	21014,a
1642                     ; 451 }
1645  043d 85            	popw	x
1646  043e 81            	ret
1680                     ; 458 void I2C_SendData(uint8_t Data)
1680                     ; 459 {
1681                     	switch	.text
1682  043f               _I2C_SendData:
1686                     ; 461   I2C->DR = Data;
1688  043f c75216        	ld	21014,a
1689                     ; 462 }
1692  0442 81            	ret
1917                     ; 578 ErrorStatus I2C_CheckEvent(I2C_Event_TypeDef I2C_Event)
1917                     ; 579 {
1918                     	switch	.text
1919  0443               _I2C_CheckEvent:
1921  0443 89            	pushw	x
1922  0444 5206          	subw	sp,#6
1923       00000006      OFST:	set	6
1926                     ; 580   __IO uint16_t lastevent = 0x00;
1928  0446 5f            	clrw	x
1929  0447 1f04          	ldw	(OFST-2,sp),x
1931                     ; 581   uint8_t flag1 = 0x00 ;
1933                     ; 582   uint8_t flag2 = 0x00;
1935                     ; 583   ErrorStatus status = ERROR;
1937                     ; 586   assert_param(IS_I2C_EVENT_OK(I2C_Event));
1939  0449 1e07          	ldw	x,(OFST+1,sp)
1940  044b a30682        	cpw	x,#1666
1941  044e 2769          	jreq	L022
1942  0450 1e07          	ldw	x,(OFST+1,sp)
1943  0452 a30202        	cpw	x,#514
1944  0455 2762          	jreq	L022
1945  0457 1e07          	ldw	x,(OFST+1,sp)
1946  0459 a31200        	cpw	x,#4608
1947  045c 275b          	jreq	L022
1948  045e 1e07          	ldw	x,(OFST+1,sp)
1949  0460 a30240        	cpw	x,#576
1950  0463 2754          	jreq	L022
1951  0465 1e07          	ldw	x,(OFST+1,sp)
1952  0467 a30350        	cpw	x,#848
1953  046a 274d          	jreq	L022
1954  046c 1e07          	ldw	x,(OFST+1,sp)
1955  046e a30684        	cpw	x,#1668
1956  0471 2746          	jreq	L022
1957  0473 1e07          	ldw	x,(OFST+1,sp)
1958  0475 a30794        	cpw	x,#1940
1959  0478 273f          	jreq	L022
1960  047a 1e07          	ldw	x,(OFST+1,sp)
1961  047c a30004        	cpw	x,#4
1962  047f 2738          	jreq	L022
1963  0481 1e07          	ldw	x,(OFST+1,sp)
1964  0483 a30010        	cpw	x,#16
1965  0486 2731          	jreq	L022
1966  0488 1e07          	ldw	x,(OFST+1,sp)
1967  048a a30301        	cpw	x,#769
1968  048d 272a          	jreq	L022
1969  048f 1e07          	ldw	x,(OFST+1,sp)
1970  0491 a30782        	cpw	x,#1922
1971  0494 2723          	jreq	L022
1972  0496 1e07          	ldw	x,(OFST+1,sp)
1973  0498 a30302        	cpw	x,#770
1974  049b 271c          	jreq	L022
1975  049d 1e07          	ldw	x,(OFST+1,sp)
1976  049f a30340        	cpw	x,#832
1977  04a2 2715          	jreq	L022
1978  04a4 1e07          	ldw	x,(OFST+1,sp)
1979  04a6 a30784        	cpw	x,#1924
1980  04a9 270e          	jreq	L022
1981  04ab 1e07          	ldw	x,(OFST+1,sp)
1982  04ad a30780        	cpw	x,#1920
1983  04b0 2707          	jreq	L022
1984  04b2 1e07          	ldw	x,(OFST+1,sp)
1985  04b4 a30308        	cpw	x,#776
1986  04b7 2603          	jrne	L612
1987  04b9               L022:
1988  04b9 4f            	clr	a
1989  04ba 2010          	jra	L222
1990  04bc               L612:
1991  04bc ae024a        	ldw	x,#586
1992  04bf 89            	pushw	x
1993  04c0 ae0000        	ldw	x,#0
1994  04c3 89            	pushw	x
1995  04c4 ae000c        	ldw	x,#L131
1996  04c7 cd0000        	call	_assert_failed
1998  04ca 5b04          	addw	sp,#4
1999  04cc               L222:
2000                     ; 588   if (I2C_Event == I2C_EVENT_SLAVE_ACK_FAILURE)
2002  04cc 1e07          	ldw	x,(OFST+1,sp)
2003  04ce a30004        	cpw	x,#4
2004  04d1 260b          	jrne	L336
2005                     ; 590     lastevent = I2C->SR2 & I2C_SR2_AF;
2007  04d3 c65218        	ld	a,21016
2008  04d6 a404          	and	a,#4
2009  04d8 5f            	clrw	x
2010  04d9 97            	ld	xl,a
2011  04da 1f04          	ldw	(OFST-2,sp),x
2014  04dc 201f          	jra	L536
2015  04de               L336:
2016                     ; 594     flag1 = I2C->SR1;
2018  04de c65217        	ld	a,21015
2019  04e1 6b03          	ld	(OFST-3,sp),a
2021                     ; 595     flag2 = I2C->SR3;
2023  04e3 c65219        	ld	a,21017
2024  04e6 6b06          	ld	(OFST+0,sp),a
2026                     ; 596     lastevent = ((uint16_t)((uint16_t)flag2 << (uint16_t)8) | (uint16_t)flag1);
2028  04e8 7b03          	ld	a,(OFST-3,sp)
2029  04ea 5f            	clrw	x
2030  04eb 97            	ld	xl,a
2031  04ec 1f01          	ldw	(OFST-5,sp),x
2033  04ee 7b06          	ld	a,(OFST+0,sp)
2034  04f0 5f            	clrw	x
2035  04f1 97            	ld	xl,a
2036  04f2 4f            	clr	a
2037  04f3 02            	rlwa	x,a
2038  04f4 01            	rrwa	x,a
2039  04f5 1a02          	or	a,(OFST-4,sp)
2040  04f7 01            	rrwa	x,a
2041  04f8 1a01          	or	a,(OFST-5,sp)
2042  04fa 01            	rrwa	x,a
2043  04fb 1f04          	ldw	(OFST-2,sp),x
2045  04fd               L536:
2046                     ; 599   if (((uint16_t)lastevent & (uint16_t)I2C_Event) == (uint16_t)I2C_Event)
2048  04fd 1e04          	ldw	x,(OFST-2,sp)
2049  04ff 01            	rrwa	x,a
2050  0500 1408          	and	a,(OFST+2,sp)
2051  0502 01            	rrwa	x,a
2052  0503 1407          	and	a,(OFST+1,sp)
2053  0505 01            	rrwa	x,a
2054  0506 1307          	cpw	x,(OFST+1,sp)
2055  0508 2606          	jrne	L736
2056                     ; 602     status = SUCCESS;
2058  050a a601          	ld	a,#1
2059  050c 6b06          	ld	(OFST+0,sp),a
2062  050e 2002          	jra	L146
2063  0510               L736:
2064                     ; 607     status = ERROR;
2066  0510 0f06          	clr	(OFST+0,sp)
2068  0512               L146:
2069                     ; 611   return status;
2071  0512 7b06          	ld	a,(OFST+0,sp)
2074  0514 5b08          	addw	sp,#8
2075  0516 81            	ret
2128                     ; 628 I2C_Event_TypeDef I2C_GetLastEvent(void)
2128                     ; 629 {
2129                     	switch	.text
2130  0517               _I2C_GetLastEvent:
2132  0517 5206          	subw	sp,#6
2133       00000006      OFST:	set	6
2136                     ; 630   __IO uint16_t lastevent = 0;
2138  0519 5f            	clrw	x
2139  051a 1f05          	ldw	(OFST-1,sp),x
2141                     ; 631   uint16_t flag1 = 0;
2143                     ; 632   uint16_t flag2 = 0;
2145                     ; 634   if ((I2C->SR2 & I2C_SR2_AF) != 0x00)
2147  051c c65218        	ld	a,21016
2148  051f a504          	bcp	a,#4
2149  0521 2707          	jreq	L176
2150                     ; 636     lastevent = I2C_EVENT_SLAVE_ACK_FAILURE;
2152  0523 ae0004        	ldw	x,#4
2153  0526 1f05          	ldw	(OFST-1,sp),x
2156  0528 201b          	jra	L376
2157  052a               L176:
2158                     ; 641     flag1 = I2C->SR1;
2160  052a c65217        	ld	a,21015
2161  052d 5f            	clrw	x
2162  052e 97            	ld	xl,a
2163  052f 1f01          	ldw	(OFST-5,sp),x
2165                     ; 642     flag2 = I2C->SR3;
2167  0531 c65219        	ld	a,21017
2168  0534 5f            	clrw	x
2169  0535 97            	ld	xl,a
2170  0536 1f03          	ldw	(OFST-3,sp),x
2172                     ; 645     lastevent = ((uint16_t)((uint16_t)flag2 << 8) | (uint16_t)flag1);
2174  0538 1e03          	ldw	x,(OFST-3,sp)
2175  053a 4f            	clr	a
2176  053b 02            	rlwa	x,a
2177  053c 01            	rrwa	x,a
2178  053d 1a02          	or	a,(OFST-4,sp)
2179  053f 01            	rrwa	x,a
2180  0540 1a01          	or	a,(OFST-5,sp)
2181  0542 01            	rrwa	x,a
2182  0543 1f05          	ldw	(OFST-1,sp),x
2184  0545               L376:
2185                     ; 648   return (I2C_Event_TypeDef)lastevent;
2187  0545 1e05          	ldw	x,(OFST-1,sp)
2190  0547 5b06          	addw	sp,#6
2191  0549 81            	ret
2407                     ; 679 FlagStatus I2C_GetFlagStatus(I2C_Flag_TypeDef I2C_Flag)
2407                     ; 680 {
2408                     	switch	.text
2409  054a               _I2C_GetFlagStatus:
2411  054a 89            	pushw	x
2412  054b 89            	pushw	x
2413       00000002      OFST:	set	2
2416                     ; 681   uint8_t tempreg = 0;
2418  054c 0f02          	clr	(OFST+0,sp)
2420                     ; 682   uint8_t regindex = 0;
2422                     ; 683   FlagStatus bitstatus = RESET;
2424                     ; 686   assert_param(IS_I2C_FLAG_OK(I2C_Flag));
2426  054e a30180        	cpw	x,#384
2427  0551 274b          	jreq	L232
2428  0553 a30140        	cpw	x,#320
2429  0556 2746          	jreq	L232
2430  0558 a30110        	cpw	x,#272
2431  055b 2741          	jreq	L232
2432  055d a30108        	cpw	x,#264
2433  0560 273c          	jreq	L232
2434  0562 a30104        	cpw	x,#260
2435  0565 2737          	jreq	L232
2436  0567 a30102        	cpw	x,#258
2437  056a 2732          	jreq	L232
2438  056c a30101        	cpw	x,#257
2439  056f 272d          	jreq	L232
2440  0571 a30220        	cpw	x,#544
2441  0574 2728          	jreq	L232
2442  0576 a30208        	cpw	x,#520
2443  0579 2723          	jreq	L232
2444  057b a30204        	cpw	x,#516
2445  057e 271e          	jreq	L232
2446  0580 a30202        	cpw	x,#514
2447  0583 2719          	jreq	L232
2448  0585 a30201        	cpw	x,#513
2449  0588 2714          	jreq	L232
2450  058a a30310        	cpw	x,#784
2451  058d 270f          	jreq	L232
2452  058f a30304        	cpw	x,#772
2453  0592 270a          	jreq	L232
2454  0594 a30302        	cpw	x,#770
2455  0597 2705          	jreq	L232
2456  0599 a30301        	cpw	x,#769
2457  059c 2603          	jrne	L032
2458  059e               L232:
2459  059e 4f            	clr	a
2460  059f 2010          	jra	L432
2461  05a1               L032:
2462  05a1 ae02ae        	ldw	x,#686
2463  05a4 89            	pushw	x
2464  05a5 ae0000        	ldw	x,#0
2465  05a8 89            	pushw	x
2466  05a9 ae000c        	ldw	x,#L131
2467  05ac cd0000        	call	_assert_failed
2469  05af 5b04          	addw	sp,#4
2470  05b1               L432:
2471                     ; 689   regindex = (uint8_t)((uint16_t)I2C_Flag >> 8);
2473  05b1 7b03          	ld	a,(OFST+1,sp)
2474  05b3 6b01          	ld	(OFST-1,sp),a
2476                     ; 691   switch (regindex)
2478  05b5 7b01          	ld	a,(OFST-1,sp)
2480                     ; 708     default:
2480                     ; 709       break;
2481  05b7 4a            	dec	a
2482  05b8 2708          	jreq	L576
2483  05ba 4a            	dec	a
2484  05bb 270c          	jreq	L776
2485  05bd 4a            	dec	a
2486  05be 2710          	jreq	L107
2487  05c0 2013          	jra	L5101
2488  05c2               L576:
2489                     ; 694     case 0x01:
2489                     ; 695       tempreg = (uint8_t)I2C->SR1;
2491  05c2 c65217        	ld	a,21015
2492  05c5 6b02          	ld	(OFST+0,sp),a
2494                     ; 696       break;
2496  05c7 200c          	jra	L5101
2497  05c9               L776:
2498                     ; 699     case 0x02:
2498                     ; 700       tempreg = (uint8_t)I2C->SR2;
2500  05c9 c65218        	ld	a,21016
2501  05cc 6b02          	ld	(OFST+0,sp),a
2503                     ; 701       break;
2505  05ce 2005          	jra	L5101
2506  05d0               L107:
2507                     ; 704     case 0x03:
2507                     ; 705       tempreg = (uint8_t)I2C->SR3;
2509  05d0 c65219        	ld	a,21017
2510  05d3 6b02          	ld	(OFST+0,sp),a
2512                     ; 706       break;
2514  05d5               L307:
2515                     ; 708     default:
2515                     ; 709       break;
2517  05d5               L5101:
2518                     ; 713   if ((tempreg & (uint8_t)I2C_Flag ) != 0)
2520  05d5 7b04          	ld	a,(OFST+2,sp)
2521  05d7 1502          	bcp	a,(OFST+0,sp)
2522  05d9 2706          	jreq	L7101
2523                     ; 716     bitstatus = SET;
2525  05db a601          	ld	a,#1
2526  05dd 6b02          	ld	(OFST+0,sp),a
2529  05df 2002          	jra	L1201
2530  05e1               L7101:
2531                     ; 721     bitstatus = RESET;
2533  05e1 0f02          	clr	(OFST+0,sp)
2535  05e3               L1201:
2536                     ; 724   return bitstatus;
2538  05e3 7b02          	ld	a,(OFST+0,sp)
2541  05e5 5b04          	addw	sp,#4
2542  05e7 81            	ret
2587                     ; 759 void I2C_ClearFlag(I2C_Flag_TypeDef I2C_FLAG)
2587                     ; 760 {
2588                     	switch	.text
2589  05e8               _I2C_ClearFlag:
2591  05e8 89            	pushw	x
2592  05e9 89            	pushw	x
2593       00000002      OFST:	set	2
2596                     ; 761   uint16_t flagpos = 0;
2598                     ; 763   assert_param(IS_I2C_CLEAR_FLAG_OK(I2C_FLAG));
2600  05ea 01            	rrwa	x,a
2601  05eb 9f            	ld	a,xl
2602  05ec a4fd          	and	a,#253
2603  05ee 97            	ld	xl,a
2604  05ef 4f            	clr	a
2605  05f0 02            	rlwa	x,a
2606  05f1 5d            	tnzw	x
2607  05f2 2607          	jrne	L042
2608  05f4 1e03          	ldw	x,(OFST+1,sp)
2609  05f6 2703          	jreq	L042
2610  05f8 4f            	clr	a
2611  05f9 2010          	jra	L242
2612  05fb               L042:
2613  05fb ae02fb        	ldw	x,#763
2614  05fe 89            	pushw	x
2615  05ff ae0000        	ldw	x,#0
2616  0602 89            	pushw	x
2617  0603 ae000c        	ldw	x,#L131
2618  0606 cd0000        	call	_assert_failed
2620  0609 5b04          	addw	sp,#4
2621  060b               L242:
2622                     ; 766   flagpos = (uint16_t)I2C_FLAG & FLAG_Mask;
2624  060b 7b03          	ld	a,(OFST+1,sp)
2625  060d 97            	ld	xl,a
2626  060e 7b04          	ld	a,(OFST+2,sp)
2627  0610 a4ff          	and	a,#255
2628  0612 5f            	clrw	x
2629  0613 02            	rlwa	x,a
2630  0614 1f01          	ldw	(OFST-1,sp),x
2631  0616 01            	rrwa	x,a
2633                     ; 768   I2C->SR2 = (uint8_t)((uint16_t)(~flagpos));
2635  0617 7b02          	ld	a,(OFST+0,sp)
2636  0619 43            	cpl	a
2637  061a c75218        	ld	21016,a
2638                     ; 769 }
2641  061d 5b04          	addw	sp,#4
2642  061f 81            	ret
2809                     ; 791 ITStatus I2C_GetITStatus(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2809                     ; 792 {
2810                     	switch	.text
2811  0620               _I2C_GetITStatus:
2813  0620 89            	pushw	x
2814  0621 5204          	subw	sp,#4
2815       00000004      OFST:	set	4
2818                     ; 793   ITStatus bitstatus = RESET;
2820                     ; 794   __IO uint8_t enablestatus = 0;
2822  0623 0f03          	clr	(OFST-1,sp)
2824                     ; 795   uint16_t tempregister = 0;
2826                     ; 798     assert_param(IS_I2C_ITPENDINGBIT_OK(I2C_ITPendingBit));
2828  0625 a31680        	cpw	x,#5760
2829  0628 2737          	jreq	L052
2830  062a a31640        	cpw	x,#5696
2831  062d 2732          	jreq	L052
2832  062f a31210        	cpw	x,#4624
2833  0632 272d          	jreq	L052
2834  0634 a31208        	cpw	x,#4616
2835  0637 2728          	jreq	L052
2836  0639 a31204        	cpw	x,#4612
2837  063c 2723          	jreq	L052
2838  063e a31202        	cpw	x,#4610
2839  0641 271e          	jreq	L052
2840  0643 a31201        	cpw	x,#4609
2841  0646 2719          	jreq	L052
2842  0648 a32220        	cpw	x,#8736
2843  064b 2714          	jreq	L052
2844  064d a32108        	cpw	x,#8456
2845  0650 270f          	jreq	L052
2846  0652 a32104        	cpw	x,#8452
2847  0655 270a          	jreq	L052
2848  0657 a32102        	cpw	x,#8450
2849  065a 2705          	jreq	L052
2850  065c a32101        	cpw	x,#8449
2851  065f 2603          	jrne	L642
2852  0661               L052:
2853  0661 4f            	clr	a
2854  0662 2010          	jra	L252
2855  0664               L642:
2856  0664 ae031e        	ldw	x,#798
2857  0667 89            	pushw	x
2858  0668 ae0000        	ldw	x,#0
2859  066b 89            	pushw	x
2860  066c ae000c        	ldw	x,#L131
2861  066f cd0000        	call	_assert_failed
2863  0672 5b04          	addw	sp,#4
2864  0674               L252:
2865                     ; 800   tempregister = (uint8_t)( ((uint16_t)((uint16_t)I2C_ITPendingBit & ITEN_Mask)) >> 8);
2867  0674 7b05          	ld	a,(OFST+1,sp)
2868  0676 a407          	and	a,#7
2869  0678 5f            	clrw	x
2870  0679 97            	ld	xl,a
2871  067a 1f01          	ldw	(OFST-3,sp),x
2873                     ; 803   enablestatus = (uint8_t)(I2C->ITR & ( uint8_t)tempregister);
2875  067c c6521a        	ld	a,21018
2876  067f 1402          	and	a,(OFST-2,sp)
2877  0681 6b03          	ld	(OFST-1,sp),a
2879                     ; 805   if ((uint16_t)((uint16_t)I2C_ITPendingBit & REGISTER_Mask) == REGISTER_SR1_Index)
2881  0683 7b05          	ld	a,(OFST+1,sp)
2882  0685 97            	ld	xl,a
2883  0686 7b06          	ld	a,(OFST+2,sp)
2884  0688 9f            	ld	a,xl
2885  0689 a430          	and	a,#48
2886  068b 97            	ld	xl,a
2887  068c 4f            	clr	a
2888  068d 02            	rlwa	x,a
2889  068e a30100        	cpw	x,#256
2890  0691 2615          	jrne	L3311
2891                     ; 808     if (((I2C->SR1 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2893  0693 c65217        	ld	a,21015
2894  0696 1506          	bcp	a,(OFST+2,sp)
2895  0698 270a          	jreq	L5311
2897  069a 0d03          	tnz	(OFST-1,sp)
2898  069c 2706          	jreq	L5311
2899                     ; 811       bitstatus = SET;
2901  069e a601          	ld	a,#1
2902  06a0 6b04          	ld	(OFST+0,sp),a
2905  06a2 2017          	jra	L1411
2906  06a4               L5311:
2907                     ; 816       bitstatus = RESET;
2909  06a4 0f04          	clr	(OFST+0,sp)
2911  06a6 2013          	jra	L1411
2912  06a8               L3311:
2913                     ; 822     if (((I2C->SR2 & (uint8_t)I2C_ITPendingBit) != RESET) && enablestatus)
2915  06a8 c65218        	ld	a,21016
2916  06ab 1506          	bcp	a,(OFST+2,sp)
2917  06ad 270a          	jreq	L3411
2919  06af 0d03          	tnz	(OFST-1,sp)
2920  06b1 2706          	jreq	L3411
2921                     ; 825       bitstatus = SET;
2923  06b3 a601          	ld	a,#1
2924  06b5 6b04          	ld	(OFST+0,sp),a
2927  06b7 2002          	jra	L1411
2928  06b9               L3411:
2929                     ; 830       bitstatus = RESET;
2931  06b9 0f04          	clr	(OFST+0,sp)
2933  06bb               L1411:
2934                     ; 834   return  bitstatus;
2936  06bb 7b04          	ld	a,(OFST+0,sp)
2939  06bd 5b06          	addw	sp,#6
2940  06bf 81            	ret
2986                     ; 871 void I2C_ClearITPendingBit(I2C_ITPendingBit_TypeDef I2C_ITPendingBit)
2986                     ; 872 {
2987                     	switch	.text
2988  06c0               _I2C_ClearITPendingBit:
2990  06c0 89            	pushw	x
2991  06c1 89            	pushw	x
2992       00000002      OFST:	set	2
2995                     ; 873   uint16_t flagpos = 0;
2997                     ; 876   assert_param(IS_I2C_CLEAR_ITPENDINGBIT_OK(I2C_ITPendingBit));
2999  06c2 a32220        	cpw	x,#8736
3000  06c5 2714          	jreq	L062
3001  06c7 a32108        	cpw	x,#8456
3002  06ca 270f          	jreq	L062
3003  06cc a32104        	cpw	x,#8452
3004  06cf 270a          	jreq	L062
3005  06d1 a32102        	cpw	x,#8450
3006  06d4 2705          	jreq	L062
3007  06d6 a32101        	cpw	x,#8449
3008  06d9 2603          	jrne	L652
3009  06db               L062:
3010  06db 4f            	clr	a
3011  06dc 2010          	jra	L262
3012  06de               L652:
3013  06de ae036c        	ldw	x,#876
3014  06e1 89            	pushw	x
3015  06e2 ae0000        	ldw	x,#0
3016  06e5 89            	pushw	x
3017  06e6 ae000c        	ldw	x,#L131
3018  06e9 cd0000        	call	_assert_failed
3020  06ec 5b04          	addw	sp,#4
3021  06ee               L262:
3022                     ; 879   flagpos = (uint16_t)I2C_ITPendingBit & FLAG_Mask;
3024  06ee 7b03          	ld	a,(OFST+1,sp)
3025  06f0 97            	ld	xl,a
3026  06f1 7b04          	ld	a,(OFST+2,sp)
3027  06f3 a4ff          	and	a,#255
3028  06f5 5f            	clrw	x
3029  06f6 02            	rlwa	x,a
3030  06f7 1f01          	ldw	(OFST-1,sp),x
3031  06f9 01            	rrwa	x,a
3033                     ; 882   I2C->SR2 = (uint8_t)((uint16_t)~flagpos);
3035  06fa 7b02          	ld	a,(OFST+0,sp)
3036  06fc 43            	cpl	a
3037  06fd c75218        	ld	21016,a
3038                     ; 883 }
3041  0700 5b04          	addw	sp,#4
3042  0702 81            	ret
3055                     	xdef	_I2C_ClearITPendingBit
3056                     	xdef	_I2C_GetITStatus
3057                     	xdef	_I2C_ClearFlag
3058                     	xdef	_I2C_GetFlagStatus
3059                     	xdef	_I2C_GetLastEvent
3060                     	xdef	_I2C_CheckEvent
3061                     	xdef	_I2C_SendData
3062                     	xdef	_I2C_Send7bitAddress
3063                     	xdef	_I2C_ReceiveData
3064                     	xdef	_I2C_ITConfig
3065                     	xdef	_I2C_FastModeDutyCycleConfig
3066                     	xdef	_I2C_AcknowledgeConfig
3067                     	xdef	_I2C_StretchClockCmd
3068                     	xdef	_I2C_SoftwareResetCmd
3069                     	xdef	_I2C_GenerateSTOP
3070                     	xdef	_I2C_GenerateSTART
3071                     	xdef	_I2C_GeneralCallCmd
3072                     	xdef	_I2C_Cmd
3073                     	xdef	_I2C_Init
3074                     	xdef	_I2C_DeInit
3075                     	xref	_assert_failed
3076                     	switch	.const
3077  000c               L131:
3078  000c 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
3079  001e 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
3080  0030 72697665725c  	dc.b	"river\src\stm8s_i2"
3081  0042 632e6300      	dc.b	"c.c",0
3082                     	xref.b	c_lreg
3083                     	xref.b	c_x
3103                     	xref	c_sdivx
3104                     	xref	c_ludv
3105                     	xref	c_rtol
3106                     	xref	c_smul
3107                     	xref	c_lmul
3108                     	xref	c_lcmp
3109                     	xref	c_ltor
3110                     	xref	c_lzmp
3111                     	end
