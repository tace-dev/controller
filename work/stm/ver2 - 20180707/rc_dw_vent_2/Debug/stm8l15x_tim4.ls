   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 127 void TIM4_DeInit(void)
  50                     ; 128 {
  51                     .text:	section	.text,new
  52  0000               f_TIM4_DeInit:
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
  83  0020 87            	retf	
 248                     ; 162 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 248                     ; 163                        uint8_t TIM4_Period)
 248                     ; 164 {
 249                     .text:	section	.text,new
 250  0000               f_TIM4_TimeBaseInit:
 254                     ; 166   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
 256                     ; 168   TIM4->ARR = (uint8_t)(TIM4_Period);
 258  0000 9f            	ld	a,xl
 259  0001 c752e9        	ld	21225,a
 260                     ; 170   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 262  0004 9e            	ld	a,xh
 263  0005 c752e8        	ld	21224,a
 264                     ; 173   TIM4->EGR = TIM4_EventSource_Update;
 266  0008 350152e6      	mov	21222,#1
 267                     ; 174 }
 270  000c 87            	retf	
 337                     ; 202 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
 337                     ; 203                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 337                     ; 204 {
 338                     .text:	section	.text,new
 339  0000               f_TIM4_PrescalerConfig:
 343                     ; 206   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
 345                     ; 207   assert_param(IS_TIM4_Prescaler(Prescaler));
 347                     ; 210   TIM4->PSCR = (uint8_t) Prescaler;
 349  0000 9e            	ld	a,xh
 350  0001 c752e8        	ld	21224,a
 351                     ; 213   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
 353  0004 9f            	ld	a,xl
 354  0005 4a            	dec	a
 355  0006 2605          	jrne	L731
 356                     ; 215     TIM4->EGR |= TIM4_EGR_UG ;
 358  0008 721052e6      	bset	21222,#0
 361  000c 87            	retf	
 362  000d               L731:
 363                     ; 219     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
 365  000d 721152e6      	bres	21222,#0
 366                     ; 221 }
 369  0011 87            	retf	
 400                     ; 229 void TIM4_SetCounter(uint8_t Counter)
 400                     ; 230 {
 401                     .text:	section	.text,new
 402  0000               f_TIM4_SetCounter:
 406                     ; 232   TIM4->CNTR = (uint8_t)(Counter);
 408  0000 c752e7        	ld	21223,a
 409                     ; 233 }
 412  0003 87            	retf	
 443                     ; 241 void TIM4_SetAutoreload(uint8_t Autoreload)
 443                     ; 242 {
 444                     .text:	section	.text,new
 445  0000               f_TIM4_SetAutoreload:
 449                     ; 244   TIM4->ARR = (uint8_t)(Autoreload);
 451  0000 c752e9        	ld	21225,a
 452                     ; 245 }
 455  0003 87            	retf	
 486                     ; 252 uint8_t TIM4_GetCounter(void)
 486                     ; 253 {
 487                     .text:	section	.text,new
 488  0000               f_TIM4_GetCounter:
 490  0000 88            	push	a
 491       00000001      OFST:	set	1
 494                     ; 254   uint8_t tmpcntr = 0;
 496                     ; 255   tmpcntr = TIM4->CNTR;
 498  0001 c652e7        	ld	a,21223
 499                     ; 257   return ((uint8_t)tmpcntr);
 503  0004 5b01          	addw	sp,#1
 504  0006 87            	retf	
 527                     ; 281 TIM4_Prescaler_TypeDef TIM4_GetPrescaler(void)
 527                     ; 282 {
 528                     .text:	section	.text,new
 529  0000               f_TIM4_GetPrescaler:
 533                     ; 284   return ((TIM4_Prescaler_TypeDef)TIM4->PSCR);
 535  0000 c652e8        	ld	a,21224
 538  0003 87            	retf	
 593                     ; 293 void TIM4_UpdateDisableConfig(FunctionalState NewState)
 593                     ; 294 {
 594                     .text:	section	.text,new
 595  0000               f_TIM4_UpdateDisableConfig:
 599                     ; 296   assert_param(IS_FUNCTIONAL_STATE(NewState));
 601                     ; 299   if (NewState != DISABLE)
 603  0000 4d            	tnz	a
 604  0001 2705          	jreq	L542
 605                     ; 301     TIM4->CR1 |= TIM4_CR1_UDIS ;
 607  0003 721252e0      	bset	21216,#1
 610  0007 87            	retf	
 611  0008               L542:
 612                     ; 305     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 614  0008 721352e0      	bres	21216,#1
 615                     ; 307 }
 618  000c 87            	retf	
 675                     ; 317 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 675                     ; 318 {
 676                     .text:	section	.text,new
 677  0000               f_TIM4_UpdateRequestConfig:
 681                     ; 320   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 683                     ; 323   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 685  0000 4a            	dec	a
 686  0001 2605          	jrne	L772
 687                     ; 325     TIM4->CR1 |= TIM4_CR1_URS ;
 689  0003 721452e0      	bset	21216,#2
 692  0007 87            	retf	
 693  0008               L772:
 694                     ; 329     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 696  0008 721552e0      	bres	21216,#2
 697                     ; 331 }
 700  000c 87            	retf	
 735                     ; 339 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 735                     ; 340 {
 736                     .text:	section	.text,new
 737  0000               f_TIM4_ARRPreloadConfig:
 741                     ; 342   assert_param(IS_FUNCTIONAL_STATE(NewState));
 743                     ; 345   if (NewState != DISABLE)
 745  0000 4d            	tnz	a
 746  0001 2705          	jreq	L123
 747                     ; 347     TIM4->CR1 |= TIM4_CR1_ARPE ;
 749  0003 721e52e0      	bset	21216,#7
 752  0007 87            	retf	
 753  0008               L123:
 754                     ; 351     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 756  0008 721f52e0      	bres	21216,#7
 757                     ; 353 }
 760  000c 87            	retf	
 816                     ; 363 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 816                     ; 364 {
 817                     .text:	section	.text,new
 818  0000               f_TIM4_SelectOnePulseMode:
 822                     ; 366   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 824                     ; 369   if (TIM4_OPMode == TIM4_OPMode_Single)
 826  0000 4a            	dec	a
 827  0001 2605          	jrne	L353
 828                     ; 371     TIM4->CR1 |= TIM4_CR1_OPM ;
 830  0003 721652e0      	bset	21216,#3
 833  0007 87            	retf	
 834  0008               L353:
 835                     ; 375     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 837  0008 721752e0      	bres	21216,#3
 838                     ; 377 }
 841  000c 87            	retf	
 875                     ; 385 void TIM4_Cmd(FunctionalState NewState)
 875                     ; 386 {
 876                     .text:	section	.text,new
 877  0000               f_TIM4_Cmd:
 881                     ; 388   assert_param(IS_FUNCTIONAL_STATE(NewState));
 883                     ; 391   if (NewState != DISABLE)
 885  0000 4d            	tnz	a
 886  0001 2705          	jreq	L573
 887                     ; 393     TIM4->CR1 |= TIM4_CR1_CEN ;
 889  0003 721052e0      	bset	21216,#0
 892  0007 87            	retf	
 893  0008               L573:
 894                     ; 397     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 896  0008 721152e0      	bres	21216,#0
 897                     ; 399 }
 900  000c 87            	retf	
 964                     ; 427 void TIM4_ITConfig(TIM4_IT_TypeDef TIM4_IT, FunctionalState NewState)
 964                     ; 428 {
 965                     .text:	section	.text,new
 966  0000               f_TIM4_ITConfig:
 968  0000 89            	pushw	x
 969       00000000      OFST:	set	0
 972                     ; 430   assert_param(IS_TIM4_IT(TIM4_IT));
 974                     ; 431   assert_param(IS_FUNCTIONAL_STATE(NewState));
 976                     ; 433   if (NewState != DISABLE)
 978  0001 9f            	ld	a,xl
 979  0002 4d            	tnz	a
 980  0003 2706          	jreq	L334
 981                     ; 436     TIM4->IER |= (uint8_t)TIM4_IT;
 983  0005 9e            	ld	a,xh
 984  0006 ca52e4        	or	a,21220
 986  0009 2006          	jra	L534
 987  000b               L334:
 988                     ; 441     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
 990  000b 7b01          	ld	a,(OFST+1,sp)
 991  000d 43            	cpl	a
 992  000e c452e4        	and	a,21220
 993  0011               L534:
 994  0011 c752e4        	ld	21220,a
 995                     ; 443 }
 998  0014 85            	popw	x
 999  0015 87            	retf	
1055                     ; 453 void TIM4_GenerateEvent(TIM4_EventSource_TypeDef TIM4_EventSource)
1055                     ; 454 {
1056                     .text:	section	.text,new
1057  0000               f_TIM4_GenerateEvent:
1061                     ; 456   assert_param(IS_TIM4_EVENT_SOURCE((uint8_t)TIM4_EventSource));
1063                     ; 459   TIM4->EGR |= (uint8_t)TIM4_EventSource;
1065  0000 ca52e6        	or	a,21222
1066  0003 c752e6        	ld	21222,a
1067                     ; 460 }
1070  0006 87            	retf	
1155                     ; 471 FlagStatus TIM4_GetFlagStatus(TIM4_FLAG_TypeDef TIM4_FLAG)
1155                     ; 472 {
1156                     .text:	section	.text,new
1157  0000               f_TIM4_GetFlagStatus:
1159  0000 88            	push	a
1160       00000001      OFST:	set	1
1163                     ; 473   FlagStatus bitstatus = RESET;
1165                     ; 476   assert_param(IS_TIM4_GET_FLAG(TIM4_FLAG));
1167                     ; 478   if ((TIM4->SR1 & (uint8_t)TIM4_FLAG)  != 0)
1169  0001 c452e5        	and	a,21221
1170  0004 2702          	jreq	L725
1171                     ; 480     bitstatus = SET;
1173  0006 a601          	ld	a,#1
1175  0008               L725:
1176                     ; 484     bitstatus = RESET;
1178                     ; 486   return ((FlagStatus)bitstatus);
1182  0008 5b01          	addw	sp,#1
1183  000a 87            	retf	
1217                     ; 497 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1217                     ; 498 {
1218                     .text:	section	.text,new
1219  0000               f_TIM4_ClearFlag:
1223                     ; 500   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1225                     ; 502   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1227  0000 43            	cpl	a
1228  0001 c752e5        	ld	21221,a
1229                     ; 503 }
1232  0004 87            	retf	
1291                     ; 515 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1291                     ; 516 {
1292                     .text:	section	.text,new
1293  0000               f_TIM4_GetITStatus:
1295  0000 88            	push	a
1296  0001 89            	pushw	x
1297       00000002      OFST:	set	2
1300                     ; 517   ITStatus bitstatus = RESET;
1302                     ; 519   uint8_t itStatus = 0x0, itEnable = 0x0;
1306                     ; 522   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1308                     ; 524   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1310  0002 c452e5        	and	a,21221
1311  0005 6b01          	ld	(OFST-1,sp),a
1312                     ; 526   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1314  0007 c652e4        	ld	a,21220
1315  000a 1403          	and	a,(OFST+1,sp)
1316  000c 6b02          	ld	(OFST+0,sp),a
1317                     ; 528   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1319  000e 7b01          	ld	a,(OFST-1,sp)
1320  0010 2708          	jreq	L775
1322  0012 7b02          	ld	a,(OFST+0,sp)
1323  0014 2704          	jreq	L775
1324                     ; 530     bitstatus = (ITStatus)SET;
1326  0016 a601          	ld	a,#1
1328  0018 2001          	jra	L106
1329  001a               L775:
1330                     ; 534     bitstatus = (ITStatus)RESET;
1332  001a 4f            	clr	a
1333  001b               L106:
1334                     ; 536   return ((ITStatus)bitstatus);
1338  001b 5b03          	addw	sp,#3
1339  001d 87            	retf	
1374                     ; 547 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1374                     ; 548 {
1375                     .text:	section	.text,new
1376  0000               f_TIM4_ClearITPendingBit:
1380                     ; 550   assert_param(IS_TIM4_IT(TIM4_IT));
1382                     ; 553   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1384  0000 43            	cpl	a
1385  0001 c752e5        	ld	21221,a
1386                     ; 554 }
1389  0004 87            	retf	
1447                     ; 565 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1447                     ; 566 {
1448                     .text:	section	.text,new
1449  0000               f_TIM4_DMACmd:
1451  0000 89            	pushw	x
1452       00000000      OFST:	set	0
1455                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
1457                     ; 569   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1459                     ; 571   if (NewState != DISABLE)
1461  0001 9f            	ld	a,xl
1462  0002 4d            	tnz	a
1463  0003 2706          	jreq	L156
1464                     ; 574     TIM4->DER |= (uint8_t)TIM4_DMASource;
1466  0005 9e            	ld	a,xh
1467  0006 ca52e3        	or	a,21219
1469  0009 2006          	jra	L356
1470  000b               L156:
1471                     ; 579     TIM4->DER &= (uint8_t)~TIM4_DMASource;
1473  000b 7b01          	ld	a,(OFST+1,sp)
1474  000d 43            	cpl	a
1475  000e c452e3        	and	a,21219
1476  0011               L356:
1477  0011 c752e3        	ld	21219,a
1478                     ; 581 }
1481  0014 85            	popw	x
1482  0015 87            	retf	
1505                     ; 604 void TIM4_InternalClockConfig(void)
1505                     ; 605 {
1506                     .text:	section	.text,new
1507  0000               f_TIM4_InternalClockConfig:
1511                     ; 607   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1513  0000 c652e2        	ld	a,21218
1514  0003 a4f8          	and	a,#248
1515  0005 c752e2        	ld	21218,a
1516                     ; 608 }
1519  0008 87            	retf	
1600                     ; 648 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1600                     ; 649 {
1601                     .text:	section	.text,new
1602  0000               f_TIM4_SelectInputTrigger:
1604  0000 88            	push	a
1605  0001 88            	push	a
1606       00000001      OFST:	set	1
1609                     ; 650   uint8_t tmpsmcr = 0;
1611                     ; 653   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1613                     ; 655   tmpsmcr = TIM4->SMCR;
1615  0002 c652e2        	ld	a,21218
1616                     ; 658   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1618  0005 a48f          	and	a,#143
1619                     ; 659   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1621  0007 1a02          	or	a,(OFST+1,sp)
1622                     ; 661   TIM4->SMCR = (uint8_t)tmpsmcr;
1624  0009 c752e2        	ld	21218,a
1625                     ; 662 }
1628  000c 85            	popw	x
1629  000d 87            	retf	
1701                     ; 673 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1701                     ; 674 {
1702                     .text:	section	.text,new
1703  0000               f_TIM4_SelectOutputTrigger:
1705  0000 88            	push	a
1706  0001 88            	push	a
1707       00000001      OFST:	set	1
1710                     ; 675   uint8_t tmpcr2 = 0;
1712                     ; 678   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1714                     ; 680   tmpcr2 = TIM4->CR2;
1716  0002 c652e1        	ld	a,21217
1717                     ; 683   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1719  0005 a48f          	and	a,#143
1720                     ; 686   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1722  0007 1a02          	or	a,(OFST+1,sp)
1723                     ; 688   TIM4->CR2 = tmpcr2;
1725  0009 c752e1        	ld	21217,a
1726                     ; 689 }
1729  000c 85            	popw	x
1730  000d 87            	retf	
1818                     ; 703 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1818                     ; 704 {
1819                     .text:	section	.text,new
1820  0000               f_TIM4_SelectSlaveMode:
1822  0000 88            	push	a
1823  0001 88            	push	a
1824       00000001      OFST:	set	1
1827                     ; 705   uint8_t tmpsmcr = 0;
1829                     ; 708   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1831                     ; 710   tmpsmcr = TIM4->SMCR;
1833  0002 c652e2        	ld	a,21218
1834                     ; 713   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1836  0005 a4f8          	and	a,#248
1837                     ; 716   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1839  0007 1a02          	or	a,(OFST+1,sp)
1840                     ; 718   TIM4->SMCR = tmpsmcr;
1842  0009 c752e2        	ld	21218,a
1843                     ; 719 }
1846  000c 85            	popw	x
1847  000d 87            	retf	
1882                     ; 727 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1882                     ; 728 {
1883                     .text:	section	.text,new
1884  0000               f_TIM4_SelectMasterSlaveMode:
1888                     ; 730   assert_param(IS_FUNCTIONAL_STATE(NewState));
1890                     ; 733   if (NewState != DISABLE)
1892  0000 4d            	tnz	a
1893  0001 2705          	jreq	L7201
1894                     ; 735     TIM4->SMCR |= TIM4_SMCR_MSM;
1896  0003 721e52e2      	bset	21218,#7
1899  0007 87            	retf	
1900  0008               L7201:
1901                     ; 739     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1903  0008 721f52e2      	bres	21218,#7
1904                     ; 741 }
1907  000c 87            	retf	
1919                     	xdef	f_TIM4_SelectMasterSlaveMode
1920                     	xdef	f_TIM4_SelectSlaveMode
1921                     	xdef	f_TIM4_SelectOutputTrigger
1922                     	xdef	f_TIM4_SelectInputTrigger
1923                     	xdef	f_TIM4_InternalClockConfig
1924                     	xdef	f_TIM4_DMACmd
1925                     	xdef	f_TIM4_ClearITPendingBit
1926                     	xdef	f_TIM4_GetITStatus
1927                     	xdef	f_TIM4_ClearFlag
1928                     	xdef	f_TIM4_GetFlagStatus
1929                     	xdef	f_TIM4_GenerateEvent
1930                     	xdef	f_TIM4_ITConfig
1931                     	xdef	f_TIM4_Cmd
1932                     	xdef	f_TIM4_SelectOnePulseMode
1933                     	xdef	f_TIM4_ARRPreloadConfig
1934                     	xdef	f_TIM4_UpdateRequestConfig
1935                     	xdef	f_TIM4_UpdateDisableConfig
1936                     	xdef	f_TIM4_GetPrescaler
1937                     	xdef	f_TIM4_GetCounter
1938                     	xdef	f_TIM4_SetAutoreload
1939                     	xdef	f_TIM4_SetCounter
1940                     	xdef	f_TIM4_PrescalerConfig
1941                     	xdef	f_TIM4_TimeBaseInit
1942                     	xdef	f_TIM4_DeInit
1961                     	end
