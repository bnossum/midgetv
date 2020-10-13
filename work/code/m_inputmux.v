/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * The input mux selects between:
 *   o 32 bit output from a SRAM (or cache or whatever)
 *   o a data input port
 *   o 32 bit output from the internal EBR ram (DAT_O)
 *   o A rightshifted ADR_O
 *   o register M for MUL/DIV instructions
 * 
 * There are many choices for the input mux. Not all are thoroghly tested. 
 * Common for all implementations is the last part. 
 * 
 */


/* verilator lint_off DECLFILENAME */


module m_inputmux
  # ( parameter HIGHLEVEL = 1, //      Presently not in use
      MULDIV = 0, //                   With MUL/DIV instructions?
      DAT_I_ZERO_WHEN_INACTIVE = 1, // With "wellbehaved" Wishbone input we may save 32 LUTs in certain situations
      IWIDTH = 32,  //                 Can in principle be from 1 to 32. Usually 8, 16 or 32.
      SRAMADRWIDTH = 0, //             External memory. Usually SRAM in iCE40UP
      MTIMETAP = 0, //                 Include system registers if MTIMETAP >= MTIMETAP_LOWLIM
      MTIMETAP_LOWLIM = 32 //          Really a constant
      )
   (
    /* verilator lint_off UNUSED */
    input              clk, //         System clock
    input              corerunning, // Only update registers after core is started
    input              STB_O, //       Selecte between SRAM and IO, must also lead to  ack when systemregisters written
    input [31:0]       MULDIVREG, //   MUL/DIV result register
    input [31:0]       Dsram, //       SRAM input
    input              clrM, //        To determine if MULDIVREG is to be read
    input              ceM, //         To determine if MULDIVREG is to be read
    input [31:0]       ADR_O, //       For select between system registers
    input              mie, //         Machine Interrupt enable in MSTATUS
    input              mpie, //        Machine Previous Interrupt enable in MSTATUS
    input              meie, //        Machine External Interrupt Enable in MIE
    input              mrinstretie, // Machine Retired Instructions Retired Interrupt Enable in MIE. RENAME
    input              msie, //        Machine Software Interrupt Enable in MIE
    input              mtie, //        Machine Timer Interrupt Enable in MIE
    input              mtimeincie, //  Machine Time Increment Interrupt Enable in MIE
    input              mrinstretip, // Machine Retired Instructions Retired Interrupt Pending in MIP. RENAME
    input              msip, //        Machine Software Interrupt Pending in MIP
    input              mtip,//         Machine Timer Interrupt Pending in MIP
    input              mtimeincip, //  Machine Time Increment Interrupt Pending in MIP
    input              meip, //        Machine External Interrupt Pending in MIP
    /* verilator lint_on UNUSED */
    input [IWIDTH-1:0] DAT_I, //       External input
    
    /* verilator lint_off UNDRIVEN */
    output             sysregack, //   Read/Write acknowledge from MIP/MIE/MSTATUS
    output [31:0]      rDee, //        Output used by mimux
    output [31:0]      theio //        Output for debugging purposes
    /* verilator lint_on UNDRIVEN */
//    output             m_inputmux_killwarnings
    );

   localparam pHASSYSREGS = MTIMETAP >= MTIMETAP_LOWLIM ? 4 : 0;
   localparam pHASSRAM = SRAMADRWIDTH != 0              ? 2 : 0;
   localparam INPUTMUXTYPE = pHASSYSREGS | pHASSRAM | MULDIV;

   /* verilator lint_off UNUSED */
    /* verilator lint_off UNDRIVEN */
   wire [32:0]         zeros = 33'b0;
   wire [32:0]         erDee;
   wire [32:0]         edati = {zeros[32:IWIDTH],DAT_I[IWIDTH-1:0]};
    /* verilator lint_on UNDRIVEN */
   /* verilator lint_on UNUSED */ 

   generate
      if ( INPUTMUXTYPE == 0 ) begin
         /* Simplest and smallest case. No SRAM, no system registers, no multiplier.
          *
          *               __   
          * DAT_I -------|  |- rDee
          *              >  |  
          * corerunning -E__|  
          * 
          * Total size: 33+IWIDTH SB_LUT4
          */
         reg [IWIDTH-1:0] ireg;
         
         always @(posedge clk)
           if ( corerunning )
             ireg <= DAT_I;
         assign erDee = {zeros[32:IWIDTH],ireg};
         assign sysregack = 0;
         assign theio = DAT_I;
         
      end else if ( INPUTMUXTYPE == 1 ) begin
         /* Multiplier present. No SRAM, no system registers.
          *
          * STB_O ------------+               
          * DAT_I -----------|1\         __   
          *                  |  |- a ---|  |- rDee
          * MULDIVREG -------|0/        >  |  
          *                corerunning -E__|  
          * 
          * Total size: 65 SB_LUT4
          */
         
         wire [31:0] a;
         reg [31:0]  ireg;
         assign a = STB_O ? edati[31:0] : MULDIVREG;
         always @(posedge clk)
           if ( corerunning )
             ireg <= a;
         assign erDee = {zeros[32:IWIDTH],ireg};
         assign sysregack = 0;
         assign theio = a;
         
    end else if ( INPUTMUXTYPE == 2 ) begin
       /* SRAM present. No multiplier, no system registers
        *
        * STB_O ------------+               
        * DAT_I -----------|1\         __   
        *                  |  |- a ---|  |- rDee
        * Dsram     -------|0/        >  |  
        *                corerunning -E__|  
        * 
        * Total size: 65 SB_LUT4
        */
       wire [31:0] a;
       reg [31:0]  ireg;
       assign a = STB_O ? edati[31:0] : Dsram;
       always @(posedge clk)
         if ( corerunning )
           ireg <= a;
       assign erDee = {zeros[32:IWIDTH],ireg};
       assign sysregack = 0;
       assign theio = a;
       
    end else if ( INPUTMUXTYPE == 3 ) begin
       
       wire [31:0] a;
       reg [31:0]  ireg;
       wire        STB_O_or_ReadM = STB_O | (clrM & ceM);

       if ( DAT_I_ZERO_WHEN_INACTIVE ) begin
          /* SRAM and multiplier both present. No system registers.
           * When DAT_I is inactive, it is zero. Note that this depends on the 
           * external INTERCON module. 
           *
           * STB_O_or_readM ---+               
           *             __    |
           * DAT_I -----|or|--|1\         __   
           * MULDIVREG -|__|  |  |- a ---|  |- rDee
           * Dsram     -------|0/        >  |  
           *                corerunning -E__|  
           * 
           * The lsb must be treated differently - MULDIVREG[0] is 1'b1 when idle.
           * 
           */
          assign a[31:1] = STB_O_or_ReadM ? (edati[31:1] | MULDIVREG[31:1]) : Dsram[31:1];
          wire b0;
          assign b0 = STB_O ? edati[0] : MULDIVREG[0];
          assign a[0] = STB_O_or_ReadM ? b0 : Dsram[0];
       end else begin
          /* SRAM and multiplier both present. No system registers.
           * When DAT_I is inactive, we know nothing about the value of DAT_I,
           * so we must use additional resources.
           *
           * STB_O_or_readM ------+               
           * STB_O ------+        |
           * DAT_I     -|1\       | 
           *            |  |- b -|1\         __   
           * MULDIVREG -|0/      |  |- a ---|  |- rDee
           * Dsram     ----------|0/        >  |  
           *                   corerunning -E__|  
           * 
           * Total size: IWIDTH+66 SB_LUT4
           */
          wire [31:0] b;
          assign b = STB_O ? edati[31:0] : MULDIVREG;
          assign a = STB_O_or_ReadM ? b : Dsram;          
       end
       always @(posedge clk)
         if ( corerunning )
           ireg <= a;
       assign erDee = {zeros[32:IWIDTH],ireg};
       assign sysregack = 0;
       assign theio = a;
       
    end else if ( INPUTMUXTYPE == 4 ) begin
       /* System registers, but no sram nor multipliers.
        */
       reg [31:0] a;
       reg        tmpsysregack;
       reg [31:0] ireg;
 
       /* Many bits implemented as this:
        * sysregack -----+
        * STB_O ----+    |    _          __
        * DAT_I   -|1\   +--o| |-- a ---|  |- rDee
        *          |  |------|_|        >  |
        *     0   -|0/     corerunning -E__|
        */
       always @(/*AS*/STB_O or edati or sysregack) begin
          a[2:0]   = sysregack ?  3'b0 : STB_O ?   edati[2:0] :  3'b0;
          a[6:4]   = sysregack ?  3'b0 : STB_O ?   edati[6:4] :  3'b0;
          a[10:8]  = sysregack ?  3'b0 : STB_O ?  edati[10:8] :  3'b0;
          a[15:13] = sysregack ?  3'b0 : STB_O ? edati[15:13] :  3'b0;
          a[31:18] = sysregack ? 14'b0 : STB_O ? edati[31:18] : 14'b0;
       end
       
       always @(/*AS*/ADR_O or STB_O or edati or meie or meip or mie
                or mpie or mrinstretie or mrinstretip or msie or msip
                or mtie or mtimeincie or mtimeincip or mtip) 
         casez ( {STB_O,ADR_O[29:27]} )
           4'b0??? : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b0,2'b00,                 1'b0,1'b0,1'b0,1'b0};
           4'b10?? : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b0,edati[17:16],          edati[12:11],edati[7],edati[3]};
           4'b1100 : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b0,edati[17:16],          edati[12:11],edati[7],edati[3]}; // Don't care better?
           4'b1101 : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b1,mrinstretip,mtimeincip,1'b0,meip,mtip,msip}; // MIP
           4'b1110 : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b1,mrinstretie,mtimeincie,1'b0,meie,mtie,msie}; // MIE
           4'b1111 : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b1,2'b00,                 1'b1,1'b1,mpie,mie }; // MSTATUS
         endcase
                                                         
       always @(posedge clk)
         if ( corerunning ) begin
            ireg <= a;
         end
       assign erDee = {zeros[32:IWIDTH],ireg};
       assign sysregack = tmpsysregack;
       assign theio = a;
       
    end else if ( INPUTMUXTYPE == 5 ) begin
       /* Multiplier and system registers, but no sram.
        * Many bits implemented as this:
        * sysregack -------+
        * STB_O ------+    |    _          __
        * DAT_I     -|1\   +--o| |-- a ---|  |- rDee
        *            |  |------|_|        >  |
        * MULDIVREG -|0/     corerunning -E__|
        */
       reg [31:0] a;
       reg        tmpsysregack;
       reg [31:0] ireg;
 
       always @(/*AS*/MULDIVREG or STB_O or edati or sysregack) begin
          a[2:0]   = sysregack ?  3'b0 : STB_O ?   edati[2:0] :   MULDIVREG[2:0];
          a[6:4]   = sysregack ?  3'b0 : STB_O ?   edati[6:4] :   MULDIVREG[6:4];
          a[10:8]  = sysregack ?  3'b0 : STB_O ?  edati[10:8] :  MULDIVREG[10:8];
          a[15:13] = sysregack ?  3'b0 : STB_O ? edati[15:13] : MULDIVREG[15:13];
          a[31:18] = sysregack ? 14'b0 : STB_O ? edati[31:18] : MULDIVREG[31:18];
       end
       always @(/*AS*/ADR_O or MULDIVREG or STB_O or edati or meie
                or meip or mie or mpie or mrinstretie or mrinstretip
                or msie or msip or mtie or mtimeincie or mtimeincip
                or mtip) 
         casez ( {STB_O,ADR_O[29:27]} )
           4'b0??? : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b0,MULDIVREG[17:16],MULDIVREG[12:11],MULDIVREG[7],MULDIVREG[3]};
           4'b10?? : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b0,edati[17:16],          edati[12:11],edati[7],edati[3]};
           4'b1100 : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b0,edati[17:16],          edati[12:11],edati[7],edati[3]}; // Don't care smaller?
           4'b1101 : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b1,mrinstretip,mtimeincip,1'b0,meip,mtip,msip}; // MIP
           4'b1110 : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b1,mrinstretie,mtimeincie,1'b0,meie,mtie,msie}; // MIE
           4'b1111 : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b1,2'b00,                 1'b1,1'b1,mpie,mie }; // MSTATUS
         endcase
                                                         
       always @(posedge clk)
         if ( corerunning ) begin
            ireg <= a;
         end
       assign erDee = {zeros[32:IWIDTH],ireg};
       assign sysregack = tmpsysregack;
       assign theio = a;
       
       

    end else if ( INPUTMUXTYPE == 6 ) begin
       /* System registers and sram. No multiplier. Most bits:
        * 
        * 
        * STB_O ------------+       
        * DAT_I -----------|1\               __     
        *                  |  |------- a ---|  |- rDee
        * Dsram     -------|0/              >  |                      
        *                      corerunning -E  |                      
        *                      sysregack  --R__|               
        * Total size: 81 SB_LUTS
        */
       reg [31:0] a;
       reg        tmpsysregack;
       reg [31:0] ireg;
 
       always @(*) begin
          a[2:0]   = sysregack ?  3'b0 : STB_O ?   edati[2:0] :   Dsram[2:0];
          a[6:4]   = sysregack ?  3'b0 : STB_O ?   edati[6:4] :   Dsram[6:4];
          a[10:8]  = sysregack ?  3'b0 : STB_O ?  edati[10:8] :  Dsram[10:8];
          a[15:13] = sysregack ?  3'b0 : STB_O ? edati[15:13] : Dsram[15:13];
          a[31:18] = sysregack ? 14'b0 : STB_O ? edati[31:18] : Dsram[31:18];
       end
       
       always @(*) 
         casez ( {STB_O,ADR_O[29:27]} )
           4'b0??? : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b0,Dsram[17:16],Dsram[12:11],Dsram[7],Dsram[3]};
           4'b10?? : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b0,edati[17:16],edati[12:11],edati[7],edati[3]};
           4'b1100 : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b0,edati[17:16],edati[12:11],edati[7],edati[3]}; // Don't care better?
           4'b1101 : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b1,mrinstretip,mtimeincip,1'b0,meip,mtip,msip}; // MIP
           4'b1110 : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b1,mrinstretie,mtimeincie,1'b0,meie,mtie,msie}; // MIE
           4'b1111 : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b1,2'b00,                 1'b1,1'b1,mpie,mie }; // MSTATUS
         endcase
                                                         
       always @(posedge clk)
         if ( corerunning ) begin
            ireg <= a;
         end
       assign erDee = {zeros[32:IWIDTH],ireg};
       assign sysregack = tmpsysregack;
       assign theio = a;
       
    end else if ( INPUTMUXTYPE == 7 ) begin

       if ( DAT_I_ZERO_WHEN_INACTIVE ) begin
          /* SRAM, multiplier, and system registers. When DAT_I is inactive, it is zero.
           * This depends on the external INTERCON module.
           * Most bits:
           *
           * STB_O_or_readM ---+               
           *             __    |
           * DAT_I -----|or|--|1\         __   
           * MULDIVREG -|__|  |  |- a ---|  |- rDee
           * Dsram     -------|0/        >  |  
           *                corerunning -E__|  
           * 
           */
          ProbableErrorHere SeeOtherCaseWith_DAT_I_ZERO_WHEN_INACTIVE();
          reg [31:0] a;
          reg        tmpsysregack;
          reg [31:0] ireg;
          wire       STB_O_or_ReadM = STB_O | (clrM & ceM);
          wire [31:0] d_or_m = edati[31:0] | MULDIVREG;
          
          always @(/*AS*/Dsram or STB_O_or_ReadM or d_or_m
                   or sysregack) begin
             a[2:0]   = sysregack ?  3'b0 : STB_O_or_ReadM ?   d_or_m[2:0] :   Dsram[2:0];
             a[6:4]   = sysregack ?  3'b0 : STB_O_or_ReadM ?   d_or_m[6:4] :   Dsram[6:4];
             a[10:8]  = sysregack ?  3'b0 : STB_O_or_ReadM ?  d_or_m[10:8] :  Dsram[10:8];
             a[15:13] = sysregack ?  3'b0 : STB_O_or_ReadM ? d_or_m[15:13] : Dsram[15:13];
             a[31:18] = sysregack ? 14'b0 : STB_O_or_ReadM ? d_or_m[31:18] : Dsram[31:18];
          end
       
       always @(/*AS*/ADR_O or Dsram or STB_O or d_or_m or meie
                or meip or mie or mpie or mrinstretie or mrinstretip
                or msie or msip or mtie or mtimeincie or mtimeincip
                or mtip) 
         casez ( {STB_O,ADR_O[29:27]} )
           4'b0??? : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b0,Dsram[17:16],  Dsram[12:11],Dsram[7],Dsram[3]};
           4'b10?? : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b0,d_or_m[17:16],d_or_m[12:11],d_or_m[7],d_or_m[3]};
           4'b1100 : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b0,d_or_m[17:16],d_or_m[12:11],d_or_m[7],d_or_m[3]}; // Don't care better?
           4'b1101 : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b1,mrinstretip,mtimeincip,1'b0,meip,mtip,msip}; // MIP
           4'b1110 : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b1,mrinstretie,mtimeincie,1'b0,meie,mtie,msie}; // MIE
           4'b1111 : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b1,2'b00,                 1'b1,1'b1,mpie,mie }; // MSTATUS
         endcase
          
          always @(posedge clk)
            if ( corerunning ) begin
               ireg <= a;
            end
          assign erDee = {zeros[32:IWIDTH],ireg};
          assign sysregack = tmpsysregack;
          assign theio = a;
          
       end else begin
          /* SRAM, multiplier, and system registers. When DAT_I is inactive, it is unknown.
           * Most bits:
           *
           * STB_O_or_readM ------+               
           * STB_O ------+        |
           * DAT_I     -|1\       |       
           *            |  |- b -|1\                 __                  
           * MULDIVREG -|0/      |  |--------- a ---|  |- rDee     
           * Dsram     ----------|0/                >  |       
           *                           corerunning -E  |       
           *                            sysregack --R__|
           */
          reg [31:0] a;
          reg        tmpsysregack;
          reg [31:0] ireg;
          wire       STB_O_or_ReadM = STB_O | (clrM & ceM);

          always @(/*AS*/DAT_I or Dsram or MULDIVREG or STB_O
                   or STB_O_or_ReadM) begin
             a[2:0]   = STB_O_or_ReadM ? (STB_O ?   DAT_I[2:0] :   MULDIVREG[2:0]) :   Dsram[2:0];
             a[6:4]   = STB_O_or_ReadM ? (STB_O ?   DAT_I[6:4] :   MULDIVREG[6:4]) :   Dsram[6:4];
             a[10:8]  = STB_O_or_ReadM ? (STB_O ?  DAT_I[10:8] :  MULDIVREG[10:8]) :  Dsram[10:8];
             a[15:13] = STB_O_or_ReadM ? (STB_O ? DAT_I[15:13] : MULDIVREG[15:13]) : Dsram[15:13];
             a[31:18] = STB_O_or_ReadM ? (STB_O ? DAT_I[31:18] : MULDIVREG[31:18]) : Dsram[31:18];
          end
          
          always @(/*AS*/ADR_O or Dsram or MULDIVREG or STB_O
                   or STB_O_or_ReadM or edati or meie or meip or mie
                   or mpie or mrinstretie or mrinstretip or msie
                   or msip or mtie or mtimeincie or mtimeincip or mtip) 
            casez ( {STB_O_or_ReadM,STB_O,ADR_O[29:27]} )
              5'b00??? : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b0,Dsram[17:16],Dsram[12:11],Dsram[7],Dsram[3]};
              5'b01??? : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b0,edati[17:16],edati[12:11],edati[7],edati[3]}; // This is an impossible case. Don't care better?
              5'b10??? : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b0,MULDIVREG[17:16],MULDIVREG[12:11],MULDIVREG[7],MULDIVREG[3]};
              5'b110?? : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b0,edati[17:16],edati[12:11],edati[7],edati[3]};
              5'b11100 : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b0,edati[17:16],edati[12:11],edati[7],edati[3]}; // Don't care better?
              5'b11101 : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b1,mrinstretip,mtimeincip,1'b0,meip,mtip,msip}; // MIP
              5'b11110 : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b1,mrinstretie,mtimeincie,1'b0,meie,mtie,msie}; // MIE
              5'b11111 : {tmpsysregack,a[17:16],a[12:11],a[7],a[3]} = {1'b1,2'b00,                 1'b1,1'b1,mpie,mie }; // MSTATUS
            endcase
          
          always @(posedge clk)
            if ( corerunning ) begin
               ireg[2:0]   <= sysregack ? 3'b0  : a[2:0];
               ireg[3]     <= a[3];
               ireg[6:4]   <= sysregack ? 3'b0  : a[6:4];
               ireg[7]     <= a[7];
               ireg[10:8]  <= sysregack ? 3'b0  : a[10:8];
               ireg[12:11] <= a[12:11];
               ireg[15:13] <= sysregack ? 3'b0  : a[15:13];
               ireg[17:16] <= a[17:16];
               ireg[31:18] <= sysregack ? 14'b0  : a[31:18];
            end
          assign erDee = {zeros[32:IWIDTH],ireg};
          assign sysregack = tmpsysregack;
          assign theio = a;
          

       end
       
    end else begin
       NotYetDoneWTF WorkWTF();
    end
      
   endgenerate
   assign rDee = erDee[31:0];
