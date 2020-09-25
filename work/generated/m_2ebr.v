/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 46 columns
 * Removed:  0000000000000000000000000000000000000000000000 These are treated already, removed from consideration
 * Reserved: 0000000000000000000000000001000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 46
 * 204 distinct lines in remaining untreated columns
 *  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 c45 
 * 203 203 204 203 204 203 202 203 204 203 204 202 200 203 204 204 204 204   x 204 204 204 203 203 204 203 204 204 204 204 204 204 204 204 204 204 204 204 204 204 204 204 204 203 204 203  kill col 12  Tbl  44 cols 0000000000000000000000000001000001000000000000 has 200 unique lines.
 * 199 199 200 199 200 199 198 199 200 199 200 198     198 200 200 200 200   x 200 200 200 197 199 200 198 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 199 199 200 199  kill col 22  Tbl  43 cols 0000000000000000000000010001000001000000000000 has 197 unique lines.
 * 195 196 197 196 197 195 194 196 197 196 197 195     195 197 197 197 197   x 197 197 197     196 196 196 197 197 197 197 197 197 197 197 197 197 197 197 197 197 197 197 196 196 197 196  kill col  6  Tbl  42 cols 0000000000000000000000010001000001000001000000 has 194 unique lines.
 * 192 193 193 193 194 192     193 194 193 194 192     192 194 194 194 194   x 194 194 194     193 193 193 194 194 194 194 194 194 194 194 194 194 194 194 194 194 194 194 193 193 194 193  kill col 13  Tbl  41 cols 0000000000000000000000010001000011000001000000 has 192 unique lines.
 * 190 191 191 191 191 190     191 191 191 192 189         192 192 192 192   x 192 192 192     191 191 191 192 192 192 192 192 192 192 192 192 192 192 192 192 192 192 192 191 191 192 191  kill col 11  Tbl  40 cols 0000000000000000000000010001000011100001000000 has 189 unique lines.
 * 187 188 188 188 187 187     188 187 188 189             189 189 189 189   x 189 189 189     188 188 188 189 189 189 189 189 189 189 189 189 189 189 189 189 189 189 189 185 188 189 188  kill col 42  Tbl  39 cols 0001000000000000000000010001000011100001000000 has 185 unique lines.
 * 182 184 184 184 183 183     184 183 184 185             185 185 185 185   x 184 185 185     184 184 184 185 185 185 185 185 185 185 185 185 185 185 185 185 185 185 185     184 185 184  kill col  0  Tbl  38 cols 0001000000000000000000010001000011100001000001 has 182 unique lines.
 *     181 181 180 178 178     180 180 181 182             182 182 182 182   x 181 182 181     181 181 181 182 182 182 182 182 182 182 182 182 182 182 182 182 182 182 182     180 182 181  kill col  5  Tbl  37 cols 0001000000000000000000010001000011100001100001 has 178 unique lines.
 *     175 174 175 173         173 176 177 178             178 178 178 178   x 177 178 177     177 177 175 177 177 178 177 178 178 178 178 178 178 178 178 178 178 178 178     176 178 177  kill col  7  Tbl  36 cols 0001000000000000000000010001000011100011100001 has 173 unique lines.
 *     168 165 167 167             171 172 173             173 172 173 173   x 172 173 172     171 168 169 172 172 172 172 173 173 173 173 173 173 173 173 173 173 173 173     171 173 172  kill col  2  Tbl  35 cols 0001000000000000000000010001000011100011100101 has 165 unique lines.
 *     156     156 155             163 164 165             165 164 164 164   x 164 165 164     162 158 160 164 164 164 164 165 165 165 165 165 165 165 165 165 165 165 165     161 164 164  kill col  4  Tbl  34 cols 0001000000000000000000010001000011100011110101 has 155 unique lines.
 *     142     140                 153 154 155             154 154 153 154   x 154 155 153     152 147 147 154 153 152 154 155 155 155 155 152 155 155 155 155 155 155 155     151 154 154  kill col  3  Tbl  33 cols 0001000000000000000000010001000011100011111101 has 140 unique lines.
 *     117                         138 139 140             136 139 138 137   x 138 140 135     136 130 132 137 138 136 137 140 139 140 139 136 140 140 140 140 140 140 140     134 138 139  kill col  1  Tbl  32 cols 0001000000000000000000010001000011100011111111 has 117 unique lines.
 *                                 112 116 117             112 116 114 114   x 112 117 111     111 107 108 115 116 114 114 117 116 116 116 113 117 117 117 117 117 117 117     110 116 116  kill col 24  Tbl  31 cols 0001000000000000000001010001000011100011111111 has 107 unique lines.
 *                                 101 106 107             102 106 101 104   x 102 107 101     101      99 105 106 105 104 107 106 106 106 103 107 107 106 107 107 107 107     101 105 106  kill col 25  Tbl  30 cols 0001000000000000000011010001000011100011111111 has  99 unique lines.
 *                                  93  98  99              94  98  92  95   x  94  99  93      89          97  98  98  96  99  98  98  98  95  99  99  98  99  99  99  99      93  97  98  kill col 23  Tbl  29 cols 0001000000000000000011110001000011100011111111 has  89 unique lines.
 *                                  83  87  88              85  88  82  84   x  84  89  83                  87  86  87  86  89  87  88  88  85  89  89  88  89  89  89  88      83  87  88  kill col 16  Tbl  28 cols 0001000000000000000011110001010011100011111111 has  82 unique lines.
 *                                  76  80  81              78  81      77   x  75  81  75                  79  79  80  79  81  80  81  81  78  82  82  81  82  82  81  81      76  80  81  kill col 21  Tbl  27 cols 0001000000000000000011111001010011100011111111 has  75 unique lines.
 *                                  70  73  74              71  74      70   x  68  73                      72  72  73  73  74  73  74  74  71  75  75  74  75  75  74  74      69  73  74  kill col 19  Tbl  26 cols 0001000000000000000011111011010011100011111111 has  68 unique lines.
 *                                  64  66  67              65  67      63   x      66                      65  65  66  66  67  66  67  67  64  68  68  67  68  67  67  67      62  66  67  kill col 43  Tbl  25 cols 0011000000000000000011111011010011100011111111 has  62 unique lines.
 *                                  59  60  60              59  61      57   x      60                      59  59  60  60  61  60  61  61  58  62  62  61  62  61  61  61          59  61  kill col 17  Tbl  24 cols 0011000000000000000011111011110011100011111111 has  57 unique lines.
 *                                  54  55  55              54  56           x      55                      54  55  55  53  56  55  56  56  53  57  56  56  57  56  54  56          55  55  kill col 34  Tbl  23 cols 0011000000010000000011111011110011100011111111 has  53 unique lines.
 *                                  51  51  51              50  52           x      51                      50  51  51  50  52  51  52  52      53  52  52  53  52  50  52          51  51  kill col 40  Tbl  22 cols 0011010000010000000011111011110011100011111111 has  50 unique lines.
 *                                  48  48  48              47  49           x      48                      47  48  47  47  49  48  49  49      50  49  49  50  49      49          48  48  kill col 29  Tbl  21 cols 0011010000010000100011111011110011100011111111 has  47 unique lines.
 *                                  45  45  45              44  46           x      45                      43  43  42      46  45  46  45      47  46  46  47  42      46          45  45  kill col 39  Tbl  20 cols 0011011000010000100011111011110011100011111111 has  42 unique lines.
 *                                  40  40  40              40  41           x      40                      38  37  36      41  40  41  40      42  41  41  42          39          40  40  kill col 28  Tbl  19 cols 0011011000010000110011111011110011100011111111 has  36 unique lines.
 *                                  35  34  34              34  35           x      34                      32  32          35  34  35  33      36  34  35  35          33          34  34  kill col 27  Tbl  18 cols 0011011000010000111011111011110011100011111111 has  32 unique lines.
 *                                  31  30  30              30  31           x      30                      28              31  30  31  29      32  30  31  31          29          30  30  kill col 26  Tbl  17 cols 0011011000010000111111111011110011100011111111 has  28 unique lines.
 *                                  27  26  26              27  27           x      26                                      26  26  27  25      28  26  27  27          26          26  26  kill col 33  Tbl  16 cols 0011011000011000111111111011110011100011111111 has  25 unique lines.
 *                                  24  23  23              24  24           x      23                                      23  23  24          24  23  24  24          23          23  24  kill col 44  Tbl  15 cols 0111011000011000111111111011110011100011111111 has  23 unique lines.
 *                                  22  21  21              22  22           x      21                                      21  21  22          22  21  22  22          21              22  kill col 41  Tbl  14 cols 0111111000011000111111111011110011100011111111 has  21 unique lines.
 *                                  20  19  19              20  20           x      19                                      19  19  20          20  19  20  20                          20  kill col 36  Tbl  13 cols 0111111001011000111111111011110011100011111111 has  19 unique lines.
 *                                  18  17  17              18  18           x      17                                      17  17  18          18      17  18                          18  kill col 37  Tbl  12 cols 0111111011011000111111111011110011100011111111 has  17 unique lines.
 *                                  16  15  15              16  16           x      15                                      15  15  16          16          16                          16  kill col 31  Tbl  11 cols 0111111011011010111111111011110011100011111111 has  15 unique lines.
 *
 * Round 1: 1000000100100101000000000100001100011100000000  4 columns for indexes to table representing 11 original columns (uses 15 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 39
 * 202 distinct lines in remaining untreated columns
 *  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 c45 
 * 201 201 202 201 202 201 200 201   x   x   x 200 198 201   x   x 202 202   x 200   x 202 201 201 202 201 202 202 202 202   x 202   x 202 202   x 202 202   x 202 202 202 202 199 202   x  kill col 12  Tbl  33 cols 1000000100100101000000000101001101011100000000 has 198 unique lines.
 * 197 197 198 197 198 197 196 197   x   x   x 196     196   x   x 198 198   x 196   x 198 195 197 198 196 198 198 198 198   x 198   x 198 198   x 198 198   x 198 198 198 197 195 198   x  kill col 43  Tbl  32 cols 1010000100100101000000000101001101011100000000 has 195 unique lines.
 * 194 194 195 194 195 194 193 194   x   x   x 193     193   x   x 195 195   x 192   x 195 192 194 195 193 195 195 195 195   x 195   x 195 195   x 195 195   x 195 195 195 194     195   x  kill col 22  Tbl  31 cols 1010000100100101000000010101001101011100000000 has 192 unique lines.
 * 190 191 192 191 192 190 189 191   x   x   x 190     189   x   x 192 192   x 189   x 192     191 191 191 192 192 192 192   x 192   x 192 192   x 192 192   x 192 192 192 191     192   x  kill col 19  Tbl  30 cols 1010000100100101000000010111001101011100000000 has 189 unique lines.
 * 187 187 189 188 189 187 186 188   x   x   x 187     186   x   x 189 189   x       x 189     188 188 188 189 189 189 189   x 189   x 189 189   x 189 189   x 189 189 189 188     189   x  kill col 13  Tbl  29 cols 1010000100100101000000010111001111011100000000 has 186 unique lines.
 * 184 184 186 185 185 184 183 185   x   x   x 183           x   x 186 186   x       x 186     185 185 185 186 186 186 186   x 186   x 186 186   x 186 186   x 186 186 186 185     186   x  kill col 11  Tbl  28 cols 1010000100100101000000010111001111111100000000 has 183 unique lines.
 * 181 180 183 181 180 181 178 182   x   x   x               x   x 181 183   x       x 183     182 182 182 183 183 183 183   x 183   x 183 183   x 183 183   x 183 183 183 178     183   x  kill col 42  Tbl  27 cols 1011000100100101000000010111001111111100000000 has 178 unique lines.
 * 176 175 177 176 175 174 173 177   x   x   x               x   x 176 178   x       x 178     177 177 177 178 178 178 178   x 178   x 178 178   x 178 178   x 178 178 178         178   x  kill col  6  Tbl  26 cols 1011000100100101000000010111001111111101000000 has 173 unique lines.
 * 169 170 171 171 170 169     172   x   x   x               x   x 171 173   x       x 172     172 172 172 173 173 173 173   x 173   x 173 173   x 173 173   x 173 173 173         173   x  kill col  5  Tbl  25 cols 1011000100100101000000010111001111111101100000 has 169 unique lines.
 * 162 165 162 162 165         162   x   x   x               x   x 165 168   x       x 166     166 166 168 168 168 169 167   x 169   x 168 169   x 169 169   x 169 169 169         168   x  kill col  7  Tbl  24 cols 1011000100100101000000010111001111111111100000 has 162 unique lines.
 * 155 156 154 151 157               x   x   x               x   x 157 160   x       x 159     159 153 161 161 161 161 160   x 162   x 160 162   x 162 162   x 162 162 162         161   x  kill col  3  Tbl  23 cols 1011000100100101000000010111001111111111101000 has 151 unique lines.
 * 143 141 140     140               x   x   x               x   x 143 148   x       x 147     147 142 148 150 150 149 149   x 151   x 149 150   x 151 151   x 151 151 151         149   x  kill col  4  Tbl  22 cols 1011000100100101000000010111001111111111111000 has 140 unique lines.
 * 122 122 123                       x   x   x               x   x 129 135   x       x 134     135 128 134 139 138 138 138   x 140   x 136 136   x 140 140   x 140 139 140         137   x  kill col  1  Tbl  21 cols 1011000100100101000000010111001111111111111010 has 122 unique lines.
 *  99      99                       x   x   x               x   x 109 115   x       x 116     116 111 113 119 120 119 120   x 122   x 118 118   x 122 122   x 122 121 122         119   x  kill col  2  Tbl  20 cols 1011000100100101000000010111001111111111111110 has  99 unique lines.
 *  75                               x   x   x               x   x  88  92   x       x  92      92  88  87  95  96  95  95   x  98   x  96  94   x  99  99   x  99  98  99          96   x  kill col  0  Tbl  19 cols 1011000100100101000000010111001111111111111111 has  75 unique lines.
 *                                   x   x   x               x   x  67  70   x       x  70      69  66  65  71  73  72  72   x  73   x  72  72   x  75  75   x  75  74  75          72   x  kill col 25  Tbl  18 cols 1011000100100101000010010111001111111111111111 has  65 unique lines.
 *                                   x   x   x               x   x  58  59   x       x  60      59  60      61  63  63  62   x  63   x  61  62   x  65  65   x  65  64  65          62   x  kill col 16  Tbl  17 cols 1011000100100101000010010111011111111111111111 has  58 unique lines.
 *                                   x   x   x               x   x      52   x       x  51      53  52      54  56  56  55   x  56   x  55  55   x  58  58   x  58  57  58          54   x  kill col 21  Tbl  16 cols 1011000100100101000010011111011111111111111111 has  51 unique lines.
 *                                   x   x   x               x   x      46   x       x          46  47      47  49  49  49   x  49   x  48  48   x  51  51   x  50  50  51          48   x  kill col 23  Tbl  15 cols 1011000100100101000010111111011111111111111111 has  46 unique lines.
 *                                   x   x   x               x   x      40   x       x              40      42  42  43  43   x  43   x  43  43   x  46  46   x  45  45  45          43   x  kill col 24  Tbl  14 cols 1011000100100101000011111111011111111111111111 has  40 unique lines.
 *                                   x   x   x               x   x      34   x       x                      34  34  36  37   x  37   x  37  37   x  40  39   x  39  38  39          38   x  kill col 27  Tbl  13 cols 1011000100100101001011111111011111111111111111 has  34 unique lines.
 *                                   x   x   x               x   x      29   x       x                      29      31  31   x  30   x  31  31   x  34  33   x  33  32  32          32   x  kill col 26  Tbl  12 cols 1011000100100101001111111111011111111111111111 has  29 unique lines.
 *                                   x   x   x               x   x      24   x       x                              27  26   x  24   x  26  26   x  29  28   x  28  27  27          27   x  kill col 31  Tbl  11 cols 1011000100100111001111111111011111111111111111 has  24 unique lines.
 *                                   x   x   x               x   x      19   x       x                              22  21   x       x  21  21   x  23  23   x  23  22  23          22   x  kill col 17  Tbl  10 cols 1011000100100111001111111111111111111111111111 has  19 unique lines.
 *                                   x   x   x               x   x           x       x                              17  16   x       x  16  16   x  18  18   x  18  16  18          18   x  kill col 40  Tbl   9 cols 1011010100100111001111111111111111111111111111 has  16 unique lines.
 *
 * Round 2: 0100101011011000110000000000000000000000000000  4 columns for indexes to table representing  9 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 34
 * 201 distinct lines in remaining untreated columns
 *  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 c45 
 * 200 199 201 200 200 200 199 199   x   x   x 199 197 200   x   x 201 201   x 198   x 201 200 200 201 199 201 201   x   x   x 201   x   x   x   x   x   x   x   x 201   x 201 198   x   x  kill col 12  Tbl  24 cols 1100101111111101110000000101001101011100000000 has 197 unique lines.
 * 196 195 197 196 196 196 195 195   x   x   x 195     195   x   x 197 197   x 194   x 197 194 196 197 194 197 197   x   x   x 197   x   x   x   x   x   x   x   x 197   x 196 194   x   x  kill col 43  Tbl  23 cols 1110101111111101110000000101001101011100000000 has 194 unique lines.
 * 193 192 194 193 193 193 192 192   x   x   x 192     192   x   x 194 194   x 190   x 194 191 193 194 191 194 194   x   x   x 194   x   x   x   x   x   x   x   x 194   x 193       x   x  kill col 19  Tbl  22 cols 1110101111111101110000000111001101011100000000 has 190 unique lines.
 * 189 186 190 189 189 189 188 188   x   x   x 188     187   x   x 190 190   x       x 190 187 189 190 187 190 190   x   x   x 190   x   x   x   x   x   x   x   x 190   x 189       x   x  kill col  1  Tbl  21 cols 1110101111111101110000000111001101011100000010 has 186 unique lines.
 * 185     186 182 185 184 184 183   x   x   x 184     183   x   x 185 186   x       x 185 183 185 186 183 186 186   x   x   x 186   x   x   x   x   x   x   x   x 186   x 185       x   x  kill col  3  Tbl  20 cols 1110101111111101110000000111001101011100001010 has 182 unique lines.
 * 178     179     178 177 179 179   x   x   x 180     179   x   x 180 182   x       x 181 178 181 182 178 182 182   x   x   x 182   x   x   x   x   x   x   x   x 182   x 181       x   x  kill col  5  Tbl  19 cols 1110101111111101110000000111001101011100101010 has 177 unique lines.
 * 170     173     171     169 170   x   x   x 175     173   x   x 175 177   x       x 175 172 175 177 173 177 177   x   x   x 177   x   x   x   x   x   x   x   x 177   x 176       x   x  kill col  6  Tbl  18 cols 1110101111111101110000000111001101011101101010 has 169 unique lines.
 * 158     160     162         159   x   x   x 166     165   x   x 165 169   x       x 163 161 167 166 162 169 169   x   x   x 169   x   x   x   x   x   x   x   x 169   x 167       x   x  kill col  0  Tbl  17 cols 1110101111111101110000000111001101011101101011 has 158 unique lines.
 *         143     142         145   x   x   x 154     152   x   x 151 157   x       x 152 146 156 152 151 158 158   x   x   x 158   x   x   x   x   x   x   x   x 158   x 156       x   x  kill col  4  Tbl  16 cols 1110101111111101110000000111001101011101111011 has 142 unique lines.
 *         121                 120   x   x   x 136     135   x   x 133 138   x       x 137 128 139 133 132 141 142   x   x   x 141   x   x   x   x   x   x   x   x 142   x 139       x   x  kill col  7  Tbl  15 cols 1110101111111101110000000111001101011111111011 has 120 unique lines.
 *          96                       x   x   x 112     109   x   x 108 115   x       x 114 104 115 108 110 119 120   x   x   x 118   x   x   x   x   x   x   x   x 118   x 113       x   x  kill col  2  Tbl  14 cols 1110101111111101110000000111001101011111111111 has  96 unique lines.
 *                                   x   x   x  86      85   x   x  85  91   x       x  91  83  89  83  83  95  95   x   x   x  94   x   x   x   x   x   x   x   x  94   x  88       x   x  kill col 25  Tbl  13 cols 1110101111111101110010000111001101011111111111 has  83 unique lines.
 *                                   x   x   x  74      74   x   x  73  78   x       x  78  70  74  72      81  82   x   x   x  81   x   x   x   x   x   x   x   x  81   x  76       x   x  kill col 22  Tbl  12 cols 1110101111111101110010010111001101011111111111 has  70 unique lines.
 *                                   x   x   x  61      61   x   x  60  63   x       x  65      58  60      68  69   x   x   x  67   x   x   x   x   x   x   x   x  66   x  62       x   x  kill col 23  Tbl  11 cols 1110101111111101110010110111001101011111111111 has  58 unique lines.
 *                                   x   x   x  50      49   x   x  48  48   x       x  52          47      54  55   x   x   x  55   x   x   x   x   x   x   x   x  55   x  50       x   x  kill col 24  Tbl  10 cols 1110101111111101110011110111001101011111111111 has  47 unique lines.
 *                                   x   x   x  39      39   x   x  37  37   x       x  40                  43  43   x   x   x  44   x   x   x   x   x   x   x   x  44   x  41       x   x  kill col 17  Tbl   9 cols 1110101111111101110011110111101101011111111111 has  37 unique lines.
 *                                   x   x   x  31      30   x   x  27       x       x  30                  32  31   x   x   x  34   x   x   x   x   x   x   x   x  33   x  29       x   x  kill col 16  Tbl   8 cols 1110101111111101110011110111111101011111111111 has  27 unique lines.
 *                                   x   x   x  22      21   x   x           x       x  22                  23  21   x   x   x  24   x   x   x   x   x   x   x   x  22   x  21       x   x  kill col 42  Tbl   7 cols 1111101111111101110011110111111101011111111111 has  21 unique lines.
 *                                   x   x   x  16      16   x   x           x       x  17                  17  15   x   x   x  19   x   x   x   x   x   x   x   x  16   x           x   x  kill col 27  Tbl   6 cols 1111101111111101111011110111111101011111111111 has  15 unique lines.
 *
 * Round 3: 0000010000000010000100001000000010100000000000  4 columns for indexes to table representing  6 original columns (uses 15 of 16 lines in indirect table).
 * Direct:  0011000000000000001011110011110001000011111111 20 columns
 * Success. Use 2 EBRs, 26 LUTs.
 */

module m_2ebr
  (
   input         clk,
   input [7:0]   minx,
   input         progress_ucode,
   output [47:0] d
   );
   /*                      indirect_index 2
    *                      | indirect_index 1
    * inx         next     | | indirect index 0
    * || ucode    ucode    | | | direct representation
    * 00 LB_0     condb_5  0 0 0 01011011011000000001| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     IJ_0     1 1 1 00010111011011010010|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     eFetch3  2 2 2 01011011011010111110| IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0
    * 03 FENCE    IJ_0     3 0 2 0000010x010x11100110| f      Prepare read PC (FENCE)
    * 04 ADDI_0   SUB_1    4 3 2 01000101010011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L05     IJ_0     3 0 2 0000000x001x00000100| AUIPC  q = imm20+2 or imm20+4  (copy x/8)
    * 06 LB_3     IJ_0     3 0 2 00001101011100000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     IJ_0     1 0 2 00001011011100001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L08     SUB_1    4 4 0 01011101011001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     IJ_0     3 0 2 00001011011010100011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0a     SUB_1    4 4 0 01011101011001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2            1 5 2 00000101010110000110|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    IJ_0     1 0 2 00011101011000000100| ADD    add     Addition Q = RS1
    * 0d MUL_0    MULHU_6  3 0 2 1001110x010x11100010| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    IJ_0     3 0 2 0001110x010x00010000| SUB    Subtraction
    * 0f _L0f              4 3 2 00000101010111100110| LUI    q = imm20
    * 10 SUB_1    IJ_0     3 0 2 00011111011010100011|        Q = ~RS2
    * 11 AND_1    IJ_0     3 0 2 00011101011000011010|        RS1^0xffffffff to Q
    * 12 eFetch3  SUB_1    5 4 3 01011111011001110100|  Fr11  Write minstret. Update I. Q=immediate, use dinx
    * 13 condb_2  IJ_0     3 0 2 00011111011000010100|        ~RS2 in Q
    * 14 condb_3  eFetch3  4 0 4 01011001011000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  IJ_0     1 0 5 00000001011000010110|        Branch on condition
    * 16 condb_5  IJ_0     3 0 2 0000010x010x11100110|        Branch not taken.
    * 17 condb_5t condb_3  0 6 2 01111011001011011110|        Branch taken.
    * 18 BEQ               4 5 2 00011101010100010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   SUB_1    4 4 2 01010101010001000001| JALR   jj=RS1+imm
    * 1a ANDI_1            1 3 2 00000101010111100110|        rd = Iimm & RS1
    * 1b _L1b     IJ_0     4 0 2 00000001001100110010| JAL    J-imm is in q.
    * 1c ECAL_BRK IJ_0     2 0 2 00010111001110100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2             6 3 2 00000101010111100110|        rd = Iimm | RS1
    * 1e aFault_1 JAL_1    4 0 4 11010100011011010100|        Q = 4
    * 1f IJ_2              4 5 2 00010101010110110111|        Read word is to be masked with lsb = 0
    * 20 LH_0     condb_3  7 5 0 01011011011001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1            3 3 2 00000101010011100110|        rd = Iimm ^ RS1
    * 22 MULHU_6  IJ_0     4 0 6 00010101011000111001|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 FENCEI   IJ_0     3 0 2 0000010x010x11100110| f      Prepare read PC (FENCE)
    * 24 SLLI_0   IJ_0     8 0 0 0001111100x100110101| SLLI   Shift left immediate.
    * 25 _L25     IJ_0     3 0 2 0000000x001x00000100| AUIPC  q = imm20+2 or imm20+4  (copy x/8)
    * 26 OR_1              3 4 2 00011101010000100111|        RS1^0xffffffff to jj
    * 27 OR_2     eFetch3  4 0 2 01000001011000011101|        Q = rs2
    * 28 _L28     SUB_1    2 4 0 01011101011010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    IJ_0     3 0 2 00011101011000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L2a     SUB_1    2 4 0 01011101011010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  eFetch3  4 0 4 010xxxx1010000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    IJ_0     3 0 2 0001110x00xx00111110| SLL    Shift left
    * 2d MULH_0   IJ_0     9 0 2 00010101011011111011| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e EBRKWFI2          3 4 5 00001101010111110111| EBREAK/WFI2 Select EBREAK or WFI
    * 2f _L2f              4 3 2 00000101010111100110| LUI    q = imm20
    * 30 SLTIX_2           4 3 7 00000101010111100110|        Registered ALU flag to rd
    * 31 SLTX_1   IJ_0     3 0 2 00011111011000101011|        ~rs2 to Q
    * 32 JAL_1    SUB_1    4 5 2 01000101010010000110|        Target adr to yy
    * 33 JAERR_1           a 7 0 00xxxxxxxxxx11x1111x|        Not in use
    * 34 JAL_3    ADDI_0   b 6 2 00111011001011011110|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1            9 3 2 00010111011000110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2            c 8 2 00010111011000000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2           d 5 5 000xxxx1010011010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE               4 5 2 00011101010100010011| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  LH_0     1 3 2 10000101010011100110|        Last shift.
    * 3a SRxI_1            9 3 6 00010101011000111101|        Register to shift to Q
    * 3b _L3b     IJ_0     4 0 2 00000001001100110010| JAL    J-imm is in q.
    * 3c CSRRW_0           4 5 2 00001101010101001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2            9 8 6 00010101011000000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    IJ_0     9 0 0 0001111100x000110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    IJ_0     9 0 0 0001111100x000111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     condb_5  7 0 8 01011011011001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   eFetch3  4 0 4 01000001011000001011|        Q=1
    * 42 MULHU_2  IJ_0     8 0 6 00010101011010111011|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  IJ_0     3 0 2 00000001001011101010|        Prepare read Rjj.
    * 44 SLTI_0   IJ_0     3 0 2 00011111011100101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    eFetch3  4 0 4 01010101011001100101|        More check offset
    * 46 ILL_1    ADDI_0   e 5 2 00011011011001000111|        Store PC to mepc and Q for read of instr
    * 47 ILL_2    IJ_0     1 1 2 00010111011010001111|        Read until Q is offending instruction
    * 48 _L48     aFault_1 7 9 8 01011101011001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  eFetch3  4 0 4 01000001011001001011|        Construct PC storage adr
    * 4a _L4a     aFault_1 7 9 8 01011101011001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2           d a 2 00110101001010110000|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    IJ_0     3 0 2 0001110x010x00110001| SLT    Set less than (signed)
    * 4d MULHSU_0          9 5 2 00011101010010011011| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   IJ_0     3 0 2 000xxxxx00xx11111110| Illegal instruction seen
    * 4f MRET_8   eFetch3  4 0 4 01010101011011100110|        Prep +4
    * 50 LW_1     LB_1     1 b 9 00010111010011100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW           5 5 2 00110101001111011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     IJ_0     1 1 1 00010111011001010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH           5 5 2 00110101001111011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     IJ_0     9 c 6 00010101011011101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb           5 5 2 00110101010100011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     IJ_0     1 0 2 00010001011101010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     IJ_0     3 0 2 00010001011010100011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    JAL_1    1 0 6 11010111011010111010|        Transfer rM to rDee
    * 59 DIV_B             4 5 2 00011111010110011100|        REM = Q to yy
    * 5a SB_1              9 5 2 00010111011001011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L5b     IJ_0     4 0 2 00000001001100110010| JAL    J-imm is in q.
    * 5c CSRRS_0           4 5 2 00001101010101001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2              c d 2 00010111011001101010|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    IJ_0     1 1 1 00010111011001110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU          5 5 2 00110101001111011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 DIV_14   IJ_0     3 0 2 00010101011010100011|        RS2 < 0, RS1 >= 0, change sign yy
    * 61 DIV_15            1 3 2 00000101010011100110|        RS2 < 0, RS1 < 0, yy is true result
    * 62 DIV_8    eFetch3  8 0 4 01010111011011001000|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    LH_1     4 e 4 01010111011001011000|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  IJ_0     3 0 2 00011111011100101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    IJ_0     3 0 5 0000010x010x11101111|        Prepare read PC
    * 66 SW_1              d 7 2 00111101001011110010|        Write d to a+k until accepted
    * 67 SWE               5 5 2 0010010100x110010011|        Store faulting address alignment to mtval
    * 68 DIV_12            1 3 2 00000101010011100110|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   IJ_0     3 0 2 00010101011010100011|        RS2 > 0, RS1 < 0, change sign yy
    * 6a SB_3     IJ_0     4 0 2 00000001010101101011|        Prepare get back address to use 
    * 6b SB_4     SUB_0    b 9 2 00111001011001111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   IJ_0     3 0 2 0001110x010x00110001| SLTU   Set less than (unsigned)
    * 6d MULHU_0           9 5 2 00011101010010011011| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e LHU_3    IJ_0     3 0 2 00001111011100011010|        Invert q. Prepare read mask
    * 6f MRET_6   eFetch3  4 0 4 010xxxx1011011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    IJ_0     9 c 6 00010101011001101110|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc           5 5 2 00110101010100011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    IJ_0     3 0 2 00001101011100011010|        Invert q. Prepare read mask
    * 73 BAERR_1           a 7 0 00xxxxxxxxxx11x1111x|       not used
    * 74 unalignd IJ_0     4 0 2 00000101010101110101|  Fr10u Unaligned pc, prep read high hword
    * 75 straddle CSRRWI_2 0 6 a 11111010001001110110|  Fr10u IncPC, OpFetch
    * 76 Fetchu   IJ_0     4 0 b 00000111010111010101|  Fr10u Read and latch instruction
    * 77 eFetchu  FENCE    4 1 c 00010111010111010101|  Fr10u rep Read until d=mem[(rs1+ofs) & ~3u]
    * 78 DIV_4             4 5 2 00000001010110101001|        ~abs(divisor) to yy
    * 79 DIV_5    JAL_1    4 0 4 11010101011010101000|        Kluge to let add1 work in DIV instr
    * 7a SB_5              1 7 2 00111001001011110010|        Write d to a+k until accepted
    * 7b _L7b     IJ_0     4 0 2 00000001001100110010| JAL    J-imm is in q.
    * 7c CSRRC_0           4 5 2 00001101010101001001| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4           a 7 0 00xxxxxxxxxx11x1111x|       not used
    * 7e NMI_1             d 5 2 000xxxx1010010010000|        Store pc to mepc.
    * 7f JALRE2            a 7 0 00xxxxxxxxxx11x1111x|        Not in use
    * 80 LBU_0    condb_5  0 0 0 01011011011010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2           a 7 0 00xxxxxxxxxx11x1111x|        Not in use
    * 82 DIV_1             3 4 2 00011101010010101000|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    eFetch3  4 0 2 01010101011010000010|        Dividend negative, make RS1-1
    * 84 XORI_0   IJ_0     3 0 2 00011111011100100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    IJ_0     1 1 1 00010111011011110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    CSRRW_3  4 3 a 1101100000x000110100|        Return address to TRG
    * 87 JALRE1            a 7 0 00xxxxxxxxxx11x1111x|        Not in use
    * 88 DIV_E    DIV_8    3 e 2 1001111x00xx10011100|        RS2 != 0. Check signs
    * 89 DIV_F             4 3 2 00000101010111100110|        RS2 == 0, return 0xffffffff
    * 8a ILL_4    eFetch3  4 0 4 01010101011010001011|        Q = 1
    * 8b ILL_5    SUB_1    4 f 4 0111001100x000110100|        Store 2 to mcause
    * 8c XOR_0    IJ_0     3 0 2 0001111x010x00101001| XOR    xor
    * 8d DIV_0    DIV_8    9 e 2 10010111011010000010| DIV    Branch on sign dividend RS1
    * 8e aF_SW_3  SUB_1    4 f 2 0110010000x010010010|        Store 7 to mcause
    * 8f ILL_3             5 5 2 00110101010110001010|        Store illegal instruction to mtval
    * 90 NMI_2             5 f 2 00101001010100110100|        mtval = 0.
    * 91 LDAF_2   SLTIX_2  4 f 4 1110010000x010010010|        Store 4 to mcause
    * 92 LDAF_3            d 5 2 0001001100x000110100|        PC to mepc
    * 93 SW_E2             d 5 2 00010111010010010101|        Store address that faulted
    * 94 SW_E4             6 f 2 0011001100x000110100|        Store 6 to mcause
    * 95 SW_E3    JAL_1    4 0 4 11010110011010010100|        Q = 3
    * 96 SH_1              9 5 2 00010111011010011010|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SWH               5 5 2 0010010100x110010011|        Store faulting address alignment to mtval
    * 98 BLT               4 5 2 00011101010100010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L99     IJ_0     3 0 2 000xxxxx00xx11111110| Illegal instruction seen
    * 9a SH_2              c d 2 00010111011010110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * 9b MULHU_1  LH_0     4 4 2 10011111010101000010|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 9c DIV_10   DIV_8    1 e 2 10011001010001101000|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_8    1 e 2 10011001010001100000|        RS2 < 0. Branch on sign of RS1
    * 9e SH_4     SUB_0    e 9 2 00011001011010011111|        Address back to Q. Prepare get item to write
    * 9f SH_5              d 7 2 00011001001011110010|        Write d to a+k until accepted
    * a0 LHU_0    condb_3  7 5 0 01011011011001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm.
    * a1 ECALL_4  JAL_1    4 0 4 11010100011011001110|        Q = 4
    * a2 DIVU_5   JAL_1    3 0 6 1101011x010x00011010|        Transfer rM to rDee
    * a3 LB_6     SLTIX_2  4 3 4 11000101010011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * a4 SRxI_0   IJ_0     8 0 0 0001111100x100111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   eFetch3  4 0 4 01001101011010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET IJ_0     2 0 8 00010111001111010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 eFetch3  4 0 2 010xxxx1011000101110| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_8    3 e 2 10010101011001111000|        Branch on sign divisor RS2
    * a9 DIV_6    MULHU_6  3 0 2 1001011x010x11001000|        Write M. Prepare shift
    * aa ECALL_6  SUB_1    4 f 2 0111001000x000110100|        mcause = 11
    * ab EBREAK_2          d 5 2 00010101010010101010|        pc to mepc
    * ac _Lac     IJ_0     3 0 2 0001110x00xx00111111| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   MULHU_6  a 0 2 1001110x010x11100000| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _Lae     IJ_0     3 0 2 0001110x00xx00111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   eFetch3  4 0 4 010xxxx1011011000101|        0x202 + 0xff + 1 = 0x302
    * b0 CSRRW_3  JAL_1    4 0 4 11010100011010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b1 CSRRS_1           a 7 0 00xxxxxxxxxx11x1111x|        Not in use
    * b2 CSRRW_4  JAL_3    0 6 4 11111010001011011110|        IncPC, OpFetch, but force +4
    * b3 CSRRWI_1          a 7 0 00xxxxxxxxxx11x1111x|        Not in use
    * b4 CSRRWI_2          a 7 0 00xxxxxxxxxx11x1111x|        Not in use
    * b5 SH_3     IJ_0     4 0 2 00000001010110011110|        Prepare get back address to use 
    * b6 CSRRCI_1          a 7 0 00xxxxxxxxxx11x1111x|        Not in use
    * b7 IJ_3     eFetch3  4 0 4 01011001011010111101|        Construct Q = 1
    * b8 BGE               4 5 2 00011101010100010011| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    IJ_0     3 0 4 00011001011011000000|        Calc carry of RS2+0xFFFFFFFF
    * ba DIV_C             1 5 2 00011101001010111001|        rM to yy. Q=ffffffff
    * bb MULHU_3  MULHU_6  1 0 2 10011111011001000010|        Shift Q and rM. Prepare read rs1
    * bc CSRRWI_0          4 5 2 00001101010101001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     ADDI_0   b 6 2 00111011001111011110|        Mask and use as PC
    * be IJ_1     IJ_0     1 1 2 00010111011000011111|        Read until q=mem[(rs1+ofs)&~1u]
    * bf IJT_1    IJ_0     1 1 2 00010111011011000001|        Exit CSR, enter trap
    * c0 DIV_D    IJ_0     1 0 5 00011101011010001000|        Is RS2 == 0?
    * c1 IJT_2             4 5 2 00010101010111101001|        Read word is to be masked with ~1u
    * c2 DIVU_3   eFetch3  8 0 4 01010111011011001010|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   LH_1     4 e 4 01010111011010100010|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0             3 4 2 00011111010111100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   IJ_0     3 0 2 00000001011101101111|        ~302
    * c6 IJT_4    ADDI_0   e 5 2 00011011011101000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1            d 5 2 000xxxx1010011001011|        Store pc to mepc.
    * c8 DIV_7    MULHU_6  6 0 d 10011001011001100010|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   eFetch3  4 0 2 01001100011010100101|        0xff+3 = 0x102
    * ca DIVU_2   MULHU_6  6 0 d 10011001011011000010|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2            5 f 2 00101001010111100110|        mtval = 0.
    * cc OR_0     IJ_0     3 0 2 0001111x010x00100110| OR     or
    * cd REM_0    DIV_8    9 e 2 10010111011010000010| REM    Branch on sign dividend RS1
    * ce ECALL_5  JAL_1    4 0 4 11010100011010101010|        Q = 8
    * cf MRET_7   IJ_0     3 0 5 0000110x010x01001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  eFetch3  4 0 4 01000101011000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1            4 4 2 00001101010111001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     IJ_0     9 c 6 00010101011000000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd           5 5 2 00110101010100011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 SUB_1    4 f 4 0110010100x010010010|        Store 5 to mcause
    * d5 Fetch2u  SUB_1    5 4 e 01111111111000000000|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * d6 eILL0c   IJ_0     3 0 2 000xxxxx00xx11111110| Illegal instruction seen
    * d7 ECALL_3           5 5 2 00110101010110100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU              4 5 2 00011101010100010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_6  3 0 2 1001111x010x01000010|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   IJ_0     3 0 2 0001010x010x10010001|        Extra cycle after error detected write mtval
    * db jFault_1 SUB_1    4 5 4 0110010100x010010010|        Store 1 to mcause
    * dc CSRRSI_0          4 5 2 00001101010101001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1           5 5 2 00110101010111100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    LB_1     4 6 c 00010111010111110100|  Fr11  Read and latch instruction
    * df eFetch   LB_1     4 6 c 00010111010111110100|  Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1            3 5 2 00010111010011001010|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    IJ_0     1 0 2 00000001011000011101|        Q = RS1
    * e2 MUL_1    IJ_0     8 0 6 00010101011011101000|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    JAL_1    3 0 6 1101011x010x00011010|        Transfer rM to rDee
    * e4 ANDI_0   IJ_0     3 0 2 00011111011100011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  JAL_1    4 0 4 11010100011010001110|        Q = 4
    * e6 StdIncPc CSRRWI_2 0 6 a 11111010001011011110|  Fr11  IncPC, OpFetch
    * e7 aFault            5 5 2 00110101010100011110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MULHU_6  1 0 2 10011101011011100010|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    eFetch3  4 0 4 01011001011011000110|        Construct Q = 1
    * ea MULHU_5  IJ_0     4 0 2 00011001011000100010|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     IJ_0     3 0 2 00001111011101010110|        q = ~mem[rs1+ofs]
    * ec AND_0    IJ_0     3 0 2 0001111x010x00010001| AND    And 
    * ed REMU_0   MULHU_6  a 0 2 1001110x010x11100000| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   IJ_0     3 0 2 000xxxxx00xx11111110| Illegal instruction seen
    * ef WFI_5    JAL_3    0 6 4 11111010001011011110|        IncPC, OpFetch
    * f0 LBU_2    IJ_0     9 c 6 00010101011001110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte           5 5 2 00110101010100011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     IJ_0     3 0 2 0000010x010x11100110|        Prepare read PC
    * f3 aF_SW    IJ_0     3 0 2 000xxxxx001x11011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   SUB_1    5 4 2 01100011110000010010|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault            5 5 2 00110101010111011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    JAL_1    4 0 4 11000000011011111010| WFI    To check offset
    * f7 EBREAK_1          5 5 2 00100101010110101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU              4 5 2 00011101010100010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   SUB_1    4 4 4 01011101010011011001|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    eFetch3  4 0 4 01010101011001000101|        Check offset
    * fb MULH_1            3 5 2 00010101010011111001|        Store ~rs1 to Ryy. Prep construct 1.
    * fc CSRRCI_0          4 5 2 00001101010101001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    IJ_0     3 0 2 0000010x010x01111110| NMI    Get current PC
    * fe ILLe     IJ_0     3 0 2 0000010x010x01000110| Illegal
    * ff QINT_0   IJ_0     3 0 2 0000010x010x11000111| INT    Get current PC
    */
   localparam u0_0 = 256'h55e6c410c4e2d6045586d65ab6a3d65ab709d707020454e644e6b6be76d2b601;
   localparam u0_1 = 256'h55b746d455e673a6133255e65441d513b2de44e616169615f614f674d61af6a3;
   localparam u0_2 = 256'h55e6d5f756fbc03e1430d696d621d696161dd4270204f13544e6563954e6b652;
   localparam u0_3 = 256'hf03af0355603d5491332563d54e6d51314d776037636b2de00de5486f62b55e6;
   localparam u0_4 = 256'h56e600fed49bc43152b0d666164bd666768fb6475665f72b12ea56bb160bb650;
   localparam u0_5 = 256'h53da7670766ad5491332765df59c76ba16a31757551e56eb53da765453da74e6;
   localparam u0_6 = 256'h16cff71ad49bc431967a156b56a354e65193d2f244eff72b765876c854e656a3;
   localparam u0_7 = 256'h00de149000ded549133292f256a815a975d575d5a276557500ded71a551e566e;
   localparam u0_8 = 256'h558a40927682e4293034568b55e6e09c00de803476f0f7215682d4a800deb685;
   localparam u0_9 = 256'h92f2969f94609468f54276b500fed5135193769a669430347495303440929534;
   localparam u0_A = 256'h16c5c03fc4e0c03f54aa203464c85678162e73d0d6aff13a54e6641a46ceb65e;
   localparam u0_B = 256'h76c1761fb3ded549f642d2b996c0d51396bd00de159e00de00dea2de00de46b2;
   localparam u0_C = 256'hc44f46aa7682e42695e696c2c6a5966214cbb747176ff5e176a276ca55e9d688;
   localparam u0_D = 256'h75f475f455e5d54950924491e442d51355a100fefe005092551e5606d5c95637;
   localparam u0_E = 256'ha2de00fec4e0e411f756962296c6d6e2551ea2de468ef71a641a56e8161d74ca;
   localparam u0_F = 256'h44c74446447ed54954f95645d4d9d51355ab06fa55db3c1202dd44e6551e5672;
   localparam u1_0 = 256'h4320302130291021152044053020440510203020302043243020222511110005;
   localparam u1_1 = 256'h4521404d63202021402013204425452106273020105040453021543530213021;
   localparam u1_2 = 256'h4320345090213021404424053021240540243421302080013020406133207505;
   localparam u1_3 = 256'h90019001986145204020936113284521d550c8219321b623a700452430214370;
   localparam u1_4 = 256'h4045302095213021da237985404479851121e521404530213020806140447085;
   localparam u1_5 = 256'h55231111cd214520402095214521106d3021102155239c615523111155231b91;
   localparam u1_6 = 256'h4044302095213021b9234020302113205522d723305030214e45804513203021;
   localparam u1_7 = 256'ha700d520a700452040201723404d452041c140b006af4020a700302055239c61;
   localparam u1_8 = 256'h55234f269e2930214f47404543203e29a70043ad1111302140253421a7000005;
   localparam u1_9 = 256'hd721e9211e291e294429cd213020452155229521404d6f23d521d5214f4e5f22;
   localparam u1_A = 256'h40443021a0293021d5214f2730293e294024208140448001434c306d404d7505;
   localparam u1_B = 256'h11211121b623452010291521304145214045a7004020a700a700064fa700404d;
   localparam u1_C = 256'h3050404d9e2930215f2260d9402460d9d520e521302034214e45804545211051;
   localparam u1_D = 256'h46c146c15523452045463021302945215523302054e74f4655239c6144204044;
   localparam u1_E = 256'h064f3020a02930213020402140451029552306af404d3021306d806110203521;
   localparam u1_F = 256'h302030203020452035214045444545215522404c552354263020302055239c61;
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
   assign d[12] = indir[8];
   assign d[16] = indir[9];
   assign d[17] = indir[10];
   assign d[18] = indir[11];
   assign d[19] = indir[12];
   assign d[22] = indir[13];
   assign d[23] = indir[14];
   assign d[24] = indir[15];
   assign d[25] = indir[16];
   assign d[27] = indir[17];
   assign d[42] = indir[18];
   assign d[43] = indir[19];
   // replaces = 1000000100100101000000000100001100011100000000
   SB_LUT4 #(.LUT_INIT(16'h0042)) cmb_d08(.O(d[8]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0498)) cmb_d09(.O(d[9]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h2418)) cmb_d10(.O(d[10]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d14(.O(d[14]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h1800)) cmb_d15(.O(d[15]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h7ffe)) cmb_d20(.O(d[20]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h4008)) cmb_d30(.O(d[30]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0100)) cmb_d32(.O(d[32]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h1002)) cmb_d35(.O(d[35]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h1200)) cmb_d38(.O(d[38]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0400)) cmb_d45(.O(d[45]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   // replaces = 0100101011011000110000000000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'ha928)) cmb_d28(.O(d[28]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'ha070)) cmb_d29(.O(d[29]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0842)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h3100)) cmb_d34(.O(d[34]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h8004)) cmb_d36(.O(d[36]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h8400)) cmb_d37(.O(d[37]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h5207)) cmb_d39(.O(d[39]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d41(.O(d[41]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h4000)) cmb_d44(.O(d[44]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0000010000000010000100001000000010100000000000
   SB_LUT4 #(.LUT_INIT(16'h7a42)) cmb_d11(.O(d[11]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h11f5)) cmb_d13(.O(d[13]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h68ff)) cmb_d21(.O(d[21]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h6020)) cmb_d26(.O(d[26]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0084)) cmb_d31(.O(d[31]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4881)) cmb_d40(.O(d[40]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
