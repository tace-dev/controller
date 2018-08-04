   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  44                     ; 52 void TIM2_DeInit(void)
  44                     ; 53 {
  46                     	switch	.text
  47  0000               _TIM2_DeInit:
  51                     ; 54   TIM2->CR1 = (uint8_t)TIM2_CR1_RESET_VALUE;
  53  0000 725f5300      	clr	21248
  54                     ; 55   TIM2->IER = (uint8_t)TIM2_IER_RESET_VALUE;
  56  0004 725f5303      	clr	21251
  57                     ; 56   TIM2->SR2 = (uint8_t)TIM2_SR2_RESET_VALUE;
  59  0008 725f5305      	clr	21253
  60                     ; 59   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  62  000c 725f530a      	clr	21258
  63                     ; 60   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  65  0010 725f530b      	clr	21259
  66                     ; 64   TIM2->CCER1 = (uint8_t)TIM2_CCER1_RESET_VALUE;
  68  0014 725f530a      	clr	21258
  69                     ; 65   TIM2->CCER2 = (uint8_t)TIM2_CCER2_RESET_VALUE;
  71  0018 725f530b      	clr	21259
  72                     ; 66   TIM2->CCMR1 = (uint8_t)TIM2_CCMR1_RESET_VALUE;
  74  001c 725f5307      	clr	21255
  75                     ; 67   TIM2->CCMR2 = (uint8_t)TIM2_CCMR2_RESET_VALUE;
  77  0020 725f5308      	clr	21256
  78                     ; 68   TIM2->CCMR3 = (uint8_t)TIM2_CCMR3_RESET_VALUE;
  80  0024 725f5309      	clr	21257
  81                     ; 69   TIM2->CNTRH = (uint8_t)TIM2_CNTRH_RESET_VALUE;
  83  0028 725f530c      	clr	21260
  84                     ; 70   TIM2->CNTRL = (uint8_t)TIM2_CNTRL_RESET_VALUE;
  86  002c 725f530d      	clr	21261
  87                     ; 71   TIM2->PSCR = (uint8_t)TIM2_PSCR_RESET_VALUE;
  89  0030 725f530e      	clr	21262
  90                     ; 72   TIM2->ARRH  = (uint8_t)TIM2_ARRH_RESET_VALUE;
  92  0034 35ff530f      	mov	21263,#255
  93                     ; 73   TIM2->ARRL  = (uint8_t)TIM2_ARRL_RESET_VALUE;
  95  0038 35ff5310      	mov	21264,#255
  96                     ; 74   TIM2->CCR1H = (uint8_t)TIM2_CCR1H_RESET_VALUE;
  98  003c 725f5311      	clr	21265
  99                     ; 75   TIM2->CCR1L = (uint8_t)TIM2_CCR1L_RESET_VALUE;
 101  0040 725f5312      	clr	21266
 102                     ; 76   TIM2->CCR2H = (uint8_t)TIM2_CCR2H_RESET_VALUE;
 104  0044 725f5313      	clr	21267
 105                     ; 77   TIM2->CCR2L = (uint8_t)TIM2_CCR2L_RESET_VALUE;
 107  0048 725f5314      	clr	21268
 108                     ; 78   TIM2->CCR3H = (uint8_t)TIM2_CCR3H_RESET_VALUE;
 110  004c 725f5315      	clr	21269
 111                     ; 79   TIM2->CCR3L = (uint8_t)TIM2_CCR3L_RESET_VALUE;
 113  0050 725f5316      	clr	21270
 114                     ; 80   TIM2->SR1 = (uint8_t)TIM2_SR1_RESET_VALUE;
 116  0054 725f5304      	clr	21252
 117                     ; 81 }
 120  0058 81            	ret
 288                     ; 89 void TIM2_TimeBaseInit( TIM2_Prescaler_TypeDef TIM2_Prescaler,
 288                     ; 90                         uint16_t TIM2_Period)
 288                     ; 91 {
 289                     	switch	.text
 290  0059               _TIM2_TimeBaseInit:
 292  0059 88            	push	a
 293       00000000      OFST:	set	0
 296                     ; 93   TIM2->PSCR = (uint8_t)(TIM2_Prescaler);
 298  005a c7530e        	ld	21262,a
 299                     ; 95   TIM2->ARRH = (uint8_t)(TIM2_Period >> 8);
 301  005d 7b04          	ld	a,(OFST+4,sp)
 302  005f c7530f        	ld	21263,a
 303                     ; 96   TIM2->ARRL = (uint8_t)(TIM2_Period);
 305  0062 7b05          	ld	a,(OFST+5,sp)
 306  0064 c75310        	ld	21264,a
 307                     ; 97 }
 310  0067 84            	pop	a
 311  0068 81            	ret
 469                     ; 108 void TIM2_OC1Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 469                     ; 109                   TIM2_OutputState_TypeDef TIM2_OutputState,
 469                     ; 110                   uint16_t TIM2_Pulse,
 469                     ; 111                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 469                     ; 112 {
 470                     	switch	.text
 471  0069               _TIM2_OC1Init:
 473  0069 89            	pushw	x
 474  006a 88            	push	a
 475       00000001      OFST:	set	1
 478                     ; 114   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 480  006b 9e            	ld	a,xh
 481  006c 4d            	tnz	a
 482  006d 2719          	jreq	L41
 483  006f 9e            	ld	a,xh
 484  0070 a110          	cp	a,#16
 485  0072 2714          	jreq	L41
 486  0074 9e            	ld	a,xh
 487  0075 a120          	cp	a,#32
 488  0077 270f          	jreq	L41
 489  0079 9e            	ld	a,xh
 490  007a a130          	cp	a,#48
 491  007c 270a          	jreq	L41
 492  007e 9e            	ld	a,xh
 493  007f a160          	cp	a,#96
 494  0081 2705          	jreq	L41
 495  0083 9e            	ld	a,xh
 496  0084 a170          	cp	a,#112
 497  0086 2603          	jrne	L21
 498  0088               L41:
 499  0088 4f            	clr	a
 500  0089 2010          	jra	L61
 501  008b               L21:
 502  008b ae0072        	ldw	x,#114
 503  008e 89            	pushw	x
 504  008f ae0000        	ldw	x,#0
 505  0092 89            	pushw	x
 506  0093 ae0000        	ldw	x,#L702
 507  0096 cd0000        	call	_assert_failed
 509  0099 5b04          	addw	sp,#4
 510  009b               L61:
 511                     ; 115   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 513  009b 0d03          	tnz	(OFST+2,sp)
 514  009d 2706          	jreq	L22
 515  009f 7b03          	ld	a,(OFST+2,sp)
 516  00a1 a111          	cp	a,#17
 517  00a3 2603          	jrne	L02
 518  00a5               L22:
 519  00a5 4f            	clr	a
 520  00a6 2010          	jra	L42
 521  00a8               L02:
 522  00a8 ae0073        	ldw	x,#115
 523  00ab 89            	pushw	x
 524  00ac ae0000        	ldw	x,#0
 525  00af 89            	pushw	x
 526  00b0 ae0000        	ldw	x,#L702
 527  00b3 cd0000        	call	_assert_failed
 529  00b6 5b04          	addw	sp,#4
 530  00b8               L42:
 531                     ; 116   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 533  00b8 0d08          	tnz	(OFST+7,sp)
 534  00ba 2706          	jreq	L03
 535  00bc 7b08          	ld	a,(OFST+7,sp)
 536  00be a122          	cp	a,#34
 537  00c0 2603          	jrne	L62
 538  00c2               L03:
 539  00c2 4f            	clr	a
 540  00c3 2010          	jra	L23
 541  00c5               L62:
 542  00c5 ae0074        	ldw	x,#116
 543  00c8 89            	pushw	x
 544  00c9 ae0000        	ldw	x,#0
 545  00cc 89            	pushw	x
 546  00cd ae0000        	ldw	x,#L702
 547  00d0 cd0000        	call	_assert_failed
 549  00d3 5b04          	addw	sp,#4
 550  00d5               L23:
 551                     ; 119   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC1E | TIM2_CCER1_CC1P));
 553  00d5 c6530a        	ld	a,21258
 554  00d8 a4fc          	and	a,#252
 555  00da c7530a        	ld	21258,a
 556                     ; 121   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER1_CC1E ) | 
 556                     ; 122                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC1P));
 558  00dd 7b08          	ld	a,(OFST+7,sp)
 559  00df a402          	and	a,#2
 560  00e1 6b01          	ld	(OFST+0,sp),a
 562  00e3 7b03          	ld	a,(OFST+2,sp)
 563  00e5 a401          	and	a,#1
 564  00e7 1a01          	or	a,(OFST+0,sp)
 565  00e9 ca530a        	or	a,21258
 566  00ec c7530a        	ld	21258,a
 567                     ; 125   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM)) |
 567                     ; 126                           (uint8_t)TIM2_OCMode);
 569  00ef c65307        	ld	a,21255
 570  00f2 a48f          	and	a,#143
 571  00f4 1a02          	or	a,(OFST+1,sp)
 572  00f6 c75307        	ld	21255,a
 573                     ; 129   TIM2->CCR1H = (uint8_t)(TIM2_Pulse >> 8);
 575  00f9 7b06          	ld	a,(OFST+5,sp)
 576  00fb c75311        	ld	21265,a
 577                     ; 130   TIM2->CCR1L = (uint8_t)(TIM2_Pulse);
 579  00fe 7b07          	ld	a,(OFST+6,sp)
 580  0100 c75312        	ld	21266,a
 581                     ; 131 }
 584  0103 5b03          	addw	sp,#3
 585  0105 81            	ret
 650                     ; 142 void TIM2_OC2Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 650                     ; 143                   TIM2_OutputState_TypeDef TIM2_OutputState,
 650                     ; 144                   uint16_t TIM2_Pulse,
 650                     ; 145                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 650                     ; 146 {
 651                     	switch	.text
 652  0106               _TIM2_OC2Init:
 654  0106 89            	pushw	x
 655  0107 88            	push	a
 656       00000001      OFST:	set	1
 659                     ; 148   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 661  0108 9e            	ld	a,xh
 662  0109 4d            	tnz	a
 663  010a 2719          	jreq	L04
 664  010c 9e            	ld	a,xh
 665  010d a110          	cp	a,#16
 666  010f 2714          	jreq	L04
 667  0111 9e            	ld	a,xh
 668  0112 a120          	cp	a,#32
 669  0114 270f          	jreq	L04
 670  0116 9e            	ld	a,xh
 671  0117 a130          	cp	a,#48
 672  0119 270a          	jreq	L04
 673  011b 9e            	ld	a,xh
 674  011c a160          	cp	a,#96
 675  011e 2705          	jreq	L04
 676  0120 9e            	ld	a,xh
 677  0121 a170          	cp	a,#112
 678  0123 2603          	jrne	L63
 679  0125               L04:
 680  0125 4f            	clr	a
 681  0126 2010          	jra	L24
 682  0128               L63:
 683  0128 ae0094        	ldw	x,#148
 684  012b 89            	pushw	x
 685  012c ae0000        	ldw	x,#0
 686  012f 89            	pushw	x
 687  0130 ae0000        	ldw	x,#L702
 688  0133 cd0000        	call	_assert_failed
 690  0136 5b04          	addw	sp,#4
 691  0138               L24:
 692                     ; 149   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 694  0138 0d03          	tnz	(OFST+2,sp)
 695  013a 2706          	jreq	L64
 696  013c 7b03          	ld	a,(OFST+2,sp)
 697  013e a111          	cp	a,#17
 698  0140 2603          	jrne	L44
 699  0142               L64:
 700  0142 4f            	clr	a
 701  0143 2010          	jra	L05
 702  0145               L44:
 703  0145 ae0095        	ldw	x,#149
 704  0148 89            	pushw	x
 705  0149 ae0000        	ldw	x,#0
 706  014c 89            	pushw	x
 707  014d ae0000        	ldw	x,#L702
 708  0150 cd0000        	call	_assert_failed
 710  0153 5b04          	addw	sp,#4
 711  0155               L05:
 712                     ; 150   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 714  0155 0d08          	tnz	(OFST+7,sp)
 715  0157 2706          	jreq	L45
 716  0159 7b08          	ld	a,(OFST+7,sp)
 717  015b a122          	cp	a,#34
 718  015d 2603          	jrne	L25
 719  015f               L45:
 720  015f 4f            	clr	a
 721  0160 2010          	jra	L65
 722  0162               L25:
 723  0162 ae0096        	ldw	x,#150
 724  0165 89            	pushw	x
 725  0166 ae0000        	ldw	x,#0
 726  0169 89            	pushw	x
 727  016a ae0000        	ldw	x,#L702
 728  016d cd0000        	call	_assert_failed
 730  0170 5b04          	addw	sp,#4
 731  0172               L65:
 732                     ; 154   TIM2->CCER1 &= (uint8_t)(~( TIM2_CCER1_CC2E |  TIM2_CCER1_CC2P ));
 734  0172 c6530a        	ld	a,21258
 735  0175 a4cf          	and	a,#207
 736  0177 c7530a        	ld	21258,a
 737                     ; 156   TIM2->CCER1 |= (uint8_t)((uint8_t)(TIM2_OutputState  & TIM2_CCER1_CC2E ) |
 737                     ; 157                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER1_CC2P));
 739  017a 7b08          	ld	a,(OFST+7,sp)
 740  017c a420          	and	a,#32
 741  017e 6b01          	ld	(OFST+0,sp),a
 743  0180 7b03          	ld	a,(OFST+2,sp)
 744  0182 a410          	and	a,#16
 745  0184 1a01          	or	a,(OFST+0,sp)
 746  0186 ca530a        	or	a,21258
 747  0189 c7530a        	ld	21258,a
 748                     ; 161   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM)) | 
 748                     ; 162                           (uint8_t)TIM2_OCMode);
 750  018c c65308        	ld	a,21256
 751  018f a48f          	and	a,#143
 752  0191 1a02          	or	a,(OFST+1,sp)
 753  0193 c75308        	ld	21256,a
 754                     ; 166   TIM2->CCR2H = (uint8_t)(TIM2_Pulse >> 8);
 756  0196 7b06          	ld	a,(OFST+5,sp)
 757  0198 c75313        	ld	21267,a
 758                     ; 167   TIM2->CCR2L = (uint8_t)(TIM2_Pulse);
 760  019b 7b07          	ld	a,(OFST+6,sp)
 761  019d c75314        	ld	21268,a
 762                     ; 168 }
 765  01a0 5b03          	addw	sp,#3
 766  01a2 81            	ret
 831                     ; 179 void TIM2_OC3Init(TIM2_OCMode_TypeDef TIM2_OCMode,
 831                     ; 180                   TIM2_OutputState_TypeDef TIM2_OutputState,
 831                     ; 181                   uint16_t TIM2_Pulse,
 831                     ; 182                   TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
 831                     ; 183 {
 832                     	switch	.text
 833  01a3               _TIM2_OC3Init:
 835  01a3 89            	pushw	x
 836  01a4 88            	push	a
 837       00000001      OFST:	set	1
 840                     ; 185   assert_param(IS_TIM2_OC_MODE_OK(TIM2_OCMode));
 842  01a5 9e            	ld	a,xh
 843  01a6 4d            	tnz	a
 844  01a7 2719          	jreq	L46
 845  01a9 9e            	ld	a,xh
 846  01aa a110          	cp	a,#16
 847  01ac 2714          	jreq	L46
 848  01ae 9e            	ld	a,xh
 849  01af a120          	cp	a,#32
 850  01b1 270f          	jreq	L46
 851  01b3 9e            	ld	a,xh
 852  01b4 a130          	cp	a,#48
 853  01b6 270a          	jreq	L46
 854  01b8 9e            	ld	a,xh
 855  01b9 a160          	cp	a,#96
 856  01bb 2705          	jreq	L46
 857  01bd 9e            	ld	a,xh
 858  01be a170          	cp	a,#112
 859  01c0 2603          	jrne	L26
 860  01c2               L46:
 861  01c2 4f            	clr	a
 862  01c3 2010          	jra	L66
 863  01c5               L26:
 864  01c5 ae00b9        	ldw	x,#185
 865  01c8 89            	pushw	x
 866  01c9 ae0000        	ldw	x,#0
 867  01cc 89            	pushw	x
 868  01cd ae0000        	ldw	x,#L702
 869  01d0 cd0000        	call	_assert_failed
 871  01d3 5b04          	addw	sp,#4
 872  01d5               L66:
 873                     ; 186   assert_param(IS_TIM2_OUTPUT_STATE_OK(TIM2_OutputState));
 875  01d5 0d03          	tnz	(OFST+2,sp)
 876  01d7 2706          	jreq	L27
 877  01d9 7b03          	ld	a,(OFST+2,sp)
 878  01db a111          	cp	a,#17
 879  01dd 2603          	jrne	L07
 880  01df               L27:
 881  01df 4f            	clr	a
 882  01e0 2010          	jra	L47
 883  01e2               L07:
 884  01e2 ae00ba        	ldw	x,#186
 885  01e5 89            	pushw	x
 886  01e6 ae0000        	ldw	x,#0
 887  01e9 89            	pushw	x
 888  01ea ae0000        	ldw	x,#L702
 889  01ed cd0000        	call	_assert_failed
 891  01f0 5b04          	addw	sp,#4
 892  01f2               L47:
 893                     ; 187   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
 895  01f2 0d08          	tnz	(OFST+7,sp)
 896  01f4 2706          	jreq	L001
 897  01f6 7b08          	ld	a,(OFST+7,sp)
 898  01f8 a122          	cp	a,#34
 899  01fa 2603          	jrne	L67
 900  01fc               L001:
 901  01fc 4f            	clr	a
 902  01fd 2010          	jra	L201
 903  01ff               L67:
 904  01ff ae00bb        	ldw	x,#187
 905  0202 89            	pushw	x
 906  0203 ae0000        	ldw	x,#0
 907  0206 89            	pushw	x
 908  0207 ae0000        	ldw	x,#L702
 909  020a cd0000        	call	_assert_failed
 911  020d 5b04          	addw	sp,#4
 912  020f               L201:
 913                     ; 189   TIM2->CCER2 &= (uint8_t)(~( TIM2_CCER2_CC3E  | TIM2_CCER2_CC3P));
 915  020f c6530b        	ld	a,21259
 916  0212 a4fc          	and	a,#252
 917  0214 c7530b        	ld	21259,a
 918                     ; 191   TIM2->CCER2 |= (uint8_t)((uint8_t)(TIM2_OutputState & TIM2_CCER2_CC3E) |  
 918                     ; 192                            (uint8_t)(TIM2_OCPolarity & TIM2_CCER2_CC3P));
 920  0217 7b08          	ld	a,(OFST+7,sp)
 921  0219 a402          	and	a,#2
 922  021b 6b01          	ld	(OFST+0,sp),a
 924  021d 7b03          	ld	a,(OFST+2,sp)
 925  021f a401          	and	a,#1
 926  0221 1a01          	or	a,(OFST+0,sp)
 927  0223 ca530b        	or	a,21259
 928  0226 c7530b        	ld	21259,a
 929                     ; 195   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM)) |
 929                     ; 196                           (uint8_t)TIM2_OCMode);
 931  0229 c65309        	ld	a,21257
 932  022c a48f          	and	a,#143
 933  022e 1a02          	or	a,(OFST+1,sp)
 934  0230 c75309        	ld	21257,a
 935                     ; 199   TIM2->CCR3H = (uint8_t)(TIM2_Pulse >> 8);
 937  0233 7b06          	ld	a,(OFST+5,sp)
 938  0235 c75315        	ld	21269,a
 939                     ; 200   TIM2->CCR3L = (uint8_t)(TIM2_Pulse);
 941  0238 7b07          	ld	a,(OFST+6,sp)
 942  023a c75316        	ld	21270,a
 943                     ; 201 }
 946  023d 5b03          	addw	sp,#3
 947  023f 81            	ret