endmodule


//    end else if ( INPUTMUXTYPE == 7 ) begin
//       if ( DAT_I_ZERO_WHEN_INACTIVE ) begin
//          /* System registers, SRAM and multiplier all present.
//           * When DAT_I is inactive, it is zero. Note that this depends on the 
//           * external INTERCON module. Most bits are identical to a previous case:
//           *
//           * STB_O_or_readM ---+               
//           *             __    |
//           * DAT_I -----|or|--|1\         __   
//           * MULDIVREG -|__|  |  |- a ---|  |- rDee
//           * Dsram     -------|0/        >  |  
//           *                corerunning -E  |                      
//           *                sysregack  --R__|               
//           *       
//           * Total size: 102 SB_LUT4
//           */
//          wire STB_O_or_ReadM = STB_O | (clrM & ceM);
//          wire [32:0] edati = {zeros[32:IWIDTH],DAT_I[IWIDTH-1:0]};
//          reg [31:0]  a;
//          reg         tmpsysregack;
//          reg [31:0]  ireg;
//          
//          always @(/*AS*/Dsram or MULDIVREG or STB_O_or_ReadM or edati
//                   or sysregack) begin
//             a[2:0]   = sysregack ?  3'b0 : STB_O_or_ReadM ? (  edati[2:0] |   MULDIVREG[2:0]) :   Dsram[2:0];
//             a[6:4]   = sysregack ?  3'b0 : STB_O_or_ReadM ? (  edati[6:4] |   MULDIVREG[6:4]) :   Dsram[6:4];
//             a[10:8]  = sysregack ?  3'b0 : STB_O_or_ReadM ? ( edati[10:8] |  MULDIVREG[10:8]) :  Dsram[10:8];
//             a[15:12] = sysregack ?  3'b0 : STB_O_or_ReadM ? (edati[15:12] | MULDIVREG[15:12]) : Dsram[15:12];
//             a[31:18] = sysregack ? 14'b0 : STB_O_or_ReadM ? (edati[31:18] | MULDIVREG[31:18]) : Dsram[31:18];
//          end
//          
//          always @(/*AS*/ADR_O or Dsram or MULDIVREG or STB_O_or_ReadM
//                   or edati or meie or meip or mie or mpie
//                   or mrinstretie or mrinstretip or msie or msip
//                   or mtie or mtimeincie or mtimeincip or mtip) 
//            casez ( {STB_O_or_ReadM,ADR_O[29:27]} )
//              4'b0??? : {tmpsysregack,a[17:16],a[11],a[7],a[3]} = {1'b0,Dsram[17:16],Dsram[11],Dsram[7],Dsram[3]};
//              4'b10?? : {tmpsysregack,a[17:16],a[11],a[7],a[3]} = {1'b0,{edati[17:16]|MULDIVREG[17:16]},{edati[11]|MULDIVREG[11]},{edati[7]|MULDIVREG[7]},{edati[3]|MULDIVREG[3]}};
//              4'b1100 : {tmpsysregack,a[17:16],a[11],a[7],a[3]} = {1'b0,{edati[17:16]|MULDIVREG[17:16]},{edati[11]|MULDIVREG[11]},{edati[7]|MULDIVREG[7]},{edati[3]|MULDIVREG[3]}}; // Don't care better?
//              4'b1101 : {tmpsysregack,a[17:16],a[11],a[7],a[3]} = {1'b1,mrinstretip,mtimeincip,meip,mtip,msip}; // MIP
//              4'b1110 : {tmpsysregack,a[17:16],a[11],a[7],a[3]} = {1'b1,mrinstretie,mtimeincie,meie,mtie,msie}; // MIE
//              4'b1111 : {tmpsysregack,a[17:16],a[11],a[7],a[3]} = {1'b1,2'b00,                 1'b1,mpie,mie }; // MSTATUS
//            endcase
//          
//          always @(posedge clk)
//            if ( corerunning ) begin
//               ireg[2:0]   <= sysregack ? 3'b0  : a[2:0];
//               ireg[3]     <= a[3];
//               ireg[6:4]   <= sysregack ? 3'b0  : a[6:4];
//               ireg[7]     <= a[7];
//               ireg[10:8]  <= sysregack ? 3'b0  : a[10:8];
//               ireg[11]    <= a[11];
//               ireg[15:12] <= sysregack ? 3'b0  : a[15:12];
//               ireg[17:16] <= a[17:16];
//               ireg[31:18] <= sysregack ? 3'b0  : a[31:18];
//            end
//          assign erDee = {zeros[32:IWIDTH],ireg};
//          assign sysregack = tmpsysregack;
//          assign theio = a;
// 
//       end else begin
//          /* System registers, SRAM and multiplier all present.
//           * When DAT_I is inactive, we know nothing about the value of DAT_I,
//           * so we must use additional resources. Most bits can be implemented like this:
//           *
//           * STB_O_or_readM ------+               
//           * STB_O ------+        |
//           * DAT_I     -|1\       |                ___          __            
//           *            |  |- b -|1\  sysregack -o| & |-- a ---|  |- rDee           
//           * MULDIVREG -|0/      |  |-------------|___|        >  |           
//           * Dsram     ----------|0/              corerunning -E__|  
//           *                   
//           * Total size around: IWIDTH+81 SB_LUT4 ???
//           */
//          wire STB_O_or_ReadM = STB_O | (clrM & ceM);
//          wire [32:0] edati = {zeros[32:IWIDTH],DAT_I[IWIDTH-1:0]};
//          reg [31:0]  a;
//          reg         tmpsysregack;
//          reg [31:0]  ireg;
//          
//          always @(/*AS*/Dsram or MULDIVREG or STB_O or STB_O_or_ReadM
//                   or edati) begin
//             a[2:0]   = sysregack ?  3'b0 : STB_O_or_ReadM ? (STB_O ?   edati[2:0] :   MULDIVREG[2:0]) :   Dsram[2:0];
//             a[6:4]   = sysregack ?  3'b0 : STB_O_or_ReadM ? (STB_O ?   edati[6:4] :   MULDIVREG[6:4]) :   Dsram[6:4];
//             a[10:8]  = sysregack ?  3'b0 : STB_O_or_ReadM ? (STB_O ?  edati[10:8] :  MULDIVREG[10:8]) :  Dsram[10:8];
//             a[15:12] = sysregack ?  3'b0 : STB_O_or_ReadM ? (STB_O ? edati[15:12] : MULDIVREG[15:12]) : Dsram[15:12];
//             a[31:18] = sysregack ? 14'b0 : STB_O_or_ReadM ? (STB_O ? edati[31:18] : MULDIVREG[31:18]) : Dsram[31:18];
//          end
//          
//          always @(/*AS*/ADR_O or Dsram or MULDIVREG or STB_O
//                   or STB_O_or_ReadM or edati or meie or meip or mie
//                   or mpie or mrinstretie or mrinstretip or msie
//                   or msip or mtie or mtimeincie or mtimeincip or mtip) 
//            casez ( {STB_O_or_ReadM,ADR_O[29:27]} )
//              4'b0??? : {tmpsysregack,a[17:16],a[11],a[7],a[3]} = {1'b0,Dsram[17:16],Dsram[11],Dsram[7],Dsram[3]};
//              4'b10?? : {tmpsysregack,a[17:16],a[11],a[7],a[3]} 
//                = {1'b0,{STB_O ? edati[17:16] : MULDIVREG[17:16]},{STB_O ? edati[11] : MULDIVREG[11]},{STB_O ? edati[7] : MULDIVREG[7]},{STB_O ? edati[3] : MULDIVREG[3]}};
//              4'b1100 : {tmpsysregack,a[17:16],a[11],a[7],a[3]} 
//                = {1'b0,{STB_O ? edati[17:16] : MULDIVREG[17:16]},{STB_O ? edati[11] : MULDIVREG[11]},{STB_O ? edati[7] : MULDIVREG[7]},{STB_O ? edati[3] : MULDIVREG[3]}}; // Don't care better?
//              4'b1101 : {tmpsysregack,a[17:16],a[11],a[7],a[3]} = {1'b1,mrinstretip,mtimeincip,meip,mtip,msip}; // MIP
//              4'b1110 : {tmpsysregack,a[17:16],a[11],a[7],a[3]} = {1'b1,mrinstretie,mtimeincie,meie,mtie,msie}; // MIE
//              4'b1111 : {tmpsysregack,a[17:16],a[11],a[7],a[3]} = {1'b1,2'b00,                 1'b1,mpie,mie }; // MSTATUS
//            endcase
//          
//          always @(posedge clk)
//            if ( corerunning )
//              ireg <= a;
//          assign erDee = {zeros[32:IWIDTH],ireg};
//          assign sysregack = tmpsysregack;
//          assign theio = a;
// 
//       end
//       
//    end else begin
//       InternalError Work();
//    end
//    
// //   assign m_inputmux_killwarnings = ADR_O[0];

