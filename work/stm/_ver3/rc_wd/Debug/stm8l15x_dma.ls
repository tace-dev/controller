   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  49                     ; 137 void DMA_GlobalDeInit(void)
  49                     ; 138 {
  51                     	switch	.text
  52  0000               _DMA_GlobalDeInit:
  56                     ; 140   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  58  0000 72115070      	bres	20592,#0
  59                     ; 143   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  61  0004 35fc5070      	mov	20592,#252
  62                     ; 144 }
  65  0008 81            	ret	
 181                     ; 152 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
 181                     ; 153 {
 182                     	switch	.text
 183  0009               _DMA_DeInit:
 185  0009 89            	pushw	x
 186       00000000      OFST:	set	0
 189                     ; 155   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 191                     ; 158   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 193  000a f6            	ld	a,(x)
 194  000b a4fe          	and	a,#254
 195  000d f7            	ld	(x),a
 196                     ; 161   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 198  000e 7f            	clr	(x)
 199                     ; 164   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
 201  000f 6f02          	clr	(2,x)
 202                     ; 167   if (DMA_Channelx == DMA1_Channel3)
 204  0011 a35093        	cpw	x,#20627
 205  0014 2608          	jrne	L501
 206                     ; 169     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
 208  0016 a640          	ld	a,#64
 209  0018 e703          	ld	(3,x),a
 210                     ; 170     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
 212  001a 6f05          	clr	(5,x)
 214  001c 2006          	jra	L701
 215  001e               L501:
 216                     ; 174     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
 218  001e 1e01          	ldw	x,(OFST+1,sp)
 219  0020 a652          	ld	a,#82
 220  0022 e703          	ld	(3,x),a
 221  0024               L701:
 222                     ; 176   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
 224  0024 1e01          	ldw	x,(OFST+1,sp)
 225  0026 6f04          	clr	(4,x)
 226                     ; 179   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
 228  0028 6f06          	clr	(6,x)
 229                     ; 180   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
 231  002a 6f07          	clr	(7,x)
 232                     ; 183   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
 234  002c 6f01          	clr	(1,x)
 235                     ; 184 }
 238  002e 85            	popw	x
 239  002f 81            	ret	
 479                     ; 221 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
 479                     ; 222               uint32_t DMA_Memory0BaseAddr,
 479                     ; 223               uint16_t DMA_PeripheralMemory1BaseAddr,
 479                     ; 224               uint8_t DMA_BufferSize,
 479                     ; 225               DMA_DIR_TypeDef DMA_DIR,
 479                     ; 226               DMA_Mode_TypeDef DMA_Mode,
 479                     ; 227               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
 479                     ; 228               DMA_Priority_TypeDef DMA_Priority,
 479                     ; 229               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
 479                     ; 230 {
 480                     	switch	.text
 481  0030               _DMA_Init:
 483  0030 89            	pushw	x
 484       00000000      OFST:	set	0
 487                     ; 232   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 489                     ; 233   assert_param(IS_DMA_DIR(DMA_DIR));
 491                     ; 234   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
 493                     ; 235   assert_param(IS_DMA_MODE(DMA_Mode));
 495                     ; 236   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
 497                     ; 237   assert_param(IS_DMA_PRIORITY(DMA_Priority));
 499                     ; 241   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 501  0031 f6            	ld	a,(x)
 502  0032 a4fe          	and	a,#254
 503  0034 f7            	ld	(x),a
 504                     ; 244   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 506  0035 7f            	clr	(x)
 507                     ; 247   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | \
 507                     ; 248                                            (uint8_t)DMA_Mode) | \
 507                     ; 249                                            (uint8_t)DMA_MemoryIncMode);
 509  0036 7b0c          	ld	a,(OFST+12,sp)
 510  0038 1a0d          	or	a,(OFST+13,sp)
 511  003a 1a0e          	or	a,(OFST+14,sp)
 512  003c fa            	or	a,(x)
 513  003d f7            	ld	(x),a
 514                     ; 252   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
 516  003e e601          	ld	a,(1,x)
 517  0040 a4c7          	and	a,#199
 518  0042 e701          	ld	(1,x),a
 519                     ; 255   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | \
 519                     ; 256                                   (uint8_t)DMA_MemoryDataSize);
 521  0044 7b0f          	ld	a,(OFST+15,sp)
 522  0046 1a10          	or	a,(OFST+16,sp)
 523  0048 ea01          	or	a,(1,x)
 524  004a e701          	ld	(1,x),a
 525                     ; 260   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 527  004c 7b0b          	ld	a,(OFST+11,sp)
 528  004e 1e01          	ldw	x,(OFST+1,sp)
 529  0050 e702          	ld	(2,x),a
 530                     ; 265   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 532  0052 7b09          	ld	a,(OFST+9,sp)
 533  0054 e703          	ld	(3,x),a
 534                     ; 266   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 536  0056 7b0a          	ld	a,(OFST+10,sp)
 537  0058 e704          	ld	(4,x),a
 538                     ; 270   if (DMA_Channelx == DMA1_Channel3)
 540  005a a35093        	cpw	x,#20627
 541  005d 2604          	jrne	L142
 542                     ; 272     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 544  005f 7b06          	ld	a,(OFST+6,sp)
 545  0061 e705          	ld	(5,x),a
 546  0063               L142:
 547                     ; 274   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 549  0063 7b07          	ld	a,(OFST+7,sp)
 550  0065 e706          	ld	(6,x),a
 551                     ; 275   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 553  0067 7b08          	ld	a,(OFST+8,sp)
 554  0069 e707          	ld	(7,x),a
 555                     ; 277 }
 558  006b 85            	popw	x
 559  006c 81            	ret	
 614                     ; 285 void DMA_GlobalCmd(FunctionalState NewState)
 614                     ; 286 {
 615                     	switch	.text
 616  006d               _DMA_GlobalCmd:
 620                     ; 288   assert_param(IS_FUNCTIONAL_STATE(NewState));
 622                     ; 290   if (NewState != DISABLE)
 624  006d 4d            	tnz	a
 625  006e 2705          	jreq	L172
 626                     ; 293     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 628  0070 72105070      	bset	20592,#0
 631  0074 81            	ret	
 632  0075               L172:
 633                     ; 298     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 635  0075 72115070      	bres	20592,#0
 636                     ; 300 }
 639  0079 81            	ret	
 686                     ; 311 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 686                     ; 312 {
 687                     	switch	.text
 688  007a               _DMA_Cmd:
 690  007a 89            	pushw	x
 691       00000000      OFST:	set	0
 694                     ; 314   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 696                     ; 315   assert_param(IS_FUNCTIONAL_STATE(NewState));
 698                     ; 317   if (NewState != DISABLE)
 700  007b 7b05          	ld	a,(OFST+5,sp)
 701  007d 2705          	jreq	L123
 702                     ; 320     DMA_Channelx->CCR |= DMA_CCR_CE;
 704  007f f6            	ld	a,(x)
 705  0080 aa01          	or	a,#1
 707  0082 2005          	jra	L323
 708  0084               L123:
 709                     ; 325     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 711  0084 1e01          	ldw	x,(OFST+1,sp)
 712  0086 f6            	ld	a,(x)
 713  0087 a4fe          	and	a,#254
 714  0089               L323:
 715  0089 f7            	ld	(x),a
 716                     ; 327 }
 719  008a 85            	popw	x
 720  008b 81            	ret	
 752                     ; 339 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 752                     ; 340 {
 753                     	switch	.text
 754  008c               _DMA_SetTimeOut:
 758                     ; 342   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 760                     ; 345   DMA1->GCSR = 0;
 762  008c 725f5070      	clr	20592
 763                     ; 346   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 765  0090 48            	sll	a
 766  0091 48            	sll	a
 767  0092 c75070        	ld	20592,a
 768                     ; 348 }
 771  0095 81            	ret	
 816                     ; 398 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 816                     ; 399 {
 817                     	switch	.text
 818  0096               _DMA_SetCurrDataCounter:
 820  0096 89            	pushw	x
 821       00000000      OFST:	set	0
 824                     ; 401   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 826                     ; 404   DMA_Channelx->CNBTR = DataNumber;
 828  0097 7b05          	ld	a,(OFST+5,sp)
 829  0099 1e01          	ldw	x,(OFST+1,sp)
 830  009b e702          	ld	(2,x),a
 831                     ; 405 }
 834  009d 85            	popw	x
 835  009e 81            	ret	
 873                     ; 412 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 873                     ; 413 {
 874                     	switch	.text
 875  009f               _DMA_GetCurrDataCounter:
 879                     ; 415   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 881                     ; 418   return ((uint8_t)(DMA_Channelx->CNBTR));
 883  009f e602          	ld	a,(2,x)
 886  00a1 81            	ret	
 963                     ; 479 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, 
 963                     ; 480                   DMA_ITx_TypeDef DMA_ITx,
 963                     ; 481                   FunctionalState NewState)
 963                     ; 482 {
 964                     	switch	.text
 965  00a2               _DMA_ITConfig:
 967  00a2 89            	pushw	x
 968       00000000      OFST:	set	0
 971                     ; 484   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 973                     ; 485   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 975                     ; 486   assert_param(IS_FUNCTIONAL_STATE(NewState));
 977                     ; 488   if (NewState != DISABLE)
 979  00a3 7b06          	ld	a,(OFST+6,sp)
 980  00a5 2705          	jreq	L344
 981                     ; 491     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 983  00a7 f6            	ld	a,(x)
 984  00a8 1a05          	or	a,(OFST+5,sp)
 986  00aa 2006          	jra	L544
 987  00ac               L344:
 988                     ; 496     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
 990  00ac 1e01          	ldw	x,(OFST+1,sp)
 991  00ae 7b05          	ld	a,(OFST+5,sp)
 992  00b0 43            	cpl	a
 993  00b1 f4            	and	a,(x)
 994  00b2               L544:
 995  00b2 f7            	ld	(x),a
 996                     ; 498 }
 999  00b3 85            	popw	x
