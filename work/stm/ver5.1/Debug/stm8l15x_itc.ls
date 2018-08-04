   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  49                     ; 53 uint8_t ITC_GetCPUCC(void)
  49                     ; 54 {
  51                     	switch	.text
  52  0000               _ITC_GetCPUCC:
  56                     ; 56   _asm("push cc");
  59  0000 8a            	push	cc
  61                     ; 57   _asm("pop a");
  64  0001 84            	pop	a
  66                     ; 58   return; /* Ignore compiler warning, the returned value is in A register */
  69  0002 81            	ret	
  92                     ; 84 void ITC_DeInit(void)
  92                     ; 85 {
  93                     	switch	.text
  94  0003               _ITC_DeInit:
  98                     ; 86   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
 100  0003 35ff7f70      	mov	32624,#255
 101                     ; 87   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 103  0007 35ff7f71      	mov	32625,#255
 104                     ; 88   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 106  000b 35ff7f72      	mov	32626,#255
 107                     ; 89   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 109  000f 35ff7f73      	mov	32627,#255
 110                     ; 90   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 112  0013 35ff7f74      	mov	32628,#255
 113                     ; 91   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 115  0017 35ff7f75      	mov	32629,#255
 116                     ; 92   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 118  001b 35ff7f76      	mov	32630,#255
 119                     ; 93   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 121  001f 35ff7f77      	mov	32631,#255
 122                     ; 94 }
 125  0023 81            	ret	
 150                     ; 101 uint8_t ITC_GetSoftIntStatus(void)
 150                     ; 102 {
 151                     	switch	.text
 152  0024               _ITC_GetSoftIntStatus:
 156                     ; 103   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 158  0024 adda          	call	_ITC_GetCPUCC
 160  0026 a428          	and	a,#40
 163  0028 81            	ret	
 468                     .const:	section	.text
 469  0000               L42:
 470  0000 004b          	dc.w	L14
 471  0002 004b          	dc.w	L14
 472  0004 004b          	dc.w	L14
 473  0006 0050          	dc.w	L34
 474  0008 0050          	dc.w	L34
 475  000a 0050          	dc.w	L34
 476  000c 0050          	dc.w	L34
 477  000e 0055          	dc.w	L54
 478  0010 0055          	dc.w	L54
 479  0012 0055          	dc.w	L54
 480  0014 0055          	dc.w	L54
 481  0016 005a          	dc.w	L74
 482  0018 005a          	dc.w	L74
 483  001a 005a          	dc.w	L74
 484  001c 005a          	dc.w	L74
 485  001e 005f          	dc.w	L15
 486  0020 005f          	dc.w	L15
 487  0022 005f          	dc.w	L15
 488  0024 005f          	dc.w	L15
 489  0026 0064          	dc.w	L35
 490  0028 0064          	dc.w	L35
 491  002a 0064          	dc.w	L35
 492  002c 0064          	dc.w	L35
 493  002e 0069          	dc.w	L55
 494  0030 0069          	dc.w	L55
 495  0032 0069          	dc.w	L55
 496  0034 0069          	dc.w	L55
 497  0036 006e          	dc.w	L75
 498  0038 006e          	dc.w	L75
 499                     ; 111 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 499                     ; 112 {
 500                     	switch	.text
 501  0029               _ITC_GetSoftwarePriority:
 503  0029 88            	push	a
 504  002a 89            	pushw	x
 505       00000002      OFST:	set	2
 508                     ; 113   uint8_t Value = 0;
 510  002b 0f02          	clr	(OFST+0,sp)
 511                     ; 114   uint8_t Mask = 0;
 513                     ; 117   assert_param(IS_ITC_IRQ(IRQn));
 515                     ; 120   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 517  002d a403          	and	a,#3
 518  002f 48            	sll	a
 519  0030 5f            	clrw	x
 520  0031 97            	ld	xl,a
 521  0032 a603          	ld	a,#3
 522  0034 5d            	tnzw	x
 523  0035 2704          	jreq	L61
 524  0037               L02:
 525  0037 48            	sll	a
 526  0038 5a            	decw	x
 527  0039 26fc          	jrne	L02
 528  003b               L61:
 529  003b 6b01          	ld	(OFST-1,sp),a
 530                     ; 122   switch (IRQn)
 532  003d 7b03          	ld	a,(OFST+1,sp)
 534                     ; 220     default:
 534                     ; 221       break;
 535  003f 4a            	dec	a
 536  0040 a11d          	cp	a,#29
 537  0042 2431          	jruge	L122
 538  0044 5f            	clrw	x
 539  0045 97            	ld	xl,a
 540  0046 58            	sllw	x
 541  0047 de0000        	ldw	x,(L42,x)
 542  004a fc            	jp	(x)
 543  004b               L14:
 544                     ; 124     case FLASH_IRQn:
 544                     ; 125     case DMA1_CHANNEL0_1_IRQn:
 544                     ; 126     case DMA1_CHANNEL2_3_IRQn:
 544                     ; 127       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 546  004b c67f70        	ld	a,32624
 547                     ; 128       break;
 549  004e 2021          	jp	LC001
 550  0050               L34:
 551                     ; 130     case EXTIE_F_PVD_IRQn:
 551                     ; 131 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 551                     ; 132     case RTC_IRQn:
 551                     ; 133     case EXTIB_IRQn:
 551                     ; 134     case EXTID_IRQn:
 551                     ; 135 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 551                     ; 136     case RTC_CSSLSE_IRQn:
 551                     ; 137     case EXTIB_IRQn:
 551                     ; 138     case EXTID_IRQn:
 551                     ; 139 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 551                     ; 140     case RTC_CSSLSE_IRQn:
 551                     ; 141     case EXTIB_G_IRQn:
 551                     ; 142     case EXTID_H_IRQn:
 551                     ; 143 #endif  /* STM8L15X_MD */
 551                     ; 144       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 553  0050 c67f71        	ld	a,32625
 554                     ; 145       break;
 556  0053 201c          	jp	LC001
 557  0055               L54:
 558                     ; 147     case EXTI0_IRQn:
 558                     ; 148     case EXTI1_IRQn:
 558                     ; 149     case EXTI2_IRQn:
 558                     ; 150     case EXTI3_IRQn:
 558                     ; 151       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 560  0055 c67f72        	ld	a,32626
 561                     ; 152       break;
 563  0058 2017          	jp	LC001
 564  005a               L74:
 565                     ; 154     case EXTI4_IRQn:
 565                     ; 155     case EXTI5_IRQn:
 565                     ; 156     case EXTI6_IRQn:
 565                     ; 157     case EXTI7_IRQn:
 565                     ; 158       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 567  005a c67f73        	ld	a,32627
 568                     ; 159       break;
 570  005d 2012          	jp	LC001
 571  005f               L15:
 572                     ; 164     case SWITCH_CSS_BREAK_DAC_IRQn:
 572                     ; 165 #endif /* STM8L15X_LD */		
 572                     ; 166     case ADC1_COMP_IRQn:
 572                     ; 167 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 572                     ; 168     case LCD_IRQn:
 572                     ; 169     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 572                     ; 170 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 572                     ; 171     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 572                     ; 172 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 572                     ; 173     case LCD_AES_IRQn:
 572                     ; 174     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 572                     ; 175 #endif  /* STM8L15X_MD */
 572                     ; 176       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 574  005f c67f74        	ld	a,32628
 575                     ; 177       break;
 577  0062 200d          	jp	LC001
 578  0064               L35:
 579                     ; 180     case TIM1_UPD_OVF_TRG_IRQn:
 579                     ; 181 #endif /* STM8L15X_LD */		
 579                     ; 182 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 579                     ; 183  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 579                     ; 184     case TIM2_CC_IRQn:
 579                     ; 185     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 579                     ; 186     case TIM3_CC_IRQn:
 579                     ; 187 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 579                     ; 188     case TIM2_CC_USART2_RX_IRQn:
 579                     ; 189     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 579                     ; 190     case TIM3_CC_USART3_RX_IRQn:
 579                     ; 191 #endif  /* STM8L15X_MD */
 579                     ; 192       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 581  0064 c67f75        	ld	a,32629
 582                     ; 193       break;
 584  0067 2008          	jp	LC001
 585  0069               L55:
 586                     ; 196     case TIM1_CC_IRQn:
 586                     ; 197 #endif /* STM8L15X_LD */	
 586                     ; 198     case TIM4_UPD_OVF_TRG_IRQn:
 586                     ; 199     case SPI1_IRQn:
 586                     ; 200 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 586                     ; 201  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 586                     ; 202     case USART1_TX_IRQn:
 586                     ; 203 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 586                     ; 204     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 586                     ; 205 #endif  /* STM8L15X_MD || STM8L15X_LD */
 586                     ; 206       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 588  0069 c67f76        	ld	a,32630
 589                     ; 207       break;
 591  006c 2003          	jp	LC001
 592  006e               L75:
 593                     ; 211     case USART1_RX_IRQn:
 593                     ; 212     case I2C1_IRQn:
 593                     ; 213 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 593                     ; 214     case USART1_RX_TIM5_CC_IRQn:
 593                     ; 215     case I2C1_SPI2_IRQn:
 593                     ; 216 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 593                     ; 217       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 595  006e c67f77        	ld	a,32631
 596  0071               LC001:
 597  0071 1401          	and	a,(OFST-1,sp)
 598  0073 6b02          	ld	(OFST+0,sp),a
 599                     ; 218       break;
 601                     ; 220     default:
 601                     ; 221       break;
 603  0075               L122:
 604                     ; 224   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 606  0075 7b03          	ld	a,(OFST+1,sp)
 607  0077 a403          	and	a,#3
 608  0079 48            	sll	a
 609  007a 5f            	clrw	x
 610  007b 97            	ld	xl,a
 611  007c 7b02          	ld	a,(OFST+0,sp)
 612  007e 5d            	tnzw	x
 613  007f 2704          	jreq	L62
 614  0081               L03:
 615  0081 44            	srl	a
 616  0082 5a            	decw	x
 617  0083 26fc          	jrne	L03
 618  0085               L62:
 619                     ; 226   return((ITC_PriorityLevel_TypeDef)Value);
 623  0085 5b03          	addw	sp,#3
 624  0087 81            	ret	
 684                     	switch	.const
 685  003a               L64:
 686  003a 00bf          	dc.w	L322
 687  003c 00bf          	dc.w	L322
 688  003e 00bf          	dc.w	L322
 689  0040 00d1          	dc.w	L522
 690  0042 00d1          	dc.w	L522
 691  0044 00d1          	dc.w	L522
 692  0046 00d1          	dc.w	L522
 693  0048 00e3          	dc.w	L722
 694  004a 00e3          	dc.w	L722
 695  004c 00e3          	dc.w	L722
 696  004e 00e3          	dc.w	L722
 697  0050 00f5          	dc.w	L132
 698  0052 00f5          	dc.w	L132
 699  0054 00f5          	dc.w	L132
 700  0056 00f5          	dc.w	L132
 701  0058 0107          	dc.w	L332
 702  005a 0107          	dc.w	L332
 703  005c 0107          	dc.w	L332
 704  005e 0107          	dc.w	L332
 705  0060 0119          	dc.w	L532
 706  0062 0119          	dc.w	L532
 707  0064 0119          	dc.w	L532
 708  0066 0119          	dc.w	L532
 709  0068 012b          	dc.w	L732
 710  006a 012b          	dc.w	L732
 711  006c 012b          	dc.w	L732
 712  006e 012b          	dc.w	L732
 713  0070 013d          	dc.w	L142
 714  0072 013d          	dc.w	L142
 715                     ; 247 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 715                     ; 248 {
 716                     	switch	.text
 717  0088               _ITC_SetSoftwarePriority:
 719  0088 89            	pushw	x
 720  0089 89            	pushw	x
 721       00000002      OFST:	set	2
 724                     ; 249   uint8_t Mask = 0;
 726                     ; 250   uint8_t NewPriority = 0;
 728                     ; 253   assert_param(IS_ITC_IRQ(IRQn));
 730                     ; 254   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 732                     ; 257   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 734                     ; 261   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 736  008a 9e            	ld	a,xh
 737  008b a403          	and	a,#3
 738  008d 48            	sll	a
 739  008e 5f            	clrw	x
 740  008f 97            	ld	xl,a
 741  0090 a603          	ld	a,#3
 742  0092 5d            	tnzw	x
 743  0093 2704          	jreq	L43
 744  0095               L63:
 745  0095 48            	sll	a
 746  0096 5a            	decw	x
 747  0097 26fc          	jrne	L63
 748  0099               L43:
 749  0099 43            	cpl	a
 750  009a 6b01          	ld	(OFST-1,sp),a
 751                     ; 263   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 753  009c 7b03          	ld	a,(OFST+1,sp)
 754  009e a403          	and	a,#3
 755  00a0 48            	sll	a
 756  00a1 5f            	clrw	x
 757  00a2 97            	ld	xl,a
 758  00a3 7b04          	ld	a,(OFST+2,sp)
 759  00a5 5d            	tnzw	x
 760  00a6 2704          	jreq	L04
 761  00a8               L24:
 762  00a8 48            	sll	a
 763  00a9 5a            	decw	x
 764  00aa 26fc          	jrne	L24
 765  00ac               L04:
 766  00ac 6b02          	ld	(OFST+0,sp),a
 767                     ; 265   switch (IRQn)
 769  00ae 7b03          	ld	a,(OFST+1,sp)
 771                     ; 369     default:
 771                     ; 370       break;
 772  00b0 4a            	dec	a
 773  00b1 a11d          	cp	a,#29
 774  00b3 2503cc014d    	jruge	L572
 775  00b8 5f            	clrw	x
 776  00b9 97            	ld	xl,a
 777  00ba 58            	sllw	x
 778  00bb de003a        	ldw	x,(L64,x)
 779  00be fc            	jp	(x)
 780  00bf               L322:
 781                     ; 267     case FLASH_IRQn:
 781                     ; 268     case DMA1_CHANNEL0_1_IRQn:
 781                     ; 269     case DMA1_CHANNEL2_3_IRQn:
 781                     ; 270       ITC->ISPR1 &= Mask;
 783  00bf c67f70        	ld	a,32624
 784  00c2 1401          	and	a,(OFST-1,sp)
 785  00c4 c77f70        	ld	32624,a
 786                     ; 271       ITC->ISPR1 |= NewPriority;
 788  00c7 c67f70        	ld	a,32624
 789  00ca 1a02          	or	a,(OFST+0,sp)
 790  00cc c77f70        	ld	32624,a
 791                     ; 272       break;
 793  00cf 207c          	jra	L572
 794  00d1               L522:
 795                     ; 274     case EXTIE_F_PVD_IRQn:
 795                     ; 275 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 795                     ; 276     case RTC_IRQn:
 795                     ; 277     case EXTIB_IRQn:
 795                     ; 278     case EXTID_IRQn:
 795                     ; 279 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 795                     ; 280     case RTC_CSSLSE_IRQn:
 795                     ; 281     case EXTIB_IRQn:
 795                     ; 282     case EXTID_IRQn:
 795                     ; 283 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 795                     ; 284     case RTC_CSSLSE_IRQn:
 795                     ; 285     case EXTIB_G_IRQn:
 795                     ; 286     case EXTID_H_IRQn:
 795                     ; 287 #endif  /* STM8L15X_MD */
 795                     ; 288       ITC->ISPR2 &= Mask;
 797  00d1 c67f71        	ld	a,32625
 798  00d4 1401          	and	a,(OFST-1,sp)
 799  00d6 c77f71        	ld	32625,a
 800                     ; 289       ITC->ISPR2 |= NewPriority;
 802  00d9 c67f71        	ld	a,32625
 803  00dc 1a02          	or	a,(OFST+0,sp)
 804  00de c77f71        	ld	32625,a
 805                     ; 290       break;
 807  00e1 206a          	jra	L572
 808  00e3               L722:
 809                     ; 292     case EXTI0_IRQn:
 809                     ; 293     case EXTI1_IRQn:
 809                     ; 294     case EXTI2_IRQn:
 809                     ; 295     case EXTI3_IRQn:
 809                     ; 296       ITC->ISPR3 &= Mask;
 811  00e3 c67f72        	ld	a,32626
 812  00e6 1401          	and	a,(OFST-1,sp)
 813  00e8 c77f72        	ld	32626,a
 814                     ; 297       ITC->ISPR3 |= NewPriority;
 816  00eb c67f72        	ld	a,32626
 817  00ee 1a02          	or	a,(OFST+0,sp)
 818  00f0 c77f72        	ld	32626,a
 819                     ; 298       break;
 821  00f3 2058          	jra	L572
 822  00f5               L132:
 823                     ; 300     case EXTI4_IRQn:
 823                     ; 301     case EXTI5_IRQn:
 823                     ; 302     case EXTI6_IRQn:
 823                     ; 303     case EXTI7_IRQn:
 823                     ; 304       ITC->ISPR4 &= Mask;
 825  00f5 c67f73        	ld	a,32627
 826  00f8 1401          	and	a,(OFST-1,sp)
 827  00fa c77f73        	ld	32627,a
 828                     ; 305       ITC->ISPR4 |= NewPriority;
 830  00fd c67f73        	ld	a,32627
 831  0100 1a02          	or	a,(OFST+0,sp)
 832  0102 c77f73        	ld	32627,a
 833                     ; 306       break;
 835  0105 2046          	jra	L572
 836  0107               L332:
 837                     ; 308     case SWITCH_CSS_BREAK_DAC_IRQn:
 837                     ; 309 #else
 837                     ; 310     case SWITCH_CSS_IRQn:
 837                     ; 311 #endif /*	STM8L15X_LD	*/
 837                     ; 312     case ADC1_COMP_IRQn:
 837                     ; 313 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 837                     ; 314     case LCD_IRQn:
 837                     ; 315     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 837                     ; 316 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 837                     ; 317     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 837                     ; 318 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 837                     ; 319     case LCD_AES_IRQn:
 837                     ; 320     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 837                     ; 321 #endif  /* STM8L15X_MD */
 837                     ; 322       ITC->ISPR5 &= Mask;
 839  0107 c67f74        	ld	a,32628
 840  010a 1401          	and	a,(OFST-1,sp)
 841  010c c77f74        	ld	32628,a
 842                     ; 323       ITC->ISPR5 |= NewPriority;
 844  010f c67f74        	ld	a,32628
 845  0112 1a02          	or	a,(OFST+0,sp)
 846  0114 c77f74        	ld	32628,a
 847                     ; 324       break;
 849  0117 2034          	jra	L572
 850  0119               L532:
 851                     ; 326     case TIM1_UPD_OVF_TRG_IRQn:
 851                     ; 327 #endif  /* STM8L15X_LD */
 851                     ; 328 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 851                     ; 329  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 851                     ; 330     case TIM2_CC_IRQn:
 851                     ; 331     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 851                     ; 332     case TIM3_CC_IRQn:
 851                     ; 333 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 851                     ; 334     case TIM2_CC_USART2_RX_IRQn:
 851                     ; 335     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 851                     ; 336     case TIM3_CC_USART3_RX_IRQn:
 851                     ; 337 #endif  /* STM8L15X_MD */
 851                     ; 338       ITC->ISPR6 &= Mask;
 853  0119 c67f75        	ld	a,32629
 854  011c 1401          	and	a,(OFST-1,sp)
 855  011e c77f75        	ld	32629,a
 856                     ; 339       ITC->ISPR6 |= NewPriority;
 858  0121 c67f75        	ld	a,32629
 859  0124 1a02          	or	a,(OFST+0,sp)
 860  0126 c77f75        	ld	32629,a
 861                     ; 340       break;
 863  0129 2022          	jra	L572
 864  012b               L732:
 865                     ; 343     case TIM1_CC_IRQn:
 865                     ; 344 #endif  /* STM8L15X_LD */
 865                     ; 345     case TIM4_UPD_OVF_TRG_IRQn:
 865                     ; 346     case SPI1_IRQn:
 865                     ; 347 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 865                     ; 348  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 865                     ; 349     case USART1_TX_IRQn:
 865                     ; 350 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 865                     ; 351     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 865                     ; 352 #endif  /* STM8L15X_MD */
 865                     ; 353       ITC->ISPR7 &= Mask;
 867  012b c67f76        	ld	a,32630
 868  012e 1401          	and	a,(OFST-1,sp)
 869  0130 c77f76        	ld	32630,a
 870                     ; 354       ITC->ISPR7 |= NewPriority;
 872  0133 c67f76        	ld	a,32630
 873  0136 1a02          	or	a,(OFST+0,sp)
 874  0138 c77f76        	ld	32630,a
 875                     ; 355       break;
 877  013b 2010          	jra	L572
 878  013d               L142:
 879                     ; 359     case USART1_RX_IRQn:
 879                     ; 360     case I2C1_IRQn:
 879                     ; 361 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 879                     ; 362     case USART1_RX_TIM5_CC_IRQn:
 879                     ; 363     case I2C1_SPI2_IRQn:
 879                     ; 364 #endif  /* STM8L15X_MD */
 879                     ; 365       ITC->ISPR8 &= Mask;
 881  013d c67f77        	ld	a,32631
 882  0140 1401          	and	a,(OFST-1,sp)
 883  0142 c77f77        	ld	32631,a
 884                     ; 366       ITC->ISPR8 |= NewPriority;
 886  0145 c67f77        	ld	a,32631
 887  0148 1a02          	or	a,(OFST+0,sp)
 888  014a c77f77        	ld	32631,a
 889                     ; 367       break;
 891                     ; 369     default:
 891                     ; 370       break;
 893  014d               L572:
 894                     ; 372 }
 897  014d 5b04          	addw	sp,#4
 898  014f 81            	ret	
 911                     	xdef	_ITC_GetSoftwarePriority
 912                     	xdef	_ITC_SetSoftwarePriority
 913                     	xdef	_ITC_GetSoftIntStatus
 914                     	xdef	_ITC_GetCPUCC
 915                     	xdef	_ITC_DeInit
 934                     	end
