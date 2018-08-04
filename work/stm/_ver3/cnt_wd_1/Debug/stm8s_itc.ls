   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  51                     ; 44 uint8_t ITC_GetCPUCC(void)
  51                     ; 45 {
  53                     .text:	section	.text,new
  54  0000               _ITC_GetCPUCC:
  58                     ; 47   _asm("push cc");
  61  0000 8a            	push	cc
  63                     ; 48   _asm("pop a");
  66  0001 84            	pop	a
  68                     ; 49   return; /* Ignore compiler warning, the returned value is in A register */
  71  0002 81            	ret	
  94                     ; 74 void ITC_DeInit(void)
  94                     ; 75 {
  95                     .text:	section	.text,new
  96  0000               _ITC_DeInit:
 100                     ; 76     ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
 102  0000 35ff7f70      	mov	32624,#255
 103                     ; 77     ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 105  0004 35ff7f71      	mov	32625,#255
 106                     ; 78     ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 108  0008 35ff7f72      	mov	32626,#255
 109                     ; 79     ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 111  000c 35ff7f73      	mov	32627,#255
 112                     ; 80     ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 114  0010 35ff7f74      	mov	32628,#255
 115                     ; 81     ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 117  0014 35ff7f75      	mov	32629,#255
 118                     ; 82     ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 120  0018 35ff7f76      	mov	32630,#255
 121                     ; 83     ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 123  001c 35ff7f77      	mov	32631,#255
 124                     ; 84 }
 127  0020 81            	ret	
 152                     ; 91 uint8_t ITC_GetSoftIntStatus(void)
 152                     ; 92 {
 153                     .text:	section	.text,new
 154  0000               _ITC_GetSoftIntStatus:
 158                     ; 93     return (uint8_t)(ITC_GetCPUCC() & CPU_CC_I1I0);
 160  0000 cd0000        	call	_ITC_GetCPUCC
 162  0003 a428          	and	a,#40
 165  0005 81            	ret	
 424                     .const:	section	.text
 425  0000               L42:
 426  0000 0021          	dc.w	L14
 427  0002 0021          	dc.w	L14
 428  0004 0021          	dc.w	L14
 429  0006 0021          	dc.w	L14
 430  0008 0026          	dc.w	L34
 431  000a 0026          	dc.w	L34
 432  000c 0026          	dc.w	L34
 433  000e 0026          	dc.w	L34
 434  0010 0046          	dc.w	L302
 435  0012 0046          	dc.w	L302
 436  0014 002b          	dc.w	L54
 437  0016 002b          	dc.w	L54
 438  0018 0030          	dc.w	L74
 439  001a 0030          	dc.w	L74
 440  001c 0030          	dc.w	L74
 441  001e 0030          	dc.w	L74
 442  0020 0035          	dc.w	L15
 443  0022 0035          	dc.w	L15
 444  0024 0035          	dc.w	L15
 445  0026 0035          	dc.w	L15
 446  0028 003a          	dc.w	L35
 447  002a 003a          	dc.w	L35
 448  002c 003a          	dc.w	L35
 449  002e 003a          	dc.w	L35
 450  0030 003f          	dc.w	L55
 451                     ; 101 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(ITC_Irq_TypeDef IrqNum)
 451                     ; 102 {
 452                     .text:	section	.text,new
 453  0000               _ITC_GetSoftwarePriority:
 455  0000 88            	push	a
 456  0001 89            	pushw	x
 457       00000002      OFST:	set	2
 460                     ; 104     uint8_t Value = 0;
 462  0002 0f02          	clr	(OFST+0,sp)
 463                     ; 105     uint8_t Mask = 0;
 465                     ; 108     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 467                     ; 111     Mask = (uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U));
 469  0004 a403          	and	a,#3
 470  0006 48            	sll	a
 471  0007 5f            	clrw	x
 472  0008 97            	ld	xl,a
 473  0009 a603          	ld	a,#3
 474  000b 5d            	tnzw	x
 475  000c 2704          	jreq	L61
 476  000e               L02:
 477  000e 48            	sll	a
 478  000f 5a            	decw	x
 479  0010 26fc          	jrne	L02
 480  0012               L61:
 481  0012 6b01          	ld	(OFST-1,sp),a
 482                     ; 113     switch (IrqNum)
 484  0014 7b03          	ld	a,(OFST+1,sp)
 486                     ; 185     default:
 486                     ; 186         break;
 487  0016 a119          	cp	a,#25
 488  0018 242c          	jruge	L302
 489  001a 5f            	clrw	x
 490  001b 97            	ld	xl,a
 491  001c 58            	sllw	x
 492  001d de0000        	ldw	x,(L42,x)
 493  0020 fc            	jp	(x)
 494  0021               L14:
 495                     ; 115     case ITC_IRQ_TLI: /* TLI software priority can be read but has no meaning */
 495                     ; 116     case ITC_IRQ_AWU:
 495                     ; 117     case ITC_IRQ_CLK:
 495                     ; 118     case ITC_IRQ_PORTA:
 495                     ; 119         Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 497  0021 c67f70        	ld	a,32624
 498                     ; 120         break;
 500  0024 201c          	jp	LC001
 501  0026               L34:
 502                     ; 121     case ITC_IRQ_PORTB:
 502                     ; 122     case ITC_IRQ_PORTC:
 502                     ; 123     case ITC_IRQ_PORTD:
 502                     ; 124     case ITC_IRQ_PORTE:
 502                     ; 125         Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 504  0026 c67f71        	ld	a,32625
 505                     ; 126         break;
 507  0029 2017          	jp	LC001
 508  002b               L54:
 509                     ; 136     case ITC_IRQ_SPI:
 509                     ; 137     case ITC_IRQ_TIM1_OVF:
 509                     ; 138         Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 511  002b c67f72        	ld	a,32626
 512                     ; 139         break;
 514  002e 2012          	jp	LC001
 515  0030               L74:
 516                     ; 140     case ITC_IRQ_TIM1_CAPCOM:
 516                     ; 141 #ifdef STM8S903
 516                     ; 142     case ITC_IRQ_TIM5_OVFTRI:
 516                     ; 143     case ITC_IRQ_TIM5_CAPCOM:
 516                     ; 144 #else
 516                     ; 145     case ITC_IRQ_TIM2_OVF:
 516                     ; 146     case ITC_IRQ_TIM2_CAPCOM:
 516                     ; 147 #endif /*STM8S903*/
 516                     ; 148 
 516                     ; 149     case ITC_IRQ_TIM3_OVF:
 516                     ; 150         Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 518  0030 c67f73        	ld	a,32627
 519                     ; 151         break;
 521  0033 200d          	jp	LC001
 522  0035               L15:
 523                     ; 152     case ITC_IRQ_TIM3_CAPCOM:
 523                     ; 153     case ITC_IRQ_UART1_TX:
 523                     ; 154     case ITC_IRQ_UART1_RX:
 523                     ; 155     case ITC_IRQ_I2C:
 523                     ; 156         Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 525  0035 c67f74        	ld	a,32628
 526                     ; 157         break;
 528  0038 2008          	jp	LC001
 529  003a               L35:
 530                     ; 165     case ITC_IRQ_UART3_TX:
 530                     ; 166     case ITC_IRQ_UART3_RX:
 530                     ; 167     case ITC_IRQ_ADC2:
 530                     ; 168 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 530                     ; 169 
 530                     ; 170 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 530                     ; 171     defined(STM8S903) || defined(STM8AF626x)
 530                     ; 172     case ITC_IRQ_ADC1:
 530                     ; 173 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 530                     ; 174 
 530                     ; 175 #ifdef STM8S903
 530                     ; 176     case ITC_IRQ_TIM6_OVFTRI:
 530                     ; 177 #else
 530                     ; 178     case ITC_IRQ_TIM4_OVF:
 530                     ; 179 #endif /*STM8S903*/
 530                     ; 180         Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 532  003a c67f75        	ld	a,32629
 533                     ; 181         break;
 535  003d 2003          	jp	LC001
 536  003f               L55:
 537                     ; 182     case ITC_IRQ_EEPROM_EEC:
 537                     ; 183         Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 539  003f c67f76        	ld	a,32630
 540  0042               LC001:
 541  0042 1401          	and	a,(OFST-1,sp)
 542  0044 6b02          	ld	(OFST+0,sp),a
 543                     ; 184         break;
 545                     ; 185     default:
 545                     ; 186         break;
 547  0046               L302:
 548                     ; 189     Value >>= (uint8_t)(((uint8_t)IrqNum % 4u) * 2u);
 550  0046 7b03          	ld	a,(OFST+1,sp)
 551  0048 a403          	and	a,#3
 552  004a 48            	sll	a
 553  004b 5f            	clrw	x
 554  004c 97            	ld	xl,a
 555  004d 7b02          	ld	a,(OFST+0,sp)
 556  004f 5d            	tnzw	x
 557  0050 2704          	jreq	L62
 558  0052               L03:
 559  0052 44            	srl	a
 560  0053 5a            	decw	x
 561  0054 26fc          	jrne	L03
 562  0056               L62:
 563                     ; 191     return((ITC_PriorityLevel_TypeDef)Value);
 567  0056 5b03          	addw	sp,#3
 568  0058 81            	ret	
 628                     	switch	.const
 629  0032               L64:
 630  0032 0036          	dc.w	L502
 631  0034 0036          	dc.w	L502
 632  0036 0036          	dc.w	L502
 633  0038 0036          	dc.w	L502
 634  003a 0048          	dc.w	L702
 635  003c 0048          	dc.w	L702
 636  003e 0048          	dc.w	L702
 637  0040 0048          	dc.w	L702
 638  0042 00b2          	dc.w	L552
 639  0044 00b2          	dc.w	L552
 640  0046 005a          	dc.w	L112
 641  0048 005a          	dc.w	L112
 642  004a 006c          	dc.w	L312
 643  004c 006c          	dc.w	L312
 644  004e 006c          	dc.w	L312
 645  0050 006c          	dc.w	L312
 646  0052 007e          	dc.w	L512
 647  0054 007e          	dc.w	L512
 648  0056 007e          	dc.w	L512
 649  0058 007e          	dc.w	L512
 650  005a 0090          	dc.w	L712
 651  005c 0090          	dc.w	L712
 652  005e 0090          	dc.w	L712
 653  0060 0090          	dc.w	L712
 654  0062 00a2          	dc.w	L122
 655                     ; 208 void ITC_SetSoftwarePriority(ITC_Irq_TypeDef IrqNum, ITC_PriorityLevel_TypeDef PriorityValue)
 655                     ; 209 {
 656                     .text:	section	.text,new
 657  0000               _ITC_SetSoftwarePriority:
 659  0000 89            	pushw	x
 660  0001 89            	pushw	x
 661       00000002      OFST:	set	2
 664                     ; 211     uint8_t Mask = 0;
 666                     ; 212     uint8_t NewPriority = 0;
 668                     ; 215     assert_param(IS_ITC_IRQ_OK((uint8_t)IrqNum));
 670                     ; 216     assert_param(IS_ITC_PRIORITY_OK(PriorityValue));
 672                     ; 219     assert_param(IS_ITC_INTERRUPTS_DISABLED);
 674                     ; 223     Mask = (uint8_t)(~(uint8_t)(0x03U << (((uint8_t)IrqNum % 4U) * 2U)));
 676  0002 9e            	ld	a,xh
 677  0003 a403          	and	a,#3
 678  0005 48            	sll	a
 679  0006 5f            	clrw	x
 680  0007 97            	ld	xl,a
 681  0008 a603          	ld	a,#3
 682  000a 5d            	tnzw	x
 683  000b 2704          	jreq	L43
 684  000d               L63:
 685  000d 48            	sll	a
 686  000e 5a            	decw	x
 687  000f 26fc          	jrne	L63
 688  0011               L43:
 689  0011 43            	cpl	a
 690  0012 6b01          	ld	(OFST-1,sp),a
 691                     ; 226     NewPriority = (uint8_t)((uint8_t)(PriorityValue) << (((uint8_t)IrqNum % 4U) * 2U));
 693  0014 7b03          	ld	a,(OFST+1,sp)
 694  0016 a403          	and	a,#3
 695  0018 48            	sll	a
 696  0019 5f            	clrw	x
 697  001a 97            	ld	xl,a
 698  001b 7b04          	ld	a,(OFST+2,sp)
 699  001d 5d            	tnzw	x
 700  001e 2704          	jreq	L04
 701  0020               L24:
 702  0020 48            	sll	a
 703  0021 5a            	decw	x
 704  0022 26fc          	jrne	L24
 705  0024               L04:
 706  0024 6b02          	ld	(OFST+0,sp),a
 707                     ; 228     switch (IrqNum)
 709  0026 7b03          	ld	a,(OFST+1,sp)
 711                     ; 314     default:
 711                     ; 315         break;
 712  0028 a119          	cp	a,#25
 713  002a 2503cc00b2    	jruge	L552
 714  002f 5f            	clrw	x
 715  0030 97            	ld	xl,a
 716  0031 58            	sllw	x
 717  0032 de0032        	ldw	x,(L64,x)
 718  0035 fc            	jp	(x)
 719  0036               L502:
 720                     ; 231     case ITC_IRQ_TLI: /* TLI software priority can be written but has no meaning */
 720                     ; 232     case ITC_IRQ_AWU:
 720                     ; 233     case ITC_IRQ_CLK:
 720                     ; 234     case ITC_IRQ_PORTA:
 720                     ; 235         ITC->ISPR1 &= Mask;
 722  0036 c67f70        	ld	a,32624
 723  0039 1401          	and	a,(OFST-1,sp)
 724  003b c77f70        	ld	32624,a
 725                     ; 236         ITC->ISPR1 |= NewPriority;
 727  003e c67f70        	ld	a,32624
 728  0041 1a02          	or	a,(OFST+0,sp)
 729  0043 c77f70        	ld	32624,a
 730                     ; 237         break;
 732  0046 206a          	jra	L552
 733  0048               L702:
 734                     ; 239     case ITC_IRQ_PORTB:
 734                     ; 240     case ITC_IRQ_PORTC:
 734                     ; 241     case ITC_IRQ_PORTD:
 734                     ; 242     case ITC_IRQ_PORTE:
 734                     ; 243         ITC->ISPR2 &= Mask;
 736  0048 c67f71        	ld	a,32625
 737  004b 1401          	and	a,(OFST-1,sp)
 738  004d c77f71        	ld	32625,a
 739                     ; 244         ITC->ISPR2 |= NewPriority;
 741  0050 c67f71        	ld	a,32625
 742  0053 1a02          	or	a,(OFST+0,sp)
 743  0055 c77f71        	ld	32625,a
 744                     ; 245         break;
 746  0058 2058          	jra	L552
 747  005a               L112:
 748                     ; 255     case ITC_IRQ_SPI:
 748                     ; 256     case ITC_IRQ_TIM1_OVF:
 748                     ; 257         ITC->ISPR3 &= Mask;
 750  005a c67f72        	ld	a,32626
 751  005d 1401          	and	a,(OFST-1,sp)
 752  005f c77f72        	ld	32626,a
 753                     ; 258         ITC->ISPR3 |= NewPriority;
 755  0062 c67f72        	ld	a,32626
 756  0065 1a02          	or	a,(OFST+0,sp)
 757  0067 c77f72        	ld	32626,a
 758                     ; 259         break;
 760  006a 2046          	jra	L552
 761  006c               L312:
 762                     ; 261     case ITC_IRQ_TIM1_CAPCOM:
 762                     ; 262 #ifdef STM8S903
 762                     ; 263     case ITC_IRQ_TIM5_OVFTRI:
 762                     ; 264     case ITC_IRQ_TIM5_CAPCOM:
 762                     ; 265 #else
 762                     ; 266     case ITC_IRQ_TIM2_OVF:
 762                     ; 267     case ITC_IRQ_TIM2_CAPCOM:
 762                     ; 268 #endif /*STM8S903*/
 762                     ; 269 
 762                     ; 270     case ITC_IRQ_TIM3_OVF:
 762                     ; 271         ITC->ISPR4 &= Mask;
 764  006c c67f73        	ld	a,32627
 765  006f 1401          	and	a,(OFST-1,sp)
 766  0071 c77f73        	ld	32627,a
 767                     ; 272         ITC->ISPR4 |= NewPriority;
 769  0074 c67f73        	ld	a,32627
 770  0077 1a02          	or	a,(OFST+0,sp)
 771  0079 c77f73        	ld	32627,a
 772                     ; 273         break;
 774  007c 2034          	jra	L552
 775  007e               L512:
 776                     ; 275     case ITC_IRQ_TIM3_CAPCOM:
 776                     ; 276     case ITC_IRQ_UART1_TX:
 776                     ; 277     case ITC_IRQ_UART1_RX:
 776                     ; 278     case ITC_IRQ_I2C:
 776                     ; 279         ITC->ISPR5 &= Mask;
 778  007e c67f74        	ld	a,32628
 779  0081 1401          	and	a,(OFST-1,sp)
 780  0083 c77f74        	ld	32628,a
 781                     ; 280         ITC->ISPR5 |= NewPriority;
 783  0086 c67f74        	ld	a,32628
 784  0089 1a02          	or	a,(OFST+0,sp)
 785  008b c77f74        	ld	32628,a
 786                     ; 281         break;
 788  008e 2022          	jra	L552
 789  0090               L712:
 790                     ; 290     case ITC_IRQ_UART3_TX:
 790                     ; 291     case ITC_IRQ_UART3_RX:
 790                     ; 292     case ITC_IRQ_ADC2:
 790                     ; 293 #endif /*STM8S208 or STM8S207 or STM8AF52Ax or STM8AF62Ax */
 790                     ; 294 
 790                     ; 295 #if defined(STM8S105) || defined(STM8S005) || defined(STM8S103) || defined(STM8S003) || \
 790                     ; 296     defined(STM8S903) || defined(STM8AF626x)
 790                     ; 297     case ITC_IRQ_ADC1:
 790                     ; 298 #endif /*STM8S105, STM8S103 or STM8S905 or STM8AF626x */
 790                     ; 299 
 790                     ; 300 #ifdef STM8S903
 790                     ; 301     case ITC_IRQ_TIM6_OVFTRI:
 790                     ; 302 #else
 790                     ; 303     case ITC_IRQ_TIM4_OVF:
 790                     ; 304 #endif /*STM8S903*/
 790                     ; 305         ITC->ISPR6 &= Mask;
 792  0090 c67f75        	ld	a,32629
 793  0093 1401          	and	a,(OFST-1,sp)
 794  0095 c77f75        	ld	32629,a
 795                     ; 306         ITC->ISPR6 |= NewPriority;
 797  0098 c67f75        	ld	a,32629
 798  009b 1a02          	or	a,(OFST+0,sp)
 799  009d c77f75        	ld	32629,a
 800                     ; 307         break;
 802  00a0 2010          	jra	L552
 803  00a2               L122:
 804                     ; 309     case ITC_IRQ_EEPROM_EEC:
 804                     ; 310         ITC->ISPR7 &= Mask;
 806  00a2 c67f76        	ld	a,32630
 807  00a5 1401          	and	a,(OFST-1,sp)
 808  00a7 c77f76        	ld	32630,a
 809                     ; 311         ITC->ISPR7 |= NewPriority;
 811  00aa c67f76        	ld	a,32630
 812  00ad 1a02          	or	a,(OFST+0,sp)
 813  00af c77f76        	ld	32630,a
 814                     ; 312         break;
 816                     ; 314     default:
 816                     ; 315         break;
 818  00b2               L552:
 819                     ; 319 }
 822  00b2 5b04          	addw	sp,#4
 823  00b4 81            	ret	
 836                     	xdef	_ITC_GetSoftwarePriority
 837                     	xdef	_ITC_SetSoftwarePriority
 838                     	xdef	_ITC_GetSoftIntStatus
 839                     	xdef	_ITC_DeInit
 840                     	xdef	_ITC_GetCPUCC
 859                     	end
