/* Just a toy implementation of a shift register, in itself unusable. Written 
 * to explore how arachne-pnr and nextpnr-ice40 handles SB_CARRY. The design is
 * not simulated, hence wrong.
 * 
 * Main results: Neither arachne-pnr nor nextpnr-ice40 are particularly intelligent
 * when it comes to SB_CARRY packing.
 * 
 * Details:
 * 
 * When SHOULD_WORK == 1
 * =====================
 * (a) yosys/arachne-pnr uses too many LUTs: 12
 * (b) yosys/next uses too many LUTs:        10 
 * (c) Lattice ICECube2:                      8 (as was expected)
 * 
 * Not satisfied, I tried to use an internal cell definition, ICESTORM_LC.
 * Worse and worse...
 * 
 * When SHOULD_WORK == 0
 * ======================
 * (c) yosys/arachne-pnr uses too many LUTs: 12
 * (d) yosys/next uses too many LUTs:        14
 *   
 * Commands used to produce (a) and (c):
 * yosys -p "synth_ice40 -blif hardware.blif" -q other.v
 * arachne-pnr -d 1k -P vq100 -p other.pcf -o hardware.asc  hardware.blif
 *
 * Commands used to produce (b):
 * yosys -p 'synth_ice40 -top top -json other.json' other.v  
 * nextpnr-ice40 -v --hx1k --json other.json --pcf other.pcf --asc other.asc
 *
 * Versions of programs used:
 * nextpnr-ice40 -- Next Generation Place and Route (git sha1 b863690).  I pulled the code today, 2019.12.05
 * arachne-pnr 0.1+328+0 (git sha1 c40fb22, g++ 5.4.0-6ubuntu1~16.04.12 -O2)
 * Yosys 0.9+932 (git sha1 fcce940, clang 3.8.0-2ubuntu4 -fPIC -Os)
 * 
 * yosys -p 'synth_ice40 -top top -json other.json' other.v
 * nextpnr-ice40 -v --hx1k --json other.json --pcf other.pcf --asc other.asc
 */
module top 
  (
   output      PIN_22, // Combinatorical, high if shiftreg busy
   output      PIN_24, // Shift register output. 
   input       CLK,
   input       PIN_13, // Load
   input [5:1] PIN
   );
   wire [5:0] loop, cy;

   assign cy[0] = 1'b0;

