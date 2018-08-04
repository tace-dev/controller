   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 108 void COMP_DeInit(void)
  50                     ; 109 {
  52                     .text:	section	.text,new
  53  0000               _COMP_DeInit:
  57                     ; 111   COMP->CSR1 = (uint8_t) COMP_CSR1_RESET_VALUE;
  59  0000 725f5440      	clr	21568
  60                     ; 114   COMP->CSR2 = (uint8_t) COMP_CSR2_RESET_VALUE;
  62  0004 725f5441      	clr	21569
  63                     ; 117   COMP->CSR3 = (uint8_t) COMP_CSR3_RESET_VALUE;
  65  0008 35c05442      	mov	21570,#192
  66                     ; 120   COMP->CSR4 = (uint8_t) COMP_CSR4_RESET_VALUE;
  68  000c 725f5443      	clr	21571
  69                     ; 123   COMP->CSR5 = (uint8_t) COMP_CSR5_RESET_VALUE;
  71  0010 725f5444      	clr	21572
  72                     ; 124 }
  75  0014 81            	ret	
 251                     ; 150 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
 251                     ; 151                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
 251                     ; 152 {
 252                     .text:	section	.text,new
 253  0000               _COMP_Init:
 255  0000 89            	pushw	x
 256       00000000      OFST:	set	0
 259                     ; 154   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
 261                     ; 155   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
 263                     ; 156   assert_param(IS_COMP_SPEED(COMP_Speed));
 265                     ; 159   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
 267  0001 c65442        	ld	a,21570
 268  0004 a4c7          	and	a,#199
 269  0006 c75442        	ld	21570,a
 270                     ; 161   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
 272  0009 9e            	ld	a,xh
 273  000a ca5442        	or	a,21570
 274  000d c75442        	ld	21570,a
 275                     ; 164   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
 277  0010 c65442        	ld	a,21570
 278  0013 a43f          	and	a,#63
 279  0015 c75442        	ld	21570,a
 280                     ; 166   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
 282  0018 9f            	ld	a,xl
 283  0019 ca5442        	or	a,21570
 284  001c c75442        	ld	21570,a
 285                     ; 169   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
 287  001f 72155441      	bres	21569,#2
 288                     ; 171   COMP->CSR2 |= (uint8_t) COMP_Speed;
 290  0023 c65441        	ld	a,21569
 291  0026 1a05          	or	a,(OFST+5,sp)
 292  0028 c75441        	ld	21569,a
 293                     ; 172 }
 296  002b 85            	popw	x
 297  002c 81            	ret	
 353                     ; 180 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
 353                     ; 181 {
 354                     .text:	section	.text,new
 355  0000               _COMP_VrefintToCOMP1Connect:
 359                     ; 183   assert_param(IS_FUNCTIONAL_STATE(NewState));
 361                     ; 185   if (NewState != DISABLE)
 363  0000 4d            	tnz	a
 364  0001 2705          	jreq	L341
 365                     ; 188     COMP->CSR3 |= COMP_CSR3_VREFEN;
 367  0003 72145442      	bset	21570,#2
 370  0007 81            	ret	
 371  0008               L341:
 372                     ; 193     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
 374  0008 72155442      	bres	21570,#2
 375                     ; 195 }
 378  000c 81            	ret	
 473                     ; 209 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
 473                     ; 210 {
 474                     .text:	section	.text,new
 475  0000               _COMP_EdgeConfig:
 477  0000 89            	pushw	x
 478       00000000      OFST:	set	0
 481                     ; 212   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 483                     ; 213   assert_param(IS_COMP_EDGE(COMP_Edge));
 485                     ; 216   if (COMP_Selection == COMP_Selection_COMP1)
 487  0001 9e            	ld	a,xh
 488  0002 4a            	dec	a
 489  0003 2611          	jrne	L312
 490                     ; 219     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
 492  0005 c65440        	ld	a,21568
 493  0008 a4fc          	and	a,#252
 494  000a c75440        	ld	21568,a
 495                     ; 222     COMP->CSR1 |= (uint8_t) COMP_Edge;
 497  000d 9f            	ld	a,xl
 498  000e ca5440        	or	a,21568
 499  0011 c75440        	ld	21568,a
 501  0014 2010          	jra	L512
 502  0016               L312:
 503                     ; 228     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 505  0016 c65441        	ld	a,21569
 506  0019 a4fc          	and	a,#252
 507  001b c75441        	ld	21569,a
 508                     ; 231     COMP->CSR2 |= (uint8_t) COMP_Edge;
 510  001e c65441        	ld	a,21569
 511  0021 1a02          	or	a,(OFST+2,sp)
 512  0023 c75441        	ld	21569,a
 513  0026               L512:
 514                     ; 233 }
 517  0026 85            	popw	x
 518  0027 81            	ret	
 584                     ; 248 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 584                     ; 249 {
 585                     .text:	section	.text,new
 586  0000               _COMP_GetOutputLevel:
 588  0000 88            	push	a
 589       00000001      OFST:	set	1
 592                     ; 253   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 594                     ; 256   if (COMP_Selection == COMP_Selection_COMP1)
 596  0001 4a            	dec	a
 597  0002 2609          	jrne	L742
 598                     ; 259     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 600  0004 7207544002    	btjf	21568,#3,L152
 601                     ; 262       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 603  0009 2007          	jp	LC002
 604  000b               L152:
 605                     ; 268       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 606  000b 2009          	jp	L752
 607  000d               L742:
 608                     ; 275     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 610  000d 7207544104    	btjf	21569,#3,L752
 611                     ; 278       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 613  0012               LC002:
 615  0012 a601          	ld	a,#1
 617  0014 2001          	jra	L552
 618  0016               L752:
 619                     ; 284       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 622  0016 4f            	clr	a
 623  0017               L552:
 624                     ; 289   return (COMP_OutputLevel_TypeDef)(compout);
 628  0017 5b01          	addw	sp,#1
 629  0019 81            	ret	
 664                     ; 321 void COMP_WindowCmd(FunctionalState NewState)
 664                     ; 322 {
 665                     .text:	section	.text,new
 666  0000               _COMP_WindowCmd:
 670                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 672                     ; 326   if (NewState != DISABLE)
 674  0000 4d            	tnz	a
 675  0001 2705          	jreq	L103
 676                     ; 329     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 678  0003 72125442      	bset	21570,#1
 681  0007 81            	ret	
 682  0008               L103:
 683                     ; 334     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 685  0008 72135442      	bres	21570,#1
 686                     ; 336 }
 689  000c 81            	ret	
 725                     ; 359 void COMP_VrefintOutputCmd(FunctionalState NewState)
 725                     ; 360 {
 726                     .text:	section	.text,new
 727  0000               _COMP_VrefintOutputCmd:
 731                     ; 362   assert_param(IS_FUNCTIONAL_STATE(NewState));
 733                     ; 364   if (NewState != DISABLE)
 735  0000 4d            	tnz	a
 736  0001 2705          	jreq	L323
 737                     ; 367     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 739  0003 72105442      	bset	21570,#0
 742  0007 81            	ret	
 743  0008               L323:
 744                     ; 372     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 746  0008 72115442      	bres	21570,#0
 747                     ; 374 }
 750  000c 81            	ret	
 786                     ; 398 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 786                     ; 399 {
 787                     .text:	section	.text,new
 788  0000               _COMP_SchmittTriggerCmd:
 792                     ; 401   assert_param(IS_FUNCTIONAL_STATE(NewState));
 794                     ; 403   if (NewState != DISABLE)
 796  0000 4d            	tnz	a
 797  0001 2705          	jreq	L543
 798                     ; 406     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 800  0003 72145440      	bset	21568,#2
 803  0007 81            	ret	
 804  0008               L543:
 805                     ; 411     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 807  0008 72155440      	bres	21568,#2
 808                     ; 413 }
 811  000c 81            	ret	
 931                     ; 432 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 931                     ; 433                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 931                     ; 434                         FunctionalState NewState)
 931                     ; 435 {
 932                     .text:	section	.text,new
 933  0000               _COMP_TriggerConfig:
 935  0000 89            	pushw	x
 936       00000000      OFST:	set	0
 939                     ; 437   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 941                     ; 438   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 943                     ; 440   switch (COMP_TriggerGroup)
 945  0001 9e            	ld	a,xh
 947                     ; 487     default:
 947                     ; 488       break;
 948  0002 4a            	dec	a
 949  0003 270b          	jreq	L153
 950  0005 4a            	dec	a
 951  0006 2717          	jreq	L353
 952  0008 4a            	dec	a
 953  0009 2730          	jreq	L553
 954  000b 4a            	dec	a
 955  000c 2740          	jreq	L753
 956  000e 2058          	jra	L144
 957  0010               L153:
 958                     ; 442     case COMP_TriggerGroup_InvertingInput:
 958                     ; 443 
 958                     ; 444       if (NewState != DISABLE)
 960  0010 7b05          	ld	a,(OFST+5,sp)
 961  0012 2704          	jreq	L344
 962                     ; 446         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 964  0014 7b02          	ld	a,(OFST+2,sp)
 966  0016 2010          	jp	LC005
 967  0018               L344:
 968                     ; 450         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 970  0018 c65443        	ld	a,21571
 971  001b 1a02          	or	a,(OFST+2,sp)
 972  001d 2017          	jp	LC004
 973  001f               L353:
 974                     ; 454     case COMP_TriggerGroup_NonInvertingInput:
 974                     ; 455       if (NewState != DISABLE)
 976  001f 7b05          	ld	a,(OFST+5,sp)
 977  0021 270b          	jreq	L744
 978                     ; 457         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 980  0023 7b02          	ld	a,(OFST+2,sp)
 981  0025 48            	sll	a
 982  0026 48            	sll	a
 983  0027 48            	sll	a
 984  0028               LC005:
 985  0028 43            	cpl	a
 986  0029 c45443        	and	a,21571
 988  002c 2008          	jp	LC004
 989  002e               L744:
 990                     ; 461         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
 992  002e 7b02          	ld	a,(OFST+2,sp)
 993  0030 48            	sll	a
 994  0031 48            	sll	a
 995  0032 48            	sll	a
 996  0033 ca5443        	or	a,21571
 997  0036               LC004:
 998  0036 c75443        	ld	21571,a
 999  0039 202d          	jra	L144
1000  003b               L553:
1001                     ; 465     case COMP_TriggerGroup_VREFINTOutput:
1001                     ; 466       if (NewState != DISABLE)
1003  003b 7b05          	ld	a,(OFST+5,sp)
1004  003d 2708          	jreq	L354
1005                     ; 468         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
1007  003f 7b02          	ld	a,(OFST+2,sp)
1008  0041 43            	cpl	a
1009  0042 c45444        	and	a,21572
1011  0045 201e          	jp	LC003
1012  0047               L354:
1013                     ; 472         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
1015  0047 c65444        	ld	a,21572
1016  004a 1a02          	or	a,(OFST+2,sp)
1017  004c 2017          	jp	LC003
1018  004e               L753:
1019                     ; 476     case COMP_TriggerGroup_DACOutput:
1019                     ; 477       if (NewState != DISABLE)
1021  004e 7b05          	ld	a,(OFST+5,sp)
1022  0050 270b          	jreq	L754
1023                     ; 479         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
1025  0052 7b02          	ld	a,(OFST+2,sp)
1026  0054 48            	sll	a
1027  0055 48            	sll	a
1028  0056 48            	sll	a
1029  0057 43            	cpl	a
1030  0058 c45444        	and	a,21572
1032  005b 2008          	jp	LC003
1033  005d               L754:
1034                     ; 483         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
1036  005d 7b02          	ld	a,(OFST+2,sp)
1037  005f 48            	sll	a
1038  0060 48            	sll	a
1039  0061 48            	sll	a
1040  0062 ca5444        	or	a,21572
1041  0065               LC003:
1042  0065 c75444        	ld	21572,a
1043                     ; 487     default:
1043                     ; 488       break;
1045  0068               L144:
1046                     ; 490 }
1049  0068 85            	popw	x
1050  0069 81            	ret	
1095                     ; 518 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
1095                     ; 519 {
1096                     .text:	section	.text,new
1097  0000               _COMP_ITConfig:
1099  0000 89            	pushw	x
1100       00000000      OFST:	set	0
1103                     ; 521   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1105                     ; 522   assert_param(IS_FUNCTIONAL_STATE(NewState));
1107                     ; 525   if (COMP_Selection == COMP_Selection_COMP1)
1109  0001 9e            	ld	a,xh
1110  0002 4a            	dec	a
1111  0003 2610          	jrne	L505
1112                     ; 527     if (NewState != DISABLE)
1114  0005 9f            	ld	a,xl
1115  0006 4d            	tnz	a
1116  0007 2706          	jreq	L705
1117                     ; 530       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
1119  0009 721a5440      	bset	21568,#5
1121  000d 2014          	jra	L315
1122  000f               L705:
1123                     ; 535       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
1125  000f 721b5440      	bres	21568,#5
1126  0013 200e          	jra	L315
1127  0015               L505:
1128                     ; 540     if (NewState != DISABLE)
1130  0015 7b02          	ld	a,(OFST+2,sp)
1131  0017 2706          	jreq	L515
1132                     ; 543       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
1134  0019 721a5441      	bset	21569,#5
1136  001d 2004          	jra	L315
1137  001f               L515:
1138                     ; 548       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
1140  001f 721b5441      	bres	21569,#5
1141  0023               L315:
1142                     ; 551 }
1145  0023 85            	popw	x
1146  0024 81            	ret	
1212                     ; 561 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
1212                     ; 562 {
1213                     .text:	section	.text,new
1214  0000               _COMP_GetFlagStatus:
1216  0000 88            	push	a
1217       00000001      OFST:	set	1
1220                     ; 563   FlagStatus bitstatus = RESET;
1222                     ; 566   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1224                     ; 569   if (COMP_Selection == COMP_Selection_COMP1)
1226  0001 4a            	dec	a
1227  0002 2609          	jrne	L355
1228                     ; 571     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
1230  0004 7209544002    	btjf	21568,#4,L555
1231                     ; 574       bitstatus = SET;
1233  0009 2007          	jp	LC007
1234  000b               L555:
1235                     ; 579       bitstatus = RESET;
1236  000b 2009          	jp	L365
1237  000d               L355:
1238                     ; 584     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
1240  000d 7209544104    	btjf	21569,#4,L365
1241                     ; 587       bitstatus = SET;
1243  0012               LC007:
1245  0012 a601          	ld	a,#1
1247  0014 2001          	jra	L165
1248  0016               L365:
1249                     ; 592       bitstatus = RESET;
1252  0016 4f            	clr	a
1253  0017               L165:
1254                     ; 597   return (FlagStatus)(bitstatus);
1258  0017 5b01          	addw	sp,#1
1259  0019 81            	ret	
1294                     ; 608 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
1294                     ; 609 {
1295                     .text:	section	.text,new
1296  0000               _COMP_ClearFlag:
1300                     ; 611   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1302                     ; 613   if (COMP_Selection == COMP_Selection_COMP1)
1304  0000 4a            	dec	a
1305  0001 2605          	jrne	L506
1306                     ; 616     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1308  0003 72195440      	bres	21568,#4
1311  0007 81            	ret	
1312  0008               L506:
1313                     ; 621     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1315  0008 72195441      	bres	21569,#4
1316                     ; 623 }
1319  000c 81            	ret	
1379                     ; 633 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
1379                     ; 634 {
1380                     .text:	section	.text,new
1381  0000               _COMP_GetITStatus:
1383  0000 89            	pushw	x
1384       00000002      OFST:	set	2
1387                     ; 635   ITStatus bitstatus = RESET;
1389                     ; 636   uint8_t itstatus = 0x00, itenable = 0x00;
1393                     ; 639   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1395                     ; 641   if (COMP_Selection == COMP_Selection_COMP1)
1397  0001 4a            	dec	a
1398  0002 2618          	jrne	L736
1399                     ; 644     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
1401  0004 c65440        	ld	a,21568
1402  0007 a410          	and	a,#16
1403  0009 6b01          	ld	(OFST-1,sp),a
1404                     ; 647     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
1406  000b c65440        	ld	a,21568
1407  000e a420          	and	a,#32
1408  0010 6b02          	ld	(OFST+0,sp),a
1409                     ; 649     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
1411  0012 7b01          	ld	a,(OFST-1,sp)
1412  0014 2720          	jreq	L746
1414  0016 7b02          	ld	a,(OFST+0,sp)
1415  0018 271c          	jreq	L746
1416                     ; 652       bitstatus = SET;
1418  001a 2016          	jp	LC009
1419                     ; 657       bitstatus = RESET;
1420  001c               L736:
1421                     ; 663     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
1423  001c c65441        	ld	a,21569
1424  001f a410          	and	a,#16
1425  0021 6b01          	ld	(OFST-1,sp),a
1426                     ; 666     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
1428  0023 c65441        	ld	a,21569
1429  0026 a420          	and	a,#32
1430  0028 6b02          	ld	(OFST+0,sp),a
1431                     ; 668     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
1433  002a 7b01          	ld	a,(OFST-1,sp)
1434  002c 2708          	jreq	L746
1436  002e 7b02          	ld	a,(OFST+0,sp)
1437  0030 2704          	jreq	L746
1438                     ; 671       bitstatus = SET;
1440  0032               LC009:
1442  0032 a601          	ld	a,#1
1444  0034 2001          	jra	L546
1445  0036               L746:
1446                     ; 676       bitstatus = RESET;
1449  0036 4f            	clr	a
1450  0037               L546:
1451                     ; 681   return (ITStatus) bitstatus;
1455  0037 85            	popw	x
1456  0038 81            	ret	
1492                     ; 692 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
1492                     ; 693 {
1493                     .text:	section	.text,new
1494  0000               _COMP_ClearITPendingBit:
1498                     ; 695   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1500                     ; 697   if (COMP_Selection == COMP_Selection_COMP1)
1502  0000 4a            	dec	a
1503  0001 2605          	jrne	L176
1504                     ; 700     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1506  0003 72195440      	bres	21568,#4
1509  0007 81            	ret	
1510  0008               L176:
1511                     ; 705     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1513  0008 72195441      	bres	21569,#4
1514                     ; 707 }
1517  000c 81            	ret	
1530                     	xdef	_COMP_ClearITPendingBit
1531                     	xdef	_COMP_GetITStatus
1532                     	xdef	_COMP_ClearFlag
1533                     	xdef	_COMP_GetFlagStatus
1534                     	xdef	_COMP_ITConfig
1535                     	xdef	_COMP_TriggerConfig
1536                     	xdef	_COMP_SchmittTriggerCmd
1537                     	xdef	_COMP_VrefintOutputCmd
1538                     	xdef	_COMP_WindowCmd
1539                     	xdef	_COMP_GetOutputLevel
1540                     	xdef	_COMP_EdgeConfig
1541                     	xdef	_COMP_VrefintToCOMP1Connect
1542                     	xdef	_COMP_Init
1543                     	xdef	_COMP_DeInit
1562                     	end
