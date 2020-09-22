
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
   /* verilator lint_off UNUSED */
   input [15:0]  c, //   Compressed instruction
   /* verilator lint_on UNUSED */
   output [31:0] e //   Expanded result
   );
/* verilator lint_off UNUSED */

   wire          rs1eq2;
   wire          rs1eq0,rs2eq0,c15_23eq0;
   assign rs1eq0 = c[11:7] == 5'b00000;
   assign rs1eq2 = c[11:7] == 5'b00010;
   assign rs2eq0 = c[6:2] == 5'b00000;
   assign c15_23eq0 = c[15:12] == 4'b0000;
   wire          quadrant0 = ~c[1] & ~c[0];
   wire          quadrant1 = ~c[1] & ~c[0];
   wire          quadrant2 =  c[1] & ~c[0];

   /* 
    Quadrant 0.
    
    The defined illegal instruction falls into this quadrant. I do not expand 16'h0000 to 32'h00000000, there is no need,
    it is enough to ensure e[1] == 1'b0  or e[0] == 1'b0. Then execution of the expanded instruction will trigger an illegal instruction fault.
    For the record, this instruction will be 32'h00010411

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
*/
   wire          pot_ADDI4SPN = ~c[14];
   wire          pot_LW = ~c[15] & c[14];
   wire          pot_SW =  c[15];
   /*
    Quadrant 1.
    
            c[11:7]==5'h2  (this is rs1eq2)
    11111   | 
    5431065 |               12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7 65432  10      
    ---|||| |               --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -----  --
   _000xxxx x  C.ADDI/C.NOP i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7 00100  11  addi rd,rd,nzimm[5:0] 
   _001xxxx x  C.JAL        ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | 12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  1 11011  11  jal x1, offset[11:1]       
   _010xxxx x  C.LI         i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7 00100  11  addi rd,x0,imm[5:0] 
   _011xxxx 0  C.LUI        ih  D4 D3 D2 D1 D0 ig if ie id ic | 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7 01101  11  lui rd,nzimm[17:12].  
   _011xxxx 1  C.ADDI16SP   i9   0  0  0  1  0 i4 i6 i8 i7 i5 | 12 12 12  4  3  5  2  6  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  1  0 00100  11  addi x2,x2,nzimm[9:4] 
   _10000xx x  C.SRLI        x   0  0 d2 d1 d0 z4 z3 z2 z1 z0 |  0  0  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7 00100  11  srli rd',rd',shamt[5:0]                               
   _10001xx 0  C.SRAI        x   0  1 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7 00100  11  srai rd',rd',shamt[5:0]
   _10010xx 0  C.ANDI       i5   1  0 d2 d1 d0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7 00100  11  andi rd',rd',imm[5:0]
   _1001100 0  C.SUB         0   1  1 d2 d1 d0  0  0 t2 t1 t0 |  0  1  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  0  0  0  0  1  9  8  7 01100  11  sub rd',rd',rs2'
   _1001101 0  C.XOR         0   1  1 d2 d1 d0  0  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  0  0  0  1  9  8  7 01100  11  xor rd',rd',rs2'
   _1001110 0  C.OR          0   1  1 d2 d1 d0  1  0 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  0  0  1  9  8  7 01100  11  or rd',rd'rs2'
   _1001111 0  C.AND         0   1  1 d2 d1 d0  1  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7 01100  11  and rd',rd',rs2'
   _101xxxx x  C.J          ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | 12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  0 11011  11  jal x0, offset[11:1]
   _110xxxx x  C.BEQZ       i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | 12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  0 11 10  4  3 12 11000  11  beq rs1',x0,offset[8:1]                  
   _111xxxx x  C.BNEZ       i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | 12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  1 11 10  4  3 12 11000  11  bne rs1',x0,offset[8:1]                  
    */
   wire          pot_ADDI     = ~c[15] & ~c[14] & ~c[13];
   wire          pot_JAL      = ~c[15] & ~c[14] & c[13];
   wire          pot_LI       = ~c[15] & c[14] & ~c[13];
   wire          pot_LUI      = ~c[15] & c[14] &  c[13] & ~rs1eq2;
   wire          pot_ADDI16SP = ~c[15] & c[14] &  c[13] & rs1eq2;
   wire          h_SRLI_SRAI_ANDI_SUB_XOR_OR_AND = c[15] & ~c[14] & ~c[13];
   wire          pot_SRLI = h_SRLI_SRAI_ANDI_SUB_XOR_OR_AND & ~c[11] & ~c[10];
   wire          pot_SRAI = h_SRLI_SRAI_ANDI_SUB_XOR_OR_AND & ~c[11] &  c[10];
   wire          pot_ANDI = h_SRLI_SRAI_ANDI_SUB_XOR_OR_AND &  c[11] & ~c[10];
   wire          h_SUB_XOR_OR_AND = h_SRLI_SRAI_ANDI_SUB_XOR_OR_AND & c[11] & c[10];
   wire          pot_SUB  = h_SUB_XOR_OR_AND & ~c[6] & ~c[5];
   wire          pot_XOR  = h_SUB_XOR_OR_AND & ~c[6] &  c[5];
   wire          pot_OR   = h_SUB_XOR_OR_AND &  c[6] & ~c[5];
   wire          pot_AND  = h_SUB_XOR_OR_AND &  c[6] &  c[5];
   wire          pot_J    = c[15] & ~c[14] &  c[13];
   wire          pot_BEQZ = c[15] &  c[14] & ~c[13];
   wire          pot_BNEZ = c[15] &  c[14] &  c[13];
   wire          pot_B = c[15] &  c[14];
   /*
    Quadrant 2.
    
        c[11:7]==5'h0 rs1eq0
    1111|c[6:2]==5'h0 rs2eq0
    5432||               12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7 6543210      
    ---|||               --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -------
    000xxx  C.SLLI        x  D4 D3 D2 D1 D0 z4 z3 z2 z1 z0 |  0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  1 11 10  9  8  7 0010011  slli rd,rd,shamt[5:0] 
    001xxx  C.FLDSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    010xxx  C.LWSP       z5  D4 D3 D2 D1 D0 z4 z3 z2 z7 z6 |  0  0  0  0  3  2 12  6  5  4  0  0  0  0  0  1  0  0  1  0 11 10  9  8  7 0000011  lw rd,offset[7:2](x2) 
    011xxx  C.FLWSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
    1000x0  C.MV          0  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7 0110011  add rd,rd,rs2          
    1000x1  C.JR          0  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  0 1100111  jalr x0,0(rs1)                  
    100101  C.JALR        l  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  1 1100111  jalr x1,0(rs1)                  
    100111  C.EBREAK      l   0  0  0  0  0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0 1110011  ebreak
    1001x0  C.ADD         l  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7 0110011  add rd,rd,rs2                   
    101xxx  C.FSDSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
    110xxx  C.SWSP       z5  z4 z3 z2 z7 z6 T4 T3 T2 T1 T0 |  0  0  0  0  8  7 12  6  5  4  3  2  0  0  0  1  0  0  1  0 11 10  9  0  0 0100011  sw rs2,offset[7:2](x2)
    111xxx  C.FSWSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal    
    */
   wire          pot_SLLI = ~c[15] & ~c[14];
   wire          pot_LWSP = ~c[15] &  c[14];
   wire          h_MV_JR_JALR_EBREAK_ADD = c[15] & ~c[14] & ~c[13];
   wire          pot_MV = h_MV_JR_JALR_EBREAK_ADD & ~c[12] & ~rs2eq0;
   wire          pot_JR = h_MV_JR_JALR_EBREAK_ADD & ~c[12] &  rs2eq0;
   wire          pot_JALR   = h_MV_JR_JALR_EBREAK_ADD & c[12] &  ~rs1eq0 &  rs2eq0;
   wire          pot_EBREAK = h_MV_JR_JALR_EBREAK_ADD & c[12] &   rs1eq0 &  rs2eq0;
   wire          pot_ADD    = h_MV_JR_JALR_EBREAK_ADD & c[12] &            ~rs2eq0;
   wire          pot_SWSP = c[15] & c[14];
   
   localparam HIGHLEVEL = 1;
   generate
      if ( HIGHLEVEL ) begin
         wire pot_ADDI_LI_LUI_ANDI = pot_ADDI | pot_LI | pot_LUI | pot_ANDI;
         wire pot_JAL_ADDI16SP_BEQZ_BNEZ = pot_JAL | pot_ADDI16SP | pot_B;
         wire e31_c12 = (pot_ADDI_LI_LUI_ANDI | pot_JAL_ADDI16SP_BEQZ_BNEZ | pot_J ) & c[12];
         assign e[31] = c[0] & e31_c12;

         wire e30_e29_c12 = (pot_ADDI_LI_LUI_ANDI | pot_ADDI16SP | pot_B) & c[12];
         wire e30_c8  = (pot_JAL | pot_J) & c[8];
         wire e30_1   = (pot_SRAI | pot_SUB);
         assign e[30] = c[0] & (e30_e29_c12 | e30_c8 | e30_1);

         wire e29_c10 = (pot_JAL | pot_J) & c[10];  //same LUT
         wire he29 = e30_e29_c12 | e29_c10;         //same LUT 
         assign e[29] =  (quadrant0 & pot_ADDI4SPN & c[10] ) | (c[0] & he29);

         wire e28_c12 = (pot_ADDI_LI_LUI_ANDI | pot_B) & c[12];
         wire e28_c9  = (pot_JAL | pot_J) & c[9];
         wire e28_c4  = pot_ADDI16SP & c[4];   // Same LUT
         wire he28 = e28_c4 | e28_c9 | e28_c12;// Same LUT
         assign e[28] = (quadrant0 & pot_ADDI4SPN & c[9] ) | (c[0] & he28);

         wire e27_c6  = (pot_JAL | pot_J | pot_B) & c[6];
         wire e27e26e25_c12 = pot_ADDI_LI_LUI_ANDI & c[12];  
         wire e27_c3  = pot_ADDI16SP & c[3];           
         wire he27 = (e27e26e25_c12 | e27_c3 | e27_c6) & c[0];                 
         wire he27_q0 = quadrant0 & (pot_ADDI4SPN & c[8]);
         wire he27_q2 = (pot_LWSP & c[3]) | (pot_SWSP & c[8]);
         assign e[27] = he27_q0 | (he27_q2 & quadrant2) | he27;

         wire e26_c7 = (pot_JAL | pot_J) & c[7];
         wire e26_c5 = (pot_ADDI16SP | pot_B) & c[5];
         wire e26_q1 = c[0] & (e27e26e25_c12 | e26_c7 | e26_c5);
         wire e26_q0h= ((pot_LW | pot_SW) & c[5]);
         wire e26_q0 = quadrant0 & (e26_q0h | (pot_ADDI4SPN & c[7]));
         wire e26_q2 = (pot_LWSP & c[2]) | (pot_SWSP & c[7]);
         assign e[26] = e26_q0 | e26_q1 | (quadrant2 & e26_q2);

         
