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
 686  0109 cd02ee        	call	_ADC1_ConversionConfig
 688  010c 84            	pop	a
 689                     ; 105   ADC1_PrescalerConfig(ADC1_PrescalerSelection);
 691  010d 7b05          	ld	a,(OFST+5,sp)
 692  010f cd01e3        	call	_ADC1_PrescalerConfig
 694                     ; 110   ADC1_ExternalTriggerConfig(ADC1_ExtTrigger, ADC1_ExtTriggerState);
 696  0112 7b07          	ld	a,(OFST+7,sp)
 697  0114 97            	ld	xl,a
 698  0115 7b06          	ld	a,(OFST+6,sp)
 699  0117 95            	ld	xh,a
 700  0118 cd0373        	call	_ADC1_ExternalTriggerConfig
 702                     ; 115   ADC1_SchmittTriggerConfig(ADC1_SchmittTriggerChannel, ADC1_SchmittTriggerState);
 704  011b 7b0a          	ld	a,(OFST+10,sp)
 705  011d 97            	ld	xl,a
 706  011e 7b09          	ld	a,(OFST+9,sp)
 707  0120 95            	ld	xh,a
 708  0121 cd0223        	call	_ADC1_SchmittTriggerConfig
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
 839                     ; 146 void ADC1_ScanModeCmd(FunctionalState NewState)
 839                     ; 147 {
 840                     	switch	.text
 841  015b               _ADC1_ScanModeCmd:
 843  015b 88            	push	a
 844       00000000      OFST:	set	0
 847                     ; 149   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 849  015c 4d            	tnz	a
 850  015d 2711          	jreq	L041
 851  015f 4a            	dec	a
 852  0160 270e          	jreq	L041
 853  0162 ae0095        	ldw	x,#149
 854  0165 89            	pushw	x
 855  0166 5f            	clrw	x
 856  0167 89            	pushw	x
 857  0168 ae0000        	ldw	x,#L542
 858  016b cd0000        	call	_assert_failed
 860  016e 5b04          	addw	sp,#4
 861  0170               L041:
 862                     ; 151   if (NewState != DISABLE)
 864  0170 7b01          	ld	a,(OFST+1,sp)
 865  0172 2706          	jreq	L703
 866                     ; 153     ADC1->CR2 |= ADC1_CR2_SCAN;
 868  0174 72125402      	bset	21506,#1
 870  0178 2004          	jra	L113
 871  017a               L703:
 872                     ; 157     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_SCAN);
 874  017a 72135402      	bres	21506,#1
 875  017e               L113:
 876                     ; 159 }
 879  017e 84            	pop	a
 880  017f 81            	ret	
 916                     ; 166 void ADC1_DataBufferCmd(FunctionalState NewState)
 916                     ; 167 {
 917                     	switch	.text
 918  0180               _ADC1_DataBufferCmd:
 920  0180 88            	push	a
 921       00000000      OFST:	set	0
 924                     ; 169   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 926  0181 4d            	tnz	a
 927  0182 2711          	jreq	L251
 928  0184 4a            	dec	a
 929  0185 270e          	jreq	L251
 930  0187 ae00a9        	ldw	x,#169
 931  018a 89            	pushw	x
 932  018b 5f            	clrw	x
 933  018c 89            	pushw	x
 934  018d ae0000        	ldw	x,#L542
 935  0190 cd0000        	call	_assert_failed
 937  0193 5b04          	addw	sp,#4
 938  0195               L251:
 939                     ; 171   if (NewState != DISABLE)
 941  0195 7b01          	ld	a,(OFST+1,sp)
 942  0197 2706          	jreq	L133
 943                     ; 173     ADC1->CR3 |= ADC1_CR3_DBUF;
 945  0199 721e5403      	bset	21507,#7
 947  019d 2004          	jra	L333
 948  019f               L133:
 949                     ; 177     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_DBUF);
 951  019f 721f5403      	bres	21507,#7
 952  01a3               L333:
 953                     ; 179 }
 956  01a3 84            	pop	a
 957  01a4 81            	ret	
