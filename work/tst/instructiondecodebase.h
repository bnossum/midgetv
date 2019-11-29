/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * This file is used to disassemble instructions in simulators, and
 * give the RV32I encodings. X-macros are used extensively.
 *
 * Based on The RISC-V Instruction Set Manual
 * - Volume I: RISC-V User-Level ISA, Document Version 2.2, page 104. 
 * - Volumne II: Privileged Architecture, Privileged Architecture Version 1.10
 *   Document Version 1.10, page 68
 */


// 31 25         24 20 19 15 14 12  11 7        6 0
// funct7        rs2   rs1   funct3 rd          opcode   R-type
// imm[11:0]           rs1   funct3 rd          opcode   I-type
// imm[11:5]     rs2   rs1   funct3 imm[4:0]    opcode   S-type
// imm[12|10:5]  rs2   rs1   funct3 imm[4:1|11] opcode   B-type
// imm[31:12]                       rd          opcode   U-type
// imm[20|10:1|11|19:12]            rd          opcode   J-type
// 
// 
// RV32I Base Instruction Set
// 31 25          24 20  19 15 14 12   11 7         6 0
#ifndef E
#define E(ty,funct7,rs2,rs1,funct3,rd,opcode,txt) R(ty,funct7,rs2,rs1,funct3,rd,opcode,txt)
#endif
#ifndef C
#define C(ty,imm,rs1,funct3,rd,opcode,txt)        I(ty,imm,rs1,funct3,rd,opcode,txt)
#endif
//      3322222        22222  11111  111    11
//      1098765        43210  98765  432    10987        6543210
//                                   xxx                 xxx x
U( 'U', immL31_12J,                         rd,          0110111, lui     ) 
U( 'U', immL31_12J,                         rd,          0010111, auipc   ) 
J( 'J', immL20v10_1v11v19_12J,              rd,          1101111, jal     ) 
I( 'j', immL11_0J,            rs1,   000,   rd,          1100111, jalr    ) 
B( 'B', immL12v10_5J,  rs2,   rs1,   000,   immL4_1v11J, 1100011, beq     ) 
B( 'B', immL12v10_5J,  rs2,   rs1,   001,   immL4_1v11J, 1100011, bne     ) 
B( 'B', immL12v10_5J,  rs2,   rs1,   100,   immL4_1v11J, 1100011, blt     ) 
B( 'B', immL12v10_5J,  rs2,   rs1,   101,   immL4_1v11J, 1100011, bge     ) 
B( 'B', immL12v10_5J,  rs2,   rs1,   110,   immL4_1v11J, 1100011, bltu    ) 
B( 'B', immL12v10_5J,  rs2,   rs1,   111,   immL4_1v11J, 1100011, bgeu    ) 
I( 'I', immL11_0J,            rs1,   000,   rd,          0000011, lb      ) 
I( 'I', immL11_0J,            rs1,   001,   rd,          0000011, lh      ) 
I( 'a', immL11_0J,            rs1,   010,   rd,          0000011, lw      ) 
I( 'I', immL11_0J,            rs1,   100,   rd,          0000011, lbu     ) 
I( 'I', immL11_0J,            rs1,   101,   rd,          0000011, lhu     ) 
S( 'S', immL11_5J,     rs2,   rs1,   000,   immL4_0J,    0100011, sb      ) 
S( 'S', immL11_5J,     rs2,   rs1,   001,   immL4_0J,    0100011, sh      ) 
S( 'S', immL11_5J,     rs2,   rs1,   010,   immL4_0J,    0100011, sw      ) 
                                                                          
I( 'I', immL11_0J,            rs1,   000,   rd,          0010011, addi    ) 
R( 'h', 0000000,       shamt, rs1,   001,   rd,          0010011, slli    ) 
I( 'I', immL11_0J,            rs1,   010,   rd,          0010011, slti    ) 
I( 'I', immL11_0J,            rs1,   011,   rd,          0010011, sltiu   ) 
I( 'I', immL11_0J,            rs1,   100,   rd,          0010011, xori    ) 
R( 'h', 0000000,       shamt, rs1,   101,   rd,          0010011, srli    ) 
R( 'h', 0100000,       shamt, rs1,   101,   rd,          0010011, srai    ) 
I( 'I', immL11_0J,            rs1,   110,   rd,          0010011, ori     ) 
I( 'I', immL11_0J,            rs1,   111,   rd,          0010011, andi    ) 
                                                                          
R( 'R', 0000000,       rs2,   rs1,   000,   rd,          0110011, add     ) 
R( 'R', 0100000,       rs2,   rs1,   000,   rd,          0110011, sub     ) 
R( 'R', 0000000,       rs2,   rs1,   001,   rd,          0110011, sll     ) 
R( 'R', 0000000,       rs2,   rs1,   010,   rd,          0110011, slt     ) 
R( 'R', 0000000,       rs2,   rs1,   011,   rd,          0110011, sltu    ) 
R( 'R', 0000000,       rs2,   rs1,   100,   rd,          0110011, xor     ) 
R( 'R', 0000000,       rs2,   rs1,   101,   rd,          0110011, srl     ) 
R( 'R', 0100000,       rs2,   rs1,   101,   rd,          0110011, sra     ) 
R( 'R', 0000000,       rs2,   rs1,   110,   rd,          0110011, or      ) 
R( 'R', 0000000,       rs2,   rs1,   111,   rd,          0110011, and     ) 
r( 'Q', 0000, pred, succ,     00000, 000,   00000,       0001111, fence   ) 
r( 'Q', 0000, 0000, 0000,     00000, 001,   00000,       0001111, fence_i ) 
E( 'E', 0000000,       00000, 00000, 000,   00000,       1110011, ecall   ) 
E( 'E', 0000000,       00001, 00000, 000,   00000,       1110011, ebreak  ) 
E( 'E', 0000000,       00010, 00000, 000,   00000,       1110011, uret    ) 
E( 'E', 0001000,       00010, 00000, 000,   00000,       1110011, sret    ) 
E( 'E', 0011000,       00010, 00000, 000,   00000,       1110011, mret    ) 
E( 'E', 0001000,       00101, 00000, 000,   00000,       1110011, wfi     ) 
C( 'C', csr,                  rs1,   001,   rd,          1110011, csrrw   ) 
C( 'C', csr,                  rs1,   010,   rd,          1110011, csrrs   ) 
C( 'C', csr,                  rs1,   011,   rd,          1110011, csrrc   ) 
C( 'C', csr,                  zimm,  101,   rd,          1110011, csrrwi  ) 
C( 'C', csr,                  zimm,  110,   rd,          1110011, csrrsi  ) 
C( 'C', csr,                  zimm,  111,   rd,          1110011, csrrci  ) 

R( 'R', 0000001,       rs2,   rs1,   000,   rd,          0110011, mul     )
R( 'R', 0000001,       rs2,   rs1,   001,   rd,          0110011, mulh    )
R( 'R', 0000001,       rs2,   rs1,   010,   rd,          0110011, mulhsu  )
R( 'R', 0000001,       rs2,   rs1,   011,   rd,          0110011, mulhu   )
R( 'R', 0000001,       rs2,   rs1,   100,   rd,          0110011, div     )
R( 'R', 0000001,       rs2,   rs1,   101,   rd,          0110011, divu    )
R( 'R', 0000001,       rs2,   rs1,   110,   rd,          0110011, rem     )
R( 'R', 0000001,       rs2,   rs1,   111,   rd,          0110011, remu    )

#undef R                                                                  
#undef r                                                                  
#undef I                                                                  
#undef S
#undef B
#undef U
#undef J
#undef E
#undef C
