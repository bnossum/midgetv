        # Check MULH
        # Here I shamelessly copy in cases from conformance suite

# RISC-V Compliance Test RV32IM-MUL-01
#
# Copyright (c) 2018, Imperas Software Ltd.
# All rights reserved.
#
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#      * Redistributions of source code must retain the above copyright
#        notice, this list of conditions and the following disclaimer.
#      * Redistributions in binary form must reproduce the above copyright
#        notice, this list of conditions and the following disclaimer in the
#        documentation and/or other materials provided with the distribution.
#      * Neither the name of the Imperas Software Ltd. nor the
#        names of its contributors may be used to endorse or promote products
#        derived from this software without specific prior written permission.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS
# IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL Imperas Software Ltd. BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
# (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
# LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
# ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
# THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
#
# Specification: RV32IM Base Integer Instruction Set, Version 2.0
# Description: Testing instruction MUL.

        #===========================================================
#include "midgetv.inc"
#include "fakecompliance.inc"        
        .globl _start

#ifndef onlyEBR
        .section .text
#endif

_trap_handler:
        simerr 42
        
_start:        
        // Set trap handler address
        la      x1,_trap_handler
        sw      x1,%lo(__mtvec)(x0)        

        // First test pos * pos
        li      x1,0
        li      x2,0
        mulh    x4,x1,x2
        bne     x4,x0,1f
        
        li      x1,0x40000000
        li      x2,0x20000000
        li      x3,0x08000000
        mulh    x4,x1,x2
        bne     x4,x3,2f        

        li      x1,0x20000000
        li      x2,0x40000000
        li      x3,0x08000000
        mulh    x4,x1,x2
        bne     x4,x3,3f        

        li      x1,0x40000000
        li      x2,0x40000000
        li      x3,0x10000000
        mulh    x4,x1,x2
        bne     x4,x3,4f        

        // pos * neg
        li      x1,0x40000000
        li      x2,0xC0000000
        li      x3,0xF0000000
        mulh    x4,x1,x2
        bne     x4,x3,5f        

        li      x1,0x00000001
        li      x2,0xffffffff
        li      x3,0xffffffff
        mulh    x4,x1,x2
        bne     x4,x3,6f


        li      x1,0x7fffffff
        li      x2,0xffffffff
        li      x3,0xffffffff
        mulh    x4,x1,x2
        bne     x4,x3,7f

        // I had some luck with neg * pos

        // neg * neg
        li      x1,0xffffffff
        li      x2,0xffffffff
        li      x3,0
        mulh    x4,x1,x2
        bne     x4,x3,8f
        

        simend  


1:      simerr 1
2:      simerr 2
3:      simerr 3
4:      simerr 4
5:      simerr 5
6:      simerr 6
7:      simerr 7
8:      simerr 8
