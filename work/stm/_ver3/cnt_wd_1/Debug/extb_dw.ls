   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  23                     	switch	.data
  24  0000               _dw_error_reset:
  25  0000 00            	dc.b	0
  26  0001               _dw_error_reset_count:
  27  0001 05            	dc.b	5
 129                     ; 80 LPBRDW	get_brDw(void)
 129                     ; 81 {
 131                     .text:	section	.text,new
 132  0000               _get_brDw:
 136                     ; 82 	return &brDw;
 138  0000 ae0000        	ldw	x,#_brDw
 141  0003 81            	ret	
 196                     ; 85 void br_dw_ptc_make(void) 
 196                     ; 86 {
 197                     .text:	section	.text,new
 198  0000               _br_dw_ptc_make:
 200  0000 5205          	subw	sp,#5
 201       00000005      OFST:	set	5
 204                     ; 87 	LPBRDW	p = get_brDw();
 206  0002 cd0000        	call	_get_brDw
 208  0005 1f04          	ldw	(OFST-1,sp),x
 209                     ; 91 	i = funcInfo.rcLED | funcInfo.sub_rcLED;
 211  0007 c60012        	ld	a,_funcInfo+18
 212  000a ca0013        	or	a,_funcInfo+19
 213  000d 6b02          	ld	(OFST-3,sp),a
 214                     ; 92 	if( i == 0 )
 216  000f 260f          	jrne	L301
 217                     ; 94 		p->b[0] = 0xc3;
 219  0011 a6c3          	ld	a,#195
 220  0013 e709          	ld	(9,x),a
 222  0015               L501:
 223                     ; 140 	iouart9d_Set_Packet(DW_WAIT);
 225  0015 a601          	ld	a,#1
 226  0017 cd0000        	call	_iouart9d_Set_Packet
 228                     ; 141 	iouart9d_Pkt_Start();
 230  001a cd0000        	call	_iouart9d_Pkt_Start
 232                     ; 142 }
 235  001d 5b05          	addw	sp,#5
 236  001f 81            	ret	
 237  0020               L301:
 238                     ; 99 		switch(p->type)
 240  0020 e602          	ld	a,(2,x)
 242                     ; 102 			case	1:	i = 0xf0;	j = funcInfo.boiler_set_water_shower;	break;
 243  0022 2705          	jreq	L35
 244  0024 4a            	dec	a
 245  0025 270b          	jreq	L55
 246  0027 2012          	jra	L111
 247  0029               L35:
 248                     ; 101 			case	0:	i = 0x20;	j = funcInfo.boiler_set_water_heat;	break;
 250  0029 a620          	ld	a,#32
 251  002b 6b02          	ld	(OFST-3,sp),a
 254  002d c60004        	ld	a,_funcInfo+4
 257  0030 2007          	jp	LC001
 258  0032               L55:
 259                     ; 102 			case	1:	i = 0xf0;	j = funcInfo.boiler_set_water_shower;	break;
 261  0032 a6f0          	ld	a,#240
 262  0034 6b02          	ld	(OFST-3,sp),a
 265  0036 c60003        	ld	a,_funcInfo+3
 266  0039               LC001:
 267  0039 6b03          	ld	(OFST-2,sp),a
 270  003b               L111:
 271                     ; 104 		p->type = (p->type+1)%2;
 273  003b 1e04          	ldw	x,(OFST-1,sp)
 274  003d e602          	ld	a,(2,x)
 275  003f 5f            	clrw	x
 276  0040 97            	ld	xl,a
 277  0041 5c            	incw	x
 278  0042 a602          	ld	a,#2
 279  0044 cd0000        	call	c_smodx
 281  0047 1604          	ldw	y,(OFST-1,sp)
 282  0049 01            	rrwa	x,a
 283  004a 90e702        	ld	(2,y),a
 284                     ; 105 		p->b[0] = i;
 286  004d 1e04          	ldw	x,(OFST-1,sp)
 287  004f 7b02          	ld	a,(OFST-3,sp)
 288  0051 e709          	ld	(9,x),a
 289                     ; 106 		j /= 2;
 291  0053 0403          	srl	(OFST-2,sp)
 292                     ; 107 		p->b[1] = ((j/10)<<4)|(j%10);
 294  0055 5f            	clrw	x
 295  0056 7b03          	ld	a,(OFST-2,sp)
 296  0058 97            	ld	xl,a
 297  0059 a60a          	ld	a,#10
 298  005b 62            	div	x,a
 299  005c 6b01          	ld	(OFST-4,sp),a
 300  005e a610          	ld	a,#16
 301  0060 42            	mul	x,a
 302  0061 9f            	ld	a,xl
 303  0062 1e04          	ldw	x,(OFST-1,sp)
 304  0064 1a01          	or	a,(OFST-4,sp)
 305  0066 e70a          	ld	(10,x),a
 306  0068 20ab          	jra	L501
 349                     ; 144 void br_dw_ptc_check(uint8_t *buf) 
 349                     ; 145 {
 350                     .text:	section	.text,new
 351  0000               _br_dw_ptc_check:
 353  0000 89            	pushw	x
 354       00000000      OFST:	set	0
 357                     ; 146 	br_type = BR_TYPE_DW;
 359  0001 35040000      	mov	_br_type,#4
 360                     ; 153 	br_connect = 0;	//	boiler timeout clear
 362  0005 725f0000      	clr	_br_connect
 363                     ; 154 	ext_br_error = 1;
 365  0009 35010000      	mov	_ext_br_error,#1
 366                     ; 155 	_dwInfo.br_err = 0;
 368  000d 725f001a      	clr	__dwInfo+13
 369                     ; 156 	switch( buf[0] )
 371  0011 f6            	ld	a,(x)
 372  0012 a178          	cp	a,#120
 373  0014 2607          	jrne	L731
 376                     ; 158 		case 0x78:
 376                     ; 159 			_dwInfo.br_err = buf[1];
 378  0016 1e01          	ldw	x,(OFST+1,sp)
 379  0018 e601          	ld	a,(1,x)
 380  001a c7001a        	ld	__dwInfo+13,a
 381                     ; 160 			break;
 383                     ; 161 		case 0x87:	//	refire
 383                     ; 162 		case 0x2d:	//	shower
 383                     ; 163 		case 0x69:	//	fast heat_temp
 383                     ; 164 		case 0x3c:	//	heat_t
 383                     ; 165 		case 0x5a:	//	off-boiler
 383                     ; 166 			//_dwInfo.br_heat_t = buf[1];
 383                     ; 167 			break;		
 385  001d               L731:
 386                     ; 171 	if (_dwInfo.br_err/*state_error*/ != 0) 
 388  001d c6001a        	ld	a,__dwInfo+13
 389  0020 2712          	jreq	L141
 390                     ; 173 		if( dw_error_reset != 1 )
 392  0022 c60000        	ld	a,_dw_error_reset
 393  0025 4a            	dec	a
 394  0026 2715          	jreq	L541
 395                     ; 174 			func_cnt_error(ERROR_TYPE_BOILER, _dwInfo.br_err);
 397  0028 c6001a        	ld	a,__dwInfo+13
 398  002b 97            	ld	xl,a
 399  002c a601          	ld	a,#1
 400  002e 95            	ld	xh,a
 401  002f cd0000        	call	_func_cnt_error
 403  0032 2009          	jra	L541
 404  0034               L141:
 405                     ; 178 		if( funcInfo.error_type == ERROR_TYPE_BOILER )
 407  0034 c60009        	ld	a,_funcInfo+9
 408  0037 4a            	dec	a
 409  0038 2603          	jrne	L541
 410                     ; 179 			func_cnt_errorReset();
 412  003a cd0000        	call	_func_cnt_errorReset
 414  003d               L541:
 415                     ; 182 }
 418  003d 85            	popw	x
 419  003e 81            	ret	
 451                     ; 185 void br_dw_cntl(uint8_t cmd)
 451                     ; 186 {
 452                     .text:	section	.text,new
 453  0000               _br_dw_cntl:
 457                     ; 188 }
 460  0000 81            	ret	
 484                     ; 190 void br_dw_error_reset(void) {
 485                     .text:	section	.text,new
 486  0000               _br_dw_error_reset:
 490                     ; 191 	dw_error_reset = 1;
 492  0000 35010000      	mov	_dw_error_reset,#1
 493                     ; 192 }
 496  0004 81            	ret	
 661                     	xdef	_br_dw_cntl
 662                     	xdef	_br_dw_ptc_make
 663                     	xdef	_get_brDw
 664                     	switch	.bss
 665  0000               _brDw:
 666  0000 000000000000  	ds.b	13
 667                     	xdef	_brDw
 668                     	xref	_iouart9d_Pkt_Start
 669                     	xref	_iouart9d_Set_Packet
 670                     	xdef	_dw_error_reset_count
 671                     	xdef	_dw_error_reset
 672  000d               __dwInfo:
 673  000d 000000000000  	ds.b	15
 674                     	xdef	__dwInfo
 675                     	xdef	_br_dw_error_reset
 676                     	xdef	_br_dw_ptc_check
 677                     	xref	_br_type
 678                     	xref	_br_connect
 679                     	xref	_func_cnt_error
 680                     	xref	_func_cnt_errorReset
 681                     	xref	_funcInfo
 682                     	xref	_ext_br_error
 683                     	xref.b	c_x
 703                     	xref	c_smodx
 704                     	end
