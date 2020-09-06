/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Automatically generated from ../code/ucode.h by midgetv_indirectEBR.c.
 * Do not edit
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has  45 columns
 * Removed:  000000000000000000000000000000000000000000000 These are treated already, removed from consideration
 * Reserved: 000000000000000000000000000000000010000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 45
 * 217 distinct lines in remaining untreated columns
 * c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 217 216 217 215 213 215 217 217 217 217   x 217 217 217 216 216 217 216 217 216 217 217 217 217 217 217 217 217 217 217 217 217 217 217 217 216 217 216 215 217 216 217 216 216 215  kill col  4  Tbl  43 cols 000000000000000000000000000000000010000010000 has 213 unique lines.
 * 213 212 213 211     210 213 213 213 213   x 213 213 213 210 212 213 211 213 212 213 213 213 213 213 213 213 213 213 213 213 213 213 213 212 212 213 212 211 213 212 213 212 212 211  kill col 14  Tbl  42 cols 000000000000000000000000000000100010000010000 has 210 unique lines.
 * 210 209 210 208     207 210 210 210 210   x 210 210 210     208 209 209 210 209 210 210 210 210 210 210 210 210 210 210 210 210 210 210 209 209 210 208 208 210 209 210 208 208 208  kill col  5  Tbl  41 cols 000000000000000000000000000000100010000110000 has 207 unique lines.
 * 206 206 207 204         207 207 207 207   x 207 207 207     205 206 206 207 206 207 207 207 207 207 207 207 207 207 207 207 207 207 207 206 206 207 205 205 207 206 206 205 205 205  kill col  3  Tbl  40 cols 000000000000000000000000000000100010000111000 has 204 unique lines.
 * 203 203 204             204 204 204 204   x 204 204 204     202 203 203 204 203 204 204 204 204 204 204 204 204 204 204 204 204 204 204 202 203 204 202 202 204 203 202 202 202 202  kill col 44  Tbl  39 cols 100000000000000000000000000000100010000111000 has 202 unique lines.
 * 201 201 202             202 202 202 202   x 202 202 202     200 200 201 202 201 202 202 202 202 202 202 202 202 202 202 202 202 202 202 200 201 202 199 199 201 200 199 196 200      kill col 42  Tbl  38 cols 101000000000000000000000000000100010000111000 has 196 unique lines.
 * 195 195 196             196 196 196 196   x 196 196 196     194 193 195 196 194 196 196 196 196 196 196 196 196 196 196 196 196 196 196 194 195 196 193 191 193 193 193     194      kill col 38  Tbl  37 cols 101000100000000000000000000000100010000111000 has 191 unique lines.
 * 190 190 191             191 191 191 191   x 190 191 189     189 188 190 190 189 191 191 191 191 191 191 191 191 191 191 191 191 191 191 189 190 191 185     188 186 187     189      kill col 37  Tbl  36 cols 101000110000000000000000000000100010000111000 has 185 unique lines.
 * 184 184 185             184 185 183 185   x 184 185 183     182 180 181 184 183 185 185 185 185 185 185 184 185 185 185 185 185 185 185 182 182 185         179 179 179     183      kill col 41  Tbl  35 cols 101100110000000000000000000000100010000111000 has 179 unique lines.
 * 177 178 179             177 179 177 179   x 178 179 177     175 174 175 178 177 179 179 179 179 179 179 178 179 179 179 179 179 179 179 175 176 179         171 169         172      kill col 40  Tbl  34 cols 101110110000000000000000000000100010000111000 has 169 unique lines.
 * 165 168 169             167 169 166 166   x 168 169 166     164 161 162 167 166 167 169 169 169 169 169 168 169 169 169 169 169 169 169 165 166 168         154             156      kill col 39  Tbl  33 cols 101111110000000000000000000000100010000111000 has 154 unique lines.
 * 150 153 154             149 154 149 149   x 152 154 150     145 145 145 152 152 153 152 154 154 154 153 148 154 154 154 154 154 154 154 150 151 152                         133      kill col 43  Tbl  32 cols 111111110000000000000000000000100010000111000 has 133 unique lines.
 * 129 132 133             128 133 128 127   x 131 133 127     123 123 123 131 131 132 130 133 132 132 132 129 133 133 133 133 133 133 133 129 127 132                                  kill col 17  Tbl  31 cols 111111110000000000000000000100100010000111000 has 123 unique lines.
 * 119 122 123             117 123 118 117   x 121 123 117     108 114     121 121 120 119 123 122 122 122 119 123 123 123 123 123 123 123 118 117 122                                  kill col 15  Tbl  30 cols 111111110000000000000000000101100010000111000 has 108 unique lines.
 * 104 107 107             103 108 104 103   x 105 108 102          99     106 105 105 104 108 106 107 107 104 108 108 108 108 108 108 107 103 102 107                                  kill col 16  Tbl  29 cols 111111110000000000000000000111100010000111000 has  99 unique lines.
 *  95  98  98              95  99  92  95   x  94  99  93                  97  96  96  95  99  97  98  98  95  99  99  98  99  99  99  98  93  94  97                                  kill col  8  Tbl  28 cols 111111110000000000000000000111100010100111000 has  92 unique lines.
 *  88  91  91              88  92      87   x  84  91  85                  89  89  89  88  92  90  91  91  88  92  92  91  92  92  91  91  85  87  90                                  kill col 11  Tbl  27 cols 111111110000000000000000000111100110100111000 has  84 unique lines.
 *  80  83  83              81  84      78   x      83  77                  81  81  81  79  84  82  83  83  80  84  84  83  84  83  83  83  77  77  81                                  kill col 35  Tbl  26 cols 111111110100000000000000000111100110100111000 has  77 unique lines.
 *  72  75  76              74  77      71   x      76  71                  74  74  74  72  77  75  76  76  73  77  77  76  77  76  76  76  68      73                                  kill col 34  Tbl  25 cols 111111110110000000000000000111100110100111000 has  68 unique lines.
 *  64  66  66              65  68      62   x      67  62                  65  65  65  64  68  66  67  67  64  68  68  67  68  67  67  67          64                                  kill col 13  Tbl  24 cols 111111110110000000000000000111110110100111000 has  62 unique lines.
 *  59  60  60              59  62      56   x      60                      59  59  59  59  62  60  61  61  58  62  62  61  62  61  61  61          59                                  kill col  9  Tbl  23 cols 111111110110000000000000000111110111100111000 has  56 unique lines.
 *  53  54  54              53  56           x      54                      52  53  53  51  56  54  55  55  52  56  55  55  56  55  53  55          54                                  kill col 21  Tbl  22 cols 111111110110000000000001000111110111100111000 has  51 unique lines.
 *  48  49  49              48  51           x      49                      46  47  47      51  49  50  50  48  51  50  50  51  47  48  50          49                                  kill col 18  Tbl  21 cols 111111110110000000000001001111110111100111000 has  46 unique lines.
 *  43  44  44              43  46           x      44                          42  42      45  44  45  45  43  46  45  45  46  42  43  45          44                                  kill col 31  Tbl  20 cols 111111110110010000000001001111110111100111000 has  42 unique lines.
 *  39  40  40              40  42           x      40                          37  35      41  40  41  41  39  42  41  41  42      39  41          40                                  kill col 20  Tbl  19 cols 111111110110010000000001101111110111100111000 has  35 unique lines.
 *  33  33  33              34  35           x      32                          31          34  32  34  34  33  35  33  34  34      31  33          33                                  kill col 32  Tbl  18 cols 111111110110110000000001101111110111100111000 has  31 unique lines.
 *  29  29  29              30  31           x      29                          26          30  29  30  28  29  31  29  30  30          28          29                                  kill col 19  Tbl  17 cols 111111110110110000000001111111110111100111000 has  26 unique lines.
 *  24  24  24              25  26           x      24                                      25  24  25  24  24  26  24  25  25          24          24                                  kill col 36  Tbl  16 cols 111111111110110000000001111111110111100111000 has  24 unique lines.
 *  22  22  22              23  24           x      22                                      23  22  23  22  22  24  22  23  23          22                                              kill col 33  Tbl  15 cols 111111111111110000000001111111110111100111000 has  22 unique lines.
 *  20  20  20              21  22           x      20                                      21  20  21  20  20  22  20  21  21                                                          kill col 28  Tbl  14 cols 111111111111110010000001111111110111100111000 has  20 unique lines.
 *  18  18  18              19  20           x      18                                      19  18  19  18  18  20      18  19                                                          kill col 29  Tbl  13 cols 111111111111110110000001111111110111100111000 has  18 unique lines.
 *  16  16  16              17  18           x      16                                      17  16  17  16  16  18          17                                                          kill col 26  Tbl  12 cols 111111111111110110100001111111110111100111000 has  16 unique lines.
 *
 * Round 1: 000000000000001001011110000000001000011000111  4 columns for indexes to table representing 12 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 37
 * 216 distinct lines in remaining untreated columns
 * c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x   x   x 214 212 214   x   x 216 216   x 213   x 216 215 215 216 215 216 215 216 216   x   x   x   x 216   x 216 216   x 216 216 216 216 212 216 215 214 216 215 216 215 215 214  kill col 35  Tbl  31 cols 000000000100001001011110000000001010011000111 has 212 unique lines.
 *   x   x   x 210 208 210   x   x 212 212   x 208   x 212 211 211 212 211 212 211 212 212   x   x   x   x 212   x 212 212   x 212 212 212 212     212 211 210 212 211 212 211 211 210  kill col 11  Tbl  30 cols 000000000100001001011110000000001110011000111 has 208 unique lines.
 *   x   x   x 206 204 206   x   x 208 208   x       x 208 207 207 208 207 208 207 208 208   x   x   x   x 208   x 208 208   x 208 208 208 208     208 207 205 208 207 208 207 207 206  kill col  4  Tbl  29 cols 000000000100001001011110000000001110011010111 has 204 unique lines.
 *   x   x   x 202     201   x   x 204 204   x       x 204 201 203 204 202 204 203 204 204   x   x   x   x 204   x 204 204   x 204 204 204 202     204 203 201 204 203 204 203 203 202  kill col 38  Tbl  28 cols 000000100100001001011110000000001110011010111 has 201 unique lines.
 *   x   x   x 199     198   x   x 200 201   x       x 200 198 200 201 199 201 200 201 201   x   x   x   x 201   x 201 201   x 201 201 201 199     201 199     201 197 201 198 200 198  kill col 40  Tbl  27 cols 000010100100001001011110000000001110011010111 has 197 unique lines.
 *   x   x   x 195     194   x   x 195 197   x       x 196 194 195 197 194 197 196 197 197   x   x   x   x 197   x 197 197   x 197 197 197 195     197 193     194     196 191 196 194  kill col 42  Tbl  26 cols 001010100100001001011110000000001110011010111 has 191 unique lines.
 *   x   x   x 189     188   x   x 189 191   x       x 190 187 189 191 188 191 190 191 191   x   x   x   x 191   x 191 191   x 191 191 191 189     191 185     187     188     188 186  kill col 37  Tbl  25 cols 001010110100001001011110000000001110011010111 has 185 unique lines.
 *   x   x   x 183     182   x   x 180 185   x       x 184 180 183 184 182 185 184 185 185   x   x   x   x 185   x 185 185   x 185 185 185 183     185         176     178     180 179  kill col 39  Tbl  24 cols 001011110100001001011110000000001110011010111 has 176 unique lines.
 *   x   x   x 173     173   x   x 169 174   x       x 175 171 174 175 171 176 175 176 176   x   x   x   x 176   x 176 176   x 176 176 176 174     176                 163     167 166  kill col 41  Tbl  23 cols 001111110100001001011110000000001110011010111 has 163 unique lines.
 *   x   x   x 159     157   x   x 156 160   x       x 162 156 159 160 159 162 162 163 163   x   x   x   x 161   x 163 163   x 163 163 163 159     162                         147 151  kill col 43  Tbl  22 cols 011111110100001001011110000000001110011010111 has 147 unique lines.
 *   x   x   x 140     140   x   x 137 143   x       x 145 137 143 140 139 146 146 147 143   x   x   x   x 145   x 147 147   x 147 147 147 141     146                             128  kill col 44  Tbl  21 cols 111111110100001001011110000000001110011010111 has 128 unique lines.
 *   x   x   x 118     118   x   x 117 121   x       x 125 117 120 116 118 127 127 127 124   x   x   x   x 126   x 128 128   x 128 128 128 120     126                                  kill col 16  Tbl  20 cols 111111110100001001011110000010001110011010111 has 116 unique lines.
 *   x   x   x 107     105   x   x 107 109   x       x 112 103 106     106 115 115 113 112   x   x   x   x 114   x 116 115   x 116 116 116 108     114                                  kill col 14  Tbl  19 cols 111111110100001001011110000010101110011010111 has 103 unique lines.
 *   x   x   x  96      92   x   x  94  95   x       x  99      93      91 101 102 100  99   x   x   x   x 101   x 102 102   x 103 102 103  93      99                                  kill col 17  Tbl  18 cols 111111110100001001011110000110101110011010111 has  91 unique lines.
 *   x   x   x  84      81   x   x  81  83   x       x  86      80          88  88  86  85   x   x   x   x  89   x  90  90   x  91  90  91  80      87                                  kill col 34  Tbl  17 cols 111111110110001001011110000110101110011010111 has  80 unique lines.
 *   x   x   x  72      69   x   x  71  72   x       x  76      70          77  77  76  75   x   x   x   x  78   x  79  79   x  80  79  80          76                                  kill col  5  Tbl  16 cols 111111110110001001011110000110101110011110111 has  69 unique lines.
 *   x   x   x  58           x   x  59  60   x       x  64      59          66  66  66  65   x   x   x   x  66   x  68  68   x  69  68  69          66                                  kill col  3  Tbl  15 cols 111111110110001001011110000110101110011111111 has  58 unique lines.
 *   x   x   x               x   x  49  48   x       x  52      48          53  55  54  55   x   x   x   x  55   x  57  57   x  58  57  58          54                                  kill col 15  Tbl  14 cols 111111110110001001011110000111101110011111111 has  48 unique lines.
 *   x   x   x               x   x  40  39   x       x  42                  42  44  45  45   x   x   x   x  45   x  47  47   x  47  46  47          44                                  kill col  9  Tbl  13 cols 111111110110001001011110000111101111011111111 has  39 unique lines.
 *   x   x   x               x   x  32       x       x  34                  32  35  36  35   x   x   x   x  36   x  38  38   x  38  37  38          36                                  kill col 18  Tbl  12 cols 111111110110001001011110001111101111011111111 has  32 unique lines.
 *   x   x   x               x   x  25       x       x  27                      27  29  28   x   x   x   x  29   x  31  31   x  30  30  31          29                                  kill col  8  Tbl  11 cols 111111110110001001011110001111101111111111111 has  25 unique lines.
 *   x   x   x               x   x           x       x  20                      21  21  20   x   x   x   x  22   x  24  24   x  23  22  24          23                                  kill col 21  Tbl  10 cols 111111110110001001011111001111101111111111111 has  20 unique lines.
 *   x   x   x               x   x           x       x  16                      17  17       x   x   x   x  18   x  19  19   x  18  17  19          18                                  kill col 13  Tbl   9 cols 111111110110001001011111001111111111111111111 has  16 unique lines.
 *
 * Round 2: 000000001001110110100000110000000000000000000  4 columns for indexes to table representing  9 original columns (uses 16 of 16 lines in indirect table).
 * Direct:  111111110110000000000001001111110111100111000 24 columns
 * Success. Use 2 EBRs, 21 LUTs.
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
    * 00 LB_0     LB_1     0 0 000000010100110111011100| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 110100100000101111011001|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 101111100100110111011100| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 FENCE    StdIncPc 1 3 11100110000000101x010xxx| f      Prepare read PC (FENCE)
    * 04 ADDI_0   StdIncPc 3 3 111001100100001011010100| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L05     ADDI_0   1 3 00000100000000101x001xxx| AUIPC  q = imm20 (copy x/8)
    * 06 LB_3     LB_4     1 3 000001110000011011011010|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     1 3 000010010000010111011011|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L08     SB_1     4 0 010110100110111011011100| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     1 3 101000110000010111011000|        q = D^0xffffffff^q = D^0x80
    * 0a _L0a     SB_1     4 0 010110100110111011011100| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    3 4 100001100010001011010011|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   1 3 000001000000111011011001| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    1 3 11100010100011101x010xxx| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    1 3 00010000000011101x010xxx| SUB    Subtraction
    * 0f _L0f     StdIncPc 3 3 111001100000001011010110| LUI    q = imm20
    * 10 SUB_1    LB_6     1 3 101000110000111111011000|        Q = ~RS2
    * 11 AND_1    ANDI_1   1 3 000110100000111011011000|        RS1^0xffffffff to Q
    * 12 eFetch3           4 5 000000000111111111011100|  Fr11  Write minstret. Update I. Q=immediate, use dinx
    * 13 condb_2  condb_3  1 3 000101000000111111011000|        ~RS2 in Q
    * 14 condb_3  condb_4  1 6 000101010100001011011100|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  1 7 000101100000110011011001|        Branch on condition
    * 16 condb_5  Fetch    5 8 110111100010110110001110|        Branch not taken.
    * 17 condb_5t BrOpFet  5 4 011101000110110111011100|        Branch taken.
    * 18 BEQ      condb_2  3 3 000100110010111011010110| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   4 3 010000010110101011010100| JALR   jj=RS1+imm
    * 1a ANDI_1   StdIncPc 3 3 111001100000001011010011|        rd = Iimm & RS1
    * 1b _L1b     JAL_1    1 4 001100100000001011001110| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 1 2 101001100000101111001110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 3 3 111001100000001011010111|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 1 6 110101001100101010011100|        Q = 4
    * 1f IJ_2     IJ_3     3 3 101101110010101011010110|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     6 9 010100100110110111011100| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 3 3 111001100000001011010000|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  1 a 001110010000101011011100|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 FENCEI   StdIncPc 1 3 11100110000000101x010xxx| f      Prepare read PC (FENCE)
    * 24 SLLI_0   SLLI_1   1 0 00110101000011110100x110| SLLI   Shift left immediate.
    * 25 _L25     ADDI_0   1 3 00000100000000101x001xxx| AUIPC  q = imm20 (copy x/8)
    * 26 OR_1     OR_2     4 3 001001110010111011010000|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    1 3 000111010100000011011100|        Q = rs2
    * 28 _L28     SH_1     4 9 100101100110111011011100| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   1 3 001000010000111011011000|        Q = RS1^0xFFFFFFFF
    * 2a _L2a     SH_1     4 9 100101100110111011011100| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  1 6 001100000100xxxx11010100|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    1 3 00111110000011101x00xxxx| SLL    Shift left
    * 2d MULH_0   MULH_1   1 3 111110110000101001011001| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e EBRKWFI2 EBREAK_1 4 7 111101110010011011010010| EBREAK/WFI2 Select EBREAK or WFI
    * 2f _L2f     StdIncPc 3 3 111001100000001011010110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 3 b 111001100000001011010110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  1 3 001010110000111111011000|        ~rs2 to Q
    * 32 JAL_1    JAL_2    3 3 100001100110001011010100|        Target adr to yy
    * 33 JAERR_1  JAERR_2  7 3 10000001011100101100x100|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    5 c 110111100010110111001001|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   3 3 001101100000101101011001|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   FENCE    8 3 000000110000101101011101|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  3 7 110101110011xxxx11010001|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  3 3 000100110010111011010110| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 3 3 111001101000001011010001|        Last shift.
    * 3a SRxI_1   SRxI_2   3 a 001111010000101001011001|        Register to shift to Q
    * 3b _L3b     JAL_1    1 4 001100100000001011001110| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  4 3 010010010010011011010110| CSRRW  Decoded CSR adr in jj
    * 3d SRxI_2   FENCE    8 a 000000110000101001011001|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   1 0 00110101000011110100x001|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   1 0 00111010000011110100x001|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 4 010100000100110111011100| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   1 6 000010110100000011011100|        Q=1
    * 42 MULHU_2  MULHU_3  1 a 101110110000101001011100|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  1 3 111010100000000011001000|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  1 3 001010110000111111011010| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    1 6 011001010100101011011100|        More check offset
    * 46 ILL_1    ILL_2    6 3 010001110011110111011001|        Store PC to mepc and Q for read of instr
    * 47 ILL_2    ILL_3    1 c 100011110000101111011001|        Read until Q is offending instruction
    * 48 _L48     SW_1     9 4 011001100100111011011100| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  3 6 010010110110001011011100|        CSRRW sentinel 0x00000100
    * 4a _L4a     SW_1     9 4 011001100100111011011100| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  a 3 101100000001101011001001|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   1 3 00110001000011101x010xxx| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  3 3 100110110010111001010001| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     1 3 111111100000xxxx1x00xxxx| Illegal instruction seen
    * 4f MRET_8   StdIncPc 1 6 111001100100101011011100|        Prep +4
    * 50 LW_1     StdIncPc 3 d 111001100000101111010001|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   7 3 110110100011101011001110|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 010101000000101111011001|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   7 3 110110100011101011001110|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     b a 111010110000101001011001|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 7 3 000111100011101011010110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 3 010101110000100011011011|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     1 3 101000110000100011011000|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    1 a 101110101100101111011001|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   3 3 100111000010111111010110|        REM = Q to yy
    * 5a SB_1     SB_2     3 3 010111010010101101011001|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L5b     JAL_1    1 4 001100100000001011001110| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRS_1  4 3 101100010010011011010110| CSRRS  Decoded CSR adr in jj
    * 5d SB_2     SB_3     8 3 011010100010101101011101|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 011100000000101111011001|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   7 3 110110100011101011001110|  err   LD AlignFault. Faulting adr to mtval
    * 60 DIV_14   LB_6     1 3 101000110000101011011000|        RS2 < 0, RS1 >= 0, change sign yy
    * 61 DIV_15   StdIncPc 3 3 111001100000001011010001|        RS2 < 0, RS1 < 0, yy is true result
    * 62 DIV_8    DIV_7    1 6 110010000100101101011100|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    c 6 010110000100101111011100|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  1 3 001010110000111111011010| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    1 7 11101111000000101x010xxx|        Prepare read PC
    * 66 SW_1     SW_2     d 3 111100100001111011001001|        Write d to a+k until accepted
    * 67 SWE      SW_E2    7 3 10010011001100101100x110|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 3 3 111001100000001011010001|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     1 3 101000110000101011011000|        RS2 > 0, RS1 < 0, change sign yy
    * 6a SB_3     SB_4     1 3 011010110000000011010110|        Prepare get back address to use 
    * 6b SB_4     SB_5     e 3 011110100000110011011001|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   1 3 00110001000011101x010xxx| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  3 3 100110110010111001010001| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e LHU_3    ANDI_1   1 3 000110100000011111011010|        Invert q. Prepare read mask
    * 6f MRET_6   MRET_7   1 6 110011110100xxxx11011100|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    b a 011011100000101001011001|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 7 3 000111100011101011010110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   1 3 000110100000011011011010|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  7 3 011101100011110011010001|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   1 e 111101000000101111010001| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  1 3 01110011000000101x00xxxx|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  1 3 011101110000001011011000|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  3 6 01111101011110101100x100|        origPC to mepc. Prep read 0
    * 78 DIV_4    DIV_6    3 3 101010010010000011010110|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    1 6 101010001100101011011100|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     d 3 111100100000110011001001|        Write d to a+k until accepted
    * 7b _L7b     JAL_1    1 4 001100100000001011001110| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRC_1  4 3 101100100010011011010110| CSRRC  Decoded CSR adr in jj
    * 7d BAERR_4  JAL_3    f 3 00110100001010011100x001|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    3 3 100100000011xxxx11010001|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  7 3 01111101001110101100x001|        mtval is target
    * 80 LBU_0    LBU_1    0 0 100001010100110111011100| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  3 3 01111101001110101100x001|        Store PC to mepc
    * 82 DIV_1    DIV_3    4 3 101010000010111011010000|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    1 3 100000100100101011011100|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   1 3 001000010000111111011010| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 111100000000101111011001|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_3    3 6 00110100110011001000x100|        Return address to TRG
    * 87 JALRE1   JALRE2   3 3 01111111001111001100x001|  err   Store pc to mepc
    * 88 DIV_E    DIV_10   c 3 10011100100011111x00xxxx|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 3 3 111001100000001011010110|        RS2 == 0, return 0xffffffff
    * 8a ILL_4    ILL_5    1 6 100010110100101011011100|        Q = 1
    * 8b ILL_5    JAL_3    f 6 00110100011010011100x100|        Store 2 to mcause
    * 8c XOR_0    XOR_1    1 3 00101001000011111x010xxx| XOR    xor
    * 8d DIV_0    DIV_1    c 3 100000101000101101011001| DIV    Branch on sign dividend RS1
    * 8e aF_SW_3  LDAF_3   f 3 10010010011000101000x100|        Store 7 to mcause
    * 8f ILL_3    ILL_4    7 3 100010100011101011010110|        Store illegal instruction to mtval
    * 90 NMI_2    JAL_3    f 3 001101000011010011010110|        mtval = 0.
    * 91 LDAF_2   LDAF_3   f 6 10010010111000101000x100|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    3 3 00110100001110011100x001|        PC to mepc
    * 93 SW_E2    SW_E3    3 3 100101010011101111010001|        Store address that faulted
    * 94 SW_E4    JAL_3    f 3 00110100001010011100x101|        Store 6 to mcause
    * 95 SW_E3    SW_E4    1 6 100101001100101110011100|        Q = 3
    * 96 SH_1     SH_2     3 3 100110100010101101011001|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SWH      SW_E2    7 3 10010011001100101100x110|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  3 3 000100110010111011010110| BLT    Conditional Branch. Offset to Ryy
    * 99 _L99     ILLe     1 3 111111100000xxxx1x00xxxx| Illegal instruction seen
    * 9a SH_2     SH_3     8 3 101101010010101101011101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * 9b MULHU_1  MULHU_2  4 3 010000101010111111010110|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 9c DIV_10   DIV_12   c 3 011010001000110011010001|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   c 3 011000001000110011010001|        RS2 < 0. Branch on sign of RS1
    * 9e SH_4     SH_5     9 3 100111110001110011011001|        Address back to Q. Prepare get item to write
    * 9f SH_5     SW_2     4 3 111100100001110011001001|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    6 9 010111100110110111011100| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm.
    * a1 ECALL_4  ECALL_5  1 6 110011101100101010011100|        Q = 4
    * a2 DIVU_5   ANDI_1   1 a 00011010110010111x010xxx|        Transfer rM to rDee
    * a3 LB_6     StdIncPc 3 6 111001101100001011010100|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * a4 SRxI_0   SRxI_1   1 0 00111010000011110100x110| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   1 6 101011110100011011011100|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  1 4 110100000000101111001110| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 1 3 001011100100xxxx11011100| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    c 3 011110001000101011011000|        Branch on sign divisor RS2
    * a9 DIV_6    DIV_7    1 3 11001000100010111x010xxx|        Write M. Prepare shift
    * aa ECALL_6  JAL_3    f 3 00110100011010011000x100|        mcause = 11
    * ab EBREAK_2 ECALL_6  3 3 101010100011101011010001|        pc to mepc
    * ac _Lac     SRx_1    1 3 00111111000011101x00xxxx| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   1 3 11100000100011100x010xxx| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _Lae     SRx_1    1 3 00111111000011101x00xxxx| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   1 6 110001010100xxxx11011100|        0x202 + 0xff + 1 = 0x302
    * b0 CSRRW_3  StdIncPc 1 6 111001101100101010011100|        Prep emulation entrypt 0x108, here Q to 0x104
    * b1 CSRRS_1  CSRRWI_2 3 3 101101000110011010010100|        CSRRS sentinel 0x00000102 or 0xffffff82
    * b2 CSRRC_1  CSRRWI_2 3 6 101101001110011010010100|        CSRRC sentinel 0x0000103
    * b3 CSRRWI_1 CSRRWI_2 3 6 101101000110011011010100|        CSRRWI sentinel 0xffffff80
    * b4 CSRRWI_2 CSRRW_2  1 6 010010110100001011011100|        Prepare write current PC to 0x100
    * b5 SH_3     SH_4     1 3 100111100000000011010110|        Prepare get back address to use 
    * b6 CSRRCI_1 CSRRWI_2 3 6 101101001110011010010100|        CSRRCI sentinel 0xffffff83
    * b7 IJ_3     IJ_4     1 3 101111010100110010011100|        Construct Q = 3
    * b8 BGE      condb_2  3 3 000100110010111011010110| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    1 6 110000000000110011011000|        Calc carry of RS2+0xFFFFFFFF
    * ba DIV_C    DIV_e    3 3 101110010010111011001001|        rM to yy. Q=ffffffff
    * bb MULHU_3  MULHU_2  1 3 010000101000111111011001|        Shift Q and rM. Prepare read rs1
    * bc CSRRWI_0 CSRRWI_1 4 3 101100110010010111010110| CSRRWI Decoded CSR adr in jj
    * bd IJ_4     Fetch    5 c 110111100010110111001011|        Mask and use as PC
    * be IJ_1     IJ_2     1 c 000111110000101111011001|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    1 c 110000010000101111011001|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    1 7 100010000000111011011001|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    3 3 111010010010101011010110|        Read word is to be masked with ~3u
    * c2 DIVU_3   DIVU_2   1 6 110010100100101101011100|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   c 6 101000100100101111011100|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    4 3 111000010010111111010010| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   1 3 011011110000000011011010|        ~302
    * c6 IJT_4    ILL_2    6 3 010001110011110111011011|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   3 3 110010110011xxxx11010001|        Store pc to mepc.
    * c8 DIV_7    DIV_8    1 f 011000101000110011011101|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   1 3 101001010100011010011100|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   1 f 110000101000110011011101|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc f 3 111001100011010011010110|        mtval = 0.
    * cc OR_0     OR_1     1 3 00100110000011111x010xxx| OR     or
    * cd REM_0    DIV_1    c 3 100000101000101101011001| REM    Branch on sign dividend RS1
    * ce ECALL_5  ECALL_6  1 6 101010101100101010011100|        Q = 8
    * cf MRET_7   MRET_8   1 7 01001111000001101x010xxx|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  1 6 001101110100001011011100| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   4 3 110010010010011011010110| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     b a 000001100000101001011001|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 7 3 000111100011101011010110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   f 6 10010010011000101100x100|        Store 5 to mcause
    * d5 eFetch2  Fetch    4 0 1101111000xxxxxxxxxxxxxx|  Fr11  Not in use
    * d6 eILL0c   ILLe     1 3 111111100000xxxx1x00xxxx| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  7 3 101000010011101011010110|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  3 3 000100110010111011010110| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  1 3 01000010100011111x010xxx|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   1 3 10010001000010101x010xxx|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   7 6 10010010011000101100x100|        Store 1 to mcause
    * dc CSRRSI_0 CSRRS_1  4 3 101100010010010111010110| CSRRSI Decoded CSR adr in jj
    * dd aF_SW_1  aF_SW_2  7 3 111001010011101011010110|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   1 e 111101000000101111010001|  Fr11  Read and latch instruction
    * df eFetch   Fetch2   1 e 111101000000101111010001|  Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   3 3 110010100010101111010000|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    1 3 000111010000000011011001|        Q = RS1
    * e2 MUL_1    MUL_2    1 a 111010000000101001011100|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   1 a 00011010110010111x010xxx|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   1 3 000110100000111111011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  1 6 100011101100101010011100|        Q = 4
    * e6 StdIncPc Fetch    5 8 110111101110110110001100|  Fr11  IncPC, OpFetch
    * e7 aFault   aFault_1 7 3 000111100011101011010110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    1 3 111000101000111011011001|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    1 3 110001100100110010011100|        Construct Q = 3
    * ea MULHU_5  MULHU_6  1 3 001000100000110011011100|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     1 3 010101100000011111011010|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    1 3 00010001000011111x010xxx| AND    And 
    * ed REMU_0   DIVU_1   1 3 11100000100011100x010xxx| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     1 3 111111100000xxxx1x00xxxx| Illegal instruction seen
    * ef WFI_5    Fetch    5 8 110111101110110110001100|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    b a 011100100000101001011001|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 7 3 000111100011101011010110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 1 3 11100110000000101x010xxx|        Prepare read PC
    * f3 aF_SW    aF_SW_1  1 3 110111010000xxxx1x001xxx|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   eFetch3  d 3 000100100111000111110100|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 7 3 110110110011101011010110|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    1 6 111110101100000010011100| WFI    To check offset
    * f7 EBREAK_1 EBREAK_2 7 3 101010110011001011010110| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  3 3 000100110010111011010110| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   4 6 110110010110111011010100|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    1 6 010001010100101011011100|        Check offset
    * fb MULH_1   MULH_2   3 3 111110010010101011010000|        Store ~rs1 to Ryy. Prep construct 1.
    * fc CSRRCI_0 CSRRCI_1 4 3 101101100010010111010110| CSRRCI Decoded CSR adr in jj
    * fd NMI_0    NMI_1    1 3 01111110000000101x010xxx| NMI    Get current PC
    * fe ILLe     ILL_1    1 3 01000110000000101x010xxx| Illegal
    * ff QINT_0   QINT_1   1 3 11000111000000101x010xxx| INT    Get current PC
    */
   localparam u0_0 = 256'h02d60e908e900ed922d36edc05d86edc05db06da028842d402904ddc0bd94ddc;
   localparam u0_1 = 256'h2ad6ca9c02d70bce02ce02d36ad42ed66ddc2d8e0cd942dc0fd87fdc0ed80fd8;
   localparam u0_2 = 256'h02d626d20a590e8040d46edc0ed86edc40dc2ed002880f4602900adc02d06ddc;
   localparam u0_3 = 256'h0f410f410a5926d602ce0a5982d12ed630d10b5d0b592dc972c462d40fd802d6;
   localparam u0_4 = 256'h4adc00802e510e901ac94edc62dc4edc0bd93dd94adc0fda00c80a5c40dc4ddc;
   localparam u0_5 = 256'h3ace0bd92b5d26d602ce2b592fd6cbd908d808db3ad60a593ace0bd93ace0bd1;
   localparam u0_6 = 256'h40dc07da2e510e900cd900d60ad802d132c61ec902900fda4bdc4b5c02d10ad8;
   localparam u0_7 = 256'h3ac130d129c126d602ce0cc9cadc20d67ac402d802800bd13cd106da3ad60a59;
   localparam u0_8 = 256'h3ad662848b590f9069c44adc02d68f803cc1cc840bd90fda4adc2ed03ac14ddc;
   localparam u0_9 = 256'h1cc91cd98cd18cd1afd62b5d00802ed632c62b59cb9c29c53bd139c1e28434d6;
   localparam u0_A = 256'h40dc0e808e100e803ad169848b908ad840dc0bce46dc0f46c2d4cb90ca9c6ddc;
   localparam u0_B = 256'h0bd90bd92dcb25d68fd92ec90cd82ed64c9ce69400d642dc66d4e6946694ca9c;
   localparam u0_C = 256'h0690ca9c8b590f9034d68cdd469c8cdd30d13ddb00da2fd24bdc4b5c2ad60ed9;
   localparam u0_D = 256'h0bd10bd13ad625d662c40a908f902ed63ad60080000062c43ad60a5926d642dc;
   localparam u0_E = 256'hed8c00808e100f9007da0cdc4c9c8ed93ad6ed8cca9c0fdacb900a5c00d92bd0;
   localparam u0_F = 256'h02900290029025d62ad04adc6ed42ed632d6c09c3ad671f4008802903ad60a59;
   localparam u1_0 = 256'h33e6131013e213043486405a13a3405a13091307130433e613e622be11d20001;
   localparam u1_1 = 256'h33b716d433e612a6143233e643413313547458de1716161513144500131a13a3;
   localparam u1_2 = 256'h33e647f713fb133e1630499613214996131d43271304103513e61a3933e66952;
   localparam u1_3 = 256'h103a10358a03434914323a3d33e6331337d7830333365cde73813386132b3be6;
   localparam u1_4 = 256'h16e613fe339b1331a3b09466364b94661c8f63471665132b13ea1abb160b0450;
   localparam u1_5 = 256'h73da1170836a43b11432335d339c1aba13a31357731ebaeb73da115473da3de6;
   localparam u1_6 = 256'h16cf131a339b1331e37a136b13a333e67393d3f217ef132bc65816c833e613a3;
   localparam u1_7 = 256'h737d3390f33443b21432d3f216a833a9367d137713731ef47376131a731eba6e;
   localparam u1_8 = 256'h738af392c3821329f634168b33e6c39c337f363411f01321138243a8337d0085;
   localparam u1_9 = 256'h43f2939fc360c368434283b513fe33137393339a1694f33433953334f692f334;
   localparam u1_A = 256'h16c5133f13e0133f33aaf33413c8c378132e14d016af103a36e61a1a16ce695e;
   localparam u1_B = 256'h1cc11c1f5cde43b3134233b916c0331313bd36b4139e164b36b436b433b416e6;
   localparam u1_C = 256'h174f16aac3821326f3e61fc213a51f6233cb6347136f43e1c6a216ca33e91788;
   localparam u1_D = 256'h1ef41ef473e543b1769213911342331373a113fe40def692731eba0643c91637;
   localparam u1_E = 256'h58de13fe13e013111356132213c613e2731e58de168e131a1a1a1ae8131d33ca;
   localparam u1_F = 256'h13c71346137e43b633f9164546d9331373ab16fa73dbd31213dd13e6731eba72;
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

   assign d[3] = indir[0];
   assign d[4] = indir[1];
   assign d[5] = indir[2];
   assign d[8] = indir[3];
   assign d[9] = indir[4];
   assign d[10] = indir[5];
   assign d[11] = indir[6];
   assign d[13] = indir[7];
   assign d[14] = indir[8];
   assign d[15] = indir[9];
   assign d[16] = indir[10];
   assign d[17] = indir[11];
   assign d[18] = indir[12];
   assign d[21] = indir[13];
   assign d[34] = indir[14];
   assign d[35] = indir[15];
   assign d[37] = indir[16];
   assign d[38] = indir[17];
   assign d[39] = indir[18];
   assign d[40] = indir[19];
   assign d[41] = indir[20];
   assign d[42] = indir[21];
   assign d[43] = indir[22];
   assign d[44] = indir[23];
   // replaces = 000000000000001001011110000000001000011000111
   SB_LUT4 #(.LUT_INIT(16'h0402)) cmb_d00(.O(d[0]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0960)) cmb_d01(.O(d[1]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h8160)) cmb_d02(.O(d[2]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0080)) cmb_d06(.O(d[6]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h4000)) cmb_d07(.O(d[7]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'hfdfe)) cmb_d12(.O(d[12]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d22(.O(d[22]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0214)) cmb_d23(.O(d[23]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d24(.O(d[24]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h7102)) cmb_d25(.O(d[25]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h4002)) cmb_d27(.O(d[27]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h6000)) cmb_d30(.O(d[30]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 000000001001110110100000110000000000000000000
   SB_LUT4 #(.LUT_INIT(16'he4a0)) cmb_d19(.O(d[19]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h81c8)) cmb_d20(.O(d[20]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0900)) cmb_d26(.O(d[26]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h8004)) cmb_d28(.O(d[28]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h8400)) cmb_d29(.O(d[29]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h5a07)) cmb_d31(.O(d[31]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4261)) cmb_d32(.O(d[32]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4200)) cmb_d33(.O(d[33]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1000)) cmb_d36(.O(d[36]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
