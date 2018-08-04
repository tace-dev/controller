   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  86                     ; 29 void	file_write(uint8_t addr, uint8_t data)
  86                     ; 30 {
  88                     .text:	section	.text,new
  89  0000               _file_write:
  91  0000 89            	pushw	x
  92  0001 5204          	subw	sp,#4
  93       00000004      OFST:	set	4
  96                     ; 31 	uint16_t	add, startadd, stopadd = 0;
  98                     ; 38 	_fctcpy('F');
 100  0003 a646          	ld	a,#70
 101  0005 cd0000        	call	__fctcpy
 103                     ; 43 	FLASH_SetProgrammingTime(__FLASH_PROGRAMTIME_STANDARD);
 105  0008 4f            	clr	a
 106  0009 cd0000        	call	_FLASH_SetProgrammingTime
 108                     ; 47 	FLASH_Unlock(__FLASH_MEMTYPE_DATA);
 110  000c a6f7          	ld	a,#247
 111  000e cd0000        	call	_FLASH_Unlock
 114  0011               L53:
 115                     ; 51 	while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET)
 117  0011 a608          	ld	a,#8
 118  0013 cd0000        	call	_FLASH_GetFlagStatus
 120  0016 4d            	tnz	a
 121  0017 27f8          	jreq	L53
 122                     ; 54 	startadd = __FLASH_DATA_START_PHYSICAL_ADDRESS + 
 122                     ; 55 				((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
 124                     ; 56 	stopadd = startadd + (uint16_t)FLASH_BLOCK_SIZE;
 126                     ; 58 	FLASH_ProgramByte(startadd + addr * 2, data);
 128  0019 7b06          	ld	a,(OFST+2,sp)
 129  001b 88            	push	a
 130  001c 7b06          	ld	a,(OFST+2,sp)
 131  001e 5f            	clrw	x
 132  001f 97            	ld	xl,a
 133  0020 58            	sllw	x
 134  0021 1c4000        	addw	x,#16384
 135  0024 cd0000        	call	c_uitolx
 137  0027 be02          	ldw	x,c_lreg+2
 138  0029 89            	pushw	x
 139  002a be00          	ldw	x,c_lreg
 140  002c 89            	pushw	x
 141  002d cd0000        	call	_FLASH_ProgramByte
 143  0030 5b0b          	addw	sp,#11
 144                     ; 59 }
 147  0032 81            	ret	
 227                     ; 61 uint8_t	file_read(uint8_t addr)
 227                     ; 62 {	
 228                     .text:	section	.text,new
 229  0000               _file_read:
 231  0000 88            	push	a
 232  0001 5209          	subw	sp,#9
 233       00000009      OFST:	set	9
 236                     ; 63 	uint16_t	add, startadd, stopadd = 0;
 238  0003 5f            	clrw	x
 239  0004 1f01          	ldw	(OFST-8,sp),x
 240                     ; 64 	uint8_t newval = 0xAA;
 242  0006 a6aa          	ld	a,#170
 243  0008 6b08          	ld	(OFST-1,sp),a
 244                     ; 65 	uint8_t prvval = 0xAA;
 246  000a 6b03          	ld	(OFST-6,sp),a
 247                     ; 66 	uint8_t i = 0;
 249                     ; 74 	_fctcpy('F');
 251  000c a646          	ld	a,#70
 252  000e cd0000        	call	__fctcpy
 254                     ; 79 	FLASH_SetProgrammingTime(__FLASH_PROGRAMTIME_STANDARD);
 256  0011 4f            	clr	a
 257  0012 cd0000        	call	_FLASH_SetProgrammingTime
 259                     ; 83 	FLASH_Unlock(__FLASH_MEMTYPE_DATA);
 261  0015 a6f7          	ld	a,#247
 262  0017 cd0000        	call	_FLASH_Unlock
 265  001a               L37:
 266                     ; 86 	while(FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET)
 268  001a a608          	ld	a,#8
 269  001c cd0000        	call	_FLASH_GetFlagStatus
 271  001f 4d            	tnz	a
 272  0020 27f8          	jreq	L37
 273                     ; 90 	for (i = 0; i < FLASH_BLOCK_SIZE; i++)
 275  0022 4f            	clr	a
 276  0023 6b09          	ld	(OFST+0,sp),a
 277  0025               L77:
 278                     ; 92 		GBuffer[i] = newval;
 280  0025 5f            	clrw	x
 281  0026 97            	ld	xl,a
 282  0027 7b08          	ld	a,(OFST-1,sp)
 283  0029 d70000        	ld	(_GBuffer,x),a
 284                     ; 90 	for (i = 0; i < FLASH_BLOCK_SIZE; i++)
 286  002c 0c09          	inc	(OFST+0,sp)
 289  002e 7b09          	ld	a,(OFST+0,sp)
 290  0030 a180          	cp	a,#128
 291  0032 25f1          	jrult	L77
 292                     ; 97 	startadd = __FLASH_DATA_START_PHYSICAL_ADDRESS + 
 292                     ; 98 				((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
 294                     ; 100 	add = startadd + addr * 2;
 296  0034 7b0a          	ld	a,(OFST+1,sp)
 297  0036 5f            	clrw	x
 298  0037 97            	ld	xl,a
 299  0038 58            	sllw	x
 300  0039 1c4000        	addw	x,#16384
 301  003c 1f04          	ldw	(OFST-5,sp),x
 302                     ; 101 	return FLASH_ReadByte(add);	
 304  003e cd0000        	call	c_uitolx
 306  0041 be02          	ldw	x,c_lreg+2
 307  0043 89            	pushw	x
 308  0044 be00          	ldw	x,c_lreg
 309  0046 89            	pushw	x
 310  0047 cd0000        	call	_FLASH_ReadByte
 312  004a 5b0e          	addw	sp,#14
 315  004c 81            	ret	
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
 381                     	xref	_FLASH_SetProgrammingTime
 382                     	xref	_FLASH_ReadByte
 383                     	xref	_FLASH_ProgramByte
 384                     	xref	_FLASH_Unlock
 385                     	xref.b	c_lreg
 405                     	xref	c_uitolx
 406                     	end
