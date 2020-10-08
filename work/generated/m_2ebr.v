/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 42 columns
 * Removed:  000000000001000000000000000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 42
 * 167 distinct lines in remaining untreated columns
 * c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 167 167 167 167 167 167 167 167 167 167 167   x 167 167 166 167 166 167 167 166 167 167 166 167 167 167 167 167 164 163 166 167 166 167 166 166 166 167 167 166 167 166  kill col 12  Tbl  40 cols 000000000001000000000000000001000000000000 has 163 unique lines.
 * 163 163 163 163 163 163 163 163 163 163 163   x 163 163 162 163 161 163 163 160 163 163 162 163 163 163 163 163 160     161 162 162 163 162 162 162 163 163 162 163 162  kill col 22  Tbl  39 cols 000000000001000000010000000001000000000000 has 160 unique lines.
 * 160 160 160 160 160 160 160 160 160 160 160   x 160 160 159 160 159 160 160     160 160 159 160 160 160 160 160 157     158 159 159 160 159 158 158 160 160 159 160 158  kill col 13  Tbl  38 cols 000000000001000000010000000011000000000000 has 157 unique lines.
 * 157 157 157 157 157 157 157 157 157 157 157   x 157 157 156 157 156 157 157     157 157 156 157 157 157 157 157         153 156 156 156 156 155 155 157 157 156 157 155  kill col 11  Tbl  37 cols 000000000001000000010000000011100000000000 has 153 unique lines.
 * 153 153 153 153 153 153 153 153 153 153 153   x 153 153 152 153 152 153 153     153 153 151 153 153 153 153 153             152 152 152 152 151 151 152 153 152 153 151  kill col 19  Tbl  36 cols 000000000001000000010010000011100000000000 has 151 unique lines.
 * 151 151 151 151 151 151 151 151 151 151 151   x 151 151 150 151 150 151 151     151 151     151 151 151 151 151             150 150 150 150 149 149 150 151 150 151 149  kill col  6  Tbl  35 cols 000000000001000000010010000011100001000000 has 149 unique lines.
 * 149 149 149 149 149 149 149 148 149 149 149   x 149 149 148 149 148 149 149     149 149     149 149 149 149 149             148 148 148 148     147 147 149 147 149 147  kill col  5  Tbl  34 cols 000000000001000000010010000011100001100000 has 147 unique lines.
 * 147 147 147 147 147 147 147 146 147 147 147   x 146 147 146 147 146 147 147     147 147     147 146 147 147 147             146 146 146 145         145 146 144 144 144  kill col  2  Tbl  33 cols 000000000001000000010010000011100001100100 has 144 unique lines.
 * 144 144 144 144 144 144 144 143 144 144 144   x 143 144 143 144 142 144 144     144 144     144 143 142 144 144             143 143 143 140         140 141     141 139  kill col  0  Tbl  32 cols 000000000001000000010010000011100001100101 has 139 unique lines.
 * 139 139 139 139 139 139 139 138 139 139 139   x 138 139 137 139 137 138 139     139 139     139 138 137 139 139             138 138 138 134         130 136     136      kill col  4  Tbl  31 cols 000000000001000000010010000011100001110101 has 130 unique lines.
 * 130 130 130 130 130 130 130 128 130 130 130   x 129 129 127 130 126 128 129     130 130     130 129 128 130 130             129 129 129 123             124     123      kill col  7  Tbl  30 cols 000000000001000000010010000011100011110101 has 123 unique lines.
 * 123 123 123 123 123 123 123 121 123 123 123   x 122 121 120 123 115 115 120     123 123     123 120 119 123 121             122 122 122                 114     111      kill col  1  Tbl  29 cols 000000000001000000010010000011100011110111 has 111 unique lines.
 * 111 111 111 111 111 111 111 109 111 110 111   x 109 108 108 109 101 103 104     111 111     111 103 103 111 108             110 110 110                  92              kill col  3  Tbl  28 cols 000000000001000000010010000011100011111111 has  92 unique lines.
 *  92  92  92  92  92  92  92  89  92  91  91   x  89  89  90  91  81  82  84      92  92      92  84  85  92  88              91  91  90                                  kill col 25  Tbl  27 cols 000000000001000010010010000011100011111111 has  81 unique lines.
 *  81  81  81  81  81  81  81  78  80  80  79   x  78  79  79  80      72  71      81  81      81  73  74  81  76              80  80  79                                  kill col 23  Tbl  26 cols 000000000001000010110010000011100011111111 has  71 unique lines.
 *  70  71  71  71  71  71  71  68  70  70  69   x  68  69  68  69      62          71  71      71  66  65  71  66              70  70  69                                  kill col 24  Tbl  25 cols 000000000001000011110010000011100011111111 has  62 unique lines.
 *  61  62  61  62  61  62  62  59  61  61  60   x  59  61  59  60                  62  62      62  57  57  62  58              61  61  60                                  kill col 17  Tbl  24 cols 000000000001000011110010100011100011111111 has  57 unique lines.
 *  56  56  56  57  56  56  57  54  56  56  55   x  54  56  55  54                  57  57      57      53  57  53              56  56  55                                  kill col 16  Tbl  23 cols 000000000001000011110010110011100011111111 has  53 unique lines.
 *  52  51  52  53  52  52  53  50  52  52  51   x  50  51  51  50                  51  52      53          53  50              52  52  51                                  kill col 34  Tbl  22 cols 000000010001000011110010110011100011111111 has  50 unique lines.
 *  49  48  49  50  49  49  50      49  49  48   x  48  48  48  47                  48  49      50          50  47              49  49  49                                  kill col 26  Tbl  21 cols 000000010001000111110010110011100011111111 has  47 unique lines.
 *  46  45  45  47  46  46  47      46  46  45   x  43  43  43                      45  46      47          47  44              46  46  46                                  kill col 29  Tbl  20 cols 000000010001100111110010110011100011111111 has  43 unique lines.
 *  42  41  38  43  42  42  43      42  42  41   x      39  39                      41  42      42          43  40              42  42  42                                  kill col 39  Tbl  19 cols 001000010001100111110010110011100011111111 has  38 unique lines.
 *  37  35      38  37  37  38      37  37  36   x      32  33                      36  36      37          38  36              37  37  37                                  kill col 28  Tbl  18 cols 001000010001110111110010110011100011111111 has  32 unique lines.
 *  30  28      31  31  30  32      31  31  29   x          28                      30  28      31          32  31              31  31  31                                  kill col 40  Tbl  17 cols 011000010001110111110010110011100011111111 has  28 unique lines.
 *  25          27  27  26  28      25  27  26   x          23                      26  25      27          28  27              27  27  27                                  kill col 27  Tbl  16 cols 011000010001111111110010110011100011111111 has  23 unique lines.
 *  21          22  22  21  23      21  22  21   x                                  21  20      22          23  22              22  22  22                                  kill col 20  Tbl  15 cols 011000010001111111110110110011100011111111 has  20 unique lines.
 *  18          19  19  18  20      18  19  19   x                                  19          19          20  19              19  19  19                                  kill col 41  Tbl  14 cols 111000010001111111110110110011100011111111 has  18 unique lines.
 *              17  17  16  18      16  17  17   x                                  17          17          18  17              17  17  17                                  kill col 36  Tbl  13 cols 111001010001111111110110110011100011111111 has  16 unique lines.
