   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 53 uint8_t ITC_GetCPUCC(void)
  50                     ; 54 {
  51                     .text:	section	.text,new
  52  0000               f_ITC_GetCPUCC:
  56                     ; 56   _asm("push cc");
  59  0000 8a            	push	cc
  61                     ; 57   _asm("pop a");
  64  0001 84            	pop	a
  66                     ; 58   return; /* Ignore compiler warning, the returned value is in A register */
  69  0002 87            	retf	
  91                     ; 84 void ITC_DeInit(void)
  91                     ; 85 {
  92                     .text:	section	.text,new
  93  0000               f_ITC_DeInit:
  97                     ; 86   ITC->ISPR1 = ITC_SPRX_RESET_VALUE;
  99  0000 35ff7f70      	mov	32624,#255
 100                     ; 87   ITC->ISPR2 = ITC_SPRX_RESET_VALUE;
 102  0004 35ff7f71      	mov	32625,#255
 103                     ; 88   ITC->ISPR3 = ITC_SPRX_RESET_VALUE;
 105  0008 35ff7f72      	mov	32626,#255
 106                     ; 89   ITC->ISPR4 = ITC_SPRX_RESET_VALUE;
 108  000c 35ff7f73      	mov	32627,#255
 109                     ; 90   ITC->ISPR5 = ITC_SPRX_RESET_VALUE;
 111  0010 35ff7f74      	mov	32628,#255
 112                     ; 91   ITC->ISPR6 = ITC_SPRX_RESET_VALUE;
 114  0014 35ff7f75      	mov	32629,#255
 115                     ; 92   ITC->ISPR7 = ITC_SPRX_RESET_VALUE;
 117  0018 35ff7f76      	mov	32630,#255
 118                     ; 93   ITC->ISPR8 = ITC_SPRX_RESET_VALUE;
 120  001c 35ff7f77      	mov	32631,#255
 121                     ; 94 }
 124  0020 87            	retf	
 148                     ; 101 uint8_t ITC_GetSoftIntStatus(void)
 148                     ; 102 {
 149                     .text:	section	.text,new
 150  0000               f_ITC_GetSoftIntStatus:
 154                     ; 103   return ((uint8_t)(ITC_GetCPUCC() & CPU_SOFT_INT_DISABLED));
 156  0000 8d000000      	callf	f_ITC_GetCPUCC
 158  0004 a428          	and	a,#40
 161  0006 87            	retf	
 469                     ; 111 ITC_PriorityLevel_TypeDef ITC_GetSoftwarePriority(IRQn_TypeDef IRQn)
 469                     ; 112 {
 470                     .text:	section	.text,new
 471  0000               f_ITC_GetSoftwarePriority:
 473  0000 88            	push	a
 474  0001 89            	pushw	x
 475       00000002      OFST:	set	2
 478                     ; 113   uint8_t Value = 0;
 480  0002 0f02          	clr	(OFST+0,sp)
 481                     ; 114   uint8_t Mask = 0;
 483                     ; 117   assert_param(IS_ITC_IRQ(IRQn));
 485                     ; 120   Mask = (uint8_t)(0x03U << ((IRQn % 4U) * 2U));
 487  0004 a403          	and	a,#3
 488  0006 48            	sll	a
 489  0007 5f            	clrw	x
 490  0008 97            	ld	xl,a
 491  0009 a603          	ld	a,#3
 492  000b 5d            	tnzw	x
 493  000c 2704          	jreq	L61
 494  000e               L02:
 495  000e 48            	sll	a
 496  000f 5a            	decw	x
 497  0010 26fc          	jrne	L02
 498  0012               L61:
 499  0012 6b01          	ld	(OFST-1,sp),a
 500                     ; 122   switch (IRQn)
 502  0014 7b03          	ld	a,(OFST+1,sp)
 504                     ; 220     default:
 504                     ; 221       break;
 505  0016 4a            	dec	a
 506  0017 a11d          	cp	a,#29
 507  0019 246a          	jruge	L122
 508  001b 8d000000      	callf	d_jctab
 510  001f               L42:
 511  001f 003c          	dc.w	L14-L42
 512  0021 003c          	dc.w	L14-L42
 513  0023 003c          	dc.w	L14-L42
 514  0025 0041          	dc.w	L34-L42
 515  0027 0041          	dc.w	L34-L42
 516  0029 0041          	dc.w	L34-L42
 517  002b 0041          	dc.w	L34-L42
 518  002d 0046          	dc.w	L54-L42
 519  002f 0046          	dc.w	L54-L42
 520  0031 0046          	dc.w	L54-L42
 521  0033 0046          	dc.w	L54-L42
 522  0035 004b          	dc.w	L74-L42
 523  0037 004b          	dc.w	L74-L42
 524  0039 004b          	dc.w	L74-L42
 525  003b 004b          	dc.w	L74-L42
 526  003d 0050          	dc.w	L15-L42
 527  003f 0050          	dc.w	L15-L42
 528  0041 0050          	dc.w	L15-L42
 529  0043 0050          	dc.w	L15-L42
 530  0045 0055          	dc.w	L35-L42
 531  0047 0055          	dc.w	L35-L42
 532  0049 0055          	dc.w	L35-L42
 533  004b 0055          	dc.w	L35-L42
 534  004d 005a          	dc.w	L55-L42
 535  004f 005a          	dc.w	L55-L42
 536  0051 005a          	dc.w	L55-L42
 537  0053 005a          	dc.w	L55-L42
 538  0055 005f          	dc.w	L75-L42
 539  0057 005f          	dc.w	L75-L42
 540  0059 202a          	jra	L122
 541  005b               L14:
 542                     ; 124     case FLASH_IRQn:
 542                     ; 125     case DMA1_CHANNEL0_1_IRQn:
 542                     ; 126     case DMA1_CHANNEL2_3_IRQn:
 542                     ; 127       Value = (uint8_t)(ITC->ISPR1 & Mask); /* Read software priority */
 544  005b c67f70        	ld	a,32624
 545                     ; 128       break;
 547  005e 2021          	jpf	LC001
 548  0060               L34:
 549                     ; 130     case EXTIE_F_PVD_IRQn:
 549                     ; 131 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 549                     ; 132     case RTC_IRQn:
 549                     ; 133     case EXTIB_IRQn:
 549                     ; 134     case EXTID_IRQn:
 549                     ; 135 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 549                     ; 136     case RTC_CSSLSE_IRQn:
 549                     ; 137     case EXTIB_IRQn:
 549                     ; 138     case EXTID_IRQn:
 549                     ; 139 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 549                     ; 140     case RTC_CSSLSE_IRQn:
 549                     ; 141     case EXTIB_G_IRQn:
 549                     ; 142     case EXTID_H_IRQn:
 549                     ; 143 #endif  /* STM8L15X_MD */
 549                     ; 144       Value = (uint8_t)(ITC->ISPR2 & Mask); /* Read software priority */
 551  0060 c67f71        	ld	a,32625
 552                     ; 145       break;
 554  0063 201c          	jpf	LC001
 555  0065               L54:
 556                     ; 147     case EXTI0_IRQn:
 556                     ; 148     case EXTI1_IRQn:
 556                     ; 149     case EXTI2_IRQn:
 556                     ; 150     case EXTI3_IRQn:
 556                     ; 151       Value = (uint8_t)(ITC->ISPR3 & Mask); /* Read software priority */
 558  0065 c67f72        	ld	a,32626
 559                     ; 152       break;
 561  0068 2017          	jpf	LC001
 562  006a               L74:
 563                     ; 154     case EXTI4_IRQn:
 563                     ; 155     case EXTI5_IRQn:
 563                     ; 156     case EXTI6_IRQn:
 563                     ; 157     case EXTI7_IRQn:
 563                     ; 158       Value = (uint8_t)(ITC->ISPR4 & Mask); /* Read software priority */
 565  006a c67f73        	ld	a,32627
 566                     ; 159       break;
 568  006d 2012          	jpf	LC001
 569  006f               L15:
 570                     ; 164     case SWITCH_CSS_BREAK_DAC_IRQn:
 570                     ; 165 #endif /* STM8L15X_LD */		
 570                     ; 166     case ADC1_COMP_IRQn:
 570                     ; 167 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 570                     ; 168     case LCD_IRQn:
 570                     ; 169     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 570                     ; 170 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 570                     ; 171     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 570                     ; 172 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 570                     ; 173     case LCD_AES_IRQn:
 570                     ; 174     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 570                     ; 175 #endif  /* STM8L15X_MD */
 570                     ; 176       Value = (uint8_t)(ITC->ISPR5 & Mask); /* Read software priority */
 572  006f c67f74        	ld	a,32628
 573                     ; 177       break;
 575  0072 200d          	jpf	LC001
 576  0074               L35:
 577                     ; 180     case TIM1_UPD_OVF_TRG_IRQn:
 577                     ; 181 #endif /* STM8L15X_LD */		
 577                     ; 182 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 577                     ; 183  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 577                     ; 184     case TIM2_CC_IRQn:
 577                     ; 185     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 577                     ; 186     case TIM3_CC_IRQn:
 577                     ; 187 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 577                     ; 188     case TIM2_CC_USART2_RX_IRQn:
 577                     ; 189     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 577                     ; 190     case TIM3_CC_USART3_RX_IRQn:
 577                     ; 191 #endif  /* STM8L15X_MD */
 577                     ; 192       Value = (uint8_t)(ITC->ISPR6 & Mask); /* Read software priority */
 579  0074 c67f75        	ld	a,32629
 580                     ; 193       break;
 582  0077 2008          	jpf	LC001
 583  0079               L55:
 584                     ; 196     case TIM1_CC_IRQn:
 584                     ; 197 #endif /* STM8L15X_LD */	
 584                     ; 198     case TIM4_UPD_OVF_TRG_IRQn:
 584                     ; 199     case SPI1_IRQn:
 584                     ; 200 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 584                     ; 201  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 584                     ; 202     case USART1_TX_IRQn:
 584                     ; 203 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 584                     ; 204     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 584                     ; 205 #endif  /* STM8L15X_MD || STM8L15X_LD */
 584                     ; 206       Value = (uint8_t)(ITC->ISPR7 & Mask); /* Read software priority */
 586  0079 c67f76        	ld	a,32630
 587                     ; 207       break;
 589  007c 2003          	jpf	LC001
 590  007e               L75:
 591                     ; 214     case USART1_RX_TIM5_CC_IRQn:
 591                     ; 215     case I2C1_SPI2_IRQn:
 591                     ; 216 #endif  /* STM8L15X_MD || STM8L15X_LD*/
 591                     ; 217       Value = (uint8_t)(ITC->ISPR8 & Mask); /* Read software priority */
 593  007e c67f77        	ld	a,32631
 594  0081               LC001:
 595  0081 1401          	and	a,(OFST-1,sp)
 596  0083 6b02          	ld	(OFST+0,sp),a
 597                     ; 218       break;
 599                     ; 220     default:
 599                     ; 221       break;
 601  0085               L122:
 602                     ; 224   Value >>= (uint8_t)((IRQn % 4u) * 2u);
 604  0085 7b03          	ld	a,(OFST+1,sp)
 605  0087 a403          	and	a,#3
 606  0089 48            	sll	a
 607  008a 5f            	clrw	x
 608  008b 97            	ld	xl,a
 609  008c 7b02          	ld	a,(OFST+0,sp)
 610  008e 5d            	tnzw	x
 611  008f 2704          	jreq	L62
 612  0091               L03:
 613  0091 44            	srl	a
 614  0092 5a            	decw	x
 615  0093 26fc          	jrne	L03
 616  0095               L62:
 617                     ; 226   return((ITC_PriorityLevel_TypeDef)Value);
 621  0095 5b03          	addw	sp,#3
 622  0097 87            	retf	
 681                     ; 247 void ITC_SetSoftwarePriority(IRQn_TypeDef IRQn, ITC_PriorityLevel_TypeDef ITC_PriorityLevel)
 681                     ; 248 {
 682                     .text:	section	.text,new
 683  0000               f_ITC_SetSoftwarePriority:
 685  0000 89            	pushw	x
 686  0001 89            	pushw	x
 687       00000002      OFST:	set	2
 690                     ; 249   uint8_t Mask = 0;
 692                     ; 250   uint8_t NewPriority = 0;
 694                     ; 253   assert_param(IS_ITC_IRQ(IRQn));
 696                     ; 254   assert_param(IS_ITC_PRIORITY(ITC_PriorityLevel));
 698                     ; 257   assert_param(IS_ITC_INTERRUPTS_DISABLED);
 700                     ; 261   Mask = (uint8_t)(~(uint8_t)(0x03U << ((IRQn % 4U) * 2U)));
 702  0002 9e            	ld	a,xh
 703  0003 a403          	and	a,#3
 704  0005 48            	sll	a
 705  0006 5f            	clrw	x
 706  0007 97            	ld	xl,a
 707  0008 a603          	ld	a,#3
 708  000a 5d            	tnzw	x
 709  000b 2704          	jreq	L43
 710  000d               L63:
 711  000d 48            	sll	a
 712  000e 5a            	decw	x
 713  000f 26fc          	jrne	L63
 714  0011               L43:
 715  0011 43            	cpl	a
 716  0012 6b01          	ld	(OFST-1,sp),a
 717                     ; 263   NewPriority = (uint8_t)((uint8_t)(ITC_PriorityLevel) << ((IRQn % 4U) * 2U));
 719  0014 7b03          	ld	a,(OFST+1,sp)
 720  0016 a403          	and	a,#3
 721  0018 48            	sll	a
 722  0019 5f            	clrw	x
 723  001a 97            	ld	xl,a
 724  001b 7b04          	ld	a,(OFST+2,sp)
 725  001d 5d            	tnzw	x
 726  001e 2704          	jreq	L04
 727  0020               L24:
 728  0020 48            	sll	a
 729  0021 5a            	decw	x
 730  0022 26fc          	jrne	L24
 731  0024               L04:
 732  0024 6b02          	ld	(OFST+0,sp),a
 733                     ; 265   switch (IRQn)
 735  0026 7b03          	ld	a,(OFST+1,sp)
 737                     ; 369     default:
 737                     ; 370       break;
 738  0028 4a            	dec	a
 739  0029 a11d          	cp	a,#29
 740  002b 2504ac010101  	jruge	L572
 741  0031 8d000000      	callf	d_jctab
 743  0035               L64:
 744  0035 003e          	dc.w	L322-L64
 745  0037 003e          	dc.w	L322-L64
 746  0039 003e          	dc.w	L322-L64
 747  003b 0050          	dc.w	L522-L64
 748  003d 0050          	dc.w	L522-L64
 749  003f 0050          	dc.w	L522-L64
 750  0041 0050          	dc.w	L522-L64
 751  0043 0062          	dc.w	L722-L64
 752  0045 0062          	dc.w	L722-L64
 753  0047 0062          	dc.w	L722-L64
 754  0049 0062          	dc.w	L722-L64
 755  004b 0074          	dc.w	L132-L64
 756  004d 0074          	dc.w	L132-L64
 757  004f 0074          	dc.w	L132-L64
 758  0051 0074          	dc.w	L132-L64
 759  0053 0086          	dc.w	L332-L64
 760  0055 0086          	dc.w	L332-L64
 761  0057 0086          	dc.w	L332-L64
 762  0059 0086          	dc.w	L332-L64
 763  005b 0098          	dc.w	L532-L64
 764  005d 0098          	dc.w	L532-L64
 765  005f 0098          	dc.w	L532-L64
 766  0061 0098          	dc.w	L532-L64
 767  0063 00aa          	dc.w	L732-L64
 768  0065 00aa          	dc.w	L732-L64
 769  0067 00aa          	dc.w	L732-L64
 770  0069 00aa          	dc.w	L732-L64
 771  006b 00bc          	dc.w	L142-L64
 772  006d 00bc          	dc.w	L142-L64
 773  006f ac010101      	jra	L572
 774  0073               L322:
 775                     ; 267     case FLASH_IRQn:
 775                     ; 268     case DMA1_CHANNEL0_1_IRQn:
 775                     ; 269     case DMA1_CHANNEL2_3_IRQn:
 775                     ; 270       ITC->ISPR1 &= Mask;
 777  0073 c67f70        	ld	a,32624
 778  0076 1401          	and	a,(OFST-1,sp)
 779  0078 c77f70        	ld	32624,a
 780                     ; 271       ITC->ISPR1 |= NewPriority;
 782  007b c67f70        	ld	a,32624
 783  007e 1a02          	or	a,(OFST+0,sp)
 784  0080 c77f70        	ld	32624,a
 785                     ; 272       break;
 787  0083 207c          	jra	L572
 788  0085               L522:
 789                     ; 274     case EXTIE_F_PVD_IRQn:
 789                     ; 275 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 789                     ; 276     case RTC_IRQn:
 789                     ; 277     case EXTIB_IRQn:
 789                     ; 278     case EXTID_IRQn:
 789                     ; 279 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 789                     ; 280     case RTC_CSSLSE_IRQn:
 789                     ; 281     case EXTIB_IRQn:
 789                     ; 282     case EXTID_IRQn:
 789                     ; 283 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 789                     ; 284     case RTC_CSSLSE_IRQn:
 789                     ; 285     case EXTIB_G_IRQn:
 789                     ; 286     case EXTID_H_IRQn:
 789                     ; 287 #endif  /* STM8L15X_MD */
 789                     ; 288       ITC->ISPR2 &= Mask;
 791  0085 c67f71        	ld	a,32625
 792  0088 1401          	and	a,(OFST-1,sp)
 793  008a c77f71        	ld	32625,a
 794                     ; 289       ITC->ISPR2 |= NewPriority;
 796  008d c67f71        	ld	a,32625
 797  0090 1a02          	or	a,(OFST+0,sp)
 798  0092 c77f71        	ld	32625,a
 799                     ; 290       break;
 801  0095 206a          	jra	L572
 802  0097               L722:
 803                     ; 292     case EXTI0_IRQn:
 803                     ; 293     case EXTI1_IRQn:
 803                     ; 294     case EXTI2_IRQn:
 803                     ; 295     case EXTI3_IRQn:
 803                     ; 296       ITC->ISPR3 &= Mask;
 805  0097 c67f72        	ld	a,32626
 806  009a 1401          	and	a,(OFST-1,sp)
 807  009c c77f72        	ld	32626,a
 808                     ; 297       ITC->ISPR3 |= NewPriority;
 810  009f c67f72        	ld	a,32626
 811  00a2 1a02          	or	a,(OFST+0,sp)
 812  00a4 c77f72        	ld	32626,a
 813                     ; 298       break;
 815  00a7 2058          	jra	L572
 816  00a9               L132:
 817                     ; 300     case EXTI4_IRQn:
 817                     ; 301     case EXTI5_IRQn:
 817                     ; 302     case EXTI6_IRQn:
 817                     ; 303     case EXTI7_IRQn:
 817                     ; 304       ITC->ISPR4 &= Mask;
 819  00a9 c67f73        	ld	a,32627
 820  00ac 1401          	and	a,(OFST-1,sp)
 821  00ae c77f73        	ld	32627,a
 822                     ; 305       ITC->ISPR4 |= NewPriority;
 824  00b1 c67f73        	ld	a,32627
 825  00b4 1a02          	or	a,(OFST+0,sp)
 826  00b6 c77f73        	ld	32627,a
 827                     ; 306       break;
 829  00b9 2046          	jra	L572
 830  00bb               L332:
 831                     ; 308     case SWITCH_CSS_BREAK_DAC_IRQn:
 831                     ; 309 #else
 831                     ; 310     case SWITCH_CSS_IRQn:
 831                     ; 311 #endif /*	STM8L15X_LD	*/
 831                     ; 312     case ADC1_COMP_IRQn:
 831                     ; 313 #if defined (STM8L15X_MD) || defined (STM8L05X_MD_VL) || defined (STM8AL31_L_MD)
 831                     ; 314     case LCD_IRQn:
 831                     ; 315     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 831                     ; 316 #elif defined (STM8L15X_LD) || defined (STM8L05X_LD_VL)
 831                     ; 317     case TIM2_UPD_OVF_TRG_BRK_IRQn:
 831                     ; 318 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 831                     ; 319     case LCD_AES_IRQn:
 831                     ; 320     case TIM2_UPD_OVF_TRG_BRK_USART2_TX_IRQn:
 831                     ; 321 #endif  /* STM8L15X_MD */
 831                     ; 322       ITC->ISPR5 &= Mask;
 833  00bb c67f74        	ld	a,32628
 834  00be 1401          	and	a,(OFST-1,sp)
 835  00c0 c77f74        	ld	32628,a
 836                     ; 323       ITC->ISPR5 |= NewPriority;
 838  00c3 c67f74        	ld	a,32628
 839  00c6 1a02          	or	a,(OFST+0,sp)
 840  00c8 c77f74        	ld	32628,a
 841                     ; 324       break;
 843  00cb 2034          	jra	L572
 844  00cd               L532:
 845                     ; 326     case TIM1_UPD_OVF_TRG_IRQn:
 845                     ; 327 #endif  /* STM8L15X_LD */
 845                     ; 328 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 845                     ; 329  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 845                     ; 330     case TIM2_CC_IRQn:
 845                     ; 331     case TIM3_UPD_OVF_TRG_BRK_IRQn :
 845                     ; 332     case TIM3_CC_IRQn:
 845                     ; 333 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 845                     ; 334     case TIM2_CC_USART2_RX_IRQn:
 845                     ; 335     case TIM3_UPD_OVF_TRG_BRK_USART3_TX_IRQn :
 845                     ; 336     case TIM3_CC_USART3_RX_IRQn:
 845                     ; 337 #endif  /* STM8L15X_MD */
 845                     ; 338       ITC->ISPR6 &= Mask;
 847  00cd c67f75        	ld	a,32629
 848  00d0 1401          	and	a,(OFST-1,sp)
 849  00d2 c77f75        	ld	32629,a
 850                     ; 339       ITC->ISPR6 |= NewPriority;
 852  00d5 c67f75        	ld	a,32629
 853  00d8 1a02          	or	a,(OFST+0,sp)
 854  00da c77f75        	ld	32629,a
 855                     ; 340       break;
 857  00dd 2022          	jra	L572
 858  00df               L732:
 859                     ; 343     case TIM1_CC_IRQn:
 859                     ; 344 #endif  /* STM8L15X_LD */
 859                     ; 345     case TIM4_UPD_OVF_TRG_IRQn:
 859                     ; 346     case SPI1_IRQn:
 859                     ; 347 #if defined (STM8L15X_MD) || defined (STM8L15X_LD) || defined (STM8L05X_MD_VL) ||\
 859                     ; 348  defined (STM8AL31_L_MD) || defined (STM8L05X_LD_VL)
 859                     ; 349     case USART1_TX_IRQn:
 859                     ; 350 #elif defined (STM8L15X_HD) || defined (STM8L15X_MDP) || defined (STM8L05X_HD_VL)
 859                     ; 351     case USART1_TX_TIM5_UPD_OVF_TRG_BRK_IRQn:
 859                     ; 352 #endif  /* STM8L15X_MD */
 859                     ; 353       ITC->ISPR7 &= Mask;
 861  00df c67f76        	ld	a,32630
 862  00e2 1401          	and	a,(OFST-1,sp)
 863  00e4 c77f76        	ld	32630,a
 864                     ; 354       ITC->ISPR7 |= NewPriority;
 866  00e7 c67f76        	ld	a,32630
 867  00ea 1a02          	or	a,(OFST+0,sp)
 868  00ec c77f76        	ld	32630,a
 869                     ; 355       break;
 871  00ef 2010          	jra	L572
 872  00f1               L142:
 873                     ; 362     case USART1_RX_TIM5_CC_IRQn:
 873                     ; 363     case I2C1_SPI2_IRQn:
 873                     ; 364 #endif  /* STM8L15X_MD */
 873                     ; 365       ITC->ISPR8 &= Mask;
 875  00f1 c67f77        	ld	a,32631
 876  00f4 1401          	and	a,(OFST-1,sp)
 877  00f6 c77f77        	ld	32631,a
 878                     ; 366       ITC->ISPR8 |= NewPriority;
 880  00f9 c67f77        	ld	a,32631
 881  00fc 1a02          	or	a,(OFST+0,sp)
 882  00fe c77f77        	ld	32631,a
 883                     ; 367       break;
 885                     ; 369     default:
 885                     ; 370       break;
 887  0101               L572:
 888                     ; 372 }
 891  0101 5b04          	addw	sp,#4
 892  0103 87            	retf	
 904                     	xdef	f_ITC_GetSoftwarePriority
 905                     	xdef	f_ITC_SetSoftwarePriority
 906                     	xdef	f_ITC_GetSoftIntStatus
 907                     	xdef	f_ITC_GetCPUCC
 908                     	xdef	f_ITC_DeInit
 909                     	xref.b	c_x
 928                     	xref	d_jctab
 929                     	end
