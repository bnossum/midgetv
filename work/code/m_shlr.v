/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * ----------------------------------------------------------------------------
 *
 * For multiply and divide.
 * 
 *           +-------------+
 * A[i+1] ---|--|0\        |          rA
 *           |  |  |-|0\   |           ____
 * A[i-1] ---|--|1/  |  |--|--- cmbA -|D  Q|- A[i]
 * DAT_O ----|---+---|1/   |    clk  ->    |
 * loadA ----|--------+    |    ceA  -E    |
 *           +-------------+         -R____|
 * 
 * A 32-bit register A must be implemented. rA is loaded with a value at the start
 * of a multiplication or division. 
 * 
 * During multiplication register A is shifted right. ADR_O is also shifted 
 * right, so DAT_O must be 0.
 * 
 * During division register A is shifted left. ADR_O is also shifted left,
 * so DAT_O must be 0xffffffff.
 * 
 * Register A must be readable. When midgetv has SRAM, it is ior'ed with theio
 * for no extra cost. When midgetv has no SRAM, it is multiplexed in the 
 * input mux, where there may be free resouces, cost 32-IWIDTH LUTs.
 *  
 * As a refinement, I may select to optionally support sequences MULH[[S]U]/MUL 
 * fused operation. I will then disable interrupts for the instruction following 
 * MULH[[S]U]. If the next instruction is MUL, and rs1 and rs2 are the same, the
 * conserved register A is read. 
 * Similarly, I may select to support sequences DIV[U]/REM[U].
 * 
 
 Alternative 2: Add a dedicated left/right shifter
 1. When SRAM. If I can be sure theio == 0, reading of regA can be
    had for free: r <= STB_O_or_MULDIV ? (theio | regA) : Dsram
    Essential extra cost: 32 LUTs for Areg
 2. When no SRAM. rDee has underutilized LUTs in front.
    Essential extra cost: 32 LUTs for Areg
 
 Alternative 2 is the best.
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * 
 * Radix-2 Multiplication
 * ----------------------
 *         _______    _______________    _______________ 
 * |   +--|"carry"|->|__ADR_O[31:0]__|->|__rA___________|
 * |   |              ||||||:::||||||                  |
 * |   +______        ||||||:::||||||                  |
 * |   /      |<------++++++:::++++++                  |
 * |  /      /                                         |
 * +--|  ALU |    _                                    |
 *    \      \   |&|-----------------------------------+
 *     \______|<-|_|--++++++:::++++++
 *                    ||||||:::||||||
 *                    DAT_O[31:0]
 *
 * MULHU
 * -----
 * The simplest multiplier computes the product of two unsigned numbers,
 * one bit per two cycles, see figure above. The numbers to be multiplied are
 * A=a[31:0] (initially in register rs1) and B=b[31:0] (in register rs2).
 * At the start of the instruction, the value of register rs1
 * is loaded into rA. Register rAsign is cleared. Register rAcy is cleared.
 * Each multiply step uses two cycles.
 * 
 * Cycle 1: If rA[0] == 1, the ALU operation is ADD. The sum ADR_O+B is placed
 *          back in ADR_O. The carry out of the sum is stored inverted in raluF.
 *          If rA[0] == 0, the ALU operation is PASSQ. ADR_O+0 is placed back
 *          in ADR_O. The carry out (zero) is stored inverted in raluF.
 * 
 * Cycle 2: Registers ADR_O and rA are shifted right, with ~raluF being moved
 *          into ADR_O[31], ADR_O[0] being moved into rA[31].
 *          rA[31] <= ADR_O[0]
 *          For i in [1:30] : rA[i] =< rA[i+1]
 *          rA[0] <= rAcy ^ ~rA[1]
 *          rAcy  <= rAcy * ~rA[1].
 * 
 * After 64 cycles register ADR_O holds the upper 32 bits of the product, as
 * required for the MULHU instruction. 
 * 
 * MUL
 * ---
 * The same algorithm as for MULHU is used. Register rA holds the lower 32 bits of
 * the product, as required for the MUL instruction.
 * 
 * MULH
 * ----
 * Instruction MULH do "signed rs1 * signed rs2".
 * At the start of the instruction, the value of register rs1
 * is loaded into rA, and the sign or rs1 is mirrored to rAsign. 
 * rAcy is initiated to ~a0. (rAcy <= ~DAT_O[0]).
 * If rs1 is negative, I want to invert both rs1 and rs2. rs1 is inverted
 * in firmware, bit serially. If rs1 is negative I store -rs2 to Rjj, else
 * I store rs2 to Rjj.
 * Each multiply step uses two cycles.
 * 
 * Cycle 1: If rA[0] == 1, the ALU do ADD. ADR_O <= ADR_O+Rjj 
 *          If rA[0] == 0, the ALU do PASSQ. ADR_O <= ADR_O+0
 * 
 * Cycle 2: Registers ADR_O and rA are shifted arithmetic right.
 * After 64 cycles register ADR_O holds the upper 32 bits of the signed product,
 * as required for the MULH instruction.
 *          rA[31] <= rA[31]
 *          For i in [1:30] : rA[i] =< rA[i+1]
 *          rA[0] <= rAcy ^ ~rA[1]
 *          rAcy  <= rAcy * ~rA[1].
 * 
 * MULHSU
 * -----
 * Instruction MULHSU do "signed rs1 * unsigned rs2". 
 * At the start of the instruction, the value of register rs2 
 * is loaded into rA. rAsign <= 0, rAcy <= 0.
 * The value of register rs1 is stored to Rjj.
 * We then proceed as for MULH.
 * 
 * 
 * This is all V_E_R_Y___C_R_U_D_E, because in a future I think I can do better,
 * with 1 cycle per bit. I then need to change the input mux main equation
 * from "assign Di = sa00mod ? DAT_O : (DAT_O & rDee | ~DAT_O & shADR_O);"
 * to   "assign Di = sa00mod ? rDee  : (DAT_O & rDee | shADR_O & ~rDee);"
 * The motivation is to be ble to shift and add in the same cycle. As 
 * this is quite intrusive, I leave it for new.
 * 
 */
module m_shlr
  # ( parameter HIGHLEVEL = 1 )
   (
    input         clk,
    input         loadA,
    input         ADR_O0, // During MULx we shift right. This is msb
    input         raluF, //  During DIVx/REMx we shift left. This is lsb
    input [31:0]  DAT_O, //  To initiate shift register
    output [31:0] A, //      Eventually holds low 32 bits of MULT or quotient of DIV
    );
   
   generate
      if ( HIGHLEVEL ) begin
         reg [31:0]  rA;
         wire [31:0] cmbA,shlA,shrA;

         assign shlA = {rA[30:0],raluF};
         assign shrA = {ADR_O0,rA[31:1]};
         assign cmbA = loadA ? DAT_O : (DAT_O&shlA) | (~DAT_O&shrA);

         always @(posedge clk)
           if ( ceA ) 
             rA <= cmbA;
         assign A = rA;
      end
   endgenerate
   
endmodule
