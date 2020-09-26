/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2020-2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * ----------------------------------------------------------------------------
  
 Midgetv ignores all hints, and reserved instructions execute something. All
 floating point instructions are illegal. 
 
 Translation from rv32c instruction to rv32i instruction. Here we name:
     rd and rs1/rd as D4 D3 D2 D1 D0
     rs1 as S4 S3 S2 S1 S0
     rs2 as T4 T3 T2 T1 T0
     rd' and rs1'/rd' as d2 d1 d0
     rs1' as s2 s1 s0
     rs2' as t2 t1 t0
 Sign-extended immediates are named as i<x>, with <x> the bit number
 Zero-extended immediates are named as z<x>
 Fixed bits is represented as 0 and 1
 
 Compressed instruction c[15:0]                       | Translated instruction e[31:0]
   111                                                |        
 10543              12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7 6543210      
 -----              --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -------
 01011 C.LUI        ih  D4 D3 D2 D1 D0 ig if ie id ic | ih ih ih ih ih ih ih ih ih ih ih ih ih ih ih ig if ie id ic D4 D3 D2 D1 D0 0110111  lui rd,nzimm[17:12].  rd!=0, rd!=2
 01011 C.ADDI16SP   i9   0  0  0  1  0 i4 i6 i8 i7 i5 | i9 i9 i9 i8 i7 i6 i5 i4  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  1  0 0010011  addi x2,x2,nzimm[9:4]
 10100 C.JR          0  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 S4 S3 S2 S1 S0  0  0  0  0  0  0  0  0 1100111  jalr x0,0(rs1)  (rs1 != 0)
 10100 C.MV          0  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0 T4 T3 T2 T1 T0  0  0  0  0  0  0  0  0 D4 D3 D2 D1 D0 0110011  add rd,rd,rs2          
 01100 C.AND         0   1  1 d2 d1 d0  1  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1 t2 t1 t0  0  1 d2 d1 d0  1  1  1  0  1 d2 d1 d0 0110011  and rd',rd',rs2'
 01100 C.OR          0   1  1 d2 d1 d0  1  0 t2 t1 t0 |  0  0  0  0  0  0  0  0  1 t2 t1 t0  0  1 d2 d1 d0  1  1  0  0  1 d2 d1 d0 0110011  or rd',rd'rs2'
 01100 C.SUB         0   1  1 d2 d1 d0  0  0 t2 t1 t0 |  0  1  0  0  0  0  0  0  1 t2 t1 t0  0  1 d2 d1 d0  0  0  0  0  1 d2 d1 d0 0110011  sub rd',rd',rs2'
 01100 C.XOR         0   1  1 d2 d1 d0  0  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1 t2 t1 t0  0  1 d2 d1 d0  1  0  0  0  1 d2 d1 d0 0110011  xor rd',rd',rs2'
 10100 C.ADD         l  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0 T4 T3 T2 T1 T0 D4 D3 D2 D1 D0  0  0  0 D4 D3 D2 D1 D0 0110011  add rd,rd,rs2
 10100 C.EBREAK      l   0  0  0  0  0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0 1110011  ebreak
 10100 C.JALR        l  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 S4 S3 S2 S1 S0  0  0  0  0  0  0  0  1 1100111  jalr x1,0(rs1)  (rs1 != 0)
 01100 reserved      1   1  1  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxx11  
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
 01100 C.ANDI       i5   1  0 d2 d1 d0 i4 i3 i2 i1 i0 | i5 i5 i5 i5 i5 i5 i5 i4 i3 i2 i1 i0  0  1 d2 d1 d0  l  l  l  0  1 d2 d1 d0 0010011  andi rd',rd',imm[5:0]
 01100 C.SRAI        x   0  1 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0 z4 z3 z2 z1 z0  0  1 d2 d1 d0  1  0  1  0  1 d2 d1 d0 0010011  srai rd',rd',shamt[5:0]
 01100 C.SRLI        x   0  0 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0 z4 z3 z2 z1 z0  0  1 d2 d1 d0  1  0  1  0  1 d2 d1 d0 0010011  srli rd',rd',shamt[5:0]

