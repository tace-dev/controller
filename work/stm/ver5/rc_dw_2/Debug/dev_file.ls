   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
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
 237  0003 5f            	clrw	x
 238  0004 1f01          	ldw	(OFST-8,sp),x
 239                     ; 64 	uint8_t newval = 0xAA;
 241  0006 a6aa          	ld	a,#170
 242  0008 6b08          	ld	(OFST-1,sp),a
 243                     ; 65 	uint8_t prvval = 0xAA;
 245  000a 6b03          	ld	(OFST-6,sp),a
 246                     ; 66 	uint8_t i = 0;
 248                     ; 74 	_fctcpy('F');
 250  000c a646          	ld	a,#70
 251  000e cd0000        	call	__fctcpy
 253                     ; 79 	FLASH_SetProgrammingTime(__FLASH_PROGRAMTIME_STANDARD);
 255  0011 4f            	clr	a
 256  0012 cd0000        	call	_FLASH_SetProgrammingTime
 258                     ; 83 	FLASH_Unlock(__FLASH_MEMTYPE_DATA);
 260  0015 a6f7          	ld	a,#247
 261  0017 cd0000        	call	_FLASH_Unlock
 264  001a               L37:
 265                     ; 86 	while(FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET)
 267  001a a608          	ld	a,#8
 268  001c cd0000        	call	_FLASH_GetFlagStatus
 270  001f 4d            	tnz	a
 271  0020 27f8          	jreq	L37
 272                     ; 90 	for (i = 0; i < FLASH_BLOCK_SIZE; i++)
 274  0022 4f            	clr	a
 275  0023 6b09          	ld	(OFST+0,sp),a
 276  0025               L77:
 277                     ; 92 		GBuffer[i] = newval;
 279  0025 5f            	clrw	x
 280  0026 97            	ld	xl,a
 281  0027 7b08          	ld	a,(OFST-1,sp)
 282  0029 d70000        	ld	(_GBuffer,x),a
 283                     ; 90 	for (i = 0; i < FLASH_BLOCK_SIZE; i++)
 285  002c 0c09          	inc	(OFST+0,sp)
 288  002e 7b09          	ld	a,(OFST+0,sp)
 289  0030 a180          	cp	a,#128
 290  0032 25f1          	jrult	L77
 291                     ; 97 	startadd = __FLASH_DATA_START_PHYSICAL_ADDRESS + 
 291                     ; 98 				((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
 293                     ; 100 	add = startadd + addr * 2;
 295  0034 7b0a          	ld	a,(OFST+1,sp)
 296  0036 5f            	clrw	x
 297  0037 97            	ld	xl,a
 298  0038 58            	sllw	x
 299  0039 1c1000        	addw	x,#4096
 300  003c 1f04          	ldw	(OFST-5,sp),x
 301                     ; 101 	return FLASH_ReadByte(add);	
 303  003e cd0000        	call	c_uitolx
 305  0041 be02          	ldw	x,c_lreg+2
 306  0043 89            	pushw	x
 307  0044 be00          	ldw	x,c_lreg
 308  0046 89            	pushw	x
 309  0047 cd0000        	call	_FLASH_ReadByte
 311  004a 5b0e          	addw	sp,#14
 314  004c 81            	ret	
 369                     	xref	__fctcpy
 370                     	switch	.bss
 371  0000               _GBuffer:
 372  0000 000000000000  	ds.b	128
 373                     	xdef	_GBuffer
 374  0080               _OperationStatus:
 375  0080 00            	ds.b	1
 376                     	xdef	_OperationStatus
 377                     	xdef	_file_read
 378                     	xdef	_file_write
 379                     	xref	_FLASH_GetFlagStatus
 380                     	xref	_FLASH_ReadByte
 381                     	xref	_FLASH_ProgramByte
 382                     	xref	_FLASH_Unlock
 383                     	xref	_FLASH_SetProgrammingTime
 384                     	xref.b	c_lreg
 404                     	xref	c_uitolx
 405                     	end
