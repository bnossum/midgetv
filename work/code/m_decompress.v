/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2020-2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * ----------------------------------------------------------------------------

 First compilation with correct design: 160 LUTs Symplify, 160 Lattice LSE.
 
 Compressed instructions will be expanded in front of m_opreg.
 
 
                     s[5]
Di[31:16] -----+----|0\ aDi[31:16]                           s[3]
               |    |  |------------------------------------|0\        __
Di[15:0]  -----(--+-|1/                                     |  |------|  |- I[31:16]
               |  |                           uDi[31:16] +--|1/ s[1] -CE |
               |  |  s[4]                   __________   |            >__|
               |  +-|0\ aDi[15:0]          /          \--+
               |    |  |-----------+------| decompress |
               +----|1/            |       \__________/--+ uDi[15:0]
                                   |                     |   s[2]
                                   |                     +--|1\        __
                                   |                        |  |------|  |- I[15:0]
                                   +------------------------|0/ s[0] -CE |
                                                                      >__|

 
 
 
                     s[5]
Di[31:16] -----+----|0\ aDi[31:16]                           s[3]
               |    |  |------------------------------------|0\        __
Di[15:0]  -----(--+-|1/                                     |  |------|  |- I[31:16]
               |  |                           uDi[31:16] +--|1/ s[1] -CE |
               |  |  s[4]                   __________   |            >__|
               |  +-|0\ aDi[15:0]          /          \--+
               |    |  |-----------+------| decompress |
               +----|1/            |       \__________/--+ uDi[15:0]
               |                   |                     |   s[2]
               |                   |                     +--|1\          
               |                   |                        |  |-|0\        __                   
               |  _                +------------------------|0/  |  |------|  |- I[15:0]         
               +-| |---------------------------------------------|1/ s[0] -CE |                  
                 >_|                                                       >__|             
       

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
 
 
 Compressed instruction c[15:0]                       | Translated instruction e[31:0]
   111                                                |        
 10543              12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7 6543210      
 ------             --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -------
 00000 C.ADDI4SPN   z5  z4 z9 z8 z7 z6 z2 z3 d2 d1 d0 |  0  0 z9 z8 z7 z6 z5 z4 z3 z2  0  0  0  0  0  1  0  0  0  0  0  1 d2 d1 d0 0010011  addi rd',x2,mzuimm[9:2]   
 00001 C.FLD         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
 00010 C.LW         z5  z4 z3 s2 s1 s0 z2 z6 d2 d1 d0 |  0  0  0  0  0 z6 z5 z4 z3 z2  0  0  0  1 s2 s1 s0  0  1  0  0  1 d2 d1 d0 0000011  lw rd',offset[6:2](rs1')
 00011 C.FLW         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
 00100 reserved      x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxx11  
 00101 C.FSD         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
 00110 C.SW         z5  z4 z3 s2 s1 s0 z2 z6 t2 t1 t0 |  0  0  0  0  0 z6 z5  0  1 t2 t1 t0  0  1 s2 s1 s0  0  1  0 z4 z3 z2  0  0 0100011  sw rs2',offset[6:2](rs1') 
 00111 C.FSW         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
 01000 C.ADDI/C.NOP i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | i5 i5 i5 i5 i5 i5 i5 i4 i3 i2 i1 i0 D4 D3 D2 D1 D0  0  0  0 D4 D3 D2 D1 D0 0010011  addi rd,rd,nzimm[5:0] 
 01001 C.JAL        ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | ib ia i9 i8 i7 i6 i5 i4 i3 i2 i1 ib ib ib ib ib ib ib ib ib  0  0  0  0  1 1101111  jal x1, offset[11:1]
 01010 C.LI         i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | i5 i5 i5 i5 i5 i5 i5 i4 i3 i2 i1 i0  0  0  0  0  0  0  0  0 D4 D3 D2 D1 D0 0010011  addi rd,x0,imm[5:0] 
=01011 C.ADDI16SP   i9   0  0  0  1  0 i4 i6 i8 i7 i5 | i9 i9 i9 i8 i7 i6 i5 i4  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  1  0 0010011  addi x2,x2,nzimm[9:4]
=01011 C.LUI        ih  D4 D3 D2 D1 D0 ig if ie id ic | ih ih ih ih ih ih ih ih ih ih ih ih ih ih ih ig if ie id ic D4 D3 D2 D1 D0 0110111  lui rd,nzimm[17:12].  rd!=0, rd!=2
_01100 C.AND         0   1  1 d2 d1 d0  1  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1 t2 t1 t0  0  1 d2 d1 d0  1  1  1  0  1 d2 d1 d0 0110011  and rd',rd',rs2'
_01100 C.ANDI       i5   1  0 d2 d1 d0 i4 i3 i2 i1 i0 | i5 i5 i5 i5 i5 i5 i5 i4 i3 i2 i1 i0  0  1 d2 d1 d0  l  l  l  0  1 d2 d1 d0 0010011  andi rd',rd',imm[5:0]
_01100 C.OR          0   1  1 d2 d1 d0  1  0 t2 t1 t0 |  0  0  0  0  0  0  0  0  1 t2 t1 t0  0  1 d2 d1 d0  1  1  0  0  1 d2 d1 d0 0110011  or rd',rd'rs2'
_01100 C.SRAI        x   0  1 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0 z4 z3 z2 z1 z0  0  1 d2 d1 d0  1  0  1  0  1 d2 d1 d0 0010011  srai rd',rd',shamt[5:0]
_01100 C.SRLI        x   0  0 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0 z4 z3 z2 z1 z0  0  1 d2 d1 d0  1  0  1  0  1 d2 d1 d0 0010011  srli rd',rd',shamt[5:0]
_01100 C.SUB         0   1  1 d2 d1 d0  0  0 t2 t1 t0 |  0  1  0  0  0  0  0  0  1 t2 t1 t0  0  1 d2 d1 d0  0  0  0  0  1 d2 d1 d0 0110011  sub rd',rd',rs2'
_01100 C.XOR         0   1  1 d2 d1 d0  0  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1 t2 t1 t0  0  1 d2 d1 d0  1  0  0  0  1 d2 d1 d0 0110011  xor rd',rd',rs2'
_01100 reserved      1   1  1  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxx11  
 01101 C.J          ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | ib ia i9 i8 i7 i6 i5 i4 i3 i2 i1 ib ib ib ib ib ib ib ib ib  0  0  0  0  0 1101111  jal x0, offset[11:1]
 01110 C.BEQZ       i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | i8 i8 i8 i8 i7 i6 i5  0  0  0  0  0  0  1 s2 s1 s0  0  0  0 i4 i3 i2 i1 i8 1100011  beq rs1',x0,offset[8:1]                  
 01111 C.BNEZ       i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | i8 i8 i8 i8 i7 i6 i5  0  0  0  0  0  0  1 s2 s1 s0  0  0  1 i4 i3 i2 i1 i8 1100011  bne rs1',x0,offset[8:1]                  
 10000 C.SLLI        x  D4 D3 D2 D1 D0 z4 z3 z2 z1 z0 |  0  0  0  0  0  0  0 z4 z3 z2 z1 z0 D4 D3 D2 D1 D0  0  0  1 D4 D3 D2 D1 D0 0010011  slli rd,rd,shamt[5:0]
 10001 C.FLDSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
 10010 C.LWSP       z5  D4 D3 D2 D1 D0 z4 z3 z2 z7 z6 |  0  0  0  0 z7 z6 z5 z4 z3 z2  0  0  0  0  0  1  0  0  1  0 D4 D3 D2 D1 D0 0000011  lw rd,offset[7:2](x2)
 10011 C.FLWSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
