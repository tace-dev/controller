   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  22                     	switch	.data
  23  0000               __fs:
  24  0000 00            	dc.b	0
  25  0001               __fs2:
  26  0001 00            	dc.b	0
  80                     ; 78 void	factory2wire(void)
  80                     ; 79 {
  81                     .text:	section	.text,new
  82  0000               f_factory2wire:
  84  0000 5203          	subw	sp,#3
  85       00000003      OFST:	set	3
  88                     ; 82 	if( _io_head != _io_tail )
  90  0002 c60000        	ld	a,__io_head
  91  0005 c10000        	cp	a,__io_tail
  92  0008 2730          	jreq	L13
  93                     ; 84 		i = iouart_Ready();
  95  000a 8d000000      	callf	f_iouart_Ready
  97  000e 6b01          	ld	(OFST-2,sp),a
  98                     ; 85 		if( i==1 )
 100  0010 4a            	dec	a
 101  0011 2627          	jrne	L13
 102                     ; 87 			p = iouart_getBuffer();
 104  0013 8d000000      	callf	f_iouart_getBuffer
 106  0017 1f02          	ldw	(OFST-1,sp),x
 107                     ; 88 			p[0] = 0x0;
 109  0019 7f            	clr	(x)
 110                     ; 89 			p[1] = 0x1;
 112  001a a601          	ld	a,#1
 113  001c e701          	ld	(1,x),a
 114                     ; 90 			p[2] = 0x2;
 116  001e 4c            	inc	a
 117  001f e702          	ld	(2,x),a
 118                     ; 91 			p[3] = 0x3;
 120  0021 4c            	inc	a
 121  0022 e703          	ld	(3,x),a
 122                     ; 92 			p[4] = 0x4;
 124  0024 4c            	inc	a
 125  0025 e704          	ld	(4,x),a
 126                     ; 93 			p[5] = 0x5;
 128  0027 4c            	inc	a
 129  0028 e705          	ld	(5,x),a
 130                     ; 94 			p[6] = 0x6;
 132  002a 4c            	inc	a
 133  002b e706          	ld	(6,x),a
 134                     ; 95 			p[7] = 0x15;
 136  002d a615          	ld	a,#21
 137  002f e707          	ld	(7,x),a
 138                     ; 96 			iouart_Set_Packet(0);
 140  0031 4f            	clr	a
 141  0032 8d000000      	callf	f_iouart_Set_Packet
 143                     ; 97 			iouart_Pkt_Start();
 145  0036 8d000000      	callf	f_iouart_Pkt_Start
 147  003a               L13:
 148                     ; 132 }
 151  003a 5b03          	addw	sp,#3
 152  003c 87            	retf	
 183                     ; 545 void	_factoryCntl(uint8_t i)
 183                     ; 546 {
 184                     .text:	section	.text,new
 185  0000               f__factoryCntl:
 189                     ; 557 }
 192  0000 87            	retf	
 224                     ; 820 uint8_t factory(uint8_t mode)
 224                     ; 821 {
 225                     .text:	section	.text,new
 226  0000               f_factory:
 230                     ; 822 	timerCalc();
 233                     ; 840 }
 236  0000 ac000000      	jpf	f_timerCalc
 274                     	xdef	f_factory
 275                     	xdef	f__factoryCntl
 276                     	xdef	f_factory2wire
 277                     	xdef	__fs2
 278                     	xdef	__fs
 279                     	switch	.bss
 280  0000               ___f:
 281  0000 000000000000  	ds.b	8
 282                     	xdef	___f
 283                     	xref	f_timerCalc
 284                     	xref	f_iouart_getBuffer
 285                     	xref	f_iouart_Ready
 286                     	xref	__io_tail
 287                     	xref	__io_head
 288                     	xref	f_iouart_Pkt_Start
 289                     	xref	f_iouart_Set_Packet
 309                     	end