//   assign q0e[25] = c[12];
//   assign q1e[25] = (((~c[15]&~c[14]&~c[13]) | (~c[15]&c[14]&~c[13]) | (~c[15]&c[14]&~rs1eq2) | (c[15]&~c[14]&~c[13]&c[11]&~c[10])) & c[12]) | ((~c[14]&c[13]) & c[2]) | ((c[14]&c[13]&rs1eq2 | c[15]&c[14]) & c[2]);
//   assign q2e[25] = c[14]&c[12];
         wire e25_pot_q1h = (pot_JAL | pot_ADDI16SP | pot_J | pot_B);        
         wire e25_q1 = (e27e26e25_c12 | (e25_pot_q1h & c[2])) & c[0];
         wire e25_q2 = (pot_LWSP | pot_SWSP) & c[12] & quadrant2;
         assign e[25] = (c[12] & quadrant0) | e25_q1 | e25_q2;
         
      end else begin

         wire e31h;
         bn_l4v #(.I(16'h000b))  l_e31h(.o(e31h), .i({c[14],c[13],c[11],c[6]}));  // e31h = c[14]&c[13]&(~c[11] | c[6]);
         bn_l4v #(.I(16'h7000))  l_e31(.o(e[31]), .i({c[0],c[12],c[15],e31h }));  // e31  = c[0]&c[12]&~(c[15]&e31h);

      end
   endgenerate
           
   parameter UUU= 24;
   wire [UUU:0]   q0e;
   wire [UUU:0]   q1e;
   wire [UUU:0]   q2e;

   assign q0e[UUU:0] = 0;
   assign q1e[UUU:0] = 0;
   assign q2e[UUU:0] = 0;

   
