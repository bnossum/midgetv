/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * The alu carry input. It must be selectable. raluF is used by slt(u), slti(u)
 * instructions. alu_carryin must be put on the carry chain.
 * 
 * Free resources here give msb of quantity to shift right.
 * 
 * In an ideal world, sa02, sa03, raluF, DOUT[0] (in m_ebr) or ADR_O[0] is
 * the origin of the critical path. If sra_msb is part of the 
 * critical path, it should be made elsewhere.
 *                                          
 *               | alu_carryin                      sa03           
 *              /y\     ___                         |sa02          
 * ADR_O[31] ---(((----|I0 |                        ||  prealucyin 
 * sa02 --------+((----|I1 |-- sra_msb              00  0          
 * sa03 ---------(+----|I2 |                        01  raluF     
 * FUNC7_5 ------(-----|I3_|                        10  raluF
 *               | prealucyin                       11  1
 *              /y\     ___                             
 * corerunning -(((----|I0 |-- sa12_and_corerunning FUNC7_5 sra_msb
 * raluF -------+||    |I1 |                        0       0      
 * GND ----------(+    |I2 |                        1       Q[31]  
 * sa12 ---------(-----|I3_|
 *               |
 *               VCC
 * 
 * Experimentation show that iCECube2 inserts a through-carry higher in the
 * ALU carry chain. This is avoided by the following arrangement, where I
 * gain a LUT otherwise unused. The effectively 3-input LUT is used for an
 * equation that has a good slack, Wai[7]. Rather than to move Wai[7] here,
 * I do the opposite, and get preprealucyin from m_wai.
 * 
 *                                          
 *               | alu_carryin                          sa03           
 *              /y\     ___                             |sa02          
 * ADR_O[31] ---(((----|I0 |                            ||  prealucyin 
 * sa02 --------+((----|I1 |-- sra_msb                  00  0          
 * sa03 ---------(+----|I2 |                            01  raluF     
 * FUNC7_5 ------(-----|I3_|                            10  raluF
 *               | prealucyin                           11  1
 *              /y\     ___                                 
 * corerunning -(((----|I0 |-- sa12_and_corerunning     FUNC7_5 sra_msb
 * raluF -------+||    |I1 |                            0       0      
 * GND ----------(+    |I2 |                            1       Q[31]  
 * sa12 ---------(-----|I3_|
 *               | preprealucyin == VCC
 *              /y\     ___
 * ADR_O[9] ----(((----|I0 |-- Wai[7]
 * sa27 --------+||    |I1 |                        
 * VCC ----------(+    |I2 |                        
 * sa27 ---------(-----|I3_|
 *               |
 *               VCC
 * 
 * The experiment was not a success, I start to believe I use too many
 * input signals to a PLB. 
 */
module m_alu_carryin  # ( parameter HIGHLEVEL = 0 )   
   (
    input        raluF,sa03,sa02,FUNC7_5,
    input        sa12,corerunning,
    input        preprealucyin,
    input [31:0] ADR_O,
    output reg   alu_carryin,sra_msb,
    output       sa12_and_corerunning,
    output       m_alu_carryin_killwarnings
    );
   
   assign m_alu_carryin_killwarnings = &ADR_O;
   generate
      if ( HIGHLEVEL != 0 ) begin         
         always @(/*AS*/raluF or sa02 or sa03) 
           case ( {sa03,sa02} )
             2'b00 : alu_carryin = 1'b0;
             2'b01 : alu_carryin = raluF;
             2'b10 : alu_carryin = raluF;
             2'b11 : alu_carryin = 1'b1;
           endcase
         always @(/*AS*/FUNC7_5 or ADR_O) 
           sra_msb = FUNC7_5 ? ADR_O[31] : 1'b0;
         assign sa12_and_corerunning = sa12 & corerunning;

      end else begin
         
//         wire prealucyin;
//         wire _sra_msb,_alu_carryin;
//         
//         SB_LUT4 #(.LUT_INIT(16'haa00))  la(.O(sa12_and_corerunning),.I3(sa12),.I2(1'b0),.I1(raluF),.I0(corerunning));
//         SB_CARRY pcy(.CO(prealucyin), .CI(1'b1), .I1(1'b0), .I0(raluF));
//         SB_LUT4 #(.LUT_INIT(16'haa00))  lb(.O(_sra_msb),.I3(FUNC7_5),.I2(sa03),.I1(sa02),.I0(ADR_O[31]));
//         SB_CARRY cya(.CO(_alu_carryin),.CI(prealucyin),.I1(sa03),.I0(sa02));
//         always @(/*AS*/_alu_carryin or _sra_msb) begin
//            alu_carryin = _alu_carryin;
//            sra_msb = _sra_msb;
//         end

         wire prealucyin;
         wire _sra_msb,_alu_carryin;

         SB_LUT4 #(.LUT_INIT(16'haa00))  la(.O(sa12_and_corerunning),.I3(sa12),.I2(1'b0),.I1(raluF),.I0(corerunning));
         SB_CARRY pcy(.CO(prealucyin), .CI(preprealucyin), .I1(1'b0), .I0(raluF));
         //SB_CARRY pcy(.CO(prealucyin), .CI(1'b1), .I1(1'b0), .I0(raluF));
         SB_LUT4 #(.LUT_INIT(16'haa00))  lb(.O(_sra_msb),.I3(FUNC7_5),.I2(sa03),.I1(sa02),.I0(ADR_O[31]));
         SB_CARRY cya(.CO(_alu_carryin),.CI(prealucyin),.I1(sa03),.I0(sa02));
         always @(/*AS*/_alu_carryin or _sra_msb) begin
            alu_carryin = _alu_carryin;
            sra_msb = _sra_msb;
         end


      end
      
   endgenerate
endmodule