`define SHOULD_WORK 0
`ifdef SHOULD_WORK
//   wire [5:0] cmb_loop;
//   SB_LUT4 #(.LUT_INIT(16'haaaa)) l_border   ( .O(cmb_loop[0]),   .I3(1'b0),  .I2(1'b0), .I1(1'b0     ), .I0(PIN_13) );   
//   SB_CARRY                       l_cy [4:0] ( .CO(cy[5:1]),    .CI(cy[4:0]), .I1(1'b1), .I0(loop[4:0])           );
//   SB_DFF                         r_sh [5:0] ( .Q(loop), .C(CLK), .D(cmb_loop) );

   wire [5:0] cmb_loop;
   (* BEL="X2/Y2/lc0" *) 
   SB_LUT4 #(.LUT_INIT(16'haaaa)) l_border   ( .O(cmb_loop[0]),   .I3(1'b0),  .I2(1'b0), .I1(1'b0     ), .I0(PIN_13) );   
   (* BEL="X2/Y2/lc0" *) 
   SB_DFF                         r_sh0 (      .Q(    loop[0]), .C(CLK), .D(cmb_loop[0]) );


   (* BEL="X2/Y2/lc1" *) 
   SB_LUT4 #(.LUT_INIT(16'hcaca)) l_sh1 ( .O(cmb_loop[1]), .I3(PIN_13),  .I2(1'b1), .I1(loop[0]), .I0(PIN[1]) );
   (* BEL="X2/Y2/lc1" *) 
   SB_CARRY                       l_cy1 ( .CO(     cy[1]),   .CI(cy[0]), .I1(1'b1), .I0(loop[0])           );
   (* BEL="X2/Y2/lc1" *) 
   SB_DFF                         r_sh1 ( .Q(    loop[1]), .C(CLK), .D(cmb_loop[1]) );
   
   (* BEL="X2/Y2/lc2" *) 
   SB_LUT4 #(.LUT_INIT(16'hcaca)) l_sh2 ( .O(cmb_loop[2]), .I3(PIN_13),  .I2(1'b1), .I1(loop[1]), .I0(PIN[2]) );
   (* BEL="X2/Y2/lc2" *) 
   SB_CARRY                       l_cy2 ( .CO(     cy[2]),   .CI(cy[1]), .I1(1'b1), .I0(loop[1])           );
   (* BEL="X2/Y2/lc2" *) 
   SB_DFF                         r_sh2 ( .Q(    loop[2]), .C(CLK), .D(cmb_loop[2]) );

   (* BEL="X2/Y2/lc3" *) 
   SB_LUT4 #(.LUT_INIT(16'hcaca)) l_sh3 ( .O(cmb_loop[3]), .I3(PIN_13),  .I2(1'b1), .I1(loop[2]), .I0(PIN[3]) );
   (* BEL="X2/Y2/lc3" *) 
   SB_CARRY                       l_cy3 ( .CO(     cy[3]),   .CI(cy[2]), .I1(1'b1), .I0(loop[2])           );
   (* BEL="X2/Y2/lc3" *) 
   SB_DFF                         r_sh3 ( .Q(    loop[3]), .C(CLK), .D(cmb_loop[3]) );

   (* BEL="X2/Y2/lc4" *) 
   SB_LUT4 #(.LUT_INIT(16'hcaca)) l_sh4 ( .O(cmb_loop[4]), .I3(PIN_13),  .I2(1'b1), .I1(loop[3]), .I0(PIN[4]) );
   (* BEL="X2/Y2/lc4" *) 
   SB_CARRY                       l_cy4 ( .CO(     cy[4]),   .CI(cy[3]), .I1(1'b1), .I0(loop[3])           );
   (* BEL="X2/Y2/lc4" *) 
   SB_DFF                         r_sh4 ( .Q(    loop[4]), .C(CLK), .D(cmb_loop[4]) );

   (* BEL="X2/Y2/lc5" *) 
   SB_LUT4 #(.LUT_INIT(16'hcaca)) l_sh5 ( .O(cmb_loop[5]), .I3(PIN_13),  .I2(1'b1), .I1(loop[4]), .I0(PIN[5]) );
   (* BEL="X2/Y2/lc5" *) 
   SB_CARRY                       l_cy5 ( .CO(     cy[5]),   .CI(cy[4]), .I1(1'b1), .I0(loop[4])           );
   (* BEL="X2/Y2/lc5" *) 
   SB_DFF                         r_sh5 ( .Q(    loop[5]), .C(CLK), .D(cmb_loop[5]) );

//   SB_LUT4 #(.LUT_INIT(16'hcaca)) l_sh [4:0] ( .O(cmb_loop[5:1]), .I3(PIN_13),  .I2(1'b1), .I1(loop[4:0]), .I0(PIN) );
//   SB_CARRY                       l_cy [4:0] ( .CO(cy[5:1]),    .CI(cy[4:0]), .I1(1'b1), .I0(loop[4:0])           );
//   SB_DFF                         r_sh [5:0] ( .Q(loop), .C(CLK), .D(cmb_loop) );
   
`else
   wire       cmbloop0;
   SB_LUT4 #(.LUT_INIT(16'haaaa)) l_border ( .O(cmbloop0), .I3(1'b0), .I2(1'b0), .I1(1'b0 ), .I0(PIN_13) );
(* BEL="X2/Y2/lc0" *)    SB_DFF r_border( .Q(loop[0]), .C(CLK), .D(cmbloop0) );
//   ICESTORM_LC #(.LUT_INIT(16'hcaca),.CARRY_ENABLE(1),.DFF_ENABLE(1)) l_shcyreg [4:0] ( .I0(PIN),.I1(loop[4:0]),.I2(1'b1),.I3(PIN_13),.CIN(cy[4:0]),.CLK(CLK),.O(loop[5:1]),.COUT(cy[5:1]));
(* BEL="X2/Y2/lc1" *)    ICESTORM_LC #(.LUT_INIT(16'hcaca),.CARRY_ENABLE(1),.DFF_ENABLE(1)) l_shcyreg0 ( .I0(PIN[1]),.I1(loop[0]),.I2(1'b1),.I3(PIN_13),.CIN(cy[0]),.CLK(CLK),.O(loop[1]),.COUT(cy[1]));
(* BEL="X2/Y2/lc2" *)    ICESTORM_LC #(.LUT_INIT(16'hcaca),.CARRY_ENABLE(1),.DFF_ENABLE(1)) l_shcyreg1 ( .I0(PIN[2]),.I1(loop[1]),.I2(1'b1),.I3(PIN_13),.CIN(cy[1]),.CLK(CLK),.O(loop[2]),.COUT(cy[2]));
(* BEL="X2/Y2/lc3" *)    ICESTORM_LC #(.LUT_INIT(16'hcaca),.CARRY_ENABLE(1),.DFF_ENABLE(1)) l_shcyreg2 ( .I0(PIN[3]),.I1(loop[2]),.I2(1'b1),.I3(PIN_13),.CIN(cy[2]),.CLK(CLK),.O(loop[3]),.COUT(cy[3]));
(* BEL="X2/Y2/lc4" *)    ICESTORM_LC #(.LUT_INIT(16'hcaca),.CARRY_ENABLE(1),.DFF_ENABLE(1)) l_shcyreg3 ( .I0(PIN[4]),.I1(loop[3]),.I2(1'b1),.I3(PIN_13),.CIN(cy[3]),.CLK(CLK),.O(loop[4]),.COUT(cy[4]));
(* BEL="X2/Y2/lc5" *)    ICESTORM_LC #(.LUT_INIT(16'hcaca),.CARRY_ENABLE(1),.DFF_ENABLE(1)) l_shcyreg4 ( .I0(PIN[5]),.I1(loop[4]),.I2(1'b1),.I3(PIN_13),.CIN(cy[4]),.CLK(CLK),.O(loop[5]),.COUT(cy[5]));
`endif
   
   SB_LUT4 #(.LUT_INIT(16'hff00)) l_empty    ( .O(PIN_22), .I3(cy[5]), .I2(1'b0), .I1(1'b0), .I0(1'b0));
   
   assign PIN_24 = loop[5];
endmodule
                                               
/* What I hope the code above describe. Should be a total of 7 SB_LUTs, and 1 SB_LUT to generate 1'b1
 *                    ___
 *                   |I0 |
 *                   |I1 |---------------------- PIN_22
 *                   |I2 |
 *                +--|I3_|
 *                |  FF00
 *                | cy[5]         
 *               /y\              
 *               |||  ___         
 *        PIN_5 -(((-|I0 |     _  
 *      +--------+((-|I1 |----| |--- loop[5] --- PIN_24  
 *      |     1 --(+-|I2 |    >_|  
 * +----(---------(--|I3_|         
 * |    |         |  AACC          
 * |    +---------(---------------+
 * |PIN_13        | cy[4]         |  loop[4]
 * 
 *            ::::::::::::::
 * 
 * |    |         |
 * |    +---------(---------------+
 * |              | cy[1]         |
 * |             /y\              |
 * |             |||  ___         |
 * |      PIN_1 -(((-|I0 |     _  |
 * |    +--------+((-|I1 |----| |-+  loop[1]
 * |    |     1 --(+-|I2 |    >_|  
 * +----(---------(--|I3_|         
 * |    |         |  AACC
 * |    |         0 cy[0]
 * |    |
 * |    +-------------------------+
 * |                  ___         |
 * +-----------------|I0 |     _  |
 * |                 |I1 |----| |-+  loop[0]
 * |                 |I2 |    >_|  
 * |                 |I3_|         
 * |                 AAAA
 * | PIN_13         
 */