1141                     ; 212 void TIM2_ICInit(TIM2_Channel_TypeDef TIM2_Channel,
1141                     ; 213                  TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1141                     ; 214                  TIM2_ICSelection_TypeDef TIM2_ICSelection,
1141                     ; 215                  TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1141                     ; 216                  uint8_t TIM2_ICFilter)
1141                     ; 217 {
1142                     	switch	.text
1143  0240               _TIM2_ICInit:
1145  0240 89            	pushw	x
1146       00000000      OFST:	set	0
1149                     ; 219   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
1151  0241 9e            	ld	a,xh
1152  0242 4d            	tnz	a
1153  0243 270a          	jreq	L011
1154  0245 9e            	ld	a,xh
1155  0246 a101          	cp	a,#1
1156  0248 2705          	jreq	L011
1157  024a 9e            	ld	a,xh
1158  024b a102          	cp	a,#2
1159  024d 2603          	jrne	L601
1160  024f               L011:
1161  024f 4f            	clr	a
1162  0250 2010          	jra	L211
1163  0252               L601:
1164  0252 ae00db        	ldw	x,#219
1165  0255 89            	pushw	x
1166  0256 ae0000        	ldw	x,#0
1167  0259 89            	pushw	x
1168  025a ae0000        	ldw	x,#L702
1169  025d cd0000        	call	_assert_failed
1171  0260 5b04          	addw	sp,#4
1172  0262               L211:
1173                     ; 220   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1175  0262 0d02          	tnz	(OFST+2,sp)
1176  0264 2706          	jreq	L611
1177  0266 7b02          	ld	a,(OFST+2,sp)
1178  0268 a144          	cp	a,#68
1179  026a 2603          	jrne	L411
1180  026c               L611:
1181  026c 4f            	clr	a
1182  026d 2010          	jra	L021
1183  026f               L411:
1184  026f ae00dc        	ldw	x,#220
1185  0272 89            	pushw	x
1186  0273 ae0000        	ldw	x,#0
1187  0276 89            	pushw	x
1188  0277 ae0000        	ldw	x,#L702
1189  027a cd0000        	call	_assert_failed
1191  027d 5b04          	addw	sp,#4
1192  027f               L021:
1193                     ; 221   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1195  027f 7b05          	ld	a,(OFST+5,sp)
1196  0281 a101          	cp	a,#1
1197  0283 270c          	jreq	L421
1198  0285 7b05          	ld	a,(OFST+5,sp)
1199  0287 a102          	cp	a,#2
1200  0289 2706          	jreq	L421
1201  028b 7b05          	ld	a,(OFST+5,sp)
1202  028d a103          	cp	a,#3
1203  028f 2603          	jrne	L221
1204  0291               L421:
1205  0291 4f            	clr	a
1206  0292 2010          	jra	L621
1207  0294               L221:
1208  0294 ae00dd        	ldw	x,#221
1209  0297 89            	pushw	x
1210  0298 ae0000        	ldw	x,#0
1211  029b 89            	pushw	x
1212  029c ae0000        	ldw	x,#L702
1213  029f cd0000        	call	_assert_failed
1215  02a2 5b04          	addw	sp,#4
1216  02a4               L621:
1217                     ; 222   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1219  02a4 0d06          	tnz	(OFST+6,sp)
1220  02a6 2712          	jreq	L231
1221  02a8 7b06          	ld	a,(OFST+6,sp)
1222  02aa a104          	cp	a,#4
1223  02ac 270c          	jreq	L231
1224  02ae 7b06          	ld	a,(OFST+6,sp)
1225  02b0 a108          	cp	a,#8
1226  02b2 2706          	jreq	L231
1227  02b4 7b06          	ld	a,(OFST+6,sp)
1228  02b6 a10c          	cp	a,#12
1229  02b8 2603          	jrne	L031
1230  02ba               L231:
1231  02ba 4f            	clr	a
1232  02bb 2010          	jra	L431
1233  02bd               L031:
1234  02bd ae00de        	ldw	x,#222
1235  02c0 89            	pushw	x
1236  02c1 ae0000        	ldw	x,#0
1237  02c4 89            	pushw	x
1238  02c5 ae0000        	ldw	x,#L702
1239  02c8 cd0000        	call	_assert_failed
1241  02cb 5b04          	addw	sp,#4
1242  02cd               L431:
1243                     ; 223   assert_param(IS_TIM2_IC_FILTER_OK(TIM2_ICFilter));
1245  02cd 7b07          	ld	a,(OFST+7,sp)
1246  02cf a110          	cp	a,#16
1247  02d1 2403          	jruge	L631
1248  02d3 4f            	clr	a
1249  02d4 2010          	jra	L041
1250  02d6               L631:
1251  02d6 ae00df        	ldw	x,#223
1252  02d9 89            	pushw	x
1253  02da ae0000        	ldw	x,#0
1254  02dd 89            	pushw	x
1255  02de ae0000        	ldw	x,#L702
1256  02e1 cd0000        	call	_assert_failed
1258  02e4 5b04          	addw	sp,#4
1259  02e6               L041:
1260                     ; 225   if (TIM2_Channel == TIM2_CHANNEL_1)
1262  02e6 0d01          	tnz	(OFST+1,sp)
1263  02e8 2614          	jrne	L304
1264                     ; 228     TI1_Config((uint8_t)TIM2_ICPolarity,
1264                     ; 229                (uint8_t)TIM2_ICSelection,
1264                     ; 230                (uint8_t)TIM2_ICFilter);
1266  02ea 7b07          	ld	a,(OFST+7,sp)
1267  02ec 88            	push	a
1268  02ed 7b06          	ld	a,(OFST+6,sp)
1269  02ef 97            	ld	xl,a
1270  02f0 7b03          	ld	a,(OFST+3,sp)
1271  02f2 95            	ld	xh,a
1272  02f3 cd0ad3        	call	L3_TI1_Config
1274  02f6 84            	pop	a
1275                     ; 233     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1277  02f7 7b06          	ld	a,(OFST+6,sp)
1278  02f9 cd08c3        	call	_TIM2_SetIC1Prescaler
1281  02fc 202c          	jra	L504
1282  02fe               L304:
1283                     ; 235   else if (TIM2_Channel == TIM2_CHANNEL_2)
1285  02fe 7b01          	ld	a,(OFST+1,sp)
1286  0300 a101          	cp	a,#1
1287  0302 2614          	jrne	L704
1288                     ; 238     TI2_Config((uint8_t)TIM2_ICPolarity,
1288                     ; 239                (uint8_t)TIM2_ICSelection,
1288                     ; 240                (uint8_t)TIM2_ICFilter);
1290  0304 7b07          	ld	a,(OFST+7,sp)
1291  0306 88            	push	a
1292  0307 7b06          	ld	a,(OFST+6,sp)
1293  0309 97            	ld	xl,a
1294  030a 7b03          	ld	a,(OFST+3,sp)
1295  030c 95            	ld	xh,a
1296  030d cd0b03        	call	L5_TI2_Config
1298  0310 84            	pop	a
1299                     ; 243     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1301  0311 7b06          	ld	a,(OFST+6,sp)
1302  0313 cd08f2        	call	_TIM2_SetIC2Prescaler
1305  0316 2012          	jra	L504
1306  0318               L704:
1307                     ; 248     TI3_Config((uint8_t)TIM2_ICPolarity,
1307                     ; 249                (uint8_t)TIM2_ICSelection,
1307                     ; 250                (uint8_t)TIM2_ICFilter);
1309  0318 7b07          	ld	a,(OFST+7,sp)
1310  031a 88            	push	a
1311  031b 7b06          	ld	a,(OFST+6,sp)
1312  031d 97            	ld	xl,a
1313  031e 7b03          	ld	a,(OFST+3,sp)
1314  0320 95            	ld	xh,a
1315  0321 cd0b33        	call	L7_TI3_Config
1317  0324 84            	pop	a
1318                     ; 253     TIM2_SetIC3Prescaler(TIM2_ICPrescaler);
1320  0325 7b06          	ld	a,(OFST+6,sp)
1321  0327 cd0921        	call	_TIM2_SetIC3Prescaler
1323  032a               L504:
1324                     ; 255 }
1327  032a 85            	popw	x
1328  032b 81            	ret
1425                     ; 266 void TIM2_PWMIConfig(TIM2_Channel_TypeDef TIM2_Channel,
1425                     ; 267                      TIM2_ICPolarity_TypeDef TIM2_ICPolarity,
1425                     ; 268                      TIM2_ICSelection_TypeDef TIM2_ICSelection,
1425                     ; 269                      TIM2_ICPSC_TypeDef TIM2_ICPrescaler,
1425                     ; 270                      uint8_t TIM2_ICFilter)
1425                     ; 271 {
1426                     	switch	.text
1427  032c               _TIM2_PWMIConfig:
1429  032c 89            	pushw	x
1430  032d 89            	pushw	x
1431       00000002      OFST:	set	2
1434                     ; 272   uint8_t icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1436                     ; 273   uint8_t icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1438                     ; 276   assert_param(IS_TIM2_PWMI_CHANNEL_OK(TIM2_Channel));
1440  032e 9e            	ld	a,xh
1441  032f 4d            	tnz	a
1442  0330 2705          	jreq	L641
1443  0332 9e            	ld	a,xh
1444  0333 a101          	cp	a,#1
1445  0335 2603          	jrne	L441
1446  0337               L641:
1447  0337 4f            	clr	a
1448  0338 2010          	jra	L051
1449  033a               L441:
1450  033a ae0114        	ldw	x,#276
1451  033d 89            	pushw	x
1452  033e ae0000        	ldw	x,#0
1453  0341 89            	pushw	x
1454  0342 ae0000        	ldw	x,#L702
1455  0345 cd0000        	call	_assert_failed
1457  0348 5b04          	addw	sp,#4
1458  034a               L051:
1459                     ; 277   assert_param(IS_TIM2_IC_POLARITY_OK(TIM2_ICPolarity));
1461  034a 0d04          	tnz	(OFST+2,sp)
1462  034c 2706          	jreq	L451
1463  034e 7b04          	ld	a,(OFST+2,sp)
1464  0350 a144          	cp	a,#68
1465  0352 2603          	jrne	L251
1466  0354               L451:
1467  0354 4f            	clr	a
1468  0355 2010          	jra	L651
1469  0357               L251:
1470  0357 ae0115        	ldw	x,#277
1471  035a 89            	pushw	x
1472  035b ae0000        	ldw	x,#0
1473  035e 89            	pushw	x
1474  035f ae0000        	ldw	x,#L702
1475  0362 cd0000        	call	_assert_failed
1477  0365 5b04          	addw	sp,#4
1478  0367               L651:
1479                     ; 278   assert_param(IS_TIM2_IC_SELECTION_OK(TIM2_ICSelection));
1481  0367 7b07          	ld	a,(OFST+5,sp)
1482  0369 a101          	cp	a,#1
1483  036b 270c          	jreq	L261
1484  036d 7b07          	ld	a,(OFST+5,sp)
1485  036f a102          	cp	a,#2
1486  0371 2706          	jreq	L261
1487  0373 7b07          	ld	a,(OFST+5,sp)
1488  0375 a103          	cp	a,#3
1489  0377 2603          	jrne	L061
1490  0379               L261:
1491  0379 4f            	clr	a
1492  037a 2010          	jra	L461
1493  037c               L061:
1494  037c ae0116        	ldw	x,#278
1495  037f 89            	pushw	x
1496  0380 ae0000        	ldw	x,#0
1497  0383 89            	pushw	x
1498  0384 ae0000        	ldw	x,#L702
1499  0387 cd0000        	call	_assert_failed
1501  038a 5b04          	addw	sp,#4
1502  038c               L461:
1503                     ; 279   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_ICPrescaler));
1505  038c 0d08          	tnz	(OFST+6,sp)
1506  038e 2712          	jreq	L071
1507  0390 7b08          	ld	a,(OFST+6,sp)
1508  0392 a104          	cp	a,#4
1509  0394 270c          	jreq	L071
1510  0396 7b08          	ld	a,(OFST+6,sp)
1511  0398 a108          	cp	a,#8
1512  039a 2706          	jreq	L071
1513  039c 7b08          	ld	a,(OFST+6,sp)
1514  039e a10c          	cp	a,#12
1515  03a0 2603          	jrne	L661
1516  03a2               L071:
1517  03a2 4f            	clr	a
1518  03a3 2010          	jra	L271
1519  03a5               L661:
1520  03a5 ae0117        	ldw	x,#279
1521  03a8 89            	pushw	x
1522  03a9 ae0000        	ldw	x,#0
1523  03ac 89            	pushw	x
1524  03ad ae0000        	ldw	x,#L702
1525  03b0 cd0000        	call	_assert_failed
1527  03b3 5b04          	addw	sp,#4
1528  03b5               L271:
1529                     ; 282   if (TIM2_ICPolarity != TIM2_ICPOLARITY_FALLING)
1531  03b5 7b04          	ld	a,(OFST+2,sp)
1532  03b7 a144          	cp	a,#68
1533  03b9 2706          	jreq	L164
1534                     ; 284     icpolarity = (uint8_t)TIM2_ICPOLARITY_FALLING;
1536  03bb a644          	ld	a,#68
1537  03bd 6b01          	ld	(OFST-1,sp),a
1540  03bf 2002          	jra	L364
1541  03c1               L164:
1542                     ; 288     icpolarity = (uint8_t)TIM2_ICPOLARITY_RISING;
1544  03c1 0f01          	clr	(OFST-1,sp)
1546  03c3               L364:
1547                     ; 292   if (TIM2_ICSelection == TIM2_ICSELECTION_DIRECTTI)
1549  03c3 7b07          	ld	a,(OFST+5,sp)
1550  03c5 a101          	cp	a,#1
1551  03c7 2606          	jrne	L564
1552                     ; 294     icselection = (uint8_t)TIM2_ICSELECTION_INDIRECTTI;
1554  03c9 a602          	ld	a,#2
1555  03cb 6b02          	ld	(OFST+0,sp),a
1558  03cd 2004          	jra	L764
1559  03cf               L564:
1560                     ; 298     icselection = (uint8_t)TIM2_ICSELECTION_DIRECTTI;
1562  03cf a601          	ld	a,#1
1563  03d1 6b02          	ld	(OFST+0,sp),a
1565  03d3               L764:
1566                     ; 301   if (TIM2_Channel == TIM2_CHANNEL_1)
1568  03d3 0d03          	tnz	(OFST+1,sp)
1569  03d5 2626          	jrne	L174
1570                     ; 304     TI1_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1570                     ; 305                (uint8_t)TIM2_ICFilter);
1572  03d7 7b09          	ld	a,(OFST+7,sp)
1573  03d9 88            	push	a
1574  03da 7b08          	ld	a,(OFST+6,sp)
1575  03dc 97            	ld	xl,a
1576  03dd 7b05          	ld	a,(OFST+3,sp)
1577  03df 95            	ld	xh,a
1578  03e0 cd0ad3        	call	L3_TI1_Config
1580  03e3 84            	pop	a
1581                     ; 308     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1583  03e4 7b08          	ld	a,(OFST+6,sp)
1584  03e6 cd08c3        	call	_TIM2_SetIC1Prescaler
1586                     ; 311     TI2_Config(icpolarity, icselection, TIM2_ICFilter);
1588  03e9 7b09          	ld	a,(OFST+7,sp)
1589  03eb 88            	push	a
1590  03ec 7b03          	ld	a,(OFST+1,sp)
1591  03ee 97            	ld	xl,a
1592  03ef 7b02          	ld	a,(OFST+0,sp)
1593  03f1 95            	ld	xh,a
1594  03f2 cd0b03        	call	L5_TI2_Config
1596  03f5 84            	pop	a
1597                     ; 314     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1599  03f6 7b08          	ld	a,(OFST+6,sp)
1600  03f8 cd08f2        	call	_TIM2_SetIC2Prescaler
1603  03fb 2024          	jra	L374
1604  03fd               L174:
1605                     ; 319     TI2_Config((uint8_t)TIM2_ICPolarity, (uint8_t)TIM2_ICSelection,
1605                     ; 320                (uint8_t)TIM2_ICFilter);
1607  03fd 7b09          	ld	a,(OFST+7,sp)
1608  03ff 88            	push	a
1609  0400 7b08          	ld	a,(OFST+6,sp)
1610  0402 97            	ld	xl,a
1611  0403 7b05          	ld	a,(OFST+3,sp)
1612  0405 95            	ld	xh,a
1613  0406 cd0b03        	call	L5_TI2_Config
1615  0409 84            	pop	a
1616                     ; 323     TIM2_SetIC2Prescaler(TIM2_ICPrescaler);
1618  040a 7b08          	ld	a,(OFST+6,sp)
1619  040c cd08f2        	call	_TIM2_SetIC2Prescaler
1621                     ; 326     TI1_Config((uint8_t)icpolarity, icselection, (uint8_t)TIM2_ICFilter);
1623  040f 7b09          	ld	a,(OFST+7,sp)
1624  0411 88            	push	a
1625  0412 7b03          	ld	a,(OFST+1,sp)
1626  0414 97            	ld	xl,a
1627  0415 7b02          	ld	a,(OFST+0,sp)
1628  0417 95            	ld	xh,a
1629  0418 cd0ad3        	call	L3_TI1_Config
1631  041b 84            	pop	a
1632                     ; 329     TIM2_SetIC1Prescaler(TIM2_ICPrescaler);
1634  041c 7b08          	ld	a,(OFST+6,sp)
1635  041e cd08c3        	call	_TIM2_SetIC1Prescaler
1637  0421               L374:
1638                     ; 331 }
1641  0421 5b04          	addw	sp,#4
1642  0423 81            	ret
1698                     ; 339 void TIM2_Cmd(FunctionalState NewState)
1698                     ; 340 {
1699                     	switch	.text
1700  0424               _TIM2_Cmd:
1702  0424 88            	push	a
1703       00000000      OFST:	set	0
1706                     ; 342   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1708  0425 4d            	tnz	a
1709  0426 2704          	jreq	L002
1710  0428 a101          	cp	a,#1
1711  042a 2603          	jrne	L671
1712  042c               L002:
1713  042c 4f            	clr	a
1714  042d 2010          	jra	L202
1715  042f               L671:
1716  042f ae0156        	ldw	x,#342
1717  0432 89            	pushw	x
1718  0433 ae0000        	ldw	x,#0
1719  0436 89            	pushw	x
1720  0437 ae0000        	ldw	x,#L702
1721  043a cd0000        	call	_assert_failed
1723  043d 5b04          	addw	sp,#4
1724  043f               L202:
1725                     ; 345   if (NewState != DISABLE)
1727  043f 0d01          	tnz	(OFST+1,sp)
1728  0441 2706          	jreq	L325
1729                     ; 347     TIM2->CR1 |= (uint8_t)TIM2_CR1_CEN;
1731  0443 72105300      	bset	21248,#0
1733  0447 2004          	jra	L525
1734  0449               L325:
1735                     ; 351     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_CEN);
1737  0449 72115300      	bres	21248,#0
1738  044d               L525:
1739                     ; 353 }
1742  044d 84            	pop	a
1743  044e 81            	ret
1823                     ; 368 void TIM2_ITConfig(TIM2_IT_TypeDef TIM2_IT, FunctionalState NewState)
1823                     ; 369 {
1824                     	switch	.text
1825  044f               _TIM2_ITConfig:
1827  044f 89            	pushw	x
1828       00000000      OFST:	set	0
1831                     ; 371   assert_param(IS_TIM2_IT_OK(TIM2_IT));
1833  0450 9e            	ld	a,xh
1834  0451 4d            	tnz	a
1835  0452 2708          	jreq	L602
1836  0454 9e            	ld	a,xh
1837  0455 a110          	cp	a,#16
1838  0457 2403          	jruge	L602
1839  0459 4f            	clr	a
1840  045a 2010          	jra	L012
1841  045c               L602:
1842  045c ae0173        	ldw	x,#371
1843  045f 89            	pushw	x
1844  0460 ae0000        	ldw	x,#0
1845  0463 89            	pushw	x
1846  0464 ae0000        	ldw	x,#L702
1847  0467 cd0000        	call	_assert_failed
1849  046a 5b04          	addw	sp,#4
1850  046c               L012:
1851                     ; 372   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1853  046c 0d02          	tnz	(OFST+2,sp)
1854  046e 2706          	jreq	L412
1855  0470 7b02          	ld	a,(OFST+2,sp)
1856  0472 a101          	cp	a,#1
1857  0474 2603          	jrne	L212
1858  0476               L412:
1859  0476 4f            	clr	a
1860  0477 2010          	jra	L612
1861  0479               L212:
1862  0479 ae0174        	ldw	x,#372
1863  047c 89            	pushw	x
1864  047d ae0000        	ldw	x,#0
1865  0480 89            	pushw	x
1866  0481 ae0000        	ldw	x,#L702
1867  0484 cd0000        	call	_assert_failed
1869  0487 5b04          	addw	sp,#4
1870  0489               L612:
1871                     ; 374   if (NewState != DISABLE)
1873  0489 0d02          	tnz	(OFST+2,sp)
1874  048b 270a          	jreq	L565
1875                     ; 377     TIM2->IER |= (uint8_t)TIM2_IT;
1877  048d c65303        	ld	a,21251
1878  0490 1a01          	or	a,(OFST+1,sp)
1879  0492 c75303        	ld	21251,a
1881  0495 2009          	jra	L765
1882  0497               L565:
1883                     ; 382     TIM2->IER &= (uint8_t)(~TIM2_IT);
1885  0497 7b01          	ld	a,(OFST+1,sp)
1886  0499 43            	cpl	a
1887  049a c45303        	and	a,21251
1888  049d c75303        	ld	21251,a
1889  04a0               L765:
1890                     ; 384 }
1893  04a0 85            	popw	x
1894  04a1 81            	ret
1931                     ; 392 void TIM2_UpdateDisableConfig(FunctionalState NewState)
1931                     ; 393 {
1932                     	switch	.text
1933  04a2               _TIM2_UpdateDisableConfig:
1935  04a2 88            	push	a
1936       00000000      OFST:	set	0
1939                     ; 395   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1941  04a3 4d            	tnz	a
1942  04a4 2704          	jreq	L422
1943  04a6 a101          	cp	a,#1
1944  04a8 2603          	jrne	L222
1945  04aa               L422:
1946  04aa 4f            	clr	a
1947  04ab 2010          	jra	L622
1948  04ad               L222:
1949  04ad ae018b        	ldw	x,#395
1950  04b0 89            	pushw	x
1951  04b1 ae0000        	ldw	x,#0
1952  04b4 89            	pushw	x
1953  04b5 ae0000        	ldw	x,#L702
1954  04b8 cd0000        	call	_assert_failed
1956  04bb 5b04          	addw	sp,#4
1957  04bd               L622:
1958                     ; 398   if (NewState != DISABLE)
1960  04bd 0d01          	tnz	(OFST+1,sp)
1961  04bf 2706          	jreq	L706
1962                     ; 400     TIM2->CR1 |= (uint8_t)TIM2_CR1_UDIS;
1964  04c1 72125300      	bset	21248,#1
1966  04c5 2004          	jra	L116
1967  04c7               L706:
1968                     ; 404     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_UDIS);
1970  04c7 72135300      	bres	21248,#1
1971  04cb               L116:
1972                     ; 406 }
1975  04cb 84            	pop	a
1976  04cc 81            	ret
2035                     ; 416 void TIM2_UpdateRequestConfig(TIM2_UpdateSource_TypeDef TIM2_UpdateSource)
2035                     ; 417 {
2036                     	switch	.text
2037  04cd               _TIM2_UpdateRequestConfig:
2039  04cd 88            	push	a
2040       00000000      OFST:	set	0
2043                     ; 419   assert_param(IS_TIM2_UPDATE_SOURCE_OK(TIM2_UpdateSource));
2045  04ce 4d            	tnz	a
2046  04cf 2704          	jreq	L432
2047  04d1 a101          	cp	a,#1
2048  04d3 2603          	jrne	L232
2049  04d5               L432:
2050  04d5 4f            	clr	a
2051  04d6 2010          	jra	L632
2052  04d8               L232:
2053  04d8 ae01a3        	ldw	x,#419
2054  04db 89            	pushw	x
2055  04dc ae0000        	ldw	x,#0
2056  04df 89            	pushw	x
2057  04e0 ae0000        	ldw	x,#L702
2058  04e3 cd0000        	call	_assert_failed
2060  04e6 5b04          	addw	sp,#4
2061  04e8               L632:
2062                     ; 422   if (TIM2_UpdateSource != TIM2_UPDATESOURCE_GLOBAL)
2064  04e8 0d01          	tnz	(OFST+1,sp)
2065  04ea 2706          	jreq	L146
2066                     ; 424     TIM2->CR1 |= (uint8_t)TIM2_CR1_URS;
2068  04ec 72145300      	bset	21248,#2
2070  04f0 2004          	jra	L346
2071  04f2               L146:
2072                     ; 428     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_URS);
2074  04f2 72155300      	bres	21248,#2
2075  04f6               L346:
2076                     ; 430 }
2079  04f6 84            	pop	a
2080  04f7 81            	ret
2138                     ; 440 void TIM2_SelectOnePulseMode(TIM2_OPMode_TypeDef TIM2_OPMode)
2138                     ; 441 {
2139                     	switch	.text
2140  04f8               _TIM2_SelectOnePulseMode:
2142  04f8 88            	push	a
2143       00000000      OFST:	set	0
2146                     ; 443   assert_param(IS_TIM2_OPM_MODE_OK(TIM2_OPMode));
2148  04f9 a101          	cp	a,#1
2149  04fb 2703          	jreq	L442
2150  04fd 4d            	tnz	a
2151  04fe 2603          	jrne	L242
2152  0500               L442:
2153  0500 4f            	clr	a
2154  0501 2010          	jra	L642
2155  0503               L242:
2156  0503 ae01bb        	ldw	x,#443
2157  0506 89            	pushw	x
2158  0507 ae0000        	ldw	x,#0
2159  050a 89            	pushw	x
2160  050b ae0000        	ldw	x,#L702
2161  050e cd0000        	call	_assert_failed
2163  0511 5b04          	addw	sp,#4
2164  0513               L642:
2165                     ; 446   if (TIM2_OPMode != TIM2_OPMODE_REPETITIVE)
2167  0513 0d01          	tnz	(OFST+1,sp)
2168  0515 2706          	jreq	L376
2169                     ; 448     TIM2->CR1 |= (uint8_t)TIM2_CR1_OPM;
2171  0517 72165300      	bset	21248,#3
2173  051b 2004          	jra	L576
2174  051d               L376:
2175                     ; 452     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_OPM);
2177  051d 72175300      	bres	21248,#3
2178  0521               L576:
2179                     ; 454 }
2182  0521 84            	pop	a
2183  0522 81            	ret
2252                     ; 484 void TIM2_PrescalerConfig(TIM2_Prescaler_TypeDef Prescaler,
2252                     ; 485                           TIM2_PSCReloadMode_TypeDef TIM2_PSCReloadMode)
2252                     ; 486 {
2253                     	switch	.text
2254  0523               _TIM2_PrescalerConfig:
2256  0523 89            	pushw	x
2257       00000000      OFST:	set	0
2260                     ; 488   assert_param(IS_TIM2_PRESCALER_RELOAD_OK(TIM2_PSCReloadMode));
2262  0524 9f            	ld	a,xl
2263  0525 4d            	tnz	a
2264  0526 2705          	jreq	L452
2265  0528 9f            	ld	a,xl
2266  0529 a101          	cp	a,#1
2267  052b 2603          	jrne	L252
2268  052d               L452:
2269  052d 4f            	clr	a
2270  052e 2010          	jra	L652
2271  0530               L252:
2272  0530 ae01e8        	ldw	x,#488
2273  0533 89            	pushw	x
2274  0534 ae0000        	ldw	x,#0
2275  0537 89            	pushw	x
2276  0538 ae0000        	ldw	x,#L702
2277  053b cd0000        	call	_assert_failed
2279  053e 5b04          	addw	sp,#4
2280  0540               L652:
2281                     ; 489   assert_param(IS_TIM2_PRESCALER_OK(Prescaler));
2283  0540 0d01          	tnz	(OFST+1,sp)
2284  0542 275a          	jreq	L262
2285  0544 7b01          	ld	a,(OFST+1,sp)
2286  0546 a101          	cp	a,#1
2287  0548 2754          	jreq	L262
2288  054a 7b01          	ld	a,(OFST+1,sp)
2289  054c a102          	cp	a,#2
2290  054e 274e          	jreq	L262
2291  0550 7b01          	ld	a,(OFST+1,sp)
2292  0552 a103          	cp	a,#3
2293  0554 2748          	jreq	L262
2294  0556 7b01          	ld	a,(OFST+1,sp)
2295  0558 a104          	cp	a,#4
2296  055a 2742          	jreq	L262
2297  055c 7b01          	ld	a,(OFST+1,sp)
2298  055e a105          	cp	a,#5
2299  0560 273c          	jreq	L262
2300  0562 7b01          	ld	a,(OFST+1,sp)
2301  0564 a106          	cp	a,#6
2302  0566 2736          	jreq	L262
2303  0568 7b01          	ld	a,(OFST+1,sp)
2304  056a a107          	cp	a,#7
2305  056c 2730          	jreq	L262
2306  056e 7b01          	ld	a,(OFST+1,sp)
2307  0570 a108          	cp	a,#8
2308  0572 272a          	jreq	L262
2309  0574 7b01          	ld	a,(OFST+1,sp)
2310  0576 a109          	cp	a,#9
2311  0578 2724          	jreq	L262
2312  057a 7b01          	ld	a,(OFST+1,sp)
2313  057c a10a          	cp	a,#10
2314  057e 271e          	jreq	L262
2315  0580 7b01          	ld	a,(OFST+1,sp)
2316  0582 a10b          	cp	a,#11
2317  0584 2718          	jreq	L262
2318  0586 7b01          	ld	a,(OFST+1,sp)
2319  0588 a10c          	cp	a,#12
2320  058a 2712          	jreq	L262
2321  058c 7b01          	ld	a,(OFST+1,sp)
2322  058e a10d          	cp	a,#13
2323  0590 270c          	jreq	L262
2324  0592 7b01          	ld	a,(OFST+1,sp)
2325  0594 a10e          	cp	a,#14
2326  0596 2706          	jreq	L262
2327  0598 7b01          	ld	a,(OFST+1,sp)
2328  059a a10f          	cp	a,#15
2329  059c 2603          	jrne	L062
2330  059e               L262:
2331  059e 4f            	clr	a
2332  059f 2010          	jra	L462
2333  05a1               L062:
2334  05a1 ae01e9        	ldw	x,#489
2335  05a4 89            	pushw	x
2336  05a5 ae0000        	ldw	x,#0
2337  05a8 89            	pushw	x
2338  05a9 ae0000        	ldw	x,#L702
2339  05ac cd0000        	call	_assert_failed
2341  05af 5b04          	addw	sp,#4
2342  05b1               L462:
2343                     ; 492   TIM2->PSCR = (uint8_t)Prescaler;
2345  05b1 7b01          	ld	a,(OFST+1,sp)
2346  05b3 c7530e        	ld	21262,a
2347                     ; 495   TIM2->EGR = (uint8_t)TIM2_PSCReloadMode;
2349  05b6 7b02          	ld	a,(OFST+2,sp)
2350  05b8 c75306        	ld	21254,a
2351                     ; 496 }
2354  05bb 85            	popw	x
2355  05bc 81            	ret
2414                     ; 507 void TIM2_ForcedOC1Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2414                     ; 508 {
2415                     	switch	.text
2416  05bd               _TIM2_ForcedOC1Config:
2418  05bd 88            	push	a
2419       00000000      OFST:	set	0
2422                     ; 510   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2424  05be a150          	cp	a,#80
2425  05c0 2704          	jreq	L272
2426  05c2 a140          	cp	a,#64
2427  05c4 2603          	jrne	L072
2428  05c6               L272:
2429  05c6 4f            	clr	a
2430  05c7 2010          	jra	L472
2431  05c9               L072:
2432  05c9 ae01fe        	ldw	x,#510
2433  05cc 89            	pushw	x
2434  05cd ae0000        	ldw	x,#0
2435  05d0 89            	pushw	x
2436  05d1 ae0000        	ldw	x,#L702
2437  05d4 cd0000        	call	_assert_failed
2439  05d7 5b04          	addw	sp,#4
2440  05d9               L472:
2441                     ; 513   TIM2->CCMR1  =  (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))  
2441                     ; 514                             | (uint8_t)TIM2_ForcedAction);
2443  05d9 c65307        	ld	a,21255
2444  05dc a48f          	and	a,#143
2445  05de 1a01          	or	a,(OFST+1,sp)
2446  05e0 c75307        	ld	21255,a
2447                     ; 515 }
2450  05e3 84            	pop	a
2451  05e4 81            	ret
2488                     ; 526 void TIM2_ForcedOC2Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2488                     ; 527 {
2489                     	switch	.text
2490  05e5               _TIM2_ForcedOC2Config:
2492  05e5 88            	push	a
2493       00000000      OFST:	set	0
2496                     ; 529   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2498  05e6 a150          	cp	a,#80
2499  05e8 2704          	jreq	L203
2500  05ea a140          	cp	a,#64
2501  05ec 2603          	jrne	L003
2502  05ee               L203:
2503  05ee 4f            	clr	a
2504  05ef 2010          	jra	L403
2505  05f1               L003:
2506  05f1 ae0211        	ldw	x,#529
2507  05f4 89            	pushw	x
2508  05f5 ae0000        	ldw	x,#0
2509  05f8 89            	pushw	x
2510  05f9 ae0000        	ldw	x,#L702
2511  05fc cd0000        	call	_assert_failed
2513  05ff 5b04          	addw	sp,#4
2514  0601               L403:
2515                     ; 532   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))  
2515                     ; 533                           | (uint8_t)TIM2_ForcedAction);
2517  0601 c65308        	ld	a,21256
2518  0604 a48f          	and	a,#143
2519  0606 1a01          	or	a,(OFST+1,sp)
2520  0608 c75308        	ld	21256,a
2521                     ; 534 }
2524  060b 84            	pop	a
2525  060c 81            	ret
2562                     ; 545 void TIM2_ForcedOC3Config(TIM2_ForcedAction_TypeDef TIM2_ForcedAction)
2562                     ; 546 {
2563                     	switch	.text
2564  060d               _TIM2_ForcedOC3Config:
2566  060d 88            	push	a
2567       00000000      OFST:	set	0
2570                     ; 548   assert_param(IS_TIM2_FORCED_ACTION_OK(TIM2_ForcedAction));
2572  060e a150          	cp	a,#80
2573  0610 2704          	jreq	L213
2574  0612 a140          	cp	a,#64
2575  0614 2603          	jrne	L013
2576  0616               L213:
2577  0616 4f            	clr	a
2578  0617 2010          	jra	L413
2579  0619               L013:
2580  0619 ae0224        	ldw	x,#548
2581  061c 89            	pushw	x
2582  061d ae0000        	ldw	x,#0
2583  0620 89            	pushw	x
2584  0621 ae0000        	ldw	x,#L702
2585  0624 cd0000        	call	_assert_failed
2587  0627 5b04          	addw	sp,#4
2588  0629               L413:
2589                     ; 551   TIM2->CCMR3  =  (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
2589                     ; 552                             | (uint8_t)TIM2_ForcedAction);
2591  0629 c65309        	ld	a,21257
2592  062c a48f          	and	a,#143
2593  062e 1a01          	or	a,(OFST+1,sp)
2594  0630 c75309        	ld	21257,a
2595                     ; 553 }
2598  0633 84            	pop	a
2599  0634 81            	ret
2636                     ; 561 void TIM2_ARRPreloadConfig(FunctionalState NewState)
2636                     ; 562 {
2637                     	switch	.text
2638  0635               _TIM2_ARRPreloadConfig:
2640  0635 88            	push	a
2641       00000000      OFST:	set	0
2644                     ; 564   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2646  0636 4d            	tnz	a
2647  0637 2704          	jreq	L223
2648  0639 a101          	cp	a,#1
2649  063b 2603          	jrne	L023
2650  063d               L223:
2651  063d 4f            	clr	a
2652  063e 2010          	jra	L423
2653  0640               L023:
2654  0640 ae0234        	ldw	x,#564
2655  0643 89            	pushw	x
2656  0644 ae0000        	ldw	x,#0
2657  0647 89            	pushw	x
2658  0648 ae0000        	ldw	x,#L702
2659  064b cd0000        	call	_assert_failed
2661  064e 5b04          	addw	sp,#4
2662  0650               L423:
2663                     ; 567   if (NewState != DISABLE)
2665  0650 0d01          	tnz	(OFST+1,sp)
2666  0652 2706          	jreq	L1301
2667                     ; 569     TIM2->CR1 |= (uint8_t)TIM2_CR1_ARPE;
2669  0654 721e5300      	bset	21248,#7
2671  0658 2004          	jra	L3301
2672  065a               L1301:
2673                     ; 573     TIM2->CR1 &= (uint8_t)(~TIM2_CR1_ARPE);
2675  065a 721f5300      	bres	21248,#7
2676  065e               L3301:
2677                     ; 575 }
2680  065e 84            	pop	a
2681  065f 81            	ret
2718                     ; 583 void TIM2_OC1PreloadConfig(FunctionalState NewState)
2718                     ; 584 {
2719                     	switch	.text
2720  0660               _TIM2_OC1PreloadConfig:
2722  0660 88            	push	a
2723       00000000      OFST:	set	0
2726                     ; 586   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2728  0661 4d            	tnz	a
2729  0662 2704          	jreq	L233
2730  0664 a101          	cp	a,#1
2731  0666 2603          	jrne	L033
2732  0668               L233:
2733  0668 4f            	clr	a
2734  0669 2010          	jra	L433
2735  066b               L033:
2736  066b ae024a        	ldw	x,#586
2737  066e 89            	pushw	x
2738  066f ae0000        	ldw	x,#0
2739  0672 89            	pushw	x
2740  0673 ae0000        	ldw	x,#L702
2741  0676 cd0000        	call	_assert_failed
2743  0679 5b04          	addw	sp,#4
2744  067b               L433:
2745                     ; 589   if (NewState != DISABLE)
2747  067b 0d01          	tnz	(OFST+1,sp)
2748  067d 2706          	jreq	L3501
2749                     ; 591     TIM2->CCMR1 |= (uint8_t)TIM2_CCMR_OCxPE;
2751  067f 72165307      	bset	21255,#3
2753  0683 2004          	jra	L5501
2754  0685               L3501:
2755                     ; 595     TIM2->CCMR1 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2757  0685 72175307      	bres	21255,#3
2758  0689               L5501:
2759                     ; 597 }
2762  0689 84            	pop	a
2763  068a 81            	ret
2800                     ; 605 void TIM2_OC2PreloadConfig(FunctionalState NewState)
2800                     ; 606 {
2801                     	switch	.text
2802  068b               _TIM2_OC2PreloadConfig:
2804  068b 88            	push	a
2805       00000000      OFST:	set	0
2808                     ; 608   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2810  068c 4d            	tnz	a
2811  068d 2704          	jreq	L243
2812  068f a101          	cp	a,#1
2813  0691 2603          	jrne	L043
2814  0693               L243:
2815  0693 4f            	clr	a
2816  0694 2010          	jra	L443
2817  0696               L043:
2818  0696 ae0260        	ldw	x,#608
2819  0699 89            	pushw	x
2820  069a ae0000        	ldw	x,#0
2821  069d 89            	pushw	x
2822  069e ae0000        	ldw	x,#L702
2823  06a1 cd0000        	call	_assert_failed
2825  06a4 5b04          	addw	sp,#4
2826  06a6               L443:
2827                     ; 611   if (NewState != DISABLE)
2829  06a6 0d01          	tnz	(OFST+1,sp)
2830  06a8 2706          	jreq	L5701
2831                     ; 613     TIM2->CCMR2 |= (uint8_t)TIM2_CCMR_OCxPE;
2833  06aa 72165308      	bset	21256,#3
2835  06ae 2004          	jra	L7701
2836  06b0               L5701:
2837                     ; 617     TIM2->CCMR2 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2839  06b0 72175308      	bres	21256,#3
2840  06b4               L7701:
2841                     ; 619 }
2844  06b4 84            	pop	a
2845  06b5 81            	ret
2882                     ; 627 void TIM2_OC3PreloadConfig(FunctionalState NewState)
2882                     ; 628 {
2883                     	switch	.text
2884  06b6               _TIM2_OC3PreloadConfig:
2886  06b6 88            	push	a
2887       00000000      OFST:	set	0
2890                     ; 630   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
2892  06b7 4d            	tnz	a
2893  06b8 2704          	jreq	L253
2894  06ba a101          	cp	a,#1
2895  06bc 2603          	jrne	L053
2896  06be               L253:
2897  06be 4f            	clr	a
2898  06bf 2010          	jra	L453
2899  06c1               L053:
2900  06c1 ae0276        	ldw	x,#630
2901  06c4 89            	pushw	x
2902  06c5 ae0000        	ldw	x,#0
2903  06c8 89            	pushw	x
2904  06c9 ae0000        	ldw	x,#L702
2905  06cc cd0000        	call	_assert_failed
2907  06cf 5b04          	addw	sp,#4
2908  06d1               L453:
2909                     ; 633   if (NewState != DISABLE)
2911  06d1 0d01          	tnz	(OFST+1,sp)
2912  06d3 2706          	jreq	L7111
2913                     ; 635     TIM2->CCMR3 |= (uint8_t)TIM2_CCMR_OCxPE;
2915  06d5 72165309      	bset	21257,#3
2917  06d9 2004          	jra	L1211
2918  06db               L7111:
2919                     ; 639     TIM2->CCMR3 &= (uint8_t)(~TIM2_CCMR_OCxPE);
2921  06db 72175309      	bres	21257,#3
2922  06df               L1211:
2923                     ; 641 }
2926  06df 84            	pop	a
2927  06e0 81            	ret
3001                     ; 653 void TIM2_GenerateEvent(TIM2_EventSource_TypeDef TIM2_EventSource)
3001                     ; 654 {
3002                     	switch	.text
3003  06e1               _TIM2_GenerateEvent:
3005  06e1 88            	push	a
3006       00000000      OFST:	set	0
3009                     ; 656   assert_param(IS_TIM2_EVENT_SOURCE_OK(TIM2_EventSource));
3011  06e2 4d            	tnz	a
3012  06e3 2703          	jreq	L063
3013  06e5 4f            	clr	a
3014  06e6 2010          	jra	L263
3015  06e8               L063:
3016  06e8 ae0290        	ldw	x,#656
3017  06eb 89            	pushw	x
3018  06ec ae0000        	ldw	x,#0
3019  06ef 89            	pushw	x
3020  06f0 ae0000        	ldw	x,#L702
3021  06f3 cd0000        	call	_assert_failed
3023  06f6 5b04          	addw	sp,#4
3024  06f8               L263:
3025                     ; 659   TIM2->EGR = (uint8_t)TIM2_EventSource;
3027  06f8 7b01          	ld	a,(OFST+1,sp)
3028  06fa c75306        	ld	21254,a
3029                     ; 660 }
3032  06fd 84            	pop	a
3033  06fe 81            	ret
3070                     ; 670 void TIM2_OC1PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3070                     ; 671 {
3071                     	switch	.text
3072  06ff               _TIM2_OC1PolarityConfig:
3074  06ff 88            	push	a
3075       00000000      OFST:	set	0
3078                     ; 673   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3080  0700 4d            	tnz	a
3081  0701 2704          	jreq	L073
3082  0703 a122          	cp	a,#34
3083  0705 2603          	jrne	L663
3084  0707               L073:
3085  0707 4f            	clr	a
3086  0708 2010          	jra	L273
3087  070a               L663:
3088  070a ae02a1        	ldw	x,#673
3089  070d 89            	pushw	x
3090  070e ae0000        	ldw	x,#0
3091  0711 89            	pushw	x
3092  0712 ae0000        	ldw	x,#L702
3093  0715 cd0000        	call	_assert_failed
3095  0718 5b04          	addw	sp,#4
3096  071a               L273:
3097                     ; 676   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3099  071a 0d01          	tnz	(OFST+1,sp)
3100  071c 2706          	jreq	L3711
3101                     ; 678     TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1P;
3103  071e 7212530a      	bset	21258,#1
3105  0722 2004          	jra	L5711
3106  0724               L3711:
3107                     ; 682     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
3109  0724 7213530a      	bres	21258,#1
3110  0728               L5711:
3111                     ; 684 }
3114  0728 84            	pop	a
3115  0729 81            	ret
3152                     ; 694 void TIM2_OC2PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3152                     ; 695 {
3153                     	switch	.text
3154  072a               _TIM2_OC2PolarityConfig:
3156  072a 88            	push	a
3157       00000000      OFST:	set	0
3160                     ; 697   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3162  072b 4d            	tnz	a
3163  072c 2704          	jreq	L004
3164  072e a122          	cp	a,#34
3165  0730 2603          	jrne	L673
3166  0732               L004:
3167  0732 4f            	clr	a
3168  0733 2010          	jra	L204
3169  0735               L673:
3170  0735 ae02b9        	ldw	x,#697
3171  0738 89            	pushw	x
3172  0739 ae0000        	ldw	x,#0
3173  073c 89            	pushw	x
3174  073d ae0000        	ldw	x,#L702
3175  0740 cd0000        	call	_assert_failed
3177  0743 5b04          	addw	sp,#4
3178  0745               L204:
3179                     ; 700   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3181  0745 0d01          	tnz	(OFST+1,sp)
3182  0747 2706          	jreq	L5121
3183                     ; 702     TIM2->CCER1 |= TIM2_CCER1_CC2P;
3185  0749 721a530a      	bset	21258,#5
3187  074d 2004          	jra	L7121
3188  074f               L5121:
3189                     ; 706     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
3191  074f 721b530a      	bres	21258,#5
3192  0753               L7121:
3193                     ; 708 }
3196  0753 84            	pop	a
3197  0754 81            	ret
3234                     ; 718 void TIM2_OC3PolarityConfig(TIM2_OCPolarity_TypeDef TIM2_OCPolarity)
3234                     ; 719 {
3235                     	switch	.text
3236  0755               _TIM2_OC3PolarityConfig:
3238  0755 88            	push	a
3239       00000000      OFST:	set	0
3242                     ; 721   assert_param(IS_TIM2_OC_POLARITY_OK(TIM2_OCPolarity));
3244  0756 4d            	tnz	a
3245  0757 2704          	jreq	L014
3246  0759 a122          	cp	a,#34
3247  075b 2603          	jrne	L604
3248  075d               L014:
3249  075d 4f            	clr	a
3250  075e 2010          	jra	L214
3251  0760               L604:
3252  0760 ae02d1        	ldw	x,#721
3253  0763 89            	pushw	x
3254  0764 ae0000        	ldw	x,#0
3255  0767 89            	pushw	x
3256  0768 ae0000        	ldw	x,#L702
3257  076b cd0000        	call	_assert_failed
3259  076e 5b04          	addw	sp,#4
3260  0770               L214:
3261                     ; 724   if (TIM2_OCPolarity != TIM2_OCPOLARITY_HIGH)
3263  0770 0d01          	tnz	(OFST+1,sp)
3264  0772 2706          	jreq	L7321
3265                     ; 726     TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3P;
3267  0774 7212530b      	bset	21259,#1
3269  0778 2004          	jra	L1421
3270  077a               L7321:
3271                     ; 730     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
3273  077a 7213530b      	bres	21259,#1
3274  077e               L1421:
3275                     ; 732 }
3278  077e 84            	pop	a
3279  077f 81            	ret
3325                     ; 745 void TIM2_CCxCmd(TIM2_Channel_TypeDef TIM2_Channel, FunctionalState NewState)
3325                     ; 746 {
3326                     	switch	.text
3327  0780               _TIM2_CCxCmd:
3329  0780 89            	pushw	x
3330       00000000      OFST:	set	0
3333                     ; 748   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3335  0781 9e            	ld	a,xh
3336  0782 4d            	tnz	a
3337  0783 270a          	jreq	L024
3338  0785 9e            	ld	a,xh
3339  0786 a101          	cp	a,#1
3340  0788 2705          	jreq	L024
3341  078a 9e            	ld	a,xh
3342  078b a102          	cp	a,#2
3343  078d 2603          	jrne	L614
3344  078f               L024:
3345  078f 4f            	clr	a
3346  0790 2010          	jra	L224
3347  0792               L614:
3348  0792 ae02ec        	ldw	x,#748
3349  0795 89            	pushw	x
3350  0796 ae0000        	ldw	x,#0
3351  0799 89            	pushw	x
3352  079a ae0000        	ldw	x,#L702
3353  079d cd0000        	call	_assert_failed
3355  07a0 5b04          	addw	sp,#4
3356  07a2               L224:
3357                     ; 749   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
3359  07a2 0d02          	tnz	(OFST+2,sp)
3360  07a4 2706          	jreq	L624
3361  07a6 7b02          	ld	a,(OFST+2,sp)
3362  07a8 a101          	cp	a,#1
3363  07aa 2603          	jrne	L424
3364  07ac               L624:
3365  07ac 4f            	clr	a
3366  07ad 2010          	jra	L034
3367  07af               L424:
3368  07af ae02ed        	ldw	x,#749
3369  07b2 89            	pushw	x
3370  07b3 ae0000        	ldw	x,#0
3371  07b6 89            	pushw	x
3372  07b7 ae0000        	ldw	x,#L702
3373  07ba cd0000        	call	_assert_failed
3375  07bd 5b04          	addw	sp,#4
3376  07bf               L034:
3377                     ; 751   if (TIM2_Channel == TIM2_CHANNEL_1)
3379  07bf 0d01          	tnz	(OFST+1,sp)
3380  07c1 2610          	jrne	L5621
3381                     ; 754     if (NewState != DISABLE)
3383  07c3 0d02          	tnz	(OFST+2,sp)
3384  07c5 2706          	jreq	L7621
3385                     ; 756       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC1E;
3387  07c7 7210530a      	bset	21258,#0
3389  07cb 202a          	jra	L3721
3390  07cd               L7621:
3391                     ; 760       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3393  07cd 7211530a      	bres	21258,#0
3394  07d1 2024          	jra	L3721
3395  07d3               L5621:
3396                     ; 764   else if (TIM2_Channel == TIM2_CHANNEL_2)
3398  07d3 7b01          	ld	a,(OFST+1,sp)
3399  07d5 a101          	cp	a,#1
3400  07d7 2610          	jrne	L5721
3401                     ; 767     if (NewState != DISABLE)
3403  07d9 0d02          	tnz	(OFST+2,sp)
3404  07db 2706          	jreq	L7721
3405                     ; 769       TIM2->CCER1 |= (uint8_t)TIM2_CCER1_CC2E;
3407  07dd 7218530a      	bset	21258,#4
3409  07e1 2014          	jra	L3721
3410  07e3               L7721:
3411                     ; 773       TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3413  07e3 7219530a      	bres	21258,#4
3414  07e7 200e          	jra	L3721
3415  07e9               L5721:
3416                     ; 779     if (NewState != DISABLE)
3418  07e9 0d02          	tnz	(OFST+2,sp)
3419  07eb 2706          	jreq	L5031
3420                     ; 781       TIM2->CCER2 |= (uint8_t)TIM2_CCER2_CC3E;
3422  07ed 7210530b      	bset	21259,#0
3424  07f1 2004          	jra	L3721
3425  07f3               L5031:
3426                     ; 785       TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3428  07f3 7211530b      	bres	21259,#0
3429  07f7               L3721:
3430                     ; 788 }
3433  07f7 85            	popw	x
3434  07f8 81            	ret
3480                     ; 810 void TIM2_SelectOCxM(TIM2_Channel_TypeDef TIM2_Channel, TIM2_OCMode_TypeDef TIM2_OCMode)
3480                     ; 811 {
3481                     	switch	.text
3482  07f9               _TIM2_SelectOCxM:
3484  07f9 89            	pushw	x
3485       00000000      OFST:	set	0
3488                     ; 813   assert_param(IS_TIM2_CHANNEL_OK(TIM2_Channel));
3490  07fa 9e            	ld	a,xh
3491  07fb 4d            	tnz	a
3492  07fc 270a          	jreq	L634
3493  07fe 9e            	ld	a,xh
3494  07ff a101          	cp	a,#1
3495  0801 2705          	jreq	L634
3496  0803 9e            	ld	a,xh
3497  0804 a102          	cp	a,#2
3498  0806 2603          	jrne	L434
3499  0808               L634:
3500  0808 4f            	clr	a
3501  0809 2010          	jra	L044
3502  080b               L434:
3503  080b ae032d        	ldw	x,#813
3504  080e 89            	pushw	x
3505  080f ae0000        	ldw	x,#0
3506  0812 89            	pushw	x
3507  0813 ae0000        	ldw	x,#L702
3508  0816 cd0000        	call	_assert_failed
3510  0819 5b04          	addw	sp,#4
3511  081b               L044:
3512                     ; 814   assert_param(IS_TIM2_OCM_OK(TIM2_OCMode));
3514  081b 0d02          	tnz	(OFST+2,sp)
3515  081d 272a          	jreq	L444
3516  081f 7b02          	ld	a,(OFST+2,sp)
3517  0821 a110          	cp	a,#16
3518  0823 2724          	jreq	L444
3519  0825 7b02          	ld	a,(OFST+2,sp)
3520  0827 a120          	cp	a,#32
3521  0829 271e          	jreq	L444
3522  082b 7b02          	ld	a,(OFST+2,sp)
3523  082d a130          	cp	a,#48
3524  082f 2718          	jreq	L444
3525  0831 7b02          	ld	a,(OFST+2,sp)
3526  0833 a160          	cp	a,#96
3527  0835 2712          	jreq	L444
3528  0837 7b02          	ld	a,(OFST+2,sp)
3529  0839 a170          	cp	a,#112
3530  083b 270c          	jreq	L444
3531  083d 7b02          	ld	a,(OFST+2,sp)
3532  083f a150          	cp	a,#80
3533  0841 2706          	jreq	L444
3534  0843 7b02          	ld	a,(OFST+2,sp)
3535  0845 a140          	cp	a,#64
3536  0847 2603          	jrne	L244
3537  0849               L444:
3538  0849 4f            	clr	a
3539  084a 2010          	jra	L644
3540  084c               L244:
3541  084c ae032e        	ldw	x,#814
3542  084f 89            	pushw	x
3543  0850 ae0000        	ldw	x,#0
3544  0853 89            	pushw	x
3545  0854 ae0000        	ldw	x,#L702
3546  0857 cd0000        	call	_assert_failed
3548  085a 5b04          	addw	sp,#4
3549  085c               L644:
3550                     ; 816   if (TIM2_Channel == TIM2_CHANNEL_1)
3552  085c 0d01          	tnz	(OFST+1,sp)
3553  085e 2610          	jrne	L3331
3554                     ; 819     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
3556  0860 7211530a      	bres	21258,#0
3557                     ; 822     TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_OCM))
3557                     ; 823                             | (uint8_t)TIM2_OCMode);
3559  0864 c65307        	ld	a,21255
3560  0867 a48f          	and	a,#143
3561  0869 1a02          	or	a,(OFST+2,sp)
3562  086b c75307        	ld	21255,a
3564  086e 2024          	jra	L5331
3565  0870               L3331:
3566                     ; 825   else if (TIM2_Channel == TIM2_CHANNEL_2)
3568  0870 7b01          	ld	a,(OFST+1,sp)
3569  0872 a101          	cp	a,#1
3570  0874 2610          	jrne	L7331
3571                     ; 828     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
3573  0876 7219530a      	bres	21258,#4
3574                     ; 831     TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_OCM))
3574                     ; 832                             | (uint8_t)TIM2_OCMode);
3576  087a c65308        	ld	a,21256
3577  087d a48f          	and	a,#143
3578  087f 1a02          	or	a,(OFST+2,sp)
3579  0881 c75308        	ld	21256,a
3581  0884 200e          	jra	L5331
3582  0886               L7331:
3583                     ; 837     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3E);
3585  0886 7211530b      	bres	21259,#0
3586                     ; 840     TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_OCM))
3586                     ; 841                             | (uint8_t)TIM2_OCMode);
3588  088a c65309        	ld	a,21257
3589  088d a48f          	and	a,#143
3590  088f 1a02          	or	a,(OFST+2,sp)
3591  0891 c75309        	ld	21257,a
3592  0894               L5331:
3593                     ; 843 }
3596  0894 85            	popw	x
3597  0895 81            	ret
3631                     ; 851 void TIM2_SetCounter(uint16_t Counter)
3631                     ; 852 {
3632                     	switch	.text
3633  0896               _TIM2_SetCounter:
3637                     ; 854   TIM2->CNTRH = (uint8_t)(Counter >> 8);
3639  0896 9e            	ld	a,xh
3640  0897 c7530c        	ld	21260,a
3641                     ; 855   TIM2->CNTRL = (uint8_t)(Counter);
3643  089a 9f            	ld	a,xl
3644  089b c7530d        	ld	21261,a
3645                     ; 856 }
3648  089e 81            	ret
3682                     ; 864 void TIM2_SetAutoreload(uint16_t Autoreload)
3682                     ; 865 {
3683                     	switch	.text
3684  089f               _TIM2_SetAutoreload:
3688                     ; 867   TIM2->ARRH = (uint8_t)(Autoreload >> 8);
3690  089f 9e            	ld	a,xh
3691  08a0 c7530f        	ld	21263,a
3692                     ; 868   TIM2->ARRL = (uint8_t)(Autoreload);
3694  08a3 9f            	ld	a,xl
3695  08a4 c75310        	ld	21264,a
3696                     ; 869 }
3699  08a7 81            	ret
3733                     ; 877 void TIM2_SetCompare1(uint16_t Compare1)
3733                     ; 878 {
3734                     	switch	.text
3735  08a8               _TIM2_SetCompare1:
3739                     ; 880   TIM2->CCR1H = (uint8_t)(Compare1 >> 8);
3741  08a8 9e            	ld	a,xh
3742  08a9 c75311        	ld	21265,a
3743                     ; 881   TIM2->CCR1L = (uint8_t)(Compare1);
3745  08ac 9f            	ld	a,xl
3746  08ad c75312        	ld	21266,a
3747                     ; 882 }
3750  08b0 81            	ret
3784                     ; 890 void TIM2_SetCompare2(uint16_t Compare2)
3784                     ; 891 {
3785                     	switch	.text
3786  08b1               _TIM2_SetCompare2:
3790                     ; 893   TIM2->CCR2H = (uint8_t)(Compare2 >> 8);
3792  08b1 9e            	ld	a,xh
3793  08b2 c75313        	ld	21267,a
3794                     ; 894   TIM2->CCR2L = (uint8_t)(Compare2);
3796  08b5 9f            	ld	a,xl
3797  08b6 c75314        	ld	21268,a
3798                     ; 895 }
3801  08b9 81            	ret
3835                     ; 903 void TIM2_SetCompare3(uint16_t Compare3)
3835                     ; 904 {
3836                     	switch	.text
3837  08ba               _TIM2_SetCompare3:
3841                     ; 906   TIM2->CCR3H = (uint8_t)(Compare3 >> 8);
3843  08ba 9e            	ld	a,xh
3844  08bb c75315        	ld	21269,a
3845                     ; 907   TIM2->CCR3L = (uint8_t)(Compare3);
3847  08be 9f            	ld	a,xl
3848  08bf c75316        	ld	21270,a
3849                     ; 908 }
3852  08c2 81            	ret
3889                     ; 920 void TIM2_SetIC1Prescaler(TIM2_ICPSC_TypeDef TIM2_IC1Prescaler)
3889                     ; 921 {
3890                     	switch	.text
3891  08c3               _TIM2_SetIC1Prescaler:
3893  08c3 88            	push	a
3894       00000000      OFST:	set	0
3897                     ; 923   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC1Prescaler));
3899  08c4 4d            	tnz	a
3900  08c5 270c          	jreq	L664
3901  08c7 a104          	cp	a,#4
3902  08c9 2708          	jreq	L664
3903  08cb a108          	cp	a,#8
3904  08cd 2704          	jreq	L664
3905  08cf a10c          	cp	a,#12
3906  08d1 2603          	jrne	L464
3907  08d3               L664:
3908  08d3 4f            	clr	a
3909  08d4 2010          	jra	L074
3910  08d6               L464:
3911  08d6 ae039b        	ldw	x,#923
3912  08d9 89            	pushw	x
3913  08da ae0000        	ldw	x,#0
3914  08dd 89            	pushw	x
3915  08de ae0000        	ldw	x,#L702
3916  08e1 cd0000        	call	_assert_failed
3918  08e4 5b04          	addw	sp,#4
3919  08e6               L074:
3920                     ; 926   TIM2->CCMR1 = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3920                     ; 927                           | (uint8_t)TIM2_IC1Prescaler);
3922  08e6 c65307        	ld	a,21255
3923  08e9 a4f3          	and	a,#243
3924  08eb 1a01          	or	a,(OFST+1,sp)
3925  08ed c75307        	ld	21255,a
3926                     ; 928 }
3929  08f0 84            	pop	a
3930  08f1 81            	ret
3967                     ; 940 void TIM2_SetIC2Prescaler(TIM2_ICPSC_TypeDef TIM2_IC2Prescaler)
3967                     ; 941 {
3968                     	switch	.text
3969  08f2               _TIM2_SetIC2Prescaler:
3971  08f2 88            	push	a
3972       00000000      OFST:	set	0
3975                     ; 943   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC2Prescaler));
3977  08f3 4d            	tnz	a
3978  08f4 270c          	jreq	L674
3979  08f6 a104          	cp	a,#4
3980  08f8 2708          	jreq	L674
3981  08fa a108          	cp	a,#8
3982  08fc 2704          	jreq	L674
3983  08fe a10c          	cp	a,#12
3984  0900 2603          	jrne	L474
3985  0902               L674:
3986  0902 4f            	clr	a
3987  0903 2010          	jra	L005
3988  0905               L474:
3989  0905 ae03af        	ldw	x,#943
3990  0908 89            	pushw	x
3991  0909 ae0000        	ldw	x,#0
3992  090c 89            	pushw	x
3993  090d ae0000        	ldw	x,#L702
3994  0910 cd0000        	call	_assert_failed
3996  0913 5b04          	addw	sp,#4
3997  0915               L005:
3998                     ; 946   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~TIM2_CCMR_ICxPSC))
3998                     ; 947                           | (uint8_t)TIM2_IC2Prescaler);
4000  0915 c65308        	ld	a,21256
4001  0918 a4f3          	and	a,#243
4002  091a 1a01          	or	a,(OFST+1,sp)
4003  091c c75308        	ld	21256,a
4004                     ; 948 }
4007  091f 84            	pop	a
4008  0920 81            	ret
4045                     ; 960 void TIM2_SetIC3Prescaler(TIM2_ICPSC_TypeDef TIM2_IC3Prescaler)
4045                     ; 961 {
4046                     	switch	.text
4047  0921               _TIM2_SetIC3Prescaler:
4049  0921 88            	push	a
4050       00000000      OFST:	set	0
4053                     ; 964   assert_param(IS_TIM2_IC_PRESCALER_OK(TIM2_IC3Prescaler));
4055  0922 4d            	tnz	a
4056  0923 270c          	jreq	L605
4057  0925 a104          	cp	a,#4
4058  0927 2708          	jreq	L605
4059  0929 a108          	cp	a,#8
4060  092b 2704          	jreq	L605
4061  092d a10c          	cp	a,#12
4062  092f 2603          	jrne	L405
4063  0931               L605:
4064  0931 4f            	clr	a
4065  0932 2010          	jra	L015
4066  0934               L405:
4067  0934 ae03c4        	ldw	x,#964
4068  0937 89            	pushw	x
4069  0938 ae0000        	ldw	x,#0
4070  093b 89            	pushw	x
4071  093c ae0000        	ldw	x,#L702
4072  093f cd0000        	call	_assert_failed
4074  0942 5b04          	addw	sp,#4
4075  0944               L015:
4076                     ; 966   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~TIM2_CCMR_ICxPSC))
4076                     ; 967                           | (uint8_t)TIM2_IC3Prescaler);
4078  0944 c65309        	ld	a,21257
4079  0947 a4f3          	and	a,#243
4080  0949 1a01          	or	a,(OFST+1,sp)
4081  094b c75309        	ld	21257,a
4082                     ; 968 }
4085  094e 84            	pop	a
4086  094f 81            	ret
4138                     ; 975 uint16_t TIM2_GetCapture1(void)
4138                     ; 976 {
4139                     	switch	.text
4140  0950               _TIM2_GetCapture1:
4142  0950 5204          	subw	sp,#4
4143       00000004      OFST:	set	4
4146                     ; 978   uint16_t tmpccr1 = 0;
4148                     ; 979   uint8_t tmpccr1l=0, tmpccr1h=0;
4152                     ; 981   tmpccr1h = TIM2->CCR1H;
4154  0952 c65311        	ld	a,21265
4155  0955 6b02          	ld	(OFST-2,sp),a
4157                     ; 982   tmpccr1l = TIM2->CCR1L;
4159  0957 c65312        	ld	a,21266
4160  095a 6b01          	ld	(OFST-3,sp),a
4162                     ; 984   tmpccr1 = (uint16_t)(tmpccr1l);
4164  095c 7b01          	ld	a,(OFST-3,sp)
4165  095e 5f            	clrw	x
4166  095f 97            	ld	xl,a
4167  0960 1f03          	ldw	(OFST-1,sp),x
4169                     ; 985   tmpccr1 |= (uint16_t)((uint16_t)tmpccr1h << 8);
4171  0962 7b02          	ld	a,(OFST-2,sp)
4172  0964 5f            	clrw	x
4173  0965 97            	ld	xl,a
4174  0966 4f            	clr	a
4175  0967 02            	rlwa	x,a
4176  0968 01            	rrwa	x,a
4177  0969 1a04          	or	a,(OFST+0,sp)
4178  096b 01            	rrwa	x,a
4179  096c 1a03          	or	a,(OFST-1,sp)
4180  096e 01            	rrwa	x,a
4181  096f 1f03          	ldw	(OFST-1,sp),x
4183                     ; 987   return (uint16_t)tmpccr1;
4185  0971 1e03          	ldw	x,(OFST-1,sp)
4188  0973 5b04          	addw	sp,#4
4189  0975 81            	ret
4241                     ; 995 uint16_t TIM2_GetCapture2(void)
4241                     ; 996 {
4242                     	switch	.text
4243  0976               _TIM2_GetCapture2:
4245  0976 5204          	subw	sp,#4
4246       00000004      OFST:	set	4
4249                     ; 998   uint16_t tmpccr2 = 0;
4251                     ; 999   uint8_t tmpccr2l=0, tmpccr2h=0;
4255                     ; 1001   tmpccr2h = TIM2->CCR2H;
4257  0978 c65313        	ld	a,21267
4258  097b 6b02          	ld	(OFST-2,sp),a
4260                     ; 1002   tmpccr2l = TIM2->CCR2L;
4262  097d c65314        	ld	a,21268
4263  0980 6b01          	ld	(OFST-3,sp),a
4265                     ; 1004   tmpccr2 = (uint16_t)(tmpccr2l);
4267  0982 7b01          	ld	a,(OFST-3,sp)
4268  0984 5f            	clrw	x
4269  0985 97            	ld	xl,a
4270  0986 1f03          	ldw	(OFST-1,sp),x
4272                     ; 1005   tmpccr2 |= (uint16_t)((uint16_t)tmpccr2h << 8);
4274  0988 7b02          	ld	a,(OFST-2,sp)
4275  098a 5f            	clrw	x
4276  098b 97            	ld	xl,a
4277  098c 4f            	clr	a
4278  098d 02            	rlwa	x,a
4279  098e 01            	rrwa	x,a
4280  098f 1a04          	or	a,(OFST+0,sp)
4281  0991 01            	rrwa	x,a
4282  0992 1a03          	or	a,(OFST-1,sp)
4283  0994 01            	rrwa	x,a
4284  0995 1f03          	ldw	(OFST-1,sp),x
4286                     ; 1007   return (uint16_t)tmpccr2;
4288  0997 1e03          	ldw	x,(OFST-1,sp)
4291  0999 5b04          	addw	sp,#4
4292  099b 81            	ret
4344                     ; 1015 uint16_t TIM2_GetCapture3(void)
4344                     ; 1016 {
4345                     	switch	.text
4346  099c               _TIM2_GetCapture3:
4348  099c 5204          	subw	sp,#4
4349       00000004      OFST:	set	4
4352                     ; 1018   uint16_t tmpccr3 = 0;
4354                     ; 1019   uint8_t tmpccr3l=0, tmpccr3h=0;
4358                     ; 1021   tmpccr3h = TIM2->CCR3H;
4360  099e c65315        	ld	a,21269
4361  09a1 6b02          	ld	(OFST-2,sp),a
4363                     ; 1022   tmpccr3l = TIM2->CCR3L;
4365  09a3 c65316        	ld	a,21270
4366  09a6 6b01          	ld	(OFST-3,sp),a
4368                     ; 1024   tmpccr3 = (uint16_t)(tmpccr3l);
4370  09a8 7b01          	ld	a,(OFST-3,sp)
4371  09aa 5f            	clrw	x
4372  09ab 97            	ld	xl,a
4373  09ac 1f03          	ldw	(OFST-1,sp),x
4375                     ; 1025   tmpccr3 |= (uint16_t)((uint16_t)tmpccr3h << 8);
4377  09ae 7b02          	ld	a,(OFST-2,sp)
4378  09b0 5f            	clrw	x
4379  09b1 97            	ld	xl,a
4380  09b2 4f            	clr	a
4381  09b3 02            	rlwa	x,a
4382  09b4 01            	rrwa	x,a
4383  09b5 1a04          	or	a,(OFST+0,sp)
4384  09b7 01            	rrwa	x,a
4385  09b8 1a03          	or	a,(OFST-1,sp)
4386  09ba 01            	rrwa	x,a
4387  09bb 1f03          	ldw	(OFST-1,sp),x
4389                     ; 1027   return (uint16_t)tmpccr3;
4391  09bd 1e03          	ldw	x,(OFST-1,sp)
4394  09bf 5b04          	addw	sp,#4
4395  09c1 81            	ret
4429                     ; 1035 uint16_t TIM2_GetCounter(void)
4429                     ; 1036 {
4430                     	switch	.text
4431  09c2               _TIM2_GetCounter:
4433  09c2 89            	pushw	x
4434       00000002      OFST:	set	2
4437                     ; 1037   uint16_t tmpcntr = 0;
4439                     ; 1039   tmpcntr =  ((uint16_t)TIM2->CNTRH << 8);
4441  09c3 c6530c        	ld	a,21260
4442  09c6 5f            	clrw	x
4443  09c7 97            	ld	xl,a
4444  09c8 4f            	clr	a
4445  09c9 02            	rlwa	x,a
4446  09ca 1f01          	ldw	(OFST-1,sp),x
4448                     ; 1041   return (uint16_t)( tmpcntr| (uint16_t)(TIM2->CNTRL));
4450  09cc c6530d        	ld	a,21261
4451  09cf 5f            	clrw	x
4452  09d0 97            	ld	xl,a
4453  09d1 01            	rrwa	x,a
4454  09d2 1a02          	or	a,(OFST+0,sp)
4455  09d4 01            	rrwa	x,a
4456  09d5 1a01          	or	a,(OFST-1,sp)
4457  09d7 01            	rrwa	x,a
4460  09d8 5b02          	addw	sp,#2
4461  09da 81            	ret
4485                     ; 1049 TIM2_Prescaler_TypeDef TIM2_GetPrescaler(void)
4485                     ; 1050 {
4486                     	switch	.text
4487  09db               _TIM2_GetPrescaler:
4491                     ; 1052   return (TIM2_Prescaler_TypeDef)(TIM2->PSCR);
4493  09db c6530e        	ld	a,21262
4496  09de 81            	ret
4636                     ; 1068 FlagStatus TIM2_GetFlagStatus(TIM2_FLAG_TypeDef TIM2_FLAG)
4636                     ; 1069 {
4637                     	switch	.text
4638  09df               _TIM2_GetFlagStatus:
4640  09df 89            	pushw	x
4641  09e0 89            	pushw	x
4642       00000002      OFST:	set	2
4645                     ; 1070   FlagStatus bitstatus = RESET;
4647                     ; 1071   uint8_t tim2_flag_l = 0, tim2_flag_h = 0;
4651                     ; 1074   assert_param(IS_TIM2_GET_FLAG_OK(TIM2_FLAG));
4653  09e1 a30001        	cpw	x,#1
4654  09e4 271e          	jreq	L035
4655  09e6 a30002        	cpw	x,#2
4656  09e9 2719          	jreq	L035
4657  09eb a30004        	cpw	x,#4
4658  09ee 2714          	jreq	L035
4659  09f0 a30008        	cpw	x,#8
4660  09f3 270f          	jreq	L035
4661  09f5 a30200        	cpw	x,#512
4662  09f8 270a          	jreq	L035
4663  09fa a30400        	cpw	x,#1024
4664  09fd 2705          	jreq	L035
4665  09ff a30800        	cpw	x,#2048
4666  0a02 2603          	jrne	L625
4667  0a04               L035:
4668  0a04 4f            	clr	a
4669  0a05 2010          	jra	L235
4670  0a07               L625:
4671  0a07 ae0432        	ldw	x,#1074
4672  0a0a 89            	pushw	x
4673  0a0b ae0000        	ldw	x,#0
4674  0a0e 89            	pushw	x
4675  0a0f ae0000        	ldw	x,#L702
4676  0a12 cd0000        	call	_assert_failed
4678  0a15 5b04          	addw	sp,#4
4679  0a17               L235:
4680                     ; 1076   tim2_flag_l = (uint8_t)(TIM2->SR1 & (uint8_t)TIM2_FLAG);
4682  0a17 c65304        	ld	a,21252
4683  0a1a 1404          	and	a,(OFST+2,sp)
4684  0a1c 6b01          	ld	(OFST-1,sp),a
4686                     ; 1077   tim2_flag_h = (uint8_t)((uint16_t)TIM2_FLAG >> 8);
4688  0a1e 7b03          	ld	a,(OFST+1,sp)
4689  0a20 6b02          	ld	(OFST+0,sp),a
4691                     ; 1079   if ((tim2_flag_l | (uint8_t)(TIM2->SR2 & tim2_flag_h)) != (uint8_t)RESET )
4693  0a22 c65305        	ld	a,21253
4694  0a25 1402          	and	a,(OFST+0,sp)
4695  0a27 1a01          	or	a,(OFST-1,sp)
4696  0a29 2706          	jreq	L7371
4697                     ; 1081     bitstatus = SET;
4699  0a2b a601          	ld	a,#1
4700  0a2d 6b02          	ld	(OFST+0,sp),a
4703  0a2f 2002          	jra	L1471
4704  0a31               L7371:
4705                     ; 1085     bitstatus = RESET;
4707  0a31 0f02          	clr	(OFST+0,sp)
4709  0a33               L1471:
4710                     ; 1087   return (FlagStatus)bitstatus;
4712  0a33 7b02          	ld	a,(OFST+0,sp)
4715  0a35 5b04          	addw	sp,#4
4716  0a37 81            	ret
4752                     ; 1103 void TIM2_ClearFlag(TIM2_FLAG_TypeDef TIM2_FLAG)
4752                     ; 1104 {
4753                     	switch	.text
4754  0a38               _TIM2_ClearFlag:
4756  0a38 89            	pushw	x
4757       00000000      OFST:	set	0
4760                     ; 1106   assert_param(IS_TIM2_CLEAR_FLAG_OK(TIM2_FLAG));
4762  0a39 01            	rrwa	x,a
4763  0a3a a4f0          	and	a,#240
4764  0a3c 01            	rrwa	x,a
4765  0a3d a4f1          	and	a,#241
4766  0a3f 01            	rrwa	x,a
4767  0a40 a30000        	cpw	x,#0
4768  0a43 2607          	jrne	L635
4769  0a45 1e01          	ldw	x,(OFST+1,sp)
4770  0a47 2703          	jreq	L635
4771  0a49 4f            	clr	a
4772  0a4a 2010          	jra	L045
4773  0a4c               L635:
4774  0a4c ae0452        	ldw	x,#1106
4775  0a4f 89            	pushw	x
4776  0a50 ae0000        	ldw	x,#0
4777  0a53 89            	pushw	x
4778  0a54 ae0000        	ldw	x,#L702
4779  0a57 cd0000        	call	_assert_failed
4781  0a5a 5b04          	addw	sp,#4
4782  0a5c               L045:
4783                     ; 1109   TIM2->SR1 = (uint8_t)(~((uint8_t)(TIM2_FLAG)));
4785  0a5c 7b02          	ld	a,(OFST+2,sp)
4786  0a5e 43            	cpl	a
4787  0a5f c75304        	ld	21252,a
4788                     ; 1110   TIM2->SR2 = (uint8_t)(~((uint8_t)((uint8_t)TIM2_FLAG >> 8)));
4790  0a62 35ff5305      	mov	21253,#255
4791                     ; 1111 }
4794  0a66 85            	popw	x
4795  0a67 81            	ret
4860                     ; 1123 ITStatus TIM2_GetITStatus(TIM2_IT_TypeDef TIM2_IT)
4860                     ; 1124 {
4861                     	switch	.text
4862  0a68               _TIM2_GetITStatus:
4864  0a68 88            	push	a
4865  0a69 89            	pushw	x
4866       00000002      OFST:	set	2
4869                     ; 1125   ITStatus bitstatus = RESET;
4871                     ; 1126   uint8_t TIM2_itStatus = 0, TIM2_itEnable = 0;
4875                     ; 1129   assert_param(IS_TIM2_GET_IT_OK(TIM2_IT));
4877  0a6a a101          	cp	a,#1
4878  0a6c 270c          	jreq	L645
4879  0a6e a102          	cp	a,#2
4880  0a70 2708          	jreq	L645
4881  0a72 a104          	cp	a,#4
4882  0a74 2704          	jreq	L645
4883  0a76 a108          	cp	a,#8
4884  0a78 2603          	jrne	L445
4885  0a7a               L645:
4886  0a7a 4f            	clr	a
4887  0a7b 2010          	jra	L055
4888  0a7d               L445:
4889  0a7d ae0469        	ldw	x,#1129
4890  0a80 89            	pushw	x
4891  0a81 ae0000        	ldw	x,#0
4892  0a84 89            	pushw	x
4893  0a85 ae0000        	ldw	x,#L702
4894  0a88 cd0000        	call	_assert_failed
4896  0a8b 5b04          	addw	sp,#4
4897  0a8d               L055:
4898                     ; 1131   TIM2_itStatus = (uint8_t)(TIM2->SR1 & TIM2_IT);
4900  0a8d c65304        	ld	a,21252
4901  0a90 1403          	and	a,(OFST+1,sp)
4902  0a92 6b01          	ld	(OFST-1,sp),a
4904                     ; 1133   TIM2_itEnable = (uint8_t)(TIM2->IER & TIM2_IT);
4906  0a94 c65303        	ld	a,21251
4907  0a97 1403          	and	a,(OFST+1,sp)
4908  0a99 6b02          	ld	(OFST+0,sp),a
4910                     ; 1135   if ((TIM2_itStatus != (uint8_t)RESET ) && (TIM2_itEnable != (uint8_t)RESET ))
4912  0a9b 0d01          	tnz	(OFST-1,sp)
4913  0a9d 270a          	jreq	L3102
4915  0a9f 0d02          	tnz	(OFST+0,sp)
4916  0aa1 2706          	jreq	L3102
4917                     ; 1137     bitstatus = SET;
4919  0aa3 a601          	ld	a,#1
4920  0aa5 6b02          	ld	(OFST+0,sp),a
4923  0aa7 2002          	jra	L5102
4924  0aa9               L3102:
4925                     ; 1141     bitstatus = RESET;
4927  0aa9 0f02          	clr	(OFST+0,sp)
4929  0aab               L5102:
4930                     ; 1143   return (ITStatus)(bitstatus);
4932  0aab 7b02          	ld	a,(OFST+0,sp)
4935  0aad 5b03          	addw	sp,#3
4936  0aaf 81            	ret
4973                     ; 1156 void TIM2_ClearITPendingBit(TIM2_IT_TypeDef TIM2_IT)
4973                     ; 1157 {
4974                     	switch	.text
4975  0ab0               _TIM2_ClearITPendingBit:
4977  0ab0 88            	push	a
4978       00000000      OFST:	set	0
4981                     ; 1159   assert_param(IS_TIM2_IT_OK(TIM2_IT));
4983  0ab1 4d            	tnz	a
4984  0ab2 2707          	jreq	L455
4985  0ab4 a110          	cp	a,#16
4986  0ab6 2403          	jruge	L455
4987  0ab8 4f            	clr	a
4988  0ab9 2010          	jra	L655
4989  0abb               L455:
4990  0abb ae0487        	ldw	x,#1159
4991  0abe 89            	pushw	x
4992  0abf ae0000        	ldw	x,#0
4993  0ac2 89            	pushw	x
4994  0ac3 ae0000        	ldw	x,#L702
4995  0ac6 cd0000        	call	_assert_failed
4997  0ac9 5b04          	addw	sp,#4
4998  0acb               L655:
4999                     ; 1162   TIM2->SR1 = (uint8_t)(~TIM2_IT);
5001  0acb 7b01          	ld	a,(OFST+1,sp)
5002  0acd 43            	cpl	a
5003  0ace c75304        	ld	21252,a
5004                     ; 1163 }
5007  0ad1 84            	pop	a
5008  0ad2 81            	ret
5060                     ; 1181 static void TI1_Config(uint8_t TIM2_ICPolarity,
5060                     ; 1182                        uint8_t TIM2_ICSelection,
5060                     ; 1183                        uint8_t TIM2_ICFilter)
5060                     ; 1184 {
5061                     	switch	.text
5062  0ad3               L3_TI1_Config:
5064  0ad3 89            	pushw	x
5065  0ad4 88            	push	a
5066       00000001      OFST:	set	1
5069                     ; 1186   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1E);
5071  0ad5 7211530a      	bres	21258,#0
5072                     ; 1189   TIM2->CCMR1  = (uint8_t)((uint8_t)(TIM2->CCMR1 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF )))
5072                     ; 1190                            | (uint8_t)(((TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5074  0ad9 7b06          	ld	a,(OFST+5,sp)
5075  0adb 97            	ld	xl,a
5076  0adc a610          	ld	a,#16
5077  0ade 42            	mul	x,a
5078  0adf 9f            	ld	a,xl
5079  0ae0 1a03          	or	a,(OFST+2,sp)
5080  0ae2 6b01          	ld	(OFST+0,sp),a
5082  0ae4 c65307        	ld	a,21255
5083  0ae7 a40c          	and	a,#12
5084  0ae9 1a01          	or	a,(OFST+0,sp)
5085  0aeb c75307        	ld	21255,a
5086                     ; 1193   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5088  0aee 0d02          	tnz	(OFST+1,sp)
5089  0af0 2706          	jreq	L3602
5090                     ; 1195     TIM2->CCER1 |= TIM2_CCER1_CC1P;
5092  0af2 7212530a      	bset	21258,#1
5094  0af6 2004          	jra	L5602
5095  0af8               L3602:
5096                     ; 1199     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC1P);
5098  0af8 7213530a      	bres	21258,#1
5099  0afc               L5602:
5100                     ; 1202   TIM2->CCER1 |= TIM2_CCER1_CC1E;
5102  0afc 7210530a      	bset	21258,#0
5103                     ; 1203 }
5106  0b00 5b03          	addw	sp,#3
5107  0b02 81            	ret
5159                     ; 1221 static void TI2_Config(uint8_t TIM2_ICPolarity,
5159                     ; 1222                        uint8_t TIM2_ICSelection,
5159                     ; 1223                        uint8_t TIM2_ICFilter)
5159                     ; 1224 {
5160                     	switch	.text
5161  0b03               L5_TI2_Config:
5163  0b03 89            	pushw	x
5164  0b04 88            	push	a
5165       00000001      OFST:	set	1
5168                     ; 1226   TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2E);
5170  0b05 7219530a      	bres	21258,#4
5171                     ; 1229   TIM2->CCMR2 = (uint8_t)((uint8_t)(TIM2->CCMR2 & (uint8_t)(~(uint8_t)( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF ))) 
5171                     ; 1230                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5173  0b09 7b06          	ld	a,(OFST+5,sp)
5174  0b0b 97            	ld	xl,a
5175  0b0c a610          	ld	a,#16
5176  0b0e 42            	mul	x,a
5177  0b0f 9f            	ld	a,xl
5178  0b10 1a03          	or	a,(OFST+2,sp)
5179  0b12 6b01          	ld	(OFST+0,sp),a
5181  0b14 c65308        	ld	a,21256
5182  0b17 a40c          	and	a,#12
5183  0b19 1a01          	or	a,(OFST+0,sp)
5184  0b1b c75308        	ld	21256,a
5185                     ; 1234   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5187  0b1e 0d02          	tnz	(OFST+1,sp)
5188  0b20 2706          	jreq	L5112
5189                     ; 1236     TIM2->CCER1 |= TIM2_CCER1_CC2P;
5191  0b22 721a530a      	bset	21258,#5
5193  0b26 2004          	jra	L7112
5194  0b28               L5112:
5195                     ; 1240     TIM2->CCER1 &= (uint8_t)(~TIM2_CCER1_CC2P);
5197  0b28 721b530a      	bres	21258,#5
5198  0b2c               L7112:
5199                     ; 1244   TIM2->CCER1 |= TIM2_CCER1_CC2E;
5201  0b2c 7218530a      	bset	21258,#4
5202                     ; 1245 }
5205  0b30 5b03          	addw	sp,#3
5206  0b32 81            	ret
5258                     ; 1261 static void TI3_Config(uint8_t TIM2_ICPolarity, uint8_t TIM2_ICSelection,
5258                     ; 1262                        uint8_t TIM2_ICFilter)
5258                     ; 1263 {
5259                     	switch	.text
5260  0b33               L7_TI3_Config:
5262  0b33 89            	pushw	x
5263  0b34 88            	push	a
5264       00000001      OFST:	set	1
5267                     ; 1265   TIM2->CCER2 &=  (uint8_t)(~TIM2_CCER2_CC3E);
5269  0b35 7211530b      	bres	21259,#0
5270                     ; 1268   TIM2->CCMR3 = (uint8_t)((uint8_t)(TIM2->CCMR3 & (uint8_t)(~( TIM2_CCMR_CCxS | TIM2_CCMR_ICxF))) 
5270                     ; 1269                           | (uint8_t)(( (TIM2_ICSelection)) | ((uint8_t)( TIM2_ICFilter << 4))));
5272  0b39 7b06          	ld	a,(OFST+5,sp)
5273  0b3b 97            	ld	xl,a
5274  0b3c a610          	ld	a,#16
5275  0b3e 42            	mul	x,a
5276  0b3f 9f            	ld	a,xl
5277  0b40 1a03          	or	a,(OFST+2,sp)
5278  0b42 6b01          	ld	(OFST+0,sp),a
5280  0b44 c65309        	ld	a,21257
5281  0b47 a40c          	and	a,#12
5282  0b49 1a01          	or	a,(OFST+0,sp)
5283  0b4b c75309        	ld	21257,a
5284                     ; 1273   if (TIM2_ICPolarity != TIM2_ICPOLARITY_RISING)
5286  0b4e 0d02          	tnz	(OFST+1,sp)
5287  0b50 2706          	jreq	L7412
5288                     ; 1275     TIM2->CCER2 |= TIM2_CCER2_CC3P;
5290  0b52 7212530b      	bset	21259,#1
5292  0b56 2004          	jra	L1512
5293  0b58               L7412:
5294                     ; 1279     TIM2->CCER2 &= (uint8_t)(~TIM2_CCER2_CC3P);
5296  0b58 7213530b      	bres	21259,#1
5297  0b5c               L1512:
5298                     ; 1282   TIM2->CCER2 |= TIM2_CCER2_CC3E;
5300  0b5c 7210530b      	bset	21259,#0
5301                     ; 1283 }
5304  0b60 5b03          	addw	sp,#3
5305  0b62 81            	ret
5318                     	xdef	_TIM2_ClearITPendingBit
5319                     	xdef	_TIM2_GetITStatus
5320                     	xdef	_TIM2_ClearFlag
5321                     	xdef	_TIM2_GetFlagStatus
5322                     	xdef	_TIM2_GetPrescaler
5323                     	xdef	_TIM2_GetCounter
5324                     	xdef	_TIM2_GetCapture3
5325                     	xdef	_TIM2_GetCapture2
5326                     	xdef	_TIM2_GetCapture1
5327                     	xdef	_TIM2_SetIC3Prescaler
5328                     	xdef	_TIM2_SetIC2Prescaler
5329                     	xdef	_TIM2_SetIC1Prescaler
5330                     	xdef	_TIM2_SetCompare3
5331                     	xdef	_TIM2_SetCompare2
5332                     	xdef	_TIM2_SetCompare1
5333                     	xdef	_TIM2_SetAutoreload
5334                     	xdef	_TIM2_SetCounter
5335                     	xdef	_TIM2_SelectOCxM
5336                     	xdef	_TIM2_CCxCmd
5337                     	xdef	_TIM2_OC3PolarityConfig
5338                     	xdef	_TIM2_OC2PolarityConfig
5339                     	xdef	_TIM2_OC1PolarityConfig
5340                     	xdef	_TIM2_GenerateEvent
5341                     	xdef	_TIM2_OC3PreloadConfig
5342                     	xdef	_TIM2_OC2PreloadConfig
5343                     	xdef	_TIM2_OC1PreloadConfig
5344                     	xdef	_TIM2_ARRPreloadConfig
5345                     	xdef	_TIM2_ForcedOC3Config
5346                     	xdef	_TIM2_ForcedOC2Config
5347                     	xdef	_TIM2_ForcedOC1Config
5348                     	xdef	_TIM2_PrescalerConfig
5349                     	xdef	_TIM2_SelectOnePulseMode
5350                     	xdef	_TIM2_UpdateRequestConfig
5351                     	xdef	_TIM2_UpdateDisableConfig
5352                     	xdef	_TIM2_ITConfig
5353                     	xdef	_TIM2_Cmd
5354                     	xdef	_TIM2_PWMIConfig
5355                     	xdef	_TIM2_ICInit
5356                     	xdef	_TIM2_OC3Init
5357                     	xdef	_TIM2_OC2Init
5358                     	xdef	_TIM2_OC1Init
5359                     	xdef	_TIM2_TimeBaseInit
5360                     	xdef	_TIM2_DeInit
5361                     	xref	_assert_failed
5362                     .const:	section	.text
5363  0000               L702:
5364  0000 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
5365  0012 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
5366  0024 72697665725c  	dc.b	"river\src\stm8s_ti"
5367  0036 6d322e6300    	dc.b	"m2.c",0
5387                     	end
