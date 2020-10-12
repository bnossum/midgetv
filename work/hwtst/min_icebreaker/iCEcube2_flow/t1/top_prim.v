// Verilog netlist produced by program LSE :  version Diamond Version 0.0.0
// Netlist written on Mon Oct 12 16:04:36 2020
//
// Verilog Description of module top
//

module top (CLK, RX, TX, LED1, LED2, LED3, LED4) /* synthesis syn_module_defined=1 */ ;   // ../../min_icebreaker.v(46[8:11])
    input CLK;   // ../../min_icebreaker.v(57[12:15])
    input RX;   // ../../min_icebreaker.v(58[12:14])
    output TX;   // ../../min_icebreaker.v(59[12:14])
    output LED1;   // ../../min_icebreaker.v(60[12:16])
    output LED2;   // ../../min_icebreaker.v(61[12:16])
    output LED3;   // ../../min_icebreaker.v(62[12:16])
    output LED4;   // ../../min_icebreaker.v(63[12:16])
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    wire GND_net, VCC_net, RX_c, TX_c, LED1_c, LED2_c, LED3_c, 
        LED4_c;
    wire [31:0]ADR_O;   // ../../min_icebreaker.v(68[25:30])
    wire [31:0]DAT_O;   // ../../min_icebreaker.v(70[25:30])
    wire [3:0]SEL_O;   // ../../min_icebreaker.v(71[25:30])
    
    wire STB_O, WE_O, meta_usartRX, uart_ACK_O, ACK_I, bluesource_is_uart, 
        LED1_N_4, corerunning, n2345;
    wire [31:0]rDee;   // ../../../../code/m_midgetv_core.v(548[25:29])
    
    wire n3490, n5223;
    
    VCC i2 (.Y(VCC_net));
    SB_LUT4 led_ACK_O_I_0_2_lut (.I0(ADR_O[2]), .I1(ADR_O[3]), .I2(GND_net), 
            .I3(GND_net), .O(n2345));   // ../../min_icebreaker.v(119[24:46])
    defparam led_ACK_O_I_0_2_lut.LUT_INIT = 16'heeee;
    m_LEDs i_LEDs (.LED1_N_4(LED1_N_4), .bluesource_is_uart(bluesource_is_uart), 
           .GND_net(GND_net), .\DAT_O[2] (DAT_O[2]), .DAT_O({meta_usartRX}), 
           .\DAT_O[0] (DAT_O[0]), .LED1_c(LED1_c), .CLK_c(CLK_c), .LED3_c(LED3_c), 
           .\DAT_O[3] (DAT_O[3]), .LED4_c(LED4_c), .\DAT_O[1] (DAT_O[1]), 
           .LED2_c(LED2_c), .WE_O(WE_O), .\ADR_O[2] (ADR_O[2]), .STB_O(STB_O), 
           .n3490(n3490)) /* synthesis syn_module_defined=1 */ ;   // ../../min_icebreaker.v(145[11] 162[56])
    m_midgetv_core_renamed_due_excessive_length_1 inst_midgetv_core (.GND_net(GND_net), 
            .\ADR_O[3] (ADR_O[3]), .\ADR_O[2] (ADR_O[2]), .corerunning(corerunning), 
            .VCC_net(VCC_net), .CLK_c(CLK_c), .STB_O(STB_O), .ACK_I(ACK_I), 
            .\SEL_O[3] (SEL_O[3]), .WE_O(WE_O), .n2345(n2345), .DAT_O({DAT_O[31], 
            Open_0, Open_1, Open_2, Open_3, Open_4, Open_5, Open_6, 
            Open_7, Open_8, Open_9, Open_10, Open_11, Open_12, Open_13, 
            Open_14, Open_15, Open_16, Open_17, Open_18, Open_19, 
            Open_20, Open_21, Open_22, Open_23, Open_24, Open_25, 
            Open_26, Open_27, Open_28, Open_29, Open_30}), .\rDee[8] (rDee[8]), 
            .\DAT_O[3] (DAT_O[3]), .\DAT_O[2] (DAT_O[2]), .\DAT_O[1] (DAT_O[1]), 
            .\DAT_O[0] (DAT_O[0]), .n5223(n5223)) /* synthesis syn_module_defined=1 */ ;   // ../../min_icebreaker.v(183[4] 202[49])
    SB_LUT4 i1538_2_lut_3_lut (.I0(STB_O), .I1(ADR_O[2]), .I2(ADR_O[3]), 
            .I3(GND_net), .O(ACK_I));   // ../../min_icebreaker.v(119[24:46])
    defparam i1538_2_lut_3_lut.LUT_INIT = 16'ha8a8;
    SB_LUT4 i2321_4_lut (.I0(bluesource_is_uart), .I1(DAT_O[31]), .I2(SEL_O[3]), 
            .I3(LED1_N_4), .O(n3490));   // ../../min_icebreaker.v(254[11] 261[9])
    defparam i2321_4_lut.LUT_INIT = 16'hcaaa;
    SB_LUT4 STB_O_I_0_2_lut (.I0(STB_O), .I1(ADR_O[3]), .I2(GND_net), 
            .I3(GND_net), .O(uart_ACK_O));   // ../../min_icebreaker.v(118[32:48])
    defparam STB_O_I_0_2_lut.LUT_INIT = 16'h8888;
    SB_LUT4 i11_4_lut (.I0(rDee[8]), .I1(meta_usartRX), .I2(corerunning), 
            .I3(uart_ACK_O), .O(n5223));   // ../../../../code/m_inputmux.v(89[17] 91[28])
    defparam i11_4_lut.LUT_INIT = 16'hca0a;
    SB_IO RX_pad (.PACKAGE_PIN(RX), .OUTPUT_ENABLE(VCC_net), .D_IN_0(RX_c)) /* synthesis IO_FF_IN=TRUE */ ;   // /home/bnossum/lscc/iCEcube2.2017.08/LSE/userware/unix/SYNTHESIS_HEADERS/sb_ice40.v(502[8:13])
    defparam RX_pad.PIN_TYPE = 6'b000001;
    defparam RX_pad.PULLUP = 1'b0;
    defparam RX_pad.NEG_TRIGGER = 1'b0;
    defparam RX_pad.IO_STANDARD = "SB_LVCMOS";
    SB_GB_IO CLK_pad (.PACKAGE_PIN(CLK), .OUTPUT_ENABLE(VCC_net), .GLOBAL_BUFFER_OUTPUT(CLK_c));   // ../../min_icebreaker.v(57[12:15])
    defparam CLK_pad.PIN_TYPE = 6'b000001;
    defparam CLK_pad.PULLUP = 1'b0;
    defparam CLK_pad.NEG_TRIGGER = 1'b0;
    defparam CLK_pad.IO_STANDARD = "SB_LVCMOS";
    SB_IO LED4_pad (.PACKAGE_PIN(LED4), .OUTPUT_ENABLE(VCC_net), .D_OUT_0(LED4_c)) /* synthesis IO_FF_OUT=TRUE */ ;   // /home/bnossum/lscc/iCEcube2.2017.08/LSE/userware/unix/SYNTHESIS_HEADERS/sb_ice40.v(502[8:13])
    defparam LED4_pad.PIN_TYPE = 6'b011001;
    defparam LED4_pad.PULLUP = 1'b0;
    defparam LED4_pad.NEG_TRIGGER = 1'b0;
    defparam LED4_pad.IO_STANDARD = "SB_LVCMOS";
    SB_IO LED3_pad (.PACKAGE_PIN(LED3), .OUTPUT_ENABLE(VCC_net), .D_OUT_0(LED3_c)) /* synthesis IO_FF_OUT=TRUE */ ;   // /home/bnossum/lscc/iCEcube2.2017.08/LSE/userware/unix/SYNTHESIS_HEADERS/sb_ice40.v(502[8:13])
    defparam LED3_pad.PIN_TYPE = 6'b011001;
    defparam LED3_pad.PULLUP = 1'b0;
    defparam LED3_pad.NEG_TRIGGER = 1'b0;
    defparam LED3_pad.IO_STANDARD = "SB_LVCMOS";
    SB_IO LED2_pad (.PACKAGE_PIN(LED2), .OUTPUT_ENABLE(VCC_net), .D_OUT_0(LED2_c)) /* synthesis IO_FF_OUT=TRUE */ ;   // /home/bnossum/lscc/iCEcube2.2017.08/LSE/userware/unix/SYNTHESIS_HEADERS/sb_ice40.v(502[8:13])
    defparam LED2_pad.PIN_TYPE = 6'b011001;
    defparam LED2_pad.PULLUP = 1'b0;
    defparam LED2_pad.NEG_TRIGGER = 1'b0;
    defparam LED2_pad.IO_STANDARD = "SB_LVCMOS";
    SB_IO LED1_pad (.PACKAGE_PIN(LED1), .OUTPUT_ENABLE(VCC_net), .D_OUT_0(LED1_c)) /* synthesis IO_FF_OUT=TRUE */ ;   // /home/bnossum/lscc/iCEcube2.2017.08/LSE/userware/unix/SYNTHESIS_HEADERS/sb_ice40.v(502[8:13])
    defparam LED1_pad.PIN_TYPE = 6'b011001;
    defparam LED1_pad.PULLUP = 1'b0;
    defparam LED1_pad.NEG_TRIGGER = 1'b0;
    defparam LED1_pad.IO_STANDARD = "SB_LVCMOS";
    SB_IO TX_pad (.PACKAGE_PIN(TX), .OUTPUT_ENABLE(VCC_net), .D_OUT_0(TX_c)) /* synthesis IO_FF_OUT=TRUE */ ;   // /home/bnossum/lscc/iCEcube2.2017.08/LSE/userware/unix/SYNTHESIS_HEADERS/sb_ice40.v(502[8:13])
    defparam TX_pad.PIN_TYPE = 6'b011001;
    defparam TX_pad.PULLUP = 1'b0;
    defparam TX_pad.NEG_TRIGGER = 1'b0;
    defparam TX_pad.IO_STANDARD = "SB_LVCMOS";
    m_BBUART i_BBUART (.\DAT_O[0] (DAT_O[0]), .TX_c(TX_c), .CLK_c(CLK_c), 
            .STB_O(STB_O), .\ADR_O[3] (ADR_O[3]), .WE_O(WE_O), .GND_net(GND_net), 
            .RX_c(RX_c), .DAT_O({meta_usartRX})) /* synthesis syn_module_defined=1 */ ;   // ../../min_icebreaker.v(128[13] 141[49])
    GND i1 (.Y(GND_net));
    
endmodule
//
// Verilog Description of module m_LEDs
//

module m_LEDs (LED1_N_4, bluesource_is_uart, GND_net, \DAT_O[2] , DAT_O, 
            \DAT_O[0] , LED1_c, CLK_c, LED3_c, \DAT_O[3] , LED4_c, 
            \DAT_O[1] , LED2_c, WE_O, \ADR_O[2] , STB_O, n3490) /* synthesis syn_module_defined=1 */ ;
    output LED1_N_4;
    output bluesource_is_uart;
    input GND_net;
    input \DAT_O[2] ;
    input [0:0]DAT_O;
    input \DAT_O[0] ;
    output LED1_c;
    input CLK_c;
    output LED3_c;
    input \DAT_O[3] ;
    output LED4_c;
    input \DAT_O[1] ;
    output LED2_c;
    input WE_O;
    input \ADR_O[2] ;
    input STB_O;
    input n3490;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    wire n2766, n2349;
    
    SB_LUT4 i1_2_lut (.I0(LED1_N_4), .I1(bluesource_is_uart), .I2(GND_net), 
            .I3(GND_net), .O(n2766));
    defparam i1_2_lut.LUT_INIT = 16'heeee;
    SB_LUT4 i1541_3_lut (.I0(\DAT_O[2] ), .I1(DAT_O[0]), .I2(bluesource_is_uart), 
            .I3(GND_net), .O(n2349));   // ../../min_icebreaker.v(263[11] 267[25])
    defparam i1541_3_lut.LUT_INIT = 16'h3a3a;
    SB_DFFE LED1_22 (.Q(LED1_c), .C(CLK_c), .E(LED1_N_4), .D(\DAT_O[0] ));   // ../../min_icebreaker.v(254[11] 261[9])
    SB_DFFE LED3_26 (.Q(LED3_c), .C(CLK_c), .E(n2766), .D(n2349));   // ../../min_icebreaker.v(263[11] 267[25])
    SB_DFFE LED4_24 (.Q(LED4_c), .C(CLK_c), .E(LED1_N_4), .D(\DAT_O[3] ));   // ../../min_icebreaker.v(254[11] 261[9])
    SB_DFFE LED2_23 (.Q(LED2_c), .C(CLK_c), .E(LED1_N_4), .D(\DAT_O[1] ));   // ../../min_icebreaker.v(254[11] 261[9])
    SB_LUT4 i2_3_lut (.I0(WE_O), .I1(\ADR_O[2] ), .I2(STB_O), .I3(GND_net), 
            .O(LED1_N_4));   // ../../min_icebreaker.v(255[11:23])
    defparam i2_3_lut.LUT_INIT = 16'h8080;
    SB_DFF bluesource_is_uart_25 (.Q(bluesource_is_uart), .C(CLK_c), .D(n3490));   // ../../min_icebreaker.v(254[11] 261[9])
    
endmodule
//
// Verilog Description of module m_midgetv_core_renamed_due_excessive_length_1
//

