   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
  44                     ; 44 void SPI_DeInit(void)
  44                     ; 45 {
  46                     	switch	.text
  47  0000               _SPI_DeInit:
  51                     ; 46     SPI->CR1    = SPI_CR1_RESET_VALUE;
  53  0000 725f5200      	clr	20992
  54                     ; 47     SPI->CR2    = SPI_CR2_RESET_VALUE;
  56  0004 725f5201      	clr	20993
  57                     ; 48     SPI->ICR    = SPI_ICR_RESET_VALUE;
  59  0008 725f5202      	clr	20994
  60                     ; 49     SPI->SR     = SPI_SR_RESET_VALUE;
  62  000c 35025203      	mov	20995,#2
  63                     ; 50     SPI->CRCPR  = SPI_CRCPR_RESET_VALUE;
  65  0010 35075205      	mov	20997,#7
  66                     ; 51 }
  69  0014 81            	ret
 385                     ; 72 void SPI_Init(SPI_FirstBit_TypeDef FirstBit, SPI_BaudRatePrescaler_TypeDef BaudRatePrescaler, SPI_Mode_TypeDef Mode, SPI_ClockPolarity_TypeDef ClockPolarity, SPI_ClockPhase_TypeDef ClockPhase, SPI_DataDirection_TypeDef Data_Direction, SPI_NSS_TypeDef Slave_Management, uint8_t CRCPolynomial)
 385                     ; 73 {
 386                     	switch	.text
 387  0015               _SPI_Init:
 389  0015 89            	pushw	x
 390  0016 88            	push	a
 391       00000001      OFST:	set	1
 394                     ; 75     assert_param(IS_SPI_FIRSTBIT_OK(FirstBit));
 396                     ; 76     assert_param(IS_SPI_BAUDRATE_PRESCALER_OK(BaudRatePrescaler));
 398                     ; 77     assert_param(IS_SPI_MODE_OK(Mode));
 400                     ; 78     assert_param(IS_SPI_POLARITY_OK(ClockPolarity));
 402                     ; 79     assert_param(IS_SPI_PHASE_OK(ClockPhase));
 404                     ; 80     assert_param(IS_SPI_DATA_DIRECTION_OK(Data_Direction));
 406                     ; 81     assert_param(IS_SPI_SLAVEMANAGEMENT_OK(Slave_Management));
 408                     ; 82     assert_param(IS_SPI_CRC_POLYNOMIAL_OK(CRCPolynomial));
 410                     ; 85     SPI->CR1 = (uint8_t)((uint8_t)((uint8_t)FirstBit | BaudRatePrescaler) |
 410                     ; 86                     (uint8_t)((uint8_t)ClockPolarity | ClockPhase));
 412  0017 7b07          	ld	a,(OFST+6,sp)
 413  0019 1a08          	or	a,(OFST+7,sp)
 414  001b 6b01          	ld	(OFST+0,sp),a
 416  001d 9f            	ld	a,xl
 417  001e 1a02          	or	a,(OFST+1,sp)
 418  0020 1a01          	or	a,(OFST+0,sp)
 419  0022 c75200        	ld	20992,a
 420                     ; 89     SPI->CR2 = (uint8_t)((uint8_t)(Data_Direction) | (uint8_t)(Slave_Management));
 422  0025 7b09          	ld	a,(OFST+8,sp)
 423  0027 1a0a          	or	a,(OFST+9,sp)
 424  0029 c75201        	ld	20993,a
 425                     ; 91     if (Mode == SPI_MODE_MASTER)
 427  002c 7b06          	ld	a,(OFST+5,sp)
 428  002e a104          	cp	a,#4
 429  0030 2606          	jrne	L302
 430                     ; 93         SPI->CR2 |= (uint8_t)SPI_CR2_SSI;
 432  0032 72105201      	bset	20993,#0
 434  0036 2004          	jra	L502
 435  0038               L302:
 436                     ; 97         SPI->CR2 &= (uint8_t)~(SPI_CR2_SSI);
 438  0038 72115201      	bres	20993,#0
 439  003c               L502:
 440                     ; 101     SPI->CR1 |= (uint8_t)(Mode);
 442  003c c65200        	ld	a,20992
 443  003f 1a06          	or	a,(OFST+5,sp)
 444  0041 c75200        	ld	20992,a
 445                     ; 104     SPI->CRCPR = (uint8_t)CRCPolynomial;
 447  0044 7b0b          	ld	a,(OFST+10,sp)
 448  0046 c75205        	ld	20997,a
 449                     ; 105 }
 452  0049 5b03          	addw	sp,#3
 453  004b 81            	ret
 508                     ; 113 void SPI_Cmd(FunctionalState NewState)
 508                     ; 114 {
 509                     	switch	.text
 510  004c               _SPI_Cmd:
 514                     ; 116     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 516                     ; 118     if (NewState != DISABLE)
 518  004c 4d            	tnz	a
 519  004d 2706          	jreq	L532
 520                     ; 120         SPI->CR1 |= SPI_CR1_SPE; /* Enable the SPI peripheral*/
 522  004f 721c5200      	bset	20992,#6
 524  0053 2004          	jra	L732
 525  0055               L532:
 526                     ; 124         SPI->CR1 &= (uint8_t)(~SPI_CR1_SPE); /* Disable the SPI peripheral*/
 528  0055 721d5200      	bres	20992,#6
 529  0059               L732:
 530                     ; 126 }
 533  0059 81            	ret
 642                     ; 135 void SPI_ITConfig(SPI_IT_TypeDef SPI_IT, FunctionalState NewState)
 642                     ; 136 {
 643                     	switch	.text
 644  005a               _SPI_ITConfig:
 646  005a 89            	pushw	x
 647  005b 88            	push	a
 648       00000001      OFST:	set	1
 651                     ; 137     uint8_t itpos = 0;
 653                     ; 139     assert_param(IS_SPI_CONFIG_IT_OK(SPI_IT));
 655                     ; 140     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 657                     ; 143     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)SPI_IT & (uint8_t)0x0F));
 659  005c 9e            	ld	a,xh
 660  005d a40f          	and	a,#15
 661  005f 5f            	clrw	x
 662  0060 97            	ld	xl,a
 663  0061 a601          	ld	a,#1
 664  0063 5d            	tnzw	x
 665  0064 2704          	jreq	L41
 666  0066               L61:
 667  0066 48            	sll	a
 668  0067 5a            	decw	x
 669  0068 26fc          	jrne	L61
 670  006a               L41:
 671  006a 6b01          	ld	(OFST+0,sp),a
 673                     ; 145     if (NewState != DISABLE)
 675  006c 0d03          	tnz	(OFST+2,sp)
 676  006e 270a          	jreq	L113
 677                     ; 147         SPI->ICR |= itpos; /* Enable interrupt*/
 679  0070 c65202        	ld	a,20994
 680  0073 1a01          	or	a,(OFST+0,sp)
 681  0075 c75202        	ld	20994,a
 683  0078 2009          	jra	L313
 684  007a               L113:
 685                     ; 151         SPI->ICR &= (uint8_t)(~itpos); /* Disable interrupt*/
 687  007a 7b01          	ld	a,(OFST+0,sp)
 688  007c 43            	cpl	a
 689  007d c45202        	and	a,20994
 690  0080 c75202        	ld	20994,a
 691  0083               L313:
 692                     ; 153 }
 695  0083 5b03          	addw	sp,#3
 696  0085 81            	ret
 730                     ; 159 void SPI_SendData(uint8_t Data)
 730                     ; 160 {
 731                     	switch	.text
 732  0086               _SPI_SendData:
 736                     ; 161     SPI->DR = Data; /* Write in the DR register the data to be sent*/
 738  0086 c75204        	ld	20996,a
 739                     ; 162 }
 742  0089 81            	ret
 765                     ; 169 uint8_t SPI_ReceiveData(void)
 765                     ; 170 {
 766                     	switch	.text
 767  008a               _SPI_ReceiveData:
 771                     ; 171     return ((uint8_t)SPI->DR); /* Return the data in the DR register*/
 773  008a c65204        	ld	a,20996
 776  008d 81            	ret
 812                     ; 180 void SPI_NSSInternalSoftwareCmd(FunctionalState NewState)
 812                     ; 181 {
 813                     	switch	.text
 814  008e               _SPI_NSSInternalSoftwareCmd:
 818                     ; 183     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 820                     ; 185     if (NewState != DISABLE)
 822  008e 4d            	tnz	a
 823  008f 2706          	jreq	L163
 824                     ; 187         SPI->CR2 |= SPI_CR2_SSI; /* Set NSS pin internally by software*/
 826  0091 72105201      	bset	20993,#0
 828  0095 2004          	jra	L363
 829  0097               L163:
 830                     ; 191         SPI->CR2 &= (uint8_t)(~SPI_CR2_SSI); /* Reset NSS pin internally by software*/
 832  0097 72115201      	bres	20993,#0
 833  009b               L363:
 834                     ; 193 }
 837  009b 81            	ret
 860                     ; 200 void SPI_TransmitCRC(void)
 860                     ; 201 {
 861                     	switch	.text
 862  009c               _SPI_TransmitCRC:
 866                     ; 202     SPI->CR2 |= SPI_CR2_CRCNEXT; /* Enable the CRC transmission*/
 868  009c 72185201      	bset	20993,#4
 869                     ; 203 }
 872  00a0 81            	ret
 908                     ; 211 void SPI_CalculateCRCCmd(FunctionalState NewState)
 908                     ; 212 {
 909                     	switch	.text
 910  00a1               _SPI_CalculateCRCCmd:
 914                     ; 214     assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 916                     ; 216     if (NewState != DISABLE)
 918  00a1 4d            	tnz	a
 919  00a2 2706          	jreq	L314
 920                     ; 218         SPI->CR2 |= SPI_CR2_CRCEN; /* Enable the CRC calculation*/
 922  00a4 721a5201      	bset	20993,#5
 924  00a8 2004          	jra	L514
 925  00aa               L314:
 926                     ; 222         SPI->CR2 &= (uint8_t)(~SPI_CR2_CRCEN); /* Disable the CRC calculation*/
 928  00aa 721b5201      	bres	20993,#5
 929  00ae               L514:
 930                     ; 224 }
 933  00ae 81            	ret
 997                     ; 231 uint8_t SPI_GetCRC(SPI_CRC_TypeDef SPI_CRC)
 997                     ; 232 {
 998                     	switch	.text
 999  00af               _SPI_GetCRC:
1001  00af 88            	push	a
1002       00000001      OFST:	set	1
1005                     ; 233     uint8_t crcreg = 0;
1007                     ; 236     assert_param(IS_SPI_CRC_OK(SPI_CRC));
1009                     ; 238     if (SPI_CRC != SPI_CRC_RX)
1011  00b0 4d            	tnz	a
1012  00b1 2707          	jreq	L154
1013                     ; 240         crcreg = SPI->TXCRCR;  /* Get the Tx CRC register*/
1015  00b3 c65207        	ld	a,20999
1016  00b6 6b01          	ld	(OFST+0,sp),a
1019  00b8 2005          	jra	L354
1020  00ba               L154:
1021                     ; 244         crcreg = SPI->RXCRCR; /* Get the Rx CRC register*/
1023  00ba c65206        	ld	a,20998
1024  00bd 6b01          	ld	(OFST+0,sp),a
1026  00bf               L354:
1027                     ; 248     return crcreg;
1029  00bf 7b01          	ld	a,(OFST+0,sp)
1032  00c1 5b01          	addw	sp,#1
1033  00c3 81            	ret
1058                     ; 256 void SPI_ResetCRC(void)
1058                     ; 257 {
1059                     	switch	.text
1060  00c4               _SPI_ResetCRC:
1064                     ; 260     SPI_CalculateCRCCmd(ENABLE);
1066  00c4 a601          	ld	a,#1
1067  00c6 add9          	call	_SPI_CalculateCRCCmd
1069                     ; 263     SPI_Cmd(ENABLE);
1071  00c8 a601          	ld	a,#1
1072  00ca ad80          	call	_SPI_Cmd
1074                     ; 264 }
1077  00cc 81            	ret
1101                     ; 271 uint8_t SPI_GetCRCPolynomial(void)
1101                     ; 272 {
1102                     	switch	.text
1103  00cd               _SPI_GetCRCPolynomial:
1107                     ; 273     return SPI->CRCPR; /* Return the CRC polynomial register */
1109  00cd c65205        	ld	a,20997
1112  00d0 81            	ret
1168                     ; 281 void SPI_BiDirectionalLineConfig(SPI_Direction_TypeDef SPI_Direction)
1168                     ; 282 {
1169                     	switch	.text
1170  00d1               _SPI_BiDirectionalLineConfig:
1174                     ; 284     assert_param(IS_SPI_DIRECTION_OK(SPI_Direction));
1176                     ; 286     if (SPI_Direction != SPI_DIRECTION_RX)
1178  00d1 4d            	tnz	a
1179  00d2 2706          	jreq	L325
1180                     ; 288         SPI->CR2 |= SPI_CR2_BDOE; /* Set the Tx only mode*/
1182  00d4 721c5201      	bset	20993,#6
1184  00d8 2004          	jra	L525
1185  00da               L325:
1186                     ; 292         SPI->CR2 &= (uint8_t)(~SPI_CR2_BDOE); /* Set the Rx only mode*/
1188  00da 721d5201      	bres	20993,#6
1189  00de               L525:
1190                     ; 294 }
1193  00de 81            	ret
1314                     ; 304 FlagStatus SPI_GetFlagStatus(SPI_Flag_TypeDef SPI_FLAG)
1314                     ; 305 {
1315                     	switch	.text
1316  00df               _SPI_GetFlagStatus:
1318  00df 88            	push	a
1319       00000001      OFST:	set	1
1322                     ; 306     FlagStatus status = RESET;
1324                     ; 308     assert_param(IS_SPI_FLAGS_OK(SPI_FLAG));
1326                     ; 311     if ((SPI->SR & (uint8_t)SPI_FLAG) != (uint8_t)RESET)
1328  00e0 c45203        	and	a,20995
1329  00e3 2706          	jreq	L306
1330                     ; 313         status = SET; /* SPI_FLAG is set */
1332  00e5 a601          	ld	a,#1
1333  00e7 6b01          	ld	(OFST+0,sp),a
1336  00e9 2002          	jra	L506
1337  00eb               L306:
1338                     ; 317         status = RESET; /* SPI_FLAG is reset*/
1340  00eb 0f01          	clr	(OFST+0,sp)
1342  00ed               L506:
1343                     ; 321     return status;
1345  00ed 7b01          	ld	a,(OFST+0,sp)
1348  00ef 5b01          	addw	sp,#1
1349  00f1 81            	ret
1384                     ; 339 void SPI_ClearFlag(SPI_Flag_TypeDef SPI_FLAG)
1384                     ; 340 {
1385                     	switch	.text
1386  00f2               _SPI_ClearFlag:
1390                     ; 341     assert_param(IS_SPI_CLEAR_FLAGS_OK(SPI_FLAG));
1392                     ; 343     SPI->SR = (uint8_t)(~SPI_FLAG);
1394  00f2 43            	cpl	a
1395  00f3 c75203        	ld	20995,a
1396                     ; 344 }
1399  00f6 81            	ret
1481                     ; 359 ITStatus SPI_GetITStatus(SPI_IT_TypeDef SPI_IT)
1481                     ; 360 {
1482                     	switch	.text
1483  00f7               _SPI_GetITStatus:
1485  00f7 88            	push	a
1486  00f8 89            	pushw	x
1487       00000002      OFST:	set	2
1490                     ; 361     ITStatus pendingbitstatus = RESET;
1492                     ; 362     uint8_t itpos = 0;
1494                     ; 363     uint8_t itmask1 = 0;
1496                     ; 364     uint8_t itmask2 = 0;
1498                     ; 365     uint8_t enablestatus = 0;
1500                     ; 366     assert_param(IS_SPI_GET_IT_OK(SPI_IT));
1502                     ; 368     itpos = (uint8_t)((uint8_t)1 << ((uint8_t)SPI_IT & (uint8_t)0x0F));
1504  00f9 a40f          	and	a,#15
1505  00fb 5f            	clrw	x
1506  00fc 97            	ld	xl,a
1507  00fd a601          	ld	a,#1
1508  00ff 5d            	tnzw	x
1509  0100 2704          	jreq	L05
1510  0102               L25:
1511  0102 48            	sll	a
1512  0103 5a            	decw	x
1513  0104 26fc          	jrne	L25
1514  0106               L05:
1515  0106 6b01          	ld	(OFST-1,sp),a
1517                     ; 371     itmask1 = (uint8_t)((uint8_t)SPI_IT >> (uint8_t)4);
1519  0108 7b03          	ld	a,(OFST+1,sp)
1520  010a 4e            	swap	a
1521  010b a40f          	and	a,#15
1522  010d 6b02          	ld	(OFST+0,sp),a
1524                     ; 373     itmask2 = (uint8_t)((uint8_t)1 << itmask1);
1526  010f 7b02          	ld	a,(OFST+0,sp)
1527  0111 5f            	clrw	x
1528  0112 97            	ld	xl,a
1529  0113 a601          	ld	a,#1
1530  0115 5d            	tnzw	x
1531  0116 2704          	jreq	L45
1532  0118               L65:
1533  0118 48            	sll	a
1534  0119 5a            	decw	x
1535  011a 26fc          	jrne	L65
1536  011c               L45:
1537  011c 6b02          	ld	(OFST+0,sp),a
1539                     ; 375     enablestatus = (uint8_t)((uint8_t)SPI->SR & itmask2);
1541  011e c65203        	ld	a,20995
1542  0121 1402          	and	a,(OFST+0,sp)
1543  0123 6b02          	ld	(OFST+0,sp),a
1545                     ; 377     if (((SPI->ICR & itpos) != RESET) && enablestatus)
1547  0125 c65202        	ld	a,20994
1548  0128 1501          	bcp	a,(OFST-1,sp)
1549  012a 270a          	jreq	L766
1551  012c 0d02          	tnz	(OFST+0,sp)
1552  012e 2706          	jreq	L766
1553                     ; 380         pendingbitstatus = SET;
1555  0130 a601          	ld	a,#1
1556  0132 6b02          	ld	(OFST+0,sp),a
1559  0134 2002          	jra	L176
1560  0136               L766:
1561                     ; 385         pendingbitstatus = RESET;
1563  0136 0f02          	clr	(OFST+0,sp)
1565  0138               L176:
1566                     ; 388     return  pendingbitstatus;
1568  0138 7b02          	ld	a,(OFST+0,sp)
1571  013a 5b03          	addw	sp,#3
1572  013c 81            	ret
1617                     ; 404 void SPI_ClearITPendingBit(SPI_IT_TypeDef SPI_IT)
1617                     ; 405 {
1618                     	switch	.text
1619  013d               _SPI_ClearITPendingBit:
1621  013d 88            	push	a
1622       00000001      OFST:	set	1
1625                     ; 406     uint8_t itpos = 0;
1627                     ; 407     assert_param(IS_SPI_CLEAR_IT_OK(SPI_IT));
1629                     ; 412     itpos = (uint8_t)((uint8_t)1 << (uint8_t)((uint8_t)(SPI_IT & (uint8_t)0xF0) >> 4));
1631  013e a4f0          	and	a,#240
1632  0140 4e            	swap	a
1633  0141 a40f          	and	a,#15
1634  0143 5f            	clrw	x
1635  0144 97            	ld	xl,a
1636  0145 a601          	ld	a,#1
1637  0147 5d            	tnzw	x
1638  0148 2704          	jreq	L26
1639  014a               L46:
1640  014a 48            	sll	a
1641  014b 5a            	decw	x
1642  014c 26fc          	jrne	L46
1643  014e               L26:
1644  014e 6b01          	ld	(OFST+0,sp),a
1646                     ; 414     SPI->SR = (uint8_t)(~itpos);
1648  0150 7b01          	ld	a,(OFST+0,sp)
1649  0152 43            	cpl	a
1650  0153 c75203        	ld	20995,a
1651                     ; 416 }
1654  0156 84            	pop	a
1655  0157 81            	ret
1668                     	xdef	_SPI_ClearITPendingBit
1669                     	xdef	_SPI_GetITStatus
1670                     	xdef	_SPI_ClearFlag
1671                     	xdef	_SPI_GetFlagStatus
1672                     	xdef	_SPI_BiDirectionalLineConfig
1673                     	xdef	_SPI_GetCRCPolynomial
1674                     	xdef	_SPI_ResetCRC
1675                     	xdef	_SPI_GetCRC
1676                     	xdef	_SPI_CalculateCRCCmd
1677                     	xdef	_SPI_TransmitCRC
1678                     	xdef	_SPI_NSSInternalSoftwareCmd
1679                     	xdef	_SPI_ReceiveData
1680                     	xdef	_SPI_SendData
1681                     	xdef	_SPI_ITConfig
1682                     	xdef	_SPI_Cmd
1683                     	xdef	_SPI_Init
1684                     	xdef	_SPI_DeInit
1703                     	end
