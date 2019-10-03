/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * 
 * Interface for iceblink40-hx1k boards to the PC
 * ==============================================
 * This board communicate via AT90USB2162. The program is protected and unknown.
 * To avoid to have to irreversibly modify the contents of the card, we must
 * implement a communication by glearing at the reference design. Some sort of
 * parallell port EPP interface is implemented. This module is a 
 * reimplementation performed "in the blind", hopefully good enough.
 * 
 * Action                            Main result          Side-effect  
 * --------------------------------  -----------          ---------------
 * midgetv reads with ADR_I[0] == 0  DAT_O = data;        toggles nrFPGAdataread 
 * midgetv reads with ADR_I[0] == 1  DAT_O[1:0] = status  none
 * midgetv writes                    txreg = DAT_I        toggles nrFPGAdatawritten
 * PC writes address                 adr[0] = padDB[0]    none
 * PC writes data                    data = padDB         toggles nrPCdatawritten
 * PC reads data, adr[0] == 0        padDB = txreg        toggles nrPCdataread
 * PC reads data, adr[0] == 1        padDB = status       none
 * PC reads address                  not implemented      ?
 * 
 * For status, only the lower two bits are used.
 * Bit 0 : 1 if a byte waits to be read by the PC.
 * Bit 1 : 1 if a byte waits to be read by midgetv.
 * 
 */

module m_digilent
  (
   input        CLK_I, //    System clock
   input [7:0]  DAT_I, //    Data out from core, destined for PC
   input [0:0]  ADR_I, //    Address to read/write
   input        STB_I, //    Module is accessed
   input        WE_I, //     Write cycle
   output [7:0] DAT_O, //    Data to midgetv
   output       ACK_O, //    Acknowledge after operation
   
   input        padnADDRSTB, // Address strobe, active low
   input        padnDATASTB, // Data strobe, active low
   input        padnWRITE, //   PC Write, active low
   inout [7:0]  padDB, //       8-bit bidirectional address/data.
   output       padnWAIT  //    Handshake signal, see below
   );

   /* =================================================
    * Part of the code that communicates with AT90USB2
    * =================================================
    */

   wire         nDATASTB,nADDRSTB;
   SB_IO #( .PIN_TYPE(6'b 0000_01)) the_nDATASTB( .PACKAGE_PIN( padnDATASTB ),.D_IN_0(nDATASTB) );
   SB_IO #( .PIN_TYPE(6'b 0000_01)) the_nADDRSTB( .PACKAGE_PIN( padnADDRSTB ),.D_IN_0(nADDRSTB) );
   
   /* When nWAIT is low it is OK to start a cycle (assert a strobe), 
    * when high it indicates that it is OK to  end the cycle 
    * (de-assert a strobe). 
    */
  
   /* I want to use a FF register in the SB_IO, **and**
    * the input directly. But then I must use the FF associated
    * with D_IN_1, which is normally negative edge clocked. 
    * Hence I must invert the clock (.NEG_TRIGGER). This leads
    * to a tiny problem, see below at [a] 
    */
   wire [7:0]   data; // Byte written by PC during an EPP write data cycle.
   wire [7:0]   theout; // Byte read by PC during an EPP read data cycle.
   wire [7:0]   in;
   reg [0:0]    adr;
   wire         nWRITEsig;
   wire         sampledata = nADDRSTB & ~nWRITEsig;

   SB_IO #( .PIN_TYPE( 6'b 1010_01), .NEG_TRIGGER(1'b1))
   theio [7:0] ( .PACKAGE_PIN(       padDB        ),
                 .INPUT_CLK(         nDATASTB     ),
                 .CLOCK_ENABLE(      sampledata   ),
                 .D_OUT_0(           theout       ),
                 .D_IN_0(            in           ),
                 .D_IN_1(            data         ),
                 .OUTPUT_ENABLE(     nWRITEsig    )
                 );

   /* [a]. Because SB_IO's are grouped two and two in IO tiles,
    * the choice to invert the clock above affects some other IO's.
    * arachne-pnr does not understand that the clock phase is 
    * irrelevant for nWAIT and nWRITE, so these SB_IO's must be 
    * instantiated.
    */
   wire         cmb_nWAIT = !(nADDRSTB & nDATASTB);
   SB_IO #( .PIN_TYPE( 6'b 0110_00), .NEG_TRIGGER(1'b1))
   the_nWAIT ( .PACKAGE_PIN( padnWAIT ),.D_OUT_0( cmb_nWAIT ));
   SB_IO #( .PIN_TYPE( 6'b 0000_01), .NEG_TRIGGER(1'b1))
   the_nWRITE( .PACKAGE_PIN( padnWRITE),.D_IN_0( nWRITEsig ));
  
   always @(posedge nADDRSTB)
     if ( ~nWRITEsig )
       adr[0] <= in[0]; // Byte written by PC during an EPP write address cycle (only lsb used).

   /* Each time the PC write a byte, a 1-bit counter is incremented, and
    * each time the PC reads a byte while adr[0] == 0, a 1-bit counter is incremented
    */
   reg          nrPCdatawritten,nrPCdataread;
   always @(posedge nDATASTB)
     if ( sampledata )
       nrPCdatawritten <= ~nrPCdatawritten;
     else if ( adr[0] == 1'b0 )
       nrPCdataread <= ~nrPCdataread;

   assign theout = adr[0] ? {txreg[7:2],rxbuff_full,txbuff_full} : txreg;

   /* ================================================
    * Status
    * ================================================
    * The point of view is from the FPGA. Hence,
    * rxbuff_full mean a byte is ready to be read by
    * the FPGA. txbuff_full mean the FPGA should wait
    * to transmit a new byte to the PC
    */
   wire         rxbuff_full = nrPCdatawritten ^ nrFPGAdataread;
   wire         txbuff_full = nrFPGAdatawritten ^ nrPCdataread;
   
   /* ================================================
    * Part of the code that communicates with midgetv
    * ================================================
    */
   reg          nrFPGAdatawritten,nrFPGAdataread;
   reg [7:0]    txreg;
   
   always @(posedge CLK_I ) 
     if ( STB_I & WE_I & ~ADR_I[0] ) begin
        txreg <= DAT_I;
        nrFPGAdatawritten <= ~nrFPGAdatawritten;
     end
   
   always @(posedge CLK_I ) begin
      if ( STB_I & ~WE_I & ~ADR_I[0] )
        nrFPGAdataread <= ~nrFPGAdataread;
   end
   
   assign DAT_O = ADR_I[0] ? {data[7:3], rxbuff_full,txbuff_full} : data;
   assign ACK_O = STB_I;
   
endmodule


