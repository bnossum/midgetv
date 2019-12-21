/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has  42 columns
 * Removed:  000000000000000000000000000000000000000000 These are treated already, removed from consideration
 * Reserved: 000000000000000000000000000000010000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 42
 * 176 distinct lines in remaining untreated columns
 * c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 174 176 174 176 176 176 176 175 176 176 176 176 176 176 176 176 176 176 176 176 176 176 175 176 175 176 176 175 176 176 173   x 176 176 176 176 173 171 175 176 175 176  kill col  4  Tbl  40 cols 000000000000000000000000000000010000010000 has 171 unique lines.
 * 169 171 169 171 171 171 171 170 171 171 171 171 171 171 171 171 171 171 171 171 171 171 170 171 169 171 171 168 171 171 168   x 171 171 171 171 168     169 170 170 171  kill col  5  Tbl  39 cols 000000000000000000000000000000010000110000 has 168 unique lines.
 * 166 168 166 168 168 168 168 167 168 168 168 168 168 168 168 168 168 168 168 168 168 168 167 168 166 168 168 165 168 168 165   x 168 168 168 168         164 167 167 168  kill col  3  Tbl  38 cols 000000000000000000000000000000010000111000 has 164 unique lines.
 * 162 164 162 164 164 164 163 163 164 164 164 164 164 164 164 164 164 164 164 164 164 164 163 164 162 164 164 161 164 164 160   x 164 164 164 164             163 163 164  kill col 11  Tbl  37 cols 000000000000000000000000000000110000111000 has 160 unique lines.
 * 158 160 158 160 160 159 159 159 160 160 160 160 160 160 160 160 160 160 160 160 160 160 159 160 158 160 160 157 160 160       x 160 160 160 160             159 159 160  kill col 14  Tbl  36 cols 000000000000000000000000000100110000111000 has 157 unique lines.
 * 155 157 154 156 157 156 156 155 157 157 157 157 157 157 157 157 157 157 157 157 157 157 156 157 156 157 157     157 157       x 157 157 157 157             156 156 156  kill col 39  Tbl  35 cols 001000000000000000000000000100110000111000 has 154 unique lines.
 * 151 154     153 152 152 150 151 154 154 154 154 154 154 154 154 154 154 154 154 154 154 153 154 153 154 154     154 154       x 154 154 154 154             153 153 153  kill col 35  Tbl  34 cols 001000100000000000000000000100110000111000 has 150 unique lines.
 * 146 150     147 146 147     145 150 150 150 150 150 150 150 150 150 150 150 150 150 150 149 150 148 150 149     150 150       x 150 148 150 150             149 149 149  kill col 34  Tbl  33 cols 001000110000000000000000000100110000111000 has 145 unique lines.
 * 140 142     140 141 141         145 145 145 145 145 145 145 145 145 145 145 145 145 145 144 144 142 144 144     145 145       x 145 142 145 145             144 144 144  kill col 38  Tbl  32 cols 001100110000000000000000000100110000111000 has 140 unique lines.
 * 134 135         133 134         140 140 140 140 140 140 140 140 140 140 140 140 140 140 138 139 136 138 138     140 140       x 140 135 140 140             139 139 139  kill col 37  Tbl  31 cols 001110110000000000000000000100110000111000 has 133 unique lines.
 * 125 125             121         133 133 133 133 133 133 133 133 133 133 133 133 133 133 131 132 127 131 129     133 133       x 131 129 133 132             132 132 131  kill col 36  Tbl  30 cols 001111110000000000000000000100110000111000 has 121 unique lines.
 * 111 109                         121 121 121 121 121 121 121 117 121 121 121 121 121 119 119 120 114 118 116     121 121       x 118 117 121 118             120 120 119  kill col 40  Tbl  29 cols 011111110000000000000000000100110000111000 has 109 unique lines.
 *  94                             109 109 109 109 109 109 109 105 109 108 109 109 106 107 107 108 101 104 102     109 109       x 103 103 109 106             108 108 107  kill col 41  Tbl  28 cols 111111110000000000000000000100110000111000 has  94 unique lines.
 *                                  94  94  94  94  94  94  94  91  94  93  93  94  91  91  92  93  83  84  85      94  94       x  86  87  94  90              93  93  92  kill col 17  Tbl  27 cols 111111110000000000000000100100110000111000 has  83 unique lines.
 *                                  83  83  83  83  83  83  83  80  82  82  81  83  80  81  81  82      74  72      83  83       x  75  76  83  78              82  82  81  kill col 15  Tbl  26 cols 111111110000000000000000101100110000111000 has  72 unique lines.
 *                                  71  72  72  72  72  72  72  69  71  71  70  72  69  69  69  70      63          72  72       x  67  66  72  67              71  71  70  kill col 16  Tbl  25 cols 111111110000000000000000111100110000111000 has  63 unique lines.
 *                                  62  63  62  63  62  63  63  60  62  62  61  63  59  61  60  61                  63  63       x  58  57  63  59              62  62  61  kill col  8  Tbl  24 cols 111111110000000000000000111100110100111000 has  57 unique lines.
 *                                  56  56  56  57  56  57  57  54  56  56  55  57  53  55  54  55                  55  56       x  53      57  54              56  56  55  kill col  9  Tbl  23 cols 111111110000000000000000111100111100111000 has  53 unique lines.
 *                                  52  51  52  53  52  52  53  50  52  52  51  53  48  51  50  49                  51  52       x          53  50              52  52  51  kill col 21  Tbl  22 cols 111111110000000000001000111100111100111000 has  48 unique lines.
 *                                  47  46  45  48  47  47  48  46  47  47  46  48      45  44  43                  46  47       x          48  45              47  47  46  kill col 18  Tbl  21 cols 111111110000000000001001111100111100111000 has  43 unique lines.
 *                                  42  41  40  43  42  42  43  41  42  42  41  43      40  39                      41  42       x          43  40              42  42  41  kill col 19  Tbl  20 cols 111111110000000000001011111100111100111000 has  39 unique lines.
 *                                  38  37  35  39  38  38  39  37  38  38  37  39      37                          37  38       x          39  36              38  38  37  kill col 31  Tbl  19 cols 111111110010000000001011111100111100111000 has  35 unique lines.
 *                                  34  31      35  34  34  35  33  34  34  33  34      30                          33  33       x          35  33              34  34  33  kill col 20  Tbl  18 cols 111111110010000000001111111100111100111000 has  30 unique lines.
 *                                  28  25      29  29  28  30  28  28  29  27  29                                  28  26       x          30  29              29  29  28  kill col 32  Tbl  17 cols 111111110110000000001111111100111100111000 has  25 unique lines.
 *                                  23          24  24  23  25  23  23  24  23  24                                  23  22       x          25  24              24  24  23  kill col 12  Tbl  16 cols 111111110110000000001111111101111100111000 has  22 unique lines.
 *                                  20          21  21  20  22  20  20  21  21  21                                  21           x          22  21              21  21  20  kill col  0  Tbl  15 cols 111111110110000000001111111101111100111001 has  20 unique lines.
 *                                  18          19  19  18  19  19  18  19  19  19                                  19           x          20  19              19  19      kill col 25  Tbl  14 cols 111111110110000010001111111101111100111001 has  18 unique lines.
 *                                  16          17  17  16  17  17      17  17  17                                  17           x          18  17              17  17      kill col 28  Tbl  13 cols 111111110110010010001111111101111100111001 has  16 unique lines.
 *
 * Round 1: 000000001001101101110000000010000011000110  4 columns for indexes to table representing 13 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 33
 * 172 distinct lines in remaining untreated columns
 * c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 170 172 170 172 172 172 172 171   x 172 172   x   x 171   x   x 172   x   x   x 172 172 171 172 171 172 172 171   x 172 168   x 172 172   x   x 169 167 170   x   x 172  kill col  4  Tbl  27 cols 000000001001101101110000000010010011010110 has 167 unique lines.
 * 165 167 165 167 167 167 167 166   x 167 167   x   x 166   x   x 167   x   x   x 167 167 166 167 165 167 167 164   x 167 163   x 167 167   x   x 164     164   x   x 167  kill col 11  Tbl  26 cols 000000001001101101110000000010110011010110 has 163 unique lines.
 * 161 163 161 163 163 162 163 162   x 163 163   x   x 162   x   x 163   x   x   x 163 163 162 163 161 163 163 160   x 163       x 163 163   x   x 160     160   x   x 163  kill col  3  Tbl  25 cols 000000001001101101110000000010110011011110 has 160 unique lines.
 * 158 160 158 160 160 159 159 159   x 160 160   x   x 159   x   x 160   x   x   x 160 160 159 160 158 160 160 157   x 160       x 160 160   x   x 152           x   x 160  kill col  5  Tbl  24 cols 000000001001101101110000000010110011111110 has 152 unique lines.
 * 150 151 150 152 152 151 151 151   x 152 152   x   x 151   x   x 152   x   x   x 152 152 151 152 150 152 152 149   x 152       x 152 152   x   x               x   x 152  kill col 14  Tbl  23 cols 000000001001101101110000000110110011111110 has 149 unique lines.
 * 147 148 146 148 149 148 148 147   x 149 149   x   x 148   x   x 149   x   x   x 149 149 148 149 148 149 149       x 149       x 149 149   x   x               x   x 148  kill col 39  Tbl  22 cols 001000001001101101110000000110110011111110 has 146 unique lines.
 * 142 145     145 143 144 142 143   x 146 146   x   x 145   x   x 146   x   x   x 146 146 145 146 145 146 146       x 146       x 146 146   x   x               x   x 145  kill col 35  Tbl  21 cols 001000101001101101110000000110110011111110 has 142 unique lines.
 * 137 141     139 136 139     137   x 142 142   x   x 141   x   x 141   x   x   x 142 142 141 142 139 142 140       x 142       x 142 140   x   x               x   x 141  kill col 37  Tbl  20 cols 001010101001101101110000000110110011111110 has 136 unique lines.
 * 131 134     130     129     131   x 136 136   x   x 135   x   x 135   x   x   x 136 136 134 136 132 136 132       x 135       x 135 131   x   x               x   x 135  kill col 36  Tbl  19 cols 001011101001101101110000000110110011111110 has 129 unique lines.
 * 122 124     114             120   x 129 129   x   x 128   x   x 128   x   x   x 129 128 127 129 123 129 123       x 127       x 125 123   x   x               x   x 128  kill col 38  Tbl  18 cols 001111101001101101110000000110110011111110 has 114 unique lines.
 * 107 105                     102   x 114 114   x   x 113   x   x 113   x   x   x 114 112 112 114 106 111 106       x 112       x 109 108   x   x               x   x 113  kill col 34  Tbl  17 cols 001111111001101101110000000110110011111110 has 102 unique lines.
 *  90  88                           x 102 102   x   x 100   x   x  98   x   x   x 102 100  99 100  93  96  94       x 101       x  95  93   x   x               x   x  98  kill col 40  Tbl  16 cols 011111111001101101110000000110110011111110 has  88 unique lines.
 *  72                               x  86  88   x   x  86   x   x  83   x   x   x  86  86  85  86  77  79  79       x  86       x  80  78   x   x               x   x  83  kill col 41  Tbl  15 cols 111111111001101101110000000110110011111110 has  72 unique lines.
 *                                   x  70  72   x   x  70   x   x  69   x   x   x  70  69  69  69  59  61  62       x  70       x  63  61   x   x               x   x  69  kill col 17  Tbl  14 cols 111111111001101101110000100110110011111110 has  59 unique lines.
 *                                   x  57  59   x   x  56   x   x  55   x   x   x  57  57  56  56      51  49       x  57       x  51  50   x   x               x   x  56  kill col 15  Tbl  13 cols 111111111001101101110000101110110011111110 has  49 unique lines.
 *                                   x  48  49   x   x  46   x   x  45   x   x   x  47  46  45  45      41           x  47       x  44  42   x   x               x   x  46  kill col 16  Tbl  12 cols 111111111001101101110000111110110011111110 has  41 unique lines.
 *                                   x  40  40   x   x  38   x   x  37   x   x   x  39  39  37  37                   x  39       x  36  35   x   x               x   x  38  kill col  8  Tbl  11 cols 111111111001101101110000111110110111111110 has  35 unique lines.
 *                                   x  33  34   x   x  32   x   x  32   x   x   x  34  32  30  30                   x  32       x  31       x   x               x   x  32  kill col 18  Tbl  10 cols 111111111001101101110001111110110111111110 has  30 unique lines.
 *                                   x  27  28   x   x  27   x   x  27   x   x   x  28  27  25                       x  25       x  25       x   x               x   x  27  kill col  9  Tbl   9 cols 111111111001101101110001111110111111111110 has  25 unique lines.
 *                                   x  21  23   x   x  23   x   x  21   x   x   x  21  22  21                       x  20       x           x   x               x   x  22  kill col 12  Tbl   8 cols 111111111001101101110001111111111111111110 has  20 unique lines.
 *                                   x  17  19   x   x  18   x   x  16   x   x   x  17  17  16                       x           x           x   x               x   x  17  kill col 19  Tbl   7 cols 111111111001101101110011111111111111111110 has  16 unique lines.
 *
 * Round 2: 000000000110010010001100000000000000000001  4 columns for indexes to table representing  7 original columns (uses 16 of 16 lines in indirect table).
 * Direct:  111111110000000000000011111101111100111000 22 columns
 * Can even chose 2 more columns to be represented directly.
 * Success. Use 2 EBRs, 18 LUTs.
 */

