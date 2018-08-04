   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  47                     ; 108 void COMP_DeInit(void)
  47                     ; 109 {
  49                     .text:	section	.text,new
  50  0000               _COMP_DeInit:
  54                     ; 111   COMP->CSR1 = (uint8_t) COMP_CSR1_RESET_VALUE;
  56  0000 725f5440      	clr	21568
  57                     ; 114   COMP->CSR2 = (uint8_t) COMP_CSR2_RESET_VALUE;
  59  0004 725f5441      	clr	21569
  60                     ; 117   COMP->CSR3 = (uint8_t) COMP_CSR3_RESET_VALUE;
  62  0008 35c05442      	mov	21570,#192
  63                     ; 120   COMP->CSR4 = (uint8_t) COMP_CSR4_RESET_VALUE;
  65  000c 725f5443      	clr	21571
  66                     ; 123   COMP->CSR5 = (uint8_t) COMP_CSR5_RESET_VALUE;
  68  0010 725f5444      	clr	21572
  69                     ; 124 }
  72  0014 81            	ret
 248                     ; 150 void COMP_Init(COMP_InvertingInput_Typedef COMP_InvertingInput,
 248                     ; 151                COMP_OutputSelect_Typedef COMP_OutputSelect, COMP_Speed_TypeDef COMP_Speed)
 248                     ; 152 {
 249                     .text:	section	.text,new
 250  0000               _COMP_Init:
 252  0000 89            	pushw	x
 253       00000000      OFST:	set	0
 256                     ; 154   assert_param(IS_COMP_INVERTING_INPUT(COMP_InvertingInput));
 258                     ; 155   assert_param(IS_COMP_OUTPUT(COMP_OutputSelect));
 260                     ; 156   assert_param(IS_COMP_SPEED(COMP_Speed));
 262                     ; 159   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_INSEL);
 264  0001 c65442        	ld	a,21570
 265  0004 a4c7          	and	a,#199
 266  0006 c75442        	ld	21570,a
 267                     ; 161   COMP->CSR3 |= (uint8_t) COMP_InvertingInput;
 269  0009 9e            	ld	a,xh
 270  000a ca5442        	or	a,21570
 271  000d c75442        	ld	21570,a
 272                     ; 164   COMP->CSR3 &= (uint8_t) (~COMP_CSR3_OUTSEL);
 274  0010 c65442        	ld	a,21570
 275  0013 a43f          	and	a,#63
 276  0015 c75442        	ld	21570,a
 277                     ; 166   COMP->CSR3 |= (uint8_t) COMP_OutputSelect;
 279  0018 9f            	ld	a,xl
 280  0019 ca5442        	or	a,21570
 281  001c c75442        	ld	21570,a
 282                     ; 169   COMP->CSR2 &= (uint8_t) (~COMP_CSR2_SPEED);
 284  001f 72155441      	bres	21569,#2
 285                     ; 171   COMP->CSR2 |= (uint8_t) COMP_Speed;
 287  0023 c65441        	ld	a,21569
 288  0026 1a05          	or	a,(OFST+5,sp)
 289  0028 c75441        	ld	21569,a
 290                     ; 172 }
 293  002b 85            	popw	x
 294  002c 81            	ret
 350                     ; 180 void COMP_VrefintToCOMP1Connect(FunctionalState NewState)
 350                     ; 181 {
 351                     .text:	section	.text,new
 352  0000               _COMP_VrefintToCOMP1Connect:
 356                     ; 183   assert_param(IS_FUNCTIONAL_STATE(NewState));
 358                     ; 185   if (NewState != DISABLE)
 360  0000 4d            	tnz	a
 361  0001 2706          	jreq	L341
 362                     ; 188     COMP->CSR3 |= COMP_CSR3_VREFEN;
 364  0003 72145442      	bset	21570,#2
 366  0007 2004          	jra	L541
 367  0009               L341:
 368                     ; 193     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_VREFEN);
 370  0009 72155442      	bres	21570,#2
 371  000d               L541:
 372                     ; 195 }
 375  000d 81            	ret
 470                     ; 209 void COMP_EdgeConfig(COMP_Selection_TypeDef COMP_Selection, COMP_Edge_TypeDef COMP_Edge)
 470                     ; 210 {
 471                     .text:	section	.text,new
 472  0000               _COMP_EdgeConfig:
 474  0000 89            	pushw	x
 475       00000000      OFST:	set	0
 478                     ; 212   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 480                     ; 213   assert_param(IS_COMP_EDGE(COMP_Edge));
 482                     ; 216   if (COMP_Selection == COMP_Selection_COMP1)
 484  0001 9e            	ld	a,xh
 485  0002 a101          	cp	a,#1
 486  0004 2611          	jrne	L312
 487                     ; 219     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_CMP1);
 489  0006 c65440        	ld	a,21568
 490  0009 a4fc          	and	a,#252
 491  000b c75440        	ld	21568,a
 492                     ; 222     COMP->CSR1 |= (uint8_t) COMP_Edge;
 494  000e 9f            	ld	a,xl
 495  000f ca5440        	or	a,21568
 496  0012 c75440        	ld	21568,a
 498  0015 2010          	jra	L512
 499  0017               L312:
 500                     ; 228     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_CMP2);
 502  0017 c65441        	ld	a,21569
 503  001a a4fc          	and	a,#252
 504  001c c75441        	ld	21569,a
 505                     ; 231     COMP->CSR2 |= (uint8_t) COMP_Edge;
 507  001f c65441        	ld	a,21569
 508  0022 1a02          	or	a,(OFST+2,sp)
 509  0024 c75441        	ld	21569,a
 510  0027               L512:
 511                     ; 233 }
 514  0027 85            	popw	x
 515  0028 81            	ret
 581                     ; 248 COMP_OutputLevel_TypeDef COMP_GetOutputLevel(COMP_Selection_TypeDef COMP_Selection)
 581                     ; 249 {
 582                     .text:	section	.text,new
 583  0000               _COMP_GetOutputLevel:
 585  0000 88            	push	a
 586       00000001      OFST:	set	1
 589                     ; 253   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
 591                     ; 256   if (COMP_Selection == COMP_Selection_COMP1)
 593  0001 a101          	cp	a,#1
 594  0003 2611          	jrne	L742
 595                     ; 259     if ((COMP->CSR1 & COMP_CSR1_CMP1OUT) != (uint8_t) RESET)
 597  0005 c65440        	ld	a,21568
 598  0008 a508          	bcp	a,#8
 599  000a 2706          	jreq	L152
 600                     ; 262       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 602  000c a601          	ld	a,#1
 603  000e 6b01          	ld	(OFST+0,sp),a
 605  0010 2013          	jra	L552
 606  0012               L152:
 607                     ; 268       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 609  0012 0f01          	clr	(OFST+0,sp)
 610  0014 200f          	jra	L552
 611  0016               L742:
 612                     ; 275     if ((COMP->CSR2 & COMP_CSR2_CMP2OUT) != (uint8_t) RESET)
 614  0016 c65441        	ld	a,21569
 615  0019 a508          	bcp	a,#8
 616  001b 2706          	jreq	L752
 617                     ; 278       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_High;
 619  001d a601          	ld	a,#1
 620  001f 6b01          	ld	(OFST+0,sp),a
 622  0021 2002          	jra	L552
 623  0023               L752:
 624                     ; 284       compout = (COMP_OutputLevel_TypeDef) COMP_OutputLevel_Low;
 626  0023 0f01          	clr	(OFST+0,sp)
 627  0025               L552:
 628                     ; 289   return (COMP_OutputLevel_TypeDef)(compout);
 630  0025 7b01          	ld	a,(OFST+0,sp)
 633  0027 5b01          	addw	sp,#1
 634  0029 81            	ret
 669                     ; 321 void COMP_WindowCmd(FunctionalState NewState)
 669                     ; 322 {
 670                     .text:	section	.text,new
 671  0000               _COMP_WindowCmd:
 675                     ; 324   assert_param(IS_FUNCTIONAL_STATE(NewState));
 677                     ; 326   if (NewState != DISABLE)
 679  0000 4d            	tnz	a
 680  0001 2706          	jreq	L103
 681                     ; 329     COMP->CSR3 |= (uint8_t) COMP_CSR3_WNDWE;
 683  0003 72125442      	bset	21570,#1
 685  0007 2004          	jra	L303
 686  0009               L103:
 687                     ; 334     COMP->CSR3 &= (uint8_t)(~COMP_CSR3_WNDWE);
 689  0009 72135442      	bres	21570,#1
 690  000d               L303:
 691                     ; 336 }
 694  000d 81            	ret
 730                     ; 359 void COMP_VrefintOutputCmd(FunctionalState NewState)
 730                     ; 360 {
 731                     .text:	section	.text,new
 732  0000               _COMP_VrefintOutputCmd:
 736                     ; 362   assert_param(IS_FUNCTIONAL_STATE(NewState));
 738                     ; 364   if (NewState != DISABLE)
 740  0000 4d            	tnz	a
 741  0001 2706          	jreq	L323
 742                     ; 367     COMP->CSR3 |= (uint8_t) COMP_CSR3_VREFOUTEN;
 744  0003 72105442      	bset	21570,#0
 746  0007 2004          	jra	L523
 747  0009               L323:
 748                     ; 372     COMP->CSR3 &= (uint8_t) (~COMP_CSR3_VREFOUTEN);
 750  0009 72115442      	bres	21570,#0
 751  000d               L523:
 752                     ; 374 }
 755  000d 81            	ret
 791                     ; 398 void COMP_SchmittTriggerCmd(FunctionalState NewState)
 791                     ; 399 {
 792                     .text:	section	.text,new
 793  0000               _COMP_SchmittTriggerCmd:
 797                     ; 401   assert_param(IS_FUNCTIONAL_STATE(NewState));
 799                     ; 403   if (NewState != DISABLE)
 801  0000 4d            	tnz	a
 802  0001 2706          	jreq	L543
 803                     ; 406     COMP->CSR1 |= (uint8_t) COMP_CSR1_STE;
 805  0003 72145440      	bset	21568,#2
 807  0007 2004          	jra	L743
 808  0009               L543:
 809                     ; 411     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_STE);
 811  0009 72155440      	bres	21568,#2
 812  000d               L743:
 813                     ; 413 }
 816  000d 81            	ret
 936                     ; 432 void COMP_TriggerConfig(COMP_TriggerGroup_TypeDef COMP_TriggerGroup,
 936                     ; 433                         COMP_TriggerPin_TypeDef COMP_TriggerPin,
 936                     ; 434                         FunctionalState NewState)
 936                     ; 435 {
 937                     .text:	section	.text,new
 938  0000               _COMP_TriggerConfig:
 940  0000 89            	pushw	x
 941       00000000      OFST:	set	0
 944                     ; 437   assert_param(IS_COMP_TRIGGERGROUP(COMP_TriggerGroup));
 946                     ; 438   assert_param(IS_COMP_TRIGGERPIN(COMP_TriggerPin));
 948                     ; 440   switch (COMP_TriggerGroup)
 950  0001 9e            	ld	a,xh
 952                     ; 487     default:
 952                     ; 488       break;
 953  0002 4a            	dec	a
 954  0003 270b          	jreq	L153
 955  0005 4a            	dec	a
 956  0006 2721          	jreq	L353
 957  0008 4a            	dec	a
 958  0009 273d          	jreq	L553
 959  000b 4a            	dec	a
 960  000c 2753          	jreq	L753
 961  000e 206e          	jra	L144
 962  0010               L153:
 963                     ; 442     case COMP_TriggerGroup_InvertingInput:
 963                     ; 443 
 963                     ; 444       if (NewState != DISABLE)
 965  0010 0d05          	tnz	(OFST+5,sp)
 966  0012 270b          	jreq	L344
 967                     ; 446         COMP->CSR4 &= (uint8_t) ~COMP_TriggerPin;
 969  0014 7b02          	ld	a,(OFST+2,sp)
 970  0016 43            	cpl	a
 971  0017 c45443        	and	a,21571
 972  001a c75443        	ld	21571,a
 974  001d 205f          	jra	L144
 975  001f               L344:
 976                     ; 450         COMP->CSR4 |= (uint8_t) COMP_TriggerPin;
 978  001f c65443        	ld	a,21571
 979  0022 1a02          	or	a,(OFST+2,sp)
 980  0024 c75443        	ld	21571,a
 981  0027 2055          	jra	L144
 982  0029               L353:
 983                     ; 454     case COMP_TriggerGroup_NonInvertingInput:
 983                     ; 455       if (NewState != DISABLE)
 985  0029 0d05          	tnz	(OFST+5,sp)
 986  002b 270e          	jreq	L744
 987                     ; 457         COMP->CSR4 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
 989  002d 7b02          	ld	a,(OFST+2,sp)
 990  002f 48            	sll	a
 991  0030 48            	sll	a
 992  0031 48            	sll	a
 993  0032 43            	cpl	a
 994  0033 c45443        	and	a,21571
 995  0036 c75443        	ld	21571,a
 997  0039 2043          	jra	L144
 998  003b               L744:
 999                     ; 461         COMP->CSR4 |= (uint8_t) (COMP_TriggerPin << 3);
1001  003b 7b02          	ld	a,(OFST+2,sp)
1002  003d 48            	sll	a
1003  003e 48            	sll	a
1004  003f 48            	sll	a
1005  0040 ca5443        	or	a,21571
1006  0043 c75443        	ld	21571,a
1007  0046 2036          	jra	L144
1008  0048               L553:
1009                     ; 465     case COMP_TriggerGroup_VREFINTOutput:
1009                     ; 466       if (NewState != DISABLE)
1011  0048 0d05          	tnz	(OFST+5,sp)
1012  004a 270b          	jreq	L354
1013                     ; 468         COMP->CSR5 &= (uint8_t) ~COMP_TriggerPin;
1015  004c 7b02          	ld	a,(OFST+2,sp)
1016  004e 43            	cpl	a
1017  004f c45444        	and	a,21572
1018  0052 c75444        	ld	21572,a
1020  0055 2027          	jra	L144
1021  0057               L354:
1022                     ; 472         COMP->CSR5 |= (uint8_t) COMP_TriggerPin;
1024  0057 c65444        	ld	a,21572
1025  005a 1a02          	or	a,(OFST+2,sp)
1026  005c c75444        	ld	21572,a
1027  005f 201d          	jra	L144
1028  0061               L753:
1029                     ; 476     case COMP_TriggerGroup_DACOutput:
1029                     ; 477       if (NewState != DISABLE)
1031  0061 0d05          	tnz	(OFST+5,sp)
1032  0063 270e          	jreq	L754
1033                     ; 479         COMP->CSR5 &= (uint8_t) ~((uint8_t)(COMP_TriggerPin << 3));
1035  0065 7b02          	ld	a,(OFST+2,sp)
1036  0067 48            	sll	a
1037  0068 48            	sll	a
1038  0069 48            	sll	a
1039  006a 43            	cpl	a
1040  006b c45444        	and	a,21572
1041  006e c75444        	ld	21572,a
1043  0071 200b          	jra	L144
1044  0073               L754:
1045                     ; 483         COMP->CSR5 |= (uint8_t) (COMP_TriggerPin << 3);
1047  0073 7b02          	ld	a,(OFST+2,sp)
1048  0075 48            	sll	a
1049  0076 48            	sll	a
1050  0077 48            	sll	a
1051  0078 ca5444        	or	a,21572
1052  007b c75444        	ld	21572,a
1053  007e               L163:
1054                     ; 487     default:
1054                     ; 488       break;
1056  007e               L144:
1057                     ; 490 }
1060  007e 85            	popw	x
1061  007f 81            	ret
1106                     ; 518 void COMP_ITConfig(COMP_Selection_TypeDef COMP_Selection, FunctionalState NewState)
1106                     ; 519 {
1107                     .text:	section	.text,new
1108  0000               _COMP_ITConfig:
1110  0000 89            	pushw	x
1111       00000000      OFST:	set	0
1114                     ; 521   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1116                     ; 522   assert_param(IS_FUNCTIONAL_STATE(NewState));
1118                     ; 525   if (COMP_Selection == COMP_Selection_COMP1)
1120  0001 9e            	ld	a,xh
1121  0002 a101          	cp	a,#1
1122  0004 2610          	jrne	L505
1123                     ; 527     if (NewState != DISABLE)
1125  0006 9f            	ld	a,xl
1126  0007 4d            	tnz	a
1127  0008 2706          	jreq	L705
1128                     ; 530       COMP->CSR1 |= (uint8_t) COMP_CSR1_IE1;
1130  000a 721a5440      	bset	21568,#5
1132  000e 2014          	jra	L315
1133  0010               L705:
1134                     ; 535       COMP->CSR1 &= (uint8_t)(~COMP_CSR1_IE1);
1136  0010 721b5440      	bres	21568,#5
1137  0014 200e          	jra	L315
1138  0016               L505:
1139                     ; 540     if (NewState != DISABLE)
1141  0016 0d02          	tnz	(OFST+2,sp)
1142  0018 2706          	jreq	L515
1143                     ; 543       COMP->CSR2 |= (uint8_t) COMP_CSR2_IE2;
1145  001a 721a5441      	bset	21569,#5
1147  001e 2004          	jra	L315
1148  0020               L515:
1149                     ; 548       COMP->CSR2 &= (uint8_t)(~COMP_CSR2_IE2);
1151  0020 721b5441      	bres	21569,#5
1152  0024               L315:
1153                     ; 551 }
1156  0024 85            	popw	x
1157  0025 81            	ret
1223                     ; 561 FlagStatus COMP_GetFlagStatus(COMP_Selection_TypeDef COMP_Selection)
1223                     ; 562 {
1224                     .text:	section	.text,new
1225  0000               _COMP_GetFlagStatus:
1227  0000 88            	push	a
1228       00000001      OFST:	set	1
1231                     ; 563   FlagStatus bitstatus = RESET;
1233                     ; 566   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1235                     ; 569   if (COMP_Selection == COMP_Selection_COMP1)
1237  0001 a101          	cp	a,#1
1238  0003 2611          	jrne	L355
1239                     ; 571     if ((COMP->CSR1 & COMP_CSR1_EF1) != (uint8_t) RESET)
1241  0005 c65440        	ld	a,21568
1242  0008 a510          	bcp	a,#16
1243  000a 2706          	jreq	L555
1244                     ; 574       bitstatus = SET;
1246  000c a601          	ld	a,#1
1247  000e 6b01          	ld	(OFST+0,sp),a
1249  0010 2013          	jra	L165
1250  0012               L555:
1251                     ; 579       bitstatus = RESET;
1253  0012 0f01          	clr	(OFST+0,sp)
1254  0014 200f          	jra	L165
1255  0016               L355:
1256                     ; 584     if ((COMP->CSR2 & COMP_CSR2_EF2) != (uint8_t) RESET)
1258  0016 c65441        	ld	a,21569
1259  0019 a510          	bcp	a,#16
1260  001b 2706          	jreq	L365
1261                     ; 587       bitstatus = SET;
1263  001d a601          	ld	a,#1
1264  001f 6b01          	ld	(OFST+0,sp),a
1266  0021 2002          	jra	L165
1267  0023               L365:
1268                     ; 592       bitstatus = RESET;
1270  0023 0f01          	clr	(OFST+0,sp)
1271  0025               L165:
1272                     ; 597   return (FlagStatus)(bitstatus);
1274  0025 7b01          	ld	a,(OFST+0,sp)
1277  0027 5b01          	addw	sp,#1
1278  0029 81            	ret
1313                     ; 608 void COMP_ClearFlag(COMP_Selection_TypeDef COMP_Selection)
1313                     ; 609 {
1314                     .text:	section	.text,new
1315  0000               _COMP_ClearFlag:
1319                     ; 611   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1321                     ; 613   if (COMP_Selection == COMP_Selection_COMP1)
1323  0000 a101          	cp	a,#1
1324  0002 2606          	jrne	L506
1325                     ; 616     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1327  0004 72195440      	bres	21568,#4
1329  0008 2004          	jra	L706
1330  000a               L506:
1331                     ; 621     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1333  000a 72195441      	bres	21569,#4
1334  000e               L706:
1335                     ; 623 }
1338  000e 81            	ret
1398                     ; 633 ITStatus COMP_GetITStatus(COMP_Selection_TypeDef COMP_Selection)
1398                     ; 634 {
1399                     .text:	section	.text,new
1400  0000               _COMP_GetITStatus:
1402  0000 89            	pushw	x
1403       00000002      OFST:	set	2
1406                     ; 635   ITStatus bitstatus = RESET;
1408                     ; 636   uint8_t itstatus = 0x00, itenable = 0x00;
1412                     ; 639   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1414                     ; 641   if (COMP_Selection == COMP_Selection_COMP1)
1416  0001 a101          	cp	a,#1
1417  0003 2620          	jrne	L736
1418                     ; 644     itstatus = (uint8_t) (COMP->CSR1 & COMP_CSR1_EF1);
1420  0005 c65440        	ld	a,21568
1421  0008 a410          	and	a,#16
1422  000a 6b01          	ld	(OFST-1,sp),a
1423                     ; 647     itenable = (uint8_t) (COMP->CSR1 & COMP_CSR1_IE1);
1425  000c c65440        	ld	a,21568
1426  000f a420          	and	a,#32
1427  0011 6b02          	ld	(OFST+0,sp),a
1428                     ; 649     if ((itstatus != (uint8_t) RESET) && (itenable != (uint8_t) RESET))
1430  0013 0d01          	tnz	(OFST-1,sp)
1431  0015 270a          	jreq	L146
1433  0017 0d02          	tnz	(OFST+0,sp)
1434  0019 2706          	jreq	L146
1435                     ; 652       bitstatus = SET;
1437  001b a601          	ld	a,#1
1438  001d 6b02          	ld	(OFST+0,sp),a
1440  001f 2022          	jra	L546
1441  0021               L146:
1442                     ; 657       bitstatus = RESET;
1444  0021 0f02          	clr	(OFST+0,sp)
1445  0023 201e          	jra	L546
1446  0025               L736:
1447                     ; 663     itstatus = (uint8_t) (COMP->CSR2 & COMP_CSR2_EF2);
1449  0025 c65441        	ld	a,21569
1450  0028 a410          	and	a,#16
1451  002a 6b01          	ld	(OFST-1,sp),a
1452                     ; 666     itenable = (uint8_t) (COMP->CSR2 & COMP_CSR2_IE2);
1454  002c c65441        	ld	a,21569
1455  002f a420          	and	a,#32
1456  0031 6b02          	ld	(OFST+0,sp),a
1457                     ; 668     if ((itstatus != (uint8_t)RESET) && (itenable != (uint8_t)RESET))
1459  0033 0d01          	tnz	(OFST-1,sp)
1460  0035 270a          	jreq	L746
1462  0037 0d02          	tnz	(OFST+0,sp)
1463  0039 2706          	jreq	L746
1464                     ; 671       bitstatus = SET;
1466  003b a601          	ld	a,#1
1467  003d 6b02          	ld	(OFST+0,sp),a
1469  003f 2002          	jra	L546
1470  0041               L746:
1471                     ; 676       bitstatus = RESET;
1473  0041 0f02          	clr	(OFST+0,sp)
1474  0043               L546:
1475                     ; 681   return (ITStatus) bitstatus;
1477  0043 7b02          	ld	a,(OFST+0,sp)
1480  0045 85            	popw	x
1481  0046 81            	ret
1517                     ; 692 void COMP_ClearITPendingBit(COMP_Selection_TypeDef COMP_Selection)
1517                     ; 693 {
1518                     .text:	section	.text,new
1519  0000               _COMP_ClearITPendingBit:
1523                     ; 695   assert_param(IS_COMP_ALL_PERIPH(COMP_Selection));
1525                     ; 697   if (COMP_Selection == COMP_Selection_COMP1)
1527  0000 a101          	cp	a,#1
1528  0002 2606          	jrne	L176
1529                     ; 700     COMP->CSR1 &= (uint8_t) (~COMP_CSR1_EF1);
1531  0004 72195440      	bres	21568,#4
1533  0008 2004          	jra	L376
1534  000a               L176:
1535                     ; 705     COMP->CSR2 &= (uint8_t) (~COMP_CSR2_EF2);
1537  000a 72195441      	bres	21569,#4
1538  000e               L376:
1539                     ; 707 }
1542  000e 81            	ret
1555                     	xdef	_COMP_ClearITPendingBit
1556                     	xdef	_COMP_GetITStatus
1557                     	xdef	_COMP_ClearFlag
1558                     	xdef	_COMP_GetFlagStatus
1559                     	xdef	_COMP_ITConfig
1560                     	xdef	_COMP_TriggerConfig
1561                     	xdef	_COMP_SchmittTriggerCmd
1562                     	xdef	_COMP_VrefintOutputCmd
1563                     	xdef	_COMP_WindowCmd
1564                     	xdef	_COMP_GetOutputLevel
1565                     	xdef	_COMP_EdgeConfig
1566                     	xdef	_COMP_VrefintToCOMP1Connect
1567                     	xdef	_COMP_Init
1568                     	xdef	_COMP_DeInit
1587                     	end
