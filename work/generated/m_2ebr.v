/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   No RVC
 *   No MULDIV
 *   minstret not implemented
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 42 columns
 * Removed:  000000000001000000000001000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 42
 * 169 distinct lines in remaining untreated columns
 * c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 169 169 169 169 169 169 169 169 169 169 169   x 169 169 167 169 168 169 169 168 169 169 168   x 169 169 169 169 166 166 168 169 168 169 168 169 168 169 169 168 168 168  kill col 13  Tbl  39 cols 000000000001000000000001000010000000000000 has 166 unique lines.
 * 166 166 166 166 166 166 166 166 166 166 166   x 166 166 164 166 165 166 166 165 166 166 165   x 166 166 166 166     163 164 166 165 166 165 166 165 166 166 165 165 165  kill col 12  Tbl  38 cols 000000000001000000000001000011000000000000 has 163 unique lines.
 * 163 163 163 163 163 163 163 163 163 163 163   x 163 163 161 163 161 163 163 160 163 163 162   x 163 163 163 163         159 162 162 163 162 163 162 163 163 162 162 162  kill col 11  Tbl  37 cols 000000000001000000000001000011100000000000 has 159 unique lines.
 * 159 159 159 159 159 159 159 159 159 159 159   x 159 159 157 159 157 159 159 156 159 159 157   x 159 159 159 159             158 158 159 158 159 158 159 159 158 158 158  kill col 22  Tbl  36 cols 000000000001000000010001000011100000000000 has 156 unique lines.
 * 156 156 156 156 156 156 156 156 156 156 156   x 156 156 154 156 155 156 156     156 156 154   x 156 156 156 156             155 155 155 155 155 154 155 156 155 155 154  kill col 27  Tbl  35 cols 000000000001001000010001000011100000000000 has 154 unique lines.
 * 154 154 154 154 154 154 154 154 154 154 154   x 154 154     153 153 154 153     154 154 152   x 154 154 154 154             153 153 153 153 153 152 153 154 153 153 152  kill col 19  Tbl  34 cols 000000000001001000010011000011100000000000 has 152 unique lines.
 * 152 152 152 152 152 152 152 152 152 152 152   x 152 152     151 151 152 151     152 152       x 152 152 152 152             151 151 151 151 151 150 151 152 151 151 150  kill col  5  Tbl  33 cols 000000000001001000010011000011100000100000 has 150 unique lines.
 * 150 150 150 150 150 150 150 150 150 150 150   x 150 150     149 149 150 149     150 150       x 150 150 150 150             149 149 149 148 149     149 149 147 146 147  kill col  1  Tbl  32 cols 000000000001001000010011000011100000100010 has 146 unique lines.
 * 146 146 146 146 146 146 146 146 146 146 146   x 146 146     144 145 146 145     146 146       x 146 144 146 146             145 145 145 142 145     143 143 144     143  kill col  7  Tbl  31 cols 000000000001001000010011000011100010100010 has 142 unique lines.
 * 142 142 142 142 142 142 142 142 142 142 142   x 142 141     140 141 140 141     142 142       x 140 139 142 142             141 141 141     141     139 138 138     138  kill col  3  Tbl  30 cols 000000000001001000010011000011100010101010 has 138 unique lines.
 * 138 138 138 138 138 138 138 138 138 138 138   x 138 137     136 135 136 137     138 138       x 135 133 138 137             137 137 137     135     131     130     133  kill col  2  Tbl  29 cols 000000000001001000010011000011100010101110 has 130 unique lines.
 * 130 130 130 130 130 130 130 128 130 130 130   x 130 129     127 125 127 126     130 130       x 124 124 130 129             129 129 129     121     120             122  kill col  4  Tbl  28 cols 000000000001001000010011000011100010111110 has 120 unique lines.
 * 120 120 120 120 120 120 120 117 120 120 120   x 119 118     117 111 114 113     120 120       x 113 114 120 117             119 119 119     105                     108  kill col  6  Tbl  27 cols 000000000001001000010011000011100011111110 has 105 unique lines.
 * 105 105 105 105 105 105 105 103 105 104 104   x 103 103     103  94  98  96     105 105       x  97  98 105 102             104 104 104                              92  kill col  0  Tbl  26 cols 000000000001001000010011000011100011111111 has  92 unique lines.
 *  92  92  92  92  92  92  92  89  92  91  91   x  89  90      88  81  83  82      92  92       x  82  84  92  89              91  91  90                                  kill col 25  Tbl  25 cols 000000000001001010010011000011100011111111 has  81 unique lines.
 *  81  81  81  81  81  81  81  78  80  80  79   x  78  80      78      71  69      81  81       x  71  73  81  77              80  80  79                                  kill col 23  Tbl  24 cols 000000000001001010110011000011100011111111 has  69 unique lines.
 *  68  69  69  69  69  69  69  66  68  68  67   x  65  68      64      61          69  69       x  61  62  69  65              68  68  67                                  kill col 24  Tbl  23 cols 000000000001001011110011000011100011111111 has  61 unique lines.
 *  60  61  59  61  60  61  61  58  60  60  59   x  57  59      57                  61  61       x  55  55  60  58              60  60  59                                  kill col 17  Tbl  22 cols 000000000001001011110011100011100011111111 has  55 unique lines.
 *  54  53  53  55  54  55  55  52  54  54  53   x  50  53      50                  55  55       x      51  54  52              54  54  53                                  kill col 29  Tbl  21 cols 000000000001101011110011100011100011111111 has  50 unique lines.
 *  49  48  43  50  49  50  50  48  49  49  48   x      48      45                  50  49       x      45  49  46              49  49  48                                  kill col 39  Tbl  20 cols 001000000001101011110011100011100011111111 has  43 unique lines.
 *  42  40      43  42  43  43  41  42  42  41   x      39      38                  43  41       x      39  42  40              42  42  41                                  kill col 26  Tbl  19 cols 001000000001101111110011100011100011111111 has  38 unique lines.
 *  37  35      38  37  38  38  36  37  37  36   x      33                          37  36       x      34  37  35              37  37  36                                  kill col 28  Tbl  18 cols 001000000001111111110011100011100011111111 has  33 unique lines.
 *  32  29      33  32  33  33  31  32  32  30   x                                  32  31       x      29  32  31              32  32  31                                  kill col 40  Tbl  17 cols 011000000001111111110011100011100011111111 has  29 unique lines.
 *  27          29  28  28  29  27  27  28  27   x                                  28  27       x      25  28  27              28  28  27                                  kill col 16  Tbl  16 cols 011000000001111111110011110011100011111111 has  25 unique lines.
 *  23          24  24  23  25  23  23  24  23   x                                  23  22       x          24  24              24  24  23                                  kill col 20  Tbl  15 cols 011000000001111111110111110011100011111111 has  22 unique lines.
 *  20          21  21  20  22  20  20  21  21   x                                  21           x          21  21              21  21  20                                  kill col 41  Tbl  14 cols 111000000001111111110111110011100011111111 has  20 unique lines.
 *              19  19  18  20  18  18  19  19   x                                  19           x          19  19              19  19  18                                  kill col 36  Tbl  13 cols 111001000001111111110111110011100011111111 has  18 unique lines.
 *              17  16      18  16  16  17  17   x                                  17           x          17  17              17  17  16                                  kill col 37  Tbl  12 cols 111011000001111111110111110011100011111111 has  16 unique lines.
Possible good candidates for removal, columns : 8 33 34 
 *
 * Round 1: 000100111110000000001000001100011100000000  4 columns for indexes to table representing 12 original columns (uses 16 of 16 lines in indirect table).
 * Direct:  111011000000111111110110110011100011111111 28 columns
 * Success. Use 2 EBRs, 12 LUTs.
 */

module v0_m_2ebr
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
    * 00 LB_0     LB_1     0 0000011000000110101111000000| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 0001001000000101111110011101|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 0010011010000110111111001011| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 _L0x03   StdIncPc 0 000000100000000101x10xxx1110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 0 0000000000100001011101001110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   0 000000100000000101x01xxx0000| AUIPC  q = imm20 (copy x/2)
    * 06 LB_3     LB_4     0 0000001000000011011110100000|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     0 0000001000000010111110110000|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     0 0000000001000111001111000101| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     0 0000001000000010111110001000|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     0 0000000001000111001111000101| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    3 0011000001100001011100111000|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   0 0000001000000111011110010000| ADD    add     Addition Q = RS1
    * 0d _L0x0d   StdIncPc 0 0000000000100001011101101110| LUI    q = imm20
    * 0e SUB_0    SUB_1    0 000000100000011101x10xxx0001| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 0 0000000000100001011101101110| LUI    q = imm20
    * 10 SUB_1    LB_6     0 0000001000000111111110001000|        Q = ~RS2
    * 11 AND_1    ANDI_1   0 0000001000000111011110000001|        RS1^0xffffffff to Q
    * 12 _L0x12   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 13 condb_2  condb_3  0 0000001000000111111110000001|        ~RS2 in Q
    * 14 condb_3  condb_4  4 0100001000000001011111000001|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  5 0101000001000110011110010001|        Branch on condition
    * 16 condb_5  Fetch    6 0110010001010110110011101101|        Branch not taken.
    * 17 condb_5t BrOpFet  3 0011010001010110111111000111|        Branch taken.
    * 18 BEQ      condb_2  0 0000000001100111011101100001| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   0 0000000001100101011101000100| JALR   yy=RS1+imm
    * 1a ANDI_1   StdIncPc 0 0000000000100001011100111110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    3 0011001000000001011011100011| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 2 0010001000000101111011101010| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 0 0000000000100001011101111110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 4 0100001000000101010111001101|        Q = 4
    * 1f IJ_2     IJ_3     0 0000000001100101011101101011|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     2 0010010001100110101111000101| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 0 0000000000100001011100001110|        rd = Iimm ^ RS1
    * 22 _L0x22   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 23 _L0x23   StdIncPc 0 000000100000000101x10xxx1110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   7 01110010000001111010x1100011| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   0 000000100000000101x01xxx0000| AUIPC  q = imm20 (copy x/2)
    * 26 OR_1     OR_2     0 0000000001000111011100000010|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    0 0000001000000000011111000001|        Q = rs2
    * 28 _L0x28   SH_1     2 0010000001000111001111001001| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   0 0000001000000111011110000010|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     2 0010000001000111001111001001| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  4 0100001000000xxxx11101000011|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    0 000000100000011101x0xxxx0011| SLL    Shift left
    * 2d _L0x2d   StdIncPc 0 0000000000100001011101101110| LUI    q = imm20
    * 2e unx2e             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| 2e: Not in use 
    * 2f _L0x2f   StdIncPc 0 0000000000100001011101101110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 8 1000000000100001011101101110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  0 0000001000000111111110000010|        ~rs2 to Q
    * 32 JAL_1    JAL_2    0 0000000001100001011101001000|        Target adr to yy
    * 33 JAERR_1  JAERR_2  0 00000000011110010110x1001000|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    9 1001010001010110111010011101|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   7 0111000000100101111110010011|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   a 1010000000100101111111010000|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  5 0101000001101xxxx11100011101|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  0 0000000001100111011101100001| BNE    Conditional Branch. Offset to Ryy
    * 39 _L0x39   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 3a SRxI_1   SRxI_2   b 1011000000100101011110010011|        Register to shift to Q
    * 3b _L0x3b   JAL_1    3 0011001000000001011011100011| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  0 0000000001100011011101100100| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   c 1100000000100101011110010000|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   7 01110010000001111010x0010011|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   7 01110010000001111010x0010011|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     3 0011011000000110111111000101| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   4 0100001000000110011111000000|        Q=1
    * 42 _L0x42   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 43 _L0x43   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 44 SLTI_0   SLTIX_1  0 0000001000000111111110100010| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    4 0100001000000101011111000110|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    0 00000000011011010110x0010100|        Store PC to mepc
    * 47 ILL_2    ILL_3    0 0000000001111101011100011000|        Store 0 to mtval
    * 48 _L0x48   SW_1     3 0011111000000111011111000110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  4 0100001000000001011111000100|        Construct PC storage adr
    * 4a _L0x4a   SW_1     3 0011111000000111011111000110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  0 0000000100011101011010011011|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   0 000000100000011101x10xxx0011| SLT    Set less than (signed)
    * 4d unx4d             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| 4d: Not in use 
    * 4e eILL0b   ILLe     0 0000001000000xxxx1x0xxxx1111| Illegal instruction seen
    * 4f MRET_8   StdIncPc 4 0100001000000101011111001110|        Prep +4
    * 50 LW_1     StdIncPc d 1101000000100101111100011110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   0 0000000001111101011011101101|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 0001001000000101111110010101|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   0 0000000001111101011011101101|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     c 1100001000000101011110011110|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 0 0000000001111101011101100001|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     0 0000001000000100011110110101|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     0 0000001000000100011110001000|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 _L0x58   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 59 _L0x59   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 5a SB_1     SB_2     7 0111000001100101111110010101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    3 0011001000000001011011100011| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRW_1  0 0000000001100011011101100100| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     a 1010000001100101111111011111|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 0001001000000101111110010111|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   0 0000000001111101011011101101|  err   LD AlignFault. Faulting adr to mtval
    * 60 _L0x60   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 61 EBRKWFI2 EBREAK_1 5 0101000001000011011100101111| EBREAK/WFI2 Select EBREAK or WFI
    * 62 _L0x62   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 63 _L0x63   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 64 SLTIU_0  SLTIX_1  0 0000001000000111111110100010| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    5 010100100000000101x10xxx1110|        Prepare read PC
    * 66 SW_1     SW_2     0 0000000000011111011010011111|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    0 00000000011110010110x1101001|        Store faulting address alignment to mtval
    * 68 _L0x68   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 69 unx69             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| 69: Not in use 
    * 6a _L0x6a   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 6b SB_4     SB_5     0 0000111000010110011110010111|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   0 000000100000011101x10xxx0011| SLTU   Set less than (unsigned)
    * 6d unx6d             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| 6d: Not in use 
    * 6e unx6e             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| 6e: Not in use 
    * 6f MRET_6   MRET_7   4 0100001000000xxxx11111001100|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    c 1100001000000101011110011011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 0 0000000001111101011101100001|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   0 0000001000000011011110100001|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  0 0000000001111110011100010111|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   e 1110001000000101111101101111| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  0 000000100000000101x0xxxx0111|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  0 0000001000000001011110000111|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  4 01000000011011010110x1000111|        origPC to mepc. Prep read 0
    * 78 _L0x78   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 79 _L0x79   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 7a SB_5     SW_2     0 0000000000010110011010011111|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    3 0011001000000001011011100011| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRW_1  0 0000000001100011011101100100| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  JAL_3    0 00000001111101001110x0010011|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    0 0000000001101xxxx11100011001|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  0 00000000011111010110x0010111|        mtval is target
    * 80 LBU_0    LBU_1    0 0000011000000110101111001000| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  0 00000000011011010110x0010111|        Store PC to mepc
    * 82 _L0x82   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 83 _L0x83   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 84 XORI_0   XORI_1   0 0000001000000111111110100010| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 0001001000000101111110011111|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   4 01000000001000010100x1001001|        Return address to TRG
    * 87 JALRE1   JALRE2   0 00000000011011100110x0010111|  err   Store pc to mepc
    * 88 _L0x88   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 89 unx89             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| 89: Not in use 
    * 8a _L0x8a   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 8b LB_6     StdIncPc 4 0100000000100001011101001110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    0 000000100000011111x10xxx0010| XOR    xor
    * 8d unx8d             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| 8d: Not in use 
    * 8e _LCSRRS_1 ILLe     0 0000001000000xxxx1x0xxxx1111| Illegal instruction seen
    * 8f ILL_3    ILL_4    4 0100001000000101011111001010|        Q = 1
    * 90 NMI_2    JAL_3    0 0000000111111010011101100011|        mtval = 0.
    * 91 LDAF_2   LDAF_3   4 01000001111100010100x1001001|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    0 00000000011011001110x0010011|        PC to mepc
    * 93 SW_E2    SW_E3    0 0000000001101101111100011001|        Store address that faulted
    * 94 SW_E4    JAL_3    0 00000001111101001110x1010011|        Store 6 to mcause
    * 95 SW_E3    SW_E4    4 0100001000000101110111001001|        Q = 3
    * 96 SH_1     SH_2     7 0111000001100101111110011011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    0 00000000011110010110x1101001|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  0 0000000001100111011101100001| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    0 00000001111101001100x1000011|        mcause = 11
    * 9b SH_4     SH_5     0 0000111000001110011110011001|        Address back to Q. Prepare get item to write
    * 9c _L0x9c   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 9d unx9d             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| 9d: Not in use 
    * 9e JAL_25   JAL_3    0 00000000010001100110x0010011|        Instr. adr. to jj in case of access error
    * 9f SH_5     SW_2     0 0000000000001110011010011111|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    2 0010010001100110101111000101| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  4 0100001000000101010111001011|        Q = 4
    * a2 _L0xa2   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * a3 _L0xa3   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * a4 SRxI_0   SRxI_1   7 01110010000001111010x1100011| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   4 0100001000000011011111001010|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  3 0011001000000101111011101101| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 0 0000001000000xxxx11111000110| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 _L0xa8   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * a9 ILL_4    JAL_3    4 01000001111101001110x1000011|        Store 2 to mcause
    * aa _L0xaa   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * ab EBREAK_2 ECALL_6  0 0000000001101101011100011001|        pc to mepc
    * ac _L0xac   SRx_1    0 000000100000011101x0xxxx0011| SRx    Shift Right (both SRL and SRA)
    * ad unxad             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| ad: Not in use 
    * ae _L0xae   SRx_1    0 000000100000011101x0xxxx0011| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   4 0100001000000xxxx11111001100|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   0 00000001111100010100x1001001|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  4 0100001000000101010111001011|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    6 0110010001000110110011001101|        IncPC, OpFetch, but force +4
    * b3 unxb3             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 i0reserv          7 0111xxxxxxxxxxxxxxxxxxxxxxxx| Not in use, reserved to allow LASTINCH
    * b5 SH_3     SH_4     0 0000001000000000011101101001|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  4 0100001000000101010111001001|        Q = 8
    * b7 IJ_3     IJ_4     0 0000001000000110010111001011|        Construct Q = 3
    * b8 BGE      condb_2  0 0000000001100111011101100001| BGE    Conditional Branch. Offset to Ryy
    * b9 _L0xb9   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * ba LHU_3    ANDI_1   0 0000001000000011111110100001|        Invert q. Prepare read mask
    * bb SH_2     SH_3     a 1010000001100101111111011011|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  0 0000000001100011011101100100| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    9 1001011000000110111010111101|        Mask and use as PC
    * be IJ_1     IJ_2     9 1001001000000101111110010001|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    9 1001001000000101111110011100|        Exit CSR, enter trap
    * c0 _L0xc0   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * c1 IJT_2    IJT_3    0 0000000001100101011101101110|        Read word is to be masked with ~3u
    * c2 _L0xc2   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * c3 _L0xc3   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * c4 ORI_0    ORI_1    0 0000000001000111111100101110| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   0 0000001000000000011110100110|        ~302
    * c6 IJT_4    ILL_2    0 0000000001101101011110110100|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   0 0000000001101xxxx11100011100|        Store pc to mepc.
    * c8 _L0xc8   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * c9 MRET_2   MRET_3   0 0000001000000011010111001010|        0xff+3 = 0x102
    * ca _L0xca   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * cb QINT_2   StdIncPc 0 0000000111111010011101101110|        mtval = 0.
    * cc OR_0     OR_1     0 000000100000011111x10xxx0010| OR     or
    * cd unxcd             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| cd: Not in use 
    * ce _LCSRRCI_1 ILLe     0 0000001000000xxxx1x0xxxx1111| Illegal instruction seen
    * cf MRET_7   MRET_8   5 010100100000001101x10xxx0100|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  4 0100001000000001011111000011| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   0 0000000001000011011101101100| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     c 1100001000000101011110010000|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 0 0000000001111101011101100001|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   4 01000001111100010110x1001001|        Store 5 to mcause
    * d5 unxd5             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| d5: Not in use
    * d6 eILL0c   ILLe     0 0000001000000xxxx1x0xxxx1111| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  0 0000000001111101011101101010|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  0 0000000001100111011101100001| BLTU   Conditional Branch. Offset to Ryy
    * d9 _L0xd9   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * da LDAF_a   LDAF_2   0 000000100000010101x10xxx1001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   4 01000000011100000110x1001001|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  0 0000000001100011011101100100| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  0 0000000001111101011101101110|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   f 1111000001010001111101101111|  Fr00  Read and latch instruction
    * df eFetch   Fetch2   e 1110000001010101111101101111|  Fr00  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 _L0xe0   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * e1 ORI_1    ORI_2    0 0000001000000000011110010001|        Q = RS1
    * e2 _L0xe2   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * e3 _L0xe3   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * e4 ANDI_0   ANDI_1   0 0000001000000111111110100001| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  4 0100001000000101010111001011|        Q = 4
    * e6 StdIncPc Fetch    6 0110010001000110110011001101|  Fr00  IncPC, OpFetch
    * e7 aFault   aFault_1 0 0000000001111101011101100001|  err   Load access fault. Faulting adr to mtval
    * e8 _L0xe8   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * e9 IJT_3    IJT_4    0 0000001000000110010111001100|        Construct Q = 3
    * ea _L0xea   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * eb LH_3     LH_4     0 0000001000000011111110100101|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    0 000000100000011111x10xxx0001| AND    And 
    * ed unxed             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| ed: Not in use
    * ee eILL0a   ILLe     0 0000001000000xxxx1x0xxxx1111| Illegal instruction seen
    * ef WFI_5    Fetch    6 0110010001010110110011001101|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    c 1100001000000101011110010111|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 0 0000000001111101011101100001|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 0 000000100000000101x10xxx1110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  0 0000001000000xxxx1x01xxx1101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2            0 0000000001011111111111000000|  Fr00  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 0 0000000001111101011101101101|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    4 0100001000000000010111001111| WFI    Chk offset=0x105. Now=0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 0 0000000001111001011101101010| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  0 0000000001100111011101100001| BGEU   Conditional Branch. Offset to Ryy
    * f9 _L0xf9   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * fa WFI_2    WFI_3    4 0100001000000101011111000100|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     0 0000001000000000011101100110|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  0 0000000001100011011101100100| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    0 000000100000000101x10xxx0111| NMI    Get current PC
    * fe ILLe     ILL_1    0 000000100000000101x0xxxx0100| Illegal
    * ff QINT_0   QINT_1   0 000000100000000101x10xxx1100| INT    Get current PC
    */
   localparam u0_0 = 256'h76e6501076e6790473863c5af88b3c5afb097a07480474e650e6fcbef9d2bc01;
   localparam u0_1 = 256'h76b75cd477e6eea66e3273e674417613fc74cede79167c15f81440fe781af88b;
   localparam u0_2 = 256'h76e6000076e6403e74303c9678213c967c1d70274804a63550e640fe70e6bc52;
   localparam u0_3 = 256'ha13aa135790376496e32793d40fe761371d7fd03f936e9de64817486f82b76e6;
   localparam u0_4 = 256'h7ce640fe0000503169b17c667c4b7c66718f61477c65fa2b40fe40fe7c0bfc50;
   localparam u0_5 = 256'h6edaf970fdfb76496e32f95d40fe40fe788b7b57761e79eb6edaf9546edaf1e6;
   localparam u0_6 = 256'h7ccf000000005031797a40fe000040fe669369f250effa2b40fe40fe72f740fe;
   localparam u0_7 = 256'h617d7190e13476496e3269f240fe40fe647d78774073f6f471767a1a761e79ba;
   localparam u0_8 = 256'h7ca940fe0000d02974e640fe000040fe617f449ef9f0fa2140fe40fe617dbc85;
   localparam u0_9 = 256'h69f26134000040fe799fc43440fe76136693f9bbdc94e534f195e13444927634;
   localparam u0_A = 256'h7cc5403f0000403f719a40fee43440fe7c61eed07cafa63a40fe40fe5cb6bc5e;
   localparam u0_B = 256'hf9c1f91febde7649fdb5fa1a40fe76135cbd5c9a769b00000000ccde5cb24492;
   localparam u0_C = 256'h504f40fe0000d02676e640fe5ca540fe71cb7b477a6ff2e140fe40fe76e940fe;
   localparam u0_D = 256'hf6f4f6f476e576496492509140fe761376a140fe00006492761e790676c97c37;
   localparam u0_E = 256'hccde40fe0000d011fa5640fe5cc640fe761eccde5cb0fa1a40fe40fe791d40fe;
   localparam u0_F = 256'h50c74046507e7649766b7c4540fe761376ab5cfa76dbfc0048dd50e6761e7972;
   localparam u1_0 = 256'h0021020700210207306100470202004702020203020100210201268612050606;
   localparam u1_1 = 256'h0065420500212205320100210065006734566456504642010207020002070207;
   localparam u1_2 = 256'h0021700000210207420020470207204702000047020172070201020000212466;
   localparam u1_3 = 256'h72077207c02500633201b025020000675068a025702594560079006102078021;
   localparam u1_4 = 256'h4205020070000207011d3e0742013e07007d006d420502070200020042063606;
   localparam u1_5 = 256'h007d1205a0650063320170650200020002040204007dc205007d1205007dd025;
   localparam u1_6 = 256'h42007000700002070e160200700002000079001f520102070200020050430200;
   localparam u1_7 = 256'h007d006801f400633201001602000200406d02010201e205007e0203007dc205;
   localparam u1_8 = 256'h42050200700002074021020070000200006e40211205020702000200006d0606;
   localparam u1_9 = 256'h000e0046700002000e0e01f40200006700797065420501f4006d006c41f101fa;
   localparam u1_A = 256'h4200020770000207006d020041f4020002003205420372070200020042052466;
   localparam u1_B = 256'h9205920596060063a065020302000067020642050200700070006446420501f1;
   localparam u1_C = 256'h520302007000020701fa0200020302000068006d020000470200020000650200;
   localparam u1_D = 256'he055f051007d00634070020502000067007d0200700041f1007dc20500434201;
   localparam u1_E = 256'h64560200700002070203020002060200007d6446420502070200020002000200;
   localparam u1_F = 256'h0201020102010063020042050200006700794200007d005f02000201007dc205;
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
   assign d[36] = indir[23];
   assign d[37] = indir[24];
   assign d[39] = indir[25];
   assign d[40] = indir[26];
   assign d[41] = indir[27];
   // replaces = 000100111110000000001000001100011100000000
   SB_LUT4 #(.LUT_INIT(16'h1802)) cmb_d08(.O(d[8]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0150)) cmb_d09(.O(d[9]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0050)) cmb_d10(.O(d[10]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d14(.O(d[14]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'hc000)) cmb_d15(.O(d[15]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'he37f)) cmb_d21(.O(d[21]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h000c)) cmb_d31(.O(d[31]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0008)) cmb_d32(.O(d[32]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h6242)) cmb_d33(.O(d[33]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1400)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4002)) cmb_d35(.O(d[35]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h6000)) cmb_d38(.O(d[38]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[42] = 1'b0;
   assign d[43] = 1'b0;
   assign d[44] = 1'b0;
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
wire instr0100,instr1x110100;            bn_l4v #(.I(16'h0010)) leq0100(     .o(instr0100),     .i({minx[3:0]}));    bn_l4v #(.I(16'h8000)) leq1x110100( .o(instr1x110100), .i({minx[7],minx[5:4],instr0100}));    SB_DFFE reg_d18( .Q(d[18]), .C(clk), .E(progress_ucode), .D(instr1x110100));    assign d[30] = d[18];
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   No RVC
 *   No MULDIV
 *   minstret for instructions in SRAM
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 42 columns
 * Removed:  000000000001000000000000000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 42
 * 171 distinct lines in remaining untreated columns
 * c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 171 171 171 171 171 171 171 171 171 171 171   x 171 171 169 171 170 171 171 170 171 171 170 171 171 171 171 171 168 168 170 171 170 171 170 171 170 171 171 170 170 170  kill col 13  Tbl  40 cols 000000000001000000000000000010000000000000 has 168 unique lines.
 * 168 168 168 168 168 168 168 168 168 168 168   x 168 168 166 168 167 168 168 167 168 168 167 168 168 168 168 168     165 166 168 167 168 167 168 167 168 168 167 167 167  kill col 12  Tbl  39 cols 000000000001000000000000000011000000000000 has 165 unique lines.
 * 165 165 165 165 165 165 165 165 165 165 165   x 165 165 163 165 163 165 165 162 165 165 164 165 165 165 165 165         161 164 164 165 164 165 164 165 165 164 164 164  kill col 11  Tbl  38 cols 000000000001000000000000000011100000000000 has 161 unique lines.
 * 161 161 161 161 161 161 161 161 161 161 161   x 161 161 159 161 159 161 161 158 161 161 159 161 161 161 161 161             160 160 161 160 161 160 161 161 160 160 160  kill col 22  Tbl  37 cols 000000000001000000010000000011100000000000 has 158 unique lines.
 * 158 158 158 158 158 158 158 158 158 158 158   x 158 158 156 158 157 158 158     158 158 156 158 158 158 158 158             157 157 157 157 157 156 157 158 157 157 156  kill col 27  Tbl  36 cols 000000000001001000010000000011100000000000 has 156 unique lines.
 * 156 156 156 156 156 156 156 156 156 156 156   x 156 156     155 155 156 155     156 156 154 156 156 156 156 156             155 155 155 155 155 154 155 156 155 155 154  kill col 19  Tbl  35 cols 000000000001001000010010000011100000000000 has 154 unique lines.
 * 154 154 154 154 154 154 154 154 154 154 154   x 154 154     153 153 154 153     154 154     154 154 154 154 154             153 153 153 153 153 152 153 154 153 153 152  kill col  5  Tbl  34 cols 000000000001001000010010000011100000100000 has 152 unique lines.
 * 152 152 152 152 152 152 152 152 152 152 152   x 152 152     151 151 152 151     152 152     152 152 152 152 152             151 151 151 150 151     151 151 149 148 149  kill col  1  Tbl  33 cols 000000000001001000010010000011100000100010 has 148 unique lines.
 * 148 148 148 148 148 148 148 148 148 148 148   x 148 148     146 147 148 147     148 148     148 148 146 148 148             147 147 147 144 147     145 145 146     145  kill col  7  Tbl  32 cols 000000000001001000010010000011100010100010 has 144 unique lines.
 * 144 144 144 144 144 144 144 144 144 144 144   x 144 143     142 143 142 143     144 144     144 142 141 144 144             143 143 143     143     141 140 140     140  kill col  3  Tbl  31 cols 000000000001001000010010000011100010101010 has 140 unique lines.
 * 140 140 140 140 140 140 140 140 140 140 140   x 140 139     138 137 138 139     140 140     140 137 135 140 139             139 139 139     137     133     132     135  kill col  2  Tbl  30 cols 000000000001001000010010000011100010101110 has 132 unique lines.
 * 132 132 132 132 132 132 132 130 132 132 132   x 132 131     129 127 129 128     132 132     132 126 126 132 131             131 131 131     123     122             124  kill col  4  Tbl  29 cols 000000000001001000010010000011100010111110 has 122 unique lines.
 * 122 122 122 122 122 122 122 119 122 122 122   x 121 120     119 113 116 115     122 122     122 115 116 122 119             121 121 121     107                     110  kill col  6  Tbl  28 cols 000000000001001000010010000011100011111110 has 107 unique lines.
 * 107 107 107 107 107 107 107 105 107 106 106   x 105 105     105  96 100  98     107 107     107  99 100 107 104             106 106 106                              94  kill col  0  Tbl  27 cols 000000000001001000010010000011100011111111 has  94 unique lines.
 *  94  94  94  94  94  94  94  91  94  93  93   x  91  92      90  83  85  84      94  94      94  84  86  94  91              93  93  92                                  kill col 25  Tbl  26 cols 000000000001001010010010000011100011111111 has  83 unique lines.
 *  83  83  83  83  83  83  83  80  82  82  81   x  80  82      80      73  71      83  83      83  73  75  83  79              82  82  81                                  kill col 23  Tbl  25 cols 000000000001001010110010000011100011111111 has  71 unique lines.
 *  70  71  71  71  71  71  71  68  70  70  69   x  67  70      66      63          71  71      71  63  64  71  67              70  70  69                                  kill col 24  Tbl  24 cols 000000000001001011110010000011100011111111 has  63 unique lines.
 *  62  63  61  63  62  63  63  60  62  62  61   x  59  62      59                  63  63      63  57  56  62  60              62  62  61                                  kill col 16  Tbl  23 cols 000000000001001011110010010011100011111111 has  56 unique lines.
 *  55  56  54  56  55  56  56  53  55  55  54   x  51  55      52                  54  55      56  52      55  53              55  55  54                                  kill col 29  Tbl  22 cols 000000000001101011110010010011100011111111 has  51 unique lines.
 *  50  51  44  51  50  51  51  49  50  50  49   x      49      47                  50  50      51  47      50  48              50  50  49                                  kill col 39  Tbl  21 cols 001000000001101011110010010011100011111111 has  44 unique lines.
 *  43  43      44  43  44  44  42  43  43  42   x      40      39                  43  43      44  41      43  42              43  43  42                                  kill col 26  Tbl  20 cols 001000000001101111110010010011100011111111 has  39 unique lines.
 *  38  38      39  38  39  39  37  38  38  37   x      34                          38  38      38  35      38  37              38  38  37                                  kill col 28  Tbl  19 cols 001000000001111111110010010011100011111111 has  34 unique lines.
 *  33  31      33  33  33  34  32  33  33  31   x                                  33  33      33  30      33  33              33  33  32                                  kill col 17  Tbl  18 cols 001000000001111111110010110011100011111111 has  30 unique lines.
 *  29  26      29  29  29  30  28  29  29  27   x                                  28  27      29          29  29              29  29  28                                  kill col 40  Tbl  17 cols 011000000001111111110010110011100011111111 has  26 unique lines.
 *  24          25  25  24  26  24  24  25  24   x                                  24  23      25          25  25              25  25  24                                  kill col 20  Tbl  16 cols 011000000001111111110110110011100011111111 has  23 unique lines.
 *  21          22  22  21  23  21  21  22  22   x                                  22          22          22  22              22  22  21                                  kill col 41  Tbl  15 cols 111000000001111111110110110011100011111111 has  21 unique lines.
 *              20  20  19  21  19  19  20  20   x                                  20          20          20  20              20  20  19                                  kill col 36  Tbl  14 cols 111001000001111111110110110011100011111111 has  19 unique lines.
 *              18  17      19  17  17  18  18   x                                  18          18          18  18              18  18  17                                  kill col 37  Tbl  13 cols 111011000001111111110110110011100011111111 has  17 unique lines.
 *              16          17  15  15  16  16   x                                  16          16          16  16              16  16  15                                  kill col 34  Tbl  12 cols 111011010001111111110110110011100011111111 has  15 unique lines.
Possible good candidates for removal, columns : 8 33 
 *
 * Round 1: 000100101110000000001001001100011100000000  4 columns for indexes to table representing 12 original columns (uses 15 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 34
 * 168 distinct lines in remaining untreated columns
 * c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 168 168 168   x 168 168   x 168   x   x   x   x 168 168 165 168 167 168 168 167   x 168 166   x 168 168   x   x 165 165 166   x   x   x 167 168 167 168 168 167 167 167  kill col 27  Tbl  28 cols 000100101111001000001001001100011100000000 has 165 unique lines.
 * 165 165 165   x 165 165   x 165   x   x   x   x 165 165     164 164 165 164 164   x 165 163   x 165 165   x   x 162 162 163   x   x   x 164 165 164 165 165 164 164 164  kill col 13  Tbl  27 cols 000100101111001000001001001110011100000000 has 162 unique lines.
 * 162 162 162   x 162 162   x 162   x   x   x   x 162 162     161 161 162 161 160   x 162 160   x 162 162   x   x     159 158   x   x   x 161 161 161 162 162 161 161 161  kill col 11  Tbl  26 cols 000100101111001000001001001110111100000000 has 158 unique lines.
 * 158 158 158   x 158 158   x 158   x   x   x   x 158 158     157 157 158 157 156   x 158 155   x 158 158   x   x     152       x   x   x 157 157 157 158 158 157 157 157  kill col 12  Tbl  25 cols 000100101111001000001001001111111100000000 has 152 unique lines.
 * 152 152 152   x 152 152   x 152   x   x   x   x 152 152     151 150 152 151 148   x 152 149   x 152 152   x   x               x   x   x 151 151 151 152 152 151 151 151  kill col 22  Tbl  24 cols 000100101111001000011001001111111100000000 has 148 unique lines.
 * 148 148 148   x 148 148   x 148   x   x   x   x 148 148     147 146 148 147       x 148 145   x 148 148   x   x               x   x   x 147 146 146 147 148 147 147 146  kill col 19  Tbl  23 cols 000100101111001000011011001111111100000000 has 145 unique lines.
 * 145 145 145   x 145 145   x 145   x   x   x   x 145 145     144 143 145 144       x 145       x 145 145   x   x               x   x   x 143 142 143 144 145 144 144 143  kill col  6  Tbl  22 cols 000100101111001000011011001111111101000000 has 142 unique lines.
 * 142 142 142   x 142 142   x 141   x   x   x   x 142 142     141 140 141 141       x 142       x 141 142   x   x               x   x   x 140     139 140 141 140 141 139  kill col  5  Tbl  21 cols 000100101111001000011011001111111101100000 has 139 unique lines.
 * 139 139 139   x 139 139   x 137   x   x   x   x 137 139     138 137 138 136       x 139       x 137 138   x   x               x   x   x 135         136 136 135 136 135  kill col  7  Tbl  20 cols 000100101111001000011011001111111111100000 has 135 unique lines.
 * 135 135 135   x 135 135   x 131   x   x   x   x 133 134     133 132 129 132       x 135       x 131 133   x   x               x   x   x             131 129 128 130 131  kill col  2  Tbl  19 cols 000100101111001000011011001111111111100100 has 128 unique lines.
 * 128 128 128   x 128 128   x 124   x   x   x   x 126 126     126 121 118 122       x 127       x 124 123   x   x               x   x   x             122 119     122 121  kill col 24  Tbl  18 cols 000100101111001001011011001111111111100100 has 118 unique lines.
 * 118 118 118   x 118 118   x 113   x   x   x   x 116 115     116 108     110       x 117       x 113 111   x   x               x   x   x             107 108     110 111  kill col  4  Tbl  17 cols 000100101111001001011011001111111111110100 has 107 unique lines.
 * 107 107 107   x 107 107   x 103   x   x   x   x 105 103     105  93      98       x 106       x 101  95   x   x               x   x   x                  93      94  94  kill col 25  Tbl  16 cols 000100101111001011011011001111111111110100 has  93 unique lines.
 *  93  93  93   x  93  93   x  89   x   x   x   x  91  89      91          82       x  92       x  83  82   x   x               x   x   x                  75      78  78  kill col  3  Tbl  15 cols 000100101111001011011011001111111111111100 has  75 unique lines.
 *  75  75  75   x  75  75   x  71   x   x   x   x  72  72      70          64       x  74       x  65  65   x   x               x   x   x                          61  64  kill col  1  Tbl  14 cols 000100101111001011011011001111111111111110 has  61 unique lines.
 *  60  59  61   x  61  60   x  57   x   x   x   x  58  57      56          50       x  59       x  50  53   x   x               x   x   x                              48  kill col  0  Tbl  13 cols 000100101111001011011011001111111111111111 has  48 unique lines.
 *  47  45  47   x  47  47   x  45   x   x   x   x  45  44      43          39       x  46       x  38  40   x   x               x   x   x                                  kill col 17  Tbl  12 cols 000100101111001011011011101111111111111111 has  38 unique lines.
 *  37  36  37   x  37  37   x  35   x   x   x   x  33  34      31          30       x  36       x      32   x   x               x   x   x                                  kill col 23  Tbl  11 cols 000100101111001011111011101111111111111111 has  30 unique lines.
 *  29  28  28   x  29  29   x  27   x   x   x   x  25  25      23                   x  27       x      24   x   x               x   x   x                                  kill col 26  Tbl  10 cols 000100101111001111111011101111111111111111 has  23 unique lines.
 *  22  21  21   x  22  22   x  20   x   x   x   x  19  20                           x  20       x      19   x   x               x   x   x                                  kill col 29  Tbl   9 cols 000100101111101111111011101111111111111111 has  19 unique lines.
 *  18  17  15   x  18  18   x  17   x   x   x   x      17                           x  15       x      15   x   x               x   x   x                                  kill col 39  Tbl   8 cols 001100101111101111111011101111111111111111 has  15 unique lines.
Possible good candidates for removal, columns : 16 20 
 *
 * Round 2: 110011010000010000000100010000000000000000  4 columns for indexes to table representing  8 original columns (uses 15 of 16 lines in indirect table).
 * Direct:  001000000000101111110010100011100011111111 21 columns
 * Can even chose 3 more columns to be represented directly.
 * Success. Use 2 EBRs, 17 LUTs.
 */

module v2_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    *                      indirect_index 1
    * inx         next     | indirect index 0
    * || ucode    ucode    | | direct representation
    * 00 LB_0     LB_1     0 0 000000001000110111100000| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 000100011000101111001xx1|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 001000101000110111100000| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 _L0x03   StdIncPc 3 0 0011000010000010x1xxxxx0| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 4 0 010000000000001011100000| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   1 0 0001000010000010x0xxxxx0| AUIPC  q = imm20 (copy x/2)
    * 06 LB_3     LB_4     1 0 000100001000011011010xx0|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     1 0 000100001000010111011xx0|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     5 0 010100000100111011100000| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     1 0 000100001000010111000xx0|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     5 0 010100000100111011100000| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    4 3 010000110100001011011xx0|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   1 0 000100001000111011001xx0| ADD    add     Addition Q = RS1
    * 0d _L0x0d   StdIncPc 4 0 010000000000001011110000| LUI    q = imm20
    * 0e SUB_0    SUB_1    3 0 0011000010001110x1xxxxx0| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 4 0 010000000000001011110000| LUI    q = imm20
    * 10 SUB_1    LB_6     1 0 000100001000111111000xx0|        Q = ~RS2
    * 11 AND_1    ANDI_1   1 0 000100001000111011000xx0|        RS1^0xffffffff to Q
    * 12 _L0x12   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * 13 condb_2  condb_3  1 0 000100001000111111000xx0|        ~RS2 in Q
    * 14 condb_3  condb_4  1 4 000101001000001011100110|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  1 5 000101010100110011001xx0|        Branch on condition
    * 16 condb_5  Fetch    6 6 011001100110110100110110|        Branch not taken.
    * 17 condb_5t BrOpFet  6 3 011000110110110111100000|        Branch taken.
    * 18 BEQ      condb_2  4 0 010000000100111011110000| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   4 0 010000000100101011100000| JALR   yy=RS1+imm
    * 1a ANDI_1   StdIncPc 4 0 010000000000001011011xx0|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    1 3 000100111000001010110000| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 1 2 000100101000101110110000| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 4 0 010000000000001011111000|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 1 4 000101001000101001100110|        Q = 4
    * 1f IJ_2     IJ_3     4 0 010000000100101011110000|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     7 2 011100100100110111100000| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 4 0 010000000000001011000xx0|        rd = Iimm ^ RS1
    * 22 _L0x22   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * 23 _L0x23   StdIncPc 3 0 0011000010000010x1xxxxx0| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   8 7 100001111000111110110000| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   1 0 0001000010000010x0xxxxx0| AUIPC  q = imm20 (copy x/2)
    * 26 OR_1     OR_2     3 0 001100000100111011000xx0|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    1 0 000100001000000011100000|        Q = rs2
    * 28 _L0x28   SH_1     5 2 010100100100111011100000| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   1 0 000100001000111011000xx0|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     5 2 010100100100111011100000| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  3 4 001101001000xxxx11100110|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    3 0 0011000010001110x0xxxxx0| SLL    Shift left
    * 2d _L0x2d   StdIncPc 4 0 010000000000001011110000| LUI    q = imm20
    * 2e unx2e             8 7 10000111xxxxxxxxxxxxxxxx| 2e: Not in use 
    * 2f _L0x2f   StdIncPc 4 0 010000000000001011110000| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 4 8 010010000000001011110010|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  1 0 000100001000111111000xx0|        ~rs2 to Q
    * 32 JAL_1    JAL_2    4 0 010000000100001011100000|        Target adr to yy
    * 33 JAERR_1  JAERR_2  4 0 010000000111001010100000|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    6 9 011010010110110110001xx0|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   9 7 100101110000101111001xx0|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   a 7 101001110000101111101000|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  4 5 010001010101xxxx11001xx0|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  4 0 010000000100111011110000| BNE    Conditional Branch. Offset to Ryy
    * 39 _L0x39   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * 3a SRxI_1   SRxI_2   9 a 100110100000101011001xx1|        Register to shift to Q
    * 3b _L0x3b   JAL_1    1 3 000100111000001010110000| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  4 0 010000000100011011110000| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   a a 101010100000101011001xx1|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   8 7 100001111000111110001xx0|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   8 7 100001111000111110001xx0|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     6 3 011000111000110111100000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   1 4 000101001000110011100110|        Q=1
    * 42 _L0x42   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * 43 _L0x43   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * 44 SLTI_0   SLTIX_1  1 0 000100001000111111010xx0| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    1 4 000101001000101011100110|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    4 0 010000000101101010001xx0|        Store PC to mepc
    * 47 ILL_2    ILL_3    4 0 010000000111101011001xx0|        Store 0 to mtval
    * 48 _L0x48   SW_1     b 3 101100111000111011100000| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  1 4 000101001000001011100110|        Construct PC storage adr
    * 4a _L0x4a   SW_1     b 3 101100111000111011100000| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  c 0 110000000011101010001xx0|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   3 0 0011000010001110x1xxxxx0| SLT    Set less than (signed)
    * 4d unx4d             8 7 10000111xxxxxxxxxxxxxxxx| 4d: Not in use 
    * 4e eILL0b   ILLe     3 0 001100001000xxxxx0xxxxx0| Illegal instruction seen
    * 4f MRET_8   StdIncPc 1 4 000101001000101011100110|        Prep +4
    * 50 LW_1     StdIncPc 4 b 010010110000101111001xx0|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   9 0 100100000111101010110000|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 000100011000101111001xx1|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   9 0 100100000111101010110000|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     d a 110110101000101011001xx1|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 4 0 010000000111101011110000|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 0 000100001000100011011xx0|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     1 0 000100001000100011000xx0|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 _L0x58   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * 59 _L0x59   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * 5a SB_1     SB_2     9 7 100101110100101111001xx0|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    1 3 000100111000001010110000| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRW_1  4 0 010000000100011011110000| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     a 7 101001110100101111101000|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 000100011000101111001xx1|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   9 0 100100000111101010110000|  err   LD AlignFault. Faulting adr to mtval
    * 60 _L0x60   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * 61 EBRKWFI2 EBREAK_1 3 5 001101010100011011010xx0| EBREAK/WFI2 Select EBREAK or WFI
    * 62 _L0x62   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * 63 _L0x63   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * 64 SLTIU_0  SLTIX_1  1 0 000100001000111111010xx0| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    3 5 0011010110000010x1xxxxx0|        Prepare read PC
    * 66 SW_1     SW_2     1 0 000100000011111010001xx0|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    4 0 010000000111001010110000|        Store faulting address alignment to mtval
    * 68 _L0x68   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * 69 unx69             8 7 10000111xxxxxxxxxxxxxxxx| 69: Not in use 
    * 6a _L0x6a   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * 6b SB_4     SB_5     b 0 101100001010110011001xx0|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   3 0 0011000010001110x1xxxxx0| SLTU   Set less than (unsigned)
    * 6d unx6d             8 7 10000111xxxxxxxxxxxxxxxx| 6d: Not in use 
    * 6e unx6e             8 7 10000111xxxxxxxxxxxxxxxx| 6e: Not in use 
    * 6f MRET_6   MRET_7   1 4 000101001000xxxx11100110|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    d a 110110101000101011001xx1|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 4 0 010000000111101011110000|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   1 0 000100001000011011010xx0|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  4 0 010000000111110011001xx0|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   3 c 001111001000101111110000| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  3 0 0011000010000010x0xxxxx0|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  1 0 000100001000001011000xx0|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  4 4 010001000101101010100110|        origPC to mepc. Prep read 0
    * 78 _L0x78   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * 79 _L0x79   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * 7a SB_5     SW_2     1 0 000100000010110010001xx0|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    1 3 000100111000001010110000| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRW_1  4 0 010000000100011011110000| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  JAL_3    e 0 111000000110100110001xx0|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    4 0 010000000101xxxx11001xx0|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  4 0 010000000111101010001xx0|        mtval is target
    * 80 LBU_0    LBU_1    0 0 000000001000110111100000| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  4 0 010000000101101010001xx0|        Store PC to mepc
    * 82 _L0x82   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * 83 _L0x83   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * 84 XORI_0   XORI_1   1 0 000100001000111111010xx0| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 000100011000101111001xx1|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   4 4 010001000000001000100110|        Return address to TRG
    * 87 JALRE1   JALRE2   4 0 010000000101110010001xx0|  err   Store pc to mepc
    * 88 _L0x88   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * 89 unx89             8 7 10000111xxxxxxxxxxxxxxxx| 89: Not in use 
    * 8a _L0x8a   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * 8b LB_6     StdIncPc 4 4 010001000000001011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    3 0 0011000010001111x1xxxxx0| XOR    xor
    * 8d unx8d             8 7 10000111xxxxxxxxxxxxxxxx| 8d: Not in use 
    * 8e _LCSRRS_1 ILLe     3 0 001100001000xxxxx0xxxxx0| Illegal instruction seen
    * 8f ILL_3    ILL_4    1 4 000101001000101011100110|        Q = 1
    * 90 NMI_2    JAL_3    e 0 111000000111010011110000|        mtval = 0.
    * 91 LDAF_2   LDAF_3   e 4 111001000110001000100110|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    4 0 010000000101100110001xx0|        PC to mepc
    * 93 SW_E2    SW_E3    4 0 010000000101101111001xx0|        Store address that faulted
    * 94 SW_E4    JAL_3    e 0 111000000110100110101000|        Store 6 to mcause
    * 95 SW_E3    SW_E4    1 4 000101001000101101100110|        Q = 3
    * 96 SH_1     SH_2     9 7 100101110100101111001xx0|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    4 0 010000000111001010110000|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  4 0 010000000100111011110000| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    e 0 111000000110100100100000|        mcause = 11
    * 9b SH_4     SH_5     b 0 101100001001110011001xx0|        Address back to Q. Prepare get item to write
    * 9c _L0x9c   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * 9d unx9d             8 7 10000111xxxxxxxxxxxxxxxx| 9d: Not in use 
    * 9e JAL_25   JAL_3    3 0 001100000100110010001xx0|        Instr. adr. to jj in case of access error
    * 9f SH_5     SW_2     1 0 000100000001110010001xx0|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    7 2 011100100100110111100000| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  1 4 000101001000101001100110|        Q = 4
    * a2 _L0xa2   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * a3 _L0xa3   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * a4 SRxI_0   SRxI_1   8 7 100001111000111110110000| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   1 4 000101001000011011100110|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  1 3 000100111000101110110000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 1 0 000100001000xxxx11100000| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 _L0xa8   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * a9 ILL_4    JAL_3    e 4 111001000110100110100110|        Store 2 to mcause
    * aa _L0xaa   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * ab EBREAK_2 ECALL_6  4 0 010000000101101011001xx0|        pc to mepc
    * ac _L0xac   SRx_1    3 0 0011000010001110x0xxxxx0| SRx    Shift Right (both SRL and SRA)
    * ad unxad             8 7 10000111xxxxxxxxxxxxxxxx| ad: Not in use 
    * ae _L0xae   SRx_1    3 0 0011000010001110x0xxxxx0| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   1 4 000101001000xxxx11100110|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   e 0 111000000110001000100000|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  1 4 000101001000101001100110|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    6 6 011001100100110100100110|        IncPC, OpFetch, but force +4
    * b3 unxb3             8 7 10000111xxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 eFetch3           1 4 000101000101111111100110|  Fr10  Update minstret, Q=immediate. Use dinx
    * b5 SH_3     SH_4     3 0 001100001000000011110000|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  1 4 000101001000101001100110|        Q = 8
    * b7 IJ_3     IJ_4     1 0 000100001000110001100000|        Construct Q = 3
    * b8 BGE      condb_2  4 0 010000000100111011110000| BGE    Conditional Branch. Offset to Ryy
    * b9 _L0xb9   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * ba LHU_3    ANDI_1   1 0 000100001000011111010xx0|        Invert q. Prepare read mask
    * bb SH_2     SH_3     a 7 101001110100101111101000|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  4 0 010000000100011011110000| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    6 9 011010011000110110011xx0|        Mask and use as PC
    * be IJ_1     IJ_2     1 9 000110011000101111001xx0|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    1 9 000110011000101111001xx0|        Exit CSR, enter trap
    * c0 _L0xc0   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * c1 IJT_2    IJT_3    4 0 010000000100101011110000|        Read word is to be masked with ~3u
    * c2 _L0xc2   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * c3 _L0xc3   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * c4 ORI_0    ORI_1    3 0 001100000100111111010xx0| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   1 0 000100001000000011010xx0|        ~302
    * c6 IJT_4    ILL_2    9 0 100100000101101011011xx0|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   4 0 010000000101xxxx11001xx0|        Store pc to mepc.
    * c8 _L0xc8   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * c9 MRET_2   MRET_3   1 0 000100001000011001100000|        0xff+3 = 0x102
    * ca _L0xca   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * cb QINT_2   StdIncPc e 0 111000000111010011110000|        mtval = 0.
    * cc OR_0     OR_1     3 0 0011000010001111x1xxxxx0| OR     or
    * cd unxcd             8 7 10000111xxxxxxxxxxxxxxxx| cd: Not in use 
    * ce _LCSRRCI_1 ILLe     3 0 001100001000xxxxx0xxxxx0| Illegal instruction seen
    * cf MRET_7   MRET_8   3 5 0011010110000110x1xxxxx0|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  1 4 000101001000001011100110| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   3 0 001100000100011011110000| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     d a 110110101000101011001xx1|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 4 0 010000000111101011110000|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   e 4 111001000110001010100110|        Store 5 to mcause
    * d5 eFetch2  eFetch3  3 d 001111010111000111100000|  Fr10  Update ttime
    * d6 eILL0c   ILLe     3 0 001100001000xxxxx0xxxxx0| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  4 0 010000000111101011110000|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  4 0 010000000100111011110000| BLTU   Conditional Branch. Offset to Ryy
    * d9 _L0xd9   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * da LDAF_a   LDAF_2   3 0 0011000010001010x1xxxxx0|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   4 4 010001000110000010100110|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  4 0 010000000100011011110000| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  4 0 010000000111101011110000|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   3 e 001111100110001111110000|  Fr10  Read and latch instruction
    * df eFetch   eFetch2  3 c 001111000110101111110000|  Fr10  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 _L0xe0   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * e1 ORI_1    ORI_2    1 0 000100001000000011001xx0|        Q = RS1
    * e2 _L0xe2   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * e3 _L0xe3   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * e4 ANDI_0   ANDI_1   1 0 000100001000111111010xx0| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  1 4 000101001000101001100110|        Q = 4
    * e6 StdIncPc Fetch    6 6 011001100100110100100110|  Fr10  IncPC, OpFetch
    * e7 aFault   aFault_1 4 0 010000000111101011110000|  err   Load access fault. Faulting adr to mtval
    * e8 _L0xe8   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * e9 IJT_3    IJT_4    1 0 000100001000110001100000|        Construct Q = 3
    * ea _L0xea   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * eb LH_3     LH_4     1 0 000100001000011111010xx0|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    3 0 0011000010001111x1xxxxx0| AND    And 
    * ed unxed             8 7 10000111xxxxxxxxxxxxxxxx| ed: Not in use
    * ee eILL0a   ILLe     3 0 001100001000xxxxx0xxxxx0| Illegal instruction seen
    * ef WFI_5    Fetch    6 6 011001100110110100100110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    d a 110110101000101011001xx1|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 4 0 010000000111101011110000|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 0 0011000010000010x1xxxxx0|        Prepare read PC
    * f3 aF_SW    aF_SW_1  1 0 000100001000xxxxx0xxxxx0|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2            1 d 000111010111111111100000|  Fr10  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 4 0 010000000111101011110000|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    1 4 000101001000000001100110| WFI    Chk offset=0x105. Now=0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 4 0 010000000111001011110000| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  4 0 010000000100111011110000| BGEU   Conditional Branch. Offset to Ryy
    * f9 _L0xf9   ILLe     3 0 001100001000xxxxx0xxxxx0|  Not in use (illegal as entry)
    * fa WFI_2    WFI_3    1 4 000101001000101011100110|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     3 0 001100001000000011110000|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  4 0 010000000100011011110000| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    3 0 0011000010000010x1xxxxx0| NMI    Get current PC
    * fe ILLe     ILL_1    3 0 0011000010000010x0xxxxx0| Illegal
    * ff QINT_0   QINT_1   3 0 0011000010000010x1xxxxx0| INT    Get current PC
    */
   localparam u0_0 = 256'hf0e64010f0e6c804d886e05ac08be05ad809d0070004e0e640e6e0bec9d2e001;
   localparam u0_1 = 256'hf0b766d4f8e6b0a6b032d8e6e041f013e07436dec816e615c01400fec01ac08b;
   localparam u0_2 = 256'hf0e60000f0e6003ee630e096c021e096e01dc0270004b03540e600fec0e6e052;
   localparam u0_3 = 256'h883a8835c903f049b032c93d00fef013c8d7e803c83688dea081e086c02bf2e6;
   localparam u0_4 = 256'he6e600fe0000403188b1e066e64be066c88f8847e665d02b00fe00fee60be050;
   localparam u0_5 = 256'hb0dac970e8fbf049b032c85d00fe00fec08bd857f01ec9ebb0dac954b0dac8e6;
   localparam u0_6 = 256'he6cf000000004031c87a00fe000000feb09388f240efd02b00fe00fed0f700fe;
   localparam u0_7 = 256'h887dc8908834f049b03288f200fe00fea67dc0770073f0f4c876d01af01ec9ba;
   localparam u0_8 = 256'he6a900fe00004029e6e600fe000000fe887f269ec9f0d02100fe00fe887de085;
   localparam u0_9 = 256'h88f28834000000fec89f203400fef013b093c8bb6694a834c89588342692f034;
   localparam u0_A = 256'he6c5003f0000003fc89a00fea63400fee061b0d0e6afb03a00fe00fe66b6e05e;
   localparam u0_B = 256'hc8c1c81f98def049e8b5d01a00fef01360bd669af09be600000026de66b22092;
   localparam u0_C = 256'h404f00fe00004026f0e600fe60a500fec8cbd847d06fd0e100fe00fef0e900fe;
   localparam u0_D = 256'hf0d5f0f4f0e5f049a692409100fef013f0a100fee0b4a692f01ec906f0c9e637;
   localparam u0_E = 256'h26de00fe00004011d05600fe60c600fef01e26de66b0d01a00fe00fec81d00fe;
   localparam u0_F = 256'h40c70046407ef049f06be64500fef013f0ab66faf0dbe00000dd40e6f01ec972;
   localparam u1_0 = 256'h4002308e4002108e4342504e1085504e10851086108240023082228d118b008d;
   localparam u1_1 = 256'h404a148a4002128b13824002404a404e636d666d154c1482108f3080108e108f;
   localparam u1_2 = 256'h400287004002308e3480524e108e524e1080304e1082878f308230804002724d;
   localparam u1_3 = 256'h878f878faa0a404613829a0a3080404e4550a70b970b696d40724042108f4802;
   localparam u1_4 = 256'h148a30808700308ec03ab38e1482b38e407a405a148a108f30803080148c638d;
   localparam u1_5 = 256'h907a118ba74b40461382974b3080308010881088407ada8a907a118b907a4b0b;
   localparam u1_6 = 256'h148087008700308eb0ac3080870030804072103e3582108f3080308035463080;
   localparam u1_7 = 256'h407a4050e06940461382102c30803080445a108230823c8b407c1086407ada8a;
   localparam u1_8 = 256'h148a30808700308f4402308087003080405c4402118b108f30803080405a008d;
   localparam u1_9 = 256'h101c304c87003080b09ce0693080404e4072974b148be069405b4059e462e074;
   localparam u1_A = 256'h1480308e8700308e405a3080e46930801080138b1486878f30803080148a724d;
   localparam u1_B = 256'h198b198b698d4046a74b10873080404e108c148a3080145f8700664d148ae062;
   localparam u1_C = 256'h358630808700308fe0743080108630804050905a1080304f30803080404a3080;
   localparam u1_D = 256'h3c6b3e63407a40464460308a3080404e407a30803d71e462407ada8a30461482;
   localparam u1_E = 256'h666d30808700308f10873080108c3080407a664d148a108f3080308010803080;
   localparam u1_F = 256'h30823082308240463080148a3080404e40721480407a1d7f10803082407ada8a;
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
   assign d[8] = indir[8];
   assign d[9] = indir[9];
   assign d[10] = indir[10];
   assign d[11] = indir[11];
   assign d[12] = indir[12];
   assign d[13] = indir[13];
   assign d[17] = indir[14];
   assign d[19] = indir[15];
   assign d[22] = indir[16];
   assign d[23] = indir[17];
   assign d[24] = indir[18];
   assign d[25] = indir[19];
   assign d[26] = indir[20];
   assign d[27] = indir[21];
   assign d[29] = indir[22];
   assign d[39] = indir[23];
   // replaces = 000100101110000000001001001100000000000000
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d14(.O(d[14]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h5000)) cmb_d15(.O(d[15]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2000)) cmb_d18(.O(d[18]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h7b7f)) cmb_d21(.O(d[21]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h000c)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0008)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1a42)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1002)) cmb_d35(.O(d[35]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1800)) cmb_d38(.O(d[38]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 110011010000010000000100010000000000000000
   SB_LUT4 #(.LUT_INIT(16'h3ee7)) cmb_d16(.O(d[16]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h7e5e)) cmb_d20(.O(d[20]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4690)) cmb_d28(.O(d[28]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2400)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4004)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h5000)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h08c5)) cmb_d40(.O(d[40]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0800)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[42] = 1'b0;
   assign d[43] = 1'b0;
   assign d[44] = 1'b0;
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
wire instr0100,instr1x110100;            bn_l4v #(.I(16'h0010)) leq0100(     .o(instr0100),     .i({minx[3:0]}));    bn_l4v #(.I(16'h8000)) leq1x110100( .o(instr1x110100), .i({minx[7],minx[5:4],instr0100}));    SB_DFFE reg_d18( .Q(d[30]), .C(clk), .E(progress_ucode), .D(instr1x110100));
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   No RVC
 *   No MULDIV
 *   minstret for instructions in SRAM and EBR
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 42 columns
 * Removed:  000000000001000000000000000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 42
 * 169 distinct lines in remaining untreated columns
 * c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 169 169 169 169 169 169 169 169 169 169 169   x 169 169 167 169 168 169 169 168 169 169 168 169 169 169 169 169 166 166 168 169 168 169 168 169 168 169 169 168 168 168  kill col 13  Tbl  40 cols 000000000001000000000000000010000000000000 has 166 unique lines.
 * 166 166 166 166 166 166 166 166 166 166 166   x 166 166 164 166 165 166 166 165 166 166 165 166 166 166 166 166     163 164 166 165 166 165 166 165 166 166 165 165 165  kill col 12  Tbl  39 cols 000000000001000000000000000011000000000000 has 163 unique lines.
 * 163 163 163 163 163 163 163 163 163 163 163   x 163 163 161 163 161 163 163 160 163 163 162 163 163 163 163 163         159 162 162 163 162 163 162 163 163 162 162 162  kill col 11  Tbl  38 cols 000000000001000000000000000011100000000000 has 159 unique lines.
 * 159 159 159 159 159 159 159 159 159 159 159   x 159 159 157 159 157 159 159 156 159 159 157 159 159 159 159 159             158 158 159 158 159 158 159 159 158 158 158  kill col 22  Tbl  37 cols 000000000001000000010000000011100000000000 has 156 unique lines.
 * 156 156 156 156 156 156 156 156 156 156 156   x 156 156 154 156 155 156 156     156 156 154 156 156 156 156 156             155 155 155 155 155 154 155 156 155 155 154  kill col 27  Tbl  36 cols 000000000001001000010000000011100000000000 has 154 unique lines.
 * 154 154 154 154 154 154 154 154 154 154 154   x 154 154     153 153 154 153     154 154 152 154 154 154 154 154             153 153 153 153 153 152 153 154 153 153 152  kill col 19  Tbl  35 cols 000000000001001000010010000011100000000000 has 152 unique lines.
 * 152 152 152 152 152 152 152 152 152 152 152   x 152 152     151 151 152 151     152 152     152 152 152 152 152             151 151 151 151 151 150 151 152 151 151 150  kill col  5  Tbl  34 cols 000000000001001000010010000011100000100000 has 150 unique lines.
 * 150 150 150 150 150 150 150 150 150 150 150   x 150 150     149 149 150 149     150 150     150 150 150 150 150             149 149 149 148 149     149 149 147 146 147  kill col  1  Tbl  33 cols 000000000001001000010010000011100000100010 has 146 unique lines.
 * 146 146 146 146 146 146 146 146 146 146 146   x 146 146     144 145 146 145     146 146     146 146 144 146 146             145 145 145 142 145     143 143 144     143  kill col  7  Tbl  32 cols 000000000001001000010010000011100010100010 has 142 unique lines.
 * 142 142 142 142 142 142 142 142 142 142 142   x 142 141     140 141 140 141     142 142     142 140 139 142 142             141 141 141     141     139 138 138     138  kill col  3  Tbl  31 cols 000000000001001000010010000011100010101010 has 138 unique lines.
 * 138 138 138 138 138 138 138 138 138 138 138   x 138 137     136 135 136 137     138 138     138 135 133 138 137             137 137 137     135     131     130     133  kill col  2  Tbl  30 cols 000000000001001000010010000011100010101110 has 130 unique lines.
 * 130 130 130 130 130 130 130 128 130 130 130   x 130 129     127 125 127 126     130 130     130 124 124 130 129             129 129 129     121     120             122  kill col  4  Tbl  29 cols 000000000001001000010010000011100010111110 has 120 unique lines.
 * 120 120 120 120 120 120 120 117 120 120 120   x 119 118     117 111 114 113     120 120     120 113 114 120 117             119 119 119     105                     108  kill col  6  Tbl  28 cols 000000000001001000010010000011100011111110 has 105 unique lines.
 * 105 105 105 105 105 105 105 103 105 104 104   x 103 103     103  94  98  96     105 105     105  97  98 105 102             104 104 104                              92  kill col  0  Tbl  27 cols 000000000001001000010010000011100011111111 has  92 unique lines.
 *  92  92  92  92  92  92  92  89  92  91  91   x  89  90      88  81  83  82      92  92      92  82  84  92  89              91  91  90                                  kill col 25  Tbl  26 cols 000000000001001010010010000011100011111111 has  81 unique lines.
 *  81  81  81  81  81  81  81  78  80  80  79   x  78  80      78      71  69      81  81      81  71  73  81  77              80  80  79                                  kill col 23  Tbl  25 cols 000000000001001010110010000011100011111111 has  69 unique lines.
 *  68  69  69  69  69  69  69  66  68  68  67   x  65  68      64      61          69  69      69  61  62  69  65              68  68  67                                  kill col 24  Tbl  24 cols 000000000001001011110010000011100011111111 has  61 unique lines.
 *  60  61  59  61  60  61  61  58  60  60  59   x  57  60      57                  61  61      61  55  55  61  58              60  60  59                                  kill col 17  Tbl  23 cols 000000000001001011110010100011100011111111 has  55 unique lines.
 *  54  53  53  55  54  55  55  52  54  54  53   x  51  54      50                  55  55      55      51  55  52              54  54  53                                  kill col 26  Tbl  22 cols 000000000001001111110010100011100011111111 has  50 unique lines.
 *  49  48  48  50  49  50  50  47  49  49  48   x  46  48                          49  50      49      46  50  47              49  49  48                                  kill col 29  Tbl  21 cols 000000000001101111110010100011100011111111 has  46 unique lines.
 *  45  44  38  46  45  46  46  44  45  45  44   x      43                          45  45      45      41  46  42              45  45  44                                  kill col 39  Tbl  20 cols 001000000001101111110010100011100011111111 has  38 unique lines.
 *  37  35      38  37  38  38  36  37  37  36   x      33                          37  36      37      34  38  35              37  37  36                                  kill col 28  Tbl  19 cols 001000000001111111110010100011100011111111 has  33 unique lines.
 *  32  29      33  32  33  33  31  32  32  30   x                                  32  31      32      29  33  31              32  32  31                                  kill col 40  Tbl  18 cols 011000000001111111110010100011100011111111 has  29 unique lines.
 *  27          29  28  28  29  27  27  28  27   x                                  28  27      28      25  29  27              28  28  27                                  kill col 16  Tbl  17 cols 011000000001111111110010110011100011111111 has  25 unique lines.
 *  23          24  24  23  25  23  23  24  23   x                                  23  22      24          25  24              24  24  23                                  kill col 20  Tbl  16 cols 011000000001111111110110110011100011111111 has  22 unique lines.
 *  20          21  21  20  22  20  20  21  21   x                                  21          21          22  21              21  21  20                                  kill col 41  Tbl  15 cols 111000000001111111110110110011100011111111 has  20 unique lines.
 *              19  19  18  20  18  18  19  19   x                                  19          19          20  19              19  19  18                                  kill col 36  Tbl  14 cols 111001000001111111110110110011100011111111 has  18 unique lines.
 *              17  16      18  16  16  17  17   x                                  17          17          18  17              17  17  16                                  kill col 37  Tbl  13 cols 111011000001111111110110110011100011111111 has  16 unique lines.
Possible good candidates for removal, columns : 8 33 34 
 *
 * Round 1: 000100111110000000001001001100011100000000  4 columns for indexes to table representing 13 original columns (uses 16 of 16 lines in indirect table).
 * Direct:  111011000000111111110110110011100011111111 28 columns
 * Success. Use 2 EBRs, 13 LUTs.
 */

module v3_m_2ebr
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
    * 00 LB_0     LB_1     0 0000011000000110101111000000| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 0001001000000101111110011101|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 0010011010000110111111001011| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 _L0x03   StdIncPc 0 000000100000000101x10xxx1110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 0 0000000000100001011101001110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   0 000000100000000101x01xxx0000| AUIPC  q = imm20 (copy x/2)
    * 06 LB_3     LB_4     0 0000001000000011011110100000|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     0 0000001000000010111110110000|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     0 0000000001000111001111000101| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     0 0000001000000010111110001000|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     0 0000000001000111001111000101| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    3 0011000001100001011100111000|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   0 0000001000000111011110010000| ADD    add     Addition Q = RS1
    * 0d _L0x0d   StdIncPc 0 0000000000100001011101101110| LUI    q = imm20
    * 0e SUB_0    SUB_1    0 000000100000011101x10xxx0001| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 0 0000000000100001011101101110| LUI    q = imm20
    * 10 SUB_1    LB_6     0 0000001000000111111110001000|        Q = ~RS2
    * 11 AND_1    ANDI_1   0 0000001000000111011110000001|        RS1^0xffffffff to Q
    * 12 _L0x12   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 13 condb_2  condb_3  0 0000001000000111111110000001|        ~RS2 in Q
    * 14 condb_3  condb_4  4 0100001000000001011111000001|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  5 0101000001000110011110010001|        Branch on condition
    * 16 condb_5  Fetch    6 0110010001010110110011101101|        Branch not taken.
    * 17 condb_5t BrOpFet  3 0011010001010110111111000111|        Branch taken.
    * 18 BEQ      condb_2  0 0000000001100111011101100001| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   0 0000000001100101011101000100| JALR   yy=RS1+imm
    * 1a ANDI_1   StdIncPc 0 0000000000100001011100111110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    3 0011001000000001011011100011| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 2 0010001000000101111011101010| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 0 0000000000100001011101111110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 4 0100001000000101010111001101|        Q = 4
    * 1f IJ_2     IJ_3     0 0000000001100101011101101011|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     2 0010010001100110101111000101| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 0 0000000000100001011100001110|        rd = Iimm ^ RS1
    * 22 _L0x22   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 23 _L0x23   StdIncPc 0 000000100000000101x10xxx1110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   7 01110010000001111010x1100011| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   0 000000100000000101x01xxx0000| AUIPC  q = imm20 (copy x/2)
    * 26 OR_1     OR_2     0 0000000001000111011100000010|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    0 0000001000000000011111000001|        Q = rs2
    * 28 _L0x28   SH_1     2 0010000001000111001111001001| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   0 0000001000000111011110000010|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     2 0010000001000111001111001001| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  4 0100001000000xxxx11101000011|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    0 000000100000011101x0xxxx0011| SLL    Shift left
    * 2d _L0x2d   StdIncPc 0 0000000000100001011101101110| LUI    q = imm20
    * 2e unx2e             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| 2e: Not in use 
    * 2f _L0x2f   StdIncPc 0 0000000000100001011101101110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 8 1000000000100001011101101110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  0 0000001000000111111110000010|        ~rs2 to Q
    * 32 JAL_1    JAL_2    0 0000000001100001011101001000|        Target adr to yy
    * 33 JAERR_1  JAERR_2  0 00000000011110010110x1001000|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    9 1001010001010110111010011101|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   7 0111000000100101111110010011|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   a 1010000000100101111111010000|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  5 0101000001101xxxx11100011101|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  0 0000000001100111011101100001| BNE    Conditional Branch. Offset to Ryy
    * 39 _L0x39   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 3a SRxI_1   SRxI_2   b 1011000000100101011110010011|        Register to shift to Q
    * 3b _L0x3b   JAL_1    3 0011001000000001011011100011| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  0 0000000001100011011101100100| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   c 1100000000100101011110010000|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   7 01110010000001111010x0010011|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   7 01110010000001111010x0010011|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     3 0011011000000110111111000101| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   4 0100001000000110011111000000|        Q=1
    * 42 _L0x42   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 43 _L0x43   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 44 SLTI_0   SLTIX_1  0 0000001000000111111110100010| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    4 0100001000000101011111000110|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    0 00000000011011010110x0010100|        Store PC to mepc
    * 47 ILL_2    ILL_3    0 0000000001111101011100011000|        Store 0 to mtval
    * 48 _L0x48   SW_1     3 0011111000000111011111000110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  4 0100001000000001011111000100|        Construct PC storage adr
    * 4a _L0x4a   SW_1     3 0011111000000111011111000110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  0 0000000100011101011010011011|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   0 000000100000011101x10xxx0011| SLT    Set less than (signed)
    * 4d unx4d             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| 4d: Not in use 
    * 4e eILL0b   ILLe     0 0000001000000xxxx1x0xxxx1111| Illegal instruction seen
    * 4f MRET_8   StdIncPc 4 0100001000000101011111001110|        Prep +4
    * 50 LW_1     StdIncPc d 1101000000100101111100011110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   0 0000000001111101011011101101|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 0001001000000101111110010101|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   0 0000000001111101011011101101|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     c 1100001000000101011110011110|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 0 0000000001111101011101100001|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     0 0000001000000100011110110101|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     0 0000001000000100011110001000|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 _L0x58   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 59 _L0x59   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 5a SB_1     SB_2     7 0111000001100101111110010101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    3 0011001000000001011011100011| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRW_1  0 0000000001100011011101100100| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     a 1010000001100101111111011111|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 0001001000000101111110010111|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   0 0000000001111101011011101101|  err   LD AlignFault. Faulting adr to mtval
    * 60 _L0x60   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 61 EBRKWFI2 EBREAK_1 5 0101000001000011011100101111| EBREAK/WFI2 Select EBREAK or WFI
    * 62 _L0x62   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 63 _L0x63   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 64 SLTIU_0  SLTIX_1  0 0000001000000111111110100010| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    5 010100100000000101x10xxx1110|        Prepare read PC
    * 66 SW_1     SW_2     0 0000000000011111011010011111|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    0 00000000011110010110x1101001|        Store faulting address alignment to mtval
    * 68 _L0x68   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 69 unx69             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| 69: Not in use 
    * 6a _L0x6a   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 6b SB_4     SB_5     0 0000111000010110011110010111|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   0 000000100000011101x10xxx0011| SLTU   Set less than (unsigned)
    * 6d unx6d             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| 6d: Not in use 
    * 6e unx6e             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| 6e: Not in use 
    * 6f MRET_6   MRET_7   4 0100001000000xxxx11111001100|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    c 1100001000000101011110011011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 0 0000000001111101011101100001|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   0 0000001000000011011110100001|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  0 0000000001111110011100010111|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   e 1110001000000101111101101111| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  0 000000100000000101x0xxxx0111|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  0 0000001000000001011110000111|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  4 01000000011011010110x1000111|        origPC to mepc. Prep read 0
    * 78 _L0x78   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 79 _L0x79   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 7a SB_5     SW_2     0 0000000000010110011010011111|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    3 0011001000000001011011100011| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRW_1  0 0000000001100011011101100100| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  JAL_3    0 00000001111101001110x0010011|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    0 0000000001101xxxx11100011001|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  0 00000000011111010110x0010111|        mtval is target
    * 80 LBU_0    LBU_1    0 0000011000000110101111001000| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  0 00000000011011010110x0010111|        Store PC to mepc
    * 82 _L0x82   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 83 _L0x83   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 84 XORI_0   XORI_1   0 0000001000000111111110100010| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 0001001000000101111110011111|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   4 01000000001000010100x1001001|        Return address to TRG
    * 87 JALRE1   JALRE2   0 00000000011011100110x0010111|  err   Store pc to mepc
    * 88 _L0x88   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 89 unx89             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| 89: Not in use 
    * 8a _L0x8a   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 8b LB_6     StdIncPc 4 0100000000100001011101001110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    0 000000100000011111x10xxx0010| XOR    xor
    * 8d unx8d             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| 8d: Not in use 
    * 8e _LCSRRS_1 ILLe     0 0000001000000xxxx1x0xxxx1111| Illegal instruction seen
    * 8f ILL_3    ILL_4    4 0100001000000101011111001010|        Q = 1
    * 90 NMI_2    JAL_3    0 0000000111111010011101100011|        mtval = 0.
    * 91 LDAF_2   LDAF_3   4 01000001111100010100x1001001|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    0 00000000011011001110x0010011|        PC to mepc
    * 93 SW_E2    SW_E3    0 0000000001101101111100011001|        Store address that faulted
    * 94 SW_E4    JAL_3    0 00000001111101001110x1010011|        Store 6 to mcause
    * 95 SW_E3    SW_E4    4 0100001000000101110111001001|        Q = 3
    * 96 SH_1     SH_2     7 0111000001100101111110011011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    0 00000000011110010110x1101001|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  0 0000000001100111011101100001| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    0 00000001111101001100x1000011|        mcause = 11
    * 9b SH_4     SH_5     0 0000111000001110011110011001|        Address back to Q. Prepare get item to write
    * 9c _L0x9c   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * 9d unx9d             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| 9d: Not in use 
    * 9e JAL_25   JAL_3    0 00000000010001100110x0010011|        Instr. adr. to jj in case of access error
    * 9f SH_5     SW_2     0 0000000000001110011010011111|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    2 0010010001100110101111000101| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  4 0100001000000101010111001011|        Q = 4
    * a2 _L0xa2   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * a3 _L0xa3   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * a4 SRxI_0   SRxI_1   7 01110010000001111010x1100011| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   4 0100001000000011011111001010|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  3 0011001000000101111011101101| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 0 0000001000000xxxx11111000110| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 _L0xa8   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * a9 ILL_4    JAL_3    4 01000001111101001110x1000011|        Store 2 to mcause
    * aa _L0xaa   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * ab EBREAK_2 ECALL_6  0 0000000001101101011100011001|        pc to mepc
    * ac _L0xac   SRx_1    0 000000100000011101x0xxxx0011| SRx    Shift Right (both SRL and SRA)
    * ad unxad             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| ad: Not in use 
    * ae _L0xae   SRx_1    0 000000100000011101x0xxxx0011| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   4 0100001000000xxxx11111001100|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   0 00000001111100010100x1001001|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  4 0100001000000101010111001011|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    6 0110010001000110110011001101|        IncPC, OpFetch, but force +4
    * b3 unxb3             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 eFetch3           4 0100000001001111111111000000|  Fr11  Write minstret. Update I. Q=immediate, use dinx
    * b5 SH_3     SH_4     0 0000001000000000011101101001|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  4 0100001000000101010111001001|        Q = 8
    * b7 IJ_3     IJ_4     0 0000001000000110010111001011|        Construct Q = 3
    * b8 BGE      condb_2  0 0000000001100111011101100001| BGE    Conditional Branch. Offset to Ryy
    * b9 _L0xb9   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * ba LHU_3    ANDI_1   0 0000001000000011111110100001|        Invert q. Prepare read mask
    * bb SH_2     SH_3     a 1010000001100101111111011011|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  0 0000000001100011011101100100| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    9 1001011000000110111010111101|        Mask and use as PC
    * be IJ_1     IJ_2     9 1001001000000101111110010001|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    9 1001001000000101111110011100|        Exit CSR, enter trap
    * c0 _L0xc0   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * c1 IJT_2    IJT_3    0 0000000001100101011101101110|        Read word is to be masked with ~3u
    * c2 _L0xc2   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * c3 _L0xc3   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * c4 ORI_0    ORI_1    0 0000000001000111111100101110| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   0 0000001000000000011110100110|        ~302
    * c6 IJT_4    ILL_2    0 0000000001101101011110110100|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   0 0000000001101xxxx11100011100|        Store pc to mepc.
    * c8 _L0xc8   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * c9 MRET_2   MRET_3   0 0000001000000011010111001010|        0xff+3 = 0x102
    * ca _L0xca   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * cb QINT_2   StdIncPc 0 0000000111111010011101101110|        mtval = 0.
    * cc OR_0     OR_1     0 000000100000011111x10xxx0010| OR     or
    * cd unxcd             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| cd: Not in use 
    * ce _LCSRRCI_1 ILLe     0 0000001000000xxxx1x0xxxx1111| Illegal instruction seen
    * cf MRET_7   MRET_8   5 010100100000001101x10xxx0100|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  4 0100001000000001011111000011| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   0 0000000001000011011101101100| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     c 1100001000000101011110010000|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 0 0000000001111101011101100001|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   4 01000001111100010110x1001001|        Store 5 to mcause
    * d5 unxd5             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| d5: Not in use
    * d6 eILL0c   ILLe     0 0000001000000xxxx1x0xxxx1111| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  0 0000000001111101011101101010|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  0 0000000001100111011101100001| BLTU   Conditional Branch. Offset to Ryy
    * d9 _L0xd9   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * da LDAF_a   LDAF_2   0 000000100000010101x10xxx1001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   4 01000000011100000110x1001001|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  0 0000000001100011011101100100| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  0 0000000001111101011101101110|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   e 1110000001010101111101101111|  Fr11  Read and latch instruction
    * df eFetch   Fetch2   e 1110000001010101111101101111|  Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 _L0xe0   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * e1 ORI_1    ORI_2    0 0000001000000000011110010001|        Q = RS1
    * e2 _L0xe2   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * e3 _L0xe3   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * e4 ANDI_0   ANDI_1   0 0000001000000111111110100001| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  4 0100001000000101010111001011|        Q = 4
    * e6 StdIncPc Fetch    6 0110010001000110110011001101|  Fr11  IncPC, OpFetch
    * e7 aFault   aFault_1 0 0000000001111101011101100001|  err   Load access fault. Faulting adr to mtval
    * e8 _L0xe8   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * e9 IJT_3    IJT_4    0 0000001000000110010111001100|        Construct Q = 3
    * ea _L0xea   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * eb LH_3     LH_4     0 0000001000000011111110100101|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    0 000000100000011111x10xxx0001| AND    And 
    * ed unxed             7 0111xxxxxxxxxxxxxxxxxxxxxxxx| ed: Not in use
    * ee eILL0a   ILLe     0 0000001000000xxxx1x0xxxx1111| Illegal instruction seen
    * ef WFI_5    Fetch    6 0110010001010110110011001101|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    c 1100001000000101011110010111|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 0 0000000001111101011101100001|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 0 000000100000000101x10xxx1110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  0 0000001000000xxxx1x01xxx1101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   eFetch3  f 1111000001011000111101001011|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 0 0000000001111101011101101101|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    4 0100001000000000010111001111| WFI    Chk offset=0x105. Now=0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 0 0000000001111001011101101010| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  0 0000000001100111011101100001| BGEU   Conditional Branch. Offset to Ryy
    * f9 _L0xf9   ILLe     0 0000001000000xxxx1x0xxxx1111|  Not in use (illegal as entry)
    * fa WFI_2    WFI_3    4 0100001000000101011111000100|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     0 0000001000000000011101100110|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  0 0000000001100011011101100100| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    0 000000100000000101x10xxx0111| NMI    Get current PC
    * fe ILLe     ILL_1    0 000000100000000101x0xxxx0100| Illegal
    * ff QINT_0   QINT_1   0 000000100000000101x10xxx1100| INT    Get current PC
    */
   localparam u0_0 = 256'h76e6501076e6790473863c5af88b3c5afb097a07480474e650e6fcbef9d2bc01;
   localparam u0_1 = 256'h76b75cd477e6eea66e3273e674417613fc74cede79167c15f81440fe781af88b;
   localparam u0_2 = 256'h76e6000076e6403e74303c9678213c967c1d70274804a63550e640fe70e6bc52;
   localparam u0_3 = 256'ha13aa135790376496e32793d40fe761371d7fd03f936e9de64817486f82b76e6;
   localparam u0_4 = 256'h7ce640fe0000503169b17c667c4b7c66718f61477c65fa2b40fe40fe7c0bfc50;
   localparam u0_5 = 256'h6edaf970fdfb76496e32f95d40fe40fe788b7b57761e79eb6edaf9546edaf1e6;
   localparam u0_6 = 256'h7ccf000000005031797a40fe000040fe669369f250effa2b40fe40fe72f740fe;
   localparam u0_7 = 256'h617d7190e13476496e3269f240fe40fe647d78774073f6f471767a1a761e79ba;
   localparam u0_8 = 256'h7ca940fe0000d02974e640fe000040fe617f449ef9f0fa2140fe40fe617dbc85;
   localparam u0_9 = 256'h69f26134000040fe799fc43440fe76136693f9bbdc94e534f195e13444927634;
   localparam u0_A = 256'h7cc5403f0000403f719a40fee43440fe7c61eed07cafa63a40fe40fe5cb6bc5e;
   localparam u0_B = 256'hf9c1f91febde7649fdb5fa1a40fe76135cbd5c9a769bfc000000ccde5cb24492;
   localparam u0_C = 256'h504f40fe0000d02676e640fe5ca540fe71cb7b477a6ff2e140fe40fe76e940fe;
   localparam u0_D = 256'hf6f4f6f476e576496492509140fe761376a140fe00006492761e790676c97c37;
   localparam u0_E = 256'hccde40fe0000d011fa5640fe5cc640fe761eccde5cb0fa1a40fe40fe791d40fe;
   localparam u0_F = 256'h50c74046507e7649766b7c4540fe761376ab5cfa76dbf4b448dd50e6761e7972;
   localparam u1_0 = 256'h0021020700210207306100470202004702020203020100210201268612050606;
   localparam u1_1 = 256'h0065420500212205320100210065006734566456504642010207020002070207;
   localparam u1_2 = 256'h0021700000210207420020470207204702000047020172070201020000212466;
   localparam u1_3 = 256'h72077207c02500633201b025020000675068a025702594560079006102078021;
   localparam u1_4 = 256'h4205020070000207011d3e0742013e07007d006d420502070200020042063606;
   localparam u1_5 = 256'h007d1205a0650063320170650200020002040204007dc205007d1205007dd025;
   localparam u1_6 = 256'h42007000700002070e160200700002000079001f520102070200020050430200;
   localparam u1_7 = 256'h007d006801f400633201001602000200406d02010201e205007e0203007dc205;
   localparam u1_8 = 256'h42050200700002074021020070000200006e40211205020702000200006d0606;
   localparam u1_9 = 256'h000e0046700002000e0e01f40200006700797065420501f4006d006c41f101fa;
   localparam u1_A = 256'h4200020770000207006d020041f4020002003205420372070200020042052466;
   localparam u1_B = 256'h9205920596060063a065020302000067020642050200404f70006446420501f1;
   localparam u1_C = 256'h520302007000020701fa0200020302000068006d020000470200020000650200;
   localparam u1_D = 256'he055e055007d00634070020502000067007d0200700041f1007dc20500434201;
   localparam u1_E = 256'h64560200700002070203020002060200007d6446420502070200020002000200;
   localparam u1_F = 256'h0201020102010063020042050200006700794200007df05802000201007dc205;
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
   assign d[36] = indir[23];
   assign d[37] = indir[24];
   assign d[39] = indir[25];
   assign d[40] = indir[26];
   assign d[41] = indir[27];
   // replaces = 000100111110000000001001001100011100000000
   SB_LUT4 #(.LUT_INIT(16'h1802)) cmb_d08(.O(d[8]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0150)) cmb_d09(.O(d[9]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0050)) cmb_d10(.O(d[10]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d14(.O(d[14]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4000)) cmb_d15(.O(d[15]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h8000)) cmb_d18(.O(d[18]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'he37f)) cmb_d21(.O(d[21]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h000c)) cmb_d31(.O(d[31]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0008)) cmb_d32(.O(d[32]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h6242)) cmb_d33(.O(d[33]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1400)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4002)) cmb_d35(.O(d[35]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h6000)) cmb_d38(.O(d[38]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[42] = 1'b0;
   assign d[43] = 1'b0;
   assign d[44] = 1'b0;
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
wire instrxxxx0100,instr1011xxxx,instr10110100;          bn_l4v #(.I(16'h0010)) leq0100(     .o(instrxxxx0100),     .i({minx[3:0]}));  bn_l4v #(.I(16'h0800)) leq1011(     .o(instr1011xxxx),     .i({minx[7:4]}));  bn_l4v #(.I(16'h8888)) leq1x110100( .o(instr10110100), .i({2'b0,instr1011xxxx,instrxxxx0100}));   SB_DFFE reg_d18( .Q(d[30]), .C(clk), .E(progress_ucode), .D(instr10110100));
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   No RVC
 *   MULDIV included
 *   minstret not implemented
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 45 columns
 * Removed:  000000000000001000000000001000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 000000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 45
 * 210 distinct lines in remaining untreated columns
 * c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 210 209 210 210 210 210 210 210 210 210 210 210 210 210   x 210 210 208 210 209 210 209 209 210 210 210   x 210 210 210 210 208 208 208 210 209 210 209 210 209 210 210 209 208 209  kill col 27  Tbl  42 cols 000000000000001001000000001000000000000000000 has 208 unique lines.
 * 208 207 208 208 208 208 208 208 208 208 208 208 208 208   x 208 208     207 207 208 206 207 208 208 208   x 208 208 208 208 206 206 206 208 207 208 207 208 207 208 208 207 206 207  kill col 23  Tbl  41 cols 000000000000001001000100001000000000000000000 has 206 unique lines.
 * 206 205 206 206 206 206 206 206 206 206 206 206 206 206   x 206 206     205 204 206     205 206 206 206   x 206 206 206 206 204 204 204 206 205 206 205 206 205 206 206 205 204 205  kill col 25  Tbl  40 cols 000000000000001001010100001000000000000000000 has 204 unique lines.
 * 204 203 204 204 204 204 204 204 204 204 204 204 204 204   x 204 204     203     204     203 204 204 204   x 204 204 204 204 202 201 202 204 203 204 202 204 203 204 204 203 202 203  kill col 12  Tbl  39 cols 000000000000001001010100001000001000000000000 has 201 unique lines.
 * 201 200 200 201 201 201 201 201 201 201 201 201 201 201   x 201 201     200     201     199 201 201 201   x 201 201 201 201 198     199 201 200 201 199 201 200 201 201 200 199 200  kill col 13  Tbl  38 cols 000000000000001001010100001000011000000000000 has 198 unique lines.
 * 198 197 197 198 198 198 198 198 198 198 198 198 198 198   x 198 198     197     198     196 198 198 198   x 198 198 198 198         195 198 197 198 196 198 197 197 198 197 196 197  kill col 11  Tbl  37 cols 000000000000001001010100001000011100000000000 has 195 unique lines.
 * 195 194 193 195 195 195 195 195 195 195 195 195 195 195   x 195 195     194     195     193 195 195 195   x 195 195 195 195             195 194 195 193 195 193 193 195 194 193 194  kill col 42  Tbl  36 cols 001000000000001001010100001000011100000000000 has 193 unique lines.
 * 193 191     193 193 193 193 193 193 193 193 193 193 193   x 193 193     192     193     191 193 193 192   x 193 193 193 193             193 192 193 191 193 191 191 193 192 191 192  kill col 43  Tbl  35 cols 011000000000001001010100001000011100000000000 has 191 unique lines.
 * 191         191 191 191 191 191 191 191 191 191 191 191   x 191 191     190     191     189 191 191 189   x 191 191 191 191             190 190 191 189 191 189 189 191 190 189 189  kill col 22  Tbl  34 cols 011000000000001001010110001000011100000000000 has 189 unique lines.
 * 189         189 189 189 189 189 189 189 189 189 189 189   x 189 189     188     188         189 189 187   x 189 189 189 189             188 188 188 187 188 186 186 189 188 187 186  kill col  5  Tbl  33 cols 011000000000001001010110001000011100000100000 has 186 unique lines.
 * 186         186 186 186 186 186 186 186 186 186 186 186   x 186 186     185     185         186 186 184   x 185 186 186 186             183 185 185 180 181     183 183 182 180 182  kill col  7  Tbl  32 cols 011000000000001001010110001000011100010100000 has 180 unique lines.
 * 180         180 180 180 180 180 180 180 180 179 180 180   x 180 179     179     175         180 180 178   x 177 180 180 180             178 179 179     175     177 175 172 174 176  kill col  2  Tbl  31 cols 011000000000001001010110001000011100010100100 has 172 unique lines.
 * 172         172 172 172 172 172 172 172 172 171 172 172   x 172 171     170     165         172 172 168   x 168 170 172 172             170 171 170     164     167 164     163 165  kill col  1  Tbl  30 cols 011000000000001001010110001000011100010100110 has 163 unique lines.
 * 161         163 163 163 163 163 163 163 162 161 163 163   x 163 162     158     153         161 163 159   x 156 159 163 163             161 161 160     149     153 148         153  kill col  3  Tbl  29 cols 011000000000001001010110001000011100010101110 has 148 unique lines.
 * 146         148 148 148 148 148 148 148 146 146 148 148   x 147 147     144     138         145 148 142   x 139 141 148 145             146 146 145     127     132             132  kill col  6  Tbl  28 cols 011000000000001001010110001000011100011101110 has 127 unique lines.
 * 124         127 127 127 127 127 127 127 125 125 127 125   x 126 126     123     112         123 127 120   x 118 118 127 123             125 125 122             109             109  kill col  4  Tbl  27 cols 011000000000001001010110001000011100011111110 has 109 unique lines.
 * 105         108 109 109 109 109 109 109 106 108 108 107   x 107 107     105      96         103 109 102   x 101 101 109 104             107 107 104                              91  kill col  0  Tbl  26 cols 011000000000001001010110001000011100011111111 has  91 unique lines.
 *  87          90  91  91  91  91  91  91  87  90  90  89   x  88  90      86      83          85  91  85   x  84  84  91  86              89  89  86                                  kill col 24  Tbl  25 cols 011000000000001001011110001000011100011111111 has  83 unique lines.
 *  78          82  83  82  83  82  83  83  79  82  82  81   x  80  81      78                  77  83  77   x  77  74  82  79              81  81  78                                  kill col 16  Tbl  24 cols 011000000000001001011110001010011100011111111 has  74 unique lines.
 *  70          73  74  73  74  73  74  74  70  73  73  72   x  70  71      68                  67  73  66   x  69      73  70              72  72  69                                  kill col 19  Tbl  23 cols 011000000000001001011110011010011100011111111 has  66 unique lines.
 *  62          65  66  64  66  65  66  66  62  65  65  64   x  61  63      60                  60  65       x  60      65  63              64  64  62                                  kill col 26  Tbl  22 cols 011000000000001001111110011010011100011111111 has  60 unique lines.
 *  56          59  60  58  60  59  60  60  56  59  59  58   x  55  57                          54  59       x  54      59  57              58  58  56                                  kill col 21  Tbl  21 cols 011000000000001001111111011010011100011111111 has  54 unique lines.
 *  51          53  54  52  54  53  54  54  50  53  53  52   x  50  51                              51       x  48      53  51              52  52  51                                  kill col 17  Tbl  20 cols 011000000000001001111111011110011100011111111 has  48 unique lines.
 *  46          47  45  46  48  47  48  48  44  47  47  46   x  43  44                              45       x          47  45              46  46  45                                  kill col 29  Tbl  19 cols 011000000000001101111111011110011100011111111 has  43 unique lines.
 *  41          42  40  36  43  42  43  43  40  42  42  41   x      40                              41       x          42  40              41  41  40                                  kill col 39  Tbl  18 cols 011001000000001101111111011110011100011111111 has  36 unique lines.
 *  34          35  33      36  35  36  36  33  35  35  34   x      30                              34       x          35  34              34  34  33                                  kill col 28  Tbl  17 cols 011001000000001111111111011110011100011111111 has  30 unique lines.
 *  28          29  26      29  29  29  30  28  29  29  27   x                                      28       x          29  29              28  28  28                                  kill col 40  Tbl  16 cols 011011000000001111111111011110011100011111111 has  26 unique lines.
 *  24          24          25  25  24  26  24  24  25  24   x                                      24       x          25  25              24  24  24                                  kill col 44  Tbl  15 cols 111011000000001111111111011110011100011111111 has  24 unique lines.
 *              22          23  23  22  24  22  22  23  22   x                                      22       x          23  23              22  22  22                                  kill col 41  Tbl  14 cols 111111000000001111111111011110011100011111111 has  22 unique lines.
 *                          21  21  20  22  20  20  21  20   x                                      20       x          21  21              20  20  20                                  kill col 36  Tbl  13 cols 111111001000001111111111011110011100011111111 has  20 unique lines.
 *                          19  18      20  18  18  19  18   x                                      18       x          19  19              18  18  18                                  kill col 37  Tbl  12 cols 111111011000001111111111011110011100011111111 has  18 unique lines.
 *                          17          18  16  16  17  16   x                                      16       x          17  17              16  16  16                                  kill col 34  Tbl  11 cols 111111011010001111111111011110011100011111111 has  16 unique lines.
Possible good candidates for removal, columns : 8 9 10 20 31 33 
 *
 * Round 1: 000000100101110000000000100001100011100000000  4 columns for indexes to table representing 11 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 38
 * 209 distinct lines in remaining untreated columns
 * c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 209 206 209 209 209 209   x 209 209   x 209   x   x   x   x 209 209 207 209 207 209 208 208 209   x 207   x 209 209   x   x 207 207 207   x   x   x 208 209 208 209 209 208 207 208  kill col 43  Tbl  31 cols 010000100101111000000000101001100011100000000 has 206 unique lines.
 * 206     206 206 206 206   x 206 206   x 206   x   x   x   x 206 206 204 206 204 206 205 205 206   x 204   x 206 206   x   x 204 204 204   x   x   x 205 206 205 206 206 205 204 205  kill col 27  Tbl  30 cols 010000100101111001000000101001100011100000000 has 204 unique lines.
 * 204     204 204 204 204   x 204 204   x 204   x   x   x   x 204 204     203 202 204 202 203 204   x 202   x 204 204   x   x 202 202 202   x   x   x 203 204 203 204 204 203 202 203  kill col 25  Tbl  29 cols 010000100101111001010000101001100011100000000 has 202 unique lines.
 * 202     202 202 202 202   x 202 202   x 202   x   x   x   x 202 202     201     202 199 200 202   x 200   x 202 202   x   x 200 199 200   x   x   x 201 202 201 202 202 201 200 201  kill col 23  Tbl  28 cols 010000100101111001010100101001100011100000000 has 199 unique lines.
 * 199     199 199 199 199   x 199 199   x 199   x   x   x   x 199 199     198     199     197 199   x 197   x 199 199   x   x 197 196 197   x   x   x 197 199 198 199 198 197 197 198  kill col 12  Tbl  27 cols 010000100101111001010100101001101011100000000 has 196 unique lines.
 * 196     194 196 196 196   x 196 196   x 196   x   x   x   x 196 196     195     196     193 196   x 194   x 196 196   x   x 193     194   x   x   x 194 196 195 196 195 194 194 195  kill col 22  Tbl  26 cols 010000100101111001010110101001101011100000000 has 193 unique lines.
 * 193     191 193 193 193   x 193 193   x 193   x   x   x   x 193 193     192     192         193   x 191   x 193 193   x   x 189     191   x   x   x 191 192 191 193 192 191 190 191  kill col 13  Tbl  25 cols 010000100101111001010110101001111011100000000 has 189 unique lines.
 * 189     187 189 189 189   x 189 189   x 189   x   x   x   x 189 189     188     188         189   x 187   x 189 189   x   x         186   x   x   x 185 188 185 188 188 187 186 187  kill col  7  Tbl  24 cols 010000100101111001010110101001111011110000000 has 185 unique lines.
 * 185     182 185 185 185   x 185 185   x 185   x   x   x   x 185 184     184     183         185   x 183   x 184 184   x   x         182   x   x   x     184 180 183 183 181 182 182  kill col  5  Tbl  23 cols 010000100101111001010110101001111011110100000 has 180 unique lines.
 * 180     174 180 180 180   x 180 180   x 180   x   x   x   x 180 179     179     176         180   x 178   x 178 179   x   x         176   x   x   x     177     178 175 173 173 176  kill col  2  Tbl  22 cols 010000100101111001010110101001111011110100100 has 173 unique lines.
 * 173     166 173 173 173   x 173 173   x 173   x   x   x   x 173 172     172     167         173   x 170   x 170 171   x   x         166   x   x   x     165     170 165     164 166  kill col  1  Tbl  21 cols 010000100101111001010110101001111011110100110 has 164 unique lines.
 * 162     157 164 164 164   x 164 164   x 163   x   x   x   x 163 162     162     157         163   x 161   x 161 161   x   x         153   x   x   x     148     155 149         153  kill col  6  Tbl  20 cols 010000100101111001010110101001111011111100110 has 148 unique lines.
 * 146     138 148 147 148   x 148 148   x 147   x   x   x   x 145 145     145     138         146   x 145   x 144 144   x   x         137   x   x   x             132 125         132  kill col  3  Tbl  19 cols 010000100101111001010110101001111011111101110 has 125 unique lines.
 * 122     112 125 123 125   x 125 124   x 123   x   x   x   x 121 122     122     112         123   x 118   x 116 119   x   x         111   x   x   x             103             102  kill col  0  Tbl  18 cols 010000100101111001010110101001111011111101111 has 102 unique lines.
 *  97      89 101 100 102   x 102 101   x 100   x   x   x   x  98  98      96      89          98   x  94   x  93  93   x   x          91   x   x   x              80                  kill col  4  Tbl  17 cols 010000100101111001010110101001111011111111111 has  80 unique lines.
 *  76      68  79  78  80   x  80  79   x  77   x   x   x   x  75  77      74      70          76   x  74   x  73  73   x   x          71   x   x   x                                  kill col 42  Tbl  16 cols 011000100101111001010110101001111011111111111 has  68 unique lines.
 *  65          67  66  68   x  68  67   x  65   x   x   x   x  64  65      62      59          65   x  63   x  60  61   x   x          57   x   x   x                                  kill col 11  Tbl  15 cols 011000100101111001010110101001111111111111111 has  57 unique lines.
 *  54          56  55  57   x  57  56   x  54   x   x   x   x  54  54      51      49          53   x  51   x  46  50   x   x               x   x   x                                  kill col 17  Tbl  14 cols 011000100101111001010110101101111111111111111 has  46 unique lines.
 *  43          45  43  45   x  46  45   x  43   x   x   x   x  41  42      41      40          42   x  38   x      40   x   x               x   x   x                                  kill col 19  Tbl  13 cols 011000100101111001010110111101111111111111111 has  38 unique lines.
 *  35          37  35  37   x  38  37   x  35   x   x   x   x  33  34      33      33          34   x       x      33   x   x               x   x   x                                  kill col 29  Tbl  12 cols 011000100101111101010110111101111111111111111 has  33 unique lines.
 *  30          32  30  29   x  33  32   x  31   x   x   x   x      29      29      28          28   x       x      28   x   x               x   x   x                                  kill col 24  Tbl  11 cols 011000100101111101011110111101111111111111111 has  28 unique lines.
 *  25          27  25  24   x  27  27   x  26   x   x   x   x      23      23                  22   x       x      21   x   x               x   x   x                                  kill col 16  Tbl  10 cols 011000100101111101011110111111111111111111111 has  21 unique lines.
 *  19          20  18  18   x  20  20   x  19   x   x   x   x      17      17                  17   x       x           x   x               x   x   x                                  kill col 28  Tbl   9 cols 011000100101111111011110111111111111111111111 has  17 unique lines.
 *  15          16  15  13   x  16  15   x  15   x   x   x   x              14                  14   x       x           x   x               x   x   x                                  kill col 39  Tbl   8 cols 011001100101111111011110111111111111111111111 has  13 unique lines.
Possible good candidates for removal, columns : 21 26 
 *
 * Round 2: 100110011010000000100001000000000000000000000  4 columns for indexes to table representing  8 original columns (uses 13 of 16 lines in indirect table).
 * Direct:  011001000000000111011110010110011100011111111 24 columns
 * Success. Use 2 EBRs, 19 LUTs.
 */

module v4_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    *                      indirect_index 1
    * inx         next     | indirect index 0
    * || ucode    ucode    | | direct representation
    * 00 LB_0     LB_1     0 0 000000000110001101111100| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 000100010010001011111001|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 001000100110001101111100| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 _L0x03   StdIncPc 1 3 000100110010000010x10xxx| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 1 3 000100110100100010110100| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   1 3 000100110010000010x01xxx| AUIPC  q = imm20 (copy x/2)
    * 06 LB_3     LB_4     1 3 000100110010000110111010|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     1 3 000100110010000101111011|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     1 0 000100000101001110111100| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     1 3 000100110010000101111000|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     1 0 000100000101001110111100| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    1 4 000101000001100010110011|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   1 3 000100110010001110111001| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    1 3 000100111010001110x10xxx| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    1 3 000100110010001110x10xxx| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 1 3 000100110000100010110110| LUI    q = imm20
    * 10 SUB_1    LB_6     1 3 000100110010001111111000|        Q = ~RS2
    * 11 AND_1    ANDI_1   1 3 000100110010001110111000|        RS1^0xffffffff to Q
    * 12 _L0x12   ILLe     1 3 00010011001000xxxxx0xxxx|  Not in use (illegal as entry)
    * 13 condb_2  condb_3  1 3 000100110010001111111000|        ~RS2 in Q
    * 14 condb_3  condb_4  1 5 000101010110000010111100|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  1 6 000101100001001100111001|        Branch on condition
    * 16 condb_5  Fetch    0 7 000001110001011101001110|        Branch not taken.
    * 17 condb_5t BrOpFet  0 4 000001000101011101111100|        Branch taken.
    * 18 BEQ      condb_2  1 3 000100110001101110110110| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   1 3 000100110101101010110100| JALR   yy=RS1+imm
    * 1a ANDI_1   StdIncPc 1 3 000100110000100010110011|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    1 4 000101000010000010101110| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 1 2 000100100010001011101110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 1 3 000100110000100010110111|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 1 5 000101011110001010011100|        Q = 4
    * 1f IJ_2     IJ_3     1 3 000100110001101010110110|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     0 8 000010000101101101111100| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 1 3 000100110000100010110000|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  1 9 000110010010001010111100|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 _L0x23   StdIncPc 1 3 000100110010000010x10xxx| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   3 0 00110000001000111110x110| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   1 3 000100110010000010x01xxx| AUIPC  q = imm20 (copy x/2)
    * 26 OR_1     OR_2     1 3 000100110001001110110000|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    1 3 000100110110000000111100|        Q = rs2
    * 28 _L0x28   SH_1     1 8 000110000101001110111100| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   1 3 000100110010001110111000|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     1 8 000110000101001110111100| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  1 5 00010101011000xxxx110100|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    1 3 000100110010001110x0xxxx| SLL    Shift left
    * 2d MULH_0   MULH_1   3 3 001100110010001010111001| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e MULHU_1  MULHU_2  1 3 000100111001001111110110|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 2f _L0x2f   StdIncPc 1 3 000100110000100010110110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 1 a 000110100000100010110110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  1 3 000100110010001111111000|        ~rs2 to Q
    * 32 JAL_1    JAL_2    1 3 000100110101100010110100|        Target adr to yy
    * 33 JAERR_1  JAERR_2  4 3 01000011010111001010x100|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    0 b 000010110001011101101001|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   3 3 001100110000101011111001|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   5 3 010100110000101011111101|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  4 6 01000110000110xxxx110001|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  1 3 000100110001101110110110| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 1 3 000100111000100010110001|        Last shift.
    * 3a SRxI_1   SRxI_2   3 9 001110010000101010111001|        Register to shift to Q
    * 3b _L0x3b   JAL_1    1 4 000101000010000010101110| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  1 3 000100110001100110110110| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   5 9 010110010000101010111001|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   3 0 00110000001000111110x001|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   3 0 00110000001000111110x001|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 4 000001000110001101111100| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   1 5 000101010110001100111100|        Q=1
    * 42 MULHU_2  MULHU_3  3 9 001110010010001010111100|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  1 3 000100110010000000101000|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  1 3 000100110010001111111010| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    1 5 000101010110001010111100|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    4 3 01000011000110101010x001|        Store PC to mepc
    * 47 ILL_2    ILL_3    4 3 010000110001111010110001|        Store 0 to mtval
    * 48 _L0x48   SW_1     6 4 011001000110001110111100| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  1 5 000101010110000010111100|        Construct PC storage adr
    * 4a _L0x4a   SW_1     6 4 011001000110001110111100| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  7 3 011100110000011010101001|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   1 3 000100110010001110x10xxx| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  3 3 001100110001101110110001| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     1 3 00010011001000xxxxx0xxxx| Illegal instruction seen
    * 4f MRET_8   StdIncPc 1 5 000101010110001010111100|        Prep +4
    * 50 LW_1     StdIncPc 1 c 000111000000101011110001|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   4 3 010000110001111010101110|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 000100010010001011111001|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   4 3 010000110001111010101110|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     5 9 010110010010001010111001|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 4 3 010000110001111010110110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 3 000100110010001000111011|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     1 3 000100110010001000111000|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    1 9 000110011110001011111001|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   1 3 000100110001101111110110|        REM = Q to yy
    * 5a SB_1     SB_2     3 3 001100110001101011111001|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    1 4 000101000010000010101110| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRW_1  1 3 000100110001100110110110| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     5 3 010100110001101011111101|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 000100010010001011111001|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   4 3 010000110001111010101110|  err   LD AlignFault. Faulting adr to mtval
    * 60 MULHU_3  MULHU_2  1 3 000100111010001111111001|        Shift Q and rM. Prepare read rs1
    * 61 EBRKWFI2 EBREAK_1 1 6 000101100001000110110010| EBREAK/WFI2 Select EBREAK or WFI
    * 62 DIV_8    DIV_7    3 5 001101010110001011111100|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    8 5 100001010110001011111100|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  1 3 000100110010001111111010| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    1 6 000101100010000010x10xxx|        Prepare read PC
    * 66 SW_1     SW_2     4 3 010000110000011110101001|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    4 3 01000011000111001010x110|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 1 3 000100110000100010110001|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     1 3 000100110010001010111000|        RS2 > 0, RS1 < 0, change sign yy
    * 6a MULH_1   MULH_2   1 3 000100110001101010110000|        Store ~rs1 to Ryy. Prep construct 1.
    * 6b SB_4     SB_5     6 3 011000110010011100111001|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   1 3 000100110010001110x10xxx| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  3 3 001100110001101110110001| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e DIV_C    DIV_e    1 3 000100110001101110101001|        rM to yy. Q=ffffffff
    * 6f MRET_6   MRET_7   1 5 00010101011000xxxx111100|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    5 9 010110010010001010111001|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 4 3 010000110001111010110110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   1 3 000100110010000110111010|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  4 3 010000110001111100110001|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   1 d 000111010010001011110110| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  1 3 000100110010000010x0xxxx|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  1 3 000100110010000010111000|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  4 5 01000101010110101010x100|        origPC to mepc. Prep read 0
    * 78 DIV_4    DIV_6    1 3 000100110001100000110110|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    1 5 000101011110001010111100|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     1 3 000100110000011100101001|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    1 4 000101000010000010101110| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRW_1  1 3 000100110001100110110110| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  JAL_3    9 3 10010011000111100110x001|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    4 3 01000011000110xxxx110001|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  4 3 01000011000111101010x001|        mtval is target
    * 80 LBU_0    LBU_1    0 0 000000000110001101111100| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  4 3 01000011000110101010x001|        Store PC to mepc
    * 82 DIV_1    DIV_3    1 3 000100110001001110110000|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    1 3 000100110110001010111100|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   1 3 000100110010001111111010| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 000100010010001011111001|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   1 5 00010101110010001000x100|        Return address to TRG
    * 87 JALRE1   JALRE2   4 3 01000011000110110010x001|  err   Store pc to mepc
    * 88 DIV_E    DIV_10   8 3 100000111010001111x0xxxx|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 1 3 000100110000100010110110|        RS2 == 0, return 0xffffffff
    * 8a DIVU_5   ANDI_1   1 9 000110011110001011x10xxx|        Transfer rM to rDee
    * 8b LB_6     StdIncPc 1 5 000101011100100010110100|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    1 3 000100110010001111x10xxx| XOR    xor
    * 8d DIV_0    DIV_1    a 3 101000111010001011111001| DIV    Branch on sign dividend RS1
    * 8e _LCSRRS_1 ILLe     1 3 00010011001000xxxxx0xxxx| Illegal instruction seen
    * 8f ILL_3    ILL_4    1 5 000101010010001010111100|        Q = 1
    * 90 NMI_2    JAL_3    b 3 101100110001110100110110|        mtval = 0.
    * 91 LDAF_2   LDAF_3   9 5 10010101110111001000x100|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    4 3 01000011000110100110x001|        PC to mepc
    * 93 SW_E2    SW_E3    4 3 010000110001101011110001|        Store address that faulted
    * 94 SW_E4    JAL_3    9 3 10010011000111100110x101|        Store 6 to mcause
    * 95 SW_E3    SW_E4    1 5 000101011110001011011100|        Q = 3
    * 96 SH_1     SH_2     3 3 001100110001101011111001|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    4 3 01000011000111001010x110|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  1 3 000100110001101110110110| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     1 3 00010011001000xxxxx0xxxx|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    9 3 10010011010111100100x100|        mcause = 11
    * 9b SH_4     SH_5     c 3 110000110010001100111001|        Address back to Q. Prepare get item to write
    * 9c DIV_10   DIV_12   8 3 100000111010001100110001|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   8 3 100000111010001100110001|        RS2 < 0. Branch on sign of RS1
    * 9e JAL_25   JAL_3    1 3 00010011000100110010x001|        Instr. adr. to jj in case of access error
    * 9f SH_5     SW_2     4 3 010000110000001100101001|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    0 8 000010000101101101111100| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  1 5 000101011110001010011100|        Q = 4
    * a2 DIV_14   LB_6     1 3 000100110010001010111000|        RS2 < 0, RS1 >= 0, change sign yy
    * a3 DIV_15   StdIncPc 1 3 000100110000100010110001|        RS2 < 0, RS1 < 0, yy is true result
    * a4 SRxI_0   SRxI_1   3 0 00110000001000111110x110| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   1 5 000101010110000110111100|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  1 4 000101000010001011101110| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 1 3 00010011011000xxxx111100| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    8 3 100000111010001010111000|        Branch on sign divisor RS2
    * a9 ILL_4    JAL_3    9 5 10010101010111100110x100|        Store 2 to mcause
    * aa DIV_6    DIV_7    1 3 000100111010001011x10xxx|        Write M. Prepare shift
    * ab EBREAK_2 ECALL_6  4 3 010000110001101010110001|        pc to mepc
    * ac _L0xac   SRx_1    1 3 000100110010001110x0xxxx| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   3 3 001100111010001110x10xxx| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _L0xae   SRx_1    1 3 000100110010001110x0xxxx| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   1 5 00010101011000xxxx111100|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   9 3 10010011010111001000x100|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  1 5 000101011110001010011100|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    0 7 000001111101001101001100|        IncPC, OpFetch, but force +4
    * b3 unxb3             3 0 0011000000xxxxxxxxxxxxxx| b3: Not in use 
    * b4 i0reserv          3 0 0011000000xxxxxxxxxxxxxx| Not in use, reserved to allow LASTINCH
    * b5 SH_3     SH_4     1 3 000100110010000000110110|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  1 5 000101011110001010011100|        Q = 8
    * b7 IJ_3     IJ_4     1 3 000100110110001100011100|        Construct Q = 3
    * b8 BGE      condb_2  1 3 000100110001101110110110| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    1 5 000101010010001100111000|        Calc carry of RS2+0xFFFFFFFF
    * ba LHU_3    ANDI_1   1 3 000100110010000111111010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     5 3 010100110001101011111101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  1 3 000100110001100110110110| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    0 b 000010110010001101101011|        Mask and use as PC
    * be IJ_1     IJ_2     1 b 000110110010001011111001|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    1 b 000110110010001011111001|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    1 6 000101100010001110111001|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    1 3 000100110001101010110110|        Read word is to be masked with ~3u
    * c2 DIVU_3   DIVU_2   3 5 001101010110001011111100|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   8 5 100001010110001011111100|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    1 3 000100110001001111110010| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   1 3 000100110010000000111010|        ~302
    * c6 IJT_4    ILL_2    4 3 010000110001101010111011|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   4 3 01000011000110xxxx110001|        Store pc to mepc.
    * c8 DIV_7    DIV_8    1 e 000111101010001100111101|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   1 3 000100110110000110011100|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   1 e 000111101010001100111101|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc b 3 101100110001110100110110|        mtval = 0.
    * cc OR_0     OR_1     1 3 000100110010001111x10xxx| OR     or
    * cd REM_0    DIV_1    a 3 101000111010001011111001| REM    Branch on sign dividend RS1
    * ce _LCSRRCI_1 ILLe     1 3 00010011001000xxxxx0xxxx| Illegal instruction seen
    * cf MRET_7   MRET_8   1 6 000101100010000110x10xxx|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  1 5 000101010110000010111100| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   1 3 000100110001000110110110| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     5 9 010110010010001010111001|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 4 3 010000110001111010110110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   9 5 10010101010111001010x100|        Store 5 to mcause
    * d5 unxd5             3 0 0011000000xxxxxxxxxxxxxx| d5: Not in use
    * d6 eILL0c   ILLe     1 3 00010011001000xxxxx0xxxx| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  4 3 010000110001111010110110|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  1 3 000100110001101110110110| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  1 3 000100111010001111x10xxx|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   1 3 000100110010001010x10xxx|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   1 5 00010101010111000010x100|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  1 3 000100110001100110110110| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  4 3 010000110001111010110110|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   1 f 000111110001010011110110|  Fr00  Read and latch instruction
    * df eFetch   Fetch2   1 d 000111010001011011110110|  Fr00  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   1 3 000100110001101011110000|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    1 3 000100110010000000111001|        Q = RS1
    * e2 MUL_1    MUL_2    3 9 001110010010001010111100|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   1 9 000110011110001011x10xxx|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   1 3 000100110010001111111010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  1 5 000101011110001010011100|        Q = 4
    * e6 StdIncPc Fetch    0 7 000001111101001101001100|  Fr00  IncPC, OpFetch
    * e7 aFault   aFault_1 4 3 010000110001111010110110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    1 3 000100111010001110111001|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    1 3 000100110110001100011100|        Construct Q = 3
    * ea MULHU_5  MULHU_6  1 3 000100110010001100111100|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     1 3 000100110010000111111010|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    1 3 000100110010001111x10xxx| AND    And 
    * ed REMU_0   DIVU_1   3 3 001100111010001110x10xxx| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     1 3 00010011001000xxxxx0xxxx| Illegal instruction seen
    * ef WFI_5    Fetch    0 7 000001111101011101001100|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    5 9 010110010010001010111001|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 4 3 010000110001111010110110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 1 3 000100110010000010x10xxx|        Prepare read PC
    * f3 aF_SW    aF_SW_1  1 3 00010011001000xxxxx01xxx|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2            4 3 010000110101011111111100|  Fr00  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 4 3 010000110001111010110110|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    1 5 000101011110000000011100| WFI    Chk offset=0x105. Now=0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 4 3 010000110001110010110110| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  1 3 000100110001101110110110| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   1 5 000101010101001110110100|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    1 5 000101010110001010111100|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     1 3 000100110010000000110110|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  1 3 000100110001100110110110| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    1 3 000100110010000010x10xxx| NMI    Get current PC
    * fe ILLe     ILL_1    1 3 000100110010000010x0xxxx| Illegal
    * ff QINT_0   QINT_1   1 3 000100110010000010x10xxx| INT    Get current PC
    */
   localparam u0_0 = 256'hb6e6901090e2b904b386bc5a788bbc5a7b09ba078804b4e690e67cbef9d27c01;
   localparam u0_1 = 256'hb6b79cd4b7e6eea6ae32b3e6b441b6137c744ede3916bc15f81400feb81af88b;
   localparam u0_2 = 256'hb6e6f642b96a803e3430bc96b821bc963c1db0278804e63590e6bc39b0e67c52;
   localparam u0_3 = 256'he13ae135b903b649ae32b93db1e6b61331d7fd03f93669dea481b486f82bb6e6;
   localparam u0_4 = 256'hbce600feb12e9031a9b1bc66bc4bbc66b18fa147bc65fa2b28eabc603c0b7c50;
   localparam u0_5 = 256'haedaf970fdfbb649ae32f95df69cf96e388b3b57b61eb9ebaedaf954aedaf1e6;
   localparam u0_6 = 256'h3ccfa9b9b12e9031397ab0f9b88bb1e6a693a9f290effa2bfc58fcc8b2f7f942;
   localparam u0_7 = 256'ha17d31906134b649ae3229f2bca836aaa47db8778073f6f43176ba1ab61eb9ba;
   localparam u0_8 = 256'hbca900fef982d029b4e6d01ab6e6c09c217f849ef9f0fa21bc82b0a8a17d7c85;
   localparam u0_9 = 256'h29f2213431a23168399f443400feb613a693f9bbdc946534f195613484923634;
   localparam u0_A = 256'h3cc5803f90e0803fb19ad0c86434b8783c61eed0bcafe63ab1e6b88b9cb67c5e;
   localparam u0_B = 256'hf9c1f91f6bdeb649fdb5fa1a38c0b6131cbd9c9a369b000000004cde9cb28492;
   localparam u0_C = 256'h904f00fef982d02636e63dc29ca53d6231cbbb473a6ff2e1fc8afccab6e9b988;
   localparam u0_D = 256'hf6f4f6f4b6e5b64924929091d042b613b6a100fe0000a492b61eb906b6c9bc37;
   localparam u0_E = 256'h4cde00fe90e0d011fa563c221cc6b9e2b61e4cde9cb0fa1ad01abce8391df0ca;
   localparam u0_F = 256'h90c78046907eb649366bbc45b4d9b613b6ab1cfab6dbfc0008dd90e6b61eb972;
   localparam u1_0 = 256'h1308132313a31323141810531321105313211321132013481320226311220063;
   localparam u1_1 = 256'h131a15e21308122214201308135a131b04570717161315601323132013231323;
   localparam u1_2 = 256'h130813933322132315601853132318531360131313203023132019221308085b;
   localparam u1_3 = 256'h30233023590a13191420390a1388131b4618530a330a0b17435c135813231a08;
   localparam u1_4 = 256'h15621320331b13237306646315606463431e431a156213231320392215630463;
   localparam u1_5 = 256'h431e1122531a13191420331a131b19e213221322431e5922431e1122431e1c0a;
   localparam u1_6 = 256'h1560131b331b13236327131a13221308431c43071620132385623562161113a3;
   localparam u1_7 = 256'h431e4318931e13191420130715e21318455a132013201d22431f1321431e5922;
   localparam u1_8 = 256'h15221320a3a2132315c819e2130883a3431b15c81122132313621313431a0063;
   localparam u1_9 = 256'h4303131383a383a3c323935e1320131b431c331a15e2931e431a431a95dcb31d;
   localparam u1_A = 256'h1560132333a31323431a13a2955e83a213601422156130231308132215e2085b;
   localparam u1_B = 256'h1b221b220b231319531a13211523131b136315e213203000300007d315e2935c;
   localparam u1_C = 256'h16211320a3a21323b31d1ea313611ea34318431a1320131385623562131a1623;
   localparam u1_D = 256'h1d161f14431e1319155c132213a3131b431e13203000955c431e592213111560;
   localparam u1_E = 256'h07d7132033a3132313211323136313a3431e07d315e2132319e239221320131a;
   localparam u1_F = 256'h1320132013201319132015621553131b431c15e0431e435713201320431e5922;
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
   assign d[22] = indir[14];
   assign d[23] = indir[15];
   assign d[24] = indir[16];
   assign d[25] = indir[17];
   assign d[27] = indir[18];
   assign d[28] = indir[19];
   assign d[29] = indir[20];
   assign d[39] = indir[21];
   assign d[42] = indir[22];
   assign d[43] = indir[23];
   // replaces = 000000100101110000000000100001100011100000000
   SB_LUT4 #(.LUT_INIT(16'h0202)) cmb_d08(.O(d[8]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h04a0)) cmb_d09(.O(d[9]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h40a0)) cmb_d10(.O(d[10]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0040)) cmb_d14(.O(d[14]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'ha000)) cmb_d15(.O(d[15]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hfefe)) cmb_d20(.O(d[20]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0114)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h3882)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2002)) cmb_d35(.O(d[35]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h3000)) cmb_d38(.O(d[38]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 100110011010000000100001000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h1bd7)) cmb_d21(.O(d[21]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1890)) cmb_d26(.O(d[26]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0a04)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0a80)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1045)) cmb_d40(.O(d[40]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1040)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0500)) cmb_d44(.O(d[44]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
wire instr0100,instr1x110100;            bn_l4v #(.I(16'h0010)) leq0100(     .o(instr0100),     .i({minx[3:0]}));    bn_l4v #(.I(16'h8000)) leq1x110100( .o(instr1x110100), .i({minx[7],minx[5:4],instr0100}));    SB_DFFE reg_d18( .Q(d[18]), .C(clk), .E(progress_ucode), .D(instr1x110100));    assign d[30] = d[18];
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   No RVC
 *   MULDIV included
 *   minstret for instructions in SRAM
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 45 columns
 * Removed:  000000000000001000000000000000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 000000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 45
 * 212 distinct lines in remaining untreated columns
 * c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 212 211 212 212 212 212 212 212 212 212 212 212 212 212   x 212 212 210 212 211 212 211 211 212 212 212 212 212 212 212 212 210 210 210 212 211 212 211 212 211 212 212 211 210 211  kill col 27  Tbl  43 cols 000000000000001001000000000000000000000000000 has 210 unique lines.
 * 210 209 210 210 210 210 210 210 210 210 210 210 210 210   x 210 210     209 209 210 208 209 210 210 210 210 210 210 210 210 208 208 208 210 209 210 209 210 209 210 210 209 208 209  kill col 23  Tbl  42 cols 000000000000001001000100000000000000000000000 has 208 unique lines.
 * 208 207 208 208 208 208 208 208 208 208 208 208 208 208   x 208 208     207 206 208     207 208 208 208 208 208 208 208 208 206 206 206 208 207 208 207 208 207 208 208 207 206 207  kill col 25  Tbl  41 cols 000000000000001001010100000000000000000000000 has 206 unique lines.
 * 206 205 206 206 206 206 206 206 206 206 206 206 206 206   x 206 206     205     206     205 206 206 206 206 206 206 206 206 204 203 204 206 205 206 204 206 205 206 206 205 204 205  kill col 12  Tbl  40 cols 000000000000001001010100000000001000000000000 has 203 unique lines.
 * 203 202 202 203 203 203 203 203 203 203 203 203 203 203   x 203 203     202     203     201 203 203 203 203 203 203 203 203 200     201 203 202 203 201 203 202 203 203 202 201 202  kill col 13  Tbl  39 cols 000000000000001001010100000000011000000000000 has 200 unique lines.
 * 200 199 199 200 200 200 200 200 200 200 200 200 200 200   x 200 200     199     200     198 200 200 200 200 200 200 200 200         197 200 199 200 198 200 199 199 200 199 198 199  kill col 11  Tbl  38 cols 000000000000001001010100000000011100000000000 has 197 unique lines.
 * 197 196 195 197 197 197 197 197 197 197 197 197 197 197   x 197 197     196     197     195 197 197 197 197 197 197 197 197             197 196 197 195 197 195 195 197 196 195 196  kill col 42  Tbl  37 cols 001000000000001001010100000000011100000000000 has 195 unique lines.
 * 195 193     195 195 195 195 195 195 195 195 195 195 195   x 195 195     194     195     193 195 195 194 195 195 195 195 195             195 194 195 193 195 193 193 195 194 193 194  kill col 43  Tbl  36 cols 011000000000001001010100000000011100000000000 has 193 unique lines.
 * 193         193 193 193 193 193 193 193 193 193 193 193   x 193 193     192     193     191 193 193 191 193 193 193 193 193             192 192 193 191 193 191 191 193 192 191 191  kill col 22  Tbl  35 cols 011000000000001001010110000000011100000000000 has 191 unique lines.
 * 191         191 191 191 191 191 191 191 191 191 191 191   x 191 191     190     190         191 191 189 191 191 191 191 191             190 190 190 189 190 188 188 191 190 189 188  kill col  5  Tbl  34 cols 011000000000001001010110000000011100000100000 has 188 unique lines.
 * 188         188 188 188 188 188 188 188 188 188 188 188   x 188 188     187     187         188 188 186 188 187 188 188 188             185 187 187 182 183     185 185 184 182 184  kill col  7  Tbl  33 cols 011000000000001001010110000000011100010100000 has 182 unique lines.
 * 182         182 182 182 182 182 182 182 182 181 182 182   x 182 181     181     177         182 182 180 182 179 182 182 182             180 181 181     177     179 177 174 176 178  kill col  2  Tbl  32 cols 011000000000001001010110000000011100010100100 has 174 unique lines.
 * 174         174 174 174 174 174 174 174 174 173 174 174   x 174 173     172     167         174 174 170 174 170 172 174 174             172 173 172     166     169 166     165 167  kill col  1  Tbl  31 cols 011000000000001001010110000000011100010100110 has 165 unique lines.
 * 163         165 165 165 165 165 165 165 164 163 165 165   x 165 164     160     155         163 165 161 165 158 161 165 165             163 163 162     151     155 150         155  kill col  3  Tbl  30 cols 011000000000001001010110000000011100010101110 has 150 unique lines.
 * 148         150 150 150 150 150 150 150 148 148 150 150   x 149 149     146     140         147 150 144 150 141 143 150 147             148 148 147     129     134             134  kill col  6  Tbl  29 cols 011000000000001001010110000000011100011101110 has 129 unique lines.
 * 126         129 129 129 129 129 129 129 127 127 129 127   x 128 128     125     114         125 129 122 129 120 120 129 125             127 127 124             111             111  kill col  4  Tbl  28 cols 011000000000001001010110000000011100011111110 has 111 unique lines.
 * 107         110 111 111 111 111 111 111 108 110 110 109   x 109 109     107      98         105 111 104 111 103 103 111 106             109 109 106                              93  kill col  0  Tbl  27 cols 011000000000001001010110000000011100011111111 has  93 unique lines.
 *  89          92  93  93  93  93  93  93  89  92  92  91   x  90  92      88      85          87  93  87  93  86  86  93  88              91  91  88                                  kill col 24  Tbl  26 cols 011000000000001001011110000000011100011111111 has  85 unique lines.
 *  80          84  85  84  85  84  85  85  81  84  84  83   x  82  84      80                  79  85  79  85  79  75  84  81              83  83  80                                  kill col 16  Tbl  25 cols 011000000000001001011110000010011100011111111 has  75 unique lines.
 *  71          74  75  74  75  74  75  75  71  74  74  73   x  71  73      69                  68  74  67  75  70      74  71              73  73  70                                  kill col 19  Tbl  24 cols 011000000000001001011110010010011100011111111 has  67 unique lines.
 *  63          66  67  65  67  66  67  67  63  66  66  65   x  62  65      61                  61  66      67  61      66  64              65  65  63                                  kill col 26  Tbl  23 cols 011000000000001001111110010010011100011111111 has  61 unique lines.
 *  57          60  61  59  61  60  61  61  57  60  60  59   x  56  58                          55  60      60  55      60  58              59  59  57                                  kill col 21  Tbl  22 cols 011000000000001001111111010010011100011111111 has  55 unique lines.
 *  52          54  55  53  55  54  55  55  51  54  54  53   x  51  52                              52      54  49      54  52              53  53  52                                  kill col 17  Tbl  21 cols 011000000000001001111111010110011100011111111 has  49 unique lines.
 *  47          48  46  47  49  48  49  49  45  48  48  47   x  44  45                              46      48          48  46              47  47  46                                  kill col 29  Tbl  20 cols 011000000000001101111111010110011100011111111 has  44 unique lines.
 *  42          43  41  37  44  43  44  44  41  43  43  42   x      41                              42      43          43  41              42  42  41                                  kill col 39  Tbl  19 cols 011001000000001101111111010110011100011111111 has  37 unique lines.
 *  35          36  34      37  36  37  37  34  36  36  35   x      31                              35      36          36  35              35  35  34                                  kill col 28  Tbl  18 cols 011001000000001111111111010110011100011111111 has  31 unique lines.
 *  29          30  27      30  30  30  31  29  30  30  28   x                                      29      30          30  30              29  29  29                                  kill col 40  Tbl  17 cols 011011000000001111111111010110011100011111111 has  27 unique lines.
 *  25          25          26  26  25  27  25  25  26  25   x                                      25      26          26  26              25  25  25                                  kill col 44  Tbl  16 cols 111011000000001111111111010110011100011111111 has  25 unique lines.
 *              23          24  24  23  25  23  23  24  23   x                                      23      24          24  24              23  23  23                                  kill col 41  Tbl  15 cols 111111000000001111111111010110011100011111111 has  23 unique lines.
 *                          22  22  21  23  21  21  22  21   x                                      21      22          22  22              21  21  21                                  kill col 36  Tbl  14 cols 111111001000001111111111010110011100011111111 has  21 unique lines.
 *                          20  19      21  19  19  20  19   x                                      19      20          20  20              19  19  19                                  kill col 37  Tbl  13 cols 111111011000001111111111010110011100011111111 has  19 unique lines.
 *                          18          19  17  17  18  17   x                                      17      18          18  18              17  17  17                                  kill col 34  Tbl  12 cols 111111011010001111111111010110011100011111111 has  17 unique lines.
 *                          16          17      15  16  15   x                                      15      16          16  16              15  15  16                                  kill col 33  Tbl  11 cols 111111011011001111111111010110011100011111111 has  15 unique lines.
Possible good candidates for removal, columns : 8 9 10 20 31 
 *
 * Round 1: 000000100100110000000000101001100011100000000  4 columns for indexes to table representing 11 original columns (uses 15 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 38
 * 211 distinct lines in remaining untreated columns
 * c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 211 208 211 211 211 211   x 211 211   x 211 211   x   x   x 211 211 208 211 210 211 210 210 211   x 209   x 211 211   x   x 209 209 209   x   x   x 210 211 210 211 211 210 209 210  kill col 43  Tbl  32 cols 010000100100111000000000101001100011100000000 has 208 unique lines.
 * 208     208 208 208 208   x 208 208   x 208 208   x   x   x 208 208 205 208 207 208 207 207 208   x 206   x 208 208   x   x 206 206 206   x   x   x 207 208 207 208 208 207 206 207  kill col 27  Tbl  31 cols 010000100100111001000000101001100011100000000 has 205 unique lines.
 * 205     205 205 205 205   x 205 205   x 205 205   x   x   x 205 205     204 204 205 203 204 205   x 203   x 205 205   x   x 203 203 203   x   x   x 204 205 204 205 205 204 203 204  kill col 23  Tbl  30 cols 010000100100111001000100101001100011100000000 has 203 unique lines.
 * 203     203 203 203 203   x 203 203   x 203 203   x   x   x 203 203     202 201 203     202 203   x 201   x 203 203   x   x 201 201 201   x   x   x 202 203 202 203 202 202 201 202  kill col 25  Tbl  29 cols 010000100100111001010100101001100011100000000 has 201 unique lines.
 * 201     201 201 201 201   x 201 201   x 201 201   x   x   x 201 201     200     201     200 201   x 199   x 201 201   x   x 199 198 199   x   x   x 199 201 200 201 200 199 199 200  kill col 12  Tbl  28 cols 010000100100111001010100101001101011100000000 has 198 unique lines.
 * 198     196 198 198 198   x 198 198   x 198 198   x   x   x 198 198     197     198     196 198   x 196   x 198 198   x   x 195     196   x   x   x 196 198 197 198 197 196 196 197  kill col 13  Tbl  27 cols 010000100100111001010100101001111011100000000 has 195 unique lines.
 * 195     193 195 195 195   x 195 195   x 195 195   x   x   x 195 195     194     195     192 195   x 193   x 195 195   x   x         192   x   x   x 192 195 193 194 194 193 193 194  kill col 22  Tbl  26 cols 010000100100111001010110101001111011100000000 has 192 unique lines.
 * 192     190 192 192 192   x 192 192   x 192 191   x   x   x 192 192     191     191         192   x 190   x 192 192   x   x         189   x   x   x 188 191 188 191 191 190 190 190  kill col  7  Tbl  25 cols 010000100100111001010110101001111011110000000 has 188 unique lines.
 * 188     185 188 188 188   x 188 188   x 188 187   x   x   x 188 187     187     186         188   x 186   x 187 187   x   x         185   x   x   x     187 183 186 186 184 186 185  kill col  5  Tbl  24 cols 010000100100111001010110101001111011110100000 has 183 unique lines.
 * 183     177 183 183 183   x 183 183   x 183 182   x   x   x 183 182     182     179         183   x 181   x 181 182   x   x         179   x   x   x     180     181 178 176 177 179  kill col  2  Tbl  23 cols 010000100100111001010110101001111011110100100 has 176 unique lines.
 * 176     169 176 176 176   x 176 176   x 176 175   x   x   x 176 175     175     170         176   x 173   x 173 174   x   x         169   x   x   x     168     173 168     168 170  kill col  6  Tbl  22 cols 010000100100111001010110101001111011111100100 has 168 unique lines.
 * 168     159 168 168 168   x 168 168   x 167 167   x   x   x 165 166     167     160         167   x 165   x 165 166   x   x         159   x   x   x             158 156     152 158  kill col  1  Tbl  21 cols 010000100100111001010110101001111011111100110 has 152 unique lines.
 * 150     143 152 151 152   x 152 152   x 151 150   x   x   x 149 149     149     142         150   x 149   x 148 148   x   x         141   x   x   x             137 129         137  kill col  3  Tbl  20 cols 010000100100111001010110101001111011111101110 has 129 unique lines.
 * 126     117 129 127 129   x 129 128   x 127 127   x   x   x 125 126     126     117         127   x 123   x 120 123   x   x         116   x   x   x             107             107  kill col  4  Tbl  19 cols 010000100100111001010110101001111011111111110 has 107 unique lines.
 * 104      96 106 105 107   x 107 106   x 104 105   x   x   x 102 103     102      94         105   x 101   x  99 101   x   x          95   x   x   x                              85  kill col  0  Tbl  18 cols 010000100100111001010110101001111011111111111 has  85 unique lines.
 *  81      73  84  83  85   x  85  84   x  82  81   x   x   x  80  82      79      75          81   x  79   x  78  78   x   x          76   x   x   x                                  kill col 42  Tbl  17 cols 011000100100111001010110101001111011111111111 has  73 unique lines.
 *  70          72  71  73   x  73  72   x  70  69   x   x   x  69  69      66      64          70   x  68   x  65  66   x   x          62   x   x   x                                  kill col 11  Tbl  16 cols 011000100100111001010110101001111111111111111 has  62 unique lines.
 *  59          61  60  62   x  62  61   x  59  58   x   x   x  59  58      55      54          58   x  56   x  53  54   x   x               x   x   x                                  kill col 17  Tbl  15 cols 011000100100111001010110101101111111111111111 has  53 unique lines.
 *  50          52  50  52   x  53  52   x  50  47   x   x   x  48  48      47      47          49   x  45   x      46   x   x               x   x   x                                  kill col 19  Tbl  14 cols 011000100100111001010110111101111111111111111 has  45 unique lines.
 *  42          44  42  44   x  45  44   x  42  39   x   x   x  40  40      39      40          41   x       x      39   x   x               x   x   x                                  kill col 33  Tbl  13 cols 011000100101111001010110111101111111111111111 has  39 unique lines.
 *  36          38  36  38   x  39  38   x  36       x   x   x  34  34      33      34          35   x       x      34   x   x               x   x   x                                  kill col 26  Tbl  12 cols 011000100101111001110110111101111111111111111 has  33 unique lines.
 *  30          32  30  32   x  33  32   x  30       x   x   x  29  29              27          28   x       x      28   x   x               x   x   x                                  kill col 24  Tbl  11 cols 011000100101111001111110111101111111111111111 has  27 unique lines.
 *  24          26  24  25   x  26  26   x  24       x   x   x  23  24                          22   x       x      21   x   x               x   x   x                                  kill col 16  Tbl  10 cols 011000100101111001111110111111111111111111111 has  21 unique lines.
 *  19          20  18  19   x  20  20   x  18       x   x   x  17  17                          16   x       x           x   x               x   x   x                                  kill col 21  Tbl   9 cols 011000100101111001111111111111111111111111111 has  16 unique lines.
 *
 * Round 2: 100111011010000110000000000000000000000000000  4 columns for indexes to table representing  9 original columns (uses 16 of 16 lines in indirect table).
 * Direct:  011000000001000001111111010110011100011111111 24 columns
 * Success. Use 2 EBRs, 20 LUTs.
 */

module v6_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    *                      indirect_index 1
    * inx         next     | indirect index 0
    * || ucode    ucode    | | direct representation
    * 00 LB_0     LB_1     0 0 000000000100011011111100| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 000100010010010111111001|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 001000100100011011111100| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 _L0x03   StdIncPc 1 3 000100110000000101x10xxx| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 3 3 001100110100000101110100| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   1 3 000100110000000101x01xxx| AUIPC  q = imm20 (copy x/2)
    * 06 LB_3     LB_4     1 3 000100110000001101111010|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     1 3 000100110000001011111011|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     4 0 010000000100011101111100| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     1 3 000100110000001011111000|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     4 0 010000000100011101111100| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    5 4 010101000000000101110011|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   1 3 000100110000011101111001| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    1 3 000100111000011101x10xxx| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    1 3 000100110000011101x10xxx| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 3 3 001100110000000101110110| LUI    q = imm20
    * 10 SUB_1    LB_6     1 3 000100110000011111111000|        Q = ~RS2
    * 11 AND_1    ANDI_1   1 3 000100110000011101111000|        RS1^0xffffffff to Q
    * 12 _L0x12   ILLe     1 3 0001001100000xxxx1x0xxxx|  Not in use (illegal as entry)
    * 13 condb_2  condb_3  1 3 000100110000011111111000|        ~RS2 in Q
    * 14 condb_3  condb_4  1 5 000101010100000101111100|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  4 6 010001100000011001111001|        Branch on condition
    * 16 condb_5  Fetch    6 5 011001010011011011001110|        Branch not taken.
    * 17 condb_5t BrOpFet  6 4 011001000101011011111100|        Branch taken.
    * 18 BEQ      condb_2  5 3 010100110000011101110110| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   5 3 010100110100010101110100| JALR   yy=RS1+imm
    * 1a ANDI_1   StdIncPc 3 3 001100110000000101110011|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    1 4 000101000000000101101110| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 1 2 000100100000010111101110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 3 3 001100110000000101110111|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 1 5 000101011100010101011100|        Q = 4
    * 1f IJ_2     IJ_3     5 3 010100110000010101110110|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     7 7 011101110100011011111100| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 3 3 001100110000000101110000|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  1 8 000110000000010101111100|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 _L0x23   StdIncPc 1 3 000100110000000101x10xxx| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   1 0 00010000000001111010x110| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   1 3 000100110000000101x01xxx| AUIPC  q = imm20 (copy x/2)
    * 26 OR_1     OR_2     4 3 010000110000011101110000|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    1 3 000100110100000001111100|        Q = rs2
    * 28 _L0x28   SH_1     4 7 010001110100011101111100| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   1 3 000100110000011101111000|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     4 7 010001110100011101111100| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  1 5 0001010101000xxxx1110100|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    1 3 000100110000011101x0xxxx| SLL    Shift left
    * 2d MULH_0   MULH_1   1 3 000100110000010100111001| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e MULHU_1  MULHU_2  4 3 010000111000011111110110|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 2f _L0x2f   StdIncPc 3 3 001100110000000101110110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 3 9 001110010000000101110110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  1 3 000100110000011111111000|        ~rs2 to Q
    * 32 JAL_1    JAL_2    5 3 010100110100000101110100|        Target adr to yy
    * 33 JAERR_1  JAERR_2  5 3 01010011010110010110x100|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    6 3 011000110011011011101001|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   3 3 001100110000010110111001|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   8 3 100000110000010110111101|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  5 6 0101011000001xxxx1110001|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  5 3 010100110000011101110110| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 3 3 001100111000000101110001|        Last shift.
    * 3a SRxI_1   SRxI_2   3 8 001110000000010100111001|        Register to shift to Q
    * 3b _L0x3b   JAL_1    1 4 000101000000000101101110| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  5 3 010100110000001101110110| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   8 8 100010000000010100111001|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   1 0 00010000000001111010x001|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   1 0 00010000000001111010x001|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 4 000001000100011011111100| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   1 5 000101010100011001111100|        Q=1
    * 42 MULHU_2  MULHU_3  1 8 000110000000010100111100|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  1 3 000100110000000001101000|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  1 3 000100110000011111111010| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    1 5 000101010100010101111100|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    5 3 01010011000011010110x001|        Store PC to mepc
    * 47 ILL_2    ILL_3    5 3 010100110001110101110001|        Store 0 to mtval
    * 48 _L0x48   SW_1     9 4 100101000100011101111100| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  1 5 000101010100000101111100|        Construct PC storage adr
    * 4a _L0x4a   SW_1     9 4 100101000100011101111100| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  a 3 101000110001110101101001|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   1 3 000100110000011101x10xxx| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  5 3 010100110000011100110001| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     1 3 0001001100000xxxx1x0xxxx| Illegal instruction seen
    * 4f MRET_8   StdIncPc 1 5 000101010100010101111100|        Prep +4
    * 50 LW_1     StdIncPc 3 a 001110100010010111110001|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   5 3 010100110001110101101110|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 000100010010010111111001|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   5 3 010100110001110101101110|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     b 8 101110000000010100111001|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 5 3 010100110001110101110110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 3 000100110000010001111011|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     1 3 000100110000010001111000|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    1 8 000110001100010111111001|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   5 3 010100110000011111110110|        REM = Q to yy
    * 5a SB_1     SB_2     5 3 010100110000010110111001|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    1 4 000101000000000101101110| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRW_1  5 3 010100110000001101110110| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     c 3 110000110000010110111101|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 000100010010010111111001|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   5 3 010100110001110101101110|  err   LD AlignFault. Faulting adr to mtval
    * 60 MULHU_3  MULHU_2  1 3 000100111000011111111001|        Shift Q and rM. Prepare read rs1
    * 61 EBRKWFI2 EBREAK_1 4 6 010001100000001101110010| EBREAK/WFI2 Select EBREAK or WFI
    * 62 DIV_8    DIV_7    1 5 000101010100010110111100|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    d 5 110101010100010111111100|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  1 3 000100110000011111111010| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    1 6 000101100000000101x10xxx|        Prepare read PC
    * 66 SW_1     SW_2     e 3 111000110001111101101001|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    5 3 01010011000110010110x110|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 3 3 001100110000000101110001|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     1 3 000100110000010101111000|        RS2 > 0, RS1 < 0, change sign yy
    * 6a MULH_1   MULH_2   5 3 010100110000010101110000|        Store ~rs1 to Ryy. Prep construct 1.
    * 6b SB_4     SB_5     9 3 100100110001011001111001|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   1 3 000100110000011101x10xxx| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  5 3 010100110000011100110001| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e DIV_C    DIV_e    5 3 010100110000011101101001|        rM to yy. Q=ffffffff
    * 6f MRET_6   MRET_7   1 5 0001010101000xxxx1111100|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    b 8 101110000000010100111001|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 5 3 010100110001110101110110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   1 3 000100110000001101111010|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  5 3 010100110001111001110001|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   1 b 000110110010010111110110| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  1 3 000100110000000101x0xxxx|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  1 3 000100110000000101111000|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  5 5 01010101010011010110x100|        origPC to mepc. Prep read 0
    * 78 DIV_4    DIV_6    5 3 010100110000000001110110|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    1 5 000101011100010101111100|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     e 3 111000110001011001101001|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    1 4 000101000000000101101110| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRW_1  5 3 010100110000001101110110| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  JAL_3    f 3 11110011000101001110x001|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    5 3 0101001100001xxxx1110001|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  5 3 01010011000111010110x001|        mtval is target
    * 80 LBU_0    LBU_1    0 0 000000000100011011111100| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  5 3 01010011000011010110x001|        Store PC to mepc
    * 82 DIV_1    DIV_3    4 3 010000110000011101110000|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    1 3 000100110100010101111100|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   1 3 000100110000011111111010| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 000100010010010111111001|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   3 5 00110101110000010100x100|        Return address to TRG
    * 87 JALRE1   JALRE2   5 3 01010011000011100110x001|  err   Store pc to mepc
    * 88 DIV_E    DIV_10   d 3 110100111000011111x0xxxx|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 3 3 001100110000000101110110|        RS2 == 0, return 0xffffffff
    * 8a DIVU_5   ANDI_1   1 8 000110001100010111x10xxx|        Transfer rM to rDee
    * 8b LB_6     StdIncPc 3 5 001101011100000101110100|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    1 3 000100110000011111x10xxx| XOR    xor
    * 8d DIV_0    DIV_1    d 3 110100111000010110111001| DIV    Branch on sign dividend RS1
    * 8e _LCSRRS_1 ILLe     1 3 0001001100000xxxx1x0xxxx| Illegal instruction seen
    * 8f ILL_3    ILL_4    1 5 000101010000010101111100|        Q = 1
    * 90 NMI_2    JAL_3    f 3 111100110001101001110110|        mtval = 0.
    * 91 LDAF_2   LDAF_3   f 5 11110101110100010100x100|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    5 3 01010011000011001110x001|        PC to mepc
    * 93 SW_E2    SW_E3    5 3 010100110000110111110001|        Store address that faulted
    * 94 SW_E4    JAL_3    f 3 11110011000101001110x101|        Store 6 to mcause
    * 95 SW_E3    SW_E4    1 5 000101011100010111011100|        Q = 3
    * 96 SH_1     SH_2     5 3 010100110000010110111001|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    5 3 01010011000110010110x110|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  5 3 010100110000011101110110| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     1 3 0001001100000xxxx1x0xxxx|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    f 3 11110011010101001100x100|        mcause = 11
    * 9b SH_4     SH_5     9 3 100100110000111001111001|        Address back to Q. Prepare get item to write
    * 9c DIV_10   DIV_12   d 3 110100111000011001110001|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   d 3 110100111000011001110001|        RS2 < 0. Branch on sign of RS1
    * 9e JAL_25   JAL_3    4 3 01000011000001100110x001|        Instr. adr. to jj in case of access error
    * 9f SH_5     SW_2     e 3 111000110000111001101001|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    7 7 011101110100011011111100| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  1 5 000101011100010101011100|        Q = 4
    * a2 DIV_14   LB_6     1 3 000100110000010101111000|        RS2 < 0, RS1 >= 0, change sign yy
    * a3 DIV_15   StdIncPc 3 3 001100110000000101110001|        RS2 < 0, RS1 < 0, yy is true result
    * a4 SRxI_0   SRxI_1   1 0 00010000000001111010x110| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   1 5 000101010100001101111100|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  1 4 000101000000010111101110| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 1 3 0001001101000xxxx1111100| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    d 3 110100111000010101111000|        Branch on sign divisor RS2
    * a9 ILL_4    JAL_3    f 5 11110101010101001110x100|        Store 2 to mcause
    * aa DIV_6    DIV_7    1 3 000100111000010111x10xxx|        Write M. Prepare shift
    * ab EBREAK_2 ECALL_6  5 3 010100110000110101110001|        pc to mepc
    * ac _L0xac   SRx_1    1 3 000100110000011101x0xxxx| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   1 3 000100111000011100x10xxx| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _L0xae   SRx_1    1 3 000100110000011101x0xxxx| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   1 5 0001010101000xxxx1111100|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   f 3 11110011010100010100x100|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  1 5 000101011100010101011100|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    6 5 011001011110011011001100|        IncPC, OpFetch, but force +4
    * b3 unxb3             e 0 1110000000xxxxxxxxxxxxxx| b3: Not in use 
    * b4 eFetch3           4 5 010001010100111111111100|  Fr10  Update minstret, Q=immediate. Use dinx
    * b5 SH_3     SH_4     1 3 000100110000000001110110|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  1 5 000101011100010101011100|        Q = 8
    * b7 IJ_3     IJ_4     1 3 000100110100011001011100|        Construct Q = 3
    * b8 BGE      condb_2  5 3 010100110000011101110110| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    1 5 000101010000011001111000|        Calc carry of RS2+0xFFFFFFFF
    * ba LHU_3    ANDI_1   1 3 000100110000001111111010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     c 3 110000110000010110111101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  5 3 010100110000001101110110| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    0 3 000000110010011011101011|        Mask and use as PC
    * be IJ_1     IJ_2     1 3 000100110010010111111001|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    1 3 000100110010010111111001|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    1 6 000101100000011101111001|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    5 3 010100110000010101110110|        Read word is to be masked with ~3u
    * c2 DIVU_3   DIVU_2   1 5 000101010100010110111100|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   d 5 110101010100010111111100|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    4 3 010000110000011111110010| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   1 3 000100110000000001111010|        ~302
    * c6 IJT_4    ILL_2    5 3 010100110000110101111011|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   5 3 0101001100001xxxx1110001|        Store pc to mepc.
    * c8 DIV_7    DIV_8    1 c 000111001000011001111101|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   1 3 000100110100001101011100|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   1 c 000111001000011001111101|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc f 3 111100110001101001110110|        mtval = 0.
    * cc OR_0     OR_1     1 3 000100110000011111x10xxx| OR     or
    * cd REM_0    DIV_1    d 3 110100111000010110111001| REM    Branch on sign dividend RS1
    * ce _LCSRRCI_1 ILLe     1 3 0001001100000xxxx1x0xxxx| Illegal instruction seen
    * cf MRET_7   MRET_8   1 6 000101100000001101x10xxx|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  1 5 000101010100000101111100| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   4 3 010000110000001101110110| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     b 8 101110000000010100111001|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 5 3 010100110001110101110110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   f 5 11110101010100010110x100|        Store 5 to mcause
    * d5 eFetch2  eFetch3  4 d 010011010101100011110100|  Fr10  Update ttime
    * d6 eILL0c   ILLe     1 3 0001001100000xxxx1x0xxxx| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  5 3 010100110001110101110110|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  5 3 010100110000011101110110| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  1 3 000100111000011111x10xxx|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   1 3 000100110000010101x10xxx|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   5 5 01010101010100000110x100|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  5 3 010100110000001101110110| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  5 3 010100110001110101110110|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   4 e 010011100001000111110110|  Fr10  Read and latch instruction
    * df eFetch   eFetch2  4 b 010010110011010111110110|  Fr10  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   5 3 010100110000010111110000|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    1 3 000100110000000001111001|        Q = RS1
    * e2 MUL_1    MUL_2    1 8 000110000000010100111100|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   1 8 000110001100010111x10xxx|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   1 3 000100110000011111111010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  1 5 000101011100010101011100|        Q = 4
    * e6 StdIncPc Fetch    6 5 011001011110011011001100|  Fr10  IncPC, OpFetch
    * e7 aFault   aFault_1 5 3 010100110001110101110110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    1 3 000100111000011101111001|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    1 3 000100110100011001011100|        Construct Q = 3
    * ea MULHU_5  MULHU_6  1 3 000100110000011001111100|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     1 3 000100110000001111111010|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    1 3 000100110000011111x10xxx| AND    And 
    * ed REMU_0   DIVU_1   1 3 000100111000011100x10xxx| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     1 3 0001001100000xxxx1x0xxxx| Illegal instruction seen
    * ef WFI_5    Fetch    6 5 011001011111011011001100|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    b 8 101110000000010100111001|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 5 3 010100110001110101110110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 1 3 000100110000000101x10xxx|        Prepare read PC
    * f3 aF_SW    aF_SW_1  1 3 0001001100000xxxx1x01xxx|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2            4 d 010011010101111111111100|  Fr10  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 5 3 010100110001110101110110|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    1 5 000101011100000001011100| WFI    Chk offset=0x105. Now=0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 5 3 010100110001100101110110| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  5 3 010100110000011101110110| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   4 5 010001010100011101110100|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    1 5 000101010100010101111100|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     1 3 000100110000000001110110|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  5 3 010100110000001101110110| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    1 3 000100110000000101x10xxx| NMI    Get current PC
    * fe ILLe     ILL_1    1 3 000100110000000101x0xxxx| Illegal
    * ff QINT_0   QINT_1   1 3 000100110000000101x10xxx| INT    Get current PC
    */
   localparam u0_0 = 256'h76e6501050e2790473867c5af88b7c5afb097a07480474e650e6fcbef9d2fc01;
   localparam u0_1 = 256'h76b75cd477e6eea66e3273e674417613fc74cede79167c15f81440fe781af88b;
   localparam u0_2 = 256'h76e6f642396a403e74307c9678217c967c1d70274804a63550e67c3970e6fc52;
   localparam u0_3 = 256'ha13aa135390376496e32393d71e6761371d7bd03b936e9de64817486f82b76e6;
   localparam u0_4 = 256'h7ce640fe312e503169b17c667c4b7c66718f61477c65fa2b68ea3c607c0bfc50;
   localparam u0_5 = 256'h6edaf970bdfb76496e32b95df69cf96e788b7b57761e39eb6edaf9546edaf1e6;
   localparam u0_6 = 256'h7ccf69b9312e5031797a70f9788b71e6669369f250effa2bfc58bcc872f7f942;
   localparam u0_7 = 256'h617d7190e13476496e3269f27ca876aa647d78774073f6f471767a1a761e39ba;
   localparam u0_8 = 256'h7ca940feb982d02974e6d01a76e6c09c617f449ef9f0fa217c8270a8617dfc85;
   localparam u0_9 = 256'h69f2613471a27168799fc43440fe76136693b9bbdc94e534f195e13444927634;
   localparam u0_A = 256'h7cc5403f10e0403f719ad0c8e43478787c61eed07cafa63a71e6788b5cb6fc5e;
   localparam u0_B = 256'hf9c1f91febde7649bdb5fa1a78c076135cbd5c9a769bfc000000ccde5cb24492;
   localparam u0_C = 256'h504f40feb982d02676e67dc25ca57d6271cb7b477a6ff2e1fc8abcca76e97988;
   localparam u0_D = 256'hf6d5f6f476e5764964925091d042761376a140fef4b46492761e390676c97c37;
   localparam u0_E = 256'hccde40fe10e0d011fa567c225cc679e2761eccde5cb0fa1ad01a3ce8791df0ca;
   localparam u0_F = 256'h50c74046507e7649766b7c4574d9761376ab5cfa76dbfc0048dd50e6761e3972;
   localparam u1_0 = 256'h3301130713871307540140471302404713021303130133411301224611250046;
   localparam u1_1 = 256'h530515c533011205140133015345530764566536460615411307130013071307;
   localparam u1_2 = 256'h3301438713051307154047471307474713404307130110071301180533017746;
   localparam u1_3 = 256'h1007100788055303140138053381530756088305330563365359534113073901;
   localparam u1_4 = 256'h1545130053071307a31d944715419447531d530d154513071300180515460446;
   localparam u1_5 = 256'h531d1125c305530314015305530718c513041304531db805531d1125531d3a25;
   localparam u1_6 = 256'h154053075307130793165305130533015319e31f16011307d545154546031387;
   localparam u1_7 = 256'h531d5308f31453031401e31615c55300554d130113011b25531e1303531db805;
   localparam u1_8 = 256'h15051300d385130735c118c53301d387530e35c11125130713454307530d0046;
   localparam u1_9 = 256'he30e4306d386d386930ef354130053075319530515c5f314530d530cf5d1f31a;
   localparam u1_A = 256'h1540130713871307530d1385f554d38513401405154310073301130515c57746;
   localparam u1_B = 256'h1325132503265303c305130315065307134615c51300454fe00065e615c5f351;
   localparam u1_C = 256'h16031300d3851307f31a1c8613431c865308530d13004307d545154553051607;
   localparam u1_D = 256'h4b354e11531d53035550130513875307531d13004d58f551531db80543031541;
   localparam u1_E = 256'h65f61300138713071303130613461387531d65e615c5130718c5180513005305;
   localparam u1_F = 256'h13011301130153031300154545475307531915c0531d4d5f13001301531db805;
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
   assign d[21] = indir[14];
   assign d[22] = indir[15];
   assign d[23] = indir[16];
   assign d[24] = indir[17];
   assign d[25] = indir[18];
   assign d[26] = indir[19];
   assign d[27] = indir[20];
   assign d[33] = indir[21];
   assign d[42] = indir[22];
   assign d[43] = indir[23];
   // replaces = 000000100100110000000000101001100011100000000
   SB_LUT4 #(.LUT_INIT(16'h0102)) cmb_d08(.O(d[8]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0220)) cmb_d09(.O(d[9]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1020)) cmb_d10(.O(d[10]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0040)) cmb_d14(.O(d[14]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h4800)) cmb_d15(.O(d[15]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2000)) cmb_d18(.O(d[18]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h7f7e)) cmb_d20(.O(d[20]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0094)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0802)) cmb_d35(.O(d[35]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0c00)) cmb_d38(.O(d[38]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 100111011010000110000000000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h91a8)) cmb_d28(.O(d[28]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h90f0)) cmb_d29(.O(d[29]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1900)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h8004)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h8400)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2a07)) cmb_d39(.O(d[39]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h02c5)) cmb_d40(.O(d[40]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2000)) cmb_d44(.O(d[44]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
wire instr0100,instr1x110100;            bn_l4v #(.I(16'h0010)) leq0100(     .o(instr0100),     .i({minx[3:0]}));    bn_l4v #(.I(16'h8000)) leq1x110100( .o(instr1x110100), .i({minx[7],minx[5:4],instr0100}));    SB_DFFE reg_d18( .Q(d[30]), .C(clk), .E(progress_ucode), .D(instr1x110100));
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   No RVC
 *   MULDIV included
 *   minstret for instructions in SRAM and EBR
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 45 columns
 * Removed:  000000000000001000000000000000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 000000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 45
 * 210 distinct lines in remaining untreated columns
 * c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 210 209 210 210 210 210 210 210 210 210 210 210 210 210   x 210 210 208 210 209 210 209 209 210 210 210 210 210 210 210 210 208 208 208 210 209 210 209 210 209 210 210 209 208 209  kill col 27  Tbl  43 cols 000000000000001001000000000000000000000000000 has 208 unique lines.
 * 208 207 208 208 208 208 208 208 208 208 208 208 208 208   x 208 208     207 207 208 206 207 208 208 208 208 208 208 208 208 206 206 206 208 207 208 207 208 207 208 208 207 206 207  kill col 23  Tbl  42 cols 000000000000001001000100000000000000000000000 has 206 unique lines.
 * 206 205 206 206 206 206 206 206 206 206 206 206 206 206   x 206 206     205 204 206     205 206 206 206 206 206 206 206 206 204 204 204 206 205 206 205 206 205 206 206 205 204 205  kill col 25  Tbl  41 cols 000000000000001001010100000000000000000000000 has 204 unique lines.
 * 204 203 204 204 204 204 204 204 204 204 204 204 204 204   x 204 204     203     204     203 204 204 204 204 204 204 204 204 202 201 202 204 203 204 202 204 203 204 204 203 202 203  kill col 12  Tbl  40 cols 000000000000001001010100000000001000000000000 has 201 unique lines.
 * 201 200 200 201 201 201 201 201 201 201 201 201 201 201   x 201 201     200     201     199 201 201 201 201 201 201 201 201 198     199 201 200 201 199 201 200 201 201 200 199 200  kill col 13  Tbl  39 cols 000000000000001001010100000000011000000000000 has 198 unique lines.
 * 198 197 197 198 198 198 198 198 198 198 198 198 198 198   x 198 198     197     198     196 198 198 198 198 198 198 198 198         195 198 197 198 196 198 197 197 198 197 196 197  kill col 11  Tbl  38 cols 000000000000001001010100000000011100000000000 has 195 unique lines.
 * 195 194 193 195 195 195 195 195 195 195 195 195 195 195   x 195 195     194     195     193 195 195 195 195 195 195 195 195             195 194 195 193 195 193 193 195 194 193 194  kill col 42  Tbl  37 cols 001000000000001001010100000000011100000000000 has 193 unique lines.
 * 193 191     193 193 193 193 193 193 193 193 193 193 193   x 193 193     192     193     191 193 193 192 193 193 193 193 193             193 192 193 191 193 191 191 193 192 191 192  kill col 43  Tbl  36 cols 011000000000001001010100000000011100000000000 has 191 unique lines.
 * 191         191 191 191 191 191 191 191 191 191 191 191   x 191 191     190     191     189 191 191 189 191 191 191 191 191             190 190 191 189 191 189 189 191 190 189 189  kill col 22  Tbl  35 cols 011000000000001001010110000000011100000000000 has 189 unique lines.
 * 189         189 189 189 189 189 189 189 189 189 189 189   x 189 189     188     188         189 189 187 189 189 189 189 189             188 188 188 187 188 186 186 189 188 187 186  kill col  5  Tbl  34 cols 011000000000001001010110000000011100000100000 has 186 unique lines.
 * 186         186 186 186 186 186 186 186 186 186 186 186   x 186 186     185     185         186 186 184 186 185 186 186 186             183 185 185 180 181     183 183 182 180 182  kill col  7  Tbl  33 cols 011000000000001001010110000000011100010100000 has 180 unique lines.
 * 180         180 180 180 180 180 180 180 180 179 180 180   x 180 179     179     175         180 180 178 180 177 180 180 180             178 179 179     175     177 175 172 174 176  kill col  2  Tbl  32 cols 011000000000001001010110000000011100010100100 has 172 unique lines.
 * 172         172 172 172 172 172 172 172 172 171 172 172   x 172 171     170     165         172 172 168 172 168 170 172 172             170 171 170     164     167 164     163 165  kill col  1  Tbl  31 cols 011000000000001001010110000000011100010100110 has 163 unique lines.
 * 161         163 163 163 163 163 163 163 162 161 163 163   x 163 162     158     153         161 163 159 163 156 159 163 163             161 161 160     149     153 148         153  kill col  3  Tbl  30 cols 011000000000001001010110000000011100010101110 has 148 unique lines.
 * 146         148 148 148 148 148 148 148 146 146 148 148   x 147 147     144     138         145 148 142 148 139 141 148 145             146 146 145     127     132             132  kill col  6  Tbl  29 cols 011000000000001001010110000000011100011101110 has 127 unique lines.
 * 124         127 127 127 127 127 127 127 125 125 127 125   x 126 126     123     112         123 127 120 127 118 118 127 123             125 125 122             109             109  kill col  4  Tbl  28 cols 011000000000001001010110000000011100011111110 has 109 unique lines.
 * 105         108 109 109 109 109 109 109 106 108 108 107   x 107 107     105      96         103 109 102 109 101 101 109 104             107 107 104                              91  kill col  0  Tbl  27 cols 011000000000001001010110000000011100011111111 has  91 unique lines.
 *  87          90  91  91  91  91  91  91  87  90  90  89   x  88  90      86      83          85  91  85  91  84  84  91  86              89  89  86                                  kill col 24  Tbl  26 cols 011000000000001001011110000000011100011111111 has  83 unique lines.
 *  78          82  83  82  83  82  83  83  79  82  82  81   x  80  82      78                  77  83  77  83  77  74  83  79              81  81  78                                  kill col 16  Tbl  25 cols 011000000000001001011110000010011100011111111 has  74 unique lines.
 *  70          73  74  73  74  73  74  74  70  73  73  72   x  70  72      68                  67  73  66  74  69      74  70              72  72  69                                  kill col 19  Tbl  24 cols 011000000000001001011110010010011100011111111 has  66 unique lines.
 *  62          65  66  64  66  65  66  66  62  65  65  64   x  61  64      60                  60  65      66  60      66  63              64  64  62                                  kill col 26  Tbl  23 cols 011000000000001001111110010010011100011111111 has  60 unique lines.
 *  56          59  60  58  60  59  60  60  56  59  59  58   x  55  57                          54  59      59  54      60  57              58  58  56                                  kill col 21  Tbl  22 cols 011000000000001001111111010010011100011111111 has  54 unique lines.
 *  51          53  54  52  54  53  54  54  50  53  53  52   x  50  51                              51      53  48      54  51              52  52  51                                  kill col 17  Tbl  21 cols 011000000000001001111111010110011100011111111 has  48 unique lines.
 *  46          47  45  46  48  47  48  48  44  47  47  46   x  43  44                              45      47          48  45              46  46  45                                  kill col 29  Tbl  20 cols 011000000000001101111111010110011100011111111 has  43 unique lines.
 *  41          42  40  36  43  42  43  43  40  42  42  41   x      40                              41      42          43  40              41  41  40                                  kill col 39  Tbl  19 cols 011001000000001101111111010110011100011111111 has  36 unique lines.
 *  34          35  33      36  35  36  36  33  35  35  34   x      30                              34      35          36  34              34  34  33                                  kill col 28  Tbl  18 cols 011001000000001111111111010110011100011111111 has  30 unique lines.
 *  28          29  26      29  29  29  30  28  29  29  27   x                                      28      29          30  29              28  28  28                                  kill col 40  Tbl  17 cols 011011000000001111111111010110011100011111111 has  26 unique lines.
 *  24          24          25  25  24  26  24  24  25  24   x                                      24      25          26  25              24  24  24                                  kill col 44  Tbl  16 cols 111011000000001111111111010110011100011111111 has  24 unique lines.
 *              22          23  23  22  24  22  22  23  22   x                                      22      23          24  23              22  22  22                                  kill col 41  Tbl  15 cols 111111000000001111111111010110011100011111111 has  22 unique lines.
 *                          21  21  20  22  20  20  21  20   x                                      20      21          22  21              20  20  20                                  kill col 36  Tbl  14 cols 111111001000001111111111010110011100011111111 has  20 unique lines.
 *                          19  18      20  18  18  19  18   x                                      18      19          20  19              18  18  18                                  kill col 37  Tbl  13 cols 111111011000001111111111010110011100011111111 has  18 unique lines.
 *                          17          18  16  16  17  16   x                                      16      17          18  17              16  16  16                                  kill col 34  Tbl  12 cols 111111011010001111111111010110011100011111111 has  16 unique lines.
Possible good candidates for removal, columns : 8 9 10 20 31 33 
 *
 * Round 1: 000000100101110000000000101001100011100000000  4 columns for indexes to table representing 12 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 37
 * 209 distinct lines in remaining untreated columns
 * c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 209 206 209 209 209 209   x 209 209   x 209   x   x   x   x 209 209 207 209 208 209 208 208 209   x 207   x 209 209   x   x 207 207 207   x   x   x 208 209 208 209 209 208 207 208  kill col 43  Tbl  31 cols 010000100101111000000000101001100011100000000 has 206 unique lines.
 * 206     206 206 206 206   x 206 206   x 206   x   x   x   x 206 206 204 206 205 206 205 205 206   x 204   x 206 206   x   x 204 204 204   x   x   x 205 206 205 206 206 205 204 205  kill col 27  Tbl  30 cols 010000100101111001000000101001100011100000000 has 204 unique lines.
 * 204     204 204 204 204   x 204 204   x 204   x   x   x   x 204 204     203 203 204 202 203 204   x 202   x 204 204   x   x 202 202 202   x   x   x 203 204 203 204 204 203 202 203  kill col 23  Tbl  29 cols 010000100101111001000100101001100011100000000 has 202 unique lines.
 * 202     202 202 202 202   x 202 202   x 202   x   x   x   x 202 202     201 200 202     201 202   x 200   x 202 202   x   x 200 200 200   x   x   x 201 202 201 202 201 201 200 201  kill col 25  Tbl  28 cols 010000100101111001010100101001100011100000000 has 200 unique lines.
 * 200     200 200 200 200   x 200 200   x 200   x   x   x   x 200 200     199     200     198 200   x 198   x 200 200   x   x 198 197 198   x   x   x 198 200 199 200 199 198 198 199  kill col 12  Tbl  27 cols 010000100101111001010100101001101011100000000 has 197 unique lines.
 * 197     195 197 197 197   x 197 197   x 197   x   x   x   x 197 197     196     197     194 197   x 195   x 197 197   x   x 194     195   x   x   x 195 197 196 197 196 195 195 196  kill col 22  Tbl  26 cols 010000100101111001010110101001101011100000000 has 194 unique lines.
 * 194     192 194 194 194   x 194 194   x 194   x   x   x   x 194 194     193     193         194   x 192   x 194 194   x   x 190     192   x   x   x 192 193 192 194 193 192 191 192  kill col 13  Tbl  25 cols 010000100101111001010110101001111011100000000 has 190 unique lines.
 * 190     188 190 190 190   x 190 190   x 190   x   x   x   x 190 190     189     189         190   x 188   x 190 190   x   x         187   x   x   x 186 189 186 189 189 188 187 188  kill col  7  Tbl  24 cols 010000100101111001010110101001111011110000000 has 186 unique lines.
 * 186     183 186 186 186   x 186 186   x 186   x   x   x   x 186 185     185     184         186   x 184   x 185 185   x   x         183   x   x   x     185 181 184 184 182 183 183  kill col  5  Tbl  23 cols 010000100101111001010110101001111011110100000 has 181 unique lines.
 * 181     175 181 181 181   x 181 181   x 181   x   x   x   x 181 180     180     177         181   x 179   x 179 180   x   x         177   x   x   x     178     179 176 174 174 177  kill col  2  Tbl  22 cols 010000100101111001010110101001111011110100100 has 174 unique lines.
 * 174     167 174 174 174   x 174 174   x 174   x   x   x   x 174 173     173     168         174   x 171   x 171 172   x   x         167   x   x   x     166     171 166     165 167  kill col  1  Tbl  21 cols 010000100101111001010110101001111011110100110 has 165 unique lines.
 * 163     158 165 165 165   x 165 165   x 164   x   x   x   x 164 163     163     158         164   x 162   x 162 162   x   x         154   x   x   x     149     156 150         154  kill col  6  Tbl  20 cols 010000100101111001010110101001111011111100110 has 149 unique lines.
 * 147     139 149 148 149   x 149 149   x 148   x   x   x   x 146 146     146     139         147   x 146   x 145 145   x   x         138   x   x   x             133 126         133  kill col  3  Tbl  19 cols 010000100101111001010110101001111011111101110 has 126 unique lines.
 * 123     113 126 124 126   x 126 125   x 124   x   x   x   x 122 123     123     113         124   x 119   x 117 120   x   x         112   x   x   x             104             103  kill col  0  Tbl  18 cols 010000100101111001010110101001111011111101111 has 103 unique lines.
 *  98      90 102 101 103   x 103 102   x 101   x   x   x   x  99  99      97      90          99   x  95   x  94  94   x   x          92   x   x   x              81                  kill col  4  Tbl  17 cols 010000100101111001010110101001111011111111111 has  81 unique lines.
 *  77      69  80  79  81   x  81  80   x  78   x   x   x   x  76  78      75      71          77   x  75   x  74  74   x   x          72   x   x   x                                  kill col 42  Tbl  16 cols 011000100101111001010110101001111011111111111 has  69 unique lines.
 *  66          68  67  69   x  69  68   x  66   x   x   x   x  65  65      62      60          66   x  64   x  61  62   x   x          58   x   x   x                                  kill col 11  Tbl  15 cols 011000100101111001010110101001111111111111111 has  58 unique lines.
 *  55          57  56  58   x  58  57   x  55   x   x   x   x  55  54      51      50          54   x  52   x  47  51   x   x               x   x   x                                  kill col 17  Tbl  14 cols 011000100101111001010110101101111111111111111 has  47 unique lines.
 *  44          46  44  46   x  47  46   x  44   x   x   x   x  42  42      41      41          43   x  39   x      41   x   x               x   x   x                                  kill col 19  Tbl  13 cols 011000100101111001010110111101111111111111111 has  39 unique lines.
 *  36          38  36  38   x  39  38   x  36   x   x   x   x  34  34      33      34          35   x       x      34   x   x               x   x   x                                  kill col 26  Tbl  12 cols 011000100101111001110110111101111111111111111 has  33 unique lines.
 *  30          32  30  32   x  33  32   x  30   x   x   x   x  29  29              27          28   x       x      28   x   x               x   x   x                                  kill col 24  Tbl  11 cols 011000100101111001111110111101111111111111111 has  27 unique lines.
 *  24          26  24  25   x  26  26   x  24   x   x   x   x  23  24                          22   x       x      21   x   x               x   x   x                                  kill col 16  Tbl  10 cols 011000100101111001111110111111111111111111111 has  21 unique lines.
 *  19          20  18  19   x  20  20   x  18   x   x   x   x  17  17                          16   x       x           x   x               x   x   x                                  kill col 21  Tbl   9 cols 011000100101111001111111111111111111111111111 has  16 unique lines.
 *
 * Round 2: 100111011010000110000000000000000000000000000  4 columns for indexes to table representing  9 original columns (uses 16 of 16 lines in indirect table).
 * Direct:  011000000000000001111111010110011100011111111 23 columns
 * Can even chose 1 more column to be represented directly.
 * Success. Use 2 EBRs, 20 LUTs.
 */

module v7_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    *                      indirect_index 1
    * inx         next     | indirect index 0
    * || ucode    ucode    | | direct representation
    * 00 LB_0     LB_1     0 0 000000000100110111111000| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 000100010000101111110011|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 001000100100110111111000| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 _L0x03   StdIncPc 1 3 00010011000000101x10xxx0| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 3 3 001100110100001011101000| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   1 3 00010011000000101x01xxx0| AUIPC  q = imm20 (copy x/2)
    * 06 LB_3     LB_4     1 3 000100110000011011110100|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     1 3 000100110000010111110110|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     4 0 010000000100111011111000| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     1 3 000100110000010111110000|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     4 0 010000000100111011111000| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    5 4 010101000000001011100110|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   1 3 000100110000111011110010| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    1 3 00010011100011101x10xxx0| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    1 3 00010011000011101x10xxx0| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 3 3 001100110000001011101100| LUI    q = imm20
    * 10 SUB_1    LB_6     1 3 000100110000111111110000|        Q = ~RS2
    * 11 AND_1    ANDI_1   1 3 000100110000111011110000|        RS1^0xffffffff to Q
    * 12 _L0x12   ILLe     1 3 000100110000xxxx1x0xxxx0|  Not in use (illegal as entry)
    * 13 condb_2  condb_3  1 3 000100110000111111110000|        ~RS2 in Q
    * 14 condb_3  condb_4  1 5 000101010100001011111000|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  4 6 010001100000110011110010|        Branch on condition
    * 16 condb_5  Fetch    6 7 011001110010110110011100|        Branch not taken.
    * 17 condb_5t BrOpFet  6 4 011001000110110111111000|        Branch taken.
    * 18 BEQ      condb_2  5 3 010100110000111011101100| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   5 3 010100110100101011101000| JALR   yy=RS1+imm
    * 1a ANDI_1   StdIncPc 3 3 001100110000001011100110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    1 4 000101000000001011011100| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 1 2 000100100000101111011100| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 3 3 001100110000001011101110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 1 5 000101011100101010111000|        Q = 4
    * 1f IJ_2     IJ_3     5 3 010100110000101011101100|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     7 8 011110000100110111111000| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 3 3 001100110000001011100000|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  1 9 000110010000101011111001|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 _L0x23   StdIncPc 1 3 00010011000000101x10xxx0| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   1 0 0001000000001111010x1100| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   1 3 00010011000000101x01xxx0| AUIPC  q = imm20 (copy x/2)
    * 26 OR_1     OR_2     4 3 010000110000111011100000|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    1 3 000100110100000011111000|        Q = rs2
    * 28 _L0x28   SH_1     4 8 010010000100111011111000| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   1 3 000100110000111011110000|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     4 8 010010000100111011111000| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  1 5 000101010100xxxx11101000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    1 3 00010011000011101x0xxxx0| SLL    Shift left
    * 2d MULH_0   MULH_1   1 3 000100110000101001110010| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e MULHU_1  MULHU_2  4 3 010000111000111111101100|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 2f _L0x2f   StdIncPc 3 3 001100110000001011101100| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 3 a 001110100000001011101100|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  1 3 000100110000111111110000|        ~rs2 to Q
    * 32 JAL_1    JAL_2    5 3 010100110100001011101000|        Target adr to yy
    * 33 JAERR_1  JAERR_2  5 3 0101001101110010110x1000|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    6 b 011010110010110111010010|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   3 3 001100110000101101110010|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   8 3 100000110000101101111010|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  5 6 010101100001xxxx11100010|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  5 3 010100110000111011101100| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 3 3 001100111000001011100010|        Last shift.
    * 3a SRxI_1   SRxI_2   3 9 001110010000101001110011|        Register to shift to Q
    * 3b _L0x3b   JAL_1    1 4 000101000000001011011100| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  5 3 010100110000011011101100| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   8 9 100010010000101001110011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   1 0 0001000000001111010x0010|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   1 0 0001000000001111010x0010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 4 000001000100110111111000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   1 5 000101010100110011111000|        Q=1
    * 42 MULHU_2  MULHU_3  1 9 000110010000101001111001|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  1 3 000100110000000011010000|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  1 3 000100110000111111110100| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    1 5 000101010100101011111000|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    5 3 0101001100011010110x0010|        Store PC to mepc
    * 47 ILL_2    ILL_3    5 3 010100110011101011100010|        Store 0 to mtval
    * 48 _L0x48   SW_1     9 4 100101000100111011111000| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  1 5 000101010100001011111000|        Construct PC storage adr
    * 4a _L0x4a   SW_1     9 4 100101000100111011111000| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  a 3 101000110011101011010010|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   1 3 00010011000011101x10xxx0| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  5 3 010100110000111001100010| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     1 3 000100110000xxxx1x0xxxx0| Illegal instruction seen
    * 4f MRET_8   StdIncPc 1 5 000101010100101011111000|        Prep +4
    * 50 LW_1     StdIncPc 3 c 001111000000101111100010|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   5 3 010100110011101011011100|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 000100010000101111110011|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   5 3 010100110011101011011100|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     b 9 101110010000101001110011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 5 3 010100110011101011101100|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 3 000100110000100011110110|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     1 3 000100110000100011110000|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    1 9 000110011100101111110011|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   5 3 010100110000111111101100|        REM = Q to yy
    * 5a SB_1     SB_2     5 3 010100110000101101110010|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    1 4 000101000000001011011100| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRW_1  5 3 010100110000011011101100| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     c 3 110000110000101101111010|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 000100010000101111110011|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   5 3 010100110011101011011100|  err   LD AlignFault. Faulting adr to mtval
    * 60 MULHU_3  MULHU_2  1 3 000100111000111111110010|        Shift Q and rM. Prepare read rs1
    * 61 EBRKWFI2 EBREAK_1 4 6 010001100000011011100100| EBREAK/WFI2 Select EBREAK or WFI
    * 62 DIV_8    DIV_7    1 5 000101010100101101111000|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    d 5 110101010100101111111000|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  1 3 000100110000111111110100| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    1 6 00010110000000101x10xxx0|        Prepare read PC
    * 66 SW_1     SW_2     e 3 111000110011111011010010|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    5 3 0101001100110010110x1100|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 3 3 001100110000001011100010|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     1 3 000100110000101011110000|        RS2 > 0, RS1 < 0, change sign yy
    * 6a MULH_1   MULH_2   5 3 010100110000101011100000|        Store ~rs1 to Ryy. Prep construct 1.
    * 6b SB_4     SB_5     9 3 100100110010110011110010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   1 3 00010011000011101x10xxx0| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  5 3 010100110000111001100010| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e DIV_C    DIV_e    5 3 010100110000111011010010|        rM to yy. Q=ffffffff
    * 6f MRET_6   MRET_7   1 5 000101010100xxxx11111000|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    b 9 101110010000101001110011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 5 3 010100110011101011101100|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   1 3 000100110000011011110100|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  5 3 010100110011110011100010|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   1 d 000111010000101111101100| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  1 3 00010011000000101x0xxxx0|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  1 3 000100110000001011110000|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  5 5 0101010101011010110x1000|        origPC to mepc. Prep read 0
    * 78 DIV_4    DIV_6    5 3 010100110000000011101100|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    1 5 000101011100101011111000|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     e 3 111000110010110011010010|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    1 4 000101000000001011011100| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRW_1  5 3 010100110000011011101100| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  JAL_3    f 3 1111001100101001110x0010|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    5 3 010100110001xxxx11100010|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  5 3 0101001100111010110x0010|        mtval is target
    * 80 LBU_0    LBU_1    0 0 000000000100110111111000| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  5 3 0101001100011010110x0010|        Store PC to mepc
    * 82 DIV_1    DIV_3    4 3 010000110000111011100000|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    1 3 000100110100101011111000|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   1 3 000100110000111111110100| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 000100010000101111110011|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   3 5 0011010111000010100x1000|        Return address to TRG
    * 87 JALRE1   JALRE2   5 3 0101001100011100110x0010|  err   Store pc to mepc
    * 88 DIV_E    DIV_10   d 3 11010011100011111x0xxxx0|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 3 3 001100110000001011101100|        RS2 == 0, return 0xffffffff
    * 8a DIVU_5   ANDI_1   1 9 00011001110010111x10xxx1|        Transfer rM to rDee
    * 8b LB_6     StdIncPc 3 5 001101011100001011101000|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    1 3 00010011000011111x10xxx0| XOR    xor
    * 8d DIV_0    DIV_1    d 3 110100111000101101110010| DIV    Branch on sign dividend RS1
    * 8e _LCSRRS_1 ILLe     1 3 000100110000xxxx1x0xxxx0| Illegal instruction seen
    * 8f ILL_3    ILL_4    1 5 000101010000101011111000|        Q = 1
    * 90 NMI_2    JAL_3    f 3 111100110011010011101100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   f 5 1111010111100010100x1000|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    5 3 0101001100011001110x0010|        PC to mepc
    * 93 SW_E2    SW_E3    5 3 010100110001101111100010|        Store address that faulted
    * 94 SW_E4    JAL_3    f 3 1111001100101001110x1010|        Store 6 to mcause
    * 95 SW_E3    SW_E4    1 5 000101011100101110111000|        Q = 3
    * 96 SH_1     SH_2     5 3 010100110000101101110010|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    5 3 0101001100110010110x1100|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  5 3 010100110000111011101100| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     1 3 000100110000xxxx1x0xxxx0|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    f 3 1111001101101001100x1000|        mcause = 11
    * 9b SH_4     SH_5     9 3 100100110001110011110010|        Address back to Q. Prepare get item to write
    * 9c DIV_10   DIV_12   d 3 110100111000110011100010|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   d 3 110100111000110011100010|        RS2 < 0. Branch on sign of RS1
    * 9e JAL_25   JAL_3    4 3 0100001100001100110x0010|        Instr. adr. to jj in case of access error
    * 9f SH_5     SW_2     e 3 111000110001110011010010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    7 8 011110000100110111111000| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  1 5 000101011100101010111000|        Q = 4
    * a2 DIV_14   LB_6     1 3 000100110000101011110000|        RS2 < 0, RS1 >= 0, change sign yy
    * a3 DIV_15   StdIncPc 3 3 001100110000001011100010|        RS2 < 0, RS1 < 0, yy is true result
    * a4 SRxI_0   SRxI_1   1 0 0001000000001111010x1100| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   1 5 000101010100011011111000|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  1 4 000101000000101111011100| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 1 3 000100110100xxxx11111000| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    d 3 110100111000101011110000|        Branch on sign divisor RS2
    * a9 ILL_4    JAL_3    f 5 1111010101101001110x1000|        Store 2 to mcause
    * aa DIV_6    DIV_7    1 3 00010011100010111x10xxx0|        Write M. Prepare shift
    * ab EBREAK_2 ECALL_6  5 3 010100110001101011100010|        pc to mepc
    * ac _L0xac   SRx_1    1 3 00010011000011101x0xxxx0| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   1 3 00010011100011100x10xxx0| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _L0xae   SRx_1    1 3 00010011000011101x0xxxx0| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   1 5 000101010100xxxx11111000|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   f 3 1111001101100010100x1000|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  1 5 000101011100101010111000|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    6 7 011001111100110110011000|        IncPC, OpFetch, but force +4
    * b3 unxb3             e 0 1110000000xxxxxxxxxxxxxx| b3: Not in use 
    * b4 eFetch3           4 5 010001010101111111111000|  Fr11  Write minstret. Update I. Q=immediate, use dinx
    * b5 SH_3     SH_4     1 3 000100110000000011101100|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  1 5 000101011100101010111000|        Q = 8
    * b7 IJ_3     IJ_4     1 3 000100110100110010111000|        Construct Q = 3
    * b8 BGE      condb_2  5 3 010100110000111011101100| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    1 5 000101010000110011110000|        Calc carry of RS2+0xFFFFFFFF
    * ba LHU_3    ANDI_1   1 3 000100110000011111110100|        Invert q. Prepare read mask
    * bb SH_2     SH_3     c 3 110000110000101101111010|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  5 3 010100110000011011101100| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    0 b 000010110000110111010110|        Mask and use as PC
    * be IJ_1     IJ_2     1 b 000110110000101111110010|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    1 b 000110110000101111110010|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    1 6 000101100000111011110010|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    5 3 010100110000101011101100|        Read word is to be masked with ~3u
    * c2 DIVU_3   DIVU_2   1 5 000101010100101101111000|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   d 5 110101010100101111111000|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    4 3 010000110000111111100100| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   1 3 000100110000000011110100|        ~302
    * c6 IJT_4    ILL_2    5 3 010100110001101011110110|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   5 3 010100110001xxxx11100010|        Store pc to mepc.
    * c8 DIV_7    DIV_8    1 e 000111101000110011111010|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   1 3 000100110100011010111000|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   1 e 000111101000110011111010|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc f 3 111100110011010011101100|        mtval = 0.
    * cc OR_0     OR_1     1 3 00010011000011111x10xxx0| OR     or
    * cd REM_0    DIV_1    d 3 110100111000101101110010| REM    Branch on sign dividend RS1
    * ce _LCSRRCI_1 ILLe     1 3 000100110000xxxx1x0xxxx0| Illegal instruction seen
    * cf MRET_7   MRET_8   1 6 00010110000001101x10xxx0|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  1 5 000101010100001011111000| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   4 3 010000110000011011101100| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     b 9 101110010000101001110011|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 5 3 010100110011101011101100|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   f 5 1111010101100010110x1000|        Store 5 to mcause
    * d5 unxd5             e 0 1110000000xxxxxxxxxxxxxx| d5: Not in use
    * d6 eILL0c   ILLe     1 3 000100110000xxxx1x0xxxx0| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  5 3 010100110011101011101100|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  5 3 010100110000111011101100| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  1 3 00010011100011111x10xxx0|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   1 3 00010011000010101x10xxx0|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   5 5 0101010101100000110x1000|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  5 3 010100110000011011101100| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  5 3 010100110011101011101100|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   4 d 010011010010101111101100|  Fr11  Read and latch instruction
    * df eFetch   Fetch2   4 d 010011010010101111101100|  Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   5 3 010100110000101111100000|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    1 3 000100110000000011110010|        Q = RS1
    * e2 MUL_1    MUL_2    1 9 000110010000101001111001|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   1 9 00011001110010111x10xxx1|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   1 3 000100110000111111110100| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  1 5 000101011100101010111000|        Q = 4
    * e6 StdIncPc Fetch    6 7 011001111100110110011000|  Fr11  IncPC, OpFetch
    * e7 aFault   aFault_1 5 3 010100110011101011101100|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    1 3 000100111000111011110010|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    1 3 000100110100110010111000|        Construct Q = 3
    * ea MULHU_5  MULHU_6  1 3 000100110000110011111000|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     1 3 000100110000011111110100|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    1 3 00010011000011111x10xxx0| AND    And 
    * ed REMU_0   DIVU_1   1 3 00010011100011100x10xxx0| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     1 3 000100110000xxxx1x0xxxx0| Illegal instruction seen
    * ef WFI_5    Fetch    6 7 011001111110110110011000|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    b 9 101110010000101001110011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 5 3 010100110011101011101100|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 1 3 00010011000000101x10xxx0|        Prepare read PC
    * f3 aF_SW    aF_SW_1  1 3 000100110000xxxx1x01xxx0|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   eFetch3  4 f 010011110111000111101000|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 5 3 010100110011101011101100|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    1 5 000101011100000010111000| WFI    Chk offset=0x105. Now=0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 5 3 010100110011001011101100| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  5 3 010100110000111011101100| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   4 5 010001010100111011101000|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    1 5 000101010100101011111000|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     1 3 000100110000000011101100|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  5 3 010100110000011011101100| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    1 3 00010011000000101x10xxx0| NMI    Get current PC
    * fe ILLe     ILL_1    1 3 00010011000000101x0xxxx0| Illegal
    * ff QINT_0   QINT_1   1 3 00010011000000101x10xxx0| INT    Get current PC
    */
   localparam u0_0 = 256'hece6a010a0e2f204e686f85af08bf85af609f4079004e8e6a0e6f8bef3d2f801;
   localparam u0_1 = 256'hecb7b8d4eee6dca6dc32e6e6e841ec13f8749cdef216f815f01480fef01af08b;
   localparam u0_2 = 256'hece6ec42726a803ee830f896f021f896f81de02790044c35a0e6f939e0e6f852;
   localparam u0_3 = 256'h423a42357303ec49dc32733de2e6ec13e2d77a037236d2dec881e886f02bece6;
   localparam u0_4 = 256'hf8e680fe622ea031d2b1f866f84bf866e28fc247f865f42bd0ea7960f80bf850;
   localparam u0_5 = 256'hdcdaf3707afbec49dc32725dec9cf36ef08bf657ec1e73ebdcdaf354dcdae2e6;
   localparam u0_6 = 256'hf8cfd2b9622ea031f27ae0f9f08be2e6cc93d2f2a0eff42bf85878c8e4f7f242;
   localparam u0_7 = 256'hc27de290c234ec49dc32d2f2f8a8ecaac87df0778073ecf4e276f41aec1e73ba;
   localparam u0_8 = 256'hf8a980fe7282a029e8e6a11aece6809cc27f889ef3f0f421f882e0a8c27df885;
   localparam u0_9 = 256'hd2f2c234e2a2e268f29f883480feec13cc9372bbb894ca34e295c2348892ec34;
   localparam u0_A = 256'hf8c5803f20e0803fe29aa0c8c834f078f861dcd0f8af4c3ae2e6f08bb8b6f85e;
   localparam u0_B = 256'hf2c1f21fd6deec497ab5f41af0c0ec13b8bdb89aec9bf800000098deb8b28892;
   localparam u0_C = 256'ha04f80fe7282a026ece6fac2b8a5fa62e2cbf647f46fe4e1f88a78caece9f288;
   localparam u0_D = 256'hecf4ecf4ece5ec49c892a091a042ec13eca180fe0000c892ec1e7306ecc9f837;
   localparam u0_E = 256'h98de80fe20e0a011f456f822b8c6f2e2ec1e98deb8b0f41aa11a79e8f21de0ca;
   localparam u0_F = 256'ha0c78046a07eec49ec6bf845e8d9ec13ecabb8faecdbe8b490dda0e6ec1e7372;
   localparam u1_0 = 256'h3302130e138e130e5402404e1305404e13051306130233421302224d110b004d;
   localparam u1_1 = 256'h530a15ca3302120b14023302534a530e646d672d460c1542130f1300130e130f;
   localparam u1_2 = 256'h3302438f130a130e1540484e130e484e1340430e1302100f1302190a3302784d;
   localparam u1_3 = 256'h100f100f890a53061402390a3382530e5610830b330b6b2d53725342130f3a02;
   localparam u1_4 = 256'h154a1300530e130ea33a944e1542944e533a531a154a130f1300190a154c044d;
   localparam u1_5 = 256'h533a110bc30b53061402530b530f19cb13081308533ab90a533a110b533a3c0b;
   localparam u1_6 = 256'h1540530e530e130e932c530a130a33025332e33e1602130fd54b154b4606138f;
   localparam u1_7 = 256'h533a5310f32953061402e32c15ca5300555a130213021d0b533c1306533ab90a;
   localparam u1_8 = 256'h150a1300d38b130f35c219cb3302d38f531c35c2110b130f134a430e531a004d;
   localparam u1_9 = 256'he31c430cd38cd38c931cf3691300530e5332530b15cbf329531b5319f5e2f334;
   localparam u1_A = 256'h1540130e138e130e531a138bf569d38a1340140b1546100f3302130a15ca784d;
   localparam u1_B = 256'h1b0b1b0b0b0d5306c30b1307150c530e134c15ca1300455fe00067cd15caf362;
   localparam u1_C = 256'h16061300d38b130ff3341e8c13461e8c5310531a1300430fd54b154b530a160e;
   localparam u1_D = 256'h4d2b4d2b533a53065560130a138f530e533a1300e000f562533ab90a43061542;
   localparam u1_E = 256'h67ed1300138e130f1307130c134c138e533a67cd15ca130f19cb190a1300530b;
   localparam u1_F = 256'h13021302130253061300154a454e530e533215c0533a4f7113001302533ab90a;
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
   assign d[8] = indir[8];
   assign d[11] = indir[9];
   assign d[12] = indir[10];
   assign d[13] = indir[11];
   assign d[16] = indir[12];
   assign d[17] = indir[13];
   assign d[19] = indir[14];
   assign d[21] = indir[15];
   assign d[22] = indir[16];
   assign d[23] = indir[17];
   assign d[24] = indir[18];
   assign d[25] = indir[19];
   assign d[26] = indir[20];
   assign d[27] = indir[21];
   assign d[42] = indir[22];
   assign d[43] = indir[23];
   // replaces = 000000100101110000000000101001100011000000000
   SB_LUT4 #(.LUT_INIT(16'h04a0)) cmb_d09(.O(d[9]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h40a0)) cmb_d10(.O(d[10]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0040)) cmb_d14(.O(d[14]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2000)) cmb_d15(.O(d[15]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h8000)) cmb_d18(.O(d[18]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hfefe)) cmb_d20(.O(d[20]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0114)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h3882)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2002)) cmb_d35(.O(d[35]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h3000)) cmb_d38(.O(d[38]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 100111011010000110000000000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h91a8)) cmb_d28(.O(d[28]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h90f0)) cmb_d29(.O(d[29]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1900)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h8004)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h8400)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2a07)) cmb_d39(.O(d[39]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h02c5)) cmb_d40(.O(d[40]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2000)) cmb_d44(.O(d[44]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
wire instrxxxx0100,instr1011xxxx,instr10110100;          bn_l4v #(.I(16'h0010)) leq0100(     .o(instrxxxx0100),     .i({minx[3:0]}));  bn_l4v #(.I(16'h0800)) leq1011(     .o(instr1011xxxx),     .i({minx[7:4]}));  bn_l4v #(.I(16'h8888)) leq1x110100( .o(instr10110100), .i({2'b0,instr1011xxxx,instrxxxx0100}));   SB_DFFE reg_d18( .Q(d[30]), .C(clk), .E(progress_ucode), .D(instr10110100));
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   RVC included
 *   No MULDIV
 *   minstret not implemented
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 43 columns
 * Removed:  0000000000001000000000001000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 0000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 43
 * 167 distinct lines in remaining untreated columns
 * c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 166 167 167 167 167 167 167 167 167 167 167 167   x 167 167 167 167 166 167 166 166 167 167 165   x 167 167 167 167 165 164 166 167 166 167 166 167 166 167 167 166 166 166  kill col 12  Tbl  40 cols 0000000000001000000000001000001000000000000 has 164 unique lines.
 * 163 164 164 164 164 164 164 164 164 164 164 164   x 164 164 164 164 162 164 163 161 164 164 162   x 164 164 164 164 162     162 163 163 164 163 164 163 164 164 163 163 163  kill col 22  Tbl  39 cols 0000000000001000000010001000001000000000000 has 161 unique lines.
 * 160 161 161 161 161 161 161 161 161 161 161 161   x 161 161 161 161 160 161 160     161 161 159   x 161 161 161 161 159     159 160 160 161 160 160 159 161 161 160 160 159  kill col 19  Tbl  38 cols 0000000000001000000010011000001000000000000 has 159 unique lines.
 * 158 159 159 159 159 159 159 159 159 159 159 159   x 159 159 159 159 158 159 158     159 159       x 159 159 159 159 157     156 158 158 159 158 158 157 159 159 158 158 157  kill col 11  Tbl  37 cols 0000000000001000000010011000001100000000000 has 156 unique lines.
 * 155 156 156 156 156 156 156 156 156 156 156 156   x 156 156 156 156 155 156 155     156 156       x 156 156 156 156 150         155 155 156 155 155 154 155 156 155 155 154  kill col 13  Tbl  36 cols 0000000000001000000010011000011100000000000 has 150 unique lines.
 * 149 150 150 150 150 150 150 150 150 150 150 150   x 150 150 150 150 149 150 149     150 150       x 150 150 150 150             149 149 149 149 149 148 149 150 149 149 148  kill col  5  Tbl  35 cols 0000000000001000000010011000011100000100000 has 148 unique lines.
 * 147 148 148 148 148 148 148 148 148 148 148 148   x 148 148 148 148 147 148 147     148 148       x 148 148 148 148             147 147 147 145 147     147 147 145 145 145  kill col  7  Tbl  34 cols 0000000000001000000010011000011100010100000 has 145 unique lines.
 * 144 145 145 145 145 145 145 145 145 145 145 145   x 145 144 145 145 144 144 144     145 145       x 144 145 145 145             144 144 144     144     144 143 141 140 142  kill col  1  Tbl  33 cols 0000000000001000000010011000011100010100010 has 140 unique lines.
 * 139 140 140 140 140 140 140 140 140 140 140 140   x 140 139 140 140 139 139 139     140 140       x 139 138 140 140             139 139 139     138     139 136 137     137  kill col  3  Tbl  32 cols 0000000000001000000010011000011100010101010 has 136 unique lines.
 * 135 136 136 136 136 136 136 136 136 136 136 136   x 136 135 136 135 134 135 135     136 136       x 135 132 135 136             135 135 135     132     133     129     133  kill col  2  Tbl  31 cols 0000000000001000000010011000011100010101110 has 129 unique lines.
 * 128 129 129 129 129 129 129 129 127 129 129 129   x 129 128 128 128 125 127 124     129 129       x 126 124 128 128             128 128 128     118     119             121  kill col  6  Tbl  30 cols 0000000000001000000010011000011100011101110 has 118 unique lines.
 * 117 118 118 118 118 118 118 118 117 118 118 117   x 118 117 115 117 112 114 113     118 118       x 114 112 117 117             117 117 117             102             106  kill col  4  Tbl  29 cols 0000000000001000000010011000011100011111110 has 102 unique lines.
 * 100 102 102 102 102 102 102 102 100 102 101 101   x 101 100  99 101  95  98  97     102 102       x  96  96 101  99             101 101 101                              87  kill col  0  Tbl  28 cols 0000000000001000000010011000011100011111111 has  87 unique lines.
 *  85  87  87  87  87  87  87  87  84  87  86  86   x  85  85  85  86  81  83  82      87  87       x  81  80  86  83              86  86  85                                  kill col 16  Tbl  27 cols 0000000000001000000010011010011100011111111 has  80 unique lines.
 *  78  80  80  80  80  80  80  80  77  79  79  79   x  78  78  77  79  73  75  74      79  79       x  74      79  76              79  79  78                                  kill col 25  Tbl  26 cols 0000000000001000010010011010011100011111111 has  73 unique lines.
 *  71  73  73  73  73  73  73  73  70  72  72  71   x  70  72  70  71      67  63      71  72       x  66      72  69              72  72  71                                  kill col 23  Tbl  25 cols 0000000000001000010110011010011100011111111 has  63 unique lines.
 *  61  62  63  63  63  63  63  63  60  62  62  61   x  60  62  60  60      58          61  62       x  57      62  59              62  62  61                                  kill col 17  Tbl  24 cols 0000000000001000010110011110011100011111111 has  57 unique lines.
 *  55  56  57  57  57  57  57  57  54  56  56  55   x  53  56  55  55      53          55  56       x          56  53              56  56  55                                  kill col 29  Tbl  23 cols 0000000000001100010110011110011100011111111 has  53 unique lines.
 *  51  52  53  50  53  53  53  53  51  52  52  51   x      52  50  50      48          52  52       x          52  49              52  52  51                                  kill col 24  Tbl  22 cols 0000000000001100011110011110011100011111111 has  48 unique lines.
 *  46  47  47  44  48  47  48  48  46  47  47  46   x      45  44  43                  46  47       x          46  45              47  47  46                                  kill col 26  Tbl  21 cols 0000000000001100111110011110011100011111111 has  43 unique lines.
 *  41  42  42  39  43  42  43  43  41  42  42  41   x      41  39                      41  42       x          41  41              42  42  41                                  kill col 39  Tbl  20 cols 0001000000001100111110011110011100011111111 has  39 unique lines.
 *  37  38  37      39  38  39  39  37  38  38  37   x      34  35                      37  37       x          38  37              38  38  37                                  kill col 28  Tbl  19 cols 0001000000001110111110011110011100011111111 has  34 unique lines.
 *  32  33  31      33  33  33  34  32  33  33  31   x          31                      32  31       x          33  33              33  33  32                                  kill col 40  Tbl  18 cols 0011000000001110111110011110011100011111111 has  31 unique lines.
 *  29  28          30  30  29  31  29  28  30  29   x          27                      29  28       x          30  30              30  30  29                                  kill col 27  Tbl  17 cols 0011000000001111111110011110011100011111111 has  27 unique lines.
 *  25  25          26  26  25  27  25  24  26  25   x                                  25  24       x          26  26              26  26  25                                  kill col 33  Tbl  16 cols 0011000001001111111110011110011100011111111 has  24 unique lines.
 *  23  22          23  23  22  24  22      23  22   x                                  22  21       x          23  23              23  23  22                                  kill col 20  Tbl  15 cols 0011000001001111111110111110011100011111111 has  21 unique lines.
 *  20  19          20  20  19  21  19      20  20   x                                  20           x          20  20              20  20  19                                  kill col 41  Tbl  14 cols 0111000001001111111110111110011100011111111 has  19 unique lines.
 *  18              18  18  17  19  17      18  18   x                                  18           x          18  18              18  18  17                                  kill col 36  Tbl  13 cols 0111001001001111111110111110011100011111111 has  17 unique lines.
 *  16              16  15      17  15      16  16   x                                  16           x          16  16              16  16  15                                  kill col 37  Tbl  12 cols 0111011001001111111110111110011100011111111 has  15 unique lines.
Possible good candidates for removal, columns : 8 14 31 34 
 *
 * Round 1: 1000100110110000000001000001100011100000000  4 columns for indexes to table representing 12 original columns (uses 15 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 35
 * 162 distinct lines in remaining untreated columns
 * c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x 162 162 162   x 162 162   x   x 162   x   x   x 162 162 162 162 161 162 161 161   x 162 159   x 162 162   x   x 160 159 160   x   x   x 161 162 161 162 162 161 161 161  kill col 19  Tbl  28 cols 1000100110111000000001011001100011100000000 has 159 unique lines.
 *   x 159 159 159   x 159 159   x   x 159   x   x   x 159 159 159 159 158 159 158 158   x 159       x 159 159   x   x 157 156 157   x   x   x 158 159 158 159 159 158 158 158  kill col 12  Tbl  27 cols 1000100110111000000001011001101011100000000 has 156 unique lines.
 *   x 156 156 156   x 156 156   x   x 156   x   x   x 156 156 156 156 154 156 155 153   x 156       x 156 156   x   x 154     153   x   x   x 155 156 155 156 156 155 155 155  kill col 22  Tbl  26 cols 1000100110111000000011011001101011100000000 has 153 unique lines.
 *   x 153 153 153   x 153 153   x   x 153   x   x   x 153 153 153 153 152 153 152       x 153       x 153 153   x   x 150     150   x   x   x 152 152 151 153 153 152 152 151  kill col 13  Tbl  25 cols 1000100110111000000011011001111011100000000 has 150 unique lines.
 *   x 150 150 150   x 150 150   x   x 150   x   x   x 150 150 150 150 149 150 149       x 150       x 150 150   x   x         143   x   x   x 149 148 148 150 150 149 149 148  kill col 11  Tbl  24 cols 1000100110111000000011011001111111100000000 has 143 unique lines.
 *   x 143 143 143   x 143 143   x   x 143   x   x   x 143 143 143 143 142 143 142       x 143       x 143 143   x   x               x   x   x 142 141 140 142 142 142 142 141  kill col  5  Tbl  23 cols 1000100110111000000011011001111111100100000 has 140 unique lines.
 *   x 140 140 140   x 140 140   x   x 139   x   x   x 140 140 140 140 139 140 139       x 140       x 140 139   x   x               x   x   x 136 138     139 139 137 137 136  kill col  7  Tbl  22 cols 1000100110111000000011011001111111110100000 has 136 unique lines.
 *   x 136 136 136   x 136 136   x   x 134   x   x   x 136 135 136 136 134 133 135       x 136       x 134 134   x   x               x   x   x     133     134 133 130 131 132  kill col  2  Tbl  21 cols 1000100110111000000011011001111111110100100 has 130 unique lines.
 *   x 130 130 130   x 130 130   x   x 127   x   x   x 130 129 129 130 126 127 126       x 129       x 126 127   x   x               x   x   x     126     128 126     124 125  kill col  1  Tbl  20 cols 1000100110111000000011011001111111110100110 has 124 unique lines.
 *   x 124 124 124   x 124 124   x   x 122   x   x   x 123 123 123 124 120 119 118       x 123       x 120 116   x   x               x   x   x     116     118 112         119  kill col  3  Tbl  19 cols 1000100110111000000011011001111111110101110 has 112 unique lines.
 *   x 112 111 112   x 112 112   x   x 110   x   x   x 111 111 111 111 108 106 105       x 110       x 106 103   x   x               x   x   x     102      99             100  kill col  4  Tbl  18 cols 1000100110111000000011011001111111110111110 has  99 unique lines.
 *   x  99  98  99   x  99  99   x   x  96   x   x   x  98  97  97  97  91  91  89       x  97       x  91  89   x   x               x   x   x      81                      84  kill col  6  Tbl  17 cols 1000100110111000000011011001111111111111110 has  81 unique lines.
 *   x  81  80  81   x  81  80   x   x  79   x   x   x  80  79  78  79  72  73  73       x  79       x  73  69   x   x               x   x   x                              64  kill col  0  Tbl  16 cols 1000100110111000000011011001111111111111111 has  64 unique lines.
 *   x  64  63  64   x  64  63   x   x  62   x   x   x  63  62  62  62  56  56  57       x  62       x  57  54   x   x               x   x   x                                  kill col 16  Tbl  15 cols 1000100110111000000011011011111111111111111 has  54 unique lines.
 *   x  54  53  54   x  54  53   x   x  52   x   x   x  53  52  51  53  45  47  48       x  51       x  47       x   x               x   x   x                                  kill col 25  Tbl  14 cols 1000100110111000010011011011111111111111111 has  45 unique lines.
 *   x  45  44  45   x  45  44   x   x  42   x   x   x  44  43  42  43      40  38       x  42       x  38       x   x               x   x   x                                  kill col 23  Tbl  13 cols 1000100110111000010111011011111111111111111 has  38 unique lines.
 *   x  37  37  38   x  38  37   x   x  35   x   x   x  37  36  33  34      34           x  35       x  32       x   x               x   x   x                                  kill col 17  Tbl  12 cols 1000100110111000010111011111111111111111111 has  32 unique lines.
 *   x  31  30  32   x  32  31   x   x  29   x   x   x  30  30  27  29      29           x  29       x           x   x               x   x   x                                  kill col 27  Tbl  11 cols 1000100110111001010111011111111111111111111 has  27 unique lines.
 *   x  26  25  26   x  27  26   x   x  24   x   x   x  24  25      23      24           x  24       x           x   x               x   x   x                                  kill col 26  Tbl  10 cols 1000100110111001110111011111111111111111111 has  23 unique lines.
 *   x  22  21  22   x  23  22   x   x  20   x   x   x  21  21              19           x  20       x           x   x               x   x   x                                  kill col 24  Tbl   9 cols 1000100110111001111111011111111111111111111 has  19 unique lines.
 *   x  18  16  17   x  18  18   x   x  16   x   x   x  16  17                           x  15       x           x   x               x   x   x                                  kill col 20  Tbl   8 cols 1000100110111001111111111111111111111111111 has  15 unique lines.
 *
 * Round 2: 0111011001000110000000000000000000000000000  4 columns for indexes to table representing  8 original columns (uses 15 of 16 lines in indirect table).
 * Direct:  0000000000000001111110110110011100011111111 21 columns
 * Can even chose 3 more columns to be represented directly.
 * Success. Use 2 EBRs, 17 LUTs.
 */

module v8_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    *                      indirect_index 1
    * inx         next     | indirect index 0
    * || ucode    ucode    | | direct representation
    * 00 LB_0     LB_1     0 0 000000000011010111100000| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 000100010010111111001xx1|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 001000100011011111100000| IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0
    * 03 _L0x03   StdIncPc 3 0 001100000000101x10xxxxx0| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 4 0 010000000000101110100000| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   3 0 001100000000001x01xxxxx0| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 06 LB_3     LB_4     3 0 001100000001101111010xx0|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     3 0 001100000001011111011xx0|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     5 0 010100000011100111100000| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     3 0 001100000001011111000xx0|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     5 0 010100000011100111100000| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JALR_3   3 3 001100110000101111100110|        Q=1. Prep legalize target
    * 0c ADD_0    ADDI_0   3 0 001100000011101111001xx0| ADD    add     Addition Q = RS1
    * 0d _L0x0d   StdIncPc 4 0 010000000000101110110000| LUI    q = imm20
    * 0e SUB_0    SUB_1    3 0 001100000011101x10xxxxx0| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 4 0 010000000000101110110000| LUI    q = imm20
    * 10 SUB_1    LB_6     3 0 001100000011111111000xx0|        Q = ~RS2
    * 11 AND_1    ANDI_1   3 0 001100000011101111000xx0|        RS1^0xffffffff to Q
    * 12 straddle Fetchu   6 4 011001001011011001100110|  Fr00u IncPC, OpFetch
    * 13 condb_2  condb_3  3 0 001100000011111111000xx0|        ~RS2 in Q
    * 14 condb_3  condb_4  3 3 001100110011001111100110|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  3 5 001101010000001111001xx0|        Branch on condition
    * 16 condb_5  StdIncPc 3 0 001100000000001x10xxxxx0|        Branch not taken.
    * 17 condb_5t condb_6t 7 0 011100000000001101001xx0|        Branch taken. yy=oldPC incase of access error
    * 18 BEQ      condb_2  7 0 011100000011101110110000| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   5 0 01010000100000110x100000| JALR   (tmp) Prep pc=RS1+imm (target)
    * 1a ANDI_1   StdIncPc 4 0 010000000000101110011xx0|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    3 0 001100000000001x01xxxxx0| JAL. J-imm is in q. Prep get isntradr from jj
    * 1c ECAL_BRK ECAL_RET 3 2 001100100010111101110000| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 4 0 010000000000101110111000|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 3 3 001100110010101011100110|        Q = 4
    * 1f IJ_2     IJ_3     5 0 010100001000001101110000|        Read word is to be masked with lsb = 0
    * 20 LH_0     LH_1     8 2 100000100011010111100000| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 4 0 010000000000101110000xx0|        rd = Iimm ^ RS1
    * 22 _L0x22   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * 23 _L0x23   StdIncPc 3 0 001100000000101x10xxxxx0| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   3 6 00110110001111010x110000| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   3 0 001100000000001x01xxxxx0| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 26 OR_1     OR_2     5 0 010100000011101110000xx0|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    3 0 001100000000001111100000|        Q = rs2
    * 28 _L0x28   SH_1     5 2 010100100011100111100000| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   3 0 001100000011101111000xx0|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     5 2 010100100011100111100000| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  3 3 0011001100xxxx1110100110|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    3 0 001100000011101x0xxxxxx0| SLL    Shift left
    * 2d _L0x2d   StdIncPc 4 0 010000000000101110110000| LUI    q = imm20
    * 2e unx2e             9 6 10010110xxxxxxxxxxxxxxxx| 2e: Not in use 
    * 2f _L0x2f   StdIncPc 4 0 010000000000101110110000| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 4 7 010001110000101110110010|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  3 0 001100000011111111000xx0|        ~rs2 to Q
    * 32 JAL_1    JAL_2    7 0 011100000000001101001xx0|      Prep Instradr to yy. Refetch instradr
    * 33 JALR_3   JAL_25   5 0 010100001000001110011xx0|        Q = (RS1+imn) & 0xfffffffe
    * 34 JAL_3    Fetch    6 0 011000001011011101001xx0|      Prep fetch next instr.
    * 35 SLLI_1   SLLI_2   4 6 010001100010111111001xx0|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   4 8 010010000010111111101000|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  7 5 0111010101xxxx1110001xx0|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  7 0 011100000011101110110000| BNE    Conditional Branch. Offset to Ryy
    * 39 _L0x39   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * 3a SRxI_1   SRxI_2   4 9 010010010010101111001xx1|        Register to shift to Q
    * 3b _L0x3b   JAL_1    3 0 001100000000001x01xxxxx0| JAL. J-imm is in q. Prep get isntradr from jj
    * 3c CSRRW_0  CSRRW_1  7 0 011100000001101110110000| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   4 a 010010100010101111001xx1|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   3 6 00110110001111010x001xx0|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   3 6 00110110001111010x001xx0|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 b 000010110011011111100000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   7 0 011100000010101110001xx0|        yy=jj. Prep get Q=1
    * 42 _L0x42   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * 43 _L0x43   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * 44 SLTI_0   SLTIX_1  3 0 001100000011111111010xx0| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    3 3 001100110010101111100110|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    7 0 01110000011010110x001xx0|        Store PC to mepc
    * 47 ILL_2    ILL_3    7 0 011100001110101110001xx0|        Store 0 to mtval
    * 48 _L0x48   SW_1     a b 101010110011101111100000| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  3 3 001100110000101111100110|        Construct PC storage adr
    * 4a _L0x4a   SW_1     a b 101010110011101111100000| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  b 0 101100001110101101001xx0|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   3 0 001100000011101x10xxxxx0| SLT    Set less than (signed)
    * 4d unx4d             9 6 10010110xxxxxxxxxxxxxxxx| 4d: Not in use 
    * 4e eILL0b   ILLe     3 0 0011000000xxxx1x0xxxxxx0| Illegal instruction seen
    * 4f MRET_8   MRET_9   3 3 001100110010101011100110|        +4, so now 0x103
    * 50 LW_1     StdIncPc c c 110011000010111110001xx0|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   7 0 011100001110101101110000|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 000100010010111111001xx1|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   7 0 011100001110101101110000|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     3 a 001110100010101111001xx1|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 7 0 011100001110101110110000|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     3 0 001100000010001111011xx0|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     3 0 001100000010001111000xx0|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 _L0x58   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * 59 _L0x59   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * 5a SB_1     SB_2     7 6 011101100010111111001xx0|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    3 0 001100000000001x01xxxxx0| JAL. J-imm is in q. Prep get isntradr from jj
    * 5c CSRRS_0  CSRRW_1  7 0 011100000001101110110000| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     7 8 011110000010111111101000|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 000100010010111111001xx1|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   7 0 011100001110101101110000|  err   LD AlignFault. Faulting adr to mtval
    * 60 _L0x60   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * 61 EBRKWFI2 EBREAK_1 7 5 011101010001101110010xx0| EBREAK/WFI2 Select EBREAK or WFI.
    * 62 _L0x62   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * 63 _L0x63   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * 64 SLTIU_0  SLTIX_1  3 0 001100000011111111010xx0| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    3 5 001101010000001x10xxxxx0|        Prepare read PC.
    * 66 SW_1     SW_2     9 0 100100001111101101001xx0|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    7 0 01110000110010110x110000|        Store faulting address alignment to mtval
    * 68 _L0x68   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * 69 unx69             9 6 10010110xxxxxxxxxxxxxxxx| 69: Not in use 
    * 6a _L0x6a   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * 6b SB_4     SB_5     a 0 101000001011001111001xx0|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   3 0 001100000011101x10xxxxx0| SLTU   Set less than (unsigned)
    * 6d unx6d             9 6 10010110xxxxxxxxxxxxxxxx| 6d: Not in use 
    * 6e unx6e             9 6 10010110xxxxxxxxxxxxxxxx| 6e: Not in use 
    * 6f MRET_6   MRET_7   3 3 0011001100xxxx1111100110|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    3 a 001110100010101111001xx1|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 7 0 011100001110101110110000|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   3 0 001100000001101111010xx0|        Invert q. Prepare read mask
    * 73 unx73             9 6 10010110xxxxxxxxxxxxxxxx| 73: Not in use 
    * 74 MRET_9   Fetch    6 3 011000111011011101100110|        +1, IncPC, OpFetch next
    * 75 IJ_5     Fetch    6 0 011000001011011101011xx0|        Mask and use as PC
    * 76 Fetchu   Fetch2   3 d 001111010000111110110000|  Fr00u Read and latch instruction
    * 77 eFetchu  Fetch2   1 e 000111100010111110110000|  Fr00u rep Read until d=mem[(rs1+ofs) & ~3u]
    * 78 _L0x78   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * 79 _L0x79   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * 7a SB_5     SW_2     9 0 100100001011001101001xx0|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    3 0 001100000000001x01xxxxx0| JAL. J-imm is in q. Prep get isntradr from jj
    * 7c CSRRC_0  CSRRW_1  7 0 011100000001101110110000| CSRRC  Decoded CSR adr in yy
    * 7d condb_6t Fetch    6 0 011000001011011101100000|        Branch taken.
    * 7e NMI_1    NMI_2    7 0 0111000001xxxx1110001xx0|        Store pc to mepc.
    * 7f unx7f             9 6 10010110xxxxxxxxxxxxxxxx| 7f: Not in use 
    * 80 LBU_0    LBU_1    0 0 000000000011010111100000| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 unx81             9 6 10010110xxxxxxxxxxxxxxxx| 81: Not in use 
    * 82 _L0x82   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * 83 _L0x83   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * 84 XORI_0   XORI_1   3 0 001100000011111111010xx0| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 000100010010111111001xx1|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   5 0 010100001000001110100000|      Prep pc = jj + ofs
    * 87 unx87             9 6 10010110xxxxxxxxxxxxxxxx| 87: Not in use 
    * 88 _L0x88   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * 89 unx89             9 6 10010110xxxxxxxxxxxxxxxx| 89: Not in use 
    * 8a _L0x8a   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * 8b LB_6     StdIncPc 4 3 010000110000101110100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    3 0 001100000011111x10xxxxx0| XOR    xor
    * 8d unx8d             9 6 10010110xxxxxxxxxxxxxxxx| 8d: Not in use 
    * 8e _LCSRRS_1 ILLe     3 0 0011000000xxxx1x0xxxxxx0| Illegal instruction seen
    * 8f ILL_3    ILL_4    3 3 001100110010101111100110|        Q = 1
    * 90 NMI_2    JAL_3    d 0 110100001101001110110000|        mtval = 0.
    * 91 LDAF_2   LDAF_3   d 3 11010011100010100x100110|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    7 0 01110000011001110x001xx0|        PC to mepc
    * 93 SW_E2    SW_E3    7 0 011100000110111110001xx0|        Store address that faulted
    * 94 SW_E4    JAL_3    d 0 11010000101001110x101000|        Store 6 to mcause
    * 95 SW_E3    SW_E4    3 3 001100110010111011100110|        Q = 3
    * 96 SH_1     SH_2     7 6 011101100010111111001xx0|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    7 0 01110000110010110x110000|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  7 0 011100000011101110110000| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    d 0 11010000101001100x100000|        mcause = 11
    * 9b SH_4     SH_5     a 0 101000000111001111001xx0|        Address back to Q. Prepare get item to write
    * 9c _L0x9c   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * 9d unx9d             9 6 10010110xxxxxxxxxxxxxxxx| 9d: Not in use 
    * 9e JAL_25   JAL_3    4 4 010001000000101010100110|      Prep WTRG = jj+2/4 (return adr)
    * 9f SH_5     SW_2     9 0 100100000111001101001xx0|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    8 2 100000100011010111100000| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  3 3 001100110010101011100110|        Q = 4
    * a2 _L0xa2   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * a3 _L0xa3   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * a4 SRxI_0   SRxI_1   3 6 00110110001111010x110000| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   3 3 001100110001101111100110|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  3 b 001110110010111101110000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 3 0 0011000000xxxx1111100000| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 _L0xa8   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * a9 ILL_4    JAL_3    d 3 11010011101001110x100110|        Store 2 to mcause
    * aa _L0xaa   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * ab EBREAK_2 ECALL_6  7 0 011100000110101110001xx0|        pc to mepc
    * ac _L0xac   SRx_1    3 0 001100000011101x0xxxxxx0| SRx    Shift Right (both SRL and SRA)
    * ad unxad             9 6 10010110xxxxxxxxxxxxxxxx| ad: Not in use 
    * ae _L0xae   SRx_1    3 0 001100000011101x0xxxxxx0| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   3 3 0011001100xxxx1111100110|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   d 0 11010000100010100x100000|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  3 3 001100110010101011100110|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    6 3 011000111011011001100110|        IncPC, OpFetch, but force +4
    * b3 unxb3             9 6 10010110xxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 ic0reser          9 6 10010110xxxxxxxxxxxxxxxx|  Fr00  Not really used, reserved to allow LASTINCH
    * b5 SH_3     SH_4     3 0 001100000000001110110000|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  3 3 001100110010101011100110|        Q = 8
    * b7 IJ_3     IJ_4     7 0 011100000010101110001xx0|        Store present PC in case of access error
    * b8 BGE      condb_2  7 0 011100000011101110110000| BGE    Conditional Branch. Offset to Ryy
    * b9 _L0xb9   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * ba LHU_3    ANDI_1   3 0 001100000001111111010xx0|        Invert q. Prepare read mask
    * bb SH_2     SH_3     7 8 011110000010111111101000|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  7 0 011100000001101110110000| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     IJ_5     3 3 001100110000101111100110|        Construct Q = 1
    * be IJ_1     IJ_2     1 0 000100000010111111001xx0|        Read until q=mem[(rs1+ofs)&~1u]
    * bf IJT_1    IJT_2    1 0 000100000010111111001xx0|        Exit CSR, enter trap
    * c0 _L0xc0   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * c1 IJT_2    IJT_3    7 0 011100000010101110110000|        Read word is to be masked with ~1u
    * c2 _L0xc2   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * c3 _L0xc3   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * c4 ORI_0    ORI_1    5 0 010100000011111110010xx0| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   3 0 001100000000001111010xx0|        ~302
    * c6 IJT_4    ILL_2    7 0 011100000110101111011xx0|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   7 0 0111000001xxxx1110001xx0|        Store pc to mepc.
    * c8 _L0xc8   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * c9 MRET_2   MRET_3   3 0 001100000001101011100000|        0xff+3 = 0x102
    * ca _L0xca   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * cb QINT_2   StdIncPc d 0 110100001101001110110000|        mtval = 0.
    * cc OR_0     OR_1     3 0 001100000011111x10xxxxx0| OR     or
    * cd unxcd             9 6 10010110xxxxxxxxxxxxxxxx| cd: Not in use 
    * ce _LCSRRCI_1 ILLe     3 0 0011000000xxxx1x0xxxxxx0| Illegal instruction seen
    * cf MRET_7   MRET_8   3 5 001101010001101x10xxxxx0|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  3 3 001100110000001111100110| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   5 0 010100000001101110110000| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     3 a 001110100010101111001xx1|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 7 0 011100001110101110110000|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   d 3 11010011100010110x100110|        Store 5 to mcause
    * d5 unalignd straddle 3 0 001100000000101110110000|  Fr00u Unaligned pc, prep read high hword
    * d6 eILL0c   ILLe     3 0 0011000000xxxx1x0xxxxxx0| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  7 0 011100001110101110110000|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  7 0 011100000011101110110000| BLTU   Conditional Branch. Offset to Ryy
    * d9 _L0xd9   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * da LDAF_a   LDAF_2   3 0 001100000010101x10xxxxx0|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   7 3 01110011101100110x100110|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  7 0 011100000001101110110000| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  7 0 011100001110101110110000|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   5 d 010111010000111110110000|  Fr00  Read and latch instruction
    * df eFetch   Fetch2   e e 111011100010111110110000|  Fr00  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 _L0xe0   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * e1 ORI_1    ORI_2    3 0 001100000000001111001xx0|        Q = RS1
    * e2 _L0xe2   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * e3 _L0xe3   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * e4 ANDI_0   ANDI_1   3 0 001100000011111111010xx0| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  3 3 001100110010101011100110|        Q = 4
    * e6 StdIncPc Fetch    6 4 011001001011011001100110|  Fr00  IncPC, OpFetch
    * e7 aFault   aFault_1 7 0 011100001110101110110000|  err   Load access fault. Faulting adr to mtval
    * e8 _L0xe8   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * e9 IJT_3    IJT_4    3 3 001100110011001111100110|        Construct Q = 1
    * ea _L0xea   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * eb LH_3     LH_4     3 0 001100000001111111010xx0|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    3 0 001100000011111x10xxxxx0| AND    And 
    * ed unxed             9 6 10010110xxxxxxxxxxxxxxxx| ed: Not in use
    * ee eILL0a   ILLe     3 0 0011000000xxxx1x0xxxxxx0| Illegal instruction seen
    * ef WFI_5    Fetch    6 3 011000111011011001100110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    3 a 001110100010101111001xx1|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 7 0 011100001110101110110000|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 0 001100000000101x10xxxxx0|        Prepare read PC
    * f3 aF_SW    aF_SW_1  3 0 0011000000xxxx1x01xxxxx0|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   unalignd 5 0 010100001111111111100000|  Fr00  Upd ttime, I. Q=imm Use dinx unless unaligned 
    * f5 jFault   jFault_1 7 0 011100001110101110110000|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    3 3 001100110011001011100110| WFI    Chk offset=0x105. Now 0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 7 0 011100001100001110110000| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  7 0 011100000011101110110000| BGEU   Conditional Branch. Offset to Ryy
    * f9 _L0xf9   ILLe     3 0 0011000000xxxx1x0xxxxxx0|  Not in use (illegal as entry)
    * fa WFI_2    WFI_3    3 3 001100110010101111100110|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     3 0 001100000000001110110000|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  7 0 011100000001101110110000| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    3 0 001100000000101x10xxxxx0| NMI    Get current PC
    * fe ILLe     ILL_1    3 0 001100000000101x0xxxxxx0| Illegal
    * ff QINT_0   QINT_1   3 0 001100000000101x10xxxxx0| INT    Get current PC
    */
   localparam u0_0 = 256'hb0e68010b0e6c804e633e05ac08be05ad809d0074004a0e680e6e0bec9d2e001;
   localparam u0_1 = 256'h70b7e6d4b8e670a6403298e62041b013487d80e6c816e615c0146676c01ac08b;
   localparam u0_2 = 256'hb0e60000b0e6003ea630e096c021e096e01d80274004303580e600fe80e6e052;
   localparam u0_3 = 256'h083a0835c903b0494032c93d00feb01388d7e803c83648de989e4886c02bb2e6;
   localparam u0_4 = 256'he67400fe0000803148b1e066e64be066888f0847e665d02b00fe00fe880be050;
   localparam u0_5 = 256'h70dac970e8fbb0494032c85d00fe00fec08bd857b01ec9eb70dac95470da88e6;
   localparam u0_6 = 256'he6cf000000008031c87a00fe000000fe309348f280efd02b00fe00fe90f700fe;
   localparam u0_7 = 256'h0000889060deb049403248f200fe00feb0f4b0f458de66de0000d01ab01ec9ba;
   localparam u0_8 = 256'he6a900fe00008029a6e600fe000000fe0000a09ec9f0d02100fe00fe0000e085;
   localparam u0_9 = 256'h48f2a634000000fec89f203400feb0133093c8bbe6942834889508342692b034;
   localparam u0_A = 256'he6c5003f0000003f889a00fe263400fee06170d0e6af303a00fe00fee6b6e05e;
   localparam u0_B = 256'hc8c1c81fe675b049e8b5d01a00feb01388bde69ab09b0000000066dee6b22092;
   localparam u0_C = 256'h804f00fe00008026b0e600fee0a500fe88cbd847d06f90e100fe00feb0e900fe;
   localparam u0_D = 256'hb0f4b0f4b0e5b0492692809100feb013b0a100feb0122692b01ec906b0c9e637;
   localparam u0_E = 256'h66de00fe00008011d05600fee6c600feb01e66dee6b0d01a00fe00fec81d00fe;
   localparam u0_F = 256'h80c70046807eb049b06be64500feb013b0abe6fab0dbe0d540dd80e6b01ec972;
   localparam u1_0 = 256'h400b303a400b303b330b5039301750393017301b3002400b300a2237112f0035;
   localparam u1_1 = 256'h5083332a400b322f3002400b5083703b7003300235033333303f64b6303b303f;
   localparam u1_2 = 256'h400b9600400b303a33035239303b52393003503b3002363d300a3002400b8235;
   localparam u1_3 = 256'h363d363d4a2b701b3002492b3002703b7543482f462f60b750837003303f470b;
   localparam u1_4 = 256'h332a30029600303ab0ebab3b330bab3b70eb706b332b303f30023002702b0b37;
   localparam u1_5 = 256'h70eb112f782f701b3002762f300230023023302370eb3a2b70eb112f70ebcc2f;
   localparam u1_6 = 256'h330396009600303aa0b330029600300270cb90fb3502303f30023002751b3002;
   localparam u1_7 = 256'h9600704360b7701b300290b3300230021e2f3d0f60b763b79600301b70eb3a2b;
   localparam u1_8 = 256'h332b30029600303e430b30029600300296005083112f303f3002300296000035;
   localparam u1_9 = 256'h9073440a96003002a073d0a63002703b70cb762f332ed0a7706f7067d38ad0d3;
   localparam u1_A = 256'h3303303a9600303a706b3002d3a7300230033b2f331b363d30023002332a8235;
   localparam u1_B = 256'h102f102f330b701b782f301f3002703b702b332a30039600960063b6332ad08a;
   localparam u1_C = 256'h351a30029600303ed0d33002301a30027043706b3003503f30023002702b3002;
   localparam u1_D = 256'hee2f5d0f70eb701b73b3302a3002703b70eb3002300bd38b70eb3a2b501b3303;
   localparam u1_E = 256'h63b630029600303e301f30023333300270eb64b6332a303f3002300230033002;
   localparam u1_F = 256'h300a300a300a701b3003332b3002703b70c3333270eb50ff3002300a70eb3a2b;
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
   assign d[8] = indir[8];
   assign d[9] = indir[9];
   assign d[10] = indir[10];
   assign d[11] = indir[11];
   assign d[12] = indir[12];
   assign d[13] = indir[13];
   assign d[16] = indir[14];
   assign d[17] = indir[15];
   assign d[19] = indir[16];
   assign d[20] = indir[17];
   assign d[22] = indir[18];
   assign d[23] = indir[19];
   assign d[24] = indir[20];
   assign d[25] = indir[21];
   assign d[26] = indir[22];
   assign d[27] = indir[23];
   // replaces = 1000100110110000000001000001100000000000000
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d14(.O(d[14]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h6000)) cmb_d15(.O(d[15]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h78bf)) cmb_d21(.O(d[21]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0804)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0800)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0500)) cmb_d34(.O(d[34]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h4002)) cmb_d35(.O(d[35]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h5000)) cmb_d38(.O(d[38]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d42(.O(d[42]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0111011001000110000000000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h3190)) cmb_d28(.O(d[28]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h61e0)) cmb_d29(.O(d[29]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h5042)) cmb_d33(.O(d[33]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2004)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2800)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h040f)) cmb_d39(.O(d[39]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0545)) cmb_d40(.O(d[40]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0400)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[43] = 1'b0;
   assign d[44] = 1'b0;
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
wire instr0100,instr1x110100;        bn_l4v #(.I(16'h0010)) leq0100(     .o(instr0100),     .i({minx[3:0]}));bn_l4v #(.I(16'h8000)) leq1x110100( .o(instr1x110100), .i({minx[7],minx[5:4],instr0100}));SB_DFFE reg_d18( .Q(d[18]), .C(clk), .E(progress_ucode), .D(instr1x110100));assign d[30] = d[18];
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   RVC included
 *   No MULDIV
 *   minstret for instructions in SRAM
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 43 columns
 * Removed:  0000000000000000000000000000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 0000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 43
 * 169 distinct lines in remaining untreated columns
 * c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 168 169 169 169 169 169 169 169 169 169 169 169 169 169 169 169 169 168 169 168 168 169 169 167 169 169 169 169 169 167 166 168 169 168 169 168 169 168 169 169 168 168 168  kill col 12  Tbl  42 cols 0000000000000000000000000000001000000000000 has 166 unique lines.
 * 165 166 166 166 166 166 166 166 166 166 166 166 166 166 166 166 166 164 166 165 163 166 166 164 166 166 166 166 166 164     164 165 165 166 165 166 165 166 166 165 165 165  kill col 22  Tbl  41 cols 0000000000000000000010000000001000000000000 has 163 unique lines.
 * 162 163 163 163 163 163 163 163 163 163 163 163 163 163 163 163 163 162 163 162     163 163 161 163 163 163 163 163 161     161 162 162 163 162 162 161 163 163 162 162 161  kill col 19  Tbl  40 cols 0000000000000000000010010000001000000000000 has 161 unique lines.
 * 160 161 161 161 161 161 161 161 161 161 161 161 161 161 161 161 161 160 161 160     161 161     161 161 161 161 161 159     158 160 160 161 160 160 159 161 161 160 160 159  kill col 11  Tbl  39 cols 0000000000000000000010010000001100000000000 has 158 unique lines.
 * 157 158 158 158 158 158 158 158 158 158 158 158 158 158 158 158 158 157 158 157     158 158     158 158 158 158 158 152         157 157 158 157 157 156 157 158 157 157 156  kill col 13  Tbl  38 cols 0000000000000000000010010000011100000000000 has 152 unique lines.
 * 151 152 152 152 152 152 152 152 152 152 152 152 152 152 152 152 152 151 152 151     152 152     152 152 152 152 152             151 151 151 151 151 150 151 152 151 151 150  kill col  5  Tbl  37 cols 0000000000000000000010010000011100000100000 has 150 unique lines.
 * 149 150 150 150 150 150 150 150 150 150 150 150 150 150 150 150 150 149 150 149     150 150     150 150 150 150 150             149 149 149 147 149     149 149 147 147 147  kill col  7  Tbl  36 cols 0000000000000000000010010000011100010100000 has 147 unique lines.
 * 146 147 147 147 147 147 147 147 147 147 147 147 147 147 146 147 147 146 146 146     147 147     147 146 147 147 147             146 146 146     146     146 145 142 142 144  kill col  2  Tbl  35 cols 0000000000000000000010010000011100010100100 has 142 unique lines.
 * 141 142 142 142 142 142 142 142 142 142 142 142 142 142 141 141 142 140 141 140     142 142     142 141 140 142 141             141 141 141     140     141 139     138 138  kill col  1  Tbl  34 cols 0000000000000000000010010000011100010100110 has 138 unique lines.
 * 137 138 138 138 138 138 138 138 137 138 138 138 138 138 137 137 138 136 137 136     138 138     138 137 133 138 137             137 137 137     132     134 130         134  kill col  3  Tbl  33 cols 0000000000000000000010010000011100010101110 has 130 unique lines.
 * 129 130 130 130 130 130 130 130 128 130 130 130 130 130 129 129 129 127 128 126     130 130     130 127 125 129 129             129 129 129     119     121             122  kill col  6  Tbl  32 cols 0000000000000000000010010000011100011101110 has 119 unique lines.
 * 118 119 119 119 119 119 119 119 118 119 119 118 119 119 118 116 118 114 116 115     119 119     119 115 113 118 118             118 118 118             104             107  kill col  4  Tbl  31 cols 0000000000000000000010010000011100011111110 has 104 unique lines.
 * 102 104 104 104 104 104 104 104 102 104 103 103 104 103 102 101 103  97 100  99     104 104     104  98  98 103 101             103 103 103                              89  kill col  0  Tbl  30 cols 0000000000000000000010010000011100011111111 has  89 unique lines.
 *  87  89  89  89  89  89  89  89  86  89  88  88  89  87  87  87  88  83  85  84      89  89      89  83  82  88  85              88  88  87                                  kill col 16  Tbl  29 cols 0000000000000000000010010010011100011111111 has  82 unique lines.
 *  80  82  82  82  82  82  82  82  79  81  81  81  82  80  80  79  81  75  77  76      81  81      82  76      81  78              81  81  80                                  kill col 25  Tbl  28 cols 0000000000000000010010010010011100011111111 has  75 unique lines.
 *  73  75  75  75  75  75  75  75  72  74  74  73  75  72  74  72  73      69  65      73  74      75  68      74  71              74  74  73                                  kill col 23  Tbl  27 cols 0000000000000000010110010010011100011111111 has  65 unique lines.
 *  63  64  65  65  65  65  65  65  62  64  64  63  65  62  64  62  62      60          63  64      65  59      64  61              64  64  63                                  kill col 17  Tbl  26 cols 0000000000000000010110010110011100011111111 has  59 unique lines.
 *  57  58  59  59  59  59  59  59  56  58  58  57  59  56  58  57  57      55          57  58      59          58  55              58  58  57                                  kill col 24  Tbl  25 cols 0000000000000000011110010110011100011111111 has  55 unique lines.
 *  53  54  54  54  55  54  55  55  52  54  54  53  54  51  54  52  51                  53  54      55          53  52              54  54  53                                  kill col 29  Tbl  24 cols 0000000000000100011110010110011100011111111 has  51 unique lines.
 *  49  50  50  47  51  50  51  51  49  50  50  49  50      48  47  46                  49  50      50          49  48              50  50  49                                  kill col 26  Tbl  23 cols 0000000000000100111110010110011100011111111 has  46 unique lines.
 *  44  45  45  42  46  45  46  46  44  45  45  44  45      44  42                      44  45      45          44  44              45  45  44                                  kill col 39  Tbl  22 cols 0001000000000100111110010110011100011111111 has  42 unique lines.
 *  40  41  40      42  41  42  42  40  41  41  40  40      37  38                      40  40      41          41  40              41  41  40                                  kill col 28  Tbl  21 cols 0001000000000110111110010110011100011111111 has  37 unique lines.
 *  35  36  34      36  36  36  37  35  36  36  34  35          34                      35  34      36          36  36              36  36  35                                  kill col 40  Tbl  20 cols 0011000000000110111110010110011100011111111 has  34 unique lines.
 *  32  31          33  33  32  34  32  31  33  32  32          30                      32  31      33          33  33              33  33  32                                  kill col 27  Tbl  19 cols 0011000000000111111110010110011100011111111 has  30 unique lines.
 *  28  28          29  29  28  30  28  27  29  28  28                                  28  27      29          29  29              29  29  28                                  kill col 33  Tbl  18 cols 0011000001000111111110010110011100011111111 has  27 unique lines.
 *  26  25          26  26  25  27  25      26  25  25                                  25  24      26          26  26              26  26  25                                  kill col 20  Tbl  17 cols 0011000001000111111110110110011100011111111 has  24 unique lines.
 *  23  22          23  23  22  24  22      23  23  22                                  23          23          23  23              23  23  22                                  kill col 41  Tbl  16 cols 0111000001000111111110110110011100011111111 has  22 unique lines.
 *  21              21  21  20  22  20      21  21  20                                  21          21          21  21              21  21  20                                  kill col 36  Tbl  15 cols 0111001001000111111110110110011100011111111 has  20 unique lines.
 *  19              19  18      20  18      19  19  18                                  19          19          19  19              19  19  18                                  kill col 37  Tbl  14 cols 0111011001000111111110110110011100011111111 has  18 unique lines.
 *  17              17          18  16      17  17  16                                  17          17          17  17              17  17  16                                  kill col 34  Tbl  13 cols 0111011011000111111110110110011100011111111 has  16 unique lines.
Possible good candidates for removal, columns : 8 14 30 31 
 *
 * Round 1: 1000100100111000000001001001100011100000000  4 columns for indexes to table representing 13 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 34
 * 164 distinct lines in remaining untreated columns
 * c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x 164 164 164   x 164 164   x 164 164   x   x   x 164 164 163 164 163 164 163 163   x 164 161   x 164 164   x   x 162 161 162   x   x   x 163 164 163 164 164 163 163 163  kill col 19  Tbl  29 cols 1000100100111000000001011001100011100000000 has 161 unique lines.
 *   x 161 161 161   x 161 161   x 161 161   x   x   x 161 161 160 161 160 161 160 160   x 161       x 161 161   x   x 159 158 159   x   x   x 160 161 160 161 161 160 160 160  kill col 12  Tbl  28 cols 1000100100111000000001011001101011100000000 has 158 unique lines.
 *   x 158 158 158   x 158 158   x 158 158   x   x   x 158 158 157 158 156 158 157 155   x 158       x 158 158   x   x 156     155   x   x   x 157 158 157 158 158 157 157 157  kill col 22  Tbl  27 cols 1000100100111000000011011001101011100000000 has 155 unique lines.
 *   x 155 155 155   x 155 155   x 155 155   x   x   x 155 155 154 155 154 155 154       x 155       x 155 155   x   x 152     152   x   x   x 154 154 153 155 155 154 154 153  kill col 13  Tbl  26 cols 1000100100111000000011011001111011100000000 has 152 unique lines.
 *   x 152 152 152   x 152 152   x 152 152   x   x   x 152 152 151 152 151 152 151       x 152       x 152 152   x   x         145   x   x   x 151 151 150 152 152 151 151 150  kill col 11  Tbl  25 cols 1000100100111000000011011001111111100000000 has 145 unique lines.
 *   x 145 145 145   x 145 145   x 145 145   x   x   x 145 145 144 145 144 145 144       x 145       x 145 145   x   x               x   x   x 144 144 143 144 145 144 144 143  kill col  5  Tbl  24 cols 1000100100111000000011011001111111100100000 has 143 unique lines.
 *   x 143 143 143   x 143 143   x 142 142   x   x   x 143 143 142 143 142 143 142       x 143       x 143 141   x   x               x   x   x 139 142     142 142 139 140 139  kill col  7  Tbl  23 cols 1000100100111000000011011001111111110100000 has 139 unique lines.
 *   x 139 139 139   x 139 139   x 138 138   x   x   x 139 138 138 139 138 136 138       x 139       x 138 136   x   x               x   x   x     138     138 136 132 134 135  kill col  2  Tbl  22 cols 1000100100111000000011011001111111110100100 has 132 unique lines.
 *   x 132 132 132   x 132 132   x 131 130   x   x   x 132 131 130 132 129 129 129       x 131       x 129 129   x   x               x   x   x     130     131 128     128 127  kill col  0  Tbl  21 cols 1000100100111000000011011001111111110100101 has 127 unique lines.
 *   x 127 127 127   x 127 127   x 126 124   x   x   x 127 126 125 127 122 124 123       x 126       x 124 121   x   x               x   x   x     124     121 122     123      kill col 16  Tbl  20 cols 1000100100111000000011011011111111110100101 has 121 unique lines.
 *   x 121 121 121   x 121 121   x 120 118   x   x   x 120 120 119 120 115 118 117       x 120       x 115       x   x               x   x   x     116     113 112     110      kill col  1  Tbl  19 cols 1000100100111000000011011011111111110100111 has 110 unique lines.
 *   x 110 110 110   x 110 110   x 107 107   x   x   x 109 109 107 109 103 106 104       x 109       x 104       x   x               x   x   x     101      99  97              kill col  3  Tbl  18 cols 1000100100111000000011011011111111110101111 has  97 unique lines.
 *   x  97  96  97   x  97  97   x  91  94   x   x   x  96  96  94  94  90  90  91       x  96       x  89       x   x               x   x   x      79      80                  kill col  6  Tbl  17 cols 1000100100111000000011011011111111111101111 has  79 unique lines.
 *   x  79  78  79   x  79  78   x  76  77   x   x   x  78  78  75  76  67  70  71       x  78       x  70       x   x               x   x   x              59                  kill col  4  Tbl  16 cols 1000100100111000000011011011111111111111111 has  59 unique lines.
 *   x  59  58  59   x  59  58   x  56  57   x   x   x  57  56  55  56  50  52  53       x  56       x  52       x   x               x   x   x                                  kill col 25  Tbl  15 cols 1000100100111000010011011011111111111111111 has  50 unique lines.
 *   x  50  49  50   x  50  49   x  47  47   x   x   x  48  47  46  46      45  43       x  47       x  43       x   x               x   x   x                                  kill col 23  Tbl  14 cols 1000100100111000010111011011111111111111111 has  43 unique lines.
 *   x  42  42  43   x  43  42   x  40  40   x   x   x  41  40  37  37      38           x  40       x  37       x   x               x   x   x                                  kill col 27  Tbl  13 cols 1000100100111001010111011011111111111111111 has  37 unique lines.
 *   x  36  36  36   x  37  36   x  34  34   x   x   x  35  33      31      31           x  34       x  31       x   x               x   x   x                                  kill col 26  Tbl  12 cols 1000100100111001110111011011111111111111111 has  31 unique lines.
 *   x  30  30  30   x  31  30   x  28  28   x   x   x  29  28              26           x  28       x  26       x   x               x   x   x                                  kill col 24  Tbl  11 cols 1000100100111001111111011011111111111111111 has  26 unique lines.
 *   x  25  25  24   x  25  25   x  23  23   x   x   x  23  24                           x  22       x  22       x   x               x   x   x                                  kill col 20  Tbl  10 cols 1000100100111001111111111011111111111111111 has  22 unique lines.
 *   x  21  20  21   x  21  21   x  19  19   x   x   x  19  20                           x           x  18       x   x               x   x   x                                  kill col 17  Tbl   9 cols 1000100100111001111111111111111111111111111 has  18 unique lines.
 *   x  17  15  17   x  17  17   x  15  15   x   x   x  15  16                           x           x           x   x               x   x   x                                  kill col 40  Tbl   8 cols 1010100100111001111111111111111111111111111 has  15 unique lines.
Possible good candidates for removal, columns : 29 33 34 
 *
 * Round 2: 0101011011000110000000000000000000000000000  4 columns for indexes to table representing  8 original columns (uses 15 of 16 lines in indirect table).
 * Direct:  0010000000000001111110110110011100011111111 22 columns
 * Can even chose 2 more columns to be represented directly.
 * Success. Use 2 EBRs, 19 LUTs.
 */

module v10_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    *                      indirect_index 1
    * inx         next     | indirect index 0
    * || ucode    ucode    | | direct representation
    * 00 LB_0     LB_1     0 0 000000001001101011110000| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 0001000100010111111001x1|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 001000101001101111110000| IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0
    * 03 _L0x03   StdIncPc 0 0 0000000000000101x10xxxx0| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 3 0 001100000000010111010000| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   0 0 0000000000000001x01xxxx0| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 06 LB_3     LB_4     0 0 0000000000001101111010x0|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     0 0 0000000000001011111011x0|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     4 0 010000000001110011110000| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     0 0 0000000000001011111000x0|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     4 0 010000000001110011110000| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JALR_3   0 3 000000110000010111110010|        Q=1. Prep legalize target
    * 0c ADD_0    ADDI_0   0 0 0000000000011101111001x0| ADD    add     Addition Q = RS1
    * 0d _L0x0d   StdIncPc 3 0 001100000000010111011000| LUI    q = imm20
    * 0e SUB_0    SUB_1    0 0 0000000000011101x10xxxx0| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 3 0 001100000000010111011000| LUI    q = imm20
    * 10 SUB_1    LB_6     0 0 0000000000011111111000x0|        Q = ~RS2
    * 11 AND_1    ANDI_1   0 0 0000000000011101111000x0|        RS1^0xffffffff to Q
    * 12 straddle Fetchu   5 4 010101001101101100110010|  Fr10u IncPC, OpFetch
    * 13 condb_2  condb_3  0 0 0000000000011111111000x0|        ~RS2 in Q
    * 14 condb_3  condb_4  0 3 000000110001100111110010|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  0 5 0000010100000001111001x0|        Branch on condition
    * 16 condb_5  StdIncPc 0 0 0000000000000001x10xxxx0|        Branch not taken.
    * 17 condb_5t condb_6t 6 0 0110000000000001101001x0|        Branch taken. yy=oldPC incase of access error
    * 18 BEQ      condb_2  6 0 011000000001110111011000| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   4 0 010000000100000110x10000| JALR   (tmp) Prep pc=RS1+imm (target)
    * 1a ANDI_1   StdIncPc 3 0 0011000000000101110011x0|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    0 0 0000000000000001x01xxxx0| JAL. J-imm is in q. Prep get isntradr from jj
    * 1c ECAL_BRK ECAL_RET 0 2 000000100001011110111000| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 3 0 001100000000010111011100|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 0 3 000000110001010101110010|        Q = 4
    * 1f IJ_2     IJ_3     4 0 010000000100000110111000|        Read word is to be masked with lsb = 0
    * 20 LH_0     LH_1     6 2 011000101001101011110000| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 3 0 0011000000000101110000x0|        rd = Iimm ^ RS1
    * 22 _L0x22   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 23 _L0x23   StdIncPc 0 0 0000000000000101x10xxxx0| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   0 6 000001100001111010x11000| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   0 0 0000000000000001x01xxxx0| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 26 OR_1     OR_2     4 0 0100000000011101110000x0|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    0 0 000000000000000111110000|        Q = rs2
    * 28 _L0x28   SH_1     4 2 010000100001110011110000| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   0 0 0000000000011101111000x0|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     4 2 010000100001110011110000| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  0 3 00000011000xxxx111010010|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    0 0 0000000000011101x0xxxxx0| SLL    Shift left
    * 2d _L0x2d   StdIncPc 3 0 001100000000010111011000| LUI    q = imm20
    * 2e unx2e             7 6 01110110xxxxxxxxxxxxxxxx| 2e: Not in use 
    * 2f _L0x2f   StdIncPc 3 0 001100000000010111011000| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 3 7 001101110000010111011010|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  0 0 0000000000011111111000x0|        ~rs2 to Q
    * 32 JAL_1    JAL_2    6 0 0110000000000001101001x0|      Prep Instradr to yy. Refetch instradr
    * 33 JALR_3   JAL_25   4 0 0100000001000001110011x0|        Q = (RS1+imn) & 0xfffffffe
    * 34 JAL_3    Fetch    5 0 0101000011011011101001x0|      Prep fetch next instr.
    * 35 SLLI_1   SLLI_2   3 6 0011011000010111111001x0|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   8 6 100001100001011111110100|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  6 5 01100101001xxxx1110001x0|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  6 0 011000000001110111011000| BNE    Conditional Branch. Offset to Ryy
    * 39 _L0x39   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 3a SRxI_1   SRxI_2   3 8 0011100000010101111001x1|        Register to shift to Q
    * 3b _L0x3b   JAL_1    0 0 0000000000000001x01xxxx0| JAL. J-imm is in q. Prep get isntradr from jj
    * 3c CSRRW_0  CSRRW_1  6 0 011000000000110111011000| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   8 8 1000100000010101111001x1|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   0 6 000001100001111010x001x0|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   0 6 000001100001111010x001x0|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 9 000010011001101111110000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   6 0 0110000000010101110001x0|        yy=jj. Prep get Q=1
    * 42 _L0x42   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 43 _L0x43   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 44 SLTI_0   SLTIX_1  0 0 0000000000011111111010x0| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    0 3 000000110001010111110010|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    6 0 011000000011010110x001x0|        Store PC to mepc
    * 47 ILL_2    ILL_3    6 0 0110000001110101110001x0|        Store 0 to mtval
    * 48 _L0x48   SW_1     9 9 100110011001110111110000| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  0 3 000000110000000111110010|        Construct PC storage adr
    * 4a _L0x4a   SW_1     9 9 100110011001110111110000| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  a 0 1010000001110101101001x0|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   0 0 0000000000011101x10xxxx0| SLT    Set less than (signed)
    * 4d unx4d             7 6 01110110xxxxxxxxxxxxxxxx| 4d: Not in use 
    * 4e eILL0b   ILLe     0 0 00000000000xxxx1x0xxxxx0| Illegal instruction seen
    * 4f MRET_8   MRET_9   0 3 000000110001010101110010|        +4, so now 0x103
    * 50 LW_1     StdIncPc b a 1011101000010111110001x0|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   6 0 011000000111010110111000|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 0001000100010111111001x1|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   6 0 011000000111010110111000|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     c 8 1100100000010101111001x1|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 6 0 011000000111010111011000|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     0 0 0000000000010001111011x0|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     0 0 0000000000010001111000x0|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 _L0x58   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 59 _L0x59   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 5a SB_1     SB_2     6 6 0110011000010111111001x0|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    0 0 0000000000000001x01xxxx0| JAL. J-imm is in q. Prep get isntradr from jj
    * 5c CSRRS_0  CSRRW_1  6 0 011000000000110111011000| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     d 6 110101100001011111110100|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 0001000100010111111001x1|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   6 0 011000000111010110111000|  err   LD AlignFault. Faulting adr to mtval
    * 60 _L0x60   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 61 EBRKWFI2 EBREAK_1 6 5 0110010100001101110010x0| EBREAK/WFI2 Select EBREAK or WFI.
    * 62 _L0x62   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 63 _L0x63   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 64 SLTIU_0  SLTIX_1  0 0 0000000000011111111010x0| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    0 5 0000010100000001x10xxxx0|        Prepare read PC.
    * 66 SW_1     SW_2     7 0 0111000001111101101001x0|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    6 0 011000000110010110x11000|        Store faulting address alignment to mtval
    * 68 _L0x68   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 69 unx69             7 6 01110110xxxxxxxxxxxxxxxx| 69: Not in use 
    * 6a _L0x6a   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 6b SB_4     SB_5     9 0 1001000011011001111001x0|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   0 0 0000000000011101x10xxxx0| SLTU   Set less than (unsigned)
    * 6d unx6d             7 6 01110110xxxxxxxxxxxxxxxx| 6d: Not in use 
    * 6e unx6e             7 6 01110110xxxxxxxxxxxxxxxx| 6e: Not in use 
    * 6f MRET_6   MRET_7   0 3 00000011000xxxx111110010|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    c 8 1100100000010101111001x1|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 6 0 011000000111010111011000|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   0 0 0000000000001101111010x0|        Invert q. Prepare read mask
    * 73 unalignd straddle 0 0 000000000000010111011000|  Fr10u Unaligned pc, prep read high hword
    * 74 MRET_9   Fetch    5 3 010100111101101110110010|        +1, IncPC, OpFetch next
    * 75 IJ_5     Fetch    5 0 0101000011011011101011x0|        Mask and use as PC
    * 76 Fetchu   Fetch2   0 b 000010110000011111011000|  Fr10u Read and latch instruction
    * 77 eFetchu  Fetch2   1 c 000111000001011111011000|  Fr10u rep Read until d=mem[(rs1+ofs) & ~3u]
    * 78 _L0x78   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 79 _L0x79   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 7a SB_5     SW_2     7 0 0111000001011001101001x0|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    0 0 0000000000000001x01xxxx0| JAL. J-imm is in q. Prep get isntradr from jj
    * 7c CSRRC_0  CSRRW_1  6 0 011000000000110111011000| CSRRC  Decoded CSR adr in yy
    * 7d condb_6t Fetch    5 0 010100001101101110110000|        Branch taken.
    * 7e NMI_1    NMI_2    6 0 01100000001xxxx1110001x0|        Store pc to mepc.
    * 7f unx7f             7 6 01110110xxxxxxxxxxxxxxxx| 7f: Not in use 
    * 80 LBU_0    LBU_1    0 0 000000001001101011110000| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 unx81             7 6 01110110xxxxxxxxxxxxxxxx| 81: Not in use 
    * 82 _L0x82   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 83 _L0x83   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 84 XORI_0   XORI_1   0 0 0000000000011111111010x0| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 0001000100010111111001x1|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   4 0 010000000100000111010000|      Prep pc = jj + ofs
    * 87 unx87             7 6 01110110xxxxxxxxxxxxxxxx| 87: Not in use 
    * 88 _L0x88   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 89 unx89             7 6 01110110xxxxxxxxxxxxxxxx| 89: Not in use 
    * 8a _L0x8a   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 8b LB_6     StdIncPc 3 3 001100110000010111010010|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    0 0 0000000000011111x10xxxx0| XOR    xor
    * 8d unx8d             7 6 01110110xxxxxxxxxxxxxxxx| 8d: Not in use 
    * 8e _LCSRRS_1 ILLe     0 0 00000000000xxxx1x0xxxxx0| Illegal instruction seen
    * 8f ILL_3    ILL_4    0 3 000000110001010111110010|        Q = 1
    * 90 NMI_2    JAL_3    e 0 111000000110100111011000|        mtval = 0.
    * 91 LDAF_2   LDAF_3   e 3 111000110100010100x10010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    6 0 011000000011001110x001x0|        PC to mepc
    * 93 SW_E2    SW_E3    6 0 0110000000110111110001x0|        Store address that faulted
    * 94 SW_E4    JAL_3    e 0 111000000101001110x10100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    0 3 000000110001011101110010|        Q = 3
    * 96 SH_1     SH_2     6 6 0110011000010111111001x0|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    6 0 011000000110010110x11000|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  6 0 011000000001110111011000| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    e 0 111000000101001100x10000|        mcause = 11
    * 9b SH_4     SH_5     9 0 1001000010111001111001x0|        Address back to Q. Prepare get item to write
    * 9c _L0x9c   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 9d unx9d             7 6 01110110xxxxxxxxxxxxxxxx| 9d: Not in use 
    * 9e JAL_25   JAL_3    3 4 001101000000010101010010|      Prep WTRG = jj+2/4 (return adr)
    * 9f SH_5     SW_2     7 0 0111000000111001101001x0|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    6 2 011000101001101011110000| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  0 3 000000110001010101110010|        Q = 4
    * a2 _L0xa2   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * a3 _L0xa3   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * a4 SRxI_0   SRxI_1   0 6 000001100001111010x11000| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   0 3 000000110000110111110010|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  0 9 000010010001011110111000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 0 0 00000000000xxxx111110000| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 _L0xa8   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * a9 ILL_4    JAL_3    e 3 111000110101001110x10010|        Store 2 to mcause
    * aa _L0xaa   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * ab EBREAK_2 ECALL_6  6 0 0110000000110101110001x0|        pc to mepc
    * ac _L0xac   SRx_1    0 0 0000000000011101x0xxxxx0| SRx    Shift Right (both SRL and SRA)
    * ad unxad             7 6 01110110xxxxxxxxxxxxxxxx| ad: Not in use 
    * ae _L0xae   SRx_1    0 0 0000000000011101x0xxxxx0| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   0 3 00000011000xxxx111110010|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   e 0 111000000100010100x10000|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  0 3 000000110001010101110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    5 3 010100111101101100110010|        IncPC, OpFetch, but force +4
    * b3 unxb3             7 6 01110110xxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 eFetch3  unalignd 4 d 010011010011111111110010|  Fr10  Update minstret, Q=immediate. Use dinx
    * b5 SH_3     SH_4     0 0 000000000000000111011000|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  0 3 000000110001010101110010|        Q = 8
    * b7 IJ_3     IJ_4     6 0 0110000000010101110001x0|        Store present PC in case of access error
    * b8 BGE      condb_2  6 0 011000000001110111011000| BGE    Conditional Branch. Offset to Ryy
    * b9 _L0xb9   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * ba LHU_3    ANDI_1   0 0 0000000000001111111010x0|        Invert q. Prepare read mask
    * bb SH_2     SH_3     d 6 110101100001011111110100|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  6 0 011000000000110111011000| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     IJ_5     0 3 000000110000010111110010|        Construct Q = 1
    * be IJ_1     IJ_2     1 0 0001000000010111111001x0|        Read until q=mem[(rs1+ofs)&~1u]
    * bf IJT_1    IJT_2    1 0 0001000000010111111001x0|        Exit CSR, enter trap
    * c0 _L0xc0   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * c1 IJT_2    IJT_3    6 0 011000000001010111011000|        Read word is to be masked with ~1u
    * c2 _L0xc2   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * c3 _L0xc3   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * c4 ORI_0    ORI_1    4 0 0100000000011111110010x0| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   0 0 0000000000000001111010x0|        ~302
    * c6 IJT_4    ILL_2    6 0 0110000000110101111011x0|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   6 0 01100000001xxxx1110001x0|        Store pc to mepc.
    * c8 _L0xc8   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * c9 MRET_2   MRET_3   0 0 000000000000110101110000|        0xff+3 = 0x102
    * ca _L0xca   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * cb QINT_2   StdIncPc e 0 111000000110100111011000|        mtval = 0.
    * cc OR_0     OR_1     0 0 0000000000011111x10xxxx0| OR     or
    * cd unxcd             7 6 01110110xxxxxxxxxxxxxxxx| cd: Not in use 
    * ce _LCSRRCI_1 ILLe     0 0 00000000000xxxx1x0xxxxx0| Illegal instruction seen
    * cf MRET_7   MRET_8   0 5 0000010100001101x10xxxx0|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  0 3 000000110000000111110010| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   4 0 010000000000110111011000| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     c 8 1100100000010101111001x1|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 6 0 011000000111010111011000|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   e 3 111000110100010110x10010|        Store 5 to mcause
    * d5 eFetch2  eFetch3  4 e 010011100110001111010000|  Fr10  Update ttime
    * d6 eILL0c   ILLe     0 0 00000000000xxxx1x0xxxxx0| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  6 0 011000000111010111011000|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  6 0 011000000001110111011000| BLTU   Conditional Branch. Offset to Ryy
    * d9 _L0xd9   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * da LDAF_a   LDAF_2   0 0 0000000000010101x10xxxx0|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   6 3 011000110101100110x10010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  6 0 011000000000110111011000| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  6 0 011000000111010111011000|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   4 b 010010110000011111011000|  Fr10  Read and latch instruction
    * df eFetch   eFetch2  5 c 010111000001011111011000|  Fr10  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 _L0xe0   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * e1 ORI_1    ORI_2    0 0 0000000000000001111001x0|        Q = RS1
    * e2 _L0xe2   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * e3 _L0xe3   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * e4 ANDI_0   ANDI_1   0 0 0000000000011111111010x0| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  0 3 000000110001010101110010|        Q = 4
    * e6 StdIncPc Fetch    5 4 010101001101101100110010|  Fr10  IncPC, OpFetch
    * e7 aFault   aFault_1 6 0 011000000111010111011000|  err   Load access fault. Faulting adr to mtval
    * e8 _L0xe8   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * e9 IJT_3    IJT_4    0 3 000000110001100111110010|        Construct Q = 1
    * ea _L0xea   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * eb LH_3     LH_4     0 0 0000000000001111111010x0|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    0 0 0000000000011111x10xxxx0| AND    And 
    * ed unxed             7 6 01110110xxxxxxxxxxxxxxxx| ed: Not in use
    * ee eILL0a   ILLe     0 0 00000000000xxxx1x0xxxxx0| Illegal instruction seen
    * ef WFI_5    Fetch    5 3 010100111101101100110010|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    c 8 1100100000010101111001x1|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 6 0 011000000111010111011000|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 0 0 0000000000000101x10xxxx0|        Prepare read PC
    * f3 aF_SW    aF_SW_1  0 0 00000000000xxxx1x01xxxx0|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   unalignd 4 f 010011110111111111110000|  Fr10  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 6 0 011000000111010111011000|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    0 3 000000110001100101110010| WFI    Chk offset=0x105. Now 0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 6 0 011000000110000111011000| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  6 0 011000000001110111011000| BGEU   Conditional Branch. Offset to Ryy
    * f9 _L0xf9   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * fa WFI_2    WFI_3    0 3 000000110001010111110010|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     0 0 000000000000000111011000|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  6 0 011000000000110111011000| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    0 0 0000000000000101x10xxxx0| NMI    Get current PC
    * fe ILLe     ILL_1    0 0 0000000000000101x0xxxxx0| Illegal
    * ff QINT_0   QINT_1   0 0 0000000000000101x10xxxx0| INT    Get current PC
    */
   localparam u0_0 = 256'hd8e64010d8e6e404f233f05ae08bf05aec09e8072004d0e640e6f0bee5d2f001;
   localparam u0_1 = 256'hb8b772d4dce6b8a62032cce69041d813a47d40e6e416f215e0143276e01ae08b;
   localparam u0_2 = 256'hd8e60000d8e6003ed230f096e021f096f01dc0272004983540e600fec0e6f052;
   localparam u0_3 = 256'h843a8435e503d8492032e53d00fed813c4d7f403e436a4decc9ea486e02bdae6;
   localparam u0_4 = 256'h727400fe00004031a4b1f066f24bf066c48f8447f265e82b00fe00fec40bf050;
   localparam u0_5 = 256'hb8dae570f4fbd8492032e45d00fe00fee08bec57d81ee5ebb8dae554b8dac4e6;
   localparam u0_6 = 256'hf2cf000000004031e47a00fe000000fe9893a4f240efe82b00fe00fec8f700fe;
   localparam u0_7 = 256'h0000c490b0ded8492032a4f200fe00fed8f4d8f4acdeb2ded812e81ad81ee5ba;
   localparam u0_8 = 256'hf2a900fe00004029d2e600fe000000fe0000d09ee5f0e82100fe00fe0000f085;
   localparam u0_9 = 256'ha4f25234000000fee49f103400fed8139893e4bb72949434c49584341292d834;
   localparam u0_A = 256'hf2c5003f0000003fc49a00fe923400fef061b8d0f2af983a00fe00fe72b6f05e;
   localparam u0_B = 256'he4c1e41ff275d849f4b5e81a00fed813c4bd729ad89bf273000032de72b21092;
   localparam u0_C = 256'h404f00fe00004026d8e600fe70a500fec4cbec47e86fc8e100fe00fed8e900fe;
   localparam u0_D = 256'hd8d5d8f4d8e5d8499292409100fed813d8a100fed0b49292d81ee506d8c9f237;
   localparam u0_E = 256'h32de00fe00004011e85600fef2c600fed81e32de72b0e81a00fe00fee41d00fe;
   localparam u0_F = 256'h40c70046407ed849d86bf24500fed813d8ab72fad8dbf07320dd40e6d81ee572;
   localparam u1_0 = 256'h3005001d3005001d0305401c000b401c000b000d000130050005229b1117009a;
   localparam u1_1 = 256'h4041031530050217000130054041601d6001000105010319001f54db001d001f;
   localparam u1_2 = 256'h300576003005001d0301421c001d421c0001401d0001061e000500013005629a;
   localparam u1_3 = 256'h061e061e8815600d000138150001601d65218617361750db40416001001f3705;
   localparam u1_4 = 256'h031500017600001da075999d0301999d607560350315001f000100016015099b;
   localparam u1_5 = 256'h60751117d617600d0001661700010001001100116075c815607511176075ba17;
   localparam u1_6 = 256'h030176007600001d90d90001760000016065707d0501001f00010001650d0001;
   localparam u1_7 = 256'h7600602150db600d00017059000100011c170b0750db53db0005000d6075c815;
   localparam u1_8 = 256'h031500017600001f3305000176000001760040411117001f000100017600009a;
   localparam u1_9 = 256'h703934057600000190b9e0530001601d606566170317e05360376033e345e069;
   localparam u1_A = 256'h0301001d7600001d60350001e353000100010917030d061e000100010315629a;
   localparam u1_B = 256'h101710170305600dd617000f0001601d6015031500014d3f760053db0315e045;
   localparam u1_C = 256'h050d00017600001fe0690001000d0001602160350001401f0001000160150001;
   localparam u1_D = 256'h5c174b076075600d635900150001601d607500014e63e3456075c815400d0301;
   localparam u1_E = 256'h53db00017600001f000f000103190001607554db0315001f0001000100010001;
   localparam u1_F = 256'h000500050005600d000103150001601d6061031960754f7f000100056075c815;
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
   assign d[8] = indir[8];
   assign d[9] = indir[9];
   assign d[11] = indir[10];
   assign d[12] = indir[11];
   assign d[13] = indir[12];
   assign d[16] = indir[13];
   assign d[17] = indir[14];
   assign d[19] = indir[15];
   assign d[20] = indir[16];
   assign d[22] = indir[17];
   assign d[23] = indir[18];
   assign d[24] = indir[19];
   assign d[25] = indir[20];
   assign d[26] = indir[21];
   assign d[27] = indir[22];
   assign d[40] = indir[23];
   // replaces = 1000100100111000000001001001100010000000000
   SB_LUT4 #(.LUT_INIT(16'h2018)) cmb_d10(.O(d[10]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d14(.O(d[14]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1800)) cmb_d15(.O(d[15]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hc000)) cmb_d18(.O(d[18]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hfebf)) cmb_d21(.O(d[21]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'ha000)) cmb_d30(.O(d[30]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0204)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1002)) cmb_d35(.O(d[35]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1400)) cmb_d38(.O(d[38]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d42(.O(d[42]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0101011011000110000000000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h6948)) cmb_d28(.O(d[28]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h6070)) cmb_d29(.O(d[29]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0822)) cmb_d33(.O(d[33]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h3100)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4004)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4400)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1207)) cmb_d39(.O(d[39]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[43] = 1'b0;
   assign d[44] = 1'b0;
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   RVC included
 *   No MULDIV
 *   minstret for instructions in SRAM and EBR
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 43 columns
 * Removed:  0000000000000000000000000000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 0000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 43
 * 168 distinct lines in remaining untreated columns
 * c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 167 168 168 168 168 168 168 168 168 168 168 168 168 168 168 168 168 167 168 167 167 168 168 166 168 168 168 168 168 166 165 167 168 167 168 167 168 167 168 168 167 167 167  kill col 12  Tbl  42 cols 0000000000000000000000000000001000000000000 has 165 unique lines.
 * 164 165 165 165 165 165 165 165 165 165 165 165 165 165 165 165 165 163 165 164 162 165 165 163 165 165 165 165 165 163     163 164 164 165 164 165 164 165 165 164 164 164  kill col 22  Tbl  41 cols 0000000000000000000010000000001000000000000 has 162 unique lines.
 * 161 162 162 162 162 162 162 162 162 162 162 162 162 162 162 162 162 161 162 161     162 162 160 162 162 162 162 162 160     160 161 161 162 161 161 160 162 162 161 161 160  kill col 19  Tbl  40 cols 0000000000000000000010010000001000000000000 has 160 unique lines.
 * 159 160 160 160 160 160 160 160 160 160 160 160 160 160 160 160 160 159 160 159     160 160     160 160 160 160 160 158     157 159 159 160 159 159 158 160 160 159 159 158  kill col 11  Tbl  39 cols 0000000000000000000010010000001100000000000 has 157 unique lines.
 * 156 157 157 157 157 157 157 157 157 157 157 157 157 157 157 157 157 156 157 156     157 157     157 157 157 157 157 151         156 156 157 156 156 155 156 157 156 156 155  kill col 13  Tbl  38 cols 0000000000000000000010010000011100000000000 has 151 unique lines.
 * 150 151 151 151 151 151 151 151 151 151 151 151 151 151 151 151 151 150 151 150     151 151     151 151 151 151 151             150 150 150 150 150 149 150 151 150 150 149  kill col  5  Tbl  37 cols 0000000000000000000010010000011100000100000 has 149 unique lines.
 * 148 149 149 149 149 149 149 149 149 149 149 149 149 149 149 149 149 148 149 148     149 149     149 149 149 149 149             148 148 148 146 148     148 148 146 146 146  kill col  7  Tbl  36 cols 0000000000000000000010010000011100010100000 has 146 unique lines.
 * 145 146 146 146 146 146 146 146 146 146 146 146 146 146 145 146 146 145 145 145     146 146     146 145 146 146 146             145 145 145     145     145 144 141 141 143  kill col  2  Tbl  35 cols 0000000000000000000010010000011100010100100 has 141 unique lines.
 * 140 141 141 141 141 141 141 141 141 141 141 141 141 141 140 140 141 139 140 139     141 141     141 140 139 141 140             140 140 140     139     140 138     137 137  kill col  1  Tbl  34 cols 0000000000000000000010010000011100010100110 has 137 unique lines.
 * 136 137 137 137 137 137 137 137 136 137 137 137 137 137 136 136 137 135 136 135     137 137     137 136 132 137 136             136 136 136     131     133 129         133  kill col  3  Tbl  33 cols 0000000000000000000010010000011100010101110 has 129 unique lines.
 * 128 129 129 129 129 129 129 129 127 129 129 129 129 129 128 128 128 126 127 125     129 129     129 126 124 129 128             128 128 128     118     120             121  kill col  6  Tbl  32 cols 0000000000000000000010010000011100011101110 has 118 unique lines.
 * 117 118 118 118 118 118 118 118 117 118 118 117 118 118 117 115 117 113 115 114     118 118     118 114 112 118 117             117 117 117             103             106  kill col  4  Tbl  31 cols 0000000000000000000010010000011100011111110 has 103 unique lines.
 * 101 103 103 103 103 103 103 103 101 103 102 102 103 102 101 100 102  96  99  98     103 103     103  97  97 102 100             102 102 102                              88  kill col  0  Tbl  30 cols 0000000000000000000010010000011100011111111 has  88 unique lines.
 *  86  88  88  88  88  88  88  88  85  88  87  87  88  86  86  86  87  82  84  83      88  88      88  82  81  87  84              87  87  86                                  kill col 16  Tbl  29 cols 0000000000000000000010010010011100011111111 has  81 unique lines.
 *  79  81  81  81  81  81  81  81  78  80  80  80  81  79  79  78  80  74  76  75      80  80      81  75      80  77              80  80  79                                  kill col 25  Tbl  28 cols 0000000000000000010010010010011100011111111 has  74 unique lines.
 *  72  74  74  74  74  74  74  74  71  73  73  72  74  71  73  71  72      68  64      72  73      74  67      73  70              73  73  72                                  kill col 23  Tbl  27 cols 0000000000000000010110010010011100011111111 has  64 unique lines.
 *  62  63  64  64  64  64  64  64  61  63  63  62  64  61  63  61  61      59          62  63      64  58      63  60              63  63  62                                  kill col 17  Tbl  26 cols 0000000000000000010110010110011100011111111 has  58 unique lines.
 *  56  57  58  58  58  58  58  58  55  57  57  56  58  55  57  56  56      54          56  57      58          57  54              57  57  56                                  kill col 24  Tbl  25 cols 0000000000000000011110010110011100011111111 has  54 unique lines.
 *  52  53  53  53  54  53  54  54  51  53  53  52  53  50  53  51  50                  52  53      54          53  51              53  53  52                                  kill col 29  Tbl  24 cols 0000000000000100011110010110011100011111111 has  50 unique lines.
 *  48  49  49  47  50  49  50  50  48  49  49  48  49      47  46  45                  48  49      49          49  47              49  49  48                                  kill col 26  Tbl  23 cols 0000000000000100111110010110011100011111111 has  45 unique lines.
 *  43  44  44  42  45  44  45  45  43  44  44  43  44      43  41                      43  44      44          44  43              44  44  43                                  kill col 27  Tbl  22 cols 0000000000000101111110010110011100011111111 has  41 unique lines.
 *  39  40  40  38  41  40  41  41  39  40  40  39  40      40                          39  40      40          40  39              40  40  39                                  kill col 39  Tbl  21 cols 0001000000000101111110010110011100011111111 has  38 unique lines.
 *  36  37  35      38  37  38  38  36  37  37  36  36      34                          36  36      37          37  36              37  37  36                                  kill col 28  Tbl  20 cols 0001000000000111111110010110011100011111111 has  34 unique lines.
 *  32  33  30      33  33  33  34  32  33  33  31  32                                  32  31      33          33  33              33  33  32                                  kill col 40  Tbl  19 cols 0011000000000111111110010110011100011111111 has  30 unique lines.
 *  28  28          29  29  28  30  28  27  29  28  28                                  28  27      29          29  29              29  29  28                                  kill col 33  Tbl  18 cols 0011000001000111111110010110011100011111111 has  27 unique lines.
 *  26  25          26  26  25  27  25      26  25  25                                  25  24      26          26  26              26  26  25                                  kill col 20  Tbl  17 cols 0011000001000111111110110110011100011111111 has  24 unique lines.
 *  23  22          23  23  22  24  22      23  23  22                                  23          23          23  23              23  23  22                                  kill col 41  Tbl  16 cols 0111000001000111111110110110011100011111111 has  22 unique lines.
 *  21              21  21  20  22  20      21  21  20                                  21          21          21  21              21  21  20                                  kill col 36  Tbl  15 cols 0111001001000111111110110110011100011111111 has  20 unique lines.
 *  19              19  18      20  18      19  19  18                                  19          19          19  19              19  19  18                                  kill col 37  Tbl  14 cols 0111011001000111111110110110011100011111111 has  18 unique lines.
 *  17              17          18  16      17  17  16                                  17          17          17  17              17  17  16                                  kill col 34  Tbl  13 cols 0111011011000111111110110110011100011111111 has  16 unique lines.
Possible good candidates for removal, columns : 8 14 30 
 *
 * Round 1: 1000100100111000000001001001100011100000000  4 columns for indexes to table representing 13 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 34
 * 163 distinct lines in remaining untreated columns
 * c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x 163 163 163   x 163 163   x 163 163   x   x   x 163 163 163 163 162 163 162 162   x 163 160   x 163 163   x   x 161 160 161   x   x   x 162 163 162 163 163 162 162 162  kill col 19  Tbl  29 cols 1000100100111000000001011001100011100000000 has 160 unique lines.
 *   x 160 160 160   x 160 160   x 160 160   x   x   x 160 160 160 160 159 160 159 159   x 160       x 160 160   x   x 158 157 158   x   x   x 159 160 159 160 160 159 159 159  kill col 12  Tbl  28 cols 1000100100111000000001011001101011100000000 has 157 unique lines.
 *   x 157 157 157   x 157 157   x 157 157   x   x   x 157 157 157 157 155 157 156 154   x 157       x 157 157   x   x 155     154   x   x   x 156 157 156 157 157 156 156 156  kill col 22  Tbl  27 cols 1000100100111000000011011001101011100000000 has 154 unique lines.
 *   x 154 154 154   x 154 154   x 154 154   x   x   x 154 154 154 154 153 154 153       x 154       x 154 154   x   x 151     151   x   x   x 153 153 152 154 154 153 153 152  kill col 13  Tbl  26 cols 1000100100111000000011011001111011100000000 has 151 unique lines.
 *   x 151 151 151   x 151 151   x 151 151   x   x   x 151 151 151 151 150 151 150       x 151       x 151 151   x   x         144   x   x   x 150 150 149 151 151 150 150 149  kill col 11  Tbl  25 cols 1000100100111000000011011001111111100000000 has 144 unique lines.
 *   x 144 144 144   x 144 144   x 144 144   x   x   x 144 144 144 144 143 144 143       x 144       x 144 144   x   x               x   x   x 143 143 142 143 144 143 143 142  kill col  5  Tbl  24 cols 1000100100111000000011011001111111100100000 has 142 unique lines.
 *   x 142 142 142   x 142 142   x 141 141   x   x   x 142 142 142 142 141 142 141       x 142       x 142 140   x   x               x   x   x 138 141     141 141 138 139 138  kill col  7  Tbl  23 cols 1000100100111000000011011001111111110100000 has 138 unique lines.
 *   x 138 138 138   x 138 138   x 137 137   x   x   x 138 137 138 138 137 135 137       x 138       x 137 135   x   x               x   x   x     137     137 135 131 133 134  kill col  2  Tbl  22 cols 1000100100111000000011011001111111110100100 has 131 unique lines.
 *   x 131 131 131   x 131 131   x 130 129   x   x   x 131 130 130 131 128 128 128       x 130       x 128 128   x   x               x   x   x     129     130 127     127 126  kill col  0  Tbl  21 cols 1000100100111000000011011001111111110100101 has 126 unique lines.
 *   x 126 126 126   x 126 126   x 125 123   x   x   x 126 125 125 126 121 123 122       x 125       x 123 120   x   x               x   x   x     123     120 121     122      kill col 16  Tbl  20 cols 1000100100111000000011011011111111110100101 has 120 unique lines.
 *   x 120 120 120   x 120 120   x 119 117   x   x   x 119 119 119 119 114 117 116       x 119       x 114       x   x               x   x   x     115     112 111     109      kill col  1  Tbl  19 cols 1000100100111000000011011011111111110100111 has 109 unique lines.
 *   x 109 109 109   x 109 109   x 106 106   x   x   x 108 108 107 108 102 105 103       x 108       x 103       x   x               x   x   x     100      98  96              kill col  3  Tbl  18 cols 1000100100111000000011011011111111110101111 has  96 unique lines.
 *   x  96  95  96   x  96  96   x  90  93   x   x   x  95  95  94  93  89  89  90       x  95       x  88       x   x               x   x   x      78      79                  kill col  6  Tbl  17 cols 1000100100111000000011011011111111111101111 has  78 unique lines.
 *   x  78  77  78   x  78  77   x  75  76   x   x   x  77  77  75  75  66  69  70       x  77       x  69       x   x               x   x   x              58                  kill col  4  Tbl  16 cols 1000100100111000000011011011111111111111111 has  58 unique lines.
 *   x  58  57  58   x  58  57   x  55  56   x   x   x  56  55  54  55  49  52  52       x  55       x  51       x   x               x   x   x                                  kill col 25  Tbl  15 cols 1000100100111000010011011011111111111111111 has  49 unique lines.
 *   x  49  48  49   x  49  48   x  46  47   x   x   x  47  47  45  45      45  42       x  46       x  42       x   x               x   x   x                                  kill col 23  Tbl  14 cols 1000100100111000010111011011111111111111111 has  42 unique lines.
 *   x  41  41  42   x  42  41   x  39  40   x   x   x  40  40  37  36      38           x  39       x  36       x   x               x   x   x                                  kill col 26  Tbl  13 cols 1000100100111000110111011011111111111111111 has  36 unique lines.
 *   x  35  35  35   x  36  35   x  33  34   x   x   x  34  33  31          31           x  33       x  31       x   x               x   x   x                                  kill col 27  Tbl  12 cols 1000100100111001110111011011111111111111111 has  31 unique lines.
 *   x  30  30  30   x  31  30   x  28  28   x   x   x  29  28              26           x  28       x  26       x   x               x   x   x                                  kill col 24  Tbl  11 cols 1000100100111001111111011011111111111111111 has  26 unique lines.
 *   x  25  25  24   x  25  25   x  23  23   x   x   x  23  24                           x  22       x  22       x   x               x   x   x                                  kill col 20  Tbl  10 cols 1000100100111001111111111011111111111111111 has  22 unique lines.
 *   x  21  20  21   x  21  21   x  19  19   x   x   x  19  20                           x           x  18       x   x               x   x   x                                  kill col 17  Tbl   9 cols 1000100100111001111111111111111111111111111 has  18 unique lines.
 *   x  17  15  17   x  17  17   x  15  15   x   x   x  15  16                           x           x           x   x               x   x   x                                  kill col 40  Tbl   8 cols 1010100100111001111111111111111111111111111 has  15 unique lines.
Possible good candidates for removal, columns : 29 33 34 
 *
 * Round 2: 0101011011000110000000000000000000000000000  4 columns for indexes to table representing  8 original columns (uses 15 of 16 lines in indirect table).
 * Direct:  0010000000000001111110110110011100011111111 22 columns
 * Can even chose 2 more columns to be represented directly.
 * Success. Use 2 EBRs, 19 LUTs.
 */

module v11_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    *                      indirect_index 1
    * inx         next     | indirect index 0
    * || ucode    ucode    | | direct representation
    * 00 LB_0     LB_1     0 0 000000001001101011110000| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 0001000100010111111001x1|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 001000101001101111110000| IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0
    * 03 _L0x03   StdIncPc 0 0 0000000000000101x10xxxx0| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 3 0 001100000000010111010000| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   0 0 0000000000000001x01xxxx0| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 06 LB_3     LB_4     0 0 0000000000001101111010x0|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     0 0 0000000000001011111011x0|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     4 0 010000000001110011110000| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     0 0 0000000000001011111000x0|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     4 0 010000000001110011110000| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JALR_3   0 3 000000110000010111110010|        Q=1. Prep legalize target
    * 0c ADD_0    ADDI_0   0 0 0000000000011101111001x0| ADD    add     Addition Q = RS1
    * 0d _L0x0d   StdIncPc 3 0 001100000000010111011000| LUI    q = imm20
    * 0e SUB_0    SUB_1    0 0 0000000000011101x10xxxx0| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 3 0 001100000000010111011000| LUI    q = imm20
    * 10 SUB_1    LB_6     0 0 0000000000011111111000x0|        Q = ~RS2
    * 11 AND_1    ANDI_1   0 0 0000000000011101111000x0|        RS1^0xffffffff to Q
    * 12 straddle Fetchu   5 4 010101001101101100110010|  Fr10u IncPC, OpFetch
    * 13 condb_2  condb_3  0 0 0000000000011111111000x0|        ~RS2 in Q
    * 14 condb_3  condb_4  0 3 000000110001100111110010|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  0 5 0000010100000001111001x0|        Branch on condition
    * 16 condb_5  StdIncPc 0 0 0000000000000001x10xxxx0|        Branch not taken.
    * 17 condb_5t condb_6t 6 0 0110000000000001101001x0|        Branch taken. yy=oldPC incase of access error
    * 18 BEQ      condb_2  6 0 011000000001110111011000| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   4 0 010000000100000110x10000| JALR   (tmp) Prep pc=RS1+imm (target)
    * 1a ANDI_1   StdIncPc 3 0 0011000000000101110011x0|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    0 0 0000000000000001x01xxxx0| JAL. J-imm is in q. Prep get isntradr from jj
    * 1c ECAL_BRK ECAL_RET 0 2 000000100001011110111000| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 3 0 001100000000010111011100|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 0 3 000000110001010101110010|        Q = 4
    * 1f IJ_2     IJ_3     4 0 010000000100000110111000|        Read word is to be masked with lsb = 0
    * 20 LH_0     LH_1     6 2 011000101001101011110000| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 3 0 0011000000000101110000x0|        rd = Iimm ^ RS1
    * 22 _L0x22   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 23 _L0x23   StdIncPc 0 0 0000000000000101x10xxxx0| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   0 6 000001100001111010x11000| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   0 0 0000000000000001x01xxxx0| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 26 OR_1     OR_2     4 0 0100000000011101110000x0|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    0 0 000000000000000111110000|        Q = rs2
    * 28 _L0x28   SH_1     4 2 010000100001110011110000| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   0 0 0000000000011101111000x0|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     4 2 010000100001110011110000| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  0 3 00000011000xxxx111010010|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    0 0 0000000000011101x0xxxxx0| SLL    Shift left
    * 2d _L0x2d   StdIncPc 3 0 001100000000010111011000| LUI    q = imm20
    * 2e unx2e             7 6 01110110xxxxxxxxxxxxxxxx| 2e: Not in use 
    * 2f _L0x2f   StdIncPc 3 0 001100000000010111011000| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 3 7 001101110000010111011010|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  0 0 0000000000011111111000x0|        ~rs2 to Q
    * 32 JAL_1    JAL_2    6 0 0110000000000001101001x0|      Prep Instradr to yy. Refetch instradr
    * 33 JALR_3   JAL_25   4 0 0100000001000001110011x0|        Q = (RS1+imn) & 0xfffffffe
    * 34 JAL_3    Fetch    5 0 0101000011011011101001x0|      Prep fetch next instr.
    * 35 SLLI_1   SLLI_2   3 6 0011011000010111111001x0|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   8 6 100001100001011111110100|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  6 5 01100101001xxxx1110001x0|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  6 0 011000000001110111011000| BNE    Conditional Branch. Offset to Ryy
    * 39 _L0x39   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 3a SRxI_1   SRxI_2   3 8 0011100000010101111001x1|        Register to shift to Q
    * 3b _L0x3b   JAL_1    0 0 0000000000000001x01xxxx0| JAL. J-imm is in q. Prep get isntradr from jj
    * 3c CSRRW_0  CSRRW_1  6 0 011000000000110111011000| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   8 8 1000100000010101111001x1|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   0 6 000001100001111010x001x0|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   0 6 000001100001111010x001x0|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 9 000010011001101111110000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   6 0 0110000000010101110001x0|        yy=jj. Prep get Q=1
    * 42 _L0x42   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 43 _L0x43   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 44 SLTI_0   SLTIX_1  0 0 0000000000011111111010x0| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    0 3 000000110001010111110010|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    6 0 011000000011010110x001x0|        Store PC to mepc
    * 47 ILL_2    ILL_3    6 0 0110000001110101110001x0|        Store 0 to mtval
    * 48 _L0x48   SW_1     9 9 100110011001110111110000| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  0 3 000000110000000111110010|        Construct PC storage adr
    * 4a _L0x4a   SW_1     9 9 100110011001110111110000| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  a 0 1010000001110101101001x0|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   0 0 0000000000011101x10xxxx0| SLT    Set less than (signed)
    * 4d unx4d             7 6 01110110xxxxxxxxxxxxxxxx| 4d: Not in use 
    * 4e eILL0b   ILLe     0 0 00000000000xxxx1x0xxxxx0| Illegal instruction seen
    * 4f MRET_8   MRET_9   0 3 000000110001010101110010|        +4, so now 0x103
    * 50 LW_1     StdIncPc b a 1011101000010111110001x0|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   6 0 011000000111010110111000|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 0001000100010111111001x1|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   6 0 011000000111010110111000|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     c 8 1100100000010101111001x1|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 6 0 011000000111010111011000|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     0 0 0000000000010001111011x0|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     0 0 0000000000010001111000x0|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 _L0x58   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 59 _L0x59   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 5a SB_1     SB_2     6 6 0110011000010111111001x0|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    0 0 0000000000000001x01xxxx0| JAL. J-imm is in q. Prep get isntradr from jj
    * 5c CSRRS_0  CSRRW_1  6 0 011000000000110111011000| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     d 6 110101100001011111110100|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 0001000100010111111001x1|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   6 0 011000000111010110111000|  err   LD AlignFault. Faulting adr to mtval
    * 60 _L0x60   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 61 EBRKWFI2 EBREAK_1 6 5 0110010100001101110010x0| EBREAK/WFI2 Select EBREAK or WFI.
    * 62 _L0x62   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 63 _L0x63   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 64 SLTIU_0  SLTIX_1  0 0 0000000000011111111010x0| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    0 5 0000010100000001x10xxxx0|        Prepare read PC.
    * 66 SW_1     SW_2     7 0 0111000001111101101001x0|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    6 0 011000000110010110x11000|        Store faulting address alignment to mtval
    * 68 _L0x68   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 69 unx69             7 6 01110110xxxxxxxxxxxxxxxx| 69: Not in use 
    * 6a _L0x6a   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 6b SB_4     SB_5     9 0 1001000011011001111001x0|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   0 0 0000000000011101x10xxxx0| SLTU   Set less than (unsigned)
    * 6d unx6d             7 6 01110110xxxxxxxxxxxxxxxx| 6d: Not in use 
    * 6e unx6e             7 6 01110110xxxxxxxxxxxxxxxx| 6e: Not in use 
    * 6f MRET_6   MRET_7   0 3 00000011000xxxx111110010|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    c 8 1100100000010101111001x1|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 6 0 011000000111010111011000|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   0 0 0000000000001101111010x0|        Invert q. Prepare read mask
    * 73 unalignd straddle 0 0 000000000000010111011000|  Fr10u Unaligned pc, prep read high hword
    * 74 MRET_9   Fetch    5 3 010100111101101110110010|        +1, IncPC, OpFetch next
    * 75 IJ_5     Fetch    5 0 0101000011011011101011x0|        Mask and use as PC
    * 76 Fetchu   Fetch2u  0 b 000010110000011111011000|  Fr10u Read and latch instruction
    * 77 eFetchu  Fetch2u  1 c 000111000001011111011000|  Fr10u rep Read until d=mem[(rs1+ofs) & ~3u]
    * 78 _L0x78   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 79 _L0x79   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 7a SB_5     SW_2     7 0 0111000001011001101001x0|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    0 0 0000000000000001x01xxxx0| JAL. J-imm is in q. Prep get isntradr from jj
    * 7c CSRRC_0  CSRRW_1  6 0 011000000000110111011000| CSRRC  Decoded CSR adr in yy
    * 7d condb_6t Fetch    5 0 010100001101101110110000|        Branch taken.
    * 7e NMI_1    NMI_2    6 0 01100000001xxxx1110001x0|        Store pc to mepc.
    * 7f unx7f             7 6 01110110xxxxxxxxxxxxxxxx| 7f: Not in use 
    * 80 LBU_0    LBU_1    0 0 000000001001101011110000| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 unx81             7 6 01110110xxxxxxxxxxxxxxxx| 81: Not in use 
    * 82 _L0x82   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 83 _L0x83   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 84 XORI_0   XORI_1   0 0 0000000000011111111010x0| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 0001000100010111111001x1|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   4 0 010000000100000111010000|      Prep pc = jj + ofs
    * 87 unx87             7 6 01110110xxxxxxxxxxxxxxxx| 87: Not in use 
    * 88 _L0x88   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 89 unx89             7 6 01110110xxxxxxxxxxxxxxxx| 89: Not in use 
    * 8a _L0x8a   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 8b LB_6     StdIncPc 3 3 001100110000010111010010|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    0 0 0000000000011111x10xxxx0| XOR    xor
    * 8d unx8d             7 6 01110110xxxxxxxxxxxxxxxx| 8d: Not in use 
    * 8e _LCSRRS_1 ILLe     0 0 00000000000xxxx1x0xxxxx0| Illegal instruction seen
    * 8f ILL_3    ILL_4    0 3 000000110001010111110010|        Q = 1
    * 90 NMI_2    JAL_3    e 0 111000000110100111011000|        mtval = 0.
    * 91 LDAF_2   LDAF_3   e 3 111000110100010100x10010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    6 0 011000000011001110x001x0|        PC to mepc
    * 93 SW_E2    SW_E3    6 0 0110000000110111110001x0|        Store address that faulted
    * 94 SW_E4    JAL_3    e 0 111000000101001110x10100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    0 3 000000110001011101110010|        Q = 3
    * 96 SH_1     SH_2     6 6 0110011000010111111001x0|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    6 0 011000000110010110x11000|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  6 0 011000000001110111011000| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    e 0 111000000101001100x10000|        mcause = 11
    * 9b SH_4     SH_5     9 0 1001000010111001111001x0|        Address back to Q. Prepare get item to write
    * 9c _L0x9c   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * 9d unx9d             7 6 01110110xxxxxxxxxxxxxxxx| 9d: Not in use 
    * 9e JAL_25   JAL_3    3 4 001101000000010101010010|      Prep WTRG = jj+2/4 (return adr)
    * 9f SH_5     SW_2     7 0 0111000000111001101001x0|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    6 2 011000101001101011110000| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  0 3 000000110001010101110010|        Q = 4
    * a2 _L0xa2   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * a3 _L0xa3   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * a4 SRxI_0   SRxI_1   0 6 000001100001111010x11000| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   0 3 000000110000110111110010|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  0 9 000010010001011110111000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 0 0 00000000000xxxx111110000| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 _L0xa8   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * a9 ILL_4    JAL_3    e 3 111000110101001110x10010|        Store 2 to mcause
    * aa _L0xaa   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * ab EBREAK_2 ECALL_6  6 0 0110000000110101110001x0|        pc to mepc
    * ac _L0xac   SRx_1    0 0 0000000000011101x0xxxxx0| SRx    Shift Right (both SRL and SRA)
    * ad unxad             7 6 01110110xxxxxxxxxxxxxxxx| ad: Not in use 
    * ae _L0xae   SRx_1    0 0 0000000000011101x0xxxxx0| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   0 3 00000011000xxxx111110010|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   e 0 111000000100010100x10000|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  0 3 000000110001010101110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    5 3 010100111101101100110010|        IncPC, OpFetch, but force +4
    * b3 unxb3             7 6 01110110xxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 eFetch3  unalignd 4 d 010011010011111111110010|  Fr11  Write minstret. Update I. Q=immediate, use dinx
    * b5 SH_3     SH_4     0 0 000000000000000111011000|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  0 3 000000110001010101110010|        Q = 8
    * b7 IJ_3     IJ_4     6 0 0110000000010101110001x0|        Store present PC in case of access error
    * b8 BGE      condb_2  6 0 011000000001110111011000| BGE    Conditional Branch. Offset to Ryy
    * b9 _L0xb9   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * ba LHU_3    ANDI_1   0 0 0000000000001111111010x0|        Invert q. Prepare read mask
    * bb SH_2     SH_3     d 6 110101100001011111110100|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  6 0 011000000000110111011000| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     IJ_5     0 3 000000110000010111110010|        Construct Q = 1
    * be IJ_1     IJ_2     1 0 0001000000010111111001x0|        Read until q=mem[(rs1+ofs)&~1u]
    * bf IJT_1    IJT_2    1 0 0001000000010111111001x0|        Exit CSR, enter trap
    * c0 _L0xc0   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * c1 IJT_2    IJT_3    6 0 011000000001010111011000|        Read word is to be masked with ~1u
    * c2 _L0xc2   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * c3 _L0xc3   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * c4 ORI_0    ORI_1    4 0 0100000000011111110010x0| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   0 0 0000000000000001111010x0|        ~302
    * c6 IJT_4    ILL_2    6 0 0110000000110101111011x0|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   6 0 01100000001xxxx1110001x0|        Store pc to mepc.
    * c8 _L0xc8   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * c9 MRET_2   MRET_3   0 0 000000000000110101110000|        0xff+3 = 0x102
    * ca _L0xca   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * cb QINT_2   StdIncPc e 0 111000000110100111011000|        mtval = 0.
    * cc OR_0     OR_1     0 0 0000000000011111x10xxxx0| OR     or
    * cd unxcd             7 6 01110110xxxxxxxxxxxxxxxx| cd: Not in use 
    * ce _LCSRRCI_1 ILLe     0 0 00000000000xxxx1x0xxxxx0| Illegal instruction seen
    * cf MRET_7   MRET_8   0 5 0000010100001101x10xxxx0|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  0 3 000000110000000111110010| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   4 0 010000000000110111011000| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     c 8 1100100000010101111001x1|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 6 0 011000000111010111011000|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   e 3 111000110100010110x10010|        Store 5 to mcause
    * d5 Fetch2u           4 e 010011100111111111110000|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * d6 eILL0c   ILLe     0 0 00000000000xxxx1x0xxxxx0| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  6 0 011000000111010111011000|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  6 0 011000000001110111011000| BLTU   Conditional Branch. Offset to Ryy
    * d9 _L0xd9   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * da LDAF_a   LDAF_2   0 0 0000000000010101x10xxxx0|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   6 3 011000110101100110x10010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  6 0 011000000000110111011000| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  6 0 011000000111010111011000|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   5 c 010111000001011111011000|  Fr11  Read and latch instruction
    * df eFetch   Fetch2   5 c 010111000001011111011000|  Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 _L0xe0   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * e1 ORI_1    ORI_2    0 0 0000000000000001111001x0|        Q = RS1
    * e2 _L0xe2   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * e3 _L0xe3   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * e4 ANDI_0   ANDI_1   0 0 0000000000011111111010x0| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  0 3 000000110001010101110010|        Q = 4
    * e6 StdIncPc Fetch    5 4 010101001101101100110010|  Fr11  IncPC, OpFetch
    * e7 aFault   aFault_1 6 0 011000000111010111011000|  err   Load access fault. Faulting adr to mtval
    * e8 _L0xe8   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * e9 IJT_3    IJT_4    0 3 000000110001100111110010|        Construct Q = 1
    * ea _L0xea   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * eb LH_3     LH_4     0 0 0000000000001111111010x0|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    0 0 0000000000011111x10xxxx0| AND    And 
    * ed unxed             7 6 01110110xxxxxxxxxxxxxxxx| ed: Not in use
    * ee eILL0a   ILLe     0 0 00000000000xxxx1x0xxxxx0| Illegal instruction seen
    * ef WFI_5    Fetch    5 3 010100111101101100110010|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    c 8 1100100000010101111001x1|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 6 0 011000000111010111011000|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 0 0 0000000000000101x10xxxx0|        Prepare read PC
    * f3 aF_SW    aF_SW_1  0 0 00000000000xxxx1x01xxxx0|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   eFetch3  4 f 010011110110001111010000|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 6 0 011000000111010111011000|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    0 3 000000110001100101110010| WFI    Chk offset=0x105. Now 0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 6 0 011000000110000111011000| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  6 0 011000000001110111011000| BGEU   Conditional Branch. Offset to Ryy
    * f9 _L0xf9   ILLe     0 0 00000000000xxxx1x0xxxxx0|  Not in use (illegal as entry)
    * fa WFI_2    WFI_3    0 3 000000110001010111110010|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     0 0 000000000000000111011000|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  6 0 011000000000110111011000| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    0 0 0000000000000101x10xxxx0| NMI    Get current PC
    * fe ILLe     ILL_1    0 0 0000000000000101x0xxxxx0| Illegal
    * ff QINT_0   QINT_1   0 0 0000000000000101x10xxxx0| INT    Get current PC
    */
   localparam u0_0 = 256'hd8e64010d8e6e404f233f05ae08bf05aec09e8072004d0e640e6f0bee5d2f001;
   localparam u0_1 = 256'hb8b772d4dce6b8a62032cce69041d813a47d40e6e416f215e0143276e01ae08b;
   localparam u0_2 = 256'hd8e60000d8e6003ed230f096e021f096f01dc0272004983540e600fec0e6f052;
   localparam u0_3 = 256'h843a8435e503d8492032e53d00fed813c4d7f403e436a4decc9ea486e02bdae6;
   localparam u0_4 = 256'h727400fe00004031a4b1f066f24bf066c48f8447f265e82b00fe00fec40bf050;
   localparam u0_5 = 256'hb8dae570f4fbd8492032e45d00fe00fee08bec57d81ee5ebb8dae554b8dac4e6;
   localparam u0_6 = 256'hf2cf000000004031e47a00fe000000fe9893a4f240efe82b00fe00fec8f700fe;
   localparam u0_7 = 256'h0000c490b0ded8492032a4f200fe00fed8d5d8d5acdeb2ded812e81ad81ee5ba;
   localparam u0_8 = 256'hf2a900fe00004029d2e600fe000000fe0000d09ee5f0e82100fe00fe0000f085;
   localparam u0_9 = 256'ha4f25234000000fee49f103400fed8139893e4bb72949434c49584341292d834;
   localparam u0_A = 256'hf2c5003f0000003fc49a00fe923400fef061b8d0f2af983a00fe00fe72b6f05e;
   localparam u0_B = 256'he4c1e41ff275d849f4b5e81a00fed813c4bd729ad89bf273000032de72b21092;
   localparam u0_C = 256'h404f00fe00004026d8e600fe70a500fec4cbec47e86fc8e100fe00fed8e900fe;
   localparam u0_D = 256'hd8f4d8f4d8e5d8499292409100fed813d8a100fef0009292d81ee506d8c9f237;
   localparam u0_E = 256'h32de00fe00004011e85600fef2c600fed81e32de72b0e81a00fe00fee41d00fe;
   localparam u0_F = 256'h40c70046407ed849d86bf24500fed813d8ab72fad8dbd0b420dd40e6d81ee572;
   localparam u1_0 = 256'h3005001d3005001d0305401c000b401c000b000d000130050005229b1117009a;
   localparam u1_1 = 256'h4041031530050217000130054041601d6001000105010319001f54db001d001f;
   localparam u1_2 = 256'h300576003005001d0301421c001d421c0001401d0001061e000500013005629a;
   localparam u1_3 = 256'h061e061e8815600d000138150001601d65218617361750db40416001001f3705;
   localparam u1_4 = 256'h031500017600001da075999d0301999d607560350315001f000100016015099b;
   localparam u1_5 = 256'h60751117d617600d0001661700010001001100116075c815607511176075ba17;
   localparam u1_6 = 256'h030176007600001d90d90001760000016065707d0501001f00010001650d0001;
   localparam u1_7 = 256'h7600602150db600d00017059000100011c170b0750db53db0005000d6075c815;
   localparam u1_8 = 256'h031500017600001f3305000176000001760040411117001f000100017600009a;
   localparam u1_9 = 256'h703934057600000190b9e0530001601d606566170317e05360376033e345e069;
   localparam u1_A = 256'h0301001d7600001d60350001e353000100010917030d061e000100010315629a;
   localparam u1_B = 256'h101710170305600dd617000f0001601d6015031500014d3f760053db0315e045;
   localparam u1_C = 256'h050d00017600001fe0690001000d0001602160350001401f0001000160150001;
   localparam u1_D = 256'h5c175c176075600d635900150001601d607500014e7fe3456075c815400d0301;
   localparam u1_E = 256'h53db00017600001f000f000103190001607554db0315001f0001000100010001;
   localparam u1_F = 256'h000500050005600d000103150001601d6061031960754f63000100056075c815;
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
   assign d[8] = indir[8];
   assign d[9] = indir[9];
   assign d[11] = indir[10];
   assign d[12] = indir[11];
   assign d[13] = indir[12];
   assign d[16] = indir[13];
   assign d[17] = indir[14];
   assign d[19] = indir[15];
   assign d[20] = indir[16];
   assign d[22] = indir[17];
   assign d[23] = indir[18];
   assign d[24] = indir[19];
   assign d[25] = indir[20];
   assign d[26] = indir[21];
   assign d[27] = indir[22];
   assign d[40] = indir[23];
   // replaces = 1000100100111000000001001001100010000000000
   SB_LUT4 #(.LUT_INIT(16'h2018)) cmb_d10(.O(d[10]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d14(.O(d[14]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1800)) cmb_d15(.O(d[15]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hc000)) cmb_d18(.O(d[18]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hfebf)) cmb_d21(.O(d[21]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h6000)) cmb_d30(.O(d[30]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0204)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1002)) cmb_d35(.O(d[35]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1400)) cmb_d38(.O(d[38]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d42(.O(d[42]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0101011011000110000000000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h6948)) cmb_d28(.O(d[28]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h6070)) cmb_d29(.O(d[29]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0822)) cmb_d33(.O(d[33]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h3100)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4004)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4400)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1207)) cmb_d39(.O(d[39]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[43] = 1'b0;
   assign d[44] = 1'b0;
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   RVC included
 *   MULDIV included
 *   minstret not implemented
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 46 columns
 * Removed:  0000000000000001000000000001000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 0000000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 46
 * 208 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 207 208 207 208 208 208 208 208 208 208 208 208 208 208 208   x 208 208 208 208 207 208 206 207 208 208 208   x 208 208 208 208 207 205 206 208 207 208 207 208 207 208 208 207 206 207  kill col 12  Tbl  43 cols 0000000000000001000000000001000001000000000000 has 205 unique lines.
 * 204 205 204 204 205 205 205 205 205 205 205 205 205 205 205   x 205 205 205 205 203 205 203 202 205 205 205   x 205 205 205 205 203     203 205 204 205 204 205 204 205 205 204 203 204  kill col 22  Tbl  42 cols 0000000000000001000000010001000001000000000000 has 202 unique lines.
 * 201 202 201 201 202 202 202 202 202 202 202 202 202 202 202   x 202 202 202 202 201 201 200     202 202 202   x 202 202 202 202 200     200 202 201 202 201 201 200 202 202 201 200 200  kill col 23  Tbl  41 cols 0000000000000001000000110001000001000000000000 has 200 unique lines.
 * 199 200 199 199 200 200 200 200 200 200 200 200 200 200 200   x 200 200 199 199 198 199         200 200 200   x 200 200 200 200 198     198 200 199 200 199 199 198 200 200 198 198 198  kill col 25  Tbl  40 cols 0000000000000001000010110001000001000000000000 has 198 unique lines.
 * 197 198 197 197 198 198 198 198 198 198 198 198 198 198 198   x 198 198 197 197     197         198 198 198   x 198 198 198 198 196     196 198 197 198 196 197 196 197 198 196 196 196  kill col 13  Tbl  39 cols 0000000000000001000010110001000011000000000000 has 196 unique lines.
 * 195 196 195 195 196 196 196 196 196 196 196 196 196 196 196   x 196 196 195 195     195         196 196 196   x 196 196 196 196         193 196 195 195 194 195 194 194 196 194 194 194  kill col 11  Tbl  38 cols 0000000000000001000010110001000011100000000000 has 193 unique lines.
 * 192 193 192 189 193 193 193 193 193 193 193 193 193 193 193   x 193 193 192 192     192         193 193 193   x 193 193 193 193             193 192 192 191 192 191 190 193 191 191 191  kill col 42  Tbl  37 cols 0001000000000001000010110001000011100000000000 has 189 unique lines.
 * 188 189 188     189 189 189 189 189 189 189 189 189 189 189   x 189 189 188 188     188         189 189 188   x 189 189 189 189             189 188 188 187 188 187 186 189 187 187 187  kill col  4  Tbl  36 cols 0001000000000001000010110001000011100000010000 has 186 unique lines.
 * 185 186 185     186 186 186 186 186 186 186 186 186 186 186   x 186 186 184 185     185         186 186 185   x 186 185 186 186             186 185 185 184 185 184     185 184 184 184  kill col 27  Tbl  35 cols 0001000000000001001010110001000011100000010000 has 184 unique lines.
 * 183 184 183     184 184 184 184 184 184 184 184 184 184 184   x 184 184     183     183         184 184 183   x 184 183 184 184             184 183 183 182 183 182     183 182 182 182  kill col  7  Tbl  34 cols 0001000000000001001010110001000011100010010000 has 182 unique lines.
 * 181 182 181     182 182 182 182 182 182 182 182 182 182 182   x 182 181     181     180         182 182 181   x 181 180 182 182             180 181 181     181 175     179 177 179 178  kill col  5  Tbl  33 cols 0001000000000001001010110001000011100010110000 has 175 unique lines.
 * 174 175 174     175 175 175 175 175 175 175 175 174 175 175   x 175 174     172     170         175 175 174   x 173 173 175 175             174 174 174     170         165 166 170 167  kill col  3  Tbl  32 cols 0001000000000001001010110001000011100010111000 has 165 unique lines.
 * 164 165 164     165 165 165 165 165 165 165 165 164 165 165   x 165 164     161     158         165 165 163   x 162 163 165 164             164 164 164     157             153 154 154  kill col  2  Tbl  31 cols 0001000000000001001010110001000011100010111100 has 153 unique lines.
 * 152 153 151     153 153 153 153 153 153 153 153 151 153 153   x 152 149     148     144         153 153 149   x 148 148 153 149             152 152 151     140                 134 142  kill col  1  Tbl  30 cols 0001000000000001001010110001000011100010111110 has 134 unique lines.
 * 133 134 131     133 134 134 134 134 134 134 130 132 134 134   x 132 130     130     122         132 134 129   x 128 129 134 129             133 133 131     115                     120  kill col  6  Tbl  29 cols 0001000000000001001010110001000011100011111110 has 115 unique lines.
 * 114 115 110     114 115 115 115 115 115 115 112 114 114 113   x 113 111     111     101         111 115 109   x 109 108 113 109             114 114 111                              99  kill col  0  Tbl  28 cols 0001000000000001001010110001000011100011111111 has  99 unique lines.
 *  98  98  92      98  99  99  99  99  99  99  95  98  98  97   x  96  96      95      88          93  99  94   x  93  92  97  93              98  98  94                                  kill col 24  Tbl  27 cols 0001000000000001001011110001000011100011111111 has  88 unique lines.
 *  87  86  82      87  88  87  88  87  88  88  84  87  87  86   x  84  85      83                  82  88  83   x  82  79  86  84              87  86  82                                  kill col 16  Tbl  26 cols 0001000000000001001011110001010011100011111111 has  79 unique lines.
 *  78  77  73      78  79  78  79  78  79  79  75  78  78  77   x  75  76      73                  72  78  72   x  74      77  75              78  77  73                                  kill col 21  Tbl  25 cols 0001000000000001001011111001010011100011111111 has  72 unique lines.
 *  71  70  66      71  72  71  72  71  72  72  68  71  71  70   x  69  69      66                      70  65   x  67      70  68              71  70  67                                  kill col 19  Tbl  24 cols 0001000000000001001011111011010011100011111111 has  65 unique lines.
 *  63  63  58      64  65  63  65  64  65  65  61  64  64  63   x  62  62      59                      62       x  60      63  62              64  63  61                                  kill col 43  Tbl  23 cols 0011000000000001001011111011010011100011111111 has  58 unique lines.
 *  56  55          57  58  56  58  57  58  58  54  57  57  56   x  55  55      52                      55       x  53      56  55              56  56  55                                  kill col 26  Tbl  22 cols 0011000000000001001111111011010011100011111111 has  52 unique lines.
 *  50  49          51  52  50  52  51  52  52  48  51  51  50   x  49  50                              49       x  47      50  50              50  50  49                                  kill col 17  Tbl  21 cols 0011000000000001001111111011110011100011111111 has  47 unique lines.
 *  45  45          46  45  45  47  46  47  47  43  46  46  45   x  42  44                              44       x          45  45              45  45  44                                  kill col 29  Tbl  20 cols 0011000000000001101111111011110011100011111111 has  42 unique lines.
 *  40  40          41  40  37  42  41  42  42  39  41  41  40   x      40                              40       x          40  40              40  40  39                                  kill col 39  Tbl  19 cols 0011001000000001101111111011110011100011111111 has  37 unique lines.
 *  35  35          36  34      37  36  37  37  34  36  36  35   x      32                              35       x          36  35              35  35  34                                  kill col 28  Tbl  18 cols 0011001000000001111111111011110011100011111111 has  32 unique lines.
 *  30  30          31  28      31  31  31  32  30  31  31  29   x                                      30       x          31  31              30  30  30                                  kill col 40  Tbl  17 cols 0011011000000001111111111011110011100011111111 has  28 unique lines.
 *  26  26          26          27  27  26  28  26  25  27  26   x                                      26       x          27  27              26  26  26                                  kill col 33  Tbl  16 cols 0011011000001001111111111011110011100011111111 has  25 unique lines.
 *  24  23          23          24  24  23  24  23      24  23   x                                      23       x          24  24              23  23  23                                  kill col 44  Tbl  15 cols 0111011000001001111111111011110011100011111111 has  23 unique lines.
 *  22              21          22  22  21  22  21      22  21   x                                      21       x          22  22              21  21  21                                  kill col 41  Tbl  14 cols 0111111000001001111111111011110011100011111111 has  21 unique lines.
 *  20                          20  20  19  20  19      20  19   x                                      19       x          20  20              19  19  19                                  kill col 36  Tbl  13 cols 0111111001001001111111111011110011100011111111 has  19 unique lines.
 *  18                          18  17      18  17      18  17   x                                      17       x          18  18              17  17  17                                  kill col 37  Tbl  12 cols 0111111011001001111111111011110011100011111111 has  17 unique lines.
 *  16                          16          16  15      16  15   x                                      15       x          16  16              15  15  15                                  kill col 34  Tbl  11 cols 0111111011011001111111111011110011100011111111 has  15 unique lines.
Possible good candidates for removal, columns : 8 9 10 20 31 
 *
 * Round 1: 1000000100100110000000000100001100011100000000  4 columns for indexes to table representing 11 original columns (uses 15 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 39
 * 205 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x 205 202 205 205 205 205   x 205 205   x 205 205   x   x   x 205 205 205 205 204 205 203 204 205   x 203   x 205 205   x   x 204 202 203   x   x   x 204 205 204 205 205 204 203 204  kill col 43  Tbl  32 cols 1010000100100111000000000101001100011100000000 has 202 unique lines.
 *   x 202     202 202 202 202   x 202 202   x 202 202   x   x   x 202 202 202 202 201 202 200 201 202   x 199   x 202 202   x   x 201 199 200   x   x   x 201 202 201 202 202 201 200 201  kill col 19  Tbl  31 cols 1010000100100111000000000111001100011100000000 has 199 unique lines.
 *   x 199     199 199 199 199   x 199 199   x 199 199   x   x   x 199 199 199 199 198 199 197 198 199   x       x 199 199   x   x 198 196 197   x   x   x 198 199 198 199 199 198 197 198  kill col 12  Tbl  30 cols 1010000100100111000000000111001101011100000000 has 196 unique lines.
 *   x 196     195 196 196 196   x 196 196   x 196 196   x   x   x 196 196 196 196 194 196 194 193 196   x       x 196 196   x   x 194     194   x   x   x 195 196 195 196 196 195 194 195  kill col 22  Tbl  29 cols 1010000100100111000000010111001101011100000000 has 193 unique lines.
 *   x 193     192 193 193 193   x 193 193   x 193 193   x   x   x 193 193 193 193 192 192 191     193   x       x 193 193   x   x 190     191   x   x   x 192 192 191 193 193 192 191 191  kill col 13  Tbl  28 cols 1010000100100111000000010111001111011100000000 has 190 unique lines.
 *   x 190     189 190 190 190   x 190 190   x 190 190   x   x   x 190 190 190 190 189 189 188     190   x       x 190 190   x   x         187   x   x   x 189 189 188 189 190 189 188 188  kill col 11  Tbl  27 cols 1010000100100111000000010111001111111100000000 has 187 unique lines.
 *   x 187     182 187 187 187   x 187 187   x 187 187   x   x   x 187 187 187 187 186 186 185     187   x       x 187 185   x   x               x   x   x 186 185 185 185 187 186 184 185  kill col 42  Tbl  26 cols 1011000100100111000000010111001111111100000000 has 182 unique lines.
 *   x 182         182 182 182   x 182 182   x 182 182   x   x   x 182 182 182 182 181 181 180     182   x       x 182 180   x   x               x   x   x 181 180 178 180 182 180 179 179  kill col  5  Tbl  25 cols 1011000100100111000000010111001111111100100000 has 178 unique lines.
 *   x 178         178 178 178   x 178 178   x 178 177   x   x   x 178 178 178 178 177 176 174     178   x       x 178 174   x   x               x   x   x 170 176     175 177 173 172 173  kill col  7  Tbl  24 cols 1011000100100111000000010111001111111110100000 has 170 unique lines.
 *   x 170         170 170 170   x 170 170   x 170 169   x   x   x 170 169 170 170 169 165 167     170   x       x 169 165   x   x               x   x   x     168     166 166 162 162 165  kill col  2  Tbl  23 cols 1011000100100111000000010111001111111110100100 has 162 unique lines.
 *   x 162         162 162 162   x 162 162   x 162 160   x   x   x 162 161 161 162 159 157 157     160   x       x 158 157   x   x               x   x   x     157     158 156     155 156  kill col  1  Tbl  22 cols 1011000100100111000000010111001111111110100110 has 155 unique lines.
 *   x 153         155 155 155   x 155 155   x 154 152   x   x   x 154 154 154 155 152 149 148     152   x       x 151 145   x   x               x   x   x     143     145 142         145  kill col  3  Tbl  21 cols 1011000100100111000000010111001111111110101110 has 142 unique lines.
 *   x 139         142 141 142   x 142 142   x 140 139   x   x   x 141 141 141 141 136 133 134     137   x       x 136 131   x   x               x   x   x     122     126             123  kill col  6  Tbl  20 cols 1011000100100111000000010111001111111111101110 has 122 unique lines.
 *   x 118         122 121 122   x 122 121   x 120 118   x   x   x 121 120 119 121 112 112 113     117   x       x 114 110   x   x               x   x   x              98              99  kill col  4  Tbl  19 cols 1011000100100111000000010111001111111111111110 has  98 unique lines.
 *   x  95          98  96  98   x  98  97   x  95  95   x   x   x  96  95  95  95  88  88  90      92   x       x  89  85   x   x               x   x   x                              75  kill col  0  Tbl  18 cols 1011000100100111000000010111001111111111111111 has  75 unique lines.
 *   x  72          75  74  75   x  75  74   x  72  73   x   x   x  73  73  73  73  67  67  68      70   x       x  67  65   x   x               x   x   x                                  kill col 16  Tbl  17 cols 1011000100100111000000010111011111111111111111 has  65 unique lines.
 *   x  61          65  64  65   x  65  64   x  62  64   x   x   x  63  63  62  63  57  56  59      59   x       x  55       x   x               x   x   x                                  kill col 17  Tbl  16 cols 1011000100100111000000010111111111111111111111 has  55 unique lines.
 *   x  51          55  54  55   x  55  54   x  52  54   x   x   x  52  53  53  53  47  46  48      50   x       x           x   x               x   x   x                                  kill col 24  Tbl  15 cols 1011000100100111000001010111111111111111111111 has  46 unique lines.
 *   x  43          46  45  46   x  45  45   x  43  44   x   x   x  42  43  44  44  40      40      43   x       x           x   x               x   x   x                                  kill col 25  Tbl  14 cols 1011000100100111000011010111111111111111111111 has  40 unique lines.
 *   x  37          40  38  40   x  39  39   x  37  37   x   x   x  35  37  37  36          34      36   x       x           x   x               x   x   x                                  kill col 23  Tbl  13 cols 1011000100100111000011110111111111111111111111 has  34 unique lines.
 *   x  32          33  32  33   x  33  33   x  31  31   x   x   x  29  30  29  28                  30   x       x           x   x               x   x   x                                  kill col 26  Tbl  12 cols 1011000100100111000111110111111111111111111111 has  28 unique lines.
 *   x  26          27  26  26   x  27  27   x  25  25   x   x   x  23  24  24                      23   x       x           x   x               x   x   x                                  kill col 29  Tbl  11 cols 1011000100100111100111110111111111111111111111 has  23 unique lines.
 *   x  21          22  21  20   x  22  22   x  21  20   x   x   x      19  20                      19   x       x           x   x               x   x   x                                  kill col 28  Tbl  10 cols 1011000100100111110111110111111111111111111111 has  19 unique lines.
 *   x  17          18  17  14   x  18  17   x  17  17   x   x   x          17                      16   x       x           x   x               x   x   x                                  kill col 39  Tbl   9 cols 1011001100100111110111110111111111111111111111 has  14 unique lines.
Possible good candidates for removal, columns : 21 
 *
 * Round 2: 0100110011011000001000001000000000000000000000  4 columns for indexes to table representing  9 original columns (uses 14 of 16 lines in indirect table).
 * Direct:  0011001000000000110111110010110011100011111111 24 columns
 * Success. Use 2 EBRs, 20 LUTs.
 */

module v12_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    *                      indirect_index 1
    * inx         next     | indirect index 0
    * || ucode    ucode    | | direct representation
    * 00 LB_0     LB_1     0 0 000000000110001101111100| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 000100010010001011111001|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 001000100110001101111100| IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0
    * 03 _L0x03   StdIncPc 3 3 001100110010000010x10xxx| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 3 3 001100110100100010110100| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   3 3 001100110010000000x01xxx| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 06 LB_3     LB_4     3 3 001100110010000110111010|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     3 3 001100110010000101111011|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     3 0 001100000101001110111100| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     3 3 001100110010000101111000|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     3 0 001100000101001110111100| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JALR_3   3 4 001101000110000010111100|        Q=1. Prep legalize target
    * 0c ADD_0    ADDI_0   3 3 001100110010001110111001| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    3 3 001100111010001110x10xxx| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    3 3 001100110010001110x10xxx| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 3 3 001100110000100010110110| LUI    q = imm20
    * 10 SUB_1    LB_6     3 3 001100110010001111111000|        Q = ~RS2
    * 11 AND_1    ANDI_1   3 3 001100110010001110111000|        RS1^0xffffffff to Q
    * 12 straddle Fetchu   4 5 010001011101001101001100|  Fr10u IncPC, OpFetch
    * 13 condb_2  condb_3  3 3 001100110010001111111000|        ~RS2 in Q
    * 14 condb_3  condb_4  3 4 001101000110001100111100|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  3 6 001101100010000000111001|        Branch on condition
    * 16 condb_5  StdIncPc 3 3 001100110010000000x10xxx|        Branch not taken.
    * 17 condb_5t condb_6t 3 3 001100110001100000101001|        Branch taken. yy=oldPC incase of access error
    * 18 BEQ      condb_2  3 3 001100110001101110110110| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   5 3 01010011010100000010x100| JALR   (tmp) Prep pc=RS1+imm (target)
    * 1a ANDI_1   StdIncPc 3 3 001100110000100010110011|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    3 3 001100110010000000x01xxx| JAL. J-imm is in q. Prep get isntradr from jj
    * 1c ECAL_BRK ECAL_RET 3 2 001100100010001011101110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 3 3 001100110000100010110111|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 3 4 001101001110001010011100|        Q = 4
    * 1f IJ_2     IJ_3     5 3 010100110001000000101110|        Read word is to be masked with lsb = 0
    * 20 LH_0     LH_1     0 7 000001110101101101111100| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 3 3 001100110000100010110000|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  3 8 001110000010001010111100|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 _L0x23   StdIncPc 3 3 001100110010000010x10xxx| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   6 0 01100000001000111110x110| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   3 3 001100110010000000x01xxx| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 26 OR_1     OR_2     3 3 001100110001001110110000|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    3 3 001100110110000000111100|        Q = rs2
    * 28 _L0x28   SH_1     3 7 001101110101001110111100| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   3 3 001100110010001110111000|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     3 7 001101110101001110111100| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  3 4 00110100011000xxxx110100|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    3 3 001100110010001110x0xxxx| SLL    Shift left
    * 2d MULH_0   MULH_1   6 3 011000110010001010111001| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e MULHU_1  MULHU_2  3 3 001100111001001111110110|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 2f _L0x2f   StdIncPc 3 3 001100110000100010110110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 3 9 001110010000100010110110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  3 3 001100110010001111111000|        ~rs2 to Q
    * 32 JAL_1    JAL_2    3 3 001100110001100000101001|      Prep Instradr to yy. Refetch instradr
    * 33 JALR_3   JAL_25   5 3 010100110001000000110011|        Q = (RS1+imn) & 0xfffffffe
    * 34 JAL_3    Fetch    4 3 010000110001001101101001|      Prep fetch next instr.
    * 35 SLLI_1   SLLI_2   6 3 011000110000101011111001|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   7 3 011100110000101011111101|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  3 6 00110110000111xxxx110001|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  3 3 001100110001101110110110| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 3 3 001100111000100010110001|        Last shift.
    * 3a SRxI_1   SRxI_2   6 8 011010000000101010111001|        Register to shift to Q
    * 3b _L0x3b   JAL_1    3 3 001100110010000000x01xxx| JAL. J-imm is in q. Prep get isntradr from jj
    * 3c CSRRW_0  CSRRW_1  3 3 001100110001100110110110| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   7 8 011110000000101010111001|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   6 0 01100000001000111110x001|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   6 0 01100000001000111110x001|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 a 000010100110001101111100| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   3 3 001100110001101010110001|        yy=jj. Prep get Q=1
    * 42 MULHU_2  MULHU_3  6 8 011010000010001010111100|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  3 3 001100110010000000101000|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  3 3 001100110010001111111010| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    3 4 001101000110001010111100|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    3 3 00110011000111101010x001|        Store PC to mepc
    * 47 ILL_2    ILL_3    5 3 010100110001111010110001|        Store 0 to mtval
    * 48 _L0x48   SW_1     8 a 100010100110001110111100| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  3 4 001101000110000000111100|        Construct PC storage adr
    * 4a _L0x4a   SW_1     8 a 100010100110001110111100| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  9 3 100100110000011010101001|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   3 3 001100110010001110x10xxx| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  6 3 011000110001101110110001| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     3 3 00110011001000xxxxx0xxxx| Illegal instruction seen
    * 4f MRET_8   MRET_9   3 4 001101001110001010011100|        +4, so now 0x103
    * 50 LW_1     StdIncPc 1 b 000110110000101011110001|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   5 3 010100110001111010101110|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 000100010010001011111001|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   5 3 010100110001111010101110|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     7 8 011110000010001010111001|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 5 3 010100110001111010110110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     3 3 001100110010001000111011|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     3 3 001100110010001000111000|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    3 8 001110001110001011111001|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   3 3 001100110001101111110110|        REM = Q to yy
    * 5a SB_1     SB_2     6 3 011000110001101011111001|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    3 3 001100110010000000x01xxx| JAL. J-imm is in q. Prep get isntradr from jj
    * 5c CSRRS_0  CSRRW_1  3 3 001100110001100110110110| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     7 3 011100110001101011111101|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 000100010010001011111001|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   5 3 010100110001111010101110|  err   LD AlignFault. Faulting adr to mtval
    * 60 MULHU_3  MULHU_2  3 3 001100111010001111111001|        Shift Q and rM. Prepare read rs1
    * 61 EBRKWFI2 EBREAK_1 3 6 001101100001100110110010| EBREAK/WFI2 Select EBREAK or WFI.
    * 62 DIV_8    DIV_7    6 4 011001000110001011111100|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    a 4 101001000110001011111100|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  3 3 001100110010001111111010| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    3 6 001101100010000000x10xxx|        Prepare read PC.
    * 66 SW_1     SW_2     5 3 010100110000011110101001|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    5 3 01010011000111001010x110|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 3 3 001100110000100010110001|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     3 3 001100110010001010111000|        RS2 > 0, RS1 < 0, change sign yy
    * 6a MULH_1   MULH_2   3 3 001100110001101010110000|        Store ~rs1 to Ryy. Prep construct 1.
    * 6b SB_4     SB_5     b 3 101100110010001100111001|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   3 3 001100110010001110x10xxx| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  6 3 011000110001101110110001| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e DIV_C    DIV_e    3 3 001100110001101110101001|        rM to yy. Q=ffffffff
    * 6f MRET_6   MRET_7   3 4 00110100011000xxxx111100|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    7 8 011110000010001010111001|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 5 3 010100110001111010110110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   3 3 001100110010000110111010|        Invert q. Prepare read mask
    * 73 unx73             6 0 0110000000xxxxxxxxxxxxxx| 73: Not in use 
    * 74 MRET_9   Fetch    4 4 010001000101001101101100|        +1, IncPC, OpFetch next
    * 75 IJ_5     Fetch    4 3 010000110001001101101011|        Mask and use as PC
    * 76 Fetchu   Fetch2   3 c 001111000010000011110110|  Fr00u Read and latch instruction
    * 77 eFetchu  Fetch2   1 d 000111010010001011110110|  Fr00u rep Read until d=mem[(rs1+ofs) & ~3u]
    * 78 DIV_4    DIV_6    3 3 001100110001100000110110|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    3 4 001101001110001010111100|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     5 3 010100110000001100101001|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    3 3 001100110010000000x01xxx| JAL. J-imm is in q. Prep get isntradr from jj
    * 7c CSRRC_0  CSRRW_1  3 3 001100110001100110110110| CSRRC  Decoded CSR adr in yy
    * 7d condb_6t Fetch    4 3 010000110101001101101100|        Branch taken.
    * 7e NMI_1    NMI_2    3 3 00110011000111xxxx110001|        Store pc to mepc.
    * 7f unx7f             6 0 0110000000xxxxxxxxxxxxxx| 7f: Not in use 
    * 80 LBU_0    LBU_1    0 0 000000000110001101111100| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 unx81             6 0 0110000000xxxxxxxxxxxxxx| 81: Not in use 
    * 82 DIV_1    DIV_3    3 3 001100110001001110110000|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    3 3 001100110110001010111100|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   3 3 001100110010001111111010| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 000100010010001011111001|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   5 3 010100110101000000110100|      Prep pc = jj + ofs
    * 87 unx87             6 0 0110000000xxxxxxxxxxxxxx| 87: Not in use 
    * 88 DIV_E    DIV_10   a 3 101000111010001111x0xxxx|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 3 3 001100110000100010110110|        RS2 == 0, return 0xffffffff
    * 8a DIVU_5   ANDI_1   3 8 001110001110001011x10xxx|        Transfer rM to rDee
    * 8b LB_6     StdIncPc 3 4 001101001100100010110100|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    3 3 001100110010001111x10xxx| XOR    xor
    * 8d DIV_0    DIV_1    c 3 110000111010001011111001| DIV    Branch on sign dividend RS1
    * 8e _LCSRRS_1 ILLe     3 3 00110011001000xxxxx0xxxx| Illegal instruction seen
    * 8f ILL_3    ILL_4    3 4 001101000010001010111100|        Q = 1
    * 90 NMI_2    JAL_3    d 3 110100110001110100110110|        mtval = 0.
    * 91 LDAF_2   LDAF_3   d 4 11010100110110001000x100|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    3 3 00110011000111100110x001|        PC to mepc
    * 93 SW_E2    SW_E3    3 3 001100110001111011110001|        Store address that faulted
    * 94 SW_E4    JAL_3    d 3 11010011000110100110x101|        Store 6 to mcause
    * 95 SW_E3    SW_E4    3 4 001101001110001011011100|        Q = 3
    * 96 SH_1     SH_2     6 3 011000110001101011111001|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    5 3 01010011000111001010x110|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  3 3 001100110001101110110110| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     3 3 00110011001000xxxxx0xxxx|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    d 3 11010011010110100100x100|        mcause = 11
    * 9b SH_4     SH_5     8 3 100000110010011100111001|        Address back to Q. Prepare get item to write
    * 9c DIV_10   DIV_12   a 3 101000111010001100110001|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   a 3 101000111010001100110001|        RS2 < 0. Branch on sign of RS1
    * 9e JAL_25   JAL_3    3 5 001101011100100010010100|      Prep WTRG = jj+2/4 (return adr)
    * 9f SH_5     SW_2     3 3 001100110000011100101001|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    0 7 000001110101101101111100| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  3 4 001101001110001010011100|        Q = 4
    * a2 DIV_14   LB_6     3 3 001100110010001010111000|        RS2 < 0, RS1 >= 0, change sign yy
    * a3 DIV_15   StdIncPc 3 3 001100110000100010110001|        RS2 < 0, RS1 < 0, yy is true result
    * a4 SRxI_0   SRxI_1   6 0 01100000001000111110x110| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   3 4 001101000110000110111100|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  3 a 001110100010001011101110| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 3 3 00110011011000xxxx111100| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    a 3 101000111010001010111000|        Branch on sign divisor RS2
    * a9 ILL_4    JAL_3    d 4 11010100010110100110x100|        Store 2 to mcause
    * aa DIV_6    DIV_7    3 3 001100111010001011x10xxx|        Write M. Prepare shift
    * ab EBREAK_2 ECALL_6  3 3 001100110001111010110001|        pc to mepc
    * ac _L0xac   SRx_1    3 3 001100110010001110x0xxxx| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   6 3 011000111010001110x10xxx| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _L0xae   SRx_1    3 3 001100110010001110x0xxxx| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   3 4 00110100011000xxxx111100|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   d 3 11010011010110001000x100|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  3 4 001101001110001010011100|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    4 4 010001001101001101001100|        IncPC, OpFetch, but force +4
    * b3 unxb3             6 0 0110000000xxxxxxxxxxxxxx| b3: Not in use 
    * b4 ic0reser          6 0 0110000000xxxxxxxxxxxxxx|  Fr00  Not really used, reserved to allow LASTINCH
    * b5 SH_3     SH_4     3 3 001100110010000000110110|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  3 4 001101001110001010011100|        Q = 8
    * b7 IJ_3     IJ_4     3 3 001100110001101010110001|        Store present PC in case of access error
    * b8 BGE      condb_2  3 3 001100110001101110110110| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    3 4 001101000010001100111000|        Calc carry of RS2+0xFFFFFFFF
    * ba LHU_3    ANDI_1   3 3 001100110010000111111010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     7 3 011100110001101011111101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  3 3 001100110001100110110110| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     IJ_5     3 4 001101000110000010111100|        Construct Q = 1
    * be IJ_1     IJ_2     1 3 000100110010001011111001|        Read until q=mem[(rs1+ofs)&~1u]
    * bf IJT_1    IJT_2    1 3 000100110010001011111001|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    3 6 001101100010001110111001|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    3 3 001100110001101010110110|        Read word is to be masked with ~1u
    * c2 DIVU_3   DIVU_2   6 4 011001000110001011111100|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   a 4 101001000110001011111100|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    3 3 001100110001001111110010| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   3 3 001100110010000000111010|        ~302
    * c6 IJT_4    ILL_2    3 3 001100110001111010111011|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   3 3 00110011000111xxxx110001|        Store pc to mepc.
    * c8 DIV_7    DIV_8    3 e 001111101010001100111101|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   3 3 001100110110000110011100|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   3 e 001111101010001100111101|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc d 3 110100110001110100110110|        mtval = 0.
    * cc OR_0     OR_1     3 3 001100110010001111x10xxx| OR     or
    * cd REM_0    DIV_1    c 3 110000111010001011111001| REM    Branch on sign dividend RS1
    * ce _LCSRRCI_1 ILLe     3 3 00110011001000xxxxx0xxxx| Illegal instruction seen
    * cf MRET_7   MRET_8   3 6 001101100010000110x10xxx|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  3 4 001101000110000000111100| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   3 3 001100110001000110110110| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     7 8 011110000010001010111001|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 5 3 010100110001111010110110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   d 4 11010100010110001010x100|        Store 5 to mcause
    * d5 unalignd straddle 3 3 001100110010000010110110|  Fr00u Unaligned pc, prep read high hword
    * d6 eILL0c   ILLe     3 3 00110011001000xxxxx0xxxx| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  5 3 010100110001111010110110|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  3 3 001100110001101110110110| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  3 3 001100111010001111x10xxx|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   3 3 001100110010001010x10xxx|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   5 4 01010100010110110010x100|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  3 3 001100110001100110110110| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  5 3 010100110001111010110110|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   3 c 001111000001000011110110|  Fr00  Read and latch instruction
    * df eFetch   Fetch2   1 d 000111010001001011110110|  Fr00  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   3 3 001100110001101011110000|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    3 3 001100110010000000111001|        Q = RS1
    * e2 MUL_1    MUL_2    6 8 011010000010001010111100|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   3 8 001110001110001011x10xxx|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   3 3 001100110010001111111010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  3 4 001101001110001010011100|        Q = 4
    * e6 StdIncPc Fetch    4 5 010001011101001101001100|  Fr00  IncPC, OpFetch
    * e7 aFault   aFault_1 5 3 010100110001111010110110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    3 3 001100111010001110111001|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    3 4 001101000110001100111100|        Construct Q = 1
    * ea MULHU_5  MULHU_6  3 3 001100110010001100111100|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     3 3 001100110010000111111010|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    3 3 001100110010001111x10xxx| AND    And 
    * ed REMU_0   DIVU_1   6 3 011000111010001110x10xxx| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     3 3 00110011001000xxxxx0xxxx| Illegal instruction seen
    * ef WFI_5    Fetch    4 4 010001001101001101001100|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    7 8 011110000010001010111001|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 5 3 010100110001111010110110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 3 001100110010000010x10xxx|        Prepare read PC
    * f3 aF_SW    aF_SW_1  3 3 00110011001000xxxxx01xxx|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   unalignd 5 3 010100110101011111111100|  Fr00  Upd ttime, I. Q=imm Use dinx unless unaligned 
    * f5 jFault   jFault_1 5 3 010100110001111010110110|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    3 4 001101001110001100011100| WFI    Chk offset=0x105. Now 0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 5 3 010100110001110000110110| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  3 3 001100110001101110110110| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   3 4 001101000101001110110100|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    3 4 001101000110001010111100|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     3 3 001100110010000000110110|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  3 3 001100110001100110110110| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    3 3 001100110010000010x10xxx| NMI    Get current PC
    * fe ILLe     ILL_1    3 3 001100110010000010x0xxxx| Illegal
    * ff QINT_0   QINT_1   3 3 001100110010000010x10xxx| INT    Get current PC
    */
   localparam u0_0 = 256'hb6e6901090e2b904bc33bc5a788bbc5a7b09ba070804b4e690e67cbef9d27c01;
   localparam u0_1 = 256'h2eb79cd4b7e6eea60832b3e62441b613297d10e639163c15f8144c76b81af88b;
   localparam u0_2 = 256'hb6e6f642b96a803e3430bc96b821bc963c1db0270804e63590e6bc39b0e67c52;
   localparam u0_3 = 256'he13ae135b903b6490832b93db1e6b61331d7fd03f93669de339e2986f82bb6e6;
   localparam u0_4 = 256'h9c7400feb12e9031a9b1bc663c4bbc66b18fa147bc65fa2b28eabc60b10b7c50;
   localparam u0_5 = 256'haedaf970fdfbb6490832f95df69cf96e388b3b57b61eb9ebaedaf954aedaf1e6;
   localparam u0_6 = 256'h3ccfa9b9b12e9031397ab0f9b88bb1e6a693a9f210effa2bfc58fcc8b2f7f942;
   localparam u0_7 = 256'h000031906cdeb649083229f2bca836aaf6f4f6f46bde6cde0000ba1ab61eb9ba;
   localparam u0_8 = 256'hbca900fef982d029b4e6d01ab6e6c09c0000349ef9f0fa21bc82b0a800007c85;
   localparam u0_9 = 256'h29f2943431a23168399f443400feb613a693f9bbdc946534f195613484923634;
   localparam u0_A = 256'h3cc5803f90e0803fb19ad0c86434b8783c61eed0bcafe63ab1e6b88b9cb67c5e;
   localparam u0_B = 256'hf9c1f91fbc75b649fdb5fa1a38c0b613b1bd9c9a369b000000004cde9cb28492;
   localparam u0_C = 256'h904f00fef982d02636e63dc29ca53d6231cbbb473a6ff2e1fc8afccab6e9b988;
   localparam u0_D = 256'hf6f4f6f4b6e5b64924929091d042b613b6a100feb612a492b61eb906b6c93c37;
   localparam u0_E = 256'h4cde00fe90e0d011fa563c223cc6b9e2b61e4cde9cb0fa1ad01abce8391df0ca;
   localparam u0_F = 256'h90c78046907eb649366bbc45b4d9b61336ab1cfab6dbfcd508dd90e6b61eb972;
   localparam u1_0 = 256'h3308332333a33323346030533321305333213321332033483320226311220063;
   localparam u1_1 = 256'h531034e233083222332033085350331b3318332036203463332345d333233323;
   localparam u1_2 = 256'h330833936322332334603753332337533360331333206023332038223308075b;
   localparam u1_3 = 256'h60236023780a33193320680a3388331b361c730a630a43135310331833233908;
   localparam u1_4 = 256'h34e23320631b332393068a6334608a63531e331e3462332333206822331a0a63;
   localparam u1_5 = 256'h531e1122731a33193320631a331b38e233223322531e7822531e1122531e1b0a;
   localparam u1_6 = 256'h3460331b631b3323b323331a33223308531c530736203323a4626462361933a3;
   localparam u1_7 = 256'h6000331c435333193320530334e233181d223c204313445360003321531e7822;
   localparam u1_8 = 256'h34223320c3a2332334c838e23308a3a360005350112233233362331360000063;
   localparam u1_9 = 256'h330735c8a3a3a3a38327d35a3320331b531c631a34e2d31a331e331ed4d8d31d;
   localparam u1_A = 256'h3460332363a33323331e33a2d45aa3a233603a22346160233308332234e2075b;
   localparam u1_B = 256'h1322132234603319731a33213423331b331a34e233206000600044d334e2d358;
   localparam u1_C = 256'h36213320c3a23323d31d3ea333613ea3331c331e33203313a4626462331a3623;
   localparam u1_D = 256'h1d123c10531e3319545b332233a3331b531e33203320d458531e782233113460;
   localparam u1_E = 256'h44d3332063a3332333213323346333a3531e45d334e2332338e268223320331a;
   localparam u1_F = 256'h3320332033203319332034623453331b531c34e3531e535733203320531e7822;
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
   assign d[22] = indir[14];
   assign d[23] = indir[15];
   assign d[24] = indir[16];
   assign d[25] = indir[17];
   assign d[26] = indir[18];
   assign d[28] = indir[19];
   assign d[29] = indir[20];
   assign d[39] = indir[21];
   assign d[42] = indir[22];
   assign d[43] = indir[23];
   // replaces = 1000000100100110000000000100001100011100000000
   SB_LUT4 #(.LUT_INIT(16'h0102)) cmb_d08(.O(d[8]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0230)) cmb_d09(.O(d[9]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h4030)) cmb_d10(.O(d[10]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0040)) cmb_d14(.O(d[14]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h3000)) cmb_d15(.O(d[15]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h7f7e)) cmb_d20(.O(d[20]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0484)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0400)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2002)) cmb_d35(.O(d[35]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2800)) cmb_d38(.O(d[38]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d45(.O(d[45]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0100110011011000001000001000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h2f3f)) cmb_d21(.O(d[21]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2a30)) cmb_d27(.O(d[27]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0012)) cmb_d33(.O(d[33]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0080)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2004)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2200)) cmb_d37(.O(d[37]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0915)) cmb_d40(.O(d[40]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0900)) cmb_d41(.O(d[41]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1400)) cmb_d44(.O(d[44]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
wire instr0100,instr1x110100;        bn_l4v #(.I(16'h0010)) leq0100(     .o(instr0100),     .i({minx[3:0]}));bn_l4v #(.I(16'h8000)) leq1x110100( .o(instr1x110100), .i({minx[7],minx[5:4],instr0100}));SB_DFFE reg_d18( .Q(d[18]), .C(clk), .E(progress_ucode), .D(instr1x110100));assign d[30] = d[18];
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   RVC included
 *   MULDIV included
 *   minstret for instructions in SRAM
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 46 columns
 * Removed:  0000000000000000000000000000000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 0000000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 46
 * 210 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 209 210 209 210 210 210 210 210 210 210 210 210 210 210 210 210 210 210 210 210 209 210 208 209 210 210 210 210 210 210 210 210 209 207 208 210 209 210 209 210 209 210 210 209 208 209  kill col 12  Tbl  45 cols 0000000000000000000000000000000001000000000000 has 207 unique lines.
 * 206 207 206 206 207 207 207 207 207 207 207 207 207 207 207 207 207 207 207 207 205 207 205 204 207 207 207 207 207 207 207 207 205     205 207 206 207 206 207 206 207 207 206 205 206  kill col 22  Tbl  44 cols 0000000000000000000000010000000001000000000000 has 204 unique lines.
 * 203 204 203 203 204 204 204 204 204 204 204 204 204 204 204 204 204 204 204 204 203 203 202     204 204 204 204 204 204 204 204 202     202 204 203 204 203 203 202 204 204 203 202 202  kill col 23  Tbl  43 cols 0000000000000000000000110000000001000000000000 has 202 unique lines.
 * 201 202 201 201 202 202 202 202 202 202 202 202 202 202 202 202 202 202 201 201 200 201         202 202 202 202 202 202 202 202 200     200 202 201 202 201 201 200 202 202 200 200 200  kill col 25  Tbl  42 cols 0000000000000000000010110000000001000000000000 has 200 unique lines.
 * 199 200 199 199 200 200 200 200 200 200 200 200 200 200 200 200 200 200 199 199     199         200 200 200 200 200 200 200 200 198     198 200 199 200 198 199 198 199 200 198 198 198  kill col 13  Tbl  41 cols 0000000000000000000010110000000011000000000000 has 198 unique lines.
 * 197 198 197 197 198 198 198 198 198 198 198 198 198 198 198 198 198 198 197 197     197         198 198 198 198 198 198 198 198         195 198 197 197 196 197 196 196 198 196 196 196  kill col 11  Tbl  40 cols 0000000000000000000010110000000011100000000000 has 195 unique lines.
 * 194 195 194 191 195 195 195 195 195 195 195 195 195 195 195 195 195 195 194 194     194         195 195 195 195 195 195 195 195             195 194 194 193 194 193 192 195 193 193 193  kill col 42  Tbl  39 cols 0001000000000000000010110000000011100000000000 has 191 unique lines.
 * 190 191 190     191 191 191 191 191 191 191 191 191 191 191 191 191 191 190 190     190         191 191 190 191 191 191 191 191             191 190 190 189 190 189 188 191 189 189 189  kill col  4  Tbl  38 cols 0001000000000000000010110000000011100000010000 has 188 unique lines.
 * 187 188 187     188 188 188 188 188 188 188 188 188 188 188 188 188 188 186 187     187         188 188 187 188 188 187 188 188             188 187 187 186 187 186     187 186 186 186  kill col 27  Tbl  37 cols 0001000000000000001010110000000011100000010000 has 186 unique lines.
 * 185 186 185     186 186 186 186 186 186 186 186 186 186 186 186 186 186     185     185         186 186 185 186 186 185 186 186             186 185 185 184 185 184     185 184 184 184  kill col  7  Tbl  36 cols 0001000000000000001010110000000011100010010000 has 184 unique lines.
 * 183 184 183     184 184 184 184 184 184 184 184 184 184 184 184 184 183     183     182         184 184 183 184 183 182 184 184             182 183 183     183 177     181 179 181 180  kill col  5  Tbl  35 cols 0001000000000000001010110000000011100010110000 has 177 unique lines.
 * 176 177 176     177 177 177 177 177 177 177 177 176 177 177 177 177 176     174     172         177 177 176 177 175 175 177 177             176 176 176     172         167 168 172 169  kill col  3  Tbl  34 cols 0001000000000000001010110000000011100010111000 has 167 unique lines.
 * 166 167 166     167 167 167 167 167 167 167 167 166 167 167 167 167 166     163     160         167 167 165 167 164 165 167 166             166 166 166     159             155 156 156  kill col  2  Tbl  33 cols 0001000000000000001010110000000011100010111100 has 155 unique lines.
 * 154 155 153     155 155 155 155 155 155 155 155 153 155 155 155 154 151     150     146         155 155 151 155 150 150 155 151             154 154 153     142                 136 144  kill col  1  Tbl  32 cols 0001000000000000001010110000000011100010111110 has 136 unique lines.
 * 135 136 133     135 136 136 136 136 136 136 132 134 136 136 136 134 132     132     124         134 136 131 136 130 131 136 131             135 135 133     117                     122  kill col  6  Tbl  31 cols 0001000000000000001010110000000011100011111110 has 117 unique lines.
 * 116 117 112     116 117 117 117 117 117 117 114 116 116 115 117 115 113     113     103         113 117 111 117 111 110 115 111             116 116 113                             101  kill col  0  Tbl  30 cols 0001000000000000001010110000000011100011111111 has 101 unique lines.
 * 100 100  94     100 101 101 101 101 101 101  97 100 100  99 101  98  98      97      90          95 101  96 101  95  94  99  95             100 100  96                                  kill col 24  Tbl  29 cols 0001000000000000001011110000000011100011111111 has  90 unique lines.
 *  89  88  84      89  90  89  90  89  90  90  86  89  89  88  90  86  88      85                  84  90  85  90  84  81  88  86              89  88  84                                  kill col 16  Tbl  28 cols 0001000000000000001011110000010011100011111111 has  81 unique lines.
 *  80  79  75      80  81  80  81  80  81  81  77  80  80  79  80  77  79      76                  74  80  74  81  76      79  77              80  79  75                                  kill col 21  Tbl  27 cols 0001000000000000001011111000010011100011111111 has  74 unique lines.
 *  73  72  68      73  74  73  74  73  74  74  70  73  73  72  73  71  72      69                      72  67  74  69      72  70              73  72  69                                  kill col 19  Tbl  26 cols 0001000000000000001011111010010011100011111111 has  67 unique lines.
 *  65  65  60      66  67  65  67  66  67  67  63  66  66  65  66  64  65      62                      64      67  62      65  64              66  65  63                                  kill col 43  Tbl  25 cols 0011000000000000001011111010010011100011111111 has  60 unique lines.
 *  58  57          59  60  58  60  59  60  60  56  59  59  58  59  57  58      55                      57      60  55      58  57              58  58  57                                  kill col 26  Tbl  24 cols 0011000000000000001111111010010011100011111111 has  55 unique lines.
 *  53  52          54  55  53  55  54  55  55  51  54  54  53  53  52  53                              52      54  50      53  53              53  53  52                                  kill col 17  Tbl  23 cols 0011000000000000001111111010110011100011111111 has  50 unique lines.
 *  48  48          49  48  48  50  49  50  50  46  49  49  48  48  45  47                              47      49          48  48              48  48  47                                  kill col 29  Tbl  22 cols 0011000000000000101111111010110011100011111111 has  45 unique lines.
 *  43  43          44  43  40  45  44  45  45  42  44  44  43  43      43                              43      44          43  43              43  43  42                                  kill col 39  Tbl  21 cols 0011001000000000101111111010110011100011111111 has  40 unique lines.
 *  38  38          39  37      40  39  40  40  37  39  39  38  38      35                              38      39          39  38              38  38  37                                  kill col 28  Tbl  20 cols 0011001000000000111111111010110011100011111111 has  35 unique lines.
 *  33  33          34  31      34  34  34  35  33  34  34  32  33                                      33      34          34  34              33  33  33                                  kill col 40  Tbl  19 cols 0011011000000000111111111010110011100011111111 has  31 unique lines.
 *  29  29          29          30  30  29  31  29  28  30  29  29                                      29      30          30  30              29  29  29                                  kill col 33  Tbl  18 cols 0011011000001000111111111010110011100011111111 has  28 unique lines.
 *  27  26          26          27  27  26  27  26      27  26  26                                      26      27          27  27              26  26  26                                  kill col 44  Tbl  17 cols 0111011000001000111111111010110011100011111111 has  26 unique lines.
 *  25              24          25  25  24  25  24      25  24  24                                      24      25          25  25              24  24  24                                  kill col 41  Tbl  16 cols 0111111000001000111111111010110011100011111111 has  24 unique lines.
 *  23                          23  23  22  23  22      23  22  22                                      22      23          23  23              22  22  22                                  kill col 36  Tbl  15 cols 0111111001001000111111111010110011100011111111 has  22 unique lines.
 *  21                          21  20      21  20      21  20  20                                      20      21          21  21              20  20  20                                  kill col 37  Tbl  14 cols 0111111011001000111111111010110011100011111111 has  20 unique lines.
 *  19                          19          19  18      19  18  18                                      18      19          19  19              18  18  18                                  kill col 34  Tbl  13 cols 0111111011011000111111111010110011100011111111 has  18 unique lines.
 *  17                          17          17          17  16  16                                      16      17          17  17              16  16  17                                  kill col 31  Tbl  12 cols 0111111011011010111111111010110011100011111111 has  16 unique lines.
Possible good candidates for removal, columns : 8 9 10 20 30 
 *
 * Round 1: 1000000100100101000000000101001100011100000000  4 columns for indexes to table representing 12 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 38
 * 207 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x 207 204 207 207 207 207   x 207 207   x 207 207   x 207   x 207 207 206 207 206 207 205 206 207   x 205   x 207 207   x   x 206 204 205   x   x   x 206 207 206 207 207 206 205 206  kill col 43  Tbl  33 cols 1010000100100101000000000101001100011100000000 has 204 unique lines.
 *   x 204     204 204 204 204   x 204 204   x 204 204   x 204   x 204 204 203 204 203 204 202 203 204   x 201   x 204 204   x   x 203 201 202   x   x   x 203 204 203 204 204 203 202 203  kill col 19  Tbl  32 cols 1010000100100101000000000111001100011100000000 has 201 unique lines.
 *   x 201     201 201 201 201   x 201 201   x 201 201   x 201   x 201 201 200 201 200 201 199 200 201   x       x 201 201   x   x 200 198 199   x   x   x 200 201 200 201 201 200 199 200  kill col 12  Tbl  31 cols 1010000100100101000000000111001101011100000000 has 198 unique lines.
 *   x 198     197 198 198 198   x 198 198   x 198 198   x 198   x 198 198 197 198 196 198 196 195 198   x       x 198 198   x   x 196     196   x   x   x 197 198 197 198 198 197 196 197  kill col 22  Tbl  30 cols 1010000100100101000000010111001101011100000000 has 195 unique lines.
 *   x 195     194 195 195 195   x 195 195   x 195 195   x 195   x 195 195 194 195 194 194 193     195   x       x 195 195   x   x 192     193   x   x   x 194 194 193 195 195 194 193 193  kill col 13  Tbl  29 cols 1010000100100101000000010111001111011100000000 has 192 unique lines.
 *   x 192     191 192 192 192   x 192 192   x 192 192   x 192   x 192 192 191 192 191 191 190     192   x       x 192 192   x   x         189   x   x   x 191 191 190 191 192 191 190 190  kill col 11  Tbl  28 cols 1010000100100101000000010111001111111100000000 has 189 unique lines.
 *   x 189     184 189 189 189   x 189 189   x 189 189   x 189   x 189 189 188 189 188 188 187     189   x       x 189 187   x   x               x   x   x 188 187 187 187 189 188 186 187  kill col 42  Tbl  27 cols 1011000100100101000000010111001111111100000000 has 184 unique lines.
 *   x 184         184 184 184   x 184 184   x 184 184   x 184   x 184 184 183 184 183 183 182     184   x       x 184 182   x   x               x   x   x 183 182 180 182 184 182 181 181  kill col  5  Tbl  26 cols 1011000100100101000000010111001111111100100000 has 180 unique lines.
 *   x 180         180 180 180   x 180 180   x 180 179   x 180   x 180 180 179 180 179 178 176     180   x       x 180 176   x   x               x   x   x 172 178     177 179 175 174 175  kill col  7  Tbl  25 cols 1011000100100101000000010111001111111110100000 has 172 unique lines.
 *   x 172         172 172 172   x 172 172   x 172 171   x 172   x 172 171 171 172 171 167 169     172   x       x 171 167   x   x               x   x   x     170     168 168 164 164 167  kill col  2  Tbl  24 cols 1011000100100101000000010111001111111110100100 has 164 unique lines.
 *   x 164         164 164 164   x 164 164   x 164 162   x 164   x 164 163 162 164 161 159 159     162   x       x 162 159   x   x               x   x   x     159     160 158     157 158  kill col  1  Tbl  23 cols 1011000100100101000000010111001111111110100110 has 157 unique lines.
 *   x 155         157 157 157   x 157 157   x 156 154   x 157   x 156 156 155 157 154 151 150     154   x       x 155 147   x   x               x   x   x     145     147 144         147  kill col  3  Tbl  22 cols 1011000100100101000000010111001111111110101110 has 144 unique lines.
 *   x 141         144 144 144   x 144 144   x 142 141   x 144   x 143 143 142 142 138 135 136     139   x       x 140 133   x   x               x   x   x     125     128             125  kill col  6  Tbl  21 cols 1011000100100101000000010111001111111111101110 has 125 unique lines.
 *   x 121         125 125 125   x 125 124   x 123 121   x 124   x 124 123 121 123 115 115 116     120   x       x 119 113   x   x               x   x   x             101             102  kill col  4  Tbl  20 cols 1011000100100101000000010111001111111111111110 has 101 unique lines.
 *   x  98         101 100 101   x 101 100   x  98  98   x 100   x  99  98  97  97  91  91  93      95   x       x  93  88   x   x               x   x   x                              79  kill col  0  Tbl  19 cols 1011000100100101000000010111001111111111111111 has  79 unique lines.
 *   x  76          79  78  79   x  79  78   x  76  77   x  77   x  77  76  76  75  71  71  72      74   x       x  72  69   x   x               x   x   x                                  kill col 16  Tbl  18 cols 1011000100100101000000010111011111111111111111 has  69 unique lines.
 *   x  65          69  68  69   x  69  68   x  66  68   x  67   x  67  66  65  65  62  61  63      63   x       x  60       x   x               x   x   x                                  kill col 17  Tbl  17 cols 1011000100100101000000010111111111111111111111 has  60 unique lines.
 *   x  56          60  59  60   x  60  59   x  57  59   x  57   x  57  57  57  56  52  51  53      55   x       x           x   x               x   x   x                                  kill col 24  Tbl  16 cols 1011000100100101000001010111111111111111111111 has  51 unique lines.
 *   x  48          51  50  51   x  50  50   x  48  49   x  48   x  47  46  48  47  45      45      48   x       x           x   x               x   x   x                                  kill col 25  Tbl  15 cols 1011000100100101000011010111111111111111111111 has  45 unique lines.
 *   x  42          45  44  45   x  44  44   x  42  42   x  42   x  40  40  41  39          38      41   x       x           x   x               x   x   x                                  kill col 23  Tbl  14 cols 1011000100100101000011110111111111111111111111 has  38 unique lines.
 *   x  36          37  36  37   x  37  37   x  35  35   x  35   x  32  33  33  32                  34   x       x           x   x               x   x   x                                  kill col 29  Tbl  13 cols 1011000100100101100011110111111111111111111111 has  32 unique lines.
 *   x  30          31  30  28   x  31  31   x  30  29   x  29   x      26  28  27                  28   x       x           x   x               x   x   x                                  kill col 28  Tbl  12 cols 1011000100100101110011110111111111111111111111 has  26 unique lines.
 *   x  24          25  23  20   x  25  24   x  24  24   x  23   x          24  23                  23   x       x           x   x               x   x   x                                  kill col 39  Tbl  11 cols 1011001100100101110011110111111111111111111111 has  20 unique lines.
 *   x  18          19  18       x  19  18   x  19  19   x  18   x          18  17                  18   x       x           x   x               x   x   x                                  kill col 26  Tbl  10 cols 1011001100100101110111110111111111111111111111 has  17 unique lines.
 *   x  15          15  15       x  16  15   x  16  16   x  14   x          15                      15   x       x           x   x               x   x   x                                  kill col 31  Tbl   9 cols 1011001100100111110111110111111111111111111111 has  14 unique lines.
 *
 * Round 2: 0100110011011000001000001000000000000000000000  4 columns for indexes to table representing  9 original columns (uses 14 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 33
 * 206 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x   x 203 206   x   x 206   x   x   x   x   x   x   x 206   x 206 206   x 205 204 206 203 205   x   x 204   x 206 206   x   x 205 203 204   x   x   x 205 205 205 206 206 205 203 205  kill col 43  Tbl  24 cols 1110110111111101001000001101001100011100000000 has 203 unique lines.
 *   x   x     203   x   x 203   x   x   x   x   x   x   x 203   x 203 203   x 202 201 203 200 202   x   x 200   x 203 203   x   x 202 200 201   x   x   x 202 202 202 203 203 202 200 202  kill col 23  Tbl  23 cols 1110110111111101001000101101001100011100000000 has 200 unique lines.
 *   x   x     200   x   x 200   x   x   x   x   x   x   x 200   x 200 200   x 199 197 200     199   x   x 197   x 200 200   x   x 199 197 198   x   x   x 199 199 199 200 200 198 197 199  kill col 25  Tbl  22 cols 1110110111111101001010101101001100011100000000 has 197 unique lines.
 *   x   x     197   x   x 197   x   x   x   x   x   x   x 197   x 197 197   x 196     196     195   x   x 194   x 197 197   x   x 196 193 195   x   x   x 195 196 196 195 197 194 194 196  kill col 12  Tbl  21 cols 1110110111111101001010101101001101011100000000 has 193 unique lines.
 *   x   x     192   x   x 193   x   x   x   x   x   x   x 193   x 193 193   x 192     192     190   x   x 190   x 193 193   x   x 191     191   x   x   x 191 192 192 191 193 190 190 192  kill col 22  Tbl  20 cols 1110110111111101001010111101001101011100000000 has 190 unique lines.
 *   x   x     189   x   x 190   x   x   x   x   x   x   x 190   x 190 190   x 189     188           x   x 187   x 190 190   x   x 187     188   x   x   x 188 188 188 188 189 187 185 188  kill col  1  Tbl  19 cols 1110110111111101001010111101001101011100000010 has 185 unique lines.
 *   x   x     184   x   x 185   x   x   x   x   x   x   x 185   x 185 185   x 184     182           x   x 182   x 185 185   x   x 182     183   x   x   x 183 179 180 183 180 182     182  kill col  6  Tbl  18 cols 1110110111111101001010111101001101011101000010 has 179 unique lines.
 *   x   x     177   x   x 179   x   x   x   x   x   x   x 179   x 179 179   x 177     174           x   x 176   x 179 177   x   x 175     176   x   x   x 176     174 174 172 173     172  kill col  3  Tbl  17 cols 1110110111111101001010111101001101011101001010 has 172 unique lines.
 *   x   x     169   x   x 172   x   x   x   x   x   x   x 172   x 172 172   x 170     162           x   x 168   x 171 170   x   x 167     166   x   x   x 166     160 162     161     160  kill col  5  Tbl  16 cols 1110110111111101001010111101001101011101101010 has 160 unique lines.
 *   x   x     154   x   x 160   x   x   x   x   x   x   x 160   x 159 160   x 156     144           x   x 156   x 158 156   x   x 151     152   x   x   x 148         149     145     144  kill col 24  Tbl  15 cols 1110110111111101001011111101001101011101101010 has 144 unique lines.
 *   x   x     137   x   x 144   x   x   x   x   x   x   x 143   x 143 141   x 140                   x   x 140   x 137 140   x   x 134     134   x   x   x 128         132     127     126  kill col  0  Tbl  14 cols 1110110111111101001011111101001101011101101011 has 126 unique lines.
 *   x   x     117   x   x 126   x   x   x   x   x   x   x 124   x 125 121   x 121                   x   x 121   x 119 118   x   x 114     116   x   x   x 109         106     104          kill col  2  Tbl  13 cols 1110110111111101001011111101001101011101101111 has 104 unique lines.
 *   x   x      95   x   x 103   x   x   x   x   x   x   x 102   x 100  98   x  96                   x   x  99   x  96  94   x   x  91      96   x   x   x  80          82                  kill col  7  Tbl  12 cols 1110110111111101001011111101001101011111101111 has  80 unique lines.
 *   x   x      72   x   x  79   x   x   x   x   x   x   x  77   x  75  74   x  72                   x   x  75   x  71  67   x   x  70      73   x   x   x              60                  kill col  4  Tbl  11 cols 1110110111111101001011111101001101011111111111 has  60 unique lines.
 *   x   x      53   x   x  59   x   x   x   x   x   x   x  58   x  54  54   x  53                   x   x  55   x  51  48   x   x  52      54   x   x   x                                  kill col 16  Tbl  10 cols 1110110111111101001011111101011101011111111111 has  48 unique lines.
 *   x   x      42   x   x  46   x   x   x   x   x   x   x  45   x  43  41   x  42                   x   x  42   x  37       x   x  38      40   x   x   x                                  kill col 17  Tbl   9 cols 1110110111111101001011111101111101011111111111 has  37 unique lines.
 *   x   x      30   x   x  34   x   x   x   x   x   x   x  33   x  30  30   x  32                   x   x  32   x           x   x  29      30   x   x   x                                  kill col 13  Tbl   8 cols 1110110111111101001011111101111111011111111111 has  29 unique lines.
 *   x   x      22   x   x  26   x   x   x   x   x   x   x  25   x  24  23   x  24                   x   x  24   x           x   x          23   x   x   x                                  kill col 42  Tbl   7 cols 1111110111111101001011111101111111011111111111 has  22 unique lines.
 *   x   x           x   x  19   x   x   x   x   x   x   x  19   x  17  15   x  17                   x   x  18   x           x   x          17   x   x   x                                  kill col 28  Tbl   6 cols 1111110111111101011011111101111111011111111111 has  15 unique lines.
Possible good candidates for removal, columns : 19 
 *
 * Round 3: 0000001000000010100100000010000000100000000000  4 columns for indexes to table representing  6 original columns (uses 15 of 16 lines in indirect table).
 * Direct:  0011000000000000010011110000110011000011111111 19 columns
 * Can even chose 1 more column to be represented directly.
 * Success. Use 2 EBRs, 26 LUTs.
 */

module v14_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    *                      indirect_index 2
    *                      | indirect_index 1
    * inx         next     | | indirect index 0
    * || ucode    ucode    | | | direct representation
    * 00 LB_0     LB_1     0 0 0 00000000000001011011| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 1 00010001000100010111|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 2 00100010001001011011| IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0
    * 03 _L0x03   StdIncPc 3 3 2 00110011001000000101| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 4 3 2 01000011001001100101| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   3 3 2 00110011001000000000| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 06 LB_3     LB_4     0 3 2 00000011001000001101|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     1 3 2 00010011001000001011|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     5 3 0 01010011000001011101| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     0 3 2 00000011001000001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     5 3 0 01010011000001011101| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JALR_3   0 3 3 00000011001101000101|        Q=1. Prep legalize target
    * 0c ADD_0    ADDI_0   1 3 2 00010011001000011101| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    3 3 2 00110011001010011101| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    3 3 2 00110011001000011101| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 4 3 2 01000011001000100101| LUI    q = imm20
    * 10 SUB_1    LB_6     0 3 2 00000011001000011111|        Q = ~RS2
    * 11 AND_1    ANDI_1   0 3 2 00000011001000011101|        RS1^0xffffffff to Q
    * 12 straddle Fetchu   6 4 4 01100100010011011010|  Fr10u IncPC, OpFetch
    * 13 condb_2  condb_3  0 3 2 00000011001000011111|        ~RS2 in Q
    * 14 condb_3  condb_4  0 3 3 00000011001101011001|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  1 3 5 00010011010100000001|        Branch on condition
    * 16 condb_5  StdIncPc 3 3 2 00110011001000000001|        Branch not taken.
    * 17 condb_5t condb_6t 7 3 2 01110011001000100000|        Branch taken. yy=oldPC incase of access error
    * 18 BEQ      condb_2  5 3 2 01010011001000111101| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   5 5 2 01010101001001000000| JALR   (tmp) Prep pc=RS1+imm (target)
    * 1a ANDI_1   StdIncPc 8 3 2 10000011001000100101|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    3 3 2 00110011001000000000| JAL. J-imm is in q. Prep get isntradr from jj
    * 1c ECAL_BRK ECAL_RET 2 3 2 00100011001000010110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 8 3 2 10000011001000100101|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 3 3 3 00110011001111010101|        Q = 4
    * 1f IJ_2     IJ_3     5 5 2 01010101001000000000|        Read word is to be masked with lsb = 0
    * 20 LH_0     LH_1     9 0 0 10010000000001111011| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 4 3 2 01000011001000100101|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  0 3 6 00000011011000010101|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 _L0x23   StdIncPc 3 3 2 00110011001000000101| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   0 6 0 00000110000000011110| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   3 3 2 00110011001000000000| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 26 OR_1     OR_2     5 3 2 01010011001000011101|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    0 3 2 00000011001001000001|        Q = rs2
    * 28 _L0x28   SH_1     9 3 0 10010011000001011101| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   0 3 2 00000011001000011101|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     9 3 0 10010011000001011101| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  0 3 3 000000110011010xxxx1|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    3 3 2 00110011001000011100| SLL    Shift left
    * 2d MULH_0   MULH_1   1 6 2 00010110001000010101| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e MULHU_1  MULHU_2  5 3 2 01010011001010011111|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 2f _L0x2f   StdIncPc 4 3 2 01000011001000100101| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 4 3 7 01000011011100100101|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  0 3 2 00000011001000011111|        ~rs2 to Q
    * 32 JAL_1    JAL_2    7 3 2 01110011001000100000|      Prep Instradr to yy. Refetch instradr
    * 33 JALR_3   JAL_25   7 5 2 01110101001000000001|        Q = (RS1+imn) & 0xfffffffe
    * 34 JAL_3    Fetch    7 4 2 01110100001000011010|      Prep fetch next instr.
    * 35 SLLI_1   SLLI_2   8 6 2 10000110001000110111|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   8 7 2 10000111001000110111|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  a 3 5 101000110101001xxxx1|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  5 3 2 01010011001000111101| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 8 3 2 10000011001010100101|        Last shift.
    * 3a SRxI_1   SRxI_2   8 6 6 10000110011000110101|        Register to shift to Q
    * 3b _L0x3b   JAL_1    3 3 2 00110011001000000000| JAL. J-imm is in q. Prep get isntradr from jj
    * 3c CSRRW_0  CSRRW_1  5 3 2 01010011001000101101| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   8 7 6 10000111011000110101|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   1 6 0 00010110000000011110|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   1 6 0 00010110000000011110|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     2 0 8 00100000100001011011| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   7 3 2 01110011001000110101|        yy=jj. Prep get Q=1
    * 42 MULHU_2  MULHU_3  0 6 6 00000110011000010101|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  0 3 2 00000011001000000000|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  0 3 2 00000011001000011111| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    0 3 3 00000011001101010101|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    a 3 2 10100011001000110100|        Store PC to mepc
    * 47 ILL_2    ILL_3    a 5 2 10100101001000110101|        Store 0 to mtval
    * 48 _L0x48   SW_1     2 8 8 00101000100001011101| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  0 3 3 00000011001101000001|        Construct PC storage adr
    * 4a _L0x4a   SW_1     2 8 8 00101000100001011101| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  b 9 2 10111001001000010100|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   3 3 2 00110011001000011101| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  7 6 2 01110110001000111101| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     3 3 2 001100110010000xxxx0| Illegal instruction seen
    * 4f MRET_8   MRET_9   3 3 3 00110011001111010101|        +4, so now 0x103
    * 50 LW_1     StdIncPc 8 1 9 10000001100100110111|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   c 5 2 11000101001000110100|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 1 00010001000100010111|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   c 5 2 11000101001000110100|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     1 7 6 00010111011000010101|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 c 5 2 11000101001000110101|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 3 2 00010011001000010001|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     0 3 2 00000011001000010001|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    1 3 6 00010011011011010111|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   5 3 2 01010011001000111111|        REM = Q to yy
    * 5a SB_1     SB_2     7 6 2 01110110001000110111|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    3 3 2 00110011001000000000| JAL. J-imm is in q. Prep get isntradr from jj
    * 5c CSRRS_0  CSRRW_1  5 3 2 01010011001000101101| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     7 7 2 01110111001000110111|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 1 00010001000100010111|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   c 5 2 11000101001000110100|  err   LD AlignFault. Faulting adr to mtval
    * 60 MULHU_3  MULHU_2  1 3 2 00010011001010011111|        Shift Q and rM. Prepare read rs1
    * 61 EBRKWFI2 EBREAK_1 5 3 5 01010011010100101101| EBREAK/WFI2 Select EBREAK or WFI.
    * 62 DIV_8    DIV_7    0 6 3 00000110001101010111|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    0 a 3 00001010001101010111|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  0 3 2 00000011001000011111| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    3 3 5 00110011010100000001|        Prepare read PC.
    * 66 SW_1     SW_2     b 5 2 10110101001000011100|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    c 5 2 11000101001000100100|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 8 3 2 10000011001000100101|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     0 3 2 00000011001000010101|        RS2 > 0, RS1 < 0, change sign yy
    * 6a MULH_1   MULH_2   5 3 2 01010011001000110101|        Store ~rs1 to Ryy. Prep construct 1.
    * 6b SB_4     SB_5     1 b 2 00011011001000011001|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   3 3 2 00110011001000011101| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  7 6 2 01110110001000111101| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e DIV_C    DIV_e    7 3 2 01110011001000111100|        rM to yy. Q=ffffffff
    * 6f MRET_6   MRET_7   0 3 3 000000110011010xxxx1|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    1 7 6 00010111011000010101|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 c 5 2 11000101001000110101|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   0 3 2 00000011001000001101|        Invert q. Prepare read mask
    * 73 unalignd straddle 0 3 2 00000011001000000101|  Fr10u Unaligned pc, prep read high hword
    * 74 MRET_9   Fetch    5 4 3 01010100001101011010|        +1, IncPC, OpFetch next
    * 75 IJ_5     Fetch    7 4 2 01110100001000011010|        Mask and use as PC
    * 76 Fetchu   Fetch2   0 3 a 00000011101000000111|  Fr10u Read and latch instruction
    * 77 eFetchu  Fetch2   0 1 b 00000001101100010111|  Fr10u rep Read until d=mem[(rs1+ofs) & ~3u]
    * 78 DIV_4    DIV_6    5 3 2 01010011001000100001|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    0 3 3 00000011001111010101|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     8 5 2 10000101001000011000|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    3 3 2 00110011001000000000| JAL. J-imm is in q. Prep get isntradr from jj
    * 7c CSRRC_0  CSRRW_1  5 3 2 01010011001000101101| CSRRC  Decoded CSR adr in yy
    * 7d condb_6t Fetch    5 4 2 01010100001001011010|        Branch taken.
    * 7e NMI_1    NMI_2    a 3 2 101000110010001xxxx1|        Store pc to mepc.
    * 7f unx7f             d 6 0 11010110000000xxxxxx| 7f: Not in use 
    * 80 LBU_0    LBU_1    0 0 0 00000000000001011011| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 unx81             d 6 0 11010110000000xxxxxx| 81: Not in use 
    * 82 DIV_1    DIV_3    5 3 2 01010011001000011101|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    0 3 2 00000011001001010101|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   0 3 2 00000011001000011111| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 1 00010001000100010111|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   5 5 2 01010101001001000001|      Prep pc = jj + ofs
    * 87 unx87             d 6 0 11010110000000xxxxxx| 87: Not in use 
    * 88 DIV_E    DIV_10   3 a 2 00111010001010011110|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 4 3 2 01000011001000100101|        RS2 == 0, return 0xffffffff
    * 8a DIVU_5   ANDI_1   3 3 6 00110011011011010111|        Transfer rM to rDee
    * 8b LB_6     StdIncPc 4 3 3 01000011001111100101|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    3 3 2 00110011001000011111| XOR    xor
    * 8d DIV_0    DIV_1    1 c 2 00011100001010010111| DIV    Branch on sign dividend RS1
    * 8e _LCSRRS_1 ILLe     3 3 2 001100110010000xxxx0| Illegal instruction seen
    * 8f ILL_3    ILL_4    0 3 3 00000011001100010101|        Q = 1
    * 90 NMI_2    JAL_3    c d 2 11001101001000101001|        mtval = 0.
    * 91 LDAF_2   LDAF_3   6 d 3 01101101001111100100|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    a 3 2 10100011001000110010|        PC to mepc
    * 93 SW_E2    SW_E3    a 3 2 10100011001000110111|        Store address that faulted
    * 94 SW_E4    JAL_3    7 d 2 01111101001000110010|        Store 6 to mcause
    * 95 SW_E3    SW_E4    3 3 3 00110011001111010111|        Q = 3
    * 96 SH_1     SH_2     7 6 2 01110110001000110111|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    c 5 2 11000101001000100100|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  5 3 2 01010011001000111101| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     3 3 2 001100110010000xxxx0|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    6 d 2 01101101001001110010|        mcause = 11
    * 9b SH_4     SH_5     e 8 2 11101000001000011001|        Address back to Q. Prepare get item to write
    * 9c DIV_10   DIV_12   1 a 2 00011010001010011001|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   1 a 2 00011010001010011001|        RS2 < 0. Branch on sign of RS1
    * 9e JAL_25   JAL_3    d 3 4 11010011010011100101|      Prep WTRG = jj+2/4 (return adr)
    * 9f SH_5     SW_2     b 3 2 10110011001000011000|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    9 0 0 10010000000001111011| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  3 3 3 00110011001111010101|        Q = 4
    * a2 DIV_14   LB_6     0 3 2 00000011001000010101|        RS2 < 0, RS1 >= 0, change sign yy
    * a3 DIV_15   StdIncPc 8 3 2 10000011001000100101|        RS2 < 0, RS1 < 0, yy is true result
    * a4 SRxI_0   SRxI_1   0 6 0 00000110000000011110| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   0 3 3 00000011001101001101|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  2 3 8 00100011100000010110| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 0 3 2 000000110010010xxxx1| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    0 a 2 00001010001010010101|        Branch on sign divisor RS2
    * a9 ILL_4    JAL_3    5 d 3 01011101001101110010|        Store 2 to mcause
    * aa DIV_6    DIV_7    3 3 2 00110011001010010111|        Write M. Prepare shift
    * ab EBREAK_2 ECALL_6  a 3 2 10100011001000110101|        pc to mepc
    * ac _L0xac   SRx_1    3 3 2 00110011001000011100| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   3 6 2 00110110001010011101| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _L0xae   SRx_1    3 3 2 00110011001000011100| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   0 3 3 000000110011010xxxx1|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   6 d 2 01101101001001100100|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  3 3 3 00110011001111010101|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    6 4 3 01100100001111011010|        IncPC, OpFetch, but force +4
    * b3 unxb3             d 6 0 11010110000000xxxxxx| b3: Not in use 
    * b4 eFetch3  unalignd c 3 c 11000011110001011111|  Fr10  Update minstret, Q=immediate. Use dinx
    * b5 SH_3     SH_4     0 3 2 00000011001000000001|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  3 3 3 00110011001111010101|        Q = 8
    * b7 IJ_3     IJ_4     7 3 2 01110011001000110101|        Store present PC in case of access error
    * b8 BGE      condb_2  5 3 2 01010011001000111101| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    0 3 3 00000011001100011001|        Calc carry of RS2+0xFFFFFFFF
    * ba LHU_3    ANDI_1   0 3 2 00000011001000001111|        Invert q. Prepare read mask
    * bb SH_2     SH_3     7 7 2 01110111001000110111|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  5 3 2 01010011001000101101| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     IJ_5     0 3 3 00000011001101000101|        Construct Q = 1
    * be IJ_1     IJ_2     1 1 2 00010001001000010111|        Read until q=mem[(rs1+ofs)&~1u]
    * bf IJT_1    IJT_2    1 1 2 00010001001000010111|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    1 3 5 00010011010100011101|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    5 3 2 01010011001000110101|        Read word is to be masked with ~1u
    * c2 DIVU_3   DIVU_2   0 6 3 00000110001101010111|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   0 a 3 00001010001101010111|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    5 3 2 01010011001000011111| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   0 3 2 00000011001000000001|        ~302
    * c6 IJT_4    ILL_2    a 3 2 10100011001000110101|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   a 3 2 101000110010001xxxx1|        Store pc to mepc.
    * c8 DIV_7    DIV_8    1 3 d 00010011110110011001|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   3 3 2 00110011001001001101|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   1 3 d 00010011110110011001|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc c d 2 11001101001000101001|        mtval = 0.
    * cc OR_0     OR_1     3 3 2 00110011001000011111| OR     or
    * cd REM_0    DIV_1    1 c 2 00011100001010010111| REM    Branch on sign dividend RS1
    * ce _LCSRRCI_1 ILLe     3 3 2 001100110010000xxxx0| Illegal instruction seen
    * cf MRET_7   MRET_8   3 3 5 00110011010100001101|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  0 3 3 00000011001101000001| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   5 3 2 01010011001000001101| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     1 7 6 00010111011000010101|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 c 5 2 11000101001000110101|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   5 d 3 01011101001101100100|        Store 5 to mcause
    * d5 eFetch2  eFetch3  c 5 e 11000101111001000011|  Fr10  Update ttime
    * d6 eILL0c   ILLe     3 3 2 001100110010000xxxx0| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  c 5 2 11000101001000110101|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  5 3 2 01010011001000111101| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  3 3 2 00110011001010011111|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   3 3 2 00110011001000010101|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   5 5 3 01010101001101111000|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  5 3 2 01010011001000101101| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  c 5 2 11000101001000110101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   5 3 a 01010011101000000111|  Fr10  Read and latch instruction
    * df eFetch   eFetch2  5 1 b 01010001101100010111|  Fr10  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   5 3 2 01010011001000110111|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    1 3 2 00010011001000000001|        Q = RS1
    * e2 MUL_1    MUL_2    0 6 6 00000110011000010101|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   3 3 6 00110011011011010111|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   0 3 2 00000011001000011111| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  3 3 3 00110011001111010101|        Q = 4
    * e6 StdIncPc Fetch    6 4 4 01100100010011011010|  Fr10  IncPC, OpFetch
    * e7 aFault   aFault_1 c 5 2 11000101001000110101|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    1 3 2 00010011001010011101|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    0 3 3 00000011001101011001|        Construct Q = 1
    * ea MULHU_5  MULHU_6  0 3 2 00000011001000011001|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     0 3 2 00000011001000001111|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    3 3 2 00110011001000011111| AND    And 
    * ed REMU_0   DIVU_1   3 6 2 00110110001010011101| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     3 3 2 001100110010000xxxx0| Illegal instruction seen
    * ef WFI_5    Fetch    6 4 3 01100100001111011010|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    1 7 6 00010111011000010101|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 c 5 2 11000101001000110101|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 3 2 00110011001000000101|        Prepare read PC
    * f3 aF_SW    aF_SW_1  3 3 2 001100110010000xxxx0|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   unalignd c 5 f 11000101111101011111|  Fr10  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 c 5 2 11000101001000110101|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    3 3 3 00110011001111011001| WFI    Chk offset=0x105. Now 0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 c 5 2 11000101001000100001| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  5 3 2 01010011001000111101| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   5 3 3 01010011001101011101|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    0 3 3 00000011001101010101|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     0 3 2 00000011001000000001|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  5 3 2 01010011001000101101| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    3 3 2 00110011001000000101| NMI    Get current PC
    * fe ILLe     ILL_1    3 3 2 00110011001000000100| Illegal
    * ff QINT_0   QINT_1   3 3 2 00110011001000000101| INT    Get current PC
    */
   localparam u0_0 = 256'h56e6d010d0e2d8045c33dc5ab88bdc5aba09da07080454e650e6bcbe79d2bc01;
   localparam u0_1 = 256'h0eb75cd456e66ea6083252e60441d613087d10e618169c15f814ac76d81af88b;
   localparam u0_2 = 256'h56e6f642586ac03e1430dc96d821dc961c1dd0270804e63550e65d3950e6bc52;
   localparam u0_3 = 256'he03ae0355903d6490832593d50e6d61310d77c037836a8de129e0886f82b56e6;
   localparam u0_4 = 256'h5c7400fed02ed03148b1dc661c4bdc66508f40475c65fa2b08ea5d60500bbc50;
   localparam u0_5 = 256'h4eda79707cfbd6490832785df69c796e188b1a57561e59eb4eda79544eda70e6;
   localparam u0_6 = 256'h1ccfc8b9d02ed031987a50f9588b50e64693c8f210effa2b7c587cc8d2f7f842;
   localparam u0_7 = 256'h00001090acded649083288f25ca816aa76f476f4aadeacde5612da1a561e59ba;
   localparam u0_8 = 256'h5ca900fe7882f02954e6711a56e6e09c0000149e79f0fa215c82d0a80000bc85;
   localparam u0_9 = 256'h88f2543490a29068989f243400fed613469378bb7c9424347095203444929634;
   localparam u0_A = 256'h1cc5c03fd0e0c03f509a70c8243458781c616ed0dcafe63a50e6588b5cb6bc5e;
   localparam u0_B = 256'h78c1781f5c75d6497cb5fa1a98c0d61350bd5c9a169bfc730000acde5cb24492;
   localparam u0_C = 256'hd04f00fe7882f02696e69cc2dca59c6210cb5a471a6ff2e17c8a7cca56e9d888;
   localparam u0_D = 256'h76d576f456e5d64984925091f042d61356a100fe34b44492561e5906d6c91c37;
   localparam u0_E = 256'hacde00fed0e0f011fa569c229cc6d8e2561eacde5cb0fa1a711a5de8181d70ca;
   localparam u0_F = 256'h50c74046507ed649166b5c45d4d9d61316ab9cfa56dbfc7308dd50e6561e5972;
   localparam u1_0 = 256'h4322332133291321033453050320530513200320332043263320222511110005;
   localparam u1_1 = 256'h5520333d83222321332083225524532373223320135003350321644d03210321;
   localparam u1_2 = 256'h4322532916213321033493050321930503245321332006013320036143229007;
   localparam u1_3 = 256'h160116018763532233208663832a5323a3528723862374217520732203214372;
   localparam u1_4 = 256'h333d332076233321b921288503342885a523a323033503210320066173232085;
   localparam u1_5 = 256'hc523111177235322332076235323136d03211321c5231761c5231111c5238193;
   localparam u1_6 = 256'h03347323762333211b21532303218322c522b521335003210a35063553521329;
   localparam u1_7 = 256'hd600a3225425532233208521033d532201b103a07421543503200320c5231761;
   localparam u1_8 = 256'h033133201c293321433e336d43223a29d60055241111032103255321d6000005;
   localparam u1_9 = 256'hb321d34e1a291a29e8216d2733205323c5227623333d7d23a323a3236d3ecd22;
   localparam u1_A = 256'h0334332136293321a32333295d370a29032423810334060183220321333d9007;
   localparam u1_B = 256'h112111210334532277230320033153237323333d0320c3c5d600643d333d6d26;
   localparam u1_C = 256'h335033201c293321cd2213d9332413d9a322a323032053210a35063553231351;
   localparam u1_D = 256'h51b153a0c52353225537332133295323c5233320c5e45d36c523176153200334;
   localparam u1_E = 256'h643d3320362933210320032103351329c523644d333d0321336d066113205323;
   localparam u1_F = 256'h33203320332053220320033553355323c522333dc523c5f533203320c5231761;
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
   assign d[8] = indir[8];
   assign d[12] = indir[9];
   assign d[13] = indir[10];
   assign d[16] = indir[11];
   assign d[17] = indir[12];
   assign d[22] = indir[13];
   assign d[23] = indir[14];
   assign d[24] = indir[15];
   assign d[25] = indir[16];
   assign d[28] = indir[17];
   assign d[42] = indir[18];
   assign d[43] = indir[19];
   // replaces = 1000000100100101000000000101001100011000000000
   SB_LUT4 #(.LUT_INIT(16'h1098)) cmb_d09(.O(d[9]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h3018)) cmb_d10(.O(d[10]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d14(.O(d[14]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0c00)) cmb_d15(.O(d[15]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'hc000)) cmb_d18(.O(d[18]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'hfffe)) cmb_d20(.O(d[20]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h9000)) cmb_d30(.O(d[30]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0100)) cmb_d32(.O(d[32]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0802)) cmb_d35(.O(d[35]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0a00)) cmb_d38(.O(d[38]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d45(.O(d[45]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   // replaces = 0100110011011000001000001000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h2f3f)) cmb_d21(.O(d[21]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2a30)) cmb_d27(.O(d[27]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0012)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0080)) cmb_d34(.O(d[34]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2004)) cmb_d36(.O(d[36]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2200)) cmb_d37(.O(d[37]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0915)) cmb_d40(.O(d[40]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0900)) cmb_d41(.O(d[41]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1400)) cmb_d44(.O(d[44]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0000001000000010100100000010000000100000000000
   SB_LUT4 #(.LUT_INIT(16'h4d82)) cmb_d11(.O(d[11]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h5fb7)) cmb_d19(.O(d[19]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h5c00)) cmb_d26(.O(d[26]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h16e0)) cmb_d29(.O(d[29]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0204)) cmb_d31(.O(d[31]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h400f)) cmb_d39(.O(d[39]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------ehdr
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit.
 * Optiones for this variant:
 *   RVC included
 *   MULDIV included
 *   minstret for instructions in SRAM and EBR
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 46 columns
 * Removed:  0000000000000000000000000000000000000000000000 These are removed from consideration, replaced with hand-crafted Verilog code in the output stage
 * Reserved: 0000000000000000000000000000000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 46
 * 209 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 208 209 208 209 209 209 209 209 209 209 209 209 209 209 209 209 209 209 209 209 208 209 207 208 209 209 209 209 209 209 209 209 208 206 207 209 208 209 208 209 208 209 209 208 207 208  kill col 12  Tbl  45 cols 0000000000000000000000000000000001000000000000 has 206 unique lines.
 * 205 206 205 205 206 206 206 206 206 206 206 206 206 206 206 206 206 206 206 206 204 206 204 203 206 206 206 206 206 206 206 206 204     204 206 205 206 205 206 205 206 206 205 204 205  kill col 22  Tbl  44 cols 0000000000000000000000010000000001000000000000 has 203 unique lines.
 * 202 203 202 202 203 203 203 203 203 203 203 203 203 203 203 203 203 203 203 203 202 202 201     203 203 203 203 203 203 203 203 201     201 203 202 203 202 202 201 203 203 202 201 201  kill col 23  Tbl  43 cols 0000000000000000000000110000000001000000000000 has 201 unique lines.
 * 200 201 200 200 201 201 201 201 201 201 201 201 201 201 201 201 201 201 200 200 199 200         201 201 201 201 201 201 201 201 199     199 201 200 201 200 200 199 201 201 199 199 199  kill col 25  Tbl  42 cols 0000000000000000000010110000000001000000000000 has 199 unique lines.
 * 198 199 198 198 199 199 199 199 199 199 199 199 199 199 199 199 199 199 198 198     198         199 199 199 199 199 199 199 199 197     197 199 198 199 197 198 197 198 199 197 197 197  kill col 13  Tbl  41 cols 0000000000000000000010110000000011000000000000 has 197 unique lines.
 * 196 197 196 196 197 197 197 197 197 197 197 197 197 197 197 197 197 197 196 196     196         197 197 197 197 197 197 197 197         194 197 196 196 195 196 195 195 197 195 195 195  kill col 11  Tbl  40 cols 0000000000000000000010110000000011100000000000 has 194 unique lines.
 * 193 194 193 190 194 194 194 194 194 194 194 194 194 194 194 194 194 194 193 193     193         194 194 194 194 194 194 194 194             194 193 193 192 193 192 191 194 192 192 192  kill col 42  Tbl  39 cols 0001000000000000000010110000000011100000000000 has 190 unique lines.
 * 189 190 189     190 190 190 190 190 190 190 190 190 190 190 190 190 190 189 189     189         190 190 189 190 190 190 190 190             190 189 189 188 189 188 187 190 188 188 188  kill col  4  Tbl  38 cols 0001000000000000000010110000000011100000010000 has 187 unique lines.
 * 186 187 186     187 187 187 187 187 187 187 187 187 187 187 187 187 187 185 186     186         187 187 186 187 187 186 187 187             187 186 186 185 186 185     186 185 185 185  kill col 27  Tbl  37 cols 0001000000000000001010110000000011100000010000 has 185 unique lines.
 * 184 185 184     185 185 185 185 185 185 185 185 185 185 185 185 185 185     184     184         185 185 184 185 185 184 185 185             185 184 184 183 184 183     184 183 183 183  kill col  7  Tbl  36 cols 0001000000000000001010110000000011100010010000 has 183 unique lines.
 * 182 183 182     183 183 183 183 183 183 183 183 183 183 183 183 183 182     182     181         183 183 182 183 182 181 183 183             181 182 182     182 176     180 178 180 179  kill col  5  Tbl  35 cols 0001000000000000001010110000000011100010110000 has 176 unique lines.
 * 175 176 175     176 176 176 176 176 176 176 176 175 176 176 176 176 175     173     171         176 176 175 176 174 174 176 176             175 175 175     171         166 167 171 168  kill col  3  Tbl  34 cols 0001000000000000001010110000000011100010111000 has 166 unique lines.
 * 165 166 165     166 166 166 166 166 166 166 166 165 166 166 166 166 165     162     159         166 166 164 166 163 164 166 165             165 165 165     158             154 155 155  kill col  2  Tbl  33 cols 0001000000000000001010110000000011100010111100 has 154 unique lines.
 * 153 154 152     154 154 154 154 154 154 154 154 152 154 154 154 153 150     149     145         154 154 150 154 149 149 154 150             153 153 152     141                 135 143  kill col  1  Tbl  32 cols 0001000000000000001010110000000011100010111110 has 135 unique lines.
 * 134 135 132     134 135 135 135 135 135 135 131 133 135 135 135 133 131     131     123         133 135 130 135 129 130 134 130             134 134 132     116                     121  kill col  6  Tbl  31 cols 0001000000000000001010110000000011100011111110 has 116 unique lines.
 * 115 116 111     115 116 116 116 116 116 116 113 115 115 114 116 114 112     112     102         112 116 110 116 110 109 115 110             115 115 112                             100  kill col  0  Tbl  30 cols 0001000000000000001010110000000011100011111111 has 100 unique lines.
 *  99  99  93      99 100 100 100 100 100 100  96  99  99  98 100  97  97      96      89          94 100  95 100  94  93  99  94              99  99  95                                  kill col 24  Tbl  29 cols 0001000000000000001011110000000011100011111111 has  89 unique lines.
 *  88  87  83      88  89  88  89  88  89  89  85  88  88  87  89  85  87      84                  83  89  84  89  83  80  88  85              88  87  83                                  kill col 16  Tbl  28 cols 0001000000000000001011110000010011100011111111 has  80 unique lines.
 *  79  78  74      79  80  79  80  79  80  80  76  79  79  78  79  76  78      75                  73  79  73  80  75      79  76              79  78  74                                  kill col 21  Tbl  27 cols 0001000000000000001011111000010011100011111111 has  73 unique lines.
 *  72  71  67      72  73  72  73  72  73  73  69  72  72  71  72  70  71      68                      71  66  73  68      72  69              72  71  68                                  kill col 19  Tbl  26 cols 0001000000000000001011111010010011100011111111 has  66 unique lines.
 *  64  64  59      65  66  64  66  65  66  66  62  65  65  64  65  63  64      61                      63      66  61      65  63              65  64  62                                  kill col 43  Tbl  25 cols 0011000000000000001011111010010011100011111111 has  59 unique lines.
 *  57  56          58  59  57  59  58  59  59  55  58  58  57  58  56  57      54                      56      59  54      58  56              57  57  56                                  kill col 26  Tbl  24 cols 0011000000000000001111111010010011100011111111 has  54 unique lines.
 *  52  51          53  54  52  54  53  54  54  50  53  53  52  52  51  52                              51      53  49      53  52              52  52  51                                  kill col 17  Tbl  23 cols 0011000000000000001111111010110011100011111111 has  49 unique lines.
 *  47  47          48  47  47  49  48  49  49  45  48  48  47  47  44  46                              46      48          48  47              47  47  46                                  kill col 29  Tbl  22 cols 0011000000000000101111111010110011100011111111 has  44 unique lines.
 *  42  42          43  42  40  44  43  44  44  41  43  43  42  42      42                              42      43          43  42              42  42  41                                  kill col 39  Tbl  21 cols 0011001000000000101111111010110011100011111111 has  40 unique lines.
 *  38  38          39  37      40  39  40  40  37  39  39  38  38      35                              38      39          39  38              38  38  37                                  kill col 28  Tbl  20 cols 0011001000000000111111111010110011100011111111 has  35 unique lines.
 *  33  33          34  31      34  34  34  35  33  34  34  32  33                                      33      34          34  34              33  33  33                                  kill col 40  Tbl  19 cols 0011011000000000111111111010110011100011111111 has  31 unique lines.
 *  29  29          29          30  30  29  31  29  28  30  29  29                                      29      30          30  30              29  29  29                                  kill col 33  Tbl  18 cols 0011011000001000111111111010110011100011111111 has  28 unique lines.
 *  27  26          26          27  27  26  27  26      27  26  26                                      26      27          27  27              26  26  26                                  kill col 44  Tbl  17 cols 0111011000001000111111111010110011100011111111 has  26 unique lines.
 *  25              24          25  25  24  25  24      25  24  24                                      24      25          25  25              24  24  24                                  kill col 41  Tbl  16 cols 0111111000001000111111111010110011100011111111 has  24 unique lines.
 *  23                          23  23  22  23  22      23  22  22                                      22      23          23  23              22  22  22                                  kill col 36  Tbl  15 cols 0111111001001000111111111010110011100011111111 has  22 unique lines.
 *  21                          21  20      21  20      21  20  20                                      20      21          21  21              20  20  20                                  kill col 37  Tbl  14 cols 0111111011001000111111111010110011100011111111 has  20 unique lines.
 *  19                          19          19  18      19  18  18                                      18      19          19  19              18  18  18                                  kill col 34  Tbl  13 cols 0111111011011000111111111010110011100011111111 has  18 unique lines.
 *  17                          17          17          17  16  16                                      16      17          17  17              16  16  17                                  kill col 31  Tbl  12 cols 0111111011011010111111111010110011100011111111 has  16 unique lines.
Possible good candidates for removal, columns : 8 9 10 20 30 
 *
 * Round 1: 1000000100100101000000000101001100011100000000  4 columns for indexes to table representing 12 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 38
 * 206 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x 206 203 206 206 206 206   x 206 206   x 206 206   x 206   x 206 206 206 206 205 206 204 205 206   x 204   x 206 206   x   x 205 203 204   x   x   x 205 206 205 206 206 205 204 205  kill col 43  Tbl  33 cols 1010000100100101000000000101001100011100000000 has 203 unique lines.
 *   x 203     203 203 203 203   x 203 203   x 203 203   x 203   x 203 203 203 203 202 203 201 202 203   x 200   x 203 203   x   x 202 200 201   x   x   x 202 203 202 203 203 202 201 202  kill col 19  Tbl  32 cols 1010000100100101000000000111001100011100000000 has 200 unique lines.
 *   x 200     200 200 200 200   x 200 200   x 200 200   x 200   x 200 200 200 200 199 200 198 199 200   x       x 200 200   x   x 199 197 198   x   x   x 199 200 199 200 200 199 198 199  kill col 12  Tbl  31 cols 1010000100100101000000000111001101011100000000 has 197 unique lines.
 *   x 197     196 197 197 197   x 197 197   x 197 197   x 197   x 197 197 197 197 195 197 195 194 197   x       x 197 197   x   x 195     195   x   x   x 196 197 196 197 197 196 195 196  kill col 22  Tbl  30 cols 1010000100100101000000010111001101011100000000 has 194 unique lines.
 *   x 194     193 194 194 194   x 194 194   x 194 194   x 194   x 194 194 194 194 193 193 192     194   x       x 194 194   x   x 191     192   x   x   x 193 193 192 194 194 193 192 192  kill col 13  Tbl  29 cols 1010000100100101000000010111001111011100000000 has 191 unique lines.
 *   x 191     190 191 191 191   x 191 191   x 191 191   x 191   x 191 191 191 191 190 190 189     191   x       x 191 191   x   x         188   x   x   x 190 190 189 190 191 190 189 189  kill col 11  Tbl  28 cols 1010000100100101000000010111001111111100000000 has 188 unique lines.
 *   x 188     183 188 188 188   x 188 188   x 188 188   x 188   x 188 188 188 188 187 187 186     188   x       x 188 186   x   x               x   x   x 187 186 186 186 188 187 185 186  kill col 42  Tbl  27 cols 1011000100100101000000010111001111111100000000 has 183 unique lines.
 *   x 183         183 183 183   x 183 183   x 183 183   x 183   x 183 183 183 183 182 182 181     183   x       x 183 181   x   x               x   x   x 182 181 179 181 183 181 180 180  kill col  5  Tbl  26 cols 1011000100100101000000010111001111111100100000 has 179 unique lines.
 *   x 179         179 179 179   x 179 179   x 179 178   x 179   x 179 179 179 179 178 177 175     179   x       x 179 175   x   x               x   x   x 171 177     176 178 174 173 174  kill col  7  Tbl  25 cols 1011000100100101000000010111001111111110100000 has 171 unique lines.
 *   x 171         171 171 171   x 171 171   x 171 170   x 171   x 171 170 171 171 170 166 168     171   x       x 170 166   x   x               x   x   x     169     167 167 163 163 166  kill col  2  Tbl  24 cols 1011000100100101000000010111001111111110100100 has 163 unique lines.
 *   x 163         163 163 163   x 163 163   x 163 161   x 163   x 163 162 162 163 160 158 158     161   x       x 161 158   x   x               x   x   x     158     159 157     156 157  kill col  1  Tbl  23 cols 1011000100100101000000010111001111111110100110 has 156 unique lines.
 *   x 154         156 156 156   x 156 156   x 155 153   x 156   x 155 155 155 156 153 150 149     153   x       x 154 146   x   x               x   x   x     145     146 144         146  kill col  3  Tbl  22 cols 1011000100100101000000010111001111111110101110 has 144 unique lines.
 *   x 141         144 144 144   x 144 144   x 142 141   x 144   x 143 143 143 142 138 135 136     139   x       x 140 133   x   x               x   x   x     125     127             124  kill col  0  Tbl  21 cols 1011000100100101000000010111001111111110101111 has 124 unique lines.
 *   x 121         124 123 124   x 124 124   x 121 121   x 124   x 123 123 123 121 115 113 115     120   x       x 120 112   x   x               x   x   x     101     104                  kill col  6  Tbl  20 cols 1011000100100101000000010111001111111111101111 has 101 unique lines.
 *   x  97         101 100 101   x 101 100   x  99  98   x 100   x 100  99  99  97  90  91  93      97   x       x  96  90   x   x               x   x   x              78                  kill col  4  Tbl  19 cols 1011000100100101000000010111001111111111111111 has  78 unique lines.
 *   x  75          78  77  78   x  78  77   x  75  76   x  76   x  76  75  75  74  70  71  71      73   x       x  71  68   x   x               x   x   x                                  kill col 16  Tbl  18 cols 1011000100100101000000010111011111111111111111 has  68 unique lines.
 *   x  64          68  67  68   x  68  67   x  65  67   x  66   x  66  65  64  64  61  61  62      62   x       x  59       x   x               x   x   x                                  kill col 17  Tbl  17 cols 1011000100100101000000010111111111111111111111 has  59 unique lines.
 *   x  55          59  58  59   x  59  58   x  56  58   x  56   x  56  56  56  55  51  51  52      54   x       x           x   x               x   x   x                                  kill col 25  Tbl  16 cols 1011000100100101000010010111111111111111111111 has  51 unique lines.
 *   x  47          51  50  51   x  51  50   x  48  49   x  48   x  47  49  48  47      45  44      45   x       x           x   x               x   x   x                                  kill col 23  Tbl  15 cols 1011000100100101000010110111111111111111111111 has  44 unique lines.
 *   x  41          43  43  43   x  44  43   x  41  42   x  41   x  39  41  40  40      38          38   x       x           x   x               x   x   x                                  kill col 24  Tbl  14 cols 1011000100100101000011110111111111111111111111 has  38 unique lines.
 *   x  36          37  36  37   x  37  37   x  35  35   x  35   x  32  33  33  32                  34   x       x           x   x               x   x   x                                  kill col 29  Tbl  13 cols 1011000100100101100011110111111111111111111111 has  32 unique lines.
 *   x  30          31  30  28   x  31  31   x  30  29   x  29   x      26  28  27                  28   x       x           x   x               x   x   x                                  kill col 28  Tbl  12 cols 1011000100100101110011110111111111111111111111 has  26 unique lines.
 *   x  24          25  23  20   x  25  24   x  24  24   x  23   x          24  23                  23   x       x           x   x               x   x   x                                  kill col 39  Tbl  11 cols 1011001100100101110011110111111111111111111111 has  20 unique lines.
 *   x  18          19  18       x  19  18   x  19  19   x  18   x          18  17                  18   x       x           x   x               x   x   x                                  kill col 26  Tbl  10 cols 1011001100100101110111110111111111111111111111 has  17 unique lines.
 *   x  15          15  15       x  16  15   x  16  16   x  14   x          15                      15   x       x           x   x               x   x   x                                  kill col 31  Tbl   9 cols 1011001100100111110111110111111111111111111111 has  14 unique lines.
Possible good candidates for removal, columns : 21 
 *
 * Round 2: 0100110011011000001000001000000000000000000000  4 columns for indexes to table representing  9 original columns (uses 14 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 33
 * 206 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x   x 203 206   x   x 206   x   x   x   x   x   x   x 206   x 206 206   x 205 204 206 203 205   x   x 204   x 206 206   x   x 205 203 204   x   x   x 205 205 205 206 206 205 203 205  kill col 43  Tbl  24 cols 1110110111111101001000001101001100011100000000 has 203 unique lines.
 *   x   x     203   x   x 203   x   x   x   x   x   x   x 203   x 203 203   x 202 201 203 200 202   x   x 200   x 203 203   x   x 202 200 201   x   x   x 202 202 202 203 203 202 200 202  kill col 23  Tbl  23 cols 1110110111111101001000101101001100011100000000 has 200 unique lines.
 *   x   x     200   x   x 200   x   x   x   x   x   x   x 200   x 200 200   x 199 197 200     199   x   x 197   x 200 200   x   x 199 197 198   x   x   x 199 199 199 200 200 198 197 199  kill col 25  Tbl  22 cols 1110110111111101001010101101001100011100000000 has 197 unique lines.
 *   x   x     197   x   x 197   x   x   x   x   x   x   x 197   x 197 197   x 196     196     195   x   x 194   x 197 197   x   x 196 193 195   x   x   x 195 196 196 195 197 194 194 196  kill col 12  Tbl  21 cols 1110110111111101001010101101001101011100000000 has 193 unique lines.
 *   x   x     192   x   x 193   x   x   x   x   x   x   x 193   x 193 193   x 192     192     190   x   x 190   x 193 193   x   x 191     191   x   x   x 191 192 192 191 193 190 190 192  kill col 22  Tbl  20 cols 1110110111111101001010111101001101011100000000 has 190 unique lines.
 *   x   x     189   x   x 190   x   x   x   x   x   x   x 190   x 190 190   x 189     188           x   x 187   x 190 190   x   x 187     188   x   x   x 188 188 188 188 189 187 185 188  kill col  1  Tbl  19 cols 1110110111111101001010111101001101011100000010 has 185 unique lines.
 *   x   x     184   x   x 185   x   x   x   x   x   x   x 185   x 185 185   x 184     182           x   x 182   x 185 185   x   x 182     183   x   x   x 183 179 180 183 180 182     182  kill col  6  Tbl  18 cols 1110110111111101001010111101001101011101000010 has 179 unique lines.
 *   x   x     177   x   x 179   x   x   x   x   x   x   x 179   x 179 179   x 177     174           x   x 176   x 179 177   x   x 175     176   x   x   x 176     174 174 172 173     172  kill col  3  Tbl  17 cols 1110110111111101001010111101001101011101001010 has 172 unique lines.
 *   x   x     169   x   x 172   x   x   x   x   x   x   x 172   x 172 172   x 170     162           x   x 168   x 171 170   x   x 167     166   x   x   x 166     160 162     160     160  kill col  5  Tbl  16 cols 1110110111111101001010111101001101011101101010 has 160 unique lines.
 *   x   x     154   x   x 160   x   x   x   x   x   x   x 160   x 159 160   x 156     144           x   x 156   x 158 156   x   x 151     152   x   x   x 148         149     144     145  kill col 24  Tbl  15 cols 1110110111111101001011111101001101011101101010 has 144 unique lines.
 *   x   x     137   x   x 144   x   x   x   x   x   x   x 143   x 143 141   x 140                   x   x 140   x 137 140   x   x 134     134   x   x   x 128         132     126     127  kill col  2  Tbl  14 cols 1110110111111101001011111101001101011101101110 has 126 unique lines.
 *   x   x     118   x   x 125   x   x   x   x   x   x   x 125   x 122 123   x 121                   x   x 121   x 118 120   x   x 116     117   x   x   x 105         110             105  kill col  7  Tbl  13 cols 1110110111111101001011111101001101011111101110 has 105 unique lines.
 *   x   x      97   x   x 104   x   x   x   x   x   x   x 102   x 100 100   x  96                   x   x 100   x  94  95   x   x  94      97   x   x   x              84              81  kill col  0  Tbl  12 cols 1110110111111101001011111101001101011111101111 has  81 unique lines.
 *   x   x      73   x   x  80   x   x   x   x   x   x   x  78   x  76  75   x  73                   x   x  76   x  72  68   x   x  71      74   x   x   x              60                  kill col  4  Tbl  11 cols 1110110111111101001011111101001101011111111111 has  60 unique lines.
 *   x   x      53   x   x  59   x   x   x   x   x   x   x  58   x  54  54   x  53                   x   x  55   x  51  48   x   x  52      54   x   x   x                                  kill col 16  Tbl  10 cols 1110110111111101001011111101011101011111111111 has  48 unique lines.
 *   x   x      42   x   x  46   x   x   x   x   x   x   x  45   x  43  41   x  42                   x   x  42   x  37       x   x  38      40   x   x   x                                  kill col 17  Tbl   9 cols 1110110111111101001011111101111101011111111111 has  37 unique lines.
 *   x   x      30   x   x  34   x   x   x   x   x   x   x  33   x  30  30   x  32                   x   x  32   x           x   x  29      30   x   x   x                                  kill col 13  Tbl   8 cols 1110110111111101001011111101111111011111111111 has  29 unique lines.
 *   x   x      22   x   x  26   x   x   x   x   x   x   x  25   x  24  23   x  24                   x   x  24   x           x   x          23   x   x   x                                  kill col 42  Tbl   7 cols 1111110111111101001011111101111111011111111111 has  22 unique lines.
 *   x   x           x   x  19   x   x   x   x   x   x   x  19   x  17  15   x  17                   x   x  18   x           x   x          17   x   x   x                                  kill col 28  Tbl   6 cols 1111110111111101011011111101111111011111111111 has  15 unique lines.
Possible good candidates for removal, columns : 19 
 *
 * Round 3: 0000001000000010100100000010000000100000000000  4 columns for indexes to table representing  6 original columns (uses 15 of 16 lines in indirect table).
 * Direct:  0011000000000000010011110000110011000011111111 19 columns
 * Can even chose 1 more column to be represented directly.
 * Success. Use 2 EBRs, 26 LUTs.
 */

module v15_m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
/* verilator lint_off UNOPTFLAT */
   output [47:0] d
/* verilator lint_on UNOPTFLAT */
   );
   /*
    *                      indirect_index 2
    *                      | indirect_index 1
    * inx         next     | | indirect index 0
    * || ucode    ucode    | | | direct representation
    * 00 LB_0     LB_1     0 0 0 00000000000001011011| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 1 00010001000100010111|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 2 00100010001001011011| IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0
    * 03 _L0x03   StdIncPc 3 3 2 00110011001000000101| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 4 3 2 01000011001001100101| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   3 3 2 00110011001000000000| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 06 LB_3     LB_4     0 3 2 00000011001000001101|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     1 3 2 00010011001000001011|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     5 3 0 01010011000001011101| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     0 3 2 00000011001000001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     5 3 0 01010011000001011101| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JALR_3   0 3 3 00000011001101000101|        Q=1. Prep legalize target
    * 0c ADD_0    ADDI_0   1 3 2 00010011001000011101| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    3 3 2 00110011001010011101| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    3 3 2 00110011001000011101| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 4 3 2 01000011001000100101| LUI    q = imm20
    * 10 SUB_1    LB_6     0 3 2 00000011001000011111|        Q = ~RS2
    * 11 AND_1    ANDI_1   0 3 2 00000011001000011101|        RS1^0xffffffff to Q
    * 12 straddle Fetchu   6 4 4 01100100010011011010|  Fr10u IncPC, OpFetch
    * 13 condb_2  condb_3  0 3 2 00000011001000011111|        ~RS2 in Q
    * 14 condb_3  condb_4  0 3 3 00000011001101011001|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  1 3 5 00010011010100000001|        Branch on condition
    * 16 condb_5  StdIncPc 3 3 2 00110011001000000001|        Branch not taken.
    * 17 condb_5t condb_6t 7 3 2 01110011001000100000|        Branch taken. yy=oldPC incase of access error
    * 18 BEQ      condb_2  5 3 2 01010011001000111101| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   5 5 2 01010101001001000000| JALR   (tmp) Prep pc=RS1+imm (target)
    * 1a ANDI_1   StdIncPc 8 3 2 10000011001000100101|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    3 3 2 00110011001000000000| JAL. J-imm is in q. Prep get isntradr from jj
    * 1c ECAL_BRK ECAL_RET 2 3 2 00100011001000010110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 8 3 2 10000011001000100101|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 3 3 3 00110011001111010101|        Q = 4
    * 1f IJ_2     IJ_3     5 5 2 01010101001000000000|        Read word is to be masked with lsb = 0
    * 20 LH_0     LH_1     9 0 0 10010000000001111011| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 4 3 2 01000011001000100101|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  0 3 6 00000011011000010101|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 _L0x23   StdIncPc 3 3 2 00110011001000000101| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   0 6 0 00000110000000011110| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   3 3 2 00110011001000000000| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 26 OR_1     OR_2     5 3 2 01010011001000011101|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    0 3 2 00000011001001000001|        Q = rs2
    * 28 _L0x28   SH_1     9 3 0 10010011000001011101| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   0 3 2 00000011001000011101|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     9 3 0 10010011000001011101| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  0 3 3 000000110011010xxxx1|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    3 3 2 00110011001000011100| SLL    Shift left
    * 2d MULH_0   MULH_1   1 6 2 00010110001000010101| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e MULHU_1  MULHU_2  5 3 2 01010011001010011111|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 2f _L0x2f   StdIncPc 4 3 2 01000011001000100101| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 4 3 7 01000011011100100101|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  0 3 2 00000011001000011111|        ~rs2 to Q
    * 32 JAL_1    JAL_2    7 3 2 01110011001000100000|      Prep Instradr to yy. Refetch instradr
    * 33 JALR_3   JAL_25   7 5 2 01110101001000000001|        Q = (RS1+imn) & 0xfffffffe
    * 34 JAL_3    Fetch    7 4 2 01110100001000011010|      Prep fetch next instr.
    * 35 SLLI_1   SLLI_2   8 6 2 10000110001000110111|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   8 7 2 10000111001000110111|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  a 3 5 101000110101001xxxx1|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  5 3 2 01010011001000111101| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 8 3 2 10000011001010100101|        Last shift.
    * 3a SRxI_1   SRxI_2   8 6 6 10000110011000110101|        Register to shift to Q
    * 3b _L0x3b   JAL_1    3 3 2 00110011001000000000| JAL. J-imm is in q. Prep get isntradr from jj
    * 3c CSRRW_0  CSRRW_1  5 3 2 01010011001000101101| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   8 7 6 10000111011000110101|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   1 6 0 00010110000000011110|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   1 6 0 00010110000000011110|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     2 0 8 00100000100001011011| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   7 3 2 01110011001000110101|        yy=jj. Prep get Q=1
    * 42 MULHU_2  MULHU_3  0 6 6 00000110011000010101|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  0 3 2 00000011001000000000|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  0 3 2 00000011001000011111| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    0 3 3 00000011001101010101|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    a 3 2 10100011001000110100|        Store PC to mepc
    * 47 ILL_2    ILL_3    a 5 2 10100101001000110101|        Store 0 to mtval
    * 48 _L0x48   SW_1     2 8 8 00101000100001011101| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  0 3 3 00000011001101000001|        Construct PC storage adr
    * 4a _L0x4a   SW_1     2 8 8 00101000100001011101| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  b 9 2 10111001001000010100|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   3 3 2 00110011001000011101| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  7 6 2 01110110001000111101| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     3 3 2 001100110010000xxxx0| Illegal instruction seen
    * 4f MRET_8   MRET_9   3 3 3 00110011001111010101|        +4, so now 0x103
    * 50 LW_1     StdIncPc 8 1 9 10000001100100110111|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   c 5 2 11000101001000110100|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 1 00010001000100010111|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   c 5 2 11000101001000110100|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     1 7 6 00010111011000010101|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 c 5 2 11000101001000110101|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 3 2 00010011001000010001|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     0 3 2 00000011001000010001|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    1 3 6 00010011011011010111|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   5 3 2 01010011001000111111|        REM = Q to yy
    * 5a SB_1     SB_2     7 6 2 01110110001000110111|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    3 3 2 00110011001000000000| JAL. J-imm is in q. Prep get isntradr from jj
    * 5c CSRRS_0  CSRRW_1  5 3 2 01010011001000101101| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     7 7 2 01110111001000110111|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 1 00010001000100010111|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   c 5 2 11000101001000110100|  err   LD AlignFault. Faulting adr to mtval
    * 60 MULHU_3  MULHU_2  1 3 2 00010011001010011111|        Shift Q and rM. Prepare read rs1
    * 61 EBRKWFI2 EBREAK_1 5 3 5 01010011010100101101| EBREAK/WFI2 Select EBREAK or WFI.
    * 62 DIV_8    DIV_7    0 6 3 00000110001101010111|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    0 a 3 00001010001101010111|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  0 3 2 00000011001000011111| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    3 3 5 00110011010100000001|        Prepare read PC.
    * 66 SW_1     SW_2     b 5 2 10110101001000011100|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    c 5 2 11000101001000100100|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 8 3 2 10000011001000100101|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     0 3 2 00000011001000010101|        RS2 > 0, RS1 < 0, change sign yy
    * 6a MULH_1   MULH_2   5 3 2 01010011001000110101|        Store ~rs1 to Ryy. Prep construct 1.
    * 6b SB_4     SB_5     1 b 2 00011011001000011001|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   3 3 2 00110011001000011101| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  7 6 2 01110110001000111101| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e DIV_C    DIV_e    7 3 2 01110011001000111100|        rM to yy. Q=ffffffff
    * 6f MRET_6   MRET_7   0 3 3 000000110011010xxxx1|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    1 7 6 00010111011000010101|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 c 5 2 11000101001000110101|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   0 3 2 00000011001000001101|        Invert q. Prepare read mask
    * 73 unalignd straddle 0 3 2 00000011001000000101|  Fr10u Unaligned pc, prep read high hword
    * 74 MRET_9   Fetch    5 4 3 01010100001101011010|        +1, IncPC, OpFetch next
    * 75 IJ_5     Fetch    7 4 2 01110100001000011010|        Mask and use as PC
    * 76 Fetchu   Fetch2u  0 3 a 00000011101000000111|  Fr10u Read and latch instruction
    * 77 eFetchu  Fetch2u  0 1 b 00000001101100010111|  Fr10u rep Read until d=mem[(rs1+ofs) & ~3u]
    * 78 DIV_4    DIV_6    5 3 2 01010011001000100001|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    0 3 3 00000011001111010101|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     8 5 2 10000101001000011000|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    3 3 2 00110011001000000000| JAL. J-imm is in q. Prep get isntradr from jj
    * 7c CSRRC_0  CSRRW_1  5 3 2 01010011001000101101| CSRRC  Decoded CSR adr in yy
    * 7d condb_6t Fetch    5 4 2 01010100001001011010|        Branch taken.
    * 7e NMI_1    NMI_2    a 3 2 101000110010001xxxx1|        Store pc to mepc.
    * 7f unx7f             d 6 0 11010110000000xxxxxx| 7f: Not in use 
    * 80 LBU_0    LBU_1    0 0 0 00000000000001011011| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 unx81             d 6 0 11010110000000xxxxxx| 81: Not in use 
    * 82 DIV_1    DIV_3    5 3 2 01010011001000011101|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    0 3 2 00000011001001010101|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   0 3 2 00000011001000011111| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 1 00010001000100010111|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   5 5 2 01010101001001000001|      Prep pc = jj + ofs
    * 87 unx87             d 6 0 11010110000000xxxxxx| 87: Not in use 
    * 88 DIV_E    DIV_10   3 a 2 00111010001010011110|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 4 3 2 01000011001000100101|        RS2 == 0, return 0xffffffff
    * 8a DIVU_5   ANDI_1   3 3 6 00110011011011010111|        Transfer rM to rDee
    * 8b LB_6     StdIncPc 4 3 3 01000011001111100101|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    3 3 2 00110011001000011111| XOR    xor
    * 8d DIV_0    DIV_1    1 c 2 00011100001010010111| DIV    Branch on sign dividend RS1
    * 8e _LCSRRS_1 ILLe     3 3 2 001100110010000xxxx0| Illegal instruction seen
    * 8f ILL_3    ILL_4    0 3 3 00000011001100010101|        Q = 1
    * 90 NMI_2    JAL_3    c d 2 11001101001000101001|        mtval = 0.
    * 91 LDAF_2   LDAF_3   6 d 3 01101101001111100100|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    a 3 2 10100011001000110010|        PC to mepc
    * 93 SW_E2    SW_E3    a 3 2 10100011001000110111|        Store address that faulted
    * 94 SW_E4    JAL_3    7 d 2 01111101001000110010|        Store 6 to mcause
    * 95 SW_E3    SW_E4    3 3 3 00110011001111010111|        Q = 3
    * 96 SH_1     SH_2     7 6 2 01110110001000110111|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    c 5 2 11000101001000100100|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  5 3 2 01010011001000111101| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     3 3 2 001100110010000xxxx0|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    6 d 2 01101101001001110010|        mcause = 11
    * 9b SH_4     SH_5     e 8 2 11101000001000011001|        Address back to Q. Prepare get item to write
    * 9c DIV_10   DIV_12   1 a 2 00011010001010011001|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   1 a 2 00011010001010011001|        RS2 < 0. Branch on sign of RS1
    * 9e JAL_25   JAL_3    d 3 4 11010011010011100101|      Prep WTRG = jj+2/4 (return adr)
    * 9f SH_5     SW_2     b 3 2 10110011001000011000|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    9 0 0 10010000000001111011| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  3 3 3 00110011001111010101|        Q = 4
    * a2 DIV_14   LB_6     0 3 2 00000011001000010101|        RS2 < 0, RS1 >= 0, change sign yy
    * a3 DIV_15   StdIncPc 8 3 2 10000011001000100101|        RS2 < 0, RS1 < 0, yy is true result
    * a4 SRxI_0   SRxI_1   0 6 0 00000110000000011110| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   0 3 3 00000011001101001101|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  2 3 8 00100011100000010110| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 0 3 2 000000110010010xxxx1| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    0 a 2 00001010001010010101|        Branch on sign divisor RS2
    * a9 ILL_4    JAL_3    5 d 3 01011101001101110010|        Store 2 to mcause
    * aa DIV_6    DIV_7    3 3 2 00110011001010010111|        Write M. Prepare shift
    * ab EBREAK_2 ECALL_6  a 3 2 10100011001000110101|        pc to mepc
    * ac _L0xac   SRx_1    3 3 2 00110011001000011100| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   3 6 2 00110110001010011101| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _L0xae   SRx_1    3 3 2 00110011001000011100| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   0 3 3 000000110011010xxxx1|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   6 d 2 01101101001001100100|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  3 3 3 00110011001111010101|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    6 4 3 01100100001111011010|        IncPC, OpFetch, but force +4
    * b3 unxb3             d 6 0 11010110000000xxxxxx| b3: Not in use 
    * b4 eFetch3  unalignd c 3 c 11000011110001011111|  Fr11  Write minstret. Update I. Q=immediate, use dinx
    * b5 SH_3     SH_4     0 3 2 00000011001000000001|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  3 3 3 00110011001111010101|        Q = 8
    * b7 IJ_3     IJ_4     7 3 2 01110011001000110101|        Store present PC in case of access error
    * b8 BGE      condb_2  5 3 2 01010011001000111101| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    0 3 3 00000011001100011001|        Calc carry of RS2+0xFFFFFFFF
    * ba LHU_3    ANDI_1   0 3 2 00000011001000001111|        Invert q. Prepare read mask
    * bb SH_2     SH_3     7 7 2 01110111001000110111|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  5 3 2 01010011001000101101| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     IJ_5     0 3 3 00000011001101000101|        Construct Q = 1
    * be IJ_1     IJ_2     1 1 2 00010001001000010111|        Read until q=mem[(rs1+ofs)&~1u]
    * bf IJT_1    IJT_2    1 1 2 00010001001000010111|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    1 3 5 00010011010100011101|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    5 3 2 01010011001000110101|        Read word is to be masked with ~1u
    * c2 DIVU_3   DIVU_2   0 6 3 00000110001101010111|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   0 a 3 00001010001101010111|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    5 3 2 01010011001000011111| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   0 3 2 00000011001000000001|        ~302
    * c6 IJT_4    ILL_2    a 3 2 10100011001000110101|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   a 3 2 101000110010001xxxx1|        Store pc to mepc.
    * c8 DIV_7    DIV_8    1 3 d 00010011110110011001|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   3 3 2 00110011001001001101|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   1 3 d 00010011110110011001|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc c d 2 11001101001000101001|        mtval = 0.
    * cc OR_0     OR_1     3 3 2 00110011001000011111| OR     or
    * cd REM_0    DIV_1    1 c 2 00011100001010010111| REM    Branch on sign dividend RS1
    * ce _LCSRRCI_1 ILLe     3 3 2 001100110010000xxxx0| Illegal instruction seen
    * cf MRET_7   MRET_8   3 3 5 00110011010100001101|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  0 3 3 00000011001101000001| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   5 3 2 01010011001000001101| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     1 7 6 00010111011000010101|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 c 5 2 11000101001000110101|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   5 d 3 01011101001101100100|        Store 5 to mcause
    * d5 Fetch2u           c 5 e 11000101111001011111|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * d6 eILL0c   ILLe     3 3 2 001100110010000xxxx0| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  c 5 2 11000101001000110101|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  5 3 2 01010011001000111101| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  3 3 2 00110011001010011111|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   3 3 2 00110011001000010101|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   5 5 3 01010101001101111000|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  5 3 2 01010011001000101101| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  c 5 2 11000101001000110101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   5 1 b 01010001101100010111|  Fr11  Read and latch instruction
    * df eFetch   Fetch2   5 1 b 01010001101100010111|  Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   5 3 2 01010011001000110111|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    1 3 2 00010011001000000001|        Q = RS1
    * e2 MUL_1    MUL_2    0 6 6 00000110011000010101|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   3 3 6 00110011011011010111|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   0 3 2 00000011001000011111| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  3 3 3 00110011001111010101|        Q = 4
    * e6 StdIncPc Fetch    6 4 4 01100100010011011010|  Fr11  IncPC, OpFetch
    * e7 aFault   aFault_1 c 5 2 11000101001000110101|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    1 3 2 00010011001010011101|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    0 3 3 00000011001101011001|        Construct Q = 1
    * ea MULHU_5  MULHU_6  0 3 2 00000011001000011001|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     0 3 2 00000011001000001111|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    3 3 2 00110011001000011111| AND    And 
    * ed REMU_0   DIVU_1   3 6 2 00110110001010011101| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     3 3 2 001100110010000xxxx0| Illegal instruction seen
    * ef WFI_5    Fetch    6 4 3 01100100001111011010|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    1 7 6 00010111011000010101|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 c 5 2 11000101001000110101|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 3 2 00110011001000000101|        Prepare read PC
    * f3 aF_SW    aF_SW_1  3 3 2 001100110010000xxxx0|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   eFetch3  c 5 f 11000101111101000011|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 c 5 2 11000101001000110101|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    3 3 3 00110011001111011001| WFI    Chk offset=0x105. Now 0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 c 5 2 11000101001000100001| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  5 3 2 01010011001000111101| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   5 3 3 01010011001101011101|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    0 3 3 00000011001101010101|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     0 3 2 00000011001000000001|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  5 3 2 01010011001000101101| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    3 3 2 00110011001000000101| NMI    Get current PC
    * fe ILLe     ILL_1    3 3 2 00110011001000000100| Illegal
    * ff QINT_0   QINT_1   3 3 2 00110011001000000101| INT    Get current PC
    */
   localparam u0_0 = 256'h56e6d010d0e2d8045c33dc5ab88bdc5aba09da07080454e650e6bcbe79d2bc01;
   localparam u0_1 = 256'h0eb75cd456e66ea6083252e60441d613087d10e618169c15f814ac76d81af88b;
   localparam u0_2 = 256'h56e6f642586ac03e1430dc96d821dc961c1dd0270804e63550e65d3950e6bc52;
   localparam u0_3 = 256'he03ae0355903d6490832593d50e6d61310d77c037836a8de129e0886f82b56e6;
   localparam u0_4 = 256'h5c7400fed02ed03148b1dc661c4bdc66508f40475c65fa2b08ea5d60500bbc50;
   localparam u0_5 = 256'h4eda79707cfbd6490832785df69c796e188b1a57561e59eb4eda79544eda70e6;
   localparam u0_6 = 256'h1ccfc8b9d02ed031987a50f9588b50e64693c8f210effa2b7c587cc8d2f7f842;
   localparam u0_7 = 256'h00001090acded649083288f25ca816aa76d576d5aadeacde5612da1a561e59ba;
   localparam u0_8 = 256'h5ca900fe7882f02954e6711a56e6e09c0000149e79f0fa215c82d0a80000bc85;
   localparam u0_9 = 256'h88f2543490a29068989f243400fed613469378bb7c9424347095203444929634;
   localparam u0_A = 256'h1cc5c03fd0e0c03f509a70c8243458781c616ed0dcafe63a50e6588b5cb6bc5e;
   localparam u0_B = 256'h78c1781f5c75d6497cb5fa1a98c0d61350bd5c9a169bfc730000acde5cb24492;
   localparam u0_C = 256'hd04f00fe7882f02696e69cc2dca59c6210cb5a471a6ff2e17c8a7cca56e9d888;
   localparam u0_D = 256'h76f476f456e5d64984925091f042d61356a100fefc004492561e5906d6c91c37;
   localparam u0_E = 256'hacde00fed0e0f011fa569c229cc6d8e2561eacde5cb0fa1a711a5de8181d70ca;
   localparam u0_F = 256'h50c74046507ed649166b5c45d4d9d61316ab9cfa56db34b408dd50e6561e5972;
   localparam u1_0 = 256'h4322332133291321033453050320530513200320332043263320222511110005;
   localparam u1_1 = 256'h5520333d83222321332083225524532373223320135003350321644d03210321;
   localparam u1_2 = 256'h4322532916213321033493050321930503245321332006013320036143229007;
   localparam u1_3 = 256'h160116018763532233208663832a5323a3528723862374217520732203214372;
   localparam u1_4 = 256'h333d332076233321b921288503342885a523a323033503210320066173232085;
   localparam u1_5 = 256'hc523111177235322332076235323136d03211321c5231761c5231111c5238193;
   localparam u1_6 = 256'h03347323762333211b21532303218322c522b521335003210a35063553521329;
   localparam u1_7 = 256'hd600a3225425532233208521033d532201b103a07421543503200320c5231761;
   localparam u1_8 = 256'h033133201c293321433e336d43223a29d60055241111032103255321d6000005;
   localparam u1_9 = 256'hb321d34e1a291a29e8216d2733205323c5227623333d7d23a323a3236d3ecd22;
   localparam u1_A = 256'h0334332136293321a32333295d370a29032423810334060183220321333d9007;
   localparam u1_B = 256'h112111210334532277230320033153237323333d0320c3c5d600643d333d6d26;
   localparam u1_C = 256'h335033201c293321cd2213d9332413d9a322a323032053210a35063553231351;
   localparam u1_D = 256'h51b151b1c52353225537332133295323c5233320c5e55d36c523176153200334;
   localparam u1_E = 256'h643d3320362933210320032103351329c523644d333d0321336d066113205323;
   localparam u1_F = 256'h33203320332053220320033553355323c522333dc523c5f433203320c5231761;
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
   assign d[8] = indir[8];
   assign d[12] = indir[9];
   assign d[13] = indir[10];
   assign d[16] = indir[11];
   assign d[17] = indir[12];
   assign d[22] = indir[13];
   assign d[23] = indir[14];
   assign d[24] = indir[15];
   assign d[25] = indir[16];
   assign d[28] = indir[17];
   assign d[42] = indir[18];
   assign d[43] = indir[19];
   // replaces = 1000000100100101000000000101001100011000000000
   SB_LUT4 #(.LUT_INIT(16'h1098)) cmb_d09(.O(d[9]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h3018)) cmb_d10(.O(d[10]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d14(.O(d[14]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0c00)) cmb_d15(.O(d[15]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'hc000)) cmb_d18(.O(d[18]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'hfffe)) cmb_d20(.O(d[20]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h5000)) cmb_d30(.O(d[30]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0100)) cmb_d32(.O(d[32]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0802)) cmb_d35(.O(d[35]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0a00)) cmb_d38(.O(d[38]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d45(.O(d[45]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   // replaces = 0100110011011000001000001000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'h2f3f)) cmb_d21(.O(d[21]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2a30)) cmb_d27(.O(d[27]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0012)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0080)) cmb_d34(.O(d[34]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2004)) cmb_d36(.O(d[36]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2200)) cmb_d37(.O(d[37]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0915)) cmb_d40(.O(d[40]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0900)) cmb_d41(.O(d[41]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1400)) cmb_d44(.O(d[44]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0000001000000010100100000010000000100000000000
   SB_LUT4 #(.LUT_INIT(16'h4d82)) cmb_d11(.O(d[11]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h5fb7)) cmb_d19(.O(d[19]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h5c00)) cmb_d26(.O(d[26]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h16e0)) cmb_d29(.O(d[29]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0204)) cmb_d31(.O(d[31]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h400f)) cmb_d39(.O(d[39]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
