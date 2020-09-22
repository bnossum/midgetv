
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2020-2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * ----------------------------------------------------------------------------

Midgetv ignores all hints, and reserved instructions execute something. All instructions for
floating point variables are illegal.

Translation from rv32c instruction to rv32i instruction
 I name rd and rs1/rd as D4 D3 D2 D1 D0
 I name rs1 as S4 S3 S2 S1 S0
 I name rs2 as T4 T3 T2 T1 T0
 I name rd' and rs1'/rd' as d2 d1 d0
 I name rs1' as s2 s1 s0
 I name rs2' as t2 t1 t0
 Sign-extended immediates are named as i<x>, with <x> the bit number
 Zero-extended immediates are named as z<x>
 Fixed bits is represented as 0 and 1

               c[11:7]==5'h2  (this is rs1eq2)
               |c[11:7]==5'h2  (this is rs1eq2)
               ||c[11:7]==5'h0 (this is rs1eq0)    
      111111   |||
    1054321065 |||               12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7 6543210      
    -----x---- |||               --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -------
    00000xxxxx xxx  C.ADDI4SPN   z5  z4 z9 z8 z7 z6 z2 z3 d2 d1 d0 |  0  0 10  9  8  7 12 11  5  6  0  0  0  0  0  1  0  0  0  0  0  1  4  3  2 0010011  addi rd',x2,mzuimm[9:2]   
    00001xxxxx xxx  C.FLD         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    00010xxxxx xxx  C.LW         z5  z4 z3 s2 s1 s0 z2 z6 d2 d1 d0 |  0  0  0  0  0  5 12 11 10  6  0  0  0  1  9  8  7  0  1  0  0  1  4  3  2 0000011  lw rd',offset[6:2](rs1')
    00011xxxxx xxx  C.FLW         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    00100xxxxx xxx  reserved      x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxxx  don't care in midgetv
    00101xxxxx xxx  C.FSD         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    00110xxxxx xxx  C.SW         z5  z4 z3 s2 s1 s0 z2 z6 t2 t1 t0 |  0  0  0  0  0  5 12  0  1  4  3  2  0  1  9  8  7  0  1  0 11 10  6  0  0 0100011  sw rs2',offset[6:2](rs1') 
    00111xxxxx xxx  C.FSW         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    01000xxxxx xxx  C.ADDI/C.NOP i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7 0010011  addi rd,rd,nzimm[5:0] 
    01001xxxxx xxx  C.JAL        ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | 12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  1 1101111  jal x1, offset[11:1]       
    01010xxxxx xxx  C.LI         i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7 0010011  addi rd,x0,imm[5:0] 
    01011xxxxx 0xx  C.LUI        ih  D4 D3 D2 D1 D0 ig if ie id ic | 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7 0110111  lui rd,nzimm[17:12].  
    01011xxxxx 10x  C.ADDI16SP   i9   0  0  0  1  0 i4 i6 i8 i7 i5 | 12 12 12  4  3  5  2  6  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  1  0 0010011  addi x2,x2,nzimm[9:4] 
    01100x00xx xxx  C.SRLI        x   0  0 d2 d1 d0 z4 z3 z2 z1 z0 |  0  0  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7 0010011  srli rd',rd',shamt[5:0]                               
    01100x01xx 0xx  C.SRAI        x   0  1 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7 0010011  srai rd',rd',shamt[5:0]
    01100x10xx 0xx  C.ANDI       i5   1  0 d2 d1 d0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7 0010011  andi rd',rd',imm[5:0]
    0110001100 0xx  C.SUB         0   1  1 d2 d1 d0  0  0 t2 t1 t0 |  0  1  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  0  0  0  0  1  9  8  7 0110011  sub rd',rd',rs2'
    0110001101 0xx  C.XOR         0   1  1 d2 d1 d0  0  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  0  0  0  1  9  8  7 0110011  xor rd',rd',rs2'
    0110001110 0xx  C.OR          0   1  1 d2 d1 d0  1  0 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  0  0  1  9  8  7 0110011  or rd',rd'rs2'
    0110001111 0xx  C.AND         0   1  1 d2 d1 d0  1  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7 0110011  and rd',rd',rs2'
    011001xxxx xxx  reserved      x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    01101xxxxx xxx  C.J          ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | 12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  0 1101111  jal x0, offset[11:1]
    01110xxxxx xxx  C.BEQZ       i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | 12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  0 11 10  4  3 12 1100011  beq rs1',x0,offset[8:1]                  
    01111xxxxx xxx  C.BNEZ       i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | 12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  1 11 10  4  3 12 1100011  bne rs1',x0,offset[8:1]                  
    10000xxxxx xxx  C.SLLI        x  D4 D3 D2 D1 D0 z4 z3 z2 z1 z0 |  0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  1 11 10  9  8  7 0010011  slli rd,rd,shamt[5:0] 
    10001xxxxx xxx  C.FLDSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    10010xxxxx xxx  C.LWSP       z5  D4 D3 D2 D1 D0 z4 z3 z2 z7 z6 |  0  0  0  0  3  2 12  6  5  4  0  0  0  0  0  1  0  0  1  0 11 10  9  8  7 0000011  lw rd,offset[7:2](x2) 
    10011xxxxx xxx  C.FLWSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    101000xxxx xx0  C.MV          0  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7 0110011  add rd,rd,rs2          
    101000xxxx xx1  C.JR          0  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  0 1100111  jalr x0,0(rs1)                  
    101001xxxx x01  C.JALR        l  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  1 1100111  jalr x1,0(rs1)                  
    101001xxxx 011  C.EBREAK      l   0  0  0  0  0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0 1110011  ebreak
    101001xxxx xx0  C.ADD         l  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7 0110011  add rd,rd,rs2                   
    10101xxxxx xxx  C.FSDSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
    10110xxxxx xxx  C.SWSP       z5  z4 z3 z2 z7 z6 T4 T3 T2 T1 T0 |  0  0  0  0  8  7 12  6  5  4  3  2  0  0  0  1  0  0  1  0 11 10  9  0  0 0100011  sw rs2,offset[7:2](x2)
    10111xxxxx xxx  C.FSWSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal    

    For {c[1:0]},c[15:13]} == 5'b10100 and rs1eq0==1, m[4:0] is remapped.                 m[4] = c[1], m[3] = 1'b1, m[2] = c[12]
    For {c[1:0]},c[15:13]} == 5'b01100 