//   assign q0e[24] = ~c[15]&c[11];
//   assign q0e[23] = (~c[14]&c[5]) | (c[14]&c[10]) | c[15];
//   assign q0e[22] = (~c[15]&c[6]) | (c[15]&c[4]);
//   assign q0e[21] = c[15]&c[3];
//   assign q0e[20] = c[15]&c[2];
//   assign q0e[19] = 1'b0;
//   assign q0e[18] = c[15]|c[14];
//   assign q0e[17] = (c[15]|c[14])&c[9];
//   assign q0e[16] = ((c[15]|c[14])&c[8]) | (~c[15]&~c[14]);
//   assign q0e[15] = (c[15]|c[14])&c[7];
//   assign q0e[14] = 1'b0;
//   assign q0e[13] = c[15]|c[14];
//   assign q0e[12] = 1'b0;
//   assign q0e[11] = c[15]&c[11];
//   assign q0e[10] = (c[15]&c[10]) | ~c[15];
//   assign q0e[ 9] = (~c[15]&c[4]) | (c[15]&c[6]);
//   assign q0e[ 8] = ~c[15]&c[3];
//   assign q0e[ 7] = ~c[15]&c[2];
//   assign q0e[ 6] = 1'b0;
//   assign q0e[ 5] = c[15];
//   assign q0e[ 4] = ~c[14];
//   assign q0e[ 3] = 1'b0;
//   assign q0e[ 2] = 1'b0;
//   assign q0e[ 1] = ~rs1eq0 | ~rs2eq0 | ~c15_23eq0; // To trigger illegal instr
//   assign q0e[ 0] = ~c[13];
//
//   
//
//   assign q1e[24] = ((~c[15]&~c[13] | ~c[15]&c[14]&c[13]&rs1eq2 | c[15]&~c[14]&~c[13]&~c[11] | c[15]&~c[14]&~c[13]&~c[10]) & c[6]) | (~c[14]&c[13] & c[11]) | (~c[15]&c[14]&c[13]&~rs1eq2 & c[12]);
//   assign q1e[23] = ((~c[15]&~c[14] | ~c[15]&~c[13] | c[15]&~c[14]&~c[13]&~c[11] | c[15]&~c[14]&~c[13]&~c[10] | c[15]&~c[14]&c[13]) & c[5]) | (~c[15]&c[14]&c[13]&~rs1eq2 & c[12]) | ( (c[15]&~c[14]&~c[13]&c[11]&c[10]) & 1'b1);
//   assign q1e[22] = ((~c[15]&~c[14] | ~c[15]&~c[13] | c[15]&~c[14]&~c[13]&~c[11] | c[15]&~c[14]&~c[13]&~c[10] | c[15]&~c[14]&c[13]) & c[4]) | (~c[15]&c[14]&c[13]&~rs1eq2 & c[12]) | ( (c[15]&~c[14]&~c[13]&c[11]) & c[4]);
//   assign q1e[21] = ((~c[15]&~c[14] | ~c[15]&~c[13] | c[15]&~c[14]&~c[13]&~c[11] | c[15]&~c[14]&~c[13]&~c[10] | c[15]&~c[14]&c[13]) & c[3]) | (~c[15]&c[14]&c[13]&~rs1eq2 & c[12]) | ( (c[15]&~c[14]&~c[13]&c[11]) & c[3]);
//   assign q1e[20] = ((~c[14]&c[13] | ~c[15]&c[14]&c[13]&~rs1eq2 ) & c[12]) | (~c[15]&~c[14]&~c[13] & c[2]) | (~c[15]&c[14]&~c[13] & c[2]) | (c[15]&~c[14]&~c[13] & c[2]);
//   assign q1e[19] = ((~c[14]&c[13] | ~c[15]&c[14]&c[13]&~rs1eq2 ) & c[12]) | (~c[15]&~c[14]&~c[13] & c[11]);
//   assign q1e[18] = ((~c[14]&c[13] | ~c[15]&c[14]&c[13]&~rs1eq2 ) & c[12]) | (~c[15]&~c[14]&~c[13] & c[10]) | (c[15]&~c[14]&~c[13] & 1'b1) | (c[15]&c[14] & 1'b1);
//   assign q1e[17] = ((~c[14]&c[13] | ~c[15]&c[14]&c[13]&~rs1eq2 ) & c[12]) | (~c[15]&~c[14]&~c[13] & c[ 9]) | (c[15]&~c[14]&~c[13] & c[9]) | (c[15]&c[14] & c[9]);
//   assign q1e[16] = (~c[14]&c[13] & c[12]) | (~c[15]&~c[14]&~c[13] & c[8]) | (c[15]&~c[14]&~c[13] & c[8]) | (c[15]&c[14] & c[8]) | (~c[15]&c[14]&c[13]&~rs1eq2 & c[6]) | (~c[15]&c[14]&c[13]&rs1eq2);
//   assign q1e[15] = (~c[14]&c[13] & c[12]) | (~c[15]&~c[14]&~c[13] & c[7]) | (c[15]&~c[14]&~c[13] & c[7]) | (c[15]&c[14] & c[7]) | (~c[15]&c[14]&c[13]&~rs1eq2 & c[5]);
//   assign q1e[14] = (~c[14]&c[13] & c[12]) | (~c[15]&c[14]&c[13]&~rs1eq2 & c[4]) | (c[15]&~c[14]&~c[13] & ~(c[11]&c[10]&~c[6]&~c[5]));
//   assign q1e[13] = (~c[14]&c[13] & c[12]) | (~c[15]&c[14]&c[13]&~rs1eq2 & c[3]) | (c[15]&~c[14]&~c[13]&c[11]&~c[10] | c[15]&~c[14]&~c[13]&c[11]&c[10]&c[6]);
//   assign q1e[12] = (~c[14]&c[13] & c[12]) | (~c[15]&c[14]&c[13]&~rs1eq2 & c[2]) | (c[15]&~c[14]&~c[13] & (~c[11] | c[11]&~c[10] | c[11]&c[10]&c[6]&c[5])) | (c[15]&c[14]&c[13]);
//   assign q1e[11] = (~c[15]&~c[14]&~c[13] | ~c[15]&c[14]&~c[13] | ~c[15]&c[14]&c[13]&!rs1eq2 | c[15]&c[14]) & c[11];
//   assign q1e[10] = ((~c[15]&~c[14]&~c[13] | ~c[15]&c[14]&~c[13] | ~c[15]&c[14]&c[13]&~rs1eq2 | c[15]&c[14]) & c[10]) | c[15]&~c[14]&~c[13];
//   assign q1e[ 9] = ((~c[15]&~c[14]&~c[13] | ~c[15]&c[14]&~c[13] | ~c[15]&c[14]&c[13]&~rs1eq2 | c[15]&~c[14]&~c[13]) & c[9]) | (c[15]&c[14] & c[4]);
//   assign q1e[ 8] = ((~c[15]&~c[14]&~c[13] | ~c[15]&c[14]&~c[13] | ~c[15]&c[14]&c[13]&~rs1eq2 | c[15]&~c[14]&~c[13]) & c[8]) | (c[15]&c[14] & c[3]) | (~c[15]&c[14]&c[13]&rs1eq2);//???
//   assign q1e[ 7] = ((~c[15]&~c[14]&~c[13] | ~c[15]&c[14]&~c[13] | ~c[15]&c[14]&c[13]&~rs1eq2 | c[15]&~c[14]&~c[13]) & c[7]) | (c[15]&c[14] & c[12]) | (~c[15]&~c[14]&c[13]);
//   assign q1e[ 6] = ~c[15]&~c[14]&c[13] | c[15]&c[13] | c[15]&c[14];
//   assign q1e[ 5] = ~c[15]&~c[14]&c[13] | ~c[15]&c[14]&c[13]&~rs1eq2 | c[15]&~c[14]&~c[13]&c[11]&c[10] | | c[15]&c[13] | c[15]&c[14];
//   assign q1e[ 4] = ~(~c[15]&~c[14]&c[13] | c[15]&c[13] | c[15]&c[14]);
//   assign q1e[ 3] = ~c[14]&c[13];
//   assign q1e[ 2] = ~c[14]&c[13] | ~c[15]&c[14]&c[13]&~rs1eq2;
//   assign q1e[ 1] = 1'b1;
//   assign q1e[ 0] = 1'b1;
//   
//   assign q2e[24] = ~(c[15]&~c[14]&rs2eq0) & c[6];
//   assign q2e[23] = ~(c[15]&~c[14]&rs2eq0) & c[5];
//   assign q2e[22] = ~(c[15]&~c[14]&rs2eq0) & c[4];
//   assign q2e[21] =(~(c[15]&~c[14]&rs2eq0) & c[3]) & ( c[15] | ~c[14]);
//   assign hC_EBREAK = ~c[13] & c[12] & rs1eq0 & rs2eq0;
//   assign q2e[20] = ((~(c[15]&~c[14]&rs2eq0) & c[2]) & ( c[15] | ~c[14])) | (c[15]&~c[14]&hC_EBREAK);
//   assign q2e[19] = ((~c[15]&~c[14]) | (c[15]&~c[14] & (rs2eq0 | c[12]) & ~hC_EBREAK)) & c[11];
//   assign q2e[18] = ((~c[15]&~c[14]) | (c[15]&~c[14] & (rs2eq0 | c[12]) & ~hC_EBREAK)) & c[10];
//   assign q2e[17] = ((~c[15]&~c[14]) | (c[15]&~c[14] & (rs2eq0 | c[12]) & ~hC_EBREAK)) & c[ 9];
//   assign q2e[16] = (((~c[15]&~c[14]) | (c[15]&~c[14] & (rs2eq0 | c[12]) & ~hC_EBREAK)) & c[ 8]) | c[14];
//   assign q2e[15] = ((~c[15]&~c[14]) | (c[15]&~c[14] & (rs2eq0 | c[12]) & ~hC_EBREAK)) & c[ 7];
//   assign q2e[14] = 1'b0;
//   assign q2e[13] = c[14];
//   assign q2e[12] = ~c[15] & ~c[14];
//   assign q2e[11] = ~(c[15]&~c[14]&rs2eq0) & c[11];
//   assign q2e[10] = ~(c[15]&~c[14]&rs2eq0) & c[10];
//   assign q2e[ 9] = ~(c[15]&~c[14]&rs2eq0) & c[ 9];
//   assign q2e[ 8] = (~(c[15]&~c[14]&rs2eq0) & ~(c[15]&c[14])) & c[ 8];
//   assign q2e[ 7] = ((~(c[15]&~c[14]&rs2eq0) & ~(c[15]&c[14])) & c[ 7]) | (c[15]&~c[14]&c[12]&~rs1eq0&rs2eq0);
//   assign q2e[ 6] = c[15]&~c[14]&rs2eq0;
//   assign q2e[ 5] = c[15];
//   assign q2e[ 4] = (~c[15]&~c[14]) | (c[15]&~c[14]&~c[12]&~rs2eq0) | (c[15]&~c[14]&c[12]&(~rs2eq0 | hC_EBREAK));
//   assign q2e[ 3] = 1'b0;
//   assign q2e[ 2] = c[15]&~c[14]& ( (~c[12]&rs2eq0) | (c[12]&~rs1eq0&rs2eq0) );
//   assign q2e[ 1] = 1'b1;
//   assign q2e[ 0] = ~c[13];
//

   /* Multiplex result as determined by q[1:0]
    */
   assign e[UUU:0] = c[0] ? (c[1] ? 0 : q1e[UUU:0]) : (c[1] ? q2e[UUU:0] : q0e[UUU:0]);
