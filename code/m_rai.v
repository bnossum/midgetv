/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * We must be able to read the registers, and internal working
 * variables and magical constants. We must also be able to execute 
 * in this Blockram, this is the home of my Bootloader.
 *
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
 * 25 0010010100   rFFFFFF7F   0101 00         x
 * 26 0010011000   r000000FF   0110 00         
 * 27 0010011100   r0000FFFF   0111 00         
 * 28 0010100000   rFFFF7FFF   1000 00         
 * 29 0010100100   mtvec       1001 00         
 * 2a 0010101000   r00000000   1010 00         x
 * 2b 0010101100   rFFFFFFFF   1011 00         
 * 2c 0010110000   yy          1100            00101100   1100  
 * 2d 0010110100   mepc                        00101101   1101  
 * 2e 0010111000   mcause                      00101110   1110  
 * 2f 0010111100   mtval                       00101111   1111                
 * 
 * There are a few irregularities on the read address. 
 *     sa23 may be modified. This is used to either read rFFFFFFFF or tinytime 
 *     during instruction fetch. 
 *     With sa[23:20] = 1011, rFFFFFFFF is always read, sa23mod == 1.
 *     With sa[23:20] = 0011, rFFFFFFFF is read when rack == 0, then sa23mod == 1
 *                            tinytime is read when rack == 1, then sa23mod == 0
 *
 *     sa20 may be modified, with sa34 == 1, sa20 is dependent on rack
 *     This is used to select r00000000 or rFFFFFFFF in the last cycle
 *     of memory read for instructions lb, lb, lbu, and lhu, needed
 *     to get shifting correct.
 * 
 */

module m_rai
  # ( parameter HIGHLEVEL = 0, EBRADRWIDTH = 8 )
   (
    input [EBRADRWIDTH+1:0]  B, //        Read address may come directly out from ALU
    input [4:0]              SRC1, //     or from source register 1
    input [4:0]              SRC2, //     or source register 2
    input                    sa20, //     | These are the basic select signals
    input                    sa21, //     |
    input                    sa22, //     |
    input                    sa23, //     |
    input                    ACK_I, //    || These may modify sa20
    input                    sram_ack, // ||
    input                    sysregack,// ||
    input                    sa34, //     ||
    input                    sa40,
    input                    STB_O,
    input                    sram_stb,
    output [EBRADRWIDTH-1:0] Rai,
    output                   m_rai_killwarning
    );
   /*
    sa40
    |sa34
    ||
    00                     {sa23,sa22,sa21,sa20 }  Normal select
    01 & ~anyack           {sa23,sa22,sa21,1'b0 }  Force L         1010 // | Only ever selects between
    01 & anyack            {sa23,sa22,sa21,sa20 }  Force H         1011 // | these. rHorL
    10 & ~anystrobe        {1'b0,sa22,sa21,1'b0 }  Force PC        0010 // || Only ever selects between
    10 & anystrobe         {sa23,sa22,sa21,sa20 }  Force H         1011 // || these. rHorPC
    11 & ~anystrobe        {1'b0,sa22,sa21,sa20 }  Force Ttime     0011 // | Only ever selects between
    11 & anystrobe         {sa23,sa22,sa21,sa20 }  Force H         1011 // | these. rHorTtime
                                        
                               
    */
   generate
      if ( HIGHLEVEL != 0 ) begin
         wire [11:0]               zeros = 12'h0;
         wire                      anyack;
         wire                      anystrobe;
         wire [3:0]                sel;
         reg [11:0]                extRai;

         assign anyack    = ACK_I | sram_ack | sysregack;
         assign anystrobe = STB_O | sram_stb;
         assign sel[0]    = sa20 & ( (~sa40 & ~sa34 )             |
                                     (~sa40 &  sa34 & anyack )    |
                                     ( sa40 & ~sa34 & anystrobe ) |
                                     ( sa40 &  sa34) );
         assign sel[1]    = sa21;
         assign sel[2]    = sa22;
         assign sel[3]    = sa23 & ( ~sa40 | anystrobe );