module m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
   output [47:0] d
   );
   /*                      indirect_index 1
    * inx         next     | indirect index 0
    * || ucode    ucode    | | direct representation
    * 00 LB_0     LB_1     0 0 000000010011010101110000| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 1101001000101111011001x1|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 101111100011011101110000| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 FENCE    StdIncPc 3 0 111001100000101x010xxxx0| f      Prepare read PC (FENCE)
    * 04 ADDI_0   StdIncPc 4 0 111001100000101101010000| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L05     ADDI_0   3 0 000001000000101x001xxxx0| AUIPC  q = imm20 (copy x/8)
    * 06 LB_3     LB_4     3 0 0000011100011011011010x0|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     3 0 0000100100010111011011x0|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L08     SB_1     5 0 010110100011100101110000| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     3 0 0000101100010111011000x0|        q = D^0xffffffff^q = D^0x80
    * 0a _L0a     SB_1     5 0 010110100011100101110000| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b LB_6     StdIncPc 4 3 111001100000101101010010|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 0c ADD_0    ADDI_0   3 0 0000010000111011011001x0| ADD    add     Addition Q = RS1
    * 0d MUL_0    ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 0e SUB_0    SUB_1    3 0 000100000011101x010xxxx0| SUB    Subtraction
    * 0f _L0f     StdIncPc 4 0 111001100000101101011000| LUI    q = imm20
    * 10 SUB_1    LB_6     3 0 0000101100111111011000x0|        Q = ~RS2
    * 11 AND_1    ANDI_1   3 0 0001101000111011011000x0|        RS1^0xffffffff to Q
    * 12 eFetch3           5 4 000000000111111101110010|  Fr11  Write minstret. Update I. Q=immediate, use dinx
    * 13 condb_2  condb_3  3 0 0001010000111111011000x0|        ~RS2 in Q
    * 14 condb_3  condb_4  3 3 000101010000101101110010|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  3 5 0001011000110011011001x0|        Branch on condition
    * 16 condb_5  Fetch    6 3 110111101011011000111010|        Branch not taken.
    * 17 condb_5t BrOpFet  7 6 011101001011011101110000|        Branch taken.
    * 18 BEQ      condb_2  8 0 000100110011101101011000| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   5 0 010000010010101101010000| JALR   jj=RS1+imm
    * 1a ANDI_1   StdIncPc 4 0 1110011000001011010011x0|        rd = Iimm & RS1
    * 1b _L1b     JAL_1    3 6 001100100000101100111000| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 3 2 101001100010111100111000| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 4 0 111001100000101101011100|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 3 3 110101000010101001110010|        Q = 4
    * 1f IJ_2     IJ_3     8 0 101101110010101101011000|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     9 2 010100100011010101110000| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 4 0 1110011000001011010000x0|        rd = Iimm ^ RS1
    * 22 _L22     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 23 FENCEI   StdIncPc 3 0 111001100000101x010xxxx0| f      Prepare read PC (FENCE)
    * 24 SLLI_0   SLLI_1   3 7 001101010011110100x11000| SLLI   Shift left immediate.
    * 25 _L25     ADDI_0   3 0 000001000000101x001xxxx0| AUIPC  q = imm20 (copy x/8)
    * 26 OR_1     OR_2     5 0 0010011100111011010000x0|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    3 0 000111010000001101110000|        Q = rs2
    * 28 _L28     SH_1     5 2 100101100011100101110000| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   3 0 0010000100111011011000x0|        Q = RS1^0xFFFFFFFF
    * 2a _L2a     SH_1     5 2 100101100011100101110000| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  3 3 0011000000xxxx1101010010|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    3 0 001111100011101x00xxxxx0| SLL    Shift left
    * 2d MULH_0   ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 2e EBRKWFI2 EBREAK_1 5 5 1111011100011011010010x0| EBREAK/WFI2 Select EBREAK or WFI
    * 2f _L2f     StdIncPc 4 0 111001100000101101011000| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 4 8 111001100000101101011010|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  3 0 0010101100111111011000x0|        ~rs2 to Q
    * 32 JAL_1    JAL_2    8 0 100001100000101101010000|        Target adr to yy
    * 33 JAERR_1  JAERR_2  8 0 100000011100101100x10000|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    6 0 1101111010110111001001x0|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   4 7 0011011000101111011001x0|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   FENCE    4 9 000000110010111101110100|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  8 5 1101011101xxxx11010001x0|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  8 0 000100110011101101011000| BNE    Conditional Branch. Offset to Ryy
    * 39 _L39     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 3a SRxI_1   SRxI_2   a 7 0011110100101011011001x1|        Register to shift to Q
    * 3b _L3b     JAL_1    3 6 001100100000101100111000| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  5 0 010010010001101101011000| CSRRW  Decoded CSR adr in jj
    * 3d SRxI_2   FENCE    a 9 0000001100101011011001x1|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   3 7 001101010011110100x001x0|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   3 7 001110100011110100x001x0|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 6 010100000011011101110000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   3 3 011000010000001101110010|        Q=1
    * 42 _L42     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 43 _L43     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 44 SLTI_0   SLTIX_1  3 0 0010101100111111011010x0| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    3 3 011001010010101101110010|        More check offset
    * 46 ILL_1    ILL_2    9 0 0100011101110111011001x0|        Store PC to mepc and Q for read of instr
    * 47 ILL_2    ILL_3    b 0 1000111000101111011001x0|        Read until Q is offending instruction
    * 48 _L48     SW_1     0 a 011001100011101101110000| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  8 3 010010110000101101110010|        CSRRW sentinel 0x00000100
    * 4a _L4a     SW_1     0 a 011001100011101101110000| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  c b 1011000011101011001001x0|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   3 0 001100010011101x010xxxx0| SLT    Set less than (signed)
    * 4d MULHSU_0 ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 4e eILL0b   ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 4f MRET_8   StdIncPc 3 3 111001100010101101110010|        Prep +4
    * 50 LW_1     StdIncPc d c 1110011000101111010001x0|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   8 0 110110101110101100111000|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 0101010000101111011001x1|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   8 0 110110101110101100111000|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     e 9 1110101100101011011001x1|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 8 0 000111101110101101011000|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     3 0 0101011100100011011011x0|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     3 0 0000101100100011011000x0|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 _L58     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 59 _L59     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 5a SB_1     SB_2     8 7 0101110100101111011001x0|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L5b     JAL_1    3 6 001100100000101100111000| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRS_1  5 0 101100010001101101011000| CSRRS  Decoded CSR adr in jj
    * 5d SB_2     SB_3     8 9 011010010010111101110100|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 0111000000101111011001x1|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   8 0 110110101110101100111000|  err   LD AlignFault. Faulting adr to mtval
    * 60 _L60     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 61 JALR_2   JAL_2    8 6 1000011000001011010011x0|        Q = (RS1+imn) & 0xfffffffe
    * 62 _L62     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 63 _L63     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 64 SLTIU_0  SLTIX_1  3 0 0010101100111111011010x0| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    3 5 111011110000101x010xxxx0|        Prepare read PC
    * 66 SW_1     SW_2     c 0 1111001011111011001001x0|        Write d to a+k until accepted
    * 67 SWE      SW_E2    8 0 100100111100101100x11000|        Store faulting address alignment to mtval
    * 68 _L68     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 69 SB_3     SB_4     3 0 011010110000001101011000|        Prepare get back address to use 
    * 6a _L6a     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 6b SB_4     SB_5     0 d 0111101010110011011001x0|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   3 0 001100010011101x010xxxx0| SLTU   Set less than (unsigned)
    * 6d MULHU_0  ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 6e LHU_3    ANDI_1   3 0 0001101000011111011010x0|        Invert q. Prepare read mask
    * 6f MRET_6   MRET_7   3 3 1100111100xxxx1101110010|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    e 9 0110111000101011011001x1|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 8 0 000111101110101101011000|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   3 0 0001101000011011011010x0|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  8 0 0111011011110011010001x0|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   b e 1111010000101111010001x0| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  3 0 011100110000101x00xxxxx0|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  3 0 0111011100001011011000x0|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  8 3 011111010110101100x10010|        origPC to mepc. Prep read 0
    * 78 _L78     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 79 _L79     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 7a SB_5     SW_2     c 0 1111001010110011001001x0|        Write d to a+k until accepted
    * 7b _L7b     JAL_1    3 6 001100100000101100111000| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRC_1  5 0 101100100001101101011000| CSRRC  Decoded CSR adr in jj
    * 7d BAERR_4  JAL_3    f b 001101001010011100x001x0|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    8 0 1001000001xxxx11010001x0|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  8 0 011111011110101100x001x0|        mtval is target
    * 80 LBU_0    LBU_1    0 0 100001010011010101110000| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  8 0 011111010110101100x001x0|        Store PC to mepc
    * 82 _L82     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 83 _L83     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 84 XORI_0   XORI_1   3 0 0010000100111111011010x0| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 1111000000101111011001x1|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_3    4 3 001101000011001000x10010|        Return address to TRG
    * 87 JALRE1   JALRE2   8 0 011111110111001100x001x0|  err   Store pc to mepc
    * 88 _L88     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 89 ILL_4    ILL_5    3 3 100010110010101101110010|        Q = 1
    * 8a _L8a     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 8b ILL_5    JAL_3    f f 001101001010011100x10010|        Store 2 to mcause
    * 8c XOR_0    XOR_1    3 0 001010010011111x010xxxx0| XOR    xor
    * 8d DIV_0    ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 8e ILL_3    ILL_4    8 0 100010011110101101011000|        Store illegal instruction to mtval
    * 8f aF_SW_3  LDAF_3   f b 100100101000101000x10000|        Store 7 to mcause
    * 90 NMI_2    JAL_3    f b 001101001101001101011000|        mtval = 0.
    * 91 LDAF_2   LDAF_3   f f 100100101000101000x10010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    8 0 001101000110011100x001x0|        PC to mepc
    * 93 SW_E2    SW_E3    8 0 1001010001101111010001x0|        Store address that faulted
    * 94 SW_E3    SW_E4    3 3 100101010010111001110010|        Q = 3
    * 95 SW_E4    JAL_3    f b 001101001010011100x10100|        Store 6 to mcause
    * 96 SH_1     SH_2     8 7 1001101000101111011001x0|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SWH      SW_E2    8 0 100100111100101100x11000|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  8 0 000100110011101101011000| BLT    Conditional Branch. Offset to Ryy
    * 99 _L99     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 9a SH_2     SH_3     8 9 100111010010111101110100|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * 9b _L9b     Fetch    c 7 11011110xxxxxxxxxxxxxxxx| q:9b
    * 9c _L9c     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * 9d SH_3     SH_4     3 0 100111100000001101011000|        Prepare get back address to use 
    * 9e SH_4     SH_5     0 d 1001111101110011011001x0|        Address back to Q. Prepare get item to write
    * 9f SH_5     SW_2     c 0 1111001001110011001001x0|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    9 2 010111100011010101110000| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm.
    * a1 ECALL_4  ECALL_5  3 3 110011100010101001110010|        Q = 4
    * a2 _La2     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * a3 _La3     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * a4 SRxI_0   SRxI_1   3 7 001110100011110100x11000| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   3 3 101011110001101101110010|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  3 6 110100000010111100111000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 3 0 0010111000xxxx1101110000| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 _La8     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * a9 ECALL_6  JAL_3    f b 001101001010011000x10000|        mcause = 11
    * aa _Laa     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * ab EBREAK_2 EBREAK_3 8 0 1011101001101011010001x0|        pc to mepc
    * ac _Lac     SRx_1    3 0 001111110011101x00xxxxx0| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * ae _Lae     SRx_1    3 0 001111110011101x00xxxxx0| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   3 3 1100010100xxxx1101110010|        0x202 + 0xff + 1 = 0x302
    * b0 CSRRW_3  StdIncPc 3 3 111001100010101001110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b1 CSRRS_1  CSRRWI_2 8 0 101101000001101001010000|        CSRRS sentinel 0x00000102
    * b2 CSRRC_1  CSRRWI_2 8 3 101101000001101001010010|        CSRRC sentinel 0x0000103
    * b3 CSRRWI_1 CSRRWI_2 8 3 101101000001101101010010|        CSRRWI sentinel 0xffffff80
    * b4 CSRRWI_2 CSRRW_2  3 3 010010110000101101110010|        Prepare write current PC to 0x100
    * b5 CSRRSI_1 CSRRWI_2 8 0 101101000001101001010000|        CSRRSI sentinel 0xffffff82
    * b6 CSRRCI_1 CSRRWI_2 8 3 101101000001101001010010|        CSRRCI sentinel 0xffffff83
    * b7 IJ_3     IJ_4     3 0 101111010011001001110000|        Construct Q = 3
    * b8 BGE      condb_2  8 0 000100110011101101011000| BGE    Conditional Branch. Offset to Ryy
    * b9 _Lb9     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * ba EBREAK_3 JAL_3    f b 001101001010011000x10000|        mcause = 3
    * bb _Lbb     Fetch    c 7 11011110xxxxxxxxxxxxxxxx| q:bb
    * bc CSRRWI_0 CSRRWI_1 5 0 101100110001011101011000| CSRRWI Decoded CSR adr in jj
    * bd IJ_4     Fetch    6 0 1101111010110111001011x0|        Mask and use as PC
    * be IJ_1     IJ_2     b 0 0001111100101111011001x0|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    b 0 1100000100101111011001x0|        Exit CSR, enter trap
    * c0 _Lc0     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * c1 IJT_2    IJT_3    8 0 111010010010101101011000|        Read word is to be masked with ~3u
    * c2 _Lc2     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * c3 _Lc3     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * c4 ORI_0    ORI_1    5 0 1110000100111111010010x0| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   3 0 0110111100000011011010x0|        ~302
    * c6 IJT_4    ILL_2    9 0 0100011101110111011011x0|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   8 0 1100101101xxxx11010001x0|        Store pc to mepc.
    * c8 _Lc8     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * c9 MRET_2   MRET_3   3 0 101001010001101001110000|        0xff+3 = 0x102
    * ca _Lca     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * cb QINT_2   StdIncPc f b 111001101101001101011000|        mtval = 0.
    * cc OR_0     OR_1     3 0 001001100011111x010xxxx0| OR     or
    * cd REM_0    ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * ce ECALL_5  ECALL_6  3 3 101010010010101001110010|        Q = 8
    * cf MRET_7   MRET_8   3 5 010011110001101x010xxxx0|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  3 3 001101110000101101110010| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   5 0 110010010001101101011000| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     e 9 0000011000101011011001x1|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 8 0 000111101110101101011000|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   f f 100100101000101100x10010|        Store 5 to mcause
    * d5 eFetch2  Fetch    c 7 11011110xxxxxxxxxxxxxxxx|  Fr11  Not in use
    * d6 eILL0c   ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  8 0 101000011110101101011000|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  8 0 000100110011101101011000| BLTU   Conditional Branch. Offset to Ryy
    * d9 _Ld9     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * da LDAF_a   LDAF_2   3 0 100100010010101x010xxxx0|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   8 3 100100101000101100x10010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRSI_1 5 0 101101010001011101011000| CSRRSI Decoded CSR adr in jj
    * dd aF_SW_1  aF_SW_2  8 0 111001011110101101011000|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   b e 1111010000101111010001x0|  Fr11  Read and latch instruction
    * df eFetch   Fetch2   b e 1111010000101111010001x0|  Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 _Le0     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * e1 ORI_1    ORI_2    3 0 0001110100000011011001x0|        Q = RS1
    * e2 _Le2     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * e3 _Le3     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * e4 ANDI_0   ANDI_1   3 0 0001101000111111011010x0| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  3 3 100011110010101001110010|        Q = 4
    * e6 StdIncPc Fetch    6 3 110111101011011000110010|  Fr11  IncPC, OpFetch
    * e7 aFault   aFault_1 8 0 000111101110101101011000|  err   Load access fault. Faulting adr to mtval
    * e8 _Le8     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * e9 IJT_3    IJT_4    3 0 110001100011001001110000|        Construct Q = 3
    * ea _Lea     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * eb LH_3     LH_4     3 0 0101011000011111011010x0|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    3 0 000100010011111x010xxxx0| AND    And 
    * ed REMU_0   ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * ee eILL0a   ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * ef WFI_5    Fetch    6 3 110111101011011000110010|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    e 9 0111001000101011011001x1|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 8 0 000111101110101101011000|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 0 111001100000101x010xxxx0|        Prepare read PC
    * f3 aF_SW    aF_SW_1  3 0 1101110100xxxx1x001xxxx0|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   eFetch3  5 0 000100101100011111010000|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 8 0 110110111110101101011000|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    3 3 111110100000001001110010| WFI    To check offset
    * f7 EBREAK_1 EBREAK_2 8 0 101010111100101101011000| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  8 0 000100110011101101011000| BGEU   Conditional Branch. Offset to Ryy
    * f9 _Lf9     ILLe     3 0 1111111000xxxx1x00xxxxx0| Illegal instruction seen
    * fa WFI_2    WFI_3    3 3 010001010010101101110010|        Check offset
    * fb _Lfb     Fetch    c 7 11011110xxxxxxxxxxxxxxxx| q:fb
    * fc CSRRCI_0 CSRRCI_1 5 0 101101100001011101011000| CSRRCI Decoded CSR adr in jj
    * fd NMI_0    NMI_1    3 0 011111100000101x010xxxx0| NMI    Get current PC
    * fe ILLe     ILL_1    3 0 010001100000101x010xxxx0| Illegal
    * ff QINT_0   QINT_1   3 0 110001110000101x010xxxx0| INT    Get current PC
    */
   localparam u0_0 = 256'h0b583a4002003b640b52397017603970176c1b680a200b500a4037702f653570;
   localparam u0_1 = 256'h2b582a720b5c2f380b380b4c2b503b58b770b63a33640b723f607f723b603f60;
   localparam u0_2 = 256'h0b581b4802003a00035239703b60397003703b400a203d180a4002000b403570;
   localparam u0_3 = 256'h3d043d042b651b580b382b6502003b5843442f742f64b724cb100b503f600b5a;
   localparam u0_4 = 256'h2b72020002003a40eb243b700b723b702f6477642b723f680200020003723770;
   localparam u0_5 = 256'heb382f652f741b580b382f64020002002360236ceb582b65eb382f65eb382f44;
   localparam u0_6 = 256'h03721f6802003a40b364020003580200cb18fb240a403f68020002000b4c0200;
   localparam u0_7 = 256'heb044344a7041b580b38b324020002006b120b600a002f44f3441b68eb582b65;
   localparam u0_8 = 256'h8a10eb5802003e40a71202002b720200730432122f653f68020002006b043570;
   localparam u0_9 = 256'h732473640358020000002f7402003b58cb182f64a7142e726f4467048a12d358;
   localparam u0_A = 256'h03723a0002003a006b440200a610020003702f381b723d18020002002a723570;
   localparam u0_B = 256'h2f642f64b72c17580000a61002003b5832701a521a500b721b521a521a502a72;
   localparam u0_C = 256'h1a402a7202003e40d35802001a7002004344776c03683f48020002002b580200;
   localparam u0_D = 256'h2f442f44eb5817588b122a4002003b58eb58020000008b12eb582b651b580b72;
   localparam u0_E = 256'hb632020002003e401f68020032700200eb58b6322a723f680200020003640200;
   localparam u0_F = 256'h0a400a400a40175800002b7202003b58cb580272eb58c7d002200a40eb582b65;
   localparam u1_0 = 256'h40e6301030fe300443e6505a300b505a30093007300440e630e622be11d20001;
   localparam u1_1 = 256'h80b733d440e632a6363240e650418013767463de3516331530145400301a300b;
   localparam u1_2 = 256'h40e655f730fe303e3330529630215296301d50273004373530e630fe40e69252;
   localparam u1_3 = 256'h373a3735a90350493632a73d30fe801385d74903473660de80818086302b48e6;
   localparam u1_4 = 256'h33e630fe30fe3031cbb00a66834b0a66b08e90473365302b30fe30fe33610650;
   localparam u1_5 = 256'h80da1170896950b13632875d30fe30fe300b3057801ee9eb80da115480dadce6;
   localparam u1_6 = 256'h33cf301a30fe30310d7a30fe306b30fe8093c0f235ef302b30fe30fe868630fe;
   localparam u1_7 = 256'h807d8090fb3450b23632c0f230fe30fe837d30773073bef48076301a801ee96e;
   localparam u1_8 = 256'hfb92808930fe3029ff3430fe338b30fe807f433411f0302130fe30fe807d0085;
   localparam u1_9 = 256'hc0f20d9f309e30fec7de899d30fe80138093879afb34339580948034ff92fb34;
   localparam u1_A = 256'h33c5303f30fe303f80ba30fefb3430fe302e36d033af373a30fe30fe33ce925e;
   localparam u1_B = 256'hb0c1b01f60de50b3c7defb3430fe801330bd83b480b4334b83b483b480b433e6;
   localparam u1_C = 256'h354f33a930fe3026fbe630fe30a530fe80cb9047306f50e130fe30fe80e930fe;
   localparam u1_D = 256'hbef4bef480e550b58392309130fe801380a130fec7deff92801ee90650c93337;
   localparam u1_E = 256'h63de30fe30fe3011305630fe30c630fe801e63de338f301a30fe30fe301d30fe;
   localparam u1_F = 256'h30c73046307e50b6c7de334530fe801380ab33fa80db501230dd30e6801ee972;
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
   assign d[3] = indir[2];
   assign d[4] = indir[3];
   assign d[5] = indir[4];
   assign d[8] = indir[5];
   assign d[9] = indir[6];
   assign d[10] = indir[7];
   assign d[11] = indir[8];
   assign d[12] = indir[9];
   assign d[14] = indir[10];
   assign d[15] = indir[11];
   assign d[16] = indir[12];
   assign d[17] = indir[13];
   assign d[18] = indir[14];
   assign d[19] = indir[15];
   assign d[34] = indir[16];
   assign d[35] = indir[17];
   assign d[36] = indir[18];
   assign d[37] = indir[19];
   assign d[38] = indir[20];
   assign d[39] = indir[21];
   assign d[40] = indir[22];
   assign d[41] = indir[23];
   // replaces = 000000001001101101110000000010000011000100
   SB_LUT4 #(.LUT_INIT(16'h8018)) cmb_d02(.O(d[2]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d06(.O(d[6]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h4000)) cmb_d07(.O(d[7]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hfd7f)) cmb_d13(.O(d[13]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d22(.O(d[22]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0444)) cmb_d23(.O(d[23]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0440)) cmb_d24(.O(d[24]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d26(.O(d[26]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h4002)) cmb_d27(.O(d[27]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h8800)) cmb_d29(.O(d[29]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h5000)) cmb_d30(.O(d[30]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2400)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 000000000110010010001100000000000000000000
   SB_LUT4 #(.LUT_INIT(16'ha710)) cmb_d20(.O(d[20]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h83e0)) cmb_d21(.O(d[21]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2842)) cmb_d25(.O(d[25]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h8004)) cmb_d28(.O(d[28]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h480f)) cmb_d31(.O(d[31]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h02c1)) cmb_d32(.O(d[32]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[42] = 1'b0;
   assign d[43] = 1'b0;
   assign d[44] = 1'b0;
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