Possible good candidates for removal, columns : 14 33 
 *
 * Round 1: 000110101110000000001001001100011100000000  4 columns for indexes to table representing 13 original columns (uses 16 of 16 lines in indirect table).
 * Direct:  111001010000111111110110110011100011111111 28 columns
 * Success. Use 2 EBRs, 13 LUTs.
 */

module m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    * inx         next     indirect index 0
    * || ucode    ucode    | direct representation
    * 00 LB_0     LB_1     0 0110000001101011110000000001| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 0010000001011111100111010010|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 0011000001101111110010111110| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 _L0x03   StdIncPc 0 00100000000101x10xxx11100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 0 0000001000010111010011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   0 00100000000101x01xxx00000100| AUIPC  q = imm20 (copy x/2)
    * 06 LB_3     LB_4     0 0010000000110111101000000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     0 0010000000101111101100001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     0 0000010001110011110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     0 0010000000101111100010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     0 0000010001110011110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    3 0000011000010111001110000110|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   0 0010000001110111100100000100| ADD    add     Addition Q = RS1
    * 0d _L0x0d   StdIncPc 0 0000001000010111011011100110| LUI    q = imm20
    * 0e SUB_0    SUB_1    0 00100000011101x10xxx00010000| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 0 0000001000010111011011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     0 0010000001111111100010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   0 0010000001110111100000011010|        RS1^0xffffffff to Q
    * 12 LASTINCH          4 xxxxxxxxxxxxxxxxxxxxxxxxxxxx|        not in use 
    * 13 condb_2  condb_3  0 0010000001111111100000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  5 0010000000010111110000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  6 0010000001100111100100010110|        Branch on condition
    * 16 condb_5  Fetch    7 0100010101101100111011011110|        Branch not taken.
    * 17 condb_5t BrOpFet  3 0100010101101111110001110100|        Branch taken.
    * 18 BEQ      condb_2  0 0000011001110111011000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   0 0000010001010111010001000001| JALR   jj=RS1+imm
    * 1a ANDI_1   StdIncPc 0 0000001000010111001111100110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    3 0010000000010110111000110010| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 2 0010000001011110111010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 0 0000001000010111011111100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 5 0010000001010101110011010100|        Q = 4
    * 1f IJ_2     IJ_3     0 0000011001010111011010110111|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     2 0100011001101011110001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 0 0000001000010111000011100110|        rd = Iimm ^ RS1
    * 22 MULHU_6  ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * 23 _L0x23   StdIncPc 0 00100000000101x10xxx11100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   4 0010000001111010x11000110101| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   0 00100000000101x01xxx00000100| AUIPC  q = imm20 (copy x/2)
    * 26 OR_1     OR_2     0 0000010001110111000000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    0 0010000000000111110000011101|        Q = rs2
    * 28 _L0x28   SH_1     2 0000010001110011110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   0 0010000001110111100000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     2 0000010001110011110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  5 001000000xxxx111010000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    0 00100000011101x0xxxx00111110| SLL    Shift left
    * 2d _L0x2d   StdIncPc 0 0000001000010111011011100110| LUI    q = imm20
    * 2e _LMULHU_1 ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * 2f _L0x2f   StdIncPc 0 0000001000010111011011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 8 0000001000010111011011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  0 0010000001111111100000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    0 0000011000010111010010000110|        Target adr to yy
    * 33 JAERR_1  JAERR_2  0 0000011110010110x10010000001|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    9 0100010101101110100111011110|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   4 0000001001011111100100110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   4 0000101001011111110100000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  6 000001101xxxx111000111010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  0 0000011001110111011000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * 3a SRxI_1   SRxI_2   a 0000001001010111100100111101|        Register to shift to Q
    * 3b _L0x3b   JAL_1    3 0010000000010110111000110010| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  0 0000011000110111011001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   a 0000101001010111100100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   4 0010000001111010x00100110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   4 0010000001111010x00100111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     3 0110000001101111110001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   5 0010000000000111110000001011|        Q=1
    * 42 MULHU_2  ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * 43 MULHU_4  ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * 44 SLTI_0   SLTIX_1  0 0010000001111111101000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    5 0010000001010111110001100101|        More check offset
    * 46 ILL_1    ILL_2    0 0000011011010110x00101000111|        Store PC to mepc
    * 47 ILL_2    ILL_3    0 0000011111010111000110001111|        Store 0 to mtval
    * 48 _L0x48   SW_1     3 1110000001110111110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  5 0010000000000111110001001011|        Construct PC storage adr
    * 4a _L0x4a   SW_1     3 1110000001110111110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  b 0000000111010110100110110000|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   0 00100000011101x10xxx00110001| SLT    Set less than (signed)
    * 4d MULHSU_0 ILLe     0 001000000xxxx1x0xxxx11111110| Math entry point not used
    * 4e eILL0b   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * 4f MRET_8   StdIncPc 5 0010000001010111110011100110|        Prep +4
    * 50 LW_1     StdIncPc c 0000001001011111000111100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   0 0000011111010110111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 0010000001011111100101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   0 0000011111010110111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     a 0010100001010111100111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 0 0000011111010111011000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     0 0010000001000111101101010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     0 0010000001000111100010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * 59 DIV_B    ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * 5a SB_1     SB_2     4 0000011001011111100101011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    3 0010000000010110111000110010| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRW_1  0 0000011000110111011001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     4 0000111001011111110111111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 0010000001011111100101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   0 0000011111010110111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 MULHU_3  ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * 61 EBRKWFI2 EBREAK_1 6 0000010000110111001011110111| EBREAK/WFI2 Select EBREAK or WFI
    * 62 DIV_8    ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * 63 DIV_9    ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * 64 SLTIU_0  SLTIX_1  0 0010000001111111101000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    6 00100000000101x10xxx11101111|        Prepare read PC
    * 66 SW_1     SW_2     0 0000000111110110100111110010|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    0 0000011110010110x11010010011|        Store faulting address alignment to mtval
    * 68 DIV_12   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * 69 _LDIV_13 ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * 6a MULH_1   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * 6b SB_4     SB_5     0 1110000101100111100101111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   0 00100000011101x10xxx00110001| SLTU   Set less than (unsigned)
    * 6d MULHU_0  ILLe     0 001000000xxxx1x0xxxx11111110| Math entry point not used
    * 6e _LDIV_C  ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * 6f MRET_6   MRET_7   5 001000000xxxx111110011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    a 0010100001010111100110111010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 0 0000011111010111011000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   0 0010000000110111101000011010|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  0 0000011111100111000101110110|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   d 0010000001011111000111110100| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  0 00100000000101x0xxxx01110011|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  0 0010000000010111100001110111|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  5 0000011011010110x10001111101|        origPC to mepc. Prep read 0
    * 78 DIV_4    ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * 79 DIV_5    ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * 7a SB_5     SW_2     0 0000000101100110100111110010|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    3 0010000000010110111000110010| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRW_1  0 0000011000110111011001001001| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  JAL_3    b 0001011101001110x00100110100|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    0 000001101xxxx111000110010000|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  0 0000011111010110x00101111101|        mtval is target
    * 80 LBU_0    LBU_1    0 0110000001101011110010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  0 0000011011010110x00101111101|        Store PC to mepc
    * 82 DIV_1    ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * 83 DIV_2    ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * 84 XORI_0   XORI_1   0 0010000001111111101000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 0010000001011111100111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_3    5 0000001001100100x10000110100|        Return address to TRG
    * 87 JALRE1   JALRE2   0 0000011011100110x00101111111|  err   Store pc to mepc
    * 88 DIV_E    ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * 89 _LDIV_F  ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * 8a DIVU_5   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * 8b LB_6     StdIncPc 5 0000001000010111010011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    0 00100000011111x10xxx00101001| XOR    xor
    * 8d DIV_0    ILLe     0 001000000xxxx1x0xxxx11111110| Math entry point not used
    * 8e _LCSRRS_1 ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * 8f ILL_3    ILL_4    5 0010000001010111110010101001|        Q = 1
    * 90 NMI_2    JAL_3    b 0001011110100111011000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   e 0001011100010100x10010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    0 0000011011001110x00100110100|        PC to mepc
    * 93 SW_E2    SW_E3    0 0000011011011111000110010101|        Store address that faulted
    * 94 SW_E4    JAL_3    b 0001011101001110x10100110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    5 0010000001011101110010010100|        Q = 3
    * 96 SH_1     SH_2     4 0000011001011111100110111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    0 0000011110010110x11010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  0 0000011001110111011000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (at illegal entrypt)
    * 9a ECALL_6  JAL_3    b 0001011101001100x10000110100|        mcause = 11
    * 9b ILL_5             4 xxxxxxxxxxxxxxxxxxxxxxxxxxxx|        Not in use
    * 9c DIV_10   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * 9d _LDIV_11 ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * 9e SH_4     SH_5     0 1110000011100111100110011111|        Address back to Q. Prepare get item to write
    * 9f SH_5     SW_2     0 0000000011100110100111110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    2 0100011001101011110001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  5 0010000001010101110010110110|        Q = 4
    * a2 DIV_14   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * a3 _LDIV_15 ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * a4 SRxI_0   SRxI_1   4 0010000001111010x11000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   5 0010000000110111110010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  3 0010000001011110111011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 0 001000000xxxx111110001100001| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * a9 ILL_4    JAL_3    e 0001011101001110x10000110100|        Store 2 to mcause
    * aa DIV_6    ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * ab EBREAK_2 ECALL_6  0 0000011011010111000110011010|        pc to mepc
    * ac _L0xac   SRx_1    0 00100000011101x0xxxx00111111| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   ILLe     0 001000000xxxx1x0xxxx11111110| Math entry point not used
    * ae _L0xae   SRx_1    0 00100000011101x0xxxx00111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   5 001000000xxxx111110011000101|        0x202 + 0xff + 1 = 0x302
    * b0 CSRRW_3  CSRRW_4  5 0010000001010101110010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b1 aF_SW_3  LDAF_3   b 0001011100010100x10010010010|        Store 7 to mcause
    * b2 CSRRW_4  Fetch    7 0100010101101100110011011110|        IncPC, OpFetch, but force +4
    * b3 CSRRWI_1          4 xxxxxxxxxxxxxxxxxxxxxxxxxxxx|        Not in use
    * b4 eFetch3           5 0000010011111111110000000000|  Fr11  Write minstret. Update I. Q=immediate, use dinx
    * b5 SH_3     SH_4     0 0010000000000111011010011110|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  5 0010000001010101110010011010|        Q = 8
    * b7 IJ_3     IJ_4     0 0010000001100101110010111101|        Construct Q = 3
    * b8 BGE      condb_2  0 0000011001110111011000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * ba LHU_3    ANDI_1   0 0010000000111111101000011010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     4 0000111001011111110110110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  0 0000011000110111011001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    9 0100010101101110101111011110|        Mask and use as PC
    * be IJ_1     IJ_2     9 0010000001011111100100011111|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    9 0010000001011111100111000001|        Exit CSR, enter trap
    * c0 DIV_D    ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * c1 IJT_2    IJT_3    0 0000011001010111011011101001|        Read word is to be masked with ~3u
    * c2 DIVU_3   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * c3 DIVU_4   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * c4 ORI_0    ORI_1    0 0000010001111111001011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   0 0010000000000111101001101111|        ~302
    * c6 IJT_4    ILL_2    0 0100011011101111101101000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   0 000001101xxxx111000111001011|        Store pc to mepc.
    * c8 DIV_7    ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * c9 MRET_2   MRET_3   0 0010000000110101110010100101|        0xff+3 = 0x102
    * ca DIVU_2   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * cb QINT_2   StdIncPc b 0001011110100111011011100110|        mtval = 0.
    * cc OR_0     OR_1     0 00100000011111x10xxx00100110| OR     or
    * cd REM_0    ILLe     0 001000000xxxx1x0xxxx11111110| Math entry point not used
    * ce _LCSRRCI_1 ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * cf MRET_7   MRET_8   6 00100000001101x10xxx01001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  5 0010000000010111110000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   0 0000010000110111011011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     a 0010100001010111100100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 0 0000011111010111011000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   e 0001011100010110x10010010010|        Store 5 to mcause
    * d5 eFetch2           4 xxxxxxxxxxxxxxxxxxxxxxxxxxxx|  Fr11  Not in use
    * d6 eILL0c   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  0 0000011111010111011010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  0 0000011001110111011000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * da LDAF_a   LDAF_2   0 00100000010101x10xxx10010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   5 0000011100010110x10010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  0 0000011000110111011001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  0 0000011111010111011011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   d 0000010001011111011011110100|  Fr11  Read and latch instruction
    * df eFetch   Fetch2   d 0000010001011111011011110100|  Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * e1 ORI_1    ORI_2    0 0010000000000111100100011101|        Q = RS1
    * e2 MUL_1    ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * e3 MUL_3    ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * e4 ANDI_0   ANDI_1   0 0010000001111111101000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  5 0010000001010101110010110001|        Q = 4
    * e6 StdIncPc Fetch    7 0100010101101100110011011110|  Fr11  IncPC, OpFetch
    * e7 aFault   aFault_1 0 0000011111010111011000011110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * e9 IJT_3    IJT_4    0 0010000001100101110011000110|        Construct Q = 3
    * ea _LMULHU_5 ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * eb LH_3     LH_4     0 0010000000111111101001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    0 00100000011111x10xxx00010001| AND    And 
    * ed REMU_0   ILLe     0 001000000xxxx1x0xxxx11111110| Math entry point not used
    * ee eILL0a   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen
    * ef WFI_5    Fetch    7 0100010101101100110011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    a 0010100001010111100101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 0 0000011111010111011000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 0 00100000000101x10xxx11100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  0 001000000xxxx1x01xxx11011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   eFetch3  f 0000010110001111010010110100|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 0 0000011111010111011011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    5 0010000000000101110011111010| WFI    To check offset
    * f7 EBREAK_1 EBREAK_2 0 0000011110010111011010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  0 0000011001110111011000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   ILLe     0 001000000xxxx1x0xxxx11111110| Illegal instruction seen (math)
    * fa WFI_2    WFI_3    5 0010000001010111110001000101|        Check offset
    * fb SB_3     SB_4     0 0010000000000111011001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  0 0000011000110111011001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    0 00100000000101x10xxx01111110| NMI    Get current PC
    * fe ILLe     ILL_1    0 00100000000101x0xxxx01000110| Illegal
    * ff QINT_0   QINT_1   0 00100000000101x10xxx11000111| INT    Get current PC
    */
   localparam u0_0 = 256'h76e6501076e6790473863c5af88b3c5afb097a07480474e650e6fcbef9d2bc01;
   localparam u0_1 = 256'h76b75cd477e6eea66e3273e674417613fc74cede79167c15f8140000781af88b;
   localparam u0_2 = 256'h76e640fe76e6403e74303c9678213c967c1d70274804a63550e640fe70e6bc52;
   localparam u0_3 = 256'ha13aa135790376496e32793d40fe761371d7fd03f936e9de64817486f82b76e6;
   localparam u0_4 = 256'h7ce640fe40fe503169b07c667c4b7c66718f61477c65fa2b40fe40fe7c0bfc50;
   localparam u0_5 = 256'h6edaf970fdfb76496e32f95d40fe40fe788b7b57761e79eb6edaf9546edaf1e6;
   localparam u0_6 = 256'h7ccf40fe40fe5031797a40fe40fe40fe669369f250effa2b40fe40fe72f740fe;
   localparam u0_7 = 256'h617d7190e13476496e3269f240fe40fe647d78774073f1f471767a1a761e79ba;
   localparam u0_8 = 256'h7ca940fe40fed02974e640fe40fe40fe617f4434f9f0fa2140fe40fe617dbc85;
   localparam u0_9 = 256'h69f2799f40fe40fe0000c43440fe76136693f9bbdc94e534f195e13444927634;
   localparam u0_A = 256'h7cc5403f40fe403f719a40fee43440fe7c61eed07cafa63a40fe40fe5cb6bc5e;
   localparam u0_B = 256'hf9c1f91febde7649fdb5fa1a40fe76135cbd5c9a769efc000000ccde44925cb2;
   localparam u0_C = 256'h504f40fe40fed02676e640fe5ca540fe71cbfb477a6ff2e140fe40fe76e940fe;
   localparam u0_D = 256'hf6f4f6f476e576496492509140fe761376a140fe00006492761e790676c97c37;
   localparam u0_E = 256'hccde40fe40fed011fa5640fe5cc640fe761eccde5cb1fa1a40fe40fe791d40fe;
   localparam u0_F = 256'h50c74046507e7649766b7c4540fe761376ab5cfa76dbf4b448dd50e6761e7972;
   localparam u1_0 = 256'h0021020700210207306100470202004702020203020100210201230612050606;
   localparam u1_1 = 256'h0065520500212205320100210045006734567456620652010207400002070207;
   localparam u1_2 = 256'h0021020000210207520020470207204702000047020142070201020000212466;
   localparam u1_3 = 256'h42074207a0a500633201a02502000067606840a5402594560079006102078021;
   localparam u1_4 = 256'h5205020002000207b01d3e0752003e07007d006d520502070200020052003606;
   localparam u1_5 = 256'h007d120540e50063320140650200020002040204007da285007d1205007dc025;
   localparam u1_6 = 256'h52000200020002070e160200020002000079001f620102070200020060430200;
   localparam u1_7 = 256'h007d0068b17400633201001602000200506d02010201d205007e0203007da285;
   localparam u1_8 = 256'h52050200020002075021020002000200006e50261205020702000200006d0606;
   localparam u1_9 = 256'h000e0e0e020002004000b17402000067007940655205b174006d006ce171b17a;
   localparam u1_A = 256'h5200020702000207006d0200e174020002003205520342070200020052052466;
   localparam u1_B = 256'h920592059456006340e5020302000067020652050200504f40007456b1715205;
   localparam u1_C = 256'h6203020002000207b17a0200020302000068046e020000470200020000650200;
   localparam u1_D = 256'hd045d045007d00635071020502000067007d02004000e171007da28500435201;
   localparam u1_E = 256'h74560200020002070203020002060200007d7456520502070200020002000200;
   localparam u1_F = 256'h0201020102010063020052050200006700795200007df05802000201007da285;
   wire [31:0]   indir;
