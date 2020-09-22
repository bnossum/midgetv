
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2020-2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * ----------------------------------------------------------------------------

 Implemented halfway, 102 luts. Can this be bettered?
 Replaced first 8 equations. Result fluctuated between 95 and 105 luts. 
 Replaced first 8 elaborate equation with much easier construct. Same size...
 
 
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

11                                                  Auxiliary mux for SRLI/SRAI/ANDI/SUB/XOR/OR/AND
1065            12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0                         
||||            --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  -  -  -  -  -  -  -                         
00     C.SRLI    x   0  0 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7  0  0  1  0  0  1  1  srli rd',rd',shamt[5:0]                               
01     C.SRAI    x   0  1 d2 d1 d0 z4 z3 z2 z1 z0 |  0  1  0  0  0  0  0  6  5  4  3  2  0  1  9  8  7  1  0  1  0  1  9  8  7  0  0  1  0  0  1  1  srai rd',rd',shamt[5:0]
10     C.ANDI   i5   1  0 d2 d1 d0 i4 i3 i2 i1 i0 | 12 12 12 12 12 12 12  6  5  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7  0  0  1  0  0  1  1  andi rd',rd',imm[5:0]
11     reserved  1   1  1  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  
1100   C.SUB     0   1  1 d2 d1 d0  0  0 t2 t1 t0 |  0  1  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  0  0  0  0  1  9  8  7  0  1  1  0  0  1  1  sub rd',rd',rs2'
1101   C.XOR     0   1  1 d2 d1 d0  0  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  0  0  0  1  9  8  7  0  1  1  0  0  1  1  xor rd',rd',rs2'
1110   C.OR      0   1  1 d2 d1 d0  1  0 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  0  0  1  9  8  7  0  1  1  0  0  1  1  or rd',rd'rs2'
1111   C.AND     0   1  1 d2 d1 d0  1  1 t2 t1 t0 |  0  0  0  0  0  0  0  0  1  4  3  2  0  1  9  8  7  1  1  1  0  1  9  8  7  0  1  1  0  0  1  1  and rd',rd',rs2'
                                                    36 37 36 36 36 36 36 38 39  4  3  2  0  1  9  8  7 40 41 42  0  1  9  8  7  0 43  1  0  0  1  1

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
0x1  C.JR        0  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  0  1  1  0  0  1  1  1  jalr x0,0(rs1)                  rs1 != 0
101  C.JALR      l  S4 S3 S2 S1 S0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  0 11 10  9  8  7  0  0  0  0  0  0  0  1  1  1  0  0  1  1  1  jalr x1,0(rs1)                  rs1 != 0
111  C.EBREAK    l   0  0  0  0  0  0  0  0  0  0 |  0  0  0  0  0  0  0  0  0  0  0  1  0  0  0  0  0  0  0  0  0  0  0  0  0  1  1  1  0  0  1  1  ebreak
1x0  C.ADD       l  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0  6  5  4  3  2 11 10  9  8  7  0  0  0 11 10  9  8  7  0  1  1  0  0  1  1  add rd,rd,rs2                   rs2 != 0
                                                     0  0  0  0  0  0  0 44 45 46 47 48 49 50 51 52 53  0  0  0 54 55 56 57 58 59  1 16  0 19  1  1

 
12
|rs1eq0                                                                                                                                                        
||rs2eq0
|||                                                  Auxiliary mux for C.ADDI4SPN/ILLEGAL
1xx C.ADDI4SPN  z5  z4 z9 z8 z7 z6 z2 z3 d2 d1 d0 |  0  0 10  9  8  7 12 11  5  6  0  0  0  0  0  1  0  0  0  0  0  1  4  3  2  0  0  1  0  0  1  1  addi rd',x2,mzuimm[9:2]   
00x C.ADDI4SPN  z5  z4 z9 z8 z7 z6 z2 z3 d2 d1 d0 |  0  0 10  9  8  7 12 11  5  6  0  0  0  0  0  1  0  0  0  0  0  1  4  3  2  0  0  1  0  0  1  1  addi rd',x2,mzuimm[9:2]   
010 C.ADDI4SPN  z5  z4 z9 z8 z7 z6 z2 z3 d2 d1 d0 |  0  0 10  9  8  7 12 11  5  6  0  0  0  0  0  1  0  0  0  0  0  1  4  3  2  0  0  1  0  0  1  1  addi rd',x2,mzuimm[9:2]   
011 ILLEGAL                                       |  0  0 10  9  8  7 12 11  5  6  0  0  0  0  0  1  0  0  0  0  0  1  4  3  2  0  0  1  0  0  1  0  defined illegal 
                                                     0  0 10  9  8  7 12 11  5  6  0  0  0  0  0  1  0  0  0  0  0  1  4  3  2  0  0  1  0  0  1 60  


  111   
10543                 12  11 10  9  8  7  6  5  4  3  2 | 31 30 29 28 27 26 25 24 23 22 21 20 19 18 17 16 15 14 13 12 11 10  9  8  7  6  5  4  3  2  1  0      
-----                 --  -- -- -- -- -- -- -- -- -- -- | -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --  -  -  -  -  -  -  -
00000  ILLEGAL/ADDI4SPN                                 |  0  0 10  9  8  7 12 11  5  6  0  0  0  0  0  1  0  0  0  0  0  1  4  3  2  0  0  1  0  0  1 60  
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
10100  MV/JR/JALR/EBREAK/ADD                            |  0  0  0  0  0  0  0 44 45 46 47 48 49 50 51 52 53  0  0  0 54 55 56 57 58 59  1 60  0 61  1  1
10101  C.FSDSP         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  0  illegal
10110  C.SWSP         z5  z4 z3 z2 z7 z6 T4 T3 T2 T1 T0 |  0  0  0  0  8  7 12  6  5  4  3  2  0  0  0  1  0  0  1  0 11 10  9  0  0  0  1  0  0  0  1  1  sw rs2,offset[7:2](x2)
10111  C.FSWSP         x   x  x  x  x  x  x  x  x  x  x |  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  x  0  illegal