=10100 C.ADD         l  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0 T4 T3 T2 T1 T0 D4 D3 D2 D1 D0  0  0  0 D4 D3 D2 D1 D0 0110011  add rd,rd,rs2
=10100 C.EBREAK      l   0  0  0  0  0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0 1110011  ebreak
=10100 C.JALR        l  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 S4 S3 S2 S1 S0  0  0  0  0  0  0  0  1 1100111  jalr x1,0(rs1)  (rs1 != 0)
=10100 C.JR          0  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 S4 S3 S2 S1 S0  0  0  0  0  0  0  0  0 1100111  jalr x0,0(rs1)  (rs1 != 0)
=10100 C.MV          0  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0 T4 T3 T2 T1 T0  0  0  0  0  0  0  0  0 D4 D3 D2 D1 D0 0110011  add rd,rd,rs2          
 10101 C.FSDSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
 10110 C.SWSP       z5  z4 z3 z2 z7 z6 T4 T3 T2 T1 T0 |  0  0  0  0 z7 z6 z5 T4 T3 T2 T1 T0  0  0  0  1  0  0  1  0 z4 z3 z2  0  0 0100011  sw rs2,offset[7:2](x2)
 10111 C.FSWSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal

Dst : Src
e31 : c12 0
e30 : c12 c8 1 0
e29 : c12 c10 0
e28 : c12 c9 c4 0
e27 : c12 c8 c6 c3 0
e26 : c12 c7 c5 c2 0
e25 : c12 c2 0
e24 : c12 c11 c6 0
e23 : c12 c10 c5 1 0
e22 : c12 c6 c4 0
e21 : c12 c3 0
e20 : c12 c2 1 0 (the '1' may come from c12)
e19 : c12 c11 0
e18 : c12 c10 1 0
e17 : c12 c9 0
e16 : c12 c8 c6 1 0
e15 : c12 c7 c5 0
e14 : c12 c4 1 0
e13 : c12 c3 1 0
e12 : c12 c2 1 0
e11 : c11 0
e10 : c10 1 0
e9  : c9 c6 c4 0
e8  : c8 c3 1 0 (the '1' may come from c8)
s7  : c12 c7 c2 1 0

Recast the table so we have a distinct index. We need some decoding:
c[15:0] == 16'h000  : illegal instruction

 c[11:7] == 5'b00010
 | c[11:7] == 5'b00000 
 | | c[6:0]  == 5'b00000 
 | | |  
 0 0 0  C.LUI       C.JR    C.ADD    
 0 0 1  C.LUI       C.MV    C.JALR
 0 1 0  C.LUI       C.JR    C.ADD    
 0 1 1  C.LUI       C.MV    C.EBREAK
 1 0 0  C.ADDI16SP  C.JR    C.ADD
 1 0 1  C.ADDI16SP  C.MV    C.JALR
 

  Compressed instruction c[15:0]                       | Translated instruction e[31:0]
   111                                                |        
 10543              12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7 6543210      
 -----              --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -------
 01011 C.LUI        ih  D4 D3 D2 D1 D0 ig if ie id ic | ih ih ih ih ih ih ih ih ih ih ih ih ih ih ih ig if ie id ic D4 D3 D2 D1 D0 0110111  lui rd,nzimm[17:12].  rd!=0, rd!=2
 01011 C.ADDI16SP   i9   0  0  0  1  0 i4 i6 i8 i7 i5 | i9 i9 i9 i8 i7 i6 i5 i4  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  1  0 0010011  addi x2,x2,nzimm[9:4]
