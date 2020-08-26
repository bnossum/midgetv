/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * ----------------------------------------------------------------------------
 *
 * For multiply and divide.
 * Fun fact. Lattice do highlevel synthesis in 35 LUTs, while Synplify uses 95.
 * 
 *           +-------------+
 * M[i+1] ---|--|0\        |          rA[i]
 *           |  |  |-|1\   |           ____
 * M[i-1] ---|--|1/  |  |--|--- cmbM -|D  Q|- M[i]
 * DAT_O  ---|---+---|0/   |    clk  ->    |
 * loadMn ---|--------+    |    ceM  -E    |
 *           +-------------+    clrM -R____|
 * 
 *                      Possible enhancement
 *           |          Carry chain usable to do a zero find,
 *          /y\  ___    for instance if ADR_O > 0x00000FFF,
 * M[i-1] --(((-|I0 |   or similar, this indicates adr in 
 * M[i+1] --+((-|I1 |   EBR range
 * loadMn ---(+-|I2 |
 * DAT_O[i] -(--|I3_|
 *           |
 *           :
 *           0
 *
 * The lsb is special.
 */
module m_shlr
  # ( parameter 
`ifdef verilator      
      ALUWIDTH = 8,
`else
      ALUWIDTH = 32,
`endif
      MULDIV = 1,
      HIGHLEVEL = 1
      )
   (
    input                 clk,
    input                 loadMn, //    Initiating
    input                 ceM, //       Need to hold register certain cycles
    input                 clrM, //      Register must be clared to allow DAT_I to midgetv. Also used to determine lsb during unsigned subtraction in DIV
    input                 cmb_rF2, //   Used to determine lsb during unsigned subtraction in DIV    
    input                 ADR_O0, //    During MULx we shift right. This is msb
    input [ALUWIDTH-1:0]  DAT_O, //     To initiate shift register
    output [ALUWIDTH-1:0] MULDIVREG  // Eventually holds low 32 bits of MULT or quotient of DIV
    );
   
   generate
      if ( HIGHLEVEL ) begin
         if ( MULDIV == 0 ) begin
            assign MULDIVREG = 0;
         end else begin
            reg [ALUWIDTH-1:0]  rM;
            wire [ALUWIDTH-2:0] cmbMmost,shlMmost,shrMmost;
            wire                shlM0,shrM0,shift_realcmbMlsb,add_realcmbMlsb,realcmbMlsb,ceMlsb,cmbMlsb;
            
            assign shlMmost = rM[ALUWIDTH-2:0];
            assign shrMmost = {ADR_O0,rM[ALUWIDTH-1:2]};
            assign cmbMmost = loadMn ? (DAT_O[ALUWIDTH-1:1]&shlMmost) | (~DAT_O[ALUWIDTH-1:1]&shrMmost) : DAT_O[ALUWIDTH-1:1];
            
            assign shlM0 = 1'b0;
            assign shrM0 = MULDIVREG[1];
            assign shift_realcmbMlsb = loadMn ? (DAT_O[0] & shlM0) | (~DAT_O[0] & shrM0) : DAT_O[0];
            assign add_realcmbMlsb = ~cmb_rF2;
            assign realcmbMlsb = (clrM & add_realcmbMlsb) | (~clrM & shift_realcmbMlsb);
            assign ceMlsb  =  ceM | clrM;
            assign cmbMlsb = ceMlsb ? realcmbMlsb : rM[0];
            
            always @(posedge clk)
              if ( ceM ) 
                rM[ALUWIDTH-1:1] <= clrM ? 0 : cmbMmost;
            
            always @(posedge clk)
              rM[0] <= cmbMlsb;
            
            assign MULDIVREG = rM;
         end
      end
   endgenerate
   
endmodule
