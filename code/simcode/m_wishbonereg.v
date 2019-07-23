/* 
 * A simple wishbone 32 bit slave port with 8 bit granularity
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

//`define SIMPLE_AND_UNDERSTANABLE
`ifdef SIMPLE_AND_UNDERSTANABLE
/* This is how the simplest wishbone slave register could be specified.
 * I leave it in the code for documentation purposes.
 */
module m_wishbonereg
  (
   input [31:0]  DAT_I,
   input         STB_I,
   input         WE_I,
   input [3:0]   SEL_I,
   input         CLK_I,
   output [31:0] DAT_O,
   output        ACK_O
   );

   wire [3:0]    ce;
   reg [31:0]    r;

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
   
   assign ACK_O = STB_I;
   assign DAT_O = r;
endmodule
`else
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
 *   0 | x x x x
 *   1 | x x x
 *   2 |   x
 *  10 |       x
 */
module m_wishbonereg
  # ( parameter INITVAL = 32'hdeadbabe,
      parameter WRITELATENCY = 0,
      parameter READLATENCY  = 3,
      parameter CHECK_RULE_3_55 = 0
      )
   (
    input         CLK_I,
    input [31:0]  DAT_I,
    input         STB_I,
    input         WE_I,
    input [3:0]   SEL_I,
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
   
   generate

      wire writestrobe = STB_I & WE_I;
      if ( WRITELATENCY == 0 ) begin
         assign writeack = writestrobe;
      end else begin
         /* verilator lint_off UNUSED */
         reg [WRITELATENCY:0] writeackdly;
         /* verilator lint_on UNUSED */
         always @(posedge CLK_I) begin
            if ( writeackdly == 0 )
              writeackdly[WRITELATENCY:0] <= {writestrobe,writeackdly[WRITELATENCY:1]};
            else
              writeackdly[WRITELATENCY:0] <= {1'b0,writeackdly[WRITELATENCY:1]};
         end
         assign writeack = writeackdly[1];
      end
      
      wire readstrobe = STB_I & ~WE_I;      
      if ( READLATENCY == 0 ) begin
         assign readack = readstrobe;
      end else begin
         /* verilator lint_off UNUSED */
         reg [READLATENCY:0] readackdly;
         /* verilator lint_on UNUSED */
         always @(posedge CLK_I) begin
            if ( readackdly == 0 ) 
              readackdly[READLATENCY:0] <= {readstrobe,readackdly[READLATENCY:1]};
            else
              readackdly[READLATENCY:0] <= {1'b0,readackdly[READLATENCY:1]};
         end
         assign readack = readackdly[1];
      end

   endgenerate

   /* Wishbone B.4 permission 3.35 states: A SLAVE interface MAY
    * be designed to hold [ACK_O] in the asserted state. This 
    * situation occurs on point-to-point interfaces where there 
    * is a single SLAVE on the interface, and that SLAVE always 
    * operates without wait states.
    *
    * I must check that the corresponding rule for the master
    * (rule 3.55) is fullfilled by midgetv
    */
   generate
      if ( CHECK_RULE_3_55 && 
           WRITELATENCY == 0 &&
           READLATENCY  == 0 ) begin
         assign ACK_O = 1'b1;
      end else begin
         assign ACK_O = readack | writeack;
      end
   endgenerate
   
   assign DAT_O = ACK_O ? r : 32'hd0d0d0d0;
endmodule
`endif

// Local Variables:
// verilog-library-directories:("."  )
// verilog-library-files:("/home/bnossum/PROJ/iCE_simlib/iCE_simlib.v" )
// verilog-library-extensions:(".v" )
// End:
  
