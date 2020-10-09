/* =============================================================================
 *
 * Simplified diagrams of some bus cycles. Do not use blindly, look at definitions.
 *
 * Reading from EBR
 * 
 * executes ucode:     LW_0        LW_1        $tdIncPc
 * nextucode| LW_0   | LW_1      | $tdIncPc  | Fetch
 * B       ||        | [RS1]+imm |  data     | pc+4        |
 * DAT_O   ||        | [RS1]     | data      | pc          |
 * ADR_O   ||        | imm       | [RS1]+imm | 0
 *         || _______             _________________________
 * iwe     ||        \ __________/                         \

 * All the rest wrong.
 *
 * Reading from SRAM (reading from input is similar)
 * B       || adr    |           |             |   data      |
 * ADR_O   ||        | adr       | adr         |  /          |
 * SRAMout ||        |           | data        | /           |
 * rDee    ||        |           |             | data        |
 *                    _________________________
 * STB_O ____________/            _____________\______________
 * ACK_I ________________________/             \______________
 *
 * Executing from EBR, no retired instruction counter
 *                                               1st instr
 *         ||$tdIncPc| Fetch     | Fetch2      | ucode
 * I       ||        | op        | op          | op
 * B       || pc+4   |           | ttime+cycnt | 
 * DAT_O   ||        | op        | ttime       | [RS1]
 * ADR_O   ||        | pc+4      | 0           | Imm
 * 
 * Executing from EBR, with retired instruction counter
 *                                                            1st instr
 *         ||$tdIncPc| Fetch     | Fetch2      | Fetch3      | ucode
 * I       ||        | op        | op          | op          | op
 * B       || pc+4   |           | ttime+cycnt | rinst+1     | 
 * DAT_O   ||        | op        | ttime       | rinst       | [RS1]
 * ADR_O   ||        | pc+4      | 0           |             | Imm
 * 
 * Executing from SRAM, no retired instruction counter
 *                                                                           1st instr
 *         ||$tdIncPc| eFetch(1) | eFetch(2)   | eFetch(3)   | eFetch2     | ucode
 * I       ||        |           |             |             | op          | op
 * B       || pc+4   |           |             |             | ttime+cycnt |   
 * DAT_O   ||        |           | FFFFFFFF    | FFFFFFFF    | ttime       | [RS1]
 * ADR_O   ||        | pc+4      | pc+4        |             | 0           | Imm
 * SRAMout ||        |           | op          |             |             |
 * rDee    ||        |           |             |             | op          |
 *                    _________________________
 * STB_O ____________/            _____________\______________
 * ACK_I ________________________/             \______________
 *
 *
 */
/*
 * Even in small implementations I must:
 *   o  control interrupt enable. 
 *   o  implement MRET.
 *   o  I also need to get back to normal code from my CSR stubs.
 *
 * Interrupt enable in midgetv
 * ---------------------------
 *   o  An interrupt occurs (asynchronous trap) and MIE == 1:
 *      MPIE <= MIE, MIE <= 0
 *      Handled by microcode instruction (field isr_intoTrap).
 *   o  A synchronous trap occurs:
 *      MPIE <= MIE, MIE <= 0
 *      Handled by microcode instruction (field isr_intoTrap).
 *   o  When MRET is executed:
 *      Want MIE <= MPIE, MPIE <= 1
 *      This is specified by bit 1 of the source adr in instruction "ij".
 *   o  During execution of a CSR instruction, interrupts are disabled:
 *      inCSR <= 1
 *      Handled by microcode instruction (field isr_intoCSR).
 *   o  Exit from CSR instruction must clear inCSR
 *      This is handled by microcode (instruction "ij")
 *   o  A special case, from CSR emulation to a synchronous trap:
 *      This is needed because unimplemented CSR addresses should
 *      lead to a trap on the CSR instruction. What we need to do is
 *      to get inCSR = 0, and MPIE = MIE, MIE = 0 without any possible
 *      interrupt source to intervene. We do this by the "ij" instruction
 *      where bit 0 of the source adr is used to get this behaviour.
 * 
 * inCSR  MIE  MPIE   Instruction     What the code should do
 * 0      -    -      ij 0,0x100+0,0  Exit from CSR instr. emu.    (a)
 * 0      0    MIE    ij 0,0x100+1,0  From CSR instr. emu. to trap (b)
 * 0      -    -      ij 0,0x0a4+0,0  From internal INT to trap    (c)
 * 0      MPIE 1      ij 0,0x0b4+2,0  Used in exit from trap       (d)
 *
 * In case (a), we jump to the address stored in location 0x100. The ucode
 * has stored the address of the CSR instruction there. The CSR emulation
 * code will have incremented the contents in location 0x100 by 4 to return
 * to the instruction following the CSR instruction.
 *
 * In case (b), microcode do "mepc = mem[0x100]" so that the normal trap
 * seems to have had an exception at the CSR instruction.
 *
 * In case (c), the instruction is only used to get from internalINT to
 * the trap address without touching registers.
 *
 * In case (d), the situation is as follows. Instructions URET, SRET and 
 * MRET are emulated starting at address 0x104. I treat URET and SRET as
 * an MRET in this implementation. The code at address 0x104 is simply
 * "ij 0,0x0b4+2,0", so execution continues at mepc.
 *
 * This implementation follows the riscv privileged spec with regards
 * to treatment of MPIE and MIE. We introduce an additional interrupt
 * disable by the inCSR FF. The reason for this is that a user program
 * that uses a CSR could otherwise be interrupted while emulating the 
 * CSR, and the interrupt handle will certainly use CSR instructions. 
 *
 * I add a custom-0 instruction "ij" of the following format:
 *
 *  | 332222222222 | 11111 | 111 | 11    | 
 *  | 109876543210 | 98765 | 432 | 10987 | 6543210
 *  | ofs          | rs1   | 000 | rd    | 0001011
 *
 * "ij" is used to implement MRET, and to exit CSR emulation.
 * When exiting CSR emulation, ((rs1+ofs) & 2) == 0
 * When emulating MRET,        ((rs1+ofs) & 2) == 2.
 * 
 * The "ij" instruction implements an indirect memory jump
 * instruction, perhaps usable by programs. If "ij" is not
 * hword aligned, it will lead to an illegal instruction
 * exception, but use the contents of the memory source as
 * the exception address. This is to cover the case where 
 * an illegal CSR address is encountered.
 *
 * "ij  rd,ofs(rs1)"   t = pc; 
 *                     d = rs1+ofs;
 *                     inCSR = 0;
 *                     tMIE = (d & 1) ? 0 : ((d & 2) ? MPIE : MIE);
 *                     MPIE = (d & 1) ? MIE : ((d & 2) ? 1 : MPIE);
 *                     MIE = tMIE;
 *                     pc = mem[(rs1+d)&~3u]; 
 *                     rd = t
 *
 * I have some difficulties with the macro syntax of gnu as, so I do:
 * "ij  rd,ofs(rs1)" written as "ij  rdnr,ofs,rs1nr". Examples:
 * MRET translates to    ij 0, 0x0b6,0
 * CSRRET translates to  ij 0, 0x100,0
 *
 * When microcode that enters an exception is executed, it automatically do 
 * MPIE <= MIE, MIE <= 0.
 * 
 * Microcode that decode CSR automatically do inCSR = 1.
 *
 * Whenever "ij" is executed, inCSR is always cleared. 
 */

