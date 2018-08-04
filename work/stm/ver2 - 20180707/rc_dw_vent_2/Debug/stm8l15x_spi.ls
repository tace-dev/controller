   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 143                     ; 125 void SPI_DeInit(SPI_TypeDef* SPIx)
 143                     ; 126 {
 144                     .text:	section	.text,new
 145  0000               f_SPI_DeInit:
 149                     ; 127   SPIx->CR1    = SPI_CR1_RESET_VALUE;
 151  0000 7f            	clr	(x)
 152                     ; 128   SPIx->CR2    = SPI_CR2_RESET_VALUE;
 154  0001 6f01          	clr	(1,x)
 155                     ; 129   SPIx->CR3    = SPI_CR3_RESET_VALUE;
 157  0003 6f02          	clr	(2,x)
 158                     ; 130   SPIx->SR     = SPI_SR_RESET_VALUE;
 160  0005 a602          	ld	a,#2
 161  0007 e703          	ld	(3,x),a
 162                     ; 131   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
 164  0009 a607          	ld	a,#7
 165  000b e705          	ld	(5,x),a
 166                     ; 132 }
 169  000d 87            	retf	
 492                     ; 174 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
 492                     ; 175               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 492                     ; 176               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
 492                     ; 177               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
 492                     ; 178               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
 492                     ; 179 {
 493                     .text:	section	.text,new
 494  0000               f_SPI_Init:
 496  0000 89            	pushw	x
 497  0001 88            	push	a
 498       00000001      OFST:	set	1
 501                     ; 181   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
 503                     ; 182   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 505                     ; 183   assert_param(IS_SPI_MODE(SPI_Mode));
 507                     ; 184   assert_param(IS_SPI_POLARITY(SPI_CPOL));
 509                     ; 185   assert_param(IS_SPI_PHASE(SPI_CPHA));
 511                     ; 186   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
 513                     ; 187   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
 515                     ; 188   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
 517                     ; 191   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
 517                     ; 192                                   (uint8_t)SPI_BaudRatePrescaler) |
 517                     ; 193                         (uint8_t)((uint8_t)SPI_CPOL |
 517                     ; 194                                   SPI_CPHA));
 519  0002 7b0a          	ld	a,(OFST+9,sp)
 520  0004 1a0b          	or	a,(OFST+10,sp)
 521  0006 6b01          	ld	(OFST+0,sp),a
 522  0008 7b07          	ld	a,(OFST+6,sp)
 523  000a 1a08          	or	a,(OFST+7,sp)
 524  000c 1a01          	or	a,(OFST+0,sp)
 525  000e 1e02          	ldw	x,(OFST+1,sp)
 526  0010 f7            	ld	(x),a
 527                     ; 197   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
 529  0011 7b0c          	ld	a,(OFST+11,sp)
 530  0013 1a0d          	or	a,(OFST+12,sp)
 531  0015 e701          	ld	(1,x),a
 532                     ; 199   if (SPI_Mode == SPI_Mode_Master)
 534  0017 7b09          	ld	a,(OFST+8,sp)
 535  0019 a104          	cp	a,#4
 536  001b 2606          	jrne	L362
 537                     ; 201     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
 539  001d e601          	ld	a,(1,x)
 540  001f aa01          	or	a,#1
 542  0021 2004          	jra	L562
 543  0023               L362:
 544                     ; 205     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 546  0023 e601          	ld	a,(1,x)
 547  0025 a4fe          	and	a,#254
 548  0027               L562:
 549  0027 e701          	ld	(1,x),a
 550                     ; 209   SPIx->CR1 |= (uint8_t)(SPI_Mode);
 552  0029 f6            	ld	a,(x)
 553  002a 1a09          	or	a,(OFST+8,sp)
 554  002c f7            	ld	(x),a
 555                     ; 212   SPIx->CRCPR = (uint8_t)CRCPolynomial;
 557  002d 7b0e          	ld	a,(OFST+13,sp)
 558  002f e705          	ld	(5,x),a
 559                     ; 213 }
 562  0031 5b03          	addw	sp,#3
 563  0033 87            	retf	
 629                     ; 222 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 629                     ; 223 {
 630                     .text:	section	.text,new
 631  0000               f_SPI_Cmd:
 633  0000 89            	pushw	x
 634       00000000      OFST:	set	0
 637                     ; 225   assert_param(IS_FUNCTIONAL_STATE(NewState));
 639                     ; 227   if (NewState != DISABLE)
 641  0001 7b06          	ld	a,(OFST+6,sp)
 642  0003 2705          	jreq	L323
 643                     ; 229     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 645  0005 f6            	ld	a,(x)
 646  0006 aa40          	or	a,#64
 648  0008 2005          	jra	L523
 649  000a               L323:
 650                     ; 233     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 652  000a 1e01          	ldw	x,(OFST+1,sp)
 653  000c f6            	ld	a,(x)
 654  000d a4bf          	and	a,#191
 655  000f               L523:
 656  000f f7            	ld	(x),a
 657                     ; 235 }
 660  0010 85            	popw	x
 661  0011 87            	retf	
 708                     ; 244 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 708                     ; 245 {
 709                     .text:	section	.text,new
 710  0000               f_SPI_NSSInternalSoftwareCmd:
 712  0000 89            	pushw	x
 713       00000000      OFST:	set	0
 716                     ; 247   assert_param(IS_FUNCTIONAL_STATE(NewState));
 718                     ; 249   if (NewState != DISABLE)
 720  0001 7b06          	ld	a,(OFST+6,sp)
 721  0003 2706          	jreq	L353
 722                     ; 251     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 724  0005 e601          	ld	a,(1,x)
 725  0007 aa01          	or	a,#1
 727  0009 2006          	jra	L553
 728  000b               L353:
 729                     ; 255     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 731  000b 1e01          	ldw	x,(OFST+1,sp)
 732  000d e601          	ld	a,(1,x)
 733  000f a4fe          	and	a,#254
 734  0011               L553:
 735  0011 e701          	ld	(1,x),a
 736                     ; 257 }
 739  0013 85            	popw	x
 740  0014 87            	retf	
 807                     ; 268 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
 807                     ; 269 {
 808                     .text:	section	.text,new
 809  0000               f_SPI_BiDirectionalLineConfig:
 811  0000 89            	pushw	x
 812       00000000      OFST:	set	0
 815                     ; 271   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 817                     ; 273   if (SPI_Direction != SPI_Direction_Rx)
 819  0001 7b06          	ld	a,(OFST+6,sp)
 820  0003 2706          	jreq	L314
 821                     ; 275     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 823  0005 e601          	ld	a,(1,x)
 824  0007 aa40          	or	a,#64
 826  0009 2006          	jra	L514
 827  000b               L314:
 828                     ; 279     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 830  000b 1e01          	ldw	x,(OFST+1,sp)
 831  000d e601          	ld	a,(1,x)
 832  000f a4bf          	and	a,#191
 833  0011               L514:
 834  0011 e701          	ld	(1,x),a
 835                     ; 281 }
 838  0013 85            	popw	x
 839  0014 87            	retf	
 882                     ; 316 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 882                     ; 317 {
 883                     .text:	section	.text,new
 884  0000               f_SPI_SendData:
 886  0000 89            	pushw	x
 887       00000000      OFST:	set	0
 890                     ; 318   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 892  0001 7b06          	ld	a,(OFST+6,sp)
 893  0003 1e01          	ldw	x,(OFST+1,sp)
 894  0005 e704          	ld	(4,x),a
 895                     ; 319 }
 898  0007 85            	popw	x
 899  0008 87            	retf	
 935                     ; 326 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 935                     ; 327 {
 936                     .text:	section	.text,new
 937  0000               f_SPI_ReceiveData:
 941                     ; 328   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 943  0000 e604          	ld	a,(4,x)
 946  0002 87            	retf	
 982                     ; 411 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
 982                     ; 412 {
 983                     .text:	section	.text,new
 984  0000               f_SPI_TransmitCRC:
 988                     ; 413   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 990  0000 e601          	ld	a,(1,x)
 991  0002 aa10          	or	a,#16
 992  0004 e701          	ld	(1,x),a
 993                     ; 414 }
 996  0006 87            	retf	
1044                     ; 423 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1044                     ; 424 {
1045                     .text:	section	.text,new
1046  0000               f_SPI_CalculateCRCCmd:
1048  0000 89            	pushw	x
1049       00000000      OFST:	set	0
1052                     ; 426   assert_param(IS_FUNCTIONAL_STATE(NewState));
1054                     ; 429   SPI_Cmd(SPI1, DISABLE);
1056  0001 4b00          	push	#0
1057  0003 ae5200        	ldw	x,#20992
1058  0006 8d000000      	callf	f_SPI_Cmd
1060  000a 84            	pop	a
1061                     ; 431   if (NewState != DISABLE)
1063  000b 7b06          	ld	a,(OFST+6,sp)
1064  000d 2708          	jreq	L525
1065                     ; 433     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1067  000f 1e01          	ldw	x,(OFST+1,sp)
1068  0011 e601          	ld	a,(1,x)
1069  0013 aa20          	or	a,#32
1071  0015 2006          	jra	L725
1072  0017               L525:
1073                     ; 437     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1075  0017 1e01          	ldw	x,(OFST+1,sp)
1076  0019 e601          	ld	a,(1,x)
1077  001b a4df          	and	a,#223
1078  001d               L725:
1079  001d e701          	ld	(1,x),a
1080                     ; 439 }
1083  001f 85            	popw	x
1084  0020 87            	retf	
1157                     ; 450 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
1157                     ; 451 {
1158                     .text:	section	.text,new
1159  0000               f_SPI_GetCRC:
1161  0000 89            	pushw	x
1162  0001 88            	push	a
1163       00000001      OFST:	set	1
1166                     ; 452   uint8_t crcreg = 0;
1168                     ; 455   assert_param(IS_SPI_CRC(SPI_CRC));
1170                     ; 457   if (SPI_CRC != SPI_CRC_RX)
1172  0002 7b07          	ld	a,(OFST+6,sp)
1173  0004 2704          	jreq	L765
1174                     ; 459     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
1176  0006 e607          	ld	a,(7,x)
1178  0008 2004          	jra	L175
1179  000a               L765:
1180                     ; 463     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
1182  000a 1e02          	ldw	x,(OFST+1,sp)
1183  000c e606          	ld	a,(6,x)
1184  000e               L175:
1185                     ; 467   return crcreg;
1189  000e 5b03          	addw	sp,#3
1190  0010 87            	retf	
1228                     ; 475 void SPI_ResetCRC(SPI_TypeDef* SPIx)
1228                     ; 476 {
1229                     .text:	section	.text,new
1230  0000               f_SPI_ResetCRC:
1232  0000 89            	pushw	x
1233       00000000      OFST:	set	0
1236                     ; 479   SPI_CalculateCRCCmd(SPIx, ENABLE);
1238  0001 4b01          	push	#1
1239  0003 8d000000      	callf	f_SPI_CalculateCRCCmd
1241  0007 84            	pop	a
1242                     ; 482   SPI_Cmd(SPIx, ENABLE);
1244  0008 4b01          	push	#1
1245  000a 1e02          	ldw	x,(OFST+2,sp)
1246  000c 8d000000      	callf	f_SPI_Cmd
1248  0010 84            	pop	a
1249                     ; 483 }
1252  0011 85            	popw	x
1253  0012 87            	retf	
1290                     ; 490 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
1290                     ; 491 {
1291                     .text:	section	.text,new
1292  0000               f_SPI_GetCRCPolynomial:
1296                     ; 492   return SPIx->CRCPR; /* Return the CRC polynomial register */
1298  0000 e605          	ld	a,(5,x)
1301  0002 87            	retf	
1377                     ; 522 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
1377                     ; 523 {
1378                     .text:	section	.text,new
1379  0000               f_SPI_DMACmd:
1381  0000 89            	pushw	x
1382       00000000      OFST:	set	0
1385                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1387                     ; 526   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
1389                     ; 528   if (NewState != DISABLE)
1391  0001 7b07          	ld	a,(OFST+7,sp)
1392  0003 2706          	jreq	L376
1393                     ; 531     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
1395  0005 e602          	ld	a,(2,x)
1396  0007 1a06          	or	a,(OFST+6,sp)
1398  0009 2007          	jra	L576
1399  000b               L376:
1400                     ; 536     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
1402  000b 1e01          	ldw	x,(OFST+1,sp)
1403  000d 7b06          	ld	a,(OFST+6,sp)
1404  000f 43            	cpl	a
1405  0010 e402          	and	a,(2,x)
1406  0012               L576:
1407  0012 e702          	ld	(2,x),a
1408                     ; 538 }
1411  0014 85            	popw	x
1412  0015 87            	retf	
1530                     ; 623 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
1530                     ; 624 {
1531                     .text:	section	.text,new
1532  0000               f_SPI_ITConfig:
1534  0000 89            	pushw	x
1535  0001 88            	push	a
1536       00000001      OFST:	set	1
1539                     ; 625   uint8_t itpos = 0;
1541                     ; 627   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
1543                     ; 628   assert_param(IS_FUNCTIONAL_STATE(NewState));
1545                     ; 631   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
1547  0002 7b07          	ld	a,(OFST+6,sp)
1548  0004 a40f          	and	a,#15
1549  0006 5f            	clrw	x
1550  0007 97            	ld	xl,a
1551  0008 a601          	ld	a,#1
1552  000a 5d            	tnzw	x
1553  000b 2704          	jreq	L64
1554  000d               L05:
1555  000d 48            	sll	a
1556  000e 5a            	decw	x
1557  000f 26fc          	jrne	L05
1558  0011               L64:
1559  0011 6b01          	ld	(OFST+0,sp),a
1560                     ; 633   if (NewState != DISABLE)
1562  0013 0d08          	tnz	(OFST+7,sp)
1563  0015 2708          	jreq	L357
1564                     ; 635     SPIx->CR3 |= itpos; /* Enable interrupt*/
1566  0017 1e02          	ldw	x,(OFST+1,sp)
1567  0019 e602          	ld	a,(2,x)
1568  001b 1a01          	or	a,(OFST+0,sp)
1570  001d 2005          	jra	L557
1571  001f               L357:
1572                     ; 639     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
1574  001f 1e02          	ldw	x,(OFST+1,sp)
1575  0021 43            	cpl	a
1576  0022 e402          	and	a,(2,x)
1577  0024               L557:
1578  0024 e702          	ld	(2,x),a
1579                     ; 641 }
1582  0026 5b03          	addw	sp,#3
1583  0028 87            	retf	
1715                     ; 658 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1715                     ; 659 {
1716                     .text:	section	.text,new
1717  0000               f_SPI_GetFlagStatus:
1719  0000 89            	pushw	x
1720  0001 88            	push	a
1721       00000001      OFST:	set	1
1724                     ; 660   FlagStatus status = RESET;
1726                     ; 662   assert_param(IS_SPI_FLAG(SPI_FLAG));
1728                     ; 665   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1730  0002 e603          	ld	a,(3,x)
1731  0004 1507          	bcp	a,(OFST+6,sp)
1732  0006 2704          	jreq	L1401
1733                     ; 667     status = SET; /* SPI_FLAG is set */
1735  0008 a601          	ld	a,#1
1737  000a 2001          	jra	L3401
1738  000c               L1401:
1739                     ; 671     status = RESET; /* SPI_FLAG is reset*/
1741  000c 4f            	clr	a
1742  000d               L3401:
1743                     ; 675   return status;
1747  000d 5b03          	addw	sp,#3
1748  000f 87            	retf	
1794                     ; 693 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1794                     ; 694 {
1795                     .text:	section	.text,new
1796  0000               f_SPI_ClearFlag:
1798  0000 89            	pushw	x
1799       00000000      OFST:	set	0
1802                     ; 695   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
1804                     ; 697   SPIx->SR = (uint8_t)(~SPI_FLAG);
1806  0001 7b06          	ld	a,(OFST+6,sp)
1807  0003 43            	cpl	a
1808  0004 1e01          	ldw	x,(OFST+1,sp)
1809  0006 e703          	ld	(3,x),a
1810                     ; 698 }
1813  0008 85            	popw	x
1814  0009 87            	retf	
1901                     ; 714 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
1901                     ; 715 {
1902                     .text:	section	.text,new
1903  0000               f_SPI_GetITStatus:
1905  0000 89            	pushw	x
1906  0001 5203          	subw	sp,#3
1907       00000003      OFST:	set	3
1910                     ; 716   ITStatus pendingbitstatus = RESET;
1912                     ; 717   uint8_t itpos = 0;
1914                     ; 718   uint8_t itmask1 = 0;
1916                     ; 719   uint8_t itmask2 = 0;
1918                     ; 720   __IO uint8_t enablestatus = 0;
1920  0003 0f02          	clr	(OFST-1,sp)
1921                     ; 721   assert_param(IS_SPI_GET_IT(SPI_IT));
1923                     ; 723   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1925  0005 7b09          	ld	a,(OFST+6,sp)
1926  0007 a40f          	and	a,#15
1927  0009 5f            	clrw	x
1928  000a 97            	ld	xl,a
1929  000b a601          	ld	a,#1
1930  000d 5d            	tnzw	x
1931  000e 2704          	jreq	L06
1932  0010               L26:
1933  0010 48            	sll	a
1934  0011 5a            	decw	x
1935  0012 26fc          	jrne	L26
1936  0014               L06:
1937  0014 6b01          	ld	(OFST-2,sp),a
1938                     ; 726   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1940  0016 7b09          	ld	a,(OFST+6,sp)
1941  0018 4e            	swap	a
1942  0019 a40f          	and	a,#15
1943  001b 6b03          	ld	(OFST+0,sp),a
1944                     ; 728   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1946  001d 5f            	clrw	x
1947  001e 97            	ld	xl,a
1948  001f a601          	ld	a,#1
1949  0021 5d            	tnzw	x
1950  0022 2704          	jreq	L46
1951  0024               L66:
1952  0024 48            	sll	a
1953  0025 5a            	decw	x
1954  0026 26fc          	jrne	L66
1955  0028               L46:
1956  0028 6b03          	ld	(OFST+0,sp),a
1957                     ; 730   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
1959  002a 1e04          	ldw	x,(OFST+1,sp)
1960  002c e603          	ld	a,(3,x)
1961  002e 1403          	and	a,(OFST+0,sp)
1962  0030 6b02          	ld	(OFST-1,sp),a
1963                     ; 732   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
1965  0032 e602          	ld	a,(2,x)
1966  0034 1501          	bcp	a,(OFST-2,sp)
1967  0036 2708          	jreq	L3311
1969  0038 0d02          	tnz	(OFST-1,sp)
1970  003a 2704          	jreq	L3311
1971                     ; 735     pendingbitstatus = SET;
1973  003c a601          	ld	a,#1
1975  003e 2001          	jra	L5311
1976  0040               L3311:
1977                     ; 740     pendingbitstatus = RESET;
1979  0040 4f            	clr	a
1980  0041               L5311:
1981                     ; 743   return  pendingbitstatus;
1985  0041 5b05          	addw	sp,#5
1986  0043 87            	retf	
2040                     ; 761 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
2040                     ; 762 {
2041                     .text:	section	.text,new
2042  0000               f_SPI_ClearITPendingBit:
2044  0000 89            	pushw	x
2045  0001 88            	push	a
2046       00000001      OFST:	set	1
2049                     ; 763   uint8_t itpos = 0;
2051                     ; 764   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
2053                     ; 769   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2055  0002 7b07          	ld	a,(OFST+6,sp)
2056  0004 4e            	swap	a
2057  0005 a40f          	and	a,#15
2058  0007 5f            	clrw	x
2059  0008 97            	ld	xl,a
2060  0009 a601          	ld	a,#1
2061  000b 5d            	tnzw	x
2062  000c 2704          	jreq	L27
2063  000e               L47:
2064  000e 48            	sll	a
2065  000f 5a            	decw	x
2066  0010 26fc          	jrne	L47
2067  0012               L27:
2068  0012 6b01          	ld	(OFST+0,sp),a
2069                     ; 771   SPIx->SR = (uint8_t)(~itpos);
2071  0014 43            	cpl	a
2072  0015 1e02          	ldw	x,(OFST+1,sp)
2073  0017 e703          	ld	(3,x),a
2074                     ; 773 }
2077  0019 5b03          	addw	sp,#3
2078  001b 87            	retf	
2090                     	xdef	f_SPI_ClearITPendingBit
2091                     	xdef	f_SPI_GetITStatus
2092                     	xdef	f_SPI_ClearFlag
2093                     	xdef	f_SPI_GetFlagStatus
2094                     	xdef	f_SPI_ITConfig
2095                     	xdef	f_SPI_DMACmd
2096                     	xdef	f_SPI_GetCRCPolynomial
2097                     	xdef	f_SPI_ResetCRC
2098                     	xdef	f_SPI_GetCRC
2099                     	xdef	f_SPI_CalculateCRCCmd
2100                     	xdef	f_SPI_TransmitCRC
2101                     	xdef	f_SPI_ReceiveData
2102                     	xdef	f_SPI_SendData
2103                     	xdef	f_SPI_BiDirectionalLineConfig
2104                     	xdef	f_SPI_NSSInternalSoftwareCmd
2105                     	xdef	f_SPI_Cmd
2106                     	xdef	f_SPI_Init
2107                     	xdef	f_SPI_DeInit
2126                     	end
