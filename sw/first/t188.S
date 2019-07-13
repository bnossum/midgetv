        # Check illegal encoding in instructions
	#   funct7         rs2    rs1    funct3 rd           opcode   Instruction
	#   0000000,       shamt, rs1,   001,   rd,          0010011  slli     
	#   0000000,       shamt, rs1,   101,   rd,          0010011  srli
	#   0000000,       rs2,   rs1,   000,   rd,          0110011  add
	#   0000000,       rs2,   rs1,   001,   rd,          0110011  sll      
	#   0000000,       rs2,   rs1,   010,   rd,          0110011  slt      
	#   0000000,       rs2,   rs1,   011,   rd,          0110011  sltu     
	#   0000000,       rs2,   rs1,   100,   rd,          0110011  xor      
	#   0000000,       rs2,   rs1,   101,   rd,          0110011  srl
	#   0000000,       rs2,   rs1,   110,   rd,          0110011  or       
	#   0000000,       rs2,   rs1,   111,   rd,          0110011  and      
        #
	#   0100000,       shamt, rs1,   101,   rd,          0010011  srai 
	#   0100000,       rs2,   rs1,   000,   rd,          0110011  sub  
	#   0100000,       rs2,   rs1,   101,   rd,          0110011  sra  
        #
        # If midgetv is compiled with LAZY_DECODE == 0 we should have no illegal
        # instructions. If LAZY_DECODE == 1 we should have 13 illegal instructions.
        #
        # =============================================================================
#include "midgetv.inc"
        .globl _start
#ifndef onlyEBR
        .section .text
#endif
StartTrap:
        addi    x31,x31,1

        // Modify return address
        lw      x1,%lo(__mepc)(x0)
        addi    x1,x1,4
        sw      x1,%lo(__mepc)(x0)
        mret

        # =============================================================================
_start:
        la      x1,StartTrap
        sw      x1,%lo(__mtvec)(x0)

	.word 0x00311093 | 0x80000000 // slli   x1,x2,0x3
	.word 0x00315093 | 0x20000000 // srli   x1,x2,0x3
	.word 0x003100b3 | 0x10000000 // add	x1,x2,x3
	.word 0x003110b3 | 0x08000000 // sll	x1,x2,x3
	.word 0x003120b3 | 0x04000000 // slt	x1,x2,x3
	.word 0x003130b3 | 0x02000000 // sltu   x1,x2,x3
	.word 0x003140b3 | 0x80000000 // xor	x1,x2,x3
	.word 0x003150b3 | 0x20000000 // srl	x1,x2,x3
	.word 0x003160b3 | 0x10000000 // or	x1,x2,x3
	.word 0x003170b3 | 0x08000000 // and	x1,x2,x3
	.word 0x40315093 | 0x04000000 // srai   x1,x2,0x3
	.word 0x403100b3 | 0x02000000 // sub	x1,x2,x3
	.word 0x403150b3 | 0x80000000 // sra	x1,x2,x3

        beqz    x31,Good        // Presumably compiled with LAZY_DECODE == 1
        li      x1,13           
        bne     x1,x31,1f
Good:   
        simend
        
        # =============================================================================
1:      simerr  1
