   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  47                     ; 137 void DMA_GlobalDeInit(void)
  47                     ; 138 {
  49                     .text:	section	.text,new
  50  0000               _DMA_GlobalDeInit:
  54                     ; 140   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  56  0000 72115070      	bres	20592,#0
  57                     ; 143   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  59  0004 35fc5070      	mov	20592,#252
  60                     ; 144 }
  63  0008 81            	ret
 179                     ; 152 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
 179                     ; 153 {
 180                     .text:	section	.text,new
 181  0000               _DMA_DeInit:
 183  0000 89            	pushw	x
 184       00000000      OFST:	set	0
 187                     ; 155   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 189                     ; 158   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 191  0001 f6            	ld	a,(x)
 192  0002 a4fe          	and	a,#254
 193  0004 f7            	ld	(x),a
 194                     ; 161   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 196  0005 7f            	clr	(x)
 197                     ; 164   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
 199  0006 6f02          	clr	(2,x)
 200                     ; 167   if (DMA_Channelx == DMA1_Channel3)
 202  0008 a35093        	cpw	x,#20627
 203  000b 2608          	jrne	L501
 204                     ; 169     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
 206  000d a640          	ld	a,#64
 207  000f e703          	ld	(3,x),a
 208                     ; 170     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
 210  0011 6f05          	clr	(5,x)
 212  0013 2006          	jra	L701
 213  0015               L501:
 214                     ; 174     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
 216  0015 1e01          	ldw	x,(OFST+1,sp)
 217  0017 a652          	ld	a,#82
 218  0019 e703          	ld	(3,x),a
 219  001b               L701:
 220                     ; 176   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
 222  001b 1e01          	ldw	x,(OFST+1,sp)
 223  001d 6f04          	clr	(4,x)
 224                     ; 179   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
 226  001f 1e01          	ldw	x,(OFST+1,sp)
 227  0021 6f06          	clr	(6,x)
 228                     ; 180   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
 230  0023 1e01          	ldw	x,(OFST+1,sp)
 231  0025 6f07          	clr	(7,x)
 232                     ; 183   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
 234  0027 1e01          	ldw	x,(OFST+1,sp)
 235  0029 6f01          	clr	(1,x)
 236                     ; 184 }
 239  002b 85            	popw	x
 240  002c 81            	ret
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
 534  0024 1e01          	ldw	x,(OFST+1,sp)
 535  0026 e703          	ld	(3,x),a
 536                     ; 266   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 538  0028 7b0a          	ld	a,(OFST+10,sp)
 539  002a 1e01          	ldw	x,(OFST+1,sp)
 540  002c e704          	ld	(4,x),a
 541                     ; 270   if (DMA_Channelx == DMA1_Channel3)
 543  002e 1e01          	ldw	x,(OFST+1,sp)
 544  0030 a35093        	cpw	x,#20627
 545  0033 2606          	jrne	L142
 546                     ; 272     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 548  0035 7b06          	ld	a,(OFST+6,sp)
 549  0037 1e01          	ldw	x,(OFST+1,sp)
 550  0039 e705          	ld	(5,x),a
 551  003b               L142:
 552                     ; 274   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 554  003b 7b07          	ld	a,(OFST+7,sp)
 555  003d 1e01          	ldw	x,(OFST+1,sp)
 556  003f e706          	ld	(6,x),a
 557                     ; 275   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 559  0041 7b08          	ld	a,(OFST+8,sp)
 560  0043 1e01          	ldw	x,(OFST+1,sp)
 561  0045 e707          	ld	(7,x),a
 562                     ; 277 }
 565  0047 85            	popw	x
 566  0048 81            	ret
 621                     ; 285 void DMA_GlobalCmd(FunctionalState NewState)
 621                     ; 286 {
 622                     .text:	section	.text,new
 623  0000               _DMA_GlobalCmd:
 627                     ; 288   assert_param(IS_FUNCTIONAL_STATE(NewState));
 629                     ; 290   if (NewState != DISABLE)
 631  0000 4d            	tnz	a
 632  0001 2706          	jreq	L172
 633                     ; 293     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 635  0003 72105070      	bset	20592,#0
 637  0007 2004          	jra	L372
 638  0009               L172:
 639                     ; 298     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 641  0009 72115070      	bres	20592,#0
 642  000d               L372:
 643                     ; 300 }
 646  000d 81            	ret
 693                     ; 311 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 693                     ; 312 {
 694                     .text:	section	.text,new
 695  0000               _DMA_Cmd:
 697  0000 89            	pushw	x
 698       00000000      OFST:	set	0
 701                     ; 314   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 703                     ; 315   assert_param(IS_FUNCTIONAL_STATE(NewState));
 705                     ; 317   if (NewState != DISABLE)
 707  0001 0d05          	tnz	(OFST+5,sp)
 708  0003 2706          	jreq	L123
 709                     ; 320     DMA_Channelx->CCR |= DMA_CCR_CE;
 711  0005 f6            	ld	a,(x)
 712  0006 aa01          	or	a,#1
 713  0008 f7            	ld	(x),a
 715  0009 2006          	jra	L323
 716  000b               L123:
 717                     ; 325     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 719  000b 1e01          	ldw	x,(OFST+1,sp)
 720  000d f6            	ld	a,(x)
 721  000e a4fe          	and	a,#254
 722  0010 f7            	ld	(x),a
 723  0011               L323:
 724                     ; 327 }
 727  0011 85            	popw	x
 728  0012 81            	ret
 760                     ; 339 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 760                     ; 340 {
 761                     .text:	section	.text,new
 762  0000               _DMA_SetTimeOut:
 766                     ; 342   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 768                     ; 345   DMA1->GCSR = 0;
 770  0000 725f5070      	clr	20592
 771                     ; 346   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 773  0004 48            	sll	a
 774  0005 48            	sll	a
 775  0006 c75070        	ld	20592,a
 776                     ; 348 }
 779  0009 81            	ret
 824                     ; 398 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 824                     ; 399 {
 825                     .text:	section	.text,new
 826  0000               _DMA_SetCurrDataCounter:
 828  0000 89            	pushw	x
 829       00000000      OFST:	set	0
 832                     ; 401   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 834                     ; 404   DMA_Channelx->CNBTR = DataNumber;
 836  0001 7b05          	ld	a,(OFST+5,sp)
 837  0003 1e01          	ldw	x,(OFST+1,sp)
 838  0005 e702          	ld	(2,x),a
 839                     ; 405 }
 842  0007 85            	popw	x
 843  0008 81            	ret
 881                     ; 412 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 881                     ; 413 {
 882                     .text:	section	.text,new
 883  0000               _DMA_GetCurrDataCounter:
 887                     ; 415   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 889                     ; 418   return ((uint8_t)(DMA_Channelx->CNBTR));
 891  0000 e602          	ld	a,(2,x)
 894  0002 81            	ret
 971                     ; 479 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, 
 971                     ; 480                   DMA_ITx_TypeDef DMA_ITx,
 971                     ; 481                   FunctionalState NewState)
 971                     ; 482 {
 972                     .text:	section	.text,new
 973  0000               _DMA_ITConfig:
 975  0000 89            	pushw	x
 976       00000000      OFST:	set	0
 979                     ; 484   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 981                     ; 485   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 983                     ; 486   assert_param(IS_FUNCTIONAL_STATE(NewState));
 985                     ; 488   if (NewState != DISABLE)
 987  0001 0d06          	tnz	(OFST+6,sp)
 988  0003 2706          	jreq	L344
 989                     ; 491     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 991  0005 f6            	ld	a,(x)
 992  0006 1a05          	or	a,(OFST+5,sp)
 993  0008 f7            	ld	(x),a
 995  0009 2007          	jra	L544
 996  000b               L344:
 997                     ; 496     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
 999  000b 1e01          	ldw	x,(OFST+1,sp)
1000  000d 7b05          	ld	a,(OFST+5,sp)
1001  000f 43            	cpl	a
1002  0010 f4            	and	a,(x)
1003  0011 f7            	ld	(x),a
1004  0012               L544:
1005                     ; 498 }
1008  0012 85            	popw	x
1009  0013 81            	ret
1254                     ; 527 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
1254                     ; 528 {
1255                     .text:	section	.text,new
1256  0000               _DMA_GetFlagStatus:
1258  0000 89            	pushw	x
1259  0001 5204          	subw	sp,#4
1260       00000004      OFST:	set	4
1263                     ; 529   FlagStatus flagstatus = RESET;
1265                     ; 530   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1267                     ; 531   uint8_t tmpgir1 = 0;
1269                     ; 532   uint8_t tmpgcsr = 0;
1271                     ; 535   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
1273                     ; 538   tmpgcsr = DMA1->GCSR;
1275  0003 c65070        	ld	a,20592
1276  0006 6b04          	ld	(OFST+0,sp),a
1277                     ; 539   tmpgir1 = DMA1->GIR1;
1279  0008 c65071        	ld	a,20593
1280  000b 6b01          	ld	(OFST-3,sp),a
1281                     ; 541   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
1283  000d 01            	rrwa	x,a
1284  000e 9f            	ld	a,xl
1285  000f a40f          	and	a,#15
1286  0011 97            	ld	xl,a
1287  0012 4f            	clr	a
1288  0013 02            	rlwa	x,a
1289  0014 5d            	tnzw	x
1290  0015 2736          	jreq	L175
1291                     ; 544     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
1293  0017 7b05          	ld	a,(OFST+1,sp)
1294  0019 a501          	bcp	a,#1
1295  001b 2707          	jreq	L375
1296                     ; 546       DMA_Channelx = DMA1_Channel0;
1298  001d ae5075        	ldw	x,#20597
1299  0020 1f02          	ldw	(OFST-2,sp),x
1301  0022 201f          	jra	L575
1302  0024               L375:
1303                     ; 548     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
1305  0024 7b05          	ld	a,(OFST+1,sp)
1306  0026 a502          	bcp	a,#2
1307  0028 2707          	jreq	L775
1308                     ; 550       DMA_Channelx = DMA1_Channel1;
1310  002a ae507f        	ldw	x,#20607
1311  002d 1f02          	ldw	(OFST-2,sp),x
1313  002f 2012          	jra	L575
1314  0031               L775:
1315                     ; 552     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
1317  0031 7b05          	ld	a,(OFST+1,sp)
1318  0033 a504          	bcp	a,#4
1319  0035 2707          	jreq	L306
1320                     ; 554       DMA_Channelx = DMA1_Channel2;
1322  0037 ae5089        	ldw	x,#20617
1323  003a 1f02          	ldw	(OFST-2,sp),x
1325  003c 2005          	jra	L575
1326  003e               L306:
1327                     ; 558       DMA_Channelx = DMA1_Channel3;
1329  003e ae5093        	ldw	x,#20627
1330  0041 1f02          	ldw	(OFST-2,sp),x
1331  0043               L575:
1332                     ; 562     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
1334  0043 1e02          	ldw	x,(OFST-2,sp)
1335  0045 e601          	ld	a,(1,x)
1336  0047 1406          	and	a,(OFST+2,sp)
1337  0049 6b04          	ld	(OFST+0,sp),a
1339  004b 2014          	jra	L706
1340  004d               L175:
1341                     ; 564   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
1343  004d 7b05          	ld	a,(OFST+1,sp)
1344  004f a510          	bcp	a,#16
1345  0051 2708          	jreq	L116
1346                     ; 567     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
1348  0053 7b06          	ld	a,(OFST+2,sp)
1349  0055 1401          	and	a,(OFST-3,sp)
1350  0057 6b04          	ld	(OFST+0,sp),a
1352  0059 2006          	jra	L706
1353  005b               L116:
1354                     ; 572     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
1356  005b 7b04          	ld	a,(OFST+0,sp)
1357  005d a402          	and	a,#2
1358  005f 6b04          	ld	(OFST+0,sp),a
1359  0061               L706:
1360                     ; 576   return (flagstatus);
1362  0061 7b04          	ld	a,(OFST+0,sp)
1365  0063 5b06          	addw	sp,#6
1366  0065 81            	ret
1413                     ; 594 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
1413                     ; 595 {
1414                     .text:	section	.text,new
1415  0000               _DMA_ClearFlag:
1417  0000 89            	pushw	x
1418  0001 89            	pushw	x
1419       00000002      OFST:	set	2
1422                     ; 596   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1424                     ; 599   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
1426                     ; 602   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
1428  0002 01            	rrwa	x,a
1429  0003 9f            	ld	a,xl
1430  0004 a401          	and	a,#1
1431  0006 97            	ld	xl,a
1432  0007 4f            	clr	a
1433  0008 02            	rlwa	x,a
1434  0009 5d            	tnzw	x
1435  000a 2707          	jreq	L146
1436                     ; 604     DMA_Channelx = DMA1_Channel0;
1438  000c ae5075        	ldw	x,#20597
1439  000f 1f01          	ldw	(OFST-1,sp),x
1441  0011 201f          	jra	L346
1442  0013               L146:
1443                     ; 608     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
1445  0013 7b03          	ld	a,(OFST+1,sp)
1446  0015 a502          	bcp	a,#2
1447  0017 2707          	jreq	L546
1448                     ; 610       DMA_Channelx = DMA1_Channel1;
1450  0019 ae507f        	ldw	x,#20607
1451  001c 1f01          	ldw	(OFST-1,sp),x
1453  001e 2012          	jra	L346
1454  0020               L546:
1455                     ; 614       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
1457  0020 7b03          	ld	a,(OFST+1,sp)
1458  0022 a504          	bcp	a,#4
1459  0024 2707          	jreq	L156
1460                     ; 616         DMA_Channelx = DMA1_Channel2;
1462  0026 ae5089        	ldw	x,#20617
1463  0029 1f01          	ldw	(OFST-1,sp),x
1465  002b 2005          	jra	L346
1466  002d               L156:
1467                     ; 620         DMA_Channelx = DMA1_Channel3;
1469  002d ae5093        	ldw	x,#20627
1470  0030 1f01          	ldw	(OFST-1,sp),x
1471  0032               L346:
1472                     ; 626   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
1474  0032 1e01          	ldw	x,(OFST-1,sp)
1475  0034 7b04          	ld	a,(OFST+2,sp)
1476  0036 a406          	and	a,#6
1477  0038 43            	cpl	a
1478  0039 e401          	and	a,(1,x)
1479  003b e701          	ld	(1,x),a
1480                     ; 627 }
1483  003d 5b04          	addw	sp,#4
1484  003f 81            	ret
1618                     ; 643 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
1618                     ; 644 {
1619                     .text:	section	.text,new
1620  0000               _DMA_GetITStatus:
1622  0000 88            	push	a
1623  0001 5204          	subw	sp,#4
1624       00000004      OFST:	set	4
1627                     ; 645   ITStatus itstatus = RESET;
1629                     ; 646   uint8_t tmpreg = 0;
1631                     ; 647   uint8_t tmp2 = 0;
1633                     ; 648   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1635                     ; 651   assert_param(IS_DMA_GET_IT(DMA_IT));
1637                     ; 654   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1639  0003 a510          	bcp	a,#16
1640  0005 2707          	jreq	L537
1641                     ; 656     DMA_Channelx = DMA1_Channel0;
1643  0007 ae5075        	ldw	x,#20597
1644  000a 1f03          	ldw	(OFST-1,sp),x
1646  000c 201f          	jra	L737
1647  000e               L537:
1648                     ; 660     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
1650  000e 7b05          	ld	a,(OFST+1,sp)
1651  0010 a520          	bcp	a,#32
1652  0012 2707          	jreq	L147
1653                     ; 662       DMA_Channelx = DMA1_Channel1;
1655  0014 ae507f        	ldw	x,#20607
1656  0017 1f03          	ldw	(OFST-1,sp),x
1658  0019 2012          	jra	L737
1659  001b               L147:
1660                     ; 666       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
1662  001b 7b05          	ld	a,(OFST+1,sp)
1663  001d a540          	bcp	a,#64
1664  001f 2707          	jreq	L547
1665                     ; 668         DMA_Channelx = DMA1_Channel2;
1667  0021 ae5089        	ldw	x,#20617
1668  0024 1f03          	ldw	(OFST-1,sp),x
1670  0026 2005          	jra	L737
1671  0028               L547:
1672                     ; 672         DMA_Channelx = DMA1_Channel3;
1674  0028 ae5093        	ldw	x,#20627
1675  002b 1f03          	ldw	(OFST-1,sp),x
1676  002d               L737:
1677                     ; 677   tmpreg =  DMA_Channelx->CSPR ;
1679  002d 1e03          	ldw	x,(OFST-1,sp)
1680  002f e601          	ld	a,(1,x)
1681  0031 6b01          	ld	(OFST-3,sp),a
1682                     ; 678   tmpreg &= DMA_Channelx->CCR ;
1684  0033 1e03          	ldw	x,(OFST-1,sp)
1685  0035 7b01          	ld	a,(OFST-3,sp)
1686  0037 f4            	and	a,(x)
1687  0038 6b01          	ld	(OFST-3,sp),a
1688                     ; 679   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
1690  003a 7b05          	ld	a,(OFST+1,sp)
1691  003c a406          	and	a,#6
1692  003e 6b02          	ld	(OFST-2,sp),a
1693                     ; 680   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
1695  0040 7b01          	ld	a,(OFST-3,sp)
1696  0042 1402          	and	a,(OFST-2,sp)
1697  0044 6b02          	ld	(OFST-2,sp),a
1698                     ; 683   return (itstatus);
1700  0046 7b02          	ld	a,(OFST-2,sp)
1703  0048 5b05          	addw	sp,#5
1704  004a 81            	ret
1752                     ; 701 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
1752                     ; 702 {
1753                     .text:	section	.text,new
1754  0000               _DMA_ClearITPendingBit:
1756  0000 88            	push	a
1757  0001 89            	pushw	x
1758       00000002      OFST:	set	2
1761                     ; 703   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1763                     ; 706   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
1765                     ; 708   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1767  0002 a510          	bcp	a,#16
1768  0004 2707          	jreq	L577
1769                     ; 710     DMA_Channelx = DMA1_Channel0;
1771  0006 ae5075        	ldw	x,#20597
1772  0009 1f01          	ldw	(OFST-1,sp),x
1774  000b 201f          	jra	L777
1775  000d               L577:
1776                     ; 714     if ((DMA_IT & 0x20) != (uint8_t)RESET)
1778  000d 7b03          	ld	a,(OFST+1,sp)
1779  000f a520          	bcp	a,#32
1780  0011 2707          	jreq	L1001
1781                     ; 716       DMA_Channelx = DMA1_Channel1;
1783  0013 ae507f        	ldw	x,#20607
1784  0016 1f01          	ldw	(OFST-1,sp),x
1786  0018 2012          	jra	L777
1787  001a               L1001:
1788                     ; 720       if ((DMA_IT & 0x40) != (uint8_t)RESET)
1790  001a 7b03          	ld	a,(OFST+1,sp)
1791  001c a540          	bcp	a,#64
1792  001e 2707          	jreq	L5001
1793                     ; 722         DMA_Channelx = DMA1_Channel2;
1795  0020 ae5089        	ldw	x,#20617
1796  0023 1f01          	ldw	(OFST-1,sp),x
1798  0025 2005          	jra	L777
1799  0027               L5001:
1800                     ; 726         DMA_Channelx = DMA1_Channel3;
1802  0027 ae5093        	ldw	x,#20627
1803  002a 1f01          	ldw	(OFST-1,sp),x
1804  002c               L777:
1805                     ; 731   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
1807  002c 1e01          	ldw	x,(OFST-1,sp)
1808  002e 7b03          	ld	a,(OFST+1,sp)
1809  0030 a406          	and	a,#6
1810  0032 43            	cpl	a
1811  0033 e401          	and	a,(1,x)
1812  0035 e701          	ld	(1,x),a
1813                     ; 732 }
1816  0037 5b03          	addw	sp,#3
1817  0039 81            	ret
1830                     	xdef	_DMA_ClearITPendingBit
1831                     	xdef	_DMA_GetITStatus
1832                     	xdef	_DMA_ClearFlag
1833                     	xdef	_DMA_GetFlagStatus
1834                     	xdef	_DMA_ITConfig
1835                     	xdef	_DMA_GetCurrDataCounter
1836                     	xdef	_DMA_SetCurrDataCounter
1837                     	xdef	_DMA_SetTimeOut
1838                     	xdef	_DMA_Cmd
1839                     	xdef	_DMA_GlobalCmd
1840                     	xdef	_DMA_Init
1841                     	xdef	_DMA_DeInit
1842                     	xdef	_DMA_GlobalDeInit
1861                     	end
