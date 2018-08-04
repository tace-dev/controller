   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  99                     ; 229 ErrorStatus RTC_DeInit(void)
  99                     ; 230 {
 100                     .text:	section	.text,new
 101  0000               f_RTC_DeInit:
 103  0000 5205          	subw	sp,#5
 104       00000005      OFST:	set	5
 107                     ; 231   ErrorStatus status = ERROR;
 109                     ; 232   uint16_t wutwfcount = 0;
 111  0002 5f            	clrw	x
 112  0003 1f02          	ldw	(OFST-3,sp),x
 113                     ; 233   uint16_t recalpfcount = 0;
 115  0005 1f04          	ldw	(OFST-1,sp),x
 116                     ; 236   RTC->WPR = 0xCA;
 118  0007 35ca5159      	mov	20825,#202
 119                     ; 237   RTC->WPR = 0x53;
 121  000b 35535159      	mov	20825,#83
 122                     ; 240   if (RTC_EnterInitMode() == ERROR)
 124  000f 8d000000      	callf	f_RTC_EnterInitMode
 126  0013 4d            	tnz	a
 127  0014 260b          	jrne	L74
 128                     ; 242     status = ERROR;
 130  0016               LC002:
 132  0016 6b01          	ld	(OFST-4,sp),a
 133                     ; 244     RTC->WPR = 0xFF; 
 136  0018               L15:
 139  0018 35ff5159      	mov	20825,#255
 140                     ; 340   return (ErrorStatus)status;
 142  001c 7b01          	ld	a,(OFST-4,sp)
 145  001e 5b05          	addw	sp,#5
 146  0020 87            	retf	
 147  0021               L74:
 148                     ; 249     RTC->TR1 = RTC_TR1_RESET_VALUE;
 150  0021 725f5140      	clr	20800
 151                     ; 250     RTC->TR2 = RTC_TR2_RESET_VALUE;
 153  0025 725f5141      	clr	20801
 154                     ; 251     RTC->TR3 = RTC_TR3_RESET_VALUE;
 156  0029 725f5142      	clr	20802
 157                     ; 254     RTC->DR1 = RTC_DR1_RESET_VALUE;
 159  002d 35015144      	mov	20804,#1
 160                     ; 255     RTC->DR2 = RTC_DR2_RESET_VALUE;
 162  0031 35215145      	mov	20805,#33
 163                     ; 256     RTC->DR3 = RTC_DR3_RESET_VALUE;
 165  0035 725f5146      	clr	20806
 166                     ; 259     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
 168  0039 725f5150      	clr	20816
 169                     ; 260     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
 171  003d 35ff5151      	mov	20817,#255
 172                     ; 261     RTC->APRER  = RTC_APRER_RESET_VALUE;
 174  0041 357f5152      	mov	20818,#127
 175                     ; 263     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
 177  0045 725f516c      	clr	20844
 178                     ; 264     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
 180  0049 725f516d      	clr	20845
 181                     ; 268     RTC->CR1 = RTC_CR1_RESET_VALUE;
 183  004d 725f5148      	clr	20808
 184                     ; 269     RTC->CR2 = RTC_CR2_RESET_VALUE;
 186  0051 725f5149      	clr	20809
 187                     ; 270     RTC->CR3 = RTC_CR3_RESET_VALUE;
 189  0055 725f514a      	clr	20810
 191  0059 2007          	jra	L75
 192  005b               L35:
 193                     ; 275       wutwfcount++;
 195  005b 5c            	incw	x
 196  005c 1f02          	ldw	(OFST-3,sp),x
 197                     ; 276       RTC->ISR1 = 0;
 199  005e 725f514c      	clr	20812
 200  0062               L75:
 201                     ; 273     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 203  0062 7204514c07    	btjt	20812,#2,L36
 205  0067 1e02          	ldw	x,(OFST-3,sp)
 206  0069 a3ffff        	cpw	x,#65535
 207  006c 26ed          	jrne	L35
 208  006e               L36:
 209                     ; 279     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 211  006e 7204514c02    	btjt	20812,#2,L56
 212                     ; 281       status = ERROR;
 213                     ; 283       RTC->WPR = 0xFF; 
 215  0073 2064          	jpf	L301
 216  0075               L56:
 217                     ; 288       RTC->CR1 = RTC_CR1_RESET_VALUE;
 219  0075 725f5148      	clr	20808
 220                     ; 291       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 222  0079 35ff5154      	mov	20820,#255
 223                     ; 292       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 225  007d 35ff5155      	mov	20821,#255
 226                     ; 295       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 228  0081 725f515c      	clr	20828
 229                     ; 296       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 231  0085 725f515d      	clr	20829
 232                     ; 297       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 234  0089 725f515e      	clr	20830
 235                     ; 298       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 237  008d 725f515f      	clr	20831
 238                     ; 300       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 240  0091 725f5164      	clr	20836
 241                     ; 301       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 243  0095 725f5165      	clr	20837
 244                     ; 302       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 246  0099 725f5166      	clr	20838
 247                     ; 305       RTC->ISR1 = (uint8_t)0x00;
 249  009d 725f514c      	clr	20812
 250                     ; 306       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 252  00a1 725f514d      	clr	20813
 253                     ; 308       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
 255  00a5 7203514c11    	btjf	20812,#1,L17
 257  00aa 2003          	jra	L57
 258  00ac               L37:
 259                     ; 312           recalpfcount++;
 261  00ac 5c            	incw	x
 262  00ad 1f04          	ldw	(OFST-1,sp),x
 263  00af               L57:
 264                     ; 310         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
 266  00af 7203514c07    	btjf	20812,#1,L17
 268  00b4 1e04          	ldw	x,(OFST-1,sp)
 269  00b6 a3ffff        	cpw	x,#65535
 270  00b9 26f1          	jrne	L37
 271  00bb               L17:
 272                     ; 315       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
 274  00bb 7202514c19    	btjt	20812,#1,L301
 275                     ; 317         RTC->CALRH = RTC_CALRH_RESET_VALUE;
 277  00c0 725f516a      	clr	20842
 278                     ; 318         RTC->CALRL = RTC_CALRL_RESET_VALUE;
 280  00c4 725f516b      	clr	20843
 281                     ; 320         if (RTC_WaitForSynchro() == ERROR)
 283  00c8 8d000000      	callf	f_RTC_WaitForSynchro
 285  00cc 4d            	tnz	a
 286                     ; 322           status = ERROR;
 288  00cd 2604ac160016  	jreq	LC002
 289                     ; 326           status = SUCCESS;
 291  00d3 a601          	ld	a,#1
 292  00d5 ac160016      	jpf	LC002
 293  00d9               L301:
 294                     ; 331         status = ERROR;
 297  00d9 0f01          	clr	(OFST-4,sp)
 298                     ; 335       RTC->WPR = 0xFF; 
 299  00db ac180018      	jra	L15
 398                     ; 356 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 398                     ; 357 {
 399                     .text:	section	.text,new
 400  0000               f_RTC_Init:
 402  0000 89            	pushw	x
 403  0001 88            	push	a
 404       00000001      OFST:	set	1
 407                     ; 358   ErrorStatus status = ERROR;
 409                     ; 361   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 411                     ; 362   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 413                     ; 363   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 415                     ; 366   RTC->WPR = 0xCA;
 417  0002 35ca5159      	mov	20825,#202
 418                     ; 367   RTC->WPR = 0x53;
 420  0006 35535159      	mov	20825,#83
 421                     ; 370   if (RTC_EnterInitMode() == ERROR)
 423  000a 8d000000      	callf	f_RTC_EnterInitMode
 425  000e 4d            	tnz	a
 426                     ; 372     status = ERROR;
 429  000f 2727          	jreq	L561
 430                     ; 377     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 432  0011 721d5148      	bres	20808,#6
 433                     ; 380     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 435  0015 1e02          	ldw	x,(OFST+1,sp)
 436  0017 c65148        	ld	a,20808
 437  001a fa            	or	a,(x)
 438  001b c75148        	ld	20808,a
 439                     ; 383     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 441  001e ee02          	ldw	x,(2,x)
 442  0020 4f            	clr	a
 443  0021 01            	rrwa	x,a
 444  0022 9f            	ld	a,xl
 445  0023 c75150        	ld	20816,a
 446                     ; 384     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 448  0026 1e02          	ldw	x,(OFST+1,sp)
 449  0028 e603          	ld	a,(3,x)
 450  002a c75151        	ld	20817,a
 451                     ; 385     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 453  002d e601          	ld	a,(1,x)
 454  002f c75152        	ld	20818,a
 455                     ; 388     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 457  0032 721f514c      	bres	20812,#7
 458                     ; 390     status = SUCCESS;
 460  0036 a601          	ld	a,#1
 461  0038               L561:
 462                     ; 394   RTC->WPR = 0xFF; 
 464  0038 35ff5159      	mov	20825,#255
 465                     ; 397   return (ErrorStatus)(status);
 469  003c 5b03          	addw	sp,#3
 470  003e 87            	retf	
 506                     ; 407 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 506                     ; 408 {
 507                     .text:	section	.text,new
 508  0000               f_RTC_StructInit:
 512                     ; 410   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 514  0000 7f            	clr	(x)
 515                     ; 413   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 517  0001 a67f          	ld	a,#127
 518  0003 e701          	ld	(1,x),a
 519                     ; 416   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 521  0005 90ae00ff      	ldw	y,#255
 522  0009 ef02          	ldw	(2,x),y
 523                     ; 417 }
 526  000b 87            	retf	
 581                     ; 427 void RTC_WriteProtectionCmd(FunctionalState NewState)
 581                     ; 428 {
 582                     .text:	section	.text,new
 583  0000               f_RTC_WriteProtectionCmd:
 587                     ; 430   assert_param(IS_FUNCTIONAL_STATE(NewState));
 589                     ; 432   if (NewState != DISABLE)
 591  0000 4d            	tnz	a
 592  0001 2705          	jreq	L532
 593                     ; 435     RTC->WPR = RTC_WPR_EnableKey;
 595  0003 35ff5159      	mov	20825,#255
 598  0007 87            	retf	
 599  0008               L532:
 600                     ; 440     RTC->WPR = RTC_WPR_DisableKey1;
 602  0008 35ca5159      	mov	20825,#202
 603                     ; 441     RTC->WPR = RTC_WPR_DisableKey2;
 605  000c 35535159      	mov	20825,#83
 606                     ; 443 }
 609  0010 87            	retf	
 651                     ; 455 ErrorStatus RTC_EnterInitMode(void)
 651                     ; 456 {
 652                     .text:	section	.text,new
 653  0000               f_RTC_EnterInitMode:
 655  0000 5203          	subw	sp,#3
 656       00000003      OFST:	set	3
 659                     ; 457   ErrorStatus status = ERROR;
 661                     ; 458   uint16_t initfcount = 0;
 663  0002 5f            	clrw	x
 664  0003 1f02          	ldw	(OFST-1,sp),x
 665                     ; 461   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 667  0005 720c514c13    	btjt	20812,#6,L162
 668                     ; 464     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
 670  000a 3580514c      	mov	20812,#128
 672  000e 2003          	jra	L762
 673  0010               L362:
 674                     ; 469       initfcount++;
 676  0010 5c            	incw	x
 677  0011 1f02          	ldw	(OFST-1,sp),x
 678  0013               L762:
 679                     ; 467     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
 681  0013 720c514c05    	btjt	20812,#6,L162
 683  0018 a3ffff        	cpw	x,#65535
 684  001b 26f3          	jrne	L362
 685  001d               L162:
 686                     ; 473   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 688  001d 720c514c03    	btjt	20812,#6,L572
 689                     ; 475     status = ERROR;
 691  0022 4f            	clr	a
 693  0023 2002          	jra	L772
 694  0025               L572:
 695                     ; 479     status = SUCCESS;
 697  0025 a601          	ld	a,#1
 698  0027               L772:
 699                     ; 482   return (ErrorStatus)status;
 703  0027 5b03          	addw	sp,#3
 704  0029 87            	retf	
 726                     ; 495 void RTC_ExitInitMode(void)
 726                     ; 496 {
 727                     .text:	section	.text,new
 728  0000               f_RTC_ExitInitMode:
 732                     ; 498   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 734  0000 721f514c      	bres	20812,#7
 735                     ; 499 }
 738  0004 87            	retf	
 780                     ; 524 ErrorStatus RTC_WaitForSynchro(void)
 780                     ; 525 {
 781                     .text:	section	.text,new
 782  0000               f_RTC_WaitForSynchro:
 784  0000 5203          	subw	sp,#3
 785       00000003      OFST:	set	3
 788                     ; 526   uint16_t rsfcount = 0;
 790  0002 5f            	clrw	x
 791  0003 1f02          	ldw	(OFST-1,sp),x
 792                     ; 527   ErrorStatus status = ERROR;
 794                     ; 530   RTC->WPR = 0xCA;
 796  0005 35ca5159      	mov	20825,#202
 797                     ; 531   RTC->WPR = 0x53;
 799  0009 35535159      	mov	20825,#83
 800                     ; 534   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
 802  000d c6514c        	ld	a,20812
 803  0010 a45f          	and	a,#95
 804  0012 c7514c        	ld	20812,a
 806  0015 2003          	jra	L333
 807  0017               L133:
 808                     ; 539     rsfcount++;
 810  0017 5c            	incw	x
 811  0018 1f02          	ldw	(OFST-1,sp),x
 812  001a               L333:
 813                     ; 537   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
 815  001a 720a514c05    	btjt	20812,#5,L733
 817  001f a3ffff        	cpw	x,#65535
 818  0022 26f3          	jrne	L133
 819  0024               L733:
 820                     ; 543   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
 822  0024 720b514c06    	btjf	20812,#5,L143
 823                     ; 545     status = SUCCESS;
 825  0029 a601          	ld	a,#1
 826  002b 6b01          	ld	(OFST-2,sp),a
 828  002d 2002          	jra	L343
 829  002f               L143:
 830                     ; 549     status = ERROR;
 832  002f 0f01          	clr	(OFST-2,sp)
 833  0031               L343:
 834                     ; 553   RTC->WPR = 0xFF; 
 836  0031 35ff5159      	mov	20825,#255
 837                     ; 555   return (ErrorStatus)status;
 839  0035 7b01          	ld	a,(OFST-2,sp)
 842  0037 5b03          	addw	sp,#3
 843  0039 87            	retf	
 877                     ; 565 void RTC_RatioCmd(FunctionalState NewState)
 877                     ; 566 {
 878                     .text:	section	.text,new
 879  0000               f_RTC_RatioCmd:
 883                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
 885                     ; 571   RTC->WPR = 0xCA;
 887  0000 35ca5159      	mov	20825,#202
 888                     ; 572   RTC->WPR = 0x53;
 890  0004 35535159      	mov	20825,#83
 891                     ; 574   if (NewState != DISABLE)
 893  0008 4d            	tnz	a
 894  0009 2706          	jreq	L363
 895                     ; 577     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
 897  000b 721a5148      	bset	20808,#5
 899  000f 2004          	jra	L563
 900  0011               L363:
 901                     ; 582     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
 903  0011 721b5148      	bres	20808,#5
 904  0015               L563:
 905                     ; 586   RTC->WPR = 0xFF; 
 907  0015 35ff5159      	mov	20825,#255
 908                     ; 587 }
 911  0019 87            	retf	
 946                     ; 595 void RTC_BypassShadowCmd(FunctionalState NewState)
 946                     ; 596 {
 947                     .text:	section	.text,new
 948  0000               f_RTC_BypassShadowCmd:
 952                     ; 598   assert_param(IS_FUNCTIONAL_STATE(NewState));
 954                     ; 601   RTC->WPR = 0xCA;
 956  0000 35ca5159      	mov	20825,#202
 957                     ; 602   RTC->WPR = 0x53;
 959  0004 35535159      	mov	20825,#83
 960                     ; 604   if (NewState != DISABLE)
 962  0008 4d            	tnz	a
 963  0009 2706          	jreq	L504
 964                     ; 607     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
 966  000b 72185148      	bset	20808,#4
 968  000f 2004          	jra	L704
 969  0011               L504:
 970                     ; 612     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
 972  0011 72195148      	bres	20808,#4
 973  0015               L704:
 974                     ; 616   RTC->WPR = 0xFF; 
 976  0015 35ff5159      	mov	20825,#255
 977                     ; 617 }
 980  0019 87            	retf	
1125                     ; 656 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
1125                     ; 657                         RTC_TimeTypeDef* RTC_TimeStruct)
1125                     ; 658 {
1126                     .text:	section	.text,new
1127  0000               f_RTC_SetTime:
1129  0000 88            	push	a
1130  0001 88            	push	a
1131       00000001      OFST:	set	1
1134                     ; 659   ErrorStatus status = ERROR;
1136                     ; 660   uint8_t temp = 0;
1138                     ; 663   assert_param(IS_RTC_FORMAT(RTC_Format));
1140                     ; 665   if (RTC_Format == RTC_Format_BIN)
1142                     ; 668     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1143                     ; 670       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
1145                     ; 671       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
1148                     ; 675       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
1150                     ; 677     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
1152                     ; 678     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
1155                     ; 683     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1157                     ; 685       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1159                     ; 686       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1163  0002 c65148        	ld	a,20808
1164                     ; 690       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1166                     ; 692     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
1168                     ; 693     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
1170                     ; 698   RTC->WPR = 0xCA;
1172  0005 35ca5159      	mov	20825,#202
1173                     ; 699   RTC->WPR = 0x53;
1175  0009 35535159      	mov	20825,#83
1176                     ; 702   if (RTC_EnterInitMode() == ERROR)
1178  000d 8d000000      	callf	f_RTC_EnterInitMode
1180  0011 4d            	tnz	a
1181  0012 2606          	jrne	L515
1182                     ; 704     status = ERROR;
1184                     ; 706     RTC->WPR = 0xFF; 
1186  0014 35ff5159      	mov	20825,#255
1188  0018 205d          	jra	L715
1189  001a               L515:
1190                     ; 711     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1192  001a 720d514808    	btjf	20808,#6,L125
1193                     ; 713       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
1195                     ; 714       temp = RTC_TimeStruct->RTC_H12;
1197  001f 1e06          	ldw	x,(OFST+5,sp)
1198  0021 e603          	ld	a,(3,x)
1199  0023 6b01          	ld	(OFST+0,sp),a
1201  0025 2002          	jra	L325
1202  0027               L125:
1203                     ; 718       temp = 0;
1205  0027 0f01          	clr	(OFST+0,sp)
1206  0029               L325:
1207                     ; 721     if (RTC_Format != RTC_Format_BIN)
1209  0029 7b02          	ld	a,(OFST+1,sp)
1210  002b 270f          	jreq	L525
1211                     ; 723       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
1213  002d 1e06          	ldw	x,(OFST+5,sp)
1214  002f e602          	ld	a,(2,x)
1215  0031 c75140        	ld	20800,a
1216                     ; 724       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
1218  0034 e601          	ld	a,(1,x)
1219  0036 c75141        	ld	20801,a
1220                     ; 725       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
1222  0039 f6            	ld	a,(x)
1224  003a 201d          	jra	L725
1225  003c               L525:
1226                     ; 729       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
1228  003c 1e06          	ldw	x,(OFST+5,sp)
1229  003e e602          	ld	a,(2,x)
1230  0040 8d000000      	callf	L3f_ByteToBcd2
1232  0044 c75140        	ld	20800,a
1233                     ; 730       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
1235  0047 1e06          	ldw	x,(OFST+5,sp)
1236  0049 e601          	ld	a,(1,x)
1237  004b 8d000000      	callf	L3f_ByteToBcd2
1239  004f c75141        	ld	20801,a
1240                     ; 731       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
1242  0052 1e06          	ldw	x,(OFST+5,sp)
1243  0054 f6            	ld	a,(x)
1244  0055 8d000000      	callf	L3f_ByteToBcd2
1246  0059               L725:
1247  0059 1a01          	or	a,(OFST+0,sp)
1248  005b c75142        	ld	20802,a
1249                     ; 734     (void)(RTC->DR3);
1251  005e c65146        	ld	a,20806
1252                     ; 737     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1254  0061 721f514c      	bres	20812,#7
1255                     ; 740     RTC->WPR = 0xFF; 
1257  0065 35ff5159      	mov	20825,#255
1258                     ; 743     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1260  0069 7208514807    	btjt	20808,#4,L135
1261                     ; 745       if (RTC_WaitForSynchro() == ERROR)
1263  006e 8d000000      	callf	f_RTC_WaitForSynchro
1265  0072 4d            	tnz	a
1266                     ; 747         status = ERROR;
1269  0073 2702          	jreq	L715
1270                     ; 751         status = SUCCESS;
1271  0075               L135:
1272                     ; 756       status = SUCCESS;
1275  0075 a601          	ld	a,#1
1276  0077               L715:
1277                     ; 760   return (ErrorStatus)status;
1281  0077 85            	popw	x
1282  0078 87            	retf	
1318                     ; 772 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
1318                     ; 773 {
1319                     .text:	section	.text,new
1320  0000               f_RTC_TimeStructInit:
1324                     ; 775   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
1326  0000 6f03          	clr	(3,x)
1327                     ; 776   RTC_TimeStruct->RTC_Hours = 0;
1329  0002 7f            	clr	(x)
1330                     ; 777   RTC_TimeStruct->RTC_Minutes = 0;
1332  0003 6f01          	clr	(1,x)
1333                     ; 778   RTC_TimeStruct->RTC_Seconds = 0;
1335  0005 6f02          	clr	(2,x)
1336                     ; 779 }
1339  0007 87            	retf	
1393                     ; 795 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
1393                     ; 796                  RTC_TimeTypeDef* RTC_TimeStruct)
1393                     ; 797 {
1394                     .text:	section	.text,new
1395  0000               f_RTC_GetTime:
1397  0000 88            	push	a
1398  0001 88            	push	a
1399       00000001      OFST:	set	1
1402                     ; 798   uint8_t  tmpreg = 0;
1404                     ; 801   assert_param(IS_RTC_FORMAT(RTC_Format));
1406                     ; 805   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
1408  0002 1e06          	ldw	x,(OFST+5,sp)
1409  0004 c65140        	ld	a,20800
1410  0007 e702          	ld	(2,x),a
1411                     ; 808   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
1413  0009 c65141        	ld	a,20801
1414  000c e701          	ld	(1,x),a
1415                     ; 811   tmpreg = (uint8_t)RTC->TR3;
1417  000e c65142        	ld	a,20802
1418  0011 6b01          	ld	(OFST+0,sp),a
1419                     ; 814   (void) (RTC->DR3) ;
1421  0013 c65146        	ld	a,20806
1422                     ; 818   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
1424  0016 7b01          	ld	a,(OFST+0,sp)
1425  0018 a4bf          	and	a,#191
1426  001a f7            	ld	(x),a
1427                     ; 821   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
1429  001b 7b01          	ld	a,(OFST+0,sp)
1430  001d a440          	and	a,#64
1431  001f e703          	ld	(3,x),a
1432                     ; 824   if (RTC_Format == RTC_Format_BIN)
1434  0021 7b02          	ld	a,(OFST+1,sp)
1435  0023 261c          	jrne	L706
1436                     ; 827     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
1438  0025 f6            	ld	a,(x)
1439  0026 8d000000      	callf	L5f_Bcd2ToByte
1441  002a 1e06          	ldw	x,(OFST+5,sp)
1442  002c f7            	ld	(x),a
1443                     ; 828     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
1445  002d e601          	ld	a,(1,x)
1446  002f 8d000000      	callf	L5f_Bcd2ToByte
1448  0033 1e06          	ldw	x,(OFST+5,sp)
1449  0035 e701          	ld	(1,x),a
1450                     ; 829     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
1452  0037 e602          	ld	a,(2,x)
1453  0039 8d000000      	callf	L5f_Bcd2ToByte
1455  003d 1e06          	ldw	x,(OFST+5,sp)
1456  003f e702          	ld	(2,x),a
1457  0041               L706:
1458                     ; 831 }
1461  0041 85            	popw	x
1462  0042 87            	retf	
1507                     ; 842 uint16_t RTC_GetSubSecond(void)
1507                     ; 843 {
1508                     .text:	section	.text,new
1509  0000               f_RTC_GetSubSecond:
1511  0000 5206          	subw	sp,#6
1512       00000006      OFST:	set	6
1515                     ; 844   uint8_t ssrhreg = 0, ssrlreg = 0;
1519                     ; 845   uint16_t ssrreg = 0;
1521                     ; 848   ssrhreg = RTC->SSRH;
1523  0002 c65157        	ld	a,20823
1524  0005 6b03          	ld	(OFST-3,sp),a
1525                     ; 849   ssrlreg = RTC->SSRL;
1527  0007 c65158        	ld	a,20824
1528  000a 6b04          	ld	(OFST-2,sp),a
1529                     ; 852   (void) (RTC->DR3);
1531  000c c65146        	ld	a,20806
1532                     ; 855   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
1534  000f 7b04          	ld	a,(OFST-2,sp)
1535  0011 5f            	clrw	x
1536  0012 97            	ld	xl,a
1537  0013 1f01          	ldw	(OFST-5,sp),x
1538  0015 5f            	clrw	x
1539  0016 7b03          	ld	a,(OFST-3,sp)
1540  0018 97            	ld	xl,a
1541  0019 7b02          	ld	a,(OFST-4,sp)
1542  001b 01            	rrwa	x,a
1543  001c 1a01          	or	a,(OFST-5,sp)
1544  001e 01            	rrwa	x,a
1545                     ; 856   return (uint16_t)(ssrreg);
1549  001f 5b06          	addw	sp,#6
1550  0021 87            	retf	
1801                     ; 873 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
1801                     ; 874                         RTC_DateTypeDef* RTC_DateStruct)
1801                     ; 875 {
1802                     .text:	section	.text,new
1803  0000               f_RTC_SetDate:
1805  0000 88            	push	a
1806  0001 89            	pushw	x
1807       00000002      OFST:	set	2
1810                     ; 876   ErrorStatus status = ERROR;
1812                     ; 878   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
1814  0002 4d            	tnz	a
1815  0003 2610          	jrne	L757
1817  0005 1e07          	ldw	x,(OFST+5,sp)
1818  0007 e601          	ld	a,(1,x)
1819  0009 a410          	and	a,#16
1820  000b 2708          	jreq	L757
1821                     ; 880     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
1823  000d e601          	ld	a,(1,x)
1824  000f a4ef          	and	a,#239
1825  0011 ab0a          	add	a,#10
1826  0013 e701          	ld	(1,x),a
1827  0015               L757:
1828                     ; 884   assert_param(IS_RTC_FORMAT(RTC_Format));
1830                     ; 885   if (RTC_Format == RTC_Format_BIN)
1832                     ; 887     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
1834                     ; 888     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
1836                     ; 889     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
1838                     ; 890     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
1840                     ; 891     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
1843                     ; 895     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
1845                     ; 896     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1847                     ; 897     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1849                     ; 898     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1851                     ; 899     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1853                     ; 901   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
1855                     ; 904   RTC->WPR = 0xCA;
1857  0015 35ca5159      	mov	20825,#202
1858                     ; 905   RTC->WPR = 0x53;
1860  0019 35535159      	mov	20825,#83
1861                     ; 908   if (RTC_EnterInitMode() == ERROR)
1863  001d 8d000000      	callf	f_RTC_EnterInitMode
1865  0021 4d            	tnz	a
1866  0022 2606          	jrne	L567
1867                     ; 910     status = ERROR;
1869                     ; 912     RTC->WPR = 0xFF; 
1871  0024 35ff5159      	mov	20825,#255
1873  0028 2062          	jra	L767
1874  002a               L567:
1875                     ; 916     (void)(RTC->TR1);
1877  002a c65140        	ld	a,20800
1878                     ; 919     if (RTC_Format != RTC_Format_BIN)
1880  002d 7b03          	ld	a,(OFST+1,sp)
1881  002f 2718          	jreq	L177
1882                     ; 921       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
1884  0031 1e07          	ldw	x,(OFST+5,sp)
1885  0033 e602          	ld	a,(2,x)
1886  0035 c75144        	ld	20804,a
1887                     ; 922       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
1889  0038 f6            	ld	a,(x)
1890  0039 97            	ld	xl,a
1891  003a a620          	ld	a,#32
1892  003c 42            	mul	x,a
1893  003d 9f            	ld	a,xl
1894  003e 1e07          	ldw	x,(OFST+5,sp)
1895  0040 ea01          	or	a,(1,x)
1896  0042 c75145        	ld	20805,a
1897                     ; 923       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
1899  0045 e603          	ld	a,(3,x)
1901  0047 202a          	jra	L377
1902  0049               L177:
1903                     ; 927       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
1905  0049 1e07          	ldw	x,(OFST+5,sp)
1906  004b e602          	ld	a,(2,x)
1907  004d 8d000000      	callf	L3f_ByteToBcd2
1909  0051 c75144        	ld	20804,a
1910                     ; 928       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
1912  0054 1e07          	ldw	x,(OFST+5,sp)
1913  0056 f6            	ld	a,(x)
1914  0057 97            	ld	xl,a
1915  0058 a620          	ld	a,#32
1916  005a 42            	mul	x,a
1917  005b 9f            	ld	a,xl
1918  005c 6b01          	ld	(OFST-1,sp),a
1919  005e 1e07          	ldw	x,(OFST+5,sp)
1920  0060 e601          	ld	a,(1,x)
1921  0062 8d000000      	callf	L3f_ByteToBcd2
1923  0066 1a01          	or	a,(OFST-1,sp)
1924  0068 c75145        	ld	20805,a
1925                     ; 929       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
1927  006b 1e07          	ldw	x,(OFST+5,sp)
1928  006d e603          	ld	a,(3,x)
1929  006f 8d000000      	callf	L3f_ByteToBcd2
1931  0073               L377:
1932  0073 c75146        	ld	20806,a
1933                     ; 933     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1935  0076 721f514c      	bres	20812,#7
1936                     ; 936     RTC->WPR = 0xFF; 
1938  007a 35ff5159      	mov	20825,#255
1939                     ; 939     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1941  007e 7208514807    	btjt	20808,#4,L577
1942                     ; 941       if (RTC_WaitForSynchro() == ERROR)
1944  0083 8d000000      	callf	f_RTC_WaitForSynchro
1946  0087 4d            	tnz	a
1947                     ; 943         status = ERROR;
1950  0088 2702          	jreq	L767
1951                     ; 947         status = SUCCESS;
1952  008a               L577:
1953                     ; 952       status = SUCCESS;
1956  008a a601          	ld	a,#1
1957  008c               L767:
1958                     ; 956   return (ErrorStatus)status;
1962  008c 5b03          	addw	sp,#3
1963  008e 87            	retf	
1999                     ; 965 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
1999                     ; 966 {
2000                     .text:	section	.text,new
2001  0000               f_RTC_DateStructInit:
2005                     ; 968   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
2007  0000 a601          	ld	a,#1
2008  0002 f7            	ld	(x),a
2009                     ; 969   RTC_DateStruct->RTC_Date = 1;
2011  0003 e702          	ld	(2,x),a
2012                     ; 970   RTC_DateStruct->RTC_Month = RTC_Month_January;
2014  0005 e701          	ld	(1,x),a
2015                     ; 971   RTC_DateStruct->RTC_Year = 0;
2017  0007 6f03          	clr	(3,x)
2018                     ; 972 }
2021  0009 87            	retf	
2075                     ; 985 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
2075                     ; 986                  RTC_DateTypeDef* RTC_DateStruct)
2075                     ; 987 {
2076                     .text:	section	.text,new
2077  0000               f_RTC_GetDate:
2079  0000 88            	push	a
2080  0001 88            	push	a
2081       00000001      OFST:	set	1
2084                     ; 988   uint8_t tmpreg = 0;
2086                     ; 991   assert_param(IS_RTC_FORMAT(RTC_Format));
2088                     ; 994   (void) (RTC->TR1) ;
2090  0002 c65140        	ld	a,20800
2091                     ; 995   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
2093  0005 1e06          	ldw	x,(OFST+5,sp)
2094  0007 c65144        	ld	a,20804
2095  000a e702          	ld	(2,x),a
2096                     ; 996   tmpreg = (uint8_t)RTC->DR2;
2098  000c c65145        	ld	a,20805
2099  000f 6b01          	ld	(OFST+0,sp),a
2100                     ; 997   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
2102  0011 c65146        	ld	a,20806
2103  0014 e703          	ld	(3,x),a
2104                     ; 1000   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
2106  0016 7b01          	ld	a,(OFST+0,sp)
2107  0018 a41f          	and	a,#31
2108  001a e701          	ld	(1,x),a
2109                     ; 1001   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
2111  001c 7b01          	ld	a,(OFST+0,sp)
2112  001e 4e            	swap	a
2113  001f a40e          	and	a,#14
2114  0021 44            	srl	a
2115  0022 f7            	ld	(x),a
2116                     ; 1004   if (RTC_Format == RTC_Format_BIN)
2118  0023 7b02          	ld	a,(OFST+1,sp)
2119  0025 261e          	jrne	L3501
2120                     ; 1007     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
2122  0027 e603          	ld	a,(3,x)
2123  0029 8d000000      	callf	L5f_Bcd2ToByte
2125  002d 1e06          	ldw	x,(OFST+5,sp)
2126  002f e703          	ld	(3,x),a
2127                     ; 1008     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
2129  0031 e601          	ld	a,(1,x)
2130  0033 8d000000      	callf	L5f_Bcd2ToByte
2132  0037 1e06          	ldw	x,(OFST+5,sp)
2133  0039 e701          	ld	(1,x),a
2134                     ; 1009     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
2136  003b e602          	ld	a,(2,x)
2137  003d 8d000000      	callf	L5f_Bcd2ToByte
2139  0041 1e06          	ldw	x,(OFST+5,sp)
2140  0043 e702          	ld	(2,x),a
2141  0045               L3501:
2142                     ; 1011 }
2145  0045 85            	popw	x
2146  0046 87            	retf	
2286                     ; 1041 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
2286                     ; 1042                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2286                     ; 1043 {
2287                     .text:	section	.text,new
2288  0000               f_RTC_SetAlarm:
2290  0000 88            	push	a
2291  0001 5205          	subw	sp,#5
2292       00000005      OFST:	set	5
2295                     ; 1044   uint8_t tmpreg1 = 0;
2297                     ; 1045   uint8_t tmpreg2 = 0;
2299                     ; 1046   uint8_t tmpreg3 = 0;
2301                     ; 1047   uint8_t tmpreg4 = 0;
2303                     ; 1050   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
2305                     ; 1051   assert_param(IS_RTC_FORMAT(RTC_Format));
2307                     ; 1052   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
2309                     ; 1053   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
2311                     ; 1056   if (RTC_Format == RTC_Format_BIN)
2313                     ; 1059     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2314                     ; 1061       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2316                     ; 1062       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2319                     ; 1066       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2321                     ; 1068     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
2323                     ; 1069     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
2326                     ; 1074     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2328                     ; 1076       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2330                     ; 1077       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2334  0003 c65148        	ld	a,20808
2335                     ; 1081       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2337                     ; 1084     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
2339                     ; 1086     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
2341                     ; 1091   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
2343                     ; 1093     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
2345                     ; 1095       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2348                     ; 1099       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2350                     ; 1100       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2352                     ; 1105   RTC->WPR = 0xCA;
2354  0006 35ca5159      	mov	20825,#202
2355                     ; 1106   RTC->WPR = 0x53;
2357  000a 35535159      	mov	20825,#83
2358                     ; 1110   if (RTC_Format != RTC_Format_BIN)
2360  000e 7b06          	ld	a,(OFST+1,sp)
2361  0010 2731          	jreq	L3611
2362                     ; 1112     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
2362                     ; 1113                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
2364  0012 1e0a          	ldw	x,(OFST+5,sp)
2365  0014 e604          	ld	a,(4,x)
2366  0016 a480          	and	a,#128
2367  0018 ea02          	or	a,(2,x)
2368  001a 6b02          	ld	(OFST-3,sp),a
2369                     ; 1115     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
2369                     ; 1116                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2371  001c e604          	ld	a,(4,x)
2372  001e 48            	sll	a
2373  001f a480          	and	a,#128
2374  0021 ea01          	or	a,(1,x)
2375  0023 6b03          	ld	(OFST-2,sp),a
2376                     ; 1118     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
2376                     ; 1119                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2376                     ; 1120                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2378  0025 e604          	ld	a,(4,x)
2379  0027 48            	sll	a
2380  0028 48            	sll	a
2381  0029 a480          	and	a,#128
2382  002b 6b01          	ld	(OFST-4,sp),a
2383  002d e603          	ld	a,(3,x)
2384  002f fa            	or	a,(x)
2385  0030 1a01          	or	a,(OFST-4,sp)
2386  0032 6b04          	ld	(OFST-1,sp),a
2387                     ; 1122     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
2387                     ; 1123                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2387                     ; 1124                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
2389  0034 e604          	ld	a,(4,x)
2390  0036 48            	sll	a
2391  0037 48            	sll	a
2392  0038 48            	sll	a
2393  0039 a480          	and	a,#128
2394  003b 6b01          	ld	(OFST-4,sp),a
2395  003d e605          	ld	a,(5,x)
2396  003f ea06          	or	a,(6,x)
2398  0041 204f          	jra	L5611
2399  0043               L3611:
2400                     ; 1129     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
2400                     ; 1130                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
2402  0043 1e0a          	ldw	x,(OFST+5,sp)
2403  0045 e604          	ld	a,(4,x)
2404  0047 a480          	and	a,#128
2405  0049 6b01          	ld	(OFST-4,sp),a
2406  004b e602          	ld	a,(2,x)
2407  004d 8d000000      	callf	L3f_ByteToBcd2
2409  0051 1a01          	or	a,(OFST-4,sp)
2410  0053 6b02          	ld	(OFST-3,sp),a
2411                     ; 1132     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
2411                     ; 1133                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2413  0055 1e0a          	ldw	x,(OFST+5,sp)
2414  0057 e604          	ld	a,(4,x)
2415  0059 48            	sll	a
2416  005a a480          	and	a,#128
2417  005c 6b01          	ld	(OFST-4,sp),a
2418  005e e601          	ld	a,(1,x)
2419  0060 8d000000      	callf	L3f_ByteToBcd2
2421  0064 1a01          	or	a,(OFST-4,sp)
2422  0066 6b03          	ld	(OFST-2,sp),a
2423                     ; 1135     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
2423                     ; 1136                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2423                     ; 1137                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2425  0068 1e0a          	ldw	x,(OFST+5,sp)
2426  006a e604          	ld	a,(4,x)
2427  006c 48            	sll	a
2428  006d 48            	sll	a
2429  006e a480          	and	a,#128
2430  0070 6b01          	ld	(OFST-4,sp),a
2431  0072 f6            	ld	a,(x)
2432  0073 8d000000      	callf	L3f_ByteToBcd2
2434  0077 1e0a          	ldw	x,(OFST+5,sp)
2435  0079 ea03          	or	a,(3,x)
2436  007b 1a01          	or	a,(OFST-4,sp)
2437  007d 6b04          	ld	(OFST-1,sp),a
2438                     ; 1139     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
2438                     ; 1140                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2438                     ; 1141                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
2440  007f e604          	ld	a,(4,x)
2441  0081 48            	sll	a
2442  0082 48            	sll	a
2443  0083 48            	sll	a
2444  0084 a480          	and	a,#128
2445  0086 6b01          	ld	(OFST-4,sp),a
2446  0088 e606          	ld	a,(6,x)
2447  008a 8d000000      	callf	L3f_ByteToBcd2
2449  008e 1e0a          	ldw	x,(OFST+5,sp)
2450  0090 ea05          	or	a,(5,x)
2451  0092               L5611:
2452  0092 1a01          	or	a,(OFST-4,sp)
2453  0094 6b05          	ld	(OFST+0,sp),a
2454                     ; 1145   RTC->ALRMAR1 = tmpreg1;
2456  0096 7b02          	ld	a,(OFST-3,sp)
2457  0098 c7515c        	ld	20828,a
2458                     ; 1146   RTC->ALRMAR2 = tmpreg2;
2460  009b 7b03          	ld	a,(OFST-2,sp)
2461  009d c7515d        	ld	20829,a
2462                     ; 1147   RTC->ALRMAR3 = tmpreg3;
2464  00a0 7b04          	ld	a,(OFST-1,sp)
2465  00a2 c7515e        	ld	20830,a
2466                     ; 1148   RTC->ALRMAR4 = tmpreg4;
2468  00a5 7b05          	ld	a,(OFST+0,sp)
2469  00a7 c7515f        	ld	20831,a
2470                     ; 1151   RTC->WPR = 0xFF; 
2472  00aa 35ff5159      	mov	20825,#255
2473                     ; 1152 }
2476  00ae 5b06          	addw	sp,#6
2477  00b0 87            	retf	
2514                     ; 1162 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
2514                     ; 1163 {
2515                     .text:	section	.text,new
2516  0000               f_RTC_AlarmStructInit:
2520                     ; 1165   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
2522  0000 6f03          	clr	(3,x)
2523                     ; 1166   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
2525  0002 7f            	clr	(x)
2526                     ; 1167   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
2528  0003 6f01          	clr	(1,x)
2529                     ; 1168   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
2531  0005 6f02          	clr	(2,x)
2532                     ; 1171   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
2534  0007 6f05          	clr	(5,x)
2535                     ; 1172   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
2537  0009 a601          	ld	a,#1
2538  000b e706          	ld	(6,x),a
2539                     ; 1175   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
2541  000d a6f0          	ld	a,#240
2542  000f e704          	ld	(4,x),a
2543                     ; 1176 }
2546  0011 87            	retf	
2628                     ; 1185 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
2628                     ; 1186                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2628                     ; 1187 {
2629                     .text:	section	.text,new
2630  0000               f_RTC_GetAlarm:
2632  0000 88            	push	a
2633  0001 5204          	subw	sp,#4
2634       00000004      OFST:	set	4
2637                     ; 1188   uint8_t tmpreg1 = 0;
2639                     ; 1189   uint8_t tmpreg2 = 0;
2641                     ; 1190   uint8_t tmpreg3 = 0;
2643                     ; 1191   uint8_t tmpreg4 = 0;
2645                     ; 1192   uint8_t alarmmask = 0;
2647                     ; 1195   assert_param(IS_RTC_FORMAT(RTC_Format));
2649                     ; 1198   tmpreg1 = (uint8_t)RTC->ALRMAR1;
2651  0003 c6515c        	ld	a,20828
2652  0006 6b04          	ld	(OFST+0,sp),a
2653                     ; 1199   tmpreg2 = (uint8_t)RTC->ALRMAR2;
2655  0008 c6515d        	ld	a,20829
2656  000b 6b01          	ld	(OFST-3,sp),a
2657                     ; 1200   tmpreg3 = (uint8_t)RTC->ALRMAR3;
2659  000d c6515e        	ld	a,20830
2660  0010 6b02          	ld	(OFST-2,sp),a
2661                     ; 1201   tmpreg4 = (uint8_t)RTC->ALRMAR4;
2663  0012 c6515f        	ld	a,20831
2664  0015 6b03          	ld	(OFST-1,sp),a
2665                     ; 1204   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
2667  0017 7b04          	ld	a,(OFST+0,sp)
2668  0019 1e09          	ldw	x,(OFST+5,sp)
2669  001b a47f          	and	a,#127
2670  001d e702          	ld	(2,x),a
2671                     ; 1205   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
2673  001f 7b04          	ld	a,(OFST+0,sp)
2674  0021 a480          	and	a,#128
2675  0023 6b04          	ld	(OFST+0,sp),a
2676                     ; 1208   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
2678  0025 7b01          	ld	a,(OFST-3,sp)
2679  0027 a47f          	and	a,#127
2680  0029 e701          	ld	(1,x),a
2681                     ; 1209   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
2683  002b 7b01          	ld	a,(OFST-3,sp)
2684  002d a480          	and	a,#128
2685  002f 44            	srl	a
2686  0030 1a04          	or	a,(OFST+0,sp)
2687  0032 6b04          	ld	(OFST+0,sp),a
2688                     ; 1212   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
2690  0034 7b02          	ld	a,(OFST-2,sp)
2691  0036 a43f          	and	a,#63
2692  0038 f7            	ld	(x),a
2693                     ; 1213   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
2695  0039 7b02          	ld	a,(OFST-2,sp)
2696  003b a440          	and	a,#64
2697  003d e703          	ld	(3,x),a
2698                     ; 1214   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
2700  003f 7b02          	ld	a,(OFST-2,sp)
2701  0041 a480          	and	a,#128
2702  0043 44            	srl	a
2703  0044 44            	srl	a
2704  0045 1a04          	or	a,(OFST+0,sp)
2705  0047 6b04          	ld	(OFST+0,sp),a
2706                     ; 1217   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
2708  0049 7b03          	ld	a,(OFST-1,sp)
2709  004b a43f          	and	a,#63
2710  004d e706          	ld	(6,x),a
2711                     ; 1218   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
2713  004f 7b03          	ld	a,(OFST-1,sp)
2714  0051 a440          	and	a,#64
2715  0053 e705          	ld	(5,x),a
2716                     ; 1219   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
2718  0055 7b03          	ld	a,(OFST-1,sp)
2719  0057 a480          	and	a,#128
2720  0059 44            	srl	a
2721  005a 44            	srl	a
2722  005b 44            	srl	a
2723  005c 1a04          	or	a,(OFST+0,sp)
2724  005e 6b04          	ld	(OFST+0,sp),a
2725                     ; 1221   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
2727  0060 e704          	ld	(4,x),a
2728                     ; 1223   if (RTC_Format == RTC_Format_BIN)
2730  0062 7b05          	ld	a,(OFST+1,sp)
2731  0064 2626          	jrne	L5421
2732                     ; 1225     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
2734  0066 f6            	ld	a,(x)
2735  0067 8d000000      	callf	L5f_Bcd2ToByte
2737  006b 1e09          	ldw	x,(OFST+5,sp)
2738  006d f7            	ld	(x),a
2739                     ; 1226     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
2741  006e e601          	ld	a,(1,x)
2742  0070 8d000000      	callf	L5f_Bcd2ToByte
2744  0074 1e09          	ldw	x,(OFST+5,sp)
2745  0076 e701          	ld	(1,x),a
2746                     ; 1227     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
2748  0078 e602          	ld	a,(2,x)
2749  007a 8d000000      	callf	L5f_Bcd2ToByte
2751  007e 1e09          	ldw	x,(OFST+5,sp)
2752  0080 e702          	ld	(2,x),a
2753                     ; 1228     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
2755  0082 e606          	ld	a,(6,x)
2756  0084 8d000000      	callf	L5f_Bcd2ToByte
2758  0088 1e09          	ldw	x,(OFST+5,sp)
2759  008a e706          	ld	(6,x),a
2760  008c               L5421:
2761                     ; 1230 }
2764  008c 5b05          	addw	sp,#5
2765  008e 87            	retf	
2826                     ; 1239 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
2826                     ; 1240 {
2827                     .text:	section	.text,new
2828  0000               f_RTC_AlarmCmd:
2830  0000 5203          	subw	sp,#3
2831       00000003      OFST:	set	3
2834                     ; 1241   __IO uint16_t alrawfcount = 0;
2836  0002 5f            	clrw	x
2837  0003 1f01          	ldw	(OFST-2,sp),x
2838                     ; 1242   ErrorStatus status = ERROR;
2840                     ; 1243   uint8_t temp1 = 0;
2842                     ; 1246   assert_param(IS_FUNCTIONAL_STATE(NewState));
2844                     ; 1249   RTC->WPR = 0xCA;
2846  0005 35ca5159      	mov	20825,#202
2847                     ; 1250   RTC->WPR = 0x53;
2849  0009 35535159      	mov	20825,#83
2850                     ; 1253   if (NewState != DISABLE)
2852  000d 4d            	tnz	a
2853  000e 2711          	jreq	L7721
2854                     ; 1255     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
2856  0010 72105149      	bset	20809,#0
2857                     ; 1256     status = SUCCESS;
2859  0014               LC006:
2861  0014 a601          	ld	a,#1
2862  0016 6b03          	ld	(OFST+0,sp),a
2864  0018               L1031:
2865                     ; 1280   RTC->WPR = 0xFF; 
2867  0018 35ff5159      	mov	20825,#255
2868                     ; 1283   return (ErrorStatus)status;
2870  001c 7b03          	ld	a,(OFST+0,sp)
2873  001e 5b03          	addw	sp,#3
2874  0020 87            	retf	
2875  0021               L7721:
2876                     ; 1260     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
2878  0021 72115149      	bres	20809,#0
2879                     ; 1263     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
2881  0025 c6514c        	ld	a,20812
2882  0028 a401          	and	a,#1
2883  002a 6b03          	ld	(OFST+0,sp),a
2885  002c 2005          	jra	L7031
2886  002e               L3031:
2887                     ; 1266       alrawfcount++;
2889  002e 1e01          	ldw	x,(OFST-2,sp)
2890  0030 5c            	incw	x
2891  0031 1f01          	ldw	(OFST-2,sp),x
2892  0033               L7031:
2893                     ; 1264     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
2895  0033 1e01          	ldw	x,(OFST-2,sp)
2896  0035 5c            	incw	x
2897  0036 2704          	jreq	L3131
2899  0038 7b03          	ld	a,(OFST+0,sp)
2900  003a 27f2          	jreq	L3031
2901  003c               L3131:
2902                     ; 1269     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
2904  003c 7200514c04    	btjt	20812,#0,L5131
2905                     ; 1271       status = ERROR;
2907  0041 0f03          	clr	(OFST+0,sp)
2909  0043 20d3          	jra	L1031
2910  0045               L5131:
2911                     ; 1275       status = SUCCESS;
2912  0045 20cd          	jpf	LC006
3108                     ; 1295 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
3108                     ; 1296                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
3108                     ; 1297 {
3109                     .text:	section	.text,new
3110  0000               f_RTC_AlarmSubSecondConfig:
3112  0000 89            	pushw	x
3113  0001 88            	push	a
3114       00000001      OFST:	set	1
3117                     ; 1298   uint8_t alarmstatus = 0;
3119                     ; 1299   ErrorStatus status = ERROR;
3121                     ; 1302   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
3123                     ; 1303   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
3125                     ; 1306   RTC->WPR = 0xCA;
3127  0002 35ca5159      	mov	20825,#202
3128                     ; 1307   RTC->WPR = 0x53;
3130  0006 35535159      	mov	20825,#83
3131                     ; 1310   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
3133  000a 720c514c26    	btjt	20812,#6,L3141
3134                     ; 1313     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
3136  000f c65149        	ld	a,20809
3137  0012 aa01          	or	a,#1
3138  0014 6b01          	ld	(OFST+0,sp),a
3139                     ; 1316     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
3141  0016 72115149      	bres	20809,#0
3142                     ; 1319     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
3144  001a 9e            	ld	a,xh
3145  001b c75164        	ld	20836,a
3146                     ; 1320     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
3148  001e 9f            	ld	a,xl
3149  001f c75165        	ld	20837,a
3150                     ; 1321     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
3152  0022 7b07          	ld	a,(OFST+6,sp)
3153  0024 c75166        	ld	20838,a
3154                     ; 1324     RTC->CR2 |= alarmstatus;
3156  0027 c65149        	ld	a,20809
3157  002a 1a01          	or	a,(OFST+0,sp)
3158  002c c75149        	ld	20809,a
3159                     ; 1326     status = SUCCESS;
3161  002f a601          	ld	a,#1
3162  0031 6b01          	ld	(OFST+0,sp),a
3164  0033 2002          	jra	L5141
3165  0035               L3141:
3166                     ; 1330     status = ERROR;
3168  0035 0f01          	clr	(OFST+0,sp)
3169  0037               L5141:
3170                     ; 1334   RTC->WPR = 0xFF; 
3172  0037 35ff5159      	mov	20825,#255
3173                     ; 1336   return (ErrorStatus)status;
3175  003b 7b01          	ld	a,(OFST+0,sp)
3178  003d 5b03          	addw	sp,#3
3179  003f 87            	retf	
3268                     ; 1366 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
3268                     ; 1367 {
3269                     .text:	section	.text,new
3270  0000               f_RTC_WakeUpClockConfig:
3272  0000 88            	push	a
3273       00000000      OFST:	set	0
3276                     ; 1370   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
3278                     ; 1373   RTC->WPR = 0xCA;
3280  0001 35ca5159      	mov	20825,#202
3281                     ; 1374   RTC->WPR = 0x53;
3283  0005 35535159      	mov	20825,#83
3284                     ; 1377   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3286  0009 72155149      	bres	20809,#2
3287                     ; 1380   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
3289  000d c65148        	ld	a,20808
3290  0010 a4f8          	and	a,#248
3291  0012 c75148        	ld	20808,a
3292                     ; 1383   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
3294  0015 c65148        	ld	a,20808
3295  0018 1a01          	or	a,(OFST+1,sp)
3296  001a c75148        	ld	20808,a
3297                     ; 1386   RTC->WPR = 0xFF; 
3299  001d 35ff5159      	mov	20825,#255
3300                     ; 1387 }
3303  0021 84            	pop	a
3304  0022 87            	retf	
3336                     ; 1397 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
3336                     ; 1398 {
3337                     .text:	section	.text,new
3338  0000               f_RTC_SetWakeUpCounter:
3342                     ; 1400   RTC->WPR = 0xCA;
3344  0000 35ca5159      	mov	20825,#202
3345                     ; 1401   RTC->WPR = 0x53;
3347  0004 35535159      	mov	20825,#83
3348                     ; 1405   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
3350  0008 9e            	ld	a,xh
3351  0009 c75154        	ld	20820,a
3352                     ; 1406   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
3354  000c 9f            	ld	a,xl
3355  000d c75155        	ld	20821,a
3356                     ; 1409   RTC->WPR = 0xFF; 
3358  0010 35ff5159      	mov	20825,#255
3359                     ; 1410 }
3362  0014 87            	retf	
3394                     ; 1417 uint16_t RTC_GetWakeUpCounter(void)
3394                     ; 1418 {
3395                     .text:	section	.text,new
3396  0000               f_RTC_GetWakeUpCounter:
3398  0000 89            	pushw	x
3399       00000002      OFST:	set	2
3402                     ; 1419   uint16_t tmpreg = 0;
3404                     ; 1422   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
3406  0001 c65154        	ld	a,20820
3407  0004 97            	ld	xl,a
3408  0005 4f            	clr	a
3409  0006 02            	rlwa	x,a
3410  0007 1f01          	ldw	(OFST-1,sp),x
3411                     ; 1423   tmpreg |= RTC->WUTRL;
3413  0009 c65155        	ld	a,20821
3414  000c 5f            	clrw	x
3415  000d 97            	ld	xl,a
3416  000e 01            	rrwa	x,a
3417  000f 1a02          	or	a,(OFST+0,sp)
3418  0011 01            	rrwa	x,a
3419  0012 1a01          	or	a,(OFST-1,sp)
3420  0014 01            	rrwa	x,a
3421                     ; 1426   return (uint16_t)tmpreg;
3425  0015 5b02          	addw	sp,#2
3426  0017 87            	retf	
3478                     ; 1437 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
3478                     ; 1438 {
3479                     .text:	section	.text,new
3480  0000               f_RTC_WakeUpCmd:
3482  0000 5203          	subw	sp,#3
3483       00000003      OFST:	set	3
3486                     ; 1439   ErrorStatus status = ERROR;
3488                     ; 1440   uint16_t wutwfcount = 0;
3490  0002 5f            	clrw	x
3491  0003 1f02          	ldw	(OFST-1,sp),x
3492                     ; 1443   assert_param(IS_FUNCTIONAL_STATE(NewState));
3494                     ; 1446   RTC->WPR = 0xCA;
3496  0005 35ca5159      	mov	20825,#202
3497                     ; 1447   RTC->WPR = 0x53;
3499  0009 35535159      	mov	20825,#83
3500                     ; 1449   if (NewState != DISABLE)
3502  000d 4d            	tnz	a
3503  000e 2711          	jreq	L1351
3504                     ; 1452     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
3506  0010 72145149      	bset	20809,#2
3507                     ; 1454     status = SUCCESS;
3509  0014               LC007:
3511  0014 a601          	ld	a,#1
3512  0016 6b01          	ld	(OFST-2,sp),a
3514  0018               L3351:
3515                     ; 1479   RTC->WPR = 0xFF; 
3517  0018 35ff5159      	mov	20825,#255
3518                     ; 1482   return (ErrorStatus)status;
3520  001c 7b01          	ld	a,(OFST-2,sp)
3523  001e 5b03          	addw	sp,#3
3524  0020 87            	retf	
3525  0021               L1351:
3526                     ; 1459     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3528  0021 72155149      	bres	20809,#2
3530  0025 2003          	jra	L7351
3531  0027               L5351:
3532                     ; 1464       wutwfcount++;
3534  0027 5c            	incw	x
3535  0028 1f02          	ldw	(OFST-1,sp),x
3536  002a               L7351:
3537                     ; 1462     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
3539  002a 7204514c05    	btjt	20812,#2,L3451
3541  002f a3ffff        	cpw	x,#65535
3542  0032 26f3          	jrne	L5351
3543  0034               L3451:
3544                     ; 1468     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
3546  0034 7204514c04    	btjt	20812,#2,L5451
3547                     ; 1470       status = ERROR;
3549  0039 0f01          	clr	(OFST-2,sp)
3551  003b 20db          	jra	L3351
3552  003d               L5451:
3553                     ; 1474       status = SUCCESS;
3554  003d 20d5          	jpf	LC007
3643                     ; 1519 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
3643                     ; 1520                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
3643                     ; 1521 {
3644                     .text:	section	.text,new
3645  0000               f_RTC_DayLightSavingConfig:
3647  0000 89            	pushw	x
3648       00000000      OFST:	set	0
3651                     ; 1523   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
3653                     ; 1524   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
3655                     ; 1527   RTC->WPR = 0xCA;
3657  0001 35ca5159      	mov	20825,#202
3658                     ; 1528   RTC->WPR = 0x53;
3660  0005 35535159      	mov	20825,#83
3661                     ; 1531   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
3663  0009 7215514a      	bres	20810,#2
3664                     ; 1534   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
3666  000d 9f            	ld	a,xl
3667  000e 1a01          	or	a,(OFST+1,sp)
3668  0010 ca514a        	or	a,20810
3669  0013 c7514a        	ld	20810,a
3670                     ; 1537   RTC->WPR = 0xFF; 
3672  0016 35ff5159      	mov	20825,#255
3673                     ; 1538 }
3676  001a 85            	popw	x
3677  001b 87            	retf	
3701                     ; 1546 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
3701                     ; 1547 {
3702                     .text:	section	.text,new
3703  0000               f_RTC_GetStoreOperation:
3707                     ; 1549   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
3709  0000 c6514a        	ld	a,20810
3710  0003 a404          	and	a,#4
3713  0005 87            	retf	
3806                     ; 1584 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
3806                     ; 1585                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
3806                     ; 1586 {
3807                     .text:	section	.text,new
3808  0000               f_RTC_OutputConfig:
3810  0000 89            	pushw	x
3811       00000000      OFST:	set	0
3814                     ; 1588   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
3816                     ; 1589   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
3818                     ; 1592   RTC->WPR = 0xCA;
3820  0001 35ca5159      	mov	20825,#202
3821                     ; 1593   RTC->WPR = 0x53;
3823  0005 35535159      	mov	20825,#83
3824                     ; 1596   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
3826  0009 c6514a        	ld	a,20810
3827  000c a48f          	and	a,#143
3828  000e c7514a        	ld	20810,a
3829                     ; 1599   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
3831  0011 9f            	ld	a,xl
3832  0012 1a01          	or	a,(OFST+1,sp)
3833  0014 ca514a        	or	a,20810
3834  0017 c7514a        	ld	20810,a
3835                     ; 1602   RTC->WPR = 0xFF; 
3837  001a 35ff5159      	mov	20825,#255
3838                     ; 1603 }
3841  001e 85            	popw	x
3842  001f 87            	retf	
3930                     ; 1636 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
3930                     ; 1637                                    uint16_t RTC_ShiftSubFS)
3930                     ; 1638 {
3931                     .text:	section	.text,new
3932  0000               f_RTC_SynchroShiftConfig:
3934  0000 88            	push	a
3935  0001 5203          	subw	sp,#3
3936       00000003      OFST:	set	3
3939                     ; 1639   uint8_t shiftrhreg = 0;
3941                     ; 1640   ErrorStatus status = ERROR;
3943                     ; 1641   uint16_t shpfcount = 0;
3945  0003 5f            	clrw	x
3946  0004 1f02          	ldw	(OFST-1,sp),x
3947                     ; 1644   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
3949                     ; 1645   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
3951                     ; 1648   RTC->WPR = 0xCA;
3953  0006 35ca5159      	mov	20825,#202
3954                     ; 1649   RTC->WPR = 0x53;
3956  000a 35535159      	mov	20825,#83
3957                     ; 1652   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
3959  000e 7207514c0f    	btjf	20812,#3,L7271
3961  0013 2003          	jra	L3371
3962  0015               L1371:
3963                     ; 1657       shpfcount++;
3965  0015 5c            	incw	x
3966  0016 1f02          	ldw	(OFST-1,sp),x
3967  0018               L3371:
3968                     ; 1655     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
3970  0018 7207514c05    	btjf	20812,#3,L7271
3972  001d a3ffff        	cpw	x,#65535
3973  0020 26f3          	jrne	L1371
3974  0022               L7271:
3975                     ; 1662   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
3977  0022 7206514c12    	btjt	20812,#3,L1471
3978                     ; 1665     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
3980  0027 7b08          	ld	a,(OFST+5,sp)
3981  0029 1a04          	or	a,(OFST+1,sp)
3982                     ; 1666     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
3984  002b c7515a        	ld	20826,a
3985                     ; 1667     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
3987  002e 7b09          	ld	a,(OFST+6,sp)
3988  0030 c7515b        	ld	20827,a
3989                     ; 1669     status = SUCCESS;
3991  0033 a601          	ld	a,#1
3992  0035 6b01          	ld	(OFST-2,sp),a
3994  0037 2002          	jra	L3471
3995  0039               L1471:
3996                     ; 1673     status = ERROR;
3998  0039 0f01          	clr	(OFST-2,sp)
3999  003b               L3471:
4000                     ; 1677   RTC->WPR = 0xFF; 
4002  003b 35ff5159      	mov	20825,#255
4003                     ; 1679   return (ErrorStatus)(status);
4005  003f 7b01          	ld	a,(OFST-2,sp)
4008  0041 5b04          	addw	sp,#4
4009  0043 87            	retf	
4134                     ; 1715 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
4134                     ; 1716                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
4134                     ; 1717                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
4134                     ; 1718 {
4135                     .text:	section	.text,new
4136  0000               f_RTC_SmoothCalibConfig:
4138  0000 89            	pushw	x
4139  0001 5203          	subw	sp,#3
4140       00000003      OFST:	set	3
4143                     ; 1719   ErrorStatus status = ERROR;
4145                     ; 1720   uint16_t recalpfcount = 0;
4147  0003 5f            	clrw	x
4148  0004 1f02          	ldw	(OFST-1,sp),x
4149                     ; 1723   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
4151                     ; 1724   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
4153                     ; 1725   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
4155                     ; 1728   RTC->WPR = 0xCA;
4157  0006 35ca5159      	mov	20825,#202
4158                     ; 1729   RTC->WPR = 0x53;
4160  000a 35535159      	mov	20825,#83
4161                     ; 1732   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
4163  000e 7203514c0f    	btjf	20812,#1,L1202
4165  0013 2003          	jra	L5202
4166  0015               L3202:
4167                     ; 1737       recalpfcount++;
4169  0015 5c            	incw	x
4170  0016 1f02          	ldw	(OFST-1,sp),x
4171  0018               L5202:
4172                     ; 1735     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
4174  0018 7203514c05    	btjf	20812,#1,L1202
4176  001d a3ffff        	cpw	x,#65535
4177  0020 26f3          	jrne	L3202
4178  0022               L1202:
4179                     ; 1743   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
4181  0022 7202514c14    	btjt	20812,#1,L3302
4182                     ; 1746     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | \
4182                     ; 1747                            (uint8_t)RTC_SmoothCalibPlusPulses) | \
4182                     ; 1748                            (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
4184  0027 7b04          	ld	a,(OFST+1,sp)
4185  0029 1a05          	or	a,(OFST+2,sp)
4186  002b 1a09          	or	a,(OFST+6,sp)
4187  002d c7516a        	ld	20842,a
4188                     ; 1749     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
4190  0030 7b0a          	ld	a,(OFST+7,sp)
4191  0032 c7516b        	ld	20843,a
4192                     ; 1751     status = SUCCESS;
4194  0035 a601          	ld	a,#1
4195  0037 6b01          	ld	(OFST-2,sp),a
4197  0039 2002          	jra	L5302
4198  003b               L3302:
4199                     ; 1755     status = ERROR;
4201  003b 0f01          	clr	(OFST-2,sp)
4202  003d               L5302:
4203                     ; 1759   RTC->WPR = 0xFF; 
4205  003d 35ff5159      	mov	20825,#255
4206                     ; 1761   return (ErrorStatus)(status);
4208  0041 7b01          	ld	a,(OFST-2,sp)
4211  0043 5b05          	addw	sp,#5
4212  0045 87            	retf	
4269                     ; 1787 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
4269                     ; 1788 {
4270                     .text:	section	.text,new
4271  0000               f_RTC_CalibOutputConfig:
4275                     ; 1790   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
4277                     ; 1793   RTC->WPR = 0xCA;
4279  0000 35ca5159      	mov	20825,#202
4280                     ; 1794   RTC->WPR = 0x53;
4282  0004 35535159      	mov	20825,#83
4283                     ; 1796   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
4285  0008 4d            	tnz	a
4286  0009 2706          	jreq	L5602
4287                     ; 1799     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
4289  000b 7216514a      	bset	20810,#3
4291  000f 2004          	jra	L7602
4292  0011               L5602:
4293                     ; 1804     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
4295  0011 7217514a      	bres	20810,#3
4296  0015               L7602:
4297                     ; 1808   RTC->WPR = 0xFF; 
4299  0015 35ff5159      	mov	20825,#255
4300                     ; 1809 }
4303  0019 87            	retf	
4337                     ; 1817 void RTC_CalibOutputCmd(FunctionalState NewState)
4337                     ; 1818 {
4338                     .text:	section	.text,new
4339  0000               f_RTC_CalibOutputCmd:
4343                     ; 1820   assert_param(IS_FUNCTIONAL_STATE(NewState));
4345                     ; 1823   RTC->WPR = 0xCA;
4347  0000 35ca5159      	mov	20825,#202
4348                     ; 1824   RTC->WPR = 0x53;
4350  0004 35535159      	mov	20825,#83
4351                     ; 1826   if (NewState != DISABLE)
4353  0008 4d            	tnz	a
4354  0009 2706          	jreq	L7012
4355                     ; 1829     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
4357  000b 721e514a      	bset	20810,#7
4359  000f 2004          	jra	L1112
4360  0011               L7012:
4361                     ; 1834     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
4363  0011 721f514a      	bres	20810,#7
4364  0015               L1112:
4365                     ; 1838   RTC->WPR = 0xFF; 
4367  0015 35ff5159      	mov	20825,#255
4368                     ; 1839 }
4371  0019 87            	retf	
4465                     ; 1868 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
4465                     ; 1869                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
4465                     ; 1870 {
4466                     .text:	section	.text,new
4467  0000               f_RTC_TamperLevelConfig:
4469  0000 89            	pushw	x
4470       00000000      OFST:	set	0
4473                     ; 1872   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4475                     ; 1873   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
4477                     ; 1876   RTC->WPR = 0xCA;
4479  0001 35ca5159      	mov	20825,#202
4480                     ; 1877   RTC->WPR = 0x53;
4482  0005 35535159      	mov	20825,#83
4483                     ; 1879   if (RTC_TamperLevel != RTC_TamperLevel_Low)
4485  0009 9f            	ld	a,xl
4486  000a 4d            	tnz	a
4487  000b 2707          	jreq	L7512
4488                     ; 1882     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
4490  000d 9e            	ld	a,xh
4491  000e 48            	sll	a
4492  000f ca516c        	or	a,20844
4494  0012 2007          	jra	L1612
4495  0014               L7512:
4496                     ; 1887     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
4498  0014 7b01          	ld	a,(OFST+1,sp)
4499  0016 48            	sll	a
4500  0017 43            	cpl	a
4501  0018 c4516c        	and	a,20844
4502  001b               L1612:
4503  001b c7516c        	ld	20844,a
4504                     ; 1891   RTC->WPR = 0xFF; 
4506  001e 35ff5159      	mov	20825,#255
4507                     ; 1892 }
4510  0022 85            	popw	x
4511  0023 87            	retf	
4584                     ; 1900 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
4584                     ; 1901 {
4585                     .text:	section	.text,new
4586  0000               f_RTC_TamperFilterConfig:
4588  0000 88            	push	a
4589       00000000      OFST:	set	0
4592                     ; 1904   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
4594                     ; 1907   RTC->WPR = 0xCA;
4596  0001 35ca5159      	mov	20825,#202
4597                     ; 1908   RTC->WPR = 0x53;
4599  0005 35535159      	mov	20825,#83
4600                     ; 1911   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
4602  0009 c6516d        	ld	a,20845
4603  000c a4e7          	and	a,#231
4604  000e c7516d        	ld	20845,a
4605                     ; 1914   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
4607  0011 c6516d        	ld	a,20845
4608  0014 1a01          	or	a,(OFST+1,sp)
4609  0016 c7516d        	ld	20845,a
4610                     ; 1917   RTC->WPR = 0xFF; 
4612  0019 35ff5159      	mov	20825,#255
4613                     ; 1919 }
4616  001d 84            	pop	a
4617  001e 87            	retf	
4729                     ; 1928 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
4729                     ; 1929 {
4730                     .text:	section	.text,new
4731  0000               f_RTC_TamperSamplingFreqConfig:
4733  0000 88            	push	a
4734       00000000      OFST:	set	0
4737                     ; 1931   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
4739                     ; 1934   RTC->WPR = 0xCA;
4741  0001 35ca5159      	mov	20825,#202
4742                     ; 1935   RTC->WPR = 0x53;
4744  0005 35535159      	mov	20825,#83
4745                     ; 1938   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
4747  0009 c6516d        	ld	a,20845
4748  000c a4f8          	and	a,#248
4749  000e c7516d        	ld	20845,a
4750                     ; 1941   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
4752  0011 c6516d        	ld	a,20845
4753  0014 1a01          	or	a,(OFST+1,sp)
4754  0016 c7516d        	ld	20845,a
4755                     ; 1944   RTC->WPR = 0xFF; 
4757  0019 35ff5159      	mov	20825,#255
4758                     ; 1945 }
4761  001d 84            	pop	a
4762  001e 87            	retf	
4844                     ; 1955 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
4844                     ; 1956 {
4845                     .text:	section	.text,new
4846  0000               f_RTC_TamperPinsPrechargeDuration:
4848  0000 88            	push	a
4849       00000000      OFST:	set	0
4852                     ; 1958   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
4854                     ; 1961   RTC->WPR = 0xCA;
4856  0001 35ca5159      	mov	20825,#202
4857                     ; 1962   RTC->WPR = 0x53;
4859  0005 35535159      	mov	20825,#83
4860                     ; 1965   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
4862  0009 c6516d        	ld	a,20845
4863  000c a41f          	and	a,#31
4864  000e c7516d        	ld	20845,a
4865                     ; 1968   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
4867  0011 c6516d        	ld	a,20845
4868  0014 1a01          	or	a,(OFST+1,sp)
4869  0016 c7516d        	ld	20845,a
4870                     ; 1971   RTC->WPR = 0xFF; 
4872  0019 35ff5159      	mov	20825,#255
4873                     ; 1972 }
4876  001d 84            	pop	a
4877  001e 87            	retf	
4921                     ; 1984 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
4921                     ; 1985                    FunctionalState NewState)
4921                     ; 1986 {
4922                     .text:	section	.text,new
4923  0000               f_RTC_TamperCmd:
4925  0000 89            	pushw	x
4926       00000000      OFST:	set	0
4929                     ; 1989   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4931                     ; 1990   assert_param(IS_FUNCTIONAL_STATE(NewState));
4933                     ; 1993   RTC->WPR = 0xCA;
4935  0001 35ca5159      	mov	20825,#202
4936                     ; 1994   RTC->WPR = 0x53;
4938  0005 35535159      	mov	20825,#83
4939                     ; 1997   if (NewState != DISABLE)
4941  0009 9f            	ld	a,xl
4942  000a 4d            	tnz	a
4943  000b 2706          	jreq	L5332
4944                     ; 2000     RTC->TCR1 |= (uint8_t)RTC_Tamper;
4946  000d 9e            	ld	a,xh
4947  000e ca516c        	or	a,20844
4949  0011 2006          	jra	L7332
4950  0013               L5332:
4951                     ; 2005     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
4953  0013 7b01          	ld	a,(OFST+1,sp)
4954  0015 43            	cpl	a
4955  0016 c4516c        	and	a,20844
4956  0019               L7332:
4957  0019 c7516c        	ld	20844,a
4958                     ; 2010   RTC->WPR = 0xFF; 
4960  001c 35ff5159      	mov	20825,#255
4961                     ; 2011 }
4964  0020 85            	popw	x
4965  0021 87            	retf	
5036                     ; 2055 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
5036                     ; 2056 {
5037                     .text:	section	.text,new
5038  0000               f_RTC_ITConfig:
5040  0000 89            	pushw	x
5041       00000000      OFST:	set	0
5044                     ; 2058   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
5046                     ; 2059   assert_param(IS_FUNCTIONAL_STATE(NewState));
5048                     ; 2062   RTC->WPR = 0xCA;
5050  0001 35ca5159      	mov	20825,#202
5051                     ; 2063   RTC->WPR = 0x53;
5053  0005 35535159      	mov	20825,#83
5054                     ; 2065   if (NewState != DISABLE)
5056  0009 7b06          	ld	a,(OFST+6,sp)
5057  000b 2712          	jreq	L5732
5058                     ; 2068     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5060  000d 9f            	ld	a,xl
5061  000e a4f0          	and	a,#240
5062  0010 ca5149        	or	a,20809
5063  0013 c75149        	ld	20809,a
5064                     ; 2069     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
5066  0016 7b02          	ld	a,(OFST+2,sp)
5067  0018 a401          	and	a,#1
5068  001a ca516c        	or	a,20844
5070  001d 2013          	jra	L7732
5071  001f               L5732:
5072                     ; 2074     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5074  001f 7b02          	ld	a,(OFST+2,sp)
5075  0021 a4f0          	and	a,#240
5076  0023 43            	cpl	a
5077  0024 c45149        	and	a,20809
5078  0027 c75149        	ld	20809,a
5079                     ; 2075     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
5081  002a 7b02          	ld	a,(OFST+2,sp)
5082  002c a401          	and	a,#1
5083  002e 43            	cpl	a
5084  002f c4516c        	and	a,20844
5085  0032               L7732:
5086  0032 c7516c        	ld	20844,a
5087                     ; 2079   RTC->WPR = 0xFF; 
5089  0035 35ff5159      	mov	20825,#255
5090                     ; 2080 }
5093  0039 85            	popw	x
5094  003a 87            	retf	
5263                     ; 2087 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
5263                     ; 2088 {
5264                     .text:	section	.text,new
5265  0000               f_RTC_GetFlagStatus:
5267  0000 89            	pushw	x
5268  0001 5203          	subw	sp,#3
5269       00000003      OFST:	set	3
5272                     ; 2089   FlagStatus flagstatus = RESET;
5274                     ; 2090   uint16_t tmpreg1 = 0;
5276                     ; 2091   uint16_t tmpreg2 = 0;
5278                     ; 2094   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
5280                     ; 2097   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
5282  0003 c6514c        	ld	a,20812
5283  0006 97            	ld	xl,a
5284  0007 4f            	clr	a
5285  0008 02            	rlwa	x,a
5286  0009 1f02          	ldw	(OFST-1,sp),x
5287                     ; 2098   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
5289  000b c6514d        	ld	a,20813
5290  000e 5f            	clrw	x
5291  000f 97            	ld	xl,a
5292  0010 01            	rrwa	x,a
5293  0011 1a03          	or	a,(OFST+0,sp)
5294  0013 01            	rrwa	x,a
5295  0014 1a02          	or	a,(OFST-1,sp)
5296  0016 01            	rrwa	x,a
5297  0017 1f02          	ldw	(OFST-1,sp),x
5298                     ; 2101   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
5300  0019 01            	rrwa	x,a
5301  001a 1405          	and	a,(OFST+2,sp)
5302  001c 01            	rrwa	x,a
5303  001d 1404          	and	a,(OFST+1,sp)
5304  001f 01            	rrwa	x,a
5305  0020 5d            	tnzw	x
5306  0021 2704          	jreq	L3742
5307                     ; 2103     flagstatus = SET;
5309  0023 a601          	ld	a,#1
5311  0025 2001          	jra	L5742
5312  0027               L3742:
5313                     ; 2107     flagstatus = RESET;
5315  0027 4f            	clr	a
5316  0028               L5742:
5317                     ; 2109   return (FlagStatus)flagstatus;
5321  0028 5b05          	addw	sp,#5
5322  002a 87            	retf	
5356                     ; 2119 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
5356                     ; 2120 {
5357                     .text:	section	.text,new
5358  0000               f_RTC_ClearFlag:
5360  0000 89            	pushw	x
5361       00000000      OFST:	set	0
5364                     ; 2122   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
5366                     ; 2125   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
5368  0001 9f            	ld	a,xl
5369  0002 43            	cpl	a
5370  0003 c7514d        	ld	20813,a
5371                     ; 2126   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
5373  0006 7b01          	ld	a,(OFST+1,sp)
5374  0008 43            	cpl	a
5375  0009 a47f          	and	a,#127
5376  000b c7514c        	ld	20812,a
5377                     ; 2127 }
5380  000e 85            	popw	x
5381  000f 87            	retf	
5440                     ; 2135 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
5440                     ; 2136 {
5441                     .text:	section	.text,new
5442  0000               f_RTC_GetITStatus:
5444  0000 89            	pushw	x
5445  0001 89            	pushw	x
5446       00000002      OFST:	set	2
5449                     ; 2137   ITStatus itstatus = RESET;
5451                     ; 2138   uint8_t enablestatus = 0, tmpreg = 0;
5455                     ; 2141   assert_param(IS_RTC_GET_IT(RTC_IT));
5457                     ; 2144   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
5459  0002 9f            	ld	a,xl
5460  0003 c45149        	and	a,20809
5461  0006 6b01          	ld	(OFST-1,sp),a
5462                     ; 2147   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
5464  0008 1e03          	ldw	x,(OFST+1,sp)
5465  000a 54            	srlw	x
5466  000b 54            	srlw	x
5467  000c 54            	srlw	x
5468  000d 54            	srlw	x
5469  000e 9f            	ld	a,xl
5470  000f c4514d        	and	a,20813
5471  0012 6b02          	ld	(OFST+0,sp),a
5472                     ; 2150   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
5474  0014 7b01          	ld	a,(OFST-1,sp)
5475  0016 2708          	jreq	L3452
5477  0018 7b02          	ld	a,(OFST+0,sp)
5478  001a 2704          	jreq	L3452
5479                     ; 2152     itstatus = SET;
5481  001c a601          	ld	a,#1
5483  001e 2001          	jra	L5452
5484  0020               L3452:
5485                     ; 2156     itstatus = RESET;
5487  0020 4f            	clr	a
5488  0021               L5452:
5489                     ; 2159   return (ITStatus)itstatus;
5493  0021 5b04          	addw	sp,#4
5494  0023 87            	retf	
5529                     ; 2169 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
5529                     ; 2170 {
5530                     .text:	section	.text,new
5531  0000               f_RTC_ClearITPendingBit:
5535                     ; 2172   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
5537                     ; 2175   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
5539  0000 54            	srlw	x
5540  0001 54            	srlw	x
5541  0002 54            	srlw	x
5542  0003 54            	srlw	x
5543  0004 9f            	ld	a,xl
5544  0005 43            	cpl	a
5545  0006 c7514d        	ld	20813,a
5546                     ; 2176 }
5549  0009 87            	retf	
5587                     ; 2199 static uint8_t ByteToBcd2(uint8_t Value)
5587                     ; 2200 {
5588                     .text:	section	.text,new
5589  0000               L3f_ByteToBcd2:
5591  0000 88            	push	a
5592  0001 88            	push	a
5593       00000001      OFST:	set	1
5596                     ; 2201   uint8_t bcdhigh = 0;
5598  0002 0f01          	clr	(OFST+0,sp)
5600  0004 7b02          	ld	a,(OFST+1,sp)
5601  0006 2006          	jra	L7062
5602  0008               L3062:
5603                     ; 2205     bcdhigh++;
5605  0008 0c01          	inc	(OFST+0,sp)
5606                     ; 2206     Value -= 10;
5608  000a a00a          	sub	a,#10
5609  000c 6b02          	ld	(OFST+1,sp),a
5610  000e               L7062:
5611                     ; 2203   while (Value >= 10)
5613  000e a10a          	cp	a,#10
5614  0010 24f6          	jruge	L3062
5615                     ; 2209   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
5617  0012 7b01          	ld	a,(OFST+0,sp)
5618  0014 97            	ld	xl,a
5619  0015 a610          	ld	a,#16
5620  0017 42            	mul	x,a
5621  0018 9f            	ld	a,xl
5622  0019 1a02          	or	a,(OFST+1,sp)
5625  001b 85            	popw	x
5626  001c 87            	retf	
5664                     ; 2217 static uint8_t Bcd2ToByte(uint8_t Value)
5664                     ; 2218 {
5665                     .text:	section	.text,new
5666  0000               L5f_Bcd2ToByte:
5668  0000 88            	push	a
5669  0001 88            	push	a
5670       00000001      OFST:	set	1
5673                     ; 2219   uint8_t tmp = 0;
5675                     ; 2221   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
5677  0002 4e            	swap	a
5678  0003 a40f          	and	a,#15
5679  0005 97            	ld	xl,a
5680  0006 a60a          	ld	a,#10
5681  0008 42            	mul	x,a
5682  0009 9f            	ld	a,xl
5683  000a 6b01          	ld	(OFST+0,sp),a
5684                     ; 2223   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
5686  000c 7b02          	ld	a,(OFST+1,sp)
5687  000e a40f          	and	a,#15
5688  0010 1b01          	add	a,(OFST+0,sp)
5691  0012 85            	popw	x
5692  0013 87            	retf	
5704                     	xdef	f_RTC_ClearITPendingBit
5705                     	xdef	f_RTC_GetITStatus
5706                     	xdef	f_RTC_ClearFlag
5707                     	xdef	f_RTC_GetFlagStatus
5708                     	xdef	f_RTC_ITConfig
5709                     	xdef	f_RTC_TamperCmd
5710                     	xdef	f_RTC_TamperPinsPrechargeDuration
5711                     	xdef	f_RTC_TamperSamplingFreqConfig
5712                     	xdef	f_RTC_TamperFilterConfig
5713                     	xdef	f_RTC_TamperLevelConfig
5714                     	xdef	f_RTC_CalibOutputCmd
5715                     	xdef	f_RTC_CalibOutputConfig
5716                     	xdef	f_RTC_SmoothCalibConfig
5717                     	xdef	f_RTC_SynchroShiftConfig
5718                     	xdef	f_RTC_OutputConfig
5719                     	xdef	f_RTC_GetStoreOperation
5720                     	xdef	f_RTC_DayLightSavingConfig
5721                     	xdef	f_RTC_WakeUpCmd
5722                     	xdef	f_RTC_GetWakeUpCounter
5723                     	xdef	f_RTC_SetWakeUpCounter
5724                     	xdef	f_RTC_WakeUpClockConfig
5725                     	xdef	f_RTC_AlarmSubSecondConfig
5726                     	xdef	f_RTC_AlarmCmd
5727                     	xdef	f_RTC_GetAlarm
5728                     	xdef	f_RTC_AlarmStructInit
5729                     	xdef	f_RTC_SetAlarm
5730                     	xdef	f_RTC_GetDate
5731                     	xdef	f_RTC_DateStructInit
5732                     	xdef	f_RTC_SetDate
5733                     	xdef	f_RTC_GetSubSecond
5734                     	xdef	f_RTC_GetTime
5735                     	xdef	f_RTC_TimeStructInit
5736                     	xdef	f_RTC_SetTime
5737                     	xdef	f_RTC_BypassShadowCmd
5738                     	xdef	f_RTC_RatioCmd
5739                     	xdef	f_RTC_WaitForSynchro
5740                     	xdef	f_RTC_ExitInitMode
5741                     	xdef	f_RTC_EnterInitMode
5742                     	xdef	f_RTC_WriteProtectionCmd
5743                     	xdef	f_RTC_StructInit
5744                     	xdef	f_RTC_Init
5745                     	xdef	f_RTC_DeInit
5764                     	end
