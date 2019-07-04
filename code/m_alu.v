/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * The alu. Operations:
 * 
 *  sa06
 *  |sa05
 *  ||sa04
 *  000 : nearXOR  B = D^(~Q)   
 *  001 : PASSD    B = D
 *  010 : nearAND  B = D&(~Q)   
 *  011 : INVQ     B = ~Q       
 *  100 : ADD      B = D+Q+cin  
 *  101 : SHLQ     B = (Q<<1)|cin (with D=0xffffffff) 
 *  110 : nearIOR  B = (~D)|Q     (with cin==0)     
 *  111 : PASSQ    B = Q+cin
 * 
 * Parameter MTIMETAP determines the frequency of an increment of mtime. If CSR
 * is implemented the value should be between 14 and 31 inclusive, because CSR
 * instructions can take many cycles, and we don't want to skip any update
 * of mtime.
 * 
 * The size requirement of this module should be 64 or 65 LUTs. 
 * Highlevel synthesis gives 69 LUTs. But to get the INSTRUCTION registers
 * packed with the luts of the input mux, and using the combinatorical output
 * of the input mux to the A-part of the alu, hand-placement is needed.
 * Then it is easier to use the low level implementation. The low level
 * implementation is thus the tested one.
 * 
 * The ALU is constructed out of two columns of LUTs. 
 *      
 *                        | co                  sa05 
 *                       /y\                    |sa04               sa06  
 *         ___           |||     ___            ||  A               |   B       
 * Q    --|I0 | A sa06 --(((----|I0 | B         --  -               -   -       
 * sa04 --|I1 |----------+((----|I1 |--         00  Di              0   ~(A^QQ)  
 * Di   --|I2 |    QQ  ---(+----|I2 |           01  ~(Di^Q)         1   A^QQ^cin 
 * sa05 --|I3_|           +-----|I3_|           10  (~Di)&(~Q)       
 *                        |                     11  0       
 *                        cin       
 *   
 *  luta=0x01b4 lutb=0xc369
 */
module m_alu
  # ( parameter HIGHLEVEL = 0, 
      MTIMETAP = 0,
      SRAMADRWIDTH = 0 )
   (
    input [31:0]  Di, //                  First operand to the ALU
    input [31:0]  ADR_O, //                 Normally second operand to ALU
    input [31:0]  QQ, //                  Alternate second operand to ALU
    input         alu_carryin, //         Carry in to ALU
    input         sa06,sa05,sa04,//       Determines ALU operation
    input         sa27,sa26,sa25,sa24, // To decode Wttime and Wrinst
    output [31:0] B, //                   ALU result
    output        alu_carryout, //        ALU carry out
    output        alu_tapout, //          Used to trigger interrupt for mtime increment/mcycle update
    output        alu_minstretofl, //     Used to trigger interrupt for retired instructions
    output        alu_killwarnings //     To keep Verilator happy
    );
   
   generate
      wire [31:0] A;

      if ( HIGHLEVEL ) begin         
         assign A = sa05 ? (sa04 ? 32'b0 : (~Di)&(~ADR_O)) : (sa04 ? ~(Di^ADR_O) : Di);
         assign B = sa06 ? A+QQ+{31'h0,alu_carryin} : ~(A^QQ);
         assign alu_carryout = B[31]^A[31]^QQ[31]^(~sa06);

         wire isWttime;
         if ( MTIMETAP > 13 ) begin
            assign isWttime = {sa27,sa26,sa25,sa24} == 4'b1011;      
         end else begin
            assign isWttime = 1'b0; // Keep Verilator happy
         end

         // For mtimeinc interrupts:
         if (MTIMETAP > 31 ) begin
            assign alu_tapout = (A[31]^B[31])&isWttime;
         end else if ( MTIMETAP > 13 ) begin
            assign alu_tapout = (A[MTIMETAP]^B[MTIMETAP])&isWttime;
         end else begin
            assign alu_tapout = 1'b0;
         end

         // For retired instructions interrupt
         if (MTIMETAP > 13 && SRAMADRWIDTH != 0 ) begin
            wire isWrinst = {sa27,sa26,sa25,sa24} == 4'b1001;
            assign alu_minstretofl = alu_carryout & isWrinst;
         end else begin
            assign alu_minstretofl = 1'b0; // Keep Verilator happy
         end
      
         
      end else begin
         genvar j;

         /* verilator lint_off UNOPTFLAT */
         /* I am unable to remove this warning. According to the user
          * manual, simulation will still be correct, but slower.
          * I refuse to duplicate the 3 lines 32 times.
          */
         wire [32:0] alucy; 
         /* verilator lint_on UNOPTFLAT */

         assign alucy[0] = alu_carryin;
         for ( j = 0; j < 32; j = j + 1 ) begin : blk1
            SB_LUT4 #(.LUT_INIT(16'h01b4)) a(.O(A[j]), .I3(sa05), .I2(Di[j]), .I1(sa04), .I0(ADR_O[j]));
            SB_LUT4 #(.LUT_INIT(16'hc369)) b(.O(B[j]), .I3(alucy[j]), .I2(QQ[j]), .I1(A[j]),.I0(sa06));
            SB_CARRY ca( .CO(alucy[j+1]),              .CI(alucy[j]), .I1(QQ[j]), .I0(A[j]));
         end

         wire isWttime;
         if ( MTIMETAP > 13 ) begin
            SB_LUT4 #(.LUT_INIT(16'h0800)) l_isWttime( .O(isWttime), .I3(sa27), .I2(sa26), .I1(sa25), .I0(sa24));
         end else begin
            assign isWttime = 1'b0; // Keep Verilator happy
         end

         // For mtimeinc interrupts:
         if (MTIMETAP > 31 ) begin
            SB_LUT4 #(.LUT_INIT(16'h6060)) l_alu_tapout( .O(alu_tapout), .I3(1'b0), .I2(isWttime), .I1(B[31]), .I0(A[31]));
         end else if ( MTIMETAP > 13 ) begin
            SB_LUT4 #(.LUT_INIT(16'h6060)) l_alu_tapout( .O(alu_tapout), .I3(1'b0), .I2(isWttime), .I1(B[MTIMETAP]), .I0(A[MTIMETAP]));
         end else begin
            assign alu_tapout = 1'b0;
         end

         // For retired instructions interrupt
         if (MTIMETAP > 13 && SRAMADRWIDTH != 0 ) begin
            wire isWrinst = {sa27,sa26,sa25,sa24} == 4'b1001;
            assign alu_minstretofl = alu_carryout & isWrinst;
         end else begin
            assign alu_minstretofl = 1'b0; // Keep Verilator happy
         end
         assign alu_carryout = alucy[32];

         // By a reason I do not understand the following give one more LUT.
         // I get a THRU carry for unknown reasons.
         //
         
//         // For retired instructions interrupt
//         if (MTIMETAP > 13 && SRAMADRWIDTH != 0 ) begin
//            wire isWrinst;
//            SB_LUT4 #(.LUT_INIT(16'h0200)) l_isWrinst( .O(isWrinst), .I3(sa27), .I2(sa26), .I1(sa25), .I0(sa24));
//            SB_LUT4 #(.LUT_INIT(16'haa00)) l_alu_minstretofl( .O(alu_minstretofl), .I3(alucy[32]), .I2(1'b0), .I1(1'b1), .I0(isWrinst));
//            SB_CARRY                       l_alu_carryout(   .CO(alu_carryout),    .CI(alucy[32]), .I1(1'b0), .I0(1'b1));
//         end else begin
//            assign alu_carryout = alucy[32];
//            assign alu_minstretofl = 1'b0; // Keep Verilator happy
//         end

      
                 
      end

   endgenerate

   assign alu_killwarnings = sa24 & sa25 & sa26 & sa27;
endmodule