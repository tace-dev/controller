   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
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
 255       fffffffe      OFST: set -2
 258                     ; 154   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
 260                     ; 155   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
 262                     ; 156   assert_param(IS_COMP_SPEED(COMP_Speed));
 264                     ; 159   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
 266  0000 c65442        	ld	a,21570
 267  0003 a4c7          	and	a,#199
 268  0005 c75442        	ld	21570,a
 269                     ; 161   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
 271  0008 9e            	ld	a,xh
 272  0009 ca5442        	or	a,21570
 273  000c c75442        	ld	21570,a
 274                     ; 164   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
 276  000f c65442        	ld	a,21570
 277  0012 a43f          	and	a,#63
 278  0014 c75442        	ld	21570,a
 279                     ; 166   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
 281  0017 9f            	ld	a,xl
 282  0018 ca5442        	or	a,21570
 283  001b c75442        	ld	21570,a
 284                     ; 169   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
 286  001e 72155441      	bres	21569,#2
 287                     ; 171   COMP->CSR2 |= (uint8_t) COMP_Speed;
 289  0022 c65441        	ld	a,21569
 290  0025 1a03          	or	a,(OFST+5,sp)
 291  0027 c75441        	ld	21569,a
 292                     ; 172 }
 295  002a 81            	ret	
 351                     ; 180 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
 351                     ; 181 {
 352                     .text:	section	.text,new
 353  0000               _COMP_VrefintToCOMP1Connect:
 357                     ; 183   assert_param(IS_FUNCTIONAL_STATE(NewState));
 359                     ; 185   if (NewState != DISABLE)
 361  0000 4d            	tnz	a
 362  0001 2705          	jreq	L341
 363                     ; 188     COMP->CSR3 |= COMP_CSR3_VREFEN;
 365  0003 72145442      	bset	21570,#2
 368  0007 81            	ret	
 369  0008               L341:
 370                     ; 193     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
 372  0008 72155442      	bres	21570,#2
 373                     ; 195 }
 376  000c 81            	ret	
 471                     ; 209 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
 471                     ; 210 {
 472                     .text:	section	.text,new
 473  0000               _COMP_EdgeConfig:
 475  0000 89            	pushw	x
 476       00000000      OFST:	set	0
 479                     ; 212   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 481                     ; 213   assert_param(IS_COMP_EDGE(COMP_Edge));
 483                     ; 216   if (COMP_Selection == COMP_Selection_COMP1)
 485  0001 9e            	ld	a,xh
 486  0002 4a            	dec	a
 487  0003 2611          	jrne	L312
 488                     ; 219     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
 490  0005 c65440        	ld	a,21568
 491  0008 a4fc          	and	a,#252
 492  000a c75440        	ld	21568,a
 493                     ; 222     COMP->CSR1 |= (uint8_t) COMP_Edge;
 495  000d 9f            	ld	a,xl
 496  000e ca5440        	or	a,21568
 497  0011 c75440        	ld	21568,a
 499  0014 2010          	jra	L512
 500  0016               L312:
 501                     ; 228     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 503  0016 c65441        	ld	a,21569
 504  0019 a4fc          	and	a,#252
 505  001b c75441        	ld	21569,a
 506                     ; 231     COMP->CSR2 |= (uint8_t) COMP_Edge;
 508  001e c65441        	ld	a,21569
 509  0021 1a02          	or	a,(OFST+2,sp)
 510  0023 c75441        	ld	21569,a
 511  0026               L512:
 512                     ; 233 }
 515  0026 85            	popw	x
 516  0027 81            	ret	
 582                     ; 248 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 582                     ; 249 {
 583                     .text:	section	.text,new
 584  0000               _COMP_GetOutputLevel:
 586       00000001      OFST:	set	1
 589                     ; 253   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 591                     ; 256   if (COMP_Selection == COMP_Selection_COMP1)
 593  0000 4a            	dec	a
 594  0001 2609          	jrne	L742
 595                     ; 259     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 597  0003 7207544002    	btjf	21568,#3,L152
 598                     ; 262       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 600  0008 2007          	jp	LC002
 601  000a               L152:
 602                     ; 268       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 603  000a 2008          	jp	L752
 604  000c               L742:
 605                     ; 275     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 607  000c 7207544103    	btjf	21569,#3,L752
 608                     ; 278       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 610  0011               LC002:
 612  0011 a601          	ld	a,#1
 616  0013 81            	ret	
 617  0014               L752:
 618                     ; 284       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 621  0014 4f            	clr	a
 623                     ; 289   return (COMP_OutputLevel_TypeDef)(compout);
 627  0015 81            	ret	
 662                     ; 321 void COMP_WindowCmd(FunctionalState NewState)
 662                     ; 322 {
 663                     .text:	section	.text,new
 664  0000               _COMP_WindowCmd:
 668                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 670                     ; 326   if (NewState != DISABLE)
 672  0000 4d            	tnz	a
 673  0001 2705          	jreq	L103
 674                     ; 329     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 676  0003 72125442      	bset	21570,#1
 679  0007 81            	ret	
 680  0008               L103:
 681                     ; 334     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 683  0008 72135442      	bres	21570,#1
 684                     ; 336 }
 687  000c 81            	ret	
 723                     ; 359 void COMP_VrefintOutputCmd(FunctionalState NewState)
 723                     ; 360 {
 724                     .text:	section	.text,new
 725  0000               _COMP_VrefintOutputCmd:
 729                     ; 362   assert_param(IS_FUNCTIONAL_STATE(NewState));
 731                     ; 364   if (NewState != DISABLE)
 733  0000 4d            	tnz	a
 734  0001 2705          	jreq	L323
 735                     ; 367     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 737  0003 72105442      	bset	21570,#0
 740  0007 81            	ret	
 741  0008               L323:
 742                     ; 372     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 744  0008 72115442      	bres	21570,#0
 745                     ; 374 }
 748  000c 81            	ret	
 784                     ; 398 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 784                     ; 399 {
 785                     .text:	section	.text,new
 786  0000               _COMP_SchmittTriggerCmd:
 790                     ; 401   assert_param(IS_FUNCTIONAL_STATE(NewState));
 792                     ; 403   if (NewState != DISABLE)
 794  0000 4d            	tnz	a
 795  0001 2705          	jreq	L543
 796                     ; 406     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 798  0003 72145440      	bset	21568,#2
 801  0007 81            	ret	
 802  0008               L543:
 803                     ; 411     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 805  0008 72155440      	bres	21568,#2
 806                     ; 413 }
 809  000c 81            	ret	
 929                     ; 432 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 929                     ; 433                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 929                     ; 434                         FunctionalState NewState)
 929                     ; 435 {
 930                     .text:	section	.text,new
 931  0000               _COMP_TriggerConfig:
 933  0000 89            	pushw	x
 934       00000000      OFST:	set	0
 937                     ; 437   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 939                     ; 438   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 941                     ; 440   switch (COMP_TriggerGroup)
 943  0001 9e            	ld	a,xh
 945                     ; 487     default:
 945                     ; 488       break;
 946  0002 4a            	dec	a
 947  0003 270b          	jreq	L153
 948  0005 4a            	dec	a
 949  0006 2717          	jreq	L353
 950  0008 4a            	dec	a
 951  0009 2730          	jreq	L553
 952  000b 4a            	dec	a
 953  000c 2740          	jreq	L753
 954  000e 2058          	jra	L144
 955  0010               L153:
 956                     ; 442     case COMP_TriggerGroup_InvertingInput:
 956                     ; 443 
 956                     ; 444       if (NewState != DISABLE)
 958  0010 7b05          	ld	a,(OFST+5,sp)
 959  0012 2704          	jreq	L344
 960                     ; 446         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 962  0014 7b02          	ld	a,(OFST+2,sp)
 964  0016 2010          	jp	LC005
 965  0018               L344:
 966                     ; 450         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 968  0018 c65443        	ld	a,21571
 969  001b 1a02          	or	a,(OFST+2,sp)
 970  001d 2017          	jp	LC004
 971  001f               L353:
 972                     ; 454     case COMP_TriggerGroup_NonInvertingInput:
 972                     ; 455       if (NewState != DISABLE)
 974  001f 7b05          	ld	a,(OFST+5,sp)
 975  0021 270b          	jreq	L744
 976                     ; 457         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 978  0023 7b02          	ld	a,(OFST+2,sp)
 979  0025 48            	sll	a
 980  0026 48            	sll	a
 981  0027 48            	sll	a
 982  0028               LC005:
 983  0028 43            	cpl	a
 984  0029 c45443        	and	a,21571
 986  002c 2008          	jp	LC004
 987  002e               L744:
 988                     ; 461         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
 990  002e 7b02          	ld	a,(OFST+2,sp)
 991  0030 48            	sll	a
 992  0031 48            	sll	a
 993  0032 48            	sll	a
 994  0033 ca5443        	or	a,21571
 995  0036               LC004:
 996  0036 c75443        	ld	21571,a
 997  0039 202d          	jra	L144
 998  003b               L553:
 999                     ; 465     case COMP_TriggerGroup_VREFINTOutput:
 999                     ; 466       if (NewState != DISABLE)
1001  003b 7b05          	ld	a,(OFST+5,sp)
1002  003d 2708          	jreq	L354
1003                     ; 468         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
1005  003f 7b02          	ld	a,(OFST+2,sp)
1006  0041 43            	cpl	a
1007  0042 c45444        	and	a,21572
1009  0045 201e          	jp	LC003
1010  0047               L354:
1011                     ; 472         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
1013  0047 c65444        	ld	a,21572
1014  004a 1a02          	or	a,(OFST+2,sp)
1015  004c 2017          	jp	LC003
1016  004e               L753:
1017                     ; 476     case COMP_TriggerGroup_DACOutput:
1017                     ; 477       if (NewState != DISABLE)
1019  004e 7b05          	ld	a,(OFST+5,sp)
1020  0050 270b          	jreq	L754
1021                     ; 479         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
1023  0052 7b02          	ld	a,(OFST+2,sp)
1024  0054 48            	sll	a
1025  0055 48            	sll	a
1026  0056 48            	sll	a
1027  0057 43            	cpl	a
1028  0058 c45444        	and	a,21572
1030  005b 2008          	jp	LC003
1031  005d               L754:
1032                     ; 483         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
1034  005d 7b02          	ld	a,(OFST+2,sp)
1035  005f 48            	sll	a
1036  0060 48            	sll	a
1037  0061 48            	sll	a
1038  0062 ca5444        	or	a,21572
1039  0065               LC003:
1040  0065 c75444        	ld	21572,a
1041                     ; 487     default:
1041                     ; 488       break;
1043  0068               L144:
1044                     ; 490 }
1047  0068 85            	popw	x
1048  0069 81            	ret	
1093                     ; 518 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
1093                     ; 519 {
1094                     .text:	section	.text,new
1095  0000               _COMP_ITConfig:
1097  0000 89            	pushw	x
1098       00000000      OFST:	set	0
1101                     ; 521   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1103                     ; 522   assert_param(IS_FUNCTIONAL_STATE(NewState));
1105                     ; 525   if (COMP_Selection == COMP_Selection_COMP1)
1107  0001 9e            	ld	a,xh
1108  0002 4a            	dec	a
1109  0003 2610          	jrne	L505
1110                     ; 527     if (NewState != DISABLE)
1112  0005 9f            	ld	a,xl
1113  0006 4d            	tnz	a
1114  0007 2706          	jreq	L705
1115                     ; 530       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
1117  0009 721a5440      	bset	21568,#5
1119  000d 2014          	jra	L315
1120  000f               L705:
1121                     ; 535       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
1123  000f 721b5440      	bres	21568,#5
1124  0013 200e          	jra	L315
1125  0015               L505:
1126                     ; 540     if (NewState != DISABLE)
1128  0015 7b02          	ld	a,(OFST+2,sp)
1129  0017 2706          	jreq	L515
1130                     ; 543       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
1132  0019 721a5441      	bset	21569,#5
1134  001d 2004          	jra	L315
1135  001f               L515:
1136                     ; 548       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
1138  001f 721b5441      	bres	21569,#5
1139  0023               L315:
1140                     ; 551 }
1143  0023 85            	popw	x
1144  0024 81            	ret	
1210                     ; 561 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
1210                     ; 562 {
1211                     .text:	section	.text,new
1212  0000               _COMP_GetFlagStatus:
1214       00000001      OFST:	set	1
1217                     ; 563   FlagStatus bitstatus = RESET;
1219                     ; 566   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1221                     ; 569   if (COMP_Selection == COMP_Selection_COMP1)
1223  0000 4a            	dec	a
1224  0001 2609          	jrne	L355
1225                     ; 571     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
1227  0003 7209544002    	btjf	21568,#4,L555
1228                     ; 574       bitstatus = SET;
1230  0008 2007          	jp	LC007
1231  000a               L555:
1232                     ; 579       bitstatus = RESET;
1233  000a 2008          	jp	L365
1234  000c               L355:
1235                     ; 584     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
1237  000c 7209544103    	btjf	21569,#4,L365
1238                     ; 587       bitstatus = SET;
1240  0011               LC007:
1242  0011 a601          	ld	a,#1
1246  0013 81            	ret	
1247  0014               L365:
1248                     ; 592       bitstatus = RESET;
1251  0014 4f            	clr	a
1253                     ; 597   return (FlagStatus)(bitstatus);
1257  0015 81            	ret	
1292                     ; 608 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
1292                     ; 609 {
1293                     .text:	section	.text,new
1294  0000               _COMP_ClearFlag:
1298                     ; 611   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1300                     ; 613   if (COMP_Selection == COMP_Selection_COMP1)
1302  0000 4a            	dec	a
1303  0001 2605          	jrne	L506
1304                     ; 616     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1306  0003 72195440      	bres	21568,#4
1309  0007 81            	ret	
1310  0008               L506:
1311                     ; 621     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1313  0008 72195441      	bres	21569,#4
1314                     ; 623 }
1317  000c 81            	ret	
1377                     ; 633 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
1377                     ; 634 {
1378                     .text:	section	.text,new
1379  0000               _COMP_GetITStatus:
1381  0000 89            	pushw	x
1382       00000002      OFST:	set	2
1385                     ; 635   ITStatus bitstatus = RESET;
1387                     ; 636   uint8_t itstatus = 0x00, itenable = 0x00;
1391                     ; 639   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1393                     ; 641   if (COMP_Selection == COMP_Selection_COMP1)
1395  0001 4a            	dec	a
1396  0002 2618          	jrne	L736
1397                     ; 644     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
1399  0004 c65440        	ld	a,21568
1400  0007 a410          	and	a,#16
1401  0009 6b01          	ld	(OFST-1,sp),a
1403                     ; 647     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
1405  000b c65440        	ld	a,21568
1406  000e a420          	and	a,#32
1407  0010 6b02          	ld	(OFST+0,sp),a
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
1427                     ; 666     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
1429  0023 c65441        	ld	a,21569
1430  0026 a420          	and	a,#32
1431  0028 6b02          	ld	(OFST+0,sp),a
1433                     ; 668     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
1435  002a 7b01          	ld	a,(OFST-1,sp)
1436  002c 2708          	jreq	L746
1438  002e 7b02          	ld	a,(OFST+0,sp)
1439  0030 2704          	jreq	L746
1440                     ; 671       bitstatus = SET;
1442  0032               LC009:
1444  0032 a601          	ld	a,#1
1447  0034 2001          	jra	L546
1448  0036               L746:
1449                     ; 676       bitstatus = RESET;
1452  0036 4f            	clr	a
1454  0037               L546:
1455                     ; 681   return (ITStatus) bitstatus;
1459  0037 85            	popw	x
1460  0038 81            	ret	
1496                     ; 692 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
1496                     ; 693 {
1497                     .text:	section	.text,new
1498  0000               _COMP_ClearITPendingBit:
1502                     ; 695   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1504                     ; 697   if (COMP_Selection == COMP_Selection_COMP1)
1506  0000 4a            	dec	a
1507  0001 2605          	jrne	L176
1508                     ; 700     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1510  0003 72195440      	bres	21568,#4
1513  0007 81            	ret	
1514  0008               L176:
1515                     ; 705     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1517  0008 72195441      	bres	21569,#4
1518                     ; 707 }
1521  000c 81            	ret	
1534                     	xdef	_COMP_ClearITPendingBit
1535                     	xdef	_COMP_GetITStatus
1536                     	xdef	_COMP_ClearFlag
1537                     	xdef	_COMP_GetFlagStatus
1538                     	xdef	_COMP_ITConfig
1539                     	xdef	_COMP_TriggerConfig
1540                     	xdef	_COMP_SchmittTriggerCmd
1541                     	xdef	_COMP_VrefintOutputCmd
1542                     	xdef	_COMP_WindowCmd
1543                     	xdef	_COMP_GetOutputLevel
1544                     	xdef	_COMP_EdgeConfig
1545                     	xdef	_COMP_VrefintToCOMP1Connect
1546                     	xdef	_COMP_Init
1547                     	xdef	_COMP_DeInit
1566                     	end
