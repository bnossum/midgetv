/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * 
 * The alu carry input. It must be selectable. raluF is used by slt(u), slti(u)
 * instructions. alu_carryin must be put on the carry chain.
 * 
 * Free resources here give sra_msb and sa12_and_corerunning.
 * Size of module : 2 SB_LUT4s
 * 
 *                                          
 *                    | alu_carryin                      s_alu_carryin[1]           
 *                   /y\     ___                         |s_alu_carryin[0]          
 * ADR_O[31] --------(((----|I0 |                        ||  prealucyin 
 * s_alu_carryin[0] -+((----|I1 |-- sra_msb              00  0          
 * s_alu_carryin[1] --(+----|I2 |                        01  raluF     
 * FUNC7_5 -----------(-----|I3_|                        10  raluF
 *                    | prealucyin                       11  1
 *                   /y\     ___                             
 * corerunning ------(((----|I0 |-- sa12_and_corerunning FUNC7_5 sra_msb
 * raluF ------------+||    |I1 |                        0       0      
 * GND ---------------(+    |I2 |                        1       Q[31]  
 * sa12 --------------(-----|I3_|
 *                    |
 *                    VCC
 * 
 * Experimentation show that iCECube2 inserts a through-carry higher in the
 * ALU carry chain, probably because of router congestion? This is avoided 
 * by the following arrangement, where I gain a LUT otherwise unused. The 
 * effectively 3-input LUT is used for an equation that has a good slack, 
 * Wai[7]. Rather than to move Wai[7] here, I do the opposite, and get 
 * preprealucyin from m_wai. The experiment was not a success, for unknown 
 * reasons. But by making preprealucyin out of the 5-bit shiftcounter instead, 
 * I succeded.
 * 
 *                                          
 *                    | alu_carryin                          s_alu_carryin[1]           
 *                   /y\     ___                             |s_alu_carryin[0]          
 * ADR_O[31] --------(((----|I0 |                            ||  prealucyin 
 * s_alu_carryin[0] -+((----|I1 |-- sra_msb                  00  0          
 * s_alu_carryin[1] --(+----|I2 |                            01  raluF     
 * FUNC7_5 -----------(-----|I3_|                            10  raluF
 *                    | prealucyin                           11  1
 *                   /y\     ___                                 
 * corerunning ------(((----|I0 |-- sa12_and_corerunning     FUNC7_5 sra_msb
 * raluF ------------+||    |I1 |                            0       0      
 * GND ---------------(+    |I2 |                            1       Q[31]  
 * sa12 --------------(-----|I3_|
 *                    |
 *                    | preprealucyin == VCC
 *                    |
 *                    |         +-------- lastshift = ~shcy[4] & sa18. The cycle we are loading the counter is not the last shift..
 *                   /y\  ___   |  ___  
 *             sa18 -(((-|I0 |  | |I0 | ~lastshift     __                
 *              vcc -+(( |I1 |--+-|I1-|---------------|  |-- r_issh0_not
 *              vcc --(+ |I2 |    |I2 |               |  |               
 *                    +--|I3_|    |I3_|               >__|               
 *                    |shcy[4]
 * 
 */

//Think I can remove sa12_and_corerunning and use this lut to something else. Reason and how to:
//  sa12 is used as enable for sampling of OpC. Qualifying with corerunning is to avoid update that changes TRG before a valid fetch.
//  If sa12 is unknown, OpC may be sampled from Di. Di is dependent on sa00mod. We can:
//    always @(posedge clk)
//      sa00mod <=  qACK | sram_ack | sa00 | ~corerunning;
//  Then
//    Di = (DAT_O & rDee) | (~DAT_O & shADR_O)
//  DAT_O is unknown the first cycle, but we can do the following:
//  rDee comes from a register, and can be qualified by corerunning so stay zero when ~corerunning.
//  shADR_O essentially comes from ADR_O, a register, that is zero when ~corerunning. Msb of shADR_O
//  is sra_msb, zero during startup. 
//
//  Hence: Di == 0 before corerunning.
//
//  Hence: OpC is not changed at startup while corerunning is low.
//
//  Hence: I can remove sa12_and_corerunning.
//
//  Summary of changes to make:
//    Remove sa12_and_corerunning
//    Qualify rDee with CE = corerunning
//    Modify LUT in front of sa00mod to give the equation above.
  

module m_alu_carryin  # ( parameter HIGHLEVEL = 0 )   
   (
    input        raluF,FUNC7_5,
    input [1:0]  s_alu_carryin,
    input        sa12,corerunning,
    /* verilator lint_off UNUSED */
    input        preprealucyin,
    /* verilator lint_on UNUSED */
    input [31:0] ADR_O,
    output       alu_carryin,sra_msb,
    output       sa12_and_corerunning,
    output       m_alu_carryin_killwarnings
    );
   
   assign m_alu_carryin_killwarnings = &ADR_O;
   generate
      if ( HIGHLEVEL != 0 ) begin
         reg r_alu_carryin, r_sra_msb;
         always @(/*AS*/raluF or s_alu_carryin) 
           case ( s_alu_carryin )
             2'b00 : r_alu_carryin = 1'b0;
             2'b01 : r_alu_carryin = raluF;
             2'b10 : r_alu_carryin = raluF;
             2'b11 : r_alu_carryin = 1'b1;
           endcase
         always @(/*AS*/ADR_O or FUNC7_5) 
           r_sra_msb = FUNC7_5 ? ADR_O[31] : 1'b0;
         assign sa12_and_corerunning = sa12 & corerunning;
         assign sra_msb = r_sra_msb;
         assign alu_carryin = r_alu_carryin;
      end else begin
         
         wire prealucyin;
//         bn_lcy4v_b #(.I(16'haa00))  la(.o(sa12_and_corerunning),.co(prealucyin),  .ci(preprealucyin), .i({sa12,1'b0,raluF,corerunning}));
         bn_lcy4v_b #(.I(16'haa00))  la(.o(sa12_and_corerunning),.co(prealucyin),  .ci(1'b1), .i({sa12,1'b0,raluF,corerunning}));
         bn_lcy4v_b #(.I(16'haa00))  lb(.o(sra_msb),             .co(alu_carryin), .ci(prealucyin),    .i({FUNC7_5,s_alu_carryin,ADR_O[31]}));

      end
      
   endgenerate
endmodule
