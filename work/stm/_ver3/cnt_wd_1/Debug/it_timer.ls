   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  23                     	switch	.data
  24  0000               _timer50usCount:
  25  0000 00            	dc.b	0
  26  0001               _timer100usCount:
  27  0001 00            	dc.b	0
  28  0002               __t20ms:
  29  0002 00            	dc.b	0
  30  0003               __io_head:
  31  0003 00            	dc.b	0
  32  0004               __io_tail:
  33  0004 00            	dc.b	0
  34  0005               ____k:
  35  0005 00            	dc.b	0
  36  0006               __mtCount:
  37  0006 14            	dc.b	20
  38  0007               ___t1ms:
  39  0007 00            	dc.b	0
  40  0008               __t1ms:
  41  0008 00            	dc.b	0
  42  0009               __swuart_tx_head:
  43  0009 00            	dc.b	0
  44  000a               __swuart_tx_tail:
  45  000a 00            	dc.b	0
  46  000b               __sw_bit:
  47  000b 00            	dc.b	0
  48  000c               __sw_sending:
  49  000c 00            	dc.b	0
  78                     ; 88 void	timer1CiCb(void)
  78                     ; 89 {	
  80                     .text:	section	.text,new
  81  0000               _timer1CiCb:
  85                     ; 100 }
  88  0000 81            	ret	
 115                     ; 102 void	timer2CiCb(void)
 115                     ; 103 {	
 116                     .text:	section	.text,new
 117  0000               _timer2CiCb:
 121                     ; 104 	if( indiIOUartIdle == 0 )
 123  0000 c60000        	ld	a,_indiIOUartIdle
 124  0003 2624          	jrne	L13
 125                     ; 106 		if( ___k != 0 )
 127  0005 725d0005      	tnz	____k
 128  0009 271e          	jreq	L13
 129                     ; 108 			_io_buf[_io_head++] = ___k;
 131  000b c60003        	ld	a,__io_head
 132  000e 725c0003      	inc	__io_head
 133  0012 5f            	clrw	x
 134  0013 97            	ld	xl,a
 135  0014 c60005        	ld	a,____k
 136  0017 d70041        	ld	(__io_buf,x),a
 137                     ; 109 			if( _io_head == _IO_BUF_SIZE )
 139  001a c60003        	ld	a,__io_head
 140  001d a130          	cp	a,#48
 141  001f 2604          	jrne	L53
 142                     ; 110 				_io_head = 0;
 144  0021 725f0003      	clr	__io_head
 145  0025               L53:
 146                     ; 111 			___k = 0;
 148  0025 725f0005      	clr	____k
 149  0029               L13:
 150                     ; 114 }
 153  0029 81            	ret	
 176                     ; 116 void	timer2_UpdateCb(void)
 176                     ; 117 {
 177                     .text:	section	.text,new
 178  0000               _timer2_UpdateCb:
 182                     ; 139 }
 185  0000 81            	ret	
 214                     .const:	section	.text
 215  0000               L61:
 216  0000 0014          	dc.w	L74
 217  0002 0016          	dc.w	L15
 218  0004 001f          	dc.w	L35
 219  0006 0028          	dc.w	L55
 220  0008 0031          	dc.w	L75
 221  000a 003a          	dc.w	L16
 222  000c 0047          	dc.w	L36
 223  000e 0050          	dc.w	L56
 224  0010 0059          	dc.w	L76
 225  0012 0062          	dc.w	L17
 226  0014 0068          	dc.w	L37
 227                     ; 141 void	_swuartCb(void)
 227                     ; 142 {
 228                     .text:	section	.text,new
 229  0000               __swuartCb:
 233                     ; 145 	if( _sw_sending == 1 )
 235  0000 c6000c        	ld	a,__sw_sending
 236  0003 4a            	dec	a
 237  0004 2670          	jrne	L501
 238                     ; 147 		switch(_sw_bit)
 240  0006 c6000b        	ld	a,__sw_bit
 242                     ; 166 			return;
 243  0009 a10b          	cp	a,#11
 244  000b 2464          	jruge	L111
 245  000d 5f            	clrw	x
 246  000e 97            	ld	xl,a
 247  000f 58            	sllw	x
 248  0010 de0000        	ldw	x,(L61,x)
 249  0013 fc            	jp	(x)
 250  0014               L74:
 251                     ; 149 		case 0: 
 251                     ; 150 			_L;	
 252                     ; 151 			break;
 254  0014 202b          	jp	L331
 255  0016               L15:
 256                     ; 152 		case 1: if( (_sw_data & 0x01)!=0 ) _H; else _L;	break;
 258  0016 7201000002    	btjf	__sw_data,#0,L311
 261  001b 2045          	jp	L17
 262  001d               L311:
 264  001d 2022          	jp	L331
 265  001f               L35:
 266                     ; 153 		case 2: if( (_sw_data & 0x02)!=0 ) _H; else _L;	break;
 268  001f 7203000002    	btjf	__sw_data,#1,L711
 271  0024 203c          	jp	L17
 272  0026               L711:
 274  0026 2019          	jp	L331
 275  0028               L55:
 276                     ; 154 		case 3: if( (_sw_data & 0x04)!=0 ) _H; else _L;	break;
 278  0028 7205000002    	btjf	__sw_data,#2,L321
 281  002d 2033          	jp	L17
 282  002f               L321:
 284  002f 2010          	jp	L331
 285  0031               L75:
 286                     ; 155 		case 4: if( (_sw_data & 0x08)!=0 ) _H; else _L;	break;
 288  0031 7207000002    	btjf	__sw_data,#3,L721
 291  0036 202a          	jp	L17
 292  0038               L721:
 294  0038 2007          	jp	L331
 295  003a               L16:
 296                     ; 156 		case 5: if( (_sw_data & 0x10)!=0 ) _H; else _L;	break;
 298  003a 7209000002    	btjf	__sw_data,#4,L331
 301  003f 2021          	jp	L17
 302  0041               L331:
 313  0041 7215500f      	bres	20495,#2
 314  0045 202a          	jra	L111
 315  0047               L36:
 316                     ; 157 		case 6: if( (_sw_data & 0x20)!=0 ) _H; else _L;	break;
 318  0047 720b000002    	btjf	__sw_data,#5,L731
 321  004c 2014          	jp	L17
 322  004e               L731:
 324  004e 20f1          	jp	L331
 325  0050               L56:
 326                     ; 158 		case 7: if( (_sw_data & 0x40)!=0 ) _H; else _L;	break;
 328  0050 720d000002    	btjf	__sw_data,#6,L341
 331  0055 200b          	jp	L17
 332  0057               L341:
 334  0057 20e8          	jp	L331
 335  0059               L76:
 336                     ; 159 		case 8: if( (_sw_data & 0x80)!=0 ) _H; else _L;	break;
 338  0059 720f000002    	btjf	__sw_data,#7,L741
 341  005e 2002          	jp	L17
 342  0060               L741:
 344  0060 20df          	jp	L331
 345  0062               L17:
 346                     ; 160 		case 9:	
 346                     ; 161 			_H; 
 356  0062 7214500f      	bset	20495,#2
 357                     ; 162 			break;
 359  0066 2009          	jra	L111
 360  0068               L37:
 361                     ; 163 		case 10: 
 361                     ; 164 			_sw_bit = 0;	
 363  0068 725f000b      	clr	__sw_bit
 364                     ; 165 			_sw_sending = 0;
 366  006c 725f000c      	clr	__sw_sending
 367                     ; 166 			return;
 370  0070 81            	ret	
 371  0071               L111:
 372                     ; 168 		_sw_bit++;
 374  0071 725c000b      	inc	__sw_bit
 377  0075 81            	ret	
 378  0076               L501:
 379                     ; 172 		if( _swuart_tx_head != _swuart_tx_tail )
 381  0076 c60009        	ld	a,__swuart_tx_head
 382  0079 c1000a        	cp	a,__swuart_tx_tail
 383  007c 2722          	jreq	L351
 384                     ; 174 			_sw_data = swTxBuffer[_swuart_tx_tail];
 386  007e c6000a        	ld	a,__swuart_tx_tail
 387  0081 5f            	clrw	x
 388  0082 97            	ld	xl,a
 389  0083 d60001        	ld	a,(_swTxBuffer,x)
 390  0086 c70000        	ld	__sw_data,a
 391                     ; 175 			_swuart_tx_tail = (_swuart_tx_tail + 1) % SW_TX_BUFFER_SIZE;
 393  0089 c6000a        	ld	a,__swuart_tx_tail
 394  008c 5f            	clrw	x
 395  008d 97            	ld	xl,a
 396  008e 5c            	incw	x
 397  008f a640          	ld	a,#64
 398  0091 cd0000        	call	c_smodx
 400  0094 01            	rrwa	x,a
 401  0095 c7000a        	ld	__swuart_tx_tail,a
 402                     ; 176 			_sw_sending = 1;
 404  0098 3501000c      	mov	__sw_sending,#1
 405                     ; 177 			_sw_bit = 0;
 407  009c 725f000b      	clr	__sw_bit
 408  00a0               L351:
 409                     ; 181 }
 412  00a0 81            	ret	
 463                     ; 183 void	swuart_Write(uint8_t *p, uint8_t size)
 463                     ; 184 {
 464                     .text:	section	.text,new
 465  0000               _swuart_Write:
 467  0000 89            	pushw	x
 468  0001 88            	push	a
 469       00000001      OFST:	set	1
 472                     ; 188 	for( i=0; i<size; i++ )
 474  0002 0f01          	clr	(OFST+0,sp)
 476  0004 2027          	jra	L502
 477  0006               L102:
 478                     ; 190 		swTxBuffer[_swuart_tx_head] = p[i];
 480  0006 c60009        	ld	a,__swuart_tx_head
 481  0009 5f            	clrw	x
 482  000a 97            	ld	xl,a
 483  000b 89            	pushw	x
 484  000c 7b04          	ld	a,(OFST+3,sp)
 485  000e 97            	ld	xl,a
 486  000f 7b05          	ld	a,(OFST+4,sp)
 487  0011 1b03          	add	a,(OFST+2,sp)
 488  0013 2401          	jrnc	L22
 489  0015 5c            	incw	x
 490  0016               L22:
 491  0016 02            	rlwa	x,a
 492  0017 f6            	ld	a,(x)
 493  0018 85            	popw	x
 494  0019 d70001        	ld	(_swTxBuffer,x),a
 495                     ; 191 		_swuart_tx_head = (_swuart_tx_head + 1) % SW_TX_BUFFER_SIZE;
 497  001c c60009        	ld	a,__swuart_tx_head
 498  001f 5f            	clrw	x
 499  0020 97            	ld	xl,a
 500  0021 5c            	incw	x
 501  0022 a640          	ld	a,#64
 502  0024 cd0000        	call	c_smodx
 504  0027 01            	rrwa	x,a
 505  0028 c70009        	ld	__swuart_tx_head,a
 506                     ; 188 	for( i=0; i<size; i++ )
 508  002b 0c01          	inc	(OFST+0,sp)
 509  002d               L502:
 512  002d 7b01          	ld	a,(OFST+0,sp)
 513  002f 1106          	cp	a,(OFST+5,sp)
 514  0031 25d3          	jrult	L102
 515                     ; 194 }
 518  0033 5b03          	addw	sp,#3
 519  0035 81            	ret	
 548                     ; 200 void	timer485Cntl(void)
 548                     ; 201 {
 549                     .text:	section	.text,new
 550  0000               _timer485Cntl:
 554                     ; 204 	if( enableSamsungHomeNet == 1 || enableSamsungHomeNet == 2 )
 556  0000 c60000        	ld	a,_enableSamsungHomeNet
 557  0003 a101          	cp	a,#1
 558  0005 2704          	jreq	L322
 560  0007 a102          	cp	a,#2
 561  0009 2605          	jrne	L122
 562  000b               L322:
 563                     ; 207 		enableSamsungHomeNet--;
 565  000b 725a0000      	dec	_enableSamsungHomeNet
 566                     ; 208 		return;
 569  000f 81            	ret	
 570  0010               L122:
 571                     ; 210 	else if( enableSamsungHomeNet == 0 )
 573  0010 c60000        	ld	a,_enableSamsungHomeNet
 574  0013 260d          	jrne	L522
 575                     ; 212 		enableSamsungHomeNet = 254;
 577  0015 35fe0000      	mov	_enableSamsungHomeNet,#254
 578                     ; 217 	COM3_ITConfig(COM3_IT_TXE, ENABLE);
 580  0019 4b01          	push	#1
 581  001b ae0277        	ldw	x,#631
 582  001e cd0000        	call	_UART3_ITConfig
 584  0021 84            	pop	a
 585  0022               L522:
 586                     ; 225 	if( indi485Ready != 0 )
 588  0022 c60000        	ld	a,_indi485Ready
 589  0025 2706          	jreq	L132
 590                     ; 226 		indi485Ready--;
 592  0027 725a0000      	dec	_indi485Ready
 594  002b 2004          	jra	L332
 595  002d               L132:
 596                     ; 229 		D_485_READ_ON;
 598  002d 721d5000      	bres	20480,#6
 599  0031               L332:
 600                     ; 232 	if( indi485SendWait != 0 )
 602  0031 c60000        	ld	a,_indi485SendWait
 603  0034 2704          	jreq	L532
 604                     ; 233 		indi485SendWait--;
 606  0036 725a0000      	dec	_indi485SendWait
 607  003a               L532:
 608                     ; 236 	if( indi485bReady != 0 )
 610  003a c60000        	ld	a,_indi485bReady
 611  003d 2706          	jreq	L732
 612                     ; 237 		indi485bReady--;
 614  003f 725a0000      	dec	_indi485bReady
 616  0043 2004          	jra	L142
 617  0045               L732:
 618                     ; 240 		D_485b_READ_ON;
 620  0045 721f500f      	bres	20495,#7
 621  0049               L142:
 622                     ; 243 	if( indi485bSendWait != 0 )
 624  0049 c60000        	ld	a,_indi485bSendWait
 625  004c 2704          	jreq	L342
 626                     ; 244 		indi485bSendWait--;
 628  004e 725a0000      	dec	_indi485bSendWait
 629  0052               L342:
 630                     ; 247 }
 633  0052 81            	ret	
 673                     ; 251 void	timer4_UpdateCb(void)
 673                     ; 252 {
 674                     .text:	section	.text,new
 675  0000               _timer4_UpdateCb:
 679                     ; 253 	_iouart_50ms();
 681  0000 cd0000        	call	__iouart_50ms
 683                     ; 263 	__timer1CiCb_Dw();
 685  0003 cd0000        	call	___timer1CiCb_Dw
 687                     ; 267 	___k++;
 689  0006 725c0005      	inc	____k
 690                     ; 268 	if( timer50usCount == 0 )
 692  000a 725d0000      	tnz	_timer50usCount
 693  000e 2645          	jrne	L552
 694                     ; 271 _mtCount--;
 696  0010 725a0006      	dec	__mtCount
 697                     ; 272 if( _mtCount == 0 )
 699  0014 725d0006      	tnz	__mtCount
 700  0018 2603          	jrne	L752
 701                     ; 273 	_mtCb();
 703  001a cd0000        	call	__mtCb
 705  001d               L752:
 706                     ; 276 		timer50usCount = 1;
 708  001d 35010000      	mov	_timer50usCount,#1
 709                     ; 277 		timer100usCount++;
 711  0021 725c0001      	inc	_timer100usCount
 712                     ; 278 		if( timer100usCount == 100 )
 714  0025 c60001        	ld	a,_timer100usCount
 715  0028 a164          	cp	a,#100
 716  002a 2613          	jrne	L162
 717                     ; 280 			_t20ms++;	//	10ms
 719  002c 725c0002      	inc	__t20ms
 720                     ; 281 			if( _t20ms == 100 )
 722  0030 c60002        	ld	a,__t20ms
 723  0033 a164          	cp	a,#100
 724  0035 2604          	jrne	L362
 725                     ; 282 				_t20ms = 0;
 727  0037 725f0002      	clr	__t20ms
 728  003b               L362:
 729                     ; 283 			timer100usCount = 0;
 731  003b 725f0001      	clr	_timer100usCount
 732  003f               L162:
 733                     ; 350 		_swuartCb();
 735  003f cd0000        	call	__swuartCb
 737                     ; 362 		if( _u9dSendWait != 0 )
 739  0042 ce0000        	ldw	x,__u9dSendWait
 740  0045 2705          	jreq	L562
 741                     ; 363 			_u9dSendWait--;
 743  0047 5a            	decw	x
 744  0048 cf0000        	ldw	__u9dSendWait,x
 747  004b 81            	ret	
 748  004c               L562:
 749                     ; 366 			if( _u9dIdle == 1 )
 751  004c c60000        	ld	a,__u9dIdle
 752  004f 4a            	dec	a
 753  0050 2636          	jrne	L372
 754                     ; 367 				iouart9d_Write();
 758  0052 cc0000        	jp	_iouart9d_Write
 759  0055               L552:
 760                     ; 381 		timer50usCount = 0;
 762  0055 725f0000      	clr	_timer50usCount
 763                     ; 382 		if( indiIOUartSendWait != 0 )
 765  0059 ce0000        	ldw	x,_indiIOUartSendWait
 766  005c 2706          	jreq	L572
 767                     ; 383 			indiIOUartSendWait--;
 769  005e 5a            	decw	x
 770  005f cf0000        	ldw	_indiIOUartSendWait,x
 772  0062 2003          	jra	L772
 773  0064               L572:
 774                     ; 385 			iouart_Write();
 776  0064 cd0000        	call	_iouart_Write
 778  0067               L772:
 779                     ; 387 		__t1ms++;
 781  0067 725c0007      	inc	___t1ms
 782                     ; 388 		if( __t1ms == 10 )
 784  006b c60007        	ld	a,___t1ms
 785  006e a10a          	cp	a,#10
 786  0070 2616          	jrne	L372
 787                     ; 390 			__t1ms = 0;
 789  0072 725f0007      	clr	___t1ms
 790                     ; 391 			timer485Cntl();		
 792  0076 cd0000        	call	_timer485Cntl
 794                     ; 392 			_t1ms++;
 796  0079 725c0008      	inc	__t1ms
 797                     ; 393 			if( _t1ms == 100 )
 799  007d c60008        	ld	a,__t1ms
 800  0080 a164          	cp	a,#100
 801  0082 2604          	jrne	L372
 802                     ; 394 				_t1ms = 0;
 804  0084 725f0008      	clr	__t1ms
 805  0088               L372:
 806                     ; 401 }
 809  0088 81            	ret	
 812                     	switch	.data
 813  000d               ___timer100ms:
 814  000d 00            	dc.b	0
 815  000e               ___timer1s:
 816  000e 00            	dc.b	0
 817  000f               ___timer1sa:
 818  000f 00            	dc.b	0
 819  0010               ___timer1min:
 820  0010 00            	dc.b	0
 821  0011               ___timer1h:
 822  0011 00            	dc.b	0
 823  0012               ___timeri:
 824  0012 00            	dc.b	0
 825  0013               ___timeri2:
 826  0013 00            	dc.b	0
 827  0014               ___timerOffset:
 828  0014 3c            	dc.b	60
 862                     ; 414 uint8_t	timerCalc2(void)
 862                     ; 415 {
 863                     .text:	section	.text,new
 864  0000               _timerCalc2:
 866  0000 88            	push	a
 867       00000001      OFST:	set	1
 870                     ; 416 	uint8_t	r = 0;
 872                     ; 417 	__timer1sa++;
 874  0001 725c000f      	inc	___timer1sa
 875                     ; 418 	if( __timer1sa != __timerOffset )
 877  0005 c6000f        	ld	a,___timer1sa
 878  0008 c10014        	cp	a,___timerOffset
 879  000b 2704          	jreq	L123
 880                     ; 419 		return r;
 882  000d 4f            	clr	a
 885  000e 5b01          	addw	sp,#1
 886  0010 81            	ret	
 887  0011               L123:
 888                     ; 421 	__timerOffset = __timerOffset==60 ? 59 : 60;
 890  0011 c60014        	ld	a,___timerOffset
 891  0014 a13c          	cp	a,#60
 892  0016 2604          	jrne	L25
 893  0018 a63b          	ld	a,#59
 894  001a 2002          	jra	L45
 895  001c               L25:
 896  001c a63c          	ld	a,#60
 897  001e               L45:
 898  001e c70014        	ld	___timerOffset,a
 899                     ; 422 	__timer1sa = 0;
 901  0021 725f000f      	clr	___timer1sa
 902                     ; 423 	__timer1min++;
 904  0025 725c0010      	inc	___timer1min
 905                     ; 424 	r = 1;
 907                     ; 425 	if( __timer1min != 60 )
 909  0029 c60010        	ld	a,___timer1min
 910  002c a13c          	cp	a,#60
 911  002e 2705          	jreq	L323
 912                     ; 426 		return r;
 914  0030 a601          	ld	a,#1
 917  0032 5b01          	addw	sp,#1
 918  0034 81            	ret	
 919  0035               L323:
 920                     ; 428 	__timer1min = 0;
 922  0035 725f0010      	clr	___timer1min
 923                     ; 429 	__timer1h++;
 925  0039 725c0011      	inc	___timer1h
 926                     ; 430 	if( __timer1h == 24 )
 928  003d c60011        	ld	a,___timer1h
 929  0040 a118          	cp	a,#24
 930  0042 2604          	jrne	L523
 931                     ; 431 		__timer1h = 0;
 933  0044 725f0011      	clr	___timer1h
 934  0048               L523:
 935                     ; 433 	return r;
 937  0048 a601          	ld	a,#1
 940  004a 5b01          	addw	sp,#1
 941  004c 81            	ret	
 944                     	switch	.data
 945  0015               __timer100ms255:
 946  0015 00            	dc.b	0
 989                     ; 436 uint8_t	timerCalc(void)
 989                     ; 437 {
 990                     .text:	section	.text,new
 991  0000               _timerCalc:
 993  0000 89            	pushw	x
 994       00000002      OFST:	set	2
 997                     ; 439 	uint8_t	r = 0;
 999  0001 0f02          	clr	(OFST+0,sp)
1000                     ; 441 	uint8_t	i = _t20ms/10;
1002  0003 c60002        	ld	a,__t20ms
1003  0006 5f            	clrw	x
1004  0007 97            	ld	xl,a
1005  0008 a60a          	ld	a,#10
1006  000a 62            	div	x,a
1007  000b 9f            	ld	a,xl
1008  000c 6b01          	ld	(OFST-1,sp),a
1009                     ; 442 	if( __timeri != i )
1011  000e c60012        	ld	a,___timeri
1012  0011 1101          	cp	a,(OFST-1,sp)
1013  0013 2733          	jreq	L26
1014                     ; 444 		__timeri = i;
1016  0015 7b01          	ld	a,(OFST-1,sp)
1017  0017 c70012        	ld	___timeri,a
1018                     ; 445 		__timer100ms++;
1020  001a 725c000d      	inc	___timer100ms
1021                     ; 446 		_timer100ms255++;
1023  001e 725c0015      	inc	__timer100ms255
1024                     ; 447 		if( _timer100ms255 == 200 )
1026  0022 c60015        	ld	a,__timer100ms255
1027  0025 a1c8          	cp	a,#200
1028  0027 2604          	jrne	L743
1029                     ; 448 			_timer100ms255 = 0;
1031  0029 725f0015      	clr	__timer100ms255
1032  002d               L743:
1033                     ; 449 		if( __timer100ms != 10 )
1035  002d c6000d        	ld	a,___timer100ms
1036  0030 a10a          	cp	a,#10
1037                     ; 450 			return r;
1039  0032 2614          	jrne	L26
1040                     ; 452 		__timer100ms = 0;
1042  0034 725f000d      	clr	___timer100ms
1043                     ; 453 		__timer1s++;
1045  0038 725c000e      	inc	___timer1s
1046                     ; 454 		r = timerCalc2();
1048  003c cd0000        	call	_timerCalc2
1050  003f 6b02          	ld	(OFST+0,sp),a
1051                     ; 455 		if( __timer1s != 60 )
1053  0041 c6000e        	ld	a,___timer1s
1054  0044 a13c          	cp	a,#60
1055  0046 2704          	jreq	L353
1056                     ; 456 			return r;
1059  0048               L26:
1062  0048 7b02          	ld	a,(OFST+0,sp)
1064  004a 85            	popw	x
1065  004b 81            	ret	
1066  004c               L353:
1067                     ; 458 		__timer1s = 0;
1069  004c 725f000e      	clr	___timer1s
1070                     ; 460 	return r;
1072  0050 20f6          	jra	L26
1108                     ; 470 void	systemTimer(void)
1108                     ; 471 {
1109                     .text:	section	.text,new
1110  0000               _systemTimer:
1114                     ; 506 	TIM1_ICInit(
1114                     ; 507 		TIM1_CHANNEL_2, 
1114                     ; 508 		TIM1_ICPOLARITY_FALLING,
1114                     ; 509 		TIM1_ICSELECTION_DIRECTTI,
1114                     ; 510 		TIM1_ICPSC_DIV1,
1114                     ; 511 		0
1114                     ; 512 		);
1116  0000 4b00          	push	#0
1117  0002 4b00          	push	#0
1118  0004 4b01          	push	#1
1119  0006 ae0101        	ldw	x,#257
1120  0009 cd0000        	call	_TIM1_ICInit
1122  000c 5b03          	addw	sp,#3
1123                     ; 513 	TIM1_ClearFlag(TIM1_FLAG_CC2);	
1125  000e ae0004        	ldw	x,#4
1126  0011 cd0000        	call	_TIM1_ClearFlag
1128                     ; 514 	TIM1_ITConfig(TIM1_IT_CC2, ENABLE);
1130  0014 ae0401        	ldw	x,#1025
1131  0017 cd0000        	call	_TIM1_ITConfig
1133                     ; 515 	TIM1_Cmd(ENABLE);
1135  001a a601          	ld	a,#1
1136  001c cd0000        	call	_TIM1_Cmd
1138                     ; 518 	TIM2_ICInit(
1138                     ; 519 		TIM2_CHANNEL_2, 
1138                     ; 520 		TIM2_ICPOLARITY_FALLING,
1138                     ; 521 		TIM2_ICSELECTION_DIRECTTI,
1138                     ; 522 		TIM2_ICPSC_DIV1,
1138                     ; 523 		0
1138                     ; 524 		);
1140  001f 4b00          	push	#0
1141  0021 4b00          	push	#0
1142  0023 4b01          	push	#1
1143  0025 ae0144        	ldw	x,#324
1144  0028 cd0000        	call	_TIM2_ICInit
1146  002b 5b03          	addw	sp,#3
1147                     ; 525 	TIM2_ClearFlag(TIM2_FLAG_CC2);	
1149  002d ae0004        	ldw	x,#4
1150  0030 cd0000        	call	_TIM2_ClearFlag
1152                     ; 526 	TIM2_ITConfig(TIM2_IT_CC2, ENABLE);
1154  0033 ae0401        	ldw	x,#1025
1155  0036 cd0000        	call	_TIM2_ITConfig
1157                     ; 527 	TIM2_Cmd(ENABLE);
1159  0039 a601          	ld	a,#1
1160  003b cd0000        	call	_TIM2_Cmd
1162                     ; 529 	TIM4_TimeBaseInit(TIM4_PRESCALER_32, TIMER_PERIOD);
1164  003e ae0518        	ldw	x,#1304
1165  0041 cd0000        	call	_TIM4_TimeBaseInit
1167                     ; 530 	TIM4_ClearFlag(TIM4_FLAG_UPDATE);
1169  0044 a601          	ld	a,#1
1170  0046 cd0000        	call	_TIM4_ClearFlag
1172                     ; 531 	TIM4_ITConfig(TIM4_IT_UPDATE, ENABLE);
1174  0049 ae0101        	ldw	x,#257
1175  004c cd0000        	call	_TIM4_ITConfig
1177                     ; 532 	TIM4_Cmd(ENABLE);
1179  004f a601          	ld	a,#1
1180  0051 cd0000        	call	_TIM4_Cmd
1182                     ; 533 	GPIO_Init(SWUART_PORT, SWUART_PIN, D_IO_OUT_TRIGER);
1184  0054 4be0          	push	#224
1185  0056 4b04          	push	#4
1186  0058 ae500f        	ldw	x,#20495
1187  005b cd0000        	call	_GPIO_Init
1189  005e 85            	popw	x
1190                     ; 539 	GPIO_Init(D_IOUART3d_RX_PORT, D_IOUART3d_RX_PIN, D_IO_IN_TRIGER_NOIT);
1192  005f 4b40          	push	#64
1193  0061 4b04          	push	#4
1194  0063 ae500a        	ldw	x,#20490
1195  0066 cd0000        	call	_GPIO_Init
1197  0069 85            	popw	x
1198                     ; 543 }
1201  006a 81            	ret	
1234                     ; 545 void	timer2Cntl(uint8_t mode)
1234                     ; 546 {
1235                     .text:	section	.text,new
1236  0000               _timer2Cntl:
1240                     ; 548 	TIM2_ITConfig(TIM2_IT_CC2, mode);
1242  0000 97            	ld	xl,a
1243  0001 a604          	ld	a,#4
1244  0003 95            	ld	xh,a
1246                     ; 550 	return;
1249  0004 cc0000        	jp	_TIM2_ITConfig
1487                     	xdef	__timer100ms255
1488                     	xdef	_timerCalc2
1489                     	xdef	___timerOffset
1490                     	xdef	___timeri2
1491                     	xdef	___timeri
1492                     	xdef	___timer1sa
1493                     	xref	__iouart_50ms
1494                     	xdef	_timer485Cntl
1495                     	xref	_enableSamsungHomeNet
1496                     	xdef	__swuartCb
1497                     	xref	_iouart9d_Write
1498                     	xref	___timer1CiCb_Dw
1499                     	xref	__u9dSendWait
1500                     	xref	__u9dIdle
1501                     	xdef	__sw_sending
1502                     	xdef	__sw_bit
1503                     	switch	.bss
1504  0000               __sw_data:
1505  0000 00            	ds.b	1
1506                     	xdef	__sw_data
1507                     	xdef	__swuart_tx_tail
1508                     	xdef	__swuart_tx_head
1509  0001               _swTxBuffer:
1510  0001 000000000000  	ds.b	64
1511                     	xdef	_swTxBuffer
1512                     	xdef	__t1ms
1513                     	xdef	___t1ms
1514                     	xdef	__mtCount
1515                     	xdef	____k
1516                     	xdef	_swuart_Write
1517                     	xdef	_timer1CiCb
1518                     	xdef	_timerCalc
1519                     	xdef	_timer2CiCb
1520                     	xdef	_timer2_UpdateCb
1521                     	xdef	_timer4_UpdateCb
1522                     	xdef	_systemTimer
1523                     	xdef	___timer1h
1524                     	xdef	___timer1min
1525                     	xdef	___timer1s
1526                     	xdef	___timer100ms
1527                     	xdef	__t20ms
1528                     	xdef	_timer50usCount
1529                     	xdef	_timer100usCount
1530                     	xref	_indi485bSendWait
1531                     	xref	_indi485bReady
1532                     	xref	_indi485SendWait
1533                     	xref	_indi485Ready
1534  0041               __io_buf:
1535  0041 000000000000  	ds.b	48
1536                     	xdef	__io_buf
1537                     	xdef	__io_tail
1538                     	xdef	__io_head
1539                     	xref	_iouart_Write
1540                     	xdef	_timer2Cntl
1541                     	xref	_indiIOUartIdle
1542                     	xref	_indiIOUartSendWait
1543                     	xref	__mtCb
1544                     	xref	_UART3_ITConfig
1545                     	xref	_TIM4_ClearFlag
1546                     	xref	_TIM4_ITConfig
1547                     	xref	_TIM4_Cmd
1548                     	xref	_TIM4_TimeBaseInit
1549                     	xref	_TIM2_ClearFlag
1550                     	xref	_TIM2_ITConfig
1551                     	xref	_TIM2_Cmd
1552                     	xref	_TIM2_ICInit
1553                     	xref	_TIM1_ClearFlag
1554                     	xref	_TIM1_ITConfig
1555                     	xref	_TIM1_Cmd
1556                     	xref	_TIM1_ICInit
1557                     	xref	_GPIO_Init
1558                     	xref.b	c_x
1578                     	xref	c_smodx
1579                     	end
