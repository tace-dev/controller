   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  84                     ; 29 void	file_write(uint8_t addr, uint8_t data)
  84                     ; 30 {
  86                     	switch	.text
  87  0000               _file_write:
  89  0000 89            	pushw	x
  90  0001 5204          	subw	sp,#4
  91       00000004      OFST:	set	4
  94                     ; 31 	uint16_t	add, startadd, stopadd = 0;
  96                     ; 38 	_fctcpy('F');
  98  0003 a646          	ld	a,#70
  99  0005 cd0000        	call	__fctcpy
 101                     ; 43 	FLASH_SetProgrammingTime(__FLASH_PROGRAMTIME_STANDARD);
 103  0008 4f            	clr	a
 104  0009 cd0000        	call	_FLASH_SetProgrammingTime
 106                     ; 47 	FLASH_Unlock(__FLASH_MEMTYPE_DATA);
 108  000c a6f7          	ld	a,#247
 109  000e cd0000        	call	_FLASH_Unlock
 112  0011               L53:
 113                     ; 51 	while (FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET)
 115  0011 a608          	ld	a,#8
 116  0013 cd0000        	call	_FLASH_GetFlagStatus
 118  0016 4d            	tnz	a
 119  0017 27f8          	jreq	L53
 120                     ; 54 	startadd = __FLASH_DATA_START_PHYSICAL_ADDRESS + 
 120                     ; 55 				((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
 122                     ; 56 	stopadd = startadd + (uint16_t)FLASH_BLOCK_SIZE;
 124                     ; 58 	FLASH_ProgramByte(startadd + addr * 2, data);
 126  0019 7b06          	ld	a,(OFST+2,sp)
 127  001b 88            	push	a
 128  001c 7b06          	ld	a,(OFST+2,sp)
 129  001e 5f            	clrw	x
 130  001f 97            	ld	xl,a
 131  0020 58            	sllw	x
 132  0021 1c1000        	addw	x,#4096
 133  0024 cd0000        	call	c_uitolx
 135  0027 be02          	ldw	x,c_lreg+2
 136  0029 89            	pushw	x
 137  002a be00          	ldw	x,c_lreg
 138  002c 89            	pushw	x
 139  002d cd0000        	call	_FLASH_ProgramByte
 141  0030 5b0b          	addw	sp,#11
 142                     ; 59 }
 145  0032 81            	ret	
 225                     ; 61 uint8_t	file_read(uint8_t addr)
 225                     ; 62 {	
 226                     	switch	.text
 227  0033               _file_read:
 229  0033 88            	push	a
 230  0034 5209          	subw	sp,#9
 231       00000009      OFST:	set	9
 234                     ; 63 	uint16_t	add, startadd, stopadd = 0;
 236  0036 5f            	clrw	x
 237  0037 1f01          	ldw	(OFST-8,sp),x
 238                     ; 64 	uint8_t newval = 0xAA;
 240  0039 a6aa          	ld	a,#170
 241  003b 6b08          	ld	(OFST-1,sp),a
 242                     ; 65 	uint8_t prvval = 0xAA;
 244  003d 6b03          	ld	(OFST-6,sp),a
 245                     ; 66 	uint8_t i = 0;
 247                     ; 74 	_fctcpy('F');
 249  003f a646          	ld	a,#70
 250  0041 cd0000        	call	__fctcpy
 252                     ; 79 	FLASH_SetProgrammingTime(__FLASH_PROGRAMTIME_STANDARD);
 254  0044 4f            	clr	a
 255  0045 cd0000        	call	_FLASH_SetProgrammingTime
 257                     ; 83 	FLASH_Unlock(__FLASH_MEMTYPE_DATA);
 259  0048 a6f7          	ld	a,#247
 260  004a cd0000        	call	_FLASH_Unlock
 263  004d               L37:
 264                     ; 86 	while(FLASH_GetFlagStatus(FLASH_FLAG_DUL) == RESET)
 266  004d a608          	ld	a,#8
 267  004f cd0000        	call	_FLASH_GetFlagStatus
 269  0052 4d            	tnz	a
 270  0053 27f8          	jreq	L37
 271                     ; 90 	for (i = 0; i < FLASH_BLOCK_SIZE; i++)
 273  0055 4f            	clr	a
 274  0056 6b09          	ld	(OFST+0,sp),a
 275  0058               L77:
 276                     ; 92 		GBuffer[i] = newval;
 278  0058 5f            	clrw	x
 279  0059 97            	ld	xl,a
 280  005a 7b08          	ld	a,(OFST-1,sp)
 281  005c d70000        	ld	(_GBuffer,x),a
 282                     ; 90 	for (i = 0; i < FLASH_BLOCK_SIZE; i++)
 284  005f 0c09          	inc	(OFST+0,sp)
 287  0061 7b09          	ld	a,(OFST+0,sp)
 288  0063 a180          	cp	a,#128
 289  0065 25f1          	jrult	L77
 290                     ; 97 	startadd = __FLASH_DATA_START_PHYSICAL_ADDRESS + 
 290                     ; 98 				((uint16_t)BLOCK_OPERATION * (uint16_t)FLASH_BLOCK_SIZE);
 292                     ; 100 	add = startadd + addr * 2;
 294  0067 7b0a          	ld	a,(OFST+1,sp)
 295  0069 5f            	clrw	x
 296  006a 97            	ld	xl,a
 297  006b 58            	sllw	x
 298  006c 1c1000        	addw	x,#4096
 299  006f 1f04          	ldw	(OFST-5,sp),x
 300                     ; 101 	return FLASH_ReadByte(add);	
 302  0071 cd0000        	call	c_uitolx
 304  0074 be02          	ldw	x,c_lreg+2
 305  0076 89            	pushw	x
 306  0077 be00          	ldw	x,c_lreg
 307  0079 89            	pushw	x
 308  007a cd0000        	call	_FLASH_ReadByte
 310  007d 5b0e          	addw	sp,#14
 313  007f 81            	ret	
 368                     	xref	__fctcpy
 369                     	switch	.bss
 370  0000               _GBuffer:
 371  0000 000000000000  	ds.b	128
 372                     	xdef	_GBuffer
 373  0080               _OperationStatus:
 374  0080 00            	ds.b	1
 375                     	xdef	_OperationStatus
 376                     	xdef	_file_read
 377                     	xdef	_file_write
 378                     	xref	_FLASH_GetFlagStatus
 379                     	xref	_FLASH_ReadByte
 380                     	xref	_FLASH_ProgramByte
 381                     	xref	_FLASH_Unlock
 382                     	xref	_FLASH_SetProgrammingTime
 383                     	xref.b	c_lreg
 403                     	xref	c_uitolx
 404                     	end