=10100 C.JR          0  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 S4 S3 S2 S1 S0  0  0  0  0  0  0  0  0 1100111  jalr x0,0(rs1)  (rs1 != 0)
=10100 C.MV          0  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0 T4 T3 T2 T1 T0  0  0  0  0  0  0  0  0 D4 D3 D2 D1 D0 0110011  add rd,rd,rs2          
_01100 C.AND         0   1  1 d2 d1 d0  1  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1 t2 t1 t0  0  1 d2 d1 d0  1  1  1  0  1 d2 d1 d0 0110011  and rd',rd',rs2'
_01100 C.OR          0   1  1 d2 d1 d0  1  0 t2 t1 t0 |  0  0  0  0  0  0  0  0  1 t2 t1 t0  0  1 d2 d1 d0  1  1  0  0  1 d2 d1 d0 0110011  or rd',rd'rs2'
_01100 C.SUB         0   1  1 d2 d1 d0  0  0 t2 t1 t0 |  0  1  0  0  0  0  0  0  1 t2 t1 t0  0  1 d2 d1 d0  0  0  0  0  1 d2 d1 d0 0110011  sub rd',rd',rs2'
_01100 C.XOR         0   1  1 d2 d1 d0  0  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1 t2 t1 t0  0  1 d2 d1 d0  1  0  0  0  1 d2 d1 d0 0110011  xor rd',rd',rs2'
=10100 C.ADD         l  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0 T4 T3 T2 T1 T0 D4 D3 D2 D1 D0  0  0  0 D4 D3 D2 D1 D0 0110011  add rd,rd,rs2
=10100 C.EBREAK      l   0  0  0  0  0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0 1110011  ebreak
=10100 C.JALR        l  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 S4 S3 S2 S1 S0  0  0  0  0  0  0  0  1 1100111  jalr x1,0(rs1)  (rs1 != 0)
_01100 reserved      1   1  1  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxx11  
 00000 C.ADDI4SPN   z5  z4 z9 z8 z7 z6 z2 z3 d2 d1 d0 |  0  0 z9 z8 z7 z6 z5 z4 z3 z2  0  0  0  0  0  1  0  0  0  0  0  1 d2 d1 d0 0010011  addi rd',x2,mzuimm[9:2]   
 00001 C.FLD         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
 00010 C.LW         z5  z4 z3 s2 s1 s0 z2 z6 d2 d1 d0 |  0  0  0  0  0 z6 z5 z4 z3 z2  0  0  0  1 s2 s1 s0  0  1  0  0  1 d2 d1 d0 0000011  lw rd',offset[6:2](rs1')
 00011 C.FLW         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
 00100 reserved      x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxx11  
 00101 C.FSD         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
 00110 C.SW         z5  z4 z3 s2 s1 s0 z2 z6 t2 t1 t0 |  0  0  0  0  0 z6 z5  0  1 t2 t1 t0  0  1 s2 s1 s0  0  1  0 z4 z3 z2  0  0 0100011  sw rs2',offset[6:2](rs1') 
 00111 C.FSW         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
 01000 C.ADDI/C.NOP i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | i5 i5 i5 i5 i5 i5 i5 i4 i3 i2 i1 i0 D4 D3 D2 D1 D0  0  0  0 D4 D3 D2 D1 D0 0010011  addi rd,rd,nzimm[5:0] 
 01001 C.JAL        ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | ib ia i9 i8 i7 i6 i5 i4 i3 i2 i1 ib ib ib ib ib ib ib ib ib  0  0  0  0  1 1101111  jal x1, offset[11:1]
 01010 C.LI         i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | i5 i5 i5 i5 i5 i5 i5 i4 i3 i2 i1 i0  0  0  0  0  0  0  0  0 D4 D3 D2 D1 D0 0010011  addi rd,x0,imm[5:0] 
 01101 C.J          ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | ib ia i9 i8 i7 i6 i5 i4 i3 i2 i1 ib ib ib ib ib ib ib ib ib  0  0  0  0  0 1101111  jal x0, offset[11:1]
 01110 C.BEQZ       i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | i8 i8 i8 i8 i7 i6 i5  0  0  0  0  0  0  1 s2 s1 s0  0  0  0 i4 i3 i2 i1 i8 1100011  beq rs1',x0,offset[8:1]                  
 01111 C.BNEZ       i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | i8 i8 i8 i8 i7 i6 i5  0  0  0  0  0  0  1 s2 s1 s0  0  0  1 i4 i3 i2 i1 i8 1100011  bne rs1',x0,offset[8:1]                  
 10000 C.SLLI        x  D4 D3 D2 D1 D0 z4 z3 z2 z1 z0 |  0  0  0  0  0  0  0 z4 z3 z2 z1 z0 D4 D3 D2 D1 D0  0  0  1 D4 D3 D2 D1 D0 0010011  slli rd,rd,shamt[5:0]
 10001 C.FLDSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
 10010 C.LWSP       z5  D4 D3 D2 D1 D0 z4 z3 z2 z7 z6 |  0  0  0  0 z7 z6 z5 z4 z3 z2  0  0  0  0  0  1  0  0  1  0 D4 D3 D2 D1 D0 0000011  lw rd,offset[7:2](x2)
 10011 C.FLWSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
 10101 C.FSDSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
 10110 C.SWSP       z5  z4 z3 z2 z7 z6 T4 T3 T2 T1 T0 |  0  0  0  0 z7 z6 z5 T4 T3 T2 T1 T0  0  0  0  1  0  0  1  0 z4 z3 z2  0  0 0100011  sw rs2,offset[7:2](x2)
 10111 C.FSWSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
_01100 C.ANDI       i5   1  0 d2 d1 d0 i4 i3 i2 i1 i0 | i5 i5 i5 i5 i5 i5 i5 i4 i3 i2 i1 i0  0  1 d2 d1 d0  l  l  l  0  1 d2 d1 d0 0010011  andi rd',rd',imm[5:0]
_01100 C.SRAI        x   0  1 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0 z4 z3 z2 z1 z0  0  1 d2 d1 d0  1  0  1  0  1 d2 d1 d0 0010011  srai rd',rd',shamt[5:0]
_01100 C.SRLI        x   0  0 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0 z4 z3 z2 z1 z0  0  1 d2 d1 d0  1  0  1  0  1 d2 d1 d0 0010011  srli rd',rd',shamt[5:0]

