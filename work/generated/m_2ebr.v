/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019-2020. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has 45 columns
 * Removed:  000000000000000000000000000000000000000000000 These are treated already, removed from consideration
 * Reserved: 000000000000000000000000001000000000000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 45
 * 209 distinct lines in remaining untreated columns
 *  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 
 * 208 208 209 207 209 208 207 208 209 208 209 207 205 207 209 209 209 209   x 209 209 209 208 208 209 208 209 208 209 209 209 209 209 209 209 209 209 209 209 209 209 209 209 208 209  kill col 12  Tbl  43 cols 000000000000000000000000001000001000000000000 has 205 unique lines.
 * 204 204 205 203 205 204 203 204 205 204 205 203     202 205 205 205 205   x 205 205 205 202 204 205 203 205 204 205 205 205 205 205 205 205 205 205 205 205 205 205 205 204 204 205  kill col 22  Tbl  42 cols 000000000000000000000010001000001000000000000 has 202 unique lines.
 * 200 201 202 200 202 200 199 201 202 201 202 200     199 202 202 202 202   x 202 202 202     201 201 201 202 201 202 202 202 202 202 202 202 202 202 202 202 202 202 202 201 201 202  kill col 13  Tbl  41 cols 000000000000000000000010001000011000000000000 has 199 unique lines.
 * 197 198 199 197 198 197 196 198 198 198 199 196         199 199 199 199   x 199 199 199     198 198 198 199 198 199 199 199 199 199 199 199 199 199 199 199 199 199 199 198 198 199  kill col 11  Tbl  40 cols 000000000000000000000010001000011100000000000 has 196 unique lines.
 * 194 195 196 194 194 194 193 195 195 195 196             196 196 196 196   x 196 196 196     195 195 195 196 195 196 196 196 196 196 196 196 196 196 196 196 196 196 196 194 195 196  kill col  6  Tbl  39 cols 000000000000000000000010001000011100001000000 has 193 unique lines.
 * 191 192 192 191 191 191     192 192 192 193             193 193 193 193   x 193 193 193     192 192 192 193 192 193 193 193 193 193 193 192 193 193 193 193 193 193 193 191 192 193  kill col 42  Tbl  38 cols 001000000000000000000010001000011100001000000 has 191 unique lines.
 * 188 190 190 189 189 189     190 190 190 191             191 191 191 191   x 190 191 191     190 190 190 191 190 191 191 191 191 191 191 190 191 191 191 191 191 191 191     189 191  kill col  0  Tbl  37 cols 001000000000000000000010001000011100001000001 has 188 unique lines.
 *     187 187 184 185 185     186 187 187 188             188 188 188 188   x 187 188 188     187 187 187 188 186 188 188 188 188 188 188 187 188 188 188 188 188 188 188     186 188  kill col  3  Tbl  36 cols 001000000000000000000010001000011100001001001 has 184 unique lines.
 *     180 181     180 179     182 183 183 184             183 184 184 184   x 183 184 184     181 183 183 184 182 184 184 184 184 184 184 182 184 184 184 184 184 184 184     182 184  kill col  5  Tbl  35 cols 001000000000000000000010001000011100001101001 has 179 unique lines.
 *     172 174     173         173 178 178 179             178 179 179 179   x 178 179 179     176 177 177 178 177 179 178 179 179 179 179 177 179 179 179 179 179 179 179     175 179  kill col  1  Tbl  34 cols 001000000000000000000010001000011100001101011 has 172 unique lines.
 *         159     160         164 170 171 172             170 172 171 170   x 171 172 171     168 167 165 169 170 172 170 172 172 172 171 170 172 172 172 172 172 172 172     167 172  kill col  2  Tbl  33 cols 001000000000000000000010001000011100001101111 has 159 unique lines.
 *                 146         144 157 158 159             156 159 157 155   x 157 159 157     153 152 152 157 157 159 157 159 159 159 158 157 159 159 159 159 159 159 159     152 158  kill col  7  Tbl  32 cols 001000000000000000000010001000011100011101111 has 144 unique lines.
 *                 126             141 143 144             141 144 140 138   x 140 144 141     137 133 132 142 142 142 142 144 143 144 143 142 144 144 144 144 144 144 144     137 142  kill col  4  Tbl  31 cols 001000000000000000000010001000011100011111111 has 126 unique lines.
 *                                 121 125 126             121 126 121 120   x 121 126 120     116 114 114 124 124 123 123 126 125 125 125 122 126 126 126 126 126 126 126     118 125  kill col 25  Tbl  30 cols 001000000000000000010010001000011100011111111 has 114 unique lines.
 *                                 109 113 114             108 113 108 108   x 109 114 108     100 103     112 112 112 111 114 113 113 113 110 114 114 114 114 114 114 114     106 113  kill col 23  Tbl  29 cols 001000000000000000010110001000011100011111111 has 100 unique lines.
 *                                  95  99  99              95  99  95  95   x  95 100  94          90      98  97  98  97 100  98  99  99  96 100 100 100 100 100 100  99      92  99  kill col 24  Tbl  28 cols 001000000000000000011110001000011100011111111 has  90 unique lines.
 *                                  84  88  89              86  89  83  85   x  85  90  84                  88  87  89  87  90  88  89  89  86  90  90  89  90  90  90  89      83  88  kill col 43  Tbl  27 cols 011000000000000000011110001000011100011111111 has  83 unique lines.
 *                                  78  81  81              79  82  76  78   x  77  83  77                  81  80  82  80  83  81  82  82  79  83  83  82  83  83  83  82          78  kill col 16  Tbl  26 cols 011000000000000000011110001010011100011111111 has  76 unique lines.
 *                                  71  74  74              72  75      71   x  68  75  69                  73  73  75  73  76  74  75  75  72  76  76  75  76  76  75  75          72  kill col 19  Tbl  25 cols 011000000000000000011110011010011100011111111 has  68 unique lines.
 *                                  64  66  66              65  67      62   x      67  62                  65  65  67  65  68  66  67  67  64  68  68  67  68  67  67  67          64  kill col 21  Tbl  24 cols 011000000000000000011111011010011100011111111 has  62 unique lines.
 *                                  59  60  60              59  61      56   x      60                      59  59  61  60  62  60  61  61  58  62  62  61  62  61  61  61          59  kill col 17  Tbl  23 cols 011000000000000000011111011110011100011111111 has  56 unique lines.
 *                                  53  54  54              53  55           x      54                      53  54  55  53  56  54  55  55  52  56  55  55  56  55  53  55          54  kill col 34  Tbl  22 cols 011000000010000000011111011110011100011111111 has  52 unique lines.
 *                                  50  50  50              49  51           x      50                      49  50  51  50  52  50  51  51      52  51  51  52  51  49  51          50  kill col 40  Tbl  21 cols 011010000010000000011111011110011100011111111 has  49 unique lines.
 *                                  47  47  47              46  48           x      47                      46  47  47  47  49  47  48  48      49  48  48  49  48      48          47  kill col 26  Tbl  20 cols 011010000010000000111111011110011100011111111 has  46 unique lines.
 *                                  44  44  44              43  45           x      43                          42  41  42  46  44  45  45      46  45  45  46  44      44          44  kill col 28  Tbl  19 cols 011010000010000010111111011110011100011111111 has  41 unique lines.
 *                                  39  39  39              39  40           x      38                          36      37  40  39  40  38      41  40  40  41  37      39          39  kill col 27  Tbl  18 cols 011010000010000011111111011110011100011111111 has  36 unique lines.
 *                                  34  34  34              34  35           x      33                                  33  35  34  35  33      36  35  35  36  32      34          34  kill col 39  Tbl  17 cols 011011000010000011111111011110011100011111111 has  32 unique lines.
 *                                  31  30  30              30  31           x      30                                  25  31  30  31  29      32  31  31  31          30          30  kill col 29  Tbl  16 cols 011011000010000111111111011110011100011111111 has  25 unique lines.
 *                                  24  23  23              24  24           x      23                                      24  23  24  23      25  23  24  24          23          23  kill col 44  Tbl  15 cols 111011000010000111111111011110011100011111111 has  23 unique lines.
 *                                  22  21  21              22  22           x      21                                      22  21  22  21      23  21  22  22          21              kill col 41  Tbl  14 cols 111111000010000111111111011110011100011111111 has  21 unique lines.
 *                                  20  19  19              20  20           x      19                                      20  19  20  19      21  19  20  20                          kill col 36  Tbl  13 cols 111111001010000111111111011110011100011111111 has  19 unique lines.
 *                                  18  17  17              18  18           x      17                                      18  17  18  17      19      17  18                          kill col 37  Tbl  12 cols 111111011010000111111111011110011100011111111 has  17 unique lines.
 *                                  16  15  15              16  16           x      15                                      16  15  16  15      17          16                          kill col 33  Tbl  11 cols 111111011011000111111111011110011100011111111 has  15 unique lines.
 *
 * Round 1: 000000100100111000000000100001100011100000000  4 columns for indexes to table representing 11 original columns (uses 15 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 38
 * 208 distinct lines in remaining untreated columns
 *  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 
 * 207 207 208 206 208 207 206 207   x   x   x 206 204 206   x   x 208 208   x 206   x 208 207 207 208 207 208 207 208 208   x   x   x 208 208   x 208 208   x 208 208 208 208 205 208  kill col 12  Tbl  32 cols 000000100100111000000000101001101011100000000 has 204 unique lines.
 * 203 203 204 202 204 203 202 203   x   x   x 202     201   x   x 204 204   x 202   x 204 201 203 204 202 204 203 204 204   x   x   x 204 204   x 204 204   x 204 204 204 203 201 204  kill col 43  Tbl  31 cols 010000100100111000000000101001101011100000000 has 201 unique lines.
 * 200 200 201 199 201 200 199 200   x   x   x 199     198   x   x 201 201   x 199   x 201 198 200 201 199 201 200 201 201   x   x   x 201 201   x 201 201   x 201 201 201 199     201  kill col 22  Tbl  30 cols 010000100100111000000010101001101011100000000 has 198 unique lines.
 * 196 197 198 196 198 196 195 197   x   x   x 196     194   x   x 198 198   x 196   x 198     197 197 197 198 197 198 198   x   x   x 198 198   x 198 198   x 198 198 198 196     198  kill col 13  Tbl  29 cols 010000100100111000000010101001111011100000000 has 194 unique lines.
 * 192 193 194 192 192 192 191 193   x   x   x 191           x   x 194 194   x 192   x 194     193 193 193 194 193 194 194   x   x   x 194 194   x 194 194   x 194 194 194 192     194  kill col 11  Tbl  28 cols 010000100100111000000010101001111111100000000 has 191 unique lines.
 * 189 189 191 189 188 189 187 190   x   x   x               x   x 191 191   x 188   x 191     190 190 190 191 190 191 191   x   x   x 191 191   x 191 191   x 191 191 191 185     191  kill col 42  Tbl  27 cols 011000100100111000000010101001111111100000000 has 185 unique lines.
 * 183 183 185 183 182 181 180 184   x   x   x               x   x 185 185   x 182   x 185     184 184 184 185 184 185 185   x   x   x 185 185   x 185 185   x 185 185 185         185  kill col  6  Tbl  26 cols 011000100100111000000010101001111111101000000 has 180 unique lines.
 * 177 178 179 178 177 176     179   x   x   x               x   x 180 179   x 177   x 179     179 179 179 180 179 180 180   x   x   x 180 179   x 180 180   x 180 180 180         180  kill col  5  Tbl  25 cols 011000100100111000000010101001111111101100000 has 176 unique lines.
 * 171 172 171 170 173         168   x   x   x               x   x 175 175   x 172   x 174     173 173 175 176 175 176 174   x   x   x 176 175   x 176 176   x 176 176 176         175  kill col  7  Tbl  24 cols 011000100100111000000010101001111111111100000 has 168 unique lines.
 * 163 162 162 161 164               x   x   x               x   x 165 167   x 164   x 166     166 160 166 168 167 167 166   x   x   x 168 167   x 168 168   x 168 168 168         167  kill col 24  Tbl  23 cols 011000100100111000001010101001111111111100000 has 160 unique lines.
 * 151 153 152 153 155               x   x   x               x   x 157 159   x 155   x 158     157     156 160 159 158 158   x   x   x 158 159   x 160 160   x 160 160 160         159  kill col  0  Tbl  22 cols 011000100100111000001010101001111111111100001 has 151 unique lines.
 *     139 139 140 141               x   x   x               x   x 148 148   x 146   x 148     147     144 149 149 148 149   x   x   x 149 149   x 151 151   x 151 150 151         148  kill col  2  Tbl  21 cols 011000100100111000001010101001111111111100101 has 139 unique lines.
 *     125     122 123               x   x   x               x   x 135 133   x 132   x 136     135     129 137 137 136 137   x   x   x 135 136   x 139 139   x 139 138 139         136  kill col  3  Tbl  20 cols 011000100100111000001010101001111111111101101 has 122 unique lines.
 *      98         103               x   x   x               x   x 116 114   x 115   x 117     111     110 118 120 118 119   x   x   x 117 119   x 121 122   x 122 121 122         119  kill col  1  Tbl  19 cols 011000100100111000001010101001111111111101111 has  98 unique lines.
 *                  77               x   x   x               x   x  89  87   x  89   x  94      88      83  95  96  95  96   x   x   x  95  96   x  97  97   x  98  96  98          94  kill col  4  Tbl  18 cols 011000100100111000001010101001111111111111111 has  77 unique lines.
 *                                   x   x   x               x   x  68  67   x  68   x  73      67      66  73  75  75  74   x   x   x  75  74   x  76  76   x  77  76  77          74  kill col 25  Tbl  17 cols 011000100100111000011010101001111111111111111 has  66 unique lines.
 *                                   x   x   x               x   x  58  58   x  59   x  62      55          62  63  65  63   x   x   x  63  63   x  65  65   x  66  65  66          62  kill col 23  Tbl  16 cols 011000100100111000011110101001111111111111111 has  55 unique lines.
 *                                   x   x   x               x   x  47  50   x  50   x  51                  50  51  54  52   x   x   x  51  52   x  54  54   x  55  54  54          51  kill col 16  Tbl  15 cols 011000100100111000011110101011111111111111111 has  47 unique lines.
 *                                   x   x   x               x   x      41   x  42   x  41                  41  42  45  44   x   x   x  44  44   x  46  46   x  47  44  46          44  kill col 26  Tbl  14 cols 011000100100111000111110101011111111111111111 has  41 unique lines.
 *                                   x   x   x               x   x      35   x  36   x  35                      36  39  38   x   x   x  38  38   x  40  40   x  40  38  40          38  kill col 21  Tbl  13 cols 011000100100111000111111101011111111111111111 has  35 unique lines.
 *                                   x   x   x               x   x      30   x  30   x                          30  32  33   x   x   x  32  32   x  34  34   x  33  32  34          33  kill col 27  Tbl  12 cols 011000100100111001111111101011111111111111111 has  30 unique lines.
 *                                   x   x   x               x   x      26   x  25   x                              27  28   x   x   x  27  27   x  29  29   x  28  27  29          28  kill col 19  Tbl  11 cols 011000100100111001111111111011111111111111111 has  25 unique lines.
 *                                   x   x   x               x   x      20   x       x                              22  22   x   x   x  22  22   x  24  24   x  24  22  24          23  kill col 17  Tbl  10 cols 011000100100111001111111111111111111111111111 has  20 unique lines.
 *                                   x   x   x               x   x           x       x                              17  17   x   x   x  16  17   x  19  19   x  19  16  19          19  kill col 40  Tbl   9 cols 011010100100111001111111111111111111111111111 has  16 unique lines.
 *
 * Round 2: 100101011011000110000000000000000000000000000  4 columns for indexes to table representing  9 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 33
 * 207 distinct lines in remaining untreated columns
 *  c0  c1  c2  c3  c4  c5  c6  c7  c8  c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19 c20 c21 c22 c23 c24 c25 c26 c27 c28 c29 c30 c31 c32 c33 c34 c35 c36 c37 c38 c39 c40 c41 c42 c43 c44 
 * 206 205 206 205 207 206 205 205   x   x   x 205 203 205   x   x 207 207   x 204   x 207 206 206 207 205 207 206   x   x   x   x   x   x   x   x   x   x   x   x 207   x 207 204   x  kill col 12  Tbl  23 cols 100101111111111110000000101001101011100000000 has 203 unique lines.
 * 202 201 202 201 203 202 201 201   x   x   x 201     200   x   x 203 203   x 200   x 203 200 202 203 200 203 202   x   x   x   x   x   x   x   x   x   x   x   x 203   x 202 200   x  kill col 43  Tbl  22 cols 110101111111111110000000101001101011100000000 has 200 unique lines.
 * 199 198 199 198 200 199 198 198   x   x   x 198     197   x   x 200 200   x 197   x 200 197 199 200 197 200 199   x   x   x   x   x   x   x   x   x   x   x   x 200   x 198       x  kill col 25  Tbl  21 cols 110101111111111110010000101001101011100000000 has 197 unique lines.
 * 196 194 196 195 197 196 195 195   x   x   x 195     194   x   x 196 197   x 194   x 197 194 195 197     197 196   x   x   x   x   x   x   x   x   x   x   x   x 197   x 195       x  kill col 22  Tbl  20 cols 110101111111111110010010101001101011100000000 has 194 unique lines.
 * 192 191 193 191 194 192 191 192   x   x   x 192     190   x   x 193 194   x 191   x 194     192 192     194 193   x   x   x   x   x   x   x   x   x   x   x   x 194   x 192       x  kill col 13  Tbl  19 cols 110101111111111110010010101001111011100000000 has 190 unique lines.
 * 188 187 189 187 187 188 186 188   x   x   x 186           x   x 189 190   x 186   x 190     188 188     190 189   x   x   x   x   x   x   x   x   x   x   x   x 190   x 188       x  kill col 19  Tbl  18 cols 110101111111111110010010111001111011100000000 has 186 unique lines.
 * 183 181 184 183 182 184 182 184   x   x   x 181           x   x 185 185   x       x 186     184 184     186 185   x   x   x   x   x   x   x   x   x   x   x   x 186   x 184       x  kill col 11  Tbl  17 cols 110101111111111110010010111001111111100000000 has 181 unique lines.
 * 178 175 178 176 176 177 176 179   x   x   x               x   x 178 180   x       x 181     179 179     181 180   x   x   x   x   x   x   x   x   x   x   x   x 181   x 175       x  kill col 42  Tbl  16 cols 111101111111111110010010111001111111100000000 has 175 unique lines.
 * 169 169 171 170 169 169 168 171   x   x   x               x   x 172 174   x       x 174     173 173     175 174   x   x   x   x   x   x   x   x   x   x   x   x 175   x           x  kill col  6  Tbl  15 cols 111101111111111110010010111001111111101000000 has 168 unique lines.
 * 158 159 161 161 160 158     162   x   x   x               x   x 164 166   x       x 165     163 164     168 167   x   x   x   x   x   x   x   x   x   x   x   x 168   x           x  kill col  5  Tbl  14 cols 111101111111111110010010111001111111101100000 has 158 unique lines.
 * 145 147 144 145 147         146   x   x   x               x   x 148 153   x       x 152     149 147     158 157   x   x   x   x   x   x   x   x   x   x   x   x 158   x           x  kill col  2  Tbl  13 cols 111101111111111110010010111001111111101100100 has 144 unique lines.
 * 126 127     127 127         128   x   x   x               x   x 129 139   x       x 136     134 129     143 141   x   x   x   x   x   x   x   x   x   x   x   x 142   x           x  kill col  0  Tbl  12 cols 111101111111111110010010111001111111101100101 has 126 unique lines.
 *     103     107 105         107   x   x   x               x   x 105 118   x       x 115     113 108     123 122   x   x   x   x   x   x   x   x   x   x   x   x 123   x           x  kill col  1  Tbl  11 cols 111101111111111110010010111001111111101100111 has 103 unique lines.
 *              77  77          78   x   x   x               x   x  81  93   x       x  93      87  85      98  99   x   x   x   x   x   x   x   x   x   x   x   x  99   x           x  kill col  4  Tbl  10 cols 111101111111111110010010111001111111101110111 has  77 unique lines.
 *              54              57   x   x   x               x   x  60  66   x       x  70      61  62      72  72   x   x   x   x   x   x   x   x   x   x   x   x  73   x           x  kill col  3  Tbl   9 cols 111101111111111110010010111001111111101111111 has  54 unique lines.
 *                              39   x   x   x               x   x  43  43   x       x  49      42  43      47  51   x   x   x   x   x   x   x   x   x   x   x   x  50   x           x  kill col  7  Tbl   8 cols 111101111111111110010010111001111111111111111 has  39 unique lines.
 *                                   x   x   x               x   x  30  26   x       x  35      28  30      32  34   x   x   x   x   x   x   x   x   x   x   x   x  36   x           x  kill col 17  Tbl   7 cols 111101111111111110010010111101111111111111111 has  26 unique lines.
 *                                   x   x   x               x   x  20       x       x  23      19  20      20  20   x   x   x   x   x   x   x   x   x   x   x   x  22   x           x  kill col 23  Tbl   6 cols 111101111111111110010110111101111111111111111 has  19 unique lines.
 *                                   x   x   x               x   x  13       x       x  16          13      13  13   x   x   x   x   x   x   x   x   x   x   x   x  16   x           x  kill col 27  Tbl   5 cols 111101111111111111010110111101111111111111111 has  13 unique lines.
 *
 * Round 3: 000010000000000000101001000010000000000000000  4 columns for indexes to table representing  5 original columns (uses 13 of 16 lines in indirect table).
 * Direct:  011000000000000001010110011100011100011111111 20 columns
 * Success. Use 2 EBRs, 25 LUTs.
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
    * 00 LB_0     LB_1     0 0 0 01010110110000000001| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 1 00011110100111010010|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 2 01010110110010111110| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 FENCE    StdIncPc 3 0 3 000010x01xxx11100110| f      Prepare read PC (FENCE)
    * 04 ADDI_0   StdIncPc 3 3 3 01001010110011100110| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L05     ADDI_0   1 0 3 000010x00xxx00000100| AUIPC  q = imm20 (copy x/8)
    * 06 LB_3     LB_4     2 0 3 00001010101000000111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     2 0 3 00000110101100001001|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L08     SB_1     2 4 0 01011010110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     2 0 3 00000110100010001011|        q = D^0xffffffff^q = D^0x80
    * 0a _L0a     SB_1     2 4 0 01011010110001011010| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    3 5 4 00001010101110000110|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   2 0 3 00011010100100000100| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    4 0 3 100110x01xxx11100010| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    4 0 3 000110x01xxx00010000| SUB    Subtraction
    * 0f _L0f     StdIncPc 3 3 3 00001010111011100110| LUI    q = imm20
    * 10 SUB_1    LB_6     2 0 3 00011110100010001011|        Q = ~RS2
    * 11 AND_1    ANDI_1   2 0 3 00011010100000011010|        RS1^0xffffffff to Q
    * 12 eFetch3  Fetch    5 6 0 00xxxxxxxxxx11x1111x|  Fr00  Not in use
    * 13 condb_2  condb_3  2 0 3 00011110100000010100|        ~RS2 in Q
    * 14 condb_3  condb_4  1 0 5 01001010110000010101|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  2 0 6 00010010100100010110|        Branch on condition
    * 16 condb_5  Fetch    0 7 5 00110100011011011110|        Branch not taken.
    * 17 condb_5t BrOpFet  0 4 4 01110110110001110100|        Branch taken.
    * 18 BEQ      condb_2  4 5 3 00011010111000010011| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   3 4 3 01011010110001000001| JALR   jj=RS1+imm
    * 1a ANDI_1   StdIncPc 3 3 3 00001010101111100110|        rd = Iimm & RS1
    * 1b _L1b     JAL_1    1 0 4 00001010011000110010| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 1 0 2 00011110011010100110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 3 3 3 00001010111111100110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 1 0 5 11011000110011010100|        Q = 4
    * 1f IJ_2     IJ_3     3 5 3 00011010111010110111|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     0 5 7 01010110110001010010| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 3 3 3 00001010100011100110|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  1 0 8 00011010110000111001|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 FENCEI   StdIncPc 3 0 3 000010x01xxx11100110| f      Prepare read PC (FENCE)
    * 24 SLLI_0   SLLI_1   6 0 0 00011110011000110101| SLLI   Shift left immediate.
    * 25 _L25     ADDI_0   1 0 3 000010x00xxx00000100| AUIPC  q = imm20 (copy x/8)
    * 26 OR_1     OR_2     4 4 3 00011010100000100111|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    1 0 3 01000010110000011101|        Q = rs2
    * 28 _L28     SH_1     2 4 7 01011010110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   2 0 3 00011010100000100001|        Q = RS1^0xFFFFFFFF
    * 2a _L2a     SH_1     2 4 7 01011010110010010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  3 0 5 010xxx10110000110000|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    4 0 3 000110x00xxx00111110| SLL    Shift left
    * 2d MULH_0   MULH_1   7 0 3 00011010100101101010| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e EBRKWFI2 EBREAK_1 4 4 6 00001010101011110111| EBREAK/WFI2 Select EBREAK or WFI
    * 2f _L2f     StdIncPc 3 3 3 00001010111011100110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 3 3 9 00001010111011100110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  2 0 3 00011110100000101011|        ~rs2 to Q
    * 32 JAL_1    JAL_2    3 5 3 01001010110010000110|        Target adr to yy
    * 33 JAERR_1  JAERR_2  8 5 3 01101010010010000001|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    0 7 3 00110110000111011110|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   7 3 3 00011110100100110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   FENCE    7 8 3 00011110110100000011|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  8 5 6 000xxx10100111010111|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  4 5 3 00011010111000010011| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 3 3 3 10001010100111100110|        Last shift.
    * 3a SRxI_1   SRxI_2   7 3 8 00011010100100111101|        Register to shift to Q
    * 3b _L3b     JAL_1    1 0 4 00001010011000110010| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  4 5 3 00001010111001001001| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   FENCE    7 8 8 00011010100100000011|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   6 0 0 00011110000100110101|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   6 0 0 00011110000100111010|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 0 4 01010110110001010000| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   1 0 5 01000010110000001011|        Q=1
    * 42 MULHU_2  MULHU_3  7 0 8 00011010110010100010|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  1 0 3 00000010000011101010|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  2 0 3 00011110101000101011| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    1 0 5 01011010110001100101|        More check offset
    * 46 ILL_1    ILL_2    9 5 3 00010110100101000111|        Store PC to mepc and Q for read of instr
    * 47 ILL_2    ILL_3    1 1 3 00011110100110001111|        Read until Q is offending instruction
    * 48 _L48     SW_1     0 9 4 01011010110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  1 0 5 01000010110001001011|        Construct PC storage adr
    * 4a _L4a     SW_1     0 9 4 01011010110001100110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  a a 3 00111010000110110000|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   4 0 3 000110x01xxx00110001| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  6 5 3 00011010100110100011| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     3 0 3 000xxxx00xxx11111110| Illegal instruction seen
    * 4f MRET_8   StdIncPc 1 0 5 01011010110011100110|        Prep +4
    * 50 LW_1     StdIncPc 3 b a 00011110100111100110|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   a 5 3 00111010011011011010|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 1 00011110100101010100|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   a 5 3 00111010011011011010|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     7 c 8 00011010100111101011|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 8 5 3 00111010111000011110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 0 3 00010010101101010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     1 0 3 00010010100010001011|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    1 0 8 11011110100110111010|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   4 5 3 00011110111010011100|        REM = Q to yy
    * 5a SB_1     SB_2     7 5 3 00011110100101011101|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L5b     JAL_1    1 0 4 00001010011000110010| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRW_1  4 5 3 00001010111001001001| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     7 d 3 00011110110111111011|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 1 00011110100101110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   a 5 3 00111010011011011010|  err   LD AlignFault. Faulting adr to mtval
    * 60 DIV_14   LB_6     1 0 3 00011010100010001011|        RS2 < 0, RS1 >= 0, change sign yy
    * 61 DIV_15   StdIncPc 3 3 3 00001010100111100110|        RS2 < 0, RS1 < 0, yy is true result
    * 62 DIV_8    DIV_7    7 0 5 01011110110011001000|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    1 e 5 01011110110001011000|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  2 0 3 00011110101000101011| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    3 0 6 000010x01xxx11101111|        Prepare read PC
    * 66 SW_1     SW_2     b 6 3 00111010000111110010|        Write d to a+k until accepted
    * 67 SWE      SW_E2    8 5 3 00101010011010010011|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 3 3 3 00001010100111100110|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     1 0 3 00011010100010001011|        RS2 > 0, RS1 < 0, change sign yy
    * 6a MULH_1   MULH_2   3 5 3 00011010100011111001|        Store ~rs1 to Ryy. Prep construct 1.
    * 6b SB_4     SB_5     0 9 3 00110010100101111010|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   4 0 3 000110x01xxx00110001| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  6 5 3 00011010100110100011| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e LHU_3    ANDI_1   2 0 3 00001110101000011010|        Invert q. Prepare read mask
    * 6f MRET_6   MRET_7   1 0 5 010xxx10110011001111|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    7 c 8 00011010100101101110|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 8 5 3 00111010111000011110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   2 0 3 00001010101000011010|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  c 5 3 00110010100101110110|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   3 1 b 00011110100111110100| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  3 0 3 000010x00xxx01110011|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  1 0 3 00001010100001110111|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  8 5 5 01011010010001111101|        origPC to mepc. Prep read 0
    * 78 DIV_4    DIV_6    3 5 3 00000010111010101010|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    1 0 5 11011010110010101000|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     2 6 3 00110010000111110010|        Write d to a+k until accepted
    * 7b _L7b     JAL_1    1 0 4 00001010011000110010| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRW_1  4 5 3 00001010111001001001| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  JAL_3    3 f 3 00110110000100110100|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    8 5 3 000xxx10100110010000|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  8 5 3 00111010000101111101|        mtval is target
    * 80 LBU_0    LBU_1    0 0 0 01010110110010000101| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  8 5 3 00011010000101111101|        Store PC to mepc
    * 82 DIV_1    DIV_3    4 4 3 00011010100010101000|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    1 0 3 01011010110010000010|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   2 0 3 00011110101000100001| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 1 00011110100111110000|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_3    4 3 5 11010000010000110100|        Return address to TRG
    * 87 JALRE1   JALRE2   c 5 3 00010010000101111111|  err   Store pc to mepc
    * 88 DIV_E    DIV_10   4 e 3 100111x00xxx10011100|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 3 3 3 00001010111011100110|        RS2 == 0, return 0xffffffff
    * 8a DIVU_5   ANDI_1   3 0 8 110111x01xxx00011010|        Transfer rM to rDee
    * 8b LB_6     StdIncPc 3 3 5 11001010110011100110|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * 8c XOR_0    XOR_1    4 0 3 000111x01xxx00101001| XOR    xor
    * 8d DIV_0    DIV_1    7 e 3 10011110100110000010| DIV    Branch on sign dividend RS1
    * 8e aF_SW_3  LDAF_3   3 f 3 01101000010010010010|        Store 7 to mcause
    * 8f ILL_3    ILL_4    8 5 3 00111010111010101001|        Store illegal instruction to mtval
    * 90 NMI_2    JAL_3    c f 3 00100010111000110100|        mtval = 0.
    * 91 LDAF_2   LDAF_3   3 f 5 11101000010010010010|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    8 5 3 00010110000100110100|        PC to mepc
    * 93 SW_E2    SW_E3    8 5 3 00011110100110010101|        Store address that faulted
    * 94 SW_E4    JAL_3    3 f 3 00110110010100110100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    1 0 5 11011100110010010100|        Q = 3
    * 96 SH_1     SH_2     7 5 3 00011110100110111011|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SWH      SW_E2    8 5 3 00101010011010010011|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  4 5 3 00011010111000010011| BLT    Conditional Branch. Offset to Ryy
    * 99 _L99     ILLe     3 0 3 000xxxx00xxx11111110| Illegal instruction seen
    * 9a ECALL_6  JAL_3    3 f 3 01110100010000110100|        mcause = 11
    * 9b ILL_5    JAL_3    3 f 5 01110110010000110100|        Store 2 to mcause
    * 9c DIV_10   DIV_12   4 e 3 10010010100101101000|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   4 e 3 10010010100101100000|        RS2 < 0. Branch on sign of RS1
    * 9e SH_4     SH_5     9 9 3 00010010100110011111|        Address back to Q. Prepare get item to write
    * 9f SH_5     SW_2     b 6 3 00010010000111110010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    0 5 7 01010110110001011110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm.
    * a1 ECALL_4  ECALL_5  1 0 5 11011000110011001110|        Q = 4
    * a2 MULHU_3  MULHU_2  2 0 3 10011110100101000010|        Shift Q and rM. Prepare read rs1
    * a3 MULHU_1  MULHU_2  4 4 3 10011110111001000010|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * a4 SRxI_0   SRxI_1   6 0 0 00011110011000111010| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   2 0 5 01001010110010101111|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  1 0 4 00011110011011010000| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 1 0 3 010xxx10110000101110| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    1 e 3 10011010100001111000|        Branch on sign divisor RS2
    * a9 ILL_4    ILL_5    1 0 5 00011010110010011011|        Q = 1
    * aa DIV_6    DIV_7    3 0 3 100111x01xxx11001000|        Write M. Prepare shift
    * ab EBREAK_2 ECALL_6  8 5 3 00011010100110011010|        pc to mepc
    * ac _Lac     SRx_1    4 0 3 000110x00xxx00111111| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   6 0 3 100110x01xxx11100000| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _Lae     SRx_1    4 0 3 000110x00xxx00111111| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   1 0 5 010xxx10110011000101|        0x202 + 0xff + 1 = 0x302
    * b0 CSRRW_3  CSRRW_4  1 0 5 11011000110010110010|        Prep emulation entrypt 0x108, here Q to 0x104
    * b1 CSRRS_1  Fetch    5 6 0 00xxxxxxxxxx11x1111x|        Not in use
    * b2 CSRRW_4  Fetch    0 7 5 11110100010011011110|        IncPC, OpFetch, but force +4
    * b3 CSRRWI_1 Fetch    5 6 0 00xxxxxxxxxx11x1111x|        Not in use
    * b4 CSRRWI_2 Fetch    5 6 0 00xxxxxxxxxx11x1111x|        Not in use
    * b5 SH_3     SH_4     3 0 3 00000010111010011110|        Prepare get back address to use 
    * b6 CSRRCI_1 Fetch    5 6 0 00xxxxxxxxxx11x1111x|        Not in use
    * b7 IJ_3     IJ_4     2 0 3 01010000110010111101|        Construct Q = 3
    * b8 BGE      condb_2  4 5 3 00011010111000010011| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    2 0 5 00010010100011000000|        Calc carry of RS2+0xFFFFFFFF
    * ba DIV_C    DIV_e    2 5 3 00011010000110111001|        rM to yy. Q=ffffffff
    * bb SH_2     SH_3     7 d 3 00011110110110110101|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * bc CSRRWI_0 CSRRW_1  4 5 3 00001010111001001001| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    0 7 3 00110110001111011110|        Mask and use as PC
    * be IJ_1     IJ_2     1 1 3 00011110100100011111|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    1 1 3 00011110100111000001|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    2 0 6 00011010100110001000|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    3 5 3 00011010111011101001|        Read word is to be masked with ~3u
    * c2 DIVU_3   DIVU_2   7 0 5 01011110110011001010|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   1 e 5 01011110110010001010|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    4 4 3 00011110101011100001| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   1 0 3 00000010101001101111|        ~302
    * c6 IJT_4    ILL_2    9 5 3 00010110101101000111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   8 5 3 000xxx10100111001011|        Store pc to mepc.
    * c8 DIV_7    DIV_8    2 0 c 10010010110101100010|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   2 0 3 01001000110010100101|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   2 0 c 10010010110111000010|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc c f 3 00100010111011100110|        mtval = 0.
    * cc OR_0     OR_1     4 0 3 000111x01xxx00100110| OR     or
    * cd REM_0    DIV_1    7 e 3 10011110100110000010| REM    Branch on sign dividend RS1
    * ce ECALL_5  ECALL_6  1 0 5 11011000110010011010|        Q = 8
    * cf MRET_7   MRET_8   4 0 6 000010x01xxx01001111|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  1 0 5 01001010110000110111| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   4 4 3 00001010111011001001| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     7 c 8 00011010100100000110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 8 5 3 00111010111000011110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   3 f 5 01101010010010010010|        Store 5 to mcause
    * d5 eFetch2  Fetch    5 6 0 00xxxxxxxxxx11x1111x|  Fr00  Not in use
    * d6 eILL0c   ILLe     3 0 3 000xxxx00xxx11111110| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  8 5 3 00111010111010100001|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  4 5 3 00011010111000010011| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  4 0 3 100111x01xxx01000010|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   3 0 3 000110x01xxx10010001|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   3 5 5 01101010010010010010|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  4 5 3 00001010111001001001| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  8 5 3 00111010111011100101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   3 4 d 00001110111011110100|  Fr00  Read and latch instruction
    * df eFetch   Fetch2   3 7 b 00011110111011110100|  Fr00  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   3 5 3 00011110100011001010|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    1 0 3 00000010100100011101|        Q = RS1
    * e2 MUL_1    MUL_2    7 0 8 00011010110011101000|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   3 0 8 110111x01xxx00011010|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   2 0 3 00011110101000011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  1 0 5 11011000110010001110|        Q = 4
    * e6 StdIncPc Fetch    0 7 5 11110100010011011110|  Fr00  IncPC, OpFetch
    * e7 aFault   aFault_1 8 5 3 00111010111000011110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    2 0 3 10011010100111100010|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    2 0 3 01010000110011000110|        Construct Q = 3
    * ea MULHU_5  MULHU_6  2 0 3 00010010110000100010|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     2 0 3 00001110101001010110|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    4 0 3 000111x01xxx00010001| AND    And 
    * ed REMU_0   DIVU_1   6 0 3 100110x01xxx11100000| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     3 0 3 000xxxx00xxx11111110| Illegal instruction seen
    * ef WFI_5    Fetch    0 7 5 11110100010011011110|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    7 c 8 00011010100101110010|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 8 5 3 00111010111000011110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 0 3 000010x01xxx11100110|        Prepare read PC
    * f3 aF_SW    aF_SW_1  1 0 3 000xxxx00xxx11011101|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2            b 4 e 01111111110000000000|  Fr00  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 8 5 3 00111010111011011011|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    1 0 5 11000000110011111010| WFI    To check offset
    * f7 EBREAK_1 EBREAK_2 8 5 3 00101010111010101011| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  4 5 3 00011010111000010011| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   4 4 5 01011010110011011001|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    1 0 5 01011010110001000101|        Check offset
    * fb SB_3     SB_4     3 0 3 00000010111001101011|        Prepare get back address to use 
    * fc CSRRCI_0 CSRRW_1  4 5 3 00001010111001001001| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    3 0 3 000010x01xxx01111110| NMI    Get current PC
    * fe ILLe     ILL_1    3 0 3 000010x01xxx01000110| Illegal
    * ff QINT_0   QINT_1   3 0 3 000010x01xxx11000111| INT    Get current PC
    */
   localparam u0_0 = 256'haee6881088e2a904ab86ac5a688bac5a6b09aa078004ace688e66cbee9d26c01;
   localparam u0_1 = 256'haeb78cd4afe6e6a6a632abe6ac41ae136c7446de2916ac15e81400dea81ae88b;
   localparam u0_2 = 256'haee6aaf7a96a803e2c30ac96a821ac962c1da8278004e63588e6ac39a8e66c52;
   localparam u0_3 = 256'he13ae135a903ae49a632a93da9e6ae1329d7ed03e93661dea481ac86e82baee6;
   localparam u0_4 = 256'hace600fea9a38831a1b0ac662c4bac66e98f6947ac65ea2b20eaaca22c0b6c50;
   localparam u0_5 = 256'ha6dae970edfbae49a632e95dee9ce9ba288b2b57ae1ea9eba6dae954a6dae9e6;
   localparam u0_6 = 256'h2ccfea1aa9a38831297aa8f9a88ba9e6a693a1f288efea2bec58ecc8a9e6a88b;
   localparam u0_7 = 256'ha17d29906134ae49a63221f2aca82eaaa47da8778073e9f42976aa1aae1ea96e;
   localparam u0_8 = 256'haea98492e982c829ace6c81aaee6c09c217f0434e9f0ea21ac82a8a8a17d6c85;
   localparam u0_9 = 256'h21f2299f296029686434443400feae13a693e9bbcc946534e995613484922e34;
   localparam u0_A = 256'h2cc5803f88e0803fa99ac8c8ac9ba8782c2ee6d0acafe63aee42e9428cce6c5e;
   localparam u0_B = 256'he9c1e91f63deae49edb5a1b928c0ae130cbd00de2e9e00de00de44de00de8cb2;
   localparam u0_C = 256'h884f8c9ae982c8262ee62dc28ca52d6229cb6b472a6feae1ec8aeccaaee9a988;
   localparam u0_D = 256'heef4eef4aee5ae49a4928891c842ae13aea100fe00dea492ae1ea906aec9ac37;
   localparam u0_E = 256'h44de00fe88e0c811ea562c220cc6a9e2ae1e44de8c8eea1ac81aace8291de8ca;
   localparam u0_F = 256'h88c78846887eae492e6bac45acd9ae13aeab0cfaaedbfc0000dd88e6ae1ea972;
   localparam u1_0 = 256'h3330403140392031354024052030240520302030103033343030222511110005;
   localparam u1_1 = 256'h3531105d33301021104033303435453104470753206110542031560020312031;
   localparam u1_2 = 256'h3330446070314031305424752031247510344431103060013030108133300575;
   localparam u1_3 = 256'h6001600178814530104073813338453185607831733107338536353420313390;
   localparam u1_4 = 256'h1055303065314031aa3309451054094511319531105520311030708110540045;
   localparam u1_5 = 256'ha53311117d314530104075314531108d1031103185337c81a5331111a5333ba1;
   localparam u1_6 = 256'h105420306531403109333531103133308532b633306020311e55705533301031;
   localparam u1_7 = 256'h853385303f33453010402633105d353085551030303031b1c533203085337c81;
   localparam u1_8 = 256'h85333f367e394031335c308d33304e39c531435d111120311035443185310005;
   localparam u1_9 = 256'hb63199314e394e393f573f373030453185327531105d3f33853185313f5ecf32;
   localparam u1_A = 256'h10544031603940318531303910511e39103410412054600144392039105d0575;
   localparam u1_B = 256'h11311131073345307d3125312051453120355600303056005600075f5600105d;
   localparam u1_C = 256'h4060105d7e394031cf3220c9203420c985309531103044311e55705535312061;
   localparam u1_D = 256'h37b134d08533453035563031403945318533303056003f5685337c8144301054;
   localparam u1_E = 256'h075f30306039403120302031203520398533075f105d2031308d708110303531;
   localparam u1_F = 256'h303030303030453030301055445545318532105c8533b4e71030303085337c81;
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
   assign d[17] = indir[11];
   assign d[18] = indir[12];
   assign d[19] = indir[13];
   assign d[22] = indir[14];
   assign d[23] = indir[15];
   assign d[25] = indir[16];
   assign d[27] = indir[17];
   assign d[42] = indir[18];
   assign d[43] = indir[19];
   // replaces = 000000100100111000000000100001100011100000000
   SB_LUT4 #(.LUT_INIT(16'h0102)) cmb_d08(.O(d[8]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0220)) cmb_d09(.O(d[9]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h1020)) cmb_d10(.O(d[10]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0040)) cmb_d14(.O(d[14]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h2800)) cmb_d15(.O(d[15]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h7f7e)) cmb_d20(.O(d[20]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h4000)) cmb_d30(.O(d[30]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0094)) cmb_d31(.O(d[31]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d32(.O(d[32]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0802)) cmb_d35(.O(d[35]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0c00)) cmb_d38(.O(d[38]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   // replaces = 100101011011000110000000000000000000000000000
   SB_LUT4 #(.LUT_INIT(16'ha928)) cmb_d28(.O(d[28]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'ha0b0)) cmb_d29(.O(d[29]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0882)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h3100)) cmb_d34(.O(d[34]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h8004)) cmb_d36(.O(d[36]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h8400)) cmb_d37(.O(d[37]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h5207)) cmb_d39(.O(d[39]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d41(.O(d[41]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h4000)) cmb_d44(.O(d[44]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 000010000000000000101001000010000000000000000
   SB_LUT4 #(.LUT_INIT(16'h0e87)) cmb_d16(.O(d[16]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1f1f)) cmb_d21(.O(d[21]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1a55)) cmb_d24(.O(d[24]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h1f00)) cmb_d26(.O(d[26]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0201)) cmb_d40(.O(d[40]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[45] = 1'b0;
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