1114                     ; 190 void ADC1_ITConfig(ADC1_IT_TypeDef ADC1_IT, FunctionalState NewState)
1114                     ; 191 {
1115                     	switch	.text
1116  01a5               _ADC1_ITConfig:
1118  01a5 89            	pushw	x
1119       00000000      OFST:	set	0
1122                     ; 193   assert_param(IS_ADC1_IT_OK(ADC1_IT));
1124  01a6 a30020        	cpw	x,#32
1125  01a9 270a          	jreq	L461
1126  01ab a30010        	cpw	x,#16
1127  01ae 2705          	jreq	L461
1128  01b0 ae00c1        	ldw	x,#193
1129  01b3 ad22          	call	LC002
1130  01b5               L461:
1131                     ; 194   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1133  01b5 7b05          	ld	a,(OFST+5,sp)
1134  01b7 2708          	jreq	L471
1135  01b9 4a            	dec	a
1136  01ba 2705          	jreq	L471
1137  01bc ae00c2        	ldw	x,#194
1138  01bf ad16          	call	LC002
1139  01c1               L471:
1140                     ; 196   if (NewState != DISABLE)
1142  01c1 7b05          	ld	a,(OFST+5,sp)
1143  01c3 2707          	jreq	L124
1144                     ; 199     ADC1->CSR |= (uint8_t)ADC1_IT;
1146  01c5 c65400        	ld	a,21504
1147  01c8 1a02          	or	a,(OFST+2,sp)
1149  01ca 2006          	jra	L324
1150  01cc               L124:
1151                     ; 204     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ADC1_IT);
1153  01cc 7b02          	ld	a,(OFST+2,sp)
1154  01ce 43            	cpl	a
1155  01cf c45400        	and	a,21504
1156  01d2               L324:
1157  01d2 c75400        	ld	21504,a
1158                     ; 206 }
1161  01d5 85            	popw	x
1162  01d6 81            	ret	
1163  01d7               LC002:
1164  01d7 89            	pushw	x
1165  01d8 5f            	clrw	x
1166  01d9 89            	pushw	x
1167  01da ae0000        	ldw	x,#L542
1168  01dd cd0000        	call	_assert_failed
1170  01e0 5b04          	addw	sp,#4
1171  01e2 81            	ret	
1208                     ; 214 void ADC1_PrescalerConfig(ADC1_PresSel_TypeDef ADC1_Prescaler)
1208                     ; 215 {
1209                     	switch	.text
1210  01e3               _ADC1_PrescalerConfig:
1212  01e3 88            	push	a
1213       00000000      OFST:	set	0
1216                     ; 217   assert_param(IS_ADC1_PRESSEL_OK(ADC1_Prescaler));
1218  01e4 4d            	tnz	a
1219  01e5 272a          	jreq	L602
1220  01e7 a110          	cp	a,#16
1221  01e9 2726          	jreq	L602
1222  01eb a120          	cp	a,#32
1223  01ed 2722          	jreq	L602
1224  01ef a130          	cp	a,#48
1225  01f1 271e          	jreq	L602
1226  01f3 a140          	cp	a,#64
1227  01f5 271a          	jreq	L602
1228  01f7 a150          	cp	a,#80
1229  01f9 2716          	jreq	L602
1230  01fb a160          	cp	a,#96
1231  01fd 2712          	jreq	L602
1232  01ff a170          	cp	a,#112
1233  0201 270e          	jreq	L602
1234  0203 ae00d9        	ldw	x,#217
1235  0206 89            	pushw	x
1236  0207 5f            	clrw	x
1237  0208 89            	pushw	x
1238  0209 ae0000        	ldw	x,#L542
1239  020c cd0000        	call	_assert_failed
1241  020f 5b04          	addw	sp,#4
1242  0211               L602:
1243                     ; 220   ADC1->CR1 &= (uint8_t)(~ADC1_CR1_SPSEL);
1245  0211 c65401        	ld	a,21505
1246  0214 a48f          	and	a,#143
1247  0216 c75401        	ld	21505,a
1248                     ; 222   ADC1->CR1 |= (uint8_t)(ADC1_Prescaler);
1250  0219 c65401        	ld	a,21505
1251  021c 1a01          	or	a,(OFST+1,sp)
1252  021e c75401        	ld	21505,a
1253                     ; 223 }
1256  0221 84            	pop	a
1257  0222 81            	ret	
1305                     ; 233 void ADC1_SchmittTriggerConfig(ADC1_SchmittTrigg_TypeDef ADC1_SchmittTriggerChannel, FunctionalState NewState)
1305                     ; 234 {
1306                     	switch	.text
1307  0223               _ADC1_SchmittTriggerConfig:
1309  0223 89            	pushw	x
1310       00000000      OFST:	set	0
1313                     ; 236   assert_param(IS_ADC1_SCHMITTTRIG_OK(ADC1_SchmittTriggerChannel));
1315  0224 9e            	ld	a,xh
1316  0225 4d            	tnz	a
1317  0226 273b          	jreq	L022
1318  0228 9e            	ld	a,xh
1319  0229 4a            	dec	a
1320  022a 2737          	jreq	L022
1321  022c 9e            	ld	a,xh
1322  022d a102          	cp	a,#2
1323  022f 2732          	jreq	L022
1324  0231 9e            	ld	a,xh
1325  0232 a103          	cp	a,#3
1326  0234 272d          	jreq	L022
1327  0236 9e            	ld	a,xh
1328  0237 a104          	cp	a,#4
1329  0239 2728          	jreq	L022
1330  023b 9e            	ld	a,xh
1331  023c a105          	cp	a,#5
1332  023e 2723          	jreq	L022
1333  0240 9e            	ld	a,xh
1334  0241 a106          	cp	a,#6
1335  0243 271e          	jreq	L022
1336  0245 9e            	ld	a,xh
1337  0246 a107          	cp	a,#7
1338  0248 2719          	jreq	L022
1339  024a 9e            	ld	a,xh
1340  024b a108          	cp	a,#8
1341  024d 2714          	jreq	L022
1342  024f 9e            	ld	a,xh
1343  0250 a10c          	cp	a,#12
1344  0252 270f          	jreq	L022
1345  0254 9e            	ld	a,xh
1346  0255 4c            	inc	a
1347  0256 270b          	jreq	L022
1348  0258 9e            	ld	a,xh
1349  0259 a109          	cp	a,#9
1350  025b 2706          	jreq	L022
1351  025d ae00ec        	ldw	x,#236
1352  0260 cd02e2        	call	LC006
1353  0263               L022:
1354                     ; 237   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1356  0263 7b02          	ld	a,(OFST+2,sp)
1357  0265 2708          	jreq	L032
1358  0267 4a            	dec	a
1359  0268 2705          	jreq	L032
1360  026a ae00ed        	ldw	x,#237
1361  026d ad73          	call	LC006
1362  026f               L032:
1363                     ; 239   if (ADC1_SchmittTriggerChannel == ADC1_SCHMITTTRIG_ALL)
1365  026f 7b01          	ld	a,(OFST+1,sp)
1366  0271 a1ff          	cp	a,#255
1367  0273 261d          	jrne	L564
1368                     ; 241     if (NewState != DISABLE)
1370  0275 7b02          	ld	a,(OFST+2,sp)
1371  0277 270a          	jreq	L764
1372                     ; 243       ADC1->TDRL &= (uint8_t)0x0;
1374  0279 725f5407      	clr	21511
1375                     ; 244       ADC1->TDRH &= (uint8_t)0x0;
1377  027d 725f5406      	clr	21510
1379  0281 2057          	jra	L374
1380  0283               L764:
1381                     ; 248       ADC1->TDRL |= (uint8_t)0xFF;
1383  0283 c65407        	ld	a,21511
1384  0286 aaff          	or	a,#255
1385  0288 c75407        	ld	21511,a
1386                     ; 249       ADC1->TDRH |= (uint8_t)0xFF;
1388  028b c65406        	ld	a,21510
1389  028e aaff          	or	a,#255
1390  0290 2045          	jp	LC003
1391  0292               L564:
1392                     ; 252   else if (ADC1_SchmittTriggerChannel < ADC1_SCHMITTTRIG_CHANNEL8)
1394  0292 a108          	cp	a,#8
1395  0294 0d02          	tnz	(OFST+2,sp)
1396  0296 2420          	jruge	L574
1397                     ; 254     if (NewState != DISABLE)
1399  0298 2711          	jreq	L774
1400                     ; 256       ADC1->TDRL &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel));
1402  029a ad40          	call	LC005
1403  029c 2704          	jreq	L432
1404  029e               L632:
1405  029e 48            	sll	a
1406  029f 5a            	decw	x
1407  02a0 26fc          	jrne	L632
1408  02a2               L432:
1409  02a2 43            	cpl	a
1410  02a3 c45407        	and	a,21511
1411  02a6               LC004:
1412  02a6 c75407        	ld	21511,a
1414  02a9 202f          	jra	L374
1415  02ab               L774:
1416                     ; 260       ADC1->TDRL |= (uint8_t)((uint8_t)0x01 << (uint8_t)ADC1_SchmittTriggerChannel);
1418  02ab ad2f          	call	LC005
1419  02ad 2704          	jreq	L042
1420  02af               L242:
1421  02af 48            	sll	a
1422  02b0 5a            	decw	x
1423  02b1 26fc          	jrne	L242
1424  02b3               L042:
1425  02b3 ca5407        	or	a,21511
1426  02b6 20ee          	jp	LC004
1427  02b8               L574:
1428                     ; 265     if (NewState != DISABLE)
1430  02b8 2710          	jreq	L505
1431                     ; 267       ADC1->TDRH &= (uint8_t)(~(uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8)));
1433  02ba a008          	sub	a,#8
1434  02bc ad1e          	call	LC005
1435  02be 2704          	jreq	L442
1436  02c0               L642:
1437  02c0 48            	sll	a
1438  02c1 5a            	decw	x
1439  02c2 26fc          	jrne	L642
1440  02c4               L442:
1441  02c4 43            	cpl	a
1442  02c5 c45406        	and	a,21510
1444  02c8 200d          	jp	LC003
1445  02ca               L505:
1446                     ; 271       ADC1->TDRH |= (uint8_t)((uint8_t)0x01 << ((uint8_t)ADC1_SchmittTriggerChannel - (uint8_t)8));
1448  02ca a008          	sub	a,#8
1449  02cc ad0e          	call	LC005
1450  02ce 2704          	jreq	L052
1451  02d0               L252:
1452  02d0 48            	sll	a
1453  02d1 5a            	decw	x
1454  02d2 26fc          	jrne	L252
1455  02d4               L052:
1456  02d4 ca5406        	or	a,21510
1457  02d7               LC003:
1458  02d7 c75406        	ld	21510,a
1459  02da               L374:
1460                     ; 274 }
1463  02da 85            	popw	x
1464  02db 81            	ret	
1465  02dc               LC005:
1466  02dc 5f            	clrw	x
1467  02dd 97            	ld	xl,a
1468  02de a601          	ld	a,#1
1469  02e0 5d            	tnzw	x
1470  02e1 81            	ret	
1471  02e2               LC006:
1472  02e2 89            	pushw	x
1473  02e3 5f            	clrw	x
1474  02e4 89            	pushw	x
1475  02e5 ae0000        	ldw	x,#L542
1476  02e8 cd0000        	call	_assert_failed
1478  02eb 5b04          	addw	sp,#4
1479  02ed 81            	ret	
1537                     ; 286 void ADC1_ConversionConfig(ADC1_ConvMode_TypeDef ADC1_ConversionMode, ADC1_Channel_TypeDef ADC1_Channel, ADC1_Align_TypeDef ADC1_Align)
1537                     ; 287 {
1538                     	switch	.text
1539  02ee               _ADC1_ConversionConfig:
1541  02ee 89            	pushw	x
1542       00000000      OFST:	set	0
1545                     ; 289   assert_param(IS_ADC1_CONVERSIONMODE_OK(ADC1_ConversionMode));
1547  02ef 9e            	ld	a,xh
1548  02f0 4d            	tnz	a
1549  02f1 2709          	jreq	L262
1550  02f3 9e            	ld	a,xh
1551  02f4 4a            	dec	a
1552  02f5 2705          	jreq	L262
1553  02f7 ae0121        	ldw	x,#289
1554  02fa ad6b          	call	LC007
1555  02fc               L262:
1556                     ; 290   assert_param(IS_ADC1_CHANNEL_OK(ADC1_Channel));
1558  02fc 7b02          	ld	a,(OFST+2,sp)
1559  02fe 272d          	jreq	L272
1560  0300 a101          	cp	a,#1
1561  0302 2729          	jreq	L272
1562  0304 a102          	cp	a,#2
1563  0306 2725          	jreq	L272
1564  0308 a103          	cp	a,#3
1565  030a 2721          	jreq	L272
1566  030c a104          	cp	a,#4
1567  030e 271d          	jreq	L272
1568  0310 a105          	cp	a,#5
1569  0312 2719          	jreq	L272
1570  0314 a106          	cp	a,#6
1571  0316 2715          	jreq	L272
1572  0318 a107          	cp	a,#7
1573  031a 2711          	jreq	L272
1574  031c a108          	cp	a,#8
1575  031e 270d          	jreq	L272
1576  0320 a10c          	cp	a,#12
1577  0322 2709          	jreq	L272
1578  0324 a109          	cp	a,#9
1579  0326 2705          	jreq	L272
1580  0328 ae0122        	ldw	x,#290
1581  032b ad3a          	call	LC007
1582  032d               L272:
1583                     ; 291   assert_param(IS_ADC1_ALIGN_OK(ADC1_Align));
1585  032d 7b05          	ld	a,(OFST+5,sp)
1586  032f 2709          	jreq	L203
1587  0331 a108          	cp	a,#8
1588  0333 2705          	jreq	L203
1589  0335 ae0123        	ldw	x,#291
1590  0338 ad2d          	call	LC007
1591  033a               L203:
1592                     ; 294   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_ALIGN);
1594  033a 72175402      	bres	21506,#3
1595                     ; 296   ADC1->CR2 |= (uint8_t)(ADC1_Align);
1597  033e c65402        	ld	a,21506
1598  0341 1a05          	or	a,(OFST+5,sp)
1599  0343 c75402        	ld	21506,a
1600                     ; 298   if (ADC1_ConversionMode == ADC1_CONVERSIONMODE_CONTINUOUS)
1602  0346 7b01          	ld	a,(OFST+1,sp)
1603  0348 4a            	dec	a
1604  0349 2606          	jrne	L735
1605                     ; 301     ADC1->CR1 |= ADC1_CR1_CONT;
1607  034b 72125401      	bset	21505,#1
1609  034f 2004          	jra	L145
1610  0351               L735:
1611                     ; 306     ADC1->CR1 &= (uint8_t)(~ADC1_CR1_CONT);
1613  0351 72135401      	bres	21505,#1
1614  0355               L145:
1615                     ; 310   ADC1->CSR &= (uint8_t)(~ADC1_CSR_CH);
1617  0355 c65400        	ld	a,21504
1618  0358 a4f0          	and	a,#240
1619  035a c75400        	ld	21504,a
1620                     ; 312   ADC1->CSR |= (uint8_t)(ADC1_Channel);
1622  035d c65400        	ld	a,21504
1623  0360 1a02          	or	a,(OFST+2,sp)
1624  0362 c75400        	ld	21504,a
1625                     ; 313 }
1628  0365 85            	popw	x
1629  0366 81            	ret	
1630  0367               LC007:
1631  0367 89            	pushw	x
1632  0368 5f            	clrw	x
1633  0369 89            	pushw	x
1634  036a ae0000        	ldw	x,#L542
1635  036d cd0000        	call	_assert_failed
1637  0370 5b04          	addw	sp,#4
1638  0372 81            	ret	
1685                     ; 325 void ADC1_ExternalTriggerConfig(ADC1_ExtTrig_TypeDef ADC1_ExtTrigger, FunctionalState NewState)
1685                     ; 326 {
1686                     	switch	.text
1687  0373               _ADC1_ExternalTriggerConfig:
1689  0373 89            	pushw	x
1690       00000000      OFST:	set	0
1693                     ; 328   assert_param(IS_ADC1_EXTTRIG_OK(ADC1_ExtTrigger));
1695  0374 9e            	ld	a,xh
1696  0375 4d            	tnz	a
1697  0376 270a          	jreq	L413
1698  0378 9e            	ld	a,xh
1699  0379 a110          	cp	a,#16
1700  037b 2705          	jreq	L413
1701  037d ae0148        	ldw	x,#328
1702  0380 ad2c          	call	LC008
1703  0382               L413:
1704                     ; 329   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1706  0382 7b02          	ld	a,(OFST+2,sp)
1707  0384 2708          	jreq	L423
1708  0386 4a            	dec	a
1709  0387 2705          	jreq	L423
1710  0389 ae0149        	ldw	x,#329
1711  038c ad20          	call	LC008
1712  038e               L423:
1713                     ; 332   ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTSEL);
1715  038e c65402        	ld	a,21506
1716  0391 a4cf          	and	a,#207
1717  0393 c75402        	ld	21506,a
1718                     ; 334   if (NewState != DISABLE)
1720  0396 7b02          	ld	a,(OFST+2,sp)
1721  0398 2706          	jreq	L565
1722                     ; 337     ADC1->CR2 |= (uint8_t)(ADC1_CR2_EXTTRIG);
1724  039a 721c5402      	bset	21506,#6
1726  039e 2004          	jra	L765
1727  03a0               L565:
1728                     ; 342     ADC1->CR2 &= (uint8_t)(~ADC1_CR2_EXTTRIG);
1730  03a0 721d5402      	bres	21506,#6
1731  03a4               L765:
1732                     ; 346   ADC1->CR2 |= (uint8_t)(ADC1_ExtTrigger);
1734  03a4 c65402        	ld	a,21506
1735  03a7 1a01          	or	a,(OFST+1,sp)
1736  03a9 c75402        	ld	21506,a
1737                     ; 347 }
1740  03ac 85            	popw	x
1741  03ad 81            	ret	
1742  03ae               LC008:
1743  03ae 89            	pushw	x
1744  03af 5f            	clrw	x
1745  03b0 89            	pushw	x
1746  03b1 ae0000        	ldw	x,#L542
1747  03b4 cd0000        	call	_assert_failed
1749  03b7 5b04          	addw	sp,#4
1750  03b9 81            	ret	
1774                     ; 358 void ADC1_StartConversion(void)
1774                     ; 359 {
1775                     	switch	.text
1776  03ba               _ADC1_StartConversion:
1780                     ; 360   ADC1->CR1 |= ADC1_CR1_ADON;
1782  03ba 72105401      	bset	21505,#0
1783                     ; 361 }
1786  03be 81            	ret	
1830                     ; 370 uint16_t ADC1_GetConversionValue(void)
1830                     ; 371 {
1831                     	switch	.text
1832  03bf               _ADC1_GetConversionValue:
1834  03bf 5205          	subw	sp,#5
1835       00000005      OFST:	set	5
1838                     ; 372   uint16_t temph = 0;
1840                     ; 373   uint8_t templ = 0;
1842                     ; 375   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
1844  03c1 720754020e    	btjf	21506,#3,L326
1845                     ; 378     templ = ADC1->DRL;
1847  03c6 c65405        	ld	a,21509
1848  03c9 6b03          	ld	(OFST-2,sp),a
1850                     ; 380     temph = ADC1->DRH;
1852  03cb c65404        	ld	a,21508
1853  03ce 97            	ld	xl,a
1855                     ; 382     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
1857  03cf 7b03          	ld	a,(OFST-2,sp)
1858  03d1 02            	rlwa	x,a
1861  03d2 201a          	jra	L526
1862  03d4               L326:
1863                     ; 387     temph = ADC1->DRH;
1865  03d4 c65404        	ld	a,21508
1866  03d7 97            	ld	xl,a
1868                     ; 389     templ = ADC1->DRL;
1870  03d8 c65405        	ld	a,21509
1871  03db 6b03          	ld	(OFST-2,sp),a
1873                     ; 391     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)((uint16_t)temph << 8));
1875  03dd 4f            	clr	a
1876  03de 02            	rlwa	x,a
1877  03df 1f01          	ldw	(OFST-4,sp),x
1879  03e1 7b03          	ld	a,(OFST-2,sp)
1880  03e3 97            	ld	xl,a
1881  03e4 a640          	ld	a,#64
1882  03e6 42            	mul	x,a
1883  03e7 01            	rrwa	x,a
1884  03e8 1a02          	or	a,(OFST-3,sp)
1885  03ea 01            	rrwa	x,a
1886  03eb 1a01          	or	a,(OFST-4,sp)
1887  03ed 01            	rrwa	x,a
1889  03ee               L526:
1890                     ; 394   return ((uint16_t)temph);
1894  03ee 5b05          	addw	sp,#5
1895  03f0 81            	ret	
1942                     ; 405 void ADC1_AWDChannelConfig(ADC1_Channel_TypeDef Channel, FunctionalState NewState)
1942                     ; 406 {
1943                     	switch	.text
1944  03f1               _ADC1_AWDChannelConfig:
1946  03f1 89            	pushw	x
1947       00000000      OFST:	set	0
1950                     ; 408   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
1952  03f2 9f            	ld	a,xl
1953  03f3 4d            	tnz	a
1954  03f4 270a          	jreq	L243
1955  03f6 9f            	ld	a,xl
1956  03f7 4a            	dec	a
1957  03f8 2706          	jreq	L243
1958  03fa ae0198        	ldw	x,#408
1959  03fd cd0483        	call	LC012
1960  0400               L243:
1961                     ; 409   assert_param(IS_ADC1_CHANNEL_OK(Channel));
1963  0400 7b01          	ld	a,(OFST+1,sp)
1964  0402 272f          	jreq	L253
1965  0404 a101          	cp	a,#1
1966  0406 272b          	jreq	L253
1967  0408 a102          	cp	a,#2
1968  040a 2727          	jreq	L253
1969  040c a103          	cp	a,#3
1970  040e 2723          	jreq	L253
1971  0410 a104          	cp	a,#4
1972  0412 271f          	jreq	L253
1973  0414 a105          	cp	a,#5
1974  0416 271b          	jreq	L253
1975  0418 a106          	cp	a,#6
1976  041a 2717          	jreq	L253
1977  041c a107          	cp	a,#7
1978  041e 2713          	jreq	L253
1979  0420 a108          	cp	a,#8
1980  0422 270f          	jreq	L253
1981  0424 a10c          	cp	a,#12
1982  0426 270b          	jreq	L253
1983  0428 a109          	cp	a,#9
1984  042a 2707          	jreq	L253
1985  042c ae0199        	ldw	x,#409
1986  042f ad52          	call	LC012
1987  0431 7b01          	ld	a,(OFST+1,sp)
1988  0433               L253:
1989                     ; 411   if (Channel < (uint8_t)8)
1991  0433 a108          	cp	a,#8
1992  0435 0d02          	tnz	(OFST+2,sp)
1993  0437 2420          	jruge	L156
1994                     ; 413     if (NewState != DISABLE)
1996  0439 270d          	jreq	L356
1997                     ; 415       ADC1->AWCRL |= (uint8_t)((uint8_t)1 << Channel);
1999  043b ad40          	call	LC011
2000  043d 2704          	jreq	L653
2001  043f               L063:
2002  043f 48            	sll	a
2003  0440 5a            	decw	x
2004  0441 26fc          	jrne	L063
2005  0443               L653:
2006  0443 ca540f        	or	a,21519
2008  0446 200c          	jp	LC010
2009  0448               L356:
2010                     ; 419       ADC1->AWCRL &= (uint8_t)~(uint8_t)((uint8_t)1 << Channel);
2012  0448 ad33          	call	LC011
2013  044a 2704          	jreq	L263
2014  044c               L463:
2015  044c 48            	sll	a
2016  044d 5a            	decw	x
2017  044e 26fc          	jrne	L463
2018  0450               L263:
2019  0450 43            	cpl	a
2020  0451 c4540f        	and	a,21519
2021  0454               LC010:
2022  0454 c7540f        	ld	21519,a
2023  0457 2022          	jra	L756
2024  0459               L156:
2025                     ; 424     if (NewState != DISABLE)
2027  0459 270f          	jreq	L166
2028                     ; 426       ADC1->AWCRH |= (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8));
2030  045b a008          	sub	a,#8
2031  045d ad1e          	call	LC011
2032  045f 2704          	jreq	L663
2033  0461               L073:
2034  0461 48            	sll	a
2035  0462 5a            	decw	x
2036  0463 26fc          	jrne	L073
2037  0465               L663:
2038  0465 ca540e        	or	a,21518
2040  0468 200e          	jp	LC009
2041  046a               L166:
2042                     ; 430       ADC1->AWCRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (uint8_t)(Channel - (uint8_t)8));
2044  046a a008          	sub	a,#8
2045  046c ad0f          	call	LC011
2046  046e 2704          	jreq	L273
2047  0470               L473:
2048  0470 48            	sll	a
2049  0471 5a            	decw	x
2050  0472 26fc          	jrne	L473
2051  0474               L273:
2052  0474 43            	cpl	a
2053  0475 c4540e        	and	a,21518
2054  0478               LC009:
2055  0478 c7540e        	ld	21518,a
2056  047b               L756:
2057                     ; 433 }
2060  047b 85            	popw	x
2061  047c 81            	ret	
2062  047d               LC011:
2063  047d 5f            	clrw	x
2064  047e 97            	ld	xl,a
2065  047f a601          	ld	a,#1
2066  0481 5d            	tnzw	x
2067  0482 81            	ret	
2068  0483               LC012:
2069  0483 89            	pushw	x
2070  0484 5f            	clrw	x
2071  0485 89            	pushw	x
2072  0486 ae0000        	ldw	x,#L542
2073  0489 cd0000        	call	_assert_failed
2075  048c 5b04          	addw	sp,#4
2076  048e 81            	ret	
2111                     ; 441 void ADC1_SetHighThreshold(uint16_t Threshold)
2111                     ; 442 {
2112                     	switch	.text
2113  048f               _ADC1_SetHighThreshold:
2115  048f 89            	pushw	x
2116       00000000      OFST:	set	0
2119                     ; 443   ADC1->HTRH = (uint8_t)(Threshold >> (uint8_t)2);
2121  0490 54            	srlw	x
2122  0491 54            	srlw	x
2123  0492 9f            	ld	a,xl
2124  0493 c75408        	ld	21512,a
2125                     ; 444   ADC1->HTRL = (uint8_t)Threshold;
2127  0496 7b02          	ld	a,(OFST+2,sp)
2128  0498 c75409        	ld	21513,a
2129                     ; 445 }
2132  049b 85            	popw	x
2133  049c 81            	ret	
2168                     ; 453 void ADC1_SetLowThreshold(uint16_t Threshold)
2168                     ; 454 {
2169                     	switch	.text
2170  049d               _ADC1_SetLowThreshold:
2174                     ; 455   ADC1->LTRL = (uint8_t)Threshold;
2176  049d 9f            	ld	a,xl
2177  049e c7540b        	ld	21515,a
2178                     ; 456   ADC1->LTRH = (uint8_t)(Threshold >> (uint8_t)2);
2180  04a1 54            	srlw	x
2181  04a2 54            	srlw	x
2182  04a3 9f            	ld	a,xl
2183  04a4 c7540a        	ld	21514,a
2184                     ; 457 }
2187  04a7 81            	ret	
2241                     ; 466 uint16_t ADC1_GetBufferValue(uint8_t Buffer)
2241                     ; 467 {
2242                     	switch	.text
2243  04a8               _ADC1_GetBufferValue:
2245  04a8 88            	push	a
2246  04a9 5205          	subw	sp,#5
2247       00000005      OFST:	set	5
2250                     ; 468   uint16_t temph = 0;
2252                     ; 469   uint8_t templ = 0;
2254                     ; 472   assert_param(IS_ADC1_BUFFER_OK(Buffer));
2256  04ab a10a          	cp	a,#10
2257  04ad 250e          	jrult	L604
2258  04af ae01d8        	ldw	x,#472
2259  04b2 89            	pushw	x
2260  04b3 5f            	clrw	x
2261  04b4 89            	pushw	x
2262  04b5 ae0000        	ldw	x,#L542
2263  04b8 cd0000        	call	_assert_failed
2265  04bb 5b04          	addw	sp,#4
2266  04bd               L604:
2267                     ; 474   if ((ADC1->CR2 & ADC1_CR2_ALIGN) != 0) /* Right alignment */
2269  04bd 7b06          	ld	a,(OFST+1,sp)
2270  04bf 48            	sll	a
2271  04c0 5f            	clrw	x
2272  04c1 97            	ld	xl,a
2273  04c2 7207540213    	btjf	21506,#3,L747
2274                     ; 477     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
2276  04c7 d653e1        	ld	a,(21473,x)
2277  04ca 6b03          	ld	(OFST-2,sp),a
2279                     ; 479     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
2281  04cc 7b06          	ld	a,(OFST+1,sp)
2282  04ce 48            	sll	a
2283  04cf 5f            	clrw	x
2284  04d0 97            	ld	xl,a
2285  04d1 d653e0        	ld	a,(21472,x)
2286  04d4 97            	ld	xl,a
2288                     ; 481     temph = (uint16_t)(templ | (uint16_t)(temph << (uint8_t)8));
2290  04d5 7b03          	ld	a,(OFST-2,sp)
2291  04d7 02            	rlwa	x,a
2294  04d8 2024          	jra	L157
2295  04da               L747:
2296                     ; 486     temph = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1));
2298  04da d653e0        	ld	a,(21472,x)
2299  04dd 5f            	clrw	x
2300  04de 97            	ld	xl,a
2301  04df 1f04          	ldw	(OFST-1,sp),x
2303                     ; 488     templ = *(uint8_t*)(uint16_t)((uint16_t)ADC1_BaseAddress + (uint8_t)(Buffer << 1) + 1);
2305  04e1 7b06          	ld	a,(OFST+1,sp)
2306  04e3 48            	sll	a
2307  04e4 5f            	clrw	x
2308  04e5 97            	ld	xl,a
2309  04e6 d653e1        	ld	a,(21473,x)
2310  04e9 6b03          	ld	(OFST-2,sp),a
2312                     ; 490     temph = (uint16_t)((uint16_t)((uint16_t)templ << 6) | (uint16_t)(temph << 8));
2314  04eb 4f            	clr	a
2315  04ec 1e04          	ldw	x,(OFST-1,sp)
2316  04ee 02            	rlwa	x,a
2317  04ef 1f01          	ldw	(OFST-4,sp),x
2319  04f1 7b03          	ld	a,(OFST-2,sp)
2320  04f3 97            	ld	xl,a
2321  04f4 a640          	ld	a,#64
2322  04f6 42            	mul	x,a
2323  04f7 01            	rrwa	x,a
2324  04f8 1a02          	or	a,(OFST-3,sp)
2325  04fa 01            	rrwa	x,a
2326  04fb 1a01          	or	a,(OFST-4,sp)
2327  04fd 01            	rrwa	x,a
2329  04fe               L157:
2330                     ; 493   return ((uint16_t)temph);
2334  04fe 5b06          	addw	sp,#6
2335  0500 81            	ret	
2402                     ; 502 FlagStatus ADC1_GetAWDChannelStatus(ADC1_Channel_TypeDef Channel)
2402                     ; 503 {
2403                     	switch	.text
2404  0501               _ADC1_GetAWDChannelStatus:
2406  0501 88            	push	a
2407  0502 88            	push	a
2408       00000001      OFST:	set	1
2411                     ; 504   uint8_t status = 0;
2413                     ; 507   assert_param(IS_ADC1_CHANNEL_OK(Channel));
2415  0503 4d            	tnz	a
2416  0504 2736          	jreq	L024
2417  0506 a101          	cp	a,#1
2418  0508 2732          	jreq	L024
2419  050a a102          	cp	a,#2
2420  050c 272e          	jreq	L024
2421  050e a103          	cp	a,#3
2422  0510 272a          	jreq	L024
2423  0512 a104          	cp	a,#4
2424  0514 2726          	jreq	L024
2425  0516 a105          	cp	a,#5
2426  0518 2722          	jreq	L024
2427  051a a106          	cp	a,#6
2428  051c 271e          	jreq	L024
2429  051e a107          	cp	a,#7
2430  0520 271a          	jreq	L024
2431  0522 a108          	cp	a,#8
2432  0524 2716          	jreq	L024
2433  0526 a10c          	cp	a,#12
2434  0528 2712          	jreq	L024
2435  052a a109          	cp	a,#9
2436  052c 270e          	jreq	L024
2437  052e ae01fb        	ldw	x,#507
2438  0531 89            	pushw	x
2439  0532 5f            	clrw	x
2440  0533 89            	pushw	x
2441  0534 ae0000        	ldw	x,#L542
2442  0537 cd0000        	call	_assert_failed
2444  053a 5b04          	addw	sp,#4
2445  053c               L024:
2446                     ; 509   if (Channel < (uint8_t)8)
2448  053c 7b02          	ld	a,(OFST+1,sp)
2449  053e a108          	cp	a,#8
2450  0540 2410          	jruge	L5001
2451                     ; 511     status = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << Channel));
2453  0542 5f            	clrw	x
2454  0543 97            	ld	xl,a
2455  0544 a601          	ld	a,#1
2456  0546 5d            	tnzw	x
2457  0547 2704          	jreq	L424
2458  0549               L624:
2459  0549 48            	sll	a
2460  054a 5a            	decw	x
2461  054b 26fc          	jrne	L624
2462  054d               L424:
2463  054d c4540d        	and	a,21517
2466  0550 2010          	jra	L7001
2467  0552               L5001:
2468                     ; 515     status = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (Channel - (uint8_t)8)));
2470  0552 a008          	sub	a,#8
2471  0554 5f            	clrw	x
2472  0555 97            	ld	xl,a
2473  0556 a601          	ld	a,#1
2474  0558 5d            	tnzw	x
2475  0559 2704          	jreq	L034
2476  055b               L234:
2477  055b 48            	sll	a
2478  055c 5a            	decw	x
2479  055d 26fc          	jrne	L234
2480  055f               L034:
2481  055f c4540c        	and	a,21516
2483  0562               L7001:
2484                     ; 518   return ((FlagStatus)status);
2488  0562 85            	popw	x
2489  0563 81            	ret	
2648                     ; 527 FlagStatus ADC1_GetFlagStatus(ADC1_Flag_TypeDef Flag)
2648                     ; 528 {
2649                     	switch	.text
2650  0564               _ADC1_GetFlagStatus:
2652  0564 88            	push	a
2653  0565 88            	push	a
2654       00000001      OFST:	set	1
2657                     ; 529   uint8_t flagstatus = 0;
2659                     ; 530   uint8_t temp = 0;
2661                     ; 533   assert_param(IS_ADC1_FLAG_OK(Flag));
2663  0566 a180          	cp	a,#128
2664  0568 273e          	jreq	L244
2665  056a a141          	cp	a,#65
2666  056c 273a          	jreq	L244
2667  056e a140          	cp	a,#64
2668  0570 2736          	jreq	L244
2669  0572 a110          	cp	a,#16
2670  0574 2732          	jreq	L244
2671  0576 a111          	cp	a,#17
2672  0578 272e          	jreq	L244
2673  057a a112          	cp	a,#18
2674  057c 272a          	jreq	L244
2675  057e a113          	cp	a,#19
2676  0580 2726          	jreq	L244
2677  0582 a114          	cp	a,#20
2678  0584 2722          	jreq	L244
2679  0586 a115          	cp	a,#21
2680  0588 271e          	jreq	L244
2681  058a a116          	cp	a,#22
2682  058c 271a          	jreq	L244
2683  058e a117          	cp	a,#23
2684  0590 2716          	jreq	L244
2685  0592 a118          	cp	a,#24
2686  0594 2712          	jreq	L244
2687  0596 a119          	cp	a,#25
2688  0598 270e          	jreq	L244
2689  059a ae0215        	ldw	x,#533
2690  059d 89            	pushw	x
2691  059e 5f            	clrw	x
2692  059f 89            	pushw	x
2693  05a0 ae0000        	ldw	x,#L542
2694  05a3 cd0000        	call	_assert_failed
2696  05a6 5b04          	addw	sp,#4
2697  05a8               L244:
2698                     ; 535   if ((Flag & 0x0F) == 0x01)
2700  05a8 7b02          	ld	a,(OFST+1,sp)
2701  05aa a40f          	and	a,#15
2702  05ac 4a            	dec	a
2703  05ad 2607          	jrne	L7701
2704                     ; 538     flagstatus = (uint8_t)(ADC1->CR3 & ADC1_CR3_OVR);
2706  05af c65403        	ld	a,21507
2707  05b2 a440          	and	a,#64
2710  05b4 2039          	jra	L1011
2711  05b6               L7701:
2712                     ; 540   else if ((Flag & 0xF0) == 0x10)
2714  05b6 7b02          	ld	a,(OFST+1,sp)
2715  05b8 a4f0          	and	a,#240
2716  05ba a110          	cp	a,#16
2717  05bc 262c          	jrne	L3011
2718                     ; 543     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2720  05be 7b02          	ld	a,(OFST+1,sp)
2721  05c0 a40f          	and	a,#15
2722  05c2 6b01          	ld	(OFST+0,sp),a
2724                     ; 544     if (temp < 8)
2726  05c4 a108          	cp	a,#8
2727  05c6 2410          	jruge	L5011
2728                     ; 546       flagstatus = (uint8_t)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
2730  05c8 5f            	clrw	x
2731  05c9 97            	ld	xl,a
2732  05ca a601          	ld	a,#1
2733  05cc 5d            	tnzw	x
2734  05cd 2704          	jreq	L644
2735  05cf               L054:
2736  05cf 48            	sll	a
2737  05d0 5a            	decw	x
2738  05d1 26fc          	jrne	L054
2739  05d3               L644:
2740  05d3 c4540d        	and	a,21517
2743  05d6 2017          	jra	L1011
2744  05d8               L5011:
2745                     ; 550       flagstatus = (uint8_t)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
2747  05d8 a008          	sub	a,#8
2748  05da 5f            	clrw	x
2749  05db 97            	ld	xl,a
2750  05dc a601          	ld	a,#1
2751  05de 5d            	tnzw	x
2752  05df 2704          	jreq	L254
2753  05e1               L454:
2754  05e1 48            	sll	a
2755  05e2 5a            	decw	x
2756  05e3 26fc          	jrne	L454
2757  05e5               L254:
2758  05e5 c4540c        	and	a,21516
2760  05e8 2005          	jra	L1011
2761  05ea               L3011:
2762                     ; 555     flagstatus = (uint8_t)(ADC1->CSR & Flag);
2764  05ea c65400        	ld	a,21504
2765  05ed 1402          	and	a,(OFST+1,sp)
2767  05ef               L1011:
2768                     ; 557   return ((FlagStatus)flagstatus);
2772  05ef 85            	popw	x
2773  05f0 81            	ret	
2818                     ; 567 void ADC1_ClearFlag(ADC1_Flag_TypeDef Flag)
2818                     ; 568 {
2819                     	switch	.text
2820  05f1               _ADC1_ClearFlag:
2822  05f1 88            	push	a
2823  05f2 88            	push	a
2824       00000001      OFST:	set	1
2827                     ; 569   uint8_t temp = 0;
2829                     ; 572   assert_param(IS_ADC1_FLAG_OK(Flag));
2831  05f3 a180          	cp	a,#128
2832  05f5 273e          	jreq	L464
2833  05f7 a141          	cp	a,#65
2834  05f9 273a          	jreq	L464
2835  05fb a140          	cp	a,#64
2836  05fd 2736          	jreq	L464
2837  05ff a110          	cp	a,#16
2838  0601 2732          	jreq	L464
2839  0603 a111          	cp	a,#17
2840  0605 272e          	jreq	L464
2841  0607 a112          	cp	a,#18
2842  0609 272a          	jreq	L464
2843  060b a113          	cp	a,#19
2844  060d 2726          	jreq	L464
2845  060f a114          	cp	a,#20
2846  0611 2722          	jreq	L464
2847  0613 a115          	cp	a,#21
2848  0615 271e          	jreq	L464
2849  0617 a116          	cp	a,#22
2850  0619 271a          	jreq	L464
2851  061b a117          	cp	a,#23
2852  061d 2716          	jreq	L464
2853  061f a118          	cp	a,#24
2854  0621 2712          	jreq	L464
2855  0623 a119          	cp	a,#25
2856  0625 270e          	jreq	L464
2857  0627 ae023c        	ldw	x,#572
2858  062a 89            	pushw	x
2859  062b 5f            	clrw	x
2860  062c 89            	pushw	x
2861  062d ae0000        	ldw	x,#L542
2862  0630 cd0000        	call	_assert_failed
2864  0633 5b04          	addw	sp,#4
2865  0635               L464:
2866                     ; 574   if ((Flag & 0x0F) == 0x01)
2868  0635 7b02          	ld	a,(OFST+1,sp)
2869  0637 a40f          	and	a,#15
2870  0639 4a            	dec	a
2871  063a 2606          	jrne	L5311
2872                     ; 577     ADC1->CR3 &= (uint8_t)(~ADC1_CR3_OVR);
2874  063c 721d5403      	bres	21507,#6
2876  0640 2045          	jra	L7311
2877  0642               L5311:
2878                     ; 579   else if ((Flag & 0xF0) == 0x10)
2880  0642 7b02          	ld	a,(OFST+1,sp)
2881  0644 a4f0          	and	a,#240
2882  0646 a110          	cp	a,#16
2883  0648 2634          	jrne	L1411
2884                     ; 582     temp = (uint8_t)(Flag & (uint8_t)0x0F);
2886  064a 7b02          	ld	a,(OFST+1,sp)
2887  064c a40f          	and	a,#15
2888  064e 6b01          	ld	(OFST+0,sp),a
2890                     ; 583     if (temp < 8)
2892  0650 a108          	cp	a,#8
2893  0652 2414          	jruge	L3411
2894                     ; 585       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
2896  0654 5f            	clrw	x
2897  0655 97            	ld	xl,a
2898  0656 a601          	ld	a,#1
2899  0658 5d            	tnzw	x
2900  0659 2704          	jreq	L074
2901  065b               L274:
2902  065b 48            	sll	a
2903  065c 5a            	decw	x
2904  065d 26fc          	jrne	L274
2905  065f               L074:
2906  065f 43            	cpl	a
2907  0660 c4540d        	and	a,21517
2908  0663 c7540d        	ld	21517,a
2910  0666 201f          	jra	L7311
2911  0668               L3411:
2912                     ; 589       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
2914  0668 a008          	sub	a,#8
2915  066a 5f            	clrw	x
2916  066b 97            	ld	xl,a
2917  066c a601          	ld	a,#1
2918  066e 5d            	tnzw	x
2919  066f 2704          	jreq	L474
2920  0671               L674:
2921  0671 48            	sll	a
2922  0672 5a            	decw	x
2923  0673 26fc          	jrne	L674
2924  0675               L474:
2925  0675 43            	cpl	a
2926  0676 c4540c        	and	a,21516
2927  0679 c7540c        	ld	21516,a
2928  067c 2009          	jra	L7311
2929  067e               L1411:
2930                     ; 594     ADC1->CSR &= (uint8_t) (~Flag);
2932  067e 7b02          	ld	a,(OFST+1,sp)
2933  0680 43            	cpl	a
2934  0681 c45400        	and	a,21504
2935  0684 c75400        	ld	21504,a
2936  0687               L7311:
2937                     ; 596 }
2940  0687 85            	popw	x
2941  0688 81            	ret	
2997                     ; 616 ITStatus ADC1_GetITStatus(ADC1_IT_TypeDef ITPendingBit)
2997                     ; 617 {
2998                     	switch	.text
2999  0689               _ADC1_GetITStatus:
3001  0689 89            	pushw	x
3002  068a 88            	push	a
3003       00000001      OFST:	set	1
3006                     ; 618   ITStatus itstatus = RESET;
3008                     ; 619   uint8_t temp = 0;
3010                     ; 622   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
3012  068b a30080        	cpw	x,#128
3013  068e 274a          	jreq	L605
3014  0690 a30140        	cpw	x,#320
3015  0693 2745          	jreq	L605
3016  0695 a30110        	cpw	x,#272
3017  0698 2740          	jreq	L605
3018  069a a30111        	cpw	x,#273
3019  069d 273b          	jreq	L605
3020  069f a30112        	cpw	x,#274
3021  06a2 2736          	jreq	L605
3022  06a4 a30113        	cpw	x,#275
3023  06a7 2731          	jreq	L605
3024  06a9 a30114        	cpw	x,#276
3025  06ac 272c          	jreq	L605
3026  06ae a30115        	cpw	x,#277
3027  06b1 2727          	jreq	L605
3028  06b3 a30116        	cpw	x,#278
3029  06b6 2722          	jreq	L605
3030  06b8 a30117        	cpw	x,#279
3031  06bb 271d          	jreq	L605
3032  06bd a30118        	cpw	x,#280
3033  06c0 2718          	jreq	L605
3034  06c2 a3011c        	cpw	x,#284
3035  06c5 2713          	jreq	L605
3036  06c7 a30119        	cpw	x,#281
3037  06ca 270e          	jreq	L605
3038  06cc ae026e        	ldw	x,#622
3039  06cf 89            	pushw	x
3040  06d0 5f            	clrw	x
3041  06d1 89            	pushw	x
3042  06d2 ae0000        	ldw	x,#L542
3043  06d5 cd0000        	call	_assert_failed
3045  06d8 5b04          	addw	sp,#4
3046  06da               L605:
3047                     ; 624   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
3049  06da 7b03          	ld	a,(OFST+2,sp)
3050  06dc a4f0          	and	a,#240
3051  06de 5f            	clrw	x
3052  06df 02            	rlwa	x,a
3053  06e0 a30010        	cpw	x,#16
3054  06e3 262c          	jrne	L7711
3055                     ; 627     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
3057  06e5 7b03          	ld	a,(OFST+2,sp)
3058  06e7 a40f          	and	a,#15
3059  06e9 6b01          	ld	(OFST+0,sp),a
3061                     ; 628     if (temp < 8)
3063  06eb a108          	cp	a,#8
3064  06ed 2410          	jruge	L1021
3065                     ; 630       itstatus = (ITStatus)(ADC1->AWSRL & (uint8_t)((uint8_t)1 << temp));
3067  06ef 5f            	clrw	x
3068  06f0 97            	ld	xl,a
3069  06f1 a601          	ld	a,#1
3070  06f3 5d            	tnzw	x
3071  06f4 2704          	jreq	L215
3072  06f6               L415:
3073  06f6 48            	sll	a
3074  06f7 5a            	decw	x
3075  06f8 26fc          	jrne	L415
3076  06fa               L215:
3077  06fa c4540d        	and	a,21517
3080  06fd 2017          	jra	L5021
3081  06ff               L1021:
3082                     ; 634       itstatus = (ITStatus)(ADC1->AWSRH & (uint8_t)((uint8_t)1 << (temp - 8)));
3084  06ff a008          	sub	a,#8
3085  0701 5f            	clrw	x
3086  0702 97            	ld	xl,a
3087  0703 a601          	ld	a,#1
3088  0705 5d            	tnzw	x
3089  0706 2704          	jreq	L615
3090  0708               L025:
3091  0708 48            	sll	a
3092  0709 5a            	decw	x
3093  070a 26fc          	jrne	L025
3094  070c               L615:
3095  070c c4540c        	and	a,21516
3097  070f 2005          	jra	L5021
3098  0711               L7711:
3099                     ; 639     itstatus = (ITStatus)(ADC1->CSR & (uint8_t)ITPendingBit);
3101  0711 c65400        	ld	a,21504
3102  0714 1403          	and	a,(OFST+2,sp)
3104  0716               L5021:
3105                     ; 641   return ((ITStatus)itstatus);
3109  0716 5b03          	addw	sp,#3
3110  0718 81            	ret	
3156                     ; 662 void ADC1_ClearITPendingBit(ADC1_IT_TypeDef ITPendingBit)
3156                     ; 663 {
3157                     	switch	.text
3158  0719               _ADC1_ClearITPendingBit:
3160  0719 89            	pushw	x
3161  071a 88            	push	a
3162       00000001      OFST:	set	1
3165                     ; 664   uint8_t temp = 0;
3167                     ; 667   assert_param(IS_ADC1_ITPENDINGBIT_OK(ITPendingBit));
3169  071b a30080        	cpw	x,#128
3170  071e 274a          	jreq	L035
3171  0720 a30140        	cpw	x,#320
3172  0723 2745          	jreq	L035
3173  0725 a30110        	cpw	x,#272
3174  0728 2740          	jreq	L035
3175  072a a30111        	cpw	x,#273
3176  072d 273b          	jreq	L035
3177  072f a30112        	cpw	x,#274
3178  0732 2736          	jreq	L035
3179  0734 a30113        	cpw	x,#275
3180  0737 2731          	jreq	L035
3181  0739 a30114        	cpw	x,#276
3182  073c 272c          	jreq	L035
3183  073e a30115        	cpw	x,#277
3184  0741 2727          	jreq	L035
3185  0743 a30116        	cpw	x,#278
3186  0746 2722          	jreq	L035
3187  0748 a30117        	cpw	x,#279
3188  074b 271d          	jreq	L035
3189  074d a30118        	cpw	x,#280
3190  0750 2718          	jreq	L035
3191  0752 a3011c        	cpw	x,#284
3192  0755 2713          	jreq	L035
3193  0757 a30119        	cpw	x,#281
3194  075a 270e          	jreq	L035
3195  075c ae029b        	ldw	x,#667
3196  075f 89            	pushw	x
3197  0760 5f            	clrw	x
3198  0761 89            	pushw	x
3199  0762 ae0000        	ldw	x,#L542
3200  0765 cd0000        	call	_assert_failed
3202  0768 5b04          	addw	sp,#4
3203  076a               L035:
3204                     ; 669   if (((uint16_t)ITPendingBit & 0xF0) == 0x10)
3206  076a 7b03          	ld	a,(OFST+2,sp)
3207  076c a4f0          	and	a,#240
3208  076e 5f            	clrw	x
3209  076f 02            	rlwa	x,a
3210  0770 a30010        	cpw	x,#16
3211  0773 2634          	jrne	L1321
3212                     ; 672     temp = (uint8_t)((uint16_t)ITPendingBit & 0x0F);
3214  0775 7b03          	ld	a,(OFST+2,sp)
3215  0777 a40f          	and	a,#15
3216  0779 6b01          	ld	(OFST+0,sp),a
3218                     ; 673     if (temp < 8)
3220  077b a108          	cp	a,#8
3221  077d 2414          	jruge	L3321
3222                     ; 675       ADC1->AWSRL &= (uint8_t)~(uint8_t)((uint8_t)1 << temp);
3224  077f 5f            	clrw	x
3225  0780 97            	ld	xl,a
3226  0781 a601          	ld	a,#1
3227  0783 5d            	tnzw	x
3228  0784 2704          	jreq	L435
3229  0786               L635:
3230  0786 48            	sll	a
3231  0787 5a            	decw	x
3232  0788 26fc          	jrne	L635
3233  078a               L435:
3234  078a 43            	cpl	a
3235  078b c4540d        	and	a,21517
3236  078e c7540d        	ld	21517,a
3238  0791 201f          	jra	L7321
3239  0793               L3321:
3240                     ; 679       ADC1->AWSRH &= (uint8_t)~(uint8_t)((uint8_t)1 << (temp - 8));
3242  0793 a008          	sub	a,#8
3243  0795 5f            	clrw	x
3244  0796 97            	ld	xl,a
3245  0797 a601          	ld	a,#1
3246  0799 5d            	tnzw	x
3247  079a 2704          	jreq	L045
3248  079c               L245:
3249  079c 48            	sll	a
3250  079d 5a            	decw	x
3251  079e 26fc          	jrne	L245
3252  07a0               L045:
3253  07a0 43            	cpl	a
3254  07a1 c4540c        	and	a,21516
3255  07a4 c7540c        	ld	21516,a
3256  07a7 2009          	jra	L7321
3257  07a9               L1321:
3258                     ; 684     ADC1->CSR &= (uint8_t)((uint16_t)~(uint16_t)ITPendingBit);
3260  07a9 7b03          	ld	a,(OFST+2,sp)
3261  07ab 43            	cpl	a
3262  07ac c45400        	and	a,21504
3263  07af c75400        	ld	21504,a
3264  07b2               L7321:
3265                     ; 686 }
3268  07b2 5b03          	addw	sp,#3
3269  07b4 81            	ret	
3282                     	xdef	_ADC1_ClearITPendingBit
3283                     	xdef	_ADC1_GetITStatus
3284                     	xdef	_ADC1_ClearFlag
3285                     	xdef	_ADC1_GetFlagStatus
3286                     	xdef	_ADC1_GetAWDChannelStatus
3287                     	xdef	_ADC1_GetBufferValue
3288                     	xdef	_ADC1_SetLowThreshold
3289                     	xdef	_ADC1_SetHighThreshold
3290                     	xdef	_ADC1_GetConversionValue
3291                     	xdef	_ADC1_StartConversion
3292                     	xdef	_ADC1_AWDChannelConfig
3293                     	xdef	_ADC1_ExternalTriggerConfig
3294                     	xdef	_ADC1_ConversionConfig
3295                     	xdef	_ADC1_SchmittTriggerConfig
3296                     	xdef	_ADC1_PrescalerConfig
3297                     	xdef	_ADC1_ITConfig
3298                     	xdef	_ADC1_DataBufferCmd
3299                     	xdef	_ADC1_ScanModeCmd
3300                     	xdef	_ADC1_Cmd
3301                     	xdef	_ADC1_Init
3302                     	xdef	_ADC1_DeInit
3303                     	xref	_assert_failed
3304                     .const:	section	.text
3305  0000               L542:
3306  0000 2e2e5c2e2e5c  	dc.b	"..\..\stm\librarie"
3307  0012 735c73746d38  	dc.b	"s\stm8s_stdperiph_"
3308  0024 647269766572  	dc.b	"driver\src\stm8s_a"
3309  0036 6463312e6300  	dc.b	"dc1.c",0
3329                     	end
