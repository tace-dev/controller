   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  49                     ; 127 void TIM4_DeInit(void)
  49                     ; 128 {
  51                     	switch	.text
  52  0000               _TIM4_DeInit:
  56                     ; 129   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  58  0000 725f52e0      	clr	21216
  59                     ; 130   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  61  0004 725f52e1      	clr	21217
  62                     ; 131   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  64  0008 725f52e2      	clr	21218
  65                     ; 132   TIM4->IER   = TIM4_IER_RESET_VALUE;
  67  000c 725f52e4      	clr	21220
  68                     ; 133   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  70  0010 725f52e7      	clr	21223
  71                     ; 134   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  73  0014 725f52e8      	clr	21224
  74                     ; 135   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  76  0018 35ff52e9      	mov	21225,#255
  77                     ; 136   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  79  001c 725f52e5      	clr	21221
  80                     ; 137 }
  83  0020 81            	ret	
 249                     ; 162 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 249                     ; 163                        uint8_t TIM4_Period)
 249                     ; 164 {
 250                     	switch	.text
 251  0021               _TIM4_TimeBaseInit:
 255                     ; 166   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
 257                     ; 168   TIM4->ARR = (uint8_t)(TIM4_Period);
 259  0021 9f            	ld	a,xl
 260  0022 c752e9        	ld	21225,a
 261                     ; 170   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 263  0025 9e            	ld	a,xh
 264  0026 c752e8        	ld	21224,a
 265                     ; 173   TIM4->EGR = TIM4_EventSource_Update;
 267  0029 350152e6      	mov	21222,#1
 268                     ; 174 }
 271  002d 81            	ret	
 339                     ; 202 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
 339                     ; 203                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 339                     ; 204 {
 340                     	switch	.text
 341  002e               _TIM4_PrescalerConfig:
 345                     ; 206   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
 347                     ; 207   assert_param(IS_TIM4_Prescaler(Prescaler));
 349                     ; 210   TIM4->PSCR = (uint8_t) Prescaler;
 351  002e 9e            	ld	a,xh
 352  002f c752e8        	ld	21224,a
 353                     ; 213   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
 355  0032 9f            	ld	a,xl
 356  0033 4a            	dec	a
 357  0034 2605          	jrne	L731
 358                     ; 215     TIM4->EGR |= TIM4_EGR_UG ;
 360  0036 721052e6      	bset	21222,#0
 363  003a 81            	ret	
 364  003b               L731:
 365                     ; 219     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
 367  003b 721152e6      	bres	21222,#0
 368                     ; 221 }
 371  003f 81            	ret	
 403                     ; 229 void TIM4_SetCounter(uint8_t Counter)
 403                     ; 230 {
 404                     	switch	.text
 405  0040               _TIM4_SetCounter:
 409                     ; 232   TIM4->CNTR = (uint8_t)(Counter);
 411  0040 c752e7        	ld	21223,a
 412                     ; 233 }
 415  0043 81            	ret	
 447                     ; 241 void TIM4_SetAutoreload(uint8_t Autoreload)
 447                     ; 242 {
 448                     	switch	.text
 449  0044               _TIM4_SetAutoreload:
 453                     ; 244   TIM4->ARR = (uint8_t)(Autoreload);
 455  0044 c752e9        	ld	21225,a
 456                     ; 245 }
 459  0047 81            	ret	
 491                     ; 252 uint8_t TIM4_GetCounter(void)
 491                     ; 253 {
 492                     	switch	.text
 493  0048               _TIM4_GetCounter:
 495  0048 88            	push	a
 496       00000001      OFST:	set	1
 499                     ; 254   uint8_t tmpcntr = 0;
 501                     ; 255   tmpcntr = TIM4->CNTR;
 503  0049 c652e7        	ld	a,21223
 504                     ; 257   return ((uint8_t)tmpcntr);
 508  004c 5b01          	addw	sp,#1
 509  004e 81            	ret	
 533                     ; 281 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 533                     ; 282 {
 534                     	switch	.text
 535  004f               _TIM4_GetPrescaler:
 539                     ; 284   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 541  004f c652e8        	ld	a,21224
 544  0052 81            	ret	
 600                     ; 293 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 600                     ; 294 {
 601                     	switch	.text
 602  0053               _TIM4_UpdateDisableConfig:
 606                     ; 296   assert_param(IS_FUNCTIONAL_STATE(NewState));
 608                     ; 299   if (NewState != DISABLE)
 610  0053 4d            	tnz	a
 611  0054 2705          	jreq	L542
 612                     ; 301     TIM4->CR1 |= TIM4_CR1_UDIS ;
 614  0056 721252e0      	bset	21216,#1
 617  005a 81            	ret	
 618  005b               L542:
 619                     ; 305     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 621  005b 721352e0      	bres	21216,#1
 622                     ; 307 }
 625  005f 81            	ret	
 683                     ; 317 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 683                     ; 318 {
 684                     	switch	.text
 685  0060               _TIM4_UpdateRequestConfig:
 689                     ; 320   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 691                     ; 323   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 693  0060 4a            	dec	a
 694  0061 2605          	jrne	L772
 695                     ; 325     TIM4->CR1 |= TIM4_CR1_URS ;
 697  0063 721452e0      	bset	21216,#2
 700  0067 81            	ret	
 701  0068               L772:
 702                     ; 329     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 704  0068 721552e0      	bres	21216,#2
 705                     ; 331 }
 708  006c 81            	ret	
 744                     ; 339 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 744                     ; 340 {
 745                     	switch	.text
 746  006d               _TIM4_ARRPreloadConfig:
 750                     ; 342   assert_param(IS_FUNCTIONAL_STATE(NewState));
 752                     ; 345   if (NewState != DISABLE)
 754  006d 4d            	tnz	a
 755  006e 2705          	jreq	L123
 756                     ; 347     TIM4->CR1 |= TIM4_CR1_ARPE ;
 758  0070 721e52e0      	bset	21216,#7
 761  0074 81            	ret	
 762  0075               L123:
 763                     ; 351     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 765  0075 721f52e0      	bres	21216,#7
 766                     ; 353 }
 769  0079 81            	ret	
 826                     ; 363 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 826                     ; 364 {
 827                     	switch	.text
 828  007a               _TIM4_SelectOnePulseMode:
 832                     ; 366   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 834                     ; 369   if (TIM4_OPMode == TIM4_OPMode_Single)
 836  007a 4a            	dec	a
 837  007b 2605          	jrne	L353
 838                     ; 371     TIM4->CR1 |= TIM4_CR1_OPM ;
 840  007d 721652e0      	bset	21216,#3
 843  0081 81            	ret	
 844  0082               L353:
 845                     ; 375     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 847  0082 721752e0      	bres	21216,#3
 848                     ; 377 }
 851  0086 81            	ret	
 886                     ; 385 void TIM4_Cmd(FunctionalState NewState)
 886                     ; 386 {
 887                     	switch	.text
 888  0087               _TIM4_Cmd:
 892                     ; 388   assert_param(IS_FUNCTIONAL_STATE(NewState));
 894                     ; 391   if (NewState != DISABLE)
 896  0087 4d            	tnz	a
 897  0088 2705          	jreq	L573
 898                     ; 393     TIM4->CR1 |= TIM4_CR1_CEN ;
 900  008a 721052e0      	bset	21216,#0
 903  008e 81            	ret	
 904  008f               L573:
 905                     ; 397     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 907  008f 721152e0      	bres	21216,#0
 908                     ; 399 }
 911  0093 81            	ret	
 976                     ; 427 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 976                     ; 428 {
 977                     	switch	.text
 978  0094               _TIM4_ITConfig:
 980  0094 89            	pushw	x
 981       00000000      OFST:	set	0
 984                     ; 430   assert_param(IS_TIM4_IT(TIM4_IT));
 986                     ; 431   assert_param(IS_FUNCTIONAL_STATE(NewState));
 988                     ; 433   if (NewState != DISABLE)
 990  0095 9f            	ld	a,xl
 991  0096 4d            	tnz	a
 992  0097 2706          	jreq	L334
 993                     ; 436     TIM4->IER |= (uint8_t)TIM4_IT;
 995  0099 9e            	ld	a,xh
 996  009a ca52e4        	or	a,21220
 998  009d 2006          	jra	L534
 999  009f               L334:
1000                     ; 441     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
1002  009f 7b01          	ld	a,(OFST+1,sp)
1003  00a1 43            	cpl	a
1004  00a2 c452e4        	and	a,21220
1005  00a5               L534:
1006  00a5 c752e4        	ld	21220,a
1007                     ; 443 }
1010  00a8 85            	popw	x
1011  00a9 81            	ret	
1068                     ; 453 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1068                     ; 454 {
1069                     	switch	.text
1070  00aa               _TIM4_GenerateEvent:
1074                     ; 456   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1076                     ; 459   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1078  00aa ca52e6        	or	a,21222
1079  00ad c752e6        	ld	21222,a
1080                     ; 460 }
1083  00b0 81            	ret	
1169                     ; 471 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1169                     ; 472 {
1170                     	switch	.text
1171  00b1               _TIM4_GetFlagStatus:
1173  00b1 88            	push	a
1174       00000001      OFST:	set	1
1177                     ; 473   FlagStatus bitstatus = RESET;
1179                     ; 476   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1181                     ; 478   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1183  00b2 c452e5        	and	a,21221
1184  00b5 2702          	jreq	L725
1185                     ; 480     bitstatus = SET;
1187  00b7 a601          	ld	a,#1
1189  00b9               L725:
1190                     ; 484     bitstatus = RESET;
1192                     ; 486   return ((FlagStatus)bitstatus);
1196  00b9 5b01          	addw	sp,#1
1197  00bb 81            	ret	
1232                     ; 497 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1232                     ; 498 {
1233                     	switch	.text
1234  00bc               _TIM4_ClearFlag:
1238                     ; 500   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1240                     ; 502   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1242  00bc 43            	cpl	a
1243  00bd c752e5        	ld	21221,a
1244                     ; 503 }
1247  00c0 81            	ret	
1307                     ; 515 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1307                     ; 516 {
1308                     	switch	.text
1309  00c1               _TIM4_GetITStatus:
1311  00c1 88            	push	a
1312  00c2 89            	pushw	x
1313       00000002      OFST:	set	2
1316                     ; 517   ITStatus bitstatus = RESET;
1318                     ; 519   uint8_t itStatus = 0x0, itEnable = 0x0;
1322                     ; 522   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1324                     ; 524   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1326  00c3 c452e5        	and	a,21221
1327  00c6 6b01          	ld	(OFST-1,sp),a
1328                     ; 526   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1330  00c8 c652e4        	ld	a,21220
1331  00cb 1403          	and	a,(OFST+1,sp)
1332  00cd 6b02          	ld	(OFST+0,sp),a
1333                     ; 528   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1335  00cf 7b01          	ld	a,(OFST-1,sp)
1336  00d1 2708          	jreq	L775
1338  00d3 7b02          	ld	a,(OFST+0,sp)
1339  00d5 2704          	jreq	L775
1340                     ; 530     bitstatus = (ITStatus)SET;
1342  00d7 a601          	ld	a,#1
1344  00d9 2001          	jra	L106
1345  00db               L775:
1346                     ; 534     bitstatus = (ITStatus)RESET;
1348  00db 4f            	clr	a
1349  00dc               L106:
1350                     ; 536   return ((ITStatus)bitstatus);
1354  00dc 5b03          	addw	sp,#3
1355  00de 81            	ret	
1391                     ; 547 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1391                     ; 548 {
1392                     	switch	.text
1393  00df               _TIM4_ClearITPendingBit:
1397                     ; 550   assert_param(IS_TIM4_IT(TIM4_IT));
1399                     ; 553   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1401  00df 43            	cpl	a
1402  00e0 c752e5        	ld	21221,a
1403                     ; 554 }
1406  00e3 81            	ret	
1465                     ; 565 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1465                     ; 566 {
1466                     	switch	.text
1467  00e4               _TIM4_DMACmd:
1469  00e4 89            	pushw	x
1470       00000000      OFST:	set	0
1473                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
1475                     ; 569   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1477                     ; 571   if (NewState != DISABLE)
1479  00e5 9f            	ld	a,xl
1480  00e6 4d            	tnz	a
1481  00e7 2706          	jreq	L156
1482                     ; 574     TIM4->DER |= (uint8_t)TIM4_DMASource;
1484  00e9 9e            	ld	a,xh
1485  00ea ca52e3        	or	a,21219
1487  00ed 2006          	jra	L356
1488  00ef               L156:
1489                     ; 579     TIM4->DER &= (uint8_t)~TIM4_DMASource;
1491  00ef 7b01          	ld	a,(OFST+1,sp)
1492  00f1 43            	cpl	a
1493  00f2 c452e3        	and	a,21219
1494  00f5               L356:
1495  00f5 c752e3        	ld	21219,a
1496                     ; 581 }
1499  00f8 85            	popw	x
1500  00f9 81            	ret	
1524                     ; 604 void TIM4_InternalClockConfig(void)
1524                     ; 605 {
1525                     	switch	.text
1526  00fa               _TIM4_InternalClockConfig:
1530                     ; 607   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1532  00fa c652e2        	ld	a,21218
1533  00fd a4f8          	and	a,#248
1534  00ff c752e2        	ld	21218,a
1535                     ; 608 }
1538  0102 81            	ret	
1620                     ; 648 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1620                     ; 649 {
1621                     	switch	.text
1622  0103               _TIM4_SelectInputTrigger:
1624  0103 88            	push	a
1625  0104 88            	push	a
1626       00000001      OFST:	set	1
1629                     ; 650   uint8_t tmpsmcr = 0;
1631                     ; 653   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1633                     ; 655   tmpsmcr = TIM4->SMCR;
1635  0105 c652e2        	ld	a,21218
1636                     ; 658   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1638  0108 a48f          	and	a,#143
1639                     ; 659   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1641  010a 1a02          	or	a,(OFST+1,sp)
1642                     ; 661   TIM4->SMCR = (uint8_t)tmpsmcr;
1644  010c c752e2        	ld	21218,a
1645                     ; 662 }
1648  010f 85            	popw	x
1649  0110 81            	ret	
1722                     ; 673 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1722                     ; 674 {
1723                     	switch	.text
1724  0111               _TIM4_SelectOutputTrigger:
1726  0111 88            	push	a
1727  0112 88            	push	a
1728       00000001      OFST:	set	1
1731                     ; 675   uint8_t tmpcr2 = 0;
1733                     ; 678   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1735                     ; 680   tmpcr2 = TIM4->CR2;
1737  0113 c652e1        	ld	a,21217
1738                     ; 683   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1740  0116 a48f          	and	a,#143
1741                     ; 686   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1743  0118 1a02          	or	a,(OFST+1,sp)
1744                     ; 688   TIM4->CR2 = tmpcr2;
1746  011a c752e1        	ld	21217,a
1747                     ; 689 }
1750  011d 85            	popw	x
1751  011e 81            	ret	
1840                     ; 703 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1840                     ; 704 {
1841                     	switch	.text
1842  011f               _TIM4_SelectSlaveMode:
1844  011f 88            	push	a
1845  0120 88            	push	a
1846       00000001      OFST:	set	1
1849                     ; 705   uint8_t tmpsmcr = 0;
1851                     ; 708   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1853                     ; 710   tmpsmcr = TIM4->SMCR;
1855  0121 c652e2        	ld	a,21218
1856                     ; 713   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1858  0124 a4f8          	and	a,#248
1859                     ; 716   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1861  0126 1a02          	or	a,(OFST+1,sp)
1862                     ; 718   TIM4->SMCR = tmpsmcr;
1864  0128 c752e2        	ld	21218,a
1865                     ; 719 }
1868  012b 85            	popw	x
1869  012c 81            	ret	
1905                     ; 727 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1905                     ; 728 {
1906                     	switch	.text
1907  012d               _TIM4_SelectMasterSlaveMode:
1911                     ; 730   assert_param(IS_FUNCTIONAL_STATE(NewState));
1913                     ; 733   if (NewState != DISABLE)
1915  012d 4d            	tnz	a
1916  012e 2705          	jreq	L7201
1917                     ; 735     TIM4->SMCR |= TIM4_SMCR_MSM;
1919  0130 721e52e2      	bset	21218,#7
1922  0134 81            	ret	
1923  0135               L7201:
1924                     ; 739     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1926  0135 721f52e2      	bres	21218,#7
1927                     ; 741 }
1930  0139 81            	ret	
1943                     	xdef	_TIM4_SelectMasterSlaveMode
1944                     	xdef	_TIM4_SelectSlaveMode
1945                     	xdef	_TIM4_SelectOutputTrigger
1946                     	xdef	_TIM4_SelectInputTrigger
1947                     	xdef	_TIM4_InternalClockConfig
1948                     	xdef	_TIM4_DMACmd
1949                     	xdef	_TIM4_ClearITPendingBit
1950                     	xdef	_TIM4_GetITStatus
1951                     	xdef	_TIM4_ClearFlag
1952                     	xdef	_TIM4_GetFlagStatus
1953                     	xdef	_TIM4_GenerateEvent
1954                     	xdef	_TIM4_ITConfig
1955                     	xdef	_TIM4_Cmd
1956                     	xdef	_TIM4_SelectOnePulseMode
1957                     	xdef	_TIM4_ARRPreloadConfig
1958                     	xdef	_TIM4_UpdateRequestConfig
1959                     	xdef	_TIM4_UpdateDisableConfig
1960                     	xdef	_TIM4_GetPrescaler
1961                     	xdef	_TIM4_GetCounter
1962                     	xdef	_TIM4_SetAutoreload
1963                     	xdef	_TIM4_SetCounter
1964                     	xdef	_TIM4_PrescalerConfig
1965                     	xdef	_TIM4_TimeBaseInit
1966                     	xdef	_TIM4_DeInit
1985                     	end
