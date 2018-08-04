   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  49                     ; 92 void WFE_DeInit(void)
  49                     ; 93 {
  51                     	switch	.text
  52  0000               _WFE_DeInit:
  56                     ; 94   WFE->CR1 = WFE_CRX_RESET_VALUE;
  58  0000 725f50a6      	clr	20646
  59                     ; 95   WFE->CR2 = WFE_CRX_RESET_VALUE;
  61  0004 725f50a7      	clr	20647
  62                     ; 96   WFE->CR3 = WFE_CRX_RESET_VALUE;
  64  0008 725f50a8      	clr	20648
  65                     ; 97   WFE->CR4 = WFE_CRX_RESET_VALUE;
  67  000c 725f50a9      	clr	20649
  68                     ; 98 }
  71  0010 81            	ret	
 393                     ; 138 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 393                     ; 139 {
 394                     	switch	.text
 395  0011               _WFE_WakeUpSourceEventCmd:
 397  0011 89            	pushw	x
 398  0012 88            	push	a
 399       00000001      OFST:	set	1
 402                     ; 140   uint8_t register_index = 0;
 404                     ; 142   assert_param(IS_WFE_SOURCE(WFE_Source));
 406                     ; 143   assert_param(IS_FUNCTIONAL_STATE(NewState));
 408                     ; 146   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
 410  0013 9e            	ld	a,xh
 411  0014 6b01          	ld	(OFST+0,sp),a
 412                     ; 148   if (NewState != DISABLE)
 414  0016 0d06          	tnz	(OFST+5,sp)
 415  0018 2730          	jreq	L302
 416                     ; 150     switch (register_index)
 419                     ; 168       default:
 419                     ; 169         break;
 420  001a 4a            	dec	a
 421  001b 270b          	jreq	L12
 422  001d 4a            	dec	a
 423  001e 270f          	jreq	L32
 424  0020 4a            	dec	a
 425  0021 2716          	jreq	L52
 426  0023 4a            	dec	a
 427  0024 271d          	jreq	L72
 428  0026 2039          	jra	L112
 429  0028               L12:
 430                     ; 152       case 1:
 430                     ; 153         WFE->CR1 |= (uint8_t)WFE_Source;
 432  0028 c650a6        	ld	a,20646
 433  002b 1a03          	or	a,(OFST+2,sp)
 434                     ; 154         break;
 436  002d 202f          	jp	LC001
 437  002f               L32:
 438                     ; 156       case 2:
 438                     ; 157         WFE->CR2 |= (uint8_t)WFE_Source;
 440  002f c650a7        	ld	a,20647
 441  0032 1a03          	or	a,(OFST+2,sp)
 442  0034 c750a7        	ld	20647,a
 443                     ; 158         break;
 445  0037 2028          	jra	L112
 446  0039               L52:
 447                     ; 160       case 3:
 447                     ; 161         WFE->CR3 |= (uint8_t)WFE_Source;
 449  0039 c650a8        	ld	a,20648
 450  003c 1a03          	or	a,(OFST+2,sp)
 451  003e c750a8        	ld	20648,a
 452                     ; 162         break;
 454  0041 201e          	jra	L112
 455  0043               L72:
 456                     ; 164       case 4:
 456                     ; 165         WFE->CR4 |= (uint8_t)WFE_Source;
 458  0043 c650a9        	ld	a,20649
 459  0046 1a03          	or	a,(OFST+2,sp)
 460                     ; 166         break;
 462  0048 2036          	jp	LC002
 463                     ; 168       default:
 463                     ; 169         break;
 466  004a               L302:
 467                     ; 174     switch (register_index)
 470                     ; 192       default:
 470                     ; 193         break;
 471  004a 4a            	dec	a
 472  004b 270b          	jreq	L33
 473  004d 4a            	dec	a
 474  004e 2714          	jreq	L53
 475  0050 4a            	dec	a
 476  0051 271c          	jreq	L73
 477  0053 4a            	dec	a
 478  0054 2724          	jreq	L14
 479  0056 2009          	jra	L112
 480  0058               L33:
 481                     ; 176       case 1:
 481                     ; 177         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 483  0058 7b03          	ld	a,(OFST+2,sp)
 484  005a 43            	cpl	a
 485  005b c450a6        	and	a,20646
 486  005e               LC001:
 487  005e c750a6        	ld	20646,a
 488                     ; 178         break;
 489  0061               L112:
 490                     ; 196 }
 493  0061 5b03          	addw	sp,#3
 494  0063 81            	ret	
 495  0064               L53:
 496                     ; 180       case 2:
 496                     ; 181         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
 498  0064 7b03          	ld	a,(OFST+2,sp)
 499  0066 43            	cpl	a
 500  0067 c450a7        	and	a,20647
 501  006a c750a7        	ld	20647,a
 502                     ; 182         break;
 504  006d 20f2          	jra	L112
 505  006f               L73:
 506                     ; 184       case 3:
 506                     ; 185         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
 508  006f 7b03          	ld	a,(OFST+2,sp)
 509  0071 43            	cpl	a
 510  0072 c450a8        	and	a,20648
 511  0075 c750a8        	ld	20648,a
 512                     ; 186         break;
 514  0078 20e7          	jra	L112
 515  007a               L14:
 516                     ; 188       case 4:
 516                     ; 189         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
 518  007a 7b03          	ld	a,(OFST+2,sp)
 519  007c 43            	cpl	a
 520  007d c450a9        	and	a,20649
 521  0080               LC002:
 522  0080 c750a9        	ld	20649,a
 523                     ; 190         break;
 525  0083 20dc          	jra	L112
 526                     ; 192       default:
 526                     ; 193         break;
 574                     ; 234 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 574                     ; 235 {
 575                     	switch	.text
 576  0085               _WFE_GetWakeUpSourceEventStatus:
 578  0085 89            	pushw	x
 579  0086 88            	push	a
 580       00000001      OFST:	set	1
 583                     ; 236   FunctionalState status = DISABLE;
 585  0087 0f01          	clr	(OFST+0,sp)
 586                     ; 238   assert_param(IS_WFE_SOURCE(WFE_Source));
 588                     ; 240   switch (WFE_Source)
 591                     ; 323     default:
 591                     ; 324       break;
 592  0089 1d0101        	subw	x,#257
 593  008c 2603cc0121    	jreq	L712
 594  0091 5a            	decw	x
 595  0092 27fa          	jreq	L712
 596  0094 1d0002        	subw	x,#2
 597  0097 27f5          	jreq	L712
 598  0099 1d0004        	subw	x,#4
 599  009c 27f0          	jreq	L712
 600  009e 1d0008        	subw	x,#8
 601  00a1 277e          	jreq	L712
 602  00a3 1d0010        	subw	x,#16
 603  00a6 2779          	jreq	L712
 604  00a8 1d0020        	subw	x,#32
 605  00ab 2774          	jreq	L712
 606  00ad 1d0040        	subw	x,#64
 607  00b0 276f          	jreq	L712
 608  00b2 1d0081        	subw	x,#129
 609  00b5 276f          	jreq	L122
 610  00b7 5a            	decw	x
 611  00b8 276c          	jreq	L122
 612  00ba 1d0002        	subw	x,#2
 613  00bd 2767          	jreq	L122
 614  00bf 1d0004        	subw	x,#4
 615  00c2 2762          	jreq	L122
 616  00c4 1d0008        	subw	x,#8
 617  00c7 275d          	jreq	L122
 618  00c9 1d0010        	subw	x,#16
 619  00cc 2758          	jreq	L122
 620  00ce 1d0020        	subw	x,#32
 621  00d1 2753          	jreq	L122
 622  00d3 1d0040        	subw	x,#64
 623  00d6 274e          	jreq	L122
 624  00d8 1d0081        	subw	x,#129
 625  00db 274e          	jreq	L322
 626  00dd 5a            	decw	x
 627  00de 274b          	jreq	L322
 628  00e0 1d0002        	subw	x,#2
 629  00e3 2746          	jreq	L322
 630  00e5 1d0004        	subw	x,#4
 631  00e8 2741          	jreq	L322
 632  00ea 1d0008        	subw	x,#8
 633  00ed 273c          	jreq	L322
 634  00ef 1d0010        	subw	x,#16
 635  00f2 2737          	jreq	L322
 636  00f4 1d0020        	subw	x,#32
 637  00f7 2732          	jreq	L322
 638  00f9 1d0040        	subw	x,#64
 639  00fc 272d          	jreq	L322
 640  00fe 1d0081        	subw	x,#129
 641  0101 2735          	jreq	L522
 642  0103 5a            	decw	x
 643  0104 2732          	jreq	L522
 644  0106 1d0002        	subw	x,#2
 645  0109 272d          	jreq	L522
 646  010b 1d0004        	subw	x,#4
 647  010e 2728          	jreq	L522
 648  0110 1d0008        	subw	x,#8
 649  0113 2723          	jreq	L522
 650  0115 1d0010        	subw	x,#16
 651  0118 271e          	jreq	L522
 652  011a 1d0020        	subw	x,#32
 653  011d 2719          	jreq	L522
 654  011f 2020          	jra	L552
 655  0121               L712:
 656                     ; 242     case WFE_Source_TIM2_EV0:
 656                     ; 243     case WFE_Source_TIM2_EV1:
 656                     ; 244     case WFE_Source_TIM1_EV0:
 656                     ; 245     case WFE_Source_TIM1_EV1:
 656                     ; 246     case WFE_Source_EXTI_EV0:
 656                     ; 247     case WFE_Source_EXTI_EV1:
 656                     ; 248     case WFE_Source_EXTI_EV2:
 656                     ; 249     case WFE_Source_EXTI_EV3:
 656                     ; 250 
 656                     ; 251       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 658  0121 c650a6        	ld	a,20646
 659                     ; 254         status = ENABLE;
 661  0124 2008          	jp	LC005
 662                     ; 259         status = DISABLE;
 663  0126               L122:
 664                     ; 263     case WFE_Source_EXTI_EV4:
 664                     ; 264     case WFE_Source_EXTI_EV5:
 664                     ; 265     case WFE_Source_EXTI_EV6:
 664                     ; 266     case WFE_Source_EXTI_EV7:
 664                     ; 267     case WFE_Source_EXTI_EVB_G:
 664                     ; 268     case WFE_Source_EXTI_EVD_H:
 664                     ; 269     case WFE_Source_EXTI_EVE_F:
 664                     ; 270     case WFE_Source_ADC1_COMP_EV:
 664                     ; 271 
 664                     ; 272       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 666  0126 c650a7        	ld	a,20647
 667                     ; 275         status = ENABLE;
 669  0129 2003          	jp	LC005
 670                     ; 280         status = DISABLE;
 671  012b               L322:
 672                     ; 283     case WFE_Source_TIM3_EV0:
 672                     ; 284     case WFE_Source_TIM3_EV1:
 672                     ; 285     case WFE_Source_TIM4_EV:
 672                     ; 286     case WFE_Source_SPI1_EV:
 672                     ; 287     case WFE_Source_I2C1_EV:
 672                     ; 288     case WFE_Source_USART1_EV:
 672                     ; 289     case WFE_Source_DMA1CH01_EV:
 672                     ; 290     case WFE_Source_DMA1CH23_EV:
 672                     ; 291 
 672                     ; 292       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 674  012b c650a8        	ld	a,20648
 675  012e               LC005:
 676  012e 1503          	bcp	a,(OFST+2,sp)
 677  0130 270d          	jreq	L372
 678                     ; 295         status = ENABLE;
 680  0132               LC004:
 684  0132 a601          	ld	a,#1
 685  0134 6b01          	ld	(OFST+0,sp),a
 687  0136 2009          	jra	L552
 688                     ; 300         status = DISABLE;
 689  0138               L522:
 690                     ; 304     case WFE_Source_TIM5_EV0:
 690                     ; 305     case WFE_Source_TIM5_EV1:
 690                     ; 306     case WFE_Source_AES_EV:
 690                     ; 307     case WFE_Source_SPI2_EV:
 690                     ; 308     case WFE_Source_USART2_EV:
 690                     ; 309     case WFE_Source_USART3_EV:
 690                     ; 310     case WFE_Source_RTC_CSS_EV:
 690                     ; 311 
 690                     ; 312       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 692  0138 c650a9        	ld	a,20649
 693  013b 1503          	bcp	a,(OFST+2,sp)
 694                     ; 315         status = ENABLE;
 696  013d 26f3          	jrne	LC004
 697  013f               L372:
 698                     ; 320         status = DISABLE;
 703  013f 0f01          	clr	(OFST+0,sp)
 704                     ; 323     default:
 704                     ; 324       break;
 706  0141               L552:
 707                     ; 326   return status;
 709  0141 7b01          	ld	a,(OFST+0,sp)
 712  0143 5b03          	addw	sp,#3
 713  0145 81            	ret	
 726                     	xdef	_WFE_GetWakeUpSourceEventStatus
 727                     	xdef	_WFE_WakeUpSourceEventCmd
 728                     	xdef	_WFE_DeInit
 747                     	end
