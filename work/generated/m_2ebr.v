/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit
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
    *                      indirect_index 2
    *                      | indirect_index 1
    * inx         next     | | indirect index 0
    * || ucode    ucode    | | | direct representation
    * 00 LB_0     LB_1     0 0 0 01011011110000000001| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 1 00010111100111010010|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 2 01011011110010111110| IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0
    * 03 _L0x03   StdIncPc 3 3 2 000001010xx011100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 04 ADDI_0   StdIncPc 4 3 2 01100101010011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L0x05   ADDI_0   3 3 2 000000001xx000000100| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 06 LB_3     LB_4     0 3 2 00001101101000000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     1 3 2 00001011101000001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L0x08   SB_1     5 3 0 01011101110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     0 3 2 00001011100010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0x0a   SB_1     5 3 0 01011101110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JALR_3   0 3 3 01000101110000110011|        Q=1. Prep legalize target
    * 0c ADD_0    ADDI_0   1 3 2 00011101100000000100| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    3 3 2 100111010xx011100010| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    3 3 2 000111010xx000010000| SUB    Subtraction
    * 0f _L0x0f   StdIncPc 4 3 2 00100101011011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     0 3 2 00011111100010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   0 3 2 00011101100000011010|        RS1^0xffffffff to Q
    * 12 straddle Fetchu   6 4 4 11011010110001110110|  Fr10u IncPC, OpFetch
    * 13 condb_2  condb_3  0 3 2 00011111100000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  0 3 3 01011001110000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  1 3 5 00000001100000010110|        Branch on condition
    * 16 condb_5  StdIncPc 3 3 2 000000010xx011100110|        Branch not taken.
    * 17 condb_5t condb_6t 7 3 2 00100000100001111101|        Branch taken. yy=oldPC incase of access error
    * 18 BEQ      condb_2  5 3 2 00111101011000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   5 5 2 01000000x10001000001| JALR   (tmp) Prep pc=RS1+imm (target)
    * 1a ANDI_1   StdIncPc 8 3 2 00100101001011100110|        rd = Iimm & RS1
    * 1b _L0x1b   JAL_1    3 3 2 000000001xx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 1c ECAL_BRK ECAL_RET 2 3 2 00010110111010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 8 3 2 00100101011011100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 3 3 3 11010101110011010100|        Q = 4
    * 1f IJ_2     IJ_3     5 5 2 00000000111010110111|        Read word is to be masked with lsb = 0
    * 20 LH_0     LH_1     9 0 0 01111011110001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 4 3 2 00100101000011100110|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  0 3 6 00010101110100111001|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 _L0x23   StdIncPc 3 3 2 000001010xx011100110| FENCE  Prepare read PC (FENCE/FENCE.I)
    * 24 SLLI_0   SLLI_1   0 6 0 00011110x11000110101| SLLI   Shift left immediate.
    * 25 _L0x25   ADDI_0   3 3 2 000000001xx000000100| AUIPC  q = imm20+2 or imm20+4  (copy x/2)
    * 26 OR_1     OR_2     5 3 2 00011101000000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    0 3 2 01000001110000011101|        Q = rs2
    * 28 _L0x28   SH_1     9 3 0 01011101110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   0 3 2 00011101100000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L0x2a   SH_1     9 3 0 01011101110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  0 3 3 010xxxx1010000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    3 3 2 00011100xxx000111110| SLL    Shift left
    * 2d MULH_0   MULH_1   1 6 2 00010101100001101010| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e MULHU_1  MULHU_2  5 3 2 10011111011001000010|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 2f _L0x2f   StdIncPc 4 3 2 00100101011011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 4 3 7 00100101011011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  0 3 2 00011111100000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    7 3 2 00100000100010000110|      Prep Instradr to yy. Refetch instradr
    * 33 JALR_3   JAL_25   7 5 2 00000001001010011110|        Q = (RS1+imn) & 0xfffffffe
    * 34 JAL_3    Fetch    7 4 2 00011010100011011110|      Prep fetch next instr.
    * 35 SLLI_1   SLLI_2   8 6 2 00110111100000110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   _L0x03   8 7 2 00110111110000000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  a 3 5 001xxxx1000011010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  5 3 2 00111101011000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 8 3 2 10100101000011100110|        Last shift.
    * 3a SRxI_1   SRxI_2   8 6 6 00110101100100111101|        Register to shift to Q
    * 3b _L0x3b   JAL_1    3 3 2 000000001xx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 3c CSRRW_0  CSRRW_1  5 3 2 00101101011001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   _L0x03   8 7 6 00110101100100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   1 6 0 00011110x00000110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   1 6 0 00011110x00000111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     2 0 8 01011011110001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   7 3 2 00110101000000001011|        yy=jj. Prep get Q=1
    * 42 MULHU_2  MULHU_3  0 6 6 00010101110101100000|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  0 3 2 00000000100011101010|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  0 3 2 00011111101000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    0 3 3 01010101110001100101|        Chk ofs. Now 0x104. Prep +1, so ~ofs+0x105
    * 46 ILL_1    ILL_2    a 3 2 00110100x00001000111|        Store PC to mepc
    * 47 ILL_2    ILL_3    a 5 2 00110101000010001111|        Store 0 to mtval
    * 48 _L0x48   SW_1     2 8 8 01011101110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  0 3 3 01000001110001001011|        Construct PC storage adr
    * 4a _L0x4a   SW_1     2 8 8 01011101110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  b 9 2 00010100100010110001|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   3 3 2 000111010xx000110001| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  7 6 2 00111101000000101110| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     3 3 2 000xxxx0xxx011111110| Illegal instruction seen
    * 4f MRET_8   MRET_9   3 3 3 11010101110001110100|        +4, so now 0x103
    * 50 LW_1     StdIncPc 8 1 9 00110111000011100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   c 5 2 00110100111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 1 00010111100101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   c 5 2 00110100111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     1 7 6 00010101100111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 c 5 2 00110101011000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 3 2 00010001101001010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     0 3 2 00010001100010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    1 3 6 11010111100101101110|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   5 3 2 00111111011010011100|        REM = Q to yy
    * 5a SB_1     SB_2     7 6 2 00110111100001011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L0x5b   JAL_1    3 3 2 000000001xx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 5c CSRRS_0  CSRRW_1  5 3 2 00101101011001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     7 7 2 00110111110011111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 1 00010111100101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   c 5 2 00110100111011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 MULHU_3  MULHU_2  1 3 2 10011111100001000010|        Shift Q and rM. Prepare read rs1
    * 61 EBRKWFI2 EBREAK_1 5 3 5 00101101001011110111| EBREAK/WFI2 Select EBREAK or WFI.
    * 62 DIV_8    DIV_7    0 6 3 01010111110011001000|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    0 a 3 01010111110001011000|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  0 3 2 00011111101000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    3 3 5 000000010xx011101111|        Prepare read PC.
    * 66 SW_1     SW_2     b 5 2 00011100100011110010|        Write d to a+k until accepted
    * 67 SW_E1SWE SW_E2    c 5 2 00100100x11010010011|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 8 3 2 00100101000011100110|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     0 3 2 00010101100010001011|        RS2 > 0, RS1 < 0, change sign yy
    * 6a MULH_1   MULH_2   5 3 2 00110101000011111001|        Store ~rs1 to Ryy. Prep construct 1.
    * 6b SB_4     SB_5     1 b 2 00011001100001111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   3 3 2 000111010xx000110001| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  7 6 2 00111101000000101110| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e DIV_C    DIV_e    7 3 2 00111100100010111001|        rM to yy. Q=ffffffff
    * 6f MRET_6   MRET_7   0 3 3 010xxxx1110011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    1 7 6 00010101100110111010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 c 5 2 00110101011000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   0 3 2 00001101101000011010|        Invert q. Prepare read mask
    * 73 unalignd straddle 0 3 2 00000101011000010010|  Fr10u Unaligned pc, prep read high hword
    * 74 MRET_9   Fetch    5 4 3 01011010110011011110|        +1, IncPC, OpFetch next
    * 75 IJ_5     Fetch    7 4 2 00011010101011011110|        Mask and use as PC
    * 76 Fetchu   Fetch2u  0 3 a 00000111011011010101|  Fr10u Read and latch instruction
    * 77 eFetchu  Fetch2u  0 1 b 00010111011011010101|  Fr10u rep Read until d=mem[(rs1+ofs) & ~3u]
    * 78 DIV_4    DIV_6    5 3 2 00100001011010101010|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    0 3 3 11010101110010101000|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     8 5 2 00011000100011110010|        Write d to a+k until accepted
    * 7b _L0x7b   JAL_1    3 3 2 000000001xx000110010| JAL. J-imm is in q. Prep get isntradr from jj
    * 7c CSRRC_0  CSRRW_1  5 3 2 00101101011001001001| CSRRC  Decoded CSR adr in yy
    * 7d condb_6t Fetch    5 4 2 01011010110011011110|        Branch taken.
    * 7e NMI_1    NMI_2    a 3 2 001xxxx1000010010000|        Store pc to mepc.
    * 7f unx7f             d 6 0 00xxxxxxxxxxxxxxxxxx| 7f: Not in use 
    * 80 LBU_0    LBU_1    0 0 0 01011011110010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 unx81             d 6 0 00xxxxxxxxxxxxxxxxxx| 81: Not in use 
    * 82 DIV_1    DIV_3    5 3 2 00011101000010101000|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    0 3 2 01010101110010000010|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   0 3 2 00011111101000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 1 00010111100111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_25   5 5 2 01000001010010011110|      Prep pc = jj + ofs
    * 87 unx87             d 6 0 00xxxxxxxxxxxxxxxxxx| 87: Not in use 
    * 88 DIV_E    DIV_10   3 a 2 10011110xxx010011100|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 4 3 2 00100101011011100110|        RS2 == 0, return 0xffffffff
    * 8a DIVU_5   ANDI_1   3 3 6 110101110xx100011010|        Transfer rM to rDee
    * 8b LB_6     StdIncPc 4 3 3 11100101010011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    3 3 2 000111110xx000101001| XOR    xor
    * 8d DIV_0    DIV_1    1 c 2 10010111100010000010| DIV    Branch on sign dividend RS1
    * 8e _LCSRRS_1 ILLe     3 3 2 000xxxx0xxx011111110| Illegal instruction seen
    * 8f ILL_3    ILL_4    0 3 3 00010101110010101001|        Q = 1
    * 90 NMI_2    JAL_3    c d 2 00101001011000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   6 d 3 11100100x10010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    a 3 2 00110010x00000110100|        PC to mepc
    * 93 SW_E2    SW_E3    a 3 2 00110111000010010101|        Store address that faulted
    * 94 SW_E4    JAL_3    7 d 2 00110010x10000110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    3 3 3 11010111110010010100|        Q = 3
    * 96 SH_1     SH_2     7 6 2 00110111100010111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SW_E1SWH SW_E2    c 5 2 00100100x11010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  5 3 2 00111101011000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L0x99   ILLe     3 3 2 000xxxx0xxx011111110|  Not in use (illegal as entry)
    * 9a ECALL_6  JAL_3    6 d 2 01110010x10000110100|        mcause = 11
    * 9b SH_4     SH_5     e 8 2 00011001100010011111|        Address back to Q. Prepare get item to write
    * 9c DIV_10   DIV_12   1 a 2 10011001000001101000|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   1 a 2 10011001000010100010|        RS2 < 0. Branch on sign of RS1
    * 9e JAL_25   JAL_3    d 3 4 11100101010000110100|      Prep WTRG = jj+2/4 (return adr)
    * 9f SH_5     SW_2     b 3 2 00011000100011110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    9 0 0 01111011110001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm
    * a1 ECALL_4  ECALL_5  3 3 3 11010101110010110110|        Q = 4
    * a2 DIV_14   LB_6     0 3 2 00010101100010001011|        RS2 < 0, RS1 >= 0, change sign yy
    * a3 DIV_15   StdIncPc 8 3 2 00100101000011100110|        RS2 < 0, RS1 < 0, yy is true result
    * a4 SRxI_0   SRxI_1   0 6 0 00011110x11000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   0 3 3 01001101110010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  2 3 8 00010110111011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 0 3 2 010xxxx1110001100001| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    0 a 2 10010101100001111000|        Branch on sign divisor RS2
    * a9 ILL_4    JAL_3    5 d 3 01110010x10000110100|        Store 2 to mcause
    * aa DIV_6    DIV_7    3 3 2 100101110xx011001000|        Write M. Prepare shift
    * ab EBREAK_2 ECALL_6  a 3 2 00110101000010011010|        pc to mepc
    * ac _L0xac   SRx_1    3 3 2 00011100xxx000111111| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   3 6 2 100111010xx011100000| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _L0xae   SRx_1    3 3 2 00011100xxx000111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   0 3 3 010xxxx1110011000101|        0x202 + 0xff + 1 = 0x302
    * b0 aF_SW_3  LDAF_3   6 d 2 01100100x10010010010|        Store 7 to mcause
    * b1 CSRRW_3  CSRRW_4  3 3 3 11010101110010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b2 CSRRW_4  Fetch    6 4 3 11011010110011011110|        IncPC, OpFetch, but force +4
    * b3 unxb3             d 6 0 00xxxxxxxxxxxxxxxxxx| b3: Not in use 
    * b4 eFetch3  unalignd c 3 c 01011111110001110011|  Fr11  Write minstret. Update I. Q=immediate, use dinx
    * b5 SH_3     SH_4     0 3 2 00000001011010011011|        Prepare get back address to use 
    * b6 ECALL_5  ECALL_6  3 3 3 11010101110010011010|        Q = 8
    * b7 IJ_3     IJ_4     7 3 2 00110101000010111101|        Store present PC in case of access error
    * b8 BGE      condb_2  5 3 2 00111101011000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    0 3 3 00011001100011000000|        Calc carry of RS2+0xFFFFFFFF
    * ba LHU_3    ANDI_1   0 3 2 00001111101000011010|        Invert q. Prepare read mask
    * bb SH_2     SH_3     7 7 2 00110111110010110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  5 3 2 00101101011001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     IJ_5     0 3 3 01000101110001110101|        Construct Q = 1
    * be IJ_1     IJ_2     1 1 2 00010111100000011111|        Read until q=mem[(rs1+ofs)&~1u]
    * bf IJT_1    IJT_2    1 1 2 00010111100011000001|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    1 3 5 00011101100010001000|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    5 3 2 00110101011011101001|        Read word is to be masked with ~1u
    * c2 DIVU_3   DIVU_2   0 6 3 01010111110011001010|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   0 a 3 01010111110010001010|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    5 3 2 00011111001011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   0 3 2 00000001101001101111|        ~302
    * c6 IJT_4    ILL_2    a 3 2 00110101101001000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   a 3 2 001xxxx1000011001011|        Store pc to mepc.
    * c8 DIV_7    DIV_8    1 3 d 10011001110001100010|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   3 3 2 01001101110010100101|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   1 3 d 10011001110011000010|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc c d 2 00101001011011100110|        mtval = 0.
    * cc OR_0     OR_1     3 3 2 000111110xx000100110| OR     or
    * cd REM_0    DIV_1    1 c 2 10010111100010000010| REM    Branch on sign dividend RS1
    * ce _LCSRRCI_1 ILLe     3 3 2 000xxxx0xxx011111110| Illegal instruction seen
    * cf MRET_7   MRET_8   3 3 5 000011010xx001001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  0 3 3 01000001110000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   5 3 2 00001101011011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     1 7 6 00010101100100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 c 5 2 00110101011000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   5 d 3 01100100x10010010010|        Store 5 to mcause
    * d5 Fetch2u           c 5 e 01011111110000000000|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * d6 eILL0c   ILLe     3 3 2 000xxxx0xxx011111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  c 5 2 00110101011010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  5 3 2 00111101011000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  3 3 2 100111110xx001000010|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   3 3 2 000101010xx010010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   5 5 3 01111000x10010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  5 3 2 00101101011001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  c 5 2 00110101011011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   5 1 b 00010111011011110100|  Fr11  Read and latch instruction
    * df eFetch   Fetch2   5 1 b 00010111011011110100|  Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   5 3 2 00110111000011001010|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    1 3 2 00000001100000011101|        Q = RS1
    * e2 MUL_1    MUL_2    0 6 6 00010101110111101000|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   3 3 6 110101110xx100011010|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   0 3 2 00011111101000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  3 3 3 11010101110010110000|        Q = 4
    * e6 StdIncPc Fetch    6 4 4 11011010110011011110|  Fr11  IncPC, OpFetch
    * e7 aFault   aFault_1 c 5 2 00110101011000011110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    1 3 2 10011101100011100010|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    0 3 3 01011001110011000110|        Construct Q = 1
    * ea MULHU_5  MULHU_6  0 3 2 00011001110000100010|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     0 3 2 00001111101001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    3 3 2 000111110xx000010001| AND    And 
    * ed REMU_0   DIVU_1   3 6 2 100111010xx011100000| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     3 3 2 000xxxx0xxx011111110| Illegal instruction seen
    * ef WFI_5    Fetch    6 4 3 11011010110011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    1 7 6 00010101100101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 c 5 2 00110101011000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 3 2 000001010xx011100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  3 3 2 000xxxx01xx011011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   eFetch3  c 5 f 01000011010010110100|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 c 5 2 00110101011011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    3 3 3 11011001110011111010| WFI    Chk offset=0x105. Now 0xff. Prep 0xff+4 = 0x103
    * f7 EBREAK_1 EBREAK_2 c 5 2 00100001011010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  5 3 2 00111101011000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   5 3 3 01011101010011011001|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    0 3 3 01010101110001000101|        Chk ofs. Now 0x103. Prep +1+~ofs, so ~ofs+0x104
    * fb SB_3     SB_4     0 3 2 00000001011001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  5 3 2 00101101011001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    3 3 2 000001010xx001111110| NMI    Get current PC
    * fe ILLe     ILL_1    3 3 2 00000100xxx001000110| Illegal
    * ff QINT_0   QINT_1   3 3 2 000001010xx011000111| INT    Get current PC
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
