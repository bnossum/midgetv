/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Lsb write adr is a mux from Q (for WAE/WAQ/WAQH/WAQB), the values
 * in TRG[4:0], and fixed addresses. 
 *
 *                             sa[23:20]       
 *    READ                     read Read       WRITE      sa[27:24]        
 *    ADR                      sel  Select     ADR                            
 *    9876543210               ||||                       write 
 *    ---------------------------------------+            sel    Comment
 *    __B[9:2]     Alu         1101 11 B[9:2]+----------------------------
 *    000_SRC200   rs2         1110 10 SRC2    __Q[9:2]   00xx  
 *    000_SRC100   rs1         1111 01 SRC1    00u__TRG   0100   u = 1 if TRG == 0
 *                                                        0101   free
 *                                                        011x   free
 * 20 0010000000   jj          0000 00         00100000   1000  
 * 21 0010000100   rinst       0001 00         00100001   1001   aka minstret
 * 22 0010001000   pc          0010 00         00100010   1010  
 * 23 0010001100   ttime       0011 00         00100011   1011   aka mcycle          
 * 24 0010010000   rInternISR  0100 00                           
 * 25 0010010100   rFFFFFF7F   0101 00         
 * 26 0010011000   r000000FF   0110 00         
 * 27 0010011100   r0000FFFF   0111 00         
 * 28 0010100000   rFFFF7FFF   1000 00         
 * 29 0010100100   mtvec       1001 00         
 * 2a 0010101000   r00000000   1010 00         
 * 2b 0010101100   rFFFFFFFF   1011 00         
 * 2c 0010110000   yy          1100            00101100   1100  
 * 2d 0010110100   mepc                        00101101   1101  
 * 2e 0010111000   mcause                      00101110   1110  
 * 2f 0010111100   mtval                       00101111   1111                
 * 
 * With EBRADRWIDTH == 8, highlevel use 12 LUTs
 * With EBRADRWIDTH == 8, lowlevel  use 10 LUTs
 */
