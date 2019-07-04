// Encodings

// 104 Volume I: RISC-V User-Level ISA V2.2
// 
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
U( 'U', immL31_12J,                         rd,          0110111, lui     ) /*  0 */
U( 'U', immL31_12J,                         rd,          0010111, auipc   ) /*  1 */
J( 'J', immL20v10_1v11v19_12J,              rd,          1101111, jal     ) /*  2 */
I( 'j', immL11_0J,            rs1,   000,   rd,          1100111, jalr    ) /*  3 */
B( 'B', immL12v10_5J,  rs2,   rs1,   000,   immL4_1v11J, 1100011, beq     ) /*  4 */
B( 'B', immL12v10_5J,  rs2,   rs1,   001,   immL4_1v11J, 1100011, bne     ) /*  5 */
B( 'B', immL12v10_5J,  rs2,   rs1,   100,   immL4_1v11J, 1100011, blt     ) /*  6 */
B( 'B', immL12v10_5J,  rs2,   rs1,   101,   immL4_1v11J, 1100011, bge     ) /*  7 */
B( 'B', immL12v10_5J,  rs2,   rs1,   110,   immL4_1v11J, 1100011, bltu    ) /*  8 */
B( 'B', immL12v10_5J,  rs2,   rs1,   111,   immL4_1v11J, 1100011, bgeu    ) /*  9 */
I( 'I', immL11_0J,            rs1,   000,   rd,          0000011, lb      ) /* 10 */
I( 'I', immL11_0J,            rs1,   001,   rd,          0000011, lh      ) /* 11 */
I( 'a', immL11_0J,            rs1,   010,   rd,          0000011, lw      ) /* 12 */
I( 'I', immL11_0J,            rs1,   100,   rd,          0000011, lbu     ) /* 13 */
I( 'I', immL11_0J,            rs1,   101,   rd,          0000011, lhu     ) /* 14 */
S( 'S', immL11_5J,     rs2,   rs1,   000,   immL4_0J,    0100011, sb      ) /* 15 */
S( 'S', immL11_5J,     rs2,   rs1,   001,   immL4_0J,    0100011, sh      ) /* 16 */
S( 'S', immL11_5J,     rs2,   rs1,   010,   immL4_0J,    0100011, sw      ) /* 17 */
                                                                          
I( 'I', immL11_0J,            rs1,   000,   rd,          0010011, addi    ) /* 18 */
R( 'h', 0000000,       shamt, rs1,   001,   rd,          0010011, slli    ) /* 19 */
I( 'I', immL11_0J,            rs1,   010,   rd,          0010011, slti    ) /* 20 */
I( 'I', immL11_0J,            rs1,   011,   rd,          0010011, sltiu   ) /* 21 */
I( 'I', immL11_0J,            rs1,   100,   rd,          0010011, xori    ) /* 22 */
R( 'h', 0000000,       shamt, rs1,   101,   rd,          0010011, srli    ) /* 23 */
R( 'h', 0100000,       shamt, rs1,   101,   rd,          0010011, srai    ) /* 24 */
I( 'I', immL11_0J,            rs1,   110,   rd,          0010011, ori     ) /* 25 */
I( 'I', immL11_0J,            rs1,   111,   rd,          0010011, andi    ) /* 26 */
                                                                          
R( 'R', 0000000,       rs2,   rs1,   000,   rd,          0110011, add     ) /* 27 */
R( 'R', 0100000,       rs2,   rs1,   000,   rd,          0110011, sub     ) /* 28 */
R( 'R', 0000000,       rs2,   rs1,   001,   rd,          0110011, sll     ) /* 29 */
R( 'R', 0000000,       rs2,   rs1,   010,   rd,          0110011, slt     ) /* 30 */
R( 'R', 0000000,       rs2,   rs1,   011,   rd,          0110011, sltu    ) /* 31 */
R( 'R', 0000000,       rs2,   rs1,   100,   rd,          0110011, xor     ) /* 32 */
R( 'R', 0000000,       rs2,   rs1,   101,   rd,          0110011, srl     ) /* 33 */
R( 'R', 0100000,       rs2,   rs1,   101,   rd,          0110011, sra     ) /* 34 */
R( 'R', 0000000,       rs2,   rs1,   110,   rd,          0110011, or      ) /* 35 */
R( 'R', 0000000,       rs2,   rs1,   111,   rd,          0110011, and     ) /* 36 */
r( 'Q', 0000, pred, succ,     00000, 000,   00000,       0001111, fence   ) /* 37 */
r( 'Q', 0000, 0000, 0000,     00000, 001,   00000,       0001111, fence.i ) /* 38 */
E( 'E', 0000000,       00000, 00000, 000,   00000,       1110011, ecall   ) /* 39 */
E( 'E', 0000000,       00001, 00000, 000,   00000,       1110011, ebreak  ) /* 40 */
E( 'E', 0000000,       00010, 00000, 000,   00000,       1110011, uret    ) /* 41 */
E( 'E', 0001000,       00010, 00000, 000,   00000,       1110011, sret    ) /* 42 */
E( 'E', 0011000,       00010, 00000, 000,   00000,       1110011, mret    ) /* 43 */
C( 'C', csr,                  rs1,   001,   rd,          1110011, csrrw   ) /* 44 */
C( 'C', csr,                  rs1,   010,   rd,          1110011, csrrs   ) /* 45 */
C( 'C', csr,                  rs1,   011,   rd,          1110011, csrrc   ) /* 46 */
C( 'C', csr,                  zimm,  101,   rd,          1110011, csrrwi  ) /* 47 */
C( 'C', csr,                  zimm,  110,   rd,          1110011, csrrsi  ) /* 48 */
C( 'C', csr,                  zimm,  111,   rd,          1110011, csrrci  ) /* 49 */
#undef R                                                                  
#undef r                                                                  
#undef I                                                                  
#undef S
#undef B
#undef U
#undef J
#undef E
#undef C
