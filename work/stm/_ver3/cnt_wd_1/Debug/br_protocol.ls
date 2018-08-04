   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  23                     	switch	.data
  24  0000               _br_connect:
  25  0000 00            	dc.b	0
  26  0001               _br_type:
  27  0001 00            	dc.b	0
  28  0002               _br_error_checksum:
  29  0002 00            	dc.b	0
  30  0003               _br_buf_count:
  31  0003 00            	dc.b	0
  83                     ; 9 uint8_t br_getHexToBin(uint8_t hex, uint8_t idx)
  83                     ; 10 {
  85                     .text:	section	.text,new
  86  0000               _br_getHexToBin:
  88  0000 89            	pushw	x
  89  0001 88            	push	a
  90       00000001      OFST:	set	1
  93                     ; 11 	uint8_t p = 0x80;
  95                     ; 12 	p = p >> (0x08 - (idx + 0x01));
  97  0002 9f            	ld	a,xl
  98  0003 a007          	sub	a,#7
  99  0005 40            	neg	a
 100  0006 5f            	clrw	x
 101  0007 97            	ld	xl,a
 102  0008 a680          	ld	a,#128
 103  000a 5d            	tnzw	x
 104  000b 2704          	jreq	L6
 105  000d               L01:
 106  000d 44            	srl	a
 107  000e 5a            	decw	x
 108  000f 26fc          	jrne	L01
 109  0011               L6:
 110  0011 6b01          	ld	(OFST+0,sp),a
 111                     ; 14 	if (hex & p)
 113  0013 7b02          	ld	a,(OFST+1,sp)
 114  0015 1501          	bcp	a,(OFST+0,sp)
 115  0017 2704          	jreq	L13
 116                     ; 16 		return 1;
 118  0019 a601          	ld	a,#1
 120  001b 2001          	jra	L21
 121  001d               L13:
 122                     ; 20 		return 0;
 124  001d 4f            	clr	a
 126  001e               L21:
 128  001e 5b03          	addw	sp,#3
 129  0020 81            	ret	
 182                     	xdef	_br_getHexToBin
 183                     	xdef	_br_buf_count
 184                     	switch	.bss
 185  0000               _br_buf_error:
 186  0000 000000000000  	ds.b	15
 187                     	xdef	_br_buf_error
 188                     	xdef	_br_error_checksum
 189                     	xdef	_br_type
 190                     	xdef	_br_connect
 210                     	end
