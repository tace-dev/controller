   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 137 void DMA_GlobalDeInit(void)
  50                     ; 138 {
  52                     .text:	section	.text,new
  53  0000               _DMA_GlobalDeInit:
  57                     ; 140   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  59  0000 72115070      	bres	20592,#0
  60                     ; 143   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  62  0004 35fc5070      	mov	20592,#252
  63                     ; 144 }
  66  0008 81            	ret	
 182                     ; 152 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
 182                     ; 153 {
 183                     .text:	section	.text,new
 184  0000               _DMA_DeInit:
 186  0000 89            	pushw	x
 187       00000000      OFST:	set	0
 190                     ; 155   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 192                     ; 158   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 194  0001 f6            	ld	a,(x)
 195  0002 a4fe          	and	a,#254
 196  0004 f7            	ld	(x),a
 197                     ; 161   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 199  0005 7f            	clr	(x)
 200                     ; 164   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
 202  0006 6f02          	clr	(2,x)
 203                     ; 167   if (DMA_Channelx == DMA1_Channel3)
 205  0008 a35093        	cpw	x,#20627
 206  000b 2608          	jrne	L501
 207                     ; 169     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
 209  000d a640          	ld	a,#64
 210  000f e703          	ld	(3,x),a
 211                     ; 170     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
 213  0011 6f05          	clr	(5,x)
 215  0013 2006          	jra	L701
 216  0015               L501:
 217                     ; 174     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
 219  0015 1e01          	ldw	x,(OFST+1,sp)
 220  0017 a652          	ld	a,#82
 221  0019 e703          	ld	(3,x),a
 222  001b               L701:
 223                     ; 176   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
 225  001b 1e01          	ldw	x,(OFST+1,sp)
 226  001d 6f04          	clr	(4,x)
 227                     ; 179   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
 229  001f 6f06          	clr	(6,x)
 230                     ; 180   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
 232  0021 6f07          	clr	(7,x)
 233                     ; 183   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
 235  0023 6f01          	clr	(1,x)
 236                     ; 184 }
 239  0025 85            	popw	x
 240  0026 81            	ret	
 480                     ; 221 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
 480                     ; 222               uint32_t DMA_Memory0BaseAddr,
 480                     ; 223               uint16_t DMA_PeripheralMemory1BaseAddr,
 480                     ; 224               uint8_t DMA_BufferSize,
 480                     ; 225               DMA_DIR_TypeDef DMA_DIR,
 480                     ; 226               DMA_Mode_TypeDef DMA_Mode,
 480                     ; 227               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
 480                     ; 228               DMA_Priority_TypeDef DMA_Priority,
 480                     ; 229               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
 480                     ; 230 {
 481                     .text:	section	.text,new
 482  0000               _DMA_Init:
 484  0000 89            	pushw	x
 485       00000000      OFST:	set	0
 488                     ; 232   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 490                     ; 233   assert_param(IS_DMA_DIR(DMA_DIR));
 492                     ; 234   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
 494                     ; 235   assert_param(IS_DMA_MODE(DMA_Mode));
 496                     ; 236   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
 498                     ; 237   assert_param(IS_DMA_PRIORITY(DMA_Priority));
 500                     ; 241   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 502  0001 f6            	ld	a,(x)
 503  0002 a4fe          	and	a,#254
 504  0004 f7            	ld	(x),a
 505                     ; 244   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 507  0005 7f            	clr	(x)
 508                     ; 247   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | \
 508                     ; 248                                            (uint8_t)DMA_Mode) | \
 508                     ; 249                                            (uint8_t)DMA_MemoryIncMode);
 510  0006 7b0c          	ld	a,(OFST+12,sp)
 511  0008 1a0d          	or	a,(OFST+13,sp)
 512  000a 1a0e          	or	a,(OFST+14,sp)
 513  000c fa            	or	a,(x)
 514  000d f7            	ld	(x),a
 515                     ; 252   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
 517  000e e601          	ld	a,(1,x)
 518  0010 a4c7          	and	a,#199
 519  0012 e701          	ld	(1,x),a
 520                     ; 255   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | \
 520                     ; 256                                   (uint8_t)DMA_MemoryDataSize);
 522  0014 7b0f          	ld	a,(OFST+15,sp)
 523  0016 1a10          	or	a,(OFST+16,sp)
 524  0018 ea01          	or	a,(1,x)
 525  001a e701          	ld	(1,x),a
 526                     ; 260   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 528  001c 7b0b          	ld	a,(OFST+11,sp)
 529  001e 1e01          	ldw	x,(OFST+1,sp)
 530  0020 e702          	ld	(2,x),a
 531                     ; 265   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 533  0022 7b09          	ld	a,(OFST+9,sp)
 534  0024 e703          	ld	(3,x),a
 535                     ; 266   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 537  0026 7b0a          	ld	a,(OFST+10,sp)
 538  0028 e704          	ld	(4,x),a
 539                     ; 270   if (DMA_Channelx == DMA1_Channel3)
 541  002a a35093        	cpw	x,#20627
 542  002d 2604          	jrne	L142
 543                     ; 272     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 545  002f 7b06          	ld	a,(OFST+6,sp)
 546  0031 e705          	ld	(5,x),a
 547  0033               L142:
 548                     ; 274   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 550  0033 7b07          	ld	a,(OFST+7,sp)
 551  0035 e706          	ld	(6,x),a
 552                     ; 275   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 554  0037 7b08          	ld	a,(OFST+8,sp)
 555  0039 e707          	ld	(7,x),a
 556                     ; 277 }
 559  003b 85            	popw	x
 560  003c 81            	ret	
 615                     ; 285 void DMA_GlobalCmd(FunctionalState NewState)
 615                     ; 286 {
 616                     .text:	section	.text,new
 617  0000               _DMA_GlobalCmd:
 621                     ; 288   assert_param(IS_FUNCTIONAL_STATE(NewState));
 623                     ; 290   if (NewState != DISABLE)
 625  0000 4d            	tnz	a
 626  0001 2705          	jreq	L172
 627                     ; 293     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 629  0003 72105070      	bset	20592,#0
 632  0007 81            	ret	
 633  0008               L172:
 634                     ; 298     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 636  0008 72115070      	bres	20592,#0
 637                     ; 300 }
 640  000c 81            	ret	
 687                     ; 311 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 687                     ; 312 {
 688                     .text:	section	.text,new
 689  0000               _DMA_Cmd:
 691  0000 89            	pushw	x
 692       00000000      OFST:	set	0
 695                     ; 314   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 697                     ; 315   assert_param(IS_FUNCTIONAL_STATE(NewState));
 699                     ; 317   if (NewState != DISABLE)
 701  0001 7b05          	ld	a,(OFST+5,sp)
 702  0003 2705          	jreq	L123
 703                     ; 320     DMA_Channelx->CCR |= DMA_CCR_CE;
 705  0005 f6            	ld	a,(x)
 706  0006 aa01          	or	a,#1
 708  0008 2005          	jra	L323
 709  000a               L123:
 710                     ; 325     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 712  000a 1e01          	ldw	x,(OFST+1,sp)
 713  000c f6            	ld	a,(x)
 714  000d a4fe          	and	a,#254
 715  000f               L323:
 716  000f f7            	ld	(x),a
 717                     ; 327 }
 720  0010 85            	popw	x
 721  0011 81            	ret	
 753                     ; 339 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 753                     ; 340 {
 754                     .text:	section	.text,new
 755  0000               _DMA_SetTimeOut:
 759                     ; 342   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 761                     ; 345   DMA1->GCSR = 0;
 763  0000 725f5070      	clr	20592
 764                     ; 346   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 766  0004 48            	sll	a
 767  0005 48            	sll	a
 768  0006 c75070        	ld	20592,a
 769                     ; 348 }
 772  0009 81            	ret	
 817                     ; 398 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 817                     ; 399 {
 818                     .text:	section	.text,new
 819  0000               _DMA_SetCurrDataCounter:
 821  0000 89            	pushw	x
 822       00000000      OFST:	set	0
 825                     ; 401   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 827                     ; 404   DMA_Channelx->CNBTR = DataNumber;
 829  0001 7b05          	ld	a,(OFST+5,sp)
 830  0003 1e01          	ldw	x,(OFST+1,sp)
 831  0005 e702          	ld	(2,x),a
 832                     ; 405 }
 835  0007 85            	popw	x
 836  0008 81            	ret	
 874                     ; 412 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 874                     ; 413 {
 875                     .text:	section	.text,new
 876  0000               _DMA_GetCurrDataCounter:
 880                     ; 415   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 882                     ; 418   return ((uint8_t)(DMA_Channelx->CNBTR));
 884  0000 e602          	ld	a,(2,x)
 887  0002 81            	ret	
 964                     ; 479 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, 
 964                     ; 480                   DMA_ITx_TypeDef DMA_ITx,
 964                     ; 481                   FunctionalState NewState)
 964                     ; 482 {
 965                     .text:	section	.text,new
 966  0000               _DMA_ITConfig:
 968  0000 89            	pushw	x
 969       00000000      OFST:	set	0
 972                     ; 484   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 974                     ; 485   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 976                     ; 486   assert_param(IS_FUNCTIONAL_STATE(NewState));
 978                     ; 488   if (NewState != DISABLE)
 980  0001 7b06          	ld	a,(OFST+6,sp)
 981  0003 2705          	jreq	L344
 982                     ; 491     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 984  0005 f6            	ld	a,(x)
 985  0006 1a05          	or	a,(OFST+5,sp)
 987  0008 2006          	jra	L544
 988  000a               L344:
 989                     ; 496     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
 991  000a 1e01          	ldw	x,(OFST+1,sp)
 992  000c 7b05          	ld	a,(OFST+5,sp)
 993  000e 43            	cpl	a
 994  000f f4            	and	a,(x)
 995  0010               L544:
 996  0010 f7            	ld	(x),a
 997                     ; 498 }
