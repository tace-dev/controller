   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
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
 394       fffffffe      OFST: set -2
 397                     ; 189   assert_param(IS_ADC_CONVERSION_MODE(ADC_ConversionMode));
 399                     ; 190   assert_param(IS_ADC_RESOLUTION(ADC_Resolution));
 401                     ; 191   assert_param(IS_ADC_PRESCALER(ADC_Prescaler));
 403                     ; 194   ADCx->CR1 &= (uint8_t)~(ADC_CR1_CONT | ADC_CR1_RES);
 405  0000 f6            	ld	a,(x)
 406  0001 a49b          	and	a,#155
 407  0003 f7            	ld	(x),a
 408                     ; 197   ADCx->CR1 |= (uint8_t)((uint8_t)ADC_ConversionMode | (uint8_t)ADC_Resolution);
 410  0004 7b03          	ld	a,(OFST+5,sp)
 411  0006 1a04          	or	a,(OFST+6,sp)
 412  0008 fa            	or	a,(x)
 413  0009 f7            	ld	(x),a
 414                     ; 200   ADCx->CR2 &= (uint8_t)~(ADC_CR2_PRESC);
 416  000a e601          	ld	a,(1,x)
 417  000c a47f          	and	a,#127
 418  000e e701          	ld	(1,x),a
 419                     ; 203   ADCx->CR2 |= (uint8_t) ADC_Prescaler;
 421  0010 e601          	ld	a,(1,x)
 422  0012 1a05          	or	a,(OFST+7,sp)
 423  0014 e701          	ld	(1,x),a
 424                     ; 204 }
 427  0016 81            	ret	
 494                     ; 213 void ADC_Cmd(ADC_TypeDef* ADCx,
 494                     ; 214              FunctionalState NewState)
 494                     ; 215 {
 495                     .text:	section	.text,new
 496  0000               _ADC_Cmd:
 498       fffffffe      OFST: set -2
 501                     ; 217   assert_param(IS_FUNCTIONAL_STATE(NewState));
 503                     ; 219   if (NewState != DISABLE)
 505  0000 7b03          	ld	a,(OFST+5,sp)
 506  0002 2705          	jreq	L142
 507                     ; 222     ADCx->CR1 |= ADC_CR1_ADON;
 509  0004 f6            	ld	a,(x)
 510  0005 aa01          	or	a,#1
 512  0007 2003          	jra	L342
 513  0009               L142:
 514                     ; 227     ADCx->CR1 &= (uint8_t)~ADC_CR1_ADON;
 516  0009 f6            	ld	a,(x)
 517  000a a4fe          	and	a,#254
 518  000c               L342:
 519  000c f7            	ld	(x),a
 520                     ; 229 }
 523  000d 81            	ret	
 561                     ; 236 void ADC_SoftwareStartConv(ADC_TypeDef* ADCx)
 561                     ; 237 {
 562                     .text:	section	.text,new
 563  0000               _ADC_SoftwareStartConv:
 567                     ; 239   ADCx->CR1 |= ADC_CR1_START;
 569  0000 f6            	ld	a,(x)
 570  0001 aa02          	or	a,#2
 571  0003 f7            	ld	(x),a
 572                     ; 240 }
 575  0004 81            	ret	
 703                     ; 258 void ADC_ExternalTrigConfig(ADC_TypeDef* ADCx,
 703                     ; 259                             ADC_ExtEventSelection_TypeDef ADC_ExtEventSelection,
 703                     ; 260                             ADC_ExtTRGSensitivity_TypeDef ADC_ExtTRGSensitivity)
 703                     ; 261 {
 704                     .text:	section	.text,new
 705  0000               _ADC_ExternalTrigConfig:
 707       fffffffe      OFST: set -2
 710                     ; 263   assert_param(IS_ADC_EXT_EVENT_SELECTION(ADC_ExtEventSelection));
 712                     ; 264   assert_param(IS_ADC_EXT_TRG_SENSITIVITY(ADC_ExtTRGSensitivity));
 714                     ; 267   ADCx->CR2 &= (uint8_t)~(ADC_CR2_TRIGEDGE | ADC_CR2_EXTSEL);
 716  0000 e601          	ld	a,(1,x)
 717  0002 a487          	and	a,#135
 718  0004 e701          	ld	(1,x),a
 719                     ; 271   ADCx->CR2 |= (uint8_t)( (uint8_t)ADC_ExtTRGSensitivity | \
 719                     ; 272                           (uint8_t)ADC_ExtEventSelection);
 721  0006 7b04          	ld	a,(OFST+6,sp)
 722  0008 1a03          	or	a,(OFST+5,sp)
 723  000a ea01          	or	a,(1,x)
 724  000c e701          	ld	(1,x),a
 725                     ; 273 }
 728  000e 81            	ret	