addi16sp/lui  mv/add
               
               c[6:2]==5'h0  (this is rs2eq0)
               |c[11:7]==5'h0 (this is rs1eq0)  
               ||c[11:7]==5'h2  (this is rs1eq2)
      111111   |||  mmmmm
    1054321065 |||  43210                      12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7 6543210      
    ---------- |||  -----                      --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -------
    00000xxxxx xxx  00000     C.ADDI4SPN       z5  z4 z9 z8 z7 z6 z2 z3 d2 d1 d0 |  0  0 10  9  8  7 12 11  5  6  0  0  0  0  0  1  0  0  0  0  0  1  4  3  2 0010011  addi rd',x2,mzuimm[9:2]   
    00001xxxxx xxx  00001     C.FLD             x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    00010xxxxx xxx  00010     C.LW             z5  z4 z3 s2 s1 s0 z2 z6 d2 d1 d0 |  0  0  0  0  0  5 12 11 10  6  0  0  0  1  9  8  7  0  1  0  0  1  4  3  2 0000011  lw rd',offset[6:2](rs1')
    00011xxxxx xxx  00001 m   C.FLW             x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    00100xxxxx xxx  00100     reserved          x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxxx  (maps to mC.JR)
    00101xxxxx xxx  00101     C.FSD             x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    00110xxxxx xxx  00110     C.SW             z5  z4 z3 s2 s1 s0 z2 z6 t2 t1 t0 |  0  0  0  0  0  5 12  0  1  4  3  2  0  1  9  8  7  0  1  0 11 10  6  0  0 0100011  sw rs2',offset[6:2](rs1') 
    00111xxxxx xxx  00111     C.FSW             x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    01000xxxxx xxx  01000     C.ADDI/C.NOP     i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7 0010011  addi rd,rd,nzimm[5:0] 
    01001xxxxx xxx  01001     C.JAL            ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | 12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  1 1101111  jal x1, offset[11:1]       
    01010xxxxx xxx  01010     C.LI             i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7 0010011  addi rd,x0,imm[5:0] 
    01011xxxxx xx0  01011     C.LUI            ih  D4 D3 D2 D1 D0 ig if ie id ic | 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7 0110111  lui rd,nzimm[17:12].  
    01011xxxxx x01  00011 m   C.ADDI16SP       i9   0  0  0  1  0 i4 i6 i8 i7 i5 | 12 12 12  4  3  5  2  6  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  1  0 0010011  addi x2,x2,nzimm[9:4] 
    01100x00xx xxx  11000 m   C.SRLI            x   0  0 d2 d1 d0 z4 z3 z2 z1 z0 |  0  0  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7 0010011  srli rd',rd',shamt[5:0]                               
    01100x01xx xx0  11001 m   C.SRAI            x   0  1 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7 0010011  srai rd',rd',shamt[5:0]
    01100x10xx xx0  11010 m   C.ANDI           i5   1  0 d2 d1 d0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7 0010011  andi rd',rd',imm[5:0]
    0110001100 xx0  11100 m   C.SUB             0   1  1 d2 d1 d0  0  0 t2 t1 t0 |  0  1  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  0  0  0  0  1  9  8  7 0110011  sub rd',rd',rs2'
    0110001101 xx0  11101 m   C.XOR             0   1  1 d2 d1 d0  0  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  0  0  0  1  9  8  7 0110011  xor rd',rd',rs2'
    0110001110 xx0  11110 m   C.OR              0   1  1 d2 d1 d0  1  0 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  0  0  1  9  8  7 0110011  or rd',rd'rs2'
    0110001111 xx0  11111 m   C.AND             0   1  1 d2 d1 d0  1  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7 0110011  and rd',rd',rs2'
    011001xxxx xxx  11xxx     reserved          x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxxx  (maps to srlimsrai,andi,sub,xor,or,and)
    01101xxxxx xxx  01101     C.J              ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | 12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  0 1101111  jal x0, offset[11:1]
    01110xxxxx xxx  01110     C.BEQZ           i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | 12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  0 11 10  4  3 12 1100011  beq rs1',x0,offset[8:1]                  
    01111xxxxx xxx  01111     C.BNEZ           i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | 12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  1 11 10  4  3 12 1100011  bne rs1',x0,offset[8:1]                  
    10000xxxxx xxx  10000     C.SLLI            x  D4 D3 D2 D1 D0 z4 z3 z2 z1 z0 |  0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  1 11 10  9  8  7 0010011  slli rd,rd,shamt[5:0] 
    10001xxxxx xxx  10001     C.FLDSP           x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    10010xxxxx xxx  10010     C.LWSP           z5  D4 D3 D2 D1 D0 z4 z3 z2 z7 z6 |  0  0  0  0  3  2 12  6  5  4  0  0  0  0  0  1  0  0  1  0 11 10  9  8  7 0000011  lw rd,offset[7:2](x2) 
    10011xxxxx xxx  10011     C.FLWSP           x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    101000xxxx 0xx  10100     C.MV              0  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7 0110011  add rd,rd,rs2          
    101000xxxx 1xx  00100 m   C.JR              0  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  0 1100111  jalr x0,0(rs1)                  
    101001xxxx 10x  01100 m   C.JALR            l  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  1 1100111  jalr x1,0(rs1)                  
    101001xxxx 110  11011 m   C.EBREAK          l   0  0  0  0  0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0 1110011  ebreak
    101001xxxx 0xx  10101 m   C.ADD             l  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7 0110011  add rd,rd,rs2                   
    10101xxxxx xxx  10111 m   C.FSDSP           x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
    10110xxxxx xxx  10110     C.SWSP           z5  z4 z3 z2 z7 z6 T4 T3 T2 T1 T0 |  0  0  0  0  8  7 12  6  5  4  3  2  0  0  0  1  0  0  1  0 11 10  9  0  0 0100011  sw rs2,offset[7:2](x2)
    10111xxxxx xxx  10111     C.FSWSP           x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal 

  
 When {c[1:0],c[15:13}} = 5'b01100, m[4:0] is the result of a remapping.  m4 = c[0], m3 = 1, m2 = c[11:10] == 2'b11, if c[11:10] != 2'b11, m[1:0] = c[11:10], else m[1:0] = c[6:5]
 When {c[1:0],c[15:13}} = 5'b10100 and rs1eq0==1, m[4:0] is the result of a remapping. m[4] = ~c[12]....
 
 11000 mC.SRLI   
 11001 mC.SRAI
 11010 mC.ANDI
 11100 mC.SUB 
 11101 mC.XOR 
 11110 mC.OR  
 11111 mC.AND 

 00011  mC.ADDI16SP
 00100  mC.JR
 01100  mC.JALR
 10101  mC.ADD
 11011  mC.EBREAK

