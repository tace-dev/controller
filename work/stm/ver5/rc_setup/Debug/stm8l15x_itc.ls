   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  47                     ; 53 uint8_t ITC_GetCPUCC(void)
  47                     ; 54 {
  49                     .text:	section	.text,new
  50  0000               _ITC_GetCPUCC:
  54                     ; 56   _asm("push cc");
  57  0000 8a            push cc
  59                     ; 57   _asm("pop a");
  62  0001 84            pop a
  64                     ; 58   return; /* Ignore compiler warning, the returned value is in A register */
  67  0002 81            	ret
  90                     ; 84 void ITC_DeInit(void)
  90                     ; 85 {
  91                     .text:	section	.text,new
  92  0000               _ITC_DeInit:
  96                     ; 86   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  98  0000 35ff7f70      	mov	32624,#255
  99                     ; 87   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 101  0004 35ff7f71      	mov	32625,#255
 102                     ; 88   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 104  0008 35ff7f72      	mov	32626,#255
 105                     ; 89   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 107  000c 35ff7f73      	mov	32627,#255
 108                     ; 90   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 110  0010 35ff7f74      	mov	32628,#255
 111                     ; 91   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 113  0014 35ff7f75      	mov	32629,#255
 114                     ; 92   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 116  0018 35ff7f76      	mov	32630,#255
 117                     ; 93   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 119  001c 35ff7f77      	mov	32631,#255
 120                     ; 94 }
 123  0020 81            	ret
 148                     ; 101 uint8_t ITC_GetSoftIntStatus(void)
 148                     ; 102 {
 149                     .text:	section	.text,new
 150  0000               _ITC_GetSoftIntStatus:
 154                     ; 103   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 156  0000 cd0000        	call	_ITC_GetCPUCC
 158  0003 a428          	and	a,#40
 161  0005 81            	ret
 466                     .const:	section	.text
 467  0000               L22:
 468  0000 0024          	dc.w	L14
 469  0002 0024          	dc.w	L14
 470  0004 0024          	dc.w	L14
 471  0006 002d          	dc.w	L34
 472  0008 002d          	dc.w	L34
 473  000a 002d          	dc.w	L34
 474  000c 002d          	dc.w	L34
 475  000e 0036          	dc.w	L54
 476  0010 0036          	dc.w	L54
 477  0012 0036          	dc.w	L54
 478  0014 0036          	dc.w	L54
 479  0016 003f          	dc.w	L74
 480  0018 003f          	dc.w	L74
 481  001a 003f          	dc.w	L74
 482  001c 003f          	dc.w	L74
 483  001e 0048          	dc.w	L15
 484  0020 0048          	dc.w	L15
 485  0022 0048          	dc.w	L15
 486  0024 0048          	dc.w	L15
 487  0026 0051          	dc.w	L35
 488  0028 0051          	dc.w	L35
 489  002a 0051          	dc.w	L35
 490  002c 0051          	dc.w	L35
 491  002e 005a          	dc.w	L55
 492  0030 005a          	dc.w	L55
 493  0032 005a          	dc.w	L55
 494  0034 005a          	dc.w	L55
 495  0036 0063          	dc.w	L75
 496  0038 0063          	dc.w	L75
 497                     ; 111 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 497                     ; 112 {
 498                     .text:	section	.text,new
 499  0000               _ITC_GetSoftwarePriority:
 501  0000 88            	push	a
 502  0001 89            	pushw	x
 503       00000002      OFST:	set	2
 506                     ; 113   uint8_t Value = 0;
 508  0002 0f02          	clr	(OFST+0,sp)
 509                     ; 114   uint8_t Mask = 0;
 511                     ; 117   assert_param(IS_ITC_IRQ(IRQn));
 513                     ; 120   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 515  0004 a403          	and	a,#3
 516  0006 48            	sll	a
 517  0007 5f            	clrw	x
 518  0008 97            	ld	xl,a
 519  0009 a603          	ld	a,#3
 520  000b 5d            	tnzw	x
 521  000c 2704          	jreq	L41
 522  000e               L61:
 523  000e 48            	sll	a
 524  000f 5a            	decw	x
 525  0010 26fc          	jrne	L61
 526  0012               L41:
 527  0012 6b01          	ld	(OFST-1,sp),a
 528                     ; 122   switch (IRQn)
 530  0014 7b03          	ld	a,(OFST+1,sp)
 532                     ; 220     default:
 532                     ; 221       break;
 533  0016 4a            	dec	a
 534  0017 a11d          	cp	a,#29
 535  0019 2407          	jruge	L02
 536  001b 5f            	clrw	x
 537  001c 97            	ld	xl,a
 538  001d 58            	sllw	x
 539  001e de0000        	ldw	x,(L22,x)
 540  0021 fc            	jp	(x)
 541  0022               L02:
 542  0022 2046          	jra	L122
 543  0024               L14:
 544                     ; 124     case FLASH_IRQn:
 544                     ; 125     case DMA1_CHANNEL0_1_IRQn:
 544                     ; 126     case DMA1_CHANNEL2_3_IRQn:
 544                     ; 127       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 546  0024 c67f70        	ld	a,32624
 547  0027 1401          	and	a,(OFST-1,sp)
 548  0029 6b02          	ld	(OFST+0,sp),a
 549                     ; 128       break;
 551  002b 203d          	jra	L122
 552  002d               L34:
 553                     ; 130     case EXTIE_F_PVD_IRQn:
 553                     ; 131 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 553                     ; 132     case RTC_IRQn:
 553                     ; 133     case EXTIB_IRQn:
 553                     ; 134     case EXTID_IRQn:
 553                     ; 135 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 553                     ; 136     case RTC_CSSLSE_IRQn:
 553                     ; 137     case EXTIB_IRQn:
 553                     ; 138     case EXTID_IRQn:
 553                     ; 139 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 553                     ; 140     case RTC_CSSLSE_IRQn:
 553                     ; 141     case EXTIB_G_IRQn:
 553                     ; 142     case EXTID_H_IRQn:
 553                     ; 143 #endif  /* STM8L15X_MD */
 553                     ; 144       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 555  002d c67f71        	ld	a,32625
 556  0030 1401          	and	a,(OFST-1,sp)
 557  0032 6b02          	ld	(OFST+0,sp),a
 558                     ; 145       break;
 560  0034 2034          	jra	L122
 561  0036               L54:
 562                     ; 147     case EXTI0_IRQn:
 562                     ; 148     case EXTI1_IRQn:
 562                     ; 149     case EXTI2_IRQn:
 562                     ; 150     case EXTI3_IRQn:
 562                     ; 151       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 564  0036 c67f72        	ld	a,32626
 565  0039 1401          	and	a,(OFST-1,sp)
 566  003b 6b02          	ld	(OFST+0,sp),a
 567                     ; 152       break;
 569  003d 202b          	jra	L122
 570  003f               L74:
 571                     ; 154     case EXTI4_IRQn:
 571                     ; 155     case EXTI5_IRQn:
 571                     ; 156     case EXTI6_IRQn:
 571                     ; 157     case EXTI7_IRQn:
 571                     ; 158       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 573  003f c67f73        	ld	a,32627
 574  0042 1401          	and	a,(OFST-1,sp)
 575  0044 6b02          	ld	(OFST+0,sp),a
 576                     ; 159       break;
 578  0046 2022          	jra	L122
 579  0048               L15:
 580                     ; 164     case SWITCH_CSS_BREAK_DAC_IRQn:
 580                     ; 165 #endif /* STM8L15X_LD */		
 580                     ; 166     case ADC1_COMP_IRQn:
 580                     ; 167 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 580                     ; 168     case LCD_IRQn:
 580                     ; 169     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 580                     ; 170 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 580                     ; 171     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 580                     ; 172 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 580                     ; 173     case LCD_AES_IRQn:
 580                     ; 174     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 580                     ; 175 #endif  /* STM8L15X_MD */
 580                     ; 176       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 582  0048 c67f74        	ld	a,32628
 583  004b 1401          	and	a,(OFST-1,sp)
 584  004d 6b02          	ld	(OFST+0,sp),a
 585                     ; 177       break;
 587  004f 2019          	jra	L122
 588  0051               L35:
 589                     ; 180     case TIM1_UPD_OVF_TRG_IRQn:
 589                     ; 181 #endif /* STM8L15X_LD */		
 589                     ; 182 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 589                     ; 183  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 589                     ; 184     case TIM2_CC_IRQn:
 589                     ; 185     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 589                     ; 186     case TIM3_CC_IRQn:
 589                     ; 187 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 589                     ; 188     case TIM2_CC_USART2_RX_IRQn:
 589                     ; 189     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 589                     ; 190     case TIM3_CC_USART3_RX_IRQn:
 589                     ; 191 #endif  /* STM8L15X_MD */
 589                     ; 192       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 591  0051 c67f75        	ld	a,32629
 592  0054 1401          	and	a,(OFST-1,sp)
 593  0056 6b02          	ld	(OFST+0,sp),a
 594                     ; 193       break;
 596  0058 2010          	jra	L122
 597  005a               L55:
 598                     ; 196     case TIM1_CC_IRQn:
 598                     ; 197 #endif /* STM8L15X_LD */	
 598                     ; 198     case TIM4_UPD_OVF_TRG_IRQn:
 598                     ; 199     case SPI1_IRQn:
 598                     ; 200 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 598                     ; 201  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 598                     ; 202     case USART1_TX_IRQn:
 598                     ; 203 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 598                     ; 204     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 598                     ; 205 #endif  /* STM8L15X_MD || STM8L15X_LD */
 598                     ; 206       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 600  005a c67f76        	ld	a,32630
 601  005d 1401          	and	a,(OFST-1,sp)
 602  005f 6b02          	ld	(OFST+0,sp),a
 603                     ; 207       break;
 605  0061 2007          	jra	L122
 606  0063               L75:
 607                     ; 211     case USART1_RX_IRQn:
 607                     ; 212     case I2C1_IRQn:
 607                     ; 213 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 607                     ; 214     case USART1_RX_TIM5_CC_IRQn:
 607                     ; 215     case I2C1_SPI2_IRQn:
 607                     ; 216 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 607                     ; 217       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 609  0063 c67f77        	ld	a,32631
 610  0066 1401          	and	a,(OFST-1,sp)
 611  0068 6b02          	ld	(OFST+0,sp),a
 612                     ; 218       break;
 614  006a               L16:
 615                     ; 220     default:
 615                     ; 221       break;
 617  006a               L122:
 618                     ; 224   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 620  006a 7b03          	ld	a,(OFST+1,sp)
 621  006c a403          	and	a,#3
 622  006e 48            	sll	a
 623  006f 5f            	clrw	x
 624  0070 97            	ld	xl,a
 625  0071 7b02          	ld	a,(OFST+0,sp)
 626  0073 5d            	tnzw	x
 627  0074 2704          	jreq	L42
 628  0076               L62:
 629  0076 44            	srl	a
 630  0077 5a            	decw	x
 631  0078 26fc          	jrne	L62
 632  007a               L42:
 633  007a 6b02          	ld	(OFST+0,sp),a
 634                     ; 226   return((ITC_PriorityLevel_TypeDef)Value);
 636  007c 7b02          	ld	a,(OFST+0,sp)
 639  007e 5b03          	addw	sp,#3
 640  0080 81            	ret
 700                     	switch	.const
 701  003a               L44:
 702  003a 0038          	dc.w	L322
 703  003c 0038          	dc.w	L322
 704  003e 0038          	dc.w	L322
 705  0040 004a          	dc.w	L522
 706  0042 004a          	dc.w	L522
 707  0044 004a          	dc.w	L522
 708  0046 004a          	dc.w	L522
 709  0048 005c          	dc.w	L722
 710  004a 005c          	dc.w	L722
 711  004c 005c          	dc.w	L722
 712  004e 005c          	dc.w	L722
 713  0050 006e          	dc.w	L132
 714  0052 006e          	dc.w	L132
 715  0054 006e          	dc.w	L132
 716  0056 006e          	dc.w	L132
 717  0058 0080          	dc.w	L332
 718  005a 0080          	dc.w	L332
 719  005c 0080          	dc.w	L332
 720  005e 0080          	dc.w	L332
 721  0060 0092          	dc.w	L532
 722  0062 0092          	dc.w	L532
 723  0064 0092          	dc.w	L532
 724  0066 0092          	dc.w	L532
 725  0068 00a4          	dc.w	L732
 726  006a 00a4          	dc.w	L732
 727  006c 00a4          	dc.w	L732
 728  006e 00a4          	dc.w	L732
 729  0070 00b6          	dc.w	L142
 730  0072 00b6          	dc.w	L142
 731                     ; 247 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 731                     ; 248 {
 732                     .text:	section	.text,new
 733  0000               _ITC_SetSoftwarePriority:
 735  0000 89            	pushw	x
 736  0001 89            	pushw	x
 737       00000002      OFST:	set	2
 740                     ; 249   uint8_t Mask = 0;
 742                     ; 250   uint8_t NewPriority = 0;
 744                     ; 253   assert_param(IS_ITC_IRQ(IRQn));
 746                     ; 254   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 748                     ; 257   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 750                     ; 261   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 752  0002 9e            	ld	a,xh
 753  0003 a403          	and	a,#3
 754  0005 48            	sll	a
 755  0006 5f            	clrw	x
 756  0007 97            	ld	xl,a
 757  0008 a603          	ld	a,#3
 758  000a 5d            	tnzw	x
 759  000b 2704          	jreq	L23
 760  000d               L43:
 761  000d 48            	sll	a
 762  000e 5a            	decw	x
 763  000f 26fc          	jrne	L43
 764  0011               L23:
 765  0011 43            	cpl	a
 766  0012 6b01          	ld	(OFST-1,sp),a
 767                     ; 263   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 769  0014 7b03          	ld	a,(OFST+1,sp)
 770  0016 a403          	and	a,#3
 771  0018 48            	sll	a
 772  0019 5f            	clrw	x
 773  001a 97            	ld	xl,a
 774  001b 7b04          	ld	a,(OFST+2,sp)
 775  001d 5d            	tnzw	x
 776  001e 2704          	jreq	L63
 777  0020               L04:
 778  0020 48            	sll	a
 779  0021 5a            	decw	x
 780  0022 26fc          	jrne	L04
 781  0024               L63:
 782  0024 6b02          	ld	(OFST+0,sp),a
 783                     ; 265   switch (IRQn)
 785  0026 7b03          	ld	a,(OFST+1,sp)
 787                     ; 369     default:
 787                     ; 370       break;
 788  0028 4a            	dec	a
 789  0029 a11d          	cp	a,#29
 790  002b 2407          	jruge	L24
 791  002d 5f            	clrw	x
 792  002e 97            	ld	xl,a
 793  002f 58            	sllw	x
 794  0030 de003a        	ldw	x,(L44,x)
 795  0033 fc            	jp	(x)
 796  0034               L24:
 797  0034 acc600c6      	jpf	L572
 798  0038               L322:
 799                     ; 267     case FLASH_IRQn:
 799                     ; 268     case DMA1_CHANNEL0_1_IRQn:
 799                     ; 269     case DMA1_CHANNEL2_3_IRQn:
 799                     ; 270       ITC->ISPR1 &= Mask;
 801  0038 c67f70        	ld	a,32624
 802  003b 1401          	and	a,(OFST-1,sp)
 803  003d c77f70        	ld	32624,a
 804                     ; 271       ITC->ISPR1 |= NewPriority;
 806  0040 c67f70        	ld	a,32624
 807  0043 1a02          	or	a,(OFST+0,sp)
 808  0045 c77f70        	ld	32624,a
 809                     ; 272       break;
 811  0048 207c          	jra	L572
 812  004a               L522:
 813                     ; 274     case EXTIE_F_PVD_IRQn:
 813                     ; 275 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 813                     ; 276     case RTC_IRQn:
 813                     ; 277     case EXTIB_IRQn:
 813                     ; 278     case EXTID_IRQn:
 813                     ; 279 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 813                     ; 280     case RTC_CSSLSE_IRQn:
 813                     ; 281     case EXTIB_IRQn:
 813                     ; 282     case EXTID_IRQn:
 813                     ; 283 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 813                     ; 284     case RTC_CSSLSE_IRQn:
 813                     ; 285     case EXTIB_G_IRQn:
 813                     ; 286     case EXTID_H_IRQn:
 813                     ; 287 #endif  /* STM8L15X_MD */
 813                     ; 288       ITC->ISPR2 &= Mask;
 815  004a c67f71        	ld	a,32625
 816  004d 1401          	and	a,(OFST-1,sp)
 817  004f c77f71        	ld	32625,a
 818                     ; 289       ITC->ISPR2 |= NewPriority;
 820  0052 c67f71        	ld	a,32625
 821  0055 1a02          	or	a,(OFST+0,sp)
 822  0057 c77f71        	ld	32625,a
 823                     ; 290       break;
 825  005a 206a          	jra	L572
 826  005c               L722:
 827                     ; 292     case EXTI0_IRQn:
 827                     ; 293     case EXTI1_IRQn:
 827                     ; 294     case EXTI2_IRQn:
 827                     ; 295     case EXTI3_IRQn:
 827                     ; 296       ITC->ISPR3 &= Mask;
 829  005c c67f72        	ld	a,32626
 830  005f 1401          	and	a,(OFST-1,sp)
 831  0061 c77f72        	ld	32626,a
 832                     ; 297       ITC->ISPR3 |= NewPriority;
 834  0064 c67f72        	ld	a,32626
 835  0067 1a02          	or	a,(OFST+0,sp)
 836  0069 c77f72        	ld	32626,a
 837                     ; 298       break;
 839  006c 2058          	jra	L572
 840  006e               L132:
 841                     ; 300     case EXTI4_IRQn:
 841                     ; 301     case EXTI5_IRQn:
 841                     ; 302     case EXTI6_IRQn:
 841                     ; 303     case EXTI7_IRQn:
 841                     ; 304       ITC->ISPR4 &= Mask;
 843  006e c67f73        	ld	a,32627
 844  0071 1401          	and	a,(OFST-1,sp)
 845  0073 c77f73        	ld	32627,a
 846                     ; 305       ITC->ISPR4 |= NewPriority;
 848  0076 c67f73        	ld	a,32627
 849  0079 1a02          	or	a,(OFST+0,sp)
 850  007b c77f73        	ld	32627,a
 851                     ; 306       break;
 853  007e 2046          	jra	L572
 854  0080               L332:
 855                     ; 308     case SWITCH_CSS_BREAK_DAC_IRQn:
 855                     ; 309 #else
 855                     ; 310     case SWITCH_CSS_IRQn:
 855                     ; 311 #endif /*	STM8L15X_LD	*/
 855                     ; 312     case ADC1_COMP_IRQn:
 855                     ; 313 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 855                     ; 314     case LCD_IRQn:
 855                     ; 315     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 855                     ; 316 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 855                     ; 317     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 855                     ; 318 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 855                     ; 319     case LCD_AES_IRQn:
 855                     ; 320     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 855                     ; 321 #endif  /* STM8L15X_MD */
 855                     ; 322       ITC->ISPR5 &= Mask;
 857  0080 c67f74        	ld	a,32628
 858  0083 1401          	and	a,(OFST-1,sp)
 859  0085 c77f74        	ld	32628,a
 860                     ; 323       ITC->ISPR5 |= NewPriority;
 862  0088 c67f74        	ld	a,32628
 863  008b 1a02          	or	a,(OFST+0,sp)
 864  008d c77f74        	ld	32628,a
 865                     ; 324       break;
 867  0090 2034          	jra	L572
 868  0092               L532:
 869                     ; 326     case TIM1_UPD_OVF_TRG_IRQn:
 869                     ; 327 #endif  /* STM8L15X_LD */
 869                     ; 328 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 869                     ; 329  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 869                     ; 330     case TIM2_CC_IRQn:
 869                     ; 331     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 869                     ; 332     case TIM3_CC_IRQn:
 869                     ; 333 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 869                     ; 334     case TIM2_CC_USART2_RX_IRQn:
 869                     ; 335     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 869                     ; 336     case TIM3_CC_USART3_RX_IRQn:
 869                     ; 337 #endif  /* STM8L15X_MD */
 869                     ; 338       ITC->ISPR6 &= Mask;
 871  0092 c67f75        	ld	a,32629
 872  0095 1401          	and	a,(OFST-1,sp)
 873  0097 c77f75        	ld	32629,a
 874                     ; 339       ITC->ISPR6 |= NewPriority;
 876  009a c67f75        	ld	a,32629
 877  009d 1a02          	or	a,(OFST+0,sp)
 878  009f c77f75        	ld	32629,a
 879                     ; 340       break;
 881  00a2 2022          	jra	L572
 882  00a4               L732:
 883                     ; 343     case TIM1_CC_IRQn:
 883                     ; 344 #endif  /* STM8L15X_LD */
 883                     ; 345     case TIM4_UPD_OVF_TRG_IRQn:
 883                     ; 346     case SPI1_IRQn:
 883                     ; 347 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 883                     ; 348  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 883                     ; 349     case USART1_TX_IRQn:
 883                     ; 350 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 883                     ; 351     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 883                     ; 352 #endif  /* STM8L15X_MD */
 883                     ; 353       ITC->ISPR7 &= Mask;
 885  00a4 c67f76        	ld	a,32630
 886  00a7 1401          	and	a,(OFST-1,sp)
 887  00a9 c77f76        	ld	32630,a
 888                     ; 354       ITC->ISPR7 |= NewPriority;
 890  00ac c67f76        	ld	a,32630
 891  00af 1a02          	or	a,(OFST+0,sp)
 892  00b1 c77f76        	ld	32630,a
 893                     ; 355       break;
 895  00b4 2010          	jra	L572
 896  00b6               L142:
 897                     ; 359     case USART1_RX_IRQn:
 897                     ; 360     case I2C1_IRQn:
 897                     ; 361 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 897                     ; 362     case USART1_RX_TIM5_CC_IRQn:
 897                     ; 363     case I2C1_SPI2_IRQn:
 897                     ; 364 #endif  /* STM8L15X_MD */
 897                     ; 365       ITC->ISPR8 &= Mask;
 899  00b6 c67f77        	ld	a,32631
 900  00b9 1401          	and	a,(OFST-1,sp)
 901  00bb c77f77        	ld	32631,a
 902                     ; 366       ITC->ISPR8 |= NewPriority;
 904  00be c67f77        	ld	a,32631
 905  00c1 1a02          	or	a,(OFST+0,sp)
 906  00c3 c77f77        	ld	32631,a
 907                     ; 367       break;
 909  00c6               L342:
 910                     ; 369     default:
 910                     ; 370       break;
 912  00c6               L572:
 913                     ; 372 }
 916  00c6 5b04          	addw	sp,#4
 917  00c8 81            	ret
 930                     	xdef	_ITC_GetSoftwarePriority
 931                     	xdef	_ITC_SetSoftwarePriority
 932                     	xdef	_ITC_GetSoftIntStatus
 933                     	xdef	_ITC_GetCPUCC
 934                     	xdef	_ITC_DeInit
 953                     	end