//         ( (~sa40 & ~sa34 ) |
//           (~sa40 &  sa34 ) |
//           ( sa40 & ~sa34 & anystrobe ) |
//           ( sa40 &  sa34 & anystrobe ) );
         always @(/*AS*/B or SRC1 or SRC2 or sel or zeros)
           case ( sel )
             4'b0000 : extRai = 12'h20; // jj
             4'b0001 : extRai = 12'h21; // rinst
             4'b0010 : extRai = 12'h22; // pc
             4'b0011 : extRai = 12'h23; // ttime         
             4'b0100 : extRai = 12'h24; // rInternISR    
             4'b0101 : extRai = 12'h25; // rFFFFFF7F     
             4'b0110 : extRai = 12'h26; // r000000FF     
             4'b0111 : extRai = 12'h27; // r0000FFFF     
             4'b1000 : extRai = 12'h28; // rFFFF7FFF     
             4'b1001 : extRai = 12'h29; // mtvec         
             4'b1010 : extRai = 12'h2a; // r00000000     
             4'b1011 : extRai = 12'h2b; // rFFFFFFFF     
             4'b1100 : extRai = 12'h2c; // yy            
             4'b1101 : extRai = {zeros[11:EBRADRWIDTH],B[EBRADRWIDTH+1:2]};  // ALU
             4'b1110 : extRai = {7'b0,SRC2}; // SRC2
             4'b1111 : extRai = {7'b0,SRC1}; // SRC1                                        
            endcase

         assign Rai = extRai[EBRADRWIDTH-1:0];
         assign m_rai_killwarning = &B[1:0] & &extRai;
         
      end else begin
         wire [3:0] sel;
         assign m_rai_killwarning = &B[1:0];

         wire       sel0_helpack,sel0_more_h1,sel0_more,ss0,ss1,b0a,b1a,b2a,b3a,b4a;
         
//         assign sel0_helpack = ~sa40 & sa34 & sa20;
//         assign sel0_more_h1 = (~sa40 & ~sa34) | (sa40 & sa34) | (sa40 & ~sa34 & (STB_O | sram_stb));
//         assign sel0_more = sa20 & ((sel0_helpack & sysregack) | sel0_more_h1);
         SB_LUT4 #(.LUT_INIT(16'h0808)) L_sel0_helpack( .O(sel0_helpack), .I3(1'b0), .I2(sa40), .I1(sa34), .I0(sa20));
         SB_LUT4 #(.LUT_INIT(16'hfe0f)) L_sel0_more_h1( .O(sel0_more_h1), .I3(sa40), .I2(sa34), .I1(STB_O), .I0(sram_stb));
         SB_LUT4 #(.LUT_INIT(16'hea00)) L_sel0_more(    .O(sel0_more),    .I3(sa20), .I2(sel0_helpack), .I1(sysregack), .I0(sel0_more_h1));
                   
