/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Immediate operand expander, zero-finder, and working register Q.
 * The high level code seems to work, but is some 60 LUTs larger than 
 * the low level code of 49 LUTs.
 */
module m_immexp_zfind_q
  # ( parameter HIGHLEVEL = 0 )
   (
    input [31:0]  B, //           Output from ALU
    input         clk, //         System clock
    input         sa11, //        True when immediate expand
    input         sa14, //        If high, clear Q. (enaQ must also be high)
    input         enaQ, //        Update Q
   /* verilator lint_off UNUSED */
    input [31:0]  INSTR, //       Using input [31:2] INSTRUCTION makes verilator fail in lowlevel
   /* verilator lint_on UNUSED */
    output        rzcy32, //      When 0, ADR_O==32'h0 
    output [31:0] ADR_O, //         Register used in many places, also I/O address
//    output [2:0]  dbg_itype,//    During debugging
    output        m_immexp_zfind_q_killwarnings
    );
   assign m_immexp_zfind_q_killwarnings = &INSTR[1:0];
   
   /* Instruction 
    * sa11 (immediate expand)
    * |
    * |             sa09
    * |             |sa08
    * | 65432 10    ||sa07
    * - ----- --    ---
    * 0             111   Cycle in instruction that is not decode
    * 1 00000 11    101   Load    I-type
    * 1 00100 11    101   Reg-Int I-type
    * 1 11001 11    101   JALR    I-type
    * 1 00101 11    000   AUIPC   U-type
    * 1 01000 11    100   Store   S-type
    * 1 01100 11    101   Reg-Reg I-type (may be don't care)
    * 1 01101 11    000   LUI     U-type
    * 1 11000 11    010   condb   B-type
    * 1 11011 11    001   JAL     J-type
    * 1 11100 11    101   CSR     I-type
    * 1             xxx   illegal
    * 
    */
//
//   wire sa10 = (sa09 & sa08 & sa07) | (~sa09 & ~sa08 & ~sa07);
//   wire sa31 = (sa09 & sa08 & sa07) | (~sa09 & ~sa08);
//   wire sa13 = ( sa09 & ~sa08 & I[31]) |
//        (~sa09 &  sa08 & ~sa07 & I[31]) |
//        (~sa09 & ~sa08 & (I[31] | ~sa07));
//   wire sa13b = ( sa09 & ~sa08 & I[31]) |
//        (~sa09 &  sa08 & ~sa07 & I[31]) |
//        (~sa09 & ~sa08);

   /* sa09
    * 65432     
    * 00101     0
    * 01101     0
    * 11000     0
    * 11011     0
    
    * 00000     1
    * 00100     1
    * 01000     1
    * 01100     1
    * 11001     1
    * 11100     1
    */
   
   /* sa07
    * 65432     sa07
    * -----     -
    * 00101     0   AUIPC   U-type
    * 01000     0   Store   S-type
    * 01101     0   LUI     U-type
    * 11000     0   condb   B-type

    * 00000     1   Load    I-type
    * 00100     1   Reg-Int I-type
    * 01100     1   Reg-Reg I-type (may be don't care)
    * 11001     1   JALR    I-type
    * 11011     1   JAL     J-type
    * 11100     1   CSR     I-type
    */
   generate
      if ( HIGHLEVEL != 0 ) begin
         reg [31:0] F,r_ADR_O;
         reg [2:0]  instrty;
         reg        r_rzcy32;
         wire       BisnotZero;
         
         always @(/*AS*/INSTR or sa11)
           casez ({sa11,INSTR[6:2]})
             6'b0????? : instrty = 3'b111;  //  Cycle in instruction that is not decode
             6'b100000 : instrty = 3'b101;  //  Load    I-type                         
             6'b100100 : instrty = 3'b101;  //  Reg-Int I-type                         
             6'b111001 : instrty = 3'b101;  //  JALR    I-type                         
             6'b100101 : instrty = 3'b000;  //  AUIPC   U-type                         
             6'b101000 : instrty = 3'b100;  //  Store   S-type                         
             6'b101100 : instrty = 3'b101;  //  Reg-Reg I-type (may be don't care)     
             6'b101101 : instrty = 3'b000;  //  LUI     U-type                         
             6'b111000 : instrty = 3'b010;  //  condb   B-type                         
             6'b111011 : instrty = 3'b001;  //  JAL     J-type                         
             6'b111100 : instrty = 3'b101;  //  CSR     I-type
             6'b100010 : instrty = 3'b101;  //  Custom "ij"
             default :   instrty = 3'b000;  //  illegal                                
           endcase
