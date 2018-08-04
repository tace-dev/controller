   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 181                     ; 132 void ADC_DeInit(ADC_TypeDef* ADCx)
 181                     ; 133 {
 183                     .text:	section	.text,new
 184  0000               _ADC_DeInit:
 188                     ; 135   ADCx->CR1 =  ADC_CR1_RESET_VALUE;
 190  0000 7f            	clr	(x)
 191                     ; 136   ADCx->CR2 =  ADC_CR2_RESET_VALUE;
 193  0001 6f01          	clr	(1,x)
 194                     ; 137   ADCx->CR3 =  ADC_CR3_RESET_VALUE;
 196  0003 a61f          	ld	a,#31
 197  0005 e702          	ld	(2,x),a
 198                     ; 140   ADCx->SR =  (uint8_t)~ADC_SR_RESET_VALUE;
 200  0007 a6ff          	ld	a,#255
 201  0009 e703          	ld	(3,x),a
 202                     ; 143   ADCx->HTRH =  ADC_HTRH_RESET_VALUE;
 204  000b a60f          	ld	a,#15
 205  000d e706          	ld	(6,x),a
 206                     ; 144   ADCx->HTRL =  ADC_HTRL_RESET_VALUE;
 208  000f a6ff          	ld	a,#255
 209  0011 e707          	ld	(7,x),a
 210                     ; 147   ADCx->LTRH =  ADC_LTRH_RESET_VALUE;
 212  0013 6f08          	clr	(8,x)
 213                     ; 148   ADCx->LTRL =  ADC_LTRL_RESET_VALUE;
 215  0015 6f09          	clr	(9,x)
 216                     ; 151   ADCx->SQR[0] =  ADC_SQR1_RESET_VALUE;
 218  0017 6f0a          	clr	(10,x)
 219                     ; 152   ADCx->SQR[1] =  ADC_SQR2_RESET_VALUE;
 221  0019 6f0b          	clr	(11,x)
 222                     ; 153   ADCx->SQR[2] =  ADC_SQR3_RESET_VALUE;
 224  001b 6f0c          	clr	(12,x)
 225                     ; 154   ADCx->SQR[3] =  ADC_SQR4_RESET_VALUE;
 227  001d 6f0d          	clr	(13,x)
 228                     ; 157   ADCx->TRIGR[0] =  ADC_TRIGR1_RESET_VALUE;
 230  001f 6f0e          	clr	(14,x)
 231                     ; 158   ADCx->TRIGR[1] =  ADC_TRIGR2_RESET_VALUE;
 233  0021 6f0f          	clr	(15,x)
 234                     ; 159   ADCx->TRIGR[2] =  ADC_TRIGR3_RESET_VALUE;
 236  0023 6f10          	clr	(16,x)
 237                     ; 160   ADCx->TRIGR[3] =  ADC_TRIGR4_RESET_VALUE;
 239  0025 6f11          	clr	(17,x)
 240                     ; 161 }
 243  0027 81            	ret	
 390                     ; 183 void ADC_Init(ADC_TypeDef* ADCx,
 390                     ; 184               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 390                     ; 185               ADC_Resolution_TypeDef ADC_Resolution,
 390                     ; 186               ADC_Prescaler_TypeDef ADC_Prescaler)
 390                     ; 187 {
 391                     .text:	section	.text,new
 392  0000               _ADC_Init:
 394  0000 89            	pushw	x
 395       00000000      OFST:	set	0
 398                     ; 189   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 400                     ; 190   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 402                     ; 191   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 404                     ; 194   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 406  0001 f6            	ld	a,(x)
 407  0002 a49b          	and	a,#155
 408  0004 f7            	ld	(x),a
 409                     ; 197   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 411  0005 7b05          	ld	a,(OFST+5,sp)
 412  0007 1a06          	or	a,(OFST+6,sp)
 413  0009 fa            	or	a,(x)
 414  000a f7            	ld	(x),a
 415                     ; 200   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 417  000b e601          	ld	a,(1,x)
 418  000d a47f          	and	a,#127
 419  000f e701          	ld	(1,x),a
 420                     ; 203   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 422  0011 e601          	ld	a,(1,x)
 423  0013 1a07          	or	a,(OFST+7,sp)
 424  0015 e701          	ld	(1,x),a
 425                     ; 204 }
 428  0017 85            	popw	x
 429  0018 81            	ret	
 496                     ; 213 void ADC_Cmd(ADC_TypeDef* ADCx,
 496                     ; 214              FunctionalState NewState)
 496                     ; 215 {
 497                     .text:	section	.text,new
 498  0000               _ADC_Cmd:
 500  0000 89            	pushw	x
 501       00000000      OFST:	set	0
 504                     ; 217   assert_param(IS_FUNCTIONAL_STATE(NewState));
 506                     ; 219   if (NewState != DISABLE)
 508  0001 7b05          	ld	a,(OFST+5,sp)
 509  0003 2705          	jreq	L142
 510                     ; 222     ADCx->CR1 |= ADC_CR1_ADON;
 512  0005 f6            	ld	a,(x)
 513  0006 aa01          	or	a,#1
 515  0008 2005          	jra	L342
 516  000a               L142:
 517                     ; 227     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 519  000a 1e01          	ldw	x,(OFST+1,sp)
 520  000c f6            	ld	a,(x)
 521  000d a4fe          	and	a,#254
 522  000f               L342:
 523  000f f7            	ld	(x),a
 524                     ; 229 }
 527  0010 85            	popw	x
 528  0011 81            	ret	
 566                     ; 236 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 566                     ; 237 {
 567                     .text:	section	.text,new
 568  0000               _ADC_SoftwareStartConv:
 572                     ; 239   ADCx->CR1 |= ADC_CR1_START;
 574  0000 f6            	ld	a,(x)
 575  0001 aa02          	or	a,#2
 576  0003 f7            	ld	(x),a
 577                     ; 240 }
 580  0004 81            	ret	
 708                     ; 258 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 708                     ; 259                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 708                     ; 260                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 708                     ; 261 {
 709                     .text:	section	.text,new
 710  0000               _ADC_ExternalTrigConfig:
 712  0000 89            	pushw	x
 713       00000000      OFST:	set	0
 716                     ; 263   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 718                     ; 264   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 720                     ; 267   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 722  0001 e601          	ld	a,(1,x)
 723  0003 a487          	and	a,#135
 724  0005 e701          	ld	(1,x),a
 725                     ; 271   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 725                     ; 272                           (uint8_t)ADC_ExtEventSelection);
 727  0007 7b06          	ld	a,(OFST+6,sp)
 728  0009 1a05          	or	a,(OFST+5,sp)
 729  000b ea01          	or	a,(1,x)
 730  000d e701          	ld	(1,x),a
 731                     ; 273 }
 734  000f 85            	popw	x
 735  0010 81            	ret	