endmodule

/*

            c[11:7]==5'h2  (this is rs1eq2)
    11111   | 
    5431065 |               12  11 10  9  8  7  6  5  4  3  2 | 10      
    ---|||| |               --  -- -- -- -- -- -- -- -- -- -- | --
   _000xxxx x  C.ADDI/C.NOP i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | 11  addi rd,rd,nzimm[5:0] 
   _001xxxx x  C.JAL        ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | 11  jal x1, offset[11:1]       
   _010xxxx x  C.LI         i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | 11  addi rd,x0,imm[5:0] 
   _011xxxx 0  C.LUI        ih  D4 D3 D2 D1 D0 ig if ie id ic | 11  lui rd,nzimm[17:12].  
   _011xxxx 1  C.ADDI16SP   i9   0  0  0  1  0 i4 i6 i8 i7 i5 | 11  addi x2,x2,nzimm[9:4] 
   _10000xx x  C.SRLI        x   0  0 d2 d1 d0 z4 z3 z2 z1 z0 | 11  srli rd',rd',shamt[5:0]                               
   _10001xx 0  C.SRAI        x   0  1 d2 d1 d0 z4 z3 z2 z1 z0 | 11  srai rd',rd',shamt[5:0]
   _10010xx 0  C.ANDI       i5   1  0 d2 d1 d0 i4 i3 i2 i1 i0 | 11  andi rd',rd',imm[5:0]
   _1001100 0  C.SUB         0   1  1 d2 d1 d0  0  0 t2 t1 t0 | 11  sub rd',rd',rs2'
   _1001101 0  C.XOR         0   1  1 d2 d1 d0  0  1 t2 t1 t0 | 11  xor rd',rd',rs2'
   _1001110 0  C.OR          0   1  1 d2 d1 d0  1  0 t2 t1 t0 | 11  or rd',rd'rs2'
   _1001111 0  C.AND         0   1  1 d2 d1 d0  1  1 t2 t1 t0 | 11  and rd',rd',rs2'
   _101xxxx x  C.J          ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | 11  jal x0, offset[11:1]
   _110xxxx x  C.BEQZ       i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | 11  beq rs1',x0,offset[8:1]                  
   _111xxxx x  C.BNEZ       i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | 11  bne rs1',x0,offset[8:1]                  

31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7 65432   
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -----  
12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7 00100  
12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  1 11011  
12 12 12 12 12 12 12  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7 00100  
12 12 12 12 12 12 12 12 12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7 01101  
12 12 12  4  3  5  2  6  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  1  0 00100  
 0  0  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7 00100  
 0  1  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7 00100  
12 12 12 12 12 12 12  6  5  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7 00100  
 0  1  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  0  0  0  0  1  9  8  7 01100  
 0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  0  0  0  1  9  8  7 01100  
 0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  0  0  1  9  8  7 01100  
 0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7 01100  
12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  0 11011  
12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  0 11 10  4  3 12 11000  
12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  1 11 10  4  3 12 11000  
 */
