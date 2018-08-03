   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  44                     ; 44 uint8_t ITC_GetCPUCC(void)
  44                     ; 45 {
  46                     	switch	.text
  47  0000               _ITC_GetCPUCC:
  51                     ; 47   _asm("push cc");
  54  0000 8a            push cc
  56                     ; 48   _asm("pop a");
  59  0001 84            pop a
  61                     ; 49   return; /* Ignore compiler warning, the returned value is in A register */
  64  0002 81            	ret
  87                     ; 74 void ITC_DeInit(void)
  87                     ; 75 {
  88                     	switch	.text
  89  0003               _ITC_DeInit:
  93                     ; 76     ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  95  0003 35ff7f70      	mov	32624,#255
  96                     ; 77     ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
  98  0007 35ff7f71      	mov	32625,#255
  99                     ; 78     ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 101  000b 35ff7f72      	mov	32626,#255
 102                     ; 79     ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 104  000f 35ff7f73      	mov	32627,#255
 105                     ; 80     ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 107  0013 35ff7f74      	mov	32628,#255
 108                     ; 81     ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 110  0017 35ff7f75      	mov	32629,#255
 111                     ; 82     ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 113  001b 35ff7f76      	mov	32630,#255
 114                     ; 83     ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 116  001f 35ff7f77      	mov	32631,#255
 117                     ; 84 }
 120  0023 81            	ret
 145                     ; 91 uint8_t ITC_GetSoftIntStatus(void)
 145                     ; 92 {
 146                     	switch	.text
 147  0024               _ITC_GetSoftIntStatus:
 151                     ; 93     return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 153  0024 adda          	call	_ITC_GetCPUCC
 155  0026 a428          	and	a,#40
 158  0028 81            	ret
 421                     .const:	section	.text
 422  0000               L22:
 423  0000 004c          	dc.w	L14
 424  0002 004c          	dc.w	L14
 425  0004 004c          	dc.w	L14
 426  0006 004c          	dc.w	L14
 427  0008 0055          	dc.w	L34
 428  000a 0055          	dc.w	L34
 429  000c 0055          	dc.w	L34
 430  000e 0055          	dc.w	L34
 431  0010 0089          	dc.w	L702
 432  0012 0089          	dc.w	L702
 433  0014 005e          	dc.w	L54
 434  0016 005e          	dc.w	L54
 435  0018 0067          	dc.w	L74
 436  001a 0067          	dc.w	L74
 437  001c 0067          	dc.w	L74
 438  001e 0067          	dc.w	L74
 439  0020 0070          	dc.w	L15
 440  0022 0070          	dc.w	L15
 441  0024 0070          	dc.w	L15
 442  0026 0070          	dc.w	L15
 443  0028 0079          	dc.w	L35
 444  002a 0079          	dc.w	L35
 445  002c 0079          	dc.w	L35
 446  002e 0079          	dc.w	L35
 447  0030 0082          	dc.w	L55
 448                     ; 101 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 448                     ; 102 {
 449                     	switch	.text
 450  0029               _ITC_GetSoftwarePriority:
 452  0029 88            	push	a
 453  002a 89            	pushw	x
 454       00000002      OFST:	set	2
 457                     ; 104     uint8_t Value = 0;
 459  002b 0f02          	clr	(OFST+0,sp)
 461                     ; 105     uint8_t Mask = 0;
 463                     ; 108     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 465                     ; 111     Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 467  002d a403          	and	a,#3
 468  002f 48            	sll	a
 469  0030 5f            	clrw	x
 470  0031 97            	ld	xl,a
 471  0032 a603          	ld	a,#3
 472  0034 5d            	tnzw	x
 473  0035 2704          	jreq	L41
 474  0037               L61:
 475  0037 48            	sll	a
 476  0038 5a            	decw	x
 477  0039 26fc          	jrne	L61
 478  003b               L41:
 479  003b 6b01          	ld	(OFST-1,sp),a
 481                     ; 113     switch (IrqNum)
 483  003d 7b03          	ld	a,(OFST+1,sp)
 485                     ; 185     default:
 485                     ; 186         break;
 486  003f a119          	cp	a,#25
 487  0041 2407          	jruge	L02
 488  0043 5f            	clrw	x
 489  0044 97            	ld	xl,a
 490  0045 58            	sllw	x
 491  0046 de0000        	ldw	x,(L22,x)
 492  0049 fc            	jp	(x)
 493  004a               L02:
 494  004a 203d          	jra	L702
 495  004c               L14:
 496                     ; 115     case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 496                     ; 116     case ITC_IRQ_AWU:
 496                     ; 117     case ITC_IRQ_CLK:
 496                     ; 118     case ITC_IRQ_PORTA:
 496                     ; 119         Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 498  004c c67f70        	ld	a,32624
 499  004f 1401          	and	a,(OFST-1,sp)
 500  0051 6b02          	ld	(OFST+0,sp),a
 502                     ; 120         break;
 504  0053 2034          	jra	L702
 505  0055               L34:
 506                     ; 121     case ITC_IRQ_PORTB:
 506                     ; 122     case ITC_IRQ_PORTC:
 506                     ; 123     case ITC_IRQ_PORTD:
 506                     ; 124     case ITC_IRQ_PORTE:
 506                     ; 125         Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 508  0055 c67f71        	ld	a,32625
 509  0058 1401          	and	a,(OFST-1,sp)
 510  005a 6b02          	ld	(OFST+0,sp),a
 512                     ; 126         break;
 514  005c 202b          	jra	L702
 515  005e               L54:
 516                     ; 136     case ITC_IRQ_SPI:
 516                     ; 137     case ITC_IRQ_TIM1_OVF:
 516                     ; 138         Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 518  005e c67f72        	ld	a,32626
 519  0061 1401          	and	a,(OFST-1,sp)
 520  0063 6b02          	ld	(OFST+0,sp),a
 522                     ; 139         break;
 524  0065 2022          	jra	L702
 525  0067               L74:
 526                     ; 140     case ITC_IRQ_TIM1_CAPCOM:
 526                     ; 141 #ifdef STM8S903
 526                     ; 142     case ITC_IRQ_TIM5_OVFTRI:
 526                     ; 143     case ITC_IRQ_TIM5_CAPCOM:
 526                     ; 144 #else
 526                     ; 145     case ITC_IRQ_TIM2_OVF:
 526                     ; 146     case ITC_IRQ_TIM2_CAPCOM:
 526                     ; 147 #endif /*STM8S903*/
 526                     ; 148 
 526                     ; 149     case ITC_IRQ_TIM3_OVF:
 526                     ; 150         Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 528  0067 c67f73        	ld	a,32627
 529  006a 1401          	and	a,(OFST-1,sp)
 530  006c 6b02          	ld	(OFST+0,sp),a
 532                     ; 151         break;
 534  006e 2019          	jra	L702
 535  0070               L15:
 536                     ; 152     case ITC_IRQ_TIM3_CAPCOM:
 536                     ; 153     case ITC_IRQ_UART1_TX:
 536                     ; 154     case ITC_IRQ_UART1_RX:
 536                     ; 155     case ITC_IRQ_I2C:
 536                     ; 156         Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 538  0070 c67f74        	ld	a,32628
 539  0073 1401          	and	a,(OFST-1,sp)
 540  0075 6b02          	ld	(OFST+0,sp),a
 542                     ; 157         break;
 544  0077 2010          	jra	L702
 545  0079               L35:
 546                     ; 159     case ITC_IRQ_UART2_TX:
 546                     ; 160     case ITC_IRQ_UART2_RX:
 546                     ; 161 #endif /*STM8S105 or STM8AF626x*/
 546                     ; 162 
 546                     ; 163 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \
 546                     ; 164     defined(STM8AF62Ax)
 546                     ; 165     case ITC_IRQ_UART3_TX:
 546                     ; 166     case ITC_IRQ_UART3_RX:
 546                     ; 167     case ITC_IRQ_ADC2:
 546                     ; 168 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 546                     ; 169 
 546                     ; 170 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 546                     ; 171     defined(STM8S903) || defined(STM8AF626x)
 546                     ; 172     case ITC_IRQ_ADC1:
 546                     ; 173 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 546                     ; 174 
 546                     ; 175 #ifdef STM8S903
 546                     ; 176     case ITC_IRQ_TIM6_OVFTRI:
 546                     ; 177 #else
 546                     ; 178     case ITC_IRQ_TIM4_OVF:
 546                     ; 179 #endif /*STM8S903*/
 546                     ; 180         Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 548  0079 c67f75        	ld	a,32629
 549  007c 1401          	and	a,(OFST-1,sp)
 550  007e 6b02          	ld	(OFST+0,sp),a
 552                     ; 181         break;
 554  0080 2007          	jra	L702
 555  0082               L55:
 556                     ; 182     case ITC_IRQ_EEPROM_EEC:
 556                     ; 183         Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 558  0082 c67f76        	ld	a,32630
 559  0085 1401          	and	a,(OFST-1,sp)
 560  0087 6b02          	ld	(OFST+0,sp),a
 562                     ; 184         break;
 564  0089               L75:
 565                     ; 185     default:
 565                     ; 186         break;
 567  0089               L702:
 568                     ; 189     Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 570  0089 7b03          	ld	a,(OFST+1,sp)
 571  008b a403          	and	a,#3
 572  008d 48            	sll	a
 573  008e 5f            	clrw	x
 574  008f 97            	ld	xl,a
 575  0090 7b02          	ld	a,(OFST+0,sp)
 576  0092 5d            	tnzw	x
 577  0093 2704          	jreq	L42
 578  0095               L62:
 579  0095 44            	srl	a
 580  0096 5a            	decw	x
 581  0097 26fc          	jrne	L62
 582  0099               L42:
 583  0099 6b02          	ld	(OFST+0,sp),a
 585                     ; 191     return((ITC_PriorityLevel_TypeDef)Value);
 587  009b 7b02          	ld	a,(OFST+0,sp)
 590  009d 5b03          	addw	sp,#3
 591  009f 81            	ret
 655                     	switch	.const
 656  0032               L44:
 657  0032 00d5          	dc.w	L112
 658  0034 00d5          	dc.w	L112
 659  0036 00d5          	dc.w	L112
 660  0038 00d5          	dc.w	L112
 661  003a 00e7          	dc.w	L312
 662  003c 00e7          	dc.w	L312
 663  003e 00e7          	dc.w	L312
 664  0040 00e7          	dc.w	L312
 665  0042 0151          	dc.w	L562
 666  0044 0151          	dc.w	L562
 667  0046 00f9          	dc.w	L512
 668  0048 00f9          	dc.w	L512
 669  004a 010b          	dc.w	L712
 670  004c 010b          	dc.w	L712
 671  004e 010b          	dc.w	L712
 672  0050 010b          	dc.w	L712
 673  0052 011d          	dc.w	L122
 674  0054 011d          	dc.w	L122
 675  0056 011d          	dc.w	L122
 676  0058 011d          	dc.w	L122
 677  005a 012f          	dc.w	L322
 678  005c 012f          	dc.w	L322
 679  005e 012f          	dc.w	L322
 680  0060 012f          	dc.w	L322
 681  0062 0141          	dc.w	L522
 682                     ; 208 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 682                     ; 209 {
 683                     	switch	.text
 684  00a0               _ITC_SetSoftwarePriority:
 686  00a0 89            	pushw	x
 687  00a1 89            	pushw	x
 688       00000002      OFST:	set	2
 691                     ; 211     uint8_t Mask = 0;
 693                     ; 212     uint8_t NewPriority = 0;
 695                     ; 215     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 697                     ; 216     assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 699                     ; 219     assert_param(IS_ITC_INTERRUPTS_DISABLED);
 701                     ; 223     Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 703  00a2 9e            	ld	a,xh
 704  00a3 a403          	and	a,#3
 705  00a5 48            	sll	a
 706  00a6 5f            	clrw	x
 707  00a7 97            	ld	xl,a
 708  00a8 a603          	ld	a,#3
 709  00aa 5d            	tnzw	x
 710  00ab 2704          	jreq	L23
 711  00ad               L43:
 712  00ad 48            	sll	a
 713  00ae 5a            	decw	x
 714  00af 26fc          	jrne	L43
 715  00b1               L23:
 716  00b1 43            	cpl	a
 717  00b2 6b01          	ld	(OFST-1,sp),a
 719                     ; 226     NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 721  00b4 7b03          	ld	a,(OFST+1,sp)
 722  00b6 a403          	and	a,#3
 723  00b8 48            	sll	a
 724  00b9 5f            	clrw	x
 725  00ba 97            	ld	xl,a
 726  00bb 7b04          	ld	a,(OFST+2,sp)
 727  00bd 5d            	tnzw	x
 728  00be 2704          	jreq	L63
 729  00c0               L04:
 730  00c0 48            	sll	a
 731  00c1 5a            	decw	x
 732  00c2 26fc          	jrne	L04
 733  00c4               L63:
 734  00c4 6b02          	ld	(OFST+0,sp),a
 736                     ; 228     switch (IrqNum)
 738  00c6 7b03          	ld	a,(OFST+1,sp)
 740                     ; 314     default:
 740                     ; 315         break;
 741  00c8 a119          	cp	a,#25
 742  00ca 2407          	jruge	L24
 743  00cc 5f            	clrw	x
 744  00cd 97            	ld	xl,a
 745  00ce 58            	sllw	x
 746  00cf de0032        	ldw	x,(L44,x)
 747  00d2 fc            	jp	(x)
 748  00d3               L24:
 749  00d3 207c          	jra	L562
 750  00d5               L112:
 751                     ; 231     case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 751                     ; 232     case ITC_IRQ_AWU:
 751                     ; 233     case ITC_IRQ_CLK:
 751                     ; 234     case ITC_IRQ_PORTA:
 751                     ; 235         ITC->ISPR1 &= Mask;
 753  00d5 c67f70        	ld	a,32624
 754  00d8 1401          	and	a,(OFST-1,sp)
 755  00da c77f70        	ld	32624,a
 756                     ; 236         ITC->ISPR1 |= NewPriority;
 758  00dd c67f70        	ld	a,32624
 759  00e0 1a02          	or	a,(OFST+0,sp)
 760  00e2 c77f70        	ld	32624,a
 761                     ; 237         break;
 763  00e5 206a          	jra	L562
 764  00e7               L312:
 765                     ; 239     case ITC_IRQ_PORTB:
 765                     ; 240     case ITC_IRQ_PORTC:
 765                     ; 241     case ITC_IRQ_PORTD:
 765                     ; 242     case ITC_IRQ_PORTE:
 765                     ; 243         ITC->ISPR2 &= Mask;
 767  00e7 c67f71        	ld	a,32625
 768  00ea 1401          	and	a,(OFST-1,sp)
 769  00ec c77f71        	ld	32625,a
 770                     ; 244         ITC->ISPR2 |= NewPriority;
 772  00ef c67f71        	ld	a,32625
 773  00f2 1a02          	or	a,(OFST+0,sp)
 774  00f4 c77f71        	ld	32625,a
 775                     ; 245         break;
 777  00f7 2058          	jra	L562
 778  00f9               L512:
 779                     ; 255     case ITC_IRQ_SPI:
 779                     ; 256     case ITC_IRQ_TIM1_OVF:
 779                     ; 257         ITC->ISPR3 &= Mask;
 781  00f9 c67f72        	ld	a,32626
 782  00fc 1401          	and	a,(OFST-1,sp)
 783  00fe c77f72        	ld	32626,a
 784                     ; 258         ITC->ISPR3 |= NewPriority;
 786  0101 c67f72        	ld	a,32626
 787  0104 1a02          	or	a,(OFST+0,sp)
 788  0106 c77f72        	ld	32626,a
 789                     ; 259         break;
 791  0109 2046          	jra	L562
 792  010b               L712:
 793                     ; 261     case ITC_IRQ_TIM1_CAPCOM:
 793                     ; 262 #ifdef STM8S903
 793                     ; 263     case ITC_IRQ_TIM5_OVFTRI:
 793                     ; 264     case ITC_IRQ_TIM5_CAPCOM:
 793                     ; 265 #else
 793                     ; 266     case ITC_IRQ_TIM2_OVF:
 793                     ; 267     case ITC_IRQ_TIM2_CAPCOM:
 793                     ; 268 #endif /*STM8S903*/
 793                     ; 269 
 793                     ; 270     case ITC_IRQ_TIM3_OVF:
 793                     ; 271         ITC->ISPR4 &= Mask;
 795  010b c67f73        	ld	a,32627
 796  010e 1401          	and	a,(OFST-1,sp)
 797  0110 c77f73        	ld	32627,a
 798                     ; 272         ITC->ISPR4 |= NewPriority;
 800  0113 c67f73        	ld	a,32627
 801  0116 1a02          	or	a,(OFST+0,sp)
 802  0118 c77f73        	ld	32627,a
 803                     ; 273         break;
 805  011b 2034          	jra	L562
 806  011d               L122:
 807                     ; 275     case ITC_IRQ_TIM3_CAPCOM:
 807                     ; 276     case ITC_IRQ_UART1_TX:
 807                     ; 277     case ITC_IRQ_UART1_RX:
 807                     ; 278     case ITC_IRQ_I2C:
 807                     ; 279         ITC->ISPR5 &= Mask;
 809  011d c67f74        	ld	a,32628
 810  0120 1401          	and	a,(OFST-1,sp)
 811  0122 c77f74        	ld	32628,a
 812                     ; 280         ITC->ISPR5 |= NewPriority;
 814  0125 c67f74        	ld	a,32628
 815  0128 1a02          	or	a,(OFST+0,sp)
 816  012a c77f74        	ld	32628,a
 817                     ; 281         break;
 819  012d 2022          	jra	L562
 820  012f               L322:
 821                     ; 284     case ITC_IRQ_UART2_TX:
 821                     ; 285     case ITC_IRQ_UART2_RX:
 821                     ; 286 #endif /*STM8S105 or STM8AF626x */
 821                     ; 287 
 821                     ; 288 #if defined(STM8S208) || defined(STM8S207) || defined(STM8S007) || defined(STM8AF52Ax) || \
 821                     ; 289     defined(STM8AF62Ax)
 821                     ; 290     case ITC_IRQ_UART3_TX:
 821                     ; 291     case ITC_IRQ_UART3_RX:
 821                     ; 292     case ITC_IRQ_ADC2:
 821                     ; 293 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 821                     ; 294 
 821                     ; 295 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 821                     ; 296     defined(STM8S903) || defined(STM8AF626x)
 821                     ; 297     case ITC_IRQ_ADC1:
 821                     ; 298 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 821                     ; 299 
 821                     ; 300 #ifdef STM8S903
 821                     ; 301     case ITC_IRQ_TIM6_OVFTRI:
 821                     ; 302 #else
 821                     ; 303     case ITC_IRQ_TIM4_OVF:
 821                     ; 304 #endif /*STM8S903*/
 821                     ; 305         ITC->ISPR6 &= Mask;
 823  012f c67f75        	ld	a,32629
 824  0132 1401          	and	a,(OFST-1,sp)
 825  0134 c77f75        	ld	32629,a
 826                     ; 306         ITC->ISPR6 |= NewPriority;
 828  0137 c67f75        	ld	a,32629
 829  013a 1a02          	or	a,(OFST+0,sp)
 830  013c c77f75        	ld	32629,a
 831                     ; 307         break;
 833  013f 2010          	jra	L562
 834  0141               L522:
 835                     ; 309     case ITC_IRQ_EEPROM_EEC:
 835                     ; 310         ITC->ISPR7 &= Mask;
 837  0141 c67f76        	ld	a,32630
 838  0144 1401          	and	a,(OFST-1,sp)
 839  0146 c77f76        	ld	32630,a
 840                     ; 311         ITC->ISPR7 |= NewPriority;
 842  0149 c67f76        	ld	a,32630
 843  014c 1a02          	or	a,(OFST+0,sp)
 844  014e c77f76        	ld	32630,a
 845                     ; 312         break;
 847  0151               L722:
 848                     ; 314     default:
 848                     ; 315         break;
 850  0151               L562:
 851                     ; 319 }
 854  0151 5b04          	addw	sp,#4
 855  0153 81            	ret
 868                     	xdef	_ITC_GetSoftwarePriority
 869                     	xdef	_ITC_SetSoftwarePriority
 870                     	xdef	_ITC_GetSoftIntStatus
 871                     	xdef	_ITC_DeInit
 872                     	xdef	_ITC_GetCPUCC
 891                     	end
