#include "midgetv.inc"
Trap:
        simerr 5
        
        .globl _start
        .section .text
#include "midgetv_dump_compliance.S"
        .align 4          
_start:
        la      x1,Trap
        sw      x1,%lo(__mtvec)(x0)
        li       x2,0x800            
#include "dupC-ADDI.S"

         
     
