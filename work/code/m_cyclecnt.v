/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 *
 * This module:
 * ------------
 * o Construction to modify an alu input so that +3 and +4 can be realized easily
 * o Construction to hold execution of midgetv for the first cycle 
 * o Optionally support for the cycle counter, and by extension mtime
 * o Optionally support for detection of bus-error
 * 
 * 
 *  
 * A cycle counter with a 64-bit resolution is mandatory in most
 * implementations of RISC-V. I solve this by timing each instructions,
 * in a 6-bit counter rcnt. Duing OpCode fetch this counter is added to ttime, 
 * the counter is reset to 0b000001. Register ttime contains the low 32 bits of 
 * the cycle counter. rcnt is multiplexed with ADR_O used by input QQ of the
 * ALU during a cycle in OpCode fetch.
 *
 * We must be able to let the ALU increment by 3 or 4, also 
 * taken care of here. This is among other used when PC is incremented.
 * 
 * This module also determines if midgetv is up and running. 
 * -  If we have no cyclecounter, corerunning goes high one cycle after
 *    input signal "start is asserted.  
 * -  If we have a cyclecounter, start is used as an enable for the counter, and
 *    must be high 64 consequtive cycles to let midgetv free. This should be
 *    handy if the clock of midgetv comes from a PLL or (as is the case of
 *    iceblink40-hx1k boards) an unstable clock.
 * 
 * If the 6-bit counter rcnt reaches 32 after the core is running, and STB_O
 * is set, we exit to a trap with bus-error. This  will happen if an IO device 
 * does not answer in a reasonable number of cycles. 
 * So how many cycles of IO before a bus-error happens? These are rough numbers:
 * - LW/LH(U)/LB(U)     : 48 -2       = 46
 * - SW                 : 48 -2       = 46
 * - SH aligned         : 48 -2 -5-0  = 41
 * - SH unaligned       : 48 -2 -5-16 = 25
 * - SB to lsb adr 0b00 : 48 -2 -5-0  = 41
 * - SB to lsb adr 0b01 : 48 -2 -5-8  = 33
 * - SB to lsb adr 0b10 : 48 -2 -5-16 = 25
 * - SB to lsb adr 0b11 : 48 -2 -5-24 = 17
 * 
 * 
 * To save a few LUTs, rcnt is optonal - NO_CYCLECNT == 1:
 * sa17
 * |sa16 QQ[5:0]
 * 0x    {ADR_O[5:2],2'b11}   To implement +3 and +4
 * x1    {ADR_O[5:1],start}   rcnt degenerateds to instruction counter.
 * 1x    ADR_O[5:0]           Let through ADR_O
 * 
 * I believe most implementations will pay the price of 11 LUTs to 
 * get the cycle counter. With NO_CYCLECNT == 0:
 * 
 * sa17                      Resets counter to 1
 * |sa16 QQ[5:0]             |
 * ----- -------             -
 * 00    {ADR_O[5:2],2'b11}  0  To implement +3 and +4
 * x1    rccnt               1  Muxing in rcnt
 * 10    ADR_O[5:0]          0  Let through ADR_O
 * 
 * 
 * 
 * Sizes:
 * HIGHLEVEL == 1, NO_CYCLECNT == 0, Lattice LSE  : 22
 * HIGHLEVEL == 1, NO_CYCLECNT == 0, Synplify Pro : 24
 * HIGHLEVEL == 1, NO_CYCLECNT == 1, Lattice LSE  :  3
 * HIGHLEVEL == 1, NO_CYCLECNT == 1, Synplify Pro :  3
 * HIGHLEVEL == 0, NO_CYCLECNT == 0               : 14
 * HIGHLEVEL == 0, NO_CYCLECNT == 1               :  3
 * 
 * Parameters:
 * -----------
 * HIGHLEVEL
 * ---------
 * 1 : RTL description
 * 0 : Low-level primitives
 * 
 * NO_CYCLECOUNT
 * -------------
 * As described above
 * 
 */
module m_cyclecnt
  # ( parameter HIGHLEVEL = 1, NO_CYCLECNT = 0 )
  ( 
    input         clk,
    input         start,
    input         sa16,
    input         sa17,
/* verilator lint_off UNUSED */
    input         STB_O,
/* verilator lint_on UNUSED */
    input [31:0]  ADR_O,
    output [31:0] QQ, 
    output        corerunning,
    output        buserror, 
    output [5:0]  dbg_rccnt
    );
   
   generate
      
      if ( HIGHLEVEL ) begin
         wire cmbrcrun /* synthesis syn_keep=1 */;
         reg  rcrun /* synthesis syn_keep=1 */;
         
         if ( NO_CYCLECNT == 1 ) begin
            
            // =======================================================
            // HIGLEVEL, NO CYCLECNT
            // Note the flipflop "rcrun". Even if "start" is hardcoded
            // to 1, midgetv will wait one cycle at startup, so that
            // control output from EBR is valid.
            // No possibility to find a bus error.
            // =======================================================
            assign QQ[6:2] = ADR_O[6:2];
            assign QQ[1:0] = sa16 ? {ADR_O[1],start} : (sa17 ? ADR_O[1:0] : 2'h3 );
            assign buserror = 1'b0;
            assign cmbrcrun = rcrun | start;
            always @(posedge clk)
              rcrun <= cmbrcrun;
            assign corerunning = rcrun;
            assign dbg_rccnt = {5'b0,STB_O};
            
         end else begin
            
            // =======================================================
            // HIGLEVEL, CYCLECNT
            // When start has been asserted 64 consequtive cycles, 
            // rcrun is set, the core is running. Even if start is
            // deasserted later on, the core continues to run. However,
            // the cycle counter will only count if start is high.
            //
            // If the cyclecounter increments from 0b101111 we have
            // a bus-error, some IO has not given ACK, buserror is 
            // set one cycle.
            // =======================================================

            reg [5:0]   rccnt;
            reg         rbuserror;
            wire [6:0]  ccnt = start ? (sa16 ? 1 : rccnt + 1) : 0;
            wire        cmbbuserror = (rccnt == 6'b101111) & STB_O;
            
            assign cmbrcrun    = ccnt[6] | rcrun;
            
            always @(posedge clk) begin
               rccnt[5:0] <= ccnt[5:0];
               rcrun      <= cmbrcrun;
               rbuserror  <= cmbbuserror;
            end
            
            assign QQ[5:0] = sa16 ? rccnt : (sa17 ? ADR_O[5:0] : {ADR_O[5:2],2'h3} );
            assign buserror = rbuserror;
            assign corerunning = rcrun;
            assign dbg_rccnt = rccnt;
         end

      end else begin

         if ( NO_CYCLECNT == 1 ) begin

            // =======================================================
            // LOWLEVEL, NO CYCLECNT
            // =======================================================
            wire cmb_rcrun;
            assign QQ[5:2] = ADR_O[5:2];
            SB_LUT4 #(.LUT_INIT(16'habab)) qqmux1(.O(QQ[1]),.I3(1'b0),.I2(sa16), .I1(sa17), .I0(ADR_O[1])); 
            SB_LUT4 #(.LUT_INIT(16'haacf)) qqmux0(.O(QQ[0]),.I3(sa16),.I2(sa17), .I1(ADR_O[0]), .I0(start)); 
            SB_LUT4 #(.LUT_INIT(16'heeee)) cmb_rcrun_l(.O(cmb_rcrun), .I3(1'b0), .I2(1'b0), .I1(corerunning), .I0(start));
            SB_DFF rcrun(.Q(corerunning), .C(clk), .D(cmb_rcrun));

            assign buserror = 1'b0;            
            assign dbg_rccnt = 0;
            
         end else begin

            // =======================================================
            // LOWLEVEL, CYCLECNT
            // =======================================================
            
            /*               ___                  
             *         -----|I0 |              __  
             *         -----|I1 |-cmb_rcrun---|  |-- corerunning
             * corerunning -|I2 |             >__|      
             *           +--|I3_|                      
             *           |ccntcy[5]
             *          /y\
             *          |||  ___                                           ___         
             * start   -(((-|I0 |              __             ADR_O[5] ---|I0 |           
             * rcnt[5] -((+-|I1 |-ccnt[5]-----|  |-- rcnt[5] -------------|I1 |- QQ[5] 
             *    sa16 -+(--|I2 |             >__|                  sa16 -|I2 |        
             *           +--|I3_|                                        -|I3_|        
             *           |ccntcy[4]                         
             *          /y\                                 
             *          |||  ___                                           ___         
             * start   -(((-|I0 |              __             ADR_O[4] ---|I0 |        
             * rcnt[4] -((+-|I1 |-ccnt[4]-----|  |-- rcnt[4] -------------|I1 |- QQ[4] 
             *    sa16 -+(--|I2 |             >__|                  sa16 -|I2 |        
             *           +--|I3_|                                        -|I3_|        
             *           |ccntcy[3]                         
             *           |
             *           |
             *           |                                                 ___   
             *           |                                   0       -----|I0 |                 __
             *           |                                   STB_O   -----|I1 |- cmbbuserror --|  |-- buserror
             *           |                                   rcnt[5] -----|I2 |                >__|
             *           |                                             +--|I3_|  
             *           |                                             |qqcy[3]
             *          /y\                                           /y\ 
             *          |||  ___                                      |||  ___         
             * start   -(((-|I0 |              __           ADR_O[3] -(((-|I0 |        
             * rcnt[3] -((+-|I1 |-ccnt[3]-----|  |-- rcnt[3] ---------((+-|I1 |- QQ[3] 
             *    sa16 -+(--|I2 |             >__|              sa16 -+(--|I2 |        
             *           +--|I3_|                                  0 --(--|I3_|        
             *           |ccntcy[2]                                    |qqcy[2]
             *          /y\                                           /y\ 
             *          |||  ___                                      |||  ___         
             * start   -(((-|I0 |              __           ADR_O[2] -(((-|I0 |        
             * rcnt[2] -((+-|I1 |-ccnt[2]-----|  |-- rcnt[2] ---------((+-|I1 |- QQ[2] 
             *    sa16 -+(--|I2 |             >__|              sa16 -+(--|I2 |        
             *           +--|I3_|                                  0 --(--|I3_|        
             *           |ccntcy[1]                                    |qqcy[1]
             *          /y\                                           /y\ 
             *          |||  ___                                      |||  ___         
             * start   -(((-|I0 |              __           ADR_O[1] -(((-|I0 |        
             * rcnt[1] -((+-|I1 |-ccnt[1]-----|  |-- rcnt[1] ---------((+-|I1 |- QQ[1] 
             *    sa16 -+(--|I2 |             >__|              sa16 -+(--|I2 |        
             *           +--|I3_|                               sa17 --(--|I3_|        
             *           |ccntcy[0]                                    |qqcy[0]
             *          /y\                                           /y\ 
             *          |||  ___                                      |||  ___  
             * start   -(((-|I0 |              __           ADR_O[0] -(((-|I0 | 
             * rcnt[0] -((+-|I1 |-ccnt[0]-----|  |-- rcnt[0] ---------((+-|I1 |- QQ[0]
             *       0 -+(--|I2 |             >__|              sa16 -+(--|I2 | 
             *    sa16 --(--|I3_|                               sa17 --(--|I3_|        
             *           |                                             |
             *           1                                             1
             *
             * Note subtility in lut of ccnt[0]. The very first cycle sa16 is unknown. We want to 
             * kill the carry chain or else rcrun will go high prematurely.
             *
             */
            
            wire [5:0] ccnt,rccnt;
            /* verilator lint_off UNOPTFLAT */
            wire [5:0] ccntcy;
            wire [3:0] qqcy;
            /* verilator lint_on UNOPTFLAT */
            wire       cmb_rcrun,cmbbuserror;
            
            bn_lcy4_b #(.I(16'haa22)) l_ccntlsb(     .o(ccnt[0]),   .co(ccntcy[0]),   .ci(1'b1),        .i3(sa16),        .i2(1'b0),  .i1(rccnt[0]),   .i0(start));
            bn_lcy4_b #(.I(16'h0208)) l_ccnt [4:0] ( .o(ccnt[5:1]), .co(ccntcy[5:1]), .ci(ccntcy[4:0]), .i3(ccntcy[4:0]), .i2(sa16),  .i1(rccnt[5:1]), .i0(start));
            bn_l4     #(.I(16'hfff0)) l_rcrun      ( .o(cmb_rcrun), .i3(ccntcy[5]), .i2(corerunning), .i1(1'b0), .i0(1'b0));
            SB_DFF r_rcntlsb [5:0] ( .Q(rccnt),       .C(clk), .D(ccnt));
            SB_DFF r_rcrun         ( .Q(corerunning), .C(clk), .D(cmb_rcrun));

            bn_lcy4_b #(.I(16'hcacf)) c_qq_10 [1:0] (.o(QQ[1:0]), .co(qqcy[1:0]), .ci({qqcy[0],1'b1}), .i3(sa17), .i2(sa16), .i1(rccnt[1:0]), .i0(ADR_O[1:0]) );
            bn_lcy4_b #(.I(16'hcaca)) c_qq_32 [1:0] (.o(QQ[3:2]), .co(qqcy[3:2]), .ci(qqcy[2:1]),      .i3(1'b0), .i2(sa16), .i1(rccnt[3:2]), .i0(ADR_O[3:2]) );
            bn_l4 #(.I(16'hc000)) c_buserror( .o(cmbbuserror), .i3(qqcy[3]), .i2(rccnt[5]), .i1(STB_O), .i0(1'b0));
            SB_DFF r_buserror( .Q(buserror), .C(clk), .D(cmbbuserror));
            bn_l4 #(.I(16'hcaca)) c_qq_54 [1:0] (.o(QQ[5:4]), .i3(1'b0), .i2(sa16), .i1(rccnt[5:4]), .i0(ADR_O[5:4]));
            
            assign dbg_rccnt = rccnt;
            
         end
      end
   endgenerate
   
   assign QQ[31:6] = ADR_O[31:6];
endmodule
