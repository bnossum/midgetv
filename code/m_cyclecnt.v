/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * A cycle counter with a 64-bit resolution is mandatory in most
 * implementations of RISC-V. I solve this by timing each
 * instructions, which is a maximum of 41 cycles. Between instructions
 * this binary counter is added to ttime, and the counter is reset to
 * 0b000001.
 * The cycle counter is multiplexed with ADR_O used by input B of the
 * ALU during WAIT1. 
 *
 * We must also be able to increment the PC with 3 and 4, this
 * functionallity is also taken care of here (together with the carry input).
 * 
 * If the 6-bit counter overflows when the core is running, we exit to a 
 * trap with bus-error. 
 * 
 * With NO_CYCLECNT == 0
 * sa17
 * |sa16 QQ
 * 00    {ADR_O[5:2],2'b11}   To implement +3 and +4
 * x1    rccnt                Muxing in time counter
 * 10    ADR_O[5:0]           Let through ADR_O
 * 
 * With NO_CYCLECNT == 1
 * sa17
 * |sa16 QQ
 * 0x    {ADR_O[5:2],2'b11}   To implement +3 and +4
 * 1x    ADR_O[5:0]           Let through ADR_O
 * 
 * This module also determines if midgetv is up and running. 
 * 1. If we have no cyclecounter, corerunning = start, an external signal that
 *    is supposed to go high and stay high, when midgetv is to be let free.
 * 2. If we have a cyclecounter, start is used as an enable for the counter, and
 *    must be high 64 consequtive cycles to let midgetv free.
 */
module m_cyclecnt
  # ( parameter HIGHLEVEL = 0, NO_CYCLECNT = 0 )
  ( 
    input         clk,
    input         sa17,sa16,
    input [31:0]  ADR_O,
    input         start,
    output [31:0] QQ, 
    output        corerunning,
    output        buserror,
    output        m_cyclecnt_kill
    );

   generate
      if ( HIGHLEVEL ) begin
         
         if ( NO_CYCLECNT == 1 ) begin
            assign QQ[5:2] = ADR_O[5:2];
            assign QQ[1:0] = sa17 ? ADR_O[1:0] : 2'b11;
            assign m_cyclecnt_kill = sa17 | sa16 | clk;
            /*
             * No cycle counter, so no other option than to run the core based 
             * on start alone. No possibilities to find a bus error. Hovever,
             * for a startup condition buserror is asserted the very first 
             * cycle midgetv is released from hardware reset.
             */
            assign corerunning = start;

            wire        notveryfirst;
            SB_DFF notveryfirst_r( .Q(notveryfirst), .C(clk), .D(1'b1));
            
            assign buserror =  ~notveryfirst;
            
         end else begin
            
            reg [5:0]   rccnt;
            wire [6:0]  ccnt = start ? (sa16 ? 7'h01 : {1'b0,rccnt} + 7'h1) : 7'h1;
            
            always @(posedge clk) 
              rccnt <= ccnt[5:0];
         
            assign QQ[5:0] = sa16 ? rccnt : (sa17 ? ADR_O[5:0] : (ADR_O[5:0] | 6'h3) );


            // Can't get this to work?? Whatever...
            //reg         rcorerunning;
            //always @(posedge clk)
            //  rcorerunning <= (ccnt[6] & start) | rcorerunning;
            //assign corerunning = rcorerunning;
            wire        kluge;
            SB_LUT4 #(.LUT_INIT(16'hf8f8)) cmb_running( .O(kluge), .I3(1'b0), .I2(corerunning), .I1(ccnt[6]), .I0(start));
            SB_DFF kluge_r( .Q(corerunning), .C(clk), .D(kluge));
            assign m_cyclecnt_kill = 1'b0;

            /*
             * Instruction used 64 cycles, surely an error.
             * Written like this to be equal to lowlevel version: 
             */
            wire        notveryfirst;
            SB_DFF notveryfirst_r( .Q(notveryfirst), .C(clk), .D(1'b1));
            
            assign buserror = (corerunning & ccnt[6] & ~sa16)
                              | ~notveryfirst; // giens
         end

      end else begin

         /*               __
          *             -|I0 |
          *             -|I1 |-buserror
          *  sa16 -------|I2 |
          *           +--|I3_|
          *           |
          *          /y\
          *          |||   ___                  
          * start   -(((-|I0 |             __  
          *      0  -((+-|I1 |-cmb_rcrun--|  |-- rcrun == corerunning
          * rcrun ---+(--|I2 |            >__|      
          *           +--|I3_|                      
          *           |ccntcy[6]
          *          /y\
          *          |||  ___                              ___         
          * start   -(((-|I0 |             __   ADR_O[5] -|I0 |           
          * rcnt[5] -((+-|I1 |-ccnt[5]----|  |-- rcnt[5] -|I1 |- QQ[5] 
          *    sa16 -+(--|I2 |            >__|      sa16 -|I2 |        
          *           +--|I3_|                      sa17 -|I3_|        
          *           |ccntcy[5]
          *          /y\
          *          |||  ___                              ___         
          * start   -(((-|I0 |             __   ADR_O[4] -|I0 |        
          * rcnt[4] -((+-|I1 |-ccnt[4]----|  |-- rcnt[4] -|I1 |- QQ[4] 
          *    sa16 -+(--|I2 |            >__|      sa16 -|I2 |        
          *           +--|I3_|                      sa17 -|I3_|        
          *           |ccntcy[4]
          *          /y\
          *          |||  ___                              ___         
          * start   -(((-|I0 |             __   ADR_O[3] -|I0 |        
          * rcnt[3] -((+-|I1 |-ccnt[3]----|  |-- rcnt[3] -|I1 |- QQ[3] 
          *    sa16 -+(--|I2 |            >__|      sa16 -|I2 |        
          *           +--|I3_|                      sa17 -|I3_|        
          *           |ccntcy[3]
          *          /y\
          *          |||  ___                              ___         
          * start   -(((-|I0 |             __   ADR_O[2] -|I0 |        
          * rcnt[2] -((+-|I1 |-ccnt[2]----|  |-- rcnt[2] -|I1 |- QQ[2] 
          *    sa16 -+(--|I2 |            >__|      sa16 -|I2 |        
          *           +--|I3_|                      sa17 -|I3_|        
          *           |ccntcy[2]
          *          /y\
          *          |||  ___                              ___         
          * start   -(((-|I0 |             __   ADR_O[1] -|I0 |        
          * rcnt[1] -((+-|I1 |-ccnt[1]----|  |-- rcnt[1] -|I1 |- QQ[1] 
          *    sa16 -+(--|I2 |            >__|      sa16 -|I2 |        
          *           +--|I3_|                      sa17 -|I3_|        
          *           | ccntcy[1]
          *          /y\
          *          |||  ___                              ___  
          * start   -(((-|I0 |             __   ADR_O[0] -|I0 | 
          * rcnt[0] -((+-|I1 |-ccnt[0]----|  |-- rcnt[0] -|I1 |- QQ[0]
          *    sa16 -+(--|I2 |            >__|      sa16 -|I2 | 
          *           +--|I3_|                      sa17 -|I3_|        
          *           |
          *           1
          */

         genvar j;
         
         if ( NO_CYCLECNT == 1 ) begin

            assign QQ[5:2] = ADR_O[5:2];
            for ( j = 0; j < 2; j = j + 1 ) begin : blk1
               SB_LUT4 #(.LUT_INIT(16'hbbbb)) qqmux(.O(QQ[j]),.I3(1'b0),.I2(1'b0), .I1(sa17), .I0(ADR_O[j])); 
            end
            assign corerunning = start;
            assign buserror = 1'b0;            
            assign m_cyclecnt_kill = clk | sa16;

         end else begin

            wire [5:0] ccnt,rccnt;
            /* verilator lint_off UNOPTFLAT */
            wire [6:0] ccntcy;
            /* verilator lint_on UNOPTFLAT */

            assign m_cyclecnt_kill = 1'b0;
            assign ccntcy[0] = 1'b1;
            
            for ( j = 0; j < 6; j = j + 1 ) begin : blk0
               if ( j == 0 ) begin
                  SB_LUT4 #(.LUT_INIT(16'hf7fd)) ccnt_l(   .O(ccnt[j]), .I3(ccntcy[j]), .I2(sa16), .I1(rccnt[j]), .I0(start));
               end else begin
                  SB_LUT4 #(.LUT_INIT(16'h0208)) ccnt_l(   .O(ccnt[j]), .I3(ccntcy[j]), .I2(sa16), .I1(rccnt[j]), .I0(start));
               end
               SB_CARRY contcy_l( .CO(ccntcy[j+1]),                  .CI(ccntcy[j]), .I1(sa16), .I0(rccnt[j]));
               SB_DFF rccnt_r( .Q(rccnt[j]), .C(clk), .D(ccnt[j]));

               if ( j < 2 ) begin
                  SB_LUT4 #(.LUT_INIT(16'hccaf)) qqmux(.O(QQ[j]),.I3(sa16),.I2(sa17),.I1(rccnt[j]),.I0(ADR_O[j]));
               end else begin
                  SB_LUT4 #(.LUT_INIT(16'hcaca)) qqmux(.O(QQ[j]),.I3(1'b0),.I2(sa16),.I1(rccnt[j]),.I0(ADR_O[j]));
               end
            end   

            wire cmb_rcrun,rcrun,buserrcy;
            SB_LUT4 #(.LUT_INIT(16'hfaf0)) rcrun_l( .O(cmb_rcrun), .I3(ccntcy[6]), .I2(rcrun), .I1(1'b0), .I0(start));
            SB_CARRY buserrcy_i( .CO(buserrcy),                    .CI(ccntcy[6]), .I1(rcrun), .I0(1'b0));
            SB_DFF rcorerunning_r( .Q(rcrun), .C(clk), .D(cmb_rcrun) );
            assign corerunning = rcrun;

            SB_LUT4 #(.LUT_INIT(16'h0f00)) buserror_l( .O(buserror), .I3(buserrcy), .I2(sa16), .I1(1'b0), .I0(1'b0));
         end
      end
   endgenerate
   
   assign QQ[31:6] = ADR_O[31:6];
endmodule
