   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
 140                     ; 125 void SPI_DeInit(SPI_TypeDef* SPIx)
 140                     ; 126 {
 142                     .text:	section	.text,new
 143  0000               _SPI_DeInit:
 147                     ; 127   SPIx->CR1    = SPI_CR1_RESET_VALUE;
 149  0000 7f            	clr	(x)
 150                     ; 128   SPIx->CR2    = SPI_CR2_RESET_VALUE;
 152  0001 6f01          	clr	(1,x)
 153                     ; 129   SPIx->CR3    = SPI_CR3_RESET_VALUE;
 155  0003 6f02          	clr	(2,x)
 156                     ; 130   SPIx->SR     = SPI_SR_RESET_VALUE;
 158  0005 a602          	ld	a,#2
 159  0007 e703          	ld	(3,x),a
 160                     ; 131   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
 162  0009 a607          	ld	a,#7
 163  000b e705          	ld	(5,x),a
 164                     ; 132 }
 167  000d 81            	ret
 491                     ; 174 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
 491                     ; 175               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 491                     ; 176               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
 491                     ; 177               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
 491                     ; 178               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
 491                     ; 179 {
 492                     .text:	section	.text,new
 493  0000               _SPI_Init:
 495  0000 89            	pushw	x
 496  0001 88            	push	a
 497       00000001      OFST:	set	1
 500                     ; 181   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
 502                     ; 182   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 504                     ; 183   assert_param(IS_SPI_MODE(SPI_Mode));
 506                     ; 184   assert_param(IS_SPI_POLARITY(SPI_CPOL));
 508                     ; 185   assert_param(IS_SPI_PHASE(SPI_CPHA));
 510                     ; 186   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
 512                     ; 187   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
 514                     ; 188   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
 516                     ; 191   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
 516                     ; 192                                   (uint8_t)SPI_BaudRatePrescaler) |
 516                     ; 193                         (uint8_t)((uint8_t)SPI_CPOL |
 516                     ; 194                                   SPI_CPHA));
 518  0002 7b09          	ld	a,(OFST+8,sp)
 519  0004 1a0a          	or	a,(OFST+9,sp)
 520  0006 6b01          	ld	(OFST+0,sp),a
 521  0008 7b06          	ld	a,(OFST+5,sp)
 522  000a 1a07          	or	a,(OFST+6,sp)
 523  000c 1a01          	or	a,(OFST+0,sp)
 524  000e 1e02          	ldw	x,(OFST+1,sp)
 525  0010 f7            	ld	(x),a
 526                     ; 197   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
 528  0011 7b0b          	ld	a,(OFST+10,sp)
 529  0013 1a0c          	or	a,(OFST+11,sp)
 530  0015 1e02          	ldw	x,(OFST+1,sp)
 531  0017 e701          	ld	(1,x),a
 532                     ; 199   if (SPI_Mode == SPI_Mode_Master)
 534  0019 7b08          	ld	a,(OFST+7,sp)
 535  001b a104          	cp	a,#4
 536  001d 260a          	jrne	L362
 537                     ; 201     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
 539  001f 1e02          	ldw	x,(OFST+1,sp)
 540  0021 e601          	ld	a,(1,x)
 541  0023 aa01          	or	a,#1
 542  0025 e701          	ld	(1,x),a
 544  0027 2008          	jra	L562
 545  0029               L362:
 546                     ; 205     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 548  0029 1e02          	ldw	x,(OFST+1,sp)
 549  002b e601          	ld	a,(1,x)
 550  002d a4fe          	and	a,#254
 551  002f e701          	ld	(1,x),a
 552  0031               L562:
 553                     ; 209   SPIx->CR1 |= (uint8_t)(SPI_Mode);
 555  0031 1e02          	ldw	x,(OFST+1,sp)
 556  0033 f6            	ld	a,(x)
 557  0034 1a08          	or	a,(OFST+7,sp)
 558  0036 f7            	ld	(x),a
 559                     ; 212   SPIx->CRCPR = (uint8_t)CRCPolynomial;
 561  0037 7b0d          	ld	a,(OFST+12,sp)
 562  0039 1e02          	ldw	x,(OFST+1,sp)
 563  003b e705          	ld	(5,x),a
 564                     ; 213 }
 567  003d 5b03          	addw	sp,#3
 568  003f 81            	ret
 635                     ; 222 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 635                     ; 223 {
 636                     .text:	section	.text,new
 637  0000               _SPI_Cmd:
 639  0000 89            	pushw	x
 640       00000000      OFST:	set	0
 643                     ; 225   assert_param(IS_FUNCTIONAL_STATE(NewState));
 645                     ; 227   if (NewState != DISABLE)
 647  0001 0d05          	tnz	(OFST+5,sp)
 648  0003 2706          	jreq	L323
 649                     ; 229     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 651  0005 f6            	ld	a,(x)
 652  0006 aa40          	or	a,#64
 653  0008 f7            	ld	(x),a
 655  0009 2006          	jra	L523
 656  000b               L323:
 657                     ; 233     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 659  000b 1e01          	ldw	x,(OFST+1,sp)
 660  000d f6            	ld	a,(x)
 661  000e a4bf          	and	a,#191
 662  0010 f7            	ld	(x),a
 663  0011               L523:
 664                     ; 235 }
 667  0011 85            	popw	x
 668  0012 81            	ret
 716                     ; 244 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 716                     ; 245 {
 717                     .text:	section	.text,new
 718  0000               _SPI_NSSInternalSoftwareCmd:
 720  0000 89            	pushw	x
 721       00000000      OFST:	set	0
 724                     ; 247   assert_param(IS_FUNCTIONAL_STATE(NewState));
 726                     ; 249   if (NewState != DISABLE)
 728  0001 0d05          	tnz	(OFST+5,sp)
 729  0003 2708          	jreq	L353
 730                     ; 251     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 732  0005 e601          	ld	a,(1,x)
 733  0007 aa01          	or	a,#1
 734  0009 e701          	ld	(1,x),a
 736  000b 2008          	jra	L553
 737  000d               L353:
 738                     ; 255     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 740  000d 1e01          	ldw	x,(OFST+1,sp)
 741  000f e601          	ld	a,(1,x)
 742  0011 a4fe          	and	a,#254
 743  0013 e701          	ld	(1,x),a
 744  0015               L553:
 745                     ; 257 }
 748  0015 85            	popw	x
 749  0016 81            	ret
 817                     ; 268 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
 817                     ; 269 {
 818                     .text:	section	.text,new
 819  0000               _SPI_BiDirectionalLineConfig:
 821  0000 89            	pushw	x
 822       00000000      OFST:	set	0
 825                     ; 271   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 827                     ; 273   if (SPI_Direction != SPI_Direction_Rx)
 829  0001 0d05          	tnz	(OFST+5,sp)
 830  0003 2708          	jreq	L314
 831                     ; 275     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 833  0005 e601          	ld	a,(1,x)
 834  0007 aa40          	or	a,#64
 835  0009 e701          	ld	(1,x),a
 837  000b 2008          	jra	L514
 838  000d               L314:
 839                     ; 279     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 841  000d 1e01          	ldw	x,(OFST+1,sp)
 842  000f e601          	ld	a,(1,x)
 843  0011 a4bf          	and	a,#191
 844  0013 e701          	ld	(1,x),a
 845  0015               L514:
 846                     ; 281 }
 849  0015 85            	popw	x
 850  0016 81            	ret
 894                     ; 316 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 894                     ; 317 {
 895                     .text:	section	.text,new
 896  0000               _SPI_SendData:
 898  0000 89            	pushw	x
 899       00000000      OFST:	set	0
 902                     ; 318   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 904  0001 7b05          	ld	a,(OFST+5,sp)
 905  0003 1e01          	ldw	x,(OFST+1,sp)
 906  0005 e704          	ld	(4,x),a
 907                     ; 319 }
 910  0007 85            	popw	x
 911  0008 81            	ret
 948                     ; 326 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 948                     ; 327 {
 949                     .text:	section	.text,new
 950  0000               _SPI_ReceiveData:
 954                     ; 328   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 956  0000 e604          	ld	a,(4,x)
 959  0002 81            	ret
 996                     ; 411 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
 996                     ; 412 {
 997                     .text:	section	.text,new
 998  0000               _SPI_TransmitCRC:
1002                     ; 413   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
1004  0000 e601          	ld	a,(1,x)
1005  0002 aa10          	or	a,#16
1006  0004 e701          	ld	(1,x),a
1007                     ; 414 }
1010  0006 81            	ret
1059                     ; 423 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1059                     ; 424 {
1060                     .text:	section	.text,new
1061  0000               _SPI_CalculateCRCCmd:
1063  0000 89            	pushw	x
1064       00000000      OFST:	set	0
1067                     ; 426   assert_param(IS_FUNCTIONAL_STATE(NewState));
1069                     ; 429   SPI_Cmd(SPI1, DISABLE);
1071  0001 4b00          	push	#0
1072  0003 ae5200        	ldw	x,#20992
1073  0006 cd0000        	call	_SPI_Cmd
1075  0009 84            	pop	a
1076                     ; 431   if (NewState != DISABLE)
1078  000a 0d05          	tnz	(OFST+5,sp)
1079  000c 270a          	jreq	L525
1080                     ; 433     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1082  000e 1e01          	ldw	x,(OFST+1,sp)
1083  0010 e601          	ld	a,(1,x)
1084  0012 aa20          	or	a,#32
1085  0014 e701          	ld	(1,x),a
1087  0016 2008          	jra	L725
1088  0018               L525:
1089                     ; 437     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1091  0018 1e01          	ldw	x,(OFST+1,sp)
1092  001a e601          	ld	a,(1,x)
1093  001c a4df          	and	a,#223
1094  001e e701          	ld	(1,x),a
1095  0020               L725:
1096                     ; 439 }
1099  0020 85            	popw	x
1100  0021 81            	ret
1174                     ; 450 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
1174                     ; 451 {
1175                     .text:	section	.text,new
1176  0000               _SPI_GetCRC:
1178  0000 89            	pushw	x
1179  0001 88            	push	a
1180       00000001      OFST:	set	1
1183                     ; 452   uint8_t crcreg = 0;
1185                     ; 455   assert_param(IS_SPI_CRC(SPI_CRC));
1187                     ; 457   if (SPI_CRC != SPI_CRC_RX)
1189  0002 0d06          	tnz	(OFST+5,sp)
1190  0004 2706          	jreq	L765
1191                     ; 459     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
1193  0006 e607          	ld	a,(7,x)
1194  0008 6b01          	ld	(OFST+0,sp),a
1196  000a 2006          	jra	L175
1197  000c               L765:
1198                     ; 463     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
1200  000c 1e02          	ldw	x,(OFST+1,sp)
1201  000e e606          	ld	a,(6,x)
1202  0010 6b01          	ld	(OFST+0,sp),a
1203  0012               L175:
1204                     ; 467   return crcreg;
1206  0012 7b01          	ld	a,(OFST+0,sp)
1209  0014 5b03          	addw	sp,#3
1210  0016 81            	ret
1249                     ; 475 void SPI_ResetCRC(SPI_TypeDef* SPIx)
1249                     ; 476 {
1250                     .text:	section	.text,new
1251  0000               _SPI_ResetCRC:
1253  0000 89            	pushw	x
1254       00000000      OFST:	set	0
1257                     ; 479   SPI_CalculateCRCCmd(SPIx, ENABLE);
1259  0001 4b01          	push	#1
1260  0003 cd0000        	call	_SPI_CalculateCRCCmd
1262  0006 84            	pop	a
1263                     ; 482   SPI_Cmd(SPIx, ENABLE);
1265  0007 4b01          	push	#1
1266  0009 1e02          	ldw	x,(OFST+2,sp)
1267  000b cd0000        	call	_SPI_Cmd
1269  000e 84            	pop	a
1270                     ; 483 }
1273  000f 85            	popw	x
1274  0010 81            	ret
1312                     ; 490 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
1312                     ; 491 {
1313                     .text:	section	.text,new
1314  0000               _SPI_GetCRCPolynomial:
1318                     ; 492   return SPIx->CRCPR; /* Return the CRC polynomial register */
1320  0000 e605          	ld	a,(5,x)
1323  0002 81            	ret
1400                     ; 522 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
1400                     ; 523 {
1401                     .text:	section	.text,new
1402  0000               _SPI_DMACmd:
1404  0000 89            	pushw	x
1405       00000000      OFST:	set	0
1408                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1410                     ; 526   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
1412                     ; 528   if (NewState != DISABLE)
1414  0001 0d06          	tnz	(OFST+6,sp)
1415  0003 2708          	jreq	L376
1416                     ; 531     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
1418  0005 e602          	ld	a,(2,x)
1419  0007 1a05          	or	a,(OFST+5,sp)
1420  0009 e702          	ld	(2,x),a
1422  000b 2009          	jra	L576
1423  000d               L376:
1424                     ; 536     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
1426  000d 1e01          	ldw	x,(OFST+1,sp)
1427  000f 7b05          	ld	a,(OFST+5,sp)
1428  0011 43            	cpl	a
1429  0012 e402          	and	a,(2,x)
1430  0014 e702          	ld	(2,x),a
1431  0016               L576:
1432                     ; 538 }
1435  0016 85            	popw	x
1436  0017 81            	ret
1555                     ; 623 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
1555                     ; 624 {
1556                     .text:	section	.text,new
1557  0000               _SPI_ITConfig:
1559  0000 89            	pushw	x
1560  0001 88            	push	a
1561       00000001      OFST:	set	1
1564                     ; 625   uint8_t itpos = 0;
1566                     ; 627   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
1568                     ; 628   assert_param(IS_FUNCTIONAL_STATE(NewState));
1570                     ; 631   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
1572  0002 7b06          	ld	a,(OFST+5,sp)
1573  0004 a40f          	and	a,#15
1574  0006 5f            	clrw	x
1575  0007 97            	ld	xl,a
1576  0008 a601          	ld	a,#1
1577  000a 5d            	tnzw	x
1578  000b 2704          	jreq	L04
1579  000d               L24:
1580  000d 48            	sll	a
1581  000e 5a            	decw	x
1582  000f 26fc          	jrne	L24
1583  0011               L04:
1584  0011 6b01          	ld	(OFST+0,sp),a
1585                     ; 633   if (NewState != DISABLE)
1587  0013 0d07          	tnz	(OFST+6,sp)
1588  0015 270a          	jreq	L357
1589                     ; 635     SPIx->CR3 |= itpos; /* Enable interrupt*/
1591  0017 1e02          	ldw	x,(OFST+1,sp)
1592  0019 e602          	ld	a,(2,x)
1593  001b 1a01          	or	a,(OFST+0,sp)
1594  001d e702          	ld	(2,x),a
1596  001f 2009          	jra	L557
1597  0021               L357:
1598                     ; 639     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
1600  0021 1e02          	ldw	x,(OFST+1,sp)
1601  0023 7b01          	ld	a,(OFST+0,sp)
1602  0025 43            	cpl	a
1603  0026 e402          	and	a,(2,x)
1604  0028 e702          	ld	(2,x),a
1605  002a               L557:
1606                     ; 641 }
1609  002a 5b03          	addw	sp,#3
1610  002c 81            	ret
1743                     ; 658 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1743                     ; 659 {
1744                     .text:	section	.text,new
1745  0000               _SPI_GetFlagStatus:
1747  0000 89            	pushw	x
1748  0001 88            	push	a
1749       00000001      OFST:	set	1
1752                     ; 660   FlagStatus status = RESET;
1754                     ; 662   assert_param(IS_SPI_FLAG(SPI_FLAG));
1756                     ; 665   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1758  0002 e603          	ld	a,(3,x)
1759  0004 1506          	bcp	a,(OFST+5,sp)
1760  0006 2706          	jreq	L1401
1761                     ; 667     status = SET; /* SPI_FLAG is set */
1763  0008 a601          	ld	a,#1
1764  000a 6b01          	ld	(OFST+0,sp),a
1766  000c 2002          	jra	L3401
1767  000e               L1401:
1768                     ; 671     status = RESET; /* SPI_FLAG is reset*/
1770  000e 0f01          	clr	(OFST+0,sp)
1771  0010               L3401:
1772                     ; 675   return status;
1774  0010 7b01          	ld	a,(OFST+0,sp)
1777  0012 5b03          	addw	sp,#3
1778  0014 81            	ret
1825                     ; 693 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1825                     ; 694 {
1826                     .text:	section	.text,new
1827  0000               _SPI_ClearFlag:
1829  0000 89            	pushw	x
1830       00000000      OFST:	set	0
1833                     ; 695   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
1835                     ; 697   SPIx->SR = (uint8_t)(~SPI_FLAG);
1837  0001 7b05          	ld	a,(OFST+5,sp)
1838  0003 43            	cpl	a
1839  0004 1e01          	ldw	x,(OFST+1,sp)
1840  0006 e703          	ld	(3,x),a
1841                     ; 698 }
1844  0008 85            	popw	x
1845  0009 81            	ret
1933                     ; 714 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
1933                     ; 715 {
1934                     .text:	section	.text,new
1935  0000               _SPI_GetITStatus:
1937  0000 89            	pushw	x
1938  0001 5203          	subw	sp,#3
1939       00000003      OFST:	set	3
1942                     ; 716   ITStatus pendingbitstatus = RESET;
1944                     ; 717   uint8_t itpos = 0;
1946                     ; 718   uint8_t itmask1 = 0;
1948                     ; 719   uint8_t itmask2 = 0;
1950                     ; 720   __IO uint8_t enablestatus = 0;
1952  0003 0f02          	clr	(OFST-1,sp)
1953                     ; 721   assert_param(IS_SPI_GET_IT(SPI_IT));
1955                     ; 723   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1957  0005 7b08          	ld	a,(OFST+5,sp)
1958  0007 a40f          	and	a,#15
1959  0009 5f            	clrw	x
1960  000a 97            	ld	xl,a
1961  000b a601          	ld	a,#1
1962  000d 5d            	tnzw	x
1963  000e 2704          	jreq	L25
1964  0010               L45:
1965  0010 48            	sll	a
1966  0011 5a            	decw	x
1967  0012 26fc          	jrne	L45
1968  0014               L25:
1969  0014 6b01          	ld	(OFST-2,sp),a
1970                     ; 726   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1972  0016 7b08          	ld	a,(OFST+5,sp)
1973  0018 4e            	swap	a
1974  0019 a40f          	and	a,#15
1975  001b 6b03          	ld	(OFST+0,sp),a
1976                     ; 728   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1978  001d 7b03          	ld	a,(OFST+0,sp)
1979  001f 5f            	clrw	x
1980  0020 97            	ld	xl,a
1981  0021 a601          	ld	a,#1
1982  0023 5d            	tnzw	x
1983  0024 2704          	jreq	L65
1984  0026               L06:
1985  0026 48            	sll	a
1986  0027 5a            	decw	x
1987  0028 26fc          	jrne	L06
1988  002a               L65:
1989  002a 6b03          	ld	(OFST+0,sp),a
1990                     ; 730   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
1992  002c 1e04          	ldw	x,(OFST+1,sp)
1993  002e e603          	ld	a,(3,x)
1994  0030 1403          	and	a,(OFST+0,sp)
1995  0032 6b02          	ld	(OFST-1,sp),a
1996                     ; 732   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
1998  0034 1e04          	ldw	x,(OFST+1,sp)
1999  0036 e602          	ld	a,(2,x)
2000  0038 1501          	bcp	a,(OFST-2,sp)
2001  003a 270a          	jreq	L3311
2003  003c 0d02          	tnz	(OFST-1,sp)
2004  003e 2706          	jreq	L3311
2005                     ; 735     pendingbitstatus = SET;
2007  0040 a601          	ld	a,#1
2008  0042 6b03          	ld	(OFST+0,sp),a
2010  0044 2002          	jra	L5311
2011  0046               L3311:
2012                     ; 740     pendingbitstatus = RESET;
2014  0046 0f03          	clr	(OFST+0,sp)
2015  0048               L5311:
2016                     ; 743   return  pendingbitstatus;
2018  0048 7b03          	ld	a,(OFST+0,sp)
2021  004a 5b05          	addw	sp,#5
2022  004c 81            	ret
2077                     ; 761 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
2077                     ; 762 {
2078                     .text:	section	.text,new
2079  0000               _SPI_ClearITPendingBit:
2081  0000 89            	pushw	x
2082  0001 88            	push	a
2083       00000001      OFST:	set	1
2086                     ; 763   uint8_t itpos = 0;
2088                     ; 764   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
2090                     ; 769   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2092  0002 7b06          	ld	a,(OFST+5,sp)
2093  0004 a4f0          	and	a,#240
2094  0006 4e            	swap	a
2095  0007 a40f          	and	a,#15
2096  0009 5f            	clrw	x
2097  000a 97            	ld	xl,a
2098  000b a601          	ld	a,#1
2099  000d 5d            	tnzw	x
2100  000e 2704          	jreq	L46
2101  0010               L66:
2102  0010 48            	sll	a
2103  0011 5a            	decw	x
2104  0012 26fc          	jrne	L66
2105  0014               L46:
2106  0014 6b01          	ld	(OFST+0,sp),a
2107                     ; 771   SPIx->SR = (uint8_t)(~itpos);
2109  0016 7b01          	ld	a,(OFST+0,sp)
2110  0018 43            	cpl	a
2111  0019 1e02          	ldw	x,(OFST+1,sp)
2112  001b e703          	ld	(3,x),a
2113                     ; 773 }
2116  001d 5b03          	addw	sp,#3
2117  001f 81            	ret
2130                     	xdef	_SPI_ClearITPendingBit
2131                     	xdef	_SPI_GetITStatus
2132                     	xdef	_SPI_ClearFlag
2133                     	xdef	_SPI_GetFlagStatus
2134                     	xdef	_SPI_ITConfig
2135                     	xdef	_SPI_DMACmd
2136                     	xdef	_SPI_GetCRCPolynomial
2137                     	xdef	_SPI_ResetCRC
2138                     	xdef	_SPI_GetCRC
2139                     	xdef	_SPI_CalculateCRCCmd
2140                     	xdef	_SPI_TransmitCRC
2141                     	xdef	_SPI_ReceiveData
2142                     	xdef	_SPI_SendData
2143                     	xdef	_SPI_BiDirectionalLineConfig
2144                     	xdef	_SPI_NSSInternalSoftwareCmd
2145                     	xdef	_SPI_Cmd
2146                     	xdef	_SPI_Init
2147                     	xdef	_SPI_DeInit
2166                     	end