*/

/* verilator lint_off UNUSED */
/* verilator lint_off IMPLICIT */
module m_decompress
  (
   input [15:0]     c, // Compressed instruction
   output reg [31:0]    e //  Expanded result
   );
   wire [4:0]       inx = {c[1:0],c[15:13]};
/* ve rilator lint_off UNDRIVEN */
   wire [60:0]      cc;
   wire             rs1eq2 = c[11:7] == 5'b00010;
   wire             rs1eq0 = c[11:7] == 5'b00000;
   wire             rs2eq0 = c[6:2]  == 5'b00000;
   
   assign cc[15:0] = c[15:0];

   assign cc[60:53] = 0;
   assign cc[43:40] = 0;
   assign cc[35:27] = 0;
   assign cc[19:16] = 0;
   
   // Helping SRLI/SRAI/ANDI/SUB/XOR/OR/AND
   assign cc[36] = c[11:10] == 2'b10 ? c[12] : 0;
   assign cc[37] = c[11:10] == 2'b10 ? c[12] : ((c[11:10] == 2'b01) || ( {c[11:10],c[6:5]} == 4'b1100 )) ? 1 : 0;
   assign cc[38] = c[11:10] != 2'b11 ? c[6] : 0;
   assign cc[39] = c[11:10] != 2'b11 ? c[5] : 1;
                  
   // Helping LUI/ADDI16SP
   assign cc[20] = rs1eq2 ? c[4] : c[12];
   assign cc[21] = rs1eq2 ? c[3] : c[12];
   assign cc[22] = rs1eq2 ? c[5] : c[12];
   assign cc[23] = rs1eq2 ? c[2] : c[12];
   assign cc[24] = rs1eq2 ? c[6] : c[12];
   assign cc[25] = rs1eq2 ? 0    : c[12];
   assign cc[26] = rs1eq2 ? 1    : c[6];
   
   // Helping MV/JR/JALR/EBREAK/AND
   wire [2:0]       jnx = {c[12],rs1eq0,rs2eq0};
   assign cc[44] = (jnx == 0 || jnx == 2 || jnx == 4 || jnx == 6 ) ? c[6] : 0;
   assign cc[45] = (jnx == 0 || jnx == 2 || jnx == 4 || jnx == 6 ) ? c[5] : 0;
   assign cc[46] = (jnx == 0 || jnx == 2 || jnx == 4 || jnx == 6 ) ? c[4] : 0;
   assign cc[47] = (jnx == 0 || jnx == 2 || jnx == 4 || jnx == 6 ) ? c[3] : 0;
   assign cc[48] = (jnx == 0 || jnx == 2 || jnx == 4 || jnx == 6 ) ? c[2] : (jnx == 7 ) ? 1 : 0;
   assign cc[49] = (jnx == 1 || jnx == 3 || jnx == 5 || jnx == 4 || jnx == 6 ) ? c[11] : 0;
   assign cc[50] = (jnx == 1 || jnx == 3 || jnx == 5 || jnx == 4 || jnx == 6 ) ? c[10] : 0;
   assign cc[51] = (jnx == 1 || jnx == 3 || jnx == 5 || jnx == 4 || jnx == 6 ) ? c[9] : 0;
   assign cc[52] = (jnx == 1 || jnx == 3 || jnx == 5 || jnx == 4 || jnx == 6 ) ? c[8] : 0;

//   reg              e31_cc12,e31_cc36;
//   always @(*) 
//     case (inx )
//       5'h00  : {e31_cc12, e31_cc36}  = {1'b0  , 1'b0  };
//       5'h01  : {e31_cc12, e31_cc36}  = {1'bx  , 1'bx  };
//       5'h02  : {e31_cc12, e31_cc36}  = {1'b0  , 1'b0  };
//       5'h03  : {e31_cc12, e31_cc36}  = {1'bx  , 1'bx  };
//       5'h04  : {e31_cc12, e31_cc36}  = {1'bx  , 1'bx  };
//       5'h05  : {e31_cc12, e31_cc36}  = {1'bx  , 1'bx  };
//       5'h06  : {e31_cc12, e31_cc36}  = {1'b0  , 1'b0  };
//       5'h07  : {e31_cc12, e31_cc36}  = {1'bx  , 1'bx  };
//       5'h08  : {e31_cc12, e31_cc36}  = {cc[12], 1'b0  };
//       5'h09  : {e31_cc12, e31_cc36}  = {cc[12], 1'b0  };
//       5'h0a  : {e31_cc12, e31_cc36}  = {cc[12], 1'b0  };
//       5'h0b  : {e31_cc12, e31_cc36}  = {cc[12], 1'b0  };
//       5'h0c  : {e31_cc12, e31_cc36}  = {1'b0  , cc[36]};
//       5'h0d  : {e31_cc12, e31_cc36}  = {cc[12], 1'b0  };
//       5'h0e  : {e31_cc12, e31_cc36}  = {cc[12], 1'b0  };
//       5'h0f  : {e31_cc12, e31_cc36}  = {cc[12], 1'b0  };
//       5'h10  : {e31_cc12, e31_cc36}  = {1'b0  , 1'b0  };
//       5'h11  : {e31_cc12, e31_cc36}  = {1'bx  , 1'bx  };
//       5'h12  : {e31_cc12, e31_cc36}  = {1'b0  , 1'b0  };
//       5'h13  : {e31_cc12, e31_cc36}  = {1'bx  , 1'bx  };
//       5'h14  : {e31_cc12, e31_cc36}  = {1'b0  , 1'b0  };
//       5'h15  : {e31_cc12, e31_cc36}  = {1'bx  , 1'bx  };
//       5'h16  : {e31_cc12, e31_cc36}  = {1'b0  , 1'b0  };
//       5'h17  : {e31_cc12, e31_cc36}  = {1'bx  , 1'bx  };
//       default :{e31_cc12, e31_cc36}  = {1'bx  , 1'bx  };
//     endcase
////   wire             e31_cc12 = ( inx == 8 || inx == 9 || inx == 10 || inx == 11 || inx == 13 || inx == 14 || inx == 15) ? cc[12] : 0;
////   wire             e31_cc36 = ( inx == 12 || inx == 28 ) ? cc[36] : 0;
//   assign e[31] = e31_cc12 | e31_cc36;

   always @(*) begin
      case (inx) //            31      30      29      28      27      26      25      24
        5'h00  : e[31:24] ={  1'b0  , 1'b0  , cc[10], cc[9] , cc[8] , cc[7] , cc[12], cc[11]}; 
        5'h01  : e[31:24] ={  1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  };
        5'h02  : e[31:24] ={  1'b0  , 1'b0  , 1'b0  , 1'b0  , 1'b0  , cc[5] , cc[12], cc[11]};
        5'h03  : e[31:24] ={  1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  };
        5'h04  : e[31:24] ={  1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  };
        5'h05  : e[31:24] ={  1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  };
        5'h06  : e[31:24] ={  1'b0  , 1'b0  , 1'b0  , 1'b0  , 1'b0  , cc[5] , cc[12], 1'b0  };
        5'h07  : e[31:24] ={  1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  };
        5'h08  : e[31:24] ={  cc[12], cc[12], cc[12], cc[12], cc[12], cc[12], cc[12], cc[6] };
        5'h09  : e[31:24] ={  cc[12], cc[8] , cc[10], cc[9] , cc[6] , cc[7] , cc[2] , cc[11]};
        5'h0a  : e[31:24] ={  cc[12], cc[12], cc[12], cc[12], cc[12], cc[12], cc[12], cc[6] };
        5'h0b  : e[31:24] ={  cc[12], cc[12], cc[12], cc[20], cc[21], cc[22], cc[23], cc[24]};
        5'h0c  : e[31:24] ={  cc[36], cc[37], cc[36], cc[36], cc[36], cc[36], cc[36], cc[38]};
        5'h0d  : e[31:24] ={  cc[12], cc[8] , cc[10], cc[9] , cc[6] , cc[7] , cc[2] , cc[11]};
        5'h0e  : e[31:24] ={  cc[12], cc[12], cc[12], cc[12], cc[6] , cc[5] , cc[2] , 1'b0  };
        5'h0f  : e[31:24] ={  cc[12], cc[12], cc[12], cc[12], cc[6] , cc[5] , cc[2] , 1'b0  };
        5'h10  : e[31:24] ={  1'b0  , 1'b0  , 1'b0  , 1'b0  , 1'b0  , 1'b0  , 1'b0  , cc[6] };
        5'h11  : e[31:24] ={  1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  };
        5'h12  : e[31:24] ={  1'b0  , 1'b0  , 1'b0  , 1'b0  , cc[3] , cc[2], cc[12] , cc[6] };
        5'h13  : e[31:24] ={  1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  };
        5'h14  : e[31:24] ={  1'b0  , 1'b0  , 1'b0  , 1'b0  , 1'b0  , 1'b0  , 1'b0  , cc[44]};
        5'h15  : e[31:24] ={  1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  };
        5'h16  : e[31:24] ={  1'b0  , 1'b0  , 1'b0  , 1'b0  , cc[8] , cc[7] , cc[12], cc[6] };
        5'h17  : e[31:24] ={  1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  };
        default :e[31:24] ={  1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  , 1'bx  };
      endcase
   end
//  
//     reg              e30_cc12,e30_cc8,e30_cc37;
//     always @(*) 
//       case (inx )
//         5'h00  : {e30_cc12,e30_cc8,e30_cc37}  = {1'b0  , 1'b0  , 1'b0  };
//         5'h01  : {e30_cc12,e30_cc8,e30_cc37}  = {1'bx  , 1'bx  , 1'bx  };
//         5'h02  : {e30_cc12,e30_cc8,e30_cc37}  = {1'b0  , 1'b0  , 1'b0  };
//         5'h03  : {e30_cc12,e30_cc8,e30_cc37}  = {1'bx  , 1'bx  , 1'bx  };
//         5'h04  : {e30_cc12,e30_cc8,e30_cc37}  = {1'bx  , 1'bx  , 1'bx  };
//         5'h05  : {e30_cc12,e30_cc8,e30_cc37}  = {1'bx  , 1'bx  , 1'bx  };
//         5'h06  : {e30_cc12,e30_cc8,e30_cc37}  = {1'b0  , 1'b0  , 1'b0  };
//         5'h07  : {e30_cc12,e30_cc8,e30_cc37}  = {1'bx  , 1'bx  , 1'bx  };
//         5'h08  : {e30_cc12,e30_cc8,e30_cc37}  = {cc[12], 1'b0  , 1'b0  };
//         5'h09  : {e30_cc12,e30_cc8,e30_cc37}  = {1'b0,   cc[8] , 1'b0  };
//         5'h0a  : {e30_cc12,e30_cc8,e30_cc37}  = {cc[12], 1'b0  , 1'b0  };
//         5'h0b  : {e30_cc12,e30_cc8,e30_cc37}  = {cc[12], 1'b0  , 1'b0  };
//         5'h0c  : {e30_cc12,e30_cc8,e30_cc37}  = {1'b0  , 1'b0  , cc[37]};
//         5'h0d  : {e30_cc12,e30_cc8,e30_cc37}  = {1'b0,   cc[8] , 1'b0  };
//         5'h0e  : {e30_cc12,e30_cc8,e30_cc37}  = {cc[12], 1'b0  , 1'b0  };
//         5'h0f  : {e30_cc12,e30_cc8,e30_cc37}  = {cc[12], 1'b0  , 1'b0  };
//         5'h10  : {e30_cc12,e30_cc8,e30_cc37}  = {1'b0  , 1'b0  , 1'b0  };
//         5'h11  : {e30_cc12,e30_cc8,e30_cc37}  = {1'bx  , 1'bx  , 1'bx  };
//         5'h12  : {e30_cc12,e30_cc8,e30_cc37}  = {1'b0  , 1'b0  , 1'b0  };
//         5'h13  : {e30_cc12,e30_cc8,e30_cc37}  = {1'bx  , 1'bx  , 1'bx  };
//         5'h14  : {e30_cc12,e30_cc8,e30_cc37}  = {1'b0  , 1'b0  , 1'b0  };
//         5'h15  : {e30_cc12,e30_cc8,e30_cc37}  = {1'bx  , 1'bx  , 1'bx  };
//         5'h16  : {e30_cc12,e30_cc8,e30_cc37}  = {1'b0  , 1'b0  , 1'b0  };
//         5'h17  : {e30_cc12,e30_cc8,e30_cc37}  = {1'bx  , 1'bx  , 1'bx  };
//         default :{e30_cc12,e30_cc8,e30_cc37}  = {1'bx  , 1'bx  , 1'bx  };
//       endcase
//  //   wire             e30_cc12 = ( inx ==  8 || inx == 10 || inx == 11 || inx == 14 || inx == 15 ||
//  //                                 inx == 24 || inx == 26 || inx == 27 || inx == 30 || inx == 31) ? cc[12] : 0;
//  //   wire             e30_cc8  = ( inx == 9  || inx == 13 ||
//  //                                 inx == 25 || inx == 29 ) ? cc[8]  : 0;
//  //   wire             e30_cc37 = ( inx == 12 || inx == 28 ) ? cc[37] : 0;
//     assign e[30] = e30_cc12 | e30_cc8 | e30_cc37;
//  
//     reg              e29_cc12,e29_cc10,e29_cc36;
//     always @(*) begin
//        e29_cc12 = e30_cc12;
//        e29_cc36 = e31_cc36;
//        case (inx )
//          5'h00  : {e29_cc10}  = {cc[10]};
//          5'h01  : {e29_cc10}  = {1'bx  };
//          5'h02  : {e29_cc10}  = {1'b0  };
//          5'h03  : {e29_cc10}  = {1'bx  };
//          5'h04  : {e29_cc10}  = {1'bx  };
//          5'h05  : {e29_cc10}  = {1'bx  };
//          5'h06  : {e29_cc10}  = {1'b0  };
//          5'h07  : {e29_cc10}  = {1'bx  };
//          5'h08  : {e29_cc10}  = {1'b0  };
//          5'h09  : {e29_cc10}  = {cc[10]};
//          5'h0a  : {e29_cc10}  = {1'b0  };
//          5'h0b  : {e29_cc10}  = {1'b0  };
//          5'h0c  : {e29_cc10}  = {1'b0  };
//          5'h0d  : {e29_cc10}  = {cc[10]};
//          5'h0e  : {e29_cc10}  = {1'b0  };
//          5'h0f  : {e29_cc10}  = {1'b0  };
//          5'h10  : {e29_cc10}  = {1'b0  };
//          5'h11  : {e29_cc10}  = {1'bx  };
//          5'h12  : {e29_cc10}  = {1'b0  };
//          5'h13  : {e29_cc10}  = {1'bx  };
//          5'h14  : {e29_cc10}  = {1'b0  };
//          5'h15  : {e29_cc10}  = {1'bx  };
//          5'h16  : {e29_cc10}  = {1'b0  };
//          5'h17  : {e29_cc10}  = {1'bx  };
//          default :{e29_cc10}  = {1'bx  };
//        endcase
//     end      
//  //   wire             e29_cc12 = e30_cc12;
//  //   wire             e29_cc10 = (inx == 0  || inx == 9  || inx == 13 ) ? cc[10] : 0;
//  //   wire             e29_cc36 = e31_cc36;
//     assign e[29] = e29_cc12 | e29_cc10 | e29_cc36;
//  
//     reg e28_cc12, e28_cc20, e28_cc9, e28_cc36;
//     always @(*) begin
//        e28_cc36 = e31_cc36;
//        case (inx )
//          5'h00  : {e28_cc12, e28_cc20, e28_cc9}  = {1'b0  ,1'b0  ,cc[9]};   // 1'b0
//          5'h01  : {e28_cc12, e28_cc20, e28_cc9}  = {1'bx  ,1'bx  ,1'bx };   // 1'bx
//          5'h02  : {e28_cc12, e28_cc20, e28_cc9}  = {1'b0  ,1'b0  ,1'b0 };   // 1'b0
//          5'h03  : {e28_cc12, e28_cc20, e28_cc9}  = {1'bx  ,1'bx  ,1'bx };   // 1'bx
//          5'h04  : {e28_cc12, e28_cc20, e28_cc9}  = {1'bx  ,1'bx  ,1'bx };   // 1'bx
//          5'h05  : {e28_cc12, e28_cc20, e28_cc9}  = {1'bx  ,1'bx  ,1'bx };   // 1'bx
//          5'h06  : {e28_cc12, e28_cc20, e28_cc9}  = {1'b0  ,1'b0  ,1'b0 };   // 1'b0
//          5'h07  : {e28_cc12, e28_cc20, e28_cc9}  = {1'bx  ,1'bx  ,1'bx };   // 1'bx
//          5'h08  : {e28_cc12, e28_cc20, e28_cc9}  = {cc[12],1'b0  ,1'b0 };   // 1'b0
//          5'h09  : {e28_cc12, e28_cc20, e28_cc9}  = {1'b0  ,1'b0  ,cc[9]};   // 1'b0
//          5'h0a  : {e28_cc12, e28_cc20, e28_cc9}  = {cc[12],1'b0  ,1'b0 };   // 1'b0
//          5'h0b  : {e28_cc12, e28_cc20, e28_cc9}  = {1'b0  ,cc[20],1'b0 };   // 1'b0
//          5'h0c  : {e28_cc12, e28_cc20, e28_cc9}  = {1'b0  ,1'b0  ,1'b0 };   // 1'b0
//          5'h0d  : {e28_cc12, e28_cc20, e28_cc9}  = {1'b0  ,1'b0  ,cc[9]};   // 1'b0
//          5'h0e  : {e28_cc12, e28_cc20, e28_cc9}  = {cc[12],1'b0  ,1'b0 };   // 1'b0
//          5'h0f  : {e28_cc12, e28_cc20, e28_cc9}  = {cc[12],1'b0  ,1'b0 };   // 1'b0
//          5'h10  : {e28_cc12, e28_cc20, e28_cc9}  = {1'b0  ,1'b0  ,1'b0 };   // 1'b0
//          5'h11  : {e28_cc12, e28_cc20, e28_cc9}  = {1'bx  ,1'bx  ,1'bx };   // 1'bx
//          5'h12  : {e28_cc12, e28_cc20, e28_cc9}  = {1'b0  ,1'b0  ,1'b0 };   // 1'b0
//          5'h13  : {e28_cc12, e28_cc20, e28_cc9}  = {1'bx  ,1'bx  ,1'bx };   // 1'bx
//          5'h14  : {e28_cc12, e28_cc20, e28_cc9}  = {1'b0  ,1'b0  ,1'b0 };   // 1'b0
//          5'h15  : {e28_cc12, e28_cc20, e28_cc9}  = {1'bx  ,1'bx  ,1'bx };   // 1'bx
//          5'h16  : {e28_cc12, e28_cc20, e28_cc9}  = {1'b0  ,1'b0  ,1'b0 };   // 1'b0
//          5'h17  : {e28_cc12, e28_cc20, e28_cc9}  = {1'bx  ,1'bx  ,1'bx };   // 1'bx
//          default :{e28_cc12, e28_cc20, e28_cc9}  = {1'bx  ,1'bx  ,1'bx };   // 1'bx
//        endcase
//     end      
//  //   wire             e28_cc12 = ( inx ==  8 || inx == 10 || inx == 14 || inx == 15 ||
//  //                                 inx == 24 || inx == 26 || inx == 30 || inx == 31) ? cc[12] : 0;
//  //   wire             e28_cc20 = ( inx == 11 || inx == 27) ? cc[20] : 0;
//  //   wire             e28_cc9 =  (inx == 0  || inx == 9  || inx == 13 ) ? cc[9] : 0;
//  //   wire             e28_cc36 = e31_cc36;
//     assign e[28] = e28_cc12 | e28_cc9 | e28_cc20 | e28_cc36;
//  
//     reg e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc36, e27_cc21;
//     always @(*) begin
//        e27_cc36 = e31_cc36;
//        case (inx )
//          5'h00  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'b0  ,cc[8] ,1'b0 ,1'b0 ,1'b0  };   // 1'b0  
//          5'h01  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'bx  ,1'bx  ,1'bx ,1'bx ,1'bx  };   // 1'bx  
//          5'h02  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'b0  ,1'b0  ,1'b0 ,1'b0 ,1'b0  };   // 1'b0  
//          5'h03  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'bx  ,1'bx  ,1'bx ,1'bx ,1'bx  };   // 1'bx  
//          5'h04  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'bx  ,1'bx  ,1'bx ,1'bx ,1'bx  };   // 1'bx  
//          5'h05  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'bx  ,1'bx  ,1'bx ,1'bx ,1'bx  };   // 1'bx  
//          5'h06  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'b0  ,1'b0  ,1'b0 ,1'b0 ,1'b0  };   // 1'b0  
//          5'h07  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'bx  ,1'bx  ,1'bx ,1'bx ,1'bx  };   // 1'bx  
//          5'h08  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {cc[12],1'b0  ,1'b0 ,1'b0 ,1'b0  };   // 1'b0  
//          5'h09  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'b0  ,1'b0  ,cc[6],1'b0 ,1'b0  };   // 1'b0  
//          5'h0a  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {cc[12],1'b0  ,1'b0 ,1'b0 ,1'b0  };   // 1'b0  
//          5'h0b  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'b0  ,1'b0  ,1'b0 ,1'b0 ,cc[21]};   // 1'b0  
//          5'h0c  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'b0  ,1'b0  ,1'b0 ,1'b0 ,1'b0  };   // 1'b0  
//          5'h0d  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'b0  ,1'b0  ,cc[6],1'b0 ,1'b0  };   // 1'b0  
//          5'h0e  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'b0  ,1'b0  ,cc[6],1'b0 ,1'b0  };   // 1'b0  
//          5'h0f  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'b0  ,1'b0  ,cc[6],1'b0 ,1'b0  };   // 1'b0  
//          5'h10  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'b0  ,1'b0  ,1'b0 ,1'b0 ,1'b0  };   // 1'b0  
//          5'h11  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'bx  ,1'bx  ,1'bx ,1'bx ,1'bx  };   // 1'bx  
//          5'h12  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'b0  ,1'b0  ,1'b0 ,cc[3],1'b0  };   // 1'b0  
//          5'h13  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'bx  ,1'bx  ,1'bx ,1'bx ,1'bx  };   // 1'bx  
//          5'h14  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'b0  ,1'b0  ,1'b0 ,1'b0 ,1'b0  };   // 1'b0  
//          5'h15  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'bx  ,1'bx  ,1'bx ,1'bx ,1'bx  };   // 1'bx  
//          5'h16  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'b0  ,cc[8] ,1'b0 ,1'b0 ,1'b0  };   // 1'b0  
//          5'h17  : {e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'bx  ,1'bx  ,1'bx ,1'bx ,1'bx  };   // 1'bx  
//          default :{e27_cc12, e27_cc8, e27_cc6, e27_cc3, e27_cc21}  = {1'bx  ,1'bx  ,1'bx ,1'bx ,1'bx  };   // 1'bx  
//        endcase
//     end      
//  //   wire             e27_cc12 = ( inx == 8 || inx == 10 || inx == 24 || inx == 26 ) ? cc[12] : 0;
//  //   wire             e27_cc8  = ( inx == 0 || inx == 22 ) ? cc[8] : 0;
//  //   wire             e27_cc6  = ( inx == 9  || inx == 13 || inx == 14 || inx == 15 ||
//  //                                 inx == 25 || inx == 29 || inx == 30 || inx == 31 ) ? cc[6] : 0;
//  //   wire             e27_cc3  = ( inx == 18 ) ? cc[3] : 0;
//  //   wire             e27_cc36 = e31_cc36;
//  //   wire             e27_cc21 = ( inx == 11 ) ? cc[21] : 0;
//     assign e[27] = e27_cc12 | e27_cc8 | e27_cc6 | e27_cc3 | e27_cc36 | e27_cc21;
//  
//  
//     reg e26_cc12, e26_cc7, e26_cc5, e26_cc2, e26_cc36, e26_cc22;
//     always @(*) begin
//        e26_cc12 = e27_cc12;
//        e26_cc36 = e31_cc36;
//        case (inx )
//          5'h00  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {cc[7] ,1'b0 ,1'b0 ,1'b0  };   // 1'b0  
//          5'h01  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'bx  ,1'bx ,1'bx ,1'bx  };   // 1'bx  
//          5'h02  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'b0  ,cc[5],1'b0 ,1'b0  };   // 1'b0  
//          5'h03  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'bx  ,1'bx ,1'bx ,1'bx  };   // 1'bx  
//          5'h04  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'bx  ,1'bx ,1'bx ,1'bx  };   // 1'bx  
//          5'h05  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'bx  ,1'bx ,1'bx ,1'bx  };   // 1'bx  
//          5'h06  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'b0  ,cc[5],1'b0 ,1'b0  };   // 1'b0  
//          5'h07  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'bx  ,1'bx ,1'bx ,1'bx  };   // 1'bx  
//          5'h08  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'b0  ,1'b0 ,1'b0 ,1'b0  };   // 1'b0  
//          5'h09  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {cc[7] ,1'b0 ,1'b0 ,1'b0  };   // 1'b0  
//          5'h0a  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'b0  ,1'b0 ,1'b0 ,1'b0  };   // 1'b0  
//          5'h0b  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'b0  ,1'b0 ,1'b0 ,cc[22]};   // 1'b0  
//          5'h0c  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'b0  ,1'b0 ,1'b0 ,1'b0  };   // 1'b0  
//          5'h0d  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {cc[7] ,1'b0 ,1'b0 ,1'b0  };   // 1'b0  
//          5'h0e  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'b0  ,cc[5],1'b0 ,1'b0  };   // 1'b0  
//          5'h0f  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'b0  ,cc[5],1'b0 ,1'b0  };   // 1'b0  
//          5'h10  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'b0  ,1'b0 ,1'b0 ,1'b0  };   // 1'b0  
//          5'h11  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'bx  ,1'bx ,1'bx ,1'bx  };   // 1'bx  
//          5'h12  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'b0  ,1'b0 ,cc[2],1'b0  };   // 1'b0  
//          5'h13  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'bx  ,1'bx ,1'bx ,1'bx  };   // 1'bx  
//          5'h14  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'b0  ,1'b0 ,1'b0 ,1'b0  };   // 1'b0  
//          5'h15  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'bx  ,1'bx ,1'bx ,1'bx  };   // 1'bx  
//          5'h16  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {cc[7] ,1'b0 ,1'b0 ,1'b0  };   // 1'b0  
//          5'h17  : {e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'bx  ,1'bx ,1'bx ,1'bx  };   // 1'bx  
//          default :{e26_cc7, e26_cc5, e26_cc2, e26_cc22}  = {1'bx  ,1'bx ,1'bx ,1'bx  };   // 1'bx  
//        endcase
//     end      
//  //   wire             e26_cc12 = e27_cc12;
//  //   wire             e26_cc7 =  ( inx == 0 || inx == 9 || inx == 13 || inx == 22 ) ? cc[7] : 0;
//  //   wire             e26_cc5 = ( inx == 2 || inx == 6 || inx == 14 || inx == 15) ? cc[5] : 0;
//  //   wire             e26_cc22 = ( inx == 11 ) ? cc[22] : 0;
//  //   wire             e26_cc36 = e31_cc36;
//  //   wire             e26_cc2 = ( inx == 18) ? cc[2] : 0;
//     assign e[26] = e26_cc12 | e26_cc7 | e26_cc5 | e26_cc2 | e26_cc36 | e26_cc22;
//     
//     reg e25_cc12, e25_cc2, e25_cc23, e25_cc36;
//     always @(*) begin
//        e25_cc36 = e31_cc36;
//        case (inx )
//          5'h00  : {e25_cc12, e25_cc2, e25_cc23}  = {cc[12],1'b0 ,1'b0  };   // 1'b0  
//          5'h01  : {e25_cc12, e25_cc2, e25_cc23}  = {1'bx  ,1'bx ,1'bx  };   // 1'bx  
//          5'h02  : {e25_cc12, e25_cc2, e25_cc23}  = {cc[12],1'b0 ,1'b0  };   // 1'b0  
//          5'h03  : {e25_cc12, e25_cc2, e25_cc23}  = {1'bx  ,1'bx ,1'bx  };   // 1'bx  
//          5'h04  : {e25_cc12, e25_cc2, e25_cc23}  = {1'bx  ,1'bx ,1'bx  };   // 1'bx  
//          5'h05  : {e25_cc12, e25_cc2, e25_cc23}  = {1'bx  ,1'bx ,1'bx  };   // 1'bx  
//          5'h06  : {e25_cc12, e25_cc2, e25_cc23}  = {cc[12],1'b0 ,1'b0  };   // 1'b0  
//          5'h07  : {e25_cc12, e25_cc2, e25_cc23}  = {1'bx  ,1'bx ,1'bx  };   // 1'bx  
//          5'h08  : {e25_cc12, e25_cc2, e25_cc23}  = {cc[12],1'b0 ,1'b0  };   // 1'b0  
//          5'h09  : {e25_cc12, e25_cc2, e25_cc23}  = {1'b0  ,cc[2],1'b0  };   // 1'b0  
//          5'h0a  : {e25_cc12, e25_cc2, e25_cc23}  = {cc[12],1'b0 ,1'b0  };   // 1'b0  
//          5'h0b  : {e25_cc12, e25_cc2, e25_cc23}  = {1'b0  ,1'b0 ,cc[23]};   // 1'b0  
//          5'h0c  : {e25_cc12, e25_cc2, e25_cc23}  = {1'b0  ,1'b0 ,1'b0  };   // 1'b0  
//          5'h0d  : {e25_cc12, e25_cc2, e25_cc23}  = {1'b0  ,cc[2],1'b0  };   // 1'b0  
//          5'h0e  : {e25_cc12, e25_cc2, e25_cc23}  = {1'b0  ,cc[2],1'b0  };   // 1'b0  
//          5'h0f  : {e25_cc12, e25_cc2, e25_cc23}  = {1'b0  ,cc[2],1'b0  };   // 1'b0  
//          5'h10  : {e25_cc12, e25_cc2, e25_cc23}  = {1'b0  ,1'b0 ,1'b0  };   // 1'b0  
//          5'h11  : {e25_cc12, e25_cc2, e25_cc23}  = {1'bx  ,1'bx ,1'bx  };   // 1'bx  
//          5'h12  : {e25_cc12, e25_cc2, e25_cc23}  = {cc[12],1'b0 ,1'b0  };   // 1'b0  
//          5'h13  : {e25_cc12, e25_cc2, e25_cc23}  = {1'bx  ,1'bx ,1'bx  };   // 1'bx  
//          5'h14  : {e25_cc12, e25_cc2, e25_cc23}  = {1'b0  ,1'b0 ,1'b0  };   // 1'b0  
//          5'h15  : {e25_cc12, e25_cc2, e25_cc23}  = {1'bx  ,1'bx ,1'bx  };   // 1'bx  
//          5'h16  : {e25_cc12, e25_cc2, e25_cc23}  = {cc[12],1'b0 ,1'b0  };   // 1'b0  
//          5'h17  : {e25_cc12, e25_cc2, e25_cc23}  = {1'bx  ,1'bx ,1'bx  };   // 1'bx  
//          default :{e25_cc12, e25_cc2, e25_cc23}  = {1'bx  ,1'bx ,1'bx  };   // 1'bx  
//        endcase
//     end      
//  //   wire             e25_cc12 = ( inx == 0 || inx == 2 || inx == 6 || inx == 8 || inx == 10 || inx == 18 || inx == 22 ) ? cc[12] : 0;
//  //   wire             e25_cc2  = ( inx == 9 || inx == 13 || inx == 14 || inx == 15 ) ? cc[2] : 0;
//  //   wire             e25_cc23 = ( inx == 11 ) ? cc[23] : 0;
//  //   wire             e25_cc36 = e31_cc36;
//     assign e[25] = e25_cc12 | e25_cc2 | e25_cc23 | e25_cc36;
//                
//     reg e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44;
//     always @(*) begin
//        case ( inx )
//          5'h00  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { cc[11],1'b0  ,1'b0  ,1'b0  ,1'b0  }; // 1'b0  
//          5'h01  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  }; // 1'bx  
//          5'h02  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { cc[11],1'b0  ,1'b0  ,1'b0  ,1'b0  }; // 1'b0  
//          5'h03  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  }; // 1'bx  
//          5'h04  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  }; // 1'bx  
//          5'h05  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  }; // 1'bx  
//          5'h06  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  }; // 1'b0  
//          5'h07  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  }; // 1'bx  
//          5'h08  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'b0  ,cc[6] ,1'b0  ,1'b0  ,1'b0  }; // 1'b0  
//          5'h09  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { cc[11],1'b0  ,1'b0  ,1'b0  ,1'b0  }; // 1'b0  
//          5'h0a  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'b0  ,cc[6] ,1'b0  ,1'b0  ,1'b0  }; // 1'b0  
//          5'h0b  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'b0  ,1'b0  ,cc[24],1'b0  ,1'b0  }; // 1'b0  
//          5'h0c  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'b0  ,1'b0  ,1'b0  ,cc[38],1'b0  }; // 1'b0  
//          5'h0d  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { cc[11],1'b0  ,1'b0  ,1'b0  ,1'b0  }; // 1'b0  
//          5'h0e  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  }; // 1'b0  
//          5'h0f  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'b0  ,1'b0  ,1'b0  ,1'b0  ,1'b0  }; // 1'b0  
//          5'h10  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'b0  ,cc[6] ,1'b0  ,1'b0  ,1'b0  }; // 1'b0  
//          5'h11  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  }; // 1'bx  
//          5'h12  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'b0  ,cc[6] ,1'b0  ,1'b0  ,1'b0  }; // 1'b0  
//          5'h13  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  }; // 1'bx  
//          5'h14  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'b0  ,1'b0  ,1'b0  ,1'b0  ,cc[44]}; // 1'b0  
//          5'h15  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  }; // 1'bx  
//          5'h16  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'b0  ,cc[6] ,1'b0  ,1'b0  ,1'b0  }; // 1'b0  
//          5'h17  : {e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  }; // 1'bx  
//          default :{e24_cc11, e24_cc6, e24_cc24, e24_cc38, e24_cc44} = { 1'bx  ,1'bx  ,1'bx  ,1'bx  ,1'bx  }; // 1'bx  
//            endcase
//     end        
//  //   wire             e24_cc11 = ( inx == 0 || inx == 2 || inx == 9 || inx == 13 ) ? cc[11] : 0;
//  //   wire             e24_cc6  = ( inx == 8 || inx == 10 || inx == 16 || inx == 18 || inx == 22 ) ? cc[6] : 0;
//  //   wire             e24_cc24 = ( inx == 11 || inx == 27 ) ? cc[24] : 0;
//  //   wire             e24_cc38 = ( inx == 12 || inx == 28 ) ? cc[38] : 0;
//  //   wire             e24_cc44 = ( inx == 20 ) ? cc[44] : 0;
//     assign e[24] = e24_cc11 | e24_cc6 | e24_cc24 | e24_cc38 | e24_cc44;
                  
   // e[23]
   wire             e23_cc5  = ( inx == 0 || inx == 8 || inx == 9 || inx == 10 || inx == 13 || inx == 16 || inx == 18 || inx == 22 ) ? cc[5] : 0;
   wire             e23_cc10 = ( inx == 2 ) ? cc[10] : 0;
   wire             e23_1    = ( inx == 6 ) ? 1 : 0;
   wire             e23_cc25 = ( inx == 11 ) ? cc[25] : 0;
   wire             e23_cc39 = ( inx == 12 ) ? cc[39] : 0;
   wire             e23_cc45 = ( inx == 20 ) ? cc[45] : 0;
   always @(*) begin
      e[23] = e23_cc5 | e23_cc10 | e23_1 | e23_cc25 | e23_cc39 | e23_cc45;
   end
   
   // e[22]
   wire             e22_cc6  = ( inx == 0 || inx == 2 ) ? cc[6] : 0;
   wire             e22_cc4  = ( inx == 6 || inx == 8 || inx == 9 || inx == 10 || inx == 12 || inx == 13 || inx == 16 || inx == 18 || inx == 22 ) ? cc[4] : 0;
   wire             e22_cc25 = e23_cc25;
   wire             e22_cc46 = ( inx == 20 ) ? cc[46] : 0;
   always @(*) begin
      e[22] = e22_cc6 | e22_cc4 | e22_cc25 | e22_cc46;
   end
   
   // e[21]
   wire             e21_cc3  = ( inx == 6 || inx == 8 || inx == 9 || inx == 10 || inx == 12 || inx == 13 || inx == 16 || inx == 22 ) ? cc[3] : 0;
   wire             e21_cc25 = e23_cc25;
   wire             e21_cc47 = ( inx == 20 ) ? cc[47] : 0;
   always @(*) begin
      e[21] = e21_cc3 | e21_cc25 | e21_cc47;
   end
        
   // e[20]
   wire             e20_cc2  = ( inx == 6 || inx == 8 || inx == 10 || inx == 12 || inx == 16 || inx == 22 ) ? cc[2] : 0;
   wire             e20_cc12 = ( inx == 9 || inx == 13 ) ? cc[12] : 0;
   wire             e20_cc25 = e23_cc25;
   wire             e20_cc48 = ( inx == 20 ) ? cc[48] : 0;
   always @(*) begin
      e[20] = e20_cc2 | e20_cc12 | e20_cc25 | e20_cc48;
   end
   
   // e[19]
   wire             e19_cc11 = ( inx == 8 || inx == 16 ) ? cc[11] : 0;
   wire             e19_cc12 = e20_cc12;
   wire             e19_cc25 = e23_cc25;
   wire             e19_cc49 = ( inx == 20 ) ? cc[49] : 0;
   always @(*) begin
      e[19] = e19_cc11 | e19_cc12 | e19_cc25 | e19_cc49;
   end
           
   // e[18]
   wire             e18_1    = (inx == 2 || inx == 6 || inx == 12 || inx == 14 || inx == 15 ) ? 1 : 0;
   wire             e18_cc10 = ( inx == 8 || inx == 16) ? cc[10] : 0;
   wire             e18_cc12 = e20_cc12;
   wire             e18_cc25 = e23_cc25;
   wire             e18_cc50 = ( inx == 20 ) ? cc[50] : 0;
   always @(*) begin
      e[18] = e18_1 | e18_cc10 | e18_cc12 | e18_cc25 | e18_cc50;
   end
   
   // e[17]
   wire             e17_cc9  = ( inx == 2 || inx == 6 || inx == 8 || inx == 12 || inx == 14 || inx == 15 || inx == 16 ) ? cc[9] : 0;
   wire             e17_cc12 = e20_cc12;
   wire             e17_cc25 = e23_cc25;
   wire             c17_cc51 = ( inx == 20 ) ? cc[51] : 0;
   always @(*) begin
      e[17] = e17_cc9 | e17_cc12 | e17_cc25 | c17_cc51;
   end
              
   // e[16]
   wire             e16_1    = ( inx == 0 || inx == 18 || inx == 22 ) ? 1 : 0;
   wire             e16_cc8  = ( inx == 2 || inx == 6 || inx == 8 || inx == 12 || inx == 14 || inx == 15 || inx == 16 ) ? cc[8] : 0;
   wire             e16_cc12 = e20_cc12;
   wire             e16_cc26 = ( inx == 11 ) ? cc[26] : 0;
   wire             e16_cc52 = ( inx == 20 ) ? cc[52] : 0;
   always @(*) begin
      e[16] = e16_1 | e16_cc8 | e16_cc12 | e16_cc26 | e16_cc52;
   end
   
   always @(*) begin
      e[15:0] = 0;
   end
   
endmodule
   
        
