/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * A wishbone 32 bit slave port with 8 bit granularity, where one can also
 * set the latency. This is to test the bus-error response of midgetv.
 * 
 * 
 * WISHBONE DATASHEET
 * ------------------
 * Conforms to WISHBONE specification B.4
 * 
 * Description
 * General Description:             32-bit SLAVE output register
 * Supported cycles:                SLAVE, READ/WRITE
 *                                  SLAVE, BLOCK READ/WRITE
 *                                  SLAVE, RMW
 * Data port, size:                 32-bit
 * Data port, granularity:          8-bit
 * Data port, maximum operand size: 32-bit
 * Data transfer ordering:          BIG/LITTLE ENDIAN
 * Data transfer sequencing:        Undefined
 * 
 * Supported signal list and        Signal name  Wishbone equiv.
 *    cross reference to            -----------  ---------------
 *    equivalent WISHBONE signals:  DAT_I(31..0) DAT_I(31..0)  
 *                                  STB_I        STB_I         
 *                                  WE_I         WE_I          
 *                                  SEL_I(3..0)  SEL_I(3..0)   
 *                                  CLK_I        CLK_I         
 *                                  DAT_O(31..0) DAT_O(31..0)  
 *                                  ACK_O        ACK_O         
 */

/*
 * In order to test my controller, I need a flexible wishbone register.
 * I should be able to set the initial value of the register. 
 * The output should be valid only on the cycle where we give acknowledge.
 * I should be able to set the read latency in number of cycles.
 * I should be able to set the write latency in number of cycles.
 */        
/*  Tested combinations of latencies:   
 *   WRITELATENCY
 *   |  READLATENCY 
 *   |   0 1 2 10
 *   |  ---------
 *   0 | 
 *   1 | 
 *   2 | 
 *  10 | 
 */
module m_dyn_wishbonereg
  # ( parameter INITVAL = 32'hdeadbabe,
      parameter CHECK_RULE_3_55 = 0
      )
   (
    input         CLK_I,
    input [31:0]  DAT_I,
    input         STB_I,
    input         WE_I,
    input [3:0]   SEL_I,
    input [5:0]   writelatency,
    input [5:0]   readlatency,
    output [31:0] DAT_O,
    output        ACK_O
    );
   
   wire [3:0]     ce;
   reg [31:0]     r;
/* verilator lint_off UNUSED */
   wire           readack,writeack;
/* verilator lint_on UNUSED */
   
   initial begin
      r = INITVAL;
   end
   
   assign ce[0] = SEL_I[0] & STB_I & WE_I;
   assign ce[1] = SEL_I[1] & STB_I & WE_I;
   assign ce[2] = SEL_I[2] & STB_I & WE_I;
   assign ce[3] = SEL_I[3] & STB_I & WE_I;
   
   always @(posedge CLK_I) begin
      if ( ce[0] ) r[ 7: 0] <= DAT_I[ 7: 0];
      if ( ce[1] ) r[15: 8] <= DAT_I[15: 8];
      if ( ce[2] ) r[23:16] <= DAT_I[23:16];
      if ( ce[3] ) r[31:24] <= DAT_I[31:24];
   end

   /* State machine for writeack
    *        writestrobe
    *        | WCntEq0        
    *        | | WLat0        ReloadWCnt
    * WState | | | Nextstate  | writeack
    * IDLE   0 x 0 IDLE       1 0
    *        1 x 0 WAIT       1 0
    *        0 x 1 IDLE       1 0
    *        1 x 1 IDLE       1 1
    * WAIT   x 0 x WAIT       0 0
    *        x 1 x IDLE       0 1
    */   
   reg [5:0] Wcnt;
   wire      WLat0 = writelatency == 0;
   wire      WcntEq0 = Wcnt == 0;
   wire      writestrobe = STB_I & WE_I;
   reg       wstate;
   wire      cmbwstate,ReloadWCnt;
   
   always @(/*AS*/WLat0 or WcntEq0 or writestrobe or wstate)
     casez ( {wstate,writestrobe,WcntEq0,WLat0} )
       4'b00?0 : {cmbwstate,ReloadWCnt,writeack} = 3'b010;
       4'b01?0 : {cmbwstate,ReloadWCnt,writeack} = 3'b110;
       4'b00?1 : {cmbwstate,ReloadWCnt,writeack} = 3'b010;
       4'b01?1 : {cmbwstate,ReloadWCnt,writeack} = 3'b011;
       4'b1?0? : {cmbwstate,ReloadWCnt,writeack} = 3'b100;
       4'b1?1? : {cmbwstate,ReloadWCnt,writeack} = 3'b001;
     endcase

   always @(posedge CLK_I) 
     wstate <= cmbwstate;

   always @(posedge CLK_I) 
     if ( ReloadWCnt )
       Wcnt <= writelatency;
     else
       Wcnt <= Wcnt - 1;

   /* State machine for readack
    *        readstrobe
    *        | RCntEq0        
    *        | | RLat0        ReloadRCnt
    * RState | | | Nextstate  | readack
    * IDLE   0 x 0 IDLE       1 0
    *        1 x 0 WAIT       1 0
    *        0 x 1 IDLE       1 0
    *        1 x 1 IDLE       1 1
    * WAIT   x 0 x WAIT       0 0
    *        x 1 x IDLE       0 1
    */   
   reg [5:0] Rcnt;
   wire      RLat0 = readlatency == 0;
   wire      RcntEq0 = Rcnt == 0;
   wire      readstrobe = STB_I & ~WE_I;
   reg       rstate;
   wire      cmbrstate,ReloadRCnt;
   
   always @(/*AS*/RLat0 or RcntEq0 or readstrobe or rstate)
     casez ( {rstate,readstrobe,RcntEq0,RLat0} )
       4'b00?0 : {cmbrstate,ReloadRCnt,readack} = 3'b010;
       4'b01?0 : {cmbrstate,ReloadRCnt,readack} = 3'b110;
       4'b00?1 : {cmbrstate,ReloadRCnt,readack} = 3'b010;
       4'b01?1 : {cmbrstate,ReloadRCnt,readack} = 3'b011;
       4'b1?0? : {cmbrstate,ReloadRCnt,readack} = 3'b100;
       4'b1?1? : {cmbrstate,ReloadRCnt,readack} = 3'b001;
     endcase

   always @(posedge CLK_I) 
     rstate <= cmbrstate;

   always @(posedge CLK_I) 
     if ( ReloadRCnt )
       Rcnt <= readlatency;
     else
       Rcnt <= Rcnt - 1;

   assign ACK_O = readack | writeack;
   assign DAT_O = ACK_O ? r : 32'hd0d0d0d0;
endmodule


// Local Variables:
// verilog-library-directories:("."  )
// verilog-library-files:("/home/bnossum/PROJ/iCE_simlib/iCE_simlib.v" )
// verilog-library-extensions:(".v" )
// End:
  