Don't cares generally at 1,5,7,17,19,23
mmmmm
43210                      12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7 6543210      
-----                      --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -------
00000     C.ADDI4SPN       z5  z4 z9 z8 z7 z6 z2 z3 d2 d1 d0 |  0  0 10  9  8  7 12 11  5  6  0  0  0  0  0  1  0  0  0  0  0  1  4  3  2 0010011  addi rd',x2,mzuimm[9:2]   
00001     C.FLD/C.FLW(m)    x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
00010     C.LW             z5  z4 z3 s2 s1 s0 z2 z6 d2 d1 d0 |  0  0  0  0  0  5 12 11 10  6  0  0  0  1  9  8  7  0  1  0  0  1  4  3  2 0000011  lw rd',offset[6:2](rs1')
00011 m   C.ADDI16SP       i9   0  0  0  1  0 i4 i6 i8 i7 i5 | 12 12 12  4  3  5  2  6  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  1  0 0010011  addi x2,x2,nzimm[9:4] 
00100 m   C.JR              0  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  0 1100111  jalr x0,0(rs1)                  
00101     C.FSD             x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
00110     C.SW             z5  z4 z3 s2 s1 s0 z2 z6 t2 t1 t0 |  0  0  0  0  0  5 12  0  1  4  3  2  0  1  9  8  7  0  1  0 11 10  6  0  0 0100011  sw rs2',offset[6:2](rs1') 
00111     C.FSW             x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
01000     C.ADDI/C.NOP     i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7 0010011  addi rd,rd,nzimm[5:0] 
01001     C.JAL            ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | 12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  1 1101111  jal x1, offset[11:1]       
01010     C.LI             i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7 0010011  addi rd,x0,imm[5:0] 
01011     C.LUI            ih  D4 D3 D2 D1 D0 ig if ie id ic | 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7 0110111  lui rd,nzimm[17:12].  
01100 m   C.JALR            l  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  1 1100111  jalr x1,0(rs1)                  
01101     C.J              ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | 12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  0 1101111  jal x0, offset[11:1]
01110     C.BEQZ           i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | 12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  0 11 10  4  3 12 1100011  beq rs1',x0,offset[8:1]                  
01111     C.BNEZ           i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | 12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  1 11 10  4  3 12 1100011  bne rs1',x0,offset[8:1]                  
10000     C.SLLI            x  D4 D3 D2 D1 D0 z4 z3 z2 z1 z0 |  0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  1 11 10  9  8  7 0010011  slli rd,rd,shamt[5:0] 
10001     C.FLDSP           x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
10010     C.LWSP           z5  D4 D3 D2 D1 D0 z4 z3 z2 z7 z6 |  0  0  0  0  3  2 12  6  5  4  0  0  0  0  0  1  0  0  1  0 11 10  9  8  7 0000011  lw rd,offset[7:2](x2) 
10011     C.FLWSP           x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
10100     C.MV              0  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7 0110011  add rd,rd,rs2          
10101 m   C.ADD             l  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7 0110011  add rd,rd,rs2                   
10110     C.SWSP           z5  z4 z3 z2 z7 z6 T4 T3 T2 T1 T0 |  0  0  0  0  8  7 12  6  5  4  3  2  0  0  0  1  0  0  1  0 11 10  9  0  0 0100011  sw rs2,offset[7:2](x2)
10111     C.FSWSP/C.FSDSP(m)x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal 
11000 m   C.SRLI            x   0  0 d2 d1 d0 z4 z3 z2 z1 z0 |  0  0  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7 0010011  srli rd',rd',shamt[5:0]                               
11001 m   C.SRAI            x   0  1 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7 0010011  srai rd',rd',shamt[5:0]
11010 m   C.ANDI           i5   1  0 d2 d1 d0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7 0010011  andi rd',rd',imm[5:0]
11011 m   C.EBREAK          l   0  0  0  0  0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0 1110011  ebreak
11100 m   C.SUB             0   1  1 d2 d1 d0  0  0 t2 t1 t0 |  0  1  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  0  0  0  0  1  9  8  7 0110011  sub rd',rd',rs2'
11101 m   C.XOR             0   1  1 d2 d1 d0  0  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  0  0  0  1  9  8  7 0110011  xor rd',rd',rs2'
11110 m   C.OR              0   1  1 d2 d1 d0  1  0 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  0  0  1  9  8  7 0110011  or rd',rd'rs2'
11111 m   C.AND             0   1  1 d2 d1 d0  1  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7 0110011  and rd',rd',rs2'


*/

module m_decompress
  (
   /* verilator lint_off UNUSED */
   input [15:0]     c, // Compressed instruction
   /* verilator lint_on UNUSED */
   output reg [4:0] m, // Remapping index
   output [31:0]    e //  Expanded result
   );
