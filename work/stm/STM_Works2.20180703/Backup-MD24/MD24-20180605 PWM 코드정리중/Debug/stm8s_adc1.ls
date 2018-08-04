   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  49                     ; 52 void ADC1_DeInit(void)
  49                     ; 53 {
  51                     .text:	section	.text,new
  52  0000               _ADC1_DeInit:
  56                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  58  0000 725f5400      	clr	21504
  59                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  61  0004 725f5401      	clr	21505
  62                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  64  0008 725f5402      	clr	21506
  65                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  67  000c 725f5403      	clr	21507
  68                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  70  0010 725f5406      	clr	21510
  71                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  73  0014 725f5407      	clr	21511
  74                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  76  0018 35ff5408      	mov	21512,#255
  77                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  79  001c 35035409      	mov	21513,#3
  80                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  82  0020 725f540a      	clr	21514
  83                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  85  0024 725f540b      	clr	21515
  86                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  88  0028 725f540e      	clr	21518
  89                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  91  002c 725f540f      	clr	21519
  92                     ; 66 }
  95  0030 81            	ret	
 547                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 547                     ; 89 {
 548                     .text:	section	.text,new
 549  0000               _ADC1_Init:
 551  0000 89            	pushw	x
 552       00000000      OFST:	set	0
 555                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 557  0001 9e            	ld	a,xh
 558  0002 4d            	tnz	a
 559  0003 270a          	jreq	L41
 560  0005 9e            	ld	a,xh
 561  0006 4a            	dec	a
 562  0007 2706          	jreq	L41
 563  0009 ae005b        	ldw	x,#91
 564  000c cd00f9        	call	LC001
 565  000f               L41:
 566                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 568  000f 7b02          	ld	a,(OFST+2,sp)
 569  0011 272e          	jreq	L42
 570  0013 a101          	cp	a,#1
 571  0015 272a          	jreq	L42
 572  0017 a102          	cp	a,#2
 573  0019 2726          	jreq	L42
 574  001b a103          	cp	a,#3
 575  001d 2722          	jreq	L42
 576  001f a104          	cp	a,#4
 577  0021 271e          	jreq	L42
 578  0023 a105          	cp	a,#5
 579  0025 271a          	jreq	L42
 580  0027 a106          	cp	a,#6
 581  0029 2716          	jreq	L42
 582  002b a107          	cp	a,#7
 583  002d 2712          	jreq	L42
 584  002f a108          	cp	a,#8
 585  0031 270e          	jreq	L42
 586  0033 a10c          	cp	a,#12
 587  0035 270a          	jreq	L42
 588  0037 a109          	cp	a,#9
 589  0039 2706          	jreq	L42
 590  003b ae005c        	ldw	x,#92
 591  003e cd00f9        	call	LC001
 592  0041               L42:
 593                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 595  0041 7b05          	ld	a,(OFST+5,sp)
 596  0043 2722          	jreq	L43
 597  0045 a110          	cp	a,#16
 598  0047 271e          	jreq	L43
 599  0049 a120          	cp	a,#32
 600  004b 271a          	jreq	L43
 601  004d a130          	cp	a,#48
 602  004f 2716          	jreq	L43
 603  0051 a140          	cp	a,#64
 604  0053 2712          	jreq	L43
 605  0055 a150          	cp	a,#80
 606  0057 270e          	jreq	L43
 607  0059 a160          	cp	a,#96
 608  005b 270a          	jreq	L43
 609  005d a170          	cp	a,#112
 610  005f 2706          	jreq	L43
 611  0061 ae005d        	ldw	x,#93
 612  0064 cd00f9        	call	LC001
 613  0067               L43:
 614                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 616  0067 7b06          	ld	a,(OFST+6,sp)
 617  0069 270a          	jreq	L44
 618  006b a110          	cp	a,#16
 619  006d 2706          	jreq	L44
 620  006f ae005e        	ldw	x,#94
 621  0072 cd00f9        	call	LC001
 622  0075               L44:
 623                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 625  0075 7b07          	ld	a,(OFST+7,sp)
 626  0077 2708          	jreq	L45
 627  0079 4a            	dec	a
 628  007a 2705          	jreq	L45
 629  007c ae005f        	ldw	x,#95
 630  007f ad78          	call	LC001
 631  0081               L45:
 632                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 634  0081 7b08          	ld	a,(OFST+8,sp)
 635  0083 2709          	jreq	L46
 636  0085 a108          	cp	a,#8
 637  0087 2705          	jreq	L46
 638  0089 ae0060        	ldw	x,#96
 639  008c ad6b          	call	LC001
 640  008e               L46:
 641                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 643  008e 7b09          	ld	a,(OFST+9,sp)
 644  0090 2731          	jreq	L47
 645  0092 a101          	cp	a,#1
 646  0094 272d          	jreq	L47
 647  0096 a102          	cp	a,#2
 648  0098 2729          	jreq	L47
 649  009a a103          	cp	a,#3
 650  009c 2725          	jreq	L47
 651  009e a104          	cp	a,#4
 652  00a0 2721          	jreq	L47
 653  00a2 a105          	cp	a,#5
 654  00a4 271d          	jreq	L47
 655  00a6 a106          	cp	a,#6
 656  00a8 2719          	jreq	L47
 657  00aa a107          	cp	a,#7
 658  00ac 2715          	jreq	L47
 659  00ae a108          	cp	a,#8
 660  00b0 2711          	jreq	L47
 661  00b2 a10c          	cp	a,#12
 662  00b4 270d          	jreq	L47
 663  00b6 a1ff          	cp	a,#255
 664  00b8 2709          	jreq	L47
 665  00ba a109          	cp	a,#9
 666  00bc 2705          	jreq	L47
 667  00be ae0061        	ldw	x,#97
 668  00c1 ad36          	call	LC001
 669  00c3               L47:
 670                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 672  00c3 7b0a          	ld	a,(OFST+10,sp)
 673  00c5 2708          	jreq	L401
 674  00c7 4a            	dec	a
 675  00c8 2705          	jreq	L401
 676  00ca ae0062        	ldw	x,#98
 677  00cd ad2a          	call	LC001
 678  00cf               L401:
 679                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 681  00cf 7b08          	ld	a,(OFST+8,sp)
 682  00d1 88            	push	a
 683  00d2 7b03          	ld	a,(OFST+3,sp)
 684  00d4 97            	ld	xl,a
 685  00d5 7b02          	ld	a,(OFST+2,sp)
 686  00d7 95            	ld	xh,a
 687  00d8 cd0000        	call	_ADC1_ConversionConfig
 689  00db 84            	pop	a
 690                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 692  00dc 7b05          	ld	a,(OFST+5,sp)
 693  00de cd0000        	call	_ADC1_PrescalerConfig
 695                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 697  00e1 7b07          	ld	a,(OFST+7,sp)
 698  00e3 97            	ld	xl,a
 699  00e4 7b06          	ld	a,(OFST+6,sp)
 700  00e6 95            	ld	xh,a
 701  00e7 cd0000        	call	_ADC1_ExternalTriggerConfig
 703                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 705  00ea 7b0a          	ld	a,(OFST+10,sp)
 706  00ec 97            	ld	xl,a
 707  00ed 7b09          	ld	a,(OFST+9,sp)
 708  00ef 95            	ld	xh,a
 709  00f0 cd0000        	call	_ADC1_SchmittTriggerConfig
 711                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 713  00f3 72105401      	bset	21505,#0
 714                     ; 119 }
 717  00f7 85            	popw	x
 718  00f8 81            	ret	
 719  00f9               LC001:
 720  00f9 89            	pushw	x
 721  00fa 5f            	clrw	x
 722  00fb 89            	pushw	x
 723  00fc ae0000        	ldw	x,#L542
 724  00ff cd0000        	call	_assert_failed
 726  0102 5b04          	addw	sp,#4
 727  0104 81            	ret	
 763                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 763                     ; 127 {
 764                     .text:	section	.text,new
 765  0000               _ADC1_Cmd:
 767  0000 88            	push	a
 768       00000000      OFST:	set	0
 771                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 773  0001 4d            	tnz	a
 774  0002 2711          	jreq	L621
 775  0004 4a            	dec	a
 776  0005 270e          	jreq	L621
 777  0007 ae0081        	ldw	x,#129
 778  000a 89            	pushw	x
 779  000b 5f            	clrw	x
 780  000c 89            	pushw	x
 781  000d ae0000        	ldw	x,#L542
 782  0010 cd0000        	call	_assert_failed
 784  0013 5b04          	addw	sp,#4
 785  0015               L621:
 786                     ; 131   if (NewState != DISABLE)
 788  0015 7b01          	ld	a,(OFST+1,sp)
 789  0017 2706          	jreq	L562
 790                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 792  0019 72105401      	bset	21505,#0
 794  001d 2004          	jra	L762
 795  001f               L562:
 796                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 798  001f 72115401      	bres	21505,#0
 799  0023               L762:
 800                     ; 139 }
 803  0023 84            	pop	a
 804  0024 81            	ret	
 840                     ; 170 void ADC1_DataBufferCmd(FunctionalState NewState)
 840                     ; 171 {
 841                     .text:	section	.text,new
 842  0000               _ADC1_DataBufferCmd:
 844  0000 88            	push	a
 845       00000000      OFST:	set	0
 848                     ; 173   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 850  0001 4d            	tnz	a
 851  0002 2711          	jreq	L041
 852  0004 4a            	dec	a
 853  0005 270e          	jreq	L041
 854  0007 ae00ad        	ldw	x,#173
 855  000a 89            	pushw	x
 856  000b 5f            	clrw	x
 857  000c 89            	pushw	x
 858  000d ae0000        	ldw	x,#L542
 859  0010 cd0000        	call	_assert_failed
 861  0013 5b04          	addw	sp,#4
 862  0015               L041:
 863                     ; 175   if (NewState != DISABLE)
 865  0015 7b01          	ld	a,(OFST+1,sp)
 866  0017 2706          	jreq	L703
 867                     ; 177     ADC1->CR3 |= ADC1_CR3_DBUF;
 869  0019 721e5403      	bset	21507,#7
 871  001d 2004          	jra	L113
 872  001f               L703:
 873                     ; 181     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 875  001f 721f5403      	bres	21507,#7
 876  0023               L113:
 877                     ; 183 }
 880  0023 84            	pop	a
 881  0024 81            	ret	
