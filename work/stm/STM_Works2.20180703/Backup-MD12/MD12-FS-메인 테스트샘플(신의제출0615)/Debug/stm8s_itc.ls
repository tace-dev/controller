   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
  44                     ; 50 uint8_t ITC_GetCPUCC(void)
  44                     ; 51 {
  46                     	switch	.text
  47  0000               _ITC_GetCPUCC:
  51                     ; 53   _asm("push cc");
  54  0000 8a            push cc
  56                     ; 54   _asm("pop a");
  59  0001 84            pop a
  61                     ; 55   return; /* Ignore compiler warning, the returned value is in A register */
  64  0002 81            	ret
  87                     ; 80 void ITC_DeInit(void)
  87                     ; 81 {
  88                     	switch	.text
  89  0003               _ITC_DeInit:
  93                     ; 82   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  95  0003 35ff7f70      	mov	32624,#255
  96                     ; 83   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  98  0007 35ff7f71      	mov	32625,#255
  99                     ; 84   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 101  000b 35ff7f72      	mov	32626,#255
 102                     ; 85   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 104  000f 35ff7f73      	mov	32627,#255
 105                     ; 86   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 107  0013 35ff7f74      	mov	32628,#255
 108                     ; 87   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 110  0017 35ff7f75      	mov	32629,#255
 111                     ; 88   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 113  001b 35ff7f76      	mov	32630,#255
 114                     ; 89   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 116  001f 35ff7f77      	mov	32631,#255
 117                     ; 90 }
 120  0023 81            	ret
 145                     ; 97 uint8_t ITC_GetSoftIntStatus(void)
 145                     ; 98 {
 146                     	switch	.text
 147  0024               _ITC_GetSoftIntStatus:
 151                     ; 99   return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 153  0024 adda          	call	_ITC_GetCPUCC
 155  0026 a428          	and	a,#40
 158  0028 81            	ret
 408                     .const:	section	.text
 409  0000               L62:
 410  0000 0065          	dc.w	L14
 411  0002 0065          	dc.w	L14
 412  0004 0065          	dc.w	L14
 413  0006 0065          	dc.w	L14
 414  0008 006e          	dc.w	L34
 415  000a 006e          	dc.w	L34
 416  000c 006e          	dc.w	L34
 417  000e 006e          	dc.w	L34
 418  0010 00a2          	dc.w	L502
 419  0012 00a2          	dc.w	L502
 420  0014 0077          	dc.w	L54
 421  0016 0077          	dc.w	L54
 422  0018 0080          	dc.w	L74
 423  001a 0080          	dc.w	L74
 424  001c 0080          	dc.w	L74
 425  001e 0080          	dc.w	L74
 426  0020 0089          	dc.w	L15
 427  0022 0089          	dc.w	L15
 428  0024 0089          	dc.w	L15
 429  0026 0089          	dc.w	L15
 430  0028 00a2          	dc.w	L502
 431  002a 00a2          	dc.w	L502
 432  002c 0092          	dc.w	L35
 433  002e 0092          	dc.w	L35
 434  0030 009b          	dc.w	L55
 435                     ; 107 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 435                     ; 108 {
 436                     	switch	.text
 437  0029               _ITC_GetSoftwarePriority:
 439  0029 88            	push	a
 440  002a 89            	pushw	x
 441       00000002      OFST:	set	2
 444                     ; 109   uint8_t Value = 0;
 446  002b 0f02          	clr	(OFST+0,sp)
 448                     ; 110   uint8_t Mask = 0;
 450                     ; 113   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 452  002d a119          	cp	a,#25
 453  002f 2403          	jruge	L41
 454  0031 4f            	clr	a
 455  0032 2010          	jra	L61
 456  0034               L41:
 457  0034 ae0071        	ldw	x,#113
 458  0037 89            	pushw	x
 459  0038 ae0000        	ldw	x,#0
 460  003b 89            	pushw	x
 461  003c ae0064        	ldw	x,#L102
 462  003f cd0000        	call	_assert_failed
 464  0042 5b04          	addw	sp,#4
 465  0044               L61:
 466                     ; 116   Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 468  0044 7b03          	ld	a,(OFST+1,sp)
 469  0046 a403          	and	a,#3
 470  0048 48            	sll	a
 471  0049 5f            	clrw	x
 472  004a 97            	ld	xl,a
 473  004b a603          	ld	a,#3
 474  004d 5d            	tnzw	x
 475  004e 2704          	jreq	L02
 476  0050               L22:
 477  0050 48            	sll	a
 478  0051 5a            	decw	x
 479  0052 26fc          	jrne	L22
 480  0054               L02:
 481  0054 6b01          	ld	(OFST-1,sp),a
 483                     ; 118   switch (IrqNum)
 485  0056 7b03          	ld	a,(OFST+1,sp)
 487                     ; 198   default:
 487                     ; 199     break;
 488  0058 a119          	cp	a,#25
 489  005a 2407          	jruge	L42
 490  005c 5f            	clrw	x
 491  005d 97            	ld	xl,a
 492  005e 58            	sllw	x
 493  005f de0000        	ldw	x,(L62,x)
 494  0062 fc            	jp	(x)
 495  0063               L42:
 496  0063 203d          	jra	L502
 497  0065               L14:
 498                     ; 120   case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 498                     ; 121   case ITC_IRQ_AWU:
 498                     ; 122   case ITC_IRQ_CLK:
 498                     ; 123   case ITC_IRQ_PORTA:
 498                     ; 124     Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 500  0065 c67f70        	ld	a,32624
 501  0068 1401          	and	a,(OFST-1,sp)
 502  006a 6b02          	ld	(OFST+0,sp),a
 504                     ; 125     break;
 506  006c 2034          	jra	L502
 507  006e               L34:
 508                     ; 127   case ITC_IRQ_PORTB:
 508                     ; 128   case ITC_IRQ_PORTC:
 508                     ; 129   case ITC_IRQ_PORTD:
 508                     ; 130   case ITC_IRQ_PORTE:
 508                     ; 131     Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 510  006e c67f71        	ld	a,32625
 511  0071 1401          	and	a,(OFST-1,sp)
 512  0073 6b02          	ld	(OFST+0,sp),a
 514                     ; 132     break;
 516  0075 202b          	jra	L502
 517  0077               L54:
 518                     ; 141   case ITC_IRQ_SPI:
 518                     ; 142   case ITC_IRQ_TIM1_OVF:
 518                     ; 143     Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 520  0077 c67f72        	ld	a,32626
 521  007a 1401          	and	a,(OFST-1,sp)
 522  007c 6b02          	ld	(OFST+0,sp),a
 524                     ; 144     break;
 526  007e 2022          	jra	L502
 527  0080               L74:
 528                     ; 146   case ITC_IRQ_TIM1_CAPCOM:
 528                     ; 147 #if defined (STM8S903) || defined (STM8AF622x)
 528                     ; 148   case ITC_IRQ_TIM5_OVFTRI:
 528                     ; 149   case ITC_IRQ_TIM5_CAPCOM:
 528                     ; 150 #else
 528                     ; 151   case ITC_IRQ_TIM2_OVF:
 528                     ; 152   case ITC_IRQ_TIM2_CAPCOM:
 528                     ; 153 #endif /* STM8S903 or STM8AF622x*/
 528                     ; 154   case ITC_IRQ_TIM3_OVF:
 528                     ; 155     Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 530  0080 c67f73        	ld	a,32627
 531  0083 1401          	and	a,(OFST-1,sp)
 532  0085 6b02          	ld	(OFST+0,sp),a
 534                     ; 156     break;
 536  0087 2019          	jra	L502
 537  0089               L15:
 538                     ; 158   case ITC_IRQ_TIM3_CAPCOM:
 538                     ; 159 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 538                     ; 160     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 538                     ; 161   case ITC_IRQ_UART1_TX:
 538                     ; 162   case ITC_IRQ_UART1_RX:
 538                     ; 163 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 538                     ; 164 #if defined(STM8AF622x)
 538                     ; 165   case ITC_IRQ_UART4_TX:
 538                     ; 166   case ITC_IRQ_UART4_RX:
 538                     ; 167 #endif /*STM8AF622x */
 538                     ; 168   case ITC_IRQ_I2C:
 538                     ; 169     Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 540  0089 c67f74        	ld	a,32628
 541  008c 1401          	and	a,(OFST-1,sp)
 542  008e 6b02          	ld	(OFST+0,sp),a
 544                     ; 170     break;
 546  0090 2010          	jra	L502
 547  0092               L35:
 548                     ; 184   case ITC_IRQ_ADC1:
 548                     ; 185 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 548                     ; 186 #if defined (STM8S903) || defined (STM8AF622x)
 548                     ; 187   case ITC_IRQ_TIM6_OVFTRI:
 548                     ; 188 #else
 548                     ; 189   case ITC_IRQ_TIM4_OVF:
 548                     ; 190 #endif /*STM8S903 or STM8AF622x */
 548                     ; 191     Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 550  0092 c67f75        	ld	a,32629
 551  0095 1401          	and	a,(OFST-1,sp)
 552  0097 6b02          	ld	(OFST+0,sp),a
 554                     ; 192     break;
 556  0099 2007          	jra	L502
 557  009b               L55:
 558                     ; 194   case ITC_IRQ_EEPROM_EEC:
 558                     ; 195     Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 560  009b c67f76        	ld	a,32630
 561  009e 1401          	and	a,(OFST-1,sp)
 562  00a0 6b02          	ld	(OFST+0,sp),a
 564                     ; 196     break;
 566  00a2               L75:
 567                     ; 198   default:
 567                     ; 199     break;
 569  00a2               L502:
 570                     ; 202   Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 572  00a2 7b03          	ld	a,(OFST+1,sp)
 573  00a4 a403          	and	a,#3
 574  00a6 48            	sll	a
 575  00a7 5f            	clrw	x
 576  00a8 97            	ld	xl,a
 577  00a9 7b02          	ld	a,(OFST+0,sp)
 578  00ab 5d            	tnzw	x
 579  00ac 2704          	jreq	L03
 580  00ae               L23:
 581  00ae 44            	srl	a
 582  00af 5a            	decw	x
 583  00b0 26fc          	jrne	L23
 584  00b2               L03:
 585  00b2 6b02          	ld	(OFST+0,sp),a
 587                     ; 204   return((ITC_PriorityLevel_TypeDef)Value);
 589  00b4 7b02          	ld	a,(OFST+0,sp)
 592  00b6 5b03          	addw	sp,#3
 593  00b8 81            	ret
 659                     	switch	.const
 660  0032               L66:
 661  0032 014a          	dc.w	L702
 662  0034 014a          	dc.w	L702
 663  0036 014a          	dc.w	L702
 664  0038 014a          	dc.w	L702
 665  003a 015c          	dc.w	L112
 666  003c 015c          	dc.w	L112
 667  003e 015c          	dc.w	L112
 668  0040 015c          	dc.w	L112
 669  0042 01c6          	dc.w	L362
 670  0044 01c6          	dc.w	L362
 671  0046 016e          	dc.w	L312
 672  0048 016e          	dc.w	L312
 673  004a 0180          	dc.w	L512
 674  004c 0180          	dc.w	L512
 675  004e 0180          	dc.w	L512
 676  0050 0180          	dc.w	L512
 677  0052 0192          	dc.w	L712
 678  0054 0192          	dc.w	L712
 679  0056 0192          	dc.w	L712
 680  0058 0192          	dc.w	L712
 681  005a 01c6          	dc.w	L362
 682  005c 01c6          	dc.w	L362
 683  005e 01a4          	dc.w	L122
 684  0060 01a4          	dc.w	L122
 685  0062 01b6          	dc.w	L322
 686                     ; 220 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 686                     ; 221 {
 687                     	switch	.text
 688  00b9               _ITC_SetSoftwarePriority:
 690  00b9 89            	pushw	x
 691  00ba 89            	pushw	x
 692       00000002      OFST:	set	2
 695                     ; 222   uint8_t Mask = 0;
 697                     ; 223   uint8_t NewPriority = 0;
 699                     ; 226   assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 701  00bb 9e            	ld	a,xh
 702  00bc a119          	cp	a,#25
 703  00be 2403          	jruge	L63
 704  00c0 4f            	clr	a
 705  00c1 2010          	jra	L04
 706  00c3               L63:
 707  00c3 ae00e2        	ldw	x,#226
 708  00c6 89            	pushw	x
 709  00c7 ae0000        	ldw	x,#0
 710  00ca 89            	pushw	x
 711  00cb ae0064        	ldw	x,#L102
 712  00ce cd0000        	call	_assert_failed
 714  00d1 5b04          	addw	sp,#4
 715  00d3               L04:
 716                     ; 227   assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 718  00d3 7b04          	ld	a,(OFST+2,sp)
 719  00d5 a102          	cp	a,#2
 720  00d7 2710          	jreq	L44
 721  00d9 7b04          	ld	a,(OFST+2,sp)
 722  00db a101          	cp	a,#1
 723  00dd 270a          	jreq	L44
 724  00df 0d04          	tnz	(OFST+2,sp)
 725  00e1 2706          	jreq	L44
 726  00e3 7b04          	ld	a,(OFST+2,sp)
 727  00e5 a103          	cp	a,#3
 728  00e7 2603          	jrne	L24
 729  00e9               L44:
 730  00e9 4f            	clr	a
 731  00ea 2010          	jra	L64
 732  00ec               L24:
 733  00ec ae00e3        	ldw	x,#227
 734  00ef 89            	pushw	x
 735  00f0 ae0000        	ldw	x,#0
 736  00f3 89            	pushw	x
 737  00f4 ae0064        	ldw	x,#L102
 738  00f7 cd0000        	call	_assert_failed
 740  00fa 5b04          	addw	sp,#4
 741  00fc               L64:
 742                     ; 230   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 744  00fc cd0024        	call	_ITC_GetSoftIntStatus
 746  00ff a128          	cp	a,#40
 747  0101 2603          	jrne	L05
 748  0103 4f            	clr	a
 749  0104 2010          	jra	L25
 750  0106               L05:
 751  0106 ae00e6        	ldw	x,#230
 752  0109 89            	pushw	x
 753  010a ae0000        	ldw	x,#0
 754  010d 89            	pushw	x
 755  010e ae0064        	ldw	x,#L102
 756  0111 cd0000        	call	_assert_failed
 758  0114 5b04          	addw	sp,#4
 759  0116               L25:
 760                     ; 234   Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 762  0116 7b03          	ld	a,(OFST+1,sp)
 763  0118 a403          	and	a,#3
 764  011a 48            	sll	a
 765  011b 5f            	clrw	x
 766  011c 97            	ld	xl,a
 767  011d a603          	ld	a,#3
 768  011f 5d            	tnzw	x
 769  0120 2704          	jreq	L45
 770  0122               L65:
 771  0122 48            	sll	a
 772  0123 5a            	decw	x
 773  0124 26fc          	jrne	L65
 774  0126               L45:
 775  0126 43            	cpl	a
 776  0127 6b01          	ld	(OFST-1,sp),a
 778                     ; 237   NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 780  0129 7b03          	ld	a,(OFST+1,sp)
 781  012b a403          	and	a,#3
 782  012d 48            	sll	a
 783  012e 5f            	clrw	x
 784  012f 97            	ld	xl,a
 785  0130 7b04          	ld	a,(OFST+2,sp)
 786  0132 5d            	tnzw	x
 787  0133 2704          	jreq	L06
 788  0135               L26:
 789  0135 48            	sll	a
 790  0136 5a            	decw	x
 791  0137 26fc          	jrne	L26
 792  0139               L06:
 793  0139 6b02          	ld	(OFST+0,sp),a
 795                     ; 239   switch (IrqNum)
 797  013b 7b03          	ld	a,(OFST+1,sp)
 799                     ; 329   default:
 799                     ; 330     break;
 800  013d a119          	cp	a,#25
 801  013f 2407          	jruge	L46
 802  0141 5f            	clrw	x
 803  0142 97            	ld	xl,a
 804  0143 58            	sllw	x
 805  0144 de0032        	ldw	x,(L66,x)
 806  0147 fc            	jp	(x)
 807  0148               L46:
 808  0148 207c          	jra	L362
 809  014a               L702:
 810                     ; 241   case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 810                     ; 242   case ITC_IRQ_AWU:
 810                     ; 243   case ITC_IRQ_CLK:
 810                     ; 244   case ITC_IRQ_PORTA:
 810                     ; 245     ITC->ISPR1 &= Mask;
 812  014a c67f70        	ld	a,32624
 813  014d 1401          	and	a,(OFST-1,sp)
 814  014f c77f70        	ld	32624,a
 815                     ; 246     ITC->ISPR1 |= NewPriority;
 817  0152 c67f70        	ld	a,32624
 818  0155 1a02          	or	a,(OFST+0,sp)
 819  0157 c77f70        	ld	32624,a
 820                     ; 247     break;
 822  015a 206a          	jra	L362
 823  015c               L112:
 824                     ; 249   case ITC_IRQ_PORTB:
 824                     ; 250   case ITC_IRQ_PORTC:
 824                     ; 251   case ITC_IRQ_PORTD:
 824                     ; 252   case ITC_IRQ_PORTE:
 824                     ; 253     ITC->ISPR2 &= Mask;
 826  015c c67f71        	ld	a,32625
 827  015f 1401          	and	a,(OFST-1,sp)
 828  0161 c77f71        	ld	32625,a
 829                     ; 254     ITC->ISPR2 |= NewPriority;
 831  0164 c67f71        	ld	a,32625
 832  0167 1a02          	or	a,(OFST+0,sp)
 833  0169 c77f71        	ld	32625,a
 834                     ; 255     break;
 836  016c 2058          	jra	L362
 837  016e               L312:
 838                     ; 264   case ITC_IRQ_SPI:
 838                     ; 265   case ITC_IRQ_TIM1_OVF:
 838                     ; 266     ITC->ISPR3 &= Mask;
 840  016e c67f72        	ld	a,32626
 841  0171 1401          	and	a,(OFST-1,sp)
 842  0173 c77f72        	ld	32626,a
 843                     ; 267     ITC->ISPR3 |= NewPriority;
 845  0176 c67f72        	ld	a,32626
 846  0179 1a02          	or	a,(OFST+0,sp)
 847  017b c77f72        	ld	32626,a
 848                     ; 268     break;
 850  017e 2046          	jra	L362
 851  0180               L512:
 852                     ; 270   case ITC_IRQ_TIM1_CAPCOM:
 852                     ; 271 #if defined(STM8S903) || defined(STM8AF622x) 
 852                     ; 272   case ITC_IRQ_TIM5_OVFTRI:
 852                     ; 273   case ITC_IRQ_TIM5_CAPCOM:
 852                     ; 274 #else
 852                     ; 275   case ITC_IRQ_TIM2_OVF:
 852                     ; 276   case ITC_IRQ_TIM2_CAPCOM:
 852                     ; 277 #endif /*STM8S903 or STM8AF622x */
 852                     ; 278   case ITC_IRQ_TIM3_OVF:
 852                     ; 279     ITC->ISPR4 &= Mask;
 854  0180 c67f73        	ld	a,32627
 855  0183 1401          	and	a,(OFST-1,sp)
 856  0185 c77f73        	ld	32627,a
 857                     ; 280     ITC->ISPR4 |= NewPriority;
 859  0188 c67f73        	ld	a,32627
 860  018b 1a02          	or	a,(OFST+0,sp)
 861  018d c77f73        	ld	32627,a
 862                     ; 281     break;
 864  0190 2034          	jra	L362
 865  0192               L712:
 866                     ; 283   case ITC_IRQ_TIM3_CAPCOM:
 866                     ; 284 #if defined(STM8S208) ||defined(STM8S207) || defined (STM8S007) || defined(STM8S103) || \
 866                     ; 285     defined(STM8S003) ||defined(STM8S903) || defined (STM8AF52Ax) || defined (STM8AF62Ax)
 866                     ; 286   case ITC_IRQ_UART1_TX:
 866                     ; 287   case ITC_IRQ_UART1_RX:
 866                     ; 288 #endif /*STM8S208 or STM8S207 or STM8S007 or STM8S103 or STM8S003 or STM8S903 or STM8AF52Ax or STM8AF62Ax */ 
 866                     ; 289 #if defined(STM8AF622x)
 866                     ; 290   case ITC_IRQ_UART4_TX:
 866                     ; 291   case ITC_IRQ_UART4_RX:
 866                     ; 292 #endif /*STM8AF622x */
 866                     ; 293   case ITC_IRQ_I2C:
 866                     ; 294     ITC->ISPR5 &= Mask;
 868  0192 c67f74        	ld	a,32628
 869  0195 1401          	and	a,(OFST-1,sp)
 870  0197 c77f74        	ld	32628,a
 871                     ; 295     ITC->ISPR5 |= NewPriority;
 873  019a c67f74        	ld	a,32628
 874  019d 1a02          	or	a,(OFST+0,sp)
 875  019f c77f74        	ld	32628,a
 876                     ; 296     break;
 878  01a2 2022          	jra	L362
 879  01a4               L122:
 880                     ; 312   case ITC_IRQ_ADC1:
 880                     ; 313 #endif /*STM8S105, STM8S005, STM8S103 or STM8S003 or STM8S903 or STM8AF626x or STM8AF622x */
 880                     ; 314     
 880                     ; 315 #if defined (STM8S903) || defined (STM8AF622x)
 880                     ; 316   case ITC_IRQ_TIM6_OVFTRI:
 880                     ; 317 #else
 880                     ; 318   case ITC_IRQ_TIM4_OVF:
 880                     ; 319 #endif /* STM8S903 or STM8AF622x */
 880                     ; 320     ITC->ISPR6 &= Mask;
 882  01a4 c67f75        	ld	a,32629
 883  01a7 1401          	and	a,(OFST-1,sp)
 884  01a9 c77f75        	ld	32629,a
 885                     ; 321     ITC->ISPR6 |= NewPriority;
 887  01ac c67f75        	ld	a,32629
 888  01af 1a02          	or	a,(OFST+0,sp)
 889  01b1 c77f75        	ld	32629,a
 890                     ; 322     break;
 892  01b4 2010          	jra	L362
 893  01b6               L322:
 894                     ; 324   case ITC_IRQ_EEPROM_EEC:
 894                     ; 325     ITC->ISPR7 &= Mask;
 896  01b6 c67f76        	ld	a,32630
 897  01b9 1401          	and	a,(OFST-1,sp)
 898  01bb c77f76        	ld	32630,a
 899                     ; 326     ITC->ISPR7 |= NewPriority;
 901  01be c67f76        	ld	a,32630
 902  01c1 1a02          	or	a,(OFST+0,sp)
 903  01c3 c77f76        	ld	32630,a
 904                     ; 327     break;
 906  01c6               L522:
 907                     ; 329   default:
 907                     ; 330     break;
 909  01c6               L362:
 910                     ; 332 }
 913  01c6 5b04          	addw	sp,#4
 914  01c8 81            	ret
 927                     	xdef	_ITC_GetSoftwarePriority
 928                     	xdef	_ITC_SetSoftwarePriority
 929                     	xdef	_ITC_GetSoftIntStatus
 930                     	xdef	_ITC_DeInit
 931                     	xdef	_ITC_GetCPUCC
 932                     	xref	_assert_failed
 933                     	switch	.const
 934  0064               L102:
 935  0064 2e2e5c2e2e5c  	dc.b	"..\..\..\libraries"
 936  0076 5c73746d3873  	dc.b	"\stm8s_stdperiph_d"
 937  0088 72697665725c  	dc.b	"river\src\stm8s_it"
 938  009a 632e6300      	dc.b	"c.c",0
 958                     	end