1000  00b4 81            	ret	
1245                     ; 527 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
1245                     ; 528 {
1246                     	switch	.text
1247  00b5               _DMA_GetFlagStatus:
1249  00b5 89            	pushw	x
1250  00b6 5204          	subw	sp,#4
1251       00000004      OFST:	set	4
1254                     ; 529   FlagStatus flagstatus = RESET;
1256                     ; 530   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1258                     ; 531   uint8_t tmpgir1 = 0;
1260                     ; 532   uint8_t tmpgcsr = 0;
1262                     ; 535   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
1264                     ; 538   tmpgcsr = DMA1->GCSR;
1266  00b8 c65070        	ld	a,20592
1267  00bb 6b04          	ld	(OFST+0,sp),a
1268                     ; 539   tmpgir1 = DMA1->GIR1;
1270  00bd c65071        	ld	a,20593
1271  00c0 6b01          	ld	(OFST-3,sp),a
1272                     ; 541   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
1274  00c2 01            	rrwa	x,a
1275  00c3 9f            	ld	a,xl
1276  00c4 a40f          	and	a,#15
1277  00c6 97            	ld	xl,a
1278  00c7 4f            	clr	a
1279  00c8 02            	rlwa	x,a
1280  00c9 5d            	tnzw	x
1281  00ca 2728          	jreq	L175
1282                     ; 544     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
1284  00cc 7b05          	ld	a,(OFST+1,sp)
1285  00ce a501          	bcp	a,#1
1286  00d0 2705          	jreq	L375
1287                     ; 546       DMA_Channelx = DMA1_Channel0;
1289  00d2 ae5075        	ldw	x,#20597
1291  00d5 2015          	jra	L575
1292  00d7               L375:
1293                     ; 548     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
1295  00d7 a502          	bcp	a,#2
1296  00d9 2705          	jreq	L775
1297                     ; 550       DMA_Channelx = DMA1_Channel1;
1299  00db ae507f        	ldw	x,#20607
1301  00de 200c          	jra	L575
1302  00e0               L775:
1303                     ; 552     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
1305  00e0 a504          	bcp	a,#4
1306  00e2 2705          	jreq	L306
1307                     ; 554       DMA_Channelx = DMA1_Channel2;
1309  00e4 ae5089        	ldw	x,#20617
1311  00e7 2003          	jra	L575
1312  00e9               L306:
1313                     ; 558       DMA_Channelx = DMA1_Channel3;
1315  00e9 ae5093        	ldw	x,#20627
1316  00ec               L575:
1317  00ec 1f02          	ldw	(OFST-2,sp),x
1318                     ; 562     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
1320  00ee e601          	ld	a,(1,x)
1321  00f0 1406          	and	a,(OFST+2,sp)
1323  00f2 2010          	jra	L706
1324  00f4               L175:
1325                     ; 564   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
1327  00f4 7b05          	ld	a,(OFST+1,sp)
1328  00f6 a510          	bcp	a,#16
1329  00f8 2706          	jreq	L116
1330                     ; 567     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
1332  00fa 7b06          	ld	a,(OFST+2,sp)
1333  00fc 1401          	and	a,(OFST-3,sp)
1335  00fe 2004          	jra	L706
1336  0100               L116:
1337                     ; 572     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
1339  0100 7b04          	ld	a,(OFST+0,sp)
1340  0102 a402          	and	a,#2
1341  0104               L706:
1342                     ; 576   return (flagstatus);
1346  0104 5b06          	addw	sp,#6
1347  0106 81            	ret	
1394                     ; 594 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
1394                     ; 595 {
1395                     	switch	.text
1396  0107               _DMA_ClearFlag:
1398  0107 89            	pushw	x
1399  0108 89            	pushw	x
1400       00000002      OFST:	set	2
1403                     ; 596   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1405                     ; 599   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
1407                     ; 602   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
1409  0109 01            	rrwa	x,a
1410  010a 9f            	ld	a,xl
1411  010b a401          	and	a,#1
1412  010d 97            	ld	xl,a
1413  010e 4f            	clr	a
1414  010f 02            	rlwa	x,a
1415  0110 5d            	tnzw	x
1416  0111 2705          	jreq	L146
1417                     ; 604     DMA_Channelx = DMA1_Channel0;
1419  0113 ae5075        	ldw	x,#20597
1421  0116 2017          	jra	L346
1422  0118               L146:
1423                     ; 608     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
1425  0118 7b03          	ld	a,(OFST+1,sp)
1426  011a a502          	bcp	a,#2
1427  011c 2705          	jreq	L546
1428                     ; 610       DMA_Channelx = DMA1_Channel1;
1430  011e ae507f        	ldw	x,#20607
1432  0121 200c          	jra	L346
1433  0123               L546:
1434                     ; 614       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
1436  0123 a504          	bcp	a,#4
1437  0125 2705          	jreq	L156
1438                     ; 616         DMA_Channelx = DMA1_Channel2;
1440  0127 ae5089        	ldw	x,#20617
1442  012a 2003          	jra	L346
1443  012c               L156:
1444                     ; 620         DMA_Channelx = DMA1_Channel3;
1446  012c ae5093        	ldw	x,#20627
1447  012f               L346:
1448  012f 1f01          	ldw	(OFST-1,sp),x
1449                     ; 626   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
1451  0131 7b04          	ld	a,(OFST+2,sp)
1452  0133 a406          	and	a,#6
1453  0135 43            	cpl	a
1454  0136 e401          	and	a,(1,x)
1455  0138 e701          	ld	(1,x),a
1456                     ; 627 }
1459  013a 5b04          	addw	sp,#4
1460  013c 81            	ret	
1594                     ; 643 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
1594                     ; 644 {
1595                     	switch	.text
1596  013d               _DMA_GetITStatus:
1598  013d 88            	push	a
1599  013e 5204          	subw	sp,#4
1600       00000004      OFST:	set	4
1603                     ; 645   ITStatus itstatus = RESET;
1605                     ; 646   uint8_t tmpreg = 0;
1607                     ; 647   uint8_t tmp2 = 0;
1609                     ; 648   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1611                     ; 651   assert_param(IS_DMA_GET_IT(DMA_IT));
1613                     ; 654   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1615  0140 a510          	bcp	a,#16
1616  0142 2705          	jreq	L537
1617                     ; 656     DMA_Channelx = DMA1_Channel0;
1619  0144 ae5075        	ldw	x,#20597
1621  0147 2017          	jra	L737
1622  0149               L537:
1623                     ; 660     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
1625  0149 7b05          	ld	a,(OFST+1,sp)
1626  014b a520          	bcp	a,#32
1627  014d 2705          	jreq	L147
1628                     ; 662       DMA_Channelx = DMA1_Channel1;
1630  014f ae507f        	ldw	x,#20607
1632  0152 200c          	jra	L737
1633  0154               L147:
1634                     ; 666       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
1636  0154 a540          	bcp	a,#64
1637  0156 2705          	jreq	L547
1638                     ; 668         DMA_Channelx = DMA1_Channel2;
1640  0158 ae5089        	ldw	x,#20617
1642  015b 2003          	jra	L737
1643  015d               L547:
1644                     ; 672         DMA_Channelx = DMA1_Channel3;
1646  015d ae5093        	ldw	x,#20627
1647  0160               L737:
1648  0160 1f03          	ldw	(OFST-1,sp),x
1649                     ; 677   tmpreg =  DMA_Channelx->CSPR ;
1651  0162 e601          	ld	a,(1,x)
1652                     ; 678   tmpreg &= DMA_Channelx->CCR ;
1654  0164 f4            	and	a,(x)
1655  0165 6b01          	ld	(OFST-3,sp),a
1656                     ; 679   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
1658  0167 7b05          	ld	a,(OFST+1,sp)
1659  0169 a406          	and	a,#6
1660                     ; 680   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
1662  016b 1401          	and	a,(OFST-3,sp)
1663                     ; 683   return (itstatus);
1667  016d 5b05          	addw	sp,#5
1668  016f 81            	ret	
1716                     ; 701 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
1716                     ; 702 {
1717                     	switch	.text
1718  0170               _DMA_ClearITPendingBit:
1720  0170 88            	push	a
1721  0171 89            	pushw	x
1722       00000002      OFST:	set	2
1725                     ; 703   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1727                     ; 706   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
1729                     ; 708   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1731  0172 a510          	bcp	a,#16
1732  0174 2705          	jreq	L577
1733                     ; 710     DMA_Channelx = DMA1_Channel0;
1735  0176 ae5075        	ldw	x,#20597
1737  0179 2017          	jra	L777
1738  017b               L577:
1739                     ; 714     if ((DMA_IT & 0x20) != (uint8_t)RESET)
1741  017b 7b03          	ld	a,(OFST+1,sp)
1742  017d a520          	bcp	a,#32
1743  017f 2705          	jreq	L1001
1744                     ; 716       DMA_Channelx = DMA1_Channel1;
1746  0181 ae507f        	ldw	x,#20607
1748  0184 200c          	jra	L777
1749  0186               L1001:
1750                     ; 720       if ((DMA_IT & 0x40) != (uint8_t)RESET)
1752  0186 a540          	bcp	a,#64
1753  0188 2705          	jreq	L5001
1754                     ; 722         DMA_Channelx = DMA1_Channel2;
1756  018a ae5089        	ldw	x,#20617
1758  018d 2003          	jra	L777
1759  018f               L5001:
1760                     ; 726         DMA_Channelx = DMA1_Channel3;
1762  018f ae5093        	ldw	x,#20627
1763  0192               L777:
1764  0192 1f01          	ldw	(OFST-1,sp),x
1765                     ; 731   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
1767  0194 7b03          	ld	a,(OFST+1,sp)
1768  0196 a406          	and	a,#6
1769  0198 43            	cpl	a
1770  0199 e401          	and	a,(1,x)
1771  019b e701          	ld	(1,x),a
1772                     ; 732 }
1775  019d 5b03          	addw	sp,#3
1776  019f 81            	ret	
1789                     	xdef	_DMA_ClearITPendingBit
1790                     	xdef	_DMA_GetITStatus
1791                     	xdef	_DMA_ClearFlag
1792                     	xdef	_DMA_GetFlagStatus
1793                     	xdef	_DMA_ITConfig
1794                     	xdef	_DMA_GetCurrDataCounter
1795                     	xdef	_DMA_SetCurrDataCounter
1796                     	xdef	_DMA_SetTimeOut
1797                     	xdef	_DMA_Cmd
1798                     	xdef	_DMA_GlobalCmd
1799                     	xdef	_DMA_Init
1800                     	xdef	_DMA_DeInit
1801                     	xdef	_DMA_GlobalDeInit
1820                     	end
