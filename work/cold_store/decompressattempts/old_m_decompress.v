/* Droodleing to see what is needed to support compressed instructions.
 */

/* Translations:

From spec 2.2:

illegal    000 00000000                 000  00
C.ADDI4SPN 000 nzuimm[5:4|9:6|2|3]      rd'  00
C.LW       010 uimm[5:3] rs1' uimm[2|6] rd'  00
C.SW       110 uimm[5:3] rs1' uimm[2|6] rs2' 00

C.NOP      000 0         00000            00000            01
C.ADDI     000 nzimm[5]  rs1/rd!=0        nzimm[4:0]       01
C.JAL      001 imm[11]   imm[4|9:8|10|6]  imm[7|3:1|5]     01
C.LI       010 imm[5]    rd!=0            imm[4:0]         01
C.ADDI16SP 011 nzimm[9]  00010            nzimm[4|6|8:7|5] 01
C.LUI      011 nzimm[17] rd!=0,2          nzimm[16:12]     01
C.SRLI     100 nzuimm[5] 00 rs1'/rd'      nzuimm[4:0]      01
C.SRAI     100 nzuimm[5] 01 rs1'/rd'      nzuimm[4:0]      01
C.ANDI     100 imm[5]    10 rs1'/rd'      imm[4:0]         01
C.SUB      100 0         11 rs1'/rd'      00 rs2'          01
C.XOR      100 0         11 rs1'/rd'      01 rs2'          01
C.OR       100 0         11 rs1'/rd'      10 rs2'          01
C.AND      100 0         11 rs1'/rd'      11 rs2'          01
C.J        101 imm[11]   imm[4|9:8|10|6]  imm[7|3:1|5]     01
C.BEQZ     110 imm[8]    imm[4:3] rs1'    imm[7:6|2:1|5]   01
C.BNEZ     111 imm[8]    imm[4:3] rs1'    imm[7:6|2:1|5]   01
C.SLLI     000 nzuimm[5] rs1/rd!=0        nzuimm[4:0]      10
C.LWSP     010 uimm[5]   rd!=0            uimm[4:2|7:6]    10
C.JR       100 0         rs1!=0           00000            10
C.MV       100 0         rd!=0            rs2!=0           10
C.EBREAK   100 1         00000            00000            10
C.JALR     100 1         rs1!=0           00000            10
C.ADD      100 1         rs1/rd!=0        rs2!=0           10
C.SWSP     110 uimm[5]   uimm[4:2|7:6]    rs2              10


Hints execute as NOPs, so some small simplifications.

C.ADDI with zzimm[5:0] == 0 is a hint, I allow C.ADDI r,0
C.NOP executes as  C.ADDI x0,0.

The illegal instruction must be recognized, we need a zero-find on
several instruction bits. Apart from this, we can legally let the
illegal instruction execute as C.ADDI4SPN rd',0, so I delete the
illegal instruction from the table

C.LI with rd==0 is a hint, I alloww C.LI x0,imm

C.ADDI16SP with nzimm == 0 is reserved, but I disregard this.
C.LUI with rd==0 is a hint, C.LUI with nzimm == 0 is is reserved,
I disregard this.

I disregard that the shift amount of C.SRLI and C.SRAI should be != 0.

C.SLLI with rs1/rd == 0  is a hint.

C.LWSP with rd==0 is reserved. I disregard this. 
C.JR with rs1 !=0 is reserved, I disregard this.
C.MV rs1 with ==0 is a hint.

C.ADDI4SPN 000 zuimm[5:4|9:6|2|3]       rd'  00
C.LW       010 uimm[5:3] rs1' uimm[2|6] rd'  00
C.SW       110 uimm[5:3] rs1' uimm[2|6] rs2' 00

C.ADDI     000 zimm[5]   rs1/rd           zimm[4:0]        01
C.JAL      001 imm[11]   imm[4|9:8|10|6]  imm[7|3:1|5]     01
C.LI       010 imm[5]    rd               imm[4:0]         01
C.ADDI16SP 011 zimm[9]   00010            zimm[4|6|8:7|5]  01
C.LUI      011 zimm[17]  rd!=2            zimm[16:12]      01
C.SRLI     100 zuimm[5]  00 rs1'/rd'      zuimm[4:0]       01
C.SRAI     100 zuimm[5]  01 rs1'/rd'      zuimm[4:0]       01
C.ANDI     100 imm[5]    10 rs1'/rd'      imm[4:0]         01
C.SUB      100 0         11 rs1'/rd'      00 rs2'          01
C.XOR      100 0         11 rs1'/rd'      01 rs2'          01
C.OR       100 0         11 rs1'/rd'      10 rs2'          01
C.AND      100 0         11 rs1'/rd'      11 rs2'          01
C.J        101 imm[11]   imm[4|9:8|10|6]  imm[7|3:1|5]     01
C.BEQZ     110 imm[8]    imm[4:3] rs1'    imm[7:6|2:1|5]   01
C.BNEZ     111 imm[8]    imm[4:3] rs1'    imm[7:6|2:1|5]   01
C.SLLI     000 uimm[5]   rs1/rd           uimm[4:0]        10
C.LWSP     010 uimm[5]   rd               uimm[4:2|7:6]    10
C.JR       100 0         rs1              00000            10
C.MV       100 0         rd               rs2!=0           10
C.EBREAK   100 1         00000            00000            10
C.JALR     100 1         rs1!=0           00000            10
C.ADD      100 1         rs1/rd!=0        rs2!=0           10
C.SWSP     110 uimm[5]   uimm[4:2|7:6]    rs2              10


Third iteration. I name bits of immediates only as ix, sign extention will be concidered later.
I name rd and rs1/rd as D4 D3 D2 D1 D0
I name rs1 as S4 S3 S2 S1 S0
I name rs2 as T4 T3 T2 T1 T0
I name rd' and rs1'/rd' as d2 d1 d0
I name rs1' as t2 t1 t0
I name rs2' as s2 s1 s0

I for the time being removes information on rs1!=0 etc, and present:

              15:13
          1:0 |||  12  11 10  9   8  7   6   5  4    3   2  
           -- ---  --  -- -- --  -- --  --  --  --  --  --
C.ADDI4SPN 00 000  i5  i4 i9 i8  i7 i6  i2  i3  d2  d1  d0  
C.LW       00 010  i5  i4 i3 t2  t1 t0  i2  i6  d2  d1  d0  
C.SW       00 110  i5  i4 i3 t2  t1 t0  i2  i6  s2  s1  s0  
C.ADDI     01 000  i5  D4 D3 D2  D1 D0  i4  i4  i2  i1  i0  
C.JAL      01 001 i11  i4 i9 i8 i10 i6  i7  i3  i2  i1  i5  
C.LI       01 010  i5  D4 D3 D2  D1 D0  i4  i3  i2  i1  i0  
C.ADDI16SP 01 011  i9   0  0  0   1  0  i4  i6  i8  i7  i5  
C.LUI      01 011 i17  D4 D3 D2  D1 D0 i16 i15 i14 i13 i12 
C.SRLI     01 100  i5   0  0 d2  d1 d0  i4  i3  i2  i1  i0  
C.SRAI     01 100  i5   0  1 d2  d1 d0  i4  i3  i2  i1  i0  
C.ANDI     01 100  i5   1  0 d2  d1 d0  i4  i3  i2  i1  i0  
C.SUB      01 100   0   1  1 d2  d1 d0   0   0  s2  s1  s0  
C.XOR      01 100   0   1  1 d2  d1 d0   0   1  s2  s1  s0  
C.OR       01 100   0   1  1 d2  d1 d0   1   0  s2  s1  s0  
C.AND      01 100   0   1  1 d2  d1 d0   1   1  s2  s1  s0  
C.J        01 101 i11  i4 i9 i8 i10 i6  i7  i3  i2  i1  i5  
C.BEQZ     01 110  i8  i4 i3 t2  t1 t0  i7  i6  i2  i1  i5  
C.BNEZ     01 111  i8  i4 i3 t2  t1 t0  i7  i6  i2  i1  i5  
C.SLLI     10 000  i5  D4 D3 D2  D1 D0  i4  i3  i2  i1  i0  
C.LWSP     10 010  i5  D4 D3 D2  D1 D0  i4  i3  i2  i7  i6  
C.JR       10 100   0  S4 S3 S2  S1 S0   0   0   0   0   0  
C.MV       10 100   0  D4 D3 D2  D1 D0  T4  T3  T2  T1  T0  
C.EBREAK   10 100   1   0  0  0   0  0   0   0   0   0   0  
C.JALR     10 100   1  S4 S3 S2  S1 S0   0   0   0   0   0             
C.ADD      10 100   1  D4 D3 D2  D1 D0  T4  T3  T2  T1  T0    
C.SWSP     10 110  i5  i4 i3 i2  i7 i6  T4  T3  T2  T1  T0    


Format          Instruction                                           Translation      
                    15:13
                1:0 |||  12  11 10  9   8  7   6   5  4    3   2    *  31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11 10 9  8  7  6 5 4 3 2  
                 -- ---  --  -- -- --  -- --  --  --  --  --  --    *  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  -- -- -- -- -- - - - - -
?     C.EBREAK   10 100   1   0  0  0   0  0   0   0   0   0   0    *   0   0   0   0   0   0   0   0   0   0   0   1   0   0   0   0   0   0   0   0   0  0  0  0  0 1 1 1 0 0  EBREAK
CB    C.ANDI     01 100  i5   1  0 d2  d1 d0  i4  i3  i2  i1  i0    *  i5  i5  i5  i5  i5  i5  i5  i4  i3  i2  i1  i0   0   1  d2  d1  d0   1   1   1   0  1 d2 d1 d0 0 0 1 0 0  ANDI
CB    C.BEQZ     01 110  i8  i4 i3 t2  t1 t0  i7  i6  i2  i1  i5    *  i8  i8  i8  i8  i7  i6  i5   0   0   0   0   0   0   1  t2  t1  t0   0   0   0  i4 i3 i2 i1 i8 1 1 0 0 0  BEQ
CB    C.BNEZ     01 111  i8  i4 i3 t2  t1 t0  i7  i6  i2  i1  i5    *  i8  i8  i8  i8  i7  i6  i5   0   0   0   0   0   0   1  t2  t1  t0   0   0   1  i4 i3 i2 i1 i8 1 1 0 0 0  BNE
CB    C.SRAI     01 100  i5   0  1 d2  d1 d0  i4  i3  i2  i1  i0    *   0   1   0   0   0   0   0  i4  i3  i2  i1  i0   0   1  d2  d1  d0   1   0   1   0  1 d2 d1 d0 0 0 1 0 0  SRAI
CB    C.SRLI     01 100  i5   0  0 d2  d1 d0  i4  i3  i2  i1  i0    *   0   0   0   0   0   0   0  i4  i3  i2  i1  i0   0   1  d2  d1  d0   1   0   1   0  1 d2 d1 d0 0 0 1 0 0  SRLI
CI    C.ADDI     01 000  i5  D4 D3 D2  D1 D0  i4  i3  i2  i1  i0    *  i5  i5  i5  i5  i5  i5  i5  i4  i3  i2  i1  i0  D4  D3  D2  D1  D0   0   0   0  D4 D3 D2 D1 D0 0 0 1 0 0  ADDI   
CI    C.ADDI16SP 01 011  i9   0  0  0   1  0  i4  i6  i8  i7  i5    *  i9  i9  i9  i8  i7  i6  i5  i4   0   0   0   0   0   0   0   1   0   0   0   0   0  0  0  1  0 0 0 1 0 0  ADDI
CI    C.LI       01 010  i5  D4 D3 D2  D1 D0  i4  i3  i2  i1  i0    *  i5  i5  i5  i5  i5  i5  i5  i4  i3  i2  i1  i0   0   0   0   0   0   0   0   0  D4 D3 D2 D1 D0 0 0 1 0 0  ADDI
CI    C.LUI      01 011 i17  D4 D3 D2  D1 D0 i16 i15 i14 i13 i12    * i17 i17 i17 i17 i17 i17 i17 i17 i17 i17 i17 i17 i17 i17 i17 i16 i15 i14 i13 i12  D4 D3 D2 D1 D0 0 1 1 0 1  LUI
CI    C.LWSP     10 010  i5  D4 D3 D2  D1 D0  i4  i3  i2  i7  i6    *   0   0   0   0  i7  i6  i5  i4  i3  i2   0   0   0   0   0   1   0   0   1   0  D4 D3 D2 D1 D0 0 0 0 0 0  LW
CI    C.SLLI     10 000  i5  D4 D3 D2  D1 D0  i4  i3  i2  i1  i0    *   0   0   0   0   0   0   0  i4  i3  i2  i1  i0  D4  D3  D2  D1  D0   0   0   1  D4 D3 D2 D1 D0 0 0 1 0 0  SLLI
CIW   C.ADDI4SPN 00 000  i5  i4 i9 i8  i7 i6  i2  i3  d2  d1  d0    *   0   0  i9  i8  i7  i6  i5  i4  i3  i2   0   0   0   0   0   1   0   0   0   0   0  1 d2 d1 d0 0 0 1 0 0  ADDI    
CJ    C.J        01 101 i11  i4 i9 i8 i10 i6  i7  i3  i2  i1  i5    * i11 i10  i9  i8  i7  i6  i5  i4  i3  i2  i1 i11 i11 i11 i11 i11 i11 i11 i11 i11   0  0  0  0  0 1 1 0 1 1  JAL
CJ    C.JAL      01 001 i11  i4 i9 i8 i10 i6  i7  i3  i2  i1  i5    * i11 i10  i9  i8  i7  i6  i5  i4  i3  i2  i1 i11 i11 i11 i11 i11 i11 i11 i11 i11   0  0  0  0  1 1 1 0 1 1  JAL    
CL    C.LW       00 010  i5  i4 i3 t2  t1 t0  i2  i6  d2  d1  d0    *   0   0   0   0   0  i6  i5  i4  i3  i2   0   0   0   1  t2  t1  t0   0   1   0   0  1 d2 d1 d0 0 0 0 0 0  LW   
CR    C.ADD      10 100   1  D4 D3 D2  D1 D0  T4  T3  T2  T1  T0    *   0   0   0   0   0   0   0  T4  T3  T2  T1  T0  D4  D3  D2  D1  D0   0   0   0  D4 D3 D2 D1 D0 0 1 1 0 0  ADD
CR    C.JALR     10 100   1  S4 S3 S2  S1 S0   0   0   0   0   0    *   0   0   0   0   0   0   0   0   0   0   0   0  S4  S3  S2  S1  S0   0   0   0   0  0  0  0  1 1 1 0 0 1  JALR
CR    C.JR       10 100   0  S4 S3 S2  S1 S0   0   0   0   0   0    *   0   0   0   0   0   0   0   0   0   0   0   0  S4  S3  S2  S1  S0   0   0   0   0  0  0  0  0 1 1 0 0 1  JALR
CR    C.MV       10 100   0  D4 D3 D2  D1 D0  T4  T3  T2  T1  T0    *   0   0   0   0   0   0   0  T4  T3  T2  T1  T0   0   0   0   0   0   0   0   0  D4 D3 D2 D1 D0 0 1 1 0 0  ADD
CS    C.AND      01 100   0   1  1 d2  d1 d0   1   1  s2  s1  s0    *   0   0   0   0   0   0   0   0   1  s2  s1  s0   0   1  d2  d1  d0   1   1   1   0  1 d2 d1 d0 0 1 1 0 0  AND
CS    C.OR       01 100   0   1  1 d2  d1 d0   1   0  s2  s1  s0    *   0   0   0   0   0   0   0   0   1  s2  s1  s0   0   1  d2  d1  d0   1   1   0   0  1 d2 d1 d0 0 1 1 0 0  OR
CS    C.SUB      01 100   0   1  1 d2  d1 d0   0   0  s2  s1  s0    *   0   1   0   0   0   0   0   0   1  s2  s1  s0   0   1  d2  d1  d0   0   0   0   0  1 d2 d1 d0 0 1 1 0 0  SUB
CS    C.SW       00 110  i5  i4 i3 t2  t1 t0  i2  i6  s2  s1  s0    *   0   0   0   0   0  i6  i5   0   1  s2  s1  s0   0   1  t2  t1  t0   0   1   0  i4 i3 i2  0  0 0 1 0 0 0  SW     
CS    C.XOR      01 100   0   1  1 d2  d1 d0   0   1  s2  s1  s0    *   0   0   0   0   0   0   0   0   1  s2  s1  s0   0   1  d2  d1  d0   1   0   0   0  1 d2 d1 d0 0 1 1 0 0  XOR
CSS   C.SWSP     10 110  i5  i4 i3 i2  i7 i6  T4  T3  T2  T1  T0    *   0   0   0   0  i7  i6  i5  T4  T3  T2  T1  T0   0   0   0   1   0   0   1   0  i4 i3 i2  0  0 0 1 0 0 0  SW     
 

Destination bit
|    Sources
e31: b12,   0
e30: b12,  b8,  0
e29: b12, b10,  0, 1
e28: b12,  b9, b4, 0
e27: b12,  b8, b6, b3, 0
e26: b12,  b7, b5, b0, 0
e25: b12,  b0,  0
e24: b12, b11, b6, 0
e23: b12, b10, b5, 1,  0
e22: b12,  b6, b4, 0
e21: b12,  b3,  0
e20: b12,  b2,  1, 0
e19: b12, b11,  0
e18: b12, b10,  1, 0
e17: b12,  b9,  0
e16: b12,  b8, b6, 1,  0
e15: b12,  b7, b5, 0
e14: b12,  b4,  1, 0
e13: b12,  b3,  1, 0
e12: b12,  b2,  1, 0
e11: b11,   0
e10: b10,   1,  0   
e9 :  b9,  b4,  0            error
e8 :  b8,  b3,  1, 0
e7 :  b8,  b7, b2, 1,  0     error



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
      OpFetch
      | Di[1:0] == 2'b11
      | | Di[17:16] == 2'b11        
      | | | PC[1]      Control      NextIncPc (to be used if no PC load by instr)     
      | | | |   Next   s s s s s s  |     HoldAck
State | | | |   state  5 4 3 2 1 0  |     |   Comment
----- - ------  ----   ------- - -  ----  --  -------
A     0 x x x   A      x x x x 0 0  Hold  0   Not OpCode fetch cycle
A     1 0 x 0   B      x 0 1 1 1 1  2     0   c. instr in low hword
A     1 1 x 0   A      0 0 0 0 1 1  4     0   Normal rv32i situation
A     1 x 0 1   A      x 1 1 1 1 1  2     0   Jumped to c. instr in high hword
A     1 x 1 1   C      x 1 x 0 x 1  4     1   Jumped to rv32i instr starting in high hword 
B     0 x x x   B      x x x x 0 0  Hold  0   Not OpCode fetch cycle
B     1 0 x 0   B      x 0 1 1 1 1  2     0   Jumped to c. instr in low hword
B     1 1 x 0   B      x 0 1 1 1 1  4     0   Jumped to rv32i instr starting in low howrd
B     1 x 0 1   A      x 1 1 1 1 1  2     0   c. instr in high hword
B     1 x 1 1   C      x 1 x 0 x 1  4     1   rv32i instr starting in high hword
C     0 x x x                                 Should not occur
C     1 x x 1   B      1 x 0 x 1 0  0     0   Get high part of instr from Di[15:0]
C     1 x x 0                                 Should not occur


 
 
 

*/
module m_decompress
  (
   input [31:0]      Di,
   input             s[5:0],
   output reg [31:0] I
   };
   wire [31:0]       aDi;
   wire [31:0]       uDi;
   wire [1:0]        seltype;
   wire [4:0]        rd_rs1;
   wire              rd_rs1_EQ_2;
   
   assign aDi[31:16] = s[5] ? Di[15:0] : Di[31:16];
   assign aDi[15:0]  = s[4] ? Di[31:16] : Di[15:0];

   always @(/*AS*/Di) 
     casez ( {aDi[1:0],aDi[15:13]} )
       5'b01_011 : seltype = 2'b01;
       5'b01_100 : seltype = 2'b10;
       5'b10_100 : seltype = 2'b11;
       5'b11_??? : seltype = 2'b??;
       default   : seltype = 2'b00;
     endcase

   assign rd_rs1 = aDi[11:7];
   assign rd_rs1_EQ_2 = rd_rs1 == 5'h2 ? 1'b1 : 1'b0;
   
   always @(/*AS*/)
     if ( seltype == 2'b00 ) begin
        sel =  {Di[1:0],Di[15:13]};
     end else if ( seltype == 2'b01 ) begin
        sel =  {rd_rs1_EQ_2, Di[0], Di[15:13]};
     end else if ( seltype == 2'b10 ) begin
        
     end else begin
     end
endmodule



/*
seltype 
|            15:13
| @sel     1:0 |||  12  11 10  9   8  7   6   5  4    3   2    *  31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11 10 9  8  7  6 5 4 3 2  
- @-- ---  --  -- -- --  -- --  --  --  --  --  --    *  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  -- -- -- -- -- - - - - -
0 @00_000  00_000  i5  i4 i9 i8  i7 i6  i2  i3  d2  d1  d0    *   0   0  i9  i8  i7  i6  i5  i4  i3  i2   0   0   0   0   0   1   0   0   0   0   0  1 d2 d1 d0 0 0 1 0 0  ADDI             CIW   C.ADDI4SPN 
0 @00_010  00_010  i5  i4 i3 t2  t1 t0  i2  i6  d2  d1  d0    *   0   0   0   0   0  i6  i5  i4  i3  i2   0   0   0   1  t2  t1  t0   0   1   0   0  1 d2 d1 d0 0 0 0 0 0  LW               CL    C.LW       
0 @00_110  00_110  i5  i4 i3 t2  t1 t0  i2  i6  s2  s1  s0    *   0   0   0   0   0  i6  i5   0   1  s2  s1  s0   0   1  t2  t1  t0   0   1   0  i4 i3 i2  0  0 0 1 0 0 0  SW               CS    C.SW       
0 @01_000  01_000  i5  D4 D3 D2  D1 D0  i4  i3  i2  i1  i0    *  i5  i5  i5  i5  i5  i5  i5  i4  i3  i2  i1  i0  D4  D3  D2  D1  D0   0   0   0  D4 D3 D2 D1 D0 0 0 1 0 0  ADDI             CI    C.ADDI     
0 @01_001  01_001 i11  i4 i9 i8 i10 i6  i7  i3  i2  i1  i5    * i11 i10  i9  i8  i7  i6  i5  i4  i3  i2  i1 i11 i11 i11 i11 i11 i11 i11 i11 i11   0  0  0  0  1 1 1 0 1 1  JAL              CJ    C.JAL      
0 @01_010  01_010  i5  D4 D3 D2  D1 D0  i4  i3  i2  i1  i0    *  i5  i5  i5  i5  i5  i5  i5  i4  i3  i2  i1  i0   0   0   0   0   0   0   0   0  D4 D3 D2 D1 D0 0 0 1 0 0  ADDI             CI    C.LI       
1 @01_011  01_011  i9   0  0  0   1  0  i4  i6  i8  i7  i5    *  i9  i9  i9  i8  i7  i6  i5  i4   0   0   0   0   0   0   0   1   0   0   0   0   0  0  0  1  0 0 0 1 0 0  ADDI             CI    C.ADDI16SP 
1 @11_011  01_011 i17  D4 D3 D2  D1 D0 i16 i15 i14 i13 i12    * i17 i17 i17 i17 i17 i17 i17 i17 i17 i17 i17 i17 i17 i17 i17 i16 i15 i14 i13 i12  D4 D3 D2 D1 D0 0 1 1 0 1  LUI              CI    C.LUI      
2 @11_100  01_100   0   1  1 d2  d1 d0   0   0  s2  s1  s0    *   0   1   0   0   0   0   0   0   1  s2  s1  s0   0   1  d2  d1  d0   0   0   0   0  1 d2 d1 d0 0 1 1 0 0  SUB              CS    C.SUB      
2 @11_101  01_100   0   1  1 d2  d1 d0   0   1  s2  s1  s0    *   0   0   0   0   0   0   0   0   1  s2  s1  s0   0   1  d2  d1  d0   1   0   0   0  1 d2 d1 d0 0 1 1 0 0  XOR              CS    C.XOR      
2 @11_110  01_100   0   1  1 d2  d1 d0   1   0  s2  s1  s0    *   0   0   0   0   0   0   0   0   1  s2  s1  s0   0   1  d2  d1  d0   1   1   0   0  1 d2 d1 d0 0 1 1 0 0  OR               CS    C.OR       
2 @11_111  01_100   0   1  1 d2  d1 d0   1   1  s2  s1  s0    *   0   0   0   0   0   0   0   0   1  s2  s1  s0   0   1  d2  d1  d0   1   1   1   0  1 d2 d1 d0 0 1 1 0 0  AND              CS    C.AND      
2 @00_100  01_100  i5   0  0 d2  d1 d0  i4  i3  i2  i1  i0    *   0   0   0   0   0   0   0  i4  i3  i2  i1  i0   0   1  d2  d1  d0   1   0   1   0  1 d2 d1 d0 0 0 1 0 0  SRLI             CB    C.SRLI     
2 @00_101  01_100  i5   0  1 d2  d1 d0  i4  i3  i2  i1  i0    *   0   1   0   0   0   0   0  i4  i3  i2  i1  i0   0   1  d2  d1  d0   1   0   1   0  1 d2 d1 d0 0 0 1 0 0  SRAI             CB    C.SRAI     
2 @00_110  01_100  i5   1  0 d2  d1 d0  i4  i3  i2  i1  i0    *  i5  i5  i5  i5  i5  i5  i5  i4  i3  i2  i1  i0   0   1  d2  d1  d0   1   1   1   0  1 d2 d1 d0 0 0 1 0 0  ANDI             CB    C.ANDI     
0 @01_101  01_101 i11  i4 i9 i8 i10 i6  i7  i3  i2  i1  i5    * i11 i10  i9  i8  i7  i6  i5  i4  i3  i2  i1 i11 i11 i11 i11 i11 i11 i11 i11 i11   0  0  0  0  0 1 1 0 1 1  JAL              CJ    C.J        
0 @01_110  01_110  i8  i4 i3 t2  t1 t0  i7  i6  i2  i1  i5    *  i8  i8  i8  i8  i7  i6  i5   0   0   0   0   0   0   1  t2  t1  t0   0   0   0  i4 i3 i2 i1 i8 1 1 0 0 0  BEQ              CB    C.BEQZ     
0 @01_111  01_111  i8  i4 i3 t2  t1 t0  i7  i6  i2  i1  i5    *  i8  i8  i8  i8  i7  i6  i5   0   0   0   0   0   0   1  t2  t1  t0   0   0   1  i4 i3 i2 i1 i8 1 1 0 0 0  BNE              CB    C.BNEZ     
0 @10_000  10_000  i5  D4 D3 D2  D1 D0  i4  i3  i2  i1  i0    *   0   0   0   0   0   0   0  i4  i3  i2  i1  i0  D4  D3  D2  D1  D0   0   0   1  D4 D3 D2 D1 D0 0 0 1 0 0  SLLI             CI    C.SLLI     
0 @10_010  10_010  i5  D4 D3 D2  D1 D0  i4  i3  i2  i7  i6    *   0   0   0   0  i7  i6  i5  i4  i3  i2   0   0   0   0   0   1   0   0   1   0  D4 D3 D2 D1 D0 0 0 0 0 0  LW               CI    C.LWSP     
3 @10_100  10_100   0  D4 D3 D2  D1 D0  T4  T3  T2  T1  T0    *   0   0   0   0   0   0   0  T4  T3  T2  T1  T0   0   0   0   0   0   0   0   0  D4 D3 D2 D1 D0 0 1 1 0 0  ADD              CR    C.MV       
3 @10_100  10_100   0  S4 S3 S2  S1 S0   0   0   0   0   0    *   0   0   0   0   0   0   0   0   0   0   0   0  S4  S3  S2  S1  S0   0   0   0   0  0  0  0  0 1 1 0 0 1  JALR             CR    C.JR       
3 @10_100  10_100   1   0  0  0   0  0   0   0   0   0   0    *   0   0   0   0   0   0   0   0   0   0   0   1   0   0   0   0   0   0   0   0   0  0  0  0  0 1 1 1 0 0  EBREAK           ?     C.EBREAK   
3 @10_100  10_100   1  D4 D3 D2  D1 D0  T4  T3  T2  T1  T0    *   0   0   0   0   0   0   0  T4  T3  T2  T1  T0  D4  D3  D2  D1  D0   0   0   0  D4 D3 D2 D1 D0 0 1 1 0 0  ADD              CR    C.ADD      
3 @10_100  10_100   1  S4 S3 S2  S1 S0   0   0   0   0   0    *   0   0   0   0   0   0   0   0   0   0   0   0  S4  S3  S2  S1  S0   0   0   0   0  0  0  0  1 1 1 0 0 1  JALR             CR    C.JALR     
0 @10_110  10_110  i5  i4 i3 i2  i7 i6  T4  T3  T2  T1  T0    *   0   0   0   0  i7  i6  i5  T4  T3  T2  T1  T0   0   0   0   1   0   0   1   0  i4 i3 i2  0  0 0 1 0 0 0  SW               CSS   C.SWSP     


0 00_000
0 00_010
0 00_110
0 01_000
0 01_001
0 01_010
1 01_011
1 11_011
2 01_100
2 01_100
2 01_100
2 01_100
2 01_100
2 01_100
2 01_100
0 01_101
0 01_110
0 01_111
0 10_000
0 10_010
3 10_100
3 10_100
3 10_100
3 10_100
3 10_100
0 10_110
*/

/* With translation expressed as compressed instruction bit number. In the table 'o' is hardcoded zero, 'L' is hardcoded 1.
 
Format          Instruction                                           Translation      
                    15:13
                1:0 |||  12  11 10  9   8  7   6   5  4    3   2    *  31  30  29  28  27  26  25  24  23  22  21  20  19  18  17  16  15  14  13  12  11 10 9  8  7  6 5 4 3 2         
                 -- ---  --  -- -- --  -- --  --  --  --  --  --    *  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  --  -- -- -- -- -- - - - - -         
?     C.EBREAK   10 100   1   0  0  0   0  0   0   0   0   0   0    *   o   o   o   o   o   o   o   o   o   o   o   L   o   o   o   o   o   o   o   o   o  o  o  o  o L L L o o  EBREAK 
CB    C.ANDI     01 100  i5   1  0 d2  d1 d0  i4  i3  i2  i1  i0    *  12  12  12  12  12  12  12   6   5   4   3   2   o   L   9   8   7   L   L   L   o  L  9  8  7 o o L o o  ANDI   
CB    C.BEQZ     01 110  i8  i4 i3 t2  t1 t0  i7  i6  i2  i1  i5    *  12  12  12  12   6   5   2   o   o   o   o   o   o   L   9   8   7   o   o   o  11 10  9  3 12 L L o o o  BEQ    
CB    C.BNEZ     01 111  i8  i4 i3 t2  t1 t0  i7  i6  i2  i1  i5    *  12  12  12  12   6   5   2   o   o   o   o   o   o   L   9   8   7   o   o   L  11 10  9  3 12 L L o o o  BNE    
CB    C.SRAI     01 100  i5   0  1 d2  d1 d0  i4  i3  i2  i1  i0    *   o   L   o   o   o   o   o   6   5   4   3   2   o   L   9   8   7   L   o   L   o  L  9  8  7 o o L o o  SRAI   
CB    C.SRLI     01 100  i5   0  0 d2  d1 d0  i4  i3  i2  i1  i0    *   o   o   o   o   o   o   o   6   5   4   3   2   o   L   9   8   7   L   o   L   o  L  9  8  7 o o L o o  SRLI   
CI    C.ADDI     01 000  i5  D4 D3 D2  D1 D0  i4  i3  i2  i1  i0    *  12  12  12  12  12  12  12   6   5   4   3   2  11  10   9   8   7   o   o   o  11 10  9  8  7 o o L o o  ADDI   
CI    C.ADDI16SP 01 011  i9   0  0  0   1  0  i4  i6  i8  i7  i5    *  12  12  12   4   3   5   2   6   o   o   o   o   o   o   o   L   o   o   o   o   o  o  o  L  o o o L o o  ADDI   
CI    C.LI       01 010  i5  D4 D3 D2  D1 D0  i4  i3  i2  i1  i0    *  12  12  12  12  12  12  12   6   5   4   3   2   o   o   o   o   o   o   o   o  11 10  9  8  7 o o L o o  ADDI   
CI    C.LUI      01 011 i17  D4 D3 D2  D1 D0 i16 i15 i14 i13 i12    *  12  12  12  12  12  12  12  12  12  12  12  12  12  12  12   6   5   4   3   2  11 10  9  8  7 o L L o L  LUI    
CI    C.LWSP     10 010  i5  D4 D3 D2  D1 D0  i4  i3  i2  i7  i6    *   o   o   o   o   3   2  12   6   5   4   o   o   o   o   o   L   o   o   L   o  11 10  9  8  7 o o o o o  LW     
CI    C.SLLI     10 000  i5  D4 D3 D2  D1 D0  i4  i3  i2  i1  i0    *   o   o   o   o   o   o   o   6   5   4   3   2  11  10   9   8   7   o   o   L  11 10  9  8  7 o o L o o  SLLI   
CIW   C.ADDI4SPN 00 000  i5  i4 i9 i8  i7 i6  i2  i3  d2  d1  d0    *   o   o  10   9   8   7  12  11   5   4   o   o   o   o   o   L   o   o   o   o   o  L  4  3  2 o o L o o  ADDI    
CJ    C.J        01 101 i11  i4 i9 i8 i10 i6  i7  i3  i2  i1  i5    *  12   8  10   9   6   7   2  11   5   4   3  12  12  12  12  12  12  12  12  12   o  o  o  o  o L L o L L  JAL    
CJ    C.JAL      01 001 i11  i4 i9 i8 i10 i6  i7  i3  i2  i1  i5    *  12   8  10   9   6   7   2  11   5   4   3  12  12  12  12  12  12  12  12  12   o  o  o  o  L 1 L o L L  JAL    
CL    C.LW       00 010  i5  i4 i3 t2  t1 t0  i2  i6  d2  d1  d0    *   o   o   o   o   o   5  12  11  10   6   o   o   o   L   9   8   7   o   L   o   o  L  4  3  2 o o o o o  LW     
CR    C.ADD      10 100   1  D4 D3 D2  D1 D0  T4  T3  T2  T1  T0    *   o   o   o   o   o   o   o   6   5   4   3   2  11  10   9   8   7   o   o   o  11 10  9  8  7 o L L o o  ADD    
CR    C.JALR     10 100   1  S4 S3 S2  S1 S0   0   0   0   0   0    *   o   o   o   o   o   o   o   o   o   o   o   o  11  10   9   8   7   o   o   o   o  o  o  o  L 1 L o o L  JALR   
CR    C.JR       10 100   0  S4 S3 S2  S1 S0   0   0   0   0   0    *   o   o   o   o   o   o   o   o   o   o   o   o  11  10   9   8   7   o   o   o   o  o  o  o  o L L o o L  JALR   
CR    C.MV       10 100   0  D4 D3 D2  D1 D0  T4  T3  T2  T1  T0    *   o   o   o   o   o   o   o   6   6   4   3   2   o   o   o   o   o   o   o   o  11 10  9  8  7 o L L o o  ADD    
CS    C.AND      01 100   0   1  1 d2  d1 d0   1   1  s2  s1  s0    *   o   o   o   o   o   o   o   o   L   4   3   2   o   L   9   8   7   L   L   L   o  L  9  8  7 o L L o o  AND    
CS    C.OR       01 100   0   1  1 d2  d1 d0   1   0  s2  s1  s0    *   o   o   o   o   o   o   o   o   L   4   3   2   o   L   9   8   7   L   L   o   o  L  9  8  7 o L L o o  OR     
CS    C.SUB      01 100   0   1  1 d2  d1 d0   0   0  s2  s1  s0    *   o   L   o   o   o   o   o   o   L   4   3   2   o   L   9   8   7   o   o   o   o  L  9  8  7 o L L o o  SUB    
CS    C.SW       00 110  i5  i4 i3 t2  t1 t0  i2  i6  s2  s1  s0    *   o   o   o   o   o   5  12   o   L   4   3   2   o   L   9   8   7   o   L   o  11 10  6  o  o o L o o o  SW     
CS    C.XOR      01 100   0   1  1 d2  d1 d0   0   1  s2  s1  s0    *   o   o   o   o   o   o   o   o   L   4   3   2   o   L   9   8   7   L   o   o   o  L  9  8  7 o L L o o  XOR    
CSS   C.SWSP     10 110  i5  i4 i3 i2  i7 i6  T4  T3  T2  T1  T0    *   o   o   o   o   8   7  12   6   5   4   3   2   o   o   o   L   o   o   L   o  11 10  9  o  o o L o o o  SW     

 Dest
 31 : 12, o
 30 : 12, 8, L, o
 29 : 12, 10,o
 28 : 12, 9, 4, o
 27 : 12, 8, 6, 3, o
 26 : 12, 7, 5, 2, o
 25 : 12, 2, o
 24 : 12,11, 6, o
 23 : 12,10, 6, 5, L, o
 22 : 12, 6, 4, o
 21 : 12, 3, o
 20 : 12, 2, L, o
 19 : 12, 11,o
 18 : 12, 10,L, o
 17 : 12, 9, o
 16 : 12, 8, 6, L, o
 15 : 12, 7, 5, o
 14 : 12, 4, L, o
 13 : 12, 3, L, o
 12 : 12, 2, L, o
 11 : 11, o
 10 : 10, L, o
  9 : 8,  6, 4, o
  8 : 8,  3, L, o
  7 : 12, 7, 2, L, o
  6-2:L,  o



The following compressed instructions must be recognized. Here 'o' mean coded as 0, and 'l' mean coded as 1.
Normal numbers and letters denote fields.
According to RISC-V Instruction Set Manual Volume I: Unprivileged ISA, section 2.2: 
"The behavior upon decoding a reserved instruction is unspecified." This give me some leaway
  
 111 111                                   332222 222222 11111 111 11
 543 210 987  65 432 10                    109876 543210 98765 432 10987 6543210
 ------- ---  ---------                           
 ooo ooo ooo  oo ooo oo   illegal          oooooo oooooo ooooo ooo ooooo ooooooo  illegal
 ooo ooo ooo  oo xxx oo   reserved                                                
 ooo 549 876  23 rd' oo   C.ADDI4SPN       oo9876 5432oo ooolo ooo olttt oolooll  addi rd',x2,mzuimm[9:2]   ttt = rd'.
 ool xxx xxx  xx rd' oo   C.FLD                                                   must translate to an illegal instruction to give exception
 olo 543 rs1' 26 rd' oo   C.LW             ooooo6 5432oo olsss olo olttt oooooll  lw rd,offset[6:2](rs1)    ttt = rd', sss = rs1'
 oll xxx xxx  xx rd' oo   C.FLW                                                   must translate to an illegal instruction to give exception
 loo xxx xxx  xx xxx oo   reserved                                                
 lol xxx xxx  xx rd' oo   C.FSD                                                   must translate to an illegal instruction to give exception
 llo 543 rs1' 26 rd' oo   C.SW             ooooo6 5oottt olsss olo 432oo oloooll  sw rs2',offset[6:2](rs1')  ttt = rs2', sss = rs1'
 lll xxx xxx  xx xxx oo   C.FSW                                                   must translate to an illegal instruction to give exception
                                                  
 ooo o ooooo  ooooo  ol   C.NOP            ooooooo ooooo ooooo ooo ooooo oolooll  addi x0,x0,0.                 | These all becomes
 ooo 5 ooooo  43210  ol   C.NOP hint       5555555 43210 ooooo ooo ooooo oolooll  addi x0,x0,cte  Hint          | addi rd,rd,cte
 ooo 5 rd/rs1 43210  ol   C.ADDI           5555555 43210 rd    ooo rd    oolooll  addi rd,rd,cte. (rd==0, hint) | Constant is 6 bit signed

 ool b 498a6  73215  ol   C.JAL            ba98765 4321b bbbbb bbb oooo1 llollll  jal x1, offset[11:1]
 olo 5 rd     43210  ol   C.LI             5555555 43210 ooooo ooo rd    oolooll  addi rd,x0,imm[5:0]  (rd==0, hint)
 oll 9 2      46875  ol   C.ADDI16SP       9998765 4oooo ooolo ooo ooolo oolooll  addi x2,x2,nzimm[9:4]
 oll h rd     gfedc  ol   C.LUI            hhhhhhh hhhhh hhhgf edc rd    ollolll  lui rd,nzimm[17:12].  rd!=2. 
 loo 5 oo ttt 43210  ol   C.SRLI           ooooooo 43210 olttt lol olttt oolooll  srli rd',rd',shamt[5:0]
 loo 5 ol ttt 43210  ol   C.SRAI           olooooo 43210 olttt lol olttt oolooll  srai rd',rd',shamt[5:0]
 loo 5 lo ttt 43210  ol   C.ANDI           5555555 43210 olttt lll olttt oolooll  andi rd',rd',imm[5:0]
 loo o ll ttt oosss  ol   C.SUB            olooooo olsss olttt ooo olttt ollooll  sub t,t,s
 loo o ll ttt olsss  ol   C.XOR            olooooo olsss olttt loo olttt ollooll  xor t,t,s
 loo o ll ttt losss  ol   C.OR             olooooo olsss olttt llo olttt ollooll  or t,t,s
 loo o ll ttt llsss  ol   C.AND            olooooo olsss olttt lll olttt ollooll  and t,t,s
 loo l ll ttt xxsss  ol   reserved
 lol b 49 8a6 73215  ol   C.J              ba98765 4321b bbbbb bbb ooooo llollll  jal x0,offset]11:1]
 llo 8 43 ttt 76215  ol   C.BEQZ           8888765 ooooo olttt ooo 43218 lloooll  beq ttt,x0,offset[8:1]                  HAVE A CHOICE
 lll 8 43 ttt 76215  ol   C.BNEZ           8888765 ooooo olttt ool 43218 lloooll  bne ttt,x0,offset[8:1]                  HAVE A CHOICE
 ooo 5 rd     43210  lo   C.SLLI           ooooooo 43210 rd    ool rd    oolooll  slli rd,rd,shamt[5:0]
 ool x xx xxx xxxxx  lo   C.FLDSP                                                 must translate to an illegal instruction to give exception
 olo 5 rd     43276  lo   C.LWSP           oooo765 432oo ooolo olo rd    oooooll  lw rd,offset[7:2](x2)
 oll 5 rd     43276  lo   C.FLWSP                                                 must translate to an illegal instruction to give exception
 loo o rs1    ooooo  lo   C.JR             ooooooo ooooo rs1   ooo ooooo lloolll jalr x0,0(rs1)  (rs1 must be != 0)
 loo o rd     rs2    lo   C.MV             ooooooo rs2   ooooo ooo rd    ollooll  add rd,x0,rs2                           HAVE A CHOICE
 loo l ooooo  ooooo  lo   C.EBREAK         ooooooo ooool ooooo ooo ooooo lllooll  ebreak
 loo l rs1    ooooo  lo   C.JALR           ooooooo ooooo rs1   ooo ooolo lloolll  jalr x1,0(rs1)  (rs1 != 0)
 loo l rd     rs2    lo   C.ADD            ooooooo rs2   rd    ooo rd    ollooll  add rd,rd,rs2 (rs2 != 0)                HAVE A CHOICE
 lol x xxxxx  xxxxx  lo   C.FSDSP                                                 must translate to an illegal instruction to give exception
 llo 5 43276  rs2    lo   C.SWSP           oooo765 rs2   ooolo olo 432oo oloooll  sw rs2,offset[7:2](x2)
 lll x xxxxx  xxxxx  lo   C.FSWSP                                                 must translate to an illegal instruction to give exception
 
 The illegal instruction must be recognized, we need a zero-find on 16 bits. My current thinking is to detect any illegal instruction by
 dedicated logic, and then force m_opreg to zero with a reset. My only problem is that mtval will not be correctly updated, microcode reads a 32-bit
 quantity. Hmm. It is legal to use mtval like this: Set it to zero when an illegal instruction is encountered. This will solve my problem.
 
 01100 C.SRAI (alt) i5   0  1 d2 d1 d0 i4 i3 i2 i1 i0 | i5 i5 i5 i5 i5 i5 i5 i4 i3 i2 i1 i0  0  1 d2 d1 d0  1  0  1  0  1 d2 d1 d0 0010011  srai rd',rd',shamt[5:0]
01100 C.SRLI (alt) i5   0  0 d2 d1 d0 z4 z3 z2 z1 z0 | i5 i5 i5 i5 i5 i5 i5 i4 i3 i2 i1 z0  0  1 d2 d1 d0  1  0  1  0  1 d2 d1 d0 0010011  srli rd',rd',shamt[5:0]
01110 C.BEQZ (alt) i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | i8 i8 i8 i8 i7 i6 i5  0  0 s2 s1 s0  0  0  0  0  0  0  0  0 i4 i3 i2 i1 i8 1100011  beq x0,rs2',offset[8:1]                  
01111 C.BNEZ (alt) i8  i4 i3 s2 s1 s0 i7 i6 i2 i1 i5 | i8 i8 i8 i8 i7 i6 i5  0  0 s2 s1 s0  0  0  0  0  0  0  0  1 i4 i3 i2 i1 i8 1100011  bne x0,rs2',offset[8:1]                  
10000 C.SLLI (alt) i5  D4 D3 D2 D1 D0 i4 i3 i2 i1 i0 | i5 i5 i5 i5 i5 i5 i5 i4 i3 i2 i1 i0 D4 D3 D2 D1 D0  0  0  1 D4 D3 D2 D1 D0 0010011  slli rd,rd,shamt[5:0]
10100 C.ADD  (alt)  l  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0 D4 D3 D2 D1 D0 T4 T3 T2 T1 T0  0  0  0 D4 D3 D2 D1 D0 0110011  add rd,rd,rs2
10100 C.MV   (alt)  0  D4 D3 D2 D1 D0 T4 T3 T2 T1 T0 |  0  0  0  0  0  0  0  0  0  0  0  0 T4 T3 T2 T1 T0  0  0  0 D4 D3 D2 D1 D0 0110011  add rd,rs2,rd          
 
 */
