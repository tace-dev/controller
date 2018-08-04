   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 92 void WFE_DeInit(void)
  50                     ; 93 {
  51                     .text:	section	.text,new
  52  0000               f_WFE_DeInit:
  56                     ; 94   WFE->CR1 = WFE_CRX_RESET_VALUE;
  58  0000 725f50a6      	clr	20646
  59                     ; 95   WFE->CR2 = WFE_CRX_RESET_VALUE;
  61  0004 725f50a7      	clr	20647
  62                     ; 96   WFE->CR3 = WFE_CRX_RESET_VALUE;
  64  0008 725f50a8      	clr	20648
  65                     ; 97   WFE->CR4 = WFE_CRX_RESET_VALUE;
  67  000c 725f50a9      	clr	20649
  68                     ; 98 }
  71  0010 87            	retf	
 392                     ; 138 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 392                     ; 139 {
 393                     .text:	section	.text,new
 394  0000               f_WFE_WakeUpSourceEventCmd:
 396  0000 89            	pushw	x
 397  0001 88            	push	a
 398       00000001      OFST:	set	1
 401                     ; 140   uint8_t register_index = 0;
 403                     ; 142   assert_param(IS_WFE_SOURCE(WFE_Source));
 405                     ; 143   assert_param(IS_FUNCTIONAL_STATE(NewState));
 407                     ; 146   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
 409  0002 9e            	ld	a,xh
 410  0003 6b01          	ld	(OFST+0,sp),a
 411                     ; 148   if (NewState != DISABLE)
 413  0005 0d07          	tnz	(OFST+6,sp)
 414  0007 2730          	jreq	L302
 415                     ; 150     switch (register_index)
 418                     ; 168       default:
 418                     ; 169         break;
 419  0009 4a            	dec	a
 420  000a 270b          	jreq	L12
 421  000c 4a            	dec	a
 422  000d 270f          	jreq	L32
 423  000f 4a            	dec	a
 424  0010 2716          	jreq	L52
 425  0012 4a            	dec	a
 426  0013 271d          	jreq	L72
 427  0015 2039          	jra	L112
 428  0017               L12:
 429                     ; 152       case 1:
 429                     ; 153         WFE->CR1 |= (uint8_t)WFE_Source;
 431  0017 c650a6        	ld	a,20646
 432  001a 1a03          	or	a,(OFST+2,sp)
 433                     ; 154         break;
 435  001c 202f          	jpf	LC001
 436  001e               L32:
 437                     ; 156       case 2:
 437                     ; 157         WFE->CR2 |= (uint8_t)WFE_Source;
 439  001e c650a7        	ld	a,20647
 440  0021 1a03          	or	a,(OFST+2,sp)
 441  0023 c750a7        	ld	20647,a
 442                     ; 158         break;
 444  0026 2028          	jra	L112
 445  0028               L52:
 446                     ; 160       case 3:
 446                     ; 161         WFE->CR3 |= (uint8_t)WFE_Source;
 448  0028 c650a8        	ld	a,20648
 449  002b 1a03          	or	a,(OFST+2,sp)
 450  002d c750a8        	ld	20648,a
 451                     ; 162         break;
 453  0030 201e          	jra	L112
 454  0032               L72:
 455                     ; 164       case 4:
 455                     ; 165         WFE->CR4 |= (uint8_t)WFE_Source;
 457  0032 c650a9        	ld	a,20649
 458  0035 1a03          	or	a,(OFST+2,sp)
 459                     ; 166         break;
 461  0037 2036          	jpf	LC002
 462                     ; 168       default:
 462                     ; 169         break;
 465  0039               L302:
 466                     ; 174     switch (register_index)
 469                     ; 192       default:
 469                     ; 193         break;
 470  0039 4a            	dec	a
 471  003a 270b          	jreq	L33
 472  003c 4a            	dec	a
 473  003d 2714          	jreq	L53
 474  003f 4a            	dec	a
 475  0040 271c          	jreq	L73
 476  0042 4a            	dec	a
 477  0043 2724          	jreq	L14
 478  0045 2009          	jra	L112
 479  0047               L33:
 480                     ; 176       case 1:
 480                     ; 177         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 482  0047 7b03          	ld	a,(OFST+2,sp)
 483  0049 43            	cpl	a
 484  004a c450a6        	and	a,20646
 485  004d               LC001:
 486  004d c750a6        	ld	20646,a
 487                     ; 178         break;
 488  0050               L112:
 489                     ; 196 }
 492  0050 5b03          	addw	sp,#3
 493  0052 87            	retf	
 494  0053               L53:
 495                     ; 180       case 2:
 495                     ; 181         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
 497  0053 7b03          	ld	a,(OFST+2,sp)
 498  0055 43            	cpl	a
 499  0056 c450a7        	and	a,20647
 500  0059 c750a7        	ld	20647,a
 501                     ; 182         break;
 503  005c 20f2          	jra	L112
 504  005e               L73:
 505                     ; 184       case 3:
 505                     ; 185         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
 507  005e 7b03          	ld	a,(OFST+2,sp)
 508  0060 43            	cpl	a
 509  0061 c450a8        	and	a,20648
 510  0064 c750a8        	ld	20648,a
 511                     ; 186         break;
 513  0067 20e7          	jra	L112
 514  0069               L14:
 515                     ; 188       case 4:
 515                     ; 189         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
 517  0069 7b03          	ld	a,(OFST+2,sp)
 518  006b 43            	cpl	a
 519  006c c450a9        	and	a,20649
 520  006f               LC002:
 521  006f c750a9        	ld	20649,a
 522                     ; 190         break;
 524  0072 20dc          	jra	L112
 525                     ; 192       default:
 525                     ; 193         break;
 572                     ; 234 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 572                     ; 235 {
 573                     .text:	section	.text,new
 574  0000               f_WFE_GetWakeUpSourceEventStatus:
 576  0000 89            	pushw	x
 577  0001 88            	push	a
 578       00000001      OFST:	set	1
 581                     ; 236   FunctionalState status = DISABLE;
 583  0002 0f01          	clr	(OFST+0,sp)
 584                     ; 238   assert_param(IS_WFE_SOURCE(WFE_Source));
 586                     ; 240   switch (WFE_Source)
 589                     ; 323     default:
 589                     ; 324       break;
 590  0004 1d0101        	subw	x,#257
 591  0007 2604ac9d009d  	jreq	L712
 592  000d 5a            	decw	x
 593  000e 27f9          	jreq	L712
 594  0010 1d0002        	subw	x,#2
 595  0013 27f4          	jreq	L712
 596  0015 1d0004        	subw	x,#4
 597  0018 27ef          	jreq	L712
 598  001a 1d0008        	subw	x,#8
 599  001d 277e          	jreq	L712
 600  001f 1d0010        	subw	x,#16
 601  0022 2779          	jreq	L712
 602  0024 1d0020        	subw	x,#32
 603  0027 2774          	jreq	L712
 604  0029 1d0040        	subw	x,#64
 605  002c 276f          	jreq	L712
 606  002e 1d0081        	subw	x,#129
 607  0031 276f          	jreq	L122
 608  0033 5a            	decw	x
 609  0034 276c          	jreq	L122
 610  0036 1d0002        	subw	x,#2
 611  0039 2767          	jreq	L122
 612  003b 1d0004        	subw	x,#4
 613  003e 2762          	jreq	L122
 614  0040 1d0008        	subw	x,#8
 615  0043 275d          	jreq	L122
 616  0045 1d0010        	subw	x,#16
 617  0048 2758          	jreq	L122
 618  004a 1d0020        	subw	x,#32
 619  004d 2753          	jreq	L122
 620  004f 1d0040        	subw	x,#64
 621  0052 274e          	jreq	L122
 622  0054 1d0081        	subw	x,#129
 623  0057 274e          	jreq	L322
 624  0059 5a            	decw	x
 625  005a 274b          	jreq	L322
 626  005c 1d0002        	subw	x,#2
 627  005f 2746          	jreq	L322
 628  0061 1d0004        	subw	x,#4
 629  0064 2741          	jreq	L322
 630  0066 1d0008        	subw	x,#8
 631  0069 273c          	jreq	L322
 632  006b 1d0010        	subw	x,#16
 633  006e 2737          	jreq	L322
 634  0070 1d0020        	subw	x,#32
 635  0073 2732          	jreq	L322
 636  0075 1d0040        	subw	x,#64
 637  0078 272d          	jreq	L322
 638  007a 1d0081        	subw	x,#129
 639  007d 2735          	jreq	L522
 640  007f 5a            	decw	x
 641  0080 2732          	jreq	L522
 642  0082 1d0002        	subw	x,#2
 643  0085 272d          	jreq	L522
 644  0087 1d0004        	subw	x,#4
 645  008a 2728          	jreq	L522
 646  008c 1d0008        	subw	x,#8
 647  008f 2723          	jreq	L522
 648  0091 1d0010        	subw	x,#16
 649  0094 271e          	jreq	L522
 650  0096 1d0020        	subw	x,#32
 651  0099 2719          	jreq	L522
 652  009b 2020          	jra	L552
 653  009d               L712:
 654                     ; 242     case WFE_Source_TIM2_EV0:
 654                     ; 243     case WFE_Source_TIM2_EV1:
 654                     ; 244     case WFE_Source_TIM1_EV0:
 654                     ; 245     case WFE_Source_TIM1_EV1:
 654                     ; 246     case WFE_Source_EXTI_EV0:
 654                     ; 247     case WFE_Source_EXTI_EV1:
 654                     ; 248     case WFE_Source_EXTI_EV2:
 654                     ; 249     case WFE_Source_EXTI_EV3:
 654                     ; 250 
 654                     ; 251       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 656  009d c650a6        	ld	a,20646
 657                     ; 254         status = ENABLE;
 659  00a0 2008          	jpf	LC005
 660                     ; 259         status = DISABLE;
 661  00a2               L122:
 662                     ; 263     case WFE_Source_EXTI_EV4:
 662                     ; 264     case WFE_Source_EXTI_EV5:
 662                     ; 265     case WFE_Source_EXTI_EV6:
 662                     ; 266     case WFE_Source_EXTI_EV7:
 662                     ; 267     case WFE_Source_EXTI_EVB_G:
 662                     ; 268     case WFE_Source_EXTI_EVD_H:
 662                     ; 269     case WFE_Source_EXTI_EVE_F:
 662                     ; 270     case WFE_Source_ADC1_COMP_EV:
 662                     ; 271 
 662                     ; 272       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 664  00a2 c650a7        	ld	a,20647
 665                     ; 275         status = ENABLE;
 667  00a5 2003          	jpf	LC005
 668                     ; 280         status = DISABLE;
 669  00a7               L322:
 670                     ; 283     case WFE_Source_TIM3_EV0:
 670                     ; 284     case WFE_Source_TIM3_EV1:
 670                     ; 285     case WFE_Source_TIM4_EV:
 670                     ; 286     case WFE_Source_SPI1_EV:
 670                     ; 287     case WFE_Source_I2C1_EV:
 670                     ; 288     case WFE_Source_USART1_EV:
 670                     ; 289     case WFE_Source_DMA1CH01_EV:
 670                     ; 290     case WFE_Source_DMA1CH23_EV:
 670                     ; 291 
 670                     ; 292       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 672  00a7 c650a8        	ld	a,20648
 673  00aa               LC005:
 674  00aa 1503          	bcp	a,(OFST+2,sp)
 675  00ac 270d          	jreq	L372
 676                     ; 295         status = ENABLE;
 678  00ae               LC004:
 682  00ae a601          	ld	a,#1
 683  00b0 6b01          	ld	(OFST+0,sp),a
 685  00b2 2009          	jra	L552
 686                     ; 300         status = DISABLE;
 687  00b4               L522:
 688                     ; 304     case WFE_Source_TIM5_EV0:
 688                     ; 305     case WFE_Source_TIM5_EV1:
 688                     ; 306     case WFE_Source_AES_EV:
 688                     ; 307     case WFE_Source_SPI2_EV:
 688                     ; 308     case WFE_Source_USART2_EV:
 688                     ; 309     case WFE_Source_USART3_EV:
 688                     ; 310     case WFE_Source_RTC_CSS_EV:
 688                     ; 311 
 688                     ; 312       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 690  00b4 c650a9        	ld	a,20649
 691  00b7 1503          	bcp	a,(OFST+2,sp)
 692                     ; 315         status = ENABLE;
 694  00b9 26f3          	jrne	LC004
 695  00bb               L372:
 696                     ; 320         status = DISABLE;
 701  00bb 0f01          	clr	(OFST+0,sp)
 702                     ; 323     default:
 702                     ; 324       break;
 704  00bd               L552:
 705                     ; 326   return status;
 707  00bd 7b01          	ld	a,(OFST+0,sp)
 710  00bf 5b03          	addw	sp,#3
 711  00c1 87            	retf	
 723                     	xdef	f_WFE_GetWakeUpSourceEventStatus
 724                     	xdef	f_WFE_WakeUpSourceEventCmd
 725                     	xdef	f_WFE_DeInit
 744                     	end
