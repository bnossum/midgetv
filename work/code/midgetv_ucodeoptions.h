/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * These are toplevel defines that affects the microcode.
 * This C header file is transformed to a Verilog include file.
 */

/* According to riscv-spec-v2.2.pdf: In RV32 it is mandatory to maintain the 
 * 64-bit performance counters RDCYCLE, RDINSTRET. RDTIME is also mandatory. 
 * In midgetv, this is solved the following way:
 * mcycle is always present. 
 * mcycleh is incremented via an internal interrupt
 * mtime and mtimeh are maintained by an internal interrupt triggered by a 
 *   (selectable) prescale of mcycle. 
 * minstret is supported if the macros below evaluate true.
 * minstreth is incremented via an internal interrupt.
 *
 * When minstret is supported, each and every instructions use one more
 * cycle. I foresee that we can have these choices:
 *   HAS_MINSTRET
 *   |HAS_EBR_MINSTRET
 *   00  Do not count instructions
 *   01  Illegal
 *   10  Only count instructions executing from SRAM
 *   11  Count all instructions.
 *
 * However, the most tested configureation is with MINSTRET included.
 */
#define ucodeopt_HAS_MINSTRET     1
#define ucodeopt_HAS_EBR_MINSTRET 1


/* Midgetv can optionally include instructions MUL, MULH, MULHSU, MULHU,
 * DIV, DIVU, REM and REMU. I assume midgetv will be used in control
 * applications where these instructions are rare. But sometimes it is not
 * easy to get away from the occational multiplication or divisions. In the
 * spirit of midgetv, the focus is on implementation size.
 */
#define ucodeopt_MULDIV           1
 
/* Midgetv can optionally include the “C” Standard Extension for
 * Compressed Instructions, Version 2.0
 */
#define ucodeopt_RVC              1