1049                     ; 336 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1049                     ; 337                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1049                     ; 338 {
1050                     .text:	section	.text,new
1051  0000               _ADC_AnalogWatchdogChannelSelect:
1053  0000 89            	pushw	x
1054       00000000      OFST:	set	0
1057                     ; 340   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1059                     ; 343   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1061  0001 e602          	ld	a,(2,x)
1062  0003 a4e0          	and	a,#224
1063  0005 e702          	ld	(2,x),a
1064                     ; 346   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1066  0007 e602          	ld	a,(2,x)
1067  0009 1a05          	or	a,(OFST+5,sp)
1068  000b e702          	ld	(2,x),a
1069                     ; 347 }
1072  000d 85            	popw	x
1073  000e 81            	ret	
1125                     ; 358 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1125                     ; 359 {
1126                     .text:	section	.text,new
1127  0000               _ADC_AnalogWatchdogThresholdsConfig:
1129  0000 89            	pushw	x
1130       00000000      OFST:	set	0
1133                     ; 361   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1135                     ; 362   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1137                     ; 365   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1139  0001 7b05          	ld	a,(OFST+5,sp)
1140  0003 1e01          	ldw	x,(OFST+1,sp)
1141  0005 e706          	ld	(6,x),a
1142                     ; 366   ADCx->HTRL = (uint8_t)(HighThreshold);
1144  0007 7b06          	ld	a,(OFST+6,sp)
1145  0009 e707          	ld	(7,x),a
1146                     ; 369   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1148  000b 7b07          	ld	a,(OFST+7,sp)
1149  000d e708          	ld	(8,x),a
1150                     ; 370   ADCx->LTRL = (uint8_t)(LowThreshold);
1152  000f 7b08          	ld	a,(OFST+8,sp)
1153  0011 e709          	ld	(9,x),a
1154                     ; 371 }
1157  0013 85            	popw	x
1158  0014 81            	ret	
1221                     ; 409 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1221                     ; 410                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1221                     ; 411                               uint16_t HighThreshold,
1221                     ; 412                               uint16_t LowThreshold)
1221                     ; 413 {
1222                     .text:	section	.text,new
1223  0000               _ADC_AnalogWatchdogConfig:
1225  0000 89            	pushw	x
1226       00000000      OFST:	set	0
1229                     ; 415   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1231                     ; 416   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1233                     ; 417   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1235                     ; 420   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1237  0001 e602          	ld	a,(2,x)
1238  0003 a4e0          	and	a,#224
1239  0005 e702          	ld	(2,x),a
1240                     ; 423   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1242  0007 e602          	ld	a,(2,x)
1243  0009 1a05          	or	a,(OFST+5,sp)
1244  000b e702          	ld	(2,x),a
1245                     ; 426   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1247  000d 7b06          	ld	a,(OFST+6,sp)
1248  000f 1e01          	ldw	x,(OFST+1,sp)
1249  0011 e706          	ld	(6,x),a
1250                     ; 427   ADCx->HTRL = (uint8_t)(HighThreshold);
1252  0013 7b07          	ld	a,(OFST+7,sp)
1253  0015 e707          	ld	(7,x),a
1254                     ; 430   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1256  0017 7b08          	ld	a,(OFST+8,sp)
1257  0019 e708          	ld	(8,x),a
1258                     ; 431   ADCx->LTRL = (uint8_t)LowThreshold;
1260  001b 7b09          	ld	a,(OFST+9,sp)
1261  001d e709          	ld	(9,x),a
1262                     ; 432 }
1265  001f 85            	popw	x
1266  0020 81            	ret	
1301                     ; 471 void ADC_TempSensorCmd(FunctionalState NewState)
1301                     ; 472 {
1302                     .text:	section	.text,new
1303  0000               _ADC_TempSensorCmd:
1307                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
1309                     ; 476   if (NewState != DISABLE)
1311  0000 4d            	tnz	a
1312  0001 2705          	jreq	L165
1313                     ; 479     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1315  0003 721a534e      	bset	21326,#5
1318  0007 81            	ret	
1319  0008               L165:
1320                     ; 484     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1322  0008 721b534e      	bres	21326,#5
1323                     ; 486 }
1326  000c 81            	ret	
1361                     ; 494 void ADC_VrefintCmd(FunctionalState NewState)
1361                     ; 495 {
1362                     .text:	section	.text,new
1363  0000               _ADC_VrefintCmd:
1367                     ; 497   assert_param(IS_FUNCTIONAL_STATE(NewState));
1369                     ; 499   if (NewState != DISABLE)
1371  0000 4d            	tnz	a
1372  0001 2705          	jreq	L306
1373                     ; 502     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1375  0003 7218534e      	bset	21326,#4
1378  0007 81            	ret	
1379  0008               L306:
1380                     ; 507     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1382  0008 7219534e      	bres	21326,#4
1383                     ; 509 }
1386  000c 81            	ret	
1696                     ; 580 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1696                     ; 581 {
1697                     .text:	section	.text,new
1698  0000               _ADC_ChannelCmd:
1700  0000 89            	pushw	x
1701  0001 88            	push	a
1702       00000001      OFST:	set	1
1705                     ; 582   uint8_t regindex = 0;
1707                     ; 584   assert_param(IS_FUNCTIONAL_STATE(NewState));
1709                     ; 586   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1711  0002 7b06          	ld	a,(OFST+5,sp)
1712  0004 6b01          	ld	(OFST+0,sp),a
1713                     ; 588   if (NewState != DISABLE)
1715  0006 0d08          	tnz	(OFST+7,sp)
1716  0008 270d          	jreq	L157
1717                     ; 591     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1719  000a 01            	rrwa	x,a
1720  000b 1b01          	add	a,(OFST+0,sp)
1721  000d 2401          	jrnc	L23
1722  000f 5c            	incw	x
1723  0010               L23:
1724  0010 02            	rlwa	x,a
1725  0011 e60a          	ld	a,(10,x)
1726  0013 1a07          	or	a,(OFST+6,sp)
1728  0015 2010          	jra	L357
1729  0017               L157:
1730                     ; 596     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1732  0017 7b02          	ld	a,(OFST+1,sp)
1733  0019 97            	ld	xl,a
1734  001a 7b03          	ld	a,(OFST+2,sp)
1735  001c 1b01          	add	a,(OFST+0,sp)
1736  001e 2401          	jrnc	L43
1737  0020 5c            	incw	x
1738  0021               L43:
1739  0021 02            	rlwa	x,a
1740  0022 7b07          	ld	a,(OFST+6,sp)
1741  0024 43            	cpl	a
1742  0025 e40a          	and	a,(10,x)
1743  0027               L357:
1744  0027 e70a          	ld	(10,x),a
1745                     ; 598 }
1748  0029 5b03          	addw	sp,#3
1749  002b 81            	ret	
1899                     ; 622 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1899                     ; 623                             ADC_Group_TypeDef ADC_GroupChannels,
1899                     ; 624                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1899                     ; 625 {
1900                     .text:	section	.text,new
1901  0000               _ADC_SamplingTimeConfig:
1903  0000 89            	pushw	x
1904       00000000      OFST:	set	0
1907                     ; 627   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1909                     ; 628   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1911                     ; 630   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1913  0001 7b05          	ld	a,(OFST+5,sp)
1914  0003 2712          	jreq	L1401
1915                     ; 633     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1917  0005 e602          	ld	a,(2,x)
1918  0007 a41f          	and	a,#31
1919  0009 e702          	ld	(2,x),a
1920                     ; 634     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1922  000b 7b06          	ld	a,(OFST+6,sp)
1923  000d 4e            	swap	a
1924  000e 48            	sll	a
1925  000f a4e0          	and	a,#224
1926  0011 ea02          	or	a,(2,x)
1927  0013 e702          	ld	(2,x),a
1929  0015 200e          	jra	L3401
1930  0017               L1401:
1931                     ; 639     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1933  0017 1e01          	ldw	x,(OFST+1,sp)
1934  0019 e601          	ld	a,(1,x)
1935  001b a4f8          	and	a,#248
1936  001d e701          	ld	(1,x),a
1937                     ; 640     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1939  001f e601          	ld	a,(1,x)
1940  0021 1a06          	or	a,(OFST+6,sp)
1941  0023 e701          	ld	(1,x),a
1942  0025               L3401:
1943                     ; 642 }
1946  0025 85            	popw	x
1947  0026 81            	ret	
2012                     ; 688 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
2012                     ; 689                               FunctionalState NewState)
2012                     ; 690 {
2013                     .text:	section	.text,new
2014  0000               _ADC_SchmittTriggerConfig:
2016  0000 89            	pushw	x
2017  0001 88            	push	a
2018       00000001      OFST:	set	1
2021                     ; 691   uint8_t regindex = 0;
2023                     ; 693   assert_param(IS_FUNCTIONAL_STATE(NewState));
2025                     ; 695   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
2027  0002 7b06          	ld	a,(OFST+5,sp)
2028  0004 6b01          	ld	(OFST+0,sp),a
2029                     ; 697   if (NewState != DISABLE)
2031  0006 0d08          	tnz	(OFST+7,sp)
2032  0008 270e          	jreq	L7701
2033                     ; 700     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2035  000a 01            	rrwa	x,a
2036  000b 1b01          	add	a,(OFST+0,sp)
2037  000d 2401          	jrnc	L24
2038  000f 5c            	incw	x
2039  0010               L24:
2040  0010 02            	rlwa	x,a
2041  0011 7b07          	ld	a,(OFST+6,sp)
2042  0013 43            	cpl	a
2043  0014 e40e          	and	a,(14,x)
2045  0016 200f          	jra	L1011
2046  0018               L7701:
2047                     ; 705     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2049  0018 7b02          	ld	a,(OFST+1,sp)
2050  001a 97            	ld	xl,a
2051  001b 7b03          	ld	a,(OFST+2,sp)
2052  001d 1b01          	add	a,(OFST+0,sp)
2053  001f 2401          	jrnc	L44
2054  0021 5c            	incw	x
2055  0022               L44:
2056  0022 02            	rlwa	x,a
2057  0023 e60e          	ld	a,(14,x)
2058  0025 1a07          	or	a,(OFST+6,sp)
2059  0027               L1011:
2060  0027 e70e          	ld	(14,x),a
2061                     ; 707 }
2064  0029 5b03          	addw	sp,#3
2065  002b 81            	ret	
2110                     ; 714 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2110                     ; 715 {
2111                     .text:	section	.text,new
2112  0000               _ADC_GetConversionValue:
2114  0000 89            	pushw	x
2115  0001 89            	pushw	x
2116       00000002      OFST:	set	2
2119                     ; 716   uint16_t tmpreg = 0;
2121                     ; 719   tmpreg = (uint16_t)(ADCx->DRH);
2123  0002 e604          	ld	a,(4,x)
2124  0004 97            	ld	xl,a
2125                     ; 720   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2127  0005 1603          	ldw	y,(OFST+1,sp)
2128  0007 90e605        	ld	a,(5,y)
2129  000a 02            	rlwa	x,a
2130                     ; 723   return (uint16_t)(tmpreg) ;
2134  000b 5b04          	addw	sp,#4
2135  000d 81            	ret	
2182                     ; 757 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2182                     ; 758 {
2183                     .text:	section	.text,new
2184  0000               _ADC_DMACmd:
2186  0000 89            	pushw	x
2187       00000000      OFST:	set	0
2190                     ; 760   assert_param(IS_FUNCTIONAL_STATE(NewState));
2192                     ; 762   if (NewState != DISABLE)
2194  0001 7b05          	ld	a,(OFST+5,sp)
2195  0003 2706          	jreq	L1511
2196                     ; 765     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2198  0005 e60a          	ld	a,(10,x)
2199  0007 a47f          	and	a,#127
2201  0009 2006          	jra	L3511
2202  000b               L1511:
2203                     ; 770     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2205  000b 1e01          	ldw	x,(OFST+1,sp)
2206  000d e60a          	ld	a,(10,x)
2207  000f aa80          	or	a,#128
2208  0011               L3511:
2209  0011 e70a          	ld	(10,x),a
2210                     ; 772 }
2213  0013 85            	popw	x
2214  0014 81            	ret	
2298                     ; 828 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2298                     ; 829 {
2299                     .text:	section	.text,new
2300  0000               _ADC_ITConfig:
2302  0000 89            	pushw	x
2303       00000000      OFST:	set	0
2306                     ; 831   assert_param(IS_FUNCTIONAL_STATE(NewState));
2308                     ; 832   assert_param(IS_ADC_IT(ADC_IT));
2310                     ; 834   if (NewState != DISABLE)
2312  0001 7b06          	ld	a,(OFST+6,sp)
2313  0003 2705          	jreq	L7121
2314                     ; 837     ADCx->CR1 |= (uint8_t) ADC_IT;
2316  0005 f6            	ld	a,(x)
2317  0006 1a05          	or	a,(OFST+5,sp)
2319  0008 2006          	jra	L1221
2320  000a               L7121:
2321                     ; 842     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2323  000a 1e01          	ldw	x,(OFST+1,sp)
2324  000c 7b05          	ld	a,(OFST+5,sp)
2325  000e 43            	cpl	a
2326  000f f4            	and	a,(x)
2327  0010               L1221:
2328  0010 f7            	ld	(x),a
2329                     ; 844 }
2332  0011 85            	popw	x
2333  0012 81            	ret	
2438                     ; 856 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2438                     ; 857 {
2439                     .text:	section	.text,new
2440  0000               _ADC_GetFlagStatus:
2442  0000 89            	pushw	x
2443  0001 88            	push	a
2444       00000001      OFST:	set	1
2447                     ; 858   FlagStatus flagstatus = RESET;
2449                     ; 861   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2451                     ; 864   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2453  0002 e603          	ld	a,(3,x)
2454  0004 1506          	bcp	a,(OFST+5,sp)
2455  0006 2704          	jreq	L5721
2456                     ; 867     flagstatus = SET;
2458  0008 a601          	ld	a,#1
2460  000a 2001          	jra	L7721
2461  000c               L5721:
2462                     ; 872     flagstatus = RESET;
2464  000c 4f            	clr	a
2465  000d               L7721:
2466                     ; 876   return  flagstatus;
2470  000d 5b03          	addw	sp,#3
2471  000f 81            	ret	
2518                     ; 889 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2518                     ; 890                    ADC_FLAG_TypeDef ADC_FLAG)
2518                     ; 891 {
2519                     .text:	section	.text,new
2520  0000               _ADC_ClearFlag:
2522  0000 89            	pushw	x
2523       00000000      OFST:	set	0
2526                     ; 893   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2528                     ; 896   ADCx->SR = (uint8_t)~ADC_FLAG;
2530  0001 7b05          	ld	a,(OFST+5,sp)
2531  0003 43            	cpl	a
2532  0004 1e01          	ldw	x,(OFST+1,sp)
2533  0006 e703          	ld	(3,x),a
2534                     ; 897 }
2537  0008 85            	popw	x
2538  0009 81            	ret	
2610                     ; 909 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2610                     ; 910                          ADC_IT_TypeDef ADC_IT)
2610                     ; 911 {
2611                     .text:	section	.text,new
2612  0000               _ADC_GetITStatus:
2614  0000 89            	pushw	x
2615  0001 5203          	subw	sp,#3
2616       00000003      OFST:	set	3
2619                     ; 912   ITStatus itstatus = RESET;
2621                     ; 913   uint8_t itmask = 0, enablestatus = 0;
2625                     ; 916   assert_param(IS_ADC_GET_IT(ADC_IT));
2627                     ; 919   itmask = (uint8_t)(ADC_IT >> 3);
2629  0003 7b08          	ld	a,(OFST+5,sp)
2630  0005 44            	srl	a
2631  0006 44            	srl	a
2632  0007 44            	srl	a
2633  0008 6b03          	ld	(OFST+0,sp),a
2634                     ; 920   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2634                     ; 921                                 (uint8_t)(itmask & (uint8_t)0x03));
2636  000a a403          	and	a,#3
2637  000c 6b01          	ld	(OFST-2,sp),a
2638  000e 7b03          	ld	a,(OFST+0,sp)
2639  0010 a410          	and	a,#16
2640  0012 44            	srl	a
2641  0013 44            	srl	a
2642  0014 1a01          	or	a,(OFST-2,sp)
2643  0016 6b03          	ld	(OFST+0,sp),a
2644                     ; 924   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2646  0018 f6            	ld	a,(x)
2647  0019 1408          	and	a,(OFST+5,sp)
2648  001b 6b02          	ld	(OFST-1,sp),a
2649                     ; 927   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2651  001d e603          	ld	a,(3,x)
2652  001f 1503          	bcp	a,(OFST+0,sp)
2653  0021 2708          	jreq	L1631
2655  0023 7b02          	ld	a,(OFST-1,sp)
2656  0025 2704          	jreq	L1631
2657                     ; 930     itstatus = SET;
2659  0027 a601          	ld	a,#1
2661  0029 2001          	jra	L3631
2662  002b               L1631:
2663                     ; 935     itstatus = RESET;
2665  002b 4f            	clr	a
2666  002c               L3631:
2667                     ; 939   return  itstatus;
2671  002c 5b05          	addw	sp,#5
2672  002e 81            	ret	
2727                     ; 952 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2727                     ; 953                            ADC_IT_TypeDef ADC_IT)
2727                     ; 954 {
2728                     .text:	section	.text,new
2729  0000               _ADC_ClearITPendingBit:
2731  0000 89            	pushw	x
2732  0001 89            	pushw	x
2733       00000002      OFST:	set	2
2736                     ; 955   uint8_t itmask = 0;
2738                     ; 958   assert_param(IS_ADC_IT(ADC_IT));
2740                     ; 961   itmask = (uint8_t)(ADC_IT >> 3);
2742  0002 7b07          	ld	a,(OFST+5,sp)
2743  0004 44            	srl	a
2744  0005 44            	srl	a
2745  0006 44            	srl	a
2746  0007 6b02          	ld	(OFST+0,sp),a
2747                     ; 962   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2747                     ; 963                                  (uint8_t)(itmask & (uint8_t)0x03));
2749  0009 a403          	and	a,#3
2750  000b 6b01          	ld	(OFST-1,sp),a
2751  000d 7b02          	ld	a,(OFST+0,sp)
2752  000f a410          	and	a,#16
2753  0011 44            	srl	a
2754  0012 44            	srl	a
2755  0013 1a01          	or	a,(OFST-1,sp)
2756  0015 6b02          	ld	(OFST+0,sp),a
2757                     ; 966   ADCx->SR = (uint8_t)~itmask;
2759  0017 43            	cpl	a
2760  0018 1e03          	ldw	x,(OFST+1,sp)
2761  001a e703          	ld	(3,x),a
2762                     ; 967 }
2765  001c 5b04          	addw	sp,#4
2766  001e 81            	ret	
2779                     	xdef	_ADC_ClearITPendingBit
2780                     	xdef	_ADC_GetITStatus
2781                     	xdef	_ADC_ClearFlag
2782                     	xdef	_ADC_GetFlagStatus
2783                     	xdef	_ADC_ITConfig
2784                     	xdef	_ADC_DMACmd
2785                     	xdef	_ADC_GetConversionValue
2786                     	xdef	_ADC_SchmittTriggerConfig
2787                     	xdef	_ADC_SamplingTimeConfig
2788                     	xdef	_ADC_ChannelCmd
2789                     	xdef	_ADC_VrefintCmd
2790                     	xdef	_ADC_TempSensorCmd
2791                     	xdef	_ADC_AnalogWatchdogConfig
2792                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2793                     	xdef	_ADC_AnalogWatchdogChannelSelect
2794                     	xdef	_ADC_ExternalTrigConfig
2795                     	xdef	_ADC_SoftwareStartConv
2796                     	xdef	_ADC_Cmd
2797                     	xdef	_ADC_Init
2798                     	xdef	_ADC_DeInit
2817                     	end
