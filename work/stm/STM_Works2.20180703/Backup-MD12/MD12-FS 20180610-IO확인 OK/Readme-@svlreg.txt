uint32_t problem with STVD + Cosmic FSE
Question asked by Radim Bajak on Aug 14, 2017
Latest reply on Sep 19, 2017 by Alexis Hernandez 
Like ? Show 1 Like1 Comment ? 5
Hello, I use STM8AF52xx, STVD and cosmic FSE, when I try to use  STM8S_StdPeriph_Lib and CAN example I encounter this error:

#error clnk Debug\stm8af52ax.lkf:1 @svlreg missing for function f_CAN_RX_IRQHandler

(I have deleted LCD and LED functions just to have pure CAN because there was similar error concerning LCD/LED).

 

This is part of code that is responsible for error:

it is can_recieve() routine

 

can problem

 

As it seems error is caused by uint32_t variables, more precisely with data manipulations.

I was able to assign pure numerical value, but combined statement (assign value from other variable and for example shifting left ) throws error.

I can compile stm8s_can.c without problem, but if try to I build whole project I got error as stated at beginning.

If I comment code with uint32_t variables project would build without errors.

Workspace is available in attachment. 

 

What is causing this error?

best regards,

Radim.

luca
luca
Aug 16, 2017 3:55 PM
Correct Answer
Hello,

 

as the linker says add @svlreg to your function declaration (both prototype and actual function) and the problem will go away.

 

The issue is that when using 32 bits variables in interrupt functions the compiler must save the internal variable c_lreg (used for this kind of calculations) on the stack under interrupt to avoid possible corruption; this is controlled by the @svlreg keyword.

 

Regards,

 

Luca

See the reply in context