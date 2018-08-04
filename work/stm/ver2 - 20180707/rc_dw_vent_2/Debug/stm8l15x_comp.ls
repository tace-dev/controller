   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 108 void COMP_DeInit(void)
  50                     ; 109 {
  51                     .text:	section	.text,new
  52  0000               f_COMP_DeInit:
  56                     ; 111   COMP->CSR1 = (uint8_t) COMP_CSR1_RESET_VALUE;
  58  0000 725f5440      	clr	21568
  59                     ; 114   COMP->CSR2 = (uint8_t) COMP_CSR2_RESET_VALUE;
  61  0004 725f5441      	clr	21569
  62                     ; 117   COMP->CSR3 = (uint8_t) COMP_CSR3_RESET_VALUE;
  64  0008 35c05442      	mov	21570,#192
  65                     ; 120   COMP->CSR4 = (uint8_t) COMP_CSR4_RESET_VALUE;
  67  000c 725f5443      	clr	21571
  68                     ; 123   COMP->CSR5 = (uint8_t) COMP_CSR5_RESET_VALUE;
  70  0010 725f5444      	clr	21572
  71                     ; 124 }
  74  0014 87            	retf	
 249                     ; 150 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
 249                     ; 151                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
 249                     ; 152 {
 250                     .text:	section	.text,new
 251  0000               f_COMP_Init:
 253  0000 89            	pushw	x
 254       00000000      OFST:	set	0
 257                     ; 154   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
 259                     ; 155   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
 261                     ; 156   assert_param(IS_COMP_SPEED(COMP_Speed));
 263                     ; 159   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
 265  0001 c65442        	ld	a,21570
 266  0004 a4c7          	and	a,#199
 267  0006 c75442        	ld	21570,a
 268                     ; 161   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
 270  0009 9e            	ld	a,xh
 271  000a ca5442        	or	a,21570
 272  000d c75442        	ld	21570,a
 273                     ; 164   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
 275  0010 c65442        	ld	a,21570
 276  0013 a43f          	and	a,#63
 277  0015 c75442        	ld	21570,a
 278                     ; 166   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
 280  0018 9f            	ld	a,xl
 281  0019 ca5442        	or	a,21570
 282  001c c75442        	ld	21570,a
 283                     ; 169   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
 285  001f 72155441      	bres	21569,#2
 286                     ; 171   COMP->CSR2 |= (uint8_t) COMP_Speed;
 288  0023 c65441        	ld	a,21569
 289  0026 1a06          	or	a,(OFST+6,sp)
 290  0028 c75441        	ld	21569,a
 291                     ; 172 }
 294  002b 85            	popw	x
 295  002c 87            	retf	
 350                     ; 180 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
 350                     ; 181 {
 351                     .text:	section	.text,new
 352  0000               f_COMP_VrefintToCOMP1Connect:
 356                     ; 183   assert_param(IS_FUNCTIONAL_STATE(NewState));
 358                     ; 185   if (NewState != DISABLE)
 360  0000 4d            	tnz	a
 361  0001 2705          	jreq	L341
 362                     ; 188     COMP->CSR3 |= COMP_CSR3_VREFEN;
 364  0003 72145442      	bset	21570,#2
 367  0007 87            	retf	
 368  0008               L341:
 369                     ; 193     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
 371  0008 72155442      	bres	21570,#2
 372                     ; 195 }
 375  000c 87            	retf	
 469                     ; 209 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
 469                     ; 210 {
 470                     .text:	section	.text,new
 471  0000               f_COMP_EdgeConfig:
 473  0000 89            	pushw	x
 474       00000000      OFST:	set	0
 477                     ; 212   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 479                     ; 213   assert_param(IS_COMP_EDGE(COMP_Edge));
 481                     ; 216   if (COMP_Selection == COMP_Selection_COMP1)
 483  0001 9e            	ld	a,xh
 484  0002 4a            	dec	a
 485  0003 2611          	jrne	L312
 486                     ; 219     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
 488  0005 c65440        	ld	a,21568
 489  0008 a4fc          	and	a,#252
 490  000a c75440        	ld	21568,a
 491                     ; 222     COMP->CSR1 |= (uint8_t) COMP_Edge;
 493  000d 9f            	ld	a,xl
 494  000e ca5440        	or	a,21568
 495  0011 c75440        	ld	21568,a
 497  0014 2010          	jra	L512
 498  0016               L312:
 499                     ; 228     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 501  0016 c65441        	ld	a,21569
 502  0019 a4fc          	and	a,#252
 503  001b c75441        	ld	21569,a
 504                     ; 231     COMP->CSR2 |= (uint8_t) COMP_Edge;
 506  001e c65441        	ld	a,21569
 507  0021 1a02          	or	a,(OFST+2,sp)
 508  0023 c75441        	ld	21569,a
 509  0026               L512:
 510                     ; 233 }
 513  0026 85            	popw	x
 514  0027 87            	retf	
 579                     ; 248 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 579                     ; 249 {
 580                     .text:	section	.text,new
 581  0000               f_COMP_GetOutputLevel:
 583  0000 88            	push	a
 584       00000001      OFST:	set	1
 587                     ; 253   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 589                     ; 256   if (COMP_Selection == COMP_Selection_COMP1)
 591  0001 4a            	dec	a
 592  0002 2609          	jrne	L742
 593                     ; 259     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 595  0004 7207544002    	btjf	21568,#3,L152
 596                     ; 262       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 598  0009 2007          	jpf	LC002
 599  000b               L152:
 600                     ; 268       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 601  000b 2009          	jpf	L752
 602  000d               L742:
 603                     ; 275     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 605  000d 7207544104    	btjf	21569,#3,L752
 606                     ; 278       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 608  0012               LC002:
 610  0012 a601          	ld	a,#1
 612  0014 2001          	jra	L552
 613  0016               L752:
 614                     ; 284       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 617  0016 4f            	clr	a
 618  0017               L552:
 619                     ; 289   return (COMP_OutputLevel_TypeDef)(compout);
 623  0017 5b01          	addw	sp,#1
 624  0019 87            	retf	
 658                     ; 321 void COMP_WindowCmd(FunctionalState NewState)
 658                     ; 322 {
 659                     .text:	section	.text,new
 660  0000               f_COMP_WindowCmd:
 664                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 666                     ; 326   if (NewState != DISABLE)
 668  0000 4d            	tnz	a
 669  0001 2705          	jreq	L103
 670                     ; 329     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 672  0003 72125442      	bset	21570,#1
 675  0007 87            	retf	
 676  0008               L103:
 677                     ; 334     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 679  0008 72135442      	bres	21570,#1
 680                     ; 336 }
 683  000c 87            	retf	
 718                     ; 359 void COMP_VrefintOutputCmd(FunctionalState NewState)
 718                     ; 360 {
 719                     .text:	section	.text,new
 720  0000               f_COMP_VrefintOutputCmd:
 724                     ; 362   assert_param(IS_FUNCTIONAL_STATE(NewState));
 726                     ; 364   if (NewState != DISABLE)
 728  0000 4d            	tnz	a
 729  0001 2705          	jreq	L323
 730                     ; 367     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 732  0003 72105442      	bset	21570,#0
 735  0007 87            	retf	
 736  0008               L323:
 737                     ; 372     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 739  0008 72115442      	bres	21570,#0
 740                     ; 374 }
 743  000c 87            	retf	
 778                     ; 398 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 778                     ; 399 {
 779                     .text:	section	.text,new
 780  0000               f_COMP_SchmittTriggerCmd:
 784                     ; 401   assert_param(IS_FUNCTIONAL_STATE(NewState));
 786                     ; 403   if (NewState != DISABLE)
 788  0000 4d            	tnz	a
 789  0001 2705          	jreq	L543
 790                     ; 406     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 792  0003 72145440      	bset	21568,#2
 795  0007 87            	retf	
 796  0008               L543:
 797                     ; 411     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 799  0008 72155440      	bres	21568,#2
 800                     ; 413 }
 803  000c 87            	retf	
 922                     ; 432 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 922                     ; 433                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 922                     ; 434                         FunctionalState NewState)
 922                     ; 435 {
 923                     .text:	section	.text,new
 924  0000               f_COMP_TriggerConfig:
 926  0000 89            	pushw	x
 927       00000000      OFST:	set	0
 930                     ; 437   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 932                     ; 438   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 934                     ; 440   switch (COMP_TriggerGroup)
 936  0001 9e            	ld	a,xh
 938                     ; 487     default:
 938                     ; 488       break;
 939  0002 4a            	dec	a
 940  0003 270b          	jreq	L153
 941  0005 4a            	dec	a
 942  0006 2717          	jreq	L353
 943  0008 4a            	dec	a
 944  0009 2730          	jreq	L553
 945  000b 4a            	dec	a
 946  000c 2740          	jreq	L753
 947  000e 2058          	jra	L144
 948  0010               L153:
 949                     ; 442     case COMP_TriggerGroup_InvertingInput:
 949                     ; 443 
 949                     ; 444       if (NewState != DISABLE)
 951  0010 7b06          	ld	a,(OFST+6,sp)
 952  0012 2704          	jreq	L344
 953                     ; 446         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 955  0014 7b02          	ld	a,(OFST+2,sp)
 957  0016 2010          	jpf	LC005
 958  0018               L344:
 959                     ; 450         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 961  0018 c65443        	ld	a,21571
 962  001b 1a02          	or	a,(OFST+2,sp)
 963  001d 2017          	jpf	LC004
 964  001f               L353:
 965                     ; 454     case COMP_TriggerGroup_NonInvertingInput:
 965                     ; 455       if (NewState != DISABLE)
 967  001f 7b06          	ld	a,(OFST+6,sp)
 968  0021 270b          	jreq	L744
 969                     ; 457         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 971  0023 7b02          	ld	a,(OFST+2,sp)
 972  0025 48            	sll	a
 973  0026 48            	sll	a
 974  0027 48            	sll	a
 975  0028               LC005:
 976  0028 43            	cpl	a
 977  0029 c45443        	and	a,21571
 979  002c 2008          	jpf	LC004
 980  002e               L744:
 981                     ; 461         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
 983  002e 7b02          	ld	a,(OFST+2,sp)
 984  0030 48            	sll	a
 985  0031 48            	sll	a
 986  0032 48            	sll	a
 987  0033 ca5443        	or	a,21571
 988  0036               LC004:
 989  0036 c75443        	ld	21571,a
 990  0039 202d          	jra	L144
 991  003b               L553:
 992                     ; 465     case COMP_TriggerGroup_VREFINTOutput:
 992                     ; 466       if (NewState != DISABLE)
 994  003b 7b06          	ld	a,(OFST+6,sp)
 995  003d 2708          	jreq	L354
 996                     ; 468         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
 998  003f 7b02          	ld	a,(OFST+2,sp)
 999  0041 43            	cpl	a
1000  0042 c45444        	and	a,21572
1002  0045 201e          	jpf	LC003
1003  0047               L354:
1004                     ; 472         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
1006  0047 c65444        	ld	a,21572
1007  004a 1a02          	or	a,(OFST+2,sp)
1008  004c 2017          	jpf	LC003
1009  004e               L753:
1010                     ; 476     case COMP_TriggerGroup_DACOutput:
1010                     ; 477       if (NewState != DISABLE)
1012  004e 7b06          	ld	a,(OFST+6,sp)
1013  0050 270b          	jreq	L754
1014                     ; 479         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
1016  0052 7b02          	ld	a,(OFST+2,sp)
1017  0054 48            	sll	a
1018  0055 48            	sll	a
1019  0056 48            	sll	a
1020  0057 43            	cpl	a
1021  0058 c45444        	and	a,21572
1023  005b 2008          	jpf	LC003
1024  005d               L754:
1025                     ; 483         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
1027  005d 7b02          	ld	a,(OFST+2,sp)
1028  005f 48            	sll	a
1029  0060 48            	sll	a
1030  0061 48            	sll	a
1031  0062 ca5444        	or	a,21572
1032  0065               LC003:
1033  0065 c75444        	ld	21572,a
1034                     ; 487     default:
1034                     ; 488       break;
1036  0068               L144:
1037                     ; 490 }
1040  0068 85            	popw	x
1041  0069 87            	retf	
1085                     ; 518 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
1085                     ; 519 {
1086                     .text:	section	.text,new
1087  0000               f_COMP_ITConfig:
1089  0000 89            	pushw	x
1090       00000000      OFST:	set	0
1093                     ; 521   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1095                     ; 522   assert_param(IS_FUNCTIONAL_STATE(NewState));
1097                     ; 525   if (COMP_Selection == COMP_Selection_COMP1)
1099  0001 9e            	ld	a,xh
1100  0002 4a            	dec	a
1101  0003 2610          	jrne	L505
1102                     ; 527     if (NewState != DISABLE)
1104  0005 9f            	ld	a,xl
1105  0006 4d            	tnz	a
1106  0007 2706          	jreq	L705
1107                     ; 530       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
1109  0009 721a5440      	bset	21568,#5
1111  000d 2014          	jra	L315
1112  000f               L705:
1113                     ; 535       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
1115  000f 721b5440      	bres	21568,#5
1116  0013 200e          	jra	L315
1117  0015               L505:
1118                     ; 540     if (NewState != DISABLE)
1120  0015 7b02          	ld	a,(OFST+2,sp)
1121  0017 2706          	jreq	L515
1122                     ; 543       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
1124  0019 721a5441      	bset	21569,#5
1126  001d 2004          	jra	L315
1127  001f               L515:
1128                     ; 548       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
1130  001f 721b5441      	bres	21569,#5
1131  0023               L315:
1132                     ; 551 }
1135  0023 85            	popw	x
1136  0024 87            	retf	
1201                     ; 561 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
1201                     ; 562 {
1202                     .text:	section	.text,new
1203  0000               f_COMP_GetFlagStatus:
1205  0000 88            	push	a
1206       00000001      OFST:	set	1
1209                     ; 563   FlagStatus bitstatus = RESET;
1211                     ; 566   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1213                     ; 569   if (COMP_Selection == COMP_Selection_COMP1)
1215  0001 4a            	dec	a
1216  0002 2609          	jrne	L355
1217                     ; 571     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
1219  0004 7209544002    	btjf	21568,#4,L555
1220                     ; 574       bitstatus = SET;
1222  0009 2007          	jpf	LC007
1223  000b               L555:
1224                     ; 579       bitstatus = RESET;
1225  000b 2009          	jpf	L365
1226  000d               L355:
1227                     ; 584     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
1229  000d 7209544104    	btjf	21569,#4,L365
1230                     ; 587       bitstatus = SET;
1232  0012               LC007:
1234  0012 a601          	ld	a,#1
1236  0014 2001          	jra	L165
1237  0016               L365:
1238                     ; 592       bitstatus = RESET;
1241  0016 4f            	clr	a
1242  0017               L165:
1243                     ; 597   return (FlagStatus)(bitstatus);
1247  0017 5b01          	addw	sp,#1
1248  0019 87            	retf	
1282                     ; 608 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
1282                     ; 609 {
1283                     .text:	section	.text,new
1284  0000               f_COMP_ClearFlag:
1288                     ; 611   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1290                     ; 613   if (COMP_Selection == COMP_Selection_COMP1)
1292  0000 4a            	dec	a
1293  0001 2605          	jrne	L506
1294                     ; 616     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1296  0003 72195440      	bres	21568,#4
1299  0007 87            	retf	
1300  0008               L506:
1301                     ; 621     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1303  0008 72195441      	bres	21569,#4
1304                     ; 623 }
1307  000c 87            	retf	
1366                     ; 633 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
1366                     ; 634 {
1367                     .text:	section	.text,new
1368  0000               f_COMP_GetITStatus:
1370  0000 89            	pushw	x
1371       00000002      OFST:	set	2
1374                     ; 635   ITStatus bitstatus = RESET;
1376                     ; 636   uint8_t itstatus = 0x00, itenable = 0x00;
1380                     ; 639   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1382                     ; 641   if (COMP_Selection == COMP_Selection_COMP1)
1384  0001 4a            	dec	a
1385  0002 2618          	jrne	L736
1386                     ; 644     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
1388  0004 c65440        	ld	a,21568
1389  0007 a410          	and	a,#16
1390  0009 6b01          	ld	(OFST-1,sp),a
1391                     ; 647     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
1393  000b c65440        	ld	a,21568
1394  000e a420          	and	a,#32
1395  0010 6b02          	ld	(OFST+0,sp),a
1396                     ; 649     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
1398  0012 7b01          	ld	a,(OFST-1,sp)
1399  0014 2720          	jreq	L746
1401  0016 7b02          	ld	a,(OFST+0,sp)
1402  0018 271c          	jreq	L746
1403                     ; 652       bitstatus = SET;
1405  001a 2016          	jpf	LC009
1406                     ; 657       bitstatus = RESET;
1407  001c               L736:
1408                     ; 663     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
1410  001c c65441        	ld	a,21569
1411  001f a410          	and	a,#16
1412  0021 6b01          	ld	(OFST-1,sp),a
1413                     ; 666     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
1415  0023 c65441        	ld	a,21569
1416  0026 a420          	and	a,#32
1417  0028 6b02          	ld	(OFST+0,sp),a
1418                     ; 668     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
1420  002a 7b01          	ld	a,(OFST-1,sp)
1421  002c 2708          	jreq	L746
1423  002e 7b02          	ld	a,(OFST+0,sp)
1424  0030 2704          	jreq	L746
1425                     ; 671       bitstatus = SET;
1427  0032               LC009:
1429  0032 a601          	ld	a,#1
1431  0034 2001          	jra	L546
1432  0036               L746:
1433                     ; 676       bitstatus = RESET;
1436  0036 4f            	clr	a
1437  0037               L546:
1438                     ; 681   return (ITStatus) bitstatus;
1442  0037 85            	popw	x
1443  0038 87            	retf	
1478                     ; 692 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
1478                     ; 693 {
1479                     .text:	section	.text,new
1480  0000               f_COMP_ClearITPendingBit:
1484                     ; 695   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1486                     ; 697   if (COMP_Selection == COMP_Selection_COMP1)
1488  0000 4a            	dec	a
1489  0001 2605          	jrne	L176
1490                     ; 700     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1492  0003 72195440      	bres	21568,#4
1495  0007 87            	retf	
1496  0008               L176:
1497                     ; 705     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1499  0008 72195441      	bres	21569,#4
1500                     ; 707 }
1503  000c 87            	retf	
1515                     	xdef	f_COMP_ClearITPendingBit
1516                     	xdef	f_COMP_GetITStatus
1517                     	xdef	f_COMP_ClearFlag
1518                     	xdef	f_COMP_GetFlagStatus
1519                     	xdef	f_COMP_ITConfig
1520                     	xdef	f_COMP_TriggerConfig
1521                     	xdef	f_COMP_SchmittTriggerCmd
1522                     	xdef	f_COMP_VrefintOutputCmd
1523                     	xdef	f_COMP_WindowCmd
1524                     	xdef	f_COMP_GetOutputLevel
1525                     	xdef	f_COMP_EdgeConfig
1526                     	xdef	f_COMP_VrefintToCOMP1Connect
1527                     	xdef	f_COMP_Init
1528                     	xdef	f_COMP_DeInit
1547                     	end