//         assign dbg_itype = instrty;
         
         always @(/*AS*/B or INSTR or instrty)
           casez (instrty)
             3'b000 : F = INSTR & 32'hfffff000; // U-type
             3'b001 : F = {{12{INSTR[31]}},INSTR[19:12],INSTR[20],INSTR[30:21],1'b0}; // J-type
             3'b010 : F = {{20{INSTR[31]}},INSTR[7],INSTR[30:25],INSTR[11:8],1'b0};   // B-type
             3'b100 : F = {{21{INSTR[31]}},INSTR[30:25],INSTR[11:8],INSTR[7]};        // S-type
             3'b101 : F = {{21{INSTR[31]}},INSTR[30:25],INSTR[24:20]};                // I-type
             3'b111 : F = B; // No immediate expansion
//           default :F = 32'h?;  // This line makes verilator fail -- why?
             default :F = 32'hdeadbabe; 
           endcase
         assign BisnotZero = B != 32'h0; // Note: This is NOT 100% eqivalent to the low level version, where we get it out of a carry chain.

//         assign funct7_ne_0x00000 = B[31] | |B[29:25];
//         assign rs1_funct3_rd_ne_00000_000_00000 = |B[19:7];
                                     
         
         always @(posedge clk) begin
            if ( enaQ ) begin
               if ( sa14 ) begin
                  r_ADR_O <= 32'h0;
                  r_rzcy32 <= 1'b0;
               end else begin
                  r_ADR_O <= F;
                  r_rzcy32 <= BisnotZero;
               end
            end
         end
         assign ADR_O = r_ADR_O;
         assign rzcy32 = r_rzcy32;
         
      end else begin

         wire           sa07h;
         wire           sa09,sa08,sa07;
         wire           sa09h,sa10,sa31,sa13,sa13b;
         //   wire zcy[32:0];         Verilator throws an UNOPTFLAT warning at this. Because I must write
         //   assign zcy[0] = 1'b0;   so many lines anyway, I chose to split out the signals to avoid the warning.
         wire           zcy32,zcy31,zcy30,
                        zcy29,zcy28,zcy27,zcy26,zcy25,zcy24,zcy23,zcy22,zcy21,zcy20,
                        zcy19,zcy18,zcy17,zcy16,zcy15,zcy14,zcy13,zcy12,zcy11,zcy10,
                        zcy9,zcy8,zcy7,zcy6,zcy5,zcy4,zcy3,zcy2,zcy1,zcy0;   
         wire           imm0a,imm1a,imm2a,imm3a,imm4a,imm11a,imm11b,BisnotZero;
         wire [31:0]    F;
         genvar         j;

         SB_LUT4 # (.LUT_INIT(16'hee45)) L_1598(.O(sa07h),.I3(INSTR[6]),.I2(INSTR[5]),.I1(INSTR[4]),.I0(INSTR[2]));
         SB_LUT4 # (.LUT_INIT(16'hf0ff)) l_sa07(.O(sa07), .I3(sa11), .I2(sa07h), .I1(1'b0), .I0(1'b0));
         SB_LUT4 # (.LUT_INIT(16'h10ff)) L_1599(.O(sa08),.I3(sa11),.I2(INSTR[6]),.I1(INSTR[4]),.I0(INSTR[2]));             
         SB_LUT4 # (.LUT_INIT(16'hf255)) l_sa09h(.O(sa09h),.I3(INSTR[6]),.I2(INSTR[4]),.I1(INSTR[3]),.I0(INSTR[2]));
         SB_LUT4 # (.LUT_INIT(16'hf0ff)) l_sa09(.O(sa09), .I3(sa11), .I2(sa09h), .I1(1'b0), .I0(1'b0));
         SB_LUT4 # (.LUT_INIT(16'h8181)) L_1603(.O(sa10),.I3(1'b0),.I2(sa09),.I1(sa08),.I0(sa07));                            
         SB_LUT4 # (.LUT_INIT(16'h8383)) L_1604(.O(sa31),.I3(1'b0),.I2(sa09),.I1(sa08),.I0(sa07));                            
         SB_LUT4 # (.LUT_INIT(16'h0a2b)) L_1605(.O(sa13),.I3(sa09),.I2(sa08),.I1(sa07),.I0(INSTR[31]));                    
         SB_LUT4 # (.LUT_INIT(16'h0a2f)) L_1606(.O(sa13b),.I3(sa09),.I2(sa08),.I1(sa07),.I0(INSTR[31]));          
         
