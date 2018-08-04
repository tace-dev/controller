   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  84                     ; 171 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  84                     ; 172 {
  86                     	switch	.text
  87  0000               _FLASH_SetProgrammingTime:
  91                     ; 174   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  93                     ; 176   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  95  0000 72115050      	bres	20560,#0
  96                     ; 177   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  98  0004 ca5050        	or	a,20560
  99  0007 c75050        	ld	20560,a
 100                     ; 178 }
 103  000a 81            	ret	
 128                     ; 185 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 128                     ; 186 {
 129                     	switch	.text
 130  000b               _FLASH_GetProgrammingTime:
 134                     ; 187   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 136  000b c65050        	ld	a,20560
 137  000e a401          	and	a,#1
 140  0010 81            	ret	
 196                     ; 200 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 196                     ; 201 {
 197                     	switch	.text
 198  0011               _FLASH_PowerWaitModeConfig:
 202                     ; 203   assert_param(IS_FLASH_POWER(FLASH_Power));
 204                     ; 206   if (FLASH_Power != FLASH_Power_On)
 206  0011 4a            	dec	a
 207  0012 2705          	jreq	L57
 208                     ; 208     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 210  0014 72145050      	bset	20560,#2
 213  0018 81            	ret	
 214  0019               L57:
 215                     ; 213     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 217  0019 72155050      	bres	20560,#2
 218                     ; 215 }
 221  001d 81            	ret	
 244                     ; 256 void FLASH_DeInit(void)
 244                     ; 257 {
 245                     	switch	.text
 246  001e               _FLASH_DeInit:
 250                     ; 258   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 252  001e 725f5050      	clr	20560
 253                     ; 259   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 255  0022 725f5051      	clr	20561
 256                     ; 260   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 258  0026 35405054      	mov	20564,#64
 259                     ; 261   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 261  002a c65054        	ld	a,20564
 262                     ; 262 }
 265  002d 81            	ret	
 321                     ; 272 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 321                     ; 273 {
 322                     	switch	.text
 323  002e               _FLASH_Unlock:
 325  002e 88            	push	a
 326       00000000      OFST:	set	0
 329                     ; 275   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 331                     ; 278   if (FLASH_MemType == FLASH_MemType_Program)
 333  002f a1fd          	cp	a,#253
 334  0031 2608          	jrne	L731
 335                     ; 280     FLASH->PUKR = FLASH_RASS_KEY1;
 337  0033 35565052      	mov	20562,#86
 338                     ; 281     FLASH->PUKR = FLASH_RASS_KEY2;
 340  0037 35ae5052      	mov	20562,#174
 341  003b               L731:
 342                     ; 285   if (FLASH_MemType == FLASH_MemType_Data)
 344  003b 7b01          	ld	a,(OFST+1,sp)
 345  003d a1f7          	cp	a,#247
 346  003f 2608          	jrne	L141
 347                     ; 287     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 349  0041 35ae5053      	mov	20563,#174
 350                     ; 288     FLASH->DUKR = FLASH_RASS_KEY1;
 352  0045 35565053      	mov	20563,#86
 353  0049               L141:
 354                     ; 290 }
 357  0049 84            	pop	a
 358  004a 81            	ret	
 393                     ; 300 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 393                     ; 301 {
 394                     	switch	.text
 395  004b               _FLASH_Lock:
 399                     ; 303   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 401                     ; 305   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 403  004b c45054        	and	a,20564
 404  004e c75054        	ld	20564,a
 405                     ; 306 }
 408  0051 81            	ret	
 447                     ; 314 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 447                     ; 315 {
 448                     	switch	.text
 449  0052               _FLASH_ProgramByte:
 451       00000000      OFST:	set	0
 454                     ; 317   assert_param(IS_FLASH_ADDRESS(Address));
 456                     ; 319   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 458  0052 1e05          	ldw	x,(OFST+5,sp)
 459  0054 7b07          	ld	a,(OFST+7,sp)
 460  0056 f7            	ld	(x),a
 461                     ; 320 }
 464  0057 81            	ret	
 496                     ; 327 void FLASH_EraseByte(uint32_t Address)
 496                     ; 328 {
 497                     	switch	.text
 498  0058               _FLASH_EraseByte:
 500       00000000      OFST:	set	0
 503                     ; 330   assert_param(IS_FLASH_ADDRESS(Address));
 505                     ; 332   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 507  0058 1e05          	ldw	x,(OFST+5,sp)
 508  005a 7f            	clr	(x)
 509                     ; 333 }
 512  005b 81            	ret	
 551                     ; 341 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 551                     ; 342 {
 552                     	switch	.text
 553  005c               _FLASH_ProgramWord:
 555       00000000      OFST:	set	0
 558                     ; 344   assert_param(IS_FLASH_ADDRESS(Address));
 560                     ; 346   FLASH->CR2 |= FLASH_CR2_WPRG;
 562  005c 721c5051      	bset	20561,#6
 563                     ; 349   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 565  0060 1e05          	ldw	x,(OFST+5,sp)
 566  0062 7b07          	ld	a,(OFST+7,sp)
 567  0064 f7            	ld	(x),a
 568                     ; 351   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 570  0065 7b08          	ld	a,(OFST+8,sp)
 571  0067 e701          	ld	(1,x),a
 572                     ; 353   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 574  0069 7b09          	ld	a,(OFST+9,sp)
 575  006b e702          	ld	(2,x),a
 576                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 578  006d 7b0a          	ld	a,(OFST+10,sp)
 579  006f e703          	ld	(3,x),a
 580                     ; 356 }
 583  0071 81            	ret	
 615                     ; 363 uint8_t FLASH_ReadByte(uint32_t Address)
 615                     ; 364 {
 616                     	switch	.text
 617  0072               _FLASH_ReadByte:
 619       00000000      OFST:	set	0
 622                     ; 366   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 624  0072 1e05          	ldw	x,(OFST+5,sp)
 625  0074 f6            	ld	a,(x)
 628  0075 81            	ret	
 669                     ; 413 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 669                     ; 414 {
 670                     	switch	.text
 671  0076               _FLASH_ProgramOptionByte:
 673  0076 89            	pushw	x
 674       00000000      OFST:	set	0
 677                     ; 416   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 679                     ; 419   FLASH->CR2 |= FLASH_CR2_OPT;
 681  0077 721e5051      	bset	20561,#7
 682                     ; 422   *((PointerAttr uint8_t*)Address) = Data;
 684  007b 1e01          	ldw	x,(OFST+1,sp)
 685  007d 7b05          	ld	a,(OFST+5,sp)
 686  007f f7            	ld	(x),a
 687                     ; 424   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 689  0080 a6fd          	ld	a,#253
 690  0082 cd0186        	call	_FLASH_WaitForLastOperation
 692                     ; 427   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 694  0085 721f5051      	bres	20561,#7
 695                     ; 428 }
 698  0089 85            	popw	x
 699  008a 81            	ret	
 733                     ; 435 void FLASH_EraseOptionByte(uint16_t Address)
 733                     ; 436 {
 734                     	switch	.text
 735  008b               _FLASH_EraseOptionByte:
 739                     ; 438   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 741                     ; 441   FLASH->CR2 |= FLASH_CR2_OPT;
 743  008b 721e5051      	bset	20561,#7
 744                     ; 444   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 746  008f 7f            	clr	(x)
 747                     ; 446   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 749  0090 a6fd          	ld	a,#253
 750  0092 cd0186        	call	_FLASH_WaitForLastOperation
 752                     ; 449   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 754  0095 721f5051      	bres	20561,#7
 755                     ; 450 }
 758  0099 81            	ret	
 815                     ; 458 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 815                     ; 459 {
 816                     	switch	.text
 817  009a               _FLASH_GetReadOutProtectionStatus:
 819  009a 88            	push	a
 820       00000001      OFST:	set	1
 823                     ; 460   FunctionalState state = DISABLE;
 825                     ; 462   if (OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 827  009b c64800        	ld	a,18432
 828  009e a1aa          	cp	a,#170
 829  00a0 2604          	jrne	L523
 830                     ; 465     state =  ENABLE;
 832  00a2 a601          	ld	a,#1
 834  00a4 2001          	jra	L723
 835  00a6               L523:
 836                     ; 470     state =  DISABLE;
 838  00a6 4f            	clr	a
 839  00a7               L723:
 840                     ; 473   return state;
 844  00a7 5b01          	addw	sp,#1
 845  00a9 81            	ret	
 877                     ; 481 uint16_t FLASH_GetBootSize(void)
 877                     ; 482 {
 878                     	switch	.text
 879  00aa               _FLASH_GetBootSize:
 881  00aa 89            	pushw	x
 882       00000002      OFST:	set	2
 885                     ; 483   uint16_t temp = 0;
 887                     ; 486   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 889  00ab c64802        	ld	a,18434
 890  00ae 5f            	clrw	x
 891  00af 97            	ld	xl,a
 892  00b0 4f            	clr	a
 893  00b1 02            	rlwa	x,a
 894  00b2 44            	srl	a
 895  00b3 56            	rrcw	x
 896                     ; 489   if (OPT->UBC > 0x7F)
 898  00b4 c64802        	ld	a,18434
 899  00b7 a180          	cp	a,#128
 900  00b9 2503          	jrult	L543
 901                     ; 491     temp = 8192;
 903  00bb ae2000        	ldw	x,#8192
 904  00be               L543:
 905                     ; 495   return(temp);
 909  00be 5b02          	addw	sp,#2
 910  00c0 81            	ret	
 942                     ; 505 uint16_t FLASH_GetCodeSize(void)
 942                     ; 506 {
 943                     	switch	.text
 944  00c1               _FLASH_GetCodeSize:
 946  00c1 89            	pushw	x
 947       00000002      OFST:	set	2
 950                     ; 507   uint16_t temp = 0;
 952                     ; 510   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 954  00c2 c64807        	ld	a,18439
 955  00c5 5f            	clrw	x
 956  00c6 97            	ld	xl,a
 957  00c7 4f            	clr	a
 958  00c8 02            	rlwa	x,a
 959  00c9 44            	srl	a
 960  00ca 56            	rrcw	x
 961                     ; 513   if (OPT->PCODESIZE > 0x7F)
 963  00cb c64807        	ld	a,18439
 964  00ce a180          	cp	a,#128
 965  00d0 2503          	jrult	L363
 966                     ; 515     temp = 8192;
 968  00d2 ae2000        	ldw	x,#8192
 969  00d5               L363:
 970                     ; 519   return(temp);
 974  00d5 5b02          	addw	sp,#2
 975  00d7 81            	ret	
1010                     ; 544 void FLASH_ITConfig(FunctionalState NewState)
1010                     ; 545 {
1011                     	switch	.text
1012  00d8               _FLASH_ITConfig:
1016                     ; 548   assert_param(IS_FUNCTIONAL_STATE(NewState));
1018                     ; 550   if (NewState != DISABLE)
1020  00d8 4d            	tnz	a
1021  00d9 2705          	jreq	L304
1022                     ; 553     FLASH->CR1 |= FLASH_CR1_IE;
1024  00db 72125050      	bset	20560,#1
1027  00df 81            	ret	
1028  00e0               L304:
1029                     ; 558     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1031  00e0 72135050      	bres	20560,#1
1032                     ; 560 }
1035  00e4 81            	ret	
1144                     ; 574 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1144                     ; 575 {
1145                     	switch	.text
1146  00e5               _FLASH_GetFlagStatus:
1148  00e5 88            	push	a
1149       00000001      OFST:	set	1
1152                     ; 576   FlagStatus status = RESET;
1154                     ; 577   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1156                     ; 580   if ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1158  00e6 c45054        	and	a,20564
1159  00e9 2702          	jreq	L754
1160                     ; 582     status = SET; /* Flash_FLAG is set*/
1162  00eb a601          	ld	a,#1
1164  00ed               L754:
1165                     ; 586     status = RESET; /* Flash_FLAG is reset*/
1167                     ; 590   return status;
1171  00ed 5b01          	addw	sp,#1
1172  00ef 81            	ret	
1208                     ; 706 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1208                     ; 707 {
1209                     	switch	.text
1210  00f0               _FLASH_PowerRunModeConfig:
1214                     ; 709   assert_param(IS_FLASH_POWER(FLASH_Power));
1216                     ; 711   if (FLASH_Power != FLASH_Power_On)
1218  00f0 4a            	dec	a
1219  00f1 2705          	jreq	L105
1220                     ; 713   FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1222  00f3 72165050      	bset	20560,#3
1225  00f7 81            	ret	
1226  00f8               L105:
1227                     ; 717     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1229  00f8 72175050      	bres	20560,#3
1230                     ; 719 }
1233  00fc 81            	ret	
1297                     ; 732 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1297                     ; 733 {
1298                     	switch	.text
1299  00fd               _FLASH_GetPowerStatus:
1303                     ; 734   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1305  00fd c65050        	ld	a,20560
1306  0100 a40c          	and	a,#12
1309  0102 81            	ret	
1407                     ; 752 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1407                     ; 753                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1407                     ; 754 {
1408                     	switch	.text
1409  0103               _FLASH_ProgramBlock:
1411  0103 89            	pushw	x
1412  0104 5206          	subw	sp,#6
1413       00000006      OFST:	set	6
1416                     ; 755   uint16_t Count = 0;
1418                     ; 756   uint32_t startaddress = 0;
1420                     ; 759   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1422                     ; 760   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1424                     ; 761   if (FLASH_MemType == FLASH_MemType_Program)
1426  0106 7b0b          	ld	a,(OFST+5,sp)
1427  0108 a1fd          	cp	a,#253
1428  010a 2605          	jrne	L575
1429                     ; 763   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1431                     ; 764     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1433  010c ae8000        	ldw	x,#32768
1435  010f 2003          	jra	L775
1436  0111               L575:
1437                     ; 768     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1439                     ; 769     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1441  0111 ae1000        	ldw	x,#4096
1442  0114               L775:
1443  0114 1f03          	ldw	(OFST-3,sp),x
1444  0116 5f            	clrw	x
1445  0117 1f01          	ldw	(OFST-5,sp),x
1446                     ; 773   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1448  0119 a680          	ld	a,#128
1449  011b 1e07          	ldw	x,(OFST+1,sp)
1450  011d cd0000        	call	c_cmulx
1452  0120 96            	ldw	x,sp
1453  0121 5c            	incw	x
1454  0122 cd0000        	call	c_lgadd
1456                     ; 776   if (FLASH_ProgMode == FLASH_ProgramMode_Standard)
1458  0125 7b0c          	ld	a,(OFST+6,sp)
1459  0127 2606          	jrne	L106
1460                     ; 779   FLASH->CR2 |= FLASH_CR2_PRG;
1462  0129 72105051      	bset	20561,#0
1464  012d 2004          	jra	L306
1465  012f               L106:
1466                     ; 784   FLASH->CR2 |= FLASH_CR2_FPRG;
1468  012f 72185051      	bset	20561,#4
1469  0133               L306:
1470                     ; 788   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1472  0133 5f            	clrw	x
1473  0134 1f05          	ldw	(OFST-1,sp),x
1474  0136               L506:
1475                     ; 790     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1477  0136 1e0d          	ldw	x,(OFST+7,sp)
1478  0138 72fb05        	addw	x,(OFST-1,sp)
1479  013b f6            	ld	a,(x)
1480  013c 1e03          	ldw	x,(OFST-3,sp)
1481  013e 72fb05        	addw	x,(OFST-1,sp)
1482  0141 f7            	ld	(x),a
1483                     ; 788   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1485  0142 1e05          	ldw	x,(OFST-1,sp)
1486  0144 5c            	incw	x
1487  0145 1f05          	ldw	(OFST-1,sp),x
1490  0147 a30080        	cpw	x,#128
1491  014a 25ea          	jrult	L506
1492                     ; 792 }
1495  014c 5b08          	addw	sp,#8
1496  014e 81            	ret	
1555                     ; 804 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1555                     ; 805 {
1556                     	switch	.text
1557  014f               _FLASH_EraseBlock:
1559  014f 89            	pushw	x
1560  0150 5206          	subw	sp,#6
1561       00000006      OFST:	set	6
1564                     ; 806   uint32_t startaddress = 0;
1566                     ; 816   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1568                     ; 817   if (FLASH_MemType == FLASH_MemType_Program)
1570  0152 7b0b          	ld	a,(OFST+5,sp)
1571  0154 a1fd          	cp	a,#253
1572  0156 2605          	jrne	L146
1573                     ; 819   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1575                     ; 820     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1577  0158 ae8000        	ldw	x,#32768
1579  015b 2003          	jra	L346
1580  015d               L146:
1581                     ; 824     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1583                     ; 825     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1585  015d ae1000        	ldw	x,#4096
1586  0160               L346:
1587  0160 1f05          	ldw	(OFST-1,sp),x
1588  0162 5f            	clrw	x
1589  0163 1f03          	ldw	(OFST-3,sp),x
1590                     ; 831   pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1592  0165 a680          	ld	a,#128
1593  0167 1e07          	ldw	x,(OFST+1,sp)
1594  0169 cd0000        	call	c_cmulx
1596  016c 96            	ldw	x,sp
1597  016d 1c0003        	addw	x,#OFST-3
1598  0170 cd0000        	call	c_ladd
1600  0173 be02          	ldw	x,c_lreg+2
1601  0175 1f01          	ldw	(OFST-5,sp),x
1602                     ; 838   FLASH->CR2 |= FLASH_CR2_ERASE;
1604  0177 721a5051      	bset	20561,#5
1605                     ; 842   *pwFlash = (uint32_t)0;  
1607  017b 4f            	clr	a
1608  017c e703          	ld	(3,x),a
1609  017e e702          	ld	(2,x),a
1610  0180 e701          	ld	(1,x),a
1611  0182 f7            	ld	(x),a
1612                     ; 850 }
1615  0183 5b08          	addw	sp,#8
1616  0185 81            	ret	
1697                     ; 862 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1697                     ; 863 {
1698                     	switch	.text
1699  0186               _FLASH_WaitForLastOperation:
1701  0186 5205          	subw	sp,#5
1702       00000005      OFST:	set	5
1705                     ; 864   uint32_t timeout = OPERATION_TIMEOUT;
1707  0188 aeffff        	ldw	x,#65535
1708  018b 1f03          	ldw	(OFST-2,sp),x
1709  018d 5f            	clrw	x
1710  018e 1f01          	ldw	(OFST-4,sp),x
1711                     ; 865   uint8_t flagstatus = 0x00;
1713  0190 0f05          	clr	(OFST+0,sp)
1714                     ; 867   if (FLASH_MemType == FLASH_MemType_Program)
1716  0192 a1fd          	cp	a,#253
1717  0194 262b          	jrne	L717
1719  0196 200e          	jra	L507
1720  0198               L307:
1721                     ; 871       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1721                     ; 872                              FLASH_IAPSR_WR_PG_DIS));
1723  0198 c65054        	ld	a,20564
1724  019b a405          	and	a,#5
1725  019d 6b05          	ld	(OFST+0,sp),a
1726                     ; 873       timeout--;
1728  019f 96            	ldw	x,sp
1729  01a0 5c            	incw	x
1730  01a1 a601          	ld	a,#1
1731  01a3 cd0000        	call	c_lgsbc
1733  01a6               L507:
1734                     ; 869   while ((flagstatus == 0x00) && (timeout != 0x00))
1736  01a6 7b05          	ld	a,(OFST+0,sp)
1737  01a8 2622          	jrne	L317
1739  01aa 96            	ldw	x,sp
1740  01ab 5c            	incw	x
1741  01ac cd0000        	call	c_lzmp
1743  01af 26e7          	jrne	L307
1744  01b1 2019          	jra	L317
1745  01b3               L517:
1746                     ; 880       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1746                     ; 881                              FLASH_IAPSR_WR_PG_DIS));
1748  01b3 c65054        	ld	a,20564
1749  01b6 a441          	and	a,#65
1750  01b8 6b05          	ld	(OFST+0,sp),a
1751                     ; 882       timeout--;
1753  01ba 96            	ldw	x,sp
1754  01bb 5c            	incw	x
1755  01bc a601          	ld	a,#1
1756  01be cd0000        	call	c_lgsbc
1758  01c1               L717:
1759                     ; 878     while ((flagstatus == 0x00) && (timeout != 0x00))
1761  01c1 7b05          	ld	a,(OFST+0,sp)
1762  01c3 2607          	jrne	L317
1764  01c5 96            	ldw	x,sp
1765  01c6 5c            	incw	x
1766  01c7 cd0000        	call	c_lzmp
1768  01ca 26e7          	jrne	L517
1769  01cc               L317:
1770                     ; 885   if (timeout == 0x00 )
1772  01cc 96            	ldw	x,sp
1773  01cd 5c            	incw	x
1774  01ce cd0000        	call	c_lzmp
1776  01d1 2604          	jrne	L527
1777                     ; 887   flagstatus = FLASH_Status_TimeOut;
1779  01d3 a602          	ld	a,#2
1780  01d5 6b05          	ld	(OFST+0,sp),a
1781  01d7               L527:
1782                     ; 890   return((FLASH_Status_TypeDef)flagstatus);
1784  01d7 7b05          	ld	a,(OFST+0,sp)
1787  01d9 5b05          	addw	sp,#5
1788  01db 81            	ret	
1801                     	xdef	_FLASH_WaitForLastOperation
1802                     	xdef	_FLASH_EraseBlock
1803                     	xdef	_FLASH_ProgramBlock
1804                     	xdef	_FLASH_GetPowerStatus
1805                     	xdef	_FLASH_PowerRunModeConfig
1806                     	xdef	_FLASH_GetFlagStatus
1807                     	xdef	_FLASH_ITConfig
1808                     	xdef	_FLASH_EraseOptionByte
1809                     	xdef	_FLASH_ProgramOptionByte
1810                     	xdef	_FLASH_GetReadOutProtectionStatus
1811                     	xdef	_FLASH_GetCodeSize
1812                     	xdef	_FLASH_GetBootSize
1813                     	xdef	_FLASH_ReadByte
1814                     	xdef	_FLASH_ProgramWord
1815                     	xdef	_FLASH_EraseByte
1816                     	xdef	_FLASH_ProgramByte
1817                     	xdef	_FLASH_Lock
1818                     	xdef	_FLASH_Unlock
1819                     	xdef	_FLASH_DeInit
1820                     	xdef	_FLASH_PowerWaitModeConfig
1821                     	xdef	_FLASH_SetProgrammingTime
1822                     	xdef	_FLASH_GetProgrammingTime
1823                     	xref.b	c_lreg
1842                     	xref	c_lzmp
1843                     	xref	c_lgsbc
1844                     	xref	c_ladd
1845                     	xref	c_lgadd
1846                     	xref	c_cmulx
1847                     	end