In following tables, numbers from 2 to 12 is from the compressed instruction, while 0 and 1 mean zero and one.
 
11                                                  Auxiliary mux for SRLI/SRAI/ANDI/SUB/XOR/OR/AND
1065            12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0                         
||||            --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  -  -  -  -  -  -  -                         
00xx   C.SRLI    x   0  0 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7  0  0  1  0  0  1  1  srli rd',rd',shamt[5:0]                               
01xx   C.SRAI    x   0  1 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7  0  0  1  0  0  1  1  srai rd',rd',shamt[5:0]
10xx   C.ANDI   i5   1  0 d2 d1 d0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7  0  0  1  0  0  1  1  andi rd',rd',imm[5:0]
1100   C.SUB     0   1  1 d2 d1 d0  0  0 t2 t1 t0 |  0  1  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  0  0  0  0  1  9  8  7  0  1  1  0  0  1  1  sub rd',rd',rs2'
1101   C.XOR     0   1  1 d2 d1 d0  0  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  0  0  0  1  9  8  7  0  1  1  0  0  1  1  xor rd',rd',rs2'
1110   C.OR      0   1  1 d2 d1 d0  1  0 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  0  0  1  9  8  7  0  1  1  0  0  1  1  or rd',rd'rs2'
1111   C.AND     0   1  1 d2 d1 d0  1  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7  0  1  1  0  0  1  1  and rd',rd',rs2'
11xx   reserved  1   1  1  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  No decode on c[12], folds 
                                                    36 37 36 36 36 36 36 38 39  4  3  2  0  1  9  8  7 40 41 42  0  1  9  8  7  0 43  1  0  0  1  1           into cases above
c[11:7]==5'h2 (rs1eq2)                                                                                                                                                     
|                                                   Auxiliary mux for LUO/ADDI16SP
|               12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0                         
|               --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  -  -  -  -  -  -  -                         
0  C.LUI        ih  D4 D3 D2 D1 D0 ig if ie id ic | 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7  0  1  1  0  1  1  1  lui rd,nzimm[17:12].    
1  C.ADDI16SP   i9   0  0  0  1  0 i4 i6 i8 i7 i5 | 12 12 12  4  3  5  2  6  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  1  0  0  0  1  0  0  1  1  addi x2,x2,nzimm[9:4] 
                                                    12 12 12 20 21 22 23 24 25 25 25 25 25 25 25 26 27 28 29 30 31 32 33 34 35  0 17  1  0 17  1  1
  c[11:7]==5'h0 (rs1eq0)                                                                                                                            
1|c[6:2]==5'h0 (rs2eq0)                             Auxiliary mux for MV/JR/JALR/EBREAK/AND
2||             12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0        
|||             --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  -  -  -  -  -  -  -  
0x0  C.MV        0  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7  0  1  1  0  0  1  1  add rd,rd,rs2          
0x1  C.JR        0  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  0  1  1  0  0  1  1  1  jalr x0,0(rs1)                  
101  C.JALR      l  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  1  1  1  0  0  1  1  1  jalr x1,0(rs1)                  
111  C.EBREAK    l   0  0  0  0  0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0  1  1  1  0  0  1  1  ebreak
1x0  C.ADD       l  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7  0  1  1  0  0  1  1  add rd,rd,rs2                   
                                                     0  0  0  0  0  0  0 44 45 46 47 48 49 50 51 52 53  0  0  0 54 55 56 57 58 59  1 16  0 19  1  1
