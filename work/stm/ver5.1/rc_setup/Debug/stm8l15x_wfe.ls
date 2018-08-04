   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  47                     ; 92 void WFE_DeInit(void)
  47                     ; 93 {
  49                     .text:	section	.text,new
  50  0000               _WFE_DeInit:
  54                     ; 94   WFE->CR1 = WFE_CRX_RESET_VALUE;
  56  0000 725f50a6      	clr	20646
  57                     ; 95   WFE->CR2 = WFE_CRX_RESET_VALUE;
  59  0004 725f50a7      	clr	20647
  60                     ; 96   WFE->CR3 = WFE_CRX_RESET_VALUE;
  62  0008 725f50a8      	clr	20648
  63                     ; 97   WFE->CR4 = WFE_CRX_RESET_VALUE;
  65  000c 725f50a9      	clr	20649
  66                     ; 98 }
  69  0010 81            	ret
 391                     ; 138 void WFE_WakeUpSourceEventCmd(WFE_Source_TypeDef WFE_Source, FunctionalState NewState)
 391                     ; 139 {
 392                     .text:	section	.text,new
 393  0000               _WFE_WakeUpSourceEventCmd:
 395  0000 89            	pushw	x
 396  0001 88            	push	a
 397       00000001      OFST:	set	1
 400                     ; 140   uint8_t register_index = 0;
 402                     ; 142   assert_param(IS_WFE_SOURCE(WFE_Source));
 404                     ; 143   assert_param(IS_FUNCTIONAL_STATE(NewState));
 406                     ; 146   register_index = (uint8_t)((uint16_t)WFE_Source >> 0x08);
 408  0002 9e            	ld	a,xh
 409  0003 6b01          	ld	(OFST+0,sp),a
 410                     ; 148   if (NewState != DISABLE)
 412  0005 0d06          	tnz	(OFST+5,sp)
 413  0007 273c          	jreq	L302
 414                     ; 150     switch (register_index)
 416  0009 7b01          	ld	a,(OFST+0,sp)
 418                     ; 168       default:
 418                     ; 169         break;
 419  000b 4a            	dec	a
 420  000c 270b          	jreq	L12
 421  000e 4a            	dec	a
 422  000f 2712          	jreq	L32
 423  0011 4a            	dec	a
 424  0012 2719          	jreq	L52
 425  0014 4a            	dec	a
 426  0015 2720          	jreq	L72
 427  0017 2045          	jra	L112
 428  0019               L12:
 429                     ; 152       case 1:
 429                     ; 153         WFE->CR1 |= (uint8_t)WFE_Source;
 431  0019 c650a6        	ld	a,20646
 432  001c 1a03          	or	a,(OFST+2,sp)
 433  001e c750a6        	ld	20646,a
 434                     ; 154         break;
 436  0021 203b          	jra	L112
 437  0023               L32:
 438                     ; 156       case 2:
 438                     ; 157         WFE->CR2 |= (uint8_t)WFE_Source;
 440  0023 c650a7        	ld	a,20647
 441  0026 1a03          	or	a,(OFST+2,sp)
 442  0028 c750a7        	ld	20647,a
 443                     ; 158         break;
 445  002b 2031          	jra	L112
 446  002d               L52:
 447                     ; 160       case 3:
 447                     ; 161         WFE->CR3 |= (uint8_t)WFE_Source;
 449  002d c650a8        	ld	a,20648
 450  0030 1a03          	or	a,(OFST+2,sp)
 451  0032 c750a8        	ld	20648,a
 452                     ; 162         break;
 454  0035 2027          	jra	L112
 455  0037               L72:
 456                     ; 164       case 4:
 456                     ; 165         WFE->CR4 |= (uint8_t)WFE_Source;
 458  0037 c650a9        	ld	a,20649
 459  003a 1a03          	or	a,(OFST+2,sp)
 460  003c c750a9        	ld	20649,a
 461                     ; 166         break;
 463  003f 201d          	jra	L112
 464  0041               L13:
 465                     ; 168       default:
 465                     ; 169         break;
 467  0041 201b          	jra	L112
 468  0043               L702:
 470  0043 2019          	jra	L112
 471  0045               L302:
 472                     ; 174     switch (register_index)
 474  0045 7b01          	ld	a,(OFST+0,sp)
 476                     ; 192       default:
 476                     ; 193         break;
 477  0047 4a            	dec	a
 478  0048 270b          	jreq	L33
 479  004a 4a            	dec	a
 480  004b 2714          	jreq	L53
 481  004d 4a            	dec	a
 482  004e 271c          	jreq	L73
 483  0050 4a            	dec	a
 484  0051 2724          	jreq	L14
 485  0053 2009          	jra	L112
 486  0055               L33:
 487                     ; 176       case 1:
 487                     ; 177         WFE->CR1 &= (uint8_t)(~(uint8_t)WFE_Source);
 489  0055 7b03          	ld	a,(OFST+2,sp)
 490  0057 43            	cpl	a
 491  0058 c450a6        	and	a,20646
 492  005b c750a6        	ld	20646,a
 493                     ; 178         break;
 494  005e               L112:
 495                     ; 196 }
 498  005e 5b03          	addw	sp,#3
 499  0060 81            	ret
 500  0061               L53:
 501                     ; 180       case 2:
 501                     ; 181         WFE->CR2 &= (uint8_t)(~ (uint8_t)WFE_Source);
 503  0061 7b03          	ld	a,(OFST+2,sp)
 504  0063 43            	cpl	a
 505  0064 c450a7        	and	a,20647
 506  0067 c750a7        	ld	20647,a
 507                     ; 182         break;
 509  006a 20f2          	jra	L112
 510  006c               L73:
 511                     ; 184       case 3:
 511                     ; 185         WFE->CR3 &= (uint8_t)(~(uint8_t)WFE_Source);
 513  006c 7b03          	ld	a,(OFST+2,sp)
 514  006e 43            	cpl	a
 515  006f c450a8        	and	a,20648
 516  0072 c750a8        	ld	20648,a
 517                     ; 186         break;
 519  0075 20e7          	jra	L112
 520  0077               L14:
 521                     ; 188       case 4:
 521                     ; 189         WFE->CR4 &= (uint8_t)(~(uint8_t)WFE_Source);
 523  0077 7b03          	ld	a,(OFST+2,sp)
 524  0079 43            	cpl	a
 525  007a c450a9        	and	a,20649
 526  007d c750a9        	ld	20649,a
 527                     ; 190         break;
 529  0080 20dc          	jra	L112
 530  0082               L34:
 531                     ; 192       default:
 531                     ; 193         break;
 533  0082 20da          	jra	L112
 534  0084               L512:
 535  0084 20d8          	jra	L112
 582                     ; 234 FunctionalState WFE_GetWakeUpSourceEventStatus(WFE_Source_TypeDef WFE_Source)
 582                     ; 235 {
 583                     .text:	section	.text,new
 584  0000               _WFE_GetWakeUpSourceEventStatus:
 586  0000 89            	pushw	x
 587  0001 88            	push	a
 588       00000001      OFST:	set	1
 591                     ; 236   FunctionalState status = DISABLE;
 593  0002 0f01          	clr	(OFST+0,sp)
 594                     ; 238   assert_param(IS_WFE_SOURCE(WFE_Source));
 596                     ; 240   switch (WFE_Source)
 599                     ; 323     default:
 599                     ; 324       break;
 600  0004 1d0101        	subw	x,#257
 601  0007 2603          	jrne	L21
 602  0009 cc00a7        	jp	L712
 603  000c               L21:
 604  000c 5a            	decw	x
 605  000d 2603          	jrne	L41
 606  000f cc00a7        	jp	L712
 607  0012               L41:
 608  0012 1d0002        	subw	x,#2
 609  0015 2603          	jrne	L61
 610  0017 cc00a7        	jp	L712
 611  001a               L61:
 612  001a 1d0004        	subw	x,#4
 613  001d 2603          	jrne	L02
 614  001f cc00a7        	jp	L712
 615  0022               L02:
 616  0022 1d0008        	subw	x,#8
 617  0025 2602          	jrne	L22
 618  0027 207e          	jp	L712
 619  0029               L22:
 620  0029 1d0010        	subw	x,#16
 621  002c 2779          	jreq	L712
 622  002e 1d0020        	subw	x,#32
 623  0031 2774          	jreq	L712
 624  0033 1d0040        	subw	x,#64
 625  0036 276f          	jreq	L712
 626  0038 1d0081        	subw	x,#129
 627  003b 277b          	jreq	L122
 628  003d 5a            	decw	x
 629  003e 2778          	jreq	L122
 630  0040 1d0002        	subw	x,#2
 631  0043 2773          	jreq	L122
 632  0045 1d0004        	subw	x,#4
 633  0048 276e          	jreq	L122
 634  004a 1d0008        	subw	x,#8
 635  004d 2769          	jreq	L122
 636  004f 1d0010        	subw	x,#16
 637  0052 2764          	jreq	L122
 638  0054 1d0020        	subw	x,#32
 639  0057 275f          	jreq	L122
 640  0059 1d0040        	subw	x,#64
 641  005c 275a          	jreq	L122
 642  005e 1d0081        	subw	x,#129
 643  0061 2766          	jreq	L322
 644  0063 5a            	decw	x
 645  0064 2763          	jreq	L322
 646  0066 1d0002        	subw	x,#2
 647  0069 275e          	jreq	L322
 648  006b 1d0004        	subw	x,#4
 649  006e 2759          	jreq	L322
 650  0070 1d0008        	subw	x,#8
 651  0073 2754          	jreq	L322
 652  0075 1d0010        	subw	x,#16
 653  0078 274f          	jreq	L322
 654  007a 1d0020        	subw	x,#32
 655  007d 274a          	jreq	L322
 656  007f 1d0040        	subw	x,#64
 657  0082 2745          	jreq	L322
 658  0084 1d0081        	subw	x,#129
 659  0087 2751          	jreq	L522
 660  0089 5a            	decw	x
 661  008a 274e          	jreq	L522
 662  008c 1d0002        	subw	x,#2
 663  008f 2749          	jreq	L522
 664  0091 1d0004        	subw	x,#4
 665  0094 2744          	jreq	L522
 666  0096 1d0008        	subw	x,#8
 667  0099 273f          	jreq	L522
 668  009b 1d0010        	subw	x,#16
 669  009e 273a          	jreq	L522
 670  00a0 1d0020        	subw	x,#32
 671  00a3 2735          	jreq	L522
 672  00a5 2042          	jra	L552
 673  00a7               L712:
 674                     ; 242     case WFE_Source_TIM2_EV0:
 674                     ; 243     case WFE_Source_TIM2_EV1:
 674                     ; 244     case WFE_Source_TIM1_EV0:
 674                     ; 245     case WFE_Source_TIM1_EV1:
 674                     ; 246     case WFE_Source_EXTI_EV0:
 674                     ; 247     case WFE_Source_EXTI_EV1:
 674                     ; 248     case WFE_Source_EXTI_EV2:
 674                     ; 249     case WFE_Source_EXTI_EV3:
 674                     ; 250 
 674                     ; 251       if ((WFE->CR1 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 676  00a7 c650a6        	ld	a,20646
 677  00aa 1503          	bcp	a,(OFST+2,sp)
 678  00ac 2706          	jreq	L752
 679                     ; 254         status = ENABLE;
 681  00ae a601          	ld	a,#1
 682  00b0 6b01          	ld	(OFST+0,sp),a
 684  00b2 2035          	jra	L552
 685  00b4               L752:
 686                     ; 259         status = DISABLE;
 688  00b4 0f01          	clr	(OFST+0,sp)
 689  00b6 2031          	jra	L552
 690  00b8               L122:
 691                     ; 263     case WFE_Source_EXTI_EV4:
 691                     ; 264     case WFE_Source_EXTI_EV5:
 691                     ; 265     case WFE_Source_EXTI_EV6:
 691                     ; 266     case WFE_Source_EXTI_EV7:
 691                     ; 267     case WFE_Source_EXTI_EVB_G:
 691                     ; 268     case WFE_Source_EXTI_EVD_H:
 691                     ; 269     case WFE_Source_EXTI_EVE_F:
 691                     ; 270     case WFE_Source_ADC1_COMP_EV:
 691                     ; 271 
 691                     ; 272       if ((WFE->CR2 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 693  00b8 c650a7        	ld	a,20647
 694  00bb 1503          	bcp	a,(OFST+2,sp)
 695  00bd 2706          	jreq	L362
 696                     ; 275         status = ENABLE;
 698  00bf a601          	ld	a,#1
 699  00c1 6b01          	ld	(OFST+0,sp),a
 701  00c3 2024          	jra	L552
 702  00c5               L362:
 703                     ; 280         status = DISABLE;
 705  00c5 0f01          	clr	(OFST+0,sp)
 706  00c7 2020          	jra	L552
 707  00c9               L322:
 708                     ; 283     case WFE_Source_TIM3_EV0:
 708                     ; 284     case WFE_Source_TIM3_EV1:
 708                     ; 285     case WFE_Source_TIM4_EV:
 708                     ; 286     case WFE_Source_SPI1_EV:
 708                     ; 287     case WFE_Source_I2C1_EV:
 708                     ; 288     case WFE_Source_USART1_EV:
 708                     ; 289     case WFE_Source_DMA1CH01_EV:
 708                     ; 290     case WFE_Source_DMA1CH23_EV:
 708                     ; 291 
 708                     ; 292       if ((WFE->CR3 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 710  00c9 c650a8        	ld	a,20648
 711  00cc 1503          	bcp	a,(OFST+2,sp)
 712  00ce 2706          	jreq	L762
 713                     ; 295         status = ENABLE;
 715  00d0 a601          	ld	a,#1
 716  00d2 6b01          	ld	(OFST+0,sp),a
 718  00d4 2013          	jra	L552
 719  00d6               L762:
 720                     ; 300         status = DISABLE;
 722  00d6 0f01          	clr	(OFST+0,sp)
 723  00d8 200f          	jra	L552
 724  00da               L522:
 725                     ; 304     case WFE_Source_TIM5_EV0:
 725                     ; 305     case WFE_Source_TIM5_EV1:
 725                     ; 306     case WFE_Source_AES_EV:
 725                     ; 307     case WFE_Source_SPI2_EV:
 725                     ; 308     case WFE_Source_USART2_EV:
 725                     ; 309     case WFE_Source_USART3_EV:
 725                     ; 310     case WFE_Source_RTC_CSS_EV:
 725                     ; 311 
 725                     ; 312       if ((WFE->CR4 & (uint8_t)WFE_Source) != (uint8_t)0x00)
 727  00da c650a9        	ld	a,20649
 728  00dd 1503          	bcp	a,(OFST+2,sp)
 729  00df 2706          	jreq	L372
 730                     ; 315         status = ENABLE;
 732  00e1 a601          	ld	a,#1
 733  00e3 6b01          	ld	(OFST+0,sp),a
 735  00e5 2002          	jra	L552
 736  00e7               L372:
 737                     ; 320         status = DISABLE;
 739  00e7 0f01          	clr	(OFST+0,sp)
 740  00e9               L722:
 741                     ; 323     default:
 741                     ; 324       break;
 743  00e9               L552:
 744                     ; 326   return status;
 746  00e9 7b01          	ld	a,(OFST+0,sp)
 749  00eb 5b03          	addw	sp,#3
 750  00ed 81            	ret
 763                     	xdef	_WFE_GetWakeUpSourceEventStatus
 764                     	xdef	_WFE_WakeUpSourceEventCmd
 765                     	xdef	_WFE_DeInit
 784                     	end