The interesting is where an incoming ends up. Reiterates the table with bit numbers. NB. 0 and 1 mean 0 and 1.
Numbers from 2 to 12 is from the compressed instruction

 For e[31]: It is not evident to see, but assuming C.SRAI, C.SRLI have shamt[5] == 0, we get:
  cc
  10
  --
  00 0
  01 c12
  10 0
  11 x
 
 so I can simplify furter:   e[31] = c[0] & c[12];

 e[30] is not easy at all:
 e[30] = e30sel_12&c[12] | e30sel8&c[8] | e30sel1
 e30sel_12 = (c[1:0] == 2'b01) && ((c[15:13] == 3'b000) || (c[15:13] == 3'b010) || (c[15:13] == 3'b011) || (c[15:13] == 3'b110) || ((c[15:13] == 3'b100) && (c[11:10] == 2'b10)));
 e30sel_8  = (c[1:0] == 2'b01) && ((c[15:13] == 3'b001) || (c[15:13] == 3'b101) || (c[15:13] == 3'b111));
 e30sel1   = (c[1:0] == 2'b01) && (c[15:13] == 3'b100) && ( (c[11] == 1'b0) || (c[11:10] == 2'b11 && c[6:5] == 1'b00));
   
   
  111                 
10543                                30
-----                                --
00000 C.ADDI4SPN                      0   
00001 C.FLD                           x
00010 C.LW                            0
00011 C.FLW                           x
00100 reserved                        x
00101 C.FSD                           x
00110 C.SW                            0
00111 C.FSW                           x
 
01000 C.ADDI/C.NOP                   12  01000 -> 12
01001 C.JAL                           8  01001 ->  8
01010 C.LI                           12  01010 -> 12
01011 C.ADDI16SP/C.LUT               12  01011 -> 12
       11
       1065                             
01100@ 1111  C.AND              0  011001111 -> 0 
01100@ 10xx  C.ANDI            12  0110010xx -> 12
01100@ 1110  C.OR               0  011001110 -> 0
01100@ 01xx  C.SRAI             1  0110001xx -> 1
01100@ 00xx  C.SRLI             1  0110000xx -> 1
01100@ 1100  C.SUB              1  0110011x0 -> 1
01100@ 1101  C.XOR              0  011001101 -> 0
01100@ 11xx  reserved           x
                                     
01101 C.J                             8  01101 ->  8
01110 C.BEQZ                         12  01110 -> 12
01111 C.BNEZ                         12  01111 ->  8

10000 C.SLLI                          0   
10001 C.FLDSP                         x
10010 C.LWSP                          0
10011 C.FLWSP                         x
10100 C.ADD/C.EBREAK/C.JALR/C.JR/C.MV 0
10101 C.FSDSP                         x
10110 C.SWSP                          0
10111 C.FSWSP                         x
  
 
  
 Compressed instruction c[15:0]                       | Translated instruction e[31:0]
  111                                                |        
10543              12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7 6543210      
-----              --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -------
00000 C.ADDI4SPN   z5  z4 z9 z8 z7 z6 z2 z3 d2 d1 d0 |  0  0 10  9  8  7 12 11  5  6  0  0  0  0  0  1  0  0  0  0  0  1  4  3  2 0010011  addi rd',x2,mzuimm[9:2]   
00001 C.FLD         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
00010 C.LW         z5  z4 z3 s2 s1 s0 z2 z6 d2 d1 d0 |  0  0  0  0  0  5 12 11 10  6  0  0  0  1  9  8  7  0  1  0  0  1  4  3  2 0000011  lw rd',offset[6:2](rs1')
00011 C.FLW         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
00100 reserved      x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxx11  
00101 C.FSD         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
00110 C.SW         z5  z4 z3 s2 s1 s0 z2 z6 t2 t1 t0 |  0  0  0  0  0  5 12  0  1  4  3  2  0  1  9  8  7  0  1  0 11 10  6  0  0 0100011  sw rs2',offset[6:2](rs1') 
00111 C.FSW         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
01000 C.ADDI/C.NOP i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7 0010011  addi rd,rd,nzimm[5:0] 
01001 C.JAL        ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | 12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  1 1101111  jal x1, offset[11:1]       xxx
01010 C.LI         i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7 0010011  addi rd,x0,imm[5:0] 
01011 C.ADDI16SP   i9   0  0  0  1  0 i4 i6 i8 i7 i5 | 12 12 12  4  3  5  2  6  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  1  0 0010011  addi x2,x2,nzimm[9:4]
01011 C.LUI        ih  D4 D3 D2 D1 D0 ig if ie id ic | 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7 0110111  lui rd,nzimm[17:12].  rd!=0, rd!=2

01100 C.AND         0   1  1 d2 d1 d0  1  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7 0110011  and rd',rd',rs2'
01100 C.ANDI       i5   1  0 d2 d1 d0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7 0010011  andi rd',rd',imm[5:0]
01100 C.OR          0   1  1 d2 d1 d0  1  0 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  0  0  1  9  8  7 0110011  or rd',rd'rs2'
01100 C.SRAI        x   0  1 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7 0010011  srai rd',rd',shamt[5:0]
01100 C.SRLI        x   0  0 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7 0010011  srli rd',rd',shamt[5:0]                               
01100 C.SUB         0   1  1 d2 d1 d0  0  0 t2 t1 t0 |  0  1  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  0  0  0  0  1  9  8  7 0110011  sub rd',rd',rs2'
01100 C.XOR         0   1  1 d2 d1 d0  0  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  0  0  0  1  9  8  7 0110011  xor rd',rd',rs2'
01100 reserved      1   1  1  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxx11  

01101 C.J          ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | 12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  0 1101111  jal x0, offset[11:1]
01110 C.BEQZ       i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | 12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  0 11 10  4  3 12 1100011  beq rs1',x0,offset[8:1]                  
01111 C.BNEZ       i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | 12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  1 11 10  4  3 12 1100011  bne rs1',x0,offset[8:1]                  
10000 C.SLLI        x  D4 D3 D2 D1 D0 z4 z3 z2 z1 z0 |  0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  1 11 10  9  8  7 0010011  slli rd,rd,shamt[5:0]
10001 C.FLDSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
10010 C.LWSP       z5  D4 D3 D2 D1 D0 z4 z3 z2 z7 z6 |  0  0  0  0  3  2 12  6  5  4  0  0  0  0  0  1  0  0  1  0 11 10  9  8  7 0000011  lw rd,offset[7:2](x2)
10011 C.FLWSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
10100 C.ADD         l  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7 0110011  add rd,rd,rs2
10100 C.EBREAK      l   0  0  0  0  0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0 1110011  ebreak
10100 C.JALR        l  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  1 1100111  jalr x1,0(rs1)  (rs1 != 0)
10100 C.JR          0  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  0 1100111  jalr x0,0(rs1)  (rs1 != 0)
10100 C.MV          0  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7 0110011  add rd,rd,rs2          
10101 C.FSDSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
10110 C.SWSP       z5  z4 z3 z2 z7 z6 T4 T3 T2 T1 T0 |  0  0  0  0  8  7 12  6  5  4  3  2  0  0  0  1  0  0  1  0 11 10  9  0  0 0100011  sw rs2,offset[7:2](x2)
10111 C.FSWSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal


For e[29]:
 
  111               
10543                    29
-----                    --
00000 C.ADDI4SPN         10
00001 C.FLD               x
00010 C.LW                0
00011 C.FLW               x
00100 reserved            x
00101 C.FSD               x
00110 C.SW                0
00111 C.FSW               x
01000 C.ADDI/C.NOP       12
01001 C.JAL              10
01010 C.LI               12
01011 C.ADDI16SP/C.LUI   12
                     
01100 C.AND         0
01100 C.ANDI       12
01100 C.OR          0
01100 C.SRAI        0
01100 C.SRLI        0
01100 C.SUB         0
01100 C.XOR         0
01100 reserved      x
                     
01101 C.J          10
01110 C.BEQZ       12
01111 C.BNEZ       12

10xxx               0

 
 Can I say something on types of control?
 /////////////////////////////// TRY AGAIN ////////////////////////////////////////////////////////
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
   
       
  111   
