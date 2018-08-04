   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  47                     ; 127 void TIM4_DeInit(void)
  47                     ; 128 {
  49                     .text:	section	.text,new
  50  0000               _TIM4_DeInit:
  54                     ; 129   TIM4->CR1   = TIM4_CR1_RESET_VALUE;
  56  0000 725f52e0      	clr	21216
  57                     ; 130   TIM4->CR2   = TIM4_CR2_RESET_VALUE;
  59  0004 725f52e1      	clr	21217
  60                     ; 131   TIM4->SMCR   = TIM4_SMCR_RESET_VALUE;
  62  0008 725f52e2      	clr	21218
  63                     ; 132   TIM4->IER   = TIM4_IER_RESET_VALUE;
  65  000c 725f52e4      	clr	21220
  66                     ; 133   TIM4->CNTR   = TIM4_CNTR_RESET_VALUE;
  68  0010 725f52e7      	clr	21223
  69                     ; 134   TIM4->PSCR  = TIM4_PSCR_RESET_VALUE;
  71  0014 725f52e8      	clr	21224
  72                     ; 135   TIM4->ARR   = TIM4_ARR_RESET_VALUE;
  74  0018 35ff52e9      	mov	21225,#255
  75                     ; 136   TIM4->SR1   = TIM4_SR1_RESET_VALUE;
  77  001c 725f52e5      	clr	21221
  78                     ; 137 }
  81  0020 81            	ret
 247                     ; 162 void TIM4_TimeBaseInit(TIM4_Prescaler_TypeDef TIM4_Prescaler,
 247                     ; 163                        uint8_t TIM4_Period)
 247                     ; 164 {
 248                     .text:	section	.text,new
 249  0000               _TIM4_TimeBaseInit:
 253                     ; 166   assert_param(IS_TIM4_Prescaler(TIM4_Prescaler));
 255                     ; 168   TIM4->ARR = (uint8_t)(TIM4_Period);
 257  0000 9f            	ld	a,xl
 258  0001 c752e9        	ld	21225,a
 259                     ; 170   TIM4->PSCR = (uint8_t)(TIM4_Prescaler);
 261  0004 9e            	ld	a,xh
 262  0005 c752e8        	ld	21224,a
 263                     ; 173   TIM4->EGR = TIM4_EventSource_Update;
 265  0008 350152e6      	mov	21222,#1
 266                     ; 174 }
 269  000c 81            	ret
 337                     ; 202 void TIM4_PrescalerConfig(TIM4_Prescaler_TypeDef Prescaler,
 337                     ; 203                           TIM4_PSCReloadMode_TypeDef TIM4_PSCReloadMode)
 337                     ; 204 {
 338                     .text:	section	.text,new
 339  0000               _TIM4_PrescalerConfig:
 343                     ; 206   assert_param(IS_TIM4_Prescaler_RELOAD(TIM4_PSCReloadMode));
 345                     ; 207   assert_param(IS_TIM4_Prescaler(Prescaler));
 347                     ; 210   TIM4->PSCR = (uint8_t) Prescaler;
 349  0000 9e            	ld	a,xh
 350  0001 c752e8        	ld	21224,a
 351                     ; 213   if (TIM4_PSCReloadMode == TIM4_PSCReloadMode_Immediate)
 353  0004 9f            	ld	a,xl
 354  0005 a101          	cp	a,#1
 355  0007 2606          	jrne	L731
 356                     ; 215     TIM4->EGR |= TIM4_EGR_UG ;
 358  0009 721052e6      	bset	21222,#0
 360  000d 2004          	jra	L141
 361  000f               L731:
 362                     ; 219     TIM4->EGR &= (uint8_t)(~TIM4_EGR_UG) ;
 364  000f 721152e6      	bres	21222,#0
 365  0013               L141:
 366                     ; 221 }
 369  0013 81            	ret
 401                     ; 229 void TIM4_SetCounter(uint8_t Counter)
 401                     ; 230 {
 402                     .text:	section	.text,new
 403  0000               _TIM4_SetCounter:
 407                     ; 232   TIM4->CNTR = (uint8_t)(Counter);
 409  0000 c752e7        	ld	21223,a
 410                     ; 233 }
 413  0003 81            	ret
 445                     ; 241 void TIM4_SetAutoreload(uint8_t Autoreload)
 445                     ; 242 {
 446                     .text:	section	.text,new
 447  0000               _TIM4_SetAutoreload:
 451                     ; 244   TIM4->ARR = (uint8_t)(Autoreload);
 453  0000 c752e9        	ld	21225,a
 454                     ; 245 }
 457  0003 81            	ret
 489                     ; 252 uint8_t TIM4_GetCounter(void)
 489                     ; 253 {
 490                     .text:	section	.text,new
 491  0000               _TIM4_GetCounter:
 493  0000 88            	push	a
 494       00000001      OFST:	set	1
 497                     ; 254   uint8_t tmpcntr = 0;
 499                     ; 255   tmpcntr = TIM4->CNTR;
 501  0001 c652e7        	ld	a,21223
 502  0004 6b01          	ld	(OFST+0,sp),a
 503                     ; 257   return ((uint8_t)tmpcntr);
 505  0006 7b01          	ld	a,(OFST+0,sp)
 508  0008 5b01          	addw	sp,#1
 509  000a 81            	ret
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
 611  0001 2706          	jreq	L542
 612                     ; 301     TIM4->CR1 |= TIM4_CR1_UDIS ;
 614  0003 721252e0      	bset	21216,#1
 616  0007 2004          	jra	L742
 617  0009               L542:
 618                     ; 305     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_UDIS) ;
 620  0009 721352e0      	bres	21216,#1
 621  000d               L742:
 622                     ; 307 }
 625  000d 81            	ret
 683                     ; 317 void TIM4_UpdateRequestConfig(TIM4_UpdateSource_TypeDef TIM4_UpdateSource)
 683                     ; 318 {
 684                     .text:	section	.text,new
 685  0000               _TIM4_UpdateRequestConfig:
 689                     ; 320   assert_param(IS_TIM4_UPDATE_SOURCE(TIM4_UpdateSource));
 691                     ; 323   if (TIM4_UpdateSource == TIM4_UpdateSource_Regular)
 693  0000 a101          	cp	a,#1
 694  0002 2606          	jrne	L772
 695                     ; 325     TIM4->CR1 |= TIM4_CR1_URS ;
 697  0004 721452e0      	bset	21216,#2
 699  0008 2004          	jra	L103
 700  000a               L772:
 701                     ; 329     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_URS) ;
 703  000a 721552e0      	bres	21216,#2
 704  000e               L103:
 705                     ; 331 }
 708  000e 81            	ret
 744                     ; 339 void TIM4_ARRPreloadConfig(FunctionalState NewState)
 744                     ; 340 {
 745                     .text:	section	.text,new
 746  0000               _TIM4_ARRPreloadConfig:
 750                     ; 342   assert_param(IS_FUNCTIONAL_STATE(NewState));
 752                     ; 345   if (NewState != DISABLE)
 754  0000 4d            	tnz	a
 755  0001 2706          	jreq	L123
 756                     ; 347     TIM4->CR1 |= TIM4_CR1_ARPE ;
 758  0003 721e52e0      	bset	21216,#7
 760  0007 2004          	jra	L323
 761  0009               L123:
 762                     ; 351     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_ARPE) ;
 764  0009 721f52e0      	bres	21216,#7
 765  000d               L323:
 766                     ; 353 }
 769  000d 81            	ret
 826                     ; 363 void TIM4_SelectOnePulseMode(TIM4_OPMode_TypeDef TIM4_OPMode)
 826                     ; 364 {
 827                     .text:	section	.text,new
 828  0000               _TIM4_SelectOnePulseMode:
 832                     ; 366   assert_param(IS_TIM4_OPM_MODE(TIM4_OPMode));
 834                     ; 369   if (TIM4_OPMode == TIM4_OPMode_Single)
 836  0000 a101          	cp	a,#1
 837  0002 2606          	jrne	L353
 838                     ; 371     TIM4->CR1 |= TIM4_CR1_OPM ;
 840  0004 721652e0      	bset	21216,#3
 842  0008 2004          	jra	L553
 843  000a               L353:
 844                     ; 375     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_OPM) ;
 846  000a 721752e0      	bres	21216,#3
 847  000e               L553:
 848                     ; 377 }
 851  000e 81            	ret
 886                     ; 385 void TIM4_Cmd(FunctionalState NewState)
 886                     ; 386 {
 887                     .text:	section	.text,new
 888  0000               _TIM4_Cmd:
 892                     ; 388   assert_param(IS_FUNCTIONAL_STATE(NewState));
 894                     ; 391   if (NewState != DISABLE)
 896  0000 4d            	tnz	a
 897  0001 2706          	jreq	L573
 898                     ; 393     TIM4->CR1 |= TIM4_CR1_CEN ;
 900  0003 721052e0      	bset	21216,#0
 902  0007 2004          	jra	L773
 903  0009               L573:
 904                     ; 397     TIM4->CR1 &= (uint8_t)(~TIM4_CR1_CEN) ;
 906  0009 721152e0      	bres	21216,#0
 907  000d               L773:
 908                     ; 399 }
 911  000d 81            	ret
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
 992  0003 2709          	jreq	L334
 993                     ; 436     TIM4->IER |= (uint8_t)TIM4_IT;
 995  0005 9e            	ld	a,xh
 996  0006 ca52e4        	or	a,21220
 997  0009 c752e4        	ld	21220,a
 999  000c 2009          	jra	L534