1042                     ; 336 void ADC_AnalogWatchdogChannelSelect(ADC_TypeDef* ADCx,
1042                     ; 337                                      ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection)
1042                     ; 338 {
1043                     .text:	section	.text,new
1044  0000               _ADC_AnalogWatchdogChannelSelect:
1046       fffffffe      OFST: set -2
1049                     ; 340   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1051                     ; 343   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1053  0000 e602          	ld	a,(2,x)
1054  0002 a4e0          	and	a,#224
1055  0004 e702          	ld	(2,x),a
1056                     ; 346   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1058  0006 e602          	ld	a,(2,x)
1059  0008 1a03          	or	a,(OFST+5,sp)
1060  000a e702          	ld	(2,x),a
1061                     ; 347 }
1064  000c 81            	ret	
1116                     ; 358 void ADC_AnalogWatchdogThresholdsConfig(ADC_TypeDef* ADCx, uint16_t HighThreshold, uint16_t LowThreshold)
1116                     ; 359 {
1117                     .text:	section	.text,new
1118  0000               _ADC_AnalogWatchdogThresholdsConfig:
1120       fffffffe      OFST: set -2
1123                     ; 361   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1125                     ; 362   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1127                     ; 365   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1129  0000 7b03          	ld	a,(OFST+5,sp)
1130  0002 e706          	ld	(6,x),a
1131                     ; 366   ADCx->HTRL = (uint8_t)(HighThreshold);
1133  0004 7b04          	ld	a,(OFST+6,sp)
1134  0006 e707          	ld	(7,x),a
1135                     ; 369   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1137  0008 7b05          	ld	a,(OFST+7,sp)
1138  000a e708          	ld	(8,x),a
1139                     ; 370   ADCx->LTRL = (uint8_t)(LowThreshold);
1141  000c 7b06          	ld	a,(OFST+8,sp)
1142  000e e709          	ld	(9,x),a
1143                     ; 371 }
1146  0010 81            	ret	
1209                     ; 409 void ADC_AnalogWatchdogConfig(ADC_TypeDef* ADCx,
1209                     ; 410                               ADC_AnalogWatchdogSelection_TypeDef ADC_AnalogWatchdogSelection,
1209                     ; 411                               uint16_t HighThreshold,
1209                     ; 412                               uint16_t LowThreshold)
1209                     ; 413 {
1210                     .text:	section	.text,new
1211  0000               _ADC_AnalogWatchdogConfig:
1213       fffffffe      OFST: set -2
1216                     ; 415   assert_param(IS_ADC_ANALOGWATCHDOG_SELECTION(ADC_AnalogWatchdogSelection));
1218                     ; 416   assert_param(IS_ADC_THRESHOLD(HighThreshold));
1220                     ; 417   assert_param(IS_ADC_THRESHOLD(LowThreshold));
1222                     ; 420   ADCx->CR3 &= ((uint8_t)~ADC_CR3_CHSEL);
1224  0000 e602          	ld	a,(2,x)
1225  0002 a4e0          	and	a,#224
1226  0004 e702          	ld	(2,x),a
1227                     ; 423   ADCx->CR3 |= (uint8_t)ADC_AnalogWatchdogSelection;
1229  0006 e602          	ld	a,(2,x)
1230  0008 1a03          	or	a,(OFST+5,sp)
1231  000a e702          	ld	(2,x),a
1232                     ; 426   ADCx->HTRH = (uint8_t)(HighThreshold >> 8);
1234  000c 7b04          	ld	a,(OFST+6,sp)
1235  000e e706          	ld	(6,x),a
1236                     ; 427   ADCx->HTRL = (uint8_t)(HighThreshold);
1238  0010 7b05          	ld	a,(OFST+7,sp)
1239  0012 e707          	ld	(7,x),a
1240                     ; 430   ADCx->LTRH = (uint8_t)(LowThreshold >> 8);
1242  0014 7b06          	ld	a,(OFST+8,sp)
1243  0016 e708          	ld	(8,x),a
1244                     ; 431   ADCx->LTRL = (uint8_t)LowThreshold;
1246  0018 7b07          	ld	a,(OFST+9,sp)
1247  001a e709          	ld	(9,x),a
1248                     ; 432 }
1251  001c 81            	ret	
1286                     ; 471 void ADC_TempSensorCmd(FunctionalState NewState)
1286                     ; 472 {
1287                     .text:	section	.text,new
1288  0000               _ADC_TempSensorCmd:
1292                     ; 474   assert_param(IS_FUNCTIONAL_STATE(NewState));
1294                     ; 476   if (NewState != DISABLE)
1296  0000 4d            	tnz	a
1297  0001 2705          	jreq	L165
1298                     ; 479     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_TSON);
1300  0003 721a534e      	bset	21326,#5
1303  0007 81            	ret	
1304  0008               L165:
1305                     ; 484     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_TSON);
1307  0008 721b534e      	bres	21326,#5
1308                     ; 486 }
1311  000c 81            	ret	
1346                     ; 494 void ADC_VrefintCmd(FunctionalState NewState)
1346                     ; 495 {
1347                     .text:	section	.text,new
1348  0000               _ADC_VrefintCmd:
1352                     ; 497   assert_param(IS_FUNCTIONAL_STATE(NewState));
1354                     ; 499   if (NewState != DISABLE)
1356  0000 4d            	tnz	a
1357  0001 2705          	jreq	L306
1358                     ; 502     ADC1->TRIGR[0] |= (uint8_t)(ADC_TRIGR1_VREFINTON);
1360  0003 7218534e      	bset	21326,#4
1363  0007 81            	ret	
1364  0008               L306:
1365                     ; 507     ADC1->TRIGR[0] &= (uint8_t)(~ADC_TRIGR1_VREFINTON);
1367  0008 7219534e      	bres	21326,#4
1368                     ; 509 }
1371  000c 81            	ret	
1681                     ; 580 void ADC_ChannelCmd(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels, FunctionalState NewState)
1681                     ; 581 {
1682                     .text:	section	.text,new
1683  0000               _ADC_ChannelCmd:
1685  0000 89            	pushw	x
1686  0001 88            	push	a
1687       00000001      OFST:	set	1
1690                     ; 582   uint8_t regindex = 0;
1692                     ; 584   assert_param(IS_FUNCTIONAL_STATE(NewState));
1694                     ; 586   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
1696  0002 7b06          	ld	a,(OFST+5,sp)
1697  0004 6b01          	ld	(OFST+0,sp),a
1699                     ; 588   if (NewState != DISABLE)
1701  0006 0d08          	tnz	(OFST+7,sp)
1702  0008 270d          	jreq	L157
1703                     ; 591     ADCx->SQR[regindex] |= (uint8_t)(ADC_Channels);
1705  000a 01            	rrwa	x,a
1706  000b 1b01          	add	a,(OFST+0,sp)
1707  000d 2401          	jrnc	L23
1708  000f 5c            	incw	x
1709  0010               L23:
1710  0010 02            	rlwa	x,a
1711  0011 e60a          	ld	a,(10,x)
1712  0013 1a07          	or	a,(OFST+6,sp)
1714  0015 2010          	jra	L357
1715  0017               L157:
1716                     ; 596     ADCx->SQR[regindex] &= (uint8_t)(~(uint8_t)(ADC_Channels));
1718  0017 7b02          	ld	a,(OFST+1,sp)
1719  0019 97            	ld	xl,a
1720  001a 7b03          	ld	a,(OFST+2,sp)
1721  001c 1b01          	add	a,(OFST+0,sp)
1722  001e 2401          	jrnc	L43
1723  0020 5c            	incw	x
1724  0021               L43:
1725  0021 02            	rlwa	x,a
1726  0022 7b07          	ld	a,(OFST+6,sp)
1727  0024 43            	cpl	a
1728  0025 e40a          	and	a,(10,x)
1729  0027               L357:
1730  0027 e70a          	ld	(10,x),a
1731                     ; 598 }
1734  0029 5b03          	addw	sp,#3
1735  002b 81            	ret	
1885                     ; 622 void ADC_SamplingTimeConfig(ADC_TypeDef* ADCx,
1885                     ; 623                             ADC_Group_TypeDef ADC_GroupChannels,
1885                     ; 624                             ADC_SamplingTime_TypeDef ADC_SamplingTime)
1885                     ; 625 {
1886                     .text:	section	.text,new
1887  0000               _ADC_SamplingTimeConfig:
1889       fffffffe      OFST: set -2
1892                     ; 627   assert_param(IS_ADC_GROUP(ADC_GroupChannels));
1894                     ; 628   assert_param(IS_ADC_SAMPLING_TIME_CYCLES(ADC_SamplingTime));
1896                     ; 630   if ( ADC_GroupChannels != ADC_Group_SlowChannels)
1898  0000 7b03          	ld	a,(OFST+5,sp)
1899  0002 2711          	jreq	L1401
1900                     ; 633     ADCx->CR3 &= (uint8_t)~ADC_CR3_SMPT2;
1902  0004 e602          	ld	a,(2,x)
1903  0006 a41f          	and	a,#31
1904  0008 e702          	ld	(2,x),a
1905                     ; 634     ADCx->CR3 |= (uint8_t)(ADC_SamplingTime << 5);
1907  000a 7b04          	ld	a,(OFST+6,sp)
1908  000c 4e            	swap	a
1909  000d 48            	sll	a
1910  000e a4e0          	and	a,#224
1911  0010 ea02          	or	a,(2,x)
1912  0012 e702          	ld	(2,x),a
1915  0014 81            	ret	
1916  0015               L1401:
1917                     ; 639     ADCx->CR2 &= (uint8_t)~ADC_CR2_SMPT1;
1919  0015 e601          	ld	a,(1,x)
1920  0017 a4f8          	and	a,#248
1921  0019 e701          	ld	(1,x),a
1922                     ; 640     ADCx->CR2 |= (uint8_t)ADC_SamplingTime;
1924  001b e601          	ld	a,(1,x)
1925  001d 1a04          	or	a,(OFST+6,sp)
1926  001f e701          	ld	(1,x),a
1927                     ; 642 }
1930  0021 81            	ret	
1995                     ; 688 void ADC_SchmittTriggerConfig(ADC_TypeDef* ADCx, ADC_Channel_TypeDef ADC_Channels,
1995                     ; 689                               FunctionalState NewState)
1995                     ; 690 {
1996                     .text:	section	.text,new
1997  0000               _ADC_SchmittTriggerConfig:
1999  0000 89            	pushw	x
2000  0001 88            	push	a
2001       00000001      OFST:	set	1
2004                     ; 691   uint8_t regindex = 0;
2006                     ; 693   assert_param(IS_FUNCTIONAL_STATE(NewState));
2008                     ; 695   regindex = (uint8_t)((uint16_t)ADC_Channels >> 8);
2010  0002 7b06          	ld	a,(OFST+5,sp)
2011  0004 6b01          	ld	(OFST+0,sp),a
2013                     ; 697   if (NewState != DISABLE)
2015  0006 0d08          	tnz	(OFST+7,sp)
2016  0008 270e          	jreq	L7701
2017                     ; 700     ADCx->TRIGR[regindex] &= (uint8_t)(~(uint8_t)ADC_Channels);
2019  000a 01            	rrwa	x,a
2020  000b 1b01          	add	a,(OFST+0,sp)
2021  000d 2401          	jrnc	L24
2022  000f 5c            	incw	x
2023  0010               L24:
2024  0010 02            	rlwa	x,a
2025  0011 7b07          	ld	a,(OFST+6,sp)
2026  0013 43            	cpl	a
2027  0014 e40e          	and	a,(14,x)
2029  0016 200f          	jra	L1011
2030  0018               L7701:
2031                     ; 705     ADCx->TRIGR[regindex] |= (uint8_t)(ADC_Channels);
2033  0018 7b02          	ld	a,(OFST+1,sp)
2034  001a 97            	ld	xl,a
2035  001b 7b03          	ld	a,(OFST+2,sp)
2036  001d 1b01          	add	a,(OFST+0,sp)
2037  001f 2401          	jrnc	L44
2038  0021 5c            	incw	x
2039  0022               L44:
2040  0022 02            	rlwa	x,a
2041  0023 e60e          	ld	a,(14,x)
2042  0025 1a07          	or	a,(OFST+6,sp)
2043  0027               L1011:
2044  0027 e70e          	ld	(14,x),a
2045                     ; 707 }
2048  0029 5b03          	addw	sp,#3
2049  002b 81            	ret	
2094                     ; 714 uint16_t ADC_GetConversionValue(ADC_TypeDef* ADCx)
2094                     ; 715 {
2095                     .text:	section	.text,new
2096  0000               _ADC_GetConversionValue:
2098  0000 89            	pushw	x
2099  0001 89            	pushw	x
2100       00000002      OFST:	set	2
2103                     ; 716   uint16_t tmpreg = 0;
2105                     ; 719   tmpreg = (uint16_t)(ADCx->DRH);
2107  0002 e604          	ld	a,(4,x)
2108  0004 97            	ld	xl,a
2110                     ; 720   tmpreg = (uint16_t)((uint16_t)((uint16_t)tmpreg << 8) | ADCx->DRL);
2112  0005 1603          	ldw	y,(OFST+1,sp)
2113  0007 90e605        	ld	a,(5,y)
2114  000a 02            	rlwa	x,a
2116                     ; 723   return (uint16_t)(tmpreg) ;
2120  000b 5b04          	addw	sp,#4
2121  000d 81            	ret	
2168                     ; 757 void ADC_DMACmd(ADC_TypeDef* ADCx, FunctionalState NewState)
2168                     ; 758 {
2169                     .text:	section	.text,new
2170  0000               _ADC_DMACmd:
2172       fffffffe      OFST: set -2
2175                     ; 760   assert_param(IS_FUNCTIONAL_STATE(NewState));
2177                     ; 762   if (NewState != DISABLE)
2179  0000 7b03          	ld	a,(OFST+5,sp)
2180  0002 2706          	jreq	L1511
2181                     ; 765     ADCx->SQR[0] &= (uint8_t)~ADC_SQR1_DMAOFF;
2183  0004 e60a          	ld	a,(10,x)
2184  0006 a47f          	and	a,#127
2186  0008 2004          	jra	L3511
2187  000a               L1511:
2188                     ; 770     ADCx->SQR[0] |= ADC_SQR1_DMAOFF;
2190  000a e60a          	ld	a,(10,x)
2191  000c aa80          	or	a,#128
2192  000e               L3511:
2193  000e e70a          	ld	(10,x),a
2194                     ; 772 }
2197  0010 81            	ret	
2281                     ; 828 void ADC_ITConfig(ADC_TypeDef* ADCx, ADC_IT_TypeDef ADC_IT, FunctionalState NewState)
2281                     ; 829 {
2282                     .text:	section	.text,new
2283  0000               _ADC_ITConfig:
2285       fffffffe      OFST: set -2
2288                     ; 831   assert_param(IS_FUNCTIONAL_STATE(NewState));
2290                     ; 832   assert_param(IS_ADC_IT(ADC_IT));
2292                     ; 834   if (NewState != DISABLE)
2294  0000 7b04          	ld	a,(OFST+6,sp)
2295  0002 2705          	jreq	L7121
2296                     ; 837     ADCx->CR1 |= (uint8_t) ADC_IT;
2298  0004 f6            	ld	a,(x)
2299  0005 1a03          	or	a,(OFST+5,sp)
2301  0007 2004          	jra	L1221
2302  0009               L7121:
2303                     ; 842     ADCx->CR1 &= (uint8_t)(~ADC_IT);
2305  0009 7b03          	ld	a,(OFST+5,sp)
2306  000b 43            	cpl	a
2307  000c f4            	and	a,(x)
2308  000d               L1221:
2309  000d f7            	ld	(x),a
2310                     ; 844 }
2313  000e 81            	ret	
2418                     ; 856 FlagStatus ADC_GetFlagStatus(ADC_TypeDef* ADCx, ADC_FLAG_TypeDef ADC_FLAG)
2418                     ; 857 {
2419                     .text:	section	.text,new
2420  0000               _ADC_GetFlagStatus:
2422       fffffffe      OFST: set -2
2425                     ; 858   FlagStatus flagstatus = RESET;
2427                     ; 861   assert_param(IS_ADC_GET_FLAG(ADC_FLAG));
2429                     ; 864   if ((ADCx->SR & ADC_FLAG) != (uint8_t)RESET)
2431  0000 e603          	ld	a,(3,x)
2432  0002 1503          	bcp	a,(OFST+5,sp)
2433  0004 2703          	jreq	L5721
2434                     ; 867     flagstatus = SET;
2436  0006 a601          	ld	a,#1
2440  0008 81            	ret	
2441  0009               L5721:
2442                     ; 872     flagstatus = RESET;
2444  0009 4f            	clr	a
2446                     ; 876   return  flagstatus;
2450  000a 81            	ret	
2497                     ; 889 void ADC_ClearFlag(ADC_TypeDef* ADCx,
2497                     ; 890                    ADC_FLAG_TypeDef ADC_FLAG)
2497                     ; 891 {
2498                     .text:	section	.text,new
2499  0000               _ADC_ClearFlag:
2501       fffffffe      OFST: set -2
2504                     ; 893   assert_param(IS_ADC_CLEAR_FLAG(ADC_FLAG));
2506                     ; 896   ADCx->SR = (uint8_t)~ADC_FLAG;
2508  0000 7b03          	ld	a,(OFST+5,sp)
2509  0002 43            	cpl	a
2510  0003 e703          	ld	(3,x),a
2511                     ; 897 }
2514  0005 81            	ret	
2586                     ; 909 ITStatus ADC_GetITStatus(ADC_TypeDef* ADCx,
2586                     ; 910                          ADC_IT_TypeDef ADC_IT)
2586                     ; 911 {
2587                     .text:	section	.text,new
2588  0000               _ADC_GetITStatus:
2590  0000 89            	pushw	x
2591  0001 5203          	subw	sp,#3
2592       00000003      OFST:	set	3
2595                     ; 912   ITStatus itstatus = RESET;
2597                     ; 913   uint8_t itmask = 0, enablestatus = 0;
2601                     ; 916   assert_param(IS_ADC_GET_IT(ADC_IT));
2603                     ; 919   itmask = (uint8_t)(ADC_IT >> 3);
2605  0003 7b08          	ld	a,(OFST+5,sp)
2606  0005 44            	srl	a
2607  0006 44            	srl	a
2608  0007 44            	srl	a
2609  0008 6b03          	ld	(OFST+0,sp),a
2611                     ; 920   itmask =  (uint8_t)((uint8_t)((uint8_t)(itmask & (uint8_t)0x10) >> 2) | \
2611                     ; 921                                 (uint8_t)(itmask & (uint8_t)0x03));
2613  000a a403          	and	a,#3
2614  000c 6b01          	ld	(OFST-2,sp),a
2616  000e 7b03          	ld	a,(OFST+0,sp)
2617  0010 a410          	and	a,#16
2618  0012 44            	srl	a
2619  0013 44            	srl	a
2620  0014 1a01          	or	a,(OFST-2,sp)
2621  0016 6b03          	ld	(OFST+0,sp),a
2623                     ; 924   enablestatus = (uint8_t)(ADCx->CR1 & (uint8_t)ADC_IT) ;
2625  0018 f6            	ld	a,(x)
2626  0019 1408          	and	a,(OFST+5,sp)
2627  001b 6b02          	ld	(OFST-1,sp),a
2629                     ; 927   if (((ADCx->SR & itmask) != (uint8_t)RESET) && enablestatus)
2631  001d e603          	ld	a,(3,x)
2632  001f 1503          	bcp	a,(OFST+0,sp)
2633  0021 2708          	jreq	L1631
2635  0023 7b02          	ld	a,(OFST-1,sp)
2636  0025 2704          	jreq	L1631
2637                     ; 930     itstatus = SET;
2639  0027 a601          	ld	a,#1
2642  0029 2001          	jra	L3631
2643  002b               L1631:
2644                     ; 935     itstatus = RESET;
2646  002b 4f            	clr	a
2648  002c               L3631:
2649                     ; 939   return  itstatus;
2653  002c 5b05          	addw	sp,#5
2654  002e 81            	ret	
2709                     ; 952 void ADC_ClearITPendingBit(ADC_TypeDef* ADCx,
2709                     ; 953                            ADC_IT_TypeDef ADC_IT)
2709                     ; 954 {
2710                     .text:	section	.text,new
2711  0000               _ADC_ClearITPendingBit:
2713  0000 89            	pushw	x
2714  0001 89            	pushw	x
2715       00000002      OFST:	set	2
2718                     ; 955   uint8_t itmask = 0;
2720                     ; 958   assert_param(IS_ADC_IT(ADC_IT));
2722                     ; 961   itmask = (uint8_t)(ADC_IT >> 3);
2724  0002 7b07          	ld	a,(OFST+5,sp)
2725  0004 44            	srl	a
2726  0005 44            	srl	a
2727  0006 44            	srl	a
2728  0007 6b02          	ld	(OFST+0,sp),a
2730                     ; 962   itmask =  (uint8_t)((uint8_t)(((uint8_t)(itmask & (uint8_t)0x10)) >> 2) | \
2730                     ; 963                                  (uint8_t)(itmask & (uint8_t)0x03));
2732  0009 a403          	and	a,#3
2733  000b 6b01          	ld	(OFST-1,sp),a
2735  000d 7b02          	ld	a,(OFST+0,sp)
2736  000f a410          	and	a,#16
2737  0011 44            	srl	a
2738  0012 44            	srl	a
2739  0013 1a01          	or	a,(OFST-1,sp)
2740  0015 6b02          	ld	(OFST+0,sp),a
2742                     ; 966   ADCx->SR = (uint8_t)~itmask;
2744  0017 43            	cpl	a
2745  0018 1e03          	ldw	x,(OFST+1,sp)
2746  001a e703          	ld	(3,x),a
2747                     ; 967 }
2750  001c 5b04          	addw	sp,#4
2751  001e 81            	ret	
2764                     	xdef	_ADC_ClearITPendingBit
2765                     	xdef	_ADC_GetITStatus
2766                     	xdef	_ADC_ClearFlag
2767                     	xdef	_ADC_GetFlagStatus
2768                     	xdef	_ADC_ITConfig
2769                     	xdef	_ADC_DMACmd
2770                     	xdef	_ADC_GetConversionValue
2771                     	xdef	_ADC_SchmittTriggerConfig
2772                     	xdef	_ADC_SamplingTimeConfig
2773                     	xdef	_ADC_ChannelCmd
2774                     	xdef	_ADC_VrefintCmd
2775                     	xdef	_ADC_TempSensorCmd
2776                     	xdef	_ADC_AnalogWatchdogConfig
2777                     	xdef	_ADC_AnalogWatchdogThresholdsConfig
2778                     	xdef	_ADC_AnalogWatchdogChannelSelect
2779                     	xdef	_ADC_ExternalTrigConfig
2780                     	xdef	_ADC_SoftwareStartConv
2781                     	xdef	_ADC_Cmd
2782                     	xdef	_ADC_Init
2783                     	xdef	_ADC_DeInit
2802                     	end