12
|rs1eq0                                                                                                                                                        
||rs2eq0
|||                                                  Auxiliary mux for ADDI4SPN/ILLEGAL
1xx C.ADDI4SPN  z5  z4 z9 z8 z7 z6 z2 z3 d2 d1 d0 |  0  0 10  9  8  7 12 11  5  6  0  0  0  0  0  1  0  0  0  0  0  1  4  3  2  0  0  1  0  0  1  1  addi rd',x2,mzuimm[9:2]   
00x C.ADDI4SPN  z5  z4 z9 z8 z7 z6 z2 z3 d2 d1 d0 |  0  0 10  9  8  7 12 11  5  6  0  0  0  0  0  1  0  0  0  0  0  1  4  3  2  0  0  1  0  0  1  1  addi rd',x2,mzuimm[9:2]   
010 C.ADDI4SPN  z5  z4 z9 z8 z7 z6 z2 z3 d2 d1 d0 |  0  0 10  9  8  7 12 11  5  6  0  0  0  0  0  1  0  0  0  0  0  1  4  3  2  0  0  1  0  0  1  1  addi rd',x2,mzuimm[9:2]   
011 ILLEGAL                                       |  0  0 10  9  8  7 12 11  5  6  0  0  0  0  0  1  0  0  0  0  0  1  4  3  2  0  0  1  0  0  1  0  defined illegal 
                                                     0  0 10  9  8  7 12 11  5  6  0  0  0  0  0  1  0  0  0  0  0  1  4  3  2  0  0  1  0  0  1 18  
                                                           
  111                                                     Main translation table
10543                 12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0      
-----                 --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  -  -  -  -  -  -  -
00000  ILLEGAL/ADDI4SPN                                 |  0  0 10  9  8  7 12 11  5  6  0  0  0  0  0  1  0  0  0  0  0  1  4  3  2  0  0  1  0  0  1 18  
00001  C.FLD           x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  0  illegal in midgetv
00010  C.LW           z5  z4 z3 s2 s1 s0 z2 z6 d2 d1 d0 |  0  0  0  0  0  5 12 11 10  6  0  0  0  1  9  8  7  0  1  0  0  1  4  3  2  0  0  0  0  0  1  1  lw rd',offset[6:2](rs1')
00011  C.FLW           x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  0  illegal in midgetv
00100  reserved        x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  don't care in midgetv
00101  C.FSD           x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  0  illegal in midgetv
00110  C.SW           z5  z4 z3 s2 s1 s0 z2 z6 t2 t1 t0 |  0  0  0  0  0  5 12  0  1  4  3  2  0  1  9  8  7  0  1  0 11 10  6  0  0  0  1  0  0  0  1  1  sw rs2',offset[6:2](rs1') 
00111  C.FSW           x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  0  illegal in midgetv
01000  C.ADDI/C.NOP   i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7  0  0  1  0  0  1  1  addi rd,rd,nzimm[5:0] 
01001  C.JAL          ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | 12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  1  1  1  0  1  1  1  1  jal x1, offset[11:1]       
01010  C.LI           i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  1  0  0  1  1  addi rd,x0,imm[5:0] 
01011  LUI/ADDI16SP                                     | 12 12 12 20 21 22 23 24 25 25 25 25 25 25 25 26 27 28 29 30 31 32 33 34 35  0 17  1  0 17  1  1
01100  SRLI/SRAI/ANDI/SUB/XOR/OR/AND                    | 36 37 36 36 36 36 36 38 39  4  3  2  0  1  9  8  7 40 41 42  0  1  9  8  7  0 43  1  0  0  1  1
01101  C.J            ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | 12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  0  1  1  0  1  1  1  1  jal x0, offset[11:1]
01110  C.BEQZ         i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | 12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  0 11 10  4  3 12  1  1  0  0  0  1  1  beq rs1',x0,offset[8:1]                  
01111  C.BNEZ         i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | 12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  1 11 10  4  3 12  1  1  0  0  0  1  1  bne rs1',x0,offset[8:1]                  
10000  C.SLLI          x  D4 D3 D2 D1 D0 z4 z3 z2 z1 z0 |  0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  1 11 10  9  8  7  0  0  1  0  0  1  1  slli rd,rd,shamt[5:0] 
10001  C.FLDSP         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  0  illegal in midgetv
10010  C.LWSP         z5  D4 D3 D2 D1 D0 z4 z3 z2 z7 z6 |  0  0  0  0  3  2 12  6  5  4  0  0  0  0  0  1  0  0  1  0 11 10  9  8  7  0  0  0  0  0  1  1  lw rd,offset[7:2](x2) 
10011  C.FLWSP         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  0  illegal in midgetv
10100  MV/JR/JALR/EBREAK/ADD                            |  0  0  0  0  0  0  0 44 45 46 47 48 49 50 51 52 53  0  0  0 54 55 56 57 58 59  1 16  0 19  1  1
10101  C.FSDSP         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  0  illegal
10110  C.SWSP         z5  z4 z3 z2 z7 z6 T4 T3 T2 T1 T0 |  0  0  0  0  8  7 12  6  5  4  3  2  0  0  0  1  0  0  1  0 11 10  9  0  0  0  1  0  0  0  1  1  sw rs2,offset[7:2](x2)
10111  C.FSWSP         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  0  illegal

 Synplify    : 238 luts
 Lattice LSE : 258 luts
 
