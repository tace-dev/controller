   1                     ; C Compiler for STM8 (COSMIC Software)
   2                     ; Parser V4.10.21 - 04 Feb 2014
   3                     ; Generator (Limited) V4.3.12 - 11 Feb 2014
   4                     ; Optimizer V4.3.10 - 04 Sep 2013
  53                     ; 185 void	clockConfig(void)
  53                     ; 186 {
  55                     .text:	section	.text,new
  56  0000               _clockConfig:
  60                     ; 203 	CLK_SYSCLKConfig(CLK_PRESCALER_HSIDIV1);
  62  0000 4f            	clr	a
  63  0001 cd0000        	call	_CLK_SYSCLKConfig
  65                     ; 204 	CLK_HSICmd(ENABLE);
  67  0004 a601          	ld	a,#1
  69                     ; 206 }
  72  0006 cc0000        	jp	_CLK_HSICmd
  85                     	xdef	_clockConfig
  86                     	xref	_CLK_SYSCLKConfig
  87                     	xref	_CLK_HSICmd
 106                     	end
