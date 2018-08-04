   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 181                     ; 132 void ADC_DeInit(ADC_TypeDef* ADCx)
 181                     ; 133 {
 182                     .text:	section	.text,new
 183  0000               f_ADC_DeInit:
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
 242  0027 87            	retf	
 388                     ; 183 void ADC_Init(ADC_TypeDef* ADCx,
 388                     ; 184               ADC_ConversionMode_TypeDef ADC_ConversionMode,
 388                     ; 185               ADC_Resolution_TypeDef ADC_Resolution,
 388                     ; 186               ADC_Prescaler_TypeDef ADC_Prescaler)
 388                     ; 187 {
 389                     .text:	section	.text,new
 390  0000               f_ADC_Init:
 392  0000 89            	pushw	x
 393       00000000      OFST:	set	0
 396                     ; 189   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 398                     ; 190   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 400                     ; 191   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 402                     ; 194   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 404  0001 f6            	ld	a,(x)
 405  0002 a49b          	and	a,#155
 406  0004 f7            	ld	(x),a
 407                     ; 197   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 409  0005 7b06          	ld	a,(OFST+6,sp)
 410  0007 1a07          	or	a,(OFST+7,sp)
 411  0009 fa            	or	a,(x)
 412  000a f7            	ld	(x),a
 413                     ; 200   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 415  000b e601          	ld	a,(1,x)
 416  000d a47f          	and	a,#127
 417  000f e701          	ld	(1,x),a
 418                     ; 203   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 420  0011 e601          	ld	a,(1,x)
 421  0013 1a08          	or	a,(OFST+8,sp)
 422  0015 e701          	ld	(1,x),a
 423                     ; 204 }
 426  0017 85            	popw	x
 427  0018 87            	retf	
 493                     ; 213 void ADC_Cmd(ADC_TypeDef* ADCx,
 493                     ; 214              FunctionalState NewState)
 493                     ; 215 {
 494                     .text:	section	.text,new
 495  0000               f_ADC_Cmd:
 497  0000 89            	pushw	x
 498       00000000      OFST:	set	0
 501                     ; 217   assert_param(IS_FUNCTIONAL_STATE(NewState));
 503                     ; 219   if (NewState != DISABLE)
 505  0001 7b06          	ld	a,(OFST+6,sp)
 506  0003 2705          	jreq	L142
 507                     ; 222     ADCx->CR1 |= ADC_CR1_ADON;
 509  0005 f6            	ld	a,(x)
 510  0006 aa01          	or	a,#1
 512  0008 2005          	jra	L342
 513  000a               L142:
 514                     ; 227     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 516  000a 1e01          	ldw	x,(OFST+1,sp)
 517  000c f6            	ld	a,(x)
 518  000d a4fe          	and	a,#254
 519  000f               L342:
 520  000f f7            	ld	(x),a
 521                     ; 229 }
 524  0010 85            	popw	x
 525  0011 87            	retf	
 562                     ; 236 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 562                     ; 237 {
 563                     .text:	section	.text,new
 564  0000               f_ADC_SoftwareStartConv:
 568                     ; 239   ADCx->CR1 |= ADC_CR1_START;
 570  0000 f6            	ld	a,(x)
 571  0001 aa02          	or	a,#2
 572  0003 f7            	ld	(x),a
 573                     ; 240 }
 576  0004 87            	retf	
 703                     ; 258 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 703                     ; 259                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 703                     ; 260                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 703                     ; 261 {
 704                     .text:	section	.text,new
 705  0000               f_ADC_ExternalTrigConfig:
 707  0000 89            	pushw	x
 708       00000000      OFST:	set	0
 711                     ; 263   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 713                     ; 264   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 715                     ; 267   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 717  0001 e601          	ld	a,(1,x)
 718  0003 a487          	and	a,#135
 719  0005 e701          	ld	(1,x),a
 720                     ; 271   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 720                     ; 272                           (uint8_t)ADC_ExtEventSelection);
 722  0007 7b07          	ld	a,(OFST+7,sp)
 723  0009 1a06          	or	a,(OFST+6,sp)
 724  000b ea01          	or	a,(1,x)
 725  000d e701          	ld	(1,x),a
 726                     ; 273 }
 729  000f 85            	popw	x
 730  0010 87            	retf	