*/

/*
 
 Situations:
 pc1 luh
 0    0    Di[31:0] is word aligned. If Di[1:0] != 3, Dii[31:0] is the instruction expanded from Di[15:0].
           If Di[1:0] == 3, Dii[31:0] is  Di[31:0], the incoming normal 32-bit instruction.
           is_valid_instrhigh = 1, is_valid_instrlow = 1
 1    0    Di[31:0] is not word aligned. If Di[17:16] != 3, Dii[31:0] is the instruction expanded from Di[31:16]
           is_valid_instrhigh = 1, is_valid_instrlow = 1
           If Di[17:16] == 3, Dii[15:0] is Di[31:16], the lower hword of the normal 32-bit instruction. Dii[31:16] 
           is not valid.
           is_valid_instrhigh = 0, is_valid_instrlow = 1
 x    1    Di[31:0] is not word aligned and we are to get the upper hword of the normal 32-bit instruction. 
           Here Dii[15:0] is not valid. Dii[31:16] is Di[15:0], the upper howrd of the normal 32-bit instruction.
           is_valid_instrhigh = 1, is_valid_instrlow = 0
 */
module m_RVC # ( parameter RVC = 1) 
   (
    input [31:0]      Di, //  Possibly compressed instruction
    /* verilator lint_off UNUSED */
    input             pc1, // Bit 1 of pc for alignment
    input             luh, // Load upper halfword
    input             sa12, // Anticipating size optimalisation, we bring in this signal that is an overall "is_valid_instr" signal
    /* verilator lint_on UNUSED */
    output reg [31:0] Dii, //  Expanded result
    output reg        is_valid_instrlow,
    output reg        is_valid_instrhigh
    );
   
   generate
      if ( RVC == 0 ) begin
         always @(/*AS*/Di or sa12) begin
            Dii = Di;
            is_valid_instrlow  = sa12;
            is_valid_instrhigh = sa12;
         end
      end else begin
         /*verilator lint_off UNUSED */
         reg [59:0]  cc;
         /*verilator lint_on UNUSED */
         wire [15:0] c   = (pc1 ? Di[31:16] :  Di[15:0]) | {14'h0000,luh,luh};
         wire [15:0] uhw = (pc1 | luh) ? Di[15:0]  : Di[31:16];
//         wire [15:0] uhw = (luh) ? Di[15:0]  : Di[31:16]; Probably all we need

         always @(/*AS*/Di or luh or pc1 or sa12) begin
            is_valid_instrlow  = sa12 & ~luh;
            is_valid_instrhigh = sa12 & (luh | ~pc1 | (Di[17:16] != 2'b11));
         end
         
         wire [4:0]  inx = {c[1:0],c[15:13]};
         wire        rs1eq2 = c[11:7] == 5'b00010;
         wire        rs1eq0 = c[11:7] == 5'b00000;
         wire        rs2eq0 = c[6:2]  == 5'b00000;
         wire [2:0]  jnx = {c[12],rs1eq0,rs2eq0};
         
         always @(/*AS*/c or jnx or rs1eq0 or rs1eq2 or rs2eq0) begin
            cc[15:0] = c[15:0];
            
            // Helping SRLI/SRAI/ANDI/SUB/XOR/OR/AND
            cc[36] = c[11:10] == 2'b10 ? c[12] : 0;
            cc[37] = c[11:10] == 2'b10 ? c[12] : ((c[11:10] == 2'b01) || ( {c[11:10],c[6:5]} == 4'b1100 )) ? 1 : 0;
            cc[38] = c[11:10] != 2'b11 ? c[6] : 0;
            cc[39] = c[11:10] != 2'b11 ? c[5] : 1;
            cc[40] = c[11:10] != 2'b11 ? 1 : c[6:5] != 2'b00 ? 1 : 0;
            cc[41] = c[11:10] == 2'b10 ? 1 : {c[11:10],c[6]} == 3'b111 ? 1 : 0;   
            cc[42] = c[11:10] != 2'b11 ? 1 : c[6:5] == 2'b11 ? 1 : 0;
            cc[43] = c[11:10] == 2'b11 ? 1 : 0;
            
            // Helping LUI/ADDI16SP
            cc[20] = rs1eq2 ? c[4] : c[12];
            cc[21] = rs1eq2 ? c[3] : c[12];
            cc[22] = rs1eq2 ? c[5] : c[12];
            cc[23] = rs1eq2 ? c[2] : c[12];
            cc[24] = rs1eq2 ? c[6] : c[12];
            cc[25] = rs1eq2 ? 0    : c[12];
            cc[26] = rs1eq2 ? 1    : c[6];
            cc[27] = rs1eq2 ? 0    : c[5];
            cc[28] = rs1eq2 ? 0    : c[4];
            cc[29] = rs1eq2 ? 0    : c[3];
            cc[30] = rs1eq2 ? 0    : c[2];
            cc[31] = rs1eq2 ? 0    : c[11];
            cc[32] = rs1eq2 ? 0    : c[10];
            cc[33] = rs1eq2 ? 0    : c[9];
            cc[34] = rs1eq2 ? 1    : c[8];
            cc[35] = rs1eq2 ? 0    : c[7];
            cc[17] = rs1eq2 ? 0    : 1;
            
            // Helping MV/JR/JALR/EBREAK/AND
            cc[44] = (jnx == 0 || jnx == 2 || jnx == 4 || jnx == 6 ) ? c[6] : 0;
            cc[45] = (jnx == 0 || jnx == 2 || jnx == 4 || jnx == 6 ) ? c[5] : 0;
            cc[46] = (jnx == 0 || jnx == 2 || jnx == 4 || jnx == 6 ) ? c[4] : 0;
            cc[47] = (jnx == 0 || jnx == 2 || jnx == 4 || jnx == 6 ) ? c[3] : 0;
            cc[48] = (jnx == 0 || jnx == 2 || jnx == 4 || jnx == 6 ) ? c[2] : (jnx == 7 ) ? 1 : 0;
            cc[49] = (jnx == 1 || jnx == 3 || jnx == 5 || jnx == 4 || jnx == 6 ) ? c[11] : 0;
            cc[50] = (jnx == 1 || jnx == 3 || jnx == 5 || jnx == 4 || jnx == 6 ) ? c[10] : 0;
            cc[51] = (jnx == 1 || jnx == 3 || jnx == 5 || jnx == 4 || jnx == 6 ) ? c[9] : 0;
            cc[52] = (jnx == 1 || jnx == 3 || jnx == 5 || jnx == 4 || jnx == 6 ) ? c[8] : 0;
            cc[53] = (jnx == 1 || jnx == 3 || jnx == 5 || jnx == 4 || jnx == 6 ) ? c[7] : 0;
            cc[54] = jnx[0] == 0 ? c[11] : 0;
            cc[55] = jnx[0] == 0 ? c[10] : 0;
            cc[56] = jnx[0] == 0 ? c[9] : 0;
            cc[57] = jnx[0] == 0 ? c[8] : 0;
            cc[58] = jnx[0] == 0 ? c[7] : jnx == 3'b101 ? 1 : 0;
            cc[59] = jnx[0];
            cc[16] = (jnx[0] == 0 || jnx == 3'b111) ? 1 : 0;
            cc[19] = (jnx == 1 || jnx == 3 || jnx == 5 ) ? 1 : 0;
            
            // Helping ADDI4SPN/ILLEGAL
            cc[18] = c[12] == 0 && rs1eq0 == 1 & rs2eq0 == 1 ? 0 : 1;
         end
         
         
         always @(*) begin // 31     30    29      28   27     26     25     24     23     22     21     20     19     18     17     16     15     14     13     12     11     10      9      8      7      6      5      4      3     2     1    0       
            case (inx) //     --     --    --      --   --     --     --     --     --     --     --     --     --     --     --     --     --     --     --     --     --     --     --     --     --     --     --     --     --    --    --   --       
              5'h00  : Dii={ 1'b0  ,1'b0  ,cc[10],cc[9] ,cc[8] ,cc[7] ,cc[12],cc[11],cc[5] ,cc[6] ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b1  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b1  ,cc[4] ,cc[3] ,cc[2] ,1'b0  ,1'b0  ,1'b1  ,1'b0,1'b0  ,1'b1,cc[18]};   
              5'h01  : Dii={ 1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx,1'bx  ,1'bx,1'b0  };
              5'h02  : Dii={ 1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,cc[5] ,cc[12],cc[11],cc[10],cc[6] ,1'b0  ,1'b0  ,1'b0  ,1'b1  ,cc[9] ,cc[8] ,cc[7] ,1'b0  ,1'b1  ,1'b0  ,1'b0  ,1'b1  ,cc[4] ,cc[3] ,cc[2] ,1'b0  ,1'b0  ,1'b0  ,1'b0,1'b0  ,1'b1,1'b1  };
              5'h03  : Dii={ 1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx,1'bx  ,1'bx,1'b0  };
              5'h04  : Dii={ 1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx,1'bx  ,1'bx,1'bx  };
              5'h05  : Dii={ 1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx,1'bx  ,1'bx,1'b0  };
              5'h06  : Dii={ 1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,cc[5] ,cc[12],1'b0  ,1'b1  ,cc[4] ,cc[3] ,cc[2] ,1'b0  ,1'b1  ,cc[9] ,cc[8] ,cc[7] ,1'b0  ,1'b1  ,1'b0  ,cc[11],cc[10],cc[6] ,1'b0  ,1'b0  ,1'b0  ,1'b1  ,1'b0  ,1'b0,1'b0  ,1'b1,1'b1  };
              5'h07  : Dii={ 1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx,1'bx  ,1'bx,1'b0  };
              5'h08  : Dii={ cc[12],cc[12],cc[12],cc[12],cc[12],cc[12],cc[12],cc[6] ,cc[5] ,cc[4] ,cc[3] ,cc[2] ,cc[11],cc[10],cc[9] ,cc[8] ,cc[7] ,1'b0  ,1'b0  ,1'b0  ,cc[11],cc[10],cc[9] ,cc[8] ,cc[7] ,1'b0  ,1'b0  ,1'b1  ,1'b0,1'b0  ,1'b1,1'b1  };
              5'h09  : Dii={ cc[12],cc[8] ,cc[10],cc[9] ,cc[6] ,cc[7] ,cc[2] ,cc[11],cc[5] ,cc[4] ,cc[3] ,cc[12],cc[12],cc[12],cc[12],cc[12],cc[12],cc[12],cc[12],cc[12],1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b1  ,1'b1  ,1'b1  ,1'b0  ,1'b1,1'b1  ,1'b1,1'b1  };
              5'h0a  : Dii={ cc[12],cc[12],cc[12],cc[12],cc[12],cc[12],cc[12],cc[6] ,cc[5] ,cc[4] ,cc[3] ,cc[2] ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,cc[11],cc[10],cc[9] ,cc[8] ,cc[7] ,1'b0  ,1'b0  ,1'b1  ,1'b0,1'b0  ,1'b1,1'b1  };
              5'h0b  : Dii={ cc[12],cc[12],cc[12],cc[20],cc[21],cc[22],cc[23],cc[24],cc[25],cc[25],cc[25],cc[25],cc[25],cc[25],cc[25],cc[26],cc[27],cc[28],cc[29],cc[30],cc[31],cc[32],cc[33],cc[34],cc[35],1'b0  ,cc[17],1'b1  ,1'b0,cc[17],1'b1,1'b1  };
              5'h0c  : Dii={ cc[36],cc[37],cc[36],cc[36],cc[36],cc[36],cc[36],cc[38],cc[39],cc[4] ,cc[3] ,cc[2] ,1'b0  ,1'b1  ,cc[9] ,cc[8] ,cc[7] ,cc[40],cc[41],cc[42],1'b0  ,1'b1  ,cc[9] ,cc[8] ,cc[7] ,1'b0  ,cc[43],1'b1  ,1'b0,1'b0  ,1'b1,1'b1  };
              5'h0d  : Dii={ cc[12],cc[8] ,cc[10],cc[9] ,cc[6] ,cc[7] ,cc[2] ,cc[11],cc[5] ,cc[4] ,cc[3] ,cc[12],cc[12],cc[12],cc[12],cc[12],cc[12],cc[12],cc[12],cc[12],1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b1  ,1'b1  ,1'b0  ,1'b1,1'b1  ,1'b1,1'b1  };
              5'h0e  : Dii={ cc[12],cc[12],cc[12],cc[12],cc[6] ,cc[5] ,cc[2] ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b1  ,cc[9] ,cc[8] ,cc[7] ,1'b0  ,1'b0  ,1'b0  ,cc[11],cc[10],cc[4] ,cc[3] ,cc[12],1'b1  ,1'b1  ,1'b0  ,1'b0,1'b0  ,1'b1,1'b1  };
              5'h0f  : Dii={ cc[12],cc[12],cc[12],cc[12],cc[6] ,cc[5] ,cc[2] ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b1  ,cc[9] ,cc[8] ,cc[7] ,1'b0  ,1'b0  ,1'b1  ,cc[11],cc[10],cc[4] ,cc[3] ,cc[12],1'b1  ,1'b1  ,1'b0  ,1'b0,1'b0  ,1'b1,1'b1  };
              5'h10  : Dii={ 1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,cc[6] ,cc[5] ,cc[4] ,cc[3] ,cc[2] ,cc[11],cc[10],cc[9] ,cc[8] ,cc[7] ,1'b0  ,1'b0  ,1'b1  ,cc[11],cc[10],cc[9] ,cc[8] ,cc[7] ,1'b0  ,1'b0  ,1'b1  ,1'b0,1'b0  ,1'b1,1'b1  };
              5'h11  : Dii={ 1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx,1'bx  ,1'bx,1'b0  };
              5'h12  : Dii={ 1'b0  ,1'b0  ,1'b0  ,1'b0  ,cc[3] ,cc[2] ,cc[12],cc[6] ,cc[5] ,cc[4] ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b1  ,1'b0  ,1'b0  ,1'b1  ,1'b0  ,cc[11],cc[10],cc[9] ,cc[8] ,cc[7] ,1'b0  ,1'b0  ,1'b0  ,1'b0,1'b0  ,1'b1,1'b1  };
              5'h13  : Dii={ 1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx,1'bx  ,1'bx,1'b0  };
              5'h14  : Dii={ 1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  ,cc[44],cc[45],cc[46],cc[47],cc[48],cc[49],cc[50],cc[51],cc[52],cc[53],1'b0  ,1'b0  ,1'b0  ,cc[54],cc[55],cc[56],cc[57],cc[58],cc[59],1'b1  ,cc[16],1'b0,cc[19],1'b1,1'b1  };
              5'h15  : Dii={ 1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx,1'bx  ,1'bx,1'b0  };
              5'h16  : Dii={ 1'b0  ,1'b0  ,1'b0  ,1'b0  ,cc[8] ,cc[7] ,cc[12],cc[6] ,cc[5] ,cc[4] ,cc[3] ,cc[2] ,1'b0  ,1'b0  ,1'b0  ,1'b1  ,1'b0  ,1'b0  ,1'b1  ,1'b0  ,cc[11],cc[10],cc[9] ,1'b0  ,1'b0  ,1'b0  ,1'b1  ,1'b0  ,1'b0,1'b0  ,1'b1,1'b1  };
              5'h17  : Dii={ 1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx,1'bx  ,1'bx,1'b0  };
              default: Dii={ uhw, c[15:2], 2'b11}; // Uncompressed
            endcase
         end
      end
   endgenerate
endmodule

