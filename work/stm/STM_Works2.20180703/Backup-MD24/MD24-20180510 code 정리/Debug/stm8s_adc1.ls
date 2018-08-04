   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.5 - 29 Dec 2015
   3                     ; Generator (Limited) V4.4.4 - 27 Jan 2016
   4                     ; Optimizer V4.4.4 - 27 Jan 2016
  48                     ; 52 void ADC1_DeInit(void)
  48                     ; 53 {
  50                     	switch	.text
  51  0000               _ADC1_DeInit:
  55                     ; 54   ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  57  0000 725f5400      	clr	21504
  58                     ; 55   ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  60  0004 725f5401      	clr	21505
  61                     ; 56   ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  63  0008 725f5402      	clr	21506
  64                     ; 57   ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  66  000c 725f5403      	clr	21507
  67                     ; 58   ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  69  0010 725f5406      	clr	21510
  70                     ; 59   ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  72  0014 725f5407      	clr	21511
  73                     ; 60   ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  75  0018 35ff5408      	mov	21512,#255
  76                     ; 61   ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  78  001c 35035409      	mov	21513,#3
  79                     ; 62   ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  81  0020 725f540a      	clr	21514
  82                     ; 63   ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  84  0024 725f540b      	clr	21515
  85                     ; 64   ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  87  0028 725f540e      	clr	21518
  88                     ; 65   ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  90  002c 725f540f      	clr	21519
  91                     ; 66 }
  94  0030 81            	ret	
 546                     ; 88 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 546                     ; 89 {
 547                     	switch	.text
 548  0031               _ADC1_Init:
 550  0031 89            	pushw	x
 551       00000000      OFST:	set	0
 554                     ; 91   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 556  0032 9e            	ld	a,xh
 557  0033 4d            	tnz	a
 558  0034 270a          	jreq	L41
 559  0036 9e            	ld	a,xh
 560  0037 4a            	dec	a
 561  0038 2706          	jreq	L41
 562  003a ae005b        	ldw	x,#91
 563  003d cd012a        	call	LC001
 564  0040               L41:
 565                     ; 92   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 567  0040 7b02          	ld	a,(OFST+2,sp)
 568  0042 272e          	jreq	L42
 569  0044 a101          	cp	a,#1
 570  0046 272a          	jreq	L42
 571  0048 a102          	cp	a,#2
 572  004a 2726          	jreq	L42
 573  004c a103          	cp	a,#3
 574  004e 2722          	jreq	L42
 575  0050 a104          	cp	a,#4
 576  0052 271e          	jreq	L42
 577  0054 a105          	cp	a,#5
 578  0056 271a          	jreq	L42
 579  0058 a106          	cp	a,#6
 580  005a 2716          	jreq	L42
 581  005c a107          	cp	a,#7
 582  005e 2712          	jreq	L42
 583  0060 a108          	cp	a,#8
 584  0062 270e          	jreq	L42
 585  0064 a10c          	cp	a,#12
 586  0066 270a          	jreq	L42
 587  0068 a109          	cp	a,#9
 588  006a 2706          	jreq	L42
 589  006c ae005c        	ldw	x,#92
 590  006f cd012a        	call	LC001
 591  0072               L42:
 592                     ; 93   assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 594  0072 7b05          	ld	a,(OFST+5,sp)
 595  0074 2722          	jreq	L43
 596  0076 a110          	cp	a,#16
 597  0078 271e          	jreq	L43
 598  007a a120          	cp	a,#32
 599  007c 271a          	jreq	L43
 600  007e a130          	cp	a,#48
 601  0080 2716          	jreq	L43
 602  0082 a140          	cp	a,#64
 603  0084 2712          	jreq	L43
 604  0086 a150          	cp	a,#80
 605  0088 270e          	jreq	L43
 606  008a a160          	cp	a,#96
 607  008c 270a          	jreq	L43
 608  008e a170          	cp	a,#112
 609  0090 2706          	jreq	L43
 610  0092 ae005d        	ldw	x,#93
 611  0095 cd012a        	call	LC001
 612  0098               L43:
 613                     ; 94   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 615  0098 7b06          	ld	a,(OFST+6,sp)
 616  009a 270a          	jreq	L44
 617  009c a110          	cp	a,#16
 618  009e 2706          	jreq	L44
 619  00a0 ae005e        	ldw	x,#94
 620  00a3 cd012a        	call	LC001
 621  00a6               L44:
 622                     ; 95   assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 624  00a6 7b07          	ld	a,(OFST+7,sp)
 625  00a8 2708          	jreq	L45
 626  00aa 4a            	dec	a
 627  00ab 2705          	jreq	L45
 628  00ad ae005f        	ldw	x,#95
 629  00b0 ad78          	call	LC001
 630  00b2               L45:
 631                     ; 96   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 633  00b2 7b08          	ld	a,(OFST+8,sp)
 634  00b4 2709          	jreq	L46
 635  00b6 a108          	cp	a,#8
 636  00b8 2705          	jreq	L46
 637  00ba ae0060        	ldw	x,#96
 638  00bd ad6b          	call	LC001
 639  00bf               L46:
 640                     ; 97   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 642  00bf 7b09          	ld	a,(OFST+9,sp)
 643  00c1 2731          	jreq	L47
 644  00c3 a101          	cp	a,#1
 645  00c5 272d          	jreq	L47
 646  00c7 a102          	cp	a,#2
 647  00c9 2729          	jreq	L47
 648  00cb a103          	cp	a,#3
 649  00cd 2725          	jreq	L47
 650  00cf a104          	cp	a,#4
 651  00d1 2721          	jreq	L47
 652  00d3 a105          	cp	a,#5
 653  00d5 271d          	jreq	L47
 654  00d7 a106          	cp	a,#6
 655  00d9 2719          	jreq	L47
 656  00db a107          	cp	a,#7
 657  00dd 2715          	jreq	L47
 658  00df a108          	cp	a,#8
 659  00e1 2711          	jreq	L47
 660  00e3 a10c          	cp	a,#12
 661  00e5 270d          	jreq	L47
 662  00e7 a1ff          	cp	a,#255
 663  00e9 2709          	jreq	L47
 664  00eb a109          	cp	a,#9
 665  00ed 2705          	jreq	L47
 666  00ef ae0061        	ldw	x,#97
 667  00f2 ad36          	call	LC001
 668  00f4               L47:
 669                     ; 98   assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 671  00f4 7b0a          	ld	a,(OFST+10,sp)
 672  00f6 2708          	jreq	L401
 673  00f8 4a            	dec	a
 674  00f9 2705          	jreq	L401
 675  00fb ae0062        	ldw	x,#98
 676  00fe ad2a          	call	LC001
 677  0100               L401:
 678                     ; 103   ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 680  0100 7b08          	ld	a,(OFST+8,sp)
 681  0102 88            	push	a
 682  0103 7b03          	ld	a,(OFST+3,sp)
 683  0105 97            	ld	xl,a
 684  0106 7b02          	ld	a,(OFST+2,sp)
 685  0108 95            	ld	xh,a
 686  0109 cd02c9        	call	_ADC1_ConversionConfig
 688  010c 84            	pop	a
 689                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 691  010d 7b05          	ld	a,(OFST+5,sp)
 692  010f cd01be        	call	_ADC1_PrescalerConfig
 694                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 696  0112 7b07          	ld	a,(OFST+7,sp)
 697  0114 97            	ld	xl,a
 698  0115 7b06          	ld	a,(OFST+6,sp)
 699  0117 95            	ld	xh,a
 700  0118 cd034e        	call	_ADC1_ExternalTriggerConfig
 702                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 704  011b 7b0a          	ld	a,(OFST+10,sp)
 705  011d 97            	ld	xl,a
 706  011e 7b09          	ld	a,(OFST+9,sp)
 707  0120 95            	ld	xh,a
 708  0121 cd01fe        	call	_ADC1_SchmittTriggerConfig
 710                     ; 118   ADC1->CR1 |= ADC1_CR1_ADON;
 712  0124 72105401      	bset	21505,#0
 713                     ; 119 }
 716  0128 85            	popw	x
 717  0129 81            	ret	
 718  012a               LC001:
 719  012a 89            	pushw	x
 720  012b 5f            	clrw	x
 721  012c 89            	pushw	x
 722  012d ae0000        	ldw	x,#L542
 723  0130 cd0000        	call	_assert_failed
 725  0133 5b04          	addw	sp,#4
 726  0135 81            	ret	
 762                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 762                     ; 127 {
 763                     	switch	.text
 764  0136               _ADC1_Cmd:
 766  0136 88            	push	a
 767       00000000      OFST:	set	0
 770                     ; 129   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 772  0137 4d            	tnz	a
 773  0138 2711          	jreq	L621
 774  013a 4a            	dec	a
 775  013b 270e          	jreq	L621
 776  013d ae0081        	ldw	x,#129
 777  0140 89            	pushw	x
 778  0141 5f            	clrw	x
 779  0142 89            	pushw	x
 780  0143 ae0000        	ldw	x,#L542
 781  0146 cd0000        	call	_assert_failed
 783  0149 5b04          	addw	sp,#4
 784  014b               L621:
 785                     ; 131   if (NewState != DISABLE)
 787  014b 7b01          	ld	a,(OFST+1,sp)
 788  014d 2706          	jreq	L562
 789                     ; 133     ADC1->CR1 |= ADC1_CR1_ADON;
 791  014f 72105401      	bset	21505,#0
 793  0153 2004          	jra	L762
 794  0155               L562:
 795                     ; 137     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 797  0155 72115401      	bres	21505,#0
 798  0159               L762:
 799                     ; 139 }
 802  0159 84            	pop	a
 803  015a 81            	ret	
 839                     ; 170 void ADC1_DataBufferCmd(FunctionalState NewState)
 839                     ; 171 {
 840                     	switch	.text
 841  015b               _ADC1_DataBufferCmd:
 843  015b 88            	push	a
 844       00000000      OFST:	set	0
 847                     ; 173   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 849  015c 4d            	tnz	a
 850  015d 2711          	jreq	L041
 851  015f 4a            	dec	a
 852  0160 270e          	jreq	L041
 853  0162 ae00ad        	ldw	x,#173
 854  0165 89            	pushw	x
 855  0166 5f            	clrw	x
 856  0167 89            	pushw	x
 857  0168 ae0000        	ldw	x,#L542
 858  016b cd0000        	call	_assert_failed
 860  016e 5b04          	addw	sp,#4
 861  0170               L041:
 862                     ; 175   if (NewState != DISABLE)
 864  0170 7b01          	ld	a,(OFST+1,sp)
 865  0172 2706          	jreq	L703
 866                     ; 177     ADC1->CR3 |= ADC1_CR3_DBUF;
 868  0174 721e5403      	bset	21507,#7
 870  0178 2004          	jra	L113
 871  017a               L703:
 872                     ; 181     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 874  017a 721f5403      	bres	21507,#7
 875  017e               L113:
 876                     ; 183 }
 879  017e 84            	pop	a
 880  017f 81            	ret	
