   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  85                     ; 29 void	file_write(uint8_t addr, uint8_t data)
  85                     ; 30 {
  87                     .text:	section	.text,new
  88  0000               _file_write:
  90  0000 89            	pushw	x
  91  0001 5204          	subw	sp,#4
  92       00000004      OFST:	set	4
  95                     ; 31 	uint16_t	add, startadd, stopadd = 0;
  97                     ; 38 	_fctcpy('F');
  99  0003 a646          	ld	a,#70
 100  0005 cd0000        	call	__fctcpy
 102                     ; 43 	FLASH_SetProgrammingTime(__FLASH_PROGRAMTIME_STANDARD);
 104  0008 4f            	clr	a
 105  0009 cd0000        	call	_FLASH_SetProgrammingTime
 107                     ; 47 	FLASH_Unlock(__FLASH_MEMTYPE_DATA);
 109  000c a6f7          	ld	a,#247
 110  000e cd0000        	call	_FLASH_Unlock
 113  0011               L53:
 114                     ; 51 	while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET)
 116  0011 a608          	ld	a,#8
 117  0013 cd0000        	call	_FLASH_GetFlagStatus
 119  0016 4d            	tnz	a
 120  0017 27f8          	jreq	L53
 121                     ; 54 	startadd = __FLASH_DATA_START_PHYSICAL_ADDRESS + 
 121                     ; 55 				((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
 123                     ; 56 	stopadd = startadd + (uint16_t)FLASH_BLOCK_SIZE;
 125                     ; 58 	FLASH_ProgramByte(startadd + addr * 2, data);
 127  0019 7b06          	ld	a,(OFST+2,sp)
 128  001b 88            	push	a
 129  001c 7b06          	ld	a,(OFST+2,sp)
 130  001e 5f            	clrw	x
 131  001f 97            	ld	xl,a
 132  0020 58            	sllw	x
 133  0021 1c1000        	addw	x,#4096
 134  0024 cd0000        	call	c_uitolx
 136  0027 be02          	ldw	x,c_lreg+2
 137  0029 89            	pushw	x
 138  002a be00          	ldw	x,c_lreg
 139  002c 89            	pushw	x
 140  002d cd0000        	call	_FLASH_ProgramByte
 142  0030 5b0b          	addw	sp,#11
 143                     ; 59 }
 146  0032 81            	ret	
 226                     ; 61 uint8_t	file_read(uint8_t addr)
 226                     ; 62 {	
 227                     .text:	section	.text,new
 228  0000               _file_read:
 230  0000 88            	push	a
 231  0001 5209          	subw	sp,#9
 232       00000009      OFST:	set	9
 235                     ; 63 	uint16_t	add, startadd, stopadd = 0;
 237                     ; 64 	uint8_t newval = 0xAA;
 239  0003 a6aa          	ld	a,#170
 240  0005 6b08          	ld	(OFST-1,sp),a
 242                     ; 65 	uint8_t prvval = 0xAA;
 244                     ; 66 	uint8_t i = 0;
 246                     ; 74 	_fctcpy('F');
 248  0007 a646          	ld	a,#70
 249  0009 cd0000        	call	__fctcpy
 251                     ; 79 	FLASH_SetProgrammingTime(__FLASH_PROGRAMTIME_STANDARD);
 253  000c 4f            	clr	a
 254  000d cd0000        	call	_FLASH_SetProgrammingTime
 256                     ; 83 	FLASH_Unlock(__FLASH_MEMTYPE_DATA);
 258  0010 a6f7          	ld	a,#247
 259  0012 cd0000        	call	_FLASH_Unlock
 262  0015               L37:
 263                     ; 86 	while(FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET)
 265  0015 a608          	ld	a,#8
 266  0017 cd0000        	call	_FLASH_GetFlagStatus
 268  001a 4d            	tnz	a
 269  001b 27f8          	jreq	L37
 270                     ; 90 	for (i = 0; i < FLASH_BLOCK_SIZE; i++)
 272  001d 4f            	clr	a
 273  001e 6b09          	ld	(OFST+0,sp),a
 275  0020               L77:
 276                     ; 92 		GBuffer[i] = newval;
 278  0020 5f            	clrw	x
 279  0021 97            	ld	xl,a
 280  0022 7b08          	ld	a,(OFST-1,sp)
 281  0024 d70000        	ld	(_GBuffer,x),a
 282                     ; 90 	for (i = 0; i < FLASH_BLOCK_SIZE; i++)
 284  0027 0c09          	inc	(OFST+0,sp)
 288  0029 7b09          	ld	a,(OFST+0,sp)
 289  002b a180          	cp	a,#128
 290  002d 25f1          	jrult	L77
 291                     ; 97 	startadd = __FLASH_DATA_START_PHYSICAL_ADDRESS + 
 291                     ; 98 				((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
 293                     ; 100 	add = startadd + addr * 2;
 295  002f 7b0a          	ld	a,(OFST+1,sp)
 296  0031 5f            	clrw	x
 297  0032 97            	ld	xl,a
 298  0033 58            	sllw	x
 299  0034 1c1000        	addw	x,#4096
 300  0037 1f06          	ldw	(OFST-3,sp),x
 302                     ; 101 	return FLASH_ReadByte(add);	
 304  0039 cd0000        	call	c_uitolx
 306  003c be02          	ldw	x,c_lreg+2
 307  003e 89            	pushw	x
 308  003f be00          	ldw	x,c_lreg
 309  0041 89            	pushw	x
 310  0042 cd0000        	call	_FLASH_ReadByte
 312  0045 5b0e          	addw	sp,#14
 315  0047 81            	ret	
 370                     	xref	__fctcpy
 371                     	switch	.bss
 372  0000               _GBuffer:
 373  0000 000000000000  	ds.b	128
 374                     	xdef	_GBuffer
 375  0080               _OperationStatus:
 376  0080 00            	ds.b	1
 377                     	xdef	_OperationStatus
 378                     	xdef	_file_read
 379                     	xdef	_file_write
 380                     	xref	_FLASH_GetFlagStatus
 381                     	xref	_FLASH_ReadByte
 382                     	xref	_FLASH_ProgramByte
 383                     	xref	_FLASH_Unlock
 384                     	xref	_FLASH_SetProgrammingTime
 385                     	xref.b	c_lreg
 405                     	xref	c_uitolx
 406                     	end
