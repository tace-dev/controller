   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 92 void WFE_DeInit(void)
  50                     ; 93 {
  52                     .text:	section	.text,new
  53  0000               _WFE_DeInit:
  57                     ; 94   WFE->CR1 = WFE_CRX_RESET_VALUE;
  59  0000 725f50a6      	clr	20646
  60                     ; 95   WFE->CR2 = WFE_CRX_RESET_VALUE;
  62  0004 725f50a7      	clr	20647
  63                     ; 96   WFE->CR3 = WFE_CRX_RESET_VALUE;
  65  0008 725f50a8      	clr	20648
  66                     ; 97   WFE->CR4 = WFE_CRX_RESET_VALUE;
  68  000c 725f50a9      	clr	20649
  69                     ; 98 }
  72  0010 81            	ret	
 394                     ; 138 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 394                     ; 139 {
 395                     .text:	section	.text,new
 396  0000               _WFE_WakeUpSourceEventCmd:
 398  0000 89            	pushw	x
 399  0001 88            	push	a
 400       00000001      OFST:	set	1
 403                     ; 140   uint8_t register_index = 0;
 405                     ; 142   assert_param(IS_WFE_SOURCE(WFE_Source));
 407                     ; 143   assert_param(IS_FUNCTIONAL_STATE(NewState));
 409                     ; 146   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
 411  0002 9e            	ld	a,xh
 412  0003 6b01          	ld	(OFST+0,sp),a
 413                     ; 148   if (NewState != DISABLE)
 415  0005 0d06          	tnz	(OFST+5,sp)
 416  0007 2730          	jreq	L302
 417                     ; 150     switch (register_index)
 420                     ; 168       default:
 420                     ; 169         break;
 421  0009 4a            	dec	a
 422  000a 270b          	jreq	L12
 423  000c 4a            	dec	a
 424  000d 270f          	jreq	L32
 425  000f 4a            	dec	a
 426  0010 2716          	jreq	L52
 427  0012 4a            	dec	a
 428  0013 271d          	jreq	L72
 429  0015 2039          	jra	L112
 430  0017               L12:
 431                     ; 152       case 1:
 431                     ; 153         WFE->CR1 |= (uint8_t)WFE_Source;
 433  0017 c650a6        	ld	a,20646
 434  001a 1a03          	or	a,(OFST+2,sp)
 435                     ; 154         break;
 437  001c 202f          	jp	LC001
 438  001e               L32:
 439                     ; 156       case 2:
 439                     ; 157         WFE->CR2 |= (uint8_t)WFE_Source;
 441  001e c650a7        	ld	a,20647
 442  0021 1a03          	or	a,(OFST+2,sp)
 443  0023 c750a7        	ld	20647,a
 444                     ; 158         break;
 446  0026 2028          	jra	L112
 447  0028               L52:
 448                     ; 160       case 3:
 448                     ; 161         WFE->CR3 |= (uint8_t)WFE_Source;
 450  0028 c650a8        	ld	a,20648
 451  002b 1a03          	or	a,(OFST+2,sp)
 452  002d c750a8        	ld	20648,a
 453                     ; 162         break;
 455  0030 201e          	jra	L112
 456  0032               L72:
 457                     ; 164       case 4:
 457                     ; 165         WFE->CR4 |= (uint8_t)WFE_Source;
 459  0032 c650a9        	ld	a,20649
 460  0035 1a03          	or	a,(OFST+2,sp)
 461                     ; 166         break;
 463  0037 2036          	jp	LC002
 464                     ; 168       default:
 464                     ; 169         break;
 467  0039               L302:
 468                     ; 174     switch (register_index)
 471                     ; 192       default:
 471                     ; 193         break;
 472  0039 4a            	dec	a
 473  003a 270b          	jreq	L33
 474  003c 4a            	dec	a
 475  003d 2714          	jreq	L53
 476  003f 4a            	dec	a
 477  0040 271c          	jreq	L73
 478  0042 4a            	dec	a
 479  0043 2724          	jreq	L14
 480  0045 2009          	jra	L112
 481  0047               L33:
 482                     ; 176       case 1:
 482                     ; 177         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 484  0047 7b03          	ld	a,(OFST+2,sp)
 485  0049 43            	cpl	a
 486  004a c450a6        	and	a,20646
 487  004d               LC001:
 488  004d c750a6        	ld	20646,a
 489                     ; 178         break;
 490  0050               L112:
 491                     ; 196 }
 494  0050 5b03          	addw	sp,#3
 495  0052 81            	ret	
 496  0053               L53:
 497                     ; 180       case 2:
 497                     ; 181         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
 499  0053 7b03          	ld	a,(OFST+2,sp)
 500  0055 43            	cpl	a
 501  0056 c450a7        	and	a,20647
 502  0059 c750a7        	ld	20647,a
 503                     ; 182         break;
 505  005c 20f2          	jra	L112
 506  005e               L73:
 507                     ; 184       case 3:
 507                     ; 185         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
 509  005e 7b03          	ld	a,(OFST+2,sp)
 510  0060 43            	cpl	a
 511  0061 c450a8        	and	a,20648
 512  0064 c750a8        	ld	20648,a
 513                     ; 186         break;
 515  0067 20e7          	jra	L112
 516  0069               L14:
 517                     ; 188       case 4:
 517                     ; 189         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
 519  0069 7b03          	ld	a,(OFST+2,sp)
 520  006b 43            	cpl	a
 521  006c c450a9        	and	a,20649
 522  006f               LC002:
 523  006f c750a9        	ld	20649,a
 524                     ; 190         break;
 526  0072 20dc          	jra	L112
 527                     ; 192       default:
 527                     ; 193         break;
 575                     ; 234 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 575                     ; 235 {
 576                     .text:	section	.text,new
 577  0000               _WFE_GetWakeUpSourceEventStatus:
 579  0000 89            	pushw	x
 580  0001 88            	push	a
 581       00000001      OFST:	set	1
 584                     ; 236   FunctionalState status = DISABLE;
 586  0002 0f01          	clr	(OFST+0,sp)
 587                     ; 238   assert_param(IS_WFE_SOURCE(WFE_Source));
 589                     ; 240   switch (WFE_Source)
 592                     ; 323     default:
 592                     ; 324       break;
 593  0004 1d0101        	subw	x,#257
 594  0007 2603cc009c    	jreq	L712
 595  000c 5a            	decw	x
 596  000d 27fa          	jreq	L712
 597  000f 1d0002        	subw	x,#2
 598  0012 27f5          	jreq	L712
 599  0014 1d0004        	subw	x,#4
 600  0017 27f0          	jreq	L712
 601  0019 1d0008        	subw	x,#8
 602  001c 277e          	jreq	L712
 603  001e 1d0010        	subw	x,#16
 604  0021 2779          	jreq	L712
 605  0023 1d0020        	subw	x,#32
 606  0026 2774          	jreq	L712
 607  0028 1d0040        	subw	x,#64
 608  002b 276f          	jreq	L712
 609  002d 1d0081        	subw	x,#129
 610  0030 276f          	jreq	L122
 611  0032 5a            	decw	x
 612  0033 276c          	jreq	L122
 613  0035 1d0002        	subw	x,#2
 614  0038 2767          	jreq	L122
 615  003a 1d0004        	subw	x,#4
 616  003d 2762          	jreq	L122
 617  003f 1d0008        	subw	x,#8
 618  0042 275d          	jreq	L122
 619  0044 1d0010        	subw	x,#16
 620  0047 2758          	jreq	L122
 621  0049 1d0020        	subw	x,#32
 622  004c 2753          	jreq	L122
 623  004e 1d0040        	subw	x,#64
 624  0051 274e          	jreq	L122
 625  0053 1d0081        	subw	x,#129
 626  0056 274e          	jreq	L322
 627  0058 5a            	decw	x
 628  0059 274b          	jreq	L322
 629  005b 1d0002        	subw	x,#2
 630  005e 2746          	jreq	L322
 631  0060 1d0004        	subw	x,#4
 632  0063 2741          	jreq	L322
 633  0065 1d0008        	subw	x,#8
 634  0068 273c          	jreq	L322
 635  006a 1d0010        	subw	x,#16
 636  006d 2737          	jreq	L322
 637  006f 1d0020        	subw	x,#32
 638  0072 2732          	jreq	L322
 639  0074 1d0040        	subw	x,#64
 640  0077 272d          	jreq	L322
 641  0079 1d0081        	subw	x,#129
 642  007c 2735          	jreq	L522
 643  007e 5a            	decw	x
 644  007f 2732          	jreq	L522
 645  0081 1d0002        	subw	x,#2
 646  0084 272d          	jreq	L522
 647  0086 1d0004        	subw	x,#4
 648  0089 2728          	jreq	L522
 649  008b 1d0008        	subw	x,#8
 650  008e 2723          	jreq	L522
 651  0090 1d0010        	subw	x,#16
 652  0093 271e          	jreq	L522
 653  0095 1d0020        	subw	x,#32
 654  0098 2719          	jreq	L522
 655  009a 2020          	jra	L552
 656  009c               L712:
 657                     ; 242     case WFE_Source_TIM2_EV0:
 657                     ; 243     case WFE_Source_TIM2_EV1:
 657                     ; 244     case WFE_Source_TIM1_EV0:
 657                     ; 245     case WFE_Source_TIM1_EV1:
 657                     ; 246     case WFE_Source_EXTI_EV0:
 657                     ; 247     case WFE_Source_EXTI_EV1:
 657                     ; 248     case WFE_Source_EXTI_EV2:
 657                     ; 249     case WFE_Source_EXTI_EV3:
 657                     ; 250 
 657                     ; 251       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 659  009c c650a6        	ld	a,20646
 660                     ; 254         status = ENABLE;
 662  009f 2008          	jp	LC005
 663                     ; 259         status = DISABLE;
 664  00a1               L122:
 665                     ; 263     case WFE_Source_EXTI_EV4:
 665                     ; 264     case WFE_Source_EXTI_EV5:
 665                     ; 265     case WFE_Source_EXTI_EV6:
 665                     ; 266     case WFE_Source_EXTI_EV7:
 665                     ; 267     case WFE_Source_EXTI_EVB_G:
 665                     ; 268     case WFE_Source_EXTI_EVD_H:
 665                     ; 269     case WFE_Source_EXTI_EVE_F:
 665                     ; 270     case WFE_Source_ADC1_COMP_EV:
 665                     ; 271 
 665                     ; 272       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 667  00a1 c650a7        	ld	a,20647
 668                     ; 275         status = ENABLE;
 670  00a4 2003          	jp	LC005
 671                     ; 280         status = DISABLE;
 672  00a6               L322:
 673                     ; 283     case WFE_Source_TIM3_EV0:
 673                     ; 284     case WFE_Source_TIM3_EV1:
 673                     ; 285     case WFE_Source_TIM4_EV:
 673                     ; 286     case WFE_Source_SPI1_EV:
 673                     ; 287     case WFE_Source_I2C1_EV:
 673                     ; 288     case WFE_Source_USART1_EV:
 673                     ; 289     case WFE_Source_DMA1CH01_EV:
 673                     ; 290     case WFE_Source_DMA1CH23_EV:
 673                     ; 291 
 673                     ; 292       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 675  00a6 c650a8        	ld	a,20648
 676  00a9               LC005:
 677  00a9 1503          	bcp	a,(OFST+2,sp)
 678  00ab 270d          	jreq	L372
 679                     ; 295         status = ENABLE;
 681  00ad               LC004:
 685  00ad a601          	ld	a,#1
 686  00af 6b01          	ld	(OFST+0,sp),a
 688  00b1 2009          	jra	L552
 689                     ; 300         status = DISABLE;
 690  00b3               L522:
 691                     ; 304     case WFE_Source_TIM5_EV0:
 691                     ; 305     case WFE_Source_TIM5_EV1:
 691                     ; 306     case WFE_Source_AES_EV:
 691                     ; 307     case WFE_Source_SPI2_EV:
 691                     ; 308     case WFE_Source_USART2_EV:
 691                     ; 309     case WFE_Source_USART3_EV:
 691                     ; 310     case WFE_Source_RTC_CSS_EV:
 691                     ; 311 
 691                     ; 312       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 693  00b3 c650a9        	ld	a,20649
 694  00b6 1503          	bcp	a,(OFST+2,sp)
 695                     ; 315         status = ENABLE;
 697  00b8 26f3          	jrne	LC004
 698  00ba               L372:
 699                     ; 320         status = DISABLE;
 704  00ba 0f01          	clr	(OFST+0,sp)
 705                     ; 323     default:
 705                     ; 324       break;
 707  00bc               L552:
 708                     ; 326   return status;
 710  00bc 7b01          	ld	a,(OFST+0,sp)
 713  00be 5b03          	addw	sp,#3
 714  00c0 81            	ret	
 727                     	xdef	_WFE_GetWakeUpSourceEventStatus
 728                     	xdef	_WFE_WakeUpSourceEventCmd
 729                     	xdef	_WFE_DeInit
 748                     	end
