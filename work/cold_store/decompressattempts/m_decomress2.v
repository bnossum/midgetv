/*
          
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
   
Quadrant0, naive coding uses 24 LUTs, this is close to optimal. Can shave 3 luts by using carry chains for rs1eq0, rs2eq0 and c15_23eq0.

      
111   
543                     12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7 6543210      
---                     --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -------
000        C.ADDI4SPN   z5  z4 z9 z8 z7 z6 z2 z3 d2 d1 d0 |  0  0 10  9  8  7 12 11  5  6  0  0  0  0  0  1  0  0  0  0  0  1  4  3  2 0010011  addi rd',x2,mzuimm[9:2]   
001        C.FLD         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
010        C.LW         z5  z4 z3 s2 s1 s0 z2 z6 d2 d1 d0 |  0  0  0  0  0  5 12 11 10  6  0  0  0  1  9  8  7  0  1  0  0  1  4  3  2 0000011  lw rd',offset[6:2](rs1')
011        C.FLW         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
100        reserved      x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxxx  don't care in midgetv
101        C.FSD         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
110        C.SW         z5  z4 z3 s2 s1 s0 z2 z6 t2 t1 t0 |  0  0  0  0  0  5 12  0  1  4  3  2  0  1  9  8  7  0  1  0 11 10  6  0  0 0100011  sw rs2',offset[6:2](rs1') 
111        C.FSW         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv

*/
module m_decompress2
  (  
   input [15:0]  c, //   Compressed instruction
   output [31:0] e //   Expanded result
   );

   wire [31:0]   q0e;
   wire         rs1eq0,rs1eq2,rs2eq0,c15_23eq0, hC_EBREAK;
   assign rs1eq0 = c[11:7] == 5'b00000;
   assign rs1eq2 = c[11:7] == 5'b00010;
   assign rs2eq0 = c[ 6:2] == 5'b00000;
   assign c15_23eq0 = c[15:12] == 4'b0000;

   /* A number of outputs are constant
    */
   assign { q0e[31],q0e[30],q0e[19],q0e[14],q0e[12],q0e[ 6],q0e[ 3],q0e[ 2],q0e[ 1]} = 9'h001;
   /* Very simple outputs
    */
   assign q0e[25] = c[12];
   assign q0e[ 5] = c[15];
   assign q0e[13] = q0e[18];   
   assign q0e[ 4] = ~c[14];
   assign q0e[24] = ~q0e[11];
   /*  These outputs only require 1 SB_LUT4 each
    */ 
   assign q0e[29] = ~c[14]&c[10];
   assign q0e[28] = ~c[14]&c[9];
   assign q0e[27] = ~c[14]&c[8];
   assign q0e[26] = (~c[14]&c[7]) | (c[14]&c[5]);
   assign q0e[23] = (~c[14]&c[5]) | (c[14]&c[10]) | c[15];
   assign q0e[22] = (~c[15]&c[6]) | (c[15]&c[4]);
   assign q0e[21] = c[15]&c[3];
   assign q0e[20] = c[15]&c[2];
   assign q0e[18] = c[15]|c[14];
   assign q0e[17] = (c[15]|c[14])&c[9];
   assign q0e[16] = ((c[15]|c[14])&c[8]) | (~c[15]&~c[14]);
   assign q0e[15] = (c[15]|c[14])&c[7];
   assign q0e[11] = c[15]&c[11];
   assign q0e[10] = (c[15]&c[10]) | ~c[15];
   assign q0e[ 9] = (~c[15]&c[4]) | (c[15]&c[6]);
   assign q0e[ 8] = ~c[15]&c[3];
   assign q0e[ 7] = ~c[15]&c[2];
   assign q0e[ 0] = ~c[13]  | (~rs1eq0 | ~rs2eq0 | ~c15_23eq0); // To trigger illegal instr
   
   assign e = q0e;

endmodule

