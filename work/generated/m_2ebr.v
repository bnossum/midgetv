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
 * 168 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 * 168 167 168 167 165 166 168 168 168 168   x 168 168 168 167 168 168 167 168 167 168 168 168 168 168 168 168 168 168 168 168 168 168 168 168 168 168 168 167 168 168 168 168 167 166 167  kill col  4  Tbl  44 cols 0000000000000000000000000000000000010000010000 has 165 unique lines.
 * 165 164 165 163     162 165 165 165 165   x 165 165 165 162 165 165 163 165 164 165 165 165 165 165 165 165 165 165 165 165 165 165 165 164 165 165 165 164 165 165 165 165 164 163 164  kill col 14  Tbl  43 cols 0000000000000000000000000000000100010000010000 has 162 unique lines.
 * 162 161 162 160     159 162 162 162 162   x 162 162 162     162 162 161 162 161 162 162 162 162 162 162 162 162 162 162 162 162 162 162 161 162 162 162 160 162 162 162 162 160 159 161  kill col 44  Tbl  42 cols 0100000000000000000000000000000100010000010000 has 159 unique lines.
 * 159 158 159 157     156 159 159 159 159   x 159 159 159     159 159 158 159 158 159 159 159 159 159 159 159 159 159 159 159 159 159 159 158 159 159 159 157 159 158 159 159 157     158  kill col  5  Tbl  41 cols 0100000000000000000000000000000100010000110000 has 156 unique lines.
 * 155 155 156 153         156 156 156 156   x 156 156 156     156 156 155 156 155 156 156 156 156 156 156 156 156 156 156 156 156 156 156 155 156 156 156 154 156 155 156 156 154     155  kill col  3  Tbl  40 cols 0100000000000000000000000000000100010000111000 has 153 unique lines.
 * 152 152 153             153 153 153 153   x 153 153 153     153 153 152 153 152 153 153 153 153 153 153 153 153 153 153 153 153 153 153 151 153 153 153 151 153 152 153 152 151     152  kill col 43  Tbl  39 cols 0110000000000000000000000000000100010000111000 has 151 unique lines.
 * 150 150 151             151 151 151 151   x 151 151 151     151 151 150 151 149 151 150 151 151 151 151 151 151 151 151 151 151 151 151 149 151 151 151 148 149 148 150 150         149  kill col 40  Tbl  38 cols 0110010000000000000000000000000100010000111000 has 148 unique lines.
 * 147 147 148             148 148 147 148   x 148 148 148     148 148 147 148 146 148 147 148 148 148 148 148 148 148 148 148 148 148 148 146 148 148 148 144 145     145 146         144  kill col 45  Tbl  37 cols 1110010000000000000000000000000100010000111000 has 144 unique lines.
 * 143 143 144             144 144 143 144   x 144 144 144     143 141 142 144 142 143 143 144 144 144 144 144 144 144 144 144 144 144 144 142 144 144 144 138 139     140 139              kill col 38  Tbl  36 cols 1110010100000000000000000000000100010000111000 has 138 unique lines.
 * 137 137 138             138 138 137 138   x 138 138 138     137 134 135 138 136 137 137 138 138 138 138 138 138 138 138 138 138 138 138 135 138 138 138     131     133 130              kill col 42  Tbl  35 cols 1111010100000000000000000000000100010000111000 has 130 unique lines.
 * 129 129 130             129 130 128 129   x 130 130 130     128 125 125 130 127 128 129 130 130 130 130 128 130 130 130 130 130 130 130 127 130 130 130     119     122                  kill col 39  Tbl  34 cols 1111011100000000000000000000000100010000111000 has 119 unique lines.
 * 118 118 119             117 119 114 115   x 119 119 119     116 114 113 117 116 117 117 119 119 118 119 117 119 119 119 119 119 119 119 116 119 119 119             101                  kill col 41  Tbl  33 cols 1111111100000000000000000000000100010000111000 has 101 unique lines.
 *  99 100 101              98 101  96  96   x 101 101 101      95  94  92 100  99  99  98 101 100 100 101  98 101 101 101 101 101 101 101  98 101 101 101                                  kill col 17  Tbl  32 cols 1111111100000000000000000000100100010000111000 has  92 unique lines.
 *  90  91  92              87  92  87  87   x  92  92  92      81  84      91  90  90  88  92  91  91  91  89  92  92  92  92  92  92  92  88  92  92  92                                  kill col 15  Tbl  31 cols 1111111100000000000000000000101100010000111000 has  81 unique lines.
 *  79  80  81              76  81  77  77   x  80  81  81          73      79  78  79  77  81  80  80  80  78  81  81  81  81  81  81  80  77  81  81  81                                  kill col 16  Tbl  30 cols 1111111100000000000000000000111100010000111000 has  73 unique lines.
 *  71  72  73              69  73  69  70   x  71  73  73                  71  70  71  69  73  72  72  72  70  73  73  72  73  73  73  72  68  73  73  73                                  kill col 34  Tbl  29 cols 1111111100010000000000000000111100010000111000 has  68 unique lines.
 *  66  67  68              64  68  63  64   x  65  68  68                  66  65  66  65  68  67  67  67  65  68  68  67  68  68  68  67      67  68  68                                  kill col  8  Tbl  28 cols 1111111100010000000000000000111100010100111000 has  63 unique lines.
 *  61  62  63              59  63      60   x  60  62  61                  61  60  61  60  63  62  62  62  60  63  63  62  63  63  62  62      62  63  63                                  kill col  6  Tbl  27 cols 1111111100010000000000000000111100010101111000 has  59 unique lines.
 *  57  58  59                  59      56   x  57  58  57                  57  56  57  56  59  58  58  58  56  59  59  58  59  59  58  58      58  59  59                                  kill col 26  Tbl  26 cols 1111111100010000000100000000111100010101111000 has  56 unique lines.
 *  55  55  56                  56      53   x  54  55  54                  54  53  54  54  56  55  55  55      56  56  55  56  56  55  55      55  56  56                                  kill col 19  Tbl  25 cols 1111111100010000000100000010111100010101111000 has  53 unique lines.
 *  52  52  53                  53      51   x  51  52  51                  48      51  51  53  52  52  52      53  53  52  53  53  52  52      52  53  53                                  kill col 18  Tbl  24 cols 1111111100010000000100000011111100010101111000 has  48 unique lines.
 *  47  47  48                  48      45   x  46  47  46                          47  46  48  47  47  47      48  48  47  48  48  47  47      47  48  48                                  kill col  9  Tbl  23 cols 1111111100010000000100000011111100011101111000 has  45 unique lines.
 *  44  44  45                  45           x  43  44  43                          43  42  45  43  44  44      45  44  44  45  44  43  44      44  45  45                                  kill col 21  Tbl  22 cols 1111111100010000000100001011111100011101111000 has  42 unique lines.
 *  41  41  41                  42           x  40  41  41                          41      42  40  41  41      42  41  41  42  39  40  41      40  42  42                                  kill col 31  Tbl  21 cols 1111111100010010000100001011111100011101111000 has  39 unique lines.
 *  38  38  38                  39           x  36  37  37                          35      38  37  38  38      39  38  38  39      35  38      37  39  39                                  kill col 32  Tbl  20 cols 1111111100010110000100001011111100011101111000 has  35 unique lines.
 *  34  34  34                  35           x  32  33  33                          30      34  33  34  33      35  34  34  35          33      33  35  35                                  kill col 20  Tbl  19 cols 1111111100010110000100001111111100011101111000 has  30 unique lines.
 *  29  29  29                  30           x  26  27  28                                  29  28  29  28      30  28  29  29          28      28  30  29                                  kill col 11  Tbl  18 cols 1111111100010110000100001111111100111101111000 has  26 unique lines.
 *  25  25  25                  26           x      23  24                                  25  24  25  23      26  24  25  25          24      23  26  25                                  kill col 35  Tbl  17 cols 1111111100110110000100001111111100111101111000 has  23 unique lines.
 *  22  22  22                  23           x      20  21                                  22  21  22  21      23  21  22  22          21          23  22                                  kill col 12  Tbl  16 cols 1111111100110110000100001111111101111101111000 has  20 unique lines.
 *  19  19  19                  20           x          19                                  19  19  19  18      20  18  19  19          18          20  19                                  kill col 33  Tbl  15 cols 1111111100111110000100001111111101111101111000 has  18 unique lines.
 *  17  17  17                  18           x          17                                  17  17  17  16      18  16  17  17                      18  17                                  kill col 28  Tbl  14 cols 1111111100111110010100001111111101111101111000 has  16 unique lines.
 *
 * Round 1: 0000000011000001101011110000000010000010000111  4 columns for indexes to table representing 14 original columns (uses 16 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 36
 * 167 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x   x   x 166 164 165 167   x 167 167   x 165 167   x 166 167 167 166 167 166 167 167   x   x   x   x 167   x 166   x   x 167 167 167 167 165   x   x 166 167 167 167 167 166 165 166  kill col  4  Tbl  30 cols 0000000011000001101011110000000010010010010111 has 164 unique lines.
 *   x   x   x 162     161 164   x 164 164   x 162 164   x 161 164 164 162 164 163 164 164   x   x   x   x 164   x 163   x   x 164 164 164 163 162   x   x 163 164 164 164 164 163 162 163  kill col 14  Tbl  29 cols 0000000011000001101011110000000110010010010111 has 161 unique lines.
 *   x   x   x 159     157 161   x 161 161   x 159 161   x     161 161 159 161 160 161 161   x   x   x   x 161   x 160   x   x 161 161 161 160 159   x   x 159 161 161 161 161 159 158 160  kill col  5  Tbl  28 cols 0000000011000001101011110000000110010010110111 has 157 unique lines.
 *   x   x   x 154         157   x 157 157   x 155 157   x     157 157 155 157 156 157 157   x   x   x   x 157   x 156   x   x 157 157 157 156 155   x   x 155 157 157 157 157 155 154 156  kill col 44  Tbl  27 cols 0100000011000001101011110000000110010010110111 has 154 unique lines.
 *   x   x   x 151         154   x 154 154   x 152 154   x     154 154 152 154 153 154 154   x   x   x   x 154   x 153   x   x 154 154 154 152 152   x   x 152 154 153 154 154 152     153  kill col  3  Tbl  26 cols 0100000011000001101011110000000110010010111111 has 151 unique lines.
 *   x   x   x             151   x 151 151   x 148 151   x     151 150 149 151 150 151 151   x   x   x   x 151   x 150   x   x 151 151 151 145 149   x   x 149 151 150 151 150 149     150  kill col 34  Tbl  25 cols 0100000011010001101011110000000110010010111111 has 145 unique lines.
 *   x   x   x             145   x 145 144   x 142 145   x     145 144 143 145 144 145 145   x   x   x   x 145   x 144   x   x 145 145 145     142   x   x 142 145 143 145 144 143     144  kill col 38  Tbl  24 cols 0100000111010001101011110000000110010010111111 has 142 unique lines.
 *   x   x   x             142   x 142 141   x 139 142   x     142 140 139 141 141 142 142   x   x   x   x 142   x 141   x   x 142 142 142     139   x   x     142 140 142 138 139     140  kill col 42  Tbl  23 cols 0101000111010001101011110000000110010010111111 has 138 unique lines.
 *   x   x   x             138   x 137 136   x 135 137   x     138 136 135 137 137 138 137   x   x   x   x 138   x 137   x   x 138 138 138     135   x   x     136 135 135     133     135  kill col 43  Tbl  22 cols 0111000111010001101011110000000110010010111111 has 133 unique lines.
 *   x   x   x             133   x 131 131   x 130 132   x     132 129 128 132 130 133 130   x   x   x   x 131   x 132   x   x 133 133 133     130   x   x     129 125 127             129  kill col 40  Tbl  21 cols 0111010111010001101011110000000110010010111111 has 125 unique lines.
 *   x   x   x             125   x 122 121   x 121 124   x     124 119 120 124 122 124 122   x   x   x   x 122   x 124   x   x 125 125 125     122   x   x     118     118             114  kill col 45  Tbl  20 cols 1111010111010001101011110000000110010010111111 has 114 unique lines.
 *   x   x   x             113   x 109 110   x 110 113   x     111 105 106 113 111 112 111   x   x   x   x 110   x 113   x   x 114 114 114     111   x   x     103     104                  kill col 39  Tbl  19 cols 1111011111010001101011110000000110010010111111 has 103 unique lines.
 *   x   x   x             101   x  95  97   x  97 102   x      99  93  94 100 100 100  99   x   x   x   x  99   x 102   x   x 103 103 103     100   x   x              83                  kill col 41  Tbl  18 cols 1111111111010001101011110000000110010010111111 has  83 unique lines.
 *   x   x   x              80   x  76  75   x  77  82   x      77  73  72  81  81  80  79   x   x   x   x  80   x  82   x   x  83  83  83      80   x   x                                  kill col 17  Tbl  17 cols 1111111111010001101011110000100110010010111111 has  72 unique lines.
 *   x   x   x              67   x  64  65   x  65  71   x      61  63      70  70  70  69   x   x   x   x  69   x  69   x   x  72  71  72      69   x   x                                  kill col 15  Tbl  16 cols 1111111111010001101011110000101110010010111111 has  61 unique lines.
 *   x   x   x              56   x  55  55   x  56  60   x          52      57  57  58  58   x   x   x   x  58   x  58   x   x  61  60  60      58   x   x                                  kill col 16  Tbl  15 cols 1111111111010001101011110000111110010010111111 has  52 unique lines.
 *   x   x   x              48   x  46  46   x  47  51   x                  48  48  50  49   x   x   x   x  49   x  49   x   x  52  51  51      48   x   x                                  kill col  9  Tbl  14 cols 1111111111010001101011110000111110011010111111 has  46 unique lines.
 *   x   x   x              42   x  41       x  41  44   x                  41  42  44  42   x   x   x   x  43   x  43   x   x  46  45  45      42   x   x                                  kill col 18  Tbl  13 cols 1111111111010001101011110001111110011010111111 has  41 unique lines.
 *   x   x   x              37   x  35       x  36  37   x                      36  36  37   x   x   x   x  38   x  39   x   x  40  39  40      37   x   x                                  kill col  8  Tbl  12 cols 1111111111010001101011110001111110011110111111 has  35 unique lines.
 *   x   x   x              31   x           x  30  31   x                      31  31  31   x   x   x   x  32   x  33   x   x  34  31  34      31   x   x                                  kill col 11  Tbl  11 cols 1111111111010001101011110001111110111110111111 has  30 unique lines.
 *   x   x   x              27   x           x      25   x                      26  26  25   x   x   x   x  27   x  28   x   x  28  26  29      26   x   x                                  kill col 21  Tbl  10 cols 1111111111010001101011111001111110111110111111 has  25 unique lines.
 *   x   x   x              22   x           x      21   x                      22  22       x   x   x   x  23   x  23   x   x  22  21  24      21   x   x                                  kill col 35  Tbl   9 cols 1111111111110001101011111001111110111110111111 has  21 unique lines.
 *   x   x   x              18   x           x      17   x                      18  18       x   x   x   x  19   x  19   x   x  18  17  20           x   x                                  kill col 32  Tbl   8 cols 1111111111110101101011111001111110111110111111 has  17 unique lines.
 *   x   x   x              14   x           x      14   x                      14  13       x   x   x   x  15   x  15   x   x  14      16           x   x                                  kill col 20  Tbl   7 cols 1111111111110101101011111101111110111110111111 has  13 unique lines.
 *
 * Round 2: 0000000000001010010100000010000001000001000000  4 columns for indexes to table representing  7 original columns (uses 13 of 16 lines in indirect table).
 * Total columns to represent in EBRs: 33
 * 165 distinct lines in remaining untreated columns
 * c45 c44 c43 c42 c41 c40 c39 c38 c37 c36 c35 c34 c33 c32 c31 c30 c29 c28 c27 c26 c25 c24 c23 c22 c21 c20 c19 c18 c17 c16 c15 c14 c13 c12 c11 c10  c9  c8  c7  c6  c5  c4  c3  c2  c1  c0 
 *   x   x   x 164 162 163   x   x 165 165   x 163   x   x 164 164 165 164 163   x 165 165   x   x   x   x   x   x   x   x   x   x 165   x 165 163   x   x 164 165 165 165 165 163 163 164  kill col  4  Tbl  23 cols 0000000011001011111111110010000011010011010111 has 162 unique lines.
 *   x   x   x 160     159   x   x 162 162   x 160   x   x 159 161 162 160 160   x 162 162   x   x   x   x   x   x   x   x   x   x 162   x 161 160   x   x 161 162 162 162 162 160 160 161  kill col 14  Tbl  22 cols 0000000011001011111111110010000111010011010111 has 159 unique lines.
 *   x   x   x 157     155   x   x 159 159   x 157   x   x     158 159 157 157   x 159 159   x   x   x   x   x   x   x   x   x   x 159   x 158 157   x   x 157 158 159 159 159 156 156 158  kill col  5  Tbl  21 cols 0000000011001011111111110010000111010011110111 has 155 unique lines.
 *   x   x   x 152           x   x 155 155   x 153   x   x     154 155 153 153   x 155 155   x   x   x   x   x   x   x   x   x   x 155   x 154 153   x   x 153 154 155 155 155 152 152 154  kill col 44  Tbl  20 cols 0100000011001011111111110010000111010011110111 has 152 unique lines.
 *   x   x   x 149           x   x 152 152   x 150   x   x     151 152 150 150   x 152 152   x   x   x   x   x   x   x   x   x   x 152   x 150 150   x   x 150 151 151 152 152 149     151  kill col 43  Tbl  19 cols 0110000011001011111111110010000111010011110111 has 149 unique lines.
 *   x   x   x 145           x   x 149 149   x 147   x   x     148 149 147 147   x 149 146   x   x   x   x   x   x   x   x   x   x 149   x 147 147   x   x 146 146 145 147 149         146  kill col 40  Tbl  18 cols 0110010011001011111111110010000111010011110111 has 145 unique lines.
 *   x   x   x 141           x   x 143 145   x 142   x   x     144 145 143 143   x 144 141   x   x   x   x   x   x   x   x   x   x 145   x 142 143   x   x 141 141     141 144         140  kill col 45  Tbl  17 cols 1110010011001011111111110010000111010011110111 has 140 unique lines.
 *   x   x   x 136           x   x 138 139   x 137   x   x     138 137 137 138   x 138 136   x   x   x   x   x   x   x   x   x   x 140   x 137 138   x   x 134 135     133 136              kill col 41  Tbl  16 cols 1110110011001011111111110010000111010011110111 has 133 unique lines.
 *   x   x   x 129           x   x 131 131   x 130   x   x     129 129 128 129   x 130 128   x   x   x   x   x   x   x   x   x   x 132   x 129 131   x   x 125 124         124              kill col 42  Tbl  15 cols 1111110011001011111111110010000111010011110111 has 124 unique lines.
 *   x   x   x 117           x   x 121 118   x 120   x   x     118 116 113 120   x 119 119   x   x   x   x   x   x   x   x   x   x 123   x 120 122   x   x 110 108                          kill col 39  Tbl  14 cols 1111111011001011111111110010000111010011110111 has 108 unique lines.
 *   x   x   x  99           x   x 104 101   x 101   x   x     101  99  95 104   x 102 103   x   x   x   x   x   x   x   x   x   x 106   x 102 106   x   x  90                              kill col 38  Tbl  13 cols 1111111111001011111111110010000111010011110111 has  90 unique lines.
 *   x   x   x  83           x   x  84  82   x  84   x   x      80  78  77  84   x  84  86   x   x   x   x   x   x   x   x   x   x  88   x  83  88   x   x                                  kill col 17  Tbl  12 cols 1111111111001011111111110010100111010011110111 has  77 unique lines.
 *   x   x   x  67           x   x  69  68   x  71   x   x      61  64      70   x  71  71   x   x   x   x   x   x   x   x   x   x  74   x  68  75   x   x                                  kill col 15  Tbl  11 cols 1111111111001011111111110010101111010011110111 has  61 unique lines.
 *   x   x   x  52           x   x  53  52   x  56   x   x          50      52   x  53  53   x   x   x   x   x   x   x   x   x   x  58   x  54  59   x   x                                  kill col 16  Tbl  10 cols 1111111111001011111111110010111111010011110111 has  50 unique lines.
 *   x   x   x  42           x   x  39  41   x  45   x   x                  42   x  43  41   x   x   x   x   x   x   x   x   x   x  47   x  44  47   x   x                                  kill col  8  Tbl   9 cols 1111111111001011111111110010111111010111110111 has  39 unique lines.
 *   x   x   x  33           x   x      32   x  35   x   x                  32   x  33  32   x   x   x   x   x   x   x   x   x   x  34   x  33  36   x   x                                  kill col 21  Tbl   8 cols 1111111111001011111111111010111111010111110111 has  32 unique lines.
 *   x   x   x  27           x   x      24   x  28   x   x                  25   x  25       x   x   x   x   x   x   x   x   x   x  26   x  28  29   x   x                                  kill col  9  Tbl   7 cols 1111111111001011111111111010111111011111110111 has  24 unique lines.
 *   x   x   x  21           x   x           x  20   x   x                  18   x  15       x   x   x   x   x   x   x   x   x   x  17   x  20  21   x   x                                  kill col 20  Tbl   6 cols 1111111111001011111111111110111111011111110111 has  15 unique lines.
 *
 * Round 3: 0000000000110100000000000001000000100000001000  4 columns for indexes to table representing  6 original columns (uses 15 of 16 lines in indirect table).
 * Direct:  1111111100000000000000001100111100011100110000 19 columns
 * Can even chose 1 more column to be represented directly.
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
    * 00 LB_0     LB_1     0 0 0 00000001001101011100| LB     Load byte. q = rdadr=RS1+0fs
    * 01 LB_1     LB_2     1 1 1 11010010001011011001|        Read until q=mem[rs1+ofs) & ~3u]
    * 02 IJ_0     IJ_1     2 2 2 10111110001101011100| IJ     Jump to mem[(rs1+ofs)&~3u]. inCSR=0
    * 03 FENCE    StdIncPc 3 1 0 11100110000010010xx0| f      Prepare read PC (FENCE)
    * 04 ADDI_0   StdIncPc 2 3 0 11100110010010010100| ADDI   Add immediate. rd =RS1+Iimm (or joined)
    * 05 _L05     ADDI_0   3 1 0 00000100000010001xx0| AUIPC  q = imm20 (copy x/8)
    * 06 LB_3     LB_4     4 1 0 00000111000110011010|        q = ~mem[rs1+ofs]
    * 07 LB_4     LB_5     1 1 0 00001001000101011010|        q = (uint8_t) mem[rs1+Iimm]
    * 08 _L08     SB_1     2 4 0 01011010101110011100| SB     Store byte. wjj=wradr=RS1+Simm
    * 09 LB_5     LB_6     4 1 0 10100011000101011000|        q = D^0xffffffff^q = D^0x80
    * 0a _L0a     SB_1     2 4 0 01011010101110011100| SB     Store byte. wjj=wradr=RS1+Simm
    * 0b JALR_2   JAL_2    1 3 3 10000110110010010010|        Q = (RS1+imn) & 0xfffffffe
    * 0c ADD_0    ADDI_0   1 1 0 00000100001110011000| ADD    add     Addition Q = RS1
    * 0d MUL_0    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 0e SUB_0    SUB_1    3 1 0 00010000001110010xx0| SUB    Subtraction
    * 0f _L0f     StdIncPc 4 3 0 11100110010010010110| LUI    q = imm20
    * 10 SUB_1    LB_6     4 1 0 10100011001111011000|        Q = ~RS2
    * 11 AND_1    ANDI_1   4 1 0 00011010001110011000|        RS1^0xffffffff to Q
    * 12 eFetch3           5 3 4 00000000101111011100|  Fr11  Write minstret. Update I. Q=immediate, use dinx
    * 13 condb_2  condb_3  4 1 0 00010100001111011000|        ~RS2 in Q
    * 14 condb_3  condb_4  2 1 5 00010101000010011100|        Calculate RS1+~RS2+1
    * 15 condb_4  condb_5  1 5 0 00010110001100011000|        Branch on condition
    * 16 condb_5  Fetch    6 6 6 11011110101101001110|        Branch not taken.
    * 17 condb_5t BrOpFet  0 6 3 01110100101101011100|        Branch taken.
    * 18 BEQ      condb_2  4 3 0 00010011111110010110| BEQ    Conditional Branch. Offset to Ryy
    * 19 JALR_0   JALR_1   2 3 0 01000001101010010100| JALR   jj=RS1+imm
    * 1a ANDI_1   StdIncPc 1 3 0 11100110010010010010|        rd = Iimm & RS1
    * 1b _L1b     JAL_1    4 1 3 00110010000010001110| JAL    J-imm is in q. Branch on alignfault
    * 1c ECAL_BRK ECAL_RET 4 1 2 10100110001011001110| ECALL/EBREAK  Select ECALL/(U/S/M)RET or EBREAK/WFI
    * 1d ORI_2    StdIncPc 1 3 0 11100110010010010110|        rd = Iimm | RS1
    * 1e aFault_1 aFault_2 7 1 5 11010100001010011100|        Q = 4
    * 1f IJ_2     IJ_3     4 3 0 10110111111010010110|        Read word is to be masked with 2 lsb = 00
    * 20 LH_0     LH_1     0 4 2 01010010111101011100| LH     Load hword. Q = rdadr=RS1+Iimm.
    * 21 XORI_1   StdIncPc 4 3 0 11100110010010010000|        rd = Iimm ^ RS1
    * 22 MULHU_6  ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 23 FENCEI   StdIncPc 3 1 0 11100110000010010xx0| f      Prepare read PC (FENCE)
    * 24 SLLI_0   SLLI_1   4 0 7 0011010100111100x110| SLLI   Shift left immediate.
    * 25 _L25     ADDI_0   3 1 0 00000100000010001xx0| AUIPC  q = imm20 (copy x/8)
    * 26 OR_1     OR_2     4 3 0 00100111101110010000|        RS1^0xffffffff to jj
    * 27 OR_2     ORI_2    2 1 0 00011101000000011100|        Q = rs2
    * 28 _L28     SH_1     2 4 2 10010110101110011100| SH     Store halfword. jjw=wradr=RS1+Simm
    * 29 XOR_1    XORI_1   4 1 0 00100001001110011000|        Q = RS1^0xFFFFFFFF
    * 2a _L2a     SH_1     2 4 2 10010110101110011100| SH     Store halfword. jjw=wradr=RS1+Simm
    * 2b SLTIX_1  SLTIX_2  2 1 5 0011000000xxxx010100|        RS1 - imm / RS1 - RS2
    * 2c SLL_0    SLL_1    3 1 0 0011111000111000xxx0| SLL    Shift left
    * 2d MULH_0   ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 2e EBRKWFI2 EBREAK_1 4 7 0 11110111100110010010| EBREAK/WFI2 Select EBREAK or WFI
    * 2f _L2f     StdIncPc 4 3 0 11100110010010010110| LUI    q = imm20
    * 30 SLTIX_2  StdIncPc 4 3 8 11100110010010010110|        Registered ALU flag to rd
    * 31 SLTX_1   SLTIX_1  4 1 0 00101011001111011000|        ~rs2 to Q
    * 32 JAL_1    JAL_2    2 3 0 10000110110010010100|        Target adr to yy
    * 33 JAERR_1  JAERR_2  5 6 0 1000000111001000x100|  Err   JAL target adr misaligned, store to mtval
    * 34 JAL_3    Fetch    8 6 9 11011110101101001000|        PC+imm/trap entrypt to PC. OpFetch
    * 35 SLLI_1   SLLI_2   1 3 7 00110110011011011000|        Register to shift to Q (and TRG for shift 0)
    * 36 SLLI_2   FENCE    1 8 7 00000011011011011100|        Repeat Q = Q+Q until shregcnt == 0
    * 37 ECALL_2  ECALL_3  9 7 0 1101011111xxxx010000|        mepc = pc, prep store 0 to mtval
    * 38 BNE      condb_2  4 3 0 00010011111110010110| BNE    Conditional Branch. Offset to Ryy
    * 39 MULHU_7  ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 3a SRxI_1   SRxI_2   1 3 a 00111101011010011001|        Register to shift to Q
    * 3b _L3b     JAL_1    4 1 3 00110010000010001110| JAL    J-imm is in q. Branch on alignfault
    * 3c CSRRW_0  CSRRW_1  4 3 0 01001001110110010110| CSRRW  Decoded CSR adr in yy
    * 3d SRxI_2   FENCE    1 8 a 00000011011010011001|        Repeat Q >>= 1 until shregcnt == 0
    * 3e SLL_1    SLLI_1   1 0 7 0011010100111100x000|        Shiftamount was in low 5 bits of RS2
    * 3f SRx_1    SRxI_1   1 0 7 0011101000111100x000|        Shiftamount in low 5 bits of RS2
    * 40 LW_0     LW_1     0 1 3 01010000001101011100| LW     Load word. Q=yy=rdadr=RS1+Iimm
    * 41 JALR_1   JALR_2   2 1 5 00001011000000011100|        Q=1
    * 42 MULHU_2  ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 43 MULHU_4  ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 44 SLTI_0   SLTIX_1  4 1 0 00101011001111011010| SLTI   Set less than immediate (signed)
    * 45 WFI_3    WFI_4    2 1 5 01100101001010011100|        More check offset
    * 46 ILL_1    ILL_2    a 3 0 01000111111101011000|        Store PC to mepc and Q for read of instr
    * 47 ILL_2    ILL_3    1 1 9 10001111001011011000|        Read until Q is offending instruction
    * 48 _L48     SW_1     0 9 3 01100110001110011100| SW     Store word. Q=wradr=RS1+Simm
    * 49 CSRRW_1  CSRRW_2  2 1 5 01001011000000011100|        Construct PC storage adr
    * 4a _L4a     SW_1     0 9 3 01100110001110011100| SW     Store word. Q=wradr=RS1+Simm
    * 4b CSRRW_2  CSRRW_3  9 6 b 10110000001010001000|        Write PC to 0x100 start Prep emulation entrypt
    * 4c SLT_0    SLTX_1   3 1 0 00110001001110010xx0| SLT    Set less than (signed)
    * 4d MULHSU_0 ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 4e eILL0b   ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 4f MRET_8   StdIncPc 2 1 5 11100110001010011100|        Prep +4
    * 50 LW_1     StdIncPc 1 3 c 11100110011011010000|        Read until d=mem[(rs1+ofs) & ~3u]
    * 51 LDAF_LW  LDAF_a   b 6 0 11011010111010001110|  err   LD AlignFault. Faulting adr to mtval
    * 52 LH_1     LH_2     1 1 1 01010100001011011001|        Read until q=mem[(rs1+ofs) & ~3u]
    * 53 LDAF_LH  LDAF_a   b 6 0 11011010111010001110|  err   LD AlignFault. Faulting adr to mtval
    * 54 LH_2     LH_3     1 a a 11101011001010011001|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 55 aFaultb  aFault_1 b 6 0 00011110111010010110|  err   LH Load access fault. Faulting adr to mtval
    * 56 LH_4     LH_5     1 1 0 01010111001000011010|        q = (uint16_t) mem[rs1+Iimm]
    * 57 LH_5     LB_6     4 1 0 10100011001000011000|        q = D^0xffffffff^q = D ^ 0x00008000
    * 58 DIV_A    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 59 DIV_B    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 5a SB_1     SB_2     1 3 7 01011101111011011000|        Write d to Q and yy (for sh 0). Prep shift
    * 5b _L5b     JAL_1    4 1 3 00110010000010001110| JAL    J-imm is in q. Branch on alignfault
    * 5c CSRRS_0  CSRRW_1  4 3 0 01001001110110010110| CSRRS  Decoded CSR adr in yy
    * 5d SB_2     SB_3     1 8 7 01101010111011011100|        Repeat shl until shreg = 0 (0,8,16 or 24 times)
    * 5e LHU_1    LHU_2    1 1 1 01110000001011011001|        Read until q=mem[(rs1+ofs) & ~3u]
    * 5f LDAF_LHU LDAF_a   b 6 0 11011010111010001110|  err   LD AlignFault. Faulting adr to mtval
    * 60 DIV_14   ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 61 DIV_15   ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 62 DIV_8    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 63 DIV_9    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 64 SLTIU_0  SLTIX_1  4 1 0 00101011001111011010| SLTIU  Set less than immediate (unsigned)
    * 65 WFI_4    WFI_5    3 5 0 11101111000010010xx0|        Prepare read PC
    * 66 SW_1     SW_2     9 6 0 11110010001110001000|        Write d to a+k until accepted
    * 67 SWE      SW_E2    b 6 0 1001001111001000x110|        Store faulting address alignment to mtval
    * 68 DIV_12   ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 69 DIV_13   ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 6a SB_3     SB_4     4 1 0 01101011000000010110|        Prepare get back address to use 
    * 6b SB_4     SB_5     8 b 0 01111010001100011000|        Address back to Q. Prepare get item to write
    * 6c SLTU_0   SLTX_1   3 1 0 00110001001110010xx0| SLTU   Set less than (unsigned)
    * 6d MULHU_0  ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 6e LHU_3    ANDI_1   4 1 0 00011010000111011010|        Invert q. Prepare read mask
    * 6f MRET_6   MRET_7   2 1 5 1100111100xxxx011100|        ~302 + origImm + 1 for branch decision
    * 70 LHU_2    LHU_3    1 a a 01101110001010011001|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * 71 aFaultc  aFault_1 b 6 0 00011110111010010110|  err   LHU Load access fault. Faulting adr to mtval
    * 72 LBU_3    ANDI_1   4 1 0 00011010000110011010|        Invert q. Prepare read mask
    * 73 BAERR_1  BAERR_2  9 6 0 01110110111100010000|        Faultadr to mtval. Prepare get offset
    * 74 BrOpFet  Fetch2   1 1 d 11110100001011010000| NewOp2 Read until instruction latched
    * 75 BAlignEr BAERR_1  3 1 0 0111001100001000xxx0|  Err   Branch target instruction address misaligned
    * 76 BAERR_2  BAERR_3  4 1 0 01110111000010011000|        ~offset to Q. Prep read (origPC+offset)
    * 77 BAERR_3  BAERR_4  5 3 5 0111110111101000x100|        origPC to mepc. Prep read 0
    * 78 DIV_4    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 79 DIV_5    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 7a SB_5     SW_2     1 6 0 11110010001100001000|        Write d to a+k until accepted
    * 7b _L7b     JAL_1    4 1 3 00110010000010001110| JAL    J-imm is in q. Branch on alignfault
    * 7c CSRRC_0  CSRRW_1  4 3 0 01001001110110010110| CSRRC  Decoded CSR adr in yy
    * 7d BAERR_4  JAL_3    1 c b 0011010011100100x000|        Store 0 to mcause. Prep get trap entry pont
    * 7e NMI_1    NMI_2    9 3 0 1001000011xxxx010000|        Store pc to mepc.
    * 7f JALRE2   BAERR_4  9 6 0 0111110111101000x000|        mtval is target
    * 80 LBU_0    LBU_1    0 0 0 10000101001101011100| LBU    Load unsigned byte. Q = rdadr=RS1+Iimm.
    * 81 JAERR_2  BAERR_4  9 3 0 0111110111101000x000|        Store PC to mepc
    * 82 DIV_1    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 83 DIV_2    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 84 XORI_0   XORI_1   4 1 0 00100001001111011010| XORI   Xor immediate. Q=~Iimm
    * 85 LBU_1    LBU_2    1 1 1 11110000001011011001|        Read until q=mem[(rs1+ofs) & ~3u]
    * 86 JAL_2    JAL_3    7 3 e 0011010001110000x100|        Return address to TRG
    * 87 JALRE1   JALRE2   9 3 0 0111111111110000x000|  err   Store pc to mepc
    * 88 DIV_E    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 89 DIV_F    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 8a ILL_4    ILL_5    2 1 5 10001011001010011100|        Q = 1
    * 8b ILL_5    JAL_3    2 c f 0011010011100100x100|        Store 2 to mcause
    * 8c XOR_0    XOR_1    3 1 0 00101001001111010xx0| XOR    xor
    * 8d DIV_0    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 8e aF_SW_3  LDAF_3   c c b 1001001011001000x100|        Store 7 to mcause
    * 8f ILL_3    ILL_4    b 6 0 10001010111010010110|        Store illegal instruction to mtval
    * 90 NMI_2    JAL_3    b c b 00110100110100010110|        mtval = 0.
    * 91 LDAF_2   LDAF_3   7 c f 1001001011001000x100|        Store 4 to mcause
    * 92 LDAF_3   JAL_3    9 3 0 0011010011100100x000|        PC to mepc
    * 93 SW_E2    SW_E3    9 3 0 10010101111011010000|        Store address that faulted
    * 94 SW_E4    JAL_3    1 c b 0011010011100100x100|        Store 6 to mcause
    * 95 SW_E3    SW_E4    7 1 5 10010100001011011100|        Q = 3
    * 96 SH_1     SH_2     1 3 7 10011010111011011000|        Write d to Q and yy (for sh 0). Prep shift
    * 97 SWH      SW_E2    b 6 0 1001001111001000x110|        Store faulting address alignment to mtval
    * 98 BLT      condb_2  4 3 0 00010011111110010110| BLT    Conditional Branch. Offset to Ryy
    * 99 _L99     ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 9a SH_2     SH_3     1 8 7 10110101111011011100|        Repeat shl until shreg = 0 (0,8 or 24 times)
    * 9b MULHU_1  ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 9c DIV_10   ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 9d DIV_11   ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * 9e SH_4     SH_5     a 9 0 10011111001100011000|        Address back to Q. Prepare get item to write
    * 9f SH_5     SW_2     9 3 0 11110010001100001000|        Write d to a+k until accepted
    * a0 LHU_0    LHU_1    0 4 2 01011110111101011100| LHU    Load unsigned hword. Q = rdadr=RS1+Iimm.
    * a1 ECALL_4  ECALL_5  7 1 5 11001110001010011100|        Q = 4
    * a2 DIVU_5   ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * a3 LB_6     StdIncPc d 3 5 11100110010010010100|        WTRG=(D^0x80)+0xFFFFFF7F+1=(D^0x80)-0x80
    * a4 SRxI_0   SRxI_1   4 0 7 0011101000111100x110| SRxI   Shift Right immediate (both logic/arith here)
    * a5 MRET_3   MRET_4   2 1 5 10101111000110011100|        0x102 + 0xff + 1 = 0x202
    * a6 ECAL_RET ECALL_1  4 1 3 11010000001011001110| ECALL/(U/S/M)RET Select ECALL or (U/S/M)RET
    * a7 EBRKWFI1 EBRKWFI2 2 1 0 0010111000xxxx011100| EBREAK/WFI1 Prepare select EBREAK or WFI
    * a8 DIV_3    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * a9 DIV_6    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * aa ECALL_6  JAL_3    c c b 0011010011100100x100|        mcause = 11
    * ab EBREAK_2 ECALL_6  9 3 0 10101010111010010000|        pc to mepc
    * ac _Lac     SRx_1    3 1 0 0011111100111000xxx0| SRx    Shift Right (both SRL and SRA)
    * ad DIVU_0   ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * ae _Lae     SRx_1    3 1 0 0011111100111000xxx0| SRx    Shift Right (both SRL and SRA)
    * af MRET_4   MRET_5   2 1 5 1100010100xxxx011100|        0x202 + 0xff + 1 = 0x302
    * b0 CSRRW_3  CSRRW_4  7 1 5 10110010001010011100|        Prep emulation entrypt 0x108, here Q to 0x104
    * b1 CSRRS_1  Fetch    3 4 7 11011110xxxxxxxxxxxx|        Not in use
    * b2 CSRRW_4  Fetch    e 6 6 11011110101101001100|        IncPC, OpFetch, but force +4
    * b3 CSRRWI_1 Fetch    3 4 7 11011110xxxxxxxxxxxx|        Not in use
    * b4 CSRRWI_2 Fetch    3 4 7 11011110xxxxxxxxxxxx|        Not in use
    * b5 SH_3     SH_4     4 1 0 10011110000000010110|        Prepare get back address to use 
    * b6 CSRRCI_1 Fetch    3 4 7 11011110xxxxxxxxxxxx|        Not in use
    * b7 IJ_3     IJ_4     c 1 0 10111101001100011100|        Construct Q = 3
    * b8 BGE      condb_2  4 3 0 00010011111110010110| BGE    Conditional Branch. Offset to Ryy
    * b9 DIV_e    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * ba DIV_C    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * bb MULHU_3  ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * bc CSRRWI_0 CSRRW_1  4 3 0 01001001110110010110| CSRRWI Decoded CSR adr in yy
    * bd IJ_4     Fetch    8 6 9 11011110101101001010|        Mask and use as PC
    * be IJ_1     IJ_2     1 1 9 00011111001011011000|        Read until q=mem[(rs1+ofs)&~3u]
    * bf IJT_1    IJT_2    1 1 9 11000001001011011000|        Exit CSR, enter trap
    * c0 DIV_D    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * c1 IJT_2    IJT_3    4 3 0 11101001111010010110|        Read word is to be masked with ~3u
    * c2 DIVU_3   ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * c3 DIVU_4   ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * c4 ORI_0    ORI_1    4 3 0 11100001101111010010| ORI    Or immediate. jj=~Iimm
    * c5 MRET_5   MRET_6   4 1 0 01101111000000011010|        ~302
    * c6 IJT_4    ILL_2    a 3 0 01000111111101011010|        Mask and store to mepc and Q for read of instr
    * c7 QINT_1   QINT_2   9 3 0 1100101111xxxx010000|        Store pc to mepc.
    * c8 DIV_7    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * c9 MRET_2   MRET_3   c 1 0 10100101000110011100|        0xff+3 = 0x102
    * ca DIVU_2   ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * cb QINT_2   StdIncPc b c b 11100110110100010110|        mtval = 0.
    * cc OR_0     OR_1     3 1 0 00100110001111010xx0| OR     or
    * cd REM_0    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * ce ECALL_5  ECALL_6  7 1 5 10101010001010011100|        Q = 8
    * cf MRET_7   MRET_8   3 5 0 01001111000110010xx0|        Prepare emulation entry point 0x104
    * d0 ECALL_1  ECALL_2  2 1 5 00110111000010011100| ECALL  Verify Imm==0x000
    * d1 MRET_1   MRET_2   4 3 0 11001001100110010110| MRET   First save Imm, start build constant for check
    * d2 LB_2     LB_3     1 a a 00000110001010011001|        Repeat shr until shreg == 0 (0,8,16,24 times)
    * d3 aFaultd  aFault_1 b 6 0 00011110111010010110|  err   LB Load access fault. Faulting adr to mtval
    * d4 aFault_2 LDAF_3   2 c f 1001001011001000x100|        Store 5 to mcause
    * d5 eFetch2  Fetch    3 4 7 11011110xxxxxxxxxxxx|  Fr11  Not in use
    * d6 eILL0c   ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * d7 ECALL_3  ECALL_4  b 6 0 10100001111010010110|        mtval = 0, now start the chore of 11 to mcause
    * d8 BLTU     condb_2  4 3 0 00010011111110010110| BLTU   Conditional Branch. Offset to Ryy
    * d9 MULH_3   ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * da LDAF_a   LDAF_2   3 1 0 10010001001010010xx0|        Extra cycle after error detected write mtval
    * db jFault_1 LDAF_3   2 6 5 1001001011001000x100|        Store 1 to mcause
    * dc CSRRSI_0 CSRRW_1  4 3 0 01001001110110010110| CSRRSI Decoded CSR adr in yy
    * dd aF_SW_1  aF_SW_2  b 6 0 11100101111010010110|  err   SW Store access fault. Faulting adr to mtval
    * de Fetch    Fetch2   4 3 d 11110100101011010110|  Fr11  Read and latch instruction
    * df eFetch   Fetch2   4 3 d 11110100101011010110|  Fr11  rep Read until d=mem[(rs1+ofs) & ~3u]
    * e0 DIVU_1   ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * e1 ORI_1    ORI_2    1 1 0 00011101000000011000|        Q = RS1
    * e2 MUL_1    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * e3 MUL_3    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * e4 ANDI_0   ANDI_1   4 1 0 00011010001111011010| ANDI   And immediate. Q=~Iimm
    * e5 aF_SW_2  aF_SW_3  7 1 5 10001110001010011100|        Q = 4
    * e6 StdIncPc Fetch    e 6 6 11011110101101001100|  Fr11  IncPC, OpFetch
    * e7 aFault   aFault_1 b 6 0 00011110111010010110|  err   Load access fault. Faulting adr to mtval
    * e8 MUL_2    ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * e9 IJT_3    IJT_4    c 1 0 11000110001100011100|        Construct Q = 3
    * ea MULHU_5  ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * eb LH_3     LH_4     4 1 0 01010110000111011010|        q = ~mem[rs1+ofs]
    * ec AND_0    AND_1    3 1 0 00010001001111010xx0| AND    And 
    * ed REMU_0   ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * ee eILL0a   ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * ef WFI_5    Fetch    e 6 6 11011110101101001100|        IncPC, OpFetch
    * f0 LBU_2    LBU_3    1 a a 01110010001010011001|        Repeat shr until shreg = 0 (0, 8 or 16 times)
    * f1 aFaulte  aFault_1 b 6 0 00011110111010010110|  err   LBU Load access fault. Faulting adr to mtval
    * f2 SW_2     StdIncPc 3 1 0 11100110000010010xx0|        Prepare read PC
    * f3 aF_SW    aF_SW_1  3 1 0 1101110100xxxx001xx0|  err   SW/SH/SB access fault. Rest to set SEL_O=4'hf
    * f4 Fetch2   eFetch3  5 6 0 00010010100001110100|  Fr11  Update ttime. Update I. Q=immediate. Use dinx
    * f5 jFault   jFault_1 b 6 0 11011011111010010110|  err   Fetch access fault. Faulting adr to mtval
    * f6 WFI_1    WFI_2    7 1 5 11111010000000011100| WFI    To check offset
    * f7 EBREAK_1 EBREAK_2 b 6 0 10101011110010010110| EBREAK mepc = pc, store 0 to mtval
    * f8 BGEU     condb_2  4 3 0 00010011111110010110| BGEU   Conditional Branch. Offset to Ryy
    * f9 MULH_2   ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * fa WFI_2    WFI_3    2 1 5 01000101001010011100|        Check offset
    * fb MULH_1   ILLe     3 1 0 1111111000xxxx00xxx0| Illegal instruction seen
    * fc CSRRCI_0 CSRRW_1  4 3 0 01001001110110010110| CSRRCI Decoded CSR adr in yy
    * fd NMI_0    NMI_1    3 1 0 01111110000010010xx0| NMI    Get current PC
    * fe ILLe     ILL_1    3 1 0 01000110000010010xx0| Illegal
    * ff QINT_0   QINT_1   3 1 0 11000111000010010xx0| INT    Get current PC
    */
   localparam u0_0 = 256'h64960390e00043986c92ab9c3158ab9c915a719a408864946090e35c22d9135c;
   localparam u0_1 = 256'h7e96429c649662ce208e64921a943f964b5ceb4e6318509c43d80bdca39833d8;
   localparam u0_2 = 256'h64967992e000e38000146b9c13986b9cd01c7b90408853c66090e00064902f5c;
   localparam u0_3 = 256'ha3c053c036999d96208ed699e0003f967c1036dc66d8eb481c846c94b3d86496;
   localparam u0_4 = 256'h629ce000e00013900288639cb01c639cf2d87f58529cb3dae000e000b01c035c;
   localparam u0_5 = 256'hae8e02d9aedc9d96208eded8e000e0003218721aee96b299ae8e42d9ae8e66d0;
   localparam u0_6 = 256'hf01ca1dae0001390a318b016e000e0003c862388f090b3dae000e000e000e000;
   localparam u0_7 = 256'hde800c104e409d96208e2308e000e000de847098308042d06f10a19aee96e299;
   localparam u0_8 = 256'hae962c84e00093d04e44b29ce000e000ff00470402d913dae000e000de80535c;
   localparam u0_9 = 256'h2308f318e000e000e0005edce0003f963c86aed842dc4e445ed04e402c844d16;
   localparam u0_A = 256'h501cf380e000f380ae904e44e000e000e01c02cef19ca3c66494e000e29cef5c;
   localparam u0_B = 256'h12d8f2d8eb4a9d96e000e000e0003f96d31ce000e016e000e000eb4ce000229c;
   localparam u0_C = 256'hf190a29ce00063d06d16e000519ce000bc107f5af01a1bd2e000e0009e96e000;
   localparam u0_D = 256'h4ad64ad65e969d962c841290e0003f961e96e000e0002c84ee9662999996709c;
   localparam u0_E = 256'heb4ce000e00013d061dae000631ce000ee96eb4ce29ca3dae000e000d018e000;
   localparam u0_F = 256'h70906090e0909d96e000529ce0003f96bc96a01cbe962874d0086090ee962299;
   localparam u1_0 = 256'h430e3101310f110013382405410a2405110041003100230e310e222b111d0000;
   localparam u1_1 = 256'h430b715d130e412a4133130e230443010637666d15012151410153404101410a;
   localparam u1_2 = 256'h430e470f310f310321532429410224292101430231004073310e310f430e0425;
   localparam u1_3 = 256'h1073107318a04304413313a3310f4301970d18701373869d560823084102438e;
   localparam u1_4 = 256'h215e310f310f310396bb0936215409361198a30421564102310f310f21500135;
   localparam u1_5 = 256'hb60d11171876430441331375310f310f410a1105b6011aaeb60d1115b60d13ce;
   localparam u1_6 = 256'h215c4101310f31038b074106310f310fb609960f350e4102310f310f310f310f;
   localparam u1_7 = 256'h960793091cb343044133160f310f310f53574107310711df96074101b6011aa6;
   localparam u1_8 = 256'hb608ccb9310f31022cf32158310f310f930773e3111f4102310f310f93070008;
   localparam u1_9 = 256'h930fa909310f310f310f187b310f4301b609137971591cb3930993037cf9bcb3;
   localparam u1_A = 256'h215c3103310f3103930accb3310f310f2102413d215a4073d35e310f715c0425;
   localparam u1_B = 256'h119c1191869d4304310f310f310f4301c10b347d4109347d347de66d347d715b;
   localparam u1_C = 256'h3504715a310f3102bcbe310fc10a310f930ca3044106430e310f310f430e310f;
   localparam u1_D = 256'h43df43dfb60e430426593109310f4301b60a310f347d2cf9b6011aa0430c2153;
   localparam u1_E = 256'he66d310f310f31014105310fc10c310fb601e66d71584101310f310f1101310f;
   localparam u1_F = 256'h310c310431074304310f2154310f4301b60a715fb60d5601310d310eb6011aa7;
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
   assign d[4] = indir[1];
   assign d[5] = indir[2];
   assign d[8] = indir[3];
   assign d[9] = indir[4];
   assign d[10] = indir[5];
   assign d[14] = indir[6];
   assign d[15] = indir[7];
   assign d[16] = indir[8];
   assign d[17] = indir[9];
   assign d[20] = indir[10];
   assign d[21] = indir[11];
   assign d[38] = indir[12];
   assign d[39] = indir[13];
   assign d[40] = indir[14];
   assign d[41] = indir[15];
   assign d[42] = indir[16];
   assign d[43] = indir[17];
   assign d[44] = indir[18];
   assign d[45] = indir[19];
   // replaces = 0000000011000001101011110000000010000010000110
   SB_LUT4 #(.LUT_INIT(16'hc170)) cmb_d01(.O(d[1]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'hc070)) cmb_d02(.O(d[2]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h2000)) cmb_d07(.O(d[7]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'hfb7f)) cmb_d13(.O(d[13]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0010)) cmb_d22(.O(d[22]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h000c)) cmb_d23(.O(d[23]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0008)) cmb_d24(.O(d[24]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h3242)) cmb_d25(.O(d[25]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h2002)) cmb_d27(.O(d[27]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h8800)) cmb_d29(.O(d[29]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h3000)) cmb_d30(.O(d[30]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h0000)) cmb_d36(.O(d[36]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   SB_LUT4 #(.LUT_INIT(16'h4000)) cmb_d37(.O(d[37]),.I3(indir[23]),.I2(indir[22]),.I1(indir[21]),.I0(indir[20]));
   // replaces = 0000000000001010010100000010000001000001000000
   SB_LUT4 #(.LUT_INIT(16'h00a0)) cmb_d06(.O(d[6]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1fee)) cmb_d12(.O(d[12]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1840)) cmb_d19(.O(d[19]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0500)) cmb_d26(.O(d[26]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h1004)) cmb_d28(.O(d[28]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0e27)) cmb_d31(.O(d[31]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   SB_LUT4 #(.LUT_INIT(16'h0a00)) cmb_d33(.O(d[33]),.I3(indir[27]),.I2(indir[26]),.I1(indir[25]),.I0(indir[24]));
   // replaces = 0000000000110100000000000001000000100000001000
   SB_LUT4 #(.LUT_INIT(16'h0702)) cmb_d03(.O(d[3]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h2f37)) cmb_d11(.O(d[11]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h0e20)) cmb_d18(.O(d[18]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h4541)) cmb_d32(.O(d[32]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h70a5)) cmb_d34(.O(d[34]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   SB_LUT4 #(.LUT_INIT(16'h6080)) cmb_d35(.O(d[35]),.I3(indir[31]),.I2(indir[30]),.I1(indir[29]),.I0(indir[28]));
   assign d[46] = 1'b0;
   assign d[47] = 1'b0;
endmodule