10543               12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7 6543210      
-----               --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -------
00000  C.ADDI4SPN   z5  z4 z9 z8 z7 z6 z2 z3 d2 d1 d0 |  0  0 10  9  8  7 12 11  5  6  0  0  0  0  0  1  0  0  0  0  0  1  4  3  2 0010011  addi rd',x2,mzuimm[9:2]   
00001  C.FLD         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
00010  C.LW         z5  z4 z3 s2 s1 s0 z2 z6 d2 d1 d0 |  0  0  0  0  0  5 12 11 10  6  0  0  0  1  9  8  7  0  1  0  0  1  4  3  2 0000011  lw rd',offset[6:2](rs1')
00011  C.FLW         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
00100  reserved      x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxxx  don't care in midgetv
00101  C.FSD         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
00110  C.SW         z5  z4 z3 s2 s1 s0 z2 z6 t2 t1 t0 |  0  0  0  0  0  5 12  0  1  4  3  2  0  1  9  8  7  0  1  0 11 10  6  0  0 0100011  sw rs2',offset[6:2](rs1') 
00111  C.FSW         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv

          c[11:7]==5'h2
  11111   | 
105431065 |               12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7 6543210      
-----|||| |               --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -------
01000     x  C.ADDI/C.NOP i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7 0010011  addi rd,rd,nzimm[5:0] 
01001     x  C.JAL        ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | 12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  1 1101111  jal x1, offset[11:1]       
01010     x  C.LI         i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7 0010011  addi rd,x0,imm[5:0] 
01011     0  C.LUI        ih  D4 D3 D2 D1 D0 ig if ie id ic | 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7 0110111  lui rd,nzimm[17:12].  
01011     1  C.ADDI16SP   i9   0  0  0  1  0 i4 i6 i8 i7 i5 | 12 12 12  4  3  5  2  6  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  1  0 0010011  addi x2,x2,nzimm[9:4] 
0110000   x  C.SRLI        x   0  0 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7 0010011  srli rd',rd',shamt[5:0]                               
0110001   0  C.SRAI        x   0  1 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7 0010011  srai rd',rd',shamt[5:0]
0110010   0  C.ANDI       i5   1  0 d2 d1 d0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7 0010011  andi rd',rd',imm[5:0]
0110011   0  reserved      1   1  1  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxxx  
011001100 0  C.SUB         0   1  1 d2 d1 d0  0  0 t2 t1 t0 |  0  1  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  0  0  0  0  1  9  8  7 0110011  sub rd',rd',rs2'
011001101 0  C.XOR         0   1  1 d2 d1 d0  0  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  0  0  0  1  9  8  7 0110011  xor rd',rd',rs2'
011001110 0  C.OR          0   1  1 d2 d1 d0  1  0 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  0  0  1  9  8  7 0110011  or rd',rd'rs2'
011001111 0  C.AND         0   1  1 d2 d1 d0  1  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7 0110011  and rd',rd',rs2'
01101     x  C.J          ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | 12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  0 1101111  jal x0, offset[11:1]
01110     x  C.BEQZ       i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | 12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  0 11 10  4  3 12 1100011  beq rs1',x0,offset[8:1]                  
01111     x  C.BNEZ       i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | 12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  1 11 10  4  3 12 1100011  bne rs1',x0,offset[8:1]                  

      c[11:7]==5'h0
  1111|c[6:2]==5'h0
105432||               12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7 6543210      
-----|||               --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -------
10000xxx  C.SLLI        x  D4 D3 D2 D1 D0 z4 z3 z2 z1 z0 |  0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  1 11 10  9  8  7 0010011  slli rd,rd,shamt[5:0] 
10001xxx  C.FLDSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
10010xxx  C.LWSP       z5  D4 D3 D2 D1 D0 z4 z3 z2 z7 z6 |  0  0  0  0  3  2 12  6  5  4  0  0  0  0  0  1  0  0  1  0 11 10  9  8  7 0000011  lw rd,offset[7:2](x2) 
10011xxx  C.FLWSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
101000x0  C.MV          0  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7 0110011  add rd,rd,rs2          
101000x1  C.JR          0  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  0 1100111  jalr x0,0(rs1)                  rs1 != 0
10100101  C.JALR        l  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  1 1100111  jalr x1,0(rs1)                  rs1 != 0
10100111  C.EBREAK      l   0  0  0  0  0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0 1110011  ebreak
101001x0  C.ADD         l  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7 0110011  add rd,rd,rs2                   rs2 != 0
10101xxx  C.FSDSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
10110xxx  C.SWSP       z5  z4 z3 z2 z7 z6 T4 T3 T2 T1 T0 |  0  0  0  0  8  7 12  6  5  4  3  2  0  0  0  1  0  0  1  0 11 10  9  0  0 0100011  sw rs2,offset[7:2](x2)
10111xxx  C.FSWSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal

*/

