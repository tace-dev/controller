   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  82                     ; 171 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
  82                     ; 172 {
  84                     .text:	section	.text,new
  85  0000               _FLASH_SetProgrammingTime:
  89                     ; 174   assert_param(IS_FLASH_PROGRAM_TIME(FLASH_ProgTime));
  91                     ; 176   FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
  93  0000 72115050      	bres	20560,#0
  94                     ; 177   FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
  96  0004 ca5050        	or	a,20560
  97  0007 c75050        	ld	20560,a
  98                     ; 178 }
 101  000a 81            	ret
 126                     ; 185 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
 126                     ; 186 {
 127                     .text:	section	.text,new
 128  0000               _FLASH_GetProgrammingTime:
 132                     ; 187   return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
 134  0000 c65050        	ld	a,20560
 135  0003 a401          	and	a,#1
 138  0005 81            	ret
 194                     ; 200 void FLASH_PowerWaitModeConfig(FLASH_Power_TypeDef FLASH_Power)
 194                     ; 201 {
 195                     .text:	section	.text,new
 196  0000               _FLASH_PowerWaitModeConfig:
 200                     ; 203   assert_param(IS_FLASH_POWER(FLASH_Power));
 202                     ; 206   if (FLASH_Power != FLASH_Power_On)
 204  0000 a101          	cp	a,#1
 205  0002 2706          	jreq	L57
 206                     ; 208     FLASH->CR1 |= (uint8_t)FLASH_CR1_WAITM;
 208  0004 72145050      	bset	20560,#2
 210  0008 2004          	jra	L77
 211  000a               L57:
 212                     ; 213     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_WAITM);
 214  000a 72155050      	bres	20560,#2
 215  000e               L77:
 216                     ; 215 }
 219  000e 81            	ret
 242                     ; 256 void FLASH_DeInit(void)
 242                     ; 257 {
 243                     .text:	section	.text,new
 244  0000               _FLASH_DeInit:
 248                     ; 258   FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 250  0000 725f5050      	clr	20560
 251                     ; 259   FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 253  0004 725f5051      	clr	20561
 254                     ; 260   FLASH->IAPSR = FLASH_IAPSR_RESET_VALUE;
 256  0008 35405054      	mov	20564,#64
 257                     ; 261   (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 259  000c c65054        	ld	a,20564
 260                     ; 262 }
 263  000f 81            	ret
 319                     ; 272 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
 319                     ; 273 {
 320                     .text:	section	.text,new
 321  0000               _FLASH_Unlock:
 323  0000 88            	push	a
 324       00000000      OFST:	set	0
 327                     ; 275   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
 329                     ; 278   if (FLASH_MemType == FLASH_MemType_Program)
 331  0001 a1fd          	cp	a,#253
 332  0003 2608          	jrne	L731
 333                     ; 280     FLASH->PUKR = FLASH_RASS_KEY1;
 335  0005 35565052      	mov	20562,#86
 336                     ; 281     FLASH->PUKR = FLASH_RASS_KEY2;
 338  0009 35ae5052      	mov	20562,#174
 339  000d               L731:
 340                     ; 285   if (FLASH_MemType == FLASH_MemType_Data)
 342  000d 7b01          	ld	a,(OFST+1,sp)
 343  000f a1f7          	cp	a,#247
 344  0011 2608          	jrne	L141
 345                     ; 287     FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 347  0013 35ae5053      	mov	20563,#174
 348                     ; 288     FLASH->DUKR = FLASH_RASS_KEY1;
 350  0017 35565053      	mov	20563,#86
 351  001b               L141:
 352                     ; 290 }
 355  001b 84            	pop	a
 356  001c 81            	ret
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
 456  0000 7b07          	ld	a,(OFST+7,sp)
 457  0002 1e05          	ldw	x,(OFST+5,sp)
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
 563  0004 7b07          	ld	a,(OFST+7,sp)
 564  0006 1e05          	ldw	x,(OFST+5,sp)
 565  0008 f7            	ld	(x),a
 566                     ; 351   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 1) = *((uint8_t*)(&Data) + 1);
 568  0009 7b08          	ld	a,(OFST+8,sp)
 569  000b 1e05          	ldw	x,(OFST+5,sp)
 570  000d e701          	ld	(1,x),a
 571                     ; 353   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 2) = *((uint8_t*)(&Data) + 2); 
 573  000f 7b09          	ld	a,(OFST+9,sp)
 574  0011 1e05          	ldw	x,(OFST+5,sp)
 575  0013 e702          	ld	(2,x),a
 576                     ; 355   *(((PointerAttr uint8_t*)(MemoryAddressCast)Address) + 3) = *((uint8_t*)(&Data) + 3); 
 578  0015 7b0a          	ld	a,(OFST+10,sp)
 579  0017 1e05          	ldw	x,(OFST+5,sp)
 580  0019 e703          	ld	(3,x),a
 581                     ; 356 }
 584  001b 81            	ret
 616                     ; 363 uint8_t FLASH_ReadByte(uint32_t Address)
 616                     ; 364 {
 617                     .text:	section	.text,new
 618  0000               _FLASH_ReadByte:
 620       00000000      OFST:	set	0
 623                     ; 366   return(*(PointerAttr uint8_t *) (MemoryAddressCast)Address);
 625  0000 1e05          	ldw	x,(OFST+5,sp)
 626  0002 f6            	ld	a,(x)
 629  0003 81            	ret
 670                     ; 413 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 670                     ; 414 {
 671                     .text:	section	.text,new
 672  0000               _FLASH_ProgramOptionByte:
 674  0000 89            	pushw	x
 675       00000000      OFST:	set	0
 678                     ; 416   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 680                     ; 419   FLASH->CR2 |= FLASH_CR2_OPT;
 682  0001 721e5051      	bset	20561,#7
 683                     ; 422   *((PointerAttr uint8_t*)Address) = Data;
 685  0005 7b05          	ld	a,(OFST+5,sp)
 686  0007 1e01          	ldw	x,(OFST+1,sp)
 687  0009 f7            	ld	(x),a
 688                     ; 424   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 690  000a a6fd          	ld	a,#253
 691  000c cd0000        	call	_FLASH_WaitForLastOperation
 693                     ; 427   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 695  000f 721f5051      	bres	20561,#7
 696                     ; 428 }
 699  0013 85            	popw	x
 700  0014 81            	ret
 734                     ; 435 void FLASH_EraseOptionByte(uint16_t Address)
 734                     ; 436 {
 735                     .text:	section	.text,new
 736  0000               _FLASH_EraseOptionByte:
 740                     ; 438   assert_param(IS_OPTION_BYTE_ADDRESS(Address));
 742                     ; 441   FLASH->CR2 |= FLASH_CR2_OPT;
 744  0000 721e5051      	bset	20561,#7
 745                     ; 444   *((PointerAttr uint8_t*)Address) = FLASH_CLEAR_BYTE;
 747  0004 7f            	clr	(x)
 748                     ; 446   FLASH_WaitForLastOperation(FLASH_MemType_Program);
 750  0005 a6fd          	ld	a,#253
 751  0007 cd0000        	call	_FLASH_WaitForLastOperation
 753                     ; 449   FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 755  000a 721f5051      	bres	20561,#7
 756                     ; 450 }
 759  000e 81            	ret
 816                     ; 458 FunctionalState FLASH_GetReadOutProtectionStatus(void)
 816                     ; 459 {
 817                     .text:	section	.text,new
 818  0000               _FLASH_GetReadOutProtectionStatus:
 820  0000 88            	push	a
 821       00000001      OFST:	set	1
 824                     ; 460   FunctionalState state = DISABLE;
 826                     ; 462   if (OPT->ROP == FLASH_READOUTPROTECTION_KEY)
 828  0001 c64800        	ld	a,18432
 829  0004 a1aa          	cp	a,#170
 830  0006 2606          	jrne	L523
 831                     ; 465     state =  ENABLE;
 833  0008 a601          	ld	a,#1
 834  000a 6b01          	ld	(OFST+0,sp),a
 836  000c 2002          	jra	L723
 837  000e               L523:
 838                     ; 470     state =  DISABLE;
 840  000e 0f01          	clr	(OFST+0,sp)
 841  0010               L723:
 842                     ; 473   return state;
 844  0010 7b01          	ld	a,(OFST+0,sp)
 847  0012 5b01          	addw	sp,#1
 848  0014 81            	ret
 880                     ; 481 uint16_t FLASH_GetBootSize(void)
 880                     ; 482 {
 881                     .text:	section	.text,new
 882  0000               _FLASH_GetBootSize:
 884  0000 89            	pushw	x
 885       00000002      OFST:	set	2
 888                     ; 483   uint16_t temp = 0;
 890                     ; 486   temp = (uint16_t)((uint16_t)OPT->UBC * (uint16_t)128);
 892  0001 c64802        	ld	a,18434
 893  0004 5f            	clrw	x
 894  0005 97            	ld	xl,a
 895  0006 4f            	clr	a
 896  0007 02            	rlwa	x,a
 897  0008 44            	srl	a
 898  0009 56            	rrcw	x
 899  000a 1f01          	ldw	(OFST-1,sp),x
 900                     ; 489   if (OPT->UBC > 0x7F)
 902  000c c64802        	ld	a,18434
 903  000f a180          	cp	a,#128
 904  0011 2505          	jrult	L543
 905                     ; 491     temp = 8192;
 907  0013 ae2000        	ldw	x,#8192
 908  0016 1f01          	ldw	(OFST-1,sp),x
 909  0018               L543:
 910                     ; 495   return(temp);
 912  0018 1e01          	ldw	x,(OFST-1,sp)
 915  001a 5b02          	addw	sp,#2
 916  001c 81            	ret
 948                     ; 505 uint16_t FLASH_GetCodeSize(void)
 948                     ; 506 {
 949                     .text:	section	.text,new
 950  0000               _FLASH_GetCodeSize:
 952  0000 89            	pushw	x
 953       00000002      OFST:	set	2
 956                     ; 507   uint16_t temp = 0;
 958                     ; 510   temp = (uint16_t)((uint16_t)OPT->PCODESIZE * (uint16_t)128);
 960  0001 c64807        	ld	a,18439
 961  0004 5f            	clrw	x
 962  0005 97            	ld	xl,a
 963  0006 4f            	clr	a
 964  0007 02            	rlwa	x,a
 965  0008 44            	srl	a
 966  0009 56            	rrcw	x
 967  000a 1f01          	ldw	(OFST-1,sp),x
 968                     ; 513   if (OPT->PCODESIZE > 0x7F)
 970  000c c64807        	ld	a,18439
 971  000f a180          	cp	a,#128
 972  0011 2505          	jrult	L363
 973                     ; 515     temp = 8192;
 975  0013 ae2000        	ldw	x,#8192
 976  0016 1f01          	ldw	(OFST-1,sp),x
 977  0018               L363:
 978                     ; 519   return(temp);
 980  0018 1e01          	ldw	x,(OFST-1,sp)
 983  001a 5b02          	addw	sp,#2
 984  001c 81            	ret
1019                     ; 544 void FLASH_ITConfig(FunctionalState NewState)
1019                     ; 545 {
1020                     .text:	section	.text,new
1021  0000               _FLASH_ITConfig:
1025                     ; 548   assert_param(IS_FUNCTIONAL_STATE(NewState));
1027                     ; 550   if (NewState != DISABLE)
1029  0000 4d            	tnz	a
1030  0001 2706          	jreq	L304
1031                     ; 553     FLASH->CR1 |= FLASH_CR1_IE;
1033  0003 72125050      	bset	20560,#1
1035  0007 2004          	jra	L504
1036  0009               L304:
1037                     ; 558     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE);
1039  0009 72135050      	bres	20560,#1
1040  000d               L504:
1041                     ; 560 }
1044  000d 81            	ret
1153                     ; 574 FlagStatus FLASH_GetFlagStatus(FLASH_FLAG_TypeDef FLASH_FLAG)
1153                     ; 575 {
1154                     .text:	section	.text,new
1155  0000               _FLASH_GetFlagStatus:
1157  0000 88            	push	a
1158       00000001      OFST:	set	1
1161                     ; 576   FlagStatus status = RESET;
1163                     ; 577   assert_param(IS_FLASH_FLAGS(FLASH_FLAG));
1165                     ; 580   if ((FLASH->IAPSR  & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1167  0001 c45054        	and	a,20564
1168  0004 2706          	jreq	L754
1169                     ; 582     status = SET; /* Flash_FLAG is set*/
1171  0006 a601          	ld	a,#1
1172  0008 6b01          	ld	(OFST+0,sp),a
1174  000a 2002          	jra	L164
1175  000c               L754:
1176                     ; 586     status = RESET; /* Flash_FLAG is reset*/
1178  000c 0f01          	clr	(OFST+0,sp)
1179  000e               L164:
1180                     ; 590   return status;
1182  000e 7b01          	ld	a,(OFST+0,sp)
1185  0010 5b01          	addw	sp,#1
1186  0012 81            	ret
1222                     ; 706 IN_RAM(void FLASH_PowerRunModeConfig(FLASH_Power_TypeDef FLASH_Power))
1222                     ; 707 {
1223                     .text:	section	.text,new
1224  0000               _FLASH_PowerRunModeConfig:
1228                     ; 709   assert_param(IS_FLASH_POWER(FLASH_Power));
1230                     ; 711   if (FLASH_Power != FLASH_Power_On)
1232  0000 a101          	cp	a,#1
1233  0002 2706          	jreq	L105
1234                     ; 713   FLASH->CR1 |= (uint8_t)FLASH_CR1_EEPM;
1236  0004 72165050      	bset	20560,#3
1238  0008 2004          	jra	L305
1239  000a               L105:
1240                     ; 717     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_EEPM);
1242  000a 72175050      	bres	20560,#3
1243  000e               L305:
1244                     ; 719 }
1247  000e 81            	ret
1311                     ; 732 IN_RAM(FLASH_PowerStatus_TypeDef FLASH_GetPowerStatus(void))
1311                     ; 733 {
1312                     .text:	section	.text,new
1313  0000               _FLASH_GetPowerStatus:
1317                     ; 734   return((FLASH_PowerStatus_TypeDef)(FLASH->CR1 & (uint8_t)0x0C));
1319  0000 c65050        	ld	a,20560
1320  0003 a40c          	and	a,#12
1323  0005 81            	ret
1421                     ; 752 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType,
1421                     ; 753                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1421                     ; 754 {
1422                     .text:	section	.text,new
1423  0000               _FLASH_ProgramBlock:
1425  0000 89            	pushw	x
1426  0001 5206          	subw	sp,#6
1427       00000006      OFST:	set	6
1430                     ; 755   uint16_t Count = 0;
1432                     ; 756   uint32_t startaddress = 0;
1434                     ; 759   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1436                     ; 760   assert_param(IS_FLASH_PROGRAM_MODE(FLASH_ProgMode));
1438                     ; 761   if (FLASH_MemType == FLASH_MemType_Program)
1440  0003 7b0b          	ld	a,(OFST+5,sp)
1441  0005 a1fd          	cp	a,#253
1442  0007 260c          	jrne	L575
1443                     ; 763   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1445                     ; 764     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1447  0009 ae8000        	ldw	x,#32768
1448  000c 1f03          	ldw	(OFST-3,sp),x
1449  000e ae0000        	ldw	x,#0
1450  0011 1f01          	ldw	(OFST-5,sp),x
1452  0013 200a          	jra	L775
1453  0015               L575:
1454                     ; 768     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1456                     ; 769     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1458  0015 ae1000        	ldw	x,#4096
1459  0018 1f03          	ldw	(OFST-3,sp),x
1460  001a ae0000        	ldw	x,#0
1461  001d 1f01          	ldw	(OFST-5,sp),x
1462  001f               L775:
1463                     ; 773   startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1465  001f 1e07          	ldw	x,(OFST+1,sp)
1466  0021 a680          	ld	a,#128
1467  0023 cd0000        	call	c_cmulx
1469  0026 96            	ldw	x,sp
1470  0027 1c0001        	addw	x,#OFST-5
1471  002a cd0000        	call	c_lgadd
1473                     ; 776   if (FLASH_ProgMode == FLASH_ProgramMode_Standard)
1475  002d 0d0c          	tnz	(OFST+6,sp)
1476  002f 2606          	jrne	L106
1477                     ; 779   FLASH->CR2 |= FLASH_CR2_PRG;
1479  0031 72105051      	bset	20561,#0
1481  0035 2004          	jra	L306
1482  0037               L106:
1483                     ; 784   FLASH->CR2 |= FLASH_CR2_FPRG;
1485  0037 72185051      	bset	20561,#4
1486  003b               L306:
1487                     ; 788   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1489  003b 5f            	clrw	x
1490  003c 1f05          	ldw	(OFST-1,sp),x
1491  003e               L506:
1492                     ; 790     *((PointerAttr uint8_t*) (MemoryAddressCast)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1494  003e 1e0d          	ldw	x,(OFST+7,sp)
1495  0040 72fb05        	addw	x,(OFST-1,sp)
1496  0043 f6            	ld	a,(x)
1497  0044 1e03          	ldw	x,(OFST-3,sp)
1498  0046 72fb05        	addw	x,(OFST-1,sp)
1499  0049 f7            	ld	(x),a
1500                     ; 788   for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1502  004a 1e05          	ldw	x,(OFST-1,sp)
1503  004c 1c0001        	addw	x,#1
1504  004f 1f05          	ldw	(OFST-1,sp),x
1507  0051 1e05          	ldw	x,(OFST-1,sp)
1508  0053 a30080        	cpw	x,#128
1509  0056 25e6          	jrult	L506
1510                     ; 792 }
1513  0058 5b08          	addw	sp,#8
1514  005a 81            	ret
1573                     ; 804 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1573                     ; 805 {
1574                     .text:	section	.text,new
1575  0000               _FLASH_EraseBlock:
1577  0000 89            	pushw	x
1578  0001 5206          	subw	sp,#6
1579       00000006      OFST:	set	6
1582                     ; 806   uint32_t startaddress = 0;
1584                     ; 816   assert_param(IS_FLASH_MEMORY_TYPE(FLASH_MemType));
1586                     ; 817   if (FLASH_MemType == FLASH_MemType_Program)
1588  0003 7b0b          	ld	a,(OFST+5,sp)
1589  0005 a1fd          	cp	a,#253
1590  0007 260c          	jrne	L146
1591                     ; 819   assert_param(IS_FLASH_PROGRAM_BLOCK_NUMBER(BlockNum));
1593                     ; 820     startaddress = FLASH_PROGRAM_START_PHYSICAL_ADDRESS;
1595  0009 ae8000        	ldw	x,#32768
1596  000c 1f05          	ldw	(OFST-1,sp),x
1597  000e ae0000        	ldw	x,#0
1598  0011 1f03          	ldw	(OFST-3,sp),x
1600  0013 200a          	jra	L346
1601  0015               L146:
1602                     ; 824     assert_param(IS_FLASH_DATA_EEPROM_BLOCK_NUMBER(BlockNum));
1604                     ; 825     startaddress = FLASH_DATA_EEPROM_START_PHYSICAL_ADDRESS;
1606  0015 ae1000        	ldw	x,#4096
1607  0018 1f05          	ldw	(OFST-1,sp),x
1608  001a ae0000        	ldw	x,#0
1609  001d 1f03          	ldw	(OFST-3,sp),x
1610  001f               L346:
1611                     ; 831   pwFlash = (PointerAttr uint32_t *)(uint16_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1613  001f 1e07          	ldw	x,(OFST+1,sp)
1614  0021 a680          	ld	a,#128
1615  0023 cd0000        	call	c_cmulx
1617  0026 96            	ldw	x,sp
1618  0027 1c0003        	addw	x,#OFST-3
1619  002a cd0000        	call	c_ladd
1621  002d be02          	ldw	x,c_lreg+2
1622  002f 1f01          	ldw	(OFST-5,sp),x
1623                     ; 838   FLASH->CR2 |= FLASH_CR2_ERASE;
1625  0031 721a5051      	bset	20561,#5
1626                     ; 842   *pwFlash = (uint32_t)0;  
1628  0035 1e01          	ldw	x,(OFST-5,sp)
1629  0037 a600          	ld	a,#0
1630  0039 e703          	ld	(3,x),a
1631  003b a600          	ld	a,#0
1632  003d e702          	ld	(2,x),a
1633  003f a600          	ld	a,#0
1634  0041 e701          	ld	(1,x),a
1635  0043 a600          	ld	a,#0
1636  0045 f7            	ld	(x),a
1637                     ; 850 }
1640  0046 5b08          	addw	sp,#8
1641  0048 81            	ret
1722                     ; 862 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType))
1722                     ; 863 {
1723                     .text:	section	.text,new
1724  0000               _FLASH_WaitForLastOperation:
1726  0000 5205          	subw	sp,#5
1727       00000005      OFST:	set	5
1730                     ; 864   uint32_t timeout = OPERATION_TIMEOUT;
1732  0002 aeffff        	ldw	x,#65535
1733  0005 1f03          	ldw	(OFST-2,sp),x
1734  0007 ae0000        	ldw	x,#0
1735  000a 1f01          	ldw	(OFST-4,sp),x
1736                     ; 865   uint8_t flagstatus = 0x00;
1738  000c 0f05          	clr	(OFST+0,sp)
1739                     ; 867   if (FLASH_MemType == FLASH_MemType_Program)
1741  000e a1fd          	cp	a,#253
1742  0010 2631          	jrne	L717
1744  0012 2010          	jra	L507
1745  0014               L307:
1746                     ; 871       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1746                     ; 872                              FLASH_IAPSR_WR_PG_DIS));
1748  0014 c65054        	ld	a,20564
1749  0017 a405          	and	a,#5
1750  0019 6b05          	ld	(OFST+0,sp),a
1751                     ; 873       timeout--;
1753  001b 96            	ldw	x,sp
1754  001c 1c0001        	addw	x,#OFST-4
1755  001f a601          	ld	a,#1
1756  0021 cd0000        	call	c_lgsbc
1758  0024               L507:
1759                     ; 869   while ((flagstatus == 0x00) && (timeout != 0x00))
1761  0024 0d05          	tnz	(OFST+0,sp)
1762  0026 2628          	jrne	L317
1764  0028 96            	ldw	x,sp
1765  0029 1c0001        	addw	x,#OFST-4
1766  002c cd0000        	call	c_lzmp
1768  002f 26e3          	jrne	L307
1769  0031 201d          	jra	L317
1770  0033               L517:
1771                     ; 880       flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1771                     ; 881                              FLASH_IAPSR_WR_PG_DIS));
1773  0033 c65054        	ld	a,20564
1774  0036 a441          	and	a,#65
1775  0038 6b05          	ld	(OFST+0,sp),a
1776                     ; 882       timeout--;
1778  003a 96            	ldw	x,sp
1779  003b 1c0001        	addw	x,#OFST-4
1780  003e a601          	ld	a,#1
1781  0040 cd0000        	call	c_lgsbc
1783  0043               L717:
1784                     ; 878     while ((flagstatus == 0x00) && (timeout != 0x00))
1786  0043 0d05          	tnz	(OFST+0,sp)
1787  0045 2609          	jrne	L317
1789  0047 96            	ldw	x,sp
1790  0048 1c0001        	addw	x,#OFST-4
1791  004b cd0000        	call	c_lzmp
1793  004e 26e3          	jrne	L517
1794  0050               L317:
1795                     ; 885   if (timeout == 0x00 )
1797  0050 96            	ldw	x,sp
1798  0051 1c0001        	addw	x,#OFST-4
1799  0054 cd0000        	call	c_lzmp
1801  0057 2604          	jrne	L527
1802                     ; 887   flagstatus = FLASH_Status_TimeOut;
1804  0059 a602          	ld	a,#2
1805  005b 6b05          	ld	(OFST+0,sp),a
1806  005d               L527:
1807                     ; 890   return((FLASH_Status_TypeDef)flagstatus);
1809  005d 7b05          	ld	a,(OFST+0,sp)
1812  005f 5b05          	addw	sp,#5
1813  0061 81            	ret
1826                     	xdef	_FLASH_WaitForLastOperation
1827                     	xdef	_FLASH_EraseBlock
1828                     	xdef	_FLASH_ProgramBlock
1829                     	xdef	_FLASH_GetPowerStatus
1830                     	xdef	_FLASH_PowerRunModeConfig
1831                     	xdef	_FLASH_GetFlagStatus
1832                     	xdef	_FLASH_ITConfig
1833                     	xdef	_FLASH_EraseOptionByte
1834                     	xdef	_FLASH_ProgramOptionByte
1835                     	xdef	_FLASH_GetReadOutProtectionStatus
1836                     	xdef	_FLASH_GetCodeSize
1837                     	xdef	_FLASH_GetBootSize
1838                     	xdef	_FLASH_ReadByte
1839                     	xdef	_FLASH_ProgramWord
1840                     	xdef	_FLASH_EraseByte
1841                     	xdef	_FLASH_ProgramByte
1842                     	xdef	_FLASH_Lock
1843                     	xdef	_FLASH_Unlock
1844                     	xdef	_FLASH_DeInit
1845                     	xdef	_FLASH_PowerWaitModeConfig
1846                     	xdef	_FLASH_SetProgrammingTime
1847                     	xdef	_FLASH_GetProgrammingTime
1848                     	xref.b	c_lreg
1867                     	xref	c_lzmp
1868                     	xref	c_lgsbc
1869                     	xref	c_ladd
1870                     	xref	c_lgadd
1871                     	xref	c_cmulx
1872                     	end
