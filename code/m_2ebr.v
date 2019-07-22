/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Automatically generated from ../code/ucode.h by midgetv_indirectEBR.c.
 * Do not edit
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has  42 columns
 * Removed:  000000000000000000000000000000000000000000 These are treated already, removed from consideration
 * Reserved: 000000000000000000000000000000000000000001 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 42
 * 177 distinct lines in remaining untreated columns
 * c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 175 177 175 177 177 177 177 176 177 177 177 176 177 177 177 177 177 177 177 177 177 177 176 177 176 177 177 176 177 177 174 177 177 177 177 177 174 175 176 177 176   x  kill col  5  Tbl  40 cols 000000000000000000000000000000000000100001 has 174 unique lines.
 * 172 174 172 174 174 174 174 173 174 174 174 173 174 174 174 174 174 174 174 174 174 174 173 174 173 174 174 172 174 174 171 174 174 174 174 174     171 172 174 173   x  kill col  4  Tbl  39 cols 000000000000000000000000000000000000110001 has 171 unique lines.
 * 169 171 169 171 171 171 170 170 171 171 171 170 171 171 171 171 171 171 171 171 171 171 170 171 170 171 171 169 171 171 168 171 171 171 171 171         165 171 170   x  kill col  3  Tbl  38 cols 000000000000000000000000000000000000111001 has 165 unique lines.
 * 163 165 163 165 165 165 164 164 165 165 165 164 165 165 165 165 165 165 165 165 165 165 164 165 163 165 165 161 165 165 161 165 165 165 165 165             164 164   x  kill col 11  Tbl  37 cols 000000000000000000000000000000100000111001 has 161 unique lines.
 * 159 161 159 161 161 159 159 160 161 161 161 160 161 161 161 161 161 161 161 161 161 161 160 161 159 161 161 157 161 161     161 161 161 161 161             160 160   x  kill col 14  Tbl  36 cols 000000000000000000000000000100100000111001 has 157 unique lines.
 * 155 157 154 156 157 155 155 155 157 157 157 156 157 157 157 157 157 157 157 157 157 157 156 157 156 157 157     157 157     157 157 157 157 157             156 156   x  kill col 39  Tbl  35 cols 001000000000000000000000000100100000111001 has 154 unique lines.
 * 151 154     153 152 151 149 151 154 154 154 153 154 154 154 154 154 154 154 154 154 154 153 154 153 154 154     154 154     154 154 154 154 154             153 153   x  kill col 35  Tbl  34 cols 001000100000000000000000000100100000111001 has 149 unique lines.
 * 145 149     146 145 146     143 149 149 149 148 149 149 149 149 149 149 149 149 149 149 148 149 147 149 148     149 149     149 149 147 149 149             148 148   x  kill col 34  Tbl  33 cols 001000110000000000000000000100100000111001 has 143 unique lines.
 * 139 141     138 138 139         143 143 143 142 143 143 143 143 143 143 143 143 143 143 142 142 140 142 142     143 143     143 143 141 143 143             142 142   x  kill col 37  Tbl  32 cols 001010110000000000000000000100100000111001 has 138 unique lines.
 * 134 135     130     129         138 138 138 137 138 138 138 138 138 138 138 138 138 138 137 137 134 137 136     138 138     138 137 134 138 137             137 137   x  kill col 36  Tbl  31 cols 001011110000000000000000000100100000111001 has 129 unique lines.
 * 121 123     118                 129 129 129 128 129 129 129 128 129 129 129 129 129 128 128 128 124 127 125     129 129     129 127 126 129 128             128 128   x  kill col 38  Tbl  30 cols 001111110000000000000000000100100000111001 has 118 unique lines.
 * 108 106                         118 118 118 117 118 118 117 115 118 118 118 118 118 116 116 117 113 115 114     118 118     118 115 116 118 115             117 117   x  kill col 40  Tbl  29 cols 011111110000000000000000000100100000111001 has 106 unique lines.
 *  90                             106 106 106 105 106 106 104 103 106 105 106 106 103 104 104 105  98 101  99     106 106     106 103 101 106 103             105 105   x  kill col 41  Tbl  28 cols 111111110000000000000000000100100000111001 has  90 unique lines.
 *                                  90  90  90  89  90  90  89  88  90  89  89  90  87  87  88  89  79  80  82      90  90      90  87  86  90  86              89  89   x  kill col 17  Tbl  27 cols 111111110000000000000000100100100000111001 has  79 unique lines.
 *                                  79  79  79  78  79  79  78  77  78  78  77  79  76  77  77  78      70  69      79  79      79  76  75  79  74              78  78   x  kill col 15  Tbl  26 cols 111111110000000000000000101100100000111001 has  69 unique lines.
 *                                  68  69  69  68  69  69  68  67  68  68  67  69  66  67  66  67      60          69  69      69  67  65  69  64              68  68   x  kill col 16  Tbl  25 cols 111111110000000000000000111100100000111001 has  60 unique lines.
 *                                  59  60  59  59  59  60  59  58  59  59  58  60  56  59  57  58                  60  60      60  59  56  60  56              59  59   x  kill col  6  Tbl  24 cols 111111110000000000000000111100100001111001 has  56 unique lines.
 *                                  55  56  55  55  55  56  55  54  55  55  54  56  52  55  53  54                  56  56      56  55  53  56                  55  55   x  kill col 21  Tbl  23 cols 111111110000000000001000111100100001111001 has  52 unique lines.
 *                                  51  52  50  51  51  52  51  51  51  51  50  52      49  48  49                  52  52      52  50  49  52                  51  51   x  kill col 19  Tbl  22 cols 111111110000000000001010111100100001111001 has  48 unique lines.
 *                                  47  48  44  47  47  48  47  47  47  47  46  48      46      44                  48  48      48  46  45  48                  47  47   x  kill col 18  Tbl  21 cols 111111110000000000001011111100100001111001 has  44 unique lines.
 *                                  43  44  40  43  43  44  43  43  43  43  42  44      42                          44  44      43  42  41  44                  43  43   x  kill col 31  Tbl  20 cols 111111110010000000001011111100100001111001 has  40 unique lines.
 *                                  39  39      39  39  40  39  39  39  39  38  39      35                          40  39      39  38  37  40                  39  39   x  kill col 20  Tbl  19 cols 111111110010000000001111111100100001111001 has  35 unique lines.
 *                                  33  32      34  34  34  34  34  34  34  32  34                                  34  33      34  33  33  35                  34  34   x  kill col 23  Tbl  18 cols 111111110010000000101111111100100001111001 has  32 unique lines.
 *                                  30  30      31  31  30  31  31  31  28      31                                  31  30      31  30  30  32                  31  31   x  kill col 24  Tbl  17 cols 111111110010000001101111111100100001111001 has  28 unique lines.
 *                                  27  26      27  27  26  27  27  27          27                                  27  26      27  26  26  28                  27  27   x  kill col  8  Tbl  16 cols 111111110010000001101111111100100101111001 has  26 unique lines.
 *                                  25  24      24  24  24  25  25  25          25                                  25  24      25  23      25                  25  25   x  kill col  9  Tbl  15 cols 111111110010000001101111111100101101111001 has  23 unique lines.
 *                                  22  20      21  21  21  22  22  21          22                                  21  20      22          22                  22  22   x  kill col 12  Tbl  14 cols 111111110010000001101111111101101101111001 has  20 unique lines.
 *                                  19  18      18  18  18  19  19  18          19                                  19          19          19                  19  19   x  kill col 25  Tbl  13 cols 111111110010000011101111111101101101111001 has  18 unique lines.
 *                                  17  16      16  16  16  17  17              17                                  17          17          17                  17  17   x  kill col 28  Tbl  12 cols 111111110010010011101111111101101101111001 has  16 unique lines.
 *
 * Round 1: 000000001101101100010000000010010010000110  4 columns for indexes to table representing 12 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 34
 * 172 distinct lines in remaining untreated columns
 * c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 170 172 170 172 172 172 172 171   x   x 172   x   x 171   x   x 172 172 172   x 172 172 171 172 171 172 172 171   x 172 168   x 172 172   x 172 169 170 170   x   x   x  kill col 11  Tbl  28 cols 000000001101101100010000000010110010000111 has 168 unique lines.
 * 166 168 166 168 168 166 167 167   x   x 168   x   x 167   x   x 168 168 168   x 168 168 167 168 167 168 168 167   x 168       x 168 168   x 168 165 166 166   x   x   x  kill col  5  Tbl  27 cols 000000001101101100010000000010110010100111 has 165 unique lines.
 * 163 164 163 165 165 163 164 164   x   x 165   x   x 164   x   x 165 165 165   x 165 165 164 165 164 165 165 163   x 165       x 165 165   x 165     160 159   x   x   x  kill col  3  Tbl  26 cols 000000001101101100010000000010110010101111 has 159 unique lines.
 * 157 158 157 159 159 157 158 158   x   x 159   x   x 158   x   x 159 159 159   x 159 159 158 159 158 159 159 157   x 159       x 159 159   x 159     153       x   x   x  kill col  4  Tbl  25 cols 000000001101101100010000000010110010111111 has 153 unique lines.
 * 151 152 151 153 152 151 150 152   x   x 153   x   x 152   x   x 153 153 153   x 153 153 152 153 151 153 153 149   x 153       x 153 153   x 153               x   x   x  kill col 14  Tbl  24 cols 000000001101101100010000000110110010111111 has 149 unique lines.
 * 147 148 146 148 148 147 146 147   x   x 149   x   x 148   x   x 149 149 149   x 149 149 148 149 148 149 149       x 149       x 149 149   x 149               x   x   x  kill col 35  Tbl  23 cols 000000101101101100010000000110110010111111 has 146 unique lines.
 * 144 144 140 144 143 143     142   x   x 146   x   x 145   x   x 145 146 146   x 146 146 145 146 145 145 145       x 146       x 146 145   x 146               x   x   x  kill col 39  Tbl  22 cols 001000101101101100010000000110110010111111 has 140 unique lines.
 * 135 138     137 135 137     134   x   x 140   x   x 139   x   x 139 140 140   x 140 140 139 139 137 139 139       x 140       x 140 138   x 140               x   x   x  kill col 34  Tbl  21 cols 001000111101101100010000000110110010111111 has 134 unique lines.
 * 129 130     128 128 128           x   x 134   x   x 133   x   x 132 134 134   x 134 134 133 131 130 132 133       x 134       x 134 132   x 134               x   x   x  kill col 36  Tbl  20 cols 001001111101101100010000000110110010111111 has 128 unique lines.
 * 119 124     118 117               x   x 128   x   x 127   x   x 124 128 128   x 128 127 127 125 121 125 126       x 127       x 125 123   x 128               x   x   x  kill col 37  Tbl  19 cols 001011111101101100010000000110110010111111 has 117 unique lines.
 * 106 108     102                   x   x 117   x   x 116   x   x 113 117 117   x 117 116 116 114 109 113 110       x 116       x 114 108   x 116               x   x   x  kill col 38  Tbl  18 cols 001111111101101100010000000110110010111111 has 102 unique lines.
 *  90  87                           x   x 102   x   x 101   x   x  98 102 102   x 102 100 100  99  93  97  94       x 100       x  97  95   x  99               x   x   x  kill col 40  Tbl  17 cols 011111111101101100010000000110110010111111 has  87 unique lines.
 *  74                               x   x  87   x   x  86   x   x  84  86  87   x  85  85  85  84  77  80  79       x  85       x  83  80   x  84               x   x   x  kill col 41  Tbl  16 cols 111111111101101100010000000110110010111111 has  74 unique lines.
 *                                   x   x  74   x   x  73   x   x  72  73  73   x  72  71  71  71  62  63  65       x  72       x  70  67   x  70               x   x   x  kill col 17  Tbl  15 cols 111111111101101100010000100110110010111111 has  62 unique lines.
 *                                   x   x  62   x   x  60   x   x  59  61  60   x  60  60  59  59      53  53       x  60       x  58  56   x  57               x   x   x  kill col 15  Tbl  14 cols 111111111101101100010000101110110010111111 has  53 unique lines.
 *                                   x   x  53   x   x  51   x   x  50  52  51   x  51  48  49  49      44           x  51       x  49  47   x  48               x   x   x  kill col 16  Tbl  13 cols 111111111101101100010000111110110010111111 has  44 unique lines.
 *                                   x   x  43   x   x  42   x   x  41  43  42   x  42  40  40  39                   x  42       x  39  38   x  40               x   x   x  kill col  8  Tbl  12 cols 111111111101101100010000111110110110111111 has  38 unique lines.
 *                                   x   x  37   x   x  36   x   x  36  37  36   x  37  34  33  33                   x  35       x  32       x  35               x   x   x  kill col  9  Tbl  11 cols 111111111101101100010000111110111110111111 has  32 unique lines.
 *                                   x   x  29   x   x  29   x   x  30  31  30   x  28  28  27  26                   x  30       x           x  29               x   x   x  kill col 18  Tbl  10 cols 111111111101101100010001111110111110111111 has  26 unique lines.
 *                                   x   x  23   x   x  24   x   x  23  25  24   x  22  21  22                       x  23       x           x  23               x   x   x  kill col 20  Tbl   9 cols 111111111101101100010101111110111110111111 has  21 unique lines.
 *                                   x   x  17   x   x  19   x   x  18  20  19   x  18      17                       x  18       x           x  19               x   x   x  kill col 19  Tbl   8 cols 111111111101101100010111111110111110111111 has  17 unique lines.
 *                                   x   x  14   x   x  15   x   x  14  16  15   x  14                               x  14       x           x  15               x   x   x  kill col 12  Tbl   7 cols 111111111101101100010111111111111110111111 has  14 unique lines.
 *
 * Round 2: 000000000010010011101000000000000001000000  4 columns for indexes to table representing  7 original columns (uses 14 of 16 lines in indirect table).
 * Direct:  111111110000000000000111111101101100111001 23 columns
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
   /*
    * 00 LB_0     LB_1     0 0 000000010001101011010000| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 1101001000010111110001x1|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 101111100001101111010000| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 FENCE    StdIncPc 0 2 1110011000000101x11xxxx0| f      Prepare read PC (FENCE)
    * 04 ADDI_0   StdIncPc 3 2 111001101000010111110000| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L05     ADDI_0   0 2 0000010000000101x0xxxxx0| AUIPC  q = imm20 (copy x/8)
    * 06 LB_3     LB_4     0 2 0000011100001101110011x0|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     0 2 0000100100001011110010x0|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L08     SB_1     4 2 010110100001110011010000| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     0 2 0000101100001011110000x0|        q = D^0xffffffff^q = D^0x80
    * 0a _L0a     SB_1     4 2 010110100001110011010000| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b LB_6     StdIncPc 3 3 111001101000010111110010|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 0c ADD_0    ADDI_0   0 2 0000010000011101110001x0| ADD    add     Addition Q = RS1
    * 0d _L0d     StdIncPc 3 2 111001101000010111111100| LUI    q = imm20
    * 0e SUB_0    SUB_1    0 2 0001000000011101x11xxxx0| SUB    Subtraction
    * 0f _L0f     StdIncPc 3 2 111001101000010111111100| LUI    q = imm20
    * 10 SUB_1    LB_6     0 2 0000101100011111110000x0|        Q = ~RS2
    * 11 AND_1    ANDI_1   0 2 0001101000011101110000x0|        RS1^0xffffffff to Q
    * 12 eFetch3           4 4 000000000011111111010010|  Fr11  Write minstret. Update I. Q=immediate, use dinx
    * 13 condb_2  condb_3  0 2 0001010000011111110000x0|        ~RS2 in Q
    * 14 condb_3  condb_4  0 3 000101010000010111010010|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  5 2 0001011000011001110001x0|        Branch on condition
    * 16 condb_5  Fetch    6 5 110111100101101100011110|        Branch not taken.
    * 17 condb_5t BrOpFet  7 0 011101000101101111010000|        Branch taken.
    * 18 BEQ      condb_2  4 2 000100111001110111111100| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   4 2 010000010001010111110000| JALR   jj=RS1+imm
    * 1a ANDI_1   StdIncPc 3 2 1110011010000101111010x0|        rd = Iimm & RS1
    * 1b _L1b     JAL_1    8 2 001100100000010110x11100| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 9 2 101001100001011110x11100| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 3 2 111001101000010111111000|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 0 3 110101000001010101010010|        Q = 4
    * 1f IJ_2     IJ_3     4 2 101101111001010111111100|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     a 0 010100101001101011010000| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 3 2 1110011010000101111000x0|        rd = Iimm ^ RS1
    * 22 _L22     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * 23 FENCEI   StdIncPc 0 2 1110011000000101x11xxxx0| f      Prepare read PC (FENCE)
    * 24 SLLI_0   SLLI_1   0 6 001101010001111010x11100| SLLI   Shift left immediate.
    * 25 _L25     ADDI_0   0 2 0000010000000101x0xxxxx0| AUIPC  q = imm20 (copy x/8)
    * 26 OR_1     OR_2     4 2 0010011100011101111000x0|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    0 2 000111010000000111010000|        Q = rs2
    * 28 _L28     SH_1     a 2 100101100001110011010000| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   0 2 0010000100011101110000x0|        Q = RS1^0xFFFFFFFF
    * 2a _L2a     SH_1     a 2 100101100001110011010000| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  0 3 00110000000xxxx111110010|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    0 2 0011111000011101x0xxxxx0| SLL    Shift left
    * 2d _L2d     StdIncPc 3 2 111001101000010111111100| LUI    q = imm20
    * 2e EBRKWFI2 EBREAK_1 b 2 1111011100001101111011x0| EBREAK/WFI2 Select EBREAK or WFI
    * 2f _L2f     StdIncPc 3 2 111001101000010111111100| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 3 7 111001101000010111111110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  0 2 0010101100011111110000x0|        ~rs2 to Q
    * 32 JAL_1    JAL_2    4 2 100001101000010111110000|        Target adr to jj
    * 33 JAERR_1  JAERR_2  4 2 100000011110010110x10000|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    6 0 1101111001011011100001x0|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   3 6 0011011010010111110001x0|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   FENCE    3 8 000000111001011111010100|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  b 2 11010111101xxxx1111001x0|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  4 2 000100111001110111111100| BNE    Conditional Branch. Offset to Ryy
    * 39 _L39     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * 3a SRxI_1   SRxI_2   3 6 0011110110010101110001x1|        Register to shift to Q
    * 3b _L3b     JAL_1    8 2 001100100000010110x11100| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  4 2 010010010000110111111100| CSRRW  Decoded CSR adr in jj
    * 3d SRxI_2   FENCE    3 8 0000001110010101110001x1|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   0 6 001101010001111010x001x0|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   0 6 001110100001111010x001x0|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     8 0 010100000001101111010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   0 3 011000010000000111010010|        Q=1
    * 42 _L42     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * 43 _L43     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * 44 SLTI_0   SLTIX_1  0 2 0010101100011111110011x0| SLTI   Set less than immediate (signed)
    * 45 _L45     Fetch    3 6 11011110xxxxxxxxxxxxxxxx| q:45
    * 46 ILL_1    ILL_2    4 0 0100011110111011110001x0|        Store PC to mepc and Q for read of instr
    * 47 ILL_2    ILL_3    1 2 1000111000010111110001x0|        Read until Q is offending instruction
    * 48 _L48     SW_1     8 9 011001100001110111010000| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  4 3 010010111000010111010010|        CSRRW sentinel 0x00000100
    * 4a _L4a     SW_1     8 9 011001100001110111010000| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  3 a 101100000111010110x001x0|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   0 2 0011000100011101x11xxxx0| SLT    Set less than (signed)
    * 4d _L4d     Fetch    3 6 11011110xxxxxxxxxxxxxxxx| q:4d
    * 4e eILL0b   ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * 4f MRET_8   StdIncPc 0 3 111001100001010111010010|        Prep +4
    * 50 LW_1     StdIncPc c b 1110011010010111111001x0|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   4 2 110110101111010110x11100|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 0101010000010111110001x1|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   4 2 110110101111010110x11100|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     0 8 1110101100010101110001x1|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 4 2 000111101111010111111100|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     0 2 0101011100010001110010x0|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     0 2 0000101100010001110000x0|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 _L58     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * 59 _L59     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * 5a SB_1     SB_2     4 6 0101110110010111110001x0|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L5b     JAL_1    8 2 001100100000010110x11100| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRS_1  4 2 101100010000110111111100| CSRRS  Decoded CSR adr in jj
    * 5d SB_2     SB_3     4 8 011010011001011111010100|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 0111000000010111110001x1|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   4 2 110110101111010110x11100|  err   LD AlignFault. Faulting adr to mtval
    * 60 _L60     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * 61 JALR_2   JAL_2    7 2 1000011010000101111010x0|        Q = (RS1+imn) & 0xfffffffe
    * 62 _L62     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * 63 _L63     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * 64 SLTIU_0  SLTIX_1  0 2 0010101100011111110011x0| SLTIU  Set less than immediate (unsigned)
    * 65 _L65     Fetch    3 6 11011110xxxxxxxxxxxxxxxx| q:65
    * 66 SW_1     SW_2     3 2 111100100111110110x001x0|        Write d to a+k until accepted
    * 67 SWE      SW_E2    4 2 100100111110010110x11100|        Store faulting address alignment to mtval
    * 68 _L68     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * 69 SB_3     SB_4     0 2 011010110000000111111100|        Prepare get back address to use 
    * 6a _L6a     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * 6b SB_4     SB_5     0 9 0111101001011001110001x0|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   0 2 0011000100011101x11xxxx0| SLTU   Set less than (unsigned)
    * 6d _L6d     Fetch    3 6 11011110xxxxxxxxxxxxxxxx| q:6d
    * 6e LHU_3    ANDI_1   0 2 0001101000001111110011x0|        Invert q. Prepare read mask
    * 6f _L6f     Fetch    3 6 11011110xxxxxxxxxxxxxxxx| q:6f
    * 70 LHU_2    LHU_3    0 8 0110111000010101110001x1|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 4 2 000111101111010111111100|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   0 2 0001101000001101110011x0|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  4 2 0111011011111001111001x0|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   1 c 1111010000010111111001x0| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  0 2 0111001100000101x0xxxxx0|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  0 2 0111011100000101110000x0|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  4 3 011111011011010110x10010|        origPC to mepc. Prep read 0
    * 78 _L78     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * 79 _L79     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * 7a SB_5     SW_2     3 2 111100100101100110x001x0|        Write d to a+k until accepted
    * 7b _L7b     JAL_1    8 2 001100100000010110x11100| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRC_1  4 2 101100100000110111111100| CSRRC  Decoded CSR adr in jj
    * 7d BAERR_4  JAL_3    d a 001101001101001110x001x0|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    4 2 10010000101xxxx1111001x0|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  4 2 011111011111010110x001x0|        mtval is target
    * 80 LBU_0    LBU_1    0 0 100001010001101011010000| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  4 2 011111011011010110x001x0|        Store PC to mepc
    * 82 _L82     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * 83 _L83     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * 84 XORI_0   XORI_1   0 2 0010000100011111110011x0| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 1111000000010111110001x1|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_3    3 3 001101001001100100x10010|        Return address to TRG
    * 87 JALRE1   JALRE2   4 2 011111111011100110x001x0|  err   Store pc to mepc
    * 88 _L88     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * 89 ILL_4    ILL_5    0 3 100010110001010111010010|        Q = 1
    * 8a _L8a     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * 8b ILL_5    JAL_3    d d 001101001101001110x10010|        Store 2 to mcause
    * 8c XOR_0    XOR_1    0 2 0010100100011111x11xxxx0| XOR    xor
    * 8d WFI_3    WFI_4    0 3 101011010001010111010010|        More check offset
    * 8e ILL_3    ILL_4    4 2 100010011111010111111100|        Store illegal instruction to mtval
    * 8f aF_SW_3  LDAF_3   d a 100100101100010100x10000|        Store 7 to mcause
    * 90 NMI_2    JAL_3    d a 001101001110100111111100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   d d 100100101100010100x10010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    4 2 001101001011001110x001x0|        PC to mepc
    * 93 SW_E2    SW_E3    4 2 1001010010110111111001x0|        Store address that faulted
    * 94 SW_E3    SW_E4    0 3 100101010001011101010010|        Q = 3
    * 95 SW_E4    JAL_3    d a 001101001101001110x10100|        Store 6 to mcause
    * 96 SH_1     SH_2     4 6 1001101010010111110001x0|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SWH      SW_E2    4 2 100100111110010110x11100|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  4 2 000100111001110111111100| BLT    Conditional Branch. Offset to Ryy
    * 99 _L99     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * 9a SH_2     SH_3     4 8 100111011001011111010100|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * 9b _L9b     Fetch    3 6 11011110xxxxxxxxxxxxxxxx| q:9b
    * 9c _L9c     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * 9d SH_3     SH_4     0 2 100111100000000111111100|        Prepare get back address to use 
    * 9e SH_4     SH_5     0 9 1001111100111001110001x0|        Address back to Q. Prepare get item to write
    * 9f SH_5     SW_2     3 2 111100100011100110x001x0|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    a 0 010111101001101011010000| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm.
    * a1 ECALL_4  ECALL_5  0 3 110011100001010101010010|        Q = 4
    * a2 _La2     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * a3 _La3     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * a4 SRxI_0   SRxI_1   0 6 001110100001111010x11100| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   0 3 101011110000110111010010|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  8 2 110100000001011110x11100| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 0 2 00101110000xxxx111010000| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 _La8     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * a9 ECALL_6  JAL_3    d a 001101001101001100x10000|        mcause = 11
    * aa _Laa     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * ab EBREAK_2 EBREAK_3 4 2 1011101010110101111001x0|        pc to mepc
    * ac _Lac     SRx_1    0 2 0011111100011101x0xxxxx0| SRx    Shift Right (both SRL and SRA)
    * ad WFI_4    WFI_5    5 2 1110111100000101x11xxxx0|        Prepare read PC
    * ae _Lae     SRx_1    0 2 0011111100011101x0xxxxx0| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   0 3 11000101000xxxx111010010|        0x202 + 0xff + 1 = 0x302
    * b0 CSRRW_3  StdIncPc 0 3 111001100001010101010010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b1 CSRRS_1  CSRRWI_2 4 2 101101001000110101110000|        CSRRS sentinel 0x00000102
    * b2 CSRRC_1  CSRRWI_2 4 3 101101001000110101110010|        CSRRC sentinel 0x0000103
    * b3 CSRRWI_1 CSRRWI_2 4 3 101101001000110111110010|        CSRRWI sentinel 0xffffff80
    * b4 CSRRWI_2 CSRRW_2  0 3 010010110000010111010010|        Prepare write current PC to 0x100
    * b5 CSRRSI_1 CSRRWI_2 4 2 101101001000110101110000|        CSRRSI sentinel 0xffffff82
    * b6 CSRRCI_1 CSRRWI_2 4 3 101101001000110101110010|        CSRRCI sentinel 0xffffff83
    * b7 IJ_3     IJ_4     0 2 101111010001100101010000|        Construct Q = 3
    * b8 BGE      condb_2  4 2 000100111001110111111100| BGE    Conditional Branch. Offset to Ryy
    * b9 _Lb9     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * ba EBREAK_3 JAL_3    d a 001101001101001100x10000|        mcause = 3
    * bb _Lbb     Fetch    3 6 11011110xxxxxxxxxxxxxxxx| q:bb
    * bc CSRRWI_0 CSRRWI_1 4 2 101100110000101111111100| CSRRWI Decoded CSR adr in jj
    * bd IJ_4     Fetch    6 0 1101111001011011100010x0|        Mask and use as PC
    * be IJ_1     IJ_2     1 2 0001111100010111110001x0|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    1 2 1100000100010111110001x0|        Exit CSR, enter trap
    * c0 _Lc0     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * c1 IJT_2    IJT_3    4 2 111010011001010111111100|        Read word is to be masked with ~3u
    * c2 _Lc2     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * c3 _Lc3     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * c4 ORI_0    ORI_1    4 2 1110000100011111111011x0| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   0 2 1100110100000001110011x0|        ~302
    * c6 IJT_4    ILL_2    4 0 0100011110111011110010x0|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   4 2 11001011101xxxx1111001x0|        Store pc to mepc.
    * c8 _Lc8     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * c9 MRET_2   MRET_3   0 2 101001010000110101010000|        0xff+3 = 0x102
    * ca _Lca     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * cb QINT_2   StdIncPc d a 111001101110100111111100|        mtval = 0.
    * cc OR_0     OR_1     0 2 0010011000011111x11xxxx0| OR     or
    * cd MRET_6   MRET_7   0 3 11001111000xxxx111010010|        ~302 + origImm + 1 for branch decision
    * ce ECALL_5  ECALL_6  0 3 101010010001010101010010|        Q = 8
    * cf MRET_7   MRET_8   5 2 0100111100001101x11xxxx0|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  0 3 001101110000010111010010| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   4 2 110010010000110111111100| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     0 8 0000011000010101110001x1|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 4 2 000111101111010111111100|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   d d 100100101100010110x10010|        Store 5 to mcause
    * d5 eFetch2  Fetch    3 6 11011110xxxxxxxxxxxxxxxx|  Fr11  Not in use
    * d6 eILL0c   ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  4 2 101000011111010111111100|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  4 2 000100111001110111111100| BLTU   Conditional Branch. Offset to Ryy
    * d9 _Ld9     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * da LDAF_a   LDAF_2   0 2 1001000100010101x11xxxx0|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   4 3 100100101100010110x10010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRSI_1 4 2 101101010000101111111100| CSRRSI Decoded CSR adr in jj
    * dd aF_SW_1  aF_SW_2  4 2 111001011111010111111100|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   1 e 1111010000010111111001x0|  Fr11  Read and latch instruction
    * df eFetch   Fetch2   1 e 1111010000010111111001x0|  Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 _Le0     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * e1 ORI_1    ORI_2    0 2 0001110100000001110001x0|        Q = RS1
    * e2 _Le2     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * e3 _Le3     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * e4 ANDI_0   ANDI_1   0 2 0001101000011111110011x0| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  0 3 100011110001010101010010|        Q = 4
    * e6 StdIncPc Fetch    6 5 110111100101101100010010|  Fr11  IncPC, OpFetch
    * e7 aFault   aFault_1 4 2 000111101111010111111100|  err   Load access fault. Faulting adr to mtval
    * e8 _Le8     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * e9 IJT_3    IJT_4    0 2 110001100001100101010000|        Construct Q = 3
    * ea _Lea     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * eb LH_3     LH_4     0 2 0101011000001111110011x0|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    0 2 0001000100011111x11xxxx0| AND    And 
    * ed _Lef     Fetch    3 6 11011110xxxxxxxxxxxxxxxx| q:ef
    * ee eILL0a   ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * ef WFI_5    Fetch    6 5 110111100101101100010010|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    0 8 0111001000010101110001x1|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 4 2 000111101111010111111100|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 0 2 1110011000000101x11xxxx0|        Prepare read PC
    * f3 aF_SW    aF_SW_1  0 2 11011101000xxxx1x0xxxxx0|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   eFetch3  4 f 000100100110001111110000|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 4 2 110110111111010111111100|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    0 3 111110100000000101010010| WFI    To check offset
    * f7 EBREAK_1 EBREAK_2 4 2 101010111110010111111100| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  4 2 000100111001110111111100| BGEU   Conditional Branch. Offset to Ryy
    * f9 _Lf9     ILLe     0 2 11111110000xxxx1x0xxxxx0| Illegal instruction seen
    * fa WFI_2    WFI_3    0 3 100011010001010111010010|        Check offset
    * fb _Lfb     Fetch    3 6 11011110xxxxxxxxxxxxxxxx| q:fb
    * fc CSRRCI_0 CSRRCI_1 4 2 101101100000101111111100| CSRRCI Decoded CSR adr in jj
    * fd NMI_0    NMI_1    0 2 0111111000000101x11xxxx0| NMI    Get current PC
    * fe ILLe     ILL_1    0 2 0100011000000101x11xxxx0| Illegal
    * ff QINT_0   QINT_1   0 2 1100011100000101x11xxxx0| INT    Get current PC
    */
   localparam u0_0 = 256'h85fc1d6085fc1dc485f21cd00bc01cd00bc80dcc050085f005601bd017c51ad0;
   localparam u0_1 = 256'h95fc155285f8179c059c85e815f09dfc5bd05b1e19c405d21fc03fd21dc01fc0;
   localparam u0_2 = 256'h85fc0dec85fc1d0001f21cd01dc01cd001d01de005001e9c0560010085e09ad0;
   localparam u0_3 = 256'h1e841e8495c50dfc059c95c501009dfca1e497d497c45b84e59085f01fc085fe;
   localparam u0_4 = 256'h15d2010000001d6075841dd085d21dd017c4bbc400001fcc0100010001d21bd0;
   localparam u0_5 = 256'hf59c17c597d40dfc059c97c40100010011c011c8f5fc15c5f59c17c5f59c97e4;
   localparam u0_6 = 256'h00000fcc00001d6059c4010001fc0100e59c7d8400001fcc0100010085e80100;
   localparam u0_7 = 256'hf584a1e4d3840dfc059c598401000100b59205c0050017e4f9e40dccf5fc15c5;
   localparam u0_8 = 256'hc510f5fc15d21f60d392010015d20100b984991217c51fcc01000100b5841ad0;
   localparam u0_9 = 256'h398439c401fc0100000097d401009dfce59c97c4d3941752b7e4b384c512e9fc;
   localparam u0_A = 256'h01d21d0005601d00b5e40100d310010001d0179c0dd21e9c0100010015529ad0;
   localparam u0_B = 256'h17c417c45b880bfc0000d31001009dfc19508d728d7005d28df28d728d701552;
   localparam u0_C = 256'h0d60155201d21f60e9fc01000d500100a1e4bbc801cc1fec0100010095fc0100;
   localparam u0_D = 256'h17e417e4f5fc0bfcc592156001009dfcf5fc01000000c592f5fc15c50dfc05d2;
   localparam u0_E = 256'h5b12010000001f600fcc010019500100f5fc5b1215521fcc0100010001c40100;
   localparam u0_F = 256'h0560056005600bfc000015d201009dfce5fc0152f5fc63f001000560f5fc15c5;
   localparam u1_0 = 256'h32e6021032e6020433e6425a020b425a02090207020432e602e622be11d20001;
   localparam u1_1 = 256'h42b703d432e692a6823232e642414213707465de5216031502144400021a020b;
   localparam u1_2 = 256'h32e6b2f732e6023e0330a2960221a296021d42270204063502e602fe32e6a052;
   localparam u1_3 = 256'h063a0635380342498232363d02fe4213b2d73803363660de42814286022b37e6;
   localparam u1_4 = 256'h03e602fe36de02313ab08966434b8966128e404736de022b02fe02fe03618050;
   localparam u1_5 = 256'h42da1170486942b18232465d02fe02fe020b0257421e08eb42da115442dacbe6;
   localparam u1_6 = 256'h36de021a36de0231097a02fe026b02fe429332f236de022b02fe02fe728602fe;
   localparam u1_7 = 256'h427d4290da3442b2823232f202fe02fe437d027702731cf44276021a421e086e;
   localparam u1_8 = 256'hda92428903ad0229dd3402fe038b02fe427f333411f0022102fe02fe427d0085;
   localparam u1_9 = 256'h32f2099f029e02fe36de489d02fe42134293469ada34039542944234dd92da34;
   localparam u1_A = 256'h03c5023f52ef023f42ba02feda3402fe022e82d003af063a02fe02fe03cea05e;
   localparam u1_B = 256'h12c1121f60de42b336deda3402fe421302bd43b442b4034b43b443b442b403e6;
   localparam u1_C = 256'h524f03a903cf0226dae602fe02a502fe42cb404702cd42e102fe02fe42e902fe;
   localparam u1_D = 256'h1ef41ef442e542b54392029102fe421342a102fe36dedd92421e080642c90337;
   localparam u1_E = 256'h65de02fe36de0211025602fe02c602fe421e65de038f021a02fe02fe021d02fe;
   localparam u1_F = 256'h02c70246027e42b636de038d02fe421342ab03fa42db4f1202dd02e6421e0872;
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
`ifdef verilator
      .sim_pre_RDATA( sim_a),
`endif
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
`ifdef verilator
      .sim_pre_RDATA( sim_b),
`endif
      .MASK(  16'h0               )
      );

   assign d[0] = indir[0];
   assign d[1] = indir[1];
   assign d[3] = indir[2];
   assign d[4] = indir[3];
   assign d[5] = indir[4];
   assign d[8] = indir[5];
   assign d[9] = indir[6];
   assign d[11] = indir[7];
   assign d[12] = indir[8];
   assign d[14] = indir[9];
   assign d[15] = indir[10];
   assign d[16] = indir[11];
   assign d[17] = indir[12];
   assign d[18] = indir[13];
   assign d[19] = indir[14];
   assign d[20] = indir[15];
   assign d[34] = indir[16];
   assign d[35] = indir[17];
   assign d[36] = indir[18];
   assign d[37] = indir[19];
   assign d[38] = indir[20];
   assign d[39] = indir[21];
   assign d[40] = indir[22];
   assign d[41] = indir[23];
   // replaces = 000000001101101100010000000010010010000110
   SB_LUT4 #(.LUT_INIT(16'h2038)) cmb_d02(.O(d[ 2]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h5000)) cmb_d07(.O(d[ 7]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h8000)) cmb_d10(.O(d[10]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hfebf)) cmb_d13(.O(d[13]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d22(.O(d[22]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0100)) cmb_d26(.O(d[26]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h5002)) cmb_d27(.O(d[27]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h2400)) cmb_d29(.O(d[29]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h4800)) cmb_d30(.O(d[30]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0221)) cmb_d32(.O(d[32]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 000000000010010011101000000000000001000000
   SB_LUT4 #(.LUT_INIT(16'h0820)) cmb_d06(.O(d[ 6]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2cd0)) cmb_d21(.O(d[21]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0784)) cmb_d23(.O(d[23]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0180)) cmb_d24(.O(d[24]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1042)) cmb_d25(.O(d[25]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2004)) cmb_d28(.O(d[28]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0327)) cmb_d31(.O(d[31]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[42] = 1'b0;
   assign d[43] = 1'b0;
   assign d[44] = 1'b0;
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
