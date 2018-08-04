   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
 178                     ; 132 void ADC_DeInit(ADC_TypeDef* ADCx)
 178                     ; 133 {
 180                     .text:	section	.text,new
 181  0000               _ADC_DeInit:
 185                     ; 135   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 187  0000 7f            	clr	(x)
 188                     ; 136   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 190  0001 6f01          	clr	(1,x)
 191                     ; 137   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 193  0003 a61f          	ld	a,#31
 194  0005 e702          	ld	(2,x),a
 195                     ; 140   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 197  0007 a6ff          	ld	a,#255
 198  0009 e703          	ld	(3,x),a
 199                     ; 143   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 201  000b a60f          	ld	a,#15
 202  000d e706          	ld	(6,x),a
 203                     ; 144   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 205  000f a6ff          	ld	a,#255
 206  0011 e707          	ld	(7,x),a
 207                     ; 147   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 209  0013 6f08          	clr	(8,x)
 210                     ; 148   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 212  0015 6f09          	clr	(9,x)
 213                     ; 151   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 215  0017 6f0a          	clr	(10,x)
 216                     ; 152   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 218  0019 6f0b          	clr	(11,x)
 219                     ; 153   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 221  001b 6f0c          	clr	(12,x)
 222                     ; 154   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 224  001d 6f0d          	clr	(13,x)
 225                     ; 157   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 227  001f 6f0e          	clr	(14,x)
 228                     ; 158   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 230  0021 6f0f          	clr	(15,x)
 231                     ; 159   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 233  0023 6f10          	clr	(16,x)
 234                     ; 160   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 236  0025 6f11          	clr	(17,x)
 237                     ; 161 }
 240  0027 81            	ret
 387                     ; 183 void ADC_Init(ADC_TypeDef* ADCx,
 387                     ; 184               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 387                     ; 185               ADC_Resolution_TypeDef ADC_Resolution,
 387                     ; 186               ADC_Prescaler_TypeDef ADC_Prescaler)
 387                     ; 187 {
 388                     .text:	section	.text,new
 389  0000               _ADC_Init:
 391  0000 89            	pushw	x
 392       00000000      OFST:	set	0
 395                     ; 189   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 397                     ; 190   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 399                     ; 191   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 401                     ; 194   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 403  0001 f6            	ld	a,(x)
 404  0002 a49b          	and	a,#155
 405  0004 f7            	ld	(x),a
 406                     ; 197   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 408  0005 7b05          	ld	a,(OFST+5,sp)
 409  0007 1a06          	or	a,(OFST+6,sp)
 410  0009 fa            	or	a,(x)
 411  000a f7            	ld	(x),a
 412                     ; 200   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 414  000b e601          	ld	a,(1,x)
 415  000d a47f          	and	a,#127
 416  000f e701          	ld	(1,x),a
 417                     ; 203   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 419  0011 e601          	ld	a,(1,x)
 420  0013 1a07          	or	a,(OFST+7,sp)
 421  0015 e701          	ld	(1,x),a
 422                     ; 204 }
 425  0017 85            	popw	x
 426  0018 81            	ret
 493                     ; 213 void ADC_Cmd(ADC_TypeDef* ADCx,
 493                     ; 214              FunctionalState NewState)
 493                     ; 215 {
 494                     .text:	section	.text,new
 495  0000               _ADC_Cmd:
 497  0000 89            	pushw	x
 498       00000000      OFST:	set	0
 501                     ; 217   assert_param(IS_FUNCTIONAL_STATE(NewState));
 503                     ; 219   if (NewState != DISABLE)
 505  0001 0d05          	tnz	(OFST+5,sp)
 506  0003 2706          	jreq	L142
 507                     ; 222     ADCx->CR1 |= ADC_CR1_ADON;
 509  0005 f6            	ld	a,(x)
 510  0006 aa01          	or	a,#1
 511  0008 f7            	ld	(x),a
 513  0009 2006          	jra	L342
 514  000b               L142:
 515                     ; 227     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 517  000b 1e01          	ldw	x,(OFST+1,sp)
 518  000d f6            	ld	a,(x)
 519  000e a4fe          	and	a,#254
 520  0010 f7            	ld	(x),a
 521  0011               L342:
 522                     ; 229 }
 525  0011 85            	popw	x
 526  0012 81            	ret
 564                     ; 236 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 564                     ; 237 {
 565                     .text:	section	.text,new
 566  0000               _ADC_SoftwareStartConv:
 570                     ; 239   ADCx->CR1 |= ADC_CR1_START;
 572  0000 f6            	ld	a,(x)
 573  0001 aa02          	or	a,#2
 574  0003 f7            	ld	(x),a
 575                     ; 240 }
 578  0004 81            	ret
 706                     ; 258 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 706                     ; 259                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 706                     ; 260                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 706                     ; 261 {
 707                     .text:	section	.text,new
 708  0000               _ADC_ExternalTrigConfig:
 710  0000 89            	pushw	x
 711       00000000      OFST:	set	0
 714                     ; 263   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 716                     ; 264   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 718                     ; 267   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 720  0001 e601          	ld	a,(1,x)
 721  0003 a487          	and	a,#135
 722  0005 e701          	ld	(1,x),a
 723                     ; 271   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 723                     ; 272                           (uint8_t)ADC_ExtEventSelection);
 725  0007 7b06          	ld	a,(OFST+6,sp)
 726  0009 1a05          	or	a,(OFST+5,sp)
 727  000b ea01          	or	a,(1,x)
 728  000d e701          	ld	(1,x),a
 729                     ; 273 }
 732  000f 85            	popw	x
 733  0010 81            	ret
