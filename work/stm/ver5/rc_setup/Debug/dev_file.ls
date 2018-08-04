   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  82                     ; 29 void	file_write(uint8_t addr, uint8_t data)
  82                     ; 30 {
  84                     .text:	section	.text,new
  85  0000               _file_write:
  87  0000 89            	pushw	x
  88  0001 5204          	subw	sp,#4
  89       00000004      OFST:	set	4
  92                     ; 31 	uint16_t	add, startadd, stopadd = 0;
  94                     ; 38 	_fctcpy('F');
  96  0003 a646          	ld	a,#70
  97  0005 cd0000        	call	__fctcpy
  99                     ; 43 	FLASH_SetProgrammingTime(__FLASH_PROGRAMTIME_STANDARD);
 101  0008 4f            	clr	a
 102  0009 cd0000        	call	_FLASH_SetProgrammingTime
 104                     ; 47 	FLASH_Unlock(__FLASH_MEMTYPE_DATA);
 106  000c a6f7          	ld	a,#247
 107  000e cd0000        	call	_FLASH_Unlock
 110  0011               L53:
 111                     ; 51 	while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET)
 113  0011 a608          	ld	a,#8
 114  0013 cd0000        	call	_FLASH_GetFlagStatus
 116  0016 4d            	tnz	a
 117  0017 27f8          	jreq	L53
 118                     ; 54 	startadd = __FLASH_DATA_START_PHYSICAL_ADDRESS + 
 118                     ; 55 				((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
 120                     ; 56 	stopadd = startadd + (uint16_t)FLASH_BLOCK_SIZE;
 122                     ; 58 	FLASH_ProgramByte(startadd + addr * 2, data);
 124  0019 7b06          	ld	a,(OFST+2,sp)
 125  001b 88            	push	a
 126  001c 7b06          	ld	a,(OFST+2,sp)
 127  001e 5f            	clrw	x
 128  001f 97            	ld	xl,a
 129  0020 58            	sllw	x
 130  0021 1c1000        	addw	x,#4096
 131  0024 cd0000        	call	c_uitolx
 133  0027 be02          	ldw	x,c_lreg+2
 134  0029 89            	pushw	x
 135  002a be00          	ldw	x,c_lreg
 136  002c 89            	pushw	x
 137  002d cd0000        	call	_FLASH_ProgramByte
 139  0030 5b05          	addw	sp,#5
 140                     ; 59 }
 143  0032 5b06          	addw	sp,#6
 144  0034 81            	ret
 224                     ; 61 uint8_t	file_read(uint8_t addr)
 224                     ; 62 {	
 225                     .text:	section	.text,new
 226  0000               _file_read:
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
 243  000a a6aa          	ld	a,#170
 244  000c 6b03          	ld	(OFST-6,sp),a
 245                     ; 66 	uint8_t i = 0;
 247                     ; 74 	_fctcpy('F');
 249  000e a646          	ld	a,#70
 250  0010 cd0000        	call	__fctcpy
 252                     ; 79 	FLASH_SetProgrammingTime(__FLASH_PROGRAMTIME_STANDARD);
 254  0013 4f            	clr	a
 255  0014 cd0000        	call	_FLASH_SetProgrammingTime
 257                     ; 83 	FLASH_Unlock(__FLASH_MEMTYPE_DATA);
 259  0017 a6f7          	ld	a,#247
 260  0019 cd0000        	call	_FLASH_Unlock
 263  001c               L37:
 264                     ; 86 	while(FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET)
 266  001c a608          	ld	a,#8
 267  001e cd0000        	call	_FLASH_GetFlagStatus
 269  0021 4d            	tnz	a
 270  0022 27f8          	jreq	L37
 271                     ; 90 	for (i = 0; i < FLASH_BLOCK_SIZE; i++)
 273  0024 0f09          	clr	(OFST+0,sp)
 274  0026               L77:
 275                     ; 92 		GBuffer[i] = newval;
 277  0026 7b09          	ld	a,(OFST+0,sp)
 278  0028 5f            	clrw	x
 279  0029 97            	ld	xl,a
 280  002a 7b08          	ld	a,(OFST-1,sp)
 281  002c d70000        	ld	(_GBuffer,x),a
 282                     ; 90 	for (i = 0; i < FLASH_BLOCK_SIZE; i++)
 284  002f 0c09          	inc	(OFST+0,sp)
 287  0031 7b09          	ld	a,(OFST+0,sp)
 288  0033 a180          	cp	a,#128
 289  0035 25ef          	jrult	L77
 290                     ; 97 	startadd = __FLASH_DATA_START_PHYSICAL_ADDRESS + 
 290                     ; 98 				((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
 292                     ; 100 	add = startadd + addr * 2;
 294  0037 7b0a          	ld	a,(OFST+1,sp)
 295  0039 5f            	clrw	x
 296  003a 97            	ld	xl,a
 297  003b 58            	sllw	x
 298  003c 1c1000        	addw	x,#4096
 299  003f 1f04          	ldw	(OFST-5,sp),x
 300                     ; 101 	return FLASH_ReadByte(add);	
 302  0041 1e04          	ldw	x,(OFST-5,sp)
 303  0043 cd0000        	call	c_uitolx
 305  0046 be02          	ldw	x,c_lreg+2
 306  0048 89            	pushw	x
 307  0049 be00          	ldw	x,c_lreg
 308  004b 89            	pushw	x
 309  004c cd0000        	call	_FLASH_ReadByte
 311  004f 5b04          	addw	sp,#4
 314  0051 5b0a          	addw	sp,#10
 315  0053 81            	ret
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