module m_midgetv_core_renamed_due_excessive_length_1 (GND_net, \ADR_O[3] , 
            \ADR_O[2] , corerunning, VCC_net, CLK_c, STB_O, ACK_I, 
            \SEL_O[3] , WE_O, n2345, DAT_O, \rDee[8] , \DAT_O[3] , 
            \DAT_O[2] , \DAT_O[1] , \DAT_O[0] , n5223) /* synthesis syn_module_defined=1 */ ;
    input GND_net;
    output \ADR_O[3] ;
    output \ADR_O[2] ;
    output corerunning;
    input VCC_net;
    input CLK_c;
    output STB_O;
    input ACK_I;
    output \SEL_O[3] ;
    output WE_O;
    input n2345;
    output [31:0]DAT_O;
    output \rDee[8] ;
    output \DAT_O[3] ;
    output \DAT_O[2] ;
    output \DAT_O[1] ;
    output \DAT_O[0] ;
    input n5223;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    wire [47:0]d;   // ../../../../generated/m_2ebr.v(56[18:19])
    wire [31:0]ADR_O;   // ../../../../code/m_midgetv_core.v(405[24:29])
    wire [31:0]INSTR;   // ../../../../code/m_midgetv_core.v(502[25:30])
    wire [9:0]Wai;   // ../../../../code/m_midgetv_core.v(509[27:30])
    wire [7:0]rinx;   // ../../../../code/m_midgetv_core.v(550[25:29])
    wire [7:0]minx;   // ../../../../code/m_midgetv_core.v(529[25:29])
    wire [6:0]FUNC7;   // ../../../../code/m_midgetv_core.v(501[25:30])
    wire [1:0]s_cyclecnt;   // ../../../../code/m_midgetv_core.v(555[25:35])
    wire [31:0]B;   // ../../../../code/m_midgetv_core.v(497[25:26])
    
    wire is_brcond, buserror, mostofminx0, progress_ucode;
    wire [1:0]s_alu_carryin;   // ../../../../code/m_midgetv_core.v(554[25:38])
    wire [1:0]s_shift;   // ../../../../code/m_midgetv_core.v(556[25:32])
    wire [2:0]s_alu;   // ../../../../code/m_midgetv_core.v(553[25:30])
    wire [3:0]i;   // ../../../../code/m_ice_shortcuts.v(60[17:18])
    
    wire sram_stb;
    wire [9:0]Rai;   // ../../../../code/m_midgetv_core.v(505[27:30])
    wire [3:0]bmask;   // ../../../../code/m_midgetv_core.v(514[25:30])
    
    wire rlastshift, iwe, enaQ;
    wire [31:0]Di;   // ../../../../code/m_midgetv_core.v(498[25:27])
    
    wire sra_msb;
    wire [31:0]DAT_O_c;   // ../../min_icebreaker.v(70[25:30])
    
    wire rzcy32;
    wire [31:0]QQ;   // ../../../../code/m_midgetv_core.v(504[25:27])
    wire [3:0]i_adj_312;   // ../../../../code/m_ice_shortcuts.v(60[17:18])
    
    wire alu_carryout, A31, alu_carryin;
    
    \m_wai(EBRADRWIDTH=10)  inst_wai (.GND_net(GND_net), .\ADR_O[3] (\ADR_O[3] ), 
            .sa25(d[27]), .sa27(d[29]), .\ADR_O[4] (ADR_O[4]), .\INSTR[9] (INSTR[9]), 
            .sa26(d[28]), .Wai({Wai}), .\ADR_O[5] (ADR_O[5]), .\INSTR[10] (INSTR[10]), 
            .\ADR_O[6] (ADR_O[6]), .\INSTR[11] (INSTR[11]), .\ADR_O[7] (ADR_O[7]), 
            .\INSTR[7] (INSTR[7]), .\ADR_O[2] (\ADR_O[2] ), .sa24(d[26]), 
            .\INSTR[8] (INSTR[8]), .\ADR_O[8] (ADR_O[8]), .\ADR_O[9] (ADR_O[9]), 
            .\ADR_O[10] (ADR_O[10]), .\ADR_O[11] (ADR_O[11])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_midgetv_core.v(971[4] 982[48])
    \m_ucodepc(MULDIV=0)  inst_ucodepc (.rinx({rinx}), .\INSTR[4] (INSTR[4]), 
            .\minx[2] (minx[2]), .\INSTR[3] (INSTR[3]), .FUNC7({FUNC7}), 
            .\INSTR[6] (INSTR[6]), .\INSTR[5] (INSTR[5]), .\INSTR[2] (INSTR[2]), 
            .\minx[1] (minx[1]), .\s_cyclecnt[0] (s_cyclecnt[0]), .corerunning(corerunning), 
            .GND_net(GND_net), .sa32(d[33]), .sa15(d[17]), .sa30(d[32]), 
            .sa37(d[14]), .\B[0] (B[0]), .sa29(d[31]), .is_brcond(is_brcond), 
            .\B[1] (B[1]), .\B[31] (B[31]), .buserror(buserror), .mostofminx0(mostofminx0), 
            .\INSTR[14] (INSTR[14]), .\minx[7] (minx[7]), .\INSTR[13] (INSTR[13]), 
            .\minx[6] (minx[6]), .\INSTR[12] (INSTR[12]), .\minx[5] (minx[5]), 
            .\minx[4] (minx[4]), .\minx[3] (minx[3]), .\INSTR[9] (INSTR[9]), 
            .\INSTR[18] (INSTR[18]), .\INSTR[19] (INSTR[19]), .\INSTR[8] (INSTR[8]), 
            .\INSTR[15] (INSTR[15]), .\INSTR[10] (INSTR[10]), .\INSTR[11] (INSTR[11]), 
            .\INSTR[17] (INSTR[17]), .\INSTR[7] (INSTR[7]), .\INSTR[16] (INSTR[16]), 
            .\INSTR[0] (INSTR[0]), .\INSTR[1] (INSTR[1])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_midgetv_core.v(1167[6] 1192[57])
    m_ucode inst_ucode (.GND_net(GND_net), .VCC_net(VCC_net), .CLK_c(CLK_c), 
            .\minx[7] (minx[7]), .\minx[6] (minx[6]), .\minx[5] (minx[5]), 
            .\minx[4] (minx[4]), .\minx[3] (minx[3]), .\minx[2] (minx[2]), 
            .\minx[1] (minx[1]), .mostofminx0(mostofminx0), .progress_ucode(progress_ucode), 
            .sa43(d[41]), .sa42(d[40]), .sa41(d[39]), .sa27(d[29]), 
            .sa26(d[28]), .sa25(d[27]), .sa24(d[26]), .sa23(d[25]), 
            .sa22(d[24]), .sa21(d[23]), .sa00(d[8]), .s_alu_carryin({s_alu_carryin}), 
            .sa20(d[22]), .s_shift({s_shift}), .s_cyclecnt({s_cyclecnt}), 
            .sa15(d[17]), .sa14(d[16]), .s_alu({s_alu}), .rinx({rinx}), 
            .sa37(d[14]), .is_valid_instrhigh(d[15]), .sa29(d[31]), .sa30(d[32]), 
            .sa32(d[33]), .sa33(d[34]), .sa34(d[35]), .sa40(d[38])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_midgetv_core.v(1122[6] 1164[58])
    m_shiftcounter inst_shiftcounter (.CLK_c(CLK_c), .s_shift({s_shift}), 
            .VCC_net(VCC_net), .\B[0] (B[0]), .lastshift(i[0]), .\B[4] (B[4]), 
            .\B[1] (B[1]), .GND_net(GND_net), .\B[3] (B[3]), .\B[2] (B[2])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_midgetv_core.v(1037[6] 1048[50])
    \m_rai(EBRADRWIDTH=10)  inst_rai (.sa34(d[35]), .sa40(d[38]), .STB_O(STB_O), 
            .sram_stb(sram_stb), .GND_net(GND_net), .ACK_I(ACK_I), .sa20(d[22]), 
            .sa23(d[25]), .sa22(d[24]), .sa21(d[23]), .\INSTR[15] (INSTR[15]), 
            .\INSTR[20] (INSTR[20]), .\B[2] (B[2]), .Rai({Rai}), .\INSTR[16] (INSTR[16]), 
            .\INSTR[21] (INSTR[21]), .\B[3] (B[3]), .\INSTR[17] (INSTR[17]), 
            .\INSTR[22] (INSTR[22]), .\B[4] (B[4]), .\INSTR[18] (INSTR[18]), 
            .\INSTR[23] (INSTR[23]), .\B[5] (B[5]), .\INSTR[19] (INSTR[19]), 
            .\INSTR[24] (INSTR[24]), .\B[6] (B[6]), .\B[7] (B[7]), .\B[8] (B[8]), 
            .\B[9] (B[9]), .\B[10] (B[10]), .\B[11] (B[11])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_midgetv_core.v(949[4] 967[52])
    \m_progressctrl(MULDIV=0,MTIMETAP_LOWLIM=14,DISREGARD_WB4_3_55=1)  inst_progressctrl (.corerunning(corerunning), 
            .sa30(d[32]), .\B[1] (B[1]), .\B[0] (B[0]), .sram_stb(sram_stb), 
            .CLK_c(CLK_c), .buserror(buserror), .STB_O(STB_O), .sa43(d[41]), 
            .GND_net(GND_net), .\B[31] (B[31]), .\B[30] (B[30]), .bmask({bmask}), 
            .\SEL_O[3] (\SEL_O[3] ), .sa41(d[39]), .rlastshift(rlastshift), 
            .iwe(iwe), .WE_O(WE_O), .sa15(d[17]), .lastshift(i[0]), 
            .sa32(d[33]), .enaQ(enaQ), .sa24(d[26]), .sa27(d[29]), .sa26(d[28]), 
            .sa25(d[27]), .sa33(d[34]), .progress_ucode(progress_ucode), 
            .n2345(n2345), .sa14(d[16]), .sa42(d[40])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_midgetv_core.v(1064[4] 1119[48])
    \m_opreg(RVC=0)  inst_opreg (.CLK_c(CLK_c), .is_valid_instrhigh(d[15]), 
            .Di({Di}), .\INSTR[14] (INSTR[14]), .\INSTR[13] (INSTR[13]), 
            .\INSTR[12] (INSTR[12]), .\INSTR[11] (INSTR[11]), .\INSTR[10] (INSTR[10]), 
            .\INSTR[9] (INSTR[9]), .\INSTR[8] (INSTR[8]), .\INSTR[7] (INSTR[7]), 
            .\INSTR[6] (INSTR[6]), .\INSTR[5] (INSTR[5]), .\INSTR[4] (INSTR[4]), 
            .\INSTR[3] (INSTR[3]), .\INSTR[2] (INSTR[2]), .\INSTR[1] (INSTR[1]), 
            .\INSTR[0] (INSTR[0]), .FUNC7({FUNC7}), .\INSTR[24] (INSTR[24]), 
            .\INSTR[23] (INSTR[23]), .\INSTR[22] (INSTR[22]), .\INSTR[21] (INSTR[21]), 
            .\INSTR[20] (INSTR[20]), .\INSTR[19] (INSTR[19]), .\INSTR[18] (INSTR[18]), 
            .\INSTR[17] (INSTR[17]), .\INSTR[16] (INSTR[16]), .\INSTR[15] (INSTR[15])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_midgetv_core.v(998[6] 1011[53])
    \m_mimux(HIGHLEVEL=0)  inst_mimux (.sra_msb(sra_msb), .DAT_O({DAT_O[31], 
            DAT_O_c[30:4], \DAT_O[3] , \DAT_O[2] , \DAT_O[1] , \DAT_O[0] }), 
            .GND_net(GND_net), .Di({Di}), .CLK_c(CLK_c), .sa00(d[8]), 
            .ACK_I(ACK_I), .corerunning(corerunning), .\ADR_O[31] (ADR_O[31]), 
            .\ADR_O[30] (ADR_O[30]), .\ADR_O[29] (ADR_O[29]), .\ADR_O[28] (ADR_O[28]), 
            .\ADR_O[27] (ADR_O[27]), .\ADR_O[26] (ADR_O[26]), .\ADR_O[25] (ADR_O[25]), 
            .\ADR_O[24] (ADR_O[24]), .\ADR_O[23] (ADR_O[23]), .\ADR_O[22] (ADR_O[22]), 
            .\ADR_O[21] (ADR_O[21]), .\ADR_O[20] (ADR_O[20]), .\ADR_O[19] (ADR_O[19]), 
            .\ADR_O[18] (ADR_O[18]), .\ADR_O[17] (ADR_O[17]), .\ADR_O[16] (ADR_O[16]), 
            .\ADR_O[15] (ADR_O[15]), .\ADR_O[14] (ADR_O[14]), .\ADR_O[13] (ADR_O[13]), 
            .\ADR_O[12] (ADR_O[12]), .\ADR_O[11] (ADR_O[11]), .\ADR_O[10] (ADR_O[10]), 
            .\ADR_O[9] (ADR_O[9]), .\rDee[8] (\rDee[8] ), .\ADR_O[8] (ADR_O[8]), 
            .\ADR_O[7] (ADR_O[7]), .\ADR_O[6] (ADR_O[6]), .\ADR_O[5] (ADR_O[5]), 
            .\ADR_O[4] (ADR_O[4]), .\ADR_O[3] (\ADR_O[3] ), .\ADR_O[2] (\ADR_O[2] ), 
            .\ADR_O[1] (ADR_O[1])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_midgetv_core.v(770[4] 784[54])
    \m_inputmux(HIGHLEVEL=0,MTIMETAP_LOWLIM=14)  inst_inputmux (.n5223(n5223), 
            .VCC_net(VCC_net), .\rDee[8] (\rDee[8] ), .CLK_c(CLK_c)) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_midgetv_core.v(740[4] 767[61])
    m_immexp_zfind_q inst_immexp_zfind_q (.\INSTR[8] (INSTR[8]), .\INSTR[9] (INSTR[9]), 
            .\INSTR[10] (INSTR[10]), .\INSTR[11] (INSTR[11]), .B({B}), 
            .FUNC7({FUNC7}), .\INSTR[20] (INSTR[20]), .\INSTR[12] (INSTR[12]), 
            .\INSTR[13] (INSTR[13]), .\INSTR[14] (INSTR[14]), .\INSTR[15] (INSTR[15]), 
            .\INSTR[16] (INSTR[16]), .\INSTR[17] (INSTR[17]), .\INSTR[18] (INSTR[18]), 
            .\INSTR[19] (INSTR[19]), .\INSTR[21] (INSTR[21]), .\INSTR[22] (INSTR[22]), 
            .\INSTR[23] (INSTR[23]), .\INSTR[24] (INSTR[24]), .GND_net(GND_net), 
            .CLK_c(CLK_c), .enaQ(enaQ), .\ADR_O[1] (ADR_O[1]), .\ADR_O[2] (\ADR_O[2] ), 
            .\ADR_O[3] (\ADR_O[3] ), .\ADR_O[4] (ADR_O[4]), .\ADR_O[5] (ADR_O[5]), 
            .\ADR_O[6] (ADR_O[6]), .\ADR_O[7] (ADR_O[7]), .\ADR_O[8] (ADR_O[8]), 
            .\ADR_O[9] (ADR_O[9]), .\ADR_O[10] (ADR_O[10]), .\ADR_O[11] (ADR_O[11]), 
            .\ADR_O[12] (ADR_O[12]), .\ADR_O[13] (ADR_O[13]), .\ADR_O[14] (ADR_O[14]), 
            .\ADR_O[15] (ADR_O[15]), .\ADR_O[16] (ADR_O[16]), .\ADR_O[17] (ADR_O[17]), 
            .\ADR_O[18] (ADR_O[18]), .\ADR_O[19] (ADR_O[19]), .\ADR_O[20] (ADR_O[20]), 
            .\ADR_O[21] (ADR_O[21]), .\ADR_O[22] (ADR_O[22]), .\ADR_O[23] (ADR_O[23]), 
            .\ADR_O[24] (ADR_O[24]), .\ADR_O[25] (ADR_O[25]), .\ADR_O[26] (ADR_O[26]), 
            .\ADR_O[27] (ADR_O[27]), .\ADR_O[28] (ADR_O[28]), .\ADR_O[29] (ADR_O[29]), 
            .\ADR_O[30] (ADR_O[30]), .\ADR_O[31] (ADR_O[31]), .rzcy32(rzcy32), 
            .\s_cyclecnt[0] (s_cyclecnt[0]), .\INSTR[6] (INSTR[6]), .\INSTR[5] (INSTR[5]), 
            .\INSTR[4] (INSTR[4]), .\INSTR[2] (INSTR[2]), .\INSTR[3] (INSTR[3]), 
            .\INSTR[7] (INSTR[7]), .VCC_net(VCC_net), .sa14(d[16]), .corerunning(corerunning), 
            .\ADR_O[0] (ADR_O[0])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_midgetv_core.v(864[6] 877[55])
    m_ebr_renamed_due_excessive_length_2 inst_ebr (.bmask({bmask}), .iwe(iwe), 
            .GND_net(GND_net), .VCC_net(VCC_net), .B({B}), .Rai({Rai}), 
            .Wai({Wai}), .CLK_c(CLK_c), .DAT_O({DAT_O[31], DAT_O_c[30:4], 
            \DAT_O[3] , \DAT_O[2] , \DAT_O[1] , \DAT_O[0] })) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_midgetv_core.v(885[4] 896[47])
    m_cyclecnt inst_cyclecnt (.CLK_c(CLK_c), .buserror(buserror), .corerunning(corerunning), 
            .GND_net(GND_net), .VCC_net(VCC_net), .s_cyclecnt({s_cyclecnt}), 
            .STB_O(STB_O), .\ADR_O[1] (ADR_O[1]), .\QQ[1] (QQ[1]), .\ADR_O[0] (ADR_O[0]), 
            .\QQ[0] (QQ[0]), .\ADR_O[6] (ADR_O[6]), .\QQ[6] (QQ[6]), .\ADR_O[5] (ADR_O[5]), 
            .\QQ[5] (QQ[5]), .\ADR_O[4] (ADR_O[4]), .\QQ[4] (QQ[4]), .\ADR_O[3] (\ADR_O[3] ), 
            .\QQ[3] (QQ[3]), .\ADR_O[2] (\ADR_O[2] ), .\QQ[2] (QQ[2])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_midgetv_core.v(790[4] 804[55])
    m_condcode inst_condcode (.raluF(i_adj_312[1]), .CLK_c(CLK_c), .\INSTR[14] (INSTR[14]), 
            .\INSTR[13] (INSTR[13]), .rzcy32(rzcy32), .\INSTR[12] (INSTR[12]), 
            .GND_net(GND_net), .is_brcond(is_brcond), .alu_carryout(alu_carryout), 
            .A31(A31), .\ADR_O[31] (ADR_O[31])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_midgetv_core.v(1014[6] 1034[50])
    \m_alu_carryin(HIGHLEVEL=0,MULDIV=0)  inst_alu_carryin (.CLK_c(CLK_c), 
            .rlastshift(rlastshift), .\ADR_O[31] (ADR_O[31]), .raluF(i_adj_312[1]), 
            .VCC_net(VCC_net), .\FUNC7[5] (FUNC7[5]), .\FUNC7[0] (FUNC7[0]), 
            .sra_msb(sra_msb), .s_alu_carryin({s_alu_carryin}), .alu_carryin(alu_carryin), 
            .GND_net(GND_net), .lastshift(i[0])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_midgetv_core.v(817[4] 834[62])
    \m_alu(MTIMETAP_LOWLIM=14)  inst_alu (.\ADR_O[9] (ADR_O[9]), .s_alu({s_alu}), 
            .B({B}), .\ADR_O[8] (ADR_O[8]), .\ADR_O[7] (ADR_O[7]), .\QQ[6] (QQ[6]), 
            .\QQ[5] (QQ[5]), .\QQ[4] (QQ[4]), .\QQ[3] (QQ[3]), .A31(A31), 
            .\ADR_O[31] (ADR_O[31]), .alu_carryout(alu_carryout), .\ADR_O[30] (ADR_O[30]), 
            .\QQ[2] (QQ[2]), .\ADR_O[29] (ADR_O[29]), .\ADR_O[28] (ADR_O[28]), 
            .\ADR_O[27] (ADR_O[27]), .\ADR_O[26] (ADR_O[26]), .\ADR_O[25] (ADR_O[25]), 
            .\ADR_O[24] (ADR_O[24]), .\ADR_O[23] (ADR_O[23]), .\ADR_O[22] (ADR_O[22]), 
            .\ADR_O[21] (ADR_O[21]), .\ADR_O[20] (ADR_O[20]), .\QQ[1] (QQ[1]), 
            .\ADR_O[19] (ADR_O[19]), .\ADR_O[18] (ADR_O[18]), .\ADR_O[17] (ADR_O[17]), 
            .\ADR_O[16] (ADR_O[16]), .\ADR_O[15] (ADR_O[15]), .\ADR_O[14] (ADR_O[14]), 
            .\ADR_O[13] (ADR_O[13]), .\ADR_O[12] (ADR_O[12]), .\ADR_O[11] (ADR_O[11]), 
            .\ADR_O[10] (ADR_O[10]), .\QQ[0] (QQ[0]), .alu_carryin(alu_carryin), 
            .Di({Di}), .\ADR_O[6] (ADR_O[6]), .\ADR_O[5] (ADR_O[5]), .\ADR_O[4] (ADR_O[4]), 
            .\ADR_O[3] (\ADR_O[3] ), .\ADR_O[2] (\ADR_O[2] ), .\ADR_O[1] (ADR_O[1]), 
            .\ADR_O[0] (ADR_O[0])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_midgetv_core.v(843[4] 861[48])
    
endmodule
//
// Verilog Description of module \m_wai(EBRADRWIDTH=10) 
//

module \m_wai(EBRADRWIDTH=10)  (GND_net, \ADR_O[3] , sa25, sa27, \ADR_O[4] , 
            \INSTR[9] , sa26, Wai, \ADR_O[5] , \INSTR[10] , \ADR_O[6] , 
            \INSTR[11] , \ADR_O[7] , \INSTR[7] , \ADR_O[2] , sa24, 
            \INSTR[8] , \ADR_O[8] , \ADR_O[9] , \ADR_O[10] , \ADR_O[11] ) /* synthesis syn_module_defined=1 */ ;
    input GND_net;
    input \ADR_O[3] ;
    input sa25;
    input sa27;
    input \ADR_O[4] ;
    input \INSTR[9] ;
    input sa26;
    output [9:0]Wai;
    input \ADR_O[5] ;
    input \INSTR[10] ;
    input \ADR_O[6] ;
    input \INSTR[11] ;
    input \ADR_O[7] ;
    input \INSTR[7] ;
    input \ADR_O[2] ;
    input sa24;
    input \INSTR[8] ;
    input \ADR_O[8] ;
    input \ADR_O[9] ;
    input \ADR_O[10] ;
    input \ADR_O[11] ;
    
    
    wire \genblk1.preWai1 , \genblk1.waicy4 , \genblk1.preWai0 , \genblk1.waicy0 , 
        \genblk1.waicy1 , \genblk1.waicy2 , \genblk1.waicy3 ;
    
    SB_LUT4 \genblk1.L_2320  (.I0(\ADR_O[3] ), .I1(sa25), .I2(sa27), .I3(GND_net), 
            .O(\genblk1.preWai1 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=971, LSE_RLINE=982 */ ;   // ../../../../code/m_wai.v(83[41:104])
    defparam \genblk1.L_2320 .LUT_INIT = 16'b1100101011001010;
    SB_LUT4 \genblk1.L_2322  (.I0(\ADR_O[4] ), .I1(sa26), .I2(\INSTR[9] ), 
            .I3(sa27), .O(Wai[2])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=971, LSE_RLINE=982 */ ;   // ../../../../code/m_wai.v(85[41:105])
    defparam \genblk1.L_2322 .LUT_INIT = 16'b1100110011100010;
    SB_LUT4 \genblk1.L_2323  (.I0(\ADR_O[5] ), .I1(sa26), .I2(\INSTR[10] ), 
            .I3(sa27), .O(Wai[3])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=971, LSE_RLINE=982 */ ;   // ../../../../code/m_wai.v(86[41:105])
    defparam \genblk1.L_2323 .LUT_INIT = 16'b1100110011100010;
    SB_LUT4 \genblk1.L_2324  (.I0(\ADR_O[6] ), .I1(sa26), .I2(\INSTR[11] ), 
            .I3(sa27), .O(Wai[4])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=971, LSE_RLINE=982 */ ;   // ../../../../code/m_wai.v(87[41:105])
    defparam \genblk1.L_2324 .LUT_INIT = 16'b0000000011100010;
    SB_LUT4 \genblk1.L_2325  (.I0(\ADR_O[7] ), .I1(sa26), .I2(sa27), .I3(\genblk1.waicy4 ), 
            .O(Wai[5])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=971, LSE_RLINE=982 */ ;   // ../../../../code/m_wai.v(88[41:105])
    defparam \genblk1.L_2325 .LUT_INIT = 16'b1111001011111110;
    SB_LUT4 \genblk1.L_2319  (.I0(\genblk1.preWai0 ), .I1(sa26), .I2(\INSTR[7] ), 
            .I3(sa27), .O(Wai[0])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=971, LSE_RLINE=982 */ ;   // ../../../../code/m_wai.v(82[41:104])
    defparam \genblk1.L_2319 .LUT_INIT = 16'b1010101011100010;
    SB_LUT4 \genblk1.L_2318  (.I0(\ADR_O[2] ), .I1(sa24), .I2(sa27), .I3(GND_net), 
            .O(\genblk1.preWai0 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=971, LSE_RLINE=982 */ ;   // ../../../../code/m_wai.v(81[41:104])
    defparam \genblk1.L_2318 .LUT_INIT = 16'b1100101011001010;
    SB_CARRY \genblk1.CY_2319  (.CI(GND_net), .I0(sa26), .I1(\INSTR[7] ), 
            .CO(\genblk1.waicy0 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=971, LSE_RLINE=982 */ ;   // ../../../../code/m_wai.v(82[118:170])
    SB_LUT4 \genblk1.L_2321  (.I0(\genblk1.preWai1 ), .I1(sa26), .I2(\INSTR[8] ), 
            .I3(sa27), .O(Wai[1])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=971, LSE_RLINE=982 */ ;   // ../../../../code/m_wai.v(84[41:104])
    defparam \genblk1.L_2321 .LUT_INIT = 16'b1010101011100010;
    SB_CARRY \genblk1.CY_2321  (.CI(\genblk1.waicy0 ), .I0(sa26), .I1(\INSTR[8] ), 
            .CO(\genblk1.waicy1 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=971, LSE_RLINE=982 */ ;   // ../../../../code/m_wai.v(84[118:172])
    SB_CARRY \genblk1.CY_2322  (.CI(\genblk1.waicy1 ), .I0(sa26), .I1(\INSTR[9] ), 
            .CO(\genblk1.waicy2 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=971, LSE_RLINE=982 */ ;   // ../../../../code/m_wai.v(85[118:172])
    SB_CARRY \genblk1.CY_2323  (.CI(\genblk1.waicy2 ), .I0(sa26), .I1(\INSTR[10] ), 
            .CO(\genblk1.waicy3 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=971, LSE_RLINE=982 */ ;   // ../../../../code/m_wai.v(86[118:172])
    SB_CARRY \genblk1.CY_2324  (.CI(\genblk1.waicy3 ), .I0(sa26), .I1(\INSTR[11] ), 
            .CO(\genblk1.waicy4 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=971, LSE_RLINE=982 */ ;   // ../../../../code/m_wai.v(87[118:172])
    SB_LUT4 \genblk1.L_2326  (.I0(\ADR_O[8] ), .I1(sa26), .I2(sa27), .I3(GND_net), 
            .O(Wai[6])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=971, LSE_RLINE=982 */ ;   // ../../../../code/m_wai.v(89[41:103])
    defparam \genblk1.L_2326 .LUT_INIT = 16'b0000001000000010;
    SB_LUT4 \genblk1.L_2327  (.I0(\ADR_O[9] ), .I1(sa26), .I2(sa27), .I3(GND_net), 
            .O(Wai[7])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=971, LSE_RLINE=982 */ ;   // ../../../../code/m_wai.v(90[41:103])
    defparam \genblk1.L_2327 .LUT_INIT = 16'b0000001000000010;
    SB_LUT4 \genblk1.genblk1.L_93  (.I0(\ADR_O[10] ), .I1(sa26), .I2(sa27), 
            .I3(GND_net), .O(Wai[8])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=971, LSE_RLINE=982 */ ;   // ../../../../code/m_wai.v(93[44:105])
    defparam \genblk1.genblk1.L_93 .LUT_INIT = 16'b0000001000000010;
    SB_LUT4 \genblk1.genblk1.genblk1.L_95  (.I0(\ADR_O[11] ), .I1(sa26), 
            .I2(sa27), .I3(GND_net), .O(Wai[9])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=971, LSE_RLINE=982 */ ;   // ../../../../code/m_wai.v(95[47:108])
    defparam \genblk1.genblk1.genblk1.L_95 .LUT_INIT = 16'b0000001000000010;
    
endmodule
//
// Verilog Description of module \m_ucodepc(MULDIV=0) 
//

module \m_ucodepc(MULDIV=0)  (rinx, \INSTR[4] , \minx[2] , \INSTR[3] , 
            FUNC7, \INSTR[6] , \INSTR[5] , \INSTR[2] , \minx[1] , 
            \s_cyclecnt[0] , corerunning, GND_net, sa32, sa15, sa30, 
            sa37, \B[0] , sa29, is_brcond, \B[1] , \B[31] , buserror, 
            mostofminx0, \INSTR[14] , \minx[7] , \INSTR[13] , \minx[6] , 
            \INSTR[12] , \minx[5] , \minx[4] , \minx[3] , \INSTR[9] , 
            \INSTR[18] , \INSTR[19] , \INSTR[8] , \INSTR[15] , \INSTR[10] , 
            \INSTR[11] , \INSTR[17] , \INSTR[7] , \INSTR[16] , \INSTR[0] , 
            \INSTR[1] ) /* synthesis syn_module_defined=1 */ ;
    input [7:0]rinx;
    input \INSTR[4] ;
    output \minx[2] ;
    input \INSTR[3] ;
    input [6:0]FUNC7;
    input \INSTR[6] ;
    input \INSTR[5] ;
    input \INSTR[2] ;
    output \minx[1] ;
    input \s_cyclecnt[0] ;
    input corerunning;
    input GND_net;
    input sa32;
    input sa15;
    input sa30;
    input sa37;
    input \B[0] ;
    input sa29;
    input is_brcond;
    input \B[1] ;
    input \B[31] ;
    input buserror;
    output mostofminx0;
    input \INSTR[14] ;
    output \minx[7] ;
    input \INSTR[13] ;
    output \minx[6] ;
    input \INSTR[12] ;
    output \minx[5] ;
    output \minx[4] ;
    output \minx[3] ;
    input \INSTR[9] ;
    input \INSTR[18] ;
    input \INSTR[19] ;
    input \INSTR[8] ;
    input \INSTR[15] ;
    input \INSTR[10] ;
    input \INSTR[11] ;
    input \INSTR[17] ;
    input \INSTR[7] ;
    input \INSTR[16] ;
    input \INSTR[0] ;
    input \INSTR[1] ;
    
    
    wire illegal, usedinx_or_RST_I_notcorerunning;
    wire [31:0]dinx_1__N_145;
    
    wire n5603, maybranch_N_253, n5624, n28, n5610, n5609, n5608, 
        n17, n15, n5613;
    
    SB_LUT4 rinx_7__I_0_i1_4_lut (.I0(rinx[2]), .I1(illegal), .I2(usedinx_or_RST_I_notcorerunning), 
            .I3(\INSTR[4] ), .O(\minx[2] ));   // ../../../../code/m_ucodepc.v(208[23:117])
    defparam rinx_7__I_0_i1_4_lut.LUT_INIT = 16'hfaca;
    SB_LUT4 i255_4_lut (.I0(\INSTR[3] ), .I1(FUNC7[5]), .I2(\INSTR[6] ), 
            .I3(\INSTR[5] ), .O(dinx_1__N_145[0]));   // ../../../../code/m_ucodepc.v(143[34:103])
    defparam i255_4_lut.LUT_INIT = 16'hacaa;
    SB_LUT4 i3950_4_lut (.I0(dinx_1__N_145[0]), .I1(\INSTR[2] ), .I2(\INSTR[4] ), 
            .I3(\INSTR[5] ), .O(n5603));   // ../../../../code/m_ucodepc.v(209[23:111])
    defparam i3950_4_lut.LUT_INIT = 16'heaaa;
    SB_LUT4 rinx_1__I_0_4_lut (.I0(rinx[1]), .I1(n5603), .I2(usedinx_or_RST_I_notcorerunning), 
            .I3(illegal), .O(\minx[1] ));   // ../../../../code/m_ucodepc.v(209[23:111])
    defparam rinx_1__I_0_4_lut.LUT_INIT = 16'hfaca;
    SB_LUT4 usedinx_or_RST_I_notcorerunning_I_0_2_lut (.I0(\s_cyclecnt[0] ), 
            .I1(corerunning), .I2(GND_net), .I3(GND_net), .O(usedinx_or_RST_I_notcorerunning));   // ../../../../code/m_ucodepc.v(206[55:85])
    defparam usedinx_or_RST_I_notcorerunning_I_0_2_lut.LUT_INIT = 16'hbbbb;
    SB_LUT4 sa32_I_0_2_lut (.I0(sa32), .I1(sa15), .I2(GND_net), .I3(GND_net), 
            .O(maybranch_N_253));   // ../../../../code/m_ucodepc.v(204[25:37])
    defparam sa32_I_0_2_lut.LUT_INIT = 16'h2222;
    SB_LUT4 i3968_4_lut (.I0(rinx[0]), .I1(sa30), .I2(sa37), .I3(maybranch_N_253), 
            .O(n5624));   // ../../../../code/m_ucodepc.v(210[23:167])
    defparam i3968_4_lut.LUT_INIT = 16'h0002;
    SB_LUT4 i35_3_lut (.I0(n5624), .I1(\B[0] ), .I2(sa29), .I3(GND_net), 
            .O(n28));   // ../../../../code/m_ucodepc.v(210[23:167])
    defparam i35_3_lut.LUT_INIT = 16'hcaca;
    SB_LUT4 i3947_4_lut (.I0(is_brcond), .I1(sa30), .I2(sa37), .I3(\B[1] ), 
            .O(n5610));   // ../../../../code/m_ucodepc.v(210[23:167])
    defparam i3947_4_lut.LUT_INIT = 16'heca0;
    SB_LUT4 i3958_2_lut (.I0(illegal), .I1(\INSTR[2] ), .I2(GND_net), 
            .I3(GND_net), .O(n5609));   // ../../../../code/m_ucodepc.v(210[23:167])
    defparam i3958_2_lut.LUT_INIT = 16'h4444;
    SB_LUT4 i3962_4_lut (.I0(n5610), .I1(\B[31] ), .I2(n28), .I3(maybranch_N_253), 
            .O(n5608));   // ../../../../code/m_ucodepc.v(210[23:167])
    defparam i3962_4_lut.LUT_INIT = 16'hfefa;
    SB_LUT4 i1_4_lut (.I0(buserror), .I1(n5608), .I2(n5609), .I3(usedinx_or_RST_I_notcorerunning), 
            .O(mostofminx0));   // ../../../../code/m_ucodepc.v(210[23:167])
    defparam i1_4_lut.LUT_INIT = 16'hfaee;
    SB_LUT4 i29_3_lut (.I0(\INSTR[4] ), .I1(\INSTR[5] ), .I2(\INSTR[3] ), 
            .I3(GND_net), .O(n17));   // ../../../../code/m_ucodepc.v(208[58:104])
    defparam i29_3_lut.LUT_INIT = 16'h4a4a;
    SB_LUT4 i1_3_lut (.I0(\INSTR[14] ), .I1(\INSTR[2] ), .I2(n17), .I3(GND_net), 
            .O(n15));   // ../../../../code/m_ucodepc.v(208[58:104])
    defparam i1_3_lut.LUT_INIT = 16'hd5d5;
    SB_LUT4 rinx_7__I_0_i6_4_lut (.I0(rinx[7]), .I1(illegal), .I2(usedinx_or_RST_I_notcorerunning), 
            .I3(n15), .O(\minx[7] ));   // ../../../../code/m_ucodepc.v(208[23:117])
    defparam rinx_7__I_0_i6_4_lut.LUT_INIT = 16'hcafa;
    SB_LUT4 i3956_4_lut (.I0(\INSTR[4] ), .I1(\INSTR[13] ), .I2(\INSTR[3] ), 
            .I3(\INSTR[2] ), .O(n5613));   // ../../../../code/m_ucodepc.v(208[23:117])
    defparam i3956_4_lut.LUT_INIT = 16'hc4cc;
    SB_LUT4 rinx_7__I_0_i5_4_lut (.I0(rinx[6]), .I1(n5613), .I2(usedinx_or_RST_I_notcorerunning), 
            .I3(illegal), .O(\minx[6] ));   // ../../../../code/m_ucodepc.v(208[23:117])
    defparam rinx_7__I_0_i5_4_lut.LUT_INIT = 16'hfaca;
    SB_LUT4 rinx_7__I_0_i4_4_lut (.I0(rinx[5]), .I1(illegal), .I2(usedinx_or_RST_I_notcorerunning), 
            .I3(\INSTR[12] ), .O(\minx[5] ));   // ../../../../code/m_ucodepc.v(208[23:117])
    defparam rinx_7__I_0_i4_4_lut.LUT_INIT = 16'hfaca;
    SB_LUT4 rinx_7__I_0_i3_4_lut (.I0(rinx[4]), .I1(\INSTR[6] ), .I2(usedinx_or_RST_I_notcorerunning), 
            .I3(illegal), .O(\minx[4] ));   // ../../../../code/m_ucodepc.v(208[23:117])
    defparam rinx_7__I_0_i3_4_lut.LUT_INIT = 16'hfaca;
    SB_LUT4 rinx_7__I_0_i2_4_lut (.I0(rinx[3]), .I1(illegal), .I2(usedinx_or_RST_I_notcorerunning), 
            .I3(\INSTR[5] ), .O(\minx[3] ));   // ../../../../code/m_ucodepc.v(208[23:117])
    defparam rinx_7__I_0_i2_4_lut.LUT_INIT = 16'hfaca;
    m_illegalop inst_illegalop (.\INSTR[4] (\INSTR[4] ), .\INSTR[13] (\INSTR[13] ), 
            .GND_net(GND_net), .\INSTR[14] (\INSTR[14] ), .\INSTR[5] (\INSTR[5] ), 
            .\INSTR[12] (\INSTR[12] ), .\INSTR[9] (\INSTR[9] ), .\INSTR[18] (\INSTR[18] ), 
            .\INSTR[19] (\INSTR[19] ), .\INSTR[8] (\INSTR[8] ), .\INSTR[15] (\INSTR[15] ), 
            .\INSTR[10] (\INSTR[10] ), .\INSTR[11] (\INSTR[11] ), .\INSTR[17] (\INSTR[17] ), 
            .\INSTR[7] (\INSTR[7] ), .\INSTR[16] (\INSTR[16] ), .\INSTR[3] (\INSTR[3] ), 
            .\INSTR[2] (\INSTR[2] ), .FUNC7({FUNC7}), .\INSTR[6] (\INSTR[6] ), 
            .corerunning(corerunning), .\INSTR[0] (\INSTR[0] ), .\INSTR[1] (\INSTR[1] ), 
            .illegal(illegal)) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_ucodepc.v(163[4] 170[55])
    
endmodule
//
// Verilog Description of module m_illegalop
//

module m_illegalop (\INSTR[4] , \INSTR[13] , GND_net, \INSTR[14] , \INSTR[5] , 
            \INSTR[12] , \INSTR[9] , \INSTR[18] , \INSTR[19] , \INSTR[8] , 
            \INSTR[15] , \INSTR[10] , \INSTR[11] , \INSTR[17] , \INSTR[7] , 
            \INSTR[16] , \INSTR[3] , \INSTR[2] , FUNC7, \INSTR[6] , 
            corerunning, \INSTR[0] , \INSTR[1] , illegal) /* synthesis syn_module_defined=1 */ ;
    input \INSTR[4] ;
    input \INSTR[13] ;
    input GND_net;
    input \INSTR[14] ;
    input \INSTR[5] ;
    input \INSTR[12] ;
    input \INSTR[9] ;
    input \INSTR[18] ;
    input \INSTR[19] ;
    input \INSTR[8] ;
    input \INSTR[15] ;
    input \INSTR[10] ;
    input \INSTR[11] ;
    input \INSTR[17] ;
    input \INSTR[7] ;
    input \INSTR[16] ;
    input \INSTR[3] ;
    input \INSTR[2] ;
    input [6:0]FUNC7;
    input \INSTR[6] ;
    input corerunning;
    input \INSTR[0] ;
    input \INSTR[1] ;
    output illegal;
    
    
    wire n2575, n497, n16, n17, \genblk1.illegal_rs1_rd_N_300 , n8, 
        n12, \genblk1.checkfunct7_N_286 , n11, \genblk1.checkfunct7_N_281 , 
        n5605;
    wire [1:0]n475;
    
    wire n2, n6;
    
    SB_LUT4 i1_2_lut (.I0(\INSTR[4] ), .I1(\INSTR[13] ), .I2(GND_net), 
            .I3(GND_net), .O(n2575));
    defparam i1_2_lut.LUT_INIT = 16'h2222;
    SB_LUT4 i256_4_lut (.I0(\INSTR[14] ), .I1(\INSTR[13] ), .I2(\INSTR[5] ), 
            .I3(\INSTR[12] ), .O(n497));   // ../../../../code/m_illegalop.v(67[42] 68[101])
    defparam i256_4_lut.LUT_INIT = 16'h2a1a;
    SB_LUT4 i6_4_lut (.I0(\INSTR[9] ), .I1(\INSTR[18] ), .I2(\INSTR[19] ), 
            .I3(\INSTR[8] ), .O(n16));   // ../../../../code/m_illegalop.v(202[49:75])
    defparam i6_4_lut.LUT_INIT = 16'hfffe;
    SB_LUT4 i7_4_lut (.I0(\INSTR[15] ), .I1(\INSTR[10] ), .I2(\INSTR[11] ), 
            .I3(\INSTR[17] ), .O(n17));   // ../../../../code/m_illegalop.v(202[49:75])
    defparam i7_4_lut.LUT_INIT = 16'hfffe;
    SB_LUT4 i9_4_lut (.I0(n17), .I1(\INSTR[7] ), .I2(n16), .I3(\INSTR[16] ), 
            .O(\genblk1.illegal_rs1_rd_N_300 ));   // ../../../../code/m_illegalop.v(202[49:75])
    defparam i9_4_lut.LUT_INIT = 16'hfffe;
    SB_LUT4 i1_4_lut (.I0(\INSTR[5] ), .I1(\INSTR[3] ), .I2(\INSTR[4] ), 
            .I3(\INSTR[2] ), .O(n8));   // ../../../../code/m_illegalop.v(222[12] 239[19])
    defparam i1_4_lut.LUT_INIT = 16'h0a22;
    SB_LUT4 i5_4_lut (.I0(FUNC7[0]), .I1(FUNC7[1]), .I2(FUNC7[6]), .I3(FUNC7[3]), 
            .O(n12));   // ../../../../code/m_illegalop.v(250[30:79])
    defparam i5_4_lut.LUT_INIT = 16'hfffe;
    SB_LUT4 i2_4_lut (.I0(\INSTR[6] ), .I1(\INSTR[4] ), .I2(\INSTR[2] ), 
            .I3(\INSTR[5] ), .O(\genblk1.checkfunct7_N_286 ));
    defparam i2_4_lut.LUT_INIT = 16'h0400;
    SB_LUT4 i4_4_lut (.I0(FUNC7[4]), .I1(n497), .I2(FUNC7[2]), .I3(FUNC7[5]), 
            .O(n11));   // ../../../../code/m_illegalop.v(250[30:79])
    defparam i4_4_lut.LUT_INIT = 16'hfbfa;
    SB_LUT4 i3_4_lut (.I0(\INSTR[12] ), .I1(\INSTR[2] ), .I2(\INSTR[5] ), 
            .I3(n2575), .O(\genblk1.checkfunct7_N_281 ));
    defparam i3_4_lut.LUT_INIT = 16'h0200;
    SB_LUT4 i3967_4_lut (.I0(\INSTR[12] ), .I1(n8), .I2(n2575), .I3(\genblk1.illegal_rs1_rd_N_300 ), 
            .O(n5605));   // ../../../../code/m_illegalop.v(250[30:93])
    defparam i3967_4_lut.LUT_INIT = 16'h7333;
    SB_LUT4 i1545_4_lut (.I0(\INSTR[2] ), .I1(\INSTR[3] ), .I2(\INSTR[4] ), 
            .I3(\INSTR[5] ), .O(n475[1]));   // ../../../../code/m_illegalop.v(222[12] 239[19])
    defparam i1545_4_lut.LUT_INIT = 16'hcec2;
    SB_LUT4 i1_4_lut_adj_49 (.I0(\genblk1.checkfunct7_N_281 ), .I1(n11), 
            .I2(\genblk1.checkfunct7_N_286 ), .I3(n12), .O(n2));   // ../../../../code/m_illegalop.v(250[30:93])
    defparam i1_4_lut_adj_49.LUT_INIT = 16'hfac8;
    SB_LUT4 i2_4_lut_adj_50 (.I0(n2), .I1(n475[1]), .I2(n5605), .I3(\INSTR[6] ), 
            .O(n6));   // ../../../../code/m_illegalop.v(250[30:93])
    defparam i2_4_lut_adj_50.LUT_INIT = 16'hfaee;
    SB_LUT4 i1_4_lut_adj_51 (.I0(corerunning), .I1(\INSTR[0] ), .I2(n6), 
            .I3(\INSTR[1] ), .O(illegal));   // ../../../../code/m_illegalop.v(250[30:93])
    defparam i1_4_lut_adj_51.LUT_INIT = 16'ha2aa;
    
endmodule
//
// Verilog Description of module m_ucode
//

module m_ucode (GND_net, VCC_net, CLK_c, \minx[7] , \minx[6] , \minx[5] , 
            \minx[4] , \minx[3] , \minx[2] , \minx[1] , mostofminx0, 
            progress_ucode, sa43, sa42, sa41, sa27, sa26, sa25, 
            sa24, sa23, sa22, sa21, sa00, s_alu_carryin, sa20, 
            s_shift, s_cyclecnt, sa15, sa14, s_alu, rinx, sa37, 
            is_valid_instrhigh, sa29, sa30, sa32, sa33, sa34, sa40) /* synthesis syn_module_defined=1 */ ;
    input GND_net;
    input VCC_net;
    input CLK_c;
    input \minx[7] ;
    input \minx[6] ;
    input \minx[5] ;
    input \minx[4] ;
    input \minx[3] ;
    input \minx[2] ;
    input \minx[1] ;
    input mostofminx0;
    input progress_ucode;
    output sa43;
    output sa42;
    output sa41;
    output sa27;
    output sa26;
    output sa25;
    output sa24;
    output sa23;
    output sa22;
    output sa21;
    output sa00;
    output [1:0]s_alu_carryin;
    output sa20;
    output [1:0]s_shift;
    output [1:0]s_cyclecnt;
    output sa15;
    output sa14;
    output [2:0]s_alu;
    output [7:0]rinx;
    output sa37;
    output is_valid_instrhigh;
    output sa29;
    output sa30;
    output sa32;
    output sa33;
    output sa34;
    output sa40;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    m_2ebr \genblk1.inst_2ebr  (.GND_net(GND_net), .VCC_net(VCC_net), .CLK_c(CLK_c), 
           .\minx[7] (\minx[7] ), .\minx[6] (\minx[6] ), .\minx[5] (\minx[5] ), 
           .\minx[4] (\minx[4] ), .\minx[3] (\minx[3] ), .\minx[2] (\minx[2] ), 
           .\minx[1] (\minx[1] ), .mostofminx0(mostofminx0), .progress_ucode(progress_ucode), 
           .sa43(sa43), .sa42(sa42), .sa41(sa41), .sa27(sa27), .sa26(sa26), 
           .sa25(sa25), .sa24(sa24), .sa23(sa23), .sa22(sa22), .sa21(sa21), 
           .sa00(sa00), .s_alu_carryin({s_alu_carryin}), .sa20(sa20), 
           .s_shift({s_shift}), .s_cyclecnt({s_cyclecnt}), .sa15(sa15), 
           .sa14(sa14), .s_alu({s_alu}), .rinx({rinx}), .sa37(sa37), 
           .is_valid_instrhigh(is_valid_instrhigh), .sa29(sa29), .sa30(sa30), 
           .sa32(sa32), .sa33(sa33), .sa34(sa34), .sa40(sa40)) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_ucode.v(56[17] 63[58])
    
endmodule
//
// Verilog Description of module m_2ebr
//

module m_2ebr (GND_net, VCC_net, CLK_c, \minx[7] , \minx[6] , \minx[5] , 
            \minx[4] , \minx[3] , \minx[2] , \minx[1] , mostofminx0, 
            progress_ucode, sa43, sa42, sa41, sa27, sa26, sa25, 
            sa24, sa23, sa22, sa21, sa00, s_alu_carryin, sa20, 
            s_shift, s_cyclecnt, sa15, sa14, s_alu, rinx, sa37, 
            is_valid_instrhigh, sa29, sa30, sa32, sa33, sa34, sa40) /* synthesis syn_module_defined=1 */ ;
    input GND_net;
    input VCC_net;
    input CLK_c;
    input \minx[7] ;
    input \minx[6] ;
    input \minx[5] ;
    input \minx[4] ;
    input \minx[3] ;
    input \minx[2] ;
    input \minx[1] ;
    input mostofminx0;
    input progress_ucode;
    output sa43;
    output sa42;
    output sa41;
    output sa27;
    output sa26;
    output sa25;
    output sa24;
    output sa23;
    output sa22;
    output sa21;
    output sa00;
    output [1:0]s_alu_carryin;
    output sa20;
    output [1:0]s_shift;
    output [1:0]s_cyclecnt;
    output sa15;
    output sa14;
    output [2:0]s_alu;
    output [7:0]rinx;
    output sa37;
    output is_valid_instrhigh;
    output sa29;
    output sa30;
    output sa32;
    output sa33;
    output sa34;
    output sa40;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    wire [31:0]indir;   // ../../../../generated/m_2ebr.v(351[18:23])
    
    wire instr1x110100;
    wire [3:0]i;   // ../../../../code/m_ice_shortcuts.v(41[17:18])
    
    SB_RAM40_4K ucode1 (.RDATA({indir[31:28], sa43, sa42, sa41, Open_31, 
            Open_32, sa27, sa26, sa25, sa24, sa23, sa22, sa21}), 
            .RCLK(CLK_c), .RCLKE(VCC_net), .RE(progress_ucode), .RADDR({GND_net, 
            GND_net, GND_net, \minx[7] , \minx[6] , \minx[5] , \minx[4] , 
            \minx[3] , \minx[2] , \minx[1] , mostofminx0}), .WCLK(GND_net), 
            .WCLKE(GND_net), .WE(GND_net), .WADDR({GND_net, GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net}), .MASK({GND_net, GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net}), .WDATA({GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net})) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=44, LSE_LCOL=17, LSE_RCOL=58, LSE_LLINE=56, LSE_RLINE=63 */ ;   // ../../../../code/m_ucode.v(56[17] 63[58])
    defparam ucode1.WRITE_MODE = 0;
    defparam ucode1.READ_MODE = 0;
    defparam ucode1.INIT_0 = 256'b0000000000100001000000100000011100000000001000010000001000000111001100000110000100000000010001110000001000000010000000000100011100000010000000100000001000000011000000100000000100000000001000010000001000000001001000101000011000010010000001010000011000000110;
    defparam ucode1.INIT_1 = 256'b0000000001100101010100100000010100000000001000010010001000000101001100100000000100000000001000010000000001000101000000000110011100110100010101100111010001010110011000100000011001010010000000010000001000000111010000000000000000000010000001110000001000000111;
    defparam ucode1.INIT_2 = 256'b0000000000100001010000000000000000000000001000010000001000000111010100100000000000100000010001110000001000000111001000000100011100000010000000000000000001000111000000100000000101000010000001110000001000000001010000000000000000000000001000010010010001100110;
    defparam ucode1.INIT_3 = 256'b0100001000000111010000100000011111000000001001010000000001100011001100100000000110110000001001010100000000000000000000000110011101100000011010001010000000100101010000000010010110010100010101100000000001111001000000000110000100000010000001111000000000100001;
    defparam ucode1.INIT_4 = 256'b0101001000000101000000100000000001000000000000000000001000000111000000010001110100111110000001110101001000000000001111100000011100000000011111010000000001101101010100100000010100000010000001110100000000000000010000000000000001010010000000000011011000000110;
    defparam ucode1.INIT_5 = 256'b0000000001111101000100100000010110100000011001010000000001100011001100100000000101000000011001010100000000000000010000000000000000000010000001000000001000000100000000000111110111000010000001010000000001111101000100100000010100000000011111011101000000100101;
    defparam ucode1.INIT_6 = 256'b0101001000000000010000000000000001000000000000000000001000000111000011100001011001000000000000000100000000000000010000000000000000000000011110010000000000011111011000100000000100000010000001110100000000000000010000000000000001100000010000110100000000000000;
    defparam ucode1.INIT_7 = 256'b0000000001111101000000000110100000000001111101000000000001100011001100100000000100000000000101100100000000000000010000000000000001010000011011010000001000000001000000100000000111100010000001010000000001111110000000100000001100000000011111011100001000000101;
    defparam ucode1.INIT_8 = 256'b0101001000000101000000100000000001000000000000000000001000000111010100000010000101000000000000000100000000000000010000000000000000000000011011100101000000100110000100100000010100000010000001110100000000000000010000000000000000000000011011010000011000000110;
    defparam ucode1.INIT_9 = 256'b0000000000001110000011100000111001000000000000000100000000000000010000000000000000000001111101000000001000000000000000000110011100000000011110010100000001100101010100100000010100000001111101000000000001101101000000000110110001010001111100010000000111111010;
    defparam ucode1.INIT_A = 256'b0101001000000000000000100000011101000000000000000000001000000111000000000110110101000000000000000101000111110100010000000000000000000010000000000011001000000101010100100000001101000010000001110100000000000000010000000000000001010010000001010010010001100110;
    defparam ucode1.INIT_B = 256'b1001001000000101100100100000010110010100010101100000000001100011101000000110010100000010000000110100000000000000000000000110011100000010000001100101001000000101000000100000000001000000000000000100000000000000011101000101011000000001111100010101001000000101;
    defparam ucode1.INIT_C = 256'b0110001000000011000000100000000001000000000000000000001000000111000000011111101001000000000000000000001000000011010000000000000000000000011010000000010001101110000000100000000000000000010001110100000000000000010000000000000000000000011001010100000000000000;
    defparam ucode1.INIT_D = 256'b1110000001000101111100000100000100000000011111010000000001100011010100000111000100000010000001010100000000000000000000000110011100000000011111010000001000000000010000000000000001010001111100010000000001111101110000100000010100000000010000110101001000000001;
    defparam ucode1.INIT_E = 256'b0111010001010110000000100000000001000000000000000000001000000111000000100000001101000000000000000000001000000110010000000000000000000000011111010111010001010110010100100000010100000010000001110100000000000000010000000000000000000010000000000100000000000000;
    defparam ucode1.INIT_F = 256'b0000001000000001000000100000000100000010000000010000000001100011000000100000000001010010000001010100000000000000000000000110011100000000011110010101001000000000000000000111110100000000010111110000001000000000000000100000000100000000011111011100001000000101;
    SB_LUT4 cmb_d08 (.I0(indir[28]), .I1(indir[29]), .I2(indir[30]), .I3(indir[31]), 
            .O(sa00)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=44, LSE_LCOL=17, LSE_RCOL=58, LSE_LLINE=56, LSE_RLINE=63 */ ;   // ../../../../generated/m_2ebr.v(428[35:112])
    defparam cmb_d08.LUT_INIT = 16'b0001100000000010;
    SB_LUT4 cmb_d09 (.I0(indir[28]), .I1(indir[29]), .I2(indir[30]), .I3(indir[31]), 
            .O(s_alu_carryin[0])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=44, LSE_LCOL=17, LSE_RCOL=58, LSE_LLINE=56, LSE_RLINE=63 */ ;   // ../../../../generated/m_2ebr.v(429[35:112])
    defparam cmb_d09.LUT_INIT = 16'b0000000110100000;
    SB_RAM40_4K ucode0 (.RDATA({sa20, s_shift[1], s_cyclecnt[1], sa15, 
            sa14, s_alu, rinx}), .RCLK(CLK_c), .RCLKE(VCC_net), .RE(progress_ucode), 
            .RADDR({GND_net, GND_net, GND_net, \minx[7] , \minx[6] , 
            \minx[5] , \minx[4] , \minx[3] , \minx[2] , \minx[1] , 
            mostofminx0}), .WCLK(GND_net), .WCLKE(GND_net), .WE(GND_net), 
            .WADDR({GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net}), .MASK({GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net}), .WDATA({GND_net, GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net})) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=44, LSE_LCOL=17, LSE_RCOL=58, LSE_LLINE=56, LSE_RLINE=63 */ ;   // ../../../../code/m_ucode.v(56[17] 63[58])
    defparam ucode0.WRITE_MODE = 0;
    defparam ucode0.READ_MODE = 0;
    defparam ucode0.INIT_0 = 256'b0111011011100110010100000001000001110110111001100111100100000100011100111000011000111100010110101111100010001011001111000101101011111011000010010111101000000111010010000000010001110100111001100101000011100110111111001011111011111001110100101011110000000001;
    defparam ucode0.INIT_1 = 256'b0111011010110111010111001101010001110111111001101110111010100110011011100011001001110011111001100111010001000001011101100001001111111100011101001100111011011110011110010001011001111100000101011111100000010100000000000000000001111000000110101111100010001011;
    defparam ucode0.INIT_2 = 256'b0111011011100110000000000000000001110110111001100100000000111110011101000011000000111100100101100111100000100001001111001001011001111100000111010111000000100111010010000000010010100110001101010101000011100110000000000000000001110000111001101011110001010010;
    defparam ucode0.INIT_3 = 256'b1010000100111010101000010011010101111001000000110111011001001001011011100011001001111001001111010000000000000000011101100001001101110001110101111111110100000011111110010011011011101001110111100110010010000001011101001000011011111000001010110111011011100110;
    defparam ucode0.INIT_4 = 256'b0111110011100110010000001111111000000000000000000101000000110001011010011011000001111100011001100111110001001011011111000110011001110001100011110110000101000111011111000110010111111010001010110000000000000000000000000000000001111100000010111111110001010000;
    defparam ucode0.INIT_5 = 256'b0110111011011010111110010111000011111101111110110111011001001001011011100011001011111001010111010000000000000000000000000000000001111000100010110111101101010111011101100001111001111001111010110110111011011010111110010101010001101110110110101111000111100110;
    defparam ucode0.INIT_6 = 256'b0111110011001111000000000000000000000000000000000101000000110001011110010111101000000000000000000000000000000000000000000000000001100110100100110110100111110010010100001110111111111010001010110000000000000000000000000000000001110010111101110000000000000000;
    defparam ucode0.INIT_7 = 256'b0110000101111101011100011001000011100001001101000111011001001001011011100011001001101001111100100000000000000000000000000000000001100100011111010111100001110111010000000111001111110001111101000111000101110110011110100001101001110110000111100111100110111010;
    defparam ucode0.INIT_8 = 256'b0111110010101001010000001111111000000000000000001101000000101001011101001110011000000000000000000000000000000000000000000000000001100001011111110100010000110100111110011111000011111010001000010000000000000000000000000000000001100001011111011011110010000101;
    defparam ucode0.INIT_9 = 256'b0110100111110010011110011001111100000000000000000000000000000000000000000000000011000100001101000100000011111110011101100001001101100110100100111111100110111011110111001001010011100101001101001111000110010101111000010011010001000100100100100111011000110100;
    defparam ucode0.INIT_A = 256'b0111110011000101010000000011111100000000000000000100000000111111011100011001101000000000000000001110010000110100000000000000000001111100011000011110111011010000011111001010111110100110001110100000000000000000000000000000000001011100101101101011110001011110;
    defparam ucode0.INIT_B = 256'b1111100111000001111110010001111111101011110111100111011001001001111111011011010111111010000110100000000000000000011101100001001101011100101111010101110010011010011101101001111000000000000000000000000000000000110011001101111001000100100100100101110010110010;
    defparam ucode0.INIT_C = 256'b0101000001001111010000001111111000000000000000001101000000100110011101101110011000000000000000000101110010100101000000000000000001110001110010111111101101000111011110100110111111110010111000010000000000000000000000000000000001110110111010010000000000000000;
    defparam ucode0.INIT_D = 256'b1111011011110100111101101111010001110110111001010111011001001001011001001001001001010000100100010000000000000000011101100001001101110110101000010100000011111110000000000000000001100100100100100111011000011110011110010000011001110110110010010111110000110111;
    defparam ucode0.INIT_E = 256'b1100110011011110010000001111111000000000000000001101000000010001111110100101011000000000000000000101110011000110000000000000000001110110000111101100110011011110010111001011000111111010000110100000000000000000000000000000000001111001000111010000000000000000;
    defparam ucode0.INIT_F = 256'b0101000011000111010000000100011001010000011111100111011001001001011101100110101101111100010001010000000000000000011101100001001101110110101010110101110011111010011101101101101111111100000000000100100011011101010100001110011001110110000111100111100101110010;
    SB_LUT4 cmb_d10 (.I0(indir[28]), .I1(indir[29]), .I2(indir[30]), .I3(indir[31]), 
            .O(s_alu_carryin[1])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=44, LSE_LCOL=17, LSE_RCOL=58, LSE_LLINE=56, LSE_RLINE=63 */ ;   // ../../../../generated/m_2ebr.v(430[35:113])
    defparam cmb_d10.LUT_INIT = 16'b0000000010100000;
    SB_LUT4 cmb_d14 (.I0(indir[28]), .I1(indir[29]), .I2(indir[30]), .I3(indir[31]), 
            .O(sa37)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=44, LSE_LCOL=17, LSE_RCOL=58, LSE_LLINE=56, LSE_RLINE=63 */ ;   // ../../../../generated/m_2ebr.v(431[35:113])
    defparam cmb_d14.LUT_INIT = 16'b0000000001000000;
    SB_LUT4 cmb_d15 (.I0(indir[28]), .I1(indir[29]), .I2(indir[30]), .I3(indir[31]), 
            .O(is_valid_instrhigh)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=44, LSE_LCOL=17, LSE_RCOL=58, LSE_LLINE=56, LSE_RLINE=63 */ ;   // ../../../../generated/m_2ebr.v(432[35:113])
    defparam cmb_d15.LUT_INIT = 16'b1100000000000000;
    SB_LUT4 cmb_d21 (.I0(indir[28]), .I1(indir[29]), .I2(indir[30]), .I3(indir[31]), 
            .O(s_shift[0])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=44, LSE_LCOL=17, LSE_RCOL=58, LSE_LLINE=56, LSE_RLINE=63 */ ;   // ../../../../generated/m_2ebr.v(433[35:113])
    defparam cmb_d21.LUT_INIT = 16'b1110001111101111;
    SB_LUT4 cmb_d31 (.I0(indir[28]), .I1(indir[29]), .I2(indir[30]), .I3(indir[31]), 
            .O(sa29)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=44, LSE_LCOL=17, LSE_RCOL=58, LSE_LLINE=56, LSE_RLINE=63 */ ;   // ../../../../generated/m_2ebr.v(434[35:113])
    defparam cmb_d31.LUT_INIT = 16'b0000000000001100;
    SB_LUT4 cmb_d32 (.I0(indir[28]), .I1(indir[29]), .I2(indir[30]), .I3(indir[31]), 
            .O(sa30)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=44, LSE_LCOL=17, LSE_RCOL=58, LSE_LLINE=56, LSE_RLINE=63 */ ;   // ../../../../generated/m_2ebr.v(435[35:113])
    defparam cmb_d32.LUT_INIT = 16'b0000000000001000;
    SB_LUT4 cmb_d33 (.I0(indir[28]), .I1(indir[29]), .I2(indir[30]), .I3(indir[31]), 
            .O(sa32)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=44, LSE_LCOL=17, LSE_RCOL=58, LSE_LLINE=56, LSE_RLINE=63 */ ;   // ../../../../generated/m_2ebr.v(436[35:113])
    defparam cmb_d33.LUT_INIT = 16'b0110001010000010;
    SB_LUT4 cmb_d34 (.I0(indir[28]), .I1(indir[29]), .I2(indir[30]), .I3(indir[31]), 
            .O(sa33)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=44, LSE_LCOL=17, LSE_RCOL=58, LSE_LLINE=56, LSE_RLINE=63 */ ;   // ../../../../generated/m_2ebr.v(437[35:113])
    defparam cmb_d34.LUT_INIT = 16'b0001010000000000;
    SB_LUT4 cmb_d35 (.I0(indir[28]), .I1(indir[29]), .I2(indir[30]), .I3(indir[31]), 
            .O(sa34)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=44, LSE_LCOL=17, LSE_RCOL=58, LSE_LLINE=56, LSE_RLINE=63 */ ;   // ../../../../generated/m_2ebr.v(438[35:113])
    defparam cmb_d35.LUT_INIT = 16'b0100000000000010;
    SB_LUT4 cmb_d38 (.I0(indir[28]), .I1(indir[29]), .I2(indir[30]), .I3(indir[31]), 
            .O(sa40)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=44, LSE_LCOL=17, LSE_RCOL=58, LSE_LLINE=56, LSE_RLINE=63 */ ;   // ../../../../generated/m_2ebr.v(439[35:113])
    defparam cmb_d38.LUT_INIT = 16'b0110000000000000;
    SB_DFFE reg_d18 (.Q(s_cyclecnt[0]), .C(CLK_c), .E(progress_ucode), 
            .D(instr1x110100)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=44, LSE_LCOL=17, LSE_RCOL=58, LSE_LLINE=56, LSE_RLINE=63 */ ;   // ../../../../generated/m_2ebr.v(446[220:287])
    \bn_l4v(I=16'b1000000000000000)  leq1x110100 (.\minx[7] (\minx[7] ), .\minx[5] (\minx[5] ), 
            .\minx[4] (\minx[4] ), .instr0100(i[0]), .instr1x110100(instr1x110100)) /* synthesis syn_module_defined=1 */ ;   // ../../../../generated/m_2ebr.v(446[141:207])
    \bn_l4v(I=16'b010000)  leq0100 (.\minx[3] (\minx[3] ), .\minx[2] (\minx[2] ), 
            .\minx[1] (\minx[1] ), .mostofminx0(mostofminx0), .instr0100(i[0])) /* synthesis syn_module_defined=1 */ ;   // ../../../../generated/m_2ebr.v(446[65:113])
    
endmodule
//
// Verilog Description of module \bn_l4v(I=16'b1000000000000000) 
//

module \bn_l4v(I=16'b1000000000000000)  (\minx[7] , \minx[5] , \minx[4] , 
            instr0100, instr1x110100) /* synthesis syn_module_defined=1 */ ;
    input \minx[7] ;
    input \minx[5] ;
    input \minx[4] ;
    input instr0100;
    output instr1x110100;
    
    
    SB_LUT4 l (.I0(instr0100), .I1(\minx[4] ), .I2(\minx[5] ), .I3(\minx[7] ), 
            .O(instr1x110100)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=43, LSE_LCOL=141, LSE_RCOL=207, LSE_LLINE=446, LSE_RLINE=446 */ ;   // ../../../../code/m_ice_shortcuts.v(44[28:80])
    defparam l.LUT_INIT = 16'b1000000000000000;
    
endmodule
//
// Verilog Description of module \bn_l4v(I=16'b010000) 
//

module \bn_l4v(I=16'b010000)  (\minx[3] , \minx[2] , \minx[1] , mostofminx0, 
            instr0100) /* synthesis syn_module_defined=1 */ ;
    input \minx[3] ;
    input \minx[2] ;
    input \minx[1] ;
    input mostofminx0;
    output instr0100;
    
    
    SB_LUT4 l (.I0(mostofminx0), .I1(\minx[1] ), .I2(\minx[2] ), .I3(\minx[3] ), 
            .O(instr0100)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=43, LSE_LCOL=65, LSE_RCOL=113, LSE_LLINE=446, LSE_RLINE=446 */ ;   // ../../../../code/m_ice_shortcuts.v(44[28:80])
    defparam l.LUT_INIT = 16'b0000000000010000;
    
endmodule
//
// Verilog Description of module m_shiftcounter
//

module m_shiftcounter (CLK_c, s_shift, VCC_net, \B[0] , lastshift, 
            \B[4] , \B[1] , GND_net, \B[3] , \B[2] ) /* synthesis syn_module_defined=1 */ ;
    input CLK_c;
    input [1:0]s_shift;
    input VCC_net;
    input \B[0] ;
    output lastshift;
    input \B[4] ;
    input \B[1] ;
    input GND_net;
    input \B[3] ;
    input \B[2] ;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    wire [4:0]dbg_rshcnt;   // ../../../../code/m_shiftcounter.v(35[18:28])
    wire [4:0]\genblk1.shcnt ;   // ../../../../code/m_shiftcounter.v(128[28:33])
    wire [4:0]\genblk1.shcy ;   // ../../../../code/m_shiftcounter.v(131[21:25])
    wire [3:0]\genblk1.d ;   // ../../../../code/m_shiftcounter.v(129[21:22])
    
    SB_DFF \genblk1.reg_shcnt40_3  (.Q(dbg_rshcnt[3]), .C(CLK_c), .D(\genblk1.shcnt [3])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=50, LSE_LLINE=1037, LSE_RLINE=1048 */ ;   // ../../../../code/m_shiftcounter.v(141[17:78])
    SB_DFF \genblk1.reg_shcnt40_2  (.Q(dbg_rshcnt[2]), .C(CLK_c), .D(\genblk1.shcnt [2])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=50, LSE_LLINE=1037, LSE_RLINE=1048 */ ;   // ../../../../code/m_shiftcounter.v(141[17:78])
    SB_DFF \genblk1.reg_shcnt40_1  (.Q(dbg_rshcnt[1]), .C(CLK_c), .D(\genblk1.shcnt [1])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=50, LSE_LLINE=1037, LSE_RLINE=1048 */ ;   // ../../../../code/m_shiftcounter.v(141[17:78])
    SB_DFF \genblk1.reg_shcnt40_0  (.Q(dbg_rshcnt[0]), .C(CLK_c), .D(\genblk1.shcnt [0])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=50, LSE_LLINE=1037, LSE_RLINE=1048 */ ;   // ../../../../code/m_shiftcounter.v(141[17:78])
    SB_DFF \genblk1.reg_shcnt40_4  (.Q(dbg_rshcnt[4]), .C(CLK_c), .D(\genblk1.shcnt [4])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=50, LSE_LLINE=1037, LSE_RLINE=1048 */ ;   // ../../../../code/m_shiftcounter.v(141[17:78])
    \bn_lcy4(I=16'b1110001000101110)  \genblk1.cmb_shcnt41_3  (.\s_shift[1] (s_shift[1]), 
            .\dbg_rshcnt[4] (dbg_rshcnt[4]), .\genblk1.shcy[3] (\genblk1.shcy [3]), 
            .\genblk1.shcy[4] (\genblk1.shcy [4]), .\genblk1.d[3] (\genblk1.d [3]), 
            .\genblk1.shcnt[4] (\genblk1.shcnt [4])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_shiftcounter.v(138[36:160])
    \bn_lcy4(I=16'b1110001000101110)_U62  \genblk1.cmb_shcnt41_2  (.\s_shift[1] (s_shift[1]), 
            .\dbg_rshcnt[3] (dbg_rshcnt[3]), .\genblk1.shcy[2] (\genblk1.shcy [2]), 
            .\genblk1.shcy[3] (\genblk1.shcy [3]), .\genblk1.d[2] (\genblk1.d [2]), 
            .\genblk1.shcnt[3] (\genblk1.shcnt [3])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_shiftcounter.v(138[36:160])
    \bn_lcy4(I=16'b1110001000101110)_U63  \genblk1.cmb_shcnt41_1  (.\s_shift[1] (s_shift[1]), 
            .\dbg_rshcnt[2] (dbg_rshcnt[2]), .\genblk1.shcy[1] (\genblk1.shcy [1]), 
            .\genblk1.shcy[2] (\genblk1.shcy [2]), .\genblk1.d[1] (\genblk1.d [1]), 
            .\genblk1.shcnt[2] (\genblk1.shcnt [2])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_shiftcounter.v(138[36:160])
    \bn_lcy4(I=16'b1110001000101110)_U64  \genblk1.cmb_shcnt41_0  (.\s_shift[1] (s_shift[1]), 
            .\dbg_rshcnt[1] (dbg_rshcnt[1]), .\genblk1.shcy[0] (\genblk1.shcy [0]), 
            .\genblk1.shcy[1] (\genblk1.shcy [1]), .\genblk1.d[0] (\genblk1.d [0]), 
            .\genblk1.shcnt[1] (\genblk1.shcnt [1])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_shiftcounter.v(138[36:160])
    \bn_lcy4_b(I=16'b1001001110000010)  \genblk1.cmb_shcnt0  (.s_shift({s_shift}), 
            .\dbg_rshcnt[0] (dbg_rshcnt[0]), .VCC_net(VCC_net), .\genblk1.shcy[0] (\genblk1.shcy [0]), 
            .\B[0] (\B[0] ), .\genblk1.shcnt[0] (\genblk1.shcnt [0])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_shiftcounter.v(137[36:164])
    \bn_l4(I=16'b010101010)  \genblk1.cmb_lastshift  (.\s_shift[1] (s_shift[1]), 
            .VCC_net(VCC_net), .\genblk1.shcy[4] (\genblk1.shcy [4]), .lastshift(lastshift)) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_shiftcounter.v(139[34:139])
    \bn_l4(I=16'b1100101011001010)  \genblk1.cmb_d43_1  (.\B[4] (\B[4] ), 
            .\B[1] (\B[1] ), .\s_shift[0] (s_shift[0]), .GND_net(GND_net), 
            .\genblk1.d[3] (\genblk1.d [3])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_shiftcounter.v(135[32:113])
    \bn_l4(I=16'b1100101011001010)_U65  \genblk1.cmb_d43_0  (.\B[3] (\B[3] ), 
            .\B[0] (\B[0] ), .\s_shift[0] (s_shift[0]), .GND_net(GND_net), 
            .\genblk1.d[2] (\genblk1.d [2])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_shiftcounter.v(135[32:113])
    \bn_l4(I=16'b010001000100010)  \genblk1.cmb_d21_1  (.\B[2] (\B[2] ), .\s_shift[0] (s_shift[0]), 
            .GND_net(GND_net), .\genblk1.d[1] (\genblk1.d [1])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_shiftcounter.v(134[32:113])
    \bn_l4(I=16'b010001000100010)_U66  \genblk1.cmb_d21_0  (.\B[1] (\B[1] ), 
            .\s_shift[0] (s_shift[0]), .GND_net(GND_net), .\genblk1.d[0] (\genblk1.d [0])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_shiftcounter.v(134[32:113])
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1110001000101110) 
//

module \bn_lcy4(I=16'b1110001000101110)  (\s_shift[1] , \dbg_rshcnt[4] , 
            \genblk1.shcy[3] , \genblk1.shcy[4] , \genblk1.d[3] , \genblk1.shcnt[4] ) /* synthesis syn_module_defined=1 */ ;
    input \s_shift[1] ;
    input \dbg_rshcnt[4] ;
    input \genblk1.shcy[3] ;
    output \genblk1.shcy[4] ;
    input \genblk1.d[3] ;
    output \genblk1.shcnt[4] ;
    
    
    SB_CARRY y (.CI(\genblk1.shcy[3] ), .I0(\s_shift[1] ), .I1(\dbg_rshcnt[4] ), 
            .CO(\genblk1.shcy[4] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=36, LSE_RCOL=160, LSE_LLINE=138, LSE_RLINE=138 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\genblk1.d[3] ), .I1(\s_shift[1] ), .I2(\dbg_rshcnt[4] ), 
            .I3(\genblk1.shcy[3] ), .O(\genblk1.shcnt[4] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=36, LSE_RCOL=160, LSE_LLINE=138, LSE_RLINE=138 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1110001000101110;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1110001000101110)_U62 
//

module \bn_lcy4(I=16'b1110001000101110)_U62  (\s_shift[1] , \dbg_rshcnt[3] , 
            \genblk1.shcy[2] , \genblk1.shcy[3] , \genblk1.d[2] , \genblk1.shcnt[3] ) /* synthesis syn_module_defined=1 */ ;
    input \s_shift[1] ;
    input \dbg_rshcnt[3] ;
    input \genblk1.shcy[2] ;
    output \genblk1.shcy[3] ;
    input \genblk1.d[2] ;
    output \genblk1.shcnt[3] ;
    
    
    SB_CARRY y (.CI(\genblk1.shcy[2] ), .I0(\s_shift[1] ), .I1(\dbg_rshcnt[3] ), 
            .CO(\genblk1.shcy[3] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=36, LSE_RCOL=160, LSE_LLINE=138, LSE_RLINE=138 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\genblk1.d[2] ), .I1(\s_shift[1] ), .I2(\dbg_rshcnt[3] ), 
            .I3(\genblk1.shcy[2] ), .O(\genblk1.shcnt[3] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=36, LSE_RCOL=160, LSE_LLINE=138, LSE_RLINE=138 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1110001000101110;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1110001000101110)_U63 
//

module \bn_lcy4(I=16'b1110001000101110)_U63  (\s_shift[1] , \dbg_rshcnt[2] , 
            \genblk1.shcy[1] , \genblk1.shcy[2] , \genblk1.d[1] , \genblk1.shcnt[2] ) /* synthesis syn_module_defined=1 */ ;
    input \s_shift[1] ;
    input \dbg_rshcnt[2] ;
    input \genblk1.shcy[1] ;
    output \genblk1.shcy[2] ;
    input \genblk1.d[1] ;
    output \genblk1.shcnt[2] ;
    
    
    SB_CARRY y (.CI(\genblk1.shcy[1] ), .I0(\s_shift[1] ), .I1(\dbg_rshcnt[2] ), 
            .CO(\genblk1.shcy[2] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=36, LSE_RCOL=160, LSE_LLINE=138, LSE_RLINE=138 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\genblk1.d[1] ), .I1(\s_shift[1] ), .I2(\dbg_rshcnt[2] ), 
            .I3(\genblk1.shcy[1] ), .O(\genblk1.shcnt[2] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=36, LSE_RCOL=160, LSE_LLINE=138, LSE_RLINE=138 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1110001000101110;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1110001000101110)_U64 
//

module \bn_lcy4(I=16'b1110001000101110)_U64  (\s_shift[1] , \dbg_rshcnt[1] , 
            \genblk1.shcy[0] , \genblk1.shcy[1] , \genblk1.d[0] , \genblk1.shcnt[1] ) /* synthesis syn_module_defined=1 */ ;
    input \s_shift[1] ;
    input \dbg_rshcnt[1] ;
    input \genblk1.shcy[0] ;
    output \genblk1.shcy[1] ;
    input \genblk1.d[0] ;
    output \genblk1.shcnt[1] ;
    
    
    SB_CARRY y (.CI(\genblk1.shcy[0] ), .I0(\s_shift[1] ), .I1(\dbg_rshcnt[1] ), 
            .CO(\genblk1.shcy[1] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=36, LSE_RCOL=160, LSE_LLINE=138, LSE_RLINE=138 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\genblk1.d[0] ), .I1(\s_shift[1] ), .I2(\dbg_rshcnt[1] ), 
            .I3(\genblk1.shcy[0] ), .O(\genblk1.shcnt[1] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=36, LSE_RCOL=160, LSE_LLINE=138, LSE_RLINE=138 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1110001000101110;
    
endmodule
//
// Verilog Description of module \bn_lcy4_b(I=16'b1001001110000010) 
//

module \bn_lcy4_b(I=16'b1001001110000010)  (s_shift, \dbg_rshcnt[0] , VCC_net, 
            \genblk1.shcy[0] , \B[0] , \genblk1.shcnt[0] ) /* synthesis syn_module_defined=1 */ ;
    input [1:0]s_shift;
    input \dbg_rshcnt[0] ;
    input VCC_net;
    output \genblk1.shcy[0] ;
    input \B[0] ;
    output \genblk1.shcnt[0] ;
    
    
    SB_CARRY y (.CI(VCC_net), .I0(s_shift[0]), .I1(\dbg_rshcnt[0] ), .CO(\genblk1.shcy[0] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=36, LSE_RCOL=164, LSE_LLINE=137, LSE_RLINE=137 */ ;   // ../../../../code/m_ice_shortcuts.v(35[13:63])
    SB_LUT4 l (.I0(s_shift[1]), .I1(s_shift[0]), .I2(\dbg_rshcnt[0] ), 
            .I3(\B[0] ), .O(\genblk1.shcnt[0] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=36, LSE_RCOL=164, LSE_LLINE=137, LSE_RLINE=137 */ ;   // ../../../../code/m_ice_shortcuts.v(34[28:72])
    defparam l.LUT_INIT = 16'b1001001110000010;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010101010) 
//

module \bn_l4(I=16'b010101010)  (\s_shift[1] , VCC_net, \genblk1.shcy[4] , 
            lastshift) /* synthesis syn_module_defined=1 */ ;
    input \s_shift[1] ;
    input VCC_net;
    input \genblk1.shcy[4] ;
    output lastshift;
    
    
    SB_LUT4 l (.I0(\s_shift[1] ), .I1(VCC_net), .I2(VCC_net), .I3(\genblk1.shcy[4] ), 
            .O(lastshift)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=34, LSE_RCOL=139, LSE_LLINE=139, LSE_RLINE=139 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000000010101010;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b1100101011001010) 
//

module \bn_l4(I=16'b1100101011001010)  (\B[4] , \B[1] , \s_shift[0] , 
            GND_net, \genblk1.d[3] ) /* synthesis syn_module_defined=1 */ ;
    input \B[4] ;
    input \B[1] ;
    input \s_shift[0] ;
    input GND_net;
    output \genblk1.d[3] ;
    
    
    SB_LUT4 l (.I0(\B[4] ), .I1(\B[1] ), .I2(\s_shift[0] ), .I3(GND_net), 
            .O(\genblk1.d[3] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=32, LSE_RCOL=113, LSE_LLINE=135, LSE_RLINE=135 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b1100101011001010;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b1100101011001010)_U65 
//

module \bn_l4(I=16'b1100101011001010)_U65  (\B[3] , \B[0] , \s_shift[0] , 
            GND_net, \genblk1.d[2] ) /* synthesis syn_module_defined=1 */ ;
    input \B[3] ;
    input \B[0] ;
    input \s_shift[0] ;
    input GND_net;
    output \genblk1.d[2] ;
    
    
    SB_LUT4 l (.I0(\B[3] ), .I1(\B[0] ), .I2(\s_shift[0] ), .I3(GND_net), 
            .O(\genblk1.d[2] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=32, LSE_RCOL=113, LSE_LLINE=135, LSE_RLINE=135 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b1100101011001010;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010001000100010) 
//

module \bn_l4(I=16'b010001000100010)  (\B[2] , \s_shift[0] , GND_net, 
            \genblk1.d[1] ) /* synthesis syn_module_defined=1 */ ;
    input \B[2] ;
    input \s_shift[0] ;
    input GND_net;
    output \genblk1.d[1] ;
    
    
    SB_LUT4 l (.I0(\B[2] ), .I1(\s_shift[0] ), .I2(GND_net), .I3(GND_net), 
            .O(\genblk1.d[1] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=32, LSE_RCOL=113, LSE_LLINE=134, LSE_RLINE=134 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0010001000100010;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010001000100010)_U66 
//

module \bn_l4(I=16'b010001000100010)_U66  (\B[1] , \s_shift[0] , GND_net, 
            \genblk1.d[0] ) /* synthesis syn_module_defined=1 */ ;
    input \B[1] ;
    input \s_shift[0] ;
    input GND_net;
    output \genblk1.d[0] ;
    
    
    SB_LUT4 l (.I0(\B[1] ), .I1(\s_shift[0] ), .I2(GND_net), .I3(GND_net), 
            .O(\genblk1.d[0] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=46, LSE_LCOL=32, LSE_RCOL=113, LSE_LLINE=134, LSE_RLINE=134 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0010001000100010;
    
endmodule
//
// Verilog Description of module \m_rai(EBRADRWIDTH=10) 
//

module \m_rai(EBRADRWIDTH=10)  (sa34, sa40, STB_O, sram_stb, GND_net, 
            ACK_I, sa20, sa23, sa22, sa21, \INSTR[15] , \INSTR[20] , 
            \B[2] , Rai, \INSTR[16] , \INSTR[21] , \B[3] , \INSTR[17] , 
            \INSTR[22] , \B[4] , \INSTR[18] , \INSTR[23] , \B[5] , 
            \INSTR[19] , \INSTR[24] , \B[6] , \B[7] , \B[8] , \B[9] , 
            \B[10] , \B[11] ) /* synthesis syn_module_defined=1 */ ;
    input sa34;
    input sa40;
    input STB_O;
    input sram_stb;
    input GND_net;
    input ACK_I;
    input sa20;
    input sa23;
    input sa22;
    input sa21;
    input \INSTR[15] ;
    input \INSTR[20] ;
    input \B[2] ;
    output [9:0]Rai;
    input \INSTR[16] ;
    input \INSTR[21] ;
    input \B[3] ;
    input \INSTR[17] ;
    input \INSTR[22] ;
    input \B[4] ;
    input \INSTR[18] ;
    input \INSTR[23] ;
    input \B[5] ;
    input \INSTR[19] ;
    input \INSTR[24] ;
    input \B[6] ;
    input \B[7] ;
    input \B[8] ;
    input \B[9] ;
    input \B[10] ;
    input \B[11] ;
    
    
    wire \genblk1.sel0h , \genblk1.sel0hack ;
    wire [3:0]\genblk1.sel ;   // ../../../../code/m_rai.v(127[21:24])
    
    wire \genblk1.ss0 , \genblk1.ss1 , \genblk1.b0a , \genblk1.b1a , 
        \genblk1.b2a , \genblk1.b3a , \genblk1.b4a ;
    
    SB_LUT4 \genblk1.L_sel0h  (.I0(STB_O), .I1(sram_stb), .I2(sa34), .I3(sa40), 
            .O(\genblk1.sel0h )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(138[41:115])
    defparam \genblk1.L_sel0h .LUT_INIT = 16'b1111111000001111;
    SB_LUT4 \genblk1.L_sel0hack  (.I0(ACK_I), .I1(GND_net), .I2(sa34), 
            .I3(sa40), .O(\genblk1.sel0hack )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(137[41:115])
    defparam \genblk1.L_sel0hack .LUT_INIT = 16'b0000000011100000;
    SB_LUT4 \genblk1.L_sel_0  (.I0(\genblk1.sel0hack ), .I1(\genblk1.sel0h ), 
            .I2(sa20), .I3(GND_net), .O(\genblk1.sel [0])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(139[41:110])
    defparam \genblk1.L_sel_0 .LUT_INIT = 16'b1110000011100000;
    SB_LUT4 \genblk1.L_sel_3  (.I0(sa40), .I1(sram_stb), .I2(STB_O), .I3(sa23), 
            .O(\genblk1.sel [3])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(142[41:122])
    defparam \genblk1.L_sel_3 .LUT_INIT = 16'b1111110100000000;
    SB_LUT4 \genblk1.L_ss0  (.I0(sa22), .I1(\genblk1.sel [3]), .I2(\genblk1.sel [0]), 
            .I3(GND_net), .O(\genblk1.ss0 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(145[41:106])
    defparam \genblk1.L_ss0 .LUT_INIT = 16'b1000000010000000;
    SB_LUT4 \genblk1.L_ss1  (.I0(sa21), .I1(sa22), .I2(\genblk1.sel [3]), 
            .I3(GND_net), .O(\genblk1.ss1 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(146[41:106])
    defparam \genblk1.L_ss1 .LUT_INIT = 16'b1000000010000000;
    SB_LUT4 \genblk1.L_b0a  (.I0(\INSTR[20] ), .I1(\INSTR[15] ), .I2(\genblk1.ss0 ), 
            .I3(\genblk1.ss1 ), .O(\genblk1.b0a )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(156[41:108])
    defparam \genblk1.L_b0a .LUT_INIT = 16'b1100101011110000;
    SB_LUT4 \genblk1.L_Rai0  (.I0(\genblk1.sel [0]), .I1(\B[2] ), .I2(\genblk1.b0a ), 
            .I3(\genblk1.ss1 ), .O(Rai[0])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(157[41:107])
    defparam \genblk1.L_Rai0 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.L_b1a  (.I0(\INSTR[21] ), .I1(\INSTR[16] ), .I2(\genblk1.ss0 ), 
            .I3(\genblk1.ss1 ), .O(\genblk1.b1a )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(167[41:108])
    defparam \genblk1.L_b1a .LUT_INIT = 16'b1100101011110000;
    SB_LUT4 \genblk1.L_Rai1  (.I0(sa21), .I1(\B[3] ), .I2(\genblk1.b1a ), 
            .I3(\genblk1.ss1 ), .O(Rai[1])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(168[41:107])
    defparam \genblk1.L_Rai1 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.L_b2a  (.I0(\INSTR[22] ), .I1(\INSTR[17] ), .I2(\genblk1.ss0 ), 
            .I3(\genblk1.ss1 ), .O(\genblk1.b2a )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(169[41:108])
    defparam \genblk1.L_b2a .LUT_INIT = 16'b1100101011110000;
    SB_LUT4 \genblk1.L_Rai2  (.I0(sa22), .I1(\B[4] ), .I2(\genblk1.b2a ), 
            .I3(\genblk1.ss1 ), .O(Rai[2])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(170[41:107])
    defparam \genblk1.L_Rai2 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.L_b3a  (.I0(\INSTR[23] ), .I1(\INSTR[18] ), .I2(\genblk1.ss0 ), 
            .I3(\genblk1.ss1 ), .O(\genblk1.b3a )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(171[41:108])
    defparam \genblk1.L_b3a .LUT_INIT = 16'b1100101011110000;
    SB_LUT4 \genblk1.L_Rai3  (.I0(\genblk1.sel [3]), .I1(\B[5] ), .I2(\genblk1.b3a ), 
            .I3(\genblk1.ss1 ), .O(Rai[3])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(172[41:107])
    defparam \genblk1.L_Rai3 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.L_b4a  (.I0(\INSTR[24] ), .I1(\INSTR[19] ), .I2(\genblk1.ss0 ), 
            .I3(\genblk1.ss1 ), .O(\genblk1.b4a )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(181[41:108])
    defparam \genblk1.L_b4a .LUT_INIT = 16'b1100101011110000;
    SB_LUT4 \genblk1.L_Rai4  (.I0(GND_net), .I1(\B[6] ), .I2(\genblk1.b4a ), 
            .I3(\genblk1.ss1 ), .O(Rai[4])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(182[41:105])
    defparam \genblk1.L_Rai4 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.L_Rai5  (.I0(GND_net), .I1(\B[7] ), .I2(\genblk1.ss0 ), 
            .I3(\genblk1.ss1 ), .O(Rai[5])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(193[41:102])
    defparam \genblk1.L_Rai5 .LUT_INIT = 16'b0000000011001111;
    SB_LUT4 \genblk1.L_Rai6  (.I0(\B[8] ), .I1(\genblk1.ss0 ), .I2(\genblk1.ss1 ), 
            .I3(GND_net), .O(Rai[6])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(198[41:102])
    defparam \genblk1.L_Rai6 .LUT_INIT = 16'b0000100000001000;
    SB_LUT4 \genblk1.L_Rai7  (.I0(\B[9] ), .I1(\genblk1.ss0 ), .I2(\genblk1.ss1 ), 
            .I3(GND_net), .O(Rai[7])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(199[41:102])
    defparam \genblk1.L_Rai7 .LUT_INIT = 16'b0000100000001000;
    SB_LUT4 \genblk1.genblk1.L_Rai8  (.I0(\B[10] ), .I1(\genblk1.ss0 ), 
            .I2(\genblk1.ss1 ), .I3(GND_net), .O(Rai[8])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(201[44:106])
    defparam \genblk1.genblk1.L_Rai8 .LUT_INIT = 16'b0000100000001000;
    SB_LUT4 \genblk1.genblk1.genblk1.L_Rai9  (.I0(\B[11] ), .I1(\genblk1.ss0 ), 
            .I2(\genblk1.ss1 ), .I3(GND_net), .O(Rai[9])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=52, LSE_LLINE=949, LSE_RLINE=967 */ ;   // ../../../../code/m_rai.v(203[47:109])
    defparam \genblk1.genblk1.genblk1.L_Rai9 .LUT_INIT = 16'b0000100000001000;
    
endmodule
//
// Verilog Description of module \m_progressctrl(MULDIV=0,MTIMETAP_LOWLIM=14,DISREGARD_WB4_3_55=1) 
//

module \m_progressctrl(MULDIV=0,MTIMETAP_LOWLIM=14,DISREGARD_WB4_3_55=1)  (corerunning, 
            sa30, \B[1] , \B[0] , sram_stb, CLK_c, buserror, STB_O, 
            sa43, GND_net, \B[31] , \B[30] , bmask, \SEL_O[3] , 
            sa41, rlastshift, iwe, WE_O, sa15, lastshift, sa32, 
            enaQ, sa24, sa27, sa26, sa25, sa33, progress_ucode, 
            n2345, sa14, sa42) /* synthesis syn_module_defined=1 */ ;
    input corerunning;
    input sa30;
    input \B[1] ;
    input \B[0] ;
    output sram_stb;
    input CLK_c;
    input buserror;
    output STB_O;
    input sa43;
    input GND_net;
    input \B[31] ;
    input \B[30] ;
    output [3:0]bmask;
    output \SEL_O[3] ;
    input sa41;
    input rlastshift;
    output iwe;
    output WE_O;
    input sa15;
    input lastshift;
    input sa32;
    output enaQ;
    input sa24;
    input sa27;
    input sa26;
    input sa25;
    input sa33;
    output progress_ucode;
    input n2345;
    input sa14;
    input sa42;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    wire badalignment, next_sram_stb, next_STB_O, ctrlreg_we_N_84, n2764, 
        \genblk4.next_WE_O ;
    wire [3:0]\blka.cmb_bsel ;   // ../../../../code/m_progressctrl.v(119[30:38])
    
    wire \blka.en ;
    wire [3:0]\blka.cmb_asel ;   // ../../../../code/m_progressctrl.v(119[21:29])
    
    wire \blka.usedefault , n4, n4_adj_311;
    
    SB_LUT4 badalignment_I_0_70_4_lut (.I0(corerunning), .I1(sa30), .I2(\B[1] ), 
            .I3(\B[0] ), .O(badalignment));   // ../../../../code/m_progressctrl.v(150[32:69])
    defparam badalignment_I_0_70_4_lut.LUT_INIT = 16'hddd5;
    SB_DFFSR \genblk3.rsram_stb_65  (.Q(sram_stb), .C(CLK_c), .D(next_sram_stb), 
            .R(buserror));   // ../../../../code/m_progressctrl.v(174[17] 181[15])
    SB_DFFSR \genblk3.rSTB_O_64  (.Q(STB_O), .C(CLK_c), .D(next_STB_O), 
            .R(buserror));   // ../../../../code/m_progressctrl.v(174[17] 181[15])
    SB_LUT4 i1_3_lut (.I0(sa43), .I1(ctrlreg_we_N_84), .I2(buserror), 
            .I3(GND_net), .O(n2764));   // ../../../../code/m_progressctrl.v(233[17] 240[15])
    defparam i1_3_lut.LUT_INIT = 16'hcece;
    SB_LUT4 \genblk4.next_WE_O_I_0_3_lut  (.I0(\B[31] ), .I1(badalignment), 
            .I2(\B[30] ), .I3(GND_net), .O(\genblk4.next_WE_O ));   // ../../../../code/m_progressctrl.v(231[27:58])
    defparam \genblk4.next_WE_O_I_0_3_lut .LUT_INIT = 16'h3232;
    SB_DFFESS \blka.r_bsel1  (.Q(bmask[1]), .C(CLK_c), .E(\blka.en ), 
            .D(\blka.cmb_bsel [1]), .S(GND_net)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=1064, LSE_RLINE=1119 */ ;   // ../../../../code/m_progressctrl.v(134[20:87])
    SB_DFFESS \blka.r_bsel2  (.Q(bmask[2]), .C(CLK_c), .E(\blka.en ), 
            .D(\blka.cmb_bsel [2]), .S(GND_net)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=1064, LSE_RLINE=1119 */ ;   // ../../../../code/m_progressctrl.v(135[20:87])
    SB_DFFESS \blka.r_bsel3  (.Q(bmask[3]), .C(CLK_c), .E(\blka.en ), 
            .D(\blka.cmb_bsel [3]), .S(GND_net)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=1064, LSE_RLINE=1119 */ ;   // ../../../../code/m_progressctrl.v(136[20:87])
    SB_DFFESR \blka.r_asel3  (.Q(\SEL_O[3] ), .C(CLK_c), .E(\blka.en ), 
            .D(\blka.cmb_asel [3]), .R(GND_net)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=1064, LSE_RLINE=1119 */ ;   // ../../../../code/m_progressctrl.v(140[20:87])
    SB_LUT4 \genblk6.l_iwe  (.I0(rlastshift), .I1(WE_O), .I2(sa41), .I3(corerunning), 
            .O(iwe)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=1064, LSE_RLINE=1119 */ ;   // ../../../../code/m_progressctrl.v(347[41:112])
    defparam \genblk6.l_iwe .LUT_INIT = 16'b0000000100000000;
    SB_LUT4 i1_4_lut (.I0(STB_O), .I1(sa15), .I2(lastshift), .I3(sa32), 
            .O(enaQ));   // ../../../../code/m_progressctrl.v(311[30:65])
    defparam i1_4_lut.LUT_INIT = 16'h0504;
    SB_LUT4 \blka.l_cmb_bsel0  (.I0(\B[0] ), .I1(\B[1] ), .I2(sa24), .I3(\blka.usedefault ), 
            .O(\blka.cmb_bsel [0])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=1064, LSE_RLINE=1119 */ ;   // ../../../../code/m_progressctrl.v(123[41:120])
    defparam \blka.l_cmb_bsel0 .LUT_INIT = 16'b0000000001001110;
    SB_LUT4 \blka.l_usedefault  (.I0(sa24), .I1(sa25), .I2(sa26), .I3(sa27), 
            .O(\blka.usedefault )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=1064, LSE_RLINE=1119 */ ;   // ../../../../code/m_progressctrl.v(122[41:114])
    defparam \blka.l_usedefault .LUT_INIT = 16'b1111111111111001;
    SB_LUT4 \blka.l_cmb_bsel1  (.I0(\B[0] ), .I1(\B[1] ), .I2(sa24), .I3(\blka.usedefault ), 
            .O(\blka.cmb_bsel [1])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=1064, LSE_RLINE=1119 */ ;   // ../../../../code/m_progressctrl.v(124[41:120])
    defparam \blka.l_cmb_bsel1 .LUT_INIT = 16'b0000000001001101;
    SB_LUT4 \blka.l_cmb_bsel2  (.I0(\B[0] ), .I1(\B[1] ), .I2(sa24), .I3(\blka.usedefault ), 
            .O(\blka.cmb_bsel [2])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=1064, LSE_RLINE=1119 */ ;   // ../../../../code/m_progressctrl.v(125[41:120])
    defparam \blka.l_cmb_bsel2 .LUT_INIT = 16'b0000000000011011;
    SB_LUT4 \blka.l_cmb_bsel3  (.I0(\B[0] ), .I1(\B[1] ), .I2(sa24), .I3(\blka.usedefault ), 
            .O(\blka.cmb_bsel [3])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=1064, LSE_RLINE=1119 */ ;   // ../../../../code/m_progressctrl.v(126[41:120])
    defparam \blka.l_cmb_bsel3 .LUT_INIT = 16'b0000000000010111;
    SB_LUT4 \blka.l_cmb_asel3  (.I0(GND_net), .I1(GND_net), .I2(\blka.cmb_bsel [3]), 
            .I3(GND_net), .O(\blka.cmb_asel [3])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=1064, LSE_RLINE=1119 */ ;   // ../../../../code/m_progressctrl.v(130[41:121])
    defparam \blka.l_cmb_asel3 .LUT_INIT = 16'b0000111100001111;
    SB_LUT4 \blka.l_en  (.I0(sa41), .I1(GND_net), .I2(GND_net), .I3(GND_net), 
            .O(\blka.en )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=1064, LSE_RLINE=1119 */ ;   // ../../../../code/m_progressctrl.v(132[41:100])
    defparam \blka.l_en .LUT_INIT = 16'b1110111011101110;
    SB_DFFESS \blka.r_bsel0  (.Q(bmask[0]), .C(CLK_c), .E(\blka.en ), 
            .D(\blka.cmb_bsel [0]), .S(GND_net)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=48, LSE_LLINE=1064, LSE_RLINE=1119 */ ;   // ../../../../code/m_progressctrl.v(133[20:87])
    SB_DFFESR \genblk4.rWE_O_66  (.Q(WE_O), .C(CLK_c), .E(n2764), .D(\genblk4.next_WE_O ), 
            .R(ctrlreg_we_N_84));   // ../../../../code/m_progressctrl.v(233[17] 240[15])
    SB_LUT4 i1_2_lut (.I0(lastshift), .I1(sa33), .I2(GND_net), .I3(GND_net), 
            .O(n4));   // ../../../../code/m_progressctrl.v(317[38:70])
    defparam i1_2_lut.LUT_INIT = 16'hbbbb;
    SB_LUT4 progress_ucode_I_0_4_lut (.I0(rlastshift), .I1(buserror), .I2(STB_O), 
            .I3(n4), .O(progress_ucode));   // ../../../../code/m_progressctrl.v(317[37:91])
    defparam progress_ucode_I_0_4_lut.LUT_INIT = 16'hcfce;
    SB_LUT4 next_STB_O_I_13_4_lut (.I0(\B[31] ), .I1(STB_O), .I2(n4_adj_311), 
            .I3(n2345), .O(next_STB_O));   // ../../../../code/m_progressctrl.v(172[33:95])
    defparam next_STB_O_I_13_4_lut.LUT_INIT = 16'h50dc;
    SB_LUT4 ctrlreg_we_I_7_2_lut (.I0(sa14), .I1(buserror), .I2(GND_net), 
            .I3(GND_net), .O(ctrlreg_we_N_84));   // ../../../../code/m_progressctrl.v(234[17:43])
    defparam ctrlreg_we_I_7_2_lut.LUT_INIT = 16'hdddd;
    SB_LUT4 i1_2_lut_3_lut (.I0(badalignment), .I1(sa42), .I2(\B[30] ), 
            .I3(GND_net), .O(n4_adj_311));   // ../../../../code/m_progressctrl.v(172[33:72])
    defparam i1_2_lut_3_lut.LUT_INIT = 16'h4040;
    SB_LUT4 next_sram_stb_I_16_3_lut_4_lut (.I0(badalignment), .I1(sa42), 
            .I2(sram_stb), .I3(\B[31] ), .O(next_sram_stb));   // ../../../../code/m_progressctrl.v(172[33:72])
    defparam next_sram_stb_I_16_3_lut_4_lut.LUT_INIT = 16'hf4f0;
    
endmodule
//
// Verilog Description of module \m_opreg(RVC=0) 
//

module \m_opreg(RVC=0)  (CLK_c, is_valid_instrhigh, Di, \INSTR[14] , 
            \INSTR[13] , \INSTR[12] , \INSTR[11] , \INSTR[10] , \INSTR[9] , 
            \INSTR[8] , \INSTR[7] , \INSTR[6] , \INSTR[5] , \INSTR[4] , 
            \INSTR[3] , \INSTR[2] , \INSTR[1] , \INSTR[0] , FUNC7, 
            \INSTR[24] , \INSTR[23] , \INSTR[22] , \INSTR[21] , \INSTR[20] , 
            \INSTR[19] , \INSTR[18] , \INSTR[17] , \INSTR[16] , \INSTR[15] ) /* synthesis syn_module_defined=1 */ ;
    input CLK_c;
    input is_valid_instrhigh;
    input [31:0]Di;
    output \INSTR[14] ;
    output \INSTR[13] ;
    output \INSTR[12] ;
    output \INSTR[11] ;
    output \INSTR[10] ;
    output \INSTR[9] ;
    output \INSTR[8] ;
    output \INSTR[7] ;
    output \INSTR[6] ;
    output \INSTR[5] ;
    output \INSTR[4] ;
    output \INSTR[3] ;
    output \INSTR[2] ;
    output \INSTR[1] ;
    output \INSTR[0] ;
    output [6:0]FUNC7;
    output \INSTR[24] ;
    output \INSTR[23] ;
    output \INSTR[22] ;
    output \INSTR[21] ;
    output \INSTR[20] ;
    output \INSTR[19] ;
    output \INSTR[18] ;
    output \INSTR[17] ;
    output \INSTR[16] ;
    output \INSTR[15] ;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    SB_DFFE \genblk1.OpC15_0_14  (.Q(\INSTR[14] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[14])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(62[18:98])
    SB_DFFE \genblk1.OpC15_0_13  (.Q(\INSTR[13] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[13])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(62[18:98])
    SB_DFFE \genblk1.OpC15_0_12  (.Q(\INSTR[12] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[12])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(62[18:98])
    SB_DFFE \genblk1.OpC15_0_11  (.Q(\INSTR[11] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[11])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(62[18:98])
    SB_DFFE \genblk1.OpC15_0_10  (.Q(\INSTR[10] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[10])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(62[18:98])
    SB_DFFE \genblk1.OpC15_0_9  (.Q(\INSTR[9] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[9])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(62[18:98])
    SB_DFFE \genblk1.OpC15_0_8  (.Q(\INSTR[8] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[8])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(62[18:98])
    SB_DFFE \genblk1.OpC15_0_7  (.Q(\INSTR[7] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[7])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(62[18:98])
    SB_DFFE \genblk1.OpC15_0_6  (.Q(\INSTR[6] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[6])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(62[18:98])
    SB_DFFE \genblk1.OpC15_0_5  (.Q(\INSTR[5] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[5])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(62[18:98])
    SB_DFFE \genblk1.OpC15_0_4  (.Q(\INSTR[4] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[4])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(62[18:98])
    SB_DFFE \genblk1.OpC15_0_3  (.Q(\INSTR[3] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[3])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(62[18:98])
    SB_DFFE \genblk1.OpC15_0_2  (.Q(\INSTR[2] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[2])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(62[18:98])
    SB_DFFE \genblk1.OpC15_0_1  (.Q(\INSTR[1] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[1])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(62[18:98])
    SB_DFFE \genblk1.OpC15_0_0  (.Q(\INSTR[0] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[0])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(62[18:98])
    SB_DFFE \genblk1.OpC31_16_31  (.Q(FUNC7[6]), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[31])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(63[18:99])
    SB_DFFE \genblk1.OpC31_16_30  (.Q(FUNC7[5]), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[30])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(63[18:99])
    SB_DFFE \genblk1.OpC31_16_29  (.Q(FUNC7[4]), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[29])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(63[18:99])
    SB_DFFE \genblk1.OpC31_16_28  (.Q(FUNC7[3]), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[28])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(63[18:99])
    SB_DFFE \genblk1.OpC31_16_27  (.Q(FUNC7[2]), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[27])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(63[18:99])
    SB_DFFE \genblk1.OpC31_16_26  (.Q(FUNC7[1]), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[26])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(63[18:99])
    SB_DFFE \genblk1.OpC31_16_25  (.Q(FUNC7[0]), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[25])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(63[18:99])
    SB_DFFE \genblk1.OpC31_16_24  (.Q(\INSTR[24] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[24])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(63[18:99])
    SB_DFFE \genblk1.OpC31_16_23  (.Q(\INSTR[23] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[23])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(63[18:99])
    SB_DFFE \genblk1.OpC31_16_22  (.Q(\INSTR[22] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[22])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(63[18:99])
    SB_DFFE \genblk1.OpC31_16_21  (.Q(\INSTR[21] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[21])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(63[18:99])
    SB_DFFE \genblk1.OpC31_16_20  (.Q(\INSTR[20] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[20])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(63[18:99])
    SB_DFFE \genblk1.OpC31_16_19  (.Q(\INSTR[19] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[19])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(63[18:99])
    SB_DFFE \genblk1.OpC31_16_18  (.Q(\INSTR[18] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[18])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(63[18:99])
    SB_DFFE \genblk1.OpC31_16_17  (.Q(\INSTR[17] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[17])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(63[18:99])
    SB_DFFE \genblk1.OpC31_16_16  (.Q(\INSTR[16] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[16])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(63[18:99])
    SB_DFFE \genblk1.OpC15_0_15  (.Q(\INSTR[15] ), .C(CLK_c), .E(is_valid_instrhigh), 
            .D(Di[15])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=53, LSE_LLINE=998, LSE_RLINE=1011 */ ;   // ../../../../code/m_opreg.v(62[18:98])
    
endmodule
//
// Verilog Description of module \m_mimux(HIGHLEVEL=0) 
//

module \m_mimux(HIGHLEVEL=0)  (sra_msb, DAT_O, GND_net, Di, CLK_c, 
            sa00, ACK_I, corerunning, \ADR_O[31] , \ADR_O[30] , \ADR_O[29] , 
            \ADR_O[28] , \ADR_O[27] , \ADR_O[26] , \ADR_O[25] , \ADR_O[24] , 
            \ADR_O[23] , \ADR_O[22] , \ADR_O[21] , \ADR_O[20] , \ADR_O[19] , 
            \ADR_O[18] , \ADR_O[17] , \ADR_O[16] , \ADR_O[15] , \ADR_O[14] , 
            \ADR_O[13] , \ADR_O[12] , \ADR_O[11] , \ADR_O[10] , \ADR_O[9] , 
            \rDee[8] , \ADR_O[8] , \ADR_O[7] , \ADR_O[6] , \ADR_O[5] , 
            \ADR_O[4] , \ADR_O[3] , \ADR_O[2] , \ADR_O[1] ) /* synthesis syn_module_defined=1 */ ;
    input sra_msb;
    input [31:0]DAT_O;
    input GND_net;
    output [31:0]Di;
    input CLK_c;
    input sa00;
    input ACK_I;
    input corerunning;
    input \ADR_O[31] ;
    input \ADR_O[30] ;
    input \ADR_O[29] ;
    input \ADR_O[28] ;
    input \ADR_O[27] ;
    input \ADR_O[26] ;
    input \ADR_O[25] ;
    input \ADR_O[24] ;
    input \ADR_O[23] ;
    input \ADR_O[22] ;
    input \ADR_O[21] ;
    input \ADR_O[20] ;
    input \ADR_O[19] ;
    input \ADR_O[18] ;
    input \ADR_O[17] ;
    input \ADR_O[16] ;
    input \ADR_O[15] ;
    input \ADR_O[14] ;
    input \ADR_O[13] ;
    input \ADR_O[12] ;
    input \ADR_O[11] ;
    input \ADR_O[10] ;
    input \ADR_O[9] ;
    input \rDee[8] ;
    input \ADR_O[8] ;
    input \ADR_O[7] ;
    input \ADR_O[6] ;
    input \ADR_O[5] ;
    input \ADR_O[4] ;
    input \ADR_O[3] ;
    input \ADR_O[2] ;
    input \ADR_O[1] ;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    wire \genblk1.sa00mod , \genblk1.cmb_sa00mod ;
    
    SB_LUT4 \genblk1.cmb_31  (.I0(sra_msb), .I1(GND_net), .I2(DAT_O[31]), 
            .I3(\genblk1.sa00mod ), .O(Di[31])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_31 .LUT_INIT = 16'b1111000011001010;
    SB_DFF \genblk1.sa00mod_r  (.Q(\genblk1.sa00mod ), .C(CLK_c), .D(\genblk1.cmb_sa00mod )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(46[17:66])
    SB_LUT4 \genblk1.inst_presa00mod  (.I0(sa00), .I1(ACK_I), .I2(GND_net), 
            .I3(corerunning), .O(\genblk1.cmb_sa00mod )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(45[41:129])
    defparam \genblk1.inst_presa00mod .LUT_INIT = 16'b0000000100000000;
    SB_LUT4 \genblk1.cmb_30  (.I0(\ADR_O[31] ), .I1(GND_net), .I2(DAT_O[30]), 
            .I3(\genblk1.sa00mod ), .O(Di[30])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_30 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_29  (.I0(\ADR_O[30] ), .I1(GND_net), .I2(DAT_O[29]), 
            .I3(\genblk1.sa00mod ), .O(Di[29])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_29 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_28  (.I0(\ADR_O[29] ), .I1(GND_net), .I2(DAT_O[28]), 
            .I3(\genblk1.sa00mod ), .O(Di[28])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_28 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_27  (.I0(\ADR_O[28] ), .I1(GND_net), .I2(DAT_O[27]), 
            .I3(\genblk1.sa00mod ), .O(Di[27])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_27 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_26  (.I0(\ADR_O[27] ), .I1(GND_net), .I2(DAT_O[26]), 
            .I3(\genblk1.sa00mod ), .O(Di[26])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_26 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_25  (.I0(\ADR_O[26] ), .I1(GND_net), .I2(DAT_O[25]), 
            .I3(\genblk1.sa00mod ), .O(Di[25])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_25 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_24  (.I0(\ADR_O[25] ), .I1(GND_net), .I2(DAT_O[24]), 
            .I3(\genblk1.sa00mod ), .O(Di[24])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_24 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_23  (.I0(\ADR_O[24] ), .I1(GND_net), .I2(DAT_O[23]), 
            .I3(\genblk1.sa00mod ), .O(Di[23])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_23 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_22  (.I0(\ADR_O[23] ), .I1(GND_net), .I2(DAT_O[22]), 
            .I3(\genblk1.sa00mod ), .O(Di[22])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_22 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_21  (.I0(\ADR_O[22] ), .I1(GND_net), .I2(DAT_O[21]), 
            .I3(\genblk1.sa00mod ), .O(Di[21])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_21 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_20  (.I0(\ADR_O[21] ), .I1(GND_net), .I2(DAT_O[20]), 
            .I3(\genblk1.sa00mod ), .O(Di[20])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_20 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_19  (.I0(\ADR_O[20] ), .I1(GND_net), .I2(DAT_O[19]), 
            .I3(\genblk1.sa00mod ), .O(Di[19])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_19 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_18  (.I0(\ADR_O[19] ), .I1(GND_net), .I2(DAT_O[18]), 
            .I3(\genblk1.sa00mod ), .O(Di[18])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_18 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_17  (.I0(\ADR_O[18] ), .I1(GND_net), .I2(DAT_O[17]), 
            .I3(\genblk1.sa00mod ), .O(Di[17])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_17 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_16  (.I0(\ADR_O[17] ), .I1(GND_net), .I2(DAT_O[16]), 
            .I3(\genblk1.sa00mod ), .O(Di[16])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_16 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_15  (.I0(\ADR_O[16] ), .I1(GND_net), .I2(DAT_O[15]), 
            .I3(\genblk1.sa00mod ), .O(Di[15])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_15 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_14  (.I0(\ADR_O[15] ), .I1(GND_net), .I2(DAT_O[14]), 
            .I3(\genblk1.sa00mod ), .O(Di[14])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_14 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_13  (.I0(\ADR_O[14] ), .I1(GND_net), .I2(DAT_O[13]), 
            .I3(\genblk1.sa00mod ), .O(Di[13])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_13 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_12  (.I0(\ADR_O[13] ), .I1(GND_net), .I2(DAT_O[12]), 
            .I3(\genblk1.sa00mod ), .O(Di[12])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_12 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_11  (.I0(\ADR_O[12] ), .I1(GND_net), .I2(DAT_O[11]), 
            .I3(\genblk1.sa00mod ), .O(Di[11])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_11 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_10  (.I0(\ADR_O[11] ), .I1(GND_net), .I2(DAT_O[10]), 
            .I3(\genblk1.sa00mod ), .O(Di[10])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_10 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_9  (.I0(\ADR_O[10] ), .I1(GND_net), .I2(DAT_O[9]), 
            .I3(\genblk1.sa00mod ), .O(Di[9])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_9 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_8  (.I0(\ADR_O[9] ), .I1(\rDee[8] ), .I2(DAT_O[8]), 
            .I3(\genblk1.sa00mod ), .O(Di[8])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_8 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_7  (.I0(\ADR_O[8] ), .I1(GND_net), .I2(DAT_O[7]), 
            .I3(\genblk1.sa00mod ), .O(Di[7])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_7 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_6  (.I0(\ADR_O[7] ), .I1(GND_net), .I2(DAT_O[6]), 
            .I3(\genblk1.sa00mod ), .O(Di[6])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_6 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_5  (.I0(\ADR_O[6] ), .I1(GND_net), .I2(DAT_O[5]), 
            .I3(\genblk1.sa00mod ), .O(Di[5])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_5 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_4  (.I0(\ADR_O[5] ), .I1(GND_net), .I2(DAT_O[4]), 
            .I3(\genblk1.sa00mod ), .O(Di[4])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_4 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_3  (.I0(\ADR_O[4] ), .I1(GND_net), .I2(DAT_O[3]), 
            .I3(\genblk1.sa00mod ), .O(Di[3])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_3 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_2  (.I0(\ADR_O[3] ), .I1(GND_net), .I2(DAT_O[2]), 
            .I3(\genblk1.sa00mod ), .O(Di[2])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_2 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_1  (.I0(\ADR_O[2] ), .I1(GND_net), .I2(DAT_O[1]), 
            .I3(\genblk1.sa00mod ), .O(Di[1])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_1 .LUT_INIT = 16'b1111000011001010;
    SB_LUT4 \genblk1.cmb_0  (.I0(\ADR_O[1] ), .I1(GND_net), .I2(DAT_O[0]), 
            .I3(\genblk1.sa00mod ), .O(Di[0])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=54, LSE_LLINE=770, LSE_RLINE=784 */ ;   // ../../../../code/m_mimux.v(47[41:107])
    defparam \genblk1.cmb_0 .LUT_INIT = 16'b1111000011001010;
    
endmodule
//
// Verilog Description of module \m_inputmux(HIGHLEVEL=0,MTIMETAP_LOWLIM=14) 
//

module \m_inputmux(HIGHLEVEL=0,MTIMETAP_LOWLIM=14)  (n5223, VCC_net, \rDee[8] , 
            CLK_c) /* synthesis syn_module_defined=1 */ ;
    input n5223;
    input VCC_net;
    output \rDee[8] ;
    input CLK_c;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    SB_DFFE \genblk1.ireg__i1  (.Q(\rDee[8] ), .C(CLK_c), .E(VCC_net), 
            .D(n5223));   // ../../../../code/m_inputmux.v(89[17] 91[28])
    
endmodule
//
// Verilog Description of module m_immexp_zfind_q
//

module m_immexp_zfind_q (\INSTR[8] , \INSTR[9] , \INSTR[10] , \INSTR[11] , 
            B, FUNC7, \INSTR[20] , \INSTR[12] , \INSTR[13] , \INSTR[14] , 
            \INSTR[15] , \INSTR[16] , \INSTR[17] , \INSTR[18] , \INSTR[19] , 
            \INSTR[21] , \INSTR[22] , \INSTR[23] , \INSTR[24] , GND_net, 
            CLK_c, enaQ, \ADR_O[1] , \ADR_O[2] , \ADR_O[3] , \ADR_O[4] , 
            \ADR_O[5] , \ADR_O[6] , \ADR_O[7] , \ADR_O[8] , \ADR_O[9] , 
            \ADR_O[10] , \ADR_O[11] , \ADR_O[12] , \ADR_O[13] , \ADR_O[14] , 
            \ADR_O[15] , \ADR_O[16] , \ADR_O[17] , \ADR_O[18] , \ADR_O[19] , 
            \ADR_O[20] , \ADR_O[21] , \ADR_O[22] , \ADR_O[23] , \ADR_O[24] , 
            \ADR_O[25] , \ADR_O[26] , \ADR_O[27] , \ADR_O[28] , \ADR_O[29] , 
            \ADR_O[30] , \ADR_O[31] , rzcy32, \s_cyclecnt[0] , \INSTR[6] , 
            \INSTR[5] , \INSTR[4] , \INSTR[2] , \INSTR[3] , \INSTR[7] , 
            VCC_net, sa14, corerunning, \ADR_O[0] ) /* synthesis syn_module_defined=1 */ ;
    input \INSTR[8] ;
    input \INSTR[9] ;
    input \INSTR[10] ;
    input \INSTR[11] ;
    input [31:0]B;
    input [6:0]FUNC7;
    input \INSTR[20] ;
    input \INSTR[12] ;
    input \INSTR[13] ;
    input \INSTR[14] ;
    input \INSTR[15] ;
    input \INSTR[16] ;
    input \INSTR[17] ;
    input \INSTR[18] ;
    input \INSTR[19] ;
    input \INSTR[21] ;
    input \INSTR[22] ;
    input \INSTR[23] ;
    input \INSTR[24] ;
    input GND_net;
    input CLK_c;
    input enaQ;
    output \ADR_O[1] ;
    output \ADR_O[2] ;
    output \ADR_O[3] ;
    output \ADR_O[4] ;
    output \ADR_O[5] ;
    output \ADR_O[6] ;
    output \ADR_O[7] ;
    output \ADR_O[8] ;
    output \ADR_O[9] ;
    output \ADR_O[10] ;
    output \ADR_O[11] ;
    output \ADR_O[12] ;
    output \ADR_O[13] ;
    output \ADR_O[14] ;
    output \ADR_O[15] ;
    output \ADR_O[16] ;
    output \ADR_O[17] ;
    output \ADR_O[18] ;
    output \ADR_O[19] ;
    output \ADR_O[20] ;
    output \ADR_O[21] ;
    output \ADR_O[22] ;
    output \ADR_O[23] ;
    output \ADR_O[24] ;
    output \ADR_O[25] ;
    output \ADR_O[26] ;
    output \ADR_O[27] ;
    output \ADR_O[28] ;
    output \ADR_O[29] ;
    output \ADR_O[30] ;
    output \ADR_O[31] ;
    output rzcy32;
    input \s_cyclecnt[0] ;
    input \INSTR[6] ;
    input \INSTR[5] ;
    input \INSTR[4] ;
    input \INSTR[2] ;
    input \INSTR[3] ;
    input \INSTR[7] ;
    input VCC_net;
    input sa14;
    input corerunning;
    output \ADR_O[0] ;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    wire \genblk1.sa09 , \genblk1.sa08 , \genblk1.sa07 , \genblk1.imm1a , 
        \genblk1.imm2a , \genblk1.imm3a , \genblk1.imm4a , \genblk1.sa10 ;
    wire [31:0]\genblk1.F ;   // ../../../../code/m_immexp_zfind_q.v(164[25:26])
    
    wire \genblk1.imm11a , \genblk1.sa31 , \genblk1.sa13b , \genblk1.sa13 , 
        \genblk1.zcy32 , \genblk1.BisnotZero , \genblk1.nsa14_or_nCORERUNNING , 
        \genblk1.sa07h , \genblk1.sa09h , \genblk1.imm0a , \genblk1.zcy1 , 
        \genblk1.zcy2 , \genblk1.zcy3 , \genblk1.zcy4 , \genblk1.zcy5 , 
        \genblk1.zcy6 , \genblk1.zcy7 , \genblk1.zcy8 , \genblk1.zcy9 , 
        \genblk1.zcy10 , \genblk1.zcy11 , \genblk1.imm11b , \genblk1.zcy12 , 
        \genblk1.zcy13 , \genblk1.zcy14 , \genblk1.zcy15 , \genblk1.zcy16 , 
        \genblk1.zcy17 , \genblk1.zcy18 , \genblk1.zcy19 , \genblk1.zcy20 , 
        \genblk1.zcy21 , \genblk1.zcy22 , \genblk1.zcy23 , \genblk1.zcy24 , 
        \genblk1.zcy25 , \genblk1.zcy26 , \genblk1.zcy27 , \genblk1.zcy28 , 
        \genblk1.zcy29 , \genblk1.zcy30 , \genblk1.zcy31 ;
    
    SB_LUT4 \genblk1.L_1790  (.I0(\INSTR[8] ), .I1(\genblk1.sa07 ), .I2(\genblk1.sa08 ), 
            .I3(\genblk1.sa09 ), .O(\genblk1.imm1a )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(284[43:108])
    defparam \genblk1.L_1790 .LUT_INIT = 16'b1111001000100000;
    SB_LUT4 \genblk1.L_1792  (.I0(\INSTR[9] ), .I1(\genblk1.sa07 ), .I2(\genblk1.sa08 ), 
            .I3(\genblk1.sa09 ), .O(\genblk1.imm2a )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(286[43:108])
    defparam \genblk1.L_1792 .LUT_INIT = 16'b1111001000100000;
    SB_LUT4 \genblk1.L_1794  (.I0(\INSTR[10] ), .I1(\genblk1.sa07 ), .I2(\genblk1.sa08 ), 
            .I3(\genblk1.sa09 ), .O(\genblk1.imm3a )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(288[43:109])
    defparam \genblk1.L_1794 .LUT_INIT = 16'b1111001000100000;
    SB_LUT4 \genblk1.L_1796  (.I0(\INSTR[11] ), .I1(\genblk1.sa07 ), .I2(\genblk1.sa08 ), 
            .I3(\genblk1.sa09 ), .O(\genblk1.imm4a )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(290[43:109])
    defparam \genblk1.L_1796 .LUT_INIT = 16'b1111001000100000;
    SB_LUT4 \genblk1.L_1798  (.I0(FUNC7[0]), .I1(B[5]), .I2(\genblk1.sa09 ), 
            .I3(\genblk1.sa10 ), .O(\genblk1.F [5])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(292[43:109])
    defparam \genblk1.L_1798 .LUT_INIT = 16'b1100000010101010;
    SB_LUT4 \genblk1.L_1799  (.I0(FUNC7[1]), .I1(B[6]), .I2(\genblk1.sa09 ), 
            .I3(\genblk1.sa10 ), .O(\genblk1.F [6])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(293[43:109])
    defparam \genblk1.L_1799 .LUT_INIT = 16'b1100000010101010;
    SB_LUT4 \genblk1.L_1800  (.I0(FUNC7[2]), .I1(B[7]), .I2(\genblk1.sa09 ), 
            .I3(\genblk1.sa10 ), .O(\genblk1.F [7])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(294[43:109])
    defparam \genblk1.L_1800 .LUT_INIT = 16'b1100000010101010;
    SB_LUT4 \genblk1.L_1801  (.I0(FUNC7[3]), .I1(B[8]), .I2(\genblk1.sa09 ), 
            .I3(\genblk1.sa10 ), .O(\genblk1.F [8])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(295[43:109])
    defparam \genblk1.L_1801 .LUT_INIT = 16'b1100000010101010;
    SB_LUT4 \genblk1.L_1802  (.I0(FUNC7[4]), .I1(B[9]), .I2(\genblk1.sa09 ), 
            .I3(\genblk1.sa10 ), .O(\genblk1.F [9])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(296[43:109])
    defparam \genblk1.L_1802 .LUT_INIT = 16'b1100000010101010;
    SB_LUT4 \genblk1.L_1803  (.I0(FUNC7[5]), .I1(B[10]), .I2(\genblk1.sa09 ), 
            .I3(\genblk1.sa10 ), .O(\genblk1.F [10])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(297[43:109])
    defparam \genblk1.L_1803 .LUT_INIT = 16'b1100000010101010;
    SB_LUT4 \genblk1.L_1804  (.I0(\INSTR[20] ), .I1(\genblk1.sa07 ), .I2(\genblk1.sa08 ), 
            .I3(\genblk1.sa09 ), .O(\genblk1.imm11a )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(298[43:109])
    defparam \genblk1.L_1804 .LUT_INIT = 16'b1100000000001000;
    SB_LUT4 \genblk1.L_1808  (.I0(\INSTR[12] ), .I1(B[12]), .I2(\genblk1.sa31 ), 
            .I3(\genblk1.sa13b ), .O(\genblk1.F [12])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(301[43:109])
    defparam \genblk1.L_1808 .LUT_INIT = 16'b1010111111000000;
    SB_LUT4 \genblk1.L_1810  (.I0(\INSTR[13] ), .I1(B[13]), .I2(\genblk1.sa31 ), 
            .I3(\genblk1.sa13b ), .O(\genblk1.F [13])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(302[43:109])
    defparam \genblk1.L_1810 .LUT_INIT = 16'b1010111111000000;
    SB_LUT4 \genblk1.L_1811  (.I0(\INSTR[14] ), .I1(B[14]), .I2(\genblk1.sa31 ), 
            .I3(\genblk1.sa13b ), .O(\genblk1.F [14])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(303[43:109])
    defparam \genblk1.L_1811 .LUT_INIT = 16'b1010111111000000;
    SB_LUT4 \genblk1.L_1812  (.I0(\INSTR[15] ), .I1(B[15]), .I2(\genblk1.sa31 ), 
            .I3(\genblk1.sa13b ), .O(\genblk1.F [15])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(304[43:109])
    defparam \genblk1.L_1812 .LUT_INIT = 16'b1010111111000000;
    SB_LUT4 \genblk1.L_1813  (.I0(\INSTR[16] ), .I1(B[16]), .I2(\genblk1.sa31 ), 
            .I3(\genblk1.sa13b ), .O(\genblk1.F [16])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(305[43:109])
    defparam \genblk1.L_1813 .LUT_INIT = 16'b1010111111000000;
    SB_LUT4 \genblk1.L_1814  (.I0(\INSTR[17] ), .I1(B[17]), .I2(\genblk1.sa31 ), 
            .I3(\genblk1.sa13b ), .O(\genblk1.F [17])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(306[43:109])
    defparam \genblk1.L_1814 .LUT_INIT = 16'b1010111111000000;
    SB_LUT4 \genblk1.L_1815  (.I0(\INSTR[18] ), .I1(B[18]), .I2(\genblk1.sa31 ), 
            .I3(\genblk1.sa13b ), .O(\genblk1.F [18])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(307[43:109])
    defparam \genblk1.L_1815 .LUT_INIT = 16'b1010111111000000;
    SB_LUT4 \genblk1.L_1816  (.I0(\INSTR[19] ), .I1(B[19]), .I2(\genblk1.sa31 ), 
            .I3(\genblk1.sa13b ), .O(\genblk1.F [19])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(308[43:109])
    defparam \genblk1.L_1816 .LUT_INIT = 16'b1010111111000000;
    SB_LUT4 \genblk1.L_1818  (.I0(\INSTR[20] ), .I1(B[20]), .I2(\genblk1.sa10 ), 
            .I3(\genblk1.sa13 ), .O(\genblk1.F [20])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(309[43:109])
    defparam \genblk1.L_1818 .LUT_INIT = 16'b1010111111000000;
    SB_LUT4 \genblk1.L_1819  (.I0(\INSTR[21] ), .I1(B[21]), .I2(\genblk1.sa10 ), 
            .I3(\genblk1.sa13 ), .O(\genblk1.F [21])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(310[43:109])
    defparam \genblk1.L_1819 .LUT_INIT = 16'b1010111111000000;
    SB_LUT4 \genblk1.L_1820  (.I0(\INSTR[22] ), .I1(B[22]), .I2(\genblk1.sa10 ), 
            .I3(\genblk1.sa13 ), .O(\genblk1.F [22])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(311[43:109])
    defparam \genblk1.L_1820 .LUT_INIT = 16'b1010111111000000;
    SB_LUT4 \genblk1.L_1821  (.I0(\INSTR[23] ), .I1(B[23]), .I2(\genblk1.sa10 ), 
            .I3(\genblk1.sa13 ), .O(\genblk1.F [23])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(312[43:109])
    defparam \genblk1.L_1821 .LUT_INIT = 16'b1010111111000000;
    SB_LUT4 \genblk1.L_1822  (.I0(\INSTR[24] ), .I1(B[24]), .I2(\genblk1.sa10 ), 
            .I3(\genblk1.sa13 ), .O(\genblk1.F [24])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(313[43:109])
    defparam \genblk1.L_1822 .LUT_INIT = 16'b1010111111000000;
    SB_LUT4 \genblk1.L_1823  (.I0(FUNC7[0]), .I1(B[25]), .I2(\genblk1.sa10 ), 
            .I3(\genblk1.sa13 ), .O(\genblk1.F [25])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(314[43:109])
    defparam \genblk1.L_1823 .LUT_INIT = 16'b1010111111000000;
    SB_LUT4 \genblk1.L_1824  (.I0(FUNC7[1]), .I1(B[26]), .I2(\genblk1.sa10 ), 
            .I3(\genblk1.sa13 ), .O(\genblk1.F [26])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(315[43:109])
    defparam \genblk1.L_1824 .LUT_INIT = 16'b1010111111000000;
    SB_LUT4 \genblk1.L_1825  (.I0(FUNC7[2]), .I1(B[27]), .I2(\genblk1.sa10 ), 
            .I3(\genblk1.sa13 ), .O(\genblk1.F [27])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(316[43:109])
    defparam \genblk1.L_1825 .LUT_INIT = 16'b1010111111000000;
    SB_LUT4 \genblk1.L_1826  (.I0(FUNC7[3]), .I1(B[28]), .I2(\genblk1.sa10 ), 
            .I3(\genblk1.sa13 ), .O(\genblk1.F [28])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(317[43:109])
    defparam \genblk1.L_1826 .LUT_INIT = 16'b1010111111000000;
    SB_LUT4 \genblk1.L_1827  (.I0(FUNC7[4]), .I1(B[29]), .I2(\genblk1.sa10 ), 
            .I3(\genblk1.sa13 ), .O(\genblk1.F [29])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(318[43:109])
    defparam \genblk1.L_1827 .LUT_INIT = 16'b1010111111000000;
    SB_LUT4 \genblk1.L_1828  (.I0(FUNC7[5]), .I1(B[30]), .I2(\genblk1.sa10 ), 
            .I3(\genblk1.sa13 ), .O(\genblk1.F [30])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(319[43:109])
    defparam \genblk1.L_1828 .LUT_INIT = 16'b1010111111000000;
    SB_LUT4 \genblk1.L_1829  (.I0(FUNC7[6]), .I1(B[31]), .I2(\genblk1.sa10 ), 
            .I3(\genblk1.sa13 ), .O(\genblk1.F [31])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(320[43:109])
    defparam \genblk1.L_1829 .LUT_INIT = 16'b1010111111000000;
    SB_LUT4 \genblk1.cmb_zcy32  (.I0(GND_net), .I1(GND_net), .I2(GND_net), 
            .I3(\genblk1.zcy32 ), .O(\genblk1.BisnotZero )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(322[43:113])
    defparam \genblk1.cmb_zcy32 .LUT_INIT = 16'b1111111100000000;
    SB_DFFESR \genblk1.blk0_1..r  (.Q(\ADR_O[1] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [1]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_2..r  (.Q(\ADR_O[2] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [2]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_3..r  (.Q(\ADR_O[3] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [3]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_4..r  (.Q(\ADR_O[4] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [4]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_5..r  (.Q(\ADR_O[5] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [5]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_6..r  (.Q(\ADR_O[6] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [6]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_7..r  (.Q(\ADR_O[7] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [7]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_8..r  (.Q(\ADR_O[8] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [8]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_9..r  (.Q(\ADR_O[9] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [9]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_10..r  (.Q(\ADR_O[10] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [10]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_11..r  (.Q(\ADR_O[11] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [11]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_12..r  (.Q(\ADR_O[12] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [12]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_13..r  (.Q(\ADR_O[13] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [13]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_14..r  (.Q(\ADR_O[14] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [14]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_15..r  (.Q(\ADR_O[15] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [15]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_16..r  (.Q(\ADR_O[16] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [16]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_17..r  (.Q(\ADR_O[17] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [17]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_18..r  (.Q(\ADR_O[18] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [18]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_19..r  (.Q(\ADR_O[19] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [19]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_20..r  (.Q(\ADR_O[20] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [20]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_21..r  (.Q(\ADR_O[21] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [21]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_22..r  (.Q(\ADR_O[22] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [22]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_23..r  (.Q(\ADR_O[23] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [23]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_24..r  (.Q(\ADR_O[24] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [24]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_25..r  (.Q(\ADR_O[25] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [25]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_26..r  (.Q(\ADR_O[26] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [26]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_27..r  (.Q(\ADR_O[27] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [27]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_28..r  (.Q(\ADR_O[28] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [28]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_29..r  (.Q(\ADR_O[29] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [29]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_30..r  (.Q(\ADR_O[30] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [30]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.blk0_31..r  (.Q(\ADR_O[31] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [31]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    SB_DFFESR \genblk1.rNE0  (.Q(rzcy32), .C(CLK_c), .E(enaQ), .D(\genblk1.BisnotZero ), 
            .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(331[20:98])
    SB_LUT4 \genblk1.l_sa07  (.I0(GND_net), .I1(GND_net), .I2(\genblk1.sa07h ), 
            .I3(\s_cyclecnt[0] ), .O(\genblk1.sa07 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(168[42:103])
    defparam \genblk1.l_sa07 .LUT_INIT = 16'b1111000011111111;
    SB_LUT4 \genblk1.L_1598  (.I0(\INSTR[2] ), .I1(\INSTR[4] ), .I2(\INSTR[5] ), 
            .I3(\INSTR[6] ), .O(\genblk1.sa07h )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(167[42:115])
    defparam \genblk1.L_1598 .LUT_INIT = 16'b1110111001000101;
    SB_LUT4 \genblk1.L_1599  (.I0(\INSTR[2] ), .I1(\INSTR[4] ), .I2(\INSTR[6] ), 
            .I3(\s_cyclecnt[0] ), .O(\genblk1.sa08 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(169[42:110])
    defparam \genblk1.L_1599 .LUT_INIT = 16'b0001000011111111;
    SB_LUT4 \genblk1.l_sa09h  (.I0(\INSTR[2] ), .I1(\INSTR[3] ), .I2(\INSTR[4] ), 
            .I3(\INSTR[6] ), .O(\genblk1.sa09h )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(170[42:116])
    defparam \genblk1.l_sa09h .LUT_INIT = 16'b1111001001010101;
    SB_LUT4 \genblk1.l_sa09  (.I0(GND_net), .I1(GND_net), .I2(\genblk1.sa09h ), 
            .I3(\s_cyclecnt[0] ), .O(\genblk1.sa09 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(171[42:103])
    defparam \genblk1.l_sa09 .LUT_INIT = 16'b1111000011111111;
    SB_LUT4 \genblk1.L_1603  (.I0(\genblk1.sa07 ), .I1(\genblk1.sa08 ), 
            .I2(\genblk1.sa09 ), .I3(GND_net), .O(\genblk1.sa10 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(172[42:98])
    defparam \genblk1.L_1603 .LUT_INIT = 16'b1000000110000001;
    SB_LUT4 \genblk1.L_1604  (.I0(\genblk1.sa07 ), .I1(\genblk1.sa08 ), 
            .I2(\genblk1.sa09 ), .I3(GND_net), .O(\genblk1.sa31 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(173[42:98])
    defparam \genblk1.L_1604 .LUT_INIT = 16'b1000001110000011;
    SB_LUT4 \genblk1.L_1605  (.I0(FUNC7[6]), .I1(\genblk1.sa07 ), .I2(\genblk1.sa08 ), 
            .I3(\genblk1.sa09 ), .O(\genblk1.sa13 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(174[42:103])
    defparam \genblk1.L_1605 .LUT_INIT = 16'b0000101000101011;
    SB_LUT4 \genblk1.L_1606  (.I0(FUNC7[6]), .I1(\genblk1.sa07 ), .I2(\genblk1.sa08 ), 
            .I3(\genblk1.sa09 ), .O(\genblk1.sa13b )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(175[42:104])
    defparam \genblk1.L_1606 .LUT_INIT = 16'b0000101000101111;
    SB_LUT4 \genblk1.L_1788  (.I0(\INSTR[7] ), .I1(\INSTR[20] ), .I2(\genblk1.sa07 ), 
            .I3(\genblk1.sa09 ), .O(\genblk1.imm0a )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(282[43:112])
    defparam \genblk1.L_1788 .LUT_INIT = 16'b1100101000000000;
    SB_LUT4 \genblk1.L_1789  (.I0(\genblk1.imm0a ), .I1(B[0]), .I2(\genblk1.sa08 ), 
            .I3(\genblk1.sa07 ), .O(\genblk1.F [0])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(283[43:105])
    defparam \genblk1.L_1789 .LUT_INIT = 16'b1100101000001010;
    SB_CARRY \genblk1.CY_1789  (.CI(GND_net), .I0(B[0]), .I1(\genblk1.sa08 ), 
            .CO(\genblk1.zcy1 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(283[121:171])
    SB_LUT4 \genblk1.L_1791  (.I0(\INSTR[21] ), .I1(B[1]), .I2(\genblk1.sa07 ), 
            .I3(\genblk1.imm1a ), .O(\genblk1.F [1])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(285[43:109])
    defparam \genblk1.L_1791 .LUT_INIT = 16'b1100111110100000;
    SB_CARRY \genblk1.CY_1791  (.CI(\genblk1.zcy1 ), .I0(B[1]), .I1(\genblk1.sa07 ), 
            .CO(\genblk1.zcy2 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(285[121:171])
    SB_LUT4 \genblk1.L_1793  (.I0(\INSTR[22] ), .I1(B[2]), .I2(\genblk1.sa07 ), 
            .I3(\genblk1.imm2a ), .O(\genblk1.F [2])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(287[43:109])
    defparam \genblk1.L_1793 .LUT_INIT = 16'b1100111110100000;
    SB_CARRY \genblk1.CY_1793  (.CI(\genblk1.zcy2 ), .I0(B[2]), .I1(\genblk1.sa07 ), 
            .CO(\genblk1.zcy3 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(287[121:171])
    SB_LUT4 \genblk1.L_1795  (.I0(\INSTR[23] ), .I1(B[3]), .I2(\genblk1.sa07 ), 
            .I3(\genblk1.imm3a ), .O(\genblk1.F [3])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(289[43:109])
    defparam \genblk1.L_1795 .LUT_INIT = 16'b1100111110100000;
    SB_CARRY \genblk1.CY_1795  (.CI(\genblk1.zcy3 ), .I0(B[3]), .I1(\genblk1.sa07 ), 
            .CO(\genblk1.zcy4 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(289[121:171])
    SB_LUT4 \genblk1.L_1797  (.I0(\INSTR[24] ), .I1(B[4]), .I2(\genblk1.sa07 ), 
            .I3(\genblk1.imm4a ), .O(\genblk1.F [4])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(291[43:109])
    defparam \genblk1.L_1797 .LUT_INIT = 16'b1100111110100000;
    SB_CARRY \genblk1.CY_1797  (.CI(\genblk1.zcy4 ), .I0(B[4]), .I1(\genblk1.sa07 ), 
            .CO(\genblk1.zcy5 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(291[121:171])
    SB_CARRY \genblk1.CY_1798  (.CI(\genblk1.zcy5 ), .I0(B[5]), .I1(\genblk1.sa09 ), 
            .CO(\genblk1.zcy6 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(292[121:171])
    SB_CARRY \genblk1.CY_1799  (.CI(\genblk1.zcy6 ), .I0(B[6]), .I1(\genblk1.sa09 ), 
            .CO(\genblk1.zcy7 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(293[121:171])
    SB_CARRY \genblk1.CY_1800  (.CI(\genblk1.zcy7 ), .I0(B[7]), .I1(\genblk1.sa09 ), 
            .CO(\genblk1.zcy8 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(294[121:171])
    SB_CARRY \genblk1.CY_1801  (.CI(\genblk1.zcy8 ), .I0(B[8]), .I1(\genblk1.sa09 ), 
            .CO(\genblk1.zcy9 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(295[121:171])
    SB_CARRY \genblk1.CY_1802  (.CI(\genblk1.zcy9 ), .I0(B[9]), .I1(\genblk1.sa09 ), 
            .CO(\genblk1.zcy10 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(296[121:171])
    SB_CARRY \genblk1.CY_1803  (.CI(\genblk1.zcy10 ), .I0(B[10]), .I1(\genblk1.sa09 ), 
            .CO(\genblk1.zcy11 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(297[121:172])
    SB_LUT4 \genblk1.L_1805  (.I0(\INSTR[7] ), .I1(FUNC7[6]), .I2(\genblk1.sa08 ), 
            .I3(\genblk1.sa09 ), .O(\genblk1.imm11b )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(299[43:112])
    defparam \genblk1.L_1805 .LUT_INIT = 16'b1111110010100000;
    SB_LUT4 \genblk1.L_1806  (.I0(\genblk1.imm11b ), .I1(B[11]), .I2(VCC_net), 
            .I3(\genblk1.imm11a ), .O(\genblk1.F [11])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(300[43:106])
    defparam \genblk1.L_1806 .LUT_INIT = 16'b1101110110101010;
    SB_CARRY \genblk1.CY_1806  (.CI(\genblk1.zcy11 ), .I0(B[11]), .I1(VCC_net), 
            .CO(\genblk1.zcy12 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(300[121:172])
    SB_CARRY \genblk1.CY_1808  (.CI(\genblk1.zcy12 ), .I0(B[12]), .I1(\genblk1.sa31 ), 
            .CO(\genblk1.zcy13 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(301[121:172])
    SB_CARRY \genblk1.CY_1810  (.CI(\genblk1.zcy13 ), .I0(B[13]), .I1(\genblk1.sa31 ), 
            .CO(\genblk1.zcy14 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(302[121:172])
    SB_CARRY \genblk1.CY_1811  (.CI(\genblk1.zcy14 ), .I0(B[14]), .I1(\genblk1.sa31 ), 
            .CO(\genblk1.zcy15 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(303[121:172])
    SB_CARRY \genblk1.CY_1812  (.CI(\genblk1.zcy15 ), .I0(B[15]), .I1(\genblk1.sa31 ), 
            .CO(\genblk1.zcy16 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(304[121:172])
    SB_CARRY \genblk1.CY_1813  (.CI(\genblk1.zcy16 ), .I0(B[16]), .I1(\genblk1.sa31 ), 
            .CO(\genblk1.zcy17 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(305[121:172])
    SB_CARRY \genblk1.CY_1814  (.CI(\genblk1.zcy17 ), .I0(B[17]), .I1(\genblk1.sa31 ), 
            .CO(\genblk1.zcy18 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(306[121:172])
    SB_CARRY \genblk1.CY_1815  (.CI(\genblk1.zcy18 ), .I0(B[18]), .I1(\genblk1.sa31 ), 
            .CO(\genblk1.zcy19 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(307[121:172])
    SB_CARRY \genblk1.CY_1816  (.CI(\genblk1.zcy19 ), .I0(B[19]), .I1(\genblk1.sa31 ), 
            .CO(\genblk1.zcy20 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(308[121:172])
    SB_CARRY \genblk1.CY_1818  (.CI(\genblk1.zcy20 ), .I0(B[20]), .I1(\genblk1.sa10 ), 
            .CO(\genblk1.zcy21 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(309[121:172])
    SB_CARRY \genblk1.CY_1819  (.CI(\genblk1.zcy21 ), .I0(B[21]), .I1(\genblk1.sa10 ), 
            .CO(\genblk1.zcy22 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(310[121:172])
    SB_CARRY \genblk1.CY_1820  (.CI(\genblk1.zcy22 ), .I0(B[22]), .I1(\genblk1.sa10 ), 
            .CO(\genblk1.zcy23 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(311[121:172])
    SB_CARRY \genblk1.CY_1821  (.CI(\genblk1.zcy23 ), .I0(B[23]), .I1(\genblk1.sa10 ), 
            .CO(\genblk1.zcy24 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(312[121:172])
    SB_CARRY \genblk1.CY_1822  (.CI(\genblk1.zcy24 ), .I0(B[24]), .I1(\genblk1.sa10 ), 
            .CO(\genblk1.zcy25 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(313[121:172])
    SB_CARRY \genblk1.CY_1823  (.CI(\genblk1.zcy25 ), .I0(B[25]), .I1(\genblk1.sa10 ), 
            .CO(\genblk1.zcy26 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(314[121:172])
    SB_CARRY \genblk1.CY_1824  (.CI(\genblk1.zcy26 ), .I0(B[26]), .I1(\genblk1.sa10 ), 
            .CO(\genblk1.zcy27 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(315[121:172])
    SB_CARRY \genblk1.CY_1825  (.CI(\genblk1.zcy27 ), .I0(B[27]), .I1(\genblk1.sa10 ), 
            .CO(\genblk1.zcy28 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(316[121:172])
    SB_CARRY \genblk1.CY_1826  (.CI(\genblk1.zcy28 ), .I0(B[28]), .I1(\genblk1.sa10 ), 
            .CO(\genblk1.zcy29 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(317[121:172])
    SB_CARRY \genblk1.CY_1827  (.CI(\genblk1.zcy29 ), .I0(B[29]), .I1(\genblk1.sa10 ), 
            .CO(\genblk1.zcy30 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(318[121:172])
    SB_CARRY \genblk1.CY_1828  (.CI(\genblk1.zcy30 ), .I0(B[30]), .I1(\genblk1.sa10 ), 
            .CO(\genblk1.zcy31 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(319[121:172])
    SB_CARRY \genblk1.CY_1829  (.CI(\genblk1.zcy31 ), .I0(B[31]), .I1(\genblk1.sa10 ), 
            .CO(\genblk1.zcy32 )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(320[121:172])
    SB_LUT4 \genblk1.cmb_sa14_or_nCORERUNNING  (.I0(sa14), .I1(corerunning), 
            .I2(GND_net), .I3(GND_net), .O(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(326[43:146])
    defparam \genblk1.cmb_sa14_or_nCORERUNNING .LUT_INIT = 16'b0111011101110111;
    SB_DFFESR \genblk1.blk0_0..r  (.Q(\ADR_O[0] ), .C(CLK_c), .E(enaQ), 
            .D(\genblk1.F [0]), .R(\genblk1.nsa14_or_nCORERUNNING )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=6, LSE_RCOL=55, LSE_LLINE=864, LSE_RLINE=877 */ ;   // ../../../../code/m_immexp_zfind_q.v(328[23:94])
    
endmodule
//
// Verilog Description of module m_ebr_renamed_due_excessive_length_2
//

module m_ebr_renamed_due_excessive_length_2 (bmask, iwe, GND_net, VCC_net, 
            B, Rai, Wai, CLK_c, DAT_O) /* synthesis syn_module_defined=1 */ ;
    input [3:0]bmask;
    input iwe;
    input GND_net;
    input VCC_net;
    input [31:0]B;
    input [9:0]Rai;
    input [9:0]Wai;
    input CLK_c;
    output [31:0]DAT_O;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    m_ebr_w16_renamed_due_excessive_length_14 ebrh (.\bmask[3] (bmask[3]), 
            .iwe(iwe), .GND_net(GND_net), .VCC_net(VCC_net), .\B[31] (B[31]), 
            .\B[30] (B[30]), .\B[29] (B[29]), .\B[28] (B[28]), .Rai({Rai}), 
            .Wai({Wai}), .CLK_c(CLK_c), .\DAT_O[31] (DAT_O[31]), .\DAT_O[30] (DAT_O[30]), 
            .\DAT_O[29] (DAT_O[29]), .\DAT_O[28] (DAT_O[28]), .\B[27] (B[27]), 
            .\B[26] (B[26]), .\B[25] (B[25]), .\B[24] (B[24]), .\DAT_O[27] (DAT_O[27]), 
            .\DAT_O[26] (DAT_O[26]), .\DAT_O[25] (DAT_O[25]), .\DAT_O[24] (DAT_O[24]), 
            .\bmask[2] (bmask[2]), .\B[23] (B[23]), .\B[22] (B[22]), .\B[21] (B[21]), 
            .\B[20] (B[20]), .\DAT_O[23] (DAT_O[23]), .\DAT_O[22] (DAT_O[22]), 
            .\DAT_O[21] (DAT_O[21]), .\DAT_O[20] (DAT_O[20]), .\B[19] (B[19]), 
            .\B[18] (B[18]), .\B[17] (B[17]), .\B[16] (B[16]), .\DAT_O[19] (DAT_O[19]), 
            .\DAT_O[18] (DAT_O[18]), .\DAT_O[17] (DAT_O[17]), .\DAT_O[16] (DAT_O[16])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_ebr.v(615[4] 627[47])
    m_ebr_w16_renamed_due_excessive_length_3 ebrb (.\bmask[1] (bmask[1]), 
            .iwe(iwe), .GND_net(GND_net), .VCC_net(VCC_net), .\B[15] (B[15]), 
            .\B[14] (B[14]), .\B[13] (B[13]), .\B[12] (B[12]), .Rai({Rai}), 
            .Wai({Wai}), .CLK_c(CLK_c), .\DAT_O[15] (DAT_O[15]), .\DAT_O[14] (DAT_O[14]), 
            .\DAT_O[13] (DAT_O[13]), .\DAT_O[12] (DAT_O[12]), .\B[11] (B[11]), 
            .\B[10] (B[10]), .\B[9] (B[9]), .\B[8] (B[8]), .\DAT_O[11] (DAT_O[11]), 
            .\DAT_O[10] (DAT_O[10]), .\DAT_O[9] (DAT_O[9]), .\DAT_O[8] (DAT_O[8]), 
            .\bmask[0] (bmask[0]), .\B[7] (B[7]), .\B[6] (B[6]), .\B[5] (B[5]), 
            .\B[4] (B[4]), .\DAT_O[7] (DAT_O[7]), .\DAT_O[6] (DAT_O[6]), 
            .\DAT_O[5] (DAT_O[5]), .\DAT_O[4] (DAT_O[4]), .\B[3] (B[3]), 
            .\B[2] (B[2]), .\B[1] (B[1]), .\B[0] (B[0]), .\DAT_O[3] (DAT_O[3]), 
            .\DAT_O[2] (DAT_O[2]), .\DAT_O[1] (DAT_O[1]), .\DAT_O[0] (DAT_O[0])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_ebr.v(601[4] 611[47])
    
endmodule
//
// Verilog Description of module m_ebr_w16_renamed_due_excessive_length_14
//

module m_ebr_w16_renamed_due_excessive_length_14 (\bmask[3] , iwe, GND_net, 
            VCC_net, \B[31] , \B[30] , \B[29] , \B[28] , Rai, Wai, 
            CLK_c, \DAT_O[31] , \DAT_O[30] , \DAT_O[29] , \DAT_O[28] , 
            \B[27] , \B[26] , \B[25] , \B[24] , \DAT_O[27] , \DAT_O[26] , 
            \DAT_O[25] , \DAT_O[24] , \bmask[2] , \B[23] , \B[22] , 
            \B[21] , \B[20] , \DAT_O[23] , \DAT_O[22] , \DAT_O[21] , 
            \DAT_O[20] , \B[19] , \B[18] , \B[17] , \B[16] , \DAT_O[19] , 
            \DAT_O[18] , \DAT_O[17] , \DAT_O[16] ) /* synthesis syn_module_defined=1 */ ;
    input \bmask[3] ;
    input iwe;
    input GND_net;
    input VCC_net;
    input \B[31] ;
    input \B[30] ;
    input \B[29] ;
    input \B[28] ;
    input [9:0]Rai;
    input [9:0]Wai;
    input CLK_c;
    output \DAT_O[31] ;
    output \DAT_O[30] ;
    output \DAT_O[29] ;
    output \DAT_O[28] ;
    input \B[27] ;
    input \B[26] ;
    input \B[25] ;
    input \B[24] ;
    output \DAT_O[27] ;
    output \DAT_O[26] ;
    output \DAT_O[25] ;
    output \DAT_O[24] ;
    input \bmask[2] ;
    input \B[23] ;
    input \B[22] ;
    input \B[21] ;
    input \B[20] ;
    output \DAT_O[23] ;
    output \DAT_O[22] ;
    output \DAT_O[21] ;
    output \DAT_O[20] ;
    input \B[19] ;
    input \B[18] ;
    input \B[17] ;
    input \B[16] ;
    output \DAT_O[19] ;
    output \DAT_O[18] ;
    output \DAT_O[17] ;
    output \DAT_O[16] ;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    m_ebr_w8_renamed_due_excessive_length_20 \genblk1.ebrh  (.\bmask[3] (\bmask[3] ), 
            .iwe(iwe), .GND_net(GND_net), .VCC_net(VCC_net), .\B[31] (\B[31] ), 
            .\B[30] (\B[30] ), .\B[29] (\B[29] ), .\B[28] (\B[28] ), .Rai({Rai}), 
            .Wai({Wai}), .CLK_c(CLK_c), .\DAT_O[31] (\DAT_O[31] ), .\DAT_O[30] (\DAT_O[30] ), 
            .\DAT_O[29] (\DAT_O[29] ), .\DAT_O[28] (\DAT_O[28] ), .\B[27] (\B[27] ), 
            .\B[26] (\B[26] ), .\B[25] (\B[25] ), .\B[24] (\B[24] ), .\DAT_O[27] (\DAT_O[27] ), 
            .\DAT_O[26] (\DAT_O[26] ), .\DAT_O[25] (\DAT_O[25] ), .\DAT_O[24] (\DAT_O[24] )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_ebr_w16.v(609[10] 620[47])
    m_ebr_w8_renamed_due_excessive_length_15 \genblk1.ebrb  (.\bmask[2] (\bmask[2] ), 
            .iwe(iwe), .GND_net(GND_net), .VCC_net(VCC_net), .\B[23] (\B[23] ), 
            .\B[22] (\B[22] ), .\B[21] (\B[21] ), .\B[20] (\B[20] ), .Rai({Rai}), 
            .Wai({Wai}), .CLK_c(CLK_c), .\DAT_O[23] (\DAT_O[23] ), .\DAT_O[22] (\DAT_O[22] ), 
            .\DAT_O[21] (\DAT_O[21] ), .\DAT_O[20] (\DAT_O[20] ), .\B[19] (\B[19] ), 
            .\B[18] (\B[18] ), .\B[17] (\B[17] ), .\B[16] (\B[16] ), .\DAT_O[19] (\DAT_O[19] ), 
            .\DAT_O[18] (\DAT_O[18] ), .\DAT_O[17] (\DAT_O[17] ), .\DAT_O[16] (\DAT_O[16] )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_ebr_w16.v(594[10] 605[47])
    
endmodule
//
// Verilog Description of module m_ebr_w8_renamed_due_excessive_length_20
//

module m_ebr_w8_renamed_due_excessive_length_20 (\bmask[3] , iwe, GND_net, 
            VCC_net, \B[31] , \B[30] , \B[29] , \B[28] , Rai, Wai, 
            CLK_c, \DAT_O[31] , \DAT_O[30] , \DAT_O[29] , \DAT_O[28] , 
            \B[27] , \B[26] , \B[25] , \B[24] , \DAT_O[27] , \DAT_O[26] , 
            \DAT_O[25] , \DAT_O[24] ) /* synthesis syn_module_defined=1 */ ;
    input \bmask[3] ;
    input iwe;
    input GND_net;
    input VCC_net;
    input \B[31] ;
    input \B[30] ;
    input \B[29] ;
    input \B[28] ;
    input [9:0]Rai;
    input [9:0]Wai;
    input CLK_c;
    output \DAT_O[31] ;
    output \DAT_O[30] ;
    output \DAT_O[29] ;
    output \DAT_O[28] ;
    input \B[27] ;
    input \B[26] ;
    input \B[25] ;
    input \B[24] ;
    output \DAT_O[27] ;
    output \DAT_O[26] ;
    output \DAT_O[25] ;
    output \DAT_O[24] ;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    wire we;
    
    SB_LUT4 we_I_0_2_lut (.I0(\bmask[3] ), .I1(iwe), .I2(GND_net), .I3(GND_net), 
            .O(we));   // ../../../../code/m_ebr_w8.v(24[34:46])
    defparam we_I_0_2_lut.LUT_INIT = 16'h4444;
    m_ebr_w4_renamed_due_excessive_length_23 \genblk1.ebrh  (.GND_net(GND_net), 
            .VCC_net(VCC_net), .\B[31] (\B[31] ), .\B[30] (\B[30] ), .\B[29] (\B[29] ), 
            .\B[28] (\B[28] ), .Rai({Rai}), .Wai({Wai}), .CLK_c(CLK_c), 
            .we(we), .\DAT_O[31] (\DAT_O[31] ), .\DAT_O[30] (\DAT_O[30] ), 
            .\DAT_O[29] (\DAT_O[29] ), .\DAT_O[28] (\DAT_O[28] )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_ebr_w8.v(1112[10] 1122[46])
    m_ebr_w4_renamed_due_excessive_length_21 \genblk1.ebrb  (.GND_net(GND_net), 
            .VCC_net(VCC_net), .\B[27] (\B[27] ), .\B[26] (\B[26] ), .\B[25] (\B[25] ), 
            .\B[24] (\B[24] ), .Rai({Rai}), .Wai({Wai}), .CLK_c(CLK_c), 
            .we(we), .\DAT_O[27] (\DAT_O[27] ), .\DAT_O[26] (\DAT_O[26] ), 
            .\DAT_O[25] (\DAT_O[25] ), .\DAT_O[24] (\DAT_O[24] )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_ebr_w8.v(1099[10] 1108[46])
    
endmodule
//
// Verilog Description of module m_ebr_w4_renamed_due_excessive_length_23
//

module m_ebr_w4_renamed_due_excessive_length_23 (GND_net, VCC_net, \B[31] , 
            \B[30] , \B[29] , \B[28] , Rai, Wai, CLK_c, we, \DAT_O[31] , 
            \DAT_O[30] , \DAT_O[29] , \DAT_O[28] ) /* synthesis syn_module_defined=1 */ ;
    input GND_net;
    input VCC_net;
    input \B[31] ;
    input \B[30] ;
    input \B[29] ;
    input \B[28] ;
    input [9:0]Rai;
    input [9:0]Wai;
    input CLK_c;
    input we;
    output \DAT_O[31] ;
    output \DAT_O[30] ;
    output \DAT_O[29] ;
    output \DAT_O[28] ;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    SB_RAM40_4K \genblk1.mem  (.RDATA({Open_33, Open_34, \DAT_O[31] , 
            Open_35, Open_36, Open_37, \DAT_O[30] , Open_38, Open_39, 
            Open_40, \DAT_O[29] , Open_41, Open_42, Open_43, \DAT_O[28] , 
            Open_44}), .RCLK(CLK_c), .RCLKE(VCC_net), .RE(VCC_net), 
            .RADDR({GND_net, Rai[1:0], Rai[9:2]}), .WCLK(CLK_c), .WCLKE(we), 
            .WE(VCC_net), .WADDR({GND_net, Wai[1:0], Wai[9:2]}), .MASK({GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net}), .WDATA({GND_net, GND_net, 
            \B[31] , GND_net, GND_net, GND_net, \B[30] , GND_net, 
            GND_net, GND_net, \B[29] , GND_net, GND_net, GND_net, 
            \B[28] , GND_net})) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=54, LSE_LCOL=10, LSE_RCOL=46, LSE_LLINE=1112, LSE_RLINE=1122 */ ;   // ../../../../code/m_ebr_w8.v(1112[10] 1122[46])
    defparam \genblk1.mem .WRITE_MODE = 2;
    defparam \genblk1.mem .READ_MODE = 2;
    defparam \genblk1.mem .INIT_0 = 256'b1100110011001100000000000000000011001110111011100000101010000000000000000000000010011001100110010010001000100010000000000000000001000100010001001111111111111111010001000100010000000000000000000100010001000100000000100010000010000000000000000100010000000100;
    defparam \genblk1.mem .INIT_1 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000100010000000100010001000100001000100010001010011001100110010011001100110011000101010001000101000100010001000100010001000100;
    defparam \genblk1.mem .INIT_2 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_3 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_4 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_5 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_6 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_7 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_8 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_9 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_A = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_B = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_C = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_D = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_E = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_F = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    
endmodule
//
// Verilog Description of module m_ebr_w4_renamed_due_excessive_length_21
//

module m_ebr_w4_renamed_due_excessive_length_21 (GND_net, VCC_net, \B[27] , 
            \B[26] , \B[25] , \B[24] , Rai, Wai, CLK_c, we, \DAT_O[27] , 
            \DAT_O[26] , \DAT_O[25] , \DAT_O[24] ) /* synthesis syn_module_defined=1 */ ;
    input GND_net;
    input VCC_net;
    input \B[27] ;
    input \B[26] ;
    input \B[25] ;
    input \B[24] ;
    input [9:0]Rai;
    input [9:0]Wai;
    input CLK_c;
    input we;
    output \DAT_O[27] ;
    output \DAT_O[26] ;
    output \DAT_O[25] ;
    output \DAT_O[24] ;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    SB_RAM40_4K \genblk1.mem  (.RDATA({Open_45, Open_46, \DAT_O[27] , 
            Open_47, Open_48, Open_49, \DAT_O[26] , Open_50, Open_51, 
            Open_52, \DAT_O[25] , Open_53, Open_54, Open_55, \DAT_O[24] , 
            Open_56}), .RCLK(CLK_c), .RCLKE(VCC_net), .RE(VCC_net), 
            .RADDR({GND_net, Rai[1:0], Rai[9:2]}), .WCLK(CLK_c), .WCLKE(we), 
            .WE(VCC_net), .WADDR({GND_net, Wai[1:0], Wai[9:2]}), .MASK({GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net}), .WDATA({GND_net, GND_net, 
            \B[27] , GND_net, GND_net, GND_net, \B[26] , GND_net, 
            GND_net, GND_net, \B[25] , GND_net, GND_net, GND_net, 
            \B[24] , GND_net})) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=54, LSE_LCOL=10, LSE_RCOL=46, LSE_LLINE=1099, LSE_RLINE=1108 */ ;   // ../../../../code/m_ebr_w8.v(1099[10] 1108[46])
    defparam \genblk1.mem .WRITE_MODE = 2;
    defparam \genblk1.mem .READ_MODE = 2;
    defparam \genblk1.mem .INIT_0 = 256'b1100110011001100000000000000000011101110111000100000000000000000000000000000000010011001100110010010001000100010000000000000000001000000010000001111111100110000011001000100000000000000000000001100010001000001000000000000000000000000000000000100010001000000;
    defparam \genblk1.mem .INIT_1 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001100010011001000100010001000100011000100010000010111001000100000011001100110010001100010001000001000100010000000110010000100010;
    defparam \genblk1.mem .INIT_2 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_3 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_4 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_5 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_6 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_7 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_8 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_9 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_A = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_B = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_C = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_D = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_E = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_F = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    
endmodule
//
// Verilog Description of module m_ebr_w8_renamed_due_excessive_length_15
//

module m_ebr_w8_renamed_due_excessive_length_15 (\bmask[2] , iwe, GND_net, 
            VCC_net, \B[23] , \B[22] , \B[21] , \B[20] , Rai, Wai, 
            CLK_c, \DAT_O[23] , \DAT_O[22] , \DAT_O[21] , \DAT_O[20] , 
            \B[19] , \B[18] , \B[17] , \B[16] , \DAT_O[19] , \DAT_O[18] , 
            \DAT_O[17] , \DAT_O[16] ) /* synthesis syn_module_defined=1 */ ;
    input \bmask[2] ;
    input iwe;
    input GND_net;
    input VCC_net;
    input \B[23] ;
    input \B[22] ;
    input \B[21] ;
    input \B[20] ;
    input [9:0]Rai;
    input [9:0]Wai;
    input CLK_c;
    output \DAT_O[23] ;
    output \DAT_O[22] ;
    output \DAT_O[21] ;
    output \DAT_O[20] ;
    input \B[19] ;
    input \B[18] ;
    input \B[17] ;
    input \B[16] ;
    output \DAT_O[19] ;
    output \DAT_O[18] ;
    output \DAT_O[17] ;
    output \DAT_O[16] ;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    wire we;
    
    SB_LUT4 we_I_0_2_lut (.I0(\bmask[2] ), .I1(iwe), .I2(GND_net), .I3(GND_net), 
            .O(we));   // ../../../../code/m_ebr_w8.v(24[34:46])
    defparam we_I_0_2_lut.LUT_INIT = 16'h4444;
    m_ebr_w4_renamed_due_excessive_length_18 \genblk1.ebrh  (.GND_net(GND_net), 
            .VCC_net(VCC_net), .\B[23] (\B[23] ), .\B[22] (\B[22] ), .\B[21] (\B[21] ), 
            .\B[20] (\B[20] ), .Rai({Rai}), .Wai({Wai}), .CLK_c(CLK_c), 
            .we(we), .\DAT_O[23] (\DAT_O[23] ), .\DAT_O[22] (\DAT_O[22] ), 
            .\DAT_O[21] (\DAT_O[21] ), .\DAT_O[20] (\DAT_O[20] )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_ebr_w8.v(1112[10] 1122[46])
    m_ebr_w4_renamed_due_excessive_length_16 \genblk1.ebrb  (.GND_net(GND_net), 
            .VCC_net(VCC_net), .\B[19] (\B[19] ), .\B[18] (\B[18] ), .\B[17] (\B[17] ), 
            .\B[16] (\B[16] ), .Rai({Rai}), .Wai({Wai}), .CLK_c(CLK_c), 
            .we(we), .\DAT_O[19] (\DAT_O[19] ), .\DAT_O[18] (\DAT_O[18] ), 
            .\DAT_O[17] (\DAT_O[17] ), .\DAT_O[16] (\DAT_O[16] )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_ebr_w8.v(1099[10] 1108[46])
    
endmodule
//
// Verilog Description of module m_ebr_w4_renamed_due_excessive_length_18
//

module m_ebr_w4_renamed_due_excessive_length_18 (GND_net, VCC_net, \B[23] , 
            \B[22] , \B[21] , \B[20] , Rai, Wai, CLK_c, we, \DAT_O[23] , 
            \DAT_O[22] , \DAT_O[21] , \DAT_O[20] ) /* synthesis syn_module_defined=1 */ ;
    input GND_net;
    input VCC_net;
    input \B[23] ;
    input \B[22] ;
    input \B[21] ;
    input \B[20] ;
    input [9:0]Rai;
    input [9:0]Wai;
    input CLK_c;
    input we;
    output \DAT_O[23] ;
    output \DAT_O[22] ;
    output \DAT_O[21] ;
    output \DAT_O[20] ;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    SB_RAM40_4K \genblk1.mem  (.RDATA({Open_57, Open_58, \DAT_O[23] , 
            Open_59, Open_60, Open_61, \DAT_O[22] , Open_62, Open_63, 
            Open_64, \DAT_O[21] , Open_65, Open_66, Open_67, \DAT_O[20] , 
            Open_68}), .RCLK(CLK_c), .RCLKE(VCC_net), .RE(VCC_net), 
            .RADDR({GND_net, Rai[1:0], Rai[9:2]}), .WCLK(CLK_c), .WCLKE(we), 
            .WE(VCC_net), .WADDR({GND_net, Wai[1:0], Wai[9:2]}), .MASK({GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net}), .WDATA({GND_net, GND_net, 
            \B[23] , GND_net, GND_net, GND_net, \B[22] , GND_net, 
            GND_net, GND_net, \B[21] , GND_net, GND_net, GND_net, 
            \B[20] , GND_net})) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=54, LSE_LCOL=10, LSE_RCOL=46, LSE_LLINE=1112, LSE_RLINE=1122 */ ;   // ../../../../code/m_ebr_w8.v(1112[10] 1122[46])
    defparam \genblk1.mem .WRITE_MODE = 2;
    defparam \genblk1.mem .READ_MODE = 2;
    defparam \genblk1.mem .INIT_0 = 256'b1100110011001100000000000000000010101010001111110010000000000100000000000000000010011001100110010010001000100010000000000000000000000000000000000000011110101001101001100100010111000000010000110010000000000000100000000000000000000000000000000100000001000000;
    defparam \genblk1.mem .INIT_1 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001110100001101000100001111001011010101000000000010100110000011001010001000100010101001100000010010100001000100010000101010101100;
    defparam \genblk1.mem .INIT_2 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_3 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_4 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_5 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_6 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_7 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_8 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_9 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_A = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_B = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_C = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_D = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_E = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_F = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    
endmodule
//
// Verilog Description of module m_ebr_w4_renamed_due_excessive_length_16
//

module m_ebr_w4_renamed_due_excessive_length_16 (GND_net, VCC_net, \B[19] , 
            \B[18] , \B[17] , \B[16] , Rai, Wai, CLK_c, we, \DAT_O[19] , 
            \DAT_O[18] , \DAT_O[17] , \DAT_O[16] ) /* synthesis syn_module_defined=1 */ ;
    input GND_net;
    input VCC_net;
    input \B[19] ;
    input \B[18] ;
    input \B[17] ;
    input \B[16] ;
    input [9:0]Rai;
    input [9:0]Wai;
    input CLK_c;
    input we;
    output \DAT_O[19] ;
    output \DAT_O[18] ;
    output \DAT_O[17] ;
    output \DAT_O[16] ;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    SB_RAM40_4K \genblk1.mem  (.RDATA({Open_69, Open_70, \DAT_O[19] , 
            Open_71, Open_72, Open_73, \DAT_O[18] , Open_74, Open_75, 
            Open_76, \DAT_O[17] , Open_77, Open_78, Open_79, \DAT_O[16] , 
            Open_80}), .RCLK(CLK_c), .RCLKE(VCC_net), .RE(VCC_net), 
            .RADDR({GND_net, Rai[1:0], Rai[9:2]}), .WCLK(CLK_c), .WCLKE(we), 
            .WE(VCC_net), .WADDR({GND_net, Wai[1:0], Wai[9:2]}), .MASK({GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net}), .WDATA({GND_net, GND_net, 
            \B[19] , GND_net, GND_net, GND_net, \B[18] , GND_net, 
            GND_net, GND_net, \B[17] , GND_net, GND_net, GND_net, 
            \B[16] , GND_net})) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=54, LSE_LCOL=10, LSE_RCOL=46, LSE_LLINE=1099, LSE_RLINE=1108 */ ;   // ../../../../code/m_ebr_w8.v(1099[10] 1108[46])
    defparam \genblk1.mem .WRITE_MODE = 2;
    defparam \genblk1.mem .READ_MODE = 2;
    defparam \genblk1.mem .INIT_0 = 256'b1100110011001100000000000000000010001000100010000000000000000100000000000000000010011001100110010010001000100010000000000000000000000000000011110000000010010001000011000001000100000010110011100000011000000000000000000000000000000000000000000100010000000100;
    defparam \genblk1.mem .INIT_1 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000100010101000000111100001111000010010010001010001100100111010000111000010001000011000001010100001011010001000100110001000100;
    defparam \genblk1.mem .INIT_2 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_3 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_4 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_5 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_6 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_7 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_8 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_9 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_A = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_B = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_C = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_D = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_E = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_F = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    
endmodule
//
// Verilog Description of module m_ebr_w16_renamed_due_excessive_length_3
//

module m_ebr_w16_renamed_due_excessive_length_3 (\bmask[1] , iwe, GND_net, 
            VCC_net, \B[15] , \B[14] , \B[13] , \B[12] , Rai, Wai, 
            CLK_c, \DAT_O[15] , \DAT_O[14] , \DAT_O[13] , \DAT_O[12] , 
            \B[11] , \B[10] , \B[9] , \B[8] , \DAT_O[11] , \DAT_O[10] , 
            \DAT_O[9] , \DAT_O[8] , \bmask[0] , \B[7] , \B[6] , \B[5] , 
            \B[4] , \DAT_O[7] , \DAT_O[6] , \DAT_O[5] , \DAT_O[4] , 
            \B[3] , \B[2] , \B[1] , \B[0] , \DAT_O[3] , \DAT_O[2] , 
            \DAT_O[1] , \DAT_O[0] ) /* synthesis syn_module_defined=1 */ ;
    input \bmask[1] ;
    input iwe;
    input GND_net;
    input VCC_net;
    input \B[15] ;
    input \B[14] ;
    input \B[13] ;
    input \B[12] ;
    input [9:0]Rai;
    input [9:0]Wai;
    input CLK_c;
    output \DAT_O[15] ;
    output \DAT_O[14] ;
    output \DAT_O[13] ;
    output \DAT_O[12] ;
    input \B[11] ;
    input \B[10] ;
    input \B[9] ;
    input \B[8] ;
    output \DAT_O[11] ;
    output \DAT_O[10] ;
    output \DAT_O[9] ;
    output \DAT_O[8] ;
    input \bmask[0] ;
    input \B[7] ;
    input \B[6] ;
    input \B[5] ;
    input \B[4] ;
    output \DAT_O[7] ;
    output \DAT_O[6] ;
    output \DAT_O[5] ;
    output \DAT_O[4] ;
    input \B[3] ;
    input \B[2] ;
    input \B[1] ;
    input \B[0] ;
    output \DAT_O[3] ;
    output \DAT_O[2] ;
    output \DAT_O[1] ;
    output \DAT_O[0] ;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    m_ebr_w8_renamed_due_excessive_length_9 \genblk1.ebrh  (.\bmask[1] (\bmask[1] ), 
            .iwe(iwe), .GND_net(GND_net), .VCC_net(VCC_net), .\B[15] (\B[15] ), 
            .\B[14] (\B[14] ), .\B[13] (\B[13] ), .\B[12] (\B[12] ), .Rai({Rai}), 
            .Wai({Wai}), .CLK_c(CLK_c), .\DAT_O[15] (\DAT_O[15] ), .\DAT_O[14] (\DAT_O[14] ), 
            .\DAT_O[13] (\DAT_O[13] ), .\DAT_O[12] (\DAT_O[12] ), .\B[11] (\B[11] ), 
            .\B[10] (\B[10] ), .\B[9] (\B[9] ), .\B[8] (\B[8] ), .\DAT_O[11] (\DAT_O[11] ), 
            .\DAT_O[10] (\DAT_O[10] ), .\DAT_O[9] (\DAT_O[9] ), .\DAT_O[8] (\DAT_O[8] )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_ebr_w16.v(609[10] 620[47])
    m_ebr_w8_renamed_due_excessive_length_4 \genblk1.ebrb  (.\bmask[0] (\bmask[0] ), 
            .iwe(iwe), .GND_net(GND_net), .VCC_net(VCC_net), .\B[7] (\B[7] ), 
            .\B[6] (\B[6] ), .\B[5] (\B[5] ), .\B[4] (\B[4] ), .Rai({Rai}), 
            .Wai({Wai}), .CLK_c(CLK_c), .\DAT_O[7] (\DAT_O[7] ), .\DAT_O[6] (\DAT_O[6] ), 
            .\DAT_O[5] (\DAT_O[5] ), .\DAT_O[4] (\DAT_O[4] ), .\B[3] (\B[3] ), 
            .\B[2] (\B[2] ), .\B[1] (\B[1] ), .\B[0] (\B[0] ), .\DAT_O[3] (\DAT_O[3] ), 
            .\DAT_O[2] (\DAT_O[2] ), .\DAT_O[1] (\DAT_O[1] ), .\DAT_O[0] (\DAT_O[0] )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_ebr_w16.v(594[10] 605[47])
    
endmodule
//
// Verilog Description of module m_ebr_w8_renamed_due_excessive_length_9
//

module m_ebr_w8_renamed_due_excessive_length_9 (\bmask[1] , iwe, GND_net, 
            VCC_net, \B[15] , \B[14] , \B[13] , \B[12] , Rai, Wai, 
            CLK_c, \DAT_O[15] , \DAT_O[14] , \DAT_O[13] , \DAT_O[12] , 
            \B[11] , \B[10] , \B[9] , \B[8] , \DAT_O[11] , \DAT_O[10] , 
            \DAT_O[9] , \DAT_O[8] ) /* synthesis syn_module_defined=1 */ ;
    input \bmask[1] ;
    input iwe;
    input GND_net;
    input VCC_net;
    input \B[15] ;
    input \B[14] ;
    input \B[13] ;
    input \B[12] ;
    input [9:0]Rai;
    input [9:0]Wai;
    input CLK_c;
    output \DAT_O[15] ;
    output \DAT_O[14] ;
    output \DAT_O[13] ;
    output \DAT_O[12] ;
    input \B[11] ;
    input \B[10] ;
    input \B[9] ;
    input \B[8] ;
    output \DAT_O[11] ;
    output \DAT_O[10] ;
    output \DAT_O[9] ;
    output \DAT_O[8] ;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    wire we;
    
    SB_LUT4 we_I_0_2_lut (.I0(\bmask[1] ), .I1(iwe), .I2(GND_net), .I3(GND_net), 
            .O(we));   // ../../../../code/m_ebr_w8.v(24[34:46])
    defparam we_I_0_2_lut.LUT_INIT = 16'h4444;
    m_ebr_w4_renamed_due_excessive_length_12 \genblk1.ebrh  (.GND_net(GND_net), 
            .VCC_net(VCC_net), .\B[15] (\B[15] ), .\B[14] (\B[14] ), .\B[13] (\B[13] ), 
            .\B[12] (\B[12] ), .Rai({Rai}), .Wai({Wai}), .CLK_c(CLK_c), 
            .we(we), .\DAT_O[15] (\DAT_O[15] ), .\DAT_O[14] (\DAT_O[14] ), 
            .\DAT_O[13] (\DAT_O[13] ), .\DAT_O[12] (\DAT_O[12] )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_ebr_w8.v(1112[10] 1122[46])
    m_ebr_w4_renamed_due_excessive_length_10 \genblk1.ebrb  (.GND_net(GND_net), 
            .VCC_net(VCC_net), .\B[11] (\B[11] ), .\B[10] (\B[10] ), .\B[9] (\B[9] ), 
            .\B[8] (\B[8] ), .Rai({Rai}), .Wai({Wai}), .CLK_c(CLK_c), 
            .we(we), .\DAT_O[11] (\DAT_O[11] ), .\DAT_O[10] (\DAT_O[10] ), 
            .\DAT_O[9] (\DAT_O[9] ), .\DAT_O[8] (\DAT_O[8] )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_ebr_w8.v(1099[10] 1108[46])
    
endmodule
//
// Verilog Description of module m_ebr_w4_renamed_due_excessive_length_12
//

module m_ebr_w4_renamed_due_excessive_length_12 (GND_net, VCC_net, \B[15] , 
            \B[14] , \B[13] , \B[12] , Rai, Wai, CLK_c, we, \DAT_O[15] , 
            \DAT_O[14] , \DAT_O[13] , \DAT_O[12] ) /* synthesis syn_module_defined=1 */ ;
    input GND_net;
    input VCC_net;
    input \B[15] ;
    input \B[14] ;
    input \B[13] ;
    input \B[12] ;
    input [9:0]Rai;
    input [9:0]Wai;
    input CLK_c;
    input we;
    output \DAT_O[15] ;
    output \DAT_O[14] ;
    output \DAT_O[13] ;
    output \DAT_O[12] ;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    SB_RAM40_4K \genblk1.mem  (.RDATA({Open_81, Open_82, \DAT_O[15] , 
            Open_83, Open_84, Open_85, \DAT_O[14] , Open_86, Open_87, 
            Open_88, \DAT_O[13] , Open_89, Open_90, Open_91, \DAT_O[12] , 
            Open_92}), .RCLK(CLK_c), .RCLKE(VCC_net), .RE(VCC_net), 
            .RADDR({GND_net, Rai[1:0], Rai[9:2]}), .WCLK(CLK_c), .WCLKE(we), 
            .WE(VCC_net), .WADDR({GND_net, Wai[1:0], Wai[9:2]}), .MASK({GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net}), .WDATA({GND_net, GND_net, 
            \B[15] , GND_net, GND_net, GND_net, \B[14] , GND_net, 
            GND_net, GND_net, \B[13] , GND_net, GND_net, GND_net, 
            \B[12] , GND_net})) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=54, LSE_LCOL=10, LSE_RCOL=46, LSE_LLINE=1112, LSE_RLINE=1122 */ ;   // ../../../../code/m_ebr_w8.v(1112[10] 1122[46])
    defparam \genblk1.mem .WRITE_MODE = 2;
    defparam \genblk1.mem .READ_MODE = 2;
    defparam \genblk1.mem .INIT_0 = 256'b1100110011001100000000000000000010111100100110000100000000000000000000000000000010001001100110011010101010101010000000000000000010100000000001000111000100010100100001011110000101011010100000100010000010100100000000000000000000000000000000000100000001000100;
    defparam \genblk1.mem .INIT_1 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001010100011001000000001000001010100100000101000010001000101010001000000010000001100000001010000010110000101101001100010011000100;
    defparam \genblk1.mem .INIT_2 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_3 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_4 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_5 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_6 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_7 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_8 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_9 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_A = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_B = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_C = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_D = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_E = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_F = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    
endmodule
//
// Verilog Description of module m_ebr_w4_renamed_due_excessive_length_10
//

module m_ebr_w4_renamed_due_excessive_length_10 (GND_net, VCC_net, \B[11] , 
            \B[10] , \B[9] , \B[8] , Rai, Wai, CLK_c, we, \DAT_O[11] , 
            \DAT_O[10] , \DAT_O[9] , \DAT_O[8] ) /* synthesis syn_module_defined=1 */ ;
    input GND_net;
    input VCC_net;
    input \B[11] ;
    input \B[10] ;
    input \B[9] ;
    input \B[8] ;
    input [9:0]Rai;
    input [9:0]Wai;
    input CLK_c;
    input we;
    output \DAT_O[11] ;
    output \DAT_O[10] ;
    output \DAT_O[9] ;
    output \DAT_O[8] ;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    SB_RAM40_4K \genblk1.mem  (.RDATA({Open_93, Open_94, \DAT_O[11] , 
            Open_95, Open_96, Open_97, \DAT_O[10] , Open_98, Open_99, 
            Open_100, \DAT_O[9] , Open_101, Open_102, Open_103, \DAT_O[8] , 
            Open_104}), .RCLK(CLK_c), .RCLKE(VCC_net), .RE(VCC_net), 
            .RADDR({GND_net, Rai[1:0], Rai[9:2]}), .WCLK(CLK_c), .WCLKE(we), 
            .WE(VCC_net), .WADDR({GND_net, Wai[1:0], Wai[9:2]}), .MASK({GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net}), .WDATA({GND_net, GND_net, 
            \B[11] , GND_net, GND_net, GND_net, \B[10] , GND_net, 
            GND_net, GND_net, \B[9] , GND_net, GND_net, GND_net, 
            \B[8] , GND_net})) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=54, LSE_LCOL=10, LSE_RCOL=46, LSE_LLINE=1099, LSE_RLINE=1108 */ ;   // ../../../../code/m_ebr_w8.v(1099[10] 1108[46])
    defparam \genblk1.mem .WRITE_MODE = 2;
    defparam \genblk1.mem .READ_MODE = 2;
    defparam \genblk1.mem .INIT_0 = 256'b1100110011001100000000000000000001000100010100000000000000000110000000000000000010011001100110011010101010101010000000000000010001000100011000000010011101100010010011100101000100000000111011100100111011010000000000000000000000000000000000000100000001000000;
    defparam \genblk1.mem .INIT_1 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010000100000000011110000111001000101111000100010101001101000101011110011000000101011011110001000100111110100000100000000000;
    defparam \genblk1.mem .INIT_2 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_3 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_4 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_5 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_6 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_7 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_8 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_9 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_A = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_B = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_C = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_D = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_E = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_F = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    
endmodule
//
// Verilog Description of module m_ebr_w8_renamed_due_excessive_length_4
//

module m_ebr_w8_renamed_due_excessive_length_4 (\bmask[0] , iwe, GND_net, 
            VCC_net, \B[7] , \B[6] , \B[5] , \B[4] , Rai, Wai, 
            CLK_c, \DAT_O[7] , \DAT_O[6] , \DAT_O[5] , \DAT_O[4] , 
            \B[3] , \B[2] , \B[1] , \B[0] , \DAT_O[3] , \DAT_O[2] , 
            \DAT_O[1] , \DAT_O[0] ) /* synthesis syn_module_defined=1 */ ;
    input \bmask[0] ;
    input iwe;
    input GND_net;
    input VCC_net;
    input \B[7] ;
    input \B[6] ;
    input \B[5] ;
    input \B[4] ;
    input [9:0]Rai;
    input [9:0]Wai;
    input CLK_c;
    output \DAT_O[7] ;
    output \DAT_O[6] ;
    output \DAT_O[5] ;
    output \DAT_O[4] ;
    input \B[3] ;
    input \B[2] ;
    input \B[1] ;
    input \B[0] ;
    output \DAT_O[3] ;
    output \DAT_O[2] ;
    output \DAT_O[1] ;
    output \DAT_O[0] ;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    wire we;
    
    SB_LUT4 we_I_0_2_lut (.I0(\bmask[0] ), .I1(iwe), .I2(GND_net), .I3(GND_net), 
            .O(we));   // ../../../../code/m_ebr_w8.v(24[34:46])
    defparam we_I_0_2_lut.LUT_INIT = 16'h4444;
    m_ebr_w4_renamed_due_excessive_length_7 \genblk1.ebrh  (.GND_net(GND_net), 
            .VCC_net(VCC_net), .\B[7] (\B[7] ), .\B[6] (\B[6] ), .\B[5] (\B[5] ), 
            .\B[4] (\B[4] ), .Rai({Rai}), .Wai({Wai}), .CLK_c(CLK_c), 
            .we(we), .\DAT_O[7] (\DAT_O[7] ), .\DAT_O[6] (\DAT_O[6] ), 
            .\DAT_O[5] (\DAT_O[5] ), .\DAT_O[4] (\DAT_O[4] )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_ebr_w8.v(1112[10] 1122[46])
    m_ebr_w4_renamed_due_excessive_length_5 \genblk1.ebrb  (.GND_net(GND_net), 
            .VCC_net(VCC_net), .\B[3] (\B[3] ), .\B[2] (\B[2] ), .\B[1] (\B[1] ), 
            .\B[0] (\B[0] ), .Rai({Rai}), .Wai({Wai}), .CLK_c(CLK_c), 
            .we(we), .\DAT_O[3] (\DAT_O[3] ), .\DAT_O[2] (\DAT_O[2] ), 
            .\DAT_O[1] (\DAT_O[1] ), .\DAT_O[0] (\DAT_O[0] )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_ebr_w8.v(1099[10] 1108[46])
    
endmodule
//
// Verilog Description of module m_ebr_w4_renamed_due_excessive_length_7
//

module m_ebr_w4_renamed_due_excessive_length_7 (GND_net, VCC_net, \B[7] , 
            \B[6] , \B[5] , \B[4] , Rai, Wai, CLK_c, we, \DAT_O[7] , 
            \DAT_O[6] , \DAT_O[5] , \DAT_O[4] ) /* synthesis syn_module_defined=1 */ ;
    input GND_net;
    input VCC_net;
    input \B[7] ;
    input \B[6] ;
    input \B[5] ;
    input \B[4] ;
    input [9:0]Rai;
    input [9:0]Wai;
    input CLK_c;
    input we;
    output \DAT_O[7] ;
    output \DAT_O[6] ;
    output \DAT_O[5] ;
    output \DAT_O[4] ;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    SB_RAM40_4K \genblk1.mem  (.RDATA({Open_105, Open_106, \DAT_O[7] , 
            Open_107, Open_108, Open_109, \DAT_O[6] , Open_110, Open_111, 
            Open_112, \DAT_O[5] , Open_113, Open_114, Open_115, \DAT_O[4] , 
            Open_116}), .RCLK(CLK_c), .RCLKE(VCC_net), .RE(VCC_net), 
            .RADDR({GND_net, Rai[1:0], Rai[9:2]}), .WCLK(CLK_c), .WCLKE(we), 
            .WE(VCC_net), .WADDR({GND_net, Wai[1:0], Wai[9:2]}), .MASK({GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net}), .WDATA({GND_net, GND_net, 
            \B[7] , GND_net, GND_net, GND_net, \B[6] , GND_net, 
            GND_net, GND_net, \B[5] , GND_net, GND_net, GND_net, 
            \B[4] , GND_net})) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=54, LSE_LCOL=10, LSE_RCOL=46, LSE_LLINE=1112, LSE_RLINE=1122 */ ;   // ../../../../code/m_ebr_w8.v(1112[10] 1122[46])
    defparam \genblk1.mem .WRITE_MODE = 2;
    defparam \genblk1.mem .READ_MODE = 2;
    defparam \genblk1.mem .INIT_0 = 256'b1100110011001100000000000000000001101100110100101100000010001100000000000000000010111011100110011101111111101110000000000000000001011100110000111111110111110000010001000100000101110000110011110100010011000001100000000000110000000000000000010100000001000100;
    defparam \genblk1.mem .INIT_1 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000010100011100011000000000011111011000101010000000111001110101000001010101010010001100010101010001000100010100000000010011000000;
    defparam \genblk1.mem .INIT_2 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_3 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_4 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_5 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_6 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_7 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_8 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_9 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_A = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_B = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_C = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_D = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_E = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_F = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    
endmodule
//
// Verilog Description of module m_ebr_w4_renamed_due_excessive_length_5
//

module m_ebr_w4_renamed_due_excessive_length_5 (GND_net, VCC_net, \B[3] , 
            \B[2] , \B[1] , \B[0] , Rai, Wai, CLK_c, we, \DAT_O[3] , 
            \DAT_O[2] , \DAT_O[1] , \DAT_O[0] ) /* synthesis syn_module_defined=1 */ ;
    input GND_net;
    input VCC_net;
    input \B[3] ;
    input \B[2] ;
    input \B[1] ;
    input \B[0] ;
    input [9:0]Rai;
    input [9:0]Wai;
    input CLK_c;
    input we;
    output \DAT_O[3] ;
    output \DAT_O[2] ;
    output \DAT_O[1] ;
    output \DAT_O[0] ;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    SB_RAM40_4K \genblk1.mem  (.RDATA({Open_117, Open_118, \DAT_O[3] , 
            Open_119, Open_120, Open_121, \DAT_O[2] , Open_122, Open_123, 
            Open_124, \DAT_O[1] , Open_125, Open_126, Open_127, \DAT_O[0] , 
            Open_128}), .RCLK(CLK_c), .RCLKE(VCC_net), .RE(VCC_net), 
            .RADDR({GND_net, Rai[1:0], Rai[9:2]}), .WCLK(CLK_c), .WCLKE(we), 
            .WE(VCC_net), .WADDR({GND_net, Wai[1:0], Wai[9:2]}), .MASK({GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net, GND_net, GND_net, GND_net, 
            GND_net, GND_net, GND_net}), .WDATA({GND_net, GND_net, 
            \B[3] , GND_net, GND_net, GND_net, \B[2] , GND_net, 
            GND_net, GND_net, \B[1] , GND_net, GND_net, GND_net, 
            \B[0] , GND_net})) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=54, LSE_LCOL=10, LSE_RCOL=46, LSE_LLINE=1099, LSE_RLINE=1108 */ ;   // ../../../../code/m_ebr_w8.v(1099[10] 1108[46])
    defparam \genblk1.mem .WRITE_MODE = 2;
    defparam \genblk1.mem .READ_MODE = 2;
    defparam \genblk1.mem .INIT_0 = 256'b1100110011001100000000000000000010001000111111110000100011001100000000000000000010111001100110011111111011101110010000000000000000001000111111110000000011111111000000001111111100000000111111110000000011111111000000011000100000000000100010000110010001000000;
    defparam \genblk1.mem .INIT_1 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000001000100011101110000000011111111000000001111111110001000111111110000000011111111000000001111111100000000111111110110010011101110;
    defparam \genblk1.mem .INIT_2 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_3 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_4 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_5 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_6 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_7 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_8 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_9 = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_A = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_B = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_C = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_D = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_E = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    defparam \genblk1.mem .INIT_F = 256'b0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000;
    
endmodule
//
// Verilog Description of module m_cyclecnt
//

module m_cyclecnt (CLK_c, buserror, corerunning, GND_net, VCC_net, 
            s_cyclecnt, STB_O, \ADR_O[1] , \QQ[1] , \ADR_O[0] , \QQ[0] , 
            \ADR_O[6] , \QQ[6] , \ADR_O[5] , \QQ[5] , \ADR_O[4] , 
            \QQ[4] , \ADR_O[3] , \QQ[3] , \ADR_O[2] , \QQ[2] ) /* synthesis syn_module_defined=1 */ ;
    input CLK_c;
    output buserror;
    output corerunning;
    input GND_net;
    input VCC_net;
    input [1:0]s_cyclecnt;
    input STB_O;
    input \ADR_O[1] ;
    output \QQ[1] ;
    input \ADR_O[0] ;
    output \QQ[0] ;
    input \ADR_O[6] ;
    output \QQ[6] ;
    input \ADR_O[5] ;
    output \QQ[5] ;
    input \ADR_O[4] ;
    output \QQ[4] ;
    input \ADR_O[3] ;
    output \QQ[3] ;
    input \ADR_O[2] ;
    output \QQ[2] ;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    wire [6:0]dbg_rccnt;   // ../../../../code/m_cyclecnt.v(115[19:28])
    wire [6:0]\genblk1.genblk1.ccnt ;   // ../../../../code/m_cyclecnt.v(289[24:28])
    
    wire \genblk1.genblk1.cmbbuserror , \genblk1.genblk1.cmb_rcrun ;
    wire [7:0]\genblk1.genblk1.ccntcy ;   // ../../../../code/m_cyclecnt.v(291[24:30])
    
    SB_DFF \genblk1.genblk1.r_rcntlsb_5  (.Q(dbg_rccnt[5]), .C(CLK_c), .D(\genblk1.genblk1.ccnt [5])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=55, LSE_LLINE=790, LSE_RLINE=804 */ ;   // ../../../../code/m_cyclecnt.v(300[20:73])
    SB_DFF \genblk1.genblk1.r_rcntlsb_4  (.Q(dbg_rccnt[4]), .C(CLK_c), .D(\genblk1.genblk1.ccnt [4])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=55, LSE_LLINE=790, LSE_RLINE=804 */ ;   // ../../../../code/m_cyclecnt.v(300[20:73])
    SB_DFF \genblk1.genblk1.r_rcntlsb_3  (.Q(dbg_rccnt[3]), .C(CLK_c), .D(\genblk1.genblk1.ccnt [3])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=55, LSE_LLINE=790, LSE_RLINE=804 */ ;   // ../../../../code/m_cyclecnt.v(300[20:73])
    SB_DFF \genblk1.genblk1.r_rcntlsb_2  (.Q(dbg_rccnt[2]), .C(CLK_c), .D(\genblk1.genblk1.ccnt [2])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=55, LSE_LLINE=790, LSE_RLINE=804 */ ;   // ../../../../code/m_cyclecnt.v(300[20:73])
    SB_DFF \genblk1.genblk1.r_rcntlsb_1  (.Q(dbg_rccnt[1]), .C(CLK_c), .D(\genblk1.genblk1.ccnt [1])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=55, LSE_LLINE=790, LSE_RLINE=804 */ ;   // ../../../../code/m_cyclecnt.v(300[20:73])
    SB_DFF \genblk1.genblk1.r_rcntlsb_0  (.Q(dbg_rccnt[0]), .C(CLK_c), .D(\genblk1.genblk1.ccnt [0])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=55, LSE_LLINE=790, LSE_RLINE=804 */ ;   // ../../../../code/m_cyclecnt.v(300[20:73])
    SB_DFF \genblk1.genblk1.r_buserror  (.Q(buserror), .C(CLK_c), .D(\genblk1.genblk1.cmbbuserror )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=55, LSE_LLINE=790, LSE_RLINE=804 */ ;   // ../../../../code/m_cyclecnt.v(301[20:80])
    SB_DFF \genblk1.genblk1.r_rcrun  (.Q(corerunning), .C(CLK_c), .D(\genblk1.genblk1.cmb_rcrun )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=55, LSE_LLINE=790, LSE_RLINE=804 */ ;   // ../../../../code/m_cyclecnt.v(302[20:78])
    SB_DFF \genblk1.genblk1.r_rcntlsb_6  (.Q(dbg_rccnt[6]), .C(CLK_c), .D(\genblk1.genblk1.ccnt [6])) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=55, LSE_LLINE=790, LSE_RLINE=804 */ ;   // ../../../../code/m_cyclecnt.v(300[20:73])
    \bn_l4(I=16'b1111111111110000)  \genblk1.genblk1.l_rcrun  (.GND_net(GND_net), 
            .corerunning(corerunning), .\genblk1.genblk1.ccntcy[7] (\genblk1.genblk1.ccntcy [7]), 
            .\genblk1.genblk1.cmb_rcrun (\genblk1.genblk1.cmb_rcrun )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_cyclecnt.v(299[39:125])
    \bn_lcy4_b(I=16'b1010101000100010)  \genblk1.genblk1.l_ccntlsb  (.\dbg_rccnt[0] (dbg_rccnt[0]), 
            .GND_net(GND_net), .VCC_net(VCC_net), .\genblk1.genblk1.ccntcy[0] (\genblk1.genblk1.ccntcy [0]), 
            .\s_cyclecnt[0] (s_cyclecnt[0]), .\genblk1.genblk1.ccnt[0] (\genblk1.genblk1.ccnt [0])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_cyclecnt.v(295[39:178])
    \bn_lcy4_b(I=16'b01000001000)  \genblk1.genblk1.l_ccnt_4  (.\dbg_rccnt[5] (dbg_rccnt[5]), 
            .\s_cyclecnt[0] (s_cyclecnt[0]), .\genblk1.genblk1.ccntcy[4] (\genblk1.genblk1.ccntcy [4]), 
            .\genblk1.genblk1.ccntcy[5] (\genblk1.genblk1.ccntcy [5]), .VCC_net(VCC_net), 
            .\genblk1.genblk1.ccnt[5] (\genblk1.genblk1.ccnt [5])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_cyclecnt.v(296[39:178])
    \bn_lcy4_b(I=16'b01000001000)_U67  \genblk1.genblk1.l_ccnt_3  (.\dbg_rccnt[4] (dbg_rccnt[4]), 
            .\s_cyclecnt[0] (s_cyclecnt[0]), .\genblk1.genblk1.ccntcy[3] (\genblk1.genblk1.ccntcy [3]), 
            .\genblk1.genblk1.ccntcy[4] (\genblk1.genblk1.ccntcy [4]), .VCC_net(VCC_net), 
            .\genblk1.genblk1.ccnt[4] (\genblk1.genblk1.ccnt [4])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_cyclecnt.v(296[39:178])
    \bn_lcy4_b(I=16'b01000001000)_U68  \genblk1.genblk1.l_ccnt_2  (.\dbg_rccnt[3] (dbg_rccnt[3]), 
            .\s_cyclecnt[0] (s_cyclecnt[0]), .\genblk1.genblk1.ccntcy[2] (\genblk1.genblk1.ccntcy [2]), 
            .\genblk1.genblk1.ccntcy[3] (\genblk1.genblk1.ccntcy [3]), .VCC_net(VCC_net), 
            .\genblk1.genblk1.ccnt[3] (\genblk1.genblk1.ccnt [3])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_cyclecnt.v(296[39:178])
    \bn_lcy4_b(I=16'b01000001000)_U69  \genblk1.genblk1.l_ccnt_1  (.\dbg_rccnt[2] (dbg_rccnt[2]), 
            .\s_cyclecnt[0] (s_cyclecnt[0]), .\genblk1.genblk1.ccntcy[1] (\genblk1.genblk1.ccntcy [1]), 
            .\genblk1.genblk1.ccntcy[2] (\genblk1.genblk1.ccntcy [2]), .VCC_net(VCC_net), 
            .\genblk1.genblk1.ccnt[2] (\genblk1.genblk1.ccnt [2])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_cyclecnt.v(296[39:178])
    \bn_lcy4_b(I=16'b01000001000)_U70  \genblk1.genblk1.l_ccnt_0  (.\dbg_rccnt[1] (dbg_rccnt[1]), 
            .\s_cyclecnt[0] (s_cyclecnt[0]), .\genblk1.genblk1.ccntcy[0] (\genblk1.genblk1.ccntcy [0]), 
            .\genblk1.genblk1.ccntcy[1] (\genblk1.genblk1.ccntcy [1]), .VCC_net(VCC_net), 
            .\genblk1.genblk1.ccnt[1] (\genblk1.genblk1.ccnt [1])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_cyclecnt.v(296[39:178])
    \bn_lcy4_b(I=16'b01000001000)_U71  \genblk1.genblk1.l_ccnt6  (.\dbg_rccnt[6] (dbg_rccnt[6]), 
            .\s_cyclecnt[0] (s_cyclecnt[0]), .\genblk1.genblk1.ccntcy[6] (\genblk1.genblk1.ccntcy [6]), 
            .\genblk1.genblk1.ccntcy[7] (\genblk1.genblk1.ccntcy [7]), .VCC_net(VCC_net), 
            .\genblk1.genblk1.ccnt[6] (\genblk1.genblk1.ccnt [6])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_cyclecnt.v(298[39:178])
    \bn_lcy4_b(I=16'b1010101000000000)  \genblk1.genblk1.l_buserror  (.VCC_net(VCC_net), 
            .GND_net(GND_net), .\genblk1.genblk1.ccntcy[5] (\genblk1.genblk1.ccntcy [5]), 
            .\genblk1.genblk1.ccntcy[6] (\genblk1.genblk1.ccntcy [6]), .STB_O(STB_O), 
            .\genblk1.genblk1.cmbbuserror (\genblk1.genblk1.cmbbuserror )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_cyclecnt.v(297[39:182])
    \bn_l4(I=16'b1100101011001111)  \genblk1.genblk1.genblk1.c_qq_10_1  (.\ADR_O[1] (\ADR_O[1] ), 
            .\dbg_rccnt[1] (dbg_rccnt[1]), .s_cyclecnt({s_cyclecnt}), .\QQ[1] (\QQ[1] )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_cyclecnt.v(305[38:140])
    \bn_l4(I=16'b1100101011001111)_U72  \genblk1.genblk1.genblk1.c_qq_10_0  (.\ADR_O[0] (\ADR_O[0] ), 
            .\dbg_rccnt[0] (dbg_rccnt[0]), .s_cyclecnt({s_cyclecnt}), .\QQ[0] (\QQ[0] )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_cyclecnt.v(305[38:140])
    \bn_l4(I=16'b1100101011001010)_U73  \genblk1.genblk1.c_qq_62_4  (.\ADR_O[6] (\ADR_O[6] ), 
            .\dbg_rccnt[6] (dbg_rccnt[6]), .\s_cyclecnt[0] (s_cyclecnt[0]), 
            .GND_net(GND_net), .\QQ[6] (\QQ[6] )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_cyclecnt.v(312[35:128])
    \bn_l4(I=16'b1100101011001010)_U74  \genblk1.genblk1.c_qq_62_3  (.\ADR_O[5] (\ADR_O[5] ), 
            .\dbg_rccnt[5] (dbg_rccnt[5]), .\s_cyclecnt[0] (s_cyclecnt[0]), 
            .GND_net(GND_net), .\QQ[5] (\QQ[5] )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_cyclecnt.v(312[35:128])
    \bn_l4(I=16'b1100101011001010)_U75  \genblk1.genblk1.c_qq_62_2  (.\ADR_O[4] (\ADR_O[4] ), 
            .\dbg_rccnt[4] (dbg_rccnt[4]), .\s_cyclecnt[0] (s_cyclecnt[0]), 
            .GND_net(GND_net), .\QQ[4] (\QQ[4] )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_cyclecnt.v(312[35:128])
    \bn_l4(I=16'b1100101011001010)_U76  \genblk1.genblk1.c_qq_62_1  (.\ADR_O[3] (\ADR_O[3] ), 
            .\dbg_rccnt[3] (dbg_rccnt[3]), .\s_cyclecnt[0] (s_cyclecnt[0]), 
            .GND_net(GND_net), .\QQ[3] (\QQ[3] )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_cyclecnt.v(312[35:128])
    \bn_l4(I=16'b1100101011001010)_U77  \genblk1.genblk1.c_qq_62_0  (.\ADR_O[2] (\ADR_O[2] ), 
            .\dbg_rccnt[2] (dbg_rccnt[2]), .\s_cyclecnt[0] (s_cyclecnt[0]), 
            .GND_net(GND_net), .\QQ[2] (\QQ[2] )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_cyclecnt.v(312[35:128])
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b1111111111110000) 
//

module \bn_l4(I=16'b1111111111110000)  (GND_net, corerunning, \genblk1.genblk1.ccntcy[7] , 
            \genblk1.genblk1.cmb_rcrun ) /* synthesis syn_module_defined=1 */ ;
    input GND_net;
    input corerunning;
    input \genblk1.genblk1.ccntcy[7] ;
    output \genblk1.genblk1.cmb_rcrun ;
    
    
    SB_LUT4 l (.I0(GND_net), .I1(GND_net), .I2(corerunning), .I3(\genblk1.genblk1.ccntcy[7] ), 
            .O(\genblk1.genblk1.cmb_rcrun )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=39, LSE_RCOL=125, LSE_LLINE=299, LSE_RLINE=299 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b1111111111110000;
    
endmodule
//
// Verilog Description of module \bn_lcy4_b(I=16'b1010101000100010) 
//

module \bn_lcy4_b(I=16'b1010101000100010)  (\dbg_rccnt[0] , GND_net, VCC_net, 
            \genblk1.genblk1.ccntcy[0] , \s_cyclecnt[0] , \genblk1.genblk1.ccnt[0] ) /* synthesis syn_module_defined=1 */ ;
    input \dbg_rccnt[0] ;
    input GND_net;
    input VCC_net;
    output \genblk1.genblk1.ccntcy[0] ;
    input \s_cyclecnt[0] ;
    output \genblk1.genblk1.ccnt[0] ;
    
    
    SB_CARRY y (.CI(VCC_net), .I0(\dbg_rccnt[0] ), .I1(GND_net), .CO(\genblk1.genblk1.ccntcy[0] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=39, LSE_RCOL=178, LSE_LLINE=295, LSE_RLINE=295 */ ;   // ../../../../code/m_ice_shortcuts.v(35[13:63])
    SB_LUT4 l (.I0(VCC_net), .I1(\dbg_rccnt[0] ), .I2(GND_net), .I3(\s_cyclecnt[0] ), 
            .O(\genblk1.genblk1.ccnt[0] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=39, LSE_RCOL=178, LSE_LLINE=295, LSE_RLINE=295 */ ;   // ../../../../code/m_ice_shortcuts.v(34[28:72])
    defparam l.LUT_INIT = 16'b1010101000100010;
    
endmodule
//
// Verilog Description of module \bn_lcy4_b(I=16'b01000001000) 
//

module \bn_lcy4_b(I=16'b01000001000)  (\dbg_rccnt[5] , \s_cyclecnt[0] , 
            \genblk1.genblk1.ccntcy[4] , \genblk1.genblk1.ccntcy[5] , VCC_net, 
            \genblk1.genblk1.ccnt[5] ) /* synthesis syn_module_defined=1 */ ;
    input \dbg_rccnt[5] ;
    input \s_cyclecnt[0] ;
    input \genblk1.genblk1.ccntcy[4] ;
    output \genblk1.genblk1.ccntcy[5] ;
    input VCC_net;
    output \genblk1.genblk1.ccnt[5] ;
    
    
    SB_CARRY y (.CI(\genblk1.genblk1.ccntcy[4] ), .I0(\dbg_rccnt[5] ), .I1(\s_cyclecnt[0] ), 
            .CO(\genblk1.genblk1.ccntcy[5] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=39, LSE_RCOL=178, LSE_LLINE=296, LSE_RLINE=296 */ ;   // ../../../../code/m_ice_shortcuts.v(35[13:63])
    SB_LUT4 l (.I0(VCC_net), .I1(\dbg_rccnt[5] ), .I2(\s_cyclecnt[0] ), 
            .I3(\genblk1.genblk1.ccntcy[4] ), .O(\genblk1.genblk1.ccnt[5] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=39, LSE_RCOL=178, LSE_LLINE=296, LSE_RLINE=296 */ ;   // ../../../../code/m_ice_shortcuts.v(34[28:72])
    defparam l.LUT_INIT = 16'b0000001000001000;
    
endmodule
//
// Verilog Description of module \bn_lcy4_b(I=16'b01000001000)_U67 
//

module \bn_lcy4_b(I=16'b01000001000)_U67  (\dbg_rccnt[4] , \s_cyclecnt[0] , 
            \genblk1.genblk1.ccntcy[3] , \genblk1.genblk1.ccntcy[4] , VCC_net, 
            \genblk1.genblk1.ccnt[4] ) /* synthesis syn_module_defined=1 */ ;
    input \dbg_rccnt[4] ;
    input \s_cyclecnt[0] ;
    input \genblk1.genblk1.ccntcy[3] ;
    output \genblk1.genblk1.ccntcy[4] ;
    input VCC_net;
    output \genblk1.genblk1.ccnt[4] ;
    
    
    SB_CARRY y (.CI(\genblk1.genblk1.ccntcy[3] ), .I0(\dbg_rccnt[4] ), .I1(\s_cyclecnt[0] ), 
            .CO(\genblk1.genblk1.ccntcy[4] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=39, LSE_RCOL=178, LSE_LLINE=296, LSE_RLINE=296 */ ;   // ../../../../code/m_ice_shortcuts.v(35[13:63])
    SB_LUT4 l (.I0(VCC_net), .I1(\dbg_rccnt[4] ), .I2(\s_cyclecnt[0] ), 
            .I3(\genblk1.genblk1.ccntcy[3] ), .O(\genblk1.genblk1.ccnt[4] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=39, LSE_RCOL=178, LSE_LLINE=296, LSE_RLINE=296 */ ;   // ../../../../code/m_ice_shortcuts.v(34[28:72])
    defparam l.LUT_INIT = 16'b0000001000001000;
    
endmodule
//
// Verilog Description of module \bn_lcy4_b(I=16'b01000001000)_U68 
//

module \bn_lcy4_b(I=16'b01000001000)_U68  (\dbg_rccnt[3] , \s_cyclecnt[0] , 
            \genblk1.genblk1.ccntcy[2] , \genblk1.genblk1.ccntcy[3] , VCC_net, 
            \genblk1.genblk1.ccnt[3] ) /* synthesis syn_module_defined=1 */ ;
    input \dbg_rccnt[3] ;
    input \s_cyclecnt[0] ;
    input \genblk1.genblk1.ccntcy[2] ;
    output \genblk1.genblk1.ccntcy[3] ;
    input VCC_net;
    output \genblk1.genblk1.ccnt[3] ;
    
    
    SB_CARRY y (.CI(\genblk1.genblk1.ccntcy[2] ), .I0(\dbg_rccnt[3] ), .I1(\s_cyclecnt[0] ), 
            .CO(\genblk1.genblk1.ccntcy[3] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=39, LSE_RCOL=178, LSE_LLINE=296, LSE_RLINE=296 */ ;   // ../../../../code/m_ice_shortcuts.v(35[13:63])
    SB_LUT4 l (.I0(VCC_net), .I1(\dbg_rccnt[3] ), .I2(\s_cyclecnt[0] ), 
            .I3(\genblk1.genblk1.ccntcy[2] ), .O(\genblk1.genblk1.ccnt[3] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=39, LSE_RCOL=178, LSE_LLINE=296, LSE_RLINE=296 */ ;   // ../../../../code/m_ice_shortcuts.v(34[28:72])
    defparam l.LUT_INIT = 16'b0000001000001000;
    
endmodule
//
// Verilog Description of module \bn_lcy4_b(I=16'b01000001000)_U69 
//

module \bn_lcy4_b(I=16'b01000001000)_U69  (\dbg_rccnt[2] , \s_cyclecnt[0] , 
            \genblk1.genblk1.ccntcy[1] , \genblk1.genblk1.ccntcy[2] , VCC_net, 
            \genblk1.genblk1.ccnt[2] ) /* synthesis syn_module_defined=1 */ ;
    input \dbg_rccnt[2] ;
    input \s_cyclecnt[0] ;
    input \genblk1.genblk1.ccntcy[1] ;
    output \genblk1.genblk1.ccntcy[2] ;
    input VCC_net;
    output \genblk1.genblk1.ccnt[2] ;
    
    
    SB_CARRY y (.CI(\genblk1.genblk1.ccntcy[1] ), .I0(\dbg_rccnt[2] ), .I1(\s_cyclecnt[0] ), 
            .CO(\genblk1.genblk1.ccntcy[2] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=39, LSE_RCOL=178, LSE_LLINE=296, LSE_RLINE=296 */ ;   // ../../../../code/m_ice_shortcuts.v(35[13:63])
    SB_LUT4 l (.I0(VCC_net), .I1(\dbg_rccnt[2] ), .I2(\s_cyclecnt[0] ), 
            .I3(\genblk1.genblk1.ccntcy[1] ), .O(\genblk1.genblk1.ccnt[2] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=39, LSE_RCOL=178, LSE_LLINE=296, LSE_RLINE=296 */ ;   // ../../../../code/m_ice_shortcuts.v(34[28:72])
    defparam l.LUT_INIT = 16'b0000001000001000;
    
endmodule
//
// Verilog Description of module \bn_lcy4_b(I=16'b01000001000)_U70 
//

module \bn_lcy4_b(I=16'b01000001000)_U70  (\dbg_rccnt[1] , \s_cyclecnt[0] , 
            \genblk1.genblk1.ccntcy[0] , \genblk1.genblk1.ccntcy[1] , VCC_net, 
            \genblk1.genblk1.ccnt[1] ) /* synthesis syn_module_defined=1 */ ;
    input \dbg_rccnt[1] ;
    input \s_cyclecnt[0] ;
    input \genblk1.genblk1.ccntcy[0] ;
    output \genblk1.genblk1.ccntcy[1] ;
    input VCC_net;
    output \genblk1.genblk1.ccnt[1] ;
    
    
    SB_CARRY y (.CI(\genblk1.genblk1.ccntcy[0] ), .I0(\dbg_rccnt[1] ), .I1(\s_cyclecnt[0] ), 
            .CO(\genblk1.genblk1.ccntcy[1] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=39, LSE_RCOL=178, LSE_LLINE=296, LSE_RLINE=296 */ ;   // ../../../../code/m_ice_shortcuts.v(35[13:63])
    SB_LUT4 l (.I0(VCC_net), .I1(\dbg_rccnt[1] ), .I2(\s_cyclecnt[0] ), 
            .I3(\genblk1.genblk1.ccntcy[0] ), .O(\genblk1.genblk1.ccnt[1] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=39, LSE_RCOL=178, LSE_LLINE=296, LSE_RLINE=296 */ ;   // ../../../../code/m_ice_shortcuts.v(34[28:72])
    defparam l.LUT_INIT = 16'b0000001000001000;
    
endmodule
//
// Verilog Description of module \bn_lcy4_b(I=16'b01000001000)_U71 
//

module \bn_lcy4_b(I=16'b01000001000)_U71  (\dbg_rccnt[6] , \s_cyclecnt[0] , 
            \genblk1.genblk1.ccntcy[6] , \genblk1.genblk1.ccntcy[7] , VCC_net, 
            \genblk1.genblk1.ccnt[6] ) /* synthesis syn_module_defined=1 */ ;
    input \dbg_rccnt[6] ;
    input \s_cyclecnt[0] ;
    input \genblk1.genblk1.ccntcy[6] ;
    output \genblk1.genblk1.ccntcy[7] ;
    input VCC_net;
    output \genblk1.genblk1.ccnt[6] ;
    
    
    SB_CARRY y (.CI(\genblk1.genblk1.ccntcy[6] ), .I0(\dbg_rccnt[6] ), .I1(\s_cyclecnt[0] ), 
            .CO(\genblk1.genblk1.ccntcy[7] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=39, LSE_RCOL=178, LSE_LLINE=298, LSE_RLINE=298 */ ;   // ../../../../code/m_ice_shortcuts.v(35[13:63])
    SB_LUT4 l (.I0(VCC_net), .I1(\dbg_rccnt[6] ), .I2(\s_cyclecnt[0] ), 
            .I3(\genblk1.genblk1.ccntcy[6] ), .O(\genblk1.genblk1.ccnt[6] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=39, LSE_RCOL=178, LSE_LLINE=298, LSE_RLINE=298 */ ;   // ../../../../code/m_ice_shortcuts.v(34[28:72])
    defparam l.LUT_INIT = 16'b0000001000001000;
    
endmodule
//
// Verilog Description of module \bn_lcy4_b(I=16'b1010101000000000) 
//

module \bn_lcy4_b(I=16'b1010101000000000)  (VCC_net, GND_net, \genblk1.genblk1.ccntcy[5] , 
            \genblk1.genblk1.ccntcy[6] , STB_O, \genblk1.genblk1.cmbbuserror ) /* synthesis syn_module_defined=1 */ ;
    input VCC_net;
    input GND_net;
    input \genblk1.genblk1.ccntcy[5] ;
    output \genblk1.genblk1.ccntcy[6] ;
    input STB_O;
    output \genblk1.genblk1.cmbbuserror ;
    
    
    SB_CARRY y (.CI(\genblk1.genblk1.ccntcy[5] ), .I0(VCC_net), .I1(GND_net), 
            .CO(\genblk1.genblk1.ccntcy[6] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=39, LSE_RCOL=182, LSE_LLINE=297, LSE_RLINE=297 */ ;   // ../../../../code/m_ice_shortcuts.v(35[13:63])
    SB_LUT4 l (.I0(STB_O), .I1(VCC_net), .I2(GND_net), .I3(\genblk1.genblk1.ccntcy[5] ), 
            .O(\genblk1.genblk1.cmbbuserror )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=39, LSE_RCOL=182, LSE_LLINE=297, LSE_RLINE=297 */ ;   // ../../../../code/m_ice_shortcuts.v(34[28:72])
    defparam l.LUT_INIT = 16'b1010101000000000;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b1100101011001111) 
//

module \bn_l4(I=16'b1100101011001111)  (\ADR_O[1] , \dbg_rccnt[1] , s_cyclecnt, 
            \QQ[1] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[1] ;
    input \dbg_rccnt[1] ;
    input [1:0]s_cyclecnt;
    output \QQ[1] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[1] ), .I1(\dbg_rccnt[1] ), .I2(s_cyclecnt[0]), 
            .I3(s_cyclecnt[1]), .O(\QQ[1] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=38, LSE_RCOL=140, LSE_LLINE=305, LSE_RLINE=305 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b1100101011001111;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b1100101011001111)_U72 
//

module \bn_l4(I=16'b1100101011001111)_U72  (\ADR_O[0] , \dbg_rccnt[0] , 
            s_cyclecnt, \QQ[0] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[0] ;
    input \dbg_rccnt[0] ;
    input [1:0]s_cyclecnt;
    output \QQ[0] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[0] ), .I1(\dbg_rccnt[0] ), .I2(s_cyclecnt[0]), 
            .I3(s_cyclecnt[1]), .O(\QQ[0] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=38, LSE_RCOL=140, LSE_LLINE=305, LSE_RLINE=305 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b1100101011001111;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b1100101011001010)_U73 
//

module \bn_l4(I=16'b1100101011001010)_U73  (\ADR_O[6] , \dbg_rccnt[6] , 
            \s_cyclecnt[0] , GND_net, \QQ[6] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[6] ;
    input \dbg_rccnt[6] ;
    input \s_cyclecnt[0] ;
    input GND_net;
    output \QQ[6] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[6] ), .I1(\dbg_rccnt[6] ), .I2(\s_cyclecnt[0] ), 
            .I3(GND_net), .O(\QQ[6] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=35, LSE_RCOL=128, LSE_LLINE=312, LSE_RLINE=312 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b1100101011001010;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b1100101011001010)_U74 
//

module \bn_l4(I=16'b1100101011001010)_U74  (\ADR_O[5] , \dbg_rccnt[5] , 
            \s_cyclecnt[0] , GND_net, \QQ[5] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[5] ;
    input \dbg_rccnt[5] ;
    input \s_cyclecnt[0] ;
    input GND_net;
    output \QQ[5] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[5] ), .I1(\dbg_rccnt[5] ), .I2(\s_cyclecnt[0] ), 
            .I3(GND_net), .O(\QQ[5] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=35, LSE_RCOL=128, LSE_LLINE=312, LSE_RLINE=312 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b1100101011001010;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b1100101011001010)_U75 
//

module \bn_l4(I=16'b1100101011001010)_U75  (\ADR_O[4] , \dbg_rccnt[4] , 
            \s_cyclecnt[0] , GND_net, \QQ[4] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[4] ;
    input \dbg_rccnt[4] ;
    input \s_cyclecnt[0] ;
    input GND_net;
    output \QQ[4] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[4] ), .I1(\dbg_rccnt[4] ), .I2(\s_cyclecnt[0] ), 
            .I3(GND_net), .O(\QQ[4] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=35, LSE_RCOL=128, LSE_LLINE=312, LSE_RLINE=312 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b1100101011001010;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b1100101011001010)_U76 
//

module \bn_l4(I=16'b1100101011001010)_U76  (\ADR_O[3] , \dbg_rccnt[3] , 
            \s_cyclecnt[0] , GND_net, \QQ[3] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[3] ;
    input \dbg_rccnt[3] ;
    input \s_cyclecnt[0] ;
    input GND_net;
    output \QQ[3] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[3] ), .I1(\dbg_rccnt[3] ), .I2(\s_cyclecnt[0] ), 
            .I3(GND_net), .O(\QQ[3] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=35, LSE_RCOL=128, LSE_LLINE=312, LSE_RLINE=312 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b1100101011001010;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b1100101011001010)_U77 
//

module \bn_l4(I=16'b1100101011001010)_U77  (\ADR_O[2] , \dbg_rccnt[2] , 
            \s_cyclecnt[0] , GND_net, \QQ[2] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[2] ;
    input \dbg_rccnt[2] ;
    input \s_cyclecnt[0] ;
    input GND_net;
    output \QQ[2] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[2] ), .I1(\dbg_rccnt[2] ), .I2(\s_cyclecnt[0] ), 
            .I3(GND_net), .O(\QQ[2] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=60, LSE_LCOL=35, LSE_RCOL=128, LSE_LLINE=312, LSE_RLINE=312 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b1100101011001010;
    
endmodule
//
// Verilog Description of module m_condcode
//

module m_condcode (raluF, CLK_c, \INSTR[14] , \INSTR[13] , rzcy32, 
            \INSTR[12] , GND_net, is_brcond, alu_carryout, A31, \ADR_O[31] ) /* synthesis syn_module_defined=1 */ ;
    output raluF;
    input CLK_c;
    input \INSTR[14] ;
    input \INSTR[13] ;
    input rzcy32;
    input \INSTR[12] ;
    input GND_net;
    output is_brcond;
    input alu_carryout;
    input A31;
    input \ADR_O[31] ;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    wire \genblk1.cmb_aluF , n2, n6, n5618;
    
    SB_DFF \genblk1.tmp_raluF_31  (.Q(raluF), .C(CLK_c), .D(\genblk1.cmb_aluF ));   // ../../../../code/m_condcode.v(47[17] 48[34])
    SB_LUT4 INSTR_14__I_0_i7_4_lut (.I0(n2), .I1(n6), .I2(\INSTR[14] ), 
            .I3(\INSTR[13] ), .O(\genblk1.cmb_aluF ));   // ../../../../code/m_condcode.v(37[12] 45[19])
    defparam INSTR_14__I_0_i7_4_lut.LUT_INIT = 16'hcac0;
    SB_LUT4 i3953_3_lut (.I0(rzcy32), .I1(\INSTR[13] ), .I2(\INSTR[12] ), 
            .I3(GND_net), .O(n5618));   // ../../../../code/m_condcode.v(52[12] 60[19])
    defparam i3953_3_lut.LUT_INIT = 16'h2121;
    SB_LUT4 INSTR_14__I_0_32_i7_4_lut (.I0(n5618), .I1(raluF), .I2(\INSTR[14] ), 
            .I3(\INSTR[12] ), .O(is_brcond));   // ../../../../code/m_condcode.v(52[12] 60[19])
    defparam INSTR_14__I_0_32_i7_4_lut.LUT_INIT = 16'h3aca;
    SB_LUT4 INSTR_14__I_0_i6_3_lut_4_lut (.I0(alu_carryout), .I1(A31), .I2(\ADR_O[31] ), 
            .I3(\INSTR[13] ), .O(n6));   // ../../../../code/m_condcode.v(41[34:75])
    defparam INSTR_14__I_0_i6_3_lut_4_lut.LUT_INIT = 16'h55d4;
    SB_LUT4 INSTR_14__I_0_i2_3_lut_4_lut (.I0(alu_carryout), .I1(A31), .I2(\ADR_O[31] ), 
            .I3(\INSTR[12] ), .O(n2));   // ../../../../code/m_condcode.v(41[34:75])
    defparam INSTR_14__I_0_i2_3_lut_4_lut.LUT_INIT = 16'h55d4;
    
endmodule
//
// Verilog Description of module \m_alu_carryin(HIGHLEVEL=0,MULDIV=0) 
//

module \m_alu_carryin(HIGHLEVEL=0,MULDIV=0)  (CLK_c, rlastshift, \ADR_O[31] , 
            raluF, VCC_net, \FUNC7[5] , \FUNC7[0] , sra_msb, s_alu_carryin, 
            alu_carryin, GND_net, lastshift) /* synthesis syn_module_defined=1 */ ;
    input CLK_c;
    output rlastshift;
    input \ADR_O[31] ;
    input raluF;
    input VCC_net;
    input \FUNC7[5] ;
    input \FUNC7[0] ;
    output sra_msb;
    input [1:0]s_alu_carryin;
    output alu_carryin;
    input GND_net;
    input lastshift;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    wire \genblk1.genblk1.dup_lastshift , \genblk1.genblk1.prealucyin ;
    
    SB_DFF \genblk1.genblk1.reglastshift  (.Q(rlastshift), .C(CLK_c), .D(\genblk1.genblk1.dup_lastshift )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=63, LSE_LCOL=4, LSE_RCOL=62, LSE_LLINE=817, LSE_RLINE=834 */ ;   // ../../../../code/m_alu_carryin.v(151[20:77])
    \bn_lcy4v_b(I=16'b1111000010001000)  \genblk1.genblk1.lb  (.\ADR_O[31] (\ADR_O[31] ), 
            .raluF(raluF), .VCC_net(VCC_net), .\genblk1.genblk1.prealucyin (\genblk1.genblk1.prealucyin ), 
            .\FUNC7[5] (\FUNC7[5] ), .\FUNC7[0] (\FUNC7[0] ), .sra_msb(sra_msb)) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu_carryin.v(149[40:134])
    \bn_lcy4v_b(I=16'b1010101010101010)  \genblk1.genblk1.la  (.s_alu_carryin({s_alu_carryin}), 
            .\genblk1.genblk1.prealucyin (\genblk1.genblk1.prealucyin ), .alu_carryin(alu_carryin), 
            .GND_net(GND_net), .lastshift(lastshift), .\genblk1.genblk1.dup_lastshift (\genblk1.genblk1.dup_lastshift )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu_carryin.v(150[40:132])
    
endmodule
//
// Verilog Description of module \bn_lcy4v_b(I=16'b1111000010001000) 
//

module \bn_lcy4v_b(I=16'b1111000010001000)  (\ADR_O[31] , raluF, VCC_net, 
            \genblk1.genblk1.prealucyin , \FUNC7[5] , \FUNC7[0] , sra_msb) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[31] ;
    input raluF;
    input VCC_net;
    output \genblk1.genblk1.prealucyin ;
    input \FUNC7[5] ;
    input \FUNC7[0] ;
    output sra_msb;
    
    
    SB_CARRY y (.CI(VCC_net), .I0(raluF), .I1(\ADR_O[31] ), .CO(\genblk1.genblk1.prealucyin )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=59, LSE_LCOL=40, LSE_RCOL=134, LSE_LLINE=149, LSE_RLINE=149 */ ;   // ../../../../code/m_ice_shortcuts.v(65[13:69])
    SB_LUT4 l (.I0(\FUNC7[0] ), .I1(raluF), .I2(\ADR_O[31] ), .I3(\FUNC7[5] ), 
            .O(sra_msb)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=59, LSE_LCOL=40, LSE_RCOL=134, LSE_LLINE=149, LSE_RLINE=149 */ ;   // ../../../../code/m_ice_shortcuts.v(64[28:80])
    defparam l.LUT_INIT = 16'b1111000010001000;
    
endmodule
//
// Verilog Description of module \bn_lcy4v_b(I=16'b1010101010101010) 
//

module \bn_lcy4v_b(I=16'b1010101010101010)  (s_alu_carryin, \genblk1.genblk1.prealucyin , 
            alu_carryin, GND_net, lastshift, \genblk1.genblk1.dup_lastshift ) /* synthesis syn_module_defined=1 */ ;
    input [1:0]s_alu_carryin;
    input \genblk1.genblk1.prealucyin ;
    output alu_carryin;
    input GND_net;
    input lastshift;
    output \genblk1.genblk1.dup_lastshift ;
    
    
    SB_CARRY y (.CI(\genblk1.genblk1.prealucyin ), .I0(s_alu_carryin[0]), 
            .I1(s_alu_carryin[1]), .CO(alu_carryin)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=59, LSE_LCOL=40, LSE_RCOL=132, LSE_LLINE=150, LSE_RLINE=150 */ ;   // ../../../../code/m_ice_shortcuts.v(65[13:69])
    SB_LUT4 l (.I0(lastshift), .I1(s_alu_carryin[0]), .I2(s_alu_carryin[1]), 
            .I3(GND_net), .O(\genblk1.genblk1.dup_lastshift )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=59, LSE_LCOL=40, LSE_RCOL=132, LSE_LLINE=150, LSE_RLINE=150 */ ;   // ../../../../code/m_ice_shortcuts.v(64[28:80])
    defparam l.LUT_INIT = 16'b1010101010101010;
    
endmodule
//
// Verilog Description of module \m_alu(MTIMETAP_LOWLIM=14) 
//

module \m_alu(MTIMETAP_LOWLIM=14)  (\ADR_O[9] , s_alu, B, \ADR_O[8] , 
            \ADR_O[7] , \QQ[6] , \QQ[5] , \QQ[4] , \QQ[3] , A31, 
            \ADR_O[31] , alu_carryout, \ADR_O[30] , \QQ[2] , \ADR_O[29] , 
            \ADR_O[28] , \ADR_O[27] , \ADR_O[26] , \ADR_O[25] , \ADR_O[24] , 
            \ADR_O[23] , \ADR_O[22] , \ADR_O[21] , \ADR_O[20] , \QQ[1] , 
            \ADR_O[19] , \ADR_O[18] , \ADR_O[17] , \ADR_O[16] , \ADR_O[15] , 
            \ADR_O[14] , \ADR_O[13] , \ADR_O[12] , \ADR_O[11] , \ADR_O[10] , 
            \QQ[0] , alu_carryin, Di, \ADR_O[6] , \ADR_O[5] , \ADR_O[4] , 
            \ADR_O[3] , \ADR_O[2] , \ADR_O[1] , \ADR_O[0] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[9] ;
    input [2:0]s_alu;
    output [31:0]B;
    input \ADR_O[8] ;
    input \ADR_O[7] ;
    input \QQ[6] ;
    input \QQ[5] ;
    input \QQ[4] ;
    input \QQ[3] ;
    output A31;
    input \ADR_O[31] ;
    output alu_carryout;
    input \ADR_O[30] ;
    input \QQ[2] ;
    input \ADR_O[29] ;
    input \ADR_O[28] ;
    input \ADR_O[27] ;
    input \ADR_O[26] ;
    input \ADR_O[25] ;
    input \ADR_O[24] ;
    input \ADR_O[23] ;
    input \ADR_O[22] ;
    input \ADR_O[21] ;
    input \ADR_O[20] ;
    input \QQ[1] ;
    input \ADR_O[19] ;
    input \ADR_O[18] ;
    input \ADR_O[17] ;
    input \ADR_O[16] ;
    input \ADR_O[15] ;
    input \ADR_O[14] ;
    input \ADR_O[13] ;
    input \ADR_O[12] ;
    input \ADR_O[11] ;
    input \ADR_O[10] ;
    input \QQ[0] ;
    input alu_carryin;
    input [31:0]Di;
    input \ADR_O[6] ;
    input \ADR_O[5] ;
    input \ADR_O[4] ;
    input \ADR_O[3] ;
    input \ADR_O[2] ;
    input \ADR_O[1] ;
    input \ADR_O[0] ;
    
    
    \m_alu_lowlevel(ALUWIDTH=32,MTIMETAP_LOWLIM=14)  \genblk1.inst  (.\ADR_O[9] (\ADR_O[9] ), 
            .s_alu({s_alu}), .B({B}), .\ADR_O[8] (\ADR_O[8] ), .\ADR_O[7] (\ADR_O[7] ), 
            .\QQ[6] (\QQ[6] ), .\QQ[5] (\QQ[5] ), .\QQ[4] (\QQ[4] ), .\QQ[3] (\QQ[3] ), 
            .A31(A31), .\ADR_O[31] (\ADR_O[31] ), .alu_carryout(alu_carryout), 
            .\ADR_O[30] (\ADR_O[30] ), .\QQ[2] (\QQ[2] ), .\ADR_O[29] (\ADR_O[29] ), 
            .\ADR_O[28] (\ADR_O[28] ), .\ADR_O[27] (\ADR_O[27] ), .\ADR_O[26] (\ADR_O[26] ), 
            .\ADR_O[25] (\ADR_O[25] ), .\ADR_O[24] (\ADR_O[24] ), .\ADR_O[23] (\ADR_O[23] ), 
            .\ADR_O[22] (\ADR_O[22] ), .\ADR_O[21] (\ADR_O[21] ), .\ADR_O[20] (\ADR_O[20] ), 
            .\QQ[1] (\QQ[1] ), .\ADR_O[19] (\ADR_O[19] ), .\ADR_O[18] (\ADR_O[18] ), 
            .\ADR_O[17] (\ADR_O[17] ), .\ADR_O[16] (\ADR_O[16] ), .\ADR_O[15] (\ADR_O[15] ), 
            .\ADR_O[14] (\ADR_O[14] ), .\ADR_O[13] (\ADR_O[13] ), .\ADR_O[12] (\ADR_O[12] ), 
            .\ADR_O[11] (\ADR_O[11] ), .\ADR_O[10] (\ADR_O[10] ), .\QQ[0] (\QQ[0] ), 
            .alu_carryin(alu_carryin), .Di({Di}), .\ADR_O[6] (\ADR_O[6] ), 
            .\ADR_O[5] (\ADR_O[5] ), .\ADR_O[4] (\ADR_O[4] ), .\ADR_O[3] (\ADR_O[3] ), 
            .\ADR_O[2] (\ADR_O[2] ), .\ADR_O[1] (\ADR_O[1] ), .\ADR_O[0] (\ADR_O[0] )) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(131[7] 148[48])
    
endmodule
//
// Verilog Description of module \m_alu_lowlevel(ALUWIDTH=32,MTIMETAP_LOWLIM=14) 
//

module \m_alu_lowlevel(ALUWIDTH=32,MTIMETAP_LOWLIM=14)  (\ADR_O[9] , s_alu, 
            B, \ADR_O[8] , \ADR_O[7] , \QQ[6] , \QQ[5] , \QQ[4] , 
            \QQ[3] , A31, \ADR_O[31] , alu_carryout, \ADR_O[30] , 
            \QQ[2] , \ADR_O[29] , \ADR_O[28] , \ADR_O[27] , \ADR_O[26] , 
            \ADR_O[25] , \ADR_O[24] , \ADR_O[23] , \ADR_O[22] , \ADR_O[21] , 
            \ADR_O[20] , \QQ[1] , \ADR_O[19] , \ADR_O[18] , \ADR_O[17] , 
            \ADR_O[16] , \ADR_O[15] , \ADR_O[14] , \ADR_O[13] , \ADR_O[12] , 
            \ADR_O[11] , \ADR_O[10] , \QQ[0] , alu_carryin, Di, \ADR_O[6] , 
            \ADR_O[5] , \ADR_O[4] , \ADR_O[3] , \ADR_O[2] , \ADR_O[1] , 
            \ADR_O[0] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[9] ;
    input [2:0]s_alu;
    output [31:0]B;
    input \ADR_O[8] ;
    input \ADR_O[7] ;
    input \QQ[6] ;
    input \QQ[5] ;
    input \QQ[4] ;
    input \QQ[3] ;
    output A31;
    input \ADR_O[31] ;
    output alu_carryout;
    input \ADR_O[30] ;
    input \QQ[2] ;
    input \ADR_O[29] ;
    input \ADR_O[28] ;
    input \ADR_O[27] ;
    input \ADR_O[26] ;
    input \ADR_O[25] ;
    input \ADR_O[24] ;
    input \ADR_O[23] ;
    input \ADR_O[22] ;
    input \ADR_O[21] ;
    input \ADR_O[20] ;
    input \QQ[1] ;
    input \ADR_O[19] ;
    input \ADR_O[18] ;
    input \ADR_O[17] ;
    input \ADR_O[16] ;
    input \ADR_O[15] ;
    input \ADR_O[14] ;
    input \ADR_O[13] ;
    input \ADR_O[12] ;
    input \ADR_O[11] ;
    input \ADR_O[10] ;
    input \QQ[0] ;
    input alu_carryin;
    input [31:0]Di;
    input \ADR_O[6] ;
    input \ADR_O[5] ;
    input \ADR_O[4] ;
    input \ADR_O[3] ;
    input \ADR_O[2] ;
    input \ADR_O[1] ;
    input \ADR_O[0] ;
    
    wire [31:0]A;   // ../../../../code/m_alu.v(245[27:28])
    wire [32:0]alucy;   // ../../../../code/m_alu.v(248[27:32])
    
    \bn_lcy4(I=16'b1100001101101001)  b_9 (.\A[9] (A[9]), .\ADR_O[9] (\ADR_O[9] ), 
            .\alucy[9] (alucy[9]), .\alucy[10] (alucy[10]), .\s_alu[2] (s_alu[2]), 
            .\B[9] (B[9])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U0  b_8 (.\A[8] (A[8]), .\ADR_O[8] (\ADR_O[8] ), 
            .\alucy[8] (alucy[8]), .\alucy[9] (alucy[9]), .\s_alu[2] (s_alu[2]), 
            .\B[8] (B[8])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U1  b_7 (.\A[7] (A[7]), .\ADR_O[7] (\ADR_O[7] ), 
            .\alucy[7] (alucy[7]), .\alucy[8] (alucy[8]), .\s_alu[2] (s_alu[2]), 
            .\B[7] (B[7])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U2  b_6 (.\A[6] (A[6]), .\QQ[6] (\QQ[6] ), 
            .\alucy[6] (alucy[6]), .\alucy[7] (alucy[7]), .\s_alu[2] (s_alu[2]), 
            .\B[6] (B[6])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U3  b_5 (.\A[5] (A[5]), .\QQ[5] (\QQ[5] ), 
            .\alucy[5] (alucy[5]), .\alucy[6] (alucy[6]), .\s_alu[2] (s_alu[2]), 
            .\B[5] (B[5])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U4  b_4 (.\A[4] (A[4]), .\QQ[4] (\QQ[4] ), 
            .\alucy[4] (alucy[4]), .\alucy[5] (alucy[5]), .\s_alu[2] (s_alu[2]), 
            .\B[4] (B[4])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U5  b_3 (.\A[3] (A[3]), .\QQ[3] (\QQ[3] ), 
            .\alucy[3] (alucy[3]), .\alucy[4] (alucy[4]), .\s_alu[2] (s_alu[2]), 
            .\B[3] (B[3])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U6  b_31 (.A31(A31), .\ADR_O[31] (\ADR_O[31] ), 
            .\alucy[31] (alucy[31]), .alu_carryout(alu_carryout), .\s_alu[2] (s_alu[2]), 
            .\B[31] (B[31])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U7  b_30 (.\A[30] (A[30]), .\ADR_O[30] (\ADR_O[30] ), 
            .\alucy[30] (alucy[30]), .\alucy[31] (alucy[31]), .\s_alu[2] (s_alu[2]), 
            .\B[30] (B[30])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U8  b_2 (.\A[2] (A[2]), .\QQ[2] (\QQ[2] ), 
            .\alucy[2] (alucy[2]), .\alucy[3] (alucy[3]), .\s_alu[2] (s_alu[2]), 
            .\B[2] (B[2])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U9  b_29 (.\A[29] (A[29]), .\ADR_O[29] (\ADR_O[29] ), 
            .\alucy[29] (alucy[29]), .\alucy[30] (alucy[30]), .\s_alu[2] (s_alu[2]), 
            .\B[29] (B[29])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U10  b_28 (.\A[28] (A[28]), .\ADR_O[28] (\ADR_O[28] ), 
            .\alucy[28] (alucy[28]), .\alucy[29] (alucy[29]), .\s_alu[2] (s_alu[2]), 
            .\B[28] (B[28])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U11  b_27 (.\A[27] (A[27]), .\ADR_O[27] (\ADR_O[27] ), 
            .\alucy[27] (alucy[27]), .\alucy[28] (alucy[28]), .\s_alu[2] (s_alu[2]), 
            .\B[27] (B[27])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U12  b_26 (.\A[26] (A[26]), .\ADR_O[26] (\ADR_O[26] ), 
            .\alucy[26] (alucy[26]), .\alucy[27] (alucy[27]), .\s_alu[2] (s_alu[2]), 
            .\B[26] (B[26])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U13  b_25 (.\A[25] (A[25]), .\ADR_O[25] (\ADR_O[25] ), 
            .\alucy[25] (alucy[25]), .\alucy[26] (alucy[26]), .\s_alu[2] (s_alu[2]), 
            .\B[25] (B[25])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U14  b_24 (.\A[24] (A[24]), .\ADR_O[24] (\ADR_O[24] ), 
            .\alucy[24] (alucy[24]), .\alucy[25] (alucy[25]), .\s_alu[2] (s_alu[2]), 
            .\B[24] (B[24])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U15  b_23 (.\A[23] (A[23]), .\ADR_O[23] (\ADR_O[23] ), 
            .\alucy[23] (alucy[23]), .\alucy[24] (alucy[24]), .\s_alu[2] (s_alu[2]), 
            .\B[23] (B[23])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U16  b_22 (.\A[22] (A[22]), .\ADR_O[22] (\ADR_O[22] ), 
            .\alucy[22] (alucy[22]), .\alucy[23] (alucy[23]), .\s_alu[2] (s_alu[2]), 
            .\B[22] (B[22])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U17  b_21 (.\A[21] (A[21]), .\ADR_O[21] (\ADR_O[21] ), 
            .\alucy[21] (alucy[21]), .\alucy[22] (alucy[22]), .\s_alu[2] (s_alu[2]), 
            .\B[21] (B[21])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U18  b_20 (.\A[20] (A[20]), .\ADR_O[20] (\ADR_O[20] ), 
            .\alucy[20] (alucy[20]), .\alucy[21] (alucy[21]), .\s_alu[2] (s_alu[2]), 
            .\B[20] (B[20])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U19  b_1 (.\A[1] (A[1]), .\QQ[1] (\QQ[1] ), 
            .\alucy[1] (alucy[1]), .\alucy[2] (alucy[2]), .\s_alu[2] (s_alu[2]), 
            .\B[1] (B[1])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U20  b_19 (.\A[19] (A[19]), .\ADR_O[19] (\ADR_O[19] ), 
            .\alucy[19] (alucy[19]), .\alucy[20] (alucy[20]), .\s_alu[2] (s_alu[2]), 
            .\B[19] (B[19])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U21  b_18 (.\A[18] (A[18]), .\ADR_O[18] (\ADR_O[18] ), 
            .\alucy[18] (alucy[18]), .\alucy[19] (alucy[19]), .\s_alu[2] (s_alu[2]), 
            .\B[18] (B[18])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U22  b_17 (.\A[17] (A[17]), .\ADR_O[17] (\ADR_O[17] ), 
            .\alucy[17] (alucy[17]), .\alucy[18] (alucy[18]), .\s_alu[2] (s_alu[2]), 
            .\B[17] (B[17])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U23  b_16 (.\A[16] (A[16]), .\ADR_O[16] (\ADR_O[16] ), 
            .\alucy[16] (alucy[16]), .\alucy[17] (alucy[17]), .\s_alu[2] (s_alu[2]), 
            .\B[16] (B[16])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U24  b_15 (.\A[15] (A[15]), .\ADR_O[15] (\ADR_O[15] ), 
            .\alucy[15] (alucy[15]), .\alucy[16] (alucy[16]), .\s_alu[2] (s_alu[2]), 
            .\B[15] (B[15])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U25  b_14 (.\A[14] (A[14]), .\ADR_O[14] (\ADR_O[14] ), 
            .\alucy[14] (alucy[14]), .\alucy[15] (alucy[15]), .\s_alu[2] (s_alu[2]), 
            .\B[14] (B[14])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U26  b_13 (.\A[13] (A[13]), .\ADR_O[13] (\ADR_O[13] ), 
            .\alucy[13] (alucy[13]), .\alucy[14] (alucy[14]), .\s_alu[2] (s_alu[2]), 
            .\B[13] (B[13])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U27  b_12 (.\A[12] (A[12]), .\ADR_O[12] (\ADR_O[12] ), 
            .\alucy[12] (alucy[12]), .\alucy[13] (alucy[13]), .\s_alu[2] (s_alu[2]), 
            .\B[12] (B[12])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U28  b_11 (.\A[11] (A[11]), .\ADR_O[11] (\ADR_O[11] ), 
            .\alucy[11] (alucy[11]), .\alucy[12] (alucy[12]), .\s_alu[2] (s_alu[2]), 
            .\B[11] (B[11])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U29  b_10 (.\A[10] (A[10]), .\ADR_O[10] (\ADR_O[10] ), 
            .\alucy[10] (alucy[10]), .\alucy[11] (alucy[11]), .\s_alu[2] (s_alu[2]), 
            .\B[10] (B[10])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_lcy4(I=16'b1100001101101001)_U30  b_0 (.\A[0] (A[0]), .\QQ[0] (\QQ[0] ), 
            .alu_carryin(alu_carryin), .\alucy[1] (alucy[1]), .\s_alu[2] (s_alu[2]), 
            .\B[0] (B[0])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(255[28:133])
    \bn_l4(I=16'b010010110100)  a_9 (.\ADR_O[9] (\ADR_O[9] ), .\s_alu[0] (s_alu[0]), 
            .\Di[9] (Di[9]), .\s_alu[1] (s_alu[1]), .\A[9] (A[9])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U31  a_8 (.\ADR_O[8] (\ADR_O[8] ), .\s_alu[0] (s_alu[0]), 
            .\Di[8] (Di[8]), .\s_alu[1] (s_alu[1]), .\A[8] (A[8])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U32  a_7 (.\ADR_O[7] (\ADR_O[7] ), .\s_alu[0] (s_alu[0]), 
            .\Di[7] (Di[7]), .\s_alu[1] (s_alu[1]), .\A[7] (A[7])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U33  a_6 (.\ADR_O[6] (\ADR_O[6] ), .\s_alu[0] (s_alu[0]), 
            .\Di[6] (Di[6]), .\s_alu[1] (s_alu[1]), .\A[6] (A[6])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U34  a_5 (.\ADR_O[5] (\ADR_O[5] ), .\s_alu[0] (s_alu[0]), 
            .\Di[5] (Di[5]), .\s_alu[1] (s_alu[1]), .\A[5] (A[5])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U35  a_4 (.\ADR_O[4] (\ADR_O[4] ), .\s_alu[0] (s_alu[0]), 
            .\Di[4] (Di[4]), .\s_alu[1] (s_alu[1]), .\A[4] (A[4])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U36  a_3 (.\ADR_O[3] (\ADR_O[3] ), .\s_alu[0] (s_alu[0]), 
            .\Di[3] (Di[3]), .\s_alu[1] (s_alu[1]), .\A[3] (A[3])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U37  a_31 (.\ADR_O[31] (\ADR_O[31] ), .\s_alu[0] (s_alu[0]), 
            .\Di[31] (Di[31]), .\s_alu[1] (s_alu[1]), .A31(A31)) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U38  a_30 (.\ADR_O[30] (\ADR_O[30] ), .\s_alu[0] (s_alu[0]), 
            .\Di[30] (Di[30]), .\s_alu[1] (s_alu[1]), .\A[30] (A[30])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U39  a_2 (.\ADR_O[2] (\ADR_O[2] ), .\s_alu[0] (s_alu[0]), 
            .\Di[2] (Di[2]), .\s_alu[1] (s_alu[1]), .\A[2] (A[2])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U40  a_29 (.\ADR_O[29] (\ADR_O[29] ), .\s_alu[0] (s_alu[0]), 
            .\Di[29] (Di[29]), .\s_alu[1] (s_alu[1]), .\A[29] (A[29])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U41  a_28 (.\ADR_O[28] (\ADR_O[28] ), .\s_alu[0] (s_alu[0]), 
            .\Di[28] (Di[28]), .\s_alu[1] (s_alu[1]), .\A[28] (A[28])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U42  a_27 (.\ADR_O[27] (\ADR_O[27] ), .\s_alu[0] (s_alu[0]), 
            .\Di[27] (Di[27]), .\s_alu[1] (s_alu[1]), .\A[27] (A[27])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U43  a_26 (.\ADR_O[26] (\ADR_O[26] ), .\s_alu[0] (s_alu[0]), 
            .\Di[26] (Di[26]), .\s_alu[1] (s_alu[1]), .\A[26] (A[26])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U44  a_25 (.\ADR_O[25] (\ADR_O[25] ), .\s_alu[0] (s_alu[0]), 
            .\Di[25] (Di[25]), .\s_alu[1] (s_alu[1]), .\A[25] (A[25])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U45  a_24 (.\ADR_O[24] (\ADR_O[24] ), .\s_alu[0] (s_alu[0]), 
            .\Di[24] (Di[24]), .\s_alu[1] (s_alu[1]), .\A[24] (A[24])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U46  a_23 (.\ADR_O[23] (\ADR_O[23] ), .\s_alu[0] (s_alu[0]), 
            .\Di[23] (Di[23]), .\s_alu[1] (s_alu[1]), .\A[23] (A[23])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U47  a_22 (.\ADR_O[22] (\ADR_O[22] ), .\s_alu[0] (s_alu[0]), 
            .\Di[22] (Di[22]), .\s_alu[1] (s_alu[1]), .\A[22] (A[22])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U48  a_21 (.\ADR_O[21] (\ADR_O[21] ), .\s_alu[0] (s_alu[0]), 
            .\Di[21] (Di[21]), .\s_alu[1] (s_alu[1]), .\A[21] (A[21])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U49  a_20 (.\ADR_O[20] (\ADR_O[20] ), .\s_alu[0] (s_alu[0]), 
            .\Di[20] (Di[20]), .\s_alu[1] (s_alu[1]), .\A[20] (A[20])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U50  a_1 (.\ADR_O[1] (\ADR_O[1] ), .\s_alu[0] (s_alu[0]), 
            .\Di[1] (Di[1]), .\s_alu[1] (s_alu[1]), .\A[1] (A[1])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U51  a_19 (.\ADR_O[19] (\ADR_O[19] ), .\s_alu[0] (s_alu[0]), 
            .\Di[19] (Di[19]), .\s_alu[1] (s_alu[1]), .\A[19] (A[19])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U52  a_18 (.\ADR_O[18] (\ADR_O[18] ), .\s_alu[0] (s_alu[0]), 
            .\Di[18] (Di[18]), .\s_alu[1] (s_alu[1]), .\A[18] (A[18])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U53  a_17 (.\ADR_O[17] (\ADR_O[17] ), .\s_alu[0] (s_alu[0]), 
            .\Di[17] (Di[17]), .\s_alu[1] (s_alu[1]), .\A[17] (A[17])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U54  a_16 (.\ADR_O[16] (\ADR_O[16] ), .\s_alu[0] (s_alu[0]), 
            .\Di[16] (Di[16]), .\s_alu[1] (s_alu[1]), .\A[16] (A[16])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U55  a_15 (.\ADR_O[15] (\ADR_O[15] ), .\s_alu[0] (s_alu[0]), 
            .\Di[15] (Di[15]), .\s_alu[1] (s_alu[1]), .\A[15] (A[15])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U56  a_14 (.\ADR_O[14] (\ADR_O[14] ), .\s_alu[0] (s_alu[0]), 
            .\Di[14] (Di[14]), .\s_alu[1] (s_alu[1]), .\A[14] (A[14])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U57  a_13 (.\ADR_O[13] (\ADR_O[13] ), .\s_alu[0] (s_alu[0]), 
            .\Di[13] (Di[13]), .\s_alu[1] (s_alu[1]), .\A[13] (A[13])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U58  a_12 (.\ADR_O[12] (\ADR_O[12] ), .\s_alu[0] (s_alu[0]), 
            .\Di[12] (Di[12]), .\s_alu[1] (s_alu[1]), .\A[12] (A[12])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U59  a_11 (.\ADR_O[11] (\ADR_O[11] ), .\s_alu[0] (s_alu[0]), 
            .\Di[11] (Di[11]), .\s_alu[1] (s_alu[1]), .\A[11] (A[11])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U60  a_10 (.\ADR_O[10] (\ADR_O[10] ), .\s_alu[0] (s_alu[0]), 
            .\Di[10] (Di[10]), .\s_alu[1] (s_alu[1]), .\A[10] (A[10])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    \bn_l4(I=16'b010010110100)_U61  a_0 (.\ADR_O[0] (\ADR_O[0] ), .\s_alu[0] (s_alu[0]), 
            .\Di[0] (Di[0]), .\s_alu[1] (s_alu[1]), .\A[0] (A[0])) /* synthesis syn_module_defined=1 */ ;   // ../../../../code/m_alu.v(254[26:101])
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001) 
//

module \bn_lcy4(I=16'b1100001101101001)  (\A[9] , \ADR_O[9] , \alucy[9] , 
            \alucy[10] , \s_alu[2] , \B[9] ) /* synthesis syn_module_defined=1 */ ;
    input \A[9] ;
    input \ADR_O[9] ;
    input \alucy[9] ;
    output \alucy[10] ;
    input \s_alu[2] ;
    output \B[9] ;
    
    
    SB_CARRY y (.CI(\alucy[9] ), .I0(\A[9] ), .I1(\ADR_O[9] ), .CO(\alucy[10] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[9] ), .I2(\ADR_O[9] ), .I3(\alucy[9] ), 
            .O(\B[9] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U0 
//

module \bn_lcy4(I=16'b1100001101101001)_U0  (\A[8] , \ADR_O[8] , \alucy[8] , 
            \alucy[9] , \s_alu[2] , \B[8] ) /* synthesis syn_module_defined=1 */ ;
    input \A[8] ;
    input \ADR_O[8] ;
    input \alucy[8] ;
    output \alucy[9] ;
    input \s_alu[2] ;
    output \B[8] ;
    
    
    SB_CARRY y (.CI(\alucy[8] ), .I0(\A[8] ), .I1(\ADR_O[8] ), .CO(\alucy[9] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[8] ), .I2(\ADR_O[8] ), .I3(\alucy[8] ), 
            .O(\B[8] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U1 
//

module \bn_lcy4(I=16'b1100001101101001)_U1  (\A[7] , \ADR_O[7] , \alucy[7] , 
            \alucy[8] , \s_alu[2] , \B[7] ) /* synthesis syn_module_defined=1 */ ;
    input \A[7] ;
    input \ADR_O[7] ;
    input \alucy[7] ;
    output \alucy[8] ;
    input \s_alu[2] ;
    output \B[7] ;
    
    
    SB_CARRY y (.CI(\alucy[7] ), .I0(\A[7] ), .I1(\ADR_O[7] ), .CO(\alucy[8] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[7] ), .I2(\ADR_O[7] ), .I3(\alucy[7] ), 
            .O(\B[7] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U2 
//

module \bn_lcy4(I=16'b1100001101101001)_U2  (\A[6] , \QQ[6] , \alucy[6] , 
            \alucy[7] , \s_alu[2] , \B[6] ) /* synthesis syn_module_defined=1 */ ;
    input \A[6] ;
    input \QQ[6] ;
    input \alucy[6] ;
    output \alucy[7] ;
    input \s_alu[2] ;
    output \B[6] ;
    
    
    SB_CARRY y (.CI(\alucy[6] ), .I0(\A[6] ), .I1(\QQ[6] ), .CO(\alucy[7] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[6] ), .I2(\QQ[6] ), .I3(\alucy[6] ), 
            .O(\B[6] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U3 
//

module \bn_lcy4(I=16'b1100001101101001)_U3  (\A[5] , \QQ[5] , \alucy[5] , 
            \alucy[6] , \s_alu[2] , \B[5] ) /* synthesis syn_module_defined=1 */ ;
    input \A[5] ;
    input \QQ[5] ;
    input \alucy[5] ;
    output \alucy[6] ;
    input \s_alu[2] ;
    output \B[5] ;
    
    
    SB_CARRY y (.CI(\alucy[5] ), .I0(\A[5] ), .I1(\QQ[5] ), .CO(\alucy[6] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[5] ), .I2(\QQ[5] ), .I3(\alucy[5] ), 
            .O(\B[5] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U4 
//

module \bn_lcy4(I=16'b1100001101101001)_U4  (\A[4] , \QQ[4] , \alucy[4] , 
            \alucy[5] , \s_alu[2] , \B[4] ) /* synthesis syn_module_defined=1 */ ;
    input \A[4] ;
    input \QQ[4] ;
    input \alucy[4] ;
    output \alucy[5] ;
    input \s_alu[2] ;
    output \B[4] ;
    
    
    SB_CARRY y (.CI(\alucy[4] ), .I0(\A[4] ), .I1(\QQ[4] ), .CO(\alucy[5] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[4] ), .I2(\QQ[4] ), .I3(\alucy[4] ), 
            .O(\B[4] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U5 
//

module \bn_lcy4(I=16'b1100001101101001)_U5  (\A[3] , \QQ[3] , \alucy[3] , 
            \alucy[4] , \s_alu[2] , \B[3] ) /* synthesis syn_module_defined=1 */ ;
    input \A[3] ;
    input \QQ[3] ;
    input \alucy[3] ;
    output \alucy[4] ;
    input \s_alu[2] ;
    output \B[3] ;
    
    
    SB_CARRY y (.CI(\alucy[3] ), .I0(\A[3] ), .I1(\QQ[3] ), .CO(\alucy[4] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[3] ), .I2(\QQ[3] ), .I3(\alucy[3] ), 
            .O(\B[3] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U6 
//

module \bn_lcy4(I=16'b1100001101101001)_U6  (A31, \ADR_O[31] , \alucy[31] , 
            alu_carryout, \s_alu[2] , \B[31] ) /* synthesis syn_module_defined=1 */ ;
    input A31;
    input \ADR_O[31] ;
    input \alucy[31] ;
    output alu_carryout;
    input \s_alu[2] ;
    output \B[31] ;
    
    
    SB_CARRY y (.CI(\alucy[31] ), .I0(A31), .I1(\ADR_O[31] ), .CO(alu_carryout)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(A31), .I2(\ADR_O[31] ), .I3(\alucy[31] ), 
            .O(\B[31] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U7 
//

module \bn_lcy4(I=16'b1100001101101001)_U7  (\A[30] , \ADR_O[30] , \alucy[30] , 
            \alucy[31] , \s_alu[2] , \B[30] ) /* synthesis syn_module_defined=1 */ ;
    input \A[30] ;
    input \ADR_O[30] ;
    input \alucy[30] ;
    output \alucy[31] ;
    input \s_alu[2] ;
    output \B[30] ;
    
    
    SB_CARRY y (.CI(\alucy[30] ), .I0(\A[30] ), .I1(\ADR_O[30] ), .CO(\alucy[31] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[30] ), .I2(\ADR_O[30] ), .I3(\alucy[30] ), 
            .O(\B[30] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U8 
//

module \bn_lcy4(I=16'b1100001101101001)_U8  (\A[2] , \QQ[2] , \alucy[2] , 
            \alucy[3] , \s_alu[2] , \B[2] ) /* synthesis syn_module_defined=1 */ ;
    input \A[2] ;
    input \QQ[2] ;
    input \alucy[2] ;
    output \alucy[3] ;
    input \s_alu[2] ;
    output \B[2] ;
    
    
    SB_CARRY y (.CI(\alucy[2] ), .I0(\A[2] ), .I1(\QQ[2] ), .CO(\alucy[3] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[2] ), .I2(\QQ[2] ), .I3(\alucy[2] ), 
            .O(\B[2] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U9 
//

module \bn_lcy4(I=16'b1100001101101001)_U9  (\A[29] , \ADR_O[29] , \alucy[29] , 
            \alucy[30] , \s_alu[2] , \B[29] ) /* synthesis syn_module_defined=1 */ ;
    input \A[29] ;
    input \ADR_O[29] ;
    input \alucy[29] ;
    output \alucy[30] ;
    input \s_alu[2] ;
    output \B[29] ;
    
    
    SB_CARRY y (.CI(\alucy[29] ), .I0(\A[29] ), .I1(\ADR_O[29] ), .CO(\alucy[30] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[29] ), .I2(\ADR_O[29] ), .I3(\alucy[29] ), 
            .O(\B[29] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U10 
//

module \bn_lcy4(I=16'b1100001101101001)_U10  (\A[28] , \ADR_O[28] , \alucy[28] , 
            \alucy[29] , \s_alu[2] , \B[28] ) /* synthesis syn_module_defined=1 */ ;
    input \A[28] ;
    input \ADR_O[28] ;
    input \alucy[28] ;
    output \alucy[29] ;
    input \s_alu[2] ;
    output \B[28] ;
    
    
    SB_CARRY y (.CI(\alucy[28] ), .I0(\A[28] ), .I1(\ADR_O[28] ), .CO(\alucy[29] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[28] ), .I2(\ADR_O[28] ), .I3(\alucy[28] ), 
            .O(\B[28] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U11 
//

module \bn_lcy4(I=16'b1100001101101001)_U11  (\A[27] , \ADR_O[27] , \alucy[27] , 
            \alucy[28] , \s_alu[2] , \B[27] ) /* synthesis syn_module_defined=1 */ ;
    input \A[27] ;
    input \ADR_O[27] ;
    input \alucy[27] ;
    output \alucy[28] ;
    input \s_alu[2] ;
    output \B[27] ;
    
    
    SB_CARRY y (.CI(\alucy[27] ), .I0(\A[27] ), .I1(\ADR_O[27] ), .CO(\alucy[28] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[27] ), .I2(\ADR_O[27] ), .I3(\alucy[27] ), 
            .O(\B[27] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U12 
//

module \bn_lcy4(I=16'b1100001101101001)_U12  (\A[26] , \ADR_O[26] , \alucy[26] , 
            \alucy[27] , \s_alu[2] , \B[26] ) /* synthesis syn_module_defined=1 */ ;
    input \A[26] ;
    input \ADR_O[26] ;
    input \alucy[26] ;
    output \alucy[27] ;
    input \s_alu[2] ;
    output \B[26] ;
    
    
    SB_CARRY y (.CI(\alucy[26] ), .I0(\A[26] ), .I1(\ADR_O[26] ), .CO(\alucy[27] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[26] ), .I2(\ADR_O[26] ), .I3(\alucy[26] ), 
            .O(\B[26] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U13 
//

module \bn_lcy4(I=16'b1100001101101001)_U13  (\A[25] , \ADR_O[25] , \alucy[25] , 
            \alucy[26] , \s_alu[2] , \B[25] ) /* synthesis syn_module_defined=1 */ ;
    input \A[25] ;
    input \ADR_O[25] ;
    input \alucy[25] ;
    output \alucy[26] ;
    input \s_alu[2] ;
    output \B[25] ;
    
    
    SB_CARRY y (.CI(\alucy[25] ), .I0(\A[25] ), .I1(\ADR_O[25] ), .CO(\alucy[26] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[25] ), .I2(\ADR_O[25] ), .I3(\alucy[25] ), 
            .O(\B[25] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U14 
//

module \bn_lcy4(I=16'b1100001101101001)_U14  (\A[24] , \ADR_O[24] , \alucy[24] , 
            \alucy[25] , \s_alu[2] , \B[24] ) /* synthesis syn_module_defined=1 */ ;
    input \A[24] ;
    input \ADR_O[24] ;
    input \alucy[24] ;
    output \alucy[25] ;
    input \s_alu[2] ;
    output \B[24] ;
    
    
    SB_CARRY y (.CI(\alucy[24] ), .I0(\A[24] ), .I1(\ADR_O[24] ), .CO(\alucy[25] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[24] ), .I2(\ADR_O[24] ), .I3(\alucy[24] ), 
            .O(\B[24] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U15 
//

module \bn_lcy4(I=16'b1100001101101001)_U15  (\A[23] , \ADR_O[23] , \alucy[23] , 
            \alucy[24] , \s_alu[2] , \B[23] ) /* synthesis syn_module_defined=1 */ ;
    input \A[23] ;
    input \ADR_O[23] ;
    input \alucy[23] ;
    output \alucy[24] ;
    input \s_alu[2] ;
    output \B[23] ;
    
    
    SB_CARRY y (.CI(\alucy[23] ), .I0(\A[23] ), .I1(\ADR_O[23] ), .CO(\alucy[24] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[23] ), .I2(\ADR_O[23] ), .I3(\alucy[23] ), 
            .O(\B[23] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U16 
//

module \bn_lcy4(I=16'b1100001101101001)_U16  (\A[22] , \ADR_O[22] , \alucy[22] , 
            \alucy[23] , \s_alu[2] , \B[22] ) /* synthesis syn_module_defined=1 */ ;
    input \A[22] ;
    input \ADR_O[22] ;
    input \alucy[22] ;
    output \alucy[23] ;
    input \s_alu[2] ;
    output \B[22] ;
    
    
    SB_CARRY y (.CI(\alucy[22] ), .I0(\A[22] ), .I1(\ADR_O[22] ), .CO(\alucy[23] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[22] ), .I2(\ADR_O[22] ), .I3(\alucy[22] ), 
            .O(\B[22] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U17 
//

module \bn_lcy4(I=16'b1100001101101001)_U17  (\A[21] , \ADR_O[21] , \alucy[21] , 
            \alucy[22] , \s_alu[2] , \B[21] ) /* synthesis syn_module_defined=1 */ ;
    input \A[21] ;
    input \ADR_O[21] ;
    input \alucy[21] ;
    output \alucy[22] ;
    input \s_alu[2] ;
    output \B[21] ;
    
    
    SB_CARRY y (.CI(\alucy[21] ), .I0(\A[21] ), .I1(\ADR_O[21] ), .CO(\alucy[22] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[21] ), .I2(\ADR_O[21] ), .I3(\alucy[21] ), 
            .O(\B[21] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U18 
//

module \bn_lcy4(I=16'b1100001101101001)_U18  (\A[20] , \ADR_O[20] , \alucy[20] , 
            \alucy[21] , \s_alu[2] , \B[20] ) /* synthesis syn_module_defined=1 */ ;
    input \A[20] ;
    input \ADR_O[20] ;
    input \alucy[20] ;
    output \alucy[21] ;
    input \s_alu[2] ;
    output \B[20] ;
    
    
    SB_CARRY y (.CI(\alucy[20] ), .I0(\A[20] ), .I1(\ADR_O[20] ), .CO(\alucy[21] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[20] ), .I2(\ADR_O[20] ), .I3(\alucy[20] ), 
            .O(\B[20] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U19 
//

module \bn_lcy4(I=16'b1100001101101001)_U19  (\A[1] , \QQ[1] , \alucy[1] , 
            \alucy[2] , \s_alu[2] , \B[1] ) /* synthesis syn_module_defined=1 */ ;
    input \A[1] ;
    input \QQ[1] ;
    input \alucy[1] ;
    output \alucy[2] ;
    input \s_alu[2] ;
    output \B[1] ;
    
    
    SB_CARRY y (.CI(\alucy[1] ), .I0(\A[1] ), .I1(\QQ[1] ), .CO(\alucy[2] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[1] ), .I2(\QQ[1] ), .I3(\alucy[1] ), 
            .O(\B[1] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U20 
//

module \bn_lcy4(I=16'b1100001101101001)_U20  (\A[19] , \ADR_O[19] , \alucy[19] , 
            \alucy[20] , \s_alu[2] , \B[19] ) /* synthesis syn_module_defined=1 */ ;
    input \A[19] ;
    input \ADR_O[19] ;
    input \alucy[19] ;
    output \alucy[20] ;
    input \s_alu[2] ;
    output \B[19] ;
    
    
    SB_CARRY y (.CI(\alucy[19] ), .I0(\A[19] ), .I1(\ADR_O[19] ), .CO(\alucy[20] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[19] ), .I2(\ADR_O[19] ), .I3(\alucy[19] ), 
            .O(\B[19] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U21 
//

module \bn_lcy4(I=16'b1100001101101001)_U21  (\A[18] , \ADR_O[18] , \alucy[18] , 
            \alucy[19] , \s_alu[2] , \B[18] ) /* synthesis syn_module_defined=1 */ ;
    input \A[18] ;
    input \ADR_O[18] ;
    input \alucy[18] ;
    output \alucy[19] ;
    input \s_alu[2] ;
    output \B[18] ;
    
    
    SB_CARRY y (.CI(\alucy[18] ), .I0(\A[18] ), .I1(\ADR_O[18] ), .CO(\alucy[19] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[18] ), .I2(\ADR_O[18] ), .I3(\alucy[18] ), 
            .O(\B[18] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U22 
//

module \bn_lcy4(I=16'b1100001101101001)_U22  (\A[17] , \ADR_O[17] , \alucy[17] , 
            \alucy[18] , \s_alu[2] , \B[17] ) /* synthesis syn_module_defined=1 */ ;
    input \A[17] ;
    input \ADR_O[17] ;
    input \alucy[17] ;
    output \alucy[18] ;
    input \s_alu[2] ;
    output \B[17] ;
    
    
    SB_CARRY y (.CI(\alucy[17] ), .I0(\A[17] ), .I1(\ADR_O[17] ), .CO(\alucy[18] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[17] ), .I2(\ADR_O[17] ), .I3(\alucy[17] ), 
            .O(\B[17] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U23 
//

module \bn_lcy4(I=16'b1100001101101001)_U23  (\A[16] , \ADR_O[16] , \alucy[16] , 
            \alucy[17] , \s_alu[2] , \B[16] ) /* synthesis syn_module_defined=1 */ ;
    input \A[16] ;
    input \ADR_O[16] ;
    input \alucy[16] ;
    output \alucy[17] ;
    input \s_alu[2] ;
    output \B[16] ;
    
    
    SB_CARRY y (.CI(\alucy[16] ), .I0(\A[16] ), .I1(\ADR_O[16] ), .CO(\alucy[17] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[16] ), .I2(\ADR_O[16] ), .I3(\alucy[16] ), 
            .O(\B[16] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U24 
//

module \bn_lcy4(I=16'b1100001101101001)_U24  (\A[15] , \ADR_O[15] , \alucy[15] , 
            \alucy[16] , \s_alu[2] , \B[15] ) /* synthesis syn_module_defined=1 */ ;
    input \A[15] ;
    input \ADR_O[15] ;
    input \alucy[15] ;
    output \alucy[16] ;
    input \s_alu[2] ;
    output \B[15] ;
    
    
    SB_CARRY y (.CI(\alucy[15] ), .I0(\A[15] ), .I1(\ADR_O[15] ), .CO(\alucy[16] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[15] ), .I2(\ADR_O[15] ), .I3(\alucy[15] ), 
            .O(\B[15] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U25 
//

module \bn_lcy4(I=16'b1100001101101001)_U25  (\A[14] , \ADR_O[14] , \alucy[14] , 
            \alucy[15] , \s_alu[2] , \B[14] ) /* synthesis syn_module_defined=1 */ ;
    input \A[14] ;
    input \ADR_O[14] ;
    input \alucy[14] ;
    output \alucy[15] ;
    input \s_alu[2] ;
    output \B[14] ;
    
    
    SB_CARRY y (.CI(\alucy[14] ), .I0(\A[14] ), .I1(\ADR_O[14] ), .CO(\alucy[15] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[14] ), .I2(\ADR_O[14] ), .I3(\alucy[14] ), 
            .O(\B[14] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U26 
//

module \bn_lcy4(I=16'b1100001101101001)_U26  (\A[13] , \ADR_O[13] , \alucy[13] , 
            \alucy[14] , \s_alu[2] , \B[13] ) /* synthesis syn_module_defined=1 */ ;
    input \A[13] ;
    input \ADR_O[13] ;
    input \alucy[13] ;
    output \alucy[14] ;
    input \s_alu[2] ;
    output \B[13] ;
    
    
    SB_CARRY y (.CI(\alucy[13] ), .I0(\A[13] ), .I1(\ADR_O[13] ), .CO(\alucy[14] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[13] ), .I2(\ADR_O[13] ), .I3(\alucy[13] ), 
            .O(\B[13] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U27 
//

module \bn_lcy4(I=16'b1100001101101001)_U27  (\A[12] , \ADR_O[12] , \alucy[12] , 
            \alucy[13] , \s_alu[2] , \B[12] ) /* synthesis syn_module_defined=1 */ ;
    input \A[12] ;
    input \ADR_O[12] ;
    input \alucy[12] ;
    output \alucy[13] ;
    input \s_alu[2] ;
    output \B[12] ;
    
    
    SB_CARRY y (.CI(\alucy[12] ), .I0(\A[12] ), .I1(\ADR_O[12] ), .CO(\alucy[13] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[12] ), .I2(\ADR_O[12] ), .I3(\alucy[12] ), 
            .O(\B[12] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U28 
//

module \bn_lcy4(I=16'b1100001101101001)_U28  (\A[11] , \ADR_O[11] , \alucy[11] , 
            \alucy[12] , \s_alu[2] , \B[11] ) /* synthesis syn_module_defined=1 */ ;
    input \A[11] ;
    input \ADR_O[11] ;
    input \alucy[11] ;
    output \alucy[12] ;
    input \s_alu[2] ;
    output \B[11] ;
    
    
    SB_CARRY y (.CI(\alucy[11] ), .I0(\A[11] ), .I1(\ADR_O[11] ), .CO(\alucy[12] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[11] ), .I2(\ADR_O[11] ), .I3(\alucy[11] ), 
            .O(\B[11] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U29 
//

module \bn_lcy4(I=16'b1100001101101001)_U29  (\A[10] , \ADR_O[10] , \alucy[10] , 
            \alucy[11] , \s_alu[2] , \B[10] ) /* synthesis syn_module_defined=1 */ ;
    input \A[10] ;
    input \ADR_O[10] ;
    input \alucy[10] ;
    output \alucy[11] ;
    input \s_alu[2] ;
    output \B[10] ;
    
    
    SB_CARRY y (.CI(\alucy[10] ), .I0(\A[10] ), .I1(\ADR_O[10] ), .CO(\alucy[11] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[10] ), .I2(\ADR_O[10] ), .I3(\alucy[10] ), 
            .O(\B[10] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_lcy4(I=16'b1100001101101001)_U30 
//

module \bn_lcy4(I=16'b1100001101101001)_U30  (\A[0] , \QQ[0] , alu_carryin, 
            \alucy[1] , \s_alu[2] , \B[0] ) /* synthesis syn_module_defined=1 */ ;
    input \A[0] ;
    input \QQ[0] ;
    input alu_carryin;
    output \alucy[1] ;
    input \s_alu[2] ;
    output \B[0] ;
    
    
    SB_CARRY y (.CI(alu_carryin), .I0(\A[0] ), .I1(\QQ[0] ), .CO(\alucy[1] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(25[13:63])
    SB_LUT4 l (.I0(\s_alu[2] ), .I1(\A[0] ), .I2(\QQ[0] ), .I3(alu_carryin), 
            .O(\B[0] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=28, LSE_RCOL=133, LSE_LLINE=255, LSE_RLINE=255 */ ;   // ../../../../code/m_ice_shortcuts.v(24[28:72])
    defparam l.LUT_INIT = 16'b1100001101101001;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100) 
//

module \bn_l4(I=16'b010010110100)  (\ADR_O[9] , \s_alu[0] , \Di[9] , \s_alu[1] , 
            \A[9] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[9] ;
    input \s_alu[0] ;
    input \Di[9] ;
    input \s_alu[1] ;
    output \A[9] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[9] ), .I1(\s_alu[0] ), .I2(\Di[9] ), .I3(\s_alu[1] ), 
            .O(\A[9] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U31 
//

module \bn_l4(I=16'b010010110100)_U31  (\ADR_O[8] , \s_alu[0] , \Di[8] , 
            \s_alu[1] , \A[8] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[8] ;
    input \s_alu[0] ;
    input \Di[8] ;
    input \s_alu[1] ;
    output \A[8] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[8] ), .I1(\s_alu[0] ), .I2(\Di[8] ), .I3(\s_alu[1] ), 
            .O(\A[8] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U32 
//

module \bn_l4(I=16'b010010110100)_U32  (\ADR_O[7] , \s_alu[0] , \Di[7] , 
            \s_alu[1] , \A[7] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[7] ;
    input \s_alu[0] ;
    input \Di[7] ;
    input \s_alu[1] ;
    output \A[7] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[7] ), .I1(\s_alu[0] ), .I2(\Di[7] ), .I3(\s_alu[1] ), 
            .O(\A[7] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U33 
//

module \bn_l4(I=16'b010010110100)_U33  (\ADR_O[6] , \s_alu[0] , \Di[6] , 
            \s_alu[1] , \A[6] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[6] ;
    input \s_alu[0] ;
    input \Di[6] ;
    input \s_alu[1] ;
    output \A[6] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[6] ), .I1(\s_alu[0] ), .I2(\Di[6] ), .I3(\s_alu[1] ), 
            .O(\A[6] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U34 
//

module \bn_l4(I=16'b010010110100)_U34  (\ADR_O[5] , \s_alu[0] , \Di[5] , 
            \s_alu[1] , \A[5] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[5] ;
    input \s_alu[0] ;
    input \Di[5] ;
    input \s_alu[1] ;
    output \A[5] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[5] ), .I1(\s_alu[0] ), .I2(\Di[5] ), .I3(\s_alu[1] ), 
            .O(\A[5] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U35 
//

module \bn_l4(I=16'b010010110100)_U35  (\ADR_O[4] , \s_alu[0] , \Di[4] , 
            \s_alu[1] , \A[4] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[4] ;
    input \s_alu[0] ;
    input \Di[4] ;
    input \s_alu[1] ;
    output \A[4] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[4] ), .I1(\s_alu[0] ), .I2(\Di[4] ), .I3(\s_alu[1] ), 
            .O(\A[4] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U36 
//

module \bn_l4(I=16'b010010110100)_U36  (\ADR_O[3] , \s_alu[0] , \Di[3] , 
            \s_alu[1] , \A[3] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[3] ;
    input \s_alu[0] ;
    input \Di[3] ;
    input \s_alu[1] ;
    output \A[3] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[3] ), .I1(\s_alu[0] ), .I2(\Di[3] ), .I3(\s_alu[1] ), 
            .O(\A[3] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U37 
//

module \bn_l4(I=16'b010010110100)_U37  (\ADR_O[31] , \s_alu[0] , \Di[31] , 
            \s_alu[1] , A31) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[31] ;
    input \s_alu[0] ;
    input \Di[31] ;
    input \s_alu[1] ;
    output A31;
    
    
    SB_LUT4 l (.I0(\ADR_O[31] ), .I1(\s_alu[0] ), .I2(\Di[31] ), .I3(\s_alu[1] ), 
            .O(A31)) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U38 
//

module \bn_l4(I=16'b010010110100)_U38  (\ADR_O[30] , \s_alu[0] , \Di[30] , 
            \s_alu[1] , \A[30] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[30] ;
    input \s_alu[0] ;
    input \Di[30] ;
    input \s_alu[1] ;
    output \A[30] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[30] ), .I1(\s_alu[0] ), .I2(\Di[30] ), .I3(\s_alu[1] ), 
            .O(\A[30] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U39 
//

module \bn_l4(I=16'b010010110100)_U39  (\ADR_O[2] , \s_alu[0] , \Di[2] , 
            \s_alu[1] , \A[2] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[2] ;
    input \s_alu[0] ;
    input \Di[2] ;
    input \s_alu[1] ;
    output \A[2] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[2] ), .I1(\s_alu[0] ), .I2(\Di[2] ), .I3(\s_alu[1] ), 
            .O(\A[2] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U40 
//

module \bn_l4(I=16'b010010110100)_U40  (\ADR_O[29] , \s_alu[0] , \Di[29] , 
            \s_alu[1] , \A[29] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[29] ;
    input \s_alu[0] ;
    input \Di[29] ;
    input \s_alu[1] ;
    output \A[29] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[29] ), .I1(\s_alu[0] ), .I2(\Di[29] ), .I3(\s_alu[1] ), 
            .O(\A[29] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U41 
//

module \bn_l4(I=16'b010010110100)_U41  (\ADR_O[28] , \s_alu[0] , \Di[28] , 
            \s_alu[1] , \A[28] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[28] ;
    input \s_alu[0] ;
    input \Di[28] ;
    input \s_alu[1] ;
    output \A[28] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[28] ), .I1(\s_alu[0] ), .I2(\Di[28] ), .I3(\s_alu[1] ), 
            .O(\A[28] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U42 
//

module \bn_l4(I=16'b010010110100)_U42  (\ADR_O[27] , \s_alu[0] , \Di[27] , 
            \s_alu[1] , \A[27] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[27] ;
    input \s_alu[0] ;
    input \Di[27] ;
    input \s_alu[1] ;
    output \A[27] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[27] ), .I1(\s_alu[0] ), .I2(\Di[27] ), .I3(\s_alu[1] ), 
            .O(\A[27] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U43 
//

module \bn_l4(I=16'b010010110100)_U43  (\ADR_O[26] , \s_alu[0] , \Di[26] , 
            \s_alu[1] , \A[26] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[26] ;
    input \s_alu[0] ;
    input \Di[26] ;
    input \s_alu[1] ;
    output \A[26] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[26] ), .I1(\s_alu[0] ), .I2(\Di[26] ), .I3(\s_alu[1] ), 
            .O(\A[26] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U44 
//

module \bn_l4(I=16'b010010110100)_U44  (\ADR_O[25] , \s_alu[0] , \Di[25] , 
            \s_alu[1] , \A[25] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[25] ;
    input \s_alu[0] ;
    input \Di[25] ;
    input \s_alu[1] ;
    output \A[25] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[25] ), .I1(\s_alu[0] ), .I2(\Di[25] ), .I3(\s_alu[1] ), 
            .O(\A[25] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U45 
//

module \bn_l4(I=16'b010010110100)_U45  (\ADR_O[24] , \s_alu[0] , \Di[24] , 
            \s_alu[1] , \A[24] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[24] ;
    input \s_alu[0] ;
    input \Di[24] ;
    input \s_alu[1] ;
    output \A[24] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[24] ), .I1(\s_alu[0] ), .I2(\Di[24] ), .I3(\s_alu[1] ), 
            .O(\A[24] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U46 
//

module \bn_l4(I=16'b010010110100)_U46  (\ADR_O[23] , \s_alu[0] , \Di[23] , 
            \s_alu[1] , \A[23] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[23] ;
    input \s_alu[0] ;
    input \Di[23] ;
    input \s_alu[1] ;
    output \A[23] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[23] ), .I1(\s_alu[0] ), .I2(\Di[23] ), .I3(\s_alu[1] ), 
            .O(\A[23] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U47 
//

module \bn_l4(I=16'b010010110100)_U47  (\ADR_O[22] , \s_alu[0] , \Di[22] , 
            \s_alu[1] , \A[22] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[22] ;
    input \s_alu[0] ;
    input \Di[22] ;
    input \s_alu[1] ;
    output \A[22] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[22] ), .I1(\s_alu[0] ), .I2(\Di[22] ), .I3(\s_alu[1] ), 
            .O(\A[22] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U48 
//

module \bn_l4(I=16'b010010110100)_U48  (\ADR_O[21] , \s_alu[0] , \Di[21] , 
            \s_alu[1] , \A[21] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[21] ;
    input \s_alu[0] ;
    input \Di[21] ;
    input \s_alu[1] ;
    output \A[21] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[21] ), .I1(\s_alu[0] ), .I2(\Di[21] ), .I3(\s_alu[1] ), 
            .O(\A[21] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U49 
//

module \bn_l4(I=16'b010010110100)_U49  (\ADR_O[20] , \s_alu[0] , \Di[20] , 
            \s_alu[1] , \A[20] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[20] ;
    input \s_alu[0] ;
    input \Di[20] ;
    input \s_alu[1] ;
    output \A[20] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[20] ), .I1(\s_alu[0] ), .I2(\Di[20] ), .I3(\s_alu[1] ), 
            .O(\A[20] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U50 
//

module \bn_l4(I=16'b010010110100)_U50  (\ADR_O[1] , \s_alu[0] , \Di[1] , 
            \s_alu[1] , \A[1] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[1] ;
    input \s_alu[0] ;
    input \Di[1] ;
    input \s_alu[1] ;
    output \A[1] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[1] ), .I1(\s_alu[0] ), .I2(\Di[1] ), .I3(\s_alu[1] ), 
            .O(\A[1] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U51 
//

module \bn_l4(I=16'b010010110100)_U51  (\ADR_O[19] , \s_alu[0] , \Di[19] , 
            \s_alu[1] , \A[19] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[19] ;
    input \s_alu[0] ;
    input \Di[19] ;
    input \s_alu[1] ;
    output \A[19] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[19] ), .I1(\s_alu[0] ), .I2(\Di[19] ), .I3(\s_alu[1] ), 
            .O(\A[19] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U52 
//

module \bn_l4(I=16'b010010110100)_U52  (\ADR_O[18] , \s_alu[0] , \Di[18] , 
            \s_alu[1] , \A[18] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[18] ;
    input \s_alu[0] ;
    input \Di[18] ;
    input \s_alu[1] ;
    output \A[18] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[18] ), .I1(\s_alu[0] ), .I2(\Di[18] ), .I3(\s_alu[1] ), 
            .O(\A[18] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U53 
//

module \bn_l4(I=16'b010010110100)_U53  (\ADR_O[17] , \s_alu[0] , \Di[17] , 
            \s_alu[1] , \A[17] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[17] ;
    input \s_alu[0] ;
    input \Di[17] ;
    input \s_alu[1] ;
    output \A[17] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[17] ), .I1(\s_alu[0] ), .I2(\Di[17] ), .I3(\s_alu[1] ), 
            .O(\A[17] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U54 
//

module \bn_l4(I=16'b010010110100)_U54  (\ADR_O[16] , \s_alu[0] , \Di[16] , 
            \s_alu[1] , \A[16] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[16] ;
    input \s_alu[0] ;
    input \Di[16] ;
    input \s_alu[1] ;
    output \A[16] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[16] ), .I1(\s_alu[0] ), .I2(\Di[16] ), .I3(\s_alu[1] ), 
            .O(\A[16] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U55 
//

module \bn_l4(I=16'b010010110100)_U55  (\ADR_O[15] , \s_alu[0] , \Di[15] , 
            \s_alu[1] , \A[15] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[15] ;
    input \s_alu[0] ;
    input \Di[15] ;
    input \s_alu[1] ;
    output \A[15] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[15] ), .I1(\s_alu[0] ), .I2(\Di[15] ), .I3(\s_alu[1] ), 
            .O(\A[15] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U56 
//

module \bn_l4(I=16'b010010110100)_U56  (\ADR_O[14] , \s_alu[0] , \Di[14] , 
            \s_alu[1] , \A[14] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[14] ;
    input \s_alu[0] ;
    input \Di[14] ;
    input \s_alu[1] ;
    output \A[14] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[14] ), .I1(\s_alu[0] ), .I2(\Di[14] ), .I3(\s_alu[1] ), 
            .O(\A[14] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U57 
//

module \bn_l4(I=16'b010010110100)_U57  (\ADR_O[13] , \s_alu[0] , \Di[13] , 
            \s_alu[1] , \A[13] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[13] ;
    input \s_alu[0] ;
    input \Di[13] ;
    input \s_alu[1] ;
    output \A[13] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[13] ), .I1(\s_alu[0] ), .I2(\Di[13] ), .I3(\s_alu[1] ), 
            .O(\A[13] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U58 
//

module \bn_l4(I=16'b010010110100)_U58  (\ADR_O[12] , \s_alu[0] , \Di[12] , 
            \s_alu[1] , \A[12] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[12] ;
    input \s_alu[0] ;
    input \Di[12] ;
    input \s_alu[1] ;
    output \A[12] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[12] ), .I1(\s_alu[0] ), .I2(\Di[12] ), .I3(\s_alu[1] ), 
            .O(\A[12] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U59 
//

module \bn_l4(I=16'b010010110100)_U59  (\ADR_O[11] , \s_alu[0] , \Di[11] , 
            \s_alu[1] , \A[11] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[11] ;
    input \s_alu[0] ;
    input \Di[11] ;
    input \s_alu[1] ;
    output \A[11] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[11] ), .I1(\s_alu[0] ), .I2(\Di[11] ), .I3(\s_alu[1] ), 
            .O(\A[11] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U60 
//

module \bn_l4(I=16'b010010110100)_U60  (\ADR_O[10] , \s_alu[0] , \Di[10] , 
            \s_alu[1] , \A[10] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[10] ;
    input \s_alu[0] ;
    input \Di[10] ;
    input \s_alu[1] ;
    output \A[10] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[10] ), .I1(\s_alu[0] ), .I2(\Di[10] ), .I3(\s_alu[1] ), 
            .O(\A[10] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module \bn_l4(I=16'b010010110100)_U61 
//

module \bn_l4(I=16'b010010110100)_U61  (\ADR_O[0] , \s_alu[0] , \Di[0] , 
            \s_alu[1] , \A[0] ) /* synthesis syn_module_defined=1 */ ;
    input \ADR_O[0] ;
    input \s_alu[0] ;
    input \Di[0] ;
    input \s_alu[1] ;
    output \A[0] ;
    
    
    SB_LUT4 l (.I0(\ADR_O[0] ), .I1(\s_alu[0] ), .I2(\Di[0] ), .I3(\s_alu[1] ), 
            .O(\A[0] )) /* synthesis syn_instantiated=1, LSE_LINE_FILE_ID=58, LSE_LCOL=26, LSE_RCOL=101, LSE_LLINE=254, LSE_RLINE=254 */ ;   // ../../../../code/m_ice_shortcuts.v(15[28:72])
    defparam l.LUT_INIT = 16'b0000010010110100;
    
endmodule
//
// Verilog Description of module m_BBUART
//

module m_BBUART (\DAT_O[0] , TX_c, CLK_c, STB_O, \ADR_O[3] , WE_O, 
            GND_net, RX_c, DAT_O) /* synthesis syn_module_defined=1 */ ;
    input \DAT_O[0] ;
    output TX_c;
    input CLK_c;
    input STB_O;
    input \ADR_O[3] ;
    input WE_O;
    input GND_net;
    input RX_c;
    output [0:0]DAT_O;
    
    wire CLK_c /* synthesis is_clock=1, SET_AS_NETWORK=CLK_c */ ;   // ../../min_icebreaker.v(57[12:15])
    
    wire usartTX_N_2;
    
    SB_DFFE usartTX_9 (.Q(TX_c), .C(CLK_c), .E(usartTX_N_2), .D(\DAT_O[0] ));   // ../../min_icebreaker.v(222[11] 226[7])
    SB_LUT4 STB_I_I_0_2_lut_3_lut (.I0(STB_O), .I1(\ADR_O[3] ), .I2(WE_O), 
            .I3(GND_net), .O(usartTX_N_2));   // ../../min_icebreaker.v(224[12:24])
    defparam STB_I_I_0_2_lut_3_lut.LUT_INIT = 16'h8080;
    SB_DFF DAT_O_0__8 (.Q(DAT_O[0]), .C(CLK_c), .D(RX_c));   // ../../min_icebreaker.v(222[11] 226[7])
    
endmodule