1047                     ; 336 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1047                     ; 337                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1047                     ; 338 {
1048                     .text:	section	.text,new
1049  0000               _ADC_AnalogWatchdogChannelSelect:
1051  0000 89            	pushw	x
1052       00000000      OFST:	set	0
1055                     ; 340   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1057                     ; 343   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1059  0001 e602          	ld	a,(2,x)
1060  0003 a4e0          	and	a,#224
1061  0005 e702          	ld	(2,x),a
1062                     ; 346   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1064  0007 e602          	ld	a,(2,x)
1065  0009 1a05          	or	a,(OFST+5,sp)
1066  000b e702          	ld	(2,x),a
1067                     ; 347 }
1070  000d 85            	popw	x
1071  000e 81            	ret
1123                     ; 358 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1123                     ; 359 {
1124                     .text:	section	.text,new
1125  0000               _ADC_AnalogWatchdogThresholdsConfig:
1127  0000 89            	pushw	x
1128       00000000      OFST:	set	0
1131                     ; 361   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1133                     ; 362   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1135                     ; 365   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1137  0001 7b05          	ld	a,(OFST+5,sp)
1138  0003 1e01          	ldw	x,(OFST+1,sp)
1139  0005 e706          	ld	(6,x),a
1140                     ; 366   ADCx->HTRL = (uint8_t)(HighThreshold);
1142  0007 7b06          	ld	a,(OFST+6,sp)
1143  0009 1e01          	ldw	x,(OFST+1,sp)
1144  000b e707          	ld	(7,x),a
1145                     ; 369   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1147  000d 7b07          	ld	a,(OFST+7,sp)
1148  000f 1e01          	ldw	x,(OFST+1,sp)
1149  0011 e708          	ld	(8,x),a
1150                     ; 370   ADCx->LTRL = (uint8_t)(LowThreshold);
1152  0013 7b08          	ld	a,(OFST+8,sp)
1153  0015 1e01          	ldw	x,(OFST+1,sp)
1154  0017 e709          	ld	(9,x),a
1155                     ; 371 }
1158  0019 85            	popw	x
1159  001a 81            	ret
1222                     ; 409 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1222                     ; 410                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1222                     ; 411                               uint16_t HighThreshold,
1222                     ; 412                               uint16_t LowThreshold)
1222                     ; 413 {
1223                     .text:	section	.text,new
1224  0000               _ADC_AnalogWatchdogConfig:
1226  0000 89            	pushw	x
1227       00000000      OFST:	set	0
1230                     ; 415   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1232                     ; 416   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1234                     ; 417   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1236                     ; 420   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1238  0001 e602          	ld	a,(2,x)
1239  0003 a4e0          	and	a,#224
1240  0005 e702          	ld	(2,x),a
1241                     ; 423   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1243  0007 e602          	ld	a,(2,x)
1244  0009 1a05          	or	a,(OFST+5,sp)
1245  000b e702          	ld	(2,x),a
1246                     ; 426   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1248  000d 7b06          	ld	a,(OFST+6,sp)
1249  000f 1e01          	ldw	x,(OFST+1,sp)
1250  0011 e706          	ld	(6,x),a
1251                     ; 427   ADCx->HTRL = (uint8_t)(HighThreshold);
1253  0013 7b07          	ld	a,(OFST+7,sp)
1254  0015 1e01          	ldw	x,(OFST+1,sp)
1255  0017 e707          	ld	(7,x),a
1256                     ; 430   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1258  0019 7b08          	ld	a,(OFST+8,sp)
1259  001b 1e01          	ldw	x,(OFST+1,sp)
1260  001d e708          	ld	(8,x),a
1261                     ; 431   ADCx->LTRL = (uint8_t)LowThreshold;
1263  001f 7b09          	ld	a,(OFST+9,sp)
1264  0021 1e01          	ldw	x,(OFST+1,sp)
1265  0023 e709          	ld	(9,x),a
1266                     ; 432 }
1269  0025 85            	popw	x
1270  0026 81            	ret
1305                     ; 471 void ADC_TempSensorCmd(FunctionalState NewState)
1305                     ; 472 {
1306                     .text:	section	.text,new
1307  0000               _ADC_TempSensorCmd:
1311                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
1313                     ; 476   if (NewState != DISABLE)
1315  0000 4d            	tnz	a
1316  0001 2706          	jreq	L165
1317                     ; 479     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1319  0003 721a534e      	bset	21326,#5
1321  0007 2004          	jra	L365
1322  0009               L165:
1323                     ; 484     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1325  0009 721b534e      	bres	21326,#5
1326  000d               L365:
1327                     ; 486 }
1330  000d 81            	ret
1365                     ; 494 void ADC_VrefintCmd(FunctionalState NewState)
1365                     ; 495 {
1366                     .text:	section	.text,new
1367  0000               _ADC_VrefintCmd:
1371                     ; 497   assert_param(IS_FUNCTIONAL_STATE(NewState));
1373                     ; 499   if (NewState != DISABLE)
1375  0000 4d            	tnz	a
1376  0001 2706          	jreq	L306
1377                     ; 502     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1379  0003 7218534e      	bset	21326,#4
1381  0007 2004          	jra	L506
1382  0009               L306:
1383                     ; 507     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1385  0009 7219534e      	bres	21326,#4
1386  000d               L506:
1387                     ; 509 }
1390  000d 81            	ret
1700                     ; 580 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1700                     ; 581 {
1701                     .text:	section	.text,new
1702  0000               _ADC_ChannelCmd:
1704  0000 89            	pushw	x
1705  0001 88            	push	a
1706       00000001      OFST:	set	1
1709                     ; 582   uint8_t regindex = 0;
1711                     ; 584   assert_param(IS_FUNCTIONAL_STATE(NewState));
1713                     ; 586   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1715  0002 7b06          	ld	a,(OFST+5,sp)
1716  0004 6b01          	ld	(OFST+0,sp),a
1717                     ; 588   if (NewState != DISABLE)
1719  0006 0d08          	tnz	(OFST+7,sp)
1720  0008 270f          	jreq	L157
1721                     ; 591     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1723  000a 01            	rrwa	x,a
1724  000b 1b01          	add	a,(OFST+0,sp)
1725  000d 2401          	jrnc	L23
1726  000f 5c            	incw	x
1727  0010               L23:
1728  0010 02            	rlwa	x,a
1729  0011 e60a          	ld	a,(10,x)
1730  0013 1a07          	or	a,(OFST+6,sp)
1731  0015 e70a          	ld	(10,x),a
1733  0017 2012          	jra	L357
1734  0019               L157:
1735                     ; 596     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1737  0019 7b02          	ld	a,(OFST+1,sp)
1738  001b 97            	ld	xl,a
1739  001c 7b03          	ld	a,(OFST+2,sp)
1740  001e 1b01          	add	a,(OFST+0,sp)
1741  0020 2401          	jrnc	L43
1742  0022 5c            	incw	x
1743  0023               L43:
1744  0023 02            	rlwa	x,a
1745  0024 7b07          	ld	a,(OFST+6,sp)
1746  0026 43            	cpl	a
1747  0027 e40a          	and	a,(10,x)
1748  0029 e70a          	ld	(10,x),a
1749  002b               L357:
1750                     ; 598 }
1753  002b 5b03          	addw	sp,#3
1754  002d 81            	ret
1904                     ; 622 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1904                     ; 623                             ADC_Group_TypeDef ADC_GroupChannels,
1904                     ; 624                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1904                     ; 625 {
1905                     .text:	section	.text,new
1906  0000               _ADC_SamplingTimeConfig:
1908  0000 89            	pushw	x
1909       00000000      OFST:	set	0
1912                     ; 627   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1914                     ; 628   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1916                     ; 630   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1918  0001 0d05          	tnz	(OFST+5,sp)
1919  0003 2712          	jreq	L1401
1920                     ; 633     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1922  0005 e602          	ld	a,(2,x)
1923  0007 a41f          	and	a,#31
1924  0009 e702          	ld	(2,x),a
1925                     ; 634     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1927  000b 7b06          	ld	a,(OFST+6,sp)
1928  000d 4e            	swap	a
1929  000e 48            	sll	a
1930  000f a4e0          	and	a,#224
1931  0011 ea02          	or	a,(2,x)
1932  0013 e702          	ld	(2,x),a
1934  0015 2010          	jra	L3401
1935  0017               L1401:
1936                     ; 639     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1938  0017 1e01          	ldw	x,(OFST+1,sp)
1939  0019 e601          	ld	a,(1,x)
1940  001b a4f8          	and	a,#248
1941  001d e701          	ld	(1,x),a
1942                     ; 640     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1944  001f 1e01          	ldw	x,(OFST+1,sp)
1945  0021 e601          	ld	a,(1,x)
1946  0023 1a06          	or	a,(OFST+6,sp)
1947  0025 e701          	ld	(1,x),a
1948  0027               L3401:
1949                     ; 642 }
1952  0027 85            	popw	x
1953  0028 81            	ret
2018                     ; 688 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
2018                     ; 689                               FunctionalState NewState)
2018                     ; 690 {
2019                     .text:	section	.text,new
2020  0000               _ADC_SchmittTriggerConfig:
2022  0000 89            	pushw	x
2023  0001 88            	push	a
2024       00000001      OFST:	set	1
2027                     ; 691   uint8_t regindex = 0;
2029                     ; 693   assert_param(IS_FUNCTIONAL_STATE(NewState));
2031                     ; 695   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
2033  0002 7b06          	ld	a,(OFST+5,sp)
2034  0004 6b01          	ld	(OFST+0,sp),a
2035                     ; 697   if (NewState != DISABLE)
2037  0006 0d08          	tnz	(OFST+7,sp)
2038  0008 2710          	jreq	L7701
2039                     ; 700     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2041  000a 01            	rrwa	x,a
2042  000b 1b01          	add	a,(OFST+0,sp)
2043  000d 2401          	jrnc	L24
2044  000f 5c            	incw	x
2045  0010               L24:
2046  0010 02            	rlwa	x,a
2047  0011 7b07          	ld	a,(OFST+6,sp)
2048  0013 43            	cpl	a
2049  0014 e40e          	and	a,(14,x)
2050  0016 e70e          	ld	(14,x),a
2052  0018 2011          	jra	L1011
2053  001a               L7701:
2054                     ; 705     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2056  001a 7b02          	ld	a,(OFST+1,sp)
2057  001c 97            	ld	xl,a
2058  001d 7b03          	ld	a,(OFST+2,sp)
2059  001f 1b01          	add	a,(OFST+0,sp)
2060  0021 2401          	jrnc	L44
2061  0023 5c            	incw	x
2062  0024               L44:
2063  0024 02            	rlwa	x,a
2064  0025 e60e          	ld	a,(14,x)
2065  0027 1a07          	or	a,(OFST+6,sp)
2066  0029 e70e          	ld	(14,x),a
2067  002b               L1011:
2068                     ; 707 }
2071  002b 5b03          	addw	sp,#3
2072  002d 81            	ret
2117                     ; 714 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2117                     ; 715 {
2118                     .text:	section	.text,new
2119  0000               _ADC_GetConversionValue:
2121  0000 89            	pushw	x
2122  0001 89            	pushw	x
2123       00000002      OFST:	set	2
2126                     ; 716   uint16_t tmpreg = 0;
2128                     ; 719   tmpreg = (uint16_t)(ADCx->DRH);
2130  0002 e604          	ld	a,(4,x)
2131  0004 5f            	clrw	x
2132  0005 97            	ld	xl,a
2133  0006 1f01          	ldw	(OFST-1,sp),x
2134                     ; 720   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2136  0008 1e01          	ldw	x,(OFST-1,sp)
2137  000a 1603          	ldw	y,(OFST+1,sp)
2138  000c 90e605        	ld	a,(5,y)
2139  000f 02            	rlwa	x,a
2140  0010 1f01          	ldw	(OFST-1,sp),x
2141                     ; 723   return (uint16_t)(tmpreg) ;
2143  0012 1e01          	ldw	x,(OFST-1,sp)
2146  0014 5b04          	addw	sp,#4
2147  0016 81            	ret
2194                     ; 757 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2194                     ; 758 {
2195                     .text:	section	.text,new
2196  0000               _ADC_DMACmd:
2198  0000 89            	pushw	x
2199       00000000      OFST:	set	0
2202                     ; 760   assert_param(IS_FUNCTIONAL_STATE(NewState));
2204                     ; 762   if (NewState != DISABLE)
2206  0001 0d05          	tnz	(OFST+5,sp)
2207  0003 2708          	jreq	L1511
2208                     ; 765     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2210  0005 e60a          	ld	a,(10,x)
2211  0007 a47f          	and	a,#127
2212  0009 e70a          	ld	(10,x),a
2214  000b 2008          	jra	L3511
2215  000d               L1511:
2216                     ; 770     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2218  000d 1e01          	ldw	x,(OFST+1,sp)
2219  000f e60a          	ld	a,(10,x)
2220  0011 aa80          	or	a,#128
2221  0013 e70a          	ld	(10,x),a
2222  0015               L3511:
2223                     ; 772 }
2226  0015 85            	popw	x
2227  0016 81            	ret
2311                     ; 828 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2311                     ; 829 {
2312                     .text:	section	.text,new
2313  0000               _ADC_ITConfig:
2315  0000 89            	pushw	x
2316       00000000      OFST:	set	0
2319                     ; 831   assert_param(IS_FUNCTIONAL_STATE(NewState));
2321                     ; 832   assert_param(IS_ADC_IT(ADC_IT));
2323                     ; 834   if (NewState != DISABLE)
2325  0001 0d06          	tnz	(OFST+6,sp)
2326  0003 2706          	jreq	L7121
2327                     ; 837     ADCx->CR1 |= (uint8_t) ADC_IT;
2329  0005 f6            	ld	a,(x)
2330  0006 1a05          	or	a,(OFST+5,sp)
2331  0008 f7            	ld	(x),a
2333  0009 2007          	jra	L1221
2334  000b               L7121:
2335                     ; 842     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2337  000b 1e01          	ldw	x,(OFST+1,sp)
2338  000d 7b05          	ld	a,(OFST+5,sp)
2339  000f 43            	cpl	a
2340  0010 f4            	and	a,(x)
2341  0011 f7            	ld	(x),a
2342  0012               L1221:
2343                     ; 844 }
2346  0012 85            	popw	x
2347  0013 81            	ret
2452                     ; 856 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2452                     ; 857 {
2453                     .text:	section	.text,new
2454  0000               _ADC_GetFlagStatus:
2456  0000 89            	pushw	x
2457  0001 88            	push	a
2458       00000001      OFST:	set	1
2461                     ; 858   FlagStatus flagstatus = RESET;
2463                     ; 861   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2465                     ; 864   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2467  0002 e603          	ld	a,(3,x)
2468  0004 1506          	bcp	a,(OFST+5,sp)
2469  0006 2706          	jreq	L5721
2470                     ; 867     flagstatus = SET;
2472  0008 a601          	ld	a,#1
2473  000a 6b01          	ld	(OFST+0,sp),a
2475  000c 2002          	jra	L7721
2476  000e               L5721:
2477                     ; 872     flagstatus = RESET;
2479  000e 0f01          	clr	(OFST+0,sp)
2480  0010               L7721:
2481                     ; 876   return  flagstatus;
2483  0010 7b01          	ld	a,(OFST+0,sp)
2486  0012 5b03          	addw	sp,#3
2487  0014 81            	ret
2534                     ; 889 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2534                     ; 890                    ADC_FLAG_TypeDef ADC_FLAG)
2534                     ; 891 {
2535                     .text:	section	.text,new
2536  0000               _ADC_ClearFlag:
2538  0000 89            	pushw	x
2539       00000000      OFST:	set	0
2542                     ; 893   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2544                     ; 896   ADCx->SR = (uint8_t)~ADC_FLAG;
2546  0001 7b05          	ld	a,(OFST+5,sp)
2547  0003 43            	cpl	a
2548  0004 1e01          	ldw	x,(OFST+1,sp)
2549  0006 e703          	ld	(3,x),a
2550                     ; 897 }
2553  0008 85            	popw	x
2554  0009 81            	ret
2626                     ; 909 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2626                     ; 910                          ADC_IT_TypeDef ADC_IT)
2626                     ; 911 {
2627                     .text:	section	.text,new
2628  0000               _ADC_GetITStatus:
2630  0000 89            	pushw	x
2631  0001 5203          	subw	sp,#3
2632       00000003      OFST:	set	3
2635                     ; 912   ITStatus itstatus = RESET;
2637                     ; 913   uint8_t itmask = 0, enablestatus = 0;
2641                     ; 916   assert_param(IS_ADC_GET_IT(ADC_IT));
2643                     ; 919   itmask = (uint8_t)(ADC_IT >> 3);
2645  0003 7b08          	ld	a,(OFST+5,sp)
2646  0005 44            	srl	a
2647  0006 44            	srl	a
2648  0007 44            	srl	a
2649  0008 6b03          	ld	(OFST+0,sp),a
2650                     ; 920   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2650                     ; 921                                 (uint8_t)(itmask & (uint8_t)0x03));
2652  000a 7b03          	ld	a,(OFST+0,sp)
2653  000c a403          	and	a,#3
2654  000e 6b01          	ld	(OFST-2,sp),a
2655  0010 7b03          	ld	a,(OFST+0,sp)
2656  0012 a410          	and	a,#16
2657  0014 44            	srl	a
2658  0015 44            	srl	a
2659  0016 1a01          	or	a,(OFST-2,sp)
2660  0018 6b03          	ld	(OFST+0,sp),a
2661                     ; 924   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2663  001a f6            	ld	a,(x)
2664  001b 1408          	and	a,(OFST+5,sp)
2665  001d 6b02          	ld	(OFST-1,sp),a
2666                     ; 927   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2668  001f e603          	ld	a,(3,x)
2669  0021 1503          	bcp	a,(OFST+0,sp)
2670  0023 270a          	jreq	L1631
2672  0025 0d02          	tnz	(OFST-1,sp)
2673  0027 2706          	jreq	L1631
2674                     ; 930     itstatus = SET;
2676  0029 a601          	ld	a,#1
2677  002b 6b03          	ld	(OFST+0,sp),a
2679  002d 2002          	jra	L3631
2680  002f               L1631:
2681                     ; 935     itstatus = RESET;
2683  002f 0f03          	clr	(OFST+0,sp)
2684  0031               L3631:
2685                     ; 939   return  itstatus;
2687  0031 7b03          	ld	a,(OFST+0,sp)
2690  0033 5b05          	addw	sp,#5
2691  0035 81            	ret
2746                     ; 952 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2746                     ; 953                            ADC_IT_TypeDef ADC_IT)
2746                     ; 954 {
2747                     .text:	section	.text,new
2748  0000               _ADC_ClearITPendingBit:
2750  0000 89            	pushw	x
2751  0001 89            	pushw	x
2752       00000002      OFST:	set	2
2755                     ; 955   uint8_t itmask = 0;
2757                     ; 958   assert_param(IS_ADC_IT(ADC_IT));
2759                     ; 961   itmask = (uint8_t)(ADC_IT >> 3);
2761  0002 7b07          	ld	a,(OFST+5,sp)
2762  0004 44            	srl	a
2763  0005 44            	srl	a
2764  0006 44            	srl	a
2765  0007 6b02          	ld	(OFST+0,sp),a
2766                     ; 962   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2766                     ; 963                                  (uint8_t)(itmask & (uint8_t)0x03));
2768  0009 7b02          	ld	a,(OFST+0,sp)
2769  000b a403          	and	a,#3
2770  000d 6b01          	ld	(OFST-1,sp),a
2771  000f 7b02          	ld	a,(OFST+0,sp)
2772  0011 a410          	and	a,#16
2773  0013 44            	srl	a
2774  0014 44            	srl	a
2775  0015 1a01          	or	a,(OFST-1,sp)
2776  0017 6b02          	ld	(OFST+0,sp),a
2777                     ; 966   ADCx->SR = (uint8_t)~itmask;
2779  0019 7b02          	ld	a,(OFST+0,sp)
2780  001b 43            	cpl	a
2781  001c 1e03          	ldw	x,(OFST+1,sp)
2782  001e e703          	ld	(3,x),a
2783                     ; 967 }
2786  0020 5b04          	addw	sp,#4
2787  0022 81            	ret
2800                     	xdef	_ADC_ClearITPendingBit
2801                     	xdef	_ADC_GetITStatus
2802                     	xdef	_ADC_ClearFlag
2803                     	xdef	_ADC_GetFlagStatus
2804                     	xdef	_ADC_ITConfig
2805                     	xdef	_ADC_DMACmd
2806                     	xdef	_ADC_GetConversionValue
2807                     	xdef	_ADC_SchmittTriggerConfig
2808                     	xdef	_ADC_SamplingTimeConfig
2809                     	xdef	_ADC_ChannelCmd
2810                     	xdef	_ADC_VrefintCmd
2811                     	xdef	_ADC_TempSensorCmd
2812                     	xdef	_ADC_AnalogWatchdogConfig
2813                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2814                     	xdef	_ADC_AnalogWatchdogChannelSelect
2815                     	xdef	_ADC_ExternalTrigConfig
2816                     	xdef	_ADC_SoftwareStartConv
2817                     	xdef	_ADC_Cmd
2818                     	xdef	_ADC_Init
2819                     	xdef	_ADC_DeInit
2838                     	end
