   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.11.10 - 06 Jul 2017
   3                     ; Generator (Limited) V4.4.7 - 05 Oct 2017
   4                     ; Optimizer V4.4.7 - 05 Oct 2017
  59                     ; 159 void	disp_char(uint8_t ch)
  59                     ; 160 {
  61                     .text:	section	.text,new
  62  0000               _disp_char:
  66                     ; 161 }
  69  0000 81            	ret	
  95                     ; 187 void	clockConfig(void)
  95                     ; 188 {
  96                     .text:	section	.text,new
  97  0000               _clockConfig:
 101                     ; 192 	CLK_SYSCLKDivConfig(CLK_SYSCLKDiv_1); // CLK_PRESCALER_HSIDIV1
 103  0000 4f            	clr	a
 104  0001 cd0000        	call	_CLK_SYSCLKDivConfig
 106                     ; 193 	CLK_SYSCLKSourceConfig(CLK_SYSCLKSource_HSI);
 108  0004 a601          	ld	a,#1
 109  0006 cd0000        	call	_CLK_SYSCLKSourceConfig
 112  0009               L73:
 113                     ; 195 	while(CLK_GetSYSCLKSource() != CLK_SYSCLKSource_HSI)
 115  0009 cd0000        	call	_CLK_GetSYSCLKSource
 117  000c 4a            	dec	a
 118  000d 26fa          	jrne	L73
 119                     ; 218 }
 122  000f 81            	ret	
 135                     	xdef	_disp_char
 136                     	xdef	_clockConfig
 137                     	xref	_CLK_SYSCLKDivConfig
 138                     	xref	_CLK_GetSYSCLKSource
 139                     	xref	_CLK_SYSCLKSourceConfig
 158                     	end