1000  0011 85            	popw	x
1001  0012 81            	ret	
1246                     ; 527 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
1246                     ; 528 {
1247                     .text:	section	.text,new
1248  0000               _DMA_GetFlagStatus:
1250  0000 89            	pushw	x
1251  0001 5204          	subw	sp,#4
1252       00000004      OFST:	set	4
1255                     ; 529   FlagStatus flagstatus = RESET;
1257                     ; 530   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1259                     ; 531   uint8_t tmpgir1 = 0;
1261                     ; 532   uint8_t tmpgcsr = 0;
1263                     ; 535   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
1265                     ; 538   tmpgcsr = DMA1->GCSR;
1267  0003 c65070        	ld	a,20592
1268  0006 6b04          	ld	(OFST+0,sp),a
1269                     ; 539   tmpgir1 = DMA1->GIR1;
1271  0008 c65071        	ld	a,20593
1272  000b 6b01          	ld	(OFST-3,sp),a
1273                     ; 541   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
1275  000d 01            	rrwa	x,a
1276  000e 9f            	ld	a,xl
1277  000f a40f          	and	a,#15
1278  0011 97            	ld	xl,a
1279  0012 4f            	clr	a
1280  0013 02            	rlwa	x,a
1281  0014 5d            	tnzw	x
1282  0015 2728          	jreq	L175
1283                     ; 544     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
1285  0017 7b05          	ld	a,(OFST+1,sp)
1286  0019 a501          	bcp	a,#1
1287  001b 2705          	jreq	L375
1288                     ; 546       DMA_Channelx = DMA1_Channel0;
1290  001d ae5075        	ldw	x,#20597
1292  0020 2015          	jra	L575
1293  0022               L375:
1294                     ; 548     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
1296  0022 a502          	bcp	a,#2
1297  0024 2705          	jreq	L775
1298                     ; 550       DMA_Channelx = DMA1_Channel1;
1300  0026 ae507f        	ldw	x,#20607
1302  0029 200c          	jra	L575
1303  002b               L775:
1304                     ; 552     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
1306  002b a504          	bcp	a,#4
1307  002d 2705          	jreq	L306
1308                     ; 554       DMA_Channelx = DMA1_Channel2;
1310  002f ae5089        	ldw	x,#20617
1312  0032 2003          	jra	L575
1313  0034               L306:
1314                     ; 558       DMA_Channelx = DMA1_Channel3;
1316  0034 ae5093        	ldw	x,#20627
1317  0037               L575:
1318  0037 1f02          	ldw	(OFST-2,sp),x
1319                     ; 562     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
1321  0039 e601          	ld	a,(1,x)
1322  003b 1406          	and	a,(OFST+2,sp)
1324  003d 2010          	jra	L706
1325  003f               L175:
1326                     ; 564   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
1328  003f 7b05          	ld	a,(OFST+1,sp)
1329  0041 a510          	bcp	a,#16
1330  0043 2706          	jreq	L116
1331                     ; 567     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
1333  0045 7b06          	ld	a,(OFST+2,sp)
1334  0047 1401          	and	a,(OFST-3,sp)
1336  0049 2004          	jra	L706
1337  004b               L116:
1338                     ; 572     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
1340  004b 7b04          	ld	a,(OFST+0,sp)
1341  004d a402          	and	a,#2
1342  004f               L706:
1343                     ; 576   return (flagstatus);
1347  004f 5b06          	addw	sp,#6
1348  0051 81            	ret	
1395                     ; 594 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
1395                     ; 595 {
1396                     .text:	section	.text,new
1397  0000               _DMA_ClearFlag:
1399  0000 89            	pushw	x
1400  0001 89            	pushw	x
1401       00000002      OFST:	set	2
1404                     ; 596   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1406                     ; 599   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
1408                     ; 602   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
1410  0002 01            	rrwa	x,a
1411  0003 9f            	ld	a,xl
1412  0004 a401          	and	a,#1
1413  0006 97            	ld	xl,a
1414  0007 4f            	clr	a
1415  0008 02            	rlwa	x,a
1416  0009 5d            	tnzw	x
1417  000a 2705          	jreq	L146
1418                     ; 604     DMA_Channelx = DMA1_Channel0;
1420  000c ae5075        	ldw	x,#20597
1422  000f 2017          	jra	L346
1423  0011               L146:
1424                     ; 608     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
1426  0011 7b03          	ld	a,(OFST+1,sp)
1427  0013 a502          	bcp	a,#2
1428  0015 2705          	jreq	L546
1429                     ; 610       DMA_Channelx = DMA1_Channel1;
1431  0017 ae507f        	ldw	x,#20607
1433  001a 200c          	jra	L346
1434  001c               L546:
1435                     ; 614       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
1437  001c a504          	bcp	a,#4
1438  001e 2705          	jreq	L156
1439                     ; 616         DMA_Channelx = DMA1_Channel2;
1441  0020 ae5089        	ldw	x,#20617
1443  0023 2003          	jra	L346
1444  0025               L156:
1445                     ; 620         DMA_Channelx = DMA1_Channel3;
1447  0025 ae5093        	ldw	x,#20627
1448  0028               L346:
1449  0028 1f01          	ldw	(OFST-1,sp),x
1450                     ; 626   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
1452  002a 7b04          	ld	a,(OFST+2,sp)
1453  002c a406          	and	a,#6
1454  002e 43            	cpl	a
1455  002f e401          	and	a,(1,x)
1456  0031 e701          	ld	(1,x),a
1457                     ; 627 }
1460  0033 5b04          	addw	sp,#4
1461  0035 81            	ret	
1595                     ; 643 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
1595                     ; 644 {
1596                     .text:	section	.text,new
1597  0000               _DMA_GetITStatus:
1599  0000 88            	push	a
1600  0001 5204          	subw	sp,#4
1601       00000004      OFST:	set	4
1604                     ; 645   ITStatus itstatus = RESET;
1606                     ; 646   uint8_t tmpreg = 0;
1608                     ; 647   uint8_t tmp2 = 0;
1610                     ; 648   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1612                     ; 651   assert_param(IS_DMA_GET_IT(DMA_IT));
1614                     ; 654   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1616  0003 a510          	bcp	a,#16
1617  0005 2705          	jreq	L537
1618                     ; 656     DMA_Channelx = DMA1_Channel0;
1620  0007 ae5075        	ldw	x,#20597
1622  000a 2017          	jra	L737
1623  000c               L537:
1624                     ; 660     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
1626  000c 7b05          	ld	a,(OFST+1,sp)
1627  000e a520          	bcp	a,#32
1628  0010 2705          	jreq	L147
1629                     ; 662       DMA_Channelx = DMA1_Channel1;
1631  0012 ae507f        	ldw	x,#20607
1633  0015 200c          	jra	L737
1634  0017               L147:
1635                     ; 666       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
1637  0017 a540          	bcp	a,#64
1638  0019 2705          	jreq	L547
1639                     ; 668         DMA_Channelx = DMA1_Channel2;
1641  001b ae5089        	ldw	x,#20617
1643  001e 2003          	jra	L737
1644  0020               L547:
1645                     ; 672         DMA_Channelx = DMA1_Channel3;
1647  0020 ae5093        	ldw	x,#20627
1648  0023               L737:
1649  0023 1f03          	ldw	(OFST-1,sp),x
1650                     ; 677   tmpreg =  DMA_Channelx->CSPR ;
1652  0025 e601          	ld	a,(1,x)
1653                     ; 678   tmpreg &= DMA_Channelx->CCR ;
1655  0027 f4            	and	a,(x)
1656  0028 6b01          	ld	(OFST-3,sp),a
1657                     ; 679   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
1659  002a 7b05          	ld	a,(OFST+1,sp)
1660  002c a406          	and	a,#6
1661                     ; 680   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
1663  002e 1401          	and	a,(OFST-3,sp)
1664                     ; 683   return (itstatus);
1668  0030 5b05          	addw	sp,#5
1669  0032 81            	ret	
1717                     ; 701 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
1717                     ; 702 {
1718                     .text:	section	.text,new
1719  0000               _DMA_ClearITPendingBit:
1721  0000 88            	push	a
1722  0001 89            	pushw	x
1723       00000002      OFST:	set	2
1726                     ; 703   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1728                     ; 706   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
1730                     ; 708   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1732  0002 a510          	bcp	a,#16
1733  0004 2705          	jreq	L577
1734                     ; 710     DMA_Channelx = DMA1_Channel0;
1736  0006 ae5075        	ldw	x,#20597
1738  0009 2017          	jra	L777
1739  000b               L577:
1740                     ; 714     if ((DMA_IT & 0x20) != (uint8_t)RESET)
1742  000b 7b03          	ld	a,(OFST+1,sp)
1743  000d a520          	bcp	a,#32
1744  000f 2705          	jreq	L1001
1745                     ; 716       DMA_Channelx = DMA1_Channel1;
1747  0011 ae507f        	ldw	x,#20607
1749  0014 200c          	jra	L777
1750  0016               L1001:
1751                     ; 720       if ((DMA_IT & 0x40) != (uint8_t)RESET)
1753  0016 a540          	bcp	a,#64
1754  0018 2705          	jreq	L5001
1755                     ; 722         DMA_Channelx = DMA1_Channel2;
1757  001a ae5089        	ldw	x,#20617
1759  001d 2003          	jra	L777
1760  001f               L5001:
1761                     ; 726         DMA_Channelx = DMA1_Channel3;
1763  001f ae5093        	ldw	x,#20627
1764  0022               L777:
1765  0022 1f01          	ldw	(OFST-1,sp),x
1766                     ; 731   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
1768  0024 7b03          	ld	a,(OFST+1,sp)
1769  0026 a406          	and	a,#6
1770  0028 43            	cpl	a
1771  0029 e401          	and	a,(1,x)
1772  002b e701          	ld	(1,x),a
1773                     ; 732 }
1776  002d 5b03          	addw	sp,#3
1777  002f 81            	ret	
1790                     	xdef	_DMA_ClearITPendingBit
1791                     	xdef	_DMA_GetITStatus
1792                     	xdef	_DMA_ClearFlag
1793                     	xdef	_DMA_GetFlagStatus
1794                     	xdef	_DMA_ITConfig
1795                     	xdef	_DMA_GetCurrDataCounter
1796                     	xdef	_DMA_SetCurrDataCounter
1797                     	xdef	_DMA_SetTimeOut
1798                     	xdef	_DMA_Cmd
1799                     	xdef	_DMA_GlobalCmd
1800                     	xdef	_DMA_Init
1801                     	xdef	_DMA_DeInit
1802                     	xdef	_DMA_GlobalDeInit
1821                     	end