/*   
Quadrant1
        c[11:7]==5'h2
11111   | 
5431065 |               12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7 6543210      
---|||| |               --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -------
000     x  C.ADDI/C.NOP i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7 0010011  addi rd,rd,nzimm[5:0] 
001     x  C.JAL        ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | 12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  1 1101111  jal x1, offset[11:1]       
010     x  C.LI         i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7 0010011  addi rd,x0,imm[5:0] 
011     0  C.LUI        ih  D4 D3 D2 D1 D0 ig if ie id ic | 12 12 12 12 12 12 12 12 12 12 12 12 12 12 12  6  5  4  3  2 11 10  9  8  7 0110111  lui rd,nzimm[17:12].  
011     1  C.ADDI16SP   i9   0  0  0  1  0 i4 i6 i8 i7 i5 | 12 12 12  4  3  5  2  6  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  1  0 0010011  addi x2,x2,nzimm[9:4] 
10000   x  C.SRLI        x   0  0 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7 0010011  srli rd',rd',shamt[5:0]                               
10001   0  C.SRAI        x   0  1 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7 0010011  srai rd',rd',shamt[5:0]
10010   0  C.ANDI       i5   1  0 d2 d1 d0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7 0010011  andi rd',rd',imm[5:0]
10011   0  reserved      1   1  1  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxxx  
1001100 0  C.SUB         0   1  1 d2 d1 d0  0  0 t2 t1 t0 |  0  1  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  0  0  0  0  1  9  8  7 0110011  sub rd',rd',rs2'
1001101 0  C.XOR         0   1  1 d2 d1 d0  0  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  0  0  0  1  9  8  7 0110011  xor rd',rd',rs2'
1001110 0  C.OR          0   1  1 d2 d1 d0  1  0 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  0  0  1  9  8  7 0110011  or rd',rd'rs2'
1001111 0  C.AND         0   1  1 d2 d1 d0  1  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7 0110011  and rd',rd',rs2'
101     x  C.J          ib  i4 i9 i8 ia i6 i7 i3 i2 i1 i5 | 12  8 10  9  6  7  2 11  5  4  3 12 12 12 12 12 12 12 12 12  0  0  0  0  0 1101111  jal x0, offset[11:1]
110     x  C.BEQZ       i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | 12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  0 11 10  4  3 12 1100011  beq rs1',x0,offset[8:1]                  
111     x  C.BNEZ       i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | 12 12 12 12  6  5  2  0  0  0  0  0  0  1  9  8  7  0  0  1 11 10  4  3 12 1100011  bne rs1',x0,offset[8:1]                  

Quadrant2
    c[11:7]==5'h0
1111|c[6:2]==5'h0
5432||                  12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7 6543210      
---|||                  --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -------
000xxx     C.SLLI        x  D4 D3 D2 D1 D0 z4 z3 z2 z1 z0 |  0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  1 11 10  9  8  7 0010011  slli rd,rd,shamt[5:0] 
001xxx     C.FLDSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
010xxx     C.LWSP       z5  D4 D3 D2 D1 D0 z4 z3 z2 z7 z6 |  0  0  0  0  3  2 12  6  5  4  0  0  0  0  0  1  0  0  1  0 11 10  9  8  7 0000011  lw rd,offset[7:2](x2) 
011xxx     C.FLWSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal in midgetv
1000x0     C.MV          0  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0  6  5  4  3  2  0  0  0  0  0  0  0  0 11 10  9  8  7 0110011  add rd,rd,rs2          
1000x1     C.JR          0  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  0 1100111  jalr x0,0(rs1)                  rs1 != 0
100101     C.JALR        l  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  1 1100111  jalr x1,0(rs1)                  rs1 != 0
100111     C.EBREAK      l   0  0  0  0  0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0 1110011  ebreak
1001x0     C.ADD         l  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7 0110011  add rd,rd,rs2                   rs2 != 0
101xxx     C.FSDSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal
110xxx     C.SWSP       z5  z4 z3 z2 z7 z6 T4 T3 T2 T1 T0 |  0  0  0  0  8  7 12  6  5  4  3  2  0  0  0  1  0  0  1  0 11 10  9  0  0 0100011  sw rs2,offset[7:2](x2)
111xxx     C.FSWSP       x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x xxxxxx0  illegal

 
Destinations:                           
 31 : 20,  0               
 30 : 12,  8, 1, 0         
 29 : 12, 10, 0            
 28 : 12,  9, 4, 0         
 27 : 12,  8, 6, 3, 0      
 26 : 12,  7, 5, 2, 0      
 25 : 12,  2, 0            
 24 : 12, 11, 6, 0         
 23 : 12, 10, 5, 1, 0      
 22 : 12,  6, 4, 0         
 21 : 12,  3, 0            
 20 : 12,  2, 1, 0         
 19 : 12, 11, 0            
 18 : 12, 10, 1, 0         
 17 : 12,  9, 0            
 16 : 12,  8, 6, 1, 0      
 15 : 12,  7, 5, 0         
 14 : 12,  4, 1, 0         
 13 : 12,  3, 1, 0         
 12 : 12,  2, 1, 0         
 11 : 11,  0               
 10 : 10,  1, 0            
  9 :  9,  6, 4, 0         
  8 :  8,  3, 1, 0        
  7 : 12,  7, 2, 1, 0        
                            
*/
