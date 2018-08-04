   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  49                     ; 108 void COMP_DeInit(void)
  49                     ; 109 {
  51                     	switch	.text
  52  0000               _COMP_DeInit:
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
  74  0014 81            	ret	
 250                     ; 150 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
 250                     ; 151                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
 250                     ; 152 {
 251                     	switch	.text
 252  0015               _COMP_Init:
 254  0015 89            	pushw	x
 255       00000000      OFST:	set	0
 258                     ; 154   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
 260                     ; 155   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
 262                     ; 156   assert_param(IS_COMP_SPEED(COMP_Speed));
 264                     ; 159   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
 266  0016 c65442        	ld	a,21570
 267  0019 a4c7          	and	a,#199
 268  001b c75442        	ld	21570,a
 269                     ; 161   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
 271  001e 9e            	ld	a,xh
 272  001f ca5442        	or	a,21570
 273  0022 c75442        	ld	21570,a
 274                     ; 164   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
 276  0025 c65442        	ld	a,21570
 277  0028 a43f          	and	a,#63
 278  002a c75442        	ld	21570,a
 279                     ; 166   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
 281  002d 9f            	ld	a,xl
 282  002e ca5442        	or	a,21570
 283  0031 c75442        	ld	21570,a
 284                     ; 169   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
 286  0034 72155441      	bres	21569,#2
 287                     ; 171   COMP->CSR2 |= (uint8_t) COMP_Speed;
 289  0038 c65441        	ld	a,21569
 290  003b 1a05          	or	a,(OFST+5,sp)
 291  003d c75441        	ld	21569,a
 292                     ; 172 }
 295  0040 85            	popw	x
 296  0041 81            	ret	
 352                     ; 180 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
 352                     ; 181 {
 353                     	switch	.text
 354  0042               _COMP_VrefintToCOMP1Connect:
 358                     ; 183   assert_param(IS_FUNCTIONAL_STATE(NewState));
 360                     ; 185   if (NewState != DISABLE)
 362  0042 4d            	tnz	a
 363  0043 2705          	jreq	L341
 364                     ; 188     COMP->CSR3 |= COMP_CSR3_VREFEN;
 366  0045 72145442      	bset	21570,#2
 369  0049 81            	ret	
 370  004a               L341:
 371                     ; 193     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
 373  004a 72155442      	bres	21570,#2
 374                     ; 195 }
 377  004e 81            	ret	
 472                     ; 209 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
 472                     ; 210 {
 473                     	switch	.text
 474  004f               _COMP_EdgeConfig:
 476  004f 89            	pushw	x
 477       00000000      OFST:	set	0
 480                     ; 212   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 482                     ; 213   assert_param(IS_COMP_EDGE(COMP_Edge));
 484                     ; 216   if (COMP_Selection == COMP_Selection_COMP1)
 486  0050 9e            	ld	a,xh
 487  0051 4a            	dec	a
 488  0052 2611          	jrne	L312
 489                     ; 219     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
 491  0054 c65440        	ld	a,21568
 492  0057 a4fc          	and	a,#252
 493  0059 c75440        	ld	21568,a
 494                     ; 222     COMP->CSR1 |= (uint8_t) COMP_Edge;
 496  005c 9f            	ld	a,xl
 497  005d ca5440        	or	a,21568
 498  0060 c75440        	ld	21568,a
 500  0063 2010          	jra	L512
 501  0065               L312:
 502                     ; 228     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 504  0065 c65441        	ld	a,21569
 505  0068 a4fc          	and	a,#252
 506  006a c75441        	ld	21569,a
 507                     ; 231     COMP->CSR2 |= (uint8_t) COMP_Edge;
 509  006d c65441        	ld	a,21569
 510  0070 1a02          	or	a,(OFST+2,sp)
 511  0072 c75441        	ld	21569,a
 512  0075               L512:
 513                     ; 233 }
 516  0075 85            	popw	x
 517  0076 81            	ret	
 583                     ; 248 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 583                     ; 249 {
 584                     	switch	.text
 585  0077               _COMP_GetOutputLevel:
 587  0077 88            	push	a
 588       00000001      OFST:	set	1
 591                     ; 253   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 593                     ; 256   if (COMP_Selection == COMP_Selection_COMP1)
 595  0078 4a            	dec	a
 596  0079 2609          	jrne	L742
 597                     ; 259     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 599  007b 7207544002    	btjf	21568,#3,L152
 600                     ; 262       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 602  0080 2007          	jp	LC002
 603  0082               L152:
 604                     ; 268       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 605  0082 2009          	jp	L752
 606  0084               L742:
 607                     ; 275     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 609  0084 7207544104    	btjf	21569,#3,L752
 610                     ; 278       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 612  0089               LC002:
 614  0089 a601          	ld	a,#1
 616  008b 2001          	jra	L552
 617  008d               L752:
 618                     ; 284       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 621  008d 4f            	clr	a
 622  008e               L552:
 623                     ; 289   return (COMP_OutputLevel_TypeDef)(compout);
 627  008e 5b01          	addw	sp,#1
 628  0090 81            	ret	
 663                     ; 321 void COMP_WindowCmd(FunctionalState NewState)
 663                     ; 322 {
 664                     	switch	.text
 665  0091               _COMP_WindowCmd:
 669                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 671                     ; 326   if (NewState != DISABLE)
 673  0091 4d            	tnz	a
 674  0092 2705          	jreq	L103
 675                     ; 329     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 677  0094 72125442      	bset	21570,#1
 680  0098 81            	ret	
 681  0099               L103:
 682                     ; 334     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 684  0099 72135442      	bres	21570,#1
 685                     ; 336 }
 688  009d 81            	ret	
 724                     ; 359 void COMP_VrefintOutputCmd(FunctionalState NewState)
 724                     ; 360 {
 725                     	switch	.text
 726  009e               _COMP_VrefintOutputCmd:
 730                     ; 362   assert_param(IS_FUNCTIONAL_STATE(NewState));
 732                     ; 364   if (NewState != DISABLE)
 734  009e 4d            	tnz	a
 735  009f 2705          	jreq	L323
 736                     ; 367     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 738  00a1 72105442      	bset	21570,#0
 741  00a5 81            	ret	
 742  00a6               L323:
 743                     ; 372     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 745  00a6 72115442      	bres	21570,#0
 746                     ; 374 }
 749  00aa 81            	ret	
 785                     ; 398 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 785                     ; 399 {
 786                     	switch	.text
 787  00ab               _COMP_SchmittTriggerCmd:
 791                     ; 401   assert_param(IS_FUNCTIONAL_STATE(NewState));
 793                     ; 403   if (NewState != DISABLE)
 795  00ab 4d            	tnz	a
 796  00ac 2705          	jreq	L543
 797                     ; 406     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 799  00ae 72145440      	bset	21568,#2
 802  00b2 81            	ret	
 803  00b3               L543:
 804                     ; 411     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 806  00b3 72155440      	bres	21568,#2
 807                     ; 413 }
 810  00b7 81            	ret	
 930                     ; 432 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 930                     ; 433                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 930                     ; 434                         FunctionalState NewState)
 930                     ; 435 {
 931                     	switch	.text
 932  00b8               _COMP_TriggerConfig:
 934  00b8 89            	pushw	x
 935       00000000      OFST:	set	0
 938                     ; 437   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 940                     ; 438   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 942                     ; 440   switch (COMP_TriggerGroup)
 944  00b9 9e            	ld	a,xh
 946                     ; 487     default:
 946                     ; 488       break;
 947  00ba 4a            	dec	a
 948  00bb 270b          	jreq	L153
 949  00bd 4a            	dec	a
 950  00be 2717          	jreq	L353
 951  00c0 4a            	dec	a
 952  00c1 2730          	jreq	L553
 953  00c3 4a            	dec	a
 954  00c4 2740          	jreq	L753
 955  00c6 2058          	jra	L144
 956  00c8               L153:
 957                     ; 442     case COMP_TriggerGroup_InvertingInput:
 957                     ; 443 
 957                     ; 444       if (NewState != DISABLE)
 959  00c8 7b05          	ld	a,(OFST+5,sp)
 960  00ca 2704          	jreq	L344
 961                     ; 446         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 963  00cc 7b02          	ld	a,(OFST+2,sp)
 965  00ce 2010          	jp	LC005
 966  00d0               L344:
 967                     ; 450         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 969  00d0 c65443        	ld	a,21571
 970  00d3 1a02          	or	a,(OFST+2,sp)
 971  00d5 2017          	jp	LC004
 972  00d7               L353:
 973                     ; 454     case COMP_TriggerGroup_NonInvertingInput:
 973                     ; 455       if (NewState != DISABLE)
 975  00d7 7b05          	ld	a,(OFST+5,sp)
 976  00d9 270b          	jreq	L744
 977                     ; 457         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 979  00db 7b02          	ld	a,(OFST+2,sp)
 980  00dd 48            	sll	a
 981  00de 48            	sll	a
 982  00df 48            	sll	a
 983  00e0               LC005:
 984  00e0 43            	cpl	a
 985  00e1 c45443        	and	a,21571
 987  00e4 2008          	jp	LC004
 988  00e6               L744:
 989                     ; 461         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
 991  00e6 7b02          	ld	a,(OFST+2,sp)
 992  00e8 48            	sll	a
 993  00e9 48            	sll	a
 994  00ea 48            	sll	a
 995  00eb ca5443        	or	a,21571
 996  00ee               LC004:
 997  00ee c75443        	ld	21571,a
 998  00f1 202d          	jra	L144
 999  00f3               L553:
1000                     ; 465     case COMP_TriggerGroup_VREFINTOutput:
1000                     ; 466       if (NewState != DISABLE)
1002  00f3 7b05          	ld	a,(OFST+5,sp)
1003  00f5 2708          	jreq	L354
1004                     ; 468         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
1006  00f7 7b02          	ld	a,(OFST+2,sp)
1007  00f9 43            	cpl	a
1008  00fa c45444        	and	a,21572
1010  00fd 201e          	jp	LC003
1011  00ff               L354:
1012                     ; 472         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
1014  00ff c65444        	ld	a,21572
1015  0102 1a02          	or	a,(OFST+2,sp)
1016  0104 2017          	jp	LC003
1017  0106               L753:
1018                     ; 476     case COMP_TriggerGroup_DACOutput:
1018                     ; 477       if (NewState != DISABLE)
1020  0106 7b05          	ld	a,(OFST+5,sp)
1021  0108 270b          	jreq	L754
1022                     ; 479         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
1024  010a 7b02          	ld	a,(OFST+2,sp)
1025  010c 48            	sll	a
1026  010d 48            	sll	a
1027  010e 48            	sll	a
1028  010f 43            	cpl	a
1029  0110 c45444        	and	a,21572
1031  0113 2008          	jp	LC003
1032  0115               L754:
1033                     ; 483         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
1035  0115 7b02          	ld	a,(OFST+2,sp)
1036  0117 48            	sll	a
1037  0118 48            	sll	a
1038  0119 48            	sll	a
1039  011a ca5444        	or	a,21572
1040  011d               LC003:
1041  011d c75444        	ld	21572,a
1042                     ; 487     default:
1042                     ; 488       break;
1044  0120               L144:
1045                     ; 490 }
1048  0120 85            	popw	x
1049  0121 81            	ret	
1094                     ; 518 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
1094                     ; 519 {
1095                     	switch	.text
1096  0122               _COMP_ITConfig:
1098  0122 89            	pushw	x
1099       00000000      OFST:	set	0
1102                     ; 521   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1104                     ; 522   assert_param(IS_FUNCTIONAL_STATE(NewState));
1106                     ; 525   if (COMP_Selection == COMP_Selection_COMP1)
1108  0123 9e            	ld	a,xh
1109  0124 4a            	dec	a
1110  0125 2610          	jrne	L505
1111                     ; 527     if (NewState != DISABLE)
1113  0127 9f            	ld	a,xl
1114  0128 4d            	tnz	a
1115  0129 2706          	jreq	L705
1116                     ; 530       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
1118  012b 721a5440      	bset	21568,#5
1120  012f 2014          	jra	L315
1121  0131               L705:
1122                     ; 535       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
1124  0131 721b5440      	bres	21568,#5
1125  0135 200e          	jra	L315
1126  0137               L505:
1127                     ; 540     if (NewState != DISABLE)
1129  0137 7b02          	ld	a,(OFST+2,sp)
1130  0139 2706          	jreq	L515
1131                     ; 543       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
1133  013b 721a5441      	bset	21569,#5
1135  013f 2004          	jra	L315
1136  0141               L515:
1137                     ; 548       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
1139  0141 721b5441      	bres	21569,#5
1140  0145               L315:
1141                     ; 551 }
1144  0145 85            	popw	x
1145  0146 81            	ret	
1211                     ; 561 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
1211                     ; 562 {
1212                     	switch	.text
1213  0147               _COMP_GetFlagStatus:
1215  0147 88            	push	a
1216       00000001      OFST:	set	1
1219                     ; 563   FlagStatus bitstatus = RESET;
1221                     ; 566   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1223                     ; 569   if (COMP_Selection == COMP_Selection_COMP1)
1225  0148 4a            	dec	a
1226  0149 2609          	jrne	L355
1227                     ; 571     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
1229  014b 7209544002    	btjf	21568,#4,L555
1230                     ; 574       bitstatus = SET;
1232  0150 2007          	jp	LC007
1233  0152               L555:
1234                     ; 579       bitstatus = RESET;
1235  0152 2009          	jp	L365
1236  0154               L355:
1237                     ; 584     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
1239  0154 7209544104    	btjf	21569,#4,L365
1240                     ; 587       bitstatus = SET;
1242  0159               LC007:
1244  0159 a601          	ld	a,#1
1246  015b 2001          	jra	L165
1247  015d               L365:
1248                     ; 592       bitstatus = RESET;
1251  015d 4f            	clr	a
1252  015e               L165:
1253                     ; 597   return (FlagStatus)(bitstatus);
1257  015e 5b01          	addw	sp,#1
1258  0160 81            	ret	
1293                     ; 608 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
1293                     ; 609 {
1294                     	switch	.text
1295  0161               _COMP_ClearFlag:
1299                     ; 611   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1301                     ; 613   if (COMP_Selection == COMP_Selection_COMP1)
1303  0161 4a            	dec	a
1304  0162 2605          	jrne	L506
1305                     ; 616     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1307  0164 72195440      	bres	21568,#4
1310  0168 81            	ret	
1311  0169               L506:
1312                     ; 621     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1314  0169 72195441      	bres	21569,#4
1315                     ; 623 }
1318  016d 81            	ret	
1378                     ; 633 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
1378                     ; 634 {
1379                     	switch	.text
1380  016e               _COMP_GetITStatus:
1382  016e 89            	pushw	x
1383       00000002      OFST:	set	2
1386                     ; 635   ITStatus bitstatus = RESET;
1388                     ; 636   uint8_t itstatus = 0x00, itenable = 0x00;
1392                     ; 639   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1394                     ; 641   if (COMP_Selection == COMP_Selection_COMP1)
1396  016f 4a            	dec	a
1397  0170 2618          	jrne	L736
1398                     ; 644     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
1400  0172 c65440        	ld	a,21568
1401  0175 a410          	and	a,#16
1402  0177 6b01          	ld	(OFST-1,sp),a
1403                     ; 647     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
1405  0179 c65440        	ld	a,21568
1406  017c a420          	and	a,#32
1407  017e 6b02          	ld	(OFST+0,sp),a
1408                     ; 649     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
1410  0180 7b01          	ld	a,(OFST-1,sp)
1411  0182 2720          	jreq	L746
1413  0184 7b02          	ld	a,(OFST+0,sp)
1414  0186 271c          	jreq	L746
1415                     ; 652       bitstatus = SET;
1417  0188 2016          	jp	LC009
1418                     ; 657       bitstatus = RESET;
1419  018a               L736:
1420                     ; 663     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
1422  018a c65441        	ld	a,21569
1423  018d a410          	and	a,#16
1424  018f 6b01          	ld	(OFST-1,sp),a
1425                     ; 666     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
1427  0191 c65441        	ld	a,21569
1428  0194 a420          	and	a,#32
1429  0196 6b02          	ld	(OFST+0,sp),a
1430                     ; 668     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
1432  0198 7b01          	ld	a,(OFST-1,sp)
1433  019a 2708          	jreq	L746
1435  019c 7b02          	ld	a,(OFST+0,sp)
1436  019e 2704          	jreq	L746
1437                     ; 671       bitstatus = SET;
1439  01a0               LC009:
1441  01a0 a601          	ld	a,#1
1443  01a2 2001          	jra	L546
1444  01a4               L746:
1445                     ; 676       bitstatus = RESET;
1448  01a4 4f            	clr	a
1449  01a5               L546:
1450                     ; 681   return (ITStatus) bitstatus;
1454  01a5 85            	popw	x
1455  01a6 81            	ret	
1491                     ; 692 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
1491                     ; 693 {
1492                     	switch	.text
1493  01a7               _COMP_ClearITPendingBit:
1497                     ; 695   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1499                     ; 697   if (COMP_Selection == COMP_Selection_COMP1)
1501  01a7 4a            	dec	a
1502  01a8 2605          	jrne	L176
1503                     ; 700     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1505  01aa 72195440      	bres	21568,#4
1508  01ae 81            	ret	
1509  01af               L176:
1510                     ; 705     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1512  01af 72195441      	bres	21569,#4
1513                     ; 707 }
1516  01b3 81            	ret	
1529                     	xdef	_COMP_ClearITPendingBit
1530                     	xdef	_COMP_GetITStatus
1531                     	xdef	_COMP_ClearFlag
1532                     	xdef	_COMP_GetFlagStatus
1533                     	xdef	_COMP_ITConfig
1534                     	xdef	_COMP_TriggerConfig
1535                     	xdef	_COMP_SchmittTriggerCmd
1536                     	xdef	_COMP_VrefintOutputCmd
1537                     	xdef	_COMP_WindowCmd
1538                     	xdef	_COMP_GetOutputLevel
1539                     	xdef	_COMP_EdgeConfig
1540                     	xdef	_COMP_VrefintToCOMP1Connect
1541                     	xdef	_COMP_Init
1542                     	xdef	_COMP_DeInit
1561                     	end
