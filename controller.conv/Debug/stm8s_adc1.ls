   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  44                     ; 48 void ADC1_DeInit(void)
  44                     ; 49 {
  46                     	switch	.text
  47  0000               _ADC1_DeInit:
  51                     ; 50     ADC1->CSR  = ADC1_CSR_RESET_VALUE;
  53  0000 725f5400      	clr	21504
  54                     ; 51     ADC1->CR1  = ADC1_CR1_RESET_VALUE;
  56  0004 725f5401      	clr	21505
  57                     ; 52     ADC1->CR2  = ADC1_CR2_RESET_VALUE;
  59  0008 725f5402      	clr	21506
  60                     ; 53     ADC1->CR3  = ADC1_CR3_RESET_VALUE;
  62  000c 725f5403      	clr	21507
  63                     ; 54     ADC1->TDRH = ADC1_TDRH_RESET_VALUE;
  65  0010 725f5406      	clr	21510
  66                     ; 55     ADC1->TDRL = ADC1_TDRL_RESET_VALUE;
  68  0014 725f5407      	clr	21511
  69                     ; 56     ADC1->HTRH = ADC1_HTRH_RESET_VALUE;
  71  0018 35ff5408      	mov	21512,#255
  72                     ; 57     ADC1->HTRL = ADC1_HTRL_RESET_VALUE;
  74  001c 35035409      	mov	21513,#3
  75                     ; 58     ADC1->LTRH = ADC1_LTRH_RESET_VALUE;
  77  0020 725f540a      	clr	21514
  78                     ; 59     ADC1->LTRL = ADC1_LTRL_RESET_VALUE;
  80  0024 725f540b      	clr	21515
  81                     ; 60     ADC1->AWCRH = ADC1_AWCRH_RESET_VALUE;
  83  0028 725f540e      	clr	21518
  84                     ; 61     ADC1->AWCRL = ADC1_AWCRL_RESET_VALUE;
  86  002c 725f540f      	clr	21519
  87                     ; 62 }
  90  0030 81            	ret
 541                     ; 85 void ADC1_Init(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_PresSel_TypeDef ADC1_PrescalerSelection, ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState ADC1_ExtTriggerState, ADC1_Align_TypeDef ADC1_Align, ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState ADC1_SchmittTriggerState)
 541                     ; 86 {
 542                     	switch	.text
 543  0031               _ADC1_Init:
 545  0031 89            	pushw	x
 546       00000000      OFST:	set	0
 549                     ; 89     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
 551                     ; 90     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
 553                     ; 91     assert_param(IS_ADC1_PRESSEL_OK(ADC1_PrescalerSelection));
 555                     ; 92     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
 557                     ; 93     assert_param(IS_FUNCTIONALSTATE_OK(((ADC1_ExtTriggerState))));
 559                     ; 94     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
 561                     ; 95     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
 563                     ; 96     assert_param(IS_FUNCTIONALSTATE_OK(ADC1_SchmittTriggerState));
 565                     ; 101     ADC1_ConversionConfig(ADC1_ConversionMode, ADC1_Channel, ADC1_Align);
 567  0032 7b08          	ld	a,(OFST+8,sp)
 568  0034 88            	push	a
 569  0035 9f            	ld	a,xl
 570  0036 97            	ld	xl,a
 571  0037 7b02          	ld	a,(OFST+2,sp)
 572  0039 95            	ld	xh,a
 573  003a cd013d        	call	_ADC1_ConversionConfig
 575  003d 84            	pop	a
 576                     ; 103     ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 578  003e 7b05          	ld	a,(OFST+5,sp)
 579  0040 ad5a          	call	_ADC1_PrescalerConfig
 581                     ; 108     ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 583  0042 7b07          	ld	a,(OFST+7,sp)
 584  0044 97            	ld	xl,a
 585  0045 7b06          	ld	a,(OFST+6,sp)
 586  0047 95            	ld	xh,a
 587  0048 cd016b        	call	_ADC1_ExternalTriggerConfig
 589                     ; 113     ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 591  004b 7b0a          	ld	a,(OFST+10,sp)
 592  004d 97            	ld	xl,a
 593  004e 7b09          	ld	a,(OFST+9,sp)
 594  0050 95            	ld	xh,a
 595  0051 ad5c          	call	_ADC1_SchmittTriggerConfig
 597                     ; 116     ADC1->CR1 |= ADC1_CR1_ADON;
 599  0053 72105401      	bset	21505,#0
 600                     ; 118 }
 603  0057 85            	popw	x
 604  0058 81            	ret
 639                     ; 126 void ADC1_Cmd(FunctionalState NewState)
 639                     ; 127 {
 640                     	switch	.text
 641  0059               _ADC1_Cmd:
 645                     ; 130     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 647                     ; 132     if (NewState != DISABLE)
 649  0059 4d            	tnz	a
 650  005a 2706          	jreq	L362
 651                     ; 134         ADC1->CR1 |= ADC1_CR1_ADON;
 653  005c 72105401      	bset	21505,#0
 655  0060 2004          	jra	L562
 656  0062               L362:
 657                     ; 138         ADC1->CR1 &= (uint8_t)(~ADC1_CR1_ADON);
 659  0062 72115401      	bres	21505,#0
 660  0066               L562:
 661                     ; 141 }
 664  0066 81            	ret
 699                     ; 148 void ADC1_ScanModeCmd(FunctionalState NewState)
 699                     ; 149 {
 700                     	switch	.text
 701  0067               _ADC1_ScanModeCmd:
 705                     ; 152     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 707                     ; 154     if (NewState != DISABLE)
 709  0067 4d            	tnz	a
 710  0068 2706          	jreq	L503
 711                     ; 156         ADC1->CR2 |= ADC1_CR2_SCAN;
 713  006a 72125402      	bset	21506,#1
 715  006e 2004          	jra	L703
 716  0070               L503:
 717                     ; 160         ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 719  0070 72135402      	bres	21506,#1
 720  0074               L703:
 721                     ; 163 }
 724  0074 81            	ret
 759                     ; 170 void ADC1_DataBufferCmd(FunctionalState NewState)
 759                     ; 171 {
 760                     	switch	.text
 761  0075               _ADC1_DataBufferCmd:
 765                     ; 174     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 767                     ; 176     if (NewState != DISABLE)
 769  0075 4d            	tnz	a
 770  0076 2706          	jreq	L723
 771                     ; 178         ADC1->CR3 |= ADC1_CR3_DBUF;
 773  0078 721e5403      	bset	21507,#7
 775  007c 2004          	jra	L133
 776  007e               L723:
 777                     ; 182         ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 779  007e 721f5403      	bres	21507,#7
 780  0082               L133:
 781                     ; 185 }
 784  0082 81            	ret
 940                     ; 196 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
 940                     ; 197 {
 941                     	switch	.text
 942  0083               _ADC1_ITConfig:
 944  0083 89            	pushw	x
 945       00000000      OFST:	set	0
 948                     ; 200     assert_param(IS_ADC1_IT_OK(ADC1_IT));
 950                     ; 201     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 952                     ; 203     if (NewState != DISABLE)
 954  0084 0d05          	tnz	(OFST+5,sp)
 955  0086 2709          	jreq	L714
 956                     ; 206         ADC1->CSR |= (uint8_t)ADC1_IT;
 958  0088 9f            	ld	a,xl
 959  0089 ca5400        	or	a,21504
 960  008c c75400        	ld	21504,a
 962  008f 2009          	jra	L124
 963  0091               L714:
 964                     ; 211         ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
 966  0091 7b02          	ld	a,(OFST+2,sp)
 967  0093 43            	cpl	a
 968  0094 c45400        	and	a,21504
 969  0097 c75400        	ld	21504,a
 970  009a               L124:
 971                     ; 214 }
 974  009a 85            	popw	x
 975  009b 81            	ret
