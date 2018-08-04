   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  50                     ; 137 void DMA_GlobalDeInit(void)
  50                     ; 138 {
  51                     .text:	section	.text,new
  52  0000               f_DMA_GlobalDeInit:
  56                     ; 140   DMA1->GCSR &= (uint8_t)~(DMA_GCSR_GE);
  58  0000 72115070      	bres	20592,#0
  59                     ; 143   DMA1->GCSR  = (uint8_t)DMA_GCSR_RESET_VALUE;
  61  0004 35fc5070      	mov	20592,#252
  62                     ; 144 }
  65  0008 87            	retf	
 180                     ; 152 void DMA_DeInit(DMA_Channel_TypeDef* DMA_Channelx)
 180                     ; 153 {
 181                     .text:	section	.text,new
 182  0000               f_DMA_DeInit:
 184  0000 89            	pushw	x
 185       00000000      OFST:	set	0
 188                     ; 155   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 190                     ; 158   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 192  0001 f6            	ld	a,(x)
 193  0002 a4fe          	and	a,#254
 194  0004 f7            	ld	(x),a
 195                     ; 161   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 197  0005 7f            	clr	(x)
 198                     ; 164   DMA_Channelx->CNBTR = DMA_CNBTR_RESET_VALUE;
 200  0006 6f02          	clr	(2,x)
 201                     ; 167   if (DMA_Channelx == DMA1_Channel3)
 203  0008 a35093        	cpw	x,#20627
 204  000b 2608          	jrne	L501
 205                     ; 169     DMA_Channelx->CPARH  = DMA_C3PARH_RESET_VALUE;
 207  000d a640          	ld	a,#64
 208  000f e703          	ld	(3,x),a
 209                     ; 170     DMA_Channelx->CM0EAR = DMA_C3M0EAR_RESET_VALUE;
 211  0011 6f05          	clr	(5,x)
 213  0013 2006          	jra	L701
 214  0015               L501:
 215                     ; 174     DMA_Channelx->CPARH  = DMA_CPARH_RESET_VALUE;
 217  0015 1e01          	ldw	x,(OFST+1,sp)
 218  0017 a652          	ld	a,#82
 219  0019 e703          	ld	(3,x),a
 220  001b               L701:
 221                     ; 176   DMA_Channelx->CPARL  = DMA_CPARL_RESET_VALUE;
 223  001b 1e01          	ldw	x,(OFST+1,sp)
 224  001d 6f04          	clr	(4,x)
 225                     ; 179   DMA_Channelx->CM0ARH = DMA_CM0ARH_RESET_VALUE;
 227  001f 6f06          	clr	(6,x)
 228                     ; 180   DMA_Channelx->CM0ARL = DMA_CM0ARL_RESET_VALUE;
 230  0021 6f07          	clr	(7,x)
 231                     ; 183   DMA_Channelx->CSPR = DMA_CSPR_RESET_VALUE;
 233  0023 6f01          	clr	(1,x)
 234                     ; 184 }
 237  0025 85            	popw	x
 238  0026 87            	retf	
 477                     ; 221 void DMA_Init(DMA_Channel_TypeDef* DMA_Channelx,
 477                     ; 222               uint32_t DMA_Memory0BaseAddr,
 477                     ; 223               uint16_t DMA_PeripheralMemory1BaseAddr,
 477                     ; 224               uint8_t DMA_BufferSize,
 477                     ; 225               DMA_DIR_TypeDef DMA_DIR,
 477                     ; 226               DMA_Mode_TypeDef DMA_Mode,
 477                     ; 227               DMA_MemoryIncMode_TypeDef DMA_MemoryIncMode,
 477                     ; 228               DMA_Priority_TypeDef DMA_Priority,
 477                     ; 229               DMA_MemoryDataSize_TypeDef DMA_MemoryDataSize )
 477                     ; 230 {
 478                     .text:	section	.text,new
 479  0000               f_DMA_Init:
 481  0000 89            	pushw	x
 482       00000000      OFST:	set	0
 485                     ; 232   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 487                     ; 233   assert_param(IS_DMA_DIR(DMA_DIR));
 489                     ; 234   assert_param(IS_DMA_BUFFER_SIZE(DMA_BufferSize));
 491                     ; 235   assert_param(IS_DMA_MODE(DMA_Mode));
 493                     ; 236   assert_param(IS_DMA_MEMORY_INC_MODE(DMA_MemoryIncMode));
 495                     ; 237   assert_param(IS_DMA_PRIORITY(DMA_Priority));
 497                     ; 241   DMA_Channelx->CCR &= (uint8_t)~(DMA_CCR_CE);
 499  0001 f6            	ld	a,(x)
 500  0002 a4fe          	and	a,#254
 501  0004 f7            	ld	(x),a
 502                     ; 244   DMA_Channelx->CCR  = DMA_CCR_RESET_VALUE;
 504  0005 7f            	clr	(x)
 505                     ; 247   DMA_Channelx->CCR |= (uint8_t)((uint8_t)((uint8_t)DMA_DIR | \
 505                     ; 248                                            (uint8_t)DMA_Mode) | \
 505                     ; 249                                            (uint8_t)DMA_MemoryIncMode);
 507  0006 7b0d          	ld	a,(OFST+13,sp)
 508  0008 1a0e          	or	a,(OFST+14,sp)
 509  000a 1a0f          	or	a,(OFST+15,sp)
 510  000c fa            	or	a,(x)
 511  000d f7            	ld	(x),a
 512                     ; 252   DMA_Channelx->CSPR &= (uint8_t)(~(uint8_t)(DMA_CSPR_PL | DMA_CSPR_16BM));
 514  000e e601          	ld	a,(1,x)
 515  0010 a4c7          	and	a,#199
 516  0012 e701          	ld	(1,x),a
 517                     ; 255   DMA_Channelx->CSPR |= (uint8_t)((uint8_t)DMA_Priority | \
 517                     ; 256                                   (uint8_t)DMA_MemoryDataSize);
 519  0014 7b10          	ld	a,(OFST+16,sp)
 520  0016 1a11          	or	a,(OFST+17,sp)
 521  0018 ea01          	or	a,(1,x)
 522  001a e701          	ld	(1,x),a
 523                     ; 260   DMA_Channelx->CNBTR = (uint8_t)DMA_BufferSize;
 525  001c 7b0c          	ld	a,(OFST+12,sp)
 526  001e 1e01          	ldw	x,(OFST+1,sp)
 527  0020 e702          	ld	(2,x),a
 528                     ; 265   DMA_Channelx->CPARH = (uint8_t)(DMA_PeripheralMemory1BaseAddr >> (uint8_t)8);
 530  0022 7b0a          	ld	a,(OFST+10,sp)
 531  0024 e703          	ld	(3,x),a
 532                     ; 266   DMA_Channelx->CPARL = (uint8_t)(DMA_PeripheralMemory1BaseAddr);
 534  0026 7b0b          	ld	a,(OFST+11,sp)
 535  0028 e704          	ld	(4,x),a
 536                     ; 270   if (DMA_Channelx == DMA1_Channel3)
 538  002a a35093        	cpw	x,#20627
 539  002d 2604          	jrne	L142
 540                     ; 272     DMA_Channelx->CM0EAR = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)16);
 542  002f 7b07          	ld	a,(OFST+7,sp)
 543  0031 e705          	ld	(5,x),a
 544  0033               L142:
 545                     ; 274   DMA_Channelx->CM0ARH = (uint8_t)(DMA_Memory0BaseAddr >> (uint8_t)8);
 547  0033 7b08          	ld	a,(OFST+8,sp)
 548  0035 e706          	ld	(6,x),a
 549                     ; 275   DMA_Channelx->CM0ARL = (uint8_t)(DMA_Memory0BaseAddr);
 551  0037 7b09          	ld	a,(OFST+9,sp)
 552  0039 e707          	ld	(7,x),a
 553                     ; 277 }
 556  003b 85            	popw	x
 557  003c 87            	retf	
 611                     ; 285 void DMA_GlobalCmd(FunctionalState NewState)
 611                     ; 286 {
 612                     .text:	section	.text,new
 613  0000               f_DMA_GlobalCmd:
 617                     ; 288   assert_param(IS_FUNCTIONAL_STATE(NewState));
 619                     ; 290   if (NewState != DISABLE)
 621  0000 4d            	tnz	a
 622  0001 2705          	jreq	L172
 623                     ; 293     DMA1->GCSR |= (uint8_t)DMA_GCSR_GE;
 625  0003 72105070      	bset	20592,#0
 628  0007 87            	retf	
 629  0008               L172:
 630                     ; 298     DMA1->GCSR &= (uint8_t)(~DMA_GCSR_GE);
 632  0008 72115070      	bres	20592,#0
 633                     ; 300 }
 636  000c 87            	retf	
 682                     ; 311 void DMA_Cmd(DMA_Channel_TypeDef* DMA_Channelx, FunctionalState NewState)
 682                     ; 312 {
 683                     .text:	section	.text,new
 684  0000               f_DMA_Cmd:
 686  0000 89            	pushw	x
 687       00000000      OFST:	set	0
 690                     ; 314   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 692                     ; 315   assert_param(IS_FUNCTIONAL_STATE(NewState));
 694                     ; 317   if (NewState != DISABLE)
 696  0001 7b06          	ld	a,(OFST+6,sp)
 697  0003 2705          	jreq	L123
 698                     ; 320     DMA_Channelx->CCR |= DMA_CCR_CE;
 700  0005 f6            	ld	a,(x)
 701  0006 aa01          	or	a,#1
 703  0008 2005          	jra	L323
 704  000a               L123:
 705                     ; 325     DMA_Channelx->CCR &= (uint8_t)(~DMA_CCR_CE);
 707  000a 1e01          	ldw	x,(OFST+1,sp)
 708  000c f6            	ld	a,(x)
 709  000d a4fe          	and	a,#254
 710  000f               L323:
 711  000f f7            	ld	(x),a
 712                     ; 327 }
 715  0010 85            	popw	x
 716  0011 87            	retf	
 747                     ; 339 void DMA_SetTimeOut(uint8_t DMA_TimeOut)
 747                     ; 340 {
 748                     .text:	section	.text,new
 749  0000               f_DMA_SetTimeOut:
 753                     ; 342   assert_param(IS_DMA_TIMEOUT(DMA_TimeOut));
 755                     ; 345   DMA1->GCSR = 0;
 757  0000 725f5070      	clr	20592
 758                     ; 346   DMA1->GCSR = (uint8_t)(DMA_TimeOut << (uint8_t)2);
 760  0004 48            	sll	a
 761  0005 48            	sll	a
 762  0006 c75070        	ld	20592,a
 763                     ; 348 }
 766  0009 87            	retf	
 810                     ; 398 void DMA_SetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx, uint8_t DataNumber)
 810                     ; 399 {
 811                     .text:	section	.text,new
 812  0000               f_DMA_SetCurrDataCounter:
 814  0000 89            	pushw	x
 815       00000000      OFST:	set	0
 818                     ; 401   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 820                     ; 404   DMA_Channelx->CNBTR = DataNumber;
 822  0001 7b06          	ld	a,(OFST+6,sp)
 823  0003 1e01          	ldw	x,(OFST+1,sp)
 824  0005 e702          	ld	(2,x),a
 825                     ; 405 }
 828  0007 85            	popw	x
 829  0008 87            	retf	
 866                     ; 412 uint8_t DMA_GetCurrDataCounter(DMA_Channel_TypeDef* DMA_Channelx)
 866                     ; 413 {
 867                     .text:	section	.text,new
 868  0000               f_DMA_GetCurrDataCounter:
 872                     ; 415   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 874                     ; 418   return ((uint8_t)(DMA_Channelx->CNBTR));
 876  0000 e602          	ld	a,(2,x)
 879  0002 87            	retf	
 955                     ; 479 void DMA_ITConfig(DMA_Channel_TypeDef* DMA_Channelx, 
 955                     ; 480                   DMA_ITx_TypeDef DMA_ITx,
 955                     ; 481                   FunctionalState NewState)
 955                     ; 482 {
 956                     .text:	section	.text,new
 957  0000               f_DMA_ITConfig:
 959  0000 89            	pushw	x
 960       00000000      OFST:	set	0
 963                     ; 484   assert_param(IS_DMA_CHANNEL(DMA_Channelx));
 965                     ; 485   assert_param(IS_DMA_CONFIG_ITX(DMA_ITx));
 967                     ; 486   assert_param(IS_FUNCTIONAL_STATE(NewState));
 969                     ; 488   if (NewState != DISABLE)
 971  0001 7b07          	ld	a,(OFST+7,sp)
 972  0003 2705          	jreq	L344
 973                     ; 491     DMA_Channelx->CCR |= (uint8_t)(DMA_ITx);
 975  0005 f6            	ld	a,(x)
 976  0006 1a06          	or	a,(OFST+6,sp)
 978  0008 2006          	jra	L544
 979  000a               L344:
 980                     ; 496     DMA_Channelx->CCR &= (uint8_t)~(DMA_ITx);
 982  000a 1e01          	ldw	x,(OFST+1,sp)
 983  000c 7b06          	ld	a,(OFST+6,sp)
 984  000e 43            	cpl	a
 985  000f f4            	and	a,(x)
 986  0010               L544:
 987  0010 f7            	ld	(x),a
 988                     ; 498 }
 991  0011 85            	popw	x
 992  0012 87            	retf	
1236                     ; 527 FlagStatus DMA_GetFlagStatus(DMA_FLAG_TypeDef DMA_FLAG)
1236                     ; 528 {
1237                     .text:	section	.text,new
1238  0000               f_DMA_GetFlagStatus:
1240  0000 89            	pushw	x
1241  0001 5204          	subw	sp,#4
1242       00000004      OFST:	set	4
1245                     ; 529   FlagStatus flagstatus = RESET;
1247                     ; 530   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1249                     ; 531   uint8_t tmpgir1 = 0;
1251                     ; 532   uint8_t tmpgcsr = 0;
1253                     ; 535   assert_param(IS_DMA_GET_FLAG(DMA_FLAG));
1255                     ; 538   tmpgcsr = DMA1->GCSR;
1257  0003 c65070        	ld	a,20592
1258  0006 6b04          	ld	(OFST+0,sp),a
1259                     ; 539   tmpgir1 = DMA1->GIR1;
1261  0008 c65071        	ld	a,20593
1262  000b 6b01          	ld	(OFST-3,sp),a
1263                     ; 541   if (((uint16_t)DMA_FLAG & (uint16_t)0x0F00) != (uint16_t)RESET)
1265  000d 01            	rrwa	x,a
1266  000e 9f            	ld	a,xl
1267  000f a40f          	and	a,#15
1268  0011 97            	ld	xl,a
1269  0012 4f            	clr	a
1270  0013 02            	rlwa	x,a
1271  0014 5d            	tnzw	x
1272  0015 2728          	jreq	L175
1273                     ; 544     if (((uint16_t)DMA_FLAG & 0x0100) != (uint16_t)RESET)
1275  0017 7b05          	ld	a,(OFST+1,sp)
1276  0019 a501          	bcp	a,#1
1277  001b 2705          	jreq	L375
1278                     ; 546       DMA_Channelx = DMA1_Channel0;
1280  001d ae5075        	ldw	x,#20597
1282  0020 2015          	jra	L575
1283  0022               L375:
1284                     ; 548     else if  (((uint16_t)DMA_FLAG & 0x0200) != (uint16_t)RESET)
1286  0022 a502          	bcp	a,#2
1287  0024 2705          	jreq	L775
1288                     ; 550       DMA_Channelx = DMA1_Channel1;
1290  0026 ae507f        	ldw	x,#20607
1292  0029 200c          	jra	L575
1293  002b               L775:
1294                     ; 552     else if  (((uint16_t)DMA_FLAG & 0x0400) != (uint16_t)RESET)
1296  002b a504          	bcp	a,#4
1297  002d 2705          	jreq	L306
1298                     ; 554       DMA_Channelx = DMA1_Channel2;
1300  002f ae5089        	ldw	x,#20617
1302  0032 2003          	jra	L575
1303  0034               L306:
1304                     ; 558       DMA_Channelx = DMA1_Channel3;
1306  0034 ae5093        	ldw	x,#20627
1307  0037               L575:
1308  0037 1f02          	ldw	(OFST-2,sp),x
1309                     ; 562     flagstatus = (FlagStatus)((uint8_t)(DMA_Channelx->CSPR) & (uint8_t)DMA_FLAG);
1311  0039 e601          	ld	a,(1,x)
1312  003b 1406          	and	a,(OFST+2,sp)
1314  003d 2010          	jra	L706
1315  003f               L175:
1316                     ; 564   else if (((uint16_t)DMA_FLAG & 0x1000) != (uint16_t)RESET)
1318  003f 7b05          	ld	a,(OFST+1,sp)
1319  0041 a510          	bcp	a,#16
1320  0043 2706          	jreq	L116
1321                     ; 567     flagstatus = (FlagStatus)(tmpgir1 & (uint8_t)DMA_FLAG);
1323  0045 7b06          	ld	a,(OFST+2,sp)
1324  0047 1401          	and	a,(OFST-3,sp)
1326  0049 2004          	jra	L706
1327  004b               L116:
1328                     ; 572     flagstatus = (FlagStatus)(tmpgcsr & DMA_GCSR_GB);
1330  004b 7b04          	ld	a,(OFST+0,sp)
1331  004d a402          	and	a,#2
1332  004f               L706:
1333                     ; 576   return (flagstatus);
1337  004f 5b06          	addw	sp,#6
1338  0051 87            	retf	
1384                     ; 594 void DMA_ClearFlag(DMA_FLAG_TypeDef DMA_FLAG)
1384                     ; 595 {
1385                     .text:	section	.text,new
1386  0000               f_DMA_ClearFlag:
1388  0000 89            	pushw	x
1389  0001 89            	pushw	x
1390       00000002      OFST:	set	2
1393                     ; 596   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1395                     ; 599   assert_param(IS_DMA_CLEAR_FLAG(DMA_FLAG));
1397                     ; 602   if (((uint16_t)DMA_FLAG & (uint16_t)0x0100) != (uint16_t)RESET)
1399  0002 01            	rrwa	x,a
1400  0003 9f            	ld	a,xl
1401  0004 a401          	and	a,#1
1402  0006 97            	ld	xl,a
1403  0007 4f            	clr	a
1404  0008 02            	rlwa	x,a
1405  0009 5d            	tnzw	x
1406  000a 2705          	jreq	L146
1407                     ; 604     DMA_Channelx = DMA1_Channel0;
1409  000c ae5075        	ldw	x,#20597
1411  000f 2017          	jra	L346
1412  0011               L146:
1413                     ; 608     if (((uint16_t)DMA_FLAG & (uint16_t)0x0200) != (uint16_t)RESET)
1415  0011 7b03          	ld	a,(OFST+1,sp)
1416  0013 a502          	bcp	a,#2
1417  0015 2705          	jreq	L546
1418                     ; 610       DMA_Channelx = DMA1_Channel1;
1420  0017 ae507f        	ldw	x,#20607
1422  001a 200c          	jra	L346
1423  001c               L546:
1424                     ; 614       if (((uint16_t)DMA_FLAG & (uint16_t)0x0400) != (uint16_t)RESET)
1426  001c a504          	bcp	a,#4
1427  001e 2705          	jreq	L156
1428                     ; 616         DMA_Channelx = DMA1_Channel2;
1430  0020 ae5089        	ldw	x,#20617
1432  0023 2003          	jra	L346
1433  0025               L156:
1434                     ; 620         DMA_Channelx = DMA1_Channel3;
1436  0025 ae5093        	ldw	x,#20627
1437  0028               L346:
1438  0028 1f01          	ldw	(OFST-1,sp),x
1439                     ; 626   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)((uint8_t)DMA_FLAG & (uint8_t)0x06);
1441  002a 7b04          	ld	a,(OFST+2,sp)
1442  002c a406          	and	a,#6
1443  002e 43            	cpl	a
1444  002f e401          	and	a,(1,x)
1445  0031 e701          	ld	(1,x),a
1446                     ; 627 }
1449  0033 5b04          	addw	sp,#4
1450  0035 87            	retf	
1583                     ; 643 ITStatus DMA_GetITStatus(DMA_IT_TypeDef DMA_IT)
1583                     ; 644 {
1584                     .text:	section	.text,new
1585  0000               f_DMA_GetITStatus:
1587  0000 88            	push	a
1588  0001 5204          	subw	sp,#4
1589       00000004      OFST:	set	4
1592                     ; 645   ITStatus itstatus = RESET;
1594                     ; 646   uint8_t tmpreg = 0;
1596                     ; 647   uint8_t tmp2 = 0;
1598                     ; 648   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1600                     ; 651   assert_param(IS_DMA_GET_IT(DMA_IT));
1602                     ; 654   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1604  0003 a510          	bcp	a,#16
1605  0005 2705          	jreq	L537
1606                     ; 656     DMA_Channelx = DMA1_Channel0;
1608  0007 ae5075        	ldw	x,#20597
1610  000a 2017          	jra	L737
1611  000c               L537:
1612                     ; 660     if  ((DMA_IT & 0x20) != (uint8_t)RESET)
1614  000c 7b05          	ld	a,(OFST+1,sp)
1615  000e a520          	bcp	a,#32
1616  0010 2705          	jreq	L147
1617                     ; 662       DMA_Channelx = DMA1_Channel1;
1619  0012 ae507f        	ldw	x,#20607
1621  0015 200c          	jra	L737
1622  0017               L147:
1623                     ; 666       if  ((DMA_IT & 0x40) != (uint8_t)RESET)
1625  0017 a540          	bcp	a,#64
1626  0019 2705          	jreq	L547
1627                     ; 668         DMA_Channelx = DMA1_Channel2;
1629  001b ae5089        	ldw	x,#20617
1631  001e 2003          	jra	L737
1632  0020               L547:
1633                     ; 672         DMA_Channelx = DMA1_Channel3;
1635  0020 ae5093        	ldw	x,#20627
1636  0023               L737:
1637  0023 1f03          	ldw	(OFST-1,sp),x
1638                     ; 677   tmpreg =  DMA_Channelx->CSPR ;
1640  0025 e601          	ld	a,(1,x)
1641                     ; 678   tmpreg &= DMA_Channelx->CCR ;
1643  0027 f4            	and	a,(x)
1644  0028 6b01          	ld	(OFST-3,sp),a
1645                     ; 679   tmp2 = (uint8_t)(DMA_IT & (uint8_t)(DMA_CCR_TCIE | DMA_CCR_HTIE));
1647  002a 7b05          	ld	a,(OFST+1,sp)
1648  002c a406          	and	a,#6
1649                     ; 680   itstatus = (ITStatus)((uint8_t)tmpreg & (uint8_t)tmp2);
1651  002e 1401          	and	a,(OFST-3,sp)
1652                     ; 683   return (itstatus);
1656  0030 5b05          	addw	sp,#5
1657  0032 87            	retf	
1704                     ; 701 void DMA_ClearITPendingBit(DMA_IT_TypeDef DMA_IT)
1704                     ; 702 {
1705                     .text:	section	.text,new
1706  0000               f_DMA_ClearITPendingBit:
1708  0000 88            	push	a
1709  0001 89            	pushw	x
1710       00000002      OFST:	set	2
1713                     ; 703   DMA_Channel_TypeDef* DMA_Channelx =  DMA1_Channel0;
1715                     ; 706   assert_param(IS_DMA_CLEAR_IT(DMA_IT));
1717                     ; 708   if ((DMA_IT & 0x10) != (uint8_t)RESET)
1719  0002 a510          	bcp	a,#16
1720  0004 2705          	jreq	L577
1721                     ; 710     DMA_Channelx = DMA1_Channel0;
1723  0006 ae5075        	ldw	x,#20597
1725  0009 2017          	jra	L777
1726  000b               L577:
1727                     ; 714     if ((DMA_IT & 0x20) != (uint8_t)RESET)
1729  000b 7b03          	ld	a,(OFST+1,sp)
1730  000d a520          	bcp	a,#32
1731  000f 2705          	jreq	L1001
1732                     ; 716       DMA_Channelx = DMA1_Channel1;
1734  0011 ae507f        	ldw	x,#20607
1736  0014 200c          	jra	L777
1737  0016               L1001:
1738                     ; 720       if ((DMA_IT & 0x40) != (uint8_t)RESET)
1740  0016 a540          	bcp	a,#64
1741  0018 2705          	jreq	L5001
1742                     ; 722         DMA_Channelx = DMA1_Channel2;
1744  001a ae5089        	ldw	x,#20617
1746  001d 2003          	jra	L777
1747  001f               L5001:
1748                     ; 726         DMA_Channelx = DMA1_Channel3;
1750  001f ae5093        	ldw	x,#20627
1751  0022               L777:
1752  0022 1f01          	ldw	(OFST-1,sp),x
1753                     ; 731   DMA_Channelx->CSPR &= (uint8_t)~(uint8_t)(DMA_IT & (uint8_t)0x06);
1755  0024 7b03          	ld	a,(OFST+1,sp)
1756  0026 a406          	and	a,#6
1757  0028 43            	cpl	a
1758  0029 e401          	and	a,(1,x)
1759  002b e701          	ld	(1,x),a
1760                     ; 732 }
1763  002d 5b03          	addw	sp,#3
1764  002f 87            	retf	
1776                     	xdef	f_DMA_ClearITPendingBit
1777                     	xdef	f_DMA_GetITStatus
1778                     	xdef	f_DMA_ClearFlag
1779                     	xdef	f_DMA_GetFlagStatus
1780                     	xdef	f_DMA_ITConfig
1781                     	xdef	f_DMA_GetCurrDataCounter
1782                     	xdef	f_DMA_SetCurrDataCounter
1783                     	xdef	f_DMA_SetTimeOut
1784                     	xdef	f_DMA_Cmd
1785                     	xdef	f_DMA_GlobalCmd
1786                     	xdef	f_DMA_Init
1787                     	xdef	f_DMA_DeInit
1788                     	xdef	f_DMA_GlobalDeInit
1807                     	end