1000  000e               L334:
1001                     ; 441     TIM4->IER &= (uint8_t)(~(uint8_t)TIM4_IT);
1003  000e 7b01          	ld	a,(OFST+1,sp)
1004  0010 43            	cpl	a
1005  0011 c452e4        	and	a,21220
1006  0014 c752e4        	ld	21220,a
1007  0017               L534:
1008                     ; 443 }
1011  0017 85            	popw	x
1012  0018 81            	ret
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
1185  0004 2706          	jreq	L725
1186                     ; 480     bitstatus = SET;
1188  0006 a601          	ld	a,#1
1189  0008 6b01          	ld	(OFST+0,sp),a
1191  000a 2002          	jra	L135
1192  000c               L725:
1193                     ; 484     bitstatus = RESET;
1195  000c 0f01          	clr	(OFST+0,sp)
1196  000e               L135:
1197                     ; 486   return ((FlagStatus)bitstatus);
1199  000e 7b01          	ld	a,(OFST+0,sp)
1202  0010 5b01          	addw	sp,#1
1203  0012 81            	ret
1238                     ; 497 void TIM4_ClearFlag(TIM4_FLAG_TypeDef TIM4_FLAG)
1238                     ; 498 {
1239                     .text:	section	.text,new
1240  0000               _TIM4_ClearFlag:
1244                     ; 500   assert_param(IS_TIM4_CLEAR_FLAG((uint8_t)TIM4_FLAG));
1246                     ; 502   TIM4->SR1 = (uint8_t)(~((uint8_t)TIM4_FLAG));
1248  0000 43            	cpl	a
1249  0001 c752e5        	ld	21221,a
1250                     ; 503 }
1253  0004 81            	ret
1313                     ; 515 ITStatus TIM4_GetITStatus(TIM4_IT_TypeDef TIM4_IT)
1313                     ; 516 {
1314                     .text:	section	.text,new
1315  0000               _TIM4_GetITStatus:
1317  0000 88            	push	a
1318  0001 89            	pushw	x
1319       00000002      OFST:	set	2
1322                     ; 517   ITStatus bitstatus = RESET;
1324                     ; 519   uint8_t itStatus = 0x0, itEnable = 0x0;
1328                     ; 522   assert_param(IS_TIM4_GET_IT(TIM4_IT));
1330                     ; 524   itStatus = (uint8_t)(TIM4->SR1 & (uint8_t)TIM4_IT);
1332  0002 c452e5        	and	a,21221
1333  0005 6b01          	ld	(OFST-1,sp),a
1334                     ; 526   itEnable = (uint8_t)(TIM4->IER & (uint8_t)TIM4_IT);
1336  0007 c652e4        	ld	a,21220
1337  000a 1403          	and	a,(OFST+1,sp)
1338  000c 6b02          	ld	(OFST+0,sp),a
1339                     ; 528   if ((itStatus != (uint8_t)RESET ) && (itEnable != (uint8_t)RESET ))
1341  000e 0d01          	tnz	(OFST-1,sp)
1342  0010 270a          	jreq	L775
1344  0012 0d02          	tnz	(OFST+0,sp)
1345  0014 2706          	jreq	L775
1346                     ; 530     bitstatus = (ITStatus)SET;
1348  0016 a601          	ld	a,#1
1349  0018 6b02          	ld	(OFST+0,sp),a
1351  001a 2002          	jra	L106
1352  001c               L775:
1353                     ; 534     bitstatus = (ITStatus)RESET;
1355  001c 0f02          	clr	(OFST+0,sp)
1356  001e               L106:
1357                     ; 536   return ((ITStatus)bitstatus);
1359  001e 7b02          	ld	a,(OFST+0,sp)
1362  0020 5b03          	addw	sp,#3
1363  0022 81            	ret
1399                     ; 547 void TIM4_ClearITPendingBit(TIM4_IT_TypeDef TIM4_IT)
1399                     ; 548 {
1400                     .text:	section	.text,new
1401  0000               _TIM4_ClearITPendingBit:
1405                     ; 550   assert_param(IS_TIM4_IT(TIM4_IT));
1407                     ; 553   TIM4->SR1 = (uint8_t)(~(uint8_t)TIM4_IT);
1409  0000 43            	cpl	a
1410  0001 c752e5        	ld	21221,a
1411                     ; 554 }
1414  0004 81            	ret
1473                     ; 565 void TIM4_DMACmd( TIM4_DMASource_TypeDef TIM4_DMASource, FunctionalState NewState)
1473                     ; 566 {
1474                     .text:	section	.text,new
1475  0000               _TIM4_DMACmd:
1477  0000 89            	pushw	x
1478       00000000      OFST:	set	0
1481                     ; 568   assert_param(IS_FUNCTIONAL_STATE(NewState));
1483                     ; 569   assert_param(IS_TIM4_DMA_SOURCE(TIM4_DMASource));
1485                     ; 571   if (NewState != DISABLE)
1487  0001 9f            	ld	a,xl
1488  0002 4d            	tnz	a
1489  0003 2709          	jreq	L156
1490                     ; 574     TIM4->DER |= (uint8_t)TIM4_DMASource;
1492  0005 9e            	ld	a,xh
1493  0006 ca52e3        	or	a,21219
1494  0009 c752e3        	ld	21219,a
1496  000c 2009          	jra	L356
1497  000e               L156:
1498                     ; 579     TIM4->DER &= (uint8_t)~TIM4_DMASource;
1500  000e 7b01          	ld	a,(OFST+1,sp)
1501  0010 43            	cpl	a
1502  0011 c452e3        	and	a,21219
1503  0014 c752e3        	ld	21219,a
1504  0017               L356:
1505                     ; 581 }
1508  0017 85            	popw	x
1509  0018 81            	ret
1533                     ; 604 void TIM4_InternalClockConfig(void)
1533                     ; 605 {
1534                     .text:	section	.text,new
1535  0000               _TIM4_InternalClockConfig:
1539                     ; 607   TIM4->SMCR &=  (uint8_t)(~TIM4_SMCR_SMS);
1541  0000 c652e2        	ld	a,21218
1542  0003 a4f8          	and	a,#248
1543  0005 c752e2        	ld	21218,a
1544                     ; 608 }
1547  0008 81            	ret
1629                     ; 648 void TIM4_SelectInputTrigger(TIM4_TRGSelection_TypeDef TIM4_InputTriggerSource)
1629                     ; 649 {
1630                     .text:	section	.text,new
1631  0000               _TIM4_SelectInputTrigger:
1633  0000 88            	push	a
1634  0001 88            	push	a
1635       00000001      OFST:	set	1
1638                     ; 650   uint8_t tmpsmcr = 0;
1640                     ; 653   assert_param(IS_TIM4_TRIGGER_SELECTION(TIM4_InputTriggerSource));
1642                     ; 655   tmpsmcr = TIM4->SMCR;
1644  0002 c652e2        	ld	a,21218
1645  0005 6b01          	ld	(OFST+0,sp),a
1646                     ; 658   tmpsmcr &= (uint8_t)(~TIM4_SMCR_TS);
1648  0007 7b01          	ld	a,(OFST+0,sp)
1649  0009 a48f          	and	a,#143
1650  000b 6b01          	ld	(OFST+0,sp),a
1651                     ; 659   tmpsmcr |= (uint8_t)TIM4_InputTriggerSource;
1653  000d 7b01          	ld	a,(OFST+0,sp)
1654  000f 1a02          	or	a,(OFST+1,sp)
1655  0011 6b01          	ld	(OFST+0,sp),a
1656                     ; 661   TIM4->SMCR = (uint8_t)tmpsmcr;
1658  0013 7b01          	ld	a,(OFST+0,sp)
1659  0015 c752e2        	ld	21218,a
1660                     ; 662 }
1663  0018 85            	popw	x
1664  0019 81            	ret
1737                     ; 673 void TIM4_SelectOutputTrigger(TIM4_TRGOSource_TypeDef TIM4_TRGOSource)
1737                     ; 674 {
1738                     .text:	section	.text,new
1739  0000               _TIM4_SelectOutputTrigger:
1741  0000 88            	push	a
1742  0001 88            	push	a
1743       00000001      OFST:	set	1
1746                     ; 675   uint8_t tmpcr2 = 0;
1748                     ; 678   assert_param(IS_TIM4_TRGO_SOURCE(TIM4_TRGOSource));
1750                     ; 680   tmpcr2 = TIM4->CR2;
1752  0002 c652e1        	ld	a,21217
1753  0005 6b01          	ld	(OFST+0,sp),a
1754                     ; 683   tmpcr2 &= (uint8_t)(~TIM4_CR2_MMS);
1756  0007 7b01          	ld	a,(OFST+0,sp)
1757  0009 a48f          	and	a,#143
1758  000b 6b01          	ld	(OFST+0,sp),a
1759                     ; 686   tmpcr2 |=  (uint8_t)TIM4_TRGOSource;
1761  000d 7b01          	ld	a,(OFST+0,sp)
1762  000f 1a02          	or	a,(OFST+1,sp)
1763  0011 6b01          	ld	(OFST+0,sp),a
1764                     ; 688   TIM4->CR2 = tmpcr2;
1766  0013 7b01          	ld	a,(OFST+0,sp)
1767  0015 c752e1        	ld	21217,a
1768                     ; 689 }
1771  0018 85            	popw	x
1772  0019 81            	ret
1861                     ; 703 void TIM4_SelectSlaveMode(TIM4_SlaveMode_TypeDef TIM4_SlaveMode)
1861                     ; 704 {
1862                     .text:	section	.text,new
1863  0000               _TIM4_SelectSlaveMode:
1865  0000 88            	push	a
1866  0001 88            	push	a
1867       00000001      OFST:	set	1
1870                     ; 705   uint8_t tmpsmcr = 0;
1872                     ; 708   assert_param(IS_TIM4_SLAVE_MODE(TIM4_SlaveMode));
1874                     ; 710   tmpsmcr = TIM4->SMCR;
1876  0002 c652e2        	ld	a,21218
1877  0005 6b01          	ld	(OFST+0,sp),a
1878                     ; 713   tmpsmcr &= (uint8_t)(~TIM4_SMCR_SMS);
1880  0007 7b01          	ld	a,(OFST+0,sp)
1881  0009 a4f8          	and	a,#248
1882  000b 6b01          	ld	(OFST+0,sp),a
1883                     ; 716   tmpsmcr |= (uint8_t)TIM4_SlaveMode;
1885  000d 7b01          	ld	a,(OFST+0,sp)
1886  000f 1a02          	or	a,(OFST+1,sp)
1887  0011 6b01          	ld	(OFST+0,sp),a
1888                     ; 718   TIM4->SMCR = tmpsmcr;
1890  0013 7b01          	ld	a,(OFST+0,sp)
1891  0015 c752e2        	ld	21218,a
1892                     ; 719 }
1895  0018 85            	popw	x
1896  0019 81            	ret
1932                     ; 727 void TIM4_SelectMasterSlaveMode(FunctionalState NewState)
1932                     ; 728 {
1933                     .text:	section	.text,new
1934  0000               _TIM4_SelectMasterSlaveMode:
1938                     ; 730   assert_param(IS_FUNCTIONAL_STATE(NewState));
1940                     ; 733   if (NewState != DISABLE)
1942  0000 4d            	tnz	a
1943  0001 2706          	jreq	L7201
1944                     ; 735     TIM4->SMCR |= TIM4_SMCR_MSM;
1946  0003 721e52e2      	bset	21218,#7
1948  0007 2004          	jra	L1301
1949  0009               L7201:
1950                     ; 739     TIM4->SMCR &= (uint8_t)(~TIM4_SMCR_MSM);
1952  0009 721f52e2      	bres	21218,#7
1953  000d               L1301:
1954                     ; 741 }
1957  000d 81            	ret
1970                     	xdef	_TIM4_SelectMasterSlaveMode
1971                     	xdef	_TIM4_SelectSlaveMode
1972                     	xdef	_TIM4_SelectOutputTrigger
1973                     	xdef	_TIM4_SelectInputTrigger
1974                     	xdef	_TIM4_InternalClockConfig
1975                     	xdef	_TIM4_DMACmd
1976                     	xdef	_TIM4_ClearITPendingBit
1977                     	xdef	_TIM4_GetITStatus
1978                     	xdef	_TIM4_ClearFlag
1979                     	xdef	_TIM4_GetFlagStatus
1980                     	xdef	_TIM4_GenerateEvent
1981                     	xdef	_TIM4_ITConfig
1982                     	xdef	_TIM4_Cmd
1983                     	xdef	_TIM4_SelectOnePulseMode
1984                     	xdef	_TIM4_ARRPreloadConfig
1985                     	xdef	_TIM4_UpdateRequestConfig
1986                     	xdef	_TIM4_UpdateDisableConfig
1987                     	xdef	_TIM4_GetPrescaler
1988                     	xdef	_TIM4_GetCounter
1989                     	xdef	_TIM4_SetAutoreload
1990                     	xdef	_TIM4_SetCounter
1991                     	xdef	_TIM4_PrescalerConfig
1992                     	xdef	_TIM4_TimeBaseInit
1993                     	xdef	_TIM4_DeInit
2012                     	end
