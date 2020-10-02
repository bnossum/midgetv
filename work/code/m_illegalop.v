module m_illegalop
  # ( parameter LAZY_DECODE = 0, MULDIV = 0
      )
   (
     input [31:0] INSTR,
     input        corerunning,
     output       illegal,
     output       m_illegalop_killwarning
     );
   /* verilator lint_off UNUSED */
   wire          illegal_funct7_or_illegal_rs1_rd;
   /* verilator lint_on UNUSED */
   assign m_illegalop_killwarning = &INSTR;
   
   generate
      if ( LAZY_DECODE != 0 ) begin
         
         // =======================================================
         // Nearly full instruction decode but skips
         // some minor code spaces.
         // =======================================================
         assign illegal_funct7_or_illegal_rs1_rd = 1'b0;
         
      end else begin
         
         /* verilator lint_off UNUSED */
         wire [2:0] funct3 = INSTR[14:12];
         wire [6:0] funct7 = INSTR[31:25];
         wire [6:0] opcode = INSTR[6:0];
         wire       checkfunct7;
         wire       funct7_5_dontcare;
         wire       mostof_funct7_ne0;
         
         if ( MULDIV == 0 ) begin
            // =======================================================
            // Full instruction decode. Without multiplication
            // =======================================================
            /*  
             Instructions and, or, slli, srli, add, sll, slt, sltu, xor and srl
             should only be valid when funct7 == 7'b00000000. 
             srai, sub, and sra should only be valid when funct7 == 7'b0100000. 
             
                                                               checkfunct7
                                         INSTR                 | funct7_5_dontcare
             funct7  rs2   rs1 funct3 rd 6543210  Instruction  | |
             0000000 shamt rs1 001,   rd x01x0xx  slli         1 0
             0x00000 shamt rs1 101,   rd x01x0xx  srli/srai    1 1
             0x00000 rs2   rs1 000,   rd 011x0xx  add/sub      1 1
             0000000 rs2   rs1 001,   rd 011x0xx  sll          1 0
             0000000 rs2   rs1 010,   rd 011x0xx  slt          1 0
             0000000 rs2   rs1 011,   rd 011x0xx  sltu         1 0
             0000000 rs2   rs1 100,   rd 011x0xx  xor          1 0
             0x00000 rs2   rs1 101,   rd 011x0xx  srl/sra      1 1
             0000000 rs2   rs1 110,   rd 011x0xx  or           1 0
             0000000 rs2   rs1 111,   rd 011x0xx  and          1 0
             instructions which main_illegal says are legal    0 x
             instructions which main_illegal says are illegal  x x
             */
            
            assign checkfunct7 = (opcode[5:4] == 2'b01 && opcode[2] == 0 && funct3[1:0] == 2'b01 ) |
                                 (opcode[6:4] == 3'b011 && opcode[2] == 0 );
            assign funct7_5_dontcare = (opcode[5] == 0 && funct3[2] == 1'b1 ) ||
                                       (opcode[5] == 1 && (funct3 == 3'b000 || funct3 == 3'b101));
            assign mostof_funct7_ne0 = {funct7[6],funct7[4:0]} != 6'h0;
            
         end else begin
            
            /* verilator lint_off UNUSED */
            // =======================================================
            // Full instruction decode. With multiplication and division
            // =======================================================
            /*  
             Instruction bit 25 is used to differentiate between 
             add/sll/slt/sltu/xor/srl/or/and and
             mul/mylh/mulhsu/mulhu/div/divu/rem/remu. This is handled by 
             the index, outside of this code. So the only difference from
             the case with (MULDIV == 0) is that the function
             funct7_5_dontcare is a bit more selective, and 
             mostof_funct7_ne0 must be modified.
             
                                                               checkfunct7
                                         INSTR                 | funct7_5_dontcare
             funct7  rs2   rs1 funct3 rd 6543210  Instruction  | |
             0000000 shamt rs1 001,   rd x01x0xx  slli         1 0
             0x00000 shamt rs1 101,   rd x01x0xx  srli/srai    1 1
             0x00000 rs2   rs1 000,   rd 011x0xx  add/sub      1 1
             0000000 rs2   rs1 001,   rd 011x0xx  sll          1 0
             0000000 rs2   rs1 010,   rd 011x0xx  slt          1 0
             0000000 rs2   rs1 011,   rd 011x0xx  sltu         1 0
             0000000 rs2   rs1 100,   rd 011x0xx  xor          1 0
             0x00000 rs2   rs1 101,   rd 011x0xx  srl/sra      1 1
             0000000 rs2   rs1 110,   rd 011x0xx  or           1 0
             0000000 rs2   rs1 111,   rd 011x0xx  and          1 0
             0000001 rs2   rs1 000,   rd 011x0xx  mul          1 0
             0000001 rs2   rs1 001,   rd 011x0xx  mulh         1 0
             0000001 rs2   rs1 010,   rd 011x0xx  mulhsu       1 0
             0000001 rs2   rs1 011,   rd 011x0xx  mulhu        1 0
             0000001 rs2   rs1 100,   rd 011x0xx  div          1 0
             0000001 rs2   rs1 101,   rd 011x0xx  divu         1 0
             0000001 rs2   rs1 110,   rd 011x0xx  rem          1 0
             0000001 rs2   rs1 111,   rd 011x0xx  remu         1 0
             instructions which main_illegal says are legal    0 x
             instructions which main_illegal says are illegal  x x
             */
            assign checkfunct7 = (opcode[5:4] ==  2'b01 && opcode[2] == 0 && funct3[1:0] == 2'b01 ) |
                                 (opcode[6:4] == 3'b011 && opcode[2] == 0 );
            assign funct7_5_dontcare = (opcode[5] == 0 && funct3[2] == 1'b1 ) ||
                                       (opcode[5] == 1 && (funct3 == 3'b000 || funct3 == 3'b101) && funct7[0] == 1'b0);
            assign mostof_funct7_ne0 = ({funct7[6],funct7[4:1]} != 5'h0) || (opcode[5] == 0 && funct7[0]);
            
            /*
             When MULDIV == 1, a number of entries in the microcodetable, formerly used to
             detect illegal opcodes, are now used to implement MUL/DIV instructions.              
             These opcodes must now be detected by firmware.
                   111 
             65432 432     Comment
             00000 00x   0
             00000 010   0
             00000 011   1 close to LB   
             000
             00000 11x   1 close to LB   
             00001 xxx   x
             00010 001     close to ij   
             00010 01x     close to ij   
             00010 1xx     close to ij   
             00011 01x     close to FENCE
             00011 1xx     close to FENCE
             01000 011     close to SW   
             01000 1xx     close to SW   
             11000 01x     close to BEQ  
             11001 001     close to JALR 
             11001 01x     close to JALR 
             11001 1xx     close to JALR 
             11100 100     close to CSR
             */
            reg also_illegal;
            always @(/*AS*/INSTR)
              casez ( {INSTR[6:2],INSTR[14:12]} )
                //       111
                // 65432 432   also_illegal  Comment
                8'b00000_00? : also_illegal = 1'b0;
                8'b00000_010 : also_illegal = 1'b0;
                8'b00000_011 : also_illegal = 1'b1; // close to LB
                8'b00000_10? : also_illegal = 1'b0;
                8'b00000_11? : also_illegal = 1'b1; // close to LB       
                
                8'b00001_??? : also_illegal = 1'b?; // 
                
                8'b00010_000 : also_illegal = 1'b0;
                8'b00010_001 : also_illegal = 1'b1;  // close to ij   
                8'b00010_01? : also_illegal = 1'b1;  // close to ij   
                8'b00010_1?? : also_illegal = 1'b1;  // close to ij
                
                8'b00011_00? : also_illegal = 1'b0;
                8'b00011_01? : also_illegal = 1'b1;  // close to FENCE
                8'b00011_1?? : also_illegal = 1'b1;  // close to FENCE
                
                8'b0010?_??? : also_illegal = 1'b0;
                8'b0011?_??? : also_illegal = 1'b?;
                
                8'b01000_00? : also_illegal = 1'b0;
                8'b01000_010 : also_illegal = 1'b0;
                8'b01000_011 : also_illegal = 1'b1;  // close to SW   
                8'b01000_1?? : also_illegal = 1'b1;  // close to SW   
                
                8'b01001_??? : also_illegal = 1'b?;
                8'b0101?_??? : also_illegal = 1'b?;
                8'b0110?_??? : also_illegal = 1'b0;
                8'b0111?_??? : also_illegal = 1'b?;
                8'b10???_??? : also_illegal = 1'b?;
                
                8'b11000_00? : also_illegal = 1'b0;
                8'b11000_01? : also_illegal = 1'b1;  // close to BEQ
                8'b11000_1?? : also_illegal = 1'b0;

                8'b11001_000 : also_illegal = 1'b0;
                8'b11001_001 : also_illegal = 1'b1;  // close to JALR 
                8'b11001_01? : also_illegal = 1'b1;  // close to JALR 
                8'b11001_1?? : also_illegal = 1'b1;  // close to JALR
                
                8'b11010_??? : also_illegal = 1'b?;
                8'b11011_??? : also_illegal = 1'b0;
                
                8'b11100_0?? : also_illegal = 1'b0;
                8'b11100_100 : also_illegal = 1'b1;  // close to CSR
                8'b11100_101 : also_illegal = 1'b0;
                8'b11100_11? : also_illegal = 1'b0;
                
                8'b11101_??? : also_illegal = 1'b?;
                8'b1111?_??? : also_illegal = 1'b?;
              endcase
            
            
            /* 
             Issue 3:
             ecall, ebreak, wfi, and mret put requirements onto the immediate
             field imm12, which is decoded to register Q.
             
             |__imm12______|
             funct7   rs2    rs1    funct3 rd      opcode
             0000000, 00000, 00000, 000,   00000,  1110011, ecall     imm12 checked by ucode
             0000000, 00001, 00000, 000,   00000,  1110011, ebreak    imm12 checked by ucode
             0001000, 00101, 00000, 000,   00000,  1110011, wfi       imm12 checked by ucode
             0011000, 00010, 00000, 000,   00000,  1110011, mret      imm12 checked by ucode
             
             All of these instructions should have field rs1 and rd as 5'b00000.
             
             */
            wire check_rs1_rd = (opcode[6] == 1'b1 && opcode[4] == 1'b1) && (funct3[1:0] == 2'b00);
            wire rs1_ne_zero = INSTR[19:15] != 5'h0;
            wire rd_ne_zero  = INSTR[11:7] != 5'h0;
            wire illegal_rs1_rd = check_rs1_rd & (rs1_ne_zero | rd_ne_zero);
            
            assign illegal_funct7_or_illegal_rs1_rd
              = (checkfunct7 & mostof_funct7_ne0) |
                (checkfunct7 & ~funct7_5_dontcare & funct7[5]) |
                illegal_rs1_rd | also_illegal;
            
            
         end
      end
      
      /* =============================================================================
       * The illegal signal
       * ============================================================================= */
      if ( LAZY_DECODE == 2 ) begin
         
         assign  illegal = ~INSTR[0] & corerunning;
         
      end else begin
         
         reg              illegal_a, illegal_b;
         always @(*)
           case ( INSTR[5:2] )
             4'b0000 : {illegal_b,illegal_a} = 2'b10; // 10000                                        00000   lb/lh/lbu/lhu/lw                                                                
             4'b0001 : {illegal_b,illegal_a} = 2'b11; // 10001                                        00001                                                                                   
             4'b0010 : {illegal_b,illegal_a} = 2'b10; // 10010                                        00010   ij                                                                                
             4'b0011 : {illegal_b,illegal_a} = 2'b10; // 10011                                        00011   fence.i/fence                                                                   
             4'b0100 : {illegal_b,illegal_a} = 2'b10; // 10100                                        00100   addi/slti/sltiu/xori/ori/andi/slli/srli/srai                                    
             4'b0101 : {illegal_b,illegal_a} = 2'b10; // 10101                                        00101   auipc                                                                           
             4'b0110 : {illegal_b,illegal_a} = 2'b11; // 10110                                        00110                                                                                   
             4'b0111 : {illegal_b,illegal_a} = 2'b11; // 10111                                        00111                                                                                   
             4'b1000 : {illegal_b,illegal_a} = 2'b00; // 11000   beq/bne/blt/bge/bltu/bgeu            01000   sb/sh/sw                                                                        
             4'b1001 : {illegal_b,illegal_a} = 2'b01; // 11001   jalr                                 01001                                                                                   
             4'b1010 : {illegal_b,illegal_a} = 2'b11; // 11010                                        01010                                                                                   
             4'b1011 : {illegal_b,illegal_a} = 2'b01; // 11011   jal                                  01011                                                                                   
             4'b1100 : {illegal_b,illegal_a} = 2'b00; // 11100   csr/ecall/ebreak/uret/sret/wfi/mret  01100  add/sll/slt/sltu/xor/srl/or/and/mul/mulh/mulhsu/mulhu/div/divu/rem/remu/sub/sra/ 
             4'b1101 : {illegal_b,illegal_a} = 2'b10; // 11101                                        01101  lui                                                                              
             4'b1110 : {illegal_b,illegal_a} = 2'b11; // 11110                                        01110                                                                                   
             4'b1111 : {illegal_b,illegal_a} = 2'b11; // 11111                                        01111                                                                                   
           endcase
         wire             main_illegal;
         assign main_illegal = 
                               (~INSTR[6] & illegal_a) | 
                               (INSTR[6] & illegal_b ) | 
                               ~INSTR[1] |
                               ~INSTR[0];
         
         if ( LAZY_DECODE == 1 ) begin
            assign  illegal = main_illegal & corerunning;
         end else begin
            assign illegal = (main_illegal | illegal_funct7_or_illegal_rs1_rd) & corerunning;
         end
      end
   endgenerate
endmodule
