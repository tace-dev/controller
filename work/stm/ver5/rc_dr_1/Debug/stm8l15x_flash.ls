   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  85                     ; 171 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  85                     ; 172 {
  87                     .text:	section	.text,new
  88  0000               _FLASH_SetProgrammingTime:
  92                     ; 174   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  94                     ; 176   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  96  0000 72115050      	bres	20560,#0
  97                     ; 177   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  99  0004 ca5050        	or	a,20560
 100  0007 c75050        	ld	20560,a
 101                     ; 178 }
 104  000a 81            	ret	
 129                     ; 185 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 129                     ; 186 {
 130                     .text:	section	.text,new
 131  0000               _FLASH_GetProgrammingTime:
 135                     ; 187   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 137  0000 c65050        	ld	a,20560
 138  0003 a401          	and	a,#1
 141  0005 81            	ret	
 197                     ; 200 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 197                     ; 201 {
 198                     .text:	section	.text,new
 199  0000               _FLASH_PowerWaitModeConfig:
 203                     ; 203   assert_param(IS_FLASH_POWER(FLASH_Power));
 205                     ; 206   if (FLASH_Power != FLASH_Power_On)
 207  0000 4a            	dec	a
 208  0001 2705          	jreq	L57
 209                     ; 208     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 211  0003 72145050      	bset	20560,#2
 214  0007 81            	ret	
 215  0008               L57:
 216                     ; 213     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 218  0008 72155050      	bres	20560,#2
 219                     ; 215 }
 222  000c 81            	ret	
 245                     ; 256 void FLASH_DeInit(void)
 245                     ; 257 {
 246                     .text:	section	.text,new
 247  0000               _FLASH_DeInit:
 251                     ; 258   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 253  0000 725f5050      	clr	20560
 254                     ; 259   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 256  0004 725f5051      	clr	20561
 257                     ; 260   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 259  0008 35405054      	mov	20564,#64
 260                     ; 261   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 262  000c c65054        	ld	a,20564
 263                     ; 262 }
 266  000f 81            	ret	
 322                     ; 272 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 322                     ; 273 {
 323                     .text:	section	.text,new
 324  0000               _FLASH_Unlock:
 326       00000000      OFST:	set	0
 329                     ; 275   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 331                     ; 278   if (FLASH_MemType == FLASH_MemType_Program)
 333  0000 a1fd          	cp	a,#253
 334  0002 2608          	jrne	L731
 335                     ; 280     FLASH->PUKR = FLASH_RASS_KEY1;
 337  0004 35565052      	mov	20562,#86
 338                     ; 281     FLASH->PUKR = FLASH_RASS_KEY2;
 340  0008 35ae5052      	mov	20562,#174
 341  000c               L731:
 342                     ; 285   if (FLASH_MemType == FLASH_MemType_Data)
 344  000c a1f7          	cp	a,#247
 345  000e 2608          	jrne	L141
 346                     ; 287     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 348  0010 35ae5053      	mov	20563,#174
 349                     ; 288     FLASH->DUKR = FLASH_RASS_KEY1;
 351  0014 35565053      	mov	20563,#86
 352  0018               L141:
 353                     ; 290 }
 356  0018 81            	ret	
 391                     ; 300 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 391                     ; 301 {
 392                     .text:	section	.text,new
 393  0000               _FLASH_Lock:
 397                     ; 303   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 399                     ; 305   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 401  0000 c45054        	and	a,20564
 402  0003 c75054        	ld	20564,a
 403                     ; 306 }
 406  0006 81            	ret	
 445                     ; 314 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 445                     ; 315 {
 446                     .text:	section	.text,new
 447  0000               _FLASH_ProgramByte:
 449       00000000      OFST:	set	0
 452                     ; 317   assert_param(IS_FLASH_ADDRESS(Address));
 454                     ; 319   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = Data;
 456  0000 1e05          	ldw	x,(OFST+5,sp)
 457  0002 7b07          	ld	a,(OFST+7,sp)
 458  0004 f7            	ld	(x),a
 459                     ; 320 }
 462  0005 81            	ret	
 494                     ; 327 void FLASH_EraseByte(uint32_t Address)
 494                     ; 328 {
 495                     .text:	section	.text,new
 496  0000               _FLASH_EraseByte:
 498       00000000      OFST:	set	0
 501                     ; 330   assert_param(IS_FLASH_ADDRESS(Address));
 503                     ; 332   *(PointerAttr uint8_t*) (MemoryAddressCast)Address = FLASH_CLEAR_BYTE; /* Erase byte */
 505  0000 1e05          	ldw	x,(OFST+5,sp)
 506  0002 7f            	clr	(x)
 507                     ; 333 }
 510  0003 81            	ret	
 549                     ; 341 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 549                     ; 342 {
 550                     .text:	section	.text,new
 551  0000               _FLASH_ProgramWord:
 553       00000000      OFST:	set	0
 556                     ; 344   assert_param(IS_FLASH_ADDRESS(Address));
 558                     ; 346   FLASH->CR2 |= FLASH_CR2_WPRG;
 560  0000 721c5051      	bset	20561,#6
 561                     ; 349   *((PointerAttr uint8_t*)(MemoryAddressCast)Address)       = *((uint8_t*)(&Data));   
 563  0004 1e05          	ldw	x,(OFST+5,sp)
 564  0006 7b07          	ld	a,(OFST+7,sp)
 565  0008 f7            	ld	(x),a
 566                     ; 351   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 568  0009 7b08          	ld	a,(OFST+8,sp)
 569  000b e701          	ld	(1,x),a
 570                     ; 353   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 572  000d 7b09          	ld	a,(OFST+9,sp)
 573  000f e702          	ld	(2,x),a
 574                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 576  0011 7b0a          	ld	a,(OFST+10,sp)
 577  0013 e703          	ld	(3,x),a
 578                     ; 356 }
 581  0015 81            	ret	
 613                     ; 363 uint8_t FLASH_ReadByte(uint32_t Address)
 613                     ; 364 {
 614                     .text:	section	.text,new
 615  0000               _FLASH_ReadByte:
 617       00000000      OFST:	set	0
 620                     ; 366   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 622  0000 1e05          	ldw	x,(OFST+5,sp)
 623  0002 f6            	ld	a,(x)
 626  0003 81            	ret	
 667                     ; 413 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 667                     ; 414 {
 668                     .text:	section	.text,new
 669  0000               _FLASH_ProgramOptionByte:
 671  0000 89            	pushw	x
 672       00000000      OFST:	set	0
 675                     ; 416   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 677                     ; 419   FLASH->CR2 |= FLASH_CR2_OPT;
 679  0001 721e5051      	bset	20561,#7
 680                     ; 422   *((PointerAttr uint8_t*)Address) = Data;
 682  0005 7b05          	ld	a,(OFST+5,sp)
 683  0007 f7            	ld	(x),a
 684                     ; 424   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 686  0008 a6fd          	ld	a,#253
 687  000a cd0000        	call	_FLASH_WaitForLastOperation
 689                     ; 427   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 691  000d 721f5051      	bres	20561,#7
 692                     ; 428 }
 695  0011 85            	popw	x
 696  0012 81            	ret	
 730                     ; 435 void FLASH_EraseOptionByte(uint16_t Address)
 730                     ; 436 {
 731                     .text:	section	.text,new
 732  0000               _FLASH_EraseOptionByte:
 736                     ; 438   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 738                     ; 441   FLASH->CR2 |= FLASH_CR2_OPT;
 740  0000 721e5051      	bset	20561,#7
 741                     ; 444   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 743  0004 7f            	clr	(x)
 744                     ; 446   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 746  0005 a6fd          	ld	a,#253
 747  0007 cd0000        	call	_FLASH_WaitForLastOperation
 749                     ; 449   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 751  000a 721f5051      	bres	20561,#7
 752                     ; 450 }
 755  000e 81            	ret	
 812                     ; 458 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 812                     ; 459 {
 813                     .text:	section	.text,new
 814  0000               _FLASH_GetReadOutProtectionStatus:
 816       00000001      OFST:	set	1
 819                     ; 460   FunctionalState state = DISABLE;
 821                     ; 462   if (OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 823  0000 c64800        	ld	a,18432
 824  0003 a1aa          	cp	a,#170
 825  0005 2603          	jrne	L523
 826                     ; 465     state =  ENABLE;
 828  0007 a601          	ld	a,#1
 832  0009 81            	ret	
 833  000a               L523:
 834                     ; 470     state =  DISABLE;
 836  000a 4f            	clr	a
 838                     ; 473   return state;
 842  000b 81            	ret	
 874                     ; 481 uint16_t FLASH_GetBootSize(void)
 874                     ; 482 {
 875                     .text:	section	.text,new
 876  0000               _FLASH_GetBootSize:
 878       00000002      OFST:	set	2
 881                     ; 483   uint16_t temp = 0;
 883                     ; 486   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 885  0000 c64802        	ld	a,18434
 886  0003 5f            	clrw	x
 887  0004 97            	ld	xl,a
 888  0005 4f            	clr	a
 889  0006 02            	rlwa	x,a
 890  0007 44            	srl	a
 891  0008 56            	rrcw	x
 893                     ; 489   if (OPT->UBC > 0x7F)
 895  0009 c64802        	ld	a,18434
 896  000c a180          	cp	a,#128
 897  000e 2503          	jrult	L543
 898                     ; 491     temp = 8192;
 900  0010 ae2000        	ldw	x,#8192
 902  0013               L543:
 903                     ; 495   return(temp);
 907  0013 81            	ret	
 939                     ; 505 uint16_t FLASH_GetCodeSize(void)
 939                     ; 506 {
 940                     .text:	section	.text,new
 941  0000               _FLASH_GetCodeSize:
 943       00000002      OFST:	set	2
 946                     ; 507   uint16_t temp = 0;
 948                     ; 510   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 950  0000 c64807        	ld	a,18439
 951  0003 5f            	clrw	x
 952  0004 97            	ld	xl,a
 953  0005 4f            	clr	a
 954  0006 02            	rlwa	x,a
 955  0007 44            	srl	a
 956  0008 56            	rrcw	x
 958                     ; 513   if (OPT->PCODESIZE > 0x7F)
 960  0009 c64807        	ld	a,18439
 961  000c a180          	cp	a,#128
 962  000e 2503          	jrult	L363
 963                     ; 515     temp = 8192;
 965  0010 ae2000        	ldw	x,#8192
 967  0013               L363:
 968                     ; 519   return(temp);
 972  0013 81            	ret	
1007                     ; 544 void FLASH_ITConfig(FunctionalState NewState)
1007                     ; 545 {
1008                     .text:	section	.text,new
1009  0000               _FLASH_ITConfig:
1013                     ; 548   assert_param(IS_FUNCTIONAL_STATE(NewState));
1015                     ; 550   if (NewState != DISABLE)
1017  0000 4d            	tnz	a
1018  0001 2705          	jreq	L304
1019                     ; 553     FLASH->CR1 |= FLASH_CR1_IE;
1021  0003 72125050      	bset	20560,#1
1024  0007 81            	ret	
1025  0008               L304:
1026                     ; 558     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1028  0008 72135050      	bres	20560,#1
1029                     ; 560 }
1032  000c 81            	ret	
1141                     ; 574 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1141                     ; 575 {
1142                     .text:	section	.text,new
1143  0000               _FLASH_GetFlagStatus:
1145       00000001      OFST:	set	1
1148                     ; 576   FlagStatus status = RESET;
1150                     ; 577   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1152                     ; 580   if ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1154  0000 c45054        	and	a,20564
1155  0003 2702          	jreq	L754
1156                     ; 582     status = SET; /* Flash_FLAG is set*/
1158  0005 a601          	ld	a,#1
1161  0007               L754:
1162                     ; 586     status = RESET; /* Flash_FLAG is reset*/
1165                     ; 590   return status;
1169  0007 81            	ret	
1205                     ; 706 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1205                     ; 707 {
1206                     .text:	section	.text,new
1207  0000               _FLASH_PowerRunModeConfig:
1211                     ; 709   assert_param(IS_FLASH_POWER(FLASH_Power));
1213                     ; 711   if (FLASH_Power != FLASH_Power_On)
1215  0000 4a            	dec	a
1216  0001 2705          	jreq	L105
1217                     ; 713   FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1219  0003 72165050      	bset	20560,#3
1222  0007 81            	ret	
1223  0008               L105:
1224                     ; 717     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1226  0008 72175050      	bres	20560,#3
1227                     ; 719 }
1230  000c 81            	ret	
1294                     ; 732 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1294                     ; 733 {
1295                     .text:	section	.text,new
1296  0000               _FLASH_GetPowerStatus:
1300                     ; 734   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1302  0000 c65050        	ld	a,20560
1303  0003 a40c          	and	a,#12
1306  0005 81            	ret	
1404                     ; 752 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1404                     ; 753                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1404                     ; 754 {
1405                     .text:	section	.text,new
1406  0000               _FLASH_ProgramBlock:
1408  0000 89            	pushw	x
1409  0001 5206          	subw	sp,#6
1410       00000006      OFST:	set	6
1413                     ; 755   uint16_t Count = 0;
1415                     ; 756   uint32_t startaddress = 0;
1417                     ; 759   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1419                     ; 760   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1421                     ; 761   if (FLASH_MemType == FLASH_MemType_Program)
1423  0003 7b0b          	ld	a,(OFST+5,sp)
1424  0005 a1fd          	cp	a,#253
1425  0007 2605          	jrne	L575
1426                     ; 763   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1428                     ; 764     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1430  0009 ae8000        	ldw	x,#32768
1432  000c 2003          	jra	L775
1433  000e               L575:
1434                     ; 768     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1436                     ; 769     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1438  000e ae1000        	ldw	x,#4096
1439  0011               L775:
1440  0011 1f03          	ldw	(OFST-3,sp),x
1441  0013 5f            	clrw	x
1442  0014 1f01          	ldw	(OFST-5,sp),x
1444                     ; 773   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1446  0016 a680          	ld	a,#128
1447  0018 1e07          	ldw	x,(OFST+1,sp)
1448  001a cd0000        	call	c_cmulx
1450  001d 96            	ldw	x,sp
1451  001e 5c            	incw	x
1452  001f cd0000        	call	c_lgadd
1455                     ; 776   if (FLASH_ProgMode == FLASH_ProgramMode_Standard)
1457  0022 7b0c          	ld	a,(OFST+6,sp)
1458  0024 2606          	jrne	L106
1459                     ; 779   FLASH->CR2 |= FLASH_CR2_PRG;
1461  0026 72105051      	bset	20561,#0
1463  002a 2004          	jra	L306
1464  002c               L106:
1465                     ; 784   FLASH->CR2 |= FLASH_CR2_FPRG;
1467  002c 72185051      	bset	20561,#4
1468  0030               L306:
1469                     ; 788   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1471  0030 5f            	clrw	x
1472  0031 1f05          	ldw	(OFST-1,sp),x
1474  0033               L506:
1475                     ; 790     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1477  0033 1e0d          	ldw	x,(OFST+7,sp)
1478  0035 72fb05        	addw	x,(OFST-1,sp)
1479  0038 f6            	ld	a,(x)
1480  0039 1e03          	ldw	x,(OFST-3,sp)
1481  003b 72fb05        	addw	x,(OFST-1,sp)
1482  003e f7            	ld	(x),a
1483                     ; 788   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1485  003f 1e05          	ldw	x,(OFST-1,sp)
1486  0041 5c            	incw	x
1487  0042 1f05          	ldw	(OFST-1,sp),x
1491  0044 a30080        	cpw	x,#128
1492  0047 25ea          	jrult	L506
1493                     ; 792 }
1496  0049 5b08          	addw	sp,#8
1497  004b 81            	ret	
1556                     ; 804 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1556                     ; 805 {
1557                     .text:	section	.text,new
1558  0000               _FLASH_EraseBlock:
1560  0000 89            	pushw	x
1561  0001 5206          	subw	sp,#6
1562       00000006      OFST:	set	6
1565                     ; 806   uint32_t startaddress = 0;
1567                     ; 816   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1569                     ; 817   if (FLASH_MemType == FLASH_MemType_Program)
1571  0003 7b0b          	ld	a,(OFST+5,sp)
1572  0005 a1fd          	cp	a,#253
1573  0007 2605          	jrne	L146
1574                     ; 819   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1576                     ; 820     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1578  0009 ae8000        	ldw	x,#32768
1580  000c 2003          	jra	L346
1581  000e               L146:
1582                     ; 824     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1584                     ; 825     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1586  000e ae1000        	ldw	x,#4096
1587  0011               L346:
1588  0011 1f05          	ldw	(OFST-1,sp),x
1589  0013 5f            	clrw	x
1590  0014 1f03          	ldw	(OFST-3,sp),x
1592                     ; 831   pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1594  0016 a680          	ld	a,#128
1595  0018 1e07          	ldw	x,(OFST+1,sp)
1596  001a cd0000        	call	c_cmulx
1598  001d 96            	ldw	x,sp
1599  001e 1c0003        	addw	x,#OFST-3
1600  0021 cd0000        	call	c_ladd
1602  0024 be02          	ldw	x,c_lreg+2
1603  0026 1f01          	ldw	(OFST-5,sp),x
1605                     ; 838   FLASH->CR2 |= FLASH_CR2_ERASE;
1607  0028 721a5051      	bset	20561,#5
1608                     ; 842   *pwFlash = (uint32_t)0;  
1610  002c 4f            	clr	a
1611  002d e703          	ld	(3,x),a
1612  002f e702          	ld	(2,x),a
1613  0031 e701          	ld	(1,x),a
1614  0033 f7            	ld	(x),a
1615                     ; 850 }
1618  0034 5b08          	addw	sp,#8
1619  0036 81            	ret	
1700                     ; 862 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1700                     ; 863 {
1701                     .text:	section	.text,new
1702  0000               _FLASH_WaitForLastOperation:
1704  0000 5205          	subw	sp,#5
1705       00000005      OFST:	set	5
1708                     ; 864   uint32_t timeout = OPERATION_TIMEOUT;
1710  0002 aeffff        	ldw	x,#65535
1711  0005 1f03          	ldw	(OFST-2,sp),x
1712  0007 5f            	clrw	x
1713  0008 1f01          	ldw	(OFST-4,sp),x
1715                     ; 865   uint8_t flagstatus = 0x00;
1717  000a 0f05          	clr	(OFST+0,sp)
1719                     ; 867   if (FLASH_MemType == FLASH_MemType_Program)
1721  000c a1fd          	cp	a,#253
1722  000e 262b          	jrne	L717
1724  0010 200e          	jra	L507
1725  0012               L307:
1726                     ; 871       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1726                     ; 872                              FLASH_IAPSR_WR_PG_DIS));
1728  0012 c65054        	ld	a,20564
1729  0015 a405          	and	a,#5
1730  0017 6b05          	ld	(OFST+0,sp),a
1732                     ; 873       timeout--;
1734  0019 96            	ldw	x,sp
1735  001a 5c            	incw	x
1736  001b a601          	ld	a,#1
1737  001d cd0000        	call	c_lgsbc
1740  0020               L507:
1741                     ; 869   while ((flagstatus == 0x00) && (timeout != 0x00))
1743  0020 7b05          	ld	a,(OFST+0,sp)
1744  0022 2622          	jrne	L317
1746  0024 96            	ldw	x,sp
1747  0025 5c            	incw	x
1748  0026 cd0000        	call	c_lzmp
1750  0029 26e7          	jrne	L307
1751  002b 2019          	jra	L317
1752  002d               L517:
1753                     ; 880       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1753                     ; 881                              FLASH_IAPSR_WR_PG_DIS));
1755  002d c65054        	ld	a,20564
1756  0030 a441          	and	a,#65
1757  0032 6b05          	ld	(OFST+0,sp),a
1759                     ; 882       timeout--;
1761  0034 96            	ldw	x,sp
1762  0035 5c            	incw	x
1763  0036 a601          	ld	a,#1
1764  0038 cd0000        	call	c_lgsbc
1767  003b               L717:
1768                     ; 878     while ((flagstatus == 0x00) && (timeout != 0x00))
1770  003b 7b05          	ld	a,(OFST+0,sp)
1771  003d 2607          	jrne	L317
1773  003f 96            	ldw	x,sp
1774  0040 5c            	incw	x
1775  0041 cd0000        	call	c_lzmp
1777  0044 26e7          	jrne	L517
1778  0046               L317:
1779                     ; 885   if (timeout == 0x00 )
1781  0046 96            	ldw	x,sp
1782  0047 5c            	incw	x
1783  0048 cd0000        	call	c_lzmp
1785  004b 2604          	jrne	L527
1786                     ; 887   flagstatus = FLASH_Status_TimeOut;
1788  004d a602          	ld	a,#2
1789  004f 6b05          	ld	(OFST+0,sp),a
1791  0051               L527:
1792                     ; 890   return((FLASH_Status_TypeDef)flagstatus);
1794  0051 7b05          	ld	a,(OFST+0,sp)
1797  0053 5b05          	addw	sp,#5
1798  0055 81            	ret	
1811                     	xdef	_FLASH_WaitForLastOperation
1812                     	xdef	_FLASH_EraseBlock
1813                     	xdef	_FLASH_ProgramBlock
1814                     	xdef	_FLASH_GetPowerStatus
1815                     	xdef	_FLASH_PowerRunModeConfig
1816                     	xdef	_FLASH_GetFlagStatus
1817                     	xdef	_FLASH_ITConfig
1818                     	xdef	_FLASH_EraseOptionByte
1819                     	xdef	_FLASH_ProgramOptionByte
1820                     	xdef	_FLASH_GetReadOutProtectionStatus
1821                     	xdef	_FLASH_GetCodeSize
1822                     	xdef	_FLASH_GetBootSize
1823                     	xdef	_FLASH_ReadByte
1824                     	xdef	_FLASH_ProgramWord
1825                     	xdef	_FLASH_EraseByte
1826                     	xdef	_FLASH_ProgramByte
1827                     	xdef	_FLASH_Lock
1828                     	xdef	_FLASH_Unlock
1829                     	xdef	_FLASH_DeInit
1830                     	xdef	_FLASH_PowerWaitModeConfig
1831                     	xdef	_FLASH_SetProgrammingTime
1832                     	xdef	_FLASH_GetProgrammingTime
1833                     	xref.b	c_lreg
1852                     	xref	c_lzmp
1853                     	xref	c_lgsbc
1854                     	xref	c_ladd
1855                     	xref	c_lgadd
1856                     	xref	c_cmulx
1857                     	end
