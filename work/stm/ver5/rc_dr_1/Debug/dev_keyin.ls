   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  22                     	switch	.data
  23  0000               __key_sec:
  24  0000 00            	dc.b	0
  25  0001               __key_min:
  26  0001 00            	dc.b	0
  27  0002               __key_hour:
  28  0002 00            	dc.b	0
  29  0003               ___key2:
  30  0003 00            	dc.b	0
  31  0004               ___key_2:
  32  0004 00            	dc.b	0
  33  0005               __key_continue:
  34  0005 00            	dc.b	0
  35  0006               _indiEncoderPrevCode:
  36  0006 64            	dc.b	100
  37  0007               _indiEncoderFlag:
  38  0007 00            	dc.b	0
  39  0008               _indiEncoderMove:
  40  0008 00            	dc.b	0
  69                     ; 31 uint8_t	key_get(void)
  69                     ; 32 {
  71                     .text:	section	.text,new
  72  0000               _key_get:
  76                     ; 70 	return 0;
  78  0000 4f            	clr	a
  81  0001 81            	ret	
 113                     ; 74 void	encoder_resetCount(uint8_t code)
 113                     ; 75 {
 114                     .text:	section	.text,new
 115  0000               _encoder_resetCount:
 119                     ; 87 }
 122  0000 81            	ret	
 145                     ; 89 void	encoder_irq(void)
 145                     ; 90 {
 146                     .text:	section	.text,new
 147  0000               _encoder_irq:
 151                     ; 99 }
 154  0000 81            	ret	
 157                     	switch	.data
 158  0009               __key_pressed:
 159  0009 00            	dc.b	0
 160  000a               __key_timer:
 161  000a 00            	dc.b	0
 162  000b               __key_code:
 163  000b 00            	dc.b	0
 164  000c               __key_complete:
 165  000c 00            	dc.b	0
 166  000d               __enc_t1:
 167  000d 00            	dc.b	0
 188                     ; 109 uint8_t	key_ready(void)
 188                     ; 110 {
 189                     .text:	section	.text,new
 190  0000               _key_ready:
 194                     ; 212 	return 0;
 196  0000 4f            	clr	a
 199  0001 81            	ret	
 227                     ; 215 void 	encoder_Open(void)
 227                     ; 216 {
 228                     .text:	section	.text,new
 229  0000               _encoder_Open:
 233                     ; 217 	CLK_PeripheralClockConfig(CLK_Peripheral_TIM1, ENABLE);
 235  0000 ae1101        	ldw	x,#4353
 236  0003 cd0000        	call	_CLK_PeripheralClockConfig
 238                     ; 248 	TIM1_ICInit(
 238                     ; 249 		TIM1_Channel_3, 
 238                     ; 250 		TIM1_ICPolarity_Falling,
 238                     ; 251 		TIM1_ICSelection_DirectTI,
 238                     ; 252 		TIM1_ICPSC_DIV1,
 238                     ; 253 		0
 238                     ; 254 		);
 240  0006 4b00          	push	#0
 241  0008 4b00          	push	#0
 242  000a 4b01          	push	#1
 243  000c ae0201        	ldw	x,#513
 244  000f cd0000        	call	_TIM1_ICInit
 246  0012 5b03          	addw	sp,#3
 247                     ; 255 	TIM1_ClearFlag(TIM1_FLAG_CC3);	
 249  0014 ae0008        	ldw	x,#8
 250  0017 cd0000        	call	_TIM1_ClearFlag
 252                     ; 256 	TIM1_ITConfig(TIM1_IT_CC3, ENABLE);
 254  001a ae0801        	ldw	x,#2049
 255  001d cd0000        	call	_TIM1_ITConfig
 257                     ; 257 	TIM1_Cmd(ENABLE);
 259  0020 a601          	ld	a,#1
 261                     ; 267 }
 264  0022 cc0000        	jp	_TIM1_Cmd
 393                     	xdef	__enc_t1
 394                     	xdef	__key_complete
 395                     	xdef	__key_code
 396                     	xdef	__key_timer
 397                     	xdef	__key_pressed
 398                     	xdef	_encoder_resetCount
 399                     	xdef	_indiEncoderMove
 400                     	xdef	_indiEncoderPrevCode
 401                     	xdef	__key_continue
 402                     	xdef	___key_2
 403                     	xdef	___key2
 404                     	xdef	__key_hour
 405                     	xdef	__key_min
 406                     	xdef	__key_sec
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