1038                     ; 194 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
1038                     ; 195 {
1039                     .text:	section	.text,new
1040  0000               _ADC1_ITConfig:
1042  0000 89            	pushw	x
1043       00000000      OFST:	set	0
1046                     ; 197   assert_param(IS_ADC1_IT_OK(ADC1_IT));
1048  0001 a30020        	cpw	x,#32
1049  0004 270a          	jreq	L251
1050  0006 a30010        	cpw	x,#16
1051  0009 2705          	jreq	L251
1052  000b ae00c5        	ldw	x,#197
1053  000e ad22          	call	LC002
1054  0010               L251:
1055                     ; 198   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1057  0010 7b05          	ld	a,(OFST+5,sp)
1058  0012 2708          	jreq	L261
1059  0014 4a            	dec	a
1060  0015 2705          	jreq	L261
1061  0017 ae00c6        	ldw	x,#198
1062  001a ad16          	call	LC002
1063  001c               L261:
1064                     ; 200   if (NewState != DISABLE)
1066  001c 7b05          	ld	a,(OFST+5,sp)
1067  001e 2707          	jreq	L773
1068                     ; 203     ADC1->CSR |= (uint8_t)ADC1_IT;
1070  0020 c65400        	ld	a,21504
1071  0023 1a02          	or	a,(OFST+2,sp)
1073  0025 2006          	jra	L104
1074  0027               L773:
1075                     ; 208     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
1077  0027 7b02          	ld	a,(OFST+2,sp)
1078  0029 43            	cpl	a
1079  002a c45400        	and	a,21504
1080  002d               L104:
1081  002d c75400        	ld	21504,a
1082                     ; 210 }
1085  0030 85            	popw	x
1086  0031 81            	ret	
1087  0032               LC002:
1088  0032 89            	pushw	x
1089  0033 5f            	clrw	x
1090  0034 89            	pushw	x
1091  0035 ae0000        	ldw	x,#L542
1092  0038 cd0000        	call	_assert_failed
1094  003b 5b04          	addw	sp,#4
1095  003d 81            	ret	
1132                     ; 218 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1132                     ; 219 {
1133                     .text:	section	.text,new
1134  0000               _ADC1_PrescalerConfig:
1136  0000 88            	push	a
1137       00000000      OFST:	set	0
1140                     ; 221   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1142  0001 4d            	tnz	a
1143  0002 272a          	jreq	L471
1144  0004 a110          	cp	a,#16
1145  0006 2726          	jreq	L471
1146  0008 a120          	cp	a,#32
1147  000a 2722          	jreq	L471
1148  000c a130          	cp	a,#48
1149  000e 271e          	jreq	L471
1150  0010 a140          	cp	a,#64
1151  0012 271a          	jreq	L471
1152  0014 a150          	cp	a,#80
1153  0016 2716          	jreq	L471
1154  0018 a160          	cp	a,#96
1155  001a 2712          	jreq	L471
1156  001c a170          	cp	a,#112
1157  001e 270e          	jreq	L471
1158  0020 ae00dd        	ldw	x,#221
1159  0023 89            	pushw	x
1160  0024 5f            	clrw	x
1161  0025 89            	pushw	x
1162  0026 ae0000        	ldw	x,#L542
1163  0029 cd0000        	call	_assert_failed
1165  002c 5b04          	addw	sp,#4
1166  002e               L471:
1167                     ; 224   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1169  002e c65401        	ld	a,21505
1170  0031 a48f          	and	a,#143
1171  0033 c75401        	ld	21505,a
1172                     ; 226   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1174  0036 c65401        	ld	a,21505
1175  0039 1a01          	or	a,(OFST+1,sp)
1176  003b c75401        	ld	21505,a
1177                     ; 227 }
1180  003e 84            	pop	a
1181  003f 81            	ret	
1229                     ; 237 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1229                     ; 238 {
1230                     .text:	section	.text,new
1231  0000               _ADC1_SchmittTriggerConfig:
1233  0000 89            	pushw	x
1234       00000000      OFST:	set	0
1237                     ; 240   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1239  0001 9e            	ld	a,xh
1240  0002 4d            	tnz	a
1241  0003 273b          	jreq	L602
1242  0005 9e            	ld	a,xh
1243  0006 4a            	dec	a
1244  0007 2737          	jreq	L602
1245  0009 9e            	ld	a,xh
1246  000a a102          	cp	a,#2
1247  000c 2732          	jreq	L602
1248  000e 9e            	ld	a,xh
1249  000f a103          	cp	a,#3
1250  0011 272d          	jreq	L602
1251  0013 9e            	ld	a,xh
1252  0014 a104          	cp	a,#4
1253  0016 2728          	jreq	L602
1254  0018 9e            	ld	a,xh
1255  0019 a105          	cp	a,#5
1256  001b 2723          	jreq	L602
1257  001d 9e            	ld	a,xh
1258  001e a106          	cp	a,#6
1259  0020 271e          	jreq	L602
1260  0022 9e            	ld	a,xh
1261  0023 a107          	cp	a,#7
1262  0025 2719          	jreq	L602
1263  0027 9e            	ld	a,xh
1264  0028 a108          	cp	a,#8
1265  002a 2714          	jreq	L602
1266  002c 9e            	ld	a,xh
1267  002d a10c          	cp	a,#12
1268  002f 270f          	jreq	L602
1269  0031 9e            	ld	a,xh
1270  0032 4c            	inc	a
1271  0033 270b          	jreq	L602
1272  0035 9e            	ld	a,xh
1273  0036 a109          	cp	a,#9
1274  0038 2706          	jreq	L602
1275  003a ae00f0        	ldw	x,#240
1276  003d cd00bf        	call	LC006
1277  0040               L602:
1278                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1280  0040 7b02          	ld	a,(OFST+2,sp)
1281  0042 2708          	jreq	L612
1282  0044 4a            	dec	a
1283  0045 2705          	jreq	L612
1284  0047 ae00f1        	ldw	x,#241
1285  004a ad73          	call	LC006
1286  004c               L612:
1287                     ; 243   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1289  004c 7b01          	ld	a,(OFST+1,sp)
1290  004e a1ff          	cp	a,#255
1291  0050 261d          	jrne	L344
1292                     ; 245     if (NewState != DISABLE)
1294  0052 7b02          	ld	a,(OFST+2,sp)
1295  0054 270a          	jreq	L544
1296                     ; 247       ADC1->TDRL &= (uint8_t)0x0;
1298  0056 725f5407      	clr	21511
1299                     ; 248       ADC1->TDRH &= (uint8_t)0x0;
1301  005a 725f5406      	clr	21510
1303  005e 2057          	jra	L154
1304  0060               L544:
1305                     ; 252       ADC1->TDRL |= (uint8_t)0xFF;
1307  0060 c65407        	ld	a,21511
1308  0063 aaff          	or	a,#255
1309  0065 c75407        	ld	21511,a
1310                     ; 253       ADC1->TDRH |= (uint8_t)0xFF;
1312  0068 c65406        	ld	a,21510
1313  006b aaff          	or	a,#255
1314  006d 2045          	jp	LC003
1315  006f               L344:
1316                     ; 256   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1318  006f a108          	cp	a,#8
1319  0071 0d02          	tnz	(OFST+2,sp)
1320  0073 2420          	jruge	L354
1321                     ; 258     if (NewState != DISABLE)
1323  0075 2711          	jreq	L554
1324                     ; 260       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1326  0077 ad40          	call	LC005
1327  0079 2704          	jreq	L222
1328  007b               L422:
1329  007b 48            	sll	a
1330  007c 5a            	decw	x
1331  007d 26fc          	jrne	L422
1332  007f               L222:
1333  007f 43            	cpl	a
1334  0080 c45407        	and	a,21511
1335  0083               LC004:
1336  0083 c75407        	ld	21511,a
1338  0086 202f          	jra	L154
1339  0088               L554:
1340                     ; 264       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1342  0088 ad2f          	call	LC005
1343  008a 2704          	jreq	L622
1344  008c               L032:
1345  008c 48            	sll	a
1346  008d 5a            	decw	x
1347  008e 26fc          	jrne	L032
1348  0090               L622:
1349  0090 ca5407        	or	a,21511
1350  0093 20ee          	jp	LC004
1351  0095               L354:
1352                     ; 269     if (NewState != DISABLE)
1354  0095 2710          	jreq	L364
1355                     ; 271       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1357  0097 a008          	sub	a,#8
1358  0099 ad1e          	call	LC005
1359  009b 2704          	jreq	L232
1360  009d               L432:
1361  009d 48            	sll	a
1362  009e 5a            	decw	x
1363  009f 26fc          	jrne	L432
1364  00a1               L232:
1365  00a1 43            	cpl	a
1366  00a2 c45406        	and	a,21510
1368  00a5 200d          	jp	LC003
1369  00a7               L364:
1370                     ; 275       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1372  00a7 a008          	sub	a,#8
1373  00a9 ad0e          	call	LC005
1374  00ab 2704          	jreq	L632
1375  00ad               L042:
1376  00ad 48            	sll	a
1377  00ae 5a            	decw	x
1378  00af 26fc          	jrne	L042
1379  00b1               L632:
1380  00b1 ca5406        	or	a,21510
1381  00b4               LC003:
1382  00b4 c75406        	ld	21510,a
1383  00b7               L154:
1384                     ; 278 }
1387  00b7 85            	popw	x
1388  00b8 81            	ret	
1389  00b9               LC005:
1390  00b9 5f            	clrw	x
1391  00ba 97            	ld	xl,a
1392  00bb a601          	ld	a,#1
1393  00bd 5d            	tnzw	x
1394  00be 81            	ret	
1395  00bf               LC006:
1396  00bf 89            	pushw	x
1397  00c0 5f            	clrw	x
1398  00c1 89            	pushw	x
1399  00c2 ae0000        	ldw	x,#L542
1400  00c5 cd0000        	call	_assert_failed
1402  00c8 5b04          	addw	sp,#4
1403  00ca 81            	ret	
1461                     ; 290 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1461                     ; 291 {
1462                     .text:	section	.text,new
1463  0000               _ADC1_ConversionConfig:
1465  0000 89            	pushw	x
1466       00000000      OFST:	set	0
1469                     ; 293   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1471  0001 9e            	ld	a,xh
1472  0002 4d            	tnz	a
1473  0003 2709          	jreq	L052
1474  0005 9e            	ld	a,xh
1475  0006 4a            	dec	a
1476  0007 2705          	jreq	L052
1477  0009 ae0125        	ldw	x,#293
1478  000c ad6b          	call	LC007
1479  000e               L052:
1480                     ; 294   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1482  000e 7b02          	ld	a,(OFST+2,sp)
1483  0010 272d          	jreq	L062
1484  0012 a101          	cp	a,#1
1485  0014 2729          	jreq	L062
1486  0016 a102          	cp	a,#2
1487  0018 2725          	jreq	L062
1488  001a a103          	cp	a,#3
1489  001c 2721          	jreq	L062
1490  001e a104          	cp	a,#4
1491  0020 271d          	jreq	L062
1492  0022 a105          	cp	a,#5
1493  0024 2719          	jreq	L062
1494  0026 a106          	cp	a,#6
1495  0028 2715          	jreq	L062
1496  002a a107          	cp	a,#7
1497  002c 2711          	jreq	L062
1498  002e a108          	cp	a,#8
1499  0030 270d          	jreq	L062
1500  0032 a10c          	cp	a,#12
1501  0034 2709          	jreq	L062
1502  0036 a109          	cp	a,#9
1503  0038 2705          	jreq	L062
1504  003a ae0126        	ldw	x,#294
1505  003d ad3a          	call	LC007
1506  003f               L062:
1507                     ; 295   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1509  003f 7b05          	ld	a,(OFST+5,sp)
1510  0041 2709          	jreq	L072
1511  0043 a108          	cp	a,#8
1512  0045 2705          	jreq	L072
1513  0047 ae0127        	ldw	x,#295
1514  004a ad2d          	call	LC007
1515  004c               L072:
1516                     ; 298   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1518  004c 72175402      	bres	21506,#3
1519                     ; 300   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1521  0050 c65402        	ld	a,21506
1522  0053 1a05          	or	a,(OFST+5,sp)
1523  0055 c75402        	ld	21506,a
1524                     ; 302   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1526  0058 7b01          	ld	a,(OFST+1,sp)
1527  005a 4a            	dec	a
1528  005b 2606          	jrne	L515
1529                     ; 305     ADC1->CR1 |= ADC1_CR1_CONT;
1531  005d 72125401      	bset	21505,#1
1533  0061 2004          	jra	L715
1534  0063               L515:
1535                     ; 310     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1537  0063 72135401      	bres	21505,#1
1538  0067               L715:
1539                     ; 314   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1541  0067 c65400        	ld	a,21504
1542  006a a4f0          	and	a,#240
1543  006c c75400        	ld	21504,a
1544                     ; 316   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1546  006f c65400        	ld	a,21504
1547  0072 1a02          	or	a,(OFST+2,sp)
1548  0074 c75400        	ld	21504,a
1549                     ; 317 }
1552  0077 85            	popw	x
1553  0078 81            	ret	
1554  0079               LC007:
1555  0079 89            	pushw	x
1556  007a 5f            	clrw	x
1557  007b 89            	pushw	x
1558  007c ae0000        	ldw	x,#L542
1559  007f cd0000        	call	_assert_failed
1561  0082 5b04          	addw	sp,#4
1562  0084 81            	ret	
1609                     ; 329 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1609                     ; 330 {
1610                     .text:	section	.text,new
1611  0000               _ADC1_ExternalTriggerConfig:
1613  0000 89            	pushw	x
1614       00000000      OFST:	set	0
1617                     ; 332   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1619  0001 9e            	ld	a,xh
1620  0002 4d            	tnz	a
1621  0003 270a          	jreq	L203
1622  0005 9e            	ld	a,xh
1623  0006 a110          	cp	a,#16
1624  0008 2705          	jreq	L203
1625  000a ae014c        	ldw	x,#332
1626  000d ad2c          	call	LC008
1627  000f               L203:
1628                     ; 333   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1630  000f 7b02          	ld	a,(OFST+2,sp)
1631  0011 2708          	jreq	L213
1632  0013 4a            	dec	a
1633  0014 2705          	jreq	L213
1634  0016 ae014d        	ldw	x,#333
1635  0019 ad20          	call	LC008
1636  001b               L213:
1637                     ; 336   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1639  001b c65402        	ld	a,21506
1640  001e a4cf          	and	a,#207
1641  0020 c75402        	ld	21506,a
1642                     ; 338   if (NewState != DISABLE)
1644  0023 7b02          	ld	a,(OFST+2,sp)
1645  0025 2706          	jreq	L345
1646                     ; 341     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1648  0027 721c5402      	bset	21506,#6
1650  002b 2004          	jra	L545
1651  002d               L345:
1652                     ; 346     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1654  002d 721d5402      	bres	21506,#6
1655  0031               L545:
1656                     ; 350   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1658  0031 c65402        	ld	a,21506
1659  0034 1a01          	or	a,(OFST+1,sp)
1660  0036 c75402        	ld	21506,a
1661                     ; 351 }
1664  0039 85            	popw	x
1665  003a 81            	ret	
1666  003b               LC008:
1667  003b 89            	pushw	x
1668  003c 5f            	clrw	x
1669  003d 89            	pushw	x
1670  003e ae0000        	ldw	x,#L542
1671  0041 cd0000        	call	_assert_failed
1673  0044 5b04          	addw	sp,#4
1674  0046 81            	ret	
1698                     ; 362 void ADC1_StartConversion(void)
1698                     ; 363 {
1699                     .text:	section	.text,new
1700  0000               _ADC1_StartConversion:
1704                     ; 364   ADC1->CR1 |= ADC1_CR1_ADON;
1706  0000 72105401      	bset	21505,#0
1707                     ; 365 }
1710  0004 81            	ret	
1754                     ; 374 uint16_t ADC1_GetConversionValue(void)
1754                     ; 375 {
1755                     .text:	section	.text,new
1756  0000               _ADC1_GetConversionValue:
1758  0000 5205          	subw	sp,#5
1759       00000005      OFST:	set	5
1762                     ; 376   uint16_t temph = 0;
1764                     ; 377   uint8_t templ = 0;
1766                     ; 379   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1768  0002 720754020e    	btjf	21506,#3,L106
1769                     ; 382     templ = ADC1->DRL;
1771  0007 c65405        	ld	a,21509
1772  000a 6b03          	ld	(OFST-2,sp),a
1774                     ; 384     temph = ADC1->DRH;
1776  000c c65404        	ld	a,21508
1777  000f 97            	ld	xl,a
1779                     ; 386     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1781  0010 7b03          	ld	a,(OFST-2,sp)
1782  0012 02            	rlwa	x,a
1785  0013 201a          	jra	L306
1786  0015               L106:
1787                     ; 391     temph = ADC1->DRH;
1789  0015 c65404        	ld	a,21508
1790  0018 97            	ld	xl,a
1792                     ; 393     templ = ADC1->DRL;
1794  0019 c65405        	ld	a,21509
1795  001c 6b03          	ld	(OFST-2,sp),a
1797                     ; 395     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1799  001e 4f            	clr	a
1800  001f 02            	rlwa	x,a
1801  0020 1f01          	ldw	(OFST-4,sp),x
1803  0022 7b03          	ld	a,(OFST-2,sp)
1804  0024 97            	ld	xl,a
1805  0025 a640          	ld	a,#64
1806  0027 42            	mul	x,a
1807  0028 01            	rrwa	x,a
1808  0029 1a02          	or	a,(OFST-3,sp)
1809  002b 01            	rrwa	x,a
1810  002c 1a01          	or	a,(OFST-4,sp)
1811  002e 01            	rrwa	x,a
1813  002f               L306:
1814                     ; 398   return ((uint16_t)temph);
1818  002f 5b05          	addw	sp,#5
1819  0031 81            	ret	
1866                     ; 409 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1866                     ; 410 {
1867                     .text:	section	.text,new
1868  0000               _ADC1_AWDChannelConfig:
1870  0000 89            	pushw	x
1871       00000000      OFST:	set	0
1874                     ; 412   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1876  0001 9f            	ld	a,xl
1877  0002 4d            	tnz	a
1878  0003 270a          	jreq	L033
1879  0005 9f            	ld	a,xl
1880  0006 4a            	dec	a
1881  0007 2706          	jreq	L033
1882  0009 ae019c        	ldw	x,#412
1883  000c cd0092        	call	LC012
1884  000f               L033:
1885                     ; 413   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1887  000f 7b01          	ld	a,(OFST+1,sp)
1888  0011 272f          	jreq	L043
1889  0013 a101          	cp	a,#1
1890  0015 272b          	jreq	L043
1891  0017 a102          	cp	a,#2
1892  0019 2727          	jreq	L043
1893  001b a103          	cp	a,#3
1894  001d 2723          	jreq	L043
1895  001f a104          	cp	a,#4
1896  0021 271f          	jreq	L043
1897  0023 a105          	cp	a,#5
1898  0025 271b          	jreq	L043
1899  0027 a106          	cp	a,#6
1900  0029 2717          	jreq	L043
1901  002b a107          	cp	a,#7
1902  002d 2713          	jreq	L043
1903  002f a108          	cp	a,#8
1904  0031 270f          	jreq	L043
1905  0033 a10c          	cp	a,#12
1906  0035 270b          	jreq	L043
1907  0037 a109          	cp	a,#9
1908  0039 2707          	jreq	L043
1909  003b ae019d        	ldw	x,#413
1910  003e ad52          	call	LC012
1911  0040 7b01          	ld	a,(OFST+1,sp)
1912  0042               L043:
1913                     ; 415   if (Channel < (uint8_t)8)
1915  0042 a108          	cp	a,#8
1916  0044 0d02          	tnz	(OFST+2,sp)
1917  0046 2420          	jruge	L726
1918                     ; 417     if (NewState != DISABLE)
1920  0048 270d          	jreq	L136
1921                     ; 419       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1923  004a ad40          	call	LC011
1924  004c 2704          	jreq	L443
1925  004e               L643:
1926  004e 48            	sll	a
1927  004f 5a            	decw	x
1928  0050 26fc          	jrne	L643
1929  0052               L443:
1930  0052 ca540f        	or	a,21519
1932  0055 200c          	jp	LC010
1933  0057               L136:
1934                     ; 423       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1936  0057 ad33          	call	LC011
1937  0059 2704          	jreq	L053
1938  005b               L253:
1939  005b 48            	sll	a
1940  005c 5a            	decw	x
1941  005d 26fc          	jrne	L253
1942  005f               L053:
1943  005f 43            	cpl	a
1944  0060 c4540f        	and	a,21519
1945  0063               LC010:
1946  0063 c7540f        	ld	21519,a
1947  0066 2022          	jra	L536
1948  0068               L726:
1949                     ; 428     if (NewState != DISABLE)
1951  0068 270f          	jreq	L736
1952                     ; 430       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1954  006a a008          	sub	a,#8
1955  006c ad1e          	call	LC011
1956  006e 2704          	jreq	L453
1957  0070               L653:
1958  0070 48            	sll	a
1959  0071 5a            	decw	x
1960  0072 26fc          	jrne	L653
1961  0074               L453:
1962  0074 ca540e        	or	a,21518
1964  0077 200e          	jp	LC009
1965  0079               L736:
1966                     ; 434       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1968  0079 a008          	sub	a,#8
1969  007b ad0f          	call	LC011
1970  007d 2704          	jreq	L063
1971  007f               L263:
1972  007f 48            	sll	a
1973  0080 5a            	decw	x
1974  0081 26fc          	jrne	L263
1975  0083               L063:
1976  0083 43            	cpl	a
1977  0084 c4540e        	and	a,21518
1978  0087               LC009:
1979  0087 c7540e        	ld	21518,a
1980  008a               L536:
1981                     ; 437 }
1984  008a 85            	popw	x
1985  008b 81            	ret	
1986  008c               LC011:
1987  008c 5f            	clrw	x
1988  008d 97            	ld	xl,a
1989  008e a601          	ld	a,#1
1990  0090 5d            	tnzw	x
1991  0091 81            	ret	
1992  0092               LC012:
1993  0092 89            	pushw	x
1994  0093 5f            	clrw	x
1995  0094 89            	pushw	x
1996  0095 ae0000        	ldw	x,#L542
1997  0098 cd0000        	call	_assert_failed
1999  009b 5b04          	addw	sp,#4
2000  009d 81            	ret	
2035                     ; 445 void ADC1_SetHighThreshold(uint16_t Threshold)
2035                     ; 446 {
2036                     .text:	section	.text,new
2037  0000               _ADC1_SetHighThreshold:
2039  0000 89            	pushw	x
2040       00000000      OFST:	set	0
2043                     ; 447   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
2045  0001 54            	srlw	x
2046  0002 54            	srlw	x
2047  0003 9f            	ld	a,xl
2048  0004 c75408        	ld	21512,a
2049                     ; 448   ADC1->HTRL = (uint8_t)Threshold;
2051  0007 7b02          	ld	a,(OFST+2,sp)
2052  0009 c75409        	ld	21513,a
2053                     ; 449 }
2056  000c 85            	popw	x
2057  000d 81            	ret	
2092                     ; 457 void ADC1_SetLowThreshold(uint16_t Threshold)
2092                     ; 458 {
2093                     .text:	section	.text,new
2094  0000               _ADC1_SetLowThreshold:
2098                     ; 459   ADC1->LTRL = (uint8_t)Threshold;
2100  0000 9f            	ld	a,xl
2101  0001 c7540b        	ld	21515,a
2102                     ; 460   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
2104  0004 54            	srlw	x
2105  0005 54            	srlw	x
2106  0006 9f            	ld	a,xl
2107  0007 c7540a        	ld	21514,a
2108                     ; 461 }
2111  000a 81            	ret	
2165                     ; 470 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
2165                     ; 471 {
2166                     .text:	section	.text,new
2167  0000               _ADC1_GetBufferValue:
2169  0000 88            	push	a
2170  0001 5205          	subw	sp,#5
2171       00000005      OFST:	set	5
2174                     ; 472   uint16_t temph = 0;
2176                     ; 473   uint8_t templ = 0;
2178                     ; 476   assert_param(IS_ADC1_BUFFER_OK(Buffer));
2180  0003 a10a          	cp	a,#10
2181  0005 250e          	jrult	L473
2182  0007 ae01dc        	ldw	x,#476
2183  000a 89            	pushw	x
2184  000b 5f            	clrw	x
2185  000c 89            	pushw	x
2186  000d ae0000        	ldw	x,#L542
2187  0010 cd0000        	call	_assert_failed
2189  0013 5b04          	addw	sp,#4
2190  0015               L473:
2191                     ; 478   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
2193  0015 7b06          	ld	a,(OFST+1,sp)
2194  0017 48            	sll	a
2195  0018 5f            	clrw	x
2196  0019 97            	ld	xl,a
2197  001a 7207540213    	btjf	21506,#3,L527
2198                     ; 481     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
2200  001f d653e1        	ld	a,(21473,x)
2201  0022 6b03          	ld	(OFST-2,sp),a
2203                     ; 483     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
2205  0024 7b06          	ld	a,(OFST+1,sp)
2206  0026 48            	sll	a
2207  0027 5f            	clrw	x
2208  0028 97            	ld	xl,a
2209  0029 d653e0        	ld	a,(21472,x)
2210  002c 97            	ld	xl,a
2212                     ; 485     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
2214  002d 7b03          	ld	a,(OFST-2,sp)
2215  002f 02            	rlwa	x,a
2218  0030 2024          	jra	L727
2219  0032               L527:
2220                     ; 490     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
2222  0032 d653e0        	ld	a,(21472,x)
2223  0035 5f            	clrw	x
2224  0036 97            	ld	xl,a
2225  0037 1f04          	ldw	(OFST-1,sp),x
2227                     ; 492     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
2229  0039 7b06          	ld	a,(OFST+1,sp)
2230  003b 48            	sll	a
2231  003c 5f            	clrw	x
2232  003d 97            	ld	xl,a
2233  003e d653e1        	ld	a,(21473,x)
2234  0041 6b03          	ld	(OFST-2,sp),a
2236                     ; 494     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
2238  0043 4f            	clr	a
2239  0044 1e04          	ldw	x,(OFST-1,sp)
2240  0046 02            	rlwa	x,a
2241  0047 1f01          	ldw	(OFST-4,sp),x
2243  0049 7b03          	ld	a,(OFST-2,sp)
2244  004b 97            	ld	xl,a
2245  004c a640          	ld	a,#64
2246  004e 42            	mul	x,a
2247  004f 01            	rrwa	x,a
2248  0050 1a02          	or	a,(OFST-3,sp)
2249  0052 01            	rrwa	x,a
2250  0053 1a01          	or	a,(OFST-4,sp)
2251  0055 01            	rrwa	x,a
2253  0056               L727:
2254                     ; 497   return ((uint16_t)temph);
2258  0056 5b06          	addw	sp,#6
2259  0058 81            	ret	
2326                     ; 506 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2326                     ; 507 {
2327                     .text:	section	.text,new
2328  0000               _ADC1_GetAWDChannelStatus:
2330  0000 88            	push	a
2331  0001 88            	push	a
2332       00000001      OFST:	set	1
2335                     ; 508   uint8_t status = 0;
2337                     ; 511   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2339  0002 4d            	tnz	a
2340  0003 2736          	jreq	L604
2341  0005 a101          	cp	a,#1
2342  0007 2732          	jreq	L604
2343  0009 a102          	cp	a,#2
2344  000b 272e          	jreq	L604
2345  000d a103          	cp	a,#3
2346  000f 272a          	jreq	L604
2347  0011 a104          	cp	a,#4
2348  0013 2726          	jreq	L604
2349  0015 a105          	cp	a,#5
2350  0017 2722          	jreq	L604
2351  0019 a106          	cp	a,#6
2352  001b 271e          	jreq	L604
2353  001d a107          	cp	a,#7
2354  001f 271a          	jreq	L604
2355  0021 a108          	cp	a,#8
2356  0023 2716          	jreq	L604
2357  0025 a10c          	cp	a,#12
2358  0027 2712          	jreq	L604
2359  0029 a109          	cp	a,#9
2360  002b 270e          	jreq	L604
2361  002d ae01ff        	ldw	x,#511
2362  0030 89            	pushw	x
2363  0031 5f            	clrw	x
2364  0032 89            	pushw	x
2365  0033 ae0000        	ldw	x,#L542
2366  0036 cd0000        	call	_assert_failed
2368  0039 5b04          	addw	sp,#4
2369  003b               L604:
2370                     ; 513   if (Channel < (uint8_t)8)
2372  003b 7b02          	ld	a,(OFST+1,sp)
2373  003d a108          	cp	a,#8
2374  003f 2410          	jruge	L367
2375                     ; 515     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2377  0041 5f            	clrw	x
2378  0042 97            	ld	xl,a
2379  0043 a601          	ld	a,#1
2380  0045 5d            	tnzw	x
2381  0046 2704          	jreq	L214
2382  0048               L414:
2383  0048 48            	sll	a
2384  0049 5a            	decw	x
2385  004a 26fc          	jrne	L414
2386  004c               L214:
2387  004c c4540d        	and	a,21517
2390  004f 2010          	jra	L567
2391  0051               L367:
2392                     ; 519     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2394  0051 a008          	sub	a,#8
2395  0053 5f            	clrw	x
2396  0054 97            	ld	xl,a
2397  0055 a601          	ld	a,#1
2398  0057 5d            	tnzw	x
2399  0058 2704          	jreq	L614
2400  005a               L024:
2401  005a 48            	sll	a
2402  005b 5a            	decw	x
2403  005c 26fc          	jrne	L024
2404  005e               L614:
2405  005e c4540c        	and	a,21516
2407  0061               L567:
2408                     ; 522   return ((FlagStatus)status);
2412  0061 85            	popw	x
2413  0062 81            	ret	
2572                     ; 531 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2572                     ; 532 {
2573                     .text:	section	.text,new
2574  0000               _ADC1_GetFlagStatus:
2576  0000 88            	push	a
2577  0001 88            	push	a
2578       00000001      OFST:	set	1
2581                     ; 533   uint8_t flagstatus = 0;
2583                     ; 534   uint8_t temp = 0;
2585                     ; 537   assert_param(IS_ADC1_FLAG_OK(Flag));
2587  0002 a180          	cp	a,#128
2588  0004 273e          	jreq	L034
2589  0006 a141          	cp	a,#65
2590  0008 273a          	jreq	L034
2591  000a a140          	cp	a,#64
2592  000c 2736          	jreq	L034
2593  000e a110          	cp	a,#16
2594  0010 2732          	jreq	L034
2595  0012 a111          	cp	a,#17
2596  0014 272e          	jreq	L034
2597  0016 a112          	cp	a,#18
2598  0018 272a          	jreq	L034
2599  001a a113          	cp	a,#19
2600  001c 2726          	jreq	L034
2601  001e a114          	cp	a,#20
2602  0020 2722          	jreq	L034
2603  0022 a115          	cp	a,#21
2604  0024 271e          	jreq	L034
2605  0026 a116          	cp	a,#22
2606  0028 271a          	jreq	L034
2607  002a a117          	cp	a,#23
2608  002c 2716          	jreq	L034
2609  002e a118          	cp	a,#24
2610  0030 2712          	jreq	L034
2611  0032 a119          	cp	a,#25
2612  0034 270e          	jreq	L034
2613  0036 ae0219        	ldw	x,#537
2614  0039 89            	pushw	x
2615  003a 5f            	clrw	x
2616  003b 89            	pushw	x
2617  003c ae0000        	ldw	x,#L542
2618  003f cd0000        	call	_assert_failed
2620  0042 5b04          	addw	sp,#4
2621  0044               L034:
2622                     ; 539   if ((Flag & 0x0F) == 0x01)
2624  0044 7b02          	ld	a,(OFST+1,sp)
2625  0046 a40f          	and	a,#15
2626  0048 4a            	dec	a
2627  0049 2607          	jrne	L5501
2628                     ; 542     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2630  004b c65403        	ld	a,21507
2631  004e a440          	and	a,#64
2634  0050 2039          	jra	L7501
2635  0052               L5501:
2636                     ; 544   else if ((Flag & 0xF0) == 0x10)
2638  0052 7b02          	ld	a,(OFST+1,sp)
2639  0054 a4f0          	and	a,#240
2640  0056 a110          	cp	a,#16
2641  0058 262c          	jrne	L1601
2642                     ; 547     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2644  005a 7b02          	ld	a,(OFST+1,sp)
2645  005c a40f          	and	a,#15
2646  005e 6b01          	ld	(OFST+0,sp),a
2648                     ; 548     if (temp < 8)
2650  0060 a108          	cp	a,#8
2651  0062 2410          	jruge	L3601
2652                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2654  0064 5f            	clrw	x
2655  0065 97            	ld	xl,a
2656  0066 a601          	ld	a,#1
2657  0068 5d            	tnzw	x
2658  0069 2704          	jreq	L434
2659  006b               L634:
2660  006b 48            	sll	a
2661  006c 5a            	decw	x
2662  006d 26fc          	jrne	L634
2663  006f               L434:
2664  006f c4540d        	and	a,21517
2667  0072 2017          	jra	L7501
2668  0074               L3601:
2669                     ; 554       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2671  0074 a008          	sub	a,#8
2672  0076 5f            	clrw	x
2673  0077 97            	ld	xl,a
2674  0078 a601          	ld	a,#1
2675  007a 5d            	tnzw	x
2676  007b 2704          	jreq	L044
2677  007d               L244:
2678  007d 48            	sll	a
2679  007e 5a            	decw	x
2680  007f 26fc          	jrne	L244
2681  0081               L044:
2682  0081 c4540c        	and	a,21516
2684  0084 2005          	jra	L7501
2685  0086               L1601:
2686                     ; 559     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2688  0086 c65400        	ld	a,21504
2689  0089 1402          	and	a,(OFST+1,sp)
2691  008b               L7501:
2692                     ; 561   return ((FlagStatus)flagstatus);
2696  008b 85            	popw	x
2697  008c 81            	ret	
2742                     ; 571 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2742                     ; 572 {
2743                     .text:	section	.text,new
2744  0000               _ADC1_ClearFlag:
2746  0000 88            	push	a
2747  0001 88            	push	a
2748       00000001      OFST:	set	1
2751                     ; 573   uint8_t temp = 0;
2753                     ; 576   assert_param(IS_ADC1_FLAG_OK(Flag));
2755  0002 a180          	cp	a,#128
2756  0004 273e          	jreq	L254
2757  0006 a141          	cp	a,#65
2758  0008 273a          	jreq	L254
2759  000a a140          	cp	a,#64
2760  000c 2736          	jreq	L254
2761  000e a110          	cp	a,#16
2762  0010 2732          	jreq	L254
2763  0012 a111          	cp	a,#17
2764  0014 272e          	jreq	L254
2765  0016 a112          	cp	a,#18
2766  0018 272a          	jreq	L254
2767  001a a113          	cp	a,#19
2768  001c 2726          	jreq	L254
2769  001e a114          	cp	a,#20
2770  0020 2722          	jreq	L254
2771  0022 a115          	cp	a,#21
2772  0024 271e          	jreq	L254
2773  0026 a116          	cp	a,#22
2774  0028 271a          	jreq	L254
2775  002a a117          	cp	a,#23
2776  002c 2716          	jreq	L254
2777  002e a118          	cp	a,#24
2778  0030 2712          	jreq	L254
2779  0032 a119          	cp	a,#25
2780  0034 270e          	jreq	L254
2781  0036 ae0240        	ldw	x,#576
2782  0039 89            	pushw	x
2783  003a 5f            	clrw	x
2784  003b 89            	pushw	x
2785  003c ae0000        	ldw	x,#L542
2786  003f cd0000        	call	_assert_failed
2788  0042 5b04          	addw	sp,#4
2789  0044               L254:
2790                     ; 578   if ((Flag & 0x0F) == 0x01)
2792  0044 7b02          	ld	a,(OFST+1,sp)
2793  0046 a40f          	and	a,#15
2794  0048 4a            	dec	a
2795  0049 2606          	jrne	L3111
2796                     ; 581     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2798  004b 721d5403      	bres	21507,#6
2800  004f 2045          	jra	L5111
2801  0051               L3111:
2802                     ; 583   else if ((Flag & 0xF0) == 0x10)
2804  0051 7b02          	ld	a,(OFST+1,sp)
2805  0053 a4f0          	and	a,#240
2806  0055 a110          	cp	a,#16
2807  0057 2634          	jrne	L7111
2808                     ; 586     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2810  0059 7b02          	ld	a,(OFST+1,sp)
2811  005b a40f          	and	a,#15
2812  005d 6b01          	ld	(OFST+0,sp),a
2814                     ; 587     if (temp < 8)
2816  005f a108          	cp	a,#8
2817  0061 2414          	jruge	L1211
2818                     ; 589       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2820  0063 5f            	clrw	x
2821  0064 97            	ld	xl,a
2822  0065 a601          	ld	a,#1
2823  0067 5d            	tnzw	x
2824  0068 2704          	jreq	L654
2825  006a               L064:
2826  006a 48            	sll	a
2827  006b 5a            	decw	x
2828  006c 26fc          	jrne	L064
2829  006e               L654:
2830  006e 43            	cpl	a
2831  006f c4540d        	and	a,21517
2832  0072 c7540d        	ld	21517,a
2834  0075 201f          	jra	L5111
2835  0077               L1211:
2836                     ; 593       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2838  0077 a008          	sub	a,#8
2839  0079 5f            	clrw	x
2840  007a 97            	ld	xl,a
2841  007b a601          	ld	a,#1
2842  007d 5d            	tnzw	x
2843  007e 2704          	jreq	L264
2844  0080               L464:
2845  0080 48            	sll	a
2846  0081 5a            	decw	x
2847  0082 26fc          	jrne	L464
2848  0084               L264:
2849  0084 43            	cpl	a
2850  0085 c4540c        	and	a,21516
2851  0088 c7540c        	ld	21516,a
2852  008b 2009          	jra	L5111
2853  008d               L7111:
2854                     ; 598     ADC1->CSR &= (uint8_t) (~Flag);
2856  008d 7b02          	ld	a,(OFST+1,sp)
2857  008f 43            	cpl	a
2858  0090 c45400        	and	a,21504
2859  0093 c75400        	ld	21504,a
2860  0096               L5111:
2861                     ; 600 }
2864  0096 85            	popw	x
2865  0097 81            	ret	
2921                     ; 620 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2921                     ; 621 {
2922                     .text:	section	.text,new
2923  0000               _ADC1_GetITStatus:
2925  0000 89            	pushw	x
2926  0001 88            	push	a
2927       00000001      OFST:	set	1
2930                     ; 622   ITStatus itstatus = RESET;
2932                     ; 623   uint8_t temp = 0;
2934                     ; 626   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2936  0002 a30080        	cpw	x,#128
2937  0005 274a          	jreq	L474
2938  0007 a30140        	cpw	x,#320
2939  000a 2745          	jreq	L474
2940  000c a30110        	cpw	x,#272
2941  000f 2740          	jreq	L474
2942  0011 a30111        	cpw	x,#273
2943  0014 273b          	jreq	L474
2944  0016 a30112        	cpw	x,#274
2945  0019 2736          	jreq	L474
2946  001b a30113        	cpw	x,#275
2947  001e 2731          	jreq	L474
2948  0020 a30114        	cpw	x,#276
2949  0023 272c          	jreq	L474
2950  0025 a30115        	cpw	x,#277
2951  0028 2727          	jreq	L474
2952  002a a30116        	cpw	x,#278
2953  002d 2722          	jreq	L474
2954  002f a30117        	cpw	x,#279
2955  0032 271d          	jreq	L474
2956  0034 a30118        	cpw	x,#280
2957  0037 2718          	jreq	L474
2958  0039 a3011c        	cpw	x,#284
2959  003c 2713          	jreq	L474
2960  003e a30119        	cpw	x,#281
2961  0041 270e          	jreq	L474
2962  0043 ae0272        	ldw	x,#626
2963  0046 89            	pushw	x
2964  0047 5f            	clrw	x
2965  0048 89            	pushw	x
2966  0049 ae0000        	ldw	x,#L542
2967  004c cd0000        	call	_assert_failed
2969  004f 5b04          	addw	sp,#4
2970  0051               L474:
2971                     ; 628   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2973  0051 7b03          	ld	a,(OFST+2,sp)
2974  0053 a4f0          	and	a,#240
2975  0055 5f            	clrw	x
2976  0056 02            	rlwa	x,a
2977  0057 a30010        	cpw	x,#16
2978  005a 262c          	jrne	L5511
2979                     ; 631     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2981  005c 7b03          	ld	a,(OFST+2,sp)
2982  005e a40f          	and	a,#15
2983  0060 6b01          	ld	(OFST+0,sp),a
2985                     ; 632     if (temp < 8)
2987  0062 a108          	cp	a,#8
2988  0064 2410          	jruge	L7511
2989                     ; 634       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2991  0066 5f            	clrw	x
2992  0067 97            	ld	xl,a
2993  0068 a601          	ld	a,#1
2994  006a 5d            	tnzw	x
2995  006b 2704          	jreq	L005
2996  006d               L205:
2997  006d 48            	sll	a
2998  006e 5a            	decw	x
2999  006f 26fc          	jrne	L205
3000  0071               L005:
3001  0071 c4540d        	and	a,21517
3004  0074 2017          	jra	L3611
3005  0076               L7511:
3006                     ; 638       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
3008  0076 a008          	sub	a,#8
3009  0078 5f            	clrw	x
3010  0079 97            	ld	xl,a
3011  007a a601          	ld	a,#1
3012  007c 5d            	tnzw	x
3013  007d 2704          	jreq	L405
3014  007f               L605:
3015  007f 48            	sll	a
3016  0080 5a            	decw	x
3017  0081 26fc          	jrne	L605
3018  0083               L405:
3019  0083 c4540c        	and	a,21516
3021  0086 2005          	jra	L3611
3022  0088               L5511:
3023                     ; 643     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
3025  0088 c65400        	ld	a,21504
3026  008b 1403          	and	a,(OFST+2,sp)
3028  008d               L3611:
3029                     ; 645   return ((ITStatus)itstatus);
3033  008d 5b03          	addw	sp,#3
3034  008f 81            	ret	
3080                     ; 666 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
3080                     ; 667 {
3081                     .text:	section	.text,new
3082  0000               _ADC1_ClearITPendingBit:
3084  0000 89            	pushw	x
3085  0001 88            	push	a
3086       00000001      OFST:	set	1
3089                     ; 668   uint8_t temp = 0;
3091                     ; 671   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
3093  0002 a30080        	cpw	x,#128
3094  0005 274a          	jreq	L615
3095  0007 a30140        	cpw	x,#320
3096  000a 2745          	jreq	L615
3097  000c a30110        	cpw	x,#272
3098  000f 2740          	jreq	L615
3099  0011 a30111        	cpw	x,#273
3100  0014 273b          	jreq	L615
3101  0016 a30112        	cpw	x,#274
3102  0019 2736          	jreq	L615
3103  001b a30113        	cpw	x,#275
3104  001e 2731          	jreq	L615
3105  0020 a30114        	cpw	x,#276
3106  0023 272c          	jreq	L615
3107  0025 a30115        	cpw	x,#277
3108  0028 2727          	jreq	L615
3109  002a a30116        	cpw	x,#278
3110  002d 2722          	jreq	L615
3111  002f a30117        	cpw	x,#279
3112  0032 271d          	jreq	L615
3113  0034 a30118        	cpw	x,#280
3114  0037 2718          	jreq	L615
3115  0039 a3011c        	cpw	x,#284
3116  003c 2713          	jreq	L615
3117  003e a30119        	cpw	x,#281
3118  0041 270e          	jreq	L615
3119  0043 ae029f        	ldw	x,#671
3120  0046 89            	pushw	x
3121  0047 5f            	clrw	x
3122  0048 89            	pushw	x
3123  0049 ae0000        	ldw	x,#L542
3124  004c cd0000        	call	_assert_failed
3126  004f 5b04          	addw	sp,#4
3127  0051               L615:
3128                     ; 673   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
3130  0051 7b03          	ld	a,(OFST+2,sp)
3131  0053 a4f0          	and	a,#240
3132  0055 5f            	clrw	x
3133  0056 02            	rlwa	x,a
3134  0057 a30010        	cpw	x,#16
3135  005a 2634          	jrne	L7021
3136                     ; 676     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
3138  005c 7b03          	ld	a,(OFST+2,sp)
3139  005e a40f          	and	a,#15
3140  0060 6b01          	ld	(OFST+0,sp),a
3142                     ; 677     if (temp < 8)
3144  0062 a108          	cp	a,#8
3145  0064 2414          	jruge	L1121
3146                     ; 679       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
3148  0066 5f            	clrw	x
3149  0067 97            	ld	xl,a
3150  0068 a601          	ld	a,#1
3151  006a 5d            	tnzw	x
3152  006b 2704          	jreq	L225
3153  006d               L425:
3154  006d 48            	sll	a
3155  006e 5a            	decw	x
3156  006f 26fc          	jrne	L425
3157  0071               L225:
3158  0071 43            	cpl	a
3159  0072 c4540d        	and	a,21517
3160  0075 c7540d        	ld	21517,a
3162  0078 201f          	jra	L5121
3163  007a               L1121:
3164                     ; 683       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
3166  007a a008          	sub	a,#8
3167  007c 5f            	clrw	x
3168  007d 97            	ld	xl,a
3169  007e a601          	ld	a,#1
3170  0080 5d            	tnzw	x
3171  0081 2704          	jreq	L625
3172  0083               L035:
3173  0083 48            	sll	a
3174  0084 5a            	decw	x
3175  0085 26fc          	jrne	L035
3176  0087               L625:
3177  0087 43            	cpl	a
3178  0088 c4540c        	and	a,21516
3179  008b c7540c        	ld	21516,a
3180  008e 2009          	jra	L5121
3181  0090               L7021:
3182                     ; 688     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
3184  0090 7b03          	ld	a,(OFST+2,sp)
3185  0092 43            	cpl	a
3186  0093 c45400        	and	a,21504
3187  0096 c75400        	ld	21504,a
3188  0099               L5121:
3189                     ; 690 }
3192  0099 5b03          	addw	sp,#3
3193  009b 81            	ret	
3206                     	xdef	_ADC1_ClearITPendingBit
3207                     	xdef	_ADC1_GetITStatus
3208                     	xdef	_ADC1_ClearFlag
3209                     	xdef	_ADC1_GetFlagStatus
3210                     	xdef	_ADC1_GetAWDChannelStatus
3211                     	xdef	_ADC1_GetBufferValue
3212                     	xdef	_ADC1_SetLowThreshold
3213                     	xdef	_ADC1_SetHighThreshold
3214                     	xdef	_ADC1_GetConversionValue
3215                     	xdef	_ADC1_StartConversion
3216                     	xdef	_ADC1_AWDChannelConfig
3217                     	xdef	_ADC1_ExternalTriggerConfig
3218                     	xdef	_ADC1_ConversionConfig
3219                     	xdef	_ADC1_SchmittTriggerConfig
3220                     	xdef	_ADC1_PrescalerConfig
3221                     	xdef	_ADC1_ITConfig
3222                     	xdef	_ADC1_DataBufferCmd
3223                     	xdef	_ADC1_Cmd
3224                     	xdef	_ADC1_Init
3225                     	xdef	_ADC1_DeInit
3226                     	xref	_assert_failed
3227                     .const:	section	.text
3228  0000               L542:
3229  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm\librarie"
3230  0012 735c73746d38  	dc.b	"s\stm8s_stdperiph_"
3231  0024 647269766572  	dc.b	"driver\src\stm8s_a"
3232  0036 6463312e6300  	dc.b	"dc1.c",0
3252                     	end