//         assign sel[0] =  sel0_more | (sel0_helpack & (ACK_I | sram_ack));
//         assign sel[3] = sa23 & ( STB_O | sram_stb | ~sa40 );
         assign sel[1] = sa21;
         assign sel[2] = sa22;
         SB_LUT4 #(.LUT_INIT(16'hffe0)) L_sel_0( .O(sel[0]), .I3(sel0_more), .I2(sel0_helpack), .I1(ACK_I), .I0(sram_ack));
         SB_LUT4 #(.LUT_INIT(16'hfd00)) L_sel_3( .O(sel[3]), .I3(sa23), .I2(STB_O), .I1(sram_stb), .I0(sa40));
         
         
         SB_LUT4 #(.LUT_INIT(16'h8080)) L_ss0( .O(ss0), .I3(1'b0), .I2(sel[0]), .I1(sel[3]), .I0(sel[2]));
         SB_LUT4 #(.LUT_INIT(16'h8080)) L_ss1( .O(ss1), .I3(1'b0), .I2(sel[3]), .I1(sel[2]), .I0(sel[1]));
         
         /* ss1 -----I3--------+---------------I3----------+
          * ss0 -----I2--+----|0\                          |
          * SRC1[0] -I1-|1\   |  |-------------I2---+-----|1\
          *             |  |--|1/     B[2] --- I1 -|1\    |  |--- Rai[0]   
          * SRC2[0] -I0-|0/                        |  |---|0/
          *                         sel[0] --- I0 -|0/
          */

         SB_LUT4 #(.LUT_INIT(16'hcaf0)) L_b0a(  .O(b0a),    .I3(ss1), .I2(ss0), .I1(SRC1[0]), .I0(SRC2[0]));
         SB_LUT4 #(.LUT_INIT(16'hf0ca)) L_Rai0( .O(Rai[0]), .I3(ss1), .I2(b0a), .I1(B[2]),    .I0(sel[0]));
         
         /* ss1 -----I3--------+---------------I3----------+
          * ss0 -----I2--+----|0\                          |
          * SRC1[x] -I1-|1\   |  |-------------I2---+-----|1\
          *             |  |--|1/   B[x+2] --- I1 -|1\    |  |--- Rai[x]   x = 1,2,3
          * SRC2[x] -I0-|0/                        |  |---|0/
          *                         sel[0] --- I0 -|0/
          */

         SB_LUT4 #(.LUT_INIT(16'hcaf0)) L_b1a(  .O(b1a),    .I3(ss1), .I2(ss0), .I1(SRC1[1]), .I0(SRC2[1]));
         SB_LUT4 #(.LUT_INIT(16'hf0ca)) L_Rai1( .O(Rai[1]), .I3(ss1), .I2(b1a), .I1(B[3]),    .I0(sel[1]));
         SB_LUT4 #(.LUT_INIT(16'hcaf0)) L_b2a(  .O(b2a),    .I3(ss1), .I2(ss0), .I1(SRC1[2]), .I0(SRC2[2]));
         SB_LUT4 #(.LUT_INIT(16'hf0ca)) L_Rai2( .O(Rai[2]), .I3(ss1), .I2(b2a), .I1(B[4]),    .I0(sel[2]));
         SB_LUT4 #(.LUT_INIT(16'hcaf0)) L_b3a(  .O(b3a),    .I3(ss1), .I2(ss0), .I1(SRC1[3]), .I0(SRC2[3]));
         SB_LUT4 #(.LUT_INIT(16'hf0ca)) L_Rai3( .O(Rai[3]), .I3(ss1), .I2(b3a), .I1(B[5]),    .I0(sel[3]));

         /* ss1 -----I3--------+---------------I3----------+
          * ss0 -----I2--+----|0\                          |
          * SRC1[4] -I1-|1\   |  |-------------I2---+-----|1\
          *             |  |--|1/   B[4+2] --- I1 -|1\    |  |--- Rai[4]
          * SRC2[4] -I0-|0/                        |  |---|0/
          *                              0 --- I0 -|0/
          */
         SB_LUT4 #(.LUT_INIT(16'hcaf0)) L_b4a(  .O(b4a),    .I3(ss1), .I2(ss0), .I1(SRC1[4]), .I0(SRC2[4]));
         SB_LUT4 #(.LUT_INIT(16'hf0ca)) L_Rai4( .O(Rai[4]), .I3(ss1), .I2(b4a), .I1(B[6]),    .I0(1'b0));

         /* ss1 -----I3--------+---------------I3----------+
          * ss0 -----I2--+----|0\                          |
          *       0 -I1-|1\   |  |-------------I2---+-----|1\
          *             |  |--|1/   B[5+2] --- I1 -|1\    |  |--- Rai[5]
          *       0 -I0-|0/                        |  |---|0/
          *                              1 --- I0 -|0/
          * But this can be simplified.
          * 
          */
         SB_LUT4 #(.LUT_INIT(16'h00cf)) L_Rai5( .O(Rai[5]), .I3(ss1), .I2(ss0), .I1(B[7]), .I0(1'b0));
         /*
          * Rai[6] = ~s1 & s0 & B[8] 
          * Rai[7] = ~s1 & s0 & B[9] etc
          */
         SB_LUT4 #(.LUT_INIT(16'h0808)) L_Rai6( .O(Rai[6]), .I3(1'b0), .I2(ss1), .I1(ss0), .I0(B[8]));
         SB_LUT4 #(.LUT_INIT(16'h0808)) L_Rai7( .O(Rai[7]), .I3(1'b0), .I2(ss1), .I1(ss0), .I0(B[9]));
         if ( EBRADRWIDTH > 8 ) begin
            SB_LUT4 #(.LUT_INIT(16'h0808)) L_Rai8( .O(Rai[8]), .I3(1'b0), .I2(ss1), .I1(ss0), .I0(B[10]));
            if ( EBRADRWIDTH > 9 ) begin
               SB_LUT4 #(.LUT_INIT(16'h0808)) L_Rai9( .O(Rai[9]), .I3(1'b0), .I2(ss1), .I1(ss0), .I0(B[11]));
               if ( EBRADRWIDTH > 10 ) begin
                  SB_LUT4 #(.LUT_INIT(16'h0808)) L_Rai10( .O(Rai[10]), .I3(1'b0), .I2(ss1), .I1(ss0), .I0(B[12]));
               end
            end
         end            
      end
   endgenerate
endmodule
    
