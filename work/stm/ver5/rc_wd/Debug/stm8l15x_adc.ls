   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 180                     ; 132 void ADC_DeInit(ADC_TypeDef* ADCx)
 180                     ; 133 {
 182                     	switch	.text
 183  0000               _ADC_DeInit:
 187                     ; 135   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 189  0000 7f            	clr	(x)
 190                     ; 136   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 192  0001 6f01          	clr	(1,x)
 193                     ; 137   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 195  0003 a61f          	ld	a,#31
 196  0005 e702          	ld	(2,x),a
 197                     ; 140   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 199  0007 a6ff          	ld	a,#255
 200  0009 e703          	ld	(3,x),a
 201                     ; 143   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 203  000b a60f          	ld	a,#15
 204  000d e706          	ld	(6,x),a
 205                     ; 144   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 207  000f a6ff          	ld	a,#255
 208  0011 e707          	ld	(7,x),a
 209                     ; 147   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 211  0013 6f08          	clr	(8,x)
 212                     ; 148   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 214  0015 6f09          	clr	(9,x)
 215                     ; 151   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 217  0017 6f0a          	clr	(10,x)
 218                     ; 152   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 220  0019 6f0b          	clr	(11,x)
 221                     ; 153   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 223  001b 6f0c          	clr	(12,x)
 224                     ; 154   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 226  001d 6f0d          	clr	(13,x)
 227                     ; 157   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 229  001f 6f0e          	clr	(14,x)
 230                     ; 158   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 232  0021 6f0f          	clr	(15,x)
 233                     ; 159   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 235  0023 6f10          	clr	(16,x)
 236                     ; 160   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 238  0025 6f11          	clr	(17,x)
 239                     ; 161 }
 242  0027 81            	ret	
 389                     ; 183 void ADC_Init(ADC_TypeDef* ADCx,
 389                     ; 184               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 389                     ; 185               ADC_Resolution_TypeDef ADC_Resolution,
 389                     ; 186               ADC_Prescaler_TypeDef ADC_Prescaler)
 389                     ; 187 {
 390                     	switch	.text
 391  0028               _ADC_Init:
 393  0028 89            	pushw	x
 394       00000000      OFST:	set	0
 397                     ; 189   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 399                     ; 190   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 401                     ; 191   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 403                     ; 194   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 405  0029 f6            	ld	a,(x)
 406  002a a49b          	and	a,#155
 407  002c f7            	ld	(x),a
 408                     ; 197   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 410  002d 7b05          	ld	a,(OFST+5,sp)
 411  002f 1a06          	or	a,(OFST+6,sp)
 412  0031 fa            	or	a,(x)
 413  0032 f7            	ld	(x),a
 414                     ; 200   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 416  0033 e601          	ld	a,(1,x)
 417  0035 a47f          	and	a,#127
 418  0037 e701          	ld	(1,x),a
 419                     ; 203   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 421  0039 e601          	ld	a,(1,x)
 422  003b 1a07          	or	a,(OFST+7,sp)
 423  003d e701          	ld	(1,x),a
 424                     ; 204 }
 427  003f 85            	popw	x
 428  0040 81            	ret	
 495                     ; 213 void ADC_Cmd(ADC_TypeDef* ADCx,
 495                     ; 214              FunctionalState NewState)
 495                     ; 215 {
 496                     	switch	.text
 497  0041               _ADC_Cmd:
 499  0041 89            	pushw	x
 500       00000000      OFST:	set	0
 503                     ; 217   assert_param(IS_FUNCTIONAL_STATE(NewState));
 505                     ; 219   if (NewState != DISABLE)
 507  0042 7b05          	ld	a,(OFST+5,sp)
 508  0044 2705          	jreq	L142
 509                     ; 222     ADCx->CR1 |= ADC_CR1_ADON;
 511  0046 f6            	ld	a,(x)
 512  0047 aa01          	or	a,#1
 514  0049 2005          	jra	L342
 515  004b               L142:
 516                     ; 227     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 518  004b 1e01          	ldw	x,(OFST+1,sp)
 519  004d f6            	ld	a,(x)
 520  004e a4fe          	and	a,#254
 521  0050               L342:
 522  0050 f7            	ld	(x),a
 523                     ; 229 }
 526  0051 85            	popw	x
 527  0052 81            	ret	
 565                     ; 236 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 565                     ; 237 {
 566                     	switch	.text
 567  0053               _ADC_SoftwareStartConv:
 571                     ; 239   ADCx->CR1 |= ADC_CR1_START;
 573  0053 f6            	ld	a,(x)
 574  0054 aa02          	or	a,#2
 575  0056 f7            	ld	(x),a
 576                     ; 240 }
 579  0057 81            	ret	
 707                     ; 258 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 707                     ; 259                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 707                     ; 260                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 707                     ; 261 {
 708                     	switch	.text
 709  0058               _ADC_ExternalTrigConfig:
 711  0058 89            	pushw	x
 712       00000000      OFST:	set	0
 715                     ; 263   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 717                     ; 264   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 719                     ; 267   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 721  0059 e601          	ld	a,(1,x)
 722  005b a487          	and	a,#135
 723  005d e701          	ld	(1,x),a
 724                     ; 271   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 724                     ; 272                           (uint8_t)ADC_ExtEventSelection);
 726  005f 7b06          	ld	a,(OFST+6,sp)
 727  0061 1a05          	or	a,(OFST+5,sp)
 728  0063 ea01          	or	a,(1,x)
 729  0065 e701          	ld	(1,x),a
 730                     ; 273 }
 733  0067 85            	popw	x
 734  0068 81            	ret	