module m_decompress
  (
   input [15:0]  c, //   Compressed instruction
//   output [31:0] q0e, // Made visible for debugging
//   output [31:0] q1e, // Made visible for debugging
//   output [31:0] q2e,//  Made visible for debugging
   output [31:0] e //   Expanded result
   );
   wire [31:0] mq0q2;
   wire [31:0] q0e,q1e,q2e;

   wire         rs1eq0,rs1eq2,rs2eq0,c15_23eq0, hC_EBREAK;
   assign rs1eq0 = c[11:7] == 5'b00000;
   assign rs1eq2 = c[11:7] == 5'b00010;
   assign rs2eq0 = c[ 6:2] == 5'b00000;
   assign c15_23eq0 = c[15:12] == 4'b0000;
   /* 
    Quadrant 0.
    111   
    543               12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7 6543210      
    ---               --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -------
    000  C.ADDI4SPN   z5  z4 z9 z8 z7 z6 z2 z3 d2 d1 d0 |  0  0 10  9  8  7 12 11  5  6  0  0  0  0  0  1  0  0  0  0  0  1  4  3  2 0010011  addi rd',x2,mzuimm[9:2]   
    001  C.FLD         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    010  C.LW         z5  z4 z3 s2 s1 s0 z2 z6 d2 d1 d0 |  0  0  0  0  0  5 12 11 10  6  0  0  0  1  9  8  7  0  1  0  0  1  4  3  2 0000011  lw rd',offset[6:2](rs1')
    011  C.FLW         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    100  reserved      x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxxx  don't care in midgetv
    101  C.FSD         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    110  C.SW         z5  z4 z3 s2 s1 s0 z2 z6 t2 t1 t0 |  0  0  0  0  0  5 12  0  1  4  3  2  0  1  9  8  7  0  1  0 11 10  6  0  0 0100011  sw rs2',offset[6:2](rs1') 
    111  C.FSW         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    
    A very easy quadrant. The defined illegal instruction falls into this quadrant. I do not expand 16'h0000 to 32'h00000000, there is no need,
    it is enough to ensure e[1] == 1'b0  or e[0] == 1'b0. Then execution of the expanded instruction will trigger an illegal instruction fault.
    For the record, this instruction will be 32'h00010411
    */
   assign q0e[31] = 1'b0;
   assign q0e[30] = 1'b0;
   assign q0e[29] = ~c[14]&c[10];
   assign q0e[28] = ~c[14]&c[9];
   assign q0e[27] = ~c[14]&c[8];
   assign q0e[26] = (~c[14]&c[7]) | (c[14]&c[5]);
   assign q0e[25] = c[12];
   assign q0e[24] = ~c[15]&c[11];
   assign q0e[23] = (~c[14]&c[5]) | (c[14]&c[10]) | c[15];
   assign q0e[22] = (~c[15]&c[6]) | (c[15]&c[4]);
   assign q0e[21] = c[15]&c[3];
   assign q0e[20] = c[15]&c[2];
   assign q0e[19] = 1'b0;
   assign q0e[18] = c[15]|c[14];
   assign q0e[17] = (c[15]|c[14])&c[9];
   assign q0e[16] = ((c[15]|c[14])&c[8]) | (~c[15]&~c[14]);
   assign q0e[15] = (c[15]|c[14])&c[7];
   assign q0e[14] = 1'b0;
   assign q0e[13] = c[15]|c[14];
   assign q0e[12] = 1'b0;
   assign q0e[11] = c[15]&c[11];
   assign q0e[10] = (c[15]&c[10]) | ~c[15];
   assign q0e[ 9] = (~c[15]&c[4]) | (c[15]&c[6]);
   assign q0e[ 8] = ~c[15]&c[3];
   assign q0e[ 7] = ~c[15]&c[2];
   assign q0e[ 6] = 1'b0;
   assign q0e[ 5] = c[15];
   assign q0e[ 4] = ~c[14];
   assign q0e[ 3] = 1'b0;
   assign q0e[ 2] = 1'b0;
   assign q0e[ 1] = ~rs1eq0 | ~rs2eq0 | ~c15_23eq0; // To trigger illegal instr
   assign q0e[ 0] = ~c[13];
   
   /* 
    Quadrant 2.
    
        c[11:7]==5'h0
    1111|c[6:2]==5'h0
    5432||               12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7 6543210      
    ---|||               --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -------
    000xxx  C.SLLI        x  D4 D3 D2 D1 D0 z4 z3 z2 z1 z0 |  0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  1 11 10  9  8  7 0010011  slli rd,rd,shamt[5:0] 
    001xxx  C.FLDSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    010xxx  C.LWSP       z5  D4 D3 D2 D1 D0 z4 z3 z2 z7 z6 |  0  0  0  0  3  2 12  6  5  4  0  0  0  0  0  1  0  0  1  0 11 10  9  8  7 0000011  lw rd,offset[7:2](x2) 
    011xxx  C.FLWSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    1000x0  C.MV          0  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7 0110011  add rd,rd,rs2          
    1000x1 aC.JR          0  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  0 1100111  jalr x0,0(rs1)                  rs1 != 0
    100101 aC.JALR        l  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  1 1100111  jalr x1,0(rs1)                  rs1 != 0
    100111  C.EBREAK      l   0  0  0  0  0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0 1110011  ebreak
    1001x0 aC.ADD         l  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7 0110011  add rd,rd,rs2                   rs2 != 0
    101xxx xC.FSDSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
    110xxx  C.SWSP       z5  z4 z3 z2 z7 z6 T4 T3 T2 T1 T0 |  0  0  0  0  8  7 12  6  5  4  3  2  0  0  0  1  0  0  1  0 11 10  9  0  0 0100011  sw rs2,offset[7:2](x2)
    111xxx  C.FSWSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
    
    */
   assign q2e[31:28] = 4'b0000;
   assign q2e[27] = (~c[15]&c[14]&c[3]) | (c[15]&c[14]&c[8]);
   assign q2e[26] = (~c[15]&c[14]&c[2]) | (c[15]&c[14]&c[7]);
   assign q2e[25] = c[14]&c[12];
   assign q2e[24] = ~(c[15]&~c[14]&rs2eq0) & c[6];
   assign q2e[23] = ~(c[15]&~c[14]&rs2eq0) & c[5];
   assign q2e[22] = ~(c[15]&~c[14]&rs2eq0) & c[4];
   assign q2e[21] =(~(c[15]&~c[14]&rs2eq0) & c[3]) & ( c[15] | ~c[14]);
   assign hC_EBREAK = ~c[13] & c[12] & rs1eq0 & rs2eq0;
   assign q2e[20] = ((~(c[15]&~c[14]&rs2eq0) & c[2]) & ( c[15] | ~c[14])) | (c[15]&~c[14]&hC_EBREAK);
   assign q2e[19] = ((~c[15]&~c[14]) | (c[15]&~c[14] & (rs2eq0 | c[12]) & ~hC_EBREAK)) & c[11];
   assign q2e[18] = ((~c[15]&~c[14]) | (c[15]&~c[14] & (rs2eq0 | c[12]) & ~hC_EBREAK)) & c[10];
   assign q2e[17] = ((~c[15]&~c[14]) | (c[15]&~c[14] & (rs2eq0 | c[12]) & ~hC_EBREAK)) & c[ 9];
   assign q2e[16] = (((~c[15]&~c[14]) | (c[15]&~c[14] & (rs2eq0 | c[12]) & ~hC_EBREAK)) & c[ 8]) | c[14];
   assign q2e[15] = ((~c[15]&~c[14]) | (c[15]&~c[14] & (rs2eq0 | c[12]) & ~hC_EBREAK)) & c[ 7];
   assign q2e[14] = 1'b0;
   assign q2e[13] = c[14];
   assign q2e[12] = ~c[15] & ~c[14];
   assign q2e[11] = ~(c[15]&~c[14]&rs2eq0) & c[11];
   assign q2e[10] = ~(c[15]&~c[14]&rs2eq0) & c[10];
   assign q2e[ 9] = ~(c[15]&~c[14]&rs2eq0) & c[ 9];
   assign q2e[ 8] = (~(c[15]&~c[14]&rs2eq0) & ~(c[15]&c[14])) & c[ 8];
   assign q2e[ 7] = ((~(c[15]&~c[14]&rs2eq0) & ~(c[15]&c[14])) & c[ 7]) | (c[15]&~c[14]&c[12]&~rs1eq0&rs2eq0);
   assign q2e[ 6] = c[15]&~c[14]&rs2eq0;
   assign q2e[ 5] = c[15];
   assign q2e[ 4] = (~c[15]&~c[14]) | (c[15]&~c[14]&~c[12]&~rs2eq0) | (c[15]&~c[14]&c[12]&(~rs2eq0 | hC_EBREAK));
   assign q2e[ 3] = 1'b0;
   assign q2e[ 2] = c[15]&~c[14]& ( (~c[12]&rs2eq0) | (c[12]&~rs1eq0&rs2eq0) );
   assign q2e[ 1] = 1'b1;
   assign q2e[ 0] = ~c[13];
   
   /*
    Quadrant 1. May be advantageous to factor out select signals. This is the toughest quadrant.
    
            c[11:7]==5'h2  (this is rs1eq2)
    11111   | 
    5431065 |               12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7 65432  10      
    ---|||| |               --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -----  --
    000xxxx x  C.ADDI/C.NOP i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7 00100  11  addi rd,rd,nzimm[5:0] 
    001xxxx x  C.JAL        ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | 12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  1 11011  11  jal x1, offset[11:1]       
    010xxxx x  C.LI         i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7 00100  11  addi rd,x0,imm[5:0] 
    011xxxx 0  C.LUI        ih  D4 D3 D2 D1 D0 ig if ie id ic | 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7 01101  11  lui rd,nzimm[17:12].  
    011xxxx 1  C.ADDI16SP   i9   0  0  0  1  0 i4 i6 i8 i7 i5 | 12 12 12  4  3  5  2  6  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  1  0 00100  11  addi x2,x2,nzimm[9:4] 
    10000xx x  C.SRLI        x   0  0 d2 d1 d0 z4 z3 z2 z1 z0 |  0  0  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7 00100  11  srli rd',rd',shamt[5:0]                               
    10001xx 0  C.SRAI        x   0  1 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7 00100  11  srai rd',rd',shamt[5:0]
    10010xx 0  C.ANDI       i5   1  0 d2 d1 d0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7 00100  11  andi rd',rd',imm[5:0]
    1001100 0  C.SUB         0   1  1 d2 d1 d0  0  0 t2 t1 t0 |  0  1  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  0  0  0  0  1  9  8  7 01100  11  sub rd',rd',rs2'
    1001101 0  C.XOR         0   1  1 d2 d1 d0  0  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  0  0  0  1  9  8  7 01100  11  xor rd',rd',rs2'
    1001110 0  C.OR          0   1  1 d2 d1 d0  1  0 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  0  0  1  9  8  7 01100  11  or rd',rd'rs2'
    1001111 0  C.AND         0   1  1 d2 d1 d0  1  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7 01100  11  and rd',rd',rs2'
    101xxxx x  C.J          ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | 12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  0 11011  11  jal x0, offset[11:1]
    110xxxx x  C.BEQZ       i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | 12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  0 11 10  4  3 12 11000  11  beq rs1',x0,offset[8:1]                  
    111xxxx x  C.BNEZ       i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | 12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  1 11 10  4  3 12 11000  11  bne rs1',x0,offset[8:1]                  
    
    */ 
   assign q1e[31] = (~c[15] | c[14] | c[13] | (c[11] & ~c[10])) & c[12]; 
   assign q1e[30] = (((~c[15]&~c[14]&~c[13]) | (~c[15]&c[14]) | (c[15]&~c[14]&~c[13]&c[11]&~c[10]) | (c[15]&c[14])) & c[12]) | ((~c[14]&c[13]) & c[8]) | (c[15]&~c[14]&~c[13]&~c[11]&c[10]) | (c[15]&~c[14]&~c[13]&c[11]&c[10]&~c[6]&~c[5]);
   assign q1e[29] = (((~c[15]&~c[14]&~c[13]) | (~c[15]&c[14]) | (c[15]&~c[14]&~c[13]&c[11]&~c[10]) | (c[15]&c[14])) & c[12]) | (((~c[15]&~c[14]&c[13]) | (c[15]&~c[14]&c[13])) & c[10]);
   assign q1e[28] = (((~c[15]&~c[14]&~c[13]) | (~c[15]&c[14]&~c[13]) | (~c[15]&c[14]&~rs1eq2) | (c[15]&~c[14]&~c[13]&c[11]&~c[10]) | (c[15]&c[14])) & c[12]) | ((~c[14]&c[13]) & c[9]) | (~c[15]&c[14]&c[13]&rs1eq2 & c[4]);
   assign q1e[27] = (((~c[15]&~c[14]&~c[13]) | (~c[15]&c[14]&~c[13]) | (~c[15]&c[14]&~rs1eq2) | (c[15]&~c[14]&~c[13]&c[11]&~c[10])) & c[12]) | ((c[15]&c[14] | ~c[14]&c[13]) & c[6]) | (~c[15]&c[14]&c[13]&rs1eq2 & c[3]);
   assign q1e[26] = (((~c[15]&~c[14]&~c[13]) | (~c[15]&c[14]&~c[13]) | (~c[15]&c[14]&~rs1eq2) | (c[15]&~c[14]&~c[13]&c[11]&~c[10])) & c[12]) | ((~c[14]&c[13]) & c[7]) | ((c[14]&c[13]&rs1eq2 | c[15]&c[14]) & c[5]);
   assign q1e[25] = (((~c[15]&~c[14]&~c[13]) | (~c[15]&c[14]&~c[13]) | (~c[15]&c[14]&~rs1eq2) | (c[15]&~c[14]&~c[13]&c[11]&~c[10])) & c[12]) | ((~c[14]&c[13]) & c[2]) | ((c[14]&c[13]&rs1eq2 | c[15]&c[14]) & c[2]);
   assign q1e[24] = ((~c[15]&~c[13] | ~c[15]&c[14]&c[13]&rs1eq2 | c[15]&~c[14]&~c[13]&~c[11] | c[15]&~c[14]&~c[13]&~c[10]) & c[6]) | (~c[14]&c[13] & c[11]) | (~c[15]&c[14]&c[13]&~rs1eq2 & c[12]);
   assign q1e[23] = ((~c[15]&~c[14] | ~c[15]&~c[13] | c[15]&~c[14]&~c[13]&~c[11] | c[15]&~c[14]&~c[13]&~c[10] | c[15]&~c[14]&c[13]) & c[5]) | (~c[15]&c[14]&c[13]&~rs1eq2 & c[12]) | ( (c[15]&~c[14]&~c[13]&c[11]&c[10]) & 1'b1);
   assign q1e[22] = ((~c[15]&~c[14] | ~c[15]&~c[13] | c[15]&~c[14]&~c[13]&~c[11] | c[15]&~c[14]&~c[13]&~c[10] | c[15]&~c[14]&c[13]) & c[4]) | (~c[15]&c[14]&c[13]&~rs1eq2 & c[12]) | ( (c[15]&~c[14]&~c[13]&c[11]) & c[4]);
   assign q1e[21] = ((~c[15]&~c[14] | ~c[15]&~c[13] | c[15]&~c[14]&~c[13]&~c[11] | c[15]&~c[14]&~c[13]&~c[10] | c[15]&~c[14]&c[13]) & c[3]) | (~c[15]&c[14]&c[13]&~rs1eq2 & c[12]) | ( (c[15]&~c[14]&~c[13]&c[11]) & c[3]);
   
//   assign q1e[20] = ((~c[15]&~c[13] | c[15]&~c[14]&~c[13]) & c[2]) | ((~c[15]&~c[14]&c[13] | ~c[15]&c[14]&c[13]&~rs1eq2) & c[12]);  Was barking up the wrong tree, 
   assign q1e[20] = ((~c[14]&c[13] | ~c[15]&c[14]&c[13]&~rs1eq2 ) & c[12]) | (~c[15]&~c[14]&~c[13] & c[2]) | (~c[15]&c[14]&~c[13] & c[2]) | (c[15]&~c[14]&~c[13] & c[2]);

   assign q1e[19] = ((~c[14]&c[13] | ~c[15]&c[14]&c[13]&~rs1eq2 ) & c[12]) | (~c[15]&~c[14]&~c[13] & c[11]);
   assign q1e[18] = ((~c[14]&c[13] | ~c[15]&c[14]&c[13]&~rs1eq2 ) & c[12]) | (~c[15]&~c[14]&~c[13] & c[10]) | (c[15]&~c[14]&~c[13] & 1'b1) | (c[15]&c[14] & 1'b1);
   assign q1e[17] = ((~c[14]&c[13] | ~c[15]&c[14]&c[13]&~rs1eq2 ) & c[12]) | (~c[15]&~c[14]&~c[13] & c[ 9]) | (c[15]&~c[14]&~c[13] & c[9]) | (c[15]&c[14] & c[9]);
   assign q1e[16] = (~c[14]&c[13] & c[12]) | (~c[15]&~c[14]&~c[13] & c[8]) | (c[15]&~c[14]&~c[13] & c[8]) | (c[15]&c[14] & c[8]) | (~c[15]&c[14]&c[13]&~rs1eq2 & c[6]) | (~c[15]&c[14]&c[13]&rs1eq2);
   assign q1e[15] = (~c[14]&c[13] & c[12]) | (~c[15]&~c[14]&~c[13] & c[7]) | (c[15]&~c[14]&~c[13] & c[7]) | (c[15]&c[14] & c[7]) | (~c[15]&c[14]&c[13]&~rs1eq2 & c[5]);
   assign q1e[14] = (~c[14]&c[13] & c[12]) | (~c[15]&c[14]&c[13]&~rs1eq2 & c[4]) | (c[15]&~c[14]&~c[13] & ~(c[11]&c[10]&~c[6]&~c[5]));
   assign q1e[13] = (~c[14]&c[13] & c[12]) | (~c[15]&c[14]&c[13]&~rs1eq2 & c[3]) | (c[15]&~c[14]&~c[13]&c[11]&~c[10] | c[15]&~c[14]&~c[13]&c[11]&c[10]&c[6]);
   assign q1e[12] = (~c[14]&c[13] & c[12]) | (~c[15]&c[14]&c[13]&~rs1eq2 & c[2]) | (c[15]&~c[14]&~c[13] & (~c[11] | c[11]&~c[10] | c[11]&c[10]&c[6]&c[5])) | (c[15]&c[14]&c[13]);
   assign q1e[11] = (~c[15]&~c[14]&~c[13] | ~c[15]&c[14]&~c[13] | ~c[15]&c[14]&c[13]&!rs1eq2 | c[15]&c[14]) & c[11];
   assign q1e[10] = ((~c[15]&~c[14]&~c[13] | ~c[15]&c[14]&~c[13] | ~c[15]&c[14]&c[13]&~rs1eq2 | c[15]&c[14]) & c[10]) | c[15]&~c[14]&~c[13];
   assign q1e[ 9] = ((~c[15]&~c[14]&~c[13] | ~c[15]&c[14]&~c[13] | ~c[15]&c[14]&c[13]&~rs1eq2 | c[15]&~c[14]&~c[13]) & c[9]) | (c[15]&c[14] & c[4]);
   assign q1e[ 8] = ((~c[15]&~c[14]&~c[13] | ~c[15]&c[14]&~c[13] | ~c[15]&c[14]&c[13]&~rs1eq2 | c[15]&~c[14]&~c[13]) & c[8]) | (c[15]&c[14] & c[3]) | (~c[15]&c[14]&c[13]&rs1eq2);//???
   assign q1e[ 7] = ((~c[15]&~c[14]&~c[13] | ~c[15]&c[14]&~c[13] | ~c[15]&c[14]&c[13]&~rs1eq2 | c[15]&~c[14]&~c[13]) & c[7]) | (c[15]&c[14] & c[12]) | (~c[15]&~c[14]&c[13]);
   assign q1e[ 6] = ~c[15]&~c[14]&c[13] | c[15]&c[13] | c[15]&c[14];
   assign q1e[ 5] = ~c[15]&~c[14]&c[13] | ~c[15]&c[14]&c[13]&~rs1eq2 | c[15]&~c[14]&~c[13]&c[11]&c[10] | | c[15]&c[13] | c[15]&c[14];
   assign q1e[ 4] = ~(~c[15]&~c[14]&c[13] | c[15]&c[13] | c[15]&c[14]);
   assign q1e[ 3] = ~c[14]&c[13];
   assign q1e[ 2] = ~c[14]&c[13] | ~c[15]&c[14]&c[13]&~rs1eq2;
   assign q1e[ 1] = 1'b1;
   assign q1e[ 0] = 1'b1;

   /* Multiplex result as determined by q[1:0]
    */
   assign mq0q2 = c[1] ? q2e : q0e;
   assign e = c[0] ? (c[1] ? 32'h00000000 : q1e) : mq0q2;
endmodule



         