//         assign dbg_itype = { sa09,sa08,sa07};
/*                                                          
 * Immediate expansion is combined with zero-detect of the ALU result.
 * Drawing is not 100% correct, but give the idea.
 *
 *                                                   ___
 *                                               ---|O0 |
 *                                               ---|I1 |-- is_brcond
 *                                               ---|I2 | 
 *                                               +--|I3_|   
 *                                               | zcy[32]
 *                                              /y\  ___            sa10 
 *                               LoadImmD[31] --(((-|O0 |           |sa13
 *                                      B[31] --((+-|I1 |-- F[31]   ||     F[31]
 *                                       sa10 --+(--|I2 |           00     0 = LoadImmD[31]
 *                                       sa13 ---(--|I3_|           01     1 = LoadImmD[31] 
 *                                               |                  10     B[31]  
 *                                               |                  11     LoadImmD[31]
 *                                               |
 *                                               |                  sa10
 *                                              /y\  ___            |sa13         
 *                               LoadImmD[30] --(((-|O0 |           ||     F[30] 
 *                                      B[30] --((+-|I1 |-- F[30]   00     0 = LoadImmD[31]
 *                                       sa10 --+(--|I2 |           01     1 = LoadImmD[31]
 *                                       sa13 ---(--|I3_|           10     B[30]  
 *                                               |                  11     LoadImmD[30]
 *                                               |
 *                                               :                  sa10
 *                                              /y\  ___            |sa13
 *                               LoadImmD[20] --(((-|O0 |           ||     F[20]
 *                                      B[20] --((+-|I1 |-- F[20]   00     0 == LoadImmD[31]
 *                                       sa10 --+(--|I2 |           01     B[20]  
 *                                       sa13 ---(--|I3_|           10     1 == LoadImmD[31]
 *                                               |                  11     LoadImmD[20]
 *                                               |
 *                                              /y\  ___            sa31
 *                               LoadImmD[19] --(((-|O0 |           |sa13  F[19]
 *                                      B[19] --((+-|I1 |-- F[19]   00     0 == LoadImmD[31]    
 *                                       sa31 --+(--|I2 |           01     B[19]  
 *                                       sa13 ---(--|I3_|           10     1 == LoadImmD[31]
 *                                               |                  11     LoadImmD[19]
 *                                               :
 *                                              /y\  ___            sa13          
 *                               LoadImmD[12] --(((-|O0 |           |sa31  F[12]  
 *                                      B[12] --((+-|I1 |-- F[12]   00     0  == LoadImmD[31] 
 *                                       sa31 --+(--|I2 |           01     B[12]  
 *                                       sa13 ---(--|I3_|           10     1  == LoadImmD[31] 
 *                                               |                  11     LoadImmD[12]
 *                                               |
 *                               ___            /y\  ___            sa09
 *                 LoadImmD[7] -|O0 |---b-------(((-|O0 |           |sa08
 *                LoadImmD[31] -|I1 |   B[11] --((+-|I1 |-- F[11]   ||sa07    a            b            F[11]  = a&b&B[11] | ~a&b | ~b&a
 *                        sa08 -|I2 |      1  --+(--|I2 |           000       0            0            0     
 *                        sa09 -|I3_| +-a--------(--|I3_|           001       LoadImmD[20] 0            LoadImmD[20] *                       B[11]                     
 *                                    |          |                  010       0            LoadImmD[7]  LoadImmD[7]  *                     a1|b                        
 *                               ___  |          |                  100       0            LoadImmD[31] LoadImmD[31] *      a         b    ||||  F[11]                 
 *                LoadImmD[20] -|O0 |-+          |                  101       0            LoadImmD[31] LoadImmD[31] * 0000 0    0000  0   0000 x                      
 *                        sa07 -|I1 |            |                  111       1            1            B[11]        * 0001 0    0001  0   0001 x                      
 *                        sa08 -|I2 |            |                                                                   * 0010  0   0010  0   0010 x                      
 *                        sa09 -|I3_|            |                                                                   * 0011  1   0011  0   0011 x                      
 *                                              /y\  ___            sa10                                             * 0100 0    0100 0    0100                        
 *                               LoadImmD[30] --(((-|O0 |           |sa09 F[10]                                      * 0101 0    0101 1    0101  1                     
 *                                      B[10] --((+-|I1 |-- F[10]   00    LoadImmD[30]                               * 0110      0110 0    0110                        
 *                                       sa09 --+(--|I2 |           01    LoadImmD[30]                               * 0111      0111 1    0111  1                     
 *                                       sa10 ---(--|I3_|           10    0                                          * 1000 0    1000  0   1000 x                      
 *                                               |                  11    B[10]                                      * 1001 0    1001  0   1001 x                      
 *                                               :                                                                   * 1010 0    1010  1   1010 x                      
 *                                              /y\  ___            sa10                                             * 1011 0    1011  1   1011 x                      
 *                               LoadImmD[25] --(((-|O0 |           |sa09 F[5]                                       * 1100      1100 1    1100   1                    
 *                                       B[5] --((+-|I1 |-- F[5]    00    LoadImmD[25]                               * 1101      1101 1    1101  0                     
 *                                       sa09 --+(--|I2 |           01    LoadImmD[25]                               * 1110 1    1110 1    1110   1                    
 *                                       sa10 ---(--|I3_|           10    0                                          * 1111 1    1111 1    1111  1   => d0a0, use ddaa.
 *                                               |                  11    B[5] 
 *                                               |
 *                            ___               /y\  ___            sa09
 *             LoadImmD[11] -|O0 | LoadImmD[24]-(((-|O0 |           |sa08
 *                     sa07 -|I1 |       B[4] --((+-|I1 |-- F[4]    ||sa07    a            F[4]
 *                     sa08--|I2 |       sa07 --+(--|I2 |           000       LoadImmD[11] 0
 *                     sa09 -|I3_|---------------(--|I3_|           001       LoadImmD[24] LoadImmD[24]
 *                                               |                  010       LoadImmD[11] LoadImmD[11] 
 *                                               |                  100       LoadImmD[11] LoadImmD[11] 
 *                                               |                  101       LoadImmD[24] LoadImmD[24] 
 *                                               |                  111       LoadImmD[24] B[5] 
 *                                               :
 *                            ___               /y\  ___            sa09                 
 *              LoadImmD[8] -|O0 | LoadImmD[21]-(((-|O0 |           |sa08                
 *                     sa07 -|I1 |       B[1] --((+-|I1 |-- F[1]    ||sa07    a            F[1] 
 *                     sa08--|I2 |       sa07 --+(--|I2 |           000       0            a=0  
 *                     sa09 -|I3_|-------a-------(--|I3_|           001       0            LoadImmD[21]  
 *                                               |                  010       LoadImmD[8]  a=LoadImmD[8] 
 *                                               |                  100       LoadImmD[8]  a=LoadImmD[8] 
 *                                               |                  101       0            LoadImmD[21]  
 *                                               |                  111       1            B[1] 
 *                                               |                  
 *                               ___            /y\  ___            sa09                 
 *                 LoadImmD[7] -|O0 |----a------(((-|O0 |           |sa08                
 *                LoadImmD[20] -|I1 |    B[0] --((+-|I1 |-- F[0]    ||sa07    a            F[0] 
 *                        sa07 -|I2 |    sa08 --+(--|I2 |           000       0            a=0
 *                        sa09 -|I3_|    sa07 ---(--|I3_|           001       0            a=0
 *                                               |                  010       0            0
 *                                              GND                 100       LoadImmD[7]  a=LoadImmD[7]
 *                                                                  101       LoadImmD[20] a=LoadImmD[20]
 *                                                                  111       LoadImmD[20] B[0]
 */
                  
         assign zcy0 = 1'b0;
         SB_LUT4 # ( .LUT_INIT(16'hca00)) L_1788(.O(imm0a), .I3(sa09),  .I2(sa07),.I1(INSTR[20]),.I0(INSTR[7]));      
         SB_LUT4 # ( .LUT_INIT(16'hca0a)) L_1789(.O(F[0]),  .I3(sa07),  .I2(sa08),.I1(B[0]), .I0(imm0a));      SB_CARRY CY_1789(.CO(zcy1), .CI(zcy0), .I1(sa08),.I0(B[0]));
         SB_LUT4 # ( .LUT_INIT(16'hf220)) L_1790(.O(imm1a), .I3(sa09),  .I2(sa08),.I1(sa07), .I0(INSTR[8]));                                          
         SB_LUT4 # ( .LUT_INIT(16'hcfa0)) L_1791(.O(F[1]),  .I3(imm1a), .I2(sa07),.I1(B[1]), .I0(INSTR[21]));  SB_CARRY CY_1791(.CO(zcy2), .CI(zcy1), .I1(sa07),.I0(B[1]));
         SB_LUT4 # ( .LUT_INIT(16'hf220)) L_1792(.O(imm2a), .I3(sa09),  .I2(sa08),.I1(sa07), .I0(INSTR[9]));                                          
         SB_LUT4 # ( .LUT_INIT(16'hcfa0)) L_1793(.O(F[2]),  .I3(imm2a), .I2(sa07),.I1(B[2]), .I0(INSTR[22]));  SB_CARRY CY_1793(.CO(zcy3), .CI(zcy2), .I1(sa07),.I0(B[2]));
         SB_LUT4 # ( .LUT_INIT(16'hf220)) L_1794(.O(imm3a), .I3(sa09),  .I2(sa08),.I1(sa07), .I0(INSTR[10]));                                         
         SB_LUT4 # ( .LUT_INIT(16'hcfa0)) L_1795(.O(F[3]),  .I3(imm3a), .I2(sa07),.I1(B[3]), .I0(INSTR[23]));  SB_CARRY CY_1795(.CO(zcy4), .CI(zcy3), .I1(sa07),.I0(B[3]));
         SB_LUT4 # ( .LUT_INIT(16'hf220)) L_1796(.O(imm4a), .I3(sa09),  .I2(sa08),.I1(sa07), .I0(INSTR[11]));                                         
         SB_LUT4 # ( .LUT_INIT(16'hcfa0)) L_1797(.O(F[4]),  .I3(imm4a), .I2(sa07),.I1(B[4]), .I0(INSTR[24]));  SB_CARRY CY_1797(.CO(zcy5), .CI(zcy4), .I1(sa07),.I0(B[4]));
         SB_LUT4 # ( .LUT_INIT(16'hc0aa)) L_1798(.O(F[5]),  .I3(sa10),  .I2(sa09),.I1(B[5]), .I0(INSTR[25]));  SB_CARRY CY_1798(.CO(zcy6), .CI(zcy5), .I1(sa09),.I0(B[5]));
         SB_LUT4 # ( .LUT_INIT(16'hc0aa)) L_1799(.O(F[6]),  .I3(sa10),  .I2(sa09),.I1(B[6]), .I0(INSTR[26]));  SB_CARRY CY_1799(.CO(zcy7), .CI(zcy6), .I1(sa09),.I0(B[6]));
         SB_LUT4 # ( .LUT_INIT(16'hc0aa)) L_1800(.O(F[7]),  .I3(sa10),  .I2(sa09),.I1(B[7]), .I0(INSTR[27]));  SB_CARRY CY_1800(.CO(zcy8), .CI(zcy7), .I1(sa09),.I0(B[7]));
         SB_LUT4 # ( .LUT_INIT(16'hc0aa)) L_1801(.O(F[8]),  .I3(sa10),  .I2(sa09),.I1(B[8]), .I0(INSTR[28]));  SB_CARRY CY_1801(.CO(zcy9), .CI(zcy8), .I1(sa09),.I0(B[8]));
         SB_LUT4 # ( .LUT_INIT(16'hc0aa)) L_1802(.O(F[9]),  .I3(sa10),  .I2(sa09),.I1(B[9]), .I0(INSTR[29]));  SB_CARRY CY_1802(.CO(zcy10),.CI(zcy9), .I1(sa09),.I0(B[9]));
         SB_LUT4 # ( .LUT_INIT(16'hc0aa)) L_1803(.O(F[10]), .I3(sa10),  .I2(sa09),.I1(B[10]),.I0(INSTR[30]));  SB_CARRY CY_1803(.CO(zcy11),.CI(zcy10),.I1(sa09),.I0(B[10]));
         SB_LUT4 # ( .LUT_INIT(16'hc008)) L_1804(.O(imm11a),.I3(sa09),  .I2(sa08),.I1(sa07), .I0(INSTR[20]));            
         SB_LUT4 # ( .LUT_INIT(16'hfca0)) L_1805(.O(imm11b),.I3(sa09),  .I2(sa08),.I1(INSTR[31]),.I0(INSTR[7]));     
         SB_LUT4 # ( .LUT_INIT(16'hddaa)) L_1806(.O(F[11]), .I3(imm11a),.I2(1'b1),.I1(B[11]),.I0(imm11b));     SB_CARRY CY_1806(.CO(zcy12),.CI(zcy11),.I1(1'b1),.I0(B[11]));
         SB_LUT4 # ( .LUT_INIT(16'hafc0)) L_1808(.O(F[12]), .I3(sa13b), .I2(sa31),.I1(B[12]),.I0(INSTR[12]));  SB_CARRY CY_1808(.CO(zcy13),.CI(zcy12),.I1(sa31),.I0(B[12]));
         SB_LUT4 # ( .LUT_INIT(16'hafc0)) L_1810(.O(F[13]), .I3(sa13b), .I2(sa31),.I1(B[13]),.I0(INSTR[13]));  SB_CARRY CY_1810(.CO(zcy14),.CI(zcy13),.I1(sa31),.I0(B[13]));
         SB_LUT4 # ( .LUT_INIT(16'hafc0)) L_1811(.O(F[14]), .I3(sa13b), .I2(sa31),.I1(B[14]),.I0(INSTR[14]));  SB_CARRY CY_1811(.CO(zcy15),.CI(zcy14),.I1(sa31),.I0(B[14]));
         SB_LUT4 # ( .LUT_INIT(16'hafc0)) L_1812(.O(F[15]), .I3(sa13b), .I2(sa31),.I1(B[15]),.I0(INSTR[15]));  SB_CARRY CY_1812(.CO(zcy16),.CI(zcy15),.I1(sa31),.I0(B[15]));
         SB_LUT4 # ( .LUT_INIT(16'hafc0)) L_1813(.O(F[16]), .I3(sa13b), .I2(sa31),.I1(B[16]),.I0(INSTR[16]));  SB_CARRY CY_1813(.CO(zcy17),.CI(zcy16),.I1(sa31),.I0(B[16]));
         SB_LUT4 # ( .LUT_INIT(16'hafc0)) L_1814(.O(F[17]), .I3(sa13b), .I2(sa31),.I1(B[17]),.I0(INSTR[17]));  SB_CARRY CY_1814(.CO(zcy18),.CI(zcy17),.I1(sa31),.I0(B[17]));
         SB_LUT4 # ( .LUT_INIT(16'hafc0)) L_1815(.O(F[18]), .I3(sa13b), .I2(sa31),.I1(B[18]),.I0(INSTR[18]));  SB_CARRY CY_1815(.CO(zcy19),.CI(zcy18),.I1(sa31),.I0(B[18]));
         SB_LUT4 # ( .LUT_INIT(16'hafc0)) L_1816(.O(F[19]), .I3(sa13b), .I2(sa31),.I1(B[19]),.I0(INSTR[19]));  SB_CARRY CY_1816(.CO(zcy20),.CI(zcy19),.I1(sa31),.I0(B[19]));
         SB_LUT4 # ( .LUT_INIT(16'hafc0)) L_1818(.O(F[20]), .I3(sa13),  .I2(sa10),.I1(B[20]),.I0(INSTR[20]));  SB_CARRY CY_1818(.CO(zcy21),.CI(zcy20),.I1(sa10),.I0(B[20]));
         SB_LUT4 # ( .LUT_INIT(16'hafc0)) L_1819(.O(F[21]), .I3(sa13),  .I2(sa10),.I1(B[21]),.I0(INSTR[21]));  SB_CARRY CY_1819(.CO(zcy22),.CI(zcy21),.I1(sa10),.I0(B[21]));
         SB_LUT4 # ( .LUT_INIT(16'hafc0)) L_1820(.O(F[22]), .I3(sa13),  .I2(sa10),.I1(B[22]),.I0(INSTR[22]));  SB_CARRY CY_1820(.CO(zcy23),.CI(zcy22),.I1(sa10),.I0(B[22]));
         SB_LUT4 # ( .LUT_INIT(16'hafc0)) L_1821(.O(F[23]), .I3(sa13),  .I2(sa10),.I1(B[23]),.I0(INSTR[23]));  SB_CARRY CY_1821(.CO(zcy24),.CI(zcy23),.I1(sa10),.I0(B[23]));
         SB_LUT4 # ( .LUT_INIT(16'hafc0)) L_1822(.O(F[24]), .I3(sa13),  .I2(sa10),.I1(B[24]),.I0(INSTR[24]));  SB_CARRY CY_1822(.CO(zcy25),.CI(zcy24),.I1(sa10),.I0(B[24]));
         SB_LUT4 # ( .LUT_INIT(16'hafc0)) L_1823(.O(F[25]), .I3(sa13),  .I2(sa10),.I1(B[25]),.I0(INSTR[25]));  SB_CARRY CY_1823(.CO(zcy26),.CI(zcy25),.I1(sa10),.I0(B[25]));
         SB_LUT4 # ( .LUT_INIT(16'hafc0)) L_1824(.O(F[26]), .I3(sa13),  .I2(sa10),.I1(B[26]),.I0(INSTR[26]));  SB_CARRY CY_1824(.CO(zcy27),.CI(zcy26),.I1(sa10),.I0(B[26]));
         SB_LUT4 # ( .LUT_INIT(16'hafc0)) L_1825(.O(F[27]), .I3(sa13),  .I2(sa10),.I1(B[27]),.I0(INSTR[27]));  SB_CARRY CY_1825(.CO(zcy28),.CI(zcy27),.I1(sa10),.I0(B[27]));
         SB_LUT4 # ( .LUT_INIT(16'hafc0)) L_1826(.O(F[28]), .I3(sa13),  .I2(sa10),.I1(B[28]),.I0(INSTR[28]));  SB_CARRY CY_1826(.CO(zcy29),.CI(zcy28),.I1(sa10),.I0(B[28]));
         SB_LUT4 # ( .LUT_INIT(16'hafc0)) L_1827(.O(F[29]), .I3(sa13),  .I2(sa10),.I1(B[29]),.I0(INSTR[29]));  SB_CARRY CY_1827(.CO(zcy30),.CI(zcy29),.I1(sa10),.I0(B[29]));
         SB_LUT4 # ( .LUT_INIT(16'hafc0)) L_1828(.O(F[30]), .I3(sa13),  .I2(sa10),.I1(B[30]),.I0(INSTR[30]));  SB_CARRY CY_1828(.CO(zcy31),.CI(zcy30),.I1(sa10),.I0(B[30]));
         SB_LUT4 # ( .LUT_INIT(16'hafc0)) L_1829(.O(F[31]), .I3(sa13),  .I2(sa10),.I1(B[31]),.I0(INSTR[31]));  SB_CARRY CY_1829(.CO(zcy32),.CI(zcy31),.I1(sa10),.I0(B[31]));
         
         SB_LUT4 # ( .LUT_INIT(16'hff00)) cmb_zcy32(.O(BisnotZero), .I3(zcy32), .I2(1'b0), .I1(1'b0), .I0(1'b0));
         
         for ( j = 0; j < 32; j = j + 1 ) begin : blk0
            SB_DFFESR r(.Q(ADR_O[j]), .C(clk), .E(enaQ), .D(F[j]), .R(sa14));
         end
         SB_DFFESR rNE0(.Q(rzcy32), .D(BisnotZero), .C(clk), .E(enaQ), .R(sa14));
      end
      endgenerate
   
endmodule