/* -----------------------------------------------------------------------------
 * When a qualified interrupt occurs, the riscv specification
 * mandates that mepc = pc, mcause = interrupt number, mtval = 0,
 * MPIE = MIE, MIE = 0, and pc = mtvec.
 * 
 * To allow flexibility in implementation of interrupts on midgetv, we
 * instead do: mepc = pc, mcause = 0, mtval = 7, MPIE = MIE, MIE = 0
 * and pc = internalISR. The internalISR routine should massage
 * mcause to the correct value and jump to where mtvec points using
 * the "ij" instruction.
 */

/* =============================================================================
 * Here is the real data. A number of entries must be at fixed
 * locations due to decoding of the instruction. A number of entries
 * must be consecutive, because we can have a microcode branch. Some
 * entries may be reached by riscv instructions that are not
 * supported.  Remaining locations in the table are used for
 * instructions. Example: "addi" is decoded in such a way that
 * location 4 contains the first microcode instruction. From the
 * definition of _ADDI_0 we can see that the next microcode
 * instruction is StdIncPc, that we find in location 0xe6 below. We
 * can then follow the chain to Fetch and further on.
 *
 * The use of this table, apart from those microcodeinstructions that
 * must be in fixed positions, is entirely up to me. I simply fill it
 * out here. 
 *
 * reachability is used in simulation only. An entry where reachability == 1
 * during instruction decode must come from an instruction as shown in 
 * INSTR, with bits as specified by MASK. If reachability == 0, the line
 * should not be hit by __any__ decode. If reachability == 2, the line can
 * be hit by an instruction, that instruction should not be supported in 
 * RV32I, nor be any other instruction midgetv support.
 *
 *
 * Fixed and spes:
 * 0 : Freely available for any ucode line
 * 1 : Fixed. ucode line must be here
 */

/* When LAZY_DECODE == 0, we still hits those ucode indexes where reachability == 2.
 * When LAZY_DECODE == 1, we also hit indexes at lines commented below.
 * Lines that catch illegal instructions use the MASK as a count of the number of
 * times it should be hit.
 *
 */

// 0000000 00000 00000 000 00000 1110011 ECALL : mepc = pc, mtval = 0 mcause = 11                                                                                                                     
// 0000000 00001 00000 000 00000 1110011 EBREAK: mepc = pc, mtval = 0 mcause = 3    
// 0000000 00010 00000 000 00000 1110011 URET                                       
// 0001000 00010 00000 000 00000 1110011 SRET                                       
// 0011000 00010 00000 000 00000 1110011 MRET                                       
                                                                                    
                                                                                    
// Easy constants                                                                   
//  00000000 (r00000000     ) (passd)                                               
//  00000001 (Q=0, r00000000),(add1 )                                               
//  00000003 (Q=0, r00000000),(add3 )                                               
//  00000004 (Q=0, r00000000),(add4 )                                               
//  000000ff (r0000000f     ),(passd)                                               
//  00000100 (Q=0, r000000ff),(add1 ) CSRRW                                         
//  00000102 (Q=0, r000000ff),(add3 ) CSRRS                                         
//  00000103 (Q=0, r000000ff),(add4 ) CSRRC                                         
//  ffffffff (Q=0, rffffffff),(add1 )                                               
//  00000002 (Q=0, rffffffff),(add3 )                                               
//  ffffff7f (rffffff7f     ),(passd)                                               
//  ffffff80 (Q=0, rFFFFFF7F),(add1 ) CSRRWI                                        
//  ffffff82 (Q=0, rFFFFFF7F),(add3 ) CSRRSI                                        
//  ffffff83 (Q=0, rFFFFFF7F),(add4 ) CSRRCI                                        
//                                                                                  