`ifdef verilator
   /* verilator lint_off UNUSED */
   wire [15:0]   sim_a;
   wire [15:0]   sim_b;
   /* verilator lint_on UNUSED */
`endif
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u0_0), .INIT_1(u0_1), .INIT_2(u0_2), .INIT_3(u0_3),
                   .INIT_4(u0_4), .INIT_5(u0_5), .INIT_6(u0_6), .INIT_7(u0_7),
                   .INIT_8(u0_8), .INIT_9(u0_9), .INIT_A(u0_A), .INIT_B(u0_B),
                   .INIT_C(u0_C), .INIT_D(u0_D), .INIT_E(u0_E), .INIT_F(u0_F)
                   ) ucode0
     (
      .RDATA( indir[15:0]         ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );
   
   SB_RAM40_4K # ( .READ_MODE(0), .WRITE_MODE(0),
                   .INIT_0(u1_0), .INIT_1(u1_1), .INIT_2(u1_2), .INIT_3(u1_3),
                   .INIT_4(u1_4), .INIT_5(u1_5), .INIT_6(u1_6), .INIT_7(u1_7),
                   .INIT_8(u1_8), .INIT_9(u1_9), .INIT_A(u1_A), .INIT_B(u1_B),
                   .INIT_C(u1_C), .INIT_D(u1_D), .INIT_E(u1_E), .INIT_F(u1_F)
                   ) ucode1
     (
      .RDATA( indir[31:16]        ),
      .RADDR( {3'h0,minx}         ),
      .RCLK(  clk                 ),
      .RCLKE( 1'b1                ),
      .RE(    progress_ucode      ),
      .WADDR( 11'h0               ),
      .WCLK(  1'b0                ),
      .WCLKE( 1'b0                ),
      .WDATA( 16'h0               ),
      .WE(    1'b0                ),
      .MASK(  16'h0               )
      );

   assign d[0] = indir[0];
   assign d[1] = indir[1];
   assign d[2] = indir[2];
   assign d[3] = indir[3];
   assign d[4] = indir[4];
   assign d[5] = indir[5];
   assign d[6] = indir[6];
   assign d[7] = indir[7];
   assign d[11] = indir[8];
   assign d[12] = indir[9];
   assign d[13] = indir[10];
   assign d[16] = indir[11];
   assign d[17] = indir[12];
   assign d[19] = indir[13];
   assign d[20] = indir[14];
   assign d[22] = indir[15];
   assign d[23] = indir[16];
   assign d[24] = indir[17];
   assign d[25] = indir[18];
   assign d[26] = indir[19];
   assign d[27] = indir[20];
   assign d[28] = indir[21];
   assign d[29] = indir[22];
   assign d[34] = indir[23];
   assign d[36] = indir[24];
   assign d[39] = indir[25];
   assign d[40] = indir[26];
   assign d[41] = indir[27];
   // replaces = 000110101110000000001001001100011100000000
   SB_LUT4 #(.LUT_INIT(16'h0402)) cmb_d08(.O(d[8]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h41a0)) cmb_d09(.O(d[9]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h40a0)) cmb_d10(.O(d[10]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0040)) cmb_d14(.O(d[14]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2000)) cmb_d15(.O(d[15]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h8000)) cmb_d18(.O(d[18]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'hfbef)) cmb_d21(.O(d[21]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h000c)) cmb_d31(.O(d[31]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0008)) cmb_d32(.O(d[32]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h3282)) cmb_d33(.O(d[33]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2002)) cmb_d35(.O(d[35]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4800)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h3000)) cmb_d38(.O(d[38]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[42] = 1'b0;
   assign d[43] = 1'b0;
   assign d[44] = 1'b0;
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
wire instrxxxx0100,insgtr1011xxxx,instr10110100;          bn_l4v #(.I(16'h0010)) leq0100(     .o(instrxxxx0100),     .i({minx[3:0]}));  bn_l4v #(.I(16'h0800)) leq1011(     .o(instr1011xxxx),     .i({minx[7:4]}));  bn_l4v #(.I(16'h8888)) leq1x110100( .o(instr10110100), .i({2'b0,instr1011xxxx,instrxxxx0100}));  SB_DFFE reg_d18( .Q(d[30]), .C(clk), .E(progress_ucode), .D(instr10110100));
endmodule