1048                     ; 336 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1048                     ; 337                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1048                     ; 338 {
1049                     	switch	.text
1050  0069               _ADC_AnalogWatchdogChannelSelect:
1052  0069 89            	pushw	x
1053       00000000      OFST:	set	0
1056                     ; 340   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1058                     ; 343   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1060  006a e602          	ld	a,(2,x)
1061  006c a4e0          	and	a,#224
1062  006e e702          	ld	(2,x),a
1063                     ; 346   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1065  0070 e602          	ld	a,(2,x)
1066  0072 1a05          	or	a,(OFST+5,sp)
1067  0074 e702          	ld	(2,x),a
1068                     ; 347 }
1071  0076 85            	popw	x
1072  0077 81            	ret	
1124                     ; 358 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1124                     ; 359 {
1125                     	switch	.text
1126  0078               _ADC_AnalogWatchdogThresholdsConfig:
1128  0078 89            	pushw	x
1129       00000000      OFST:	set	0
1132                     ; 361   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1134                     ; 362   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1136                     ; 365   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1138  0079 7b05          	ld	a,(OFST+5,sp)
1139  007b 1e01          	ldw	x,(OFST+1,sp)
1140  007d e706          	ld	(6,x),a
1141                     ; 366   ADCx->HTRL = (uint8_t)(HighThreshold);
1143  007f 7b06          	ld	a,(OFST+6,sp)
1144  0081 e707          	ld	(7,x),a
1145                     ; 369   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1147  0083 7b07          	ld	a,(OFST+7,sp)
1148  0085 e708          	ld	(8,x),a
1149                     ; 370   ADCx->LTRL = (uint8_t)(LowThreshold);
1151  0087 7b08          	ld	a,(OFST+8,sp)
1152  0089 e709          	ld	(9,x),a
1153                     ; 371 }
1156  008b 85            	popw	x
1157  008c 81            	ret	
1220                     ; 409 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1220                     ; 410                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1220                     ; 411                               uint16_t HighThreshold,
1220                     ; 412                               uint16_t LowThreshold)
1220                     ; 413 {
1221                     	switch	.text
1222  008d               _ADC_AnalogWatchdogConfig:
1224  008d 89            	pushw	x
1225       00000000      OFST:	set	0
1228                     ; 415   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1230                     ; 416   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1232                     ; 417   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1234                     ; 420   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1236  008e e602          	ld	a,(2,x)
1237  0090 a4e0          	and	a,#224
1238  0092 e702          	ld	(2,x),a
1239                     ; 423   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1241  0094 e602          	ld	a,(2,x)
1242  0096 1a05          	or	a,(OFST+5,sp)
1243  0098 e702          	ld	(2,x),a
1244                     ; 426   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1246  009a 7b06          	ld	a,(OFST+6,sp)
1247  009c 1e01          	ldw	x,(OFST+1,sp)
1248  009e e706          	ld	(6,x),a
1249                     ; 427   ADCx->HTRL = (uint8_t)(HighThreshold);
1251  00a0 7b07          	ld	a,(OFST+7,sp)
1252  00a2 e707          	ld	(7,x),a
1253                     ; 430   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1255  00a4 7b08          	ld	a,(OFST+8,sp)
1256  00a6 e708          	ld	(8,x),a
1257                     ; 431   ADCx->LTRL = (uint8_t)LowThreshold;
1259  00a8 7b09          	ld	a,(OFST+9,sp)
1260  00aa e709          	ld	(9,x),a
1261                     ; 432 }
1264  00ac 85            	popw	x
1265  00ad 81            	ret	
1300                     ; 471 void ADC_TempSensorCmd(FunctionalState NewState)
1300                     ; 472 {
1301                     	switch	.text
1302  00ae               _ADC_TempSensorCmd:
1306                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
1308                     ; 476   if (NewState != DISABLE)
1310  00ae 4d            	tnz	a
1311  00af 2705          	jreq	L165
1312                     ; 479     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1314  00b1 721a534e      	bset	21326,#5
1317  00b5 81            	ret	
1318  00b6               L165:
1319                     ; 484     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1321  00b6 721b534e      	bres	21326,#5
1322                     ; 486 }
1325  00ba 81            	ret	
1360                     ; 494 void ADC_VrefintCmd(FunctionalState NewState)
1360                     ; 495 {
1361                     	switch	.text
1362  00bb               _ADC_VrefintCmd:
1366                     ; 497   assert_param(IS_FUNCTIONAL_STATE(NewState));
1368                     ; 499   if (NewState != DISABLE)
1370  00bb 4d            	tnz	a
1371  00bc 2705          	jreq	L306
1372                     ; 502     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1374  00be 7218534e      	bset	21326,#4
1377  00c2 81            	ret	
1378  00c3               L306:
1379                     ; 507     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1381  00c3 7219534e      	bres	21326,#4
1382                     ; 509 }
1385  00c7 81            	ret	
1695                     ; 580 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1695                     ; 581 {
1696                     	switch	.text
1697  00c8               _ADC_ChannelCmd:
1699  00c8 89            	pushw	x
1700  00c9 88            	push	a
1701       00000001      OFST:	set	1
1704                     ; 582   uint8_t regindex = 0;
1706                     ; 584   assert_param(IS_FUNCTIONAL_STATE(NewState));
1708                     ; 586   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1710  00ca 7b06          	ld	a,(OFST+5,sp)
1711  00cc 6b01          	ld	(OFST+0,sp),a
1712                     ; 588   if (NewState != DISABLE)
1714  00ce 0d08          	tnz	(OFST+7,sp)
1715  00d0 270d          	jreq	L157
1716                     ; 591     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1718  00d2 01            	rrwa	x,a
1719  00d3 1b01          	add	a,(OFST+0,sp)
1720  00d5 2401          	jrnc	L23
1721  00d7 5c            	incw	x
1722  00d8               L23:
1723  00d8 02            	rlwa	x,a
1724  00d9 e60a          	ld	a,(10,x)
1725  00db 1a07          	or	a,(OFST+6,sp)
1727  00dd 2010          	jra	L357
1728  00df               L157:
1729                     ; 596     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1731  00df 7b02          	ld	a,(OFST+1,sp)
1732  00e1 97            	ld	xl,a
1733  00e2 7b03          	ld	a,(OFST+2,sp)
1734  00e4 1b01          	add	a,(OFST+0,sp)
1735  00e6 2401          	jrnc	L43
1736  00e8 5c            	incw	x
1737  00e9               L43:
1738  00e9 02            	rlwa	x,a
1739  00ea 7b07          	ld	a,(OFST+6,sp)
1740  00ec 43            	cpl	a
1741  00ed e40a          	and	a,(10,x)
1742  00ef               L357:
1743  00ef e70a          	ld	(10,x),a
1744                     ; 598 }
1747  00f1 5b03          	addw	sp,#3
1748  00f3 81            	ret	
1898                     ; 622 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1898                     ; 623                             ADC_Group_TypeDef ADC_GroupChannels,
1898                     ; 624                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1898                     ; 625 {
1899                     	switch	.text
1900  00f4               _ADC_SamplingTimeConfig:
1902  00f4 89            	pushw	x
1903       00000000      OFST:	set	0
1906                     ; 627   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1908                     ; 628   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1910                     ; 630   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1912  00f5 7b05          	ld	a,(OFST+5,sp)
1913  00f7 2712          	jreq	L1401
1914                     ; 633     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1916  00f9 e602          	ld	a,(2,x)
1917  00fb a41f          	and	a,#31
1918  00fd e702          	ld	(2,x),a
1919                     ; 634     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1921  00ff 7b06          	ld	a,(OFST+6,sp)
1922  0101 4e            	swap	a
1923  0102 48            	sll	a
1924  0103 a4e0          	and	a,#224
1925  0105 ea02          	or	a,(2,x)
1926  0107 e702          	ld	(2,x),a
1928  0109 200e          	jra	L3401
1929  010b               L1401:
1930                     ; 639     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1932  010b 1e01          	ldw	x,(OFST+1,sp)
1933  010d e601          	ld	a,(1,x)
1934  010f a4f8          	and	a,#248
1935  0111 e701          	ld	(1,x),a
1936                     ; 640     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1938  0113 e601          	ld	a,(1,x)
1939  0115 1a06          	or	a,(OFST+6,sp)
1940  0117 e701          	ld	(1,x),a
1941  0119               L3401:
1942                     ; 642 }
1945  0119 85            	popw	x
1946  011a 81            	ret	
2011                     ; 688 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
2011                     ; 689                               FunctionalState NewState)
2011                     ; 690 {
2012                     	switch	.text
2013  011b               _ADC_SchmittTriggerConfig:
2015  011b 89            	pushw	x
2016  011c 88            	push	a
2017       00000001      OFST:	set	1
2020                     ; 691   uint8_t regindex = 0;
2022                     ; 693   assert_param(IS_FUNCTIONAL_STATE(NewState));
2024                     ; 695   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
2026  011d 7b06          	ld	a,(OFST+5,sp)
2027  011f 6b01          	ld	(OFST+0,sp),a
2028                     ; 697   if (NewState != DISABLE)
2030  0121 0d08          	tnz	(OFST+7,sp)
2031  0123 270e          	jreq	L7701
2032                     ; 700     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2034  0125 01            	rrwa	x,a
2035  0126 1b01          	add	a,(OFST+0,sp)
2036  0128 2401          	jrnc	L24
2037  012a 5c            	incw	x
2038  012b               L24:
2039  012b 02            	rlwa	x,a
2040  012c 7b07          	ld	a,(OFST+6,sp)
2041  012e 43            	cpl	a
2042  012f e40e          	and	a,(14,x)
2044  0131 200f          	jra	L1011
2045  0133               L7701:
2046                     ; 705     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2048  0133 7b02          	ld	a,(OFST+1,sp)
2049  0135 97            	ld	xl,a
2050  0136 7b03          	ld	a,(OFST+2,sp)
2051  0138 1b01          	add	a,(OFST+0,sp)
2052  013a 2401          	jrnc	L44
2053  013c 5c            	incw	x
2054  013d               L44:
2055  013d 02            	rlwa	x,a
2056  013e e60e          	ld	a,(14,x)
2057  0140 1a07          	or	a,(OFST+6,sp)
2058  0142               L1011:
2059  0142 e70e          	ld	(14,x),a
2060                     ; 707 }
2063  0144 5b03          	addw	sp,#3
2064  0146 81            	ret	
2109                     ; 714 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2109                     ; 715 {
2110                     	switch	.text
2111  0147               _ADC_GetConversionValue:
2113  0147 89            	pushw	x
2114  0148 89            	pushw	x
2115       00000002      OFST:	set	2
2118                     ; 716   uint16_t tmpreg = 0;
2120                     ; 719   tmpreg = (uint16_t)(ADCx->DRH);
2122  0149 e604          	ld	a,(4,x)
2123  014b 97            	ld	xl,a
2124                     ; 720   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2126  014c 1603          	ldw	y,(OFST+1,sp)
2127  014e 90e605        	ld	a,(5,y)
2128  0151 02            	rlwa	x,a
2129                     ; 723   return (uint16_t)(tmpreg) ;
2133  0152 5b04          	addw	sp,#4
2134  0154 81            	ret	
2181                     ; 757 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2181                     ; 758 {
2182                     	switch	.text
2183  0155               _ADC_DMACmd:
2185  0155 89            	pushw	x
2186       00000000      OFST:	set	0
2189                     ; 760   assert_param(IS_FUNCTIONAL_STATE(NewState));
2191                     ; 762   if (NewState != DISABLE)
2193  0156 7b05          	ld	a,(OFST+5,sp)
2194  0158 2706          	jreq	L1511
2195                     ; 765     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2197  015a e60a          	ld	a,(10,x)
2198  015c a47f          	and	a,#127
2200  015e 2006          	jra	L3511
2201  0160               L1511:
2202                     ; 770     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2204  0160 1e01          	ldw	x,(OFST+1,sp)
2205  0162 e60a          	ld	a,(10,x)
2206  0164 aa80          	or	a,#128
2207  0166               L3511:
2208  0166 e70a          	ld	(10,x),a
2209                     ; 772 }
2212  0168 85            	popw	x
2213  0169 81            	ret	
2297                     ; 828 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2297                     ; 829 {
2298                     	switch	.text
2299  016a               _ADC_ITConfig:
2301  016a 89            	pushw	x
2302       00000000      OFST:	set	0
2305                     ; 831   assert_param(IS_FUNCTIONAL_STATE(NewState));
2307                     ; 832   assert_param(IS_ADC_IT(ADC_IT));
2309                     ; 834   if (NewState != DISABLE)
2311  016b 7b06          	ld	a,(OFST+6,sp)
2312  016d 2705          	jreq	L7121
2313                     ; 837     ADCx->CR1 |= (uint8_t) ADC_IT;
2315  016f f6            	ld	a,(x)
2316  0170 1a05          	or	a,(OFST+5,sp)
2318  0172 2006          	jra	L1221
2319  0174               L7121:
2320                     ; 842     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2322  0174 1e01          	ldw	x,(OFST+1,sp)
2323  0176 7b05          	ld	a,(OFST+5,sp)
2324  0178 43            	cpl	a
2325  0179 f4            	and	a,(x)
2326  017a               L1221:
2327  017a f7            	ld	(x),a
2328                     ; 844 }
2331  017b 85            	popw	x
2332  017c 81            	ret	
2437                     ; 856 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2437                     ; 857 {
2438                     	switch	.text
2439  017d               _ADC_GetFlagStatus:
2441  017d 89            	pushw	x
2442  017e 88            	push	a
2443       00000001      OFST:	set	1
2446                     ; 858   FlagStatus flagstatus = RESET;
2448                     ; 861   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2450                     ; 864   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2452  017f e603          	ld	a,(3,x)
2453  0181 1506          	bcp	a,(OFST+5,sp)
2454  0183 2704          	jreq	L5721
2455                     ; 867     flagstatus = SET;
2457  0185 a601          	ld	a,#1
2459  0187 2001          	jra	L7721
2460  0189               L5721:
2461                     ; 872     flagstatus = RESET;
2463  0189 4f            	clr	a
2464  018a               L7721:
2465                     ; 876   return  flagstatus;
2469  018a 5b03          	addw	sp,#3
2470  018c 81            	ret	
2517                     ; 889 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2517                     ; 890                    ADC_FLAG_TypeDef ADC_FLAG)
2517                     ; 891 {
2518                     	switch	.text
2519  018d               _ADC_ClearFlag:
2521  018d 89            	pushw	x
2522       00000000      OFST:	set	0
2525                     ; 893   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2527                     ; 896   ADCx->SR = (uint8_t)~ADC_FLAG;
2529  018e 7b05          	ld	a,(OFST+5,sp)
2530  0190 43            	cpl	a
2531  0191 1e01          	ldw	x,(OFST+1,sp)
2532  0193 e703          	ld	(3,x),a
2533                     ; 897 }
2536  0195 85            	popw	x
2537  0196 81            	ret	
2609                     ; 909 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2609                     ; 910                          ADC_IT_TypeDef ADC_IT)
2609                     ; 911 {
2610                     	switch	.text
2611  0197               _ADC_GetITStatus:
2613  0197 89            	pushw	x
2614  0198 5203          	subw	sp,#3
2615       00000003      OFST:	set	3
2618                     ; 912   ITStatus itstatus = RESET;
2620                     ; 913   uint8_t itmask = 0, enablestatus = 0;
2624                     ; 916   assert_param(IS_ADC_GET_IT(ADC_IT));
2626                     ; 919   itmask = (uint8_t)(ADC_IT >> 3);
2628  019a 7b08          	ld	a,(OFST+5,sp)
2629  019c 44            	srl	a
2630  019d 44            	srl	a
2631  019e 44            	srl	a
2632  019f 6b03          	ld	(OFST+0,sp),a
2633                     ; 920   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2633                     ; 921                                 (uint8_t)(itmask & (uint8_t)0x03));
2635  01a1 a403          	and	a,#3
2636  01a3 6b01          	ld	(OFST-2,sp),a
2637  01a5 7b03          	ld	a,(OFST+0,sp)
2638  01a7 a410          	and	a,#16
2639  01a9 44            	srl	a
2640  01aa 44            	srl	a
2641  01ab 1a01          	or	a,(OFST-2,sp)
2642  01ad 6b03          	ld	(OFST+0,sp),a
2643                     ; 924   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2645  01af f6            	ld	a,(x)
2646  01b0 1408          	and	a,(OFST+5,sp)
2647  01b2 6b02          	ld	(OFST-1,sp),a
2648                     ; 927   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2650  01b4 e603          	ld	a,(3,x)
2651  01b6 1503          	bcp	a,(OFST+0,sp)
2652  01b8 2708          	jreq	L1631
2654  01ba 7b02          	ld	a,(OFST-1,sp)
2655  01bc 2704          	jreq	L1631
2656                     ; 930     itstatus = SET;
2658  01be a601          	ld	a,#1
2660  01c0 2001          	jra	L3631
2661  01c2               L1631:
2662                     ; 935     itstatus = RESET;
2664  01c2 4f            	clr	a
2665  01c3               L3631:
2666                     ; 939   return  itstatus;
2670  01c3 5b05          	addw	sp,#5
2671  01c5 81            	ret	
2726                     ; 952 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2726                     ; 953                            ADC_IT_TypeDef ADC_IT)
2726                     ; 954 {
2727                     	switch	.text
2728  01c6               _ADC_ClearITPendingBit:
2730  01c6 89            	pushw	x
2731  01c7 89            	pushw	x
2732       00000002      OFST:	set	2
2735                     ; 955   uint8_t itmask = 0;
2737                     ; 958   assert_param(IS_ADC_IT(ADC_IT));
2739                     ; 961   itmask = (uint8_t)(ADC_IT >> 3);
2741  01c8 7b07          	ld	a,(OFST+5,sp)
2742  01ca 44            	srl	a
2743  01cb 44            	srl	a
2744  01cc 44            	srl	a
2745  01cd 6b02          	ld	(OFST+0,sp),a
2746                     ; 962   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2746                     ; 963                                  (uint8_t)(itmask & (uint8_t)0x03));
2748  01cf a403          	and	a,#3
2749  01d1 6b01          	ld	(OFST-1,sp),a
2750  01d3 7b02          	ld	a,(OFST+0,sp)
2751  01d5 a410          	and	a,#16
2752  01d7 44            	srl	a
2753  01d8 44            	srl	a
2754  01d9 1a01          	or	a,(OFST-1,sp)
2755  01db 6b02          	ld	(OFST+0,sp),a
2756                     ; 966   ADCx->SR = (uint8_t)~itmask;
2758  01dd 43            	cpl	a
2759  01de 1e03          	ldw	x,(OFST+1,sp)
2760  01e0 e703          	ld	(3,x),a
2761                     ; 967 }
2764  01e2 5b04          	addw	sp,#4
2765  01e4 81            	ret	
2778                     	xdef	_ADC_ClearITPendingBit
2779                     	xdef	_ADC_GetITStatus
2780                     	xdef	_ADC_ClearFlag
2781                     	xdef	_ADC_GetFlagStatus
2782                     	xdef	_ADC_ITConfig
2783                     	xdef	_ADC_DMACmd
2784                     	xdef	_ADC_GetConversionValue
2785                     	xdef	_ADC_SchmittTriggerConfig
2786                     	xdef	_ADC_SamplingTimeConfig
2787                     	xdef	_ADC_ChannelCmd
2788                     	xdef	_ADC_VrefintCmd
2789                     	xdef	_ADC_TempSensorCmd
2790                     	xdef	_ADC_AnalogWatchdogConfig
2791                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2792                     	xdef	_ADC_AnalogWatchdogChannelSelect
2793                     	xdef	_ADC_ExternalTrigConfig
2794                     	xdef	_ADC_SoftwareStartConv
2795                     	xdef	_ADC_Cmd
2796                     	xdef	_ADC_Init
2797                     	xdef	_ADC_DeInit
2816                     	end