1011                     ; 222 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1011                     ; 223 {
1012                     	switch	.text
1013  009c               _ADC1_PrescalerConfig:
1015  009c 88            	push	a
1016       00000000      OFST:	set	0
1019                     ; 226     assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1021                     ; 229     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1023  009d c65401        	ld	a,21505
1024  00a0 a48f          	and	a,#143
1025  00a2 c75401        	ld	21505,a
1026                     ; 231     ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1028  00a5 c65401        	ld	a,21505
1029  00a8 1a01          	or	a,(OFST+1,sp)
1030  00aa c75401        	ld	21505,a
1031                     ; 233 }
1034  00ad 84            	pop	a
1035  00ae 81            	ret
1082                     ; 244 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1082                     ; 245 {
1083                     	switch	.text
1084  00af               _ADC1_SchmittTriggerConfig:
1086  00af 89            	pushw	x
1087       00000000      OFST:	set	0
1090                     ; 248     assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1092                     ; 249     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1094                     ; 251     if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1096  00b0 9e            	ld	a,xh
1097  00b1 a1ff          	cp	a,#255
1098  00b3 2620          	jrne	L364
1099                     ; 253         if (NewState != DISABLE)
1101  00b5 9f            	ld	a,xl
1102  00b6 4d            	tnz	a
1103  00b7 270a          	jreq	L564
1104                     ; 255             ADC1->TDRL &= (uint8_t)0x0;
1106  00b9 725f5407      	clr	21511
1107                     ; 256             ADC1->TDRH &= (uint8_t)0x0;
1109  00bd 725f5406      	clr	21510
1111  00c1 2078          	jra	L174
1112  00c3               L564:
1113                     ; 260             ADC1->TDRL |= (uint8_t)0xFF;
1115  00c3 c65407        	ld	a,21511
1116  00c6 aaff          	or	a,#255
1117  00c8 c75407        	ld	21511,a
1118                     ; 261             ADC1->TDRH |= (uint8_t)0xFF;
1120  00cb c65406        	ld	a,21510
1121  00ce aaff          	or	a,#255
1122  00d0 c75406        	ld	21510,a
1123  00d3 2066          	jra	L174
1124  00d5               L364:
1125                     ; 264     else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1127  00d5 7b01          	ld	a,(OFST+1,sp)
1128  00d7 a108          	cp	a,#8
1129  00d9 242f          	jruge	L374
1130                     ; 266         if (NewState != DISABLE)
1132  00db 0d02          	tnz	(OFST+2,sp)
1133  00dd 2716          	jreq	L574
1134                     ; 268             ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1136  00df 7b01          	ld	a,(OFST+1,sp)
1137  00e1 5f            	clrw	x
1138  00e2 97            	ld	xl,a
1139  00e3 a601          	ld	a,#1
1140  00e5 5d            	tnzw	x
1141  00e6 2704          	jreq	L42
1142  00e8               L62:
1143  00e8 48            	sll	a
1144  00e9 5a            	decw	x
1145  00ea 26fc          	jrne	L62
1146  00ec               L42:
1147  00ec 43            	cpl	a
1148  00ed c45407        	and	a,21511
1149  00f0 c75407        	ld	21511,a
1151  00f3 2046          	jra	L174
1152  00f5               L574:
1153                     ; 272             ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1155  00f5 7b01          	ld	a,(OFST+1,sp)
1156  00f7 5f            	clrw	x
1157  00f8 97            	ld	xl,a
1158  00f9 a601          	ld	a,#1
1159  00fb 5d            	tnzw	x
1160  00fc 2704          	jreq	L03
1161  00fe               L23:
1162  00fe 48            	sll	a
1163  00ff 5a            	decw	x
1164  0100 26fc          	jrne	L23
1165  0102               L03:
1166  0102 ca5407        	or	a,21511
1167  0105 c75407        	ld	21511,a
1168  0108 2031          	jra	L174
1169  010a               L374:
1170                     ; 277         if (NewState != DISABLE)
1172  010a 0d02          	tnz	(OFST+2,sp)
1173  010c 2718          	jreq	L305
1174                     ; 279             ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1176  010e 7b01          	ld	a,(OFST+1,sp)
1177  0110 a008          	sub	a,#8
1178  0112 5f            	clrw	x
1179  0113 97            	ld	xl,a
1180  0114 a601          	ld	a,#1
1181  0116 5d            	tnzw	x
1182  0117 2704          	jreq	L43
1183  0119               L63:
1184  0119 48            	sll	a
1185  011a 5a            	decw	x
1186  011b 26fc          	jrne	L63
1187  011d               L43:
1188  011d 43            	cpl	a
1189  011e c45406        	and	a,21510
1190  0121 c75406        	ld	21510,a
1192  0124 2015          	jra	L174
1193  0126               L305:
1194                     ; 283             ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1196  0126 7b01          	ld	a,(OFST+1,sp)
1197  0128 a008          	sub	a,#8
1198  012a 5f            	clrw	x
1199  012b 97            	ld	xl,a
1200  012c a601          	ld	a,#1
1201  012e 5d            	tnzw	x
1202  012f 2704          	jreq	L04
1203  0131               L24:
1204  0131 48            	sll	a
1205  0132 5a            	decw	x
1206  0133 26fc          	jrne	L24
1207  0135               L04:
1208  0135 ca5406        	or	a,21510
1209  0138 c75406        	ld	21510,a
1210  013b               L174:
1211                     ; 287 }
1214  013b 85            	popw	x
1215  013c 81            	ret
1272                     ; 300 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1272                     ; 301 {
1273                     	switch	.text
1274  013d               _ADC1_ConversionConfig:
1276  013d 89            	pushw	x
1277       00000000      OFST:	set	0
1280                     ; 304     assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1282                     ; 305     assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1284                     ; 306     assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1286                     ; 309     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1288  013e 72175402      	bres	21506,#3
1289                     ; 311     ADC1->CR2 |= (uint8_t)(ADC1_Align);
1291  0142 c65402        	ld	a,21506
1292  0145 1a05          	or	a,(OFST+5,sp)
1293  0147 c75402        	ld	21506,a
1294                     ; 313     if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1296  014a 9e            	ld	a,xh
1297  014b a101          	cp	a,#1
1298  014d 2606          	jrne	L535
1299                     ; 316         ADC1->CR1 |= ADC1_CR1_CONT;
1301  014f 72125401      	bset	21505,#1
1303  0153 2004          	jra	L735
1304  0155               L535:
1305                     ; 321         ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1307  0155 72135401      	bres	21505,#1
1308  0159               L735:
1309                     ; 325     ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1311  0159 c65400        	ld	a,21504
1312  015c a4f0          	and	a,#240
1313  015e c75400        	ld	21504,a
1314                     ; 327     ADC1->CSR |= (uint8_t)(ADC1_Channel);
1316  0161 c65400        	ld	a,21504
1317  0164 1a02          	or	a,(OFST+2,sp)
1318  0166 c75400        	ld	21504,a
1319                     ; 329 }
1322  0169 85            	popw	x
1323  016a 81            	ret
1369                     ; 342 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1369                     ; 343 {
1370                     	switch	.text
1371  016b               _ADC1_ExternalTriggerConfig:
1373  016b 89            	pushw	x
1374       00000000      OFST:	set	0
1377                     ; 346     assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1379                     ; 347     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1381                     ; 350     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1383  016c c65402        	ld	a,21506
1384  016f a4cf          	and	a,#207
1385  0171 c75402        	ld	21506,a
1386                     ; 352     if (NewState != DISABLE)
1388  0174 9f            	ld	a,xl
1389  0175 4d            	tnz	a
1390  0176 2706          	jreq	L365
1391                     ; 355         ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1393  0178 721c5402      	bset	21506,#6
1395  017c 2004          	jra	L565
1396  017e               L365:
1397                     ; 360         ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1399  017e 721d5402      	bres	21506,#6
1400  0182               L565:
1401                     ; 364     ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1403  0182 c65402        	ld	a,21506
1404  0185 1a01          	or	a,(OFST+1,sp)
1405  0187 c75402        	ld	21506,a
1406                     ; 366 }
1409  018a 85            	popw	x
1410  018b 81            	ret
1434                     ; 378 void ADC1_StartConversion(void)
1434                     ; 379 {
1435                     	switch	.text
1436  018c               _ADC1_StartConversion:
1440                     ; 380     ADC1->CR1 |= ADC1_CR1_ADON;
1442  018c 72105401      	bset	21505,#0
1443                     ; 381 }
1446  0190 81            	ret
1490                     ; 390 uint16_t ADC1_GetConversionValue(void)
1490                     ; 391 {
1491                     	switch	.text
1492  0191               _ADC1_GetConversionValue:
1494  0191 5205          	subw	sp,#5
1495       00000005      OFST:	set	5
1498                     ; 393     uint16_t temph = 0;
1500                     ; 394     uint8_t templ = 0;
1502                     ; 396     if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1504  0193 c65402        	ld	a,21506
1505  0196 a508          	bcp	a,#8
1506  0198 2715          	jreq	L126
1507                     ; 399         templ = ADC1->DRL;
1509  019a c65405        	ld	a,21509
1510  019d 6b03          	ld	(OFST-2,sp),a
1512                     ; 401         temph = ADC1->DRH;
1514  019f c65404        	ld	a,21508
1515  01a2 5f            	clrw	x
1516  01a3 97            	ld	xl,a
1517  01a4 1f04          	ldw	(OFST-1,sp),x
1519                     ; 403         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1521  01a6 1e04          	ldw	x,(OFST-1,sp)
1522  01a8 7b03          	ld	a,(OFST-2,sp)
1523  01aa 02            	rlwa	x,a
1524  01ab 1f04          	ldw	(OFST-1,sp),x
1527  01ad 2021          	jra	L326
1528  01af               L126:
1529                     ; 408         temph = ADC1->DRH;
1531  01af c65404        	ld	a,21508
1532  01b2 5f            	clrw	x
1533  01b3 97            	ld	xl,a
1534  01b4 1f04          	ldw	(OFST-1,sp),x
1536                     ; 410         templ = ADC1->DRL;
1538  01b6 c65405        	ld	a,21509
1539  01b9 6b03          	ld	(OFST-2,sp),a
1541                     ; 412         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1543  01bb 1e04          	ldw	x,(OFST-1,sp)
1544  01bd 4f            	clr	a
1545  01be 02            	rlwa	x,a
1546  01bf 1f01          	ldw	(OFST-4,sp),x
1548  01c1 7b03          	ld	a,(OFST-2,sp)
1549  01c3 97            	ld	xl,a
1550  01c4 a640          	ld	a,#64
1551  01c6 42            	mul	x,a
1552  01c7 01            	rrwa	x,a
1553  01c8 1a02          	or	a,(OFST-3,sp)
1554  01ca 01            	rrwa	x,a
1555  01cb 1a01          	or	a,(OFST-4,sp)
1556  01cd 01            	rrwa	x,a
1557  01ce 1f04          	ldw	(OFST-1,sp),x
1559  01d0               L326:
1560                     ; 415     return ((uint16_t)temph);
1562  01d0 1e04          	ldw	x,(OFST-1,sp)
1565  01d2 5b05          	addw	sp,#5
1566  01d4 81            	ret
1612                     ; 427 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1612                     ; 428 {
1613                     	switch	.text
1614  01d5               _ADC1_AWDChannelConfig:
1616  01d5 89            	pushw	x
1617       00000000      OFST:	set	0
1620                     ; 430     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1622                     ; 431     assert_param(IS_ADC1_CHANNEL_OK(Channel));
1624                     ; 433     if (Channel < (uint8_t)8)
1626  01d6 9e            	ld	a,xh
1627  01d7 a108          	cp	a,#8
1628  01d9 242e          	jruge	L746
1629                     ; 435         if (NewState != DISABLE)
1631  01db 9f            	ld	a,xl
1632  01dc 4d            	tnz	a
1633  01dd 2714          	jreq	L156
1634                     ; 437             ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1636  01df 9e            	ld	a,xh
1637  01e0 5f            	clrw	x
1638  01e1 97            	ld	xl,a
1639  01e2 a601          	ld	a,#1
1640  01e4 5d            	tnzw	x
1641  01e5 2704          	jreq	L65
1642  01e7               L06:
1643  01e7 48            	sll	a
1644  01e8 5a            	decw	x
1645  01e9 26fc          	jrne	L06
1646  01eb               L65:
1647  01eb ca540f        	or	a,21519
1648  01ee c7540f        	ld	21519,a
1650  01f1 2047          	jra	L556
1651  01f3               L156:
1652                     ; 441             ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
1654  01f3 7b01          	ld	a,(OFST+1,sp)
1655  01f5 5f            	clrw	x
1656  01f6 97            	ld	xl,a
1657  01f7 a601          	ld	a,#1
1658  01f9 5d            	tnzw	x
1659  01fa 2704          	jreq	L26
1660  01fc               L46:
1661  01fc 48            	sll	a
1662  01fd 5a            	decw	x
1663  01fe 26fc          	jrne	L46
1664  0200               L26:
1665  0200 43            	cpl	a
1666  0201 c4540f        	and	a,21519
1667  0204 c7540f        	ld	21519,a
1668  0207 2031          	jra	L556
1669  0209               L746:
1670                     ; 446         if (NewState != DISABLE)
1672  0209 0d02          	tnz	(OFST+2,sp)
1673  020b 2717          	jreq	L756
1674                     ; 448             ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
1676  020d 7b01          	ld	a,(OFST+1,sp)
1677  020f a008          	sub	a,#8
1678  0211 5f            	clrw	x
1679  0212 97            	ld	xl,a
1680  0213 a601          	ld	a,#1
1681  0215 5d            	tnzw	x
1682  0216 2704          	jreq	L66
1683  0218               L07:
1684  0218 48            	sll	a
1685  0219 5a            	decw	x
1686  021a 26fc          	jrne	L07
1687  021c               L66:
1688  021c ca540e        	or	a,21518
1689  021f c7540e        	ld	21518,a
1691  0222 2016          	jra	L556
1692  0224               L756:
1693                     ; 452             ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
1695  0224 7b01          	ld	a,(OFST+1,sp)
1696  0226 a008          	sub	a,#8
1697  0228 5f            	clrw	x
1698  0229 97            	ld	xl,a
1699  022a a601          	ld	a,#1
1700  022c 5d            	tnzw	x
1701  022d 2704          	jreq	L27
1702  022f               L47:
1703  022f 48            	sll	a
1704  0230 5a            	decw	x
1705  0231 26fc          	jrne	L47
1706  0233               L27:
1707  0233 43            	cpl	a
1708  0234 c4540e        	and	a,21518
1709  0237 c7540e        	ld	21518,a
1710  023a               L556:
1711                     ; 455 }
1714  023a 85            	popw	x
1715  023b 81            	ret
1750                     ; 463 void ADC1_SetHighThreshold(uint16_t Threshold)
1750                     ; 464 {
1751                     	switch	.text
1752  023c               _ADC1_SetHighThreshold:
1754  023c 89            	pushw	x
1755       00000000      OFST:	set	0
1758                     ; 465     ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
1760  023d 54            	srlw	x
1761  023e 54            	srlw	x
1762  023f 9f            	ld	a,xl
1763  0240 c75408        	ld	21512,a
1764                     ; 466     ADC1->HTRL = (uint8_t)Threshold;
1766  0243 7b02          	ld	a,(OFST+2,sp)
1767  0245 c75409        	ld	21513,a
1768                     ; 467 }
1771  0248 85            	popw	x
1772  0249 81            	ret
1807                     ; 475 void ADC1_SetLowThreshold(uint16_t Threshold)
1807                     ; 476 {
1808                     	switch	.text
1809  024a               _ADC1_SetLowThreshold:
1813                     ; 477     ADC1->LTRL = (uint8_t)Threshold;
1815  024a 9f            	ld	a,xl
1816  024b c7540b        	ld	21515,a
1817                     ; 478     ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
1819  024e 54            	srlw	x
1820  024f 54            	srlw	x
1821  0250 9f            	ld	a,xl
1822  0251 c7540a        	ld	21514,a
1823                     ; 479 }
1826  0254 81            	ret
1879                     ; 488 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
1879                     ; 489 {
1880                     	switch	.text
1881  0255               _ADC1_GetBufferValue:
1883  0255 88            	push	a
1884  0256 5205          	subw	sp,#5
1885       00000005      OFST:	set	5
1888                     ; 491     uint16_t temph = 0;
1890                     ; 492     uint8_t templ = 0;
1892                     ; 495     assert_param(IS_ADC1_BUFFER_OK(Buffer));
1894                     ; 497     if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1896  0258 c65402        	ld	a,21506
1897  025b a508          	bcp	a,#8
1898  025d 271f          	jreq	L547
1899                     ; 500         templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1901  025f 7b06          	ld	a,(OFST+1,sp)
1902  0261 48            	sll	a
1903  0262 5f            	clrw	x
1904  0263 97            	ld	xl,a
1905  0264 d653e1        	ld	a,(21473,x)
1906  0267 6b03          	ld	(OFST-2,sp),a
1908                     ; 502         temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1910  0269 7b06          	ld	a,(OFST+1,sp)
1911  026b 48            	sll	a
1912  026c 5f            	clrw	x
1913  026d 97            	ld	xl,a
1914  026e d653e0        	ld	a,(21472,x)
1915  0271 5f            	clrw	x
1916  0272 97            	ld	xl,a
1917  0273 1f04          	ldw	(OFST-1,sp),x
1919                     ; 504         temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1921  0275 1e04          	ldw	x,(OFST-1,sp)
1922  0277 7b03          	ld	a,(OFST-2,sp)
1923  0279 02            	rlwa	x,a
1924  027a 1f04          	ldw	(OFST-1,sp),x
1927  027c 202b          	jra	L747
1928  027e               L547:
1929                     ; 509         temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
1931  027e 7b06          	ld	a,(OFST+1,sp)
1932  0280 48            	sll	a
1933  0281 5f            	clrw	x
1934  0282 97            	ld	xl,a
1935  0283 d653e0        	ld	a,(21472,x)
1936  0286 5f            	clrw	x
1937  0287 97            	ld	xl,a
1938  0288 1f04          	ldw	(OFST-1,sp),x
1940                     ; 511         templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
1942  028a 7b06          	ld	a,(OFST+1,sp)
1943  028c 48            	sll	a
1944  028d 5f            	clrw	x
1945  028e 97            	ld	xl,a
1946  028f d653e1        	ld	a,(21473,x)
1947  0292 6b03          	ld	(OFST-2,sp),a
1949                     ; 513         temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
1951  0294 1e04          	ldw	x,(OFST-1,sp)
1952  0296 4f            	clr	a
1953  0297 02            	rlwa	x,a
1954  0298 1f01          	ldw	(OFST-4,sp),x
1956  029a 7b03          	ld	a,(OFST-2,sp)
1957  029c 97            	ld	xl,a
1958  029d a640          	ld	a,#64
1959  029f 42            	mul	x,a
1960  02a0 01            	rrwa	x,a
1961  02a1 1a02          	or	a,(OFST-3,sp)
1962  02a3 01            	rrwa	x,a
1963  02a4 1a01          	or	a,(OFST-4,sp)
1964  02a6 01            	rrwa	x,a
1965  02a7 1f04          	ldw	(OFST-1,sp),x
1967  02a9               L747:
1968                     ; 516     return ((uint16_t)temph);
1970  02a9 1e04          	ldw	x,(OFST-1,sp)
1973  02ab 5b06          	addw	sp,#6
1974  02ad 81            	ret
2040                     ; 526 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2040                     ; 527 {
2041                     	switch	.text
2042  02ae               _ADC1_GetAWDChannelStatus:
2044  02ae 88            	push	a
2045  02af 88            	push	a
2046       00000001      OFST:	set	1
2049                     ; 528     uint8_t status = 0;
2051                     ; 531     assert_param(IS_ADC1_CHANNEL_OK(Channel));
2053                     ; 533     if (Channel < (uint8_t)8)
2055  02b0 a108          	cp	a,#8
2056  02b2 2412          	jruge	L3001
2057                     ; 535         status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2059  02b4 5f            	clrw	x
2060  02b5 97            	ld	xl,a
2061  02b6 a601          	ld	a,#1
2062  02b8 5d            	tnzw	x
2063  02b9 2704          	jreq	L601
2064  02bb               L011:
2065  02bb 48            	sll	a
2066  02bc 5a            	decw	x
2067  02bd 26fc          	jrne	L011
2068  02bf               L601:
2069  02bf c4540d        	and	a,21517
2070  02c2 6b01          	ld	(OFST+0,sp),a
2073  02c4 2014          	jra	L5001
2074  02c6               L3001:
2075                     ; 539         status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2077  02c6 7b02          	ld	a,(OFST+1,sp)
2078  02c8 a008          	sub	a,#8
2079  02ca 5f            	clrw	x
2080  02cb 97            	ld	xl,a
2081  02cc a601          	ld	a,#1
2082  02ce 5d            	tnzw	x
2083  02cf 2704          	jreq	L211
2084  02d1               L411:
2085  02d1 48            	sll	a
2086  02d2 5a            	decw	x
2087  02d3 26fc          	jrne	L411
2088  02d5               L211:
2089  02d5 c4540c        	and	a,21516
2090  02d8 6b01          	ld	(OFST+0,sp),a
2092  02da               L5001:
2093                     ; 542     return ((FlagStatus)status);
2095  02da 7b01          	ld	a,(OFST+0,sp)
2098  02dc 85            	popw	x
2099  02dd 81            	ret
2257                     ; 551 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2257                     ; 552 {
2258                     	switch	.text
2259  02de               _ADC1_GetFlagStatus:
2261  02de 88            	push	a
2262  02df 88            	push	a
2263       00000001      OFST:	set	1
2266                     ; 553     uint8_t flagstatus = 0;
2268                     ; 554     uint8_t temp = 0;
2270                     ; 557     assert_param(IS_ADC1_FLAG_OK(Flag));
2272                     ; 559     if ((Flag & 0x0F) == 0x01)
2274  02e0 a40f          	and	a,#15
2275  02e2 a101          	cp	a,#1
2276  02e4 2609          	jrne	L5701
2277                     ; 562         flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2279  02e6 c65403        	ld	a,21507
2280  02e9 a440          	and	a,#64
2281  02eb 6b01          	ld	(OFST+0,sp),a
2284  02ed 2045          	jra	L7701
2285  02ef               L5701:
2286                     ; 564     else if ((Flag & 0xF0) == 0x10)
2288  02ef 7b02          	ld	a,(OFST+1,sp)
2289  02f1 a4f0          	and	a,#240
2290  02f3 a110          	cp	a,#16
2291  02f5 2636          	jrne	L1011
2292                     ; 567         temp = (uint8_t)(Flag & (uint8_t)0x0F);
2294  02f7 7b02          	ld	a,(OFST+1,sp)
2295  02f9 a40f          	and	a,#15
2296  02fb 6b01          	ld	(OFST+0,sp),a
2298                     ; 568         if (temp < 8)
2300  02fd 7b01          	ld	a,(OFST+0,sp)
2301  02ff a108          	cp	a,#8
2302  0301 2414          	jruge	L3011
2303                     ; 570             flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2305  0303 7b01          	ld	a,(OFST+0,sp)
2306  0305 5f            	clrw	x
2307  0306 97            	ld	xl,a
2308  0307 a601          	ld	a,#1
2309  0309 5d            	tnzw	x
2310  030a 2704          	jreq	L021
2311  030c               L221:
2312  030c 48            	sll	a
2313  030d 5a            	decw	x
2314  030e 26fc          	jrne	L221
2315  0310               L021:
2316  0310 c4540d        	and	a,21517
2317  0313 6b01          	ld	(OFST+0,sp),a
2320  0315 201d          	jra	L7701
2321  0317               L3011:
2322                     ; 574             flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2324  0317 7b01          	ld	a,(OFST+0,sp)
2325  0319 a008          	sub	a,#8
2326  031b 5f            	clrw	x
2327  031c 97            	ld	xl,a
2328  031d a601          	ld	a,#1
2329  031f 5d            	tnzw	x
2330  0320 2704          	jreq	L421
2331  0322               L621:
2332  0322 48            	sll	a
2333  0323 5a            	decw	x
2334  0324 26fc          	jrne	L621
2335  0326               L421:
2336  0326 c4540c        	and	a,21516
2337  0329 6b01          	ld	(OFST+0,sp),a
2339  032b 2007          	jra	L7701
2340  032d               L1011:
2341                     ; 579         flagstatus = (uint8_t)(ADC1->CSR & Flag);
2343  032d c65400        	ld	a,21504
2344  0330 1402          	and	a,(OFST+1,sp)
2345  0332 6b01          	ld	(OFST+0,sp),a
2347  0334               L7701:
2348                     ; 581     return ((FlagStatus)flagstatus);
2350  0334 7b01          	ld	a,(OFST+0,sp)
2353  0336 85            	popw	x
2354  0337 81            	ret
2398                     ; 591 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2398                     ; 592 {
2399                     	switch	.text
2400  0338               _ADC1_ClearFlag:
2402  0338 88            	push	a
2403  0339 88            	push	a
2404       00000001      OFST:	set	1
2407                     ; 593     uint8_t temp = 0;
2409                     ; 596     assert_param(IS_ADC1_FLAG_OK(Flag));
2411                     ; 598     if ((Flag & 0x0F) == 0x01)
2413  033a a40f          	and	a,#15
2414  033c a101          	cp	a,#1
2415  033e 2606          	jrne	L3311
2416                     ; 601         ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2418  0340 721d5403      	bres	21507,#6
2420  0344 204b          	jra	L5311
2421  0346               L3311:
2422                     ; 603     else if ((Flag & 0xF0) == 0x10)
2424  0346 7b02          	ld	a,(OFST+1,sp)
2425  0348 a4f0          	and	a,#240
2426  034a a110          	cp	a,#16
2427  034c 263a          	jrne	L7311
2428                     ; 606         temp = (uint8_t)(Flag & (uint8_t)0x0F);
2430  034e 7b02          	ld	a,(OFST+1,sp)
2431  0350 a40f          	and	a,#15
2432  0352 6b01          	ld	(OFST+0,sp),a
2434                     ; 607         if (temp < 8)
2436  0354 7b01          	ld	a,(OFST+0,sp)
2437  0356 a108          	cp	a,#8
2438  0358 2416          	jruge	L1411
2439                     ; 609             ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2441  035a 7b01          	ld	a,(OFST+0,sp)
2442  035c 5f            	clrw	x
2443  035d 97            	ld	xl,a
2444  035e a601          	ld	a,#1
2445  0360 5d            	tnzw	x
2446  0361 2704          	jreq	L231
2447  0363               L431:
2448  0363 48            	sll	a
2449  0364 5a            	decw	x
2450  0365 26fc          	jrne	L431
2451  0367               L231:
2452  0367 43            	cpl	a
2453  0368 c4540d        	and	a,21517
2454  036b c7540d        	ld	21517,a
2456  036e 2021          	jra	L5311
2457  0370               L1411:
2458                     ; 613             ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2460  0370 7b01          	ld	a,(OFST+0,sp)
2461  0372 a008          	sub	a,#8
2462  0374 5f            	clrw	x
2463  0375 97            	ld	xl,a
2464  0376 a601          	ld	a,#1
2465  0378 5d            	tnzw	x
2466  0379 2704          	jreq	L631
2467  037b               L041:
2468  037b 48            	sll	a
2469  037c 5a            	decw	x
2470  037d 26fc          	jrne	L041
2471  037f               L631:
2472  037f 43            	cpl	a
2473  0380 c4540c        	and	a,21516
2474  0383 c7540c        	ld	21516,a
2475  0386 2009          	jra	L5311
2476  0388               L7311:
2477                     ; 618         ADC1->CSR &= (uint8_t) (~Flag);
2479  0388 7b02          	ld	a,(OFST+1,sp)
2480  038a 43            	cpl	a
2481  038b c45400        	and	a,21504
2482  038e c75400        	ld	21504,a
2483  0391               L5311:
2484                     ; 620 }
2487  0391 85            	popw	x
2488  0392 81            	ret
2543                     ; 640 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2543                     ; 641 {
2544                     	switch	.text
2545  0393               _ADC1_GetITStatus:
2547  0393 89            	pushw	x
2548  0394 88            	push	a
2549       00000001      OFST:	set	1
2552                     ; 642     ITStatus itstatus = RESET;
2554                     ; 643     uint8_t temp = 0;
2556                     ; 646     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2558                     ; 648     if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2560  0395 01            	rrwa	x,a
2561  0396 a4f0          	and	a,#240
2562  0398 5f            	clrw	x
2563  0399 02            	rlwa	x,a
2564  039a a30010        	cpw	x,#16
2565  039d 2636          	jrne	L5711
2566                     ; 651         temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2568  039f 7b03          	ld	a,(OFST+2,sp)
2569  03a1 a40f          	and	a,#15
2570  03a3 6b01          	ld	(OFST+0,sp),a
2572                     ; 652         if (temp < 8)
2574  03a5 7b01          	ld	a,(OFST+0,sp)
2575  03a7 a108          	cp	a,#8
2576  03a9 2414          	jruge	L7711
2577                     ; 654             itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2579  03ab 7b01          	ld	a,(OFST+0,sp)
2580  03ad 5f            	clrw	x
2581  03ae 97            	ld	xl,a
2582  03af a601          	ld	a,#1
2583  03b1 5d            	tnzw	x
2584  03b2 2704          	jreq	L441
2585  03b4               L641:
2586  03b4 48            	sll	a
2587  03b5 5a            	decw	x
2588  03b6 26fc          	jrne	L641
2589  03b8               L441:
2590  03b8 c4540d        	and	a,21517
2591  03bb 6b01          	ld	(OFST+0,sp),a
2594  03bd 201d          	jra	L3021
2595  03bf               L7711:
2596                     ; 658             itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2598  03bf 7b01          	ld	a,(OFST+0,sp)
2599  03c1 a008          	sub	a,#8
2600  03c3 5f            	clrw	x
2601  03c4 97            	ld	xl,a
2602  03c5 a601          	ld	a,#1
2603  03c7 5d            	tnzw	x
2604  03c8 2704          	jreq	L051
2605  03ca               L251:
2606  03ca 48            	sll	a
2607  03cb 5a            	decw	x
2608  03cc 26fc          	jrne	L251
2609  03ce               L051:
2610  03ce c4540c        	and	a,21516
2611  03d1 6b01          	ld	(OFST+0,sp),a
2613  03d3 2007          	jra	L3021
2614  03d5               L5711:
2615                     ; 663         itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
2617  03d5 c65400        	ld	a,21504
2618  03d8 1403          	and	a,(OFST+2,sp)
2619  03da 6b01          	ld	(OFST+0,sp),a
2621  03dc               L3021:
2622                     ; 665     return ((ITStatus)itstatus);
2624  03dc 7b01          	ld	a,(OFST+0,sp)
2627  03de 5b03          	addw	sp,#3
2628  03e0 81            	ret
2673                     ; 687 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
2673                     ; 688 {
2674                     	switch	.text
2675  03e1               _ADC1_ClearITPendingBit:
2677  03e1 89            	pushw	x
2678  03e2 88            	push	a
2679       00000001      OFST:	set	1
2682                     ; 689     uint8_t temp = 0;
2684                     ; 692     assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
2686                     ; 694     if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
2688  03e3 01            	rrwa	x,a
2689  03e4 a4f0          	and	a,#240
2690  03e6 5f            	clrw	x
2691  03e7 02            	rlwa	x,a
2692  03e8 a30010        	cpw	x,#16
2693  03eb 263a          	jrne	L7221
2694                     ; 697         temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
2696  03ed 7b03          	ld	a,(OFST+2,sp)
2697  03ef a40f          	and	a,#15
2698  03f1 6b01          	ld	(OFST+0,sp),a
2700                     ; 698         if (temp < 8)
2702  03f3 7b01          	ld	a,(OFST+0,sp)
2703  03f5 a108          	cp	a,#8
2704  03f7 2416          	jruge	L1321
2705                     ; 700             ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2707  03f9 7b01          	ld	a,(OFST+0,sp)
2708  03fb 5f            	clrw	x
2709  03fc 97            	ld	xl,a
2710  03fd a601          	ld	a,#1
2711  03ff 5d            	tnzw	x
2712  0400 2704          	jreq	L651
2713  0402               L061:
2714  0402 48            	sll	a
2715  0403 5a            	decw	x
2716  0404 26fc          	jrne	L061
2717  0406               L651:
2718  0406 43            	cpl	a
2719  0407 c4540d        	and	a,21517
2720  040a c7540d        	ld	21517,a
2722  040d 2021          	jra	L5321
2723  040f               L1321:
2724                     ; 704             ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2726  040f 7b01          	ld	a,(OFST+0,sp)
2727  0411 a008          	sub	a,#8
2728  0413 5f            	clrw	x
2729  0414 97            	ld	xl,a
2730  0415 a601          	ld	a,#1
2731  0417 5d            	tnzw	x
2732  0418 2704          	jreq	L261
2733  041a               L461:
2734  041a 48            	sll	a
2735  041b 5a            	decw	x
2736  041c 26fc          	jrne	L461
2737  041e               L261:
2738  041e 43            	cpl	a
2739  041f c4540c        	and	a,21516
2740  0422 c7540c        	ld	21516,a
2741  0425 2009          	jra	L5321
2742  0427               L7221:
2743                     ; 709         ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
2745  0427 7b03          	ld	a,(OFST+2,sp)
2746  0429 43            	cpl	a
2747  042a c45400        	and	a,21504
2748  042d c75400        	ld	21504,a
2749  0430               L5321:
2750                     ; 711 }
2753  0430 5b03          	addw	sp,#3
2754  0432 81            	ret
2767                     	xdef	_ADC1_ClearITPendingBit
2768                     	xdef	_ADC1_GetITStatus
2769                     	xdef	_ADC1_ClearFlag
2770                     	xdef	_ADC1_GetFlagStatus
2771                     	xdef	_ADC1_GetAWDChannelStatus
2772                     	xdef	_ADC1_GetBufferValue
2773                     	xdef	_ADC1_SetLowThreshold
2774                     	xdef	_ADC1_SetHighThreshold
2775                     	xdef	_ADC1_GetConversionValue
2776                     	xdef	_ADC1_StartConversion
2777                     	xdef	_ADC1_AWDChannelConfig
2778                     	xdef	_ADC1_ExternalTriggerConfig
2779                     	xdef	_ADC1_ConversionConfig
2780                     	xdef	_ADC1_SchmittTriggerConfig
2781                     	xdef	_ADC1_PrescalerConfig
2782                     	xdef	_ADC1_ITConfig
2783                     	xdef	_ADC1_DataBufferCmd
2784                     	xdef	_ADC1_ScanModeCmd
2785                     	xdef	_ADC1_Cmd
2786                     	xdef	_ADC1_Init
2787                     	xdef	_ADC1_DeInit
2806                     	end
