/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 *
 * This module:
 * ------------
 * o Construction to modify an alu input so that +2, +3 and +4 can be 
 *   realized easily
 * o Construction to hold execution of midgetv for (at least) the 
 *   first cycle 
 * o Optionally support for the cycle counter, and by extension mtime
 * o Optionally support for detection of bus-error
 * 
 * We must be able to let the ALU increment by 2, 3 or 4.
 * This is among other used when PC is incremented.
 *
 * A cycle counter with a 64-bit resolution is mandatory in most
 * implementations of RISC-V. I solve this by timing each instruction
 * in a 7-bit counter rcnt. Duing OpCode fetch this counter is added
 * to ttime, the counter is reset to 1. Register ttime contains the
 * low 32 bits of the cycle counter. rcnt is multiplexed with ADR_O
 * used by input QQ of the ALU during a cycle in OpCode fetch.  The
 * slowest "native" instruction is "shl rd,rs,31", shift operations by
 * 31. These instructions require 41 clock cycles. A consequence is
 * that the cycle counter must be 6 bits so no cycle count is
 * lost. However, when a load or store accesses slow i/o I got into a
 * problem. The fastest store byte instruction "sb x19,3(x22)" for
 * example, require 37 instructions with a zero-latency output
 * register. Let me specify that any "sb" should work with a register
 * with a 16 cycle latency, and set the limit on the cycle count
 * "bus-error cutoff" accordingly. In itself this is not a problem, I
 * require around 54 cycles in total < 64. But a problem arises when I
 * consider the "lh" instruction. With bus-error cutoff as above, a
 * "lh" instruction may need 73 cycles > 64. Hence I increase the
 * width of the cycle counter to 7.  Finally: Midgetv may be used with
 * slow program memory. I do not distinguish between latency additions
 * from memory or from i/o. With the present solution, I at most allow
 * 31 cycles latency for both the operand fetch, and the data fetch.
 *
 * This module also determines if midgetv is up and running. 
 * -  If we have no cyclecounter, corerunning goes high one cycle 
 *    after input signal 'start' is asserted.  
 * -  If we have a cyclecounter, 'start' is used as an enable for the 
 *    counter, and must be high 128 consequtive cycles to let midgetv 
 *    free. This should be handy if the clock of midgetv comes from a 
 *    PLL or an unstable clock (as is the case of iceblink40-hx1k 
 *    boards).
 *
 * If the 7-bit counter rcnt reaches 64 when the core is running, and
 * STB_O is set, we exit to a trap with bus-error. This will happen if
 * an IO device does not answer in a reasonable number of cycles. So
 * how many cycles of IO before a bus-error happens? These are results
 * from simulation program t190.s, run in SRAM. The numbers assume a
 * program executing from SRAM with a 1-cycle read latency for OpCode
 * fetch.
 *                        Max latency for
 *   Instruction          successfull instruction
 * - LW/LH(U)/LB(U)     : 58
 * - SW                 : 58
 * - SH to lsb adr 0b00 : 54
 * - SH to lsb adr 0b10 : 39
 * - SB to lsb adr 0b00 : 54
 * - SB to lsb adr 0b01 : 47
 * - SB to lsb adr 0b10 : 39
 * - SB to lsb adr 0b11 : 31
 * 
 * Size of this module in SB_LUTs:
 * HIGHLEVEL
 * | NO_CYCLECNT
 * 1 0 Lattice LSE/Synplify Pro  : 24/27
 * 1 1 Lattice LSE/Synplify Pro  : 3
 * 0 0                           : 16
 * 0 1                           : 3
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
 * 1 : To save 13 LUTs, rcnt is optional
 *     s_cyclecnt
 *     ||    QQ[1:0]
 *     0x    {~pcinc_by_2,1'b1}   To implement +2, +3 (and +4 with the help of carry in)
 *     x1    {ADR_O[1],start}     rcnt degenerates to instruction counter.
 *     1x    ADR_O[1:0]           Let through ADR_O
 * 0 : rcnt is implemented
 *     s_cyclecnt
 *     ||    QQ[6:0]             
 *     ----- -------             
 *     00    {ADR_O[6:2],{~pcinc_by_2,1'b1}}  To implement +2, +3, (and +4 with the help of carry in)
 *     x1    rccnt                            Muxing in rcnt, reset counter.
 *     10    ADR_O[6:0]                       Let through ADR_O
 */
module m_cyclecnt
  # ( parameter HIGHLEVEL = 0, NO_CYCLECNT = 0, RVC = 0 )
  ( 
    input         clk,
    input         start,
    input [1:0]   s_cyclecnt,
/* verilator lint_off UNUSED */
    input         pcinc_by_2, // pc is to be incremented by 2 rather than 4, if ctrl_pcinc_by_2 also true
    input         ctrl_pcinc_by_2,
    input         STB_O,
/* verilator lint_on UNUSED */
    input [31:0]  ADR_O,
    output [31:0] QQ, 
    output        corerunning,
    output        buserror, 
    output [6:0]  dbg_rccnt
    );
   
   generate
      
      if ( HIGHLEVEL ) begin
         /* At a certain stage I had to put synthesis attributes on cmbrcriun and rcrun, I do not recall why.
          * Anyway, Sept 2020, Synplify pro used to many SB_GB resources, Removing the attributes helped. Why?
          * Probably because the SB_GB resources were eaten as I had used a very high fanout limit.
          * Changing the limit to 100 solved the issue
          */
         wire cmbrcrun /* synthesis syn_keep=1 */;
         reg  rcrun /* synt  hesis syn_keep=1 */;
         wire final_pcinc_by_2 = pcinc_by_2 & ctrl_pcinc_by_2;
         
         if ( NO_CYCLECNT == 1 ) begin
            
            // =======================================================
            // HIGLEVEL, NO CYCLECNT
            // Note the flipflop "rcrun". Even if "start" is hardcoded
            // to 1, midgetv will wait one cycle at startup, so that
            // control output from EBR is valid.
            // No possibility to find a bus error.
            // =======================================================

            assign QQ[1:0] = s_cyclecnt[0] ? {ADR_O[1],start} : (s_cyclecnt[1] ? ADR_O[1:0] : {~final_pcinc_by_2,1'b1} );
            assign QQ[6:2] = ADR_O[6:2];
            assign buserror = 1'b0;
            assign cmbrcrun = rcrun | start;
            always @(posedge clk)
              rcrun <= cmbrcrun;
            assign corerunning = rcrun;
            assign dbg_rccnt = {6'b0,STB_O};
            
         end else begin
            
            // =======================================================
            // HIGLEVEL, CYCLECNT
            // When start has been asserted 128 consequtive cycles, 
            // rcrun is set, the core is running. Even if start is
            // deasserted later on, the core continues to run. However,
            // the cycle counter will only count if start is high.
            //
            // If the cyclecounter increments from 0b101111 we have
            // a bus-error, some IO has not given ACK, buserror is 
            // set one cycle.
            // =======================================================

            reg [6:0]   rccnt;
            reg         rbuserror;
            wire [7:0]  ccnt = start ? (s_cyclecnt[0] ? 1 : rccnt + 1) : 0;
            wire        cmbbuserror = (rccnt[5:0] == 6'b111111) & STB_O;
            assign cmbrcrun    = ccnt[7] | rcrun;
            
            always @(posedge clk) begin
               rccnt[6:0] <= ccnt[6:0];
               rcrun      <= cmbrcrun;
               rbuserror  <= cmbbuserror;
            end
            
//            assign QQ[6:0] = s_cyclecnt[0] ? rccnt : (s_cyclecnt[1] ? ADR_O[6:0] : {ADR_O[6:2],2'h3} );
            assign QQ[6:0] = s_cyclecnt[0] ? rccnt : (s_cyclecnt[1] ? ADR_O[6:0] : {ADR_O[6:2],~final_pcinc_by_2,1'h1} );
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
            assign QQ[6:2] = ADR_O[6:2];

            // Is possible to save 1 lut by using carrychain.
//          SB_LUT4 #(.LUT_INIT(16'habab)) qqmux1(.O(QQ[1]),.I3(1'b0),.I2(s_cyclecnt[0]), .I1(s_cyclecnt[1]), .I0(ADR_O[1]));
            bn_l4 #(.I(16'haa3f)) l_hQQ1( .o(hQQ1),  .i3(s_cyclecnt[1]), .i2(ctrl_pcinc_by_2),.i1(pcinc_by_2), .i0(ADR_O[1]) );
            bn_l4 #(.I(16'hcaca)) c_qq_1( .o(QQ[1]), .i3(1'b0),          .i2(s_cyclecnt[0]),  .i1(ADR_O[1]),   .i0(hQQ1    ) );
            
            SB_LUT4 #(.LUT_INIT(16'haacf)) qqmux0(.O(QQ[0]),.I3(s_cyclecnt[0]),.I2(s_cyclecnt[1]), .I1(ADR_O[0]), .I0(start)); 
            SB_LUT4 #(.LUT_INIT(16'heeee)) cmb_rcrun_l(.O(cmb_rcrun), .I3(1'b0), .I2(1'b0), .I1(corerunning), .I0(start));
            SB_DFF rcrun(.Q(corerunning), .C(clk), .D(cmb_rcrun));

            assign buserror = 1'b0;            
            assign dbg_rccnt = 0;
            
         end else begin

            // =======================================================
            // LOWLEVEL, CYCLECNT
            // =======================================================
            
            /*                         ___                  
             *                   -----|I0 |               __  
             *                   -----|I1 |-cmb_rcrun----|  |-- corerunning
             *           corerunning -|I2 |              >__|      
             *                     +--|I3_|                      
             *                     |ccntcy[7]
             *                    /y\
             *                    |||  ___                                            ___         
             *           start   -(((-|I0 |               __             ADR_O[6] ---|I0 |           
             *           rcnt[6] -((+-|I1 |-ccnt[6]------|  |-- rcnt[6] -------------|I1 |- QQ[6] 
             *     s_cyclecnt[0] -+(--|I2 |              >__|         s_cyclecnt[0] -|I2 |        
             *                     +--|I3_|                                         -|I3_|        
             *                     |ccntcy[6]
             *                    /y\                                 
             *                    |||  ___                              
             *           STB_O   -(((-|I0 |               __             
             *               1   -((+-|I1 |-cmb_buserror-|  |-- buserror
             *               0   -+(--|I2 |              >__|           
             *                     +--|I3_|                            
             *                     |ccntcy[5]
             *                    /y\
             *                    |||  ___                                            ___         
             *           start   -(((-|I0 |               __             ADR_O[5] ---|I0 |           
             *           rcnt[5] -((+-|I1 |-ccnt[5]------|  |-- rcnt[5] -------------|I1 |- QQ[5] 
             *     s_cyclecnt[0] -+(--|I2 |              >__|         s_cyclecnt[0] -|I2 |        
             *                     +--|I3_|                                         -|I3_|        
             *                     |ccntcy[4]                         
             *                    /y\                                 
             *                    |||  ___                                            ___         
             *           start   -(((-|I0 |               __             ADR_O[4] ---|I0 |        
             *           rcnt[4] -((+-|I1 |-ccnt[4]------|  |-- rcnt[4] -------------|I1 |- QQ[4] 
             *     s_cyclecnt[0] -+(--|I2 |              >__|         s_cyclecnt[0] -|I2 |        
             *                     +--|I3_|                                         -|I3_|        
             *                     |ccntcy[3]                         
             *                    /y\                                            
             *                    |||  ___                                            ___         
             *           start   -(((-|I0 |               __           ADR_O[3] -----|I0 |        
             *           rcnt[3] -((+-|I1 |-ccnt[3]------|  |-- rcnt[3] -------------|I1 |- QQ[3] 
             *     s_cyclecnt[0] -+(--|I2 |              >__|     s_cyclecnt[0] -----|I2 |        
             *                     +--|I3_|                                         -|I3_|        
             *                     |ccntcy[2]                                    
             *                    /y\                                            
             *                    |||  ___                                            ___         
             *           start   -(((-|I0 |               __           ADR_O[2] -----|I0 |        
             *           rcnt[2] -((+-|I1 |-ccnt[2]------|  |-- rcnt[2] -------------|I1 |- QQ[2] 
             *     s_cyclecnt[0] -+(--|I2 |              >__|     s_cyclecnt[0] -----|I2 |        
             *                     +--|I3_|                                         -|I3_|        
             *                     |ccntcy[1]                                         ___         
             *                     |                                   ADR_O[1] -----|I0 |        
             *                     |                                 pcinc_by_2 -----|I1 |-+ hQQ1
             *                     |                            ctrl_pcinc_by_2 -----|I2 | |       
             *                    /y\                             s_cyclecnt[1] -----|I3_| |         
             *                    |||  ___                                                 |  ___         
             *           start   -(((-|I0 |               __                               +-|I0 |        
             *           rcnt[1] -((+-|I1 |-ccnt[1]------|  |-- rcnt[1] ---------------------|I1 |- QQ[1] 
             *     s_cyclecnt[0] -+(--|I2 |              >__|     s_cyclecnt[0] -------------|I2 |        
             *                     +--|I3_|                       s_cyclecnt[1] -------------|I3_|        
             *                     |ccntcy[0]                                    
             *                    /y\                                            
             *                    |||  ___                                            ___  
             *           start   -(((-|I0 |               __           ADR_O[0] -----|I0 | 
             *           rcnt[0] -((+-|I1 |-ccnt[0]------|  |-- rcnt[0] -------------|I1 |- QQ[0]
             *                 0 -+(--|I2 |              >__|     s_cyclecnt[0] -----|I2 | 
             *     s_cyclecnt[0] --(--|I3_|                       s_cyclecnt[1] -----|I3_|        
             *                     |                                             
             *                     1                                             
             *
             * Note subtility in LUT/CARRY of ccnt[0]. The very first cycle s_cyclecnt[0] is unknown. We want to 
             * kill the carry chain or else rcrun will go high prematurely.
             *
             */
            
            wire [6:0] ccnt,rccnt;
            /* verilator lint_off UNOPTFLAT */
            wire [7:0] ccntcy;
            /* verilator lint_on UNOPTFLAT */
            wire       cmb_rcrun,cmbbuserror;
            
            bn_lcy4_b #(.I(16'haa22)) l_ccntlsb(     .o(ccnt[0]),    .co(ccntcy[0]),   .ci(1'b1),        .i3(s_cyclecnt[0]), .i2(1'b0),              .i1(rccnt[0]),   .i0(start));
            bn_lcy4_b #(.I(16'h0208)) l_ccnt [4:0] ( .o(ccnt[5:1]),  .co(ccntcy[5:1]), .ci(ccntcy[4:0]), .i3(ccntcy[4:0]),      .i2(s_cyclecnt[0]),  .i1(rccnt[5:1]), .i0(start));
            bn_lcy4_b #(.I(16'haa00)) l_buserror(    .o(cmbbuserror),.co(ccntcy[6]),   .ci(ccntcy[5]),   .i3(ccntcy[5]),        .i2(1'b0),               .i1(1'b1),       .i0(STB_O));
            bn_lcy4_b #(.I(16'h0208)) l_ccnt6(       .o(ccnt[6]),    .co(ccntcy[7]),   .ci(ccntcy[6]),   .i3(ccntcy[6]),        .i2(s_cyclecnt[0]),  .i1(rccnt[6]),   .i0(start));
            bn_l4     #(.I(16'hfff0)) l_rcrun      ( .o(cmb_rcrun),  .i3(ccntcy[7]), .i2(corerunning), .i1(1'b0), .i0(1'b0));
            SB_DFF r_rcntlsb [6:0] ( .Q(rccnt),       .C(clk), .D(ccnt));
            SB_DFF r_buserror(       .Q(buserror),    .C(clk), .D(cmbbuserror));
            SB_DFF r_rcrun         ( .Q(corerunning), .C(clk), .D(cmb_rcrun));

            if ( RVC == 0 ) begin
               bn_l4 #(.I(16'hcacf)) c_qq_10 [1:0] (.o(QQ[1:0]), .i3(s_cyclecnt[1]), .i2(s_cyclecnt[0]), .i1(rccnt[1:0]), .i0(ADR_O[1:0]) );
            end else begin
               wire       hQQ1;
               bn_l4 #(.I(16'haa3f)) l_hQQ1( .o(hQQ1),  .i3(s_cyclecnt[1]), .i2(ctrl_pcinc_by_2),.i1(pcinc_by_2), .i0(ADR_O[1]) );
               bn_l4 #(.I(16'hcaca)) c_qq_1( .o(QQ[1]), .i3(1'b0),          .i2(s_cyclecnt[0]),  .i1(rccnt[1]),   .i0(hQQ1    ) );
               bn_l4 #(.I(16'hcacf)) c_qq_0( .o(QQ[0]), .i3(s_cyclecnt[1]), .i2(s_cyclecnt[0]),  .i1(rccnt[0]),   .i0(ADR_O[0]) );
            end
            bn_l4 #(.I(16'hcaca)) c_qq_62 [4:0] (.o(QQ[6:2]), .i3(1'b0), .i2(s_cyclecnt[0]), .i1(rccnt[6:2]), .i0(ADR_O[6:2]) );
            assign dbg_rccnt = rccnt;
            
         end
      end
   endgenerate
   
   assign QQ[31:7] = ADR_O[31:7];
endmodule