1043                     ; 336 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1043                     ; 337                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1043                     ; 338 {
1044                     .text:	section	.text,new
1045  0000               f_ADC_AnalogWatchdogChannelSelect:
1047  0000 89            	pushw	x
1048       00000000      OFST:	set	0
1051                     ; 340   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1053                     ; 343   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1055  0001 e602          	ld	a,(2,x)
1056  0003 a4e0          	and	a,#224
1057  0005 e702          	ld	(2,x),a
1058                     ; 346   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1060  0007 e602          	ld	a,(2,x)
1061  0009 1a06          	or	a,(OFST+6,sp)
1062  000b e702          	ld	(2,x),a
1063                     ; 347 }
1066  000d 85            	popw	x
1067  000e 87            	retf	
1118                     ; 358 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1118                     ; 359 {
1119                     .text:	section	.text,new
1120  0000               f_ADC_AnalogWatchdogThresholdsConfig:
1122  0000 89            	pushw	x
1123       00000000      OFST:	set	0
1126                     ; 361   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1128                     ; 362   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1130                     ; 365   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1132  0001 7b06          	ld	a,(OFST+6,sp)
1133  0003 1e01          	ldw	x,(OFST+1,sp)
1134  0005 e706          	ld	(6,x),a
1135                     ; 366   ADCx->HTRL = (uint8_t)(HighThreshold);
1137  0007 7b07          	ld	a,(OFST+7,sp)
1138  0009 e707          	ld	(7,x),a
1139                     ; 369   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1141  000b 7b08          	ld	a,(OFST+8,sp)
1142  000d e708          	ld	(8,x),a
1143                     ; 370   ADCx->LTRL = (uint8_t)(LowThreshold);
1145  000f 7b09          	ld	a,(OFST+9,sp)
1146  0011 e709          	ld	(9,x),a
1147                     ; 371 }
1150  0013 85            	popw	x
1151  0014 87            	retf	
1213                     ; 409 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1213                     ; 410                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1213                     ; 411                               uint16_t HighThreshold,
1213                     ; 412                               uint16_t LowThreshold)
1213                     ; 413 {
1214                     .text:	section	.text,new
1215  0000               f_ADC_AnalogWatchdogConfig:
1217  0000 89            	pushw	x
1218       00000000      OFST:	set	0
1221                     ; 415   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1223                     ; 416   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1225                     ; 417   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1227                     ; 420   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1229  0001 e602          	ld	a,(2,x)
1230  0003 a4e0          	and	a,#224
1231  0005 e702          	ld	(2,x),a
1232                     ; 423   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1234  0007 e602          	ld	a,(2,x)
1235  0009 1a06          	or	a,(OFST+6,sp)
1236  000b e702          	ld	(2,x),a
1237                     ; 426   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1239  000d 7b07          	ld	a,(OFST+7,sp)
1240  000f 1e01          	ldw	x,(OFST+1,sp)
1241  0011 e706          	ld	(6,x),a
1242                     ; 427   ADCx->HTRL = (uint8_t)(HighThreshold);
1244  0013 7b08          	ld	a,(OFST+8,sp)
1245  0015 e707          	ld	(7,x),a
1246                     ; 430   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1248  0017 7b09          	ld	a,(OFST+9,sp)
1249  0019 e708          	ld	(8,x),a
1250                     ; 431   ADCx->LTRL = (uint8_t)LowThreshold;
1252  001b 7b0a          	ld	a,(OFST+10,sp)
1253  001d e709          	ld	(9,x),a
1254                     ; 432 }
1257  001f 85            	popw	x
1258  0020 87            	retf	
1292                     ; 471 void ADC_TempSensorCmd(FunctionalState NewState)
1292                     ; 472 {
1293                     .text:	section	.text,new
1294  0000               f_ADC_TempSensorCmd:
1298                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
1300                     ; 476   if (NewState != DISABLE)
1302  0000 4d            	tnz	a
1303  0001 2705          	jreq	L165
1304                     ; 479     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1306  0003 721a534e      	bset	21326,#5
1309  0007 87            	retf	
1310  0008               L165:
1311                     ; 484     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1313  0008 721b534e      	bres	21326,#5
1314                     ; 486 }
1317  000c 87            	retf	
1351                     ; 494 void ADC_VrefintCmd(FunctionalState NewState)
1351                     ; 495 {
1352                     .text:	section	.text,new
1353  0000               f_ADC_VrefintCmd:
1357                     ; 497   assert_param(IS_FUNCTIONAL_STATE(NewState));
1359                     ; 499   if (NewState != DISABLE)
1361  0000 4d            	tnz	a
1362  0001 2705          	jreq	L306
1363                     ; 502     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1365  0003 7218534e      	bset	21326,#4
1368  0007 87            	retf	
1369  0008               L306:
1370                     ; 507     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1372  0008 7219534e      	bres	21326,#4
1373                     ; 509 }
1376  000c 87            	retf	
1685                     ; 580 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1685                     ; 581 {
1686                     .text:	section	.text,new
1687  0000               f_ADC_ChannelCmd:
1689  0000 89            	pushw	x
1690  0001 88            	push	a
1691       00000001      OFST:	set	1
1694                     ; 582   uint8_t regindex = 0;
1696                     ; 584   assert_param(IS_FUNCTIONAL_STATE(NewState));
1698                     ; 586   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1700  0002 7b07          	ld	a,(OFST+6,sp)
1701  0004 6b01          	ld	(OFST+0,sp),a
1702                     ; 588   if (NewState != DISABLE)
1704  0006 0d09          	tnz	(OFST+8,sp)
1705  0008 270d          	jreq	L157
1706                     ; 591     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1708  000a 01            	rrwa	x,a
1709  000b 1b01          	add	a,(OFST+0,sp)
1710  000d 2401          	jrnc	L23
1711  000f 5c            	incw	x
1712  0010               L23:
1713  0010 02            	rlwa	x,a
1714  0011 e60a          	ld	a,(10,x)
1715  0013 1a08          	or	a,(OFST+7,sp)
1717  0015 2010          	jra	L357
1718  0017               L157:
1719                     ; 596     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1721  0017 7b02          	ld	a,(OFST+1,sp)
1722  0019 97            	ld	xl,a
1723  001a 7b03          	ld	a,(OFST+2,sp)
1724  001c 1b01          	add	a,(OFST+0,sp)
1725  001e 2401          	jrnc	L43
1726  0020 5c            	incw	x
1727  0021               L43:
1728  0021 02            	rlwa	x,a
1729  0022 7b08          	ld	a,(OFST+7,sp)
1730  0024 43            	cpl	a
1731  0025 e40a          	and	a,(10,x)
1732  0027               L357:
1733  0027 e70a          	ld	(10,x),a
1734                     ; 598 }
1737  0029 5b03          	addw	sp,#3
1738  002b 87            	retf	
1887                     ; 622 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1887                     ; 623                             ADC_Group_TypeDef ADC_GroupChannels,
1887                     ; 624                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1887                     ; 625 {
1888                     .text:	section	.text,new
1889  0000               f_ADC_SamplingTimeConfig:
1891  0000 89            	pushw	x
1892       00000000      OFST:	set	0
1895                     ; 627   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1897                     ; 628   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1899                     ; 630   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1901  0001 7b06          	ld	a,(OFST+6,sp)
1902  0003 2712          	jreq	L1401
1903                     ; 633     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1905  0005 e602          	ld	a,(2,x)
1906  0007 a41f          	and	a,#31
1907  0009 e702          	ld	(2,x),a
1908                     ; 634     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1910  000b 7b07          	ld	a,(OFST+7,sp)
1911  000d 4e            	swap	a
1912  000e 48            	sll	a
1913  000f a4e0          	and	a,#224
1914  0011 ea02          	or	a,(2,x)
1915  0013 e702          	ld	(2,x),a
1917  0015 200e          	jra	L3401
1918  0017               L1401:
1919                     ; 639     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1921  0017 1e01          	ldw	x,(OFST+1,sp)
1922  0019 e601          	ld	a,(1,x)
1923  001b a4f8          	and	a,#248
1924  001d e701          	ld	(1,x),a
1925                     ; 640     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1927  001f e601          	ld	a,(1,x)
1928  0021 1a07          	or	a,(OFST+7,sp)
1929  0023 e701          	ld	(1,x),a
1930  0025               L3401:
1931                     ; 642 }
1934  0025 85            	popw	x
1935  0026 87            	retf	
1999                     ; 688 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
1999                     ; 689                               FunctionalState NewState)
1999                     ; 690 {
2000                     .text:	section	.text,new
2001  0000               f_ADC_SchmittTriggerConfig:
2003  0000 89            	pushw	x
2004  0001 88            	push	a
2005       00000001      OFST:	set	1
2008                     ; 691   uint8_t regindex = 0;
2010                     ; 693   assert_param(IS_FUNCTIONAL_STATE(NewState));
2012                     ; 695   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
2014  0002 7b07          	ld	a,(OFST+6,sp)
2015  0004 6b01          	ld	(OFST+0,sp),a
2016                     ; 697   if (NewState != DISABLE)
2018  0006 0d09          	tnz	(OFST+8,sp)
2019  0008 270e          	jreq	L7701
2020                     ; 700     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2022  000a 01            	rrwa	x,a
2023  000b 1b01          	add	a,(OFST+0,sp)
2024  000d 2401          	jrnc	L24
2025  000f 5c            	incw	x
2026  0010               L24:
2027  0010 02            	rlwa	x,a
2028  0011 7b08          	ld	a,(OFST+7,sp)
2029  0013 43            	cpl	a
2030  0014 e40e          	and	a,(14,x)
2032  0016 200f          	jra	L1011
2033  0018               L7701:
2034                     ; 705     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2036  0018 7b02          	ld	a,(OFST+1,sp)
2037  001a 97            	ld	xl,a
2038  001b 7b03          	ld	a,(OFST+2,sp)
2039  001d 1b01          	add	a,(OFST+0,sp)
2040  001f 2401          	jrnc	L44
2041  0021 5c            	incw	x
2042  0022               L44:
2043  0022 02            	rlwa	x,a
2044  0023 e60e          	ld	a,(14,x)
2045  0025 1a08          	or	a,(OFST+7,sp)
2046  0027               L1011:
2047  0027 e70e          	ld	(14,x),a
2048                     ; 707 }
2051  0029 5b03          	addw	sp,#3
2052  002b 87            	retf	
2096                     ; 714 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2096                     ; 715 {
2097                     .text:	section	.text,new
2098  0000               f_ADC_GetConversionValue:
2100  0000 89            	pushw	x
2101  0001 89            	pushw	x
2102       00000002      OFST:	set	2
2105                     ; 716   uint16_t tmpreg = 0;
2107                     ; 719   tmpreg = (uint16_t)(ADCx->DRH);
2109  0002 e604          	ld	a,(4,x)
2110  0004 97            	ld	xl,a
2111                     ; 720   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2113  0005 1603          	ldw	y,(OFST+1,sp)
2114  0007 90e605        	ld	a,(5,y)
2115  000a 02            	rlwa	x,a
2116                     ; 723   return (uint16_t)(tmpreg) ;
2120  000b 5b04          	addw	sp,#4
2121  000d 87            	retf	
2167                     ; 757 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2167                     ; 758 {
2168                     .text:	section	.text,new
2169  0000               f_ADC_DMACmd:
2171  0000 89            	pushw	x
2172       00000000      OFST:	set	0
2175                     ; 760   assert_param(IS_FUNCTIONAL_STATE(NewState));
2177                     ; 762   if (NewState != DISABLE)
2179  0001 7b06          	ld	a,(OFST+6,sp)
2180  0003 2706          	jreq	L1511
2181                     ; 765     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2183  0005 e60a          	ld	a,(10,x)
2184  0007 a47f          	and	a,#127
2186  0009 2006          	jra	L3511
2187  000b               L1511:
2188                     ; 770     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2190  000b 1e01          	ldw	x,(OFST+1,sp)
2191  000d e60a          	ld	a,(10,x)
2192  000f aa80          	or	a,#128
2193  0011               L3511:
2194  0011 e70a          	ld	(10,x),a
2195                     ; 772 }
2198  0013 85            	popw	x
2199  0014 87            	retf	
2282                     ; 828 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2282                     ; 829 {
2283                     .text:	section	.text,new
2284  0000               f_ADC_ITConfig:
2286  0000 89            	pushw	x
2287       00000000      OFST:	set	0
2290                     ; 831   assert_param(IS_FUNCTIONAL_STATE(NewState));
2292                     ; 832   assert_param(IS_ADC_IT(ADC_IT));
2294                     ; 834   if (NewState != DISABLE)
2296  0001 7b07          	ld	a,(OFST+7,sp)
2297  0003 2705          	jreq	L7121
2298                     ; 837     ADCx->CR1 |= (uint8_t) ADC_IT;
2300  0005 f6            	ld	a,(x)
2301  0006 1a06          	or	a,(OFST+6,sp)
2303  0008 2006          	jra	L1221
2304  000a               L7121:
2305                     ; 842     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2307  000a 1e01          	ldw	x,(OFST+1,sp)
2308  000c 7b06          	ld	a,(OFST+6,sp)
2309  000e 43            	cpl	a
2310  000f f4            	and	a,(x)
2311  0010               L1221:
2312  0010 f7            	ld	(x),a
2313                     ; 844 }
2316  0011 85            	popw	x
2317  0012 87            	retf	
2421                     ; 856 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2421                     ; 857 {
2422                     .text:	section	.text,new
2423  0000               f_ADC_GetFlagStatus:
2425  0000 89            	pushw	x
2426  0001 88            	push	a
2427       00000001      OFST:	set	1
2430                     ; 858   FlagStatus flagstatus = RESET;
2432                     ; 861   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2434                     ; 864   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2436  0002 e603          	ld	a,(3,x)
2437  0004 1507          	bcp	a,(OFST+6,sp)
2438  0006 2704          	jreq	L5721
2439                     ; 867     flagstatus = SET;
2441  0008 a601          	ld	a,#1
2443  000a 2001          	jra	L7721
2444  000c               L5721:
2445                     ; 872     flagstatus = RESET;
2447  000c 4f            	clr	a
2448  000d               L7721:
2449                     ; 876   return  flagstatus;
2453  000d 5b03          	addw	sp,#3
2454  000f 87            	retf	
2500                     ; 889 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2500                     ; 890                    ADC_FLAG_TypeDef ADC_FLAG)
2500                     ; 891 {
2501                     .text:	section	.text,new
2502  0000               f_ADC_ClearFlag:
2504  0000 89            	pushw	x
2505       00000000      OFST:	set	0
2508                     ; 893   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2510                     ; 896   ADCx->SR = (uint8_t)~ADC_FLAG;
2512  0001 7b06          	ld	a,(OFST+6,sp)
2513  0003 43            	cpl	a
2514  0004 1e01          	ldw	x,(OFST+1,sp)
2515  0006 e703          	ld	(3,x),a
2516                     ; 897 }
2519  0008 85            	popw	x
2520  0009 87            	retf	
2591                     ; 909 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2591                     ; 910                          ADC_IT_TypeDef ADC_IT)
2591                     ; 911 {
2592                     .text:	section	.text,new
2593  0000               f_ADC_GetITStatus:
2595  0000 89            	pushw	x
2596  0001 5203          	subw	sp,#3
2597       00000003      OFST:	set	3
2600                     ; 912   ITStatus itstatus = RESET;
2602                     ; 913   uint8_t itmask = 0, enablestatus = 0;
2606                     ; 916   assert_param(IS_ADC_GET_IT(ADC_IT));
2608                     ; 919   itmask = (uint8_t)(ADC_IT >> 3);
2610  0003 7b09          	ld	a,(OFST+6,sp)
2611  0005 44            	srl	a
2612  0006 44            	srl	a
2613  0007 44            	srl	a
2614  0008 6b03          	ld	(OFST+0,sp),a
2615                     ; 920   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2615                     ; 921                                 (uint8_t)(itmask & (uint8_t)0x03));
2617  000a a403          	and	a,#3
2618  000c 6b01          	ld	(OFST-2,sp),a
2619  000e 7b03          	ld	a,(OFST+0,sp)
2620  0010 a410          	and	a,#16
2621  0012 44            	srl	a
2622  0013 44            	srl	a
2623  0014 1a01          	or	a,(OFST-2,sp)
2624  0016 6b03          	ld	(OFST+0,sp),a
2625                     ; 924   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2627  0018 f6            	ld	a,(x)
2628  0019 1409          	and	a,(OFST+6,sp)
2629  001b 6b02          	ld	(OFST-1,sp),a
2630                     ; 927   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2632  001d e603          	ld	a,(3,x)
2633  001f 1503          	bcp	a,(OFST+0,sp)
2634  0021 2708          	jreq	L1631
2636  0023 7b02          	ld	a,(OFST-1,sp)
2637  0025 2704          	jreq	L1631
2638                     ; 930     itstatus = SET;
2640  0027 a601          	ld	a,#1
2642  0029 2001          	jra	L3631
2643  002b               L1631:
2644                     ; 935     itstatus = RESET;
2646  002b 4f            	clr	a
2647  002c               L3631:
2648                     ; 939   return  itstatus;
2652  002c 5b05          	addw	sp,#5
2653  002e 87            	retf	
2707                     ; 952 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2707                     ; 953                            ADC_IT_TypeDef ADC_IT)
2707                     ; 954 {
2708                     .text:	section	.text,new
2709  0000               f_ADC_ClearITPendingBit:
2711  0000 89            	pushw	x
2712  0001 89            	pushw	x
2713       00000002      OFST:	set	2
2716                     ; 955   uint8_t itmask = 0;
2718                     ; 958   assert_param(IS_ADC_IT(ADC_IT));
2720                     ; 961   itmask = (uint8_t)(ADC_IT >> 3);
2722  0002 7b08          	ld	a,(OFST+6,sp)
2723  0004 44            	srl	a
2724  0005 44            	srl	a
2725  0006 44            	srl	a
2726  0007 6b02          	ld	(OFST+0,sp),a
2727                     ; 962   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2727                     ; 963                                  (uint8_t)(itmask & (uint8_t)0x03));
2729  0009 a403          	and	a,#3
2730  000b 6b01          	ld	(OFST-1,sp),a
2731  000d 7b02          	ld	a,(OFST+0,sp)
2732  000f a410          	and	a,#16
2733  0011 44            	srl	a
2734  0012 44            	srl	a
2735  0013 1a01          	or	a,(OFST-1,sp)
2736  0015 6b02          	ld	(OFST+0,sp),a
2737                     ; 966   ADCx->SR = (uint8_t)~itmask;
2739  0017 43            	cpl	a
2740  0018 1e03          	ldw	x,(OFST+1,sp)
2741  001a e703          	ld	(3,x),a
2742                     ; 967 }
2745  001c 5b04          	addw	sp,#4
2746  001e 87            	retf	
2758                     	xdef	f_ADC_ClearITPendingBit
2759                     	xdef	f_ADC_GetITStatus
2760                     	xdef	f_ADC_ClearFlag
2761                     	xdef	f_ADC_GetFlagStatus
2762                     	xdef	f_ADC_ITConfig
2763                     	xdef	f_ADC_DMACmd
2764                     	xdef	f_ADC_GetConversionValue
2765                     	xdef	f_ADC_SchmittTriggerConfig
2766                     	xdef	f_ADC_SamplingTimeConfig
2767                     	xdef	f_ADC_ChannelCmd
2768                     	xdef	f_ADC_VrefintCmd
2769                     	xdef	f_ADC_TempSensorCmd
2770                     	xdef	f_ADC_AnalogWatchdogConfig
2771                     	xdef	f_ADC_AnalogWatchdogThresholdsConfig
2772                     	xdef	f_ADC_AnalogWatchdogChannelSelect
2773                     	xdef	f_ADC_ExternalTrigConfig
2774                     	xdef	f_ADC_SoftwareStartConv
2775                     	xdef	f_ADC_Cmd
2776                     	xdef	f_ADC_Init
2777                     	xdef	f_ADC_DeInit
2796                     	end
