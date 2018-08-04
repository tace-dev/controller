   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
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
 496  0000 88            	push	a
 497       00000001      OFST:	set	1
 500                     ; 254   uint8_t tmpcntr = 0;
 502                     ; 255   tmpcntr = TIM4->CNTR;
 504  0001 c652e7        	ld	a,21223
 505                     ; 257   return ((uint8_t)tmpcntr);
 509  0004 5b01          	addw	sp,#1
 510  0006 81            	ret	
 534                     ; 281 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 534                     ; 282 {
 535                     .text:	section	.text,new
 536  0000               _TIM4_GetPrescaler:
 540                     ; 284   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 542  0000 c652e8        	ld	a,21224
 545  0003 81            	ret	
 601                     ; 293 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 601                     ; 294 {
 602                     .text:	section	.text,new
 603  0000               _TIM4_UpdateDisableConfig:
 607                     ; 296   assert_param(IS_FUNCTIONAL_STATE(NewState));
 609                     ; 299   if (NewState != DISABLE)
 611  0000 4d            	tnz	a
 612  0001 2705          	jreq	L542
 613                     ; 301     TIM4->CR1 |= TIM4_CR1_UDIS ;
 615  0003 721252e0      	bset	21216,#1
 618  0007 81            	ret	
 619  0008               L542:
 620                     ; 305     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 622  0008 721352e0      	bres	21216,#1
 623                     ; 307 }
 626  000c 81            	ret	
 684                     ; 317 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 684                     ; 318 {
 685                     .text:	section	.text,new
 686  0000               _TIM4_UpdateRequestConfig:
 690                     ; 320   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 692                     ; 323   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 694  0000 4a            	dec	a
 695  0001 2605          	jrne	L772
 696                     ; 325     TIM4->CR1 |= TIM4_CR1_URS ;
 698  0003 721452e0      	bset	21216,#2
 701  0007 81            	ret	
 702  0008               L772:
 703                     ; 329     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 705  0008 721552e0      	bres	21216,#2
 706                     ; 331 }
 709  000c 81            	ret	
 745                     ; 339 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 745                     ; 340 {
 746                     .text:	section	.text,new
 747  0000               _TIM4_ARRPreloadConfig:
 751                     ; 342   assert_param(IS_FUNCTIONAL_STATE(NewState));
 753                     ; 345   if (NewState != DISABLE)
 755  0000 4d            	tnz	a
 756  0001 2705          	jreq	L123
 757                     ; 347     TIM4->CR1 |= TIM4_CR1_ARPE ;
 759  0003 721e52e0      	bset	21216,#7
 762  0007 81            	ret	
 763  0008               L123:
 764                     ; 351     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 766  0008 721f52e0      	bres	21216,#7
 767                     ; 353 }
 770  000c 81            	ret	
 827                     ; 363 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 827                     ; 364 {
 828                     .text:	section	.text,new
 829  0000               _TIM4_SelectOnePulseMode:
 833                     ; 366   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 835                     ; 369   if (TIM4_OPMode == TIM4_OPMode_Single)
 837  0000 4a            	dec	a
 838  0001 2605          	jrne	L353
 839                     ; 371     TIM4->CR1 |= TIM4_CR1_OPM ;
 841  0003 721652e0      	bset	21216,#3
 844  0007 81            	ret	
 845  0008               L353:
 846                     ; 375     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 848  0008 721752e0      	bres	21216,#3
 849                     ; 377 }
 852  000c 81            	ret	
 887                     ; 385 void TIM4_Cmd(FunctionalState NewState)
 887                     ; 386 {
 888                     .text:	section	.text,new
 889  0000               _TIM4_Cmd:
 893                     ; 388   assert_param(IS_FUNCTIONAL_STATE(NewState));
 895                     ; 391   if (NewState != DISABLE)
 897  0000 4d            	tnz	a
 898  0001 2705          	jreq	L573
 899                     ; 393     TIM4->CR1 |= TIM4_CR1_CEN ;
 901  0003 721052e0      	bset	21216,#0
 904  0007 81            	ret	
 905  0008               L573:
 906                     ; 397     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 908  0008 721152e0      	bres	21216,#0
 909                     ; 399 }
 912  000c 81            	ret	
 977                     ; 427 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 977                     ; 428 {
 978                     .text:	section	.text,new
 979  0000               _TIM4_ITConfig:
 981  0000 89            	pushw	x
 982       00000000      OFST:	set	0
 985                     ; 430   assert_param(IS_TIM4_IT(TIM4_IT));
 987                     ; 431   assert_param(IS_FUNCTIONAL_STATE(NewState));
 989                     ; 433   if (NewState != DISABLE)
 991  0001 9f            	ld	a,xl
 992  0002 4d            	tnz	a
 993  0003 2706          	jreq	L334
 994                     ; 436     TIM4->IER |= (uint8_t)TIM4_IT;
 996  0005 9e            	ld	a,xh
 997  0006 ca52e4        	or	a,21220
 999  0009 2006          	jra	L534
1000  000b               L334:
1001                     ; 441     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
1003  000b 7b01          	ld	a,(OFST+1,sp)
1004  000d 43            	cpl	a
1005  000e c452e4        	and	a,21220
1006  0011               L534:
1007  0011 c752e4        	ld	21220,a
1008                     ; 443 }
1011  0014 85            	popw	x
1012  0015 81            	ret	
1069                     ; 453 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1069                     ; 454 {
1070                     .text:	section	.text,new
1071  0000               _TIM4_GenerateEvent:
1075                     ; 456   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1077                     ; 459   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1079  0000 ca52e6        	or	a,21222
1080  0003 c752e6        	ld	21222,a
1081                     ; 460 }
1084  0006 81            	ret	
1170                     ; 471 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1170                     ; 472 {
1171                     .text:	section	.text,new
1172  0000               _TIM4_GetFlagStatus:
1174  0000 88            	push	a
1175       00000001      OFST:	set	1
1178                     ; 473   FlagStatus bitstatus = RESET;
1180                     ; 476   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1182                     ; 478   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1184  0001 c452e5        	and	a,21221
1185  0004 2702          	jreq	L725
1186                     ; 480     bitstatus = SET;
1188  0006 a601          	ld	a,#1
1190  0008               L725:
1191                     ; 484     bitstatus = RESET;
1193                     ; 486   return ((FlagStatus)bitstatus);
1197  0008 5b01          	addw	sp,#1
1198  000a 81            	ret	
1233                     ; 497 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1233                     ; 498 {
1234                     .text:	section	.text,new
1235  0000               _TIM4_ClearFlag:
1239                     ; 500   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1241                     ; 502   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1243  0000 43            	cpl	a
1244  0001 c752e5        	ld	21221,a
1245                     ; 503 }
1248  0004 81            	ret	
1308                     ; 515 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1308                     ; 516 {
1309                     .text:	section	.text,new
1310  0000               _TIM4_GetITStatus:
1312  0000 88            	push	a
1313  0001 89            	pushw	x
1314       00000002      OFST:	set	2
1317                     ; 517   ITStatus bitstatus = RESET;
1319                     ; 519   uint8_t itStatus = 0x0, itEnable = 0x0;
1323                     ; 522   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1325                     ; 524   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1327  0002 c452e5        	and	a,21221
1328  0005 6b01          	ld	(OFST-1,sp),a
1329                     ; 526   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1331  0007 c652e4        	ld	a,21220
1332  000a 1403          	and	a,(OFST+1,sp)
1333  000c 6b02          	ld	(OFST+0,sp),a
1334                     ; 528   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1336  000e 7b01          	ld	a,(OFST-1,sp)
1337  0010 2708          	jreq	L775
1339  0012 7b02          	ld	a,(OFST+0,sp)
1340  0014 2704          	jreq	L775
1341                     ; 530     bitstatus = (ITStatus)SET;
1343  0016 a601          	ld	a,#1
1345  0018 2001          	jra	L106
1346  001a               L775:
1347                     ; 534     bitstatus = (ITStatus)RESET;
1349  001a 4f            	clr	a
1350  001b               L106:
1351                     ; 536   return ((ITStatus)bitstatus);
1355  001b 5b03          	addw	sp,#3
1356  001d 81            	ret	
1392                     ; 547 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1392                     ; 548 {
1393                     .text:	section	.text,new
1394  0000               _TIM4_ClearITPendingBit:
1398                     ; 550   assert_param(IS_TIM4_IT(TIM4_IT));
1400                     ; 553   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1402  0000 43            	cpl	a
1403  0001 c752e5        	ld	21221,a
1404                     ; 554 }
1407  0004 81            	ret	
1466                     ; 565 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1466                     ; 566 {
1467                     .text:	section	.text,new
1468  0000               _TIM4_DMACmd:
1470  0000 89            	pushw	x
1471       00000000      OFST:	set	0
1474                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
1476                     ; 569   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1478                     ; 571   if (NewState != DISABLE)
1480  0001 9f            	ld	a,xl
1481  0002 4d            	tnz	a
1482  0003 2706          	jreq	L156
1483                     ; 574     TIM4->DER |= (uint8_t)TIM4_DMASource;
1485  0005 9e            	ld	a,xh
1486  0006 ca52e3        	or	a,21219
1488  0009 2006          	jra	L356
1489  000b               L156:
1490                     ; 579     TIM4->DER &= (uint8_t)~TIM4_DMASource;
1492  000b 7b01          	ld	a,(OFST+1,sp)
1493  000d 43            	cpl	a
1494  000e c452e3        	and	a,21219
1495  0011               L356:
1496  0011 c752e3        	ld	21219,a
1497                     ; 581 }
1500  0014 85            	popw	x
1501  0015 81            	ret	
1525                     ; 604 void TIM4_InternalClockConfig(void)
1525                     ; 605 {
1526                     .text:	section	.text,new
1527  0000               _TIM4_InternalClockConfig:
1531                     ; 607   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1533  0000 c652e2        	ld	a,21218
1534  0003 a4f8          	and	a,#248
1535  0005 c752e2        	ld	21218,a
1536                     ; 608 }
1539  0008 81            	ret	
1621                     ; 648 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1621                     ; 649 {
1622                     .text:	section	.text,new
1623  0000               _TIM4_SelectInputTrigger:
1625  0000 88            	push	a
1626  0001 88            	push	a
1627       00000001      OFST:	set	1
1630                     ; 650   uint8_t tmpsmcr = 0;
1632                     ; 653   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1634                     ; 655   tmpsmcr = TIM4->SMCR;
1636  0002 c652e2        	ld	a,21218
1637                     ; 658   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1639  0005 a48f          	and	a,#143
1640                     ; 659   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1642  0007 1a02          	or	a,(OFST+1,sp)
1643                     ; 661   TIM4->SMCR = (uint8_t)tmpsmcr;
1645  0009 c752e2        	ld	21218,a
1646                     ; 662 }
1649  000c 85            	popw	x
1650  000d 81            	ret	
1723                     ; 673 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1723                     ; 674 {
1724                     .text:	section	.text,new
1725  0000               _TIM4_SelectOutputTrigger:
1727  0000 88            	push	a
1728  0001 88            	push	a
1729       00000001      OFST:	set	1
1732                     ; 675   uint8_t tmpcr2 = 0;
1734                     ; 678   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1736                     ; 680   tmpcr2 = TIM4->CR2;
1738  0002 c652e1        	ld	a,21217
1739                     ; 683   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1741  0005 a48f          	and	a,#143
1742                     ; 686   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1744  0007 1a02          	or	a,(OFST+1,sp)
1745                     ; 688   TIM4->CR2 = tmpcr2;
1747  0009 c752e1        	ld	21217,a
1748                     ; 689 }
1751  000c 85            	popw	x
1752  000d 81            	ret	
1841                     ; 703 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1841                     ; 704 {
1842                     .text:	section	.text,new
1843  0000               _TIM4_SelectSlaveMode:
1845  0000 88            	push	a
1846  0001 88            	push	a
1847       00000001      OFST:	set	1
1850                     ; 705   uint8_t tmpsmcr = 0;
1852                     ; 708   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1854                     ; 710   tmpsmcr = TIM4->SMCR;
1856  0002 c652e2        	ld	a,21218
1857                     ; 713   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1859  0005 a4f8          	and	a,#248
1860                     ; 716   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1862  0007 1a02          	or	a,(OFST+1,sp)
1863                     ; 718   TIM4->SMCR = tmpsmcr;
1865  0009 c752e2        	ld	21218,a
1866                     ; 719 }
1869  000c 85            	popw	x
1870  000d 81            	ret	
1906                     ; 727 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1906                     ; 728 {
1907                     .text:	section	.text,new
1908  0000               _TIM4_SelectMasterSlaveMode:
1912                     ; 730   assert_param(IS_FUNCTIONAL_STATE(NewState));
1914                     ; 733   if (NewState != DISABLE)
1916  0000 4d            	tnz	a
1917  0001 2705          	jreq	L7201
1918                     ; 735     TIM4->SMCR |= TIM4_SMCR_MSM;
1920  0003 721e52e2      	bset	21218,#7
1923  0007 81            	ret	
1924  0008               L7201:
1925                     ; 739     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1927  0008 721f52e2      	bres	21218,#7
1928                     ; 741 }
1931  000c 81            	ret	
1944                     	xdef	_TIM4_SelectMasterSlaveMode
1945                     	xdef	_TIM4_SelectSlaveMode
1946                     	xdef	_TIM4_SelectOutputTrigger
1947                     	xdef	_TIM4_SelectInputTrigger
1948                     	xdef	_TIM4_InternalClockConfig
1949                     	xdef	_TIM4_DMACmd
1950                     	xdef	_TIM4_ClearITPendingBit
1951                     	xdef	_TIM4_GetITStatus
1952                     	xdef	_TIM4_ClearFlag
1953                     	xdef	_TIM4_GetFlagStatus
1954                     	xdef	_TIM4_GenerateEvent
1955                     	xdef	_TIM4_ITConfig
1956                     	xdef	_TIM4_Cmd
1957                     	xdef	_TIM4_SelectOnePulseMode
1958                     	xdef	_TIM4_ARRPreloadConfig
1959                     	xdef	_TIM4_UpdateRequestConfig
1960                     	xdef	_TIM4_UpdateDisableConfig
1961                     	xdef	_TIM4_GetPrescaler
1962                     	xdef	_TIM4_GetCounter
1963                     	xdef	_TIM4_SetAutoreload
1964                     	xdef	_TIM4_SetCounter
1965                     	xdef	_TIM4_PrescalerConfig
1966                     	xdef	_TIM4_TimeBaseInit
1967                     	xdef	_TIM4_DeInit
1986                     	end