/* verilator lint_off UNUSED */
/* verilator lint_off IMPLICIT */
   
   localparam HIGHLEVEL = 0;

   generate
      if ( HIGHLEVEL ) begin
         wire rs1eq0 = c[11:7] == 5'b00000;
         wire rs1eq2 = c[11:7] == 5'b00010;
         wire rs2eq0 = c[6:2]  == 5'b00000;
         wire c15_23eq0 = c[15:12] == 4'b0000;
         wire [4:0] baseindex = {c[1:0],c[15:13]};
         
         always @(/*AS*/baseindex or c or rs1eq0 or rs1eq2 or rs2eq0) begin
            if ( baseindex == 5'b00011 ) begin
               m = 5'b00001; // Remap C.FLW 
            end else if ( baseindex == 5'b01011 && rs1eq2)  begin
               m = 5'b00011; // Remap ADDI16SP
            end else if ( baseindex == 5'b01100 ) begin
               // Remap SRLI,SRAI,ANDI,SUB,XOR,OR,AND
               m[4:3] = 2'b11;
               m[2] = &c[11:10];
               if ( &c[11:10] == 1'b0 ) begin
                  m[1:0] = c[11:10];
               end else begin
                  m[1:0] = c[6:5];
               end
            end else if ( baseindex == 5'b10100 ) begin
               if ( c[12] == 0 ) begin
                  if ( rs2eq0 == 0 ) begin
                     m = baseindex; // No mapping of MV
                  end else begin
                     m = 5'b00100; // Remap JR
                  end
               end else begin
                  if ( rs2eq0 == 0 ) begin
                     m = 5'b10101; // Remap ADD
                  end else begin
                     if ( rs1eq0 == 0 ) begin
                        m = 5'b01100; // Remap JALR
                     end else begin
                        m = 5'b11011; // Remap EBREAK
                     end
                  end
               end
            end else if ( baseindex == 5'b10101 ) begin
               m = 5'b10111; // Remap FSDSP
            end else if ( baseindex == 5'b0000 && rs1eq0 && rs2eq0 & c[12] == 0 ) begin
               m = 5'b00001; // Defined illegal instruction
            end else begin
               m = baseindex;
            end
         end
         
         //Contribution of c[12] in e31 : 3 ,8 ,9 ,10 ,11 ,13 ,14 ,15 ,26 
         wire e31_12 =  ~m[4]&~m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0];
         assign e[31] = e31_12&c[12];

         //Contribution of c[1] in e30 : 25 ,28 
         wire e30_1 =  m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0];
         //Contribution of c[8] in e30 : 9 ,13 
         wire e30_8 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         //Contribution of c[12] in e30 : 3 ,8 ,10 ,11 ,14 ,15 ,26 
         wire e30_12 =  ~m[4]&~m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0];
         assign e[30] = e30_1|e30_8&c[8]|e30_12&c[12];

         //Contribution of c[10] in e29 : 0 ,9 ,13 
         wire e29_10 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         //Contribution of c[12] in e29 : 3 ,8 ,10 ,11 ,14 ,15 ,26 
         wire e29_12 =  ~m[4]&~m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0];
         assign e[29] = e29_10&c[10]|e29_12&c[12];

         //Contribution of c[4] in e28 : 3 
         wire e28_4 =  ~m[4]&~m[3]&~m[2]&m[1]&m[0];
         //Contribution of c[9] in e28 : 0 ,9 ,13 
         wire e28_9 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         //Contribution of c[12] in e28 : 8 ,10 ,11 ,14 ,15 ,26 
         wire e28_12 =  ~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0];
         assign e[28] = e28_4&c[4]|e28_9&c[9]|e28_12&c[12];

         //Contribution of c[3] in e27 : 3 ,18 
         wire e27_3 =  ~m[4]&~m[3]&~m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0];
         //Contribution of c[6] in e27 : 9 ,13 ,14 ,15 
         wire e27_6 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[8] in e27 : 0 ,22 
         wire e27_8 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0];
         //Contribution of c[12] in e27 : 8 ,10 ,11 ,26 
         wire e27_12 =  ~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0];
         assign e[27] = e27_3&c[3]|e27_6&c[6]|e27_8&c[8]|e27_12&c[12];

         //Contribution of c[2] in e26 : 18 
         wire e26_2 =  m[4]&~m[3]&~m[2]&m[1]&~m[0];
         //Contribution of c[5] in e26 : 2 ,3 ,6 ,14 ,15 
         wire e26_5 =  ~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&m[0]|~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[7] in e26 : 0 ,9 ,13 ,22 
         wire e26_7 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0];
         //Contribution of c[12] in e26 : 8 ,10 ,11 ,26 
         wire e26_12 =  ~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0];
         assign e[26] = e26_2&c[2]|e26_5&c[5]|e26_7&c[7]|e26_12&c[12];


         //Contribution of c[2] in e25 : 3 ,9 ,13 ,14 ,15 
         wire e25_2 =  ~m[4]&~m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[12] in e25 : 0 ,2 ,6 ,8 ,10 ,11 ,18 ,22 ,26 
         wire e25_12 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0];
         assign e[25] = e25_2&c[2]|e25_12&c[12];

         //Contribution of c[6] in e24 : 3 ,8 ,10 ,16 ,18 ,20 ,21 ,22 ,24 ,25 ,26 
         wire e24_6 =  ~m[4]&~m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0];
         //Contribution of c[11] in e24 : 0 ,2 ,9 ,13 
         wire e24_11 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         //Contribution of c[12] in e24 : 11 
         wire e24_12 =  ~m[4]&m[3]&~m[2]&m[1]&m[0];
         assign e[24] = e24_6&c[6]|e24_11&c[11]|e24_12&c[12];

         //Contribution of c[1] in e23 : 6 ,28 ,29 ,30 ,31 
         wire e23_1 =  ~m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[5] in e23 : 0 ,8 ,9 ,10 ,13 ,16 ,18 ,20 ,21 ,22 ,24 ,25 ,26 
         wire e23_5 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0];
         //Contribution of c[10] in e23 : 2 
         wire e23_10 =  ~m[4]&~m[3]&~m[2]&m[1]&~m[0];
         //Contribution of c[12] in e23 : 11 
         wire e23_12 =  ~m[4]&m[3]&~m[2]&m[1]&m[0];
         assign e[23] = e23_1|e23_5&c[5]|e23_10&c[10]|e23_12&c[12];


         //Contribution of c[4] in e22 : 6 ,8 ,9 ,10 ,13 ,16 ,18 ,20 ,21 ,22 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e22_4 =  ~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[6] in e22 : 0 ,2 
         wire e22_6 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&~m[0];
         //Contribution of c[12] in e22 : 11 
         wire e22_12 =  ~m[4]&m[3]&~m[2]&m[1]&m[0];
         assign e[22] = e22_4&c[4]|e22_6&c[6]|e22_12&c[12];
         
         //Contribution of c[3] in e21 : 6 ,8 ,9 ,10 ,13 ,16 ,20 ,21 ,22 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e21_3 =  ~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[12] in e21 : 11 
         wire e21_12 =  ~m[4]&m[3]&~m[2]&m[1]&m[0];
         assign e[21] = e21_3&c[3]|e21_12&c[12];
         
         //Contribution of c[1] in e20 : 27 
         wire e20_1 =  m[4]&m[3]&~m[2]&m[1]&m[0];
         //Contribution of c[2] in e20 : 6 ,8 ,10 ,16 ,20 ,21 ,22 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e20_2 =  ~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[12] in e20 : 9 ,11 ,13 
         wire e20_12 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[20] = e20_1|e20_2&c[2]|e20_12&c[12];

         //Contribution of c[11] in e19 : 4 ,8 ,12 ,16 ,21 
         wire e19_11 =  ~m[4]&~m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0];
         //Contribution of c[12] in e19 : 9 ,11 ,13 
         wire e19_12 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[19] = e19_11&c[11]|e19_12&c[12];
         
         //Contribution of c[1] in e18 : 2 ,6 ,14 ,15 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e18_1 =  ~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[10] in e18 : 4 ,8 ,12 ,16 ,21 
         wire e18_10 =  ~m[4]&~m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0];
         //Contribution of c[12] in e18 : 9 ,11 ,13 
         wire e18_12 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[18] = e18_1|e18_10&c[10]|e18_12&c[12];
         
         //Contribution of c[9] in e17 : 2 ,4 ,6 ,8 ,12 ,14 ,15 ,16 ,21 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e17_9 =  ~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&~m[3]&m[2]&~m[1]&~m[0]|~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[12] in e17 : 9 ,11 ,13 
         wire e17_12 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[17] = e17_9&c[9]|e17_12&c[12];
         
         //Contribution of c[1] in e16 : 0 ,3 ,18 ,22 
         wire e16_1 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0];
         //Contribution of c[6] in e16 : 11 
         wire e16_6 =  ~m[4]&m[3]&~m[2]&m[1]&m[0];
         //Contribution of c[8] in e16 : 2 ,4 ,6 ,8 ,12 ,14 ,15 ,16 ,21 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e16_8 =  ~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&~m[3]&m[2]&~m[1]&~m[0]|~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[12] in e16 : 9 ,13 
         wire e16_12 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[16] = e16_1|e16_6&c[6]|e16_8&c[8]|e16_12&c[12];
         
         //Contribution of c[5] in e15 : 11 
         wire e15_5 =  ~m[4]&m[3]&~m[2]&m[1]&m[0];
         //Contribution of c[7] in e15 : 2 ,4 ,6 ,8 ,12 ,14 ,15 ,16 ,21 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e15_7 =  ~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&~m[3]&m[2]&~m[1]&~m[0]|~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[12] in e15 : 9 ,13 
         wire e15_12 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[15] = e15_5&c[5]|e15_7&c[7]|e15_12&c[12];

         //Contribution of c[1] in e14 : 24 ,25 ,26 ,29 ,30 ,31 
         wire e14_1 =  m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[4] in e14 : 11 
         wire e14_4 =  ~m[4]&m[3]&~m[2]&m[1]&m[0];
         //Contribution of c[12] in e14 : 9 ,13 
         wire e14_12 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[14] = e14_1|e14_4&c[4]|e14_12&c[12];
         
         //Contribution of c[1] in e13 : 2 ,6 ,18 ,22 ,26 ,30 ,31 
         wire e13_1 =  ~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[3] in e13 : 11 
         wire e13_3 =  ~m[4]&m[3]&~m[2]&m[1]&m[0];
         //Contribution of c[12] in e13 : 9 ,13 
         wire e13_12 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[13] = e13_1|e13_3&c[3]|e13_12&c[12];
         
         //Contribution of c[1] in e12 : 15 ,16 ,24 ,25 ,26 ,31 
         wire e12_1 =  ~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[2] in e12 : 11 
         wire e12_2 =  ~m[4]&m[3]&~m[2]&m[1]&m[0];
         //Contribution of c[12] in e12 : 9 ,13 
         wire e12_12 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[12] = e12_1|e12_2&c[2]|e12_12&c[12];
         
         //Contribution of c[11] in e11 : 6 ,8 ,10 ,11 ,14 ,15 ,16 ,18 ,20 ,21 ,22 
         wire e11_11 =  ~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0];
         assign e[11] = e11_11&c[11];

         //Contribution of c[1] in e10 : 0 ,2 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e10_1 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[10] in e10 : 6 ,8 ,10 ,11 ,14 ,15 ,16 ,18 ,20 ,21 ,22 
         wire e10_10 =  ~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0];
         assign e[10] = e10_1|e10_10&c[10];
         
         //Contribution of c[4] in e9 : 0 ,2 ,14 ,15 
         wire e9_4 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[6] in e9 : 6 
         wire e9_6 =  ~m[4]&~m[3]&m[2]&m[1]&~m[0];
         //Contribution of c[9] in e9 : 8 ,10 ,11 ,16 ,18 ,20 ,21 ,22 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e9_9 =  ~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         assign e[9] = e9_4&c[4]|e9_6&c[6]|e9_9&c[9];
         
         //Contribution of c[1] in e8 : 3 
         wire e8_1 =  ~m[4]&~m[3]&~m[2]&m[1]&m[0];
         //Contribution of c[3] in e8 : 0 ,2 ,14 ,15 
         wire e8_3 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[8] in e8 : 8 ,10 ,11 ,16 ,18 ,20 ,21 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e8_8 =  ~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         assign e[8] = e8_1|e8_3&c[3]|e8_8&c[8];
         
         //Contribution of c[1] in e7 : 9 ,12 
         wire e7_1 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0];
         //Contribution of c[2] in e7 : 0 ,2 
         wire e7_2 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&~m[0];
         //Contribution of c[7] in e7 : 8 ,10 ,11 ,16 ,18 ,20 ,21 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e7_7 =  ~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[12] in e7 : 14 ,15 
         wire e7_12 =  ~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0];
         assign e[7] = e7_1|e7_2&c[2]|e7_7&c[7]|e7_12&c[12];
         
         //Contribution of c[1] in e6 : 4 ,9 ,12 ,13 ,14 ,15 ,27 
         wire e6_1 =  ~m[4]&~m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&m[0];
         assign e[6] = e6_1;
         
         //Contribution of c[1] in e5 : 4 ,6 ,9 ,11 ,12 ,13 ,14 ,15 ,20 ,21 ,22 ,27 ,28 ,29 ,30 ,31 
         wire e5_1 =  ~m[4]&~m[3]&m[2]&~m[1]&~m[0]|~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         assign e[5] = e5_1;
         
         //Contribution of c[1] in e4 : 0 ,3 ,8 ,10 ,11 ,16 ,20 ,21 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 
         wire e4_1 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         assign e[4] = e4_1;
         
         //Contribution of c[1] in e3 : 9 ,13 
         wire e3_1 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[3] = e3_1;
         
         //Contribution of c[1] in e2 : 4 ,9 ,11 ,12 ,13 
         wire e2_1 =  ~m[4]&~m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[2] = e2_1;
         
         //Contribution of c[1] in e1 : 0 ,2 ,3 ,4 ,6 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,18 ,20 ,21 ,22 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 
         wire e1_1 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&m[0]|~m[4]&~m[3]&m[2]&~m[1]&~m[0]|~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         assign e[1] = e1_1;
         
         //Contribution of c[1] in e0 : 0 ,2 ,3 ,4 ,6 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,18 ,20 ,21 ,22 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 
         wire e0_1 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&m[0]|~m[4]&~m[3]&m[2]&~m[1]&~m[0]|~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         assign e[0] = e0_1;

      end else begin

         // ------------------------------------
         // Lowlevel
         // ------------------------------------
         
         wire rs1eq0 = c[11:7] == 5'b00000;
         wire rs1eq2 = c[11:7] == 5'b00010;
         wire rs2eq0 = c[6:2]  == 5'b00000;
         wire c15_23eq0 = c[15:12] == 4'b0000;
         wire [4:0] baseindex = {c[1:0],c[15:13]};
         
         always @(/*AS*/baseindex or c or rs1eq0 or rs1eq2 or rs2eq0) begin
            if ( baseindex == 5'b00011 ) begin
               m = 5'b00001; // Remap C.FLW 
            end else if ( baseindex == 5'b01011 && rs1eq2)  begin
               m = 5'b00011; // Remap ADDI16SP
            end else if ( baseindex == 5'b01100 ) begin
               // Remap SRLI,SRAI,ANDI,SUB,XOR,OR,AND
               m[4:3] = 2'b11;
               m[2] = &c[11:10];
               if ( &c[11:10] == 1'b0 ) begin
                  m[1:0] = c[11:10];
               end else begin
                  m[1:0] = c[6:5];
               end
            end else if ( baseindex == 5'b10100 ) begin
               if ( c[12] == 0 ) begin
                  if ( rs2eq0 == 0 ) begin
                     m = baseindex; // No mapping of MV
                  end else begin
                     m = 5'b00100; // Remap JR
                  end
               end else begin
                  if ( rs2eq0 == 0 ) begin
                     m = 5'b10101; // Remap ADD
                  end else begin
                     if ( rs1eq0 == 0 ) begin
                        m = 5'b01100; // Remap JALR
                     end else begin
                        m = 5'b11011; // Remap EBREAK
                     end
                  end
               end
            end else if ( baseindex == 5'b10101 ) begin
               m = 5'b10111; // Remap FSDSP
            end else if ( baseindex == 5'b0000 && rs1eq0 && rs2eq0 & c[12] == 0 ) begin
               m = 5'b00001; // Defined illegal instruction
            end else begin
               m = baseindex;
            end
         end
         
         //Contribution of c[12] in e31 : 3 ,8 ,9 ,10 ,11 ,13 ,14 ,15 ,26 
         //wire e31_12 =  ~m[4]&~m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0];
         //assign e[31] = e31_12&c[12];
         bn_l4v #(.I(16'b1110111100001000)) l_e31_12_h0( .o(e31_12_h0), .i(m[3:0]));
         // Must be      11101111x0xx10x0
         bn_l4v #(.I(16'b0000010000000000)) l_e31_12_h1( .o(e31_12_h1), .i(m[3:0]));
         //              xxxx01xxx00xx0xx
         //Why?                 1       1 Why can I set these bits?
         bn_l4v #(.I(16'hca00)) l_e31_12(.o(e[31]),.i({c[12],m[4],e31_12_h1,e31_12_h0}));
       
         
         //Contribution of c[1] in e30 : 25 ,28 
         //wire e30_1 =  m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0];
         bn_l4v #(.I(16'b0001001000000000)) l_e30_1_h0( .o(e30_1_h0), .i(m[3:0])); // In addition m[4] must be high
         //Contribution of c[8] in e30 : 9 ,13 
         //wire e30_8 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         bn_l4v #(.I(16'b0000000000100000)) l_e30_8( .o(e30_8), .i({m[4:3],m[1:0]}));
                    
         //Contribution of c[12] in e30 : 3 ,8 ,10 ,11 ,14 ,15 ,26 
         wire e30_12 =  ~m[4]&~m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0];
         assign e[30] = e30_1|e30_8&c[8]|e30_12&c[12];

         //Contribution of c[10] in e29 : 0 ,9 ,13 
         wire e29_10 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         //Contribution of c[12] in e29 : 3 ,8 ,10 ,11 ,14 ,15 ,26 
         wire e29_12 =  e30_12;
         assign e[29] = e29_10&c[10]|e29_12&c[12];

         //Contribution of c[4] in e28 : 3 
         wire e28_4 =  ~m[4]&~m[3]&~m[2]&m[1]&m[0];
         //Contribution of c[9] in e28 : 0 ,9 ,13 
         wire e28_9 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         //Contribution of c[12] in e28 : 8 ,10 ,11 ,14 ,15 ,26 
         wire e28_12 =  ~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0];
         assign e[28] = e28_4&c[4]|e28_9&c[9]|e28_12&c[12];

         //Contribution of c[3] in e27 : 3 ,18 
         wire e27_3 =  ~m[4]&~m[3]&~m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0];
         //Contribution of c[6] in e27 : 9 ,13 ,14 ,15 
         wire e27_6 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[8] in e27 : 0 ,22 
         wire e27_8 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0];
         //Contribution of c[12] in e27 : 8 ,10 ,11 ,26 
         wire e27_12 =  ~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0];
         assign e[27] = e27_3&c[3]|e27_6&c[6]|e27_8&c[8]|e27_12&c[12];

         //Contribution of c[2] in e26 : 18 
         wire e26_2 =  m[4]&~m[3]&~m[2]&m[1]&~m[0];
         //Contribution of c[5] in e26 : 2 ,3 ,6 ,14 ,15 
         wire e26_5 =  ~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&m[0]|~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[7] in e26 : 0 ,9 ,13 ,22 
         wire e26_7 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0];
         //Contribution of c[12] in e26 : 8 ,10 ,11 ,26 
         wire e26_12 =  ~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0];
         assign e[26] = e26_2&c[2]|e26_5&c[5]|e26_7&c[7]|e26_12&c[12];


         //Contribution of c[2] in e25 : 3 ,9 ,13 ,14 ,15 
         wire e25_2 =  ~m[4]&~m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[12] in e25 : 0 ,2 ,6 ,8 ,10 ,11 ,18 ,22 ,26 
         wire e25_12 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0];
         assign e[25] = e25_2&c[2]|e25_12&c[12];

         //Contribution of c[6] in e24 : 3 ,8 ,10 ,16 ,18 ,20 ,21 ,22 ,24 ,25 ,26 
         wire e24_6 =  ~m[4]&~m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0];
         //Contribution of c[11] in e24 : 0 ,2 ,9 ,13 
         wire e24_11 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         //Contribution of c[12] in e24 : 11 
         wire e24_12 =  ~m[4]&m[3]&~m[2]&m[1]&m[0];
         assign e[24] = e24_6&c[6]|e24_11&c[11]|e24_12&c[12];

         //Contribution of c[1] in e23 : 6 ,28 ,29 ,30 ,31 
         wire e23_1 =  ~m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[5] in e23 : 0 ,8 ,9 ,10 ,13 ,16 ,18 ,20 ,21 ,22 ,24 ,25 ,26 
         wire e23_5 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0];
         //Contribution of c[10] in e23 : 2 
         wire e23_10 =  ~m[4]&~m[3]&~m[2]&m[1]&~m[0];
         //Contribution of c[12] in e23 : 11 
         wire e23_12 =  ~m[4]&m[3]&~m[2]&m[1]&m[0];
         assign e[23] = e23_1|e23_5&c[5]|e23_10&c[10]|e23_12&c[12];


         //Contribution of c[4] in e22 : 6 ,8 ,9 ,10 ,13 ,16 ,18 ,20 ,21 ,22 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e22_4 =  ~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[6] in e22 : 0 ,2 
         wire e22_6 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&~m[0];
         //Contribution of c[12] in e22 : 11 
         wire e22_12 =  ~m[4]&m[3]&~m[2]&m[1]&m[0];
         assign e[22] = e22_4&c[4]|e22_6&c[6]|e22_12&c[12];
         
         //Contribution of c[3] in e21 : 6 ,8 ,9 ,10 ,13 ,16 ,20 ,21 ,22 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e21_3 =  ~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[12] in e21 : 11 
         wire e21_12 =  ~m[4]&m[3]&~m[2]&m[1]&m[0];
         assign e[21] = e21_3&c[3]|e21_12&c[12];
         
         //Contribution of c[1] in e20 : 27 
         wire e20_1 =  m[4]&m[3]&~m[2]&m[1]&m[0];
         //Contribution of c[2] in e20 : 6 ,8 ,10 ,16 ,20 ,21 ,22 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e20_2 =  ~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[12] in e20 : 9 ,11 ,13 
         wire e20_12 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[20] = e20_1|e20_2&c[2]|e20_12&c[12];

         //Contribution of c[11] in e19 : 4 ,8 ,12 ,16 ,21 
         wire e19_11 =  ~m[4]&~m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0];
         //Contribution of c[12] in e19 : 9 ,11 ,13 
         wire e19_12 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[19] = e19_11&c[11]|e19_12&c[12];
         
         //Contribution of c[1] in e18 : 2 ,6 ,14 ,15 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e18_1 =  ~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[10] in e18 : 4 ,8 ,12 ,16 ,21 
         wire e18_10 =  ~m[4]&~m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0];
         //Contribution of c[12] in e18 : 9 ,11 ,13 
         wire e18_12 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[18] = e18_1|e18_10&c[10]|e18_12&c[12];
         
         //Contribution of c[9] in e17 : 2 ,4 ,6 ,8 ,12 ,14 ,15 ,16 ,21 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e17_9 =  ~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&~m[3]&m[2]&~m[1]&~m[0]|~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[12] in e17 : 9 ,11 ,13 
         wire e17_12 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[17] = e17_9&c[9]|e17_12&c[12];
         
         //Contribution of c[1] in e16 : 0 ,3 ,18 ,22 
         wire e16_1 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0];
         //Contribution of c[6] in e16 : 11 
         wire e16_6 =  ~m[4]&m[3]&~m[2]&m[1]&m[0];
         //Contribution of c[8] in e16 : 2 ,4 ,6 ,8 ,12 ,14 ,15 ,16 ,21 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e16_8 =  ~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&~m[3]&m[2]&~m[1]&~m[0]|~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[12] in e16 : 9 ,13 
         wire e16_12 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[16] = e16_1|e16_6&c[6]|e16_8&c[8]|e16_12&c[12];
         
         //Contribution of c[5] in e15 : 11 
         wire e15_5 =  ~m[4]&m[3]&~m[2]&m[1]&m[0];
         //Contribution of c[7] in e15 : 2 ,4 ,6 ,8 ,12 ,14 ,15 ,16 ,21 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e15_7 =  ~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&~m[3]&m[2]&~m[1]&~m[0]|~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[12] in e15 : 9 ,13 
         wire e15_12 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[15] = e15_5&c[5]|e15_7&c[7]|e15_12&c[12];

         //Contribution of c[1] in e14 : 24 ,25 ,26 ,29 ,30 ,31 
         wire e14_1 =  m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[4] in e14 : 11 
         wire e14_4 =  ~m[4]&m[3]&~m[2]&m[1]&m[0];
         //Contribution of c[12] in e14 : 9 ,13 
         wire e14_12 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[14] = e14_1|e14_4&c[4]|e14_12&c[12];
         
         //Contribution of c[1] in e13 : 2 ,6 ,18 ,22 ,26 ,30 ,31 
         wire e13_1 =  ~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[3] in e13 : 11 
         wire e13_3 =  ~m[4]&m[3]&~m[2]&m[1]&m[0];
         //Contribution of c[12] in e13 : 9 ,13 
         wire e13_12 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[13] = e13_1|e13_3&c[3]|e13_12&c[12];
         
         //Contribution of c[1] in e12 : 15 ,16 ,24 ,25 ,26 ,31 
         wire e12_1 =  ~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[2] in e12 : 11 
         wire e12_2 =  ~m[4]&m[3]&~m[2]&m[1]&m[0];
         //Contribution of c[12] in e12 : 9 ,13 
         wire e12_12 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[12] = e12_1|e12_2&c[2]|e12_12&c[12];
         
         //Contribution of c[11] in e11 : 6 ,8 ,10 ,11 ,14 ,15 ,16 ,18 ,20 ,21 ,22 
         wire e11_11 =  ~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0];
         assign e[11] = e11_11&c[11];

         //Contribution of c[1] in e10 : 0 ,2 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e10_1 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[10] in e10 : 6 ,8 ,10 ,11 ,14 ,15 ,16 ,18 ,20 ,21 ,22 
         wire e10_10 =  ~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0];
         assign e[10] = e10_1|e10_10&c[10];
         
         //Contribution of c[4] in e9 : 0 ,2 ,14 ,15 
         wire e9_4 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[6] in e9 : 6 
         wire e9_6 =  ~m[4]&~m[3]&m[2]&m[1]&~m[0];
         //Contribution of c[9] in e9 : 8 ,10 ,11 ,16 ,18 ,20 ,21 ,22 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e9_9 =  ~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         assign e[9] = e9_4&c[4]|e9_6&c[6]|e9_9&c[9];
         
         //Contribution of c[1] in e8 : 3 
         wire e8_1 =  ~m[4]&~m[3]&~m[2]&m[1]&m[0];
         //Contribution of c[3] in e8 : 0 ,2 ,14 ,15 
         wire e8_3 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[8] in e8 : 8 ,10 ,11 ,16 ,18 ,20 ,21 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e8_8 =  ~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         assign e[8] = e8_1|e8_3&c[3]|e8_8&c[8];
         
         //Contribution of c[1] in e7 : 9 ,12 
         wire e7_1 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0];
         //Contribution of c[2] in e7 : 0 ,2 
         wire e7_2 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&~m[0];
         //Contribution of c[7] in e7 : 8 ,10 ,11 ,16 ,18 ,20 ,21 ,24 ,25 ,26 ,28 ,29 ,30 ,31 
         wire e7_7 =  ~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         //Contribution of c[12] in e7 : 14 ,15 
         wire e7_12 =  ~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0];
         assign e[7] = e7_1|e7_2&c[2]|e7_7&c[7]|e7_12&c[12];
         
         //Contribution of c[1] in e6 : 4 ,9 ,12 ,13 ,14 ,15 ,27 
         wire e6_1 =  ~m[4]&~m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&m[0];
         assign e[6] = e6_1;
         
         //Contribution of c[1] in e5 : 4 ,6 ,9 ,11 ,12 ,13 ,14 ,15 ,20 ,21 ,22 ,27 ,28 ,29 ,30 ,31 
         wire e5_1 =  ~m[4]&~m[3]&m[2]&~m[1]&~m[0]|~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         assign e[5] = e5_1;
         
         //Contribution of c[1] in e4 : 0 ,3 ,8 ,10 ,11 ,16 ,20 ,21 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 
         wire e4_1 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         assign e[4] = e4_1;
         
         //Contribution of c[1] in e3 : 9 ,13 
         wire e3_1 =  ~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[3] = e3_1;
         
         //Contribution of c[1] in e2 : 4 ,9 ,11 ,12 ,13 
         wire e2_1 =  ~m[4]&~m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0];
         assign e[2] = e2_1;
         
         //Contribution of c[1] in e1 : 0 ,2 ,3 ,4 ,6 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,18 ,20 ,21 ,22 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 
         wire e1_1 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&m[0]|~m[4]&~m[3]&m[2]&~m[1]&~m[0]|~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         assign e[1] = e1_1;
         
         //Contribution of c[1] in e0 : 0 ,2 ,3 ,4 ,6 ,8 ,9 ,10 ,11 ,12 ,13 ,14 ,15 ,16 ,18 ,20 ,21 ,22 ,24 ,25 ,26 ,27 ,28 ,29 ,30 ,31 
         wire e0_1 =  ~m[4]&~m[3]&~m[2]&~m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&~m[0]|~m[4]&~m[3]&~m[2]&m[1]&m[0]|~m[4]&~m[3]&m[2]&~m[1]&~m[0]|~m[4]&~m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&~m[0]|~m[4]&m[3]&~m[2]&~m[1]&m[0]|~m[4]&m[3]&~m[2]&m[1]&~m[0]|~m[4]&m[3]&~m[2]&m[1]&m[0]|~m[4]&m[3]&m[2]&~m[1]&~m[0]|~m[4]&m[3]&m[2]&~m[1]&m[0]|~m[4]&m[3]&m[2]&m[1]&~m[0]|~m[4]&m[3]&m[2]&m[1]&m[0]|m[4]&~m[3]&~m[2]&~m[1]&~m[0]|m[4]&~m[3]&~m[2]&m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&~m[0]|m[4]&~m[3]&m[2]&~m[1]&m[0]|m[4]&~m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&~m[0]|m[4]&m[3]&~m[2]&~m[1]&m[0]|m[4]&m[3]&~m[2]&m[1]&~m[0]|m[4]&m[3]&~m[2]&m[1]&m[0]|m[4]&m[3]&m[2]&~m[1]&~m[0]|m[4]&m[3]&m[2]&~m[1]&m[0]|m[4]&m[3]&m[2]&m[1]&~m[0]|m[4]&m[3]&m[2]&m[1]&m[0];
         assign e[0] = e0_1;

      end
      
   endgenerate
   
