   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  69                     ; 4 void func_rc_command(uint8_t com1, uint8_t com2) {
  71                     	switch	.text
  72  0000               _func_rc_command:
  74  0000 89            	pushw	x
  75       00000000      OFST:	set	0
  78                     ; 5 	mode_mirror = 0;
  80  0001 725f0000      	clr	_mode_mirror
  81                     ; 6 	mode_factory = 0;
  83  0005 725f0000      	clr	_mode_factory
  84                     ; 7 	mode_hotwater = 0;
  86  0009 725f0000      	clr	_mode_hotwater
  87                     ; 8 	mode_reset = 0;
  89  000d 725f0000      	clr	_mode_reset
  90                     ; 10 	switch(com1) {
  92  0011 9e            	ld	a,xh
  94                     ; 22 			break;
  95  0012 4a            	dec	a
  96  0013 270d          	jreq	L3
  97  0015 4a            	dec	a
  98  0016 2711          	jreq	L5
  99  0018 a002          	sub	a,#2
 100  001a 2714          	jreq	L7
 101  001c a004          	sub	a,#4
 102  001e 2717          	jreq	L11
 103  0020 201a          	jra	L14
 104  0022               L3:
 105                     ; 11 		case COMMAND_MODE_MIRROR:
 105                     ; 12 			mode_mirror = com2;
 107  0022 7b02          	ld	a,(OFST+2,sp)
 108  0024 c70000        	ld	_mode_mirror,a
 109                     ; 13 			break;
 111  0027 2013          	jra	L14
 112  0029               L5:
 113                     ; 14 		case COMMAND_MODE_HOTWATER:
 113                     ; 15 			mode_hotwater = com2;
 115  0029 7b02          	ld	a,(OFST+2,sp)
 116  002b c70000        	ld	_mode_hotwater,a
 117                     ; 16 			break;
 119  002e 200c          	jra	L14
 120  0030               L7:
 121                     ; 17 		case COMMAND_MODE_RESET:
 121                     ; 18 			mode_reset = com2;
 123  0030 7b02          	ld	a,(OFST+2,sp)
 124  0032 c70000        	ld	_mode_reset,a
 125                     ; 19 			break;
 127  0035 2005          	jra	L14
 128  0037               L11:
 129                     ; 20 		case COMMAND_MODE_FACTORY:
 129                     ; 21 			mode_factory = com2;
 131  0037 7b02          	ld	a,(OFST+2,sp)
 132  0039 c70000        	ld	_mode_factory,a
 133                     ; 22 			break;
 135  003c               L14:
 136                     ; 24 }
 139  003c 85            	popw	x
 140  003d 81            	ret	
 173                     ; 26 void func_rc_recover(uint8_t com) {
 174                     	switch	.text
 175  003e               _func_rc_recover:
 179                     ; 27 	mode_recover = com;
 181  003e c70000        	ld	_mode_recover,a
 182                     ; 28 }
 185  0041 81            	ret	
 209                     ; 30 void func_rc_setting(void) {
 210                     	switch	.text
 211  0042               _func_rc_setting:
 215                     ; 31 	setSettingChange(1);
 217  0042 a601          	ld	a,#1
 219                     ; 32 }
 222  0044 cc0000        	jp	_setSettingChange
 225                     	switch	.data
 226  0000               ___func_rc_settingCb:
 227  0000 00            	dc.b	0
 258                     ; 36 void func_rc_settingCb(uint8_t ch) {
 259                     	switch	.text
 260  0047               _func_rc_settingCb:
 264                     ; 37 	__func_rc_settingCb = ch;
 266  0047 c70000        	ld	___func_rc_settingCb,a
 267                     ; 38 }
 270  004a 81            	ret	
 293                     	xdef	___func_rc_settingCb
 294                     	xref	_setSettingChange
 295                     	xref	_mode_reset
 296                     	xref	_mode_hotwater
 297                     	xref	_mode_recover
 298                     	xref	_mode_factory
 299                     	xref	_mode_mirror
 300                     	xdef	_func_rc_settingCb
 301                     	xdef	_func_rc_setting
 302                     	xdef	_func_rc_recover
 303                     	xdef	_func_rc_command
 322                     	end
