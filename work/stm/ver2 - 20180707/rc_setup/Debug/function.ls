   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
  67                     ; 4 void func_rc_command(uint8_t com1, uint8_t com2) {
  69                     .text:	section	.text,new
  70  0000               _func_rc_command:
  72  0000 89            	pushw	x
  73       00000000      OFST:	set	0
  76                     ; 5 	mode_mirror = 0;
  78  0001 725f0000      	clr	_mode_mirror
  79                     ; 6 	mode_factory = 0;
  81  0005 725f0000      	clr	_mode_factory
  82                     ; 7 	mode_hotwater = 0;
  84  0009 725f0000      	clr	_mode_hotwater
  85                     ; 8 	mode_reset = 0;
  87  000d 725f0000      	clr	_mode_reset
  88                     ; 10 	switch(com1) {
  90  0011 9e            	ld	a,xh
  92                     ; 22 			break;
  93  0012 4a            	dec	a
  94  0013 270d          	jreq	L3
  95  0015 4a            	dec	a
  96  0016 2711          	jreq	L5
  97  0018 a002          	sub	a,#2
  98  001a 2714          	jreq	L7
  99  001c a004          	sub	a,#4
 100  001e 2717          	jreq	L11
 101  0020 201a          	jra	L14
 102  0022               L3:
 103                     ; 11 		case COMMAND_MODE_MIRROR:
 103                     ; 12 			mode_mirror = com2;
 105  0022 7b02          	ld	a,(OFST+2,sp)
 106  0024 c70000        	ld	_mode_mirror,a
 107                     ; 13 			break;
 109  0027 2013          	jra	L14
 110  0029               L5:
 111                     ; 14 		case COMMAND_MODE_HOTWATER:
 111                     ; 15 			mode_hotwater = com2;
 113  0029 7b02          	ld	a,(OFST+2,sp)
 114  002b c70000        	ld	_mode_hotwater,a
 115                     ; 16 			break;
 117  002e 200c          	jra	L14
 118  0030               L7:
 119                     ; 17 		case COMMAND_MODE_RESET:
 119                     ; 18 			mode_reset = com2;
 121  0030 7b02          	ld	a,(OFST+2,sp)
 122  0032 c70000        	ld	_mode_reset,a
 123                     ; 19 			break;
 125  0035 2005          	jra	L14
 126  0037               L11:
 127                     ; 20 		case COMMAND_MODE_FACTORY:
 127                     ; 21 			mode_factory = com2;
 129  0037 7b02          	ld	a,(OFST+2,sp)
 130  0039 c70000        	ld	_mode_factory,a
 131                     ; 22 			break;
 133  003c               L14:
 134                     ; 24 }
 137  003c 85            	popw	x
 138  003d 81            	ret
 171                     ; 26 void func_rc_recover(uint8_t com) {
 172                     .text:	section	.text,new
 173  0000               _func_rc_recover:
 177                     ; 27 	mode_recover = com;
 179  0000 c70000        	ld	_mode_recover,a
 180                     ; 28 }
 183  0003 81            	ret
 207                     ; 30 void func_rc_setting(void) {
 208                     .text:	section	.text,new
 209  0000               _func_rc_setting:
 213                     ; 31 	setSettingChange(1);
 215  0000 a601          	ld	a,#1
 216  0002 cd0000        	call	_setSettingChange
 218                     ; 32 }
 221  0005 81            	ret
 224                     	switch	.data
 225  0000               ___func_rc_settingCb:
 226  0000 00            	dc.b	0
 257                     ; 36 void func_rc_settingCb(uint8_t ch) {
 258                     .text:	section	.text,new
 259  0000               _func_rc_settingCb:
 263                     ; 37 	__func_rc_settingCb = ch;
 265  0000 c70000        	ld	___func_rc_settingCb,a
 266                     ; 38 }
 269  0003 81            	ret
 292                     	xdef	___func_rc_settingCb
 293                     	xref	_setSettingChange
 294                     	xref	_mode_reset
 295                     	xref	_mode_hotwater
 296                     	xref	_mode_recover
 297                     	xref	_mode_factory
 298                     	xref	_mode_mirror
 299                     	xdef	_func_rc_settingCb
 300                     	xdef	_func_rc_setting
 301                     	xdef	_func_rc_recover
 302                     	xdef	_func_rc_command
 321                     	end
