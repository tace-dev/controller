   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
 143                     ; 125 void SPI_DeInit(SPI_TypeDef* SPIx)
 143                     ; 126 {
 145                     .text:	section	.text,new
 146  0000               _SPI_DeInit:
 150                     ; 127   SPIx->CR1    = SPI_CR1_RESET_VALUE;
 152  0000 7f            	clr	(x)
 153                     ; 128   SPIx->CR2    = SPI_CR2_RESET_VALUE;
 155  0001 6f01          	clr	(1,x)
 156                     ; 129   SPIx->CR3    = SPI_CR3_RESET_VALUE;
 158  0003 6f02          	clr	(2,x)
 159                     ; 130   SPIx->SR     = SPI_SR_RESET_VALUE;
 161  0005 a602          	ld	a,#2
 162  0007 e703          	ld	(3,x),a
 163                     ; 131   SPIx->CRCPR  = SPI_CRCPR_RESET_VALUE;
 165  0009 a607          	ld	a,#7
 166  000b e705          	ld	(5,x),a
 167                     ; 132 }
 170  000d 81            	ret	
 494                     ; 174 void SPI_Init(SPI_TypeDef* SPIx, SPI_FirstBit_TypeDef SPI_FirstBit,
 494                     ; 175               SPI_BaudRatePrescaler_TypeDef SPI_BaudRatePrescaler,
 494                     ; 176               SPI_Mode_TypeDef SPI_Mode, SPI_CPOL_TypeDef SPI_CPOL,
 494                     ; 177               SPI_CPHA_TypeDef SPI_CPHA, SPI_DirectionMode_TypeDef SPI_Data_Direction,
 494                     ; 178               SPI_NSS_TypeDef SPI_Slave_Management, uint8_t CRCPolynomial)
 494                     ; 179 {
 495                     .text:	section	.text,new
 496  0000               _SPI_Init:
 498  0000 89            	pushw	x
 499  0001 88            	push	a
 500       00000001      OFST:	set	1
 503                     ; 181   assert_param(IS_SPI_FIRSTBIT(SPI_FirstBit));
 505                     ; 182   assert_param(IS_SPI_BAUDRATE_PRESCALER(SPI_BaudRatePrescaler));
 507                     ; 183   assert_param(IS_SPI_MODE(SPI_Mode));
 509                     ; 184   assert_param(IS_SPI_POLARITY(SPI_CPOL));
 511                     ; 185   assert_param(IS_SPI_PHASE(SPI_CPHA));
 513                     ; 186   assert_param(IS_SPI_DATA_DIRECTION(SPI_Data_Direction));
 515                     ; 187   assert_param(IS_SPI_SLAVEMANAGEMENT(SPI_Slave_Management));
 517                     ; 188   assert_param(IS_SPI_CRC_POLYNOMIAL(CRCPolynomial));
 519                     ; 191   SPIx->CR1 = (uint8_t)((uint8_t)((uint8_t)SPI_FirstBit |
 519                     ; 192                                   (uint8_t)SPI_BaudRatePrescaler) |
 519                     ; 193                         (uint8_t)((uint8_t)SPI_CPOL |
 519                     ; 194                                   SPI_CPHA));
 521  0002 7b09          	ld	a,(OFST+8,sp)
 522  0004 1a0a          	or	a,(OFST+9,sp)
 523  0006 6b01          	ld	(OFST+0,sp),a
 524  0008 7b06          	ld	a,(OFST+5,sp)
 525  000a 1a07          	or	a,(OFST+6,sp)
 526  000c 1a01          	or	a,(OFST+0,sp)
 527  000e 1e02          	ldw	x,(OFST+1,sp)
 528  0010 f7            	ld	(x),a
 529                     ; 197   SPIx->CR2 = (uint8_t)((uint8_t)(SPI_Data_Direction) | (uint8_t)(SPI_Slave_Management));
 531  0011 7b0b          	ld	a,(OFST+10,sp)
 532  0013 1a0c          	or	a,(OFST+11,sp)
 533  0015 e701          	ld	(1,x),a
 534                     ; 199   if (SPI_Mode == SPI_Mode_Master)
 536  0017 7b08          	ld	a,(OFST+7,sp)
 537  0019 a104          	cp	a,#4
 538  001b 2606          	jrne	L362
 539                     ; 201     SPIx->CR2 |= (uint8_t)SPI_CR2_SSI;
 541  001d e601          	ld	a,(1,x)
 542  001f aa01          	or	a,#1
 544  0021 2004          	jra	L562
 545  0023               L362:
 546                     ; 205     SPIx->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 548  0023 e601          	ld	a,(1,x)
 549  0025 a4fe          	and	a,#254
 550  0027               L562:
 551  0027 e701          	ld	(1,x),a
 552                     ; 209   SPIx->CR1 |= (uint8_t)(SPI_Mode);
 554  0029 f6            	ld	a,(x)
 555  002a 1a08          	or	a,(OFST+7,sp)
 556  002c f7            	ld	(x),a
 557                     ; 212   SPIx->CRCPR = (uint8_t)CRCPolynomial;
 559  002d 7b0d          	ld	a,(OFST+12,sp)
 560  002f e705          	ld	(5,x),a
 561                     ; 213 }
 564  0031 5b03          	addw	sp,#3
 565  0033 81            	ret	
 632                     ; 222 void SPI_Cmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 632                     ; 223 {
 633                     .text:	section	.text,new
 634  0000               _SPI_Cmd:
 636  0000 89            	pushw	x
 637       00000000      OFST:	set	0
 640                     ; 225   assert_param(IS_FUNCTIONAL_STATE(NewState));
 642                     ; 227   if (NewState != DISABLE)
 644  0001 7b05          	ld	a,(OFST+5,sp)
 645  0003 2705          	jreq	L323
 646                     ; 229     SPIx->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 648  0005 f6            	ld	a,(x)
 649  0006 aa40          	or	a,#64
 651  0008 2005          	jra	L523
 652  000a               L323:
 653                     ; 233     SPIx->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 655  000a 1e01          	ldw	x,(OFST+1,sp)
 656  000c f6            	ld	a,(x)
 657  000d a4bf          	and	a,#191
 658  000f               L523:
 659  000f f7            	ld	(x),a
 660                     ; 235 }
 663  0010 85            	popw	x
 664  0011 81            	ret	
 712                     ; 244 void SPI_NSSInternalSoftwareCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
 712                     ; 245 {
 713                     .text:	section	.text,new
 714  0000               _SPI_NSSInternalSoftwareCmd:
 716  0000 89            	pushw	x
 717       00000000      OFST:	set	0
 720                     ; 247   assert_param(IS_FUNCTIONAL_STATE(NewState));
 722                     ; 249   if (NewState != DISABLE)
 724  0001 7b05          	ld	a,(OFST+5,sp)
 725  0003 2706          	jreq	L353
 726                     ; 251     SPIx->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 728  0005 e601          	ld	a,(1,x)
 729  0007 aa01          	or	a,#1
 731  0009 2006          	jra	L553
 732  000b               L353:
 733                     ; 255     SPIx->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 735  000b 1e01          	ldw	x,(OFST+1,sp)
 736  000d e601          	ld	a,(1,x)
 737  000f a4fe          	and	a,#254
 738  0011               L553:
 739  0011 e701          	ld	(1,x),a
 740                     ; 257 }
 743  0013 85            	popw	x
 744  0014 81            	ret	
 812                     ; 268 void SPI_BiDirectionalLineConfig(SPI_TypeDef* SPIx, SPI_Direction_TypeDef SPI_Direction)
 812                     ; 269 {
 813                     .text:	section	.text,new
 814  0000               _SPI_BiDirectionalLineConfig:
 816  0000 89            	pushw	x
 817       00000000      OFST:	set	0
 820                     ; 271   assert_param(IS_SPI_DIRECTION(SPI_Direction));
 822                     ; 273   if (SPI_Direction != SPI_Direction_Rx)
 824  0001 7b05          	ld	a,(OFST+5,sp)
 825  0003 2706          	jreq	L314
 826                     ; 275     SPIx->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
 828  0005 e601          	ld	a,(1,x)
 829  0007 aa40          	or	a,#64
 831  0009 2006          	jra	L514
 832  000b               L314:
 833                     ; 279     SPIx->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
 835  000b 1e01          	ldw	x,(OFST+1,sp)
 836  000d e601          	ld	a,(1,x)
 837  000f a4bf          	and	a,#191
 838  0011               L514:
 839  0011 e701          	ld	(1,x),a
 840                     ; 281 }
 843  0013 85            	popw	x
 844  0014 81            	ret	
 888                     ; 316 void SPI_SendData(SPI_TypeDef* SPIx, uint8_t Data)
 888                     ; 317 {
 889                     .text:	section	.text,new
 890  0000               _SPI_SendData:
 892  0000 89            	pushw	x
 893       00000000      OFST:	set	0
 896                     ; 318   SPIx->DR = Data; /* Write in the DR register the data to be sent*/
 898  0001 7b05          	ld	a,(OFST+5,sp)
 899  0003 1e01          	ldw	x,(OFST+1,sp)
 900  0005 e704          	ld	(4,x),a
 901                     ; 319 }
 904  0007 85            	popw	x
 905  0008 81            	ret	
 942                     ; 326 uint8_t SPI_ReceiveData(SPI_TypeDef* SPIx)
 942                     ; 327 {
 943                     .text:	section	.text,new
 944  0000               _SPI_ReceiveData:
 948                     ; 328   return ((uint8_t)SPIx->DR); /* Return the data in the DR register*/
 950  0000 e604          	ld	a,(4,x)
 953  0002 81            	ret	
 990                     ; 411 void SPI_TransmitCRC(SPI_TypeDef* SPIx)
 990                     ; 412 {
 991                     .text:	section	.text,new
 992  0000               _SPI_TransmitCRC:
 996                     ; 413   SPIx->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 998  0000 e601          	ld	a,(1,x)
 999  0002 aa10          	or	a,#16
1000  0004 e701          	ld	(1,x),a
1001                     ; 414 }
1004  0006 81            	ret	
1053                     ; 423 void SPI_CalculateCRCCmd(SPI_TypeDef* SPIx, FunctionalState NewState)
1053                     ; 424 {
1054                     .text:	section	.text,new
1055  0000               _SPI_CalculateCRCCmd:
1057  0000 89            	pushw	x
1058       00000000      OFST:	set	0
1061                     ; 426   assert_param(IS_FUNCTIONAL_STATE(NewState));
1063                     ; 429   SPI_Cmd(SPI1, DISABLE);
1065  0001 4b00          	push	#0
1066  0003 ae5200        	ldw	x,#20992
1067  0006 cd0000        	call	_SPI_Cmd
1069  0009 84            	pop	a
1070                     ; 431   if (NewState != DISABLE)
1072  000a 7b05          	ld	a,(OFST+5,sp)
1073  000c 2708          	jreq	L525
1074                     ; 433     SPIx->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
1076  000e 1e01          	ldw	x,(OFST+1,sp)
1077  0010 e601          	ld	a,(1,x)
1078  0012 aa20          	or	a,#32
1080  0014 2006          	jra	L725
1081  0016               L525:
1082                     ; 437     SPIx->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
1084  0016 1e01          	ldw	x,(OFST+1,sp)
1085  0018 e601          	ld	a,(1,x)
1086  001a a4df          	and	a,#223
1087  001c               L725:
1088  001c e701          	ld	(1,x),a
1089                     ; 439 }
1092  001e 85            	popw	x
1093  001f 81            	ret	
1167                     ; 450 uint8_t SPI_GetCRC(SPI_TypeDef* SPIx, SPI_CRC_TypeDef SPI_CRC)
1167                     ; 451 {
1168                     .text:	section	.text,new
1169  0000               _SPI_GetCRC:
1171  0000 89            	pushw	x
1172  0001 88            	push	a
1173       00000001      OFST:	set	1
1176                     ; 452   uint8_t crcreg = 0;
1178                     ; 455   assert_param(IS_SPI_CRC(SPI_CRC));
1180                     ; 457   if (SPI_CRC != SPI_CRC_RX)
1182  0002 7b06          	ld	a,(OFST+5,sp)
1183  0004 2704          	jreq	L765
1184                     ; 459     crcreg = SPIx->TXCRCR;  /* Get the Tx CRC register*/
1186  0006 e607          	ld	a,(7,x)
1188  0008 2004          	jra	L175
1189  000a               L765:
1190                     ; 463     crcreg = SPIx->RXCRCR; /* Get the Rx CRC register*/
1192  000a 1e02          	ldw	x,(OFST+1,sp)
1193  000c e606          	ld	a,(6,x)
1194  000e               L175:
1195                     ; 467   return crcreg;
1199  000e 5b03          	addw	sp,#3
1200  0010 81            	ret	
1239                     ; 475 void SPI_ResetCRC(SPI_TypeDef* SPIx)
1239                     ; 476 {
1240                     .text:	section	.text,new
1241  0000               _SPI_ResetCRC:
1243  0000 89            	pushw	x
1244       00000000      OFST:	set	0
1247                     ; 479   SPI_CalculateCRCCmd(SPIx, ENABLE);
1249  0001 4b01          	push	#1
1250  0003 cd0000        	call	_SPI_CalculateCRCCmd
1252  0006 84            	pop	a
1253                     ; 482   SPI_Cmd(SPIx, ENABLE);
1255  0007 4b01          	push	#1
1256  0009 1e02          	ldw	x,(OFST+2,sp)
1257  000b cd0000        	call	_SPI_Cmd
1259  000e 84            	pop	a
1260                     ; 483 }
1263  000f 85            	popw	x
1264  0010 81            	ret	
1302                     ; 490 uint8_t SPI_GetCRCPolynomial(SPI_TypeDef* SPIx)
1302                     ; 491 {
1303                     .text:	section	.text,new
1304  0000               _SPI_GetCRCPolynomial:
1308                     ; 492   return SPIx->CRCPR; /* Return the CRC polynomial register */
1310  0000 e605          	ld	a,(5,x)
1313  0002 81            	ret	
1390                     ; 522 void SPI_DMACmd(SPI_TypeDef* SPIx, SPI_DMAReq_TypeDef SPI_DMAReq, FunctionalState NewState)
1390                     ; 523 {
1391                     .text:	section	.text,new
1392  0000               _SPI_DMACmd:
1394  0000 89            	pushw	x
1395       00000000      OFST:	set	0
1398                     ; 525   assert_param(IS_FUNCTIONAL_STATE(NewState));
1400                     ; 526   assert_param(IS_SPI_DMAREQ(SPI_DMAReq));
1402                     ; 528   if (NewState != DISABLE)
1404  0001 7b06          	ld	a,(OFST+6,sp)
1405  0003 2706          	jreq	L376
1406                     ; 531     SPIx->CR3 |= (uint8_t) SPI_DMAReq;
1408  0005 e602          	ld	a,(2,x)
1409  0007 1a05          	or	a,(OFST+5,sp)
1411  0009 2007          	jra	L576
1412  000b               L376:
1413                     ; 536     SPIx->CR3 &= (uint8_t)~SPI_DMAReq;
1415  000b 1e01          	ldw	x,(OFST+1,sp)
1416  000d 7b05          	ld	a,(OFST+5,sp)
1417  000f 43            	cpl	a
1418  0010 e402          	and	a,(2,x)
1419  0012               L576:
1420  0012 e702          	ld	(2,x),a
1421                     ; 538 }
1424  0014 85            	popw	x
1425  0015 81            	ret	
1544                     ; 623 void SPI_ITConfig(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
1544                     ; 624 {
1545                     .text:	section	.text,new
1546  0000               _SPI_ITConfig:
1548  0000 89            	pushw	x
1549  0001 88            	push	a
1550       00000001      OFST:	set	1
1553                     ; 625   uint8_t itpos = 0;
1555                     ; 627   assert_param(IS_SPI_CONFIG_IT(SPI_IT));
1557                     ; 628   assert_param(IS_FUNCTIONAL_STATE(NewState));
1559                     ; 631   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
1561  0002 7b06          	ld	a,(OFST+5,sp)
1562  0004 a40f          	and	a,#15
1563  0006 5f            	clrw	x
1564  0007 97            	ld	xl,a
1565  0008 a601          	ld	a,#1
1566  000a 5d            	tnzw	x
1567  000b 2704          	jreq	L64
1568  000d               L05:
1569  000d 48            	sll	a
1570  000e 5a            	decw	x
1571  000f 26fc          	jrne	L05
1572  0011               L64:
1573  0011 6b01          	ld	(OFST+0,sp),a
1574                     ; 633   if (NewState != DISABLE)
1576  0013 0d07          	tnz	(OFST+6,sp)
1577  0015 2708          	jreq	L357
1578                     ; 635     SPIx->CR3 |= itpos; /* Enable interrupt*/
1580  0017 1e02          	ldw	x,(OFST+1,sp)
1581  0019 e602          	ld	a,(2,x)
1582  001b 1a01          	or	a,(OFST+0,sp)
1584  001d 2005          	jra	L557
1585  001f               L357:
1586                     ; 639     SPIx->CR3 &= (uint8_t)(~itpos); /* Disable interrupt*/
1588  001f 1e02          	ldw	x,(OFST+1,sp)
1589  0021 43            	cpl	a
1590  0022 e402          	and	a,(2,x)
1591  0024               L557:
1592  0024 e702          	ld	(2,x),a
1593                     ; 641 }
1596  0026 5b03          	addw	sp,#3
1597  0028 81            	ret	
1730                     ; 658 FlagStatus SPI_GetFlagStatus(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1730                     ; 659 {
1731                     .text:	section	.text,new
1732  0000               _SPI_GetFlagStatus:
1734  0000 89            	pushw	x
1735  0001 88            	push	a
1736       00000001      OFST:	set	1
1739                     ; 660   FlagStatus status = RESET;
1741                     ; 662   assert_param(IS_SPI_FLAG(SPI_FLAG));
1743                     ; 665   if ((SPIx->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1745  0002 e603          	ld	a,(3,x)
1746  0004 1506          	bcp	a,(OFST+5,sp)
1747  0006 2704          	jreq	L1401
1748                     ; 667     status = SET; /* SPI_FLAG is set */
1750  0008 a601          	ld	a,#1
1752  000a 2001          	jra	L3401
1753  000c               L1401:
1754                     ; 671     status = RESET; /* SPI_FLAG is reset*/
1756  000c 4f            	clr	a
1757  000d               L3401:
1758                     ; 675   return status;
1762  000d 5b03          	addw	sp,#3
1763  000f 81            	ret	
1810                     ; 693 void SPI_ClearFlag(SPI_TypeDef* SPIx, SPI_FLAG_TypeDef SPI_FLAG)
1810                     ; 694 {
1811                     .text:	section	.text,new
1812  0000               _SPI_ClearFlag:
1814  0000 89            	pushw	x
1815       00000000      OFST:	set	0
1818                     ; 695   assert_param(IS_SPI_CLEAR_FLAG(SPI_FLAG));
1820                     ; 697   SPIx->SR = (uint8_t)(~SPI_FLAG);
1822  0001 7b05          	ld	a,(OFST+5,sp)
1823  0003 43            	cpl	a
1824  0004 1e01          	ldw	x,(OFST+1,sp)
1825  0006 e703          	ld	(3,x),a
1826                     ; 698 }
1829  0008 85            	popw	x
1830  0009 81            	ret	
1918                     ; 714 ITStatus SPI_GetITStatus(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
1918                     ; 715 {
1919                     .text:	section	.text,new
1920  0000               _SPI_GetITStatus:
1922  0000 89            	pushw	x
1923  0001 5203          	subw	sp,#3
1924       00000003      OFST:	set	3
1927                     ; 716   ITStatus pendingbitstatus = RESET;
1929                     ; 717   uint8_t itpos = 0;
1931                     ; 718   uint8_t itmask1 = 0;
1933                     ; 719   uint8_t itmask2 = 0;
1935                     ; 720   __IO uint8_t enablestatus = 0;
1937  0003 0f02          	clr	(OFST-1,sp)
1938                     ; 721   assert_param(IS_SPI_GET_IT(SPI_IT));
1940                     ; 723   itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1942  0005 7b08          	ld	a,(OFST+5,sp)
1943  0007 a40f          	and	a,#15
1944  0009 5f            	clrw	x
1945  000a 97            	ld	xl,a
1946  000b a601          	ld	a,#1
1947  000d 5d            	tnzw	x
1948  000e 2704          	jreq	L06
1949  0010               L26:
1950  0010 48            	sll	a
1951  0011 5a            	decw	x
1952  0012 26fc          	jrne	L26
1953  0014               L06:
1954  0014 6b01          	ld	(OFST-2,sp),a
1955                     ; 726   itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1957  0016 7b08          	ld	a,(OFST+5,sp)
1958  0018 4e            	swap	a
1959  0019 a40f          	and	a,#15
1960  001b 6b03          	ld	(OFST+0,sp),a
1961                     ; 728   itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1963  001d 5f            	clrw	x
1964  001e 97            	ld	xl,a
1965  001f a601          	ld	a,#1
1966  0021 5d            	tnzw	x
1967  0022 2704          	jreq	L46
1968  0024               L66:
1969  0024 48            	sll	a
1970  0025 5a            	decw	x
1971  0026 26fc          	jrne	L66
1972  0028               L46:
1973  0028 6b03          	ld	(OFST+0,sp),a
1974                     ; 730   enablestatus = (uint8_t)((uint8_t)SPIx->SR & itmask2);
1976  002a 1e04          	ldw	x,(OFST+1,sp)
1977  002c e603          	ld	a,(3,x)
1978  002e 1403          	and	a,(OFST+0,sp)
1979  0030 6b02          	ld	(OFST-1,sp),a
1980                     ; 732   if (((SPIx->CR3 & itpos) != RESET) && enablestatus)
1982  0032 e602          	ld	a,(2,x)
1983  0034 1501          	bcp	a,(OFST-2,sp)
1984  0036 2708          	jreq	L3311
1986  0038 0d02          	tnz	(OFST-1,sp)
1987  003a 2704          	jreq	L3311
1988                     ; 735     pendingbitstatus = SET;
1990  003c a601          	ld	a,#1
1992  003e 2001          	jra	L5311
1993  0040               L3311:
1994                     ; 740     pendingbitstatus = RESET;
1996  0040 4f            	clr	a
1997  0041               L5311:
1998                     ; 743   return  pendingbitstatus;
2002  0041 5b05          	addw	sp,#5
2003  0043 81            	ret	
2058                     ; 761 void SPI_ClearITPendingBit(SPI_TypeDef* SPIx, SPI_IT_TypeDef SPI_IT)
2058                     ; 762 {
2059                     .text:	section	.text,new
2060  0000               _SPI_ClearITPendingBit:
2062  0000 89            	pushw	x
2063  0001 88            	push	a
2064       00000001      OFST:	set	1
2067                     ; 763   uint8_t itpos = 0;
2069                     ; 764   assert_param(IS_SPI_CLEAR_IT(SPI_IT));
2071                     ; 769   itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
2073  0002 7b06          	ld	a,(OFST+5,sp)
2074  0004 4e            	swap	a
2075  0005 a40f          	and	a,#15
2076  0007 5f            	clrw	x
2077  0008 97            	ld	xl,a
2078  0009 a601          	ld	a,#1
2079  000b 5d            	tnzw	x
2080  000c 2704          	jreq	L27
2081  000e               L47:
2082  000e 48            	sll	a
2083  000f 5a            	decw	x
2084  0010 26fc          	jrne	L47
2085  0012               L27:
2086  0012 6b01          	ld	(OFST+0,sp),a
2087                     ; 771   SPIx->SR = (uint8_t)(~itpos);
2089  0014 43            	cpl	a
2090  0015 1e02          	ldw	x,(OFST+1,sp)
2091  0017 e703          	ld	(3,x),a
2092                     ; 773 }
2095  0019 5b03          	addw	sp,#3
2096  001b 81            	ret	
2109                     	xdef	_SPI_ClearITPendingBit
2110                     	xdef	_SPI_GetITStatus
2111                     	xdef	_SPI_ClearFlag
2112                     	xdef	_SPI_GetFlagStatus
2113                     	xdef	_SPI_ITConfig
2114                     	xdef	_SPI_DMACmd
2115                     	xdef	_SPI_GetCRCPolynomial
2116                     	xdef	_SPI_ResetCRC
2117                     	xdef	_SPI_GetCRC
2118                     	xdef	_SPI_CalculateCRCCmd
2119                     	xdef	_SPI_TransmitCRC
2120                     	xdef	_SPI_ReceiveData
2121                     	xdef	_SPI_SendData
2122                     	xdef	_SPI_BiDirectionalLineConfig
2123                     	xdef	_SPI_NSSInternalSoftwareCmd
2124                     	xdef	_SPI_Cmd
2125                     	xdef	_SPI_Init
2126                     	xdef	_SPI_DeInit
2145                     	end
