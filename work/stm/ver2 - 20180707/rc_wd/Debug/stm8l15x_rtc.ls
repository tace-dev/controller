   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  98                     ; 229 ErrorStatus RTC_DeInit(void)
  98                     ; 230 {
 100                     	switch	.text
 101  0000               _RTC_DeInit:
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
 124  000f cd0134        	call	_RTC_EnterInitMode
 126  0012 4d            	tnz	a
 127  0013 260b          	jrne	L74
 128                     ; 242     status = ERROR;
 130  0015               LC002:
 132  0015 6b01          	ld	(OFST-4,sp),a
 133                     ; 244     RTC->WPR = 0xFF; 
 136  0017               L15:
 139  0017 35ff5159      	mov	20825,#255
 140                     ; 340   return (ErrorStatus)status;
 142  001b 7b01          	ld	a,(OFST-4,sp)
 145  001d 5b05          	addw	sp,#5
 146  001f 81            	ret	
 147  0020               L74:
 148                     ; 249     RTC->TR1 = RTC_TR1_RESET_VALUE;
 150  0020 725f5140      	clr	20800
 151                     ; 250     RTC->TR2 = RTC_TR2_RESET_VALUE;
 153  0024 725f5141      	clr	20801
 154                     ; 251     RTC->TR3 = RTC_TR3_RESET_VALUE;
 156  0028 725f5142      	clr	20802
 157                     ; 254     RTC->DR1 = RTC_DR1_RESET_VALUE;
 159  002c 35015144      	mov	20804,#1
 160                     ; 255     RTC->DR2 = RTC_DR2_RESET_VALUE;
 162  0030 35215145      	mov	20805,#33
 163                     ; 256     RTC->DR3 = RTC_DR3_RESET_VALUE;
 165  0034 725f5146      	clr	20806
 166                     ; 259     RTC->SPRERH = RTC_SPRERH_RESET_VALUE;
 168  0038 725f5150      	clr	20816
 169                     ; 260     RTC->SPRERL = RTC_SPRERL_RESET_VALUE;
 171  003c 35ff5151      	mov	20817,#255
 172                     ; 261     RTC->APRER  = RTC_APRER_RESET_VALUE;
 174  0040 357f5152      	mov	20818,#127
 175                     ; 263     RTC->TCR1 = RTC_TCR1_RESET_VALUE;
 177  0044 725f516c      	clr	20844
 178                     ; 264     RTC->TCR2 = RTC_TCR2_RESET_VALUE;
 180  0048 725f516d      	clr	20845
 181                     ; 268     RTC->CR1 = RTC_CR1_RESET_VALUE;
 183  004c 725f5148      	clr	20808
 184                     ; 269     RTC->CR2 = RTC_CR2_RESET_VALUE;
 186  0050 725f5149      	clr	20809
 187                     ; 270     RTC->CR3 = RTC_CR3_RESET_VALUE;
 189  0054 725f514a      	clr	20810
 191  0058 2007          	jra	L75
 192  005a               L35:
 193                     ; 275       wutwfcount++;
 195  005a 5c            	incw	x
 196  005b 1f02          	ldw	(OFST-3,sp),x
 197                     ; 276       RTC->ISR1 = 0;
 199  005d 725f514c      	clr	20812
 200  0061               L75:
 201                     ; 273     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
 203  0061 7204514c07    	btjt	20812,#2,L36
 205  0066 1e02          	ldw	x,(OFST-3,sp)
 206  0068 a3ffff        	cpw	x,#65535
 207  006b 26ed          	jrne	L35
 208  006d               L36:
 209                     ; 279     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
 211  006d 7204514c02    	btjt	20812,#2,L56
 212                     ; 281       status = ERROR;
 213                     ; 283       RTC->WPR = 0xFF; 
 215  0072 2061          	jp	L301
 216  0074               L56:
 217                     ; 288       RTC->CR1 = RTC_CR1_RESET_VALUE;
 219  0074 725f5148      	clr	20808
 220                     ; 291       RTC->WUTRH = RTC_WUTRH_RESET_VALUE;
 222  0078 35ff5154      	mov	20820,#255
 223                     ; 292       RTC->WUTRL = RTC_WUTRL_RESET_VALUE;
 225  007c 35ff5155      	mov	20821,#255
 226                     ; 295       RTC->ALRMAR1 = RTC_ALRMAR1_RESET_VALUE;
 228  0080 725f515c      	clr	20828
 229                     ; 296       RTC->ALRMAR2 = RTC_ALRMAR2_RESET_VALUE;
 231  0084 725f515d      	clr	20829
 232                     ; 297       RTC->ALRMAR3 = RTC_ALRMAR3_RESET_VALUE;
 234  0088 725f515e      	clr	20830
 235                     ; 298       RTC->ALRMAR4 = RTC_ALRMAR4_RESET_VALUE;
 237  008c 725f515f      	clr	20831
 238                     ; 300       RTC->ALRMASSRH = RTC_ALRMASSRH_RESET_VALUE;
 240  0090 725f5164      	clr	20836
 241                     ; 301       RTC->ALRMASSRL = RTC_ALRMASSRL_RESET_VALUE;
 243  0094 725f5165      	clr	20837
 244                     ; 302       RTC->ALRMASSMSKR = RTC_ALRMASSMSKR_RESET_VALUE;
 246  0098 725f5166      	clr	20838
 247                     ; 305       RTC->ISR1 = (uint8_t)0x00;
 249  009c 725f514c      	clr	20812
 250                     ; 306       RTC->ISR2 = RTC_ISR2_RESET_VALUE;
 252  00a0 725f514d      	clr	20813
 253                     ; 308       if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
 255  00a4 7203514c11    	btjf	20812,#1,L17
 257  00a9 2003          	jra	L57
 258  00ab               L37:
 259                     ; 312           recalpfcount++;
 261  00ab 5c            	incw	x
 262  00ac 1f04          	ldw	(OFST-1,sp),x
 263  00ae               L57:
 264                     ; 310         while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
 266  00ae 7203514c07    	btjf	20812,#1,L17
 268  00b3 1e04          	ldw	x,(OFST-1,sp)
 269  00b5 a3ffff        	cpw	x,#65535
 270  00b8 26f1          	jrne	L37
 271  00ba               L17:
 272                     ; 315       if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
 274  00ba 7202514c16    	btjt	20812,#1,L301
 275                     ; 317         RTC->CALRH = RTC_CALRH_RESET_VALUE;
 277  00bf 725f516a      	clr	20842
 278                     ; 318         RTC->CALRL = RTC_CALRL_RESET_VALUE;
 280  00c3 725f516b      	clr	20843
 281                     ; 320         if (RTC_WaitForSynchro() == ERROR)
 283  00c7 cd0163        	call	_RTC_WaitForSynchro
 285  00ca 4d            	tnz	a
 286                     ; 322           status = ERROR;
 288  00cb 2603cc0015    	jreq	LC002
 289                     ; 326           status = SUCCESS;
 291  00d0 a601          	ld	a,#1
 292  00d2 cc0015        	jp	LC002
 293  00d5               L301:
 294                     ; 331         status = ERROR;
 297  00d5 0f01          	clr	(OFST-4,sp)
 298                     ; 335       RTC->WPR = 0xFF; 
 299  00d7 cc0017        	jra	L15
 399                     ; 356 ErrorStatus RTC_Init(RTC_InitTypeDef* RTC_InitStruct)
 399                     ; 357 {
 400                     	switch	.text
 401  00da               _RTC_Init:
 403  00da 89            	pushw	x
 404  00db 88            	push	a
 405       00000001      OFST:	set	1
 408                     ; 358   ErrorStatus status = ERROR;
 410                     ; 361   assert_param(IS_RTC_HOUR_FORMAT(RTC_InitStruct->RTC_HourFormat));
 412                     ; 362   assert_param(IS_RTC_ASYNCH_PREDIV(RTC_InitStruct->RTC_AsynchPrediv));
 414                     ; 363   assert_param(IS_RTC_SYNCH_PREDIV(RTC_InitStruct->RTC_SynchPrediv));
 416                     ; 366   RTC->WPR = 0xCA;
 418  00dc 35ca5159      	mov	20825,#202
 419                     ; 367   RTC->WPR = 0x53;
 421  00e0 35535159      	mov	20825,#83
 422                     ; 370   if (RTC_EnterInitMode() == ERROR)
 424  00e4 ad4e          	call	_RTC_EnterInitMode
 426  00e6 4d            	tnz	a
 427                     ; 372     status = ERROR;
 430  00e7 2727          	jreq	L561
 431                     ; 377     RTC->CR1 &= ((uint8_t)~( RTC_CR1_FMT ));
 433  00e9 721d5148      	bres	20808,#6
 434                     ; 380     RTC->CR1 |=  ((uint8_t)(RTC_InitStruct->RTC_HourFormat));
 436  00ed 1e02          	ldw	x,(OFST+1,sp)
 437  00ef c65148        	ld	a,20808
 438  00f2 fa            	or	a,(x)
 439  00f3 c75148        	ld	20808,a
 440                     ; 383     RTC->SPRERH = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv >> 8);
 442  00f6 ee02          	ldw	x,(2,x)
 443  00f8 4f            	clr	a
 444  00f9 01            	rrwa	x,a
 445  00fa 9f            	ld	a,xl
 446  00fb c75150        	ld	20816,a
 447                     ; 384     RTC->SPRERL = (uint8_t)(RTC_InitStruct->RTC_SynchPrediv);
 449  00fe 1e02          	ldw	x,(OFST+1,sp)
 450  0100 e603          	ld	a,(3,x)
 451  0102 c75151        	ld	20817,a
 452                     ; 385     RTC->APRER =  (uint8_t)(RTC_InitStruct->RTC_AsynchPrediv);
 454  0105 e601          	ld	a,(1,x)
 455  0107 c75152        	ld	20818,a
 456                     ; 388     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 458  010a 721f514c      	bres	20812,#7
 459                     ; 390     status = SUCCESS;
 461  010e a601          	ld	a,#1
 462  0110               L561:
 463                     ; 394   RTC->WPR = 0xFF; 
 465  0110 35ff5159      	mov	20825,#255
 466                     ; 397   return (ErrorStatus)(status);
 470  0114 5b03          	addw	sp,#3
 471  0116 81            	ret	
 508                     ; 407 void RTC_StructInit(RTC_InitTypeDef* RTC_InitStruct)
 508                     ; 408 {
 509                     	switch	.text
 510  0117               _RTC_StructInit:
 514                     ; 410   RTC_InitStruct->RTC_HourFormat = RTC_HourFormat_24;
 516  0117 7f            	clr	(x)
 517                     ; 413   RTC_InitStruct->RTC_AsynchPrediv = RTC_APRER_RESET_VALUE;
 519  0118 a67f          	ld	a,#127
 520  011a e701          	ld	(1,x),a
 521                     ; 416   RTC_InitStruct->RTC_SynchPrediv = RTC_SPRERL_RESET_VALUE;
 523  011c 90ae00ff      	ldw	y,#255
 524  0120 ef02          	ldw	(2,x),y
 525                     ; 417 }
 528  0122 81            	ret	
 584                     ; 427 void RTC_WriteProtectionCmd(FunctionalState NewState)
 584                     ; 428 {
 585                     	switch	.text
 586  0123               _RTC_WriteProtectionCmd:
 590                     ; 430   assert_param(IS_FUNCTIONAL_STATE(NewState));
 592                     ; 432   if (NewState != DISABLE)
 594  0123 4d            	tnz	a
 595  0124 2705          	jreq	L532
 596                     ; 435     RTC->WPR = RTC_WPR_EnableKey;
 598  0126 35ff5159      	mov	20825,#255
 601  012a 81            	ret	
 602  012b               L532:
 603                     ; 440     RTC->WPR = RTC_WPR_DisableKey1;
 605  012b 35ca5159      	mov	20825,#202
 606                     ; 441     RTC->WPR = RTC_WPR_DisableKey2;
 608  012f 35535159      	mov	20825,#83
 609                     ; 443 }
 612  0133 81            	ret	
 655                     ; 455 ErrorStatus RTC_EnterInitMode(void)
 655                     ; 456 {
 656                     	switch	.text
 657  0134               _RTC_EnterInitMode:
 659  0134 5203          	subw	sp,#3
 660       00000003      OFST:	set	3
 663                     ; 457   ErrorStatus status = ERROR;
 665                     ; 458   uint16_t initfcount = 0;
 667  0136 5f            	clrw	x
 668  0137 1f02          	ldw	(OFST-1,sp),x
 669                     ; 461   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 671  0139 720c514c13    	btjt	20812,#6,L162
 672                     ; 464     RTC->ISR1 = (uint8_t)RTC_ISR1_INIT;
 674  013e 3580514c      	mov	20812,#128
 676  0142 2003          	jra	L762
 677  0144               L362:
 678                     ; 469       initfcount++;
 680  0144 5c            	incw	x
 681  0145 1f02          	ldw	(OFST-1,sp),x
 682  0147               L762:
 683                     ; 467     while (((RTC->ISR1 & RTC_ISR1_INITF) == RESET) && ( initfcount != INITF_TIMEOUT))
 685  0147 720c514c05    	btjt	20812,#6,L162
 687  014c a3ffff        	cpw	x,#65535
 688  014f 26f3          	jrne	L362
 689  0151               L162:
 690                     ; 473   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
 692  0151 720c514c03    	btjt	20812,#6,L572
 693                     ; 475     status = ERROR;
 695  0156 4f            	clr	a
 697  0157 2002          	jra	L772
 698  0159               L572:
 699                     ; 479     status = SUCCESS;
 701  0159 a601          	ld	a,#1
 702  015b               L772:
 703                     ; 482   return (ErrorStatus)status;
 707  015b 5b03          	addw	sp,#3
 708  015d 81            	ret	
 731                     ; 495 void RTC_ExitInitMode(void)
 731                     ; 496 {
 732                     	switch	.text
 733  015e               _RTC_ExitInitMode:
 737                     ; 498   RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
 739  015e 721f514c      	bres	20812,#7
 740                     ; 499 }
 743  0162 81            	ret	
 786                     ; 524 ErrorStatus RTC_WaitForSynchro(void)
 786                     ; 525 {
 787                     	switch	.text
 788  0163               _RTC_WaitForSynchro:
 790  0163 5203          	subw	sp,#3
 791       00000003      OFST:	set	3
 794                     ; 526   uint16_t rsfcount = 0;
 796  0165 5f            	clrw	x
 797  0166 1f02          	ldw	(OFST-1,sp),x
 798                     ; 527   ErrorStatus status = ERROR;
 800                     ; 530   RTC->WPR = 0xCA;
 802  0168 35ca5159      	mov	20825,#202
 803                     ; 531   RTC->WPR = 0x53;
 805  016c 35535159      	mov	20825,#83
 806                     ; 534   RTC->ISR1 &= (uint8_t)~(RTC_ISR1_RSF | RTC_ISR1_INIT);
 808  0170 c6514c        	ld	a,20812
 809  0173 a45f          	and	a,#95
 810  0175 c7514c        	ld	20812,a
 812  0178 2003          	jra	L333
 813  017a               L133:
 814                     ; 539     rsfcount++;
 816  017a 5c            	incw	x
 817  017b 1f02          	ldw	(OFST-1,sp),x
 818  017d               L333:
 819                     ; 537   while (((RTC->ISR1 & RTC_ISR1_RSF) == RESET) && ( rsfcount != RSF_TIMEOUT))
 821  017d 720a514c05    	btjt	20812,#5,L733
 823  0182 a3ffff        	cpw	x,#65535
 824  0185 26f3          	jrne	L133
 825  0187               L733:
 826                     ; 543   if ((RTC->ISR1 & RTC_ISR1_RSF) != RESET)
 828  0187 720b514c06    	btjf	20812,#5,L143
 829                     ; 545     status = SUCCESS;
 831  018c a601          	ld	a,#1
 832  018e 6b01          	ld	(OFST-2,sp),a
 834  0190 2002          	jra	L343
 835  0192               L143:
 836                     ; 549     status = ERROR;
 838  0192 0f01          	clr	(OFST-2,sp)
 839  0194               L343:
 840                     ; 553   RTC->WPR = 0xFF; 
 842  0194 35ff5159      	mov	20825,#255
 843                     ; 555   return (ErrorStatus)status;
 845  0198 7b01          	ld	a,(OFST-2,sp)
 848  019a 5b03          	addw	sp,#3
 849  019c 81            	ret	
 884                     ; 565 void RTC_RatioCmd(FunctionalState NewState)
 884                     ; 566 {
 885                     	switch	.text
 886  019d               _RTC_RatioCmd:
 890                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
 892                     ; 571   RTC->WPR = 0xCA;
 894  019d 35ca5159      	mov	20825,#202
 895                     ; 572   RTC->WPR = 0x53;
 897  01a1 35535159      	mov	20825,#83
 898                     ; 574   if (NewState != DISABLE)
 900  01a5 4d            	tnz	a
 901  01a6 2706          	jreq	L363
 902                     ; 577     RTC->CR1 |= (uint8_t)RTC_CR1_RATIO;
 904  01a8 721a5148      	bset	20808,#5
 906  01ac 2004          	jra	L563
 907  01ae               L363:
 908                     ; 582     RTC->CR1 &= (uint8_t)~RTC_CR1_RATIO;
 910  01ae 721b5148      	bres	20808,#5
 911  01b2               L563:
 912                     ; 586   RTC->WPR = 0xFF; 
 914  01b2 35ff5159      	mov	20825,#255
 915                     ; 587 }
 918  01b6 81            	ret	
 954                     ; 595 void RTC_BypassShadowCmd(FunctionalState NewState)
 954                     ; 596 {
 955                     	switch	.text
 956  01b7               _RTC_BypassShadowCmd:
 960                     ; 598   assert_param(IS_FUNCTIONAL_STATE(NewState));
 962                     ; 601   RTC->WPR = 0xCA;
 964  01b7 35ca5159      	mov	20825,#202
 965                     ; 602   RTC->WPR = 0x53;
 967  01bb 35535159      	mov	20825,#83
 968                     ; 604   if (NewState != DISABLE)
 970  01bf 4d            	tnz	a
 971  01c0 2706          	jreq	L504
 972                     ; 607     RTC->CR1 |= (uint8_t)RTC_CR1_BYPSHAD;
 974  01c2 72185148      	bset	20808,#4
 976  01c6 2004          	jra	L704
 977  01c8               L504:
 978                     ; 612     RTC->CR1 &= (uint8_t)~RTC_CR1_BYPSHAD;
 980  01c8 72195148      	bres	20808,#4
 981  01cc               L704:
 982                     ; 616   RTC->WPR = 0xFF; 
 984  01cc 35ff5159      	mov	20825,#255
 985                     ; 617 }
 988  01d0 81            	ret	
1134                     ; 656 ErrorStatus RTC_SetTime(RTC_Format_TypeDef RTC_Format,
1134                     ; 657                         RTC_TimeTypeDef* RTC_TimeStruct)
1134                     ; 658 {
1135                     	switch	.text
1136  01d1               _RTC_SetTime:
1138  01d1 88            	push	a
1139  01d2 88            	push	a
1140       00000001      OFST:	set	1
1143                     ; 659   ErrorStatus status = ERROR;
1145                     ; 660   uint8_t temp = 0;
1147                     ; 663   assert_param(IS_RTC_FORMAT(RTC_Format));
1149                     ; 665   if (RTC_Format == RTC_Format_BIN)
1151                     ; 668     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1152                     ; 670       assert_param(IS_RTC_HOUR12_MAX(RTC_TimeStruct->RTC_Hours));
1154                     ; 671       assert_param(IS_RTC_HOUR12_MIN(RTC_TimeStruct->RTC_Hours));
1157                     ; 675       assert_param(IS_RTC_HOUR24(RTC_TimeStruct->RTC_Hours));
1159                     ; 677     assert_param(IS_RTC_MINUTES(RTC_TimeStruct->RTC_Minutes));
1161                     ; 678     assert_param(IS_RTC_SECONDS(RTC_TimeStruct->RTC_Seconds));
1164                     ; 683     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1166                     ; 685       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1168                     ; 686       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1172  01d3 c65148        	ld	a,20808
1173                     ; 690       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_TimeStruct->RTC_Hours)));
1175                     ; 692     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_TimeStruct->RTC_Minutes)));
1177                     ; 693     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_TimeStruct->RTC_Seconds)));
1179                     ; 698   RTC->WPR = 0xCA;
1181  01d6 35ca5159      	mov	20825,#202
1182                     ; 699   RTC->WPR = 0x53;
1184  01da 35535159      	mov	20825,#83
1185                     ; 702   if (RTC_EnterInitMode() == ERROR)
1187  01de cd0134        	call	_RTC_EnterInitMode
1189  01e1 4d            	tnz	a
1190  01e2 2606          	jrne	L515
1191                     ; 704     status = ERROR;
1193                     ; 706     RTC->WPR = 0xFF; 
1195  01e4 35ff5159      	mov	20825,#255
1197  01e8 2059          	jra	L715
1198  01ea               L515:
1199                     ; 711     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
1201  01ea 720d514808    	btjf	20808,#6,L125
1202                     ; 713       assert_param(IS_RTC_H12(RTC_TimeStruct->RTC_H12));
1204                     ; 714       temp = RTC_TimeStruct->RTC_H12;
1206  01ef 1e05          	ldw	x,(OFST+4,sp)
1207  01f1 e603          	ld	a,(3,x)
1208  01f3 6b01          	ld	(OFST+0,sp),a
1210  01f5 2002          	jra	L325
1211  01f7               L125:
1212                     ; 718       temp = 0;
1214  01f7 0f01          	clr	(OFST+0,sp)
1215  01f9               L325:
1216                     ; 721     if (RTC_Format != RTC_Format_BIN)
1218  01f9 7b02          	ld	a,(OFST+1,sp)
1219  01fb 270f          	jreq	L525
1220                     ; 723       RTC->TR1 = (uint8_t)(RTC_TimeStruct->RTC_Seconds);
1222  01fd 1e05          	ldw	x,(OFST+4,sp)
1223  01ff e602          	ld	a,(2,x)
1224  0201 c75140        	ld	20800,a
1225                     ; 724       RTC->TR2 = (uint8_t)(RTC_TimeStruct->RTC_Minutes) ;
1227  0204 e601          	ld	a,(1,x)
1228  0206 c75141        	ld	20801,a
1229                     ; 725       RTC->TR3 = (uint8_t)( temp | RTC_TimeStruct->RTC_Hours) ;
1231  0209 f6            	ld	a,(x)
1233  020a 201a          	jra	L725
1234  020c               L525:
1235                     ; 729       RTC->TR1 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Seconds));
1237  020c 1e05          	ldw	x,(OFST+4,sp)
1238  020e e602          	ld	a,(2,x)
1239  0210 cd082b        	call	L3_ByteToBcd2
1241  0213 c75140        	ld	20800,a
1242                     ; 730       RTC->TR2 = (uint8_t)(ByteToBcd2(RTC_TimeStruct->RTC_Minutes)) ;
1244  0216 1e05          	ldw	x,(OFST+4,sp)
1245  0218 e601          	ld	a,(1,x)
1246  021a cd082b        	call	L3_ByteToBcd2
1248  021d c75141        	ld	20801,a
1249                     ; 731       RTC->TR3 = (uint8_t)( temp | ByteToBcd2(RTC_TimeStruct->RTC_Hours));
1251  0220 1e05          	ldw	x,(OFST+4,sp)
1252  0222 f6            	ld	a,(x)
1253  0223 cd082b        	call	L3_ByteToBcd2
1255  0226               L725:
1256  0226 1a01          	or	a,(OFST+0,sp)
1257  0228 c75142        	ld	20802,a
1258                     ; 734     (void)(RTC->DR3);
1260  022b c65146        	ld	a,20806
1261                     ; 737     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1263  022e 721f514c      	bres	20812,#7
1264                     ; 740     RTC->WPR = 0xFF; 
1266  0232 35ff5159      	mov	20825,#255
1267                     ; 743     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1269  0236 7208514806    	btjt	20808,#4,L135
1270                     ; 745       if (RTC_WaitForSynchro() == ERROR)
1272  023b cd0163        	call	_RTC_WaitForSynchro
1274  023e 4d            	tnz	a
1275                     ; 747         status = ERROR;
1278  023f 2702          	jreq	L715
1279                     ; 751         status = SUCCESS;
1280  0241               L135:
1281                     ; 756       status = SUCCESS;
1284  0241 a601          	ld	a,#1
1285  0243               L715:
1286                     ; 760   return (ErrorStatus)status;
1290  0243 85            	popw	x
1291  0244 81            	ret	
1328                     ; 772 void RTC_TimeStructInit(RTC_TimeTypeDef* RTC_TimeStruct)
1328                     ; 773 {
1329                     	switch	.text
1330  0245               _RTC_TimeStructInit:
1334                     ; 775   RTC_TimeStruct->RTC_H12 = RTC_H12_AM;
1336  0245 6f03          	clr	(3,x)
1337                     ; 776   RTC_TimeStruct->RTC_Hours = 0;
1339  0247 7f            	clr	(x)
1340                     ; 777   RTC_TimeStruct->RTC_Minutes = 0;
1342  0248 6f01          	clr	(1,x)
1343                     ; 778   RTC_TimeStruct->RTC_Seconds = 0;
1345  024a 6f02          	clr	(2,x)
1346                     ; 779 }
1349  024c 81            	ret	
1404                     ; 795 void RTC_GetTime(RTC_Format_TypeDef RTC_Format,
1404                     ; 796                  RTC_TimeTypeDef* RTC_TimeStruct)
1404                     ; 797 {
1405                     	switch	.text
1406  024d               _RTC_GetTime:
1408  024d 88            	push	a
1409  024e 88            	push	a
1410       00000001      OFST:	set	1
1413                     ; 798   uint8_t  tmpreg = 0;
1415                     ; 801   assert_param(IS_RTC_FORMAT(RTC_Format));
1417                     ; 805   RTC_TimeStruct->RTC_Seconds = RTC->TR1;
1419  024f 1e05          	ldw	x,(OFST+4,sp)
1420  0251 c65140        	ld	a,20800
1421  0254 e702          	ld	(2,x),a
1422                     ; 808   RTC_TimeStruct->RTC_Minutes = RTC->TR2;
1424  0256 c65141        	ld	a,20801
1425  0259 e701          	ld	(1,x),a
1426                     ; 811   tmpreg = (uint8_t)RTC->TR3;
1428  025b c65142        	ld	a,20802
1429  025e 6b01          	ld	(OFST+0,sp),a
1430                     ; 814   (void) (RTC->DR3) ;
1432  0260 c65146        	ld	a,20806
1433                     ; 818   RTC_TimeStruct->RTC_Hours = (uint8_t)(tmpreg & (uint8_t)~(RTC_TR3_PM));
1435  0263 7b01          	ld	a,(OFST+0,sp)
1436  0265 a4bf          	and	a,#191
1437  0267 f7            	ld	(x),a
1438                     ; 821   RTC_TimeStruct->RTC_H12 = (RTC_H12_TypeDef)(tmpreg & RTC_TR3_PM);
1440  0268 7b01          	ld	a,(OFST+0,sp)
1441  026a a440          	and	a,#64
1442  026c e703          	ld	(3,x),a
1443                     ; 824   if (RTC_Format == RTC_Format_BIN)
1445  026e 7b02          	ld	a,(OFST+1,sp)
1446  0270 2619          	jrne	L706
1447                     ; 827     RTC_TimeStruct->RTC_Hours = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Hours);
1449  0272 f6            	ld	a,(x)
1450  0273 cd0848        	call	L5_Bcd2ToByte
1452  0276 1e05          	ldw	x,(OFST+4,sp)
1453  0278 f7            	ld	(x),a
1454                     ; 828     RTC_TimeStruct->RTC_Minutes = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Minutes);
1456  0279 e601          	ld	a,(1,x)
1457  027b cd0848        	call	L5_Bcd2ToByte
1459  027e 1e05          	ldw	x,(OFST+4,sp)
1460  0280 e701          	ld	(1,x),a
1461                     ; 829     RTC_TimeStruct->RTC_Seconds = (uint8_t)Bcd2ToByte(RTC_TimeStruct->RTC_Seconds);
1463  0282 e602          	ld	a,(2,x)
1464  0284 cd0848        	call	L5_Bcd2ToByte
1466  0287 1e05          	ldw	x,(OFST+4,sp)
1467  0289 e702          	ld	(2,x),a
1468  028b               L706:
1469                     ; 831 }
1472  028b 85            	popw	x
1473  028c 81            	ret	
1519                     ; 842 uint16_t RTC_GetSubSecond(void)
1519                     ; 843 {
1520                     	switch	.text
1521  028d               _RTC_GetSubSecond:
1523  028d 5206          	subw	sp,#6
1524       00000006      OFST:	set	6
1527                     ; 844   uint8_t ssrhreg = 0, ssrlreg = 0;
1531                     ; 845   uint16_t ssrreg = 0;
1533                     ; 848   ssrhreg = RTC->SSRH;
1535  028f c65157        	ld	a,20823
1536  0292 6b03          	ld	(OFST-3,sp),a
1537                     ; 849   ssrlreg = RTC->SSRL;
1539  0294 c65158        	ld	a,20824
1540  0297 6b04          	ld	(OFST-2,sp),a
1541                     ; 852   (void) (RTC->DR3);
1543  0299 c65146        	ld	a,20806
1544                     ; 855   ssrreg = (uint16_t)((uint16_t)((uint16_t)ssrhreg << 8) | (uint16_t)(ssrlreg));
1546  029c 7b04          	ld	a,(OFST-2,sp)
1547  029e 5f            	clrw	x
1548  029f 97            	ld	xl,a
1549  02a0 1f01          	ldw	(OFST-5,sp),x
1550  02a2 5f            	clrw	x
1551  02a3 7b03          	ld	a,(OFST-3,sp)
1552  02a5 97            	ld	xl,a
1553  02a6 7b02          	ld	a,(OFST-4,sp)
1554  02a8 01            	rrwa	x,a
1555  02a9 1a01          	or	a,(OFST-5,sp)
1556  02ab 01            	rrwa	x,a
1557                     ; 856   return (uint16_t)(ssrreg);
1561  02ac 5b06          	addw	sp,#6
1562  02ae 81            	ret	
1814                     ; 873 ErrorStatus RTC_SetDate(RTC_Format_TypeDef RTC_Format,
1814                     ; 874                         RTC_DateTypeDef* RTC_DateStruct)
1814                     ; 875 {
1815                     	switch	.text
1816  02af               _RTC_SetDate:
1818  02af 88            	push	a
1819  02b0 89            	pushw	x
1820       00000002      OFST:	set	2
1823                     ; 876   ErrorStatus status = ERROR;
1825                     ; 878   if ((RTC_Format == RTC_Format_BIN) && ((RTC_DateStruct->RTC_Month & TEN_VALUE_BCD) == TEN_VALUE_BCD))
1827  02b1 4d            	tnz	a
1828  02b2 2610          	jrne	L757
1830  02b4 1e06          	ldw	x,(OFST+4,sp)
1831  02b6 e601          	ld	a,(1,x)
1832  02b8 a410          	and	a,#16
1833  02ba 2708          	jreq	L757
1834                     ; 880     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)((RTC_DateStruct->RTC_Month & (uint8_t)~(TEN_VALUE_BCD)) + TEN_VALUE_BIN);
1836  02bc e601          	ld	a,(1,x)
1837  02be a4ef          	and	a,#239
1838  02c0 ab0a          	add	a,#10
1839  02c2 e701          	ld	(1,x),a
1840  02c4               L757:
1841                     ; 884   assert_param(IS_RTC_FORMAT(RTC_Format));
1843                     ; 885   if (RTC_Format == RTC_Format_BIN)
1845                     ; 887     assert_param(IS_RTC_YEAR(RTC_DateStruct->RTC_Year));
1847                     ; 888     assert_param(IS_RTC_MONTH_MIN(RTC_DateStruct->RTC_Month));
1849                     ; 889     assert_param(IS_RTC_MONTH_MAX(RTC_DateStruct->RTC_Month));
1851                     ; 890     assert_param(IS_RTC_DATE_MIN(RTC_DateStruct->RTC_Date));
1853                     ; 891     assert_param(IS_RTC_DATE_MAX(RTC_DateStruct->RTC_Date));
1856                     ; 895     assert_param(IS_RTC_YEAR(Bcd2ToByte(RTC_DateStruct->RTC_Year)));
1858                     ; 896     assert_param(IS_RTC_MONTH_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1860                     ; 897     assert_param(IS_RTC_MONTH_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month)));
1862                     ; 898     assert_param(IS_RTC_DATE_MIN(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1864                     ; 899     assert_param(IS_RTC_DATE_MAX(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date)));
1866                     ; 901   assert_param(IS_RTC_WEEKDAY(RTC_DateStruct->RTC_WeekDay));
1868                     ; 904   RTC->WPR = 0xCA;
1870  02c4 35ca5159      	mov	20825,#202
1871                     ; 905   RTC->WPR = 0x53;
1873  02c8 35535159      	mov	20825,#83
1874                     ; 908   if (RTC_EnterInitMode() == ERROR)
1876  02cc cd0134        	call	_RTC_EnterInitMode
1878  02cf 4d            	tnz	a
1879  02d0 2606          	jrne	L567
1880                     ; 910     status = ERROR;
1882                     ; 912     RTC->WPR = 0xFF; 
1884  02d2 35ff5159      	mov	20825,#255
1886  02d6 205e          	jra	L767
1887  02d8               L567:
1888                     ; 916     (void)(RTC->TR1);
1890  02d8 c65140        	ld	a,20800
1891                     ; 919     if (RTC_Format != RTC_Format_BIN)
1893  02db 7b03          	ld	a,(OFST+1,sp)
1894  02dd 2718          	jreq	L177
1895                     ; 921       RTC->DR1 = (uint8_t)(RTC_DateStruct->RTC_Date);
1897  02df 1e06          	ldw	x,(OFST+4,sp)
1898  02e1 e602          	ld	a,(2,x)
1899  02e3 c75144        	ld	20804,a
1900                     ; 922       RTC->DR2 = (uint8_t)((RTC_DateStruct->RTC_Month) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
1902  02e6 f6            	ld	a,(x)
1903  02e7 97            	ld	xl,a
1904  02e8 a620          	ld	a,#32
1905  02ea 42            	mul	x,a
1906  02eb 9f            	ld	a,xl
1907  02ec 1e06          	ldw	x,(OFST+4,sp)
1908  02ee ea01          	or	a,(1,x)
1909  02f0 c75145        	ld	20805,a
1910                     ; 923       RTC->DR3 = (uint8_t)((RTC_DateStruct->RTC_Year));
1912  02f3 e603          	ld	a,(3,x)
1914  02f5 2027          	jra	L377
1915  02f7               L177:
1916                     ; 927       RTC->DR1 = (uint8_t)(ByteToBcd2 ((uint8_t)RTC_DateStruct->RTC_Date));
1918  02f7 1e06          	ldw	x,(OFST+4,sp)
1919  02f9 e602          	ld	a,(2,x)
1920  02fb cd082b        	call	L3_ByteToBcd2
1922  02fe c75144        	ld	20804,a
1923                     ; 928       RTC->DR2 = (uint8_t)((ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Month)) | (uint8_t)((RTC_DateStruct->RTC_WeekDay) << 5));
1925  0301 1e06          	ldw	x,(OFST+4,sp)
1926  0303 f6            	ld	a,(x)
1927  0304 97            	ld	xl,a
1928  0305 a620          	ld	a,#32
1929  0307 42            	mul	x,a
1930  0308 9f            	ld	a,xl
1931  0309 6b01          	ld	(OFST-1,sp),a
1932  030b 1e06          	ldw	x,(OFST+4,sp)
1933  030d e601          	ld	a,(1,x)
1934  030f cd082b        	call	L3_ByteToBcd2
1936  0312 1a01          	or	a,(OFST-1,sp)
1937  0314 c75145        	ld	20805,a
1938                     ; 929       RTC->DR3 = (uint8_t)(ByteToBcd2((uint8_t)RTC_DateStruct->RTC_Year));
1940  0317 1e06          	ldw	x,(OFST+4,sp)
1941  0319 e603          	ld	a,(3,x)
1942  031b cd082b        	call	L3_ByteToBcd2
1944  031e               L377:
1945  031e c75146        	ld	20806,a
1946                     ; 933     RTC->ISR1 &= (uint8_t)~RTC_ISR1_INIT;
1948  0321 721f514c      	bres	20812,#7
1949                     ; 936     RTC->WPR = 0xFF; 
1951  0325 35ff5159      	mov	20825,#255
1952                     ; 939     if ((RTC->CR1 & RTC_CR1_BYPSHAD) == RESET)
1954  0329 7208514806    	btjt	20808,#4,L577
1955                     ; 941       if (RTC_WaitForSynchro() == ERROR)
1957  032e cd0163        	call	_RTC_WaitForSynchro
1959  0331 4d            	tnz	a
1960                     ; 943         status = ERROR;
1963  0332 2702          	jreq	L767
1964                     ; 947         status = SUCCESS;
1965  0334               L577:
1966                     ; 952       status = SUCCESS;
1969  0334 a601          	ld	a,#1
1970  0336               L767:
1971                     ; 956   return (ErrorStatus)status;
1975  0336 5b03          	addw	sp,#3
1976  0338 81            	ret	
2013                     ; 965 void RTC_DateStructInit(RTC_DateTypeDef* RTC_DateStruct)
2013                     ; 966 {
2014                     	switch	.text
2015  0339               _RTC_DateStructInit:
2019                     ; 968   RTC_DateStruct->RTC_WeekDay = RTC_Weekday_Monday;
2021  0339 a601          	ld	a,#1
2022  033b f7            	ld	(x),a
2023                     ; 969   RTC_DateStruct->RTC_Date = 1;
2025  033c e702          	ld	(2,x),a
2026                     ; 970   RTC_DateStruct->RTC_Month = RTC_Month_January;
2028  033e e701          	ld	(1,x),a
2029                     ; 971   RTC_DateStruct->RTC_Year = 0;
2031  0340 6f03          	clr	(3,x)
2032                     ; 972 }
2035  0342 81            	ret	
2090                     ; 985 void RTC_GetDate(RTC_Format_TypeDef RTC_Format,
2090                     ; 986                  RTC_DateTypeDef* RTC_DateStruct)
2090                     ; 987 {
2091                     	switch	.text
2092  0343               _RTC_GetDate:
2094  0343 88            	push	a
2095  0344 88            	push	a
2096       00000001      OFST:	set	1
2099                     ; 988   uint8_t tmpreg = 0;
2101                     ; 991   assert_param(IS_RTC_FORMAT(RTC_Format));
2103                     ; 994   (void) (RTC->TR1) ;
2105  0345 c65140        	ld	a,20800
2106                     ; 995   RTC_DateStruct->RTC_Date = (uint8_t)(RTC->DR1);
2108  0348 1e05          	ldw	x,(OFST+4,sp)
2109  034a c65144        	ld	a,20804
2110  034d e702          	ld	(2,x),a
2111                     ; 996   tmpreg = (uint8_t)RTC->DR2;
2113  034f c65145        	ld	a,20805
2114  0352 6b01          	ld	(OFST+0,sp),a
2115                     ; 997   RTC_DateStruct->RTC_Year = (uint8_t)(RTC->DR3);
2117  0354 c65146        	ld	a,20806
2118  0357 e703          	ld	(3,x),a
2119                     ; 1000   RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)(tmpreg & (uint8_t)(RTC_DR2_MT | RTC_DR2_MU));
2121  0359 7b01          	ld	a,(OFST+0,sp)
2122  035b a41f          	and	a,#31
2123  035d e701          	ld	(1,x),a
2124                     ; 1001   RTC_DateStruct->RTC_WeekDay = (RTC_Weekday_TypeDef)((uint8_t)((uint8_t)tmpreg & (uint8_t)(RTC_DR2_WDU)) >> (uint8_t)5);
2126  035f 7b01          	ld	a,(OFST+0,sp)
2127  0361 4e            	swap	a
2128  0362 a40e          	and	a,#14
2129  0364 44            	srl	a
2130  0365 f7            	ld	(x),a
2131                     ; 1004   if (RTC_Format == RTC_Format_BIN)
2133  0366 7b02          	ld	a,(OFST+1,sp)
2134  0368 261b          	jrne	L3501
2135                     ; 1007     RTC_DateStruct->RTC_Year = (uint8_t)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Year);
2137  036a e603          	ld	a,(3,x)
2138  036c cd0848        	call	L5_Bcd2ToByte
2140  036f 1e05          	ldw	x,(OFST+4,sp)
2141  0371 e703          	ld	(3,x),a
2142                     ; 1008     RTC_DateStruct->RTC_Month = (RTC_Month_TypeDef)Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Month);
2144  0373 e601          	ld	a,(1,x)
2145  0375 cd0848        	call	L5_Bcd2ToByte
2147  0378 1e05          	ldw	x,(OFST+4,sp)
2148  037a e701          	ld	(1,x),a
2149                     ; 1009     RTC_DateStruct->RTC_Date = (uint8_t)(Bcd2ToByte((uint8_t)RTC_DateStruct->RTC_Date));
2151  037c e602          	ld	a,(2,x)
2152  037e cd0848        	call	L5_Bcd2ToByte
2154  0381 1e05          	ldw	x,(OFST+4,sp)
2155  0383 e702          	ld	(2,x),a
2156  0385               L3501:
2157                     ; 1011 }
2160  0385 85            	popw	x
2161  0386 81            	ret	
2302                     ; 1041 void RTC_SetAlarm(RTC_Format_TypeDef RTC_Format,
2302                     ; 1042                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2302                     ; 1043 {
2303                     	switch	.text
2304  0387               _RTC_SetAlarm:
2306  0387 88            	push	a
2307  0388 5205          	subw	sp,#5
2308       00000005      OFST:	set	5
2311                     ; 1044   uint8_t tmpreg1 = 0;
2313                     ; 1045   uint8_t tmpreg2 = 0;
2315                     ; 1046   uint8_t tmpreg3 = 0;
2317                     ; 1047   uint8_t tmpreg4 = 0;
2319                     ; 1050   assert_param(IS_RTC_ALARM_MASK(RTC_AlarmStruct->RTC_AlarmMask));
2321                     ; 1051   assert_param(IS_RTC_FORMAT(RTC_Format));
2323                     ; 1052   assert_param(IS_RTC_H12(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12));
2325                     ; 1053   assert_param(IS_RTC_ALARM_DATEWEEKDAY_SEL(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel));
2327                     ; 1056   if (RTC_Format == RTC_Format_BIN)
2329                     ; 1059     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2330                     ; 1061       assert_param(IS_RTC_HOUR12_MAX(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2332                     ; 1062       assert_param(IS_RTC_HOUR12_MIN(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2335                     ; 1066       assert_param(IS_RTC_HOUR24(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours));
2337                     ; 1068     assert_param(IS_RTC_MINUTES(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes));
2339                     ; 1069     assert_param(IS_RTC_SECONDS(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds));
2342                     ; 1074     if ((RTC->CR1 & RTC_CR1_FMT) != RESET)
2344                     ; 1076       assert_param(IS_RTC_HOUR12_MAX(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2346                     ; 1077       assert_param(IS_RTC_HOUR12_MIN(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2350  038a c65148        	ld	a,20808
2351                     ; 1081       assert_param(IS_RTC_HOUR24(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)));
2353                     ; 1084     assert_param(IS_RTC_MINUTES(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)));
2355                     ; 1086     assert_param(IS_RTC_SECONDS(Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)));
2357                     ; 1091   if ((RTC_AlarmStruct->RTC_AlarmMask & RTC_AlarmMask_DateWeekDay) == RESET )
2359                     ; 1093     if (RTC_AlarmStruct->RTC_AlarmDateWeekDaySel == RTC_AlarmDateWeekDaySel_WeekDay)
2361                     ; 1095       assert_param(IS_RTC_WEEKDAY(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2364                     ; 1099       assert_param(IS_RTC_DATE_MIN(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2366                     ; 1100       assert_param(IS_RTC_DATE_MAX(RTC_AlarmStruct->RTC_AlarmDateWeekDay));
2368                     ; 1105   RTC->WPR = 0xCA;
2370  038d 35ca5159      	mov	20825,#202
2371                     ; 1106   RTC->WPR = 0x53;
2373  0391 35535159      	mov	20825,#83
2374                     ; 1110   if (RTC_Format != RTC_Format_BIN)
2376  0395 7b06          	ld	a,(OFST+1,sp)
2377  0397 272d          	jreq	L3611
2378                     ; 1112     tmpreg1 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds) | \
2378                     ; 1113                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask) & (uint8_t)RTC_ALRMAR1_MSK1));
2380  0399 1e09          	ldw	x,(OFST+4,sp)
2381  039b e604          	ld	a,(4,x)
2382  039d a480          	and	a,#128
2383  039f ea02          	or	a,(2,x)
2384  03a1 6b02          	ld	(OFST-3,sp),a
2385                     ; 1115     tmpreg2 = (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes) | \
2385                     ; 1116                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2387  03a3 e604          	ld	a,(4,x)
2388  03a5 48            	sll	a
2389  03a6 a480          	and	a,#128
2390  03a8 ea01          	or	a,(1,x)
2391  03aa 6b03          	ld	(OFST-2,sp),a
2392                     ; 1118     tmpreg3 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours) | \
2392                     ; 1119                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2392                     ; 1120                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2394  03ac ad7e          	call	LC006
2395  03ae a480          	and	a,#128
2396  03b0 6b01          	ld	(OFST-4,sp),a
2397  03b2 e603          	ld	a,(3,x)
2398  03b4 fa            	or	a,(x)
2399  03b5 1a01          	or	a,(OFST-4,sp)
2400  03b7 6b04          	ld	(OFST-1,sp),a
2401                     ; 1122     tmpreg4 = (uint8_t)((uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDay) | \
2401                     ; 1123                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2401                     ; 1124                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)RTC_ALRMAR4_MSK4));
2403  03b9 ad71          	call	LC006
2404  03bb 48            	sll	a
2405  03bc a480          	and	a,#128
2406  03be 6b01          	ld	(OFST-4,sp),a
2407  03c0 e605          	ld	a,(5,x)
2408  03c2 ea06          	or	a,(6,x)
2410  03c4 2047          	jra	L5611
2411  03c6               L3611:
2412                     ; 1129     tmpreg1 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds)) | \
2412                     ; 1130                         (uint8_t)(RTC_AlarmStruct->RTC_AlarmMask & RTC_ALRMAR1_MSK1));
2414  03c6 1e09          	ldw	x,(OFST+4,sp)
2415  03c8 e604          	ld	a,(4,x)
2416  03ca a480          	and	a,#128
2417  03cc 6b01          	ld	(OFST-4,sp),a
2418  03ce e602          	ld	a,(2,x)
2419  03d0 cd082b        	call	L3_ByteToBcd2
2421  03d3 1a01          	or	a,(OFST-4,sp)
2422  03d5 6b02          	ld	(OFST-3,sp),a
2423                     ; 1132     tmpreg2 = (uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes)) | \
2423                     ; 1133                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 1) & (uint8_t)RTC_ALRMAR2_MSK2));
2425  03d7 1e09          	ldw	x,(OFST+4,sp)
2426  03d9 e604          	ld	a,(4,x)
2427  03db 48            	sll	a
2428  03dc a480          	and	a,#128
2429  03de 6b01          	ld	(OFST-4,sp),a
2430  03e0 e601          	ld	a,(1,x)
2431  03e2 cd082b        	call	L3_ByteToBcd2
2433  03e5 1a01          	or	a,(OFST-4,sp)
2434  03e7 6b03          	ld	(OFST-2,sp),a
2435                     ; 1135     tmpreg3 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours)) | \
2435                     ; 1136                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmTime.RTC_H12)) | \
2435                     ; 1137                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 2) & (uint8_t)RTC_ALRMAR3_MSK3));
2437  03e9 1e09          	ldw	x,(OFST+4,sp)
2438  03eb ad3f          	call	LC006
2439  03ed a480          	and	a,#128
2440  03ef 6b01          	ld	(OFST-4,sp),a
2441  03f1 f6            	ld	a,(x)
2442  03f2 cd082b        	call	L3_ByteToBcd2
2444  03f5 1e09          	ldw	x,(OFST+4,sp)
2445  03f7 ea03          	or	a,(3,x)
2446  03f9 1a01          	or	a,(OFST-4,sp)
2447  03fb 6b04          	ld	(OFST-1,sp),a
2448                     ; 1139     tmpreg4 = (uint8_t)((uint8_t)((ByteToBcd2(RTC_AlarmStruct->RTC_AlarmDateWeekDay)) | \
2448                     ; 1140                                   (uint8_t)(RTC_AlarmStruct->RTC_AlarmDateWeekDaySel)) | \
2448                     ; 1141                         (uint8_t)((uint8_t)(RTC_AlarmStruct->RTC_AlarmMask << 3) & (uint8_t)(RTC_ALRMAR4_MSK4)));
2450  03fd ad2d          	call	LC006
2451  03ff 48            	sll	a
2452  0400 a480          	and	a,#128
2453  0402 6b01          	ld	(OFST-4,sp),a
2454  0404 e606          	ld	a,(6,x)
2455  0406 cd082b        	call	L3_ByteToBcd2
2457  0409 1e09          	ldw	x,(OFST+4,sp)
2458  040b ea05          	or	a,(5,x)
2459  040d               L5611:
2460  040d 1a01          	or	a,(OFST-4,sp)
2461  040f 6b05          	ld	(OFST+0,sp),a
2462                     ; 1145   RTC->ALRMAR1 = tmpreg1;
2464  0411 7b02          	ld	a,(OFST-3,sp)
2465  0413 c7515c        	ld	20828,a
2466                     ; 1146   RTC->ALRMAR2 = tmpreg2;
2468  0416 7b03          	ld	a,(OFST-2,sp)
2469  0418 c7515d        	ld	20829,a
2470                     ; 1147   RTC->ALRMAR3 = tmpreg3;
2472  041b 7b04          	ld	a,(OFST-1,sp)
2473  041d c7515e        	ld	20830,a
2474                     ; 1148   RTC->ALRMAR4 = tmpreg4;
2476  0420 7b05          	ld	a,(OFST+0,sp)
2477  0422 c7515f        	ld	20831,a
2478                     ; 1151   RTC->WPR = 0xFF; 
2480  0425 35ff5159      	mov	20825,#255
2481                     ; 1152 }
2484  0429 5b06          	addw	sp,#6
2485  042b 81            	ret	
2486  042c               LC006:
2487  042c e604          	ld	a,(4,x)
2488  042e 48            	sll	a
2489  042f 48            	sll	a
2490  0430 81            	ret	
2528                     ; 1162 void RTC_AlarmStructInit(RTC_AlarmTypeDef* RTC_AlarmStruct)
2528                     ; 1163 {
2529                     	switch	.text
2530  0431               _RTC_AlarmStructInit:
2534                     ; 1165   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = RTC_H12_AM;
2536  0431 6f03          	clr	(3,x)
2537                     ; 1166   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = 0;
2539  0433 7f            	clr	(x)
2540                     ; 1167   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = 0;
2542  0434 6f01          	clr	(1,x)
2543                     ; 1168   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = 0;
2545  0436 6f02          	clr	(2,x)
2546                     ; 1171   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = RTC_AlarmDateWeekDaySel_Date;
2548  0438 6f05          	clr	(5,x)
2549                     ; 1172   RTC_AlarmStruct->RTC_AlarmDateWeekDay = 1;
2551  043a a601          	ld	a,#1
2552  043c e706          	ld	(6,x),a
2553                     ; 1175   RTC_AlarmStruct->RTC_AlarmMask = RTC_AlarmMask_All;
2555  043e a6f0          	ld	a,#240
2556  0440 e704          	ld	(4,x),a
2557                     ; 1176 }
2560  0442 81            	ret	
2643                     ; 1185 void RTC_GetAlarm(RTC_Format_TypeDef RTC_Format,
2643                     ; 1186                   RTC_AlarmTypeDef* RTC_AlarmStruct)
2643                     ; 1187 {
2644                     	switch	.text
2645  0443               _RTC_GetAlarm:
2647  0443 88            	push	a
2648  0444 5204          	subw	sp,#4
2649       00000004      OFST:	set	4
2652                     ; 1188   uint8_t tmpreg1 = 0;
2654                     ; 1189   uint8_t tmpreg2 = 0;
2656                     ; 1190   uint8_t tmpreg3 = 0;
2658                     ; 1191   uint8_t tmpreg4 = 0;
2660                     ; 1192   uint8_t alarmmask = 0;
2662                     ; 1195   assert_param(IS_RTC_FORMAT(RTC_Format));
2664                     ; 1198   tmpreg1 = (uint8_t)RTC->ALRMAR1;
2666  0446 c6515c        	ld	a,20828
2667  0449 6b04          	ld	(OFST+0,sp),a
2668                     ; 1199   tmpreg2 = (uint8_t)RTC->ALRMAR2;
2670  044b c6515d        	ld	a,20829
2671  044e 6b01          	ld	(OFST-3,sp),a
2672                     ; 1200   tmpreg3 = (uint8_t)RTC->ALRMAR3;
2674  0450 c6515e        	ld	a,20830
2675  0453 6b02          	ld	(OFST-2,sp),a
2676                     ; 1201   tmpreg4 = (uint8_t)RTC->ALRMAR4;
2678  0455 c6515f        	ld	a,20831
2679  0458 6b03          	ld	(OFST-1,sp),a
2680                     ; 1204   RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = (uint8_t)((uint8_t)tmpreg1 & (uint8_t)((uint8_t)RTC_ALRMAR1_ST | (uint8_t)RTC_ALRMAR1_SU));
2682  045a 7b04          	ld	a,(OFST+0,sp)
2683  045c 1e08          	ldw	x,(OFST+4,sp)
2684  045e a47f          	and	a,#127
2685  0460 e702          	ld	(2,x),a
2686                     ; 1205   alarmmask = (uint8_t)(tmpreg1 & RTC_ALRMAR1_MSK1);
2688  0462 7b04          	ld	a,(OFST+0,sp)
2689  0464 a480          	and	a,#128
2690  0466 6b04          	ld	(OFST+0,sp),a
2691                     ; 1208   RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = (uint8_t)((uint8_t)tmpreg2 & (uint8_t)((uint8_t)RTC_ALRMAR2_MNT | (uint8_t)RTC_ALRMAR2_MNU));
2693  0468 7b01          	ld	a,(OFST-3,sp)
2694  046a a47f          	and	a,#127
2695  046c e701          	ld	(1,x),a
2696                     ; 1209   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)(tmpreg2 & RTC_ALRMAR2_MSK2) >> 1));
2698  046e 7b01          	ld	a,(OFST-3,sp)
2699  0470 a480          	and	a,#128
2700  0472 44            	srl	a
2701  0473 1a04          	or	a,(OFST+0,sp)
2702  0475 6b04          	ld	(OFST+0,sp),a
2703                     ; 1212   RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = (uint8_t)((uint8_t)tmpreg3 & (uint8_t)((uint8_t)RTC_ALRMAR3_HT | (uint8_t)RTC_ALRMAR3_HU));
2705  0477 7b02          	ld	a,(OFST-2,sp)
2706  0479 a43f          	and	a,#63
2707  047b f7            	ld	(x),a
2708                     ; 1213   RTC_AlarmStruct->RTC_AlarmTime.RTC_H12 = (RTC_H12_TypeDef)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_PM);
2710  047c 7b02          	ld	a,(OFST-2,sp)
2711  047e a440          	and	a,#64
2712  0480 e703          	ld	(3,x),a
2713                     ; 1214   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg3 & (uint8_t)RTC_ALRMAR3_MSK3) >> 2));
2715  0482 7b02          	ld	a,(OFST-2,sp)
2716  0484 a480          	and	a,#128
2717  0486 44            	srl	a
2718  0487 44            	srl	a
2719  0488 1a04          	or	a,(OFST+0,sp)
2720  048a 6b04          	ld	(OFST+0,sp),a
2721                     ; 1217   RTC_AlarmStruct->RTC_AlarmDateWeekDay = (uint8_t)((uint8_t)tmpreg4 & (uint8_t)((uint8_t)RTC_ALRMAR4_DT | (uint8_t)RTC_ALRMAR4_DU));
2723  048c 7b03          	ld	a,(OFST-1,sp)
2724  048e a43f          	and	a,#63
2725  0490 e706          	ld	(6,x),a
2726                     ; 1218   RTC_AlarmStruct->RTC_AlarmDateWeekDaySel = (RTC_AlarmDateWeekDaySel_TypeDef)((uint8_t)tmpreg4 & (uint8_t)RTC_ALRMAR4_WDSEL);
2728  0492 7b03          	ld	a,(OFST-1,sp)
2729  0494 a440          	and	a,#64
2730  0496 e705          	ld	(5,x),a
2731                     ; 1219   alarmmask = (uint8_t)((alarmmask) | (uint8_t)((uint8_t)((uint8_t)tmpreg4 & RTC_ALRMAR4_MSK4) >> 3));
2733  0498 7b03          	ld	a,(OFST-1,sp)
2734  049a a480          	and	a,#128
2735  049c 44            	srl	a
2736  049d 44            	srl	a
2737  049e 44            	srl	a
2738  049f 1a04          	or	a,(OFST+0,sp)
2739  04a1 6b04          	ld	(OFST+0,sp),a
2740                     ; 1221   RTC_AlarmStruct->RTC_AlarmMask = alarmmask;
2742  04a3 e704          	ld	(4,x),a
2743                     ; 1223   if (RTC_Format == RTC_Format_BIN)
2745  04a5 7b05          	ld	a,(OFST+1,sp)
2746  04a7 2622          	jrne	L5421
2747                     ; 1225     RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Hours);
2749  04a9 f6            	ld	a,(x)
2750  04aa cd0848        	call	L5_Bcd2ToByte
2752  04ad 1e08          	ldw	x,(OFST+4,sp)
2753  04af f7            	ld	(x),a
2754                     ; 1226     RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Minutes);
2756  04b0 e601          	ld	a,(1,x)
2757  04b2 cd0848        	call	L5_Bcd2ToByte
2759  04b5 1e08          	ldw	x,(OFST+4,sp)
2760  04b7 e701          	ld	(1,x),a
2761                     ; 1227     RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmTime.RTC_Seconds);
2763  04b9 e602          	ld	a,(2,x)
2764  04bb cd0848        	call	L5_Bcd2ToByte
2766  04be 1e08          	ldw	x,(OFST+4,sp)
2767  04c0 e702          	ld	(2,x),a
2768                     ; 1228     RTC_AlarmStruct->RTC_AlarmDateWeekDay = Bcd2ToByte(RTC_AlarmStruct->RTC_AlarmDateWeekDay);
2770  04c2 e606          	ld	a,(6,x)
2771  04c4 cd0848        	call	L5_Bcd2ToByte
2773  04c7 1e08          	ldw	x,(OFST+4,sp)
2774  04c9 e706          	ld	(6,x),a
2775  04cb               L5421:
2776                     ; 1230 }
2779  04cb 5b05          	addw	sp,#5
2780  04cd 81            	ret	
2842                     ; 1239 ErrorStatus RTC_AlarmCmd(FunctionalState NewState)
2842                     ; 1240 {
2843                     	switch	.text
2844  04ce               _RTC_AlarmCmd:
2846  04ce 5203          	subw	sp,#3
2847       00000003      OFST:	set	3
2850                     ; 1241   __IO uint16_t alrawfcount = 0;
2852  04d0 5f            	clrw	x
2853  04d1 1f01          	ldw	(OFST-2,sp),x
2854                     ; 1242   ErrorStatus status = ERROR;
2856                     ; 1243   uint8_t temp1 = 0;
2858                     ; 1246   assert_param(IS_FUNCTIONAL_STATE(NewState));
2860                     ; 1249   RTC->WPR = 0xCA;
2862  04d3 35ca5159      	mov	20825,#202
2863                     ; 1250   RTC->WPR = 0x53;
2865  04d7 35535159      	mov	20825,#83
2866                     ; 1253   if (NewState != DISABLE)
2868  04db 4d            	tnz	a
2869  04dc 2711          	jreq	L7721
2870                     ; 1255     RTC->CR2 |= (uint8_t)(RTC_CR2_ALRAE);
2872  04de 72105149      	bset	20809,#0
2873                     ; 1256     status = SUCCESS;
2875  04e2               LC007:
2877  04e2 a601          	ld	a,#1
2878  04e4 6b03          	ld	(OFST+0,sp),a
2880  04e6               L1031:
2881                     ; 1280   RTC->WPR = 0xFF; 
2883  04e6 35ff5159      	mov	20825,#255
2884                     ; 1283   return (ErrorStatus)status;
2886  04ea 7b03          	ld	a,(OFST+0,sp)
2889  04ec 5b03          	addw	sp,#3
2890  04ee 81            	ret	
2891  04ef               L7721:
2892                     ; 1260     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE) ;
2894  04ef 72115149      	bres	20809,#0
2895                     ; 1263     temp1 = (uint8_t)(RTC->ISR1 & RTC_ISR1_ALRAWF);
2897  04f3 c6514c        	ld	a,20812
2898  04f6 a401          	and	a,#1
2899  04f8 6b03          	ld	(OFST+0,sp),a
2901  04fa 2005          	jra	L7031
2902  04fc               L3031:
2903                     ; 1266       alrawfcount++;
2905  04fc 1e01          	ldw	x,(OFST-2,sp)
2906  04fe 5c            	incw	x
2907  04ff 1f01          	ldw	(OFST-2,sp),x
2908  0501               L7031:
2909                     ; 1264     while ((alrawfcount != ALRAWF_TIMEOUT) && (temp1 == RESET))
2911  0501 1e01          	ldw	x,(OFST-2,sp)
2912  0503 5c            	incw	x
2913  0504 2704          	jreq	L3131
2915  0506 7b03          	ld	a,(OFST+0,sp)
2916  0508 27f2          	jreq	L3031
2917  050a               L3131:
2918                     ; 1269     if ((RTC->ISR1 &  RTC_ISR1_ALRAWF) == RESET)
2920  050a 7200514c04    	btjt	20812,#0,L5131
2921                     ; 1271       status = ERROR;
2923  050f 0f03          	clr	(OFST+0,sp)
2925  0511 20d3          	jra	L1031
2926  0513               L5131:
2927                     ; 1275       status = SUCCESS;
2928  0513 20cd          	jp	LC007
3125                     ; 1295 ErrorStatus RTC_AlarmSubSecondConfig(uint16_t RTC_AlarmSubSecondValue,
3125                     ; 1296                                      RTC_AlarmSubSecondMask_TypeDef RTC_AlarmSubSecondMask)
3125                     ; 1297 {
3126                     	switch	.text
3127  0515               _RTC_AlarmSubSecondConfig:
3129  0515 89            	pushw	x
3130  0516 88            	push	a
3131       00000001      OFST:	set	1
3134                     ; 1298   uint8_t alarmstatus = 0;
3136                     ; 1299   ErrorStatus status = ERROR;
3138                     ; 1302   assert_param(IS_RTC_ALARM_SS_VALUE(RTC_AlarmSubSecondValue));
3140                     ; 1303   assert_param(IS_RTC_ALARM_SS_MASK(RTC_AlarmSubSecondMask));
3142                     ; 1306   RTC->WPR = 0xCA;
3144  0517 35ca5159      	mov	20825,#202
3145                     ; 1307   RTC->WPR = 0x53;
3147  051b 35535159      	mov	20825,#83
3148                     ; 1310   if ((RTC->ISR1 & RTC_ISR1_INITF) == RESET)
3150  051f 720c514c26    	btjt	20812,#6,L3141
3151                     ; 1313     alarmstatus = (uint8_t)(RTC->CR2 | RTC_CR2_ALRAE);
3153  0524 c65149        	ld	a,20809
3154  0527 aa01          	or	a,#1
3155  0529 6b01          	ld	(OFST+0,sp),a
3156                     ; 1316     RTC->CR2 &= (uint8_t)~(RTC_CR2_ALRAE);
3158  052b 72115149      	bres	20809,#0
3159                     ; 1319     RTC->ALRMASSRH = (uint8_t)(RTC_AlarmSubSecondValue >> 8);
3161  052f 9e            	ld	a,xh
3162  0530 c75164        	ld	20836,a
3163                     ; 1320     RTC->ALRMASSRL = (uint8_t)(RTC_AlarmSubSecondValue);
3165  0533 9f            	ld	a,xl
3166  0534 c75165        	ld	20837,a
3167                     ; 1321     RTC->ALRMASSMSKR = (uint8_t)RTC_AlarmSubSecondMask;
3169  0537 7b06          	ld	a,(OFST+5,sp)
3170  0539 c75166        	ld	20838,a
3171                     ; 1324     RTC->CR2 |= alarmstatus;
3173  053c c65149        	ld	a,20809
3174  053f 1a01          	or	a,(OFST+0,sp)
3175  0541 c75149        	ld	20809,a
3176                     ; 1326     status = SUCCESS;
3178  0544 a601          	ld	a,#1
3179  0546 6b01          	ld	(OFST+0,sp),a
3181  0548 2002          	jra	L5141
3182  054a               L3141:
3183                     ; 1330     status = ERROR;
3185  054a 0f01          	clr	(OFST+0,sp)
3186  054c               L5141:
3187                     ; 1334   RTC->WPR = 0xFF; 
3189  054c 35ff5159      	mov	20825,#255
3190                     ; 1336   return (ErrorStatus)status;
3192  0550 7b01          	ld	a,(OFST+0,sp)
3195  0552 5b03          	addw	sp,#3
3196  0554 81            	ret	
3286                     ; 1366 void RTC_WakeUpClockConfig(RTC_WakeUpClock_TypeDef RTC_WakeUpClock)
3286                     ; 1367 {
3287                     	switch	.text
3288  0555               _RTC_WakeUpClockConfig:
3290  0555 88            	push	a
3291       00000000      OFST:	set	0
3294                     ; 1370   assert_param(IS_RTC_WAKEUP_CLOCK(RTC_WakeUpClock));
3296                     ; 1373   RTC->WPR = 0xCA;
3298  0556 35ca5159      	mov	20825,#202
3299                     ; 1374   RTC->WPR = 0x53;
3301  055a 35535159      	mov	20825,#83
3302                     ; 1377   RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3304  055e 72155149      	bres	20809,#2
3305                     ; 1380   RTC->CR1 &= (uint8_t)~RTC_CR1_WUCKSEL;
3307  0562 c65148        	ld	a,20808
3308  0565 a4f8          	and	a,#248
3309  0567 c75148        	ld	20808,a
3310                     ; 1383   RTC->CR1 |= (uint8_t)RTC_WakeUpClock;
3312  056a c65148        	ld	a,20808
3313  056d 1a01          	or	a,(OFST+1,sp)
3314  056f c75148        	ld	20808,a
3315                     ; 1386   RTC->WPR = 0xFF; 
3317  0572 35ff5159      	mov	20825,#255
3318                     ; 1387 }
3321  0576 84            	pop	a
3322  0577 81            	ret	
3355                     ; 1397 void RTC_SetWakeUpCounter(uint16_t RTC_WakeupCounter)
3355                     ; 1398 {
3356                     	switch	.text
3357  0578               _RTC_SetWakeUpCounter:
3361                     ; 1400   RTC->WPR = 0xCA;
3363  0578 35ca5159      	mov	20825,#202
3364                     ; 1401   RTC->WPR = 0x53;
3366  057c 35535159      	mov	20825,#83
3367                     ; 1405   RTC->WUTRH = (uint8_t)(RTC_WakeupCounter >> 8);
3369  0580 9e            	ld	a,xh
3370  0581 c75154        	ld	20820,a
3371                     ; 1406   RTC->WUTRL = (uint8_t)(RTC_WakeupCounter);
3373  0584 9f            	ld	a,xl
3374  0585 c75155        	ld	20821,a
3375                     ; 1409   RTC->WPR = 0xFF; 
3377  0588 35ff5159      	mov	20825,#255
3378                     ; 1410 }
3381  058c 81            	ret	
3414                     ; 1417 uint16_t RTC_GetWakeUpCounter(void)
3414                     ; 1418 {
3415                     	switch	.text
3416  058d               _RTC_GetWakeUpCounter:
3418  058d 89            	pushw	x
3419       00000002      OFST:	set	2
3422                     ; 1419   uint16_t tmpreg = 0;
3424                     ; 1422   tmpreg = ((uint16_t)RTC->WUTRH) << 8;
3426  058e c65154        	ld	a,20820
3427  0591 97            	ld	xl,a
3428  0592 4f            	clr	a
3429  0593 02            	rlwa	x,a
3430  0594 1f01          	ldw	(OFST-1,sp),x
3431                     ; 1423   tmpreg |= RTC->WUTRL;
3433  0596 c65155        	ld	a,20821
3434  0599 5f            	clrw	x
3435  059a 97            	ld	xl,a
3436  059b 01            	rrwa	x,a
3437  059c 1a02          	or	a,(OFST+0,sp)
3438  059e 01            	rrwa	x,a
3439  059f 1a01          	or	a,(OFST-1,sp)
3440  05a1 01            	rrwa	x,a
3441                     ; 1426   return (uint16_t)tmpreg;
3445  05a2 5b02          	addw	sp,#2
3446  05a4 81            	ret	
3499                     ; 1437 ErrorStatus RTC_WakeUpCmd(FunctionalState NewState)
3499                     ; 1438 {
3500                     	switch	.text
3501  05a5               _RTC_WakeUpCmd:
3503  05a5 5203          	subw	sp,#3
3504       00000003      OFST:	set	3
3507                     ; 1439   ErrorStatus status = ERROR;
3509                     ; 1440   uint16_t wutwfcount = 0;
3511  05a7 5f            	clrw	x
3512  05a8 1f02          	ldw	(OFST-1,sp),x
3513                     ; 1443   assert_param(IS_FUNCTIONAL_STATE(NewState));
3515                     ; 1446   RTC->WPR = 0xCA;
3517  05aa 35ca5159      	mov	20825,#202
3518                     ; 1447   RTC->WPR = 0x53;
3520  05ae 35535159      	mov	20825,#83
3521                     ; 1449   if (NewState != DISABLE)
3523  05b2 4d            	tnz	a
3524  05b3 2711          	jreq	L1351
3525                     ; 1452     RTC->CR2 |= (uint8_t)RTC_CR2_WUTE;
3527  05b5 72145149      	bset	20809,#2
3528                     ; 1454     status = SUCCESS;
3530  05b9               LC008:
3532  05b9 a601          	ld	a,#1
3533  05bb 6b01          	ld	(OFST-2,sp),a
3535  05bd               L3351:
3536                     ; 1479   RTC->WPR = 0xFF; 
3538  05bd 35ff5159      	mov	20825,#255
3539                     ; 1482   return (ErrorStatus)status;
3541  05c1 7b01          	ld	a,(OFST-2,sp)
3544  05c3 5b03          	addw	sp,#3
3545  05c5 81            	ret	
3546  05c6               L1351:
3547                     ; 1459     RTC->CR2 &= (uint8_t)~RTC_CR2_WUTE;
3549  05c6 72155149      	bres	20809,#2
3551  05ca 2003          	jra	L7351
3552  05cc               L5351:
3553                     ; 1464       wutwfcount++;
3555  05cc 5c            	incw	x
3556  05cd 1f02          	ldw	(OFST-1,sp),x
3557  05cf               L7351:
3558                     ; 1462     while (((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET) && ( wutwfcount != WUTWF_TIMEOUT))
3560  05cf 7204514c05    	btjt	20812,#2,L3451
3562  05d4 a3ffff        	cpw	x,#65535
3563  05d7 26f3          	jrne	L5351
3564  05d9               L3451:
3565                     ; 1468     if ((RTC->ISR1 & RTC_ISR1_WUTWF) == RESET)
3567  05d9 7204514c04    	btjt	20812,#2,L5451
3568                     ; 1470       status = ERROR;
3570  05de 0f01          	clr	(OFST-2,sp)
3572  05e0 20db          	jra	L3351
3573  05e2               L5451:
3574                     ; 1474       status = SUCCESS;
3575  05e2 20d5          	jp	LC008
3665                     ; 1519 void RTC_DayLightSavingConfig(RTC_DayLightSaving_TypeDef RTC_DayLightSaving,
3665                     ; 1520                               RTC_StoreOperation_TypeDef RTC_StoreOperation)
3665                     ; 1521 {
3666                     	switch	.text
3667  05e4               _RTC_DayLightSavingConfig:
3669  05e4 89            	pushw	x
3670       00000000      OFST:	set	0
3673                     ; 1523   assert_param(IS_RTC_DAYLIGHT_SAVING(RTC_DayLightSaving));
3675                     ; 1524   assert_param(IS_RTC_STORE_OPERATION(RTC_StoreOperation));
3677                     ; 1527   RTC->WPR = 0xCA;
3679  05e5 35ca5159      	mov	20825,#202
3680                     ; 1528   RTC->WPR = 0x53;
3682  05e9 35535159      	mov	20825,#83
3683                     ; 1531   RTC->CR3 &= (uint8_t)~(RTC_CR3_BCK);
3685  05ed 7215514a      	bres	20810,#2
3686                     ; 1534   RTC->CR3 |= (uint8_t)((uint8_t)RTC_DayLightSaving | (uint8_t)RTC_StoreOperation);
3688  05f1 9f            	ld	a,xl
3689  05f2 1a01          	or	a,(OFST+1,sp)
3690  05f4 ca514a        	or	a,20810
3691  05f7 c7514a        	ld	20810,a
3692                     ; 1537   RTC->WPR = 0xFF; 
3694  05fa 35ff5159      	mov	20825,#255
3695                     ; 1538 }
3698  05fe 85            	popw	x
3699  05ff 81            	ret	
3724                     ; 1546 RTC_StoreOperation_TypeDef  RTC_GetStoreOperation(void)
3724                     ; 1547 {
3725                     	switch	.text
3726  0600               _RTC_GetStoreOperation:
3730                     ; 1549   return (RTC_StoreOperation_TypeDef)(RTC->CR3 & RTC_CR3_BCK);
3732  0600 c6514a        	ld	a,20810
3733  0603 a404          	and	a,#4
3736  0605 81            	ret	
3830                     ; 1584 void RTC_OutputConfig(RTC_Output_TypeDef RTC_Output,
3830                     ; 1585                       RTC_OutputPolarity_TypeDef RTC_OutputPolarity)
3830                     ; 1586 {
3831                     	switch	.text
3832  0606               _RTC_OutputConfig:
3834  0606 89            	pushw	x
3835       00000000      OFST:	set	0
3838                     ; 1588   assert_param(IS_RTC_OUTPUT_SEL(RTC_Output));
3840                     ; 1589   assert_param(IS_RTC_OUTPUT_POL(RTC_OutputPolarity));
3842                     ; 1592   RTC->WPR = 0xCA;
3844  0607 35ca5159      	mov	20825,#202
3845                     ; 1593   RTC->WPR = 0x53;
3847  060b 35535159      	mov	20825,#83
3848                     ; 1596   RTC->CR3 &= (uint8_t)~(RTC_CR3_OSEL | RTC_CR3_POL);
3850  060f c6514a        	ld	a,20810
3851  0612 a48f          	and	a,#143
3852  0614 c7514a        	ld	20810,a
3853                     ; 1599   RTC->CR3 |= (uint8_t)((uint8_t)RTC_Output | (uint8_t)RTC_OutputPolarity);
3855  0617 9f            	ld	a,xl
3856  0618 1a01          	or	a,(OFST+1,sp)
3857  061a ca514a        	or	a,20810
3858  061d c7514a        	ld	20810,a
3859                     ; 1602   RTC->WPR = 0xFF; 
3861  0620 35ff5159      	mov	20825,#255
3862                     ; 1603 }
3865  0624 85            	popw	x
3866  0625 81            	ret	
3955                     ; 1636 ErrorStatus RTC_SynchroShiftConfig(RTC_ShiftAdd1S_TypeDef RTC_ShiftAdd1S,
3955                     ; 1637                                    uint16_t RTC_ShiftSubFS)
3955                     ; 1638 {
3956                     	switch	.text
3957  0626               _RTC_SynchroShiftConfig:
3959  0626 88            	push	a
3960  0627 5203          	subw	sp,#3
3961       00000003      OFST:	set	3
3964                     ; 1639   uint8_t shiftrhreg = 0;
3966                     ; 1640   ErrorStatus status = ERROR;
3968                     ; 1641   uint16_t shpfcount = 0;
3970  0629 5f            	clrw	x
3971  062a 1f02          	ldw	(OFST-1,sp),x
3972                     ; 1644   assert_param(IS_RTC_SHIFT_ADD1S(RTC_ShiftAdd1S));
3974                     ; 1645   assert_param(IS_RTC_SHIFT_SUBFS(RTC_ShiftSubFS));
3976                     ; 1648   RTC->WPR = 0xCA;
3978  062c 35ca5159      	mov	20825,#202
3979                     ; 1649   RTC->WPR = 0x53;
3981  0630 35535159      	mov	20825,#83
3982                     ; 1652   if ((RTC->ISR1 & RTC_ISR1_SHPF) != RESET)
3984  0634 7207514c0f    	btjf	20812,#3,L7271
3986  0639 2003          	jra	L3371
3987  063b               L1371:
3988                     ; 1657       shpfcount++;
3990  063b 5c            	incw	x
3991  063c 1f02          	ldw	(OFST-1,sp),x
3992  063e               L3371:
3993                     ; 1655     while (((RTC->ISR1 & RTC_ISR1_SHPF) != RESET) && (shpfcount != SHPF_TIMEOUT))
3995  063e 7207514c05    	btjf	20812,#3,L7271
3997  0643 a3ffff        	cpw	x,#65535
3998  0646 26f3          	jrne	L1371
3999  0648               L7271:
4000                     ; 1662   if ((RTC->ISR1 & RTC_ISR1_SHPF) == RESET)
4002  0648 7206514c12    	btjt	20812,#3,L1471
4003                     ; 1665     shiftrhreg = (uint8_t)((uint8_t)(RTC_ShiftSubFS >> 8) | (uint8_t)(RTC_ShiftAdd1S));
4005  064d 7b07          	ld	a,(OFST+4,sp)
4006  064f 1a04          	or	a,(OFST+1,sp)
4007                     ; 1666     RTC->SHIFTRH = (uint8_t)(shiftrhreg);
4009  0651 c7515a        	ld	20826,a
4010                     ; 1667     RTC->SHIFTRL = (uint8_t)(RTC_ShiftSubFS);
4012  0654 7b08          	ld	a,(OFST+5,sp)
4013  0656 c7515b        	ld	20827,a
4014                     ; 1669     status = SUCCESS;
4016  0659 a601          	ld	a,#1
4017  065b 6b01          	ld	(OFST-2,sp),a
4019  065d 2002          	jra	L3471
4020  065f               L1471:
4021                     ; 1673     status = ERROR;
4023  065f 0f01          	clr	(OFST-2,sp)
4024  0661               L3471:
4025                     ; 1677   RTC->WPR = 0xFF; 
4027  0661 35ff5159      	mov	20825,#255
4028                     ; 1679   return (ErrorStatus)(status);
4030  0665 7b01          	ld	a,(OFST-2,sp)
4033  0667 5b04          	addw	sp,#4
4034  0669 81            	ret	
4160                     ; 1715 ErrorStatus RTC_SmoothCalibConfig(RTC_SmoothCalibPeriod_TypeDef RTC_SmoothCalibPeriod,
4160                     ; 1716                                   RTC_SmoothCalibPlusPulses_TypeDef RTC_SmoothCalibPlusPulses,
4160                     ; 1717                                   uint16_t RTC_SmouthCalibMinusPulsesValue)
4160                     ; 1718 {
4161                     	switch	.text
4162  066a               _RTC_SmoothCalibConfig:
4164  066a 89            	pushw	x
4165  066b 5203          	subw	sp,#3
4166       00000003      OFST:	set	3
4169                     ; 1719   ErrorStatus status = ERROR;
4171                     ; 1720   uint16_t recalpfcount = 0;
4173  066d 5f            	clrw	x
4174  066e 1f02          	ldw	(OFST-1,sp),x
4175                     ; 1723   assert_param(IS_RTC_SMOOTH_CALIB_PERIOD(RTC_SmoothCalibPeriod));
4177                     ; 1724   assert_param(IS_RTC_SMOOTH_CALIB_PLUS(RTC_SmoothCalibPlusPulses));
4179                     ; 1725   assert_param(IS_RTC_SMOOTH_CALIB_MINUS(RTC_SmouthCalibMinusPulsesValue));
4181                     ; 1728   RTC->WPR = 0xCA;
4183  0670 35ca5159      	mov	20825,#202
4184                     ; 1729   RTC->WPR = 0x53;
4186  0674 35535159      	mov	20825,#83
4187                     ; 1732   if ((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET)
4189  0678 7203514c0f    	btjf	20812,#1,L1202
4191  067d 2003          	jra	L5202
4192  067f               L3202:
4193                     ; 1737       recalpfcount++;
4195  067f 5c            	incw	x
4196  0680 1f02          	ldw	(OFST-1,sp),x
4197  0682               L5202:
4198                     ; 1735     while (((RTC->ISR1 & RTC_ISR1_RECALPF) != RESET) && (recalpfcount != RECALPF_TIMEOUT))
4200  0682 7203514c05    	btjf	20812,#1,L1202
4202  0687 a3ffff        	cpw	x,#65535
4203  068a 26f3          	jrne	L3202
4204  068c               L1202:
4205                     ; 1743   if ((RTC->ISR1 & RTC_ISR1_RECALPF) == RESET)
4207  068c 7202514c14    	btjt	20812,#1,L3302
4208                     ; 1746     RTC->CALRH = (uint8_t)((uint8_t)((uint8_t)RTC_SmoothCalibPeriod | \
4208                     ; 1747                            (uint8_t)RTC_SmoothCalibPlusPulses) | \
4208                     ; 1748                            (uint8_t)((uint16_t)RTC_SmouthCalibMinusPulsesValue >> 8));
4210  0691 7b04          	ld	a,(OFST+1,sp)
4211  0693 1a05          	or	a,(OFST+2,sp)
4212  0695 1a08          	or	a,(OFST+5,sp)
4213  0697 c7516a        	ld	20842,a
4214                     ; 1749     RTC->CALRL = (uint8_t)(RTC_SmouthCalibMinusPulsesValue);
4216  069a 7b09          	ld	a,(OFST+6,sp)
4217  069c c7516b        	ld	20843,a
4218                     ; 1751     status = SUCCESS;
4220  069f a601          	ld	a,#1
4221  06a1 6b01          	ld	(OFST-2,sp),a
4223  06a3 2002          	jra	L5302
4224  06a5               L3302:
4225                     ; 1755     status = ERROR;
4227  06a5 0f01          	clr	(OFST-2,sp)
4228  06a7               L5302:
4229                     ; 1759   RTC->WPR = 0xFF; 
4231  06a7 35ff5159      	mov	20825,#255
4232                     ; 1761   return (ErrorStatus)(status);
4234  06ab 7b01          	ld	a,(OFST-2,sp)
4237  06ad 5b05          	addw	sp,#5
4238  06af 81            	ret	
4296                     ; 1787 void RTC_CalibOutputConfig(RTC_CalibOutput_TypeDef RTC_CalibOutput)
4296                     ; 1788 {
4297                     	switch	.text
4298  06b0               _RTC_CalibOutputConfig:
4302                     ; 1790   assert_param(IS_RTC_CALOUTPUT_SELECT(RTC_CalibOutput));
4304                     ; 1793   RTC->WPR = 0xCA;
4306  06b0 35ca5159      	mov	20825,#202
4307                     ; 1794   RTC->WPR = 0x53;
4309  06b4 35535159      	mov	20825,#83
4310                     ; 1796   if (RTC_CalibOutput != RTC_CalibOutput_512Hz)
4312  06b8 4d            	tnz	a
4313  06b9 2706          	jreq	L5602
4314                     ; 1799     RTC->CR3 |= (uint8_t)RTC_CR3_COSEL;
4316  06bb 7216514a      	bset	20810,#3
4318  06bf 2004          	jra	L7602
4319  06c1               L5602:
4320                     ; 1804     RTC->CR3 &= (uint8_t)~RTC_CR3_COSEL;
4322  06c1 7217514a      	bres	20810,#3
4323  06c5               L7602:
4324                     ; 1808   RTC->WPR = 0xFF; 
4326  06c5 35ff5159      	mov	20825,#255
4327                     ; 1809 }
4330  06c9 81            	ret	
4365                     ; 1817 void RTC_CalibOutputCmd(FunctionalState NewState)
4365                     ; 1818 {
4366                     	switch	.text
4367  06ca               _RTC_CalibOutputCmd:
4371                     ; 1820   assert_param(IS_FUNCTIONAL_STATE(NewState));
4373                     ; 1823   RTC->WPR = 0xCA;
4375  06ca 35ca5159      	mov	20825,#202
4376                     ; 1824   RTC->WPR = 0x53;
4378  06ce 35535159      	mov	20825,#83
4379                     ; 1826   if (NewState != DISABLE)
4381  06d2 4d            	tnz	a
4382  06d3 2706          	jreq	L7012
4383                     ; 1829     RTC->CR3 |= (uint8_t)RTC_CR3_COE;
4385  06d5 721e514a      	bset	20810,#7
4387  06d9 2004          	jra	L1112
4388  06db               L7012:
4389                     ; 1834     RTC->CR3 &= (uint8_t)~RTC_CR3_COE;
4391  06db 721f514a      	bres	20810,#7
4392  06df               L1112:
4393                     ; 1838   RTC->WPR = 0xFF; 
4395  06df 35ff5159      	mov	20825,#255
4396                     ; 1839 }
4399  06e3 81            	ret	
4494                     ; 1868 void RTC_TamperLevelConfig(RTC_Tamper_TypeDef RTC_Tamper,
4494                     ; 1869                            RTC_TamperLevel_TypeDef RTC_TamperLevel)
4494                     ; 1870 {
4495                     	switch	.text
4496  06e4               _RTC_TamperLevelConfig:
4498  06e4 89            	pushw	x
4499       00000000      OFST:	set	0
4502                     ; 1872   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4504                     ; 1873   assert_param(IS_RTC_TAMPER_LEVEL(RTC_TamperLevel));
4506                     ; 1876   RTC->WPR = 0xCA;
4508  06e5 35ca5159      	mov	20825,#202
4509                     ; 1877   RTC->WPR = 0x53;
4511  06e9 35535159      	mov	20825,#83
4512                     ; 1879   if (RTC_TamperLevel != RTC_TamperLevel_Low)
4514  06ed 9f            	ld	a,xl
4515  06ee 4d            	tnz	a
4516  06ef 2707          	jreq	L7512
4517                     ; 1882     RTC->TCR1 |= (uint8_t)(RTC_Tamper << 1);
4519  06f1 9e            	ld	a,xh
4520  06f2 48            	sll	a
4521  06f3 ca516c        	or	a,20844
4523  06f6 2007          	jra	L1612
4524  06f8               L7512:
4525                     ; 1887     RTC->TCR1 &= (uint8_t)~(uint8_t)(RTC_Tamper << 1);
4527  06f8 7b01          	ld	a,(OFST+1,sp)
4528  06fa 48            	sll	a
4529  06fb 43            	cpl	a
4530  06fc c4516c        	and	a,20844
4531  06ff               L1612:
4532  06ff c7516c        	ld	20844,a
4533                     ; 1891   RTC->WPR = 0xFF; 
4535  0702 35ff5159      	mov	20825,#255
4536                     ; 1892 }
4539  0706 85            	popw	x
4540  0707 81            	ret	
4614                     ; 1900 void RTC_TamperFilterConfig(RTC_TamperFilter_TypeDef RTC_TamperFilter)
4614                     ; 1901 {
4615                     	switch	.text
4616  0708               _RTC_TamperFilterConfig:
4618  0708 88            	push	a
4619       00000000      OFST:	set	0
4622                     ; 1904   assert_param(IS_RTC_TAMPER_FILTER(RTC_TamperFilter));
4624                     ; 1907   RTC->WPR = 0xCA;
4626  0709 35ca5159      	mov	20825,#202
4627                     ; 1908   RTC->WPR = 0x53;
4629  070d 35535159      	mov	20825,#83
4630                     ; 1911   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFLT);
4632  0711 c6516d        	ld	a,20845
4633  0714 a4e7          	and	a,#231
4634  0716 c7516d        	ld	20845,a
4635                     ; 1914   RTC->TCR2 |= (uint8_t)RTC_TamperFilter;
4637  0719 c6516d        	ld	a,20845
4638  071c 1a01          	or	a,(OFST+1,sp)
4639  071e c7516d        	ld	20845,a
4640                     ; 1917   RTC->WPR = 0xFF; 
4642  0721 35ff5159      	mov	20825,#255
4643                     ; 1919 }
4646  0725 84            	pop	a
4647  0726 81            	ret	
4760                     ; 1928 void RTC_TamperSamplingFreqConfig(RTC_TamperSamplingFreq_TypeDef RTC_TamperSamplingFreq)
4760                     ; 1929 {
4761                     	switch	.text
4762  0727               _RTC_TamperSamplingFreqConfig:
4764  0727 88            	push	a
4765       00000000      OFST:	set	0
4768                     ; 1931   assert_param(IS_RTC_TAMPER_SAMPLING_FREQ(RTC_TamperSamplingFreq));
4770                     ; 1934   RTC->WPR = 0xCA;
4772  0728 35ca5159      	mov	20825,#202
4773                     ; 1935   RTC->WPR = 0x53;
4775  072c 35535159      	mov	20825,#83
4776                     ; 1938   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPFREQ);
4778  0730 c6516d        	ld	a,20845
4779  0733 a4f8          	and	a,#248
4780  0735 c7516d        	ld	20845,a
4781                     ; 1941   RTC->TCR2 |= (uint8_t)RTC_TamperSamplingFreq;
4783  0738 c6516d        	ld	a,20845
4784  073b 1a01          	or	a,(OFST+1,sp)
4785  073d c7516d        	ld	20845,a
4786                     ; 1944   RTC->WPR = 0xFF; 
4788  0740 35ff5159      	mov	20825,#255
4789                     ; 1945 }
4792  0744 84            	pop	a
4793  0745 81            	ret	
4876                     ; 1955 void RTC_TamperPinsPrechargeDuration(RTC_TamperPrechargeDuration_TypeDef RTC_TamperPrechargeDuration)
4876                     ; 1956 {
4877                     	switch	.text
4878  0746               _RTC_TamperPinsPrechargeDuration:
4880  0746 88            	push	a
4881       00000000      OFST:	set	0
4884                     ; 1958   assert_param(IS_RTC_TAMPER_PINS_PRECHAR_DURATION(RTC_TamperPrechargeDuration));
4886                     ; 1961   RTC->WPR = 0xCA;
4888  0747 35ca5159      	mov	20825,#202
4889                     ; 1962   RTC->WPR = 0x53;
4891  074b 35535159      	mov	20825,#83
4892                     ; 1965   RTC->TCR2 &= (uint8_t)~(RTC_TCR2_TAMPPUDIS | RTC_TCR2_TAMPPRCH);
4894  074f c6516d        	ld	a,20845
4895  0752 a41f          	and	a,#31
4896  0754 c7516d        	ld	20845,a
4897                     ; 1968   RTC->TCR2 |= (uint8_t)RTC_TamperPrechargeDuration;
4899  0757 c6516d        	ld	a,20845
4900  075a 1a01          	or	a,(OFST+1,sp)
4901  075c c7516d        	ld	20845,a
4902                     ; 1971   RTC->WPR = 0xFF; 
4904  075f 35ff5159      	mov	20825,#255
4905                     ; 1972 }
4908  0763 84            	pop	a
4909  0764 81            	ret	
4954                     ; 1984 void RTC_TamperCmd(RTC_Tamper_TypeDef RTC_Tamper,
4954                     ; 1985                    FunctionalState NewState)
4954                     ; 1986 {
4955                     	switch	.text
4956  0765               _RTC_TamperCmd:
4958  0765 89            	pushw	x
4959       00000000      OFST:	set	0
4962                     ; 1989   assert_param(IS_RTC_TAMPER((uint8_t)RTC_Tamper));
4964                     ; 1990   assert_param(IS_FUNCTIONAL_STATE(NewState));
4966                     ; 1993   RTC->WPR = 0xCA;
4968  0766 35ca5159      	mov	20825,#202
4969                     ; 1994   RTC->WPR = 0x53;
4971  076a 35535159      	mov	20825,#83
4972                     ; 1997   if (NewState != DISABLE)
4974  076e 9f            	ld	a,xl
4975  076f 4d            	tnz	a
4976  0770 2706          	jreq	L5332
4977                     ; 2000     RTC->TCR1 |= (uint8_t)RTC_Tamper;
4979  0772 9e            	ld	a,xh
4980  0773 ca516c        	or	a,20844
4982  0776 2006          	jra	L7332
4983  0778               L5332:
4984                     ; 2005     RTC->TCR1 &= (uint8_t)~RTC_Tamper;
4986  0778 7b01          	ld	a,(OFST+1,sp)
4987  077a 43            	cpl	a
4988  077b c4516c        	and	a,20844
4989  077e               L7332:
4990  077e c7516c        	ld	20844,a
4991                     ; 2010   RTC->WPR = 0xFF; 
4993  0781 35ff5159      	mov	20825,#255
4994                     ; 2011 }
4997  0785 85            	popw	x
4998  0786 81            	ret	
5070                     ; 2055 void RTC_ITConfig(RTC_IT_TypeDef RTC_IT, FunctionalState NewState)
5070                     ; 2056 {
5071                     	switch	.text
5072  0787               _RTC_ITConfig:
5074  0787 89            	pushw	x
5075       00000000      OFST:	set	0
5078                     ; 2058   assert_param(IS_RTC_CONFIG_IT(RTC_IT));
5080                     ; 2059   assert_param(IS_FUNCTIONAL_STATE(NewState));
5082                     ; 2062   RTC->WPR = 0xCA;
5084  0788 35ca5159      	mov	20825,#202
5085                     ; 2063   RTC->WPR = 0x53;
5087  078c 35535159      	mov	20825,#83
5088                     ; 2065   if (NewState != DISABLE)
5090  0790 7b05          	ld	a,(OFST+5,sp)
5091  0792 2712          	jreq	L5732
5092                     ; 2068     RTC->CR2 |= (uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5094  0794 9f            	ld	a,xl
5095  0795 a4f0          	and	a,#240
5096  0797 ca5149        	or	a,20809
5097  079a c75149        	ld	20809,a
5098                     ; 2069     RTC->TCR1 |= (uint8_t)((uint16_t)RTC_IT & RTC_TCR1_TAMPIE);
5100  079d 7b02          	ld	a,(OFST+2,sp)
5101  079f a401          	and	a,#1
5102  07a1 ca516c        	or	a,20844
5104  07a4 2013          	jra	L7732
5105  07a6               L5732:
5106                     ; 2074     RTC->CR2  &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)0x00F0);
5108  07a6 7b02          	ld	a,(OFST+2,sp)
5109  07a8 a4f0          	and	a,#240
5110  07aa 43            	cpl	a
5111  07ab c45149        	and	a,20809
5112  07ae c75149        	ld	20809,a
5113                     ; 2075     RTC->TCR1 &= (uint8_t)~(uint8_t)((uint16_t)RTC_IT & (uint16_t)RTC_TCR1_TAMPIE);
5115  07b1 7b02          	ld	a,(OFST+2,sp)
5116  07b3 a401          	and	a,#1
5117  07b5 43            	cpl	a
5118  07b6 c4516c        	and	a,20844
5119  07b9               L7732:
5120  07b9 c7516c        	ld	20844,a
5121                     ; 2079   RTC->WPR = 0xFF; 
5123  07bc 35ff5159      	mov	20825,#255
5124                     ; 2080 }
5127  07c0 85            	popw	x
5128  07c1 81            	ret	
5298                     ; 2087 FlagStatus RTC_GetFlagStatus(RTC_Flag_TypeDef RTC_FLAG)
5298                     ; 2088 {
5299                     	switch	.text
5300  07c2               _RTC_GetFlagStatus:
5302  07c2 89            	pushw	x
5303  07c3 5203          	subw	sp,#3
5304       00000003      OFST:	set	3
5307                     ; 2089   FlagStatus flagstatus = RESET;
5309                     ; 2090   uint16_t tmpreg1 = 0;
5311                     ; 2091   uint16_t tmpreg2 = 0;
5313                     ; 2094   assert_param(IS_RTC_GET_FLAG(RTC_FLAG));
5315                     ; 2097   tmpreg2 = (uint16_t)((uint16_t)RTC->ISR1 << 8);
5317  07c5 c6514c        	ld	a,20812
5318  07c8 97            	ld	xl,a
5319  07c9 4f            	clr	a
5320  07ca 02            	rlwa	x,a
5321  07cb 1f02          	ldw	(OFST-1,sp),x
5322                     ; 2098   tmpreg1 = (uint16_t)((uint16_t)((uint16_t)(RTC->ISR2)) | tmpreg2);
5324  07cd c6514d        	ld	a,20813
5325  07d0 5f            	clrw	x
5326  07d1 97            	ld	xl,a
5327  07d2 01            	rrwa	x,a
5328  07d3 1a03          	or	a,(OFST+0,sp)
5329  07d5 01            	rrwa	x,a
5330  07d6 1a02          	or	a,(OFST-1,sp)
5331  07d8 01            	rrwa	x,a
5332  07d9 1f02          	ldw	(OFST-1,sp),x
5333                     ; 2101   if ((tmpreg1 & (uint16_t)RTC_FLAG) != RESET)
5335  07db 01            	rrwa	x,a
5336  07dc 1405          	and	a,(OFST+2,sp)
5337  07de 01            	rrwa	x,a
5338  07df 1404          	and	a,(OFST+1,sp)
5339  07e1 01            	rrwa	x,a
5340  07e2 5d            	tnzw	x
5341  07e3 2704          	jreq	L3742
5342                     ; 2103     flagstatus = SET;
5344  07e5 a601          	ld	a,#1
5346  07e7 2001          	jra	L5742
5347  07e9               L3742:
5348                     ; 2107     flagstatus = RESET;
5350  07e9 4f            	clr	a
5351  07ea               L5742:
5352                     ; 2109   return (FlagStatus)flagstatus;
5356  07ea 5b05          	addw	sp,#5
5357  07ec 81            	ret	
5392                     ; 2119 void RTC_ClearFlag(RTC_Flag_TypeDef RTC_FLAG)
5392                     ; 2120 {
5393                     	switch	.text
5394  07ed               _RTC_ClearFlag:
5396  07ed 89            	pushw	x
5397       00000000      OFST:	set	0
5400                     ; 2122   assert_param(IS_RTC_CLEAR_FLAG((uint16_t)RTC_FLAG));
5402                     ; 2125   RTC->ISR2 = (uint8_t)~((uint8_t)RTC_FLAG) ;
5404  07ee 9f            	ld	a,xl
5405  07ef 43            	cpl	a
5406  07f0 c7514d        	ld	20813,a
5407                     ; 2126   RTC->ISR1 = (uint8_t)(((uint8_t)~(uint8_t)((uint16_t)RTC_FLAG >> (uint8_t)8)) & ((uint8_t)~(uint8_t)(RTC_ISR1_INIT)));
5409  07f3 7b01          	ld	a,(OFST+1,sp)
5410  07f5 43            	cpl	a
5411  07f6 a47f          	and	a,#127
5412  07f8 c7514c        	ld	20812,a
5413                     ; 2127 }
5416  07fb 85            	popw	x
5417  07fc 81            	ret	
5477                     ; 2135 ITStatus RTC_GetITStatus(RTC_IT_TypeDef RTC_IT)
5477                     ; 2136 {
5478                     	switch	.text
5479  07fd               _RTC_GetITStatus:
5481  07fd 89            	pushw	x
5482  07fe 89            	pushw	x
5483       00000002      OFST:	set	2
5486                     ; 2137   ITStatus itstatus = RESET;
5488                     ; 2138   uint8_t enablestatus = 0, tmpreg = 0;
5492                     ; 2141   assert_param(IS_RTC_GET_IT(RTC_IT));
5494                     ; 2144   enablestatus = (uint8_t)(RTC->CR2 & (uint16_t)RTC_IT);
5496  07ff 9f            	ld	a,xl
5497  0800 c45149        	and	a,20809
5498  0803 6b01          	ld	(OFST-1,sp),a
5499                     ; 2147   tmpreg = (uint8_t)(RTC->ISR2 & (uint8_t)((uint16_t)RTC_IT >> 4));
5501  0805 1e03          	ldw	x,(OFST+1,sp)
5502  0807 54            	srlw	x
5503  0808 54            	srlw	x
5504  0809 54            	srlw	x
5505  080a 54            	srlw	x
5506  080b 9f            	ld	a,xl
5507  080c c4514d        	and	a,20813
5508  080f 6b02          	ld	(OFST+0,sp),a
5509                     ; 2150   if ((enablestatus != (uint8_t)RESET) && (tmpreg != (uint8_t)RESET))
5511  0811 7b01          	ld	a,(OFST-1,sp)
5512  0813 2708          	jreq	L3452
5514  0815 7b02          	ld	a,(OFST+0,sp)
5515  0817 2704          	jreq	L3452
5516                     ; 2152     itstatus = SET;
5518  0819 a601          	ld	a,#1
5520  081b 2001          	jra	L5452
5521  081d               L3452:
5522                     ; 2156     itstatus = RESET;
5524  081d 4f            	clr	a
5525  081e               L5452:
5526                     ; 2159   return (ITStatus)itstatus;
5530  081e 5b04          	addw	sp,#4
5531  0820 81            	ret	
5567                     ; 2169 void RTC_ClearITPendingBit(RTC_IT_TypeDef RTC_IT)
5567                     ; 2170 {
5568                     	switch	.text
5569  0821               _RTC_ClearITPendingBit:
5573                     ; 2172   assert_param(IS_RTC_CLEAR_IT((uint16_t)RTC_IT));
5575                     ; 2175   RTC->ISR2 = (uint8_t)~(uint8_t)((uint16_t)RTC_IT >> 4);
5577  0821 54            	srlw	x
5578  0822 54            	srlw	x
5579  0823 54            	srlw	x
5580  0824 54            	srlw	x
5581  0825 9f            	ld	a,xl
5582  0826 43            	cpl	a
5583  0827 c7514d        	ld	20813,a
5584                     ; 2176 }
5587  082a 81            	ret	
5626                     ; 2199 static uint8_t ByteToBcd2(uint8_t Value)
5626                     ; 2200 {
5627                     	switch	.text
5628  082b               L3_ByteToBcd2:
5630  082b 88            	push	a
5631  082c 88            	push	a
5632       00000001      OFST:	set	1
5635                     ; 2201   uint8_t bcdhigh = 0;
5637  082d 0f01          	clr	(OFST+0,sp)
5639  082f 7b02          	ld	a,(OFST+1,sp)
5640  0831 2006          	jra	L7062
5641  0833               L3062:
5642                     ; 2205     bcdhigh++;
5644  0833 0c01          	inc	(OFST+0,sp)
5645                     ; 2206     Value -= 10;
5647  0835 a00a          	sub	a,#10
5648  0837 6b02          	ld	(OFST+1,sp),a
5649  0839               L7062:
5650                     ; 2203   while (Value >= 10)
5652  0839 a10a          	cp	a,#10
5653  083b 24f6          	jruge	L3062
5654                     ; 2209   return  (uint8_t)((uint8_t)(bcdhigh << 4) | Value);
5656  083d 7b01          	ld	a,(OFST+0,sp)
5657  083f 97            	ld	xl,a
5658  0840 a610          	ld	a,#16
5659  0842 42            	mul	x,a
5660  0843 9f            	ld	a,xl
5661  0844 1a02          	or	a,(OFST+1,sp)
5664  0846 85            	popw	x
5665  0847 81            	ret	
5704                     ; 2217 static uint8_t Bcd2ToByte(uint8_t Value)
5704                     ; 2218 {
5705                     	switch	.text
5706  0848               L5_Bcd2ToByte:
5708  0848 88            	push	a
5709  0849 88            	push	a
5710       00000001      OFST:	set	1
5713                     ; 2219   uint8_t tmp = 0;
5715                     ; 2221   tmp = (uint8_t)((uint8_t)((uint8_t)(Value & (uint8_t)0xF0) >> 4) * (uint8_t)10);
5717  084a 4e            	swap	a
5718  084b a40f          	and	a,#15
5719  084d 97            	ld	xl,a
5720  084e a60a          	ld	a,#10
5721  0850 42            	mul	x,a
5722  0851 9f            	ld	a,xl
5723  0852 6b01          	ld	(OFST+0,sp),a
5724                     ; 2223   return (uint8_t)(tmp + (Value & (uint8_t)0x0F));
5726  0854 7b02          	ld	a,(OFST+1,sp)
5727  0856 a40f          	and	a,#15
5728  0858 1b01          	add	a,(OFST+0,sp)
5731  085a 85            	popw	x
5732  085b 81            	ret	
5745                     	xdef	_RTC_ClearITPendingBit
5746                     	xdef	_RTC_GetITStatus
5747                     	xdef	_RTC_ClearFlag
5748                     	xdef	_RTC_GetFlagStatus
5749                     	xdef	_RTC_ITConfig
5750                     	xdef	_RTC_TamperCmd
5751                     	xdef	_RTC_TamperPinsPrechargeDuration
5752                     	xdef	_RTC_TamperSamplingFreqConfig
5753                     	xdef	_RTC_TamperFilterConfig
5754                     	xdef	_RTC_TamperLevelConfig
5755                     	xdef	_RTC_CalibOutputCmd
5756                     	xdef	_RTC_CalibOutputConfig
5757                     	xdef	_RTC_SmoothCalibConfig
5758                     	xdef	_RTC_SynchroShiftConfig
5759                     	xdef	_RTC_OutputConfig
5760                     	xdef	_RTC_GetStoreOperation
5761                     	xdef	_RTC_DayLightSavingConfig
5762                     	xdef	_RTC_WakeUpCmd
5763                     	xdef	_RTC_GetWakeUpCounter
5764                     	xdef	_RTC_SetWakeUpCounter
5765                     	xdef	_RTC_WakeUpClockConfig
5766                     	xdef	_RTC_AlarmSubSecondConfig
5767                     	xdef	_RTC_AlarmCmd
5768                     	xdef	_RTC_GetAlarm
5769                     	xdef	_RTC_AlarmStructInit
5770                     	xdef	_RTC_SetAlarm
5771                     	xdef	_RTC_GetDate
5772                     	xdef	_RTC_DateStructInit
5773                     	xdef	_RTC_SetDate
5774                     	xdef	_RTC_GetSubSecond
5775                     	xdef	_RTC_GetTime
5776                     	xdef	_RTC_TimeStructInit
5777                     	xdef	_RTC_SetTime
5778                     	xdef	_RTC_BypassShadowCmd
5779                     	xdef	_RTC_RatioCmd
5780                     	xdef	_RTC_WaitForSynchro
5781                     	xdef	_RTC_ExitInitMode
5782                     	xdef	_RTC_EnterInitMode
5783                     	xdef	_RTC_WriteProtectionCmd
5784                     	xdef	_RTC_StructInit
5785                     	xdef	_RTC_Init
5786                     	xdef	_RTC_DeInit
5805                     	end
