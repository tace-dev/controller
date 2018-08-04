   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  22                     	switch	.data
  23  0000               _indiEncoderPrevCode:
  24  0000 64            	dc.b	100
  25  0001               _indiEncoderFlag:
  26  0001 00            	dc.b	0
  27  0002               _indiEncoderMove:
  28  0002 00            	dc.b	0
  29  0003               __key_sec:
  30  0003 00            	dc.b	0
  31  0004               __key_min:
  32  0004 00            	dc.b	0
  33  0005               __key_hour:
  34  0005 00            	dc.b	0
  35  0006               ___key2:
  36  0006 00            	dc.b	0
  37  0007               ___key_2:
  38  0007 00            	dc.b	0
  67                     ; 28 uint8_t	key_get(void)
  67                     ; 29 {
  69                     .text:	section	.text,new
  70  0000               _key_get:
  74                     ; 67 	return 0;
  76  0000 4f            	clr	a
  79  0001 81            	ret	
 111                     ; 71 void	encoder_resetCount(uint8_t code)
 111                     ; 72 {
 112                     .text:	section	.text,new
 113  0000               _encoder_resetCount:
 117                     ; 84 }
 120  0000 81            	ret	
 143                     ; 86 void	encoder_irq(void)
 143                     ; 87 {
 144                     .text:	section	.text,new
 145  0000               _encoder_irq:
 149                     ; 96 }
 152  0000 81            	ret	
 155                     	switch	.data
 156  0008               __key_pressed:
 157  0008 00            	dc.b	0
 158  0009               __key_timer:
 159  0009 00            	dc.b	0
 160  000a               __key_code:
 161  000a 00            	dc.b	0
 162  000b               __key_complete:
 163  000b 00            	dc.b	0
 164  000c               __enc_t1:
 165  000c 00            	dc.b	0
 166  000d               __key_continue:
 167  000d 00            	dc.b	0
 188                     ; 107 uint8_t	key_ready(void)
 188                     ; 108 {
 189                     .text:	section	.text,new
 190  0000               _key_ready:
 194                     ; 210 	return 0;
 196  0000 4f            	clr	a
 199  0001 81            	ret	
 227                     ; 213 void 	encoder_Open(void)
 227                     ; 214 {
 228                     .text:	section	.text,new
 229  0000               _encoder_Open:
 233                     ; 215 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
 235  0000 ae1101        	ldw	x,#4353
 236  0003 cd0000        	call	_CLK_PeripheralClockConfig
 238                     ; 246 	TIM1_ICInit(
 238                     ; 247 		TIM1_Channel_3, 
 238                     ; 248 		TIM1_ICPolarity_Falling,
 238                     ; 249 		TIM1_ICSelection_DirectTI,
 238                     ; 250 		TIM1_ICPSC_DIV1,
 238                     ; 251 		0
 238                     ; 252 		);
 240  0006 4b00          	push	#0
 241  0008 4b00          	push	#0
 242  000a 4b01          	push	#1
 243  000c ae0201        	ldw	x,#513
 244  000f cd0000        	call	_TIM1_ICInit
 246  0012 5b03          	addw	sp,#3
 247                     ; 253 	TIM1_ClearFlag(TIM1_FLAG_CC3);	
 249  0014 ae0008        	ldw	x,#8
 250  0017 cd0000        	call	_TIM1_ClearFlag
 252                     ; 254 	TIM1_ITConfig(TIM1_IT_CC3, ENABLE);
 254  001a ae0801        	ldw	x,#2049
 255  001d cd0000        	call	_TIM1_ITConfig
 257                     ; 255 	TIM1_Cmd(ENABLE);
 259  0020 a601          	ld	a,#1
 261                     ; 265 }
 264  0022 cc0000        	jp	_TIM1_Cmd
 393                     	xdef	__key_continue
 394                     	xdef	__enc_t1
 395                     	xdef	__key_complete
 396                     	xdef	__key_code
 397                     	xdef	__key_timer
 398                     	xdef	__key_pressed
 399                     	xdef	_encoder_resetCount
 400                     	xdef	___key_2
 401                     	xdef	___key2
 402                     	xdef	__key_hour
 403                     	xdef	__key_min
 404                     	xdef	__key_sec
 405                     	xdef	_indiEncoderMove
 406                     	xdef	_indiEncoderPrevCode
 407                     	xdef	_key_ready
 408                     	xdef	_encoder_Open
 409                     	xdef	_encoder_irq
 410                     	xdef	_indiEncoderFlag
 411                     	switch	.bss
 412  0000               _indiEncoderCode:
 413  0000 00            	ds.b	1
 414                     	xdef	_indiEncoderCode
 415                     	xdef	_key_get
 416                     	xref	_TIM1_ClearFlag
 417                     	xref	_TIM1_ITConfig
 418                     	xref	_TIM1_ICInit
 419                     	xref	_TIM1_Cmd
 420                     	xref	_CLK_PeripheralClockConfig
 440                     	end
