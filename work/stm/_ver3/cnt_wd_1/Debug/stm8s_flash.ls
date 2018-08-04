   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  83                     ; 81 void FLASH_Unlock(FLASH_MemType_TypeDef FLASH_MemType)
  83                     ; 82 {
  85                     .text:	section	.text,new
  86  0000               _FLASH_Unlock:
  90                     ; 84     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
  92                     ; 87     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
  94  0000 a1fd          	cp	a,#253
  95  0002 2609          	jrne	L73
  96                     ; 89         FLASH->PUKR = FLASH_RASS_KEY1;
  98  0004 35565062      	mov	20578,#86
  99                     ; 90         FLASH->PUKR = FLASH_RASS_KEY2;
 101  0008 35ae5062      	mov	20578,#174
 104  000c 81            	ret	
 105  000d               L73:
 106                     ; 95         FLASH->DUKR = FLASH_RASS_KEY2; /* Warning: keys are reversed on data memory !!! */
 108  000d 35ae5064      	mov	20580,#174
 109                     ; 96         FLASH->DUKR = FLASH_RASS_KEY1;
 111  0011 35565064      	mov	20580,#86
 112                     ; 98 }
 115  0015 81            	ret	
 150                     ; 106 void FLASH_Lock(FLASH_MemType_TypeDef FLASH_MemType)
 150                     ; 107 {
 151                     .text:	section	.text,new
 152  0000               _FLASH_Lock:
 156                     ; 109     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
 158                     ; 112   FLASH->IAPSR &= (uint8_t)FLASH_MemType;
 160  0000 c4505f        	and	a,20575
 161  0003 c7505f        	ld	20575,a
 162                     ; 113 }
 165  0006 81            	ret	
 188                     ; 120 void FLASH_DeInit(void)
 188                     ; 121 {
 189                     .text:	section	.text,new
 190  0000               _FLASH_DeInit:
 194                     ; 122     FLASH->CR1 = FLASH_CR1_RESET_VALUE;
 196  0000 725f505a      	clr	20570
 197                     ; 123     FLASH->CR2 = FLASH_CR2_RESET_VALUE;
 199  0004 725f505b      	clr	20571
 200                     ; 124     FLASH->NCR2 = FLASH_NCR2_RESET_VALUE;
 202  0008 35ff505c      	mov	20572,#255
 203                     ; 125     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_DUL);
 205  000c 7217505f      	bres	20575,#3
 206                     ; 126     FLASH->IAPSR &= (uint8_t)(~FLASH_IAPSR_PUL);
 208  0010 7213505f      	bres	20575,#1
 209                     ; 127     (void) FLASH->IAPSR; /* Reading of this register causes the clearing of status flags */
 211  0014 c6505f        	ld	a,20575
 212                     ; 128 }
 215  0017 81            	ret	
 270                     ; 136 void FLASH_ITConfig(FunctionalState NewState)
 270                     ; 137 {
 271                     .text:	section	.text,new
 272  0000               _FLASH_ITConfig:
 276                     ; 139   assert_param(IS_FUNCTIONALSTATE_OK(NewState));
 278                     ; 141     if (NewState != DISABLE)
 280  0000 4d            	tnz	a
 281  0001 2705          	jreq	L711
 282                     ; 143         FLASH->CR1 |= FLASH_CR1_IE; /* Enables the interrupt sources */
 284  0003 7212505a      	bset	20570,#1
 287  0007 81            	ret	
 288  0008               L711:
 289                     ; 147         FLASH->CR1 &= (uint8_t)(~FLASH_CR1_IE); /* Disables the interrupt sources */
 291  0008 7213505a      	bres	20570,#1
 292                     ; 149 }
 295  000c 81            	ret	
 327                     ; 158 void FLASH_EraseByte(uint32_t Address)
 327                     ; 159 {
 328                     .text:	section	.text,new
 329  0000               _FLASH_EraseByte:
 331       00000000      OFST:	set	0
 334                     ; 161     assert_param(IS_FLASH_ADDRESS_OK(Address));
 336                     ; 164    *(PointerAttr uint8_t*) (uint16_t)Address = FLASH_CLEAR_BYTE; 
 338  0000 7b05          	ld	a,(OFST+5,sp)
 339  0002 97            	ld	xl,a
 340  0003 7b06          	ld	a,(OFST+6,sp)
 341  0005 3f00          	clr	c_x
 342  0007 02            	rlwa	x,a
 343  0008 bf01          	ldw	c_x+1,x
 344  000a 4f            	clr	a
 345  000b 92bd0000      	ldf	[c_x.e],a
 346                     ; 166 }
 349  000f 81            	ret	
 388                     ; 176 void FLASH_ProgramByte(uint32_t Address, uint8_t Data)
 388                     ; 177 {
 389                     .text:	section	.text,new
 390  0000               _FLASH_ProgramByte:
 392       00000000      OFST:	set	0
 395                     ; 179     assert_param(IS_FLASH_ADDRESS_OK(Address));
 397                     ; 180     *(PointerAttr uint8_t*) (uint16_t)Address = Data;
 399  0000 7b05          	ld	a,(OFST+5,sp)
 400  0002 97            	ld	xl,a
 401  0003 7b06          	ld	a,(OFST+6,sp)
 402  0005 3f00          	clr	c_x
 403  0007 02            	rlwa	x,a
 404  0008 bf01          	ldw	c_x+1,x
 405  000a 7b07          	ld	a,(OFST+7,sp)
 406  000c 92bd0000      	ldf	[c_x.e],a
 407                     ; 181 }
 410  0010 81            	ret	
 442                     ; 190 uint8_t FLASH_ReadByte(uint32_t Address)
 442                     ; 191 {
 443                     .text:	section	.text,new
 444  0000               _FLASH_ReadByte:
 446       00000000      OFST:	set	0
 449                     ; 193     assert_param(IS_FLASH_ADDRESS_OK(Address));
 451                     ; 196     return(*(PointerAttr uint8_t *) (uint16_t)Address); 
 453  0000 7b05          	ld	a,(OFST+5,sp)
 454  0002 97            	ld	xl,a
 455  0003 7b06          	ld	a,(OFST+6,sp)
 456  0005 3f00          	clr	c_x
 457  0007 02            	rlwa	x,a
 458  0008 bf01          	ldw	c_x+1,x
 459  000a 92bc0000      	ldf	a,[c_x.e]
 462  000e 81            	ret	
 501                     ; 207 void FLASH_ProgramWord(uint32_t Address, uint32_t Data)
 501                     ; 208 {
 502                     .text:	section	.text,new
 503  0000               _FLASH_ProgramWord:
 505       00000000      OFST:	set	0
 508                     ; 210     assert_param(IS_FLASH_ADDRESS_OK(Address));
 510                     ; 213     FLASH->CR2 |= FLASH_CR2_WPRG;
 512  0000 721c505b      	bset	20571,#6
 513                     ; 214     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NWPRG);
 515  0004 721d505c      	bres	20572,#6
 516                     ; 217     *((PointerAttr uint8_t*)(uint16_t)Address)       = *((uint8_t*)(&Data));
 518  0008 7b05          	ld	a,(OFST+5,sp)
 519  000a 97            	ld	xl,a
 520  000b 7b06          	ld	a,(OFST+6,sp)
 521  000d 3f00          	clr	c_x
 522  000f 02            	rlwa	x,a
 523  0010 bf01          	ldw	c_x+1,x
 524  0012 7b07          	ld	a,(OFST+7,sp)
 525  0014 92bd0000      	ldf	[c_x.e],a
 526                     ; 219     *(((PointerAttr uint8_t*)(uint16_t)Address) + 1) = *((uint8_t*)(&Data)+1); 
 528  0018 7b05          	ld	a,(OFST+5,sp)
 529  001a 97            	ld	xl,a
 530  001b 7b06          	ld	a,(OFST+6,sp)
 531  001d 02            	rlwa	x,a
 532  001e 90ae0001      	ldw	y,#1
 533  0022 bf01          	ldw	c_x+1,x
 534  0024 93            	ldw	x,y
 535  0025 7b08          	ld	a,(OFST+8,sp)
 536  0027 92a70000      	ldf	([c_x.e],x),a
 537                     ; 221     *(((PointerAttr uint8_t*)(uint16_t)Address) + 2) = *((uint8_t*)(&Data)+2); 
 539  002b 7b05          	ld	a,(OFST+5,sp)
 540  002d 97            	ld	xl,a
 541  002e 7b06          	ld	a,(OFST+6,sp)
 542  0030 02            	rlwa	x,a
 543  0031 905c          	incw	y
 544  0033 bf01          	ldw	c_x+1,x
 545  0035 93            	ldw	x,y
 546  0036 7b09          	ld	a,(OFST+9,sp)
 547  0038 92a70000      	ldf	([c_x.e],x),a
 548                     ; 223     *(((PointerAttr uint8_t*)(uint16_t)Address) + 3) = *((uint8_t*)(&Data)+3); 
 550  003c 7b05          	ld	a,(OFST+5,sp)
 551  003e 97            	ld	xl,a
 552  003f 7b06          	ld	a,(OFST+6,sp)
 553  0041 02            	rlwa	x,a
 554  0042 905c          	incw	y
 555  0044 bf01          	ldw	c_x+1,x
 556  0046 93            	ldw	x,y
 557  0047 7b0a          	ld	a,(OFST+10,sp)
 558  0049 92a70000      	ldf	([c_x.e],x),a
 559                     ; 224 }
 562  004d 81            	ret	
 603                     ; 232 void FLASH_ProgramOptionByte(uint16_t Address, uint8_t Data)
 603                     ; 233 {
 604                     .text:	section	.text,new
 605  0000               _FLASH_ProgramOptionByte:
 607  0000 89            	pushw	x
 608       00000000      OFST:	set	0
 611                     ; 235     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 613                     ; 238     FLASH->CR2 |= FLASH_CR2_OPT;
 615  0001 721e505b      	bset	20571,#7
 616                     ; 239     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 618  0005 721f505c      	bres	20572,#7
 619                     ; 242     if (Address == 0x4800)
 621  0009 a34800        	cpw	x,#18432
 622  000c 2607          	jrne	L522
 623                     ; 245        *((NEAR uint8_t*)Address) = Data;
 625  000e 1e01          	ldw	x,(OFST+1,sp)
 626  0010 7b05          	ld	a,(OFST+5,sp)
 627  0012 f7            	ld	(x),a
 629  0013 2008          	jra	L722
 630  0015               L522:
 631                     ; 250        *((NEAR uint8_t*)Address) = Data;
 633  0015 1e01          	ldw	x,(OFST+1,sp)
 634  0017 7b05          	ld	a,(OFST+5,sp)
 635  0019 f7            	ld	(x),a
 636                     ; 251        *((NEAR uint8_t*)((uint16_t)(Address + 1))) = (uint8_t)(~Data);
 638  001a 43            	cpl	a
 639  001b e701          	ld	(1,x),a
 640  001d               L722:
 641                     ; 253     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 643  001d a6fd          	ld	a,#253
 644  001f cd0000        	call	_FLASH_WaitForLastOperation
 646                     ; 256     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 648  0022 721f505b      	bres	20571,#7
 649                     ; 257     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 651  0026 721e505c      	bset	20572,#7
 652                     ; 258 }
 655  002a 85            	popw	x
 656  002b 81            	ret	
 690                     ; 265 void FLASH_EraseOptionByte(uint16_t Address)
 690                     ; 266 {
 691                     .text:	section	.text,new
 692  0000               _FLASH_EraseOptionByte:
 694  0000 89            	pushw	x
 695       00000000      OFST:	set	0
 698                     ; 268     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 700                     ; 271     FLASH->CR2 |= FLASH_CR2_OPT;
 702  0001 721e505b      	bset	20571,#7
 703                     ; 272     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NOPT);
 705  0005 721f505c      	bres	20572,#7
 706                     ; 275      if (Address == 0x4800)
 708  0009 a34800        	cpw	x,#18432
 709  000c 2603          	jrne	L542
 710                     ; 278        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 712  000e 7f            	clr	(x)
 714  000f 2007          	jra	L742
 715  0011               L542:
 716                     ; 283        *((NEAR uint8_t*)Address) = FLASH_CLEAR_BYTE;
 718  0011 1e01          	ldw	x,(OFST+1,sp)
 719                     ; 284        *((NEAR uint8_t*)((uint16_t)(Address + (uint16_t)1 ))) = FLASH_SET_BYTE;
 721  0013 a6ff          	ld	a,#255
 722  0015 7f            	clr	(x)
 723  0016 e701          	ld	(1,x),a
 724  0018               L742:
 725                     ; 286     FLASH_WaitForLastOperation(FLASH_MEMTYPE_PROG);
 727  0018 a6fd          	ld	a,#253
 728  001a cd0000        	call	_FLASH_WaitForLastOperation
 730                     ; 289     FLASH->CR2 &= (uint8_t)(~FLASH_CR2_OPT);
 732  001d 721f505b      	bres	20571,#7
 733                     ; 290     FLASH->NCR2 |= FLASH_NCR2_NOPT;
 735  0021 721e505c      	bset	20572,#7
 736                     ; 291 }
 739  0025 85            	popw	x
 740  0026 81            	ret	
 795                     ; 297 uint16_t FLASH_ReadOptionByte(uint16_t Address)
 795                     ; 298 {
 796                     .text:	section	.text,new
 797  0000               _FLASH_ReadOptionByte:
 799  0000 5204          	subw	sp,#4
 800       00000004      OFST:	set	4
 803                     ; 299     uint8_t value_optbyte, value_optbyte_complement = 0;
 805                     ; 300     uint16_t res_value = 0;
 807                     ; 303     assert_param(IS_OPTION_BYTE_ADDRESS_OK(Address));
 809                     ; 306     value_optbyte = *((NEAR uint8_t*)Address); /* Read option byte */
 811  0002 f6            	ld	a,(x)
 812  0003 6b02          	ld	(OFST-2,sp),a
 813                     ; 307     value_optbyte_complement = *(((NEAR uint8_t*)Address) + 1); /* Read option byte complement */
 815  0005 e601          	ld	a,(1,x)
 816  0007 6b01          	ld	(OFST-3,sp),a
 817                     ; 310     if (Address == 0x4800)	 
 819  0009 a34800        	cpw	x,#18432
 820  000c 2606          	jrne	L372
 821                     ; 312         res_value =	 value_optbyte;
 823  000e 7b02          	ld	a,(OFST-2,sp)
 824  0010 5f            	clrw	x
 825  0011 97            	ld	xl,a
 827  0012 201c          	jra	L572
 828  0014               L372:
 829                     ; 316         if (value_optbyte == (uint8_t)(~value_optbyte_complement))
 831  0014 43            	cpl	a
 832  0015 1102          	cp	a,(OFST-2,sp)
 833  0017 2614          	jrne	L772
 834                     ; 318             res_value = (uint16_t)((uint16_t)value_optbyte << 8);
 836  0019 7b02          	ld	a,(OFST-2,sp)
 837  001b 97            	ld	xl,a
 838  001c 4f            	clr	a
 839  001d 02            	rlwa	x,a
 840  001e 1f03          	ldw	(OFST-1,sp),x
 841                     ; 319             res_value = res_value | (uint16_t)value_optbyte_complement;
 843  0020 5f            	clrw	x
 844  0021 7b01          	ld	a,(OFST-3,sp)
 845  0023 97            	ld	xl,a
 846  0024 01            	rrwa	x,a
 847  0025 1a04          	or	a,(OFST+0,sp)
 848  0027 01            	rrwa	x,a
 849  0028 1a03          	or	a,(OFST-1,sp)
 850  002a 01            	rrwa	x,a
 852  002b 2003          	jra	L572
 853  002d               L772:
 854                     ; 323             res_value = FLASH_OPTIONBYTE_ERROR;
 856  002d ae5555        	ldw	x,#21845
 857  0030               L572:
 858                     ; 326     return(res_value);
 862  0030 5b04          	addw	sp,#4
 863  0032 81            	ret	
 937                     ; 335 void FLASH_SetLowPowerMode(FLASH_LPMode_TypeDef FLASH_LPMode)
 937                     ; 336 {
 938                     .text:	section	.text,new
 939  0000               _FLASH_SetLowPowerMode:
 941  0000 88            	push	a
 942       00000000      OFST:	set	0
 945                     ; 338     assert_param(IS_FLASH_LOW_POWER_MODE_OK(FLASH_LPMode));
 947                     ; 341     FLASH->CR1 &= (uint8_t)(~(FLASH_CR1_HALT | FLASH_CR1_AHALT)); 
 949  0001 c6505a        	ld	a,20570
 950  0004 a4f3          	and	a,#243
 951  0006 c7505a        	ld	20570,a
 952                     ; 344     FLASH->CR1 |= (uint8_t)FLASH_LPMode; 
 954  0009 c6505a        	ld	a,20570
 955  000c 1a01          	or	a,(OFST+1,sp)
 956  000e c7505a        	ld	20570,a
 957                     ; 345 }
 960  0011 84            	pop	a
 961  0012 81            	ret	
1019                     ; 353 void FLASH_SetProgrammingTime(FLASH_ProgramTime_TypeDef FLASH_ProgTime)
1019                     ; 354 {
1020                     .text:	section	.text,new
1021  0000               _FLASH_SetProgrammingTime:
1025                     ; 356     assert_param(IS_FLASH_PROGRAM_TIME_OK(FLASH_ProgTime));
1027                     ; 358     FLASH->CR1 &= (uint8_t)(~FLASH_CR1_FIX);
1029  0000 7211505a      	bres	20570,#0
1030                     ; 359     FLASH->CR1 |= (uint8_t)FLASH_ProgTime;
1032  0004 ca505a        	or	a,20570
1033  0007 c7505a        	ld	20570,a
1034                     ; 360 }
1037  000a 81            	ret	
1062                     ; 367 FLASH_LPMode_TypeDef FLASH_GetLowPowerMode(void)
1062                     ; 368 {
1063                     .text:	section	.text,new
1064  0000               _FLASH_GetLowPowerMode:
1068                     ; 369     return((FLASH_LPMode_TypeDef)(FLASH->CR1 & (uint8_t)(FLASH_CR1_HALT | FLASH_CR1_AHALT)));
1070  0000 c6505a        	ld	a,20570
1071  0003 a40c          	and	a,#12
1074  0005 81            	ret	
1099                     ; 377 FLASH_ProgramTime_TypeDef FLASH_GetProgrammingTime(void)
1099                     ; 378 {
1100                     .text:	section	.text,new
1101  0000               _FLASH_GetProgrammingTime:
1105                     ; 379     return((FLASH_ProgramTime_TypeDef)(FLASH->CR1 & FLASH_CR1_FIX));
1107  0000 c6505a        	ld	a,20570
1108  0003 a401          	and	a,#1
1111  0005 81            	ret	
1143                     ; 387 uint32_t FLASH_GetBootSize(void)
1143                     ; 388 {
1144                     .text:	section	.text,new
1145  0000               _FLASH_GetBootSize:
1147  0000 5204          	subw	sp,#4
1148       00000004      OFST:	set	4
1151                     ; 389     uint32_t temp = 0;
1153                     ; 392     temp = (uint32_t)((uint32_t)FLASH->FPR * (uint32_t)512);
1155  0002 c6505d        	ld	a,20573
1156  0005 5f            	clrw	x
1157  0006 97            	ld	xl,a
1158  0007 90ae0200      	ldw	y,#512
1159  000b cd0000        	call	c_umul
1161  000e 96            	ldw	x,sp
1162  000f 5c            	incw	x
1163  0010 cd0000        	call	c_rtol
1165                     ; 395     if (FLASH->FPR == 0xFF)
1167  0013 c6505d        	ld	a,20573
1168  0016 4c            	inc	a
1169  0017 260d          	jrne	L714
1170                     ; 397         temp += 512;
1172  0019 ae0200        	ldw	x,#512
1173  001c bf02          	ldw	c_lreg+2,x
1174  001e 5f            	clrw	x
1175  001f bf00          	ldw	c_lreg,x
1176  0021 96            	ldw	x,sp
1177  0022 5c            	incw	x
1178  0023 cd0000        	call	c_lgadd
1180  0026               L714:
1181                     ; 401     return(temp);
1183  0026 96            	ldw	x,sp
1184  0027 5c            	incw	x
1185  0028 cd0000        	call	c_ltor
1189  002b 5b04          	addw	sp,#4
1190  002d 81            	ret	
1299                     ; 412 FlagStatus FLASH_GetFlagStatus(FLASH_Flag_TypeDef FLASH_FLAG)
1299                     ; 413 {
1300                     .text:	section	.text,new
1301  0000               _FLASH_GetFlagStatus:
1303  0000 88            	push	a
1304       00000001      OFST:	set	1
1307                     ; 414     FlagStatus status = RESET;
1309                     ; 416     assert_param(IS_FLASH_FLAGS_OK(FLASH_FLAG));
1311                     ; 419     if ((FLASH->IAPSR & (uint8_t)FLASH_FLAG) != (uint8_t)RESET)
1313  0001 c4505f        	and	a,20575
1314  0004 2702          	jreq	L174
1315                     ; 421         status = SET; /* FLASH_FLAG is set */
1317  0006 a601          	ld	a,#1
1319  0008               L174:
1320                     ; 425         status = RESET; /* FLASH_FLAG is reset*/
1322                     ; 429     return status;
1326  0008 5b01          	addw	sp,#1
1327  000a 81            	ret	
1416                     ; 531 IN_RAM(FLASH_Status_TypeDef FLASH_WaitForLastOperation(FLASH_MemType_TypeDef FLASH_MemType)) 
1416                     ; 532 {
1417                     .text:	section	.text,new
1418  0000               _FLASH_WaitForLastOperation:
1420  0000 5205          	subw	sp,#5
1421       00000005      OFST:	set	5
1424                     ; 533     uint8_t flagstatus = 0x00;
1426  0002 0f05          	clr	(OFST+0,sp)
1427                     ; 534     uint32_t timeout = OPERATION_TIMEOUT;
1429  0004 aeffff        	ldw	x,#65535
1430  0007 1f03          	ldw	(OFST-2,sp),x
1431  0009 ae000f        	ldw	x,#15
1432  000c 1f01          	ldw	(OFST-4,sp),x
1433                     ; 539     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1435  000e a1fd          	cp	a,#253
1436  0010 262b          	jrne	L155
1438  0012 200e          	jra	L735
1439  0014               L535:
1440                     ; 543             flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_EOP |
1440                     ; 544                                               FLASH_IAPSR_WR_PG_DIS));
1442  0014 c6505f        	ld	a,20575
1443  0017 a405          	and	a,#5
1444  0019 6b05          	ld	(OFST+0,sp),a
1445                     ; 545             timeout--;
1447  001b 96            	ldw	x,sp
1448  001c 5c            	incw	x
1449  001d a601          	ld	a,#1
1450  001f cd0000        	call	c_lgsbc
1452  0022               L735:
1453                     ; 541         while ((flagstatus == 0x00) && (timeout != 0x00))
1455  0022 7b05          	ld	a,(OFST+0,sp)
1456  0024 2622          	jrne	L545
1458  0026 96            	ldw	x,sp
1459  0027 5c            	incw	x
1460  0028 cd0000        	call	c_lzmp
1462  002b 26e7          	jrne	L535
1463  002d 2019          	jra	L545
1464  002f               L745:
1465                     ; 552             flagstatus = (uint8_t)(FLASH->IAPSR & (uint8_t)(FLASH_IAPSR_HVOFF |
1465                     ; 553                                               FLASH_IAPSR_WR_PG_DIS));
1467  002f c6505f        	ld	a,20575
1468  0032 a441          	and	a,#65
1469  0034 6b05          	ld	(OFST+0,sp),a
1470                     ; 554             timeout--;
1472  0036 96            	ldw	x,sp
1473  0037 5c            	incw	x
1474  0038 a601          	ld	a,#1
1475  003a cd0000        	call	c_lgsbc
1477  003d               L155:
1478                     ; 550         while ((flagstatus == 0x00) && (timeout != 0x00))
1480  003d 7b05          	ld	a,(OFST+0,sp)
1481  003f 2607          	jrne	L545
1483  0041 96            	ldw	x,sp
1484  0042 5c            	incw	x
1485  0043 cd0000        	call	c_lzmp
1487  0046 26e7          	jrne	L745
1488  0048               L545:
1489                     ; 566     if (timeout == 0x00 )
1491  0048 96            	ldw	x,sp
1492  0049 5c            	incw	x
1493  004a cd0000        	call	c_lzmp
1495  004d 2604          	jrne	L755
1496                     ; 568         flagstatus = FLASH_STATUS_TIMEOUT;
1498  004f a602          	ld	a,#2
1499  0051 6b05          	ld	(OFST+0,sp),a
1500  0053               L755:
1501                     ; 571     return((FLASH_Status_TypeDef)flagstatus);
1503  0053 7b05          	ld	a,(OFST+0,sp)
1506  0055 5b05          	addw	sp,#5
1507  0057 81            	ret	
1566                     ; 581 IN_RAM(void FLASH_EraseBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType))
1566                     ; 582 {
1567                     .text:	section	.text,new
1568  0000               _FLASH_EraseBlock:
1570  0000 89            	pushw	x
1571  0001 5207          	subw	sp,#7
1572       00000007      OFST:	set	7
1575                     ; 583   uint32_t startaddress = 0;
1577                     ; 593   assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1579                     ; 594   if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1581  0003 7b0c          	ld	a,(OFST+5,sp)
1582  0005 a1fd          	cp	a,#253
1583  0007 2605          	jrne	L706
1584                     ; 596       assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1586                     ; 597       startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1588  0009 ae8000        	ldw	x,#32768
1590  000c 2003          	jra	L116
1591  000e               L706:
1592                     ; 601       assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1594                     ; 602       startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1596  000e ae4000        	ldw	x,#16384
1597  0011               L116:
1598  0011 1f03          	ldw	(OFST-4,sp),x
1599  0013 5f            	clrw	x
1600  0014 1f01          	ldw	(OFST-6,sp),x
1601                     ; 607     pwFlash = (PointerAttr uint8_t *)(uint32_t)(startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE));
1603  0016 a680          	ld	a,#128
1604  0018 1e08          	ldw	x,(OFST+1,sp)
1605  001a cd0000        	call	c_cmulx
1607  001d 96            	ldw	x,sp
1608  001e 5c            	incw	x
1609  001f cd0000        	call	c_ladd
1611  0022 450100        	mov	c_x,c_lreg+1
1612  0025 b600          	ld	a,c_x
1613  0027 be02          	ldw	x,c_lreg+2
1614  0029 6b05          	ld	(OFST-2,sp),a
1615  002b 1f06          	ldw	(OFST-1,sp),x
1616                     ; 614     FLASH->CR2 |= FLASH_CR2_ERASE;
1618  002d 721a505b      	bset	20571,#5
1619                     ; 615     FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NERASE);
1621  0031 721b505c      	bres	20572,#5
1622                     ; 622   *pwFlash = (uint8_t)0;
1624  0035 b700          	ld	c_x,a
1625  0037 bf01          	ldw	c_x+1,x
1626  0039 4f            	clr	a
1627  003a 92bd0000      	ldf	[c_x.e],a
1628                     ; 623   *(pwFlash + 1) = (uint8_t)0;
1630  003e 7b05          	ld	a,(OFST-2,sp)
1631  0040 b700          	ld	c_x,a
1632  0042 ae0001        	ldw	x,#1
1633  0045 4f            	clr	a
1634  0046 92a70000      	ldf	([c_x.e],x),a
1635                     ; 624   *(pwFlash + 2) = (uint8_t)0;
1637  004a 1e06          	ldw	x,(OFST-1,sp)
1638  004c bf01          	ldw	c_x+1,x
1639  004e ae0002        	ldw	x,#2
1640  0051 92a70000      	ldf	([c_x.e],x),a
1641                     ; 625   *(pwFlash + 3) = (uint8_t)0;    
1643  0055 5c            	incw	x
1644  0056 92a70000      	ldf	([c_x.e],x),a
1645                     ; 627 }
1648  005a 5b09          	addw	sp,#9
1649  005c 81            	ret	
1747                     ; 638 IN_RAM(void FLASH_ProgramBlock(uint16_t BlockNum, FLASH_MemType_TypeDef FLASH_MemType, 
1747                     ; 639                         FLASH_ProgramMode_TypeDef FLASH_ProgMode, uint8_t *Buffer))
1747                     ; 640 {
1748                     .text:	section	.text,new
1749  0000               _FLASH_ProgramBlock:
1751  0000 89            	pushw	x
1752  0001 5206          	subw	sp,#6
1753       00000006      OFST:	set	6
1756                     ; 641     uint16_t Count = 0;
1758                     ; 642     uint32_t startaddress = 0;
1760                     ; 645     assert_param(IS_MEMORY_TYPE_OK(FLASH_MemType));
1762                     ; 646     assert_param(IS_FLASH_PROGRAM_MODE_OK(FLASH_ProgMode));
1764                     ; 647     if (FLASH_MemType == FLASH_MEMTYPE_PROG)
1766  0003 7b0b          	ld	a,(OFST+5,sp)
1767  0005 a1fd          	cp	a,#253
1768  0007 2605          	jrne	L756
1769                     ; 649         assert_param(IS_FLASH_PROG_BLOCK_NUMBER_OK(BlockNum));
1771                     ; 650         startaddress = FLASH_PROG_START_PHYSICAL_ADDRESS;
1773  0009 ae8000        	ldw	x,#32768
1775  000c 2003          	jra	L166
1776  000e               L756:
1777                     ; 654         assert_param(IS_FLASH_DATA_BLOCK_NUMBER_OK(BlockNum));
1779                     ; 655         startaddress = FLASH_DATA_START_PHYSICAL_ADDRESS;
1781  000e ae4000        	ldw	x,#16384
1782  0011               L166:
1783  0011 1f03          	ldw	(OFST-3,sp),x
1784  0013 5f            	clrw	x
1785  0014 1f01          	ldw	(OFST-5,sp),x
1786                     ; 659     startaddress = startaddress + ((uint32_t)BlockNum * FLASH_BLOCK_SIZE);
1788  0016 a680          	ld	a,#128
1789  0018 1e07          	ldw	x,(OFST+1,sp)
1790  001a cd0000        	call	c_cmulx
1792  001d 96            	ldw	x,sp
1793  001e 5c            	incw	x
1794  001f cd0000        	call	c_lgadd
1796                     ; 662     if (FLASH_ProgMode == FLASH_PROGRAMMODE_STANDARD)
1798  0022 7b0c          	ld	a,(OFST+6,sp)
1799  0024 260a          	jrne	L366
1800                     ; 665         FLASH->CR2 |= FLASH_CR2_PRG;
1802  0026 7210505b      	bset	20571,#0
1803                     ; 666         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NPRG);
1805  002a 7211505c      	bres	20572,#0
1807  002e 2008          	jra	L566
1808  0030               L366:
1809                     ; 671         FLASH->CR2 |= FLASH_CR2_FPRG;
1811  0030 7218505b      	bset	20571,#4
1812                     ; 672         FLASH->NCR2 &= (uint8_t)(~FLASH_NCR2_NFPRG);
1814  0034 7219505c      	bres	20572,#4
1815  0038               L566:
1816                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1818  0038 5f            	clrw	x
1819  0039 1f05          	ldw	(OFST-1,sp),x
1820  003b               L766:
1821                     ; 680   *((PointerAttr uint8_t*) (uint16_t)startaddress + Count) = ((uint8_t)(Buffer[Count]));
1823  003b 7b03          	ld	a,(OFST-3,sp)
1824  003d 97            	ld	xl,a
1825  003e 7b04          	ld	a,(OFST-2,sp)
1826  0040 3f00          	clr	c_x
1827  0042 02            	rlwa	x,a
1828  0043 1605          	ldw	y,(OFST-1,sp)
1829  0045 bf01          	ldw	c_x+1,x
1830  0047 93            	ldw	x,y
1831  0048 160d          	ldw	y,(OFST+7,sp)
1832  004a 72f905        	addw	y,(OFST-1,sp)
1833  004d 90f6          	ld	a,(y)
1834  004f 92a70000      	ldf	([c_x.e],x),a
1835                     ; 676     for (Count = 0; Count < FLASH_BLOCK_SIZE; Count++)
1837  0053 1e05          	ldw	x,(OFST-1,sp)
1838  0055 5c            	incw	x
1839  0056 1f05          	ldw	(OFST-1,sp),x
1842  0058 a30080        	cpw	x,#128
1843  005b 25de          	jrult	L766
1844                     ; 685 }
1847  005d 5b08          	addw	sp,#8
1848  005f 81            	ret	
1861                     	xdef	_FLASH_WaitForLastOperation
1862                     	xdef	_FLASH_ProgramBlock
1863                     	xdef	_FLASH_EraseBlock
1864                     	xdef	_FLASH_GetFlagStatus
1865                     	xdef	_FLASH_GetBootSize
1866                     	xdef	_FLASH_GetProgrammingTime
1867                     	xdef	_FLASH_GetLowPowerMode
1868                     	xdef	_FLASH_SetProgrammingTime
1869                     	xdef	_FLASH_SetLowPowerMode
1870                     	xdef	_FLASH_EraseOptionByte
1871                     	xdef	_FLASH_ProgramOptionByte
1872                     	xdef	_FLASH_ReadOptionByte
1873                     	xdef	_FLASH_ProgramWord
1874                     	xdef	_FLASH_ReadByte
1875                     	xdef	_FLASH_ProgramByte
1876                     	xdef	_FLASH_EraseByte
1877                     	xdef	_FLASH_ITConfig
1878                     	xdef	_FLASH_DeInit
1879                     	xdef	_FLASH_Lock
1880                     	xdef	_FLASH_Unlock
1881                     	xref.b	c_lreg
1882                     	xref.b	c_x
1883                     	xref.b	c_y
1902                     	xref	c_ladd
1903                     	xref	c_cmulx
1904                     	xref	c_lzmp
1905                     	xref	c_lgsbc
1906                     	xref	c_ltor
1907                     	xref	c_lgadd
1908                     	xref	c_rtol
1909                     	xref	c_umul
1910                     	end
