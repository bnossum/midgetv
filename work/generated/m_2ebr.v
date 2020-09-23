/* -----------------------------------------------------------------------------
 * Part of midgetv
 * 2019. Copyright B. Nossum.
 * For licence, see LICENCE
 * -----------------------------------------------------------------------------
 * Automatically generated from ../code/ucode.h by ../util/midgetv_indirectEBR.c.
 * Do not edit
 */
/* Using LUTSIZE=4. Using 2 EBRs. Initial table has  46 columns
 * Removed:  0000000000000000000000000000000000000000000000 These are treated already, removed from consideration
 * Reserved: 0000000000000000000000000000000000010000000000 Columns to be represented directly, not part of optimalization
 * Total columns to represent in EBRs: 46
 * 204 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 204 203 204 202 200 203 204 204 204 204   x 204 204 204 203 203 204 203 204 204 204 204 204 204 204 204 204 204 204 204 204 204 204 204 204 203 204 203 203 203 204 203 204 203 202 203  kill col  4  Tbl  44 cols 0000000000000000000000000000000000010000010000 has 200 unique lines.
 * 200 199 200 198     198 200 200 200 200   x 200 200 200 197 199 200 198 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 200 199 199 200 199 199 199 200 199 200 199 198 199  kill col 14  Tbl  43 cols 0000000000000000000000000000000100010000010000 has 197 unique lines.
 * 197 196 197 195     195 197 197 197 197   x 197 197 197     196 196 196 197 197 197 197 197 197 197 197 197 197 197 197 197 197 197 197 196 196 197 196 195 196 197 196 197 195 194 196  kill col 44  Tbl  42 cols 0100000000000000000000000000000100010000010000 has 194 unique lines.
 * 194 193 194 192     192 194 194 194 194   x 194 194 194     193 193 193 194 194 194 194 194 194 194 194 194 194 194 194 194 194 194 194 193 193 194 193 192 193 193 193 194 192     193  kill col 43  Tbl  41 cols 0110000000000000000000000000000100010000010000 has 192 unique lines.
 * 192 191 192 190     190 192 192 192 192   x 192 192 192     191 191 191 192 192 192 190 192 192 192 192 192 192 192 192 192 192 192 192 191 191 192 191 189 190 189 190 192         187  kill col 45  Tbl  40 cols 1110000000000000000000000000000100010000010000 has 187 unique lines.
 * 187 186 187 185     185 187 186 187 187   x 187 187 187     186 184 186 187 187 186 185 187 187 187 187 187 187 187 187 187 187 187 187 186 186 187 186 184 184 182 182 186              kill col 41  Tbl  39 cols 1110100000000000000000000000000100010000010000 has 182 unique lines.
 * 182 181 182 180     180 181 181 182 182   x 182 182 182     181 179 181 182 182 181 180 182 182 182 182 182 182 182 182 182 182 182 182 181 181 182 181 178 178 175     178              kill col 40  Tbl  38 cols 1110110000000000000000000000000100010000010000 has 175 unique lines.
 * 175 174 175 173     173 173 174 175 175   x 175 175 174     173 170 172 175 175 174 172 175 174 175 175 175 175 175 175 175 175 175 175 174 173 174 174 168 166         169              kill col 39  Tbl  37 cols 1110111000000000000000000000000100010000010000 has 166 unique lines.
 * 166 165 166 163     163 164 165 166 164   x 164 166 163     164 160 161 166 166 165 163 166 165 166 166 166 166 166 166 166 166 166 166 165 162 165 165 153             155              kill col 38  Tbl  36 cols 1110111100000000000000000000000100010000010000 has 153 unique lines.
 * 152 152 153 149     149 149 152 152 151   x 151 153 150     150 147 147 153 153 152 149 153 152 153 153 153 153 153 153 153 153 153 153 152 149 152 152                 133              kill col 42  Tbl  35 cols 1111111100000000000000000000000100010000010000 has 133 unique lines.
 * 132 132 133 127     129 129 132 131 130   x 131 133 130     129 125 126 133 133 132 129 133 132 132 133 132 133 133 133 133 133 133 133 132 128 132 132                                  kill col 16  Tbl  34 cols 1111111100000000000000000000010100010000010000 has 125 unique lines.
 * 124 124 125 120     120 121 124 122 122   x 123 125 121     118     117 125 125 123 120 125 124 124 124 124 125 125 124 125 125 125 125 123 121 124 124                                  kill col 17  Tbl  33 cols 1111111100000000000000000000110100010000010000 has 117 unique lines.
 * 116 116 117 112     111 112 116 112 112   x 114 117 112     105         116 117 114 111 117 116 116 116 116 117 117 116 117 117 117 117 113 112 116 116                                  kill col 15  Tbl  32 cols 1111111100000000000000000000111100010000010000 has 105 unique lines.
 * 103 104 105 101      99 101 104 100 100   x 102 105 100                 103 104 102  99 105 103 104 104 104 105 105 104 105 105 105 104 101 100 104 104                                  kill col 21  Tbl  31 cols 1111111100000000000000001000111100010000010000 has  99 unique lines.
 *  97  98  99  96      94  95  98  94  94   x  96  99  94                  97  98  96      99  97  98  98  98  99  99  98  99  96  99  98  96  94  98  98                                  kill col 35  Tbl  30 cols 1111111100100000000000001000111100010000010000 has  94 unique lines.
 *  92  93  94  91      89  90  93  89  89   x  90  94  89                  92  93  90      94  92  93  93  93  94  94  93  94  91  94  93  91      90  93                                  kill col 13  Tbl  29 cols 1111111100100000000000001000111110010000010000 has  89 unique lines.
 *  87  88  89  85      84  85  88  83  83   x  85  89                      87  88  85      89  87  88  88  88  89  89  88  89  86  89  88  86      85  88                                  kill col  9  Tbl  28 cols 1111111100100000000000001000111110011000010000 has  83 unique lines.
 *  81  82  83  79      79  79  82  77       x  79  82                      81  81  79      83  81  82  82  82  83  83  82  83  80  83  82  80      79  82                                  kill col  8  Tbl  27 cols 1111111100100000000000001000111110011100010000 has  77 unique lines.
 *  75  76  77  73      73  73  76           x  72  74                      75  75  72      76  75  76  76  75  77  77  76  77  72  76  76  74      73  76                                  kill col 31  Tbl  26 cols 1111111100100010000000001000111110011100010000 has  72 unique lines.
 *  70  71  72  67      69  68  71           x  66  68                      69  69  65      71  70  71  71  70  72  72  71  72      70  71  69      68  71                                  kill col 20  Tbl  25 cols 1111111100100010000000001100111110011100010000 has  65 unique lines.
 *  63  64  64  61      63  61  64           x  59  61                      62  62          64  62  64  64  63  65  65  64  64      62  63  61      61  63                                  kill col 11  Tbl  24 cols 1111111100100010000000001100111110111100010000 has  59 unique lines.
 *  57  58  58  53      56  56  58           x      55                      56  56          58  56  58  58  57  59  59  58  58      56  57  55      56  57                                  kill col  3  Tbl  23 cols 1111111100100010000000001100111110111100011000 has  53 unique lines.
 *  51  52  52          49  51  52           x      50                      49  50          52  50  52  52  51  53  53  52  52      50  51  48      51  51                                  kill col 34  Tbl  22 cols 1111111100110010000000001100111110111100011000 has  48 unique lines.
 *  46  46  46          42  46  47           x      45                      44  45          47  45  47  47  46  48  47  47  47      44  46          46  46                                  kill col  5  Tbl  21 cols 1111111100110010000000001100111110111100111000 has  42 unique lines.
 *  40  40  40              40  41           x      40                      38  39          41  39  41  41  40  42  40  41  41      38  40          40  40                                  kill col 32  Tbl  20 cols 1111111100110110000000001100111110111100111000 has  38 unique lines.
 *  36  36  36              36  37           x      36                      34  34          37  36  37  35  36  38  36  37  37          35          36  36                                  kill col 19  Tbl  19 cols 1111111100110110000000001110111110111100111000 has  34 unique lines.
 *  32  32  32              32  33           x      32                      30              33  32  33  31  32  34  32  33  33          31          32  32                                  kill col 18  Tbl  18 cols 1111111100110110000000001111111110111100111000 has  30 unique lines.
 *  28  28  28              29  29           x      28                                      28  28  29  27  28  30  28  29  29          28          28  28                                  kill col 25  Tbl  17 cols 1111111100110110000010001111111110111100111000 has  27 unique lines.
 *  25  25  25              26  26           x      25                                      25  25  26      25  26  25  26  26          25          25  26                                  kill col 36  Tbl  16 cols 1111111101110110000010001111111110111100111000 has  25 unique lines.
 *  23  23  23              24  24           x      23                                      23  23  24      23  24  23  24  24          23              24                                  kill col 33  Tbl  15 cols 1111111101111110000010001111111110111100111000 has  23 unique lines.
 *  21  21  21              22  22           x      21                                      21  21  22      21  22  21  22  22                          22                                  kill col 28  Tbl  14 cols 1111111101111110010010001111111110111100111000 has  21 unique lines.
 *  19  19  19              20  20           x      19                                      19  19  20      19  20      19  20                          20                                  kill col 29  Tbl  13 cols 1111111101111110110010001111111110111100111000 has  19 unique lines.
 *  17  17  17              18  18           x      17                                      17  17  18      17  18          18                          18                                  kill col 26  Tbl  12 cols 1111111101111110110110001111111110111100111000 has  17 unique lines.
 *  16  15  15              16  16           x      15                                      15  15  16          16          16                          16                                  kill col 23  Tbl  11 cols 1111111101111110110110101111111110111100111000 has  15 unique lines.
 *
 * Round 1: 0000000010000001001001010000000001000011000111  4 columns for indexes to table representing 11 original columns (uses 15 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 39
 * 202 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x   x   x 200 198 201   x   x 202 202   x 200   x 202 201 201 202 201 202 202 202 202   x 202   x 202 202   x 202 202   x 202 202 202 202 199 202   x 201 201 202 201 202 201 200 201  kill col  4  Tbl  33 cols 0000000010000001001001010000000001010011010111 has 198 unique lines.
 *   x   x   x 196     196   x   x 198 198   x 196   x 198 195 197 198 196 198 198 198 198   x 198   x 198 198   x 198 198   x 198 198 198 197 195 198   x 197 197 198 197 198 197 196 197  kill col 35  Tbl  32 cols 0000000010100001001001010000000001010011010111 has 195 unique lines.
 *   x   x   x 193     193   x   x 195 195   x 192   x 195 192 194 195 193 195 195 195 195   x 195   x 195 195   x 195 195   x 195 195 195 194     195   x 194 194 195 194 195 194 193 194  kill col 14  Tbl  31 cols 0000000010100001001001010000000101010011010111 has 192 unique lines.
 *   x   x   x 190     189   x   x 192 192   x 189   x 192     191 191 191 192 192 192 192   x 192   x 192 192   x 192 192   x 192 192 192 191     192   x 190 191 192 191 192 190 189 191  kill col 44  Tbl  30 cols 0100000010100001001001010000000101010011010111 has 189 unique lines.
 *   x   x   x 186     186   x   x 189 189   x 186   x 189     188 188 188 189 189 189 189   x 189   x 189 189   x 189 189   x 189 189 189 188     189   x 187 188 188 188 189 187     188  kill col 11  Tbl  29 cols 0100000010100001001001010000000101110011010111 has 186 unique lines.
 *   x   x   x 183     183   x   x 186 186   x       x 186     185 185 185 186 186 186 186   x 186   x 186 186   x 186 186   x 186 186 186 185     186   x 184 184 185 185 186 184     185  kill col  5  Tbl  28 cols 0100000010100001001001010000000101110011110111 has 183 unique lines.
 *   x   x   x 178           x   x 183 183   x       x 183     182 182 182 183 183 183 183   x 183   x 183 183   x 183 183   x 183 183 183 182     183   x 181 181 182 182 182 181     182  kill col  3  Tbl  27 cols 0100000010100001001001010000000101110011111111 has 178 unique lines.
 *   x   x   x               x   x 176 178   x       x 178     177 177 177 178 178 178 178   x 178   x 178 178   x 178 178   x 178 178 178 173     178   x 175 175 177 176 175 176     177  kill col 34  Tbl  26 cols 0100000010110001001001010000000101110011111111 has 173 unique lines.
 *   x   x   x               x   x 171 173   x       x 172     172 172 172 173 173 173 173   x 173   x 173 173   x 173 173   x 173 173 173         173   x 169 170 171 171 170 169     172  kill col 43  Tbl  25 cols 0110000010110001001001010000000101110011111111 has 169 unique lines.
 *   x   x   x               x   x 165 168   x       x 166     166 166 168 168 168 169 167   x 169   x 168 169   x 169 169   x 169 169 169         168   x 162 165 162 162 165         162  kill col 45  Tbl  24 cols 1110000010110001001001010000000101110011111111 has 162 unique lines.
 *   x   x   x               x   x 157 160   x       x 159     159 153 161 161 161 161 160   x 162   x 160 162   x 162 162   x 162 162 162         161   x 155 156 154 151 157              kill col 41  Tbl  23 cols 1110100010110001001001010000000101110011111111 has 151 unique lines.
 *   x   x   x               x   x 143 148   x       x 147     147 142 148 150 150 149 149   x 151   x 149 150   x 151 151   x 151 151 151         149   x 143 141 140     140              kill col 42  Tbl  22 cols 1111100010110001001001010000000101110011111111 has 140 unique lines.
 *   x   x   x               x   x 129 135   x       x 134     135 128 134 139 138 138 138   x 140   x 136 136   x 140 140   x 140 139 140         137   x 122 122 123                      kill col 39  Tbl  21 cols 1111101010110001001001010000000101110011111111 has 122 unique lines.
 *   x   x   x               x   x 109 115   x       x 116     116 111 113 119 120 119 120   x 122   x 118 118   x 122 122   x 122 121 122         119   x  99      99                      kill col 40  Tbl  20 cols 1111111010110001001001010000000101110011111111 has  99 unique lines.
 *   x   x   x               x   x  88  92   x       x  92      92  88  87  95  96  95  95   x  98   x  96  94   x  99  99   x  99  98  99          96   x  75                              kill col 38  Tbl  19 cols 1111111110110001001001010000000101110011111111 has  75 unique lines.
 *   x   x   x               x   x  67  70   x       x  70      69  66  65  71  73  72  72   x  73   x  72  72   x  75  75   x  75  74  75          72   x                                  kill col 17  Tbl  18 cols 1111111110110001001001010000100101110011111111 has  65 unique lines.
 *   x   x   x               x   x  58  59   x       x  60      59  60      61  63  63  62   x  63   x  61  62   x  65  65   x  65  64  65          62   x                                  kill col  8  Tbl  17 cols 1111111110110001001001010000100101110111111111 has  58 unique lines.
 *   x   x   x               x   x      52   x       x  51      53  52      54  56  56  55   x  56   x  55  55   x  58  58   x  58  57  58          54   x                                  kill col 13  Tbl  16 cols 1111111110110001001001010000100111110111111111 has  51 unique lines.
 *   x   x   x               x   x      46   x       x          46  47      47  49  49  49   x  49   x  48  48   x  51  51   x  50  50  51          48   x                                  kill col 15  Tbl  15 cols 1111111110110001001001010000101111110111111111 has  46 unique lines.
 *   x   x   x               x   x      40   x       x              40      42  42  43  43   x  43   x  43  43   x  46  46   x  45  45  45          43   x                                  kill col 16  Tbl  14 cols 1111111110110001001001010000111111110111111111 has  40 unique lines.
 *   x   x   x               x   x      34   x       x                      34  34  36  37   x  37   x  37  37   x  40  39   x  39  38  39          38   x                                  kill col 19  Tbl  13 cols 1111111110110001001001010010111111110111111111 has  34 unique lines.
 *   x   x   x               x   x      29   x       x                      29      31  31   x  30   x  31  31   x  34  33   x  33  32  32          32   x                                  kill col 18  Tbl  12 cols 1111111110110001001001010011111111110111111111 has  29 unique lines.
 *   x   x   x               x   x      24   x       x                              27  26   x  24   x  26  26   x  29  28   x  28  27  27          27   x                                  kill col 23  Tbl  11 cols 1111111110110001001001110011111111110111111111 has  24 unique lines.
 *   x   x   x               x   x      19   x       x                              22  21   x       x  21  21   x  23  23   x  23  22  23          22   x                                  kill col  9  Tbl  10 cols 1111111110110001001001110011111111111111111111 has  19 unique lines.
 *   x   x   x               x   x           x       x                              17  16   x       x  16  16   x  18  18   x  18  16  18          18   x                                  kill col 32  Tbl   9 cols 1111111110110101001001110011111111111111111111 has  16 unique lines.
 *
 * Round 2: 0000000001001010110110001100000000000000000000  4 columns for indexes to table representing  9 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 34
 * 201 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x   x   x 199 197 200   x   x 201 201   x 198   x 201 200 200 201 199 201 201   x   x   x 201   x   x   x   x   x   x   x   x 201   x 201 198   x   x 200 199 201 200 200 200 199 199  kill col  4  Tbl  24 cols 0000000011001011111111011100000001010011010111 has 197 unique lines.
 *   x   x   x 195     195   x   x 197 197   x 194   x 197 194 196 197 194 197 197   x   x   x 197   x   x   x   x   x   x   x   x 197   x 196 194   x   x 196 195 197 196 196 196 195 195  kill col 35  Tbl  23 cols 0000000011101011111111011100000001010011010111 has 194 unique lines.
 *   x   x   x 192     192   x   x 194 194   x 190   x 194 191 193 194 191 194 194   x   x   x 194   x   x   x   x   x   x   x   x 194   x 193       x   x 193 192 194 193 193 193 192 192  kill col 11  Tbl  22 cols 0000000011101011111111011100000001110011010111 has 190 unique lines.
 *   x   x   x 188     187   x   x 190 190   x       x 190 187 189 190 187 190 190   x   x   x 190   x   x   x   x   x   x   x   x 190   x 189       x   x 189 186 190 189 189 189 188 188  kill col 39  Tbl  21 cols 0000001011101011111111011100000001110011010111 has 186 unique lines.
 *   x   x   x 184     183   x   x 185 186   x       x 185 183 185 186 183 186 186   x   x   x 186   x   x   x   x   x   x   x   x 186   x 185       x   x 185     186 182 185 184 184 183  kill col 41  Tbl  20 cols 0000101011101011111111011100000001110011010111 has 182 unique lines.
 *   x   x   x 180     179   x   x 180 182   x       x 181 178 181 182 178 182 182   x   x   x 182   x   x   x   x   x   x   x   x 182   x 181       x   x 178     179     178 177 179 179  kill col 43  Tbl  19 cols 0010101011101011111111011100000001110011010111 has 177 unique lines.
 *   x   x   x 175     173   x   x 175 177   x       x 175 172 175 177 173 177 177   x   x   x 177   x   x   x   x   x   x   x   x 177   x 176       x   x 170     173     171     169 170  kill col 44  Tbl  18 cols 0110101011101011111111011100000001110011010111 has 169 unique lines.
 *   x   x   x 166     165   x   x 165 169   x       x 163 161 167 166 162 169 169   x   x   x 169   x   x   x   x   x   x   x   x 169   x 167       x   x 158     160     162         159  kill col 38  Tbl  17 cols 0110101111101011111111011100000001110011010111 has 158 unique lines.
 *   x   x   x 154     152   x   x 151 157   x       x 152 146 156 152 151 158 158   x   x   x 158   x   x   x   x   x   x   x   x 158   x 156       x   x         143     142         145  kill col 42  Tbl  16 cols 0111101111101011111111011100000001110011010111 has 142 unique lines.
 *   x   x   x 136     135   x   x 133 138   x       x 137 128 139 133 132 141 142   x   x   x 141   x   x   x   x   x   x   x   x 142   x 139       x   x         121                 120  kill col 45  Tbl  15 cols 1111101111101011111111011100000001110011010111 has 120 unique lines.
 *   x   x   x 112     109   x   x 108 115   x       x 114 104 115 108 110 119 120   x   x   x 118   x   x   x   x   x   x   x   x 118   x 113       x   x          96                      kill col 40  Tbl  14 cols 1111111111101011111111011100000001110011010111 has  96 unique lines.
 *   x   x   x  86      85   x   x  85  91   x       x  91  83  89  83  83  95  95   x   x   x  94   x   x   x   x   x   x   x   x  94   x  88       x   x                                  kill col 17  Tbl  13 cols 1111111111101011111111011100100001110011010111 has  83 unique lines.
 *   x   x   x  74      74   x   x  73  78   x       x  78  70  74  72      81  82   x   x   x  81   x   x   x   x   x   x   x   x  81   x  76       x   x                                  kill col 14  Tbl  12 cols 1111111111101011111111011100100101110011010111 has  70 unique lines.
 *   x   x   x  61      61   x   x  60  63   x       x  65      58  60      68  69   x   x   x  67   x   x   x   x   x   x   x   x  66   x  62       x   x                                  kill col 15  Tbl  11 cols 1111111111101011111111011100101101110011010111 has  58 unique lines.
 *   x   x   x  50      49   x   x  48  48   x       x  52          47      54  55   x   x   x  55   x   x   x   x   x   x   x   x  55   x  50       x   x                                  kill col 16  Tbl  10 cols 1111111111101011111111011100111101110011010111 has  47 unique lines.
 *   x   x   x  39      39   x   x  37  37   x       x  40                  43  43   x   x   x  44   x   x   x   x   x   x   x   x  44   x  41       x   x                                  kill col  9  Tbl   9 cols 1111111111101011111111011100111101111011010111 has  37 unique lines.
 *   x   x   x  31      30   x   x  27       x       x  30                  32  31   x   x   x  34   x   x   x   x   x   x   x   x  33   x  29       x   x                                  kill col  8  Tbl   8 cols 1111111111101011111111011100111101111111010111 has  27 unique lines.
 *   x   x   x  22      21   x   x           x       x  22                  23  21   x   x   x  24   x   x   x   x   x   x   x   x  22   x  21       x   x                                  kill col 34  Tbl   7 cols 1111111111111011111111011100111101111111010111 has  21 unique lines.
 *   x   x   x  16      16   x   x           x       x  17                  17  15   x   x   x  19   x   x   x   x   x   x   x   x  16   x           x   x                                  kill col 19  Tbl   6 cols 1111111111111011111111011110111101111111010111 has  15 unique lines.
 *
 * Round 3: 0000000000000100000000100001000010000000101000  4 columns for indexes to table representing  6 original columns (uses 15 of 16 lines in indirect table).
 * Direct:  1111111100110000000000000010111100111100010000 20 columns
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
    * 00 LB_0     LB_1     0 0 0 00000001010110110110| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 1 11010010000101110110|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 2 10111110010110110110| IJ     Jump to mem[(rs1+ofs)&~1u]. inCSR=0
    * 03 FENCE    StdIncPc 3 0 2 111001100000010x010x| f      Prepare read PC (FENCE)
    * 04 ADDI_0   StdIncPc 4 3 2 11100110010001010100| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L05     ADDI_0   3 0 2 000001000000000x001x| AUIPC  q = imm20+2 or imm20+4  (copy x/8)
    * 06 LB_3     LB_4     3 0 2 00000111000011010111|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     1 0 2 00001001000010110111|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L08     SB_1     4 4 0 01011010010111010110| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     3 0 2 10100011000010110110|        q = D^0xffffffff^q = D^0x80
    * 0a _L0a     SB_1     4 4 0 01011010010111010110| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    1 5 2 10000110000001010101|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   1 0 2 00000100000111010110| ADD    add     Addition Q = RS1
    * 0d MUL_0    MUL_1    3 0 2 111000101001110x010x| MUL    Store rs1 tp rM. Next read rs2. Q clear
    * 0e SUB_0    SUB_1    3 0 2 000100000001110x010x| SUB    Subtraction
    * 0f _L0f     StdIncPc 4 3 2 11100110000001010101| LUI    q = imm20
    * 10 SUB_1    LB_6     3 0 2 10100011000111110110|        Q = ~RS2
    * 11 AND_1    ANDI_1   3 0 2 00011010000111010110|        RS1^0xffffffff to Q
    * 12 eFetch3  unalignd 5 4 3 01110100010111110110|  Fr11  Write minstret. Update I. Q=immediate, use dinx
    * 13 condb_2  condb_3  3 0 2 00010100000111110110|        ~RS2 in Q
    * 14 condb_3  condb_4  4 0 4 00010101010110010110|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  1 0 5 00010110000000010110|        Branch on condition
    * 16 condb_5  StdIncPc 3 0 2 111001100000010x010x|        Branch not taken.
    * 17 condb_5t Fetch    0 6 2 11011110011110110010|        Branch taken.
    * 18 BEQ      condb_2  4 5 2 00010011000111010101| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   4 4 2 01000001010101010100| JALR   jj=RS1+imm
    * 1a ANDI_1   StdIncPc 1 3 2 11100110000001010101|        rd = Iimm & RS1
    * 1b _L1b     JAL_1    4 0 2 00110010000000010011| JAL    J-imm is in q.
    * 1c ECAL_BRK ECAL_RET 2 0 2 10100110000101110011| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 6 3 2 11100110000001010101|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 4 0 4 11010100110101000110|        Q = 4
    * 1f IJ_2     IJ_3     4 5 2 10110111000101010101|        Read word is to be masked with lsb = 0
    * 20 LH_0     LH_1     7 5 0 01010010010110110110| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 3 3 2 11100110000001010100|        rd = Iimm ^ RS1
    * 22 MULHU_6  MULHU_7  4 0 6 00111001000101010110|        Q <= rM[0] ? Q+Ryy : Q. Prepare last shr/sar
    * 23 FENCEI   StdIncPc 3 0 2 111001100000010x010x| f      Prepare read PC (FENCE)
    * 24 SLLI_0   SLLI_1   8 0 0 001101010001111100x1| SLLI   Shift left immediate.
    * 25 _L25     ADDI_0   3 0 2 000001000000000x001x| AUIPC  q = imm20+2 or imm20+4  (copy x/8)
    * 26 OR_1     OR_2     3 4 2 00100111000111010100|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    4 0 2 00011101010000010110|        Q = rs2
    * 28 _L28     SH_1     2 4 0 10010110010111010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   3 0 2 00100001000111010110|        Q = RS1^0xFFFFFFFF
    * 2a _L2a     SH_1     2 4 0 10010110010111010110| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  4 0 4 00110000010xxxx10100|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    3 0 2 001111100001110x00xx| SLL    Shift left
    * 2d MULH_0   MULH_1   9 0 2 11111011000101010110| MULH   Store rs1 to Q. Prep read 0, shcnt--
    * 2e EBRKWFI2 EBREAK_1 3 4 5 11110111000011010101| EBREAK/WFI2 Select EBREAK or WFI
    * 2f _L2f     StdIncPc 4 3 2 11100110000001010101| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 4 3 7 11100110000001010101|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  3 0 2 00101011000111110110|        ~rs2 to Q
    * 32 JAL_1    JAL_2    4 5 2 10000110010001010100|        Target adr to yy
    * 33 JAERR_1  Fetch    a 7 0 1101111000xxxxxxxxxx|        Not in use
    * 34 JAL_3    Fetch    b 6 2 11011110001110110010|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   9 3 2 00110110000101110110|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   FENCE    c 8 2 00000011000101110110|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  d 5 5 11010111000xxxx10100|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  4 5 2 00010011000111010101| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  StdIncPc 1 3 2 11100110100001010100|        Last shift.
    * 3a SRxI_1   SRxI_2   9 3 6 00111101000101010110|        Register to shift to Q
    * 3b _L3b     JAL_1    4 0 2 00110010000000010011| JAL    J-imm is in q.
    * 3c CSRRW_0  CSRRW_1  4 5 2 01001001000011010101| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   FENCE    9 8 6 00000011000101010110|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   9 0 0 001101010001111100x0|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   9 0 0 001110100001111100x0|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     7 0 8 01010000010110110110| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   4 0 4 00001011010000010110|        Q=1
    * 42 MULHU_2  MULHU_3  8 0 6 10111011000101010110|        Q <= rM[0] ? Q+rs1 : Q. Prepare shr/sar
    * 43 MULHU_4  MULHU_5  3 0 2 11101010000000010010|        Prepare read Rjj.
    * 44 SLTI_0   SLTIX_1  3 0 2 00101011000111110111| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    4 0 4 01100101010101010110|        More check offset
    * 46 ILL_1    ILL_2    e 5 2 01000111000110110110|        Store PC to mepc and Q for read of instr
    * 47 ILL_2    ILL_3    1 1 2 10001111000101110110|        Read until Q is offending instruction
    * 48 _L48     SW_1     7 9 8 01100110010111010110| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  4 0 4 01001011010000010110|        Construct PC storage adr
    * 4a _L4a     SW_1     7 9 8 01100110010111010110| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  d a 2 10110000001101010010|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   3 0 2 001100010001110x010x| SLT    Set less than (signed)
    * 4d MULHSU_0 MULHU_1  9 5 2 10011011000111010100| MULHSU Signed rs1 to Ryy, nxt rd rs2. Q=0, shcnt--
    * 4e eILL0b   ILLe     3 0 2 11111110000xxxxx00xx| Illegal instruction seen
    * 4f MRET_8   StdIncPc 4 0 4 11100110010101010110|        Prep +4
    * 50 LW_1     StdIncPc 1 b 9 11100110000101110100|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   5 5 2 11011010001101010011|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 1 01010100000101110110|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   5 5 2 11011010001101010011|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     9 c 6 11101011000101010110|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 5 5 2 00011110001101010101|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 0 2 01010111000100010111|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     3 0 2 10100011000100010110|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    DIV_C    1 0 6 10111010110101110110|        Transfer rM to rDee
    * 59 DIV_B    DIV_10   4 5 2 10011100000111110101|        REM = Q to yy
    * 5a SB_1     SB_2     9 5 2 01011101000101110110|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L5b     JAL_1    4 0 2 00110010000000010011| JAL    J-imm is in q.
    * 5c CSRRS_0  CSRRW_1  4 5 2 01001001000011010101| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     c d 2 01101010000101110110|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 1 01110000000101110110|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   5 5 2 11011010001101010011|  err   LD AlignFault. Faulting adr to mtval
    * 60 DIV_14   LB_6     3 0 2 10100011000101010110|        RS2 < 0, RS1 >= 0, change sign yy
    * 61 DIV_15   StdIncPc 1 3 2 11100110000001010100|        RS2 < 0, RS1 < 0, yy is true result
    * 62 DIV_8    DIV_7    8 0 4 11001000010101110110|        Conditionally subtract rs2. Update M[0]
    * 63 DIV_9    DIV_A    4 e 4 01011000010101110110|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * 64 SLTIU_0  SLTIX_1  3 0 2 00101011000111110111| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    3 0 5 111011110000010x010x|        Prepare read PC
    * 66 SW_1     SW_2     d 7 2 11110010001111010010|        Write d to a+k until accepted
    * 67 SWE      SW_E2    5 5 2 100100110010010100x1|        Store faulting address alignment to mtval
    * 68 DIV_12   StdIncPc 1 3 2 11100110000001010100|        RS2 > 0, RS1 >= 0, yy is true result
    * 69 DIV_13   LB_6     3 0 2 10100011000101010110|        RS2 > 0, RS1 < 0, change sign yy
    * 6a SB_3     SB_4     4 0 2 01101011000000010101|        Prepare get back address to use 
    * 6b SB_4     SB_5     b 9 2 01111010001110010110|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   3 0 2 001100010001110x010x| SLTU   Set less than (unsigned)
    * 6d MULHU_0  MULHU_1  9 5 2 10011011000111010100| MULHU  Store rs1 to Ryy. Next read rs2. Q=0, shcnt--
    * 6e LHU_3    ANDI_1   3 0 2 00011010000011110111|        Invert q. Prepare read mask
    * 6f MRET_6   MRET_7   4 0 4 11001111010xxxx10110|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    9 c 6 01101110000101010110|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 5 5 2 00011110001101010101|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   3 0 2 00011010000011010111|        Invert q. Prepare read mask
    * 73 BAERR_1  Fetch    a 7 0 1101111000xxxxxxxxxx|       not used
    * 74 unalignd straddle 4 0 2 01110101000001010101|  Fr10u Unaligned pc, prep read high hword
    * 75 straddle Fetchu   0 6 a 01110110111110100010|  Fr10u IncPC, OpFetch
    * 76 Fetchu   Fetch2u  4 0 b 11010101000001110101|  Fr10u Read and latch instruction
    * 77 eFetchu  Fetch2u  4 1 c 11010101000101110101|  Fr10u rep Read until d=mem[(rs1+ofs) & ~3u]
    * 78 DIV_4    DIV_6    4 5 2 10101001000000010101|        ~abs(divisor) to yy
    * 79 DIV_5    DIV_3    4 0 4 10101000110101010110|        Kluge to let add1 work in DIV instr
    * 7a SB_5     SW_2     1 7 2 11110010001110010010|        Write d to a+k until accepted
    * 7b _L7b     JAL_1    4 0 2 00110010000000010011| JAL    J-imm is in q.
    * 7c CSRRC_0  CSRRW_1  4 5 2 01001001000011010101| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  Fetch    a 7 0 1101111000xxxxxxxxxx|       not used
    * 7e NMI_1    NMI_2    d 5 2 10010000000xxxx10100|        Store pc to mepc.
    * 7f JALRE2   Fetch    a 7 0 1101111000xxxxxxxxxx|        Not in use
    * 80 LBU_0    LBU_1    0 0 0 10000101010110110110| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  Fetch    a 7 0 1101111000xxxxxxxxxx|        Not in use
    * 82 DIV_1    DIV_3    3 4 2 10101000000111010100|        jj=abs(RS1). Next handle divisor
    * 83 DIV_2    DIV_1    4 0 2 10000010010101010110|        Dividend negative, make RS1-1
    * 84 XORI_0   XORI_1   3 0 2 00100001000111110111| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 1 11110000000101110110|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_3    4 3 a 001101001101100000x0|        Return address to TRG
    * 87 JALRE1   Fetch    a 7 0 1101111000xxxxxxxxxx|        Not in use
    * 88 DIV_E    DIV_10   3 e 2 100111001001111x00xx|        RS2 != 0. Check signs
    * 89 DIV_F    StdIncPc 4 3 2 11100110000001010101|        RS2 == 0, return 0xffffffff
    * 8a ILL_4    ILL_5    4 0 4 10001011010101010110|        Q = 1
    * 8b ILL_5    JAL_3    4 f 4 001101000111001100x0|        Store 2 to mcause
    * 8c XOR_0    XOR_1    3 0 2 001010010001111x010x| XOR    xor
    * 8d DIV_0    DIV_1    9 e 2 10000010100101110110| DIV    Branch on sign dividend RS1
    * 8e aF_SW_3  LDAF_3   4 f 2 100100100110010000x0|        Store 7 to mcause
    * 8f ILL_3    ILL_4    5 5 2 10001010001101010101|        Store illegal instruction to mtval
    * 90 NMI_2    JAL_3    5 f 2 00110100001010010101|        mtval = 0.
    * 91 LDAF_2   LDAF_3   4 f 4 100100101110010000x0|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    d 5 2 001101000001001100x0|        PC to mepc
    * 93 SW_E2    SW_E3    d 5 2 10010101000101110100|        Store address that faulted
    * 94 SW_E4    JAL_3    6 f 2 001101000011001100x0|        Store 6 to mcause
    * 95 SW_E3    SW_E4    4 0 4 10010100110101100110|        Q = 3
    * 96 SH_1     SH_2     9 5 2 10011010000101110110|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SWH      SW_E2    5 5 2 100100110010010100x1|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  4 5 2 00010011000111010101| BLT    Conditional Branch. Offset to Ryy
    * 99 _L99     ILLe     3 0 2 11111110000xxxxx00xx| Illegal instruction seen
    * 9a SH_2     SH_3     c d 2 10110101000101110110|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * 9b MULHU_1  MULHU_2  4 4 2 01000010100111110101|        rM<=RS2,  Rjj<=Q=0. next read RS1. 
    * 9c DIV_10   DIV_12   1 e 2 01101000100110010100|        RS2 > 0. Branch on sign of RS1
    * 9d DIV_11   DIV_14   1 e 2 01100000100110010100|        RS2 < 0. Branch on sign of RS1
    * 9e SH_4     SH_5     e 9 2 10011111000110010110|        Address back to Q. Prepare get item to write
    * 9f SH_5     SW_2     d 7 2 11110010000110010010|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    7 5 0 01011110010110110110| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm.
    * a1 ECALL_4  ECALL_5  4 0 4 11001110110101000110|        Q = 4
    * a2 DIVU_5   ANDI_1   3 0 6 000110101101011x010x|        Transfer rM to rDee
    * a3 LB_6     StdIncPc 4 3 4 11100110110001010100|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * a4 SRxI_0   SRxI_1   8 0 0 001110100001111100x1| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   4 0 4 10101111010011010110|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  2 0 8 11010000000101110011| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 4 0 2 00101110010xxxx10110| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    DIV_4    3 e 2 01111000100101010110|        Branch on sign divisor RS2
    * a9 DIV_6    DIV_7    3 0 2 110010001001011x010x|        Write M. Prepare shift
    * aa ECALL_6  JAL_3    4 f 2 001101000111001000x0|        mcause = 11
    * ab EBREAK_2 ECALL_6  d 5 2 10101010000101010100|        pc to mepc
    * ac _Lac     SRx_1    3 0 2 001111110001110x00xx| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   DIVU_1   a 0 2 111000001001110x010x| DIVU   Store rs1 to rM. Q=0. Prepare invert rs2
    * ae _Lae     SRx_1    3 0 2 001111110001110x00xx| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   4 0 4 11000101010xxxx10110|        0x202 + 0xff + 1 = 0x302
    * b0 CSRRW_3  CSRRW_4  4 0 4 10110010110101000110|        Prep emulation entrypt 0x108, here Q to 0x104
    * b1 CSRRS_1  Fetch    a 7 0 1101111000xxxxxxxxxx|        Not in use
    * b2 CSRRW_4  Fetch    0 6 4 11011110111110100010|        IncPC, OpFetch, but force +4
    * b3 CSRRWI_1 Fetch    a 7 0 1101111000xxxxxxxxxx|        Not in use
    * b4 CSRRWI_2 Fetch    a 7 0 1101111000xxxxxxxxxx|        Not in use
    * b5 SH_3     SH_4     4 0 2 10011110000000010101|        Prepare get back address to use 
    * b6 CSRRCI_1 Fetch    a 7 0 1101111000xxxxxxxxxx|        Not in use
    * b7 IJ_3     IJ_4     4 0 4 10111101010110010110|        Construct Q = 1
    * b8 BGE      condb_2  4 5 2 00010011000111010101| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    DIV_D    3 0 4 11000000000110010110|        Calc carry of RS2+0xFFFFFFFF
    * ba DIV_C    DIV_e    1 5 2 10111001000111010010|        rM to yy. Q=ffffffff
    * bb MULHU_3  MULHU_2  1 0 2 01000010100111110110|        Shift Q and rM. Prepare read rs1
    * bc CSRRWI_0 CSRRW_1  4 5 2 01001001000011010101| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    b 6 2 11011110001110110011|        Mask and use as PC
    * be IJ_1     IJ_2     1 1 2 00011111000101110110|        Read until q=mem[(rs1+ofs)&~1u]
    * bf IJT_1    IJT_2    1 1 2 11000001000101110110|        Exit CSR, enter trap
    * c0 DIV_D    DIV_E    1 0 5 10001000000111010110|        Is RS2 == 0?
    * c1 IJT_2    IJT_3    4 5 2 11101001000101010101|        Read word is to be masked with ~1u
    * c2 DIVU_3   DIVU_2   8 0 4 11001010010101110110|        Conditionally subtract rs2. Update M[0]
    * c3 DIVU_4   DIVU_5   4 e 4 10100010010101110110|        Last Cond. -rs2. Upd M[0]. Branch on INSTR[13]
    * c4 ORI_0    ORI_1    3 4 2 11100001000111110101| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   3 0 2 01101111000000010111|        ~302
    * c6 IJT_4    ILL_2    e 5 2 01000111000110110111|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   d 5 2 11001011000xxxx10100|        Store pc to mepc.
    * c8 DIV_7    DIV_8    6 0 d 01100010100110010110|        Shift (Q,M) left. Prepare unsigned sub
    * c9 MRET_2   MRET_3   4 0 2 10100101010011000110|        0xff+3 = 0x102
    * ca DIVU_2   DIVU_3   6 0 d 11000010100110010110|        Shift (Q,M) left. Prepare unsigned sub
    * cb QINT_2   StdIncPc 5 f 2 11100110001010010101|        mtval = 0.
    * cc OR_0     OR_1     3 0 2 001001100001111x010x| OR     or
    * cd REM_0    DIV_1    9 e 2 10000010100101110110| REM    Branch on sign dividend RS1
    * ce ECALL_5  ECALL_6  4 0 4 10101010110101000110|        Q = 8
    * cf MRET_7   MRET_8   3 0 5 010011110000110x010x|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  4 0 4 00110111010001010110| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   4 4 2 11001001000011010101| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     9 c 6 00000110000101010110|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 5 5 2 00011110001101010101|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   4 f 4 100100100110010100x0|        Store 5 to mcause
    * d5 Fetch2u           5 4 e 00000000011111111110|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * d6 eILL0c   ILLe     3 0 2 11111110000xxxxx00xx| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  5 5 2 10100001001101010101|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  4 5 2 00010011000111010101| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   MULHU_2  3 0 2 010000101001111x010x|        rM<=RS2, Q = 0. next read RS1. Join.
    * da LDAF_a   LDAF_2   3 0 2 100100010001010x010x|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   4 5 4 100100100110010100x0|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  4 5 2 01001001000011010101| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  5 5 2 11100101001101010101|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   4 6 c 11110100000101110101|  Fr11  Read and latch instruction
    * df eFetch   Fetch2   4 6 c 11110100000101110101|  Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   DIVU_2   3 5 2 11001010000101110100|        Store inverted rs2 to yy. Prepare shift
    * e1 ORI_1    ORI_2    1 0 2 00011101000000010110|        Q = RS1
    * e2 MUL_1    MUL_2    8 0 6 11101000000101010110|        Q <= rM[0] ? Q+rs2 : Q. Prepare shr/sar
    * e3 MUL_3    ANDI_1   3 0 6 000110101101011x010x|        Transfer rM to rDee
    * e4 ANDI_0   ANDI_1   3 0 2 00011010000111110111| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  4 0 4 10001110110101000110|        Q = 4
    * e6 StdIncPc Fetch    0 6 a 11011110111110100010|  Fr11  IncPC, OpFetch
    * e7 aFault   aFault_1 5 5 2 00011110001101010101|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    MUL_1    1 0 2 11100010100111010110|        Shift Q and rM. Prepare read rs2
    * e9 IJT_3    IJT_4    4 0 4 11000110010110010110|        Construct Q = 1
    * ea MULHU_5  MULHU_6  4 0 2 00100010000110010110|        Q <= rM[0] ? Q+Rjj : Q. Prepare read Ryy
    * eb LH_3     LH_4     3 0 2 01010110000011110111|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    3 0 2 000100010001111x010x| AND    And 
    * ed REMU_0   DIVU_1   a 0 2 111000001001110x010x| REMU   Store dividend to rM. Prepare read divisor.Q=0
    * ee eILL0a   ILLe     3 0 2 11111110000xxxxx00xx| Illegal instruction seen
    * ef WFI_5    Fetch    0 6 4 11011110111110100010|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    9 c 6 01110010000101010110|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 5 5 2 00011110001101010101|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 0 2 111001100000010x010x|        Prepare read PC
    * f3 aF_SW    aF_SW_1  3 0 2 11011101000xxxxx001x|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   eFetch3  5 4 2 00010010011000111100|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 5 5 2 11011011001101010101|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    4 0 4 11111010110000000110| WFI    To check offset
    * f7 EBREAK_1 EBREAK_2 5 5 2 10101011001001010101| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  4 5 2 00010011000111010101| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   MULH_3   4 4 4 11011001010111010100|        Store 1 to Rjj. next read rs2, Q=0
    * fa WFI_2    WFI_3    4 0 4 01000101010101010110|        Check offset
    * fb MULH_1   MULH_2   3 5 2 11111001000101010100|        Store ~rs1 to Ryy. Prep construct 1.
    * fc CSRRCI_0 CSRRW_1  4 5 2 01001001000011010101| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    3 0 2 011111100000010x010x| NMI    Get current PC
    * fe ILLe     ILL_1    3 0 2 010001100000010x010x| Illegal
    * ff QINT_0   QINT_1   3 0 2 110001110000010x010x| INT    Get current PC
    */
   localparam u0_0 = 256'h605501c429c441d66055a5d630b6a5d690b770d7400264546044e5b6217615b6;
   localparam u0_1 = 256'h71554d466055617320136055155431d5e7b260446016559641f645f6a1d631f6;
   localparam u0_2 = 256'h605570d5b156e1c0041465d611d665d6d41671d4400251f160449156605425b6;
   localparam u0_3 = 256'ha1f051f0315690d52013d156685431d5701431766176e3b2e0006454b1f66055;
   localparam u0_4 = 256'h6556e000b1d411c4035265d6b41665d6f17671b65556b1f7a012b156b41605b6;
   localparam u0_5 = 256'ha3530176a17690d52013d176c1f5ad7631167117e355b156a3534176a3536174;
   localparam u0_6 = 256'hf416a0f7b1d411c4a396b01531566054325123d2f044b1f78576857660543156;
   localparam u0_7 = 256'he0000014e00090d5201323928d569015517550756fa25055e000a0d7e355e156;
   localparam u0_8 = 256'ha3552640297691e44730b5566055c9e0e0004d80017611f7255681d4e00055b6;
   localparam u0_9 = 256'h2192f1960994899429f55176e00031d53251a1764d664330517441302e404295;
   localparam u0_A = 256'h5416f1c009c4f1c0a154472089648956e4160173f4d6a1f16c54ad64ed46e5b6;
   localparam u0_B = 256'h1176f176e3b390d529f691d2019631d5d596e000e015e000e000efa2e0002d46;
   localparam u0_C = 256'hf0c4ad46297661e46295299654c62996b01471b7f01711f52576a576915581d6;
   localparam u0_D = 256'h41754175535590d52650114429e431d51355e00007fe2650e355615690d57456;
   localparam u0_E = 256'hefa2e00009c411e460f72196659629d6e355efa2ed46a1f7ad648156d016a174;
   localparam u0_F = 256'h70446044e04490d59154555695d431d5b255ac06b355263cd0026044e3552156;
   localparam u1_0 = 256'h432e3021302e102015284405302a4405102030203020432e302e222b111d0000;
   localparam u1_1 = 256'h452b404d632e202a4023132e44244521062d302e10514041302154373021302a;
   localparam u1_2 = 256'h432e345f902f302340432409302224094021342230208003302e4063332e7505;
   localparam u1_3 = 256'h900390039860452440239363132e4521d55dc8209323b62da70d45283022437e;
   localparam u1_4 = 256'h404e302f95293023da2b7986404479861128e52440463022302e806b40407085;
   localparam u1_5 = 256'h552d1117cd264524402395254529106b302a102555219c6e552d1115552d1b9e;
   localparam u1_6 = 256'h404c302195293023b9274026302a132e5529d72f305e30224e45804c132e302a;
   localparam u1_7 = 256'ha70dd529a70d45244023172f404a452a41cd40bd06a74027a70d302155219c66;
   localparam u1_8 = 256'h55284f299e2830224f434048432e3e29a70d43a3111f30224028342aa70d0008;
   localparam u1_9 = 256'hd72fe9291e261e264424cd2b302f45215529952940496f23d529d5234f495f23;
   localparam u1_A = 256'h404c3023a02e3023d52a4f23302c3e274022208d404a8003434e3061404c7505;
   localparam u1_B = 256'h112c1121b62d45241024152b304c4521404ba70d4029a70da70d064da70d404b;
   localparam u1_C = 256'h3054404a9e2830225f2e60dc402a60d6d52ce5243026342e4e4a804c452e1058;
   localparam u1_D = 256'h46cf46cf552e45244549302930244521552a302f54e04f4955219c60442c4043;
   localparam u1_E = 256'h064d302fa02e302130254022404c102e552106ad404830213061806e1021352c;
   localparam u1_F = 256'h302c302430274524352f4044444d4521552a404f552d5421302d302e55219c67;
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

   assign d[4] = indir[0];
   assign d[8] = indir[1];
   assign d[9] = indir[2];
   assign d[10] = indir[3];
   assign d[11] = indir[4];
   assign d[14] = indir[5];
   assign d[15] = indir[6];
   assign d[16] = indir[7];
   assign d[17] = indir[8];
   assign d[19] = indir[9];
   assign d[34] = indir[10];
   assign d[35] = indir[11];
   assign d[38] = indir[12];
   assign d[39] = indir[13];
   assign d[40] = indir[14];
   assign d[41] = indir[15];
   assign d[42] = indir[16];
   assign d[43] = indir[17];
   assign d[44] = indir[18];
   assign d[45] = indir[19];
   // replaces = 0000000010000001001001010000000001000011000111
   SB_LUT4 #(.LUT_INIT(16'h0042)) cmb_d00(.O(d[0]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0498)) cmb_d01(.O(d[1]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h2418)) cmb_d02(.O(d[2]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0020)) cmb_d06(.O(d[6]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h1800)) cmb_d07(.O(d[7]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h7ffe)) cmb_d12(.O(d[12]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h4008)) cmb_d22(.O(d[22]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0100)) cmb_d24(.O(d[24]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h1002)) cmb_d27(.O(d[27]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h1200)) cmb_d30(.O(d[30]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0400)) cmb_d37(.O(d[37]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   // replaces = 0000000001001010110110001100000000000000000000
   SB_LUT4 #(.LUT_INIT(16'ha928)) cmb_d20(.O(d[20]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'ha070)) cmb_d21(.O(d[21]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0842)) cmb_d25(.O(d[25]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h3100)) cmb_d26(.O(d[26]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h8004)) cmb_d28(.O(d[28]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h8400)) cmb_d29(.O(d[29]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h5207)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0200)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h4000)) cmb_d36(.O(d[36]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0000000000000100000000100001000010000000101000
   SB_LUT4 #(.LUT_INIT(16'h7a42)) cmb_d03(.O(d[3]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h11f5)) cmb_d05(.O(d[5]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h68ff)) cmb_d13(.O(d[13]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h6020)) cmb_d18(.O(d[18]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0084)) cmb_d23(.O(d[23]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4881)) cmb_d32(.O(d[32]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