1037                     ; 194 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
1037                     ; 195 {
1038                     	switch	.text
1039  0180               _ADC1_ITConfig:
1041  0180 89            	pushw	x
1042       00000000      OFST:	set	0
1045                     ; 197   assert_param(IS_ADC1_IT_OK(ADC1_IT));
1047  0181 a30020        	cpw	x,#32
1048  0184 270a          	jreq	L251
1049  0186 a30010        	cpw	x,#16
1050  0189 2705          	jreq	L251
1051  018b ae00c5        	ldw	x,#197
1052  018e ad22          	call	LC002
1053  0190               L251:
1054                     ; 198   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1056  0190 7b05          	ld	a,(OFST+5,sp)
1057  0192 2708          	jreq	L261
1058  0194 4a            	dec	a
1059  0195 2705          	jreq	L261
1060  0197 ae00c6        	ldw	x,#198
1061  019a ad16          	call	LC002
1062  019c               L261:
1063                     ; 200   if (NewState != DISABLE)
1065  019c 7b05          	ld	a,(OFST+5,sp)
1066  019e 2707          	jreq	L773
1067                     ; 203     ADC1->CSR |= (uint8_t)ADC1_IT;
1069  01a0 c65400        	ld	a,21504
1070  01a3 1a02          	or	a,(OFST+2,sp)
1072  01a5 2006          	jra	L104
1073  01a7               L773:
1074                     ; 208     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
1076  01a7 7b02          	ld	a,(OFST+2,sp)
1077  01a9 43            	cpl	a
1078  01aa c45400        	and	a,21504
1079  01ad               L104:
1080  01ad c75400        	ld	21504,a
1081                     ; 210 }
1084  01b0 85            	popw	x
1085  01b1 81            	ret	
1086  01b2               LC002:
1087  01b2 89            	pushw	x
1088  01b3 5f            	clrw	x
1089  01b4 89            	pushw	x
1090  01b5 ae0000        	ldw	x,#L542
1091  01b8 cd0000        	call	_assert_failed
1093  01bb 5b04          	addw	sp,#4
1094  01bd 81            	ret	
1131                     ; 218 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1131                     ; 219 {
1132                     	switch	.text
1133  01be               _ADC1_PrescalerConfig:
1135  01be 88            	push	a
1136       00000000      OFST:	set	0
1139                     ; 221   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1141  01bf 4d            	tnz	a
1142  01c0 272a          	jreq	L471
1143  01c2 a110          	cp	a,#16
1144  01c4 2726          	jreq	L471
1145  01c6 a120          	cp	a,#32
1146  01c8 2722          	jreq	L471
1147  01ca a130          	cp	a,#48
1148  01cc 271e          	jreq	L471
1149  01ce a140          	cp	a,#64
1150  01d0 271a          	jreq	L471
1151  01d2 a150          	cp	a,#80
1152  01d4 2716          	jreq	L471
1153  01d6 a160          	cp	a,#96
1154  01d8 2712          	jreq	L471
1155  01da a170          	cp	a,#112
1156  01dc 270e          	jreq	L471
1157  01de ae00dd        	ldw	x,#221
1158  01e1 89            	pushw	x
1159  01e2 5f            	clrw	x
1160  01e3 89            	pushw	x
1161  01e4 ae0000        	ldw	x,#L542
1162  01e7 cd0000        	call	_assert_failed
1164  01ea 5b04          	addw	sp,#4
1165  01ec               L471:
1166                     ; 224   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1168  01ec c65401        	ld	a,21505
1169  01ef a48f          	and	a,#143
1170  01f1 c75401        	ld	21505,a
1171                     ; 226   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1173  01f4 c65401        	ld	a,21505
1174  01f7 1a01          	or	a,(OFST+1,sp)
1175  01f9 c75401        	ld	21505,a
1176                     ; 227 }
1179  01fc 84            	pop	a
1180  01fd 81            	ret	
1228                     ; 237 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1228                     ; 238 {
1229                     	switch	.text
1230  01fe               _ADC1_SchmittTriggerConfig:
1232  01fe 89            	pushw	x
1233       00000000      OFST:	set	0
1236                     ; 240   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1238  01ff 9e            	ld	a,xh
1239  0200 4d            	tnz	a
1240  0201 273b          	jreq	L602
1241  0203 9e            	ld	a,xh
1242  0204 4a            	dec	a
1243  0205 2737          	jreq	L602
1244  0207 9e            	ld	a,xh
1245  0208 a102          	cp	a,#2
1246  020a 2732          	jreq	L602
1247  020c 9e            	ld	a,xh
1248  020d a103          	cp	a,#3
1249  020f 272d          	jreq	L602
1250  0211 9e            	ld	a,xh
1251  0212 a104          	cp	a,#4
1252  0214 2728          	jreq	L602
1253  0216 9e            	ld	a,xh
1254  0217 a105          	cp	a,#5
1255  0219 2723          	jreq	L602
1256  021b 9e            	ld	a,xh
1257  021c a106          	cp	a,#6
1258  021e 271e          	jreq	L602
1259  0220 9e            	ld	a,xh
1260  0221 a107          	cp	a,#7
1261  0223 2719          	jreq	L602
1262  0225 9e            	ld	a,xh
1263  0226 a108          	cp	a,#8
1264  0228 2714          	jreq	L602
1265  022a 9e            	ld	a,xh
1266  022b a10c          	cp	a,#12
1267  022d 270f          	jreq	L602
1268  022f 9e            	ld	a,xh
1269  0230 4c            	inc	a
1270  0231 270b          	jreq	L602
1271  0233 9e            	ld	a,xh
1272  0234 a109          	cp	a,#9
1273  0236 2706          	jreq	L602
1274  0238 ae00f0        	ldw	x,#240
1275  023b cd02bd        	call	LC006
1276  023e               L602:
1277                     ; 241   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1279  023e 7b02          	ld	a,(OFST+2,sp)
1280  0240 2708          	jreq	L612
1281  0242 4a            	dec	a
1282  0243 2705          	jreq	L612
1283  0245 ae00f1        	ldw	x,#241
1284  0248 ad73          	call	LC006
1285  024a               L612:
1286                     ; 243   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1288  024a 7b01          	ld	a,(OFST+1,sp)
1289  024c a1ff          	cp	a,#255
1290  024e 261d          	jrne	L344
1291                     ; 245     if (NewState != DISABLE)
1293  0250 7b02          	ld	a,(OFST+2,sp)
1294  0252 270a          	jreq	L544
1295                     ; 247       ADC1->TDRL &= (uint8_t)0x0;
1297  0254 725f5407      	clr	21511
1298                     ; 248       ADC1->TDRH &= (uint8_t)0x0;
1300  0258 725f5406      	clr	21510
1302  025c 2057          	jra	L154
1303  025e               L544:
1304                     ; 252       ADC1->TDRL |= (uint8_t)0xFF;
1306  025e c65407        	ld	a,21511
1307  0261 aaff          	or	a,#255
1308  0263 c75407        	ld	21511,a
1309                     ; 253       ADC1->TDRH |= (uint8_t)0xFF;
1311  0266 c65406        	ld	a,21510
1312  0269 aaff          	or	a,#255
1313  026b 2045          	jp	LC003
1314  026d               L344:
1315                     ; 256   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1317  026d a108          	cp	a,#8
1318  026f 0d02          	tnz	(OFST+2,sp)
1319  0271 2420          	jruge	L354
1320                     ; 258     if (NewState != DISABLE)
1322  0273 2711          	jreq	L554
1323                     ; 260       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1325  0275 ad40          	call	LC005
1326  0277 2704          	jreq	L222
1327  0279               L422:
1328  0279 48            	sll	a
1329  027a 5a            	decw	x
1330  027b 26fc          	jrne	L422
1331  027d               L222:
1332  027d 43            	cpl	a
1333  027e c45407        	and	a,21511
1334  0281               LC004:
1335  0281 c75407        	ld	21511,a
1337  0284 202f          	jra	L154
1338  0286               L554:
1339                     ; 264       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1341  0286 ad2f          	call	LC005
1342  0288 2704          	jreq	L622
1343  028a               L032:
1344  028a 48            	sll	a
1345  028b 5a            	decw	x
1346  028c 26fc          	jrne	L032
1347  028e               L622:
1348  028e ca5407        	or	a,21511
1349  0291 20ee          	jp	LC004
1350  0293               L354:
1351                     ; 269     if (NewState != DISABLE)
1353  0293 2710          	jreq	L364
1354                     ; 271       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1356  0295 a008          	sub	a,#8
1357  0297 ad1e          	call	LC005
1358  0299 2704          	jreq	L232
1359  029b               L432:
1360  029b 48            	sll	a
1361  029c 5a            	decw	x
1362  029d 26fc          	jrne	L432
1363  029f               L232:
1364  029f 43            	cpl	a
1365  02a0 c45406        	and	a,21510
1367  02a3 200d          	jp	LC003
1368  02a5               L364:
1369                     ; 275       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1371  02a5 a008          	sub	a,#8
1372  02a7 ad0e          	call	LC005
1373  02a9 2704          	jreq	L632
1374  02ab               L042:
1375  02ab 48            	sll	a
1376  02ac 5a            	decw	x
1377  02ad 26fc          	jrne	L042
1378  02af               L632:
1379  02af ca5406        	or	a,21510
1380  02b2               LC003:
1381  02b2 c75406        	ld	21510,a
1382  02b5               L154:
1383                     ; 278 }
1386  02b5 85            	popw	x
1387  02b6 81            	ret	
1388  02b7               LC005:
1389  02b7 5f            	clrw	x
1390  02b8 97            	ld	xl,a
1391  02b9 a601          	ld	a,#1
1392  02bb 5d            	tnzw	x
1393  02bc 81            	ret	
1394  02bd               LC006:
1395  02bd 89            	pushw	x
1396  02be 5f            	clrw	x
1397  02bf 89            	pushw	x
1398  02c0 ae0000        	ldw	x,#L542
1399  02c3 cd0000        	call	_assert_failed
1401  02c6 5b04          	addw	sp,#4
1402  02c8 81            	ret	
1460                     ; 290 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1460                     ; 291 {
1461                     	switch	.text
1462  02c9               _ADC1_ConversionConfig:
1464  02c9 89            	pushw	x
1465       00000000      OFST:	set	0
1468                     ; 293   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1470  02ca 9e            	ld	a,xh
1471  02cb 4d            	tnz	a
1472  02cc 2709          	jreq	L052
1473  02ce 9e            	ld	a,xh
1474  02cf 4a            	dec	a
1475  02d0 2705          	jreq	L052
1476  02d2 ae0125        	ldw	x,#293
1477  02d5 ad6b          	call	LC007
1478  02d7               L052:
1479                     ; 294   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1481  02d7 7b02          	ld	a,(OFST+2,sp)
1482  02d9 272d          	jreq	L062
1483  02db a101          	cp	a,#1
1484  02dd 2729          	jreq	L062
1485  02df a102          	cp	a,#2
1486  02e1 2725          	jreq	L062
1487  02e3 a103          	cp	a,#3
1488  02e5 2721          	jreq	L062
1489  02e7 a104          	cp	a,#4
1490  02e9 271d          	jreq	L062
1491  02eb a105          	cp	a,#5
1492  02ed 2719          	jreq	L062
1493  02ef a106          	cp	a,#6
1494  02f1 2715          	jreq	L062
1495  02f3 a107          	cp	a,#7
1496  02f5 2711          	jreq	L062
1497  02f7 a108          	cp	a,#8
1498  02f9 270d          	jreq	L062
1499  02fb a10c          	cp	a,#12
1500  02fd 2709          	jreq	L062
1501  02ff a109          	cp	a,#9
1502  0301 2705          	jreq	L062
1503  0303 ae0126        	ldw	x,#294
1504  0306 ad3a          	call	LC007
1505  0308               L062:
1506                     ; 295   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1508  0308 7b05          	ld	a,(OFST+5,sp)
1509  030a 2709          	jreq	L072
1510  030c a108          	cp	a,#8
1511  030e 2705          	jreq	L072
1512  0310 ae0127        	ldw	x,#295
1513  0313 ad2d          	call	LC007
1514  0315               L072:
1515                     ; 298   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1517  0315 72175402      	bres	21506,#3
1518                     ; 300   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1520  0319 c65402        	ld	a,21506
1521  031c 1a05          	or	a,(OFST+5,sp)
1522  031e c75402        	ld	21506,a
1523                     ; 302   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1525  0321 7b01          	ld	a,(OFST+1,sp)
1526  0323 4a            	dec	a
1527  0324 2606          	jrne	L515
1528                     ; 305     ADC1->CR1 |= ADC1_CR1_CONT;
1530  0326 72125401      	bset	21505,#1
1532  032a 2004          	jra	L715
1533  032c               L515:
1534                     ; 310     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1536  032c 72135401      	bres	21505,#1
1537  0330               L715:
1538                     ; 314   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1540  0330 c65400        	ld	a,21504
1541  0333 a4f0          	and	a,#240
1542  0335 c75400        	ld	21504,a
1543                     ; 316   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1545  0338 c65400        	ld	a,21504
1546  033b 1a02          	or	a,(OFST+2,sp)
1547  033d c75400        	ld	21504,a
1548                     ; 317 }
1551  0340 85            	popw	x
1552  0341 81            	ret	
1553  0342               LC007:
1554  0342 89            	pushw	x
1555  0343 5f            	clrw	x
1556  0344 89            	pushw	x
1557  0345 ae0000        	ldw	x,#L542
1558  0348 cd0000        	call	_assert_failed
1560  034b 5b04          	addw	sp,#4
1561  034d 81            	ret	
1608                     ; 329 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1608                     ; 330 {
1609                     	switch	.text
1610  034e               _ADC1_ExternalTriggerConfig:
1612  034e 89            	pushw	x
1613       00000000      OFST:	set	0
1616                     ; 332   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1618  034f 9e            	ld	a,xh
1619  0350 4d            	tnz	a
1620  0351 270a          	jreq	L203
1621  0353 9e            	ld	a,xh
1622  0354 a110          	cp	a,#16
1623  0356 2705          	jreq	L203
1624  0358 ae014c        	ldw	x,#332
1625  035b ad2c          	call	LC008
1626  035d               L203:
1627                     ; 333   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1629  035d 7b02          	ld	a,(OFST+2,sp)
1630  035f 2708          	jreq	L213
1631  0361 4a            	dec	a
1632  0362 2705          	jreq	L213
1633  0364 ae014d        	ldw	x,#333
1634  0367 ad20          	call	LC008
1635  0369               L213:
1636                     ; 336   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1638  0369 c65402        	ld	a,21506
1639  036c a4cf          	and	a,#207
1640  036e c75402        	ld	21506,a
1641                     ; 338   if (NewState != DISABLE)
1643  0371 7b02          	ld	a,(OFST+2,sp)
1644  0373 2706          	jreq	L345
1645                     ; 341     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1647  0375 721c5402      	bset	21506,#6
1649  0379 2004          	jra	L545
1650  037b               L345:
1651                     ; 346     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1653  037b 721d5402      	bres	21506,#6
1654  037f               L545:
1655                     ; 350   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1657  037f c65402        	ld	a,21506
1658  0382 1a01          	or	a,(OFST+1,sp)
1659  0384 c75402        	ld	21506,a
1660                     ; 351 }
1663  0387 85            	popw	x
1664  0388 81            	ret	
1665  0389               LC008:
1666  0389 89            	pushw	x
1667  038a 5f            	clrw	x
1668  038b 89            	pushw	x
1669  038c ae0000        	ldw	x,#L542
1670  038f cd0000        	call	_assert_failed
1672  0392 5b04          	addw	sp,#4
1673  0394 81            	ret	
1697                     ; 362 void ADC1_StartConversion(void)
1697                     ; 363 {
1698                     	switch	.text
1699  0395               _ADC1_StartConversion:
1703                     ; 364   ADC1->CR1 |= ADC1_CR1_ADON;
1705  0395 72105401      	bset	21505,#0
1706                     ; 365 }
1709  0399 81            	ret	
1753                     ; 374 uint16_t ADC1_GetConversionValue(void)
1753                     ; 375 {
1754                     	switch	.text
1755  039a               _ADC1_GetConversionValue:
1757  039a 5205          	subw	sp,#5
1758       00000005      OFST:	set	5
1761                     ; 376   uint16_t temph = 0;
1763                     ; 377   uint8_t templ = 0;
1765                     ; 379   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1767  039c 720754020e    	btjf	21506,#3,L106
1768                     ; 382     templ = ADC1->DRL;
1770  03a1 c65405        	ld	a,21509
1771  03a4 6b03          	ld	(OFST-2,sp),a
1773                     ; 384     temph = ADC1->DRH;
1775  03a6 c65404        	ld	a,21508
1776  03a9 97            	ld	xl,a
1778                     ; 386     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1780  03aa 7b03          	ld	a,(OFST-2,sp)
1781  03ac 02            	rlwa	x,a
1784  03ad 201a          	jra	L306
1785  03af               L106:
1786                     ; 391     temph = ADC1->DRH;
1788  03af c65404        	ld	a,21508
1789  03b2 97            	ld	xl,a
1791                     ; 393     templ = ADC1->DRL;
1793  03b3 c65405        	ld	a,21509
1794  03b6 6b03          	ld	(OFST-2,sp),a
1796                     ; 395     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1798  03b8 4f            	clr	a
1799  03b9 02            	rlwa	x,a
1800  03ba 1f01          	ldw	(OFST-4,sp),x
1802  03bc 7b03          	ld	a,(OFST-2,sp)
1803  03be 97            	ld	xl,a
1804  03bf a640          	ld	a,#64
1805  03c1 42            	mul	x,a
1806  03c2 01            	rrwa	x,a
1807  03c3 1a02          	or	a,(OFST-3,sp)
1808  03c5 01            	rrwa	x,a
1809  03c6 1a01          	or	a,(OFST-4,sp)
1810  03c8 01            	rrwa	x,a
1812  03c9               L306:
1813                     ; 398   return ((uint16_t)temph);
1817  03c9 5b05          	addw	sp,#5
1818  03cb 81            	ret	
1865                     ; 409 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1865                     ; 410 {
1866                     	switch	.text
1867  03cc               _ADC1_AWDChannelConfig:
1869  03cc 89            	pushw	x
1870       00000000      OFST:	set	0
1873                     ; 412   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1875  03cd 9f            	ld	a,xl
1876  03ce 4d            	tnz	a
1877  03cf 270a          	jreq	L033
1878  03d1 9f            	ld	a,xl
1879  03d2 4a            	dec	a
1880  03d3 2706          	jreq	L033
1881  03d5 ae019c        	ldw	x,#412
1882  03d8 cd045e        	call	LC012
1883  03db               L033:
1884                     ; 413   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1886  03db 7b01          	ld	a,(OFST+1,sp)
1887  03dd 272f          	jreq	L043
1888  03df a101          	cp	a,#1
1889  03e1 272b          	jreq	L043
1890  03e3 a102          	cp	a,#2
1891  03e5 2727          	jreq	L043
1892  03e7 a103          	cp	a,#3
1893  03e9 2723          	jreq	L043
1894  03eb a104          	cp	a,#4
1895  03ed 271f          	jreq	L043
1896  03ef a105          	cp	a,#5
1897  03f1 271b          	jreq	L043
1898  03f3 a106          	cp	a,#6
1899  03f5 2717          	jreq	L043
1900  03f7 a107          	cp	a,#7
1901  03f9 2713          	jreq	L043
1902  03fb a108          	cp	a,#8
1903  03fd 270f          	jreq	L043
1904  03ff a10c          	cp	a,#12
1905  0401 270b          	jreq	L043
1906  0403 a109          	cp	a,#9
1907  0405 2707          	jreq	L043
1908  0407 ae019d        	ldw	x,#413
1909  040a ad52          	call	LC012
1910  040c 7b01          	ld	a,(OFST+1,sp)
1911  040e               L043:
1912                     ; 415   if (Channel < (uint8_t)8)
1914  040e a108          	cp	a,#8
1915  0410 0d02          	tnz	(OFST+2,sp)
1916  0412 2420          	jruge	L726
1917                     ; 417     if (NewState != DISABLE)
1919  0414 270d          	jreq	L136
1920                     ; 419       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1922  0416 ad40          	call	LC011
1923  0418 2704          	jreq	L443
1924  041a               L643:
1925  041a 48            	sll	a
1926  041b 5a            	decw	x
1927  041c 26fc          	jrne	L643
1928  041e               L443:
1929  041e ca540f        	or	a,21519
1931  0421 200c          	jp	LC010
1932  0423               L136:
1933                     ; 423       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1935  0423 ad33          	call	LC011
1936  0425 2704          	jreq	L053
1937  0427               L253:
1938  0427 48            	sll	a
1939  0428 5a            	decw	x
1940  0429 26fc          	jrne	L253
1941  042b               L053:
1942  042b 43            	cpl	a
1943  042c c4540f        	and	a,21519
1944  042f               LC010:
1945  042f c7540f        	ld	21519,a
1946  0432 2022          	jra	L536
1947  0434               L726:
1948                     ; 428     if (NewState != DISABLE)
1950  0434 270f          	jreq	L736
1951                     ; 430       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1953  0436 a008          	sub	a,#8
1954  0438 ad1e          	call	LC011
1955  043a 2704          	jreq	L453
1956  043c               L653:
1957  043c 48            	sll	a
1958  043d 5a            	decw	x
1959  043e 26fc          	jrne	L653
1960  0440               L453:
1961  0440 ca540e        	or	a,21518
1963  0443 200e          	jp	LC009
1964  0445               L736:
1965                     ; 434       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1967  0445 a008          	sub	a,#8
1968  0447 ad0f          	call	LC011
1969  0449 2704          	jreq	L063
1970  044b               L263:
1971  044b 48            	sll	a
1972  044c 5a            	decw	x
1973  044d 26fc          	jrne	L263
1974  044f               L063:
1975  044f 43            	cpl	a
1976  0450 c4540e        	and	a,21518
1977  0453               LC009:
1978  0453 c7540e        	ld	21518,a
1979  0456               L536:
1980                     ; 437 }
1983  0456 85            	popw	x
1984  0457 81            	ret	
1985  0458               LC011:
1986  0458 5f            	clrw	x
1987  0459 97            	ld	xl,a
1988  045a a601          	ld	a,#1
1989  045c 5d            	tnzw	x
1990  045d 81            	ret	
1991  045e               LC012:
1992  045e 89            	pushw	x
1993  045f 5f            	clrw	x
1994  0460 89            	pushw	x
1995  0461 ae0000        	ldw	x,#L542
1996  0464 cd0000        	call	_assert_failed
1998  0467 5b04          	addw	sp,#4
1999  0469 81            	ret	
2034                     ; 445 void ADC1_SetHighThreshold(uint16_t Threshold)
2034                     ; 446 {
2035                     	switch	.text
2036  046a               _ADC1_SetHighThreshold:
2038  046a 89            	pushw	x
2039       00000000      OFST:	set	0
2042                     ; 447   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
2044  046b 54            	srlw	x
2045  046c 54            	srlw	x
2046  046d 9f            	ld	a,xl
2047  046e c75408        	ld	21512,a
2048                     ; 448   ADC1->HTRL = (uint8_t)Threshold;
2050  0471 7b02          	ld	a,(OFST+2,sp)
2051  0473 c75409        	ld	21513,a
2052                     ; 449 }
2055  0476 85            	popw	x
2056  0477 81            	ret	
2091                     ; 457 void ADC1_SetLowThreshold(uint16_t Threshold)
2091                     ; 458 {
2092                     	switch	.text
2093  0478               _ADC1_SetLowThreshold:
2097                     ; 459   ADC1->LTRL = (uint8_t)Threshold;
2099  0478 9f            	ld	a,xl
2100  0479 c7540b        	ld	21515,a
2101                     ; 460   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
2103  047c 54            	srlw	x
2104  047d 54            	srlw	x
2105  047e 9f            	ld	a,xl
2106  047f c7540a        	ld	21514,a
2107                     ; 461 }
2110  0482 81            	ret	
2164                     ; 470 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
2164                     ; 471 {
2165                     	switch	.text
2166  0483               _ADC1_GetBufferValue:
2168  0483 88            	push	a
2169  0484 5205          	subw	sp,#5
2170       00000005      OFST:	set	5
2173                     ; 472   uint16_t temph = 0;
2175                     ; 473   uint8_t templ = 0;
2177                     ; 476   assert_param(IS_ADC1_BUFFER_OK(Buffer));
2179  0486 a10a          	cp	a,#10
2180  0488 250e          	jrult	L473
2181  048a ae01dc        	ldw	x,#476
2182  048d 89            	pushw	x
2183  048e 5f            	clrw	x
2184  048f 89            	pushw	x
2185  0490 ae0000        	ldw	x,#L542
2186  0493 cd0000        	call	_assert_failed
2188  0496 5b04          	addw	sp,#4
2189  0498               L473:
2190                     ; 478   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
2192  0498 7b06          	ld	a,(OFST+1,sp)
2193  049a 48            	sll	a
2194  049b 5f            	clrw	x
2195  049c 97            	ld	xl,a
2196  049d 7207540213    	btjf	21506,#3,L527
2197                     ; 481     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
2199  04a2 d653e1        	ld	a,(21473,x)
2200  04a5 6b03          	ld	(OFST-2,sp),a
2202                     ; 483     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
2204  04a7 7b06          	ld	a,(OFST+1,sp)
2205  04a9 48            	sll	a
2206  04aa 5f            	clrw	x
2207  04ab 97            	ld	xl,a
2208  04ac d653e0        	ld	a,(21472,x)
2209  04af 97            	ld	xl,a
2211                     ; 485     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
2213  04b0 7b03          	ld	a,(OFST-2,sp)
2214  04b2 02            	rlwa	x,a
2217  04b3 2024          	jra	L727
2218  04b5               L527:
2219                     ; 490     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
2221  04b5 d653e0        	ld	a,(21472,x)
2222  04b8 5f            	clrw	x
2223  04b9 97            	ld	xl,a
2224  04ba 1f04          	ldw	(OFST-1,sp),x
2226                     ; 492     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
2228  04bc 7b06          	ld	a,(OFST+1,sp)
2229  04be 48            	sll	a
2230  04bf 5f            	clrw	x
2231  04c0 97            	ld	xl,a
2232  04c1 d653e1        	ld	a,(21473,x)
2233  04c4 6b03          	ld	(OFST-2,sp),a
2235                     ; 494     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
2237  04c6 4f            	clr	a
2238  04c7 1e04          	ldw	x,(OFST-1,sp)
2239  04c9 02            	rlwa	x,a
2240  04ca 1f01          	ldw	(OFST-4,sp),x
2242  04cc 7b03          	ld	a,(OFST-2,sp)
2243  04ce 97            	ld	xl,a
2244  04cf a640          	ld	a,#64
2245  04d1 42            	mul	x,a
2246  04d2 01            	rrwa	x,a
2247  04d3 1a02          	or	a,(OFST-3,sp)
2248  04d5 01            	rrwa	x,a
2249  04d6 1a01          	or	a,(OFST-4,sp)
2250  04d8 01            	rrwa	x,a
2252  04d9               L727:
2253                     ; 497   return ((uint16_t)temph);
2257  04d9 5b06          	addw	sp,#6
2258  04db 81            	ret	
2325                     ; 506 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2325                     ; 507 {
2326                     	switch	.text
2327  04dc               _ADC1_GetAWDChannelStatus:
2329  04dc 88            	push	a
2330  04dd 88            	push	a
2331       00000001      OFST:	set	1
2334                     ; 508   uint8_t status = 0;
2336                     ; 511   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2338  04de 4d            	tnz	a
2339  04df 2736          	jreq	L604
2340  04e1 a101          	cp	a,#1
2341  04e3 2732          	jreq	L604
2342  04e5 a102          	cp	a,#2
2343  04e7 272e          	jreq	L604
2344  04e9 a103          	cp	a,#3
2345  04eb 272a          	jreq	L604
2346  04ed a104          	cp	a,#4
2347  04ef 2726          	jreq	L604
2348  04f1 a105          	cp	a,#5
2349  04f3 2722          	jreq	L604
2350  04f5 a106          	cp	a,#6
2351  04f7 271e          	jreq	L604
2352  04f9 a107          	cp	a,#7
2353  04fb 271a          	jreq	L604
2354  04fd a108          	cp	a,#8
2355  04ff 2716          	jreq	L604
2356  0501 a10c          	cp	a,#12
2357  0503 2712          	jreq	L604
2358  0505 a109          	cp	a,#9
2359  0507 270e          	jreq	L604
2360  0509 ae01ff        	ldw	x,#511
2361  050c 89            	pushw	x
2362  050d 5f            	clrw	x
2363  050e 89            	pushw	x
2364  050f ae0000        	ldw	x,#L542
2365  0512 cd0000        	call	_assert_failed
2367  0515 5b04          	addw	sp,#4
2368  0517               L604:
2369                     ; 513   if (Channel < (uint8_t)8)
2371  0517 7b02          	ld	a,(OFST+1,sp)
2372  0519 a108          	cp	a,#8
2373  051b 2410          	jruge	L367
2374                     ; 515     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2376  051d 5f            	clrw	x
2377  051e 97            	ld	xl,a
2378  051f a601          	ld	a,#1
2379  0521 5d            	tnzw	x
2380  0522 2704          	jreq	L214
2381  0524               L414:
2382  0524 48            	sll	a
2383  0525 5a            	decw	x
2384  0526 26fc          	jrne	L414
2385  0528               L214:
2386  0528 c4540d        	and	a,21517
2389  052b 2010          	jra	L567
2390  052d               L367:
2391                     ; 519     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2393  052d a008          	sub	a,#8
2394  052f 5f            	clrw	x
2395  0530 97            	ld	xl,a
2396  0531 a601          	ld	a,#1
2397  0533 5d            	tnzw	x
2398  0534 2704          	jreq	L614
2399  0536               L024:
2400  0536 48            	sll	a
2401  0537 5a            	decw	x
2402  0538 26fc          	jrne	L024
2403  053a               L614:
2404  053a c4540c        	and	a,21516
2406  053d               L567:
2407                     ; 522   return ((FlagStatus)status);
2411  053d 85            	popw	x
2412  053e 81            	ret	
2571                     ; 531 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2571                     ; 532 {
2572                     	switch	.text
2573  053f               _ADC1_GetFlagStatus:
2575  053f 88            	push	a
2576  0540 88            	push	a
2577       00000001      OFST:	set	1
2580                     ; 533   uint8_t flagstatus = 0;
2582                     ; 534   uint8_t temp = 0;
2584                     ; 537   assert_param(IS_ADC1_FLAG_OK(Flag));
2586  0541 a180          	cp	a,#128
2587  0543 273e          	jreq	L034
2588  0545 a141          	cp	a,#65
2589  0547 273a          	jreq	L034
2590  0549 a140          	cp	a,#64
2591  054b 2736          	jreq	L034
2592  054d a110          	cp	a,#16
2593  054f 2732          	jreq	L034
2594  0551 a111          	cp	a,#17
2595  0553 272e          	jreq	L034
2596  0555 a112          	cp	a,#18
2597  0557 272a          	jreq	L034
2598  0559 a113          	cp	a,#19
2599  055b 2726          	jreq	L034
2600  055d a114          	cp	a,#20
2601  055f 2722          	jreq	L034
2602  0561 a115          	cp	a,#21
2603  0563 271e          	jreq	L034
2604  0565 a116          	cp	a,#22
2605  0567 271a          	jreq	L034
2606  0569 a117          	cp	a,#23
2607  056b 2716          	jreq	L034
2608  056d a118          	cp	a,#24
2609  056f 2712          	jreq	L034
2610  0571 a119          	cp	a,#25
2611  0573 270e          	jreq	L034
2612  0575 ae0219        	ldw	x,#537
2613  0578 89            	pushw	x
2614  0579 5f            	clrw	x
2615  057a 89            	pushw	x
2616  057b ae0000        	ldw	x,#L542
2617  057e cd0000        	call	_assert_failed
2619  0581 5b04          	addw	sp,#4
2620  0583               L034:
2621                     ; 539   if ((Flag & 0x0F) == 0x01)
2623  0583 7b02          	ld	a,(OFST+1,sp)
2624  0585 a40f          	and	a,#15
2625  0587 4a            	dec	a
2626  0588 2607          	jrne	L5501
2627                     ; 542     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2629  058a c65403        	ld	a,21507
2630  058d a440          	and	a,#64
2633  058f 2039          	jra	L7501
2634  0591               L5501:
2635                     ; 544   else if ((Flag & 0xF0) == 0x10)
2637  0591 7b02          	ld	a,(OFST+1,sp)
2638  0593 a4f0          	and	a,#240
2639  0595 a110          	cp	a,#16
2640  0597 262c          	jrne	L1601
2641                     ; 547     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2643  0599 7b02          	ld	a,(OFST+1,sp)
2644  059b a40f          	and	a,#15
2645  059d 6b01          	ld	(OFST+0,sp),a
2647                     ; 548     if (temp < 8)
2649  059f a108          	cp	a,#8
2650  05a1 2410          	jruge	L3601
2651                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2653  05a3 5f            	clrw	x
2654  05a4 97            	ld	xl,a
2655  05a5 a601          	ld	a,#1
2656  05a7 5d            	tnzw	x
2657  05a8 2704          	jreq	L434
2658  05aa               L634:
2659  05aa 48            	sll	a
2660  05ab 5a            	decw	x
2661  05ac 26fc          	jrne	L634
2662  05ae               L434:
2663  05ae c4540d        	and	a,21517
2666  05b1 2017          	jra	L7501
2667  05b3               L3601:
2668                     ; 554       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2670  05b3 a008          	sub	a,#8
2671  05b5 5f            	clrw	x
2672  05b6 97            	ld	xl,a
2673  05b7 a601          	ld	a,#1
2674  05b9 5d            	tnzw	x
2675  05ba 2704          	jreq	L044
2676  05bc               L244:
2677  05bc 48            	sll	a
2678  05bd 5a            	decw	x
2679  05be 26fc          	jrne	L244
2680  05c0               L044:
2681  05c0 c4540c        	and	a,21516
2683  05c3 2005          	jra	L7501
2684  05c5               L1601:
2685                     ; 559     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2687  05c5 c65400        	ld	a,21504
2688  05c8 1402          	and	a,(OFST+1,sp)
2690  05ca               L7501:
2691                     ; 561   return ((FlagStatus)flagstatus);
2695  05ca 85            	popw	x
2696  05cb 81            	ret	
2741                     ; 571 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2741                     ; 572 {
2742                     	switch	.text
2743  05cc               _ADC1_ClearFlag:
2745  05cc 88            	push	a
2746  05cd 88            	push	a
2747       00000001      OFST:	set	1
2750                     ; 573   uint8_t temp = 0;
2752                     ; 576   assert_param(IS_ADC1_FLAG_OK(Flag));
2754  05ce a180          	cp	a,#128
2755  05d0 273e          	jreq	L254
2756  05d2 a141          	cp	a,#65
2757  05d4 273a          	jreq	L254
2758  05d6 a140          	cp	a,#64
2759  05d8 2736          	jreq	L254
2760  05da a110          	cp	a,#16
2761  05dc 2732          	jreq	L254
2762  05de a111          	cp	a,#17
2763  05e0 272e          	jreq	L254
2764  05e2 a112          	cp	a,#18
2765  05e4 272a          	jreq	L254
2766  05e6 a113          	cp	a,#19
2767  05e8 2726          	jreq	L254
2768  05ea a114          	cp	a,#20
2769  05ec 2722          	jreq	L254
2770  05ee a115          	cp	a,#21
2771  05f0 271e          	jreq	L254
2772  05f2 a116          	cp	a,#22
2773  05f4 271a          	jreq	L254
2774  05f6 a117          	cp	a,#23
2775  05f8 2716          	jreq	L254
2776  05fa a118          	cp	a,#24
2777  05fc 2712          	jreq	L254
2778  05fe a119          	cp	a,#25
2779  0600 270e          	jreq	L254
2780  0602 ae0240        	ldw	x,#576
2781  0605 89            	pushw	x
2782  0606 5f            	clrw	x
2783  0607 89            	pushw	x
2784  0608 ae0000        	ldw	x,#L542
2785  060b cd0000        	call	_assert_failed
2787  060e 5b04          	addw	sp,#4
2788  0610               L254:
2789                     ; 578   if ((Flag & 0x0F) == 0x01)
2791  0610 7b02          	ld	a,(OFST+1,sp)
2792  0612 a40f          	and	a,#15
2793  0614 4a            	dec	a
2794  0615 2606          	jrne	L3111
2795                     ; 581     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2797  0617 721d5403      	bres	21507,#6
2799  061b 2045          	jra	L5111
2800  061d               L3111:
2801                     ; 583   else if ((Flag & 0xF0) == 0x10)
2803  061d 7b02          	ld	a,(OFST+1,sp)
2804  061f a4f0          	and	a,#240
2805  0621 a110          	cp	a,#16
2806  0623 2634          	jrne	L7111
2807                     ; 586     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2809  0625 7b02          	ld	a,(OFST+1,sp)
2810  0627 a40f          	and	a,#15
2811  0629 6b01          	ld	(OFST+0,sp),a
2813                     ; 587     if (temp < 8)
2815  062b a108          	cp	a,#8
2816  062d 2414          	jruge	L1211
2817                     ; 589       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2819  062f 5f            	clrw	x
2820  0630 97            	ld	xl,a
2821  0631 a601          	ld	a,#1
2822  0633 5d            	tnzw	x
2823  0634 2704          	jreq	L654
2824  0636               L064:
2825  0636 48            	sll	a
2826  0637 5a            	decw	x
2827  0638 26fc          	jrne	L064
2828  063a               L654:
2829  063a 43            	cpl	a
2830  063b c4540d        	and	a,21517
2831  063e c7540d        	ld	21517,a
2833  0641 201f          	jra	L5111
2834  0643               L1211:
2835                     ; 593       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2837  0643 a008          	sub	a,#8
2838  0645 5f            	clrw	x
2839  0646 97            	ld	xl,a
2840  0647 a601          	ld	a,#1
2841  0649 5d            	tnzw	x
2842  064a 2704          	jreq	L264
2843  064c               L464:
2844  064c 48            	sll	a
2845  064d 5a            	decw	x
2846  064e 26fc          	jrne	L464
2847  0650               L264:
2848  0650 43            	cpl	a
2849  0651 c4540c        	and	a,21516
2850  0654 c7540c        	ld	21516,a
2851  0657 2009          	jra	L5111
2852  0659               L7111:
2853                     ; 598     ADC1->CSR &= (uint8_t) (~Flag);
2855  0659 7b02          	ld	a,(OFST+1,sp)
2856  065b 43            	cpl	a
2857  065c c45400        	and	a,21504
2858  065f c75400        	ld	21504,a
2859  0662               L5111:
2860                     ; 600 }
2863  0662 85            	popw	x
2864  0663 81            	ret	
2920                     ; 620 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2920                     ; 621 {
2921                     	switch	.text
2922  0664               _ADC1_GetITStatus:
2924  0664 89            	pushw	x
2925  0665 88            	push	a
2926       00000001      OFST:	set	1
2929                     ; 622   ITStatus itstatus = RESET;
2931                     ; 623   uint8_t temp = 0;
2933                     ; 626   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2935  0666 a30080        	cpw	x,#128
2936  0669 274a          	jreq	L474
2937  066b a30140        	cpw	x,#320
2938  066e 2745          	jreq	L474
2939  0670 a30110        	cpw	x,#272
2940  0673 2740          	jreq	L474
2941  0675 a30111        	cpw	x,#273
2942  0678 273b          	jreq	L474
2943  067a a30112        	cpw	x,#274
2944  067d 2736          	jreq	L474
2945  067f a30113        	cpw	x,#275
2946  0682 2731          	jreq	L474
2947  0684 a30114        	cpw	x,#276
2948  0687 272c          	jreq	L474
2949  0689 a30115        	cpw	x,#277
2950  068c 2727          	jreq	L474
2951  068e a30116        	cpw	x,#278
2952  0691 2722          	jreq	L474
2953  0693 a30117        	cpw	x,#279
2954  0696 271d          	jreq	L474
2955  0698 a30118        	cpw	x,#280
2956  069b 2718          	jreq	L474
2957  069d a3011c        	cpw	x,#284
2958  06a0 2713          	jreq	L474
2959  06a2 a30119        	cpw	x,#281
2960  06a5 270e          	jreq	L474
2961  06a7 ae0272        	ldw	x,#626
2962  06aa 89            	pushw	x
2963  06ab 5f            	clrw	x
2964  06ac 89            	pushw	x
2965  06ad ae0000        	ldw	x,#L542
2966  06b0 cd0000        	call	_assert_failed
2968  06b3 5b04          	addw	sp,#4
2969  06b5               L474:
2970                     ; 628   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2972  06b5 7b03          	ld	a,(OFST+2,sp)
2973  06b7 a4f0          	and	a,#240
2974  06b9 5f            	clrw	x
2975  06ba 02            	rlwa	x,a
2976  06bb a30010        	cpw	x,#16
2977  06be 262c          	jrne	L5511
2978                     ; 631     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2980  06c0 7b03          	ld	a,(OFST+2,sp)
2981  06c2 a40f          	and	a,#15
2982  06c4 6b01          	ld	(OFST+0,sp),a
2984                     ; 632     if (temp < 8)
2986  06c6 a108          	cp	a,#8
2987  06c8 2410          	jruge	L7511
2988                     ; 634       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2990  06ca 5f            	clrw	x
2991  06cb 97            	ld	xl,a
2992  06cc a601          	ld	a,#1
2993  06ce 5d            	tnzw	x
2994  06cf 2704          	jreq	L005
2995  06d1               L205:
2996  06d1 48            	sll	a
2997  06d2 5a            	decw	x
2998  06d3 26fc          	jrne	L205
2999  06d5               L005:
3000  06d5 c4540d        	and	a,21517
3003  06d8 2017          	jra	L3611
3004  06da               L7511:
3005                     ; 638       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
3007  06da a008          	sub	a,#8
3008  06dc 5f            	clrw	x
3009  06dd 97            	ld	xl,a
3010  06de a601          	ld	a,#1
3011  06e0 5d            	tnzw	x
3012  06e1 2704          	jreq	L405
3013  06e3               L605:
3014  06e3 48            	sll	a
3015  06e4 5a            	decw	x
3016  06e5 26fc          	jrne	L605
3017  06e7               L405:
3018  06e7 c4540c        	and	a,21516
3020  06ea 2005          	jra	L3611
3021  06ec               L5511:
3022                     ; 643     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
3024  06ec c65400        	ld	a,21504
3025  06ef 1403          	and	a,(OFST+2,sp)
3027  06f1               L3611:
3028                     ; 645   return ((ITStatus)itstatus);
3032  06f1 5b03          	addw	sp,#3
3033  06f3 81            	ret	
3079                     ; 666 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
3079                     ; 667 {
3080                     	switch	.text
3081  06f4               _ADC1_ClearITPendingBit:
3083  06f4 89            	pushw	x
3084  06f5 88            	push	a
3085       00000001      OFST:	set	1
3088                     ; 668   uint8_t temp = 0;
3090                     ; 671   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
3092  06f6 a30080        	cpw	x,#128
3093  06f9 274a          	jreq	L615
3094  06fb a30140        	cpw	x,#320
3095  06fe 2745          	jreq	L615
3096  0700 a30110        	cpw	x,#272
3097  0703 2740          	jreq	L615
3098  0705 a30111        	cpw	x,#273
3099  0708 273b          	jreq	L615
3100  070a a30112        	cpw	x,#274
3101  070d 2736          	jreq	L615
3102  070f a30113        	cpw	x,#275
3103  0712 2731          	jreq	L615
3104  0714 a30114        	cpw	x,#276
3105  0717 272c          	jreq	L615
3106  0719 a30115        	cpw	x,#277
3107  071c 2727          	jreq	L615
3108  071e a30116        	cpw	x,#278
3109  0721 2722          	jreq	L615
3110  0723 a30117        	cpw	x,#279
3111  0726 271d          	jreq	L615
3112  0728 a30118        	cpw	x,#280
3113  072b 2718          	jreq	L615
3114  072d a3011c        	cpw	x,#284
3115  0730 2713          	jreq	L615
3116  0732 a30119        	cpw	x,#281
3117  0735 270e          	jreq	L615
3118  0737 ae029f        	ldw	x,#671
3119  073a 89            	pushw	x
3120  073b 5f            	clrw	x
3121  073c 89            	pushw	x
3122  073d ae0000        	ldw	x,#L542
3123  0740 cd0000        	call	_assert_failed
3125  0743 5b04          	addw	sp,#4
3126  0745               L615:
3127                     ; 673   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
3129  0745 7b03          	ld	a,(OFST+2,sp)
3130  0747 a4f0          	and	a,#240
3131  0749 5f            	clrw	x
3132  074a 02            	rlwa	x,a
3133  074b a30010        	cpw	x,#16
3134  074e 2634          	jrne	L7021
3135                     ; 676     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
3137  0750 7b03          	ld	a,(OFST+2,sp)
3138  0752 a40f          	and	a,#15
3139  0754 6b01          	ld	(OFST+0,sp),a
3141                     ; 677     if (temp < 8)
3143  0756 a108          	cp	a,#8
3144  0758 2414          	jruge	L1121
3145                     ; 679       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
3147  075a 5f            	clrw	x
3148  075b 97            	ld	xl,a
3149  075c a601          	ld	a,#1
3150  075e 5d            	tnzw	x
3151  075f 2704          	jreq	L225
3152  0761               L425:
3153  0761 48            	sll	a
3154  0762 5a            	decw	x
3155  0763 26fc          	jrne	L425
3156  0765               L225:
3157  0765 43            	cpl	a
3158  0766 c4540d        	and	a,21517
3159  0769 c7540d        	ld	21517,a
3161  076c 201f          	jra	L5121
3162  076e               L1121:
3163                     ; 683       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
3165  076e a008          	sub	a,#8
3166  0770 5f            	clrw	x
3167  0771 97            	ld	xl,a
3168  0772 a601          	ld	a,#1
3169  0774 5d            	tnzw	x
3170  0775 2704          	jreq	L625
3171  0777               L035:
3172  0777 48            	sll	a
3173  0778 5a            	decw	x
3174  0779 26fc          	jrne	L035
3175  077b               L625:
3176  077b 43            	cpl	a
3177  077c c4540c        	and	a,21516
3178  077f c7540c        	ld	21516,a
3179  0782 2009          	jra	L5121
3180  0784               L7021:
3181                     ; 688     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
3183  0784 7b03          	ld	a,(OFST+2,sp)
3184  0786 43            	cpl	a
3185  0787 c45400        	and	a,21504
3186  078a c75400        	ld	21504,a
3187  078d               L5121:
3188                     ; 690 }
3191  078d 5b03          	addw	sp,#3
3192  078f 81            	ret	
3205                     	xdef	_ADC1_ClearITPendingBit
3206                     	xdef	_ADC1_GetITStatus
3207                     	xdef	_ADC1_ClearFlag
3208                     	xdef	_ADC1_GetFlagStatus
3209                     	xdef	_ADC1_GetAWDChannelStatus
3210                     	xdef	_ADC1_GetBufferValue
3211                     	xdef	_ADC1_SetLowThreshold
3212                     	xdef	_ADC1_SetHighThreshold
3213                     	xdef	_ADC1_GetConversionValue
3214                     	xdef	_ADC1_StartConversion
3215                     	xdef	_ADC1_AWDChannelConfig
3216                     	xdef	_ADC1_ExternalTriggerConfig
3217                     	xdef	_ADC1_ConversionConfig
3218                     	xdef	_ADC1_SchmittTriggerConfig
3219                     	xdef	_ADC1_PrescalerConfig
3220                     	xdef	_ADC1_ITConfig
3221                     	xdef	_ADC1_DataBufferCmd
3222                     	xdef	_ADC1_Cmd
3223                     	xdef	_ADC1_Init
3224                     	xdef	_ADC1_DeInit
3225                     	xref	_assert_failed
3226                     .const:	section	.text
3227  0000               L542:
3228  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm\librarie"
3229  0012 735c73746d38  	dc.b	"s\stm8s_stdperiph_"
3230  0024 647269766572  	dc.b	"driver\src\stm8s_a"
3231  0036 6463312e6300  	dc.b	"dc1.c",0
3251                     	end