module m_wai
  # ( parameter HIGHLEVEL = 0, EBRADRWIDTH = 8 )
   (
    input [EBRADRWIDTH+1:0]  ADR_O,
    input [4:0]              TRG,
    input                    sa24,sa25,sa26,sa27,
    output [EBRADRWIDTH-1:0] Wai,
    output                   m_wai_killwarning
    );
   
   generate
      if ( HIGHLEVEL != 0 ) begin
         /* verilator lint_off UNUSED */
         reg [11:0]  extWai;
         wire [11:0] zeros = 12'h0;
         /* verilator lint_on UNUSED */
         wire        u = TRG == 5'h0 ? 1'b1 : 1'b0;
         always @(/*AS*/ADR_O or TRG or sa24 or sa25 or sa26 or sa27
                  or u or zeros) begin
            case ({sa27,sa26,sa25,sa24})
              4'b0000 : extWai = {zeros[11:EBRADRWIDTH],ADR_O[EBRADRWIDTH+1:2]};  // 
              4'b0001 : extWai = {zeros[11:EBRADRWIDTH],ADR_O[EBRADRWIDTH+1:2]};  // 
              4'b0010 : extWai = {zeros[11:EBRADRWIDTH],ADR_O[EBRADRWIDTH+1:2]};  // 
              4'b0011 : extWai = {zeros[11:EBRADRWIDTH],ADR_O[EBRADRWIDTH+1:2]};  //          
              4'b0100 : extWai = {6'b0,u,TRG}; // 
              4'b0101 : extWai = {6'b0,u,TRG}; // 
              4'b0110 : extWai = {6'b0,u,TRG}; // 
              4'b0111 : extWai = {6'b0,u,TRG}; // 
              4'b1000 : extWai = 12'h20; // jj
              4'b1001 : extWai = 12'h21; // rinst
              4'b1010 : extWai = 12'h22; // pc
              4'b1011 : extWai = 12'h23; // ttime
              4'b1100 : extWai = 12'h2c; // yy            
              4'b1101 : extWai = 12'h2d; // mepc
              4'b1110 : extWai = 12'h2e; // mcause
              4'b1111 : extWai = 12'h2f; // mtval
            endcase
         end
         assign Wai = extWai[EBRADRWIDTH-1:0];
      end else begin
         wire preWai0,preWai1,waicy0,waicy1,waicy2,waicy3,waicy4;

         SB_LUT4 #(.LUT_INIT(16'hcaca)) L_2318(.O(preWai0),.I3(1'b0),.I2(sa27),.I1(sa24),.I0(ADR_O[2]));     
         SB_LUT4 #(.LUT_INIT(16'haae2)) L_2319(.O(Wai[0]),.I3(sa27),.I2(TRG[0]),.I1(sa26),.I0(preWai0));    SB_CARRY CY_2319(.CO(waicy0),.CI(1'b0),.I1(TRG[0]),.I0(sa26));
         SB_LUT4 #(.LUT_INIT(16'hcaca)) L_2320(.O(preWai1),.I3(1'b0),.I2(sa27),.I1(sa25),.I0(ADR_O[3]));     
         SB_LUT4 #(.LUT_INIT(16'haae2)) L_2321(.O(Wai[1]),.I3(sa27),.I2(TRG[1]),.I1(sa26),.I0(preWai1));    SB_CARRY CY_2321(.CO(waicy1),.CI(waicy0),.I1(TRG[1]),.I0(sa26));
         SB_LUT4 #(.LUT_INIT(16'hcce2)) L_2322(.O(Wai[2]),.I3(sa27),.I2(TRG[2]),.I1(sa26),.I0(ADR_O[4]));   SB_CARRY CY_2322(.CO(waicy2),.CI(waicy1),.I1(TRG[2]),.I0(sa26));
         SB_LUT4 #(.LUT_INIT(16'hcce2)) L_2323(.O(Wai[3]),.I3(sa27),.I2(TRG[3]),.I1(sa26),.I0(ADR_O[5]));   SB_CARRY CY_2323(.CO(waicy3),.CI(waicy2),.I1(TRG[3]),.I0(sa26));
         SB_LUT4 #(.LUT_INIT(16'h00e2)) L_2324(.O(Wai[4]),.I3(sa27),.I2(TRG[4]),.I1(sa26),.I0(ADR_O[6]));   SB_CARRY CY_2324(.CO(waicy4),.CI(waicy3),.I1(TRG[4]),.I0(sa26));
         SB_LUT4 #(.LUT_INIT(16'hf2fe)) L_2325(.O(Wai[5]),.I3(waicy4),.I2(sa27),.I1(sa26),.I0(ADR_O[7]));    
         SB_LUT4 #(.LUT_INIT(16'h0202)) L_2326(.O(Wai[6]),.I3(1'b0),.I2(sa27),.I1(sa26),.I0(ADR_O[8]));      
         SB_LUT4 #(.LUT_INIT(16'h0202)) L_2327(.O(Wai[7]),.I3(1'b0),.I2(sa27),.I1(sa26),.I0(ADR_O[9]));      
         
         if ( EBRADRWIDTH > 8 ) begin
            SB_LUT4 #(.LUT_INIT(16'h0202)) L_93(.O(Wai[8]),.I3(1'b0),.I2(sa27),.I1(sa26),.I0(ADR_O[10]));      
            if ( EBRADRWIDTH > 9 ) begin
               SB_LUT4 #(.LUT_INIT(16'h0202)) L_95(.O(Wai[9]),.I3(1'b0),.I2(sa27),.I1(sa26),.I0(ADR_O[11]));      
               if ( EBRADRWIDTH > 10 ) begin
                  SB_LUT4 #(.LUT_INIT(16'h0202)) L_97(.O(Wai[10]),.I3(1'b0),.I2(sa27),.I1(sa26),.I0(ADR_O[12]));      
               end
            end
         end
      end
   endgenerate
   assign m_wai_killwarning = &ADR_O[1:0];
endmodule
    