endmodule

/*
mmmmm
43210                           31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7 6543210      
-----                           -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -------
00000     C.ADDI4SPN        00   0  0 10  9  8  7 12 11  5  6  0  0  0  0  0  1  0  0  0  0  0  1  4  3  2 0010011  addi rd',x2,mzuimm[9:2]   
00001     C.FLD/C.FLW(m)    01   x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
00010     C.LW              02   0  0  0  0  0  5 12 11 10  6  0  0  0  1  9  8  7  0  1  0  0  1  4  3  2 0000011  lw rd',offset[6:2](rs1')
00011 m   C.ADDI16SP        03  12 12 12  4  3  5  2  6  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  1  0 0010011  addi x2,x2,nzimm[9:4] 
00100 m   C.JR              04   0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  0 1100111  jalr x0,0(rs1)                  
00101     C.FSD             05   x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
00110     C.SW              06   0  0  0  0  0  5 12  0  1  4  3  2  0  1  9  8  7  0  1  0 11 10  6  0  0 0100011  sw rs2',offset[6:2](rs1') 
00111     C.FSW             07   x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
01000     C.ADDI/C.NOP      08  12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7 0010011  addi rd,rd,nzimm[5:0] 
01001     C.JAL             09  12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  1 1101111  jal x1, offset[11:1]       
01010     C.LI              0a  12 12 12 12 12 12 12  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7 0010011  addi rd,x0,imm[5:0] 
01011     C.LUI             0b  12 12 12 12 12 12 12 12 12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7 0110111  lui rd,nzimm[17:12].  
01100 m   C.JALR            0c   0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  1 1100111  jalr x1,0(rs1)                  
01101     C.J               0d  12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  0 1101111  jal x0, offset[11:1]
01110     C.BEQZ            0e  12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  0 11 10  4  3 12 1100011  beq rs1',x0,offset[8:1]                  
01111     C.BNEZ            0f  12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  1 11 10  4  3 12 1100011  bne rs1',x0,offset[8:1]                  
10000     C.SLLI            10   0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  1 11 10  9  8  7 0010011  slli rd,rd,shamt[5:0] 
10001     C.FLDSP           11   x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
10010     C.LWSP            12   0  0  0  0  3  2 12  6  5  4  0  0  0  0  0  1  0  0  1  0 11 10  9  8  7 0000011  lw rd,offset[7:2](x2) 
10011     C.FLWSP           13   x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
10100     C.MV              14   0  0  0  0  0  0  0  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7 0110011  add rd,rd,rs2          
10101 m   C.ADD             15   0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7 0110011  add rd,rd,rs2                   
10110     C.SWSP            16   0  0  0  0  8  7 12  6  5  4  3  2  0  0  0  1  0  0  1  0 11 10  9  0  0 0100011  sw rs2,offset[7:2](x2)
10111     C.FSWSP/C.FSDSP(m 17   x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal 
11000 m   C.SRLI            18   0  0  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7 0010011  srli rd',rd',shamt[5:0]                               
11001 m   C.SRAI            19   0  1  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7 0010011  srai rd',rd',shamt[5:0]
11010 m   C.ANDI            1a  12 12 12 12 12 12 12  6  5  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7 0010011  andi rd',rd',imm[5:0]
11011 m   C.EBREAK          1b   0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0 1110011  ebreak
11100 m   C.SUB             1c   0  1  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  0  0  0  0  1  9  8  7 0110011  sub rd',rd',rs2'
11101 m   C.XOR             1d   0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  0  0  0  1  9  8  7 0110011  xor rd',rd',rs2'
11110 m   C.OR              1e   0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  0  0  1  9  8  7 0110011  or rd',rd'rs2'
11111 m   C.AND             1f   0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7 0110011  and rd',rd',rs2'

*/
 
/*
 43210
 -----
 00000  
 00001  x
 00010  
 00011  
 00100  
 00101  x
 00110  
 00111  x
 01000  
 01001  1
 01010  
 01011  
 01100  1
 01101  
 01110  
 01111  
 
 10000  
 10001  x
 10010  
 10011  x
 10100  
 10101  
 10110  
 10111  x
 11000  
 11001  1
 11010  
 11011  
 11100  1
 11101  
 11110  
 11111  
*/
