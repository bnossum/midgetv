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
 * 146 150     147 146 147     144 150 150 150 150 150 150 150 150 150 150 150 150 150 150 149 150 148 150 149     150 150       x 150 148 150 150             149 149 149  kill col 34  Tbl  33 cols 001000110000000000000000000100110000111000 has 144 unique lines.
 * 139 141     139 140 140         144 144 144 144 144 144 144 144 144 144 144 144 144 144 143 143 141 143 143     144 144       x 144 142 144 144             143 143 143  kill col 38  Tbl  32 cols 001100110000000000000000000100110000111000 has 139 unique lines.
 * 133 134         132 133         139 139 139 139 139 139 139 139 139 139 139 139 139 139 137 138 135 137 137     139 139       x 139 135 139 139             138 138 138  kill col 37  Tbl  31 cols 001110110000000000000000000100110000111000 has 132 unique lines.
 * 124 124             120         132 132 132 132 132 132 132 132 132 132 132 132 132 132 130 131 126 130 128     132 132       x 131 129 132 131             131 131 130  kill col 36  Tbl  30 cols 001111110000000000000000000100110000111000 has 120 unique lines.
 * 109 107                         120 120 120 120 120 120 120 116 120 120 120 120 120 118 118 119 113 117 115     120 120       x 118 117 120 117             119 119 118  kill col 40  Tbl  29 cols 011111110000000000000000000100110000111000 has 107 unique lines.
 *  91                             107 107 107 107 107 107 107 103 107 106 107 107 104 105 105 106  98 102 100     107 107       x 105 103 107 104             106 106 105  kill col 41  Tbl  28 cols 111111110000000000000000000100110000111000 has  91 unique lines.
 *                                  91  91  91  91  91  91  91  88  91  90  90  91  88  88  89  90  80  81  83      91  91       x  88  87  91  87              90  90  89  kill col 17  Tbl  27 cols 111111110000000000000000100100110000111000 has  80 unique lines.
 *                                  80  80  80  80  80  80  80  77  79  79  78  80  77  78  78  79      71  70      80  80       x  77  76  80  75              79  79  78  kill col 15  Tbl  26 cols 111111110000000000000000101100110000111000 has  70 unique lines.
 *                                  69  70  70  70  70  70  70  67  69  69  68  70  67  67  67  68      61          70  70       x  68  66  70  65              69  69  68  kill col 16  Tbl  25 cols 111111110000000000000000111100110000111000 has  61 unique lines.
 *                                  60  61  60  61  60  61  61  58  60  60  59  61  57  59  58  59                  61  61       x  60  57  61  57              60  60  59  kill col  6  Tbl  24 cols 111111110000000000000000111100110001111000 has  57 unique lines.
 *                                  56  57  56  57  56  57  57  54  56  56  55  57  53  55  54  55                  57  57       x  56  54  57                  56  56  55  kill col 21  Tbl  23 cols 111111110000000000001000111100110001111000 has  53 unique lines.
 *                                  52  53  51  53  52  53  53  51  52  52  51  53      49  49  50                  53  53       x  51  50  53                  52  52  51  kill col 19  Tbl  22 cols 111111110000000000001010111100110001111000 has  49 unique lines.
 *                                  48  49  45  49  48  49  49  47  48  48  47  49      46      44                  49  49       x  47  46  49                  48  48  47  kill col 18  Tbl  21 cols 111111110000000000001011111100110001111000 has  44 unique lines.
 *                                  43  44  40  44  43  44  44  42  43  43  42  44      42                          44  44       x  42  41  44                  43  43  42  kill col 31  Tbl  20 cols 111111110010000000001011111100110001111000 has  40 unique lines.
 *                                  39  39      40  39  40  40  38  39  39  38  39      35                          40  39       x  38  37  40                  39  39  38  kill col 20  Tbl  19 cols 111111110010000000001111111100110001111000 has  35 unique lines.
 *                                  33  32      35  34  34  35  33  34  34  32  34                                  34  33       x  33  33  35                  34  34  33  kill col 23  Tbl  18 cols 111111110010000000101111111100110001111000 has  32 unique lines.
 *                                  30  30      32  31  30  32  30  31  28      31                                  31  30       x  30  30  32                  31  31  30  kill col 24  Tbl  17 cols 111111110010000001101111111100110001111000 has  28 unique lines.
 *                                  27  26      28  27  26  28  26  27          27                                  27  26       x  26  26  28                  27  27  26  kill col  0  Tbl  16 cols 111111110010000001101111111100110001111001 has  26 unique lines.
 *                                  25  24      26  25  24  25  25  25          25                                  25  24       x  24  24  26                  25  25      kill col  8  Tbl  15 cols 111111110010000001101111111100110101111001 has  24 unique lines.
 *                                  23  22      23  22  22  23  23  23          23                                  23  22       x  21      24                  23  23      kill col  9  Tbl  14 cols 111111110010000001101111111100111101111001 has  21 unique lines.
 *                                  20  18      20  19  19  20  20  19          20                                  19  18       x          21                  20  20      kill col 12  Tbl  13 cols 111111110010000001101111111101111101111001 has  18 unique lines.
 *                                  17  16      17  16  16  17  17  16          17                                  17           x          18                  17  17      kill col 25  Tbl  12 cols 111111110010000011101111111101111101111001 has  16 unique lines.
 *
 * Round 1: 000000001101111100010000000010000010000110  4 columns for indexes to table representing 12 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 34
 * 171 distinct lines in remaining untreated columns
 * c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 169 171 169 171 171 171 171 170   x   x 171   x   x   x   x   x 171 171 171   x 171 171 170 171 170 171 171 170   x 171 167   x 171 171   x 171 168 166 169   x   x 171  kill col  4  Tbl  28 cols 000000001101111100010000000010010010010110 has 166 unique lines.
 * 164 166 164 166 166 166 166 165   x   x 166   x   x   x   x   x 166 166 166   x 166 166 165 166 164 166 166 163   x 166 162   x 166 166   x 166 163     163   x   x 166  kill col 11  Tbl  27 cols 000000001101111100010000000010110010010110 has 162 unique lines.
 * 160 162 160 162 162 161 162 161   x   x 162   x   x   x   x   x 162 162 162   x 162 162 161 162 160 162 162 159   x 162       x 162 162   x 162 159     159   x   x 162  kill col  3  Tbl  26 cols 000000001101111100010000000010110010011110 has 159 unique lines.
 * 157 159 157 159 159 158 158 158   x   x 159   x   x   x   x   x 159 159 159   x 159 159 158 159 157 159 159 156   x 159       x 159 159   x 159 152           x   x 159  kill col  5  Tbl  25 cols 000000001101111100010000000010110010111110 has 152 unique lines.
 * 150 151 150 152 152 151 151 151   x   x 152   x   x   x   x   x 152 152 152   x 152 152 151 152 150 152 152 149   x 152       x 152 152   x 152               x   x 152  kill col 14  Tbl  24 cols 000000001101111100010000000110110010111110 has 149 unique lines.
 * 147 148 146 148 149 148 148 147   x   x 149   x   x   x   x   x 149 149 149   x 149 149 148 149 148 149 149       x 149       x 149 149   x 149               x   x 148  kill col 39  Tbl  23 cols 001000001101111100010000000110110010111110 has 146 unique lines.
 * 142 145     145 144 144 142 143   x   x 146   x   x   x   x   x 146 146 146   x 146 146 145 146 145 146 146       x 146       x 146 146   x 146               x   x 145  kill col 35  Tbl  22 cols 001000101101111100010000000110110010111110 has 142 unique lines.
 * 137 141     139 137 139     136   x   x 142   x   x   x   x   x 141 142 142   x 142 142 141 141 139 142 141       x 142       x 142 140   x 142               x   x 141  kill col 34  Tbl  21 cols 001000111101111100010000000110110010111110 has 136 unique lines.
 * 130 132     131 131 131           x   x 136   x   x   x   x   x 134 136 135   x 136 136 135 133 132 135 135       x 136       x 136 134   x 136               x   x 135  kill col 41  Tbl  20 cols 101000111101111100010000000110110010111110 has 130 unique lines.
 *     125     124 125 121           x   x 130   x   x   x   x   x 128 130 129   x 130 130 129 127 124 124 127       x 130       x 130 126   x 130               x   x 128  kill col 36  Tbl  19 cols 101001111101111100010000000110110010111110 has 121 unique lines.
 *     112     109 110               x   x 121   x   x   x   x   x 118 121 120   x 121 120 119 118 111 113 115       x 120       x 118 114   x 121               x   x 118  kill col 38  Tbl  18 cols 101101111101111100010000000110110010111110 has 109 unique lines.
 *      96          93               x   x 109   x   x   x   x   x 106 109 108   x 109 107 106 106  95  97 100       x 108       x 105 100   x 108               x   x 104  kill col 37  Tbl  17 cols 101111111101111100010000000110110010111110 has  93 unique lines.
 *      76                           x   x  93   x   x   x   x   x  90  93  92   x  92  90  90  90  80  82  83       x  91       x  88  85   x  89               x   x  89  kill col 40  Tbl  16 cols 111111111101111100010000000110110010111110 has  76 unique lines.
 *                                   x   x  76   x   x   x   x   x  73  74  74   x  74  73  73  73  63  65  67       x  74       x  72  69   x  72               x   x  73  kill col 17  Tbl  15 cols 111111111101111100010000100110110010111110 has  63 unique lines.
 *                                   x   x  63   x   x   x   x   x  59  61  60   x  61  61  60  60      54  54       x  61       x  59  57   x  58               x   x  60  kill col 15  Tbl  14 cols 111111111101111100010000101110110010111110 has  54 unique lines.
 *                                   x   x  54   x   x   x   x   x  50  52  51   x  52  49  50  50      45           x  52       x  50  48   x  49               x   x  51  kill col 16  Tbl  13 cols 111111111101111100010000111110110010111110 has  45 unique lines.
 *                                   x   x  44   x   x   x   x   x  41  43  42   x  43  41  41  40                   x  43       x  39  39   x  41               x   x  42  kill col  8  Tbl  12 cols 111111111101111100010000111110110110111110 has  39 unique lines.
 *                                   x   x  38   x   x   x   x   x  36  37  36   x  38  35  34  34                   x  36       x  32       x  36               x   x  36  kill col  9  Tbl  11 cols 111111111101111100010000111110111110111110 has  32 unique lines.
 *                                   x   x  29   x   x   x   x   x  29  31  30   x  28  28  27  27                   x  30       x           x  29               x   x  29  kill col 18  Tbl  10 cols 111111111101111100010001111110111110111110 has  27 unique lines.
 *                                   x   x  24   x   x   x   x   x  23  26  25   x  23  22  23                       x  24       x           x  24               x   x  24  kill col 20  Tbl   9 cols 111111111101111100010101111110111110111110 has  22 unique lines.
 *                                   x   x  17   x   x   x   x   x  18  21  20   x  19      18                       x  19       x           x  20               x   x  19  kill col 31  Tbl   8 cols 111111111111111100010101111110111110111110 has  17 unique lines.
 *                                   x   x       x   x   x   x   x  14  16  15   x  12      14                       x  15       x           x  15               x   x  15  kill col 21  Tbl   7 cols 111111111111111100011101111110111110111110 has  12 unique lines.
 *
 * Round 2: 000000000000000011100010000001000001000001  4 columns for indexes to table representing  7 original columns (uses 12 of 16 lines in indirect table).
 * Direct:  111111110010000000001101111100111100111000 23 columns
 * Can even chose 1 more column to be represented directly.
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
    * 00 LB_0     LB_1     0 0 000000011000110110101000| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 110100101000101110100011|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 101111101000110110101000| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 FENCE    StdIncPc 3 3 1110011010000010x011xxx0| f      Prepare read PC (FENCE)
    * 04 ADDI_0   StdIncPc 3 3 111001100010001010111000| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L05     ADDI_0   3 3 0000010010000010x00xxxx0| AUIPC  q = imm20 (copy x/8)
    * 06 LB_3     LB_4     3 3 000001111000011010100100|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     3 3 000010011000010110100110|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L08     SB_1     0 3 010110100100111010101000| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     3 3 000010111000010110100000|        q = D^0xffffffff^q = D^0x80
    * 0a _L0a     SB_1     0 3 010110100100111010101000| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b LB_6     StdIncPc 3 4 111001100010001010111000|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 0c ADD_0    ADDI_0   3 3 000001001000111010100010| ADD    add     Addition Q = RS1
    * 0d MUL_0    ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 0e SUB_0    SUB_1    3 3 0001000010001110x011xxx0| SUB    Subtraction
    * 0f _L0f     StdIncPc 3 3 111001100010001010111100| LUI    q = imm20
    * 10 SUB_1    LB_6     3 3 000010111000111110100000|        Q = ~RS2
    * 11 AND_1    ANDI_1   3 3 000110101000111010100000|        RS1^0xffffffff to Q
    * 12 eFetch3           3 5 000000000101111110101000|  Fr11  Write minstret. Update I. Q=immediate, use dinx
    * 13 condb_2  condb_3  3 3 000101001000111110100000|        ~RS2 in Q
    * 14 condb_3  condb_4  3 4 000101011000001010101000|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  4 3 000101101000110010100010|        Branch on condition
    * 16 condb_5  Fetch    5 6 110111100100110100001100|        Branch not taken.
    * 17 condb_5t BrOpFet  6 0 011101000100110110101000|        Branch taken.
    * 18 BEQ      condb_2  3 3 000100110110111010111100| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   3 3 010000010100101010111000| JALR   jj=RS1+imm
    * 1a ANDI_1   StdIncPc 3 3 111001100010001010110110|        rd = Iimm & RS1
    * 1b _L1b     JAL_1    7 3 0011001010000010100x1100| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 2 3 1010011010001011100x1100| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 3 3 111001100010001010111110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 3 4 110101001000101000101000|        Q = 4
    * 1f IJ_2     IJ_3     3 3 101101110110101010111100|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     8 0 010100100110110110101000| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 3 3 111001100010001010110000|        rd = Iimm ^ RS1
    * 22 _L22     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 23 FENCEI   StdIncPc 3 3 1110011010000010x011xxx0| f      Prepare read PC (FENCE)
    * 24 SLLI_0   SLLI_1   0 7 0011010110001111100x1100| SLLI   Shift left immediate.
    * 25 _L25     ADDI_0   3 3 0000010010000010x00xxxx0| AUIPC  q = imm20 (copy x/8)
    * 26 OR_1     OR_2     3 3 001001110100111010110000|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    3 3 000111011000000010101000|        Q = rs2
    * 28 _L28     SH_1     8 3 100101100100111010101000| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   3 3 001000011000111010100000|        Q = RS1^0xFFFFFFFF
    * 2a _L2a     SH_1     8 3 100101100100111010101000| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  3 4 001100001000xxxx10111000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    3 3 0011111010001110x00xxxx0| SLL    Shift left
    * 2d MULH_0   ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 2e EBRKWFI2 EBREAK_1 4 3 111101110100011010110100| EBREAK/WFI2 Select EBREAK or WFI
    * 2f _L2f     StdIncPc 3 3 111001100010001010111100| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 3 8 111001100010001010111100|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  3 3 001010111000111110100000|        ~rs2 to Q
    * 32 JAL_1    JAL_2    3 3 100001100110001010111000|        Target adr to yy
    * 33 JAERR_1  JAERR_2  9 3 1000000101110010100x1000|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    5 0 110111100100110110000010|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   3 7 001101100010101110100010|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   FENCE    3 9 000000110010101110101010|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  4 3 110101110111xxxx10110010|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  3 3 000100110110111010111100| BNE    Conditional Branch. Offset to Ryy
    * 39 _L39     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 3a SRxI_1   SRxI_2   a 7 001111010010101010100011|        Register to shift to Q
    * 3b _L3b     JAL_1    7 3 0011001010000010100x1100| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  3 3 010010010100011010111100| CSRRW  Decoded CSR adr in jj
    * 3d SRxI_2   FENCE    a 9 000000110010101010100011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   0 7 0011010110001111100x0010|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   0 7 0011101010001111100x0010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     7 0 010100001000110110101000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   3 4 011000011000000010101000|        Q=1
    * 42 _L42     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 43 _L43     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 44 SLTI_0   SLTIX_1  3 3 001010111000111110100100| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    3 4 011001011000101010101000|        More check offset
    * 46 ILL_1    ILL_2    3 0 010001110111110110100010|        Store PC to mepc and Q for read of instr
    * 47 ILL_2    ILL_3    b 3 100011101000101110100010|        Read until Q is offending instruction
    * 48 _L48     SW_1     7 a 011001101000111010101000| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  3 4 010010110110001010101000|        CSRRW sentinel 0x00000100
    * 4a _L4a     SW_1     7 a 011001101000111010101000| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  9 b 1011000000011010100x0010|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   3 3 0011000110001110x011xxx0| SLT    Set less than (signed)
    * 4d MULHSU_0 ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 4e eILL0b   ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 4f MRET_8   StdIncPc 3 4 111001101000101010101000|        Prep +4
    * 50 LW_1     StdIncPc b c 111001100010101110110010|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   9 3 1101101001111010100x1100|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 010101001000101110100011|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   9 3 1101101001111010100x1100|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     a 9 111010111000101010100011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 9 3 000111100111101010111100|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     3 3 010101111000100010100110|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     3 3 000010111000100010100000|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 _L58     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 59 _L59     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 5a SB_1     SB_2     3 7 010111010110101110100010|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L5b     JAL_1    7 3 0011001010000010100x1100| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRS_1  3 3 101100010100011010111100| CSRRS  Decoded CSR adr in jj
    * 5d SB_2     SB_3     3 9 011010010110101110101010|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 011100001000101110100011|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   9 3 1101101001111010100x1100|  err   LD AlignFault. Faulting adr to mtval
    * 60 _L60     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 61 JALR_2   JAL_2    7 3 100001100110001010110110|        Q = (RS1+imn) & 0xfffffffe
    * 62 _L62     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 63 _L63     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 64 SLTIU_0  SLTIX_1  3 3 001010111000111110100100| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    4 3 1110111110000010x011xxx0|        Prepare read PC
    * 66 SW_1     SW_2     9 3 1111001000011110100x0010|        Write d to a+k until accepted
    * 67 SWE      SW_E2    9 3 1001001101110010100x1100|        Store faulting address alignment to mtval
    * 68 _L68     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 69 SB_3     SB_4     3 3 011010111000000010111100|        Prepare get back address to use 
    * 6a _L6a     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 6b SB_4     SB_5     9 a 011110101000110010100010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   3 3 0011000110001110x011xxx0| SLTU   Set less than (unsigned)
    * 6d MULHU_0  ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 6e LHU_3    ANDI_1   3 3 000110101000011110100100|        Invert q. Prepare read mask
    * 6f MRET_6   MRET_7   3 4 110011111000xxxx10101000|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    a 9 011011101000101010100011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 9 3 000111100111101010111100|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   3 3 000110101000011010100100|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  9 3 011101100111110010110010|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   b d 111101001000101110110010| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  3 3 0111001110000010x00xxxx0|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  3 3 011101111000001010100000|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  3 4 0111110101111010100x1000|        origPC to mepc. Prep read 0
    * 78 _L78     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 79 _L79     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 7a SB_5     SW_2     9 3 1111001000001100100x0010|        Write d to a+k until accepted
    * 7b _L7b     JAL_1    7 3 0011001010000010100x1100| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRC_1  3 3 101100100100011010111100| CSRRC  Decoded CSR adr in jj
    * 7d BAERR_4  JAL_3    9 e 0011010001101001100x0010|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    3 3 100100000111xxxx10110010|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  9 3 0111110101111010100x0010|        mtval is target
    * 80 LBU_0    LBU_1    0 0 100001011000110110101000| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  3 3 0111110101111010100x0010|        Store PC to mepc
    * 82 _L82     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 83 _L83     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 84 XORI_0   XORI_1   3 3 001000011000111110100100| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 111100001000101110100011|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_3    3 4 0011010000101100000x1000|        Return address to TRG
    * 87 JALRE1   JALRE2   3 3 0111111101111100100x0010|  err   Store pc to mepc
    * 88 _L88     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 89 ILL_4    ILL_5    3 4 100010111000101010101000|        Q = 1
    * 8a _L8a     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 8b ILL_5    JAL_3    9 f 0011010001101001100x1000|        Store 2 to mcause
    * 8c XOR_0    XOR_1    3 3 0010100110001111x011xxx0| XOR    xor
    * 8d DIV_0    ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 8e ILL_3    ILL_4    9 3 100010010111101010111100|        Store illegal instruction to mtval
    * 8f aF_SW_3  LDAF_3   9 e 1001001001100010000x1000|        Store 7 to mcause
    * 90 NMI_2    JAL_3    9 e 001101000111010010111100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   9 f 1001001001100010000x1000|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    3 3 0011010001111001100x0010|        PC to mepc
    * 93 SW_E2    SW_E3    3 3 100101000111101110110010|        Store address that faulted
    * 94 SW_E3    SW_E4    3 4 100101011000101100101000|        Q = 3
    * 95 SW_E4    JAL_3    9 e 0011010001101001100x1010|        Store 6 to mcause
    * 96 SH_1     SH_2     3 7 100110100110101110100010|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SWH      SW_E2    9 3 1001001101110010100x1100|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  3 3 000100110110111010111100| BLT    Conditional Branch. Offset to Ryy
    * 99 _L99     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 9a SH_2     SH_3     3 9 100111010110101110101010|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * 9b _L9b     Fetch    0 7 110111100xxxxxxxxxxxxxxx| q:9b
    * 9c _L9c     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * 9d SH_3     SH_4     3 3 100111101000000010111100|        Prepare get back address to use 
    * 9e SH_4     SH_5     3 a 100111111001110010100010|        Address back to Q. Prepare get item to write
    * 9f SH_5     SW_2     3 3 1111001000011100100x0010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    8 0 010111100110110110101000| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm.
    * a1 ECALL_4  ECALL_5  3 4 110011101000101000101000|        Q = 4
    * a2 _La2     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * a3 _La3     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * a4 SRxI_0   SRxI_1   0 7 0011101010001111100x1100| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   3 4 101011111000011010101000|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  7 3 1101000010001011100x1100| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 3 3 001011101000xxxx10101000| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 _La8     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * a9 ECALL_6  JAL_3    9 e 0011010001101001000x1000|        mcause = 11
    * aa _Laa     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * ab EBREAK_2 EBREAK_3 3 3 101110100111101010110010|        pc to mepc
    * ac _Lac     SRx_1    3 3 0011111110001110x00xxxx0| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * ae _Lae     SRx_1    3 3 0011111110001110x00xxxx0| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   3 4 110001011000xxxx10101000|        0x202 + 0xff + 1 = 0x302
    * b0 CSRRW_3  StdIncPc 3 4 111001101000101000101000|        Prep emulation entrypt 0x108, here Q to 0x104
    * b1 CSRRS_1  CSRRWI_2 3 3 101101000110011000111000|        CSRRS sentinel 0x00000102
    * b2 CSRRC_1  CSRRWI_2 3 4 101101000110011000111000|        CSRRC sentinel 0x0000103
    * b3 CSRRWI_1 CSRRWI_2 3 4 101101000110011010111000|        CSRRWI sentinel 0xffffff80
    * b4 CSRRWI_2 CSRRW_2  3 4 010010111000001010101000|        Prepare write current PC to 0x100
    * b5 CSRRSI_1 CSRRWI_2 3 3 101101000110011000111000|        CSRRSI sentinel 0xffffff82
    * b6 CSRRCI_1 CSRRWI_2 3 4 101101000110011000111000|        CSRRCI sentinel 0xffffff83
    * b7 IJ_3     IJ_4     3 3 101111011000110000101000|        Construct Q = 3
    * b8 BGE      condb_2  3 3 000100110110111010111100| BGE    Conditional Branch. Offset to Ryy
    * b9 _Lb9     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * ba EBREAK_3 JAL_3    9 e 0011010001101001000x1000|        mcause = 3
    * bb _Lbb     Fetch    0 7 110111100xxxxxxxxxxxxxxx| q:bb
    * bc CSRRWI_0 CSRRWI_1 3 3 101100110100010110111100| CSRRWI Decoded CSR adr in jj
    * bd IJ_4     Fetch    5 0 110111100100110110000110|        Mask and use as PC
    * be IJ_1     IJ_2     b 3 000111111000101110100010|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    b 3 110000011000101110100010|        Exit CSR, enter trap
    * c0 _Lc0     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * c1 IJT_2    IJT_3    3 3 111010010110101010111100|        Read word is to be masked with ~3u
    * c2 _Lc2     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * c3 _Lc3     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * c4 ORI_0    ORI_1    3 3 111000010100111110110100| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   3 3 011011111000000010100100|        ~302
    * c6 IJT_4    ILL_2    3 0 010001110111110110100110|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   3 3 110010110111xxxx10110010|        Store pc to mepc.
    * c8 _Lc8     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * c9 MRET_2   MRET_3   3 3 101001011000011000101000|        0xff+3 = 0x102
    * ca _Lca     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * cb QINT_2   StdIncPc 9 e 111001100111010010111100|        mtval = 0.
    * cc OR_0     OR_1     3 3 0010011010001111x011xxx0| OR     or
    * cd REM_0    ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * ce ECALL_5  ECALL_6  3 4 101010011000101000101000|        Q = 8
    * cf MRET_7   MRET_8   4 3 0100111110000110x011xxx0|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  3 4 001101111000001010101000| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   3 3 110010010100011010111100| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     a 9 000001101000101010100011|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 9 3 000111100111101010111100|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   9 f 1001001001100010100x1000|        Store 5 to mcause
    * d5 eFetch2  Fetch    0 7 110111100xxxxxxxxxxxxxxx|  Fr11  Not in use
    * d6 eILL0c   ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  9 3 101000010111101010111100|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  3 3 000100110110111010111100| BLTU   Conditional Branch. Offset to Ryy
    * d9 _Ld9     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * da LDAF_a   LDAF_2   3 3 1001000110001010x011xxx0|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   9 4 1001001001100010100x1000|        Store 1 to mcause
    * dc CSRRSI_0 CSRRSI_1 3 3 101101010100010110111100| CSRRSI Decoded CSR adr in jj
    * dd aF_SW_1  aF_SW_2  9 3 111001010111101010111100|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   b d 111101001000101110110010|  Fr11  Read and latch instruction
    * df eFetch   Fetch2   b d 111101001000101110110010|  Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 _Le0     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * e1 ORI_1    ORI_2    3 3 000111011000000010100010|        Q = RS1
    * e2 _Le2     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * e3 _Le3     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * e4 ANDI_0   ANDI_1   3 3 000110101000111110100100| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  3 4 100011111000101000101000|        Q = 4
    * e6 StdIncPc Fetch    5 6 110111100100110100001000|  Fr11  IncPC, OpFetch
    * e7 aFault   aFault_1 9 3 000111100111101010111100|  err   Load access fault. Faulting adr to mtval
    * e8 _Le8     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * e9 IJT_3    IJT_4    3 3 110001101000110000101000|        Construct Q = 3
    * ea _Lea     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * eb LH_3     LH_4     3 3 010101101000011110100100|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    3 3 0001000110001111x011xxx0| AND    And 
    * ed REMU_0   ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * ee eILL0a   ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * ef WFI_5    Fetch    5 6 110111100100110100001000|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    a 9 011100101000101010100011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 9 3 000111100111101010111100|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 3 1110011010000010x011xxx0|        Prepare read PC
    * f3 aF_SW    aF_SW_1  3 3 110111011000xxxxx00xxxx0|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   eFetch3  9 3 000100100101000111111000|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 9 3 110110110111101010111100|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    3 4 111110101000000000101000| WFI    To check offset
    * f7 EBREAK_1 EBREAK_2 9 3 101010110111001010111100| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  3 3 000100110110111010111100| BGEU   Conditional Branch. Offset to Ryy
    * f9 _Lf9     ILLe     3 3 111111101000xxxxx00xxxx0| Illegal instruction seen
    * fa WFI_2    WFI_3    3 4 010001011000101010101000|        Check offset
    * fb _Lfb     Fetch    0 7 110111100xxxxxxxxxxxxxxx| q:fb
    * fc CSRRCI_0 CSRRCI_1 3 3 101101100100010110111100| CSRRCI Decoded CSR adr in jj
    * fd NMI_0    NMI_1    3 3 0111111010000010x011xxx0| NMI    Get current PC
    * fe ILLe     ILL_1    3 3 0100011010000010x011xxx0| Illegal
    * ff QINT_0   QINT_1   3 3 1100011110000010x011xxx0| INT    Get current PC
    */
   localparam u0_0 = 256'h22bc8e3080008ea222b84ea885a04ea885a686a4820022b882308da88ba38da8;
   localparam u0_1 = 256'h6abc8a2822be8b8c828c22b64ab86ebc4da84d0c8ca282a88fa05fa88ea08fa0;
   localparam u0_2 = 256'h22bc46b480008e0080b84ea88ea04ea880a84eb082008f8c8230800022b06da8;
   localparam u0_3 = 256'h8f828f822aa346bc828c2aa380006ebc70b22baa2ba24d82728862b88fa022bc;
   localparam u0_4 = 256'h8aa8800080008e301a828ea862a88ea88ba27da28aa88fa48000800080a88da8;
   localparam u0_5 = 256'h7a8c8ba36baa46bc828c6ba28000800088a088a67abc8aa37a8c8ba37a8c2bb2;
   localparam u0_6 = 256'h80a887a480008e308ca2800080bc8000728c1e8282308fa48000800062b68000;
   localparam u0_7 = 256'h7a8270b2698246bc828c0c82800080007a8882a082008bb27cb286a47abc8aa3;
   localparam u0_8 = 256'h62087abc80008f30698880008aa880007c822c088ba38fa4800080007a828da8;
   localparam u0_9 = 256'h1c829ca280bc800000006baa80006ebc728c6ba2698a8b287bb27982620874bc;
   localparam u0_A = 256'h80a88e0080008e007ab280006908800080a88b8c86a88f8c800080008a286da8;
   localparam u0_B = 256'h8ba28ba24d8645bc0000690880006ebc8c286638663882a866b8663866388a28;
   localparam u0_C = 256'h86308a2880008f3074bc80008628800070b27da680a44fb4800080006abc8000;
   localparam u0_D = 256'h8bb28bb27abc45bc62888a3080006ebc7abc8000000062887abc8aa346bc82a8;
   localparam u0_E = 256'h4d08800080008f3087a480008c2880007abc4d088a288fa48000800080a28000;
   localparam u0_F = 256'h82308230823045bc00008aa880006ebc72bc80287abc51f8800082307abc8aa3;
   localparam u1_0 = 256'h33e6331033fe330434e6035a330b035a33093307330433e633e622be11d20001;
   localparam u1_1 = 256'h33b734d433e623a6733233e633413313607456de4316341533143500331a330b;
   localparam u1_2 = 256'h33e643f733fe333e3430839633218396331d33273304073533e633fe33e68052;
   localparam u1_3 = 256'h073a0735a90333497332a73d33fe331343d73903373650de93813386332b38e6;
   localparam u1_4 = 256'h34e633fe33fe33319bb07a66344b7a66b38e30473465332b33fe33fe34617050;
   localparam u1_5 = 256'h93da1170396933b17332375d33fe33fe330b3357931ea9eb93da115493dabce6;
   localparam u1_6 = 256'h34cf331a33fe33319a7a33fe336b33fe939393f243ef332b33fe33fe738633fe;
   localparam u1_7 = 256'h937d33909e3433b2733293f233fe33fe347d33773373bdf49376331a931ea96e;
   localparam u1_8 = 256'h9e92938933fe33299f3433fe348b33fe337f343411f0332133fe33fe337d0085;
   localparam u1_9 = 256'h33f23a9f339e33fe07de399d33fe33139393379a9e343495339433349f929e34;
   localparam u1_A = 256'h34c5333f33fe333f33ba33fe9e3433fe332e73d034af073a33fe33fe34ce805e;
   localparam u1_B = 256'hb3c1b31f50de33b307de9e3433fe331333bd34b433b4344b34b434b433b434e6;
   localparam u1_C = 256'h434f34a933fe33269ee633fe33a533fe33cb3047336f33e133fe33fe33e933fe;
   localparam u1_D = 256'hbdf4bdf493e533b59492339133fe331393a133fe07de9f92931ea90633c93437;
   localparam u1_E = 256'h56de33fe33fe3311335633fe33c633fe931e56de348f331a33fe33fe331d33fe;
   localparam u1_F = 256'h33c73346337e33b607de344533fe331393ab34fa93db931233dd33e6931ea972;
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
   assign d[3] = indir[1];
   assign d[4] = indir[2];
   assign d[5] = indir[3];
   assign d[8] = indir[4];
   assign d[9] = indir[5];
   assign d[10] = indir[6];
   assign d[11] = indir[7];
   assign d[14] = indir[8];
   assign d[15] = indir[9];
   assign d[16] = indir[10];
   assign d[17] = indir[11];
   assign d[18] = indir[12];
   assign d[20] = indir[13];
   assign d[21] = indir[14];
   assign d[31] = indir[15];
   assign d[34] = indir[16];
   assign d[35] = indir[17];
   assign d[36] = indir[18];
   assign d[37] = indir[19];
   assign d[38] = indir[20];
   assign d[39] = indir[21];
   assign d[40] = indir[22];
   assign d[41] = indir[23];
   // replaces = 000000001101111100010000000010000010000110
   SB_LUT4 #(.LUT_INIT(16'h8170)) cmb_d01(.O(d[1]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h8070)) cmb_d02(.O(d[2]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2000)) cmb_d07(.O(d[7]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hfd7f)) cmb_d13(.O(d[13]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d22(.O(d[22]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d26(.O(d[26]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2002)) cmb_d27(.O(d[27]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hc004)) cmb_d28(.O(d[28]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hc800)) cmb_d29(.O(d[29]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h3000)) cmb_d30(.O(d[30]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0441)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0400)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 000000000000000011100010000001000001000000
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d06(.O(d[6]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0efe)) cmb_d12(.O(d[12]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0260)) cmb_d19(.O(d[19]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h01c4)) cmb_d23(.O(d[23]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h00c0)) cmb_d24(.O(d[24]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0822)) cmb_d25(.O(d[25]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[42] = 1'b0;
   assign d[43] = 1'b0;
   assign d[44] = 1'b0;
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
