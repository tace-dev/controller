   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 142                     ; 125 void SPI_DeInit(SPI_TypeDef* SPIx)
 142                     ; 126 {
 144                     	switch	.text
 145  0000               _SPI_DeInit:
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
 169  000d 81            	ret	
 493                     ; 174 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
 493                     ; 175               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 493                     ; 176               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
 493                     ; 177               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
 493                     ; 178               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
 493                     ; 179 {
 494                     	switch	.text
 495  000e               _SPI_Init:
 497  000e 89            	pushw	x
 498  000f 88            	push	a
 499       00000001      OFST:	set	1
 502                     ; 181   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
 504                     ; 182   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 506                     ; 183   assert_param(IS_SPI_MODE(SPI_Mode));
 508                     ; 184   assert_param(IS_SPI_POLARITY(SPI_CPOL));
 510                     ; 185   assert_param(IS_SPI_PHASE(SPI_CPHA));
 512                     ; 186   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
 514                     ; 187   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
 516                     ; 188   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
 518                     ; 191   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
 518                     ; 192                                   (uint8_t)SPI_BaudRatePrescaler) |
 518                     ; 193                         (uint8_t)((uint8_t)SPI_CPOL |
 518                     ; 194                                   SPI_CPHA));
 520  0010 7b09          	ld	a,(OFST+8,sp)
 521  0012 1a0a          	or	a,(OFST+9,sp)
 522  0014 6b01          	ld	(OFST+0,sp),a
 523  0016 7b06          	ld	a,(OFST+5,sp)
 524  0018 1a07          	or	a,(OFST+6,sp)
 525  001a 1a01          	or	a,(OFST+0,sp)
 526  001c 1e02          	ldw	x,(OFST+1,sp)
 527  001e f7            	ld	(x),a
 528                     ; 197   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
 530  001f 7b0b          	ld	a,(OFST+10,sp)
 531  0021 1a0c          	or	a,(OFST+11,sp)
 532  0023 e701          	ld	(1,x),a
 533                     ; 199   if (SPI_Mode == SPI_Mode_Master)
 535  0025 7b08          	ld	a,(OFST+7,sp)
 536  0027 a104          	cp	a,#4
 537  0029 2606          	jrne	L362
 538                     ; 201     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
 540  002b e601          	ld	a,(1,x)
 541  002d aa01          	or	a,#1
 543  002f 2004          	jra	L562
 544  0031               L362:
 545                     ; 205     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 547  0031 e601          	ld	a,(1,x)
 548  0033 a4fe          	and	a,#254
 549  0035               L562:
 550  0035 e701          	ld	(1,x),a
 551                     ; 209   SPIx->CR1 |= (uint8_t)(SPI_Mode);
 553  0037 f6            	ld	a,(x)
 554  0038 1a08          	or	a,(OFST+7,sp)
 555  003a f7            	ld	(x),a
 556                     ; 212   SPIx->CRCPR = (uint8_t)CRCPolynomial;
 558  003b 7b0d          	ld	a,(OFST+12,sp)
 559  003d e705          	ld	(5,x),a
 560                     ; 213 }
 563  003f 5b03          	addw	sp,#3
 564  0041 81            	ret	
 631                     ; 222 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 631                     ; 223 {
 632                     	switch	.text
 633  0042               _SPI_Cmd:
 635  0042 89            	pushw	x
 636       00000000      OFST:	set	0
 639                     ; 225   assert_param(IS_FUNCTIONAL_STATE(NewState));
 641                     ; 227   if (NewState != DISABLE)
 643  0043 7b05          	ld	a,(OFST+5,sp)
 644  0045 2705          	jreq	L323
 645                     ; 229     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 647  0047 f6            	ld	a,(x)
 648  0048 aa40          	or	a,#64
 650  004a 2005          	jra	L523
 651  004c               L323:
 652                     ; 233     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 654  004c 1e01          	ldw	x,(OFST+1,sp)
 655  004e f6            	ld	a,(x)
 656  004f a4bf          	and	a,#191
 657  0051               L523:
 658  0051 f7            	ld	(x),a
 659                     ; 235 }
 662  0052 85            	popw	x
 663  0053 81            	ret	
 711                     ; 244 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 711                     ; 245 {
 712                     	switch	.text
 713  0054               _SPI_NSSInternalSoftwareCmd:
 715  0054 89            	pushw	x
 716       00000000      OFST:	set	0
 719                     ; 247   assert_param(IS_FUNCTIONAL_STATE(NewState));
 721                     ; 249   if (NewState != DISABLE)
 723  0055 7b05          	ld	a,(OFST+5,sp)
 724  0057 2706          	jreq	L353
 725                     ; 251     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 727  0059 e601          	ld	a,(1,x)
 728  005b aa01          	or	a,#1
 730  005d 2006          	jra	L553
 731  005f               L353:
 732                     ; 255     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 734  005f 1e01          	ldw	x,(OFST+1,sp)
 735  0061 e601          	ld	a,(1,x)
 736  0063 a4fe          	and	a,#254
 737  0065               L553:
 738  0065 e701          	ld	(1,x),a
 739                     ; 257 }
 742  0067 85            	popw	x
 743  0068 81            	ret	
 811                     ; 268 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
 811                     ; 269 {
 812                     	switch	.text
 813  0069               _SPI_BiDirectionalLineConfig:
 815  0069 89            	pushw	x
 816       00000000      OFST:	set	0
 819                     ; 271   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 821                     ; 273   if (SPI_Direction != SPI_Direction_Rx)
 823  006a 7b05          	ld	a,(OFST+5,sp)
 824  006c 2706          	jreq	L314
 825                     ; 275     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 827  006e e601          	ld	a,(1,x)
 828  0070 aa40          	or	a,#64
 830  0072 2006          	jra	L514
 831  0074               L314:
 832                     ; 279     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 834  0074 1e01          	ldw	x,(OFST+1,sp)
 835  0076 e601          	ld	a,(1,x)
 836  0078 a4bf          	and	a,#191
 837  007a               L514:
 838  007a e701          	ld	(1,x),a
 839                     ; 281 }
 842  007c 85            	popw	x
 843  007d 81            	ret	
 887                     ; 316 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 887                     ; 317 {
 888                     	switch	.text
 889  007e               _SPI_SendData:
 891  007e 89            	pushw	x
 892       00000000      OFST:	set	0
 895                     ; 318   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 897  007f 7b05          	ld	a,(OFST+5,sp)
 898  0081 1e01          	ldw	x,(OFST+1,sp)
 899  0083 e704          	ld	(4,x),a
 900                     ; 319 }
 903  0085 85            	popw	x
 904  0086 81            	ret	
 941                     ; 326 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 941                     ; 327 {
 942                     	switch	.text
 943  0087               _SPI_ReceiveData:
 947                     ; 328   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 949  0087 e604          	ld	a,(4,x)
 952  0089 81            	ret	
 989                     ; 411 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
 989                     ; 412 {
 990                     	switch	.text
 991  008a               _SPI_TransmitCRC:
 995                     ; 413   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 997  008a e601          	ld	a,(1,x)
 998  008c aa10          	or	a,#16
 999  008e e701          	ld	(1,x),a
1000                     ; 414 }
1003  0090 81            	ret	
1052                     ; 423 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1052                     ; 424 {
1053                     	switch	.text
1054  0091               _SPI_CalculateCRCCmd:
1056  0091 89            	pushw	x
1057       00000000      OFST:	set	0
1060                     ; 426   assert_param(IS_FUNCTIONAL_STATE(NewState));
1062                     ; 429   SPI_Cmd(SPI1, DISABLE);
1064  0092 4b00          	push	#0
1065  0094 ae5200        	ldw	x,#20992
1066  0097 ada9          	call	_SPI_Cmd
1068  0099 84            	pop	a
1069                     ; 431   if (NewState != DISABLE)
1071  009a 7b05          	ld	a,(OFST+5,sp)
1072  009c 2708          	jreq	L525
1073                     ; 433     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1075  009e 1e01          	ldw	x,(OFST+1,sp)
1076  00a0 e601          	ld	a,(1,x)
1077  00a2 aa20          	or	a,#32
1079  00a4 2006          	jra	L725
1080  00a6               L525:
1081                     ; 437     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1083  00a6 1e01          	ldw	x,(OFST+1,sp)
1084  00a8 e601          	ld	a,(1,x)
1085  00aa a4df          	and	a,#223
1086  00ac               L725:
1087  00ac e701          	ld	(1,x),a
1088                     ; 439 }
1091  00ae 85            	popw	x
1092  00af 81            	ret	
1166                     ; 450 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
1166                     ; 451 {
1167                     	switch	.text
1168  00b0               _SPI_GetCRC:
1170  00b0 89            	pushw	x
1171  00b1 88            	push	a
1172       00000001      OFST:	set	1
1175                     ; 452   uint8_t crcreg = 0;
1177                     ; 455   assert_param(IS_SPI_CRC(SPI_CRC));
1179                     ; 457   if (SPI_CRC != SPI_CRC_RX)
1181  00b2 7b06          	ld	a,(OFST+5,sp)
1182  00b4 2704          	jreq	L765
1183                     ; 459     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
1185  00b6 e607          	ld	a,(7,x)
1187  00b8 2004          	jra	L175
1188  00ba               L765:
1189                     ; 463     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
1191  00ba 1e02          	ldw	x,(OFST+1,sp)
1192  00bc e606          	ld	a,(6,x)
1193  00be               L175:
1194                     ; 467   return crcreg;
1198  00be 5b03          	addw	sp,#3
1199  00c0 81            	ret	
1238                     ; 475 void SPI_ResetCRC(SPI_TypeDef* SPIx)
1238                     ; 476 {
1239                     	switch	.text
1240  00c1               _SPI_ResetCRC:
1242  00c1 89            	pushw	x
1243       00000000      OFST:	set	0
1246                     ; 479   SPI_CalculateCRCCmd(SPIx, ENABLE);
1248  00c2 4b01          	push	#1
1249  00c4 adcb          	call	_SPI_CalculateCRCCmd
1251  00c6 84            	pop	a
1252                     ; 482   SPI_Cmd(SPIx, ENABLE);
1254  00c7 4b01          	push	#1
1255  00c9 1e02          	ldw	x,(OFST+2,sp)
1256  00cb cd0042        	call	_SPI_Cmd
1258  00ce 84            	pop	a
1259                     ; 483 }
1262  00cf 85            	popw	x
1263  00d0 81            	ret	
1301                     ; 490 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
1301                     ; 491 {
1302                     	switch	.text
1303  00d1               _SPI_GetCRCPolynomial:
1307                     ; 492   return SPIx->CRCPR; /* Return the CRC polynomial register */
1309  00d1 e605          	ld	a,(5,x)
1312  00d3 81            	ret	
1389                     ; 522 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
1389                     ; 523 {
1390                     	switch	.text
1391  00d4               _SPI_DMACmd:
1393  00d4 89            	pushw	x
1394       00000000      OFST:	set	0
1397                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1399                     ; 526   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
1401                     ; 528   if (NewState != DISABLE)
1403  00d5 7b06          	ld	a,(OFST+6,sp)
1404  00d7 2706          	jreq	L376
1405                     ; 531     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
1407  00d9 e602          	ld	a,(2,x)
1408  00db 1a05          	or	a,(OFST+5,sp)
1410  00dd 2007          	jra	L576
1411  00df               L376:
1412                     ; 536     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
1414  00df 1e01          	ldw	x,(OFST+1,sp)
1415  00e1 7b05          	ld	a,(OFST+5,sp)
1416  00e3 43            	cpl	a
1417  00e4 e402          	and	a,(2,x)
1418  00e6               L576:
1419  00e6 e702          	ld	(2,x),a
1420                     ; 538 }
1423  00e8 85            	popw	x
1424  00e9 81            	ret	
1543                     ; 623 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
1543                     ; 624 {
1544                     	switch	.text
1545  00ea               _SPI_ITConfig:
1547  00ea 89            	pushw	x
1548  00eb 88            	push	a
1549       00000001      OFST:	set	1
1552                     ; 625   uint8_t itpos = 0;
1554                     ; 627   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
1556                     ; 628   assert_param(IS_FUNCTIONAL_STATE(NewState));
1558                     ; 631   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
1560  00ec 7b06          	ld	a,(OFST+5,sp)
1561  00ee a40f          	and	a,#15
1562  00f0 5f            	clrw	x
1563  00f1 97            	ld	xl,a
1564  00f2 a601          	ld	a,#1
1565  00f4 5d            	tnzw	x
1566  00f5 2704          	jreq	L64
1567  00f7               L05:
1568  00f7 48            	sll	a
1569  00f8 5a            	decw	x
1570  00f9 26fc          	jrne	L05
1571  00fb               L64:
1572  00fb 6b01          	ld	(OFST+0,sp),a
1573                     ; 633   if (NewState != DISABLE)
1575  00fd 0d07          	tnz	(OFST+6,sp)
1576  00ff 2708          	jreq	L357
1577                     ; 635     SPIx->CR3 |= itpos; /* Enable interrupt*/
1579  0101 1e02          	ldw	x,(OFST+1,sp)
1580  0103 e602          	ld	a,(2,x)
1581  0105 1a01          	or	a,(OFST+0,sp)
1583  0107 2005          	jra	L557
1584  0109               L357:
1585                     ; 639     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
1587  0109 1e02          	ldw	x,(OFST+1,sp)
1588  010b 43            	cpl	a
1589  010c e402          	and	a,(2,x)
1590  010e               L557:
1591  010e e702          	ld	(2,x),a
1592                     ; 641 }
1595  0110 5b03          	addw	sp,#3
1596  0112 81            	ret	
1729                     ; 658 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1729                     ; 659 {
1730                     	switch	.text
1731  0113               _SPI_GetFlagStatus:
1733  0113 89            	pushw	x
1734  0114 88            	push	a
1735       00000001      OFST:	set	1
1738                     ; 660   FlagStatus status = RESET;
1740                     ; 662   assert_param(IS_SPI_FLAG(SPI_FLAG));
1742                     ; 665   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1744  0115 e603          	ld	a,(3,x)
1745  0117 1506          	bcp	a,(OFST+5,sp)
1746  0119 2704          	jreq	L1401
1747                     ; 667     status = SET; /* SPI_FLAG is set */
1749  011b a601          	ld	a,#1
1751  011d 2001          	jra	L3401
1752  011f               L1401:
1753                     ; 671     status = RESET; /* SPI_FLAG is reset*/
1755  011f 4f            	clr	a
1756  0120               L3401:
1757                     ; 675   return status;
1761  0120 5b03          	addw	sp,#3
1762  0122 81            	ret	
1809                     ; 693 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1809                     ; 694 {
1810                     	switch	.text
1811  0123               _SPI_ClearFlag:
1813  0123 89            	pushw	x
1814       00000000      OFST:	set	0
1817                     ; 695   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
1819                     ; 697   SPIx->SR = (uint8_t)(~SPI_FLAG);
1821  0124 7b05          	ld	a,(OFST+5,sp)
1822  0126 43            	cpl	a
1823  0127 1e01          	ldw	x,(OFST+1,sp)
1824  0129 e703          	ld	(3,x),a
1825                     ; 698 }
1828  012b 85            	popw	x
1829  012c 81            	ret	
1917                     ; 714 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
1917                     ; 715 {
1918                     	switch	.text
1919  012d               _SPI_GetITStatus:
1921  012d 89            	pushw	x
1922  012e 5203          	subw	sp,#3
1923       00000003      OFST:	set	3
1926                     ; 716   ITStatus pendingbitstatus = RESET;
1928                     ; 717   uint8_t itpos = 0;
1930                     ; 718   uint8_t itmask1 = 0;
1932                     ; 719   uint8_t itmask2 = 0;
1934                     ; 720   __IO uint8_t enablestatus = 0;
1936  0130 0f02          	clr	(OFST-1,sp)
1937                     ; 721   assert_param(IS_SPI_GET_IT(SPI_IT));
1939                     ; 723   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1941  0132 7b08          	ld	a,(OFST+5,sp)
1942  0134 a40f          	and	a,#15
1943  0136 5f            	clrw	x
1944  0137 97            	ld	xl,a
1945  0138 a601          	ld	a,#1
1946  013a 5d            	tnzw	x
1947  013b 2704          	jreq	L06
1948  013d               L26:
1949  013d 48            	sll	a
1950  013e 5a            	decw	x
1951  013f 26fc          	jrne	L26
1952  0141               L06:
1953  0141 6b01          	ld	(OFST-2,sp),a
1954                     ; 726   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1956  0143 7b08          	ld	a,(OFST+5,sp)
1957  0145 4e            	swap	a
1958  0146 a40f          	and	a,#15
1959  0148 6b03          	ld	(OFST+0,sp),a
1960                     ; 728   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1962  014a 5f            	clrw	x
1963  014b 97            	ld	xl,a
1964  014c a601          	ld	a,#1
1965  014e 5d            	tnzw	x
1966  014f 2704          	jreq	L46
1967  0151               L66:
1968  0151 48            	sll	a
1969  0152 5a            	decw	x
1970  0153 26fc          	jrne	L66
1971  0155               L46:
1972  0155 6b03          	ld	(OFST+0,sp),a
1973                     ; 730   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
1975  0157 1e04          	ldw	x,(OFST+1,sp)
1976  0159 e603          	ld	a,(3,x)
1977  015b 1403          	and	a,(OFST+0,sp)
1978  015d 6b02          	ld	(OFST-1,sp),a
1979                     ; 732   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
1981  015f e602          	ld	a,(2,x)
1982  0161 1501          	bcp	a,(OFST-2,sp)
1983  0163 2708          	jreq	L3311
1985  0165 0d02          	tnz	(OFST-1,sp)
1986  0167 2704          	jreq	L3311
1987                     ; 735     pendingbitstatus = SET;
1989  0169 a601          	ld	a,#1
1991  016b 2001          	jra	L5311
1992  016d               L3311:
1993                     ; 740     pendingbitstatus = RESET;
1995  016d 4f            	clr	a
1996  016e               L5311:
1997                     ; 743   return  pendingbitstatus;
2001  016e 5b05          	addw	sp,#5
2002  0170 81            	ret	
2057                     ; 761 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
2057                     ; 762 {
2058                     	switch	.text
2059  0171               _SPI_ClearITPendingBit:
2061  0171 89            	pushw	x
2062  0172 88            	push	a
2063       00000001      OFST:	set	1
2066                     ; 763   uint8_t itpos = 0;
2068                     ; 764   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
2070                     ; 769   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2072  0173 7b06          	ld	a,(OFST+5,sp)
2073  0175 4e            	swap	a
2074  0176 a40f          	and	a,#15
2075  0178 5f            	clrw	x
2076  0179 97            	ld	xl,a
2077  017a a601          	ld	a,#1
2078  017c 5d            	tnzw	x
2079  017d 2704          	jreq	L27
2080  017f               L47:
2081  017f 48            	sll	a
2082  0180 5a            	decw	x
2083  0181 26fc          	jrne	L47
2084  0183               L27:
2085  0183 6b01          	ld	(OFST+0,sp),a
2086                     ; 771   SPIx->SR = (uint8_t)(~itpos);
2088  0185 43            	cpl	a
2089  0186 1e02          	ldw	x,(OFST+1,sp)
2090  0188 e703          	ld	(3,x),a
2091                     ; 773 }
2094  018a 5b03          	addw	sp,#3
2095  018c 81            	ret	
2108                     	xdef	_SPI_ClearITPendingBit
2109                     	xdef	_SPI_GetITStatus
2110                     	xdef	_SPI_ClearFlag
2111                     	xdef	_SPI_GetFlagStatus
2112                     	xdef	_SPI_ITConfig
2113                     	xdef	_SPI_DMACmd
2114                     	xdef	_SPI_GetCRCPolynomial
2115                     	xdef	_SPI_ResetCRC
2116                     	xdef	_SPI_GetCRC
2117                     	xdef	_SPI_CalculateCRCCmd
2118                     	xdef	_SPI_TransmitCRC
2119                     	xdef	_SPI_ReceiveData
2120                     	xdef	_SPI_SendData
2121                     	xdef	_SPI_BiDirectionalLineConfig
2122                     	xdef	_SPI_NSSInternalSoftwareCmd
2123                     	xdef	_SPI_Cmd
2124                     	xdef	_SPI_Init
2125                     	xdef	_SPI_DeInit
2144                     	end
