   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  50                     ; 127 void TIM4_DeInit(void)
  50                     ; 128 {
  52                     .text:	section	.text,new
  53  0000               _TIM4_DeInit:
  57                     ; 129   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  59  0000 725f52e0      	clr	21216
  60                     ; 130   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  62  0004 725f52e1      	clr	21217
  63                     ; 131   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  65  0008 725f52e2      	clr	21218
  66                     ; 132   TIM4->IER   = TIM4_IER_RESET_VALUE;
  68  000c 725f52e4      	clr	21220
  69                     ; 133   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  71  0010 725f52e7      	clr	21223
  72                     ; 134   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  74  0014 725f52e8      	clr	21224
  75                     ; 135   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  77  0018 35ff52e9      	mov	21225,#255
  78                     ; 136   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  80  001c 725f52e5      	clr	21221
  81                     ; 137 }
  84  0020 81            	ret	
 250                     ; 162 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 250                     ; 163                        uint8_t TIM4_Period)
 250                     ; 164 {
 251                     .text:	section	.text,new
 252  0000               _TIM4_TimeBaseInit:
 256                     ; 166   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
 258                     ; 168   TIM4->ARR = (uint8_t)(TIM4_Period);
 260  0000 9f            	ld	a,xl
 261  0001 c752e9        	ld	21225,a
 262                     ; 170   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 264  0004 9e            	ld	a,xh
 265  0005 c752e8        	ld	21224,a
 266                     ; 173   TIM4->EGR = TIM4_EventSource_Update;
 268  0008 350152e6      	mov	21222,#1
 269                     ; 174 }
 272  000c 81            	ret	
 340                     ; 202 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
 340                     ; 203                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 340                     ; 204 {
 341                     .text:	section	.text,new
 342  0000               _TIM4_PrescalerConfig:
 346                     ; 206   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
 348                     ; 207   assert_param(IS_TIM4_Prescaler(Prescaler));
 350                     ; 210   TIM4->PSCR = (uint8_t) Prescaler;
 352  0000 9e            	ld	a,xh
 353  0001 c752e8        	ld	21224,a
 354                     ; 213   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
 356  0004 9f            	ld	a,xl
 357  0005 4a            	dec	a
 358  0006 2605          	jrne	L731
 359                     ; 215     TIM4->EGR |= TIM4_EGR_UG ;
 361  0008 721052e6      	bset	21222,#0
 364  000c 81            	ret	
 365  000d               L731:
 366                     ; 219     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
 368  000d 721152e6      	bres	21222,#0
 369                     ; 221 }
 372  0011 81            	ret	
 404                     ; 229 void TIM4_SetCounter(uint8_t Counter)
 404                     ; 230 {
 405                     .text:	section	.text,new
 406  0000               _TIM4_SetCounter:
 410                     ; 232   TIM4->CNTR = (uint8_t)(Counter);
 412  0000 c752e7        	ld	21223,a
 413                     ; 233 }
 416  0003 81            	ret	
 448                     ; 241 void TIM4_SetAutoreload(uint8_t Autoreload)
 448                     ; 242 {
 449                     .text:	section	.text,new
 450  0000               _TIM4_SetAutoreload:
 454                     ; 244   TIM4->ARR = (uint8_t)(Autoreload);
 456  0000 c752e9        	ld	21225,a
 457                     ; 245 }
 460  0003 81            	ret	
 492                     ; 252 uint8_t TIM4_GetCounter(void)
 492                     ; 253 {
 493                     .text:	section	.text,new
 494  0000               _TIM4_GetCounter:
 496       00000001      OFST:	set	1
 499                     ; 254   uint8_t tmpcntr = 0;
 501                     ; 255   tmpcntr = TIM4->CNTR;
 503  0000 c652e7        	ld	a,21223
 505                     ; 257   return ((uint8_t)tmpcntr);
 509  0003 81            	ret	
 533                     ; 281 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 533                     ; 282 {
 534                     .text:	section	.text,new
 535  0000               _TIM4_GetPrescaler:
 539                     ; 284   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 541  0000 c652e8        	ld	a,21224
 544  0003 81            	ret	
 600                     ; 293 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 600                     ; 294 {
 601                     .text:	section	.text,new
 602  0000               _TIM4_UpdateDisableConfig:
 606                     ; 296   assert_param(IS_FUNCTIONAL_STATE(NewState));
 608                     ; 299   if (NewState != DISABLE)
 610  0000 4d            	tnz	a
 611  0001 2705          	jreq	L542
 612                     ; 301     TIM4->CR1 |= TIM4_CR1_UDIS ;
 614  0003 721252e0      	bset	21216,#1
 617  0007 81            	ret	
 618  0008               L542:
 619                     ; 305     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 621  0008 721352e0      	bres	21216,#1
 622                     ; 307 }
 625  000c 81            	ret	
 683                     ; 317 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 683                     ; 318 {
 684                     .text:	section	.text,new
 685  0000               _TIM4_UpdateRequestConfig:
 689                     ; 320   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 691                     ; 323   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 693  0000 4a            	dec	a
 694  0001 2605          	jrne	L772
 695                     ; 325     TIM4->CR1 |= TIM4_CR1_URS ;
 697  0003 721452e0      	bset	21216,#2
 700  0007 81            	ret	
 701  0008               L772:
 702                     ; 329     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 704  0008 721552e0      	bres	21216,#2
 705                     ; 331 }
 708  000c 81            	ret	
 744                     ; 339 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 744                     ; 340 {
 745                     .text:	section	.text,new
 746  0000               _TIM4_ARRPreloadConfig:
 750                     ; 342   assert_param(IS_FUNCTIONAL_STATE(NewState));
 752                     ; 345   if (NewState != DISABLE)
 754  0000 4d            	tnz	a
 755  0001 2705          	jreq	L123
 756                     ; 347     TIM4->CR1 |= TIM4_CR1_ARPE ;
 758  0003 721e52e0      	bset	21216,#7
 761  0007 81            	ret	
 762  0008               L123:
 763                     ; 351     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 765  0008 721f52e0      	bres	21216,#7
 766                     ; 353 }
 769  000c 81            	ret	
 826                     ; 363 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 826                     ; 364 {
 827                     .text:	section	.text,new
 828  0000               _TIM4_SelectOnePulseMode:
 832                     ; 366   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 834                     ; 369   if (TIM4_OPMode == TIM4_OPMode_Single)
 836  0000 4a            	dec	a
 837  0001 2605          	jrne	L353
 838                     ; 371     TIM4->CR1 |= TIM4_CR1_OPM ;
 840  0003 721652e0      	bset	21216,#3
 843  0007 81            	ret	
 844  0008               L353:
 845                     ; 375     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 847  0008 721752e0      	bres	21216,#3
 848                     ; 377 }
 851  000c 81            	ret	
 886                     ; 385 void TIM4_Cmd(FunctionalState NewState)
 886                     ; 386 {
 887                     .text:	section	.text,new
 888  0000               _TIM4_Cmd:
 892                     ; 388   assert_param(IS_FUNCTIONAL_STATE(NewState));
 894                     ; 391   if (NewState != DISABLE)
 896  0000 4d            	tnz	a
 897  0001 2705          	jreq	L573
 898                     ; 393     TIM4->CR1 |= TIM4_CR1_CEN ;
 900  0003 721052e0      	bset	21216,#0
 903  0007 81            	ret	
 904  0008               L573:
 905                     ; 397     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 907  0008 721152e0      	bres	21216,#0
 908                     ; 399 }
 911  000c 81            	ret	
 976                     ; 427 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 976                     ; 428 {
 977                     .text:	section	.text,new
 978  0000               _TIM4_ITConfig:
 980  0000 89            	pushw	x
 981       00000000      OFST:	set	0
 984                     ; 430   assert_param(IS_TIM4_IT(TIM4_IT));
 986                     ; 431   assert_param(IS_FUNCTIONAL_STATE(NewState));
 988                     ; 433   if (NewState != DISABLE)
 990  0001 9f            	ld	a,xl
 991  0002 4d            	tnz	a
 992  0003 2706          	jreq	L334
 993                     ; 436     TIM4->IER |= (uint8_t)TIM4_IT;
 995  0005 9e            	ld	a,xh
 996  0006 ca52e4        	or	a,21220
 998  0009 2006          	jra	L534
 999  000b               L334:
1000                     ; 441     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
1002  000b 7b01          	ld	a,(OFST+1,sp)
1003  000d 43            	cpl	a
1004  000e c452e4        	and	a,21220
1005  0011               L534:
1006  0011 c752e4        	ld	21220,a
1007                     ; 443 }
1010  0014 85            	popw	x
1011  0015 81            	ret	
1068                     ; 453 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1068                     ; 454 {
1069                     .text:	section	.text,new
1070  0000               _TIM4_GenerateEvent:
1074                     ; 456   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1076                     ; 459   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1078  0000 ca52e6        	or	a,21222
1079  0003 c752e6        	ld	21222,a
1080                     ; 460 }
1083  0006 81            	ret	
1169                     ; 471 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1169                     ; 472 {
1170                     .text:	section	.text,new
1171  0000               _TIM4_GetFlagStatus:
1173       00000001      OFST:	set	1
1176                     ; 473   FlagStatus bitstatus = RESET;
1178                     ; 476   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1180                     ; 478   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1182  0000 c452e5        	and	a,21221
1183  0003 2702          	jreq	L725
1184                     ; 480     bitstatus = SET;
1186  0005 a601          	ld	a,#1
1189  0007               L725:
1190                     ; 484     bitstatus = RESET;
1193                     ; 486   return ((FlagStatus)bitstatus);
1197  0007 81            	ret	
1232                     ; 497 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1232                     ; 498 {
1233                     .text:	section	.text,new
1234  0000               _TIM4_ClearFlag:
1238                     ; 500   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1240                     ; 502   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1242  0000 43            	cpl	a
1243  0001 c752e5        	ld	21221,a
1244                     ; 503 }
1247  0004 81            	ret	
1307                     ; 515 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1307                     ; 516 {
1308                     .text:	section	.text,new
1309  0000               _TIM4_GetITStatus:
1311  0000 88            	push	a
1312  0001 89            	pushw	x
1313       00000002      OFST:	set	2
1316                     ; 517   ITStatus bitstatus = RESET;
1318                     ; 519   uint8_t itStatus = 0x0, itEnable = 0x0;
1322                     ; 522   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1324                     ; 524   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1326  0002 c452e5        	and	a,21221
1327  0005 6b01          	ld	(OFST-1,sp),a
1329                     ; 526   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1331  0007 c652e4        	ld	a,21220
1332  000a 1403          	and	a,(OFST+1,sp)
1333  000c 6b02          	ld	(OFST+0,sp),a
1335                     ; 528   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1337  000e 7b01          	ld	a,(OFST-1,sp)
1338  0010 2708          	jreq	L775
1340  0012 7b02          	ld	a,(OFST+0,sp)
1341  0014 2704          	jreq	L775
1342                     ; 530     bitstatus = (ITStatus)SET;
1344  0016 a601          	ld	a,#1
1347  0018 2001          	jra	L106
1348  001a               L775:
1349                     ; 534     bitstatus = (ITStatus)RESET;
1351  001a 4f            	clr	a
1353  001b               L106:
1354                     ; 536   return ((ITStatus)bitstatus);
1358  001b 5b03          	addw	sp,#3
1359  001d 81            	ret	
1395                     ; 547 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1395                     ; 548 {
1396                     .text:	section	.text,new
1397  0000               _TIM4_ClearITPendingBit:
1401                     ; 550   assert_param(IS_TIM4_IT(TIM4_IT));
1403                     ; 553   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1405  0000 43            	cpl	a
1406  0001 c752e5        	ld	21221,a
1407                     ; 554 }
1410  0004 81            	ret	
1469                     ; 565 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1469                     ; 566 {
1470                     .text:	section	.text,new
1471  0000               _TIM4_DMACmd:
1473  0000 89            	pushw	x
1474       00000000      OFST:	set	0
1477                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
1479                     ; 569   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1481                     ; 571   if (NewState != DISABLE)
1483  0001 9f            	ld	a,xl
1484  0002 4d            	tnz	a
1485  0003 2706          	jreq	L156
1486                     ; 574     TIM4->DER |= (uint8_t)TIM4_DMASource;
1488  0005 9e            	ld	a,xh
1489  0006 ca52e3        	or	a,21219
1491  0009 2006          	jra	L356
1492  000b               L156:
1493                     ; 579     TIM4->DER &= (uint8_t)~TIM4_DMASource;
1495  000b 7b01          	ld	a,(OFST+1,sp)
1496  000d 43            	cpl	a
1497  000e c452e3        	and	a,21219
1498  0011               L356:
1499  0011 c752e3        	ld	21219,a
1500                     ; 581 }
1503  0014 85            	popw	x
1504  0015 81            	ret	
1528                     ; 604 void TIM4_InternalClockConfig(void)
1528                     ; 605 {
1529                     .text:	section	.text,new
1530  0000               _TIM4_InternalClockConfig:
1534                     ; 607   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1536  0000 c652e2        	ld	a,21218
1537  0003 a4f8          	and	a,#248
1538  0005 c752e2        	ld	21218,a
1539                     ; 608 }
1542  0008 81            	ret	
1624                     ; 648 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1624                     ; 649 {
1625                     .text:	section	.text,new
1626  0000               _TIM4_SelectInputTrigger:
1628  0000 88            	push	a
1629  0001 88            	push	a
1630       00000001      OFST:	set	1
1633                     ; 650   uint8_t tmpsmcr = 0;
1635                     ; 653   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1637                     ; 655   tmpsmcr = TIM4->SMCR;
1639  0002 c652e2        	ld	a,21218
1641                     ; 658   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1643  0005 a48f          	and	a,#143
1645                     ; 659   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1647  0007 1a02          	or	a,(OFST+1,sp)
1649                     ; 661   TIM4->SMCR = (uint8_t)tmpsmcr;
1651  0009 c752e2        	ld	21218,a
1652                     ; 662 }
1655  000c 85            	popw	x
1656  000d 81            	ret	
1729                     ; 673 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1729                     ; 674 {
1730                     .text:	section	.text,new
1731  0000               _TIM4_SelectOutputTrigger:
1733  0000 88            	push	a
1734  0001 88            	push	a
1735       00000001      OFST:	set	1
1738                     ; 675   uint8_t tmpcr2 = 0;
1740                     ; 678   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1742                     ; 680   tmpcr2 = TIM4->CR2;
1744  0002 c652e1        	ld	a,21217
1746                     ; 683   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1748  0005 a48f          	and	a,#143
1750                     ; 686   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1752  0007 1a02          	or	a,(OFST+1,sp)
1754                     ; 688   TIM4->CR2 = tmpcr2;
1756  0009 c752e1        	ld	21217,a
1757                     ; 689 }
1760  000c 85            	popw	x
1761  000d 81            	ret	
1850                     ; 703 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1850                     ; 704 {
1851                     .text:	section	.text,new
1852  0000               _TIM4_SelectSlaveMode:
1854  0000 88            	push	a
1855  0001 88            	push	a
1856       00000001      OFST:	set	1
1859                     ; 705   uint8_t tmpsmcr = 0;
1861                     ; 708   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1863                     ; 710   tmpsmcr = TIM4->SMCR;
1865  0002 c652e2        	ld	a,21218
1867                     ; 713   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1869  0005 a4f8          	and	a,#248
1871                     ; 716   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1873  0007 1a02          	or	a,(OFST+1,sp)
1875                     ; 718   TIM4->SMCR = tmpsmcr;
1877  0009 c752e2        	ld	21218,a
1878                     ; 719 }
1881  000c 85            	popw	x
1882  000d 81            	ret	
1918                     ; 727 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1918                     ; 728 {
1919                     .text:	section	.text,new
1920  0000               _TIM4_SelectMasterSlaveMode:
1924                     ; 730   assert_param(IS_FUNCTIONAL_STATE(NewState));
1926                     ; 733   if (NewState != DISABLE)
1928  0000 4d            	tnz	a
1929  0001 2705          	jreq	L7201
1930                     ; 735     TIM4->SMCR |= TIM4_SMCR_MSM;
1932  0003 721e52e2      	bset	21218,#7
1935  0007 81            	ret	
1936  0008               L7201:
1937                     ; 739     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1939  0008 721f52e2      	bres	21218,#7
1940                     ; 741 }
1943  000c 81            	ret	
1956                     	xdef	_TIM4_SelectMasterSlaveMode
1957                     	xdef	_TIM4_SelectSlaveMode
1958                     	xdef	_TIM4_SelectOutputTrigger
1959                     	xdef	_TIM4_SelectInputTrigger
1960                     	xdef	_TIM4_InternalClockConfig
1961                     	xdef	_TIM4_DMACmd
1962                     	xdef	_TIM4_ClearITPendingBit
1963                     	xdef	_TIM4_GetITStatus
1964                     	xdef	_TIM4_ClearFlag
1965                     	xdef	_TIM4_GetFlagStatus
1966                     	xdef	_TIM4_GenerateEvent
1967                     	xdef	_TIM4_ITConfig
1968                     	xdef	_TIM4_Cmd
1969                     	xdef	_TIM4_SelectOnePulseMode
1970                     	xdef	_TIM4_ARRPreloadConfig
1971                     	xdef	_TIM4_UpdateRequestConfig
1972                     	xdef	_TIM4_UpdateDisableConfig
1973                     	xdef	_TIM4_GetPrescaler
1974                     	xdef	_TIM4_GetCounter
1975                     	xdef	_TIM4_SetAutoreload
1976                     	xdef	_TIM4_SetCounter
1977                     	xdef	_TIM4_PrescalerConfig
1978                     	xdef	_TIM4_TimeBaseInit
1979                     	xdef	_TIM4_DeInit
1998                     	end
