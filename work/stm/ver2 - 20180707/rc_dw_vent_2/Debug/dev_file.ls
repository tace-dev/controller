   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  85                     ; 29 void	file_write(uint8_t addr, uint8_t data)
  85                     ; 30 {
  86                     .text:	section	.text,new
  87  0000               f_file_write:
  89  0000 89            	pushw	x
  90  0001 5204          	subw	sp,#4
  91       00000004      OFST:	set	4
  94                     ; 31 	uint16_t	add, startadd, stopadd = 0;
  96                     ; 38 	_fctcpy('F');
  98  0003 a646          	ld	a,#70
  99  0005 8d000000      	callf	f__fctcpy
 101                     ; 43 	FLASH_SetProgrammingTime(__FLASH_PROGRAMTIME_STANDARD);
 103  0009 4f            	clr	a
 104  000a 8d000000      	callf	f_FLASH_SetProgrammingTime
 106                     ; 47 	FLASH_Unlock(__FLASH_MEMTYPE_DATA);
 108  000e a6f7          	ld	a,#247
 109  0010 8d000000      	callf	f_FLASH_Unlock
 112  0014               L53:
 113                     ; 51 	while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET)
 115  0014 a608          	ld	a,#8
 116  0016 8d000000      	callf	f_FLASH_GetFlagStatus
 118  001a 4d            	tnz	a
 119  001b 27f7          	jreq	L53
 120                     ; 54 	startadd = __FLASH_DATA_START_PHYSICAL_ADDRESS + 
 120                     ; 55 				((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
 122                     ; 56 	stopadd = startadd + (uint16_t)FLASH_BLOCK_SIZE;
 124                     ; 58 	FLASH_ProgramByte(startadd + addr * 2, data);
 126  001d 7b06          	ld	a,(OFST+2,sp)
 127  001f 88            	push	a
 128  0020 7b06          	ld	a,(OFST+2,sp)
 129  0022 5f            	clrw	x
 130  0023 97            	ld	xl,a
 131  0024 58            	sllw	x
 132  0025 1c1000        	addw	x,#4096
 133  0028 8d000000      	callf	d_uitolx
 135  002c be02          	ldw	x,c_lreg+2
 136  002e 89            	pushw	x
 137  002f be00          	ldw	x,c_lreg
 138  0031 89            	pushw	x
 139  0032 8d000000      	callf	f_FLASH_ProgramByte
 141  0036 5b0b          	addw	sp,#11
 142                     ; 59 }
 145  0038 87            	retf	
 224                     ; 61 uint8_t	file_read(uint8_t addr)
 224                     ; 62 {	
 225                     .text:	section	.text,new
 226  0000               f_file_read:
 228  0000 88            	push	a
 229  0001 5209          	subw	sp,#9
 230       00000009      OFST:	set	9
 233                     ; 63 	uint16_t	add, startadd, stopadd = 0;
 235  0003 5f            	clrw	x
 236  0004 1f01          	ldw	(OFST-8,sp),x
 237                     ; 64 	uint8_t newval = 0xAA;
 239  0006 a6aa          	ld	a,#170
 240  0008 6b08          	ld	(OFST-1,sp),a
 241                     ; 65 	uint8_t prvval = 0xAA;
 243  000a 6b03          	ld	(OFST-6,sp),a
 244                     ; 66 	uint8_t i = 0;
 246                     ; 74 	_fctcpy('F');
 248  000c a646          	ld	a,#70
 249  000e 8d000000      	callf	f__fctcpy
 251                     ; 79 	FLASH_SetProgrammingTime(__FLASH_PROGRAMTIME_STANDARD);
 253  0012 4f            	clr	a
 254  0013 8d000000      	callf	f_FLASH_SetProgrammingTime
 256                     ; 83 	FLASH_Unlock(__FLASH_MEMTYPE_DATA);
 258  0017 a6f7          	ld	a,#247
 259  0019 8d000000      	callf	f_FLASH_Unlock
 262  001d               L37:
 263                     ; 86 	while(FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET)
 265  001d a608          	ld	a,#8
 266  001f 8d000000      	callf	f_FLASH_GetFlagStatus
 268  0023 4d            	tnz	a
 269  0024 27f7          	jreq	L37
 270                     ; 90 	for (i = 0; i < FLASH_BLOCK_SIZE; i++)
 272  0026 4f            	clr	a
 273  0027 6b09          	ld	(OFST+0,sp),a
 274  0029               L77:
 275                     ; 92 		GBuffer[i] = newval;
 277  0029 5f            	clrw	x
 278  002a 97            	ld	xl,a
 279  002b 7b08          	ld	a,(OFST-1,sp)
 280  002d d70000        	ld	(_GBuffer,x),a
 281                     ; 90 	for (i = 0; i < FLASH_BLOCK_SIZE; i++)
 283  0030 0c09          	inc	(OFST+0,sp)
 286  0032 7b09          	ld	a,(OFST+0,sp)
 287  0034 a180          	cp	a,#128
 288  0036 25f1          	jrult	L77
 289                     ; 97 	startadd = __FLASH_DATA_START_PHYSICAL_ADDRESS + 
 289                     ; 98 				((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
 291                     ; 100 	add = startadd + addr * 2;
 293  0038 7b0a          	ld	a,(OFST+1,sp)
 294  003a 5f            	clrw	x
 295  003b 97            	ld	xl,a
 296  003c 58            	sllw	x
 297  003d 1c1000        	addw	x,#4096
 298  0040 1f04          	ldw	(OFST-5,sp),x
 299                     ; 101 	return FLASH_ReadByte(add);	
 301  0042 8d000000      	callf	d_uitolx
 303  0046 be02          	ldw	x,c_lreg+2
 304  0048 89            	pushw	x
 305  0049 be00          	ldw	x,c_lreg
 306  004b 89            	pushw	x
 307  004c 8d000000      	callf	f_FLASH_ReadByte
 309  0050 5b0e          	addw	sp,#14
 312  0052 87            	retf	
 366                     	xref	f__fctcpy
 367                     	switch	.bss
 368  0000               _GBuffer:
 369  0000 000000000000  	ds.b	128
 370                     	xdef	_GBuffer
 371  0080               _OperationStatus:
 372  0080 00            	ds.b	1
 373                     	xdef	_OperationStatus
 374                     	xdef	f_file_read
 375                     	xdef	f_file_write
 376                     	xref	f_FLASH_GetFlagStatus
 377                     	xref	f_FLASH_ReadByte
 378                     	xref	f_FLASH_ProgramByte
 379                     	xref	f_FLASH_Unlock
 380                     	xref	f_FLASH_SetProgrammingTime
 381                     	xref.b	c_lreg
 401                     	xref	d_uitolx
 402                     	end
